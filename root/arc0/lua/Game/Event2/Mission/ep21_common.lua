local L1_1
function L0_0()
  local L0_2, L1_3, L2_4, L3_5, L4_6
  L0_2 = mother2
  L0_2 = L0_2.sendEvent
  L0_2 = L0_2(L1_3, L2_4, L3_5)
  for L4_6 = 1, 24 do
    L0_2:findSubArea("co_a_04_" .. string.format("%02d", L4_6)):setWorldTransform(findGameObject2("Node", "locator2_04_end_" .. string.format("%02d", L4_6)):getWorldTransform())
    L0_2:findSubArea("co_a_04_" .. string.format("%02d", L4_6)):setForceMove()
  end
  for L4_6 = 1, 28 do
    L0_2:findSubArea("co_a_05_" .. string.format("%02d", L4_6)):setWorldTransform(findGameObject2("Node", "locator2_05_end_" .. string.format("%02d", L4_6)):getWorldTransform())
    L0_2:findSubArea("co_a_05_" .. string.format("%02d", L4_6)):setForceMove()
  end
  for L4_6 = 1, 29 do
    L0_2:findSubArea("co_a_06_" .. string.format("%02d", L4_6)):setWorldTransform(findGameObject2("Node", "locator2_06_end_" .. string.format("%02d", L4_6)):getWorldTransform())
    L0_2:findSubArea("co_a_06_" .. string.format("%02d", L4_6)):setForceMove()
  end
  L1_3()
end
move_area_beans = L0_0
function L0_0()
  local L0_7
  L0_7 = {}
  L0_7.distance = 180
  _brain_crow:setWarpParams(L0_7)
  crow_speed = invokeTask(function()
    local L0_8, L1_9, L2_10
    repeat
      L0_8 = Fn_getPcPosRot
      L1_9 = L0_8()
      L2_10 = _crow_puppet
      L2_10 = L2_10.getWorldPos
      L2_10 = L2_10(L2_10)
      _distance = Fn_get_distance(L0_8, L2_10)
      if _distance <= 2 or L0_8.y > L2_10.y then
        _brain_crow:setMoveVelocityRatio(1, 0.2)
      elseif _distance > 12 then
        _brain_crow:setMoveVelocityRatio(0.1, 0.2)
      elseif _distance > 9 then
        _brain_crow:setMoveVelocityRatio(0.3, 0.2)
      elseif _distance > 6 then
        _brain_crow:setMoveVelocityRatio(0.5, 0.2)
      elseif _distance > 3 then
        _brain_crow:setMoveVelocityRatio(0.8, 0.2)
      end
      wait()
    until false
  end)
end
crow_speed_adjust = L0_0
function L0_0()
  if crow_speed ~= nil then
    crow_speed:abort()
    crow_speed = nil
    _brain_crow:setMoveVelocityRatio(1, 0.2)
  end
end
crow_speed_adjust_off = L0_0
function L0_0(A0_11)
  local L1_12
  L1_12 = _brain_crow
  L1_12 = L1_12.setIdling
  L1_12(L1_12, false)
  L1_12 = findGameObject2
  L1_12 = L1_12("Node", A0_11)
  _brain_crow:setFollowPoint(true, L1_12, 12)
  repeat
    wait()
  until Fn_getPcPosRot().y > L1_12:getWorldPos().y - 15
end
crow_fastmove = L0_0
function L0_0(A0_13)
  print("\228\187\138\229\133\165\227\129\163\227\129\159\227\130\187\227\131\179\227\130\181\227\131\188\227\129\174\229\144\141\229\137\141", A0_13:getName())
  release_cnt = release_cnt + 1
  print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\130\139\227\130\171\227\130\166\227\131\179\227\131\136\239\188\139\239\188\145" .. release_cnt)
end
pccubesensor2_release_OnEnter = L0_0
function L0_0(A0_14)
  release_cnt = release_cnt - 1
  print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\130\139\227\130\171\227\130\166\227\131\179\227\131\136\227\131\188\239\188\145" .. release_cnt)
  if Player:getAction() == Player.kAction_Slider then
    Player:setStay(false)
    ret = Player:setAction(Player.kAction_Float)
    print("\227\130\185\227\131\169\227\130\164\227\131\137\233\152\178\230\173\162", ret)
    Fn_coercionGravityRevert()
  end
end
pccubesensor2_release_OnLeave = L0_0
function L0_0()
  Player:setParameter(Player.kParam_GravPowConsumFactor, 4.5, 1.75, 0)
end
GravPowConsumUp = L0_0
function L0_0()
  Player:setParameter(Player.kParam_GravPowConsumFactor, 0.05, 1, 0)
end
GravPowConsumDown = L0_0
function L0_0(A0_15)
  local L1_16, L2_17, L3_18, L4_19
  L1_16 = _ice_table
  L1_16 = L1_16[A0_15]
  L1_16 = L1_16.state
  L2_17 = _ice_table
  L2_17 = L2_17[A0_15]
  L2_17 = L2_17.handle
  L3_18 = kICE_MOVE
  if L1_16 == L3_18 then
    L4_19 = L2_17
    L3_18 = L2_17.setMoveVelocity
    L3_18(L4_19, _ice_table[A0_15].velocity)
    L4_19 = L2_17
    L3_18 = L2_17.setMoveTarget
    L3_18(L4_19, _ice_table[A0_15].node_bot)
    L3_18 = _ice_table
    L3_18 = L3_18[A0_15]
    L4_19 = kICE_MOVING
    L3_18.state = L4_19
  else
    L3_18 = kICE_MOVING
    if L1_16 == L3_18 then
      L3_18 = i
      if L3_18 == 1 then
        L3_18 = print
        L4_19 = L2_17.getMoveDistance
        L4_19 = L4_19(L2_17)
        L3_18(L4_19, L4_19(L2_17))
      end
      L3_18 = Fn_get_distance
      L4_19 = _ice_table
      L4_19 = L4_19[A0_15]
      L4_19 = L4_19.node_bot
      L4_19 = L4_19.getWorldPos
      L4_19 = L4_19(L4_19)
      L3_18 = L3_18(L4_19, L2_17:getWorldPos())
      if L3_18 < 5 then
        L3_18 = RandI
        L4_19 = 1
        L3_18 = L3_18(L4_19, 100)
        if L3_18 < 50 then
          L4_19 = invokeTask
          L4_19(function()
            local L0_20
            L0_20 = icicle
            L0_20 = L0_20[A0_15]
            if L0_20 ~= nil then
              L0_20 = icicle
              L0_20 = L0_20[A0_15]
              L0_20 = L0_20.stop
              L0_20(L0_20)
              L0_20 = icicle
              L0_20[A0_15] = nil
            end
            L0_20 = RandI
            L0_20 = L0_20(0, 1)
            if L0_20 == 0 then
              L0_20 = _ice_table
              L0_20 = L0_20[A0_15]
              L0_20 = L0_20.node_bot
              L0_20 = L0_20.getWorldPos
              L0_20 = L0_20(L0_20)
              L0_20.y = L0_20.y - 1
              icicle[A0_15] = createGameObject2("Debris")
              icicle[A0_15]:setModelName("cbr_ice_01_brk_a")
              icicle[A0_15]:setPos(L0_20)
              icicle[A0_15]:try_init()
              icicle[A0_15]:waitForReady()
              icicle[A0_15]:play(L0_20, 10, 1, nil, 0)
            end
            L0_20 = Fn_createEffect
            L0_20 = L0_20("icicle_break", "ef_ev_icebrk_01", _ice_table[A0_15].node_boteff, false)
            Fn_finishedTremEffect(L0_20, 2)
          end)
        end
        L4_19 = Sound
        L4_19 = L4_19.playSE
        L4_19(L4_19, "ep21_icicle_break", 1, "", _ice_table[A0_15].node_boteff)
        L4_19 = L2_17.setWorldTransform
        L4_19(L2_17, _ice_table[A0_15].node_top:getWorldTransform())
        L4_19 = L2_17.setForceMove
        L4_19(L2_17)
        L4_19 = icicle_se
        L4_19[A0_15] = false
        L4_19 = _ice_table
        L4_19 = L4_19[A0_15]
        L4_19.state = kICE_MOVE
      else
        L3_18 = _ice_table
        L3_18 = L3_18[A0_15]
        L3_18 = L3_18.handle
        L4_19 = L3_18
        L3_18 = L3_18.getWorldPos
        L3_18 = L3_18(L4_19)
        L4_19 = L3_18.y
        L4_19 = L4_19 - 2
        L3_18.y = L4_19
        L4_19 = GameDatabase
        L4_19 = L4_19.get
        L4_19 = L4_19(L4_19, ggd.GlobalSystemFlags__CatWarpRunning)
        if L4_19 ~= true then
          L4_19 = Fn_getDistanceToPlayer
          L4_19 = L4_19(L3_18)
          if L4_19 <= 5 then
            L4_19 = setSateAllIce
            L4_19(kICE_DAMAGE)
            L4_19 = print
            L4_19("\227\129\149\227\130\143\227\129\159")
            _reset = true
            _crash_ice = A0_15
          end
          L4_19 = Player
          L4_19 = L4_19.getRecentAreaName
          L4_19 = L4_19(L4_19)
          if L4_19 and string.match(L4_19, "co_a_07") == "co_a_07" then
            setSateAllIce(kICE_DAMAGE)
            print("\227\129\174\227\129\159")
            _reset = true
            _crash_ice = A0_15
          end
        end
        L4_19 = Fn_getDistanceToPlayer
        L4_19 = L4_19(L3_18)
        if L4_19 <= 30 then
          L4_19 = icicle_se
          L4_19 = L4_19[A0_15]
          if L4_19 ~= true then
            L4_19 = Sound
            L4_19 = L4_19.playSE
            L4_19(L4_19, "ep21_icicle_fall", 1, "", _ice_table[A0_15].handle)
            L4_19 = icicle_se
            L4_19[A0_15] = true
          end
        end
      end
    else
      L3_18 = kICE_STOP
      if L1_16 == L3_18 then
        L3_18 = invokeTask
        function L4_19()
          local L0_21, L1_22, L2_23, L3_24
          for L3_24 = 80, 0, -2 do
            L2_17:setMoveVelocity(L3_24)
            wait()
          end
          L0_21(L1_22, L2_23)
          L0_21.state = L1_22
        end
        L3_18 = L3_18(L4_19)
        ice_stop = L3_18
      else
        L3_18 = kICE_STOPPED
        if L1_16 == L3_18 then
        else
          L3_18 = kICE_RESET
          if L1_16 == L3_18 then
            L4_19 = L2_17
            L3_18 = L2_17.reset
            L3_18(L4_19, true)
          else
            L3_18 = kICE_DAMAGE
            if L1_16 == L3_18 then
              L3_18 = waitSeconds
              L4_19 = 1
              L3_18(L4_19)
              L4_19 = L2_17
              L3_18 = L2_17.setMoveVelocity
              L3_18(L4_19, 0)
              L4_19 = L2_17
              L3_18 = L2_17.setMoveTarget
              L3_18(L4_19, nil)
            end
          end
        end
      end
    end
  end
end
setIceMoving = L0_0
function L0_0()
  return invokeTask(function()
    local L0_25, L1_26, L2_27, L3_28
    while true do
      for L3_28 = 1, _ice_max do
        setIceMoving(L3_28)
      end
      L0_25()
    end
  end)
end
ice_processing = L0_0
function L0_0()
  return invokeTask(function()
    local L0_29
    while true do
      L0_29 = reset
      if L0_29 == true then
        L0_29 = GameDatabase
        L0_29 = L0_29.get
        L0_29 = L0_29(L0_29, ggd.GlobalSystemFlags__CatWarpRunning)
        if L0_29 == true then
          reset = false
          L0_29 = print
          L0_29("\227\129\164\227\130\137\227\130\137\227\129\171\227\129\130\227\129\159\227\129\163\227\129\159\227\129\145\227\129\169\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\184\173\227\129\160\227\129\163\227\129\159\227\129\174\227\129\167\227\130\132\227\130\129\227\129\159")
        end
      end
      L0_29 = _reset
      if L0_29 == true then
        L0_29 = warp_now
        if L0_29 == false then
          L0_29 = print
          L0_29("\227\129\164\227\130\137\227\130\137\227\129\171\227\129\130\227\129\159\227\129\163\227\129\159")
          L0_29 = Fn_setCatWarp
          L0_29(false)
          L0_29 = _crash_ice
          if L0_29 == nil then
            _crash_ice = 1
          end
          L0_29 = _ice_table
          L0_29 = L0_29[_crash_ice]
          L0_29 = L0_29.handle
          L0_29 = L0_29.getWorldTransform
          L0_29 = L0_29(L0_29)
          Player:applyImpactDamage(L0_29, NormalizeVector(Fn_getPlayerWorldTransform() - L0_29) * 3, 0, false)
          _reset = false
          _next_phase = false
          crow_climb = false
          kitun_climb = false
          litho1_flag = false
          litho2_flag = false
          Fn_userCtrlAllOff()
          Player:setStay(true)
          Fn_captionViewEnd()
          Fn_blackout(1)
          setSateAllIce(kICE_RESET)
          if Fn_sendEventComSb("isSecondHalfProcessEnd") or upper_clear2 == true then
            Fn_resetPcPos("locator2_restart_01")
          else
            Fn_resetPcPos("locator2_pc_start_pos")
          end
          wait(20)
          setSateAllIce(kICE_MOVE)
          Fn_fadein()
          Fn_userCtrlOn()
          Player:setStay(false)
          Fn_setCatWarp(true)
        end
      end
      L0_29 = wait
      L0_29()
    end
  end)
end
restart_processing = L0_0
function L0_0(A0_30)
  local L1_31, L2_32, L3_33, L5_34
  for L5_34 = 1, _ice_max do
    _ice_table[L5_34].state = A0_30
  end
end
setSateAllIce = L0_0
function L0_0(A0_35)
  local L1_36
  while true do
    L1_36 = _litho_theme
    if L1_36 ~= true then
      L1_36 = _litho_theme
      if L1_36 == nil then
        L1_36 = HUD
        L1_36 = L1_36.timerSetSecond
        L1_36(L1_36, A0_35)
        L1_36 = HUD
        L1_36 = L1_36.timerSetVisible
        L1_36(L1_36, true)
        L1_36 = HUD
        L1_36 = L1_36.timerStart
        L1_36(L1_36)
        while true do
          L1_36 = HUD
          L1_36 = L1_36.timerGetSecond
          L1_36 = L1_36(L1_36)
          if L1_36 > 0 then
            L1_36 = wait
            L1_36()
          end
        end
        L1_36 = GameDatabase
        L1_36 = L1_36.get
        L1_36 = L1_36(L1_36, ggd.Savedata__EventManageFlags__CurrentMissionName)
        if L1_36 == "ep21_h" then
          L1_36 = litho2_flag
          if L1_36 ~= nil then
            L1_36 = Fn_pcSensorOff
            L1_36("pccubesensor2_neko_01")
          end
        end
        L1_36 = Fn_userCtrlGravityOff
        L1_36()
        L1_36 = _crash_ice
        if L1_36 == nil then
          _crash_ice = 1
        end
        L1_36 = Player
        L1_36 = L1_36.setStay
        L1_36(L1_36, false)
        L1_36 = wait
        L1_36(5)
        L1_36 = Player
        L1_36 = L1_36.getRecentAreaName
        L1_36 = L1_36(L1_36)
        areaName = L1_36
        L1_36 = areaName
        if L1_36 then
          L1_36 = string
          L1_36 = L1_36.find
          L1_36 = L1_36(areaName, "co_a_07")
          if L1_36 == nil then
            L1_36 = string
            L1_36 = L1_36.find
            L1_36 = L1_36(areaName, "co_a_11")
            if L1_36 == nil then
              L1_36 = string
              L1_36 = L1_36.find
              L1_36 = L1_36(areaName, "co_a_12")
            end
          elseif L1_36 ~= nil then
            L1_36 = Player
            L1_36 = L1_36.getAction
            L1_36 = L1_36(L1_36)
            if L1_36 ~= Player.kAction_Idle then
              L1_36 = Player
              L1_36 = L1_36.getAction
              L1_36 = L1_36(L1_36)
            elseif L1_36 == Player.kAction_Run then
              L1_36 = _ice_table
              L1_36 = L1_36[_crash_ice]
              L1_36 = L1_36.handle
              L1_36 = L1_36.getWorldTransform
              L1_36 = L1_36(L1_36)
              NormalizeVector(Fn_getPlayerWorldTransform() - L1_36).y = NormalizeVector(Fn_getPlayerWorldTransform() - L1_36).y + 5
              Player:applyImpactDamage(L1_36, NormalizeVector(Fn_getPlayerWorldTransform() - L1_36) * 3, 0, true)
              _reset = false
              print("\227\129\181\227\129\163\227\129\168\227\129\176\227\129\151\227\129\159")
            end
          end
          L1_36 = wait
          L1_36()
          L1_36 = Area
          L1_36 = L1_36.setAreaFree
          L1_36(L1_36)
        end
        L1_36 = setSateAllIce
        L1_36(kICE_MOVE)
        _litho_theme = false
        warp_now = true
        L1_36 = Fn_sendEventComSb
        L1_36("missionFailure")
        repeat
          L1_36 = wait
          L1_36()
          L1_36 = Fn_sendEventComSb
          L1_36 = L1_36("isFailureProcessEnd")
        until L1_36
        L1_36 = Fn_missionRetry
        L1_36(true)
        L1_36 = HUD
        L1_36 = L1_36.timerStop
        L1_36(L1_36)
      end
      L1_36 = wait
      L1_36()
    end
  end
end
litho_timer = L0_0
