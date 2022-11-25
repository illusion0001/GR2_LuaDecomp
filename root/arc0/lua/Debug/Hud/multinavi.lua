L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = {}
function L0_0.add_navi(A0_1)
  if HUD:mnaviFind(A0_1.obj):isValid() == false then
    HUD:mnaviNew({
      name = A0_1.obj
    }):setTrgPos(Vector(20, 20, 30))
    HUD:mnaviNew({
      name = A0_1.obj
    }):setActive(true)
  end
end
function L0_0.switch(A0_2)
  if A0_2.obj ~= nil and HUD:mnaviFind(A0_2.obj):isValid() then
    if HUD:mnaviFind(A0_2.obj):getActive() then
      HUD:mnaviFind(A0_2.obj):setActive(false)
    else
      HUD:mnaviFind(A0_2.obj):setActive(true)
    end
  end
end
function L0_0.change_param(A0_3)
  if A0_3.obj ~= nil and HUD:mnaviFind(A0_3.obj):isValid() then
    HUD:mnaviFind(A0_3.obj):setTrgPos(Vector(10, 11, 12))
    HUD:mnaviFind(A0_3.obj):setPochiDistanceDensity0(30)
    HUD:mnaviFind(A0_3.obj):setPochiDistanceDensity100(50)
    HUD:mnaviFind(A0_3.obj):setRangeMin(2)
  end
end
function L0_0.del_navi(A0_4)
  if A0_4.obj ~= nil and HUD:mnaviFind(A0_4.obj):isValid() then
    HUD:mnaviFind(A0_4.obj):del()
    HUD:mnaviFind(A0_4.obj):setActive(false)
  end
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.add_navi,
    data_label = "ADD_A",
    obj = "TestA"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch,
    data_label = "SWITCH_A",
    obj = "TestA"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.change_param,
    data_label = "CNG_A",
    obj = "TestA"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.del_navi,
    data_label = "DEL_A",
    obj = "TestA"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.add_navi,
    data_label = "ADD_B",
    obj = "TestB"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch,
    data_label = "SWITCH_B",
    obj = "TestB"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.change_param,
    data_label = "CNG_B",
    obj = "TestB"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.del_navi,
    data_label = "DEL_B",
    obj = "TestB"
  }
}
function L0_0.root.Execute(A0_5, A1_6)
  if A1_6.type == dbgCommon.kTypeFunction then
    dbgCommon.function_execute(A1_6)
  end
end
function test_multinavi()
  HUD:mnaviSetDbgPrint(true)
  dbgCommon.TreeExecute(L0_0.root)
end
