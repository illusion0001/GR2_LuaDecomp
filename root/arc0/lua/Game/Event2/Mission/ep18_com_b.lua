dofile("/Game/Event2/Common/HeaderCommon.lua")
_isMoveEnd_ep18_d = false
_kali_brain = nil
_enmgen2_kali_gen = nil
_boss_gauge = nil
_kali_pup = nil
_sdemo = nil
_is_kalidead = false
_startSdemo = false
_startEPart = false
_isSdemoFinish = false
_ropeway_hdl_01 = nil
_ropeway_hdl_02 = nil
_floater_on = false
_set_stay_end = false
_param = {
  tx = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 1,
    min_t = 0
  },
  ty = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 1,
    min_t = 0
  },
  tz = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 1,
    min_t = 0
  },
  rx = {
    rand = 0,
    sign = 0,
    max_a = 5,
    min_a = 0,
    max_t = 1,
    min_t = 0.5
  },
  ry = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 1,
    min_t = 0
  },
  rz = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 1,
    min_t = 0
  }
}
enmgen2_kali_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_01",
      name = "kali_01"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end
}
enmgen2_kali_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_01",
      name = "kali_02",
      ai_spawn_option = "Kali/kali_boss_ep18e"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
    A0_24:getSpecTable().enemyDeadNum = A0_24:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_26)
    return #A0_26.spawnSet
  end,
  getEnemyDeadNum = function(A0_27)
    local L1_28
    L1_28 = A0_27.enemyDeadNum
    return L1_28
  end,
  getEnemyName = function(A0_29, A1_30)
    local L2_31
    L2_31 = A0_29.spawnSet
    L2_31 = L2_31[A1_30]
    L2_31 = L2_31.name
    return L2_31
  end
}
function Initialize()
  _sdemo = SDemo.create("ep18_d")
  _enmgen2_kali_gen = findGameObject2("EnemyGenerator", "enmgen2_kali_02")
  _enmgen2_kali_gen:requestSpawn()
  _kali_brain = findGameObject2("EnemyBrain", "kali_02")
  _kali_pup = findGameObject2("Puppet", "kali_02")
  if Fn_getMissionPart() == "ep18_e" then
    _startEPart = true
  else
    _enmgen2_kali_gen:requestIdlingEnemy(true)
    _kali_pup:setVisible(false)
  end
  _ropeway_hdl_01 = createGameObject2("GimmickBg")
  _ropeway_hdl_01:setName("ropeway_01")
  _ropeway_hdl_01:setDrawModelName("g1_ropeway_pd_01")
  _ropeway_hdl_01:setCollisionName("g1_ropeway_pd_01")
  _ropeway_hdl_01:setVisibleBlockEnable(false)
  _ropeway_hdl_02 = createGameObject2("GimmickBg")
  _ropeway_hdl_02:setName("ropeway_02")
  _ropeway_hdl_02:setDrawModelName("g1_ropeway_pd_02")
  _ropeway_hdl_02:setCollisionName("g1_ropeway_pd_02")
  _ropeway_hdl_02:setVisibleBlockEnable(false)
  Fn_findAreaHandle("dt_a_root"):appendChild(_ropeway_hdl_01)
  Fn_findAreaHandle("dt_a_root"):appendChild(_ropeway_hdl_02)
  _ropeway_hdl_01:setTransform(findGameObject2("Node", "locator2_ropeway_route_00"):getTransform())
  _ropeway_hdl_01:setForceMove()
  _ropeway_hdl_02:setTransform(findGameObject2("Node", "locator2_ropeway_route_00a"):getTransform())
  _ropeway_hdl_02:setForceMove()
end
function Ingame()
  playEffect()
  if Fn_getMissionPart() == "ep18_d" then
    _kali_pup:setVisible(false)
    _enmgen2_kali_gen:setEnemyMarker(false)
    _kali_brain:setEnableHomingTarget(false)
    _enmgen2_kali_gen = findGameObject2("EnemyGenerator", "enmgen2_kali_01")
    _enmgen2_kali_gen:requestSpawn()
    _kali_brain = findGameObject2("EnemyBrain", "kali_01")
    _kali_pup = findGameObject2("Puppet", "kali_01")
    setStayKali()
  end
  repeat
    wait()
  until Fn_getMissionPart() ~= "ep18_d"
  repeat
    wait()
  until _startSdemo
  if _startEPart == false then
    _enmgen2_kali_gen:requestAllEnemyKill(false)
    _enmgen2_kali_gen = findGameObject2("EnemyGenerator", "enmgen2_kali_02")
    _kali_brain = findGameObject2("EnemyBrain", "kali_02")
    _kali_pup = findGameObject2("Puppet", "kali_02")
    _kali_pup:setVisible(true)
    _enmgen2_kali_gen:setEnemyMarker(false)
    _kali_brain:setEnableHomingTarget(true)
    _enmgen2_kali_gen:requestIdlingEnemy(false)
  end
  repeat
    wait()
  until Fn_getMissionPart() ~= "ep18_e"
end
function playEffect()
  local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37
  for L3_35 = 11, 14 do
    L4_36 = "locator2_Durga_Crystal_"
    L5_37 = string
    L5_37 = L5_37.format
    L5_37 = L5_37("%02d", L3_35)
    L4_36 = L4_36 .. L5_37
    L5_37 = "durga_effect_1_"
    L5_37 = L5_37 .. string.format("%02d", L3_35)
  end
end
function playScriptDemo()
  local L0_38
  L0_38 = findGameObject2
  L0_38 = L0_38("Node", "camnode2_d_01")
  invokeTask(function()
    _sdemo:set(L0_38, {
      target = _kali_pup,
      joint = "bn_head"
    }, true)
  end)
  _sdemo:setCameraParam(nil, 0.1, {deg = 30})
  _enmgen2_kali_gen:setEnemyMarker(false)
  _kali_brain:setEnableHomingTarget(false)
  invokeTask(function()
    _sdemo:play()
    _sdemo:zoomIn(5.2, {deg = 12}, "easeIn")
    _sdemo:stop(1)
    _isSdemoFinish = true
  end)
end
function checkSdemoFinish()
  local L0_39, L1_40
  L0_39 = _isSdemoFinish
  return L0_39
end
function kali_HPgauge_ep18_d()
  invokeTask(function()
    _boss_gauge = HUD:createBossHpGauge({
      obj = findGameObject2("Puppet", "kali_01")
    })
    _boss_gauge:setActive(true)
    _boss_gauge:setHp(0.6)
    repeat
      wait()
    until Fn_getMissionPart() ~= "ep18_d"
    _boss_gauge:setActive(false)
  end)
end
function setStayKali()
  invokeTask(function()
    while _kali_brain:isReadyEnemy() == false do
      wait()
    end
    _kali_brain:playMotion("stay")
    _set_stay_end = true
  end)
end
function moveSeq()
  invokeTask(function()
    local L0_41, L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48
    L0_41 = _kali_brain
    L1_42 = L0_41
    L0_41 = L0_41.setInvincibility
    L2_43 = true
    L0_41(L1_42, L2_43)
    while true do
      while true do
        L0_41 = _kali_brain
        L1_42 = L0_41
        L0_41 = L0_41.isReadyEnemy
        L0_41 = L0_41(L1_42)
        if L0_41 == false then
          L0_41 = wait
          L0_41()
        end
      end
    end
    while true do
      L0_41 = _set_stay_end
      if L0_41 == false then
        L0_41 = wait
        L0_41()
      end
    end
    L0_41 = {L1_42}
    L1_42 = "locator2_kali_start_01"
    L1_42 = _kali_brain
    L2_43 = L1_42
    L1_42 = L1_42.move
    L3_44 = L0_41
    L1_42(L2_43, L3_44)
    L1_42 = wait
    L2_43 = 34
    L1_42(L2_43)
    L1_42 = {}
    L1_42.height = 3
    opt = L1_42
    L1_42 = _kali_brain
    L2_43 = L1_42
    L1_42 = L1_42.jump
    L3_44 = "locator2_kali_waypoint_00"
    L4_45 = opt
    L1_42(L2_43, L3_44, L4_45)
    L1_42 = wait
    L2_43 = 52
    L1_42(L2_43)
    L1_42 = {L2_43}
    L2_43 = "locator2_kali_waypoint_00a"
    L2_43 = _kali_brain
    L3_44 = L2_43
    L2_43 = L2_43.move
    L4_45 = L1_42
    L2_43(L3_44, L4_45)
    L2_43 = wait
    L3_44 = 30
    L2_43(L3_44)
    L2_43 = {L3_44}
    L3_44 = "locator2_kali_waypoint_01"
    L3_44 = _kali_brain
    L4_45 = L3_44
    L3_44 = L3_44.move
    L5_46 = L2_43
    L3_44(L4_45, L5_46)
    L3_44 = wait
    L4_45 = 50
    L3_44(L4_45)
    L3_44 = {}
    L3_44.height = 3
    L4_45 = _kali_brain
    L5_46 = L4_45
    L4_45 = L4_45.jump
    L6_47 = "locator2_kali_waypoint_02"
    L4_45(L5_46, L6_47)
    repeat
      L4_45 = wait
      L4_45()
      L4_45 = _kali_brain
      L5_46 = L4_45
      L4_45 = L4_45.isJumpEnd
      L4_45 = L4_45(L5_46)
    until L4_45
    repeat
      L4_45 = wait
      L4_45()
      L4_45 = Fn_get_distance
      L5_46 = Fn_getPcPosRot
      L5_46 = L5_46()
      L6_47 = _kali_pup
      L7_48 = L6_47
      L6_47 = L6_47.getWorldPos
      L7_48 = L6_47(L7_48)
      L4_45 = L4_45(L5_46, L6_47, L7_48, L6_47(L7_48))
    until L4_45 <= 50
    L4_45 = {}
    L4_45.height = 1
    L3_44 = L4_45
    L4_45 = ropewayMove
    L4_45()
    L4_45 = _kali_brain
    L5_46 = L4_45
    L4_45 = L4_45.jump
    L6_47 = "locator2_kali_waypoint_03"
    L7_48 = L3_44
    L4_45(L5_46, L6_47, L7_48)
    L4_45 = wait
    L5_46 = 102
    L4_45(L5_46)
    L4_45 = {L5_46}
    L5_46 = "locator2_kali_waypoint_04"
    L5_46 = _kali_brain
    L6_47 = L5_46
    L5_46 = L5_46.move
    L7_48 = L4_45
    L5_46(L6_47, L7_48)
    repeat
      L5_46 = wait
      L5_46()
      L5_46 = _kali_brain
      L6_47 = L5_46
      L5_46 = L5_46.isMoveEnd
      L5_46 = L5_46(L6_47)
    until L5_46
    L5_46 = _kali_brain
    L6_47 = L5_46
    L5_46 = L5_46.jump
    L7_48 = "locator2_kali_waypoint_05"
    L5_46(L6_47, L7_48)
    L5_46 = wait
    L6_47 = 40
    L5_46(L6_47)
    L5_46 = _kali_brain
    L6_47 = L5_46
    L5_46 = L5_46.turn
    L7_48 = findGameObject2
    L7_48 = L7_48("Node", "locator2_kali_goal_01")
    L7_48 = L7_48.getWorldPos
    L7_48 = L7_48(L7_48)
    L5_46(L6_47, L7_48, L7_48(L7_48))
    L5_46 = {}
    L5_46.height = 0.5
    L3_44 = L5_46
    L5_46 = _kali_brain
    L6_47 = L5_46
    L5_46 = L5_46.jump
    L7_48 = "locator2_kali_waypoint_ropeway"
    L5_46(L6_47, L7_48, L3_44)
    L5_46 = wait
    L6_47 = 57
    L5_46(L6_47)
    _floater_on = true
    L5_46 = _ropeway_hdl_02
    L6_47 = L5_46
    L5_46 = L5_46.setFloaterParams
    L7_48 = _param
    L5_46(L6_47, L7_48)
    L5_46 = _ropeway_hdl_02
    L6_47 = L5_46
    L5_46 = L5_46.setFloaterFadeout
    L7_48 = 30
    L5_46(L6_47, L7_48)
    L5_46 = createGameObject2
    L6_47 = "Effect"
    L5_46 = L5_46(L6_47)
    L7_48 = L5_46
    L6_47 = L5_46.setModelName
    L6_47(L7_48, "ef_com_grnpar_03")
    L7_48 = L5_46
    L6_47 = L5_46.loadModel
    L6_47(L7_48, "ef_com_grnpar_03")
    L7_48 = L5_46
    L6_47 = L5_46.setName
    L6_47(L7_48, "ef_com_grnpar_03")
    L7_48 = L5_46
    L6_47 = L5_46.setLoop
    L6_47(L7_48, false)
    L7_48 = L5_46
    L6_47 = L5_46.setPos
    L6_47(L7_48, Vector(0, 0, 0))
    L6_47 = findGameObject2
    L7_48 = "Node"
    L6_47 = L6_47(L7_48, "locator2_kali_waypoint_ropeway")
    L7_48 = L6_47.appendChild
    L7_48(L6_47, L5_46)
    L7_48 = L5_46.setActive
    L7_48(L5_46, false)
    L7_48 = L5_46.try_init
    L7_48(L5_46)
    L7_48 = L5_46.waitForReady
    L7_48(L5_46)
    L7_48 = L5_46.try_start
    L7_48(L5_46)
    L7_48 = L5_46.play
    L7_48(L5_46)
    L7_48 = L5_46.setActive
    L7_48(L5_46, true)
    L7_48 = {}
    L7_48.height = 8
    L3_44 = L7_48
    L7_48 = _kali_brain
    L7_48 = L7_48.jump
    L7_48(L7_48, "locator2_kali_waypoint_06", L3_44)
    L7_48 = wait
    L7_48(87)
    L7_48 = {}
    L7_48.height = 4
    _kali_brain:jump("locator2_kali_waypoint_09", L7_48)
    wait(93)
    if Fn_get_distance(Fn_getPcPosRot(), findGameObject2("Node", "locator2_kali_waypoint_10"):getWorldPos()) >= Fn_get_distance(_kali_pup:getWorldPos(), findGameObject2("Node", "locator2_kali_waypoint_10"):getWorldPos()) then
      _kali_brain:jump("locator2_kali_waypoint_10")
      wait(76)
      _kali_brain:turn(findGameObject2("Node", "locator2_kali_waypoint_11"):getWorldPos())
      repeat
        wait()
      until Fn_get_distance(Fn_getPcPosRot(), _kali_pup:getWorldPos()) <= 25
      if Fn_get_distance(Fn_getPcPosRot(), findGameObject2("Node", "locator2_kali_waypoint_11"):getWorldPos()) >= Fn_get_distance(_kali_pup:getWorldPos(), findGameObject2("Node", "locator2_kali_waypoint_11"):getWorldPos()) then
        _kali_brain:jump("locator2_kali_waypoint_11", L7_48)
        wait(98)
        _kali_brain:turn(findGameObject2("Node", "locator2_kali_goal_01"):getWorldPos())
        repeat
          wait()
        until Fn_get_distance(Fn_getPcPosRot(), _kali_pup:getWorldPos()) <= 25
      end
    else
      _kali_brain:jump("locator2_kali_waypoint_11")
      wait(50)
      _kali_brain:turn(findGameObject2("Node", "locator2_kali_goal_01"):getWorldPos())
      repeat
        wait()
      until Fn_get_distance(Fn_getPcPosRot(), _kali_pup:getWorldPos()) <= 20
    end
    L7_48 = {height = 0.5}
    _kali_brain:jump("locator2_kali_goal_01", L7_48)
    repeat
      wait()
    until _kali_brain:isJumpEnd()
    invokeTask(function()
      local L1_49
      L1_49 = _kali_brain
      L1_49 = L1_49.turn
      L1_49(L1_49, findGameObject2("Node", "locator2_Durga_Crystal_13"):getWorldPos())
    end)
    repeat
      wait()
    until Fn_get_distance(Fn_getPcPosRot(), _kali_pup:getWorldPos()) <= 25 or Fn_get_distance(Fn_getPcPosRot(), _kali_pup:getWorldPos()) <= 35 and Player.kAttrTune_Mars == Player:getAttrTune()
    _kali_brain:setInvincibility(false)
    _isMoveEnd_ep18_d = true
  end)
end
function moveSeqEnd()
  local L0_50, L1_51
  L0_50 = _isMoveEnd_ep18_d
  return L0_50
end
function ropewayMove()
  invokeTask(function()
    local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60
    L0_52 = _ropeway_hdl_01
    L1_53 = L0_52
    L0_52 = L0_52.clearCurve
    L0_52(L1_53)
    L0_52 = _ropeway_hdl_02
    L1_53 = L0_52
    L0_52 = L0_52.clearCurve
    L0_52(L1_53)
    L0_52 = findGameObject2
    L1_53 = "Node"
    L2_54 = "locator2_ropeway_route_00"
    L0_52 = L0_52(L1_53, L2_54)
    L1_53 = findGameObject2
    L2_54 = "Node"
    L3_55 = "locator2_ropeway_route_01"
    L1_53 = L1_53(L2_54, L3_55)
    L2_54 = findGameObject2
    L3_55 = "Node"
    L4_56 = "locator2_ropeway_route_00a"
    L2_54 = L2_54(L3_55, L4_56)
    L3_55 = findGameObject2
    L4_56 = "Node"
    L5_57 = "locator2_ropeway_route_01a"
    L3_55 = L3_55(L4_56, L5_57)
    L4_56 = _ropeway_hdl_01
    L5_57 = L4_56
    L4_56 = L4_56.appendCurvePoint2
    L7_59 = L0_52
    L6_58 = L0_52.getWorldPos
    L6_58 = L6_58(L7_59)
    L8_60 = L0_52
    L7_59 = L0_52.getWorldRot
    L7_59 = L7_59(L8_60)
    L8_60 = 9.5
    L4_56(L5_57, L6_58, L7_59, L8_60, "Linear", true)
    L4_56 = _ropeway_hdl_01
    L5_57 = L4_56
    L4_56 = L4_56.appendCurvePoint2
    L7_59 = L1_53
    L6_58 = L1_53.getWorldPos
    L6_58 = L6_58(L7_59)
    L8_60 = L1_53
    L7_59 = L1_53.getWorldRot
    L7_59 = L7_59(L8_60)
    L8_60 = 9.5
    L4_56(L5_57, L6_58, L7_59, L8_60, "Linear", true)
    L4_56 = _ropeway_hdl_01
    L5_57 = L4_56
    L4_56 = L4_56.setCurveRepeatCount
    L6_58 = 0
    L4_56(L5_57, L6_58)
    L4_56 = _ropeway_hdl_02
    L5_57 = L4_56
    L4_56 = L4_56.appendCurvePoint2
    L7_59 = L2_54
    L6_58 = L2_54.getWorldPos
    L6_58 = L6_58(L7_59)
    L8_60 = L2_54
    L7_59 = L2_54.getWorldRot
    L7_59 = L7_59(L8_60)
    L8_60 = 9.5
    L4_56(L5_57, L6_58, L7_59, L8_60, "Linear", true)
    L4_56 = _ropeway_hdl_02
    L5_57 = L4_56
    L4_56 = L4_56.appendCurvePoint2
    L7_59 = L3_55
    L6_58 = L3_55.getWorldPos
    L6_58 = L6_58(L7_59)
    L8_60 = L3_55
    L7_59 = L3_55.getWorldRot
    L7_59 = L7_59(L8_60)
    L8_60 = 9.5
    L4_56(L5_57, L6_58, L7_59, L8_60, "Linear", true)
    L4_56 = _ropeway_hdl_02
    L5_57 = L4_56
    L4_56 = L4_56.setCurveRepeatCount
    L6_58 = 0
    L4_56(L5_57, L6_58)
    L4_56 = Sound
    L5_57 = L4_56
    L4_56 = L4_56.playSEHandle
    L6_58 = "ropeway_drive2"
    L7_59 = 1
    L8_60 = ""
    L4_56 = L4_56(L5_57, L6_58, L7_59, L8_60, _ropeway_hdl_01)
    L5_57 = findGameObject2
    L6_58 = "Node"
    L7_59 = "locator2_kali_waypoint_ropeway"
    L5_57 = L5_57(L6_58, L7_59)
    repeat
      L6_58 = wait
      L6_58()
      L6_58 = _floater_on
    until L6_58
    L6_58 = Sound
    L7_59 = L6_58
    L6_58 = L6_58.stopSEHandle
    L8_60 = L4_56
    L6_58(L7_59, L8_60)
    L6_58 = Sound
    L7_59 = L6_58
    L6_58 = L6_58.playSE
    L8_60 = "ropeway_stop2"
    L6_58(L7_59, L8_60, 1, "", _ropeway_hdl_01)
    L6_58 = Sound
    L7_59 = L6_58
    L6_58 = L6_58.playSE
    L8_60 = "pc_land_hard"
    L6_58(L7_59, L8_60, 1, "", _ropeway_hdl_01)
    L6_58 = Sound
    L7_59 = L6_58
    L6_58 = L6_58.playSE
    L8_60 = "obj_squeak"
    L6_58(L7_59, L8_60, 1, "", _ropeway_hdl_01)
    L6_58 = "ef_mcn_dmg_01"
    L7_59 = "locator2_ropeway_effect_01"
    L8_60 = "ef_mcn_dmg_01_01"
    invokeTask(function()
      local L0_61, L1_62
      L0_61 = wait
      L1_62 = 20
      L0_61(L1_62)
      L0_61 = "locator2_ropeway_effect_02"
      L1_62 = "ef_mcn_dmg_01_02"
    end)
    invokeTask(function()
      local L0_63, L1_64, L2_65, L3_66
      for L3_66 = 10, 0, -0.5 do
        Sound:playSE("ep18_obj_ropeway_swing", L3_66, "", _ropeway_hdl_01)
        wait(30)
      end
    end)
    waitSeconds(30)
  end)
end
function setKaliMarker(A0_67)
  _enmgen2_kali_gen:setEnemyMarker(A0_67)
end
function kaliCtrl()
  invokeTask(function()
    local L0_68, L1_69, L2_70, L3_71
    L0_68 = _kali_brain
    L1_69 = L0_68
    L0_68 = L0_68.reset
    L2_70 = findGameObject2
    L3_71 = "Node"
    L2_70 = L2_70(L3_71, "locator2_kali_start_e")
    L3_71 = L2_70
    L2_70 = L2_70.getWorldTransform
    L3_71 = L2_70(L3_71)
    L0_68(L1_69, L2_70, L3_71, L2_70(L3_71))
    repeat
      L0_68 = wait
      L0_68()
      L0_68 = _kali_brain
      L1_69 = L0_68
      L0_68 = L0_68.isReadyEnemy
      L0_68 = L0_68(L1_69)
    until L0_68
    L0_68 = _kali_brain
    L1_69 = L0_68
    L0_68 = L0_68.playMotion
    L2_70 = "stay"
    L0_68(L1_69, L2_70)
    L0_68 = wait
    L1_69 = 20
    L0_68(L1_69)
    L0_68 = {}
    L0_68.height = 1
    opt = L0_68
    L0_68 = _kali_brain
    L1_69 = L0_68
    L0_68 = L0_68.jump
    L2_70 = "locator2_kali_jump_e"
    L3_71 = opt
    L0_68(L1_69, L2_70, L3_71)
    repeat
      L0_68 = wait
      L0_68()
      L0_68 = _kali_brain
      L1_69 = L0_68
      L0_68 = L0_68.isJumpEnd
      L0_68 = L0_68(L1_69)
    until L0_68
    L0_68 = {L1_69}
    L1_69 = "locator2_kali_walk_e"
    L1_69 = {}
    L1_69.kali_move_mode = "walk"
    L2_70 = _kali_brain
    L3_71 = L2_70
    L2_70 = L2_70.move
    L2_70(L3_71, L0_68, L1_69)
    repeat
      L2_70 = wait
      L2_70()
      L2_70 = _kali_brain
      L3_71 = L2_70
      L2_70 = L2_70.isMoveEnd
      L2_70 = L2_70(L3_71)
    until L2_70
    L2_70 = _kali_brain
    L3_71 = L2_70
    L2_70 = L2_70.turn
    L2_70(L3_71, findGameObject2("Node", "locator2_kali_look_e"):getWorldPos())
    repeat
      L2_70 = wait
      L2_70()
      L2_70 = _kali_brain
      L3_71 = L2_70
      L2_70 = L2_70.isTurnEnd
      L2_70 = L2_70(L3_71)
    until L2_70
    L2_70 = _kali_brain
    L3_71 = L2_70
    L2_70 = L2_70.setVisibleBossMarker
    L2_70(L3_71, true)
    L2_70 = findGameObject2
    L3_71 = "Node"
    L2_70 = L2_70(L3_71, "locator2_kali_walk_e")
    L3_71 = L2_70
    L2_70 = L2_70.getWorldPos
    L2_70 = L2_70(L3_71)
    L3_71 = findGameObject2
    L3_71 = L3_71("Node", "locator2_kali_walk_e")
    L3_71 = L3_71.getWorldRot
    L3_71 = L3_71(L3_71)
    _kali_brain:setSpawnTransform(L2_70, L3_71)
  end)
end
function endKaliCtrl()
  _kali_brain:endScriptAction()
end
function kali_HPgauge_ep18_e()
  invokeTask(function()
    local L0_72, L1_73
    L0_72 = HUD
    L1_73 = L0_72
    L0_72 = L0_72.createBossHpGauge
    L0_72 = L0_72(L1_73, {
      obj = _kali_pup
    })
    _boss_gauge = L0_72
    L0_72 = _boss_gauge
    L1_73 = L0_72
    L0_72 = L0_72.setActive
    L0_72(L1_73, true)
    L0_72 = nil
    L1_73 = print
    L1_73("_boss_gauge:setActive(true)")
    function L1_73(A0_74)
      local L1_75
      L1_75 = A0_74.name
      L0_72 = A0_74.attacker
      print("enemy name " .. L1_75)
      print("attacker type " .. L0_72)
      A0_74.ret = true
      return A0_74
    end
    _enmgen2_kali_gen:setEventListener("DamageEnemyReport", L1_73)
    print("Kali Health Is", _kali_brain:getHealth())
    while not (_kali_brain:getHealth() < 0.5 * _kali_brain:getMaxHealth()) or L0_72 ~= "player" do
      _boss_gauge:setHp((_kali_brain:getHealth() - 0.4 * _kali_brain:getMaxHealth()) / _kali_brain:getMaxHealth())
      wait()
    end
    _boss_gauge:setActive(false)
    print("_boss_gauge:setActive(false)")
    _is_kalidead = true
  end)
end
function isKaliDead()
  local L0_76, L1_77
  L0_76 = _is_kalidead
  return L0_76
end
function getKaliPuppet()
  local L0_78, L1_79
  L0_78 = _kali_pup
  return L0_78
end
function sdemoPlay()
  local L0_80, L1_81
  _startSdemo = true
end
function Finalize()
  local L0_82, L1_83
end
