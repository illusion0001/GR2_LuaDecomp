dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Mission/mine04_common.lua")
_event_file_name = "floor_025"
_floor_num = 25
_litho_theme = nil
_litho_start = false
_enemy_count = 0
_BUBBLE_MAX_03 = 18
_BUBBLE_MAX_16 = 9
_BUBBLE_MAX_17 = 10
_BUBBLE_MAX_18 = 9
_BUBBLE_MAX_19 = 11
_BUBBLE_MAX_20 = 10
_BUBBLE_MAX_21 = 11
_ANMO_MAX = 3
_litho_wait_task = nil
enmgen2_a_03_mine99_025 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "lasercannon_mine_02",
      locator = "locator_mine99_025_01",
      name = "lasercannon01"
    },
    {
      type = "giant_mine_02",
      locator = "locator_mine99_025_03",
      name = "giant01"
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
    _enemy_count = _enemy_count - 1
    HUD:counter999SubNum()
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
      type = "jammer_mine_02",
      locator = "locator_a_16_01",
      name = "jammer02"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_16_02",
      name = "stalker01"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_16_03",
      name = "lasercannon01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_16_04",
      name = "stalker02"
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
      type = "giant_mine_02",
      locator = "locator_a_17_01",
      name = "giant01"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_17_02",
      name = "lasercannon01"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_17_03",
      name = "treecannon01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_17_04",
      name = "stalker01"
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
      type = "lunafishowner",
      locator = "locator_a_18_01",
      name = "lunafishowner01",
      ai_spawn_option = "LunaFishOwner/owner_test"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish_mine_02",
      locator = "locator_a_18_01",
      name = "lunafish01"
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
enmgen2_a_18_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_12",
      locator = "locator_a_18_02",
      name = "imp01"
    },
    {
      type = "imp_mine_12",
      locator = "locator_a_18_03",
      name = "imp02"
    },
    {
      type = "imp_mine_12",
      locator = "locator_a_18_04",
      name = "imp03"
    },
    {
      type = "defender_mine_02",
      locator = "locator_a_18_05",
      name = "defender01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_54)
    local L1_55
  end,
  onEnter = function(A0_56)
    local L1_57
  end,
  onLeave = function(A0_58)
    local L1_59
  end,
  onSpawn = function(A0_60, A1_61)
  end,
  onObjectAsh = function(A0_62, A1_63)
  end,
  onObjectDead = function(A0_64, A1_65)
  end,
  onPopGem = function(A0_66, A1_67)
    EnemeyDropGem(A0_66, A1_67)
  end
}
enmgen2_a_19_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mothership_mine_02",
      locator = "locator_a_19_01",
      name = "mothership01",
      ai_spawn_option = "MotherShip/MotherShip_Test"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_a_19_01",
      name = "childship01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_68)
    local L1_69
  end,
  onEnter = function(A0_70)
    local L1_71
  end,
  onLeave = function(A0_72)
    local L1_73
  end,
  onSpawn = function(A0_74, A1_75)
  end,
  onObjectAsh = function(A0_76, A1_77)
  end,
  onObjectDead = function(A0_78, A1_79)
  end,
  onPopGem = function(A0_80, A1_81)
    EnemeyDropGem(A0_80, A1_81)
  end
}
enmgen2_a_20_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "runner_mine_12",
      locator = "locator_a_20_01",
      name = "runner01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_20_02",
      name = "runner02"
    },
    {
      type = "giant_mine_12",
      locator = "locator_a_20_03",
      name = "giant02"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_20_04",
      name = "lasercannon01"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_20_05",
      name = "treecannon01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_20_06",
      name = "stalker_strong01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_20_07",
      name = "stalker_strong02"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_82)
    local L1_83
  end,
  onEnter = function(A0_84)
    local L1_85
  end,
  onLeave = function(A0_86)
    local L1_87
  end,
  onSpawn = function(A0_88, A1_89)
  end,
  onObjectAsh = function(A0_90, A1_91)
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onPopGem = function(A0_94, A1_95)
    EnemeyDropGem(A0_94, A1_95)
  end
}
function InitializeBody()
  local L0_96
  L0_96 = {}
  L0_96.mineOreEvdName = "mine04_ore"
  L0_96.instance_flg = true
  L0_96.manager_name = g_own:getName()
  L0_96.deploy_areas = getElectedAreaNames()
  L0_96.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_96
end
function IngameBody()
  local L0_97, L1_98, L2_99, L3_100, L4_101, L5_102
  L0_97 = {
    L1_98,
    L2_99,
    L3_100,
    L4_101,
    L5_102,
    "az2_a_20"
  }
  L1_98 = "az2_a_16"
  L5_102 = "az2_a_19"
  L1_98 = {
    L2_99,
    L3_100,
    L4_101,
    L5_102,
    "a_19_01",
    "a_20_01"
  }
  L5_102 = "a_18_02"
  for L5_102 = 1, _BUBBLE_MAX_03 do
    findGameObject2("GimmickBg", string.format("bg2_bubble_%02d", L5_102)):setVisiblePermission(false)
    findGameObject2("GimmickBg", string.format("bg2_bubble_%02d", L5_102)):setCollidablePermission(false)
  end
  if L2_99 == false then
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    L5_102 = true
    L2_99(L3_100, L4_101, L5_102)
    _create_fire_effect = true
  end
  L2_99()
  L2_99()
  L2_99()
  if L2_99 then
    L2_99(L3_100)
  else
    L2_99()
    L2_99(L3_100)
    repeat
      L2_99()
    until L2_99
    L2_99()
    L5_102 = nil
    L2_99(L3_100, L4_101, L5_102, true)
    for L5_102 = 1, #L0_97 do
      requestEnemyKill(L0_97[L5_102], L1_98[L5_102])
    end
    for L5_102 = 1, _BUBBLE_MAX_03 do
      findGameObject2("GimmickBg", string.format("bg2_bubble_%02d", L5_102)):setVisiblePermission(true)
      findGameObject2("GimmickBg", string.format("bg2_bubble_%02d", L5_102)):setCollidablePermission(true)
      findGameObject2("GimmickBg", string.format("bg2_bubble_%02d", L5_102)):setEventListener("broken", function(A0_103)
        if _enemy_count > 0 then
          print("\239\188\157\239\188\157\239\188\157\239\188\157\239\188\157\230\176\180\230\179\161\227\129\140\229\163\138\227\130\140\227\129\190\227\129\151\227\129\159\239\188\154" .. A0_103:getName() .. "\239\188\157\239\188\157\239\188\157\239\188\157\239\188\157")
          _litho_theme = false
        end
      end)
    end
    for L5_102 = 1, _ANMO_MAX do
      findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_102)):setVisiblePermission(true)
      if findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_102)):isBroken() then
        findGameObject2("GimmickBg", string.format("bg2_anmo_%02d", L5_102)):requestRestoreForce()
      end
    end
    L2_99(L3_100)
    _litho_start = true
    L2_99(L3_100)
    if L2_99 ~= nil then
      L3_100(L4_101)
      _enemy_count = L3_100
    end
    L5_102 = "DestroyEnemyReport"
    L3_100(L4_101, L5_102, Fn_destroyEnemyReport)
    L5_102 = "ic_pi_mine99_002"
    L3_100(L4_101, L5_102)
    L5_102 = HUD
    L5_102 = L5_102.kCount99_99IconType_Stone
    L3_100(L4_101, L5_102)
    L5_102 = _enemy_count
    L3_100(L4_101, L5_102)
    L5_102 = true
    L3_100(L4_101, L5_102)
    _litho_wait_task = L3_100
  end
end
function Fn_destroyEnemyReport(A0_104)
  if _enemy_count <= 0 then
    _litho_theme = true
  end
end
function pccubesensor2_a_19_01_OnEnter()
  if findGameObject2("EnemyGenerator", "enmgen2_a_19_01") ~= nil and _litho_start == false then
    requestEnemySpawn("az2_a_19", "a_19_01")
  end
end
function setBubbleVisible(A0_105)
  local L1_106, L2_107, L3_108, L4_109, L5_110
  for L4_109 = 1, _BUBBLE_MAX_16 do
    L5_110 = findGameObject2
    L5_110 = L5_110("GimmickBg", string.format("bg2_a_16_%02d", L4_109))
    if L5_110 ~= nil then
      L5_110:setVisiblePermission(A0_105)
      L5_110:setCollidablePermission(A0_105)
    end
  end
  for L4_109 = 1, _BUBBLE_MAX_17 do
    L5_110 = findGameObject2
    L5_110 = L5_110("GimmickBg", string.format("bg2_a_17_%02d", L4_109))
    if L5_110 ~= nil then
      L5_110:setVisiblePermission(A0_105)
      L5_110:setCollidablePermission(A0_105)
    end
  end
  for L4_109 = 1, _BUBBLE_MAX_18 do
    L5_110 = findGameObject2
    L5_110 = L5_110("GimmickBg", string.format("bg2_a_18_%02d", L4_109))
    if L5_110 ~= nil then
      L5_110:setVisiblePermission(A0_105)
      L5_110:setCollidablePermission(A0_105)
    end
  end
  for L4_109 = 1, _BUBBLE_MAX_19 do
    L5_110 = findGameObject2
    L5_110 = L5_110("GimmickBg", string.format("bg2_a_19_%02d", L4_109))
    if L5_110 ~= nil then
      L5_110:setVisiblePermission(A0_105)
      L5_110:setCollidablePermission(A0_105)
    end
  end
  for L4_109 = 1, _BUBBLE_MAX_20 do
    L5_110 = findGameObject2
    L5_110 = L5_110("GimmickBg", string.format("bg2_a_20_%02d", L4_109))
    if L5_110 ~= nil then
      L5_110:setVisiblePermission(A0_105)
      L5_110:setCollidablePermission(A0_105)
    end
  end
  for L4_109 = 1, _BUBBLE_MAX_21 do
    L5_110 = findGameObject2
    L5_110 = L5_110("GimmickBg", string.format("bg2_a_21_%02d", L4_109))
    if L5_110 ~= nil then
      L5_110:setVisiblePermission(A0_105)
      L5_110:setCollidablePermission(A0_105)
    end
  end
end
function lithoThemeInit()
  _litho_theme = nil
  _litho_start = false
  _enemy_count = 0
  if _litho_wait_task ~= nil then
    _litho_wait_task:abort()
    _litho_wait_task = nil
  end
end
function requestEnemySpawn(A0_111, A1_112)
  local L2_113
  L2_113 = Fn_findAreaHandle
  L2_113 = L2_113(A0_111)
  if L2_113 ~= nil then
    L2_113 = "enmgen2_"
    L2_113 = L2_113 .. A1_112
    if findGameObject2("EnemyGenerator", L2_113) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\135\186\231\143\190\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130", L2_113))
      findGameObject2("EnemyGenerator", L2_113):requestSpawn()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L2_113))
    end
  else
    L2_113 = print
    L2_113(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_111))
  end
end
function requestEnemyKill(A0_114, A1_115)
  local L2_116
  L2_116 = Fn_findAreaHandle
  L2_116 = L2_116(A0_114)
  if L2_116 ~= nil then
    L2_116 = "enmgen2_"
    L2_116 = L2_116 .. A1_115
    if findGameObject2("EnemyGenerator", L2_116) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L2_116))
      findGameObject2("EnemyGenerator", L2_116):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L2_116))
    end
  else
    L2_116 = print
    L2_116(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_114))
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
