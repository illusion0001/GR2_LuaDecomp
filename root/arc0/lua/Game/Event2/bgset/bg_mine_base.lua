import("Ugc")
import("Player")
import("Time")
dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/bgset/bg_mine_param.lua")
_mine_param = {}
_mine99_area_configure = nil
_mine99_select_area = nil
_mine99_node_list = nil
_mine99_sub_area_warp = false
_mine99_sub_area_drift = false
_mine99_map = nil
_mine99_evb = nil
_is_mine99 = false
_mine_evb = {}
_request = {
  new_mine = nil,
  switch_area = nil,
  warp_mine = nil
}
function createMineArea(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
  local L6_6
  L6_6 = print
  L6_6(" | mi base | new mine area is :" .. A0_0)
  L6_6 = createGameObject2
  L6_6 = L6_6("Area")
  L6_6:setName(A0_0)
  setAreaRootHandle("mine", L6_6)
  if A3_3 then
    L6_6:setDriftParams(A3_3)
  end
  L6_6:setDriftInherit(true)
  L6_6:setDriftEnable(false)
  if A2_2 and A2_2 ~= "None" then
    L6_6:setAreaGroup(A2_2, true)
  end
  if A4_4 == false then
    GameDatabase:set(ggd.GlobalSystemFlags__AreaDrift, false)
  else
    GameDatabase:set(ggd.GlobalSystemFlags__AreaDrift, true)
  end
  if A1_1 then
    L6_6:setSceneParameters(A1_1)
    if A5_5 then
      Area:setForceSceneParams(A1_1)
    else
      Area:setForceSceneParams()
    end
  else
    Area:setForceSceneParams()
  end
  return L6_6
end
function createArea()
  local L0_7
  L0_7 = _mine_base_tbl
  L0_7 = L0_7[g_own:getName()]
  _mine_param = L0_7
  L0_7 = createGameObject2
  L0_7 = L0_7("Area")
  _gate = L0_7
  L0_7 = _gate
  L0_7 = L0_7.setName
  L0_7(L0_7, "pi_a_gate_root")
  L0_7 = _gate
  L0_7 = L0_7.setDriftEnable
  L0_7(L0_7, false)
  L0_7 = createMineArea
  L0_7 = L0_7(_mine_param.area, _mine_param.scene, _mine_param.mine_map, _drift_param, _mine_param.drift)
  _mine = L0_7
  L0_7 = GameDatabase
  L0_7 = L0_7.get
  L0_7 = L0_7(L0_7, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if GameDatabase:get(ggd.GlobalSystemFlags__Demo) and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= "None" and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= "" and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= nil then
    L0_7 = GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName)
  end
  for _FORV_4_, _FORV_5_ in ipairs(_mine_param.mission) do
    if L0_7 == _FORV_5_ then
      if L0_7 == "ep02_b" then
        GameDatabase:set(ggd.Savedata__CreneShipFlags__ShipName, "ve_crane_root")
      elseif L0_7 == "sm28_b" or L0_7 == "sm48_b" then
        GameDatabase:set(ggd.Savedata__CreneShipFlags__ShipName, "g1_crane_pd_01")
      end
    end
  end
  if GameDatabase:get(ggd.Savedata__CreneShipFlags__ShipName) == "ve_crane_root" then
    _ship, _wall, _rudder, _lever = createCraneShipJir()
  else
    _ship, _wall, _rudder, _lever = createCraneShipHex()
  end
  _ship:setAreaGroup(_mine_param.gate_map, true)
  _ship:setDriftEnable(false)
  setAreaRootHandle("ship", _ship)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  _mine_cage_node = createGameObject2("Node")
  _mine_ship_node = createGameObject2("Node")
  _mine_gate_node = createGameObject2("Node")
  _mine_cage_node:setName("mine_cage_node")
  _mine_ship_node:setName("mine_ship_node")
  _mine_gate_node:setName("mine_gate_node")
end
function setAreaDetail()
  local L0_8, L1_9, L2_10
  L0_8 = Area
  L1_9 = L0_8
  L0_8 = L0_8.getWorldRoot
  L0_8 = L0_8(L1_9)
  L2_10 = L0_8
  L1_9 = L0_8.appendChild
  L1_9(L2_10, _mine_cage_node)
  L2_10 = L0_8
  L1_9 = L0_8.appendChild
  L1_9(L2_10, _mine_ship_node)
  L2_10 = L0_8
  L1_9 = L0_8.appendChild
  L1_9(L2_10, _mine_gate_node)
  L1_9 = wireBind
  L2_10 = _cage
  L1_9(L2_10, _wire, _ship, "wire_nk_01")
  L1_9 = warpShipObject
  L2_10 = _ship
  L1_9(L2_10, _cage_base, _rudder, _lever)
  L1_9 = warpShipStartPos
  L2_10 = _ship
  L2_10 = L1_9(L2_10, _mine, _mine_param.cage_area, "ve_cage_01", _mine_param.dist)
  _gate:setTransform(L1_9 + Vector(0, _mine_param.dist, 0), L2_10)
  _mine_ship_node:setWorldTransform(_ship:getWorldTransform())
  _mine_gate_node:setTransform(L1_9 + Vector(0, _mine_param.dist, 0), L2_10)
  _gate:setForceMove()
  _mine_ship_node:setForceMove()
  _mine_gate_node:setForceMove()
  L1_9 = wait
  L1_9()
  L1_9 = _mine
  L2_10 = L1_9
  L1_9 = L1_9.findSubArea
  L1_9 = L1_9(L2_10, _mine_param.cage_area)
  L2_10 = L1_9
  L1_9 = L1_9.getNodePosRot
  L2_10 = L1_9(L2_10, "ve_cage_01", false)
  _mine_cage_node:setWorldTransform(L1_9, L2_10)
  _mine_cage_node:setForceMove()
  L1_9 = GameDatabase
  L2_10 = L1_9
  L1_9 = L1_9.get
  L1_9 = L1_9(L2_10, ggd.Savedata__EventManageFlags__CurrentMissionName)
  L2_10 = GameDatabase
  L2_10 = L2_10.get
  L2_10 = L2_10(L2_10, ggd.GlobalSystemFlags__Demo)
  if L2_10 then
    L2_10 = GameDatabase
    L2_10 = L2_10.get
    L2_10 = L2_10(L2_10, ggd.Savedata__EventManageFlags__ReadyMissionName)
    if L2_10 ~= "None" and L2_10 ~= "" and L2_10 ~= nil then
      L1_9 = L2_10
    end
  end
  L2_10 = true
  for _FORV_6_, _FORV_7_ in ipairs(_mine_param.mission) do
    if L1_9 == _FORV_7_ then
      L2_10 = false
      break
    end
  end
  if string.find(L1_9, "mine99") then
  end
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle2", {
      ship = _ship,
      wall = _wall,
      rudder = _rudder,
      lever = _lever,
      cage_base = _cage_base,
      cage = _cage,
      wire = _wire,
      area = _mine,
      base_area_name = _mine_param.cage_area,
      gate = _gate,
      scene_param = _mine_param.scene
    })
    Fn_getGameObject("craneShipManager"):sendEvent("request", {
      ship = {
        standby = true,
        destination_id = _mine_param.id
      },
      cage = {
        standby = true,
        set_cage_down = not L2_10
      },
      gstm = {
        standby = true,
        run = false,
        cityblock = _mine_param.cityblock,
        gs_type = _mine_param.gs_type,
        set_mine_gate = not false
      }
    })
  end
  setDriftParamsSubArea(_mine, _drift_sub_table, _drift_sub_param)
  setDriftParamsUniqueArea(_mine, _drift_unique)
  if string.find(L1_9, "mine99") then
    _ship:setEffectiveness(false, true)
    _gate:setEffectiveness(false, true)
    if _lever then
      _lever:setActive(false)
    end
    if _rudder then
      _rudder:setActive(false)
    end
    setupNewMine(L1_9)
  else
    setupMineEvb(_mine_param.evb)
    if L2_10 == false then
      Area:setForceSceneParams("pi_a_gate_root")
    end
    switchArea(L2_10)
  end
  invokeSystemTask(function()
    while not _exit_sandbox do
      if _request.new_mine then
        setupNewMine(_request.new_mine)
        _request.new_mine = nil
      end
      if _request.switch_area ~= nil then
        switchArea(_request.switch_area)
        _request.switch_area = nil
      end
      if _request.warp_mine ~= nil then
        warpMine(_request.warp_mine)
        _request.warp_mine = nil
      end
      if _request.pi_a_gate_sensor ~= nil then
        piGateSensor(_request.pi_a_gate_sensor)
        _request.pi_a_gate_sensor = nil
      end
      wait()
    end
  end)
end
function requestBgSet(A0_11)
  local L1_12, L2_13
  L1_12 = A0_11.switchArea
  if L1_12 ~= nil then
    L1_12 = _request
    L2_13 = A0_11.switchArea
    L1_12.switch_area = L2_13
  end
  L1_12 = A0_11.newMine
  if L1_12 ~= nil then
    L1_12 = _request
    L2_13 = A0_11.newMine
    L1_12.new_mine = L2_13
  end
  L1_12 = A0_11.warpMine
  if L1_12 ~= nil then
    L1_12 = _request
    L2_13 = A0_11.warpMine
    L1_12.warp_mine = L2_13
  end
  L1_12 = A0_11.pi_a_gate_sensor
  if L1_12 ~= nil then
    L1_12 = _request
    L2_13 = A0_11.pi_a_gate_sensor
    L1_12.pi_a_gate_sensor = L2_13
  end
  L1_12 = A0_11.mine_evb
  if L1_12 ~= nil then
    L1_12 = _request
    L2_13 = A0_11.mine_evb
    L1_12.mine_evb = L2_13
  end
end
function getBgSetInfomation(A0_14)
  local L1_15
  L1_15 = A0_14.isNewMine
  if L1_15 then
    L1_15 = _request
    L1_15 = L1_15.new_mine
    if L1_15 == nil then
      L1_15 = true
    else
      L1_15 = L1_15 or false
    end
    return L1_15
  end
  L1_15 = A0_14.isWarpFinish
  if L1_15 then
    L1_15 = _request
    L1_15 = L1_15.warp_mine
    if L1_15 == nil then
      L1_15 = true
    else
      L1_15 = L1_15 or false
    end
    return L1_15
  end
  L1_15 = A0_14.isEvbFinish
  if L1_15 then
    L1_15 = _request
    L1_15 = L1_15.mine_evb
    if L1_15 == nil then
      L1_15 = true
    else
      L1_15 = L1_15 or false
    end
    return L1_15
  end
  L1_15 = false
  return L1_15
end
function exitBgset()
  if _mine_cage_node then
    _mine_cage_node:try_term()
  end
  if _mine_ship_node then
    _mine_ship_node:try_term()
  end
  if _mine_gate_node then
    _mine_gate_node:try_term()
  end
  _mine_cage_node = nil
  _mine_ship_node = nil
  _mine_gate_node = nil
end
function piGateSensor(A0_16)
  local L1_17
  L1_17 = nil
  L1_17 = findGameObject2("PlayerSensor", "pccubesensor2_city_block_st")
  if L1_17 then
    L1_17:setActive(A0_16)
  end
  L1_17 = findGameObject2("PlayerSensor", "pcspheresensor2_gate_outrange")
  if L1_17 then
    L1_17:setActive(A0_16)
  end
  L1_17 = findGameObject2("PlayerSensor", "pcspheresensor2_gate_warning")
  if L1_17 then
    L1_17:setActive(A0_16)
  end
end
function switchArea(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25
  if A0_18 then
    L1_19 = _mine
    L1_19 = L1_19.getDescendant
    L1_19 = L1_19(L2_20, L3_21)
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    for L5_23, L6_24 in L2_20(L3_21) do
      L7_25 = L6_24.getName
      L7_25 = L7_25(L6_24)
      if not _drift_disable and not L7_25 == _mine_param.cage_area then
        L6_24:setDriftEnable(true)
      end
      if _is_mine99 == false then
        L6_24:setEffectiveness(true, true)
        print(" | mi base | switchArea " .. L7_25 .. "\227\130\146\232\161\168\231\164\186")
      else
        if string.find(L7_25, "root") then
          L6_24:setDriftEnable(false)
          print(" | mi base | switchArea " .. L7_25 .. "\227\129\175root\227\129\170\227\129\174\227\129\167drift\227\129\149\227\129\155\227\129\190\227\129\155\227\130\147")
        elseif _mine99_sub_area_drift then
          L6_24:setDriftEnable(true)
          print(" | mi base | switchArea " .. L7_25 .. "drift\227\130\146\230\156\137\229\138\185\227\129\171")
        else
          L6_24:setDriftEnable(false)
          print(" | mi base | switchArea " .. L7_25 .. "drift\227\130\146\231\132\161\229\138\185\227\129\171")
        end
        if _mine99_sub_area_warp == false then
          L6_24:setEffectiveness(true, true)
          print(" | mi base | switchArea " .. L7_25 .. "\227\129\175\227\131\169\227\131\179\227\131\128\227\131\160\233\133\141\231\189\174\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\232\161\168\231\164\186")
        else
          print(" | mi base | \231\132\161\233\153\144\230\142\161\230\142\152\227\129\174\227\130\168\227\131\170\227\130\162\227\129\175warpMine()\227\129\167\229\136\135\227\130\138\230\155\191\227\129\136\227\130\139\227\129\174\227\129\167" .. L7_25 .. "\227\129\174setEffectiveness\227\130\146\229\164\137\230\155\180\227\129\151\227\129\190\227\129\155\227\130\147")
        end
      end
    end
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    if L2_20 then
      L2_20(L3_21, L4_22)
    end
    if L2_20 then
      L2_20(L3_21, L4_22)
    end
    if L2_20 then
      if L2_20 then
        L5_23 = _mine99_map
        L2_20(L3_21, L4_22, L5_23)
      else
        L5_23 = "None"
        L2_20(L3_21, L4_22, L5_23)
      end
    else
      L5_23 = _mine_param
      L5_23 = L5_23.mine_map
      L2_20(L3_21, L4_22, L5_23)
    end
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    L2_20()
    if L2_20 then
      if L2_20 then
        L2_20(L3_21)
      end
    else
      L2_20(L3_21)
    end
  else
    L1_19 = _mine
    L1_19 = L1_19.getDescendant
    L1_19 = L1_19(L2_20, L3_21)
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    for L5_23, L6_24 in L2_20(L3_21) do
      L7_25 = L6_24.setDriftEnable
      L7_25(L6_24, false)
      L7_25 = L6_24.setEffectiveness
      L7_25(L6_24, false, true)
      L7_25 = print
      L7_25(" | mi base | switchArea " .. L6_24:getName() .. "\227\130\146\233\157\158\232\161\168\231\164\186")
    end
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    if L2_20 then
      L2_20(L3_21, L4_22)
    end
    if L2_20 then
      L2_20(L3_21, L4_22)
    end
    L5_23 = true
    L2_20(L3_21, L4_22, L5_23)
    L2_20()
    _warning_cnt = 0
    _inrange_cnt = 0
    L5_23 = _mine_param
    L5_23 = L5_23.gate_map
    L2_20(L3_21, L4_22, L5_23)
  end
end
function setupNewMine(A0_26)
  local L1_27, L2_28, L3_29
  L1_27, L2_28, L3_29 = nil, nil, nil
  Area:setAnimMoveDriftEnable(false, false, false)
  GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, false)
  wait()
  HUD:setInvisibleMapAreaAllClear()
  if _mine:findSubArea(_mine_param.cage_area) then
    _mine_cage_pos = _mine:findSubArea(_mine_param.cage_area):getNodePosRot("ve_cage_01")
  end
  _mine99_area_configure = nil
  _mine:try_term()
  termMineEvb()
  if _mine99_table[A0_26] == nil then
    _is_mine99 = false
    _mine = createMineArea(_mine_param.area, _mine_param.scene, _mine_param.mine_map, _drift_param, _mine_param.drift, false)
    if _mine_param.drift == false then
      Area:setAnimMoveDriftEnable(false, false, false)
      GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, false)
    else
      Area:setAnimMoveDriftEnable(true, true, true)
      GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, true)
    end
    _mine:try_init()
    _mine:waitForReady()
    _mine:try_start()
    GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, true)
    _warning_cnt = 0
    _inrange_cnt = 0
    L1_27 = _drift_sub_table
    L2_28 = _drift_sub_param
    L3_29 = _drift_unique
  else
    _is_mine99 = true
    _mine = createMineArea(_mine99_table[A0_26].area, _mine99_table[A0_26].scene, _mine99_table[A0_26].map, _mine99_table[A0_26].drift_param.main, _mine99_table[A0_26].drift, true)
    _mine99_sub_area_drift = true
    if _mine99_table[A0_26].drift == false then
      _mine99_sub_area_drift = false
    end
    _mine99_map = _mine99_table[A0_26].map
    GameDatabase:set(ggd.Menu__MapName, _mine99_table[A0_26].map)
    _mine:try_init()
    _mine:waitForReady()
    _mine:try_start()
    GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, true)
    _warning_cnt = 0
    _inrange_cnt = 0
    _mine99_evb = _mine99_table[A0_26].evb2
    setupMineEvb(_mine99_table[A0_26].evb2)
    L1_27 = _mine99_table[A0_26].drift_param.sub
    L2_28 = _mine99_table[A0_26].drift_param.sub_prm
    L3_29 = _mine99_table[A0_26].drift_param.uni
    _mine99_area_configure, _mine99_select_area, _mine99_node_list = lotteryMine99AreaMaskVersion(_mine, _mine99_table[A0_26].evb)
    _mine99_sub_area_warp = false
    if _mine99_table[A0_26].random ~= false then
      _mine99_sub_area_warp = true
    end
  end
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle2", {
      ship = _ship,
      wall = _wall,
      rudder = _rudder,
      lever = _lever,
      cage_base = _cage_base,
      cage = _cage,
      wire = _wire,
      area = _mine,
      base_area_name = _mine_param.cage_area,
      gate = _gate,
      scene_param = _mine99_table[A0_26].scene
    })
    Fn_getGameObject("craneShipManager"):sendEvent("request", {
      cage = {standby = true, append_ship = true},
      gstm = {
        gs_type = _mine99_table[A0_26].gs_type
      }
    })
  end
  setDriftParamsSubArea(_mine, L1_27, L2_28)
  setDriftParamsUniqueArea(_mine, L3_29)
end
function getMineRootAreaConfigure()
  local L0_30, L1_31
  L0_30 = _mine99_area_configure
  return L0_30
end
function lotteryMine99AreaMaskVersion(A0_32, A1_33)
  local L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49
  L2_34 = extractionPlacementInformation
  L3_35 = A1_33
  L2_34 = L2_34(L3_35)
  if L2_34 == nil then
    L3_35 = nil
    return L3_35
  end
  L3_35 = {}
  L4_36 = {}
  L3_35.fix = L4_36
  L4_36 = {}
  L3_35.add = L4_36
  L4_36 = getPreferentialArea
  L5_37 = tonumber
  L6_38 = string
  L6_38 = L6_38.match
  L17_49 = L6_38(L7_39, L8_40)
  L17_49 = L5_37(L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L6_38(L7_39, L8_40))
  L4_36 = L4_36(L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L5_37(L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L6_38(L7_39, L8_40)))
  L5_37 = {}
  L6_38 = {}
  for L10_42, L11_43 in L7_39(L8_40) do
    L12_44 = createGameObject2
    L12_44 = L12_44(L13_45)
    L13_45(L14_46, L15_47)
    L13_45(L14_46, L15_47)
    L16_48 = L15_47
    L16_48 = L11_43.hdl
    L17_49 = L16_48
    L16_48 = L16_48.getRotation
    L17_49 = L16_48(L17_49)
    L13_45(L14_46, L15_47, L16_48, L17_49, L16_48(L17_49))
    L13_45(L14_46, L15_47)
  end
  L7_39()
  L7_39()
  L7_39()
  L7_39(L8_40)
  for L10_42, L11_43 in L7_39(L8_40) do
    L12_44 = getUseArea
    L16_48 = L5_37
    L12_44 = L12_44(L13_45, L14_46, L15_47, L16_48)
    if L12_44 then
      L13_45(L14_46, L15_47)
      if L4_36 then
        for L16_48, L17_49 in L13_45(L14_46) do
          if L12_44.area_name == L17_49 then
            print(" l mi base l   " .. L16_48 .. " \227\129\171 " .. L17_49 .. " \227\129\140\233\133\141\231\189\174\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\229\175\190\232\177\161\227\130\168\227\131\170\227\130\162\227\129\139\227\130\137\230\142\146\233\153\164\227\129\151\227\129\190\227\129\153")
            table.remove(L4_36, L16_48)
            break
          end
        end
      end
      L13_45(L14_46, L15_47)
    else
      L16_48 = " \227\129\171\227\129\175\233\133\141\231\189\174\227\129\167\227\129\141\227\130\139\227\130\168\227\131\170\227\130\162\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147"
      L13_45(L14_46)
    end
  end
  L7_39(L8_40)
  L7_39(L8_40)
  if L7_39 > 0 then
    for L10_42, L11_43 in L7_39(L8_40) do
      L12_44 = getUseArea
      L16_48 = L5_37
      L12_44 = L12_44(L13_45, L14_46, L15_47, L16_48)
      if L12_44 then
        L13_45(L14_46, L15_47)
        if L4_36 then
          for L16_48, L17_49 in L13_45(L14_46) do
            if L12_44.area_name == L17_49 then
              print(" l mi base l   " .. L17_49 .. " \227\129\140\233\133\141\231\189\174\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\229\175\190\232\177\161\227\130\168\227\131\170\227\130\162\227\129\139\227\130\137\230\142\146\233\153\164\227\129\151\227\129\190\227\129\153")
              table.remove(L4_36, L16_48)
              break
            end
          end
        end
        L13_45(L14_46, L15_47)
      else
        L16_48 = " \227\129\171\227\129\175\233\133\141\231\189\174\227\129\167\227\129\141\227\130\139\227\130\168\227\131\170\227\130\162\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147"
        L13_45(L14_46)
      end
    end
  else
    L7_39(L8_40)
  end
  L7_39(L8_40)
  return L7_39, L8_40, L9_41
end
function getUseArea(A0_50, A1_51, A2_52, A3_53)
  local L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60
  L4_54 = {}
  L5_55 = {}
  if L6_56 > 0 then
    for L9_59, L10_60 in L6_56(L7_57) do
      for _FORV_15_, _FORV_16_ in ipairs(A3_53) do
        if L10_60.area == _FORV_16_ then
          print(" l mi base l   " .. A0_50 .. " \227\129\139\227\130\137 " .. L10_60.area .. " \227\129\175\229\128\153\232\163\156\227\129\139\227\130\137\230\142\146\233\153\164\227\129\151\227\129\190\227\129\153")
        end
      end
      if false then
        table.insert(L5_55, L10_60)
      end
    end
  else
    L5_55 = A1_51
  end
  if L6_56 > 0 then
    for L9_59, L10_60 in L6_56(L7_57) do
      for _FORV_14_, _FORV_15_ in ipairs(A2_52) do
        if L10_60.area == _FORV_15_ then
          print(" l mi base l   " .. A0_50 .. " \227\129\175\227\128\128 " .. L10_60.area .. " \227\129\174\227\129\191\233\133\141\231\189\174\228\186\136\229\174\154\227\129\171\227\129\170\227\130\138\227\129\190\227\129\153")
          table.insert(L4_54, L10_60)
          break
        end
      end
      if not (#L4_54 > 0) then
      end
    end
  end
  if L6_56 == 0 then
    L4_54 = L5_55
  end
  if L6_56 > 0 then
    L7_57.area_name = L8_58
    L7_57.evarea_name = L8_58
    L7_57.locator_name = A0_50
    L7_57.ghost = false
    L9_59 = " l mi base l   "
    L10_60 = A0_50
    L9_59 = L9_59 .. L10_60 .. " \227\129\171\227\128\128 " .. L7_57.area_name .. " \227\130\146\233\133\141\231\189\174\227\129\151\227\129\190\227\129\153"
    L8_58(L9_59)
    return L7_57
  end
  return L6_56
end
function extractionPlacementInformation(A0_61)
  local L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74, L14_75, L15_76, L16_77, L17_78, L18_79, L19_80
  L1_62 = {}
  L2_63 = {}
  L1_62.nodes = L2_63
  L2_63 = {}
  L1_62.fix = L2_63
  L2_63 = {}
  L1_62.indefinite = L2_63
  L2_63 = loadFileAsset
  L3_64 = "evb"
  L4_65 = "evx/"
  L5_66 = A0_61
  L4_65 = L4_65 .. L5_66
  L2_63 = L2_63(L3_64, L4_65)
  if L2_63 then
    L4_65 = L2_63
    L3_64 = L2_63.wait
    L3_64(L4_65)
    L4_65 = L2_63
    L3_64 = L2_63.getRoot
    L3_64 = L3_64(L4_65)
    L5_66 = L3_64
    L4_65 = L3_64.findBundle
    L4_65 = L4_65(L5_66, L6_67)
    L5_66 = L4_65.getChildCount
    L5_66 = L5_66(L6_67)
    if L5_66 <= 0 then
      return L6_67
    end
    for L9_70 = 1, L5_66 do
      L11_72 = L4_65
      L10_71 = L4_65.getChild
      L12_73 = L9_70
      L10_71 = L10_71(L11_72, L12_73)
      L12_73 = L10_71
      L11_72 = L10_71.getName
      L11_72 = L11_72(L12_73)
      L12_73 = string
      L12_73 = L12_73.find
      L12_73 = L12_73(L13_74, L14_75)
      if L12_73 ~= nil then
        L12_73 = table
        L12_73 = L12_73.insert
        L14_75.name = L11_72
        L14_75.hdl = L10_71
        L12_73(L13_74, L14_75)
        L12_73 = L10_71.getChildCount
        L12_73 = L12_73(L13_74)
        for L16_77 = 1, L12_73 do
          L18_79 = L10_71
          L17_78 = L10_71.getChild
          L19_80 = L16_77
          L17_78 = L17_78(L18_79, L19_80)
          L19_80 = L17_78
          L18_79 = L17_78.getName
          L18_79 = L18_79(L19_80)
          L19_80 = string
          L19_80 = L19_80.find
          L19_80 = L19_80(L18_79, "evarea2")
          if L19_80 ~= nil then
            L19_80 = {}
            L19_80.name = L18_79
            L19_80.hdl = L17_78
            L19_80.area = L17_78:getString("areaname")
            if string.find(L11_72, "__fix") then
              if L1_62.fix[L11_72] == nil then
                L1_62.fix[L11_72] = {}
              end
              table.insert(L1_62.fix[L11_72], L19_80)
            else
              if L1_62.indefinite[L11_72] == nil then
                L1_62.indefinite[L11_72] = {}
              end
              table.insert(L1_62.indefinite[L11_72], L19_80)
            end
          end
        end
      end
    end
    return L1_62
  end
  L3_64 = nil
  return L3_64
end
function getPreferentialArea(A0_81)
  local L1_82, L2_83, L3_84
  L1_82 = {}
  L2_83 = print
  L3_84 = " l mi base l \230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\227\130\168\227\131\170\227\130\162\227\130\146\229\143\150\229\190\151\233\150\139\229\167\139"
  L2_83(L3_84)
  L2_83 = 0
  L3_84 = nil
  repeat
    L2_83, L3_84 = Ugc:getDeathGhostInfo(A0_81, true)
    wait()
  until L2_83 == 0
  if L3_84 then
    for _FORV_7_, _FORV_8_ in ipairs(L3_84) do
      createGameObject2("GhostBrain"):try_init()
      createGameObject2("GhostBrain"):waitForReady()
      createGameObject2("GhostBrain"):try_start()
      createGameObject2("GhostBrain"):setFile(_FORV_8_.replay)
      if createGameObject2("GhostBrain"):getArea(0) ~= nil then
        print(" l mi base l " .. createGameObject2("GhostBrain"):getArea(0):getName() .. " \227\129\140\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\140\233\133\141\231\189\174\227\129\149\227\130\140\227\130\139\227\130\168\227\131\170\227\130\162\227\129\167\227\129\153")
        table.insert(L1_82, createGameObject2("GhostBrain"):getArea(0):getName())
      end
      createGameObject2("GhostBrain"):try_term()
    end
  end
  print(" l mi base l \230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\227\130\168\227\131\170\227\130\162\227\130\146\229\143\150\229\190\151\231\181\130\228\186\134")
  return L1_82
end
function setupMineEvb(A0_85)
  local L1_86, L2_87, L3_88, L4_89, L5_90, L6_91, L7_92
  L1_86(L2_87)
  for L4_89, L5_90 in L1_86(L2_87) do
    L6_91 = g_own
    L7_92 = L6_91
    L6_91 = L6_91.isRunning
    L6_91 = L6_91(L7_92)
    if L6_91 then
      L6_91 = loadFileAsset
      L7_92 = "evb"
      L6_91 = L6_91(L7_92, "evx/" .. L5_90)
      if L6_91 ~= nil then
        L7_92 = debugPrint
        L7_92("load evb " .. L5_90)
        L7_92 = L6_91.wait
        L7_92(L6_91)
        L7_92 = L6_91.getRoot
        L7_92 = L7_92(L6_91)
        EventData:create(L5_90, nil, L7_92):try_init()
        EventData:create(L5_90, nil, L7_92):waitForReady()
        EventData:create(L5_90, nil, L7_92):try_start()
        table.insert(_mine_evb, {
          name = L5_90,
          data = EventData:create(L5_90, nil, L7_92)
        })
      else
        L7_92 = debugPrint
        L7_92("load evb " .. L5_90 .. " nil")
      end
    else
      break
    end
  end
  L1_86(L2_87)
end
function termMineEvb()
  debugPrint("term evb start")
  for _FORV_3_, _FORV_4_ in ipairs(_mine_evb) do
    if _FORV_4_ then
      if _FORV_4_.data:isRunning() then
        debugPrint(_FORV_4_.data:getName() .. " trem")
        _FORV_4_.data:try_term()
      else
        debugPrint(_FORV_4_.data:getName() .. " kill")
        _FORV_4_.data:kill()
      end
    end
  end
  _mine_evb = {}
  debugPrint("term evb end")
end
function warpMine(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106
  L1_94 = Fn_getGameObject
  L2_95 = "craneShipManager"
  L1_94 = L1_94(L2_95)
  if L1_94 then
    L3_96 = L1_94
    L2_95 = L1_94.sendEvent
    L6_99.stop = true
    L5_98.cage = L6_99
    L2_95(L3_96, L4_97, L5_98)
  end
  L2_95 = print
  L3_96 = " | mi base | area reset"
  L2_95(L3_96)
  L2_95 = Area
  L3_96 = L2_95
  L2_95 = L2_95.setAreaFree
  L2_95(L3_96)
  L2_95 = Area
  L3_96 = L2_95
  L2_95 = L2_95.reset
  L2_95(L3_96)
  L2_95 = print
  L3_96 = "GameDeltaSec Off"
  L2_95(L3_96)
  L2_95 = Time
  L3_96 = L2_95
  L2_95 = L2_95.setInGameDeltaSec
  L2_95(L3_96, L4_97)
  L2_95 = wait
  L2_95()
  L2_95 = Player
  L3_96 = L2_95
  L2_95 = L2_95.getPuppet
  L2_95 = L2_95(L3_96)
  L3_96 = L2_95.setCollidable
  L3_96(L4_97, L5_98)
  L3_96 = mineAreaWarp
  L3_96()
  L3_96 = wait
  L3_96()
  L3_96 = _mine99_sub_area_warp
  if L3_96 then
    L3_96 = _mine
    L3_96 = L3_96.getDescendant
    L3_96 = L3_96(L4_97, L5_98)
    L4_97(L5_98, L6_99, L7_100)
    for L7_100, L8_101 in L4_97(L5_98) do
      L11_104 = false
      L9_102(L10_103, L11_104)
      L11_104 = false
      L12_105 = true
      L9_102(L10_103, L11_104, L12_105)
      L12_105 = L8_101
      L11_104 = L8_101.getName
      L11_104 = L11_104(L12_105)
      L12_105 = false
      L9_102(L10_103, L11_104, L12_105)
      L12_105 = L8_101
      L11_104 = L8_101.getName
      L11_104 = L11_104(L12_105)
      L12_105 = "\227\130\146\233\157\158\232\161\168\231\164\186"
      L9_102(L10_103)
    end
    if L5_98 then
      for L8_101, L9_102 in L5_98(L6_99) do
        L11_104 = L9_102.area_name
        L12_105 = L9_102.locator_name
        L10_103(L11_104, L12_105)
      end
      for L8_101, L9_102 in L5_98(L6_99) do
        L11_104 = L9_102.area_name
        L12_105 = L9_102.locator_name
        L10_103(L11_104, L12_105)
      end
    end
  else
    L3_96 = _mine
    L3_96 = L3_96.getDescendant
    L3_96 = L3_96(L4_97, L5_98)
    L4_97(L5_98, L6_99, L7_100)
    for L7_100, L8_101 in L4_97(L5_98) do
      L11_104 = L9_102
      L12_105 = "root"
      if L10_103 then
        L11_104 = L8_101
        L12_105 = false
        L10_103(L11_104, L12_105)
        L11_104 = " | mi base | warpMine "
        L12_105 = L9_102
        L13_106 = "\227\129\175root\227\129\170\227\129\174\227\129\167drift\227\129\149\227\129\155\227\129\190\227\129\155\227\130\147"
        L11_104 = L11_104 .. L12_105 .. L13_106
        L10_103(L11_104)
      else
        L11_104 = L8_101
        L12_105 = true
        L10_103(L11_104, L12_105)
      end
      L11_104 = L8_101
      L12_105 = true
      L13_106 = true
      L10_103(L11_104, L12_105, L13_106)
      L11_104 = L10_103
      L12_105 = L9_102
      L13_106 = true
      L10_103(L11_104, L12_105, L13_106)
      L11_104 = " | mi base | warpMine "
      L12_105 = L9_102
      L13_106 = "\227\130\146\232\161\168\231\164\186 \227\130\170\227\131\188\227\131\136\227\130\187\227\131\188\227\131\150\227\129\167\231\155\180\230\142\165\229\133\165\227\129\163\227\129\159\230\153\130\227\129\171\229\156\176\229\189\162\227\129\140\231\132\161\227\129\143\227\129\170\227\130\139"
      L11_104 = L11_104 .. L12_105 .. L13_106
      L10_103(L11_104)
    end
  end
  L3_96 = findGameObject2
  L3_96 = L3_96(L4_97, L5_98)
  L5_98(L6_99, L7_100)
  L5_98(L6_99, L7_100)
  L5_98(L6_99, L7_100, L8_101)
  L5_98(L6_99)
  L5_98(L6_99)
  L5_98(L6_99)
  L7_100(L8_101, L9_102)
  L7_100(L8_101, L9_102)
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101)
  L13_106 = L9_102(L10_103)
  L7_100(L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L9_102(L10_103))
  L13_106 = L9_102(L10_103)
  L7_100(L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L9_102(L10_103))
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101, L9_102, L10_103)
  if L7_100 then
    if L7_100 then
      L11_104 = A0_93.sb_name
      L7_100.y = L9_102
      L11_104 = L7_100
      L12_105 = L8_101
      L9_102(L10_103, L11_104, L12_105)
    end
  else
    L13_106 = L9_102(L10_103)
    L7_100(L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L9_102(L10_103))
  end
  L7_100(L8_101)
  L11_104 = L10_103
  L13_106 = L10_103(L11_104)
  L7_100(L8_101)
  L13_106 = L9_102(L10_103)
  L7_100(L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L9_102(L10_103))
  L7_100(L8_101)
  L11_104 = L10_103
  L13_106 = L10_103(L11_104)
  L7_100(L8_101)
  if L7_100 then
    if L7_100 then
      L7_100(L8_101)
      L7_100.y = 0
      L8_101(L9_102, L10_103)
      L8_101(L9_102)
      L11_104 = _mine
      L12_105 = L11_104
      L11_104 = L11_104.getWorldPos
      L13_106 = L11_104(L12_105)
      L8_101(L9_102)
    end
  end
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101)
  L7_100(L8_101, L9_102)
  L2_95 = nil
  if L1_94 then
    L11_104 = {}
    L11_104.set_mine_infinity = A0_93
    L10_103.cage = L11_104
    L7_100(L8_101, L9_102, L10_103)
  end
  if L7_100 == false then
    L11_104 = false
    L7_100(L8_101, L9_102, L10_103, L11_104)
    L7_100(L8_101, L9_102, L10_103)
    L7_100(L8_101)
  else
    L11_104 = true
    L7_100(L8_101, L9_102, L10_103, L11_104)
    L7_100(L8_101, L9_102, L10_103)
    L7_100(L8_101)
  end
  for L11_104, L12_105 in L8_101(L9_102) do
    L13_106 = L12_105.getName
    L13_106 = L13_106(L12_105)
    if string.find(L13_106, "root") then
      L12_105:setDriftEnable(false)
      print(" | mi base | warpMine " .. L13_106 .. "\227\129\175root\227\129\170\227\129\174\227\129\167drift\227\129\149\227\129\155\227\129\190\227\129\155\227\130\147")
    else
      L12_105:setDriftEnable(true)
      print(" | mi base | warpMine " .. L13_106 .. "\227\130\146drift")
    end
  end
  if L8_101 then
    for L11_104, L12_105 in L8_101(L9_102) do
      L13_106 = L12_105.try_term
      L13_106(L12_105)
    end
  end
  _mine99_node_list = L8_101
end
function mineAreaWarp()
  print(" | mi base | area move start pos")
  _ship:setWorldTransform(_mine_ship_node:getWorldTransform())
  _gate:setWorldTransform(_mine_gate_node:getWorldTransform())
  _cage_base:setWorldTransform(_mine_cage_node:getWorldTransform())
  _ship:setForceMove()
  _gate:setForceMove()
  _cage_base:setForceMove()
end
