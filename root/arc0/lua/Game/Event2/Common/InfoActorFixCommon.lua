import("GameDatabase")
import("EventData")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/InfoActorCommon.lua")
dofile("/Game/Event2/Common/InfoActorNPCFunc.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Table/InfoActorTable.lua")
__exitSandbox = false
__runFlag = false
__assetTable = {}
__rootAreaTable = {}
__requestFlag = false
__onceSetup = true
__fixIASpawnTask = {}
__fixIAKaiwaEndTask = {}
__fixEventData = nil
function main()
  setAttachSandbox("infoActorManager")
  while __runFlag == false do
    if __exitSandbox == true then
      return
    end
    wait()
  end
  if createIAFixEventData() == false then
    infoActorManager:sendEvent("setFixIACreateComplete", true)
    kill()
    return
  end
  invokeTask(function()
    Ingame()
  end)
end
function Ingame()
  while __exitSandbox == false do
    while __requestFlag == false do
      if __exitSandbox == true then
        return
      end
      wait()
    end
    __requestFlag = false
    if __onceSetup == false then
      createIAFixEventData()
    end
    __onceSetup = false
    requestFixInfoActorNPC()
    infoActorManager:sendEvent("setFixIACreateComplete", true)
    wait()
  end
end
function createIAFixEventData()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22
  L0_0 = false
  if L1_1 ~= nil then
    for L4_4, L5_5 in L1_1(L2_2) do
      L6_6 = __assetTable
      L6_6 = L6_6[L4_4]
      L7_7 = L6_6
      L6_6 = L6_6.getRoot
      L6_6 = L6_6(L7_7)
      L7_7 = L6_6.getChildCount
      L7_7 = L7_7(L8_8)
      for L11_11 = 1, L7_7 do
        L13_13 = L6_6
        L12_12 = L6_6.getChild
        L14_14 = L11_11
        L12_12 = L12_12(L13_13, L14_14)
        if L12_12 ~= nil then
          L14_14 = L12_12
          L13_13 = L12_12.getName
          L13_13 = L13_13(L14_14)
          L14_14 = string
          L14_14 = L14_14.find
          L15_15 = L13_13
          L16_16 = "evarea2_ia_fix_"
          L15_15 = L14_14(L15_15, L16_16)
          if L15_15 ~= nil then
            L16_16 = L12_12.getChildCount
            L16_16 = L16_16(L17_17)
            for L20_20 = 1, L16_16 do
              L22_22 = L12_12
              L21_21 = L12_12.getChild
              L21_21 = L21_21(L22_22, L20_20)
              if L21_21 ~= nil then
                L22_22 = string
                L22_22 = L22_22.match
                L22_22 = L22_22(L21_21:getName(), "locator2_fix")
                if L22_22 ~= nil then
                  L22_22 = "ia_fix_"
                  L22_22 = L22_22 .. string.sub(L13_13, L15_15 + 1, string.len(L13_13))
                  __fixEventData = findGameObject2("EventData", L22_22)
                  if __fixEventData == nil then
                    __fixEventData = EventData:create(L22_22, nil, L12_12)
                    __fixEventData:try_init()
                    __fixEventData:waitForReady()
                    __fixEventData:try_start()
                    L0_0 = true
                  end
                  break
                end
              end
            end
          end
        end
      end
    end
  end
  return L0_0
end
function requestFixInfoActorNPC()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33
  L0_23 = 1
  L1_24 = {}
  for L5_28, L6_29 in L2_25(L3_26) do
    L7_30 = L6_29.lively
    if L7_30 == false then
      L7_30 = isValidSpawnGameFlag
      L8_31 = L6_29.spawn_game_flag
      L7_30 = L7_30(L8_31)
      L8_31 = L6_29.use_game
      if L8_31 == true then
        L8_31 = isValidSpawnGameFlag
        L9_32 = L6_29.spawn_game_flag
        L8_31 = L8_31(L9_32)
        if L8_31 ~= true then
          L8_31 = isValidSpawnTrigger
          L9_32 = L6_29.spawn_trigger
          L8_31 = L8_31(L9_32)
          if L8_31 == true then
            L8_31 = isValidExclusionTrigger
            L9_32 = L6_29.exclusion_trigger
            L8_31 = L8_31(L9_32)
            if L8_31 == true then
              L8_31 = isValidSpawnTerm
              L9_32 = L6_29.spawn_term
              L8_31 = L8_31(L9_32)
              if L8_31 == true then
                L8_31 = infoActorManager
                L9_32 = L8_31
                L8_31 = L8_31.sendEvent
                L10_33 = "isValidFixed"
                L8_31 = L8_31(L9_32, L10_33, L0_23)
                if L8_31 == true then
                  L8_31 = isValidExclusionNPC
                  L9_32 = L6_29.exclusion_npc
                  L8_31 = L8_31(L9_32)
                  if L8_31 == true then
                    L8_31 = findGameObject2
                    L9_32 = "Node"
                    L10_33 = L6_29.spawn_node
                    L8_31 = L8_31(L9_32, L10_33)
                  end
                end
              end
            end
          end
        elseif L8_31 ~= nil then
          L8_31 = {}
          L8_31.name = ""
          L8_31.type = ""
          L8_31.node = ""
          L8_31.ia_idx = 0
          L9_32 = {}
          L8_31.ia_val = L9_32
          L8_31.use_gravity = true
          L1_24[L0_23] = L8_31
          L8_31 = L1_24[L0_23]
          L9_32 = L6_29.chara_type
          L8_31.type = L9_32
          L8_31 = L1_24[L0_23]
          L9_32 = L6_29.spawn_node
          L8_31.node = L9_32
          L8_31 = L1_24[L0_23]
          L9_32 = "fix_ia_npc_"
          L10_33 = L0_23
          L9_32 = L9_32 .. L10_33
          L8_31.name = L9_32
          L8_31 = string
          L8_31 = L8_31.find
          L9_32 = L6_29.spawn_node
          L10_33 = "locator2_fix_spawn_"
          L9_32 = L8_31(L9_32, L10_33)
          if L9_32 ~= nil then
            L10_33 = L1_24[L0_23]
            L10_33.name = "fix_ia_" .. string.sub(L6_29.spawn_node, L9_32 + 1, string.len(L6_29.spawn_node))
          end
          L10_33 = L1_24[L0_23]
          L10_33.ia_idx = L5_28
          L10_33 = L1_24[L0_23]
          L10_33.ia_val = L6_29
          L10_33 = L1_24[L0_23]
          L10_33.use_gravity = L6_29.use_gravity
          L10_33 = L6_29.chara_type
          if L10_33 == "no_model" then
            L10_33 = L1_24[L0_23]
            L10_33.disable_collision = true
          end
          L0_23 = L0_23 + 1
        end
      end
    end
  end
  if L1_24 ~= nil then
    L3_26(L4_27, L5_28)
    L3_26(L4_27)
    for L6_29, L7_30 in L3_26(L4_27) do
      L8_31 = infoActorManager
      L9_32 = L8_31
      L8_31 = L8_31.sendEvent
      L10_33 = "setNpc"
      L8_31(L9_32, L10_33, L6_29, L7_30)
    end
    for L6_29, L7_30 in L3_26(L4_27) do
      L8_31 = L7_30.ia_val
      L8_31 = L8_31.chara_type
      if L8_31 == "no_model" then
        L8_31 = Fn_findNpcPuppet
        L9_32 = L7_30.name
        L8_31 = L8_31(L9_32)
        L9_32 = L8_31
        L8_31 = L8_31.setAlpha
        L10_33 = 0
        L8_31(L9_32, L10_33)
      end
      L8_31 = infoActorManager
      L9_32 = L8_31
      L8_31 = L8_31.sendEvent
      L10_33 = "setSpawnSandbox"
      L8_31(L9_32, L10_33, L7_30.name, "ia_fix_npc")
      L8_31 = infoActorManager
      L9_32 = L8_31
      L8_31 = L8_31.sendEvent
      L10_33 = "isKaiwaVisible"
      L8_31 = L8_31(L9_32, L10_33, L7_30.name)
      if L8_31 == false then
        L8_31 = L7_30.ia_val
        L8_31 = L8_31.kaiwa_id
        if L8_31 ~= "" then
          L8_31 = isValidEnableKaiwa
          L9_32 = L7_30.ia_idx
          L10_33 = L7_30.ia_val
          L10_33 = L10_33.kaiwa_id
          L8_31 = L8_31(L9_32, L10_33)
          if L8_31 == true then
            function L8_31()
              infoActorManager:sendEvent("talkEnd", L7_30.ia_idx, L7_30.ia_val, L7_30.name)
              if L7_30.ia_val.end_exec_func ~= "" and L7_30.ia_val.end_exec_func ~= nil then
                if __fixIAKaiwaEndTask[L7_30.name] ~= nil and __fixIAKaiwaEndTask[L7_30.name]:isRunning() == true then
                  __fixIAKaiwaEndTask[L7_30.name]:abort()
                end
                __fixIAKaiwaEndTask[L7_30.name] = _G[L7_30.ia_val.end_exec_func](Fn_findNpc(L7_30.name))
              end
              GameDatabase:set(ggd[string.format("Savedata__InfoActor__kaiwa_%03d", L7_30.ia_idx)], true)
            end
            L9_32 = nil
            L10_33 = L7_30.ia_val
            L10_33 = L10_33.low_marker
            if L10_33 == true then
              L9_32 = "B"
            end
            L10_33 = nil
            if L7_30.ia_val.chara_type == "no_model" then
              L10_33 = "ui_keyguide_ac_05"
            end
            Fn_setKaiwaDemo(Fn_findNpcPuppet(L7_30.name), L7_30.ia_val.kaiwa_id, L8_31, true, "gui_marker_07", nil, L9_32, L7_30.ia_val.title_id, nil, L10_33)
            infoActorManager:sendEvent("setKaiwaVisible", L7_30.name, true)
          end
        end
      end
      L8_31 = L7_30.ia_val
      L8_31 = L8_31.start_mot
      if L8_31 ~= "" then
        L8_31 = Fn_findNpc
        L9_32 = L7_30.name
        L8_31 = L8_31(L9_32)
        L9_32 = L8_31
        L8_31 = L8_31.playMotion
        L10_33 = L7_30.ia_val
        L10_33 = L10_33.start_mot
        L8_31(L9_32, L10_33)
      end
      L8_31 = L7_30.ia_val
      L8_31 = L8_31.look_off
      if L8_31 == true then
        L8_31 = Fn_findNpc
        L9_32 = L7_30.name
        L8_31 = L8_31(L9_32)
        L9_32 = L8_31
        L8_31 = L8_31.setSightParam
        L10_33 = {}
        L10_33.valid = false
        L8_31(L9_32, L10_33)
      end
      L8_31 = infoActorManager
      L9_32 = L8_31
      L8_31 = L8_31.sendEvent
      L10_33 = "setGameFlag"
      L8_31(L9_32, L10_33, L7_30.name, L7_30.ia_val.spawn_game_flag)
      L8_31 = L7_30.ia_val
      L8_31 = L8_31.spawn_exec_func
      if L8_31 ~= "" then
        L8_31 = L7_30.ia_val
        L8_31 = L8_31.spawn_exec_func
        if L8_31 ~= nil then
          L8_31 = __fixIASpawnTask
          L9_32 = L7_30.name
          L8_31 = L8_31[L9_32]
          if L8_31 ~= nil then
            L8_31 = __fixIASpawnTask
            L9_32 = L7_30.name
            L8_31 = L8_31[L9_32]
            L9_32 = L8_31
            L8_31 = L8_31.isRunning
            L8_31 = L8_31(L9_32)
            if L8_31 == true then
              L8_31 = __fixIASpawnTask
              L9_32 = L7_30.name
              L8_31 = L8_31[L9_32]
              L9_32 = L8_31
              L8_31 = L8_31.abort
              L8_31(L9_32)
            end
          end
          L8_31 = __fixIASpawnTask
          L9_32 = L7_30.name
          L10_33 = _G
          L10_33 = L10_33[L7_30.ia_val.spawn_exec_func]
          L10_33 = L10_33(Fn_findNpc(L7_30.name))
          L8_31[L9_32] = L10_33
        end
      end
      L8_31 = ""
      L9_32 = findGameObject2
      L10_33 = "Node"
      L9_32 = L9_32(L10_33, L7_30.node)
      if L9_32 ~= nil then
        L10_33 = L9_32.getParent
        L10_33 = L10_33(L9_32)
        L9_32 = L10_33
        if L9_32 ~= nil then
          L10_33 = L9_32.getParent
          L10_33 = L10_33(L9_32)
          L9_32 = L10_33
          if L9_32 ~= nil then
            L10_33 = L9_32.getName
            L10_33 = L10_33(L9_32)
            L8_31 = L10_33
          end
        end
      end
      L10_33 = infoActorManager
      L10_33 = L10_33.sendEvent
      L10_33(L10_33, "setSpawnArea", L7_30.name, L8_31)
      break
    end
    L3_26()
    L6_29 = true
    L3_26(L4_27, L5_28, L6_29)
  end
end
function kill()
  __assetTable = {}
  __rootAreaTable = {}
  killIATask()
  if __fixEventData ~= nil then
    __fixEventData:try_term()
  end
  __fixEventData = nil
  __exitSandbox = true
  exitSandbox()
end
setExitCallback(kill)
function sbRun()
  local L0_34, L1_35
  __runFlag = true
end
function setAssetTable(A0_36)
  local L1_37
  __assetTable = A0_36
end
function setRootAreaTable(A0_38)
  local L1_39
  __rootAreaTable = A0_38
end
function setUpdateFlag(A0_40)
  local L1_41
  __requestFlag = A0_40
end
function killIATask()
  for _FORV_3_, _FORV_4_ in pairs(__fixIASpawnTask) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() == true then
      _FORV_4_:abort()
    end
    __fixIASpawnTask[_FORV_3_] = nil
  end
  __fixIASpawnTask = {}
  for _FORV_3_, _FORV_4_ in pairs(__fixIAKaiwaEndTask) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() == true then
      _FORV_4_:abort()
    end
    __fixIAKaiwaEndTask[_FORV_3_] = nil
  end
  __fixIAKaiwaEndTask = {}
end
function killSpawnTask(A0_42)
  if __fixIASpawnTask[A0_42] ~= nil then
    if __fixIASpawnTask[A0_42] ~= nil and __fixIASpawnTask[A0_42]:isRunning() == true then
      __fixIASpawnTask[A0_42]:abort()
    end
    __fixIASpawnTask[A0_42] = nil
  end
end
function killEndTask(A0_43)
  if __fixIAKaiwaEndTask[A0_43] ~= nil then
    if __fixIAKaiwaEndTask[A0_43] ~= nil and __fixIAKaiwaEndTask[A0_43]:isRunning() == true then
      __fixIAKaiwaEndTask[A0_43]:abort()
    end
    __fixIAKaiwaEndTask[A0_43] = nil
  end
end
