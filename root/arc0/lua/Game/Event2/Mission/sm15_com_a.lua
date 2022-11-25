dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_enmgen_name = nil
_is_enemy_spawn_settled = false
_is_enemy_idle = false
_is_enemy_marker = false
enmgen2_com_a = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm15_enemy_01",
      type = "stalker",
      locator = "locator_enemy_com_01"
    },
    {
      name = "sm15_enemy_02",
      type = "stalker",
      locator = "locator_enemy_com_02"
    },
    {
      name = "sm15_enemy_03",
      type = "imp",
      locator = "locator_enemy_com_03"
    },
    {
      name = "sm15_enemy_04",
      type = "imp",
      locator = "locator_enemy_com_04"
    },
    {
      name = "sm15_enemy_05",
      type = "gellyfish",
      locator = "locator_enemy_com_05"
    }
  },
  onPopGem = function(A0_0, A1_1)
    Fn_enemyAshPopGem(A0_0, A1_1)
  end,
  onUpdate = function(A0_2)
    local L1_3
  end,
  onEnter = function(A0_4)
    local L1_5
  end,
  onLeave = function(A0_6)
    local L1_7
  end,
  onSpawn = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum - 1
    if A0_8:getSpecTable().enemyDeadNum < 0 then
      A0_8:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_10, A1_11)
  end,
  onObjectAsh = function(A0_12, A1_13)
    A0_12:getSpecTable().enemyDeadNum = A0_12:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_14)
    return #A0_14.spawnSet
  end,
  getEnemyDeadNum = function(A0_15)
    local L1_16
    L1_16 = A0_15.enemyDeadNum
    return L1_16
  end,
  isEnemyAllDead = function(A0_17)
    local L2_18
    L2_18 = A0_17.enemyDeadNum
    L2_18 = L2_18 >= #A0_17.spawnSet
    return L2_18
  end
}
function Initialize()
  local L0_19, L1_20
end
function Ingame()
  local L0_21
  while true do
    L0_21 = _is_enemy_spawn_request
    if L0_21 then
      L0_21 = findGameObject2
      L0_21 = L0_21("EnemyGenerator", _enmgen_name)
      if L0_21 ~= nil then
        L0_21:requestSpawn()
        while not L0_21:isPrepared() do
          wait()
        end
        Fn_enemyPopGemSetup(L0_21, {
          "sm15_enemy_01",
          "sm15_enemy_02",
          "sm15_enemy_03",
          "sm15_enemy_04",
          "sm15_enemy_05"
        }, 3, GEM_VITAL)
      end
      _is_enemy_spawn_request = false
    end
    L0_21 = wait
    L0_21()
  end
end
function Finalize()
  local L0_22, L1_23
end
function requestSpawnEnemy(A0_24)
  local L1_25
  _enmgen_name = A0_24
  _is_enemy_spawn_request = true
  _is_enemy_spawn_settled = true
end
function requestIdleEnemy(A0_26, A1_27)
  if findGameObject2("EnemyGenerator", A0_26) ~= nil then
    findGameObject2("EnemyGenerator", A0_26):requestIdlingEnemy(A1_27)
  end
  if A1_27 then
    _is_enemy_idle = true
  else
    _is_enemy_idle = false
  end
end
function requestChangeEnemyMarker(A0_28, A1_29)
  if findGameObject2("EnemyGenerator", A0_28) ~= nil then
    findGameObject2("EnemyGenerator", A0_28):setEnemyMarker(A1_29)
  end
  if A1_29 then
    _is_enemy_marker = true
  else
    _is_enemy_marker = false
  end
end
function isSpawnEnemy()
  local L0_30, L1_31
  L0_30 = _is_enemy_spawn_settled
  return L0_30
end
function isSpawnEnemyEnd()
  local L0_32, L1_33
  L0_32 = _is_enemy_spawn_request
  return L0_32
end
function isEnemyGroupAllDead(A0_34)
  if findGameObject2("EnemyGenerator", A0_34) ~= nil then
    return findGameObject2("EnemyGenerator", A0_34):getSpecTable():isEnemyAllDead()
  end
end
