import("math")
import("common")
shoots = 0
fallkick = 0
combo = 0
damage = 0
takeoff = false
drillout = false
screentimer = 0
count = 0
__fatk1 = true
__fatk2 = true
__fatk3 = true
function _select_feline_action(A0_0, A1_1)
  local L2_2, L3_3, L4_4
  L2_2 = A1_1.garuda_atk_combo
  L3_3 = {L4_4}
  L4_4 = A1_1.garuda_atk_combo
  L4_4 = #L3_3
  L2_2 = L3_3[RandI(L4_4)]
  if A0_0.supporter_brain:getGravityBulletCount() > 0 then
    L2_2 = A1_1.garuda_atk_shoot
  end
  return L2_2
end
function Supporter.Kitten.action_selector(A0_5, A1_6)
  local L2_7
  L2_7 = Supporter
  L2_7 = L2_7.Kitten
  L2_7 = L2_7._action_selector
  L2_7 = L2_7(A0_5, A1_6)
  if A0_5.supporter_brain:isTransformedWithServant() and (L2_7 == A1_6.fall_kick_in_air or L2_7 == A1_6.fall_kick_drill or L2_7 == A1_6.shoot_shot or L2_7 == A1_6.shoot_debri) then
    L2_7 = _select_feline_action(A0_5, A1_6)
  end
  return L2_7
end
function Supporter.Kitten.action_selector2(A0_8, A1_9)
  local L2_10
  L2_10 = Supporter
  L2_10 = L2_10.Kitten
  L2_10 = L2_10._action_selector2
  L2_10 = L2_10(A0_8, A1_9)
  if A0_8.supporter_brain:isTransformedWithServant() and (L2_10 == A1_9.fall_kick_in_air or L2_10 == A1_9.fall_kick_drill or L2_10 == A1_9.shoot_shot or L2_10 == A1_9.shoot_debri) then
    L2_10 = _select_feline_action(A0_8, A1_9)
  end
  return L2_10
end
function Supporter.Kitten.action_selector3(A0_11, A1_12)
  local L2_13
  L2_13 = Supporter
  L2_13 = L2_13.Kitten
  L2_13 = L2_13._action_selector3
  L2_13 = L2_13(A0_11, A1_12)
  if A0_11.supporter_brain:isTransformedWithServant() and (L2_13 == A1_12.fall_kick_in_air or L2_13 == A1_12.fall_kick_drill or L2_13 == A1_12.shoot_shot or L2_13 == A1_12.shoot_debri) then
    L2_13 = _select_feline_action(A0_11, A1_12)
  end
  return L2_13
end
function Supporter.Kitten._action_selector(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19
  L2_16 = A0_14.supporter_brain
  L3_17 = print
  L4_18 = A0_14.player_dist
  L3_17(L4_18)
  L3_17 = A0_14.default_action_id
  L4_18 = A1_15.shoot_gravity
  if L3_17 ~= L4_18 then
    L3_17 = A0_14.default_action_id
    L4_18 = A1_15.shoot_bgobj
  elseif L3_17 == L4_18 then
    L3_17 = RandI
    L4_18 = 2
    L3_17 = L3_17(L4_18)
    if L3_17 == 1 then
      L3_17 = A1_15.shoot_shot
      A0_14.default_action_id = L3_17
    else
      L3_17 = A1_15.shoot_debri
      A0_14.default_action_id = L3_17
    end
  end
  L4_18 = L2_16
  L3_17 = L2_16.getBgobjShotBulletCount
  L3_17 = L3_17(L4_18)
  L4_18 = A0_14.is_in_air
  if L4_18 and L3_17 > 0 then
    L4_18 = shoots
    L4_18 = L4_18 + 1
    shoots = L4_18
    L4_18 = print
    L5_19 = "shoots = "
    L5_19 = L5_19 .. shoots
    L4_18(L5_19)
    L4_18 = A1_15.shoot_shot
    return L4_18
  end
  L4_18 = A0_14.default_action_id
  L5_19 = A1_15.shoot_debri
  if L4_18 == L5_19 and L3_17 > 0 then
    L4_18 = shoots
    L4_18 = L4_18 + 1
    shoots = L4_18
    L4_18 = print
    L5_19 = "shoots = "
    L5_19 = L5_19 .. shoots
    L4_18(L5_19)
    L4_18 = A1_15.shoot_shot
    return L4_18
  end
  L4_18 = A0_14.default_action_id
  L5_19 = A1_15.move_on_ground
  if L4_18 == L5_19 then
    L4_18 = __fatk1
    if L4_18 == true then
      __fatk1 = false
      L4_18 = A1_15.takeoff
      return L4_18
    end
  end
  L4_18 = A0_14.player_dist
  if L4_18 < 6 then
    L4_18 = A0_14.default_action_id
    L5_19 = A1_15.combo_on_ground
    if L4_18 == L5_19 then
      L4_18 = __fatk1
      if L4_18 == true then
        __fatk1 = false
        L4_18 = A1_15.takeoff
        return L4_18
      end
    end
  end
  L4_18 = A0_14.player_dist
  if L4_18 < 6 then
    L4_18 = A0_14.default_action_id
    L5_19 = A1_15.garuda_atk_combo
    if L4_18 == L5_19 then
      L4_18 = __fatk1
      if L4_18 == true then
        __fatk1 = false
        L4_18 = A1_15.takeoff
        return L4_18
      end
    end
  end
  L4_18 = A0_14.default_action_id
  L5_19 = A1_15.fatal_feed
  if L4_18 == L5_19 then
    L4_18 = A0_14.default_action_id
    return L4_18
  end
  L4_18 = A0_14.default_action_id
  L5_19 = A1_15.groggy
  if L4_18 == L5_19 then
    L4_18 = A0_14.default_action_id
    return L4_18
  end
  L4_18 = A0_14.player_dist
  if L4_18 > 50 then
    L4_18 = Player
    L5_19 = L4_18
    L4_18 = L4_18.getPuppet
    L4_18 = L4_18(L5_19)
    L5_19 = L4_18
    L4_18 = L4_18.getWorldPos
    L4_18 = L4_18(L5_19)
    L5_19 = {}
    L5_19.pos = L4_18 + Vector(0, 5.5, 0)
    L2_16:setWarpParams(L5_19)
    return A1_15.warp
  end
  L4_18 = A0_14.player_dist
  if L4_18 > 25 then
    L4_18 = A0_14.is_in_air
    if L4_18 then
      L4_18 = A1_15.follow_player_in_air
      return L4_18
    else
      L4_18 = A1_15.takeoff
      return L4_18
    end
  end
  L4_18 = A0_14.has_enemy
  if L4_18 then
    L4_18 = A0_14.is_attackable_to_enemy
    if L4_18 then
      L4_18 = A0_14.is_in_air
      if L4_18 then
        L4_18 = A0_14.default_action_id
        L5_19 = A1_15.fall_kick_in_air
        if L4_18 == L5_19 then
          drillout = true
          L4_18 = A1_15.fall_kick_in_air
          return L4_18
        end
        L4_18 = A0_14.enemy_dist
        if L4_18 < 5 then
          L4_18 = RandI
          L5_19 = 3
          L4_18 = L4_18(L5_19)
          if L4_18 == 1 then
            takeoff = 0
            L5_19 = A1_15.backstep_in_air
            return L5_19
          elseif L4_18 == 2 then
            takeoff = 0
            L5_19 = A1_15.sidestep_in_air
            return L5_19
          elseif L4_18 == 3 then
            L5_19 = A0_14.is_enable_alight
            if L5_19 then
              L5_19 = takeoff
              if L5_19 == false then
                takeoff = true
                L5_19 = A1_15.alight
                return L5_19
              end
            end
          end
        else
          L4_18 = A0_14.enemy_dist
          if L4_18 > 20 then
            L4_18 = shoots
            if L4_18 > 1 then
              L4_18 = RandI
              L5_19 = 2
              L4_18 = L4_18(L5_19)
              if L4_18 == 1 then
                shoots = 0
                L4_18 = print
                L5_19 = "shoots = "
                L5_19 = L5_19 .. shoots
                L4_18(L5_19)
                L4_18 = fallkick
                L4_18 = L4_18 + 1
                fallkick = L4_18
                L4_18 = print
                L5_19 = "fallkick = "
                L5_19 = L5_19 .. fallkick
                L4_18(L5_19)
                drillout = true
                L4_18 = A1_15.fall_kick_in_air
                return L4_18
              else
                L4_18 = A1_15.follow_player_in_air
                return L4_18
              end
            else
              L4_18 = A0_14.enemy_dist
              if L4_18 < 5 then
                L4_18 = RandI
                L5_19 = 3
                L4_18 = L4_18(L5_19)
                if L4_18 == 1 then
                  takeoff = false
                  L5_19 = A1_15.backstep_in_air
                  return L5_19
                elseif L4_18 == 2 then
                  takeoff = false
                  L5_19 = A1_15.sidestep_in_air
                  return L5_19
                elseif L4_18 == 3 then
                  L5_19 = A0_14.is_enable_alight
                  if L5_19 then
                    L5_19 = takeoff
                    if L5_19 == false then
                      takeoff = true
                      L5_19 = A1_15.alight
                      return L5_19
                    end
                  end
                end
              else
                L4_18 = RandI
                L5_19 = 2
                L4_18 = L4_18(L5_19)
                if L4_18 == 1 then
                  L4_18 = A0_14.has_space_to_spawn_gravity_bullet
                  if L4_18 then
                    L4_18 = shoots
                    L4_18 = L4_18 + 1
                    shoots = L4_18
                    L4_18 = print
                    L5_19 = "shoots = "
                    L5_19 = L5_19 .. shoots
                    L4_18(L5_19)
                    L4_18 = A1_15.shoot_shot
                    return L4_18
                  end
                else
                  L4_18 = A0_14.has_space_to_spawn_bgobj_bullet
                  if L4_18 then
                    L4_18 = shoots
                    L4_18 = L4_18 + 1
                    shoots = L4_18
                    L4_18 = print
                    L5_19 = "shoots = "
                    L5_19 = L5_19 .. shoots
                    L4_18(L5_19)
                    L4_18 = A1_15.shoot_debri
                    return L4_18
                  end
                end
              end
            end
          else
            L4_18 = A0_14.enemy_dist
            if L4_18 > 15 then
              L4_18 = shoots
              if L4_18 > 1 then
                shoots = 0
                L4_18 = print
                L5_19 = "shoots = "
                L5_19 = L5_19 .. shoots
                L4_18(L5_19)
                L4_18 = fallkick
                L4_18 = L4_18 + 1
                fallkick = L4_18
                L4_18 = print
                L5_19 = "fallkick = "
                L5_19 = L5_19 .. fallkick
                L4_18(L5_19)
                drillout = true
                L4_18 = A1_15.fall_kick_in_air
                return L4_18
              else
                L4_18 = A0_14.enemy_dist
                if L4_18 < 5 then
                  L4_18 = RandI
                  L5_19 = 3
                  L4_18 = L4_18(L5_19)
                  if L4_18 == 1 then
                    takeoff = false
                    L5_19 = A1_15.backstep_in_air
                    return L5_19
                  elseif L4_18 == 2 then
                    takeoff = false
                    L5_19 = A1_15.sidestep_in_air
                    return L5_19
                  elseif L4_18 == 3 then
                    L5_19 = A0_14.is_enable_alight
                    if L5_19 then
                      L5_19 = takeoff
                      if L5_19 == false then
                        takeoff = true
                        L5_19 = A1_15.alight
                        return L5_19
                      end
                    end
                  end
                else
                  L4_18 = RandI
                  L5_19 = 2
                  L4_18 = L4_18(L5_19)
                  if L4_18 == 1 then
                    L4_18 = A0_14.has_space_to_spawn_bgobj_bullet
                    if L4_18 then
                      L4_18 = shoots
                      L4_18 = L4_18 + 1
                      shoots = L4_18
                      L4_18 = print
                      L5_19 = "shoots = "
                      L5_19 = L5_19 .. shoots
                      L4_18(L5_19)
                      L4_18 = A1_15.shoot_debri
                      return L4_18
                    end
                  else
                    L4_18 = A0_14.has_space_to_spawn_gravity_bullet
                    if L4_18 then
                      L4_18 = shoots
                      L4_18 = L4_18 + 1
                      shoots = L4_18
                      L4_18 = print
                      L5_19 = "shoots = "
                      L5_19 = L5_19 .. shoots
                      L4_18(L5_19)
                      L4_18 = A1_15.shoot_shot
                      return L4_18
                    end
                  end
                end
              end
            else
              L4_18 = A0_14.enemy_dist
              if L4_18 > 6 then
                L4_18 = fallkick
                if L4_18 > 0 then
                  fallkick = 0
                  L4_18 = print
                  L5_19 = "fallkick = "
                  L5_19 = L5_19 .. fallkick
                  L4_18(L5_19)
                  L4_18 = A0_14.enemy_dist
                  if L4_18 < 5 then
                    L4_18 = RandI
                    L5_19 = 3
                    L4_18 = L4_18(L5_19)
                    if L4_18 == 1 then
                      takeoff = false
                      L5_19 = A1_15.backstep_in_air
                      return L5_19
                    elseif L4_18 == 2 then
                      takeoff = false
                      L5_19 = A1_15.sidestep_in_air
                      return L5_19
                    elseif L4_18 == 3 then
                      L5_19 = A0_14.is_enable_alight
                      if L5_19 then
                        L5_19 = takeoff
                        if L5_19 == false then
                          takeoff = true
                          L5_19 = A1_15.alight
                          return L5_19
                        end
                      end
                    end
                  else
                    L4_18 = RandI
                    L5_19 = 2
                    L4_18 = L4_18(L5_19)
                    if L4_18 == 1 then
                      L4_18 = A0_14.has_space_to_spawn_bgobj_bullet
                      if L4_18 then
                        L4_18 = shoots
                        L4_18 = L4_18 + 1
                        shoots = L4_18
                        L4_18 = print
                        L5_19 = "shoots = "
                        L5_19 = L5_19 .. shoots
                        L4_18(L5_19)
                        L4_18 = A1_15.shoot_debri
                        return L4_18
                      end
                    else
                      L4_18 = A0_14.has_space_to_spawn_gravity_bullet
                      if L4_18 then
                        L4_18 = shoots
                        L4_18 = L4_18 + 1
                        shoots = L4_18
                        L4_18 = print
                        L5_19 = "shoots = "
                        L5_19 = L5_19 .. shoots
                        L4_18(L5_19)
                        L4_18 = A1_15.shoot_shot
                        return L4_18
                      end
                    end
                  end
                else
                  L4_18 = fallkick
                  L4_18 = L4_18 + 1
                  fallkick = L4_18
                  L4_18 = print
                  L5_19 = "fallkick = "
                  L5_19 = L5_19 .. fallkick
                  L4_18(L5_19)
                  drillout = true
                  L4_18 = A1_15.fall_kick_in_air
                  return L4_18
                end
              else
                L4_18 = RandI
                L5_19 = 5
                L4_18 = L4_18(L5_19)
                if L4_18 > 2 then
                  L4_18 = A0_14.enemy_dist
                  if L4_18 < 5 then
                    L4_18 = RandI
                    L5_19 = 2
                    L4_18 = L4_18(L5_19)
                    if L4_18 > 1 then
                      L4_18 = A1_15.backstep_in_air
                      return L4_18
                    else
                      L4_18 = A1_15.sidestep_in_air
                      return L4_18
                    end
                  end
                  L4_18 = fallkick
                  if L4_18 > 0 then
                    L4_18 = RandI
                    L5_19 = 2
                    L4_18 = L4_18(L5_19)
                    if L4_18 == 1 then
                      L4_18 = A0_14.has_space_to_spawn_bgobj_bullet
                      if L4_18 then
                        fallkick = 0
                        L4_18 = print
                        L5_19 = "fallkick = "
                        L5_19 = L5_19 .. fallkick
                        L4_18(L5_19)
                        L4_18 = shoots
                        L4_18 = L4_18 + 1
                        shoots = L4_18
                        L4_18 = print
                        L5_19 = "shoots = "
                        L5_19 = L5_19 .. shoots
                        L4_18(L5_19)
                        L4_18 = A1_15.shoot_debri
                        return L4_18
                      end
                    else
                      L4_18 = A0_14.has_space_to_spawn_gravity_bullet
                      if L4_18 then
                        fallkick = 0
                        L4_18 = print
                        L5_19 = "fallkick = "
                        L5_19 = L5_19 .. fallkick
                        L4_18(L5_19)
                        L4_18 = shoots
                        L4_18 = L4_18 + 1
                        shoots = L4_18
                        L4_18 = print
                        L5_19 = "shoots = "
                        L5_19 = L5_19 .. shoots
                        L4_18(L5_19)
                        L4_18 = A1_15.shoot_shot
                        return L4_18
                      end
                    end
                  else
                    L4_18 = fallkick
                    L4_18 = L4_18 + 1
                    fallkick = L4_18
                    L4_18 = print
                    L5_19 = "fallkick = "
                    L5_19 = L5_19 .. fallkick
                    L4_18(L5_19)
                    drillout = true
                    L4_18 = A1_15.fall_kick_in_air
                    return L4_18
                  end
                else
                  L4_18 = A0_14.enemy_dist
                  if L4_18 < 5 then
                    L4_18 = RandI
                    L5_19 = 2
                    L4_18 = L4_18(L5_19)
                    if L4_18 > 1 then
                      L4_18 = A1_15.backstep_in_air
                      return L4_18
                    else
                      L4_18 = A1_15.sidestep_in_air
                      return L4_18
                    end
                  else
                    L4_18 = shoots
                    if L4_18 > 1 then
                      shoots = 0
                      L4_18 = print
                      L5_19 = "shoots = "
                      L5_19 = L5_19 .. shoots
                      L4_18(L5_19)
                      L4_18 = fallkick
                      L4_18 = L4_18 + 1
                      fallkick = L4_18
                      L4_18 = print
                      L5_19 = "fallkick = "
                      L5_19 = L5_19 .. fallkick
                      L4_18(L5_19)
                      drillout = true
                      L4_18 = print
                      L5_19 = drillout
                      L4_18(L5_19)
                      L4_18 = A1_15.fall_kick_in_air
                      return L4_18
                    else
                      L4_18 = RandI
                      L5_19 = 2
                      L4_18 = L4_18(L5_19)
                      if L4_18 == 1 then
                        L4_18 = A0_14.has_space_to_spawn_bgobj_bullet
                        if L4_18 then
                          L4_18 = shoots
                          L4_18 = L4_18 + 1
                          shoots = L4_18
                          L4_18 = print
                          L5_19 = "shoots = "
                          L5_19 = L5_19 .. shoots
                          L4_18(L5_19)
                          L4_18 = A1_15.shoot_debri
                          return L4_18
                        end
                      else
                        L4_18 = A0_14.has_space_to_spawn_gravity_bullet
                        if L4_18 then
                          L4_18 = shoots
                          L4_18 = L4_18 + 1
                          shoots = L4_18
                          L4_18 = print
                          L5_19 = "shoots = "
                          L5_19 = L5_19 .. shoots
                          L4_18(L5_19)
                          L4_18 = A1_15.shoot_shot
                          return L4_18
                        end
                      end
                    end
                  end
                  L4_18 = A0_14.is_enable_alight
                  if L4_18 then
                    L4_18 = takeoff
                    if L4_18 == false then
                      takeoff = true
                      L4_18 = A1_15.alight
                      return L4_18
                    end
                  end
                end
              end
            end
          end
        end
      else
        L4_18 = A0_14.is_enemy_overhead
        if L4_18 then
          L4_18 = A1_15.takeoff
          return L4_18
        else
          L4_18 = A0_14.enemy_dist
          if L4_18 > 10 then
            L4_18 = A1_15.takeoff
            return L4_18
          else
            L4_18 = A1_15.takeoff
            return L4_18
          end
        end
      end
    else
      L4_18 = A0_14.is_in_air
      if L4_18 then
        L4_18 = RandI
        L5_19 = 3
        L4_18 = L4_18(L5_19)
        if L4_18 == 0 then
          L4_18 = RandI
          L5_19 = 2
          L4_18 = L4_18(L5_19)
          if L4_18 == 1 then
            L4_18 = A0_14.has_space_to_spawn_bgobj_bullet
            if L4_18 then
              L4_18 = A1_15.shoot_debri
              return L4_18
            end
          else
            L4_18 = A0_14.has_space_to_spawn_gravity_bullet
            if L4_18 then
              L4_18 = A1_15.shoot_shot
              return L4_18
            end
          end
        else
          L4_18 = A1_15.follow_player_in_air
          return L4_18
        end
      else
        L4_18 = A1_15.takeoff
        return L4_18
      end
    end
  end
  L4_18 = print
  L5_19 = "\228\189\149\227\130\130\230\157\161\228\187\182\227\129\171\227\129\178\227\129\163\227\129\139\227\129\139\227\130\137\227\129\170\227\129\139\227\129\163\227\129\159"
  L4_18(L5_19)
  L4_18 = A0_14.default_action_id
  return L4_18
end
function Supporter.Kitten.reaction_selector(A0_20, A1_21)
  if A0_20.is_attacked_avoid_body then
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_20.current_action_id == A1_21.shoot_debri then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.shoot_gravity then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.combo_on_ground then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.garuda_atk_combo then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.fall_kick_in_air then
      damage = 0
      print("damage = " .. damage)
      print("\227\131\137\227\131\170\227\131\171\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_21.avoid_in_air
    end
    if damage == 0 then
      print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\144\231\148\168")
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_21.damage
    elseif damage == 1 then
      if RandI(2) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\145\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_21.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        damage = 0
        if A0_20.is_in_air then
          return A1_21.avoid_in_air
        else
          return A1_21.avoid_on_ground
        end
      end
    elseif damage == 2 then
      if RandI(4) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\146\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_21.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        damage = 0
        if A0_20.is_in_air then
          return A1_21.avoid_in_air
        else
          return A1_21.avoid_on_ground
        end
      end
    elseif damage == 3 then
      if RandI(6) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\147\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_21.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        damage = 0
        if A0_20.is_in_air then
          return A1_21.avoid_in_air
        else
          return A1_21.avoid_on_ground
        end
      end
    elseif damage > 3 then
      if RandI(8) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\229\128\164\239\188\148\231\148\168")
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
        return A1_21.damage
      elseif RandI(7) == 1 then
        print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
        damage = 0
        if A0_20.is_in_air then
          return A1_21.avoid_in_air
        else
          return A1_21.avoid_on_ground
        end
      end
    end
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
    return A1_21.damage
  else
    print("\230\156\172\228\189\147\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_20.current_action_id == A1_21.shoot_debri then
      damage = damage + 1
      print("damage = " .. damage)
      print("\233\129\160\232\183\157\233\155\162\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.shoot_gravity then
      damage = damage + 1
      print("damage = " .. damage)
      print("\233\129\160\232\183\157\233\155\162\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.combo_on_ground then
      damage = damage + 1
      print("damage = " .. damage)
      print("\229\156\176\228\184\138\227\130\179\227\131\179\227\131\156\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_21.damage
    elseif A0_20.current_action_id == A1_21.fall_kick_in_air then
      damage = 0
      print("damage = " .. damage)
      print("\227\131\137\227\131\170\227\131\171\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_21.avoid_in_air
    elseif A0_20.default_action_id == A1_21.avoid_in_air then
      if RandI(6) == 1 then
        damage = damage + 1
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\227\129\175\230\136\144\229\138\159\227\129\151\227\129\159\227\129\140\227\128\129\231\162\186\231\142\135\227\129\167\227\131\128\227\131\161\227\131\188\227\130\184\227\129\171\226\128\166")
        return A1_21.damage
      else
        damage = 0
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_21.avoid_in_air
      end
    elseif A0_20.default_action_id == A1_21.avoid_on_ground then
      if RandI(6) == 1 then
        damage = damage + 1
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\227\129\175\230\136\144\229\138\159\227\129\151\227\129\159\227\129\140\227\128\129\231\162\186\231\142\135\227\129\167\227\131\128\227\131\161\227\131\188\227\130\184\227\129\171\226\128\166")
        return A1_21.damage
      else
        damage = 0
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_21.avoid_on_ground
      end
    elseif A0_20.default_action_id == A1_21.damage then
      if RandI(5) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\227\130\146\229\143\151\227\129\145\227\129\159\227\129\140\231\162\186\231\142\135\227\129\167\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        if A0_20.is_in_air then
          return A1_21.avoid_in_air
        else
          return A1_21.avoid_on_ground
        end
      else
        damage = damage + 1
        print("damage = " .. damage)
        if damage == 0 then
          if RandI(9) == 1 then
            damage = 0
            print("damage = " .. damage)
            print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\144")
            if A0_20.is_in_air then
              return A1_21.avoid_in_air
            else
              return A1_21.avoid_on_ground
            end
          end
        elseif damage == 1 or damage == 2 then
          if RandI(6) == 1 then
            damage = 0
            print("damage = " .. damage)
            print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\145")
            if A0_20.is_in_air then
              return A1_21.avoid_in_air
            else
              return A1_21.avoid_on_ground
            end
          end
        elseif damage == 3 or damage == 4 then
          if RandI(3) == 1 then
            damage = 0
            print("damage = " .. damage)
            print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\146")
            if A0_20.is_in_air then
              return A1_21.avoid_in_air
            else
              return A1_21.avoid_on_ground
            end
          end
        elseif damage > 4 then
          damage = 0
          print("damage = " .. damage)
          print("\229\174\140\229\133\168\229\155\158\233\129\191")
          if A0_20.is_in_air then
            return A1_21.avoid_in_air
          else
            return A1_21.avoid_on_ground
          end
        else
          print("\227\131\128\227\131\161\227\131\188\227\130\184\239\188\129")
          return A1_21.damage
        end
      end
    end
  end
  return A0_20.default_action_id
end
function Supporter.Kitten._action_selector2(A0_22, A1_23)
  local L2_24, L3_25, L4_26, L5_27
  L2_24 = A0_22.supporter_brain
  L3_25 = print
  L4_26 = A0_22.player_dist
  L3_25(L4_26)
  L3_25 = A0_22.default_action_id
  L4_26 = A1_23.shoot_gravity
  if L3_25 ~= L4_26 then
    L3_25 = A0_22.default_action_id
    L4_26 = A1_23.shoot_bgobj
    if L3_25 ~= L4_26 then
      L3_25 = A0_22.default_action_id
      L4_26 = A1_23.shoot_debri
    end
  elseif L3_25 == L4_26 then
    L3_25 = A1_23.shoot_shot
    A0_22.default_action_id = L3_25
  end
  L3_25 = A0_22.default_action_id
  L4_26 = A1_23.combo_on_ground
  if L3_25 ~= L4_26 then
    L3_25 = A0_22.default_action_id
    L4_26 = A1_23.move_on_ground
  elseif L3_25 == L4_26 then
    L3_25 = A1_23.takeoff
    A0_22.default_action_id = L3_25
  end
  L4_26 = L2_24
  L3_25 = L2_24.getBgobjShotBulletCount
  L3_25 = L3_25(L4_26)
  L4_26 = A0_22.is_in_air
  if L4_26 and L3_25 > 0 then
    L4_26 = A1_23.shoot_shot
    return L4_26
  end
  L4_26 = A0_22.default_action_id
  L5_27 = A1_23.move_on_ground
  if L4_26 == L5_27 then
    L4_26 = __fatk2
    if L4_26 == true then
      __fatk2 = false
      L4_26 = A1_23.takeoff
      return L4_26
    end
  end
  L4_26 = A0_22.player_dist
  if L4_26 < 6 then
    L4_26 = A0_22.default_action_id
    L5_27 = A1_23.combo_on_ground
    if L4_26 == L5_27 then
      L4_26 = __fatk2
      if L4_26 == true then
        __fatk2 = false
        L4_26 = A1_23.takeoff
        return L4_26
      end
    end
  end
  L4_26 = A0_22.default_action_id
  L5_27 = A1_23.fatal_feed
  if L4_26 == L5_27 then
    L4_26 = A0_22.default_action_id
    return L4_26
  end
  L4_26 = A0_22.default_action_id
  L5_27 = A1_23.groggy
  if L4_26 == L5_27 then
    L4_26 = A0_22.default_action_id
    return L4_26
  end
  L4_26 = A0_22.player_dist
  if L4_26 > 50 then
    L4_26 = Player
    L5_27 = L4_26
    L4_26 = L4_26.getPuppet
    L4_26 = L4_26(L5_27)
    L5_27 = L4_26
    L4_26 = L4_26.getWorldPos
    L4_26 = L4_26(L5_27)
    L5_27 = {}
    L5_27.pos = L4_26 + Vector(0, 5.5, 0)
    L2_24:setWarpParams(L5_27)
    return A1_23.warp
  end
  L4_26 = A0_22.player_dist
  if L4_26 > 25 then
    L4_26 = A0_22.is_in_air
    if L4_26 then
      L4_26 = A1_23.follow_player_in_air
      return L4_26
    else
      L4_26 = A1_23.takeoff
      return L4_26
    end
  end
  L4_26 = A0_22.is_on_screen
  if L4_26 then
    L4_26 = drillout
    if L4_26 == true then
      drillout = false
      L4_26 = A0_22.default_action_id
      return L4_26
    end
  else
    L4_26 = drillout
    if L4_26 == true then
      L4_26 = A0_22.is_in_air
      if L4_26 then
        L4_26 = screentimer
        if L4_26 < 60 then
          L4_26 = screentimer
          L4_26 = L4_26 + 1
          screentimer = L4_26
          L4_26 = print
          L5_27 = "screentimer = "
          L5_27 = L5_27 .. screentimer
          L4_26(L5_27)
          L4_26 = A1_23.idle_in_air
          return L4_26
        else
          drillout = false
          screentimer = 0
          L4_26 = A0_22.default_action_id
          return L4_26
        end
      else
        L4_26 = screentimer
        if L4_26 < 60 then
          L4_26 = screentimer
          L4_26 = L4_26 + 1
          screentimer = L4_26
          L4_26 = print
          L5_27 = "screentimer = "
          L5_27 = L5_27 .. screentimer
          L4_26(L5_27)
          L4_26 = A1_23.idle_on_ground
          return L4_26
        else
          drillout = false
          screentimer = 0
          L4_26 = print
          L5_27 = "screentimer = "
          L5_27 = L5_27 .. screentimer
          L4_26(L5_27)
          L4_26 = A0_22.default_action_id
          return L4_26
        end
      end
    end
  end
  L4_26 = A0_22.has_enemy
  if L4_26 then
    L4_26 = A0_22.is_attackable_to_enemy
    if L4_26 then
      L4_26 = A0_22.is_in_air
      if L4_26 then
        L4_26 = A0_22.default_action_id
        L5_27 = A1_23.fall_kick_in_air
        if L4_26 == L5_27 then
          drillout = true
          L4_26 = A1_23.fall_kick_in_air
          return L4_26
        end
        L4_26 = A0_22.enemy_dist
        if L4_26 < 5 then
          L4_26 = RandI
          L5_27 = 3
          L4_26 = L4_26(L5_27)
          if L4_26 == 1 then
            takeoff = 0
            L5_27 = A1_23.backstep_in_air
            return L5_27
          elseif L4_26 == 2 then
            takeoff = 0
            L5_27 = A1_23.sidestep_in_air
            return L5_27
          elseif L4_26 == 3 then
            L5_27 = A1_23.follow_player_in_air
            return L5_27
          end
        else
          L4_26 = A0_22.enemy_dist
          if L4_26 > 15 then
            L4_26 = shoots
            if L4_26 > 7 then
              L4_26 = RandI
              L5_27 = 2
              L4_26 = L4_26(L5_27)
              if L4_26 == 1 then
                shoots = 0
                L4_26 = print
                L5_27 = "shoots = "
                L5_27 = L5_27 .. shoots
                L4_26(L5_27)
                L4_26 = fallkick
                L4_26 = L4_26 + 1
                fallkick = L4_26
                L4_26 = print
                L5_27 = "fallkick = "
                L5_27 = L5_27 .. fallkick
                L4_26(L5_27)
                drillout = true
                L4_26 = A1_23.fall_kick_in_air
                return L4_26
              else
                L4_26 = A1_23.follow_player_in_air
                return L4_26
              end
            else
              L4_26 = A0_22.enemy_dist
              if L4_26 < 5 then
                L4_26 = RandI
                L5_27 = 3
                L4_26 = L4_26(L5_27)
                if L4_26 == 1 then
                  takeoff = false
                  L5_27 = A1_23.backstep_in_air
                  return L5_27
                elseif L4_26 == 2 then
                  takeoff = false
                  L5_27 = A1_23.sidestep_in_air
                  return L5_27
                elseif L4_26 == 3 then
                  L5_27 = A1_23.follow_player_in_air
                  return L5_27
                end
              else
                L4_26 = RandI
                L5_27 = 8
                L4_26 = L4_26(L5_27)
                if L4_26 > 6 then
                  L4_26 = A0_22.has_space_to_spawn_gravity_bullet
                  if L4_26 then
                    L4_26 = shoots
                    L4_26 = L4_26 + 1
                    shoots = L4_26
                    L4_26 = print
                    L5_27 = "shoots = "
                    L5_27 = L5_27 .. shoots
                    L4_26(L5_27)
                    L4_26 = A1_23.shoot_shot
                    return L4_26
                  end
                else
                  L4_26 = A1_23.sidestep_in_air
                  return L4_26
                end
              end
            end
          else
            L4_26 = A0_22.enemy_dist
            if L4_26 < 10 then
              L4_26 = fallkick
              if L4_26 > 0 then
                fallkick = 0
                L4_26 = print
                L5_27 = "fallkick = "
                L5_27 = L5_27 .. fallkick
                L4_26(L5_27)
                L4_26 = A0_22.enemy_dist
                if L4_26 < 5 then
                  L4_26 = RandI
                  L5_27 = 3
                  L4_26 = L4_26(L5_27)
                  if L4_26 == 1 then
                    takeoff = false
                    L5_27 = A1_23.backstep_in_air
                    return L5_27
                  elseif L4_26 == 2 then
                    takeoff = false
                    L5_27 = A1_23.sidestep_in_air
                    return L5_27
                  elseif L4_26 == 3 then
                    L5_27 = A1_23.follow_player_in_air
                    return L5_27
                  end
                else
                  L4_26 = RandI
                  L5_27 = 8
                  L4_26 = L4_26(L5_27)
                  if L4_26 > 6 then
                    L4_26 = A0_22.has_space_to_spawn_gravity_bullet
                    if L4_26 then
                      L4_26 = shoots
                      L4_26 = L4_26 + 1
                      shoots = L4_26
                      L4_26 = print
                      L5_27 = "shoots = "
                      L5_27 = L5_27 .. shoots
                      L4_26(L5_27)
                      L4_26 = A1_23.shoot_shot
                      return L4_26
                    end
                  else
                    L4_26 = A1_23.sidestep_in_air
                    return L4_26
                  end
                end
              else
                L4_26 = fallkick
                L4_26 = L4_26 + 1
                fallkick = L4_26
                L4_26 = print
                L5_27 = "fallkick = "
                L5_27 = L5_27 .. fallkick
                L4_26(L5_27)
                drillout = true
                L4_26 = A1_23.fall_kick_in_air
                return L4_26
              end
            else
              L4_26 = RandI
              L5_27 = 5
              L4_26 = L4_26(L5_27)
              if L4_26 > 2 then
                L4_26 = A0_22.enemy_dist
                if L4_26 < 5 then
                  L4_26 = RandI
                  L5_27 = 2
                  L4_26 = L4_26(L5_27)
                  if L4_26 > 1 then
                    L4_26 = A1_23.backstep_in_air
                    return L4_26
                  else
                    L4_26 = A1_23.sidestep_in_air
                    return L4_26
                  end
                end
                L4_26 = fallkick
                if L4_26 > 0 then
                  L4_26 = A0_22.has_space_to_spawn_gravity_bullet
                  if L4_26 then
                    fallkick = 0
                    L4_26 = print
                    L5_27 = "fallkick = "
                    L5_27 = L5_27 .. fallkick
                    L4_26(L5_27)
                    L4_26 = shoots
                    L4_26 = L4_26 + 1
                    shoots = L4_26
                    L4_26 = print
                    L5_27 = "shoots = "
                    L5_27 = L5_27 .. shoots
                    L4_26(L5_27)
                    L4_26 = A1_23.shoot_shot
                    return L4_26
                  end
                else
                  L4_26 = fallkick
                  L4_26 = L4_26 + 1
                  fallkick = L4_26
                  L4_26 = print
                  L5_27 = "fallkick = "
                  L5_27 = L5_27 .. fallkick
                  L4_26(L5_27)
                  drillout = true
                  L4_26 = A1_23.fall_kick_in_air
                  return L4_26
                end
              else
                L4_26 = A0_22.enemy_dist
                if L4_26 < 5 then
                  L4_26 = RandI
                  L5_27 = 2
                  L4_26 = L4_26(L5_27)
                  if L4_26 > 1 then
                    L4_26 = A1_23.backstep_in_air
                    return L4_26
                  else
                    L4_26 = A1_23.sidestep_in_air
                    return L4_26
                  end
                else
                  L4_26 = shoots
                  if L4_26 > 7 then
                    shoots = 0
                    L4_26 = print
                    L5_27 = "shoots = "
                    L5_27 = L5_27 .. shoots
                    L4_26(L5_27)
                    L4_26 = fallkick
                    L4_26 = L4_26 + 1
                    fallkick = L4_26
                    L4_26 = print
                    L5_27 = "fallkick = "
                    L5_27 = L5_27 .. fallkick
                    L4_26(L5_27)
                    drillout = true
                    L4_26 = print
                    L5_27 = drillout
                    L4_26(L5_27)
                    L4_26 = A1_23.fall_kick_in_air
                    return L4_26
                  else
                    L4_26 = RandI
                    L5_27 = 8
                    L4_26 = L4_26(L5_27)
                    if L4_26 > 6 then
                      L4_26 = A0_22.has_space_to_spawn_gravity_bullet
                      if L4_26 then
                        L4_26 = shoots
                        L4_26 = L4_26 + 1
                        shoots = L4_26
                        L4_26 = print
                        L5_27 = "shoots = "
                        L5_27 = L5_27 .. shoots
                        L4_26(L5_27)
                        L4_26 = A1_23.shoot_shot
                        return L4_26
                      end
                    else
                      L4_26 = A1_23.sidestep_in_air
                      return L4_26
                    end
                  end
                end
              end
            end
          end
        end
      else
        L4_26 = A1_23.takeoff
        return L4_26
      end
    else
      L4_26 = A0_22.is_in_air
      if L4_26 then
        L4_26 = RandI
        L5_27 = 3
        L4_26 = L4_26(L5_27)
        if L4_26 == 0 then
          L4_26 = A0_22.has_space_to_spawn_gravity_bullet
          if L4_26 then
            L4_26 = A1_23.shoot_shot
            return L4_26
          end
        else
          L4_26 = A1_23.follow_player_in_air
          return L4_26
        end
      else
        L4_26 = A1_23.takeoff
        return L4_26
      end
    end
  end
  L4_26 = print
  L5_27 = "\228\189\149\227\130\130\230\157\161\228\187\182\227\129\171\227\129\178\227\129\163\227\129\139\227\129\139\227\130\137\227\129\170\227\129\139\227\129\163\227\129\159"
  L4_26(L5_27)
  L4_26 = A1_23.follow_player_in_air
  return L4_26
end
function Supporter.Kitten.reaction_selector2(A0_28, A1_29)
  if A0_28.is_attacked_avoid_body then
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_28.current_action_id == A1_29.shoot_debri or A0_28.current_action_id == A1_29.shoot_shot or A0_28.current_action_id == A1_29.combo_on_ground then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_29.damage
    elseif A0_28.current_action_id == A1_29.fall_kick_in_air then
      damage = 0
      print("damage = " .. damage)
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
      return A1_29.avoid_in_air
    end
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
    return A1_29.avoid_in_air
  else
    print("\230\156\172\228\189\147\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_28.default_action_id == A1_29.damage then
      if damage == 1 then
        if RandI(8) == 1 then
          damage = 0
          print("damage = " .. damage)
          print("\229\155\158\233\129\191\230\174\181\233\154\142Lv1\227\129\167\229\155\158\233\129\191\239\188\129")
          if A0_28.is_in_air then
            return A1_29.avoid_in_air
          else
            return A1_29.avoid_on_ground
          end
        end
      elseif damage == 2 then
        if RandI(6) == 1 then
          damage = 0
          print("damage = " .. damage)
          print("\229\155\158\233\129\191\230\174\181\233\154\142Lv2\227\129\167\229\155\158\233\129\191\239\188\129")
          if A0_28.is_in_air then
            return A1_29.avoid_in_air
          else
            return A1_29.avoid_on_ground
          end
        end
      elseif damage == 3 then
        if RandI(5) == 1 then
          damage = 0
          print("damage = " .. damage)
          print("\229\155\158\233\129\191\230\174\181\233\154\142Lv3\227\129\167\229\155\158\233\129\191\239\188\129")
          if A0_28.is_in_air then
            return A1_29.avoid_in_air
          else
            return A1_29.avoid_on_ground
          end
        end
      elseif damage == 4 then
        if RandI(4) == 1 then
          damage = 0
          print("damage = " .. damage)
          print("\229\155\158\233\129\191\230\174\181\233\154\142Lv4\227\129\167\229\155\158\233\129\191\239\188\129")
          if A0_28.is_in_air then
            return A1_29.avoid_in_air
          else
            return A1_29.avoid_on_ground
          end
        end
      elseif damage == 5 then
        if RandI(3) == 1 then
          damage = 0
          print("damage = " .. damage)
          print("\229\155\158\233\129\191\230\174\181\233\154\142Lv5\227\129\167\229\155\158\233\129\191\239\188\129")
          if A0_28.is_in_air then
            return A1_29.avoid_in_air
          else
            return A1_29.avoid_on_ground
          end
        end
      elseif damage == 6 then
        if RandI(2) == 1 then
          damage = 0
          print("damage = " .. damage)
          print("\229\155\158\233\129\191\230\174\181\233\154\142Lv6\227\129\167\229\155\158\233\129\191\239\188\129")
          if A0_28.is_in_air then
            return A1_29.avoid_in_air
          else
            return A1_29.avoid_on_ground
          end
        end
      elseif damage > 6 then
        damage = 0
        print("damage = " .. damage)
        print("\229\174\140\229\133\168\229\155\158\233\129\191")
        if A0_28.is_in_air then
          return A1_29.avoid_in_air
        else
          return A1_29.avoid_on_ground
        end
      else
        damage = damage + 1
        print("damage = " .. damage)
        print("\227\131\128\227\131\161\227\131\188\227\130\184\239\188\129")
        return A1_29.damage
      end
    end
    if A0_28.current_action_id == A1_29.shoot_debri or A0_28.current_action_id == A1_29.combo_on_ground then
      damage = damage + 1
      print("damage = " .. damage)
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_29.damage
    end
    if A0_28.current_action_id == A1_29.shoot_shot then
      if RandI(20) == 1 then
        damage = 0
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_29.avoid_in_air
      else
        damage = damage + 1
        print("damage = " .. damage)
        print("\227\131\128\227\131\161\227\131\188\227\130\184\239\188\129")
        return A1_29.damage
      end
    end
    if A0_28.current_action_id == A1_29.fall_kick_in_air then
      damage = 0
      print("damage = " .. damage)
      print("\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_29.avoid_in_air
    end
  end
end
function Supporter.Kitten._action_selector3(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35
  L2_32 = A0_30.supporter_brain
  L4_34 = L2_32
  L3_33 = L2_32.enableBgobjShotBullet
  L5_35 = false
  L3_33(L4_34, L5_35)
  L3_33 = print
  L4_34 = A0_30.player_dist
  L3_33(L4_34)
  L3_33 = A0_30.default_action_id
  L4_34 = A1_31.shoot_gravity
  if L3_33 ~= L4_34 then
    L3_33 = A0_30.default_action_id
    L4_34 = A1_31.shoot_bgobj
    if L3_33 ~= L4_34 then
      L3_33 = A0_30.default_action_id
      L4_34 = A1_31.shoot_shot
    end
  elseif L3_33 == L4_34 then
    L3_33 = A1_31.shoot_debri
    A0_30.default_action_id = L3_33
    L3_33 = A1_31.shoot_debri
    return L3_33
  end
  L4_34 = L2_32
  L3_33 = L2_32.getBgobjShotBulletCount
  L3_33 = L3_33(L4_34)
  L4_34 = A0_30.is_in_air
  if L4_34 and L3_33 > 0 then
    L4_34 = A1_31.shoot_shot
    return L4_34
  end
  L4_34 = A0_30.default_action_id
  L5_35 = A1_31.move_on_ground
  if L4_34 == L5_35 then
    L4_34 = __fatk3
    if L4_34 == true then
      __fatk3 = false
      L4_34 = A1_31.takeoff
      return L4_34
    end
  end
  L4_34 = A0_30.player_dist
  if L4_34 < 6 then
    L4_34 = A0_30.default_action_id
    L5_35 = A1_31.combo_on_ground
    if L4_34 == L5_35 then
      L4_34 = __fatk3
      if L4_34 == true then
        __fatk3 = false
        L4_34 = A1_31.takeoff
        return L4_34
      end
    end
  end
  L4_34 = A0_30.default_action_id
  L5_35 = A1_31.fatal_feed
  if L4_34 == L5_35 then
    L4_34 = A0_30.default_action_id
    return L4_34
  end
  L4_34 = A0_30.default_action_id
  L5_35 = A1_31.groggy
  if L4_34 == L5_35 then
    L4_34 = A0_30.default_action_id
    return L4_34
  end
  L4_34 = A0_30.player_dist
  if L4_34 > 50 then
    L4_34 = Player
    L5_35 = L4_34
    L4_34 = L4_34.getPuppet
    L4_34 = L4_34(L5_35)
    L5_35 = L4_34
    L4_34 = L4_34.getWorldPos
    L4_34 = L4_34(L5_35)
    L5_35 = {}
    L5_35.pos = L4_34 + Vector(0, 5.5, 0)
    L2_32:setWarpParams(L5_35)
    return A1_31.warp
  end
  L4_34 = A0_30.player_dist
  if L4_34 > 25 then
    L4_34 = A0_30.is_in_air
    if L4_34 then
      L4_34 = A1_31.follow_player_in_air
      return L4_34
    else
      L4_34 = A1_31.takeoff
      return L4_34
    end
  end
  L4_34 = A0_30.is_on_screen
  if L4_34 then
    L4_34 = drillout
    if L4_34 == true then
      drillout = false
      L4_34 = A0_30.default_action_id
      return L4_34
    end
  else
    L4_34 = drillout
    if L4_34 == true then
      L4_34 = A0_30.is_in_air
      if L4_34 then
        L4_34 = screentimer
        if L4_34 < 60 then
          L4_34 = screentimer
          L4_34 = L4_34 + 1
          screentimer = L4_34
          L4_34 = print
          L5_35 = "screentimer = "
          L5_35 = L5_35 .. screentimer
          L4_34(L5_35)
          L4_34 = A1_31.idle_in_air
          return L4_34
        else
          drillout = false
          screentimer = 0
          L4_34 = A0_30.default_action_id
          return L4_34
        end
      else
        L4_34 = screentimer
        if L4_34 < 60 then
          L4_34 = screentimer
          L4_34 = L4_34 + 1
          screentimer = L4_34
          L4_34 = print
          L5_35 = "screentimer = "
          L5_35 = L5_35 .. screentimer
          L4_34(L5_35)
          L4_34 = A1_31.idle_on_ground
          return L4_34
        else
          drillout = false
          screentimer = 0
          L4_34 = print
          L5_35 = "screentimer = "
          L5_35 = L5_35 .. screentimer
          L4_34(L5_35)
          L4_34 = A0_30.default_action_id
          return L4_34
        end
      end
    end
  end
  L4_34 = A0_30.has_enemy
  if L4_34 then
    L4_34 = A0_30.is_attackable_to_enemy
    if L4_34 then
      L4_34 = A0_30.is_in_air
      if L4_34 then
        L4_34 = A0_30.default_action_id
        L5_35 = A1_31.fall_kick_in_air
        if L4_34 == L5_35 then
          drillout = true
          L4_34 = A1_31.fall_kick_in_air
          return L4_34
        end
        L4_34 = A0_30.enemy_dist
        if L4_34 < 5 then
          L4_34 = RandI
          L5_35 = 3
          L4_34 = L4_34(L5_35)
          if L4_34 == 1 then
            takeoff = 0
            L5_35 = A1_31.backstep_in_air
            return L5_35
          elseif L4_34 == 2 then
            takeoff = 0
            L5_35 = A1_31.sidestep_in_air
            return L5_35
          elseif L4_34 == 3 then
            L5_35 = A0_30.is_enable_alight
            if L5_35 then
              L5_35 = takeoff
              if L5_35 == false then
                takeoff = true
                L5_35 = A1_31.alight
                return L5_35
              end
            end
          end
        else
          L4_34 = A0_30.enemy_dist
          if L4_34 > 20 then
            L4_34 = shoots
            if L4_34 > 5 then
              L4_34 = RandI
              L5_35 = 2
              L4_34 = L4_34(L5_35)
              if L4_34 == 1 then
                shoots = 0
                L4_34 = print
                L5_35 = "shoots = "
                L5_35 = L5_35 .. shoots
                L4_34(L5_35)
                L4_34 = fallkick
                L4_34 = L4_34 + 1
                fallkick = L4_34
                L4_34 = print
                L5_35 = "fallkick = "
                L5_35 = L5_35 .. fallkick
                L4_34(L5_35)
                drillout = true
                L4_34 = A1_31.fall_kick_in_air
                return L4_34
              else
                L4_34 = A1_31.follow_player_in_air
                return L4_34
              end
            else
              L4_34 = A0_30.enemy_dist
              if L4_34 < 5 then
                L4_34 = RandI
                L5_35 = 3
                L4_34 = L4_34(L5_35)
                if L4_34 == 1 then
                  takeoff = false
                  L5_35 = A1_31.backstep_in_air
                  return L5_35
                elseif L4_34 == 2 then
                  takeoff = false
                  L5_35 = A1_31.sidestep_in_air
                  return L5_35
                elseif L4_34 == 3 then
                  L5_35 = A0_30.is_enable_alight
                  if L5_35 then
                    L5_35 = takeoff
                    if L5_35 == false then
                      takeoff = true
                      L5_35 = A1_31.alight
                      return L5_35
                    end
                  end
                end
              else
                L4_34 = RandI
                L5_35 = 8
                L4_34 = L4_34(L5_35)
                if L4_34 > 6 then
                  L4_34 = A0_30.has_space_to_spawn_gravity_bullet
                  if L4_34 then
                    L4_34 = shoots
                    L4_34 = L4_34 + 1
                    shoots = L4_34
                    L4_34 = print
                    L5_35 = "shoots = "
                    L5_35 = L5_35 .. shoots
                    L4_34(L5_35)
                    L4_34 = A1_31.shoot_debri
                    return L4_34
                  end
                else
                  L4_34 = A1_31.sidestep_in_air
                  return L4_34
                end
              end
            end
          else
            L4_34 = A0_30.enemy_dist
            if L4_34 > 20 then
              L4_34 = shoots
              if L4_34 > 5 then
                shoots = 0
                L4_34 = print
                L5_35 = "shoots = "
                L5_35 = L5_35 .. shoots
                L4_34(L5_35)
                L4_34 = fallkick
                L4_34 = L4_34 + 1
                fallkick = L4_34
                L4_34 = print
                L5_35 = "fallkick = "
                L5_35 = L5_35 .. fallkick
                L4_34(L5_35)
                drillout = true
                L4_34 = A1_31.fall_kick_in_air
                return L4_34
              else
                L4_34 = A0_30.enemy_dist
                if L4_34 < 5 then
                  L4_34 = RandI
                  L5_35 = 3
                  L4_34 = L4_34(L5_35)
                  if L4_34 == 1 then
                    takeoff = false
                    L5_35 = A1_31.backstep_in_air
                    return L5_35
                  elseif L4_34 == 2 then
                    takeoff = false
                    L5_35 = A1_31.sidestep_in_air
                    return L5_35
                  elseif L4_34 == 3 then
                    L5_35 = A0_30.is_enable_alight
                    if L5_35 then
                      L5_35 = takeoff
                      if L5_35 == false then
                        takeoff = true
                        L5_35 = A1_31.alight
                        return L5_35
                      end
                    end
                  end
                else
                  L4_34 = RandI
                  L5_35 = 8
                  L4_34 = L4_34(L5_35)
                  if L4_34 > 6 then
                    L4_34 = A0_30.has_space_to_spawn_gravity_bullet
                    if L4_34 then
                      L4_34 = shoots
                      L4_34 = L4_34 + 1
                      shoots = L4_34
                      L4_34 = print
                      L5_35 = "shoots = "
                      L5_35 = L5_35 .. shoots
                      L4_34(L5_35)
                      L4_34 = A1_31.shoot_debri
                      return L4_34
                    end
                  else
                    L4_34 = A1_31.sidestep_in_air
                    return L4_34
                  end
                end
              end
            else
              L4_34 = A0_30.enemy_dist
              if L4_34 > 6 then
                L4_34 = fallkick
                if L4_34 > 0 then
                  fallkick = 0
                  L4_34 = print
                  L5_35 = "fallkick = "
                  L5_35 = L5_35 .. fallkick
                  L4_34(L5_35)
                  L4_34 = A0_30.enemy_dist
                  if L4_34 < 5 then
                    L4_34 = RandI
                    L5_35 = 3
                    L4_34 = L4_34(L5_35)
                    if L4_34 == 1 then
                      takeoff = false
                      L5_35 = A1_31.backstep_in_air
                      return L5_35
                    elseif L4_34 == 2 then
                      takeoff = false
                      L5_35 = A1_31.sidestep_in_air
                      return L5_35
                    elseif L4_34 == 3 then
                      L5_35 = A0_30.is_enable_alight
                      if L5_35 then
                        L5_35 = takeoff
                        if L5_35 == false then
                          takeoff = true
                          L5_35 = A1_31.alight
                          return L5_35
                        end
                      end
                    end
                  else
                    L4_34 = RandI
                    L5_35 = 8
                    L4_34 = L4_34(L5_35)
                    if L4_34 > 6 then
                      L4_34 = A0_30.has_space_to_spawn_gravity_bullet
                      if L4_34 then
                        L4_34 = shoots
                        L4_34 = L4_34 + 1
                        shoots = L4_34
                        L4_34 = print
                        L5_35 = "shoots = "
                        L5_35 = L5_35 .. shoots
                        L4_34(L5_35)
                        L4_34 = A1_31.shoot_debri
                        return L4_34
                      end
                    else
                      L4_34 = A1_31.sidestep_in_air
                      return L4_34
                    end
                  end
                else
                  L4_34 = fallkick
                  L4_34 = L4_34 + 1
                  fallkick = L4_34
                  L4_34 = print
                  L5_35 = "fallkick = "
                  L5_35 = L5_35 .. fallkick
                  L4_34(L5_35)
                  drillout = true
                  L4_34 = A1_31.fall_kick_in_air
                  return L4_34
                end
                L4_34 = RandI
                L5_35 = 5
                L4_34 = L4_34(L5_35)
                if L4_34 > 2 then
                  L4_34 = A0_30.enemy_dist
                  if L4_34 < 5 then
                    L4_34 = RandI
                    L5_35 = 2
                    L4_34 = L4_34(L5_35)
                    if L4_34 > 1 then
                      L4_34 = A1_31.backstep_in_air
                      return L4_34
                    else
                      L4_34 = A1_31.sidestep_in_air
                      return L4_34
                    end
                  end
                  L4_34 = fallkick
                  if L4_34 > 0 then
                    L4_34 = fallkick
                    L4_34 = L4_34 + 1
                    fallkick = L4_34
                    L4_34 = print
                    L5_35 = "fallkick = "
                    L5_35 = L5_35 .. fallkick
                    L4_34(L5_35)
                    drillout = true
                    L4_34 = A1_31.fall_kick_in_air
                    return L4_34
                  else
                    L4_34 = RandI
                    L5_35 = 8
                    L4_34 = L4_34(L5_35)
                    if L4_34 > 6 then
                      L4_34 = A0_30.has_space_to_spawn_gravity_bullet
                      if L4_34 then
                        L4_34 = shoots
                        L4_34 = L4_34 + 1
                        shoots = L4_34
                        L4_34 = print
                        L5_35 = "shoots = "
                        L5_35 = L5_35 .. shoots
                        L4_34(L5_35)
                        L4_34 = A1_31.shoot_debri
                        return L4_34
                      end
                    else
                      L4_34 = A1_31.sidestep_in_air
                      return L4_34
                    end
                  end
                else
                  L4_34 = A0_30.enemy_dist
                  if L4_34 < 5 then
                    L4_34 = RandI
                    L5_35 = 2
                    L4_34 = L4_34(L5_35)
                    if L4_34 > 1 then
                      L4_34 = A1_31.backstep_in_air
                      return L4_34
                    else
                      L4_34 = A1_31.sidestep_in_air
                      return L4_34
                    end
                  else
                    L4_34 = shoots
                    if L4_34 > 5 then
                      shoots = 0
                      L4_34 = print
                      L5_35 = "shoots = "
                      L5_35 = L5_35 .. shoots
                      L4_34(L5_35)
                      L4_34 = fallkick
                      L4_34 = L4_34 + 1
                      fallkick = L4_34
                      L4_34 = print
                      L5_35 = "fallkick = "
                      L5_35 = L5_35 .. fallkick
                      L4_34(L5_35)
                      drillout = true
                      L4_34 = print
                      L5_35 = drillout
                      L4_34(L5_35)
                      L4_34 = A1_31.fall_kick_in_air
                      return L4_34
                    else
                      L4_34 = RandI
                      L5_35 = 8
                      L4_34 = L4_34(L5_35)
                      if L4_34 > 6 then
                        L4_34 = A0_30.has_space_to_spawn_gravity_bullet
                        if L4_34 then
                          L4_34 = shoots
                          L4_34 = L4_34 + 1
                          shoots = L4_34
                          L4_34 = print
                          L5_35 = "shoots = "
                          L5_35 = L5_35 .. shoots
                          L4_34(L5_35)
                          L4_34 = A1_31.shoot_debri
                          return L4_34
                        end
                      else
                        L4_34 = A1_31.sidestep_in_air
                        return L4_34
                      end
                    end
                  end
                  L4_34 = A0_30.is_enable_alight
                  if L4_34 then
                    L4_34 = takeoff
                    if L4_34 == false then
                      takeoff = true
                      L4_34 = A1_31.alight
                      return L4_34
                    end
                  end
                end
              end
            end
          end
        end
      else
        L4_34 = A0_30.is_enemy_overhead
        if L4_34 then
          L4_34 = A1_31.takeoff
          return L4_34
        else
          L4_34 = A0_30.enemy_dist
          if L4_34 > 5 then
            L4_34 = A1_31.takeoff
            return L4_34
          else
            L4_34 = A0_30.enemy_dist
            if L4_34 > 2 then
              L4_34 = A1_31.move_on_ground
              return L4_34
            else
              L4_34 = RandI
              L5_35 = 5
              L4_34 = L4_34(L5_35)
              if L4_34 > 1 then
                L4_34 = A1_31.takeoff
                return L4_34
              else
                L4_34 = combo
                if L4_34 > 0 then
                  combo = 0
                  L4_34 = print
                  L5_35 = "combo = "
                  L5_35 = L5_35 .. combo
                  L4_34(L5_35)
                  L4_34 = RandI
                  L5_35 = 5
                  L4_34 = L4_34(L5_35)
                  if L4_34 > 1 then
                    L4_34 = A1_31.takeoff
                    return L4_34
                  else
                    L4_34 = A1_31.avoid_on_ground
                    return L4_34
                  end
                else
                  L4_34 = combo
                  L4_34 = L4_34 + 1
                  combo = L4_34
                  L4_34 = print
                  L5_35 = "combo = "
                  L5_35 = L5_35 .. combo
                  L4_34(L5_35)
                  L4_34 = A1_31.combo_on_ground
                  return L4_34
                end
              end
            end
          end
        end
      end
    else
      L4_34 = A0_30.is_in_air
      if L4_34 then
        L4_34 = RandI
        L5_35 = 3
        L4_34 = L4_34(L5_35)
        if L4_34 == 0 then
          L4_34 = A0_30.has_space_to_spawn_gravity_bullet
          if L4_34 then
            L4_34 = A1_31.shoot_debri
            return L4_34
          end
        else
          L4_34 = A1_31.follow_player_in_air
          return L4_34
        end
      else
        L4_34 = A1_31.takeoff
        return L4_34
      end
    end
  end
  L4_34 = print
  L5_35 = "\228\189\149\227\130\130\230\157\161\228\187\182\227\129\171\227\129\178\227\129\163\227\129\139\227\129\139\227\130\137\227\129\170\227\129\139\227\129\163\227\129\159"
  L4_34(L5_35)
  L4_34 = A1_31.follow_player_in_air
  return L4_34
end
function Supporter.Kitten.reaction_selector3(A0_36, A1_37)
  if A0_36.is_attacked_avoid_body then
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_36.current_action_id == A1_37.shoot_debri then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_37.damage
    elseif A0_36.current_action_id == A1_37.shoot_shot then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_37.damage
    elseif A0_36.current_action_id == A1_37.combo_on_ground then
      print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\227\131\128\227\131\161\227\131\188\227\130\184\229\136\164\229\174\154")
      return A1_37.damage
    elseif A0_36.current_action_id == A1_37.fall_kick_in_air then
      damage = 0
      print("damage = " .. damage)
      print("\227\131\137\227\131\170\227\131\171\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_37.avoid_in_air
    end
    print("\229\155\158\233\129\191\231\148\168\227\131\156\227\131\135\227\130\163\227\129\175\229\155\158\233\129\191\229\136\164\229\174\154")
    return A1_37.avoid_in_air
  else
    print("\230\156\172\228\189\147\227\131\156\227\131\135\227\130\163\227\129\171\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159")
    if A0_36.current_action_id == A1_37.shoot_debri then
      damage = damage + 1
      print("damage = " .. damage)
      print("\233\129\160\232\183\157\233\155\162\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_37.damage
    elseif A0_36.current_action_id == A1_37.shoot_shot then
      damage = damage + 1
      print("damage = " .. damage)
      print("\233\129\160\232\183\157\233\155\162\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_37.damage
    elseif A0_36.current_action_id == A1_37.combo_on_ground then
      damage = damage + 1
      print("damage = " .. damage)
      print("\229\156\176\228\184\138\227\130\179\227\131\179\227\131\156\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\229\164\177\230\149\151")
      return A1_37.damage
    elseif A0_36.current_action_id == A1_37.fall_kick_in_air then
      damage = 0
      print("damage = " .. damage)
      print("\227\131\137\227\131\170\227\131\171\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\184\173\227\129\175\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
      return A1_37.avoid_in_air
    elseif A0_36.default_action_id == A1_37.avoid_in_air then
      if RandI(6) == 1 then
        damage = damage + 1
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\227\129\175\230\136\144\229\138\159\227\129\151\227\129\159\227\129\140\227\128\129\231\162\186\231\142\135\227\129\167\227\131\128\227\131\161\227\131\188\227\130\184\227\129\171\226\128\166")
        return A1_37.damage
      else
        damage = 0
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_37.avoid_in_air
      end
    elseif A0_36.default_action_id == A1_37.avoid_on_ground then
      if RandI(6) == 1 then
        damage = damage + 1
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\227\129\175\230\136\144\229\138\159\227\129\151\227\129\159\227\129\140\227\128\129\231\162\186\231\142\135\227\129\167\227\131\128\227\131\161\227\131\188\227\130\184\227\129\171\226\128\166")
        return A1_37.damage
      else
        damage = 0
        print("damage = " .. damage)
        print("\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        return A1_37.avoid_on_ground
      end
    elseif A0_36.default_action_id == A1_37.damage then
      if RandI(5) == 1 then
        print("\227\131\128\227\131\161\227\131\188\227\130\184\227\130\146\229\143\151\227\129\145\227\129\159\227\129\140\231\162\186\231\142\135\227\129\167\229\155\158\233\129\191\227\129\171\230\136\144\229\138\159\239\188\129")
        if A0_36.is_in_air then
          return A1_37.avoid_in_air
        else
          return A1_37.avoid_on_ground
        end
      else
        damage = damage + 1
        print("damage = " .. damage)
        if damage == 0 then
          if RandI(9) == 1 then
            damage = 0
            print("damage = " .. damage)
            print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\144")
            if A0_36.is_in_air then
              return A1_37.avoid_in_air
            else
              return A1_37.avoid_on_ground
            end
          end
        elseif damage == 1 or damage == 2 then
          if RandI(6) == 1 then
            damage = 0
            print("damage = " .. damage)
            print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\145")
            if A0_36.is_in_air then
              return A1_37.avoid_in_air
            else
              return A1_37.avoid_on_ground
            end
          end
        elseif damage == 3 or damage == 4 then
          if RandI(3) == 1 then
            damage = 0
            print("damage = " .. damage)
            print("\229\155\158\233\129\191\230\174\181\233\154\142\239\188\172\239\189\150\239\188\146")
            if A0_36.is_in_air then
              return A1_37.avoid_in_air
            else
              return A1_37.avoid_on_ground
            end
          end
        elseif damage > 4 then
          damage = 0
          print("damage = " .. damage)
          print("\229\174\140\229\133\168\229\155\158\233\129\191")
          if A0_36.is_in_air then
            return A1_37.avoid_in_air
          else
            return A1_37.avoid_on_ground
          end
        else
          print("\229\155\158\233\129\191\239\188\129")
          return A1_37.avoid_in_air
        end
      end
    end
  end
  return A0_36.default_action_id
end
