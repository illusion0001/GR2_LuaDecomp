local L1_1
NAVI_WAIT = 1.3
CAP_WAIT = 2.5
_onleave_com = false
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L3_5 = A0_2
  L2_4 = A0_2.getWorldPos
  L2_4 = L2_4(L3_5)
  if A1_3 ~= nil then
    L3_5 = L2_4.y
    L3_5 = L3_5 + A1_3
    L2_4.y = L3_5
  end
  L3_5 = Fn_getPcPosRot
  L4_6 = L3_5()
  L3_5.y = L3_5.y + 1.5
  Query:setEyeSightTransform(L3_5, L4_6)
  Query:setEyeSightAngle(Deg2Rad(45))
  Query:setEyeSightRange(10)
  return Query:raycastEyeSight(L2_4)
end
RayCheckObj = L0_0
function L0_0(A0_7, A1_8, A2_9)
  return (invokeTask(function()
    while true do
      if _onleave_com then
        if A2_9 ~= nil then
          A2_9()
        end
        Fn_catWarpIn()
        Fn_catWarpCheckPoint()
        if A0_7 ~= nil then
          A0_7()
        end
        Fn_catWarpOut()
        if A1_8 ~= nil then
          A1_8()
        end
        _onleave_com = false
      end
      wait()
    end
  end))
end
anoterCatWarp = L0_0
function L0_0()
  local L0_10, L1_11
  _onleave_com = true
end
runCatWarp = L0_0
function L0_0(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L14_26, L15_27
  L5_17 = findGameObject2
  L6_18 = "Node"
  L7_19 = A1_13
  L5_17 = L5_17(L6_18, L7_19)
  L7_19 = L5_17
  L6_18 = L5_17.getWorldTransform
  L7_19 = L6_18(L7_19)
  L8_20 = findGameObject2
  L9_21 = "Node"
  L10_22 = A2_14
  L8_20 = L8_20(L9_21, L10_22)
  L10_22 = L8_20
  L9_21 = L8_20.getWorldTransform
  L10_22 = L9_21(L10_22)
  L11_23 = L9_21
  L12_24 = L9_21.x
  L13_25 = L6_18.x
  L12_24 = L12_24 - L13_25
  L11_23.x = L12_24
  L12_24 = L9_21.y
  L13_25 = L6_18.y
  L12_24 = L12_24 - L13_25
  L11_23.y = L12_24
  L12_24 = L9_21.z
  L13_25 = L6_18.z
  L12_24 = L12_24 - L13_25
  L11_23.z = L12_24
  L12_24 = L10_22
  L13_25 = L10_22.x
  L14_26 = L7_19.x
  L13_25 = L13_25 - L14_26
  L12_24.x = L13_25
  L13_25 = L10_22.y
  L14_26 = L7_19.y
  L13_25 = L13_25 - L14_26
  L12_24.y = L13_25
  L13_25 = L10_22.z
  L14_26 = L7_19.z
  L13_25 = L13_25 - L14_26
  L12_24.z = L13_25
  L13_25 = L6_18
  L14_26 = L7_19
  L15_27 = 30 * A3_15
  return (invokeTask(function()
    local L0_28
    L0_28 = 0
    while true do
      L13_25.x = L13_25.x + L11_23.x / L15_27
      L13_25.y = L13_25.y + L11_23.y / L15_27
      L13_25.z = L13_25.z + L11_23.z / L15_27
      L14_26.x = L14_26.x + L12_24.x / L15_27
      L14_26.y = L14_26.y + L12_24.y / L15_27
      L14_26.z = L14_26.z + L12_24.z / L15_27
      A0_12:setWorldRot(L14_26)
      A0_12:setWorldPos(L13_25)
      wait()
      L0_28 = L0_28 + 1
      if L0_28 >= L15_27 then
        A4_16()
        break
      end
    end
  end))
end
moveGimmickBG = L0_0
