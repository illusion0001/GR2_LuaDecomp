local L1_1
_sm44_game_start = false
_sm44_game_part = 0
_sm44_father_puppet = nil
_sm44_father_walk_rate = 1
L0_0 = {}
_sm44_shop = L0_0
L0_0 = {}
_sm44_shop_marker = L0_0
L0_0 = {}
_sm44_shop_marker_playin = L0_0
_sm44_player_retry = ""
_sm44_player_front_node = nil
_sm44_player_front_node_range = 1.5
_sm44_player_front_range = 8
_sm44_player_front_angle = 60
_sm44_player_invincible_time = 0
_sm44_player_invincible_flag = false
_sm44_player_busy_flag = false
_sm44_player_inside_time = 0
_sm44_player_inside_caption = false
_sm44_father_name = nil
_sm44_father_target_old = 0
_sm44_father_target = ""
_sm44_father_move_index = -1
L0_0 = {}
_sm44_father_move_route = L0_0
_sm44_father_move_task = nil
_sm44_father_tired = 0
_sm44_father_tired_task = nil
_sm44_father_follow_task = nil
_sm44_father_follow_time = 0
_sm44_father_follow_out = 0
_sm44_father_follow_end = 0
_sm44_father_feint_range = 0
_sm44_father_feint_table = nil
_sm44_father_feint_max = 0
_sm44_father_feint_num = 0
_sm44_father_front_range = 8
_sm44_father_front_outrange = 10
_sm44_father_front_angle = 60
_sm44_father_front_danger = 3
_sm44_father_middle_range = 5
_sm44_father_near_range = 3
_sm44_father_around_range = 2.7
_sm44_father_turn_task = nil
_sm44_finded_gravity = false
_sm44_father_arrival = false
_sm44_feint_task = nil
_sm44_hint_task = nil
_sm44_hint_flag = false
_sm44_hint_wait = 0
_sm44_caption_task = nil
_sm44_clear_num = 0
_sm44_other_create_num = 0
L0_0 = {}
_sm44_other_puppets = L0_0
L0_0 = {}
_sm44_other_targets = L0_0
L0_0 = {}
_sm44_other_shops = L0_0
L0_0 = {}
_sm44_other_task = L0_0
_isRetry = false
SM44_MISSION_CAPTION = "sm44_09000"
SM44_FOLLOW_OUT_TIME = 10
SM44_FOLLOW_END_TIME = 180
SM44_INVINCIBLE_TIME_MAX = 90
SM44_AIMING_OFFSET = 1.5
SM44_OTHER_RANGE = 0.8
SM44_HINT_WAIT_TIME = 30
SM44_HINT_DISTANCE = 5
SM44_HINT_NAVI_TIME = 5
SM44_HINT_INTERVAL = 10
SM44_FATHER_STAMINA_DIS = 7
SM44_FATHER_STAMINA_MIN = 3
SM44_FATHER_STAMINA_MAX = 3
SM44_FATHER_TIRED_MIN = 2
SM44_FATHER_TIRED_MAX = 3
function L0_0(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12, A11_13, A12_14)
  local L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28
  L13_15 = _sm44_game_part
  if L13_15 ~= 0 then
    L13_15 = sm44_FinalGame
    L13_15()
  end
  _sm44_game_start = false
  _sm44_game_part = A0_2
  _sm44_father_name = A1_3
  L13_15 = Fn_sendEventComSb
  L14_16 = "sm44_SetFatherName"
  L15_17 = A1_3
  L13_15(L14_16, L15_17)
  _sm44_father_walk_rate = A2_4
  _sm44_player_retry = A5_7
  _sm44_player_invincible_time = 0
  _sm44_player_invincible_flag = false
  _sm44_player_busy_flag = false
  L13_15 = Fn_getPlayerWorldTransform
  L14_16 = L13_15()
  L16_18 = L14_16
  L15_17 = L14_16.Apply
  L17_19 = Vector
  L18_20 = 0
  L26_28 = L17_19(L18_20, L19_21, L20_22)
  L15_17 = L15_17(L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L17_19(L18_20, L19_21, L20_22))
  L13_15 = L13_15 + L15_17
  L15_17 = RAC_createGameObject2
  L16_18 = "_sm44_player_front_node"
  L17_19 = "Node"
  L18_20 = L13_15
  L15_17 = L15_17(L16_18, L17_19, L18_20, L19_21)
  _sm44_player_front_node = L15_17
  L15_17 = {}
  _sm44_shop = L15_17
  L15_17 = {}
  _sm44_shop_marker = L15_17
  L15_17 = {}
  _sm44_shop_marker_playin = L15_17
  L15_17 = Fn_sendEventComSb
  L16_18 = "sm44_ClearShopInfo"
  L15_17(L16_18)
  _sm44_father_feint_range = A3_5
  _sm44_father_feint_table = A4_6
  _sm44_father_feint_max = 0
  _sm44_father_feint_num = 0
  _sm44_father_front_range = A6_8
  _sm44_father_front_outrange = A7_9
  _sm44_father_front_angle = A8_10
  _sm44_father_front_danger = A9_11
  _sm44_father_near_range = A10_12
  _sm44_father_around_range = A11_13
  _sm44_finded_gravity = false
  _sm44_father_arrival = false
  _sm44_clear_num = 0
  L15_17 = sm44_HintCaptionOff
  L16_18 = 0
  L15_17(L16_18)
  L15_17 = Fn_findNpcPuppet
  L16_18 = _sm44_father_name
  L15_17 = L15_17(L16_18)
  _sm44_father_puppet = L15_17
  L15_17 = 1
  while true do
    L16_18 = "shop"
    L17_19 = string
    L17_19 = L17_19.format
    L18_20 = "%02d"
    L17_19 = L17_19(L18_20, L19_21)
    L16_18 = L16_18 .. L17_19
    L17_19 = Fn_sendEventComSb
    L18_20 = "sm44_findGameObject2"
    L22_24 = "_goal"
    L17_19 = L17_19(L18_20, L19_21, L20_22)
    if L17_19 ~= nil then
      L18_20 = print
      L18_20(L19_21)
      L18_20 = _sm44_shop
      L18_20[L15_17] = L16_18
      L18_20 = Fn_sendEventComSb
      L22_24 = L16_18
      L18_20 = L18_20(L19_21, L20_22, L21_23)
      L22_24 = L17_19
      L19_21.y = L21_23
      L22_24 = RAC_createGameObject2
      L23_25 = "shop_maker"
      L24_26 = string
      L24_26 = L24_26.format
      L25_27 = "%02d"
      L26_28 = L15_17
      L24_26 = L24_26(L25_27, L26_28)
      L23_25 = L23_25 .. L24_26
      L24_26 = "MapMarker"
      L25_27 = L19_21
      L26_28 = L20_22
      L22_24 = L22_24(L23_25, L24_26, L25_27, L26_28)
      L21_23[L15_17] = L22_24
      L22_24 = L21_23
      L23_25 = "gui_marker_30"
      L21_23(L22_24, L23_25)
      L22_24 = L21_23
      L23_25 = "C"
      L24_26 = Vector
      L25_27 = 6.6
      L26_28 = 4
      L26_28 = L24_26(L25_27, L26_28, 4.3)
      L21_23(L22_24, L23_25, L24_26, L25_27, L26_28, L24_26(L25_27, L26_28, 4.3))
      L22_24 = L21_23
      L23_25 = false
      L21_23(L22_24, L23_25)
      L21_23[L15_17] = false
      L15_17 = L15_17 + 1
    end
  end
  L15_17 = 1
  while true do
    L16_18 = "other_shop"
    L17_19 = string
    L17_19 = L17_19.format
    L18_20 = "%02d"
    L17_19 = L17_19(L18_20, L19_21)
    L16_18 = L16_18 .. L17_19
    L17_19 = Fn_sendEventComSb
    L18_20 = "sm44_findGameObject2"
    L17_19 = L17_19(L18_20, L19_21, L20_22)
    if L17_19 ~= nil then
      L18_20 = print
      L18_20(L19_21)
      L18_20 = _sm44_other_shops
      L18_20[L15_17] = L16_18
      L15_17 = L15_17 + 1
    end
  end
  _sm44_other_create_num = A12_14
  L15_17 = 1
  L16_18 = {}
  while true do
    L17_19 = _sm44_other_create_num
    if L15_17 <= L17_19 then
      L17_19 = "other"
      L18_20 = string
      L18_20 = L18_20.format
      L18_20 = L18_20(L19_21, L20_22)
      L17_19 = L17_19 .. L18_20
      L18_20 = {L19_21}
      L19_21.name = L17_19
      L19_21.type = "drunkard_hex"
      L19_21.node = "locator2_other_create"
      L19_21.attach = false
      L19_21.active = false
      L19_21(L20_22)
      L19_21(L20_22)
      if L19_21 == 0 then
        for L22_24 = 1, #L20_22 do
          L23_25 = _sm44_other_shops
          L23_25 = L23_25[L22_24]
          L16_18[L22_24] = L23_25
        end
      end
      L20_22[L15_17] = L21_23
      L22_24 = "Node"
      L23_25 = "locator2_"
      L24_26 = _sm44_other_targets
      L24_26 = L24_26[L15_17]
      L23_25 = L23_25 .. L24_26
      if L20_22 ~= nil then
        L22_24 = L17_19
        L23_25 = L20_22
        L22_24 = L20_22.getWorldTransform
        L23_25 = L22_24(L23_25)
        L25_27 = L21_23
        L24_26 = L21_23.setWorldTransform
        L26_28 = L22_24
        L24_26(L25_27, L26_28, L23_25)
      end
      L22_24 = "OtherNpcTarget.."
      L23_25 = _sm44_other_targets
      L23_25 = L23_25[L15_17]
      L22_24 = L22_24 .. L23_25
      L21_23(L22_24)
      L22_24 = L16_18
      L23_25 = L19_21
      L21_23(L22_24, L23_25)
      L22_24 = L16_18
      L21_23(L22_24)
      L22_24 = Fn_findNpcPuppet
      L23_25 = L17_19
      L22_24 = L22_24(L23_25)
      L21_23[L15_17] = L22_24
      L22_24 = L21_23
      L23_25 = "stay"
      L24_26 = "man01_drunk_stay_00"
      L21_23(L22_24, L23_25, L24_26)
      L22_24 = L21_23
      L23_25 = "walk"
      L24_26 = "man01_drunk_walk_00"
      L21_23(L22_24, L23_25, L24_26)
      L15_17 = L15_17 + 1
    end
  end
end
sm44_InitGame = L0_0
function L0_0()
  if _sm44_game_part ~= 0 then
    if _sm44_player_front_node ~= nil then
      _sm44_player_front_node:try_term()
      _sm44_player_front_node = nil
    end
    sm44_StopFather()
    Fn_sendEventComSb("sm44_ClearShopInfo")
    for _FORV_3_ = 1, #_sm44_shop_marker do
      if _sm44_shop_marker[_FORV_3_] ~= nil then
        _sm44_shop_marker[_FORV_3_]:try_term()
      end
    end
    _sm44_shop_marker = _FOR_
    _sm44_shop_marker_playin = {}
    sm44_HintCaptionOff(0)
    if _sm44_caption_task ~= nil then
      _sm44_caption_task:abort()
      _sm44_caption_task = nil
    end
    Fn_gestureActionCancel()
    _sm44_game_start = false
    _sm44_game_part = 0
  end
end
sm44_FinalGame = L0_0
function L0_0()
  if _sm44_game_part ~= 0 then
    Fn_findNpc(_sm44_father_name):setStagger(false)
    _sm44_clear_num = 0
    _sm44_father_target_old = 0
    _sm44_father_target_idx = sm44_GetNextShop({
      _sm44_father_target_old
    })
    _sm44_father_target = _sm44_shop[_sm44_father_target_idx]
    _sm44_father_feint_max = _sm44_father_feint_table[_sm44_clear_num + 1]
    _sm44_father_feint_num = _sm44_father_feint_max
    sm44_MoveFather()
    _sm44_finded_gravity = false
    _sm44_father_arrival = false
    sm44_HintCaptionOn()
    sm44_HintCaptionTask(0)
    for _FORV_3_ = 1, #_sm44_shop_marker do
      if _sm44_shop_marker[_FORV_3_] ~= nil then
        _sm44_shop_marker[_FORV_3_]:setActive(true)
        _sm44_shop_marker_playin[_FORV_3_] = true
      end
    end
    _sm44_game_start = true
    _isRetry = false
  end
end
sm44_StartGame = L0_0
function L0_0(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36
  L1_30 = _sm44_game_start
  if L1_30 then
    L1_30 = Fn_sendEventComSb
    L2_31 = "sm44_GetPlayerInsideShop"
    L1_30 = L1_30(L2_31)
    L2_31 = false
    for L6_35 = 1, #L4_33 do
      L7_36 = "shop"
      L7_36 = L7_36 .. string.format("%02d", L6_35)
      sm44_setMapMaker(L7_36, RAC_FindTableValue(L1_30, L7_36) == nil)
      if _sm44_father_feint_num == 0 and L6_35 == _sm44_father_target_idx and RAC_FindTableValue(L1_30, L7_36) ~= nil then
        L2_31 = true
      end
    end
    if L2_31 then
      _sm44_player_inside_time = L3_32
    else
      _sm44_player_inside_time = 0
    end
    L6_35 = L4_33
    L7_36 = Vector
    L7_36 = L7_36(0, 0, _sm44_player_front_node_range)
    L6_35 = Query
    L7_36 = L6_35
    L6_35 = L6_35.setEyeSightTransform
    L6_35(L7_36, L3_32 + Vector(0, SM44_AIMING_OFFSET, 0), L4_33)
    L6_35 = Query
    L7_36 = L6_35
    L6_35 = L6_35.setEyeSightRange
    L6_35(L7_36, _sm44_player_front_node_range)
    L6_35 = Query
    L7_36 = L6_35
    L6_35 = L6_35.raycastEyeSight
    L6_35 = L6_35(L7_36, L5_34)
    if L6_35 == nil then
      L7_36 = _sm44_player_front_node
      L7_36 = L7_36.setTransform
      L7_36(L7_36, L5_34, L4_33)
    else
      L7_36 = L6_35.pos
      L7_36 = L7_36 - L3_32
      L7_36 = L7_36 * 0.5
      L7_36 = _sm44_player_front_node
      L7_36 = L7_36.setTransform
      L7_36(L7_36, L5_34, L4_33)
    end
    L6_35 = _sm44_father_puppet
    L7_36 = Fn_getPlayer
    L7_36 = L7_36()
    L6_35 = RAC_RaycastEyeSightBase
    L7_36 = _sm44_father_puppet
    L6_35 = L6_35(L7_36, Fn_getPlayer(), _sm44_father_front_range, _sm44_father_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1)
    L7_36 = RAC_RaycastEyeSightBase
    L7_36 = L7_36(_sm44_father_puppet, Fn_getPlayer(), _sm44_father_front_outrange, _sm44_father_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1)
    if _sm44_player_busy_flag == false and _sm44_player_inside_caption == false and _sm44_player_inside_time > 30 and L3_32 >= 10 and RAC_checkEyeSight(_sm44_father_puppet, 20, _sm44_player_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) then
      sm44_CaptionView("sm44_09038", nil, false)
      _sm44_player_inside_caption = true
    end
    if _sm44_player_invincible_flag then
      _sm44_player_invincible_time = math.max(_sm44_player_invincible_time - 1, 0)
      if _sm44_player_invincible_time == 0 and Player:getAction() ~= Player.kAction_Idle then
        print("sm44_UpdateGame invincible_out")
        _sm44_player_invincible_time = 0
        _sm44_player_invincible_flag = false
      end
    end
    if _sm44_father_arrival or _sm44_father_follow_task == nil and _sm44_father_turn_task == nil and (Fn_sendEventComSb("sm44_IsFatherArrivalShop", _sm44_father_target) or _sm44_father_move_task ~= nil and not _sm44_father_move_task:isRunning()) then
      _sm44_father_arrival = true
      if not _sm44_player_busy_flag then
        print("sm44_UpdateGame father_arrival " .. _sm44_father_target)
        return false
      end
    elseif not _sm44_player_busy_flag and L6_35 and Player:isGravityControlMode() then
      print("sm44_UpdateGame finded_gravity")
      _sm44_finded_gravity = true
      return false
    elseif _sm44_father_tired_task ~= nil then
      if not _sm44_father_tired_task:isRunning() then
        print("sm44_UpdateGame tireding_end")
        sm44_MoveFather(false, true)
      end
    elseif _sm44_father_follow_task == nil and _sm44_father_turn_task == nil then
      if not _sm44_player_invincible_flag and not _sm44_player_busy_flag and RAC_RaycastEyeSightBase(_sm44_father_puppet, Fn_getPlayer(), _sm44_father_front_danger, _sm44_father_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) and (RAC_RaycastEyeSight(_sm44_father_puppet, _sm44_player_front_range, _sm44_player_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) or not L4_33) then
        print("sm44_UpdateGame following_start")
        _sm44_father_follow_task = sm44_FollowFather()
      elseif L3_32 <= _sm44_father_around_range and not L4_33 and L5_34 and not _sm44_player_invincible_flag and not _sm44_player_busy_flag and Fn_sendEventComSb("sm44_IsPlayerArea") and Fn_sendEventComSb("sm44_IsFatherArea") then
        sm44_StopFather()
        print("sm44_UpdateGame turning_start")
        _sm44_father_turn_task = invokeTask(function()
          sm44_CaptionView("sm44_09001", nil, false)
          Fn_turnNpc(_sm44_father_name, nil, nil, true)
        end)
      elseif _sm44_father_move_task ~= nil then
        if Fn_findNpc(_sm44_father_name) ~= nil then
          _sm44_father_move_index = Fn_findNpc(_sm44_father_name):getMoveCurrentIndex()
        end
        if A0_29 == 3 and L3_32 > SM44_FATHER_STAMINA_DIS then
          _sm44_father_tired = math.max(_sm44_father_tired - 1, 0)
          if _sm44_father_tired == 0 then
            print("sm44_UpdateGame tireding_start")
            sm44_StopFather()
            _sm44_father_tired_task = invokeTask(function()
              local L0_37
              L0_37 = wait
              L0_37(math.random(SM44_FATHER_TIRED_MIN * 30, SM44_FATHER_TIRED_MAX * 30))
            end)
          end
        end
      else
        sm44_MoveFather(not _sm44_player_busy_flag)
      end
    elseif _sm44_father_follow_task ~= nil then
      _sm44_father_follow_time = _sm44_father_follow_time + 1
      _sm44_father_follow_end = math.max(_sm44_father_follow_end - 1, 0)
      if not L7_36 and L3_32 > _sm44_father_middle_range then
        _sm44_father_follow_out = math.max(_sm44_father_follow_out - 1, 0)
      else
        _sm44_father_follow_out = SM44_FOLLOW_OUT_TIME
      end
      if _sm44_father_follow_time >= 90 and not _sm44_player_invincible_flag and not _sm44_player_busy_flag and RAC_RaycastEyeSightBase(_sm44_father_puppet, Fn_getPlayer(), _sm44_father_front_danger, _sm44_father_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) and RAC_RaycastEyeSight(_sm44_father_puppet, _sm44_player_front_range, _sm44_player_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) then
        print("sm44_UpdateGame finded_face")
        return false
      end
      if _sm44_player_busy_flag or _sm44_father_follow_out == 0 or _sm44_father_follow_end == 0 or not Fn_sendEventComSb("sm44_IsPlayerArea") or not Fn_sendEventComSb("sm44_IsFatherArea") then
        print("sm44_UpdateGame following_end")
        sm44_MoveFather(not _sm44_player_busy_flag)
      end
      if _sm44_father_follow_task ~= nil and not _sm44_father_follow_task:isRunning() then
        if _sm44_father_turn_task == nil then
          print("sm44_UpdateGame following_turn_start")
          _sm44_father_turn_task = invokeTask(function()
            Fn_turnNpc(_sm44_father_name, nil, nil, true)
          end)
        elseif not _sm44_father_turn_task:isRunning() then
          _sm44_father_follow_task = sm44_FollowFather()
        end
      end
    else
      if _sm44_player_busy_flag or not Fn_sendEventComSb("sm44_IsPlayerArea") or not Fn_sendEventComSb("sm44_IsFatherArea") then
        print("sm44_UpdateGame turning_end")
        sm44_MoveFather(not _sm44_player_busy_flag)
      end
      if _sm44_father_turn_task ~= nil and not _sm44_father_turn_task:isRunning() then
        print("sm44_UpdateGame turning_end")
        if not _sm44_player_invincible_flag and not _sm44_player_busy_flag and L3_32 <= _sm44_father_around_range and not L4_33 and L5_34 and Fn_sendEventComSb("sm44_IsPlayerArea") and Fn_sendEventComSb("sm44_IsFatherArea") and Player:isGravityControlMode() then
          print("sm44_UpdateGame finded_gravity")
          _sm44_finded_gravity = true
          return false
        end
        sm44_StopFather()
      end
    end
    if sm44_FeintFatherTarget() then
      sm44_MoveFather()
      _sm44_feint_task = invokeTask(function()
        PlaySeRadio("eug_014")
        sm44_CaptionView("sm44_09002")
      end)
    end
    if sm44_hint_task == nil or not sm44_hint_task:isRunning() then
      if _sm44_player_busy_flag or Fn_sendEventComSb("sm44_isBusyCatWarp") or Fn_sendEventComSb("sm44_isWarningCatWarp") then
      else
      end
      if true then
        sm44_HintCaptionOff(SM44_HINT_WAIT_TIME)
      elseif 0 < _sm44_hint_wait then
        _sm44_hint_wait = math.max(_sm44_hint_wait - 1, 0)
      else
        sm44_HintCaptionOn()
      end
    end
    return true
  end
  L1_30 = print
  L2_31 = "sm44_UpdateGame no_start"
  L1_30(L2_31)
  L1_30 = false
  return L1_30
end
sm44_UpdateGame = L0_0
function L0_0()
  _sm44_game_start = false
  sm44_HintCaptionOff(0)
  if sm44_hint_task ~= nil then
    sm44_hint_task:abort()
    sm44_hint_task = nil
  end
  Fn_naviKill()
  sm44_StopFather()
  Fn_userCtrlOff()
  if Player:isGravityControlMode() then
    if Fn_sendEventComSb("sm44_IsPlayerArrivalShop", sm44_GetFatherTarget()) then
      Player:setGravityControlMode(false)
      wait()
    end
  else
  end
  if true then
    while Player:getAction() ~= Player.kAction_Idle and 0 < 90 do
      wait()
    end
  end
  Player:setStay(true)
end
sm44_StopGame = L0_0
function L0_0(A0_38, A1_39, A2_40, A3_41)
  sm44_HintCaptionTask(A1_39)
  if A2_40 ~= false then
    Fn_captionViewWait(A0_38, A1_39, A1_39, A3_41)
  else
    Fn_captionView(A0_38, A1_39, A3_41)
  end
end
sm44_CaptionView = L0_0
function L0_0(A0_42)
  if _sm44_caption_task ~= nil then
    _sm44_caption_task:abort()
    _sm44_caption_task = nil
  end
  if A0_42 == nil then
    A0_42 = 3
  end
  _sm44_caption_task = invokeTask(function()
    local L0_43, L1_44
    L0_43 = nil
    while true do
      L1_44 = _sm44_hint_flag
      if L0_43 ~= L1_44 then
        L1_44 = _sm44_hint_flag
        if L1_44 then
          L1_44 = {}
          L1_44.RL = {
            id = "ui_event_guide_13",
            func = sm44_HintTaskCB
          }
          Fn_gestureAction(L1_44)
        else
          L1_44 = Fn_gestureActionCancel
          L1_44()
        end
        L0_43 = _sm44_hint_flag
      end
      L1_44 = wait
      L1_44()
    end
  end)
end
sm44_HintCaptionTask = L0_0
function L0_0()
  local L0_45
  L0_45 = {}
  L0_45.lookat_task = nil
  L0_45.timer_task = nil
  function L0_45.update(A0_46)
    sm44_HintCaptionOff(0)
    Fn_naviSet(_sm44_father_puppet)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    A0_46.lookat_task = RAC_LookAtObject(_sm44_father_puppet, SM44_AIMING_OFFSET, 0.5)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    PlaySeRadio("eug_012")
    if not Fn_isCaptionView() then
      sm44_CaptionView("sm44_09003")
    end
    waitSeconds(SM44_HINT_NAVI_TIME)
    Fn_naviKill()
    waitSeconds(SM44_HINT_INTERVAL)
    sm44_HintCaptionOn()
  end
  function L0_45.destractor(A0_47)
    local L1_48
  end
  sm44_hint_task = RAC_InvokeTaskWithDestractor(L0_45.update, L0_45.destractor, L0_45)
end
sm44_HintTaskCB = L0_0
function L0_0()
  local L0_49, L1_50
  _sm44_hint_flag = true
end
sm44_HintCaptionOn = L0_0
function L0_0(A0_51)
  local L1_52
  _sm44_hint_flag = false
  _sm44_hint_wait = A0_51
end
sm44_HintCaptionOff = L0_0
function L0_0()
  local L1_53
  L1_53 = _sm44_clear_num
  L1_53 = L1_53 + 1
  _sm44_clear_num = L1_53
end
sm44_CountUpClearNum = L0_0
function L0_0()
  local L0_54, L1_55
  L0_54 = _sm44_clear_num
  return L0_54
end
sm44_GetClearNum = L0_0
function L0_0()
  sm44_ChangeFatherTarget(true)
  Fn_userCtrlOn()
  sm44_MoveFather()
  PlaySeRadio("eug_013")
  sm44_CaptionView("sm44_09004")
  _sm44_player_invincible_time = SM44_INVINCIBLE_TIME_MAX
  _sm44_player_invincible_flag = true
  _sm44_player_busy_flag = false
  _sm44_player_inside_time = 0
  _sm44_player_inside_caption = false
  _sm44_game_start = true
end
sm44_NextGame = L0_0
function L0_0()
  Fn_setBgmPoint("event", "chase_reset")
  _sm44_clear_num = 0
  Fn_sendEventComSb("sm44_ClearShopInfo")
  _sm44_father_target_old = 0
  _sm44_father_target_idx = sm44_GetNextShop({
    _sm44_father_target_old
  })
  _sm44_father_target = _sm44_shop[_sm44_father_target_idx]
  _sm44_finded_gravity = false
  _sm44_father_arrival = false
  _sm44_father_feint_max = _sm44_father_feint_table[_sm44_clear_num + 1]
  _sm44_father_feint_num = _sm44_father_feint_max
  Fn_resetPcPos(_sm44_player_retry)
  Fn_warpNpc(_sm44_father_name, Fn_sendEventComSb("sm44_findGameObject2", "Node", "locator2_father_start01"))
  sm44_HintCaptionOn()
  sm44_HintCaptionTask(0)
  _sm44_player_invincible_time = 0
  _sm44_player_invincible_flag = false
  _sm44_player_busy_flag = false
  _sm44_player_inside_time = 0
  _sm44_player_inside_caption = false
  _sm44_game_start = true
  _isRetry = true
end
sm44_RetryGame = L0_0
function L0_0(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64
  L2_58 = print
  L3_59 = string
  L3_59 = L3_59.format
  L8_64 = L3_59(L4_60, L5_61, L6_62)
  L2_58(L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L3_59(L4_60, L5_61, L6_62))
  L2_58 = sm44_StopFather
  L2_58()
  if A0_56 ~= nil and A0_56 == true then
    L2_58 = sm44_CaptionView
    L3_59 = "sm44_09005"
    L2_58(L3_59, L4_60, L5_61)
    L2_58 = SM44_INVINCIBLE_TIME_MAX
    _sm44_player_invincible_time = L2_58
    _sm44_player_invincible_flag = true
  end
  L2_58 = math
  L2_58 = L2_58.random
  L3_59 = SM44_FATHER_STAMINA_MIN
  L3_59 = L3_59 * 30
  L2_58 = L2_58(L3_59, L4_60)
  _sm44_father_tired = L2_58
  L2_58 = _sm44_father_move_index
  if L2_58 == -1 then
    L2_58 = {}
    _sm44_father_move_route = L2_58
    L2_58 = 1
    while true do
      L3_59 = string
      L3_59 = L3_59.format
      L7_63 = L2_58
      L3_59 = L3_59(L4_60, L5_61, L6_62, L7_63)
      L7_63 = L3_59
      if L4_60 ~= nil then
        L7_63 = L3_59
        L5_61(L6_62)
        L7_63 = L3_59
        L5_61(L6_62, L7_63)
        L2_58 = L2_58 + 1
      end
    end
    L3_59 = table
    L3_59 = L3_59.insert
    L7_63 = "_front"
    L3_59(L4_60, L5_61)
    L3_59 = table
    L3_59 = L3_59.insert
    L7_63 = "_goal"
    L3_59(L4_60, L5_61)
    L3_59 = RAC_invokeMoveCharaTaskComSb2
    L7_63 = {}
    L7_63.arrivedLength = 0
    L7_63.runLength = 999999
    L8_64 = _sm44_father_walk_rate
    L7_63.anim_walk_speed = L8_64
    L7_63.anim_speed_over = true
    L7_63.avoidance = true
    L7_63.navimesh = "ed_a_root_custom01"
    L3_59 = L3_59(L4_60, L5_61, L6_62, L7_63)
    _sm44_father_move_task = L3_59
  elseif A1_57 ~= nil and A1_57 == true then
    L2_58 = RAC_invokeMoveCharaTaskComSb2
    L3_59 = "sm44_findGameObject2"
    L6_62.arrivedLength = 0
    L6_62.runLength = 999999
    L7_63 = _sm44_father_walk_rate
    L6_62.anim_walk_speed = L7_63
    L6_62.anim_speed_over = true
    L6_62.avoidance = true
    L6_62.navimesh = "ed_a_root_custom01"
    L7_63 = {}
    L8_64 = _sm44_father_move_index
    L7_63.startIndex = L8_64
    L2_58 = L2_58(L3_59, L4_60, L5_61, L6_62, L7_63)
    _sm44_father_move_task = L2_58
  else
    L2_58 = 0
    L3_59 = -1
    for L7_63, L8_64 in L4_60(L5_61) do
      if L3_59 == -1 or L2_58 >= Fn_get_distance(_sm44_father_puppet:getWorldPos(), Fn_sendEventComSb("sm44_findGameObject2", "Node", L8_64):getWorldPos()) then
        L2_58, L3_59 = Fn_get_distance(_sm44_father_puppet:getWorldPos(), Fn_sendEventComSb("sm44_findGameObject2", "Node", L8_64):getWorldPos()), L7_63
      end
    end
    if L3_59 > L4_60 then
      _sm44_father_move_index = L3_59
    end
    L7_63 = _sm44_father_move_route
    L8_64 = {}
    L8_64.arrivedLength = 0
    L8_64.runLength = 999999
    L8_64.anim_walk_speed = _sm44_father_walk_rate
    L8_64.anim_speed_over = true
    L8_64.avoidance = true
    L8_64.navimesh = "ed_a_root_custom01"
    _sm44_father_move_task = L4_60
  end
end
sm44_MoveFather = L0_0
function L0_0()
  local L0_65
  L0_65 = sm44_StopFather
  L0_65()
  L0_65 = sm44_CaptionView
  L0_65("sm44_09006", nil, false)
  _sm44_father_follow_time = 0
  L0_65 = SM44_FOLLOW_OUT_TIME
  _sm44_father_follow_out = L0_65
  L0_65 = SM44_FOLLOW_END_TIME
  _sm44_father_follow_end = L0_65
  L0_65 = {}
  L0_65.move_task = nil
  L0_65.turn_task = nil
  function L0_65.update(A0_66)
    while true do
      if A0_66.move_task == nil and A0_66.turn_task == nil then
        if RAC_RaycastEyeSightBase(_sm44_father_puppet, Fn_getPlayer(), _sm44_father_front_danger, _sm44_father_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) and RAC_RaycastEyeSight(_sm44_father_puppet, _sm44_player_front_range, _sm44_player_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) then
        elseif RAC_RaycastEyeSightBase(_sm44_father_puppet, Fn_getPlayer(), _sm44_father_front_danger, _sm44_father_front_angle, SM44_AIMING_OFFSET, SM44_AIMING_OFFSET, 0.1) then
          A0_66.move_task = RAC_invokeMoveCharaTask2(_sm44_father_name, {
            _sm44_player_front_node:getName()
          }, {
            arrivedLength = 0.3,
            runLength = 999999,
            anim_walk_speed = _sm44_father_walk_rate,
            anim_speed_over = true,
            avoidance = true,
            navimesh = "ed_a_root_custom01"
          })
        else
          A0_66.turn_task = invokeTask(function()
            Fn_turnNpc(_sm44_father_name, nil, nil, true)
          end)
        end
      elseif A0_66.move_task ~= nil then
        if not A0_66.move_task:isRunning() then
          A0_66.move_task:abort()
          A0_66.move_task = nil
        end
      elseif A0_66.turn_task ~= nil and not A0_66.turn_task:isRunning() then
        A0_66.turn_task:abort()
        A0_66.turn_task = nil
      end
      wait()
    end
  end
  function L0_65.destractor(A0_67)
    if A0_67.move_task ~= nil then
      A0_67.move_task:abort()
      A0_67.move_task = nil
    end
    if A0_67.turn_task ~= nil then
      A0_67.turn_task:abort()
      A0_67.turn_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L0_65.update, L0_65.destractor, L0_65)
end
sm44_FollowFather = L0_0
function L0_0()
  if _sm44_father_turn_task ~= nil then
    _sm44_father_turn_task:abort()
    _sm44_father_turn_task = nil
  end
  if _sm44_feint_task ~= nil then
    _sm44_feint_task:abort()
    _sm44_feint_task = nil
  end
  if _sm44_father_move_task ~= nil then
    _sm44_father_move_task:abort()
    _sm44_father_move_task = nil
  end
  if _sm44_father_follow_task ~= nil then
    _sm44_father_follow_task:abort()
    _sm44_father_follow_task = nil
  end
  if _sm44_father_tired_task ~= nil then
    _sm44_father_tired_task:abort()
    _sm44_father_tired_task = nil
  end
  _sm44_father_follow_time = 0
  _sm44_father_follow_out = 0
  _sm44_father_follow_end = 0
  RAC_stopNpcMoveTask(_sm44_father_name)
end
sm44_StopFather = L0_0
function L0_0(A0_68)
  local L1_69, L2_70, L3_71, L4_72, L5_73
  _sm44_father_move_index = -1
  L1_69 = {}
  _sm44_father_move_route = L1_69
  L1_69 = _sm44_father_target_old
  if L1_69 == 0 then
    L1_69 = table
    L1_69 = L1_69.insert
    L1_69(L2_70, L3_71)
  else
    L1_69 = _sm44_father_target_old
    if L1_69 == 2 then
      L1_69 = table
      L1_69 = L1_69.insert
      L1_69(L2_70, L3_71)
    else
      L1_69 = _sm44_father_target_old
      if L1_69 == 3 then
        L1_69 = table
        L1_69 = L1_69.insert
        L1_69(L2_70, L3_71)
      else
      end
    end
  end
  L1_69 = {}
  for L5_73 = 1, #L3_71 do
    if RAC_FindTableValue(A0_68, L5_73) == nil then
      table.insert(L1_69, _sm44_shop[L5_73])
    end
  end
  for _FORV_6_ = 1, #L4_72 do
    if L1_69[L2_70] == _sm44_shop[_FORV_6_] then
      return _FORV_6_
    end
  end
  return L3_71
end
sm44_GetNextShop = L0_0
function L0_0(A0_74)
  local L1_75
  _sm44_finded_gravity = false
  _sm44_father_arrival = false
  L1_75 = {}
  table.insert(L1_75, _sm44_father_target_idx)
  _sm44_father_target_old = _sm44_father_target_idx
  _sm44_father_target_idx = sm44_GetNextShop(L1_75)
  _sm44_father_target = _sm44_shop[_sm44_father_target_idx]
  if A0_74 ~= nil and A0_74 == true then
    _sm44_father_feint_max = _sm44_father_feint_table[_sm44_clear_num + 1]
    _sm44_father_feint_num = _sm44_father_feint_max
  end
end
sm44_ChangeFatherTarget = L0_0
function L0_0()
  local L0_76, L1_77, L2_78
  L0_76 = _sm44_father_feint_num
  if L0_76 > 0 then
    L0_76 = Fn_sendEventComSb
    L1_77 = "sm44_findGameObject2"
    L2_78 = "Node"
    L0_76 = L0_76(L1_77, L2_78, "locator2_father_" .. _sm44_father_target .. "_gate")
    if L0_76 ~= nil then
      L1_77 = Fn_get_distance
      L2_78 = _sm44_father_puppet
      L2_78 = L2_78.getWorldPos
      L2_78 = L2_78(L2_78)
      L1_77 = L1_77(L2_78, L0_76:getWorldPos())
      L2_78 = _sm44_father_feint_range
      if L1_77 < L2_78 then
        L2_78 = _sm44_father_target_old
        _sm44_father_target_old = _sm44_father_target_idx
        _sm44_father_target_idx = sm44_GetNextShop({
          _sm44_father_target_old,
          L2_78
        })
        print("sm44_FeintFatherTarget.." .. _sm44_father_target .. " > " .. _sm44_shop[_sm44_father_target_idx])
        _sm44_father_target = _sm44_shop[_sm44_father_target_idx]
        _sm44_father_feint_num = _sm44_father_feint_num - 1
        return true
      end
    end
  end
  L0_76 = false
  return L0_76
end
sm44_FeintFatherTarget = L0_0
function L0_0()
  local L0_79, L1_80
  L0_79 = _sm44_finded_gravity
  return L0_79
end
sm44_IsFindedGravity = L0_0
function L0_0()
  local L0_81, L1_82
  L0_81 = _sm44_father_arrival
  return L0_81
end
sm44_IsFatherArrival = L0_0
function L0_0()
  local L0_83, L1_84
  L0_83 = _sm44_father_target
  return L0_83
end
sm44_GetFatherTarget = L0_0
function L0_0()
  local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90
  for L3_88 = 1, #L1_86 do
    L4_89 = {}
    L4_89.loop_task = nil
    L4_89.move_task = nil
    L4_89.turn_task = nil
    L4_89.npc_turn_task = nil
    L4_89.lookat_task = nil
    function L5_90(A0_91)
      local L1_92, L2_93, L3_94, L4_95
      L1_92 = "other"
      L2_93 = string
      L2_93 = L2_93.format
      L3_94 = "%02d"
      L4_95 = L3_88
      L2_93 = L2_93(L3_94, L4_95)
      L1_92 = L1_92 .. L2_93
      L2_93 = Player
      L3_94 = L2_93
      L2_93 = L2_93.getPuppet
      L2_93 = L2_93(L3_94)
      while true do
        while true do
          L3_94 = invokeTask
          function L4_95()
            local L0_96, L1_97
            while true do
              L0_96 = {}
              L1_97 = 1
              for _FORV_5_ = 1, #_sm44_other_shops do
                if _sm44_other_shops[_FORV_5_] ~= _sm44_other_targets[L3_88] then
                  L0_96[L1_97] = _sm44_other_shops[_FORV_5_]
                  L1_97 = L1_97 + 1
                end
              end
              _sm44_other_targets[L3_88] = L0_96[math.random(#L0_96)]
              print("OtherNpc.." .. L1_92 .. " Next.." .. _sm44_other_targets[L3_88])
              A0_91.move_task = RAC_invokeMoveCharaTaskComSb2("sm44_findGameObject2", L1_92, {
                "locator2_" .. _sm44_other_targets[L3_88]
              }, {
                arrivedLength = 1,
                runLength = 999999,
                anim_walk_speed = _sm44_father_walk_rate,
                anim_speed_over = true,
                avoidance = true,
                avoidance = true,
                navimesh = "ed_a_root_custom01"
              })
              while A0_91.move_task ~= nil and A0_91.move_task:isRunning() do
                wait()
              end
              if A0_91.move_task ~= nil then
                A0_91.move_task:abort()
                A0_91.move_task = nil
              end
              RAC_stopNpcMoveTask(L1_92)
              waitSeconds(5)
            end
          end
          L3_94 = L3_94(L4_95)
          A0_91.loop_task = L3_94
          while true do
            L3_94 = _sm44_game_start
            if L3_94 then
              L3_94 = _sm44_father_arrival
              if not L3_94 then
                L3_94 = _sm44_player_busy_flag
                if not L3_94 then
                  L3_94 = _sm44_player_invincible_flag
                  if not L3_94 then
                    L3_94 = Player
                    L4_95 = L3_94
                    L3_94 = L3_94.isGravityControlMode
                    L3_94 = L3_94(L4_95)
                    if not L3_94 then
                      L3_94 = Fn_getDistanceToPlayer
                      L4_95 = _sm44_other_puppets
                      L4_95 = L4_95[L3_88]
                      L3_94 = L3_94(L4_95)
                      L4_95 = SM44_OTHER_RANGE
                    end
                  end
                end
              end
            end
            if not (L3_94 < L4_95) then
              L3_94 = wait
              L3_94()
            end
          end
          _sm44_player_busy_flag = true
          L3_94 = sm44_HintCaptionOff
          L4_95 = 0
          L3_94(L4_95)
          L3_94 = sm44_hint_task
          if L3_94 ~= nil then
            L3_94 = sm44_hint_task
            L4_95 = L3_94
            L3_94 = L3_94.abort
            L3_94(L4_95)
            sm44_hint_task = nil
          end
          L3_94 = A0_91.move_task
          if L3_94 ~= nil then
            L3_94 = A0_91.move_task
            L4_95 = L3_94
            L3_94 = L3_94.abort
            L3_94(L4_95)
            A0_91.move_task = nil
            L3_94 = RAC_stopNpcMoveTask
            L4_95 = L1_92
            L3_94(L4_95)
          end
          L3_94 = A0_91.loop_task
          if L3_94 ~= nil then
            L3_94 = A0_91.loop_task
            L4_95 = L3_94
            L3_94 = L3_94.abort
            L3_94(L4_95)
            A0_91.loop_task = nil
          end
          L3_94 = Player
          L4_95 = L3_94
          L3_94 = L3_94.setStay
          L3_94(L4_95, true)
          L3_94 = Fn_userCtrlAllOff
          L3_94()
          L3_94 = invokeTask
          function L4_95()
            while true do
              Player:setLookAtIk(true, 1, _sm44_other_puppets[L3_88]:getWorldPos())
              wait()
            end
          end
          L3_94 = L3_94(L4_95)
          A0_91.turn_task = L3_94
          L3_94 = RandI
          L4_95 = 1
          L3_94 = L3_94(L4_95, 3)
          L4_95 = invokeTask
          L4_95 = L4_95(function()
            if L3_94 == 1 then
              sm44_CaptionView("sm44_09007", nil, false)
            elseif L3_94 == 2 then
              sm44_CaptionView("sm44_09008", nil, false)
            else
              sm44_CaptionView("sm44_09009", nil, false)
            end
            Fn_turnNpc(L1_92, nil, nil, true)
          end)
          A0_91.npc_turn_task = L4_95
          L4_95 = nil
          if Fn_getRandamNpcType(L1_92) == "man07" then
            L4_95 = "m29_901"
          else
            L4_95 = "m31_901"
          end
          Sound:playSE(L4_95, 1, "", _sm44_other_puppets[L3_88])
          A0_91.lookat_task = RAC_LookAtObject(_sm44_other_puppets[L3_88], SM44_AIMING_OFFSET)
          waitSeconds(2)
          while A0_91.npc_turn_task ~= nil and A0_91.npc_turn_task:isRunning() and A0_91.lookat_task ~= nil and A0_91.lookat_task:isRunning() do
            wait()
          end
          if A0_91.turn_task ~= nil then
            A0_91.turn_task:abort()
            A0_91.turn_task = nil
            Player:setLookAtIk(false, 1, Vector(0, 0, 0))
          end
          if A0_91.npc_turn_task ~= nil then
            A0_91.npc_turn_task:abort()
            A0_91.npc_turn_task = nil
          end
          if A0_91.lookat_task ~= nil then
            A0_91.lookat_task:abort()
            A0_91.lookat_task = nil
          end
          Fn_playMotionNpc(L1_92, "stay", false)
          Fn_playPlayerMotion("kit01_sm44_greeting_00", 0, 0.2, true)
          if L3_94 == 1 then
            sm44_CaptionView("sm44_09010", 2)
          elseif L3_94 == 2 then
            sm44_CaptionView("sm44_09011", 2)
          else
            sm44_CaptionView("sm44_09012", 2)
          end
          Fn_playMotionNpc(L1_92, "stay", false)
          _sm44_player_busy_flag = false
          _sm44_player_invincible_time = SM44_INVINCIBLE_TIME_MAX
          _sm44_player_invincible_flag = true
          Player:setStay(false)
          Fn_userCtrlOn()
          sm44_HintCaptionOn()
        end
      end
    end
    L4_89.update = L5_90
    function L5_90(A0_98)
      if A0_98.loop_task ~= nil then
        A0_98.loop_task:abort()
        A0_98.loop_task = nil
      end
      if A0_98.move_task ~= nil then
        A0_98.move_task:abort()
        A0_98.move_task = nil
        RAC_stopNpcMoveTask(other_name)
      end
      if A0_98.turn_task ~= nil then
        A0_98.turn_task:abort()
        A0_98.turn_task = nil
        Player:setLookAtIk(false, 1, Vector(0, 0, 0))
      end
      if A0_98.npc_turn_task ~= nil then
        A0_98.npc_turn_task:abort()
        A0_98.npc_turn_task = nil
      end
      if A0_98.lookat_task ~= nil then
        A0_98.lookat_task:abort()
        A0_98.lookat_task = nil
      end
    end
    L4_89.destractor = L5_90
    L5_90 = _sm44_other_task
    L5_90[L3_88] = RAC_InvokeTaskWithDestractor(L4_89.update, L4_89.destractor, L4_89)
    break
  end
end
sm44_startOther = L0_0
function L0_0(A0_99)
  local L1_100, L2_101, L3_102, L4_103
  for L4_103 = 1, #L2_101 do
    Fn_setNpcActive("other" .. string.format("%02d", L4_103), A0_99)
  end
end
sm44_setOtherActive = L0_0
function L0_0()
  Fn_playPlayerMotion("kit01_sm44_greeting_00", 0, 0.2, true)
end
sm44_setKittenCansel = L0_0
function L0_0(A0_104, A1_105, A2_106)
  if A0_104 == 1 then
    if sm44_GetClearNum() == 1 then
      sm44_CaptionView("sm44_09013")
      sm44_CaptionView("sm44_09014")
    elseif sm44_GetClearNum() == 2 then
      sm44_CaptionView("sm44_09015")
      sm44_CaptionView("sm44_09016")
    else
      sm44_CaptionView("sm44_09017")
      Fn_playMotionNpc(A1_105, A2_106, false)
      Fn_captionViewWait("sm44_09018")
      Fn_captionViewWait("sm44_09019")
    end
  elseif A0_104 == 2 then
    if sm44_GetClearNum() == 1 then
      sm44_CaptionView("sm44_09020")
      sm44_CaptionView("sm44_09021")
    elseif sm44_GetClearNum() == 2 then
      sm44_CaptionView("sm44_09022")
      sm44_CaptionView("sm44_09023")
    else
      sm44_CaptionView("sm44_09024")
      Fn_playMotionNpc(A1_105, A2_106, false)
      Fn_captionViewWait("sm44_09025")
      Fn_captionViewWait("sm44_09026")
      Fn_captionViewWait("sm44_09027")
      Fn_setBgmPoint("event", "chase_end")
    end
  elseif sm44_GetClearNum() == 1 then
    sm44_CaptionView("sm44_09028")
    sm44_CaptionView("sm44_09029")
  elseif sm44_GetClearNum() == 2 then
    sm44_CaptionView("sm44_09030")
    sm44_CaptionView("sm44_09031")
  else
    sm44_CaptionView("sm44_09032")
    sm44_CaptionView("sm44_09033")
  end
end
sm44_displayCancelCapture = L0_0
function L0_0()
  sm44_CaptionView("sm44_09034")
  sm44_CaptionView("sm44_09035")
end
sm44_displayFailureCaptionFound = L0_0
function L0_0()
  sm44_StopFather()
  Fn_turnNpc(_sm44_father_name, Fn_sendEventComSb("sm44_findGameObject2", "Node", "locator2_father_" .. _sm44_father_target .. "_gate"), nil, true)
  Fn_playMotionNpc(_sm44_father_name, "auj01_glad_00", false)
  sm44_CaptionView("sm44_09036")
  sm44_CaptionView("sm44_09037")
end
sm44_displayFailureCaptionVisiting = L0_0
function L0_0(A0_107, A1_108)
  if A1_108 then
    if not _sm44_shop_marker_playin[RAC_getTailNumber(A0_107, 2)] then
      _sm44_shop_marker[RAC_getTailNumber(A0_107, 2)]:playIn()
    end
  elseif _sm44_shop_marker_playin[RAC_getTailNumber(A0_107, 2)] then
    _sm44_shop_marker[RAC_getTailNumber(A0_107, 2)]:playOut()
  end
  _sm44_shop_marker_playin[RAC_getTailNumber(A0_107, 2)] = A1_108
end
sm44_setMapMaker = L0_0
function L0_0(A0_109)
  Sound:setGlobalVariable("voice_type", "radio")
  Sound:playSE(A0_109)
  invokeTask(function()
    waitSeconds(1)
    Sound:setGlobalVariable("voice_type", "normal")
  end)
end
PlaySeRadio = L0_0
function L0_0(A0_110, A1_111, A2_112, A3_113)
  if sm44_IsFatherArrival() then
    if Fn_sendEventComSb("sm44_IsPlayerArrivalShop", sm44_GetFatherTarget()) then
      if sm44_IsFindedGravity() or Player:isGravityControlMode() then
        invokeTask(function()
          Fn_turnNpc(A1_111, nil, nil, true)
        end)
        sm44_displayFailureCaptionFound()
        Fn_blackout()
        sm44_RetryGame()
        HUD:counter99_99SetNum(sm44_GetClearNum())
        Player:setStay(false)
        Fn_fadein()
        Fn_userCtrlOn()
      else
        invokeTask(function()
          Fn_turnNpc(A1_111, Fn_sendEventComSb("sm44_findGameObject2", "Node", "locator2_father_" .. _sm44_father_target .. "_gate"), nil, true)
        end)
        sm44_CountUpClearNum()
        HUD:counter99_99SetNum(sm44_GetClearNum())
        sm44_setKittenCansel()
        sm44_displayCancelCapture(A0_110, A1_111, A2_112)
        if A3_113 > sm44_GetClearNum() then
          Player:setLookAtIk(false, 1, Vector(0, 0, 0))
          Player:setStay(false)
          sm44_NextGame()
        else
          return true
        end
      end
    else
      sm44_displayFailureCaptionVisiting()
      Fn_blackout()
      sm44_RetryGame()
      HUD:counter99_99SetNum(sm44_GetClearNum())
      Player:setStay(false)
      Fn_fadein()
      Fn_userCtrlOn()
    end
  else
    invokeTask(function()
      Fn_turnNpc(A1_111, nil, nil, true)
    end)
    sm44_displayFailureCaptionFound()
    Fn_blackout()
    sm44_RetryGame()
    HUD:counter99_99SetNum(sm44_GetClearNum())
    Player:setStay(false)
    Fn_fadein()
    Fn_userCtrlOn()
  end
  return false
end
FatherArrivalCheck = L0_0
