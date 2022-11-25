import("Mob")
function choice_look_idx(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L2_2 = 1
  L3_3 = 0
  for L7_7, L8_8 in L4_4(L5_5) do
    if L3_3 < Fn_getDistanceToPlayer(L8_8) then
      L3_3, L2_2 = Fn_getDistanceToPlayer(L8_8), L7_7
    end
  end
  if A1_1 < L3_3 then
    L4_4(L5_5)
  end
end
function fly_escape_player(A0_9, A1_10, A2_11, A3_12)
  local L4_13, L5_14, L6_15
  L4_13 = Fn_findNpcPuppet
  L5_14 = A0_9
  L4_13 = L4_13(L5_14)
  L5_14 = {
    L6_15,
    {dist = 10, speed = 15},
    {dist = 20, speed = 8},
    {dist = 30, speed = 5},
    {dist = 40, speed = 3},
    {dist = 50, speed = 1}
  }
  L6_15 = {}
  L6_15.dist = 0
  L6_15.speed = 20
  if A3_12 ~= nil then
    L5_14 = A3_12
  end
  L6_15 = A0_9.fly
  L6_15(A0_9, A1_10, A2_11)
  L6_15 = 10
  repeat
    for _FORV_12_, _FORV_13_ in pairs(L5_14) do
      if Fn_get_distance(L4_13:getWorldPos(), Fn_getPlayerWorldPos()) >= _FORV_13_.dist then
        L6_15 = _FORV_13_.speed
      else
        break
      end
    end
    if L6_15 ~= L6_15 then
      A0_9:setFlyMoveSpeed(L6_15)
    end
    wait()
  until A0_9:isFlyEnd()
end
function set_enmgen_homing_target(A0_16, A1_17, A2_18)
  for _FORV_6_, _FORV_7_ in pairs(A0_16) do
    if A2_18 ~= nil then
      for _FORV_12_, _FORV_13_ in pairs(A2_18) do
        if _FORV_7_.name == _FORV_13_ then
          break
        end
      end
    end
    if true == false then
      findGameObject2("Puppet", _FORV_7_.name):getBrain():setEnableHomingTarget(A1_17)
    end
  end
end
function mob_placement_enabled(A0_19, A1_20, A2_21)
  local L3_22, L4_23, L5_24
  L3_22 = Mob
  L4_23 = L3_22
  L3_22 = L3_22.getHatReqIdxOfPlacement
  L5_24 = A0_19
  L3_22 = L3_22(L4_23, L5_24, A1_20)
  if L3_22 ~= nil then
    L4_23 = Mob
    L5_24 = L4_23
    L4_23 = L4_23.setHatReqIdxEnabled
    L4_23 = L4_23(L5_24, A0_19, L3_22, A2_21)
    if A2_21 == false then
      L5_24 = Mob
      L5_24 = L5_24.collectPawnIdsWithHatReqIdx
      L5_24 = L5_24(L5_24, A0_19, L3_22)
      if L5_24 ~= nil then
        Mob:killPawns(A0_19, L5_24)
      end
    end
  end
end
function vog_crate_broken_task()
  local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34
  L0_25 = Fn_findNpc
  L1_26 = "vog01"
  L0_25 = L0_25(L1_26)
  L1_26 = Fn_findNpcPuppet
  L2_27 = L0_25
  L1_26 = L1_26(L2_27)
  L2_27 = findGameObject2
  L3_28 = "Node"
  L4_29 = "locator2_vog01_01"
  L2_27 = L2_27(L3_28, L4_29)
  L3_28 = false
  L4_29 = Fn_sendEventComSb
  L4_29 = L4_29(L5_30, L6_31)
  for L8_33, L9_34 in L5_30(L6_31) do
    L9_34:setEventListener("broken", function(A0_35)
      local L1_36
      L1_36 = Fn_get_distance
      L1_36 = L1_36(L9_34:getWorldPos(), Fn_getPlayerWorldPos())
      if L1_36 < 30 then
        L1_36 = true
        L3_28 = L1_36
      end
    end)
    break
  end
  return L5_30(L6_31)
end
function set_man51_prop()
  local L0_37
  L0_37 = createGameObject2
  L0_37 = L0_37("GimmickBg")
  L0_37:setDrawModelName("cimemo01_base")
  L0_37:setCollidablePermission(false)
  L0_37:try_init()
  L0_37:waitForReady()
  L0_37:try_start()
  Fn_attachJoint(L0_37, Fn_findNpcPuppet("man51"), "loc_l_hand")
end
function waitPhase()
  while _next_phase == false do
    wait()
  end
  _next_phase = false
end
function nextPhase(A0_38)
  if A0_38 ~= nil then
    A0_38:setActive(false)
  end
  _next_phase = true
end
function catWarp()
  invokeTask(function()
    Fn_catWarp()
  end)
end
