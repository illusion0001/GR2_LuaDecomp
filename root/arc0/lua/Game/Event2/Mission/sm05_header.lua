dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  Fn_loadEventData("evx/sm05_setup", {
    "evarea2_po_a_02"
  }, true)
  _GimBg = Fn_createGimmickBg("locator2_client", "newspaper_01", "cinewspaper01_base", false)
end
function Ingame()
  _GimBg:setIgnoreGrab(true)
  _GimBg:setCollidable(false)
end
function Finalize()
  local L0_0, L1_1
end
