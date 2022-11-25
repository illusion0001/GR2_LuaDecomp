local L1_1
FIELD_ATTR_BLACK = 0
FIELD_ATTR_WHITE = 1
_old_friend_count = 0
_check_point_min_idx = 1
function L0_0(A0_2, A1_3, A2_4, A3_5)
  local L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L4_6 = #A2_4
  L5_7 = 0
  for L9_11 = 1, L4_6 do
    L10_12 = A2_4[L9_11]
    if L10_12 == A1_3 then
      L5_7 = L5_7 + 1
    end
  end
  if L5_7 > L6_8 then
    for L9_11 = _check_point_min_idx, #A3_5 do
      L10_12 = A3_5[L9_11]
      L11_13 = _old_friend_count
      if L10_12 > L11_13 and L5_7 >= L10_12 then
        L11_13 = 1
        for _FORV_15_ = L4_6, 1, -1 do
          L11_13 = L11_13 * 2
          if A2_4[_FORV_15_] == FIELD_ATTR_WHITE then
            L11_13 = L11_13 + 1
          end
        end
        _FOR_:set(A0_2, L11_13)
        _check_point_min_idx = L9_11
        break
      end
    end
  end
  _old_friend_count = L5_7
end
setTowerDefenseCheckPoint = L0_0
function L0_0(A0_14, A1_15)
  local L2_16
  L2_16 = GameDatabase
  L2_16 = L2_16.get
  L2_16 = L2_16(L2_16, A0_14)
  if L2_16 == 0 then
    return nil
  end
  for _FORV_7_ = 1, A1_15 do
    if L2_16 % 2 ~= 0 then
      ;({})[_FORV_7_] = FIELD_ATTR_WHITE
    else
      ;({})[_FORV_7_] = FIELD_ATTR_BLACK
    end
    L2_16 = math.floor(L2_16 / 2)
  end
  return {}
end
getTowerDefenseAttrFromCheckPointData = L0_0
function L0_0(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22)
  local L6_23
  L6_23 = {}
  L6_23.weak_respawn_task = nil
  L6_23.main_task = invokeTask(function()
    local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35
    L0_24 = L6_23
    L1_25 = nil
    if L2_26 == true then
      for L5_29, L6_30 in L2_26(L3_27) do
        if L7_31 == true then
          L1_25 = L5_29
          break
        end
      end
    else
      for L5_29, L6_30 in L2_26(L3_27) do
        if L7_31 == true then
          L1_25 = L5_29
          break
        end
      end
    end
    while true do
      if L1_25 ~= nil then
        while true do
          if L3_27 > L4_28 then
            L4_28()
          end
        end
        if L4_28 == true then
          L5_29 = L4_28
          L4_28(L5_29, L6_30)
          L5_29 = L4_28
          L4_28(L5_29, L6_30)
          L5_29 = L4_28
          L10_34 = L9_33
          L11_35 = L9_33(L10_34)
          L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L9_33(L10_34))
        else
          L5_29 = L4_28
          L4_28(L5_29, L6_30)
          L5_29 = L4_28
          L4_28(L5_29, L6_30)
          L5_29 = L4_28
          L10_34 = L9_33
          L11_35 = L9_33(L10_34)
          L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L9_33(L10_34))
        end
        L5_29 = RandF
        L11_35 = L5_29(L6_30, L7_31)
        L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L5_29(L6_30, L7_31))
      end
      L1_25, L5_29 = nil, nil
      for L9_33, L10_34 in L6_30(L7_31) do
        L11_35 = L10_34.getWorldPos
        L11_35 = L11_35(L10_34)
        if L2_26 == nil or L2_26 > Fn_getDistanceToPlayer(L11_35) then
        end
        if L4_28 == nil or L4_28 > Fn_get_distance(A3_20:getWorldPos(), L11_35) then
          L5_29 = L9_33
        end
      end
      for L10_34 = 1, FIELD_MAX do
        if L10_34 ~= L3_27 and L10_34 ~= L5_29 then
          L11_35 = table
          L11_35 = L11_35.insert
          L11_35(L6_30, L10_34)
        end
      end
      L1_25 = L6_30[L7_31]
      L2_26.dead_count = 0
      L5_29 = L4_28
      L4_28(L5_29)
      if L4_28 == true then
        L5_29 = L4_28
        L4_28(L5_29, L6_30)
        L5_29 = L4_28
        L4_28(L5_29, L6_30)
        L5_29 = L4_28
        L10_34 = L9_33
        L11_35 = L9_33(L10_34)
        L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L9_33(L10_34))
      else
        L5_29 = L4_28
        L4_28(L5_29, L6_30)
        L5_29 = L4_28
        L4_28(L5_29, L6_30)
        L5_29 = L4_28
        L10_34 = L9_33
        L11_35 = L9_33(L10_34)
        L4_28(L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L9_33(L10_34))
      end
    end
  end)
  function L6_23.isRunning(A0_36)
    return L6_23.main_task ~= nil and A0_36.main_task:isRunning()
  end
  function L6_23.abort(A0_37)
    if A0_37.weak_respawn_task ~= nil then
      A0_37.weak_respawn_task:abort()
      A0_37.weak_respawn_task = nil
    end
    if A0_37.main_task ~= nil then
      A0_37.main_task:abort()
      A0_37.main_task = nil
    end
  end
  return L6_23
end
invokeBossBattleEnemyRespawnTask = L0_0
function L0_0(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43, A6_44)
  local L7_45, L8_46
  L7_45 = nil
  if A5_43 == true then
    L8_46 = "enemy_lumino_event"
  else
    L8_46 = L8_46 or "enemy_tenebria_event"
  end
  A0_38:setEventListener(L8_46, function(A0_47)
    print("boss eventType:" .. A0_47.eventType)
    if A0_47.eventType == "charge_start" then
    elseif A0_47.eventType == "charge_result" then
      if A0_47.chargeResult == true then
        if L7_45 ~= nil then
          for _FORV_6_, _FORV_7_ in ipairs(A4_42[L7_45]:getSpecTable().spawnSet) do
            if findGameObject2("Puppet", _FORV_7_.name) ~= nil then
              RAC_createEffect({
                eff_name = "ef_nev_death_nvhan",
                world_pos = findGameObject2("Puppet", _FORV_7_.name):getWorldTransform()
              })
              A4_42[L7_45]:requestEnemyKill(findGameObject2("Puppet", _FORV_7_.name):getBrain())
            end
          end
          A4_42[L7_45]:getSpecTable().dead_count = A4_42[L7_45]:getSpecTable().dead_count + 1
          A0_38:eventMessage("SetActivePowerUpPoint", A3_41[L7_45], false)
          L7_45 = nil
        end
      elseif L7_45 ~= nil then
        A0_38:eventMessage("SetActivePowerUpPoint", A3_41[L7_45], false)
        L7_45 = nil
      end
    elseif A0_47.eventType == "power_down" then
    end
    if A6_44 ~= nil then
      A6_44(A0_47)
    end
    return A0_47
  end)
  L8_46 = invokeTask
  return L8_46(function()
    local L0_48
    L0_48 = A5_43
    if L0_48 == true then
      L0_48 = A1_39
    else
      L0_48 = L0_48 or A2_40
    end
    while true do
      if L7_45 == nil then
        for _FORV_4_, _FORV_5_ in ipairs(L0_48) do
          if _FORV_5_:getActive() == true then
            A0_38:eventMessage("SetActivePowerUpPoint", A3_41[_FORV_4_], true)
            L7_45 = _FORV_4_
            break
          end
        end
      elseif L0_48[L7_45]:getActive() == false then
        A0_38:eventMessage("SetActivePowerUpPoint", A3_41[L7_45], false)
        L7_45 = nil
      end
      wait(10)
    end
  end)
end
invokeBossPowerupTask = L0_0
