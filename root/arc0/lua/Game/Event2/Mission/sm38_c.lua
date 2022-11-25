dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm38_common.lua")
_puppet_tbl = {}
_dog_move_interval_frame = {
  1,
  30,
  60,
  90,
  120,
  150,
  180,
  210,
  240,
  270,
  300,
  600
}
_EVENT_MOTION_TBL = {
  touch = "kit01_touch_00"
}
_god_warp_node = "locator2_sm38_c_dog_route_01"
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "escape_dog_01",
      type = "dog01",
      node = "locator2_sm38_c_dog",
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = Mob
  L1_2 = L0_1
  L0_1 = L0_1.topUpHatchery
  L0_1(L1_2)
  L0_1 = RAC_startCatWarpControl
  L1_2 = "sm38_c_area_out_01"
  L2_3 = nil
  L3_4 = "pccubesensor2_area_out_near_c_01"
  L4_5 = "pccubesensor2_area_out_far_c_01"
  L5_6 = "locator2_pc_return_pos_c_01"
  L6_7 = nil
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, "locator2_pc_return_pos_c_01", "sm38_09013", nil, nil)
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_findNpc
  L1_2 = "escape_dog_01"
  L0_1 = L0_1(L1_2)
  L1_2 = Fn_sendEventComSb
  L2_3 = "StartMobTask"
  L1_2(L2_3)
  function L1_2()
    Fn_warpNpc("escape_dog_01", _god_warp_node)
  end
  L3_4 = L0_1
  L2_3 = L0_1.setEventListener
  L4_5 = "npcFall"
  L5_6 = L1_2
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_setGrabNpc
  L3_4 = L0_1
  L4_5 = true
  L5_6 = true
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_missionStart
  L2_3()
  L2_3 = HUD
  L3_4 = L2_3
  L2_3 = L2_3.naviSetPochiDistanceDensity0
  L4_5 = 10
  L2_3(L3_4, L4_5)
  L2_3 = HUD
  L3_4 = L2_3
  L2_3 = L2_3.naviSetPochiDistanceDensity100
  L4_5 = 12
  L2_3(L3_4, L4_5)
  L2_3 = {}
  L2_3.anim_speed_over = true
  L2_3.anim_run_speed = 1.3
  L2_3.arrivedLength = 0.1
  L2_3.runLength = -1
  L2_3.noTurn = true
  L3_4 = Fn_moveNpc
  L4_5 = L0_1
  L5_6 = "locator2_sm38_c_dog_route_01"
  L6_7 = L2_3
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  L4_5 = Fn_userCtrlOn
  L4_5()
  L4_5 = Fn_getDistanceToPlayer
  L5_6 = _puppet_tbl
  L5_6 = L5_6.escape_dog_01
  L4_5 = L4_5(L5_6)
  if L4_5 > 20 then
    L4_5 = RAC_missionNaviCaption
    L5_6 = "sm38_01005"
    L6_7 = _puppet_tbl
    L6_7 = L6_7.escape_dog_01
    L4_5(L5_6, L6_7, "sm38_00114")
  else
    L4_5 = Fn_naviSet
    L5_6 = _puppet_tbl
    L5_6 = L5_6.escape_dog_01
    L4_5(L5_6)
  end
  while true do
    L5_6 = L3_4
    L4_5 = L3_4.isRunning
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L5_6 = L3_4
  L4_5 = L3_4.abort
  L4_5(L5_6)
  L3_4 = nil
  while true do
    L4_5 = Fn_getDistanceToPlayer
    L5_6 = _puppet_tbl
    L5_6 = L5_6.escape_dog_01
    L4_5 = L4_5(L5_6)
    if L4_5 > 20 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = Fn_missionViewEnd
  L4_5()
  L4_5 = RAC_endCatWarpControl
  L5_6 = "sm38_c_area_out_01"
  L4_5(L5_6)
  L4_5 = RAC_startCatWarpControl
  L5_6 = "sm38_c_area_out_02"
  L6_7 = nil
  L4_5(L5_6, L6_7, "pccubesensor2_area_out_near_c_02", "pccubesensor2_area_out_far_c_02", "locator2_pc_return_pos_c_02", nil, "locator2_pc_return_pos_c_02", "sm38_09013", nil, L1_2)
  L4_5 = Fn_captionViewWait
  L5_6 = "sm38_00113"
  L6_7 = 3
  L4_5(L5_6, L6_7, 1)
  L4_5 = Fn_missionView
  L5_6 = "sm38_00102"
  L4_5(L5_6)
  L4_5 = {}
  L4_5.prefix = "locator2_sm38_c_dog_route_"
  L5_6 = {
    L6_7,
    {"03", "01"},
    {"02", "06"},
    {"06", "07"},
    {"08", "07"},
    {"03", "04"},
    {"05", "04"},
    {"07", "01"}
  }
  L6_7 = {"08", "02"}
  L4_5.index_tbl = L5_6
  L5_6 = "locator2_sm38_c_dog_route_"
  L6_7 = SM38_initDogAutoFrame
  L6_7(_dog_move_interval_frame)
  L6_7 = {}
  L6_7.puppet = _puppet_tbl.escape_dog_01
  L6_7.per_pos = "locator2_sm38_c_dog_route_01"
  while true do
    if SM38_catchDogLoop(cap_tbl, L6_7, L4_5, L2_3, "C") == false then
    end
  end
  if _dog_move_task ~= nil then
    _dog_move_task:abort()
    _dog_move_task = nil
  end
  L5_6 = Fn_missionViewEnd
  L5_6()
  L5_6 = Fn_userCtrlAllOff
  L5_6()
  L5_6 = Fn_naviKill
  L5_6()
  L5_6 = RAC_endCatWarpControl
  L6_7 = "sm38_c_area_out_02"
  L5_6(L6_7)
  L5_6 = Fn_coercionPoseNomal
  L5_6()
  L5_6 = Fn_fadein
  L5_6()
  L5_6 = waitSeconds
  L6_7 = 2
  L5_6(L6_7)
  L5_6 = Fn_sendEventComSb
  L6_7 = "mobPanicStart"
  L5_6(L6_7)
  L5_6 = Fn_kaiwaDemoView
  L6_7 = "sm38_00900k"
  L5_6(L6_7)
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.dropGrabObject
  L5_6(L6_7)
  L5_6 = wait
  L5_6()
  L5_6 = Fn_moveNpc
  L6_7 = "escape_dog_01"
  L5_6(L6_7, {
    L4_5.prefix .. L4_5.index_tbl[_dog_move_index][1]
  }, L2_3)
  L5_6 = Fn_setGrabNpc
  L6_7 = L0_1
  L5_6(L6_7, true, true)
  L5_6 = waitSeconds
  L6_7 = 3
  L5_6(L6_7)
  L5_6 = Fn_kaiwaDemoView
  L6_7 = "sm38_01000k"
  L5_6(L6_7)
  L5_6 = Fn_userCtrlOn
  L5_6()
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
  if _cant_grab_wait_task ~= nil then
    _cant_grab_wait_task:abort()
    _cant_grab_wait_task = nil
  end
end
