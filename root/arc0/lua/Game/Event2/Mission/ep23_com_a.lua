import("GameDatabase")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_FIX_CUBE_NAME = "et3_cube_oc_01b"
_FLOAT_CUBE_NAME = "et3_cube_oc_02b"
_DUMMY_CUBE_NUM = 20
_chain_tbl = {
  et3_a_01 = {
    11,
    18,
    27,
    41,
    47
  },
  et3_a_02 = {
    12,
    12,
    31,
    35,
    41
  },
  et3_a_03 = {
    20,
    34,
    34,
    42,
    56,
    62
  },
  et3_a_04 = {
    6,
    10,
    24,
    36,
    36,
    36,
    42
  },
  et3_a_05 = {
    24,
    24,
    49,
    50,
    51,
    57
  },
  et3_a_06 = {
    19,
    36,
    49,
    56,
    56,
    56,
    68,
    69,
    75
  },
  et3_a_07 = {
    16,
    53,
    56,
    57,
    63
  }
}
function getMaxCube(A0_0)
  local L1_1, L2_2
  L1_1 = _chain_tbl
  L1_1 = L1_1[A0_0]
  L2_2 = _chain_tbl
  L2_2 = L2_2[A0_0]
  L2_2 = #L2_2
  L1_1 = L1_1[L2_2]
  return L1_1
end
_retry_tbl = {
  et3_a_01 = {1, 2},
  et3_a_02 = {1, 2},
  et3_a_03 = {
    1,
    2,
    3
  },
  et3_a_04 = {
    1,
    2,
    3
  },
  et3_a_05 = {1, 2},
  et3_a_06 = {
    1,
    2,
    3
  },
  et3_a_07 = {1}
}
_start_cube_tbl = {
  et3_a_01 = 2,
  et3_a_02 = 2,
  et3_a_03 = 2,
  et3_a_04 = 2,
  et3_a_05 = 2,
  et3_a_06 = 2,
  et3_a_07 = 2
}
_stage_tbl = {
  ep23_a = {area = "et3_a_01", next = nil},
  ep23_b = {area = "et3_a_01", next = "et3_a_02"},
  ep23_c = {area = "et3_a_02", next = "et3_a_03"},
  ep23_d = {area = "et3_a_03", next = "et3_a_04"},
  ep23_e = {area = "et3_a_04", next = "et3_a_05"},
  ep23_f = {area = "et3_a_05", next = "et3_a_06"},
  ep23_g = {area = "et3_a_06", next = "et3_a_07"},
  ep23_h = {area = "et3_a_07", next = nil}
}
_next_phase = false
_puzzle_clear = false
_retry_clear = false
_in_goal_sensor = false
_setup_flag = true
_restart_flag = false
_move_cube_name = nil
_tutorial = nil
_tutorial_action = nil
_node_float_tbl = {}
_node_joint_tbl = {}
_eff_fix_tbl = {}
_eff_float_tbl = {}
_move_task = nil
_cube_break = nil
_theater_col_tbl = {}
_fall_col_tbl = {}
_theater_hdl = nil
_eff_goal_tbl = {}
_eff_splgt = nil
_goal_sensor = nil
_cube_dummy_tbl = {}
_cube_fix_tbl = {}
_cube_float_tbl = {}
_cube_sensor_tbl = {}
_shift_col_tbl = {}
_shift_mkr_tbl = {}
_shift_sensor_tbl = {}
_eff_hint_tbl = {}
_eff_hint_task = {}
_old_cube_dummy_tbl = {}
_old_cube_fix_tbl = {}
_old_cube_float_tbl = {}
_old_shift_col_tbl = {}
_old_shift_mkr_tbl = {}
_old_shift_sensor_tbl = {}
_eyeball_task = nil
function Initialize()
  local L0_3
  L0_3(false)
  for _FORV_3_, _FORV_4_ in L0_3(_stage_tbl) do
    Fn_pcSensorOff("pccubesensor2_over_" .. _FORV_4_.area)
    Fn_pcSensorOff("pccubesensor2_" .. _FORV_4_.area .. "_next_stage")
  end
  createStageGimmick(L0_3)
  createDummyGimmick(L0_3, _DUMMY_CUBE_NUM, 10, 15)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L0_4 = createGimmick
  L1_5 = "eyeball"
  L2_6 = findGameObject2
  L3_7 = "Node"
  L4_8 = "locator2_eyeball_"
  L4_8 = L4_8 .. _stage_tbl[Fn_getMissionPart()].area
  L2_6 = L2_6(L3_7, L4_8)
  L3_7 = "et3_eyeball_oc_01"
  L0_4 = L0_4(L1_5, L2_6, L3_7)
  L1_5 = createGameObject2
  L2_6 = "Node"
  L1_5 = L1_5(L2_6)
  L3_7 = L1_5
  L2_6 = L1_5.setName
  L4_8 = "locator2_eye"
  L2_6(L3_7, L4_8)
  L3_7 = L0_4
  L2_6 = L0_4.appendChild
  L4_8 = L1_5
  L2_6(L3_7, L4_8)
  L3_7 = L1_5
  L2_6 = L1_5.try_init
  L2_6(L3_7)
  L3_7 = L1_5
  L2_6 = L1_5.waitForReady
  L2_6(L3_7)
  L3_7 = L1_5
  L2_6 = L1_5.try_start
  L2_6(L3_7)
  L2_6 = createGimmick
  L3_7 = "eyeball_eye"
  L4_8 = L1_5
  L2_6 = L2_6(L3_7, L4_8, "et3_eyeball_oc_02")
  L3_7 = Fn_createEffect
  L4_8 = "ef_bg_eye_01"
  L3_7 = L3_7(L4_8, "ef_bg_eye_01", L1_5, true)
  L4_8 = L3_7.setScale
  L4_8(L3_7, Vector(10, 10, 10))
  L4_8 = Fn_createEffect
  L4_8("ef_bg_eye_02", "ef_bg_eye_02", L2_6, true)
  L4_8 = Fn_getMissionPart
  L4_8 = L4_8()
  _eyeball_task = invokeTask(function()
    local L0_9, L1_10, L2_11
    while true do
      L0_9 = Fn_getMissionPart
      L0_9 = L0_9()
      L1_10 = L4_8
      if L1_10 ~= L0_9 then
        L1_10 = findGameObject2
        L2_11 = "Node"
        L1_10 = L1_10(L2_11, "locator2_eyeball_" .. _stage_tbl[L4_8].area)
        L2_11 = findGameObject2
        L2_11 = L2_11("Node", "locator2_eyeball_" .. _stage_tbl[L0_9].area)
        if Fn_isInSightTarget(L1_10, 1) == false and Fn_isInSightTarget(L2_11, 1) == false then
          L0_4:setWorldPos(L0_4:getWorldPos())
          L2_11:appendChild(L0_4)
        end
      else
        L1_10 = L2_6
        L2_11 = L1_10
        L1_10 = L1_10.setWorldRot
        L1_10(L2_11, Fn_get_target_rot(L2_6, Fn_getPlayerWorldPos()))
      end
      L1_10 = waitSeconds
      L2_11 = 0.1
      L1_10(L2_11)
    end
  end)
  while true do
    if _setup_flag == false then
      for _FORV_9_, _FORV_10_ in pairs(_node_joint_tbl) do
        if Fn_get_distance(_FORV_10_:getWorldPos(), _cube_float_tbl[_FORV_9_]:getWorldPos()) > 0.1 then
          break
        end
      end
      if false == true then
        setNormalTune()
        _puzzle_clear = true
      elseif _retry_clear == false then
        for _FORV_10_, _FORV_11_ in pairs(_retry_tbl[_stage_tbl[Fn_getMissionPart()].area]) do
          if Fn_get_distance(_node_joint_tbl[_FORV_10_]:getWorldPos(), _cube_float_tbl[_FORV_10_]:getWorldPos()) > 0.1 then
            break
          end
        end
        _retry_clear = false
      end
    end
    wait()
  end
end
function Finalize()
  if Fn_getPlayer() then
    Fn_setCatActive(true)
  end
  if _eyeball_task ~= nil and _eyeball_task:isRunning() then
    _eyeball_task:abort()
  end
  _eyeball_task = nil
end
function setNormalTune()
  Fn_lockPlayerAbility({
    Player.kAbility_AttrTuneSwitch,
    Player.kAbility_SwitchToMars,
    Player.kAbility_SwitchToJupiter
  })
  Player:setAttrTune(Player.kAttrTune_Normal)
end
function moveTuneGimmick(A0_12)
  local L1_13
  L1_13 = findGameObject2
  L1_13 = L1_13("Node", "locator2_move_pos")
  if L1_13 == nil then
    L1_13 = createGameObject2("Node")
    L1_13:setName("locator2_move_pos")
    Area:getWorldRoot():appendChild(L1_13)
    L1_13:try_init()
    L1_13:waitForReady()
    L1_13:try_start()
  end
  _move_task = invokeTask(function()
    local L0_14, L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23
    L0_14 = nil
    L1_15 = Vector
    L2_16 = 0
    L3_17 = 0
    L4_18 = 0
    L1_15 = L1_15(L2_16, L3_17, L4_18)
    L2_16 = Vector
    L3_17 = 0
    L4_18 = 0
    L5_19 = 0
    L2_16 = L2_16(L3_17, L4_18, L5_19)
    L3_17, L4_18, L5_19 = nil, nil, nil
    L6_20 = false
    L7_21 = 24
    while true do
      if L8_22 ~= nil then
        L0_14 = L8_22
        if L8_22 == "B" then
          if L0_14 ~= L8_22 then
          elseif L0_14 == L8_22 then
            for _FORV_11_ = 1, 15 do
              if _in_sensor_dir ~= nil then
                wait()
              end
            end
            L0_14 = L8_22
          end
        end
        if L0_14 ~= L8_22 then
        elseif L0_14 == L8_22 then
          if L0_14 == L8_22 then
            if L8_22 == "up" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "down" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "right" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "left" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "front" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "back" then
              L1_15 = L8_22
              L2_16 = L8_22
            end
          elseif L0_14 == L8_22 then
            if L8_22 == "up" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "down" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "right" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "left" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "front" then
              L1_15 = L8_22
              L2_16 = L8_22
            elseif L8_22 == "back" then
              L1_15 = L8_22
              L2_16 = L8_22
            end
          end
          L3_17 = L8_22
          if L3_17 ~= nil then
            L4_18 = L8_22
            if L4_18 ~= nil then
              if L8_22 ~= nil then
                L5_19 = L8_22
                L8_22()
                L6_20 = true
                for _FORV_11_, _FORV_12_ in L8_22(L9_23) do
                  if L4_18 ~= _FORV_12_:getName() and 1 > Fn_get_distance(_FORV_12_:getWorldPos(), L5_19 + L2_16) then
                    L6_20 = false
                    break
                  end
                end
                if L6_20 == true then
                  for _FORV_11_, _FORV_12_ in L8_22(L9_23) do
                    if L4_18 ~= _FORV_12_:getName() and 1 > Fn_get_distance(_FORV_12_:getWorldPos(), L5_19 + L2_16) then
                      L6_20 = false
                      break
                    end
                  end
                end
                if L6_20 == true then
                  L8_22(L9_23, false)
                  L8_22(L9_23, L3_17:getWorldPos() + L1_15)
                  L8_22(L9_23)
                  _move_cube_name = L4_18
                  L8_22.x = L9_23
                  L8_22.y = L9_23
                  L8_22.z = L9_23
                  for _FORV_13_ = 1, L7_21 do
                    if _restart_flag ~= true then
                      L3_17:setWorldPos(L3_17:getWorldPos() + L8_22)
                      wait()
                    end
                  end
                  L3_17:setWorldPos(L1_13:getWorldPos())
                  _move_cube_name = nil
                  Sound:stopSEHandle(L9_23)
                  if _restart_flag == false then
                    if Fn_get_distance(findGameObject2("Node", "locator2_" .. A0_12 .. "_joint_" .. string.sub(L4_18, -2)):getWorldPos(), L3_17:getWorldPos()) < 0.1 then
                      Sound:playSE("ep23_cube_on", 1, "", L3_17)
                    elseif Fn_get_distance(findGameObject2("Node", "locator2_" .. A0_12 .. "_joint_" .. string.sub(L4_18, -2)):getWorldPos(), L5_19) < 0.1 and Fn_get_distance(findGameObject2("Node", "locator2_" .. A0_12 .. "_joint_" .. string.sub(L4_18, -2)):getWorldPos(), L3_17:getWorldPos()) > 0.1 then
                      Sound:playSE("ep23_cube_off", 1, "", L3_17)
                    end
                  end
                end
                L8_22(L9_23)
                L8_22()
                _in_sensor_dir = nil
                if L8_22 == true then
                  L8_22()
                  if L8_22 == true then
                    L8_22()
                  end
                else
                  L8_22()
                end
              end
            end
          end
        end
      end
      L8_22()
    end
  end)
end
_in_sensor_dir = nil
function createTuneSensor(A0_24, A1_25, A2_26)
  local L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34
  L4_28 = A0_24
  L3_27 = A0_24.getName
  L3_27 = L3_27(L4_28)
  L4_28 = "pccubesensor2_"
  L5_29 = L3_27
  L6_30 = "_"
  L7_31 = A1_25
  L4_28 = L4_28 .. L5_29 .. L6_30 .. L7_31
  L5_29 = L4_28
  L6_30 = "_OnEnter"
  L5_29 = L5_29 .. L6_30
  L6_30 = L4_28
  L7_31 = "_OnLeave"
  L6_30 = L6_30 .. L7_31
  L7_31 = createGameObject2
  L8_32 = "PlayerSensor"
  L7_31 = L7_31(L8_32)
  L9_33 = L7_31
  L8_32 = L7_31.setName
  L10_34 = L4_28
  L8_32(L9_33, L10_34)
  L9_33 = L7_31
  L8_32 = L7_31.setDetectBehavior
  L10_34 = 1
  L8_32(L9_33, L10_34)
  L9_33 = L7_31
  L8_32 = L7_31.addBox
  L10_34 = Vector
  L10_34 = L10_34(1, 1, 1)
  L8_32(L9_33, L10_34, L10_34(1, 1, 1))
  L9_33 = L7_31
  L8_32 = L7_31.setPos
  L10_34 = A2_26
  L8_32(L9_33, L10_34)
  L9_33 = L7_31
  L8_32 = L7_31.setOnEnter
  L10_34 = L5_29
  L8_32(L9_33, L10_34)
  L9_33 = L7_31
  L8_32 = L7_31.setOnLeave
  L10_34 = L6_30
  L8_32(L9_33, L10_34)
  L9_33 = L7_31
  L8_32 = L7_31.setActive
  L10_34 = true
  L8_32(L9_33, L10_34)
  L9_33 = A0_24
  L8_32 = A0_24.appendChild
  L10_34 = L7_31
  L8_32(L9_33, L10_34)
  L8_32 = false
  L9_33, L10_34 = nil, nil
  _G[L5_29] = function()
    invokeTask(function()
      L8_32 = false
      while L8_32 == false and _puzzle_clear == false do
        L9_33 = Player:getUnderfootObject()
        if L9_33 ~= nil and _in_sensor_dir == nil then
          L10_34 = L9_33:getName()
          if L3_27 == L10_34 then
            if _tutorial == true then
              if _tutorial_action == false then
                Fn_tutorialCaption("puzzle_tutorial")
                Fn_unLockPlayerAbility({
                  Player.kAbility_AttrTuneSwitch,
                  Player.kAbility_SwitchToJupiter
                })
                repeat
                  wait()
                until _tutorial_action
                _in_sensor_dir = A1_25
              end
            else
              if Player:getAbility(Player.kAbility_AttrTuneSwitch) == false then
                Fn_unLockPlayerAbility({
                  Player.kAbility_AttrTuneSwitch,
                  Player.kAbility_SwitchToMars,
                  Player.kAbility_SwitchToJupiter
                })
              end
              Fn_tutorialCaption("puzzle")
              _in_sensor_dir = A1_25
            end
            if string.find(L10_34, "_float_") == nil then
              Fn_tutorialCaptionKill()
            end
          end
        end
        wait()
      end
    end)
  end
  _G[L6_30] = function()
    L8_32 = true
    setNormalTune()
    Fn_tutorialCaptionKill()
    _in_sensor_dir = nil
  end
  return L7_31
end
function createGimmick(A0_35, A1_36, A2_37)
  local L3_38
  L3_38 = createGameObject2
  L3_38 = L3_38("GimmickBg")
  L3_38:setName(A0_35)
  L3_38:setDrawModelName(A2_37)
  L3_38:setVisibleBlockEnable(false)
  L3_38:setVisible(true)
  if A1_36 ~= nil then
    A1_36:appendChild(L3_38)
  end
  return L3_38
end
function shiftGravity(A0_39, A1_40, A2_41)
  invokeTask(function()
    for _FORV_3_, _FORV_4_ in pairs(_shift_col_tbl[A2_41]) do
      _FORV_4_:setCollidablePermission(true)
    end
    Player:shiftGravity(A0_39, A1_40)
    Sound:playSE("pc1_grvt_st", 1)
    repeat
      Player:moveToLandingPoint(findGameObject2("Node", "locator2_" .. A2_41 .. "_start"):getWorldPos(), 5, 1)
      wait()
    until Player:getUnderfootObject() ~= nil
    waitSeconds(0.5)
    for _FORV_4_, _FORV_5_ in pairs(_shift_col_tbl[A2_41]) do
      _FORV_5_:setCollidablePermission(false)
    end
  end)
end
function ef_up_OnEnter(A0_42)
  local L1_43
  L1_43 = shiftGravity
  L1_43(Vector(0, 1, 0), 0.5, string.sub(A0_42:getName(), 15))
end
function ef_down_OnEnter(A0_44)
  local L1_45
  L1_45 = shiftGravity
  L1_45(Vector(0, -1, 0), 0.5, string.sub(A0_44:getName(), 15))
end
function ef_right_OnEnter(A0_46)
  local L1_47
  L1_47 = shiftGravity
  L1_47(Vector(-1, 0, 0), 0.5, string.sub(A0_46:getName(), 15))
end
function ef_left_OnEnter(A0_48)
  local L1_49
  L1_49 = shiftGravity
  L1_49(Vector(1, 0, 0), 0.5, string.sub(A0_48:getName(), 15))
end
function ef_front_OnEnter(A0_50)
  local L1_51
  L1_51 = shiftGravity
  L1_51(Vector(0, 0, 1), 0.5, string.sub(A0_50:getName(), 15))
end
function ef_back_OnEnter(A0_52)
  local L1_53
  L1_53 = shiftGravity
  L1_53(Vector(0, 0, -1), 0.5, string.sub(A0_52:getName(), 15))
end
function createShiftGravityGimmick(A0_54, A1_55, A2_56)
  local L3_57
  L3_57 = A0_54
  L3_57 = L3_57 .. "_" .. A1_55
  _shift_mkr_tbl[L3_57] = createGameObject2("Effect")
  _shift_mkr_tbl[L3_57]:setModelName("ef_ui_upmkr_02")
  _shift_mkr_tbl[L3_57]:loadModel("ef_ui_upmkr_02")
  _shift_mkr_tbl[L3_57]:setName("ef_" .. L3_57)
  _shift_mkr_tbl[L3_57]:setLoop(true)
  _shift_mkr_tbl[L3_57]:play()
  A2_56:appendChild(_shift_mkr_tbl[L3_57])
  _shift_sensor_tbl[L3_57] = createGameObject2("PlayerSensor")
  _shift_sensor_tbl[L3_57]:setName("pccubesensor2_" .. L3_57)
  _shift_sensor_tbl[L3_57]:setDetectBehavior(1)
  _shift_sensor_tbl[L3_57]:addBox(Vector(0.8, 1, 0.8))
  _shift_sensor_tbl[L3_57]:setPos(Vector(0, 1, 0))
  _shift_sensor_tbl[L3_57]:setOnEnter("ef_" .. A1_55 .. "_OnEnter")
  A2_56:appendChild(_shift_sensor_tbl[L3_57])
  _shift_col_tbl[L3_57] = createFallCollision(L3_57 .. "_start", L3_57 .. "_end", shift_hdl)
end
function createChainEffect(A0_58, A1_59, A2_60)
  local L3_61, L4_62
  L3_61 = Fn_createEffect
  L4_62 = A0_58
  L3_61 = L3_61(L4_62, "ef_ev_lgtpar_03", A1_59, true)
  L4_62 = invokeTask
  L4_62 = L4_62(function()
    local L0_63, L1_64, L2_65
    L0_63 = false
    L1_64 = 0
    while true do
      L2_65 = Fn_get_distance
      L2_65 = L2_65(A1_59:getWorldPos(), A2_60:getWorldPos())
      if L2_65 < 0.1 then
        if L0_63 == false then
          L3_61:setVisible(false)
        end
        L0_63 = true
      else
        if L0_63 == true then
          L3_61:setVisible(true)
        end
        L0_63 = false
      end
      if L0_63 == false then
        if L1_64 == 0 then
          L1_64 = math.floor(L2_65 / 0.12)
          ;(A2_60:getWorldPos() - A1_59:getWorldPos()).x = (A2_60:getWorldPos() - A1_59:getWorldPos()).x / L1_64
          ;(A2_60:getWorldPos() - A1_59:getWorldPos()).y = (A2_60:getWorldPos() - A1_59:getWorldPos()).y / L1_64
          ;(A2_60:getWorldPos() - A1_59:getWorldPos()).z = (A2_60:getWorldPos() - A1_59:getWorldPos()).z / L1_64
          L3_61:setAlpha(1)
          L3_61:setWorldPos(A1_59:getWorldPos())
        end
        for _FORV_8_ = 1, L1_64 do
          L3_61:setWorldPos(L3_61:getWorldPos() + (A2_60:getWorldPos() - A1_59:getWorldPos()))
          if L1_64 - _FORV_8_ < 10 then
            L3_61:setAlpha((L1_64 - _FORV_8_) / 10)
          end
          if _move_cube_name ~= nil and _move_cube_name == A1_59:getName() then
            for _FORV_12_ = 1, 10 do
              L3_61:setWorldPos(L3_61:getWorldPos() + (A2_60:getWorldPos() - A1_59:getWorldPos()))
              L3_61:setAlpha(1 - _FORV_12_ / 10)
              wait()
            end
            break
          end
          wait()
        end
        L1_64 = 0
      end
      wait()
    end
  end)
  return L3_61, L4_62
end
function createGoalEffect(A0_66)
  _eff_goal_tbl[1] = createGameObject2("Effect")
  _eff_goal_tbl[1]:setModelName("ef_ev_goal_01")
  _eff_goal_tbl[1]:loadModel("ef_ev_goal_01")
  _eff_goal_tbl[1]:setName("ef_goal_01")
  _eff_goal_tbl[1]:setLoop(true)
  _eff_goal_tbl[1]:setPos(Vector(0, 3, 0))
  _eff_goal_tbl[1]:play()
  A0_66:appendChild(_eff_goal_tbl[1])
  _eff_goal_tbl[2] = createGameObject2("Effect")
  _eff_goal_tbl[2]:setModelName("ef_ev_goal_02")
  _eff_goal_tbl[2]:loadModel("ef_ev_goal_02")
  _eff_goal_tbl[2]:setName("ef_goal_02")
  _eff_goal_tbl[2]:setLoop(true)
  _eff_goal_tbl[2]:setPos(Vector(0, 3, 0))
  _eff_goal_tbl[2]:stop()
  A0_66:appendChild(_eff_goal_tbl[2])
  _eff_goal_tbl[3] = createGameObject2("Effect")
  _eff_goal_tbl[3]:setModelName("ef_ev_goal_03")
  _eff_goal_tbl[3]:loadModel("ef_ev_goal_03")
  _eff_goal_tbl[3]:setName("ef_goal_03")
  _eff_goal_tbl[3]:setLoop(true)
  _eff_goal_tbl[3]:setPos(Vector(0, 3, 0))
  _eff_goal_tbl[3]:stop()
  A0_66:appendChild(_eff_goal_tbl[3])
end
function inGoalSensor(A0_67)
  A0_67:setActive(false)
  _in_goal_sensor = true
end
function createGoalSensor(A0_68, A1_69)
  _goal_sensor = createGameObject2("PlayerSensor")
  _goal_sensor:setName(A1_69)
  _goal_sensor:setDetectBehavior(1)
  _goal_sensor:addBox(Vector(0.5, 1, 0.5))
  _goal_sensor:setPos(Vector(0, 2.5, 0))
  _goal_sensor:setOnEnter("inGoalSensor")
  _goal_sensor:setActive(false)
  A0_68:appendChild(_goal_sensor)
end
function createStageGimmick(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79, L10_80, L11_81
  L1_71 = {}
  L2_72 = Vector
  L3_73 = 0
  L4_74 = 2.3
  L5_75 = 0
  L2_72 = L2_72(L3_73, L4_74, L5_75)
  L1_71.up = L2_72
  L2_72 = Vector
  L3_73 = 0
  L4_74 = -2.3
  L5_75 = 0
  L2_72 = L2_72(L3_73, L4_74, L5_75)
  L1_71.down = L2_72
  L2_72 = Vector
  L3_73 = -2.3
  L4_74 = 0
  L5_75 = 0
  L2_72 = L2_72(L3_73, L4_74, L5_75)
  L1_71.right = L2_72
  L2_72 = Vector
  L3_73 = 2.3
  L4_74 = 0
  L5_75 = 0
  L2_72 = L2_72(L3_73, L4_74, L5_75)
  L1_71.left = L2_72
  L2_72 = Vector
  L3_73 = 0
  L4_74 = 0
  L5_75 = 2.3
  L2_72 = L2_72(L3_73, L4_74, L5_75)
  L1_71.front = L2_72
  L2_72 = Vector
  L3_73 = 0
  L4_74 = 0
  L5_75 = -2.3
  L2_72 = L2_72(L3_73, L4_74, L5_75)
  L1_71.back = L2_72
  L2_72 = 1
  L3_73 = getMaxCube
  L4_74 = A0_70
  L3_73 = L3_73(L4_74)
  while true do
    L4_74 = A0_70
    L5_75 = "_fix_"
    L4_74 = L4_74 .. L5_75 .. L6_76
    L5_75 = findGameObject2
    L5_75 = L5_75(L6_76, L7_77)
    if L5_75 ~= nil then
      L9_79 = L4_74
      L9_79 = L5_75
      L10_80 = _FIX_CUBE_NAME
      L6_76[L2_72] = L7_77
      if L2_72 ~= L6_76 then
        L6_76(L7_77, L8_78)
      end
      L6_76(L7_77, L8_78)
      L9_79 = L4_74
      L9_79 = "ef_ev_lgt_cub_01"
      L10_80 = _cube_fix_tbl
      L10_80 = L10_80[L2_72]
      L11_81 = true
      L6_76[L2_72] = L7_77
      L6_76(L7_77)
      L6_76(L7_77, L8_78)
      for L9_79, L10_80 in L6_76(L7_77) do
        L11_81 = findGameObject2
        L11_81 = L11_81("Node", "locator2_" .. L4_74 .. "_" .. L9_79)
        if L11_81 ~= nil then
          createShiftGravityGimmick(L4_74, L9_79, L11_81)
        end
      end
      if L3_73 == L2_72 then
        L6_76(L7_77)
        L9_79 = A0_70
        L6_76(L7_77, L8_78)
      end
      L2_72 = L2_72 + 1
    end
  end
  L2_72 = 1
  while true do
    L4_74 = A0_70
    L5_75 = "_float_"
    L4_74 = L4_74 .. L5_75 .. L6_76
    L5_75 = findGameObject2
    L5_75 = L5_75(L6_76, L7_77)
    if L5_75 ~= nil then
      L6_76[L2_72] = L5_75
      L9_79 = L4_74
      L9_79 = L5_75
      L10_80 = _FLOAT_CUBE_NAME
      L6_76[L2_72] = L7_77
      L6_76(L7_77, L8_78)
      L6_76(L7_77, L8_78)
      L9_79 = L4_74
      L9_79 = "ef_ev_lgt_cub_01"
      L10_80 = _cube_float_tbl
      L10_80 = L10_80[L2_72]
      L11_81 = true
      L6_76[L2_72] = L7_77
      L6_76(L7_77)
      L6_76(L7_77, L8_78)
      L6_76[L4_74] = L7_77
      for L9_79, L10_80 in L6_76(L7_77) do
        L11_81 = _cube_sensor_tbl
        L11_81 = L11_81[L4_74]
        L11_81[L9_79] = createTuneSensor(_cube_float_tbl[L2_72], L9_79, L10_80)
      end
      L9_79 = string
      L9_79 = L9_79.format
      L10_80 = "%02d"
      L11_81 = L2_72
      L9_79 = L9_79(L10_80, L11_81)
      L9_79 = "locator2_"
      L10_80 = A0_70
      L11_81 = "_joint_"
      L9_79 = L9_79 .. L10_80 .. L11_81 .. string.format("%02d", L2_72)
      L9_79 = _eff_hint_task
      L10_80 = createChainEffect
      L11_81 = L6_76
      L11_81 = L10_80(L11_81, _cube_float_tbl[L2_72], L7_77)
      L9_79[L6_76] = L11_81
      L8_78[L6_76] = L10_80
      L2_72 = L2_72 + 1
    end
  end
  L2_72 = 1
  while true do
    L4_74 = findGameObject2
    L5_75 = "Node"
    L9_79 = string
    L9_79 = L9_79.format
    L10_80 = "%02d"
    L11_81 = L2_72
    L9_79 = L9_79(L10_80, L11_81)
    L4_74 = L4_74(L5_75, L6_76)
    if L4_74 ~= nil then
      L5_75 = _node_joint_tbl
      L5_75[L2_72] = L4_74
      L2_72 = L2_72 + 1
    end
  end
  _setup_flag = false
  L4_74 = start_game_obj
  L4_74()
end
function createDummyGimmick(A0_82, A1_83, A2_84, A3_85)
  local L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92, L11_93, L12_94, L13_95, L14_96, L15_97, L16_98, L17_99, L18_100, L19_101
  L4_86 = {}
  L5_87 = findGameObject2
  L6_88 = "PlayerSensor"
  L7_89 = "pccubesensor2_over_"
  L8_90 = A0_82
  L7_89 = L7_89 .. L8_90
  L5_87 = L5_87(L6_88, L7_89)
  L7_89 = L5_87
  L6_88 = L5_87.getLocalAabb
  L6_88 = L6_88(L7_89)
  L7_89 = {}
  L8_90 = L6_88.max
  L9_91 = Vector
  L10_92 = A2_84
  L11_93 = A2_84
  L12_94 = A2_84
  L9_91 = L9_91(L10_92, L11_93, L12_94)
  L8_90 = L8_90 + L9_91
  L7_89.max = L8_90
  L8_90 = L6_88.min
  L9_91 = Vector
  L10_92 = A2_84
  L11_93 = A2_84
  L12_94 = A2_84
  L9_91 = L9_91(L10_92, L11_93, L12_94)
  L8_90 = L8_90 - L9_91
  L7_89.min = L8_90
  L8_90 = {}
  L9_91 = L7_89.max
  L10_92 = Vector
  L11_93 = A3_85
  L12_94 = A3_85
  L10_92 = L10_92(L11_93, L12_94, L13_95)
  L9_91 = L9_91 + L10_92
  L8_90.max = L9_91
  L9_91 = L7_89.min
  L10_92 = Vector
  L11_93 = A3_85
  L12_94 = A3_85
  L10_92 = L10_92(L11_93, L12_94, L13_95)
  L9_91 = L9_91 - L10_92
  L8_90.min = L9_91
  L9_91 = {}
  L10_92 = {L11_93, L12_94}
  L11_93 = {}
  L12_94 = math
  L12_94 = L12_94.floor
  L12_94 = L12_94(L13_95)
  L11_93.min = L12_94
  L12_94 = math
  L12_94 = L12_94.floor
  L12_94 = L12_94(L13_95)
  L11_93.max = L12_94
  L12_94 = {}
  L12_94.min = L13_95
  L12_94.max = L13_95
  L9_91.x = L10_92
  L10_92 = {L11_93, L12_94}
  L11_93 = {}
  L12_94 = math
  L12_94 = L12_94.floor
  L12_94 = L12_94(L13_95)
  L11_93.min = L12_94
  L12_94 = math
  L12_94 = L12_94.floor
  L12_94 = L12_94(L13_95)
  L11_93.max = L12_94
  L12_94 = {}
  L12_94.min = L13_95
  L12_94.max = L13_95
  L9_91.y = L10_92
  L10_92 = {L11_93, L12_94}
  L11_93 = {}
  L12_94 = math
  L12_94 = L12_94.floor
  L12_94 = L12_94(L13_95)
  L11_93.min = L12_94
  L12_94 = math
  L12_94 = L12_94.floor
  L12_94 = L12_94(L13_95)
  L11_93.max = L12_94
  L12_94 = {}
  L12_94.min = L13_95
  L12_94.max = L13_95
  L9_91.z = L10_92
  L10_92 = findGameObject2
  L11_93 = "Node"
  L12_94 = "locator2_"
  L18_100 = A0_82
  L19_101 = L17_99(L18_100)
  L12_94 = L12_94 .. L13_95 .. L14_96 .. L15_97
  L10_92 = L10_92(L11_93, L12_94)
  L11_93 = L10_92
  L10_92 = L10_92.getPos
  L10_92 = L10_92(L11_93)
  L11_93 = 0
  L12_94 = {}
  for L16_98 = 1, A1_83 do
    L18_100 = RandI
    L19_101 = L8_90.min
    L19_101 = L19_101.x
    L18_100 = L18_100(L19_101, L8_90.max.x)
    L18_100 = L18_100 / 3
    L18_100 = math
    L18_100 = L18_100.floor
    L19_101 = RandI
    L19_101 = L19_101(L8_90.min.y, L8_90.max.y)
    L19_101 = L19_101 / 3
    L18_100 = L18_100(L19_101)
    L18_100 = L18_100 * 3
    L19_101 = math
    L19_101 = L19_101.floor
    L19_101 = L19_101(RandI(L8_90.min.z, L8_90.max.z) / 3)
    L19_101 = L19_101 * 3
    if Vector(L17_99, L18_100, L19_101).x > L7_89.min.x and Vector(L17_99, L18_100, L19_101).x < L7_89.max.x or Vector(L17_99, L18_100, L19_101).y > L7_89.min.y and Vector(L17_99, L18_100, L19_101).y < L7_89.max.y or Vector(L17_99, L18_100, L19_101).z > L7_89.min.z and Vector(L17_99, L18_100, L19_101).z < L7_89.max.z then
      if RandI(1, 3) == 1 then
        Vector(L17_99, L18_100, L19_101).x = math.floor(RandI(L9_91.x[RandI(1, 2)].min, L9_91.x[RandI(1, 2)].max) / 3) * 3
      elseif RandI(1, 3) == 2 then
        Vector(L17_99, L18_100, L19_101).y = math.floor(RandI(L9_91.y[RandI(1, 2)].min, L9_91.y[RandI(1, 2)].max) / 3) * 3
      else
        Vector(L17_99, L18_100, L19_101).z = math.floor(RandI(L9_91.z[RandI(1, 2)].min, L9_91.z[RandI(1, 2)].max) / 3) * 3
      end
    end
    if L11_93 > 0 then
      for _FORV_25_ = 1, L11_93 do
        if L12_94[_FORV_25_] == Vector(L17_99, L18_100, L19_101) or Vector(L17_99, L18_100, L19_101).x == L10_92.x and Vector(L17_99, L18_100, L19_101).z == L10_92.z then
          break
        end
      end
    end
    if true == false then
      L12_94[L11_93], L11_93 = Vector(L17_99, L18_100, L19_101), L11_93 + 1
    end
  end
  for L18_100 = 1, #L12_94 do
    L19_101 = _cube_dummy_tbl
    L19_101[L18_100] = createGimmick("gimmick_dummy_" .. A0_82 .. string.format("%02d", L18_100), nil, _FIX_CUBE_NAME)
    L19_101 = _cube_dummy_tbl
    L19_101 = L19_101[L18_100]
    L19_101 = L19_101.setPos
    L19_101(L19_101, L12_94[L18_100] + L14_96)
    L19_101 = L13_95.appendChild
    L19_101(L13_95, _cube_dummy_tbl[L18_100])
  end
  L15_97()
end
function createTheater(A0_102)
  local L1_103
  L1_103 = A0_102
  L1_103 = L1_103 .. "_theater"
  _theater_hdl = createGimmick("gimmick_" .. L1_103, findGameObject2("Node", "locator2_" .. L1_103), _FIX_CUBE_NAME)
  _theater_hdl:setCollisionName(_FIX_CUBE_NAME)
  return _theater_hdl
end
function createSpotlight(A0_104, A1_105)
  _eff_splgt = createGameObject2("Effect")
  _eff_splgt:setModelName("ef_bg_splgt_02")
  _eff_splgt:setName("eff_splgt_" .. A0_104)
  _eff_splgt:setLoop(true)
  _eff_splgt:setScale(Vector(2, 1, 2))
  _eff_splgt:play()
  _theater_hdl:appendChild(_eff_splgt)
  if A1_105 ~= nil then
    _eff_splgt:setAlpha(A1_105)
  else
    _eff_splgt:setAlpha(0)
  end
  _eff_splgt:try_init()
  _eff_splgt:waitForReady()
  _eff_splgt:try_start()
  Sound:playSE("ep23_light_on", 1, "", _theater_hdl)
end
function createFallCollision(A0_106, A1_107, A2_108)
  local L3_109, L4_110, L5_111, L6_112, L7_113, L8_114, L9_115, L10_116, L11_117, L12_118, L13_119
  L3_109 = {}
  L4_110 = findGameObject2
  L5_111 = "Node"
  L6_112 = "locator2_"
  L7_113 = A0_106
  L6_112 = L6_112 .. L7_113
  L4_110 = L4_110(L5_111, L6_112)
  L6_112 = L4_110
  L5_111 = L4_110.getWorldPos
  L5_111 = L5_111(L6_112)
  L6_112 = findGameObject2
  L7_113 = "Node"
  L8_114 = "locator2_"
  L8_114 = L8_114 .. L9_115
  L6_112 = L6_112(L7_113, L8_114)
  L7_113 = L6_112
  L6_112 = L6_112.getWorldPos
  L6_112 = L6_112(L7_113)
  L7_113 = Fn_get_ceil
  L8_114 = Fn_get_distance
  L8_114 = L8_114(L9_115, L10_116)
  L8_114 = L8_114 + 0.1
  L8_114 = L8_114 / 3
  L7_113 = L7_113(L8_114)
  if L7_113 > 0 then
    L8_114 = Vector
    L8_114 = L8_114(L9_115, L10_116, L11_117)
    for L12_118 = 1, L7_113 do
      L13_119 = createGameObject2
      L13_119 = L13_119("GimmickBg")
      L13_119:setName("col_" .. A0_106 .. "_" .. string.format("%02d", L12_118))
      L13_119:setCollisionName("ep23_col")
      L13_119:setAttributeName("invisible_col")
      L13_119:setCollidablePermission(false)
      L13_119:setPos(L8_114)
      if L4_110 ~= nil then
        L4_110:appendChild(L13_119)
      end
      L3_109[L12_118] = L13_119
      L8_114.y = L8_114.y - 3
    end
  end
  return L3_109
end
function chainEffectSetVisible(A0_120)
  local L1_121, L2_122, L3_123, L4_124
  L1_121 = true
  L2_122 = 0
  L3_123 = _chain_tbl
  L3_123 = L3_123[A0_120]
  L3_123 = #L3_123
  L4_124 = getMaxCube
  L4_124 = L4_124(A0_120)
  for _FORV_8_, _FORV_9_ in pairs(_chain_tbl[A0_120]) do
    if _FORV_8_ == L3_123 then
      if L1_121 == true then
        L2_122 = L4_124
      end
      break
    end
    if Fn_get_distance(_node_joint_tbl[_FORV_8_]:getWorldPos(), _cube_float_tbl[_FORV_8_]:getWorldPos()) < 0.1 then
      if L1_121 == true then
        L2_122 = _FORV_9_
        _eff_float_tbl[_FORV_8_]:setVisible(true)
      else
        _eff_float_tbl[_FORV_8_]:setVisible(false)
      end
    else
      L1_121 = false
      _eff_float_tbl[_FORV_8_]:setVisible(false)
    end
  end
  if L2_122 > 1 then
    for _FORV_8_ = 1, L2_122 do
      _eff_fix_tbl[_FORV_8_]:setVisible(true)
    end
  end
  if L4_124 > L2_122 then
    for _FORV_8_ = L2_122 + 1, L4_124 do
      _eff_fix_tbl[_FORV_8_]:setVisible(false)
    end
  end
end
function restartPuzzle()
  local L0_125, L1_126
  L0_125 = _puzzle_clear
  if L0_125 == false then
    L0_125 = 1
    while true do
      L1_126 = _node_float_tbl
      L1_126 = L1_126[L0_125]
      if L1_126 ~= nil then
        L1_126 = _cube_float_tbl
        L1_126 = L1_126[L0_125]
        L1_126 = L1_126.setWorldPos
        L1_126(L1_126, _node_float_tbl[L0_125]:getWorldPos())
        L0_125 = L0_125 + 1
      end
    end
    L1_126 = _stage_tbl
    L1_126 = L1_126[Fn_getMissionPart()]
    L1_126 = L1_126.area
    if _retry_clear == true then
      for _FORV_5_, _FORV_6_ in pairs(_retry_tbl[L1_126]) do
        _cube_float_tbl[_FORV_6_]:setWorldPos(_node_joint_tbl[_FORV_6_]:getWorldPos())
      end
    end
    chainEffectSetVisible(L1_126)
  end
end
function pccubesensor2_over_OnLeave()
  invokeTask(function()
    local L0_127
    L0_127 = Fn_getMissionPart
    L0_127 = L0_127()
    Fn_userCtrlAllOff()
    Fn_blackout()
    _restart_flag = true
    if _puzzle_clear == true then
      Fn_resetPcPos("locator2_pc_goal_" .. L0_127)
    elseif _retry_clear == true then
      Fn_resetPcPos("locator2_pc_retry_" .. L0_127)
    else
      Fn_resetPcPos("locator2_pc_restart_" .. L0_127)
    end
    restartPuzzle()
    setNormalTune()
    Fn_fadein()
    Fn_userCtrlOn()
    _restart_flag = false
    if _puzzle_clear == false and _tutorial == nil and GameDatabase:get(ggd.EventFlags__ep23__flag01) == 0 then
      GameDatabase:set(ggd.EventFlags__ep23__flag01, 1)
      Fn_captionViewLock("ep23_09002")
    end
  end)
end
function isPuzzleClear()
  local L0_128, L1_129
  L0_128 = _puzzle_clear
  return L0_128
end
function getComGameObject(A0_130, A1_131)
  return findGameObject2(A0_130, A1_131)
end
function requestComSensorOn(A0_132)
  Fn_pcSensorOn(A0_132)
end
function requestComSensorOff(A0_133)
  Fn_pcSensorOff(A0_133)
end
function requestCreateTheaterCollision(A0_134)
  invokeTask(function()
    _theater_col_tbl = createFallCollision(A0_134 .. "_col_start", A0_134 .. "_col_end")
    _fall_col_tbl = createFallCollision(A0_134 .. "_fix_" .. string.format("%02d", getMaxCube(A0_134)), A0_134 .. "_fall_end")
    start_game_obj()
  end)
end
function requestTutorial()
  local L0_135, L1_136
  _tutorial = true
end
function requestTutorialActionStart()
  local L0_137, L1_138
  _tutorial_action = false
end
function requestTutorialActionEnd()
  local L0_139, L1_140
  _tutorial_action = true
end
function requestTutorialEnd()
  local L0_141, L1_142
  _tutorial = nil
  _tutorial_action = nil
end
function requestGoalActive(A0_143)
  Sound:playSE("ep23_goal", 1, "", _eff_goal_tbl[2])
  _eff_goal_tbl[2]:play()
  Fn_pcSensorOn(_goal_sensor)
end
function isGoalSensorIn()
  local L0_144, L1_145
  L0_144 = _in_goal_sensor
  return L0_144
end
function requestGoal(A0_146)
  _eff_goal_tbl[3]:play()
  for _FORV_4_, _FORV_5_ in pairs(_theater_col_tbl) do
    _FORV_5_:setCollidablePermission(true)
  end
  for _FORV_4_, _FORV_5_ in pairs(_fall_col_tbl) do
    _FORV_5_:setCollidablePermission(true)
  end
  if _move_task ~= nil and _move_task:isRunning() then
    _move_task:abort()
  end
  _move_task = nil
  requestComSensorOff("pccubesensor2_over_" .. A0_146)
end
function requestGoalDisable()
  local L0_147, L1_148, L2_149, L3_150, L4_151
  for L3_150, L4_151 in L0_147(L1_148) do
    if L4_151 ~= nil and L4_151:isRunning() == true then
      L4_151:abort()
    end
  end
  _eff_hint_task = L0_147
  for L3_150, L4_151 in L0_147(L1_148) do
    L4_151:try_term()
  end
  _eff_hint_tbl = L0_147
  for L3_150, L4_151 in L0_147(L1_148) do
    kill_effect(L4_151)
  end
  _eff_fix_tbl = L0_147
  for L3_150, L4_151 in L0_147(L1_148) do
    kill_effect(L4_151)
  end
  _eff_float_tbl = L0_147
  for L3_150, L4_151 in L0_147(L1_148) do
    kill_effect(L4_151)
  end
  _eff_goal_tbl = L0_147
  L0_147(L1_148)
  _goal_sensor = nil
end
function kill_effect(A0_152)
  invokeTask(function()
    local L0_153
    L0_153 = A0_152
    L0_153 = L0_153.getAlpha
    L0_153 = L0_153(L0_153)
    while L0_153 > 0 do
      L0_153 = L0_153 - 0.1
      if L0_153 < 0 then
        L0_153 = 0
      end
      A0_152:setAlpha(L0_153)
      waitSeconds(0.1)
    end
    A0_152:try_term()
  end)
end
function requestCreateSpotlight(A0_154, A1_155)
  invokeTask(function()
    createSpotlight(A0_154, A1_155)
  end)
end
function requestSpotlightKill()
  kill_effect(_eff_splgt)
  _eff_splgt = nil
end
function nextPhase(A0_156)
  A0_156:setActive(false)
  _next_phase = true
end
function isNextPhase()
  local L0_157, L1_158
  L0_157 = _next_phase
  return L0_157
end
function requestCreateNextStage()
  invokeTask(function()
    local L0_159, L1_160, L2_161, L3_162, L4_163
    _next_phase = false
    _setup_flag = true
    _puzzle_clear = false
    _retry_clear = false
    _in_goal_sensor = false
    L4_163 = L1_160(L2_161)
    ;({
      [5] = L1_160(L2_161)
    })[1] = L1_160
    ;({
      [5] = L1_160(L2_161)
    })[2] = L2_161
    ;({
      [5] = L1_160(L2_161)
    })[3] = L3_162
    ;({
      [5] = L1_160(L2_161)
    })[4] = L4_163
    _old_cube_dummy_tbl = L0_159
    L4_163 = L1_160(L2_161)
    ;({
      [5] = L1_160(L2_161)
    })[1] = L1_160
    ;({
      [5] = L1_160(L2_161)
    })[2] = L2_161
    ;({
      [5] = L1_160(L2_161)
    })[3] = L3_162
    ;({
      [5] = L1_160(L2_161)
    })[4] = L4_163
    _old_cube_fix_tbl = L0_159
    L4_163 = L1_160(L2_161)
    ;({
      [5] = L1_160(L2_161)
    })[1] = L1_160
    ;({
      [5] = L1_160(L2_161)
    })[2] = L2_161
    ;({
      [5] = L1_160(L2_161)
    })[3] = L3_162
    ;({
      [5] = L1_160(L2_161)
    })[4] = L4_163
    _old_cube_float_tbl = L0_159
    _old_shift_col_tbl = L0_159
    for L3_162, L4_163 in L0_159(L1_160) do
      _old_shift_col_tbl[L3_162] = {}
      for _FORV_8_, _FORV_9_ in pairs(_shift_col_tbl) do
        _old_shift_col_tbl[_FORV_8_] = _FORV_9_
      end
    end
    _old_shift_mkr_tbl = L0_159
    for L3_162, L4_163 in L0_159(L1_160) do
      _old_shift_mkr_tbl[L3_162] = L4_163
    end
    _old_shift_sensor_tbl = L0_159
    for L3_162, L4_163 in L0_159(L1_160) do
      _old_shift_sensor_tbl[L3_162] = L4_163
    end
    for L3_162, L4_163 in L0_159(L1_160) do
      for _FORV_8_, _FORV_9_ in pairs(L4_163) do
        _FORV_9_:try_term()
      end
    end
    _cube_sensor_tbl = L0_159
    for L3_162, L4_163 in L0_159(L1_160) do
      L4_163:try_term()
    end
    _node_float_tbl = L0_159
    for L3_162, L4_163 in L0_159(L1_160) do
      L4_163:try_term()
    end
    _node_joint_tbl = L0_159
    _eff_fix_tbl = L0_159
    _eff_float_tbl = L0_159
    _cube_dummy_tbl = L0_159
    _cube_fix_tbl = L0_159
    _cube_float_tbl = L0_159
    _shift_col_tbl = L0_159
    _shift_mkr_tbl = L0_159
    _shift_sensor_tbl = L0_159
    if L0_159 ~= nil then
      L0_159(L1_160)
    end
  end)
end
function requestCreateDummyGimmick(A0_164)
  invokeTask(function()
    createDummyGimmick(A0_164, _DUMMY_CUBE_NUM, 10, 15)
  end)
end
function requestBreakStage(A0_165)
  _cube_break = invokeTask(function()
    local L0_166, L1_167, L2_168
    L0_166 = _chain_tbl
    L1_167 = A0_165
    L0_166 = L0_166[L1_167]
    L1_167 = _chain_tbl
    L2_168 = A0_165
    L1_167 = L1_167[L2_168]
    L1_167 = #L1_167
    L0_166 = L0_166[L1_167]
    L1_167 = _chain_tbl
    L2_168 = A0_165
    L1_167 = L1_167[L2_168]
    L2_168 = _chain_tbl
    L2_168 = L2_168[A0_165]
    L2_168 = #L2_168
    L2_168 = L2_168 - 1
    L1_167 = L1_167[L2_168]
    L2_168 = false
    while L0_166 > L1_167 do
      _old_cube_fix_tbl[L0_166]:requestBreak(Vector(0, 10, 0), 1)
      L0_166 = L0_166 - 1
      waitSeconds(0.5)
      if L2_168 == false then
        Sound:playSE("kit064a", 1)
        L2_168 = true
      end
    end
  end)
end
function requestPrevStageKill()
  local L0_169, L1_170, L2_171, L3_172, L4_173
  if L0_169 ~= nil then
    if L0_169 then
      L0_169(L1_170)
    end
  end
  _cube_break = nil
  L0_169(L1_170)
  _theater_hdl = nil
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _theater_col_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _fall_col_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _old_cube_dummy_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    for _FORV_8_, _FORV_9_ in pairs(L4_173) do
      _FORV_9_:try_term()
    end
  end
  _old_shift_col_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _old_shift_mkr_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _old_shift_sensor_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _old_cube_fix_tbl = L0_169
  for L3_172, L4_173 in L0_169(L1_170) do
    L4_173:try_term()
  end
  _old_cube_dummy_tbl = L0_169
end
