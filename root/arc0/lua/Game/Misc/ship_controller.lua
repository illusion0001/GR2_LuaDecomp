import("EventData")
import("Time")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
ShipCtrl = {}
function ShipCtrl.create(A0_0, A1_1)
  local L2_2
  L2_2 = {}
  L2_2.cs_mng = A0_0
  L2_2.mi_mng = A1_1
  L2_2.ship_name = nil
  L2_2.ship_hdl = nil
  L2_2.ship_col = nil
  L2_2.lever = nil
  L2_2.rudder = nil
  L2_2.engine = nil
  L2_2.mizai = nil
  L2_2.crane_op = nil
  L2_2.rudder_op = nil
  L2_2.gawan_task = nil
  L2_2.evb_move = nil
  L2_2.evb_setup = nil
  L2_2.route = nil
  L2_2.node_list = {}
  L2_2.warp_task = nil
  L2_2.shake_main_task = nil
  L2_2.shake_sub_task = nil
  L2_2.shake_rnd_task = nil
  L2_2.pause_task = nil
  L2_2.lever_caption = nil
  L2_2.lever_voice = nil
  L2_2.rudder_voice = nil
  L2_2.se_move = nil
  L2_2.se_wind = nil
  L2_2.se_engine = nil
  L2_2.marker_tgt = nil
  L2_2.ad_title_id = nil
  L2_2.map_title_id = nil
  L2_2.sensor_hdl = nil
  L2_2.marker_hdl = nil
  L2_2.ship_out_sensor_hdl = nil
  L2_2.is_signal = false
  L2_2.is_departure = false
  L2_2.is_rp = false
  L2_2.is_rp_ready = false
  L2_2.is_rp_finish = false
  L2_2.is_digout = false
  L2_2.is_move = false
  L2_2.is_move_skip = false
  L2_2.in_outrange = true
  L2_2.is_loading = false
  L2_2.is_skip = false
  L2_2.select_rp = false
  ShipCtrl._installMethods(L2_2)
  return L2_2
end
function ShipCtrl.reset(A0_3)
  A0_3:debugPrint("\230\142\161\230\142\152\232\136\185\227\129\174\230\131\133\229\160\177\227\131\170\227\130\187\227\131\131\227\131\136")
  A0_3.warp_task = A0_3:_aboutTask(A0_3.warp_task)
  A0_3.gawan_task = A0_3:_aboutTask(A0_3.gawan_task)
  A0_3.shake_main_task = A0_3:_aboutTask(A0_3.shake_main_task)
  A0_3.shake_sub_task = A0_3:_aboutTask(A0_3.shake_sub_task)
  A0_3.shake_rnd_task = A0_3:_aboutTask(A0_3.shake_rnd_task)
  A0_3.pause_task = A0_3:_aboutTask(A0_3.pause_task)
  A0_3.se_move = A0_3:_stopSE(A0_3.se_move)
  A0_3.se_wind = A0_3:_stopSE(A0_3.se_wind)
  A0_3.se_engine = A0_3:_stopSE(A0_3.se_engine)
  A0_3.engine = nil
  A0_3.sensor_hdl = A0_3:_termGameObj(A0_3.sensor_hdl)
  A0_3.marker_hdl = A0_3:_termGameObj(A0_3.marker_hdl)
  A0_3.ship_out_sensor_hdl = A0_3:_termGameObj(A0_3.ship_out_sensor_hdl)
  A0_3.evb_move = A0_3:_termGameObj(A0_3.evb_move)
  A0_3.evb_setup = A0_3:_termGameObj(A0_3.evb_setup)
  A0_3.node_list = {}
  if not GameDatabase:get(ggd.GlobalSystemFlags__GameRetry) then
    A0_3:_releaseShipHandle()
  else
    A0_3:debugPrint("\227\131\170\227\131\136\227\131\169\227\130\164\227\129\149\227\130\140\227\130\139\227\129\168NPC\227\129\140\229\137\138\233\153\164\227\129\149\227\130\140\227\130\139\227\129\174\227\129\167\227\128\129\227\131\170\227\130\187\227\131\131\227\131\136\227\129\149\227\130\140\227\130\139\227\129\145\227\129\169\227\128\129\232\136\185\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\175\232\167\163\230\148\190\227\129\151\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\229\175\190\229\135\166")
  end
  A0_3:_releaseCrewHandle()
  A0_3.lever_caption = nil
  A0_3.lever_voice = nil
  A0_3.rudder_voice = nil
  A0_3.is_signal = false
  A0_3.is_departure = false
  A0_3.is_rp = false
  A0_3.is_rp_ready = false
  A0_3.is_rp_finish = false
  A0_3.is_digout = false
  A0_3.is_loading = false
  A0_3.is_skip = false
  in_outrange = true
  __marker_set = {}
end
function ShipCtrl.waitAvailable(A0_4)
  if not ShipCtrl._isValid(A0_4) then
    return false
  end
  while not A0_4.ship_hdl do
    wait()
  end
end
function ShipCtrl.setObjectHandle(A0_5, A1_6, A2_7, A3_8, A4_9)
  if not ShipCtrl._isValid(A0_5) then
    return false
  end
  A0_5.ship_name = A1_6:getName()
  A0_5.ship_hdl = A1_6
  A0_5.ship_col = A2_7
  A0_5.rudder = A3_8
  A0_5.lever = A4_9
end
function ShipCtrl.setMineStrom(A0_10, A1_11)
  if not ShipCtrl._isValid(A0_10) then
    return false
  end
  if A1_11 == 1 then
    A0_10.is_digout = false
    A0_10:_createDestinationMarker(true)
    A0_10.shake_rnd_task = A0_10:_cameraShakeRnd()
  elseif A1_11 == 2 then
    A0_10.is_digout = true
    A0_10:_createDestinationMarker(false)
    A0_10:setCrewActive(true)
    if A0_10.is_skip then
      A0_10:warpCrew(2)
    else
      A0_10:warpCrew()
    end
    A0_10.is_skip = false
  elseif A1_11 == 3 then
    A0_10.is_digout = true
    A0_10.sensor_hdl = A0_10:_termGameObj(A0_10.sensor_hdl)
    A0_10.marker_hdl = A0_10:_termGameObj(A0_10.marker_hdl)
    A0_10:_createDestinationMarker(false)
    A0_10:setCrewActive(true)
    A0_10:resetCrew()
    A0_10:stormCameraShakeOn()
  end
end
function ShipCtrl.standby(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17
  L1_13 = ShipCtrl
  L1_13 = L1_13._isValid
  L2_14 = A0_12
  L1_13 = L1_13(L2_14)
  if not L1_13 then
    L1_13 = false
    return L1_13
  end
  L1_13 = A0_12.evb_setup
  if L1_13 == nil then
    L1_13 = A0_12.ship_name
    if L1_13 == "ve_crane_root" then
      L2_14 = A0_12
      L1_13 = A0_12._createEvb
      L3_15 = "mine_po_setup"
      L1_13 = L1_13(L2_14, L3_15)
      A0_12.evb_setup = L1_13
      A0_12.ad_title_id = "ui_acdialog_main_loc02"
      A0_12.map_title_id = "ui_map_msinfo_main_loc02"
    else
      L2_14 = A0_12
      L1_13 = A0_12._createEvb
      L3_15 = "mine_hx_setup"
      L1_13 = L1_13(L2_14, L3_15)
      A0_12.evb_setup = L1_13
      A0_12.ad_title_id = "ui_acdialog_main_loc03"
      A0_12.map_title_id = "ui_map_msinfo_main_loc03"
    end
  end
  L1_13 = findGameObject2
  L2_14 = "Node"
  L3_15 = "locator2_engine"
  L1_13 = L1_13(L2_14, L3_15)
  A0_12.engine = L1_13
  L2_14 = A0_12
  L1_13 = A0_12.setupCrew
  L3_15 = false
  L1_13 = L1_13(L2_14, L3_15)
  L2_14 = L1_13.miz01
  if L2_14 then
    L2_14 = L1_13.miz01
    L3_15 = L2_14
    L2_14 = L2_14.isStopped
    L2_14 = L2_14(L3_15)
    if not L2_14 then
      L2_14 = L1_13.miz01
      A0_12.mizai = L2_14
      L2_14 = L1_13.miz01
      A0_12.marker_tgt = L2_14
      A0_12.lever_caption = "ic_crane_00100"
      A0_12.lever_voice = "mis005b_1"
      A0_12.is_signal = true
    end
  end
  L2_14 = L1_13.driver
  if L2_14 then
    L2_14 = L1_13.driver
    L3_15 = L2_14
    L2_14 = L2_14.isStopped
    L2_14 = L2_14(L3_15)
    if not L2_14 then
      L2_14 = L1_13.driver
      A0_12.rudder_op = L2_14
    end
  end
  L2_14 = L1_13.worker
  if L2_14 then
    L2_14 = L1_13.worker
    L3_15 = L2_14
    L2_14 = L2_14.isStopped
    L2_14 = L2_14(L3_15)
    if not L2_14 then
      L2_14 = L1_13.worker
      A0_12.crane_op = L2_14
    end
  end
  L2_14 = L1_13.man73
  if L2_14 then
    L2_14 = L1_13.man73
    L3_15 = L2_14
    L2_14 = L2_14.isStopped
    L2_14 = L2_14(L3_15)
    if not L2_14 then
      A0_12.mizai = nil
      L2_14 = L1_13.man73
      A0_12.crane_op = L2_14
      L2_14 = L1_13.man73
      A0_12.rudder_op = L2_14
      L2_14 = L1_13.man73
      A0_12.marker_tgt = L2_14
      A0_12.lever_caption = "ic_crane_00110"
      A0_12.lever_voice = "m31_909a"
      A0_12.rudder_voice = "m31_901b"
    end
  end
  L2_14 = A0_12.ship_name
  L3_15 = "_out_sensor"
  L2_14 = L2_14 .. L3_15
  L3_15 = L2_14
  L4_16 = "_OnEnter"
  L3_15 = L3_15 .. L4_16
  L4_16 = L2_14
  L5_17 = "_OnLeave"
  L4_16 = L4_16 .. L5_17
  L5_17 = _G
  L5_17[L3_15] = function()
    local L0_18, L1_19
    A0_12.in_outrange = true
  end
  L5_17 = _G
  L5_17[L4_16] = function()
    local L0_20, L1_21
    A0_12.in_outrange = false
  end
  L5_17 = createGameObject2
  L5_17 = L5_17("PlayerSensor")
  L5_17:setName(L2_14)
  L5_17:setDetectBehavior(1)
  if A0_12.ship_name == "ve_crane_root" then
    L5_17:addBox(Vector(25, 30, 40))
    L5_17:setPos(Vector(0, 0, 3))
  else
    L5_17:addBox(Vector(15, 15, 15))
    L5_17:setPos(Vector(2, 3, 1))
  end
  L5_17:setOnEnter(L3_15)
  L5_17:setOnLeave(L4_16)
  A0_12.ship_hdl:appendChild(L5_17)
  L5_17:setActive(false)
  L5_17:try_init()
  L5_17:waitForReady()
  L5_17:try_start()
  A0_12.ship_out_sensor_hdl = L5_17
end
function ShipCtrl.isCrew(A0_22)
  if not ShipCtrl._isValid(A0_22) then
    return false
  end
  return A0_22.crane_op and true or false
end
function ShipCtrl.setCrewActive(A0_23, A1_24)
  if not ShipCtrl._isValid(A0_23) then
    return false
  end
  if A0_23.mizai then
    A0_23.mizai:setActive(A1_24)
    A0_23.is_signal = A1_24
    A0_23:debugPrint("\227\131\159\227\130\182\227\130\164\227\129\174active\227\130\146" .. tostring(A1_24) .. "\227\129\171\227\129\151\227\129\190\227\129\153")
  else
    A0_23.is_signal = false
  end
  if A0_23.crane_op then
    A0_23.crane_op:setActive(A1_24)
    A0_23:debugPrint("\227\130\175\227\131\172\227\131\188\227\131\179\230\147\141\228\189\156\232\128\133\227\129\174active\227\130\146" .. tostring(A1_24) .. "\227\129\171\227\129\151\227\129\190\227\129\153")
  end
  if A0_23.rudder_op then
    A0_23.rudder_op:setActive(A1_24)
    A0_23:debugPrint("\230\142\161\230\142\152\232\136\185\230\147\141\228\189\156\232\128\133\227\129\174active\227\130\146" .. tostring(A1_24) .. "\227\129\171\227\129\151\227\129\190\227\129\153")
  end
end
function ShipCtrl.setupCrew(A0_25, A1_26)
  local L2_27
  L2_27 = ShipCtrl
  L2_27 = L2_27._isValid
  L2_27 = L2_27(A0_25)
  if not L2_27 then
    L2_27 = false
    return L2_27
  end
  L2_27 = setAttachSandbox
  L2_27("npcManager")
  L2_27 = {}
  if A0_25.ship_name == "ve_crane_root" then
    L2_27 = {
      {
        type = "miz01",
        node = "locator2_miz01_01",
        name = "miz01",
        reset = A1_26,
        start = true
      },
      {
        type = "man34",
        node = "locator2_man34_01",
        name = "driver",
        reset = A1_26,
        start = true,
        disable_collision = true
      },
      {
        type = "man36",
        node = "locator2_man36_02",
        name = "worker",
        reset = A1_26,
        start = true,
        disable_collision = true,
        anim_name = "crane"
      }
    }
  else
    L2_27 = {
      {
        type = "man73",
        node = "locator2_man73_01",
        name = "man73",
        reset = A1_26,
        start = true,
        not_mob = true
      }
    }
  end
  if A0_25.ship_name == "ve_crane_root" and A0_25.crane_op then
    A0_25.crane_op:ignoreStoop()
  end
  return (Fn_setupNpc(L2_27))
end
function ShipCtrl.resetCrew(A0_28)
  if not ShipCtrl._isValid(A0_28) then
    return false
  end
  A0_28:setupCrew(true)
end
function ShipCtrl.warpCrew(A0_29, A1_30)
  local L2_31
  L2_31 = ShipCtrl
  L2_31 = L2_31._isValid
  L2_31 = L2_31(A0_29)
  if not L2_31 then
    L2_31 = false
    return L2_31
  end
  L2_31 = A0_29.mizai
  if L2_31 ~= nil then
    if A1_30 == 3 then
      L2_31 = findGameObject2
      L2_31 = L2_31("Node", "locator2_man36_01")
      if L2_31 then
        A0_29.crane_op:warp(L2_31, "sit_01")
      end
    end
  else
    L2_31 = A0_29.marker_tgt
    if L2_31 then
      L2_31 = A0_29.marker_tgt
      L2_31 = L2_31.getActive
      L2_31 = L2_31(L2_31)
      if L2_31 then
        if A1_30 == 2 then
          L2_31 = findGameObject2
          L2_31 = L2_31("Node", "locator2_man73_pos_02")
          if L2_31 then
            A0_29.marker_tgt:warp(L2_31)
            A0_29.lever:playPoseAnimation("up_00")
          end
        elseif A1_30 == 3 then
          L2_31 = findGameObject2
          L2_31 = L2_31("Node", "locator2_man73_pos_01")
          if L2_31 then
            A0_29.marker_tgt:warp(L2_31, "rudder")
            A0_29.rudder:playPoseAnimation("rudder")
          end
        else
          L2_31 = findGameObject2
          L2_31 = L2_31("Node", "locator2_man73_pos_01")
          if L2_31 then
            A0_29.marker_tgt:warp(L2_31, "lever_00")
            A0_29.lever:playPoseAnimation("stay_00")
          end
        end
      end
    end
  end
end
function ShipCtrl.departure(A0_32, A1_33, A2_34)
  local L3_35, L4_36, L5_37
  L3_35 = ShipCtrl
  L3_35 = L3_35._isValid
  L4_36 = A0_32
  L3_35 = L3_35(L4_36)
  if not L3_35 then
    L3_35 = false
    return L3_35
  end
  L3_35 = GameDatabase
  L4_36 = L3_35
  L3_35 = L3_35.set
  L5_37 = ggd
  L5_37 = L5_37.Savedata__EventManageFlags__OutrangeLock
  L3_35(L4_36, L5_37, true)
  L3_35 = GameDatabase
  L4_36 = L3_35
  L3_35 = L3_35.set
  L5_37 = ggd
  L5_37 = L5_37.Menu__IsDisableNewsPopup
  L3_35(L4_36, L5_37, true)
  L3_35 = HUD
  L4_36 = L3_35
  L3_35 = L3_35.setUserControlLock
  L5_37 = true
  L3_35(L4_36, L5_37)
  L4_36 = A0_32
  L3_35 = A0_32._invisibleColltion
  L5_37 = true
  L3_35(L4_36, L5_37)
  L3_35 = A0_32.ship_out_sensor_hdl
  if L3_35 ~= nil then
    L3_35 = A0_32.ship_out_sensor_hdl
    L4_36 = L3_35
    L3_35 = L3_35.setActive
    L5_37 = true
    L3_35(L4_36, L5_37)
  end
  L3_35 = Area
  L4_36 = L3_35
  L3_35 = L3_35.getMoveEnable
  L3_35 = L3_35(L4_36)
  L4_36 = Area
  L5_37 = L4_36
  L4_36 = L4_36.setMoveEnable
  L4_36(L5_37, true)
  A0_32.is_departure = true
  A0_32.is_rp = false
  L4_36 = "ve_crane_bu_to_storm"
  L5_37 = A0_32.route
  if L5_37 == "mine_po" then
    L4_36 = "ve_crane_po_to_storm"
  else
    L5_37 = A0_32.route
    if L5_37 == "mine_hx" then
      L4_36 = "ve_crane_hx_to_storm"
    else
      L5_37 = A0_32.route
      if L5_37 == "storm_to_storm" then
        L4_36 = "ve_crane_storm_to_storm"
      end
    end
  end
  L5_37 = A0_32._createEvb
  L5_37 = L5_37(A0_32, L4_36)
  A0_32.evb_move = L5_37
  L5_37 = A0_32._signal
  L5_37(A0_32, A0_32.rudder_op)
  L5_37 = A0_32._turn
  L5_37(A0_32)
  L5_37 = A0_32._rudderOperation
  L5_37(A0_32)
  L5_37 = A0_32._findNode
  L5_37(A0_32)
  L5_37 = A0_32._arrivalTask
  L5_37 = L5_37(A0_32)
  A0_32:_inGamePauseMenuOn(2)
  A0_32:_move()
  Fn_userCtrlOff()
  A0_32.is_departure = false
  A0_32:_inGamePauseMenuOff()
  A0_32.ship_out_sensor_hdl = A0_32:_termGameObj(A0_32.ship_out_sensor_hdl)
  L5_37 = A0_32:_aboutTask(L5_37)
  Area:setMoveEnable(L3_35)
  A0_32.engine = nil
  A0_32.evb_move = A0_32:_termGameObj(A0_32.evb_move)
  A0_32.evb_setup = A0_32:_termGameObj(A0_32.evb_setup)
  A0_32.node_list = {}
  A0_32:_releaseCrewHandle()
  __npc_list = {}
  A0_32:_invisibleColltion(false)
  GameDatabase:set(ggd.Menu__IsDisableNewsPopup, false)
  A0_32:_requestSetNextMissionName(A1_33, A2_34)
end
function ShipCtrl.setRoute(A0_38, A1_39)
  if not ShipCtrl._isValid(A0_38) then
    return false
  end
  if A1_39 then
    A0_38.route = A1_39
  end
end
function ShipCtrl.setDestinationId(A0_40, A1_41)
  if not ShipCtrl._isValid(A0_40) then
    return false
  end
  GameDatabase:set(ggd.Savedata__CreneShipFlags__MineId, A1_41)
end
function ShipCtrl.isDeparture(A0_42)
  if not ShipCtrl._isValid(A0_42) then
    return false
  end
  return A0_42.is_departure
end
function ShipCtrl.readyReturnToPort(A0_43)
  local L1_44
  L1_44 = ShipCtrl
  L1_44 = L1_44._isValid
  L1_44 = L1_44(A0_43)
  if not L1_44 then
    L1_44 = false
    return L1_44
  end
  A0_43.is_rp_ready = false
  A0_43.is_rp_finish = false
  L1_44 = "ve_crane_storm_to_bu"
  if A0_43.ship_name == "ve_crane_root" then
    if GameDatabase:get(ggd.Savedata__EventManageFlags__ClearEpisodeNum) >= 5 then
      L1_44 = "ve_crane_storm_to_po"
    end
  else
    L1_44 = "ve_crane_storm_to_hx"
  end
  A0_43.evb_move = A0_43:_createEvb(L1_44)
  if findGameObject2("Node", "locator2_route_start") then
    A0_43.ship_hdl:setWorldTransform(findGameObject2("Node", "locator2_route_start"):getWorldTransform())
    A0_43.ship_hdl:setForceMove()
    A0_43.is_rp_ready = true
    A0_43:debugPrint("\230\142\161\230\142\152\232\136\185\227\129\174\228\189\141\231\189\174\227\130\146\229\164\137\230\155\180\227\129\151\227\129\190\227\129\151\227\129\159")
    if L1_44 == "ve_crane_storm_to_po" then
      Area:getWorldRoot():setRot(XYZRotQuatD(0, -26.457178, 0))
      Area:getWorldRoot():setForceMove()
      A0_43:debugPrint("ve_crane_storm_to_po\227\129\174\229\184\176\230\184\175\227\129\174\231\130\186\227\129\171AreaRoot\227\130\146\229\155\158\232\187\162\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
    elseif L1_44 == "ve_crane_storm_to_hx" then
      Area:getWorldRoot():setRot(XYZRotQuatD(0, 46.069599, 0))
      Area:getWorldRoot():setForceMove()
      A0_43:debugPrint("ve_crane_storm_to_hx\227\129\174\229\184\176\230\184\175\227\129\174\231\130\186\227\129\171AreaRoot\227\130\146\229\155\158\232\187\162\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
    elseif L1_44 == "ve_crane_storm_to_bu" then
      Area:getWorldRoot():setRot(XYZRotQuatD(0, 16.383686, 0))
      Area:getWorldRoot():setForceMove()
      A0_43:debugPrint("ve_crane_storm_to_bu\227\129\174\229\184\176\230\184\175\227\129\174\231\130\186\227\129\171AreaRoot\227\130\146\229\155\158\232\187\162\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
    else
      A0_43:debugPrint("\229\184\176\230\184\175\227\129\174evb\227\130\146\232\170\173\227\129\191\232\190\188\227\130\147\227\129\167\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167AreaRoot\227\129\174\229\155\158\232\187\162\227\129\175\229\164\137\230\155\180\227\129\151\227\129\190\227\129\155\227\130\147")
    end
  else
    A0_43:debugPrint("\227\131\175\227\131\188\227\131\151\229\133\136\227\129\174\227\131\142\227\131\188\227\131\137\227\129\140\231\132\161\227\129\132\227\129\174\227\129\167\227\128\129\229\184\176\230\184\175\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
  end
end
function ShipCtrl.returnToPort(A0_45)
  local L1_46, L2_47
  L1_46 = ShipCtrl
  L1_46 = L1_46._isValid
  L2_47 = A0_45
  L1_46 = L1_46(L2_47)
  if not L1_46 then
    L1_46 = false
    return L1_46
  end
  L1_46 = GameDatabase
  L2_47 = L1_46
  L1_46 = L1_46.set
  L1_46(L2_47, ggd.Menu__IsDisableNewsPopup, true)
  L1_46 = HUD
  L2_47 = L1_46
  L1_46 = L1_46.setUserControlLock
  L1_46(L2_47, true)
  A0_45.is_rp = true
  A0_45.is_rp_ready = false
  A0_45.is_rp_finish = false
  L2_47 = A0_45
  L1_46 = A0_45.warpCrew
  L1_46(L2_47, 3)
  L1_46 = _accessIndicatorBegin
  L1_46()
  while true do
    L1_46 = Area
    L2_47 = L1_46
    L1_46 = L1_46.isLoading
    L1_46 = L1_46(L2_47)
    if L1_46 then
      L1_46 = wait
      L1_46()
    end
  end
  L1_46 = _accessIndicatorEnd
  L1_46()
  L1_46 = Area
  L2_47 = L1_46
  L1_46 = L1_46.getMoveEnable
  L1_46 = L1_46(L2_47)
  L2_47 = Area
  L2_47 = L2_47.setMoveEnable
  L2_47(L2_47, true)
  L2_47 = A0_45._invisibleColltion
  L2_47(A0_45, true)
  L2_47 = A0_45.ship_out_sensor_hdl
  if L2_47 ~= nil then
    L2_47 = A0_45.ship_out_sensor_hdl
    L2_47 = L2_47.setActive
    L2_47(L2_47, true)
  end
  L2_47 = A0_45.rudder_op
  if L2_47 ~= nil then
    L2_47 = A0_45.rudder_op
    L2_47 = L2_47.setActive
    L2_47(L2_47, true)
  end
  A0_45.rudder_voice = false
  L2_47 = A0_45._rudderOperation
  L2_47(A0_45)
  L2_47 = A0_45._fadeinTask
  L2_47 = L2_47(A0_45)
  A0_45:_findNode()
  A0_45:_inGamePauseMenuOn(2)
  A0_45:_move(false)
  A0_45:_inGamePauseMenuOff()
  print(tostring(Area:getWorldRoot():getRot()))
  A0_45.ship_out_sensor_hdl = A0_45:_termGameObj(A0_45.ship_out_sensor_hdl)
  Area:setMoveEnable(L1_46)
  A0_45:_rudderOperation(true)
  L2_47 = A0_45:_aboutTask(L2_47)
  A0_45.evb_move = A0_45:_termGameObj(A0_45.evb_move)
  while A0_45.is_loading do
    wait()
  end
  A0_45.gawan_task = invokeTask(function()
    local L0_48
    L0_48 = Fn_findNpc
    L0_48 = L0_48("driver")
    while true do
      if L0_48 ~= nil then
        if Fn_isValidNpc(L0_48) == false then
          L0_48:setActive(false)
          break
        end
      end
      waitSeconds(1)
    end
  end)
  A0_45:_invisibleColltion(false)
  Fn_fadein()
  Fn_userCtrlOn()
  GameDatabase:set(ggd.Menu__IsDisableNewsPopup, false)
  A0_45.is_rp = false
  A0_45.is_rp_finish = true
  A0_45.rudder_voice = true
end
function ShipCtrl.isReadyReturnToPort(A0_49)
  if not ShipCtrl._isValid(A0_49) then
    return false
  end
  return A0_49.is_rp_ready
end
function ShipCtrl.isReturnToPortFinish(A0_50)
  if not ShipCtrl._isValid(A0_50) then
    return false
  end
  return A0_50.is_rp_finish
end
function ShipCtrl.setShowDigoutResult(A0_51, A1_52)
  if not ShipCtrl._isValid(A0_51) then
    return false
  end
  A0_51.is_digout = A1_52
end
function ShipCtrl.showDigoutResult(A0_53)
  if not ShipCtrl._isValid(A0_53) then
    return false
  end
  if A0_53.is_digout then
    A0_53.mi_mng:sendEvent("viewOreToTalisman")
  end
  A0_53.is_digout = false
end
function ShipCtrl.markerInOut(A0_54, A1_55, A2_56)
  if not ShipCtrl._isValid(A0_54) then
    return false
  end
  if A0_54.marker_hdl then
    if A1_55 then
      if A0_54.sensor_hdl then
        A0_54.sensor_hdl:setActive(true)
      end
      if A0_54.marker_hdl then
        A0_54.marker_hdl:playIn()
      end
    else
      if A0_54.sensor_hdl then
        A0_54.sensor_hdl:setActive(false)
      end
      if A0_54.marker_hdl then
        A0_54.marker_hdl:playOut()
        if A2_56 ~= false then
          repeat
            wait()
          until A0_54.marker_hdl:isOutEnd()
        end
      end
    end
  end
end
function ShipCtrl._isValid(A0_57)
  local L1_58
  if A0_57 == nil then
    L1_58 = false
    return L1_58
  end
  L1_58 = true
  return L1_58
end
function ShipCtrl._installMethods(A0_59)
  local L1_60, L2_61, L3_62, L4_63, L5_64
  for L4_63, L5_64 in L1_60(L2_61) do
    if type(L5_64) == "function" then
      A0_59[L4_63] = L5_64
    end
  end
end
function ShipCtrl._createEvb(A0_65, A1_66)
  local L2_67
  L2_67 = nil
  if A1_66 then
    if loadFileAsset("evb", "evx/" .. A1_66) then
      loadFileAsset("evb", "evx/" .. A1_66):wait()
      L2_67 = EventData:create(A1_66, nil, loadFileAsset("evb", "evx/" .. A1_66):getRoot())
      L2_67:try_init()
      L2_67:waitForReady()
      L2_67:try_start()
    else
      A0_65:debugPrint(A1_66 .. ".evb Not Found.")
    end
  end
  return L2_67
end
function ShipCtrl._findNode(A0_68)
  local L1_69
  L1_69 = {}
  A0_68.node_list = L1_69
  L1_69 = 1
  while findGameObject2("Node", "locator2_route_" .. string.format("%02d", L1_69)) do
    A0_68.node_list[L1_69] = findGameObject2("Node", "locator2_route_" .. string.format("%02d", L1_69))
    do break end
    do break end
    L1_69 = L1_69 + 1
  end
  A0_68:debugPrint(string.format("There is %d ship route locators.", #A0_68.node_list))
end
function ShipCtrl._termGameObj(A0_70, A1_71)
  if A1_71 then
    A1_71:try_term()
  end
  return nil
end
function ShipCtrl._stopSE(A0_72, A1_73)
  if A1_73 then
    Sound:stopSEHandle(A1_73)
  end
  return nil
end
function ShipCtrl._aboutTask(A0_74, A1_75)
  if A1_75 and A1_75:isRunning() then
    A1_75:abort()
  end
  return nil
end
function ShipCtrl._releaseShipHandle(A0_76)
  local L1_77
  A0_76.ship_hdl = nil
  A0_76.ship_col = nil
  A0_76.rudder = nil
  A0_76.lever = nil
end
function ShipCtrl._releaseCrewHandle(A0_78)
  A0_78.mizai = nil
  A0_78.crane_op = nil
  A0_78.rudder_op = nil
  A0_78.marker_tgt = nil
  A0_78:debugPrint("\228\185\151\231\181\132\229\147\161\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\174\232\167\163\230\148\190")
end
function ShipCtrl._signal(A0_79, A1_80)
  local L2_81
  L2_81 = A0_79.mizai
  if L2_81 then
    L2_81 = A0_79.is_signal
    if L2_81 then
      L2_81 = A1_80.getPuppet
      L2_81 = L2_81(A1_80)
      if A0_79.mizai:getActive() then
        A0_79.mizai:turn(L2_81:getWorldPos())
        repeat
          wait()
        until A0_79.mizai:isTurnEnd()
      end
      Sound:playSE("mis001b", 0.7, "", A0_79.mizai:getPuppet())
      A0_79.mizai:playMotion("greeting")
      repeat
        wait()
      until A0_79.mizai:isMotionEnd()
      A0_79.mizai:playMotion("stay")
      Sound:playSE("mma003b", 0.7, "", L2_81)
    end
  end
end
function ShipCtrl._turn(A0_82)
  if A0_82.mizai == nil and A0_82.marker_tgt and A0_82.marker_tgt:getActive() then
    Fn_turnNpc(A0_82.marker_tgt, "locator2_man73_turn_pos_01", nil, true)
  end
end
function ShipCtrl._rudderOperation(A0_83, A1_84)
  local L2_85
  L2_85 = A0_83.rudder_op
  if L2_85 then
    L2_85 = A0_83.rudder_op
    L2_85 = L2_85.getActive
    L2_85 = L2_85(L2_85)
    if L2_85 then
      if A1_84 then
        L2_85 = A0_83.rudder
        L2_85 = L2_85.playPoseAnimation
        L2_85(L2_85, "stay")
        L2_85 = A0_83.rudder_op
        if L2_85 == A0_83.crane_op then
          L2_85 = A0_83.rudder_op
          L2_85 = L2_85.getActive
          L2_85 = L2_85(L2_85)
          if L2_85 then
            L2_85 = Fn_playMotionNpc
            L2_85(A0_83.rudder_op, "rudder_out_00")
            L2_85 = Fn_turnNpc
            L2_85(A0_83.crane_op, "locator2_man73_turn_pos_02")
            L2_85 = {}
            L2_85.degree_h = 12
            L2_85.degree_v = 30
            L2_85.in_length = 5
            L2_85.out_length = 7
            L2_85.valid = true
            L2_85.target = nil
            L2_85.targetJoint = "bn_head"
            L2_85.forceTarget = true
            L2_85.watchTarget = true
            A0_83.crane_op:setSightParam(L2_85)
          end
        end
        L2_85 = A0_83.mizai
        if L2_85 == nil then
          L2_85 = A0_83.marker_tgt
          if L2_85 then
            L2_85 = A0_83.marker_tgt
            L2_85 = L2_85.getActive
            L2_85 = L2_85(L2_85)
            if L2_85 then
            end
          end
        else
          L2_85 = Fn_playMotionNpc
          L2_85(A0_83.rudder_op, "stay", false)
        end
      else
        L2_85 = A0_83.rudder_op
        if L2_85 == A0_83.crane_op then
          L2_85 = A0_83.rudder_op
          L2_85 = L2_85.getActive
          L2_85 = L2_85(L2_85)
          if L2_85 then
            L2_85 = Fn_playMotionNpc
            L2_85(A0_83.rudder_op, "rudder_in_00")
          end
        end
        L2_85 = A0_83.rudder
        L2_85 = L2_85.playPoseAnimation
        L2_85(L2_85, "rudder")
        L2_85 = A0_83.rudder_voice
        if L2_85 then
          L2_85 = Sound
          L2_85 = L2_85.playSE
          L2_85(L2_85, A0_83.rudder_voice, 0.7, "", A0_83.marker_tgt)
        end
        L2_85 = Fn_playMotionNpc
        L2_85(A0_83.rudder_op, "rudder", false)
      end
    end
  end
end
function ShipCtrl._craneOperation(A0_86, A1_87, A2_88, A3_89)
  local L4_90
  L4_90 = A0_86.crane_op
  if L4_90 then
    L4_90 = A0_86.lever
    if L4_90 then
      if A1_87 then
        L4_90 = A0_86.se_engine
        if L4_90 then
          L4_90 = Sound
          L4_90 = L4_90.stopSEHandle
          L4_90(L4_90, A0_86.se_engine)
        end
        A0_86.is_skip = A3_89
        L4_90 = A0_86.lever
        L4_90 = L4_90.getActive
        L4_90 = L4_90(L4_90)
        if L4_90 then
          L4_90 = A0_86.lever
          L4_90 = L4_90.playPoseAnimation
          L4_90(L4_90, "up_00")
          L4_90 = Fn_playMotionNpc
          L4_90(A0_86.crane_op, "lever_out_00", false)
          repeat
            L4_90 = wait
            L4_90()
            L4_90 = A0_86.lever
            L4_90 = L4_90.isPoseAnimEnd
            L4_90 = L4_90(L4_90)
          until L4_90
          L4_90 = Fn_turnNpc
          L4_90(A0_86.crane_op, "locator2_man73_turn_pos_02")
          L4_90 = {}
          L4_90.degree_h = 12
          L4_90.degree_v = 30
          L4_90.in_length = 5
          L4_90.out_length = 7
          L4_90.valid = true
          L4_90.target = nil
          L4_90.targetJoint = "bn_head"
          L4_90.forceTarget = true
          L4_90.watchTarget = true
          A0_86.crane_op:setSightParam(L4_90)
        end
      else
        L4_90 = A0_86.lever
        L4_90 = L4_90.getActive
        L4_90 = L4_90(L4_90)
        if L4_90 then
          if A2_88 then
            L4_90 = A0_86.lever_caption
            if L4_90 then
              L4_90 = Sound
              L4_90 = L4_90.playSE
              L4_90(L4_90, A0_86.lever_voice, 0.7, "", A0_86.marker_tgt)
              L4_90 = Fn_captionView
              L4_90(A0_86.lever_caption)
            end
            L4_90 = A0_86.crane_op
            if L4_90 then
              L4_90 = A0_86.crane_op
              L4_90 = L4_90.getActive
              L4_90 = L4_90(L4_90)
              if L4_90 then
                L4_90 = A0_86._turn
                L4_90(A0_86)
              end
            end
          else
          end
          L4_90 = Fn_playMotionNpc
          L4_90(A0_86.crane_op, "lever_in_00", false)
          L4_90 = A0_86.lever
          L4_90 = L4_90.playPoseAnimation
          L4_90(L4_90, "down_00")
          repeat
            L4_90 = wait
            L4_90()
            L4_90 = A0_86.lever
            L4_90 = L4_90.isPoseAnimEnd
            L4_90 = L4_90(L4_90)
          until L4_90
          L4_90 = Fn_playMotionNpc
          L4_90(A0_86.crane_op, "lever_00", false)
          L4_90 = A0_86.lever
          L4_90 = L4_90.playPoseAnimation
          L4_90(L4_90, "stay_00")
        end
        L4_90 = A0_86.engine
        if L4_90 then
          L4_90 = A0_86.se_engine
          if L4_90 == nil then
            L4_90 = Sound
            L4_90 = L4_90.playSEHandle
            L4_90 = L4_90(L4_90, "cage_engine", 0.7, "", A0_86.engine)
            A0_86.se_engine = L4_90
          end
        end
      end
    elseif A1_87 then
      L4_90 = A0_86.se_engine
      if L4_90 then
        L4_90 = Sound
        L4_90 = L4_90.stopSEHandle
        L4_90(L4_90, A0_86.se_engine)
      end
    else
      if A2_88 then
        L4_90 = A0_86.is_signal
        if L4_90 then
          L4_90 = A0_86.lever_caption
          if L4_90 then
            L4_90 = Sound
            L4_90 = L4_90.playSE
            L4_90(L4_90, A0_86.lever_voice, 0.7, "", A0_86.marker_tgt)
            L4_90 = Fn_captionViewWait
            L4_90(A0_86.lever_caption)
          end
          L4_90 = A0_86.crane_op
          if L4_90 then
            L4_90 = A0_86._signal
            L4_90(A0_86, A0_86.crane_op)
          end
        end
      end
      L4_90 = A0_86.crane_op
      if L4_90 then
        L4_90 = Fn_playMotionNpc
        L4_90(A0_86.crane_op, "crane", false)
      end
      L4_90 = A0_86.engine
      if L4_90 then
        L4_90 = A0_86.se_engine
        if L4_90 == nil then
          L4_90 = Sound
          L4_90 = L4_90.playSEHandle
          L4_90 = L4_90(L4_90, "cage_engine", 0.7, "", A0_86.engine)
          A0_86.se_engine = L4_90
        end
      end
    end
  end
end
function ShipCtrl._inGamePauseMenuOff(A0_91)
  HUD:setTextCommonCtrlGuide()
  HUD:menuDelCallback(HUD.kCallback_IGPauseSkip)
  HUD:menuDelCallback(HUD.kCallback_IGPauseReturn)
  A0_91.pause_task = A0_91:_aboutTask(A0_91.pause_task)
  HUD:setUserControlLock(false)
end
function ShipCtrl._inGamePauseMenuOn(A0_92, A1_93)
  local L2_94, L3_95
  A0_92.is_move_skip = false
  function L2_94()
    A0_92:_inGamePauseMenuOff()
    A0_92:_warpEndNode(true)
    Fn_userCtrlOff()
  end
  function L3_95()
    local L0_96, L1_97
  end
  if A0_92.pause_task == nil then
    A0_92.pause_task = invokeTask(function()
      if A1_93 ~= nil then
        waitSeconds(A1_93)
      end
      while GameDatabase:get(ggd.GlobalSystemFlags__AutoSave) > 0 or 0 < GameDatabase:get(ggd.GlobalSystemFlags__AccessIndicator) do
        wait()
      end
      if A0_92.in_outrange == true then
        HUD:menuSetCallback(HUD.kCallback_IGPauseSkip, L2_94)
        HUD:menuSetCallback(HUD.kCallback_IGPauseReturn, L3_95)
        HUD:setTextCommonCtrlGuide("ui_keyguide_common_01")
        HUD:setUserControlLock(false)
      end
      A0_92.pause_task = nil
    end)
  end
end
function ShipCtrl._move(A0_98, A1_99)
  local L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106
  L2_100 = GameDatabase
  L3_101 = L2_100
  L2_100 = L2_100.set
  L2_100(L3_101, L4_102, L5_103)
  L2_100 = Sound
  L3_101 = L2_100
  L2_100 = L2_100.playSEHandle
  L7_105 = A0_98.ship_hdl
  L2_100 = L2_100(L3_101, L4_102, L5_103, L6_104, L7_105)
  A0_98.se_move = L2_100
  L2_100 = Sound
  L3_101 = L2_100
  L2_100 = L2_100.playSEHandle
  L7_105 = A0_98.ship_hdl
  L2_100 = L2_100(L3_101, L4_102, L5_103, L6_104, L7_105)
  A0_98.se_wind = L2_100
  L3_101 = A0_98
  L2_100 = A0_98._aboutTask
  L2_100 = L2_100(L3_101, L4_102)
  A0_98.shake_rnd_task = L2_100
  L3_101 = A0_98
  L2_100 = A0_98._cameraShakeMain
  L2_100 = L2_100(L3_101)
  A0_98.shake_main_task = L2_100
  L3_101 = A0_98
  L2_100 = A0_98._cameraShakeSub
  L2_100 = L2_100(L3_101)
  A0_98.shake_sub_task = L2_100
  L2_100 = findGameObject2
  L3_101 = "Node"
  L2_100 = L2_100(L3_101, L4_102)
  L3_101 = findGameObject2
  L3_101 = L3_101(L4_102, L5_103)
  if L2_100 ~= nil then
    if L4_102 == false then
      if L4_102 == true then
        A0_98.is_move = true
        L7_105 = 0
        L5_103(L6_104, L7_105)
        L5_103(L6_104)
        L7_105 = L2_100
        L5_103(L6_104, L7_105)
        while true do
          L7_105 = A0_98.ship_hdl
          L8_106 = L7_105
          L7_105 = L7_105.isMoveEnd
          L7_105 = L7_105(L8_106)
          if L7_105 == false then
            L7_105 = A0_98.is_move_skip
            if L7_105 == false then
              L7_105 = A0_98.in_outrange
            end
          end
          if L7_105 == true then
            if L5_103 < 120 then
              L7_105 = L5_103 / 120
              L8_106 = L7_105 * L7_105
              A0_98.ship_hdl:setMoveVelocity(L4_102 * L8_106)
            elseif L6_104 < 90 then
              L7_105 = A0_98.ship_hdl
              L8_106 = L7_105
              L7_105 = L7_105.getMoveDistance
              L7_105 = L7_105(L8_106)
              if L7_105 < 10 then
                L7_105 = L6_104 / 90
                L7_105 = 1 - L7_105
                L8_106 = L7_105 * L7_105
                if L8_106 > 0.2 then
                  A0_98.ship_hdl:setMoveVelocity(L4_102 * L8_106)
                end
              end
            end
            L7_105 = wait
            L7_105()
          end
        end
        L7_105 = A0_98.ship_hdl
        L8_106 = L7_105
        L7_105 = L7_105.setMoveTarget
        L7_105(L8_106, nil)
      end
    end
  end
  if L4_102 == "ve_crane_root" then
    if L4_102 == "mine_bu" then
      L4_102(L5_103, L6_104)
    else
      L4_102(L5_103, L6_104)
    end
  else
    L4_102(L5_103, L6_104)
  end
  L4_102(L5_103)
  for L7_105, L8_106 in L4_102(L5_103) do
    A0_98.ship_hdl:appendMoveTarget(L8_106)
  end
  L4_102(L5_103)
  if L3_101 == nil then
    A0_98.is_move = false
  else
    A0_98.is_move = true
  end
  while true do
    if L5_103 == false then
      if L5_103 == false then
        if L5_103 == true then
          if L5_103 < 10 then
            if A1_99 ~= false then
              if L3_101 == nil then
                L5_103(L6_104)
                L5_103()
                L5_103(L6_104)
                L5_103(L6_104)
                L7_105 = A0_98.se_move
                A0_98.se_move = L5_103
                if L5_103 == false then
                  if L5_103 == false then
                    L7_105 = "ships_brake"
                    L8_106 = 0.6
                    L5_103(L6_104, L7_105, L8_106, "")
                  end
                end
              end
              break
            elseif L4_102 == false then
              if L3_101 == nil then
                L5_103(L6_104)
                L5_103(L6_104)
                L7_105 = A0_98.se_move
                A0_98.se_move = L5_103
                L7_105 = "ships_brake"
                L8_106 = 1
                L5_103(L6_104, L7_105, L8_106, "", A0_98.ship_hdl)
              end
            end
          end
        end
      end
    end
    L5_103()
  end
  L5_103(L6_104)
  L5_103(L6_104)
  if L3_101 ~= nil then
    if L5_103 == false then
      if L5_103 == true then
        L7_105 = L6_104
        L8_106 = 0
        L6_104(L7_105, L8_106)
        L7_105 = L6_104
        L6_104(L7_105)
        L7_105 = L6_104
        L8_106 = L3_101
        L6_104(L7_105, L8_106)
        L7_105 = 1
        L8_106 = false
        while A0_98.ship_hdl:isMoveEnd() == false and A0_98.is_move_skip == false and A0_98.in_outrange == true do
          if L6_104 < 90 then
            A0_98.ship_hdl:setMoveVelocity(L5_103 * (L6_104 / 90 * (L6_104 / 90)))
          elseif L7_105 < 90 and A0_98.ship_hdl:getMoveDistance() < 10 then
            if (1 - L7_105 / 90) * (1 - L7_105 / 90) > 0.2 then
              A0_98.ship_hdl:setMoveVelocity(L5_103 * ((1 - L7_105 / 90) * (1 - L7_105 / 90)))
            end
            L7_105 = L7_105 + 1
          end
          if A0_98.ship_hdl:getMoveDistance() < 10 then
            if A1_99 ~= false then
              HUD:setTextCommonCtrlGuide()
              Fn_blackout()
              A0_98:_inGamePauseMenuOff()
              waitSeconds(1)
              A0_98.se_move = A0_98:_stopSE(A0_98.se_move)
              if A0_98.select_rp == false then
                Sound:playSE("ships_brake", 0.6, "")
              end
              break
            elseif L8_106 == false then
              L8_106 = true
              HUD:setTextCommonCtrlGuide()
              A0_98:_inGamePauseMenuOff()
              A0_98.se_move = A0_98:_stopSE(A0_98.se_move)
              Sound:playSE("ships_brake", 1, "", A0_98.ship_hdl)
            end
          end
          wait()
        end
        A0_98.ship_hdl:setMoveTarget(nil)
      end
    end
  end
  if L5_103 == false then
    if L5_103 == false then
      A0_98.in_outrange = true
      L5_103(L6_104)
      L7_105 = true
      L5_103(L6_104, L7_105)
      L5_103()
      while true do
        if not L5_103 then
          L5_103()
        end
      end
      L5_103()
    end
  end
  A0_98.is_move = false
  L7_105 = ggd
  L7_105 = L7_105.CreneShipFlags__ShipMoving
  L8_106 = false
  L5_103(L6_104, L7_105, L8_106)
  L7_105 = A0_98.se_move
  A0_98.se_move = L5_103
  L7_105 = A0_98.se_wind
  A0_98.se_wind = L5_103
  L5_103(L6_104)
end
function ShipCtrl._fadeinTask(A0_107, A1_108)
  return (invokeTask(function()
    waitSeconds(A1_108)
    if A0_107.in_outrange == true then
      Fn_fadein()
      Fn_userCtrlOn()
      Fn_userCtrlGravityOff()
    end
  end))
end
function ShipCtrl._arrivalTask(A0_109)
  return (invokeTask(function()
    while A0_109.is_move_skip == false and A0_109.in_outrange == true do
      if A0_109.is_move == false and A0_109.ship_hdl:getMoveDistance() < 10 then
        A0_109:_warpEndNode()
        break
      end
      wait()
    end
  end))
end
function ShipCtrl._warpEndNode(A0_110, A1_111)
  if not A0_110.warp_task then
    A0_110.warp_task = invokeTask(function()
      HUD:setTextCommonCtrlGuide()
      Fn_blackout()
      A0_110.is_move_skip = true
      if A0_110.is_move == true then
        A0_110.ship_hdl:setMoveTarget(nil)
      end
      A0_110.ship_hdl:beginMoveTargets()
      A0_110.ship_hdl:endMoveTargets()
      if A1_111 == true and A0_110.select_rp == false then
        Sound:playSE("ships_brake", 0.6, "")
      end
      A0_110.select_rp = false
      if A0_110.is_rp then
        A0_110.is_loading = true
        Area:setEnableLoading(false)
        A0_110:debugPrint("GameDeltaSec Off")
        Time:setInGameDeltaSec(0)
        wait()
        Area:setAreaFree()
        Fn_resetArea()
        Fn_resetPcPos("locator2_pc_ship_pos_02")
        A0_110.is_loading = false
      end
      A0_110.warp_task = nil
    end)
  end
end
function ShipCtrl._invisibleColltion(A0_112, A1_113)
  A0_112.ship_col:setCollidablePermission(A1_113)
  if A1_113 then
    Fn_userCtrlGravityOff()
    Fn_coercionGravityRevert()
    Player:setFeline(false, true)
    Player:setAttrTune(Player.kAttrTune_Normal)
  end
end
function ShipCtrl._createDestinationMarker(A0_114, A1_115)
  local L2_116, L3_117, L4_118
  L2_116 = A0_114.sensor_hdl
  if not L2_116 then
    L2_116 = A0_114.marker_hdl
  elseif L2_116 then
    L3_117 = A0_114
    L2_116 = A0_114.debugPrint
    L4_118 = "\227\129\153\227\129\167\227\129\171\233\129\184\230\138\158\232\130\162\227\129\174\227\131\158\227\131\188\227\130\171\227\131\188\227\129\175\228\189\156\227\130\137\227\130\140\227\129\166\227\129\132\227\129\190\227\129\153"
    L2_116(L3_117, L4_118)
    L2_116 = false
    return L2_116
  end
  while true do
    L2_116 = A0_114.marker_tgt
    if not L2_116 then
      L2_116 = wait
      L2_116()
    end
  end
  L2_116 = {}
  L3_117 = A0_114.marker_tgt
  L2_116.target = L3_117
  L2_116.find_type = "Puppet"
  L3_117 = {}
  L3_117.name = "gui_marker_10"
  L4_118 = A0_114.ad_title_id
  L3_117.ad_title_id = L4_118
  L3_117.ad_sub_id = "ui_acdialog_sub_10"
  L4_118 = A0_114.map_title_id
  L3_117.map_title_id = L4_118
  L3_117.map_sub_id = "ui_map_msinfo_header_10"
  L3_117.giude_id = "ui_keyguide_ac_02"
  L3_117.pattern = "A"
  L3_117.map_disp = true
  L3_117.active = true
  function L4_118()
    A0_114:markerInOut(false)
    A0_114:_destinationSelecter()
  end
  setupMarkerBase(L2_116, L3_117, L4_118):setActive(A1_115)
  if A1_115 then
    setupMarkerBase(L2_116, L3_117, L4_118):playIn()
  else
    setupMarkerBase(L2_116, L3_117, L4_118):playOut()
  end
  setupMarkerBase(L2_116, L3_117, L4_118):try_init()
  setupMarkerBase(L2_116, L3_117, L4_118):try_init()
  setupMarkerBase(L2_116, L3_117, L4_118):waitForReady()
  setupMarkerBase(L2_116, L3_117, L4_118):waitForReady()
  setupMarkerBase(L2_116, L3_117, L4_118):try_start()
  setupMarkerBase(L2_116, L3_117, L4_118):try_start()
  A0_114.marker_hdl, A0_114.sensor_hdl = setupMarkerBase(L2_116, L3_117, L4_118)
  return true
end
function ShipCtrl._destinationSelecter(A0_119)
  local L1_120, L2_121
  L1_120 = HUD
  L1_120 = L1_120.mineSelectInit
  L1_120(L2_121)
  L1_120 = HUD
  L1_120 = L1_120.mineSelectSetCurrentMineId
  L1_120(L2_121, GameDatabase:get(ggd.Savedata__CreneShipFlags__MineId))
  L1_120 = A0_119.mi_mng
  L1_120 = L1_120.sendEvent
  L1_120 = L1_120(L2_121, "getEnableLocation")
  for _FORV_5_, _FORV_6_ in L2_121(L1_120) do
    if _FORV_6_ then
      HUD:mineSelectSetting(_FORV_6_.id, _FORV_6_.density, _FORV_6_.level, _FORV_6_.boss, _FORV_6_.storm, _FORV_6_.impossible)
    end
  end
  if L2_121 then
    if L2_121 then
      L2_121(L2_121, "setLoackUpdateMine", true)
    end
  end
  L2_121(L2_121)
  while true do
    if HUD:mineSelectGetResult() ~= HUD.kHUDMineSelect_None then
      if HUD:mineSelectGetResult() == HUD.kHUDMineSelect_Decide then
        GameDatabase:set(ggd.Savedata__CreneShipFlags__MineId, L2_121)
        A0_119:setRoute("storm_to_storm")
        A0_119:departure("mine0" .. L2_121 .. "_header")
        A0_119:debugPrint(string.format("\233\129\184\227\129\176\227\130\140\227\129\159\230\142\161\230\142\152\229\160\180ID : %d", L2_121))
        break
      end
      if HUD:mineSelectGetResult() == HUD.kHUDMineSelect_Return then
        A0_119:markerInOut(true)
        A0_119:debugPrint("mine select return")
        if A0_119.mi_mng and A0_119.mi_mng:isRunning() then
          A0_119.mi_mng:sendEvent("setLoackUpdateMine", false)
        end
        break
      end
      if HUD:mineSelectGetResult() == HUD.kHUDMineSelect_ReturnTown then
        A0_119:setRoute("storm_to_storm")
        A0_119.select_rp = true
        A0_119:departure("mine01", true)
        GameDatabase:set(ggd.CreneShipFlags__ReturnToPort, true)
        A0_119:debugPrint("mine select back to town")
      end
      break
    end
    wait()
  end
end
function ShipCtrl._requestSetNextMissionName(A0_122, A1_123, A2_124)
  mother2:sendEvent("requestSetNextMissionName", A1_123)
  if A2_124 then
    A0_122.cs_mng:sendEvent("reset")
  end
end
function ShipCtrl._cameraShakeMain(A0_125)
  A0_125.shake_main_task = A0_125:_aboutTask(A0_125.shake_main_task)
  return invokeTask(function()
    local L0_126
    while true do
      L0_126 = A0_125.ship_hdl
      if L0_126 ~= nil then
        L0_126 = RandF
        L0_126 = L0_126(0.05, 0.3)
        Camera:shake3D(2 / L0_126, RandF(0.09, 0.2), L0_126, A0_125.ship_hdl:getWorldPos(), 0)
        waitSeconds(RandF(3, 5))
      end
    end
  end)
end
function ShipCtrl._cameraShakeSub(A0_127)
  A0_127.shake_sub_task = A0_127:_aboutTask(A0_127.shake_sub_task)
  return invokeTask(function()
    while true do
      waitSeconds(RandF(1, 3.5))
      if A0_127.ship_hdl ~= nil then
        Camera:shake3D(RandF(3, 7), RandF(0.001, 0.004), RandF(8, 12), A0_127.ship_hdl:getWorldPos(), 0)
      end
    end
  end)
end
function ShipCtrl._cameraShakeRnd(A0_128)
  A0_128.shake_rnd_task = A0_128:_aboutTask(A0_128.shake_rnd_task)
  return invokeTask(function()
    while true do
      waitSeconds(RandF(0.7, 6))
      if A0_128.ship_hdl ~= nil then
        Camera:shake3D(RandF(0.5, 2), RandF(0.003, 0.01), RandF(1, 12), A0_128.ship_hdl:getWorldPos(), 0)
      end
    end
  end)
end
function ShipCtrl.stormCameraShakeOn(A0_129)
  A0_129.shake_main_task = A0_129:_cameraShakeMain()
  A0_129.shake_sub_task = A0_129:_cameraShakeSub()
  A0_129.shake_rnd_task = A0_129:_cameraShakeRnd()
end
function ShipCtrl.stormCameraShakeOff(A0_130)
  A0_130.shake_main_task = A0_130:_aboutTask(A0_130.shake_main_task)
  A0_130.shake_sub_task = A0_130:_aboutTask(A0_130.shake_sub_task)
  A0_130.shake_rnd_task = A0_130:_aboutTask(A0_130.shake_rnd_task)
  Camera:stopShake(0)
end
function ShipCtrl.debugPrint(A0_131, A1_132)
  print(" [  crane  ] " .. A1_132)
end
function ShipCtrl.debug(A0_133, A1_134)
  local L2_135, L3_136
  L2_135 = 0
  function L3_136(A0_137)
    local L1_138
    L1_138 = A1_134
    if Debug:isDebugMenuOpen() then
      L1_138 = L1_138 + 200
    end
    Font:debugPrint(L1_138, 20 + 18 * L2_135, A0_137)
    L2_135 = L2_135 + 1
  end
  L3_136("- ship_controller -")
  L3_136("catwarp lock   : " .. tostring(GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock)))
  if A0_133.ship_hdl then
    L3_136("crane_name     : " .. tostring(A0_133.ship_hdl:getName()))
  else
    L3_136("crane_name     : nil")
  end
  if A0_133.mizai then
    L3_136("mizai          : " .. tostring(A0_133.mizai:getName()) .. ":" .. tostring(A0_133.mizai:getActive()))
  else
    L3_136("mizai          : nil")
  end
  if A0_133.marker_tgt then
    L3_136("markar_target  : " .. tostring(A0_133.marker_tgt:getName()) .. ":" .. tostring(A0_133.marker_tgt:getActive()))
  else
    L3_136("markar_target  : nil")
  end
  if A0_133.crane_op then
    L3_136("crane_opreter  : " .. tostring(A0_133.crane_op:getName()) .. ":" .. tostring(A0_133.marker_tgt:getActive()))
  else
    L3_136("crane_opreter  : nil")
  end
  if A0_133.rudder_op then
    L3_136("rudder_opreter : " .. tostring(A0_133.rudder_op:getName()) .. ":" .. tostring(A0_133.marker_tgt:getActive()))
  else
    L3_136("rudder_opreter : nil")
  end
  L3_136("evb_move       : " .. tostring(A0_133.evb_move))
  L3_136("evb_setup      : " .. tostring(A0_133.evb_setup))
  L3_136("lever_caption  : " .. tostring(A0_133.lever_caption))
  L3_136("lever_voice    : " .. tostring(A0_133.lever_voice))
  L3_136("rudder_voice   : " .. tostring(A0_133.rudder_voice))
  L3_136("ad_title_id  : " .. tostring(A0_133.ad_title_id))
  L3_136("map_title_id : " .. tostring(A0_133.map_title_id))
  L3_136("signal         : " .. tostring(A0_133.is_signal))
  L3_136("departure      : " .. tostring(A0_133.is_departure))
  L3_136("ready_ret_port : " .. tostring(A0_133.is_rp_ready))
  L3_136("finish_ret_port: " .. tostring(A0_133.is_rp_finish))
  L3_136("digout         : " .. tostring(A0_133.is_digout))
end
