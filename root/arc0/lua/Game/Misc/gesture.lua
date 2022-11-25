local L1_1
L0_0 = {}
GestureEvent = L0_0
L0_0 = GestureEvent
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6)
  local L5_7
  L5_7 = {}
  L5_7.active = false
  L5_7.node = nil
  L5_7.ofs = Vector(0, 0, 0)
  L5_7.npcs = {}
  L5_7.npc_hdl = nil
  L5_7.npc_task = nil
  L5_7.result = false
  L5_7.interaction = false
  L5_7.farewell = false
  L5_7.mob = {
    name = nil,
    reply = -1,
    phase = "",
    tbl = {}
  }
  L5_7.text_table = {}
  L5_7.guide_txt = A0_2
  L5_7.cancelFunc = A1_3
  L5_7.breakFunc = A2_4
  L5_7.npcFunc = A3_5
  L5_7.npcFunc2 = A4_6
  L5_7.known_cnt = 0
  L5_7.unknown_cnt = 0
  L5_7.known_kdemo_cnt = 0
  L5_7.unknown_kdemo_cnt = 0
  L5_7.reply_caption_skip = false
  L5_7.overrideYesFunc = nil
  L5_7.overrideNoFunc = nil
  L5_7.asking = true
  L5_7.inputprohibit = false
  GestureEvent._installMethods(L5_7)
  return L5_7
end
L0_0.create = L1_1
L0_0 = GestureEvent
function L1_1(A0_8, A1_9, A2_10, A3_11)
  if not GestureEvent._isValid(A0_8) then
    return false
  end
  A0_8.node = A1_9 and A1_9 or A0_8.node
  A0_8.ofs = A2_10 and A2_10 or A0_8.ofs
  A0_8.opt = A3_11 and A3_11 or A0_8.opt
  if A0_8.active then
    if A0_8.node then
      Mob:setNavigationTarget(A0_8.node, A0_8.ofs)
      Mob:enableNavigationSituation(true, A0_8.opt)
    else
      A0_8.opt.pointing = false
      Mob:enableNavigationSituation(true, A0_8.opt)
    end
  end
end
L0_0.setNaviTarget = L1_1
L0_0 = GestureEvent
function L1_1(A0_12, A1_13)
  local L2_14
  L2_14 = GestureEvent
  L2_14 = L2_14._isValid
  L2_14 = L2_14(A0_12)
  if not L2_14 then
    L2_14 = false
    return L2_14
  end
  L2_14 = A1_13 and A1_13 or A0_12.npcs
  if type(L2_14) ~= "table" then
    L2_14 = {L2_14}
  end
  A0_12.npcs = L2_14
  if A0_12.active then
    Player:setGestureEventNpcNodes(A0_12.npcs)
  end
end
L0_0.setNpc = L1_1
L0_0 = GestureEvent
function L1_1(A0_15, A1_16)
  if not GestureEvent._isValid(A0_15) then
    return false
  end
  A0_15.overrideYesFunc = A1_16
end
L0_0.setOverrideYesFunc = L1_1
L0_0 = GestureEvent
function L1_1(A0_17, A1_18)
  if not GestureEvent._isValid(A0_17) then
    return false
  end
  A0_17.overrideNoFunc = A1_18
end
L0_0.setOverrideNoFunc = L1_1
L0_0 = GestureEvent
function L1_1(A0_19, A1_20)
  if not GestureEvent._isValid(A0_19) then
    return false
  end
  A0_19.asking = A1_20
  if A0_19.active then
    A0_19:_setAnim(A1_20)
  end
end
L0_0.setAsking = L1_1
L0_0 = GestureEvent
function L1_1(A0_21, A1_22)
  if not GestureEvent._isValid(A0_21) then
    return false
  end
  A0_21.text_table = A0_21:_copyTable(A1_22 or {})
end
L0_0.setMobText = L1_1
L0_0 = GestureEvent
function L1_1(A0_23)
  if not GestureEvent._isValid(A0_23) then
    return false
  end
  return A0_23.interaction
end
L0_0.isInteraction = L1_1
L0_0 = GestureEvent
function L1_1(A0_24)
  if not GestureEvent._isValid(A0_24) then
    return false
  end
  return A0_24.known_cnt
end
L0_0.getKnownCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_25)
  if not GestureEvent._isValid(A0_25) then
    return false
  end
  return A0_25.unknown_cnt
end
L0_0.getUnknownCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_26)
  if not GestureEvent._isValid(A0_26) then
    return false
  end
  return A0_26.known_kdemo_cnt
end
L0_0.getKnownKaiwaDemoCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_27)
  if not GestureEvent._isValid(A0_27) then
    return false
  end
  return A0_27.unknown_kdemo_cnt
end
L0_0.getUnknownKaiwaDemoCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_28)
  if not GestureEvent._isValid(A0_28) then
    return false
  end
  return A0_28.unknown_cnt + A0_28.known_cnt
end
L0_0.getTotalCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_29)
  if not GestureEvent._isValid(A0_29) then
    return false
  end
  return A0_29.unknown_kdemo_cnt + A0_29.known_kdemo_cnt
end
L0_0.getTotalKaiwaDemoCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_30)
  if not GestureEvent._isValid(A0_30) then
    return false
  end
  A0_30.known_cnt = 0
  A0_30.unknown_cnt = 0
  A0_30.known_kdemo_cnt = 0
  A0_30.unknown_kdemo_cnt = 0
end
L0_0.resetCount = L1_1
L0_0 = GestureEvent
function L1_1(A0_31)
  if not GestureEvent._isValid(A0_31) then
    return false
  end
  if A0_31.mob.phase == "reply" and A0_31.mob.reply == 1 then
    return true
  end
  return false
end
L0_0.isInform = L1_1
L0_0 = GestureEvent
function L1_1(A0_32)
  local L1_33, L2_34
  L1_33 = GestureEvent
  L1_33 = L1_33._isValid
  L2_34 = A0_32
  L1_33 = L1_33(L2_34)
  if not L1_33 then
    L1_33 = false
    return L1_33
  end
  function L1_33(A0_35)
    A0_32:_gestureEventCallback(A0_35)
  end
  function L2_34(A0_36)
    A0_32:_navigationCallback(A0_36)
  end
  A0_32.active = true
  Player:setGestureEventMode(true, L1_33)
  Player:setGestureEventNpcNodes(A0_32.npcs)
  A0_32:_setAnim(A0_32.asking)
  if A0_32.node then
    Mob:setNavigationTarget(A0_32.node, A0_32.ofs)
    Mob:enableNavigationSituation(true, A0_32.opt)
  else
    A0_32.opt.pointing = false
    Mob:enableNavigationSituation(true, A0_32.opt)
  end
  Mob:registerNavigationCallback(L2_34)
end
L0_0.run = L1_1
L0_0 = GestureEvent
function L1_1(A0_37)
  if not GestureEvent._isValid(A0_37) then
    return false
  end
  return A0_37.active
end
L0_0.isRunning = L1_1
L0_0 = GestureEvent
function L1_1(A0_38)
  if not GestureEvent._isValid(A0_38) then
    return false
  end
  A0_38.active = false
  Player:setGestureEventMode(false)
  Player:setGestureEventNpcNodes()
  Mob:enableNavigationSituation(false)
  Mob:registerNavigationCallback()
end
L0_0.stop = L1_1
L0_0 = GestureEvent
function L1_1(A0_39)
  if not GestureEvent._isValid(A0_39) then
    return false
  end
  return A0_39.mob.name
end
L0_0.getInteractionMobType = L1_1
L0_0 = GestureEvent
function L1_1(A0_40, A1_41)
  if A1_41 then
    A0_40.inputprohibit = true
  else
    A0_40.inputprohibit = false
  end
end
L0_0.setInputProhibit = L1_1
L0_0 = GestureEvent
function L1_1(A0_42)
  local L1_43
  if A0_42 == nil then
    L1_43 = false
    return L1_43
  end
  L1_43 = true
  return L1_43
end
L0_0._isValid = L1_1
L0_0 = GestureEvent
function L1_1(A0_44)
  local L1_45, L2_46, L3_47, L4_48, L5_49
  for L4_48, L5_49 in L1_45(L2_46) do
    if type(L5_49) == "function" then
      A0_44[L4_48] = L5_49
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = GestureEvent
function L1_1(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55, L6_56, L7_57
  L2_52 = {}
  for L6_56, L7_57 in L3_53(L4_54) do
    if type(L7_57) == "table" then
      L2_52[L6_56] = A0_50:_copyTable(L7_57)
    else
      L2_52[L6_56] = L7_57
    end
  end
  return L2_52
end
L0_0._copyTable = L1_1
L0_0 = GestureEvent
function L1_1(A0_58, A1_59)
  if GameDatabase:get(ggd.GlobalSystemFlags__ActionDialogActive) == false then
    A1_59.active = true
  end
end
L0_0._isDialogActive = L1_1
L0_0 = GestureEvent
function L1_1(A0_60, A1_61)
  if Player:isGravityControlMode() or Player:getNumPeopleAround() == 0 or Player:getAction() == Player.kAction_Jump or Player:getAction() == Player.kAction_KickCombo or Player:getAction() == Player.kAction_DmgDown or GameDatabase:get(ggd.GlobalSystemFlags__ActionDialogActive) == true or A0_60.active == false or A0_60.inputprohibit == true then
    A1_61.cancel = true
  end
end
L0_0._cancelGesture = L1_1
L0_0 = GestureEvent
function L1_1(A0_62)
  local L1_63, L2_64
  L1_63 = {}
  L1_63.active = false
  L1_63.cancel = false
  L2_64 = {
    {
      btn = Pad.kButtonRL,
      text = A0_62.guide_txt or "ui_event_guide_01"
    }
  }
  while A0_62.npc_task do
    if not A0_62.npc_task:isRunning() then
      A0_62.npc_task = nil
      break
    end
    wait()
  end
  A0_62:_isDialogActive(L1_63)
  while L1_63.active ~= true do
    A0_62:_cancelGesture(L1_63)
    if L1_63.cancel then
      return
    else
      A0_62:_isDialogActive(L1_63)
    end
    wait()
  end
  HUD:openGesture(L2_64)
  while true do
    A0_62:_cancelGesture(L1_63)
    if HUD:updateGesture(L1_63.cancel) == HUD.kGestureDecide and L1_63.cancel == false then
      if A0_62.mob.tbl.listen and A0_62.mob.tbl.listen.text then
        Fn_captionView(A0_62.mob.tbl.listen.text)
      end
      if not A0_62.breakFunc or A0_62.breakFunc() ~= true then
        if A0_62.cancelFunc and A0_62.cancelFunc() == true then
        else
          Player:setGestureEventResult(Player.kGestureEvtRes_StartAsking, HUD:getResultGesture())
          break
        end
      end
    elseif HUD:updateGesture(L1_63.cancel) == HUD.kGestureOut then
      Player:setGestureEventResult(Player.kGestureEvtRes_Canceled)
      break
    end
    wait()
  end
end
L0_0._showGesture = L1_1
L0_0 = GestureEvent
function L1_1(A0_65, A1_66)
  if A1_66 then
    Player:setGestureEventAnim(Player.kGestureEvt_Hello, "lively_action_5")
  else
    Player:setGestureEventAnim(Player.kGestureEvt_Hello, "lively_action_1", 0.8)
  end
end
L0_0._setAnim = L1_1
L0_0 = GestureEvent
function L1_1(A0_67, A1_68)
  print("===================================")
  print(" - playr side - ")
  print("phase     : ", A1_68.phase)
  if A1_68.phase == Player.kGestureEvt_Roaming then
    invokeTask(function()
      A0_67:_showGesture()
    end)
  elseif A1_68.phase == Player.kGestureEvt_Hello then
    if A1_68.targetType == Player.kGestureEvtTgt_Npc then
      A0_67.npc_hdl = A1_68.npc
      if A0_67.npcFunc2 and A0_67.npc_task == nil then
        A0_67.npc_task = invokeTask(function()
          A0_67.npcFunc2(A0_67.npc_hdl)
        end)
      end
    end
  elseif A1_68.phase == Player.kGestureEvt_GoodBye then
    if A1_68.targetType == Player.kGestureEvtTgt_Npc and A0_67.npcFunc and A0_67.npc_task == nil then
      A0_67.npc_task = invokeTask(function()
        A0_67.npcFunc(A0_67.npc_hdl)
      end)
    end
  elseif A1_68.phase == Player.kGestureEvt_Failed then
    print("\227\131\151\227\131\172\227\130\164\227\131\164\227\129\174\228\186\139\230\131\133\227\129\171\227\130\136\227\130\138\229\164\177\230\149\151")
  end
end
L0_0._gestureEventCallback = L1_1
L0_0 = GestureEvent
function L1_1(A0_69, A1_70)
  local L2_71, L3_72, L4_73, L5_74, L6_75, L7_76
  L2_71 = print
  L3_72 = "==================================="
  L2_71(L3_72)
  L2_71 = print
  L3_72 = " - mob side - "
  L2_71(L3_72)
  L2_71 = print
  L3_72 = "className is     : "
  L4_73 = A1_70.className
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "phaseName is     : "
  L4_73 = A1_70.phaseName
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "seq is           : "
  L4_73 = A1_70.seq
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "replyId is       : "
  L4_73 = A1_70.replyId
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "pawnId is        : "
  L4_73 = A1_70.pawnId
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "bodyTexIdx is    : "
  L4_73 = A1_70.bodyTexIdx
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "faceTexIdx is    : "
  L4_73 = A1_70.faceTexIdx
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "hairIdx is       : "
  L4_73 = A1_70.hairIdx
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "stdAppearance is : "
  L4_73 = A1_70.stdAppearance
  L2_71(L3_72, L4_73)
  L2_71 = print
  L3_72 = "asSwitchIn is    : "
  L4_73 = A1_70.asSwitchIn
  L2_71(L3_72, L4_73)
  L2_71 = A1_70.className
  L3_72 = A1_70.phaseName
  L4_73 = A1_70.replyId
  L5_74 = A1_70.stdAppearance
  L6_75, L7_76 = nil, nil
  A0_69.mob.phase = L3_72
  if L2_71 ~= nil and L2_71 ~= "" then
    if L3_72 == "notice" then
      if A0_69.overrideYesFunc and A0_69.overrideYesFunc(A1_70) then
        Mob:overrideNavigationAnswer(1)
        L4_73 = 1
        print("override replyId 1")
      end
      if A0_69.overrideNoFunc and A0_69.overrideNoFunc(A1_70) then
        Mob:overrideNavigationAnswer(0)
        L4_73 = 0
        print("override replyId 0")
      end
      A0_69.interaction = true
      A0_69.mob.name = L2_71
      A0_69.mob.reply = L4_73
      A0_69.mob.def = L5_74
      A0_69.mob.tbl = A0_69.text_table[L2_71] or A0_69.text_table.other[math.random(1, #A0_69.text_table.other)]
      if L2_71 == "gri01" then
        print("override stdAppearance ", L2_71)
        A0_69.mob.def = true
      end
      if L4_73 == 1 then
        A0_69.result = true
      end
    elseif L3_72 == "listen" then
    elseif L3_72 == "reply" then
      if A0_69.mob.reply == 0 then
        if A0_69.mob.def and A0_69.mob.tbl.unknown_kaiwa then
          invokeTask(Fn_kaiwaDemoView, A0_69.mob.tbl.unknown_kaiwa)
          A0_69.mob.tbl.unknown_kaiwa = nil
          A0_69.unknown_kdemo_cnt = A0_69.unknown_kdemo_cnt + 1
          if A0_69.mob.tbl.reply_caption_skip then
            A0_69.reply_caption_skip = true
          end
        end
      elseif A0_69.mob.reply == 1 and A0_69.mob.def and A0_69.mob.tbl.known_kaiwa then
        invokeTask(Fn_kaiwaDemoView, A0_69.mob.tbl.known_kaiwa)
        A0_69.mob.tbl.known_kaiwa = nil
        A0_69.known_kdemo_cnt = A0_69.known_kdemo_cnt + 1
        if A0_69.mob.tbl.reply_caption_skip then
          A0_69.reply_caption_skip = true
        end
      end
    elseif L3_72 == "farewell" then
      if A0_69.reply_caption_skip == false then
        if A0_69.mob.reply == 0 then
          L6_75 = A0_69.mob.tbl.reply_no.text
          L7_76 = A0_69.mob.tbl.reply_no.time
          A0_69.unknown_cnt = A0_69.unknown_cnt + 1
        elseif A0_69.mob.reply == 1 then
          L6_75 = A0_69.mob.tbl.reply_yes.text
          L7_76 = A0_69.mob.tbl.reply_yes.time
          A0_69.known_cnt = A0_69.known_cnt + 1
        end
      end
      A0_69.reply_caption_skip = false
      A0_69.farewell = true
    elseif L3_72 == "failed" then
      L6_75, L7_76 = nil, nil
      A0_69.farewell = false
      A0_69.interaction = false
    end
    if L6_75 and L7_76 then
      invokeTask(function()
        HUD:captionBegin(L6_75, L7_76)
        waitSeconds(L7_76)
        if A0_69.farewell then
          A0_69.farewell = false
          A0_69.interaction = false
        end
      end)
    elseif A0_69.farewell then
      A0_69.farewell = false
      A0_69.interaction = false
    end
  else
    print("className is None")
  end
end
L0_0._navigationCallback = L1_1
