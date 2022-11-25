dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
MIZ_ID = "miz_01"
mine_name = "sm01_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = false,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_ore_area_num = 1
ORE_MAX = {
  28,
  17,
  1,
  43
}
MIZ_MAX = {
  25,
  38,
  12
}
_broken_count = 0
_miz_broken = 0
_miz_area_name = nil
_ore_spawn_flg = false
_ore_spawn_force_flg = false
_is_counter_on = false
_counter_num = 0
_goal_counter_num = 0
_ore_unlock_flg = false
_ORE_UNLOCK_MAX = 12
_enemy_move_node = nil
MIZ_ORE_SEARCH_DISTANCE = 6
MIZ_ORE_SEARCH_HGIHT_RANGE_DEF = 1
_miz_ore_search_hight_range = 5
_ore_search_distance = 0
_is_near_release = false
_near_ore_index = -1
_dis_measure = false
_miz_move_near_ore_flag = false
_ore_mining_time = -1
_miz_move_complete = false
_escape_enemy_flag = false
_enemy_brain = nil
_sfx_dig = nil
_ore_mining_caption_wait = 0
MIZ_NEXT_ORE_MINING_TIME = 400
MIZ_NEXT_ORE_MOVE_LIMITE = 700
MIZ_NEXT_ESCAPE_MOVE_LIMITE = 900
MIZ_SEARCH_ORE_DISTANCE = 30
_miz_escape_locate_talbe = {}
_miz_warning_time = 0
_miz_warning_lv_old = 0
MIZ_DEAD_TIME = 600
MIZ_ESCAPE_PLAYER_DISTANCE = 7
RETRY_CAP_TYPE = {
  NONE = 0,
  MIZ_DEAD = 1,
  PLAYER_FALL = 2,
  ENEMY_FALL = 3,
  ALL_BROKEN = 4
}
_retry_cap_type = RETRY_CAP_TYPE.NONE
_is_miz_grab_last = false
_is_miz_grab = false
_is_miz_grab_release_trigger = false
CAGE_MOVE_Y = 13
FIND_ORE_NODE_NAME_0 = "GravityOre2"
FIND_ORE_NODE_NAME_1 = "GravityOre2"
_unlock_task = nil
_create_ore_task = nil
_auto_respawn_flag = false
_create_ore_task2 = nil
_auto_respawn_flag2 = false
_ORE_RESPAWN_WAIT_FRAME_TIME = 900
_moveToNearOreTask = nil
_miz_move_task = nil
_cat_warp_playing = false
_miz_fall_flag = false
_mission_term = "TAKE"
_prev_phase_continue = false
_npc_se_hdl = {}
_ore_miz_name_table = {
  {
    "gravityore_pi2_a_02_02_miz_01",
    "gravityore_pi2_a_02_02_miz_02",
    "gravityore_pi2_a_02_02_miz_03",
    "gravityore_pi2_a_02_02_miz_04",
    "gravityore_pi2_a_02_02_miz_05",
    "gravityore_pi2_a_02_02_miz_06",
    "gravityore_pi2_a_02_02_miz_07",
    "gravityore_pi2_a_02_02_miz_08",
    "gravityore_pi2_a_02_02_miz_09",
    "gravityore_pi2_a_02_02_miz_10",
    "gravityore_pi2_a_02_02_miz_11",
    "gravityore_pi2_a_02_02_miz_12",
    "gravityore_pi2_a_02_02_miz_13",
    "gravityore_pi2_a_02_02_miz_14",
    "gravityore_pi2_a_02_02_miz_15",
    "gravityore_pi2_a_02_02_miz_16",
    "gravityore_pi2_a_02_02_miz_17",
    "gravityore_pi2_a_02_02_miz_18",
    "gravityore_pi2_a_02_02_miz_19",
    "gravityore_pi2_a_02_02_miz_20",
    "gravityore_pi2_a_02_02_miz_21",
    "gravityore_pi2_a_02_02_miz_22",
    "gravityore_pi2_a_02_02_miz_23",
    "gravityore_pi2_a_02_02_miz_24",
    "gravityore_pi2_a_02_02_miz_25"
  },
  {
    "gravityore_pi2_a_08_02_miz_01",
    "gravityore_pi2_a_08_02_miz_02",
    "gravityore_pi2_a_08_02_miz_03",
    "gravityore_pi2_a_08_02_miz_04",
    "gravityore_pi2_a_08_02_miz_05",
    "gravityore_pi2_a_08_02_miz_06",
    "gravityore_pi2_a_08_02_miz_07",
    "gravityore_pi2_a_08_02_miz_08",
    "gravityore_pi2_a_08_02_miz_09",
    "gravityore_pi2_a_08_02_miz_10",
    "gravityore_pi2_a_08_02_miz_11",
    "gravityore_pi2_a_09_01_01",
    "gravityore_pi2_a_09_01_02",
    "gravityore_pi2_a_09_01_03",
    "gravityore_pi2_a_09_01_04",
    "gravityore_pi2_a_09_01_05",
    "gravityore_pi2_a_09_01_06",
    "gravityore_pi2_a_09_01_07",
    "gravityore_pi2_a_09_01_08",
    "gravityore_pi2_a_09_01_09",
    "gravityore_pi2_a_09_01_10",
    "gravityore_pi2_a_09_01_11",
    "gravityore_pi2_a_09_01_12",
    "gravityore_pi2_a_09_01_13",
    "gravityore_pi2_a_09_01_14",
    "gravityore_pi2_a_09_01_15",
    "gravityore_pi2_a_09_01_16",
    "gravityore_pi2_a_09_01_17",
    "gravityore_pi2_a_09_01_18",
    "gravityore_pi2_a_09_01_34",
    "gravityore_pi2_a_09_01_35",
    "gravityore_pi2_a_09_01_36",
    "gravityore_pi2_a_09_01_37",
    "gravityore_pi2_a_09_01_40",
    "gravityore_pi2_a_09_01_41",
    "gravityore_pi2_a_09_01_42",
    "gravityore_pi2_a_09_01_43",
    "gravityore_pi2_a_09_01_44"
  },
  {
    "gravityore_pi2_a_07_01_01",
    "gravityore_pi2_a_07_01_02",
    "gravityore_pi2_a_07_01_03",
    "gravityore_pi2_a_07_01_04",
    "gravityore_pi2_a_07_01_05",
    "gravityore_pi2_a_07_01_06",
    "gravityore_pi2_a_07_01_07",
    "gravityore_pi2_a_07_01_08",
    "gravityore_pi2_a_07_01_09",
    "gravityore_pi2_a_07_01_10",
    "gravityore_pi2_a_07_01_11",
    "gravityore_pi2_a_07_01_12"
  }
}
_ore_name_table = {
  {
    "gravityore_pi2_a_02_02_05",
    "gravityore_pi2_a_02_02_11",
    "gravityore_pi2_a_02_02_12",
    "gravityore_pi2_a_02_02_13",
    "gravityore_pi2_a_02_02_17",
    "gravityore_pi2_a_02_02_18",
    "gravityore_pi2_a_02_02_19",
    "gravityore_pi2_a_02_02_20",
    "gravityore_pi2_a_02_02_21",
    "gravityore_pi2_a_02_02_22",
    "gravityore_pi2_a_02_02_23",
    "gravityore_pi2_a_02_02_24",
    "gravityore_pi2_a_02_02_25",
    "gravityore_pi2_a_02_02_26",
    "gravityore_pi2_a_02_02_27",
    "gravityore_pi2_a_02_02_32",
    "gravityore_pi2_a_02_02_33",
    "gravityore_pi2_a_02_02_34",
    "gravityore_pi2_a_02_02_35",
    "gravityore_pi2_a_02_02_09",
    "gravityore_pi2_a_02_02_10",
    "gravityore_pi2_a_02_02_60",
    "gravityore_pi2_a_02_02_61",
    "gravityore_pi2_a_02_02_62",
    "gravityore_pi2_a_02_02_63",
    "gravityore_pi2_a_02_02_64",
    "gravityore_pi2_a_02_02_65",
    "gravityore_pi2_a_02_02_66"
  },
  {
    "gravityore_pi2_a_08_02_01",
    "gravityore_pi2_a_08_02_03",
    "gravityore_pi2_a_08_02_05",
    "gravityore_pi2_a_08_02_12",
    "gravityore_pi2_a_08_02_16",
    "gravityore_pi2_a_08_02_20",
    "gravityore_pi2_a_08_02_25",
    "gravityore_pi2_a_08_02_26",
    "gravityore_pi2_a_08_02_27",
    "gravityore_pi2_a_08_02_33",
    "gravityore_pi2_a_08_02_34",
    "gravityore_pi2_a_08_02_35",
    "gravityore_pi2_a_08_02_36",
    "gravityore_pi2_a_08_02_37",
    "gravityore_pi2_a_08_02_41",
    "gravityore_pi2_a_08_02_08",
    "gravityore_pi2_a_08_02_10"
  },
  {
    "gravityore_pi2_a_09_01_999"
  },
  {
    "gravityore_pi2_a_06_01_01",
    "gravityore_pi2_a_06_01_02",
    "gravityore_pi2_a_06_01_03",
    "gravityore_pi2_a_06_01_04",
    "gravityore_pi2_a_06_01_05",
    "gravityore_pi2_a_06_01_06",
    "gravityore_pi2_a_06_01_07",
    "gravityore_pi2_a_06_01_08",
    "gravityore_pi2_a_06_01_09",
    "gravityore_pi2_a_06_01_10",
    "gravityore_pi2_a_06_01_11",
    "gravityore_pi2_a_06_01_12",
    "gravityore_pi2_a_06_01_13",
    "gravityore_pi2_a_06_01_14",
    "gravityore_pi2_a_06_01_15",
    "gravityore_pi2_a_06_01_16",
    "gravityore_pi2_a_06_01_17",
    "gravityore_pi2_a_06_01_18",
    "gravityore_pi2_a_06_01_19",
    "gravityore_pi2_a_06_01_20",
    "gravityore_pi2_a_06_01_21",
    "gravityore_pi2_a_06_01_22",
    "gravityore_pi2_a_06_01_200",
    "gravityore_pi2_a_06_01_201",
    "gravityore_pi2_a_06_01_202",
    "gravityore_pi2_a_06_01_203",
    "gravityore_pi2_a_06_01_204",
    "gravityore_pi2_a_06_01_010",
    "gravityore_pi2_a_06_01_205",
    "gravityore_pi2_a_06_01_206",
    "gravityore_pi2_a_06_01_207",
    "gravityore_pi2_a_06_01_208",
    "gravityore_pi2_a_06_01_209",
    "gravityore_pi2_a_06_01_210",
    "gravityore_pi2_a_06_01_211",
    "gravityore_pi2_a_06_01_212",
    "gravityore_pi2_a_06_01_213",
    "gravityore_pi2_a_06_01_214",
    "gravityore_pi2_a_08_21_01",
    "gravityore_pi2_a_08_21_02",
    "gravityore_pi2_a_08_21_03",
    "gravityore_pi2_a_08_21_04",
    "gravityore_pi2_a_08_21_05"
  }
}
function Initialize()
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("sm01_09005")
  HUD:counter999SetVisible(false)
  Fn_sendSetOtherPreciousGemCount(9999, 0)
  HUD:counter999SetNum(0)
  Fn_sendBulkMineSetupRun(mine_name, _gravityOre, _addGravityOre)
  repeat
    wait()
  until Fn_sendIsRunMine()
  _enemy_move_node = createGameObject2("Node")
  _enemy_move_node:setName("enemy_move_node")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
  L0_0 = Fn_findNpc
  L1_1 = MIZ_ID
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_findNpcPuppet
  L2_2 = L0_0
  L1_1 = L1_1(L2_2)
  L2_2 = false
  L3_3 = _is_counter_on
  while true do
    L4_4()
    for L7_7 = 1, L5_5[L6_6] do
      if L9_9 ~= nil then
        L11_11 = L9_9
        L12_12 = "broken"
        function L13_13(A0_15)
          _miz_broken = _miz_broken + 1
        end
        L10_10(L11_11, L12_12, L13_13)
      end
    end
    if L4_4 == true then
      _is_near_release = false
      for L8_8 = 1, L6_6[L7_7] do
        L11_11 = L9_9
        if L10_10 ~= nil then
          L11_11 = Fn_getDistanceToPlayer
          L12_12 = L10_10
          L11_11 = L11_11(L12_12)
          L12_12 = isOreBroken
          L13_13 = L10_10
          L12_12 = L12_12(L13_13)
          if not L12_12 then
            L12_12 = _is_near_release
            if L12_12 == false or L4_4 > L11_11 then
              L13_13 = L10_10
              L12_12 = L10_10.getWorldPos
              L12_12 = L12_12(L13_13)
              L12_12 = L12_12.y
              L13_13 = Player
              L14_14 = L13_13
              L13_13 = L13_13.getPuppet
              L13_13 = L13_13(L14_14)
              L14_14 = L13_13
              L13_13 = L13_13.getWorldPos
              L13_13 = L13_13(L14_14)
              L13_13 = L13_13.y
              L12_12 = L12_12 - L13_13
              if L12_12 < 0 then
                L12_12 = -L12_12
              end
              L13_13 = _ore_search_distance
              if L11_11 <= L13_13 then
                L13_13 = _escape_enemy_flag
                if not L13_13 then
                  L13_13 = MIZ_ORE_SEARCH_HGIHT_RANGE_DEF
                elseif L12_12 < L13_13 then
                  _is_near_release = true
                  _near_ore_index = L8_8
                end
              else
                _is_near_release = false
              end
            end
          end
        end
      end
    end
    gemAdd = L4_4
    if L3_3 ~= L4_4 then
      if L4_4 == true then
        L4_4(L5_5, L6_6)
        _counter_num = L4_4
        L4_4(L5_5)
      else
        L4_4(L5_5, L6_6)
      end
    end
    L3_3 = _is_counter_on
    if L4_4 then
      _miz_broken = 0
      L4_4()
      for L7_7 = 1, 4 do
        for L11_11 = 1, L9_9[L7_7] do
          L12_12, L13_13 = nil, nil
          L14_14 = _ore_name_table
          L14_14 = L14_14[L7_7]
          L14_14 = L14_14[L11_11]
          L12_12 = Fn_getGravityOre2(L14_14)
          if L12_12 ~= nil then
            L12_12:setActive(true)
          end
          L13_13 = Fn_getGravityOre2(L14_14)
          if L13_13 ~= nil then
            L13_13:setLockonPermission(true)
            if isOreBroken(L13_13) and (_ore_spawn_force_flg == true or Fn_getDistanceToPlayer(L13_13) > 100 or Mv_raycastCameraSight(L13_13, 90) == false) then
              restoreOre(L13_13)
            end
          end
        end
      end
      for L7_7 = 1, L5_5[L6_6] do
        if L9_9 ~= nil then
          L11_11 = L9_9
          L12_12 = true
          L10_10(L11_11, L12_12)
        end
        L11_11 = L8_8
        if L10_10 ~= nil then
          L12_12 = L10_10
          L11_11 = L10_10.setLockonPermission
          L13_13 = true
          L11_11(L12_12, L13_13)
          L11_11 = isOreBroken
          L12_12 = L10_10
          L11_11 = L11_11(L12_12)
          if L11_11 then
            L11_11 = Fn_getDistanceToPlayer
            L12_12 = L10_10
            L11_11 = L11_11(L12_12)
            L12_12 = _ore_spawn_force_flg
            if L12_12 then
              L12_12 = restoreOre
              L13_13 = L10_10
              L12_12(L13_13)
            end
          end
        end
      end
      _ore_spawn_flg = false
      _ore_spawn_force_flg = false
    end
    if L4_4 == true then
      _auto_respawn_flag = false
      if L4_4 == nil then
        _create_ore_task = L4_4
      end
    end
    if L4_4 then
      _auto_respawn_flag2 = false
      if L4_4 == nil then
        _create_ore_task2 = L4_4
      end
    end
    if L4_4 > -1 then
      _ore_mining_time = L4_4
      if L4_4 == false then
        if L4_4 < 10 then
          _ore_mining_caption_wait = L4_4
          if L4_4 > 200 then
            L4_4(L5_5)
            _ore_mining_caption_wait = 0
          end
        end
      end
      if L4_4 == true then
        if L4_4 == false then
          L4_4()
          L4_4()
          if L4_4 ~= nil then
            L14_14 = L6_6(L7_7)
            if L4_4 < 5 then
              L4_4(L5_5, L6_6, L7_7, L8_8)
              L4_4(L5_5, L6_6, L7_7)
              L4_4(L5_5)
              L4_4(L5_5)
              L4_4(L5_5, L6_6, L7_7)
              L4_4(L5_5)
            end
          end
          L4_4(L5_5, L6_6, L7_7)
          L4_4()
          _ore_mining_time = L4_4
        end
      end
      if L4_4 == false then
        if L4_4 == 2 then
          if L4_4 ~= nil then
            L14_14 = L6_6(L7_7)
            if L4_4 < 3 then
              L4_4()
            end
          end
        end
      end
      if L4_4 > L5_5 then
        _ore_mining_time = 0
        if L4_4 == false then
          if L4_4 ~= nil then
            L4_4()
            L5_5()
            L5_5()
            if L4_4 ~= "L" then
              L5_5(L6_6, L7_7, L8_8)
            else
              L5_5(L6_6, L7_7, L8_8)
            end
            L5_5(L6_6, L7_7, L8_8)
            L5_5(L6_6)
          end
        end
        L4_4(L5_5)
        if L4_4 == nil then
        else
          if L4_4 == true then
            L6_6(L7_7, L8_8, L9_9, L10_10)
            L6_6()
            while true do
              if L7_7 == false then
                L7_7()
              end
            end
            L7_7(L8_8)
            if L7_7 == false then
              if L7_7 == true then
                if L7_7 ~= -1 then
                  if L7_7 ~= nil then
                    L14_14 = L9_9(L10_10)
                    L7_7(L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L9_9(L10_10))
                    L7_7(L8_8)
                    L11_11 = 15
                    L14_14 = L10_10(L11_11)
                    L11_11 = L8_8
                    L9_9(L10_10, L11_11)
                    if L9_9 ~= nil then
                      L12_12 = L1_1
                      L11_11 = L1_1.getWorldPos
                      L14_14 = L11_11(L12_12)
                      if L9_9 < 3 then
                        L14_14 = L10_10()
                        if L9_9 == false then
                          if L9_9 ~= "L" then
                            L11_11 = 1
                            L10_10(L11_11)
                            L11_11 = L0_0
                            L12_12 = "dig_in_00"
                            L13_13 = true
                            L10_10(L11_11, L12_12, L13_13)
                            L11_11 = 2
                            L10_10(L11_11)
                            L11_11 = L0_0
                            L12_12 = "dig_00"
                            L13_13 = false
                            L10_10(L11_11, L12_12, L13_13)
                          else
                            L11_11 = 1
                            L10_10(L11_11)
                            L11_11 = L0_0
                            L12_12 = "dig_in_01"
                            L13_13 = true
                            L10_10(L11_11, L12_12, L13_13)
                            L11_11 = 2
                            L10_10(L11_11)
                            L11_11 = L0_0
                            L12_12 = "dig_01"
                            L13_13 = false
                            L10_10(L11_11, L12_12, L13_13)
                          end
                        end
                      end
                    end
                  end
                  L7_7(L8_8)
                end
              else
                L7_7(L8_8, L9_9, L10_10)
                _ore_mining_time = -1
              end
            else
              _escape_enemy_flag = false
              _ore_mining_time = -1
              L7_7(L8_8)
            end
        end
        else
          if L4_4 == false then
            L4_4(L5_5, L6_6, L7_7)
          else
            L4_4(L5_5)
            _escape_enemy_flag = false
          end
          _ore_mining_time = -1
        end
      end
    end
    L4_4()
  end
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Fn_sendStopOtherPreciousGemCount()
  Player:setTargetingPriority(Player.kTargetingPrio_Default)
end
function oreBroken(A0_16)
  _broken_count = _broken_count + 1
  oreBreaken(A0_16)
end
function clearMizBattleJudge()
  local L0_17, L1_18
  _miz_warning_time = 0
  _miz_warning_lv_old = 0
end
function mizBattleJudge(A0_19, A1_20, A2_21)
  local L3_22, L4_23, L5_24
  L3_22 = false
  L4_23 = Fn_findNpc
  L5_24 = MIZ_ID
  L4_23 = L4_23(L5_24)
  L5_24 = Fn_findNpcPuppet
  L5_24 = L5_24(L4_23)
  if L4_23:isMoveEnd() and _escape_enemy_flag == false and _miz_fall_flag == false then
    if L4_23:isGrabbed() == true then
      A0_19 = 0
      A2_21 = 1000
      A1_20 = false
    elseif Fn_getDistanceToPlayer(L5_24) < 5 then
      _miz_warning_time = 0
    end
    if A0_19 >= 1 then
      if _miz_warning_time < MIZ_DEAD_TIME / 2 or A0_19 == 2 then
        _miz_warning_time = _miz_warning_time + 1
      end
    else
      _miz_warning_time = 1
    end
    if A1_20 == true then
      if _escape_enemy_flag == false and _cat_warp_playing == false then
        invokeTask(function()
          if A2_21 < 14 then
            startEscapeEnemy()
            waitSeconds(1.5)
            Sound:playSE("mis017_radio", 1, "")
            Fn_captionView("sm01_09010")
          else
            waitSeconds(1.5)
            for _FORV_3_ = 0, 150 do
              if L4_23:isFall() == false and _miz_fall_flag == false and _cat_warp_playing == false then
                Sound:playSE("mis021_radio", 1, "")
                Fn_captionView("sm01_09028")
                break
              end
              wait()
            end
          end
        end)
      end
    elseif _escape_enemy_flag == false and 1 <= _miz_warning_lv_old and A0_19 == 0 then
      Fn_playMotionNpc(L4_23, "stay", false)
    elseif _miz_warning_time == MIZ_DEAD_TIME / 2 + 1 then
      Fn_captionView("sm01_09011")
      Fn_playMotionNpc(L4_23, "scared_00", false)
    elseif _miz_warning_time == MIZ_DEAD_TIME - 150 then
      Sound:playSE("mis017_radio", 1, "")
      Fn_captionView("sm01_09012")
      Fn_playMotionNpc(L4_23, "scared_00", false)
    elseif _miz_warning_time == MIZ_DEAD_TIME - 60 then
      if Fn_getDistanceToPlayer(L5_24) < MIZ_ESCAPE_PLAYER_DISTANCE and A2_21 < 14 then
        startEscapeEnemy()
      end
    elseif _miz_warning_time >= MIZ_DEAD_TIME then
      L3_22 = true
      Fn_setGrabNpc(L4_23, true, true)
      Sound:playSE("mis020_radio", 1, "")
      Fn_playMotionNpc(L4_23, "scared_00", false)
      _retry_cap_type = RETRY_CAP_TYPE.MIZ_DEAD
    end
    _miz_warning_lv_old = A0_19
  end
  return L3_22
end
function battleMizGrabRelease(A0_25)
  local L1_26
  L1_26 = _cat_warp_playing
  if L1_26 == true then
    return
  end
  L1_26 = Fn_findNpc
  L1_26 = L1_26(MIZ_ID)
  if Player:getLastFrameDamagePoint() > 0 then
    A0_25 = true
  end
  _is_miz_grab = L1_26:isGrabbed()
  if not _is_miz_grab and _is_miz_grab_last then
    _is_miz_grab_release_trigger = true
  end
  _is_miz_grab_last = _is_miz_grab
  if _is_miz_grab_release_trigger == true then
    if A0_25 == false then
      Fn_captionView("sm01_09013")
      _retry_cap_type = RETRY_CAP_TYPE.PLAYER_FALL
      invokeTask(function()
        waitSeconds(0.5)
        Fn_playMotionNpc(L1_26, "stay", false)
      end)
    else
      Fn_captionView("sm01_01012")
      _retry_cap_type = RETRY_CAP_TYPE.ENEMY_FALL
    end
    _is_miz_grab_release_trigger = false
  end
end
function setAllMizOreBrokenHintCap()
  local L1_27
  L1_27 = RETRY_CAP_TYPE
  L1_27 = L1_27.ALL_BROKEN
  _retry_cap_type = L1_27
end
function retryHintCaption()
  if _retry_cap_type == RETRY_CAP_TYPE.MIZ_DEAD then
    Fn_captionView("sm01_09014")
  elseif _retry_cap_type == RETRY_CAP_TYPE.PLAYER_FALL then
    Fn_captionView("sm01_09015")
  elseif _retry_cap_type == RETRY_CAP_TYPE.ENEMY_FALL then
    Fn_captionView("sm01_09016")
  elseif _retry_cap_type == RETRY_CAP_TYPE.ALL_BROKEN then
  end
  _retry_cap_type = RETRY_CAP_TYPE.NONE
end
function requestOreSpawn(A0_28)
  local L1_29
  A0_28 = A0_28 or false
  _ore_spawn_flg = true
  _ore_spawn_force_flg = A0_28
end
function requestUnlockonOreTask()
  _unlock_task = invokeTask(function()
    local L0_30, L1_31, L2_32, L3_33, L4_34, L5_35
    while true do
      for L3_33 = 1, _ORE_UNLOCK_MAX do
        L4_34, L5_35 = nil, nil
        L4_34 = Fn_getGravityOre2("gravityore_pi2_a_07_01_" .. string.format("%02d", L3_33))
        if L4_34 ~= nil then
          L4_34:setActive(true)
        end
        L5_35 = Fn_getGravityOre2("gravityore_pi2_a_07_01_" .. string.format("%02d", L3_33))
        if L5_35 ~= nil then
          L5_35:setLockonPermission(false)
        end
      end
      L0_30()
    end
  end)
end
function requestUnlockonOreTaskAbout()
  Mv_safeTaskAbort(_unlock_task)
end
function setCounterMax(A0_36)
  _goal_counter_num = A0_36
  HUD:counter999SetNum(A0_36)
end
function requestCounterOn()
  _is_counter_on = true
  HUD:counter999SetVisible(true)
end
function requestCounterOff()
  _is_counter_on = false
  HUD:counter999SetVisible(false)
end
function isCounterVisible()
  local L0_37, L1_38
  L0_37 = _is_counter_on
  return L0_37
end
function requestCount()
  local L0_39, L1_40
  L0_39 = _counter_num
  return L0_39
end
function requestClearCounter()
  _counter_num = 0
  HUD:counter999SetNum(0)
  GlobalGem:SetOtherPreciousGemNum(0)
end
function isOreBroken(A0_41)
  return A0_41:isBroken()
end
function restoreOre(A0_42)
  A0_42:requestRestoreForce()
end
function isBrokenCount()
  local L0_43, L1_44
  L0_43 = _broken_count
  return L0_43
end
function isMizBrokenCount()
  local L0_45, L1_46
  L0_45 = _miz_broken
  return L0_45
end
function requestBrokenCountReset()
  local L0_47, L1_48
  _broken_count = 0
end
function requestOreAreaNumChange(A0_49)
  local L1_50
  _ore_area_num = A0_49
end
function getOreAreaNum()
  local L0_51, L1_52
  L0_51 = _ore_area_num
  return L0_51
end
function requestOreDistanceOn(A0_53)
  local L1_54
  L1_54 = A0_53 or MIZ_ORE_SEARCH_DISTANCE
  _ore_search_distance = L1_54
  _near_ore_index = -1
  _is_near_release = false
  _dis_measure = true
  _escape_enemy_flag = false
end
function isOreDistanceOn()
  local L0_55, L1_56
  L0_55 = _dis_measure
  return L0_55
end
function requestOreDistanceOff()
  local L0_57, L1_58
  _is_near_release = false
  _dis_measure = false
end
function isNearOre()
  local L0_59, L1_60
  L0_59 = _is_near_release
  return L0_59
end
function findArea()
  local L0_61, L1_62
  L0_61 = _ore_area_num
  if L0_61 == 1 then
    _miz_area_name = "gravityore_pi2_a_02_02_miz_"
  else
    L0_61 = _ore_area_num
    if L0_61 == 2 then
      _miz_area_name = "gravityore_pi2_a_08_02_miz_"
    else
      L0_61 = _ore_area_num
      if L0_61 == 3 then
        _miz_area_name = "gravityore_pi2_a_07_01_"
      end
    end
  end
end
function getNearOre()
  local L0_63
  L0_63 = _escape_enemy_flag
  if L0_63 == false then
    L0_63 = _near_ore_index
    if L0_63 ~= -1 then
      L0_63 = _ore_miz_name_table
      L0_63 = L0_63[_ore_area_num]
      L0_63 = L0_63[_near_ore_index]
      if L0_63 ~= nil then
        return Fn_getGravityOre2(L0_63)
      end
      return nil
    else
      L0_63 = nil
      return L0_63
    end
  else
    L0_63 = nil
    return L0_63
  end
end
function clearNearOre()
  local L0_64, L1_65
  _near_ore_index = -1
end
function isNearOreBroken()
  local L0_66
  L0_66 = _near_ore_index
  if L0_66 ~= -1 then
    L0_66 = getNearOre
    L0_66 = L0_66()
    if L0_66 ~= nil and isOreBroken(L0_66) then
      return true
    else
      return false
    end
  else
    L0_66 = false
    return L0_66
  end
end
function moveToNearOre(A0_67, A1_68, A2_69, A3_70)
  local L4_71, L5_72, L6_73, L7_74
  L4_71 = Fn_findNpc
  L5_72 = MIZ_ID
  L4_71 = L4_71(L5_72)
  L5_72 = Fn_findNpcPuppet
  L6_73 = L4_71
  L5_72 = L5_72(L6_73)
  L6_73 = _miz_move_near_ore_flag
  if L6_73 == true then
    return
  end
  A0_67 = A0_67 or 1
  A1_68 = A1_68 or false
  A2_69 = A2_69 or MIZ_NEXT_ORE_MOVE_LIMITE
  if A3_70 ~= nil then
    _miz_ore_search_hight_range = A3_70
  end
  _miz_move_complete = false
  _miz_move_near_ore_flag = true
  L6_73 = {}
  L6_73.anim_walk_speed = A0_67
  L6_73.recast = true
  L6_73.navimesh = true
  if A1_68 == true then
    L7_74 = {}
    L7_74.runLength = -1
    L7_74.anim_speed_over = true
    L7_74.recast = true
    L7_74.navimesh = true
    L7_74.arrivedLength = 0
    L6_73 = L7_74
  end
  L7_74 = getNearOre
  L7_74 = L7_74()
  if L7_74 ~= nil or A1_68 == true then
    abortMoveToNearOreTask()
    _miz_move_task = Mv_safeTaskAbort(_miz_move_task)
    _moveToNearOreTask = invokeTask(function()
      local L0_75, L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82
      L0_75 = hideDigEffect
      L0_75()
      L0_75 = nil
      L1_76 = A1_68
      if L1_76 == false then
        L1_76 = L7_74
        L2_77 = L1_76
        L1_76 = L1_76.getWorldPos
        L1_76 = L1_76(L2_77)
        L2_77 = L1_76
        L1_76 = L1_76.DistanceTo
        L3_78 = L5_72
        L4_79 = L3_78
        L3_78 = L3_78.getWorldPos
        L7_82 = L3_78(L4_79)
        L1_76 = L1_76(L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L3_78(L4_79))
        L0_75 = L1_76
      else
        L0_75 = 20
      end
      L1_76 = 0
      L2_77 = _escape_enemy_flag
      if L2_77 == false then
        L2_77 = L7_74
        L3_78 = L2_77
        L2_77 = L2_77.getTagText
        L2_77 = L2_77(L3_78)
        if L2_77 == "L" then
          L1_76 = 1
        elseif L2_77 == "M" then
          L1_76 = 0.65
        else
          L1_76 = 0.45
        end
      end
      L2_77 = nil
      L3_78 = A1_68
      if L3_78 == false then
        L3_78 = Fn_turnNpc
        L4_79 = L4_71
        L5_80 = L7_74
        L3_78(L4_79, L5_80)
        L3_78 = L7_74
        L4_79 = L3_78
        L3_78 = L3_78.getWorldTransform
        L4_79 = L3_78(L4_79)
        L5_80 = L5_72
        L6_81 = L5_80
        L5_80 = L5_80.getWorldTransform
        L6_81 = L5_80(L6_81)
        L7_82 = L3_78 - L5_80
        if L3_78.y + 0.05 < L5_80.y then
          L1_76 = L1_76 * 0.6
        end
        L3_78 = L3_78 - NormalizeVector(L7_82) * L1_76
        L2_77 = L3_78
      else
        L3_78 = getEscapePos
        L3_78 = L3_78()
        L2_77 = L3_78
      end
      if L2_77 ~= nil then
        L3_78 = {L4_79}
        L4_79 = {}
        L4_79.pos = L2_77
        L5_80 = L6_73
        L4_79.opt = L5_80
        if L0_75 <= L1_76 then
          L4_79 = waitSeconds
          L5_80 = 0.2
          L4_79(L5_80)
          _miz_move_complete = true
        else
          L4_79 = Fn_moveNpc
          L5_80 = L4_71
          L6_81 = L3_78
          L7_82 = L6_73
          L4_79 = L4_79(L5_80, L6_81, L7_82)
          _miz_move_task = L4_79
          while true do
            L4_79 = _miz_move_complete
            if L4_79 ~= true then
              L4_79 = L4_71
              L5_80 = L4_79
              L4_79 = L4_79.isMoveEnd
              L4_79 = L4_79(L5_80)
              if L4_79 then
                _miz_move_complete = true
                break
              else
                L4_79 = A1_68
                if L4_79 == false then
                  L4_79 = isNearOreBroken
                  L4_79 = L4_79()
                  if L4_79 then
                    _miz_move_complete = true
                    break
                  end
                else
                  L4_79 = L4_71
                  L5_80 = L4_79
                  L4_79 = L4_79.isGrabbed
                  L4_79 = L4_79(L5_80)
                  if L4_79 == true then
                    _miz_move_complete = true
                    break
                  else
                    L4_79 = A2_69
                    L4_79 = L4_79 - 1
                    A2_69 = L4_79
                    L4_79 = A2_69
                    if L4_79 <= 0 then
                      _miz_move_complete = true
                      L4_79 = A1_68
                      if L4_79 == false then
                        L4_79 = endOreMining
                        L4_79()
                      end
                      break
                    end
                  end
                end
              end
            end
            L4_79 = wait
            L4_79()
          end
          L4_79 = Mv_safeTaskAbort
          L5_80 = _miz_move_task
          L4_79 = L4_79(L5_80)
          _miz_move_task = L4_79
          L4_79 = A1_68
          if L4_79 == false then
            L4_79 = Fn_turnNpc
            L5_80 = L4_71
            L6_81 = L7_74
            L4_79(L5_80, L6_81)
            L4_79 = waitSeconds
            L5_80 = 0.2
            L4_79(L5_80)
          end
        end
      end
      _miz_move_near_ore_flag = false
    end)
  end
end
function abortMoveToNearOreTask()
  _moveToNearOreTask = Mv_safeTaskAbort(_moveToNearOreTask)
end
function isMoveToNearOre()
  local L0_83, L1_84
  L0_83 = _miz_move_near_ore_flag
  return L0_83
end
function isMoveToNearOreComplete()
  local L0_85, L1_86
  L0_85 = _miz_move_complete
  return L0_85
end
function requesOreMizBreak()
  if getNearOre() ~= nil and getNearOre():getWorldPos():DistanceTo(Fn_findNpcPuppet(MIZ_ID):getWorldPos()) < 3 then
    getNearOre():requestBreak(Vector(1, 1, 0), 1)
  end
  clearNearOre()
end
function setupNextNearOre(A0_87)
  local L1_88, L2_89, L3_90
  A0_87 = A0_87 or false
  L1_88, L2_89 = nil, nil
  L3_90 = Fn_findNpcPuppet
  L3_90 = L3_90(MIZ_ID)
  if _escape_enemy_flag == false then
    L1_88, _near_ore_index, L2_89 = getHandleNearPuppet(L3_90, A0_87, _near_ore_index)
  else
    L1_88, _near_ore_index, L2_89 = getHandleRandomEscape(L3_90)
  end
end
function startOreMining()
  local L0_91, L1_92
  _ore_mining_time = 0
  _escape_enemy_flag = false
  _ore_mining_caption_wait = 0
end
function endOreMining()
  _ore_mining_time = -1
  _escape_enemy_flag = false
  _miz_move_complete = true
  abortMoveToNearOreTask()
  Fn_playMotionNpc(MIZ_ID, "stay", false)
  hideDigEffect()
  _ore_mining_caption_wait = 0
end
function isOreMining()
  local L1_93
  L1_93 = _ore_mining_time
  if L1_93 ~= -1 then
    L1_93 = true
    return L1_93
  else
    L1_93 = false
    return L1_93
  end
end
function visibleDigEffect()
  if _sfx_dig == nil then
    _sfx_dig = Fn_createEffect("ef_ev_jkpar_01", "ef_ev_jkpar_01", {
      obj = Fn_findNpcPuppet(MIZ_ID),
      joint = "bn_r_drill3"
    }, true)
  end
end
function hideDigEffect()
  if _sfx_dig ~= nil then
    _sfx_dig:stop()
    _sfx_dig = nil
  end
end
function startEscapeEnemy()
  local L0_94, L1_95
  L0_94 = _escape_enemy_flag
  if L0_94 == false then
    L0_94 = MIZ_NEXT_ORE_MINING_TIME
    L0_94 = L0_94 - 1
    _ore_mining_time = L0_94
    _escape_enemy_flag = true
  end
end
function isEscapeEnemy()
  local L0_96, L1_97
  L0_96 = _escape_enemy_flag
  return L0_96
end
function endEscapeEnemy()
  if _escape_enemy_flag == true then
    _miz_move_complete = true
    _ore_mining_time = -1
    Fn_playMotionNpc(MIZ_ID, "stay", false)
  end
end
function getHandleNearPuppet(A0_98, A1_99, A2_100, A3_101)
  local L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110, L13_111, L14_112
  if not A3_101 then
    L4_102 = getOreAreaNum
    L4_102 = L4_102()
    A3_101 = L4_102
  end
  A1_99 = A1_99 or false
  A2_100 = A2_100 or -1
  L5_103 = A0_98
  L4_102 = A0_98.getWorldPos
  L4_102 = L4_102(L5_103)
  L5_103 = 1000
  L6_104 = -1
  L7_105 = nil
  for L11_109 = 1, L9_107[A3_101] do
    if A2_100 ~= L11_109 then
      L12_110 = _ore_miz_name_table
      L12_110 = L12_110[A3_101]
      L12_110 = L12_110[L11_109]
      L13_111 = Fn_getGravityOre2
      L14_112 = L12_110
      L13_111 = L13_111(L14_112)
      if L13_111 ~= nil then
        L14_112 = isOreBroken
        L14_112 = L14_112(L13_111)
        if not L14_112 or A1_99 then
          L14_112 = L13_111.getWorldPos
          L14_112 = L14_112(L13_111)
          if Fn_get_distance(L4_102, L14_112) < MIZ_SEARCH_ORE_DISTANCE and L5_103 > Fn_get_distance(L4_102, L14_112) and -(L14_112.y - L4_102.y) < _miz_ore_search_hight_range then
            L5_103 = Fn_get_distance(L4_102, L14_112)
            L6_104 = L11_109
            L7_105 = L13_111
          end
        end
      end
    end
  end
  return L8_106, L9_107, L10_108
end
function getHandleRandomEscape(A0_113, A1_114)
  local L2_115, L3_116, L4_117
  if not A1_114 then
    L2_115 = getOreAreaNum
    L2_115 = L2_115()
    A1_114 = L2_115
  end
  L2_115 = _miz_escape_locate_talbe
  L2_115 = #L2_115
  L3_116 = -1
  L4_117 = 25
  for _FORV_8_ = 1, L2_115 do
    if L4_117 > Fn_get_distance(A0_113:getWorldPos(), _miz_escape_locate_talbe[_FORV_8_]) and -(_miz_escape_locate_talbe[_FORV_8_].y - A0_113:getWorldPos().y) < 15 then
      L4_117, L3_116 = Fn_get_distance(A0_113:getWorldPos(), _miz_escape_locate_talbe[_FORV_8_]), _FORV_8_
    end
  end
  if _FOR_() ~= nil and getEscapePos():DistanceTo(A0_113:getWorldPos()) < 5 then
    L3_116 = -1
  end
  return nil, L3_116, L4_117
end
function getEscapePos()
  local L0_118
  L0_118 = _escape_enemy_flag
  if L0_118 == true then
    L0_118 = _near_ore_index
    if L0_118 ~= -1 then
      L0_118 = _miz_escape_locate_talbe
      L0_118 = L0_118[_near_ore_index]
      return L0_118
    end
  else
    L0_118 = nil
    return L0_118
  end
end
function addMizEscapePos(A0_119, A1_120, A2_121)
  local L4_122
  L4_122 = table
  L4_122 = L4_122.insert
  L4_122(_miz_escape_locate_talbe, Vector(A0_119, A1_120, A2_121))
end
function clearMizEscapePos()
  local L0_123, L1_124
  L0_123 = {}
  _miz_escape_locate_talbe = L0_123
end
function enemyAttackMiz(A0_125, A1_126)
  endEnemyAttackMiz()
  if _enemy_brain == nil and searchMizEscapeLocate() == true then
    invokeTask(function()
      _enemy_brain = A0_125
      while _enemy_brain ~= nil and _enemy_brain:isReadyEnemy() ~= true do
        wait()
      end
      if _enemy_brain ~= nil then
        if A1_126 == true then
          _enemy_move_node:setWorldPos(_enemy_move_node:getWorldPos() + Vector(0, 2.5, 0))
        end
        _enemy_brain:move({
          _enemy_move_node
        })
      end
      while _enemy_brain ~= nil do
        if _enemy_brain:isReadyEnemy() == true and (_enemy_brain:isMoveEnd() or 0 >= 250 - 1) then
          endEnemyAttackMiz()
          break
        end
        wait()
      end
    end)
  end
end
function endEnemyAttackMiz()
  if _enemy_brain ~= nil then
    invokeTask(function()
      while _enemy_brain ~= nil and _enemy_brain:isReadyEnemy() ~= true do
        wait()
      end
      if _enemy_brain ~= nil then
        _enemy_brain:endScriptAction()
      end
      _enemy_brain = nil
    end)
  end
end
function searchMizEscapeLocate()
  local L0_127, L1_128, L2_129
  L0_127 = false
  L1_128 = area
  if not L1_128 then
    L1_128 = getOreAreaNum
    L1_128 = L1_128()
  end
  area = L1_128
  L1_128 = Fn_findNpcPuppet
  L2_129 = MIZ_ID
  L1_128 = L1_128(L2_129)
  L2_129 = getHandleNearPuppet
  L2_129 = L2_129(L1_128, true)
  if L2_129 ~= nil and Fn_get_distance(L1_128:getWorldPos(), L2_129:getWorldPos()) < 10 then
    Fn_getParentArea(L2_129):appendChild(_enemy_move_node)
    _enemy_move_node:setWorldPos(L2_129:getWorldPos())
    _enemy_move_node:setForceMove()
    L0_127 = true
  end
  return L0_127
end
function changeMissionTerm(A0_130)
  local L1_131
  _mission_term = A0_130
end
function getMissionTerm()
  local L0_132, L1_133
  L0_132 = _mission_term
  return L0_132
end
function createRespawnoreTask(A0_134, A1_135)
  return invokeTask(function()
    local L0_136, L1_137, L2_138, L3_139, L4_140, L5_141, L6_142, L7_143
    L0_136 = {}
    while true do
      for L4_140 = 1, L2_138[L3_139] do
        L5_141 = _ore_miz_name_table
        L6_142 = _ore_area_num
        L5_141 = L5_141[L6_142]
        L5_141 = L5_141[L4_140]
        L6_142 = Fn_getGravityOre2
        L7_143 = L5_141
        L6_142 = L6_142(L7_143)
        if L6_142 ~= nil then
          L7_143 = L6_142.setActive
          L7_143(L6_142, true)
        end
        L7_143 = Fn_getGravityOre2
        L7_143 = L7_143(L5_141)
        if L7_143 ~= nil then
          L7_143:setLockonPermission(true)
          if isOreBroken(L7_143) then
            if L0_136[L5_141] == nil then
              L0_136[L5_141] = 0
            end
            if A0_134 then
              L0_136[L5_141] = L0_136[L5_141] + 1
            else
              L0_136[L5_141] = _ORE_RESPAWN_WAIT_FRAME_TIME
            end
            if L0_136[L5_141] >= _ORE_RESPAWN_WAIT_FRAME_TIME and Fn_getDistanceToPlayer(L7_143) > A1_135 and raycastScreen(L7_143, 90, nil, nil, 1.5) == false then
              L0_136[L5_141] = 0
              restoreOre(L7_143)
              _miz_broken = _miz_broken - 1
              if 0 > _miz_broken then
                _miz_broken = 0
              end
            end
          end
        end
      end
      L1_137()
    end
  end)
end
function startAutoRespawnOre()
  local L0_144, L1_145
  _auto_respawn_flag = true
end
function abortAutoRespawnTask()
  _create_ore_task = Mv_safeTaskAbort(_create_ore_task)
end
function startAutoRespawnOre2()
  local L0_146, L1_147
  _auto_respawn_flag2 = true
end
function abortAutoRespawnTask2()
  _create_ore_task2 = Mv_safeTaskAbort(_create_ore_task2)
end
function raycastScreen(A0_148, A1_149, A2_150, A3_151, A4_152)
  local L5_153, L6_154, L7_155
  L5_153 = false
  if A4_152 == nil then
    A4_152 = 0.5
  end
  L7_155 = A0_148
  L6_154 = A0_148.getWorldPos
  L6_154 = L6_154(L7_155)
  L7_155 = Camera
  L7_155 = L7_155.getEyePos
  L7_155 = L7_155(L7_155)
  if A2_150 ~= nil then
    L7_155.x = L7_155.x + A2_150.x
    L7_155.y = L7_155.y + A2_150.y
    L7_155.z = L7_155.z + A2_150.z
  end
  if A3_151 ~= nil then
    L6_154.x = L6_154.x + A3_151.x
    L6_154.y = L6_154.y + A3_151.y
    L6_154.z = L6_154.z + A3_151.z
  end
  if A1_149 == nil or A1_149 <= 0 or A1_149 >= Fn_get_distance(L6_154, L7_155) then
    Query:setEyeSightTransform(L7_155)
    if Fn_isInSightTarget(A0_148, A4_152) == true then
      L5_153 = true
    end
  end
  return L5_153
end
function setPrevPhaseContinue(A0_156)
  local L1_157
  _prev_phase_continue = A0_156
end
function getPrevPhaseContinue()
  local L0_158, L1_159
  L0_158 = _prev_phase_continue
  return L0_158
end
function playDrillSound(A0_160)
  local L1_161
  L1_161 = Fn_findNpcPuppet
  L1_161 = L1_161(MIZ_ID)
  stopDrillSound()
  if A0_160 == 1 then
    _npc_se_hdl[A0_160] = Sound:playSEHandle("npc_drill_idling", 1, "", L1_161)
  else
    _npc_se_hdl[A0_160] = Sound:playSEHandle("npc_drill_digging", 1, "", L1_161)
  end
end
function stopDrillSound()
  local L0_162, L1_163, L2_164, L3_165, L4_166
  for L3_165, L4_166 in L0_162(L1_163) do
    if L4_166 ~= nil then
      Sound:stopSEHandle(L4_166)
      _npc_se_hdl[L3_165] = nil
    end
  end
end
function setCatWarpPlaying(A0_167)
  local L1_168
  _cat_warp_playing = A0_167
end
function getCatWarpPlaying()
  local L0_169, L1_170
  L0_169 = _cat_warp_playing
  return L0_169
end
function setMizFallFlag(A0_171)
  local L1_172
  _miz_fall_flag = A0_171
end
function getMizFallFlag()
  local L0_173, L1_174
  L0_173 = _miz_fall_flag
  return L0_173
end
function getMizWarningTime()
  local L0_175, L1_176
  L0_175 = _miz_warning_time
  return L0_175
end
