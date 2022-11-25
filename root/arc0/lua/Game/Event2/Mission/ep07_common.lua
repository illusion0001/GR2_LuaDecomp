dofile("/Game/Event2/Mission/rac_common.lua")
_ground_enm_work = {}
_enm_landingship_work = {}
function loadLandingshipEnemy(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  for L4_4, L5_5 in L1_1(L2_2) do
    findGameObject2("EnemyGenerator", L5_5):requestPrepare()
    _enm_landingship_work[L5_5] = {
      enmgen = findGameObject2("EnemyGenerator", L5_5),
      landingship_pup = nil,
      is_started = false,
      is_dropped = false,
      is_opened1 = false,
      is_opened2 = false,
      is_back_started = false,
      enm_count = 0
    }
  end
  for L4_4, L5_5 in L1_1(L2_2) do
    while L5_5.enmgen:isPrepared() == false do
      wait()
    end
  end
end
function loadGroundEnemy(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11
  for L4_10, L5_11 in L1_7(L2_8) do
    findGameObject2("EnemyGenerator", L5_11):requestPrepare()
    _ground_enm_work[L5_11] = {
      enmgen = findGameObject2("EnemyGenerator", L5_11),
      is_started = false
    }
  end
  for L4_10, L5_11 in L1_7(L2_8) do
    while L5_11.enmgen:isPrepared() == false do
      wait()
    end
  end
end
function spawnLandingshipEnemyIdle()
  for _FORV_3_, _FORV_4_ in pairs(_enm_landingship_work) do
    _enm_landingship_work[_FORV_3_].enmgen:requestSpawn()
    _enm_landingship_work[_FORV_3_].enmgen:setEnemyMarker(false)
    for _FORV_9_, _FORV_10_ in ipairs(_enm_landingship_work[_FORV_3_].enmgen:getSpecTable().spawnSet) do
      if _FORV_10_.type == "landingship" then
        _enm_landingship_work[_FORV_3_].landingship_pup = findGameObject2("Puppet", _FORV_10_.name)
      else
        findGameObject2("EnemyBrain", _FORV_10_.name):setEnableHomingTarget(false)
      end
    end
  end
end
function spawnGroundEnemyIdle(A0_12)
  _ground_enm_work[A0_12].enmgen:requestSpawn()
  _ground_enm_work[A0_12].enmgen:requestIdlingEnemy(true)
  _ground_enm_work[A0_12].is_started = true
end
function setupNpcToEnmEnemyGenerator(A0_13)
  _ground_enm_work[A0_13:getName()] = {enmgen = A0_13, is_started = true}
end
function startLandingshipMove(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19, A6_20, A7_21)
  local L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22.is_started = true
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22.is_dropped = false
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22.is_opened1 = false
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22.is_opened2 = false
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22.is_back_started = false
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22.enm_count = 0
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22 = L8_22.enmgen
  L9_23 = L8_22
  L8_22 = L8_22.setEnemyMarker
  L10_24 = true
  L8_22(L9_23, L10_24)
  L8_22 = _enm_landingship_work
  L8_22 = L8_22[A0_14]
  L8_22 = L8_22.landingship_pup
  L9_23 = L8_22
  L8_22 = L8_22.getBrain
  L8_22 = L8_22(L9_23)
  L9_23 = 0
  L10_24 = 1
  L11_25 = 2
  L12_26 = 3
  L13_27 = 4
  L14_28 = L9_23
  function L15_29(A0_30)
    local L1_31, L2_32, L3_33, L4_34, L5_35
    if L1_31 == "wait" then
      if L1_31 == L2_32 then
        if L1_31 ~= nil then
          if L1_31 ~= nil then
            A0_30.movePoint = L1_31
            A0_30.changeState = "move"
          end
        else
          L14_28 = L1_31
        end
      end
      if L1_31 == L2_32 then
        if L1_31 ~= nil then
          if L1_31 ~= nil then
            A0_30.movePoint = L1_31
            A0_30.changeState = "move"
          end
        else
          L14_28 = L1_31
        end
      end
      if L1_31 == L2_32 then
        if L1_31 ~= nil then
          if L1_31 ~= nil then
            A0_30.movePoint = L1_31
            A0_30.changeState = "move"
          end
        else
          L14_28 = L1_31
        end
      end
      if L1_31 == L2_32 then
        A0_30.movePoint = L1_31
        A0_30.changeState = "move"
        L1_31.is_back_started = true
      end
    elseif L1_31 == "moveEnd" then
      if L1_31 == L2_32 then
        A0_30.dropEnemy = L1_31
        A0_30.changeState = "drop"
        L1_31.is_dropped = true
        L1_31.enm_count = L2_32
        for L4_34, L5_35 in L1_31(L2_32) do
          findGameObject2("EnemyBrain", L5_35):setEnableHomingTarget(true)
        end
      elseif L1_31 == L2_32 then
        A0_30.dropEnemy = L1_31
        A0_30.changeState = "open"
        L1_31.is_opened1 = true
        L1_31.enm_count = L2_32
        for L4_34, L5_35 in L1_31(L2_32) do
          findGameObject2("EnemyBrain", L5_35):setEnableHomingTarget(true)
        end
      elseif L1_31 == L2_32 then
        A0_30.dropEnemy = L1_31
        A0_30.changeState = "open"
        L1_31.is_opened2 = true
        L1_31.enm_count = L2_32
        for L4_34, L5_35 in L1_31(L2_32) do
          findGameObject2("EnemyBrain", L5_35):setEnableHomingTarget(true)
        end
      elseif L1_31 == L2_32 then
        L1_31(L2_32, L3_33)
        L14_28 = L1_31
      end
    elseif L1_31 == "dropEnd" then
      L14_28 = L1_31
    elseif L1_31 == "openEnd" then
      if L1_31 == L2_32 then
        L14_28 = L1_31
      elseif L1_31 == L2_32 then
        L14_28 = L1_31
      end
    end
    return A0_30
  end
  L8_22:setEventListener("enemy_landingship_event", L15_29)
end
function invokeEnemyMarkerTask()
  return invokeTask(function()
    local L0_36
    while true do
      L0_36 = false
      for _FORV_4_, _FORV_5_ in pairs(_enm_landingship_work) do
        if _FORV_5_.is_started == true and math.max(_FORV_5_.enmgen:getSpecTable().ash_count, _FORV_5_.enmgen:getSpecTable().dead_count) < _FORV_5_.enm_count then
          L0_36 = true
          break
        end
      end
      if L0_36 == false then
        for _FORV_4_, _FORV_5_ in pairs(_ground_enm_work) do
          if _FORV_5_.is_started == true and math.max(_FORV_5_.enmgen:getSpecTable().ash_count, _FORV_5_.enmgen:getSpecTable().dead_count) < _FORV_5_.enmgen:getSpecTable().spawn_count then
            L0_36 = true
            break
          end
        end
      end
      for _FORV_4_, _FORV_5_ in pairs(_enm_landingship_work) do
        if _enm_landingship_work[_FORV_4_].landingship_pup ~= nil then
          if _enm_landingship_work[_FORV_4_].is_started == false or _enm_landingship_work[_FORV_4_].is_back_started == true or L0_36 == true then
            _enm_landingship_work[_FORV_4_].landingship_pup:getBrain():setVisibleEnemyMarker(false)
          else
            _enm_landingship_work[_FORV_4_].landingship_pup:getBrain():setVisibleEnemyMarker(true)
          end
        end
      end
      wait(2)
    end
  end)
end
function crowSetIdle(A0_37, A1_38)
  local L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
  L2_39 = A0_37.setIdling
  L2_39(L3_40, L4_41)
  L2_39 = {
    L3_40,
    L4_41,
    L5_42,
    L6_43,
    L7_44,
    Supporter.Ability.Parallel.JupiterSp,
    Supporter.Ability.Avoid,
    Supporter.Ability.Warp,
    Supporter.Ability.Attack,
    Supporter.Ability.Damaged,
    Supporter.Ability.Follow,
    Supporter.Ability.ActionInAir,
    Supporter.Ability.ActionOnGround,
    Supporter.Ability.ServantLinkage
  }
  L6_43 = Supporter
  L6_43 = L6_43.Ability
  L6_43 = L6_43.Parallel
  L6_43 = L6_43.NormalSp
  L7_44 = Supporter
  L7_44 = L7_44.Ability
  L7_44 = L7_44.Parallel
  L7_44 = L7_44.MarsSp
  for L6_43, L7_44 in L3_40(L4_41) do
    A0_37:setAbility(L7_44, not A1_38)
  end
end
function ep07_ftNpcSetSightTarget(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51, L7_52, L8_53
  L1_46 = {L2_47, L3_48}
  L2_47 = "ep07_sis_01"
  L2_47 = findGameObject2
  L2_47 = L2_47(L3_48, L4_49)
  for L6_51, L7_52 in L3_48(L4_49) do
    L8_53 = -5
    if L2_47 ~= nil then
      L8_53 = Fn_get_distance(Fn_findNpcPuppet(L7_52):getWorldPos() + Vector(0, 1.5, 0), L2_47:getWorldPos())
    end
    while Fn_findNpc(L7_52):isReadyNpc() == false do
      wait()
    end
    Fn_findNpc(L7_52):setSightParam({
      degree_h = 45,
      degree_v = 45,
      in_length = L8_53 + 10,
      out_length = L8_53 + 20,
      valid = true,
      target = L2_47,
      watchTarget = true
    })
  end
end
function ep07_ftNpcResetSightParam()
  local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60
  L0_54 = {L1_55, L2_56}
  for L4_58, L5_59 in L1_55(L2_56) do
    L6_60 = Fn_findNpc
    L6_60 = L6_60(L5_59)
    while L6_60 == nil do
      wait(2)
      L6_60 = Fn_findNpc(L5_59)
    end
    while L6_60:isStarted() == false or L6_60:isReadyNpc() == false do
      wait()
    end
    L6_60:resetSightParam()
    print(L5_59 .. "\227\129\174\233\161\148\229\144\145\227\129\145\227\131\145\227\131\169\227\131\161\227\131\188\227\130\191\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136")
  end
end
