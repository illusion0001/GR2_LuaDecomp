dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm38_common.lua")
_dog_move_interval_frame = {
  1,
  30,
  400
}
_puppet_tbl = {}
kit_motion = {
  sp = "kit01_surprise_00"
}
_sdemo_cut = nil
_god_warp_node = "locator2_dog_move_05"
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "escape_dog_01",
      type = "dog01",
      node = "locator2_sm38_b_dog",
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadPlayerMotion(kit_motion)
  _sdemo_cut = SDemo.create("sm38_b_cut")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = false
  L1_2 = Fn_findNpc
  L2_3 = "escape_dog_01"
  L1_2 = L1_2(L2_3)
  L2_3 = Fn_sendEventComSb
  L3_4 = "StartMobTask"
  L2_3(L3_4)
  function L2_3()
    Fn_warpNpc("escape_dog_01", _god_warp_node)
  end
  L4_5 = L1_2
  L3_4 = L1_2.setEventListener
  L5_6 = "npcFall"
  L3_4(L4_5, L5_6, L2_3)
  L3_4 = Fn_missionStart
  L3_4()
  L3_4 = Fn_userCtrlOn
  L3_4()
  L3_4 = RAC_startCatWarpControl
  L4_5 = "sm38_b_area_out_01"
  L5_6 = nil
  L3_4(L4_5, L5_6, "pccubesensor2_area_out_near_b_01", "pccubesensor2_area_out_far_b_01", "locator2_pc_return_pos_b_01", nil, "locator2_pc_return_pos_b_01", "sm38_09013", nil, nil)
  L3_4 = HUD
  L4_5 = L3_4
  L3_4 = L3_4.naviSetPochiDistanceDensity0
  L5_6 = 10
  L3_4(L4_5, L5_6)
  L3_4 = HUD
  L4_5 = L3_4
  L3_4 = L3_4.naviSetPochiDistanceDensity100
  L5_6 = 12
  L3_4(L4_5, L5_6)
  L3_4 = RAC_missionNaviCaption
  L4_5 = "sm38_01005"
  L5_6 = _puppet_tbl
  L5_6 = L5_6.escape_dog_01
  L3_4(L4_5, L5_6, "sm38_00112")
  while true do
    L3_4 = Fn_getDistanceToPlayer
    L4_5 = _puppet_tbl
    L4_5 = L4_5.escape_dog_01
    L3_4 = L3_4(L4_5)
    if L3_4 >= 8 then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = RAC_endCatWarpControl
  L4_5 = "sm38_b_area_out_01"
  L3_4(L4_5)
  L3_4 = RAC_startCatWarpControl
  L4_5 = "sm38_b_area_out_02"
  L5_6 = nil
  L3_4(L4_5, L5_6, "pccubesensor2_area_out_near_b_01", "pccubesensor2_area_out_far_b_01", "locator2_pc_return_pos_b_02", nil, "locator2_pc_return_pos_b_02", "sm38_09013", nil, L2_3)
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setStay
  L5_6 = true
  L3_4(L4_5, L5_6)
  L3_4 = RAC_LookAtObjectWait
  L4_5 = "locator2_sm38_b_dog"
  L3_4(L4_5)
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setStay
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm38_00500k"
  L3_4(L4_5)
  L3_4 = Fn_missionView
  L4_5 = "sm38_00102"
  L3_4(L4_5)
  L3_4 = Fn_setGrabNpc
  L4_5 = L1_2
  L5_6 = false
  L3_4(L4_5, L5_6, false)
  L3_4 = SM38_initDogAutoFrame
  L4_5 = _dog_move_interval_frame
  L3_4(L4_5)
  L3_4 = {}
  L3_4.anim_speed_over = true
  L3_4.anim_run_speed = 1.3
  L3_4.arrivedLength = 0.1
  L3_4.runLength = -1
  L3_4.noTurn = true
  L4_5 = {}
  L5_6 = _puppet_tbl
  L5_6 = L5_6.escape_dog_01
  L4_5.puppet = L5_6
  L4_5.per_pos = "locator2_dog_move_01"
  L5_6 = {}
  L5_6.prefix = "locator2_dog_move_"
  L5_6.index_tbl = {
    {
      "02",
      "05",
      "04"
    },
    {
      "03",
      "05",
      "01"
    },
    {
      "02",
      "04",
      "05"
    },
    {"05", "03"},
    {
      "01",
      "02",
      "03",
      "04"
    }
  }
  while true do
    if SM38_catchDogLoop(cap_tbl, L4_5, L5_6, L3_4, "B") == false then
    end
  end
  if _dog_move_task ~= nil then
    _dog_move_task:abort()
    _dog_move_task = nil
  end
  L3_4 = Fn_userCtrlOff
  L3_4()
  L3_4 = RAC_endCatWarpControl
  L4_5 = "sm38_b_area_out_02"
  L3_4(L4_5)
  L3_4 = Fn_naviKill
  L3_4()
  L3_4 = waitSeconds
  L4_5 = 1
  L3_4(L4_5)
  L3_4 = Fn_blackout
  L3_4()
  L3_4 = Fn_userCtrlAllOff
  L3_4()
  L3_4 = Fn_resetPcPos
  L4_5 = "locator2_sm38_b_end_pos"
  L3_4(L4_5)
  L3_4 = Fn_coercionPoseNomal
  L3_4()
  L3_4 = _sdemo_cut
  L4_5 = L3_4
  L3_4 = L3_4.reset
  L3_4(L4_5)
  L3_4 = _sdemo_cut
  L4_5 = L3_4
  L3_4 = L3_4.set
  L5_6 = "locator2_b_demo1_cam_01"
  L3_4(L4_5, L5_6, "locator2_b_demo1_aim_01", true)
  L3_4 = _sdemo_cut
  L4_5 = L3_4
  L3_4 = L3_4.play
  L5_6 = nil
  L3_4(L4_5, L5_6, nil, false)
  L3_4 = Fn_fadein
  L3_4()
  L3_4 = waitSeconds
  L4_5 = 2
  L3_4(L4_5)
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm38_00600k"
  L3_4(L4_5)
  L3_4 = Fn_setGrabNpc
  L4_5 = L1_2
  L5_6 = true
  L3_4(L4_5, L5_6, true)
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.dropGrabObject
  L3_4(L4_5)
  L3_4 = wait
  L3_4()
  L3_4 = {}
  L3_4.anim_run_speed = 1
  L3_4.noTurn = true
  L3_4.arrivedLength = 0.1
  L3_4.runLength = -1
  L4_5 = Fn_moveNpc
  L5_6 = "escape_dog_01"
  L4_5(L5_6, "locator2_sm38_b_dog_esc_pos_02", L3_4)
  L4_5 = Fn_playPlayerMotion
  L5_6 = kit_motion
  L5_6 = L5_6.sp
  L4_5(L5_6, 0, 0.3)
  L4_5 = waitSeconds
  L5_6 = 2
  L4_5(L5_6)
  L4_5 = Fn_captionView
  L5_6 = "sm38_00100"
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  L4_5 = _sdemo_cut
  L5_6 = L4_5
  L4_5 = L4_5.play
  L4_5(L5_6, nil, {
    {
      pos = "locator2_b_demo1_aim_02",
      time = 3
    }
  })
  L4_5 = Fn_warpNpc
  L5_6 = "escape_dog_01"
  L4_5(L5_6, "locator2_sm38_b_dog_esc_pos_01")
  while true do
    L4_5 = _sdemo_cut
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = _sdemo_cut
  L5_6 = L4_5
  L4_5 = L4_5.stop
  L4_5(L5_6, 1)
  L4_5 = Fn_resetCoercionPose
  L4_5()
  L4_5 = Fn_setGrabNpc
  L5_6 = L1_2
  L4_5(L5_6, true, true)
  L4_5 = Fn_kaiwaDemoView2
  L5_6 = "sm38_00700k"
  L4_5(L5_6, function()
    Fn_warpNpc("escape_dog_01", "locator2_sm38_b_dog_esc_pos_02")
  end, true)
  L4_5 = Fn_userCtrlOn
  L4_5()
  L4_5 = Fn_setKeepPlayerPos
  L4_5()
  L4_5 = Fn_setNextMissionFlag
  L4_5()
  L4_5 = Fn_nextMission
  L4_5()
  L4_5 = Fn_exitSandbox
  L4_5()
end
function Finalize()
  if _cant_grab_wait_task ~= nil then
    _cant_grab_wait_task:abort()
    _cant_grab_wait_task = nil
  end
end
