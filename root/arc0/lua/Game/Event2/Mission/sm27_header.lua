dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
objs_beacon = {}
function Initialize()
  local L0_0, L1_1
  L0_0 = table
  L0_0 = L0_0.insert
  L1_1 = objs_beacon
  L0_0(L1_1, RAC_createGimmickBg("beacon_01", "beacon_md_01", "locator2_beacon_01", true, false, nil, false, "beacon_md_01_sm27"))
  L0_0 = table
  L0_0 = L0_0.insert
  L1_1 = objs_beacon
  L0_0(L1_1, RAC_createGimmickBg("beacon_02", "beacon_md_01", "locator2_beacon_02", true, false, nil, false, "beacon_md_01_sm27"))
  L0_0 = table
  L0_0 = L0_0.insert
  L1_1 = objs_beacon
  L0_0(L1_1, RAC_createGimmickBg("beacon_03", "beacon_md_01", "locator2_beacon_03", true, false, nil, false, "beacon_md_01_sm27"))
end
function Ingame()
  local L0_2, L1_3
end
function Finalize()
  local L0_4, L1_5
end
