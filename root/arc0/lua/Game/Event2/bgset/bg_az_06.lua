dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_az_06_param.lua")
_evb_list = {
  "city_block_az6_a"
}
function createArea()
  lightdark = createGameObject2("Area")
  lightdark:setName("az6_a_root")
  setAreaRootHandle("lightdark", lightdark)
  lightdark:setDriftEnable(false)
end
function setAreaDetail()
  local L0_0, L1_1
end
