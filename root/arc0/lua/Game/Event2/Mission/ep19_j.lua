dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
function Initialize()
  Fn_pcSensorOff("pccubesensor2_01")
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestAnotherKittenSpawn"
  L2_2 = "locator2_a_kitten_start_pos_ep19_j"
  L0_0(L1_1, L2_2, Supporter.FirstAction.Ground, true, false, false, true, false)
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestAnotherKittenSpawnEnd"
    L0_0 = L0_0(L1_1)
  until L0_0
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestAnotherKittenWarp"
  L2_2 = "locator2_a_kitten_start_pos_ep19_j"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_restart_pos_ep19_j"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestAnotherKittenPuppet"
  L0_0 = L0_0(L1_1)
  function L1_1()
    local L0_3, L1_4
  end
  L2_2 = Fn_sendEventComSb
  L2_2("setSensorVisible", false)
  L2_2 = Fn_missionStart
  L2_2(L1_1)
  L2_2 = Fn_userCtrlOn
  L2_2()
  L2_2 = Fn_missionView
  L2_2("ep19_10000")
  L2_2 = waitSeconds
  L2_2(1.3)
  L2_2 = Fn_naviSet
  L2_2(findGameObject2("Node", "locator2_navi_pos_01"))
  L2_2 = Fn_playSupporterEventMotion
  L2_2(L0_0, "special_wait", -1, 0)
  L2_2 = findGameObject2
  L2_2 = L2_2("Node", "locator2_navi_pos_01")
  while not is_check_eye_node(L2_2, 40, 1) do
    wait()
  end
  Fn_captionView("ep19_10001")
  Fn_pcSensorOn("pccubesensor2_01")
  waitPhase()
  Player:setStay(true)
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_naviKill()
  GameDatabase:set(ggd.EventFlags__ep19__flag04, 1)
  Fn_blackout()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_5, L1_6
end
