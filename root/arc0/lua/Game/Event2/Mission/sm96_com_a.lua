dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
end
function Finalize()
  local L0_4, L1_5
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
