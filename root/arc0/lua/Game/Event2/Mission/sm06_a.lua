dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm06_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
TALK_MAX_NUM = 3
_SIS_CAPTION_STEP = {
  BEFORE_01 = 1,
  VIEW_01 = 2,
  BEFORE_02 = 3,
  VIEW_02 = 4,
  BEFORE_03 = 5,
  VIEW_03 = 6,
  END = 7
}
_GAME_STEP = {
  GO_RYZ_DOOR = 1,
  KIKIKOMI = 2,
  SEARCH_GAW = 3,
  SEARCH_SIS = 4,
  FOUND_SIS = 5,
  GO_MARKET = 6
}
_puppet_tbl = {}
_talked_count = 0
_last_talk = nil
_caption_state = _SIS_CAPTION_STEP.BEFORE_01
_game_satate = _GAME_STEP.GO_RYZ_DOOR
_far_navi_permission = false
_tutorial_flag_first = true
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_hesitate_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_hesitate_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_hesitate_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_ryzdoor_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_gaw_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_kikikomi_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_find_cid_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_sis_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market_landing_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_out_of_ryz")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_market")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_04")
  L0_0 = {
    {
      name = "man_01",
      type = "man32",
      node = "locator2_man_01",
      attach = false
    },
    {
      name = "wom_01",
      type = "wom17",
      node = "locator2_wom_01",
      attach = false
    },
    {
      name = "miz01",
      type = "miz01",
      node = "locator2_mizai_01",
      attach = false
    },
    {
      name = "gaw_01",
      type = "man34",
      node = "locator2_gaw_01",
      active = false,
      attach = false
    },
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_cid_01",
      active = false,
      attach = false
    },
    {
      name = "shop_bingo",
      type = "man40",
      node = "locator2_shop_a_01",
      active = false
    },
    {
      name = "goalshop_01",
      type = "wom21",
      node = "locator2_goal_shop_01",
      active = false
    },
    {
      name = "cust_01",
      type = "wom23",
      node = "locator2_cust_01",
      active = false,
      color_variation = 1
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _shop_table = {
    {
      name = "shop_01",
      type = "man38",
      node = "locator2_shop_a_02",
      active = false
    },
    {
      name = "shop_02",
      type = "man39",
      node = "locator2_shop_a_03",
      active = false
    },
    {
      name = "shop_03",
      type = "wom22",
      node = "locator2_shop_a_04",
      active = false
    },
    {
      name = "shop_04",
      type = "man41",
      node = "locator2_shop_a_05",
      active = false
    },
    {
      name = "shop_05",
      type = "wom30",
      node = "locator2_shop_a_06",
      active = false
    },
    {
      name = "shop_06",
      type = "man37",
      node = "locator2_shop_a_07",
      active = false
    }
  }
  Fn_setupNpc(_shop_table)
  for _FORV_4_, _FORV_5_ in pairs(_shop_table) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _rival_table = {
    {
      name = "run_01",
      type = "wom23",
      node = "locator2_crowd_a_01",
      active = false
    },
    {
      name = "run_02",
      type = "man78",
      node = "locator2_crowd_a_02",
      active = false
    },
    {
      name = "run_03",
      type = "man38",
      node = "locator2_crowd_a_03",
      active = false
    },
    {
      name = "run_04",
      type = "wom24",
      node = "locator2_crowd_a_04",
      active = false
    },
    {
      name = "run_05",
      type = "wom26",
      node = "locator2_crowd_a_05",
      active = false
    },
    {
      name = "run_06",
      type = "man38",
      node = "locator2_crowd_a_06",
      active = false,
      color_variation = 1
    },
    {
      name = "run_07",
      type = "wom25",
      node = "locator2_crowd_a_07",
      active = false
    }
  }
  Fn_setupNpc(_rival_table)
  for _FORV_4_, _FORV_5_ in pairs(_rival_table) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_setKaiwaDemo(_puppet_tbl.man_01, "sm06_00500k", function()
    kaiwaCountUp()
    _last_talk = "man_01"
  end, true)
  Fn_setKaiwaDemo(_puppet_tbl.wom_01, "sm06_00520k", function()
    kaiwaCountUp()
    _last_talk = "wom_01"
  end, true)
  Fn_setKaiwaDemo(_puppet_tbl.miz01, "sm06_00510k", function()
    kaiwaCountUp()
    _last_talk = "miz01"
  end, true)
  Fn_disableKaiwaDemo(_puppet_tbl.man_01)
  Fn_disableKaiwaDemo(_puppet_tbl.wom_01)
  Fn_disableKaiwaDemo(_puppet_tbl.miz01)
  _sis_hdl = Fn_findNpcPuppet("sm06_client")
  if Fn_findNpc("sm03_client") ~= nil then
    Fn_disappearNpc("sm03_client")
  end
  Mob:restrict_sm06_00(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_getPlayer
  L0_1 = L0_1()
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_playMotionNpc
  L2_3 = "man_01"
  L3_4 = "check_00"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm06_00100k"
  L1_2(L2_3)
  L1_2 = invokeTask
  function L2_3()
    Fn_turnNpc("sm06_client")
  end
  L1_2(L2_3)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setGrabExceptionalObject
  L3_4 = {L4_5}
  L4_5 = "sm06_client"
  L1_2(L2_3, L3_4)
  L1_2 = Fn_setGrabNpc
  L2_3 = "sm06_client"
  L3_4 = false
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = createGameObject2
  L2_3 = "PlayerSensor"
  L1_2 = L1_2(L2_3)
  _sis_sensor = L1_2
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setDetectBehavior
  L3_4 = 1
  L1_2(L2_3, L3_4)
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.addBox
  L3_4 = Vector
  L4_5 = 6
  L5_6 = 5
  L6_7 = 6
  L27_28 = L3_4(L4_5, L5_6, L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L3_4(L4_5, L5_6, L6_7))
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setPos
  L3_4 = Vector
  L4_5 = 0
  L5_6 = 0
  L6_7 = 0
  L27_28 = L3_4(L4_5, L5_6, L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L3_4(L4_5, L5_6, L6_7))
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setOnEnter
  L3_4 = "_sis_sensorOnEnter"
  L1_2(L2_3, L3_4)
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setOnLeave
  L3_4 = "_sis_sensorOnLeave"
  L1_2(L2_3, L3_4)
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setActive
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = _sis_hdl
  L2_3 = L1_2
  L1_2 = L1_2.appendChild
  L3_4 = _sis_sensor
  L1_2(L2_3, L3_4)
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.try_init
  L1_2(L2_3)
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.waitForReady
  L1_2(L2_3)
  L1_2 = _sis_sensor
  L2_3 = L1_2
  L1_2 = L1_2.try_start
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_out_of_ryz"
  L1_2(L2_3)
  L1_2 = Fn_missionView
  L2_3 = "sm06_00100"
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 1.3
  L1_2(L2_3)
  L1_2 = grabWait
  L2_3 = _sis_hdl
  L3_4 = _sis_sensor
  L1_2(L2_3, L3_4)
  L1_2 = Fn_naviSet
  L2_3 = findGameObject2
  L3_4 = "Node"
  L4_5 = "locator2_navi_01"
  L27_28 = L2_3(L3_4, L4_5)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L2_3(L3_4, L4_5))
  L1_2 = Fn_captionView
  L2_3 = "sm06_01100"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_hesitate_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_hesitate_02"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_hesitate_03"
  L1_2(L2_3)
  repeat
    L1_2 = _caption_state
    L2_3 = _SIS_CAPTION_STEP
    L2_3 = L2_3.VIEW_01
    if L1_2 == L2_3 then
      L1_2 = Sound
      L2_3 = L1_2
      L1_2 = L1_2.playSE
      L3_4 = "sis015"
      L4_5 = 1
      L5_6 = ""
      L6_7 = _sis_hdl
      L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
      L1_2 = Fn_captionView
      L2_3 = "sm06_00101"
      L1_2(L2_3)
      L1_2 = _SIS_CAPTION_STEP
      L1_2 = L1_2.BEFORE_02
      _caption_state = L1_2
    else
      L1_2 = _caption_state
      L2_3 = _SIS_CAPTION_STEP
      L2_3 = L2_3.VIEW_02
      if L1_2 == L2_3 then
        L1_2 = Sound
        L2_3 = L1_2
        L1_2 = L1_2.playSE
        L3_4 = "sis015"
        L4_5 = 1
        L5_6 = ""
        L6_7 = _sis_hdl
        L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
        L1_2 = Fn_captionView
        L2_3 = "sm06_00102"
        L1_2(L2_3)
        L1_2 = _SIS_CAPTION_STEP
        L1_2 = L1_2.BEFORE_03
        _caption_state = L1_2
      else
        L1_2 = _caption_state
        L2_3 = _SIS_CAPTION_STEP
        L2_3 = L2_3.VIEW_03
        if L1_2 == L2_3 then
          L1_2 = Sound
          L2_3 = L1_2
          L1_2 = L1_2.playSE
          L3_4 = "sis015"
          L4_5 = 1
          L5_6 = ""
          L6_7 = _sis_hdl
          L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
          L1_2 = Fn_captionView
          L2_3 = "sm06_00103"
          L1_2(L2_3)
          L1_2 = _SIS_CAPTION_STEP
          L1_2 = L1_2.END
          _caption_state = L1_2
          break
        end
      end
    end
    L1_2 = wait
    L1_2()
    L1_2 = false
  until L1_2
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_01"
  L1_2(L2_3)
  L1_2 = Mv_waitPhase
  L1_2()
  L1_2 = Fn_naviKill
  L1_2()
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_out_of_ryz"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_warp_01"
  L1_2(L2_3)
  L1_2 = Fn_blackout
  L1_2()
  L1_2 = Fn_userCtrlOff
  L1_2()
  L1_2 = Fn_setGrabReleaseNpc
  L2_3 = "sm06_client"
  L1_2(L2_3)
  L1_2 = Fn_setGrabNpc
  L2_3 = "sm06_client"
  L3_4 = true
  L4_5 = true
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setGrabExceptionalObject
  L3_4 = {}
  L1_2(L2_3, L3_4)
  L1_2 = waitSeconds
  L2_3 = 1
  L1_2(L2_3)
  L1_2 = Fn_resetPcPos
  L2_3 = "locator2_resetpos_arrive_ryzhouse_01"
  L1_2(L2_3)
  L1_2 = Fn_warpNpc
  L2_3 = "sm06_client"
  L3_4 = "locator2_sis_arrive_ryzhouse_01"
  L1_2(L2_3, L3_4)
  L1_2 = waitSeconds
  L2_3 = 1.5
  L1_2(L2_3)
  L1_2 = Fn_fadein
  L1_2()
  L1_2 = waitSeconds
  L2_3 = 1.2
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm06_00200k"
  L1_2(L2_3)
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = invokeTask
  function L2_3()
    while true do
      if Fn_getDistanceToPlayer("locator2_navi_ryzdoor_01") <= 4 then
        Fn_turnNpc("sm06_client", "locator2_navi_ryzdoor_01")
      end
      wait()
    end
  end
  L1_2 = L1_2(L2_3)
  L2_3 = Fn_playLoopMotionInsert
  L3_4 = "sm06_client"
  L4_5 = "stay"
  L5_6 = {L6_7}
  L6_7 = "stay_02"
  L6_7 = 3
  L7_8 = 5
  L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8)
  _sis_motion_task = L2_3
  L2_3 = Fn_missionView
  L3_4 = "sm06_00104"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_ryzdoor_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_far_kikikomi_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_far_01"
  L2_3(L3_4)
  L2_3 = invokeTask
  function L3_4()
    waitSeconds(1.3)
    Fn_naviSet(findGameObject2("Node", "locator2_navi_ryzdoor_01"))
  end
  L2_3 = L2_3(L3_4)
  while true do
    L3_4 = Player
    L4_5 = L3_4
    L3_4 = L3_4.getAction
    L3_4 = L3_4(L4_5)
    L4_5 = Mv_isWaitPhase
    L4_5 = L4_5()
    if not L4_5 then
      L4_5 = Player
      L4_5 = L4_5.kAction_Idle
    end
    if L3_4 ~= L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  _mv_is_goto_next_phase = false
  L3_4 = Mv_safeTaskAbort
  L4_5 = L2_3
  L3_4 = L3_4(L4_5)
  L2_3 = L3_4
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_ryzdoor_01"
  L3_4(L4_5)
  L3_4 = Fn_naviKill
  L3_4()
  L3_4 = Mv_safeTaskAbort
  L4_5 = _sis_motion_task
  L3_4 = L3_4(L4_5)
  _sis_motion_task = L3_4
  L3_4 = Mv_safeTaskAbort
  L4_5 = L1_2
  L3_4 = L3_4(L4_5)
  L1_2 = L3_4
  L3_4 = waitSeconds
  L4_5 = 1
  L3_4(L4_5)
  function L3_4()
    Fn_userCtrlOff()
    Fn_resetPcPos("locator2_resetpos_01")
    Fn_warpNpc("sm06_client", "locator2_sis_walk_01")
    waitSeconds(0.7)
    Fn_playMotionNpc("sm06_client", "stay", false)
    _game_satate = _GAME_STEP.KIKIKOMI
    _far_navi_permission = true
    Fn_missionViewEnd()
    Fn_missionInfoEnd()
  end
  L4_5 = Fn_kaiwaDemoView2
  L5_6 = "sm06_00300k"
  L6_7 = L3_4
  L4_5(L5_6, L6_7)
  L4_5 = waitSeconds
  L5_6 = 2
  L4_5(L5_6)
  L4_5 = Fn_kaiwaDemoView
  L5_6 = "sm06_00400k"
  L4_5(L5_6)
  L4_5 = Fn_userCtrlOn
  L4_5()
  L4_5 = {L5_6, L6_7}
  L5_6 = "locator2_sis_run_01"
  L6_7 = "locator2_sis_run_02"
  _wom_motion_task = nil
  L5_6 = invokeTask
  function L6_7()
    local L0_29
    L0_29 = Fn_playMotionNpc
    L0_29("sm06_client", "stay_01", false)
    L0_29 = waitSeconds
    L0_29(3)
    L0_29 = Fn_turnNpc
    L0_29("sm06_client", _puppet_tbl.wom_01)
    L0_29 = Fn_moveNpc
    L0_29 = L0_29("sm06_client", L4_5, {arrivedLength = 0})
    while Mv_isSafeTaskRunning(L0_29) do
      wait()
    end
    waitSeconds(0.5)
    Fn_turnNpc("sm06_client", _puppet_tbl.wom_01)
    Fn_enableKaiwaDemo(_puppet_tbl.wom_01)
    _sis_motion_task = Fn_playLoopMotionInsert("sm06_client", "talk_00", {"talk_00"}, 10, 20)
    _wom_motion_task = Fn_playLoopMotionInsert("wom_01", "talk_02", {"stay"}, 10, 20)
  end
  L5_6(L6_7)
  L5_6 = Fn_missionView
  L6_7 = "sm06_00105"
  L5_6(L6_7)
  L5_6 = waitSeconds
  L6_7 = 1.3
  L5_6(L6_7)
  L5_6 = Fn_enableKaiwaDemo
  L6_7 = _puppet_tbl
  L6_7 = L6_7.man_01
  L5_6(L6_7)
  L5_6 = Fn_enableKaiwaDemo
  L6_7 = _puppet_tbl
  L6_7 = L6_7.miz01
  L5_6(L6_7)
  while true do
    while true do
      L5_6 = _talked_count
      L6_7 = TALK_MAX_NUM
      if L5_6 < L6_7 then
        L5_6 = wait
        L5_6()
      end
    end
  end
  while true do
    L5_6 = Fn_getDistanceToPlayer
    L6_7 = _puppet_tbl
    L7_8 = _last_talk
    L6_7 = L6_7[L7_8]
    L5_6 = L5_6(L6_7)
    if not (L5_6 >= 5) then
      L5_6 = wait
      L5_6()
    end
  end
  L5_6 = _last_talk
  if L5_6 == "man_01" then
    L5_6 = Fn_kaiwaDemoView
    L6_7 = "sm06_00530k"
    L5_6(L6_7)
  else
    L5_6 = _last_talk
    if L5_6 == "wom_01" then
      L5_6 = Fn_kaiwaDemoView
      L6_7 = "sm06_00550k"
      L5_6(L6_7)
    else
      L5_6 = Fn_kaiwaDemoView
      L6_7 = "sm06_00540k"
      L5_6(L6_7)
    end
  end
  L5_6 = Fn_setNpcActive
  L6_7 = "gaw_01"
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = _GAME_STEP
  L5_6 = L5_6.SEARCH_GAW
  _game_satate = L5_6
  _far_navi_permission = false
  L5_6 = Mv_invokeMissionViewNaviCaption
  L6_7 = "sm06_00107"
  L7_8 = _puppet_tbl
  L7_8 = L7_8.gaw_01
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Mv_viewObj
  L6_7 = _puppet_tbl
  L6_7 = L6_7.gaw_01
  L7_8 = 0.5
  L5_6(L6_7, L7_8)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_gaw_01"
  L5_6(L6_7)
  L5_6 = Mv_waitPhase
  L5_6()
  L5_6 = Fn_turnNpc
  L6_7 = "gaw_01"
  L5_6(L6_7)
  L5_6 = waitSeconds
  L6_7 = 0.5
  L5_6(L6_7)
  L5_6 = Fn_kaiwaDemoView
  L6_7 = "sm06_00600k"
  L5_6(L6_7)
  L5_6 = Mv_safeTaskAbort
  L6_7 = _sis_motion_task
  L5_6 = L5_6(L6_7)
  _sis_motion_task = L5_6
  L5_6 = Fn_playLoopMotionInsert
  L6_7 = "wom_01"
  L7_8 = "stay_02"
  L5_6 = L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
  _wom_motion_task = L5_6
  L5_6 = _GAME_STEP
  L5_6 = L5_6.SEARCH_SIS
  _game_satate = L5_6
  _far_navi_permission = true
  L5_6 = Fn_setNpcActive
  L6_7 = "cid01"
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = Fn_warpNpc
  L6_7 = "sm06_client"
  L7_8 = "locator2_sis_02"
  L5_6(L6_7, L7_8)
  L5_6 = Mv_invokeMissionViewNaviCaption
  L6_7 = "sm06_00108"
  L7_8 = nil
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_playMotionNpc
  L6_7 = "cid01"
  L7_8 = "talk_lady_01"
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_playLoopMotionInsert
  L6_7 = "sm06_client"
  L7_8 = "talk_00"
  L5_6 = L5_6(L6_7, L7_8, L8_9, L9_10, L10_11)
  _sis_motion_task = L5_6
  while true do
    L5_6 = findGameObject2
    L6_7 = "Node"
    L7_8 = "pccubesensor2_sis_03"
    L5_6 = L5_6(L6_7, L7_8)
    L6_7 = Fn_getDistanceToPlayer
    L7_8 = _sis_hdl
    L6_7 = L6_7(L7_8)
    L7_8 = Vector
    L7_8 = L7_8(L8_9, L9_10, L10_11)
    L11_12 = 150
    L12_13 = 20
    L13_14 = L7_8
    if L8_9 then
      if L8_9 and L6_7 <= 40 then
        L11_12 = 1
        L12_13 = ""
        L13_14 = Player
        L13_14 = L13_14.getPuppet
        L27_28 = L13_14()
        L8_9(L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L13_14())
        L8_9(L9_10)
        break
      end
    end
    L8_9()
  end
  L5_6 = Mv_viewObjWait
  L6_7 = _sis_hdl
  L7_8 = 0.5
  L5_6 = L5_6(L6_7, L7_8, L8_9)
  L6_7 = Fn_naviSet
  L7_8 = _sis_hdl
  L6_7(L7_8)
  L6_7 = _GAME_STEP
  L6_7 = L6_7.FOUND_SIS
  _game_satate = L6_7
  _far_navi_permission = false
  L6_7 = Mv_safeTaskAbort
  L7_8 = L5_6
  L6_7 = L6_7(L7_8)
  L5_6 = L6_7
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_find_cid_01"
  L6_7(L7_8)
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_sis_03"
  L6_7(L7_8)
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = Mv_safeTaskAbort
  L7_8 = _sis_motion_task
  L6_7 = L6_7(L7_8)
  _sis_motion_task = L6_7
  L6_7 = Fn_playMotionNpc
  L7_8 = "cid01"
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_far_kikikomi_01"
  L6_7(L7_8)
  L6_7 = Fn_captionViewEnd
  L6_7()
  L6_7 = Fn_turnNpc
  L7_8 = "sm06_client"
  L6_7(L7_8)
  L6_7 = Fn_turnNpc
  L7_8 = "cid01"
  L6_7(L7_8)
  L6_7 = Fn_kaiwaDemoView
  L7_8 = "sm06_00700k"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_far_01"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_warp_02"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_warning_market"
  L6_7(L7_8)
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.setGrabExceptionalObject
  L6_7(L7_8, L8_9)
  L6_7 = Fn_setGrabNpc
  L7_8 = "sm06_client"
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = _GAME_STEP
  L6_7 = L6_7.GO_MARKET
  _game_satate = L6_7
  L6_7 = Fn_playMotionNpc
  L7_8 = "sm06_client"
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Fn_missionView
  L7_8 = "sm06_00111"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 1.3
  L6_7(L7_8)
  L6_7 = grabWait
  L7_8 = _sis_hdl
  L6_7(L7_8, L8_9)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_market_landing_01"
  L6_7(L7_8)
  L6_7 = Fn_turnNpc
  L7_8 = "cid01"
  L6_7(L7_8, L8_9)
  L6_7 = Fn_playMotionNpc
  L7_8 = "cid01"
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Fn_naviSet
  L7_8 = findGameObject2
  L27_28 = L7_8(L8_9, L9_10)
  L6_7(L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L7_8(L8_9, L9_10))
  L6_7 = Fn_captionView
  L7_8 = "sm06_00112"
  L6_7(L7_8)
  L6_7 = Fn_playMotionNpc
  L7_8 = "cid01"
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Mv_viewObj
  L7_8 = "locator2_navi_02"
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = invokeTask
  L7_8(L8_9)
  L7_8 = invokeTask
  L7_8 = L7_8(L8_9)
  L8_9()
  L7_8 = L8_9
  L8_9()
  L8_9(L9_10)
  L8_9(L9_10)
  L8_9(L9_10, L10_11)
  L8_9(L9_10)
  _wom_motion_task = L8_9
  for L11_12, L12_13 in L8_9(L9_10) do
    L13_14 = Fn_setNpcActive
    L14_15 = L12_13.name
    L15_16 = true
    L13_14(L14_15, L15_16)
  end
  L8_9(L9_10, L10_11)
  L8_9(L9_10, L10_11)
  L8_9(L9_10, L10_11)
  for L11_12, L12_13 in L8_9(L9_10) do
    L13_14 = Fn_setNpcActive
    L14_15 = L12_13.name
    L15_16 = true
    L13_14(L14_15, L15_16)
  end
  L8_9(L9_10)
  L8_9(L9_10)
  L8_9(L9_10)
  L11_12 = "shop_01"
  L12_13 = "vendor_attract_00"
  L13_14 = {L14_15}
  L14_15 = "lookaround"
  L14_15 = 4
  L15_16 = 4
  L8_9[1] = L10_11
  L11_12 = "shop_02"
  L12_13 = "handclap"
  L13_14 = {L14_15}
  L14_15 = "talk_02"
  L14_15 = 5
  L15_16 = 5
  L8_9[2] = L10_11
  L11_12 = "shop_03"
  L12_13 = "handclap"
  L13_14 = {L14_15}
  L14_15 = "call_00"
  L14_15 = 2
  L15_16 = 2
  L8_9[3] = L10_11
  L11_12 = "shop_04"
  L12_13 = "talk_01"
  L13_14 = {L14_15}
  L14_15 = "talk_01"
  L14_15 = 5
  L15_16 = 5
  L8_9[4] = L10_11
  L11_12 = "shop_05"
  L12_13 = "talk_03"
  L13_14 = {L14_15}
  L14_15 = "handclap"
  L14_15 = 3
  L15_16 = 3
  L8_9[5] = L10_11
  L11_12 = "shop_06"
  L12_13 = "lookaround_01"
  L13_14 = {L14_15}
  L14_15 = "stay_01"
  L14_15 = 4
  L15_16 = 4
  L8_9[6] = L10_11
  L11_12 = "shop_bingo"
  L12_13 = "handclap"
  L13_14 = {L14_15}
  L14_15 = "vendor_attract_00"
  L11_12 = Fn_playLoopMotionInsert
  L12_13 = "goalshop_01"
  L13_14 = "call_00"
  L14_15 = {L15_16}
  L15_16 = "handclap"
  L15_16 = 4
  L16_17 = 4
  L11_12 = L11_12(L12_13, L13_14, L14_15, L15_16, L16_17)
  L12_13 = Fn_playLoopMotionInsert
  L13_14 = "cust_01"
  L14_15 = "talk_00"
  L15_16 = {L16_17}
  L16_17 = "talk_00"
  L16_17 = 5
  L12_13 = L12_13(L13_14, L14_15, L15_16, L16_17, L17_18)
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_01"
  L15_16 = "stay_03"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[1] = L13_14
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_02"
  L15_16 = "talk_00"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[2] = L13_14
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_03"
  L15_16 = "stay_02"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[3] = L13_14
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_04"
  L15_16 = "talk_01"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[4] = L13_14
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_05"
  L15_16 = "talk_00"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[5] = L13_14
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_06"
  L15_16 = "stay"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[6] = L13_14
  L13_14 = Fn_playLoopMotionInsert
  L14_15 = "run_07"
  L15_16 = "idle_bu_00"
  L16_17 = {L17_18}
  L13_14 = L13_14(L14_15, L15_16, L16_17, L17_18, L18_19)
  L9_10[7] = L13_14
  function L13_14()
    Fn_setGestureAction(_puppet_tbl.shop_bingo, false)
    Fn_userCtrlOff()
    L10_11 = Mv_safeTaskAbort(L10_11)
    wait()
    Fn_playMotionNpc("shop_bingo", "reply_yes", true)
    Mv_gotoNextPhase()
  end
  L14_15 = {}
  L15_16 = {}
  L15_16.id = "ui_event_guide_02"
  L15_16.func = L13_14
  L14_15.RL = L15_16
  L15_16 = Fn_setupGestureAction
  L16_17 = {}
  L16_17.target = L17_18
  L20_21 = false
  L15_16(L16_17, L17_18, L18_19, L19_20, L20_21)
  L15_16 = Fn_setGestureAction
  L16_17 = _puppet_tbl
  L16_17 = L16_17.shop_bingo
  L15_16(L16_17, L17_18)
  L15_16 = {}
  L16_17 = {}
  for L20_21, L21_22 in L17_18(L18_19) do
    L15_16[L20_21] = L22_23
    L23_24.id = "ui_event_guide_02"
    L23_24.func = L24_25
    L22_23.RL = L23_24
    L16_17[L20_21] = L22_23
    L27_28 = "%02d"
    L23_24.target = L24_25
    L27_28 = false
    L22_23(L23_24, L24_25, L25_26, L26_27, L27_28)
    L27_28 = L20_21
    L22_23(L23_24, L24_25)
    break
  end
  L17_18()
  L20_21 = 1.5
  L21_22 = 0
  L20_21 = {}
  L21_22 = {}
  for L25_26, L26_27 in L22_23(L23_24) do
    L21_22[L25_26] = false
  end
  L24_25(L25_26)
  L24_25()
  for L27_28, _FORV_28_ in L24_25(L25_26) do
    Fn_setGestureAction(_puppet_tbl["shop_" .. string.format("%02d", L27_28)], false)
  end
  L24_25(L25_26)
  L24_25(L25_26)
  L27_28 = 1
  L24_25(L25_26, L26_27, L27_28, "", Player.getPuppet())
  L24_25(L25_26)
  L24_25()
  L24_25()
  L24_25()
  L24_25(L25_26)
  L24_25()
  L24_25()
  L24_25()
  L24_25()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Mob:restrict_sm06_00(false)
end
function kaiwaCountUp()
  local L1_30
  L1_30 = _talked_count
  L1_30 = L1_30 + 1
  _talked_count = L1_30
end
function _sis_sensorOnEnter(A0_31)
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
function _sis_sensorOnLeave(A0_32)
  invokeTask(function()
    Fn_tutorialCaptionKill()
    wait()
  end)
end
function pccubesensor2_hesitate_01_OnEnter()
  _caption_state = _SIS_CAPTION_STEP.VIEW_01
  Fn_pcSensorOff("pccubesensor2_hesitate_01")
end
function pccubesensor2_hesitate_02_OnEnter()
  _caption_state = _SIS_CAPTION_STEP.VIEW_02
  Fn_pcSensorOff("pccubesensor2_hesitate_02")
end
function pccubesensor2_hesitate_03_OnEnter()
  _caption_state = _SIS_CAPTION_STEP.VIEW_03
  Fn_pcSensorOff("pccubesensor2_hesitate_03")
end
function pccubesensor2_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_ryzdoor_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_ryzdoor_01_OnLeave()
  Mv_gotoNextPhase()
end
function pccubesensor2_far_kikikomi_01_OnLeave()
  local L0_33, L1_34
  L0_33 = _game_satate
  L1_34 = _GAME_STEP
  L1_34 = L1_34.GO_RYZ_DOOR
  if L0_33 == L1_34 then
  else
    L0_33 = _game_satate
    L1_34 = _GAME_STEP
    L1_34 = L1_34.KIKIKOMI
    if L0_33 == L1_34 then
    else
      L0_33 = _game_satate
      L1_34 = _GAME_STEP
      L1_34 = L1_34.SEARCH_GAW
      if L0_33 == L1_34 then
      else
        L0_33 = _game_satate
        L1_34 = _GAME_STEP
        L1_34 = L1_34.SEARCH_SIS
        if L0_33 == L1_34 then
        else
          L0_33 = _game_satate
          L1_34 = _GAME_STEP
          L1_34 = L1_34.FOUND_SIS
          if L0_33 == L1_34 then
          end
        end
      end
    end
  end
end
function pccubesensor2_far_kikikomi_01_OnEnter()
  if _far_navi_permission then
    Fn_naviKill()
  end
end
function pccubesensor2_gaw_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_gaw_01")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_find_cid_01_OnEnter()
  Mv_gotoNextPhase()
  Fn_pcSensorOff("pccubesensor2_find_cid_01")
  Fn_captionView("sm06_00129")
end
function pccubesensor2_sis_03_OnEnter()
  Fn_pcSensorOff("pccubesensor2_sis_03")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_market_landing_01_OnEnter()
  Mv_gotoNextPhase()
  Fn_pcSensorOff("pccubesensor2_market_landing_01")
end
function pccubesensor2_market_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_market_01"))
  Fn_captionView("sm06_00130")
end
function pccubesensor2_market_01_OnEnter()
  Fn_naviKill()
end
function warningStop()
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true, false)
    waitSeconds(3)
    Player:setStay(false, false)
    Fn_userCtrlOn()
  end)
end
function pccubesensor2_out_of_ryz_OnLeave()
  Fn_captionView("sm06_01012")
  warningStop()
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  Fn_pcSensorOn("pccubesensor2_warp_01")
end
function pccubesensor2_far_01_OnLeave()
  if _far_navi_permission then
    Fn_naviSet(findGameObject2("Node", "locator2_banga_alert_navi_01"))
  end
  if _game_satate == _GAME_STEP.GO_RYZ_DOOR then
    Fn_captionView("sm06_00124")
  elseif _game_satate == _GAME_STEP.KIKIKOMI then
    Fn_captionView("sm06_00125")
  elseif _game_satate == _GAME_STEP.SEARCH_GAW then
    Fn_captionView("sm06_00126")
  elseif _game_satate == _GAME_STEP.SEARCH_SIS then
    Fn_captionView("sm06_00127")
  elseif _game_satate == _GAME_STEP.FOUND_SIS then
    Fn_captionView("sm06_00128")
  end
  warningStop()
  Fn_pcSensorOn("pccubesensor2_warp_02")
  Fn_setCatWarpCheckPoint("locator2_resetpos_01")
end
function pccubesensor2_warning_market_OnLeave()
  if _game_satate == _GAME_STEP.GO_RYZ_DOOR then
    Fn_captionView("sm06_00124")
  elseif _game_satate == _GAME_STEP.KIKIKOMI then
    Fn_captionView("sm06_00125")
  elseif _game_satate == _GAME_STEP.SEARCH_GAW then
    Fn_captionView("sm06_00126")
  elseif _game_satate == _GAME_STEP.SEARCH_SIS then
    Fn_captionView("sm06_00127")
  elseif _game_satate == _GAME_STEP.FOUND_SIS then
    Fn_captionView("sm06_00128")
  elseif _game_satate == _GAME_STEP.GO_MARKET then
    Fn_captionView("sm06_01014")
  end
  warningStop()
  Fn_pcSensorOn("pccubesensor2_warp_03")
  Fn_setCatWarpCheckPoint("locator2_resetpos_02")
end
function pccubesensor2_market_01_OnLeave()
  Fn_captionView("sm06_01015")
  warningStop()
  Fn_naviSet(findGameObject2("Node", "locator2_warning_navi_market"))
  Fn_pcSensorOn("pccubesensor2_warp_04")
  Fn_setCatWarpCheckPoint("locator2_navi_02")
end
function pccubesensor2_market_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_warp_01_OnLeave()
  invokeTask(function()
    if _sis_hdl:isGrabbed() then
      Fn_catWarp()
      Fn_warpNpc("sm06_client", "locator2_pc_start_pos")
      repeat
        Player:setGrabObject(_sis_hdl)
        wait()
      until Player:getGrabObjectCount() > 0
    else
      Fn_catWarp()
    end
  end)
end
function pccubesensor2_warp_02_OnLeave()
  invokeTask(function()
    if _sis_hdl:isGrabbed() then
      Fn_catWarp()
      Fn_warpNpc("sm06_client", "locator2_sis_02")
      repeat
        Player:setGrabObject(_sis_hdl)
        wait()
      until Player:getGrabObjectCount() > 0
    else
      Fn_catWarp()
    end
  end)
end
function pccubesensor2_warp_03_OnLeave()
  invokeTask(function()
    if _sis_hdl:isGrabbed() then
      Fn_catWarp()
      Fn_warpNpc("sm06_client", "locator2_sis_02")
      repeat
        Player:setGrabObject(_sis_hdl)
        wait()
      until Player:getGrabObjectCount() > 0
    else
      Fn_catWarp()
    end
  end)
end
function pccubesensor2_warp_04_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_warpNpc("sm06_client", "locator2_navi_02")
    repeat
      Player:setGrabObject(_sis_hdl)
      wait()
    until Player:getGrabObjectCount() > 0
  end)
end
