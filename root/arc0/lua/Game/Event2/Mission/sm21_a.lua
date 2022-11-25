import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm21_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_PART_PHASE_01 = 0
_PART_PHASE_02 = 1
_PART_PHASE_03 = 2
_PART_PHASE_04 = 3
_PART_PHASE_05 = 4
_SEARCH_TIME = 15
_LEADING_CAPTION_TIME = 30
_sm21_a_global = {
  puppet_tbl = {},
  cap_count = 0,
  dad_sensor = nil,
  leading_task = nil,
  leading_caption_time = 0
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
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_userCtrlAllOff
  L0_0()
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
  L1_1.sm21_guid = Fn_findNpcPuppet("sm21_guid")
  L1_1.fly = "wom01_vbike01_stay_sm21_00"
  Fn_loadNpcEventMotion("gf01", L1_1)
  _dad_npc = Fn_findNpc("sm21_client")
  _sm21_a_global.puppet_tbl.sm21_client = Fn_findNpcPuppet("sm21_client")
  bf01 = Fn_findNpc("bf01")
  gf01 = Fn_findNpc("gf01")
  _sdemo_cut01 = SDemo.create("sm21_a_cut01")
  _sdemo_cut02 = SDemo.create("sm21_a_cut02")
  if findGameObject2("Node", "merchant_ship_01") == nil then
    Fn_createGimmickBg("locator2_ship_pos_02", "merchant_ship_01", "car_pd_01", true):setVisibleBlockEnable(false)
    Fn_createGimmickBg("locator2_ship_pos_02", "merchant_ship_01", "car_pd_01", true):setVisible(true)
  end
  Fn_naviKill()
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12
  L0_2 = {
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  }
  L1_3 = Fn_repeatPlayMotion
  L2_4 = "sm21_guid"
  L3_5 = "talk_00"
  L4_6 = {L5_7}
  L5_7 = "talk_00"
  L5_7 = 1
  L1_3 = L1_3(L2_4, L3_5, L4_6, L5_7, L6_8)
  L2_4 = Fn_repeatPlayMotion
  L3_5 = "sm21_client"
  L4_6 = "talk_01"
  L5_7 = {L6_8}
  L10_12 = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[2] = L2_4
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[3] = L3_5
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[4] = L4_6
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[5] = L5_7
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[6] = L6_8
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[7] = L7_9
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[8] = L8_10
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[9] = L9_11
  ;({
    L1_3,
    [11] = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9)
  })[10] = L10_12
  L1_3 = nil
  L2_4 = _PART_PHASE_01
  L3_5 = nil
  L4_6 = Fn_setCatWarp
  L5_7 = false
  L4_6(L5_7)
  L4_6 = anoterCatWarp
  function L5_7()
    if L2_4 == _PART_PHASE_01 then
      Fn_warpNpc("sm21_client", "locator2_client_start_pos_01")
      stopTimerTask()
    elseif L2_4 == _PART_PHASE_02 then
      Fn_warpNpc("sm21_client", "locator2_dad_stay_01")
    elseif L2_4 == _PART_PHASE_03 then
      Fn_warpNpc("sm21_client", "locator2_dad_stay_02")
    end
  end
  L4_6(L5_7, L6_8)
  L4_6 = Fn_setCatWarpCheckPoint
  L5_7 = "locator2_pc_start_pos"
  L4_6(L5_7)
  while true do
    L4_6 = Vehicle
    L5_7 = L4_6
    L4_6 = L4_6.isReady
    L4_6 = L4_6(L5_7)
    if not L4_6 then
      L4_6 = wait
      L4_6()
    end
  end
  L4_6 = {
    L5_7,
    L6_8,
    L7_9,
    L8_10,
    L9_11,
    [7] = L10_12(L10_12)
  }
  L5_7 = findGameObject2
  L5_7 = L5_7(L6_8, L7_9)
  L5_7 = L5_7.getWorldPos
  L5_7 = L5_7(L6_8)
  L9_11 = "locator2_ship_move_02"
  L9_11 = "Node"
  L10_12 = "locator2_ship_move_03"
  L9_11 = L8_10
  L9_11 = findGameObject2
  L10_12 = "Node"
  L9_11 = L9_11(L10_12, "locator2_ship_move_04")
  L10_12 = L9_11
  L9_11 = L9_11.getWorldPos
  L9_11 = L9_11(L10_12)
  L10_12 = findGameObject2
  L10_12 = L10_12("Node", "locator2_ship_move_05")
  L10_12 = L10_12.getWorldPos
  L10_12 = L10_12(L10_12)
  ;({
    L5_7,
    L6_8,
    L7_9,
    L8_10,
    L9_11,
    [7] = L10_12(L10_12)
  })[6] = L10_12
  pos_route_tbl = L4_6
  L4_6 = nil
  L5_7 = findGameObject2
  L5_7 = L5_7(L6_8, L7_9)
  L4_6 = L5_7
  if L4_6 ~= nil then
    L5_7 = Mv_safeObjectKill
    L5_7 = L5_7(L6_8)
    L4_6 = L5_7
  end
  L5_7 = Mv_createScriptVehicle
  L9_11 = "locator2_ship_02"
  L5_7 = L5_7(L6_8, L7_9, L8_10, L9_11)
  L4_6 = L5_7
  L5_7 = start_game_obj
  L5_7()
  L5_7 = L4_6.setBaseSpeed
  L5_7(L6_8, L7_9)
  L5_7 = invokeTask
  L5_7 = L5_7(L6_8)
  L6_8()
  L6_8(L7_9)
  L6_8(L7_9)
  for L9_11, L10_12 in L6_8(L7_9) do
    if L10_12 ~= nil and L10_12:isRunning() == true then
      L10_12:abort()
    end
  end
  L0_2 = L6_8
  L9_11 = true
  L6_8(L7_9, L8_10, L9_11)
  L9_11 = L6_8
  L10_12 = {}
  L10_12.anim_speed_over = true
  L10_12.anim_walk_speed = 1
  L9_11 = 1.5
  L8_10(L9_11)
  L9_11 = "sm21_client"
  L8_10(L9_11)
  L9_11 = "bf01"
  L10_12 = true
  L8_10(L9_11, L10_12)
  L9_11 = "gf01"
  L10_12 = true
  L8_10(L9_11, L10_12)
  L9_11 = "PlayerSensor"
  L10_12 = L8_10
  L9_11 = L8_10.setDetectBehavior
  L9_11(L10_12, 1)
  L10_12 = L8_10
  L9_11 = L8_10.addBox
  L9_11(L10_12, Vector(6, 6, 6))
  L10_12 = L8_10
  L9_11 = L8_10.setPos
  L9_11(L10_12, Vector(0, 0, 0))
  L10_12 = L8_10
  L9_11 = L8_10.setOnEnter
  L9_11(L10_12, "bike_sensorOnEnter")
  L10_12 = L8_10
  L9_11 = L8_10.setOnLeave
  L9_11(L10_12, "bike_sensorOnLeave")
  L10_12 = L8_10
  L9_11 = L8_10.setActive
  L9_11(L10_12, true)
  L10_12 = L4_6
  L9_11 = L4_6.appendChild
  L9_11(L10_12, L8_10)
  L9_11 = invokeTask
  function L10_12()
    L4_6:setPilot(_sm21_a_global.puppet_tbl.bf01, "loc_driver1")
    L4_6:setPilot(_sm21_a_global.puppet_tbl.gf01, "loc_driver1")
  end
  L9_11(L10_12)
  L9_11 = Fn_kaiwaDemoView
  L10_12 = "sm21_00200k"
  L9_11(L10_12)
  L9_11 = Fn_turnNpc
  L10_12 = "sm21_client"
  L9_11(L10_12, L4_6:getWorldPos())
  L9_11 = Fn_playerTurn
  L10_12 = L4_6
  L9_11(L10_12, 0, 1)
  L9_11 = {}
  escape_tbl = L9_11
  idx = 1
  L9_11 = 1
  while true do
    L10_12 = idx
    if L10_12 < 5 then
      L10_12 = "locator2_ship_move_"
      L10_12 = L10_12 .. string.format("%02d", L9_11)
      if findGameObject2("Node", L10_12) ~= nil then
        escape_tbl[idx] = {}
        escape_tbl[idx].pos = findGameObject2("Node", L10_12):getName()
        escape_tbl[idx].attr = "fly"
        idx = idx + 1
      end
    else
      break
    end
    L9_11 = L9_11 + 1
  end
  L10_12 = L4_6.setBaseSpeed
  L10_12(L4_6, 17)
  L10_12 = waitSeconds
  L10_12(0.7)
  L10_12 = Camera
  L10_12 = L10_12.lookTo
  L10_12(L10_12, L4_6:getWorldPos(), 1, 1)
  L10_12 = waitSeconds
  L10_12(0.8)
  L10_12 = _sdemo_cut01
  L10_12 = L10_12.set
  L10_12(L10_12, "locator2_cam_back_01", L4_6, kSDEMO_APPEND_AIM, Vector(2, 2, 2))
  L10_12 = _sdemo_cut01
  L10_12 = L10_12.play
  L10_12(L10_12)
  L10_12 = waitSeconds
  L10_12(1)
  L10_12 = _sdemo_cut01
  L10_12 = L10_12.zoomIn
  L10_12(L10_12, 0.5, {deg = 20}, "easeIn")
  L10_12 = waitSeconds
  L10_12(2)
  L10_12 = Fn_playerTurnEnd
  L10_12(1)
  L10_12 = invokeTask
  L10_12(function()
    Fn_turnNpc("sm21_client")
  end)
  L10_12 = Fn_setPcPosRot
  L10_12(findGameObject2("Node", "locator2_pc_start_pos_01"):getWorldTransform())
  L10_12 = _sdemo_cut01
  L10_12 = L10_12.stop
  L10_12(L10_12, 1.5)
  L10_12 = waitSeconds
  L10_12(1.5)
  L10_12 = Fn_kaiwaDemoView
  L10_12("sm21_00300k")
  L10_12 = Fn_playMotionNpc
  L10_12("sm21_client", "lookaround_01", false)
  L10_12 = Fn_userCtrlOn
  L10_12()
  L10_12 = Fn_pcSensorOn
  L10_12("pccubesensor2_warp_warning_01")
  L10_12 = Fn_pcSensorOn
  L10_12("pccubesensor2_warp_area_01")
  L10_12 = Player
  L10_12 = L10_12.setGrabExceptionalObject
  L10_12(L10_12, {
    "sm21_client"
  })
  L10_12 = Fn_setGrabNpc
  L10_12("sm21_client", false, false)
  L10_12 = invokeTask
  L10_12(function()
    Fn_missionViewWait("sm21_00100")
  end)
  L10_12 = waitSeconds
  L10_12(1.3)
  L10_12 = createClientSensor
  L10_12()
  L10_12 = _sm21_a_global
  L10_12 = L10_12.dad_sensor
  L10_12 = L10_12.setActive
  L10_12(L10_12, false)
  L10_12 = grabWait
  L10_12(_sm21_a_global.puppet_tbl.sm21_client, _sm21_a_global.dad_sensor, nil)
  L10_12 = _sm21_a_global
  L10_12 = L10_12.dad_sensor
  L10_12 = L10_12.setActive
  L10_12(L10_12, false)
  L10_12 = Fn_pcSensorOff
  L10_12("pccubesensor2_warp_warning_01")
  L10_12 = Fn_pcSensorOff
  L10_12("pccubesensor2_warp_area_01")
  L10_12 = _sm21_a_global
  L10_12.cap_count = _sm21_a_global.cap_count + 1
  L10_12 = runTimerTask
  L10_12(1, function(A0_13)
    if A0_13 >= _SEARCH_TIME then
      Mv_gotoNextPhase()
      abortTimerTask()
    end
  end)
  L10_12 = invokeTask
  L10_12(function()
    local L0_14
    L0_14 = 0
    while L0_14 < 105 do
      L0_14 = L0_14 + 1
      wait()
    end
    L4_6:setVisible(false)
  end)
  L10_12 = Sound
  L10_12 = L10_12.playSE
  L10_12(L10_12, "m04_013", 1, "", _sm21_a_global.puppet_tbl.sm21_client)
  L10_12 = Fn_captionViewWait
  L10_12("sm21_00114", 5)
  L10_12 = Mv_waitPhase
  L10_12()
  L10_12 = Fn_setNpcActive
  L10_12("bf01", false)
  L10_12 = Fn_setNpcActive
  L10_12("gf01", false)
  L10_12 = Player
  L10_12 = L10_12.setStay
  L10_12(L10_12, true)
  L10_12 = Fn_naviKill
  L10_12()
  L1_3 = nil
  L10_12 = Fn_captionViewEnd
  L10_12()
  L10_12 = Fn_captionViewWait
  L10_12("sm21_00102")
  L10_12 = Fn_captionViewWait
  L10_12("sm21_00115")
  L10_12 = Fn_captionViewWait
  L10_12("sm21_00116")
  L10_12 = Mv_viewObj
  L10_12("locator2_navi_01", 0.5)
  L1_3 = "locator2_navi_01"
  L10_12 = Fn_naviSet
  L10_12(findGameObject2("Node", L1_3))
  L10_12 = Fn_pcSensorOn
  L10_12("pccubesensor2_navi_01")
  L10_12 = Fn_pcSensorOn
  L10_12("pccubesensor2_warp_warning_01")
  L10_12 = Fn_pcSensorOn
  L10_12("pccubesensor2_warp_area_01")
  L10_12 = Fn_pcSensorOn
  L10_12("pccubesensor2_leading_navi_01")
  L10_12 = Player
  L10_12 = L10_12.setStay
  L10_12(L10_12, false)
  L10_12 = invokeTask
  L10_12(function()
    waitSeconds(10)
    Fn_captionViewWait("sm21_00117")
  end)
  L10_12 = Mv_waitPhase
  L10_12()
  L10_12 = Mv_safeTaskAbort
  L10_12 = L10_12(L7_9)
  L10_12 = Fn_disappearNpc
  L10_12("sm21_guid", 0)
  L10_12 = findGameObject2
  L10_12 = L10_12("Node", "merchant_ship_01")
  L10_12:kill()
  L10_12 = nil
  _sm21_a_global.puppet_tbl.sm21_guid = nil
  Player:setStay(true)
  voice_task = Mv_safeTaskAbort(voice_task)
  Fn_naviKill()
  L1_3 = nil
  L2_4 = _PART_PHASE_02
  Fn_pcSensorOff("pccubesensor2_leading_navi_01")
  Fn_coercionGravityRevert()
  Player:setAttrTune(Player.kAttrTune_Normal)
  grabReset("sm21_client", "locator2_dad_stay_01", false)
  Fn_setGrabNpc("sm21_client", true, true)
  dad_release_warp("locator2_dad_stay_01_warp_")
  Fn_setCatWarpCheckPoint("locator2_navi_01")
  while Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_01"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }) ~= nil and not Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_01"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }):isRunning() ~= true do
    if _dad_npc:isFall() == true then
      if 0 + 1 > 150 then
        Fn_blackout()
        Fn_warpNpc(_dad_npc, "locator2_dad_stay_01")
        Fn_fadein()
        break
      end
    else
    end
    wait()
  end
  if Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_01"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }) ~= nil and Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_01"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }):isRunning() == true then
    Fn_moveNpc("sm21_client", {
      "locator2_dad_lookaround_01"
    }, {
      anim_speed_over = true,
      runLength = 3,
      anim_walk_speed = 1
    }):abort()
  end
  Fn_playMotionNpc("sm21_client", "lookaround_01", false)
  waitSeconds(1.5)
  Fn_userCtrlAllOff()
  Fn_kaiwaDemoView("sm21_00400k")
  Fn_setGrabNpc("sm21_client", false, false)
  Player:setStay(false)
  Fn_userCtrlOn()
  invokeTask(function()
    Fn_missionViewWait("sm21_00104")
  end)
  waitSeconds(1.3)
  grabWait(_sm21_a_global.puppet_tbl.sm21_client, _sm21_a_global.dad_sensor)
  _sm21_a_global.dad_sensor:setActive(false)
  Fn_pcSensorOn("pccubesensor2_leading_navi_02")
  Mv_viewObj("locator2_navi_02", 0.5)
  L1_3 = "locator2_navi_02"
  Fn_naviSet(findGameObject2("Node", L1_3))
  Fn_pcSensorOn("pccubesensor2_navi_02")
  waitSeconds(3)
  Sound:playSE("m04_014", 1, "", _sm21_a_global.puppet_tbl.sm21_client)
  Fn_captionView("sm21_00105", 5)
  Mv_waitPhase()
  Player:setStay(true)
  Fn_naviKill()
  L1_3 = nil
  L2_4 = _PART_PHASE_03
  Fn_pcSensorOff("pccubesensor2_leading_navi_02")
  Fn_coercionGravityRevert()
  Player:setAttrTune(Player.kAttrTune_Normal)
  grabReset("sm21_client", "locator2_dad_stay_02", false)
  Fn_setGrabNpc("sm21_client", true, true)
  dad_release_warp("locator2_dad_stay_02_warp_")
  while Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_02"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }) ~= nil and Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_02"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }):isRunning() do
    if _dad_npc:isFall() == true then
      if 0 + 1 > 150 then
        Fn_blackout()
        Fn_warpNpc(_dad_npc, "locator2_dad_stay_02")
        Fn_fadein()
        break
      end
    else
    end
    wait()
  end
  if Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_02"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }) ~= nil and Fn_moveNpc("sm21_client", {
    "locator2_dad_lookaround_02"
  }, {
    anim_speed_over = true,
    runLength = 3,
    anim_walk_speed = 1
  }):isRunning() == true then
    Fn_moveNpc("sm21_client", {
      "locator2_dad_lookaround_02"
    }, {
      anim_speed_over = true,
      runLength = 3,
      anim_walk_speed = 1
    }):abort()
  end
  Fn_playMotionNpc("sm21_client", "lookaround", false)
  waitSeconds(1.5)
  Fn_setCatWarpCheckPoint("locator2_navi_02")
  Fn_userCtrlAllOff()
  Fn_kaiwaDemoView("sm21_00500k")
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_setGrabNpc("sm21_client", false, false)
  invokeTask(function()
    Fn_missionViewWait("sm21_00106")
  end)
  waitSeconds(1.3)
  Fn_pcSensorOn("pccubesensor2_leading_navi_03")
  grabWait(_sm21_a_global.puppet_tbl.sm21_client, _sm21_a_global.dad_sensor)
  _sm21_a_global.dad_sensor:setActive(false)
  L1_3 = "locator2_navi_03"
  Fn_captionViewWait("sm21_00107")
  Mv_viewObj("locator2_navi_03", 0.5)
  Fn_naviSet(findGameObject2("Node", L1_3))
  Fn_pcSensorOn("pccubesensor2_navi_03")
  waitSeconds(2)
  Sound:playSE("m04_014", 1, "", _sm21_a_global.puppet_tbl.sm21_client)
  Fn_captionViewWait("sm21_00108", 5)
  Mv_waitPhase()
  Fn_naviKill()
  L1_3 = nil
  Fn_pcSensorOff("pccubesensor2_leading_navi_03")
  Fn_setCatWarpCheckPoint("locator2_navi_03")
  gf_motion_task = Mv_safeTaskAbort(gf_motion_task)
  bf_motion_task = Mv_safeTaskAbort(bf_motion_task)
  Fn_sendEventComSb("setPrevPhaseContinue", true)
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
function dad_release_warp(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20
  L1_16 = false
  L2_17 = Fn_getDistanceToPlayer
  L3_18 = _sm21_a_global
  L3_18 = L3_18.puppet_tbl
  L3_18 = L3_18.sm21_client
  L2_17 = L2_17(L3_18)
  if not (L2_17 > 10) then
    L2_17 = _dad_npc
    L3_18 = L2_17
    L2_17 = L2_17.findArea
    L4_19 = _sm21_a_global
    L4_19 = L4_19.puppet_tbl
    L4_19 = L4_19.sm21_client
    L4_19 = L4_19.getWorldPos
    L4_19 = L4_19(L5_20)
    L2_17 = L2_17(L3_18, L4_19, L5_20, L4_19(L5_20))
  elseif L2_17 == nil then
    L1_16 = true
  end
  if L1_16 == true then
    L2_17 = A0_15
    L3_18 = "01"
    L2_17 = L2_17 .. L3_18
    L3_18 = {}
    L4_19 = 1
    while true do
      if L5_20 ~= nil then
        if Fn_isInSightTarget(L5_20, 1) == false then
          L3_18[L5_20:getName()] = Fn_getDistanceToPlayer(L5_20)
        end
      else
        break
      end
      L4_19 = L4_19 + 1
    end
    if L3_18 ~= nil then
      L5_20(L3_18)
      for _FORV_8_, _FORV_9_ in L5_20(L3_18) do
        L2_17 = _FORV_8_
        break
      end
    end
    L5_20("sm21_client", L2_17)
  end
end
function dad_sensorOnEnter(A0_21)
  invokeTask(function()
    Fn_tutorialCaption("grab")
    _dad_motion_task = Fn_playLoopMotionInsert("sm21_client", "lookaround_01", {"lookaround"}, 4, 4)
  end)
end
function dad_sensorOnLeave(A0_22)
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
function bike_sensorOnEnter(A0_23, A1_24)
end
function bike_sensorOnLeave(A0_25, A1_26)
end
function pccubesensor2_navi_01_OnEnter(A0_27)
  if _sm21_a_global.puppet_tbl.sm21_client:isGrabbed() then
    A0_27:setActive(false)
    Mv_gotoNextPhase()
  end
end
function pccubesensor2_navi_02_OnEnter(A0_28)
  A0_28:setActive(false)
  Mv_gotoNextPhase()
end
function pccubesensor2_navi_03_OnEnter(A0_29)
  A0_29:setActive(false)
  Mv_gotoNextPhase()
end
function pccubesensor2_leading_navi_01_OnEnter()
  abortLeadingTask()
end
function pccubesensor2_leading_navi_01_OnLeave()
  createLeadingTask()
end
function pccubesensor2_leading_navi_02_OnEnter()
  abortLeadingTask()
end
function pccubesensor2_leading_navi_02_OnLeave()
  createLeadingTask()
end
function pccubesensor2_leading_navi_03_OnEnter()
  abortLeadingTask()
end
function pccubesensor2_leading_navi_03_OnLeave()
  createLeadingTask()
end
function pccubesensor2_warp_warning_01_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("sm21_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_01_OnLeave()
  runCatWarp()
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
function createLeadingTask()
  abortLeadingTask()
  _sm21_a_global.leading_task = invokeTask(function()
    while true do
      _sm21_a_global.leading_caption_time = _sm21_a_global.leading_caption_time - gameTickToSecond(1)
      if _sm21_a_global.leading_caption_time <= 0 then
        _sm21_a_global.leading_caption_time = 0
      end
      if _sm21_a_global.leading_caption_time <= 0 then
        if Fn_findNpc("sm21_client"):isGrabbed() == false then
          Fn_captionView("sm21_00122")
        end
        _sm21_a_global.leading_caption_time = _LEADING_CAPTION_TIME
      end
      wait()
    end
  end)
end
function abortLeadingTask()
  local L0_30
  L0_30 = _sm21_a_global
  L0_30.leading_task = Mv_safeTaskAbort(_sm21_a_global.leading_task)
  L0_30 = _sm21_a_global
  L0_30.leading_caption_time = 0
end
