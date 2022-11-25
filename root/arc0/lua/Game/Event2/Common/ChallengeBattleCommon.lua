dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Table/ChallengeBattleScoreTable.lua")
_battle_phase = 1
_countdown_spawn = false
_time_over = false
_extend_count = 0
_next_extend_score = 0
_enemy_score_table = {}
_set_enemy = nil
function Fn_setChallengeBattle()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  _next_extend_score = L0_0
  L0_0(L1_1)
  for L3_3, L4_4 in L0_0(L1_1) do
    Fn_pcSensorOff(L4_4.outrange)
    BATTLE_TABLE[L3_3].enemy_tbl.spawnOnStart = false
    BATTLE_TABLE[L3_3].enemy_tbl.autoPrepare = true
    BATTLE_TABLE[L3_3].enemy_tbl.enemyDeadNum = 0
    BATTLE_TABLE[L3_3].enemy_tbl.deadEnemyName = nil
    if L4_4.next_cnt ~= nil and #L4_4.enemy_tbl.spawnSet > L4_4.next_cnt then
      BATTLE_TABLE[L3_3].enemy_tbl.AllDeadMax = L4_4.next_cnt
    else
      BATTLE_TABLE[L3_3].enemy_tbl.AllDeadMax = #L4_4.enemy_tbl.spawnSet
    end
    BATTLE_TABLE[L3_3].enemy_tbl.getEnemyMax = function(A0_5)
      return #A0_5.spawnSet
    end
    BATTLE_TABLE[L3_3].enemy_tbl.getEnemyDeadNum = function(A0_6)
      local L1_7
      L1_7 = A0_6.enemyDeadNum
      return L1_7
    end
    BATTLE_TABLE[L3_3].enemy_tbl.isEnemyAllDead = function(A0_8)
      return A0_8.enemyDeadNum >= A0_8.AllDeadMax
    end
    BATTLE_TABLE[L3_3].enemy_tbl.onObjectAsh = function(A0_9, A1_10)
      enemyOnAsh(A0_9, A1_10)
    end
  end
  for L3_3, L4_4 in L0_0(L1_1) do
    Fn_pcSensorOff(L4_4)
  end
end
function Fn_runChallengeBattle()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23
  L0_11 = _battle_phase
  L1_12 = TimeOverTask
  L1_12 = L1_12()
  while true do
    L2_13 = _time_over
    if L2_13 == false then
      L2_13 = findGameObject2
      L3_14 = "Node"
      L4_15 = BATTLE_TABLE
      L5_16 = _battle_phase
      L4_15 = L4_15[L5_16]
      L4_15 = L4_15.navi
      L2_13 = L2_13(L3_14, L4_15)
      L3_14 = _countdown_spawn
      if L3_14 == false then
        L3_14 = findGameObject2
        L4_15 = "EnemyGenerator"
        L5_16 = BATTLE_TABLE
        L6_17 = _battle_phase
        L5_16 = L5_16[L6_17]
        L5_16 = L5_16.enemy_tbl
        L5_16 = L5_16.enemyTableName
        L3_14 = L3_14(L4_15, L5_16)
        _set_enemy = L3_14
        L3_14 = findGameObject2
        L4_15 = "EnemyGenerator"
        L5_16 = BATTLE_TABLE
        L5_16 = L5_16[L0_11]
        L5_16 = L5_16.enemy_tbl
        L5_16 = L5_16.enemyTableName
        L3_14 = L3_14(L4_15, L5_16)
        _enemy_old = L3_14
        L3_14 = _set_enemy
        L4_15 = L3_14
        L3_14 = L3_14.requestSpawn
        L3_14(L4_15)
      else
        L3_14 = _set_enemy
        L4_15 = L3_14
        L3_14 = L3_14.requestIdlingEnemy
        L5_16 = false
        L3_14(L4_15, L5_16)
        _countdown_spawn = false
      end
      L3_14 = BATTLE_TABLE
      L4_15 = _battle_phase
      L3_14 = L3_14[L4_15]
      L3_14 = L3_14.retry
      if L3_14 ~= nil then
        L4_15 = Fn_setCatWarpCheckPoint
        L5_16 = L3_14
        L4_15(L5_16)
      else
        L4_15 = Fn_setCatWarpCheckPoint
        L5_16 = BATTLE_TABLE
        L6_17 = _battle_phase
        L5_16 = L5_16[L6_17]
        L5_16 = L5_16.navi
        L4_15(L5_16)
      end
      L4_15 = BATTLE_TABLE
      L5_16 = _battle_phase
      L4_15 = L4_15[L5_16]
      L4_15 = L4_15.next_dis
      if L4_15 == nil then
        L4_15 = 30
      end
      L5_16 = false
      L6_17 = false
      L7_18 = findGameObject2
      L7_18 = L7_18(L8_19, L9_20)
      repeat
        if L4_15 >= L8_19 then
          if L6_17 == false then
            L8_19()
            L8_19(L9_20)
            for L11_22, L12_23 in L8_19(L9_20) do
              Fn_pcSensorOff(L12_23)
            end
            L8_19()
          end
          if L0_11 ~= L8_19 then
            L8_19(L9_20)
          end
          L8_19()
          L5_16 = false
        elseif L5_16 == false then
          L8_19(L9_20)
          L5_16 = true
        end
        L8_19()
        if L8_19 ~= true then
        end
      until L8_19 == true
    end
    if L8_19 ~= true then
      L8_19()
      for L11_22, L12_23 in L8_19(L9_20) do
        Fn_pcSensorOn(L12_23)
      end
      L8_19(L9_20)
      L8_19()
      L0_11 = _battle_phase
      if L8_19 < L9_20 then
        _battle_phase = L8_19
      else
        _battle_phase = 1
        for L11_22, L12_23 in L8_19(L9_20) do
          BATTLE_TABLE[L11_22].enemy_tbl.enemyDeadNum = 0
        end
      end
      L8_19()
    end
  end
  if L1_12 ~= nil then
    L3_14 = L1_12
    L2_13 = L1_12.isRunning
    L2_13 = L2_13(L3_14)
    if L2_13 == true then
      L3_14 = L1_12
      L2_13 = L1_12.abort
      L2_13(L3_14)
    end
  end
  L1_12 = nil
end
function setEnemyScoreTable(A0_24)
  if ENEMY_SCORE_TABLE[A0_24] == nil then
    _enemy_score_table = ENEMY_SCORE_TABLE.default
  else
    _enemy_score_table = ENEMY_SCORE_TABLE[A0_24]
    for _FORV_6_, _FORV_7_ in ipairs(ENEMY_SCORE_TABLE.default) do
      if _enemy_score_table[_FORV_6_] == nil then
        _enemy_score_table[_FORV_6_] = _FORV_7_
      end
    end
  end
end
function TimeOverTask()
  return invokeTask(function()
    local L0_25
    L0_25 = {}
    while true do
      if HUD:timerGetAsTime()[1] <= 0 and 0 >= HUD:timerGetAsTime()[2] and 0 >= HUD:timerGetAsTime()[3] and 0 >= HUD:timerGetAsTime()[4] then
        if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
          repeat
            wait()
          until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
          challengeCatWarpAbout()
          _time_over = true
          break
        else
          challengeCatWarpAbout()
          _time_over = true
        end
      end
      wait()
    end
  end)
end
function enemyOnAsh(A0_26, A1_27)
  local L2_28, L3_29, L4_30, L5_31, L6_32
  L3_29 = A0_26
  L2_28 = A0_26.getSpecTable
  L2_28 = L2_28(L3_29)
  L4_30 = A1_27
  L3_29 = A1_27.getName
  L3_29 = L3_29(L4_30)
  L4_30 = "non"
  for _FORV_8_, _FORV_9_ in L5_31(L6_32) do
    if L3_29 == _FORV_9_.name then
      L4_30 = _FORV_9_.type
      break
    end
  end
  L2_28.deadEnemyName = L4_30
  if L3_29 ~= "childship01" then
    L2_28.enemyDeadNum = L5_31
  end
  if L6_32 ~= nil then
  end
  L6_32(A1_27, L5_31)
  if L6_32 <= HUD:counter999GetNum() then
    for _FORV_10_, _FORV_11_ in pairs(EXTEND_TIME) do
      if _extend_count <= _FORV_11_.COUNT then
        break
      end
    end
    if Fn_calculateSubTime(EXTEND_MAX_TIME, Fn_calculateAddTime(HUD:timerGetAsTime(), L6_32)) > 0 then
      Fn_addTime(L6_32)
      Sound:playSE("sys_info", 1)
      Fn_captionView("ic_cm_00002")
      _extend_count = _extend_count + 1
      for _FORV_12_ = 1, _extend_count do
        for _FORV_17_, _FORV_18_ in pairs(EXTEND_SCORE) do
          if _extend_count <= _FORV_18_.COUNT then
            break
          end
        end
        _next_extend_score = _next_extend_score + _FORV_18_.SCORE
      end
    end
  end
end
function Fn_CountdownSpawnEnemy()
  _set_enemy = findGameObject2("EnemyGenerator", BATTLE_TABLE[_battle_phase].enemy_tbl.enemyTableName)
  _set_enemy:requestSpawn()
  while _set_enemy:isSpawnOnStartFinished() == false do
    wait()
  end
  _set_enemy:requestIdlingEnemy(true)
  _countdown_spawn = true
end
