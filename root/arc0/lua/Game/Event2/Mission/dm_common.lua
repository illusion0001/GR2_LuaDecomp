dofile("/Game/Event2/Mission/rac_common.lua")
function dm_createTrailEffect(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L4_4 = type
  L5_5 = A1_1
  L4_4 = L4_4(L5_5)
  if L4_4 == "string" then
    L4_4 = _findObjectHandle
    L5_5 = A1_1
    L4_4 = L4_4(L5_5)
    A1_1 = L4_4
    L5_5 = A1_1
    L4_4 = A1_1.getWorldPos
    L4_4 = L4_4(L5_5)
    A1_1 = L4_4
  end
  L4_4 = type
  L5_5 = A2_2
  L4_4 = L4_4(L5_5)
  if L4_4 == "string" then
    L4_4 = _findObjectHandle
    L5_5 = A2_2
    L4_4 = L4_4(L5_5)
    A2_2 = L4_4
    L5_5 = A2_2
    L4_4 = A2_2.getWorldPos
    L4_4 = L4_4(L5_5)
    A2_2 = L4_4
  end
  L4_4 = Fn_get_distance_angle
  L5_5 = A1_1
  L6_6 = A2_2
  L4_4 = L4_4(L5_5, L6_6)
  L5_5 = A2_2.x
  L6_6 = A1_1.x
  L5_5 = L5_5 - L6_6
  L6_6 = A2_2.y
  L7_7 = A1_1.y
  L6_6 = L6_6 - L7_7
  L7_7 = A2_2.z
  L8_8 = A1_1.z
  L7_7 = L7_7 - L8_8
  L8_8 = math
  L8_8 = L8_8.sqrt
  L9_9 = L7_7 * L7_7
  L9_9 = L9_9 + L5_5 * L5_5
  L8_8 = L8_8(L9_9)
  L9_9 = math
  L9_9 = L9_9.deg
  L9_9 = L9_9(-math.atan2(L6_6, L8_8))
  rot = XYZRotQuat(Deg2Rad(L9_9), Deg2Rad(L4_4), 0)
  return RAC_createEffect({
    eff_name = A0_0,
    world_pos = A1_1,
    world_rot = rot,
    time = A3_3
  })
end
function dm_userCtrlCameraOff()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
end
function dm_userCtrlCameraOn()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
end
function dm_energySupply(A0_10, A1_11)
  Player:setEnergyInfinite(Player.kEnergy_Life, true)
  Player:setEnergyInfinite(Player.kEnergy_Gravity, true)
end
function dm_pcSetGravityVector(A0_12, A1_13)
  if A0_12 ~= nil then
    if A1_13 ~= nil then
      Player:shiftGravity(A0_12, A1_13)
    else
      Player:shiftGravity(A0_12, 0)
    end
  elseif A1_13 ~= nil then
    Player:shiftGravity(Vector(0, -1, 0), A1_13)
  else
    Player:shiftGravity(Vector(0, -1, 0), 0)
  end
end
function dm_moveTowardLocation(A0_14, A1_15, A2_16, A3_17)
  local L4_18, L5_19, L6_20, L7_21, L8_22, L9_23
  L4_18 = false
  if A1_15 == nil then
    L5_19 = Fn_getPlayer
    L5_19 = L5_19()
    A1_15 = L5_19
    L4_18 = true
  end
  if A3_17 == nil then
    A3_17 = false
  end
  if A0_14 ~= nil and A1_15 ~= nil and A2_16 ~= nil then
    L6_20 = A0_14
    L5_19 = A0_14.getPos
    L5_19 = L5_19(L6_20)
    L7_21 = A0_14
    L6_20 = A0_14.getRot
    L6_20 = L6_20(L7_21)
    L7_21, L8_22 = nil, nil
    if L4_18 == true then
      L9_23 = A1_15.getWorldPos
      L9_23 = L9_23(A1_15)
      L7_21 = L9_23
      L9_23 = A1_15.getWorldRot
      L9_23 = L9_23(A1_15)
      L8_22 = L9_23
    else
      L9_23 = A1_15.getPos
      L9_23 = L9_23(A1_15)
      L7_21 = L9_23
      L9_23 = A1_15.getRot
      L9_23 = L9_23(A1_15)
      L8_22 = L9_23
    end
    L9_23 = A2_16 * 30
    if A3_17 == true then
      for _FORV_14_ = 1, L9_23 do
        A0_14:setTransform(A0_14:getPos() + get_move_pos(L5_19, L7_21, L9_23), SlerpQuat(_FORV_14_ / L9_23, L6_20, L8_22))
        wait()
      end
    else
      A0_14:setTransform(A0_14:getPos() + get_move_pos(L5_19, L7_21, L9_23), L6_20)
    end
    wait()
  end
end
function dm_moveTowardVector(A0_24, A1_25)
  local L2_26, L3_27
  if A0_24 ~= nil then
    L3_27 = A0_24
    L2_26 = A0_24.getPos
    L2_26 = L2_26(L3_27)
    L3_27 = A0_24.getRot
    L3_27 = L3_27(A0_24)
    A0_24:setTransform(L2_26 + A1_25, L3_27)
  end
end
function dm_areaAnimate(A0_28, A1_29, A2_30, A3_31, A4_32)
  return invokeTask(function()
    if A0_28 ~= nil and A1_29 ~= nil then
      A0_28:loadMotionFileAsset(A1_29)
      while A0_28:isMotionLoading() do
        wait()
      end
      if A2_30 ~= nil then
        A0_28:setMoveAnimRatio(A2_30)
      else
        A0_28:setMoveAnimRatio(1)
      end
      if A3_31 == nil then
        A3_31 = false
      end
      if A3_31 == true then
        A0_28:playMoveAnim(-1)
      else
        A0_28:playMoveAnim(0)
      end
      if A4_32 == nil then
        A4_32 = false
      end
      if A4_32 == true then
        while A0_28:isMoveAnimEnd() == false do
          wait()
        end
      end
    end
  end)
end
function dm_areaHighLow(A0_33, A1_34, A2_35, A3_36, A4_37, A5_38)
  local L6_39
  if A0_33 ~= nil and A1_34 ~= nil and A2_35 ~= nil and A3_36 ~= nil and A4_37 ~= nil and A5_38 ~= nil then
    L6_39 = A0_33.getPos
    L6_39 = L6_39(A0_33)
    if A2_35 <= 0 then
      if A1_34 == true then
        L6_39.y = A5_38 + A4_37
      else
        L6_39.y = A5_38 + A3_36
      end
      A0_33:setPos(L6_39)
      A0_33:setForceMove()
    elseif A1_34 == true then
      while L6_39.y < A5_38 + (A4_37 - A2_35) do
        L6_39.y = L6_39.y + A2_35
        A0_33:setPos(L6_39)
        A0_33:setForceMove()
        wait()
      end
      L6_39.y = A5_38 + A4_37
      A0_33:setPos(L6_39)
      A0_33:setForceMove()
    else
      while L6_39.y > A5_38 + (A3_36 + A2_35) do
        L6_39.y = L6_39.y - A2_35
        A0_33:setPos(L6_39)
        A0_33:setForceMove()
        wait()
      end
      L6_39.y = A5_38 + A3_36
      A0_33:setPos(L6_39)
      A0_33:setForceMove()
    end
  end
end
function dm_areaHighLowTarget(A0_40, A1_41, A2_42, A3_43, A4_44)
  if A0_40 ~= nil and A1_41 ~= nil and A2_42 ~= nil and A3_43 ~= nil and A4_44 ~= nil then
    if A1_41 == true then
      A0_40:setMoveTarget(A3_43)
      print(A3_43:getPos())
    else
      A0_40:setMoveTarget(A4_44)
      print(A4_44:getPos())
    end
    A0_40:setMoveVelocity(A2_42)
    while A0_40:isMoveEnd() == false do
      wait()
    end
  end
end
function loadPlayerMotion(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51
  L1_46 = Player
  L1_46 = L1_46.getPuppet
  L1_46 = L1_46(L2_47)
  for L5_50, L6_51 in L2_47(L3_48) do
    L1_46:loadPoseAnimation(L6_51, L6_51)
  end
  while true do
    if L2_47 then
      L2_47()
    end
  end
end
function playPlayerMotion(A0_52, A1_53)
  if Player:getPuppet():playPoseAnimation(A0_52, A1_53) then
    while not Player:getPuppet():isPoseAnimEnd() do
      wait()
    end
  else
    print("\229\134\141\231\148\159\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159 : " .. A0_52)
  end
end
function waitNpcMoveEnd(A0_54)
  while not isNpcMoveEnd(A0_54) do
    wait()
  end
end
function isNpcMoveEnd(A0_55)
  return Fn_findNpc(A0_55):isMoveEnd()
end
