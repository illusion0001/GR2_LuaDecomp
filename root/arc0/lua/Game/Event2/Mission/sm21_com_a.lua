dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm21_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_enmgen2_name = nil
_spawn_request = false
_spawn_flag = false
_prepare_request = false
_move_request = false
_enemy_move_flag = false
_battle_end = false
_get_hdl = false
_btlobj_com_active_request = false
_luna_cnt = 20
_total_enemy_cnt = 24
_spawn_luna_request = false
_prev_phase_continue = false
enmgen2_luna = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_luna_01",
      name = "enemy04",
      ai_spawn_option = "LunaFishOwner/owner_test"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_luna_01",
      name = "childship_04"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_luna_01",
      name = "lunafish01"
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
    _luna_cnt = findGameObject2("EnemyGenerator", "enmgen2_01"):getEnemyCount()
    _enemy_cnt = findGameObject2("EnemyGenerator", "enmgen2_luna"):getEnemyCount()
    _total_enemy_cnt = _luna_cnt + _enemy_cnt
    if _total_enemy_cnt == 0 then
      _battle_end = true
    end
  end,
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {"lunafish01"}, 5, GEM_VITAL)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_01",
      name = "enemy01"
    },
    {
      type = "gellyfish",
      locator = "locator_02",
      name = "enemy02"
    },
    {
      type = "gellyfish",
      locator = "locator_03",
      name = "enemy03"
    },
    {
      type = "lasercannon",
      locator = "locator_04",
      name = "enemy04"
    },
    {
      type = "lasercannon",
      locator = "locator_05",
      name = "enemy05"
    },
    {
      type = "lasercannon",
      locator = "locator_06",
      name = "enemy06"
    },
    {
      type = "imp",
      locator = "locator_07",
      name = "enemy07"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onObjectDead = function(A0_18, A1_19)
    _enemy_cnt = findGameObject2("EnemyGenerator", "enmgen2_01"):getEnemyCount()
    _luna_cnt = findGameObject2("EnemyGenerator", "enmgen2_luna"):getEnemyCount()
    _total_enemy_cnt = _luna_cnt + _enemy_cnt
    if _total_enemy_cnt == 0 then
      _battle_end = true
    end
  end,
  onSetupGem = function(A0_20, A1_21)
    Fn_enemyPopGemSetup(A0_20, {"enemy01"}, 1, GEM_VITAL, "A")
    Fn_enemyPopGemSetup(A0_20, {
      "enemy04",
      "enemy05",
      "enemy06"
    }, 2, GEM_SPECIAL, "B")
  end,
  onPopGem = function(A0_22, A1_23)
    Fn_enemyAshPopGem(A0_22, A1_23, {"A", "B"})
  end
}
function Initialize()
end
function Ingame()
  local L0_24, L1_25, L2_26, L3_27
  if L0_24 == false then
    btlobj_com_hdl = L0_24
    for L3_27 = 1, 6 do
      btlobj_com_hdl[L3_27] = findGameObject2("GimmickBg", "bg2_btlobj_com_" .. string.format("%02d", L3_27))
      btlobj_com_hdl[L3_27]:setActive(false)
    end
    _get_hdl = true
  end
  while true do
    if L0_24 then
      if L0_24 == false then
        L0_24(L1_25)
        _spawn_request = false
        _spawn_flag = true
      end
    else
      if L0_24 then
        _spawn_luna_request = false
        L1_25(L2_26)
        while true do
          if not L1_25 then
            L1_25()
            elseif L0_24 then
              _prepare_request = false
              L3_27 = "enmgen2_luna"
              L3_27 = L0_24
              L2_26(L3_27)
              L3_27 = L1_25
              L2_26(L3_27)
            elseif L0_24 then
              L0_24(L1_25, L2_26)
              _move_request = false
            elseif L0_24 then
              for L3_27 = 1, 6 do
                btlobj_com_hdl[L3_27]:setActive(true)
              end
              _btlobj_com_active_request = false
            end
          end
        end
    end
    L0_24()
  end
end
function Finalize()
  local L0_28, L1_29
end
function spawnEnemy(A0_30)
  if findGameObject2("EnemyGenerator", A0_30) ~= nil then
    _battle_end = false
    findGameObject2("EnemyGenerator", A0_30):requestSpawn()
  end
  while not findGameObject2("EnemyGenerator", A0_30):isPrepared() do
    wait()
  end
end
function enemyMove(A0_31, A1_32)
  if findGameObject2("EnemyGenerator", A0_31) ~= nil then
    findGameObject2("EnemyGenerator", A0_31):requestIdlingEnemy(A1_32)
  end
end
function requestPrepareEnemy(A0_33)
  if not _prepare_request then
    _prepare_request = true
    _enmgen2_name = A0_33
    return true
  end
  return false
end
function requestSpawnEnemy(A0_34)
  if not _spawn_request then
    _spawn_request = true
    _spawn_end = false
    _enmgen2_name = A0_34
    return true
  end
  return false
end
function requestSpawnLuna()
  local L1_35
  L1_35 = _spawn_luna_request
  if not L1_35 then
    _spawn_luna_request = true
    L1_35 = true
    return L1_35
  end
  L1_35 = false
  return L1_35
end
function isBattleEnd(A0_36)
  local L1_37
  _enmgen2_name = A0_36
  L1_37 = _battle_end
  return L1_37
end
function requestEnemyMove(A0_38, A1_39)
  if not _move_request then
    _move_request = true
    _enemy_move_flag = A1_39
    _enmgen2_name = A0_38
    return true
  end
  return false
end
function requestBtlobjActive()
  local L0_40, L1_41
  _btlobj_com_active_request = true
end
function setPrevPhaseContinue(A0_42)
  local L1_43
  _prev_phase_continue = A0_42
end
function getPrevPhaseContinue()
  local L0_44, L1_45
  L0_44 = _prev_phase_continue
  return L0_44
end
