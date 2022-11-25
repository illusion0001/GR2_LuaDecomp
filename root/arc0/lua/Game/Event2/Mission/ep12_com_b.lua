dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/lithograph_controller.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
_statusEP12 = "aisle"
_mission_part = nil
_before_part = nil
_next_part = nil
_litho_max = 7
mine_name = "ep12_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_area_ctrls = {}
_progress_area_tbl = {
  ep12_c = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_d = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_e = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_f = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_g = {
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_h = {
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_i = {
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_j = {
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_k = {
    false,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep12_l = {
    false,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep12_m = {
    false,
    false,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep12_n = {
    false,
    false,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep12_o = {
    false,
    false,
    false,
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep12_p = {
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    true,
    false,
    false
  },
  ep12_q = {
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    true,
    false,
    false
  },
  ep12_r = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    false
  },
  ep12_s = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    false
  },
  ep12_t = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    false
  },
  ep12_u = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true
  },
  ep12_v = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true
  },
  ep12_w = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true
  }
}
_request_area_manager = true
_area_manege = false
_area_manage_part = nil
_debug_flag = false
_debug_aisle_enemy = nil
_debug_status_now = nil
_debug_status_pre = nil
_debug_navi = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  L1_1 = Fn_getGameObject
  L1_1 = L1_1(L2_2)
  L2_2()
  _litho_ctrls = nil
  L6_6 = _guide_eff_table
  _litho_ctrls = L2_2
  for L5_5, L6_6 in L2_2(L3_3) do
    if L6_6 ~= false then
      L10_10 = " *****"
      L7_7(L8_8)
      for L10_10 = 1, _num_shutter do
      end
    end
  end
  _ciheavyarmor = L3_3
  L6_6 = _ciheavyarmor
  _eff_ciheavyarmor = L3_3
  if L2_2 ~= nil then
    L6_6 = -1
    L10_10 = L4_4(L5_5, L6_6)
    if L3_3 < L4_4 then
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
    end
  elseif L2_2 ~= nil then
    L6_6 = -1
    L10_10 = L4_4(L5_5, L6_6)
    if L3_3 == L4_4 then
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
    end
  elseif L2_2 ~= nil then
    L6_6 = -1
    L10_10 = L4_4(L5_5, L6_6)
    if L3_3 > L4_4 then
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
      L3_3(L4_4, L5_5)
    end
  end
  for L6_6 = 1, _num_shutter do
    if L7_7 ~= nil then
      L10_10 = string
      L10_10 = L10_10.sub
      L10_10 = L10_10(L7_7, -2)
      L10_10 = "***** VisibleBlock : "
      L10_10 = L10_10 .. L8_8 .. " *****"
      L9_9(L10_10)
      L10_10 = "GimmickBg"
      L10_10 = L9_9
      L9_9(L10_10, false)
    end
  end
  _table_max = L3_3
  L6_6 = _addGravityOre
  L3_3(L4_4, L5_5, L6_6)
  repeat
    L3_3()
  until L3_3
end
function Ingame()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16
  L0_11 = partCheck
  L0_11()
  L0_11 = invokeTask
  L0_11 = L0_11(L1_12)
  _amb_sound_task = L0_11
  L0_11 = _crow_set
  if L0_11 == false then
    L0_11 = print
    L0_11(L1_12)
    L0_11 = Fn_spawnSuppotCrow
    L4_15 = _mission_part
    L0_11 = L0_11(L1_12, L2_13, L3_14)
    _puppet_crow = L0_11
    L0_11 = _puppet_crow
    L0_11 = L0_11.getBrain
    L0_11 = L0_11(L1_12)
    _brain_crow = L0_11
    _crow_set = true
  end
  L0_11 = _debug_flag
  if L0_11 == true then
    L0_11 = invokeTask
    L0_11(L1_12)
  end
  L0_11 = invokeTask
  L0_11(L1_12)
  L0_11 = invokeTask
  L0_11(L1_12)
  L0_11 = invokeTask
  L0_11(L1_12)
  L0_11 = invokeTask
  L0_11(L1_12)
  L0_11 = invokeTask
  L0_11(L1_12)
  while true do
    L0_11 = _move_request
    if L0_11 == "ANY_MOVE" then
      L0_11 = print
      L0_11(L1_12)
      L0_11 = invokeTask
      L4_15 = _duration
      L5_16 = _hashfunc
      L0_11(L1_12, L2_13, L3_14, L4_15, L5_16, _re_move, "ANY_MOVE")
      L0_11 = rubbleInit
      L0_11()
      _move_request = false
    else
      L0_11 = _move_request
      if L0_11 == "LITHO_MOVE" then
        L0_11 = print
        L0_11(L1_12)
        L0_11 = string
        L0_11 = L0_11.format
        L4_15 = L3_14
        L4_15 = -2
        L5_16 = L2_13(L3_14, L4_15)
        L0_11 = L0_11(L1_12, L2_13, L3_14, L4_15, L5_16, L2_13(L3_14, L4_15))
        repeat
          L1_12()
        until L1_12
        L1_12()
        for L4_15, L5_16 in L1_12(L2_13) do
          if L5_16 ~= false then
            if L5_16 == "aisle_07_02" then
              _num_shutter = 2
            end
            _num_shutter = 4
            if string.find(L5_16, "litho") ~= nil then
              rubbleMove(L5_16, _num_shutter, _duration, _hashfunc, _re_move)
            else
              rubbleMove(L5_16, _num_shutter, _duration, _hashfunc, _re_move, "ANY_MOVE")
            end
          end
        end
        L1_12(L2_13)
        L1_12()
        _move_request = false
      end
    end
    L0_11 = wait
    L0_11()
  end
end
function Finalize()
  azSeUnload()
end
function partCheck()
  _mission_part = Fn_getMissionPart()
  _before_part = string.format("ep12_%s", string.char(string.byte(string.sub(mission_part, -1)) - 1))
  _next_part = string.format("ep12_%s", string.char(string.byte(string.sub(mission_part, -1)) + 1))
end
function statusChengeEp12(A0_17)
  _statusEP12 = A0_17
  print("_statusEP12 >>>> " .. _statusEP12)
end
function requestHandle(A0_18, A1_19)
  if findGameObject2(A0_18, A1_19) == nil then
    return nil
  else
    return (findGameObject2(A0_18, A1_19))
  end
end
_re_move = false
_move_request = false
_move_end = false
_warp_request = false
_warp_end = false
_warp_wall = nil
_shutter_table = {
  ep12_c = {"aisle_01"},
  ep12_d = {"aisle_01"},
  ep12_e = {"litho_01", "alter"},
  ep12_f = {"litho_01", "alter"},
  ep12_g = {"alter"},
  ep12_h = {false},
  ep12_i = {"litho_02", "aisle_03"},
  ep12_j = {"litho_02", "aisle_03"},
  ep12_k = {"litho_03", "aisle_04"},
  ep12_l = {"litho_03", "aisle_04"},
  ep12_m = {"litho_04", "aisle_05"},
  ep12_n = {"litho_04", "aisle_05"},
  ep12_o = {"litho_05"},
  ep12_p = {"litho_05"},
  ep12_q = {
    "litho_06",
    "aisle_07_01"
  },
  ep12_r = {
    "litho_06",
    "aisle_07_01"
  },
  ep12_s = {
    "aisle_07_02"
  },
  ep12_t = {
    "litho_07",
    "movingwall_end"
  },
  ep12_u = {
    "litho_07",
    "movingwall_end"
  },
  ep12_v = {false},
  ep12_w = {false}
}
function rubbleInit()
  local L0_20, L1_21
  _location = nil
  L0_20 = 5
  L1_21 = 0
  _duration = L0_20
  _hashfunc = "EaseInOut"
  _num_shutter = 4
  _re_move = false
  L0_20 = {}
  _rubble_move_table = L0_20
  L0_20 = {}
  _shutter_se_hdl = L0_20
end
function rubbleMove(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27)
  local L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34
  L6_28 = {}
  L7_29 = {}
  L11_33 = " *****"
  L8_30(L9_31)
  for L11_33 = 1, A1_23 do
    L12_34 = wallMove
    L12_34 = L12_34(string.format("shutter_%s_%02d", A0_22, L11_33), A2_24, A3_25, A4_26)
    L6_28[L11_33] = Sound:playSEHandle("ep12_road_open", 1, "", L12_34)
    print("sound start >>> shutter_se_hdl : " .. L6_28[L11_33])
    L7_29[_num_shutter] = false
    invokeTask(checkMoveRubble, L12_34, L11_33, L7_29)
  end
  if A5_27 ~= "ANY_MOVE" then
    for L11_33 = 1, A1_23 do
      repeat
        L12_34 = wait
        L12_34()
        L12_34 = L7_29[A1_23]
      until L12_34
    end
    for L11_33 = 1, A1_23 do
      L12_34 = print
      L12_34("sound stop >>> shutter_se_hdl : " .. L6_28[L11_33])
      L12_34 = Sound
      L12_34 = L12_34.stopSEHandle
      L12_34(L12_34, L6_28[L11_33])
    end
  else
    L8_30(L9_31)
  end
  _move_end = true
end
function checkMoveRubble(A0_35, A1_36, A2_37)
  EventHelper:timerCallback("MoveRubble_count", 3, function()
    local L0_38, L1_39
    L0_38 = A1_36
    A2_37[L0_38] = true
  end)
end
function wallMove(A0_40, A1_41, A2_42, A3_43)
  local L4_44, L5_45, L6_46, L7_47, L8_48, L9_49
  L4_44 = print
  L5_45 = "***** wallMove:"
  L6_46 = A0_40
  L7_47 = " *****"
  L5_45 = L5_45 .. L6_46 .. L7_47
  L4_44(L5_45)
  L4_44 = findGameObject2
  L5_45 = "GimmickBg"
  L6_46 = "bg2_"
  L7_47 = A0_40
  L6_46 = L6_46 .. L7_47
  L4_44 = L4_44(L5_45, L6_46)
  L5_45 = findGameObject2
  L6_46 = "Node"
  L7_47 = "locator2_"
  L8_48 = A0_40
  L7_47 = L7_47 .. L8_48
  L5_45 = L5_45(L6_46, L7_47)
  if L4_44 == nil then
    L6_46 = nil
    return L6_46
  end
  if A3_43 == true then
    L6_46 = print
    L7_47 = "***** re_move : true *****"
    L6_46(L7_47)
    L6_46 = findGameObject2
    L7_47 = "Node"
    L8_48 = "locator2_"
    L9_49 = A0_40
    L8_48 = L8_48 .. L9_49 .. "_re"
    L6_46 = L6_46(L7_47, L8_48)
    L5_45 = L6_46
  end
  L7_47 = L4_44
  L6_46 = L4_44.getWorldPos
  L6_46 = L6_46(L7_47)
  L8_48 = L4_44
  L7_47 = L4_44.getWorldRot
  L7_47 = L7_47(L8_48)
  L9_49 = L5_45
  L8_48 = L5_45.getWorldPos
  L8_48 = L8_48(L9_49)
  L9_49 = L5_45.getWorldRot
  L9_49 = L9_49(L5_45)
  if A1_41 == nil then
    A1_41 = _duration
  end
  if A2_42 == nil then
    A2_42 = _hashfunc
  end
  L4_44:clearCurve()
  L4_44:appendCurvePoint(L6_46, L7_47, A1_41, A2_42, true)
  L4_44:appendCurvePoint(L8_48, L9_49, A1_41, A2_42, true)
  return L4_44
end
function warpWall(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55
  L2_52 = print
  L3_53 = "***** warpWall:"
  L4_54 = A0_50
  L5_55 = " *****"
  L3_53 = L3_53 .. L4_54 .. L5_55
  L2_52(L3_53)
  L2_52 = findGameObject2
  L3_53 = "GimmickBg"
  L4_54 = "bg2_"
  L5_55 = A0_50
  L4_54 = L4_54 .. L5_55
  L2_52 = L2_52(L3_53, L4_54)
  L3_53 = findGameObject2
  L4_54 = "Node"
  L5_55 = "locator2_"
  L5_55 = L5_55 .. A0_50
  L3_53 = L3_53(L4_54, L5_55)
  if L2_52 == nil then
    L4_54 = nil
    return L4_54
  end
  if A1_51 == true then
    L4_54 = print
    L5_55 = "***** re_move : true *****"
    L4_54(L5_55)
    L4_54 = findGameObject2
    L5_55 = "Node"
    L4_54 = L4_54(L5_55, "locator2_" .. A0_50 .. "_re")
    L3_53 = L4_54
  end
  L5_55 = L3_53
  L4_54 = L3_53.getWorldPos
  L4_54 = L4_54(L5_55)
  L5_55 = L3_53.getWorldRot
  L5_55 = L5_55(L3_53)
  L2_52:setWorldTransform(L4_54, L5_55)
  _warp_end = true
  return L2_52
end
function closeShutter(A0_56)
  if A0_56 == nil then
    A0_56 = false
  end
  partCheck()
  invokeTask(function()
    local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66
    for L3_60, L4_61 in L0_57(L1_58) do
      if L4_61 ~= false and L4_61 ~= "movingwall_end" then
        L5_62 = print
        L9_66 = L4_61
        L5_62(L6_63)
        L5_62 = 4
        if L4_61 == "aisle_07_02" then
          L5_62 = 2
        elseif L4_61 == "boss" then
          L5_62 = 1
        end
        if L6_63 == false then
          L9_66 = L5_62
          L6_63(L7_64, L8_65, L9_66, 1.5, _hashfunc, true, "ANY_MOVE")
        elseif L6_63 == true then
          L9_66 = L5_62
          L6_63(L7_64, L8_65, L9_66, 1.5, _hashfunc, true, "LITHO_MOVE")
        end
        for L9_66 = 1, L5_62 do
          findGameObject2("GimmickBg", string.format("bg2_shutter_%s_%02d", L4_61, L9_66)):setVisibleBlockEnable(false)
        end
        if L6_63 == true then
          repeat
            L6_63()
          until L6_63
        end
      end
    end
  end)
end
function requestMoveRubble(A0_67, A1_68, A2_69, A3_70, A4_71, A5_72)
  print("***** requestMoveRubble *****")
  if not _move_request then
    _move_request = A0_67
    _move_end = false
    for _FORV_9_ = 1, _num_shutter do
      _rubble_move_table[_FORV_9_] = false
    end
    if A0_67 == "ANY_MOVE" then
      _location = A1_68
      _num_shutter = A2_69
      _duration = A3_70
      _hashfunc = A4_71
      if A5_72 ~= nil then
        _re_move = A5_72
      else
        _re_move = false
      end
    end
    return true
  end
  return false
end
function isRubbleMoveEnd()
  local L0_73, L1_74
  L0_73 = _move_end
  return L0_73
end
function requestWarpRubble(A0_75, A1_76)
  print("***** requestWarpRubble *****")
  if not _warp_request then
    _warp_end = false
    _warp_wall = A0_75
    _warp_request = true
    if A1_76 ~= nil then
      _re_move = A1_76
    else
      _re_move = false
    end
    return true
  end
  return false
end
function isRubbleWarpEnd()
  local L0_77, L1_78
  L0_77 = _warp_end
  return L0_77
end
function litho_pre_set()
  local L0_79, L1_80
  L0_79 = print
  L1_80 = "***** litho_pre_set *****"
  L0_79(L1_80)
  L0_79 = statusChengeEp12
  L1_80 = "litho"
  L0_79(L1_80)
  L0_79 = partCheck
  L0_79()
  L0_79 = tonumber
  L1_80 = string
  L1_80 = L1_80.sub
  L1_80 = L1_80(getCurrentLithographName(), -2)
  L0_79 = L0_79(L1_80, L1_80(getCurrentLithographName(), -2))
  L1_80 = string
  L1_80 = L1_80.format
  L1_80 = L1_80("locator2_crow_sd_litho_%02d", L0_79)
  print(L1_80)
  _brain_crow:resetExceptAbility()
  _brain_crow:setIdling(true)
  requestCrowWarp(L1_80, "ground")
  invokeTask(function()
    repeat
      wait()
    until isCrowMoveEnd()
    _brain_crow:setIdling(false)
  end)
  closeShutter(false)
end
function litho_pre_set2()
  print("***** litho_pre_set *****")
  statusChengeEp12("litho")
  _brain_crow:resetExceptAbility()
  closeShutter(false)
end
_progress_table = {
  ep12_a = {
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_b = {
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_c = {
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_d = {
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_e = {
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_f = {
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_g = {
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_h = {
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep12_i = {
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep12_j = {
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep12_k = {
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep12_l = {
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep12_m = {
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep12_n = {
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep12_o = {
    true,
    true,
    true,
    true,
    true,
    false,
    false
  },
  ep12_p = {
    true,
    true,
    true,
    true,
    true,
    false,
    false
  },
  ep12_q = {
    true,
    true,
    true,
    true,
    true,
    true,
    false
  },
  ep12_r = {
    true,
    true,
    true,
    true,
    true,
    true,
    false
  },
  ep12_s = {
    true,
    true,
    true,
    true,
    true,
    true,
    false
  },
  ep12_t = {
    true,
    true,
    true,
    true,
    true,
    true,
    true
  },
  ep12_u = {
    true,
    true,
    true,
    true,
    true,
    true,
    true
  },
  ep12_v = {
    true,
    true,
    true,
    true,
    true,
    true,
    true
  },
  ep12_w = {
    true,
    true,
    true,
    true,
    true,
    true,
    true
  }
}
_mission_text_table = {
  {text = "ep12_09001", se = "skb_003"},
  {text = "ep12_09002", se = "skb_003"},
  {text = "ep12_09003", se = "skb_003"},
  {text = "ep12_09004", se = "skb_003"},
  {text = "ep12_09005", se = "skb_001"},
  {text = "ep12_09006", se = "skb_002"},
  {text = "ep12_09007", se = "skb_002"}
}
_guide_eff_table = {
  "ef_ev_hndpar04_01",
  "ef_ev_hndpar04_02",
  "ef_ev_hndpar04_03",
  "ef_ev_hndpar04_04",
  "ef_ev_hndpar04_05",
  "ef_ev_hndpar04_06",
  "ef_ev_hndpar04_07"
}
_demo_table = {
  {
    first_half = {
      warp = "locator2_pc_sd_litho_01",
      func = litho_pre_set,
      cut1 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_01",
      cut1 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_aim"
      },
      cut2 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_hand_01_aim"
      },
      cut3 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_rubble_aim"
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_aim"
      }
    }
  },
  {
    first_half = {
      func = litho_pre_set2
    },
    second_half = {
      warp = "locator2_pc_sd_litho_02",
      cut1 = {
        cam = "locator2_litho_02_cam",
        aim = "locator2_litho_02_aim"
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_02_cam",
        aim = "locator2_litho_02_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_03",
      func = litho_pre_set,
      cut1 = {
        cam = "locator2_litho_03_cam",
        aim = "locator2_litho_03_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_03",
      cut1 = {
        cam = "locator2_litho_03_cam_b",
        aim = "locator2_litho_03_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_03_cam",
        aim = "locator2_litho_03_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_04",
      func = litho_pre_set,
      cut1 = {
        cam = "locator2_litho_04_cam",
        aim = "locator2_litho_04_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_04",
      cut1 = {
        cam = "locator2_litho_04_cam_b",
        aim = "locator2_litho_04_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_04_cam",
        aim = "locator2_litho_04_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_05",
      func = litho_pre_set,
      cut1 = {
        cam = "locator2_litho_05_cam",
        aim = "locator2_litho_05_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_05_b",
      cut1 = {
        cam = "locator2_litho_05_cam_b",
        aim = "locator2_litho_05_aim_b"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_05_cam",
        aim = "locator2_litho_05_aim"
      }
    }
  },
  {
    first_half = {
      func = litho_pre_set2
    },
    second_half = {
      warp = "locator2_pc_sd_litho_06_end",
      cut1 = {
        cam = "locator2_litho_06_cam",
        aim = "locator2_litho_06_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_06_cam_failure",
        aim = "locator2_litho_06_aim_failure"
      }
    }
  },
  {
    first_half = {
      func = litho_pre_set2
    },
    second_half = {
      warp = "locator2_pc_sd_litho_07_b",
      cut1 = {
        cam = "locator2_litho_07_cam_b",
        aim = "locator2_litho_07_aim_b"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_07_cam",
        aim = "locator2_litho_07_aim"
      }
    }
  }
}
function Lithograph_OnInitialize(A0_81)
  local L1_82, L2_83
  if A0_81 ~= nil then
    L1_82 = Fn_getMissionPart
    L1_82 = L1_82()
    L2_83 = A0_81.getName
    L2_83 = L2_83(A0_81)
    return _progress_table[L1_82][tonumber(string.sub(L2_83, -2))]
  end
  L1_82 = false
  return L1_82
end
function isLithographStart()
  return _litho_ctrls:isLithographStart()
end
function setFirstHalfProcessEnd()
  _litho_ctrls:setFirstHalfProcessEnd()
end
function isFirstHalfProcessEnd()
  return _litho_ctrls:isFirstHalfProcessEnd()
end
function missionComplete()
  invokeTask(function()
    _brain_crow:resetExceptAbility()
    repeat
      wait()
    until requestMoveRubble("LITHO_MOVE")
    _litho_ctrls:missionComplete()
  end)
end
function setSecondHalfProcessEnd()
  _litho_ctrls:setSecondHalfProcessEnd()
end
function isSecondHalfProcessEnd()
  return _litho_ctrls:isSecondHalfProcessEnd()
end
function missionFailure()
  invokeTask(function()
    _brain_crow:resetExceptAbility()
    _litho_ctrls:missionFailure()
  end)
end
function isFailureProcessEnd()
  return _litho_ctrls:isFailureProcessEnd()
end
function getCurrentLithographName()
  return _litho_ctrls:getCurrentLithographName()
end
function guideEffAllOff()
  return _litho_ctrls:guideEffAllOff()
end
function guideEffOff(A0_84)
  return _litho_ctrls:guideEffOff(A0_84)
end
function azSeUnload()
  return _litho_ctrls:azSeUnload()
end
function isMissionview()
  return _litho_ctrls:isMissionview()
end
function setSecondHalfProcessPre()
  return _litho_ctrls:setSecondHalfProcessPre()
end
function isSecondHalfProcessPreStart()
  return _litho_ctrls:isSecondHalfProcessPreStart()
end
function setSecondHalfProcessPreEnd()
  return _litho_ctrls:setSecondHalfProcessPreEnd()
end
_puppet_crow = nil
_brain_crow = nil
_crow_set = false
_crow_move_request = false
_crow_move_end = false
_crow_move_points = nil
_crow_move_warp = nil
_crow_warp_act = nil
_crow_lead_start = false
_crow_threat_aisle = 30
_crow_threat_def = 100
function requestCrowPuppet()
  local L0_85, L1_86
  L0_85 = _puppet_crow
  return L0_85
end
function requestCrowBrain()
  local L0_87, L1_88
  L0_87 = _brain_crow
  return L0_87
end
function requestCrowSet()
  local L0_89, L1_90
  L0_89 = _crow_set
  return L0_89
end
function crowMoviePos()
  local L0_91, L1_92
  L0_91 = findGameObject2
  L1_92 = "Node"
  L0_91 = L0_91(L1_92, "locator2_crow_movie_pos")
  L1_92 = L0_91
  L0_91 = L0_91.getWorldTransform
  L1_92 = L0_91(L1_92)
  _brain_crow:warp(L0_91, L1_92)
end
function crowMovePoints()
  local L0_93
  L0_93 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Takeoff,
      vel = 10
    },
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = findGameObject2("Node", _crow_move_points):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = findGameObject2("Node", _crow_move_points):getWorldPos(),
      action = Supporter.MovePoint.Idle,
      vel = 10
    }
  }
  _brain_crow:setMovePoints(L0_93)
  _brain_crow:startMovePoint()
  repeat
    wait()
  until _brain_crow:isMovePointEnd()
  _brain_crow:clearMovePoint()
  _crow_move_points = nil
  return true
end
function crowMoveWarp()
  local L0_94, L1_95
  L0_94 = findGameObject2
  L1_95 = "Node"
  L0_94 = L0_94(L1_95, _crow_move_warp)
  L1_95 = L0_94
  L0_94 = L0_94.getWorldTransform
  L1_95 = L0_94(L1_95)
  _brain_crow:resetExceptAbility()
  if _crow_warp_act == nil or _crow_warp_act == "air" then
    _crow_warp_act = Supporter.FirstAction.Air
  elseif _crow_warp_act == "ground" then
    _crow_warp_act = Supporter.FirstAction.Ground
  end
  _brain_crow:warp(L0_94, L1_95, _crow_warp_act)
  wait()
  _crow_move_warp = nil
  _crow_warp_act = nil
  return true
end
function crowLeadStart()
  invokeTask(function()
    local L0_96
    L0_96 = print
    L0_96("***** corw LeadStart *****")
    L0_96 = {
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_01"),
        action = Supporter.MovePoint.Air,
        vel = 15
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_02"),
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_03"),
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_04"),
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_05"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_06"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_07"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_08"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_09"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_10"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_11"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_12"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_13"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_14"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_15"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_16"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_17"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_18"),
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_19"),
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_20"),
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_21"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_22"),
        action = Supporter.MovePoint.Air,
        vel = 8.5
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_23"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_24"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_25"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_26"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_27"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_28"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_29"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_30"),
        action = Supporter.MovePoint.Air,
        vel = 11
      },
      {
        node = findGameObject2("Node", "locator2_crow_lead_pos_30"),
        action = Supporter.MovePoint.Idle,
        vel = 11
      }
    }
    _brain_crow:setMovePoints(L0_96)
    _brain_crow:startMovePoint()
    while true do
      if _brain_crow:isMovePointEnd() then
        _brain_crow:clearMovePoint()
      end
      wait()
    end
    print("crow move end")
    _brain_crow:resetExceptAbility()
    _brain_crow:setIdling(true)
  end)
end
function requestCrowMove(A0_97)
  if not _crow_move_request then
    print("***** requestCrowMove *****")
    _crow_move_points = A0_97
    _crow_move_request = true
    _crow_move_end = false
    return true
  end
  return false
end
function requestCrowWarp(A0_98, A1_99)
  if not _crow_move_request then
    print("***** requestCrowWarp *****")
    _crow_move_warp = A0_98
    _crow_warp_act = A1_99
    _crow_move_request = true
    _crow_move_end = false
    return true
  end
  return false
end
function isCrowMoveEnd()
  local L0_100, L1_101
  L0_100 = _crow_move_end
  return L0_100
end
_objfall_request = false
_aisle_name = nil
_aisle_no = nil
_fall_point = nil
_wait_time = nil
_fall_se_hdl = nil
_table_max = 0
_fallobj_table = {
  "az4_breakableobj_a",
  "az4_breakableobj_b",
  "az4_breakableobj_c",
  "box_ms_01",
  "box_ms_02",
  "barrel_kk_01",
  "pot_kk_04",
  "steeldrum_kk_01"
}
_fall_order_01 = {
  {
    obj = "az4_breakableobj_b",
    point = 1,
    wait_time = 1
  },
  {
    obj = "steeldrum_kk_01",
    point = 7,
    wait_time = 0.5
  },
  {
    obj = "az4_rubble_07",
    point = 5,
    wait_time = 0.5
  },
  {
    obj = "steeldrum_kk_01",
    point = 8,
    wait_time = 2
  },
  {
    obj = "az4_rubble_01",
    point = 6,
    wait_time = 0.5
  },
  {
    obj = "az4_breakableobj_b",
    point = 3,
    wait_time = 3
  },
  {
    obj = "az4_rubble_02",
    point = 9,
    wait_time = 0.5
  },
  {
    obj = "barrel_kk_01",
    point = 4,
    wait_time = 0.5
  },
  {
    obj = "az4_rubble_03",
    point = 5,
    wait_time = 1
  },
  {
    obj = "az4_rubble_04",
    point = 1,
    wait_time = 1
  },
  {
    obj = "barrel_kk_01",
    point = 3,
    wait_time = 0.5
  },
  {
    obj = "steeldrum_kk_01",
    point = 6,
    wait_time = 2
  },
  {
    obj = "az4_breakableobj_b",
    point = 4,
    wait_time = 1
  },
  {
    obj = "az4_rubble_05",
    point = 5,
    wait_time = 0.5
  },
  {
    obj = "az4_breakableobj_b",
    point = 2,
    wait_time = 1
  },
  {
    obj = "az4_rubble_06",
    point = 1,
    wait_time = 1
  }
}
function fallObjRandom()
  return _fallobj_table[RandI(_table_max)]
end
function objFallRand()
  local L0_102, L1_103, L2_104, L3_105, L4_106, L5_107, L6_108, L7_109
  L0_102 = _aisle_no
  L0_102 = L0_102 - 2
  if L0_102 <= 0 then
    L0_102 = 1
  end
  L1_103 = _aisle_no
  L1_103 = L1_103 - 2
  L2_104 = RandI
  L2_104 = L2_104(L3_105, L4_106)
  L6_108 = 1
  L7_109 = ""
  _fall_se_hdl = L3_105
  for L6_108 = 1, L2_104 do
    L7_109 = RandI
    L7_109 = L7_109(_fall_point)
    Fn_createGimmickBg(string.format("locator2_%s_fall_point_%02d", _aisle_name, L7_109), "fall_objcet", fallObjRandom()):pushJob(nil, "N", 0, "D")
    waitSeconds(_wait_time)
  end
  _aisle_name = nil
  _aisle_no = nil
  _fall_point = nil
  _wait_time = nil
end
function objFallOrder()
  local L0_110, L1_111, L2_112, L3_113
  for L3_113 = 1, _aisle_no do
    for _FORV_7_, _FORV_8_ in ipairs(_fall_order_01) do
      print(string.format("locator2_%s_fall_point_%02d", _aisle_name, _FORV_8_.point))
      create_gimmickbg(string.format("locator2_%s_fall_point_%02d", _aisle_name, _FORV_8_.point), _FORV_8_.obj):pushJob(nil, "N", 0, "D")
      waitSeconds(_FORV_8_.wait_time)
    end
  end
end
function requestObjFall(A0_114, A1_115, A2_116, A3_117, A4_118)
  if not _objfall_request then
    _objfall_request = true
    _aisle_name = A0_114
    _aisle_no = A1_115
    _fall_point = A2_116
    _wait_time = A3_117
    _fall_type = A4_118
    print("_fall_type" .. _fall_type)
    return true
  end
  return false
end
function create_gimmickbg(A0_119, A1_120)
  local L2_121, L3_122
  L2_121 = createGameObject2
  L3_122 = "GimmickBg"
  L2_121 = L2_121(L3_122)
  L3_122 = L2_121.setName
  L3_122(L2_121, "fall_objcet")
  L3_122 = L2_121.setDrawModelName
  L3_122(L2_121, A1_120)
  L3_122 = L2_121.setAttributeName
  L3_122(L2_121, A1_120)
  L3_122 = L2_121.setCollisionName
  L3_122(L2_121, A1_120)
  L3_122 = A0_119
  if type(A0_119) == "string" then
    L3_122 = findGameObject2("Node", A0_119)
  end
  if L3_122 then
    if findUpArea(L3_122) then
      findUpArea(L3_122):appendChild(L2_121)
    end
    L2_121:setWorldPos(L3_122:getWorldPos())
    L2_121:setWorldRot(L3_122:getWorldRot() + Vector(RandI(-360, 360), RandI(-360, 360), RandI(-360, 360)))
    L2_121:setForceMove()
  end
  L2_121:try_init()
  L2_121:waitForReady()
  L2_121:try_start()
  return L2_121
end
function pccubesensor2_fall_stop_OnEnter(A0_123, A1_124)
  invokeTask(function()
    requestMoveRubble("ANY_MOVE", "fallstop_01", 4, 0.5, "EaseInOut", true)
  end)
end
function pccubesensor2_fall_stop_OnLeave(A0_125, A1_126)
  invokeTask(function()
    requestMoveRubble("ANY_MOVE", "fallstop_01", 4, 0.5, "EaseInOut", false)
  end)
end
_enemy_aisle_tbl = {
  ep12_c = {
    "aisle_01_01"
  },
  ep12_d = {
    "aisle_01_01"
  },
  ep12_e = {
    "aisle_02_01"
  },
  ep12_f = {
    "aisle_02_01"
  },
  ep12_g = {},
  ep12_h = {},
  ep12_i = {
    "aisle_03_01",
    "aisle_03_02"
  },
  ep12_j = {
    "aisle_03_01"
  },
  ep12_k = {
    "aisle_04_01",
    "aisle_04_02",
    "aisle_04_03"
  },
  ep12_l = {
    "aisle_04_01",
    "aisle_04_02"
  },
  ep12_m = {
    "aisle_05_01",
    "aisle_05_02"
  },
  ep12_n = {
    "aisle_05_01",
    "aisle_05_02"
  },
  ep12_o = {
    "aisle_06_01"
  },
  ep12_p = {},
  ep12_q = {},
  ep12_r = {},
  ep12_s = {},
  ep12_t = {},
  ep12_u = {},
  ep12_v = {},
  ep12_w = {}
}
enemy_handle_table = {
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil
}
enemy_marker_table = {
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
}
enmgen_aisle_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_aisle_01_01_01",
      name = "enm_aisle_01_01"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_01_01_02",
      name = "enm_aisle_01_02"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_01_01_03",
      name = "enm_aisle_01_03"
    },
    {
      type = "stalker",
      locator = "locator_aisle_01_01_04",
      name = "enm_aisle_01_04"
    },
    {
      type = "stalker",
      locator = "locator_aisle_01_01_05",
      name = "enm_aisle_01_05"
    },
    {
      type = "stalker",
      locator = "locator_aisle_01_01_06",
      name = "enm_aisle_01_06"
    },
    {
      type = "stalker",
      locator = "locator_aisle_01_01_07",
      name = "enm_aisle_01_07"
    }
  },
  onUpdate = function(A0_127)
    local L1_128
  end,
  onEnter = function(A0_129)
    local L1_130
  end,
  onLeave = function(A0_131)
    local L1_132
  end,
  onSpawn = function(A0_133, A1_134)
    A0_133:getSpecTable().enemyDeadNum = A0_133:getSpecTable().enemyDeadNum - 1
    if A0_133:getSpecTable().enemyDeadNum < 0 then
      A0_133:getSpecTable().enemyDeadNum = 0
    end
    A0_133:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_135, A1_136)
  end,
  onObjectAsh = function(A0_137, A1_138)
    A0_137:getSpecTable().enemyDeadNum = A0_137:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_139)
    return #A0_139.spawnSet
  end,
  getEnemyDeadNum = function(A0_140)
    local L1_141
    L1_141 = A0_140.enemyDeadNum
    return L1_141
  end,
  isEnemyAllDead = function(A0_142)
    local L2_143
    L2_143 = A0_142.enemyDeadNum
    L2_143 = L2_143 >= #A0_142.spawnSet
    return L2_143
  end
}
enmgen_aisle_02_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_aisle_02_01_01",
      name = "enm_aisle_02_01"
    },
    {
      type = "stalker",
      locator = "locator_aisle_02_01_02",
      name = "enm_aisle_02_02"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_02_01_03",
      name = "enm_aisle_02_03"
    },
    {
      type = "stalker",
      locator = "locator_aisle_02_01_04",
      name = "enm_aisle_02_04"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_02_01_05",
      name = "enm_aisle_02_05"
    },
    {
      type = "stalker",
      locator = "locator_aisle_02_01_06",
      name = "enm_aisle_02_06"
    },
    {
      type = "stalker",
      locator = "locator_aisle_02_01_07",
      name = "enm_aisle_02_07"
    },
    {
      type = "stalker",
      locator = "locator_aisle_02_01_08",
      name = "enm_aisle_02_08"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_02_01_09",
      name = "enm_aisle_02_09"
    }
  },
  onUpdate = function(A0_144)
    local L1_145
  end,
  onEnter = function(A0_146)
    local L1_147
  end,
  onLeave = function(A0_148)
    local L1_149
  end,
  onSpawn = function(A0_150, A1_151)
    A0_150:getSpecTable().enemyDeadNum = A0_150:getSpecTable().enemyDeadNum - 1
    if A0_150:getSpecTable().enemyDeadNum < 0 then
      A0_150:getSpecTable().enemyDeadNum = 0
    end
    A0_150:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_152, A1_153)
  end,
  onObjectAsh = function(A0_154, A1_155)
    A0_154:getSpecTable().enemyDeadNum = A0_154:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_156, A1_157)
    Fn_enemyPopGemSetup(A0_156, {
      "enm_aisle_02_02"
    }, 1, 5, "b1")
    Fn_enemyPopGemSetup(A0_156, {
      "enm_aisle_02_06"
    }, 1, 5, "b2")
  end,
  onPopGem = function(A0_158, A1_159)
    Fn_enemyAshPopGem(A0_158, A1_159, {"b1", "b2"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_160)
    return #A0_160.spawnSet
  end,
  getEnemyDeadNum = function(A0_161)
    local L1_162
    L1_162 = A0_161.enemyDeadNum
    return L1_162
  end,
  isEnemyAllDead = function(A0_163)
    local L2_164
    L2_164 = A0_163.enemyDeadNum
    L2_164 = L2_164 >= #A0_163.spawnSet
    return L2_164
  end
}
enmgen_aisle_03_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_aisle_03_01_01",
      name = "enm_aisle_03_01"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_03_01_02",
      name = "enm_aisle_03_02"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_01_03",
      name = "enm_aisle_03_03"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_01_04",
      name = "enm_aisle_03_04"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_01_05",
      name = "enm_aisle_03_05"
    }
  },
  onUpdate = function(A0_165)
    local L1_166
  end,
  onEnter = function(A0_167)
    local L1_168
  end,
  onLeave = function(A0_169)
    local L1_170
  end,
  onSpawn = function(A0_171, A1_172)
    A0_171:getSpecTable().enemyDeadNum = A0_171:getSpecTable().enemyDeadNum - 1
    if A0_171:getSpecTable().enemyDeadNum < 0 then
      A0_171:getSpecTable().enemyDeadNum = 0
    end
    A0_171:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_173, A1_174)
  end,
  onObjectAsh = function(A0_175, A1_176)
    A0_175:getSpecTable().enemyDeadNum = A0_175:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_177, A1_178)
    Fn_enemyPopGemSetup(A0_177, {
      "enm_aisle_03_01"
    }, 1, 5, "b1")
    Fn_enemyPopGemSetup(A0_177, {
      "enm_aisle_03_02"
    }, 1, 5, "b2")
  end,
  onPopGem = function(A0_179, A1_180)
    Fn_enemyAshPopGem(A0_179, A1_180, {"b1", "b2"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_181)
    return #A0_181.spawnSet
  end,
  getEnemyDeadNum = function(A0_182)
    local L1_183
    L1_183 = A0_182.enemyDeadNum
    return L1_183
  end,
  isEnemyAllDead = function(A0_184)
    local L2_185
    L2_185 = A0_184.enemyDeadNum
    L2_185 = L2_185 >= #A0_184.spawnSet
    return L2_185
  end
}
enmgen_aisle_03_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_aisle_03_02_01",
      name = "enm_aisle_03_07"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_02_02",
      name = "enm_aisle_03_08"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_02_03",
      name = "enm_aisle_03_09"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_02_04",
      name = "enm_aisle_03_10"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_02_05",
      name = "enm_aisle_03_11"
    },
    {
      type = "stalker",
      locator = "locator_aisle_03_02_06",
      name = "enm_aisle_03_12"
    }
  },
  onUpdate = function(A0_186)
    local L1_187
  end,
  onEnter = function(A0_188)
    local L1_189
  end,
  onLeave = function(A0_190)
    local L1_191
  end,
  onSpawn = function(A0_192, A1_193)
    A0_192:getSpecTable().enemyDeadNum = A0_192:getSpecTable().enemyDeadNum - 1
    if A0_192:getSpecTable().enemyDeadNum < 0 then
      A0_192:getSpecTable().enemyDeadNum = 0
    end
    A0_192:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_194, A1_195)
  end,
  onObjectAsh = function(A0_196, A1_197)
    A0_196:getSpecTable().enemyDeadNum = A0_196:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_198, A1_199)
    Fn_enemyPopGemSetup(A0_198, {
      "enm_aisle_03_07",
      "enm_aisle_03_08",
      "enm_aisle_03_09",
      "enm_aisle_03_10",
      "enm_aisle_03_11",
      "enm_aisle_03_12"
    }, 6, 5)
  end,
  onPopGem = function(A0_200, A1_201)
    Fn_enemyAshPopGem(A0_200, A1_201)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_202)
    return #A0_202.spawnSet
  end,
  getEnemyDeadNum = function(A0_203)
    local L1_204
    L1_204 = A0_203.enemyDeadNum
    return L1_204
  end,
  isEnemyAllDead = function(A0_205)
    local L2_206
    L2_206 = A0_205.enemyDeadNum
    L2_206 = L2_206 >= #A0_205.spawnSet
    return L2_206
  end
}
enmgen_aisle_04_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_aisle_04_01_01",
      name = "enm_aisle_04_01"
    }
  },
  onUpdate = function(A0_207)
    local L1_208
  end,
  onEnter = function(A0_209)
    local L1_210
  end,
  onLeave = function(A0_211)
    local L1_212
  end,
  onSpawn = function(A0_213, A1_214)
    A0_213:getSpecTable().enemyDeadNum = A0_213:getSpecTable().enemyDeadNum - 1
    if A0_213:getSpecTable().enemyDeadNum < 0 then
      A0_213:getSpecTable().enemyDeadNum = 0
    end
    A0_213:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_215, A1_216)
  end,
  onObjectAsh = function(A0_217, A1_218)
    A0_217:getSpecTable().enemyDeadNum = A0_217:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_219, A1_220)
    Fn_enemyPopGemSetup(A0_219, {
      "enm_aisle_04_01"
    }, 1, 6)
  end,
  onPopGem = function(A0_221, A1_222)
    Fn_enemyAshPopGem(A0_221, A1_222)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_223)
    return #A0_223.spawnSet
  end,
  getEnemyDeadNum = function(A0_224)
    local L1_225
    L1_225 = A0_224.enemyDeadNum
    return L1_225
  end,
  isEnemyAllDead = function(A0_226)
    local L2_227
    L2_227 = A0_226.enemyDeadNum
    L2_227 = L2_227 >= #A0_226.spawnSet
    return L2_227
  end
}
enmgen_aisle_04_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_aisle_04_02_01",
      name = "enm_aisle_04_02"
    },
    {
      type = "stalker",
      locator = "locator_aisle_04_02_02",
      name = "enm_aisle_04_03"
    },
    {
      type = "stalker",
      locator = "locator_aisle_04_02_03",
      name = "enm_aisle_04_04"
    },
    {
      type = "stalker",
      locator = "locator_aisle_04_02_04",
      name = "enm_aisle_04_05"
    },
    {
      type = "stalker",
      locator = "locator_aisle_04_02_05",
      name = "enm_aisle_04_06"
    },
    {
      type = "stalker",
      locator = "locator_aisle_04_02_06",
      name = "enm_aisle_04_07"
    },
    {
      type = "stalker",
      locator = "locator_aisle_04_02_07",
      name = "enm_aisle_04_08"
    }
  },
  onUpdate = function(A0_228)
    local L1_229
  end,
  onEnter = function(A0_230)
    local L1_231
  end,
  onLeave = function(A0_232)
    local L1_233
  end,
  onSpawn = function(A0_234, A1_235)
    A0_234:getSpecTable().enemyDeadNum = A0_234:getSpecTable().enemyDeadNum - 1
    if A0_234:getSpecTable().enemyDeadNum < 0 then
      A0_234:getSpecTable().enemyDeadNum = 0
    end
    A0_234:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_236, A1_237)
  end,
  onObjectAsh = function(A0_238, A1_239)
    A0_238:getSpecTable().enemyDeadNum = A0_238:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_240, A1_241)
    Fn_enemyPopGemSetup(A0_240, {
      "enm_aisle_04_02",
      "enm_aisle_04_03",
      "enm_aisle_04_04",
      "enm_aisle_04_05",
      "enm_aisle_04_06",
      "enm_aisle_04_07",
      "enm_aisle_04_08"
    }, 7, 5)
  end,
  onPopGem = function(A0_242, A1_243)
    Fn_enemyAshPopGem(A0_242, A1_243)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_244)
    return #A0_244.spawnSet
  end,
  getEnemyDeadNum = function(A0_245)
    local L1_246
    L1_246 = A0_245.enemyDeadNum
    return L1_246
  end,
  isEnemyAllDead = function(A0_247)
    local L2_248
    L2_248 = A0_247.enemyDeadNum
    L2_248 = L2_248 >= #A0_247.spawnSet
    return L2_248
  end
}
enmgen_aisle_04_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator_aisle_04_03_01",
      name = "enm_aisle_04_09"
    },
    {
      type = "treecannon",
      locator = "locator_aisle_04_03_02",
      name = "enm_aisle_04_10"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_04_03_03",
      name = "enm_aisle_04_11"
    }
  },
  onUpdate = function(A0_249)
    local L1_250
  end,
  onEnter = function(A0_251)
    local L1_252
  end,
  onLeave = function(A0_253)
    local L1_254
  end,
  onSpawn = function(A0_255, A1_256)
    A0_255:getSpecTable().enemyDeadNum = A0_255:getSpecTable().enemyDeadNum - 1
    if A0_255:getSpecTable().enemyDeadNum < 0 then
      A0_255:getSpecTable().enemyDeadNum = 0
    end
    A0_255:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_257, A1_258)
  end,
  onObjectAsh = function(A0_259, A1_260)
    A0_259:getSpecTable().enemyDeadNum = A0_259:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_261, A1_262)
    Fn_enemyPopGemSetup(A0_261, {
      "enm_aisle_04_09",
      "enm_aisle_04_10",
      "enm_aisle_04_11"
    }, 3, 5)
  end,
  onPopGem = function(A0_263, A1_264)
    Fn_enemyAshPopGem(A0_263, A1_264)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_265)
    return #A0_265.spawnSet
  end,
  getEnemyDeadNum = function(A0_266)
    local L1_267
    L1_267 = A0_266.enemyDeadNum
    return L1_267
  end,
  isEnemyAllDead = function(A0_268)
    local L2_269
    L2_269 = A0_268.enemyDeadNum
    L2_269 = L2_269 >= #A0_268.spawnSet
    return L2_269
  end
}
enmgen_aisle_05_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_aisle_05_01_01",
      name = "enm_aisle_05_01"
    }
  },
  onUpdate = function(A0_270)
    local L1_271
  end,
  onEnter = function(A0_272)
    local L1_273
  end,
  onLeave = function(A0_274)
    local L1_275
  end,
  onSpawn = function(A0_276, A1_277)
    A0_276:getSpecTable().enemyDeadNum = A0_276:getSpecTable().enemyDeadNum - 1
    if A0_276:getSpecTable().enemyDeadNum < 0 then
      A0_276:getSpecTable().enemyDeadNum = 0
    end
    A0_276:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_278, A1_279)
  end,
  onObjectAsh = function(A0_280, A1_281)
    A0_280:getSpecTable().enemyDeadNum = A0_280:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_282, A1_283)
    Fn_enemyPopGemSetup(A0_282, {
      "enm_aisle_05_01"
    }, 1, 5)
  end,
  onPopGem = function(A0_284, A1_285)
    Fn_enemyAshPopGem(A0_284, A1_285)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_286)
    return #A0_286.spawnSet
  end,
  getEnemyDeadNum = function(A0_287)
    local L1_288
    L1_288 = A0_287.enemyDeadNum
    return L1_288
  end,
  isEnemyAllDead = function(A0_289)
    local L2_290
    L2_290 = A0_289.enemyDeadNum
    L2_290 = L2_290 >= #A0_289.spawnSet
    return L2_290
  end
}
enmgen_aisle_05_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_aisle_05_02_01",
      name = "enm_aisle_05_02"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_02",
      name = "enm_aisle_05_03"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_03",
      name = "enm_aisle_05_04"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_04",
      name = "enm_aisle_05_05"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_05",
      name = "enm_aisle_05_06"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_06",
      name = "enm_aisle_05_07"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_07",
      name = "enm_aisle_05_08"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_08",
      name = "enm_aisle_05_09"
    },
    {
      type = "stalker",
      locator = "locator_aisle_05_02_09",
      name = "enm_aisle_05_10"
    }
  },
  onUpdate = function(A0_291)
    local L1_292
  end,
  onEnter = function(A0_293)
    local L1_294
  end,
  onLeave = function(A0_295)
    local L1_296
  end,
  onSpawn = function(A0_297, A1_298)
    A0_297:getSpecTable().enemyDeadNum = A0_297:getSpecTable().enemyDeadNum - 1
    if A0_297:getSpecTable().enemyDeadNum < 0 then
      A0_297:getSpecTable().enemyDeadNum = 0
    end
    A0_297:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_299, A1_300)
  end,
  onObjectAsh = function(A0_301, A1_302)
    A0_301:getSpecTable().enemyDeadNum = A0_301:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_303, A1_304)
    Fn_enemyPopGemSetup(A0_303, {
      "enm_aisle_05_02",
      "enm_aisle_05_03",
      "enm_aisle_05_04",
      "enm_aisle_05_05",
      "enm_aisle_05_06",
      "enm_aisle_05_07",
      "enm_aisle_05_08",
      "enm_aisle_05_09",
      "enm_aisle_05_10"
    }, 9, 5)
  end,
  onPopGem = function(A0_305, A1_306)
    Fn_enemyAshPopGem(A0_305, A1_306)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_307)
    return #A0_307.spawnSet
  end,
  getEnemyDeadNum = function(A0_308)
    local L1_309
    L1_309 = A0_308.enemyDeadNum
    return L1_309
  end,
  isEnemyAllDead = function(A0_310)
    local L2_311
    L2_311 = A0_310.enemyDeadNum
    L2_311 = L2_311 >= #A0_310.spawnSet
    return L2_311
  end
}
enmgen_aisle_06_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_aisle_06_01_01",
      name = "enm_aisle_06_01"
    },
    {
      type = "stalker",
      locator = "locator_aisle_06_01_02",
      name = "enm_aisle_06_02"
    },
    {
      type = "guardcore",
      locator = "locator_aisle_06_01_03",
      name = "enm_aisle_06_03"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_06_01_04",
      name = "enm_aisle_06_04"
    },
    {
      type = "gellyfish",
      locator = "locator_aisle_06_01_05",
      name = "enm_aisle_06_05"
    }
  },
  onUpdate = function(A0_312)
    local L1_313
  end,
  onEnter = function(A0_314)
    local L1_315
  end,
  onLeave = function(A0_316)
    local L1_317
  end,
  onSpawn = function(A0_318, A1_319)
    A0_318:getSpecTable().enemyDeadNum = A0_318:getSpecTable().enemyDeadNum - 1
    if A0_318:getSpecTable().enemyDeadNum < 0 then
      A0_318:getSpecTable().enemyDeadNum = 0
    end
    A0_318:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_320, A1_321)
  end,
  onObjectAsh = function(A0_322, A1_323)
    A0_322:getSpecTable().enemyDeadNum = A0_322:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_324)
    return #A0_324.spawnSet
  end,
  getEnemyDeadNum = function(A0_325)
    local L1_326
    L1_326 = A0_325.enemyDeadNum
    return L1_326
  end,
  isEnemyAllDead = function(A0_327)
    local L2_328
    L2_328 = A0_327.enemyDeadNum
    L2_328 = L2_328 >= #A0_327.spawnSet
    return L2_328
  end
}
function aisleManage()
  local L0_329, L1_330, L2_331, L3_332, L4_333, L5_334, L6_335, L7_336
  L0_329, L1_330, L2_331 = nil, nil, nil
  while true do
    _debug_status_now = L0_329
    _debug_status_pre = L1_330
    if L0_329 ~= L3_332 then
      if L3_332 == "aisle" then
        L1_330 = L0_329
        L0_329 = "aisle"
        L3_332(L4_333)
        L3_332()
        for L6_335, L7_336 in L3_332(L4_333) do
          findGameObject2("EnemyGenerator", string.format("enmgen2_%s", L7_336)):requestSpawn()
          findGameObject2("EnemyGenerator", string.format("enmgen2_%s", L7_336)):requestIdlingEnemy(false)
          _debug_aisle_enemy = findGameObject2("EnemyGenerator", string.format("enmgen2_%s", L7_336)):getName()
        end
        L3_332(L4_333, L5_334)
        L3_332(L4_333, L5_334)
        L2_331 = L3_332
      elseif L3_332 == "litho" then
        L1_330 = L0_329
        L0_329 = "litho"
        L3_332(L4_333)
        L3_332()
        for L6_335, L7_336 in L3_332(L4_333) do
          findGameObject2("EnemyGenerator", string.format("enmgen2_%s", L7_336)):requestAllEnemyKill()
          _debug_aisle_enemy = "not spawn enemy"
        end
        if L2_331 ~= nil then
          L3_332(L4_333)
        end
        if L3_332 ~= nil then
          L3_332(L4_333)
        end
        L3_332(L4_333, L5_334)
        L3_332(L4_333)
      elseif L3_332 == "demo" then
        L1_330 = L0_329
        L0_329 = "demo"
        L3_332(L4_333)
        for L6_335, L7_336 in L3_332(L4_333) do
          if L7_336 ~= nil then
            findGameObject2("EnemyGenerator", string.format("enmgen2_%s", L7_336)):requestIdlingEnemy(true)
          end
        end
        if L2_331 ~= nil then
          L3_332(L4_333)
        end
        if L3_332 ~= nil then
          L3_332(L4_333)
        end
      end
    end
    L3_332()
  end
end
_disp_mission = false
function aisleMissionView()
  invokeTask(function()
    if _disp_mission == false then
      _disp_mission = true
      Fn_missionView("ep12_02000")
    else
      Fn_missionView("ep12_02000", nil, nil, true)
    end
  end)
end
_guide_navi_table = {
  ep12_c = false,
  ep12_d = false,
  ep12_e = "02",
  ep12_f = false,
  ep12_g = false,
  ep12_h = false,
  ep12_i = "03",
  ep12_j = false,
  ep12_k = "04",
  ep12_l = false,
  ep12_m = "05",
  ep12_n = false,
  ep12_o = "06",
  ep12_p = false,
  ep12_q = "07_01",
  ep12_r = "07_02",
  ep12_s = false,
  ep12_t = "08_01",
  ep12_u = "08_02",
  ep12_v = false,
  ep12_w = false
}
function guide_navi(A0_337)
  local L1_338, L2_339
  L1_338 = partCheck
  L1_338()
  L1_338 = _guide_navi_table
  L2_339 = _mission_part
  L1_338 = L1_338[L2_339]
  if L1_338 ~= false then
    L2_339 = findGameObject2
    L2_339 = L2_339("Node", string.format("pccubesensor2_navi_%s_%02d", L1_338, A0_337))
    if L2_339 ~= nil then
      print("***** guide_navi : " .. L1_338 .. "[ " .. A0_337 .. "] *****")
      Fn_pcSensorOn(L2_339)
      Fn_naviSet(L2_339)
      _debug_navi = string.format("navi_%s_%02d", L1_338, A0_337)
    else
      Fn_naviKill()
      _debug_navi = "not navi"
    end
  else
    L2_339 = Fn_naviKill
    L2_339()
    _debug_navi = "not navi"
  end
end
function pccubesensor2_navi_OnEnter(A0_340, A1_341)
  local L2_342
  L2_342 = Fn_pcSensorOff
  L2_342(A0_340)
  L2_342 = tonumber
  L2_342 = L2_342(string.sub(A0_340:getName(), -2))
  L2_342 = L2_342 + 1
  invokeTask(guide_navi, L2_342)
end
function requestAreaMannager(A0_343)
  if _request_area_manager then
    _request_area_manager = false
    _area_manege = true
    _area_manage_part = A0_343
  end
end
function isOreReady()
  return Fn_sendIsRunMine()
end
function ciheavyarmorOff()
  _ciheavyarmor:setActive(false)
  _eff_ciheavyarmor:setActive(false)
end
