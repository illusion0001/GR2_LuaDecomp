import("GlobalGem")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
_LOOKTO_RESET_DURATION = 2
_LOOKTO_DISABLESTICK_DURATION = 3
_MARKER_WAIT_AFTER_MISSION_VIEW = 1.3
_CAPTION_WAIT_AFTER_MARKER = 2.5
_CAPTION_WAIT_AFTER_MISSION_VIEW = 3.8
_GEM = {
  SMALL = 1,
  MIDDLE = 2,
  LARGE = 3,
  ENERGY = 4,
  VITAL = 5,
  SPECIAL = 6
}
_isInSensor = {}
_vital_gem_callback_is_busy = false
LocalTimerClass = {}
function LocalTimerClass.new()
  local L0_0
  L0_0 = {}
  L0_0.playTime = 0
  L0_0.isRunning = false
  L0_0.task = invokeTask(function()
    while true do
      if L0_0.isRunning then
        L0_0.playTime = L0_0.playTime + 1
      end
      waitSeconds(1)
    end
  end)
  function L0_0.start(A0_1)
    local L1_2
    A0_1.isRunning = true
  end
  function L0_0.stop(A0_3)
    local L1_4
    A0_3.isRunning = false
  end
  function L0_0.setTime(A0_5, A1_6)
    A0_5.playTime = A1_6
  end
  function L0_0.getTime(A0_7)
    local L1_8
    L1_8 = A0_7.playTime
    return L1_8
  end
  return L0_0
end
function lookAtObject(A0_9, A1_10, A2_11)
  invokeTask(function()
    local L0_12, L1_13, L2_14
    L0_12 = {}
    L0_12.r_stick = true
    L0_12.l_stick = false
    L0_12.v_infinite = false
    L0_12.g_infinite = false
    L0_12.s_infinite = false
    L1_13 = Fn_lockPlayerAbility
    L2_14 = nil
    L1_13(L2_14, L0_12)
    L1_13 = Fn_lookAtObject
    L2_14 = A0_9
    L1_13 = L1_13(L2_14, 0)
    L2_14 = waitSeconds
    L2_14(A2_11)
    L2_14 = L1_13.abort
    L2_14(L1_13)
    L2_14 = {}
    L2_14.r_stick = true
    L2_14.l_stick = true
    L2_14.v_infinite = false
    L2_14.g_infinite = false
    L2_14.s_infinite = false
    Fn_unLockPlayerAbility(nil, L2_14)
  end)
  waitSeconds(A1_10)
end
function playerTurn(A0_15)
  local L1_16
  L1_16 = 0.5
  if A0_15 ~= nil then
    Player:setLookAtIk(true, L1_16, A0_15:getWorldPos())
    waitSeconds(L1_16)
    Player:setLookAtIk(false, L1_16, A0_15:getWorldPos())
  else
    Player:setLookAtIk(false, L1_16, Vector(0, 0, 0))
  end
end
function onGetVitalGem(A0_17)
  print("onGetVitalGem")
  if _vital_gem_callback_is_busy then
    print("task is busy.")
    return
  end
  if A0_17:getName() ~= nil then
    print(A0_17:getName())
  else
  end
  if wasOpenInfo(ggd.Savedata__Info__ep02__ep02_info_12) then
    return
  end
  invokeTask(function()
    _vital_gem_callback_is_busy = true
    HUD:info("ep02_info_12", false)
    wait()
    repeat
      wait()
    until wasOpenInfo(ggd.Savedata__Info__ep02__ep02_info_12)
    _vital_gem_callback_is_busy = false
  end)
end
function setMnavi(A0_18)
  HUD:mnaviNew({
    name = A0_18:getName()
  }):setTarget(A0_18)
  HUD:mnaviNew({
    name = A0_18:getName()
  }):setActive(true, true)
  return (HUD:mnaviNew({
    name = A0_18:getName()
  }))
end
function deleteMnavi(A0_19)
  if A0_19 ~= nil then
    A0_19:setActive(false)
    A0_19:del()
  end
end
function getNodePos(A0_20)
  return findGameObject2("Node", A0_20):getWorldPos()
end
function getNpcPos(A0_21)
  return Fn_findNpcPuppet(A0_21):getWorldPos()
end
function waitGetPos(A0_22, A1_23)
  pos = getNodePos(A0_22)
  repeat
    wait()
  until isWithinRange(pos, A1_23)
end
function isWithinRange(A0_24, A1_25)
  local L3_26
  L3_26 = Fn_get_distance
  L3_26 = L3_26(A0_24, Fn_getPcPosRot())
  if A1_25 > L3_26 then
    L3_26 = true
    return L3_26
  else
    L3_26 = false
    return L3_26
  end
end
function isWithinRangeOfNPC(A0_27, A1_28)
  return isWithinRange(getNpcPos(A0_27), A1_28)
end
function isWithinRangeOfNode(A0_29, A1_30)
  return isWithinRange(getNodePos(A0_29), A1_30)
end
function npcBreakOre(A0_31, A1_32)
  if A1_32 ~= nil then
    A1_32:requestBreak(Fn_findNpcPuppet(A0_31):getWorldPos() + Vector(0, 1, 0), 10)
  end
end
function turnNpc(A0_33, A1_34, A2_35)
  Fn_findNpc(A0_33):turn(A1_34, A2_35)
end
function isNpcMotionEnd(A0_36)
  return Fn_findNpc(A0_36):isMotionEnd()
end
function isNpcMoveEnd(A0_37)
  return Fn_findNpc(A0_37):isMoveEnd()
end
function isNpcTurnEnd(A0_38)
  return Fn_findNpc(A0_38):isTurnEnd()
end
function isNpcJumpEnd(A0_39)
  return Fn_findNpc(A0_39):isJumpEnd()
end
function waitNpcMotionEnd(A0_40)
  repeat
    wait()
  until isNpcMotionEnd(A0_40)
end
function waitNpcMoveEnd(A0_41)
  repeat
    wait()
  until isNpcMoveEnd(A0_41)
end
function waitNpcMoveAndTurnEnd(A0_42)
  repeat
    wait()
  until isNpcMoveEnd(A0_42) and isNpcTurnEnd(A0_42)
end
function waitNpcJumpEnd(A0_43)
  repeat
    wait()
  until isNpcJumpEnd(A0_43)
end
function setNpcProp(A0_44, A1_45, A2_46, A3_47)
  local L4_48
  L4_48 = createGameObject2
  L4_48 = L4_48("GimmickBg")
  L4_48:setDrawModelName(A2_46)
  L4_48:setName(A1_45)
  L4_48:try_init()
  L4_48:waitForReady()
  L4_48:try_start()
  L4_48:setActive(true)
  Fn_attachJoint(L4_48, Fn_findNpcPuppet(A0_44), A3_47)
end
function setNpcProp2(A0_49, A1_50, A2_51, A3_52)
  local L4_53
  L4_53 = createGameObject2
  L4_53 = L4_53("GimmickBg")
  L4_53:setDrawModelName(A2_51)
  L4_53:setName(A1_50)
  L4_53:try_init()
  L4_53:waitForReady()
  L4_53:try_start()
  L4_53:setActive(true)
  Fn_findNpc(A0_49):setProp(A3_52, L4_53)
end
function npcPlaySyncMotion(A0_54, A1_55, A2_56, A3_57)
  Fn_findNpc(A0_54):setPilot(A1_55, A2_56, A3_57)
  Fn_watchNpc(A0_54, false)
end
function wasOpenInfo(A0_58)
  if GameDatabase:get(A0_58) == 2 then
    return true
  else
    return false
  end
end
function nextPhase()
  local L0_59, L1_60
  _next_phase = true
end
function waitPhase()
  repeat
    wait()
  until _next_phase
  _next_phase = false
end
function waitPhase2()
  repeat
    wait()
  until _next_phase2
  _next_phase2 = false
end
function nextPhaseOnEnter(A0_61)
  Fn_pcSensorOff(A0_61)
  _next_phase = true
end
function sensorOnEnter(A0_62)
  local L1_63
  L1_63 = A0_62.getName
  L1_63 = L1_63(A0_62)
  _isInSensor[L1_63] = true
  print(string.format("%s \227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159\227\128\130", L1_63))
end
function sensorOnLeave(A0_64)
  local L1_65
  L1_65 = A0_64.getName
  L1_65 = L1_65(A0_64)
  _isInSensor[L1_65] = false
  print(string.format("%s \227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159\227\128\130", L1_65))
end
function waitComNextPhase()
  repeat
    wait()
  until Fn_sendEventComSb("getNextPhase")
  Fn_sendEventComSb("resetNextPhase")
end
function setNpcPosToCage(A0_66)
  local L1_67
  L1_67 = Fn_findNpc
  L1_67 = L1_67(A0_66)
  Fn_getCageHandle():appendChild(L1_67, true)
end
