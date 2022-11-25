local L1_1
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "Pad"
L0_0(L1_1)
L0_0 = {L1_1}
L1_1 = {}
L1_1.model_name = "kit01_base"
L1_1.yure_name = "kit01_base"
L1_1.anim_name = "kit01_walk_00"
L1_1.pos = Vector(0, 0, 0)
L1_1 = {
  {
    name = "effect_test",
    model_name = "ef_prt_woodbox_03",
    pos = Vector(0, -2, 0)
  }
}
bg_table = {
  {
    name = "stone_imap_yy_22",
    pos = Vector(0, -2, 0)
  }
}
function main()
  local L0_2, L1_3, L2_4, L3_5
  L3_5 = "Display"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L3_5 = "DebugCam Activate"
  L0_2(L1_3, L2_4)
  for L3_5, _FORV_4_ in L0_2(L1_3) do
    print(L3_5)
    createGameObject2("Effect"):setName(_FORV_4_.name)
    createGameObject2("Effect"):setModelName(_FORV_4_.model_name)
    createGameObject2("Effect"):setPos(_FORV_4_.pos)
    createGameObject2("Effect"):play()
  end
  L0_2()
  L0_2()
  L0_2()
  while true do
    L3_5 = Pad
    L3_5 = L3_5.kButton_Enter
    if L1_3 then
      L3_5 = true
      L1_3(L2_4, L3_5)
    end
    L3_5 = Pad
    L3_5 = L3_5.kButton_Cancel
    if L1_3 then
      L3_5 = false
      L1_3(L2_4, L3_5)
    end
    L1_3()
  end
end
