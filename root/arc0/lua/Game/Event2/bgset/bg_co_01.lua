dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_co_a_param.lua")
_evb_list = {
  "city_block_co_a",
  "scene_param_co_a"
}
function createArea()
  co = createGameObject2("Area")
  co:setName("co_a_root")
  setAreaRootHandle("co", co)
  co:setDriftParams(DRIFT_PARAM_CO_A)
  co:setDriftInherit(true)
  co:setDriftEnable(false)
  GameDatabase:set(ggd.Menu__MapName, "None")
end
function setAreaDetail()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = {
    L1_1,
    L2_2,
    L3_3
  }
  for L4_4 = 1, 65 do
    L5_5 = table
    L5_5 = L5_5.insert
    L5_5(L0_0, "co_a_07_" .. L4_4)
  end
  for L4_4 = 66, 105 do
    L5_5 = table
    L5_5 = L5_5.insert
    L5_5(L0_0, "co_a_12_" .. L4_4)
  end
  for L4_4 = 106, 125 do
    L5_5 = table
    L5_5 = L5_5.insert
    L5_5(L0_0, "co_a_11_" .. L4_4)
  end
  for L4_4, L5_5 in L1_1(L2_2) do
    if findGameObject2("Area", L5_5) == nil then
      print("null =" .. L5_5)
    end
    findGameObject2("Area", L5_5):setDriftEnable(false)
  end
end
function scene_param_co_in_onEnter()
  co:setSceneParameters("co_a_root")
end
function scene_param_co_out_onEnter()
  co:setSceneParameters("co_a_outside_root")
end
