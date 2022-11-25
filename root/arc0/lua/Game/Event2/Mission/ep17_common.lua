dofile("/Game/Misc/perceivable_npc.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_onleave_com = false
_cnt_task = nil
_time_cnt_start = false
_time_cnt = 0
_once_cnt_start = false
_cnt = 0
_hacked_npc_name = nil
_NPC_POLICE_SIGHT_VDEG = 30
_NPC_POLICE_SIGHT_HDEG = 45
_NPC_POLICE_SIGHT_LEN = 15
_NPC_BOT_SIGHT_VDEG = 30
_NPC_BOT_SIGHT_HDEG = 45
_NPC_BOT_SIGHT_LEN = 8
_NPC_CAUTION_INC = 4
_NPC_CAUTION_DEC = 0.5
_NPC_INDICATION_INC = 8
_NPC_INDICATION_DEC = 1
_move_option_police_normal = {
  anim_walk_speed = 1,
  runLength = 99999,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = true,
  recast = true
}
_move_option_police_alert = {
  anim_run_speed = 1,
  runLength = -1,
  arrivedLength = 2,
  noTurn = true,
  recast = true
}
_move_option_bot_normal = {
  anim_walk_speed = 0.3,
  arrivedLength = 0.1,
  noTurn = false,
  recast = true
}
_move_option_bot_alert = {
  anim_run_speed = 1,
  runLength = -1,
  arrivedLength = 2,
  anim_speed_over = true,
  noTurn = false,
  recast = true
}
_move_option_bot_hack = {
  anim_walk_speed = 0.5,
  anim_run_speed = 0.5,
  runLength = 99999,
  arrivedLength = 2,
  anim_speed_over = false,
  noTurn = false,
  recast = true
}
function getNodePos(A0_0)
  return findGameObject2("Node", A0_0):getWorldPos()
end
function getNpcPos(A0_1)
  return Fn_findNpcPuppet(A0_1):getWorldPos()
end
function waitGetPos(A0_2, A1_3)
  pos = getNodePos(A0_2)
  while not isWithinRange(pos, A1_3) do
    wait()
  end
end
function isWithinRange(A0_4, A1_5)
  local L2_6
  L2_6 = Fn_getPcPosRot
  L2_6 = L2_6()
  if A1_5 > Fn_get_distance(A0_4, L2_6) then
    return true
  else
    return false
  end
end
function isWithinRangeOfNPC(A0_7, A1_8)
  return isWithinRange(getNpcPos(A0_7), A1_8)
end
function isWithinRangeOfNode(A0_9, A1_10)
  return isWithinRange(getNodePos(A0_9), A1_10)
end
function isWithinRangeOf2NPCs(A0_11, A1_12, A2_13)
  local L3_14, L4_15
  L3_14 = getNpcPos
  L4_15 = A0_11
  L3_14 = L3_14(L4_15)
  L4_15 = getNpcPos
  L4_15 = L4_15(A1_12)
  return A2_13 > Fn_get_distance(L3_14, L4_15)
end
function isNpcMotionEnd(A0_16)
  return Fn_findNpc(A0_16):isMotionEnd()
end
function isNpcMoveEnd(A0_17)
  return Fn_findNpc(A0_17):isMoveEnd()
end
function isNpcTurnEnd(A0_18)
  return Fn_findNpc(A0_18):isTurnEnd()
end
function waitNpcMotionEnd(A0_19)
  while not isNpcMotionEnd(A0_19) do
    wait()
  end
end
function waitNpcMoveEnd(A0_20)
  while not isNpcMoveEnd(A0_20) do
    wait()
  end
end
function waitNpcTurnEnd(A0_21)
  while not isNpcTurnEnd(A0_21) do
    wait()
  end
end
function turnNpc(A0_22, A1_23, A2_24)
  Fn_findNpc(A0_22):turn(A1_23, A2_24)
end
function turnNPCifMoveEnd(A0_25)
  if isNpcMoveEnd(A0_25) then
    Fn_turnNpc(A0_25)
    return true
  else
    return false
  end
end
function setPlayerIdle()
  Fn_userCtrlOff()
  Fn_coercionGravityRevert()
  waitSeconds(1)
  Fn_userCtrlOn()
end
function waitComNextPhase()
  while not Fn_sendEventComSb("getNextPhase") do
    wait()
  end
  Fn_sendEventComSb("resetNextPhase")
end
function perceivableNpcAction(A0_26)
  local L1_27
  L1_27 = false
  A0_26:setDamagedEvent()
  A0_26.npc:setEventListener("npcGrabbed", function()
    A0_26.npc:setEventListener("npcGrabbed", nil)
  end)
  A0_26.npc:setEventListener("npcDead", function()
    A0_26.npc:setEventListener("npcDead", nil)
    A0_26.battleTimerTask = Mv_safeTaskAbort(A0_26.battleTimerTask)
    A0_26.callbackReason = CALLBACK_REASON.DIED
    A0_26.status = NPC_STATUS.DEAD
    print("setEventListener\227\129\174npcDead\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  end)
  A0_26.npc:setEventListener("npcFall", function()
    A0_26.npc:setEventListener("npcFall", nil)
  end)
  return invokeTask(function()
    local L0_28, L1_29, L2_30, L3_31
    L0_28 = {}
    L0_28.isRepeat = false
    L0_28.isRandom = false
    L0_28.isStop = true
    L0_28.animSpeed = 1
    L0_28.animBlendDuration = 0.5
    while true do
      L1_29 = A0_26.dead
      if not L1_29 then
        L1_29 = Fn_findNpcPuppet
        L2_30 = A0_26.npcName
        L1_29 = L1_29(L2_30)
        A0_26.npcPuppet = L1_29
        L1_29 = A0_26.status
        L2_30 = NPC_STATUS
        L2_30 = L2_30.NORMAL
        if L1_29 == L2_30 then
          L1_29 = A0_26.cautionMode
          L2_30 = CAUTION_MODE
          L2_30 = L2_30.TIME
          if L1_29 == L2_30 then
            L1_29 = isInSight
            L2_30 = A0_26.npcName
            L3_31 = A0_26.sightParam
            L1_29 = L1_29(L2_30, L3_31)
            if L1_29 then
              L1_29 = A0_26.currentMovePos
              if L1_29 == -1 then
                L1_29 = A0_26.npc
                L2_30 = L1_29
                L1_29 = L1_29.getMoveCurrentIndex
                L1_29 = L1_29(L2_30)
                A0_26.currentMovePos = L1_29
                L1_29 = A0_26.currentMovePos
                if L1_29 == -1 then
                  L1_29 = A0_26.posList
                  L1_29 = #L1_29
                  A0_26.currentMovePos = L1_29
                end
                L1_29 = getNearPosforPC
                L2_30 = A0_26.npcName
                L1_29 = L1_29(L2_30)
                A0_26.targetPos = L1_29
                L1_29 = {L2_30}
                L2_30 = {}
                L3_31 = A0_26.targetPos
                L2_30.pos = L3_31
                L3_31 = A0_26.moveOption
                L2_30.opt = L3_31
                L2_30 = A0_26.npc
                L3_31 = L2_30
                L2_30 = L2_30.move
                L2_30(L3_31, L1_29)
                L2_30 = A0_26.status
                L3_31 = NPC_STATUS
                L3_31 = L3_31.NORMAL
                if L2_30 == L3_31 then
                  L2_30 = Fn_getDistanceToPlayer
                  L3_31 = A0_26.npcPuppet
                  L2_30 = L2_30(L3_31)
                  L3_31 = A0_26.alertRange
                  if L2_30 < L3_31 then
                    L2_30 = CautionLevel
                    L2_30 = L2_30.MAX_LEVEL
                    A0_26.caution = L2_30
                    L2_30 = CALLBACK_REASON
                    L2_30 = L2_30.CAUTION_OVERFLOW
                    A0_26.callbackReason = L2_30
                    L2_30 = NPC_STATUS
                    L2_30 = L2_30.ALERT
                    A0_26.status = L2_30
                  else
                    A0_26.caution = 10
                    L2_30 = CALLBACK_REASON
                    L2_30 = L2_30.IS_INSIGHT
                    A0_26.callbackReason = L2_30
                    L2_30 = NPC_STATUS
                    L2_30 = L2_30.CAUTION
                    A0_26.status = L2_30
                  end
                end
              else
                else
                  L1_29 = A0_26.report
                  if L1_29 then
                    L1_29 = getNearPos
                    L2_30 = A0_26.reportPos
                    L1_29 = L1_29(L2_30)
                    A0_26.targetPos = L1_29
                    L1_29 = {L2_30}
                    L2_30 = {}
                    L3_31 = A0_26.targetPos
                    L2_30.pos = L3_31
                    L3_31 = A0_26.moveOption
                    L2_30.opt = L3_31
                    L2_30 = A0_26.npc
                    L3_31 = L2_30
                    L2_30 = L2_30.move
                    L2_30(L3_31, L1_29)
                    A0_26.caution = 80
                    L2_30 = CALLBACK_REASON
                    L2_30 = L2_30.RECEIVE_REPORT
                    A0_26.callbackReason = L2_30
                    L2_30 = NPC_STATUS
                    L2_30 = L2_30.CAUTION
                    A0_26.status = L2_30
                  else
                    L1_29 = A0_26.indicationEnable
                    if L1_29 then
                      L1_29 = getCautionValue
                      L2_30 = A0_26.npcName
                      L3_31 = A0_26.indicationRange
                      L1_29 = L1_29(L2_30, L3_31)
                      L2_30 = A0_26.indicationIncCoefficent
                      L1_29 = L1_29 * L2_30
                      if L1_29 > 0 then
                        L2_30 = A0_26
                        L3_31 = L2_30
                        L2_30 = L2_30.setIndicationLevel
                        L2_30(L3_31, A0_26.indication + L1_29)
                        L2_30 = A0_26.indication
                        if L2_30 >= 100 then
                          L2_30 = A0_26.npc
                          L3_31 = L2_30
                          L2_30 = L2_30.isTurnEnd
                          L2_30 = L2_30(L3_31)
                          if L2_30 then
                            L2_30 = getNearPosforPC
                            L3_31 = A0_26.npcName
                            L2_30 = L2_30(L3_31)
                            A0_26.targetPos = L2_30
                            L2_30 = A0_26.npc
                            L3_31 = L2_30
                            L2_30 = L2_30.turn
                            L2_30(L3_31, A0_26.targetPos)
                            L2_30 = A0_26.currentMovePos
                            if L2_30 == -1 then
                              L2_30 = A0_26.npc
                              L3_31 = L2_30
                              L2_30 = L2_30.getMoveCurrentIndex
                              L2_30 = L2_30(L3_31)
                              A0_26.currentMovePos = L2_30
                              L2_30 = A0_26.currentMovePos
                              if L2_30 == -1 then
                                L2_30 = A0_26.posList
                                L2_30 = #L2_30
                                A0_26.currentMovePos = L2_30
                              end
                              L2_30 = A0_26.status
                              L3_31 = NPC_STATUS
                              L3_31 = L3_31.NORMAL
                              if L2_30 == L3_31 then
                                A0_26.caution = 50
                                L2_30 = CALLBACK_REASON
                                L2_30 = L2_30.INDICATION_OVERFLOW
                                A0_26.callbackReason = L2_30
                                L2_30 = NPC_STATUS
                                L2_30 = L2_30.CAUTION
                                A0_26.status = L2_30
                                else
                                  else
                                    L2_30 = A0_26.indicationDecCoefficent
                                    L2_30 = 1 * L2_30
                                    L3_31 = A0_26
                                    L3_31 = L3_31.setIndicationLevel
                                    L3_31(L3_31, A0_26.indication - L2_30)
                                  end
                                  L1_29 = A0_26.status
                                  L2_30 = NPC_STATUS
                                  L2_30 = L2_30.NORMAL
                                  if L1_29 == L2_30 then
                                    L1_29 = A0_26.livelyActionEnable
                                    if L1_29 then
                                      L1_29 = A0_26.livelyActionTable
                                      if L1_29 ~= nil then
                                        L1_29 = Fn_getDistanceToPlayer
                                        L2_30 = A0_26.npcPuppet
                                        L1_29 = L1_29(L2_30)
                                        L2_30 = A0_26.livelyActionRange
                                        if L1_29 < L2_30 then
                                          L1_29 = A0_26.livelyAction
                                          if not L1_29 then
                                            L1_29 = Fn_captionViewEnd
                                            L1_29()
                                            L1_29 = Fn_gestureAction
                                            L2_30 = A0_26.livelyActionTable
                                            L1_29(L2_30)
                                            A0_26.livelyAction = true
                                          end
                                        else
                                          L1_29 = A0_26.livelyAction
                                          if L1_29 then
                                            L1_29 = Fn_gestureActionCancel
                                            L1_29()
                                            A0_26.livelyAction = false
                                          end
                                        end
                                      end
                                    end
                                    else
                                      L1_29 = Fn_getDistanceToPlayer
                                      L2_30 = A0_26.npcPuppet
                                      L1_29 = L1_29(L2_30)
                                      L2_30 = A0_26.cautionRange
                                      if L1_29 <= L2_30 then
                                        L2_30 = A0_26.currentMovePos
                                        if L2_30 == -1 then
                                          L2_30 = A0_26.npc
                                          L3_31 = L2_30
                                          L2_30 = L2_30.getMoveCurrentIndex
                                          L2_30 = L2_30(L3_31)
                                          A0_26.currentMovePos = L2_30
                                          L2_30 = A0_26.currentMovePos
                                          if L2_30 == -1 then
                                            L2_30 = A0_26.posList
                                            L2_30 = #L2_30
                                            A0_26.currentMovePos = L2_30
                                          end
                                          L2_30 = A0_26.status
                                          L3_31 = NPC_STATUS
                                          L3_31 = L3_31.NORMAL
                                          if L2_30 == L3_31 then
                                            L2_30 = Fn_getDistanceToPlayer
                                            L3_31 = A0_26.npcPuppet
                                            L2_30 = L2_30(L3_31)
                                            L3_31 = A0_26.alertRange
                                            if L2_30 < L3_31 then
                                              L2_30 = A0_26.npc
                                              L3_31 = L2_30
                                              L2_30 = L2_30.reset
                                              L2_30(L3_31)
                                              L2_30 = CautionLevel
                                              L2_30 = L2_30.MAX_LEVEL
                                              A0_26.caution = L2_30
                                              L2_30 = CALLBACK_REASON
                                              L2_30 = L2_30.CAUTION_OVERFLOW
                                              A0_26.callbackReason = L2_30
                                              L2_30 = NPC_STATUS
                                              L2_30 = L2_30.ALERT
                                              A0_26.status = L2_30
                                            else
                                              L2_30 = A0_26.npc
                                              L3_31 = L2_30
                                              L2_30 = L2_30.reset
                                              L2_30(L3_31)
                                              A0_26.caution = 10
                                              L2_30 = CALLBACK_REASON
                                              L2_30 = L2_30.IS_INSIGHT
                                              A0_26.callbackReason = L2_30
                                              L2_30 = NPC_STATUS
                                              L2_30 = L2_30.CAUTION
                                              A0_26.status = L2_30
                                            end
                                          end
                                        else
                                          else
                                            A0_26.caution = 0
                                            L2_30 = A0_26.detectGravity
                                            if L2_30 then
                                              L2_30 = Player
                                              L3_31 = L2_30
                                              L2_30 = L2_30.isGravityControlMode
                                              L2_30 = L2_30(L3_31)
                                              if L2_30 then
                                                L2_30 = A0_26.npc
                                                L3_31 = L2_30
                                                L2_30 = L2_30.reset
                                                L2_30(L3_31)
                                                A0_26.caution = 50
                                                L2_30 = CALLBACK_REASON
                                                L2_30 = L2_30.DETECTED_GRAVITY
                                                A0_26.callbackReason = L2_30
                                                L2_30 = NPC_STATUS
                                                L2_30 = L2_30.CAUTION
                                                A0_26.status = L2_30
                                              end
                                          end
                                          else
                                            L1_29 = A0_26.posList
                                            L1_29 = #L1_29
                                            if L1_29 > 0 then
                                              L1_29 = A0_26.changeRouteImmediately
                                              if L1_29 then
                                                L1_29 = A0_26.posListChanged
                                                if L1_29 then
                                                  L1_29 = A0_26.npc
                                                  L2_30 = L1_29
                                                  L1_29 = L1_29.setMoveOption
                                                  L3_31 = A0_26.moveOption
                                                  L1_29(L2_30, L3_31)
                                                  L1_29 = A0_26.npc
                                                  L2_30 = L1_29
                                                  L1_29 = L1_29.move
                                                  L3_31 = A0_26.posList
                                                  L1_29(L2_30, L3_31, {startIndex = 1, goalDirection = true})
                                                  A0_26.currentMovePos = -1
                                                  A0_26.posListChanged = false
                                                end
                                              end
                                              L1_29 = A0_26.npc
                                              L2_30 = L1_29
                                              L1_29 = L1_29.isMoveEnd
                                              L1_29 = L1_29(L2_30)
                                              if L1_29 then
                                                L1_29 = A0_26.npc
                                                L2_30 = L1_29
                                                L1_29 = L1_29.isTurnEnd
                                                L1_29 = L1_29(L2_30)
                                                if L1_29 then
                                                  L1_29 = A0_26.posListChanged
                                                  if L1_29 then
                                                    L1_29 = A0_26.npc
                                                    L2_30 = L1_29
                                                    L1_29 = L1_29.setMoveOption
                                                    L3_31 = A0_26.moveOption
                                                    L1_29(L2_30, L3_31)
                                                    L1_29 = A0_26.npc
                                                    L2_30 = L1_29
                                                    L1_29 = L1_29.move
                                                    L3_31 = A0_26.posList
                                                    L1_29(L2_30, L3_31, {startIndex = 1, goalDirection = true})
                                                    A0_26.currentMovePos = -1
                                                    A0_26.posListChanged = false
                                                  else
                                                    L1_29 = A0_26.currentMovePos
                                                    if L1_29 > 0 then
                                                      L1_29 = A0_26.posListChanged
                                                      if L1_29 then
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.setMoveOption
                                                        L3_31 = A0_26.moveOption
                                                        L1_29(L2_30, L3_31)
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.move
                                                        L3_31 = A0_26.posList
                                                        L1_29(L2_30, L3_31, {startIndex = 1, goalDirection = true})
                                                        A0_26.currentMovePos = -1
                                                        A0_26.posListChanged = false
                                                      else
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.setMoveOption
                                                        L3_31 = A0_26.moveOption
                                                        L1_29(L2_30, L3_31)
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.move
                                                        L3_31 = A0_26.posList
                                                        L1_29(L2_30, L3_31, {
                                                          startIndex = A0_26.currentMovePos,
                                                          goalDirection = true
                                                        })
                                                        A0_26.currentMovePos = -1
                                                      end
                                                    else
                                                      A0_26.posListChanged = false
                                                      L1_29 = A0_26.loop
                                                      if L1_29 then
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.playMotion
                                                        L3_31 = A0_26.motion
                                                        L1_29(L2_30, L3_31, L0_28)
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.setMoveOption
                                                        L3_31 = A0_26.moveOption
                                                        L1_29(L2_30, L3_31)
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.move
                                                        L3_31 = A0_26.posList
                                                        L1_29(L2_30, L3_31, {startIndex = 1, goalDirection = true})
                                                      else
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.isMotionEnd
                                                        L1_29 = L1_29(L2_30)
                                                        if L1_29 then
                                                          L1_29 = A0_26.motion
                                                          if L1_29 ~= nil then
                                                            L1_29 = A0_26.npc
                                                            L2_30 = L1_29
                                                            L1_29 = L1_29.playMotion
                                                            L3_31 = A0_26.motion
                                                            L1_29(L2_30, L3_31, L0_28)
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            else
                                              L1_29 = A0_26.npc
                                              L2_30 = L1_29
                                              L1_29 = L1_29.isMotionEnd
                                              L1_29 = L1_29(L2_30)
                                              if L1_29 then
                                                L1_29 = A0_26.motion
                                                if L1_29 ~= nil then
                                                  L1_29 = L1_27
                                                  if L1_29 then
                                                    L1_29 = Fn_playLoopMotionRand
                                                    L2_30 = A0_26.npcName
                                                    L3_31 = {
                                                      "stay_01",
                                                      "lookaround_01",
                                                      "lookaround_02"
                                                    }
                                                    L1_29(L2_30, L3_31, 5, 10)
                                                  else
                                                    L1_29 = A0_26.npc
                                                    L2_30 = L1_29
                                                    L1_29 = L1_29.playMotion
                                                    L3_31 = A0_26.motion
                                                    L1_29(L2_30, L3_31, L0_28)
                                                  end
                                                end
                                              end
                                            end
                                            else
                                              L1_29 = A0_26.status
                                              L2_30 = NPC_STATUS
                                              L2_30 = L2_30.CAUTION
                                              if L1_29 == L2_30 then
                                                L1_29 = A0_26.cautionMode
                                                L2_30 = CAUTION_MODE
                                                L2_30 = L2_30.TIME
                                                if L1_29 == L2_30 then
                                                  L1_29 = isInSight
                                                  L2_30 = A0_26.npcName
                                                  L3_31 = A0_26.sightParam
                                                  L1_29 = L1_29(L2_30, L3_31)
                                                  if L1_29 then
                                                    L1_29 = Fn_getPlayerWorldPos
                                                    L1_29 = L1_29()
                                                    A0_26.targetPos = L1_29
                                                    L1_29 = getCautionValue
                                                    L2_30 = A0_26.npcName
                                                    L3_31 = A0_26.sightParam
                                                    L3_31 = L3_31.length
                                                    L1_29 = L1_29(L2_30, L3_31)
                                                    L2_30 = A0_26.cautionIncCoefficent
                                                    L1_29 = L1_29 * L2_30
                                                    L2_30 = A0_26
                                                    L3_31 = L2_30
                                                    L2_30 = L2_30.setCautionLevel
                                                    L2_30(L3_31, A0_26.caution + L1_29)
                                                  else
                                                    L1_29 = A0_26.cautionDecCoefficent
                                                    L1_29 = 1 * L1_29
                                                    L2_30 = A0_26
                                                    L3_31 = L2_30
                                                    L2_30 = L2_30.setCautionLevel
                                                    L2_30(L3_31, A0_26.caution - L1_29)
                                                  end
                                                else
                                                  L1_29 = Fn_getDistanceToPlayer
                                                  L2_30 = A0_26.npcPuppet
                                                  L1_29 = L1_29(L2_30)
                                                  if L1_29 >= 0 then
                                                    L2_30 = A0_26.alertRange
                                                    if L1_29 <= L2_30 then
                                                      L2_30 = COOLDOWN_TIME
                                                      A0_26.coolDown = L2_30
                                                      L2_30 = CautionLevel
                                                      L2_30 = L2_30.MAX_LEVEL
                                                      A0_26.caution = L2_30
                                                    end
                                                  else
                                                    L2_30 = A0_26.alertRange
                                                    if L1_29 > L2_30 then
                                                      L2_30 = A0_26.cautionRange
                                                      if L1_29 <= L2_30 then
                                                        L2_30 = COOLDOWN_TIME
                                                        A0_26.coolDown = L2_30
                                                        L2_30 = A0_26.cautionRange
                                                        L2_30 = L2_30 - L1_29
                                                        L2_30 = L2_30 * 100
                                                        L3_31 = A0_26.cautionRange
                                                        L3_31 = L3_31 - A0_26.alertRange
                                                        L2_30 = L2_30 / L3_31
                                                        A0_26.caution = L2_30
                                                      end
                                                    else
                                                      L2_30 = A0_26.coolDown
                                                      L2_30 = L2_30 - 1
                                                      A0_26.coolDown = L2_30
                                                      L2_30 = A0_26.coolDown
                                                      if L2_30 < 0 then
                                                        A0_26.caution = 0
                                                      end
                                                      L2_30 = A0_26.detectGravity
                                                      if L2_30 then
                                                        L2_30 = Player
                                                        L3_31 = L2_30
                                                        L2_30 = L2_30.isGravityControlMode
                                                        L2_30 = L2_30(L3_31)
                                                        if L2_30 then
                                                          A0_26.caution = 50
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                                L1_29 = A0_26.caution
                                                L2_30 = CautionLevel
                                                L2_30 = L2_30.MAX_LEVEL
                                                if L1_29 >= L2_30 then
                                                  L1_29 = getNearPosforPC
                                                  L2_30 = A0_26.npcName
                                                  L1_29 = L1_29(L2_30)
                                                  A0_26.targetPos = L1_29
                                                  L1_29 = {L2_30}
                                                  L2_30 = {}
                                                  L3_31 = A0_26.targetPos
                                                  L2_30.pos = L3_31
                                                  L3_31 = A0_26.moveOption
                                                  L2_30.opt = L3_31
                                                  L2_30 = A0_26.npc
                                                  L3_31 = L2_30
                                                  L2_30 = L2_30.setMoveOption
                                                  L2_30(L3_31, A0_26.moveOption)
                                                  L2_30 = A0_26.npc
                                                  L3_31 = L2_30
                                                  L2_30 = L2_30.move
                                                  L2_30(L3_31, L1_29)
                                                  L2_30 = A0_26.status
                                                  L3_31 = NPC_STATUS
                                                  L3_31 = L3_31.CAUTION
                                                  if L2_30 == L3_31 then
                                                    L2_30 = CALLBACK_REASON
                                                    L2_30 = L2_30.CAUTION_OVERFLOW
                                                    A0_26.callbackReason = L2_30
                                                    L2_30 = NPC_STATUS
                                                    L2_30 = L2_30.ALERT
                                                    A0_26.status = L2_30
                                                  end
                                                else
                                                  L1_29 = A0_26.caution
                                                  if L1_29 <= 0 then
                                                    L1_29 = getNearPosforPC
                                                    L2_30 = A0_26.npcName
                                                    L1_29 = L1_29(L2_30)
                                                    A0_26.targetPos = L1_29
                                                    L1_29 = {L2_30}
                                                    L2_30 = {}
                                                    L3_31 = A0_26.targetPos
                                                    L2_30.pos = L3_31
                                                    L3_31 = A0_26.moveOption
                                                    L2_30.opt = L3_31
                                                    L2_30 = A0_26.npc
                                                    L3_31 = L2_30
                                                    L2_30 = L2_30.setMoveOption
                                                    L2_30(L3_31, A0_26.moveOption)
                                                    L2_30 = A0_26.npc
                                                    L3_31 = L2_30
                                                    L2_30 = L2_30.move
                                                    L2_30(L3_31, L1_29)
                                                    L2_30 = A0_26.npc
                                                    L3_31 = L2_30
                                                    L2_30 = L2_30.playMotion
                                                    L2_30(L3_31, A0_26.dismissMotion, L0_28)
                                                    L2_30 = A0_26.status
                                                    L3_31 = NPC_STATUS
                                                    L3_31 = L3_31.CAUTION
                                                    if L2_30 == L3_31 then
                                                      A0_26.caution = 0
                                                      A0_26.indication = 0
                                                      L2_30 = CALLBACK_REASON
                                                      L2_30 = L2_30.NO_CAUTION
                                                      A0_26.callbackReason = L2_30
                                                      L2_30 = NPC_STATUS
                                                      L2_30 = L2_30.NORMAL
                                                      A0_26.status = L2_30
                                                    end
                                                  else
                                                    L1_29 = A0_26.chaseMode
                                                    if L1_29 then
                                                      L1_29 = A0_26.npc
                                                      L2_30 = L1_29
                                                      L1_29 = L1_29.isMoveEnd
                                                      L1_29 = L1_29(L2_30)
                                                      if L1_29 then
                                                        L1_29 = Fn_getPlayer
                                                        L1_29 = L1_29()
                                                        A0_26.targetPos = L1_29
                                                        L1_29 = {L2_30}
                                                        L2_30 = {}
                                                        L3_31 = A0_26.targetPos
                                                        L2_30.pos = L3_31
                                                        L3_31 = A0_26.moveOption
                                                        L2_30.opt = L3_31
                                                        L2_30 = A0_26.npc
                                                        L3_31 = L2_30
                                                        L2_30 = L2_30.setMoveOption
                                                        L2_30(L3_31, A0_26.moveOption)
                                                        L2_30 = A0_26.npc
                                                        L3_31 = L2_30
                                                        L2_30 = L2_30.move
                                                        L2_30(L3_31, L1_29)
                                                      end
                                                    else
                                                      L1_29 = A0_26.caution
                                                      if L1_29 >= 50 then
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.turn
                                                        L3_31 = A0_26.targetPos
                                                        L1_29(L2_30, L3_31)
                                                      else
                                                        L1_29 = A0_26.npc
                                                        L2_30 = L1_29
                                                        L1_29 = L1_29.isMoveEnd
                                                        L1_29 = L1_29(L2_30)
                                                        if L1_29 then
                                                          L1_29 = A0_26.npc
                                                          L2_30 = L1_29
                                                          L1_29 = L1_29.isMotionEnd
                                                          L1_29 = L1_29(L2_30)
                                                          if L1_29 then
                                                            L1_29 = A0_26.npc
                                                            L2_30 = L1_29
                                                            L1_29 = L1_29.isTurnEnd
                                                            L1_29 = L1_29(L2_30)
                                                            if L1_29 then
                                                              L1_29 = L1_27
                                                              if L1_29 then
                                                                L1_29 = Fn_playLoopMotionRand
                                                                L2_30 = A0_26.npcName
                                                                L3_31 = {
                                                                  "stay_01",
                                                                  "lookaround_01",
                                                                  "lookaround_02"
                                                                }
                                                                L1_29(L2_30, L3_31, 5, 10)
                                                              else
                                                                L1_29 = A0_26.npc
                                                                L2_30 = L1_29
                                                                L1_29 = L1_29.playMotion
                                                                L3_31 = A0_26.motion
                                                                L1_29(L2_30, L3_31, L0_28)
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                    else
                                                      L1_29 = A0_26.status
                                                      L2_30 = NPC_STATUS
                                                      L2_30 = L2_30.ALERT
                                                      if L1_29 == L2_30 then
                                                        L1_29 = A0_26.combatReady
                                                        if not L1_29 then
                                                          L1_29 = A0_26.combatReady2
                                                        else
                                                          if L1_29 then
                                                            L1_29 = A0_26.status
                                                            L2_30 = NPC_STATUS
                                                            L2_30 = L2_30.ALERT
                                                            if L1_29 == L2_30 then
                                                              L1_29 = print
                                                              L2_30 = "\226\152\133\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\239\188\129combatReady:"
                                                              L3_31 = A0_26.combatReady
                                                              L1_29(L2_30, L3_31, "combatReady2:", A0_26.combatReady2)
                                                              L1_29 = A0_26.combatReady2
                                                              if L1_29 then
                                                                L1_29 = CALLBACK_REASON
                                                                L1_29 = L1_29.DAMAGED
                                                                A0_26.callbackReason = L1_29
                                                              else
                                                                L1_29 = CALLBACK_REASON
                                                                L1_29 = L1_29.BEGIN_COMBAT
                                                                A0_26.callbackReason = L1_29
                                                              end
                                                              L1_29 = NPC_STATUS
                                                              L1_29 = L1_29.COMBAT
                                                              A0_26.status = L1_29
                                                              A0_26.combatTimeout = false
                                                              L1_29 = A0_26.npc
                                                              L2_30 = L1_29
                                                              L1_29 = L1_29.changeEnemy
                                                              L1_29(L2_30)
                                                              L1_29 = A0_26.combatTimeEnable
                                                              if L1_29 then
                                                                L1_29 = Mv_safeTaskAbort
                                                                L2_30 = A0_26.battleTimerTask
                                                                L1_29 = L1_29(L2_30)
                                                                A0_26.battleTimerTask = L1_29
                                                                L1_29 = EventHelper
                                                                L2_30 = L1_29
                                                                L1_29 = L1_29.timerCallback
                                                                L3_31 = "combat"
                                                                L1_29 = L1_29(L2_30, L3_31, A0_26.combatTime, function()
                                                                  A0_26.battleTimerTask = Mv_safeTaskAbort(A0_26.battleTimerTask)
                                                                  A0_26.combatTimeout = true
                                                                end)
                                                                A0_26.battleTimerTask = L1_29
                                                              end
                                                            end
                                                        end
                                                        else
                                                          L1_29 = A0_26.cautionMode
                                                          L2_30 = CAUTION_MODE
                                                          L2_30 = L2_30.TIME
                                                          if L1_29 == L2_30 then
                                                            L1_29 = isInSight
                                                            L2_30 = A0_26.npcName
                                                            L3_31 = A0_26.sightParam
                                                            L1_29 = L1_29(L2_30, L3_31)
                                                            if L1_29 then
                                                              L1_29 = COOLDOWN_TIME
                                                              A0_26.coolDown = L1_29
                                                              L1_29 = Fn_getPlayer
                                                              L1_29 = L1_29()
                                                              A0_26.targetPos = L1_29
                                                              L1_29 = A0_26.chaseMode
                                                              if L1_29 then
                                                                L1_29 = A0_26.npc
                                                                L2_30 = L1_29
                                                                L1_29 = L1_29.isMoveEnd
                                                                L1_29 = L1_29(L2_30)
                                                                if L1_29 then
                                                                  L1_29 = {L2_30}
                                                                  L2_30 = {}
                                                                  L3_31 = A0_26.targetPos
                                                                  L2_30.pos = L3_31
                                                                  L3_31 = A0_26.chaseMoveOption
                                                                  L2_30.opt = L3_31
                                                                  L2_30 = A0_26.npc
                                                                  L3_31 = L2_30
                                                                  L2_30 = L2_30.setMoveOption
                                                                  L2_30(L3_31, A0_26.chaseMoveOption)
                                                                  L2_30 = A0_26.npc
                                                                  L3_31 = L2_30
                                                                  L2_30 = L2_30.move
                                                                  L2_30(L3_31, L1_29)
                                                                end
                                                                L1_29 = A0_26.npcPuppet
                                                                L2_30 = L1_29
                                                                L1_29 = L1_29.getWorldPos
                                                                L1_29 = L1_29(L2_30)
                                                                L2_30 = Fn_get_distance
                                                                L3_31 = L1_29
                                                                L2_30 = L2_30(L3_31, A0_26.targetPos:getWorldPos())
                                                                L3_31 = CAPTURE_DISTANCE
                                                                if L2_30 < L3_31 then
                                                                  L2_30 = getNearPosforPC
                                                                  L3_31 = A0_26.npcName
                                                                  L2_30 = L2_30(L3_31)
                                                                  A0_26.targetPos = L2_30
                                                                  L2_30 = {L3_31}
                                                                  L3_31 = {}
                                                                  L3_31.pos = A0_26.targetPos
                                                                  L3_31.opt = A0_26.moveOption
                                                                  L3_31 = A0_26.npc
                                                                  L3_31 = L3_31.setMoveOption
                                                                  L3_31(L3_31, A0_26.moveOption)
                                                                  L3_31 = A0_26.npc
                                                                  L3_31 = L3_31.move
                                                                  L3_31(L3_31, L2_30)
                                                                  L3_31 = A0_26.status
                                                                  if L3_31 == NPC_STATUS.ALERT then
                                                                    L3_31 = CALLBACK_REASON
                                                                    L3_31 = L3_31.TARGET_CAPTURE
                                                                    A0_26.callbackReason = L3_31
                                                                    L3_31 = NPC_STATUS
                                                                    L3_31 = L3_31.TERMINATE
                                                                    A0_26.status = L3_31
                                                                  end
                                                                end
                                                              else
                                                                L1_29 = A0_26.terminateMode
                                                                if L1_29 then
                                                                  L1_29 = CALLBACK_REASON
                                                                  L1_29 = L1_29.TERMINATE
                                                                  A0_26.callbackReason = L1_29
                                                                  L1_29 = NPC_STATUS
                                                                  L1_29 = L1_29.TERMINATE
                                                                  A0_26.status = L1_29
                                                                else
                                                                  else
                                                                    L1_29 = A0_26.coolDown
                                                                    L1_29 = L1_29 - 1
                                                                    A0_26.coolDown = L1_29
                                                                    L1_29 = A0_26.coolDown
                                                                    if L1_29 < 0 then
                                                                      L1_29 = getNearPosforPC
                                                                      L2_30 = A0_26.npcName
                                                                      L1_29 = L1_29(L2_30)
                                                                      A0_26.targetPos = L1_29
                                                                      L1_29 = {L2_30}
                                                                      L2_30 = {}
                                                                      L3_31 = A0_26.targetPos
                                                                      L2_30.pos = L3_31
                                                                      L3_31 = A0_26.moveOption
                                                                      L2_30.opt = L3_31
                                                                      L2_30 = A0_26.npc
                                                                      L3_31 = L2_30
                                                                      L2_30 = L2_30.setMoveOption
                                                                      L2_30(L3_31, A0_26.moveOption)
                                                                      L2_30 = A0_26.npc
                                                                      L3_31 = L2_30
                                                                      L2_30 = L2_30.move
                                                                      L2_30(L3_31, L1_29)
                                                                      L2_30 = A0_26.status
                                                                      L3_31 = NPC_STATUS
                                                                      L3_31 = L3_31.ALERT
                                                                      if L2_30 == L3_31 then
                                                                        L2_30 = CautionLevel
                                                                        L2_30 = L2_30.MAX_LEVEL
                                                                        L2_30 = L2_30 - 1
                                                                        A0_26.caution = L2_30
                                                                        L2_30 = CALLBACK_REASON
                                                                        L2_30 = L2_30.LOST_TARGET
                                                                        A0_26.callbackReason = L2_30
                                                                        L2_30 = NPC_STATUS
                                                                        L2_30 = L2_30.CAUTION
                                                                        A0_26.status = L2_30
                                                                        else
                                                                          else
                                                                            L1_29 = A0_26.chaseMode
                                                                            if L1_29 then
                                                                              L1_29 = Fn_getPlayer
                                                                              L1_29 = L1_29()
                                                                              A0_26.targetPos = L1_29
                                                                              L1_29 = A0_26.npc
                                                                              L2_30 = L1_29
                                                                              L1_29 = L1_29.isMoveEnd
                                                                              L1_29 = L1_29(L2_30)
                                                                              if L1_29 then
                                                                                L1_29 = {L2_30}
                                                                                L2_30 = {}
                                                                                L3_31 = A0_26.targetPos
                                                                                L2_30.pos = L3_31
                                                                                L3_31 = A0_26.chaseMoveOption
                                                                                L2_30.opt = L3_31
                                                                                L2_30 = A0_26.npc
                                                                                L3_31 = L2_30
                                                                                L2_30 = L2_30.setMoveOption
                                                                                L2_30(L3_31, A0_26.chaseMoveOption)
                                                                                L2_30 = A0_26.npc
                                                                                L3_31 = L2_30
                                                                                L2_30 = L2_30.move
                                                                                L2_30(L3_31, L1_29)
                                                                              end
                                                                              L1_29 = A0_26.npcPuppet
                                                                              L2_30 = L1_29
                                                                              L1_29 = L1_29.getWorldPos
                                                                              L1_29 = L1_29(L2_30)
                                                                              L2_30 = Fn_get_distance
                                                                              L3_31 = L1_29
                                                                              L2_30 = L2_30(L3_31, A0_26.targetPos:getWorldPos())
                                                                              L3_31 = CAPTURE_DISTANCE
                                                                              if L2_30 < L3_31 then
                                                                                L2_30 = A0_26.status
                                                                                L3_31 = NPC_STATUS
                                                                                L3_31 = L3_31.ALERT
                                                                                if L2_30 == L3_31 then
                                                                                  L2_30 = CALLBACK_REASON
                                                                                  L2_30 = L2_30.TARGET_CAPTURE
                                                                                  A0_26.callbackReason = L2_30
                                                                                  L2_30 = NPC_STATUS
                                                                                  L2_30 = L2_30.TERMINATE
                                                                                  A0_26.status = L2_30
                                                                                  do break end
                                                                                  else
                                                                                    L2_30 = Fn_getDistanceToPlayer
                                                                                    L3_31 = A0_26.npcPuppet
                                                                                    L2_30 = L2_30(L3_31)
                                                                                    L3_31 = A0_26.cautionRange
                                                                                    L3_31 = L3_31 * 2
                                                                                    if L2_30 > L3_31 then
                                                                                      L3_31 = A0_26.coolDown
                                                                                      L3_31 = L3_31 - 1
                                                                                      A0_26.coolDown = L3_31
                                                                                      L3_31 = A0_26.coolDown
                                                                                      if L3_31 < 0 then
                                                                                        A0_26.coolDown = 0
                                                                                        L3_31 = getNearPosforPC
                                                                                        L3_31 = L3_31(A0_26.npcName)
                                                                                        A0_26.targetPos = L3_31
                                                                                        L3_31 = {
                                                                                          {
                                                                                            pos = A0_26.targetPos,
                                                                                            opt = A0_26.moveOption
                                                                                          }
                                                                                        }
                                                                                        A0_26.npc:setMoveOption(A0_26.moveOption)
                                                                                        A0_26.npc:move(L3_31)
                                                                                        if A0_26.status == NPC_STATUS.ALERT then
                                                                                          A0_26.caution = CautionLevel.MAX_LEVEL - 1
                                                                                          A0_26.callbackReason = CALLBACK_REASON.LOST_TARGET
                                                                                          A0_26.status = NPC_STATUS.CAUTION
                                                                                          else
                                                                                            else
                                                                                              L1_29 = Fn_getDistanceToPlayer
                                                                                              L2_30 = A0_26.npcPuppet
                                                                                              L1_29 = L1_29(L2_30)
                                                                                              if L1_29 >= 0 then
                                                                                                L2_30 = A0_26.cautionRange
                                                                                                if L1_29 <= L2_30 then
                                                                                                end
                                                                                              else
                                                                                                L2_30 = A0_26.coolDown
                                                                                                L2_30 = L2_30 - 1
                                                                                                A0_26.coolDown = L2_30
                                                                                                L2_30 = A0_26.coolDown
                                                                                                if L2_30 < 0 then
                                                                                                  A0_26.coolDown = 0
                                                                                                  L2_30 = getNearPosforPC
                                                                                                  L3_31 = A0_26.npcName
                                                                                                  L2_30 = L2_30(L3_31)
                                                                                                  A0_26.targetPos = L2_30
                                                                                                  L2_30 = {L3_31}
                                                                                                  L3_31 = {}
                                                                                                  L3_31.pos = A0_26.targetPos
                                                                                                  L3_31.opt = A0_26.moveOption
                                                                                                  L3_31 = A0_26.npc
                                                                                                  L3_31 = L3_31.setMoveOption
                                                                                                  L3_31(L3_31, A0_26.moveOption)
                                                                                                  L3_31 = A0_26.npc
                                                                                                  L3_31 = L3_31.move
                                                                                                  L3_31(L3_31, L2_30)
                                                                                                  L3_31 = A0_26.status
                                                                                                  if L3_31 == NPC_STATUS.ALERT then
                                                                                                    L3_31 = CautionLevel
                                                                                                    L3_31 = L3_31.MAX_LEVEL
                                                                                                    L3_31 = L3_31 - 1
                                                                                                    A0_26.caution = L3_31
                                                                                                    L3_31 = CALLBACK_REASON
                                                                                                    L3_31 = L3_31.LOST_TARGET
                                                                                                    A0_26.callbackReason = L3_31
                                                                                                    L3_31 = NPC_STATUS
                                                                                                    L3_31 = L3_31.CAUTION
                                                                                                    A0_26.status = L3_31
                                                                                                    else
                                                                                                      else
                                                                                                        L1_29 = A0_26.status
                                                                                                        L2_30 = NPC_STATUS
                                                                                                        L2_30 = L2_30.COMBAT
                                                                                                        if L1_29 == L2_30 then
                                                                                                        else
                                                                                                          L1_29 = A0_26.status
                                                                                                          L2_30 = NPC_STATUS
                                                                                                          L2_30 = L2_30.TERMINATE
                                                                                                          if L1_29 == L2_30 then
                                                                                                          else
                                                                                                            L1_29 = A0_26.status
                                                                                                            L2_30 = NPC_STATUS
                                                                                                            L2_30 = L2_30.DEAD
                                                                                                            if L1_29 == L2_30 then
                                                                                                            else
                                                                                                              L1_29 = A0_26.status
                                                                                                              L2_30 = NPC_STATUS
                                                                                                              L2_30 = L2_30.HACKED
                                                                                                              if L1_29 == L2_30 then
                                                                                                                L1_29 = _cnt
                                                                                                                L1_29 = L1_29 + 1
                                                                                                                _cnt = L1_29
                                                                                                                L1_29 = A0_26.hackDuration
                                                                                                                L1_29 = L1_29 % 100
                                                                                                                if L1_29 == 0 then
                                                                                                                  L1_29 = A0_26.headLoc
                                                                                                                  L2_30 = L1_29
                                                                                                                  L1_29 = L1_29.setWorldTransform
                                                                                                                  L3_31 = A0_26.npcPuppet
                                                                                                                  L3_31 = L3_31.getWorldTransform
                                                                                                                  L3_31 = L3_31(L3_31)
                                                                                                                  L3_31 = L3_31 + Vector(0, 2, 0)
                                                                                                                  L1_29(L2_30, L3_31)
                                                                                                                end
                                                                                                                _time_cnt_start = true
                                                                                                                L1_29 = _time_cnt_start
                                                                                                                if L1_29 then
                                                                                                                  L1_29 = _once_cnt_start
                                                                                                                  if L1_29 == false then
                                                                                                                    _once_cnt_start = true
                                                                                                                    _time_cnt = 0
                                                                                                                    L1_29 = invokeTask
                                                                                                                    function L2_30()
                                                                                                                      while true do
                                                                                                                        waitSeconds(1)
                                                                                                                        _time_cnt = _time_cnt + 1
                                                                                                                      end
                                                                                                                    end
                                                                                                                    L1_29 = L1_29(L2_30)
                                                                                                                    _cnt_task = L1_29
                                                                                                                  end
                                                                                                                end
                                                                                                                L1_29 = Fn_getPlayer
                                                                                                                L1_29 = L1_29()
                                                                                                                A0_26.targetPos = L1_29
                                                                                                                L1_29 = A0_26.npc
                                                                                                                L2_30 = L1_29
                                                                                                                L1_29 = L1_29.isMoveEnd
                                                                                                                L1_29 = L1_29(L2_30)
                                                                                                                if L1_29 then
                                                                                                                  L1_29 = Fn_getDistanceToPlayer
                                                                                                                  L2_30 = A0_26.npcPuppet
                                                                                                                  L1_29 = L1_29(L2_30)
                                                                                                                  L2_30 = {L3_31}
                                                                                                                  L3_31 = {}
                                                                                                                  L3_31.pos = A0_26.targetPos
                                                                                                                  L3_31.opt = _move_option_bot_hack
                                                                                                                  L3_31 = A0_26.npc
                                                                                                                  L3_31 = L3_31.setMoveOption
                                                                                                                  L3_31(L3_31, _move_option_bot_hack)
                                                                                                                  L3_31 = A0_26.npc
                                                                                                                  L3_31 = L3_31.move
                                                                                                                  L3_31(L3_31, L2_30)
                                                                                                                else
                                                                                                                  L1_29 = A0_26.npc
                                                                                                                  L2_30 = L1_29
                                                                                                                  L1_29 = L1_29.setMoveOption
                                                                                                                  L3_31 = _move_option_bot_hack
                                                                                                                  L1_29(L2_30, L3_31)
                                                                                                                end
                                                                                                                L1_29 = A0_26.hackDuration
                                                                                                                L1_29 = L1_29 - 1
                                                                                                                A0_26.hackDuration = L1_29
                                                                                                                L1_29 = A0_26.hackDuration
                                                                                                                if L1_29 < 0 then
                                                                                                                  A0_26.hackDuration = -1
                                                                                                                  L1_29 = Mv_safeTaskAbort
                                                                                                                  L2_30 = _cnt_task
                                                                                                                  L1_29 = L1_29(L2_30)
                                                                                                                  _cnt_task = L1_29
                                                                                                                  L1_29 = A0_26.status
                                                                                                                  L2_30 = NPC_STATUS
                                                                                                                  L2_30 = L2_30.HACKED
                                                                                                                  if L1_29 == L2_30 then
                                                                                                                    L1_29 = A0_26.npc
                                                                                                                    L2_30 = L1_29
                                                                                                                    L1_29 = L1_29.reset
                                                                                                                    L1_29(L2_30)
                                                                                                                    A0_26.caution = 0
                                                                                                                    A0_26.indication = 0
                                                                                                                    L1_29 = CALLBACK_REASON
                                                                                                                    L1_29 = L1_29.NO_CAUTION
                                                                                                                    A0_26.callbackReason = L1_29
                                                                                                                    L1_29 = NPC_STATUS
                                                                                                                    L1_29 = L1_29.NORMAL
                                                                                                                    A0_26.status = L1_29
                                                                                                                    else
                                                                                                                      L1_29 = A0_26.combatTimeout
                                                                                                                      if L1_29 then
                                                                                                                        L1_29 = A0_26.status
                                                                                                                        L2_30 = NPC_STATUS
                                                                                                                        L2_30 = L2_30.COMBAT
                                                                                                                        if L1_29 == L2_30 then
                                                                                                                          A0_26.combatTimeout = false
                                                                                                                          L1_29 = A0_26.npc
                                                                                                                          L2_30 = L1_29
                                                                                                                          L1_29 = L1_29.isEnemy
                                                                                                                          L1_29 = L1_29(L2_30)
                                                                                                                          if L1_29 then
                                                                                                                            L1_29 = A0_26.npc
                                                                                                                            L2_30 = L1_29
                                                                                                                            L1_29 = L1_29.changeNpc
                                                                                                                            L1_29(L2_30)
                                                                                                                            A0_26.combatReady2 = false
                                                                                                                          end
                                                                                                                          A0_26.caution = 0
                                                                                                                          L1_29 = CALLBACK_REASON
                                                                                                                          L1_29 = L1_29.COMBAT_TIMEOUT
                                                                                                                          A0_26.callbackReason = L1_29
                                                                                                                          L1_29 = A0_26.terminateMode
                                                                                                                          if L1_29 then
                                                                                                                            L1_29 = NPC_STATUS
                                                                                                                            L1_29 = L1_29.TERMINATE
                                                                                                                            A0_26.status = L1_29
                                                                                                                          else
                                                                                                                            L1_29 = A0_26
                                                                                                                            L2_30 = L1_29
                                                                                                                            L1_29 = L1_29.setDamagedEvent
                                                                                                                            L1_29(L2_30)
                                                                                                                            L1_29 = NPC_STATUS
                                                                                                                            L1_29 = L1_29.NORMAL
                                                                                                                            A0_26.status = L1_29
                                                                                                                          end
                                                                                                                        end
                                                                                                                      end
                                                                                                                    end
                                                                                                                  end
                                                                                                              else
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                  end
                                                                                end
                                                                          end
                                                                        end
                                                                      end
                                                                  end
                                                                end
                                                              end
                                                        end
                                                    end
                                                  end
                                                end
                                            end
                                          end
                                        end
                                    end
                                  end
                                end
                              end
                            end
                          end
                    end
                  end
                end
              end
        L1_29 = A0_26.oldStatus
        L2_30 = A0_26.status
        if L1_29 ~= L2_30 then
          L1_29 = A0_26.changeStateFunction
          if L1_29 ~= nil then
            L1_29 = A0_26.callbackReason
            if L1_29 > 0 then
              L1_29 = A0_26.changeStateFunction
              L2_30 = A0_26.npcName
              L3_31 = A0_26.callbackReason
              L1_29(L2_30, L3_31)
              A0_26.callbackReason = 0
              L1_29 = nil
              L2_30 = A0_26.status
              L3_31 = NPC_STATUS
              L3_31 = L3_31.CAUTION
              if L2_30 == L3_31 then
                L1_29 = "ene_bot_vo_search"
              else
                L2_30 = A0_26.status
                L3_31 = NPC_STATUS
                L3_31 = L3_31.ALERT
                if L2_30 == L3_31 then
                  L1_29 = "ene_bot_vo_call_kat"
                else
                  L2_30 = A0_26.status
                  L3_31 = NPC_STATUS
                  L3_31 = L3_31.NORMAL
                  if L2_30 == L3_31 then
                    L1_29 = "ene_bot_vo_lost_target"
                  else
                    L2_30 = A0_26.status
                    L3_31 = NPC_STATUS
                    L3_31 = L3_31.HACKED
                    if L2_30 == L3_31 then
                      L1_29 = "ep17_grigo_hacking"
                    end
                  end
                end
              end
              if L1_29 ~= nil then
                L2_30 = Sound
                L3_31 = L2_30
                L2_30 = L2_30.playSE
                L2_30(L3_31, L1_29, 1, "", A0_26.npcPuppet)
              end
            end
          end
        end
        L1_29 = A0_26.status
        A0_26.oldStatus = L1_29
        L1_29 = wait
        L1_29()
      end
    end
  end)
end
function anoterCatWarp(A0_32, A1_33)
  return (invokeTask(function()
    while true do
      if _onleave_com then
        Fn_catWarpIn()
        Fn_catWarpCheckPoint()
        if A0_32 ~= nil then
          A0_32()
        end
        Fn_catWarpOut()
        if A1_33 ~= nil then
          A1_33()
        end
        _onleave_com = false
      end
      wait()
    end
  end))
end
function runCatWarp()
  local L0_34, L1_35
  _onleave_com = true
end
Queue = {}
function Queue.new()
  local L0_36
  L0_36 = {}
  L0_36.buff = {}
  return setmetatable(L0_36, {
    __index = Queue
  })
end
function Queue.enqueue(A0_37, A1_38)
  table.insert(A0_37.buff, A1_38)
end
function Queue.dequeue(A0_39)
  return table.remove(A0_39.buff, 1)
end
function Queue.top(A0_40)
  local L1_41
  L1_41 = A0_40.buff
  L1_41 = #L1_41
  if L1_41 > 0 then
    L1_41 = A0_40.buff
    L1_41 = L1_41[1]
    return L1_41
  end
end
function Queue.isEmpty(A0_42)
  local L1_43
  L1_43 = A0_42.buff
  L1_43 = #L1_43
  L1_43 = L1_43 == 0
  return L1_43
end
