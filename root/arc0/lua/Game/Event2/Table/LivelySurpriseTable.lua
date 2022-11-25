L0_0 = {
  {
    {
      name = "hideEne_01",
      type = "stalker",
      ai_spawn_option = "Stalker/Stalker_Hide",
      locator = ""
    },
    {
      name = "hideEne_02",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    }
  },
  {
    {
      name = "hideEne_01",
      type = "stalker",
      ai_spawn_option = "Stalker/Stalker_Hide",
      locator = ""
    },
    {
      name = "hideEne_02",
      type = "stalker",
      ai_spawn_option = "Stalker/Stalker_Hide",
      locator = ""
    },
    {
      name = "hideEne_03",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    }
  },
  {
    {
      name = "hideEne_01",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    },
    {
      name = "hideEne_02",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    },
    {
      name = "hideEne_03",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    }
  }
}
le11battleTable = L0_0
L0_0 = {
  {
    {
      name = "hideEne_01",
      type = "stalker",
      ai_spawn_option = "Stalker/Stalker_Hide",
      locator = ""
    },
    {
      name = "hideEne_02",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    }
  },
  {
    {
      name = "hideEne_01",
      type = "stalker",
      ai_spawn_option = "Stalker/Stalker_Hide",
      locator = ""
    },
    {
      name = "hideEne_02",
      type = "stalker",
      ai_spawn_option = "Stalker/Stalker_Hide",
      locator = ""
    },
    {
      name = "hideEne_03",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    }
  },
  {
    {
      name = "hideEne_01",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    },
    {
      name = "hideEne_02",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    },
    {
      name = "hideEne_03",
      type = "gellyfish",
      ai_spawn_option = "Gellyfish/gellyfish_Hide",
      locator = ""
    }
  }
}
le12battleTable = L0_0
__hideEnemySpawn = false
L0_0 = {}
L0_0.brainEne_01 = nil
L0_0.countEne_01 = false
L0_0.brainEne_02 = nil
L0_0.countEne_02 = false
L0_0.brainEne_03 = nil
L0_0.countEne_03 = false
__hideEnemyBrain = L0_0
__hideEnemyMove = 0
L0_0 = {}
L0_0.spawnOnStart = false
L0_0.autoPrepare = true
L0_0.spawnSet = {}
function L0_0.onSpawn(A0_1, A1_2)
  __hideEnemySpawn = true
end
function L0_0.onObjectAsh(A0_3, A1_4)
  if A0_3:getSpecTable():isEnemyAllDead() then
    __hideEnemySpawn = false
    __hideEnemyMove = 0
  end
  if __hideEnemyMove <= 0 then
    __hideEnemyMove = 0
  end
end
L0_0.enemyDeadNum = 0
function L0_0.getEnemyDeadNum(A0_5)
  local L1_6
  L1_6 = A0_5.enemyDeadNum
  return L1_6
end
function L0_0.isEnemyAllDead(A0_7)
  local L2_8
  L2_8 = A0_7.enemyDeadNum
  L2_8 = L2_8 >= #A0_7.spawnSet
  return L2_8
end
function L0_0.onSetupGem(A0_9, A1_10)
  Fn_enemyPopGemSetup(A0_9, {
    "hideEne_01",
    "hideEne_02",
    "hideEne_03"
  }, 3, GEM_VITAL)
end
function L0_0.onPopGem(A0_11, A1_12)
  Fn_enemyAshPopGem(A0_11, A1_12)
end
enmgen2_le11_hide_battle_01 = L0_0
L0_0 = {}
L0_0.enemyTableName = "enmgen2_le12_01"
L0_0.spawnOnStart = true
L0_0.autoPrepare = true
L0_0.spawnSet = {
  {
    name = "ene_01",
    type = "stalker",
    locator = "locator_01",
    ai_spawn_option = "Stalker/Stalker_Hide"
  },
  {
    name = "ene_02",
    type = "stalker",
    locator = "locator_02",
    ai_spawn_option = "Stalker/Stalker_Hide"
  },
  {
    name = "ene_03",
    type = "stalker",
    locator = "locator_03",
    ai_spawn_option = "Stalker/Stalker_Hide"
  },
  {
    name = "ene_04",
    type = "gellyfish",
    locator = "locator_04",
    ai_spawn_option = "Gellyfish/gellyfish_Hide"
  },
  {
    name = "ene_05",
    type = "gellyfish",
    locator = "locator_05",
    ai_spawn_option = "Gellyfish/gellyfish_Hide"
  }
}
function L0_0.onSpawn(A0_13, A1_14)
  __hideEnemySpawn = true
end
function L0_0.onObjectAsh(A0_15, A1_16)
  __hideEnemyMove = __hideEnemyMove - 1
  if A0_15:getSpecTable():isEnemyAllDead() then
    __hideEnemySpawn = false
    __hideEnemyMove = 0
  end
  if __hideEnemyMove <= 0 then
    __hideEnemyMove = 0
  end
end
L0_0.enemyDeadNum = 0
function L0_0.getEnemyDeadNum(A0_17)
  local L1_18
  L1_18 = A0_17.enemyDeadNum
  return L1_18
end
function L0_0.isEnemyAllDead(A0_19)
  local L2_20
  L2_20 = A0_19.enemyDeadNum
  L2_20 = L2_20 >= #A0_19.spawnSet
  return L2_20
end
function L0_0.onSetupGem(A0_21, A1_22)
  Fn_enemyPopGemSetup(A0_21, {
    "ene_01",
    "ene_02",
    "ene_03",
    "ene_04",
    "ene_05"
  }, 1, GEM_VITAL)
end
function L0_0.onPopGem(A0_23, A1_24)
  Fn_enemyAshPopGem(A0_23, A1_24)
end
enmgen2_le12_battle_01_Test = L0_0
L0_0 = {}
L0_0.spawnOnStart = false
L0_0.autoPrepare = true
L0_0.spawnSet = {}
function L0_0.onSpawn(A0_25, A1_26)
  __hideEnemySpawn = true
end
function L0_0.onObjectAsh(A0_27, A1_28)
  __hideEnemyMove = __hideEnemyMove - 1
  if A0_27:getSpecTable():isEnemyAllDead() then
    __hideEnemySpawn = false
    __hideEnemyMove = 0
  end
  if __hideEnemyMove <= 0 then
    __hideEnemyMove = 0
  end
end
L0_0.enemyDeadNum = 0
function L0_0.getEnemyDeadNum(A0_29)
  local L1_30
  L1_30 = A0_29.enemyDeadNum
  return L1_30
end
function L0_0.isEnemyAllDead(A0_31)
  local L2_32
  L2_32 = A0_31.enemyDeadNum
  L2_32 = L2_32 >= #A0_31.spawnSet
  return L2_32
end
function L0_0.onSetupGem(A0_33, A1_34)
  Fn_enemyPopGemSetup(A0_33, {
    "hideEne_01",
    "hideEne_02",
    "hideEne_03"
  }, 3, GEM_VITAL)
end
function L0_0.onPopGem(A0_35, A1_36)
  Fn_enemyAshPopGem(A0_35, A1_36)
end
enmgen2_le12_hide_battle_01 = L0_0
