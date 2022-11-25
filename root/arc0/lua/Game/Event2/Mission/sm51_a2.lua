dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm51_common.lua")
check_clow_chase_point = false
check_course_out = false
check_point_restart = "locator2_pc_start_pos"
check_point_box_restart = "locator2_grab_point_00"
sdemo = nil
check_point_phase = 1
check_point_phase_list = {
  "locator2_cp_guide_01",
  "locator2_check_point_npc_01"
}
function Initialize()
  print("init")
  sdemo = SDemo.create("sm51_sdemo")
  Fn_sendEventComSb("SweetsboxInit", check_point_box_restart)
  while Fn_sendEventComSb("GetSweetsboxReady") == false do
    print("\231\148\159\230\136\144\228\184\173")
    wait()
  end
end
function Ingame()
  sm51_InitializeArea()
  Fn_missionStart()
  durability = Fn_sendEventComSb("Durability_NumBack")
  HUD:counter99_99SetTextID("sm51_09000")
  HUD:counter99_99SetMax(4)
  HUD:counter99_99SetNum(1)
  HUD:counter99_99SetVisible(true)
  HUD:counter999SetTextID("sm51_09001")
  HUD:counter999SetNum(durability)
  HUD:counter999SetVisible(true)
  Player:setAttrTune(Player.kAttrTune_Mars)
  Fn_sendEventComSb("SweetsboxGrabObject")
  Fn_userCtrlOn()
  Fn_sendEventComSb("SetNpcActive", "check_point_npc_02")
  sm51_target = "sm51_00104"
  sm51_navi = "locator2_cp_guide_02"
  sm51_caption = "sm51_00103"
  sm51_MissionTarget(sm51_target, sm51_navi, sm51_caption)
  sm51_NextPointEnter("pccubesensor2_clow_appearance_01", "locator2_kit_restart_02", "locator2_grab_point_02", true)
  Fn_naviKill()
  Fn_userCtrlOff()
  Fn_sendEventComSb("Durability_NumIn", durability)
  sm51_DurabilityChekcer():abort()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
