dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_042"
_floor_num = 42
_MAX_ENEMY = 10
_total_enemy_count = _MAX_ENEMY
_isFailure = false
_isSuccess = false
function InitializeBody()
  local L0_0
  L0_0 = {}
  L0_0.mineOreEvdName = "mine05_ore"
  L0_0.instance_flg = true
  L0_0.manager_name = g_own:getName()
  L0_0.deploy_areas = getElectedAreaNames()
  L0_0.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_0
end
function IngameBody()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = {
    L1_2,
    L2_3,
    L3_4
  }
  L1_2()
  L1_2()
  L1_2()
  L1_2(L2_3)
  if L1_2 then
    L1_2(L2_3)
  else
    L1_2(L2_3)
    repeat
      L1_2()
    until L1_2
    L1_2()
    _isFailure = false
    _isSuccess = false
    L4_5 = nil
    L5_6 = true
    L1_2(L2_3, L3_4, L4_5, L5_6)
    for L4_5, L5_6 in L1_2(L2_3) do
      requestEnemyKill(L5_6)
    end
    _total_enemy_count = L1_2
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3)
    if L1_2 then
      L4_5 = "DamageEnemyReport"
      L5_6 = checkPlayerAction
      L2_3(L3_4, L4_5, L5_6)
    end
    repeat
      L2_3()
    until L2_3 <= 0
    L2_3(L3_4)
    if not L2_3 then
      _isSuccess = true
      L4_5 = false
      L2_3(L3_4, L4_5)
      L2_3()
      L2_3()
      repeat
        L2_3()
      until L2_3
      L2_3()
      L2_3()
    end
    repeat
      L2_3()
    until L2_3
  end
  L1_2(L2_3)
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
function checkPlayerAction(A0_7)
  local L1_8
  L1_8 = {
    "CloseAttack",
    "GravityKick",
    "DrillKick",
    "ScratchTornado",
    "SliderBodyAttack",
    "SliderKick"
  }
  print(string.format("%s \227\129\175\227\128\129%s \227\129\171 %s \227\129\167\230\148\187\230\146\131\227\129\151\227\129\166 %d \227\129\174\227\131\128\227\131\161\227\131\188\227\130\184\227\130\146\228\184\142\227\129\136\227\129\159!", A0_7.attacker, A0_7.name, A0_7.damageType, A0_7.damageHp))
  if not _isFailure and A0_7.attacker == "player" then
    invokeTask(function()
      local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14
      L0_9 = A0_7.damageType
      for L4_13, L5_14 in L1_10(L2_11) do
        if A0_7.damageType == L5_14 then
          _isFailure = true
          print(string.format("%s \227\129\167\230\148\187\230\146\131\227\129\151\227\129\166\227\129\151\227\129\190\227\129\132\227\129\190\227\129\151\227\129\159\227\128\130", L5_14))
          missionFailure()
          repeat
            wait()
          until isFailureProcessEnd()
          HUD:counter999SetVisible(false)
          Fn_blackout()
          Fn_retryMine99()
          break
        end
      end
    end)
  end
  A0_7.ret = true
  return A0_7
end
function requestEnemySpawn(A0_15)
  local L1_16
  L1_16 = Fn_findAreaHandle
  L1_16 = L1_16(A0_15)
  if L1_16 ~= nil then
    L1_16 = "enmgen2_"
    L1_16 = L1_16 .. A0_15
    if findGameObject2("EnemyGenerator", L1_16) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\135\186\231\143\190\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130", L1_16))
      findGameObject2("EnemyGenerator", L1_16):requestSpawn()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_16))
    end
  else
    L1_16 = print
    L1_16(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_15))
  end
end
function requestEnemyKill(A0_17)
  local L1_18
  L1_18 = Fn_findAreaHandle
  L1_18 = L1_18(A0_17)
  if L1_18 ~= nil then
    L1_18 = "enmgen2_"
    L1_18 = L1_18 .. A0_17
    if findGameObject2("EnemyGenerator", L1_18) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L1_18))
      findGameObject2("EnemyGenerator", L1_18):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_18))
    end
  else
    L1_18 = print
    L1_18(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_17))
  end
end
enmgen2_wa_a_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_12",
      locator = "locator_wa_a_03_01",
      name = "ene001"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_wa_a_03_02",
      name = "ene002"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_wa_a_03_03",
      name = "ene003"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_wa_a_03_04",
      name = "ene004"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_wa_a_03_05",
      name = "ene005"
    }
  },
  onUpdate = function(A0_19)
    local L1_20
  end,
  onEnter = function(A0_21)
    local L1_22
  end,
  onLeave = function(A0_23)
    local L1_24
  end,
  onObjectDead = function(A0_25, A1_26)
  end,
  onObjectAsh = function(A0_27, A1_28)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
enmgen2_wa_a_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore_mine_12",
      locator = "locator_wa_a_05_01",
      name = "ene_wa_a_05_01"
    },
    {
      type = "guardcore_mine_12",
      locator = "locator_wa_a_05_02",
      name = "ene_wa_a_05_02"
    },
    {
      type = "guardcore_mine_12",
      locator = "locator_wa_a_05_03",
      name = "ene_wa_a_05_03"
    }
  },
  onUpdate = function(A0_29)
    local L1_30
  end,
  onEnter = function(A0_31)
    local L1_32
  end,
  onLeave = function(A0_33)
    local L1_34
  end,
  onPopGem = function(A0_35, A1_36)
    EnemeyDropGem(A0_35, A1_36)
  end,
  onObjectAsh = function(A0_37, A1_38)
  end,
  onObjectDead = function(A0_39, A1_40)
  end
}
enmgen2_wa_a_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_mine_12",
      locator = "locator_wa_a_06_01",
      name = "ene_wa_a_06_01"
    },
    {
      type = "imp_mine_12",
      locator = "locator_wa_a_06_02",
      name = "ene_wa_a_06_02"
    },
    {
      type = "imp_mine_12",
      locator = "locator_wa_a_06_03",
      name = "ene_wa_a_06_03"
    },
    {
      type = "parasite_nest",
      locator = "locator_wa_a_06_04",
      name = "ene_wa_a_06_04"
    }
  },
  addParasiteSpawnSetName0 = "spawnSetParasite0",
  spawnSetParasite0 = {
    {
      type = "parasite",
      locator = "locator_wa_a_06_02",
      name = "parasite_set0_01"
    }
  },
  addParasiteSpawnSetName1 = "spawnSetParasite1",
  spawnSetParasite1 = {
    {
      type = "parasite",
      locator = "locator_wa_a_06_02",
      name = "parasite_set1_01"
    }
  },
  addParasiteSpawnSetName2 = "spawnSetParasite2",
  spawnSetParasite2 = {
    {
      type = "parasite",
      locator = "locator_wa_a_06_02",
      name = "parasite_set2_01"
    }
  },
  onUpdate = function(A0_41)
    local L1_42
  end,
  onEnter = function(A0_43)
    local L1_44
  end,
  onLeave = function(A0_45)
    local L1_46
  end,
  onPopGem = function(A0_47, A1_48)
    EnemeyDropGem(A0_47, A1_48)
  end,
  onObjectAsh = function(A0_49, A1_50)
  end,
  onObjectDead = function(A0_51, A1_52)
  end
}
enmgen2_wa_a_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_mine_12",
      locator = "locator_wa_a_07_01",
      name = "ene_wa_a_07_01"
    }
  },
  onUpdate = function(A0_53)
    local L1_54
  end,
  onEnter = function(A0_55)
    local L1_56
  end,
  onLeave = function(A0_57)
    local L1_58
  end,
  onPopGem = function(A0_59, A1_60)
    EnemeyDropGem(A0_59, A1_60)
  end,
  onObjectAsh = function(A0_61, A1_62)
  end,
  onObjectDead = function(A0_63, A1_64)
  end
}
