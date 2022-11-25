dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
import("Vehicle")
_ship_hdl = nil
_is_request_create_ship = false
_enmgen_table = {
  enmgen2_com_01 = {
    spawn_request = false,
    is_enemy_spawned = false,
    is_enemy_spawned = false
  },
  enmgen2_com_02 = {
    spawn_request = false,
    is_enemy_spawned = false,
    is_enemy_spawned = false
  }
}
enmgen2_com_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_com_01_01",
      name = "enemy_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_01_01",
      name = "enemy_01_01_driver",
      target_vehicle = "enemy_01_01"
    },
    {
      type = "mechsmall",
      locator = "locator_com_01_02",
      name = "enemy_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_01_02",
      name = "enemy_01_02_driver",
      target_vehicle = "enemy_01_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_com_01_03",
      name = "enemy_01_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_01_04",
      name = "enemy_01_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_01_05",
      name = "enemy_01_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_01_06",
      name = "enemy_01_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_01_07",
      name = "enemy_01_07"
    }
  }
}
enmgen2_com_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_com_02_01",
      name = "enemy_02_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_com_02_02",
      name = "enemy_02_02"
    }
  }
}
function Initialize()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  while true do
    if L0_0 then
      if L0_0 == nil then
        if L0_0 then
          L0_0(L1_1)
          L3_3 = 0
          L3_3 = 1
          L3_3 = L2_2(L3_3, 0, 0)
          ;({
            L1_1,
            [4] = L2_2(L3_3, 0, 0)
          })[2] = L2_2
          ;({
            L1_1,
            [4] = L2_2(L3_3, 0, 0)
          })[3] = L3_3
          L3_3 = "ForSm17Ship"
          _ship_hdl = L1_1
          L3_3 = 0
          L1_1(L2_2, L3_3)
          L3_3 = 0
          L1_1(L2_2, L3_3)
        end
      end
    end
    for L3_3, _FORV_4_ in L0_0(L1_1) do
      if _FORV_4_.spawn_request and _FORV_4_.is_enemy_spawned == false then
        if findGameObject2("EnemyGenerator", L3_3) ~= nil then
          findGameObject2("EnemyGenerator", L3_3):requestSpawn()
          while not findGameObject2("EnemyGenerator", L3_3):isPrepared() do
            wait()
          end
        end
        _FORV_4_.spawn_request = false
        _FORV_4_.is_enemy_spawned = true
      elseif _FORV_4_.prepare_request then
        _FORV_4_.prepare_request = false
        findGameObject2("EnemyGenerator", L3_3):requestPrepare()
      end
    end
    L0_0()
  end
end
function Finalize()
  local L0_4, L1_5
end
function requestPrepareEnemy(A0_6)
  if _enmgen_table[A0_6] == nil then
    print("requestPrepareEnemy:enmgen_name\227\129\174\230\140\135\229\174\154\227\129\140\228\184\141\230\173\163", A0_6)
  elseif not _enmgen_table[A0_6].prepare_request then
    print("\230\149\181\231\148\159\230\136\144\230\186\150\229\130\153\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136", A0_6)
    _enmgen_table[A0_6].prepare_request = true
  else
    print("\230\149\181\231\148\159\230\136\144\230\186\150\229\130\153\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\230\184\136\227\129\191", A0_6)
  end
end
function requestSpawnEnemy(A0_7)
  if _enmgen_table[A0_7] == nil then
    print("requestSpawnEnemy:enmgen_name\227\129\174\230\140\135\229\174\154\227\129\140\228\184\141\230\173\163", A0_7)
  elseif not _enmgen_table[A0_7].spawn_request then
    print("\230\149\181\231\148\159\230\136\144\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136", A0_7)
    _enmgen_table[A0_7].spawn_request = true
  else
    print("\230\149\181\231\148\159\230\136\144\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\230\184\136\227\129\191", A0_7)
  end
end
function setEnemyForDemo(A0_8)
  if _enmgen_table[A0_8] == nil then
    print("setEnemyForDemo:enmgen_name\227\129\174\230\140\135\229\174\154\227\129\140\228\184\141\230\173\163", A0_8)
  elseif findGameObject2("EnemyGenerator", A0_8) ~= nil then
    findGameObject2("EnemyGenerator", A0_8):requestIdlingEnemy(true)
    findGameObject2("EnemyGenerator", A0_8):setEnemyMarker(false)
  end
end
function setEnemyForBattle(A0_9)
  if _enmgen_table[A0_9] == nil then
    print("enmgen_name\227\129\174\230\140\135\229\174\154\227\129\140\228\184\141\230\173\163", A0_9)
  elseif findGameObject2("EnemyGenerator", A0_9) ~= nil then
    findGameObject2("EnemyGenerator", A0_9):requestIdlingEnemy(false)
    findGameObject2("EnemyGenerator", A0_9):setEnemyMarker(true)
  end
end
function resetEnemy(A0_10)
  if _enmgen_table[A0_10] == nil then
    print("resetEnemy:enmgen_name\227\129\174\230\140\135\229\174\154\227\129\140\228\184\141\230\173\163", A0_10)
  else
    findGameObject2("EnemyGenerator", A0_10):requestAllEnemyKill()
    _enmgen_table[A0_10].is_enemy_spawned = false
    requestSpawnEnemy(A0_10)
  end
end
function isEnemySpawned(A0_11)
  if _enmgen_table[A0_11] == nil then
    print("isEnemySpawned:enmgen_name\227\129\174\230\140\135\229\174\154\227\129\140\228\184\141\230\173\163", A0_11)
  else
    return _enmgen_table[A0_11].is_enemy_spawned
  end
end
function requestCreateShip()
  local L0_12, L1_13
  _is_request_create_ship = true
end
function getShipHandle()
  local L0_14, L1_15
  L0_14 = _ship_hdl
  return L0_14
end
