local L1_1
function L0_0()
  local L0_2, L1_3
  _next_phase = true
end
nextPhase = L0_0
function L0_0()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
waitPhase = L0_0
function L0_0(A0_4)
  _next_phase = true
  Fn_pcSensorOff(A0_4)
end
nextPhaseOnEnter = L0_0
function L0_0()
  while _sensor_flg ~= true or Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
  _sensor_flg = false
end
waitSensorInIdle = L0_0
_TELOP_WAIT = 9.5
function L0_0(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10
  L3_8 = 7
  L4_9 = 76
  if A2_7 ~= nil then
    L3_8 = A2_7
  end
  L5_10 = 1
  while true do
    if A0_5[L5_10].name == A1_6 then
      HUD:setPlayableTelop(A0_5[L5_10].pos, L3_8, {
        A0_5[L5_10].chara
      }, {
        A0_5[L5_10].cv
      })
      break
    end
    L5_10 = L5_10 + 1
    wait()
  end
end
ep27telopView = L0_0
function L0_0(A0_11, A1_12)
  local L2_13
  L2_13 = 1
  while true do
    if A0_11[L2_13].name == A1_12 then
      HUD:setPlayableTelop(A0_11[L2_13].pos)
      break
    end
    L2_13 = L2_13 + 1
    wait()
  end
end
ep27telopEnd = L0_0
function L0_0(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19, L6_20, L7_21, L8_22
  L3_17 = _findObjectHandle
  L4_18 = A0_14
  L3_17 = L3_17(L4_18)
  L4_18 = 0
  if A2_16 ~= nil then
    L4_18 = A2_16
  end
  L6_20 = L3_17
  L5_19 = L3_17.getWorldPos
  L5_19 = L5_19(L6_20)
  L6_20 = L5_19.y
  L6_20 = L6_20 + L4_18
  L5_19.y = L6_20
  L6_20 = A1_15
  while true do
    L7_21 = Fn_getPcPosRot
    L8_22 = L7_21()
    if not Player:isGravityControlMode() then
      L7_21.y = L7_21.y + 1.5
      print("\233\163\155\227\130\147\227\129\167\227\129\170\227\129\132\227\129\174\227\129\167\227\130\171\227\131\161\227\131\169\228\189\141\231\189\174\227\130\146\228\184\138\227\129\146\227\129\190\227\129\153")
    end
    Query:setEyeSightTransform(L7_21, L8_22)
    Query:setEyeSightAngle(Deg2Rad(45))
    Query:setEyeSightRange(L6_20)
    if not Query:raycastEyeSight(L5_19) then
      Player:setStay(true)
      break
    end
    if not Query:raycastEyeSight(L5_19) then
      DebugDraw:setColor(0, 1, 0)
    else
      DebugDraw:setColor(1, 0, 0)
    end
    DebugDraw:drawLines({L7_21, L5_19})
    wait()
  end
end
rayCheckPcSetStay = L0_0
function L0_0(A0_23, A1_24, A2_25)
  local L3_26, L4_27, L5_28, L6_29
  if A1_24 == nil then
    A1_24 = 40
  end
  if A2_25 == nil then
    A2_25 = 0.1
  end
  L3_26 = false
  L4_27 = Fn_isInSightTarget
  L5_28 = A0_23
  L4_27 = L4_27(L5_28)
  if L4_27 == true then
    L4_27 = Fn_getPcPosRot
    L5_28 = L4_27()
    L6_29 = L4_27.y
    L6_29 = L6_29 + 1.5
    L4_27.y = L6_29
    L6_29 = Query
    L6_29 = L6_29.setEyeSightTransform
    L6_29(L6_29, L4_27, L5_28)
    L6_29 = Query
    L6_29 = L6_29.setEyeSightAngle
    L6_29(L6_29, Deg2Rad(360))
    L6_29 = Query
    L6_29 = L6_29.setEyeSightRange
    L6_29(L6_29, A1_24)
    L6_29 = A0_23.getWorldPos
    L6_29 = L6_29(A0_23)
    if Query:checkEyeSightSphere(L6_29, A2_25) == true and Query:raycastEyeSight(L6_29) == nil then
      L3_26 = true
    end
    DebugDraw:drawLines({
      L4_27,
      view_pos
    })
  end
  return L3_26
end
is_check_eye_node = L0_0
function L0_0()
  Player:setStay(true)
  Fn_userCtrlAllOff()
end
pcStayCamStopOn = L0_0
function L0_0()
  Player:setStay(false)
  Fn_userCtrlOn()
end
pcStayCamStopOff = L0_0
function L0_0(A0_30, A1_31, A2_32, A3_33)
  local L4_34, L5_35, L6_36
  L4_34 = _findObjectHandle
  L5_35 = A0_30
  L4_34 = L4_34(L5_35)
  L5_35 = 0
  if A1_31 ~= nil then
    L5_35 = A1_31
  end
  L6_36 = 0.7
  if A3_33 ~= nil then
    L6_36 = A3_33
  end
  while true do
    if Fn_isInSightTarget(L4_34, L6_36) == true then
      print("\227\131\147\227\131\165\227\131\188\227\130\179\227\131\179\228\184\173")
      waitSeconds(L5_35)
      break
    end
    wait()
  end
  Fn_lookAtObject(L4_34, A2_32):abort()
  print("\227\131\147\227\131\165\227\131\188\227\130\179\227\131\179\231\181\130\227\130\143\227\130\138")
end
viewControl = L0_0
function L0_0()
  local L0_37
  L0_37 = false
  while Player:getAction() == Player.kAction_AnyGravKick or Player:isStayMode() == false do
    wait()
  end
  if Player:isGravityControlMode() then
    print("\233\135\141\229\138\155\230\147\141\228\189\156\228\184\173\227\129\167\227\129\153")
    Player:setGravityControlMode(false)
    L0_37 = true
    print("\233\135\141\229\138\155\229\164\137\229\140\150\227\130\146\229\129\156\230\173\162 = " .. tostring(L0_37))
    while true do
      if Player:getAction() == Player.kAction_Idle then
        waitSeconds(1)
        break
      elseif Player:isGravityControlMode() then
        print("\229\134\141\227\129\179\233\135\141\229\138\155\230\147\141\228\189\156\228\184\173\227\129\167\227\129\153")
        Player:setGravityControlMode(false)
      end
      wait()
    end
  end
  return L0_37
end
inSensorGravityCtrlModeOff = L0_0
function L0_0()
  Player:setControl(Player.kControl_All, true)
end
inSensorGravityCtrlModeOn = L0_0
_warp_add_func = nil
function L0_0()
  print("\231\140\171\227\131\175\227\131\188\227\131\151(\230\177\142\231\148\168\227\129\167\227\129\175\227\129\170\227\129\132)\231\153\186\229\139\149\239\188\129\227\128\128_warp_add_func = " .. tostring(_warp_add_func))
  Player:setStay(true)
  invokeTask(function()
    Fn_missionViewEnd()
    Fn_captionViewEnd()
    Player:setNoDamageMode(Player.kNoDamage_All, true)
    Fn_catWarp()
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    if _warp_add_func ~= nil then
      _warp_add_func()
      wait()
    end
    Player:setStay(false)
  end)
end
catWarpOnLeave = L0_0
function L0_0(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43
  L3_41 = type
  L4_42 = A0_38
  L3_41 = L3_41(L4_42)
  L4_42 = nil
  if L3_41 == "string" then
    L5_43 = findGameObject2
    L5_43 = L5_43("Node", A0_38)
    L4_42 = L5_43
  elseif L3_41 == "userdata" then
    L4_42 = A0_38
  else
    L5_43 = false
    return L5_43
  end
  if not A1_39 then
    L5_43 = "child_node_"
    A1_39 = L5_43 .. tostring(A0_38)
  end
  L5_43 = createGameObject2
  L5_43 = L5_43("Node")
  if A2_40 then
    L5_43:setPos(Vector(0, 1.5, 0))
  else
    L5_43:setPos(Vector(0, 0, 0))
  end
  L5_43:setName(A1_39)
  L4_42:appendChild(L5_43)
  L5_43:try_init()
  L5_43:waitForReady()
  L5_43:try_start()
  return L5_43
end
createNode = L0_0
