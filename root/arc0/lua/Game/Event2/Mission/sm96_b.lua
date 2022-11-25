import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
enmgen2_b01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_b1_01",
      name = "enemy_b1_01"
    },
    {
      type = "guardcore",
      locator = "locator_b1_02",
      name = "enemy_b1_02"
    },
    {
      type = "guardcore",
      locator = "locator_b1_03",
      name = "enemy_b1_03"
    },
    {
      type = "runner",
      locator = "locator_b1_04",
      name = "enemy_b1_04"
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
enmgen2_b02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_b2_01",
      name = "enemy_b2_01"
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
  onObjectDead = function(A0_17, A1_18)
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
function Initialize()
  local L0_22, L1_23
end
function Ingame()
  _crow_puppet = Fn_spawnSuppotCrow()
  Fn_missionStart()
  Mob:makeSituationPanic(true)
  if findGameObject2("EnemyGenerator", "enmgen2_b_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_b_01"):requestSpawn()
  end
  enemy_set(enmgen2_b01)
  if findGameObject2("EnemyGenerator", "enmgen2_b_02") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_b_02"):requestSpawn()
  end
  enemy_set(enmgen2_b02)
  Fn_setBgmPoint("event", "mission_end")
  waitSeconds(4)
  Sound:pulse("mission_clear")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function navi_on()
  local L0_24, L1_25
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_26, A1_27, A2_28)
  Fn_naviSet(A0_26)
  if A1_27 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_27)
    HUD:naviSetPochiDistanceDensity0(A2_28)
  end
  Sound:pulse("navi_set")
end
function enemy_set(A0_29)
  enemy_count = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. A0_29:getEnemyRest() .. "/" .. A0_29:getEnemyMax())
      wait()
    end
  end)
  while A0_29:getEnemyRest() > 0 do
    wait()
  end
  enemy_count:abort()
end
