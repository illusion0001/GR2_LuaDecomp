import("Query")
import("Camera")
dofile("/Game/Misc/photo.lua")
dofile("/Game/Misc/sdemo.lua")
function _findObjectHandle(A0_0)
  local L1_1
  L1_1 = A0_0
  if type(A0_0) == "string" then
    L1_1 = findGameObject2("Node", A0_0)
  end
  if L1_1 == nil and type(A0_0) == "string" then
    print(A0_0 .. "\227\129\175\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
  end
  return L1_1
end
function Fn_isInSightTarget(A0_2, A1_3)
  local L2_4, L3_5
  L2_4 = _findObjectHandle
  L3_5 = A0_2
  L2_4 = L2_4(L3_5)
  L3_5 = {}
  L3_5.left = -0.5
  L3_5.top = -0.5
  L3_5.right = 0.5
  L3_5.bottom = 0.5
  if A1_3 ~= nil then
    L3_5.left = -1 * A1_3
    L3_5.top = -1 * A1_3
    L3_5.right = A1_3
    L3_5.bottom = A1_3
  end
  if Query:calcInSightRatioGameObject(L2_4) == nil then
    return false
  end
  Query:debugDrawInSightRatio(L3_5)
  if Query:calcInSightRatioGameObject(L2_4).left > L3_5.left and Query:calcInSightRatioGameObject(L2_4).top > L3_5.top and Query:calcInSightRatioGameObject(L2_4).right < L3_5.right and Query:calcInSightRatioGameObject(L2_4).bottom < L3_5.bottom then
    return true
  end
  return false
end
function Fn_lookAtObject(A0_6, A1_7, A2_8)
  Camera:resetViewControl()
  return invokeTask(function()
    local L0_9, L1_10, L2_11
    L0_9 = _findObjectHandle
    L1_10 = A0_6
    L0_9 = L0_9(L1_10)
    L1_10 = 0
    L2_11 = A1_7
    if L2_11 ~= nil then
      L1_10 = A1_7
    end
    while L0_9 do
      L2_11 = L0_9.isRunning
      L2_11 = L2_11(L0_9)
      if L2_11 then
        L2_11 = Vector
        L2_11 = L2_11(0, 0, 0)
        if A2_8 then
          L2_11 = L0_9:getJointWorldTransform(A2_8)
        else
          L2_11 = L0_9:getWorldPos()
        end
        L2_11.y = L2_11.y + L1_10
        HUD:setPhotoMode(false)
        Player:releaseFirstPersonView()
        Camera:setViewControlTarget(L2_11)
        wait()
      end
    end
  end)
end
function Fn_lookAtObjectWait(A0_12, A1_13, A2_14, A3_15)
  local L4_16
  L4_16 = _findObjectHandle
  L4_16 = L4_16(A0_12)
  while not Fn_isInSightTarget(L4_16, A2_14) do
    wait()
  end
  Fn_lookAtObject(L4_16, A1_13, A3_15):abort()
end
function Fn_lookAtTargetInput(A0_17, A1_18)
  while true do
    if Fn_isInSightTarget(A0_17) == true then
      break
    end
    if is_camera_input() == true then
      if not (0 + 1 > 10) then
        else
        end
        wait()
      end
  end
  if Fn_lookAtObject(A0_17, A1_18) ~= nil and Fn_lookAtObject(A0_17, A1_18):isRunning() == true then
    Fn_lookAtObject(A0_17, A1_18):abort()
  end
  return true
end
function is_camera_input(A0_19, A1_20)
  local L2_21
  L2_21 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_21 = true
  end
  return L2_21
end
