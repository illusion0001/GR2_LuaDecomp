import("math")
import("common")
import("Debug")
import("Player")
import("HUD")
import("Sound")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
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
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 2, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 1, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z + 1))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 1, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 1))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 3, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 4))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 4, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 2))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 6, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z + 2))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 2.5, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 1.5))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x - 3.5, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 0.5))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 3))
  end,
  enter = function(A0_3)
    Savedata:setBasename("crow")
    Sound:loadResource("player2_se")
    Sound:loadResource("player2_vo")
    A0_3:put_barrels()
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    startAllGameObjects()
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
    Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
    Debug:setSwitch({
      "Game Objects",
      "Player",
      "NewMoonWalk"
    }, true)
    tune = Player.kAttrTune_Normal
    Player:setAttrTune(tune, true)
    HUD:hpgDispReq_FadeIn()
    HUD:grgDispReq_FadeIn()
    HUD:spgDispReq_FadeIn()
    Debug:setSwitch({"Display", "Debug Draw"}, true)
    Debug:setSwitch({
      "Display",
      "DebugDrawGroup",
      "Player"
    }, true)
    Debug:setSwitch({
      "Display",
      "File Asset Status"
    }, false)
    Debug:setSwitch({
      "Display",
      "Warning Indicator"
    }, false)
    Debug_RegisterSpawners()
  end
}
function main()
  HUD:menuOpen("Main")
  PlayerTestStage:enter()
end
