dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/train_controller.lua")
dofile("/Game/Mob/mob_event_util.lua")
_sdemo1 = nil
_sdemo2 = nil
_adi_ve = nil
_view_node = nil
_navi_hdl = nil
_train_hdl = nil
_caption_count = 0
_now_notice_act = false
_check_task = nil
_out_count = false
_near_railway = false
_npc_tbl = {}
_police_pup_tbl = {}
_arrivalstation = false
_arrivalviewing = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    {
      name = "police04",
      type = "man31",
      node = "locator2_police_man31_04"
    },
    {
      name = "police05",
      type = "man31",
      node = "locator2_police_man31_05"
    },
    {
      name = "police06",
      type = "man31",
      node = "locator2_police_man31_06"
    },
    {
      name = "police07",
      type = "man31",
      node = "locator2_police_man31_07"
    },
    {
      name = "police08",
      type = "man31",
      node = "locator2_police_man31_08"
    },
    {
      name = "police09",
      type = "man31",
      node = "locator2_police_man31_09"
    },
    {
      name = "police10",
      type = "man31",
      node = "locator2_police_man31_10"
    },
    {
      name = "police11",
      type = "man31",
      node = "locator2_police_man31_11"
    },
    {
      name = "police12",
      type = "man31",
      node = "locator2_police_man31_12"
    },
    {
      name = "police13",
      type = "man31",
      node = "locator2_police_man31_13"
    },
    {
      name = "police14",
      type = "man31",
      node = "locator2_police_man31_14"
    },
    {
      name = "police15",
      type = "man31",
      node = "locator2_police_man31_15"
    },
    {
      name = "police16",
      type = "man31",
      node = "locator2_police_man31_16"
    },
    {
      name = "police17",
      type = "man31",
      node = "locator2_police_man31_17"
    },
    {
      name = "police18",
      type = "man31",
      node = "locator2_police_man31_18"
    },
    {
      name = "police19",
      type = "man31",
      node = "locator2_police_man31_19"
    },
    {
      name = "police20",
      type = "man31",
      node = "locator2_walk_man31_01"
    },
    {
      name = "police21",
      type = "man31",
      node = "locator2_walk_man31_2_1"
    }
  }
  L1_1.name = "adicca"
  L1_1.type = "man77"
  L1_1.node = "locator2_sdemo_adi_01"
  L1_1.active = false
  L1_1.use_fall = true
  L2_2.name = "police01"
  L2_2.type = "man31"
  L2_2.node = "locator2_police_man31_01"
  L3_3.name = "police02"
  L3_3.type = "man31"
  L3_3.node = "locator2_police_man31_02"
  L4_4 = {}
  L4_4.name = "police03"
  L4_4.type = "man31"
  L4_4.node = "locator2_police_man31_03"
  _npc_tbl = L1_1
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    if string.match(L4_4, "police") ~= nil then
      _police_pup_tbl[L4_4] = Fn_findNpcPuppet(L4_4)
    end
  end
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  _sdemo1 = L1_1
  _sdemo2 = L1_1
  L4_4 = "g1_car_pd_09"
  _adi_ve = L1_1
  L1_1(L2_2, L3_3)
  L1_1()
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23
  L0_5 = {L1_6, L2_7}
  for L4_9, L5_10 in L1_6(L2_7) do
    if L4_9 == "police17" then
      L6_11 = Fn_playMotionNpc
      L7_12 = L4_9
      L8_13 = "lookaround_02"
      L9_14 = false
      L6_11(L7_12, L8_13, L9_14)
    elseif L4_9 == "police18" then
      L6_11 = Fn_playMotionNpc
      L7_12 = L4_9
      L8_13 = "lookaround_03"
      L9_14 = false
      L6_11(L7_12, L8_13, L9_14)
    else
      L6_11 = Fn_playLoopMotionRand
      L7_12 = L4_9
      L8_13 = L0_5
      L9_14 = 5
      L10_15 = 10
      L6_11(L7_12, L8_13, L9_14, L10_15)
    end
  end
  L1_6.loop = true
  L1_6.anim_walk = "npc_walk"
  L1_6.anim_turn_l = "npc_turn_l"
  L1_6.anim_turn_r = "npc_turn_r"
  L4_9 = L1_6
  L2_7(L3_8, L4_9)
  L4_9 = "locator2_walk_man31_03"
  L5_10 = "locator2_walk_man31_04"
  L6_11 = "locator2_walk_man31_05"
  L7_12 = "locator2_walk_man31_06"
  L8_13 = "locator2_walk_man31_01"
  L4_9 = "police20"
  L5_10 = L2_7
  L3_8(L4_9, L5_10)
  L4_9 = L3_8
  L5_10 = L1_6
  L3_8(L4_9, L5_10)
  L4_9 = "locator2_walk_man31_2_2"
  L5_10 = "locator2_walk_man31_2_3"
  L6_11 = "locator2_walk_man31_2_4"
  L7_12 = "locator2_walk_man31_2_1"
  L4_9 = Fn_moveNpc
  L5_10 = "police21"
  L6_11 = L3_8
  L4_9(L5_10, L6_11)
  L4_9 = TrainController
  L4_9 = L4_9.setActiveHeksevillTrain
  L5_10 = false
  L4_9(L5_10)
  L4_9 = Fn_sendEventComSb
  L5_10 = "fPartbrahmanControl"
  L4_9(L5_10)
  L4_9 = Fn_sendEventComSb
  L5_10 = "checkComSbViewNode"
  L4_9 = L4_9(L5_10)
  _view_node = L4_9
  while true do
    L4_9 = Fn_sendEventComSb
    L5_10 = "nowBraPhase"
    L4_9 = L4_9(L5_10)
    if L4_9 ~= 1 then
      L4_9 = wait
      L4_9()
    end
  end
  L4_9 = Fn_missionStart
  L4_9()
  L4_9 = Fn_kaiwaDemoView
  L5_10 = "ep14_00170k"
  L4_9(L5_10)
  L4_9 = {
    L5_10,
    L6_11,
    L7_12
  }
  L5_10 = "ep14_00171k"
  L6_11 = "ep14_00172k"
  L7_12 = "ep14_00173k"
  L5_10 = {
    L6_11,
    L7_12,
    L8_13
  }
  L6_11 = {}
  L6_11.text = "ep14_05000"
  L7_12 = Pad
  L7_12 = L7_12.kButton_RR
  L6_11.btn = L7_12
  L7_12 = {}
  L7_12.text = "ep14_05001"
  L8_13 = Pad
  L8_13 = L8_13.kButton_RD
  L7_12.btn = L8_13
  L8_13 = {}
  L8_13.text = "ep14_05002"
  L9_14 = Pad
  L9_14 = L9_14.kButton_RL
  L8_13.btn = L9_14
  L6_11 = HUD
  L7_12 = L6_11
  L6_11 = L6_11.selectionOpen
  L8_13 = "ep14_05003"
  L9_14 = L5_10
  L6_11(L7_12, L8_13, L9_14)
  L6_11 = nil
  while true do
    L7_12 = HUD
    L8_13 = L7_12
    L7_12 = L7_12.selectionResult
    L7_12 = L7_12(L8_13)
    L6_11 = L7_12
    if L6_11 ~= nil then
      L7_12 = Pad
      L7_12 = L7_12.kButton_RL
      if L6_11 == L7_12 then
        L7_12 = Fn_kaiwaDemoView
        L8_13 = L4_9[1]
        L7_12(L8_13)
      else
        L7_12 = Pad
        L7_12 = L7_12.kButton_RD
        if L6_11 == L7_12 then
          L7_12 = Fn_kaiwaDemoView
          L8_13 = L4_9[2]
          L7_12(L8_13)
        else
          L7_12 = Pad
          L7_12 = L7_12.kButton_RR
          if L6_11 == L7_12 then
            L7_12 = Fn_kaiwaDemoView
            L8_13 = L4_9[3]
            L7_12(L8_13)
          end
        end
      end
      L7_12 = print
      L8_13 = "kButton:"
      L9_14 = L6_11
      L8_13 = L8_13 .. L9_14
      L7_12(L8_13)
      break
    end
    L7_12 = wait
    L7_12()
  end
  L7_12 = Fn_blackout
  L8_13 = 1
  L7_12(L8_13)
  L7_12 = Player
  L8_13 = L7_12
  L7_12 = L7_12.setStay
  L9_14 = true
  L7_12(L8_13, L9_14)
  L7_12 = findGameObject2
  L8_13 = "Node"
  L9_14 = "locator2_sdemo_pc_pos"
  L7_12 = L7_12(L8_13, L9_14)
  L8_13 = Fn_resetPcPos
  L9_14 = L7_12
  L8_13(L9_14)
  L8_13 = Fn_sendEventComSb
  L9_14 = "addBraPhase"
  L8_13(L9_14)
  while true do
    L8_13 = Fn_sendEventComSb
    L9_14 = "nowBraPhase"
    L8_13 = L8_13(L9_14)
    if L8_13 ~= 3 then
      L8_13 = wait
      L8_13()
    end
  end
  L8_13 = _sdemo1
  L9_14 = L8_13
  L8_13 = L8_13.set
  L10_15 = "locator2_camera01"
  L11_16 = "locator2_aim_ferris_wheel"
  L8_13(L9_14, L10_15, L11_16)
  L8_13 = _sdemo1
  L9_14 = L8_13
  L8_13 = L8_13.play
  L8_13(L9_14)
  L8_13 = Fn_fadein
  L9_14 = 1
  L8_13(L9_14)
  L8_13 = Fn_captionViewWait
  L9_14 = "ep14_05004"
  L10_15 = 2
  L8_13(L9_14, L10_15)
  L8_13 = {L9_14}
  L9_14 = {}
  L9_14.pos = "locator2_police_man31_02"
  L9_14.time = 2
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.play
  L11_16 = nil
  L12_17 = L8_13
  L9_14(L10_15, L11_16, L12_17)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep14_05005"
  L11_16 = 2
  L9_14(L10_15, L11_16)
  L9_14 = waitSeconds
  L10_15 = 0.5
  L9_14(L10_15)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.zoomIn
  L11_16 = 1.5
  L12_17 = {}
  L12_17.deg = 10
  L13_18 = "easeOut"
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = waitSeconds
  L10_15 = 0.5
  L9_14(L10_15)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep14_05006"
  L11_16 = 3
  L12_17 = 2
  L9_14(L10_15, L11_16, L12_17)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.play
  L11_16 = nil
  L12_17 = {}
  L12_17.pos = "locator2_police_man31_03"
  L12_17.time = 2.5
  L9_14(L10_15, L11_16, L12_17)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.zoomOut
  L11_16 = 1.5
  L12_17 = {}
  L12_17.deg = 40
  L13_18 = "easeOut"
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.play
  L11_16 = nil
  L12_17 = {L13_18}
  L13_18 = {}
  L14_19 = _view_node
  L13_18.pos = L14_19
  L13_18.time = 2
  L9_14(L10_15, L11_16, L12_17)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep14_05007"
  L11_16 = 2
  L9_14(L10_15, L11_16)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.set
  L11_16 = "locator2_camera02"
  L12_17 = _view_node
  L13_18 = true
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.play
  L9_14(L10_15)
  L9_14 = _sdemo1
  L10_15 = L9_14
  L9_14 = L9_14.zoomIn
  L11_16 = 1.5
  L12_17 = {}
  L12_17.deg = 10
  L13_18 = "easeOut"
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep14_05008"
  L11_16 = 3
  L12_17 = 3.2
  L9_14(L10_15, L11_16, L12_17)
  L9_14 = {L10_15}
  L10_15 = {}
  L10_15.pos = "locator2_aim_station"
  L10_15.time = 1.5
  L10_15 = _sdemo1
  L11_16 = L10_15
  L10_15 = L10_15.set
  L12_17 = "locator2_camera01"
  L13_18 = _view_node
  L14_19 = false
  L10_15(L11_16, L12_17, L13_18, L14_19)
  L10_15 = _sdemo1
  L11_16 = L10_15
  L10_15 = L10_15.play
  L12_17 = {L13_18}
  L13_18 = {}
  L13_18.pos = "locator2_camera03"
  L13_18.time = 4
  L13_18 = L9_14
  L10_15(L11_16, L12_17, L13_18)
  L10_15 = _sdemo1
  L11_16 = L10_15
  L10_15 = L10_15.zoomOut
  L12_17 = 1
  L13_18 = {}
  L13_18.deg = 40
  L14_19 = "easeOut"
  L10_15(L11_16, L12_17, L13_18, L14_19)
  L10_15 = Fn_captionViewWait
  L11_16 = "ep14_05009"
  L12_17 = 3
  L13_18 = 4
  L10_15(L11_16, L12_17, L13_18)
  L10_15 = _sdemo1
  L11_16 = L10_15
  L10_15 = L10_15.stop
  L12_17 = 0
  L10_15(L11_16, L12_17)
  L10_15 = Fn_sendEventComSb
  L11_16 = "addBraPhase"
  L10_15(L11_16)
  L10_15 = Player
  L11_16 = L10_15
  L10_15 = L10_15.setStay
  L12_17 = false
  L10_15(L11_16, L12_17)
  L10_15 = Fn_userCtrlOn
  L10_15()
  while true do
    L10_15 = Fn_sendEventComSb
    L11_16 = "nowBraPhase"
    L10_15 = L10_15(L11_16)
    if L10_15 ~= 5 then
      L10_15 = wait
      L10_15()
    end
  end
  L10_15 = waitSeconds
  L11_16 = 1
  L10_15(L11_16)
  L10_15 = Fn_missionView
  L11_16 = "ep14_05011"
  L10_15(L11_16)
  L10_15 = waitSeconds
  L11_16 = 1
  L10_15(L11_16)
  L10_15 = Fn_pcSensorOn
  L11_16 = "pccubesensor2_navi_01"
  L10_15(L11_16)
  L10_15 = invokeTask
  function L11_16()
    while not _arrivalstation do
      if Fn_sendEventComSb("isGrabbedBrahman") then
        if findGameObject2("PlayerSensor", "pccubesensor2_in_station"):getActive() == false then
          Fn_pcSensorOn("pccubesensor2_in_station")
        end
      elseif findGameObject2("PlayerSensor", "pccubesensor2_in_station"):getActive() then
        Fn_pcSensorOff("pccubesensor2_in_station")
      end
      wait()
    end
    Fn_pcSensorOff("pccubesensor2_in_station")
  end
  L10_15(L11_16)
  L10_15 = Fn_pcSensorOn
  L11_16 = "pccubesensormulti2_monitoring_01"
  L10_15(L11_16)
  L10_15 = Fn_pcSensorOn
  L11_16 = "pccubesensormulti2_monitoring_02"
  L10_15(L11_16)
  while true do
    L10_15 = _train_task_hdl
    if L10_15 == nil then
      L10_15 = wait
      L10_15()
    end
  end
  L10_15 = _train_controller_k
  L11_16 = L10_15
  L10_15 = L10_15.setStationActive
  L12_17 = false
  L10_15(L11_16, L12_17)
  function L10_15()
    local L0_24, L1_25
    L0_24 = _train_controller_k
    L1_25 = L0_24
    L0_24 = L0_24.set
    L0_24(L1_25, {
      [TrainController.kParam_Speed] = 0,
      [TrainController.kParam_MaxSpeed] = 10,
      [TrainController.kParam_IdleTime] = 15,
      [TrainController.kParam_RepopIdleTime] = 0,
      [TrainController.kParam_AccelTime] = 8
    })
    L0_24 = "locator2_train_before_station"
    L1_25 = Fn_getDistanceToPlayer
    L1_25 = L1_25("locator2_train_before_station")
    if L1_25 < 80 then
      L1_25 = L0_24
      L0_24 = L1_25 .. "1"
    end
    L1_25 = _train_controller_k
    L1_25 = L1_25.put
    L1_25(L1_25, {station_name = L0_24})
    L1_25 = _train_controller_k
    L1_25 = L1_25.getCars
    L1_25 = L1_25(L1_25)
    while Fn_isCaptionView() or Fn_getDistanceToPlayer(L1_25) > 60 do
      wait()
    end
    Sound:playSE("train_horn", 1, "", L1_25)
    waitSeconds(1)
    Sound:playSE("train_horn", 1, "", L1_25)
    Sound:playSE("kit_512", 0.5)
    pcStayCamStopOn()
    viewControl(L1_25)
    Fn_captionView("ep14_05024")
    pcStayCamStopOff()
  end
  L11_16 = nil
  while true do
    L12_17 = _next_phase
    if L12_17 == false then
      L12_17 = _near_railway
      if L12_17 then
        L12_17 = invokeTask
        L13_18 = L10_15
        L12_17 = L12_17(L13_18)
        L11_16 = L12_17
        L12_17 = wait
        L12_17()
        _near_railway = false
      end
      L12_17 = wait
      L12_17()
    end
  end
  _next_phase = false
  _arrivalstation = true
  if L11_16 ~= nil then
    L13_18 = L11_16
    L12_17 = L11_16.abort
    L12_17(L13_18)
    L11_16 = nil
  end
  L12_17 = Fn_sendEventComSb
  L13_18 = "addBraPhase"
  L12_17(L13_18)
  L12_17 = waitSeconds
  L13_18 = 0.5
  L12_17(L13_18)
  L12_17 = Player
  L13_18 = L12_17
  L12_17 = L12_17.setStay
  L14_19 = true
  L12_17(L13_18, L14_19)
  L12_17 = Fn_kaiwaDemoView
  L13_18 = "ep14_00175k"
  L12_17(L13_18)
  L12_17 = waitSeconds
  L13_18 = 0.5
  L12_17(L13_18)
  L12_17 = Fn_userCtrlAllOff
  L12_17()
  L12_17 = viewControl
  L13_18 = "locator2_station_view_02"
  L14_19 = 1
  L15_20 = 1
  L16_21 = 0.5
  L12_17(L13_18, L14_19, L15_20, L16_21)
  L12_17 = Fn_userCtrlOn
  L12_17()
  L12_17 = Player
  L13_18 = L12_17
  L12_17 = L12_17.setStay
  L14_19 = false
  L12_17(L13_18, L14_19)
  L12_17 = Fn_captionView
  L13_18 = "ep14_05012"
  L12_17(L13_18)
  L12_17 = Fn_pcSensorOff
  L13_18 = "pccubesensormulti2_monitoring_02"
  L12_17(L13_18)
  L12_17 = Fn_pcSensorOn
  L13_18 = "pccubesensormulti2_monitoring_03"
  L12_17(L13_18)
  L12_17 = Fn_pcSensorOn
  L13_18 = "pccubesensormulti2_out_station_1"
  L12_17(L13_18)
  L12_17 = invokeTask
  function L13_18()
    while not _arrivalviewing do
      if Fn_sendEventComSb("isGrabbedBrahman") then
        if findGameObject2("PlayerSensor", "pccubesensor2_viewing"):getActive() == false then
          Fn_pcSensorOn("pccubesensor2_viewing")
        end
      elseif findGameObject2("PlayerSensor", "pccubesensor2_viewing"):getActive() then
        Fn_pcSensorOff("pccubesensor2_viewing")
      end
      wait()
    end
    Fn_pcSensorOff("pccubesensor2_viewing")
  end
  L12_17(L13_18)
  L12_17 = waitPhase
  L12_17()
  _arrivalviewing = true
  L12_17 = Fn_naviKill
  L12_17()
  L12_17 = Fn_captionView
  L13_18 = "ep14_05013"
  L14_19 = 2
  L12_17(L13_18, L14_19)
  L12_17 = Sound
  L13_18 = L12_17
  L12_17 = L12_17.playSE
  L14_19 = "kit021a"
  L12_17(L13_18, L14_19)
  L12_17 = waitSeconds
  L13_18 = 1
  L12_17(L13_18)
  L12_17 = Fn_blackout
  L13_18 = 1
  L12_17(L13_18)
  L12_17 = Player
  L13_18 = L12_17
  L12_17 = L12_17.setStay
  L14_19 = true
  L12_17(L13_18, L14_19)
  L12_17 = Fn_sendEventComSb
  L13_18 = "addBraPhase"
  L12_17(L13_18)
  L12_17 = findGameObject2
  L13_18 = "Node"
  L14_19 = "locator2_sdemo_pc_01"
  L12_17 = L12_17(L13_18, L14_19)
  L13_18 = Fn_resetPcPos
  L14_19 = L12_17
  L13_18(L14_19)
  L13_18 = Fn_setNpcActive
  L14_19 = "adicca"
  L15_20 = true
  L13_18(L14_19, L15_20)
  L13_18 = _adi_ve
  L14_19 = L13_18
  L13_18 = L13_18.setActive
  L15_20 = true
  L13_18(L14_19, L15_20)
  L13_18 = wait
  L13_18()
  while true do
    L13_18 = Fn_sendEventComSb
    L14_19 = "nowBraPhase"
    L13_18 = L13_18(L14_19)
    if L13_18 ~= 8 then
      L13_18 = wait
      L13_18()
    end
  end
  L13_18 = _sdemo2
  L14_19 = L13_18
  L13_18 = L13_18.set
  L15_20 = "locator2_sdemo_cam_01_1"
  L16_21 = "locator2_sdemo_aim_01"
  L13_18(L14_19, L15_20, L16_21)
  L13_18 = _sdemo2
  L14_19 = L13_18
  L13_18 = L13_18.play
  L13_18(L14_19)
  L13_18 = Fn_fadein
  L13_18()
  L13_18 = waitSeconds
  L14_19 = 1
  L13_18(L14_19)
  L13_18 = {L14_19}
  L14_19 = {}
  L14_19.pos = "locator2_sdemo_cam_01_2"
  L14_19.time = 1.8
  L14_19 = {L15_20, L16_21}
  L15_20 = {}
  L15_20.pos = "locator2_sdemo_aim_02_1"
  L15_20.time = 1.8
  L16_21 = {}
  L16_21.pos = "locator2_sdemo_aim_02"
  L16_21.time = 2.2
  L15_20 = _sdemo2
  L16_21 = L15_20
  L15_20 = L15_20.play
  L17_22 = L13_18
  L18_23 = L14_19
  L15_20(L16_21, L17_22, L18_23)
  L15_20 = waitSeconds
  L16_21 = 3.8
  L15_20(L16_21)
  L15_20 = Fn_kaiwaDemoView
  L16_21 = "ep14_00180k"
  L15_20(L16_21)
  L15_20 = _sdemo2
  L16_21 = L15_20
  L15_20 = L15_20.stop
  L17_22 = 0
  L15_20(L16_21, L17_22)
  L15_20 = {
    L16_21,
    L17_22,
    L18_23
  }
  L16_21 = "ep14_00181k"
  L17_22 = "ep14_00182k"
  L18_23 = "ep14_00183k"
  L16_21 = {
    L17_22,
    L18_23,
    {
      text = "ep14_05027",
      btn = Pad.kButton_RL
    }
  }
  L17_22 = {}
  L17_22.text = "ep14_05025"
  L18_23 = Pad
  L18_23 = L18_23.kButton_RR
  L17_22.btn = L18_23
  L18_23 = {}
  L18_23.text = "ep14_05026"
  L18_23.btn = Pad.kButton_RD
  L17_22 = HUD
  L18_23 = L17_22
  L17_22 = L17_22.selectionOpen
  L17_22(L18_23, "ep14_05028", L16_21)
  L17_22 = nil
  while true do
    L18_23 = HUD
    L18_23 = L18_23.selectionResult
    L18_23 = L18_23(L18_23)
    L17_22 = L18_23
    if L17_22 ~= nil then
      L18_23 = Pad
      L18_23 = L18_23.kButton_RL
      if L17_22 == L18_23 then
        L18_23 = Fn_kaiwaDemoView
        L18_23(L15_20[1])
      else
        L18_23 = Pad
        L18_23 = L18_23.kButton_RD
        if L17_22 == L18_23 then
          L18_23 = Fn_kaiwaDemoView
          L18_23(L15_20[2])
        else
          L18_23 = Pad
          L18_23 = L18_23.kButton_RR
          if L17_22 == L18_23 then
            L18_23 = Fn_kaiwaDemoView
            L18_23(L15_20[3])
          end
        end
      end
      L18_23 = print
      L18_23("kButton:" .. L17_22)
      break
    end
    L18_23 = wait
    L18_23()
  end
  L18_23 = Fn_captionView
  L18_23("ep14_05014", 2)
  L18_23 = Fn_findNpcPuppet
  L18_23 = L18_23("adicca")
  Sound:playSE("adi_005", 1, "", L18_23)
  waitSeconds(1)
  Fn_sendEventComSb("addBraPhase")
  waitSeconds(1)
  Player:setLookAtIk(true, 1, L18_23:getWorldPos())
  waitSeconds(0.6)
  _sdemo2:set("locator2_sdemo_cam_02", L18_23, kSDEMO_APPEND_AIM, Vector(0, 1, 0))
  _sdemo2:play()
  while Fn_moveNpc("adicca", {
    "locator2_sdemo_adi_02"
  }, {runLength = -1}):isRunning() do
    wait()
  end
  Fn_moveNpc("adicca", {
    "locator2_sdemo_adi_02"
  }, {runLength = -1}):abort()
  Fn_sendEventComSb("addBraPhase")
  while Fn_sendEventComSb("nowBraPhase") ~= 12 do
    wait()
  end
  Fn_sendEventComSb("addBraPhase")
  Fn_kaiwaDemoView("ep14_00190k")
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Player:setStay(false)
  Fn_setDelaySDemoStop(_sdemo2)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  TrainController.setActiveHeksevillTrain(true)
  Fn_tutorialCaptionKill()
  Mob:restrict_ep14_f_00(false)
  Mob:restrictZone_ep14_01(false)
end
function nextPhaseOnEnter(A0_26)
  _next_phase = true
  Fn_pcSensorOff(A0_26)
end
function monitoringShipOnEnter()
  if Fn_sendEventComSb("isBraGrabbed") and _now_notice_act == false then
    _now_notice_act = true
    Fn_sendEventComSb("noticeFlgOn")
    invokeTask(function()
      local L0_27
      L0_27 = Player
      L0_27 = L0_27.setStay
      L0_27(L0_27, true)
      L0_27 = Fn_userCtrlAllOff
      L0_27()
      L0_27 = Fn_captionView
      L0_27("ep14_05015", 2)
      L0_27 = Sound
      L0_27 = L0_27.playSE
      L0_27(L0_27, "kit_512", 0.5)
      L0_27 = waitSeconds
      L0_27(0.5)
      L0_27 = Fn_lookAtObjectWait
      L0_27(_view_node, 1.5, 0.7)
      L0_27 = Fn_captionViewWait
      L0_27("ep14_05016", 2)
      L0_27 = Fn_blackout
      L0_27()
      L0_27 = nil
      if _arrivalstation then
        L0_27 = findGameObject2("Node", "locator2_station_pc_reset_pos")
      else
        L0_27 = findGameObject2("Node", "locator2_sdemo_pc_pos")
      end
      Fn_resetPcPos(L0_27)
      Fn_sendEventComSb("braReset")
      Fn_fadein()
      Player:setStay(false)
      Fn_userCtrlOn()
      _now_notice_act = false
    end)
  end
end
function monitoringPoliceOnEnter()
  if Fn_sendEventComSb("isBraGrabbed") and _now_notice_act == false then
    _now_notice_act = true
    invokeTask(function()
      local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36
      L0_28, L1_29 = nil, nil
      L2_30 = Fn_getPlayerWorldPos
      L2_30 = L2_30()
      for L6_34, L7_35 in L3_31(L4_32) do
        L8_36 = L7_35.getWorldPos
        L8_36 = L8_36(L7_35)
        L8_36.y = L8_36.y + 1.5
        if L1_29 == nil or L1_29 > Fn_get_distance(L2_30, L8_36) then
          L1_29, min_key = Fn_get_distance(L2_30, L8_36), L6_34
        end
      end
      L3_31.y = L4_32
      L4_32()
      L4_32(L5_33)
      L6_34 = "scared_03"
      L7_35 = false
      L8_36 = {}
      L8_36.animBlendDuration = 0.5
      L4_32(L5_33, L6_34, L7_35, L8_36)
      L6_34 = "m32_601"
      L7_35 = 1
      L8_36 = ""
      L6_34 = L5_33
      L7_35 = L4_32
      L8_36 = 60
      L5_33(L6_34, L7_35, L8_36)
      L6_34 = "ep14_05017"
      L7_35 = 2
      L8_36 = 1
      L5_33(L6_34, L7_35, L8_36)
      L6_34 = L5_33
      L7_35 = "ep14_siren"
      L8_36 = 1
      L6_34 = Player
      L7_35 = L6_34
      L6_34 = L6_34.setStay
      L8_36 = true
      L6_34(L7_35, L8_36)
      L6_34 = waitSeconds
      L7_35 = 1
      L6_34(L7_35)
      L6_34 = Fn_captionViewWait
      L7_35 = "ep14_05018"
      L8_36 = 2
      L6_34(L7_35, L8_36)
      L6_34 = Fn_blackout
      L6_34()
      L6_34 = Fn_sendEventComSb
      L7_35 = "braReset"
      L6_34(L7_35)
      L6_34 = nil
      L7_35 = _arrivalstation
      if L7_35 then
        L7_35 = findGameObject2
        L8_36 = "Node"
        L7_35 = L7_35(L8_36, "locator2_station_pc_reset_pos")
        L6_34 = L7_35
      else
        L7_35 = findGameObject2
        L8_36 = "Node"
        L7_35 = L7_35(L8_36, "locator2_sdemo_pc_pos")
        L6_34 = L7_35
      end
      L7_35 = Fn_resetPcPos
      L8_36 = L6_34
      L7_35(L8_36)
      L7_35 = Sound
      L8_36 = L7_35
      L7_35 = L7_35.stopSEHandle
      L7_35(L8_36, L5_33)
      L7_35 = Fn_fadein
      L7_35()
      L7_35 = Player
      L8_36 = L7_35
      L7_35 = L7_35.setStay
      L7_35(L8_36, false)
      _now_notice_act = false
    end)
  end
end
function pccubesensor2_navi_01_OnEnter(A0_37)
  local L1_38, L2_39
  _near_railway = true
  L1_38 = print
  L2_39 = "\227\129\147\227\129\147\227\129\139\227\130\137\232\161\140\227\129\145\227\130\139\227\129\139\227\130\130\226\128\166\232\170\152\229\176\142\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159\239\188\129\227\128\128_near_railway = true"
  L1_38(L2_39)
  L1_38 = findGameObject2
  L2_39 = "Node"
  L1_38 = L1_38(L2_39, "locator2_station_view_00")
  L2_39 = findGameObject2
  L2_39 = L2_39("Node", "locator2_station_view_01")
  if Fn_sendEventComSb("nowBraPhase") == 5 then
    invokeTask(function()
      pcStayCamStopOn()
      if Fn_getDistanceToPlayer(L2_39) > 60 then
        rayCheckPcSetStay(L1_38, 60)
        viewControl(L1_38)
      else
        rayCheckPcSetStay(L2_39, 60)
        viewControl(L2_39)
      end
      Fn_captionView("ep14_05029")
      waitSeconds(3.3)
      Fn_captionView("ep14_05019")
      pcStayCamStopOff()
      Fn_pcSensorOff(A0_37)
    end)
  end
end
function outStationOnEnter(A0_40)
  _check_task = invokeTask(function()
    while true do
      if Fn_sendEventComSb("isBraGrabbed") and _out_count == false then
        invokeTask(function()
          Player:setStay(true)
          Fn_pcSensorOff(A0_40)
          Fn_captionView("ep14_05020")
          waitSeconds(1.5)
          Player:setStay(false)
          _out_count = true
          waitSeconds(1.5)
          Fn_pcSensorOn("pccubesensor2_out_station_2")
        end)
        break
      elseif Fn_sendEventComSb("isBraGrabbed") and _out_count and _now_notice_act == false then
        Fn_sendEventComSb("noticeFlgOn")
        _now_notice_act = true
        invokeTask(function()
          local L0_41
          L0_41 = Player
          L0_41 = L0_41.setStay
          L0_41(L0_41, true)
          L0_41 = Fn_userCtrlAllOff
          L0_41()
          L0_41 = Fn_captionViewWait
          L0_41("ep14_05021", 2, 0.5)
          L0_41 = Sound
          L0_41 = L0_41.playSE
          L0_41(L0_41, "kit_512", 0.5)
          L0_41 = Fn_lookAtObjectWait
          L0_41(_view_node, 1.5, 0.7)
          L0_41 = Fn_captionViewWait
          L0_41("ep14_05022", 2)
          L0_41 = Fn_blackout
          L0_41()
          L0_41 = Fn_sendEventComSb
          L0_41("braReset")
          L0_41 = findGameObject2
          L0_41 = L0_41("Node", "locator2_station_pc_reset_pos")
          Fn_resetPcPos(L0_41)
          Fn_fadein()
          Player:setStay(false)
          Fn_userCtrlOn()
          _now_notice_act = false
        end)
        break
      end
      wait()
    end
  end)
end
function outStationOnLeave()
  if _check_task ~= nil then
    _check_task:abort()
    _check_task = nil
  end
end
function pccubesensor2_police_near_OnEnter()
  if Fn_sendEventComSb("isBraGrabbed") and _now_notice_act == false then
    _now_notice_act = true
    invokeTask(function()
      local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55
      L0_42, L1_43 = nil, nil
      L2_44 = Fn_getPlayerWorldPos
      L2_44 = L2_44()
      L3_45 = {}
      L3_45.police17 = L4_46
      L3_45.police18 = L4_46
      for L7_49, L8_50 in L4_46(L5_47) do
        L9_51 = L8_50.getWorldPos
        L9_51 = L9_51(L10_52)
        L9_51.y = L10_52
        if L1_43 == nil or L1_43 > L10_52 then
          min_key = L7_49
          L1_43 = L10_52
        end
      end
      L4_46.y = L5_47
      L5_47()
      L5_47(L6_48)
      L9_51 = {}
      L9_51.animBlendDuration = 0.5
      L5_47(L6_48, L7_49, L8_50, L9_51)
      L5_47(L6_48)
      L5_47.degree_h = 200
      L5_47.degree_v = 180
      L5_47.in_length = 60
      L5_47.out_length = 80
      L5_47.valid = true
      L5_47.targetJoint = "bn_head"
      L5_47.watchTarget = true
      L5_47.onlyFace = true
      L5_47.forceTarget = true
      for L9_51, L10_52 in L6_48(L7_49) do
        L13_55 = L5_47
        L11_53(L12_54, L13_55)
      end
      L9_51 = 1
      L9_51 = L6_48
      L7_49(L8_50, L9_51, L10_52)
      L9_51 = 2
      L7_49(L8_50, L9_51, L10_52)
      L9_51 = "ep14_siren"
      L8_50()
      L9_51 = min_key
      L9_51 = L3_45[L9_51]
      L8_50(L9_51, L10_52, L11_53, L12_54)
      L9_51 = "ep14_05018"
      L8_50(L9_51, L10_52)
      L8_50()
      L9_51 = "braReset"
      L8_50(L9_51)
      L9_51 = "Node"
      L9_51 = Fn_resetPcPos
      L9_51(L10_52)
      L9_51 = Sound
      L9_51 = L9_51.stopSEHandle
      L9_51(L10_52, L11_53)
      L9_51 = {}
      L9_51.valid = false
      L9_51.watchTarget = false
      L9_51.onlyFace = false
      L9_51.forceTarget = false
      for L13_55, _FORV_14_ in L10_52(L11_53) do
        Fn_findNpc(L13_55):resetSightParam()
        Fn_findNpc(L13_55):setSightParam(L9_51)
        Fn_findNpc(L13_55):resetDirection()
      end
      L10_52()
      L10_52()
      _now_notice_act = false
    end)
  end
end
