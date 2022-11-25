dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm46_common.lua")
_enmgen2_name = nil
_spawn_request = false
_marker_request = false
_enemy_marker_flag = false
_ai_stop_request = false
_ai_stop_flag = false
_enemy_cnt = 1
_zako_cnt = 4
_hand_end = true
_battle_end = false
_once_enemy_spawn = false
_zako_time = false
_zako_loop_end = false
_spawn_hand_end = false
_marker_end = false
_ai_end = false
_music_hdl = nil
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_hand_01",
      name = "enemy01",
      ai_spawn_option = "Hand/gravitystorm_lively"
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
  onObjectDead = function(A0_8, A1_9)
    _enemy_cnt = _enemy_cnt - 1
    if _enemy_cnt == 0 then
      _hand_end = true
      findGameObject2("EnemyGenerator", "enmgen2_zako_01"):setAutoRevirthSwitch(false)
    end
  end
}
enmgen2_zako_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_zako_01",
      name = "zako_01"
    },
    {
      type = "defender",
      locator = "locator_zako_02",
      name = "zako_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_zako_03",
      name = "zako_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_zako_04",
      name = "zako_04"
    }
  },
  onSpawn = function(A0_10, A1_11)
  end,
  onObjectDead = function(A0_12, A1_13)
    _zako_cnt = findGameObject2("EnemyGenerator", "enmgen2_zako_01"):getEnemyCount()
    if _hand_end and _zako_cnt == 0 then
      _battle_end = true
    end
  end
}
function Initialize()
end
function Ingame()
  while true do
    if _spawn_request then
      if findGameObject2("EnemyGenerator", _enmgen2_name) ~= nil then
        _battle_end = false
        findGameObject2("EnemyGenerator", _enmgen2_name):requestSpawn()
      end
      while not findGameObject2("EnemyGenerator", _enmgen2_name):isPrepared() do
        wait()
      end
      if _zako_time == false then
        _enemy_cnt = 1
      elseif _zako_time then
        _zako_cnt = 4
      end
      if _zako_time == false then
        _zako_time = true
      elseif _zako_time then
        _zako_time = false
      end
      _spawn_request = false
      _spawn_hand_end = true
    elseif _marker_request then
      if findGameObject2("EnemyGenerator", _enmgen2_name) ~= nil then
        findGameObject2("EnemyGenerator", _enmgen2_name):setEnemyMarker(_enemy_marker_flag)
      end
      _marker_request = false
      _marker_end = true
    elseif _ai_stop_request == true then
      if findGameObject2("EnemyGenerator", _enmgen2_name) ~= nil then
        findGameObject2("EnemyGenerator", _enmgen2_name):requestIdlingEnemy(_ai_stop_flag)
      end
      _ai_stop_request = false
      _ai_end = true
    end
    wait()
  end
end
function Finalize()
  local L0_14, L1_15
end
function requestSpawnEnemy(A0_16)
  if not _spawn_request then
    _spawn_request = true
    _once_enemy_spawn = true
    _spawn_hand_end = false
    _enmgen2_name = A0_16
    return true
  end
  return false
end
function isSpawnHandEnd()
  local L0_17, L1_18
  L0_17 = _spawn_hand_end
  return L0_17
end
function isBattleEnd(A0_19)
  local L1_20
  _enmgen2_name = A0_19
  L1_20 = _battle_end
  return L1_20
end
function requestEnemyMarkerOn(A0_21, A1_22)
  if not _marker_request then
    _marker_request = true
    _enemy_marker_flag = A1_22
    _marker_end = false
    _enmgen2_name = A0_21
    return true
  end
  return false
end
function isMarkerEnd()
  local L0_23, L1_24
  L0_23 = _marker_end
  return L0_23
end
function requestEnemyAiStop(A0_25, A1_26)
  if not _ai_stop_request then
    _ai_stop_request = true
    _ai_stop_flag = A1_26
    _ai_end = false
    _enmgen2_name = A0_25
    return true
  end
  return false
end
function isAiEnd()
  local L0_27, L1_28
  L0_27 = _ai_end
  return L0_27
end
function isOnceEnemySpawn(A0_29)
  local L1_30
  _enmgen2_name = A0_29
  L1_30 = _once_enemy_spawn
  return L1_30
end
function playAccordion()
  local L0_31
  L0_31 = _music_hdl
  if L0_31 ~= nil then
    L0_31 = false
    return L0_31
  end
  L0_31 = findGameObject2
  L0_31 = L0_31("Node", "locator2_musician_sound_pos_01")
  _music_hdl = Sound:playSEHandle("npc_instrument_sm46", 1, nil, L0_31)
  Sound:setAudibleRange(_music_hdl, MUSIC_PLAY_DIST)
  print("\232\183\157\233\155\162" .. tostring(Fn_getDistanceToPlayer(L0_31)))
end
function stopAccordion()
  Sound:stopSEHandle(_music_hdl)
  _music_hdl = nil
end
