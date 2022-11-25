dofile("/Game/Event2/Common/HeaderCommon.lua")
STALKER_ATTACK_FRAME = 14
_enmgen = nil
_enm_hdl_tbl = {}
_enm_brain_tbl = {}
_enm_spawn_flg = false
_enm_spawn_end = false
_enm_aimk_flg = false
_is_enemy_kill = false
_enemy_cnt = 0
_is_enemy_atk_mot = {}
_is_enemy_atk_mot[1] = false
_is_enemy_atk_mot[2] = false
_is_enemy_atk_mot[3] = false
_dead_enemy_tbl = {}
_dead_enemy_tbl[1] = false
_dead_enemy_tbl[2] = false
_dead_enemy_tbl[3] = false
enmgen2_c = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "sm49_enemy_01",
      type = "stalker",
      locator = "locator_enemy_c_01"
    },
    {
      name = "sm49_enemy_02",
      type = "stalker",
      locator = "locator_enemy_c_02"
    },
    {
      name = "sm49_enemy_03",
      type = "guardcore",
      locator = "locator_enemy_c_03"
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
  end,
  onObjectAsh = function(A0_8, A1_9)
    _enemy_cnt = _enemy_cnt + 1
    _dead_enemy_name = A1_9:getName()
    print("\230\173\187\227\130\147\227\129\160\233\187\146\232\159\178\227\129\174\229\144\141\229\137\141 \226\134\146\226\134\146\226\134\146\226\134\146\226\134\146", _dead_enemy_name)
    _is_enemy_kill = true
  end,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = _enemy_cnt
    return L1_12
  end,
  isEnemyAllDead = function(A0_13)
    local L2_14
    L2_14 = _enemy_cnt
    L2_14 = L2_14 >= #A0_13.spawnSet
    return L2_14
  end
}
function Initialize()
  local L0_15, L1_16
end
function Ingame()
  _enmgen = findGameObject2("EnemyGenerator", "enmgen2_c")
  for _FORV_3_, _FORV_4_ in pairs(enmgen2_c.spawnSet) do
    _enm_hdl_tbl[_FORV_4_.name] = findGameObject2("Node", _FORV_4_.name)
    _enm_brain_tbl[_FORV_4_.name] = _enm_hdl_tbl[_FORV_4_.name]:getBrain()
  end
  invokeTask(function()
    while true do
      if _dead_enemy_name == "sm49_enemy_01" then
        _dead_enemy_tbl[1] = true
        _dead_enemy_name = nil
      elseif _dead_enemy_name == "sm49_enemy_02" then
        _dead_enemy_tbl[2] = true
        _dead_enemy_name = nil
      elseif _dead_enemy_name == "sm49_enemy_03" then
        _dead_enemy_tbl[3] = true
        _dead_enemy_name = nil
      end
      if 2 >= _enemy_cnt and _enm_spawn_end then
        if _dead_enemy_tbl[1] == false then
          if _enm_brain_tbl.sm49_enemy_01:isPlayMotion("attack_l") and _enm_brain_tbl.sm49_enemy_01:getPlayMotionFrame() > STALKER_ATTACK_FRAME or _enm_brain_tbl.sm49_enemy_01:isPlayMotion("attack_r") and _enm_brain_tbl.sm49_enemy_01:getPlayMotionFrame() > STALKER_ATTACK_FRAME then
            _is_enemy_atk_mot[1] = true
          else
            _is_enemy_atk_mot[1] = false
          end
        end
        if _dead_enemy_tbl[2] == false then
          if _enm_brain_tbl.sm49_enemy_02:isPlayMotion("attack_l") and _enm_brain_tbl.sm49_enemy_02:getPlayMotionFrame() > STALKER_ATTACK_FRAME or _enm_brain_tbl.sm49_enemy_02:isPlayMotion("attack_r") and _enm_brain_tbl.sm49_enemy_02:getPlayMotionFrame() > STALKER_ATTACK_FRAME then
            _is_enemy_atk_mot[2] = true
          else
            _is_enemy_atk_mot[2] = false
          end
        end
        if _dead_enemy_tbl[3] == false then
          if _enm_brain_tbl.sm49_enemy_03:isPlayMotion("attack") or _enm_brain_tbl.sm49_enemy_03:isPlayMotion("attack_air") then
            _is_enemy_atk_mot[3] = true
          else
            _is_enemy_atk_mot[3] = false
          end
        end
      end
      wait()
    end
  end)
  while true do
    if _enm_spawn_flg then
      if _enmgen ~= nil then
        _enmgen:setEnemyMarker(false)
        _enmgen:requestSpawn()
        while not _enmgen:isPrepared() do
          print("\230\186\150\229\130\153\228\184\173")
          wait()
        end
        print("\231\181\130\227\130\143\227\129\163\227\129\159")
        _enmgen:requestIdlingEnemy(true)
      end
      _enm_spawn_end = true
      _enm_spawn_flg = false
    end
    if _enm_aimk_flg then
      _enmgen:setEnemyMarker(true)
      _enmgen:requestIdlingEnemy(false)
      _dead_enemy_tbl[1] = false
      _dead_enemy_tbl[2] = false
      _dead_enemy_tbl[3] = false
      _enm_aimk_flg = false
    end
    wait()
  end
end
function Finalize()
  local L0_17, L1_18
end
function spawnEnemy()
  local L0_19, L1_20
  _enm_spawn_flg = true
end
function activateEnemyAIMarker()
  local L0_21, L1_22
  _enm_aimk_flg = true
end
function resetEnemyCount()
  local L0_23, L1_24
  _enemy_cnt = 0
end
function resetEnemySpawn()
  local L0_25, L1_26
  _enm_spawn_end = false
end
function requestEnemyAllKill()
  _enmgen:requestAllEnemyKill()
end
function resetEnemyHandle()
  for _FORV_3_, _FORV_4_ in pairs(enmgen2_c.spawnSet) do
    _enm_hdl_tbl[_FORV_4_.name] = findGameObject2("Node", _FORV_4_.name)
    _enm_brain_tbl[_FORV_4_.name] = _enm_hdl_tbl[_FORV_4_.name]:getBrain()
    print(_enm_hdl_tbl[_FORV_4_.name])
  end
end
function isEnemySpawnEnd()
  local L0_27, L1_28
  L0_27 = _enm_spawn_end
  return L0_27
end
function getEnemyCount()
  local L0_29, L1_30
  L0_29 = _enemy_cnt
  return L0_29
end
function isEnemyAllDead()
  return enmgen2_c:isEnemyAllDead()
end
function getEnemyHandleTable()
  local L0_31, L1_32
  L0_31 = _enm_hdl_tbl
  return L0_31
end
function isEnemyAttackMotion()
  local L0_33, L1_34
  L0_33 = _is_enemy_atk_mot
  return L0_33
end
