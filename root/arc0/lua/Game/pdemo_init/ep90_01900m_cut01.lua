import("Debug")
dofile("/Game/Test/test_polydemo.lua")
pdemo_name = "ep90_01900m_cut01"
function init_bg()
  local L0_0, L1_1
  L0_0 = createGameObject2
  L1_1 = "SimpleModel"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setModelName
  L1_1(L0_0, "")
  L1_1 = L0_0.setPos
  L1_1(L0_0, Vector(0, 0, 0))
  L1_1 = ""
  if L1_1 ~= nil then
    createGameObject2("SimpleModel"):setModelName(L1_1)
    createGameObject2("SimpleModel"):setPos(Vector(0, 0, 0))
  end
end
