dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm51_common.lua")
CLOW_START_DELAY = 3
check_course_out = false
check_point_restart = "locator2_kit_restart_02"
check_point_box_restart = "locator2_grab_point_02"
check_point_phase = 1
puppets = {}
sdemo = nil
_puppet_crow = nil
check_point_phase_list = {
  "locator2_check_point_npc_02",
  "locator2_cp_guide_03",
  "locator2_check_point_npc_03"
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "pup_crow",
      type = "crow01",
      node = "locator2_sdemo01_crow_pos_01",
      active = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_check_point_02")
  Fn_pcSensorOff("pccubesensor2_clow_appearance_02")
  Fn_pcSensorOff("pccubesensor2_check_point_clow_end_01")
  sdemo = SDemo.create("sm51_sdemo")
  Fn_sendEventComSb("SweetsboxInit", "locator2_grab_point_03")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1, L1_2, L2_3 = nil, nil, nil
  L3_4 = Fn_userCtrlAllOff
  L3_4()
  L3_4 = sm51_InitializeArea
  L3_4()
  L3_4 = Fn_sendEventComSb
  L4_5 = "Durability_NumBack"
  L3_4 = L3_4(L4_5)
  durability = L3_4
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setAttrTune
  L5_6 = Player
  L5_6 = L5_6.kAttrTune_Mars
  L3_4(L4_5, L5_6)
  while true do
    L3_4 = Fn_sendEventComSb
    L4_5 = "GetSweetsboxIsGrabed"
    L3_4 = L3_4(L4_5)
    if L3_4 == false then
      L3_4 = Fn_sendEventComSb
      L4_5 = "SweetsboxGrabObject"
      L3_4(L4_5)
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = sm51_DurabilityChekcer
  L3_4 = L3_4()
  L4_5 = Fn_spawnSuppotCrow
  L5_6 = false
  L4_5 = L4_5(L5_6, Supporter.FirstAction.Air, "locator2_sdemo01_crow_pos_01")
  _puppet_crow = L4_5
  L4_5 = _puppet_crow
  L5_6 = L4_5
  L4_5 = L4_5.getBrain
  L4_5 = L4_5(L5_6)
  L5_6 = L4_5
  L4_5 = L4_5.setIdling
  L4_5(L5_6, true)
  L4_5 = _puppet_crow
  L5_6 = L4_5
  L4_5 = L4_5.getBrain
  L4_5 = L4_5(L5_6)
  L5_6 = L4_5
  L4_5 = L4_5.setEnemyNavi
  L4_5(L5_6, false)
  L4_5 = _puppet_crow
  L5_6 = L4_5
  L4_5 = L4_5.getBrain
  L4_5 = L4_5(L5_6)
  L5_6 = L4_5
  L4_5 = L4_5.setLockonNavi
  L4_5(L5_6, false)
  L4_5 = _puppet_crow
  L5_6 = L4_5
  L4_5 = L4_5.getBrain
  L4_5 = L4_5(L5_6)
  L5_6 = L4_5.setAITypeByName
  L5_6(L4_5, "enemy")
  L5_6 = "pup_crow"
  Fn_userCtrlOff()
  sdemo:reset()
  sdemo:set("locator2_sdemo01_cam_pos_01", "locator2_sdemo01_aim_pos_01")
  sdemo:play()
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_missionStart()
  sdemo:play({
    {
      pos = "locator2_sdemo01_cam_pos_02",
      time = 2,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo01_aim_pos_02",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  while sdemo:isPlay() do
    wait()
  end
  L4_5:setMovePoints({
    {
      pos = findGameObject2("Node", "locator2_sdemo01_crow_pos_01"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 30
    },
    {
      pos = findGameObject2("Node", "locator2_sdemo01_crow_pos_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 30
    },
    {
      pos = findGameObject2("Node", "locator2_sdemo01_crow_pos_03"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 30
    },
    {
      pos = findGameObject2("Node", "locator2_sdemo01_crow_pos_04"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 30
    }
  })
  L4_5:startMovePoint()
  waitSeconds(0.5)
  sdemo:play(nil, {
    {
      pos = "locator2_sdemo01_aim_pos_03",
      time = 0.4,
      hashfunc = "EaseOut"
    }
  })
  while sdemo:isPlay() do
    wait()
  end
  repeat
    wait()
  until L4_5:isMovePointEnd()
  L4_5:clearMovePoint()
  waitSeconds(0.5)
  L4_5:warpToNode(findGameObject2("Node", "locator2_sdemo01_crow_pos_05"), Supporter.FirstAction.Air)
  sdemo:reset()
  sdemo:set("locator2_sdemo01_cam_pos_03", "locator2_sdemo01_aim_pos_06")
  sdemo:play()
  waitSeconds(1)
  sdemo:play(nil, {
    {
      pos = "locator2_sdemo01_aim_pos_04",
      time = 0.5,
      hashfunc = "EaseInOut"
    },
    {
      pos = "locator2_sdemo01_aim_pos_07",
      time = 0.5,
      hashfunc = "EaseInOut"
    }
  })
  L4_5:setMovePoints({
    {
      pos = findGameObject2("Node", "locator2_sdemo01_crow_pos_06"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 15
    }
  })
  L4_5:startMovePoint()
  repeat
    wait()
  until L4_5:isMovePointEnd()
  L4_5:clearMovePoint()
  waitSeconds(0.5)
  sdemo:play({
    {
      pos = "locator2_sdemo01_cam_pos_04",
      time = 2,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo01_aim_pos_05",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  while sdemo:isPlay() do
    wait()
  end
  waitSeconds(1)
  Fn_resetPcPos("warppoint2_pc_01")
  L5_6 = Fn_kaiwaDemoView
  L5_6("sm51_00300k")
  L5_6 = sdemo
  L5_6 = L5_6.stop
  L5_6(L5_6, 1)
  L5_6 = invokeTask
  L5_6 = L5_6(function()
    waitSeconds(CLOW_START_DELAY)
    L4_5:setIdling(false)
    print("\227\130\175\227\131\173\227\130\166\227\129\140\232\161\140\229\139\149\227\130\146\233\150\139\229\167\139\227\129\151\227\129\159\227\128\130")
  end)
  HUD:counter99_99SetTextID("sm51_09000")
  HUD:counter99_99SetMax(4)
  HUD:counter99_99SetNum(1)
  HUD:counter99_99SetVisible(true)
  HUD:counter999SetTextID("sm51_09001")
  HUD:counter999SetNum(durability)
  HUD:counter999SetVisible(true)
  clow_chase_event = true
  Fn_sendEventComSb("StartNpcAction", "check_point_npc_02")
  Fn_sendEventComSb("SweetsboxGrabObject")
  Fn_userCtrlOn()
  L0_1 = "sm51_01001"
  L1_2 = "locator2_check_point_npc_02"
  L2_3 = "sm51_01000"
  sm51_MissionTarget(L0_1, L1_2, L2_3)
  sm51_NextPointEnter("pccubesensor2_check_point_clow_end_01", "locator2_kit_restart_03", "locator2_grab_point_02", false)
  wait()
  Fn_kaiwaDemoView("sm51_00400k")
  clow_chase_event = false
  sm51_NextPointEnter("pccubesensor2_check_point_02", "locator2_pc_start_pos", "locator2_grab_point_02", true)
  sm51_Delivery_Finished("check_point_npc_02", "sm51_00500k")
  Fn_naviKill()
  Fn_sendEventComSb("Durability_NumIn", durability)
  L3_4:abort()
  L3_4 = nil
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_7, L1_8
end
