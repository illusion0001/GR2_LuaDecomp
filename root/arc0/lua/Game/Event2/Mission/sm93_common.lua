import("Mob")
BEFORE_DISP_NAVI_WAIT = 0.4
function gemSet(A0_0, A1_1)
  local L2_2
  if A1_1 == nil then
    A1_1 = true
  end
  L2_2 = 1
  while findGameObject2("Gem", "gem2_navi_" .. string.format("%02d", A0_0) .. "_" .. string.format("%02d", L2_2)) ~= nil do
    findGameObject2("Gem", "gem2_navi_" .. string.format("%02d", A0_0) .. "_" .. string.format("%02d", L2_2)):setActive(A1_1)
    do break end
    do break end
    L2_2 = L2_2 + 1
  end
end
function createGemNaviToPlayer(A0_3, A1_4, A2_5, A3_6)
  local L4_7, L5_8, L6_9, L7_10
  if A1_4 == nil then
    A1_4 = 10
  end
  if A3_6 == nil then
    A3_6 = 20
  end
  if A2_5 == nil then
    A2_5 = 20
  end
  while true do
    L4_7 = Fn_getDistanceToPlayer
    L5_8 = A0_3
    L4_7 = L4_7(L5_8)
    if A3_6 < L4_7 then
      L4_7 = wait
      L4_7()
    end
  end
  L5_8 = A0_3
  L4_7 = A0_3.getWorldPos
  L4_7 = L4_7(L5_8)
  L5_8 = Fn_getPlayerWorldPos
  L5_8 = L5_8()
  L6_9 = A2_5 / A1_4
  L7_10 = L5_8 - L4_7
  for _FORV_12_ = 1, A1_4 do
    createGameObject2("Gem"):setGemModelNo(1)
    L7_10 = L4_7 + NormalizeVector(L7_10) * (_FORV_12_ * L6_9)
    createGameObject2("Gem"):setWorldPos(L7_10)
  end
  _FOR_()
end
function waitNaviPoint(A0_11, A1_12)
  while _restart_flag ~= false or not (A1_12 >= Fn_getDistanceToPlayer(A0_11)) do
    wait()
  end
end
function waitGravityCtrlMode()
  while _restart_flag ~= false or Player:isGravityControlMode() ~= true or Player:getAction() ~= Player.kAction_Float do
    wait()
  end
end
function waitNaviWall(A0_13, A1_14)
  while _restart_flag ~= false or not (A1_14 > Fn_getDistanceToPlayer(A0_13)) or Player:isGravityControlMode() ~= true or Player:getAction() == Player.kAction_Float or Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
end
function waitNaviFall(A0_15, A1_16)
  while _restart_flag ~= false or Player:isGravityControlMode() ~= false or Player:getAction() ~= Player.kAction_Idle and Player:getAction() ~= Player.kAbility_Dodge and Player:getAction() ~= Player.kAction_Walk and Player:getAction() ~= Player.kAction_Run or not (A1_16 > Fn_getDistanceToPlayer(A0_15)) do
    wait()
  end
end
function waitNaviFloat(A0_17, A1_18)
  if _restart_flag == false and Player:isGravityControlMode() == true then
    while Player:getAction() ~= Player.kAction_Float or not (A1_18 > Fn_getDistanceToPlayer(A0_17)) do
      if false == false and Fn_getDistanceToPlayer(A0_17) < 25 then
        Fn_captionView("sm93_00002", 2)
      end
      wait()
    end
  end
end
function capFloatTask(A0_19, A1_20, A2_21)
  return invokeTask(function()
    while true do
      if Fn_isCaptionView() == false then
        if Fn_getDistanceToPlayer(A0_19) <= A1_20 then
          Fn_captionView("ic_tutorial_00800", 0)
        end
      elseif Fn_getDistanceToPlayer(A0_19) > A2_21 then
        Fn_captionViewEnd()
      end
      wait()
    end
  end)
end
function pccubesensor2_OnLeave_restart(A0_22)
  if _restart_flag == false then
    _restart_flag = true
    invokeTask(function()
      Fn_blackout(1)
      Player:setStay(true)
      if _navi_cnt == 1 or _navi_cnt == 8 then
        navi_hdl = findGameObject2("Node", "locator2_pc_start_pos")
      elseif _navi_cnt == 12 then
        navi_hdl = findGameObject2("Node", "locator2_navi_12")
      else
        navi_hdl = findGameObject2("Node", "locator2_navi_" .. string.format("%02d", _navi_cnt - 1))
      end
      if _navi_cnt == 10 then
        Fn_resetPcPos(navi_hdl, Player.kReset_Floating)
      else
        Fn_resetPcPos(navi_hdl)
      end
      if _navi_cnt == 11 then
        _fall_flag = false
        if _fall_task ~= nil and _fall_task:isRunning() == true then
          _fall_task:abort()
        end
        _fall_task = nil
        _fall_task = get_fall_task()
        Player:setControl(Player.kControl_Stick, true)
      end
      Fn_fadein(1)
      Player:setStay(false)
      _restart_flag = false
      if _navi_cnt == 9 then
        Fn_captionView("sm93_00013")
      end
    end)
  end
end
function get_fall_task()
  return invokeTask(function()
    while _fall_flag == false do
      wait()
    end
    while _fall_flag == true do
      Player:moveToLandingPoint(findGameObject2("Node", "locator2_navi_11"):getWorldPos(), 0.78, 1.5)
      wait()
    end
  end)
end
