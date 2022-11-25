import("math")
import("common")
function Supporter.Crow.get_parallel_params_default()
  local L1_0, L2_1, L3_2, L4_3
  L1_0 = {}
  L2_1 = {}
  L3_2 = {}
  L3_2.type = 2
  L2_1.mars = L3_2
  L3_2 = {}
  L3_2.type = 1
  L2_1.jupt = L3_2
  L3_2 = {}
  L3_2.type = 1
  L2_1.nrml = L3_2
  L3_2 = {}
  L3_2.type = 1
  L4_3 = {}
  L4_3.atk_combo = {duration = 2, delay = 0}
  L4_3.grav_kick_nrml = {duration = 2, delay = 0.2}
  L4_3.avoid_atk_jupt = {duration = 2, delay = 0.2}
  L3_2.disable_state_info = L4_3
  L2_1.addition = L3_2
  L1_0.fall_kick = L2_1
  return L1_0
end
function _select_garuda_action(A0_4, A1_5)
  local L2_6, L3_7, L4_8
  L2_6 = A1_5.garuda_atk_combo
  L3_7 = {L4_8}
  L4_8 = A1_5.garuda_atk_combo
  L4_8 = #L3_7
  L2_6 = L3_7[RandI(L4_8)]
  if A0_4.supporter_brain:getGravityBulletCount() > 0 then
    L2_6 = A1_5.garuda_atk_shoot
  end
  return L2_6
end
__fatk = true
function Supporter.Crow._action_selector(A0_9, A1_10)
  if A0_9.default_action_id == A1_10.move_on_ground and __fatk == true then
    __fatk = false
    return A1_10.takeoff
  end
  if A0_9.player_dist < 6 and A0_9.default_action_id == A1_10.combo_on_ground and __fatk == true then
    __fatk = false
    return A1_10.takeoff
  end
  if A0_9.default_action_id == A1_10.groggy then
    return A0_9.default_action_id
  end
  if A0_9.player_dist > A0_9.distance_to_start_following then
    if A0_9.is_in_air then
      return A1_10.follow_player_in_air
    else
      return A1_10.takeoff
    end
  end
  if A0_9.is_in_air then
    if A0_9.has_enemy then
      if A0_9.is_attackable_to_enemy then
        if A0_9.enemy_dist < 5 then
          if RandI(3) == 1 then
            return A1_10.backstep_in_air
          else
            return A1_10.sidestep_in_air
          end
        elseif A0_9.enemy_dist > 35 then
          if RandI(2) == 1 then
            return A1_10.shoot_bgobj
          else
            return A1_10.shoot_gravity
          end
        elseif A0_9.enemy_dist < 10 then
          return A1_10.fall_kick_drill
        elseif RandI(5) > 2 then
          return A1_10.fall_kick_drill
        elseif RandI(2) == 1 then
          return A1_10.shoot_bgobj
        else
          return A1_10.shoot_gravity
        end
      elseif RandI(3) == 0 then
        if RandI(2) == 1 then
          return A1_10.shoot_bgobj
        else
          return A1_10.shoot_gravity
        end
      elseif RandI(3) == 1 then
        return A1_10.move_around_in_air
      else
        return A1_10.sidestep_in_air
      end
    elseif A0_9.player_dist > 10 then
      return A1_10.follow_player_in_air
    end
  else
    if A0_9.default_action_id == A1_10.move_around_on_ground then
      return A1_10.move_around_on_ground
    end
    if A0_9.default_action_id == A1_10.takeoff then
      return A1_10.takeoff
    end
    if A0_9.has_enemy then
      if A0_9.is_attackable_to_enemy then
        if A0_9.has_assist_event then
          return A1_10.takeoff
        elseif A0_9.is_enemy_overhead then
          return A1_10.takeoff
        elseif A0_9.enemy_dist > 2 then
          return A1_10.move_on_ground
        elseif RandI(2) == 1 then
          return A1_10.combo_on_ground
        else
          return A1_10.back_step_to_attack_on_ground
        end
      elseif A0_9.has_navimesh_to_enemy then
        return A1_10.move_on_ground
      else
        return A1_10.takeoff
      end
    elseif A0_9.player_dist > 10 then
      return A1_10.follow_player_on_ground
    end
  end
  return A0_9.default_action_id
end
function Supporter.Crow.action_selector(A0_11, A1_12)
  local L2_13
  L2_13 = Supporter
  L2_13 = L2_13.Crow
  L2_13 = L2_13._action_selector
  L2_13 = L2_13(A0_11, A1_12)
  if A0_11.supporter_brain:isTransformedWithServant() and (L2_13 == A1_12.fall_kick_in_air or L2_13 == A1_12.fall_kick_drill or L2_13 == A1_12.shoot_gravity or L2_13 == A1_12.shoot_bgobj) then
    L2_13 = _select_garuda_action(A0_11, A1_12)
  end
  return L2_13
end
function Supporter.Crow.assist_selector(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19
  L3_17 = A0_14.supporter_brain
  if L3_17 ~= nil then
    L4_18 = A0_14.default_action_id
    L5_19 = A1_15.parallel_fall_kick_nrml
    if L4_18 == L5_19 then
      L4_18 = Supporter
      L4_18 = L4_18.Crow
      L4_18 = L4_18.get_parallel_params_default
      L4_18 = L4_18()
      L5_19 = L3_17.setParams_parallel
      L5_19(L3_17, L4_18)
    else
      L4_18 = A0_14.default_action_id
      L5_19 = A1_15.parallel_fall_kick_mars
      if L4_18 == L5_19 then
        L4_18 = Supporter
        L4_18 = L4_18.Crow
        L4_18 = L4_18.get_parallel_params_default
        L4_18 = L4_18()
        L5_19 = A0_14.mars
        if L5_19 ~= nil then
          L5_19 = A0_14.mars
          L5_19 = L5_19.last_type
          if A0_14.mars.hit_count == 1 then
            if L5_19 == 2 then
            elseif L5_19 == 3 then
            elseif L5_19 == 4 then
            elseif RandI(3) == 1 then
            elseif RandI(3) == 2 then
            elseif RandI(3) == 3 then
            else
            end
          end
          L4_18.fall_kick.mars.type = 2
        end
        L5_19 = L3_17.setParams_parallel
        L5_19(L3_17, L4_18)
      else
        L4_18 = A0_14.default_action_id
        L5_19 = A1_15.parallel_fall_kick_jupt
        if L4_18 == L5_19 then
          L4_18 = Supporter
          L4_18 = L4_18.Crow
          L4_18 = L4_18.get_parallel_params_default
          L4_18 = L4_18()
          L5_19 = L3_17.setParams_parallel
          L5_19(L3_17, L4_18)
          L5_19 = print
          L5_19(A0_14.default_action_id)
        else
          L4_18 = A0_14.default_action_id
          L5_19 = A1_15.parallel_fall_kick_addition
          if L4_18 == L5_19 then
            L4_18 = Supporter
            L4_18 = L4_18.Crow
            L4_18 = L4_18.get_parallel_params_default
            L4_18 = L4_18()
            L5_19 = L3_17.setParams_parallel
            L5_19(L3_17, L4_18)
          end
        end
      end
    end
  end
  L4_18 = A0_14.default_action_id
  return L4_18
end
function Supporter.Crow.reaction_selector(A0_20, A1_21)
  local L2_22, L3_23
  L2_22 = A0_20.default_action_id
  L3_23 = A1_21.avoid_in_air
  if L2_22 == L3_23 then
    L2_22 = A1_21.reject_action_id
    return L2_22
  else
    L2_22 = A0_20.default_action_id
    L3_23 = A1_21.avoid_on_ground
    if L2_22 == L3_23 then
      L2_22 = A1_21.reject_action_id
      return L2_22
    else
      L2_22 = A0_20.default_action_id
      L3_23 = A1_21.damage
      if L2_22 == L3_23 then
        L2_22 = false
        if L2_22 then
          L3_23 = A0_20.is_in_air
          if L3_23 then
            L3_23 = A1_21.avoid_in_air
            return L3_23
          else
            L3_23 = A1_21.avoid_on_ground
            return L3_23
          end
        else
          L3_23 = A1_21.damage
          return L3_23
        end
      end
    end
  end
  L2_22 = A0_20.default_action_id
  return L2_22
end
function Supporter.CrowWithAnge.reaction_selector(A0_24, A1_25)
  do return A1_25.damage end
  if A0_24.default_action_id == A1_25.avoid_in_air then
    return A1_25.reject_action_id
  elseif A0_24.default_action_id == A1_25.avoid_on_ground then
    return A1_25.reject_action_id
  elseif A0_24.default_action_id == A1_25.damage then
  end
  if RandI(10) == 1 then
    if A0_24.is_in_air then
      return A1_25.avoid_in_air
    else
      return A1_25.avoid_on_ground
    end
  else
    return A1_25.damage
  end
  return A0_24.default_action_id
end
