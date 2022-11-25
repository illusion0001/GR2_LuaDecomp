dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
_mission_view = false
_ep15_d_sdemo = nil
_requestTask = {}
_requestResult = {}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  L1_1 = 1
  while RAC_createGemAsync("gem" .. string.format("%02d", L1_1), GEM_ENERGY, "locator2_tgem_" .. string.format("%02d", L1_1)) ~= nil do
    L1_1 = L1_1 + 1
  end
  _ep15_d_sdemo = SDemo.create("ep15_d_sdemo")
  Mob:makeSituationPanic(true)
  Mob:letStateMode(Mob.StateMode.kGrigoSuspend, true)
end
function Ingame()
  Area:gravityStorm(Vector(-410, 219, 40), 100)
  while true do
    dispatchRequestTask()
    wait()
  end
end
function ingameSection(A0_2, A1_3, A2_4)
  local L3_5
  L3_5 = {}
  L3_5.msl_sdemo = missileSDemo
  L3_5.msl_game_init = initMissile
  L3_5.msl_game_loop = loopMissile
  return L3_5[A0_2](A1_3, A2_4)
end
function dispatchRequestTask()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6 = {}
  for L4_10, _FORV_5_ in L1_7(L2_8) do
    if _FORV_5_ ~= nil and not _FORV_5_:isRunning() then
      table.insert(L0_6, L4_10)
    end
  end
  for L4_10, _FORV_5_ in L1_7(L2_8) do
    if _requestTask[_FORV_5_] ~= nil then
      _requestTask[_FORV_5_]:abort()
      _requestTask[_FORV_5_] = nil
    end
  end
end
function Finalize()
  Area:gravityStorm()
  Mob:makeSituationPanic(false)
  Mob:letStateMode(Mob.StateMode.kGrigoSuspend, false)
  Mob:topUpHatchery()
  if Fn_getPlayer() then
    Camera:stopShake(0)
  end
  if _se_hdl then
    Sound:stopSEHandle(_se_hdl)
    _se_hdl = nil
  end
end
function requestSection(A0_11, A1_12, A2_13)
  local L3_14
  L3_14 = _requestResult
  L3_14[A0_11] = nil
  L3_14 = _requestTask
  L3_14[A0_11] = invokeTask(function()
    _requestResult[A0_11] = ingameSection(A0_11, A1_12, A2_13)
  end)
end
function isSectionEnd(A0_15)
  if _requestTask[A0_15] == nil or not _requestTask[A0_15]:isRunning() then
    return true
  end
  return false
end
function setMissionView()
  local L0_16, L1_17
  _mission_view = true
end
function isMissionView()
  local L0_18, L1_19
  L0_18 = _mission_view
  return L0_18
end
MSL_PARAM = {
  {
    SPEED = 1100,
    DATA = {
      {IDX = 1, DELAY = 0},
      {IDX = 2, DELAY = 0}
    }
  },
  {
    SPEED = 1050,
    DATA = {
      {IDX = 3, DELAY = 0},
      {IDX = 4, DELAY = 0}
    }
  },
  {
    SPEED = 1000,
    DATA = {
      {IDX = 5, DELAY = 0},
      {IDX = 6, DELAY = 0}
    }
  },
  {
    SPEED = 1100,
    DATA = {
      {IDX = 7, DELAY = 0},
      {IDX = 8, DELAY = 0},
      {IDX = 9, DELAY = 0}
    }
  },
  {
    SPEED = 1100,
    DATA = {
      {IDX = 10, DELAY = 0},
      {IDX = 11, DELAY = 0},
      {IDX = 12, DELAY = 3},
      {IDX = 13, DELAY = 3}
    }
  }
}
GAMEOVER_EF_MAX = 6
MSL_DAMAGE = 0.3
MSL_RADIUS = 8
MSL_GRAB_RANGE = 18
_msl_hdl = {}
_msl_dnode = {}
_msl_navi = {}
_msl_goal = {}
_msl_break_flag = {}
_msl_last = 0
_msl_clear = false
_msl_bill_hit = false
_msl_caption_flag = false
_grab_caption_flag = false
_grab_caption_view = false
_gameover_flag = false
_initialize_flag = false
function initMissile()
  if _initialize_flag == false then
    findGameObject2("Sensor", "cubesensormulti2_building_break_01"):setDetectMode(0)
    findGameObject2("Sensor", "cubesensormulti2_building_break_01"):setDetectBehavior(0)
    findGameObject2("Sensor", "cubesensormulti2_building_break_01"):setFilterType("DNode")
    findGameObject2("Sensor", "cubesensormulti2_building_break_01"):setFilterName("msl_dnode")
    Fn_sensorOn("cubesensormulti2_building_break_01")
    _initialize_flag = true
  end
end
function loopMissile(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30
  for L5_25 = A0_20, A1_21 do
    L9_29 = "\229\183\161\231\155\174"
    L6_26(L7_27)
    _msl_last = 0
    for L9_29, L10_30 in L6_26(L7_27) do
      invokeTask(function()
        local L0_31
        L0_31 = L10_30.IDX
        waitSeconds(L10_30.DELAY)
        createMissile(L0_31)
        moveMissile(L5_25, L0_31, _msl_hdl[L0_31], _msl_goal[L0_31], MSL_PARAM[L5_25].SPEED)
        if L0_31 == 1 then
          RAC_LookAtObjectWait(_msl_hdl[L0_31]:getRoot(), nil, 0.2)
        elseif L0_31 == 12 then
          invokeTask(function()
            waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
            if Player:getEnergy(Player.kEnergy_Life) > 0 then
              Fn_captionView("ep15_03006")
            end
          end)
        end
      end)
      _msl_last = _msl_last + 1
      break
    end
    while true do
      if L6_26 == false then
        if L6_26 == true then
          L6_26()
        end
        if L6_26 == true then
          if L6_26 == false then
            if L6_26 == false then
              _grab_caption_view = true
              L6_26(L7_27)
            end
          end
        elseif L6_26 == false then
          if L6_26 == true then
            _grab_caption_view = false
            L6_26()
          end
        end
        _msl_grab_flag = false
        _grab_caption_flag = false
        L6_26()
      end
    end
    L6_26()
    L6_26()
    break
  end
end
function finalizeMissile()
  for _FORV_3_, _FORV_4_ in pairs(_msl_hdl) do
    if _msl_hdl[_FORV_3_] ~= nil then
      _msl_hdl[_FORV_3_]:abort()
      _msl_hdl[_FORV_3_] = nil
    end
  end
end
function createMissile(A0_32)
  local L1_33, L2_34
  L1_33 = "locator2_msl_start_"
  L2_34 = string
  L2_34 = L2_34.format
  L2_34 = L2_34("%02d", A0_32)
  L1_33 = L1_33 .. L2_34
  L2_34 = "locator2_msl_goal_"
  L2_34 = L2_34 .. string.format("%02d", A0_32)
  _msl_hdl[A0_32] = createGimmickMissileObj(L1_33, "gimmick_msl" .. string.format("%02d", A0_32))
  _msl_goal[A0_32] = findGameObject2("Node", L2_34)
  start_game_obj()
  _msl_hdl[A0_32]:getMissile():setLockonPermission(true)
  print(tostring(string.format("%02d", A0_32)) .. ":CreateMsl\229\174\159\232\161\140\231\181\130\228\186\134")
end
function createGimmickMissileObj(A0_35, A1_36)
  local L2_37, L3_38, L4_39, L5_40, L6_41, L7_42
  L2_37 = findGameObject2
  L3_38 = "Node"
  L4_39 = A0_35
  L2_37 = L2_37(L3_38, L4_39)
  L3_38 = "missile_md_01"
  L4_39 = {}
  L5_40 = createGameObject2
  L6_41 = "GimmickBg"
  L5_40 = L5_40(L6_41)
  L6_41 = createGameObject2
  L7_42 = "Node"
  L6_41 = L6_41(L7_42)
  L7_42 = L6_41.setName
  L7_42(L6_41, A1_36 .. "_root")
  L7_42 = L5_40.setName
  L7_42(L5_40, A1_36)
  L7_42 = L5_40.setDrawModelName
  L7_42(L5_40, L3_38)
  L7_42 = L5_40.setCollisionName
  L7_42(L5_40, L3_38)
  L7_42 = L5_40.setAttributeName
  L7_42(L5_40, L3_38)
  L7_42 = L5_40.setIgnoreGrab
  L7_42(L5_40, false)
  L7_42 = L5_40.setCollidableBlockEnable
  L7_42(L5_40, false)
  L7_42 = L5_40.setVisiblePermission
  L7_42(L5_40, true)
  L7_42 = L5_40.setVisibleBlockEnable
  L7_42(L5_40, false)
  L7_42 = print
  L7_42("HDL]BODY_NAME:" .. tostring(L5_40:getName()) .. tostring(L5_40:getTypeName()))
  while true do
    L7_42 = L5_40.isLoading
    L7_42 = L7_42(L5_40)
    if L7_42 then
      L7_42 = wait
      L7_42()
    end
  end
  L7_42 = L2_37.appendChild
  L7_42(L2_37, L6_41)
  L7_42 = L6_41.appendChild
  L7_42(L6_41, L5_40)
  L7_42 = L5_40.try_init
  L7_42(L5_40)
  L7_42 = L5_40.waitForReady
  L7_42(L5_40)
  L7_42 = L5_40.try_start
  L7_42(L5_40)
  L7_42 = {}
  L7_42.root_hdl = L6_41
  L7_42.msl_hdl = L5_40
  L7_42.eff_hdl = RAC_createEffect({
    eff_name = "ef_ev_firbnr_01",
    parent_hdl = L7_42.root_hdl,
    loop = true,
    off_pos = Vector(0, 0, -2.5),
    off_rot = YRotQuat(Deg2Rad(180))
  })
  L7_42.se_hdl = Sound:playSEHandle("ep15_missile_move", 1, nil, L7_42.root_hdl)
  L7_42.restore = false
  function L7_42.update(A0_43)
    while A0_43.msl_hdl ~= nil and (A0_43.restore ~= false or not A0_43.msl_hdl:isBroken()) and not A0_43.msl_hdl:isGrabbed() do
      wait()
    end
    if A0_43.eff_hdl ~= nil then
      A0_43.eff_hdl:abort()
      A0_43.eff_hdl = nil
    end
    if A0_43.se_hdl ~= nil then
      Sound:stopSEHandle(A0_43.se_hdl)
      A0_43.se_hdl = nil
    end
    while true do
      while true do
        if A0_43.msl_hdl:getDynamicObject() ~= nil and A0_43.msl_hdl:getDynamicObject():isBroken() then
          RAC_setBulletShockwave(A0_43.msl_hdl:getDynamicObject():getWorldPos(), Player:getEnergyMax(Player.kEnergy_Life) * MSL_DAMAGE, MSL_RADIUS, "ep15_missile_exp")
          break
        elseif A0_43.msl_hdl:isBroken() then
          RAC_setBulletShockwave(A0_43.msl_hdl:getWorldPos(), Player:getEnergyMax(Player.kEnergy_Life) * MSL_DAMAGE, MSL_RADIUS, "ep15_missile_exp")
          break
        end
        wait()
      end
    end
    while true do
      wait()
    end
  end
  function L7_42.destractor(A0_44)
    if A0_44.eff_hdl ~= nil then
      A0_44.eff_hdl:abort()
      A0_44.eff_hdl = nil
    end
    if A0_44.se_hdl ~= nil then
      Sound:stopSEHandle(A0_44.se_hdl)
      A0_44.se_hdl = nil
    end
    if A0_44.msl_hdl ~= nil then
      if A0_44.msl_hdl:getDynamicObject() ~= nil then
        A0_44.msl_hdl:getDynamicObject():try_term()
      end
      A0_44.msl_hdl:try_term()
      A0_44.msl_hdl = nil
    end
    if A0_44.root_hdl ~= nil then
      A0_44.root_hdl:try_term()
      A0_44.root_hdl = nil
    end
  end
  RAC_InvokeTaskWithDestractor(L7_42.update, L7_42.destractor, L7_42).task_obj = L7_42
  RAC_InvokeTaskWithDestractor(L7_42.update, L7_42.destractor, L7_42).getRoot = function(A0_45)
    return A0_45.task_obj.root_hdl
  end
  RAC_InvokeTaskWithDestractor(L7_42.update, L7_42.destractor, L7_42).getMissile = function(A0_46)
    return A0_46.task_obj.msl_hdl
  end
  RAC_InvokeTaskWithDestractor(L7_42.update, L7_42.destractor, L7_42).setRestore = function(A0_47, A1_48)
    A0_47.task_obj.restore = A1_48
  end
  RAC_InvokeTaskWithDestractor(L7_42.update, L7_42.destractor, L7_42).isRestore = function(A0_49)
    return A0_49.task_obj.restore
  end
  return (RAC_InvokeTaskWithDestractor(L7_42.update, L7_42.destractor, L7_42))
end
function missileBlocking(A0_50, A1_51)
  if _msl_break_flag[A1_51] ~= true then
    if _msl_navi[A1_51] ~= nil then
      RAC_MultiNaviDel(_msl_navi[A1_51])
      _msl_navi[A1_51] = nil
    end
    _msl_last = _msl_last - 1
    if _gameover_flag == false then
      print(tostring(A1_51) .. "\231\153\186\231\155\174\227\129\174\227\131\159\227\130\181\227\130\164\227\131\171\227\130\146\231\160\180\229\163\138:\227\131\159\227\130\181\227\130\164\227\131\171\230\174\139\227\130\138" .. _msl_last)
      if A0_50 == 1 then
        if _msl_last == 0 then
          invokeTask(function()
            waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
            if Player:getEnergy(Player.kEnergy_Life) > 0 then
              Fn_captionView("ep15_03003")
            end
          end)
          _gotoNextPhase()
        end
      elseif A0_50 == 2 then
        if _msl_last == 0 then
          invokeTask(function()
            waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
            if Player:getEnergy(Player.kEnergy_Life) > 0 then
              Fn_captionView("ep15_03004")
            end
          end)
          _gotoNextPhase()
        end
      elseif A0_50 == 3 then
        if _msl_last == 0 then
          _gotoNextPhase()
        end
      elseif A0_50 == 4 then
        if _msl_last == 0 then
          _gotoNextPhase()
        end
      elseif A0_50 == 5 and _msl_last == 0 then
        playerCoerctionStop(true)
        _msl_clear = true
        _gotoNextPhase()
      end
    end
  end
  _msl_break_flag[A1_51] = true
end
function moveMissile(A0_52, A1_53, A2_54, A3_55, A4_56)
  return invokeTask(function()
    local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68, L12_69
    L0_57 = A2_54
    L1_58 = L0_57
    L0_57 = L0_57.getRoot
    L0_57 = L0_57(L1_58)
    L1_58 = A2_54
    L2_59 = L1_58
    L1_58 = L1_58.getMissile
    L1_58 = L1_58(L2_59)
    L3_60 = L1_58
    L2_59 = L1_58.getWorldRot
    L2_59 = L2_59(L3_60)
    L4_61 = L1_58
    L3_60 = L1_58.getWorldPos
    L3_60 = L3_60(L4_61)
    L4_61 = A3_55
    L5_62 = L4_61
    L4_61 = L4_61.getWorldPos
    L4_61 = L4_61(L5_62)
    L5_62 = L4_61.x
    L6_63 = L3_60.x
    L5_62 = L5_62 - L6_63
    L6_63 = L4_61.y
    L7_64 = L3_60.y
    L6_63 = L6_63 - L7_64
    L7_64 = L4_61.z
    L8_65 = L3_60.z
    L7_64 = L7_64 - L8_65
    L8_65 = L1_58.getWorldPos
    L8_65 = L8_65(L9_66)
    L9_66(L10_67)
    for L12_69 = 1, A4_56 do
      L1_58 = A2_54:getMissile()
      L8_65.x = moveMissileCalc(L3_60.x, L4_61.x, L5_62, L12_69, A4_56)
      L8_65.y = moveMissileCalc(L3_60.y, L4_61.y, L6_63, L12_69, A4_56)
      L8_65.z = moveMissileCalc(L3_60.z, L4_61.z, L7_64, L12_69, A4_56)
      L0_57:setWorldPos(L8_65)
      if A2_54:isRestore() == false and L1_58:isBroken() then
        missileBlocking(A0_52, A1_53)
        print(A1_53 .. ":\233\128\154\229\184\184\227\129\174Broken\227\130\146\231\162\186\232\170\141*************")
        break
      elseif A2_54:isRestore() == true and L1_58:isBroken() == false then
        A2_54:setRestore(false)
      end
      if L1_58:isGrabbed() then
        missileBlocking(A0_52, A1_53)
        print(A1_53 .. ":\233\128\154\229\184\184\227\129\174isGrabbed\227\130\146\231\162\186\232\170\141***************************")
        break
      end
      if Fn_get_distance(L1_58:getWorldPos(), Fn_getPlayerWorldPos()) < MSL_GRAB_RANGE then
        _grab_caption_flag = true
      end
      if L12_69 == A4_56 then
        if _msl_navi[A1_53] ~= nil then
          RAC_MultiNaviDel(_msl_navi[A1_53])
          _msl_navi[A1_53] = nil
        end
        L1_58:requestBreak(L1_58:getWorldPos(), 0)
        gameOverEnter()
        break
      end
      if L1_58:getDynamicObject() ~= nil then
        L1_58:requestRestoreForce()
        L1_58:setWorldTransform(L8_65, L2_59)
        A2_54:setRestore(true)
      end
      wait()
    end
    if L9_66 == nil then
    else
      L12_69 = "DNode"
      L9_66[L10_67] = L11_68
      while true do
        if L10_67 ~= nil then
          if L10_67 then
            _msl_grab_flag = true
          end
          if L10_67 == true then
            L12_69 = A1_53
            L10_67(L11_68, L12_69)
            L12_69 = ":\227\131\128\227\130\164\227\131\138\227\131\159\227\131\131\227\130\175\229\164\137\230\143\155\239\188\154\231\160\180\229\163\138\227\130\146\231\162\186\232\170\141-********************"
            L10_67(L11_68)
            L12_69 = "msl_dnode"
            L10_67(L11_68, L12_69)
            L12_69 = MSL_RADIUS
            L12_69 = L12_69 * 3
            L10_67(L11_68, L12_69)
            L12_69 = L9_66.getWorldPos
            L12_69 = L12_69(L9_66)
            L10_67(L11_68, L12_69, L12_69(L9_66))
            L10_67(L11_68)
            L10_67(L11_68)
            L10_67(L11_68)
            L10_67(L11_68)
            L10_67()
            break
          end
        end
        L10_67()
      end
    end
  end)
end
function moveMissileCalc(A0_70, A1_71, A2_72, A3_73, A4_74)
  local L6_75
  L6_75 = 0
  if A0_70 ~= A1_71 then
    L6_75 = A0_70 + A2_72 * (A3_73 / A4_74)
  else
    L6_75 = A0_70
  end
  return L6_75
end
function gameOverEnter()
  local L0_76
  L0_76 = {
    "locator2_gm_ef_01",
    "locator2_gm_ef_02",
    "locator2_gm_ef_03",
    "locator2_gm_ef_04",
    "locator2_gm_ef_05",
    "locator2_gm_ef_06",
    "locator2_gm_ef_07",
    "locator2_gm_ef_08",
    "locator2_gm_ef_09",
    "locator2_gm_ef_10",
    "locator2_gm_ef_11",
    "locator2_gm_ef_12",
    "locator2_gm_ef_13",
    "locator2_gm_ef_14",
    "locator2_gm_ef_15",
    "locator2_gm_ef_16",
    "locator2_gm_ef_17",
    "locator2_gm_ef_18"
  }
  if _gameover_flag == true then
    return true
  end
  _gameover_flag = true
  if Player:getEnergy(Player.kEnergy_Life) <= 0 then
    return true
  end
  playerCoerctionStop(true)
  if _msl_bill_hit == false then
    Fn_captionView("ep15_03007")
  else
    Fn_captionView("ep15_03008")
  end
  for _FORV_5_ = 1, GAMEOVER_EF_MAX do
    Fn_createEffect("exp", "ef_com_exp_11m", ({
      "locator2_msl_goal_01",
      "locator2_msl_goal_02",
      "locator2_msl_goal_03",
      "locator2_msl_goal_04",
      "locator2_msl_goal_05",
      "locator2_msl_goal_06",
      "locator2_msl_goal_07",
      "locator2_msl_goal_08",
      "locator2_msl_goal_09",
      "locator2_msl_goal_10",
      "locator2_msl_goal_11",
      "locator2_msl_goal_12",
      "locator2_msl_goal_13",
      "locator2_msl_goal_01"
    })[_FORV_5_], false)
    Sound:playSEHandle("ep15_missile_exp", 1, nil, findGameObject2("Node", ({
      "locator2_msl_goal_01",
      "locator2_msl_goal_02",
      "locator2_msl_goal_03",
      "locator2_msl_goal_04",
      "locator2_msl_goal_05",
      "locator2_msl_goal_06",
      "locator2_msl_goal_07",
      "locator2_msl_goal_08",
      "locator2_msl_goal_09",
      "locator2_msl_goal_10",
      "locator2_msl_goal_11",
      "locator2_msl_goal_12",
      "locator2_msl_goal_13",
      "locator2_msl_goal_01"
    })[_FORV_5_]))
    Fn_createEffect("exp", "ef_com_exp_11m", ({
      "locator2_msl_goal_01",
      "locator2_msl_goal_02",
      "locator2_msl_goal_03",
      "locator2_msl_goal_04",
      "locator2_msl_goal_05",
      "locator2_msl_goal_06",
      "locator2_msl_goal_07",
      "locator2_msl_goal_08",
      "locator2_msl_goal_09",
      "locator2_msl_goal_10",
      "locator2_msl_goal_11",
      "locator2_msl_goal_12",
      "locator2_msl_goal_13",
      "locator2_msl_goal_01"
    })[_FORV_5_ + 7], false)
    Sound:playSEHandle("ep15_missile_exp", 1, nil, findGameObject2("Node", ({
      "locator2_msl_goal_01",
      "locator2_msl_goal_02",
      "locator2_msl_goal_03",
      "locator2_msl_goal_04",
      "locator2_msl_goal_05",
      "locator2_msl_goal_06",
      "locator2_msl_goal_07",
      "locator2_msl_goal_08",
      "locator2_msl_goal_09",
      "locator2_msl_goal_10",
      "locator2_msl_goal_11",
      "locator2_msl_goal_12",
      "locator2_msl_goal_13",
      "locator2_msl_goal_01"
    })[_FORV_5_ + 7]))
    Fn_createEffect("exp", "ef_com_exp_11m", L0_76[_FORV_5_], false)
    Sound:playSEHandle("ep15_missile_exp", 1, nil, findGameObject2("Node", L0_76[_FORV_5_]))
    Fn_createEffect("exp", "ef_com_exp_11m", L0_76[_FORV_5_ + 6], false)
    Sound:playSEHandle("ep15_missile_exp", 1, nil, findGameObject2("Node", L0_76[_FORV_5_ + 6]))
    Fn_createEffect("exp", "ef_com_exp_11m", L0_76[_FORV_5_ + 12], false)
    Sound:playSEHandle("ep15_missile_exp", 1, nil, findGameObject2("Node", L0_76[_FORV_5_ + 12]))
    waitSeconds(0.3 * (_FORV_5_ % 3 + 1))
    if _FORV_5_ == GAMEOVER_EF_MAX - 2 then
      Fn_whiteout(3)
    end
  end
  waitSeconds(2)
  while not HUD:faderStability() do
    wait()
  end
  Player:setStay(false)
  Fn_fadein(nil, false)
  Fn_scriptGameOver(true)
  while true do
    wait()
  end
end
function cubesensormulti2_building_break_01_OnEnter(A0_77, A1_78)
  print("cubesensormulti2_building_break_01_OnEnter.." .. A1_78:getName())
  if _msl_clear == false then
    _msl_bill_hit = true
  end
end
_missile_trans_speed = 0.05
_missile_rotate_speed = 0
function missileSDemo()
  local L0_79, L1_80, L2_81, L3_82, L4_83
  L0_79 = Sound
  L1_80 = L0_79
  L0_79 = L0_79.pulse
  L2_81 = "ep15_radio_call"
  L0_79(L1_80, L2_81)
  L0_79 = waitSeconds
  L1_80 = 1
  L0_79(L1_80)
  L0_79 = Fn_kaiwaDemoView
  L1_80 = "ep15_00210k"
  L0_79(L1_80)
  L0_79 = Fn_blackout
  L0_79()
  L0_79 = createGimmickMissileObj
  L1_80 = "locator2_msl_demo_01"
  L2_81 = "msl_demo_01"
  L0_79 = L0_79(L1_80, L2_81)
  L1_80 = findGameObject2
  L2_81 = "Node"
  L3_82 = "locator2_msl_cam_node_01"
  L1_80 = L1_80(L2_81, L3_82)
  L2_81 = findGameObject2
  L3_82 = "Node"
  L4_83 = "locator2_msl_cam_node_02"
  L2_81 = L2_81(L3_82, L4_83)
  L3_82 = findGameObject2
  L4_83 = "Node"
  L3_82 = L3_82(L4_83, "locator2_msl_aim_node_01")
  L4_83 = findGameObject2
  L4_83 = L4_83("Node", "locator2_msl_aim_node_02")
  L0_79:getRoot():appendChild(L2_81, true)
  L0_79:getRoot():appendChild(L4_83, true)
  Fn_resetPcPos("locator2_demo_player_pos_01")
  Fn_setKittenAndCatActive(false)
  _ep15_d_sdemo:set(L1_80, L3_82, kSDEMO_APPEND_ALL)
  _ep15_d_sdemo:play()
  waitSeconds(0.5)
  Fn_fadein()
  waitSeconds(1)
  _ep15_d_sdemo:play({
    {
      pos = L2_81,
      time = 0.5,
      hashfunc = "EaseIn"
    }
  }, {
    {
      pos = L4_83,
      time = 0.5,
      hashfunc = "EaseIn"
    }
  })
  _se_hdl = Sound:playSEHandle("ep15_missile_move", 1, nil, L0_79)
  while _ep15_d_sdemo:isPlay() do
    wait()
  end
  _ep15_d_sdemo:set(L2_81, L4_83, kSDEMO_APPEND_ALL)
  _ep15_d_sdemo:play()
  _missile_trans_speed = 1
  _missile_rotate_speed = 0.2
  Camera:shake2D(0, 0.01, 10, 0)
  waitSeconds(3)
  Sound:stopSEHandle(_se_hdl)
  _se_hdl = nil
  Fn_blackout()
  L0_79:abort()
  Camera:stopShake(0)
  if invokeTask(function()
    local L0_84, L1_85
    L0_84 = L0_79
    L1_85 = L0_84
    L0_84 = L0_84.getRoot
    L0_84 = L0_84(L1_85)
    while true do
      L1_85 = L0_84.getPos
      L1_85 = L1_85(L0_84)
      L1_85.z = L1_85.z + _missile_trans_speed
      L0_84:setPos(L1_85)
      L0_79:getRoot():setWorldRot(L0_79:getRoot():getWorldRot() * YRotQuat(Deg2Rad(360 - _missile_rotate_speed)))
      wait()
    end
  end) ~= nil then
    invokeTask(function()
      local L0_86, L1_87
      L0_86 = L0_79
      L1_87 = L0_86
      L0_86 = L0_86.getRoot
      L0_86 = L0_86(L1_87)
      while true do
        L1_87 = L0_86.getPos
        L1_87 = L1_87(L0_86)
        L1_87.z = L1_87.z + _missile_trans_speed
        L0_86:setPos(L1_87)
        L0_79:getRoot():setWorldRot(L0_79:getRoot():getWorldRot() * YRotQuat(Deg2Rad(360 - _missile_rotate_speed)))
        wait()
      end
    end):abort()
  end
  _ep15_d_sdemo:stop()
  _ep15_d_sdemo = nil
  Fn_setKittenAndCatActive(true)
end
