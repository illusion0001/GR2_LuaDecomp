dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
function Initialize()
  Fn_pcSensorOff("pcspheresensor2_island_01")
  Fn_pcSensorOff("pcspheresensor2_island_02")
  Fn_pcSensorOff("pcspheresensor2_island_03")
  Fn_pcSensorOff("pcspheresensor2_island_04")
  Fn_pcSensorOff("pcspheresensor2_island_05")
  Fn_pcSensorOff("pcspheresensor2_island_06")
  Fn_pcSensorOff("pccubesensormulti2_catwarp_05_02")
  Fn_pcSensorOff("pccubesensormulti2_catwarp_05_03")
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = {L1_1}
  L1_1 = Player
  L1_1 = L1_1.kAbility_RocketJump
  L1_1 = {}
  L1_1.rocket_jump_interlock = false
  L2_2 = Fn_lockPlayerAbility
  L3_3 = L0_0
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L2_2 = Fn_setCatWarpCheckPoint
  L3_3 = "locator2_pc_restart_pos_ep09_k"
  L2_2(L3_3)
  L2_2 = findGameObject2
  L3_3 = "Node"
  L4_4 = "locator2_litho_01"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = invokeTask
  function L4_4()
    local L0_10
    L0_10 = false
    while true do
      if L0_10 == false and Fn_getDistanceToPlayer(L2_2) > 30 then
        L0_10 = true
        Fn_naviSet(L2_2)
      elseif L0_10 == true and Fn_getDistanceToPlayer(L2_2) <= 10 then
        L0_10 = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L3_3 = L3_3(L4_4)
  litho_task = L3_3
  L3_3 = Fn_missionStart
  L3_3()
  L3_3 = Fn_userCtrlOn
  L3_3()
  repeat
    L3_3 = wait
    L3_3()
    L3_3 = Fn_sendEventComSb
    L4_4 = "isLithographStart"
    L3_3 = L3_3(L4_4)
  until L3_3
  L3_3 = litho_task
  L4_4 = L3_3
  L3_3 = L3_3.abort
  L3_3(L4_4)
  litho_task = nil
  L3_3 = Fn_sendEventComSb
  L4_4 = "setFirstHalfProcessEnd"
  L3_3(L4_4)
  repeat
    L3_3 = wait
    L3_3()
    L3_3 = Fn_sendEventComSb
    L4_4 = "isFirstHalfProcessEnd"
    L3_3 = L3_3(L4_4)
  until L3_3
  L3_3 = Fn_userCtrlOff
  L3_3()
  L3_3 = Fn_lookAtObject
  L4_4 = "pcspheresensor2_island_01"
  L3_3 = L3_3(L4_4)
  L4_4 = waitSeconds
  L5_5 = 1
  L4_4(L5_5)
  L4_4 = invokeTask
  function L5_5()
    Fn_sendEventComSb("activeAreaIngame", 1)
  end
  L4_4(L5_5)
  L4_4 = Fn_pcSensorOn
  L5_5 = "pccubesensormulti2_catwarp_05_02"
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.abort
  L4_4(L5_5)
  L4_4 = waitSeconds
  L5_5 = 0.3
  L4_4(L5_5)
  L4_4 = GameDatabase
  L5_5 = L4_4
  L4_4 = L4_4.get
  L6_6 = ggd
  L6_6 = L6_6.Savedata__Info__ep09__ep09_info_03
  L4_4 = L4_4(L5_5, L6_6)
  if L4_4 ~= 2 then
    L4_4 = HUD
    L5_5 = L4_4
    L4_4 = L4_4.info
    L6_6 = "ep09_info_03"
    L7_7 = false
    L4_4(L5_5, L6_6, L7_7)
  else
    L4_4 = GameDatabase
    L5_5 = L4_4
    L4_4 = L4_4.get
    L6_6 = ggd
    L6_6 = L6_6.Savedata__Info__ep09__ep09_info_03
    L4_4 = L4_4(L5_5, L6_6)
    if L4_4 == 2 then
      L4_4 = HUD
      L5_5 = L4_4
      L4_4 = L4_4.info
      L6_6 = "ep09_info_03"
      L7_7 = true
      L4_4(L5_5, L6_6, L7_7)
    end
  end
  L4_4 = wait
  L4_4()
  L4_4 = Fn_captionView
  L5_5 = "ep09_11001"
  L4_4(L5_5)
  L4_4 = Fn_unLockPlayerAbility
  L5_5 = L0_0
  L6_6 = L1_1
  L4_4(L5_5, L6_6)
  L4_4 = Fn_pcSensorOn
  L5_5 = "pcspheresensor2_island_01"
  L4_4(L5_5)
  L4_4 = Fn_userCtrlOn
  L4_4()
  L4_4 = waitSeconds
  L5_5 = 3.5
  L4_4(L5_5)
  L4_4 = Fn_tutorialCaption
  L5_5 = "mars_sidejump"
  L4_4(L5_5)
  L4_4 = Fn_missionView
  L5_5 = "ep09_09140"
  L6_6, L7_7 = nil, nil
  L8_8 = true
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L4_4 = waitSeconds
  L5_5 = 1.3
  L4_4(L5_5)
  L4_4 = Fn_naviSet
  L5_5 = findGameObject2
  L6_6 = "Node"
  L7_7 = "locator2_island_01"
  L9_9 = L5_5(L6_6, L7_7)
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L5_5(L6_6, L7_7))
  L4_4 = 0
  L5_5 = false
  L6_6 = invokeTask
  function L7_7()
    repeat
      L4_4 = L4_4 + 1
      if L4_4 >= 180 then
        Fn_tutorialCaptionKill()
        L5_5 = true
      end
      wait()
    until L5_5
  end
  L6_6 = L6_6(L7_7)
  L7_7 = waitPhase
  L7_7()
  L7_7 = Fn_setCatWarpCheckPoint
  L8_8 = "locator2_pc_restart_pos_ep09_k_02"
  L7_7(L8_8)
  L7_7 = Fn_naviKill
  L7_7()
  L7_7 = Fn_pcSensorOff
  L8_8 = "pcspheresensor2_island_01"
  L7_7(L8_8)
  L7_7 = Fn_pcSensorOn
  L8_8 = "pcspheresensor2_island_02"
  L7_7(L8_8)
  L7_7 = Fn_naviSet
  L8_8 = findGameObject2
  L9_9 = "Node"
  L9_9 = L8_8(L9_9, "locator2_island_02")
  L7_7(L8_8, L9_9, L8_8(L9_9, "locator2_island_02"))
  L7_7 = waitPhase
  L7_7()
  L7_7 = Fn_naviKill
  L7_7()
  L7_7 = Fn_pcSensorOff
  L8_8 = "pcspheresensor2_island_02"
  L7_7(L8_8)
  L8_8 = L6_6
  L7_7 = L6_6.abort
  L7_7(L8_8)
  L6_6 = nil
  L7_7 = Fn_tutorialCaptionKill
  L7_7()
  L7_7 = Fn_userCtrlOff
  L7_7()
  L7_7 = Fn_setCatWarpCheckPoint
  L8_8 = "locator2_pc_restart_pos_ep09_k_03"
  L7_7(L8_8)
  L7_7 = Fn_lookAtObject
  L8_8 = "pcspheresensor2_island_03"
  L7_7 = L7_7(L8_8)
  L8_8 = waitSeconds
  L9_9 = 1
  L8_8(L9_9)
  L8_8 = invokeTask
  function L9_9()
    Fn_sendEventComSb("activeAreaIngame", 2)
  end
  L8_8(L9_9)
  L8_8 = Fn_pcSensorOff
  L9_9 = "pccubesensormulti2_catwarp_05_02"
  L8_8(L9_9)
  L8_8 = Fn_pcSensorOn
  L9_9 = "pccubesensormulti2_catwarp_05_03"
  L8_8(L9_9)
  L8_8 = Fn_captionViewWait
  L9_9 = "ep09_11003"
  L8_8(L9_9)
  L9_9 = L7_7
  L8_8 = L7_7.abort
  L8_8(L9_9)
  L8_8 = Fn_pcSensorOn
  L9_9 = "pcspheresensor2_island_03"
  L8_8(L9_9)
  L8_8 = Fn_userCtrlOn
  L8_8()
  L8_8 = Fn_tutorialCaption
  L9_9 = "mars_sidejump"
  L8_8(L9_9)
  L8_8 = waitSeconds
  L9_9 = 1.3
  L8_8(L9_9)
  L8_8 = Fn_naviSet
  L9_9 = findGameObject2
  L9_9 = L9_9("Node", "locator2_island_03")
  L8_8(L9_9, L9_9("Node", "locator2_island_03"))
  L8_8 = 0
  L9_9 = false
  waitPhase()
  Fn_setCatWarpCheckPoint("locator2_pc_restart_pos_ep09_k_04")
  Fn_naviKill()
  Fn_pcSensorOff("pcspheresensor2_island_03")
  Fn_pcSensorOn("pcspheresensor2_island_04")
  Fn_naviSet(findGameObject2("Node", "locator2_island_04"))
  waitPhase()
  Fn_setCatWarpCheckPoint("locator2_pc_restart_pos_ep09_k_05")
  Fn_naviKill()
  Fn_pcSensorOff("pcspheresensor2_island_04")
  Fn_pcSensorOn("pcspheresensor2_island_05")
  Fn_naviSet(findGameObject2("Node", "locator2_island_05"))
  waitPhase()
  Fn_setCatWarpCheckPoint("locator2_pc_restart_pos_ep09_k_06")
  Fn_naviKill()
  Fn_pcSensorOff("pcspheresensor2_island_05")
  Fn_pcSensorOn("pcspheresensor2_island_06")
  Fn_naviSet(findGameObject2("Node", "locator2_island_06"))
  waitPhase()
  Fn_naviKill()
  Fn_pcSensorOff("pcspheresensor2_island_06")
  if Fn_sendEventComSb("com_a_hdl", "Lithograph", "lithograph_05") ~= nil then
    Fn_sendEventComSb("com_a_hdl", "Lithograph", "lithograph_05"):setFarCulling(false)
  end
  invokeTask(function()
    repeat
      L8_8 = L8_8 + 1
      if L8_8 >= 180 then
        Fn_tutorialCaptionKill()
        L9_9 = true
      end
      wait()
    until L9_9
  end):abort()
  Fn_tutorialCaptionKill()
  waitSeconds(1)
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("synchroArea")
  Fn_kaiwaDemoView("ep09_00145k")
  if Fn_sendEventComSb("com_a_hdl", "Lithograph", "lithograph_05") ~= nil then
    Fn_sendEventComSb("com_a_hdl", "Lithograph", "lithograph_05"):setFarCulling(true)
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_11, L1_12
end
function pccubesensormulti2_catwarp_ep09_k_OnLeave()
  print("pccubesensormulti2_catwarp_ep09_k_OnLeave")
  invokeTask(function()
    Fn_catWarp()
    waitSeconds(1)
    Fn_captionViewLock("ep09_11005")
    HUD:info("ep09_info_03", true)
  end)
end
