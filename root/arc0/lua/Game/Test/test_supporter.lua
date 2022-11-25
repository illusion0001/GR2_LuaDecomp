import("math")
import("common")
import("Debug")
import("Player")
import("HUD")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Debug/Action/debug_supporter.lua")
PlayerTestStage = {
  put_barrel = function(A0_0, A1_1)
    createGameObject2("GimmickBg"):setDrawModelName("barrel_kk_01")
    createGameObject2("GimmickBg"):setCollisionName("barrel_kk_01")
    createGameObject2("GimmickBg"):setAttributeName("barrel_kk_01")
    createGameObject2("GimmickBg"):setPos(A1_1)
    createGameObject2("GimmickBg"):setAutoRestore(5)
    return (createGameObject2("GimmickBg"))
  end,
  put_barrels = function(A0_2)
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 2, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 1, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z + 1))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 1, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z - 1))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 3, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z - 4))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 4, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z - 2))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 6, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z + 2))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x + 2.5, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z - 1.5))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x - 3.5, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z - 0.5))
    A0_2:put_barrel(Vector(Vector(-14, 0.65, 14).x, Vector(-14, 0.65, 14).y, Vector(-14, 0.65, 14).z - 3))
  end,
  enter = function(A0_3)
    DebugStage:createTestStage():setSceneParameters("mi_a_root")
    A0_3:put_barrels()
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    startAllGameObjects()
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
    Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
    tune = Player.kAttrTune_Normal
    Player:setAttrTune(tune, true)
    HUD:hpgDispReq_FadeIn()
    HUD:grgDispReq_FadeIn()
    HUD:spgDispReq_FadeIn()
    Debug_RegisterSpawners()
    Debug:setSwitch({
      "Development",
      "Console",
      "Standard"
    }, true)
    Debug:setSwitch({
      "Development",
      "Console",
      "Script"
    }, true)
    Debug:setSwitch({
      "Game Objects",
      "Supporter",
      "Console",
      "Misc"
    }, true)
    Debug:setSwitch({
      "Game Objects",
      "Supporter",
      "Console",
      "ActionSelector"
    }, true)
    Debug:setSwitch({
      "Game Objects",
      "Supporter",
      "Console",
      "AssistSelector"
    }, true)
    Debug_RegisterSpawners()
  end
}
function main()
  PlayerTestStage:enter()
  Supporter.Common.FirstAction():init()
  while true do
    Supporter.Common.FirstAction():step()
    wait()
  end
  Supporter.Common.FirstAction():term()
end
