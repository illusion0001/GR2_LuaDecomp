dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm38_common.lua")
_dog_move_interval_frame = {1}
_puppet_tbl = {}
_dog_motion = {
  glad = "dog01_glad_00",
  sit = "dog01_sit_00"
}
_dusty_motion = {
  sit = "dus01_sit_00"
}
_god_warp_node = "locator2_sm38_d_dog"
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "escape_dog_01",
      type = "dog01",
      node = "locator2_sm38_d_dog",
      reset = false
    },
    {
      name = "escape_dog_02",
      type = "dog01",
      node = "locator2_sm_38_d_dog_end_pos",
      active = false,
      not_mob = true
    },
    {
      name = "d_dusty",
      type = "dus01",
      node = "locator2_sm_38_d_dus01_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _puppet_tbl.escape_dog_01:setIgnoreGrab(true)
  Fn_loadNpcEventMotion("escape_dog_02", _dog_motion)
  Fn_loadNpcEventMotion("d_dusty", _dusty_motion)
  _sdemo_cut02 = SDemo.create("sm38_d_cut02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = Fn_findNpc
  L1_2 = "escape_dog_01"
  L0_1 = L0_1(L1_2)
  function L1_2()
    Fn_warpNpc("escape_dog_01", _god_warp_node)
  end
  L3_4 = L0_1
  L2_3 = L0_1.setEventListener
  L4_5 = "npcFall"
  L5_6 = L1_2
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = RAC_startCatWarpControl
  L3_4 = "sm38_d_area_out_01"
  L4_5 = nil
  L5_6 = "pccubesensor2_area_out_near_d_02"
  L6_7 = "pccubesensor2_area_out_far_d_02"
  L7_8 = "locator2_pc_start_pos"
  L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, nil, "locator2_pc_start_pos", "sm38_09013", nil, L1_2)
  L2_3 = Fn_setGrabNpc
  L3_4 = L0_1
  L4_5 = true
  L5_6 = true
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_sendEventComSb
  L3_4 = "mobPanicStart"
  L2_3(L3_4)
  L2_3 = Fn_sendEventComSb
  L3_4 = "StartMobTask"
  L2_3(L3_4)
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
  L2_3 = Fn_userCtrlOn
  L2_3()
  L2_3 = RAC_missionNaviCaption
  L3_4 = "sm38_00102"
  L4_5 = _puppet_tbl
  L4_5 = L4_5.escape_dog_01
  L5_6 = "sm38_00125"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = "locator2_sm38_d_dog_route_"
  L3_4 = SM38_initDogAutoFrame
  L4_5 = _dog_move_interval_frame
  L3_4(L4_5)
  L3_4 = {}
  L3_4.anim_speed_over = true
  L3_4.anim_run_speed = 1.5
  L3_4.arrivedLength = 0.1
  L3_4.runLength = -1
  L3_4.noTurn = true
  L4_5 = {}
  L5_6 = _puppet_tbl
  L5_6 = L5_6.escape_dog_01
  L4_5.puppet = L5_6
  L4_5.per_pos = "locator2_sm38_d_dog_route_01"
  L5_6 = {}
  L5_6.prefix = "locator2_sm38_d_dog_route_"
  L6_7 = {
    L7_8,
    {"03", "01"},
    {"02", "06"},
    {"06", "07"},
    {"08", "07"},
    {"03", "04"},
    {"05", "04"},
    {"07", "01"}
  }
  L7_8 = {"08", "02"}
  L5_6.index_tbl = L6_7
  while true do
    L6_7 = SM38_catchDogLoop
    L7_8 = cap_tbl
    L6_7 = L6_7(L7_8, L4_5, L5_6, dog, "D")
    if L6_7 == false then
    end
  end
  L6_7 = _dog_move_task
  if L6_7 ~= nil then
    L6_7 = _dog_move_task
    L7_8 = L6_7
    L6_7 = L6_7.abort
    L6_7(L7_8)
    _dog_move_task = nil
  end
  L2_3 = Fn_missionViewEnd
  L2_3()
  L2_3 = Fn_naviKill
  L2_3()
  L2_3 = RAC_endCatWarpControl
  L3_4 = "sm38_d_area_out_01"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 2
  L2_3(L3_4)
  L2_3 = Fn_blackout
  L2_3()
  L2_3 = Fn_userCtrlAllOff
  L2_3()
  L2_3 = Fn_sendEventComSb
  L3_4 = "EndMobTask"
  L2_3(L3_4)
  L2_3 = Player
  L3_4 = L2_3
  L2_3 = L2_3.dropGrabObject
  L2_3(L3_4)
  L2_3 = Fn_disappearNpc
  L3_4 = "escape_dog_01"
  L2_3(L3_4)
  L2_3 = Fn_resetPcPos
  L3_4 = "locator2_pc_end_pos"
  L2_3(L3_4)
  L2_3 = Fn_setNpcActive
  L3_4 = "escape_dog_01"
  L2_3(L3_4)
  L2_3 = Fn_setNpcVisible
  L3_4 = "sm38_client"
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = Fn_warpNpc
  L3_4 = "sm38_client"
  L4_5 = "locator2_sm38_client_end_pos"
  L2_3(L3_4, L4_5)
  L2_3 = Fn_setCatActive
  L3_4 = false
  L2_3(L3_4)
  L2_3 = Fn_setNpcActive
  L3_4 = "d_dusty"
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = Fn_setNpcActive
  L3_4 = "escape_dog_02"
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = Player
  L3_4 = L2_3
  L2_3 = L2_3.setStay
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = _sdemo_cut02
  L3_4 = L2_3
  L2_3 = L2_3.set
  L4_5 = "locator2_d_demo1_cam_01"
  L5_6 = "locator2_d_demo1_aim_01"
  L6_7 = true
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = _sdemo_cut02
  L3_4 = L2_3
  L2_3 = L2_3.play
  L2_3(L3_4)
  L2_3 = Fn_playMotionNpc
  L3_4 = "escape_dog_02"
  L4_5 = _dog_motion
  L4_5 = L4_5.sit
  L5_6 = false
  L6_7 = {}
  L6_7.animBlendDuration = 0.3
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = Fn_playMotionNpc
  L3_4 = "d_dusty"
  L4_5 = _dusty_motion
  L4_5 = L4_5.sit
  L5_6 = false
  L6_7 = {}
  L6_7.animBlendDuration = 0.3
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = Fn_fadein
  L2_3()
  L2_3 = Fn_kaiwaDemoView
  L3_4 = "sm38_01200k"
  L2_3(L3_4)
  L2_3 = _sdemo_cut02
  L3_4 = L2_3
  L2_3 = L2_3.play
  L4_5 = {L5_6}
  L5_6 = {}
  L5_6.pos = "locator2_d_demo1_cam_02"
  L5_6.time = 3
  L5_6.hashfunc = "EaseInOut"
  L5_6 = {L6_7}
  L6_7 = {}
  L6_7.pos = "locator2_sm_38_d_dog_end_pos"
  L6_7.time = 3
  L6_7.hashfunc = "EaseInOut"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = waitSeconds
  L3_4 = 4
  L2_3(L3_4)
  L2_3 = Fn_kaiwaDemoView
  L3_4 = "sm38_01250k"
  L2_3(L3_4)
  L2_3 = _sdemo_cut02
  L3_4 = L2_3
  L2_3 = L2_3.play
  L4_5 = {L5_6}
  L5_6 = {}
  L5_6.pos = "locator2_d_demo1_cam_01"
  L5_6.time = 1.5
  L5_6.hashfunc = "EaseInOut"
  L5_6 = {L6_7}
  L6_7 = {}
  L6_7.pos = "locator2_d_demo1_aim_01"
  L6_7.time = 1.5
  L6_7.hashfunc = "EaseInOut"
  L2_3(L3_4, L4_5, L5_6)
  while true do
    L2_3 = _sdemo_cut02
    L3_4 = L2_3
    L2_3 = L2_3.isPlay
    L2_3 = L2_3(L3_4)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = invokeTask
  function L3_4()
    Fn_moveNpc("sm38_client", "locator2_sm38_client_end_pos_02", {runLength = 1000, recast = true})
    Fn_moveNpc("escape_dog_02", "locator2_sm_38_d_dog_end_02", {runLength = 1000, recast = true})
  end
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 0.5
  L2_3(L3_4)
  L2_3 = Fn_blackout
  L2_3()
  L2_3 = findGameObject2
  L3_4 = "Node"
  L4_5 = "locator2_pc_turn_pos"
  L2_3 = L2_3(L3_4, L4_5)
  L3_4 = L2_3
  L2_3 = L2_3.getWorldPos
  L2_3 = L2_3(L3_4)
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_pc_end_pos_f"
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = L3_4
  L3_4 = L3_4.getWorldPos
  L3_4 = L3_4(L4_5)
  L4_5 = L2_3 - L3_4
  L5_6 = Fn_get_distance_angle
  L6_7 = L3_4
  L7_8 = L2_3
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = YRotQuat
  L7_8 = Deg2Rad
  L7_8 = L7_8(L5_6)
  L6_7 = L6_7(L7_8, L7_8(L5_6))
  L7_8 = RAC_createGameObject2
  L7_8 = L7_8("player_pos", "Node", L3_4, L6_7)
  Fn_resetPcPos(L7_8)
  _sdemo_cut02:set("locator2_d_demo1_cam_03", "locator2_d_demo1_cam_01", true)
  _sdemo_cut02:play()
  Fn_warpNpc("sm38_client", "locator2_sm38_client_end_pos_01")
  Fn_warpNpc("escape_dog_02", "locator2_sm_38_d_dog_end_01")
  Fn_fadein()
  waitSeconds(1)
  Fn_kaiwaDemoView("sm38_01300k")
  _sdemo_cut02:stop(1)
  Fn_setNpcActive("d_dusty", false)
  Fn_setCatActive(true)
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_fadein()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  RAC_endCatWarpControl("sm38_d_area_out_01")
  Fn_sendEventComSb("mobPanicEnd")
  Fn_sendEventComSb("EndMobTask")
  if _cant_grab_wait_task ~= nil then
    _cant_grab_wait_task:abort()
    _cant_grab_wait_task = nil
  end
end
