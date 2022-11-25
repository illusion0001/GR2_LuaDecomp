import("Font")
import("math")
import("Player")
dofile("/Game/Event2/bgset/bg_cage_param.lua")
Cage = {}
function Cage.create()
  local L0_0
  L0_0 = {}
  L0_0.name = "cage"
  L0_0.ctrl_node = nil
  L0_0.model = nil
  L0_0.wire = nil
  L0_0.wire2 = nil
  L0_0.ship_hdl = nil
  L0_0.area_rname = nil
  L0_0.area_root = nil
  L0_0.area_name = nil
  L0_0.loc_name = nil
  L0_0.move_func_start = nil
  L0_0.move_func_end = nil
  L0_0.base_node = nil
  L0_0.collsion = nil
  L0_0.sensor_hdl = nil
  L0_0.marker_hdl = nil
  L0_0.sensor_task = nil
  L0_0.cage_out_sensor = false
  L0_0.cege_out_sensor_hdl = nil
  L0_0.outrange_sensor_hdl = nil
  L0_0.mov_task = nil
  L0_0.mov_down = true
  L0_0.mov_skip = false
  L0_0.mov_alighting = false
  L0_0.mov_se = nil
  L0_0.def_dist = 0
  L0_0.mov_dist = 0
  L0_0.mov_pos = 0
  L0_0.mov_time = 0
  L0_0.moving_dist = 0
  L0_0.def_pos_y = 0
  L0_0.floater_task = nil
  L0_0.ship_floater_task = nil
  L0_0.measurement = nil
  L0_0.in_outrange = true
  L0_0.warp_on = false
  L0_0.warp_ship = false
  L0_0.warp_pos = 0
  L0_0.warp_move = false
  L0_0.is_skip = false
  L0_0.is_move = false
  L0_0.is_warp = false
  L0_0.fadein = false
  L0_0.mine_infinity = false
  L0_0.mine_infinity_node = nil
  L0_0.prevention_caught = false
  L0_0.prevention_caught_task = nil
  L0_0.prevention_caught_sensor = nil
  L0_0.scene_param = nil
  L0_0.max_speed = 30
  L0_0.acceleration_time = 5
  L0_0.deceleration_time = 10
  L0_0.decel = false
  L0_0.c_frame = 0
  L0_0.e_frame = 0
  L0_0.a_frame = 0
  L0_0.d_frame = 0
  L0_0.m_pos = nil
  L0_0.m_rot = nil
  L0_0.diff_x = 0
  L0_0.diff_y = 0
  L0_0.diff_z = 0
  Cage._installMethods(L0_0)
  return L0_0
end
function Cage.reset(A0_1)
  A0_1:debugPrint("\231\177\160\227\129\174\230\131\133\229\160\177\227\131\170\227\130\187\227\131\131\227\131\136")
  A0_1.floater_task = A0_1:_aboutTask(A0_1.floater_task)
  A0_1.measurement = A0_1:_aboutTask(A0_1.measurement)
  A0_1.ship_floater_task = A0_1:_aboutTask(A0_1.ship_floater_task)
  A0_1.base_node = A0_1:_termGameObj(A0_1.base_node)
  A0_1.collsion = A0_1:_termGameObj(A0_1.collsion)
  A0_1.wire2 = A0_1:_termGameObj(A0_1.wire2)
  A0_1.sensor_hdl = A0_1:_termGameObj(A0_1.sensor_hdl)
  A0_1.marker_hdl = A0_1:_termGameObj(A0_1.marker_hdl)
  A0_1.sensor_task = A0_1:_aboutTask(A0_1.sensor_task)
  A0_1.cage_out_sensor = false
  A0_1.cege_out_sensor_hdl = A0_1:_termGameObj(A0_1.cege_out_sensor_hdl)
  A0_1.in_outrange = true
  A0_1.outrange_sensor_hdl = A0_1:_termGameObj(A0_1.outrange_sensor_hdl)
  A0_1.warp_on = false
  A0_1.warp_ship = false
  A0_1.warp_pos = 0
  A0_1.warp_move = false
  A0_1.mov_task = A0_1:_aboutTask(A0_1.mov_task)
  A0_1.mov_down = true
  A0_1.mov_skip = false
  A0_1.mov_alighting = false
  A0_1.mov_se = A0_1:_stopSE(A0_1.mov_se)
  A0_1.def_dist = 0
  A0_1.mov_dist = 0
  A0_1.mov_pos = 0
  A0_1.mov_time = 0
  A0_1.moving_dist = 0
  A0_1.def_pos_y = 0
  A0_1.is_skip = false
  A0_1.is_move = false
  A0_1.is_warp = false
  A0_1.fadein = false
  A0_1.mine_infinity = false
  A0_1.mine_infinity_node = A0_1:_termGameObj(A0_1.mine_infinity_node)
  A0_1.prevention_caught = false
  A0_1.prevention_caught_task = A0_1:_aboutTask(A0_1.prevention_caught_task)
  A0_1.prevention_caught_sensor = A0_1:_termGameObj(A0_1.prevention_caught_sensor)
  if A0_1.ctrl_node then
    A0_1.ctrl_node:clearCurve()
  end
  A0_1.ctrl_node = nil
  A0_1.model = nil
  A0_1.wire = nil
  A0_1.ship_hdl = nil
  A0_1.area_rname = nil
  A0_1.area_root = nil
  A0_1.area_name = nil
  A0_1.loc_name = nil
  A0_1.move_func_start = nil
  A0_1.move_func_end = nil
  A0_1.max_speed = 30
  A0_1.acceleration_time = 5
  A0_1.deceleration_time = 10
  A0_1.decel = false
  A0_1.c_frame = 0
  A0_1.e_frame = 0
  A0_1.a_frame = 0
  A0_1.d_frame = 0
  m_pos = nil
  m_rot = nil
  diff_x = 0
  diff_y = 0
  diff_z = 0
end
function Cage.waitAvailable(A0_2)
  while not A0_2.ctrl_node do
    wait()
  end
end
function Cage.getModelHandle(A0_3)
  local L1_4
  L1_4 = A0_3.model
  return L1_4
end
function Cage.getMovingDist(A0_5)
  local L1_6
  L1_6 = A0_5.moving_dist
  return L1_6
end
function Cage.isMoveEnd(A0_7)
  return not A0_7.is_move
end
function Cage.isSkip(A0_8)
  local L1_9
  L1_9 = A0_8.is_skip
  return L1_9
end
_old_flag = nil
function Cage.setObjectHandle(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17, A8_18)
  if not Cage._isValid(A0_10) then
    return false
  end
  A0_10.ctrl_node = A1_11
  A0_10.model = A2_12
  A0_10.wire = A7_17
  A0_10.area_root = A3_13
  A0_10.area_rname = A3_13 and A3_13:getName() or "None"
  A0_10.area_name = A4_14
  A0_10.loc_name = A6_16
  A0_10.ship_hdl = A5_15
  A0_10.scene_param = A8_18 or ""
  if A0_10.ship_floater_task == nil then
    A0_10.ship_floater_task = invokeTask(function()
      while true do
        if A0_10.floater_task == nil and GameDatabase:get(ggd.CreneShipFlags__ShipMoving) ~= _old_flag and A0_10.model ~= nil then
          if GameDatabase:get(ggd.CreneShipFlags__ShipMoving) == true then
            A0_10:debugPrint("\230\142\161\230\142\152\232\136\185\231\167\187\229\139\149\230\153\130\227\129\174\230\143\186\227\130\140\227\129\171\227\129\151\227\129\190\227\129\153")
            A0_10.model:setFloaterParams(DRIFT_PARAM_CAGE_SHIP_MOVING)
            A0_10:makerInOut(false, false)
            A0_10.marker_hdl = A0_10:_termGameObj(A0_10.marker_hdl)
          else
            A0_10:debugPrint("\230\143\186\227\130\140\227\130\146\229\133\131\227\129\171\230\136\187\227\129\151\227\129\190\227\129\153")
            A0_10.model:setFloaterParams(DRIFT_PARAM_CAGE)
          end
        end
        _old_flag = GameDatabase:get(ggd.CreneShipFlags__ShipMoving)
        wait()
      end
    end)
  else
    A0_10:debugPrint("\227\129\153\227\129\167\227\129\171ship_floater_task\227\129\175\229\139\149\227\129\132\227\129\166\227\129\132\227\129\190\227\129\153")
  end
end
function Cage.setMoveFunc(A0_19, A1_20, A2_21)
  if not Cage._isValid(A0_19) then
    return false
  end
  A0_19.move_func_start = A1_20
  A0_19.move_func_end = A2_21
end
function Cage.setMoveParam(A0_22, A1_23)
  if not Cage._isValid(A0_22) then
    return false
  end
  if type(A1_23) == "table" then
    A0_22.max_speed = A1_23.speed or A0_22.max_speed
    A0_22.acceleration_time = A1_23.accel or A0_22.acceleration_time
    A0_22.deceleration_time = A1_23.decel or A0_22.deceleration_time
  end
end
function Cage.setMoveSkip(A0_24, A1_25)
  if not Cage._isValid(A0_24) then
    return false
  end
  A0_24.mov_skip = A1_25
end
function Cage.setSkipFadein(A0_26)
  if not Cage._isValid(A0_26) then
    return false
  end
  A0_26.fadein = true
end
function Cage.setDown(A0_27, A1_28)
  if not Cage._isValid(A0_27) then
    return false
  end
  if not A0_27.is_move then
    A0_27.mov_down = A1_28
  end
end
function Cage.setCageOutSensor(A0_29, A1_30)
  if not Cage._isValid(A0_29) then
    return false
  end
  A0_29.cage_out_sensor = A1_30
end
function Cage.setWarpParam(A0_31, A1_32, A2_33)
  A0_31.warp_on = true
  A0_31.warp_ship = A1_32
  A0_31.warp_pos = A2_33
end
function Cage.setWarpMove(A0_34, A1_35)
  A0_34.warp_move = A1_35 ~= nil and A1_35 or false
end
function Cage.warpPlayerInSelf(A0_36, A1_37)
  local L2_38, L3_39
  L2_38 = Cage
  L2_38 = L2_38._isValid
  L3_39 = A0_36
  L2_38 = L2_38(L3_39)
  if not L2_38 then
    L2_38 = false
    return L2_38
  end
  L3_39 = A0_36
  L2_38 = A0_36.debugPrint
  L2_38(L3_39, "\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\231\177\160\227\129\174\228\184\173\227\129\171\227\131\175\227\131\188\227\131\151\227\129\149\227\129\155\227\129\190\227\129\153")
  L2_38 = A0_36.base_node
  L3_39 = L2_38
  L2_38 = L2_38.getWorldTransform
  L3_39 = L2_38(L3_39)
  if A1_37 then
    L3_39 = L3_39 * A1_37
  end
  Player:reset(Player.kReset_Standing, L2_38, L3_39)
end
function Cage.setMineInfinity(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46
  L2_42 = Cage
  L2_42 = L2_42._isValid
  L3_43 = A0_40
  L2_42 = L2_42(L3_43)
  if not L2_42 then
    L2_42 = false
    return L2_42
  end
  if A1_41 then
    A0_40.mine_infinity = true
    L2_42 = A1_41.name
    A0_40.area_name = L2_42
    A0_40.mov_skip = true
    A0_40.mov_down = true
    A0_40.mov_time = 15
    A0_40.warp_on = true
    A0_40.acceleration_time = 0
    A0_40.deceleration_time = 5
    L2_42 = A0_40.model
    L3_43 = L2_42
    L2_42 = L2_42.setVisible
    L4_44 = false
    L2_42(L3_43, L4_44)
    L2_42 = A0_40.wire
    L3_43 = L2_42
    L2_42 = L2_42.setVisible
    L4_44 = false
    L2_42(L3_43, L4_44)
    L2_42 = A0_40.wire2
    if L2_42 then
      L2_42 = A0_40.wire2
      L3_43 = L2_42
      L2_42 = L2_42.setVisible
      L4_44 = false
      L2_42(L3_43, L4_44)
    end
    L3_43 = A0_40
    L2_42 = A0_40._aboutTask
    L4_44 = A0_40.mov_task
    L2_42 = L2_42(L3_43, L4_44)
    A0_40.mov_task = L2_42
    L3_43 = A0_40
    L2_42 = A0_40.makerInOut
    L4_44 = false
    L5_45 = false
    L2_42(L3_43, L4_44, L5_45)
    L3_43 = A0_40
    L2_42 = A0_40._termGameObj
    L4_44 = A0_40.sensor_hdl
    L2_42 = L2_42(L3_43, L4_44)
    A0_40.sensor_hdl = L2_42
    L3_43 = A0_40
    L2_42 = A0_40._termGameObj
    L4_44 = A0_40.marker_hdl
    L2_42 = L2_42(L3_43, L4_44)
    A0_40.marker_hdl = L2_42
    L3_43 = A0_40
    L2_42 = A0_40._findSubAreaOrAreaRoot
    L2_42 = L2_42(L3_43)
    if L2_42 then
      L4_44 = A0_40
      L3_43 = A0_40._termGameObj
      L5_45 = A0_40.mine_infinity_node
      L3_43 = L3_43(L4_44, L5_45)
      A0_40.mine_infinity_node = L3_43
      L3_43 = createGameObject2
      L4_44 = "Node"
      L3_43 = L3_43(L4_44)
      L5_45 = L3_43
      L4_44 = L3_43.setName
      L6_46 = "mine_inf_cage_pos"
      L4_44(L5_45, L6_46)
      L5_45 = L2_42
      L4_44 = L2_42.appendChild
      L6_46 = L3_43
      L4_44(L5_45, L6_46)
      L5_45 = L3_43
      L4_44 = L3_43.setTransform
      L6_46 = A1_41.pos
      L4_44(L5_45, L6_46, A1_41.rot)
      L5_45 = L3_43
      L4_44 = L3_43.try_init
      L4_44(L5_45)
      L5_45 = L3_43
      L4_44 = L3_43.waitForReady
      L4_44(L5_45)
      L5_45 = L3_43
      L4_44 = L3_43.try_start
      L4_44(L5_45)
      A0_40.mine_infinity_node = L3_43
      A0_40.loc_name = "mine_inf_cage_pos"
      L4_44 = A0_40.ship_hdl
      L5_45 = L4_44
      L4_44 = L4_44.getNodeWorldPosRot
      L6_46 = "ve_cage_01"
      L5_45 = L4_44(L5_45, L6_46)
      L6_46 = L3_43.getWorldPos
      L6_46 = L6_46(L3_43)
      A0_40.warp_pos = L4_44:DistanceTo(L6_46) - 750
    else
      L3_43 = A0_40.def_dist
      L3_43 = L3_43 - 780
      A0_40.warp_pos = L3_43
      L4_44 = A0_40
      L3_43 = A0_40.debugPrint
      L5_45 = "\231\132\161\233\153\144\230\142\161\230\142\152\227\129\174\231\177\160\227\130\146\233\153\141\227\130\141\227\129\153\227\130\168\227\131\170\227\130\162\227\129\174\232\168\173\229\174\154\227\129\140\230\173\163\227\129\151\227\129\143\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147 root : "
      L6_46 = tostring
      L6_46 = L6_46(A0_40.area_rname)
      L5_45 = L5_45 .. L6_46 .. " area : " .. tostring(A0_40.area_name)
      L3_43(L4_44, L5_45)
    end
    L4_44 = A0_40
    L3_43 = A0_40.warp
    L3_43(L4_44)
  end
end
function Cage.setMineStrom(A0_47, A1_48)
  if not Cage._isValid(A0_47) then
    return false
  end
  if A1_48 == 1 then
    A0_47.mov_skip = true
    A0_47.mov_down = true
    A0_47.loc_name = nil
    A0_47.cage_out_sensor = true
    A0_47:setupMarker(true)
  elseif A1_48 == 2 then
    A0_47.mov_skip = true
    A0_47.loc_name = nil
    A0_47.cage_out_sensor = true
  elseif A1_48 == 3 then
    A0_47.mov_skip = true
    A0_47.mov_down = true
    A0_47.loc_name = nil
    A0_47.cage_out_sensor = true
    A0_47.mine_infinity = false
    A0_47.mine_infinity_node = A0_47:_termGameObj(A0_47.mine_infinity_node)
    A0_47.prevention_caught = false
    A0_47.prevention_caught_task = A0_47:_aboutTask(A0_47.prevention_caught_task)
    A0_47.prevention_caught_sensor = A0_47:_termGameObj(A0_47.prevention_caught_sensor)
    A0_47.sensor_hdl = A0_47:_termGameObj(A0_47.sensor_hdl)
    A0_47.marker_hdl = A0_47:_termGameObj(A0_47.marker_hdl)
    A0_47.cege_out_sensor_hdl = A0_47:_termGameObj(A0_47.cege_out_sensor_hdl)
    A0_47:setupMarker(false)
    A0_47:stop()
    A0_47.warp_on = true
    A0_47.warp_ship = true
    A0_47.warp_pos = 0
    A0_47.warp_move = false
    A0_47:warp()
    A0_47.is_warp = false
    A0_47.model:setVisible(true)
    A0_47.wire:setVisible(true)
    if A0_47.wire2 then
      A0_47.wire2:setVisible(false)
    end
  end
end
function Cage.standby(A0_49)
  local L1_50, L2_51, L3_52
  L1_50 = Cage
  L1_50 = L1_50._isValid
  L2_51 = A0_49
  L1_50 = L1_50(L2_51)
  if not L1_50 then
    L1_50 = false
    return L1_50
  end
  L1_50 = A0_49.model
  if not L1_50 then
    L2_51 = A0_49
    L1_50 = A0_49.debugPrint
    L3_52 = "model\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\228\189\149\227\130\130\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147"
    L1_50(L2_51, L3_52)
    L1_50 = false
    return L1_50
  end
  L1_50 = A0_49.base_node
  if not L1_50 then
    L1_50 = A0_49.collsion
  elseif L1_50 then
    L2_51 = A0_49
    L1_50 = A0_49.debugPrint
    L3_52 = "cage_base\227\129\168\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\129\175\227\129\153\227\129\167\227\129\171\228\189\156\227\129\163\227\129\166\227\129\132\227\129\190\227\129\153"
    L1_50(L2_51, L3_52)
    L1_50 = true
    return L1_50
  end
  L1_50 = GameDatabase
  L2_51 = L1_50
  L1_50 = L1_50.get
  L3_52 = ggd
  L3_52 = L3_52.Savedata__CreneShipFlags__MoveDist
  L1_50 = L1_50(L2_51, L3_52)
  A0_49.def_dist = L1_50
  A0_49.mov_dist = L1_50
  A0_49.mov_time = 0
  L2_51 = A0_49.model
  L3_52 = L2_51
  L2_51 = L2_51.setFloaterParams
  L2_51(L3_52, DRIFT_PARAM_CAGE)
  L2_51 = createGameObject2
  L3_52 = "Node"
  L2_51 = L2_51(L3_52)
  L3_52 = L2_51.setName
  L3_52(L2_51, "cage_base")
  L3_52 = A0_49.model
  L3_52 = L3_52.appendChild
  L3_52(L3_52, L2_51)
  L3_52 = L2_51.setPos
  L3_52(L2_51, Vector(0, -4.6, 0))
  L3_52 = createGameObject2
  L3_52 = L3_52("GimmickBg")
  L3_52:setName("ve_cage_col")
  L3_52:setCollisionName("ve_cage_col")
  L3_52:setAttributeName("invisible_col")
  L3_52:setCollidablePermission(false)
  A0_49.model:appendChild(L3_52)
  A0_49.base_node = L2_51
  A0_49.collsion = L3_52
  L2_51:try_init()
  L3_52:try_init()
  L2_51:waitForReady()
  L3_52:waitForReady()
  L2_51:try_start()
  L3_52:try_start()
  return true
end
function Cage.setupOutrangeSensor(A0_53)
  local L1_54, L2_55, L3_56, L4_57
  L1_54 = A0_53.name
  L2_55 = "_outrange"
  L1_54 = L1_54 .. L2_55
  L2_55 = L1_54
  L3_56 = "_OnEnter"
  L2_55 = L2_55 .. L3_56
  L3_56 = L1_54
  L4_57 = "_OnLeave"
  L3_56 = L3_56 .. L4_57
  L4_57 = _G
  L4_57[L2_55] = function()
    local L0_58, L1_59
    A0_53.in_outrange = true
  end
  L4_57 = _G
  L4_57[L3_56] = function()
    local L0_60, L1_61
    A0_53.in_outrange = false
  end
  L4_57 = createGameObject2
  L4_57 = L4_57("PlayerSensor")
  L4_57:setName(L1_54)
  L4_57:setDetectBehavior(1)
  L4_57:addBox(Vector(20, 20, 20))
  L4_57:setPos(Vector(0, -3, 0))
  L4_57:setOnEnter(L2_55)
  L4_57:setOnLeave(L3_56)
  A0_53.model:appendChild(L4_57)
  L4_57:try_init()
  L4_57:waitForReady()
  L4_57:try_start()
  A0_53.outrange_sensor_hdl = L4_57
end
function Cage.setupMarker(A0_62, A1_63)
  local L2_64, L3_65, L4_66, L5_67, L6_68, L7_69, L8_70, L9_71, L10_72, L11_73
  L2_64 = Cage
  L2_64 = L2_64._isValid
  L3_65 = A0_62
  L2_64 = L2_64(L3_65)
  if not L2_64 then
    L2_64 = false
    return L2_64
  end
  L3_65 = A0_62
  L2_64 = A0_62._checkBaseNode
  L2_64 = L2_64(L3_65)
  if not L2_64 then
    L2_64 = false
    return L2_64
  end
  L2_64 = A0_62.sensor_hdl
  if not L2_64 then
    L2_64 = A0_62.marker_hdl
    L2_64 = L2_64 or A0_62.cege_out_sensor_hdl
  elseif L2_64 then
    L3_65 = A0_62
    L2_64 = A0_62.debugPrint
    L4_66 = "\231\167\187\229\139\149\231\148\168\227\129\174\227\131\158\227\131\188\227\130\171\227\131\188\227\129\175\227\129\153\227\129\167\227\129\171\228\189\156\230\136\144\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153"
    L2_64(L3_65, L4_66)
    L2_64 = true
    return L2_64
  end
  L2_64 = createGameObject2
  L3_65 = "MapMarker"
  L2_64 = L2_64(L3_65)
  L4_66 = L2_64
  L3_65 = L2_64.setName
  L5_67 = A0_62.name
  L6_68 = "_marker"
  L5_67 = L5_67 .. L6_68
  L3_65(L4_66, L5_67)
  L4_66 = L2_64
  L3_65 = L2_64.setAssetName
  L5_67 = "gui_marker_10"
  L3_65(L4_66, L5_67)
  L4_66 = L2_64
  L3_65 = L2_64.setupPattern
  L5_67 = "E"
  L3_65(L4_66, L5_67)
  L4_66 = L2_64
  L3_65 = L2_64.setHudParameter
  L5_67 = "gui_marker_10"
  L6_68 = "ui_map_msinfo_main_mine"
  L7_69 = "ui_map_msinfo_header_10"
  L3_65(L4_66, L5_67, L6_68, L7_69)
  if A1_63 then
    L4_66 = L2_64
    L3_65 = L2_64.playIn
    L3_65(L4_66)
  else
    L4_66 = L2_64
    L3_65 = L2_64.playOut
    L3_65(L4_66)
  end
  L3_65 = A0_62.base_node
  L4_66 = L3_65
  L3_65 = L3_65.appendChild
  L5_67 = L2_64
  L3_65(L4_66, L5_67)
  L4_66 = L2_64
  L3_65 = L2_64.setPos
  L5_67 = pos
  L3_65(L4_66, L5_67)
  L3_65 = A0_62.name
  L4_66 = "_sensor"
  L3_65 = L3_65 .. L4_66
  L4_66 = L3_65
  L5_67 = "_OnEnter"
  L4_66 = L4_66 .. L5_67
  L5_67 = L3_65
  L6_68 = "_OnLeave"
  L5_67 = L5_67 .. L6_68
  L6_68 = A0_62.mov_down
  if L6_68 then
    L6_68 = "ic_crane_00210"
  else
    L6_68 = L6_68 or "ic_crane_00220"
  end
  L7_69 = false
  function L8_70()
    if not _cage_status and GameDatabase:get(ggd.GlobalSystemFlags__Mine99MissionMmanaging) == false then
      _cage_status = true
      Player:setStay(true)
      A0_62:move(true)
    end
  end
  function L9_71()
    L7_69 = true
    if A0_62.sensor_task == nil then
      A0_62.sensor_task = invokeTask(function()
        A0_62:debugPrint("idle\227\129\171\227\129\170\227\130\139\227\129\174\227\130\146\229\190\133\227\129\161\227\129\190\227\129\153")
        while Player:getAction() ~= Player.kAction_Idle do
          wait()
        end
        A0_62:debugPrint("idle\227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\131\128\227\130\164\227\130\162\227\131\173\227\130\176\227\130\146\229\135\186\227\129\151\227\129\190\227\129\153")
        if GameDatabase:get(ggd.GlobalSystemFlags__Mine99MissionMmanaging) then
          A0_62:debugPrint("\227\129\168\230\128\157\227\129\163\227\129\159\227\129\145\227\129\169\227\129\138\233\161\140\229\164\177\230\149\151\227\129\151\227\129\159\227\129\174\227\129\167\227\131\128\227\130\164\227\130\162\227\131\173\227\130\176\227\129\175\227\130\132\227\129\163\227\129\177\227\130\138\229\135\186\227\129\151\227\129\190\227\129\155\227\130\147")
        else
          Fn_actionDialog(L3_65, nil, nil, L6_68, nil, L8_70)
        end
        A0_62.sensor_task = nil
      end)
    end
  end
  function L10_72()
    L7_69 = false
    A0_62.sensor_task = A0_62:_aboutTask(A0_62.sensor_task)
    Fn_actionDialogCancel(L3_65)
  end
  L11_73 = _G
  L11_73[L4_66] = function()
    L9_71()
  end
  L11_73 = _G
  L11_73[L5_67] = function()
    L10_72()
  end
  L11_73 = createGameObject2
  L11_73 = L11_73("PlayerSensor")
  L11_73:setName(L3_65)
  L11_73:setDetectBehavior(1)
  L11_73:addCylinder(Vector(0.5, 0.5, 0.5), 32)
  L11_73:setOnEnter(L4_66)
  L11_73:setOnLeave(L5_67)
  A0_62.base_node:appendChild(L11_73)
  L11_73:setPos(Vector(0, 1, 0))
  L11_73:setActive(A1_63)
  A0_62.sensor_hdl = L11_73
  A0_62.marker_hdl = L2_64
  L2_64:try_init()
  L11_73:try_init()
  L2_64:waitForReady()
  L11_73:waitForReady()
  L2_64:try_start()
  L11_73:try_start()
  invokeTask(function()
    while true do
      if GameDatabase:get(ggd.GlobalSystemFlags__Mine99MissionMmanaging) and L7_69 == true and L3_65 and false == false then
        A0_62:debugPrint("\227\131\128\227\130\164\227\130\162\227\131\173\227\130\176\232\161\168\231\164\186\228\184\173\227\129\171\227\129\138\233\161\140\229\164\177\230\149\151\227\130\146\229\150\176\227\130\137\227\129\163\227\129\159\227\129\159\227\130\129\227\128\129\227\131\128\227\130\164\227\130\162\227\131\173\227\130\176\227\130\146\230\182\136\227\129\151\227\129\190\227\129\153")
        Fn_actionDialogCancel(L3_65)
      end
      if L11_73 == nil then
        A0_62:debugPrint("\227\130\187\227\131\179\227\130\181\227\131\188\227\129\140\230\182\136\227\129\136\227\129\159\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\171\227\130\136\227\130\139\229\137\138\233\153\164\227\129\174\231\155\163\232\166\150\227\130\146\227\130\132\227\130\129\227\129\190\227\129\1532")
        break
      end
      if _cage_status then
        A0_62:debugPrint("\227\130\177\227\131\188\227\130\184\227\129\140\229\139\149\227\129\141\229\135\186\227\129\151\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\171\227\130\136\227\130\139\229\137\138\233\153\164\227\129\174\231\155\163\232\166\150\227\130\146\227\130\132\227\130\129\227\129\190\227\129\1532")
        break
      end
      wait()
    end
  end)
  return true
end
function Cage.makerInOut(A0_74, A1_75, A2_76)
  if not Cage._isValid(A0_74) then
    return false
  end
  if not A0_74.marker_hdl then
    return false
  end
  if A1_75 then
    if A0_74.sensor_hdl then
      A0_74.sensor_hdl:setActive(true)
    end
    if A0_74.marker_hdl then
      A0_74.marker_hdl:playIn()
    end
  elseif A0_74.marker_hdl then
    A0_74.marker_hdl:playOut()
    if A2_76 ~= false then
      repeat
        wait()
      until A0_74.marker_hdl:isOutEnd()
    end
  end
end
function Cage.invisibleColltion(A0_77, A1_78)
  if not Cage._isValid(A0_77) then
    return false
  end
  if A0_77.collsion and A0_77.model then
    if A1_78 then
      GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, true)
      A0_77.collsion:setCollidablePermission(true)
      A0_77.model:overrideCollisionFilterLayer("Boundary")
    else
      A0_77.collsion:setCollidablePermission(false)
      A0_77.model:overrideCollisionFilterLayer(nil)
      GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, false)
    end
  end
end
function Cage.move(A0_79, A1_80, A2_81)
  if not Cage._isValid(A0_79) then
    return false
  end
  if A0_79.mov_task then
    A0_79:debugPrint("\227\129\153\227\129\167\227\129\171mov_task\227\129\175\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_79.mov_task = invokeTask(function()
    A0_79.fadein = false
    A0_79.is_move = true
    A0_79.model:setVisible(true)
    A0_79.wire:setVisible(true)
    if A0_79.wire2 then
      A0_79.wire2:setVisible(false)
    end
    if A0_79.mov_down and A0_79.mine_infinity and A0_79.wire2 then
      A0_79.wire2:setVisible(true)
      A0_79.wire:setVisible(false)
    end
    if not A0_79.mine_infinity then
      GameDatabase:set(ggd.GlobalSystemFlags__SkipResetAbility, true)
      if A2_81 ~= false then
        Fn_userCtrlGravityOff()
      end
      if Player:isFeline() then
        Player:setFeline(false, false)
      end
      Player:setEnergy(Player.kEnergy_Feline, 0, true)
      Player:setAttrTune(Player.kAttrTune_Normal)
      Player:setAbility({
        Player.kAbility_Jump,
        Player.kAbility_KickCombo,
        Player.kAbility_Dodge,
        Player.kAbility_AttrTuneSwitch
      }, false)
      Player:setEnergyInfinite(Player.kEnergy_Life, true)
      Player:setStay(false)
      Player:setGravityControlMode(false)
      A0_79:invisibleColltion(true)
      waitSeconds(1)
      A0_79.sensor_hdl = A0_79:_termGameObj(A0_79.sensor_hdl)
      A0_79:makerInOut(false)
      A0_79.marker_hdl = A0_79:_termGameObj(A0_79.marker_hdl)
      if A0_79.cage_out_sensor then
        A0_79:_setupCageOutSensor()
      end
    else
      A0_79:_setupPreventionCaughtSensor()
      A0_79.prevention_caught_task = invokeTask(function()
        local L0_82, L1_83
        L0_82 = A0_79
        L1_83 = L0_82
        L0_82 = L0_82._getCageBaseLocaterTransform
        L0_82 = L0_82(L1_83, not A0_79.mov_down)
        while true do
          L1_83 = A0_79.prevention_caught
          if L1_83 then
            L1_83 = A0_79.ctrl_node
            L1_83 = L1_83.getPos
            L1_83 = L1_83(L1_83)
            print(tostring(L0_82:DistanceTo(L1_83)))
            if L0_82:DistanceTo(L1_83) < 4.5 then
              invokeTask(function()
                Fn_catWarp()
              end)
              break
            end
          end
          L1_83 = wait
          L1_83()
        end
      end)
    end
    A0_79.in_outrange = true
    if A0_79.outrange_sensor_hdl == nil then
      A0_79:setupOutrangeSensor()
    end
    if A1_80 == true then
      A0_79.outrange_sensor_hdl:setActive(true)
    else
      A0_79.outrange_sensor_hdl:setActive(false)
    end
    if A0_79.move_func_start then
      A0_79.move_func_start(A0_79.mov_down, A1_80)
    end
    if A0_79.def_pos_y == nil then
      A0_79.def_pos_y = A0_79.ctrl_node:getPos()
      A0_79.def_pos_y = A0_79.def_pos_y.y
    end
    A0_79:_setAreaDirft(false)
    Area:setAreaFree()
    A0_79:_switchAppned()
    if A1_80 then
      A0_79:_inGamePauseMenuOn()
      mother2:sendEvent("requestEnemyManager", {target_select_off = true})
    end
    if Fn_getCatBrain() ~= nil then
      Fn_getCatBrain():clearFollowPoint()
    end
    A0_79:_move(A1_80)
    Fn_getCatBrain():setModeRidingCage(false)
    if A1_80 then
      mother2:sendEvent("requestEnemyManager", {target_select_on = true})
    end
    A0_79:_setAreaDirft(true)
    A0_79:_inGamePauseMenuOff()
    A0_79.outrange_sensor_hdl:setActive(false)
    A0_79:invisibleColltion(false)
    if A0_79.is_skip == true or A0_79.in_outrange == false then
      GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, true)
      if HUD:faderAlpha() ~= 0 then
        Fn_blackout()
      end
      A0_79:warpPlayerInSelf(XYZRotQuatD(0, -90, 0))
      wait()
      while Area:isLoading() do
        wait()
      end
      Player:setSituation(Player.kSituation_Normal, true, 0.01, false, false)
      _cage_status = false
      GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, false)
    end
    if A0_79.move_func_end then
      A0_79.move_func_end(A0_79.mov_down, A0_79.is_skip)
    end
    if (A0_79.is_skip == true or A0_79.in_outrange == false) and 0 < HUD:faderAlpha() and A0_79.fadein then
      A0_79:debugPrint("\227\130\185\227\130\173\227\131\131\227\131\151\227\129\151\227\129\159\230\153\130\227\129\174\227\131\149\227\130\167\227\131\188\227\131\137\227\130\164\227\131\179\227\129\174\228\190\157\233\160\188\227\129\140\227\129\130\227\130\139\227\129\174\227\129\167\227\131\149\227\130\167\227\131\188\227\131\137\227\130\164\227\131\179\227\129\151\227\129\190\227\129\153")
      Fn_fadein()
    end
    A0_79.fadein = false
    GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
    GameDatabase:set(ggd.GlobalSystemFlags__SkipResetAbility, false)
    Player:setEnergyInfinite(Player.kEnergy_Life, false)
    if A2_81 ~= false then
      Fn_userCtrlOn()
    end
    if A0_79.mine_infinity then
      A0_79.prevention_caught_sensor = A0_79:_termGameObj(A0_79.prevention_caught_sensor)
      A0_79.prevention_caught_task = A0_79:_aboutTask(A0_79.prevention_caught_task)
      if A0_79:setupMarker(false) then
        A0_79:makerInOut(true)
      end
      A0_79.acceleration_time = 5
      A0_79.deceleration_time = 10
    end
    A0_79.mine_infinity = false
    A0_79.mov_task = nil
    _cage_status = false
    A0_79.is_move = false
    A0_79.is_skip = false
    A0_79.in_outrange = true
  end)
end
function Cage.stop(A0_84)
  if not Cage._isValid(A0_84) then
    return false
  end
  A0_84.c_frame = A0_84.e_frame + 1
  A0_84.mov_se = A0_84:_stopSE(A0_84.mov_se)
end
function Cage.warp(A0_85, A1_86)
  local L2_87, L3_88, L4_89, L5_90, L6_91
  L2_87 = A0_85.is_skip
  if L2_87 == false then
    L2_87 = A0_85.in_outrange
    if L2_87 == true then
      L2_87 = A0_85.warp_move
      if L2_87 then
        L2_87 = A0_85.is_move
        if L2_87 then
          L3_88 = A0_85
          L2_87 = A0_85.debugPrint
          L4_89 = "\231\167\187\229\139\149\228\184\173\227\129\170\227\129\174\227\129\167\227\131\175\227\131\188\227\131\151\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147"
          L2_87(L3_88, L4_89)
          L2_87 = false
          return L2_87
        end
      end
    end
  end
  L3_88 = A0_85
  L2_87 = A0_85._getCageBaseLocaterTransform
  L4_89 = A0_85.warp_ship
  L4_89 = L2_87(L3_88, L4_89)
  if L4_89 then
    L6_91 = L4_89
    L5_90 = L4_89.appendChild
    L5_90(L6_91, A0_85.ctrl_node, true)
    L5_90 = wait
    L5_90()
    if L2_87 == nil then
      L5_90 = A0_85.ctrl_node
      L6_91 = L5_90
      L5_90 = L5_90.getTransform
      L6_91 = L5_90(L6_91)
      L3_88 = L6_91
      L2_87 = L5_90
    end
    if not A1_86 then
      L5_90 = A0_85.warp_on
      if L5_90 then
        L5_90 = A0_85.warp_pos
        if L5_90 then
          L5_90 = Vector
          L6_91 = 0
          L5_90 = L5_90(L6_91, A0_85.warp_pos, 0)
          L2_87 = L2_87 + L5_90
          L5_90 = A0_85.warp_pos
          A0_85.mov_dist = L5_90
          L5_90 = A0_85.mov_dist
          if L5_90 < 0 then
            L5_90 = A0_85.mov_dist
            L5_90 = L5_90 * -1
            A0_85.mov_dist = L5_90
          end
          A0_85.warp_on = false
          A0_85.is_warp = true
          L6_91 = A0_85
          L5_90 = A0_85.debugPrint
          L5_90(L6_91, "\229\136\176\233\129\148\232\183\157\233\155\162\227\129\190\227\129\167" .. A0_85.mov_dist .. "\227\129\171\229\164\137\230\155\180\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159")
        end
      end
    end
    L5_90 = A0_85.ctrl_node
    L6_91 = L5_90
    L5_90 = L5_90.getPos
    L5_90 = L5_90(L6_91)
    L6_91 = L2_87
    if L5_90:DistanceTo(L6_91) > 0.3 or A1_86 then
      A0_85:debugPrint("\227\131\175\227\131\188\227\131\151\229\133\136 : " .. tostring(L2_87))
      A0_85:debugPrint("\227\131\175\227\131\188\227\131\151\229\137\141 : " .. tostring(A0_85.ctrl_node:getPos()))
      A0_85.ctrl_node:setTransform(L2_87, L3_88)
      A0_85.ctrl_node:setForceMove()
      A0_85:debugPrint("\227\131\175\227\131\188\227\131\151\229\190\140 : " .. tostring(A0_85.ctrl_node:getPos()))
      A0_85:debugPrint("\227\131\175\227\131\188\227\131\151\227\129\151\227\129\190\227\129\151\227\129\159")
      GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, false)
    else
      A0_85:debugPrint("\229\136\176\233\129\148\228\189\141\231\189\174\227\129\168\228\184\128\229\174\154\232\183\157\233\155\162\228\187\165\228\184\139\227\129\170\227\129\174\227\129\167\227\131\175\227\131\188\227\131\151\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147")
    end
  end
end
function Cage.append(A0_92, A1_93)
  if A1_93 then
    if A0_92.ship_hdl then
      A0_92.ship_hdl:appendChild(A0_92.ctrl_node, true)
    end
  elseif A0_92.area_root and A0_92:_findSubAreaOrAreaRoot() then
    A0_92:_findSubAreaOrAreaRoot():appendChild(A0_92.ctrl_node, true)
  end
end
function Cage.catRidingCage(A0_94)
  local L1_95, L2_96
  L1_95 = Fn_getCatBrain
  L1_95 = L1_95()
  if L1_95 ~= nil then
    L2_96 = L1_95.setModeRidingCage
    L2_96(L1_95, true)
    L2_96 = A0_94.model
    L2_96 = L2_96.getNodeWorldPosRot
    L2_96 = L2_96(L2_96, "ve_cage_chara_position")
    L1_95:setFollowPoint(L2_96)
  end
end
function Cage.addWire(A0_97, A1_98)
  A0_97:_createWire()
  if A0_97.wire2 then
    A0_97.wire2:bind(A1_98, nil, nil, A0_97.model, nil, Vector(0, -0.1, 0))
  end
end
function Cage.switchMineWire(A0_99)
  if A0_99.warp_move and A0_99.is_move then
    A0_99:debugPrint("\231\167\187\229\139\149\228\184\173\227\129\170\227\129\174\227\129\167\227\131\175\227\130\164\227\131\164\227\131\188\227\129\174\229\136\135\227\130\138\230\155\191\227\129\136\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147")
    return false
  end
  if A0_99.wire2 then
    A0_99.wire2:setVisible(true)
    A0_99.wire:setVisible(false)
    A0_99:debugPrint("\230\142\161\230\142\152\229\160\180\229\134\133\227\129\174\227\131\175\227\130\164\227\131\164\227\131\188\227\129\171\229\164\137\227\129\136\227\129\190\227\129\151\227\129\159")
  end
end
function Cage._isValid(A0_100)
  local L1_101
  if A0_100 == nil then
    L1_101 = false
    return L1_101
  end
  L1_101 = true
  return L1_101
end
function Cage._installMethods(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107
  for L4_106, L5_107 in L1_103(L2_104) do
    if type(L5_107) == "function" then
      A0_102[L4_106] = L5_107
    end
  end
end
function Cage._termGameObj(A0_108, A1_109)
  if A1_109 then
    A1_109:try_term()
  end
  return nil
end
function Cage._stopSE(A0_110, A1_111)
  if A1_111 then
    Sound:stopSEHandle(A1_111)
  end
  return nil
end
function Cage._aboutTask(A0_112, A1_113)
  if A1_113 and A1_113:isRunning() then
    A1_113:abort()
  end
  return nil
end
function Cage._getCageBaseLocaterTransform(A0_114, A1_115)
  local L2_116, L3_117, L4_118, L5_119
  L2_116, L3_117, L4_118 = nil, nil, nil
  if A1_115 then
    L5_119 = A0_114.ship_hdl
    if L5_119 then
      L4_118 = A0_114.ship_hdl
      L5_119 = L4_118.getNodeLocalPosRot
      L3_117, L5_119 = L4_118, L5_119(L4_118, "ve_cage_01")
      L2_116 = L5_119
    end
  else
    L5_119 = A0_114.area_root
    if L5_119 then
      L5_119 = A0_114.loc_name
      L5_119 = L5_119 or "ve_cage_01"
      L4_118 = A0_114:_findSubAreaOrAreaRoot()
      L2_116, L3_117 = L4_118:getNodePosRot(L5_119, true)
      if L2_116 == nil and findGameObject2("Node", A0_114.loc_name) then
        L2_116, L3_117 = findGameObject2("Node", A0_114.loc_name):getTransform()
      end
    end
  end
  L5_119 = L2_116
  return L5_119, L3_117, L4_118
end
function Cage._findSubAreaOrAreaRoot(A0_120)
  if A0_120.area_rname == A0_120.area_name then
    return A0_120.area_root
  elseif A0_120.area_name == nil then
    return A0_120.area_root
  end
  return A0_120.area_root:findSubArea(A0_120.area_name)
end
function Cage._switchAppned(A0_121)
  if A0_121.mov_down then
    if A0_121.area_root and A0_121:_findSubAreaOrAreaRoot() then
      A0_121:_findSubAreaOrAreaRoot():appendChild(A0_121.ctrl_node, true)
    end
  elseif A0_121.ship_hdl then
    A0_121.ship_hdl:appendChild(A0_121.ctrl_node, true)
  end
end
function Cage._move(A0_122, A1_123)
  local L2_124, L3_125, L4_126, L5_127
  L3_125 = A0_122
  L2_124 = A0_122.debugPrint
  L4_126 = " === move start ==="
  L2_124(L3_125, L4_126)
  A0_122.is_warp = false
  L3_125 = A0_122
  L2_124 = A0_122._distanceMeasurement
  L2_124(L3_125)
  L3_125 = A0_122
  L2_124 = A0_122._floaterUpDown
  L2_124(L3_125)
  L2_124 = wait
  L2_124()
  L2_124 = Sound
  L3_125 = L2_124
  L2_124 = L2_124.playSEHandle
  L4_126 = "cage_down"
  L5_127 = 0.8
  L2_124 = L2_124(L3_125, L4_126, L5_127, "", A0_122.ctrl_node)
  A0_122.mov_se = L2_124
  L3_125 = A0_122
  L2_124 = A0_122._setMovementInfo
  L2_124 = L2_124(L3_125)
  if A1_123 then
    L3_125 = Camera
    L4_126 = L3_125
    L3_125 = L3_125.shake3D
    L5_127 = 0.5
    L3_125(L4_126, L5_127, 0.1, 3, Player:getPuppet():getWorldPos(), 0)
  end
  L3_125 = false
  while true do
    L4_126 = A0_122.c_frame
    L5_127 = A0_122.e_frame
    if L4_126 <= L5_127 then
      L4_126 = A0_122.ctrl_node
      L5_127 = L4_126
      L4_126 = L4_126.getTransform
      L5_127 = L4_126(L5_127)
      if A0_122.mov_down then
        if 0 > A0_122.diff_x then
          L4_126.x = L4_126.x + A0_122:_moveingTransform().x
        else
          L4_126.x = L4_126.x - A0_122:_moveingTransform().x
        end
        L4_126.y = L4_126.y - A0_122:_moveingTransform().y
        if 0 > A0_122.diff_z then
          L4_126.z = L4_126.z + A0_122:_moveingTransform().z
        else
          L4_126.z = L4_126.z - A0_122:_moveingTransform().z
        end
      else
        if 0 > A0_122.diff_x then
          L4_126.x = L4_126.x + A0_122:_moveingTransform().x
        else
          L4_126.x = L4_126.x - A0_122:_moveingTransform().x
        end
        L4_126.y = L4_126.y + A0_122:_moveingTransform().y
        if 0 > A0_122.diff_z then
          L4_126.z = L4_126.z + A0_122:_moveingTransform().z
        else
          L4_126.z = L4_126.z - A0_122:_moveingTransform().z
        end
      end
      A0_122.ctrl_node:setTransform(L4_126, L5_127)
      if L3_125 == false and A0_122.in_outrange == false then
        L3_125 = true
        A0_122:_inGamePauseMenuOff()
        A0_122:_pauseSkip()
        wait()
      end
    end
    if A0_122.is_skip ~= true then
      A0_122.c_frame = A0_122.c_frame + 1
      wait()
    end
  end
  L4_126 = A0_122.is_skip
  if L4_126 ~= true then
    L4_126 = A0_122.in_outrange
  else
    if L4_126 == false then
      L4_126 = Fn_userCtrlAllOff
      L4_126()
      L4_126 = A0_122.cege_out_sensor_hdl
      if L4_126 then
        L4_126 = A0_122.cege_out_sensor_hdl
        L5_127 = L4_126
        L4_126 = L4_126.setActive
        L4_126(L5_127, false)
      end
      L5_127 = A0_122
      L4_126 = A0_122.stop
      L4_126(L5_127)
      L5_127 = A0_122
      L4_126 = A0_122._aboutTask
      L4_126 = L4_126(L5_127, A0_122.floater_task)
      A0_122.floater_task = L4_126
      L4_126 = wait
      L4_126()
      L4_126 = A0_122.model
      L5_127 = L4_126
      L4_126 = L4_126.setFloaterFadeout
      L4_126(L5_127, 0.1)
      repeat
        L4_126 = wait
        L4_126()
        L4_126 = A0_122.model
        L5_127 = L4_126
        L4_126 = L4_126.isFloaterFadeout
        L4_126 = L4_126(L5_127)
      until not L4_126
      L5_127 = A0_122
      L4_126 = A0_122.debugPrint
      L4_126(L5_127, "\231\177\160\227\129\174\230\143\186\227\130\140\227\130\146\230\136\187\227\129\153")
      L4_126 = A0_122.model
      L5_127 = L4_126
      L4_126 = L4_126.setFloaterParams
      L4_126(L5_127, DRIFT_PARAM_CAGE)
      L4_126 = wait
      L5_127 = 5
      L4_126(L5_127)
      L4_126 = A0_122.model
      L5_127 = L4_126
      L4_126 = L4_126.setFloaterFadein
      L4_126(L5_127, 0.1)
      repeat
        L4_126 = wait
        L4_126()
        L4_126 = A0_122.model
        L5_127 = L4_126
        L4_126 = L4_126.isFloaterFadein
        L4_126 = L4_126(L5_127)
      until not L4_126
      L4_126 = A0_122.mov_down
      if L4_126 then
        A0_122.warp_ship = false
      else
        A0_122.warp_ship = true
      end
      L4_126 = Area
      L5_127 = L4_126
      L4_126 = L4_126.setAreaFree
      L4_126(L5_127)
      L5_127 = A0_122
      L4_126 = A0_122.warp
      L4_126(L5_127, true)
      L4_126 = wait
      L5_127 = 3
      L4_126(L5_127)
      L4_126 = A0_122.cege_out_sensor_hdl
      if L4_126 then
        L4_126 = A0_122.cege_out_sensor_hdl
        L5_127 = L4_126
        L4_126 = L4_126.setActive
        L4_126(L5_127, true)
      end
      L4_126 = Player
      L5_127 = L4_126
      L4_126 = L4_126.setSituation
      L4_126(L5_127, Player.kSituation_Normal, true, 0.01, false, false)
  end
  else
    L4_126 = A0_122.ctrl_node
    L5_127 = L4_126
    L4_126 = L4_126.getPos
    L4_126 = L4_126(L5_127)
    L5_127 = L4_126
    L4_126 = L4_126.DistanceTo
    L4_126 = L4_126(L5_127, L2_124)
    L5_127 = A0_122.debugPrint
    L5_127(A0_122, "\232\170\164\229\183\174 : " .. tostring(L4_126))
    if L4_126 < 0.1 then
      L5_127 = A0_122.ctrl_node
      L5_127 = L5_127.setPos
      L5_127(L5_127, L2_124)
    end
  end
  A0_122.moving_dist = 0
  L5_127 = A0_122
  L4_126 = A0_122._aboutTask
  L4_126 = L4_126(L5_127, A0_122.measurement)
  A0_122.measurement = L4_126
  if A1_123 == true then
    L4_126 = A0_122.is_skip
    if L4_126 == false then
      L4_126 = A0_122.in_outrange
      if L4_126 == true then
        L4_126 = Camera
        L5_127 = L4_126
        L4_126 = L4_126.shake3D
        L4_126(L5_127, 0.5, 0.1, 3, Player:getPuppet():getWorldPos(), 0)
      end
    end
  end
  L5_127 = A0_122
  L4_126 = A0_122._stopSE
  L4_126 = L4_126(L5_127, A0_122.mov_se)
  A0_122.mov_se = L4_126
  L4_126 = Sound
  L5_127 = L4_126
  L4_126 = L4_126.playSE
  L4_126(L5_127, "cage_land", 1)
  L4_126 = A0_122.mov_down
  if L4_126 then
    L4_126 = A0_122.wire2
    if L4_126 then
      L4_126 = A0_122.wire2
      L5_127 = L4_126
      L4_126 = L4_126.setVisible
      L4_126(L5_127, true)
      L4_126 = A0_122.wire
      L5_127 = L4_126
      L4_126 = L4_126.setVisible
      L4_126(L5_127, false)
    end
  end
  L4_126 = A0_122.mov_down
  L4_126 = not L4_126
  A0_122.mov_down = L4_126
  A0_122.mov_time = 0
  A0_122.mov_dist = 0
  A0_122.moving_dist = 0
  L5_127 = A0_122
  L4_126 = A0_122.debugPrint
  L4_126(L5_127, " === move  end ===")
end
function Cage._setAreaDirft(A0_128, A1_129)
  if A0_128.area_root and A0_128.area_root:findSubArea(A0_128.area_name) then
    A0_128.area_root:findSubArea(A0_128.area_name):setDriftEnable(A1_129)
  end
  if A0_128.ship_hdl then
    A0_128.ship_hdl:setDriftEnable(false)
  end
end
function Cage._floaterUpDown(A0_130)
  if not A0_130.floater_task then
    A0_130.floater_task = invokeTask(function()
      A0_130.model:setFloaterFadeout(5)
      repeat
        wait()
      until not A0_130.model:isFloaterFadeout()
      while not (A0_130.moving_dist > 10) do
        wait()
      end
      A0_130:debugPrint("\231\177\160\227\129\174\230\143\186\227\130\140\227\130\146\229\164\167\227\129\141\227\129\143")
      A0_130.model:setFloaterParams(DRIFT_PARAM_CAGE_UP_AND_DOWN)
      wait(5)
      A0_130.model:setFloaterFadein(3)
      repeat
        wait()
      until not A0_130.model:isFloaterFadein()
      while not (A0_130.mov_dist - A0_130.moving_dist < 20) do
        wait()
      end
      A0_130:_inGamePauseMenuOff()
      A0_130.model:setFloaterFadeout(10)
      repeat
        wait()
      until not A0_130.model:isFloaterFadeout()
      A0_130:debugPrint("\231\177\160\227\129\174\230\143\186\227\130\140\227\130\146\230\136\187\227\129\153")
      A0_130.model:setFloaterParams(DRIFT_PARAM_CAGE)
      wait(5)
      A0_130.model:setFloaterFadein(1)
      repeat
        wait()
      until not A0_130.model:isFloaterFadein()
      A0_130.floater_task = nil
    end)
  end
end
function Cage._floaterAdvance(A0_131)
  if not A0_131.floater_task then
    A0_131.floater_task = invokeTask(function()
      A0_131.model:setFloaterFadeout(10)
      repeat
        wait()
      until not A0_131.model:isFloaterFadeout()
      A0_131.model:setFloaterParams(DRIFT_PARAM_CAGE_SHIP_MOVING)
      wait(5)
      A0_131.model:setFloaterFadein(1)
      repeat
        wait()
      until not A0_131.model:isFloaterFadein()
    end)
  end
end
function Cage._distanceMeasurement(A0_132)
  if not A0_132.measurement then
    A0_132.moving_dist = 0
    A0_132.measurement = invokeTask(function()
      local L0_133, L1_134
      L0_133 = A0_132.ctrl_node
      L1_134 = L0_133
      L0_133 = L0_133.getPos
      L0_133 = L0_133(L1_134)
      L1_134 = CopyVector
      L1_134 = L1_134(L0_133)
      while true do
        if A0_132.mov_down then
          A0_132.moving_dist = L1_134:DistanceTo(L0_133)
        else
          A0_132.moving_dist = L0_133:DistanceTo(L1_134)
        end
        L1_134 = A0_132.ctrl_node:getPos()
        wait()
      end
    end)
  end
end
function Cage._setMovementInfo(A0_135)
  local L1_136, L2_137, L3_138, L4_139, L5_140
  L1_136 = wait
  L1_136()
  L2_137 = A0_135
  L1_136 = A0_135._getCageBaseLocaterTransform
  L3_138 = A0_135.mov_down
  L3_138 = not L3_138
  L1_136 = L1_136(L2_137, L3_138)
  L2_137 = A0_135.ctrl_node
  L3_138 = L2_137
  L2_137 = L2_137.getPos
  L2_137 = L2_137(L3_138)
  L3_138 = A0_135.mov_down
  if L3_138 then
    L3_138 = L1_136 - L2_137
    A0_135.mov_pos = L3_138
    L3_138 = L2_137.DistanceTo
    L3_138 = L3_138(L4_139, L5_140)
    A0_135.mov_dist = L3_138
  else
    L3_138 = L2_137 - L1_136
    L3_138 = L3_138 * -1
    A0_135.mov_pos = L3_138
    L3_138 = L1_136.DistanceTo
    L3_138 = L3_138(L4_139, L5_140)
    A0_135.mov_dist = L3_138
  end
  L3_138 = A0_135.acceleration_time
  if L3_138 > 0.01 then
    L3_138 = A0_135.acceleration_time
    L3_138 = L3_138 * 30
    A0_135.a_frame = L3_138
  end
  L3_138 = A0_135.deceleration_time
  if L3_138 > 0.01 then
    L3_138 = A0_135.deceleration_time
    L3_138 = L3_138 * 30
    A0_135.d_frame = L3_138
  end
  L3_138 = 0
  if L4_139 > 0 then
    for _FORV_7_ = 0, A0_135.a_frame do
      L3_138 = L3_138 + 0.03333333333333333 * (_FORV_7_ / A0_135.a_frame * (_FORV_7_ / A0_135.a_frame)) * A0_135.max_speed
    end
  end
  if L4_139 > 0 then
    for _FORV_7_ = 0, A0_135.d_frame do
      L3_138 = L3_138 + 0.03333333333333333 * (_FORV_7_ / A0_135.d_frame * (2 - _FORV_7_ / A0_135.d_frame)) * A0_135.max_speed
    end
  end
  A0_135:debugPrint("ease_dist : " .. tostring(L3_138))
  A0_135:debugPrint("move_dist : " .. tostring(L5_140))
  if L5_140 > 0 then
  else
    A0_135:debugPrint("\229\138\160\233\128\159\227\131\187\230\184\155\233\128\159\230\153\130\233\150\147\228\187\165\228\184\139\227\129\174\232\183\157\233\155\162\227\129\167\227\129\153\227\128\130\227\128\128\229\138\160\233\128\159\227\131\187\230\184\155\233\128\159\227\129\174\230\153\130\233\150\147\227\130\146\232\170\191\230\149\180\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\227\128\130")
    A0_135:debugPrint("append area : " .. A0_135.ctrl_node:getParent():getName())
    A0_135:debugPrint("area_root   : " .. (A0_135.area_root and A0_135.area_root:getName() or "nil"))
    A0_135:debugPrint("loc_name    : " .. (A0_135.loc_name or "ve_cage_01"))
  end
  A0_135.mov_time = L4_139 + A0_135.acceleration_time + A0_135.deceleration_time
  A0_135.c_frame = 0
  A0_135.e_frame = math.ceil(A0_135.mov_time * 30)
  A0_135.e_frame = A0_135.e_frame
  A0_135.decel = false
  A0_135.diff_x = L2_137.x - L1_136.x
  A0_135.diff_z = L2_137.z - L1_136.z
  A0_135:debugPrint(tostring(L1_136.x) .. " : " .. L2_137.x)
  A0_135:debugPrint(tostring(L1_136.z) .. " : " .. L2_137.z)
  if A0_135.diff_x > -0.001 and A0_135.diff_x < 0.001 then
    A0_135.diff_x = 0
  end
  if A0_135.diff_z > -0.001 and A0_135.diff_z < 0.001 then
    A0_135.diff_z = 0
  end
  A0_135:debugPrint(tostring(A0_135.diff_x) .. " : " .. A0_135.diff_z)
  A0_135:debugPrint("\229\136\176\233\129\148\229\186\167\230\168\153\239\188\154" .. tostring(L1_136))
  A0_135:debugPrint("\231\143\190\229\156\168\229\186\167\230\168\153\239\188\154" .. tostring(L2_137))
  A0_135:debugPrint("\231\167\187\229\139\149\229\186\167\230\168\153\239\188\154" .. tostring(A0_135.mov_pos) .. " \231\167\187\229\139\149\230\153\130\233\150\147 :" .. A0_135.mov_time)
  return L1_136
end
function Cage._moveingTransform(A0_141)
  local L1_142, L2_143, L3_144, L4_145, L5_146
  L1_142 = Vector
  L2_143 = 0
  L3_144 = 0
  L4_145 = 0
  L1_142 = L1_142(L2_143, L3_144, L4_145)
  L2_143 = Quaternion
  L3_144 = 0
  L4_145 = 0
  L5_146 = 0
  L2_143 = L2_143(L3_144, L4_145, L5_146, 1)
  L3_144 = A0_141.acceleration_time
  if L3_144 > 0 then
    L3_144 = A0_141.c_frame
    L4_145 = A0_141.a_frame
    if L3_144 <= L4_145 then
      L3_144 = 0
      L4_145 = 0
      L5_146 = A0_141.diff_x
      if L5_146 < 0 then
        L5_146 = A0_141.diff_x
        L5_146 = L5_146 / A0_141.a_frame
        L3_144 = L5_146 * -1
      else
        L5_146 = A0_141.diff_x
        L3_144 = L5_146 / A0_141.a_frame
      end
      L5_146 = A0_141.diff_z
      if L5_146 < 0 then
        L5_146 = A0_141.diff_z
        L5_146 = L5_146 / A0_141.a_frame
        L4_145 = L5_146 * -1
      else
        L5_146 = A0_141.diff_z
        L4_145 = L5_146 / A0_141.a_frame
      end
      L5_146 = A0_141.c_frame
      L5_146 = L5_146 / A0_141.a_frame
      L1_142 = Vector(L3_144, 0.03333333333333333 * (L5_146 * L5_146) * A0_141.max_speed, L4_145)
    end
  else
    L3_144 = A0_141.e_frame
    L4_145 = A0_141.d_frame
    L3_144 = L3_144 - L4_145
    L4_145 = A0_141.c_frame
    if L3_144 <= L4_145 then
      L3_144 = A0_141.decel
      if L3_144 == false then
        L4_145 = A0_141
        L3_144 = A0_141._getCageBaseLocaterTransform
        L5_146 = A0_141.mov_down
        L5_146 = not L5_146
        L3_144 = L3_144(L4_145, L5_146)
        L4_145 = A0_141.ctrl_node
        L5_146 = L4_145
        L4_145 = L4_145.getPos
        L4_145 = L4_145(L5_146)
        L5_146 = 0
        for _FORV_9_ = 1, A0_141.d_frame do
          L5_146 = L5_146 + 0.03333333333333333 * (_FORV_9_ / A0_141.d_frame * (2 - _FORV_9_ / A0_141.d_frame)) * A0_141.max_speed
        end
        A0_141.diff_x = L4_145.x - L3_144.x
        if A0_141.mov_down then
          A0_141.diff_y = L4_145.y - L3_144.y - L5_146
        else
          A0_141.diff_y = L3_144.y - L4_145.y - L5_146
        end
        A0_141.diff_z = L4_145.z - L3_144.z
        A0_141.decel = true
      end
      L3_144 = 0
      L4_145 = 0
      L5_146 = 0
      if 0 > A0_141.diff_x then
        L3_144 = A0_141.diff_x / A0_141.d_frame * -1
      else
        L3_144 = A0_141.diff_x / A0_141.d_frame
      end
      if A0_141.diff_y < -0.01 or A0_141.diff_y > 0.01 then
        L4_145 = A0_141.diff_y / A0_141.d_frame
      end
      if 0 > A0_141.diff_z then
        L5_146 = A0_141.diff_z / A0_141.d_frame * -1
      else
        L5_146 = A0_141.diff_z / A0_141.d_frame
      end
      L1_142 = Vector(L3_144, 0.03333333333333333 * ((A0_141.e_frame - A0_141.c_frame) / A0_141.d_frame * (2 - (A0_141.e_frame - A0_141.c_frame) / A0_141.d_frame)) * A0_141.max_speed + L4_145, L5_146)
    else
      L3_144 = Vector
      L4_145 = 0
      L5_146 = A0_141.max_speed
      L5_146 = 0.03333333333333333 * L5_146
      L3_144 = L3_144(L4_145, L5_146, 0)
      L1_142 = L3_144
    end
  end
  A0_141.m_pos = L1_142
  A0_141.m_rot = L2_143
  L3_144 = L1_142
  L4_145 = L2_143
  return L3_144, L4_145
end
function Cage._setupCageOutSensor(A0_147)
  local L1_148, L2_149, L3_150
  L2_149 = A0_147
  L1_148 = A0_147._checkBaseNode
  L1_148 = L1_148(L2_149)
  if not L1_148 then
    L1_148 = false
    return L1_148
  end
  L1_148 = A0_147.cege_out_sensor_hdl
  if L1_148 then
    L2_149 = A0_147
    L1_148 = A0_147.debugPrint
    L3_150 = "\227\129\153\227\129\167\227\129\171cageOutSensor\227\129\175\228\189\156\230\136\144\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\153"
    L1_148(L2_149, L3_150)
    L1_148 = true
    return L1_148
  end
  L1_148 = A0_147.name
  L2_149 = "_markerOnSensor"
  L1_148 = L1_148 .. L2_149
  L2_149 = L1_148
  L3_150 = "_OnLeave"
  L2_149 = L2_149 .. L3_150
  L3_150 = _G
  L3_150[L2_149] = function()
    invokeTask(function()
      A0_147.cege_out_sensor_hdl = A0_147:_termGameObj(A0_147.cege_out_sensor_hdl)
      while A0_147.is_move do
        wait()
      end
      if A0_147:setupMarker(false) then
        A0_147:makerInOut(true)
      end
    end)
  end
  L3_150 = createGameObject2
  L3_150 = L3_150("PlayerSensor")
  L3_150:setName(L1_148)
  L3_150:setDetectBehavior(1)
  L3_150:addBox(Vector(2, 3, 2))
  L3_150:setOnLeave(L2_149)
  A0_147.base_node:appendChild(L3_150)
  L3_150:setPos(Vector(0, 1.5, 0))
  L3_150:try_init()
  L3_150:waitForReady()
  L3_150:try_start()
  A0_147.cege_out_sensor_hdl = L3_150
  return true
end
function Cage._setupPreventionCaughtSensor(A0_151)
  local L1_152, L2_153, L3_154
  L1_152 = A0_151.prevention_caught_sensor
  if L1_152 then
    L2_153 = A0_151
    L1_152 = A0_151.debugPrint
    L3_154 = "\227\129\153\227\129\167\227\129\171\230\140\159\227\129\190\227\130\138\233\152\178\230\173\162\231\148\168\227\129\174\227\130\187\227\131\179\227\130\181\227\131\188\227\129\175\228\189\156\230\136\144\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\153"
    L1_152(L2_153, L3_154)
    L1_152 = true
    return L1_152
  end
  L1_152 = "PreventionCaughtSensorOnEnter"
  L2_153 = _G
  function L3_154(A0_155)
    local L1_156
    A0_151.prevention_caught = true
  end
  L2_153[L1_152] = L3_154
  L2_153 = "PreventionCaughtSensorOnLeave"
  L3_154 = _G
  L3_154[L2_153] = function(A0_157)
    local L1_158
    A0_151.prevention_caught = false
  end
  L3_154 = createGameObject2
  L3_154 = L3_154("PlayerSensor")
  L3_154:setName("prevention_caught_sensor")
  L3_154:setDetectBehavior(1)
  L3_154:addBox(Vector(1.7, 0.85, 1.7))
  L3_154:setPos(Vector(0, -5, 0))
  A0_151.mine_infinity_node:appendChild(L3_154)
  L3_154:setOnEnter(L1_152)
  L3_154:setOnLeave(L2_153)
  L3_154:setActive(true)
  A0_151.prevention_caught_sensor = L3_154
  L3_154:try_init()
  L3_154:waitForReadyAsync(function(A0_159)
    A0_159:try_start()
  end)
  return true
end
function Cage._checkBaseNode(A0_160)
  if not A0_160.base_node then
    A0_160:debugPrint("base_node\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167base_node\227\130\146\231\132\161\231\144\134\227\130\132\227\130\138\228\189\156\230\136\144\227\129\151\227\129\190\227\129\153")
    if A0_160:standby() then
      A0_160:debugPrint("base_node\227\129\168\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\129\140\228\189\156\230\136\144\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159")
    else
      return false
    end
  end
  return true
end
function Cage._createWire(A0_161)
  if A0_161.wire2 == nil then
    createGameObject2("Wire"):setName("ve_wire2")
    createGameObject2("Wire"):setModelName("wire_nk_01")
    createGameObject2("Wire"):setVisibleBlockEnable(false)
    createGameObject2("Wire"):setVisible(false)
    createGameObject2("Wire"):try_init()
    createGameObject2("Wire"):waitForReady()
    createGameObject2("Wire"):try_start()
    A0_161.wire2 = createGameObject2("Wire")
  end
end
function Cage._inGamePauseMenuOff(A0_162)
  HUD:setTextCommonCtrlGuide()
  HUD:menuDelCallback(HUD.kCallback_IGPauseSkip)
  HUD:menuDelCallback(HUD.kCallback_IGPauseReturn)
end
function Cage._inGamePauseMenuOn(A0_163)
  local L1_164, L2_165
  L1_164 = A0_163.mov_skip
  if L1_164 then
    function L1_164()
      A0_163:_inGamePauseMenuOff()
      A0_163:_pauseSkip()
    end
    function L2_165()
      local L0_166, L1_167
    end
    if A0_163.in_outrange == true then
      HUD:menuSetCallback(HUD.kCallback_IGPauseSkip, L1_164)
      HUD:menuSetCallback(HUD.kCallback_IGPauseReturn, L2_165)
      HUD:setTextCommonCtrlGuide("ui_keyguide_common_01")
    end
  end
end
function Cage._pauseSkip(A0_168)
  invokeTask(function()
    Fn_blackout()
    if A0_168.mov_down then
      Area:setForceSceneParams(A0_168.scene_param)
    else
      Area:setForceSceneParams("pi_a_gate_root")
    end
    Area:setSceneParametersInterpolateTime()
    GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, true)
    A0_168.is_skip = true
  end)
end
function Cage.debugPrint(A0_169, A1_170)
  print(" [  cage   ] " .. A1_170)
end
function Cage.debug(A0_171, A1_172, A2_173)
  local L3_174, L4_175, L5_176, L6_177, L7_178, L8_179
  L3_174 = 0
  function L4_175(A0_180)
    local L1_181
    L1_181 = A1_172
    if Debug:isDebugMenuOpen() then
      L1_181 = L1_181 + 200
    end
    Font:debugPrint(L1_181, 20 + 16 * L3_174, A0_180)
    L3_174 = L3_174 + 1
  end
  L5_176 = L4_175
  L6_177 = "- cage_controller -"
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "catwarp lock : "
  L7_178 = tostring
  L8_179 = GameDatabase
  L8_179 = L8_179.get
  L8_179 = L8_179(L8_179, ggd.Savedata__EventManageFlags__OutrangeLock)
  L7_178 = L7_178(L8_179, L8_179(L8_179, ggd.Savedata__EventManageFlags__OutrangeLock))
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = A0_171.ctrl_node
  if L5_176 then
    L5_176 = L4_175
    L6_177 = "append area  : "
    L7_178 = tostring
    L8_179 = A0_171.ctrl_node
    L8_179 = L8_179.getParent
    L8_179 = L8_179(L8_179)
    L8_179 = L8_179.getName
    L8_179 = L8_179(L8_179)
    L7_178 = L7_178(L8_179, L8_179(L8_179))
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "local pos    : "
    L7_178 = tostring
    L8_179 = A0_171.ctrl_node
    L8_179 = L8_179.getPos
    L8_179 = L8_179(L8_179)
    L7_178 = L7_178(L8_179, L8_179(L8_179))
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "world pos    : "
    L7_178 = tostring
    L8_179 = A0_171.ctrl_node
    L8_179 = L8_179.getWorldPos
    L8_179 = L8_179(L8_179)
    L7_178 = L7_178(L8_179, L8_179(L8_179))
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
  else
    L5_176 = L4_175
    L6_177 = "append area  : nil"
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "local pos    : nil"
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "world pos    : nil"
    L5_176(L6_177)
  end
  if A2_173 ~= 3 then
    L5_176 = L4_175
    L6_177 = "root area    : "
    L7_178 = tostring
    L8_179 = A0_171.area_rname
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "cage area    : "
    L7_178 = tostring
    L8_179 = A0_171.area_name
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "marker       : "
    L7_178 = tostring
    L8_179 = A0_171.marker_hdl
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "op_start_func: "
    L7_178 = tostring
    L8_179 = A0_171.move_func_start
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "op_end_func  : "
    L7_178 = tostring
    L8_179 = A0_171.move_func_end
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
  elseif A2_173 == 3 then
    L5_176 = A0_171.ship_hdl
    if L5_176 then
      L5_176 = A0_171.ship_hdl
      L7_178 = L5_176
      L6_177 = L5_176.getNodeLocalPosRot
      L8_179 = "ve_cage_01"
      L7_178 = L6_177(L7_178, L8_179)
      L8_179 = L4_175
      L8_179("ship cage    : " .. tostring(L6_177))
    end
    L5_176 = A0_171.area_root
    if L5_176 then
      L5_176 = A0_171.loc_name
      L5_176 = L5_176 or "ve_cage_01"
      L7_178 = A0_171
      L6_177 = A0_171._findSubAreaOrAreaRoot
      L6_177 = L6_177(L7_178)
      if L6_177 then
        L8_179 = L6_177
        L7_178 = L6_177.getNodePosRot
        L8_179 = L7_178(L8_179, L5_176, true)
        if L7_178 == nil and findGameObject2("Node", A0_171.loc_name) then
          L7_178, L8_179 = findGameObject2("Node", A0_171.loc_name):getTransform()
        end
        L4_175("area cage    : " .. tostring(L7_178))
      else
        L7_178 = L4_175
        L8_179 = "area cage    : nil"
        L7_178(L8_179)
      end
    end
  end
  L5_176 = L4_175
  L6_177 = "mov_task     : "
  L7_178 = tostring
  L8_179 = A0_171.mov_task
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "mov_direct   : "
  L7_178 = A0_171.mov_down
  if L7_178 then
    L7_178 = "down"
  else
    L7_178 = L7_178 or "up"
  end
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "mov_skip     : "
  L7_178 = tostring
  L8_179 = A0_171.mov_skip
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "mov_alighting: "
  L7_178 = tostring
  L8_179 = A0_171.mov_alighting
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "def_dist     : "
  L7_178 = tostring
  L8_179 = A0_171.def_dist
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "mov_dist     : "
  L7_178 = tostring
  L8_179 = A0_171.mov_dist
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "mov_pos      : "
  L7_178 = tostring
  L8_179 = A0_171.mov_pos
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "mov_time     : "
  L7_178 = tostring
  L8_179 = A0_171.mov_time
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "moving_dist  : "
  L7_178 = tostring
  L8_179 = A0_171.moving_dist
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "is_skip      : "
  L7_178 = tostring
  L8_179 = A0_171.is_skip
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  L5_176 = L4_175
  L6_177 = "is_move      : "
  L7_178 = tostring
  L8_179 = A0_171.is_move
  L7_178 = L7_178(L8_179)
  L6_177 = L6_177 .. L7_178
  L5_176(L6_177)
  if A2_173 == 1 then
    L5_176 = L4_175
    L6_177 = "loc_name     : "
    L7_178 = tostring
    L8_179 = A0_171.loc_name
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "warp_on      : "
    L7_178 = tostring
    L8_179 = A0_171.warp_on
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "warp_ship    : "
    L7_178 = tostring
    L8_179 = A0_171.warp_ship
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "warp_pos     : "
    L7_178 = tostring
    L8_179 = A0_171.warp_pos
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "warp_move    : "
    L7_178 = tostring
    L8_179 = A0_171.warp_move
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "cage model   : "
    L7_178 = tostring
    L8_179 = A0_171.model
    if L8_179 then
      L8_179 = A0_171.model
      L8_179 = L8_179.getName
      L8_179 = L8_179(L8_179)
    else
      L8_179 = L8_179 or "nil"
    end
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "wire         : "
    L7_178 = tostring
    L8_179 = A0_171.wire
    if L8_179 then
      L8_179 = A0_171.wire
      L8_179 = L8_179.getName
      L8_179 = L8_179(L8_179)
    else
      L8_179 = L8_179 or "nil"
    end
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "wire2        : "
    L7_178 = tostring
    L8_179 = A0_171.wire2
    if L8_179 then
      L8_179 = A0_171.wire2
      L8_179 = L8_179.getName
      L8_179 = L8_179(L8_179)
    else
      L8_179 = L8_179 or "nil"
    end
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
  elseif A2_173 == 2 then
    L5_176 = L4_175
    L6_177 = "out_sensor   : "
    L7_178 = tostring
    L8_179 = A0_171.cage_out_sensor
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "out_sensor_hdl: "
    L7_178 = tostring
    L8_179 = A0_171.cege_out_sensor_hdl
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "caught       : "
    L7_178 = tostring
    L8_179 = A0_171.prevention_caught
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
  elseif A2_173 == 3 then
    L5_176 = L4_175
    L6_177 = "max_speed    : "
    L7_178 = tostring
    L8_179 = A0_171.max_speed
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "acceleration : "
    L7_178 = tostring
    L8_179 = A0_171.acceleration_time
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "deceleration : "
    L7_178 = tostring
    L8_179 = A0_171.deceleration_time
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "c_frame      : "
    L7_178 = tostring
    L8_179 = A0_171.c_frame
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "e_frame      : "
    L7_178 = tostring
    L8_179 = A0_171.e_frame
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "a_frame      : "
    L7_178 = tostring
    L8_179 = A0_171.a_frame
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "d_frame      : "
    L7_178 = tostring
    L8_179 = A0_171.d_frame
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "m_pos        : "
    L7_178 = tostring
    L8_179 = A0_171.m_pos
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "m_rot        : "
    L7_178 = tostring
    L8_179 = A0_171.m_rot
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "diff_x       : "
    L7_178 = tostring
    L8_179 = A0_171.diff_x
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "diff_y       : "
    L7_178 = tostring
    L8_179 = A0_171.diff_y
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
    L5_176 = L4_175
    L6_177 = "diff_z       : "
    L7_178 = tostring
    L8_179 = A0_171.diff_z
    L7_178 = L7_178(L8_179)
    L6_177 = L6_177 .. L7_178
    L5_176(L6_177)
  end
end
