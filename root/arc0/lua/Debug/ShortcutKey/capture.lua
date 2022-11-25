import("Player")
import("Debug")
import("Font")
import("Mob")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
__sp_infinite_flag = false
__mob_panic_flag = false
__hud_off_flag = false
DebugShortcutKey:registerKeyMap("capture", {
  c = {
    desc = "Capture Start / End",
    proc = function()
      if Debug:setSwitch({"Display", "Debug Draw"}) == false then
        Debug:setSwitch({"Display", "Debug Draw"}, true)
      end
      Debug:setSwitch({
        "Capture / ScreenShot",
        "Capture Movie"
      })
    end
  },
  v = {
    desc = "Capture Start / End(HUD Off)",
    proc = function()
      if Debug:getSwitch({
        "Display",
        "HUD",
        "Off"
      }) then
        if __hud_off_flag then
          Debug:setSwitch({
            "Display",
            "HUD",
            "Off"
          }, false)
          __hud_off_flag = false
        end
      else
        Debug:setSwitch({
          "Display",
          "HUD",
          "Off"
        }, true)
        __hud_off_flag = true
      end
      Debug:setSwitch({
        "Capture / ScreenShot",
        "Capture Movie"
      })
    end
  },
  num1 = {
    desc = "HUD On/Off",
    proc = function()
      if Debug:getSwitch({
        "Display",
        "HUD",
        "Off"
      }) then
        Debug:setSwitch({
          "Display",
          "HUD",
          "Off"
        }, false)
      else
        Debug:setSwitch({
          "Display",
          "HUD",
          "Off"
        }, true)
      end
    end
  },
  num5 = {
    desc = "setPowerUpLevel 5",
    proc = function()
      Player:setPowerUpLevel(Player.kPowUpCateg_Base, 5)
      Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 5)
    end
  },
  num8 = {
    desc = "crow create",
    proc = function()
      if __crow_pup == nil then
        invokeTask(function()
          local L0_0
          L0_0 = Player
          L0_0 = L0_0.getPuppet
          L0_0 = L0_0(L0_0)
          L0_0 = L0_0.getWorldPos
          L0_0 = L0_0(L0_0)
          print("pos=" .. tostring(L0_0))
          __crow_pup = Supporter.Spawner.create_supporter_crow(L0_0)
        end)
      else
        __crow_pup:kill()
        __crow_pup = nil
      end
    end
  },
  num9 = {
    desc = "SP Infinite on_off",
    proc = function()
      if __sp_infinite_flag == false then
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "SpAttackPoint: Infinite"
        }, true)
        print("SP infinite")
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "GravityPower: Infinite"
        }, true)
        print("gravity infinite")
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "LifePoint: Infinite"
        }, true)
        print("immortal")
      else
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "SpAttackPoint: Infinite"
        }, false)
        print("SP no infinite")
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "GravityPower: Infinite"
        }, false)
        print("gravity no infinite")
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "LifePoint: Infinite"
        }, false)
        print("no immortal")
      end
      __sp_infinite_flag = not __sp_infinite_flag
    end
  },
  del = {
    desc = "Exit Sandbox",
    proc = function()
      Debug:setSwitch({
        "Exit Sandbox"
      }, nil)
    end
  },
  p = {
    desc = "Mob Panic",
    proc = function()
      if __mob_panic_flag == false then
        Mob:makeSituationPanic(true)
        print("mob panic")
      else
        Mob:makeSituationPanic(false)
        print("mob no panic")
      end
      __mob_panic_flag = not __mob_panic_flag
    end
  },
  l = {
    desc = "Recover life",
    proc = function()
      local L1_1
      L1_1 = Player
      L1_1 = L1_1.setEnergy
      L1_1(L1_1, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    end
  },
  a = {
    desc = "Break one core",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "Enemy",
        "EnemySpawn",
        "Break one core"
      })
    end
  },
  s = {
    desc = "Break cores in sight",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "Enemy",
        "EnemySpawn",
        "Break cores in sight"
      })
    end
  },
  d = {
    desc = "Destroy all enemies",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "Enemy",
        "EnemySpawn",
        "Destroy all enemies"
      })
    end
  },
  q = {
    desc = "Spawn enemy: x1 Stalker",
    proc = function()
      local L0_2
      L0_2 = {}
      L0_2.entry_class = "stalker"
      L0_2.spawncount = 1
      L0_2.front_length = 20
      L0_2.center_offset_y = 0
      L0_2.radius = 0
      L0_2.ground = true
      DebugEnemySpawn(L0_2)
    end
  },
  w = {
    desc = "Spawn enemy: x1 GellyFish",
    proc = function()
      local L0_3
      L0_3 = {}
      L0_3.entry_class = "gellyfish"
      L0_3.spawncount = 1
      L0_3.front_length = 20
      L0_3.center_offset_y = 6
      L0_3.radius = 0
      L0_3.ground = false
      DebugEnemySpawn(L0_3)
    end
  },
  o = {
    desc = "Spawn enemy: x1 guardcore",
    proc = function()
      local L0_4
      L0_4 = {}
      L0_4.entry_class = "guardcore"
      L0_4.spawncount = 1
      L0_4.front_length = 20
      L0_4.center_offset_y = 6
      L0_4.radius = 0
      L0_4.ground = true
      DebugEnemySpawn(L0_4)
    end
  },
  e = {
    desc = "Spawn enemy: x1 Giant",
    proc = function()
      local L0_5
      L0_5 = {}
      L0_5.entry_class = "giant"
      L0_5.spawncount = 1
      L0_5.front_length = 15
      L0_5.center_offset_y = 0
      L0_5.radius = 0
      L0_5.ground = true
      DebugEnemySpawn(L0_5)
    end
  },
  r = {
    desc = "Spawn enemy: x1 Runner",
    proc = function()
      local L0_6
      L0_6 = {}
      L0_6.entry_class = "runner"
      L0_6.spawncount = 1
      L0_6.front_length = 20
      L0_6.center_offset_y = 0
      L0_6.radius = 0
      L0_6.ground = true
      DebugEnemySpawn(L0_6)
    end
  },
  i = {
    desc = "Spawn enemy: x1 Imp",
    proc = function()
      local L0_7
      L0_7 = {}
      L0_7.entry_class = "imp"
      L0_7.spawncount = 1
      L0_7.front_length = 20
      L0_7.center_offset_y = 6
      L0_7.radius = 0
      L0_7.ground = false
      DebugEnemySpawn(L0_7)
    end
  },
  h = {
    desc = "Spawn enemy: x1 Soldier",
    proc = function()
      local L0_8
      L0_8 = {}
      L0_8.entry_class = "soldier_rifle"
      L0_8.spawncount = 1
      L0_8.front_length = 20
      L0_8.center_offset_y = 0
      L0_8.radius = 0
      L0_8.ground = true
      DebugEnemySpawn(L0_8)
    end
  },
  m = {
    desc = "Spawn enemy: x1 mechsmall",
    proc = function()
      local L0_9
      L0_9 = {}
      L0_9.entry_class = "mechsmall"
      L0_9.spawncount = 1
      L0_9.front_length = 20
      L0_9.center_offset_y = 3
      L0_9.radius = 0
      L0_9.ground = true
      DebugEnemySpawn(L0_9)
    end
  },
  t = {
    desc = "Spawn enemy: x1 treecannon",
    proc = function()
      local L0_10
      L0_10 = {}
      L0_10.entry_class = "treecannon"
      L0_10.spawncount = 1
      L0_10.front_length = 20
      L0_10.center_offset_y = 1
      L0_10.radius = 0
      L0_10.ground = true
      DebugEnemySpawn(L0_10)
    end
  },
  g = {
    desc = "Spawn enemy: x1 Guard Core",
    proc = function()
      local L0_11
      L0_11 = {}
      L0_11.entry_class = "guardcore"
      L0_11.spawncount = 1
      L0_11.front_length = 20
      L0_11.center_offset_y = 0
      L0_11.radius = 0
      L0_11.ground = true
      DebugEnemySpawn(L0_11)
    end
  }
})
