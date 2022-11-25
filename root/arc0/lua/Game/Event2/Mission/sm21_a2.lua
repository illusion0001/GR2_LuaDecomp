import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm21_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_PART_PHASE_04 = 1
_PART_PHASE_05 = 2
_PART_PHASE_06 = 6
_LEADING_CAPTION_TIME = 30
_sm21_a_global = {
  puppet_tbl = {},
  cap_count = 0,
  dad_sensor = nil,
  restart = false,
  leading_task = nil,
  leading_caption_time = 0,
  leading_caption_text = nil
}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    {
      name = "gf01",
      type = "wom29",
      node = "locator2_gf_01",
      anim_name = "wom01_vbike01_stay_sm21_00",
      active = false
    },
    {
      name = "brdman01",
      type = "man37",
      node = "locator2_brd_man_01",
      anim_name = "stay",
      active = false
    }
  }
  L1_1.name = "bf01"
  L1_1.type = "man36"
  L1_1.node = "locator2_bf_01"
  L1_1.anim_name = "fly"
  L1_1.active = false
  L1_1(L0_0)
  for _FORV_4_, _FORV_5_ in L1_1(L0_0) do
    _sm21_a_global.puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1.fly = "wom01_vbike01_stay_sm21_00"
  Fn_loadNpcEventMotion("gf01", L1_1)
  _dad_npc = Fn_findNpc("sm21_client")
  _sm21_a_global.puppet_tbl.sm21_client = Fn_findNpcPuppet("sm21_client")
  bf01 = Fn_findNpc("bf01")
  gf01 = Fn_findNpc("gf01")
  _sdemo_cut03 = SDemo.create("sm21_a_cut03")
  _sdemo_cut04 = SDemo.create("sm21_a_cut04")
  _sdemo_cut05 = SDemo.create("sm21_a_cut05")
  _sdemo_cut06 = SDemo.create("sm21_a_cut06")
  _sdemo_cut07 = SDemo.create("sm21_a_cut07")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L0_2 = nil
  L1_3 = _PART_PHASE_04
  navi_target = nil
  L2_4 = Fn_disappearNpc
  L3_5 = "sm21_guid"
  L2_4(L3_5)
  L2_4 = Fn_setCatWarp
  L3_5 = false
  L2_4(L3_5)
  L2_4 = anoterCatWarp
  function L3_5()
    if L1_3 == _PART_PHASE_04 then
      Fn_warpNpc("sm21_client", "locator2_dad_stay_03")
    elseif L1_3 == _PART_PHASE_05 then
      Fn_warpNpc("sm21_client", "locator2_dad_stay_05")
    elseif L1_3 == _PART_PHASE_06 then
      Fn_warpNpc("sm21_client", "locator2_dad_stay_04")
    end
  end
  function L4_6()
    L0_2 = Mv_safeTaskAbort(L0_2)
    L0_2 = invokeTask(function()
      if navi_target == "locator2_navi_04" or navi_target == "locator2_resetpos_03" then
        createClientSensor()
        grabWait(_sm21_a_global.puppet_tbl.sm21_client, _sm21_a_global.dad_sensor)
        _sm21_a_global.dad_sensor:setActive(false)
        if navi_target ~= nil then
          Fn_naviSet(findGameObject2("Node", navi_target))
        end
      end
      if navi_target ~= nil then
        Fn_naviSet(findGameObject2("Node", navi_target))
      end
    end)
  end
  L2_4(L3_5, L4_6)
  L2_4 = Fn_missionStart
  L2_4()
  function L2_4()
    grabReset("sm21_client", "locator2_dad_stay_03", true)
    _sdemo_cut03:set("locator2_cam_search_01", _sm21_a_global.puppet_tbl.sm21_client, false, Vector(0, 0, 0))
    _sdemo_cut03:play()
    waitSeconds(2)
  end
  L3_5 = Fn_sendEventComSb
  L4_6 = "getPrevPhaseContinue"
  L3_5 = L3_5(L4_6)
  if L3_5 == true then
    L3_5 = Fn_setCatWarpCheckPoint
    L4_6 = "locator2_resetpos_03"
    L3_5(L4_6)
    L3_5 = Fn_sceneConversion
    L4_6 = "locator2_resetpos_03"
    L5_7 = L2_4
    L3_5(L4_6, L5_7)
  else
    L1_3 = _PART_PHASE_05
    L3_5 = Fn_warpNpc
    L4_6 = "sm21_client"
    L5_7 = "locator2_dad_stay_05"
    L3_5(L4_6, L5_7)
    L3_5 = Fn_resetPcPos
    L4_6 = "locator2_resetpos_05"
    L3_5(L4_6)
    L3_5 = Player
    L4_6 = L3_5
    L3_5 = L3_5.setGrabExceptionalObject
    L5_7 = {L6_8}
    L6_8 = "sm21_client"
    L3_5(L4_6, L5_7)
    L3_5 = waitSeconds
    L4_6 = 0.1
    L3_5(L4_6)
    L3_5 = Fn_setGrabNpc
    L4_6 = "sm21_client"
    L5_7 = false
    L6_8 = false
    L3_5(L4_6, L5_7, L6_8)
    L3_5 = Fn_userCtrlOn
    L3_5()
    L3_5 = createClientSensor
    L3_5()
    L3_5 = grabWait
    L4_6 = _sm21_a_global
    L4_6 = L4_6.puppet_tbl
    L4_6 = L4_6.sm21_client
    L5_7 = _sm21_a_global
    L5_7 = L5_7.dad_sensor
    L3_5(L4_6, L5_7)
    L3_5 = _sm21_a_global
    L3_5 = L3_5.dad_sensor
    L4_6 = L3_5
    L3_5 = L3_5.setActive
    L5_7 = false
    L3_5(L4_6, L5_7)
    L3_5 = invokeTask
    function L4_6()
      Fn_missionViewWait("sm21_00106")
    end
    L3_5(L4_6)
    L3_5 = waitSeconds
    L4_6 = 1.3
    L3_5(L4_6)
    navi_target = "locator2_resetpos_03"
    L3_5 = Fn_naviSet
    L4_6 = findGameObject2
    L5_7 = "Node"
    L6_8 = "locator2_resetpos_03"
    L12_14 = L4_6(L5_7, L6_8)
    L3_5(L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L4_6(L5_7, L6_8))
    L3_5 = Fn_pcSensorOn
    L4_6 = "pccubesensor2_navi_05"
    L3_5(L4_6)
    L3_5 = Mv_waitPhase
    L3_5()
    L1_3 = _PART_PHASE_04
    navi_target = nil
    L3_5 = Fn_naviKill
    L3_5()
    L3_5 = Fn_setCatWarpCheckPoint
    L4_6 = "locator2_resetpos_03"
    L3_5(L4_6)
    L3_5 = Fn_userCtrlOff
    L3_5()
    L3_5 = Fn_sceneConversion
    L4_6 = "locator2_resetpos_03"
    L5_7 = L2_4
    L3_5(L4_6, L5_7)
  end
  L3_5 = Fn_sendEventComSb
  L4_6 = "setPrevPhaseContinue"
  L5_7 = false
  L3_5(L4_6, L5_7)
  L3_5 = Fn_userCtrlOff
  L3_5()
  L3_5 = Fn_moveNpc
  L4_6 = "sm21_client"
  L5_7 = {L6_8}
  L6_8 = "locator2_dad_lookaround_03"
  L6_8 = {}
  L6_8.anim_speed_over = true
  L6_8.runLength = 3
  L6_8.anim_walk_speed = 1
  L3_5 = L3_5(L4_6, L5_7, L6_8)
  while L3_5 ~= nil do
    L5_7 = L3_5
    L4_6 = L3_5.isRunning
    L4_6 = L4_6(L5_7)
    if L4_6 then
      L4_6 = wait
      L4_6()
    end
  end
  L4_6 = Fn_playMotionNpc
  L5_7 = "sm21_client"
  L6_8 = "lookaround"
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = waitSeconds
  L5_7 = 2.5
  L4_6(L5_7)
  L4_6 = Fn_playMotionNpc
  L5_7 = "sm21_client"
  L6_8 = "stay"
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = Fn_kaiwaDemoView
  L5_7 = "sm21_00700k"
  L4_6(L5_7)
  L4_6 = {L5_7, L6_8}
  L5_7 = {}
  L5_7.name = "bf01"
  L5_7.type = "man36"
  L5_7.node = "locator2_bf_01"
  L5_7.anim_name = "fly"
  L5_7.active = false
  L6_8 = {}
  L6_8.name = "gf01"
  L6_8.type = "wom29"
  L6_8.node = "locator2_gf_01"
  L6_8.anim_name = "wom01_vbike01_stay_sm21_00"
  L6_8.active = false
  L5_7 = Fn_setupNpc
  L6_8 = L4_6
  L5_7(L6_8)
  L5_7 = _sm21_a_global
  L5_7 = L5_7.puppet_tbl
  L6_8 = Fn_findNpcPuppet
  L7_9 = "bf01"
  L6_8 = L6_8(L7_9)
  L5_7.bf01 = L6_8
  L5_7 = _sm21_a_global
  L5_7 = L5_7.puppet_tbl
  L6_8 = Fn_findNpcPuppet
  L7_9 = "gf01"
  L6_8 = L6_8(L7_9)
  L5_7.gf01 = L6_8
  L5_7 = {
    L6_8,
    [8] = L7_9(L8_10)
  }
  L6_8 = findGameObject2
  L7_9 = "Node"
  L8_10 = "locator2_bike_sky_demo_01"
  L6_8 = L6_8(L7_9, L8_10)
  L7_9 = L6_8
  L6_8 = L6_8.getWorldPos
  L6_8 = L6_8(L7_9)
  L7_9 = findGameObject2
  L8_10 = "Node"
  L9_11 = "locator2_bike_sky_demo_02"
  L7_9 = L7_9(L8_10, L9_11)
  L8_10 = L7_9
  L7_9 = L7_9.getWorldPos
  L12_14 = L7_9(L8_10)
  ;({
    L6_8,
    [8] = L7_9(L8_10)
  })[2] = L7_9
  ;({
    L6_8,
    [8] = L7_9(L8_10)
  })[3] = L8_10
  ;({
    L6_8,
    [8] = L7_9(L8_10)
  })[4] = L9_11
  ;({
    L6_8,
    [8] = L7_9(L8_10)
  })[5] = L10_12
  ;({
    L6_8,
    [8] = L7_9(L8_10)
  })[6] = L11_13
  ;({
    L6_8,
    [8] = L7_9(L8_10)
  })[7] = L12_14
  pos_route_tbl = L5_7
  L5_7 = Mv_createScriptVehicle
  L6_8 = pos_route_tbl
  L7_9 = "ForSm21Ship02"
  L8_10 = "ship_01"
  L9_11 = "locator2_bike_sky_demo_01"
  L5_7 = L5_7(L6_8, L7_9, L8_10, L9_11)
  ve02_ship = L5_7
  L5_7 = ve02_ship
  L6_8 = L5_7
  L5_7 = L5_7.setBaseSpeed
  L7_9 = 0
  L5_7(L6_8, L7_9)
  L5_7 = Fn_setNpcActive
  L6_8 = "bf01"
  L7_9 = true
  L5_7(L6_8, L7_9)
  L5_7 = Fn_setNpcActive
  L6_8 = "gf01"
  L7_9 = true
  L5_7(L6_8, L7_9)
  L5_7 = invokeTask
  function L6_8()
    ve02_ship:setPilot(_sm21_a_global.puppet_tbl.bf01, "loc_driver1")
    ve02_ship:setPilot(_sm21_a_global.puppet_tbl.gf01, "loc_driver1")
    invokeTask(function()
      Fn_playMotionNpc("gf01", "wom01_vbike01_stay_sm21_00")
    end)
  end
  L5_7(L6_8)
  L5_7 = {L6_8}
  L6_8 = {}
  L6_8.pos = "locator2_bike_sky_demo_02"
  L6_8.attr = "fly"
  L6_8 = ve02_ship
  L7_9 = L6_8
  L6_8 = L6_8.setCurrSpeed
  L8_10 = 35
  L6_8(L7_9, L8_10)
  L6_8 = ve02_ship
  L7_9 = L6_8
  L6_8 = L6_8.setBaseSpeed
  L8_10 = 35
  L6_8(L7_9, L8_10)
  L6_8 = wait
  L6_8()
  L6_8 = _sdemo_cut05
  L7_9 = L6_8
  L6_8 = L6_8.set
  L8_10 = "locator2_cam_sky_01"
  L9_11 = "locator2_aim_sky_01"
  L10_12 = false
  L6_8(L7_9, L8_10, L9_11, L10_12)
  L6_8 = _sdemo_cut05
  L7_9 = L6_8
  L6_8 = L6_8.play
  L6_8(L7_9)
  L6_8 = 1.7
  L7_9 = {L8_10}
  L8_10 = {}
  L8_10.pos = "locator2_cam_sky_01"
  L8_10.time = L6_8
  L8_10 = {L9_11}
  L9_11 = {}
  L9_11.pos = "locator2_aim_sky_02"
  L9_11.time = L6_8
  L9_11 = _sdemo_cut05
  L10_12 = L9_11
  L9_11 = L9_11.play
  L11_13 = L7_9
  L12_14 = L8_10
  L9_11(L10_12, L11_13, L12_14)
  L9_11 = waitSeconds
  L10_12 = 2.5
  L9_11(L10_12)
  L9_11 = Fn_kaiwaDemoView
  L10_12 = "sm21_00800k"
  L9_11(L10_12)
  while true do
    L9_11 = ve02_ship
    L10_12 = L9_11
    L9_11 = L9_11.getRemainingDist
    L9_11 = L9_11(L10_12)
    if not (L9_11 <= 0) then
      L9_11 = wait
      L9_11()
    end
  end
  L9_11 = Fn_blackout
  L10_12 = 0.5
  L9_11(L10_12)
  L9_11 = {L10_12, L11_13}
  L10_12 = {}
  L10_12.name = "bf01"
  L10_12.type = "man36"
  L10_12.node = "locator2_bf_01"
  L10_12.anim_name = "fly"
  L10_12.active = false
  L11_13 = {}
  L11_13.name = "gf01"
  L11_13.type = "wom29"
  L11_13.node = "locator2_gf_01"
  L11_13.anim_name = "wom01_vbike01_stay_sm21_00"
  L11_13.active = false
  L10_12 = Fn_setupNpc
  L11_13 = L9_11
  L10_12(L11_13)
  L10_12 = _sm21_a_global
  L10_12 = L10_12.puppet_tbl
  L11_13 = Fn_findNpcPuppet
  L12_14 = "bf01"
  L11_13 = L11_13(L12_14)
  L10_12.bf01 = L11_13
  L10_12 = _sm21_a_global
  L10_12 = L10_12.puppet_tbl
  L11_13 = Fn_findNpcPuppet
  L12_14 = "gf01"
  L11_13 = L11_13(L12_14)
  L10_12.gf01 = L11_13
  L10_12 = {
    L11_13,
    L12_14,
    findGameObject2("Node", "locator2_ship_move2_05"):getWorldPos(),
    findGameObject2("Node", "locator2_ship_move2_06"):getWorldPos()
  }
  L11_13 = findGameObject2
  L12_14 = "Node"
  L11_13 = L11_13(L12_14, "locator2_bike_through_demo_01")
  L12_14 = L11_13
  L11_13 = L11_13.getWorldPos
  L11_13 = L11_13(L12_14)
  L12_14 = findGameObject2
  L12_14 = L12_14("Node", "locator2_ship_move2_04")
  L12_14 = L12_14.getWorldPos
  L12_14 = L12_14(L12_14)
  pos_route_tbl = L10_12
  L10_12 = Mv_createScriptVehicle
  L11_13 = pos_route_tbl
  L12_14 = "ForSm21Ship02"
  L10_12 = L10_12(L11_13, L12_14, "ship_01", "locator2_bike_through_demo_01")
  ve02_ship = L10_12
  L10_12 = ve02_ship
  L11_13 = L10_12
  L10_12 = L10_12.setBaseSpeed
  L12_14 = 0
  L10_12(L11_13, L12_14)
  L10_12 = Fn_setNpcActive
  L11_13 = "bf01"
  L12_14 = true
  L10_12(L11_13, L12_14)
  L10_12 = Fn_setNpcActive
  L11_13 = "gf01"
  L12_14 = true
  L10_12(L11_13, L12_14)
  L10_12 = invokeTask
  function L11_13()
    ve02_ship:setPilot(_sm21_a_global.puppet_tbl.bf01, "loc_driver1")
    ve02_ship:setPilot(_sm21_a_global.puppet_tbl.gf01, "loc_driver1")
  end
  L10_12(L11_13)
  L10_12 = Fn_resetPcPos
  L11_13 = "locator2_gf_talk_01"
  L10_12(L11_13)
  L10_12 = Fn_setKittenActive
  L11_13 = false
  L10_12(L11_13)
  L10_12 = ve02_ship
  L11_13 = L10_12
  L10_12 = L10_12.setBaseSpeed
  L12_14 = 25
  L10_12(L11_13, L12_14)
  L10_12 = wait
  L10_12()
  L10_12 = _sdemo_cut07
  L11_13 = L10_12
  L10_12 = L10_12.set
  L12_14 = "locator2_cam_through_01"
  L10_12(L11_13, L12_14, "locator2_aim_through_01", false)
  L10_12 = _sdemo_cut07
  L11_13 = L10_12
  L10_12 = L10_12.play
  L10_12(L11_13)
  L10_12 = Fn_fadein
  L11_13 = 0.5
  L10_12(L11_13)
  L10_12 = waitSeconds
  L11_13 = 3
  L10_12(L11_13)
  L10_12 = Fn_blackout
  L11_13 = 0.5
  L10_12(L11_13)
  L10_12 = Fn_setKittenActive
  L11_13 = true
  L10_12(L11_13)
  L10_12 = Fn_resetPcPos
  L11_13 = "locator2_resetpos_03"
  L10_12(L11_13)
  L10_12 = _sdemo_cut03
  L11_13 = L10_12
  L10_12 = L10_12.set
  L12_14 = "locator2_cam_search_01"
  L10_12(L11_13, L12_14, _sm21_a_global.puppet_tbl.sm21_client, false, Vector(0, 0, 0))
  L10_12 = _sdemo_cut03
  L11_13 = L10_12
  L10_12 = L10_12.play
  L10_12(L11_13)
  L10_12 = Fn_fadein
  L11_13 = 0.5
  L10_12(L11_13)
  L10_12 = Fn_captionView
  L11_13 = "sm21_00109"
  L10_12(L11_13)
  L10_12 = waitSeconds
  L11_13 = 2
  L10_12(L11_13)
  L10_12 = _sdemo_cut03
  L11_13 = L10_12
  L10_12 = L10_12.stop
  L12_14 = 2
  L10_12(L11_13, L12_14)
  L10_12 = Fn_userCtrlOn
  L10_12()
  L10_12 = Fn_setNpcActive
  L11_13 = "bf01"
  L12_14 = false
  L10_12(L11_13, L12_14)
  L10_12 = Fn_setNpcActive
  L11_13 = "gf01"
  L12_14 = false
  L10_12(L11_13, L12_14)
  L10_12 = ve02_ship
  L11_13 = L10_12
  L10_12 = L10_12.setVisible
  L12_14 = false
  L10_12(L11_13, L12_14)
  L10_12 = Fn_setGrabNpc
  L11_13 = "sm21_client"
  L12_14 = false
  L10_12(L11_13, L12_14, false)
  L10_12 = Fn_pcSensorOn
  L11_13 = "pccubesensor2_01"
  L10_12(L11_13)
  L10_12 = invokeTask
  function L11_13()
    Fn_missionViewWait("sm21_00110")
  end
  L10_12(L11_13)
  L10_12 = waitSeconds
  L11_13 = 1.3
  L10_12(L11_13)
  L10_12 = invokeTask
  function L11_13()
    while true do
      if _sm21_a_global.restart then
        Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
        Player:setStay(true)
        waitSeconds(3)
        Fn_captionViewEnd()
        Fn_blackout(1)
        Fn_resetPcPos("locator2_resetpos_03")
        _sm21_a_global.restart = false
        Fn_fadein(1)
        Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
        Player:setStay(false)
      end
      wait()
    end
  end
  L10_12(L11_13)
  L10_12 = createClientSensor
  L10_12()
  L10_12 = grabWait
  L11_13 = _sm21_a_global
  L11_13 = L11_13.puppet_tbl
  L11_13 = L11_13.sm21_client
  L12_14 = _sm21_a_global
  L12_14 = L12_14.dad_sensor
  L10_12(L11_13, L12_14)
  L10_12 = _sm21_a_global
  L10_12 = L10_12.dad_sensor
  L11_13 = L10_12
  L10_12 = L10_12.setActive
  L12_14 = false
  L10_12(L11_13, L12_14)
  L10_12 = Fn_pcSensorOn
  L11_13 = "pccubesensor2_leading_navi_04"
  L10_12(L11_13)
  L10_12 = Fn_pcSensorOff
  L11_13 = "pccubesensor2_leading_navi_05"
  L10_12(L11_13)
  L10_12 = waitSeconds
  L11_13 = 1
  L10_12(L11_13)
  L10_12 = Fn_captionViewWait
  L11_13 = "sm21_00118"
  L10_12(L11_13)
  navi_target = "locator2_navi_04"
  L10_12 = Fn_naviSet
  L11_13 = findGameObject2
  L12_14 = "Node"
  L12_14 = L11_13(L12_14, "locator2_navi_04")
  L10_12(L11_13, L12_14, L11_13(L12_14, "locator2_navi_04"))
  L10_12 = Fn_pcSensorOn
  L11_13 = "pccubesensor2_navi_04"
  L10_12(L11_13)
  L10_12 = Mv_waitPhase
  L10_12()
  navi_target = nil
  L1_3 = _PART_PHASE_06
  L10_12 = Fn_naviKill
  L10_12()
  navi_target = nil
  L10_12 = Fn_pcSensorOff
  L11_13 = "pccubesensor2_01"
  L10_12(L11_13)
  L10_12, L11_13 = nil, nil
  function L12_14()
    grabReset("sm21_client", "locator2_dad_stay_04", true)
    Fn_appendNpcArea("bf01", "locator2_bf_talk_01")
    Fn_appendNpcArea("gf01", "locator2_bf_talk_01")
    waitSeconds(2)
    ship_task = Mv_safeTaskAbort(ship_task)
    pos_route_tbl = {
      findGameObject2("Node", "locator2_ship_stay_01"):getWorldPos(),
      findGameObject2("Node", "locator2_resetpos_04"):getWorldPos()
    }
    ve02_ship = Mv_safeObjectKill(ve02_ship)
    Fn_warpNpc("bf01", "locator2_bf_talk_01")
    Fn_warpNpc("bf01", "locator2_gf_talk_01")
    Fn_setNpcActive("gf01", true)
    Fn_setNpcActive("bf01", true)
    L10_12 = Fn_repeatPlayMotion("gf01", "talk_00", {"talk_00"}, 1, 5)
    L11_13 = Fn_repeatPlayMotion("bf01", "talk_01", {"talk_01"}, 1, 5)
    Fn_playMotionNpc("ve02", "stay", false)
    Fn_setNpcActive("brdman01", true)
    waitSeconds(1)
  end
  Fn_sceneConversion("locator2_resetpos_04", L12_14)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm21_00900k")
  L10_12 = Mv_safeTaskAbort(L10_12)
  L11_13 = Mv_safeTaskAbort(L11_13)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function createClientSensor()
  if findGameObject2("PlayerSensor", "pcsensor_client") == nil then
    _sm21_a_global.dad_sensor = createGameObject2("PlayerSensor")
    _sm21_a_global.dad_sensor:setName("pcsensor_client")
    _sm21_a_global.dad_sensor:setDetectBehavior(1)
    _sm21_a_global.dad_sensor:addBox(Vector(5, 5, 5))
    _sm21_a_global.dad_sensor:setPos(Vector(0, 0, 0))
    _sm21_a_global.dad_sensor:setOnEnter("dad_sensorOnEnter")
    _sm21_a_global.dad_sensor:setOnLeave("dad_sensorOnLeave")
    start_game_obj()
  else
    _sm21_a_global.dad_sensor = findGameObject2("PlayerSensor", "pcsensor_client")
  end
  _sm21_a_global.puppet_tbl.sm21_client:appendChild(_sm21_a_global.dad_sensor)
  _sm21_a_global.dad_sensor:setActive(true)
end
function dad_sensorOnEnter(A0_15)
  invokeTask(function()
    Fn_tutorialCaption("grab")
    _dad_motion_task = Fn_playLoopMotionInsert("sm21_client", "lookaround_01", {"lookaround"}, 4, 4)
  end)
end
function dad_sensorOnLeave(A0_16)
  if Fn_findNpc("sm21_client"):isGrabbed() == true then
    return
  end
  Fn_tutorialCaptionKill()
  invokeTask(function()
    if _dad_motion_task ~= nil then
      _dad_motion_task = Mv_safeTaskAbort(_dad_motion_task)
      Fn_playMotionNpc("sm21_client", "stay", false)
      wait()
    end
    Fn_turnNpc("sm21_client")
    Fn_captionViewEnd()
    invokeTask(function()
      if _sm21_a_global.cap_count == 0 then
        Fn_captionView("sm21_00119")
      else
        Fn_captionView("sm21_00112")
      end
      waitSeconds(2)
      Fn_captionView("sm21_00120")
    end)
    Fn_playMotionNpc("sm21_client", "talk_angry_00", true)
    Fn_playMotionNpc("sm21_client", "stay_01", false)
  end)
end
function pccubesensor2_navi_04_OnEnter()
  Fn_pcSensorOff("pccubesensor2_navi_04")
  Mv_gotoNextPhase()
end
function pccubesensor2_navi_05_OnEnter()
  Fn_pcSensorOff("pccubesensor2_navi_05")
  Mv_gotoNextPhase()
end
function pccubesensor2_01_OnEnter()
  Fn_captionView("sm21_00113")
  _sm21_a_global.restart = true
end
function pccubesensor2_warp_warning_03_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("sm21_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_03_OnLeave()
  runCatWarp()
end
function pccubesensor2_leading_navi_04_OnEnter()
  abortLeadingTask()
end
function pccubesensor2_leading_navi_04_OnLeave()
  _sm21_a_global.leading_caption_text = "sm21_00123"
  createLeadingTask()
end
function pccubesensor2_leading_navi_05_OnEnter()
  abortLeadingTask()
end
function pccubesensor2_leading_navi_05_OnLeave()
  _sm21_a_global.leading_caption_text = "sm21_00122"
  createLeadingTask()
end
function createLeadingTask()
  abortLeadingTask()
  _sm21_a_global.leading_task = invokeTask(function()
    while true do
      _sm21_a_global.leading_caption_time = _sm21_a_global.leading_caption_time - gameTickToSecond(1)
      if _sm21_a_global.leading_caption_time <= 0 then
        _sm21_a_global.leading_caption_time = 0
      end
      if _sm21_a_global.leading_caption_time <= 0 then
        Fn_captionView(_sm21_a_global.leading_caption_text)
        _sm21_a_global.leading_caption_time = _LEADING_CAPTION_TIME
      end
      wait()
    end
  end)
end
function abortLeadingTask()
  local L0_17
  L0_17 = _sm21_a_global
  L0_17.leading_task = Mv_safeTaskAbort(_sm21_a_global.leading_task)
  L0_17 = _sm21_a_global
  L0_17.leading_caption_time = 0
end
