dofile("/Game/Misc/perceivable_npc.lua")
kCAGE1 = 17
kCAGE2 = 4
kCAGE3 = 5
kCAGE4 = 12
_cage_hdl = {}
_cage_col_hdl = {}
_cage_hdl_org = {}
_next_phase = false
CROW_WALK_SPEED = 10
CROW_MOVE_AIR = 20
_begin_combat = false
_wait_time = false
_too_early = false
_too_late = false
_detection_mode = false
_detected_on_sensor = false
_breakdown_effect = {}
_breakdown_sound = {}
_recast_time_ep10_09000 = 0
_recast_time_ep10_09008 = 0
_recast_time_ep10_09010 = 0
_recast_time_ep10_09013 = 0
_recast_time_ep10_09015 = 0
_recast_time_ep10_00120 = 0
_crane_area_group = ""
function waitPhase()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function setUpCageCollision()
  local L0_0, L1_1, L2_2, L3_3
  for L3_3 = 1, 4 do
    _cage_col_hdl[L3_3] = createGameObject2("GimmickBg")
    findGameObject2("Node", "locator2_jail_col_0" .. L3_3):appendChild(_cage_col_hdl[L3_3])
    _cage_col_hdl[L3_3]:setName("ep10_col")
    _cage_col_hdl[L3_3]:setCollisionName("ep10_col_0" .. L3_3)
    _cage_col_hdl[L3_3]:setAttributeName("invisible_col")
  end
end
TimerClass = {}
function TimerClass.new()
  local L0_4, L1_5
  L0_4 = {}
  L0_4.visible = true
  L0_4.counter = false
  L0_4.cnt = 5
  L0_4.max = 5
  function L1_5()
    local L0_6, L1_7
    L0_6 = L0_4.max
    L0_4.cnt = L0_6
  end
  L0_4.reset = L1_5
  function L1_5()
    while true do
      if L0_4.visible == true then
        Font:asciiPrint(1600, 20, "Caution:" .. string.format("%d", L0_4.cnt) .. " / " .. L0_4.max .. "")
      end
      wait()
    end
  end
  L0_4.view = L1_5
  function L1_5()
    local L0_8, L1_9
    L0_4.counter = false
  end
  L0_4.stop = L1_5
  function L1_5()
    local L0_10, L1_11
    L0_4.counter = true
  end
  L0_4.start = L1_5
  function L1_5()
    local L0_12, L1_13
    L0_4.visible = false
  end
  L0_4.off = L1_5
  function L1_5()
    local L0_14, L1_15
    L0_4.visible = true
  end
  L0_4.on = L1_5
  function L1_5()
    local L0_16, L1_17
    L0_16 = L0_4.visible
    return L0_16
  end
  L0_4.isActive = L1_5
  function L1_5(A0_18)
    L0_4.cnt = L0_4.cnt - A0_18
  end
  L0_4.update = L1_5
  function L1_5(A0_19)
    if L0_4.counter == true then
      if L0_4.cnt > 0 then
        L0_4.update(1)
        return true
      else
        return false
      end
    else
      return true
    end
  end
  L0_4.check = L1_5
  return L0_4
end
function createGem(A0_20, A1_21)
  local L2_22, L3_23, L4_24
  L3_23 = A0_20
  L2_22 = A0_20.getName
  L2_22 = L2_22(L3_23)
  L3_23 = createGameObject2
  L4_24 = "Gem"
  L3_23 = L3_23(L4_24)
  L4_24 = L3_23.setGemModelNo
  L4_24(L3_23, A1_21)
  L4_24 = A0_20.getWorldPos
  L4_24 = L4_24(A0_20)
  L4_24 = L4_24 + Vector(0, 0, 0)
  L3_23:setWorldPos(L4_24)
  L3_23:setForceMove()
  L3_23:setVisible(true)
  L3_23:try_init()
  L3_23:setVisibleBlockHalfSize(150)
  L3_23:waitForReadyAsync(function()
    L3_23:try_start()
  end)
  return L3_23
end
function setNpcSenser(A0_25, A1_26, A2_27)
  local L3_28, L4_29, L5_30, L6_31
  L3_28 = Vector
  L4_29 = 3
  L5_30 = 3
  L6_31 = 3
  L3_28 = L3_28(L4_29, L5_30, L6_31)
  L4_29 = nil
  if A0_25 ~= nil then
    if A1_26 ~= nil then
      L3_28 = A1_26
    end
    L5_30 = A2_27
    L6_31 = "_OnEnter"
    L5_30 = L5_30 .. L6_31
    L6_31 = A2_27
    L6_31 = L6_31 .. "_OnLeave"
    L4_29 = createGameObject2("PlayerSensor")
    L4_29:setDetectBehavior(1)
    L4_29:setName(A2_27)
    L4_29:addBox(L3_28)
    L4_29:setPos(Vector(0, L3_28.y / 2, 0))
    L4_29:setOnEnter(L5_30)
    L4_29:setOnLeave(L6_31)
    L4_29:setActive(true)
    A0_25:appendChild(L4_29)
  end
  return L4_29
end
_NPC_SIGHT_DEG = 35
_NPC_SIGHT_LEN = 30
_NPC_CAUTION_INC = 2
_NPC_CAUTION_DEC = 0.5
_NPC_SIGHT_H_DEG = 45
_NPC_SIGHT_V_DEG = 15
_move_option_soldier_normal = {
  anim_walk = "npc_walk",
  anim_turn_l = "npc_turn_l",
  anim_turn_r = "npc_turn_r",
  anim_walk_speed = 1,
  runLength = 99999,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = true,
  recast = true
}
_move_option_soldier_alert = {
  anim_run_speed = 0.8,
  runLength = -1,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = false,
  recast = true
}
_move_option_mechsmall_normal = {
  anim_walk_speed = 1,
  runLength = 99999,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = true,
  recast = true
}
_move_option_mechsmall_alert = {
  anim_run_speed = 0.6,
  runLength = -1,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = false,
  recast = true
}
function getNodePos(A0_32)
  return findGameObject2("Node", A0_32):getWorldPos()
end
function getNpcPos(A0_33)
  return Fn_findNpcPuppet(A0_33):getWorldPos()
end
function waitGetPos(A0_34, A1_35)
  pos = getNodePos(A0_34)
  while not isWithinRange(pos, A1_35) do
    wait()
  end
end
function isWithinRange(A0_36, A1_37)
  local L2_38
  L2_38 = Fn_getPcPosRot
  L2_38 = L2_38()
  if A1_37 > Fn_get_distance(A0_36, L2_38) then
    return true
  else
    return false
  end
end
function isWithinRangeOfNPC(A0_39, A1_40)
  return isWithinRange(getNpcPos(A0_39), A1_40)
end
function isWithinRangeOfNode(A0_41, A1_42)
  return isWithinRange(getNodePos(A0_41), A1_42)
end
function isNpcMotionEnd(A0_43)
  return Fn_findNpc(A0_43):isMotionEnd()
end
function isNpcMoveEnd(A0_44)
  return Fn_findNpc(A0_44):isMoveEnd()
end
function isNpcTurnEnd(A0_45)
  return Fn_findNpc(A0_45):isTurnEnd()
end
function waitNpcMotionEnd(A0_46)
  while not isNpcMotionEnd(A0_46) do
    wait()
  end
end
function waitNpcMoveEnd(A0_47)
  while not isNpcMoveEnd(A0_47) do
    wait()
  end
end
function waitNpcTurnEnd(A0_48)
  while not isNpcTurnEnd(A0_48) do
    wait()
  end
end
function turnNpc(A0_49, A1_50, A2_51)
  Fn_findNpc(A0_49):turn(A1_50, A2_51)
end
function turnNPCifMoveEnd(A0_52)
  if isNpcMoveEnd(A0_52) then
    Fn_turnNpc(A0_52)
    return true
  else
    return false
  end
end
function isNpcGrabbed(A0_53)
  return Fn_findNpc(A0_53):isGrabbed()
end
function setPlayerIdle()
  Fn_userCtrlOff()
  waitSeconds(1)
  if Player:isGravityControlMode() then
    Player:setStay(true, false)
  else
  end
  waitSeconds(2)
  Fn_userCtrlOn()
end
function setPlayerIdle2()
  if Player:isGravityControlMode() then
    Player:setStay(true, false)
  else
    Player:setStay(true)
  end
end
function loadNpcMotion(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
  L2_56 = Fn_findNpcPuppet
  L2_56 = L2_56(L3_57)
  for L6_60, L7_61 in L3_57(L4_58) do
    L2_56:loadPoseAnimation(L7_61, L7_61)
    print("\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\232\170\173\227\129\191\232\190\188\227\129\191: " .. L7_61)
  end
  while true do
    if L3_57 then
      L3_57()
    end
  end
end
function playNpcMotion(A0_62, A1_63, A2_64)
  if Fn_findNpcPuppet(A0_62):playPoseAnimation(A1_63, A2_64) then
    while not Fn_findNpcPuppet(A0_62):isPoseAnimEnd() do
      wait()
    end
  else
    print("\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\130\146\229\134\141\231\148\159\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159: " .. A1_63)
  end
end
function soldierAction(A0_65, A1_66)
  print("\226\150\160\226\150\160CALLBACK_REASON\226\150\160\226\150\160", A1_66, A0_65)
  if A1_66 == CALLBACK_REASON.DAMAGED then
    Fn_captionView("ep10_09000")
  elseif A1_66 == CALLBACK_REASON.IS_INSIGHT or A1_66 == CALLBACK_REASON.INDICATION_OVERFLOW then
    Fn_captionView("ep10_09001")
  elseif A1_66 == CALLBACK_REASON.RECEIVE_REPORT then
    Fn_captionView("ep10_09002")
  elseif A1_66 == CALLBACK_REASON.OUT_OF_RANGE then
    Fn_captionView("ep10_09003")
  elseif A1_66 == CALLBACK_REASON.CAUTION_OVERFLOW then
    Fn_captionView("ep10_09004")
  elseif A1_66 == CALLBACK_REASON.LOST_TARGET then
    Fn_captionView("ep10_09005")
  elseif A1_66 == CALLBACK_REASON.NO_CAUTION or A1_66 == CALLBACK_REASON.NO_INDICATION then
    Fn_captionView("ep10_09006")
  elseif A1_66 == CALLBACK_REASON.DIED then
    Player:setSituation(Player.kSituation_Normal, true, 0, true, false)
  elseif A1_66 == CALLBACK_REASON.BEGIN_COMBAT then
    Player:setSituation(Player.kSituation_InCombat, true, 0, true, false)
    if _reset_phase == true then
      CautionLevel.allTerminate()
    else
      Fn_captionView("ep10_09008")
    end
    if A0_65 == _npc_event_soldier_01 and 2 >= _soldierInstance[2].status then
      _soldierInstance[2]:setCautionLevel(100)
      _soldierInstance[2].status = NPC_STATUS.ALERT
    elseif A0_65 == _npc_event_soldier_02 and 2 >= _soldierInstance[1].status then
      _soldierInstance[1]:setCautionLevel(100)
      _soldierInstance[1].status = NPC_STATUS.ALERT
    end
  elseif A1_66 == CALLBACK_REASON.COMBAT_TIMEOUT then
    CautionLevel.allTerminate()
    detectedBySoldier(A0_65)
  end
end
function soldierActionep10b(A0_67, A1_68)
  print("\226\150\160\226\150\160CALLBACK_REASON\226\150\160\226\150\160", A1_68, A0_67)
  if A1_68 == CALLBACK_REASON.DAMAGED then
    if _wait_time == true then
      _too_early = true
    end
    if _too_late == true then
      print("\231\170\129\230\146\131\232\166\129\232\171\139\227\130\175\227\131\170\227\130\162")
      _too_late = false
    end
    Fn_captionView("ep10_09000")
  elseif A1_68 == CALLBACK_REASON.IS_INSIGHT or A1_68 == CALLBACK_REASON.INDICATION_OVERFLOW then
    if _wait_time == true then
      _too_early = true
    end
    if _detection_mode == false then
      Fn_captionView("ep10_09001")
    end
  elseif A1_68 == CALLBACK_REASON.RECEIVE_REPORT then
    if _wait_time == true then
      _too_early = true
    end
    Fn_captionView("ep10_09002")
  elseif A1_68 == CALLBACK_REASON.OUT_OF_RANGE then
    Fn_captionView("ep10_09003")
  elseif A1_68 == CALLBACK_REASON.CAUTION_OVERFLOW then
    if _wait_time == true then
      _too_early = true
    end
    if _sol_dead_flag == false and _too_late == false then
      Fn_captionView("ep10_09004")
    end
  elseif A1_68 == CALLBACK_REASON.LOST_TARGET then
    Fn_captionView("ep10_09005")
  elseif A1_68 == CALLBACK_REASON.NO_CAUTION or A1_68 == CALLBACK_REASON.NO_INDICATION then
    Fn_captionView("ep10_09006")
  elseif A1_68 == CALLBACK_REASON.DIED then
    Player:setSituation(Player.kSituation_Normal, true, 0, true, false)
    if A0_67 == _npc_event_soldier_01 and 2 >= _soldierInstance[2].status then
      _soldierInstance[2]:setCautionLevel(100)
      _soldierInstance[2].status = NPC_STATUS.ALERT
    elseif A0_67 == _npc_event_soldier_02 and 2 >= _soldierInstance[1].status then
      _soldierInstance[1]:setCautionLevel(100)
      _soldierInstance[1].status = NPC_STATUS.ALERT
    end
  elseif A1_68 == CALLBACK_REASON.BEGIN_COMBAT then
    Player:setSituation(Player.kSituation_InCombat, true, 0, true, false)
    if A0_67 == _npc_event_soldier_01 and 2 >= _soldierInstance[2].status then
      _soldierInstance[2]:setCautionLevel(100)
      _soldierInstance[2].status = NPC_STATUS.ALERT
      Fn_captionView("ep10_09008")
    elseif A0_67 == _npc_event_soldier_02 and 2 >= _soldierInstance[1].status then
      _soldierInstance[1]:setCautionLevel(100)
      _soldierInstance[1].status = NPC_STATUS.ALERT
      Fn_captionView("ep10_09008")
    end
    if _reset_phase == true then
      CautionLevel.allTerminate()
    elseif _sol_dead_flag == false and _too_late == false then
      Fn_captionView("ep10_09008")
    else
      _too_late = false
    end
  elseif A1_68 == CALLBACK_REASON.COMBAT_TIMEOUT then
    print("_soldierInstance[1].status", _soldierInstance[1].status)
    print("_soldierInstance[2].status", _soldierInstance[2].status)
    if _soldierInstance[1].status == NPC_STATUS.DEAD and _soldierInstance[2].status == NPC_STATUS.DEAD then
      return
    end
    CautionLevel.allTerminate()
    detectedBySoldier(A0_67)
  end
end
function soldierActionep10c(A0_69, A1_70, A2_71)
  print("\226\150\160\226\150\160CALLBACK_REASON\226\150\160\226\150\160", A1_70, A0_69, A2_71)
  if A1_70 == CALLBACK_REASON.DAMAGED then
    waitSeconds(1)
    if Time:getGameWorldTimeStamp() - _recast_time_ep10_09000 < 180 then
      return
    end
    detectedCaptionView(A0_69, "ep10_09000")
    _recast_time_ep10_09000 = Time:getGameWorldTimeStamp()
  elseif A1_70 == CALLBACK_REASON.IS_INSIGHT or A1_70 == CALLBACK_REASON.INDICATION_OVERFLOW then
    if _begin_combat or _detected_on_sensor then
      return
    end
    if Time:getGameWorldTimeStamp() - _recast_time_ep10_09010 < 120 then
      return
    end
    Fn_captionView("ep10_09010")
    _recast_time_ep10_09010 = Time:getGameWorldTimeStamp()
  elseif A1_70 == CALLBACK_REASON.CAUTION_OVERFLOW then
    waitSeconds(1)
    if _detected_on_sensor then
      return
    end
    if 180 > Time:getGameWorldTimeStamp() - _recast_time_ep10_09013 then
      return
    end
    detectedCaptionView(A0_69, "ep10_09013")
    _recast_time_ep10_09013 = Time:getGameWorldTimeStamp()
  elseif A1_70 == CALLBACK_REASON.NO_CAUTION or A1_70 == CALLBACK_REASON.NO_INDICATION then
    if _begin_combat or _detected_on_sensor then
      return
    end
    if 180 > Time:getGameWorldTimeStamp() - _recast_time_ep10_09015 then
      return
    end
    Fn_captionView("ep10_09015")
    _recast_time_ep10_09015 = Time:getGameWorldTimeStamp()
  elseif A1_70 == CALLBACK_REASON.DIED then
    if _begin_combat then
      _begin_combat = false
    end
    Player:setSituation(Player.kSituation_Normal, true, 0, true, false)
    if A0_69 == _soldierName[6] and _soldierInstance[7].status <= 2 then
      _soldierInstance[7]:setCautionLevel(100)
      _soldierInstance[7].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[7] and _soldierInstance[6].status <= 2 then
      _soldierInstance[6]:setCautionLevel(100)
      _soldierInstance[6].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[9] and 2 >= _soldierInstance[10].status then
      _soldierInstance[10]:setCautionLevel(100)
      _soldierInstance[10].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[10] and 2 >= _soldierInstance[9].status then
      _soldierInstance[9]:setCautionLevel(100)
      _soldierInstance[9].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[18] and 2 >= _soldierInstance[19].status then
      _soldierInstance[19]:setCautionLevel(100)
      _soldierInstance[19].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[19] and 2 >= _soldierInstance[18].status then
      _soldierInstance[18]:setCautionLevel(100)
      _soldierInstance[18].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[4] and 2 >= _soldierInstance[14].status then
      _soldierInstance[14]:setCautionLevel(100)
      _soldierInstance[14].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[14] and 2 >= _soldierInstance[4].status then
      _soldierInstance[4]:setCautionLevel(100)
      _soldierInstance[4].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[25] and 2 >= _soldierInstance[26].status then
      _soldierInstance[26]:setCautionLevel(100)
      _soldierInstance[26].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[26] and 2 >= _soldierInstance[25].status then
      _soldierInstance[25]:setCautionLevel(100)
      _soldierInstance[25].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[3] and 2 >= _soldierInstance[17].status then
      _soldierInstance[17]:setCautionLevel(100)
      _soldierInstance[17].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[3] and 2 >= _soldierInstance[21].status then
      _soldierInstance[21]:setCautionLevel(100)
      _soldierInstance[21].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[17] and 2 >= _soldierInstance[3].status then
      _soldierInstance[3]:setCautionLevel(100)
      _soldierInstance[3].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[17] and 2 >= _soldierInstance[21].status then
      _soldierInstance[21]:setCautionLevel(100)
      _soldierInstance[21].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[21] and 2 >= _soldierInstance[3].status then
      _soldierInstance[3]:setCautionLevel(100)
      _soldierInstance[3].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[21] and 2 >= _soldierInstance[17].status then
      _soldierInstance[17]:setCautionLevel(100)
      _soldierInstance[17].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[5] and 2 >= _soldierInstance[22].status then
      _soldierInstance[22]:setCautionLevel(100)
      _soldierInstance[22].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[5] and 2 >= _soldierInstance[23].status then
      _soldierInstance[23]:setCautionLevel(100)
      _soldierInstance[23].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[22] and 2 >= _soldierInstance[5].status then
      _soldierInstance[5]:setCautionLevel(100)
      _soldierInstance[5].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[22] and 2 >= _soldierInstance[23].status then
      _soldierInstance[23]:setCautionLevel(100)
      _soldierInstance[23].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[23] and 2 >= _soldierInstance[5].status then
      _soldierInstance[5]:setCautionLevel(100)
      _soldierInstance[5].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[23] and 2 >= _soldierInstance[22].status then
      _soldierInstance[22]:setCautionLevel(100)
      _soldierInstance[22].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[11] and 2 >= _soldierInstance[12].status then
      _soldierInstance[12]:setCautionLevel(100)
      _soldierInstance[12].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[11] and 2 >= _soldierInstance[13].status then
      _soldierInstance[13]:setCautionLevel(100)
      _soldierInstance[13].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[12] and 2 >= _soldierInstance[11].status then
      _soldierInstance[11]:setCautionLevel(100)
      _soldierInstance[11].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[12] and 2 >= _soldierInstance[13].status then
      _soldierInstance[13]:setCautionLevel(100)
      _soldierInstance[13].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[13] and 2 >= _soldierInstance[11].status then
      _soldierInstance[11]:setCautionLevel(100)
      _soldierInstance[11].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[13] and 2 >= _soldierInstance[12].status then
      _soldierInstance[12]:setCautionLevel(100)
      _soldierInstance[12].status = NPC_STATUS.ALERT
    end
    for _FORV_6_ = 1, #_soldierInstance do
      _soldierInstance[_FORV_6_]:setIndicationEnable(true)
      _soldierInstance[_FORV_6_]:setIndicationRange(18)
    end
    _FOR_[2]:setIndicationRange(2)
  elseif A1_70 == CALLBACK_REASON.BEGIN_COMBAT then
    if A0_69 == _soldierName[6] and _soldierInstance[7].status <= 2 then
      _soldierInstance[7]:setCautionLevel(100)
      _soldierInstance[7].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[7] and _soldierInstance[6].status <= 2 then
      _soldierInstance[6]:setCautionLevel(100)
      _soldierInstance[6].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[9] and 2 >= _soldierInstance[10].status then
      _soldierInstance[10]:setCautionLevel(100)
      _soldierInstance[10].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[10] and 2 >= _soldierInstance[9].status then
      _soldierInstance[9]:setCautionLevel(100)
      _soldierInstance[9].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[18] and 2 >= _soldierInstance[19].status then
      _soldierInstance[19]:setCautionLevel(100)
      _soldierInstance[19].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[19] and 2 >= _soldierInstance[18].status then
      _soldierInstance[18]:setCautionLevel(100)
      _soldierInstance[18].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[4] and 2 >= _soldierInstance[14].status then
      _soldierInstance[14]:setCautionLevel(100)
      _soldierInstance[14].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[14] and 2 >= _soldierInstance[4].status then
      _soldierInstance[4]:setCautionLevel(100)
      _soldierInstance[4].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[25] and 2 >= _soldierInstance[26].status then
      _soldierInstance[26]:setCautionLevel(100)
      _soldierInstance[26].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[26] and 2 >= _soldierInstance[25].status then
      _soldierInstance[25]:setCautionLevel(100)
      _soldierInstance[25].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[3] and 2 >= _soldierInstance[17].status then
      _soldierInstance[17]:setCautionLevel(100)
      _soldierInstance[17].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[3] and 2 >= _soldierInstance[21].status then
      _soldierInstance[21]:setCautionLevel(100)
      _soldierInstance[21].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[17] and 2 >= _soldierInstance[3].status then
      _soldierInstance[3]:setCautionLevel(100)
      _soldierInstance[3].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[17] and 2 >= _soldierInstance[21].status then
      _soldierInstance[21]:setCautionLevel(100)
      _soldierInstance[21].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[21] and 2 >= _soldierInstance[3].status then
      _soldierInstance[3]:setCautionLevel(100)
      _soldierInstance[3].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[21] and 2 >= _soldierInstance[17].status then
      _soldierInstance[17]:setCautionLevel(100)
      _soldierInstance[17].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[5] and 2 >= _soldierInstance[22].status then
      _soldierInstance[22]:setCautionLevel(100)
      _soldierInstance[22].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[5] and 2 >= _soldierInstance[23].status then
      _soldierInstance[23]:setCautionLevel(100)
      _soldierInstance[23].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[22] and 2 >= _soldierInstance[5].status then
      _soldierInstance[5]:setCautionLevel(100)
      _soldierInstance[5].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[22] and 2 >= _soldierInstance[23].status then
      _soldierInstance[23]:setCautionLevel(100)
      _soldierInstance[23].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[23] and 2 >= _soldierInstance[5].status then
      _soldierInstance[5]:setCautionLevel(100)
      _soldierInstance[5].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[23] and 2 >= _soldierInstance[22].status then
      _soldierInstance[22]:setCautionLevel(100)
      _soldierInstance[22].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[11] and 2 >= _soldierInstance[12].status then
      _soldierInstance[12]:setCautionLevel(100)
      _soldierInstance[12].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[11] and 2 >= _soldierInstance[13].status then
      _soldierInstance[13]:setCautionLevel(100)
      _soldierInstance[13].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[12] and 2 >= _soldierInstance[11].status then
      _soldierInstance[11]:setCautionLevel(100)
      _soldierInstance[11].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[12] and 2 >= _soldierInstance[13].status then
      _soldierInstance[13]:setCautionLevel(100)
      _soldierInstance[13].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[13] and 2 >= _soldierInstance[11].status then
      _soldierInstance[11]:setCautionLevel(100)
      _soldierInstance[11].status = NPC_STATUS.ALERT
    elseif A0_69 == _soldierName[13] and 2 >= _soldierInstance[12].status then
      _soldierInstance[12]:setCautionLevel(100)
      _soldierInstance[12].status = NPC_STATUS.ALERT
    end
    Player:setSituation(Player.kSituation_InCombat, true, 0, true, false)
    _begin_combat = true
    if 180 < Time:getGameWorldTimeStamp() - _recast_time_ep10_09008 then
      Fn_captionView("ep10_09008")
      _recast_time_ep10_09008 = Time:getGameWorldTimeStamp()
    end
    for _FORV_6_ = 1, #_soldierInstance do
      _soldierInstance[_FORV_6_]:setIndicationEnable(true)
      _soldierInstance[_FORV_6_]:setIndicationRange(18)
    end
    if A2_71 == false or A2_71 == nil then
      waitSeconds(1.5)
    end
    if _detected_on_sensor then
      return
    end
    if 180 > Time:getGameWorldTimeStamp() - _recast_time_ep10_00120 then
      return
    end
    detectedCaptionView(A0_69, "ep10_00120")
    _recast_time_ep10_00120 = Time:getGameWorldTimeStamp()
  elseif A1_70 == CALLBACK_REASON.COMBAT_TIMEOUT then
    detectedBySoldier(A0_69)
  end
end
function npcGrabRelease(A0_72, A1_73)
  Fn_warpNpc(A0_72, A1_73)
  Fn_setGrabReleaseNpc(A0_72)
  Fn_playMotionNpc(A0_72, "stay", false)
end
function isInEyeSight(A0_74, A1_75, A2_76, A3_77)
  local L4_78, L5_79, L6_80, L7_81
  if A1_75 == nil then
    A1_75 = 40
  end
  if A3_77 == nil then
    A3_77 = true
  end
  if A2_76 == nil then
    A2_76 = 0.6
  end
  L4_78 = false
  L5_79 = Fn_isInSightTarget
  L6_80 = A0_74
  L7_81 = A2_76
  L5_79 = L5_79(L6_80, L7_81)
  if L5_79 == true then
    if A3_77 == true then
      L5_79 = Fn_getPcPosRot
      L6_80 = L5_79()
      L7_81 = L5_79.y
      L7_81 = L7_81 + 1.5
      L5_79.y = L7_81
      L7_81 = Query
      L7_81 = L7_81.setEyeSightTransform
      L7_81(L7_81, L5_79, L6_80)
      L7_81 = Query
      L7_81 = L7_81.setEyeSightAngle
      L7_81(L7_81, Deg2Rad(360))
      L7_81 = Query
      L7_81 = L7_81.setEyeSightRange
      L7_81(L7_81, A1_75)
      L7_81 = A0_74.getWorldPos
      L7_81 = L7_81(A0_74)
      if Query:checkEyeSightSphere(L7_81, 0.1) == true and Query:raycastEyeSight(L7_81) == nil then
        L4_78 = true
      end
    else
      L4_78 = true
    end
  end
  return L4_78
end
function setCraneShipReleasePoint(A0_82)
  local L1_83
  if A0_82 then
    L1_83 = Fn_naviSet
    L1_83(findGameObject2("Node", "locator2_navi_05"))
  end
end
function ep10GetLocatorPosRot(A0_84)
  local L1_85, L2_86, L3_87
  L1_85 = print
  L2_86 = A0_84
  L1_85(L2_86)
  L1_85 = Fn_findNpcPuppet
  L2_86 = A0_84
  L1_85 = L1_85(L2_86)
  L3_87 = L1_85
  L2_86 = L1_85.getWorldTransform
  L3_87 = L2_86(L3_87)
  return L2_86, L3_87
end
typedef_MultiNaviClass = {}
function typedef_MultiNaviClass.new(A0_88, A1_89, A2_90)
  local L3_91
  L3_91 = {}
  L3_91.NaviDistance = 4
  L3_91.Pos = Vector(0, 0, 0)
  if A1_89 == nil or A2_90 == nil then
    L3_91.obj = HUD:mnaviNew({name = A0_88})
  else
    L3_91.obj = HUD:mnaviNew({
      name = A0_88,
      PochFadeLen0 = A1_89,
      PochFadeLen100 = A2_90
    })
  end
  function L3_91.SetActive(A0_92)
    L3_91.obj:setActive(A0_92)
  end
  function L3_91.GetActive()
    return L3_91.obj:getActive()
  end
  function L3_91.Kill()
    L3_91.obj:del(false)
  end
  function L3_91.SetPos(A0_93)
    L3_91.Pos = A0_93
    L3_91.obj:setTrgPos(A0_93)
  end
  function L3_91.GetPos(A0_94)
    return (ep10GetLocatorPosRot(A0_94))
  end
  function L3_91.SetNaviTarget(A0_95)
    L3_91.obj:setTarget(A0_95)
  end
  function L3_91.SetNaviDistance(A0_96)
    local L1_97
    L3_91.NaviDistance = A0_96
  end
  function L3_91.CheckSearch()
    local L0_98
    L0_98 = false
    if L3_91.NaviDistance > Fn_getDistanceToPlayer(L3_91.Pos) then
      L0_98 = true
    end
    return L0_98
  end
  return L3_91
end
function breakdownSE(A0_99, A1_100)
  if A0_99 == "play" then
    if _breakdown_sound[A1_100] == nil then
      print("\230\149\133\233\154\156\231\174\135\230\137\128\227\129\139\227\130\137\232\129\158\227\129\147\227\129\136\227\130\139SE\227\129\174\229\134\141\231\148\159\233\150\139\229\167\139 breakdownNumber\239\188\154" .. A1_100)
      _breakdown_sound[A1_100] = Sound:playSEHandle("ep10_ship_smoke", 1, "", _breakdown_effect[A1_100])
    end
  elseif A0_99 == "stop" and _breakdown_sound[A1_100] ~= nil then
    print("\230\149\133\233\154\156\231\174\135\230\137\128\227\129\139\227\130\137\232\129\158\227\129\147\227\129\136\227\130\139SE\227\129\174\229\134\141\231\148\159\231\181\130\228\186\134 breakdownNumber\239\188\154" .. A1_100)
    Sound:stopSEHandle(_breakdown_sound[A1_100])
    _breakdown_sound[A1_100] = nil
  end
end
function pcspheresensor2_breakdown_effect_01_OnEnter()
  breakdownSE("play", 1)
end
function pcspheresensor2_breakdown_effect_01_OnLeave()
  breakdownSE("stop", 1)
end
function pcspheresensor2_breakdown_effect_02_OnEnter()
  breakdownSE("play", 2)
end
function pcspheresensor2_breakdown_effect_02_OnLeave()
  breakdownSE("stop", 2)
end
function pcspheresensor2_breakdown_effect_03_OnEnter()
  breakdownSE("play", 3)
end
function pcspheresensor2_breakdown_effect_03_OnLeave()
  breakdownSE("stop", 3)
end
function pcspheresensor2_breakdown_effect_04_OnEnter()
  breakdownSE("play", 4)
end
function pcspheresensor2_breakdown_effect_04_OnLeave()
  breakdownSE("stop", 4)
end
function pcspheresensor2_breakdown_effect_05_OnEnter()
  breakdownSE("play", 5)
end
function pcspheresensor2_breakdown_effect_05_OnLeave()
  breakdownSE("stop", 5)
end
function pcspheresensor2_breakdown_effect_06_OnEnter()
  breakdownSE("play", 6)
end
function pcspheresensor2_breakdown_effect_06_OnLeave()
  breakdownSE("stop", 6)
end
function pcspheresensor2_breakdown_effect_07_OnEnter()
  breakdownSE("play", 7)
end
function pcspheresensor2_breakdown_effect_07_OnLeave()
  breakdownSE("stop", 7)
end
function pcspheresensor2_breakdown_effect_08_OnEnter()
  breakdownSE("play", 8)
end
function pcspheresensor2_breakdown_effect_08_OnLeave()
  breakdownSE("stop", 8)
end
function pcspheresensor2_breakdown_effect_09_OnEnter()
  breakdownSE("play", 9)
end
function pcspheresensor2_breakdown_effect_09_OnLeave()
  breakdownSE("stop", 9)
end
function pcspheresensor2_breakdown_effect_10_OnEnter()
  breakdownSE("play", 10)
end
function pcspheresensor2_breakdown_effect_10_OnLeave()
  breakdownSE("stop", 10)
end
function setVeCreanAreaGroup(A0_101)
  if Fn_findAreaHandle("ve_crane_root") then
    _crane_area_group = Fn_findAreaHandle("ve_crane_root"):getAreaGroup()
    Fn_findAreaHandle("ve_crane_root"):setAreaGroup(A0_101 or "go", true)
  end
end
function returnVeCreanAreaGroup()
  if Fn_findAreaHandle("ve_crane_root") then
    Fn_findAreaHandle("ve_crane_root"):setAreaGroup(_crane_area_group, true)
  end
end
