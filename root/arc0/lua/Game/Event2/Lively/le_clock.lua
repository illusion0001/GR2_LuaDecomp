local L1_1
L0_0 = {}
LeClock = L0_0
L0_0 = LeClock
function L1_1()
  local L0_2
  L0_2 = {}
  L0_2.name = "clock"
  L0_2.start = false
  L0_2.evb = nil
  L0_2.task_init = nil
  L0_2.task_run = nil
  L0_2.task_needle = nil
  L0_2.body_puppet = nil
  L0_2.body_brain = nil
  L0_2.collision = nil
  L0_2.hour_hand = nil
  L0_2.minute_hand = nil
  L0_2.pendulum_puppet = nil
  L0_2.pendulum_brain = nil
  L0_2.pendulum_se = nil
  L0_2.fire_hdl = nil
  L0_2.fire_se = nil
  LeClock._installMethods(L0_2)
  return L0_2
end
L0_0.create = L1_1
L0_0 = LeClock
function L1_1(A0_3)
  if not LeClock._isValid(A0_3) then
    return false
  end
  if A0_3.start then
    A0_3:debugPrint("\227\129\153\227\129\167\227\129\171\229\136\157\230\156\159\229\140\150\230\184\136\227\129\191\227\129\167\227\129\153")
    return
  end
  if A0_3.init_task then
    A0_3:debugPrint("\229\136\157\230\156\159\229\140\150\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_3.task_init = invokeTask(function()
    local L0_4, L1_5, L2_6, L3_7, L4_8
    L0_4 = A0_3
    L1_5 = L0_4
    L0_4 = L0_4.debugPrint
    L2_6 = "initialize start"
    L0_4(L1_5, L2_6)
    L0_4 = loadFileAsset
    L1_5 = "evb"
    L2_6 = "evx/le16"
    L0_4 = L0_4(L1_5, L2_6)
    if L0_4 then
      L2_6 = L0_4
      L1_5 = L0_4.wait
      L1_5(L2_6)
      L2_6 = L0_4
      L1_5 = L0_4.getRoot
      L1_5 = L1_5(L2_6)
      L2_6 = EventData
      L3_7 = L2_6
      L2_6 = L2_6.create
      L4_8 = "LeClock"
      L2_6 = L2_6(L3_7, L4_8, nil, L1_5)
      A0_3.evb = L2_6
      L2_6 = A0_3.evb
      L3_7 = L2_6
      L2_6 = L2_6.try_init
      L2_6(L3_7)
      L2_6 = A0_3.evb
      L3_7 = L2_6
      L2_6 = L2_6.waitForReady
      L2_6(L3_7)
      L2_6 = A0_3.evb
      L3_7 = L2_6
      L2_6 = L2_6.try_start
      L2_6(L3_7)
      L2_6 = findGameObject2
      L3_7 = "Node"
      L4_8 = "locator2_set_clock_position"
      L2_6 = L2_6(L3_7, L4_8)
      if L2_6 then
        L3_7 = {}
        L3_7.stay = "clock01_stay_00"
        L3_7.start = "clock01_move_in_00"
        L3_7.loop = "clock01_move_00"
        L3_7.finish = "clock01_move_out_00"
        L4_8 = {}
        L4_8.stay = "clockparts01_grape_00"
        A0_3.body_puppet = createGameObject2("Puppet")
        A0_3.body_brain = createGameObject2("ActorBrain")
        A0_3:_initPuppet(A0_3.body_puppet, A0_3.body_brain, "LeClock", "clock01_base", L3_7)
        L2_6:appendChild(A0_3.body_puppet)
        A0_3.collision = createGameObject2("GimmickBg")
        A0_3.collision:setName("LeClockCollison")
        A0_3.collision:setCollisionName("gimmickclock_md_01")
        A0_3.collision:setAttributeName("invisible_col")
        A0_3.body_puppet:appendChild(A0_3.collision)
        A0_3.hour_hand = A0_3:_createGimmickBg("LeClockHourHand", "gimmickclock_md_05")
        A0_3.minute_hand = A0_3:_createGimmickBg("LeClockMinuteHand", "gimmickclock_md_06")
        A0_3.pendulum_puppet = createGameObject2("Puppet")
        A0_3.pendulum_brain = createGameObject2("ActorBrain")
        A0_3:_initPuppet(A0_3.pendulum_puppet, A0_3.pendulum_brain, "LeClockPendulum", "clockparts01_base", L4_8)
        A0_3.body_puppet:try_init()
        A0_3.body_brain:try_init()
        A0_3.collision:try_init()
        A0_3.body_puppet:waitForReady()
        A0_3.body_brain:waitForReady()
        A0_3.collision:waitForReady()
        A0_3.body_puppet:setBrain(A0_3.body_brain)
        A0_3:debugPrint("body and coll ready")
        A0_3.body_puppet:appendChildToJoint(A0_3.hour_hand, "bn_hand_hour")
        A0_3.body_puppet:appendChildToJoint(A0_3.minute_hand, "bn_hand_min")
        A0_3.body_puppet:appendChildToJoint(A0_3.pendulum_puppet, "bn_grape")
        A0_3.hour_hand:try_init()
        A0_3.minute_hand:try_init()
        A0_3.pendulum_puppet:try_init()
        A0_3.pendulum_brain:try_init()
        A0_3.hour_hand:waitForReady()
        A0_3.minute_hand:waitForReady()
        A0_3.pendulum_puppet:waitForReady()
        A0_3.pendulum_brain:waitForReady()
        A0_3.pendulum_puppet:setBrain(A0_3.pendulum_brain)
        A0_3:debugPrint("part ready")
        A0_3.body_puppet:try_start()
        A0_3.body_brain:try_start()
        A0_3.collision:try_start()
        A0_3.hour_hand:try_start()
        A0_3.minute_hand:try_start()
        A0_3.pendulum_puppet:try_start()
        A0_3.pendulum_brain:try_start()
        A0_3.body_puppet:playPoseAnimation("stay")
        A0_3.pendulum_puppet:playPoseAnimation("stay")
        A0_3.start = true
        A0_3:debugPrint("initialize finish")
      else
        L3_7 = A0_3
        L4_8 = L3_7
        L3_7 = L3_7.debugPrint
        L3_7(L4_8, "initialize failure")
      end
    else
      L1_5 = A0_3
      L2_6 = L1_5
      L1_5 = L1_5.debugPrint
      L3_7 = "initialize failure"
      L1_5(L2_6, L3_7)
    end
    A0_3.task_init = nil
  end)
end
L0_0.init = L1_1
L0_0 = LeClock
function L1_1(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  if not LeClock._isValid(A0_9) then
    return false
  end
  if not A0_9.start then
    A0_9:debugPrint("\229\136\157\230\156\159\229\140\150\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\229\174\159\232\161\140\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  if A0_9.task_run then
    return
  end
  A0_9.task_run = invokeTask(function()
    A0_9:debugPrint("\230\153\130\229\160\177\227\130\146\233\150\139\229\167\139\227\129\151\227\129\190\227\129\153")
    A0_9.body_puppet:playPoseAnimation("start")
    Sound:playSE("clock_dial_in", 1, "", A0_9.body_puppet)
    wait(220)
    Sound:playSE("clock_goat_out", 1, "", A0_9.body_puppet)
    wait(159)
    if A3_12 == 0 or A3_12 == 12 then
      A0_9:debugPrint(tostring(A3_12) .. "\227\129\170\227\129\174\227\129\167\231\129\171\227\130\146\229\144\144\227\129\141\227\129\190\227\129\153")
      A0_9.body_puppet:playPoseAnimation("loop")
      Sound:playSE("clock_bell", 1, "", A0_9.body_puppet)
      wait(35)
      Sound:playSE("clock_gong", 1, "", A0_9.body_puppet)
      wait(5)
      A0_9.fire_hdl = A0_9:_createEffect("clock_fire", "ef_ev_fir_06", A0_9.body_puppet, "bn_tonge")
      A0_9.fire_se = Sound:playSEHandle("clock_flame", 1, "", A0_9.fire_hdl)
      wait(114)
      A0_9.fire_se = A0_9:_stopSE(A0_9.fire_se)
      A0_9.fire_hdl:setEmitStop(true)
      wait(5)
      Sound:playSE("clock_bell", 1, "", A0_9.body_puppet)
    else
      A0_9:debugPrint("\233\128\154\229\184\184\227\129\174\230\153\130\229\160\177\227\129\167\227\129\153")
      A0_9.body_puppet:playPoseAnimation("loop")
      Sound:playSE("clock_bell", 1, "", A0_9.body_puppet)
      wait(20)
      Sound:playSE("clock_goat_bleat", 1, "", A0_9.body_puppet)
      wait(139)
      Sound:playSE("clock_bell", 1, "", A0_9.body_puppet)
    end
    A0_9:debugPrint("\230\153\130\229\160\177\227\129\140\231\181\130\228\186\134\227\129\151\227\129\190\227\129\151\227\129\159")
    A0_9.body_puppet:playPoseAnimation("finish")
    wait(100)
    Sound:playSE("clock_goat_in", 1, "", A0_9.body_puppet)
    wait(20)
    Sound:playSE("clock_dial_out", 1, "", A0_9.body_puppet)
    wait(79)
    A0_9.body_puppet:playPoseAnimation("stay")
    A0_9.fire_hdl = A0_9:_termGameObj(A0_9.fire_hdl)
    A0_9.task_run = nil
  end)
end
L0_0.run = L1_1
L0_0 = LeClock
function L1_1(A0_15)
  if not LeClock._isValid(A0_15) then
    return false
  end
  A0_15:stop()
  A0_15.task_init = A0_15:_abortTask(A0_15.task_init)
  A0_15.body_puppet = A0_15:_termGameObj(A0_15.body_puppet)
  A0_15.body_brain = A0_15:_termGameObj(A0_15.body_brain)
  A0_15.collision = A0_15:_termGameObj(A0_15.collision)
  A0_15.hour_hand = A0_15:_termGameObj(A0_15.hour_hand)
  A0_15.minute_hand = A0_15:_termGameObj(A0_15.minute_hand)
  A0_15.pendulum_puppet = A0_15:_termGameObj(A0_15.pendulum_puppet)
  A0_15.pendulum_brain = A0_15:_termGameObj(A0_15.pendulum_brain)
  A0_15.evb = A0_15:_termGameObj(A0_15.evb)
  A0_15.start = false
  A0_15:debugPrint("kill finish")
end
L0_0.kill = L1_1
L0_0 = LeClock
function L1_1(A0_16)
  if not LeClock._isValid(A0_16) then
    return false
  end
  if A0_16.start and A0_16.body_puppet then
    A0_16.body_puppet:playPoseAnimation("stay")
  end
  A0_16.task_run = A0_16:_abortTask(A0_16.task_run)
  A0_16.task_needle = A0_16:_abortTask(A0_16.task_needle)
  A0_16.fire_hdl = A0_16:_termGameObj(A0_16.fire_hdl)
  A0_16.fire_se = A0_16:_stopSE(A0_16.fire_se)
  A0_16.pendulum_se = A0_16:_stopSE(A0_16.pendulum_se)
end
L0_0.stop = L1_1
L0_0 = LeClock
function L1_1(A0_17)
  if not LeClock._isValid(A0_17) then
    return false
  end
  A0_17:debugPrint("\230\153\130\232\168\136\227\129\140\232\166\139\227\129\136\227\130\139\231\175\132\229\155\178\227\129\171\229\133\165\227\129\163\227\129\159")
  if A0_17.start and A0_17.task_run == nil then
    if A0_17.body_puppet then
      A0_17.body_puppet:playPoseAnimation("stay")
    end
    if A0_17.pendulum_puppet then
      A0_17.pendulum_puppet:playPoseAnimation("stay")
      A0_17.pendulum_se = Sound:playSEHandle("clock_pendulum", 1, "", A0_17.pendulum_puppet)
    end
  end
  A0_17:_updateNeedle()
end
L0_0.onEnter = L1_1
L0_0 = LeClock
function L1_1(A0_18)
  if not LeClock._isValid(A0_18) then
    return false
  end
  A0_18:debugPrint("\230\153\130\232\168\136\227\129\140\232\166\139\227\129\136\227\129\170\227\129\132\231\175\132\229\155\178\227\129\171\229\135\186\227\129\159")
  A0_18.task_needle = A0_18:_abortTask(A0_18.task_needle)
  A0_18.pendulum_se = A0_18:_stopSE(A0_18.pendulum_se)
end
L0_0.onLeave = L1_1
L0_0 = LeClock
function L1_1(A0_19)
  local L1_20
  if A0_19 == nil then
    L1_20 = false
    return L1_20
  end
  L1_20 = true
  return L1_20
end
L0_0._isValid = L1_1
L0_0 = LeClock
function L1_1(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26
  for L4_25, L5_26 in L1_22(L2_23) do
    if type(L5_26) == "function" then
      A0_21[L4_25] = L5_26
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = LeClock
function L1_1(A0_27, A1_28)
  if A1_28 then
    A0_27:debugPrint(A1_28:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_28:isRunning() then
      A1_28:try_term()
    else
      A1_28:kill()
    end
  end
  return nil
end
L0_0._termGameObj = L1_1
L0_0 = LeClock
function L1_1(A0_29, A1_30)
  if A1_30 and A1_30:isRunning() then
    A1_30:abort()
  end
  return nil
end
L0_0._abortTask = L1_1
L0_0 = LeClock
function L1_1(A0_31, A1_32)
  if A1_32 then
    Sound:stopSEHandle(A1_32)
  end
  return nil
end
L0_0._stopSE = L1_1
L0_0 = LeClock
function L1_1(A0_33, A1_34, A2_35, A3_36, A4_37, A5_38)
  local L6_39, L7_40, L8_41, L9_42, L10_43
  L9_42 = "Puppet"
  L6_39(L7_40, L8_41)
  L9_42 = "Brain"
  L6_39(L7_40, L8_41)
  L6_39(L7_40, L8_41)
  L9_42 = A4_37
  L6_39(L7_40, L8_41, L9_42)
  L6_39(L7_40)
  if A5_38 then
    for L9_42, L10_43 in L6_39(L7_40) do
      A1_34:loadPoseAnimation(L9_42, L10_43)
    end
    L6_39(L7_40)
  end
  return L6_39, L7_40
end
L0_0._initPuppet = L1_1
L0_0 = LeClock
function L1_1(A0_44, A1_45, A2_46)
  createGameObject2("GimmickBg"):setName(A1_45)
  createGameObject2("GimmickBg"):setDrawModelName(A2_46)
  createGameObject2("GimmickBg"):setAttributeName(A2_46)
  return (createGameObject2("GimmickBg"))
end
L0_0._createGimmickBg = L1_1
L0_0 = LeClock
function L1_1(A0_47, A1_48, A2_49, A3_50, A4_51)
  local L5_52
  L5_52 = createGameObject2
  L5_52 = L5_52("Effect")
  L5_52:setName(A1_48)
  L5_52:setModelName(A2_49)
  A3_50:appendChildToJoint(L5_52, A4_51)
  L5_52:try_init()
  L5_52:waitForReady()
  L5_52:try_start()
  L5_52:play()
  L5_52:setLoop(true)
  return L5_52
end
L0_0._createEffect = L1_1
L0_0 = LeClock
function L1_1(A0_53)
  if not A0_53.start then
    A0_53:debugPrint("\229\136\157\230\156\159\229\140\150\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\229\174\159\232\161\140\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  if A0_53.task_needle then
    A0_53:debugPrint("\233\135\157\227\129\174\230\155\180\230\150\176\227\130\191\227\130\185\227\130\175\227\129\175\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_53.task_needle = invokeTask(function()
    local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59
    L0_54, L1_55, L2_56, L3_57, L4_58, L5_59 = nil, nil, nil, nil, nil, nil
    while true do
      L0_54 = Rtc:localtime()
      if L0_54.hour >= 12 then
        L1_55 = L0_54.hour - 12
      else
        L1_55 = L0_54.hour
      end
      L2_56 = L0_54.minute
      if L2_56 ~= 0 then
        L3_57 = 30 * L1_55 + 0.5 * L2_56
        L4_58 = 6 * L2_56
      else
        L3_57 = 30 * L1_55
        L4_58 = 0
      end
      if L3_57 >= 360 then
        L3_57 = L3_57 - 360
      end
      if L4_58 >= 360 then
        L4_58 = L4_58 - 360
      end
      if A0_53.hour_hand ~= nil then
        A0_53.hour_hand:setRot(ZRotQuat(L3_57 * 3.1415926535 / 180 * -1))
      end
      if A0_53.minute_hand ~= nil then
        A0_53.minute_hand:setRot(ZRotQuat(L4_58 * 3.1415926535 / 180 * -1))
      end
      wait()
    end
  end)
end
L0_0._updateNeedle = L1_1
L0_0 = LeClock
function L1_1(A0_60, A1_61)
  print(" - le clock - " .. A1_61)
end
L0_0.debugPrint = L1_1
L0_0 = LeClock
function L1_1(A0_62, A1_63, A2_64)
  local L3_65, L4_66
  L3_65 = A2_64
  function L4_66(A0_67)
    local L1_68
    L1_68 = A1_63
    L1_68 = L1_68 + 10
    if Debug:isDebugMenuOpen() then
      L1_68 = L1_68 + 200
    end
    Font:debugPrint(L1_68, 20 + 18 * L3_65, A0_67)
    L3_65 = L3_65 + 1
  end
  L4_66("- clock -")
  L4_66("init   task : " .. (A0_62.task_init ~= nil and "run" or "nil"))
  L4_66("run    task : " .. (A0_62.task_run ~= nil and "run" or "nil"))
  L4_66("needle task : " .. (A0_62.task_needle ~= nil and "run" or "nil"))
  L4_66("start       : " .. tostring(A0_62.start))
  return L3_65 - A2_64
end
L0_0.debugDisp = L1_1
function L0_0()
  if _le_clock then
    _le_clock:onEnter()
  end
end
pcspheresensor2_le16_lookat_01_OnEnter = L0_0
function L0_0()
  if _le_clock then
    _le_clock:onLeave()
  end
end
pcspheresensor2_le16_lookat_01_OnLeave = L0_0
