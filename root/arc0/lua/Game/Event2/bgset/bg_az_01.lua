dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_az_01_param.lua")
_evb_list = {
  "city_block_az_a"
}
function createArea()
  local L0_0
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  L0_0:setName("az_a_root")
  setAreaRootHandle("ad", L0_0)
  L0_0:setDriftParams(DRIFT_PARAM_ANOTHER_ZONE_01)
  L0_0:setDriftInherit(true)
  L0_0:setDriftEnable(false)
end
function setAreaDetail()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = getAreaRootHandle
  L1_2 = "ad"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1.getChildren
  L1_2 = L1_2(L2_3)
  for L5_6, L6_7 in L2_3(L3_4) do
    L8_9 = L6_7
    L7_8 = L6_7.getName
    L7_8 = L7_8(L8_9)
    L8_9 = string
    L8_9 = L8_9.match
    L8_9 = L8_9(L7_8, "az_a_08")
    if L8_9 ~= nil then
      L8_9 = L6_7.setDriftEnable
      L8_9(L6_7, true)
    else
      L8_9 = string
      L8_9 = L8_9.match
      L8_9 = L8_9(L7_8, "az_a_06")
      if L8_9 ~= nil then
        L8_9 = L6_7.setDriftEnable
        L8_9(L6_7, true)
      else
        L8_9 = string
        L8_9 = L8_9.match
        L8_9 = L8_9(L7_8, "az_a_09")
        if L8_9 ~= nil then
          L8_9 = L6_7.setDriftEnable
          L8_9(L6_7, true)
        else
          L8_9 = L6_7.setDriftEnable
          L8_9(L6_7, false)
        end
      end
    end
    L8_9 = L6_7.getChildren
    L8_9 = L8_9(L6_7)
    for _FORV_12_, _FORV_13_ in pairs(L8_9) do
      print(tostring(_FORV_13_:getName()))
      _FORV_13_:setDriftEnable(false)
    end
  end
  L5_6 = DRIFT_PARAM_SUBAREA_ANOTHER_ZONE_01
  L2_3(L3_4, L4_5, L5_6)
  L2_3(L3_4, L4_5)
end
