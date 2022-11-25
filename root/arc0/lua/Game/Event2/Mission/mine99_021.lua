dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Mission/mine04_common.lua")
_event_file_name = "floor_021"
_floor_num = 21
_litho_theme = nil
_enemyCount = 0
_enemyCountMax = 0
_vortex_hit = false
_vortex_task = nil
_damage_enemy_count = 0
_enemy_names = {}
_litho_wait_task = nil
_throw_check_task = nil
_ANMO_MAX = 15
enmgen2_a_20_mine99_021 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_20_03",
      name = "lasercannon01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_01",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_14",
      name = "gellyfish13"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_15",
      name = "gellyfish14"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_16",
      name = "gellyfish15"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_20",
      name = "gellyfish19"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_21",
      name = "gellyfish20"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_20_22",
      name = "gellyfish21"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    _enemyCount = _enemyCount - 1
    HUD:counter999SubNum()
    if _enemyCount <= 0 and _litho_theme ~= false then
      _litho_theme = true
    end
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_a_16_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_12",
      locator = "locator_a_16_01",
      name = "treecannon01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_16_02",
      name = "runner01"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_16_03",
      name = "lasercannon01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_16_04",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_16_05",
      name = "gellyfish02"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_16_06",
      name = "gellyfish03"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onPopGem = function(A0_24, A1_25)
    EnemeyDropGem(A0_24, A1_25)
  end
}
enmgen2_a_17_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_12",
      locator = "locator_a_17_01",
      name = "treecannon01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_17_02",
      name = "runner01"
    },
    {
      type = "defender_mine_12",
      locator = "locator_a_17_03",
      name = "defender01"
    },
    {
      type = "imp_mine_12",
      locator = "locator_a_17_04",
      name = "imp01"
    },
    {
      type = "imp_mine_12",
      locator = "locator_a_17_05",
      name = "imp02"
    },
    {
      type = "imp_mine_12",
      locator = "locator_a_17_06",
      name = "imp03"
    },
    {
      type = "jammer_mine_02",
      locator = "locator_a_17_07",
      name = "jammer01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onSpawn = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onPopGem = function(A0_38, A1_39)
    EnemeyDropGem(A0_38, A1_39)
  end
}
enmgen2_a_18_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "giant_mine_12",
      locator = "locator_a_18_01",
      name = "giant01"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_18_02",
      name = "treecannon01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_18_03",
      name = "stalker01"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_18_04",
      name = "treecannon02"
    },
    {
      type = "defender_mine_12",
      locator = "locator_a_18_05",
      name = "defender01"
    },
    {
      type = "defender_mine_12",
      locator = "locator_a_18_06",
      name = "defender02"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onSpawn = function(A0_46, A1_47)
  end,
  onObjectAsh = function(A0_48, A1_49)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onPopGem = function(A0_52, A1_53)
    EnemeyDropGem(A0_52, A1_53)
  end
}
function InitializeBody()
  local L0_54
  L0_54 = {}
  L0_54.mineOreEvdName = "mine04_ore"
  L0_54.instance_flg = true
  L0_54.manager_name = g_own:getName()
  L0_54.deploy_areas = getElectedAreaNames()
  L0_54.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_54
end
function IngameBody()
  local L0_55, L1_56, L2_57, L3_58, L4_59, L5_60
  L0_55 = {
    L1_56,
    L2_57,
    L3_58
  }
  L1_56 = "az2_a_16"
  L1_56 = {
    L2_57,
    L3_58,
    L4_59
  }
  if L2_57 == false then
    L5_60 = true
    L2_57(L3_58, L4_59, L5_60)
    L5_60 = true
    L2_57(L3_58, L4_59, L5_60)
    L5_60 = true
    L2_57(L3_58, L4_59, L5_60)
    L5_60 = true
    L2_57(L3_58, L4_59, L5_60)
    L5_60 = true
    L2_57(L3_58, L4_59, L5_60)
    _create_fire_effect = true
  end
  for L5_60 = 1, _ANMO_MAX do
    if findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_60)) ~= nil then
      findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_60)):setVisiblePermission(false)
    end
  end
  L2_57()
  L2_57()
  L2_57()
  if L2_57 then
    L2_57(L3_58)
  else
    L2_57()
    L2_57(L3_58)
    repeat
      L2_57()
    until L2_57
    L2_57()
    L5_60 = nil
    L2_57(L3_58, L4_59, L5_60, true)
    for L5_60 = 1, #L0_55 do
      requestEnemyKill(L0_55[L5_60], L1_56[L5_60])
    end
    for L5_60 = 1, _ANMO_MAX do
      findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_60)):setVisiblePermission(true)
      if findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_60)):isBroken() then
        findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_60)):requestRestoreForce()
      end
    end
    L2_57(L3_58)
    if L2_57 ~= nil then
      L3_58(L4_59)
      _enemyCount = L3_58
      _enemyCountMax = L3_58
    end
    L5_60 = L2_57
    L4_59(L5_60, "DamageEnemyReport", Fn_damageEnemyReport)
    L5_60 = L4_59
    L4_59(L5_60, "ic_pi_mine99_002")
    L5_60 = L4_59
    L4_59(L5_60, HUD.kCount99_99IconType_Stone)
    L5_60 = L4_59
    L4_59(L5_60, _enemyCount)
    L5_60 = L4_59
    L4_59(L5_60, true)
    function L5_60()
      local L0_61, L1_62, L2_63, L3_64, L4_65, L5_66
      L0_61 = false
      L1_62 = false
      L2_63 = false
      L3_64 = 0
      L4_65 = 0
      L5_66 = 0
      while true do
        L2_63 = L1_62
        L1_62 = Pad:getButton(Pad.kButton_RR)
        L5_66 = L4_65
        L4_65 = Player:getGrabThrownObjectCount()
        if L0_61 == false then
          L0_61 = 0 < Player:getGrabObjectCount()
        end
        if L5_66 ~= L4_65 then
          if L5_66 < L4_65 then
            L3_64 = L3_64 + 1
            print("=====throw_num:" .. L3_64 .. "=====")
            if L3_64 > 3 then
              _litho_theme = false
            end
          end
          L0_61 = false
        end
        if L4_65 == 0 and _vortex_hit == false and L3_64 >= 3 and _damage_enemy_count < _enemyCountMax then
          _litho_theme = false
        end
        wait()
      end
    end
    _throw_check_task = L4_59
    function L5_60()
      while _litho_theme == nil do
        wait()
      end
      HUD:counter999SetVisible(false)
      Fn_missionInfoEnd()
      if _litho_theme == true then
        missionComplete()
        repeat
          wait()
        until isSecondHalfProcessWait()
        setSecondHalfProcessEnd()
        Fn_setMine99FloorClear()
        lithoThemeInit()
        Fn_setGravityGateActive(true)
      elseif _litho_theme == false then
        missionFailure()
        repeat
          wait()
        until isFailureProcessEnd()
        Fn_blackout()
        if L3_58 ~= nil then
          L3_58:kill()
          L3_58 = nil
        end
        Fn_retryMine99()
      end
    end
    _litho_wait_task = L4_59
    break
  end
end
function Fn_damageEnemyReport(A0_67)
  local L1_68, L2_69, L3_70
  L1_68 = A0_67.name
  L2_69 = A0_67.attacker
  L3_70 = A0_67.damageType
  print("damageType:" .. L3_70)
  if #_enemy_names == 0 then
    table.insert(_enemy_names, L1_68)
    _damage_enemy_count = _damage_enemy_count + 1
  else
    for _FORV_8_ = 1, #_enemy_names do
    end
    if true == false then
      table.insert(_enemy_names, L1_68)
      _damage_enemy_count = _damage_enemy_count + 1
      print("_damage_enemy_count:" .. _damage_enemy_count)
    end
  end
  if L3_70 ~= "GravityThrow" and L3_70 ~= "Penetrate" and L3_70 ~= "Vortex" and L3_70 ~= "DebriBullet" then
    invokeTask(function()
      Player:setStay(true)
      _litho_theme = false
    end)
  end
  if L3_70 == "Vortex" or L3_70 == "DebriBullet" then
    _vortex_hit = true
    if _vortex_task ~= nil then
      _vortex_task:abort()
      _vortex_task = nil
    end
    _vortex_task = invokeTask(function()
      waitSeconds(1)
      _vortex_hit = false
      _vortex_task:abort()
      _vortex_task = nil
    end)
  end
end
function lithoThemeInit()
  _litho_theme = nil
  _enemyCount = 0
  _enemyCountMax = 0
  _vortex_hit = false
  _vortex_task = nil
  _damage_enemy_count = 0
  if _litho_wait_task ~= nil then
    _litho_wait_task:abort()
    _litho_wait_task = nil
  end
  if _throw_check_task ~= nil then
    _throw_check_task:abort()
    _throw_check_task = nil
  end
end
function requestEnemyKill(A0_71, A1_72)
  local L2_73
  L2_73 = Fn_findAreaHandle
  L2_73 = L2_73(A0_71)
  if L2_73 ~= nil then
    L2_73 = "enmgen2_"
    L2_73 = L2_73 .. A1_72
    if findGameObject2("EnemyGenerator", L2_73) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L2_73))
      findGameObject2("EnemyGenerator", L2_73):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L2_73))
    end
  else
    L2_73 = print
    L2_73(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_71))
  end
end
function spGemCreate()
  local L0_74, L1_75, L2_76
  L0_74 = createGameObject2
  L1_75 = "Gem"
  L0_74 = L0_74(L1_75)
  L2_76 = L0_74
  L1_75 = L0_74.setGemModelNo
  L1_75(L2_76, 6)
  L1_75 = math
  L1_75 = L1_75.random
  L2_76 = 1
  L1_75 = L1_75(L2_76, 4)
  L2_76 = print
  L2_76(L1_75)
  L2_76 = 0
  if L1_75 == 1 then
    L2_76 = Fn_getPlayerWorldPos() + Vector(3, 1, 0)
  elseif L1_75 == 2 then
    L2_76 = Fn_getPlayerWorldPos() + Vector(-3, 1, 0)
  elseif L1_75 == 3 then
    L2_76 = Fn_getPlayerWorldPos() + Vector(0, 1, 3)
  elseif L1_75 == 4 then
    L2_76 = Fn_getPlayerWorldPos() + Vector(0, 1, -3)
  end
  L0_74:setWorldPos(L2_76)
  L0_74:setForceMove()
  L0_74:setVisible(true)
  L0_74:try_init()
  L0_74:waitForReadyAsync(function()
    L0_74:try_start()
  end)
  return L0_74
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
