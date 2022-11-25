dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm30_common.lua")
dofile("/Game/Misc/train_controller.lua")
_puppet_tbl = {}
_staff_bg_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_staff_car_move_task = nil
_sdemoStaffShip = nil
_scene1_train_start = false
_scene1_check_point_sensor = false
_secene1_longstay_train_task = nil
_scene1_checkpoint = 1
_scene1_checkpoint_max = 2
_scene1_longstay_line_flag = false
_train_controller_k = nil
_train_task_hdl = nil
_scene1_train_data = {
  npc_name = "sm30_train",
  reset_pos_name = "locator2_scene1_train_01",
  move_prefix = "locator2_scene1_train_move_",
  move_speed = 8.5,
  sensor_name = nil,
  move_task = nil
}
_scene1_pigeon_data_tbl = {
  {
    npc_name = "sm30_pigeon_01",
    reset_pos_name = "locator2_scene1_pigeon_01",
    idle_motion_tbl = {"stay_00", "stay_01"},
    fly_prefix = "locator2_scene1_pigeon_01_move_",
    sensor_name = nil,
    fly_task = nil
  },
  {
    npc_name = "sm30_pigeon_02",
    reset_pos_name = "locator2_scene1_pigeon_02",
    idle_motion_tbl = {
      "stay_00",
      "eat",
      "stay_01"
    },
    fly_prefix = "locator2_scene1_pigeon_02_move_",
    sensor_name = nil,
    fly_task = nil
  },
  {
    npc_name = "sm30_pigeon_03",
    reset_pos_name = "locator2_scene1_pigeon_03",
    idle_motion_tbl = {"stay_00", "stay_01"},
    fly_prefix = "locator2_scene1_pigeon_03_move_",
    sensor_name = nil,
    fly_task = nil
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    {
      name = "sm30_pigeon_03",
      type = "brd01",
      node = "locator2_scene1_pigeon_03",
      active = false,
      use_gravity = false
    }
  }
  L1_1.name = "sm30_director_01"
  L1_1.type = "man18"
  L1_1.node = "locator2_director_01"
  L1_1.active = false
  L2_2.name = "sm30_assistant_01"
  L2_2.type = "man17"
  L2_2.node = "locator2_assistant_01"
  L2_2.active = false
  L3_3.name = "sm30_assi_wom_01"
  L3_3.type = "wom01"
  L3_3.node = "locator2_assi_wom_01"
  L3_3.active = false
  L4_4.name = "sm30_train"
  L4_4.type = "ve01"
  L4_4.node = "locator2_scene1_train_01"
  L4_4.active = false
  L4_4.use_gravity = false
  L5_5 = {}
  L5_5.name = "sm30_pigeon_01"
  L5_5.type = "brd01"
  L5_5.node = "locator2_scene1_pigeon_01"
  L5_5.active = false
  L5_5.use_gravity = false
  L6_6 = {}
  L6_6.name = "sm30_pigeon_02"
  L6_6.type = "brd01"
  L6_6.node = "locator2_scene1_pigeon_02"
  L6_6.active = false
  L6_6.use_gravity = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L6_6[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
  end
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L5_5 = "bg2_scene4_parasol_01"
  L6_6 = "bg2_scene1_chair_01"
  for L5_5, L6_6 in L2_2(L3_3) do
    if findGameObject2("GimmickBg", L6_6) ~= nil then
      findGameObject2("GimmickBg", L6_6):setVisiblePermission(false)
      _staff_bg_tbl[L6_6] = findGameObject2("GimmickBg", L6_6)
    end
  end
  L2_2(L3_3)
  _sdemoStaffShip = L2_2
  L2_2(L3_3)
  L2_2(L3_3)
end
function Ingame()
  Fn_disableCostumeChange(true)
  Fn_userCtrlOff()
  LoadPlayerCommonMotionTable()
  scene1Main()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
  TrainController.setActiveHeksevillTrain(true)
end
function scene1Main()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9, L3_10)
  L0_7(L1_8, L2_9, L3_10)
  L0_7(L1_8, L2_9, L3_10)
  L7_14 = L3_10(L4_11, L5_12)
  L0_7(L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L3_10(L4_11, L5_12))
  for L3_10, L4_11 in L0_7(L1_8) do
    L6_13 = L4_11.npc_name
    L7_14 = true
    L5_12(L6_13, L7_14)
    L6_13 = string
    L6_13 = L6_13.format
    L7_14 = "%02d"
    L6_13 = L6_13(L7_14, L3_10)
    L6_13 = createGameObject2
    L7_14 = "Sensor"
    L6_13 = L6_13(L7_14)
    L7_14 = L6_13.setName
    L7_14(L6_13, L5_12)
    L7_14 = L6_13.setDetectMode
    L7_14(L6_13, 1)
    L7_14 = L6_13.setDetectBehavior
    L7_14(L6_13, 1)
    L7_14 = L6_13.addBox
    L7_14(L6_13, Vector(12, 12, 12))
    L7_14 = L6_13.setPos
    L7_14(L6_13, Vector(0, 0.12, 0))
    L7_14 = L6_13.setOnEnter
    L7_14(L6_13, L5_12 .. "_OnEnter")
    L7_14 = L6_13.setOnLeave
    L7_14(L6_13, L5_12 .. "_OnLeave")
    L7_14 = L6_13.try_init
    L7_14(L6_13)
    L7_14 = L6_13.waitForReady
    L7_14(L6_13)
    L7_14 = L6_13.try_start
    L7_14(L6_13)
    L7_14 = _puppet_tbl
    L7_14 = L7_14[L4_11.npc_name]
    L7_14 = L7_14.appendChild
    L7_14(L7_14, L6_13)
    L7_14 = _scene1_pigeon_data_tbl
    L7_14 = L7_14[L3_10]
    L7_14.sensor_name = L5_12
    L7_14 = Fn_findNpc
    L7_14 = L7_14(L4_11.npc_name)
    L7_14:playMotion(L4_11.idle_motion_tbl, {isRepeat = true, isRandom = true})
  end
  L6_13 = "Node"
  L7_14 = "locator2_staff_car_01"
  L6_13 = L5_12
  L6_13 = findGameObject2
  L7_14 = "Node"
  L6_13 = L6_13(L7_14, "locator2_staff_car_02")
  L7_14 = L6_13
  L6_13 = L6_13.getWorldPos
  L7_14 = L6_13(L7_14)
  ;({
    L5_12,
    [4] = L6_13(L7_14)
  })[2] = L6_13
  ;({
    L5_12,
    [4] = L6_13(L7_14)
  })[3] = L7_14
  L1_8()
  L1_8(L2_9)
  L1_8()
  L1_8(L2_9)
  while true do
    if L3_10 == false then
    end
  end
  L3_10()
  L3_10(L4_11, L5_12)
  L3_10()
  L3_10(L4_11)
  L6_13 = L0_7.ship
  L3_10(L4_11, L5_12, L6_13)
  L6_13 = 2
  L3_10(L4_11, L5_12, L6_13)
  L3_10(L4_11)
  L6_13 = {}
  L6_13.deg = 20
  L7_14 = "easeIn"
  L3_10(L4_11, L5_12, L6_13, L7_14)
  L3_10(L4_11)
  L3_10(L4_11)
  L3_10()
  L3_10(L4_11, L5_12)
  for L6_13 = 1, 3 do
    L7_14 = "cubesensor2_scene1_train_contact_"
    L7_14 = L7_14 .. string.format("%02d", L6_13)
    findGameObject2("Sensor", L7_14):try_term()
    findGameObject2("Sensor", L7_14 .. "TOP1"):try_term()
    findGameObject2("Sensor", L7_14 .. "TOP2"):try_term()
  end
  L3_10(L4_11)
  _train_controller_k = nil
  L3_10(L4_11)
  _train_task_hdl = nil
  for L6_13, L7_14 in L3_10(L4_11) do
    findGameObject2("Sensor", L7_14.sensor_name):try_term()
    Fn_setNpcActive(L7_14.npc_name, false)
  end
  L4_11(L5_12)
  L6_13 = false
  L4_11(L5_12, L6_13)
  L6_13 = false
  L4_11(L5_12, L6_13)
end
function invokeFlyAwayNpcTask(A0_15, A1_16, A2_17, A3_18, A4_19, A5_20)
  local L6_21
  L6_21 = {}
  L6_21.move_task = RAC_InvokePursueFlyTask(A0_15, A1_16, A2_17, A3_18, A4_19, false)
  L6_21.timer_task = invokeTask(function()
    waitSeconds(A5_20)
  end)
  function L6_21.update(A0_22)
    while A0_22.timer_task:isRunning() and Fn_findNpcPuppet(A0_15):getActive() do
      wait()
    end
    while 0 < 100 and Fn_findNpcPuppet(A0_15):getActive() do
      Fn_findNpcPuppet(A0_15):setAlpha(1 - (0 + 1) / 100)
      wait()
    end
  end
  function L6_21.destractor(A0_23)
    A0_23.move_task:abort()
    A0_23.move_task = nil
    Fn_findNpcPuppet(A0_15):setAlpha(1)
    RAC_stopNpcMoveTask(A0_15)
    Fn_setNpcActive(A0_15, false)
  end
  return RAC_InvokeTaskWithDestractor(L6_21.update, L6_21.destractor, L6_21)
end
function pigeonFlyAwayOnEnter(A0_24, A1_25)
  if A1_25 ~= nil and (A1_25:getName() == "player" or A1_25:getName() == _scene1_train_data.npc_name) and _scene1_pigeon_data_tbl[A0_24] ~= nil then
    _scene1_pigeon_data_tbl[A0_24].fly_task = invokeFlyAwayNpcTask(_scene1_pigeon_data_tbl[A0_24].npc_name, _scene1_pigeon_data_tbl[A0_24].fly_prefix, 5, false, true, 5)
    Fn_sensorOff(_scene1_pigeon_data_tbl[A0_24].sensor_name)
  end
end
function sm30_TrainCreate()
  invokeSystemTask(function()
    local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43
    L0_26 = nil
    L1_27 = loadFileAsset
    L2_28 = "evb"
    L3_29 = "evx/train_hx_a_root"
    L1_27 = L1_27(L2_28, L3_29)
    if L1_27 ~= nil then
      L3_29 = L1_27
      L2_28 = L1_27.wait
      L2_28(L3_29)
      L3_29 = L1_27
      L2_28 = L1_27.getRoot
      L2_28 = L2_28(L3_29)
      L3_29 = EventData
      L4_30 = L3_29
      L3_29 = L3_29.create
      L5_31 = "train_hx_a_root"
      L6_32 = nil
      L3_29 = L3_29(L4_30, L5_31, L6_32, L7_33)
      L0_26 = L3_29
      L4_30 = L0_26
      L3_29 = L0_26.try_init
      L3_29(L4_30)
      L4_30 = L0_26
      L3_29 = L0_26.waitForReady
      L3_29(L4_30)
      L4_30 = L0_26
      L3_29 = L0_26.try_start
      L3_29(L4_30)
      L3_29 = TrainController
      L3_29 = L3_29.getSettingDataHeksevillTrain
      L4_30 = L3_29()
      L5_31 = TrainController
      L5_31 = L5_31.create
      L6_32 = "event_train_k"
      L5_31 = L5_31(L6_32, L7_33)
      L6_32 = {}
      L6_32[L7_33] = 0
      L6_32[L7_33] = 12
      L6_32[L7_33] = 0
      L6_32[L7_33] = 1
      L6_32[L7_33] = false
      L6_32[L7_33] = true
      L3_29 = L6_32
      L6_32 = L5_31.set
      L6_32(L7_33, L8_34)
      L6_32 = {}
      L7_33.station_name = "scene1_start"
      L7_33.node_name = "locator2_scene1_train_start2"
      L7_33.reverse = false
      L7_33.ride_node_name = nil
      L7_33.pc_ride_node_name = nil
      L8_34.name = nil
      L8_34.ad_title_id = nil
      L8_34.ad_sub_id = nil
      L8_34.map_title_id = nil
      L8_34.map_sub_id = nil
      L8_34.giude_id = nil
      L8_34.pattern = nil
      L8_34.map_disp = false
      L7_33.marker_tbl = L8_34
      L6_32[1] = L7_33
      L7_33.station_name = "scene1_end"
      L7_33.node_name = "locator2_scene1_train_goal"
      L7_33.reverse = true
      L7_33.ride_node_name = nil
      L7_33.pc_ride_node_name = nil
      L8_34.name = nil
      L8_34.ad_title_id = nil
      L8_34.ad_sub_id = nil
      L8_34.map_title_id = nil
      L8_34.map_sub_id = nil
      L8_34.giude_id = nil
      L8_34.pattern = nil
      L8_34.map_disp = false
      L7_33.marker_tbl = L8_34
      L6_32[2] = L7_33
      for L10_36 = 1, #L6_32 do
        L12_38 = L5_31
        L11_37 = L5_31.addStation
        L13_39 = L6_32[L10_36]
        L11_37(L12_38, L13_39)
      end
      L10_36 = L6_32[1]
      L10_36 = L10_36.station_name
      L9_35.station_name = L10_36
      L9_35.stay_time = -1
      L7_33(L8_34, L9_35)
      _train_controller_k = L5_31
      for L10_36 = 1, 3 do
        L11_37 = findGameObject2
        L12_38 = "TrainCar"
        L13_39 = "g1_mov_train_k_"
        L14_40 = string
        L14_40 = L14_40.format
        L15_41 = "%03d"
        L16_42 = L10_36
        L14_40 = L14_40(L15_41, L16_42)
        L13_39 = L13_39 .. L14_40
        L11_37 = L11_37(L12_38, L13_39)
        L12_38 = "cubesensor2_scene1_train_contact_"
        L13_39 = string
        L13_39 = L13_39.format
        L14_40 = "%02d"
        L15_41 = L10_36
        L13_39 = L13_39(L14_40, L15_41)
        L12_38 = L12_38 .. L13_39
        L13_39 = createGameObject2
        L14_40 = "Sensor"
        L13_39 = L13_39(L14_40)
        L15_41 = L13_39
        L14_40 = L13_39.setName
        L16_42 = L12_38
        L14_40(L15_41, L16_42)
        L15_41 = L13_39
        L14_40 = L13_39.setDetectMode
        L16_42 = 1
        L14_40(L15_41, L16_42)
        L15_41 = L13_39
        L14_40 = L13_39.setDetectBehavior
        L16_42 = 1
        L14_40(L15_41, L16_42)
        L15_41 = L13_39
        L14_40 = L13_39.addBox
        L16_42 = Vector
        L17_43 = 1.6
        L17_43 = L16_42(L17_43, 2.5, 5)
        L14_40(L15_41, L16_42, L17_43, L16_42(L17_43, 2.5, 5))
        L15_41 = L13_39
        L14_40 = L13_39.setPos
        L16_42 = Vector
        L17_43 = 0
        L17_43 = L16_42(L17_43, 0.5, 0)
        L14_40(L15_41, L16_42, L17_43, L16_42(L17_43, 0.5, 0))
        L15_41 = L13_39
        L14_40 = L13_39.setOnEnter
        L16_42 = L12_38
        L17_43 = "_OnEnter"
        L16_42 = L16_42 .. L17_43
        L14_40(L15_41, L16_42)
        L15_41 = L13_39
        L14_40 = L13_39.setOnLeave
        L16_42 = L12_38
        L17_43 = "_OnLeave"
        L16_42 = L16_42 .. L17_43
        L14_40(L15_41, L16_42)
        L15_41 = L13_39
        L14_40 = L13_39.try_init
        L14_40(L15_41)
        L15_41 = L13_39
        L14_40 = L13_39.waitForReady
        L14_40(L15_41)
        L15_41 = L13_39
        L14_40 = L13_39.try_start
        L14_40(L15_41)
        L14_40 = createGameObject2
        L15_41 = "Sensor"
        L14_40 = L14_40(L15_41)
        L16_42 = L14_40
        L15_41 = L14_40.setName
        L17_43 = L12_38
        L17_43 = L17_43 .. "TOP1"
        L15_41(L16_42, L17_43)
        L16_42 = L14_40
        L15_41 = L14_40.setDetectMode
        L17_43 = 1
        L15_41(L16_42, L17_43)
        L16_42 = L14_40
        L15_41 = L14_40.setDetectBehavior
        L17_43 = 1
        L15_41(L16_42, L17_43)
        L16_42 = L14_40
        L15_41 = L14_40.addBox
        L17_43 = Vector
        L17_43 = L17_43(1.5, 0.5, 4)
        L15_41(L16_42, L17_43, L17_43(1.5, 0.5, 4))
        L16_42 = L14_40
        L15_41 = L14_40.setPos
        L17_43 = Vector
        L17_43 = L17_43(0, 3, 0.4)
        L15_41(L16_42, L17_43, L17_43(0, 3, 0.4))
        L16_42 = L14_40
        L15_41 = L14_40.setOnEnter
        L17_43 = L12_38
        L17_43 = L17_43 .. "TOP1_OnEnter"
        L15_41(L16_42, L17_43)
        L16_42 = L14_40
        L15_41 = L14_40.setOnLeave
        L17_43 = L12_38
        L17_43 = L17_43 .. "TOP1_OnLeave"
        L15_41(L16_42, L17_43)
        L16_42 = L14_40
        L15_41 = L14_40.try_init
        L15_41(L16_42)
        L16_42 = L14_40
        L15_41 = L14_40.waitForReady
        L15_41(L16_42)
        L16_42 = L14_40
        L15_41 = L14_40.try_start
        L15_41(L16_42)
        L15_41 = createGameObject2
        L16_42 = "Sensor"
        L15_41 = L15_41(L16_42)
        L17_43 = L15_41
        L16_42 = L15_41.setName
        L16_42(L17_43, L12_38 .. "TOP2")
        L17_43 = L15_41
        L16_42 = L15_41.setDetectMode
        L16_42(L17_43, 1)
        L17_43 = L15_41
        L16_42 = L15_41.setDetectBehavior
        L16_42(L17_43, 1)
        L17_43 = L15_41
        L16_42 = L15_41.addBox
        L16_42(L17_43, Vector(1.5, 5.7, 4))
        L17_43 = L15_41
        L16_42 = L15_41.setPos
        L16_42(L17_43, Vector(0, 4, 0.25))
        L17_43 = L15_41
        L16_42 = L15_41.setOnEnter
        L16_42(L17_43, L12_38 .. "TOP2_OnEnter")
        L17_43 = L15_41
        L16_42 = L15_41.setOnLeave
        L16_42(L17_43, L12_38 .. "TOP2_OnLeave")
        L17_43 = L15_41
        L16_42 = L15_41.try_init
        L16_42(L17_43)
        L17_43 = L15_41
        L16_42 = L15_41.waitForReady
        L16_42(L17_43)
        L17_43 = L15_41
        L16_42 = L15_41.try_start
        L16_42(L17_43)
        L17_43 = L11_37
        L16_42 = L11_37.appendChild
        L16_42(L17_43, L13_39)
        L17_43 = L11_37
        L16_42 = L11_37.appendChild
        L16_42(L17_43, L14_40)
        L17_43 = L11_37
        L16_42 = L11_37.appendChild
        L16_42(L17_43, L15_41)
        if L10_36 == 3 then
          L16_42 = "pccubesensor2_scene1_train_horn_01"
          L17_43 = createGameObject2
          L17_43 = L17_43("PlayerSensor")
          L17_43:setName(L16_42)
          L17_43:setDetectBehavior(1)
          L17_43:addBox(Vector(10, 8, 40))
          L17_43:setPos(Vector(0, 0.3, 0))
          L17_43:setOnEnter(L16_42 .. "_OnEnter")
          L17_43:setOnLeave(L16_42 .. "_OnLeave")
          L17_43:try_init()
          L17_43:waitForReady()
          L17_43:try_start()
          L11_37:appendChild(L17_43)
          _scene1_train_data.sensor_name = L16_42
        end
      end
      _train_task_hdl = L7_33
    else
      L2_28 = print
      L3_29 = "FAILED : LOAD EVENT DATA evx/train_hx_a_root "
      L2_28(L3_29)
    end
  end)
end
function sm30_TrainRun()
  return invokeTask(function()
    while _train_controller_k ~= nil do
      TrainController:isIdling()
      _train_controller_k:run()
      if _scene1_train_start == true then
        print("train start")
        _train_controller_k:set({
          [TrainController.kParam_ForcedIdle] = false
        })
        _scene1_train_start = false
      end
      wait()
    end
  end)
end
function pccubesensor2_scene1_train_horn_01_OnEnter(A0_44, A1_45)
  Fn_pcSensorOff(_scene1_train_data.sensor_name)
  invokeTask(function()
    Sound:playSE("train_horn")
  end)
end
function pccubesensor2_scene1_train_horn_01_OnLeave(A0_46, A1_47)
end
function cubesensor2_scene1_pigeon_fly_away_01_OnEnter(A0_48, A1_49)
  pigeonFlyAwayOnEnter(1, A1_49)
end
function cubesensor2_scene1_pigeon_fly_away_01_OnLeave(A0_50, A1_51)
end
function cubesensor2_scene1_pigeon_fly_away_02_OnEnter(A0_52, A1_53)
  pigeonFlyAwayOnEnter(2, A1_53)
end
function cubesensor2_scene1_pigeon_fly_away_02_OnLeave(A0_54, A1_55)
end
function cubesensor2_scene1_pigeon_fly_away_03_OnEnter(A0_56, A1_57)
  pigeonFlyAwayOnEnter(3, A1_57)
end
function cubesensor2_scene1_pigeon_fly_away_03_OnLeave(A0_58, A1_59)
end
function pccubesensor2_scene1_goal_01_OnEnter()
  local L0_60, L1_61
  _is_in_sensor = true
end
function pccubesensor2_scene1_goal_01_OnLeave()
  local L0_62, L1_63
  _is_in_sensor = false
end
function pccubesensormulti2_scene1_out_01_OnEnter()
  local L0_64, L1_65
  _is_out_of_range = false
end
function pccubesensormulti2_scene1_out_01_OnLeave()
  local L0_66, L1_67
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_01_OnEnter()
  local L0_68, L1_69
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_01_OnLeave()
  local L0_70, L1_71
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_02_OnEnter()
  local L0_72, L1_73
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_02_OnLeave()
  local L0_74, L1_75
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_03_OnEnter()
  local L0_76, L1_77
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_03_OnLeave()
  local L0_78, L1_79
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_01TOP1_OnEnter()
  local L0_80, L1_81
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_01TOP1_OnLeave()
  local L0_82, L1_83
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_02TOP1_OnEnter()
  local L0_84, L1_85
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_02TOP1_OnLeave()
  local L0_86, L1_87
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_03TOP1_OnEnter()
  local L0_88, L1_89
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_03TOP1_OnLeave()
  local L0_90, L1_91
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_01TOP2_OnEnter()
  local L0_92, L1_93
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_01TOP2_OnLeave()
  local L0_94, L1_95
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_02TOP2_OnEnter()
  local L0_96, L1_97
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_02TOP2_OnLeave()
  local L0_98, L1_99
  _is_out_of_range = false
end
function cubesensor2_scene1_train_contact_03TOP2_OnEnter()
  local L0_100, L1_101
  _is_out_of_range = true
end
function cubesensor2_scene1_train_contact_03TOP2_OnLeave()
  local L0_102, L1_103
  _is_out_of_range = false
end
function pccubesensor2_scene1_check_point_01_OnEnter()
  local L0_104, L1_105
  _scene1_check_point_sensor = true
  _scene1_train_start = true
end
function pccubesensor2_scene1_check_point_01_OnLeave()
  local L0_106, L1_107
  _scene1_check_point_sensor = false
end
