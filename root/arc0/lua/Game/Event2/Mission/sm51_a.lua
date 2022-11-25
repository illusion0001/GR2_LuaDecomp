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
  Fn_userCtrlAllOff()
  Fn_pcSensorOff("pccubesensor2_cp_guide_01")
  Fn_pcSensorOff("pccubesensor2_check_point_01")
  sdemo = SDemo.create("sm51_sdemo")
  Fn_sendEventComSb("SweetsboxInit", check_point_box_restart)
  while Fn_sendEventComSb("GetSweetsboxReady") == false do
    print("\231\148\159\230\136\144\228\184\173")
    wait()
  end
end
function Ingame()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = sm51_InitializeArea
  L0_0()
  L0_0, L1_1, L2_2 = nil, nil, nil
  Fn_missionStart()
  Fn_kaiwaDemoView("sm51_00100k")
  Fn_sendEventComSb("SetNpcActive", "check_point_npc_01")
  Fn_sendEventComSb("StartNpcAction", "check_point_npc_01")
  RAC_infoView("sm51_info_01")
  HUD:counter99_99SetTextID("sm51_09000")
  HUD:counter99_99SetMax(4)
  HUD:counter99_99SetNum(0)
  HUD:counter99_99SetVisible(true)
  HUD:counter999SetTextID("sm51_09001")
  HUD:counter999SetNum(durability)
  HUD:counter999SetVisible(true)
  Player:setAttrTune(Player.kAttrTune_Mars)
  while Fn_sendEventComSb("GetSweetsboxIsGrabed") == false do
    Fn_sendEventComSb("SweetsboxGrabObject")
    wait()
  end
  Fn_userCtrlOn()
  check_point_phase = 1
  if check_point_phase == 1 then
    L0_0 = "sm51_00101"
    L1_1 = "locator2_cp_guide_01"
    L2_2 = "sm51_00100"
    sm51_MissionTarget(L0_0, L1_1, L2_2)
    sm51_NextPointEnter("pccubesensor2_cp_guide_01", "locator2_pc_start_pos", "locator2_grab_point_00", false, true)
  end
  Fn_naviSet(Fn_sendEventComSb("findComGameNode", "locator2_check_point_npc_01"))
  Fn_captionView("sm51_00102")
  sm51_NextPointEnter("pccubesensor2_check_point_01", "locator2_cp_guide_01", "locator2_grab_point_00", true)
  sm51_Delivery_Finished("check_point_npc_01", "sm51_00200k")
  Fn_sendEventComSb("Durability_NumIn", durability)
  sm51_DurabilityChekcer():abort()
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
