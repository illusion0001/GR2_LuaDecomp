dofile("/Game/Event2/Common/HeaderCommon.lua")
import("Vehicle")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_QUIZ_MOB_NUM = 6
_QUIZ_MOB = nil
_bra_mot = {
  trouble = "bra01_trouble_00",
  found = "bra01_found_ep14_00"
}
_smoke_ef = nil
_ship_se_hdl = nil
_bra_phase = 0
_c_played = false
_ship_flg = false
_broken_ship = nil
_ship_route0 = nil
_ship_area = nil
_noticed = false
_bra_reset = false
_view_node = nil
_ship_move_end = false
_ep14e_monitoring = false
_grabalert = nil
_monitoring_ship_task = nil
_bra_npc_hdl = nil
_arrivalshop = false
_sensors = {}
_grid = {}
_customers = {}
_opt = {}
_chi_opt = {}
_ep14_mot = {}
_quiz_phase = 0
_pc_line_pos = {}
_buying_ok = false
_buying_fin = false
_gen_stop = false
_spawn_g_max = false
_start = false
_pc_join = false
_cutin_pos = nil
_shop_master_task = false
_goal_pos = nil
_d_kaiwa_end = false
_near_bra = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictPlc_ep14_00
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_cat_warp_02"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensormulti2_cat_warp_e_f"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensormulti2_cat_warp_c"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_around_shop"
  L0_0(L1_1)
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  L1_1 = "locator2_brahman"
  L2_2 = "stay"
  L3_3 = false
  if L0_0 == "ep14_c" then
    L3_3 = true
  elseif L0_0 == "ep14_d" then
    L1_1 = "locator2_brahman_bench"
    L2_2 = "sit_00"
  elseif L0_0 == "ep14_e" then
    L1_1 = "locator2_brahman_bench"
    L2_2 = "sit_00"
    L3_3 = true
  elseif L0_0 == "ep14_f" then
    L1_1 = "locator2_bra_school"
    L3_3 = true
  end
  L4_4 = {L5_5}
  L5_5 = {}
  L5_5.name = "brahman"
  L5_5.type = "bra01"
  L5_5.node = L1_1
  L5_5.anim_name = L2_2
  L5_5.active = L3_3
  L5_5.use_fall = true
  L5_5 = Fn_setupNpc
  L6_6 = L4_4
  L5_5(L6_6)
  L5_5 = Fn_loadNpcEventMotion
  L6_6 = "brahman"
  L7_7 = _bra_mot
  L5_5(L6_6, L7_7)
  L5_5 = Fn_findNpc
  L6_6 = "brahman"
  L5_5 = L5_5(L6_6)
  _bra_npc_hdl = L5_5
  if L0_0 == "ep14_c" or L0_0 == "ep14_d" then
    L5_5 = Fn_setupNpc
    L6_6 = {L7_7}
    L7_7 = {}
    L7_7.name = "master"
    L7_7.type = "man26"
    L7_7.node = "locator2_master_man26"
    L7_7.anim_name = "vendor_attract_00"
    L5_5(L6_6)
    if L0_0 == "ep14_c" then
      L5_5 = Fn_pcSensorOn
      L6_6 = "pccubesensormulti2_cat_warp_c"
      L5_5(L6_6)
    end
  end
  if L0_0 == "ep14_d" or L0_0 == "ep14_e" or L0_0 == "ep14_f" then
    L5_5 = Fn_pcSensorOn
    L6_6 = "pccubesensor2_cat_warp_02"
    L5_5(L6_6)
    if L0_0 ~= "ep14_d" then
      L5_5 = Fn_pcSensorOn
      L6_6 = "pccubesensormulti2_cat_warp_e_f"
      L5_5(L6_6)
    end
    L5_5 = findGameObject2
    L6_6 = "TerrainBg"
    L7_7 = "bench1"
    L5_5 = L5_5(L6_6, L7_7)
    if L5_5 == nil then
      L5_5 = Fn_createTerrainBg
      L6_6 = "locator2_bench_1"
      L7_7 = "bench1"
      L5_5 = L5_5(L6_6, L7_7, L8_8)
      L6_6 = Fn_createTerrainBg
      L7_7 = "locator2_bench_2"
      L6_6 = L6_6(L7_7, L8_8, L9_9)
      L7_7 = L5_5.setIgnoreGrab
      L7_7(L8_8, L9_9)
    end
  end
  L5_5 = createGameObject2
  L6_6 = "TerrainBg"
  L5_5 = L5_5(L6_6)
  _broken_ship = L5_5
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.loadModel
  L7_7 = "g1_car_pd_07"
  L5_5(L6_6, L7_7)
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.loadCollision
  L7_7 = "g1_car_pd_07"
  L5_5(L6_6, L7_7)
  while true do
    L5_5 = _broken_ship
    L6_6 = L5_5
    L5_5 = L5_5.isLoading
    L5_5 = L5_5(L6_6)
    if L5_5 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.setModelName
  L7_7 = "g1_car_pd_07"
  L5_5(L6_6, L7_7)
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.setCollisionName
  L7_7 = "g1_car_pd_07"
  L5_5(L6_6, L7_7)
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.setName
  L7_7 = "broken_ship_ve01"
  L5_5(L6_6, L7_7)
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.setWorldTransform
  L7_7 = findGameObject2
  L7_7 = L7_7(L8_8, L9_9)
  L7_7 = L7_7.getWorldTransform
  L12_12 = L7_7(L8_8)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L7_7(L8_8))
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.setForceMove
  L5_5(L6_6)
  L5_5 = _broken_ship
  L6_6 = L5_5
  L5_5 = L5_5.setActive
  L7_7 = false
  L5_5(L6_6, L7_7)
  if L0_0 == "ep14_c" then
    L5_5 = ship_flg
    L5_5()
  end
  while true do
    L5_5 = Vehicle
    L6_6 = L5_5
    L5_5 = L5_5.isReady
    L5_5 = L5_5(L6_6)
    if not L5_5 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = {
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    [8] = L10_10(L11_11)
  }
  L6_6 = findGameObject2
  L7_7 = "Node"
  L6_6 = L6_6(L7_7, L8_8)
  L7_7 = L6_6
  L6_6 = L6_6.getWorldPos
  L6_6 = L6_6(L7_7)
  L7_7 = findGameObject2
  L7_7 = L7_7(L8_8, L9_9)
  L7_7 = L7_7.getWorldPos
  L7_7 = L7_7(L8_8)
  L11_11 = "locator2_monitoring_ship_next"
  L11_11 = "Node"
  L12_12 = "locator2_ship_move_01"
  L11_11 = L10_10
  L12_12 = L10_10(L11_11)
  ;({
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    [8] = L10_10(L11_11)
  })[5] = L10_10
  ;({
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    [8] = L10_10(L11_11)
  })[6] = L11_11
  ;({
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    [8] = L10_10(L11_11)
  })[7] = L12_12
  L6_6 = Vehicle
  L7_7 = L6_6
  L6_6 = L6_6.spawnRoute
  L6_6 = L6_6(L7_7, L8_8, L9_9)
  _ship_route0 = L6_6
  L6_6 = {
    L7_7,
    [7] = L8_8(L9_9)
  }
  L7_7 = findGameObject2
  L7_7 = L7_7(L8_8, L9_9)
  L7_7 = L7_7.getWorldPos
  L7_7 = L7_7(L8_8)
  L12_12 = L8_8(L9_9)
  ;({
    L7_7,
    [7] = L8_8(L9_9)
  })[2] = L8_8
  ;({
    L7_7,
    [7] = L8_8(L9_9)
  })[3] = L9_9
  ;({
    L7_7,
    [7] = L8_8(L9_9)
  })[4] = L10_10
  ;({
    L7_7,
    [7] = L8_8(L9_9)
  })[5] = L11_11
  ;({
    L7_7,
    [7] = L8_8(L9_9)
  })[6] = L12_12
  L7_7 = Vehicle
  L7_7 = L7_7.spawnRoute
  L7_7 = L7_7(L8_8, L9_9, L10_10)
  _ship_route1 = L7_7
  L7_7 = {
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    findGameObject2("Node", "locator2_ship_move_07"):getWorldPos(),
    findGameObject2("Node", "locator2_ship_move_01"):getWorldPos()
  }
  L11_11 = "locator2_ship_move_03"
  L11_11 = "Node"
  L12_12 = "locator2_ship_move_04"
  L11_11 = L10_10
  L11_11 = findGameObject2
  L12_12 = "Node"
  L11_11 = L11_11(L12_12, "locator2_ship_move_05")
  L12_12 = L11_11
  L11_11 = L11_11.getWorldPos
  L11_11 = L11_11(L12_12)
  L12_12 = findGameObject2
  L12_12 = L12_12("Node", "locator2_ship_move_06")
  L12_12 = L12_12.getWorldPos
  L12_12 = L12_12(L12_12)
  L11_11 = g_own
  _ship_route2 = L8_8
  L11_11 = g_own
  _ship_obj = L8_8
  L8_8(L9_9, L10_10)
  L8_8(L9_9, L10_10)
  _view_node = L8_8
  L8_8(L9_9)
  L8_8(L9_9)
  L8_8(L9_9)
  L8_8(L9_9, L10_10)
  L11_11 = 0
  L12_12 = 0
  L12_12 = L10_10(L11_11, L12_12, 0)
  L8_8(L9_9, L10_10, L11_11, L12_12, L10_10(L11_11, L12_12, 0))
  L8_8(L9_9)
  L11_11 = "pccubesensor2_pc04"
  L12_12 = "pccubesensor2_pc05"
  _sensors = L8_8
  for L11_11, L12_12 in L8_8(L9_9) do
    Fn_pcSensorOff(L12_12)
  end
  L9_9.person = nil
  L9_9.l_mob = nil
  L9_9.r_mob = nil
  L9_9.pos = "locator2_space01"
  L10_10.person = nil
  L10_10.l_mob = nil
  L10_10.r_mob = nil
  L10_10.pos = "locator2_space02"
  L11_11 = {}
  L11_11.person = nil
  L11_11.l_mob = nil
  L11_11.r_mob = nil
  L11_11.pos = "locator2_space03"
  L12_12 = {}
  L12_12.person = nil
  L12_12.l_mob = nil
  L12_12.r_mob = nil
  L12_12.pos = "locator2_space04"
  _grid = L8_8
  for L11_11 = 1, #L9_9 do
    L12_12 = _pc_line_pos
    L12_12[L11_11] = false
  end
  L9_9.name = "customer01"
  L9_9.type = "wom41"
  L10_10.name = "l_01"
  L10_10.type = "man01"
  L10_10.color_variation = 2
  L10_10.hair_variation = 0
  L9_9.L = L10_10
  L10_10.name = "r_01"
  L10_10.type = "chi19"
  L10_10.color_variation = 1
  L10_10.hair_variation = 1
  L9_9.R = L10_10
  L10_10.name = "customer02"
  L10_10.type = "wom03"
  L11_11 = {}
  L11_11.name = "l_02"
  L11_11.type = "wom46"
  L11_11.color_variation = 2
  L11_11.hair_variation = 1
  L10_10.L = L11_11
  L11_11 = {}
  L11_11.name = "r_02"
  L11_11.type = "man07"
  L11_11.color_variation = 3
  L11_11.hair_variation = 1
  L10_10.R = L11_11
  L11_11 = {}
  L11_11.name = "customer03"
  L11_11.type = "wom44"
  L11_11.L = nil
  L11_11.R = nil
  L12_12 = {}
  L12_12.name = "customer04"
  L12_12.type = "wom05"
  L12_12.L = {
    name = "l_04",
    type = "chi20",
    color_variation = 0,
    hair_variation = 1
  }
  L12_12.R = {
    name = "r_04",
    type = "chi19",
    color_variation = 2,
    hair_variation = 0
  }
  _customers = L8_8
  _QUIZ_MOB = L8_8
  L9_9.stay_line = "wom01_stay_line_00"
  L9_9.stay_line2 = "wom01_stay_line_01"
  L9_9.watching = "wom01_watching_soft_00"
  L9_9.watching2 = "wom01_watching_soft_01"
  L8_8.w = L9_9
  L9_9.stay_line = "man01_stay_line_00"
  L9_9.stay_line2 = "man01_stay_line_01"
  L9_9.buy01 = "man01_idle_up_02"
  L9_9.buy02 = "man01_count_01"
  L8_8.m = L9_9
  L9_9.stay_line = "wom36_stay_line_00"
  L9_9.watching = "wom36_watching_soft_00"
  L8_8.bag = L9_9
  for L11_11, L12_12 in L8_8(L9_9) do
    L12_12.move_sta = {
      arrivedLength = 0,
      goalDirection = true,
      anim_walk_speed = 1,
      runLength = 1000,
      anim_run_speed = 2,
      runLength = 1000
    }
    L12_12.mot_tbl = {}
    if L12_12.L ~= nil or L12_12.R ~= nil then
      L12_12.mot_tbl = {
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03"
      }
    end
    if string.match(L12_12.type, "wom") ~= nil then
      table.insert(L12_12.mot_tbl, 1, "lookaround")
    else
      table.insert(L12_12.mot_tbl, 1, "talk_laugh_00")
      table.insert(L12_12.mot_tbl, 1, "talk_sad_00")
      table.insert(L12_12.mot_tbl, 1, "lookaround_02")
    end
    if L12_12.L ~= nil then
      L12_12.L.grid_side = "l_mob"
      L12_12.L.move_sta = {}
      L12_12.L.mot_tbl = {}
      L12_12.L.loc = nil
      L12_12.L.turn_opt = -100
      if string.match(L12_12.L.type, "chi") ~= nil then
        L12_12.L.move_sta = {
          avoidance = false,
          arrivedLength = 0,
          goalDirection = true,
          anim_walk_speed = 1.7,
          anim_speed_over = true,
          runLength = 1000,
          anim_run_speed = 2.3
        }
        L12_12.L.mot_tbl = {
          "lookaround",
          "stay",
          "stay_02",
          "talk_00"
        }
        L12_12.L.loc = "locator2_l_chi_pos"
      else
        L12_12.L.move_sta = {
          avoidance = false,
          arrivedLength = 0,
          goalDirection = true,
          anim_walk_speed = 1,
          runLength = 1000,
          anim_run_speed = 2
        }
        L12_12.L.mot_tbl = {
          "talk_00",
          "talk_01",
          "talk_02",
          "talk_03"
        }
        L12_12.L.loc = "locator2_l_pos"
      end
    end
    if L12_12.R ~= nil then
      L12_12.R.grid_side = "r_mob"
      L12_12.R.move_sta = {}
      L12_12.R.mot_tbl = {}
      L12_12.R.loc = nil
      L12_12.R.turn_opt = 100
      if string.match(L12_12.R.type, "chi") ~= nil then
        L12_12.R.move_sta = {
          avoidance = false,
          arrivedLength = 0,
          goalDirection = true,
          anim_walk_speed = 1.7,
          anim_speed_over = true,
          runLength = 1000,
          anim_run_speed = 2.3
        }
        L12_12.R.mot_tbl = {
          "lookaround",
          "stay",
          "stay_02",
          "talk_00"
        }
        L12_12.R.loc = "locator2_r_chi_pos"
      else
        L12_12.R.move_sta = {
          avoidance = false,
          arrivedLength = 0,
          goalDirection = true,
          anim_walk_speed = 1,
          runLength = 1000,
          anim_run_speed = 2
        }
        L12_12.R.mot_tbl = {
          "talk_00",
          "talk_01",
          "talk_02",
          "talk_03"
        }
        L12_12.R.loc = "locator2_r_pos"
      end
    end
  end
end
function Ingame()
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23
  L0_13 = false
  L1_14 = false
  L2_15 = false
  L3_16, L4_17 = nil, nil
  while true do
    L5_18 = Fn_getMissionPart
    L5_18 = L5_18()
    if L5_18 == "ep14_b" then
      if L6_19 then
        L6_19(L7_20, L8_21)
        L6_19()
        L6_19(L7_20, L8_21)
        L6_19()
        _ship_flg = false
      elseif L6_19 then
        L6_19(L7_20)
        L6_19(L7_20)
        _near_bra = false
      end
    elseif L5_18 == "ep14_c" then
      if L6_19 then
        L6_19(L7_20)
        L6_19()
        L6_19(L7_20, L8_21)
        L6_19()
        _ship_flg = false
      end
      if L6_19 == false then
        L6_19(L7_20)
      end
      if L6_19 then
        L6_19()
        if not L6_19 then
          L8_21.name = "master"
          L8_21.type = "man26"
          L8_21.node = "locator2_master_man26"
          L8_21.start = true
          L8_21.anim_name = "vendor_attract_00"
          L6_19(L7_20)
        end
        L6_19(L7_20)
        L6_19(L7_20)
        while true do
          if L6_19 == false then
            L6_19()
          end
        end
        L9_22 = "ep14_shop_col"
        L10_23 = true
        L4_17 = L6_19
        L6_19()
        L6_19()
        L6_19(L7_20)
        _c_played = true
        _start = false
      end
      if L6_19 == 1 then
        if L6_19 ~= nil then
          L6_19(L7_20)
          L6_19.ai = nil
          L6_19()
        end
        while true do
          while true do
            if L6_19 then
              L6_19()
            end
          end
        end
        while true do
          if L6_19 then
            L6_19()
          end
        end
        L6_19()
        L6_19(L7_20)
        while true do
          if L6_19 then
            L6_19()
          end
        end
        _pause = false
        L9_22 = 1
        L10_23 = ""
        L6_19(L7_20, L8_21, L9_22, L10_23, Fn_findNpcPuppet(_QUIZ_MOB))
        L9_22 = true
        L6_19(L7_20, L8_21, L9_22)
        L6_19(L7_20)
        L9_22 = 1
        L10_23 = Fn_findNpcPuppet
        L10_23 = L10_23(_QUIZ_MOB)
        L10_23 = L10_23.getWorldTransform
        L10_23 = L10_23(L10_23)
        L6_19(L7_20, L8_21, L9_22, L10_23, L10_23(L10_23))
        L6_19(L7_20)
        while true do
          if L6_19 then
            L6_19()
          end
        end
        L9_22 = 1
        L10_23 = Vector
        L10_23 = L10_23(0, 0, 0)
        L6_19(L7_20, L8_21, L9_22, L10_23, L10_23(0, 0, 0))
        _quiz_phase = 2
      elseif L6_19 == 3 then
        L9_22 = true
        L6_19(L7_20, L8_21, L9_22)
        L9_22 = "locator2_wom_course_02"
        L10_23 = "locator2_wom_course_04"
        L9_22 = {}
        L9_22.runLength = -1
        L6_19(L7_20, L8_21, L9_22)
        for L9_22, L10_23 in L6_19(L7_20) do
          if L10_23.person == _QUIZ_MOB then
            if _grid[L9_22 + 1].person == "pc" then
              _grid[L9_22 + 1].person = nil
            end
            L10_23.person = nil
          end
        end
        while true do
          if L6_19 ~= 2 then
            L6_19()
          end
        end
        _quiz_phase = 4
      elseif L6_19 == 5 then
        L6_19(L7_20)
        _quiz_phase = 6
      end
    elseif L5_18 == "ep14_d" then
      if L6_19 == nil then
        L9_22 = "bench_kk_01"
        L9_22 = "bench2"
        L10_23 = "bench_kk_01"
        L9_22 = L6_19
        L10_23 = true
        L8_21(L9_22, L10_23)
      end
      if not L6_19 then
        L8_21.name = "master"
        L8_21.type = "man26"
        L8_21.node = "locator2_master_man26"
        L8_21.start = true
        L8_21.anim_name = "vendor_attract_00"
        L6_19(L7_20)
      end
      if L6_19 then
        L6_19(L7_20, L8_21)
        _broken_ship = nil
      end
      if L6_19 then
        L6_19(L7_20, L8_21)
        L6_19(L7_20)
        _smoke_ef = nil
        L6_19(L7_20)
      end
      if L6_19 then
        L6_19(L7_20, L8_21)
        _ship_se_hdl = nil
        L6_19(L7_20)
      end
      if L1_14 == false then
        for L9_22, L10_23 in L6_19(L7_20) do
          Fn_pcSensorOff(L10_23)
        end
        L6_19(L7_20)
        L1_14 = true
      end
      if L6_19 == false then
        _pc_join = false
        for L9_22, L10_23 in L6_19(L7_20) do
          if L10_23.person ~= nil then
            L10_23.person = nil
          end
          if L10_23.l_mob ~= nil then
            L10_23.l_mob = nil
          end
          if L10_23.r_mob ~= nil then
            L10_23.r_mob = nil
          end
        end
        L6_19.person = "pc"
        L6_19()
        _c_played = true
      end
      if L6_19 then
        if L6_19 == false then
          L6_19(L7_20)
          L6_19(L7_20)
          L8_21.targetJoint = "bn_head"
          L8_21.onlyFace = true
          L6_19(L7_20, L8_21)
          _d_kaiwa_end = false
          if L4_17 ~= nil then
            L6_19(L7_20, L8_21)
          end
        end
      end
    elseif L5_18 == "ep14_e" then
      if L6_19 == false then
        L6_19(L7_20)
        L6_19(L7_20)
        L8_21.targetJoint = "bn_head"
        L8_21.onlyFace = true
        L6_19(L7_20, L8_21)
        if L6_19 == nil then
          L9_22 = "bench_kk_01"
          L9_22 = "bench2"
          L10_23 = "bench_kk_01"
          L9_22 = L6_19
          L10_23 = true
          L8_21(L9_22, L10_23)
        end
        _ep14e_monitoring = true
      end
    elseif L5_18 == "ep14_f" then
      if L6_19 == false and L0_13 == false then
        L6_19(L7_20)
        L6_19()
        L6_19()
        _monitoring_ship_task = L6_19
        L9_22 = _ep14e_monitoring
        L9_22 = " / monitoring Ship Move !"
        L6_19(L7_20)
        L6_19(L7_20)
        if L6_19 == nil then
          L9_22 = "bench_kk_01"
          L9_22 = "bench2"
          L10_23 = "bench_kk_01"
        end
        L0_13 = true
      end
    end
    L6_19()
  end
end
function Finalize()
  Mob:restrictPlc_ep14_00(false)
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  grabOnlyBrahman(false)
  if _monitoring_ship_task ~= nil then
    _monitoring_ship_task:abort()
    _monitoring_ship_task = nil
  end
  if _ship_se_hdl then
    Sound:stopSEHandle(_ship_se_hdl)
    _ship_se_hdl = nil
    print("\230\149\133\233\154\156\232\136\185SE\227\128\129SE\227\131\143\227\131\179\227\131\137\227\131\171\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
  end
  _bra_npc_hdl = nil
end
function ship_flg()
  local L0_24, L1_25
  _ship_flg = true
end
function grabOnlyBrahman(A0_26)
  if A0_26 then
    Player:setGrabExceptionalObject({
      Fn_findNpcPuppet("brahman"):getName()
    })
  else
    Player:setGrabExceptionalObject({})
  end
end
function checkComSbViewNode()
  local L0_27, L1_28
  L0_27 = _view_node
  return L0_27
end
function ep14_e_setShipPos()
  _ship_obj:setWorldTransform(findGameObject2("Node", "locator2_monitoring_ship"):getWorldTransform())
  _ship_obj:setForceMove()
end
function ep14_f_setShipPos()
  _ship_obj:setWorldTransform(findGameObject2("Node", "locator2_ship_move_01"):getWorldTransform())
  _ship_obj:setForceMove()
end
function sdemoShipMove()
  invokeTask(function()
    _ship_obj:attach(_ship_route0)
    while _ship_obj:getRemainingDist() > 0 do
      wait()
    end
    _ship_obj:attach(findGameObject2("Node", "locator2_ship_move_02"))
    _monitoring_ship_task = monitoringShipMove()
  end)
end
function noticeFlgOn()
  local L0_29, L1_30
  _noticed = true
end
function monitoringShipMove()
  local L0_31
  L0_31 = createGameObject2
  L0_31 = L0_31("Node")
  L0_31:setName("target_pc_pos")
  L0_31:try_init()
  L0_31:waitForReady()
  L0_31:try_start()
  Fn_findAreaHandle("ed_a_root"):appendChild(L0_31)
  return invokeTask(function()
    local L0_32, L1_33
    while true do
      repeat
        L0_32 = _noticed
        if L0_32 == false then
          L0_32 = _ship_obj
          L1_33 = L0_32
          L0_32 = L0_32.getBaseSpeed
          L0_32 = L0_32(L1_33)
          if L0_32 ~= 10 then
            L0_32 = _ship_obj
            L1_33 = L0_32
            L0_32 = L0_32.setBaseSpeed
            L0_32(L1_33, 10)
            L0_32 = _ship_obj
            L1_33 = L0_32
            L0_32 = L0_32.setCurrSpeed
            L0_32(L1_33, 10)
          end
          L0_32 = _ship_obj
          L1_33 = L0_32
          L0_32 = L0_32.attach
          L0_32(L1_33, _ship_route2)
          L0_32 = wait
          L1_33 = 3
          L0_32(L1_33)
          while true do
            L0_32 = _ship_obj
            L1_33 = L0_32
            L0_32 = L0_32.getRemainingDist
            L0_32 = L0_32(L1_33)
            if L0_32 > 0 then
              L0_32 = _noticed
            end
            L0_32 = wait
            L0_32()
          end
      until L0_32 == false
      else
        L0_32 = _ship_obj
        L1_33 = L0_32
        L0_32 = L0_32.setBaseSpeed
        L0_32(L1_33, 0)
        L0_32 = _ship_obj
        L1_33 = L0_32
        L0_32 = L0_32.setCurrSpeed
        L0_32(L1_33, 0)
        L0_32 = wait
        L0_32()
        L0_32 = Sound
        L1_33 = L0_32
        L0_32 = L0_32.playSEHandle
        L0_32 = L0_32(L1_33, "m32_601_govship", 1, "")
        L1_33 = L0_31
        L1_33 = L1_33.setWorldPos
        L1_33(L1_33, Fn_getPlayerWorldPos())
        L1_33 = L0_31
        L1_33 = L1_33.setForceMove
        L1_33(L1_33)
        L1_33 = wait
        L1_33()
        L1_33 = Sound
        L1_33 = L1_33.playSEHandle
        L1_33 = L1_33(L1_33, "ep14_siren_govship", 1, "")
        _ship_obj:attach(L0_31)
        _ship_obj:setBaseSpeed(13)
        _ship_obj:setCurrSpeed(13)
        repeat
          wait()
        until 1 <= HUD:faderAlpha()
        Sound:stopSEHandle(L1_33)
        L0_32, L1_33 = nil, nil
        if invokeTask(function()
          while Fn_getDistanceToPlayer(_ship_obj) > 12 do
            wait()
          end
          _ship_obj:setBaseSpeed(0)
          _ship_obj:setCurrSpeed(0)
        end):isRunning() then
          invokeTask(function()
            while Fn_getDistanceToPlayer(_ship_obj) > 12 do
              wait()
            end
            _ship_obj:setBaseSpeed(0)
            _ship_obj:setCurrSpeed(0)
          end):abort()
        end
        if _ship_obj:getBaseSpeed() ~= 0 then
          _ship_obj:setBaseSpeed(0)
          _ship_obj:setCurrSpeed(0)
        end
        wait(5)
        _ship_obj:setWorldTransform(findGameObject2("Node", "locator2_ship_move_01"):getWorldTransform())
        _ship_obj:setForceMove()
        wait(3)
        _noticed = false
        wait()
      end
    end
    L0_32 = _ship_obj
    L1_33 = L0_32
    L0_32 = L0_32.try_term
    L0_32(L1_33)
    _ship_obj = nil
  end)
end
function ep14_b_c_brahman_ON()
  Fn_setNpcActive("brahman", true)
  Fn_playNpcEventMotion("brahman", _bra_mot.trouble, -1, 0.1, false)
end
function ep14_b_c_brahman_Off()
  Fn_setNpcActive("brahman", false)
end
function ep14_b_c_smoke_ON()
  local L0_34
  L0_34 = _smoke_ef
  if L0_34 == nil then
    L0_34 = Fn_createEffect
    L0_34 = L0_34("brokenship_eff", "ef_ev_smk_01", "locator2_eff_pos", true)
    _smoke_ef = L0_34
  end
  L0_34 = _ship_se_hdl
  if L0_34 == nil then
    L0_34 = findGameObject2
    L0_34 = L0_34("Node", "locator2_eff_pos")
    _ship_se_hdl = Sound:playSEHandle("ep14_malfunction_ship", 1, "", L0_34)
  end
end
function changeNearBraFlg()
  local L0_35, L1_36
  _near_bra = true
end
function getNearBraFlg()
  local L0_37, L1_38
  L0_37 = _near_bra
  return L0_37
end
function braResetFunc(A0_39, A1_40)
  local L2_41
  _warp_add_func = nil
  L2_41 = Fn_setGrabReleaseNpc
  L2_41("brahman")
  L2_41 = wait
  L2_41()
  L2_41 = Fn_warpNpc
  L2_41("brahman", A0_39)
  L2_41 = wait
  L2_41()
  L2_41 = Fn_playMotionNpc
  L2_41("brahman", "stay", false)
  L2_41 = waitSeconds
  L2_41(3)
  L2_41 = Fn_setGrabNpc
  L2_41("brahman", false, false)
  L2_41 = Fn_findNpcPuppet
  L2_41 = L2_41("brahman")
  Fn_naviSet(L2_41)
  Fn_tutorialCaption("grab")
  _bra_reset = false
  if _grabalert == nil then
    _grabalert = grabAlertCaption()
  end
  while L2_41:isGrabbed() == false do
    wait()
  end
  Fn_naviKill()
  Fn_naviSet(A1_40)
  Fn_tutorialCaptionKill()
  while Fn_isCaptionView() do
    wait()
  end
  _grabalert:abort()
  _grabalert = nil
  _warp_add_func = braReset
end
function brahmanControl()
  local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47
  L0_42 = Fn_findNpc
  L1_43 = "brahman"
  L0_42 = L0_42(L1_43)
  L1_43 = Fn_findNpcPuppet
  L2_44 = "brahman"
  L1_43 = L1_43(L2_44)
  L2_44 = findGameObject2
  L3_45 = "Node"
  L4_46 = "locator2_navi_shop_com_a"
  L2_44 = L2_44(L3_45, L4_46)
  L3_45 = {
    L4_46,
    L5_47,
    "ep14_02005",
    "ep14_02006"
  }
  L4_46 = "ep14_02003"
  L5_47 = "ep14_02004"
  L4_46 = false
  L5_47 = nil
  _bra_phase = 1
  invokeTask(function()
HEY HEY HEY
    local L0_48, L1_49
    while true do
      L0_48 = _bra_phase
      if L0_48 == 1 then
        L0_48 = Fn_naviSet
        L1_49 = L1_43
        L0_48(L1_49)
        L0_48 = Fn_setGrabNpc
        L1_49 = "brahman"
        L0_48(L1_49, false, false)
        while true do
          L0_48 = L0_42
          L1_49 = L0_48
          L0_48 = L0_48.isGrabbed
          L0_48 = L0_48(L1_49)
          if L0_48 == false then
            L0_48 = wait
            L0_48()
          end
        end
        L0_48 = braReset
        _warp_add_func = L0_48
        L0_48 = Fn_naviKill
        L0_48()
        L0_48 = invokeTask
        function L1_49()
          waitSeconds(2)
          Sound:playSE("bra_930", 1)
        end
        L0_48(L1_49)
        L0_48 = addBraPhase
        L0_48()
      else
        L0_48 = _bra_phase
        if L0_48 == 3 then
          L0_48 = L4_46
          if L0_48 == false then
            while true do
              L0_48 = Fn_isCaptionView
              L0_48 = L0_48()
              if L0_48 then
                L0_48 = wait
                L0_48()
              end
            end
            _arrived = false
            L0_48 = cueueCaptionView
            L1_49 = L2_44
            L1_49 = L1_49.getWorldPos
            L1_49 = L1_49(L1_49)
            L0_48 = L0_48(L1_49, nil, L3_45)
            L5_47 = L0_48
            L0_48 = true
            L4_46 = L0_48
            L0_48 = print
            L1_49 = "\227\130\176\227\131\169\227\131\150\228\184\173\227\129\174\227\131\150\227\131\172\227\131\149\227\131\158\227\131\179\227\129\174\227\129\164\227\129\182\227\130\132\227\129\141\229\134\141\231\148\159\233\150\139\229\167\139 <auto_cap_on = "
            L1_49 = L1_49 .. tostring(L4_46)
            L0_48(L1_49)
        else
          else
            L0_48 = _bra_phase
            if L0_48 ~= 2 then
              L0_48 = _bra_phase
            else
              if L0_48 == 3 then
                L0_48 = _bra_reset
                if L0_48 then
                  _arrived = true
                  L0_48 = L5_47
                  if L0_48 ~= nil then
                    L0_48 = L5_47
                    L1_49 = L0_48
                    L0_48 = L0_48.abort
                    L0_48(L1_49)
                    L0_48 = nil
                    L5_47 = L0_48
                  end
                  L0_48 = braResetFunc
                  L1_49 = "locator2_brahman"
                  L0_48(L1_49, L2_44)
                  L0_48 = false
                  L4_46 = L0_48
                end
            end
            else
              L0_48 = _arrivalshop
              if L0_48 == true then
                L0_48 = findGameObject2
                L1_49 = "Node"
                L0_48 = L0_48(L1_49, "locator2_space07")
                L2_44 = L0_48
                _arrivalshop = false
              else
                L0_48 = _bra_phase
                if L0_48 == 4 then
                  L0_48 = Vehicle
                  L1_49 = L0_48
                  L0_48 = L0_48.setVisible
                  L0_48(L1_49, true)
                  L0_48 = cueueCaptionViewEnd
                  L0_48()
                  L0_48 = Fn_appendNpcArea
                  L1_49 = L0_42
                  L0_48(L1_49, "locator2_brahman_01")
                  L0_48 = Fn_setGrabNpc
                  L1_49 = L0_42
                  L0_48(L1_49, true, true)
                  L0_48 = Fn_setGrabReleaseNpc
                  L1_49 = L0_42
                  L0_48(L1_49)
                  L0_48 = waitSeconds
                  L1_49 = 1.5
                  L0_48(L1_49)
                  _warp_add_func = nil
                  _bra_phase = 5
                  L0_48 = {}
                  L1_49 = 1
                  while findGameObject2("Node", "locator2_brahman_" .. string.format("%02d", L1_49)) ~= nil do
                    L0_48[L1_49] = findGameObject2("Node", "locator2_brahman_" .. string.format("%02d", L1_49)):getName()
                    do break end
                    do break end
                    L1_49 = L1_49 + 1
                  end
                  while Fn_moveNpc("brahman", L0_48, {arrivedLength = 2, runLength = -1}) and Fn_moveNpc("brahman", L0_48, {arrivedLength = 2, runLength = -1}):isRunning() do
                    wait()
                  end
                  Fn_setNpcActive("brahman", false)
                  _bra_phase = 1000
                  break
                end
              end
            end
          end
        end
      end
      L0_48 = wait
      L0_48()
    end
  end)
end
function dPartbrahmanControl()
  invokeTask(function()
    if _bra_phase == 1000 then
      Fn_warpNpc("brahman", "locator2_brahman_bench")
      wait()
      Fn_setNpcActive("brahman", true)
      Fn_playMotionNpc("brahman", "sit_00", false)
    end
    Fn_setNpcActive("brahman", true)
    _bra_phase = 1000
  end)
end
function ePartbrahmanControl()
  invokeTask(function()
    local L0_50, L1_51, L2_52, L3_53, L4_54, L5_55
    _bra_phase = 1
    L0_50 = Fn_findNpcPuppet
    L1_51 = "brahman"
    L0_50 = L0_50(L1_51)
    L1_51 = Fn_findNpcPuppet
    L2_52 = "brahman"
    L1_51 = L1_51(L2_52)
    L2_52 = L1_51
    L1_51 = L1_51.getWorldPos
    L1_51 = L1_51(L2_52)
    L2_52 = findGameObject2
    L3_53 = "Node"
    L4_54 = "locator2_bra_school"
    L2_52 = L2_52(L3_53, L4_54)
    L3_53 = L2_52
    L2_52 = L2_52.getWorldPos
    L2_52 = L2_52(L3_53)
    L3_53 = {
      L4_54,
      L5_55,
      "ep14_04005",
      "ep14_04006"
    }
    L4_54 = "ep14_04003"
    L5_55 = "ep14_04004"
    L4_54 = nil
    while true do
      L5_55 = _bra_phase
      if L5_55 == 2 then
        L5_55 = Fn_playMotionNpc
        L5_55("brahman", "sit_out_00")
        L5_55 = addBraPhase
        L5_55()
      else
        L5_55 = _bra_phase
        if L5_55 == 4 then
          L5_55 = Fn_playNpcEventMotion
          L5_55("brahman", _bra_mot.found, false, 0.1, false)
          L5_55 = waitSeconds
          L5_55(3.3)
          L5_55 = Fn_naviSet
          L5_55(L0_50)
          L5_55 = Fn_tutorialCaption
          L5_55("grab")
          L5_55 = Fn_setGrabNpc
          L5_55("brahman", false, false)
          L5_55 = grabAlertCaption
          L5_55 = L5_55()
          _grabalert = L5_55
          while true do
            L5_55 = L0_50.isGrabbed
            L5_55 = L5_55(L0_50)
            if L5_55 == false then
              L5_55 = wait
              L5_55()
            end
          end
          L5_55 = Fn_naviKill
          L5_55()
          L5_55 = Fn_tutorialCaptionKill
          L5_55()
          _arrived = false
          L5_55 = cueueCaptionView
          L5_55 = L5_55(L2_52, L1_51, L3_53)
          L4_54 = L5_55
          L5_55 = braReset
          _warp_add_func = L5_55
          L5_55 = print
          L5_55("_warp_add_func \227\131\150\227\131\172\227\131\149\227\131\158\227\131\179\228\189\141\231\189\174\227\131\170\227\130\187\227\131\131\227\131\136\227\131\149\227\131\169\227\130\176\231\153\187\233\140\178" .. tostring(_warp_add_func))
          L5_55 = addBraPhase
          L5_55()
        else
          L5_55 = _bra_phase
          if L5_55 == 5 then
            L5_55 = _bra_reset
            if L5_55 then
              _arrived = true
              L5_55 = findGameObject2
              L5_55 = L5_55("Node", "locator2_school")
              braResetFunc("locator2_brahman_bench", L5_55)
              if L4_54 ~= nil then
                L4_54:abort()
                L4_54 = nil
              end
              _arrived = false
              L4_54 = cueueCaptionView(L2_52, L1_51, L3_53)
            end
          else
            L5_55 = _bra_phase
            if L5_55 == 6 then
              L5_55 = Fn_setGrabReleaseNpc
              L5_55("brahman")
              L5_55 = wait
              L5_55()
              L5_55 = Fn_warpNpc
              L5_55("brahman", "locator2_bra_school")
              L5_55 = wait
              L5_55()
              _warp_add_func = nil
              break
            end
          end
        end
      end
      L5_55 = wait
      L5_55()
    end
    _bra_phase = 1000
  end)
end
function fPartbrahmanControl()
  invokeTask(function()
    local L0_56, L1_57
    L0_56 = Fn_watchNpc
    L1_57 = "brahman"
    L0_56(L1_57, false)
    _warp_add_func = nil
    _bra_phase = 1
    L0_56 = findGameObject2
    L1_57 = "Node"
    L0_56 = L0_56(L1_57, "locator2_viewing")
    L1_57 = Fn_findNpcPuppet
    L1_57 = L1_57("brahman")
    while true do
      if _bra_phase == 2 then
        Fn_warpNpc("brahman", "locator2_sdemo_bra_school")
        wait()
        addBraPhase()
      elseif _bra_phase == 4 then
        Fn_watchNpc("brahman", true)
        Fn_naviSet(L1_57)
        Fn_tutorialCaption("grab")
        Fn_setGrabNpc("brahman", false, false)
        _grabalert = grabAlertCaption()
        while L1_57:isGrabbed() == false do
          wait()
        end
        Fn_naviKill()
        Fn_naviSet(L0_56)
        Fn_tutorialCaptionKill()
        if _bra_reset then
          _bra_reset = false
        end
        while Fn_isCaptionView() do
          wait()
        end
        _grabalert:abort()
        _grabalert = nil
        _warp_add_func = braReset
        addBraPhase()
      elseif (_bra_phase == 5 or _bra_phase == 6) and _bra_reset then
        braResetFunc(({
          [5] = "locator2_sdemo_bra_school",
          [6] = "locator2_bra_station"
        })[_bra_phase], L0_56)
      elseif _bra_phase == 6 and _bra_reset == false and false == false then
        Fn_setCatWarpCheckPoint("locator2_station_pc_reset_pos1")
      elseif _bra_phase == 7 then
        _warp_add_func = nil
        _monitoring_ship_task:abort()
        _monitoring_ship_task = nil
        Fn_setGrabReleaseNpc("brahman")
        Fn_warpNpc("brahman", "locator2_sdemo_bra")
        wait()
        Fn_playMotionNpc("brahman", "stay_00", false)
        addBraPhase()
      elseif _bra_phase == 9 then
        Fn_turnNpc("brahman", -110)
        addBraPhase()
      elseif _bra_phase == 11 then
        Fn_turnNpc("brahman")
        addBraPhase()
      else
      end
      if _bra_phase ~= 13 then
        wait()
      end
    end
    _bra_phase = 1000
  end)
end
function grabAlertCaption()
  local L0_58, L1_59
  L0_58 = {L1_59, "ep14_09003"}
  L1_59 = "ep14_09002"
  L1_59 = Fn_findNpcPuppet
  L1_59 = L1_59("brahman")
  return invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer(L1_59) > 15 and Fn_getDistanceToPlayer(L1_59) < 50 and isBraGrabbed() == false and _bra_reset == false then
        Fn_captionView(Fn_get_shuffle_teble(L0_58)[1])
        waitSeconds(8.5)
      end
      wait()
    end
  end)
end
function addBraPhase()
  local L1_60
  L1_60 = _bra_phase
  L1_60 = L1_60 + 1
  _bra_phase = L1_60
end
function nowBraPhase()
  local L0_61, L1_62
  L0_61 = _bra_phase
  return L0_61
end
function braReset()
  local L0_63, L1_64
  _bra_reset = true
end
function checkBraResetFlg()
  local L0_65, L1_66
  L0_65 = _bra_reset
  return L0_65
end
function isBraGrabbed()
  return Fn_findNpcPuppet("brahman"):isGrabbed()
end
function shopMasterEnd()
  local L0_67, L1_68
  _shop_master_task = false
end
function shopStart()
  local L0_69, L1_70
  _start = true
end
function customerGeneratorStop()
  local L0_71, L1_72
  _gen_stop = true
end
function checkStartFlg()
  local L0_73, L1_74
  L0_73 = _start
  return L0_73
end
function checkCpartPlay()
  local L0_75, L1_76
  L0_75 = _c_played
  return L0_75
end
function pcJoin()
  local L0_77, L1_78
  _pc_join = true
end
function buyingOk()
  local L0_79, L1_80
  _buying_ok = true
end
function checkGridTbl()
  local L0_81, L1_82
  L0_81 = _grid
  return L0_81
end
function ep14_c_checkPcJoin()
  local L0_83, L1_84, L2_85
  L0_83 = false
  L1_84 = _grid
  L2_85 = _grid
  L2_85 = #L2_85
  L1_84 = L1_84[L2_85]
  L1_84 = L1_84.person
  if L1_84 == "pc" then
    L0_83 = true
  end
  return L0_83
end
function checkSpawnGridMax()
  local L0_86, L1_87
  L0_86 = _spawn_g_max
  return L0_86
end
function checkQuizPhase()
  local L0_88, L1_89
  L0_88 = _quiz_phase
  return L0_88
end
function quizNextPhase()
  local L1_90
  L1_90 = _quiz_phase
  L1_90 = L1_90 + 1
  _quiz_phase = L1_90
end
function checkCutInFlg()
  local L0_91, L1_92
  L0_91 = _cut_in
  return L0_91
end
function changeKaiwaEndFlg()
  local L0_93, L1_94
  _d_kaiwa_end = true
end
function customerGenerator()
  local L0_95, L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104
  L0_95 = _grid
  L0_95 = #L0_95
  L1_96 = 1
  L2_97 = wait
  L2_97()
  while true do
    L2_97 = _gen_stop
    if not L2_97 then
      L2_97 = _pc_join
      if L2_97 == false then
        L2_97 = _grid
        L2_97 = #L2_97
        if L1_96 == L2_97 then
          L2_97 = Fn_getMissionPart
          L2_97 = L2_97()
          if L2_97 == "ep14_c" then
            L2_97 = _grid
            L2_97 = L2_97[L1_96]
            L2_97.person = "pc"
          end
          _spawn_g_max = true
          repeat
            L2_97 = wait
            L2_97()
            L2_97 = _pc_join
          until L2_97
          L2_97 = _grid
          L0_95 = #L2_97
        end
      end
      L2_97 = _customers
      L2_97 = #L2_97
      if L1_96 > L2_97 then
        L2_97 = print
        L3_98 = "\229\174\162\227\131\134\227\131\188\227\131\150\227\131\1711\229\145\168\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\153"
        L2_97(L3_98)
        L1_96 = 1
      end
      L2_97 = _pc_join
      if L2_97 == false then
        L2_97 = _grid
        L2_97 = #L2_97
        if L1_96 < L2_97 then
          L2_97 = Fn_getMissionPart
          L2_97 = L2_97()
          if L2_97 ~= "ep14_c" then
            L2_97 = Fn_getMissionPart
            L2_97 = L2_97()
          elseif L2_97 == "ep14_d" and L1_96 ~= 1 then
            L2_97 = _customers
            L2_97 = L2_97[L1_96]
            L3_98 = _grid
            L3_98 = L3_98[L1_96]
            L3_98 = L3_98.pos
            L2_97.node = L3_98
            L2_97 = _customers
            L2_97 = L2_97[L1_96]
            L2_97.start = true
            L2_97 = Fn_setupNpc
            L3_98 = {L4_99}
            L4_99 = _customers
            L4_99 = L4_99[L1_96]
            L2_97(L3_98)
            L2_97 = _grid
            L2_97 = L2_97[L1_96]
            L3_98 = _customers
            L3_98 = L3_98[L1_96]
            L3_98 = L3_98.name
            L2_97.person = L3_98
            L2_97 = string
            L2_97 = L2_97.match
            L3_98 = _customers
            L3_98 = L3_98[L1_96]
            L3_98 = L3_98.type
            L4_99 = "wom"
            L2_97 = L2_97(L3_98, L4_99)
            if L2_97 ~= nil then
              L2_97 = _customers
              L2_97 = L2_97[L1_96]
              L2_97 = L2_97.type
              if L2_97 == "wom40" then
                L2_97 = Fn_loadNpcEventMotion
                L3_98 = _customers
                L3_98 = L3_98[L1_96]
                L3_98 = L3_98.name
                L4_99 = _ep14_mot
                L4_99 = L4_99.bag
                L2_97(L3_98, L4_99)
              else
                L2_97 = Fn_loadNpcEventMotion
                L3_98 = _customers
                L3_98 = L3_98[L1_96]
                L3_98 = L3_98.name
                L4_99 = _ep14_mot
                L4_99 = L4_99.w
                L2_97(L3_98, L4_99)
              end
            else
              L2_97 = Fn_loadNpcEventMotion
              L3_98 = _customers
              L3_98 = L3_98[L1_96]
              L3_98 = L3_98.name
              L4_99 = _ep14_mot
              L4_99 = L4_99.m
              L2_97(L3_98, L4_99)
            end
            L2_97 = companionGenerator
            L3_98 = L1_96
            L2_97(L3_98)
            if L1_96 == 1 then
              function L2_97()
                local L0_105, L1_106, L2_107
                L0_105 = nil
                L1_106 = _customers
                L1_106 = L1_106[1]
                L1_106 = L1_106.name
                L2_107 = _customers
                L2_107 = L2_107[1]
                L2_107 = L2_107.mot_tbl
                while true do
                  if _pc_join == false or _buying_ok == false or _pause or _quiz_phase > 0 and _quiz_phase < 4 then
                    if L0_105 == nil then
                      L0_105 = Fn_playLoopMotionInsert(L1_106, "stay_02", L2_107, 5, 10)
                    end
                  else
                    if L0_105 and L0_105:isRunning() then
                      L0_105:abort()
                    end
                    break
                  end
                  wait()
                end
                _buying_fin = false
                _customers[1].goal = setBuyingAI(1)
                while _buying_fin == false do
                  wait()
                end
                if _customers[1].L ~= nil then
                  while _grid[1].l_mob == _customers[1].L.name do
                    wait()
                  end
                end
                if _customers[1].R ~= nil then
                  while _grid[1].r_mob == _customers[1].R.name do
                    wait()
                  end
                end
                if _grid[1].person == _customers[1].name then
                  _grid[1].person = nil
                end
              end
              function L3_98(A0_108)
                local L1_109
                L1_109 = nil
                while true do
                  while true do
                    if _buying_ok == false or _buying_fin == false then
                      if L1_109 == nil then
                        L1_109 = Fn_playLoopMotionInsert(A0_108.name, "stay_01", A0_108.mot_tbl, 5, 10)
                      end
                    else
                      if L1_109 and L1_109:isRunning() then
                        L1_109:abort()
                      end
                      break
                    end
                    wait()
                  end
                end
                repeat
                  wait()
                until _buying_fin and _customers[1].goal
                _buying_fin = false
                if _grid[1][A0_108.grid_side] == A0_108.name then
                  print("[1]" .. tostring(_grid[1][A0_108.grid_side]) .. "\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
                  _grid[1][A0_108.grid_side] = nil
                end
                while Fn_moveNpc(A0_108.name, _customers[1].goal, A0_108.move_sta):isRunning() do
                  wait()
                end
                Fn_changeNpcToMob(A0_108.name)
              end
              L4_99 = _customers
              L4_99 = L4_99[L1_96]
              L5_100 = invokeTask
              L6_101 = L2_97
              L5_100 = L5_100(L6_101)
              L4_99.ai = L5_100
              L4_99 = print
              L5_100 = _customers
              L5_100 = L5_100[L1_96]
              L5_100 = L5_100.name
              L6_101 = "\227\129\171\229\137\141\227\129\171\233\128\178\227\130\128AI\227\130\187\227\131\131\227\131\136"
              L5_100 = L5_100 .. L6_101
              L4_99(L5_100)
              L4_99 = _customers
              L4_99 = L4_99[L1_96]
              L4_99 = L4_99.L
              if L4_99 ~= nil then
                L4_99 = invokeTask
                L5_100 = L3_98
                L6_101 = _customers
                L6_101 = L6_101[L1_96]
                L6_101 = L6_101.L
                L4_99(L5_100, L6_101)
              end
              L4_99 = _customers
              L4_99 = L4_99[L1_96]
              L4_99 = L4_99.R
              if L4_99 ~= nil then
                L4_99 = invokeTask
                L5_100 = L3_98
                L6_101 = _customers
                L6_101 = L6_101[L1_96]
                L6_101 = L6_101.R
                L4_99(L5_100, L6_101)
              end
            else
              L0_95 = L1_96 - 1
              L2_97 = _customers
              L2_97 = L2_97[L1_96]
              L3_98 = setCustomerAI
              L4_99 = L1_96
              L5_100 = L0_95
              L3_98 = L3_98(L4_99, L5_100)
              L2_97.ai = L3_98
              L2_97 = print
              L3_98 = _customers
              L3_98 = L3_98[L1_96]
              L3_98 = L3_98.name
              L4_99 = "\227\129\171\229\137\141\227\129\171\233\128\178\227\130\128AI\227\130\187\227\131\131\227\131\136"
              L3_98 = L3_98 .. L4_99
              L2_97(L3_98)
              L2_97 = _customers
              L2_97 = L2_97[L1_96]
              L2_97 = L2_97.L
              if L2_97 ~= nil then
                L2_97 = setCompanionAI
                L3_98 = _customers
                L3_98 = L3_98[L1_96]
                L3_98 = L3_98.L
                L4_99 = L1_96
                L5_100 = L0_95
                L2_97(L3_98, L4_99, L5_100)
              end
              L2_97 = _customers
              L2_97 = L2_97[L1_96]
              L2_97 = L2_97.R
              if L2_97 ~= nil then
                L2_97 = setCompanionAI
                L3_98 = _customers
                L3_98 = L3_98[L1_96]
                L3_98 = L3_98.R
                L4_99 = L1_96
                L5_100 = L0_95
                L2_97(L3_98, L4_99, L5_100)
              end
            end
          end
          L1_96 = L1_96 + 1
        end
      else
        L2_97 = _pc_join
        if L2_97 then
          L2_97 = _grid
          L3_98 = _grid
          L3_98 = #L3_98
          L2_97 = L2_97[L3_98]
          L2_97 = L2_97.person
          if L2_97 ~= nil then
            L2_97 = _cutin_pos
          elseif L2_97 ~= nil then
            L2_97 = nil
            L3_98 = _cutin_pos
            if L3_98 ~= nil then
              L2_97 = _cutin_pos
            end
            L3_98 = {
              L4_99,
              L5_100,
              L6_101,
              L7_102,
              L8_103
            }
            L4_99 = "locator2_space11a"
            L5_100 = "locator2_space11b"
            L6_101 = "locator2_space11c"
            L7_102 = "locator2_space11d"
            L8_103 = "locator2_space11e"
            L4_99 = Fn_get_shuffle_teble
            L5_100 = L3_98
            L4_99 = L4_99(L5_100)
            L3_98 = L4_99
            L4_99 = 1
            while true do
              L5_100 = #L3_98
              if L4_99 > L5_100 then
                L4_99 = 1
              end
              L5_100 = Fn_isInSightTarget
              L6_101 = L3_98[L4_99]
              L7_102 = 2
              L5_100 = L5_100(L6_101, L7_102)
              if L5_100 ~= false then
                L4_99 = L4_99 + 1
                L5_100 = wait
                L5_100()
              end
            end
            L5_100 = _customers
            L5_100 = L5_100[L1_96]
            L6_101 = L3_98[L4_99]
            L5_100.node = L6_101
            L5_100 = _customers
            L5_100 = L5_100[L1_96]
            L5_100.start = true
            L5_100 = Fn_setupNpc
            L6_101 = {L7_102}
            L7_102 = _customers
            L7_102 = L7_102[L1_96]
            L5_100(L6_101)
            L5_100 = string
            L5_100 = L5_100.match
            L6_101 = _customers
            L6_101 = L6_101[L1_96]
            L6_101 = L6_101.type
            L7_102 = "wom"
            L5_100 = L5_100(L6_101, L7_102)
            if L5_100 ~= nil then
              L5_100 = Fn_loadNpcEventMotion
              L6_101 = _customers
              L6_101 = L6_101[L1_96]
              L6_101 = L6_101.name
              L7_102 = _ep14_mot
              L7_102 = L7_102.w
              L5_100(L6_101, L7_102)
            else
              L5_100 = Fn_loadNpcEventMotion
              L6_101 = _customers
              L6_101 = L6_101[L1_96]
              L6_101 = L6_101.name
              L7_102 = _ep14_mot
              L7_102 = L7_102.m
              L5_100(L6_101, L7_102)
            end
            L5_100 = companionGenerator
            L6_101 = L1_96
            L5_100(L6_101)
            L5_100, L6_101, L7_102 = nil, nil, nil
            L8_103 = {
              L9_104,
              {
                "locator2_wait_space_l"
              },
              {
                "locator2_wait_space_r"
              }
            }
            L9_104 = {
              "locator2_wait_space"
            }
            if L2_97 ~= nil then
              L0_95 = L2_97 - 1
              L9_104 = L8_103[1]
              L9_104[1] = _grid[L2_97].pos
              L9_104 = _customers
              L9_104 = L9_104[L1_96]
              L9_104 = L9_104.move_sta
              L9_104.runLength = -1
              L9_104 = _grid
              L9_104 = L9_104[L2_97]
              L9_104.person = _customers[L1_96].name
            else
              L9_104 = _grid
              L0_95 = #L9_104
            end
            L9_104 = Fn_moveNpc
            L9_104 = L9_104(_customers[L1_96].name, L8_103[1], _customers[L1_96].move_sta)
            L5_100 = L9_104
            L9_104 = _customers
            L9_104 = L9_104[L1_96]
            L9_104 = L9_104.L
            if L9_104 ~= nil then
              if L2_97 ~= nil then
                L9_104 = L8_103[2]
                L9_104[1] = _customers[L1_96].L.loc .. string.format("%02d", L2_97)
                L9_104 = _customers
                L9_104 = L9_104[L1_96]
                L9_104 = L9_104.L
                L9_104 = L9_104.move_sta
                L9_104.runLength = -1
              end
              L9_104 = Fn_moveNpc
              L9_104 = L9_104(_customers[L1_96].L.name, L8_103[2], _customers[L1_96].L.move_sta)
              L6_101 = L9_104
            end
            L9_104 = _customers
            L9_104 = L9_104[L1_96]
            L9_104 = L9_104.R
            if L9_104 ~= nil then
              if L2_97 ~= nil then
                L9_104 = L8_103[3]
                L9_104[1] = _customers[L1_96].R.loc .. string.format("%02d", L2_97)
                L9_104 = _customers
                L9_104 = L9_104[L1_96]
                L9_104 = L9_104.R
                L9_104 = L9_104.move_sta
                L9_104.runLength = -1
              end
              L9_104 = Fn_moveNpc
              L9_104 = L9_104(_customers[L1_96].R.name, L8_103[3], _customers[L1_96].R.move_sta)
              L7_102 = L9_104
            end
            while true do
              L9_104 = L5_100.isRunning
              L9_104 = L9_104(L5_100)
              if not L9_104 then
                if L6_101 then
                  L9_104 = L6_101.isRunning
                  L9_104 = L9_104(L6_101)
                elseif not L9_104 then
                  if L7_102 then
                    L9_104 = L7_102.isRunning
                    L9_104 = L9_104(L7_102)
                  end
                end
              end
              if L9_104 then
                L9_104 = wait
                L9_104()
              end
            end
            L9_104 = findGameObject2
            L9_104 = L9_104("Node", _grid[1].pos)
            ;({})[1] = invokeTask(function()
              Fn_turnNpc(_customers[L1_96].name, L9_104)
            end)
            if _customers[L1_96].L ~= nil then
              ;({})[2] = invokeTask(function()
                Fn_turnNpc(_customers[L1_96].L.name, L9_104)
              end)
            end
            if _customers[L1_96].R ~= nil then
              ;({})[3] = invokeTask(function()
                Fn_turnNpc(_customers[L1_96].R.name, L9_104)
              end)
            end
            while ({})[1]:isRunning() or ({})[2] and ({})[2]:isRunning() or ({})[3] and ({})[3]:isRunning() do
              wait()
            end
            if _customers[L1_96].move_sta.runLength == -1 then
              _customers[L1_96].move_sta.runLength = 1000
            end
            setCustomerAI(L1_96, L0_95)
            print(_customers[L1_96].name .. "\227\129\171\229\137\141\227\129\171\233\128\178\227\130\128AI\227\130\187\227\131\131\227\131\136\227\128\128ticket_num = " .. tonumber(L0_95))
            if _customers[L1_96].L ~= nil then
              if _customers[L1_96].L.move_sta.runLength == -1 then
                _customers[L1_96].L.move_sta.runLength = 1000
              end
              setCompanionAI(_customers[L1_96].L, L1_96, L0_95)
            end
            if _customers[L1_96].R ~= nil then
              if _customers[L1_96].R.move_sta.runLength == -1 then
                _customers[L1_96].R.move_sta.runLength = 1000
              end
              setCompanionAI(_customers[L1_96].R, L1_96, L0_95)
            end
            L1_96 = L1_96 + 1
          end
        else
        end
      end
      L2_97 = wait
      L2_97()
    end
  end
end
function setCustomerAI(A0_110, A1_111)
  local L2_112
  L2_112 = 3
  return (invokeTask(function()
    local L0_113, L1_114, L2_115, L3_116, L4_117, L5_118, L6_119, L7_120
    L0_113 = nil
    L1_114 = _customers
    L1_114 = L1_114[L2_115]
    L1_114 = L1_114.mot_tbl
    if L2_115 ~= nil then
      if L2_115 == "wom40" then
        for L5_118, L6_119 in L2_115(L3_116) do
          L7_120 = table
          L7_120 = L7_120.insert
          L7_120(L1_114, 1, L6_119)
        end
      else
        for L5_118, L6_119 in L2_115(L3_116) do
          L7_120 = table
          L7_120 = L7_120.insert
          L7_120(L1_114, 1, L6_119)
        end
      end
    else
      L2_115(L3_116, L4_117, L5_118)
      L2_115(L3_116, L4_117, L5_118)
    end
    for L6_119 = A1_111, 1, -1 do
      while true do
        L7_120 = Fn_getMissionPart
        L7_120 = L7_120()
        if L7_120 == "ep14_c" then
          L7_120 = _quiz_phase
          if L7_120 ~= 0 then
            L7_120 = _quiz_phase
          elseif L7_120 == 1 then
            L7_120 = A0_110
            if L7_120 == _QUIZ_MOB_NUM then
              L7_120 = L2_112
              if L6_119 == L7_120 then
                _quiz_phase = 1
                break
              end
            end
          end
        end
        L7_120 = _grid
        L7_120 = L7_120[L6_119]
        L7_120 = L7_120.person
        if L7_120 == nil then
          L7_120 = _grid
          L7_120 = L7_120[L6_119]
          L7_120.person = L2_115
          L7_120 = Fn_getMissionPart
          L7_120 = L7_120()
          if L7_120 == "ep14_c" then
            L7_120 = A0_110
            if L7_120 ~= _QUIZ_MOB_NUM then
              L7_120 = A0_110
              if L7_120 == _QUIZ_MOB_NUM - 1 then
                L7_120 = _quiz_phase
              end
            elseif L7_120 > 1 then
              L7_120 = _grid
              L7_120 = L7_120[L6_119 + 1]
              L7_120.person = "pc"
              L7_120 = L6_119 + 2
              if L7_120 <= #_grid then
                L7_120 = _grid
                L7_120 = L7_120[L6_119 + 2]
                L7_120 = L7_120.person
                if L7_120 == "pc" then
                  L7_120 = _grid
                  L7_120 = L7_120[L6_119 + 2]
                  L7_120.person = nil
                end
              end
            end
          end
          if L6_119 > 1 then
            L7_120 = _grid
            L7_120 = L7_120[L6_119 - 1]
            L7_120 = L7_120.person
            if L7_120 ~= nil then
              L7_120 = math
              L7_120 = L7_120.random
              L7_120 = L7_120(1)
              waitSeconds(L7_120)
            end
          elseif L6_119 == 1 then
            L7_120 = waitSeconds
            L7_120(1.5)
          else
            L7_120 = Fn_getMissionPart
            L7_120 = L7_120()
            if L7_120 == "ep14_c" and L2_115 == "customer07" then
              L7_120 = waitSeconds
              L7_120(3)
            end
          end
          L7_120 = _customers
          L7_120 = L7_120[A0_110]
          L7_120 = L7_120.L
          while true do
            if L7_120 ~= nil then
              L7_120 = _grid
              L7_120 = L7_120[L6_119]
              L7_120 = L7_120.l_mob
            end
            if L7_120 ~= _customers[A0_110].L.name then
              L7_120 = wait
              L7_120()
            end
          end
          L7_120 = _customers
          L7_120 = L7_120[A0_110]
          L7_120 = L7_120.R
          while true do
            if L7_120 ~= nil then
              L7_120 = _grid
              L7_120 = L7_120[L6_119]
              L7_120 = L7_120.r_mob
            end
            if L7_120 ~= _customers[A0_110].R.name then
              L7_120 = wait
              L7_120()
            end
          end
          if L0_113 then
            L7_120 = L0_113.isRunning
            L7_120 = L7_120(L0_113)
            if L7_120 then
              L7_120 = L0_113.abort
              L7_120(L0_113)
            end
          end
          L7_120 = _customers
          L7_120 = L7_120[A0_110]
          L7_120.move = true
          L7_120 = Fn_moveNpc
          L7_120 = L7_120(L2_115, {
            _grid[L6_119].pos
          }, _customers[A0_110].move_sta)
          while L7_120:isRunning() do
            wait()
          end
          _customers[A0_110].move = false
          print("_customers[" .. A0_110 .. "].move = false")
          if L6_119 ~= #_grid then
            if _customers[A0_110].L ~= nil then
              while _grid[L6_119 + 1].l_mob ~= nil do
                wait()
              end
            end
            if _customers[A0_110].R ~= nil then
              while _grid[L6_119 + 1].r_mob ~= nil do
                wait()
              end
            end
            if _grid[L6_119 + 1].person == L2_115 then
              _grid[L6_119 + 1].person = nil
            end
          end
          if L6_119 == 1 then
            while true do
              if _pc_join == false or _buying_ok == false or _pause or _quiz_phase > 0 and _quiz_phase < 4 then
                if L0_113 == nil then
                  L0_113 = Fn_playLoopMotionInsert(L2_115, "stay_02", L1_114, 5, 10)
                end
              else
                if L0_113 and L0_113:isRunning() then
                  L0_113:abort()
                end
                break
              end
              wait()
            end
            _buying_fin = false
            _customers[A0_110].goal = setBuyingAI(A0_110)
            while _buying_fin == false do
              wait()
            end
            if _customers[A0_110].L ~= nil then
              while _grid[L6_119].l_mob == _customers[A0_110].L.name do
                wait()
              end
            end
            if _customers[A0_110].R ~= nil then
              while _grid[L6_119].r_mob == _customers[A0_110].R.name do
                wait()
              end
            end
            if _grid[L6_119].person == _customers[A0_110].name then
              _grid[L6_119].person = nil
              if Fn_getMissionPart() == "ep14_c" and A0_110 == _QUIZ_MOB_NUM - 1 then
                _grid[L6_119].person = "pc"
                _grid[L6_119 + 1].person = nil
              end
            end
            do break end
            else
              L7_120 = string
              L7_120 = L7_120.match
              L7_120 = L7_120(_customers[A0_110].type, "wom")
              if L7_120 ~= nil then
                L7_120 = _customers
                L7_120 = L7_120[A0_110]
                L7_120 = L7_120.type
                if L7_120 == "wom40" then
                  L7_120 = Fn_playLoopMotionInsert
                  L7_120 = L7_120(L2_115, "stay_02", L1_114, 5, 10)
                  L0_113 = L7_120
                else
                  L7_120 = Fn_playLoopMotionInsert
                  L7_120 = L7_120(L2_115, "stay_03", L1_114, 5, 10)
                  L0_113 = L7_120
                end
              else
                L7_120 = Fn_playLoopMotionInsert
                L7_120 = L7_120(L2_115, "stay_02", L1_114, 5, 10)
                L0_113 = L7_120
              end
              while true do
                L7_120 = _grid
                L7_120 = L7_120[L6_119]
                L7_120 = L7_120.person
                if L7_120 ~= nil then
                  L7_120 = wait
                  L7_120()
                end
              end
              L7_120 = L0_113.abort
              L7_120(L0_113)
            end
            L7_120 = wait
            L7_120()
          end
      end
    end
  end))
end
function companionGenerator(A0_121)
  local L1_122, L2_123
  L1_122 = _customers
  L1_122 = L1_122[A0_121]
  L1_122 = L1_122.name
  L2_123 = _customers
  L2_123 = L2_123[A0_121]
  L2_123 = L2_123.L
  if L2_123 ~= nil then
    L2_123 = createGameObject2
    L2_123 = L2_123("Node")
    if string.match(_customers[A0_121].L.type, "chi") == nil then
      L2_123:setPos(Vector(1, 0, 0.3))
    else
      L2_123:setPos(Vector(0.8, 0, 0.3))
    end
    Fn_findNpcPuppet(L1_122):appendChild(L2_123)
    L2_123:try_init()
    L2_123:waitForReady()
    L2_123:try_start()
    _customers[A0_121].L.node = L2_123:setName("node_l" .. A0_121)
    _customers[A0_121].L.start = true
    Fn_setupNpc({
      _customers[A0_121].L
    })
  end
  L2_123 = _customers
  L2_123 = L2_123[A0_121]
  L2_123 = L2_123.R
  if L2_123 ~= nil then
    L2_123 = createGameObject2
    L2_123 = L2_123("Node")
    if string.match(_customers[A0_121].R.type, "chi") == nil then
      L2_123:setPos(Vector(-1, 0, 0.3))
    else
      L2_123:setPos(Vector(-0.8, 0, 0.3))
    end
    Fn_findNpcPuppet(L1_122):appendChild(L2_123)
    L2_123:try_init()
    L2_123:waitForReady()
    L2_123:try_start()
    _customers[A0_121].R.node = L2_123:setName("node_r" .. A0_121)
    _customers[A0_121].R.start = true
    Fn_setupNpc({
      _customers[A0_121].R
    })
  end
end
function setCompanionAI(A0_124, A1_125, A2_126)
  invokeTask(function()
    local L0_127, L1_128, L2_129, L3_130, L4_131
    L0_127 = nil
    for L4_131 = A2_126, 1, -1 do
      while true do
        if _grid[L4_131].person == nil or _grid[L4_131].person == _customers[A1_125].name then
          _grid[L4_131][A0_124.grid_side] = A0_124.name
          repeat
            wait()
          until _customers[A1_125].move
          if L0_127 and L0_127:isRunning() then
            L0_127:abort()
            L0_127 = nil
          end
          while Fn_moveNpc(A0_124.name, {
            A0_124.loc .. string.format("%02d", L4_131)
          }, A0_124.move_sta):isRunning() do
            wait()
          end
          if L4_131 ~= #_grid and _pc_join then
            print("[" .. tonumber(L4_131 + 1) .. "]" .. tostring(_grid[L4_131 + 1][A0_124.grid_side]) .. "\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
            _grid[L4_131 + 1][A0_124.grid_side] = nil
          end
          if L4_131 > 1 and _grid[L4_131 - 1].person ~= nil then
            Fn_turnNpc(A0_124.name, A0_124.turn_opt)
          end
          while _customers[A1_125].move do
            wait()
          end
          if L4_131 == 1 then
            while true do
              while true do
                if _buying_ok == false or _buying_fin == false then
                  if L0_127 == nil then
                    L0_127 = Fn_playLoopMotionInsert(A0_124.name, "stay_01", A0_124.mot_tbl, 5, 10)
                  end
                else
                  if L0_127 and L0_127:isRunning() then
                    L0_127:abort()
                  end
                  break
                end
                wait()
              end
            end
            repeat
              wait()
            until _buying_fin and _customers[A1_125].goal
            _buying_fin = false
            if _grid[L4_131][A0_124.grid_side] == A0_124.name then
              print("[" .. L4_131 .. "]" .. tostring(_grid[L4_131][A0_124.grid_side]) .. "\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
              _grid[L4_131][A0_124.grid_side] = nil
            end
            while Fn_moveNpc(A0_124.name, _customers[A1_125].goal, A0_124.move_sta):isRunning() do
              wait()
            end
            Fn_changeNpcToMob(A0_124.name)
            do break end
            else
              L0_127 = Fn_playLoopMotionInsert(A0_124.name, "stay_02", A0_124.mot_tbl, 5, 10)
              while _grid[L4_131].person ~= nil and _grid[L4_131].person ~= _customers[A1_125].name do
                wait()
              end
              L0_127:abort()
              L0_127 = nil
              Fn_killNpcTask(A0_124.name)
            end
            wait()
          end
      end
    end
  end)
end
function setBuyingAI(A0_132)
  local L1_133, L2_134, L3_135, L4_136, L5_137
  L1_133 = _customers
  L1_133 = L1_133[A0_132]
  L1_133 = L1_133.name
  L2_134 = {
    L3_135,
    L4_136,
    L5_137
  }
  L3_135 = {L4_136, L5_137}
  L4_136 = "locator2_space00_r"
  L5_137 = "locator2_space00a"
  L4_136 = {
    L5_137,
    "locator2_space00b"
  }
  L5_137 = "locator2_space00_l"
  L5_137 = {
    "locator2_space00_l",
    "locator2_space00c"
  }
  L3_135 = math
  L3_135 = L3_135.random
  L4_136 = #L2_134
  L3_135 = L3_135(L4_136)
  L4_136 = L2_134[L3_135]
  L5_137 = {}
  if string.match(_customers[A0_132].type, "wom") ~= nil then
    L5_137 = {
      "talk_02",
      "talk_03",
      "buyer_idle_00",
      "idle_bu_00",
      "reply_yes"
    }
  else
    L5_137 = {
      _ep14_mot.m.buy01,
      _ep14_mot.m.buy02,
      "reply_yes"
    }
  end
  return L4_136
end
function sensorsAllOn()
  local L0_138, L1_139, L2_140, L3_141, L4_142
  for L3_141, L4_142 in L0_138(L1_139) do
    Fn_pcSensorOn(L4_142)
  end
end
_pc_goal = false
function get_pc_goal()
  local L0_143, L1_144
  L0_143 = _pc_goal
  return L0_143
end
_pc_cutin = false
function pcPosChecker()
  invokeTask(function()
    local L0_145, L1_146, L2_147, L3_148
    while true do
      if L0_145 == "ep14_c" then
        for L3_148, _FORV_4_ in L0_145(L1_146) do
          if _FORV_4_.person == "pc" and _pc_line_pos[L3_148] == false and _leave_fn_on == false then
            while _quiz_phase > 0 and _quiz_phase < 4 do
              wait()
            end
            leave_fn(L3_148)
          end
        end
        L0_145()
      end
    end
  end)
end
_leave_fn_on = false
_now_person = nil
function pcGetInLineOnEnter(A0_149)
  local L1_150, L2_151, L3_152
  L2_151 = A0_149
  L1_150 = A0_149.getName
  L1_150 = L1_150(L2_151)
  L2_151 = string
  L2_151 = L2_151.len
  L3_152 = L1_150
  L2_151 = L2_151(L3_152)
  L3_152 = tonumber
  L3_152 = L3_152(string.sub(L1_150, L2_151 - 1, L2_151))
  print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\175" .. L3_152 .. "\231\149\170\231\155\174\227\129\171\228\184\166\227\130\147\227\129\167\227\129\132\227\129\190\227\129\153")
  _pc_line_pos[L3_152] = true
end
function pcGetInLineOnLeave(A0_153)
  local L1_154, L2_155, L3_156
  L2_155 = A0_153
  L1_154 = A0_153.getName
  L1_154 = L1_154(L2_155)
  L2_155 = string
  L2_155 = L2_155.len
  L3_156 = L1_154
  L2_155 = L2_155(L3_156)
  L3_156 = tonumber
  L3_156 = L3_156(string.sub(L1_154, L2_155 - 1, L2_155))
  print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\175" .. tonumber(L3_156) .. "\231\149\170\231\155\174\227\129\139\227\130\137\229\164\150\227\130\140\227\129\190\227\129\151\227\129\159")
  _pc_line_pos[L3_156] = false
  if Fn_getMissionPart() == "ep14_d" and L3_156 == 1 then
    _grid[1].person = nil
  end
end
function leave_fn(A0_157)
  _leave_fn_on = true
  invokeTask(function()
    local L0_158, L1_159
    L0_158 = findGameObject2
    L1_159 = "Node"
    L0_158 = L0_158(L1_159, _grid[A0_157].pos)
    L1_159 = Fn_naviSet
    L1_159(L0_158)
    L1_159 = false
    _pause = true
    while L1_159 == false do
      if Fn_getDistanceToPlayer(L0_158) < 0.5 then
        invokeTask(function()
          waitSeconds(5)
          L1_159 = true
        end):abort()
        Fn_naviKill()
        _pause = false
        _leave_fn_on = false
        break
      end
      wait()
    end
    if L1_159 and _pause and _bra_phase ~= 4 then
      print("\229\136\151\227\129\139\227\130\137\227\129\161\227\130\135\227\129\163\227\129\168\229\164\150\227\130\140\227\129\159\227\129\168\227\129\141\227\129\174warpPcInLine")
      Fn_naviKill()
      while warpPcInLine():isRunning() do
        wait()
      end
      _leave_fn_on = false
    end
  end)
end
_pause = false
function pccubesensor2_around_shop_OnLeave()
  if _leave_fn_on == false and _pc_join then
    print("OnLeave\227\129\139\227\130\137\227\129\174warpPcInLine")
    return warpPcInLine()
  elseif _leave_fn_on == false and _bra_phase == 4 then
    _leave_fn_on = true
    print("--\226\150\160\227\129\190\227\129\160\230\156\128\229\190\140\229\176\190\227\129\171\228\184\166\227\130\147\227\129\167\227\129\132\227\129\170\227\129\143\227\129\166\227\128\129\233\155\162\227\130\140\227\129\159\227\129\168\227\129\147\227\130\141\227\129\171\227\129\132\227\130\139")
    return invokeTask(function()
      local L0_160, L1_161
      _pause = true
      while true do
        L0_160 = isBraGrabbed
        L0_160 = L0_160()
        if L0_160 then
          L0_160 = wait
          L0_160()
        end
      end
      L0_160 = findGameObject2
      L1_161 = "Node"
      L0_160 = L0_160(L1_161, _grid[#_grid].pos)
      L1_161 = Fn_naviSet
      L1_161(L0_160)
      L1_161 = false
      invokeTask(function()
        waitSeconds(5)
        L1_161 = true
      end)
      while L1_161 == false do
        if Fn_getDistanceToPlayer(L0_160) < 0.5 then
          Fn_naviKill()
          _pause = false
          break
        end
        wait()
      end
      if _pause and L1_161 then
        Fn_captionViewWait("ep14_02017", 2)
        Fn_blackout()
        Fn_naviKill()
        Fn_resetPcPos(L0_160)
        wait()
        Fn_fadein()
        _pause = false
        _leave_fn_on = false
      end
    end)
  end
end
function warpPcInLine()
  return invokeTask(function()
    local L0_162, L1_163, L2_164, L3_165, L4_166, L5_167, L6_168, L7_169, L8_170
    _pause = true
    while true do
      if L0_162 then
        L0_162()
      end
    end
    L0_162(L1_163, L2_164)
    L0_162(L1_163, L2_164)
    L0_162(L1_163)
    L0_162()
    for L3_165, L4_166 in L0_162(L1_163) do
      L5_167 = L4_166.person
      if L5_167 == "pc" then
        L5_167 = findGameObject2
        L6_168 = "Node"
        L7_169 = L4_166.pos
        L5_167 = L5_167(L6_168, L7_169)
        L6_168 = L5_167
        L5_167 = L5_167.getWorldTransform
        L6_168 = L5_167(L6_168)
        L7_169 = Fn_setPcPosRot
        L8_170 = L5_167
        L7_169(L8_170, L6_168)
        L7_169 = wait
        L7_169()
      end
    end
    L0_162()
    L0_162(L1_163, L2_164)
    _pause = false
  end)
end
function isPauseCaptionTime()
  local L0_171, L1_172
  L0_171 = _pause
  return L0_171
end
function shopMasterAI()
  return invokeTask(function()
    while true do
      if _grid[1].person == "pc" and _pc_line_pos[1] and _leave_fn_on == false then
        _pc_goal = true
        break
      end
      wait()
    end
  end)
end
function isGrabbedBrahman()
  if _bra_npc_hdl then
    return _bra_npc_hdl:isGrabbed()
  end
end
function arrivalshop(A0_173)
  _arrivalshop = A0_173
  print("com a _arrivalshop", _arrivalshop)
end
