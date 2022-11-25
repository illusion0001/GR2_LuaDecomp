local L1_1
_NPC_SIGHT_DEG = 40
_NPC_SIGHT_LEN = 20
_NPC_CAUTION_INC = 1
_NPC_CAUTION_DEC = 0.5
_NPC_INDICATION_INC = 0.3
_NPC_INDICATION_DEC = 0.5
_NPC_INDICATION_LEN = 7
FAR_DIST = 30
L0_0 = {}
L0_0.anim_walk_speed = 1
L0_0.runLength = 99999
L0_0.arrivedLength = 0
L0_0.navimesh = true
L0_0.noTurn = true
L0_0.recast = true
L0_0.loop = false
_move_option_thief_normal = L0_0
L0_0 = {}
_cap_task = L0_0
function L0_0(A0_2, A1_3)
  local L2_4
  L2_4 = _processingPcReset
  if L2_4 then
    return
  end
  L2_4 = CALLBACK_REASON
  L2_4 = L2_4.DAMAGED
  if A1_3 ~= L2_4 then
    _dameged_out = false
  end
  L2_4 = CALLBACK_REASON
  L2_4 = L2_4.DAMAGED
  if A1_3 == L2_4 then
    L2_4 = print
    L2_4("\230\148\187\230\146\131\227\129\134\227\129\145\227\129\166\227\131\170\227\131\136\227\131\169\227\130\164")
    _dameged_out = true
    L2_4 = detectedByThief
    L2_4()
  else
    L2_4 = CALLBACK_REASON
    L2_4 = L2_4.INDICATION_OVERFLOW
    if A1_3 == L2_4 then
      L2_4 = print
      L2_4("\230\176\151\233\133\141\229\186\166\227\129\140MAX\227\129\171\227\129\170\227\129\163\227\129\159\239\188\129")
    else
      L2_4 = CALLBACK_REASON
      L2_4 = L2_4.IS_INSIGHT
      if A1_3 == L2_4 then
        L2_4 = print
        L2_4("\231\155\174\231\183\154\227\129\140\229\144\136\227\129\163\227\129\159")
        L2_4 = _safe_cap_task
        if L2_4 ~= nil then
          L2_4 = _safe_cap_task
          L2_4 = L2_4.abort
          L2_4(L2_4)
        end
        L2_4 = _insight_txt_num
        L2_4 = L2_4 + 1
        _insight_txt_num = L2_4
        L2_4 = _insight_txt_num
        if L2_4 > 2 then
          _insight_txt_num = 1
        end
        L2_4 = {"ep05_02025", "ep05_02026"}
        _thief_voice_hdl = Sound:playSEHandle("m12_906a", 1, "", Fn_findNpcPuppet(_npc_thief_01))
        Fn_captionView(L2_4[_insight_txt_num])
      else
        L2_4 = CALLBACK_REASON
        L2_4 = L2_4.CAUTION_OVERFLOW
        if A1_3 == L2_4 then
          L2_4 = print
          L2_4("\232\173\166\230\136\146\229\186\166\227\129\140\230\156\128\229\164\167\227\129\171\227\129\170\227\129\163\227\129\166\227\131\170\227\131\136\227\131\169\227\130\164")
          L2_4 = detectedByThief
          L2_4()
        else
          L2_4 = CALLBACK_REASON
          L2_4 = L2_4.NO_CAUTION
          if A1_3 == L2_4 then
            L2_4 = print
            L2_4("\232\173\166\230\136\146\229\186\166\227\129\140\230\156\128\229\176\145\227\129\171\227\129\170\227\129\163\227\129\166\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179")
            L2_4 = _safe_txt_num
            L2_4 = L2_4 + 1
            _safe_txt_num = L2_4
            L2_4 = _safe_txt_num
            if L2_4 > 2 then
              _safe_txt_num = 1
            end
            L2_4 = {
              {thief = "ep05_02027", kit = "ep05_02028"},
              {thief = "ep05_02029", kit = "ep05_02030"}
            }
            _safe_cap_task = invokeTask(function()
              Sound:stopSEHandle(_thief_voice_hdl)
              _thief_voice_hdl = Sound:playSEHandle("m12_905c", 1, "", Fn_findNpcPuppet(_npc_thief_01))
              Fn_captionViewWait(L2_4[_safe_txt_num].thief)
              Fn_captionView(L2_4[_safe_txt_num].kit)
            end)
          else
          end
        end
      end
    end
  end
end
thiefAction = L0_0
function L0_0()
  _cap_task[1] = invokeTask(function()
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Sound:stopSEHandle(_kit_voice_hdl)
      _kit_voice_hdl = Sound:playSEHandle("pc1_076", 0.6, "", nil)
      Fn_captionViewWait("ep05_02003", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02004", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02005", 5)
    end
  end)
end
cap01 = L0_0
function L0_0()
  waitSeconds(5)
  _cap_task[2] = invokeTask(function()
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Sound:stopSEHandle(_kit_voice_hdl)
      _kit_voice_hdl = Sound:playSEHandle("pc1_075", 0.6, "", nil)
      Fn_captionViewWait("ep05_02006", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02007", 5)
    end
  end)
end
cap02 = L0_0
function L0_0()
  waitSeconds(1)
  _cap_task[3] = invokeTask(function()
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02008", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02009", 5)
    end
  end)
end
cap03 = L0_0
function L0_0()
  waitSeconds(1)
  _cap_task[4] = invokeTask(function()
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Sound:stopSEHandle(_kit_voice_hdl)
      _kit_voice_hdl = Sound:playSEHandle("pc1_077", 0.6, "", nil)
      Fn_captionViewWait("ep05_02010", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02011", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02012", 5)
    end
  end)
end
cap04 = L0_0
function L0_0()
  waitSeconds(1)
  _cap_task[5] = invokeTask(function()
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Sound:stopSEHandle(_kit_voice_hdl)
      _kit_voice_hdl = Sound:playSEHandle("pc1_069", 0.6, "", nil)
      Fn_captionViewWait("ep05_02013", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02014", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02015", 5)
    end
    if reason == CALLBACK_REASON.DAMAGED or reason == CALLBACK_REASON.IS_INSIGHT or reason == CALLBACK_REASON.CAUTION_OVERFLOW or reason == CALLBACK_REASON.NO_CAUTION then
    else
      Fn_captionViewWait("ep05_02016", 5)
    end
  end)
end
cap05 = L0_0
