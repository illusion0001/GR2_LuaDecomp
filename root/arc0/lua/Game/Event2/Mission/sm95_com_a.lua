dofile("/Game/Event2/Common/HeaderCommon.lua")
level5 = false
move_15 = false
move_15_2 = false
warp_15 = false
function Initialize()
  local L0_0
  L0_0 = {
    "evarea2_po_a_root"
  }
  Fn_loadEventData("evx/sm95_common", L0_0, true)
end
function Ingame()
  repeat
    if move_15 == true then
      repeat
        wait()
      until Fn_warpArea("po_a_15", "locator2_po_a_15")
      warp_15 = true
    end
    if move_15_2 == true then
      repeat
        wait()
      until Fn_warpArea("po_a_15", "locator2_po_a_15_02")
      warp_15 = true
    end
    wait()
  until warp_15 == true
end
function Finalize()
  local L0_1, L1_2
end
function levelset()
  if level5 == false then
    Player:setPowerUpLevel(Player.kPowUpCateg_Base, 5)
    Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 5)
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life), true)
    Player:setEnergy(Player.kEnergy_SpAttack, 0)
    level5 = true
  end
end
function move_area_po_a_15()
  local L0_3, L1_4
  move_15 = true
end
function move_area_po_a_15_2()
  local L0_5, L1_6
  move_15_2 = true
end
function warp_po_a_15()
  local L0_7, L1_8
  L0_7 = warp_15
  return L0_7
end
