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
  Fn_pcSensorOff("pccubesensor2_cp_guide_03")
  Fn_pcSensorOff("pccubesensor2_check_point_03")
  sdemo = SDemo.create("sm51_sdemo")
  Fn_sendEventComSb("SweetsboxInit", "locator2_grab_point_04")
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
  HUD:counter99_99SetNum(2)
  HUD:counter99_99SetVisible(true)
  HUD:counter999SetTextID("sm51_09001")
  HUD:counter999SetNum(durability)
  HUD:counter999SetVisible(true)
  Fn_userCtrlOn()
  check_point_phase = 3
  Fn_sendEventComSb("SetNpcActive", "check_point_npc_03")
  Fn_sendEventComSb("StartNpcAction", "check_point_npc_03")
  if check_point_phase == 3 then
    L0_0 = "sm51_01003"
    L1_1 = "locator2_cp_guide_03"
    L2_2 = "sm51_01002"
    sm51_MissionTarget(L0_0, L1_1, L2_2)
    sm51_NextPointEnter("pccubesensor2_cp_guide_03", "locator2_kit_restart_04", "locator2_grab_point_04", false)
    RAC_NaviKill(false)
  end
  Fn_naviSet(findGameObject2("Node", "locator2_check_point_npc_03"))
  Fn_captionView("sm51_01004")
  sm51_NextPointEnter("pccubesensor2_check_point_03", "locator2_kit_restart_05", "locator2_grab_point_04", true)
  sm51_Delivery_Finished("check_point_npc_03", "sm51_00600k")
  Fn_naviKill()
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
