import("Player")
import("Debug")
import("Font")
import("Mob")
import("GravityOre")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
__gravity_infinite_flag = 0
__sp_infinite_flag = 0
__immortal_flag = 0
__debug_hud_num = 0
__keytype = 0
__crow_pup = nil
__TaskHndl = nil
__moon_walk_liner_jump_type = 0
__full_power = 0
__bgmflag = 0
__mob_panic_flag = 0
__strong_enemy_mode = 0
__enemy_name_mode = ""
__disp_damage_info = false
__debug_grab_task = nil
DebugShortcutKey:registerKeyMap("action", {
  num1 = {
    desc = "Reload parameters",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "Player",
        "ReloadParameters"
      })
    end
  },
  num2 = {
    desc = "Recover life",
    proc = function()
      local L1_0
      L1_0 = Player
      L1_0 = L1_0.setEnergy
      L1_0(L1_0, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    end
  },
  num3 = {
    desc = "Recover SP.point",
    proc = function()
      local L1_1
      L1_1 = Player
      L1_1 = L1_1.setEnergy
      L1_1(L1_1, Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
    end
  },
  num4 = {
    desc = "Gravity Infinite on_off",
    proc = function()
      if __gravity_infinite_flag == 0 then
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "GravityPower: Infinite"
        }, true)
        print("gravity infinite")
      else
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "GravityPower: Infinite"
        }, false)
        print("gravity not infinite")
      end
      __gravity_infinite_flag = (__gravity_infinite_flag + 1) % 2
    end
  },
  num5 = {
    desc = "SP Infinite on_off",
    proc = function()
      if __sp_infinite_flag == 0 then
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "SpAttackPoint: Infinite"
        }, true)
        print("SP infinite")
      else
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "SpAttackPoint: Infinite"
        }, false)
        print("SP not infinite")
      end
      __sp_infinite_flag = (__sp_infinite_flag + 1) % 2
    end
  },
  num6 = {
    desc = "Life Infinite on_off",
    proc = function()
      if __immortal_flag == 0 then
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "LifePoint: Infinite"
        }, true)
        print("life infinite")
      else
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "LifePoint: Infinite"
        }, false)
        print("life not infinite")
      end
      __immortal_flag = (__immortal_flag + 1) % 2
    end
  },
  num7 = {
    desc = "Grab max slot",
    proc = function()
      Debug:setValue({
        "Game Objects",
        "Player",
        "PowerUp",
        "Debug: Add GrabSlot"
      }, 15)
    end
  },
  num8 = {
    desc = "crow create",
    proc = function()
      if __crow_pup == nil then
        invokeTask(function()
          local L0_2
          L0_2 = Player
          L0_2 = L0_2.getPuppet
          L0_2 = L0_2(L0_2)
          L0_2 = L0_2.getWorldPos
          L0_2 = L0_2(L0_2)
          print("pos=" .. tostring(L0_2))
          __crow_pup = Supporter.Spawner.create_supporter_crow(L0_2)
        end)
      else
        __crow_pup:kill()
        __crow_pup = nil
      end
    end
  },
  num9 = {
    desc = "Full Power",
    proc = function()
      if __full_power == 0 then
        Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
        Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "GravityPower: Infinite"
        }, true)
        __gravity_infinite_flag = 1
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "SpAttackPoint: Infinite"
        }, true)
        __sp_infinite_flag = 1
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "LifePoint: Infinite"
        }, true)
        __immortal_flag = 1
        __full_power = 1
        Player:setPowerUpLevel(Player.kPowUpCateg_Base, 17)
        Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 10)
        Player:setPowerUpLevel(Player.kPowUpCateg_Dodge, 5)
        Player:setPowerUpLevel(Player.kPowUpCateg_GravityKick, 10)
        Player:setPowerUpLevel(Player.kPowUpCateg_Grab, 9)
        Player:setPowerUpLevel(Player.kPowUpCateg_Slider, 5)
        Player:setPowerUpLevel(Player.kPowUpCateg_SpecialAtk, 6)
        print("Full Power On")
      else
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "GravityPower: Infinite"
        }, false)
        __gravity_infinite_flag = 0
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "SpAttackPoint: Infinite"
        }, false)
        __sp_infinite_flag = 0
        Debug:setSwitch({
          "Game Objects",
          "Player",
          "LifePoint: Infinite"
        }, false)
        __immortal_flag = 0
        __full_power = 0
        Player:setPowerUpLevel(Player.kPowUpCateg_Base, 0)
        Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 0)
        Player:setPowerUpLevel(Player.kPowUpCateg_Dodge, 0)
        Player:setPowerUpLevel(Player.kPowUpCateg_GravityKick, 0)
        Player:setPowerUpLevel(Player.kPowUpCateg_Grab, 0)
        Player:setPowerUpLevel(Player.kPowUpCateg_Slider, 0)
        Player:setPowerUpLevel(Player.kPowUpCateg_SpecialAtk, 0)
        print("Full Power Off")
      end
    end
  },
  num0 = {
    desc = "Retry",
    proc = function()
      local L0_3, L1_4, L2_5
      L0_3 = findGameObject2
      L1_4 = "Sandbox2"
      L2_5 = g_initial_sandbox_name
      L0_3 = L0_3(L1_4, L2_5)
      if L0_3 == nil then
        L1_4 = false
        return L1_4
      end
      L2_5 = L0_3
      L1_4 = L0_3.findGameObject2
      L1_4 = L1_4(L2_5, "Sandbox2", "mother2")
      if L1_4 == nil then
        L2_5 = false
        return L2_5
      end
      L2_5 = GameDatabase
      L2_5 = L2_5.get
      L2_5 = L2_5(L2_5, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L2_5 ~= "eventheader" then
        if L1_4:findGameObject2("Sandbox2", L2_5) == nil then
          return false
        end
        L1_4:findGameObject2("Sandbox2", L2_5):sendEvent("Fn_nextMission")
        L1_4:findGameObject2("Sandbox2", L2_5):sendEvent("Fn_exitSandbox")
      end
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
  j = {
    desc = "JumpModeChange",
    proc = function()
      local L0_6
      function L0_6(A0_7)
        for _FORV_5_ = 1, 60 do
          Font:asciiPrint(650, 300, ({
            "X key hold duration",
            "stick hold or neutral",
            "stick just-time input"
          })[A0_7 + 1])
          wait()
        end
      end
      Debug:setValue({
        "Game Objects",
        "Player",
        "NewMoonWalk"
      }, true)
      Debug:setValue({
        "Game Objects",
        "Player",
        "MoonWalkJumpType"
      }, 0)
      Debug:setValue({
        "Game Objects",
        "Player",
        "MoonWalkLinerJumpType"
      }, __moon_walk_liner_jump_type)
      if __TaskHndl ~= nil then
        __TaskHndl:abort()
        __TaskHndl = nil
      end
      __TaskHndl = invokeTask(L0_6, __moon_walk_liner_jump_type)
      __moon_walk_liner_jump_type = (__moon_walk_liner_jump_type + 1) % 3
    end
  },
  u = {
    desc = "Talisman",
    proc = function()
      local L0_8, L1_9, L2_10, L3_11
      for L3_11 = 16, 25 do
        HUD:giveUniqueTalisman(L3_11)
      end
      for L3_11 = 36, 50 do
        HUD:giveUniqueTalisman(L3_11)
      end
      for L3_11 = 55, 80 do
        HUD:giveUniqueTalisman(L3_11)
      end
      for L3_11 = 81, 97 do
        HUD:giveUniqueTalisman(L3_11)
      end
      L0_8(L1_9, L2_10)
    end
  },
  p = {
    desc = "Mob Panic",
    proc = function()
      if __mob_panic_flag == 0 then
        Mob:makeSituationPanic(true)
        __mob_panic_flag = 1
        print("mob panic")
      else
        Mob:makeSituationPanic(false)
        __mob_panic_flag = 0
        print("mob no panic")
      end
    end
  },
  ins = {
    desc = "strong enemy mode",
    proc = function()
      local L0_12, L1_13
      L0_12 = __strong_enemy_mode
      L0_12 = L0_12 + 1
      L0_12 = L0_12 % 3
      __strong_enemy_mode = L0_12
      L0_12 = __strong_enemy_mode
      if L0_12 == 0 then
        __enemy_name_mode = ""
      else
        L0_12 = __strong_enemy_mode
        if L0_12 == 1 then
          __enemy_name_mode = " st"
        else
          L0_12 = __strong_enemy_mode
          if L0_12 == 2 then
            __enemy_name_mode = " rare"
          else
            __enemy_name_mode = ""
          end
        end
      end
    end
  },
  i = {
    desc = "IkariCHOTEN",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "Player",
        "Feline",
        "IkariMax"
      })
    end
  },
  l = {
    desc = "Average Level",
    proc = function()
      Player:setPowerUpLevel(Player.kPowUpCateg_Base, 7)
      Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 6)
      Player:setPowerUpLevel(Player.kPowUpCateg_Dodge, 2)
      Player:setPowerUpLevel(Player.kPowUpCateg_GravityKick, 7)
      Player:setPowerUpLevel(Player.kPowUpCateg_Grab, 5)
      Player:setPowerUpLevel(Player.kPowUpCateg_Slider, 2)
      Player:setPowerUpLevel(Player.kPowUpCateg_SpecialAtk, 3)
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
      local L0_14
      L0_14 = {}
      L0_14.entry_class = "stalker"
      L0_14.spawncount = 1
      L0_14.front_length = 20
      L0_14.center_offset_y = 0
      L0_14.radius = 0
      L0_14.ground = true
      L0_14.entry_class = "" .. L0_14.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_14)
    end
  },
  w = {
    desc = "Spawn enemy: x1 GellyFish",
    proc = function()
      local L0_15
      L0_15 = {}
      L0_15.entry_class = "gellyfish"
      L0_15.spawncount = 1
      L0_15.front_length = 20
      L0_15.center_offset_y = 6
      L0_15.radius = 0
      L0_15.ground = false
      L0_15.entry_class = "" .. L0_15.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_15)
    end
  },
  e = {
    desc = "Spawn enemy: x1 Giant",
    proc = function()
      local L0_16
      L0_16 = {}
      L0_16.entry_class = "giant"
      L0_16.spawncount = 1
      L0_16.front_length = 20
      L0_16.center_offset_y = 0
      L0_16.radius = 0
      L0_16.ground = true
      L0_16.entry_class = "" .. L0_16.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_16)
    end
  },
  r = {
    desc = "Spawn enemy: x1 Runner",
    proc = function()
      local L0_17
      L0_17 = {}
      L0_17.entry_class = "runner"
      L0_17.spawncount = 1
      L0_17.front_length = 20
      L0_17.center_offset_y = 0
      L0_17.radius = 0
      L0_17.ground = true
      L0_17.entry_class = "" .. L0_17.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_17)
    end
  },
  f = {
    desc = "Spawn enemy: x1 lasercannon",
    proc = function()
      local L0_18
      L0_18 = {}
      L0_18.entry_class = "lasercannon"
      L0_18.spawncount = 1
      L0_18.front_length = 20
      L0_18.center_offset_y = 6
      L0_18.radius = 0
      L0_18.ground = false
      L0_18.entry_class = "" .. L0_18.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_18)
    end
  },
  t = {
    desc = "Spawn enemy: x1 Imp",
    proc = function()
      local L0_19
      L0_19 = {}
      L0_19.entry_class = "imp"
      L0_19.spawncount = 1
      L0_19.front_length = 20
      L0_19.center_offset_y = 6
      L0_19.radius = 0
      L0_19.ground = false
      L0_19.entry_class = "" .. L0_19.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_19)
    end
  },
  h = {
    desc = "Spawn enemy: x1 Soldier",
    proc = function()
      local L0_20
      L0_20 = {}
      L0_20.entry_class = "soldier_rifle"
      L0_20.spawncount = 1
      L0_20.front_length = 20
      L0_20.center_offset_y = 0
      L0_20.radius = 0
      L0_20.ground = true
      DebugEnemySpawn(L0_20)
    end
  },
  m = {
    desc = "Spawn enemy: x1 mechsmall",
    proc = function()
      local L0_21
      L0_21 = {}
      L0_21.entry_class = "mechsmall"
      L0_21.spawncount = 1
      L0_21.front_length = 20
      L0_21.center_offset_y = 3
      L0_21.radius = 0
      L0_21.ground = true
      DebugEnemySpawn(L0_21)
    end
  },
  c = {
    desc = "Spawn enemy: x1 treecannon",
    proc = function()
      local L0_22
      L0_22 = {}
      L0_22.entry_class = "treecannon"
      L0_22.spawncount = 1
      L0_22.front_length = 20
      L0_22.center_offset_y = 1
      L0_22.radius = 0
      L0_22.ground = true
      L0_22.entry_class = "" .. L0_22.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_22)
    end
  },
  g = {
    desc = "Spawn enemy: x1 Guard Core",
    proc = function()
      local L0_23
      L0_23 = {}
      L0_23.entry_class = "guardcore"
      L0_23.spawncount = 1
      L0_23.front_length = 20
      L0_23.center_offset_y = 0
      L0_23.radius = 0
      L0_23.ground = true
      L0_23.entry_class = "" .. L0_23.entry_class .. __enemy_name_mode
      DebugEnemySpawn(L0_23)
    end
  },
  z = {
    desc = "Spawn random debris",
    proc = function()
      invokeTask(function()
        local L0_24, L1_25
        L0_24 = createGameObject2
        L1_25 = "GimmickBg"
        L0_24 = L0_24(L1_25)
        obj = "container_kk_01"
        L1_25 = L0_24.setName
        L1_25(L0_24, obj)
        L1_25 = L0_24.setDrawModelName
        L1_25(L0_24, obj)
        L1_25 = L0_24.setCollisionName
        L1_25(L0_24, obj)
        L1_25 = L0_24.setAttributeName
        L1_25(L0_24, obj)
        L1_25 = L0_24.try_init
        L1_25(L0_24)
        L1_25 = L0_24.waitForReady
        L1_25(L0_24)
        L1_25 = Player
        L1_25 = L1_25.getPuppet
        L1_25 = L1_25(L1_25)
        L1_25 = L1_25.getWorldPos
        L1_25 = L1_25(L1_25)
        L0_24:setIgnoreGrab(false)
        L0_24:setWorldPos(L1_25)
        L0_24:setForceMove()
        L0_24:try_start()
      end)
    end
  },
  x = {
    desc = "Spawn random BG gimmicks",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "DebriSpawn",
        "debri x5"
      })
    end
  },
  b = {
    desc = "GravityOreBreak Player Front 10x10",
    proc = function()
      GravityOre:Debug_Break(10)
    end
  },
  n = {
    desc = "GravityOreBreak Player Front 50x50",
    proc = function()
      GravityOre:Debug_Break(50)
    end
  },
  atmark = {
    desc = "Disp Damage Info",
    proc = function()
      __disp_damage_info = not __disp_damage_info
      Debug:setSwitch({
        "Game Objects",
        "Player",
        "DebugDispSwitches",
        "Damage Info"
      }, __disp_damage_info)
      Debug:setSwitch({
        "Display",
        "DebugDrawGroup",
        "Player"
      }, true)
    end
  }
})
