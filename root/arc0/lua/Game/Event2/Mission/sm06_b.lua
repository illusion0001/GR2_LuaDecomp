dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm06_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_puppet_tbl = {}
_tutorial_flag_first = true
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_goal_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_banga_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_ryz_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_race")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_last")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_05")
  L0_0 = {
    {
      name = "shop_bingo",
      type = "man40",
      node = "locator2_shop_b_01"
    },
    {
      name = "shop_01",
      type = "man38",
      node = "locator2_shop_b_02",
      reset = false
    },
    {
      name = "shop_02",
      type = "man39",
      node = "locator2_shop_b_03",
      reset = false
    },
    {
      name = "shop_03",
      type = "wom22",
      node = "locator2_shop_b_04",
      reset = false
    },
    {
      name = "shop_04",
      type = "man41",
      node = "locator2_shop_b_05",
      reset = false
    },
    {
      name = "shop_05",
      type = "wom30",
      node = "locator2_shop_b_06",
      reset = false
    },
    {
      name = "shop_06",
      type = "man37",
      node = "locator2_shop_b_07",
      reset = false
    },
    {
      name = "goalshop_01",
      type = "wom21",
      node = "locator2_goal_shop_01b"
    },
    {
      name = "cust_01",
      type = "wom23",
      node = "locator2_cust_b_01",
      active = true,
      color_variation = 1,
      reset = false
    },
    {
      name = "dus_01",
      type = "dus01",
      node = "locator2_dus_01",
      active = false
    },
    {
      name = "ryz_01",
      type = "ryz01",
      node = "locator2_ryz_02",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _rival_table = {
    {
      name = "run_01",
      type = "wom23",
      node = "locator2_crowd_b_01"
    },
    {
      name = "run_02",
      type = "man78",
      node = "locator2_crowd_b_02"
    },
    {
      name = "run_03",
      type = "man38",
      node = "locator2_crowd_b_03"
    },
    {
      name = "run_04",
      type = "wom24",
      node = "locator2_crowd_b_04"
    },
    {
      name = "run_05",
      type = "wom18",
      node = "locator2_crowd_b_05"
    },
    {
      name = "run_06",
      type = "man38",
      node = "locator2_crowd_b_06",
      color_variation = 1
    },
    {
      name = "run_07",
      type = "wom25",
      node = "locator2_crowd_b_07"
    }
  }
  Fn_setupNpc(_rival_table)
  for _FORV_4_, _FORV_5_ in pairs(_rival_table) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm06_b_cut01")
  _sdemo_cut02 = SDemo.create("sm06_b_cut02")
  _sdemo_cut03 = SDemo.create("sm06_b_cut03")
  _sdemo_cut03:setCameraParam(nil, 0.1, nil)
  _sdemo_cut04 = SDemo.create("sm06_b_cut04")
  _sdemo_cut04:setCameraParam(nil, 0.1, nil)
  GameDatabase:set(ggd.GlobalSystemFlags__Mob, false)
  wait()
  GameDatabase:set(ggd.GlobalSystemFlags__Mob, true)
  Mob:restrict_sm06_00(true)
  Mob:restrictNavFor_sm06(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = {}
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_01"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[1] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_02"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[2] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_03"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[3] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_04"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[4] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_05"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[5] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_06"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[6] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "run_07"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[7] = L1_2
  L1_2 = {}
  L2_3 = Fn_repeatPlayMotion
  L2_3 = L2_3(L3_4, L4_5, L5_6)
  L1_2[1] = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L1_2[2] = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L1_2[3] = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L1_2[4] = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L1_2[5] = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L1_2[6] = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L1_2[7] = L2_3
  L2_3 = Fn_playMotionNpc
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_playLoopMotionInsert
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  L3_4(L4_5, L5_6)
  L3_4(L4_5)
  _sis_hdl = L3_4
  L3_4()
  if L3_4 ~= 1 then
    L3_4(L4_5)
    L3_4(L4_5)
    L3_4()
    L3_4(L4_5, L5_6, L6_7)
    L3_4(L4_5)
    L3_4(L4_5)
    L3_4(L4_5)
    for L6_7, L7_8 in L3_4(L4_5) do
      L8_9(L9_10)
      L11_12 = false
      L8_9(L9_10, L10_11, L11_12)
    end
    L3_4(L4_5, L5_6, L6_7)
    L4_5.pos = "locator2_camera_02"
    L4_5.time = 3.5
    L4_5.hashfunc = "EaseInOut"
    L5_6.pos = "locator2_camera_03"
    L5_6.time = 2
    L5_6.hashfunc = "EaseIn"
    L6_7.pos = "locator2_camera_04"
    L6_7.time = 3.8
    L6_7.hashfunc = "EaseOut"
    L7_8.pos = "locator2_camera_05"
    L7_8.time = 2
    L7_8.hashfunc = "EaseIn"
    L8_9.pos = "locator2_camera_06"
    L8_9.time = 1.5
    L8_9.hashfunc = "EaseOut"
    L5_6.pos = "locator2_aim_02"
    L5_6.time = 3.5
    L5_6.hashfunc = "EaseInOut"
    L6_7.pos = "locator2_aim_03"
    L6_7.time = 2
    L6_7.hashfunc = "EaseIn"
    L7_8.pos = "locator2_aim_04"
    L7_8.time = 3.8
    L7_8.hashfunc = "EaseOut"
    L8_9.pos = "locator2_aim_05"
    L8_9.time = 2
    L8_9.hashfunc = "EaseIn"
    L9_10.pos = "locator2_aim_05"
    L9_10.time = 1.5
    L9_10.hashfunc = "EaseOut"
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7, L7_8, L8_9, L9_10)
    L5_6(L6_7, L7_8, L8_9)
    L5_6()
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    while true do
      if L5_6 then
        L5_6()
      end
    end
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6()
    L5_6()
    for L8_9, L9_10 in L5_6(L6_7) do
      L11_12 = L9_10.name
      L10_11(L11_12, false)
    end
    L5_6(L6_7, L7_8)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7, L7_8, L8_9, L9_10)
    L5_6(L6_7)
    L5_6(L6_7, L7_8)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7)
    L5_6(L6_7, L7_8)
    L11_12 = "locator2_dus_move_06"
    L8_9.pos = "locator2_camera_look_dus_02"
    L8_9.time = L6_7
    L8_9.pos = "locator2_aim_look_dus_02"
    L8_9.time = L6_7
    L7_8(L8_9, L9_10, L10_11)
    L10_11.runLength = -1
    L10_11.anim_run_speed = 2
    L10_11.anim_speed_over = true
    L10_11.arrivedLength = 0
    while true do
      if L8_9 then
        L8_9()
      end
    end
    for L11_12, _FORV_12_ in L8_9(L9_10) do
      Fn_setNpcActive(_FORV_12_.name, true)
    end
    L8_9(L9_10)
    L11_12 = false
    L8_9(L9_10, L10_11, L11_12)
    L8_9(L9_10)
    L8_9(L9_10, L10_11)
  else
    L3_4(L4_5)
    L3_4(L4_5, L5_6)
  end
  L3_4[1] = L4_5
  L11_12 = "locator2_run02_move_07"
  L3_4[2] = L4_5
  L11_12 = "locator2_run03_move_07"
  L3_4[3] = L4_5
  L11_12 = "locator2_run04_move_07"
  L3_4[4] = L4_5
  L11_12 = "locator2_run05_move_07"
  L3_4[5] = L4_5
  L11_12 = "locator2_run06_move_07"
  L3_4[6] = L4_5
  L11_12 = "locator2_run07_move_07"
  L3_4[7] = L4_5
  L8_9.runLength = -1
  L8_9.anim_run_speed = 1.7
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[1] = L5_6
  L8_9.runLength = -1
  L8_9.anim_run_speed = 1.5
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[2] = L5_6
  L8_9.runLength = -1
  L8_9.anim_run_speed = 1.3
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[3] = L5_6
  L8_9.runLength = -1
  L8_9.anim_run_speed = 1.5
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[7] = L5_6
  L8_9.runLength = -1
  L8_9.anim_run_speed = 1.2
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[4] = L5_6
  L5_6(L6_7)
  L8_9.runLength = -1
  L8_9.anim_run_speed = 1.2
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[6] = L5_6
  L5_6(L6_7)
  L8_9.runLength = -1
  L8_9.anim_run_speed = 0.7
  L8_9.anim_speed_over = true
  L8_9.arrivedLength = 0
  L4_5[5] = L5_6
  L7_8()
  L7_8()
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L7_8(L8_9)
  L11_12 = L8_9(L9_10, L10_11)
  L7_8(L8_9, L9_10, L10_11, L11_12, L8_9(L9_10, L10_11))
  L11_12 = ""
  L7_8(L8_9, L9_10, L10_11, L11_12)
  L7_8(L8_9)
  L11_12 = ""
  L7_8(L8_9, L9_10, L10_11, L11_12)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8()
  L7_8(L8_9)
  L7_8()
  L7_8(L8_9, L9_10, L10_11)
  L7_8(L8_9)
  for L10_11, L11_12 in L7_8(L8_9) do
    Mv_safeTaskAbort(L11_12)
    Mv_safeTaskAbort(L5_6[L10_11])
  end
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  for L10_11, L11_12 in L7_8(L8_9) do
    if L10_11 == 4 then
      Fn_warpNpc(L11_12.name, "locator2_run04_reset_01")
      Fn_playMotionNpc(L11_12.name, "stay_03", false)
    else
      Fn_warpNpc(L11_12.name, L3_4[L10_11][#L3_4[L10_11]])
      Fn_playMotionNpc(L11_12.name, "stay", false)
    end
  end
  L7_8(L8_9, L9_10, L10_11)
  L7_8(L8_9, L9_10)
  L7_8()
  L7_8(L8_9)
  L11_12 = false
  L7_8(L8_9, L9_10, L10_11, L11_12)
  L11_12 = false
  L7_8(L8_9, L9_10, L10_11, L11_12)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8()
  L7_8(L8_9)
  L7_8(L8_9)
  move_sec = 2
  L8_9.pos = "locator2_cam_dusty_02"
  L8_9.time = L9_10
  cam_point = L7_8
  L8_9.pos = "locator2_aim_dusty_04"
  L8_9.time = L9_10
  aim_point = L7_8
  L7_8(L8_9, L9_10, L10_11)
  L7_8(L8_9)
  L7_8(L8_9, L9_10, L10_11)
  while true do
    if L7_8 then
      L7_8()
    end
  end
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8()
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L7_8(L8_9)
  for L10_11, L11_12 in L7_8(L8_9) do
    Fn_disappearNpc(L11_12.name)
  end
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8()
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8()
  L11_12 = true
  L7_8(L8_9, L9_10, L10_11, L11_12)
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  L7_8(L8_9, L9_10, L10_11)
  _sis_sensor = L7_8
  L7_8(L8_9, L9_10)
  L11_12 = 3
  L11_12 = L9_10(L10_11, L11_12, 4)
  L7_8(L8_9, L9_10, L10_11, L11_12, L9_10(L10_11, L11_12, 4))
  L11_12 = 0
  L11_12 = L9_10(L10_11, L11_12, 0)
  L7_8(L8_9, L9_10, L10_11, L11_12, L9_10(L10_11, L11_12, 0))
  L7_8(L8_9, L9_10)
  L7_8(L8_9, L9_10)
  L7_8(L8_9, L9_10)
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  L7_8()
  L7_8()
  L7_8()
  for L10_11, L11_12 in L7_8(L8_9) do
    Mv_safeTaskAbort(L11_12)
  end
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  for L10_11 = 1, 6 do
    L11_12 = Fn_disappearNpc
    L11_12("shop_" .. string.format("%02d", L10_11))
  end
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9, L9_10)
  L7_8(L8_9, L9_10, L10_11)
  L7_8(L8_9)
  L7_8()
  L7_8(L8_9)
  L11_12 = {}
  L11_12.runLength = -1
  while true do
    if L9_10 then
      L9_10()
    end
  end
  L9_10(L10_11)
  L11_12 = "locator2_sis_move_02"
  L9_10(L10_11, L11_12)
  L9_10(L10_11)
  L9_10(L10_11)
  L9_10()
  L9_10()
  L9_10()
  L9_10()
  L9_10()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  Mob:restrict_sm06_00(false)
  Mob:restrictNavFor_sm06(false)
end
function grabReset(A0_13, A1_14)
  Fn_appendNpcArea(A0_13, A1_14)
  Fn_setGrabReleaseNpc(A0_13)
  wait()
  Fn_warpNpc(A0_13, A1_14)
end
function _sis_sensorOnEnter(A0_15)
  invokeTask(function()
    if _tutorial_flag_first == true then
      waitSeconds(2.5)
    end
    if _sis_hdl:isGrabbed() == false then
      Fn_tutorialCaption("grab")
      _tutorial_flag_first = false
    end
  end)
end
function _sis_sensorOnLeave(A0_16)
  invokeTask(function()
    Fn_tutorialCaptionKill()
    wait()
  end)
end
function pccubesensor2_goal_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_goal_01")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_banga_02_OnEnter()
  Fn_pcSensorOff("pccubesensor2_banga_02")
  Sound:playSE("sis006c", 1, "", _sis_hdl)
  Fn_captionView("sm06_01011")
end
function pccubesensor2_ryz_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_ryz_01")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_warning_last_OnLeave()
  Fn_captionView("sm06_01101")
  Player:setStay(true, false)
  Player:setStay(false, false)
  Fn_pcSensorOn("pccubesensor2_warp_05")
  Fn_setCatWarpCheckPoint("locator2_resetpos_03")
end
function pccubesensor2_warp_race_OnLeave()
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_captionViewWait("sm06_01016")
    Fn_blackout()
    Fn_nextMission()
    Fn_exitSandbox()
    GameDatabase:set(ggd.EventFlags__sm06__flag01, 1)
  end)
end
function pccubesensor2_warp_05_OnLeave()
  invokeTask(function()
    if _sis_hdl:isGrabbed() then
      Fn_catWarp()
      Fn_warpNpc("sm06_client", "locator2_sis_resetpos_shop_01")
      repeat
        Player:setGrabObject(_sis_hdl)
        wait()
      until Player:getGrabObjectCount() > 0
    else
      Fn_catWarp()
    end
  end)
end
