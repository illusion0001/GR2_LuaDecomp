dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
function Initialize()
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_pcSensorOff("pccubesensor2_02")
  Fn_pcSensorOff("pccubesensor2_03")
  _sdemo_cut01 = SDemo.create("cut01")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestGhostCrowSpawn"
  L2_2 = "locator2_ghost_start_pos_ep19_a"
  L0_0(L1_1, L2_2)
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestGhostCrowSpawnEnd"
    L0_0 = L0_0(L1_1)
  until L0_0
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestGhostCrowIdle"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestGhostCrowPuppet"
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_sendEventComSb
  L2_2 = "requestGhostCrowBrain"
  L1_1 = L1_1(L2_2)
  L2_2 = Fn_setAlpha
  L3_3 = L0_0
  L2_2(L3_3, false, 0, 10)
  L2_2 = Fn_createEffect
  L3_3 = "crw_glw "
  L2_2 = L2_2(L3_3, "ef_crw_glw_01", {obj = L0_0, joint = "bn_pelvis"}, true)
  L3_3 = Fn_setAlpha
  L3_3(L2_2, false, 0, 10)
  L3_3 = Fn_setCatWarpCheckPoint
  L3_3("locator2_restart_pos_ep19_a")
  L3_3 = Fn_sendEventComSb
  L3_3("setSensorVisible", false)
  L3_3 = Fn_missionStart
  L3_3()
  L3_3 = Fn_captionViewWait
  L3_3("ep19_00100", 2)
  L3_3 = _sdemo_cut01
  L3_3 = L3_3.set
  L3_3(L3_3, "locator2_cam_01", L0_0, true, Vector(0, 0.5, 0))
  L3_3 = _sdemo_cut01
  L3_3 = L3_3.play
  L3_3(L3_3)
  L3_3 = Sound
  L3_3 = L3_3.playSE
  L3_3(L3_3, "dm03_people_repair", 1, "", L0_0)
  L3_3 = invokeTask
  L3_3(function()
    local L0_4, L1_5, L2_6, L3_7
    L0_4 = 0.04
    for _FORV_4_ = 1, 50 do
      L2_2:setAlpha(0 + _FORV_4_ / 50)
      waitSeconds(L0_4)
    end
  end)
  L3_3 = Fn_setAlpha
  L3_3(L0_0, true, 2, 50)
  L3_3 = Fn_captionViewWait
  L3_3("ep19_00106", 2)
  L3_3 = Fn_sendEventComSb
  L3_3("requestGhostCrowReleaseIdle")
  L3_3 = Fn_sendEventComSb
  L3_3("requestGhostCrowMove", "locator2_ghost_move_pos_ep19_a_end", "locator2_ghost_move_pos_ep19_a_middle", "20.0")
  L3_3 = Sound
  L3_3 = L3_3.playSE
  L3_3(L3_3, "kit_537", 1, "", Fn_getPlayer())
  L3_3 = Fn_captionViewWait
  L3_3("ep19_00107", 2)
  L3_3 = Fn_captionViewWait
  L3_3("ep19_00108", 3)
  L3_3 = _sdemo_cut01
  L3_3 = L3_3.stop
  L3_3(L3_3, 1)
  L3_3 = waitSeconds
  L3_3(1)
  L3_3 = Fn_kaiwaDemoView
  L3_3("ep19_00210k")
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = Fn_missionView
  L3_3("ep19_00101")
  L3_3 = waitSeconds
  L3_3(1.3)
  L3_3 = HUD
  L3_3 = L3_3.naviSetPochiDistanceDensity0
  L3_3(L3_3, 0)
  L3_3 = HUD
  L3_3 = L3_3.naviSetPochiDistanceDensity100
  L3_3(L3_3, -1)
  L3_3 = Fn_naviSet
  L3_3(L0_0)
  L3_3 = waitSeconds
  L3_3(2.5)
  L3_3 = Fn_captionView
  L3_3("ep19_00102")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_01")
  L3_3 = waitPhase
  L3_3()
  L3_3 = Fn_pcSensorOff
  L3_3("pccubesensor2_01")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_02")
  L3_3 = Sound
  L3_3 = L3_3.playSE
  L3_3(L3_3, "kit_535", 1, "", Fn_getPlayer())
  L3_3 = Fn_captionView
  L3_3("ep19_00103")
  L3_3 = waitPhase
  L3_3()
  L3_3 = Fn_naviKill
  L3_3()
  L3_3 = Sound
  L3_3 = L3_3.playSE
  L3_3(L3_3, "dm03_people_lost", 1, "", L0_0)
  L3_3 = invokeTask
  L3_3(function()
    local L0_8, L1_9, L2_10, L3_11
    L0_8 = 0.04
    for _FORV_4_ = 1, 50 do
      L2_2:setAlpha(1 - _FORV_4_ / 50)
      waitSeconds(L0_8)
    end
  end)
  L3_3 = Fn_setAlpha
  L3_3(L0_0, false, 2, 50)
  L3_3 = Fn_sendEventComSb
  L3_3("requestGhostCrowKill")
  L3_3 = Fn_captionViewWait
  L3_3("ep19_00104")
  L3_3 = Fn_captionView
  L3_3("ep19_00105")
  L3_3 = findGameObject2
  L3_3 = L3_3("Node", "locator2_litho_01")
  Fn_naviSet(L3_3)
  Fn_pcSensorOff("pccubesensor2_02")
  Fn_pcSensorOn("pccubesensor2_03")
  waitPhase()
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_12, L1_13
end
