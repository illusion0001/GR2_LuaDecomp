local L1_1
L0_0 = {}
Felgar = L0_0
L0_0 = Felgar
function L1_1(A0_2, A1_3, A2_4)
  createGameObject2("FelineHaunterBrain"):setName("feline_haunter")
  createGameObject2("FelineHaunterBrain"):setParentPuppet(A1_3)
  if A2_4 ~= nil then
    createGameObject2("FelineHaunterBrain"):setFelType(A2_4)
  end
  createGameObject2("FelineHaunterBrain"):try_init()
  return (createGameObject2("FelineHaunterBrain"))
end
L0_0.createHaunter = L1_1
L0_0 = Felgar
function L1_1(A0_5, A1_6, A2_7)
  createGameObject2("FelineLeopardBrain"):setName("feline_leopard")
  createGameObject2("FelineLeopardBrain"):setParentPuppet(A1_6)
  if A2_7 ~= nil then
    createGameObject2("FelineLeopardBrain"):setFelType(A2_7)
  end
  createGameObject2("FelineLeopardBrain"):try_init()
  return (createGameObject2("FelineLeopardBrain"))
end
L0_0.createLeopard = L1_1
L0_0 = Felgar
function L1_1(A0_8, A1_9, A2_10)
  local L3_11, L4_12
  L3_11 = Felgar
  L4_12 = L3_11
  L3_11 = L3_11.createHaunter
  L3_11 = L3_11(L4_12, A1_9, A2_10)
  L4_12 = Felgar
  L4_12 = L4_12.createLeopard
  L4_12 = L4_12(L4_12, A1_9, A2_10)
  return L3_11, L4_12
end
L0_0.create = L1_1
