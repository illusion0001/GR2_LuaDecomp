dofile("/Game/Test/test_polydemo.lua")
function init_bg(A0_0)
  local L1_1, L2_2
  L1_1 = "ar_a_root"
  if L1_1 ~= nil then
    L2_2 = createGameObject2
    L2_2 = L2_2("SimpleModel")
    L2_2:setModelName(L1_1)
    L2_2:setPos(Vector(0, 0, 0))
    A0_0:appendChild(L2_2)
  end
end
