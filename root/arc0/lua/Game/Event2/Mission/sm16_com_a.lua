dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_mother_ship_hdl = nil
function Initialize()
  _mother_ship_hdl = findGameObject2("GimmickBg", "bg2_ship_01")
  _mother_ship_hdl:setActive(false)
  Mob:restrict_sm16_00(true)
end
function Ingame()
  while true do
    wait()
  end
end
function Finalize()
  Mob:restrict_sm16_00(false)
end
function motherShipSetActive(A0_0)
  _mother_ship_hdl:setActive(A0_0)
end
