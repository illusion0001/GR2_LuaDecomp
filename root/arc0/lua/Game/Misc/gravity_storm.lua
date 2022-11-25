import("Camera")
GravityStorm = {}
function GravityStorm.create()
  local L0_0
  L0_0 = {}
  L0_0.gate = nil
  L0_0.run_task = nil
  L0_0.base_node = nil
  L0_0.node = {}
  L0_0.node_idx = nil
  L0_0.wire_node = nil
  L0_0.gs_name = nil
  L0_0.gs_type = 1
  L0_0.gs_current = nil
  L0_0.gs_late = nil
  L0_0.gs_out = nil
  L0_0.gs_ready = nil
  L0_0.is_stop = false
  L0_0.dist = 0
  L0_0.gs_in = false
  L0_0.gs_in_ss01 = nil
  L0_0.gs_in_ss02 = nil
  L0_0.catwarp = false
  L0_0.catwarp_ss01 = nil
  L0_0.catwarp_ss02 = nil
  L0_0.catwarp_ss03 = nil
  L0_0.shake = false
  L0_0.shake_ss01 = nil
  L0_0.shake_ss02 = nil
  L0_0.shake_ss03 = nil
  L0_0.is_down = true
  L0_0.scene_param = nil
  L0_0.city_block_name = "ui_gaiku_02_31"
  L0_0.city_block_disp = false
  GravityStorm._installMethods(L0_0)
  return L0_0
end
function GravityStorm.reset(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6
  L1_2(L2_3, L3_4)
  A0_1.run_task = L1_2
  A0_1.gs_name = nil
  A0_1.gs_type = 1
  A0_1.gs_current = L1_2
  A0_1.gs_late = L1_2
  A0_1.gs_out = L1_2
  A0_1.gs_ready = L1_2
  A0_1.base_node = L1_2
  for L4_5, L5_6 in L1_2(L2_3) do
    A0_1:_termGameObj(L5_6)
  end
  A0_1.node = L1_2
  A0_1.wire_node = L1_2
  A0_1.is_stop = false
  A0_1.dist = 0
  A0_1.is_down = true
  A0_1.gs_in = false
  A0_1.gs_in_ss = L1_2
  A0_1.catwarp = false
  A0_1.catwarp_ss01 = L1_2
  A0_1.catwarp_ss02 = L1_2
  A0_1.catwarp_ss03 = L1_2
  A0_1.shake = false
  A0_1.shake_ss01 = L1_2
  A0_1.shake_ss02 = L1_2
  A0_1.shake_ss03 = L1_2
  A0_1.city_block_name = "ui_gaiku_02_31"
  A0_1.city_block_disp = false
  A0_1.gate = nil
end
function GravityStorm.waitAvailable(A0_7)
  while not A0_7.base_node do
    wait()
  end
end
function GravityStorm.isEndStorm(A0_8)
  if not GravityStorm._isValid(A0_8) then
    return false
  end
  if A0_8.gs_name and string.find(A0_8.gs_name, "ef_ev_hole_04") ~= nil then
    return true
  end
  return false
end
function GravityStorm.isStormIn(A0_9)
  if not GravityStorm._isValid(A0_9) then
    return false
  end
  if A0_9.gs_name and (A0_9.gs_name == "ef_ev_hole_02" or A0_9.gs_name == "ef_ev_hole_03") or A0_9.gs_in then
    return true
  end
  return false
end
function GravityStorm.isRunning(A0_10)
  if not GravityStorm._isValid(A0_10) then
    return false
  end
  if A0_10.run_task then
    return true
  end
  return false
end
function GravityStorm.isBrackHole(A0_11)
  if not GravityStorm._isValid(A0_11) then
    return false
  end
  if A0_11.gs_current and A0_11.gs_current:getName() == "gs_ef_ev_bkhole_01" and A0_11.gs_current:getAlpha() >= 1 then
    return true
  end
  return false
end
function GravityStorm.getIndoorCatWarpActive(A0_12)
  if A0_12.catwarp_ss03 then
    return A0_12.catwarp_ss03:getActive()
  end
  return false
end
function GravityStorm.getStormNode(A0_13)
  local L1_14
  L1_14 = A0_13.wire_node
  return L1_14
end
function GravityStorm.getStormType(A0_15)
  local L1_16
  L1_16 = A0_15.gs_name
  return L1_16
end
function GravityStorm.setObjectHandle(A0_17, A1_18, A2_19)
  if not GravityStorm._isValid(A0_17) then
    return false
  end
  A0_17.gate = A1_18
  if A0_17.base_node then
    A1_18:appendChild(A0_17.base_node)
  end
  A0_17.scene_param = A2_19 or nil
end
function GravityStorm.setGsType(A0_20, A1_21)
  if not GravityStorm._isValid(A0_20) then
    return false
  end
  A0_20.gs_type = A1_21
end
function GravityStorm.setGsActive(A0_22, A1_23)
  local L2_24
  L2_24 = A0_22.gs_current
  if not L2_24 then
    return
  end
  L2_24 = 10
  if A1_23 then
    if A0_22.catwarp_ss02 then
      A0_22.catwarp_ss02:setActive(true)
    end
    A0_22.gs_current:setActive(true)
    A0_22.gs_current:setAlpha(1)
  else
    if A0_22.catwarp_ss02 then
      A0_22.catwarp_ss02:setActive(false)
    end
    for _FORV_6_ = 1, L2_24 do
      A0_22.gs_current:setAlpha(1 - 1 / L2_24)
    end
    _FOR_:setActive(false)
  end
end
function GravityStorm.setMineGate(A0_25)
  if A0_25.run_task and A0_25.run_task:isRunning() then
    A0_25.is_stop = true
  end
  if A0_25.gs_type == 1 then
    A0_25:_crossFade("ef_ev_hole_04", 4)
  elseif A0_25.gs_type == 2 then
    A0_25:_crossFade("ef_ev_hole_04_01", 4)
  elseif A0_25.gs_type == 3 then
    A0_25:_crossFade("ef_ev_hole_04_02", 4)
  elseif A0_25.gs_type == 4 then
    A0_25:_crossFade("ef_ev_hole_04_03", 4)
  elseif A0_25.gs_type == 5 then
    A0_25:_crossFade("ef_ev_hole_04_04", 4)
  elseif A0_25.gs_type == 6 then
    A0_25:_crossFade("ef_ev_hole_04_05", 4)
  else
    A0_25:_crossFade("ef_ev_hole_04", 4)
  end
  if A0_25.gs_in_ss then
    A0_25.gs_in_ss:setActive(false)
  end
  if A0_25.catwarp_ss01 then
    A0_25.catwarp_ss01:setActive(false)
  end
  if A0_25.catwarp_ss02 then
    A0_25.catwarp_ss02:setActive(true)
  end
  if A0_25.catwarp_ss03 then
    A0_25.catwarp_ss03:setActive(false)
  end
  if A0_25.shake_ss01 then
    A0_25.shake_ss01:setActive(false)
  end
  if A0_25.shake_ss02 then
    A0_25.shake_ss02:setActive(false)
  end
  if A0_25.shake_ss03 then
    A0_25.shake_ss03:setActive(false)
  end
end
function GravityStorm.allOff(A0_26)
  A0_26.run_task = A0_26:_aboutTask(A0_26.run_task)
  if A0_26.gs_in_ss then
    A0_26.gs_in_ss:setActive(false)
  end
  if A0_26.catwarp_ss01 and A0_26.catwarp_ss01:isRunning() then
    A0_26.catwarp_ss01:setActive(false)
  end
  if A0_26.catwarp_ss02 and A0_26.catwarp_ss02:isRunning() then
    A0_26.catwarp_ss02:setActive(false)
  end
  if A0_26.catwarp_ss03 and A0_26.catwarp_ss03:isRunning() then
    A0_26.catwarp_ss03:setActive(false)
  end
  if A0_26.shake_ss01 then
    A0_26.shake_ss01:setActive(false)
  end
  if A0_26.shake_ss02 then
    A0_26.shake_ss02:setActive(false)
  end
  if A0_26.shake_ss03 then
    A0_26.shake_ss03:setActive(false)
  end
  A0_26.gs_current = A0_26:_termGameObj(A0_26.gs_current)
end
function GravityStorm.setIndoorCatWarpOn(A0_27)
  if A0_27.gs_in_ss then
    A0_27.gs_in_ss:setActive(false)
  end
  if A0_27.catwarp_ss01 and A0_27.catwarp_ss01:isRunning() then
    A0_27.catwarp_ss01:setActive(false)
  end
  if A0_27.catwarp_ss02 and A0_27.catwarp_ss02:isRunning() then
    A0_27.catwarp_ss02:setActive(false)
  end
  if A0_27.catwarp_ss03 and A0_27.catwarp_ss03:isRunning() then
    A0_27.catwarp_ss03:setActive(true)
  end
  if A0_27.shake_ss01 then
    A0_27.shake_ss01:setActive(false)
  end
  if A0_27.shake_ss02 then
    A0_27.shake_ss02:setActive(false)
  end
  if A0_27.shake_ss03 then
    A0_27.shake_ss03:setActive(false)
  end
end
function GravityStorm.standby(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41, L14_42, L15_43
  L2_30 = GravityStorm
  L2_30 = L2_30._isValid
  L3_31 = A0_28
  L2_30 = L2_30(L3_31)
  if not L2_30 then
    L2_30 = false
    return L2_30
  end
  L2_30 = A0_28.base_node
  if L2_30 then
    L3_31 = A0_28
    L2_30 = A0_28.debugPrint
    L4_32 = "\229\159\186\230\186\150\227\129\168\227\129\170\227\130\139\227\131\142\227\131\188\227\131\137\227\129\174\230\186\150\229\130\153\227\129\175\231\181\130\228\186\134\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153"
    L2_30(L3_31, L4_32)
    L2_30 = false
    return L2_30
  end
  L3_31 = A0_28
  L2_30 = A0_28._createNode
  L4_32 = "gs_base_node"
  L5_33 = Vector
  L6_34 = 0
  L7_35 = 0
  L8_36 = 0
  L5_33 = L5_33(L6_34, L7_35, L8_36)
  L6_34 = A0_28.gate
  L2_30 = L2_30(L3_31, L4_32, L5_33, L6_34)
  L4_32 = A0_28
  L3_31 = A0_28._createNode
  L5_33 = "gs_eff_node_01"
  L6_34 = Vector
  L7_35 = 0
  L8_36 = -50
  L9_37 = 0
  L6_34 = L6_34(L7_35, L8_36, L9_37)
  L7_35 = L2_30
  L3_31 = L3_31(L4_32, L5_33, L6_34, L7_35)
  L5_33 = A0_28
  L4_32 = A0_28._createNode
  L6_34 = "gs_eff_node_02"
  L7_35 = Vector
  L8_36 = 0
  L9_37 = -400
  L10_38 = 0
  L7_35 = L7_35(L8_36, L9_37, L10_38)
  L8_36 = L2_30
  L4_32 = L4_32(L5_33, L6_34, L7_35, L8_36)
  L6_34 = A0_28
  L5_33 = A0_28._createNode
  L7_35 = "gs_eff_node_03"
  L8_36 = Vector
  L9_37 = 0
  L10_38 = -650
  L11_39 = 0
  L8_36 = L8_36(L9_37, L10_38, L11_39)
  L9_37 = L2_30
  L5_33 = L5_33(L6_34, L7_35, L8_36, L9_37)
  L7_35 = A0_28
  L6_34 = A0_28._createNode
  L8_36 = "gs_eff_node_04"
  L9_37 = Vector
  L10_38 = 0
  L11_39 = -800
  L12_40 = 0
  L9_37 = L9_37(L10_38, L11_39, L12_40)
  L10_38 = L2_30
  L6_34 = L6_34(L7_35, L8_36, L9_37, L10_38)
  L8_36 = A0_28
  L7_35 = A0_28._createNode
  L9_37 = "gs_eff_node_05"
  L10_38 = Vector
  L11_39 = 0
  L12_40 = -500
  L13_41 = 0
  L10_38 = L10_38(L11_39, L12_40, L13_41)
  L11_39 = L2_30
  L7_35 = L7_35(L8_36, L9_37, L10_38, L11_39)
  L8_36 = createGameObject2
  L9_37 = "GimmickBg"
  L8_36 = L8_36(L9_37)
  L10_38 = L8_36
  L9_37 = L8_36.setName
  L11_39 = "gs_wire_node"
  L9_37(L10_38, L11_39)
  L10_38 = L2_30
  L9_37 = L2_30.try_init
  L9_37(L10_38)
  L10_38 = L3_31
  L9_37 = L3_31.try_init
  L9_37(L10_38)
  L10_38 = L4_32
  L9_37 = L4_32.try_init
  L9_37(L10_38)
  L10_38 = L5_33
  L9_37 = L5_33.try_init
  L9_37(L10_38)
  L10_38 = L6_34
  L9_37 = L6_34.try_init
  L9_37(L10_38)
  L10_38 = L7_35
  L9_37 = L7_35.try_init
  L9_37(L10_38)
  L10_38 = L8_36
  L9_37 = L8_36.try_init
  L9_37(L10_38)
  L10_38 = L2_30
  L9_37 = L2_30.waitForReady
  L9_37(L10_38)
  L10_38 = L3_31
  L9_37 = L3_31.waitForReady
  L9_37(L10_38)
  L10_38 = L4_32
  L9_37 = L4_32.waitForReady
  L9_37(L10_38)
  L10_38 = L5_33
  L9_37 = L5_33.waitForReady
  L9_37(L10_38)
  L10_38 = L6_34
  L9_37 = L6_34.waitForReady
  L9_37(L10_38)
  L10_38 = L7_35
  L9_37 = L7_35.waitForReady
  L9_37(L10_38)
  L10_38 = L8_36
  L9_37 = L8_36.waitForReady
  L9_37(L10_38)
  L10_38 = L2_30
  L9_37 = L2_30.try_start
  L9_37(L10_38)
  L10_38 = L3_31
  L9_37 = L3_31.try_start
  L9_37(L10_38)
  L10_38 = L4_32
  L9_37 = L4_32.try_start
  L9_37(L10_38)
  L10_38 = L5_33
  L9_37 = L5_33.try_start
  L9_37(L10_38)
  L10_38 = L6_34
  L9_37 = L6_34.try_start
  L9_37(L10_38)
  L10_38 = L7_35
  L9_37 = L7_35.try_start
  L9_37(L10_38)
  L10_38 = L8_36
  L9_37 = L8_36.try_start
  L9_37(L10_38)
  A0_28.base_node = L2_30
  L9_37 = A0_28.node
  L9_37[1] = L3_31
  L9_37 = A0_28.node
  L9_37[2] = L4_32
  L9_37 = A0_28.node
  L9_37[3] = L5_33
  L9_37 = A0_28.node
  L9_37[4] = L6_34
  L9_37 = A0_28.node
  L9_37[5] = L7_35
  A0_28.wire_node = L8_36
  L10_38 = L6_34
  L9_37 = L6_34.appendChild
  L11_39 = L8_36
  L9_37(L10_38, L11_39)
  A0_28.city_block_name = A1_29
  L9_37 = _G
  function L10_38()
    A0_28.gs_in = true
    A0_28.city_block_disp = true
    if A0_28.is_down then
      Area:setSceneParametersInterpolateTime(3.5)
    else
      Area:setSceneParametersInterpolateTime(0.001)
    end
    Area:setForceSceneParams("ev_bkhole_01")
  end
  L9_37.GateSensorOnEnter = L10_38
  L9_37 = _G
  function L10_38()
    if g_own:getGameObject("bgManager") and A0_28.is_down then
      g_own:getGameObject("bgManager"):sendEvent("requestBgSet", {mine_evb = true})
    end
    if A0_28.is_down then
      Area:setSceneParametersInterpolateTime(0.001)
      Area:setForceSceneParams(A0_28.scene_param)
    else
      Area:setSceneParametersInterpolateTime(3.5)
      Area:setForceSceneParams("pi_a_gate_root")
    end
    A0_28.gs_in = false
  end
  L9_37.GateSensorOnLeave = L10_38
  L9_37 = _G
  function L10_38()
    local L0_44, L1_45
    A0_28.catwarp = false
  end
  L9_37.GateCatWarpSensorOnEnter = L10_38
  L9_37 = _G
  function L10_38()
    local L0_46, L1_47
    A0_28.catwarp = true
  end
  L9_37.GateCatWarpSensorOnLeave = L10_38
  L9_37 = _G
  function L10_38()
    invokeTask(function()
      if GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeCheckPoint) == "None" or GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeCheckPoint) == "" or GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeCheckPoint) == nil then
        GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeCheckPoint, "locator2_pc_start_pos")
      end
      Fn_catWarp()
    end)
  end
  L9_37.GateCatWarpSensor2OnEnter = L10_38
  L9_37 = _G
  function L10_38()
    Sound:playSE("cage_rumble")
    A0_28.shake = true
  end
  L9_37.ShakeSensorOnEnter = L10_38
  L9_37 = _G
  function L10_38()
    local L0_48, L1_49
    A0_28.shake = false
  end
  L9_37.ShakeSensorOnLeave = L10_38
  L9_37 = createGameObject2
  L10_38 = "PlayerSensor"
  L9_37 = L9_37(L10_38)
  L11_39 = L9_37
  L10_38 = L9_37.setName
  L12_40 = "gate_in_sensor"
  L10_38(L11_39, L12_40)
  L11_39 = L9_37
  L10_38 = L9_37.setDetectBehavior
  L12_40 = 1
  L10_38(L11_39, L12_40)
  L11_39 = L9_37
  L10_38 = L9_37.setContactSolverMode
  L10_38(L11_39)
  L11_39 = L9_37
  L10_38 = L9_37.addCylinder
  L12_40 = Vector
  L13_41 = 50
  L14_42 = 275
  L15_43 = 50
  L12_40 = L12_40(L13_41, L14_42, L15_43)
  L13_41 = 32
  L14_42 = Vector
  L15_43 = 0
  L15_43 = L14_42(L15_43, -25, 0)
  L10_38(L11_39, L12_40, L13_41, L14_42, L15_43, L14_42(L15_43, -25, 0))
  L11_39 = L9_37
  L10_38 = L9_37.setOnEnter
  L12_40 = "GateSensorOnEnter"
  L10_38(L11_39, L12_40)
  L11_39 = L9_37
  L10_38 = L9_37.setOnLeave
  L12_40 = "GateSensorOnLeave"
  L10_38(L11_39, L12_40)
  L11_39 = L7_35
  L10_38 = L7_35.appendChild
  L12_40 = L9_37
  L10_38(L11_39, L12_40)
  L10_38 = createGameObject2
  L11_39 = "PlayerSensor"
  L10_38 = L10_38(L11_39)
  L12_40 = L10_38
  L11_39 = L10_38.setName
  L13_41 = "gate_cat_warp_sensor_01"
  L11_39(L12_40, L13_41)
  L12_40 = L10_38
  L11_39 = L10_38.setDetectBehavior
  L13_41 = 1
  L11_39(L12_40, L13_41)
  L12_40 = L10_38
  L11_39 = L10_38.setContactSolverMode
  L11_39(L12_40)
  L12_40 = L10_38
  L11_39 = L10_38.addCylinder
  L13_41 = Vector
  L14_42 = 30
  L15_43 = 275
  L13_41 = L13_41(L14_42, L15_43, 30)
  L14_42 = 32
  L15_43 = Vector
  L15_43 = L15_43(0, -25, 0)
  L11_39(L12_40, L13_41, L14_42, L15_43, L15_43(0, -25, 0))
  L12_40 = L10_38
  L11_39 = L10_38.setOnEnter
  L13_41 = "GateCatWarpSensorOnEnter"
  L11_39(L12_40, L13_41)
  L12_40 = L10_38
  L11_39 = L10_38.setOnLeave
  L13_41 = "GateCatWarpSensorOnLeave"
  L11_39(L12_40, L13_41)
  L12_40 = L7_35
  L11_39 = L7_35.appendChild
  L13_41 = L10_38
  L11_39(L12_40, L13_41)
  L11_39 = createGameObject2
  L12_40 = "PlayerSensor"
  L11_39 = L11_39(L12_40)
  L13_41 = L11_39
  L12_40 = L11_39.setName
  L14_42 = "gate_cat_warp_sensor_02"
  L12_40(L13_41, L14_42)
  L13_41 = L11_39
  L12_40 = L11_39.setDetectBehavior
  L14_42 = 1
  L12_40(L13_41, L14_42)
  L13_41 = L11_39
  L12_40 = L11_39.setContactSolverMode
  L12_40(L13_41)
  L13_41 = L11_39
  L12_40 = L11_39.addSphere
  L14_42 = 24
  L15_43 = Vector
  L15_43 = L15_43(0, 0, 0)
  L12_40(L13_41, L14_42, L15_43, L15_43(0, 0, 0))
  L13_41 = L11_39
  L12_40 = L11_39.setOnEnter
  L14_42 = "GateCatWarpSensor2OnEnter"
  L12_40(L13_41, L14_42)
  L13_41 = L6_34
  L12_40 = L6_34.appendChild
  L14_42 = L11_39
  L12_40(L13_41, L14_42)
  L13_41 = L11_39
  L12_40 = L11_39.setActive
  L14_42 = false
  L12_40(L13_41, L14_42)
  L12_40 = createGameObject2
  L13_41 = "PlayerSensor"
  L12_40 = L12_40(L13_41)
  L14_42 = L12_40
  L13_41 = L12_40.setName
  L15_43 = "gate_cat_warp_sensor_03"
  L13_41(L14_42, L15_43)
  L14_42 = L12_40
  L13_41 = L12_40.setDetectBehavior
  L15_43 = 1
  L13_41(L14_42, L15_43)
  L14_42 = L12_40
  L13_41 = L12_40.setContactSolverMode
  L13_41(L14_42)
  L14_42 = L12_40
  L13_41 = L12_40.addSphere
  L15_43 = 36
  L13_41(L14_42, L15_43, Vector(0, 30, 0))
  L14_42 = L12_40
  L13_41 = L12_40.setOnEnter
  L15_43 = "GateCatWarpSensor2OnEnter"
  L13_41(L14_42, L15_43)
  L14_42 = L6_34
  L13_41 = L6_34.appendChild
  L15_43 = L12_40
  L13_41(L14_42, L15_43)
  L14_42 = L12_40
  L13_41 = L12_40.setActive
  L15_43 = false
  L13_41(L14_42, L15_43)
  L13_41 = createGameObject2
  L14_42 = "PlayerSensor"
  L13_41 = L13_41(L14_42)
  L15_43 = L13_41
  L14_42 = L13_41.setName
  L14_42(L15_43, "shake_sensor_01")
  L15_43 = L13_41
  L14_42 = L13_41.setDetectBehavior
  L14_42(L15_43, 1)
  L15_43 = L13_41
  L14_42 = L13_41.setContactSolverMode
  L14_42(L15_43)
  L15_43 = L13_41
  L14_42 = L13_41.addCylinder
  L14_42(L15_43, Vector(50, 5, 50), 32, Vector(0, 250, 0))
  L15_43 = L13_41
  L14_42 = L13_41.setOnEnter
  L14_42(L15_43, "ShakeSensorOnEnter")
  L15_43 = L13_41
  L14_42 = L13_41.setOnLeave
  L14_42(L15_43, "ShakeSensorOnLeave")
  L15_43 = L7_35
  L14_42 = L7_35.appendChild
  L14_42(L15_43, L13_41)
  L14_42 = createGameObject2
  L15_43 = "PlayerSensor"
  L14_42 = L14_42(L15_43)
  L15_43 = L14_42.setName
  L15_43(L14_42, "shake_sensor_02")
  L15_43 = L14_42.setDetectBehavior
  L15_43(L14_42, 1)
  L15_43 = L14_42.setContactSolverMode
  L15_43(L14_42)
  L15_43 = L14_42.addCylinder
  L15_43(L14_42, Vector(50, 5, 50), 32, Vector(0, 50, 0))
  L15_43 = L14_42.setOnEnter
  L15_43(L14_42, "ShakeSensorOnEnter")
  L15_43 = L14_42.setOnLeave
  L15_43(L14_42, "ShakeSensorOnLeave")
  L15_43 = L7_35.appendChild
  L15_43(L7_35, L14_42)
  L15_43 = createGameObject2
  L15_43 = L15_43("PlayerSensor")
  L15_43:setName("shake_sensor_03")
  L15_43:setDetectBehavior(1)
  L15_43:setContactSolverMode()
  L15_43:addCylinder(Vector(50, 5, 50), 32, Vector(0, -300, 0))
  L15_43:setOnEnter("ShakeSensorOnEnter")
  L15_43:setOnLeave("ShakeSensorOnLeave")
  L7_35:appendChild(L15_43)
  A0_28.gs_in_ss = L9_37
  A0_28.catwarp_ss01 = L10_38
  A0_28.catwarp_ss02 = L11_39
  A0_28.catwarp_ss03 = L12_40
  A0_28.shake_ss01 = L13_41
  A0_28.shake_ss02 = L14_42
  A0_28.shake_ss03 = L15_43
  L9_37:try_init()
  L10_38:try_init()
  L11_39:try_init()
  L12_40:try_init()
  L13_41:try_init()
  L14_42:try_init()
  L15_43:try_init()
  L9_37:waitForReady()
  L10_38:waitForReady()
  L11_39:waitForReady()
  L12_40:waitForReady()
  L13_41:waitForReady()
  L14_42:waitForReady()
  L15_43:waitForReady()
  L9_37:try_start()
  L10_38:try_start()
  L11_39:try_start()
  L12_40:try_start()
  L13_41:try_start()
  L14_42:try_start()
  L15_43:try_start()
  return true
end
function GravityStorm.setMineStrom(A0_50, A1_51)
  if A1_51 == 3 then
    A0_50:_crossFade("ef_ev_bkhole_01", 1)
  end
end
function GravityStorm.run(A0_52, A1_53)
  if not GravityStorm._isValid(A0_52) then
    return false
  end
  if A0_52.run_task == nil then
    A0_52.run_task = invokeTask(function()
      local L0_54, L1_55, L2_56
      L0_54 = A0_52
      L1_55 = L0_54
      L0_54 = L0_54.debugPrint
      L2_56 = "GravityStorm run "
      L0_54(L1_55, L2_56)
      A0_52.is_stop = false
      L0_54 = A1_53
      if L0_54 ~= nil then
        L0_54 = A1_53
        A0_52.is_down = L0_54
      end
      L0_54 = Player
      L1_55 = L0_54
      L0_54 = L0_54.getPuppet
      L0_54 = L0_54(L1_55)
      L1_55 = A0_52.base_node
      L2_56 = A0_52.gs_in_ss
      L2_56 = L2_56.setActive
      L2_56(L2_56, true)
      L2_56 = A0_52.catwarp_ss01
      L2_56 = L2_56.setActive
      L2_56(L2_56, true)
      L2_56 = A0_52.catwarp_ss02
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      L2_56 = A0_52.catwarp_ss03
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      L2_56 = A0_52.shake_ss01
      L2_56 = L2_56.setActive
      L2_56(L2_56, true)
      L2_56 = A0_52.shake_ss02
      L2_56 = L2_56.setActive
      L2_56(L2_56, true)
      L2_56 = A0_52.shake_ss03
      L2_56 = L2_56.setActive
      L2_56(L2_56, true)
      while true do
        L2_56 = A0_52.is_stop
        if not L2_56 then
          L2_56 = L0_54.getWorldPos
          L2_56 = L2_56(L0_54)
          A0_52.dist = L2_56.y - L1_55:getWorldPos().y
          if L2_56.y - L1_55:getWorldPos().y > -800 then
            A0_52:_crossFade("ef_ev_bkhole_01", 1, 1, 1)
          else
            if A0_52.gs_type == 1 then
              A0_52:_crossFade("ef_ev_hole_04", 4)
            elseif A0_52.gs_type == 2 then
              A0_52:_crossFade("ef_ev_hole_04_01", 4)
            elseif A0_52.gs_type == 3 then
              A0_52:_crossFade("ef_ev_hole_04_02", 4)
            elseif A0_52.gs_type == 4 then
              A0_52:_crossFade("ef_ev_hole_04_03", 4)
            elseif A0_52.gs_type == 5 then
              A0_52:_crossFade("ef_ev_hole_04_04", 4)
            elseif A0_52.gs_type == 6 then
              A0_52:_crossFade("ef_ev_hole_04_05", 4)
            else
              A0_52:_crossFade("ef_ev_hole_04", 4)
            end
            if A1_53 then
              A0_52:_dispCityBlock(3)
            end
          end
          if A0_52.shake then
            Camera:shake3D(8, 0.5, 3, L2_56, 0)
            A0_52.shake = false
          end
          wait()
        end
      end
      L2_56 = A0_52
      L2_56 = L2_56.debugPrint
      L2_56(L2_56, "GravityStorm stop")
      L2_56 = A0_52.gs_in_ss
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      L2_56 = A0_52.catwarp_ss01
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      L2_56 = A0_52.is_down
      if L2_56 then
        L2_56 = A0_52.catwarp_ss02
        L2_56 = L2_56.setActive
        L2_56(L2_56, true)
      end
      L2_56 = Area
      L2_56 = L2_56.setSceneParametersInterpolateTime
      L2_56(L2_56)
      L2_56 = A0_52.shake_ss01
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      L2_56 = A0_52.shake_ss02
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      L2_56 = A0_52.shake_ss03
      L2_56 = L2_56.setActive
      L2_56(L2_56, false)
      A0_52.city_block_disp = false
      A0_52.run_task = nil
      A0_52.is_stop = false
    end)
  end
end
function GravityStorm.stop(A0_57)
  if not GravityStorm._isValid(A0_57) then
    return false
  end
  A0_57.is_stop = true
end
function GravityStorm.readyStrom(A0_58)
  if A0_58.node[1] then
    A0_58.gs_ready = createGameObject2("Effect")
    A0_58.gs_ready:setName("gs_ef_ev_bkhole_01")
    A0_58.gs_ready:setModelName("ef_ev_bkhole_01")
    A0_58.gs_ready:setAlpha(0)
    A0_58.node[1]:appendChild(A0_58.gs_ready)
    A0_58.gs_ready:try_init()
    A0_58.gs_ready:waitForReady()
    A0_58:debugPrint("ef_ev_bkhole_01\227\130\146\230\186\150\229\130\153\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_58:debugPrint("\227\131\142\227\131\188\227\131\137\227\129\140\228\189\156\230\136\144\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\171ef_ev_bkhole_01\227\130\146\230\186\150\229\130\153\227\129\174\228\190\157\233\160\188\227\129\140\227\129\130\227\130\138\227\129\190\227\129\151\227\129\159\227\129\140\228\189\156\230\136\144\227\129\151\227\129\190\227\129\155\227\130\147")
  end
end
function GravityStorm._isValid(A0_59)
  local L1_60
  if A0_59 == nil then
    L1_60 = false
    return L1_60
  end
  L1_60 = true
  return L1_60
end
function GravityStorm._installMethods(A0_61)
  local L1_62, L2_63, L3_64, L4_65, L5_66
  for L4_65, L5_66 in L1_62(L2_63) do
    if type(L5_66) == "function" then
      A0_61[L4_65] = L5_66
    end
  end
end
function GravityStorm._termGameObj(A0_67, A1_68)
  if A1_68 then
    A1_68:try_term()
  end
  return nil
end
function GravityStorm._stopSE(A0_69, A1_70)
  if A1_70 then
    Sound:stopSEHandle(A1_70)
  end
  return nil
end
function GravityStorm._aboutTask(A0_71, A1_72)
  if A1_72 and A1_72:isRunning() then
    A1_72:abort()
  end
  return nil
end
function GravityStorm._dispCityBlock(A0_73, A1_74)
  if not A0_73.city_block_disp then
    return false
  end
  invokeTask(function()
    if A1_74 then
      waitSeconds(A1_74)
    end
    Fn_cityBlock({
      unique = "ui_gaiku_01_31",
      section = A0_73.city_block_name,
      town = nil
    })
  end)
  A0_73.city_block_disp = false
  return true
end
function GravityStorm._crossFade(A0_75, A1_76, A2_77, A3_78, A4_79)
  local L5_80
  L5_80 = A0_75.gs_name
  if L5_80 ~= A1_76 then
    A0_75.gs_name = A1_76
    A0_75.node_idx = A2_77
    L5_80 = A0_75.gs_current
    A0_75.gs_late = L5_80
    L5_80 = A0_75.gs_ready
    if L5_80 and A1_76 == "ef_ev_bkhole_01" then
      L5_80 = A0_75.gs_ready
      A0_75.gs_current = L5_80
      L5_80 = A0_75.gs_current
      L5_80 = L5_80.try_start
      L5_80(L5_80)
      L5_80 = A0_75.gs_current
      L5_80 = L5_80.setLoop
      L5_80(L5_80, true)
      A0_75.gs_ready = nil
    else
      L5_80 = A0_75._createEffect
      L5_80 = L5_80(A0_75, A1_76, A0_75.node[A2_77], A4_79)
      A0_75.gs_current = L5_80
    end
    L5_80 = A3_78 or 10
    for _FORV_9_ = 1, L5_80 do
      if A0_75.gs_late then
        A0_75.gs_late:setAlpha(1 - _FORV_9_ / L5_80)
      end
      if A0_75.gs_current then
        A0_75.gs_current:setAlpha(0 + _FORV_9_ / L5_80)
      end
      wait()
    end
    if _FOR_ then
      A0_75.gs_late:try_term()
      A0_75.gs_late = nil
    end
  end
end
function GravityStorm._createEffect(A0_81, A1_82, A2_83, A3_84)
  local L4_85
  L4_85 = createGameObject2
  L4_85 = L4_85("Effect")
  L4_85:setName("gs_" .. A1_82)
  L4_85:setModelName(A1_82)
  L4_85:setAlpha(A3_84 and A3_84 or 0)
  A2_83:appendChild(L4_85)
  L4_85:try_init()
  L4_85:waitForReady()
  L4_85:try_start()
  L4_85:play()
  L4_85:setLoop(true)
  return L4_85
end
function GravityStorm._createNode(A0_86, A1_87, A2_88, A3_89)
  local L4_90
  L4_90 = createGameObject2
  L4_90 = L4_90("Node")
  L4_90:setName(A1_87)
  if A3_89 then
    A3_89:appendChild(L4_90)
  end
  L4_90:setPos(A2_88)
  return L4_90
end
function GravityStorm.debugPrint(A0_91, A1_92)
  print(" [  storm  ] " .. A1_92)
end
function GravityStorm.debug(A0_93, A1_94)
  local L2_95, L3_96
  L2_95 = 0
  function L3_96(A0_97)
    local L1_98
    L1_98 = A1_94
    if Debug:isDebugMenuOpen() then
      L1_98 = L1_98 + 200
    end
    Font:debugPrint(L1_98, 20 + 18 * L2_95, A0_97)
    L2_95 = L2_95 + 1
  end
  L3_96("- gravity_storm -")
  if A0_93.base_node then
    L3_96("append area     : " .. tostring(A0_93.base_node:getParent():getName()))
  else
    L3_96("append area     : nil")
  end
  L3_96("gs_current      : " .. tostring(A0_93.gs_current and A0_93.gs_current:getName() or "None") .. " : " .. tostring(A0_93.gs_current and A0_93.gs_current:getActive() or "false"))
  L3_96("gs_late         : " .. tostring(A0_93.gs_late and A0_93.gs_late:getName() or "None"))
  L3_96("gs_ready        : " .. tostring(A0_93.gs_ready and A0_93.gs_ready:getName() or "None"))
  L3_96("gs_type         : " .. tostring(A0_93.gs_type))
  L3_96("gs_in           : " .. tostring(A0_93.gs_in))
  L3_96("catwarp         : " .. tostring(A0_93.catwarp))
  L3_96("dist            : " .. tostring(A0_93.dist))
  L3_96("run             : " .. tostring(A0_93.run_task))
  L3_96("stop            : " .. tostring(A0_93.is_stop))
  L3_96("shake           : " .. tostring(A0_93.shake))
  L3_96("city_block_name : " .. tostring(A0_93.city_block_name))
  L3_96("city_block_disp : " .. tostring(A0_93.city_block_disp))
  L3_96("down            : " .. tostring(A0_93.is_down))
  L3_96("scene_param     : " .. tostring(A0_93.scene_param))
  L3_96("gs_in_ss        : " .. tostring(A0_93.gs_in_ss) .. " : " .. tostring(A0_93.gs_in_ss and A0_93.gs_in_ss:getActive() or "false"))
  L3_96("cat warp 01     : " .. tostring(A0_93.catwarp_ss01) .. " : " .. tostring(A0_93.catwarp_ss01 and A0_93.catwarp_ss01:getActive() or "false"))
  L3_96("cat warp 02     : " .. tostring(A0_93.catwarp_ss02) .. " : " .. tostring(A0_93.catwarp_ss02 and A0_93.catwarp_ss02:getActive() or "false"))
  L3_96("cat warp 03     : " .. tostring(A0_93.catwarp_ss03) .. " : " .. tostring(A0_93.catwarp_ss03 and A0_93.catwarp_ss03:getActive() or "false"))
  L3_96("shake_ss01      : " .. tostring(A0_93.shake_ss01) .. " : " .. tostring(A0_93.shake_ss01 and A0_93.shake_ss01:getActive() or "false"))
  L3_96("shake_ss02      : " .. tostring(A0_93.shake_ss02) .. " : " .. tostring(A0_93.shake_ss02 and A0_93.shake_ss02:getActive() or "false"))
  L3_96("shake_ss03      : " .. tostring(A0_93.shake_ss03) .. " : " .. tostring(A0_93.shake_ss03 and A0_93.shake_ss03:getActive() or "false"))
end
