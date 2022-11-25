import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
enmgen2_a01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_a1_01",
      name = "enemy_a1_01"
    },
    {
      type = "guardcore",
      locator = "locator_a1_04",
      name = "enemy_a1_04"
    },
    {
      type = "gellyfish",
      locator = "locator_a1_05",
      name = "enemy_a1_05"
    },
    {
      type = "lasercannon",
      locator = "locator_a1_06",
      name = "enemy_a1_06"
    },
    {
      type = "lasercannon",
      locator = "locator_a1_07",
      name = "enemy_a1_07"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
enmgen2_a02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_a2_01",
      name = "enemy_a2_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_04",
      name = "enemy_a2_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_05",
      name = "enemy_a2_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_06",
      name = "enemy_a2_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_07",
      name = "enemy_a2_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_08",
      name = "enemy_a2_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_09",
      name = "enemy_a2_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_10",
      name = "enemy_a2_10"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_11",
      name = "enemy_a2_11"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_12",
      name = "enemy_a2_12"
    },
    {
      type = "officer_rifle",
      locator = "locator_a2_01",
      name = "enemy_a2_21",
      target_vehicle = "enemy_a2_01"
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onObjectAsh = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyDeadNum = A0_17:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_19)
    return #A0_19.spawnSet
  end,
  getEnemyRest = function(A0_20)
    local L1_21
    L1_21 = A0_20.spawnSet
    L1_21 = #L1_21
    L1_21 = L1_21 - A0_20.enemyDeadNum
    return L1_21
  end
}
enmgen2_a03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a3_01",
      name = "enemy_a3_01"
    },
    {
      type = "stalker",
      locator = "locator_a3_02",
      name = "enemy_a3_02"
    },
    {
      type = "runner",
      locator = "locator_a3_03",
      name = "enemy_a3_03"
    },
    {
      type = "guardcore",
      locator = "locator_a3_04",
      name = "enemy_a3_04"
    },
    {
      type = "runner",
      locator = "locator_a3_05",
      name = "enemy_a3_05"
    }
  },
  onUpdate = function(A0_22)
    local L1_23
  end,
  onEnter = function(A0_24)
    local L1_25
  end,
  onLeave = function(A0_26)
    local L1_27
  end,
  onObjectDead = function(A0_28, A1_29)
    A0_28:getSpecTable().enemyDeadNum = A0_28:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_30)
    return #A0_30.spawnSet
  end,
  getEnemyRest = function(A0_31)
    local L1_32
    L1_32 = A0_31.spawnSet
    L1_32 = #L1_32
    L1_32 = L1_32 - A0_31.enemyDeadNum
    return L1_32
  end
}
enmgen2_a04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_a4_01",
      name = "enemy_a4_01"
    },
    {
      type = "gellyfish",
      locator = "locator_a4_02",
      name = "enemy_a4_02"
    },
    {
      type = "imp",
      locator = "locator_a4_04",
      name = "enemy_a4_04"
    },
    {
      type = "imp",
      locator = "locator_a4_05",
      name = "enemy_a4_05"
    },
    {
      type = "treecannon",
      locator = "locator_a4_06",
      name = "enemy_a4_06"
    },
    {
      type = "treecannon",
      locator = "locator_a4_07",
      name = "enemy_a4_07"
    }
  },
  onUpdate = function(A0_33)
    local L1_34
  end,
  onEnter = function(A0_35)
    local L1_36
  end,
  onLeave = function(A0_37)
    local L1_38
  end,
  onObjectDead = function(A0_39, A1_40)
    A0_39:getSpecTable().enemyDeadNum = A0_39:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_41)
    return #A0_41.spawnSet
  end,
  getEnemyRest = function(A0_42)
    local L1_43
    L1_43 = A0_42.spawnSet
    L1_43 = #L1_43
    L1_43 = L1_43 - A0_42.enemyDeadNum
    return L1_43
  end
}
function Initialize()
  local L0_44, L1_45
end
function Ingame()
  Player:setEnergy(Player.kEnergy_SpAttack, 0)
  _crow_puppet = Fn_spawnSuppotCrow()
  Player:setPowerUpLevel(Player.kPowUpCateg_Base, 5)
  Player:setPowerUpLevel(Player.kPowUpCateg_Combat, 5)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life), true)
  Fn_missionStart()
  waitSeconds(1.5)
  if findGameObject2("EnemyGenerator", "enmgen2_a_03") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_a_03"):requestSpawn()
  end
  Fn_missionViewWait("sm96_00110")
  Mob:makeSituationPanic(true)
  enemy_set(enmgen2_a03)
  if findGameObject2("EnemyGenerator", "enmgen2_a_04") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_a_04"):requestSpawn()
  end
  enemy_set(enmgen2_a04)
  if findGameObject2("EnemyGenerator", "enmgen2_a_02") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_a_02"):requestSpawn()
  end
  enemy_set(enmgen2_a02)
  if findGameObject2("EnemyGenerator", "enmgen2_a_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_a_01"):requestSpawn()
  end
  enemy_set(enmgen2_a01)
  NaviSet_Auto(findGameObject2("Node", "pccubesensor2_a_01"), 30, 15)
  waitPhace()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_a_01_OnEnter(A0_46)
  _next_phase = true
  Fn_naviKill()
  A0_46:setActive(false)
end
function navi_on()
  local L0_47, L1_48
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_49, A1_50, A2_51)
  Fn_naviSet(A0_49)
  if A1_50 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_50)
    HUD:naviSetPochiDistanceDensity0(A2_51)
  end
  Sound:pulse("navi_set")
end
function enemy_set(A0_52)
  enemy_eount = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. A0_52:getEnemyRest() .. "/" .. A0_52:getEnemyMax())
      wait()
    end
  end)
  while A0_52:getEnemyRest() > 0 do
    wait()
  end
  enemy_eount:abort()
end
