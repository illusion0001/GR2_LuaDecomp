dofile("/Game/Test/test_polydemo.lua")
function init_bg()
  local L0_0, L1_1
  L0_0 = createGameObject2
  L1_1 = "SimpleModel"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setModelName
  L1_1(L0_0, "sky_po_a_root")
  L1_1 = L0_0.setPos
  L1_1(L0_0, Vector(0, 0, 0))
  L1_1 = "nashi"
  if L1_1 ~= nil then
    createGameObject2("SimpleModel"):setModelName(L1_1)
    createGameObject2("SimpleModel"):setPos(Vector(0, 0, 0))
    createGameObject2("SimpleModel"):setVisibleBlockEnable(false)
  end
end
