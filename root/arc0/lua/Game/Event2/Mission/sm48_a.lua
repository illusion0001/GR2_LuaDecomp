dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
function Initialize()
  Player:setStay(true, true)
end
function Ingame()
  local L0_0
  L0_0 = Fn_missionStart
  L0_0()
  function L0_0()
    Fn_setCraneShipInformation("g1_crane_pd_01")
    Fn_setCrew()
    HUD:menuDelCallback(HUD.kCallback_Retire)
  end
  Fn_kaiwaDemoView2("sm48_00100k", L0_0, true)
  Fn_userCtrlOn()
  Player:setStay(false)
  Fn_departure(event_name, "mine_hx")
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
