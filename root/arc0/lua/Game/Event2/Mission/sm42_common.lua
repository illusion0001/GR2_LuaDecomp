PHOTO_CLIENT_DIST = 6
CONTROL_ON = 0
CONTROL_OFF = 1
CONTROL_ALL_OFF = 2
CLIENT_WARNING_DIST01 = 20
CLIENT_WARNING_DIST02 = 5
CATWARP_PHASE01 = 1
CATWARP_PHASE02 = 2
CATWARP_PHASE03 = 3
CATWARP_PHASE04 = 4
CATWARP_PHASE05 = 5
TYPE_VGEM = 5
TYPE_EGEM = 4
TYPE_PGEM = 1
EVENT_CHARA_RAY_DIST = 50
EVENT_CHARA_RAY_ANGLE = 360
BIKE_IDLING = 0
BIKE_SPEED_MIN = 4
BIKE_SPEED_LOW = 8
BIKE_SPEED_MID = 12
BIKE_SPEED_HIGH = 20
BIKE_SPEED_MAX = 24
BIRD_SPEED = 10
MOVE_COURSE = 1
MOVE_CHASER = 2
MOVE_IDLING = 3
EVENT_START_DIST = 100
EVENT_FIND_SENSOR_VECT = Vector(55, 5, 55)
EVENT_KAIWA_SENSOR_VECT = Vector(5, 5, 5)
EVENT_PLAYER_NODE_VECT01 = Vector(0.1, 0.1, 0)
EVENT_PLAYER_NODE_VECT02 = Vector(0.3, 0.2, 0)
EVENT_RAY_NODE_VECT01 = Vector(10, 5, 0)
EVENT_RAY_NODE_VECT02 = Vector(-10, 5, 0)
EVENT_RAY_NODE_VECT03 = Vector(10, -5, 0)
EVENT_RAY_NODE_VECT04 = Vector(-10, -5, 0)
EVENT_WARP_NODE_VECT01 = Vector(28, 1, 0)
EVENT_WARP_NODE_VECT02 = Vector(-28, 1, 0)
_player_crossing = nil
_pc_node = nil
_bike_node = nil
_navi_set_flag = false
_warning_navi_flag = false
_warning_sensor_flag = false
_cat_warp_phase = CATWARP_PHASE01
_cat_warp_client_pos = nil
_comClearEventFlag = false
_comClearEventPlay = false
_event_bike = {
  ship = nil,
  pos_route_tbl = nil,
  route_object = nil,
  create_flag = false,
  kaiwa_end_flag = false,
  pilot01 = nil,
  pilot02 = nil,
  sensor = nil,
  direction = 0,
  event_area_flag = false,
  forcing_flag = false,
  kaiwa_flag = false
}
BIKE_PART01 = 1
BIKE_PART02 = 2
TYPE_NODE = 1
TYPE_FLY = 2
TYPE_WORLDPOS = 3
BIKE_ROOT = 1
BIKE_CRUISING = 2
BIKE_RAY = 3
BIKE_WARP = 1
BIKE_MOVE = 2
BIKE_ESCAPE = 3
RAY_MAX = 4
_comBikeShare = {
  [BIKE_ROOT] = {},
  [BIKE_CRUISING] = {},
  [BIKE_RAY] = {}
}
_comBike = {
  [BIKE_PART01] = {
    [BIKE_WARP] = {},
    [BIKE_MOVE] = {},
    [BIKE_ESCAPE] = {}
  },
  [BIKE_PART02] = {
    [BIKE_WARP] = {},
    [BIKE_MOVE] = {},
    [BIKE_ESCAPE] = {}
  }
}
function clientGrabWait(A0_0)
  local L1_1
  L1_1 = invokeTask
  L1_1 = L1_1(function()
    while true do
      if Fn_getDistanceToPlayer(A0_0) > CLIENT_WARNING_DIST01 then
        Fn_captionViewWait("sm42_09000")
        Fn_naviSet(A0_0)
        while Fn_getDistanceToPlayer(A0_0) > CLIENT_WARNING_DIST02 do
          wait()
        end
        Fn_naviKill()
      end
      wait()
    end
  end)
  Mv_NpcGrabCheckWait("sm42_client", false)
  L1_1 = Mv_safeTaskAbort(L1_1)
  Fn_naviKill()
end
function getPlayerNode()
  local L0_2, L1_3
  L0_2 = _pc_node
  return L0_2
end
function comPhotoClientWait()
  local L0_4
  L0_4 = Fn_findNpcPuppet
  L0_4 = L0_4("sm42_client")
  if L0_4:isGrabbed() == false then
    if Fn_getDistanceToPlayer(L0_4) > PHOTO_CLIENT_DIST then
      Fn_naviSet(L0_4)
    end
    while not (Fn_getDistanceToPlayer(L0_4) <= PHOTO_CLIENT_DIST) do
      wait()
    end
    Fn_naviKill()
    Fn_turnNpc("sm42_client")
    Fn_playMotionNpc("sm42_client", "stay", false)
  end
end
function comViewNaviCap(A0_5, A1_6, A2_7)
  local L3_8
  if A1_6 ~= nil then
    L3_8 = Fn_naviKill
    L3_8()
  end
  if A0_5 ~= nil then
    L3_8 = Mv_viewObjWait
    L3_8 = L3_8(A0_5)
    L3_8 = Mv_safeTaskAbort(L3_8)
    Fn_userCtrlOn()
  end
  if A1_6 ~= nil then
    L3_8 = Fn_naviSet
    L3_8(findGameObject2("Node", A1_6))
    L3_8 = waitSeconds
    L3_8(2.5)
  end
  if A2_7 ~= nil then
    L3_8 = Fn_captionView
    L3_8(A2_7)
  end
end
function comViewCapNavi(A0_9, A1_10, A2_11)
  local L3_12
  if A2_11 ~= nil then
    L3_12 = Fn_naviKill
    L3_12()
  end
  if A0_9 ~= nil then
    L3_12 = Mv_viewObjWait
    L3_12 = L3_12(A0_9)
    L3_12 = Mv_safeTaskAbort(L3_12)
    Fn_userCtrlOn()
  end
  if A1_10 ~= nil then
    L3_12 = Fn_captionViewWait
    L3_12(A1_10)
    L3_12 = waitSeconds
    L3_12(1)
  end
  if A2_11 ~= nil then
    L3_12 = Fn_naviSet
    L3_12(findGameObject2("Node", A2_11))
  end
end
function userDebugPos()
  debugTextClear()
  debugTextAdd(tostring(Fn_getPlayer():getWorldPos()))
end
function eventViewMissionNaviCap(A0_13, A1_14, A2_15, A3_16)
  local L4_17
  if A0_13 ~= nil then
    L4_17 = nil
    L4_17 = Mv_viewObjWait(A0_13)
    L4_17 = Mv_safeTaskAbort(L4_17)
    Fn_userCtrlOn()
  end
  if A1_14 ~= nil then
    L4_17 = Fn_missionViewWait
    L4_17(A1_14, 3, 1.3)
  end
  if A2_15 ~= nil then
    L4_17 = Fn_naviSet
    L4_17(findGameObject2("Node", target_navi))
  end
  L4_17 = waitSeconds
  L4_17(2.5)
  L4_17 = cap
  if L4_17 ~= nil then
    L4_17 = Fn_captionView
    L4_17(A3_16)
  end
end
function playerCoerctionStop(A0_18)
  if A0_18 == false then
    Fn_userCtrlOff()
    Fn_coercionGravityRevert()
    Player:setStay(true)
    waitSeconds(1)
    Player:setStay(false)
    if Player:isGravityControlMode() then
      Fn_coercionGravityRevert()
    end
  elseif A0_18 == true then
    print("playerCoerctionStop\227\129\167\227\129\174\230\147\141\228\189\156\228\184\141\232\131\189")
    Fn_userCtrlAllOff()
    Player:setStay(true)
    waitSeconds(1)
  end
end
function invokeClientCatwarpCheck(A0_19)
  return invokeTask(function()
    local L0_20
    L0_20 = Fn_findNpcPuppet
    L0_20 = L0_20(A0_19)
    while L0_20 ~= nil do
      while Player:getAction() ~= Player.kAction_CatWarpIn do
        wait()
      end
      while Fn_findNpcPuppet(A0_19):isGrabbed() == true do
        wait()
      end
      print("\230\177\142\231\148\168\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\189\191\231\148\168\230\153\130\227\129\174\230\149\153\230\142\136\229\135\166\231\144\134\227\129\167\227\129\174\230\147\141\228\189\156\228\184\141\232\131\189")
      Fn_userCtrlAllOff()
      waitSeconds(2)
      Fn_setGrabReleaseNpc(A0_19)
      Fn_warpNpc(A0_19, getCatWarpClientPos())
      Fn_setGrabNpc(A0_19, false, false)
      while Player:getAction() ~= Player.kAction_CatWarpOut do
        wait()
      end
      waitSeconds(1)
      Fn_userCtrlOn()
      Player:setGrabObject(L0_20)
    end
  end)
end
function setCatWarpClientPos(A0_21)
  local L1_22
  _cat_warp_client_pos = A0_21
end
function getCatWarpClientPos()
  local L0_23, L1_24
  L0_23 = _cat_warp_client_pos
  return L0_23
end
function arrayRaycastCheck(A0_25, A1_26)
  for _FORV_5_, _FORV_6_ in pairs(A0_25) do
    if Mv_raycastCameraSight(A0_25[_FORV_5_], A1_26) == true then
      return true
    end
  end
  return false
end
function arrayRaycastCheckVerB(A0_27, A1_28)
  for _FORV_5_, _FORV_6_ in pairs(A0_27) do
    if Mv_isEyesight(Fn_getPlayer(), A0_27[_FORV_5_], 45, A1_28) == true then
      return true
    end
  end
  return false
end
function comSetClearEventFlag(A0_29)
  local L1_30
  if A0_29 == true then
    _comClearEventFlag = true
  else
    _comClearEventFlag = false
  end
end
function comGetClearEventFlag()
  local L0_31, L1_32
  L0_31 = _comClearEventFlag
  return L0_31
end
function comInvokeFlagEventInit(A0_33, A1_34, A2_35, A3_36, A4_37)
  return invokeTask(function()
    local L0_38
    L0_38 = _event_bike
    L0_38.ship, _event_bike.pos_route_tbl = Mv_createScriptVehicleWait(_comBikeShare[BIKE_ROOT], A0_33, A1_34, A2_35)
    L0_38 = A4_37
    if L0_38 ~= nil then
      L0_38 = {}
      L0_38.fly = "wom01_vbike01_stay_sm21_00"
      Fn_loadNpcEventMotion(A4_37, L0_38)
    end
    L0_38 = waitSeconds
    L0_38(6)
    L0_38 = _event_bike
    L0_38 = L0_38.ship
    L0_38 = L0_38.setBaseSpeed
    L0_38(L0_38, BIKE_IDLING)
    L0_38 = _event_bike
    L0_38 = L0_38.ship
    L0_38 = L0_38.procHorn
    L0_38(L0_38, false)
    L0_38 = _event_bike
    L0_38.create_flag = true
    while true do
      L0_38 = _event_bike
      L0_38 = L0_38.create_flag
      if L0_38 == false then
        L0_38 = wait
        L0_38()
      end
    end
    L0_38 = _event_bike
    L0_38.pilot01 = Fn_findNpcPuppet(A3_36)
    L0_38 = Fn_setNpcActive
    L0_38(A3_36, true)
    L0_38 = Fn_setNpcVisible
    L0_38(A3_36, true)
    L0_38 = _event_bike
    L0_38 = L0_38.ship
    L0_38 = L0_38.setPilot
    L0_38(L0_38, Fn_findNpcPuppet(A3_36), "loc_driver1")
    L0_38 = Fn_playMotionNpc
    L0_38(A3_36, "fly")
    L0_38 = A4_37
    if L0_38 ~= nil then
      L0_38 = _event_bike
      L0_38.pilot02 = Fn_findNpcPuppet(A4_37)
      L0_38 = Fn_setNpcActive
      L0_38(A4_37, true)
      L0_38 = Fn_setNpcVisible
      L0_38(A4_37, true)
      L0_38 = _event_bike
      L0_38 = L0_38.ship
      L0_38 = L0_38.setPilot
      L0_38(L0_38, Fn_findNpcPuppet(A4_37), "loc_driver1")
      L0_38 = Fn_playMotionNpc
      L0_38(A4_37, "wom01_vbike01_stay_sm21_00")
    end
  end)
end
function comInvokeFlagEventGemWait(A0_39, A1_40, A2_41)
  return invokeTask(function()
    if comGetEventAreaFlag() == true then
      while _event_bike.ship ~= nil do
        Fn_captionView(A1_40[1], 3.5)
        Player:setStay(true)
        comReloadNode(A2_41)
        comFlagEventKaiwaSensor()
        for _FORV_4_ = 1, RAY_MAX do
          if Fn_isInSightTarget(_comBikeShare[BIKE_RAY][_FORV_4_], 1) == true then
            _event_bike.direction = 2
          end
        end
        if _FOR_.direction == 0 then
          _event_bike.direction = 1
        end
        comFlagEventWarp(_comBike[comGetCreateDirection()][BIKE_WARP][1])
        _event_bike.pos_route_tbl = _comBike[comGetCreateDirection()][BIKE_MOVE]
        comFlagEventReRoute()
        comFlagEventKaiwaDemo(A1_40)
        _event_bike.sensor:setActive(true)
        do break end
        wait()
      end
    end
  end)
end
function comFlagEventKaiwaDemo(A0_42)
  local L1_43
  L1_43 = Fn_userCtrlAllOff
  L1_43()
  L1_43 = waitSeconds
  L1_43(2.5)
  L1_43 = Fn_lookAtObject
  L1_43 = L1_43(_event_bike.ship)
  Fn_captionViewWait(A0_42[2])
  Player:setStay(false)
  Fn_userCtrlOn()
  L1_43 = Mv_safeTaskAbort(L1_43)
end
function comFlagEventMove(A0_44, A1_45)
  if A1_45 == nil then
    A1_45 = BIKE_SPEED_MID
  end
  if A0_44 == MOVE_COURSE then
    _event_bike.ship_route = Vehicle:spawnRoute(_event_bike.pos_route_tbl, g_own)
    _event_bike.ship:attach(_event_bike.ship_route)
    _event_bike.ship:setBaseSpeed(A1_45)
  elseif A0_44 == MOVE_CHASER then
    _event_bike.ship:attach(Player:getPuppet())
    _event_bike.ship:setBaseSpeed(A1_45)
  end
end
function comInitFlagEventArray(A0_46)
  local L1_47, L2_48, L3_49
  L1_47 = 1
  L2_48 = 1
  L3_49 = "locator2_flag_pilot_"
  L3_49 = L3_49 .. A0_46 .. "_01"
  if findGameObject2("Node", "locator2_flag_pilot_" .. A0_46 .. "_01") ~= nil and findGameObject2("Node", "locator2_flag_ship_" .. A0_46 .. "_01") ~= nil then
    ;({})[1] = findGameObject2("Node", "locator2_flag_pilot_" .. A0_46 .. "_01"):getWorldPos()
    ;({})[2] = findGameObject2("Node", "locator2_flag_ship_" .. A0_46 .. "_01"):getWorldPos()
    _comBikeShare[BIKE_ROOT] = {}
    print("ROOT\229\136\157\230\156\159\232\168\173\229\174\154\229\174\140\228\186\134")
  end
  L3_49 = "locator2_flag_crusing_" .. A0_46 .. "_"
  _comBikeShare[BIKE_CRUISING] = createNodeArray(L3_49, TYPE_FLY)
  L3_49 = "locator2_flag_ray_" .. A0_46 .. "_"
  _comBikeShare[BIKE_RAY] = createNodeArray(L3_49, TYPE_NODE)
  L3_49 = "locator2_flag_route01_warp_" .. A0_46 .. "_"
  _comBike[BIKE_PART01][BIKE_WARP] = createNodeArray(L3_49, TYPE_NODE)
  L3_49 = "locator2_flag_route02_warp_" .. A0_46 .. "_"
  _comBike[BIKE_PART02][BIKE_WARP] = createNodeArray(L3_49, TYPE_NODE)
  comCreateEventPlayerNode("PlayerCrossingNode_a_01")
  comCreateEventPlayerNode("PlayerCrossingNode_a_02")
  L3_49 = "PlayerCrossingNode_a_"
  _comBike[BIKE_PART01][BIKE_MOVE] = createNodeArray(L3_49, TYPE_WORLDPOS)
  L3_49 = "PlayerCrossingNode_a_"
  _comBike[BIKE_PART02][BIKE_MOVE] = createNodeArray(L3_49, TYPE_WORLDPOS)
  L3_49 = "locator2_flag_route01_escape_" .. A0_46 .. "_"
  _comBike[BIKE_PART01][BIKE_ESCAPE] = createNodeArray(L3_49, TYPE_WORLDPOS)
  L3_49 = "locator2_flag_route02_escape_" .. A0_46 .. "_"
  _comBike[BIKE_PART02][BIKE_ESCAPE] = createNodeArray(L3_49, TYPE_WORLDPOS)
end
function createNodeArray(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55
  L2_52 = {}
  L3_53 = 1
  L4_54 = ""
  L5_55 = nil
  while true do
    L4_54 = A0_50 .. string.format("%02d", L3_53)
    L5_55 = findGameObject2("Node", L4_54)
    if L5_55 ~= nil then
      print(L4_54)
      Fn_appendToPlayer(L5_55)
      if A1_51 == TYPE_FLY then
        L2_52[L3_53] = {pos = L4_54, attr = "fly"}
      elseif A1_51 == TYPE_WORLDPOS then
        L2_52[L3_53] = L5_55:getWorldPos()
      else
        L2_52[L3_53] = L4_54
      end
    else
      break
    end
    L3_53 = L3_53 + 1
    wait()
  end
  return L2_52
end
function comSetFlagEventMoveSpeed(A0_56)
  if A0_56 == nil then
    A0_56 = BIKE_SPEED_MID
  end
  _event_bike.ship:setBaseSpeed(A0_56)
  _event_bike.ship:setCurrSpeed(0)
end
function comSetFlagEvetMoveRoute(A0_57)
  local L1_58
  L1_58 = bike
  if L1_58 ~= nil then
    L1_58 = _event_bike
    L1_58.pos_route_tbl = A0_57
  end
end
function comFlagEventWarp(A0_59)
  _event_bike.ship:setWorldTransform(findGameObject2("Node", A0_59):getWorldTransform())
end
function comFlagEventReRoute()
  _event_bike.ship_route = Vehicle:spawnRoute(_event_bike.pos_route_tbl, g_own)
  _event_bike.ship:attach(_event_bike.ship_route)
  _event_bike.ship:setBaseSpeed(BIKE_SPEED_MID)
end
function comFlagEventEndIdling()
  while _event_bike.ship:getRemainingDist() < 0.5 do
    wait()
  end
  print("\n\n\n\nIDLING\233\150\139\229\167\139")
  _event_bike.ship:setBaseSpeed(BIKE_IDLING)
end
function comFlagEventKaiwaSensor()
  _event_bike.sensor = nil
  _event_bike.sensor = createGameObject2("PlayerSensor")
  _event_bike.sensor:setDetectBehavior(1)
  _event_bike.sensor:addBox(EVENT_KAIWA_SENSOR_VECT)
  _event_bike.sensor:setPos(Vector(0, 0, 0))
  _event_bike.sensor:setOnEnter("pccubesensor2_flag_event_kaiwa_sensorOnEnter")
  _event_bike.sensor:setOnLeave("pccubesensor2_flag_event_kaiwa_sensorOnLeave")
  _event_bike.sensor:setActive(false)
  _event_bike.pilot01:appendChild(_event_bike.sensor)
  _event_bike.sensor:try_init()
  _event_bike.sensor:waitForReady()
  _event_bike.sensor:try_start()
end
function comCreateEventPlayerNode(A0_60)
  _pc_node = createGameObject2("Node")
  _pc_node:setName(A0_60)
  _pc_node:setForceMove()
  _pc_node:setPos(EVENT_PLAYER_NODE_VECT01)
  _pc_node:try_init()
  _pc_node:waitForReady()
  _pc_node:try_start()
  Fn_appendToPlayer(_pc_node)
end
function comOnEventAreaFlag()
  local L1_61
  L1_61 = _event_bike
  L1_61.event_area_flag = true
end
function comOffEventAreaFlag()
  local L1_62
  L1_62 = _event_bike
  L1_62.event_area_flag = false
end
function comGetEventAreaFlag()
  local L1_63
  L1_63 = _event_bike
  L1_63 = L1_63.event_area_flag
  return L1_63
end
function invokeFlagEventRelease()
  return invokeTask(function()
    Fn_getDistanceToPlayer()
  end)
end
function comInvokeFlagEventFindRayCheck()
  return invokeTask(function()
    while Mv_isEyesight(Fn_getPlayer(), _event_bike.pilot01, EVENT_CHARA_RAY_ANGLE, EVENT_CHARA_RAY_DIST) == false do
      wait()
    end
  end)
end
function arraySightTargetCheck(A0_64)
  for _FORV_4_, _FORV_5_ in pairs(A0_64) do
    if Fn_isInSightTarget(A0_64[_FORV_4_], 1) == true then
      _event_bike.direction = 2
      return 2
    end
  end
  _event_bike.direction = 1
  return 1
end
function comGetCreateDirection()
  local L1_65
  L1_65 = _event_bike
  L1_65 = L1_65.direction
  return L1_65
end
function comCreatePTNode(A0_66, A1_67)
  _pc_node = createGameObject2("Node")
  _pc_node:setName(A0_66)
  _pc_node:setForceMove()
  _pc_node:setRot(Fn_getPlayer():getWorldRot())
  _pc_node:setPos(A1_67)
  _pc_node:try_init()
  _pc_node:waitForReady()
  _pc_node:try_start()
  _player_crossing:appendChild(_pc_node)
end
function comCreatePTNodeVerB(A0_68)
  _player_crossing = createGameObject2("Node")
  _player_crossing:setName(A0_68)
  _player_crossing:setForceMove()
  _player_crossing:setRot(Fn_getPlayer():getWorldRot())
  _player_crossing:setPos(Fn_getPlayer():getWorldPos())
  _player_crossing:try_init()
  _player_crossing:waitForReady()
  _player_crossing:try_start()
end
function comReloadNode(A0_69)
  local L1_70, L2_71, L3_72
  L1_70 = 1
  L2_71 = 1
  L3_72 = "locator2_flag_pilot_"
  L3_72 = L3_72 .. A0_69 .. "_01"
  if findGameObject2("Node", "locator2_flag_pilot_" .. A0_69 .. "_01") ~= nil and findGameObject2("Node", "locator2_flag_ship_" .. A0_69 .. "_01") ~= nil then
    ;({})[1] = findGameObject2("Node", "locator2_flag_pilot_" .. A0_69 .. "_01"):getWorldPos()
    ;({})[2] = findGameObject2("Node", "locator2_flag_ship_" .. A0_69 .. "_01"):getWorldPos()
    _comBikeShare[BIKE_ROOT] = {}
    print("ROOT\229\136\157\230\156\159\232\168\173\229\174\154\229\174\140\228\186\134")
  end
  comCreatePTNodeVerB("PlayerStand")
  comCreatePTNode("PlayerNode_Ray_01", EVENT_RAY_NODE_VECT01)
  comCreatePTNode("PlayerNode_Ray_02", EVENT_RAY_NODE_VECT02)
  comCreatePTNode("PlayerNode_Ray_03", EVENT_RAY_NODE_VECT03)
  comCreatePTNode("PlayerNode_Ray_04", EVENT_RAY_NODE_VECT04)
  L3_72 = "PlayerNode_Ray_"
  _comBikeShare[BIKE_RAY] = createNodeArray(L3_72, TYPE_NODE)
  comCreatePTNode("PlayerNode_Route01_Warp_01", EVENT_WARP_NODE_VECT01)
  L3_72 = "PlayerNode_Route01_Warp_"
  _comBike[BIKE_PART01][BIKE_WARP] = createNodeArray(L3_72, TYPE_NODE)
  comCreatePTNode("PlayerNode_Route02_Warp_01", EVENT_WARP_NODE_VECT02)
  L3_72 = "PlayerNode_Route02_Warp_"
  _comBike[BIKE_PART02][BIKE_WARP] = createNodeArray(L3_72, TYPE_NODE)
  comCreatePTNode("PlayerCrossingNode_a_01", EVENT_PLAYER_NODE_VECT01)
  comCreatePTNode("PlayerCrossingNode_a_02", EVENT_PLAYER_NODE_VECT02)
  L3_72 = "PlayerCrossingNode_a_"
  _comBike[BIKE_PART01][BIKE_MOVE] = createNodeArray(L3_72, TYPE_WORLDPOS)
  L3_72 = "PlayerCrossingNode_a_"
  _comBike[BIKE_PART02][BIKE_MOVE] = createNodeArray(L3_72, TYPE_WORLDPOS)
  comCreatePTNode("PlayerEscapeRoute01_a_01", EVENT_WARP_NODE_VECT02)
  comCreatePTNode("PlayerEscapeRoute01_a_02", EVENT_WARP_NODE_VECT02)
  comCreatePTNode("PlayerEscapeRoute02_a_01", EVENT_WARP_NODE_VECT01)
  comCreatePTNode("PlayerEscapeRoute02_a_02", EVENT_WARP_NODE_VECT01)
  L3_72 = "PlayerEscapeRoute01_a_"
  _comBike[BIKE_PART01][BIKE_ESCAPE] = createNodeArray(L3_72, TYPE_WORLDPOS)
  L3_72 = "PlayerEscapeRoute02_a_"
  _comBike[BIKE_PART02][BIKE_ESCAPE] = createNodeArray(L3_72, TYPE_WORLDPOS)
end
function invokeAutoBikeSpeed()
  if _event_bike.ship == nil then
    return false
  end
  return invokeTask(function()
    local L0_73
    L0_73 = Fn_getDistanceToPlayer
    L0_73 = L0_73(_event_bike.ship:getWorldPos())
    while _event_bike.ship ~= nil do
      L0_73 = Fn_getDistanceToPlayer(_event_bike.ship:getWorldPos())
      if _event_bike.kaiwa_flag == false then
        if L0_73 < 30 then
          comSetFlagEventMoveSpeed(BIKE_SPEED_MIN)
        else
          comSetFlagEventMoveSpeed(BIKE_SPEED_MID)
        end
        print("\233\128\159\229\186\166\229\164\137\230\155\180\228\184\173")
      else
        comSetFlagEventMoveSpeed(BIKE_SPEED_HIGH)
        print("\230\156\128\229\190\140\227\129\174\233\128\159\229\186\166\229\164\137\230\155\180")
        break
      end
      waitSeconds(3)
    end
  end)
end
function create_energy_gem(A0_74, A1_75)
  local L2_76
  L2_76 = findGameObject2
  L2_76 = L2_76("Node", A0_74)
  return invokeTask(function()
    local L0_77, L1_78, L2_79, L3_80, L4_81, L5_82
    L0_77 = nil
    while true do
      L1_78 = L2_76
      L2_79 = L1_78
      L1_78 = L1_78.getWorldPos
      L1_78 = L1_78(L2_79)
      L2_79 = Fn_getPcPosRot
      L3_80 = L2_79()
      L4_81 = L2_79.y
      L4_81 = L4_81 + 1.5
      L2_79.y = L4_81
      L4_81 = Query
      L5_82 = L4_81
      L4_81 = L4_81.setEyeSightTransform
      L4_81(L5_82, L2_79, L3_80)
      L4_81 = Query
      L5_82 = L4_81
      L4_81 = L4_81.setEyeSightAngle
      L4_81(L5_82, Deg2Rad(360))
      L4_81 = Query
      L5_82 = L4_81
      L4_81 = L4_81.setEyeSightRange
      L4_81(L5_82, A1_75)
      L4_81 = Query
      L5_82 = L4_81
      L4_81 = L4_81.raycastEyeSight
      L4_81 = L4_81(L5_82, L1_78)
      if L4_81 == nil then
        L4_81 = NormalizeVector
        L5_82 = L1_78 - L2_79
        L4_81 = L4_81(L5_82)
        L5_82 = A1_75
        L4_81 = L4_81 * L5_82
        L4_81 = L2_79 + L4_81
        if L0_77 ~= nil then
          if L0_77 ~= nil then
            L5_82 = Fn_get_distance
            L5_82 = L5_82(L4_81, L0_77)
          end
        elseif L5_82 > 10 then
          L5_82 = createGameObject2
          L5_82 = L5_82("Gem")
          L5_82:setGemModelNo(4)
          L5_82:setWorldPos(L4_81)
          if Fn_getActiveRootAreaTable() ~= nil and #Fn_getActiveRootAreaTable() > 0 and Fn_findAreaHandle(Fn_getActiveRootAreaTable()[1]) ~= nil then
            Fn_findAreaHandle(Fn_getActiveRootAreaTable()[1]):appendChild(L5_82)
          end
          L5_82:try_init()
          L5_82:waitForReady()
          L5_82:try_start()
          L0_77 = Vector(L4_81.x, L4_81.y, L4_81.z)
        end
      end
      L4_81 = waitSeconds
      L5_82 = 5
      L4_81(L5_82)
    end
  end)
end
