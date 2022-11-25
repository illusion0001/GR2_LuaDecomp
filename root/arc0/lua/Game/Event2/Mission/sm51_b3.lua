dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm51_common.lua")
CLOW_START_DELAY = 3
check_course_out = false
check_point_restart = "locator2_kit_restart_02"
check_point_box_restart = "locator2_grab_point_02"
check_point_phase = 1
sdemo = nil
check_point_phase_list = {
  "locator2_check_point_npc_02",
  "locator2_cp_guide_03",
  "locator2_check_point_npc_03"
}
function Initialize()
  sdemo = SDemo.create("sm51_sdemo")
  Fn_sendEventComSb("SweetsboxInit", "locator2_grab_point_05")
end
function Ingame()
  local L0_0, L1_1, L2_2
  L0_0 = sm51_InitializeArea
  L0_0()
  L0_0, L1_1, L2_2 = nil, nil, nil
  durability = Fn_sendEventComSb("Durability_NumBack")
  Player:setAttrTune(Player.kAttrTune_Mars)
  Fn_sendEventComSb("SweetsboxGrabObject")
  Fn_missionStart()
  HUD:counter99_99SetTextID("sm51_09000")
  HUD:counter99_99SetMax(4)
  HUD:counter99_99SetNum(3)
  HUD:counter99_99SetVisible(true)
  HUD:counter999SetTextID("sm51_09001")
  HUD:counter999SetNum(durability)
  HUD:counter999SetVisible(true)
  Fn_userCtrlOn()
  Fn_setNpcActive("check_point_npc_04", true)
  L2_2 = "sm51_01005"
  L1_1 = "locator2_cp_guide_04"
  L0_0 = "sm51_01006"
  sm51_MissionTarget(L0_0, L1_1, L2_2)
  sm51_NextPointEnter("pccubesensor2_check_point_clow_start_02", "locator2_kit_restart_06", "locator2_grab_point_06", true)
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
  local L0_3, L1_4
end
