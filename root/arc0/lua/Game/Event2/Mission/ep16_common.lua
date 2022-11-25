local L1_1
function L0_0(A0_2, A1_3)
  if A1_3 ~= nil then
    findGameObject2("Node", A0_2):getWorldPos().y = findGameObject2("Node", A0_2):getWorldPos().y + A1_3
  end
  return (findGameObject2("Node", A0_2):getWorldPos())
end
getNodePos = L0_0
function L0_0(A0_4)
  return Fn_findNpc(A0_4):isMotionEnd()
end
isNpcMotionEnd = L0_0
function L0_0(A0_5)
  return Fn_findNpc(A0_5):isMoveEnd()
end
isNpcMoveEnd = L0_0
function L0_0(A0_6)
  return Fn_findNpc(A0_6):isFlyEnd()
end
isNpcFlyEnd = L0_0
function L0_0(A0_7)
  return Fn_findNpc(A0_7):isTurnEnd()
end
isNpcTurnEnd = L0_0
function L0_0(A0_8)
  return Fn_findNpc(A0_8):isJumpEnd()
end
isNpcJumpEnd = L0_0
function L0_0(A0_9)
  while not isNpcMotionEnd(A0_9) do
    wait()
  end
end
waitNpcMotionEnd = L0_0
function L0_0(A0_10)
  while not isNpcMoveEnd(A0_10) do
    wait()
  end
end
waitNpcMoveEnd = L0_0
function L0_0(A0_11)
  while not isNpcFlyEnd(A0_11) do
    wait()
  end
end
waitNpcFlyEnd = L0_0
function L0_0(A0_12)
  while not isNpcTurnEnd(A0_12) do
    wait()
  end
end
waitNpcTurnEnd = L0_0
function L0_0(A0_13)
  while not isNpcJumpEnd(A0_13) do
    wait()
  end
end
waitNpcJumpEnd = L0_0
function L0_0(A0_14)
  return Fn_findNpc(A0_14):isGrabbed()
end
isNpcGrabbed = L0_0
function L0_0(A0_15, A1_16, A2_17)
  Fn_findNpc(A0_15):fly(A1_16, A2_17)
end
flyNpc = L0_0
function L0_0(A0_18, A1_19, A2_20)
  Fn_findNpc(A0_18):turn(A1_19, A2_20)
end
turnNpc = L0_0
function L0_0(A0_21)
  HUD:mnaviNew({
    name = A0_21,
    PochFadeLen0 = 0,
    PochFadeLen100 = -1
  }):setTarget(findGameObject2("Node", A0_21))
  HUD:mnaviNew({
    name = A0_21,
    PochFadeLen0 = 0,
    PochFadeLen100 = -1
  }):setActive(true, true)
  return (HUD:mnaviNew({
    name = A0_21,
    PochFadeLen0 = 0,
    PochFadeLen100 = -1
  }))
end
setMnavi = L0_0
function L0_0(A0_22)
  if A0_22 ~= nil then
    A0_22:setActive(false)
    A0_22:del()
  end
end
deleteMnavi = L0_0
debug_draw = nil
function L0_0()
  RAC_gaugeInit("ep16_09040", HUD.kCountType_Up, 0.8)
  if debug_draw == nil then
    debug_draw = Debug:getSwitch({"Display", "Debug Draw"})
  end
  Debug:setSwitch({"Display", "Debug Draw"}, false)
end
gaugeInit = L0_0
function L0_0()
  HUD:miniGaugeSetVisible(false)
  Debug:setSwitch({"Display", "Debug Draw"}, debug_draw)
  debug_draw = nil
end
gaugeOff = L0_0
function L0_0(A0_23)
  while not Fn_sendEventComSb("isPhaseEnd", A0_23) do
    wait()
  end
end
waitComNextPhase = L0_0
