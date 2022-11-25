L0_0 = import
L0_0("GameDatabase")
L0_0 = import
L0_0("math")
test_model = "building_sk_01"
L0_0 = {
  {
    name = "pfx_dirct_play_test",
    file_base_name = "sample_smk",
    pos = Vector(0, 5, 0)
  }
}
function main()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = Vector
  L0_1 = L0_1(L1_2, L2_3, L3_4)
  for L4_5, _FORV_5_ in L1_2(L2_3) do
    print(L4_5)
    createGameObject2("Effect"):setName(_FORV_5_.name)
    createGameObject2("Effect"):setModelName(_FORV_5_.file_base_name)
    createGameObject2("Effect"):setPos(L0_1 + _FORV_5_.pos)
    createGameObject2("Effect"):play()
  end
  L1_2()
  L1_2()
  L1_2()
end
