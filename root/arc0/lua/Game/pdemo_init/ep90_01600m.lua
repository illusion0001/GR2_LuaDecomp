dofile("/Game/Test/test_polydemo.lua")
function init_bg(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = createGameObject2
  L2_2 = "SimpleModel"
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.setModelName
  L2_2(L3_3, "sky_po_a_root")
  L2_2 = "po_a_04"
  if L2_2 ~= nil then
    L3_3 = createGameObject2
    L3_3 = L3_3("LwArea")
    L3_3:setModelName(L2_2)
    L3_3:setPos(Vector(0, 0, 0))
    A0_0:appendChild(L3_3)
  end
end
