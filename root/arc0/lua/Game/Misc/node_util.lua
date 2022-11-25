local L1_1
__loaded_game_misc_node_util__ = true
function L0_0(A0_2)
  while A0_2 do
    A0_2 = A0_2:getParent()
    if A0_2 and A0_2:getTypeName() == "Area" then
      return A0_2
    end
  end
  return nil
end
findUpArea = L0_0
function L0_0(A0_3, A1_4)
  return (A0_3:getWorldPos() - A1_4:getWorldPos()):Length()
end
distanceBetweenNodes = L0_0
function L0_0(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16
  L2_7 = false
  if A1_6 then
    L3_8 = A1_6.ls
    if L3_8 then
      L2_7 = true
    end
  end
  L3_8 = {}
  for L7_12, L8_13 in L4_9(L5_10) do
    L9_14 = findGameObject2
    L10_15 = "Node"
    L11_16 = L8_13
    L9_14 = L9_14(L10_15, L11_16)
    L10_15, L11_16 = nil, nil
    if L2_7 == true then
      L10_15, L11_16 = L9_14:getTransform()
    else
      L10_15, L11_16 = L9_14:getWorldTransform()
    end
    L3_8[L8_13] = {pos = L10_15, rot = L11_16}
  end
  return L3_8
end
nodeXformMap = L0_0
