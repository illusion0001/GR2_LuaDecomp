local L1_1
GESTURE_MISS_COUNT = 3
PT_BRAKE = 0
PT_BRAKE_FLOAT = 1
PT_STOP = 2
PT_STOP_FLOAT = 3
PT_STOP_GROUND = 4
CTRL_ON = 0
CTRL_OFF = 1
CTRL_ALL_OFF = 2
_navi_set = nil
_warning_navi = false
_npc_miss_count = 0
_advice_flag = false
L0_0 = {}
_npc_motion = L0_0
L0_0 = {}
_npc_motion_flag = L0_0
L0_0 = {}
L0_0.isStop = true
L0_0.animBlendDuration = 0.25
pose_opt01 = L0_0
L0_0 = {}
L0_0.isStop = true
L0_0.animBlendDuration = 0.5
pose_opt02 = L0_0
function L0_0(A0_2)
  if _navi_set == nil then
    Fn_naviSet(A0_2)
    _navi_set = A0_2
  end
end
comSetNavi = L0_0
function L0_0()
  if _navi_set ~= nil then
    Fn_naviKill()
    _navi_set = nil
    print("\n\230\182\136\227\129\136\227\130\139\n")
  end
end
comKillNavi = L0_0
function L0_0()
  if _warning_navi == true then
    Fn_naviKill()
    _warning_navi = false
  end
end
killWarningNavi = L0_0
function L0_0(A0_3, A1_4)
  Fn_captionView(A0_3)
  _warning_sensor_flag = true
  if _navi_set == nil and A1_4 ~= nil then
    Fn_naviSet(A1_4)
    _warning_navi = true
  end
end
comGuideFunc = L0_0
function L0_0(A0_5, A1_6)
  invokeTask(function()
    invokePlayerCoerctionStop(PT_BRAKE, PT_CTRL_ON, false)
    if _navi_set == nil and A1_6 ~= nil then
      Fn_naviSet(A1_6)
      _warning_navi = true
    end
    Fn_captionViewWait(A0_5)
  end)
end
comCatWarpWarning = L0_0
function L0_0(A0_7, A1_8, A2_9, A3_10)
  if A3_10 ~= nil then
    A3_10 = 0.1
  end
  if A2_9 == true and Player:getAttrTune() ~= Player.kAttrTune_Normal then
    Player:setAttrTune(Player.kAttrTune_Normal, false)
  end
  if control_sw == CTRL_ALL_OFF then
    Fn_userCtrlAllOff()
  else
    if control_sw == CTRL_OFF then
      Fn_userCtrlOff()
    else
    end
  end
  if A0_7 == PT_BRAKE then
    Player:setStay(true)
    waitSeconds(A3_10)
    Player:setStay(false)
  elseif A0_7 == PT_BRAKE_FLOAT then
    Player:setStay(true)
    waitSeconds(A3_10)
  elseif A0_7 == PT_STOP then
    Fn_coercionGravityRevert()
    Player:setStay(true)
    waitSeconds(A3_10)
    Player:setStay(false)
    if Player:isGravityControlMode() == true then
      Fn_coercionGravityShift()
    else
      Fn_coercionGravityRevert()
    end
  elseif A0_7 == PT_STOP_FLOAT then
    Fn_coercionGravityRevert()
    Player:setStay(true)
    waitSeconds(A3_10)
    Player:setStay(false)
    Fn_coercionGravityShift()
  else
    if A0_7 == PT_STOP_GROUND then
      Fn_coercionGravityRevert()
      Player:setStay(true)
      waitSeconds(A3_10)
      Player:setStay(false)
      if Player:isGravityControlMode() then
        Fn_coercionGravityRevert()
      end
    else
    end
  end
end
playerCoerctionStop = L0_0
function L0_0(A0_11, A1_12, A2_13, A3_14)
  return invokeTask(function()
    playerCoerctionStop(A0_11, A1_12, A2_13, A3_14)
  end)
end
invokePlayerCoerctionStop = L0_0
function L0_0(A0_15, A1_16)
  local L2_17
  L2_17 = 0
  for _FORV_6_, _FORV_7_ in pairs(A0_15) do
    if Mv_raycastCameraSight(A0_15[_FORV_6_], A1_16) == true then
      L2_17 = _FORV_6_
      return L2_17
    end
  end
  return L2_17
end
arrayRaycastCheckVerB = L0_0
function L0_0()
  local L0_18, L1_19
  L0_18 = _npc_miss_count
  L0_18 = L0_18 + 1
  _npc_miss_count = L0_18
  L0_18 = _npc_miss_count
  if L0_18 >= 255 then
    _npc_miss_count = 0
  end
end
incNpcMissCount = L0_0
function L0_0()
  local L0_20, L1_21
  L0_20 = _npc_miss_count
  return L0_20
end
getNpcMissCount = L0_0
function L0_0()
  local L0_22, L1_23
  _npc_miss_count = 0
end
clearNpcMissCount = L0_0
function L0_0()
  local L0_24, L1_25
  _advice_flag = false
end
stopAdviceTask = L0_0
function L0_0()
  local L0_26, L1_27
  _advice_flag = true
end
playAdviceTask = L0_0
function L0_0(A0_28)
  return invokeTask(function()
    local L0_29
    L0_29 = _gesture
    L0_29 = L0_29.getKnownCount
    L0_29 = L0_29(L0_29)
    L0_29 = L0_29 + _gesture:getUnknownCount()
    L0_29 = L0_29 + getNpcMissCount()
    L0_29 = L0_29 % GESTURE_MISS_COUNT
    while true do
      if (_gesture:getKnownCount() + _gesture:getUnknownCount() + getNpcMissCount()) % GESTURE_MISS_COUNT ~= L0_29 then
        if (_gesture:getKnownCount() + _gesture:getUnknownCount() + getNpcMissCount()) % GESTURE_MISS_COUNT == 0 then
          _gesture:stop()
          waitSeconds(2.5)
          while Fn_isCaptionView() == true do
            wait()
          end
          for _FORV_5_, _FORV_6_ in pairs(A0_28) do
            Fn_captionViewWait(A0_28[_FORV_5_])
          end
          _gesture:run()
        end
        L0_29 = (_gesture:getKnownCount() + _gesture:getUnknownCount() + getNpcMissCount()) % GESTURE_MISS_COUNT
      end
      wait()
    end
  end)
end
invokeAdviceTask = L0_0
function L0_0(A0_30, A1_31, A2_32)
  local L3_33
  L3_33 = _npc_motion
  if L3_33 ~= nil then
    L3_33 = _npc_motion
    L3_33 = L3_33[A0_30]
    if L3_33 == nil then
      L3_33 = _npc_motion
      L3_33[A0_30] = invokeTask(function()
        _npc_motion_flag[A0_30] = true
        while _npc_motion_flag[A0_30] == true do
          for _FORV_3_ = 1, #A1_31 do
            if A2_32 == nil then
              Fn_playMotionNpc(A0_30, A1_31[_FORV_3_], true, pose_opt01)
            else
              Fn_playMotionNpc(A0_30, A1_31[_FORV_3_], true, pose_opt02)
            end
          end
          _FOR_()
        end
      end)
    end
  end
end
comPlayMotion = L0_0
function L0_0(A0_34)
  local L1_35
  L1_35 = _npc_motion_flag
  L1_35[A0_34] = false
  L1_35 = _npc_motion
  L1_35[A0_34] = Mv_safeTaskAbort(_npc_motion[A0_34])
end
comStopMotion = L0_0
