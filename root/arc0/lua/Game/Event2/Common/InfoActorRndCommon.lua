import("math")
import("GameDatabase")
import("EventData")
import("Sound")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/InfoActorCommon.lua")
dofile("/Game/Event2/Common/InfoActorNPCFunc.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Table/InfoActorTable.lua")
__exitSandbox = false
__runFlag = false
__subAreaName = ""
__assetRoot = nil
__createdNodeTable = {}
__exclusionFlag = false
__charaName = ""
__rndIATalkTask = nil
__rndIASpawnTask = nil
__rndIAKaiwaEndTask = nil
__rndEventData = nil
function main()
  setAttachSandbox("infoActorManager")
  while __runFlag == false do
    if __exitSandbox == true then
      return
    end
    wait()
  end
  __rndEventData = EventData:create("env_" .. __subAreaName, nil, __assetRoot)
  if __rndEventData ~= nil then
    __rndEventData:try_init()
    __rndEventData:waitForReady()
    __rndEventData:try_start()
  else
    infoActorManager:sendEvent("setRndIACreateSuccess", false)
    infoActorManager:sendEvent("setRndIACreateComplete", true)
    kill()
    return
  end
  invokeTask(function()
    Ingame()
  end)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_get_random_index_teble
  L1_1 = 1
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = {}
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = L0_0[L5_5]
    if info_actor_tbl[L7_7].lively ~= true or requestRndInfoActorNPC(L7_7, info_actor_tbl[L7_7]) ~= true then
    end
  end
  L5_5 = true
  L2_2(L3_3, L4_4, L5_5)
  while true do
    if L2_2 == false then
      L2_2()
    end
  end
end
function requestRndInfoActorNPC(A0_8, A1_9)
  local L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17
  L2_10 = false
  L3_11 = "rnd_ia_npc_"
  L4_12 = A0_8
  L3_11 = L3_11 .. L4_12
  __charaName = L3_11
  L3_11 = {L4_12}
  L4_12 = {}
  L4_12.name = L5_13
  L4_12.type = L5_13
  L4_12.node = L5_13
  L4_12 = A1_9.use_game
  if L4_12 == true then
    L4_12 = isValidSpawnGameFlag
    L4_12 = L4_12(L5_13)
    if L4_12 ~= true then
      L4_12 = isValidSpawnTrigger
      L4_12 = L4_12(L5_13)
      if L4_12 == true then
        L4_12 = isValidExclusionTrigger
        L4_12 = L4_12(L5_13)
        if L4_12 == true then
          L4_12 = isValidSpawnTerm
          L4_12 = L4_12(L5_13)
          if L4_12 == true then
            L4_12 = infoActorManager
            L4_12 = L4_12.sendEvent
            L4_12 = L4_12(L5_13, L6_14, L7_15)
            if L4_12 == true then
              L4_12 = infoActorManager
              L4_12 = L4_12.sendEvent
              L4_12 = L4_12(L5_13, L6_14, L7_15)
              if L4_12 == true then
                L4_12 = isValidExclusionNPC
                L4_12 = L4_12(L5_13)
                if L4_12 == true then
                  L4_12 = isValidSpawnArea
                  L4_12 = L4_12(L5_13, L6_14)
                  if L4_12 == true then
                    L4_12 = isValidEnableKaiwa
                    L4_12 = L4_12(L5_13, L6_14)
                  end
                end
              end
            end
          end
        end
      end
    elseif L4_12 == true then
      L4_12 = L3_11[1]
      L4_12.node = L5_13
      while true do
        L4_12 = Fn_isInSightTarget
        L4_12 = L4_12(L5_13, L6_14)
        if L4_12 == true then
          L4_12 = __exitSandbox
          if L4_12 == true then
            return
          end
          L4_12 = wait
          L4_12()
        end
      end
      L4_12 = Fn_setupNpc
      L4_12 = L4_12(L5_13)
      L5_13(L6_14, L7_15)
      L5_13(L6_14)
      for L8_16, L9_17 in L5_13(L6_14) do
        infoActorManager:sendEvent("setNpc", L8_16, L9_17)
      end
      L8_16 = "setIAMgrTblSpawnArea"
      L9_17 = A0_8
      L6_14(L7_15, L8_16, L9_17, __subAreaName)
      L8_16 = "setSpawnSandbox"
      L9_17 = __charaName
      L6_14(L7_15, L8_16, L9_17, "ia_fix_npc")
      L8_16 = "setGameFlag"
      L9_17 = __charaName
      L6_14(L7_15, L8_16, L9_17, A1_9.spawn_game_flag)
      L8_16 = "setSpawnArea"
      L9_17 = __charaName
      L6_14(L7_15, L8_16, L9_17, __subAreaName)
      if L6_14 == true then
        L8_16 = {}
        L8_16.valid = false
        L6_14(L7_15, L8_16)
      end
      if L6_14 ~= "" then
        if L6_14 ~= nil then
          if L6_14 ~= nil then
            if L6_14 == true then
              L6_14(L7_15)
            end
          end
          __rndIASpawnTask = L6_14
        end
      end
      if L6_14 ~= nil then
        if L6_14 == true then
          L6_14(L7_15)
        end
      end
      __rndIATalkTask = L6_14
      L8_16 = "setRndIACreateSuccess"
      L9_17 = true
      L6_14(L7_15, L8_16, L9_17)
      L2_10 = true
    end
  else
  end
  return L2_10
end
function setupRndInfoActorNPC(A0_18, A1_19, A2_20)
  local L3_21, L4_22, L5_23, L6_24, L7_25
  L4_22 = A2_20
  L3_21 = A2_20.getPuppet
  L3_21 = L3_21(L4_22)
  function L4_22(A0_26)
    return A0_26 > (Fn_getPcPosRot() - L3_21:getWorldPos()):Length()
  end
  has_got_in = L4_22
  L4_22 = false
  L5_23 = false
  while true do
    L6_24 = __exitSandbox
    if L6_24 == false and L4_22 ~= true then
      L6_24 = infoActorManager
      L7_25 = L6_24
      L6_24 = L6_24.sendEvent
      L6_24(L7_25, "setRndIAWaiting", true)
      L6_24 = has_got_in
      L7_25 = 10
      L6_24 = L6_24(L7_25)
      if L6_24 == true then
        L6_24 = infoActorManager
        L7_25 = L6_24
        L6_24 = L6_24.sendEvent
        L6_24(L7_25, "setRndIAWaiting", false)
        L6_24 = GameDatabase
        L7_25 = L6_24
        L6_24 = L6_24.get
        L6_24 = L6_24(L7_25, ggd.GlobalSystemFlags__ExclusionFlag)
        if L6_24 ~= true then
          L6_24 = setEventManageFlags
          L7_25 = true
          L6_24(L7_25)
          if L5_23 == false then
            L6_24 = Fn_turnNpc
            L7_25 = A2_20
            L6_24(L7_25)
            L6_24 = A1_19.notice_mot
            if L6_24 ~= "" then
              L7_25 = A2_20
              L6_24 = A2_20.playMotion
              L6_24(L7_25, A1_19.notice_mot)
            else
              L7_25 = A2_20
              L6_24 = A2_20.playMotion
              L6_24(L7_25, "greeting")
            end
            L6_24 = A1_19.notice_voice
            if L6_24 ~= "" then
              L6_24 = waitSeconds
              L7_25 = 1
              L6_24(L7_25)
              L6_24 = Sound
              L7_25 = L6_24
              L6_24 = L6_24.playSE
              L6_24(L7_25, A1_19.notice_voice, 1, "", puppet)
            end
            while true do
              L6_24 = __exitSandbox
              if L6_24 == false then
                L7_25 = A2_20
                L6_24 = A2_20.isMotionEnd
                L6_24 = L6_24(L7_25)
              end
              if L6_24 ~= true then
                L6_24 = wait
                L6_24()
              end
            end
            L5_23 = true
          end
          L7_25 = A2_20
          L6_24 = A2_20.setMoveOption
          L6_24(L7_25, {arrivedLength = 2, runLength = 10})
          repeat
            L6_24 = Fn_getPcPosRot
            L6_24 = L6_24()
            L7_25 = A2_20.move
            L7_25(A2_20, {
              {pos = L6_24}
            })
            L7_25 = wait
            L7_25()
            L7_25 = has_got_in
            L7_25 = L7_25(2)
            if L7_25 == true then
              L7_25 = A2_20.playMotion
              L7_25(A2_20, "stay")
              L4_22 = true
              break
            else
              L7_25 = has_got_in
              L7_25 = L7_25(30)
              if L7_25 == false then
                L7_25 = A2_20.playMotion
                L7_25(A2_20, "stay")
                L7_25 = infoActorManager
                L7_25 = L7_25.sendEvent
                L7_25(L7_25, "setRndIAReCreateWait", 0)
                break
              end
            end
            L7_25 = wait
            L7_25()
            L7_25 = __exitSandbox
          until L7_25 == true
          L6_24 = setEventManageFlags
          L7_25 = false
          L6_24(L7_25)
        end
      end
      L6_24 = wait
      L6_24()
    end
  end
  if L4_22 == true then
    L6_24 = Fn_turnNpc
    L7_25 = A2_20
    L6_24(L7_25)
    function L6_24()
      infoActorManager:sendEvent("talkEnd", A0_18, A1_19, __charaName)
      if A1_19.end_exec_func ~= "" and A1_19.end_exec_func ~= nil then
        if __rndIAKaiwaEndTask ~= nil and __rndIAKaiwaEndTask:isRunning() == true then
          __rndIAKaiwaEndTask:abort()
        end
        __rndIAKaiwaEndTask = _G[A1_19.end_exec_func](A2_20)
      end
      GameDatabase:set(ggd[string.format("Savedata__InfoActor__kaiwa_%03d", A0_18)], true)
    end
    L7_25 = nil
    if A1_19.low_marker == true then
      L7_25 = "B"
    end
    Fn_setKaiwaDemo(A2_20:getPuppet(), A1_19.kaiwa_id, L6_24, true, nil, nil, L7_25, A1_19.title_id):try_init()
    Fn_setKaiwaDemo(A2_20:getPuppet(), A1_19.kaiwa_id, L6_24, true, nil, nil, L7_25, A1_19.title_id):waitForReady()
    Fn_setKaiwaDemo(A2_20:getPuppet(), A1_19.kaiwa_id, L6_24, true, nil, nil, L7_25, A1_19.title_id):try_start()
    Fn_setKaiwaDemo(A2_20:getPuppet(), A1_19.kaiwa_id, L6_24, true, nil, nil, L7_25, A1_19.title_id):try_init()
    Fn_setKaiwaDemo(A2_20:getPuppet(), A1_19.kaiwa_id, L6_24, true, nil, nil, L7_25, A1_19.title_id):waitForReady()
    Fn_setKaiwaDemo(A2_20:getPuppet(), A1_19.kaiwa_id, L6_24, true, nil, nil, L7_25, A1_19.title_id):try_start()
    infoActorManager:sendEvent("setKaiwaVisible", __charaName, true)
    infoActorManager:sendEvent("setIAMgrTblFixed", A0_18, true)
  end
end
function getPCNearNodeName()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38
  L0_27 = ""
  L1_28 = Fn_getPcPosRot
  L1_28 = L1_28()
  L2_29 = {}
  L3_30 = 1
  L4_31 = __assetRoot
  L4_31 = L4_31.getChildCount
  L4_31 = L4_31(L5_32)
  for L8_35 = 1, L4_31 do
    L9_36 = __assetRoot
    L10_37 = L9_36
    L9_36 = L9_36.getChild
    L11_38 = L8_35
    L9_36 = L9_36(L10_37, L11_38)
    if L9_36 ~= nil then
      L11_38 = L9_36
      L10_37 = L9_36.getName
      L10_37 = L10_37(L11_38)
      L11_38 = string
      L11_38 = L11_38.match
      L11_38 = L11_38(L10_37, "locator2_rnd")
      if L11_38 ~= nil then
        L11_38 = {}
        L2_29[L3_30] = L11_38
        L11_38 = L2_29[L3_30]
        L11_38.name = L10_37
        L11_38 = __assetRoot
        L11_38 = L11_38.worldToLocal
        L11_38 = L11_38(L11_38, L9_36:getTranslation(), L9_36:getRotation())
        L2_29[L3_30].distance = Fn_get_distance(L1_28, L11_38)
        L3_30 = L3_30 + 1
      end
    end
  end
  L5_32(L6_33, L7_34)
  for L9_36, L10_37 in L6_33(L7_34) do
    L11_38 = false
    for _FORV_15_ = 1, L5_32 do
      if L10_37.name == __createdNodeTable[_FORV_15_] then
        L11_38 = true
        break
      end
    end
    if L11_38 == false then
      L0_27 = L10_37.name
      __createdNodeTable[L5_32 + 1] = L10_37.name
      break
    end
  end
  return L0_27
end
function isValidSpawnArea(A0_39, A1_40)
  local L2_41
  L2_41 = false
  if infoActorManager:sendEvent("getIAMgrTblSpawnArea", A0_39) == "" then
    for _FORV_6_, _FORV_7_ in pairs(A1_40) do
      if _FORV_7_ == __subAreaName then
        L2_41 = true
        break
      end
    end
  end
  return L2_41
end
function kill()
  __assetRoot = nil
  if __exclusionFlag == true then
    setEventManageFlags(false)
  end
  killIATask(__charaName)
  if __charaName ~= "" then
    infoActorManager:sendEvent("iaDisappearChara", __charaName)
  end
  __charaName = ""
  if __rndEventData ~= nil then
    __rndEventData:try_term()
  end
  __rndEventData = nil
  __exitSandbox = true
  exitSandbox()
end
setExitCallback(kill)
function sbRun()
  local L0_42, L1_43
  __runFlag = true
end
function setEvarea2Asset(A0_44)
  local L1_45
  __assetRoot = A0_44
end
function setSubAreaName(A0_46)
  local L1_47
  if A0_46 == nil then
    __subAreaName = ""
  else
    __subAreaName = A0_46
  end
end
function killIATask(A0_48)
  if __charaName == A0_48 then
    if __rndIATalkTask ~= nil and __rndIATalkTask:isRunning() == true then
      __rndIATalkTask:abort()
    end
    __rndIATalkTask = nil
    if __rndIASpawnTask ~= nil and __rndIASpawnTask:isRunning() == true then
      __rndIASpawnTask:abort()
    end
    __rndIASpawnTask = nil
    if __rndIAKaiwaEndTask ~= nil and __rndIAKaiwaEndTask:isRunning() == true then
      __rndIAKaiwaEndTask:abort()
    end
    __rndIAKaiwaEndTask = nil
  end
end
function isKillRndIANPC()
  local L0_49, L1_50, L2_51
  L0_49 = true
  L1_50 = __charaName
  if L1_50 ~= "" then
    L1_50 = Fn_findNpc
    L2_51 = __charaName
    L1_50 = L1_50(L2_51)
    if L1_50 ~= nil then
      L2_51 = L1_50.getPuppet
      L2_51 = L2_51(L1_50)
      if L2_51 ~= nil and L2_51:isStopped() == false and Fn_isInSightTarget(L2_51, 1) == true then
        L0_49 = false
      end
    end
  end
  return L0_49
end
