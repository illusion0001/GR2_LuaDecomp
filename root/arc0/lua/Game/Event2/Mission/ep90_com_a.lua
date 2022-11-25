dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_move_request = ""
function Initialize()
  Fn_loadEventData("evx/ep90_common", {
    "evarea2_po_a_02_common"
  }, true)
  Player:setPowerUpLevel(Player.kPowUpCateg_Base, 5)
  Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 5)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life), true)
  if _mission_part == "ep90_a" then
  elseif _mission_part == "ep90_b" then
    Fn_setAreaWarp("po_a_15", "locator2_route_start")
  else
    Fn_setAreaWarp("po_a_15", "locator2_route_goal")
  end
end
function Ingame()
  GameDatabase:set(ggd.GlobalSystemFlags__AreaReset, false)
  while true do
    if _area_warp then
      _area_warp = false
      Fn_warpArea("po_a_15", _warp_node_name, false)
    end
    if _area_move then
      _area_move = false
      areaMove()
    end
    wait()
  end
end
function Finalize()
  GameDatabase:set(ggd.GlobalSystemFlags__AreaReset, true)
end
function requestAreaMove()
  local L0_0, L1_1
  _area_move = true
end
function requestAreaWarp(A0_2)
  local L1_3
  _area_warp = true
  _warp_node_name = A0_2
end
function areaMove()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  L0_4 = Fn_findAreaHandle
  L1_5 = "po_a_15"
  L0_4 = L0_4(L1_5)
  L1_5 = {}
  L2_6 = 1
  while true do
    L6_10 = string
    L6_10 = L6_10.format
    L7_11 = "%02d"
    L6_10 = L6_10(L7_11, L2_6)
    if L3_7 ~= nil then
      L1_5[L2_6] = L3_7
    else
      break
    end
    L2_6 = L2_6 + 1
  end
  L1_5[L2_6] = L3_7
  L3_7(L4_8, L5_9)
  L3_7(L4_8)
  for L6_10, L7_11 in L3_7(L4_8) do
    L0_4:appendMoveTarget(L7_11)
  end
  L3_7(L4_8)
end
