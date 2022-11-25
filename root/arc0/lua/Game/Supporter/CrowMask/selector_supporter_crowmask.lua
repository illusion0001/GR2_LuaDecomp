import("math")
import("common")
function Supporter.CrowMask.get_parallel_params_default()
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
shoots = 0
fallkick = 0
combo = 0
takeoff = false
drillout = false
screentimer = 0
count = 0
__fatk = true
function Supporter.CrowMask.action_selector(A0_4, A1_5)
  local L2_6
  L2_6 = A0_4.supporter_brain
  print(A0_4.player_dist)
  if A0_4.default_action_id == A1_5.move_on_ground and __fatk == true then
    __fatk = false
    return A1_5.takeoff
  end
  if A0_4.player_dist < 6 and A0_4.default_action_id == A1_5.combo_on_ground and __fatk == true then
    __fatk = false
    return A1_5.takeoff
  end
  if A0_4.default_action_id == A1_5.fatal_feed then
    return A0_4.default_action_id
  end
  if A0_4.default_action_id == A1_5.groggy then
    return A0_4.default_action_id
  end
  if A0_4.player_dist > 35 then
    if A0_4.is_in_air then
      return A1_5.follow_player_in_air
    else
      return A1_5.takeoff
    end
  end
  if A0_4.is_on_screen and drillout == true then
    drillout = false
    return A0_4.default_action_id
  elseif drillout == true then
    if A0_4.is_in_air then
      if screentimer < 120 then
        screentimer = screentimer + 1
        print("screentimer = " .. screentimer)
        return A1_5.idle_in_air
      else
        drillout = false
        screentimer = 0
        return A0_4.default_action_id
      end
    elseif screentimer < 120 then
      screentimer = screentimer + 1
      print("screentimer = " .. screentimer)
      return A1_5.idle_on_ground
    else
      drillout = false
      screentimer = 0
      print("screentimer = " .. screentimer)
      return A0_4.default_action_id
    end
  end
  if A0_4.has_enemy then
    if A0_4.is_attackable_to_enemy then
      if A0_4.is_in_air then
        if A0_4.default_action_id == A1_5.fall_kick_in_air then
          drillout = true
          fallkick = fallkick + 1
          print("fallkick = " .. fallkick)
          return A1_5.fall_kick_drill
        end
        if A0_4.enemy_dist < 5 then
          if RandI(3) == 1 then
            takeoff = false
            return A1_5.backstep_in_air
          elseif RandI(3) == 2 then
            takeoff = false
            return A1_5.sidestep_in_air
          elseif RandI(3) == 3 and A0_4.is_enable_alight and takeoff == false then
            takeoff = true
            return A1_5.alight
          end
        elseif A0_4.enemy_dist > 20 then
          if 1 < shoots then
            if RandI(2) == 1 then
              shoots = 0
              print("shoots = " .. shoots)
              fallkick = fallkick + 1
              print("fallkick = " .. fallkick)
              drillout = true
              return A1_5.fall_kick_drill
            else
              return A1_5.follow_player_in_air
            end
          elseif A0_4.enemy_dist < 5 then
            if RandI(3) == 1 then
              takeoff = false
              return A1_5.backstep_in_air
            elseif RandI(3) == 2 then
              takeoff = false
              return A1_5.sidestep_in_air
            elseif RandI(3) == 3 and A0_4.is_enable_alight and takeoff == false then
              takeoff = true
              return A1_5.alight
            end
          elseif RandI(8) == 1 then
            if A0_4.has_space_to_spawn_gravity_bullet then
              shoots = shoots + 1
              print("shoots = " .. shoots)
              count = L2_6:getGravityBulletCount()
              print("count = " .. count)
              return A1_5.shoot_gravity
            end
          else
            count = L2_6:getGravityBulletCount()
            print("count = " .. count)
            if oount == 0 then
              if A0_4.has_space_to_spawn_bgobj_bullet then
                shoots = shoots + 1
                print("shoots = " .. shoots)
                return A1_5.shoot_bgobj
              end
            elseif A0_4.has_space_to_spawn_gravity_bullet then
              shoots = shoots + 1
              print("shoots = " .. shoots)
              count = L2_6:getGravityBulletCount()
              print("count = " .. count)
              return A1_5.shoot_gravity
            end
          end
        elseif A0_4.enemy_dist > 15 then
          if 1 < shoots then
            shoots = 0
            print("shoots = " .. shoots)
            fallkick = fallkick + 1
            print("fallkick = " .. fallkick)
            drillout = true
            return A1_5.fall_kick_drill
          elseif A0_4.enemy_dist < 5 then
            if RandI(3) == 1 then
              takeoff = false
              return A1_5.backstep_in_air
            elseif RandI(3) == 2 then
              takeoff = false
              return A1_5.sidestep_in_air
            elseif RandI(3) == 3 and A0_4.is_enable_alight and takeoff == false then
              takeoff = true
              return A1_5.alight
            end
          elseif 1 < RandI(8) then
            if A0_4.has_space_to_spawn_bgobj_bullet then
              count = L2_6:getGravityBulletCount()
              print("count = " .. count)
              if count == 0 then
                shoots = shoots + 1
                print("shoots = " .. shoots)
                return A1_5.shoot_bgobj
              elseif A0_4.has_space_to_spawn_gravity_bullet then
                shoots = shoots + 1
                print("shoots = " .. shoots)
                count = L2_6:getGravityBulletCount()
                print("count = " .. count)
                return A1_5.shoot_gravity
              end
            end
          elseif A0_4.has_space_to_spawn_gravity_bullet then
            shoots = shoots + 1
            print("shoots = " .. shoots)
            count = L2_6:getGravityBulletCount()
            print("count = " .. count)
            return A1_5.shoot_gravity
          end
        elseif 6 < A0_4.enemy_dist then
          if 1 < fallkick then
            if A0_4.enemy_dist < 5 then
              if RandI(3) == 1 then
                takeoff = false
                return A1_5.backstep_in_air
              elseif RandI(3) == 2 then
                takeoff = false
                return A1_5.sidestep_in_air
              elseif RandI(3) == 3 and A0_4.is_enable_alight and takeoff == false then
                takeoff = true
                return A1_5.alight
              end
            else
              fallkick = 0
              print("fallkick = " .. fallkick)
              if 1 < RandI(8) then
                if A0_4.has_space_to_spawn_bgobj_bullet then
                  count = L2_6:getGravityBulletCount()
                  print("count = " .. count)
                  if count == 0 then
                    shoots = shoots + 1
                    print("shoots = " .. shoots)
                    return A1_5.shoot_bgobj
                  elseif A0_4.has_space_to_spawn_gravity_bullet then
                    shoots = shoots + 1
                    print("shoots = " .. shoots)
                    count = L2_6:getGravityBulletCount()
                    print("count = " .. count)
                    return A1_5.shoot_gravity
                  end
                end
              elseif A0_4.has_space_to_spawn_gravity_bullet then
                shoots = shoots + 1
                print("shoots = " .. shoots)
                count = L2_6:getGravityBulletCount()
                print("count = " .. count)
                return A1_5.shoot_gravity
              end
            end
          else
            fallkick = fallkick + 1
            print("fallkick = " .. fallkick)
            drillout = true
            return A1_5.fall_kick_drill
          end
        elseif RandI(5) > 2 then
          if A0_4.enemy_dist < 5 then
            if 1 < RandI(2) then
              return A1_5.backstep_in_air
            else
              return A1_5.sidestep_in_air
            end
          end
          if fallkick > 2 then
            if 1 < RandI(8) then
              if A0_4.has_space_to_spawn_bgobj_bullet then
                count = L2_6:getGravityBulletCount()
                print("count = " .. count)
                if count == 0 then
                  fallkick = 0
                  print("fallkick = " .. fallkick)
                  shoots = shoots + 1
                  print("shoots = " .. shoots)
                  return A1_5.shoot_bgobj
                elseif A0_4.has_space_to_spawn_gravity_bullet then
                  fallkick = 0
                  print("fallkick = " .. fallkick)
                  shoots = shoots + 1
                  print("shoots = " .. shoots)
                  count = L2_6:getGravityBulletCount()
                  print("count = " .. count)
                  return A1_5.shoot_gravity
                end
              end
            elseif A0_4.has_space_to_spawn_gravity_bullet then
              fallkick = 0
              print("fallkick = " .. fallkick)
              shoots = shoots + 1
              print("shoots = " .. shoots)
              count = L2_6:getGravityBulletCount()
              print("count = " .. count)
              return A1_5.shoot_gravity
            end
          else
            fallkick = fallkick + 1
            print("fallkick = " .. fallkick)
            drillout = true
            return A1_5.fall_kick_drill
          end
        else
          if A0_4.enemy_dist < 5 then
            if 1 < RandI(2) then
              return A1_5.backstep_in_air
            else
              return A1_5.sidestep_in_air
            end
          elseif 2 < shoots then
            shoots = 0
            print("shoots = " .. shoots)
            fallkick = fallkick + 1
            print("fallkick = " .. fallkick)
            drillout = true
            print(drillout)
            return A1_5.fall_kick_drill
          elseif 1 < RandI(8) then
            if A0_4.has_space_to_spawn_bgobj_bullet then
              count = L2_6:getGravityBulletCount()
              print("count = " .. count)
              if count == 0 then
                shoots = shoots + 1
                print("shoots = " .. shoots)
                return A1_5.shoot_bgobj
              elseif A0_4.has_space_to_spawn_gravity_bullet then
                shoots = shoots + 1
                print("shoots = " .. shoots)
                count = L2_6:getGravityBulletCount()
                print("count = " .. count)
                return A1_5.shoot_gravity
              end
            end
          elseif A0_4.has_space_to_spawn_gravity_bullet then
            shoots = shoots + 1
            print("shoots = " .. shoots)
            count = L2_6:getGravityBulletCount()
            print("count = " .. count)
            return A1_5.shoot_gravity
          end
          if A0_4.is_enable_alight and takeoff == false then
            takeoff = true
            return A1_5.alight
          end
        end
      elseif A0_4.is_enemy_overhead then
        return A1_5.takeoff
      elseif A0_4.enemy_dist > 10 then
        return A1_5.takeoff
      elseif A0_4.enemy_dist > 2 then
        return A1_5.move_on_ground
      elseif RandI(5) > 4 then
        return A1_5.takeoff
      elseif 2 < combo then
        combo = 0
        print("combo = " .. combo)
        if RandI(3) == 1 then
          return A1_5.takeoff
        elseif RandI(3) == 2 then
          return A1_5.avoid_on_ground
        elseif RandI(3) == 3 then
          return A1_5.backstep_to_attack_on_ground
        elseif RandI(3) == 0 then
          return A1_5.move_around_on_ground
        end
      else
        combo = combo + 1
        print("combo = " .. combo)
        return A1_5.combo_on_ground
      end
    elseif A0_4.is_in_air then
      if RandI(3) == 0 then
        if 1 < RandI(8) then
          if A0_4.has_space_to_spawn_bgobj_bullet then
            count = L2_6:getGravityBulletCount()
            if count == 0 then
              shoots = shoots + 1
              print("shoots = " .. shoots)
              return A1_5.shoot_bgobj
            elseif A0_4.has_space_to_spawn_gravity_bullet then
              count = L2_6:getGravityBulletCount()
              print("count = " .. count)
              shoots = shoots + 1
              print("shoots = " .. shoots)
              return A1_5.shoot_gravity
            end
          end
        elseif A0_4.has_space_to_spawn_gravity_bullet then
          count = L2_6:getGravityBulletCount()
          print("count = " .. count)
          shoots = shoots + 1
          print("shoots = " .. shoots)
          return A1_5.shoot_gravity
        end
      else
        return A1_5.follow_player_in_air
      end
    else
      return A1_5.takeoff
    end
  end
  print("\228\189\149\227\130\130\230\157\161\228\187\182\227\129\171\227\129\178\227\129\163\227\129\139\227\129\139\227\130\137\227\129\170\227\129\139\227\129\163\227\129\159")
  return A0_4.default_action_id
end
function Supporter.CrowMask.assist_selector(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12
  L3_10 = A0_7.supporter_brain
  if L3_10 ~= nil then
    L4_11 = A0_7.default_action_id
    L5_12 = A1_8.parallel_fall_kick_nrml
    if L4_11 == L5_12 then
      L4_11 = Supporter
      L4_11 = L4_11.get_parallel_params_default
      L4_11 = L4_11()
      L5_12 = L3_10.setParams_parallel
      L5_12(L3_10, L4_11)
    else
      L4_11 = A0_7.default_action_id
      L5_12 = A1_8.parallel_fall_kick_mars
      if L4_11 == L5_12 then
        L4_11 = Supporter
        L4_11 = L4_11.get_parallel_params_default
        L4_11 = L4_11()
        L5_12 = A0_7.mars
        if L5_12 ~= nil then
          L5_12 = A0_7.mars
          L5_12 = L5_12.last_type
          if A0_7.mars.hit_count == 1 then
            if L5_12 == 2 then
            elseif L5_12 == 3 then
            elseif L5_12 == 4 then
            elseif RandI(3) == 1 then
            elseif RandI(3) == 2 then
            elseif RandI(3) == 3 then
            else
            end
          end
          L4_11.fall_kick.mars.type = 2
        end
        L5_12 = L3_10.setParams_parallel
        L5_12(L3_10, L4_11)
      else
        L4_11 = A0_7.default_action_id
        L5_12 = A1_8.parallel_fall_kick_jupt
        if L4_11 == L5_12 then
          L4_11 = Supporter
          L4_11 = L4_11.get_parallel_params_default
          L4_11 = L4_11()
          L5_12 = L3_10.setParams_parallel
          L5_12(L3_10, L4_11)
          L5_12 = print
          L5_12(A0_7.default_action_id)
        else
          L4_11 = A0_7.default_action_id
          L5_12 = A1_8.parallel_fall_kick_addition
          if L4_11 == L5_12 then
            L4_11 = Supporter
            L4_11 = L4_11.get_parallel_params_default
            L4_11 = L4_11()
            L5_12 = L3_10.setParams_parallel
            L5_12(L3_10, L4_11)
          end
        end
      end
    end
  end
  L4_11 = A0_7.default_action_id
  return L4_11
end
function Supporter.CrowMask.reaction_selector(A0_13, A1_14)
  local L2_15
  L2_15 = 0
  if A0_13.is_attacked_avoid_body then
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_13.current_action_id == A1_14.shoot_bgobj then
      if L2_15 == 0 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\144\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_14.damage
      elseif L2_15 == 1 then
        if RandI(2) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\145\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 2 then
        if RandI(4) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\146\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 3 then
        if RandI(7) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\147\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 > 3 then
        if RandI(8) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\148\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      end
    elseif A0_13.current_action_id == A1_14.shoot_gravity then
      if L2_15 == 0 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\144\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_14.damage
      elseif L2_15 == 1 then
        if RandI(3) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\145\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 2 then
        if RandI(5) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\146\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 3 then
        if RandI(6) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\147\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 > 3 then
        if RandI(8) == 1 then
          print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\148\231\148\168")
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
          return A1_14.damage
        elseif RandI(7) == 1 then
          print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      end
    elseif A0_13.current_action_id == A1_14.combo_on_ground then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_14.damage
    elseif A0_13.current_action_id == A1_14.fall_kick_drill then
      L2_15 = 0
      print("damage = " .. L2_15)
      print("\227\131\137\227\131\170\227\131\171\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_14.avoid_in_air
    end
    if L2_15 == 0 then
      print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\144\231\148\168")
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_14.damage
    elseif L2_15 == 1 then
      if RandI(2) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\145\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_14.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      end
    elseif L2_15 == 2 then
      if RandI(4) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\146\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_14.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      end
    elseif L2_15 == 3 then
      if RandI(6) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\147\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_14.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      end
    elseif L2_15 > 3 then
      if RandI(8) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\148\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_14.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      end
    end
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
    return A1_14.damage
  else
    print("\230\156\172\228\189\147\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_13.current_action_id == A1_14.shoot_bgobj then
      if L2_15 == 0 then
        if RandI(9) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\144")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 1 or L2_15 == 2 then
        if RandI(6) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\145")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 3 or L2_15 == 4 then
        if RandI(3) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\146")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 > 4 then
        L2_15 = 0
        print("damage = " .. L2_15)
        print("\229\174\140\229\133\168\229\155\158\233\129\191")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      else
        L2_15 = L2_15 + 1
        print("damage = " .. L2_15)
        print("\227\131\128\227\131\161\227\131\188\227\130\184\239\188\129")
        return A1_14.damage
      end
    elseif A0_13.current_action_id == A1_14.shoot_gravity then
      if L2_15 == 0 then
        if RandI(9) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\144")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 1 or L2_15 == 2 then
        if RandI(6) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\145")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 3 or L2_15 == 4 then
        if RandI(3) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\146")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 > 4 then
        L2_15 = 0
        print("damage = " .. L2_15)
        print("\229\174\140\229\133\168\229\155\158\233\129\191")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      else
        L2_15 = L2_15 + 1
        print("damage = " .. L2_15)
        print("\227\131\128\227\131\161\227\131\188\227\130\184\239\188\129")
        return A1_14.damage
      end
    elseif A0_13.current_action_id == A1_14.combo_on_ground then
      L2_15 = L2_15 + 1
      print("damage = " .. L2_15)
      print("\229\156\176\228\184\138\227\130\179\227\131\179\227\131\156\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_14.damage
    elseif A0_13.current_action_id == A1_14.fall_kick_drill then
      L2_15 = 0
      print("damage = " .. L2_15)
      print("\227\131\137\227\131\170\227\131\171\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_14.avoid_in_air
    elseif A0_13.default_action_id == A1_14.avoid_in_air then
      if RandI(6) == 1 then
        L2_15 = L2_15 + 1
        print("damage = " .. L2_15)
        print("\229\155\158\233\129\191\227\129\171\227\129\175\230\136\144\229\138\159\227\129\151\227\129\159\227\129\140\227\128\129\231\162\186\231\142\135\227\129\167\227\131\128\227\131\161\227\131\188\227\130\184\227\129\171\226\128\166")
        return A1_14.damage
      else
        L2_15 = 0
        print("damage = " .. L2_15)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_14.avoid_in_air
      end
    elseif A0_13.default_action_id == A1_14.avoid_on_ground then
      if RandI(6) == 1 then
        L2_15 = L2_15 + 1
        print("damage = " .. L2_15)
        print("\229\155\158\233\129\191\227\129\171\227\129\175\230\136\144\229\138\159\227\129\151\227\129\159\227\129\140\227\128\129\231\162\186\231\142\135\227\129\167\227\131\128\227\131\161\227\131\188\227\130\184\227\129\171\226\128\166")
        return A1_14.damage
      else
        L2_15 = 0
        print("damage = " .. L2_15)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_14.avoid_on_ground
      end
    elseif A0_13.default_action_id == A1_14.damage then
      if RandI(5) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\227\130\146\229\143\151\227\129\145\227\129\159\227\129\140\231\162\186\231\142\135\227\129\167\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      elseif L2_15 == 0 then
        if RandI(9) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\144")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 1 or L2_15 == 2 then
        if RandI(6) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\145")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 == 3 or L2_15 == 4 then
        if RandI(3) == 1 then
          L2_15 = 0
          print("damage = " .. L2_15)
          print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\146")
          if A0_13.is_in_air then
            return A1_14.avoid_in_air
          else
            return A1_14.avoid_on_ground
          end
        end
      elseif L2_15 > 4 then
        L2_15 = 0
        print("damage = " .. L2_15)
        print("\229\174\140\229\133\168\229\155\158\233\129\191")
        if A0_13.is_in_air then
          return A1_14.avoid_in_air
        else
          return A1_14.avoid_on_ground
        end
      else
        L2_15 = L2_15 + 1
        print("damage = " .. L2_15)
        print("\227\131\128\227\131\161\227\131\188\227\130\184\239\188\129")
        return A1_14.damage
      end
    end
  end
  return A0_13.default_action_id
end
