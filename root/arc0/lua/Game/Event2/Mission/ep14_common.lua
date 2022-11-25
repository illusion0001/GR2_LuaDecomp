local L1_1
_brahman_pupp = nil
_next_phase = false
function L0_0()
  local L0_2, L1_3
  _next_phase = true
end
nextPhase = L0_0
function L0_0()
  if _next_phase then
    _next_phase = false
  end
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
function L0_0(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10, L6_11, L7_12, L8_13
  L3_8 = _findObjectHandle
  L4_9 = A0_5
  L3_8 = L3_8(L4_9)
  L4_9 = 0
  if A2_7 ~= nil then
    L4_9 = A2_7
  end
  L6_11 = L3_8
  L5_10 = L3_8.getWorldPos
  L5_10 = L5_10(L6_11)
  L6_11 = L5_10.y
  L6_11 = L6_11 + L4_9
  L5_10.y = L6_11
  L6_11 = A1_6
  while true do
    L7_12 = Fn_getPcPosRot
    L8_13 = L7_12()
    if not Player:isGravityControlMode() then
      L7_12.y = L7_12.y + 1.5
    end
    Query:setEyeSightTransform(L7_12, L8_13)
    Query:setEyeSightAngle(Deg2Rad(45))
    Query:setEyeSightRange(L6_11)
    if not Query:raycastEyeSight(L5_10) then
      DebugDraw:setColor(0, 1, 0)
      Player:setStay(true)
      waitSeconds(0.3)
      if Query:raycastEyeSight(L5_10) then
        Player:setStay(false)
        DebugDraw:setColor(1, 0, 0)
        DebugDraw:drawLines({L7_12, L5_10})
        wait()
      end
    end
  end
end
rayCheckPcSetStay = L0_0
function L0_0(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23
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
  L7_21 = false
  L8_22 = Fn_getPcPosRot
  L9_23 = L8_22()
  if not Player:isGravityControlMode() then
    L8_22.y = L8_22.y + 1.5
  end
  Query:setEyeSightTransform(L8_22, L9_23)
  Query:setEyeSightAngle(Deg2Rad(360))
  Query:setEyeSightRange(L6_20)
  if Query:raycastEyeSight(L5_19) == nil then
    L7_21 = true
  end
  DebugDraw:drawLines({L8_22, L5_19})
  return L7_21
end
rayCheck = L0_0
function L0_0(A0_24, A1_25, A2_26)
  local L3_27, L4_28, L5_29, L6_30
  if A1_25 == nil then
    A1_25 = 40
  end
  if A2_26 == nil then
    A2_26 = 0.1
  end
  L3_27 = false
  L4_28 = Fn_isInSightTarget
  L5_29 = A0_24
  L4_28 = L4_28(L5_29)
  if L4_28 == true then
    L4_28 = Fn_getPcPosRot
    L5_29 = L4_28()
    L6_30 = L4_28.y
    L6_30 = L6_30 + 1.5
    L4_28.y = L6_30
    L6_30 = Query
    L6_30 = L6_30.setEyeSightTransform
    L6_30(L6_30, L4_28, L5_29)
    L6_30 = Query
    L6_30 = L6_30.setEyeSightAngle
    L6_30(L6_30, Deg2Rad(360))
    L6_30 = Query
    L6_30 = L6_30.setEyeSightRange
    L6_30(L6_30, A1_25)
    L6_30 = A0_24.getWorldPos
    L6_30 = L6_30(A0_24)
    if Query:checkEyeSightSphere(L6_30, A2_26) == true and Query:raycastEyeSight(L6_30) == nil then
      L3_27 = true
    end
    DebugDraw:drawLines({
      L4_28,
      view_pos
    })
  end
  return L3_27
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
function L0_0(A0_31, A1_32, A2_33, A3_34)
  local L4_35, L5_36, L6_37
  L4_35 = _findObjectHandle
  L5_36 = A0_31
  L4_35 = L4_35(L5_36)
  L5_36 = 0
  if A1_32 ~= nil then
    L5_36 = A1_32
  end
  L6_37 = 0.7
  if A3_34 ~= nil then
    L6_37 = A3_34
  end
  while true do
    if Fn_isInSightTarget(L4_35, L6_37) == true then
      print("\227\131\147\227\131\165\227\131\188\227\130\179\227\131\179\228\184\173")
      waitSeconds(L5_36)
      break
    end
    wait()
  end
  Fn_lookAtObject(L4_35, A2_33):abort()
  print("\227\131\147\227\131\165\227\131\188\227\130\179\227\131\179\231\181\130\227\130\143\227\130\138")
end
viewControl = L0_0
_shutup_flag = false
_speak_flag = false
_mess_num = 0
function L0_0(A0_38)
  if _shutup_flag then
    _shutup_flag = false
  end
  return invokeTask(function()
    while not _shutup_flag do
      if _speak_flag then
        while Fn_isCaptionView() do
          wait()
        end
        if _mess_num > #A0_38 then
          _shutup_flag = true
          break
        end
        Fn_captionViewWait(A0_38[_mess_num])
        _speak_flag = false
      end
      wait()
    end
    _mess_num = 0
  end)
end
autoCaptionView = L0_0
function L0_0()
  local L1_39
  L1_39 = _mess_num
  L1_39 = L1_39 + 1
  _mess_num = L1_39
end
addMessageNum = L0_0
function L0_0(A0_40)
  addMessageNum()
  _speak_flag = true
  Fn_pcSensorOff(A0_40)
end
captionViewOnEnter = L0_0
function L0_0()
  local L0_41, L1_42
  _shutup_flag = true
end
autoCaptionViewEnd = L0_0
_arrived = false
function L0_0(A0_43, A1_44, A2_45)
  return invokeTask(function()
    local L0_46, L1_47, L2_48, L3_49
    L0_46 = A0_43
    L1_47 = Fn_getPlayerWorldPos
    L1_47 = L1_47()
    L2_48 = A1_44
    if L2_48 ~= nil then
      L1_47 = A1_44
    end
    L2_48 = Fn_get_distance
    L3_49 = L0_46
    L2_48 = L2_48(L3_49, L1_47)
    L3_49 = A2_45
    L3_49 = #L3_49
    L3_49 = L3_49 + 1
    L3_49 = L2_48 / L3_49
    while _arrived == false do
      if L3_49 < L2_48 - Fn_getDistanceToPlayer(L0_46) then
        Fn_captionViewWait(A2_45[1])
        if not (1 + 1 > #A2_45) then
          wait()
        end
      end
    end
  end)
end
cueueCaptionView = L0_0
function L0_0()
  local L0_50, L1_51
  _arrived = true
end
cueueCaptionViewEnd = L0_0
function L0_0()
  local L0_52
  L0_52 = false
  while Player:getAction() == Player.kAction_AnyGravKick or Player:isStayMode() == false do
    wait()
  end
  if Player:isGravityControlMode() then
    print("\233\135\141\229\138\155\230\147\141\228\189\156\228\184\173\227\129\167\227\129\153")
    Player:setGravityControlMode(false)
    L0_52 = true
    print("\233\135\141\229\138\155\229\164\137\229\140\150\227\130\146\229\129\156\230\173\162 = " .. tostring(L0_52))
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
    print(1)
  end
  return L0_52
end
inSensorGravityCtrlModeOff = L0_0
function L0_0()
  Player:setControl(Player.kControl_All, true)
end
inSensorGravityCtrlModeOn = L0_0
function L0_0(A0_53, A1_54, A2_55)
  local L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65
  L3_56 = nil
  L4_57 = A1_54 or 1
  L5_58 = A2_55 or nil
  L6_59 = A0_53
  if L5_58 ~= nil then
    L6_59 = L7_60
    for L10_63, L11_64 in L7_60(L8_61) do
      L12_65 = createGameObject2
      L12_65 = L12_65("Node")
      L12_65:setName(L11_64 .. "_ofs_y")
      L12_65:setPos(Vector(0, L5_58, 0))
      findGameObject2("Node", L11_64):appendChild(L12_65)
      L12_65:try_init()
      L12_65:waitForReady()
      L12_65:try_start()
      L6_59[L10_63] = L12_65
    end
  end
  while true do
    if L8_61 then
      L8_61()
    end
  end
  return L3_56
end
getNotVisiblePos = L0_0
function L0_0(A0_66)
  for _FORV_5_, _FORV_6_ in pairs(A0_66) do
    ;({})[_FORV_5_] = _FORV_6_
  end
  return {}
end
copyTable = L0_0
_train_controller_k = nil
_train_task_hdl = nil
function L0_0(A0_67)
  invokeSystemTask(function()
    local L0_68, L1_69, L2_70, L3_71
    L0_68 = nil
    L1_69 = loadFileAsset
    L2_70 = "evb"
    L3_71 = "evx/train_hx_a_root"
    L1_69 = L1_69(L2_70, L3_71)
    if L1_69 ~= nil then
      L3_71 = L1_69
      L2_70 = L1_69.wait
      L2_70(L3_71)
      L3_71 = L1_69
      L2_70 = L1_69.getRoot
      L2_70 = L2_70(L3_71)
      L3_71 = EventData
      L3_71 = L3_71.create
      L3_71 = L3_71(L3_71, "train_hx_a_root", nil, L2_70)
      L0_68 = L3_71
      L3_71 = L0_68.try_init
      L3_71(L0_68)
      L3_71 = L0_68.waitForReady
      L3_71(L0_68)
      L3_71 = L0_68.try_start
      L3_71(L0_68)
      L3_71 = TrainController
      L3_71 = L3_71.getSettingDataHeksevillTrain
      L3_71 = L3_71()
      if A0_67 ~= nil then
        L3_71()[2].yes_func = A0_67
      end
      TrainController.create("event_train_k", "train_k"):set(L3_71)
      for _FORV_9_ = 1, #L3_71() do
        TrainController.create("event_train_k", "train_k"):addStation(L3_71()[_FORV_9_])
      end
      TrainController.create("event_train_k", "train_k"):put({
        station_name = L3_71()[1].station_name
      })
      _train_controller_k = TrainController.create("event_train_k", "train_k")
      _train_task_hdl = invokeTask(function()
        while _train_controller_k ~= nil do
          _train_controller_k:run()
          wait()
        end
      end)
    else
      L2_70 = print
      L3_71 = "FAILED : LOAD EVENT DATA evx/train_hx_a_root "
      L2_70(L3_71)
    end
  end)
end
MissionEp14TrainCreate = L0_0
function L0_0()
  local L0_72, L1_73
  L0_72 = _train_controller_k
  if L0_72 == nil then
    L0_72 = nil
    return L0_72
  end
  L0_72 = _train_controller_k
  L0_72 = L0_72.hdl
  return L0_72
end
MissionEp14GetTrainHandle = L0_0
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
function L0_0()
  local L0_74, L1_75
  _bra_reset = true
end
braReset = L0_0
function L0_0(A0_76, A1_77, A2_78)
  local L3_79, L4_80, L5_81
  L3_79 = type
  L4_80 = A0_76
  L3_79 = L3_79(L4_80)
  L4_80 = nil
  if L3_79 == "string" then
    L5_81 = findGameObject2
    L5_81 = L5_81("Node", A0_76)
    L4_80 = L5_81
  elseif L3_79 == "userdata" then
    L4_80 = A0_76
  else
    L5_81 = false
    return L5_81
  end
  if not A1_77 then
    L5_81 = "child_node_"
    A1_77 = L5_81 .. tostring(A0_76)
  end
  L5_81 = createGameObject2
  L5_81 = L5_81("Node")
  if A2_78 then
    L5_81:setPos(Vector(0, 1.5, 0))
  else
    L5_81:setPos(Vector(0, 0, 0))
  end
  L5_81:setName(A1_77)
  L4_80:appendChild(L5_81)
  L5_81:try_init()
  L5_81:waitForReady()
  L5_81:try_start()
  return L5_81
end
createNode = L0_0
