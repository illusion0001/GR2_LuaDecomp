import("common")
import("GameDatabase")
import("HUD")
import("math")
import("DeltaTimer")
import("Font")
_sandbox_exit = false
_deltaTimeStop = false
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = debugPrint
  L1_1 = "mother2\229\129\180\227\129\167\227\129\175\227\130\162\227\130\175\227\130\187\227\130\185\227\130\164\227\131\179\227\130\184\227\130\177\227\131\188\227\130\191\227\131\188\227\129\175off\227\129\171\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\229\136\157\229\155\158\232\181\183\229\139\149\227\129\175\229\188\183\229\136\182\231\181\130\228\186\134\227\129\171\227\129\170\227\130\138\227\129\190\227\129\153\227\128\130"
  L0_0(L1_1)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.GlobalSystemFlags__AccessIndicator
  L3_3 = 1
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = DeltaTimer
  L1_1 = L0_0
  L0_0 = L0_0.new
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.start
  L1_1(L2_2)
  L1_1 = createSandbox2
  L2_2 = "father2"
  L1_1 = L1_1(L2_2)
  sb_father2 = L1_1
  L1_1 = sb_father2
  L2_2 = L1_1
  L1_1 = L1_1.setString
  L3_3 = "g_filename"
  L4_4 = "/Game/Event2/father2.lua"
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = sb_father2
  L2_2 = L1_1
  L1_1 = L1_1.try_init
  L1_1(L2_2)
  L1_1 = sb_father2
  L2_2 = L1_1
  L1_1 = L1_1.waitForReady
  L1_1(L2_2)
  L1_1 = sb_father2
  L2_2 = L1_1
  L1_1 = L1_1.setGameObject
  L3_3 = "mother2"
  L4_4 = g_own
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = sb_father2
  L2_2 = L1_1
  L1_1 = L1_1.setBool
  L3_3 = "disableAbility"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = sb_father2
  L2_2 = L1_1
  L1_1 = L1_1.try_start
  L1_1(L2_2)
  L1_1 = wait
  L1_1()
  while true do
    L1_1 = sb_father2
    L2_2 = L1_1
    L1_1 = L1_1.sendEvent
    L3_3 = "initialized"
    L1_1 = L1_1(L2_2, L3_3)
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = true
  L2_2 = nil
  if L1_1 then
    L3_3 = createSandbox2
    L4_4 = "mob_sandbox"
    L3_3 = L3_3(L4_4)
    L2_2 = L3_3
    L4_4 = L2_2
    L3_3 = L2_2.setString
    L5_5 = "g_filename"
    L6_6 = "/Game/Event2/mob_sandbox.lua"
    L3_3(L4_4, L5_5, L6_6)
    L4_4 = L2_2
    L3_3 = L2_2.try_init
    L3_3(L4_4)
    L4_4 = L2_2
    L3_3 = L2_2.waitForReadyAsync
    function L5_5(A0_10)
      A0_10:setGameObject("mother2", g_own)
      A0_10:try_start()
    end
    L3_3(L4_4, L5_5)
  end
  L3_3 = createSandbox2
  L4_4 = "photo_item"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setString
  L6_6 = "g_filename"
  L7_7 = "/Game/Event2/photo_item.lua"
  L4_4(L5_5, L6_6, L7_7)
  L5_5 = L3_3
  L4_4 = L3_3.try_init
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.waitForReadyAsync
  function L6_6(A0_11)
    A0_11:setGameObject("mother2", g_own)
    A0_11:try_start()
  end
  L4_4(L5_5, L6_6)
  L4_4 = createSandbox2
  L5_5 = "npcManager"
  L4_4 = L4_4(L5_5)
  L6_6 = L4_4
  L5_5 = L4_4.setString
  L7_7 = "g_filename"
  L8_8 = "/Game/Event2/npcmanager.lua"
  L5_5(L6_6, L7_7, L8_8)
  L6_6 = L4_4
  L5_5 = L4_4.try_init
  L5_5(L6_6)
  L6_6 = L4_4
  L5_5 = L4_4.waitForReadyAsync
  function L7_7(A0_12)
    A0_12:setGameObject("mother2", g_own)
    A0_12:try_start()
  end
  L5_5(L6_6, L7_7)
  L5_5 = createSandbox2
  L6_6 = "infoActorManager"
  L5_5 = L5_5(L6_6)
  L7_7 = L5_5
  L6_6 = L5_5.setString
  L8_8 = "g_filename"
  L9_9 = "/Game/Event2/infoactormanager.lua"
  L6_6(L7_7, L8_8, L9_9)
  L7_7 = L5_5
  L6_6 = L5_5.try_init
  L6_6(L7_7)
  L7_7 = L5_5
  L6_6 = L5_5.waitForReadyAsync
  function L8_8(A0_13)
    A0_13:setGameObject("mother2", g_own)
    A0_13:try_start()
  end
  L6_6(L7_7, L8_8)
  L6_6 = createSandbox2
  L7_7 = "livelyManager2"
  L6_6 = L6_6(L7_7)
  L8_8 = L6_6
  L7_7 = L6_6.setString
  L9_9 = "g_filename"
  L7_7(L8_8, L9_9, "/Game/Event2/livelymanager2.lua")
  L8_8 = L6_6
  L7_7 = L6_6.try_init
  L7_7(L8_8)
  L8_8 = L6_6
  L7_7 = L6_6.waitForReadyAsync
  function L9_9(A0_14)
    A0_14:setGameObject("mother2", g_own)
    A0_14:setGameObject("soundManager", g_own:getGameObject("soundManager"))
    while not L4_4:isStarted() do
      if _sandbox_exit then
        return
      end
      wait()
    end
    A0_14:setGameObject("npcManager", L4_4)
    A0_14:try_start()
  end
  L7_7(L8_8, L9_9)
  L7_7 = createSandbox2
  L8_8 = "photoGhostManager"
  L7_7 = L7_7(L8_8)
  L9_9 = L7_7
  L8_8 = L7_7.setString
  L8_8(L9_9, "g_filename", "/Game/Event2/photoghostmanager.lua")
  L9_9 = L7_7
  L8_8 = L7_7.try_init
  L8_8(L9_9)
  L9_9 = L7_7
  L8_8 = L7_7.waitForReadyAsync
  L8_8(L9_9, function(A0_15)
    A0_15:setGameObject("mother2", g_own)
    A0_15:try_start()
  end)
  L8_8 = createSandbox2
  L9_9 = "mineManager"
  L8_8 = L8_8(L9_9)
  L9_9 = L8_8.setString
  L9_9(L8_8, "g_filename", "/Game/Event2/minemanager3.lua")
  L9_9 = L8_8.try_init
  L9_9(L8_8)
  L9_9 = L8_8.waitForReadyAsync
  L9_9(L8_8, function(A0_16)
    A0_16:setGameObject("mother2", g_own)
    A0_16:try_start()
  end)
  L9_9 = createSandbox2
  L9_9 = L9_9("bgManager")
  sb_bgManager = L9_9
  L9_9 = sb_bgManager
  L9_9 = L9_9.setString
  L9_9(L9_9, "g_filename", "/Game/Event2/bgmanager.lua")
  L9_9 = sb_bgManager
  L9_9 = L9_9.try_init
  L9_9(L9_9)
  L9_9 = sb_bgManager
  L9_9 = L9_9.waitForReadyAsync
  L9_9(L9_9, function(A0_17)
    A0_17:setGameObject("mother2", g_own)
    A0_17:setGameObject("father2", sb_father2)
    A0_17:setGameObject("soundManager", g_own:getGameObject("soundManager"))
    while not L4_4:isStarted() do
      if _sandbox_exit then
        return
      end
      wait()
    end
    A0_17:setGameObject("npcManager", L4_4)
    while not L8_8:isStarted() do
      if _sandbox_exit then
        return
      end
      wait()
    end
    A0_17:setGameObject("mineManager", L8_8)
    if L2_2 then
      L2_2:waitForReady()
    end
    A0_17:try_start()
  end)
  L9_9 = createSandbox2
  L9_9 = L9_9("eventManager")
  sb_eventManager = L9_9
  L9_9 = sb_eventManager
  L9_9 = L9_9.setString
  L9_9(L9_9, "g_filename", "/Game/Event2/eventmanager.lua")
  L9_9 = sb_eventManager
  L9_9 = L9_9.try_init
  L9_9(L9_9)
  L9_9 = sb_eventManager
  L9_9 = L9_9.waitForReady
  L9_9(L9_9, function(A0_18)
    A0_18:setGameObject("mother2", g_own)
    A0_18:setGameObject("father2", sb_father2)
    A0_18:setGameObject("demoManager", g_own:getGameObject("demoManager"))
    A0_18:setGameObject("soundManager", g_own:getGameObject("soundManager"))
    A0_18:setGameObject("enemyManager", g_own:getGameObject("enemyManager"))
    while not sb_bgManager:isStarted() do
      if _sandbox_exit then
        return
      end
      wait()
    end
    A0_18:setGameObject("bgManager", sb_bgManager)
    while not L4_4:isStarted() do
      if _sandbox_exit then
        return
      end
      wait()
    end
    A0_18:setGameObject("npcManager", L4_4)
    while not L8_8:isStarted() do
      if _sandbox_exit then
        return
      end
      wait()
    end
    A0_18:setGameObject("mineManager", L8_8)
    A0_18:try_start()
    g_own:getGameObject("soundManager"):sendEvent("requestFirstAmb")
  end)
  L9_9 = wait
  L9_9()
  repeat
    L9_9 = wait
    L9_9()
    L9_9 = _deltaTimeStop
  until L9_9
  L9_9 = L0_0.stop
  L9_9(L0_0)
  L9_9 = print
  L9_9("milli second = " .. L0_0:getMSecond())
  L9_9 = print
  L9_9("second = " .. L0_0:getSecond())
  function L9_9(A0_19)
    local L1_20
    if A0_19 == "po_a_root" then
      L1_20 = 1
      return L1_20
    elseif A0_19 == "bu_d_root" then
      L1_20 = 1
      return L1_20
    elseif A0_19 == "ve_crane_root" then
      L1_20 = 1
      return L1_20
    elseif A0_19 == "lo_a_root" then
      L1_20 = 2
      return L1_20
    elseif A0_19 == "mi_a_root" then
      L1_20 = 3
      return L1_20
    elseif A0_19 == "up_a_root" then
      L1_20 = 4
      return L1_20
    elseif A0_19 == "dt_a_root" then
      L1_20 = 5
      return L1_20
    elseif A0_19 == "g1_crane_pd_01" then
      L1_20 = 5
      return L1_20
    elseif A0_19 == "cc_a_root" then
      L1_20 = 6
      return L1_20
    elseif A0_19 == "ed_a_root" then
      L1_20 = 7
      return L1_20
    elseif A0_19 == "id_a_root" then
      L1_20 = 8
      return L1_20
    end
    L1_20 = nil
    return L1_20
  end
  HUD:menuSetCallback(HUD.kCallback_GetPhotoAreaNo, L9_9)
end
function callBackExitSandbox()
  _sandbox_exit = true
  sb_father2 = nil
  sb_bgManager = nil
  sb_eventManager = nil
  _deltaTimeStop = true
  HUD:menuSetCallback(HUD.kCallback_GetPhotoAreaNo)
  print("exit mother2")
end
setExitCallback(callBackExitSandbox)
function motherExitSandbox()
  exitSandbox()
end
function getBackgroundElement2Handle(A0_21)
  if sb_bgManager and sb_bgManager:isRunning() then
    return sb_bgManager:sendEvent("getObjectHandle", A0_21)
  end
  return nil
end
function getBackgroundElement2HandleTable()
  if sb_bgManager and sb_bgManager:isRunning() then
    return sb_bgManager:sendEvent("getObjectHandleTable")
  end
  return nil
end
function requestSetNextMissionName(A0_22)
  if sb_eventManager and sb_eventManager:isRunning() then
    sb_eventManager:sendEvent("requestSetNextMissionName", A0_22)
    sb_eventManager:sendEvent("requestNextMission")
  end
end
function isExceptionMissionComplite()
  if sb_eventManager and sb_eventManager:isRunning() then
    return sb_eventManager:sendEvent("isExceptionMissionComplite")
  end
  return false
end
function isExceptionMissionReady()
  if sb_eventManager and sb_eventManager:isRunning() then
    return sb_eventManager:sendEvent("isExceptionMissionReady")
  end
  return false
end
function runExceptionMission()
  if sb_eventManager and sb_eventManager:isRunning() then
    sb_eventManager:sendEvent("runExceptionMission")
  end
end
function requestEnemyManager(A0_23)
  if A0_23.target_select_off then
    debugPrint("\227\130\168\227\131\141\227\131\159\227\131\188\227\131\158\227\131\141\227\131\188\227\130\184\227\131\163\227\129\171\229\175\190\227\129\151\227\129\166\227\128\129\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\130\146\229\191\152\227\130\140\227\130\139\227\130\136\227\129\134\227\129\171\228\190\157\233\160\188\227\129\151\227\129\190\227\129\151\227\129\159")
    g_own:getGameObject("enemyManager"):requestEnemyTargetSelectAllOff(true)
  end
  if A0_23.target_select_on then
    invokeTask(function()
      debugPrint("\227\130\168\227\131\141\227\131\159\227\131\188\227\131\158\227\131\141\227\131\188\227\130\184\227\131\163\227\129\171\229\175\190\227\129\151\227\129\166\227\128\129\239\188\147\231\167\146\229\190\140\227\129\171\233\128\154\229\184\184\229\139\149\228\189\156\227\129\153\227\130\139\227\130\136\227\129\134\227\129\171\228\190\157\233\160\188\227\129\151\227\129\190\227\129\153")
      waitSeconds(3)
      g_own:getGameObject("enemyManager"):requestEnemyTargetSelectAllOff(false)
      debugPrint("\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\130\146\233\129\184\230\138\158\227\129\153\227\130\139\227\130\136\227\129\134\227\129\171\230\136\187\227\129\151\227\129\190\227\129\151\227\129\159")
    end)
  end
end
function DBG_deltaTimerStop()
  local L0_24, L1_25
  _deltaTimeStop = true
end
function debugPrint(A0_26)
  print(" < mother2 > " .. A0_26)
end
