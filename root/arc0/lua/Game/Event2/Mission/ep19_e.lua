dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
function Initialize()
  Fn_coercionPoseNomal()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestGhostCrowSpawn"
  L2_2 = "locator2_ghost_start_pos_ep19_e"
  L0_0(L1_1, L2_2)
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestGhostCrowSpawnEnd"
    L0_0 = L0_0(L1_1)
  until L0_0
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestGhostCrowWarp"
  L2_2 = "locator2_ghost_start_pos_ep19_e"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestGhostCrowPuppet"
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_createEffect
  L2_2 = "crw_glw "
  L3_3 = "ef_crw_glw_01"
  L4_4 = {}
  L4_4.obj = L0_0
  L4_4.joint = "bn_pelvis"
  L1_1 = L1_1(L2_2, L3_3, L4_4, true)
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestAnotherKittenSpawn"
  L4_4 = "locator2_a_kitten_start_pos_ep19_e"
  L2_2(L3_3, L4_4)
  repeat
    L2_2 = wait
    L2_2()
    L2_2 = Fn_sendEventComSb
    L3_3 = "requestAnotherKittenSpawnEnd"
    L2_2 = L2_2(L3_3)
  until L2_2
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestAnotherKittenWarp"
  L4_4 = "locator2_a_kitten_start_pos_ep19_e"
  L2_2(L3_3, L4_4)
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestAnotherKittenPuppet"
  L2_2 = L2_2(L3_3)
  L3_3 = Fn_sendEventComSb
  L4_4 = "requestAnotherKittenBrain"
  L3_3 = L3_3(L4_4)
  L4_4 = Fn_setAlpha
  L4_4(L2_2, false, 0, 10)
  L4_4 = Fn_setCatWarpCheckPoint
  L4_4("locator2_restart_pos_ep19_e")
  L4_4 = Fn_sendEventComSb
  L4_4("setSensorVisible", false)
  L4_4 = Fn_missionStart
  L4_4()
  L4_4 = Fn_userCtrlOn
  L4_4()
  L4_4 = Fn_missionView
  L4_4("ep19_04000")
  L4_4 = waitSeconds
  L4_4(1.3)
  L4_4 = HUD
  L4_4 = L4_4.naviSetPochiDistanceDensity0
  L4_4(L4_4, 0)
  L4_4 = HUD
  L4_4 = L4_4.naviSetPochiDistanceDensity100
  L4_4(L4_4, -1)
  L4_4 = Fn_naviSet
  L4_4(L0_0)
  while true do
    L4_4 = is_check_eye_node
    L4_4 = L4_4(L0_0, 40, 10)
    if not L4_4 then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = Sound
  L4_4 = L4_4.playSE
  L4_4(L4_4, "kit_535", 1, "", Fn_getPlayer())
  L4_4 = Fn_captionView
  L4_4("ep19_04001")
  L4_4 = waitPhase
  L4_4()
  L4_4 = Fn_naviKill
  L4_4()
  L4_4 = Fn_userCtrlOff
  L4_4()
  L4_4 = Player
  L4_4 = L4_4.setStay
  L4_4(L4_4, true)
  L4_4 = Sound
  L4_4 = L4_4.playSE
  L4_4(L4_4, "dm03_people_lost", 1, "", L0_0)
  L4_4 = invokeTask
  L4_4(function()
    local L0_5, L1_6, L2_7, L3_8
    L0_5 = 0.04
    for _FORV_4_ = 1, 50 do
      L1_1:setAlpha(1 - _FORV_4_ / 50)
      waitSeconds(L0_5)
    end
  end)
  L4_4 = Fn_setAlpha
  L4_4(L0_0, false, 2, 50)
  L4_4 = Fn_sendEventComSb
  L4_4("requestGhostCrowKill")
  L4_4 = Fn_captionViewWait
  L4_4("ep19_04002", 2)
  L4_4 = Fn_playSupporterEventMotion
  L4_4(L2_2, "idle_on_ground_loop", -1, 0.25)
  L4_4 = findGameObject2
  L4_4 = L4_4("Node", "locator2_a_kitten_aim")
  L4_4 = L4_4.getWorldPos
  L4_4 = L4_4(L4_4)
  Player:setLookAtIk(true, 1, L4_4)
  Sound:playSE("dm03_people_lost", 1, "", L2_2)
  Fn_setAlpha(L2_2, true, 2, 50)
  waitSeconds(1.5)
  Fn_captionViewWait("ep19_04003")
  Fn_lookAtObject("locator2_a_kitten_aim"):abort()
  Player:setLookAtIk(false, 1, L4_4)
  Fn_sendEventComSb("setSensorVisible", true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10
end
