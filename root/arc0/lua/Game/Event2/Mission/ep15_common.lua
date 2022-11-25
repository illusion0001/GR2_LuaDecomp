DEF_RATIO = 0.5
L0_0 = {}
L0_0.DAMAGE = Player:getEnergyMax(Player.kEnergy_Life) * 0.4
L0_0.RADIUS = 8
GRIGO_BLAST = L0_0
_grigo_se_hdl = nil
_goto_next_phase = false
function L0_0(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6
  L3_4 = Vector
  L4_5 = 3
  L5_6 = 3
  L3_4 = L3_4(L4_5, L5_6, 3)
  L4_5 = nil
  if A0_1 ~= nil then
    if A1_2 ~= nil then
      L3_4 = A1_2
    end
    L5_6 = A2_3
    L5_6 = L5_6 .. "_OnEnter"
    L4_5 = createGameObject2("PlayerSensor")
    L4_5:setName(A2_3)
    L4_5:setDetectBehavior(1)
    L4_5:addBox(L3_4)
    L4_5:setPos(Vector(0, L3_4.y / 2, 0))
    L4_5:setOnEnter(L5_6)
    A0_1:appendChild(L4_5)
  end
  return L4_5
end
setNpcSenser = L0_0
function L0_0()
  while not _isGotoNextPhase() do
    wait()
  end
  _resetNextPhase()
end
_waitPhase = L0_0
function L0_0()
  local L0_7, L1_8
  _goto_next_phase = true
end
_gotoNextPhase = L0_0
function L0_0()
  local L0_9, L1_10
  _goto_next_phase = false
end
_resetNextPhase = L0_0
function L0_0()
  local L0_11, L1_12
  L0_11 = _goto_next_phase
  return L0_11
end
_isGotoNextPhase = L0_0
function L0_0(A0_13)
  return invokeTask(function()
    local L0_14
    L0_14 = 1
    while true do
      if Fn_getDistanceToPlayer(A0_13) < 75 then
        L0_14 = 1
        if _grigo_se_hdl == nil then
          _grigo_se_hdl = Sound:playSEHandle("ene_bot_allert", L0_14, nil, A0_13)
        end
        waitSeconds(2)
      else
        L0_14 = 0
      end
      wait()
    end
  end)
end
invokeGrigoWarningStart = L0_0
function L0_0()
  if _grigo_se_hdl ~= nil then
    Sound:stopSEHandle(_grigo_se_hdl)
    _grigo_se_hdl = nil
  end
end
invokeGrigoWarningStop = L0_0
function L0_0(A0_15, A1_16, A2_17, A3_18)
  local L4_19, L5_20, L6_21, L7_22, L8_23, L9_24
  L4_19 = _findObjectHandle
  L5_20 = A0_15
  L4_19 = L4_19(L5_20)
  L5_20 = 0
  if A2_17 ~= nil then
    L5_20 = A2_17
  end
  L7_22 = L4_19
  L6_21 = L4_19.getWorldPos
  L6_21 = L6_21(L7_22)
  L7_22 = L6_21.y
  L7_22 = L7_22 + L5_20
  L6_21.y = L7_22
  L7_22 = A1_16
  while true do
    L8_23 = Fn_getPcPosRot
    L9_24 = L8_23()
    if not Player:isGravityControlMode() then
      L8_23.y = L8_23.y + 1.5
    end
    Query:setEyeSightTransform(L8_23, L9_24)
    Query:setEyeSightAngle(Deg2Rad(45))
    Query:setEyeSightRange(L7_22)
    if not Query:raycastEyeSight(L6_21) then
      if A3_18 == true then
        if Query:checkEyeSightSphere(A0_15:getWorldPos(), 1) then
          return true
        end
      else
        return true
      end
    end
    if not Query:raycastEyeSight(L6_21) then
      DebugDraw:setColor(0, 1, 0)
    else
      DebugDraw:setColor(1, 0, 0)
    end
    DebugDraw:drawLines({L8_23, L6_21})
    wait()
  end
end
rayCheckPcSetStayVerB = L0_0
function L0_0(A0_25)
  if A0_25 == false then
    if Player:getAttrTune() ~= Player.kAttrTune_Normal then
      Player:setAttrTune(Player.kAttrTune_Normal, false)
    end
    Fn_userCtrlAllOff()
    Fn_coercionGravityRevert()
    Player:setStay(true)
    waitSeconds(1)
    Player:setStay(false)
    if Player:isGravityControlMode() then
      Fn_coercionGravityRevert()
    end
  elseif A0_25 == true then
    Fn_userCtrlAllOff()
    Player:setStay(true)
    waitSeconds(1)
  end
end
playerCoerctionStop = L0_0
function L0_0(A0_26, A1_27, A2_28)
  Fn_sendEventComSb("requestSection", A0_26, A1_27, A2_28)
end
requestSection = L0_0
function L0_0(A0_29)
  while not Fn_sendEventComSb("isSectionEnd", A0_29) do
    wait()
  end
end
waitSection = L0_0
