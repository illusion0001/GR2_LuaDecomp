dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
function Initialize()
  Fn_userCtrlOff()
  _sdemo_cut01 = SDemo.create("cut01")
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0
  L0_0 = Fn_sendEventComSb
  L0_0("requestAnotherKittenSpawn", "locator2_a_kitten_start_pos_ep19_f")
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L0_0 = L0_0("requestAnotherKittenSpawnEnd")
  until L0_0
  L0_0 = Fn_sendEventComSb
  L0_0("requestAnotherKittenWarp", "locator2_a_kitten_start_pos_ep19_f")
  L0_0 = Fn_setCatWarpCheckPoint
  L0_0("locator2_restart_pos_ep19_f")
  L0_0 = Fn_sendEventComSb
  L0_0 = L0_0("requestAnotherKittenPuppet")
  Fn_missionStart()
  Fn_kaiwaDemoView("ep19_00310k")
  Fn_userCtrlOn()
  Player:setStay(false)
  Fn_missionView("ep19_05000")
  waitSeconds(1.3)
  HUD:naviSetPochiDistanceDensity0(0)
  HUD:naviSetPochiDistanceDensity100(-1)
  Fn_naviSet(L0_0)
  waitPhase()
  HUD:naviSetActivate(false, false)
  Fn_playSupporterEventMotion(L0_0, "treasure_open", 0, 0.25)
  invokeTask(function()
    waitSeconds(0.5)
    Sound:playSE("pc_atk_S", 1, L0_0)
  end)
  Fn_sendEventComSb("lithographStart")
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  Fn_resetPcPos("locator2_pc_move_pos_01", Player.kReset_Floating)
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  _sdemo_cut01:set("locator2_cam_f02", Fn_getPlayer(), true, Vector(0, 0.5, 0))
  _sdemo_cut01:play()
  Fn_sendEventComSb("requestJemActive", 1)
  Fn_sendEventComSb("requestAnotherKittenWarp", "locator2_a_kitten_move_pos_ep19_f")
  Player:setStay(false)
  Fn_userCtrlAllOff()
  Fn_coercionGravityRevert()
  Fn_captionViewWait("ep19_05001")
  _sdemo_cut01:set("locator2_cam_f03", L0_0, true, Vector(0, 0.5, 0))
  _sdemo_cut01:play()
  Fn_sendEventComSb("requestAnotherKittenReleaseIdle")
  Fn_sendEventComSb("requestAnotherKittenMove", "locator2_a_kitten_move_pos_ep19_f_end", "locator2_a_kitten_move_pos_ep19_f_middle")
  Fn_resetPcPos("locator2_pc_move_pos_02")
  Fn_captionViewWait("ep19_05002")
  Fn_captionViewWait("ep19_05003")
  _sdemo_cut01:set("locator2_cam_f03", L0_0, false, Vector(0, 0.5, 0))
  _sdemo_cut01:stop(1)
  waitSeconds(1.5)
  Fn_kaiwaDemoView("ep19_00320k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
