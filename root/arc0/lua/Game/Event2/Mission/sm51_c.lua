dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm51_common.lua")
CLOW_START_DELAY = 2
check_clow_chase_point = false
check_course_out = false
check_point_restart = "locator2_kit_restart_07_00"
check_point_box_restart = "locator2_grab_point_07_00"
puppets = {}
sdemo = nil
_puppet_crow = nil
check_point_phase = 1
check_point_phase_list = {
  "locator2_cp_guide_05_01",
  "locator2_cp_guide_05_02",
  "locator2_cp_guide_05_03",
  "locator2_cp_guide_05_04",
  "locator2_cp_guide_05_05",
  "pccubesensor2_check_point_04"
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "check_point_npc_04",
      type = "man46",
      node = "locator2_check_point_npc_04"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_cp_guide_05_01")
  Fn_pcSensorOff("pccubesensor2_cp_guide_05_02")
  Fn_pcSensorOff("pccubesensor2_cp_guide_05_03")
  Fn_pcSensorOff("pccubesensor2_cp_guide_05_04")
  Fn_pcSensorOff("pccubesensor2_cp_guide_05_05")
  Fn_pcSensorOff("pccubesensor2_check_point_04")
  sdemo = SDemo.create("sm51_sdemo")
  Fn_sendEventComSb("SweetsboxInit", "locator2_grab_point_07_00")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
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
  L3_4 = Fn_sendEventComSb
  L4_5 = "SweetsboxGrabObject"
  L3_4(L4_5)
  L3_4 = Fn_spawnSuppotCrow
  L4_5 = false
  L5_6 = Supporter
  L5_6 = L5_6.FirstAction
  L5_6 = L5_6.Ground
  L6_7 = "locator2_sdemo02_crow_pos_01"
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  _puppet_crow = L3_4
  L3_4 = _puppet_crow
  L4_5 = L3_4
  L3_4 = L3_4.getBrain
  L3_4 = L3_4(L4_5)
  L4_5 = L3_4
  L3_4 = L3_4.setIdling
  L5_6 = true
  L3_4(L4_5, L5_6)
  L3_4 = _puppet_crow
  L4_5 = L3_4
  L3_4 = L3_4.getBrain
  L3_4 = L3_4(L4_5)
  L4_5 = L3_4
  L3_4 = L3_4.setEnemyNavi
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = _puppet_crow
  L4_5 = L3_4
  L3_4 = L3_4.getBrain
  L3_4 = L3_4(L4_5)
  L4_5 = L3_4
  L3_4 = L3_4.setLockonNavi
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = _puppet_crow
  L4_5 = L3_4
  L3_4 = L3_4.getBrain
  L3_4 = L3_4(L4_5)
  L5_6 = L3_4
  L4_5 = L3_4.setAITypeByName
  L6_7 = "enemy"
  L4_5(L5_6, L6_7)
  L4_5 = Fn_userCtrlOff
  L4_5()
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.reset
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.set
  L6_7 = "locator2_sdemo02_cam_pos_01"
  L7_8 = "locator2_sdemo02_aim_pos_01"
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L4_5(L5_6)
  L4_5 = Fn_missionStart
  L4_5()
  L5_6 = L3_4
  L4_5 = L3_4.setMovePoints
  L6_7 = {
    L7_8,
    L8_9,
    L9_10,
    L10_11
  }
  L7_8 = {}
  L8_9 = _puppet_crow
  L9_10 = L8_9
  L8_9 = L8_9.getWorldPos
  L8_9 = L8_9(L9_10)
  L7_8.pos = L8_9
  L8_9 = Supporter
  L8_9 = L8_9.MovePoint
  L8_9 = L8_9.Air
  L7_8.action = L8_9
  L7_8.vel = 30
  L8_9 = {}
  L9_10 = findGameObject2
  L10_11 = "Node"
  L11_12 = "locator2_sdemo02_crow_pos_01"
  L9_10 = L9_10(L10_11, L11_12)
  L10_11 = L9_10
  L9_10 = L9_10.getWorldPos
  L9_10 = L9_10(L10_11)
  L8_9.pos = L9_10
  L9_10 = Supporter
  L9_10 = L9_10.MovePoint
  L9_10 = L9_10.Air
  L8_9.action = L9_10
  L8_9.vel = 30
  L9_10 = {}
  L10_11 = findGameObject2
  L11_12 = "Node"
  L12_13 = "locator2_sdemo02_crow_pos_02"
  L10_11 = L10_11(L11_12, L12_13)
  L11_12 = L10_11
  L10_11 = L10_11.getWorldPos
  L10_11 = L10_11(L11_12)
  L9_10.pos = L10_11
  L10_11 = Supporter
  L10_11 = L10_11.MovePoint
  L10_11 = L10_11.Air
  L9_10.action = L10_11
  L9_10.vel = 30
  L10_11 = {}
  L11_12 = findGameObject2
  L12_13 = "Node"
  L13_14 = "locator2_sdemo02_crow_pos_03"
  L11_12 = L11_12(L12_13, L13_14)
  L12_13 = L11_12
  L11_12 = L11_12.getWorldPos
  L11_12 = L11_12(L12_13)
  L10_11.pos = L11_12
  L11_12 = Supporter
  L11_12 = L11_12.MovePoint
  L11_12 = L11_12.Air
  L10_11.action = L11_12
  L10_11.vel = 30
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.startMovePoint
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L6_7 = {L7_8}
  L7_8 = {}
  L7_8.pos = "locator2_sdemo02_cam_pos_02"
  L7_8.time = 0.8
  L7_8.hashfunc = "EaseIn"
  L7_8 = {L8_9, L9_10}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo02_aim_pos_02"
  L8_9.time = 0.5
  L8_9.hashfunc = "EaseIn"
  L9_10 = {}
  L9_10.pos = "locator2_sdemo02_aim_pos_03"
  L9_10.time = 0.5
  L9_10.hashfunc = "EaseOut"
  L4_5(L5_6, L6_7, L7_8)
  while true do
    L4_5 = sdemo
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = waitSeconds
  L5_6 = 0.5
  L4_5(L5_6)
  L4_5 = Camera
  L5_6 = L4_5
  L4_5 = L4_5.shake2D
  L6_7 = 0.7
  L7_8 = 0.3
  L8_9 = 1
  L9_10 = 0.3
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10)
  repeat
    L4_5 = wait
    L4_5()
    L5_6 = L3_4
    L4_5 = L3_4.isMovePointEnd
    L4_5 = L4_5(L5_6)
  until L4_5
  L5_6 = L3_4
  L4_5 = L3_4.clearMovePoint
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  L4_5 = Fn_resetPcPos
  L5_6 = "locator2_pc_start_pos"
  L4_5(L5_6)
  L5_6 = L3_4
  L4_5 = L3_4.warpToNode
  L6_7 = findGameObject2
  L7_8 = "Node"
  L8_9 = "locator2_sdemo02_crow_pos_04"
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = Supporter
  L7_8 = L7_8.FirstAction
  L7_8 = L7_8.Air
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.reset
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.set
  L6_7 = "locator2_sdemo02_cam_pos_03"
  L7_8 = "locator2_sdemo02_aim_pos_04"
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L6_7 = nil
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo02_aim_pos_05"
  L8_9.time = 2
  L8_9.hashfunc = "EaseInOut"
  L4_5(L5_6, L6_7, L7_8)
  while true do
    L4_5 = sdemo
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.reset
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.set
  L6_7 = "locator2_sdemo02_cam_pos_04"
  L7_8 = "locator2_sdemo02_aim_pos_06"
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 0.5
  L4_5(L5_6)
  L4_5 = Fn_kaiwaDemoView
  L5_6 = "sm51_00700k"
  L4_5(L5_6)
  L4_5 = sdemo
  L5_6 = L4_5
  L4_5 = L4_5.stop
  L6_7 = 1
  L4_5(L5_6, L6_7)
  L4_5 = invokeTask
  function L5_6()
    waitSeconds(CLOW_START_DELAY)
    L3_4:setIdling(false)
    print("\227\130\175\227\131\173\227\130\166\227\129\140\232\161\140\229\139\149\227\130\146\233\150\139\229\167\139\227\129\151\227\129\159\227\128\130")
  end
  L4_5 = L4_5(L5_6)
  L5_6 = Fn_userCtrlOn
  L5_6()
  L5_6 = Fn_sendEventComSb
  L6_7 = "SweetsboxGrabObject"
  L5_6(L6_7)
  L4_5 = sm51_DurabilityChekcer
  L4_5 = L4_5()
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter99_99SetTextID
  L7_8 = "sm51_09000"
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter99_99SetMax
  L7_8 = 4
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter99_99SetNum
  L7_8 = 3
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter99_99SetVisible
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter999SetTextID
  L7_8 = "sm51_09001"
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter999SetNum
  L7_8 = durability
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter999SetVisible
  L7_8 = true
  L5_6(L6_7, L7_8)
  clow_chase_event = true
  check_point_phase = 1
  L5_6 = Fn_playMotionNpc
  L6_7 = "check_point_npc_04"
  L7_8 = {L8_9}
  L8_9 = "lookaround_02"
  L8_9 = false
  L9_10 = {}
  L9_10.isRepeat = true
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L5_6 = check_point_phase
  if L5_6 == 1 then
    L0_1 = "sm51_02001"
    L1_2 = "locator2_cp_guide_05_01"
    L2_3 = "sm51_02000"
    L5_6 = sm51_MissionTarget
    L6_7 = L0_1
    L7_8 = L1_2
    L8_9 = L2_3
    L5_6(L6_7, L7_8, L8_9)
    L5_6 = sm51_NextPointEnter
    L6_7 = "pccubesensor2_cp_guide_05_01"
    L7_8 = "locator2_kit_restart_07_00"
    L8_9 = "locator2_grab_point_07_00"
    L9_10 = false
    L10_11 = true
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = RAC_NaviKill
    L6_7 = false
    L5_6(L6_7)
  end
  L5_6 = check_point_phase
  if L5_6 == 2 then
    L5_6 = Fn_naviSet
    L6_7 = findGameObject2
    L7_8 = "Node"
    L8_9 = "locator2_cp_guide_05_02"
    L14_15 = L6_7(L7_8, L8_9)
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8, L8_9))
    L5_6 = Fn_captionView
    L6_7 = "sm51_02002"
    L5_6(L6_7)
    L5_6 = sm51_NextPointEnter
    L6_7 = "pccubesensor2_cp_guide_05_02"
    L7_8 = "locator2_kit_restart_07_01"
    L8_9 = "locator2_grab_point_07_01"
    L9_10 = false
    L10_11 = true
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = RAC_NaviKill
    L6_7 = false
    L5_6(L6_7)
  end
  L5_6 = check_point_phase
  if L5_6 == 3 then
    L5_6 = Fn_naviSet
    L6_7 = findGameObject2
    L7_8 = "Node"
    L8_9 = "locator2_cp_guide_05_03"
    L14_15 = L6_7(L7_8, L8_9)
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8, L8_9))
    L5_6 = Fn_captionView
    L6_7 = "sm51_02003"
    L5_6(L6_7)
    L5_6 = sm51_NextPointEnter
    L6_7 = "pccubesensor2_cp_guide_05_03"
    L7_8 = "locator2_kit_restart_07_02"
    L8_9 = "locator2_grab_point_07_02"
    L9_10 = false
    L10_11 = true
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = RAC_NaviKill
    L6_7 = false
    L5_6(L6_7)
  end
  L5_6 = check_point_phase
  if L5_6 == 4 then
    L5_6 = Fn_naviSet
    L6_7 = findGameObject2
    L7_8 = "Node"
    L8_9 = "locator2_cp_guide_05_04"
    L14_15 = L6_7(L7_8, L8_9)
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8, L8_9))
    L5_6 = Fn_captionView
    L6_7 = "sm51_02004"
    L5_6(L6_7)
    L5_6 = sm51_NextPointEnter
    L6_7 = "pccubesensor2_cp_guide_05_04"
    L7_8 = "locator2_kit_restart_07_03"
    L8_9 = "locator2_grab_point_07_03"
    L9_10 = false
    L10_11 = true
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = RAC_NaviKill
    L6_7 = false
    L5_6(L6_7)
  end
  L5_6 = check_point_phase
  if L5_6 == 5 then
    L5_6 = Fn_naviSet
    L6_7 = findGameObject2
    L7_8 = "Node"
    L8_9 = "locator2_cp_guide_05_05"
    L14_15 = L6_7(L7_8, L8_9)
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8, L8_9))
    L5_6 = Fn_captionView
    L6_7 = "sm51_02005"
    L5_6(L6_7)
    L5_6 = sm51_NextPointEnter
    L6_7 = "pccubesensor2_cp_guide_05_05"
    L7_8 = "locator2_kit_restart_07_04"
    L8_9 = "locator2_grab_point_07_04"
    L9_10 = false
    L10_11 = true
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
    L5_6 = RAC_NaviKill
    L6_7 = false
    L5_6(L6_7)
  end
  L5_6 = print
  L6_7 = "pahse result : "
  L7_8 = check_point_phase
  L6_7 = L6_7 .. L7_8
  L5_6(L6_7)
  L5_6 = Fn_naviSet
  L6_7 = findGameObject2
  L7_8 = "Node"
  L8_9 = "locator2_check_point_npc_04"
  L14_15 = L6_7(L7_8, L8_9)
  L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8, L8_9))
  L5_6 = Fn_captionView
  L6_7 = "sm51_02006"
  L5_6(L6_7)
  L5_6 = sm51_NextPointEnter
  L6_7 = "pccubesensor2_check_point_04"
  L7_8 = "locator2_kit_restart_07_05"
  L8_9 = "locator2_grab_point_07_05"
  L9_10 = false
  L10_11 = true
  L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
  clow_chase_event = false
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter99_99AddNum
  L7_8 = 1
  L5_6(L6_7, L7_8)
  L5_6 = Fn_pcSensorOff
  L6_7 = "pccubesensor2_check_point_04"
  L5_6(L6_7)
  L5_6 = Fn_naviKill
  L5_6()
  L5_6 = Fn_blackout
  L6_7 = 1
  L5_6(L6_7)
  L5_6 = npc_motion_task_04
  if L5_6 ~= nil then
    L5_6 = npc_motion_task_04
    L6_7 = L5_6
    L5_6 = L5_6.abort
    L5_6(L6_7)
    npc_motion_task_04 = nil
  end
  L6_7 = L3_4
  L5_6 = L3_4.setIdling
  L7_8 = true
  L5_6(L6_7, L7_8)
  L6_7 = L3_4
  L5_6 = L3_4.releaseAllGravityBullets
  L5_6(L6_7)
  L6_7 = L3_4
  L5_6 = L3_4.warpToNode
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_epilogue_crow_pos_02"
  L7_8 = L7_8(L8_9, L9_10)
  L8_9 = Supporter
  L8_9 = L8_9.FirstAction
  L8_9 = L8_9.Ground
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter99_99SetVisible
  L7_8 = false
  L5_6(L6_7, L7_8)
  L5_6 = HUD
  L6_7 = L5_6
  L5_6 = L5_6.counter999SetVisible
  L7_8 = false
  L5_6(L6_7, L7_8)
  L5_6 = Fn_resetPcPos
  L6_7 = "locator2_kit_epilogue"
  L5_6(L6_7)
  L5_6 = Fn_userCtrlOff
  L5_6()
  L5_6 = Fn_sendEventComSb
  L6_7 = "SweetsboxBrokenObject"
  L5_6(L6_7)
  while true do
    L5_6 = Fn_sendEventComSb
    L6_7 = "GetSweetsboxIsBroken"
    L5_6 = L5_6(L6_7)
    if L5_6 == false then
      L5_6 = print
      L6_7 = "\231\160\180\229\163\138\228\184\173"
      L5_6(L6_7)
      L5_6 = wait
      L5_6()
    end
  end
  L5_6 = RAC_createGimmickBg
  L6_7 = "sweetsbox"
  L7_8 = "woodbox_kk_03"
  L8_9 = "locator2_final_box"
  L9_10 = false
  L10_11 = false
  L11_12 = nil
  L12_13 = true
  L13_14 = "event_obj_02"
  L5_6 = L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14)
  L6_7 = sdemo
  L7_8 = L6_7
  L6_7 = L6_7.reset
  L6_7(L7_8)
  L6_7 = "pup_crow"
  L7_8 = Fn_findNpc
  L8_9 = L6_7
  L7_8 = L7_8(L8_9)
  L8_9 = sdemo
  L9_10 = L8_9
  L8_9 = L8_9.set
  L10_11 = "locator2_cam_epilogue_cam_01"
  L11_12 = "locator2_cam_epilogue_aim_01"
  L12_13 = false
  L13_14 = Vector
  L14_15 = 0
  L14_15 = L13_14(L14_15, 1.5, 0)
  L8_9(L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L13_14(L14_15, 1.5, 0))
  L8_9 = sdemo
  L9_10 = L8_9
  L8_9 = L8_9.play
  L8_9(L9_10)
  L8_9 = Fn_fadein
  L9_10 = 1
  L8_9(L9_10)
  L8_9 = Fn_kaiwaDemoView
  L9_10 = "sm51_00800k"
  L8_9(L9_10)
  L8_9 = Sound
  L9_10 = L8_9
  L8_9 = L8_9.pulse
  L10_11 = "cro_277"
  L8_9(L9_10, L10_11)
  L8_9 = Fn_captionView
  L9_10 = "sm51_02007"
  L8_9(L9_10)
  L8_9 = findGameObject2
  L9_10 = "Node"
  L10_11 = "locator2_epilogue_crow_pos_02"
  L8_9 = L8_9(L9_10, L10_11)
  L9_10 = findGameObject2
  L10_11 = "Node"
  L11_12 = "locator2_epilogue_crow_walk_pos"
  L9_10 = L9_10(L10_11, L11_12)
  L11_12 = L8_9
  L10_11 = L8_9.getWorldPos
  L10_11 = L10_11(L11_12)
  L12_13 = L9_10
  L11_12 = L9_10.getWorldPos
  L11_12 = L11_12(L12_13)
  L12_13 = {L13_14}
  L13_14 = {}
  L13_14.pos = L10_11
  L14_15 = Supporter
  L14_15 = L14_15.MovePoint
  L14_15 = L14_15.Alight
  L13_14.action = L14_15
  L13_14.vel = 6.6
  L14_15 = L3_4
  L13_14 = L3_4.setIdling
  L13_14(L14_15, false)
  L14_15 = L3_4
  L13_14 = L3_4.setMovePoints
  L13_14(L14_15, L12_13)
  L14_15 = L3_4
  L13_14 = L3_4.startMovePoint
  L13_14(L14_15)
  L13_14 = sdemo
  L14_15 = L13_14
  L13_14 = L13_14.play
  L13_14(L14_15, nil, {
    {
      pos = "locator2_epilogue_crow_pos_02",
      time = 3,
      hashfunc = "EaseInOut"
    }
  })
  L14_15 = L3_4
  L13_14 = L3_4.setIdling
  L13_14(L14_15, true)
  L14_15 = L3_4
  L13_14 = L3_4.clearMovePoint
  L13_14(L14_15)
  L13_14 = waitSeconds
  L14_15 = 3
  L13_14(L14_15)
  L13_14 = Fn_playMotionNpc
  L14_15 = "check_point_npc_04"
  L13_14(L14_15, {
    "scared_in_00",
    "scared_00"
  }, true, {
    isRepeat = false,
    isStop = true,
    animBlendDuration = 0.5
  })
  L13_14 = Fn_kaiwaDemoView
  L14_15 = "sm51_00810k"
  L13_14(L14_15)
  L13_14 = findGameObject2
  L14_15 = "Node"
  L13_14 = L13_14(L14_15, "locator2_cam_epilogue_aim_02")
  L14_15 = sdemo
  L14_15 = L14_15.play
  L14_15(L14_15, nil, {
    {
      pos = "locator2_check_point_npc_04",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  L14_15 = {
    {
      pos = L10_11,
      action = Supporter.MovePoint.Ground,
      vel = 1.5
    },
    {
      pos = L11_12,
      action = Supporter.MovePoint.Ground,
      vel = 1.5
    }
  }
  L3_4:setIdling(false)
  L3_4:setMovePoints(L14_15)
  L3_4:startMovePoint()
  repeat
    wait()
  until L3_4:isMovePointEnd()
  L3_4:setIdling(true)
  L3_4:clearMovePoint()
  while sdemo:isPlay() do
    wait()
  end
  sdemo:stop(1)
  waitSeconds(1)
  L6_7 = L4_5
  L5_6 = L4_5.abort
  L5_6(L6_7)
  L4_5 = nil
  L5_6 = Fn_setKeepPlayerPos
  L5_6()
  L5_6 = Fn_setNextMissionFlag
  L5_6()
  L5_6 = Fn_nextMission
  L5_6()
  L5_6 = Fn_exitSandbox
  L5_6()
end
function Finalize()
  local L0_16, L1_17
end
