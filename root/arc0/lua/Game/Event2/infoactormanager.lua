import("GameDatabase")
import("EventData")
import("Player")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/InfoActorCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Table/InfoActorTable.lua")
__chara_list = {}
__exitSandbox = false
__iAActive = false
__rndIAActive = false
__iAAssetUpdate = false
__infoActorManagerTable = {}
__assetTable = {}
__subAreaTable = {}
__fixIACreateComplete = false
__fixIACreateSuccess = false
__iAMgrUpdatePhase = false
__rndIACreateComplete = false
__rndIACreateSuccess = false
__rndIAActiveWait = 0
__rndIAReCreateWait = 0
__rndIAWaiting = false
_requset_ready = false
_is_ready = false
_is_lively_event = false
function main()
  infoactorManagementTask = invokeSystemTask(function()
    infoactorManagement()
  end)
  wait()
end
function infoactorManagement()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = setupInfoActorTable
  L0_0()
  L0_0 = {}
  L1_1 = {}
  L2_2 = {}
  L3_3, L4_4 = nil, nil
  L5_5 = setIAWait
  L5_5 = L5_5()
  while true do
    if L6_6 == false then
      while true do
        if L6_6 then
          L6_6()
        end
      end
      L6_6()
      if L6_6 == true then
        L6_6()
        L0_0 = L6_6
        if L0_0 ~= nil then
          for L9_9, _FORV_10_ in L6_6(L7_7) do
            if _FORV_10_ == "po_b_root" then
              L0_0[L9_9] = "po_a_root"
            elseif _FORV_10_ == "up_b_root" then
              L0_0[L9_9] = "up_a_root"
            end
          end
        end
        __subAreaTable = L6_6
        L6_6(L7_7)
        if L6_6 == true then
          if L6_6 == true then
            L6_6()
            L6_6()
          end
        end
        for L9_9, _FORV_10_ in L6_6(L7_7) do
          if isValidSpawnGameFlag(_FORV_10_.game_flag) ~= nil and isValidSpawnGameFlag(_FORV_10_.game_flag) == false then
            iaDisappearChara(L9_9)
          end
        end
        if L6_6 ~= true then
        elseif L6_6 == true then
          if not L6_6 then
            L6_6(L7_7)
            L6_6(L7_7)
          else
            L6_6(L7_7)
          end
        end
        L6_6()
        if L6_6 == true then
          if L6_6 > 0 then
            if L6_6 > 0 then
              L3_3 = L6_6
              if L3_3 ~= nil then
                if L3_3 ~= L4_4 then
                  __rndIAActiveWait = L6_6
                  if L4_4 ~= nil then
                    L6_6(L7_7)
                  end
                elseif L6_6 <= 0 then
                  L9_9 = L3_3
                  if L6_6 ~= nil then
                    if L7_7 == true then
                      L9_9 = "isKillRndIANPC"
                      if L7_7 == true then
                        L7_7(L8_8)
                      end
                    end
                  end
                end
                if L6_6 <= 0 then
                  L9_9 = L4_4
                  if L6_6 == nil then
                    if not L7_7 then
                      L7_7(L8_8)
                    else
                      L7_7(L8_8)
                    end
                  end
                end
                L4_4 = L3_3
              end
            end
          end
        end
        L9_9 = L7_7(L8_8)
        ;({
          [4] = L7_7(L8_8)
        })[1] = L7_7
        ;({
          [4] = L7_7(L8_8)
        })[2] = L8_8
        ;({
          [4] = L7_7(L8_8)
        })[3] = L9_9
        L1_1 = L6_6
        L9_9 = L7_7(L8_8)
        ;({
          [4] = L7_7(L8_8)
        })[1] = L7_7
        ;({
          [4] = L7_7(L8_8)
        })[2] = L8_8
        ;({
          [4] = L7_7(L8_8)
        })[3] = L9_9
        L2_2 = L6_6
      end
      L6_6(L7_7)
    end
  end
  if L5_5 ~= nil then
    if L6_6 == true then
      L6_6(L7_7)
      L5_5 = nil
    end
  end
end
function setupInfoActorTable()
  for _FORV_3_, _FORV_4_ in pairs(info_actor_tbl) do
    __infoActorManagerTable[_FORV_3_] = {
      spawn_wait = info_actor_tbl[_FORV_3_].spawn_wait,
      talk_end = false,
      spawn_area = "",
      fixed = false
    }
  end
end
function setIAActive()
  if GameDatabase:get(ggd.GlobalSystemFlags__AreaStart) == true and GameDatabase:get(ggd.Savedata__EventManageFlags__InfoActor) == true and GameDatabase:get(ggd.InfoActorFlags__Running) == true and GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) == false then
    if __iAActive == false then
      __iAActive = true
      __iAAssetUpdate = true
      __rndIAActiveWait = 0
    end
  elseif __iAActive == true then
    __iAActive = false
    __iAAssetUpdate = false
    updateIAEvent()
  end
end
function setIAGameFlag()
  local L0_10, L1_11
end
function isAreaTableUpdate(A0_12, A1_13)
  local L2_14
  L2_14 = false
  if #A0_12 > 0 then
    if #A1_13 == 0 or #A0_12 ~= #A1_13 then
      L2_14 = true
    else
      for _FORV_6_, _FORV_7_ in pairs(A0_12) do
        if _FORV_7_ ~= A1_13[_FORV_6_] then
          L2_14 = true
          break
        end
      end
    end
  end
  return L2_14
end
function updateSpawnWait()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22
  for L3_18, L4_19 in L0_15(L1_16) do
    L5_20 = __infoActorManagerTable
    L5_20 = L5_20[L3_18]
    L5_20 = L5_20.spawn_wait
    if L5_20 > 0 then
      L6_21 = info_actor_tbl
      L6_21 = L6_21[L3_18]
      L6_21 = L6_21.spawn_trigger
      if L6_21 ~= "" then
        L7_22 = ggd
        L7_22 = L7_22["Savedata__EventFinishedFlags__" .. L6_21]
        if L7_22 and GameDatabase:get(L7_22) == 1 then
          __infoActorManagerTable[L3_18].spawn_wait = L5_20 - 1
        end
      else
        L7_22 = __infoActorManagerTable
        L7_22 = L7_22[L3_18]
        L7_22.spawn_wait = 0
      end
    end
  end
end
function rndIAWaitUpdate()
  if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionType) == "free" then
    if __rndIAActiveWait > 0 then
      __rndIAActiveWait = __rndIAActiveWait - 1
    end
    if __rndIAWaiting == true and 0 < __rndIAReCreateWait then
      __rndIAReCreateWait = __rndIAReCreateWait - 1
    end
  end
end
function setIAWait()
  return invokeTask(function()
    while __exitSandbox == false do
      updateSpawnWait()
      rndIAWaitUpdate()
      waitSeconds(1)
    end
  end)
end
function getActiveSandbox(A0_23)
  return nil
end
function createIASandbox(A0_24, A1_25)
  createSandbox2(A0_24):setString("g_filename", A1_25)
  createSandbox2(A0_24):try_init()
  createSandbox2(A0_24):waitForReady()
  createSandbox2(A0_24):setGameObject("mother2", mother2)
  createSandbox2(A0_24):setGameObject("infoActorManager", g_own)
  createSandbox2(A0_24):try_start()
  return (createSandbox2(A0_24))
end
function createFixIASandbox(A0_26)
  local L1_27, L2_28
  __fixIACreateComplete = false
  __fixIACreateSuccess = false
  L1_27 = "ia_fix_npc"
  L2_28 = getActiveSandbox
  L2_28 = L2_28(L1_27)
  if L2_28 ~= nil then
    L2_28:sendEvent("setAssetTable", __assetTable)
    L2_28:sendEvent("setRootAreaTable", A0_26)
    L2_28:sendEvent("setUpdateFlag", true)
  else
    L2_28 = createIASandbox(L1_27, "/Game/Event2/Common/InfoActorFixCommon.lua")
    L2_28:sendEvent("setAssetTable", __assetTable)
    L2_28:sendEvent("setRootAreaTable", A0_26)
    L2_28:sendEvent("sbRun")
    L2_28:sendEvent("setUpdateFlag", true)
  end
  while __exitSandbox == false and __fixIACreateComplete ~= true do
    wait()
  end
  if __fixIACreateSuccess == false then
    while __exitSandbox == false do
      waitSeconds(0.1)
      if not (0 + 0.1 >= 10) then
        else
          __iAAssetUpdate = false
        end
      end
    end
  __iAMgrUpdatePhase = false
end
function createRndIASandbox(A0_29)
  local L1_30, L2_31, L3_32
  L1_30 = getEvarea2Asset
  L2_31 = A0_29
  L1_30 = L1_30(L2_31)
  if L1_30 ~= nil then
    L2_31 = "ia_rnd_"
    L3_32 = A0_29
    L2_31 = L2_31 .. L3_32
    L3_32 = getActiveSandbox
    L3_32 = L3_32(L2_31)
    if L3_32 == nil then
      L3_32 = createIASandbox(L2_31, "/Game/Event2/Common/InfoActorRndCommon.lua")
      L3_32:sendEvent("setEvarea2Asset", L1_30)
      L3_32:sendEvent("setSubAreaName", A0_29)
      L3_32:sendEvent("sbRun")
      while __exitSandbox == false and __rndIACreateComplete ~= true do
        wait()
      end
      if __rndIACreateSuccess == false then
        eventWaitSeconds(10)
      else
        __rndIAReCreateWait = IA_RESTART_TIME
      end
    end
  else
    L2_31 = eventWaitSeconds
    L3_32 = 5
    L2_31(L3_32)
  end
end
function setRndIAActive()
  if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionType) == "free" then
    if __rndIAActive == false then
      __rndIAActiveWait = IA_ACTIVE_WAIT
      __rndIAReCreateWait = 0
      startSpEvent()
    end
    __rndIAActive = true
  elseif __rndIAActive == true then
    __rndIAActive = false
    killAllRndIASandbox()
  end
end
function killFixIASandbox()
  if findGameObject2("Sandbox2", "ia_fix_npc") ~= nil and findGameObject2("Sandbox2", "ia_fix_npc"):isRunning() == true then
    findGameObject2("Sandbox2", "ia_fix_npc"):sendEvent("kill")
  end
end
function killRndIASandbox(A0_33)
  if findGameObject2("Sandbox2", "ia_rnd_" .. A0_33) ~= nil and findGameObject2("Sandbox2", "ia_rnd_" .. A0_33):isRunning() == true then
    findGameObject2("Sandbox2", "ia_rnd_" .. A0_33):sendEvent("kill")
  end
  for _FORV_5_, _FORV_6_ in pairs(__infoActorManagerTable) do
    if __infoActorManagerTable[_FORV_5_].spawn_area == A0_33 then
      __infoActorManagerTable[_FORV_5_].spawn_area = ""
    end
  end
end
function killAllRndIASandbox()
  local L0_34, L2_35
  for _FORV_3_ = 1, #L2_35 do
    killRndIASandbox(__subAreaTable[_FORV_3_])
  end
end
function isActiveArea(A0_36, A1_37)
  local L2_38, L3_39, L4_40, L5_41
  L2_38 = false
  for _FORV_6_ = 1, #A0_36 do
    if A0_36[_FORV_6_] == A1_37 then
      L2_38 = true
      break
    end
  end
  return L2_38
end
function loadAssetTable(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47
  for L4_46, L5_47 in L1_43(L2_44) do
    for _FORV_10_, _FORV_11_ in pairs(__assetTable) do
      if _FORV_10_ == L5_47 then
        break
      end
    end
    if true == false then
      __assetTable[L5_47] = loadFileAsset("evb", "evx/" .. L5_47 .. "_infoactor")
      if __assetTable[L5_47] ~= nil then
        __assetTable[L5_47]:wait()
      end
    end
  end
end
function getEvarea2Asset(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59
  for L4_52, L5_53 in L1_49(L2_50) do
    if L5_53 ~= nil then
      L7_55 = L5_53
      L6_54 = L5_53.findBundle
      L6_54 = L6_54(L7_55, L8_56)
      if L6_54 ~= nil then
        L7_55 = L6_54.getChildCount
        L7_55 = L7_55(L8_56)
        for L11_59 = 1, L7_55 do
          if L6_54:getChild(L11_59) ~= nil and string.match(L6_54:getChild(L11_59):getName(), "locator2_rnd_spawn_") ~= nil then
            return L6_54
          end
        end
      end
    end
  end
  return L1_49
end
function eventWaitSeconds(A0_60)
  local L1_61
  L1_61 = 0
  while __exitSandbox == false and A0_60 >= L1_61 do
    L1_61 = L1_61 + 0.1
    waitSeconds(0.1)
  end
end
function exitsandbox()
  __npc_list = {}
  killNpcAll()
  __infoActorManagerTable = {}
  assetTableClear()
  __subAreaTable = {}
  killFixIASandbox()
  killAllRndIASandbox()
  __exitSandbox = true
  _is_lively_event = false
end
setExitCallback(exitsandbox)
function setFixIACreateSuccess(A0_62)
  local L1_63
  __fixIACreateSuccess = A0_62
end
function getFixIACreateSuccess()
  local L0_64, L1_65
  L0_64 = __fixIACreateSuccess
  return L0_64
end
function setFixIACreateComplete(A0_66)
  local L1_67
  __fixIACreateComplete = A0_66
end
function getIAMgrTblSpawnWait(A0_68)
  local L1_69
  L1_69 = __infoActorManagerTable
  L1_69 = L1_69[A0_68]
  L1_69 = L1_69.spawn_wait
  return L1_69
end
function setIAMgrTblSpawnArea(A0_70, A1_71)
  local L2_72
  L2_72 = __infoActorManagerTable
  L2_72 = L2_72[A0_70]
  L2_72.spawn_area = A1_71
end
function getIAMgrTblSpawnArea(A0_73)
  local L1_74
  L1_74 = __infoActorManagerTable
  L1_74 = L1_74[A0_73]
  L1_74 = L1_74.spawn_area
  return L1_74
end
function setIAMgrTblFixed(A0_75, A1_76)
  local L2_77
  L2_77 = __infoActorManagerTable
  L2_77 = L2_77[A0_75]
  L2_77.fixed = A1_76
end
function getIAMgrUpdatePhase()
  local L0_78, L1_79
  L0_78 = __iAMgrUpdatePhase
  return L0_78
end
function setRndIAWaiting(A0_80)
  local L1_81
  __rndIAWaiting = A0_80
end
function getIANPCHandle(A0_82)
  local L1_83
  L1_83 = __chara_list
  L1_83 = L1_83[A0_82]
  L1_83 = L1_83.generator_handle
  return L1_83
end
function setRndIACreateComplete(A0_84)
  local L1_85
  __rndIACreateComplete = A0_84
end
function setRndIACreateSuccess(A0_86)
  local L1_87
  __rndIACreateSuccess = A0_86
end
function isValidTalkEnd(A0_88)
  local L1_89, L2_90
  L1_89 = false
  L2_90 = __infoActorManagerTable
  L2_90 = L2_90[A0_88]
  L2_90 = L2_90.talk_end
  if L2_90 == false then
    L1_89 = true
  end
  return L1_89
end
function isValidFixed(A0_91)
  local L1_92, L2_93
  L1_92 = false
  L2_93 = __infoActorManagerTable
  L2_93 = L2_93[A0_91]
  L2_93 = L2_93.fixed
  if L2_93 == false then
    L1_92 = true
  end
  return L1_92
end
function isKaiwaVisible(A0_94)
  local L1_95
  L1_95 = __chara_list
  L1_95 = L1_95[A0_94]
  L1_95 = L1_95.kaiwa
  return L1_95
end
function setKaiwaVisible(A0_96, A1_97)
  local L2_98
  L2_98 = __chara_list
  L2_98 = L2_98[A0_96]
  L2_98.kaiwa = A1_97
end
function setGameFlag(A0_99, A1_100)
  local L2_101
  L2_101 = __chara_list
  L2_101 = L2_101[A0_99]
  L2_101.game_flag = A1_100
end
function setSpawnArea(A0_102, A1_103)
  local L2_104
  L2_104 = __chara_list
  L2_104 = L2_104[A0_102]
  L2_104.spawn_area = A1_103
end
function setSpawnSandbox(A0_105, A1_106)
  local L2_107
  L2_107 = __chara_list
  L2_107 = L2_107[A0_105]
  L2_107.sandbox_name = A1_106
end
function setRndIAReCreateWait(A0_108)
  local L1_109
  __rndIAReCreateWait = A0_108
end
function talkEnd(A0_110, A1_111, A2_112)
  if A1_111.mob_release == true then
    invokeTask(function()
      waitSeconds(3)
      if __chara_list[A2_112].generator ~= nil then
        __chara_list[A2_112].generator:changeMob()
      end
    end)
  end
  __infoActorManagerTable[A0_110].talk_end = true
end
function assetTableClear()
  for _FORV_3_, _FORV_4_ in pairs(__assetTable) do
    __assetTable[_FORV_3_] = nil
  end
  __assetTable = {}
end
function updateIAEvent()
  __iAMgrUpdatePhase = true
  killNpcAll()
  killAllRndIASandbox()
  killFixIASandbox()
  __assetTable = {}
  killSpEvent()
  __iAAssetUpdate = true
end
function startSpEvent()
  if __ft21_findnpc == nil then
    __ft21_findnpc = invokeTask(function()
      local L0_113
      L0_113 = 0
      while true do
        __ft21_puppet_01 = findGameObject2("Puppet", "fix_ia_ft21_00020k_01")
        __ft21_puppet_02 = findGameObject2("Puppet", "fix_ia_ft21_00020k_02")
        __ft21_npc_01 = findGameObject2("NpcGenerator", "fix_ia_ft21_00020k_01")
        __ft21_npc_02 = findGameObject2("NpcGenerator", "fix_ia_ft21_00020k_02")
        if (not __ft21_puppet_01 or not __ft21_puppet_02) and not (L0_113 > 300) then
          wait()
          L0_113 = L0_113 + 1
        end
      end
      if __ft21_puppet_01 then
        if findGameObject2("PlayerSensor", "ft21_spevent") == nil then
          __sensor_ft21 = createGameObject2("PlayerSensor")
          __enter_func_name = "pccubesensor2_ft21_spevent_OnEnter"
          __leave_func_name = "pccubesensor2_ft21_spevent_OnLeave"
          __sensor_ft21:setName("ft21_spevent")
          __sensor_ft21:setDetectBehavior(1)
          __sensor_ft21:addBox(Vector(5, 3, 5))
          __sensor_ft21:setOnEnter(__enter_func_name)
          __sensor_ft21:setOnLeave(__leave_func_name)
          __ft21_puppet_01:appendChild(__sensor_ft21)
          __sensor_ft21:try_init()
          __sensor_ft21:waitForReady()
          __sensor_ft21:try_start()
          function pccubesensor2_ft21_spevent_OnEnter()
            local L0_114, L1_115
            __ft21_sensor_flag = true
          end
          function pccubesensor2_ft21_spevent_OnLeave()
            local L0_116, L1_117
            __ft21_sensor_flag = false
          end
          __mot_list = {
            handclap = "wom01_handclap_00"
          }
          Fn_loadNpcEventMotion(__ft21_npc_01, __mot_list)
          Fn_loadNpcEventMotion(__ft21_npc_02, __mot_list)
        end
        if __ft21_eventtask == nil then
          __ft21_eventtask = invokeTask(function()
            local L0_118, L1_119
            L0_118 = false
            L1_119 = 0
            while true do
              if __ft21_sensor_flag then
                if HUD:getCurrentGesture() == "lively_action_8" then
                  L0_118 = true
                elseif L0_118 == true then
                  L0_118 = false
                  if L1_119 == 0 then
                    L1_119 = 2
                    __ft21_sensor_task_01 = invokeTask(function()
                      local L0_120
                      L0_120 = Fn_turnNpc
                      L0_120(__ft21_npc_01)
                      L0_120 = Sound
                      L0_120 = L0_120.playSE
                      L0_120(L0_120, "w17_920", 1, "", __ft21_npc_01)
                      L0_120 = Fn_playNpcEventMotion
                      L0_120(__ft21_npc_01, "wom01_handclap_00", false, 0.3, true)
                      L0_120 = {}
                      L0_120.isRepeat = true
                      Fn_turnNpc(__ft21_npc_01, __ft21_npc_02)
                      __ft21_npc_01:playMotion("listen_00", L0_120)
                      L1_119 = L1_119 - 1
                    end)
                    __ft21_sensor_task_02 = invokeTask(function()
                      local L0_121
                      L0_121 = waitSeconds
                      L0_121(0.3 + RandI(1, 3) / 10)
                      L0_121 = Fn_turnNpc
                      L0_121(__ft21_npc_02)
                      L0_121 = Sound
                      L0_121 = L0_121.playSE
                      L0_121(L0_121, "w17_910", 1, "", __ft21_npc_02)
                      L0_121 = Fn_playNpcEventMotion
                      L0_121(__ft21_npc_02, "wom01_handclap_00", false, 0.3, true)
                      L0_121 = {}
                      L0_121.isRepeat = true
                      Fn_turnNpc(__ft21_npc_02, __ft21_npc_01)
                      __ft21_npc_02:playMotion("talk_cid_03", L0_121)
                      L1_119 = L1_119 - 1
                    end)
                    while L1_119 ~= 0 do
                      wait()
                    end
                  end
                end
              else
                L0_118 = false
              end
              wait()
            end
          end)
        end
      end
    end)
  end
end
function killSpEvent()
  if __sensor_ft21 then
    __sensor_ft21:setActive(false)
    __sensor_ft21:kill()
    __sensor_ft21 = nil
  end
  if __ft21_sensor_task_01 then
    __ft21_sensor_task_01:abort()
    __ft21_sensor_task_01 = nil
  end
  if __ft21_sensor_task_02 then
    __ft21_sensor_task_02:abort()
    __ft21_sensor_task_02 = nil
  end
  if __ft21_findnpc then
    __ft21_findnpc:abort()
    __ft21_findnpc = nil
  end
  if __ft21_eventtask then
    __ft21_eventtask:abort()
    __ft21_eventtask = nil
  end
  __ft21_npc_01 = nil
  __ft21_npc_02 = nil
  __ft21_puppet_01 = nil
  __ft21_puppet_02 = nil
end
function setNpc(A0_122, A1_123)
  local L3_124
  L3_124 = __chara_list
  L3_124[A0_122] = {
    generator = A1_123,
    puppet = A1_123:getPuppet(),
    kaiwa = false,
    game_flag = "",
    spawn_area = "",
    sandbox_name = ""
  }
end
function isNpcList(A0_125)
  local L1_126, L2_127
  L1_126 = false
  L2_127 = __chara_list
  L2_127 = L2_127[A0_125]
  if L2_127 ~= nil then
    L1_126 = true
  end
  return L1_126
end
function killNpcAll()
  local L0_128, L1_129, L2_130, L3_131
  for L3_131, _FORV_4_ in L0_128(L1_129) do
    iaDisappearChara(L3_131)
  end
  __chara_list = L0_128
end
function iaDisappearChara(A0_132)
  if isNpcList(A0_132) == true then
    if __chara_list[A0_132].puppet ~= nil then
      Fn_disableKaiwaDemo(__chara_list[A0_132].puppet:getName())
      if __chara_list[A0_132].kaiwa == true then
        Fn_disableMarkerSet(__chara_list[A0_132].puppet)
      end
    end
    if __chara_list[A0_132].sandbox_name ~= nil and __chara_list[A0_132].sandbox_name ~= "" and findGameObject2("Sandbox2", __chara_list[A0_132].sandbox_name) ~= nil and findGameObject2("Sandbox2", __chara_list[A0_132].sandbox_name):isRunning() == true then
      findGameObject2("Sandbox2", __chara_list[A0_132].sandbox_name):sendEvent("killIATask", A0_132)
    end
    __chara_list[A0_132] = nil
    Fn_disappearNpc(A0_132)
  end
end
function requestReady()
  _is_ready = false
  invokeTask(function()
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    _is_ready = true
  end)
end
function isObjectReady()
  local L0_133, L1_134
  L0_133 = _is_ready
  return L0_133
end
function requestStart()
  invokeTask(function()
    startAllGameObjects()
  end)
end
function requestMarkerActive(A0_135)
  if getActiveSandbox("ia_fix_npc") then
    getActiveSandbox("ia_fix_npc"):sendEvent("Fn_setSelfSandBoxMarker", A0_135)
  end
end
function requestNpcActive(A0_136)
  if getActiveSandbox("ia_fix_npc") then
    getActiveSandbox("ia_fix_npc"):sendEvent("Fn_setSelfSandBoxNpcActive", A0_136)
  end
end
function requestPauseActive(A0_137)
  _is_lively_event = not A0_137
  if not A0_137 then
    killAllRndIASandbox()
  end
end
