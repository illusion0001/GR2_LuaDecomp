local L1_1
L0_0 = {}
L0_0.TRAIN_MAX_SPEED = 10
L0_0.TRAIN_IDLE_TIME = 15
L0_0.TRAIN_REPOP_IDLE_TIME = 3
L0_0.TRAIN_ACCEL_TIME = 8
L0_0.STATION_SPEHER_RADIUS = 5
L0_0.kParam_Speed = 1
L0_0.kParam_MaxSpeed = 2
L0_0.kParam_IdleTime = 3
L0_0.kParam_RepopIdleTime = 4
L0_0.kParam_AccelTime = 5
L0_0.kParam_Invert = 6
L0_0.kParam_Reverse = 7
L0_0.kParam_NowReverse = 8
L0_0.kParam_ForcedIdle = 9
TrainController = L0_0
L0_0 = TrainController
function L1_1(A0_2, A1_3)
  local L2_4
  L2_4 = {}
  L2_4.hdl = nil
  L2_4.max_speed = TrainController.TRAIN_MAX_SPEED
  L2_4.idle_time = TrainController.TRAIN_IDLE_TIME
  L2_4.repop_idle_time = TrainController.TRAIN_REPOP_IDLE_TIME
  L2_4.accel_time = TrainController.TRAIN_ACCEL_TIME
  L2_4.invert = false
  L2_4.reverse = false
  L2_4.now_reverse = false
  L2_4.forced_idle = false
  L2_4.stop_station_name = nil
  L2_4.station_tbl = {}
  L2_4.req_put = nil
  print(" l  train  l load " .. A0_2 .. " start ...")
  if loadFileAsset("evd", "vehicle/" .. A1_3) ~= nil then
    loadFileAsset("evd", "vehicle/" .. A1_3):wait()
    L2_4.hdl = createGameObject2("Train")
    L2_4.hdl:setName(A0_2)
    L2_4.hdl:setDescription(loadFileAsset("evd", "vehicle/" .. A1_3):getRoot())
    L2_4.hdl:try_init()
    L2_4.hdl:waitForReady()
    L2_4.hdl:try_start()
    print(" l  train  l load " .. A0_2 .. " finish!!")
  else
    print(" l  train  l load " .. A0_2 .. " nil")
  end
  TrainController._installMethods(L2_4)
  return L2_4
end
L0_0.create = L1_1
L0_0 = TrainController
function L1_1()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15
  L0_5 = nil
  L1_6 = loadFileAsset
  L2_7 = "evb"
  L3_8 = "evx/train_hx_a_root"
  L1_6 = L1_6(L2_7, L3_8)
  if L1_6 ~= nil then
    L3_8 = L1_6
    L2_7 = L1_6.wait
    L2_7(L3_8)
    L3_8 = L1_6
    L2_7 = L1_6.getRoot
    L2_7 = L2_7(L3_8)
    L3_8 = EventData
    L4_9 = L3_8
    L3_8 = L3_8.create
    L5_10 = "train_hx_a_root"
    L3_8 = L3_8(L4_9, L5_10, L6_11, L7_12)
    L0_5 = L3_8
    L4_9 = L0_5
    L3_8 = L0_5.try_init
    L3_8(L4_9)
    L4_9 = L0_5
    L3_8 = L0_5.waitForReady
    L3_8(L4_9)
    L4_9 = L0_5
    L3_8 = L0_5.try_start
    L3_8(L4_9)
  end
  L2_7 = TrainController
  L2_7 = L2_7.create
  L3_8 = "train_k"
  L4_9 = "train_k"
  L2_7 = L2_7(L3_8, L4_9)
  L3_8 = TrainController
  L3_8 = L3_8.create
  L4_9 = "train_pd"
  L5_10 = "train_pd"
  L3_8 = L3_8(L4_9, L5_10)
  L4_9 = TrainController
  L4_9 = L4_9.getSettingDataHeksevillTrain
  L5_10 = L4_9()
  L6_11(L7_12, L8_13)
  for L9_14 = 1, #L5_10 do
    L10_15(L2_7, L5_10[L9_14])
  end
  L8_13.station_name = "downtown"
  L6_11(L7_12, L8_13)
  L8_13(L9_14, L10_15)
  for _FORV_11_ = 1, #L7_12 do
    L3_8:addStation(L7_12[_FORV_11_])
  end
  L10_15.station_name = "downtown_l_01"
  L8_13(L9_14, L10_15)
  return L8_13, L9_14
end
L0_0.createHeksevill = L1_1
L0_0 = TrainController
function L1_1()
  local L0_16, L1_17, L2_18, L3_19
  L0_16 = {}
  L1_17 = TrainController
  L1_17 = L1_17.kParam_Invert
  L0_16[L1_17] = true
  L1_17 = {}
  L2_18 = {}
  L2_18.station_name = "downtown"
  L2_18.node_name = "locator2_dt_a_root_station_pos"
  L2_18.reverse = true
  L2_18.ride_node_name = "locator2_dt_a_root_markerpos"
  L2_18.pc_ride_node_name = "locator2_dt_a_pcpos_on_train"
  L3_19 = {}
  L3_19.name = "gui_marker_10"
  L3_19.ad_title_id = "ui_acdialog_main_tr01"
  L3_19.ad_sub_id = "ui_acdialog_sub_08"
  L3_19.map_title_id = "ui_map_msinfo_main_tr01"
  L3_19.map_sub_id = "ui_map_msinfo_header_06"
  L3_19.giude_id = "ui_keyguide_ac_06"
  L3_19.pattern = "default"
  L3_19.map_disp = true
  L2_18.marker_tbl = L3_19
  L1_17[1] = L2_18
  L2_18 = {}
  L2_18.station_name = "oldnowa"
  L2_18.node_name = "locator2_cc_a_root_station_pos"
  L2_18.reverse = false
  L2_18.ride_node_name = "locator2_cc_a_root_markerpos"
  L2_18.pc_ride_node_name = "locator2_cc_a_pcpos_on_train"
  L3_19 = {}
  L3_19.name = "gui_marker_10"
  L3_19.ad_title_id = "ui_acdialog_main_tr02"
  L3_19.ad_sub_id = "ui_acdialog_sub_08"
  L3_19.map_title_id = "ui_map_msinfo_main_tr02"
  L3_19.map_sub_id = "ui_map_msinfo_header_06"
  L3_19.giude_id = "ui_keyguide_ac_06"
  L3_19.pattern = "default"
  L3_19.map_disp = true
  L2_18.marker_tbl = L3_19
  L1_17[2] = L2_18
  L2_18 = {}
  L2_18.station_name = "purejunu"
  L2_18.node_name = "locator2_ed_a_root_station_pos"
  L2_18.reverse = true
  L2_18.ride_node_name = "locator2_ed_a_root_markerpos"
  L2_18.pc_ride_node_name = "locator2_ed_a_pcpos_on_train"
  L3_19 = {}
  L3_19.name = "gui_marker_10"
  L3_19.ad_title_id = "ui_acdialog_main_tr03"
  L3_19.ad_sub_id = "ui_acdialog_sub_08"
  L3_19.map_title_id = "ui_map_msinfo_main_tr03"
  L3_19.map_sub_id = "ui_map_msinfo_header_06"
  L3_19.giude_id = "ui_keyguide_ac_06"
  L3_19.pattern = "default"
  L3_19.map_disp = true
  L2_18.marker_tbl = L3_19
  L1_17[3] = L2_18
  L2_18 = L0_16
  L3_19 = L1_17
  return L2_18, L3_19
end
L0_0.getSettingDataHeksevillTrain = L1_1
L0_0 = TrainController
function L1_1()
  local L0_20, L1_21, L2_22, L3_23
  L0_20 = {}
  L1_21 = TrainController
  L1_21 = L1_21.kParam_Invert
  L0_20[L1_21] = true
  L1_21 = {}
  L2_22 = {}
  L2_22.station_name = "downtown_l_01"
  L2_22.node_name = "locator2_dt_a_root_loop_line_station_pos_01"
  L1_21[1] = L2_22
  L2_22 = {}
  L2_22.station_name = "downtown_l_02"
  L2_22.node_name = "locator2_dt_a_root_loop_line_station_pos_02"
  L1_21[2] = L2_22
  L2_22 = {}
  L2_22.station_name = "downtown_l_03"
  L2_22.node_name = "locator2_dt_a_root_loop_line_station_pos_03"
  L1_21[3] = L2_22
  L2_22 = {}
  L2_22.station_name = "downtown_l_04"
  L2_22.node_name = "locator2_dt_a_root_loop_line_station_pos_04"
  L1_21[4] = L2_22
  L2_22 = L0_20
  L3_23 = L1_21
  return L2_22, L3_23
end
L0_0.getSettingDataDowntownTrain = L1_1
L0_0 = TrainController
function L1_1(A0_24)
  if A0_24 == true then
    GameDatabase:set(ggd.GlobalSystemFlags__ActiveHeksevillTrain, true)
  else
    GameDatabase:set(ggd.GlobalSystemFlags__ActiveHeksevillTrain, false)
  end
end
L0_0.setActiveHeksevillTrain = L1_1
L0_0 = TrainController
function L1_1(A0_25)
  if A0_25 == true then
    GameDatabase:set(ggd.GlobalSystemFlags__ActiveDowntownTrain, true)
  else
    GameDatabase:set(ggd.GlobalSystemFlags__ActiveDowntownTrain, false)
  end
end
L0_0.setActiveDowntownTrain = L1_1
L0_0 = TrainController
function L1_1(A0_26, A1_27)
  if not TrainController._isValid(A0_26) then
    return false
  end
  if type(A1_27) ~= "table" then
    A1_27 = {A1_27}
  end
  if A1_27[TrainController.kParam_Speed] ~= nil then
    A0_26.hdl:setSpeed(A1_27[TrainController.kParam_Speed])
  end
  if nil ~= A1_27[TrainController.kParam_MaxSpeed] then
    A0_26.max_speed = A1_27[TrainController.kParam_MaxSpeed]
  end
  A0_26.hdl:setMaxSpeed(A0_26.max_speed)
  if nil ~= A1_27[TrainController.kParam_IdleTime] then
    A0_26.idle_time = A1_27[TrainController.kParam_IdleTime]
  end
  A0_26.hdl:setIdleTime(A0_26.idle_time)
  if nil ~= A1_27[TrainController.kParam_RepopIdleTime] then
    A0_26.repop_idle_time = A1_27[TrainController.kParam_RepopIdleTime]
  end
  if nil ~= A1_27[TrainController.kParam_AccelTime] then
    A0_26.accel_time = A1_27[TrainController.kParam_AccelTime]
  end
  A0_26.hdl:setAccelTime(A0_26.accel_time)
  if nil ~= A1_27[TrainController.kParam_Reverse] then
    A0_26.reverse = A1_27[TrainController.kParam_Reverse]
  end
  if nil ~= A1_27[TrainController.kParam_NowReverse] then
    A0_26.reverse = A1_27[TrainController.kParam_NowReverse]
  end
  A0_26.hdl:setReverse(A0_26.now_reverse)
  if nil ~= A1_27[TrainController.kParam_Invert] then
    A0_26.invert = A1_27[TrainController.kParam_Invert]
    if A0_26.invert == true then
      if A0_26.invert == false then
        A0_26.hdl:invert()
      end
    elseif A0_26.invert.invert == true then
      A0_26.hdl:invert()
    end
  end
  if nil ~= A1_27[TrainController.kParam_ForcedIdle] and A1_27.forced_idle ~= A0_26.forced_idle then
    A0_26.forced_idle = A1_27[TrainController.kParam_ForcedIdle]
    A0_26.hdl:setForcedIdle(A0_26.forced_idle)
  end
end
L0_0.set = L1_1
L0_0 = TrainController
function L1_1(A0_28, A1_29)
  local L2_30
  L2_30 = A1_29
  if not TrainController._isValid(A0_28) then
    return false
  end
  if type(L2_30) ~= "table" then
    L2_30 = {L2_30}
  end
  for _FORV_7_, _FORV_8_ in ipairs(L2_30) do
    if TrainController.kParam_Speed == _FORV_8_ then
      ;({})[TrainController.kParam_Speed] = A0_28.hdl:getSpeed()
    elseif TrainController.kParam_MaxSpeed == _FORV_8_ then
      ;({})[TrainController.kParam_MaxSpeed] = A0_28.max_speed
    elseif TrainController.kParam_IdleTime == _FORV_8_ then
      ;({})[TrainController.kParam_IdleTime] = A0_28.idle_time
    elseif TrainController.kParam_RepopIdleTime == _FORV_8_ then
      ;({})[TrainController.kParam_RepopIdleTime] = A0_28.repop_idle_time
    elseif TrainController.kParam_AccelTime == _FORV_8_ then
      ;({})[TrainController.kParam_AccelTime] = A0_28.accel_time
    elseif TrainController.kParam_Reverse == _FORV_8_ then
      ;({})[TrainController.kParam_Reverse] = A0_28.reverse
    elseif TrainController.kParam_NowReverse == _FORV_8_ then
      ;({})[TrainController.kParam_NowReverse] = A0_28.reverse
    elseif TrainController.kParam_Invert == _FORV_8_ then
      ;({})[TrainController.kParam_Invert] = A0_28.invert
    elseif TrainController.kParam_ForcedIdle == _FORV_8_ then
      ;({})[TrainController.kParam_ForcedIdle] = A0_28.forced_idle
    end
  end
  if type(A1_29) ~= "table" then
    return ({})[A1_29]
  end
  return {}
end
L0_0.get = L1_1
L0_0 = TrainController
function L1_1(A0_31, A1_32)
  local L2_33, L3_34, L4_35, L5_36
  L2_33 = TrainController
  L2_33 = L2_33._isValid
  L3_34 = A0_31
  L2_33 = L2_33(L3_34)
  if not L2_33 then
    L2_33 = false
    return L2_33
  end
  L2_33 = {}
  L3_34 = findGameObject2
  L4_35 = "Node"
  L5_36 = A1_32.node_name
  L3_34 = L3_34(L4_35, L5_36)
  if L3_34 == nil then
    L4_35 = false
    return L4_35
  end
  L4_35 = A1_32.station_name
  L2_33.name = L4_35
  L2_33.hdl = L3_34
  L4_35 = A1_32.reverse
  L2_33.reverse = L4_35
  L4_35 = A1_32.ride_node_name
  if L4_35 ~= nil then
    L4_35 = A1_32.pc_ride_node_name
    if L4_35 ~= nil then
      L4_35 = findGameObject2
      L5_36 = "Node"
      L4_35 = L4_35(L5_36, A1_32.pc_ride_node_name)
      L2_33.pc_ride_node = L4_35
    end
    L4_35 = {}
    L4_35.name = "gui_marker_10"
    L4_35.ad_title_id = "\233\167\133"
    L4_35.ad_sub_id = "\227\129\136\227\129\141"
    L4_35.map_title_id = "\233\167\133"
    L4_35.map_sub_id = "\227\129\136\227\129\141"
    L4_35.giude_id = "\228\185\151\227\130\139"
    L4_35.pattern = "default"
    L4_35.map_disp = true
    L4_35.yes_func = nil
    L5_36 = type
    L5_36 = L5_36(A1_32.marker_tbl)
    if L5_36 == "table" then
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.name
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.name
        L4_35.name = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.ad_title_id
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.ad_title_id
        L4_35.ad_title_id = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.ad_sub_id
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.ad_sub_id
        L4_35.ad_sub_id = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.map_title_id
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.map_title_id
        L4_35.map_title_id = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.map_sub_id
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.map_sub_id
        L4_35.map_sub_id = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.giude_id
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.giude_id
        L4_35.giude_id = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.pattern
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.pattern
        L4_35.pattern = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.map_disp
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.map_disp
        L4_35.map_disp = L5_36
      end
      L5_36 = A1_32.marker_tbl
      L5_36 = L5_36.yes_func
      if nil ~= L5_36 then
        L5_36 = A1_32.marker_tbl
        L5_36 = L5_36.yes_func
        L2_33.yes_func = L5_36
      end
    end
    function L5_36()
      local L0_37
      L0_37 = L2_33.sensor_hdl
      L0_37 = L0_37.setActive
      L0_37(L0_37, false)
      L0_37 = A0_31
      L0_37 = L0_37._dialogueCancel
      L0_37(L0_37)
      L0_37 = Fn_userCtrlAllOff
      L0_37()
      L0_37 = Fn_blackout
      L0_37()
      L0_37 = {}
      L0_37.station_name = L2_33.name
      L0_37.pc_ride_node = A1_32.pc_ride_node_name
      A0_31:put(L0_37)
      if type(L2_33.yes_func) == "function" then
        L2_33.yes_func()
      end
      wait()
      L2_33.sensor_hdl:setActive(true)
      Fn_fadein()
      Fn_userCtrlOn()
    end
    L2_33.sensor_hdl, L2_33.ui_hdl = setupMarkerBase({
      target = A1_32.ride_node_name
    }, L4_35, L5_36)
    invokeSystemTask(function()
      L2_33.sensor_hdl:try_init()
      L2_33.ui_hdl:try_init()
      L2_33.sensor_hdl:waitForReady()
      L2_33.ui_hdl:waitForReady()
      L2_33.sensor_hdl:try_start()
      L2_33.ui_hdl:try_start()
    end)
  end
  L4_35 = A0_31.hdl
  L5_36 = L4_35
  L4_35 = L4_35.addStation
  L4_35(L5_36, L3_34:getWorldPos())
  L4_35 = table
  L4_35 = L4_35.insert
  L5_36 = A0_31.station_tbl
  L4_35(L5_36, L2_33)
  L4_35 = true
  return L4_35
end
L0_0.addStation = L1_1
L0_0 = TrainController
function L1_1(A0_38, A1_39)
  if not TrainController._isValid(A0_38) then
    return false
  end
  A0_38.req_put = {}
  for _FORV_5_, _FORV_6_ in pairs(A1_39) do
    A0_38.req_put[_FORV_5_] = _FORV_6_
  end
end
L0_0.put = L1_1
L0_0 = TrainController
function L1_1(A0_40)
  if not TrainController._isValid(A0_40) then
    return false
  end
  if A0_40.hdl == nil then
    print("WARNING : TrainController:run self.hdl = nil")
    return false
  elseif A0_40.hdl:getActive() == true then
    if A0_40.hdl:isRunning() == true then
      if A0_40.req_put ~= nil then
        A0_40:_put(A0_40.req_put)
        A0_40.req_put = nil
      else
        A0_40:_byReturn()
      end
    else
      print("WARNING : TrainController:run self.hdl:isRunning() == false")
      return false
    end
  end
end
L0_0.run = L1_1
L0_0 = TrainController
function L1_1(A0_41)
  if not TrainController._isValid(A0_41) then
    return false
  end
  if A0_41.hdl == nil then
    return false
  end
  return A0_41.hdl:isIdling()
end
L0_0.isIdling = L1_1
L0_0 = TrainController
function L1_1(A0_42)
  if not TrainController._isValid(A0_42) then
    return false
  end
  if A0_42:isIdling() == false then
    return false
  end
  if A0_42.stop_station_name == nil then
    return false
  end
  return A0_42.stop_station_name
end
L0_0.getStopStationName = L1_1
L0_0 = TrainController
function L1_1(A0_43, A1_44)
  if not TrainController._isValid(A0_43) then
    return false
  end
  for _FORV_5_, _FORV_6_ in pairs(A0_43.station_tbl) do
    if _FORV_6_.name == A1_44 then
      return _FORV_6_.sensor_hdl, _FORV_6_.ui_hdl, _FORV_6_.hdl
    end
  end
  return false
end
L0_0.getStationRideMarkerHandle = L1_1
L0_0 = TrainController
function L1_1(A0_45, A1_46, A2_47)
  if not TrainController._isValid(A0_45) then
    return false
  end
  for _FORV_6_, _FORV_7_ in pairs(A0_45.station_tbl) do
    if _FORV_7_.name == A1_46 then
      _FORV_7_.yes_func = A2_47
      break
    end
  end
end
L0_0.setStationRideMarkerHandle = L1_1
L0_0 = TrainController
function L1_1(A0_48)
  if not TrainController._isValid(A0_48) then
    return false
  end
  if A0_48.hdl ~= nil then
    A0_48.hdl:try_term()
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_48.station_tbl) do
    if _FORV_5_.sensor_hdl ~= nil then
      _FORV_5_.sensor_hdl:try_term()
    end
    if _FORV_5_.ui_hdl ~= nil then
      _FORV_5_.sensor_hdl:try_term()
    end
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_48) do
    A0_48[_FORV_4_] = nil
  end
end
L0_0.kill = L1_1
L0_0 = TrainController
function L1_1(A0_49)
  if not TrainController._isValid(A0_49) then
    return false
  end
  if A0_49.hdl == nil then
    return false
  end
  return A0_49.hdl:getCars()
end
L0_0.getCars = L1_1
L0_0 = TrainController
function L1_1(A0_50)
  if not TrainController._isValid(A0_50) then
    return false
  end
  if A0_50.hdl == nil then
    return false
  end
  return A0_50.hdl:getCars():getWorldPos(), A0_50.hdl:getCars():getWorldPos(), A0_50.hdl:getCars():getWorldPos()
end
L0_0.getEachWorldPos = L1_1
L0_0 = TrainController
function L1_1(A0_51, A1_52, A2_53)
  if not TrainController._isValid(A0_51) then
    return false
  end
  if A2_53 == nil then
    for _FORV_6_, _FORV_7_ in pairs(A0_51.station_tbl) do
      if _FORV_7_.sensor_hdl then
        if true ~= A1_52 then
          Fn_actionDialogCancel(_FORV_7_.sensor_hdl:getName())
        end
        _FORV_7_.sensor_hdl:setActive(A1_52)
        _FORV_7_.ui_hdl:setActive(A1_52)
        _FORV_7_.sensor_hdl:setVisible(A1_52)
        _FORV_7_.ui_hdl:setVisible(A1_52)
      end
    end
  else
    for _FORV_6_, _FORV_7_ in pairs(A0_51.station_tbl) do
      if A2_53 == _FORV_7_.name then
        if _FORV_7_.sensor_hdl then
          if true ~= A1_52 then
            Fn_actionDialogCancel(_FORV_7_.sensor_hdl:getName())
          end
          _FORV_7_.sensor_hdl:setActive(A1_52)
          _FORV_7_.ui_hdl:setActive(A1_52)
          _FORV_7_.sensor_hdl:setVisible(A1_52)
          _FORV_7_.ui_hdl:setVisible(A1_52)
        end
        break
      end
    end
  end
end
L0_0.setStationActive = L1_1
L0_0 = TrainController
function L1_1(A0_54)
  if A0_54.hdl:isIdling() == true then
    if A0_54.stop_station_name == nil then
      for _FORV_4_ = 1, #A0_54.station_tbl do
        station_record = A0_54.station_tbl[_FORV_4_]
        if Fn_get_distance(A0_54.hdl:getWorldPos(), station_record.hdl:getWorldPos()) <= TrainController.STATION_SPEHER_RADIUS then
          A0_54.stop_station_name = station_record.name
          if station_record.reverse == true then
            if A0_54.now_reverse == true then
              A0_54.now_reverse = false
            else
              A0_54.now_reverse = true
            end
            A0_54.hdl:setReverse(A0_54.now_reverse)
            break
          end
        end
      end
    end
  elseif A0_54.hdl:getSpeed() > 0 then
    A0_54.stop_station_name = nil
  end
end
L0_0._byReturn = L1_1
L0_0 = TrainController
function L1_1(A0_55, A1_56)
  local L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63
  L2_57 = TrainController
  L2_57 = L2_57._isValid
  L3_58 = A0_55
  L2_57 = L2_57(L3_58)
  if not L2_57 then
    L2_57 = false
    return L2_57
  end
  L2_57 = A1_56.station_name
  L3_58 = A1_56.pc_ride_node
  L4_59 = A1_56.stay_time
  L5_60 = A1_56.reverse
  if L2_57 ~= nil then
    L6_61, L7_62 = nil, nil
    for _FORV_11_ = 1, #A0_55.station_tbl do
      if A0_55.station_tbl[_FORV_11_].name == L2_57 then
        L6_61 = _FORV_11_
        L7_62 = A0_55.station_tbl[_FORV_11_].hdl
        break
      end
    end
    if L7_62 == nil then
      L7_62 = L8_63
    end
    if L7_62 ~= nil then
      A0_55.stop_station_name = L2_57
      if L8_63 == "boolean" then
        A0_55.now_reverse = L5_60
      elseif L6_61 == nil then
        A0_55.now_reverse = L8_63
      elseif L6_61 == 1 then
        A0_55.now_reverse = L8_63
      elseif L8_63 == true then
        if L8_63 == true then
          A0_55.now_reverse = false
        else
          A0_55.now_reverse = true
        end
      else
        A0_55.now_reverse = L8_63
      end
      L8_63(L8_63, L7_62:getWorldPos())
      L8_63(L8_63, 0)
      L8_63(L8_63, A0_55.now_reverse)
      if L3_58 ~= nil then
        L8_63(L3_58)
      end
      A0_55.forced_idle = true
      A0_55.hdl:setForcedIdle(A0_55.forced_idle)
      if L8_63 >= 0 then
        invokeTask(function()
          waitSeconds(L8_63)
          A0_55.forced_idle = false
          A0_55.hdl:setForcedIdle(A0_55.forced_idle)
        end)
      end
    end
  else
  end
end
L0_0._put = L1_1
L0_0 = TrainController
function L1_1(A0_64)
  if not TrainController._isValid(A0_64) then
    return false
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_64.station_tbl) do
    if _FORV_5_.sensor_hdl then
      Fn_actionDialogCancel(_FORV_5_.sensor_hdl:getName())
    end
  end
end
L0_0._dialogueCancel = L1_1
L0_0 = TrainController
function L1_1(A0_65)
  local L1_66
  if A0_65 == nil then
    L1_66 = false
    return L1_66
  end
  L1_66 = true
  return L1_66
end
L0_0._isValid = L1_1
L0_0 = TrainController
function L1_1(A0_67)
  local L1_68, L2_69, L3_70, L4_71, L5_72
  for L4_71, L5_72 in L1_68(L2_69) do
    if type(L5_72) == "function" then
      A0_67[L4_71] = L5_72
    end
  end
end
L0_0._installMethods = L1_1
