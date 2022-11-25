dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
_processingPcReset = false
_dameged_out = false
_thief_voice_hdl = nil
_kit_voice_hdl = nil
_beginMove = false
_move_sequence_task = nil
_thief_navi_task = nil
_safe_cap_task = nil
_npc_motion_task = {}
_npc_motion_tbl = {
  {
    name = "npcgen2_man32_01",
    motion = "stay_02"
  },
  {
    name = "npcgen2_chi11_01",
    motion = "talk_laugh_00"
  },
  {
    name = "npcgen2_wom18_01",
    motion = "talk_00"
  },
  {
    name = "npcgen2_man32_02",
    motion = "talk_angry_01"
  },
  {
    name = "npcgen2_man33_01",
    motion = "talk_01"
  },
  {
    name = "npcgen2_man36_01",
    motion = "talk_sad_00"
  },
  {
    name = "npcgen2_wom17_02",
    motion = "talk_01"
  }
}
_puppet_tbl = {}
_hdl_exist_cnt = 0
_name_tbl = {}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_c_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_c_01")
  chara_table = {
    {
      name = "npcgen2_wom17_01",
      type = "wom17",
      node = "locator2_wom17_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_thief_01",
      type = "thug08",
      node = "locator2_thief_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_man33_02",
      type = "man33",
      node = "locator2_man33_02",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_man32_01",
      type = "man32",
      node = "locator2_man32_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_chi11_01",
      type = "chi11",
      node = "locator2_chi11_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_wom18_01",
      type = "wom18",
      node = "locator2_wom18_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_man32_02",
      type = "man32",
      node = "locator2_man32_02",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_man33_01",
      type = "man33",
      node = "locator2_man33_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_chi11_02",
      type = "chi11",
      node = "locator2_chi11_02",
      attach = true,
      reset = false,
      anim_name = "sit_floor_02"
    },
    {
      name = "npcgen2_chi12_01",
      type = "chi12",
      node = "locator2_chi12_01",
      attach = true,
      reset = false,
      anim_name = "sit_floor_01"
    },
    {
      name = "npcgen2_man36_01",
      type = "man36",
      node = "locator2_man36_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_wom17_02",
      type = "wom17",
      node = "locator2_wom17_02",
      attach = true,
      reset = false
    }
  }
  Fn_setupNpc(chara_table)
  for _FORV_3_, _FORV_4_ in pairs(chara_table) do
    _name_tbl[_FORV_4_.name] = _FORV_4_.name
  end
  _npc_thief_01 = "npcgen2_thief_01"
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = print
  L0_0(L1_1)
  L0_0 = Fn_setCatWarp
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L0_0(L1_1)
  L0_0 = Fn_setCatWarpCheckPoint
  L0_0(L1_1)
  L0_0 = Fn_setBgmPoint
  L0_0(L1_1, L2_2)
  L0_0 = Mv_viewObjWait
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L0_0 = L1_1
  while true do
    for L4_4, L5_5 in L1_1(L2_2) do
      _puppet_tbl[L5_5] = Fn_findNpcPuppet(L5_5)
      print("val = ", L5_5)
      if _puppet_tbl[L5_5] ~= nil then
        _hdl_exist_cnt = _hdl_exist_cnt + 1
      end
    end
    L4_4 = chara_table
    L4_4 = #L4_4
    L1_1(L2_2, L3_3, L4_4)
    if L1_1 ~= L2_2 then
      _hdl_exist_cnt = 0
      L1_1()
    end
  end
  L1_1()
  L1_1()
  L1_1(L2_2)
  L1_1(L2_2)
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  for L4_4 = 1, 5 do
    L5_5 = _cap_task
    L5_5[L4_4] = nil
  end
  L1_1()
  L4_4 = _npc_thief_01
  L5_5 = L3_3(L4_4)
  L1_1(L2_2, L3_3, L4_4, L5_5, L3_3(L4_4))
  L3_3()
  L3_3()
  L4_4 = L2_2
  L4_4 = L1_1
  L3_3()
  L3_3()
  L3_3()
  L3_3()
end
function Finalize()
  Sound:stopSEHandle(_thief_voice_hdl)
  Sound:stopSEHandle(_kit_voice_hdl)
end
function npcInit_thief01()
  local L0_6, L1_7
  L0_6 = print
  L1_7 = "\226\152\133f:npcInit_thief01\239\188\129\239\188\129\239\188\129"
  L0_6(L1_7)
  L0_6 = _task_npc_thief_01
  if L0_6 ~= nil then
    L0_6 = _task_npc_thief_01
    L1_7 = L0_6
    L0_6 = L0_6.taskAbort
    L0_6(L1_7)
    _task_npc_thief_01 = nil
    L0_6 = print
    L1_7 = "_task_npc_thief_01:taskAbort!!!!"
    L0_6(L1_7)
  end
  L0_6 = {L1_7}
  L1_7 = {}
  L1_7.pos = "locator2_thief_move_pos_02_a"
  L1_7.opt = {arrivedLength = 0}
  L1_7 = PerceivableNpc
  L1_7 = L1_7.new
  L1_7 = L1_7(_npc_thief_01)
  _task_npc_thief_01 = L1_7
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setPosList
  L1_7(L1_7, L0_6)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setMoveOption
  L1_7(L1_7, _move_option_thief_normal)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setSightParam
  L1_7(L1_7, _NPC_SIGHT_DEG, _NPC_SIGHT_LEN)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setCautionCoefficient
  L1_7(L1_7, _NPC_CAUTION_INC, _NPC_CAUTION_DEC)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setIndicationCoefficient
  L1_7(L1_7, _NPC_INDICATION_INC, _NPC_INDICATION_DEC)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setIndicationRange
  L1_7(L1_7, _NPC_INDICATION_LEN)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setOnChangeState
  L1_7(L1_7, thiefAction)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setPerceiveEachOther
  L1_7(L1_7, true)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setCombatReady
  L1_7(L1_7, false)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setChaseMode
  L1_7(L1_7, false)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setLoop
  L1_7(L1_7, false)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setChangeRouteImmediately
  L1_7(L1_7, false)
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.setStayMotion
  L1_7(L1_7, "lookaround")
  L1_7 = _task_npc_thief_01
  L1_7 = L1_7.action
  L1_7(L1_7)
  L1_7 = {
    _task_npc_thief_01
  }
  CautionLevel.setNpc(L1_7)
end
function pccubesensor2_b_02_OnEnter()
  local L0_8, L1_9
  _beginMove = true
end
function pccubesensor2_b_02_OnLeave()
  local L0_10, L1_11
end
function pccubesensor2_catwarp_warning_c_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    Fn_captionViewWait("ep05_09000")
  end)
end
function pccubesensor2_catwarp_area_c_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function missingByThief()
  if _processingPcReset then
    return
  end
  print("\232\166\139\229\164\177\227\129\163\227\129\166\227\131\170\227\131\136\227\131\169\227\130\164\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129")
  _processingPcReset = true
  Fn_sendEventComSb("setMissingRetryFlag", false)
  invokeTask(function()
    local L0_12, L1_13
    L0_12 = Mv_safeTaskAbort
    L1_13 = _move_sequence_task
    L0_12(L1_13)
    L0_12 = Mv_safeTaskAbort
    L1_13 = _safe_cap_task
    L0_12(L1_13)
    L0_12 = Player
    L1_13 = L0_12
    L0_12 = L0_12.setStay
    L0_12(L1_13, true)
    L0_12 = Sound
    L1_13 = L0_12
    L0_12 = L0_12.playSEHandle
    L0_12 = L0_12(L1_13, "pc1_072", 1, "", nil)
    _kit_voice_hdl = L0_12
    L0_12 = Fn_captionView
    L1_13 = "ep05_02001"
    L0_12(L1_13)
    L0_12 = waitSeconds
    L1_13 = 2
    L0_12(L1_13)
    L0_12 = Fn_blackout
    L0_12()
    L0_12 = Fn_sendEventComSb
    L1_13 = "changeNearDistToAfter"
    L0_12(L1_13, false)
    L0_12 = Fn_sendEventComSb
    L1_13 = "setIgnoreCameraOutCheckFlag"
    L0_12(L1_13, true)
    L0_12 = Camera
    L1_13 = L0_12
    L0_12 = L0_12.setControl
    L0_12(L1_13, Camera.kPlayer, Camera.kControl_All, false)
    L0_12 = _task_npc_thief_01
    L1_13 = L0_12
    L0_12 = L0_12.terminate
    L0_12(L1_13)
    L0_12 = Fn_findNpc
    L1_13 = _npc_thief_01
    L0_12 = L0_12(L1_13)
    L1_13 = L0_12.pauseMove
    L1_13(L0_12, true)
    L1_13 = Fn_resetPcPos
    L1_13("locator2_pc_start_pos")
    L1_13 = Fn_warpNpc
    L1_13(_npc_thief_01, "locator2_thief_reset_pos")
    L1_13 = Mv_viewObjWait
    L1_13 = L1_13(Fn_findNpcPuppet(_npc_thief_01), 0.3, 1.5)
    print("\227\130\171\227\131\161\227\131\169\229\144\145\227\129\141\227\129\141\227\129\163\227\129\159")
    waitSeconds(1)
    Fn_fadein()
    L1_13 = Mv_safeTaskAbort(L1_13)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Fn_sendEventComSb("setIgnoreCameraOutCheckFlag", false)
    L0_12:pauseMove(false)
    npcInit_thief01()
    Player:setStay(false)
    _processingPcReset = false
    moveSequence()
  end)
end
function detectedByThief()
  if _processingPcReset then
    return
  end
  _processingPcReset = true
  invokeTask(function()
    local L0_14, L1_15
    L0_14 = Mv_safeTaskAbort
    L1_15 = _move_sequence_task
    L0_14(L1_15)
    L0_14 = Mv_safeTaskAbort
    L1_15 = _safe_cap_task
    L0_14(L1_15)
    L0_14 = Player
    L1_15 = L0_14
    L0_14 = L0_14.setStay
    L0_14(L1_15, true)
    L0_14 = Fn_turnNpc
    L1_15 = _npc_thief_01
    L0_14(L1_15)
    L0_14 = Fn_playMotionNpc
    L1_15 = _npc_thief_01
    L0_14(L1_15, "talk_angry_00", false)
    L0_14 = Sound
    L1_15 = L0_14
    L0_14 = L0_14.stopSEHandle
    L0_14(L1_15, _thief_voice_hdl)
    L0_14 = Sound
    L1_15 = L0_14
    L0_14 = L0_14.playSEHandle
    L0_14 = L0_14(L1_15, "m12_914c", 1, "", Fn_findNpcPuppet(_npc_thief_01))
    _thief_voice_hdl = L0_14
    L0_14 = _dameged_out
    if L0_14 then
      L0_14 = Fn_captionViewWait
      L1_15 = "ep05_02031"
      L0_14(L1_15)
    else
      L0_14 = Fn_captionViewWait
      L1_15 = "ep05_02019"
      L0_14(L1_15)
    end
    L0_14 = Fn_playMotionNpc
    L1_15 = _npc_thief_01
    L0_14(L1_15, "stay", false)
    L0_14 = waitSeconds
    L1_15 = 1
    L0_14(L1_15)
    L0_14 = Sound
    L1_15 = L0_14
    L0_14 = L0_14.playSEHandle
    L0_14 = L0_14(L1_15, "pc1_069", 1, "", nil)
    _kit_voice_hdl = L0_14
    L0_14 = Fn_captionViewWait
    L1_15 = "ep05_02021"
    L0_14(L1_15)
    L0_14 = Fn_blackout
    L0_14()
    L0_14 = Fn_sendEventComSb
    L1_15 = "changeNearDistToAfter"
    L0_14(L1_15, false)
    _dameged_out = false
    L0_14 = Fn_sendEventComSb
    L1_15 = "setIgnoreCameraOutCheckFlag"
    L0_14(L1_15, true)
    L0_14 = Camera
    L1_15 = L0_14
    L0_14 = L0_14.setControl
    L0_14(L1_15, Camera.kPlayer, Camera.kControl_All, false)
    L0_14 = _task_npc_thief_01
    L1_15 = L0_14
    L0_14 = L0_14.terminate
    L0_14(L1_15)
    L0_14 = Fn_findNpc
    L1_15 = _npc_thief_01
    L0_14 = L0_14(L1_15)
    L1_15 = L0_14.pauseMove
    L1_15(L0_14, true)
    L1_15 = Fn_resetPcPos
    L1_15("locator2_pc_start_pos")
    L1_15 = Fn_warpNpc
    L1_15(_npc_thief_01, "locator2_thief_reset_pos")
    L1_15 = Fn_sendEventComSb
    L1_15("setMissingRetryFlag", false)
    L1_15 = Mv_viewObjWait
    L1_15 = L1_15(Fn_findNpcPuppet(_npc_thief_01), 0.3, 1.5)
    waitSeconds(1)
    Fn_fadein()
    L1_15 = Mv_safeTaskAbort(L1_15)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Fn_sendEventComSb("setIgnoreCameraOutCheckFlag", false)
    L0_14:pauseMove(false)
    npcInit_thief01()
    Player:setStay(false)
    _processingPcReset = false
    moveSequence()
  end)
end
function moveSequence()
  _move_sequence_task = invokeTask(function()
    _insight_txt_num = 0
    _safe_txt_num = 0
    invokeTask(function()
      waitSeconds(3)
      Fn_sendEventComSb("changeNearDistToAfter", true)
    end)
    cap01()
    print("cap01\233\150\162\230\149\176\227\129\174\227\129\130\227\129\168")
    watchtable = {
      {
        node = "locator2_thief_move_pos_02_b",
        mot = "lookaround",
        time = 210
      }
    }
    npcStopWait("locator2_thief_move_pos_02_a", watchtable, "locator2_thief_move_pos_06", "locator2_thief_move_pos_03")
    cap02()
    npcStopWait("locator2_thief_move_pos_06", nil, "locator2_thief_move_pos_10")
    while not Fn_findNpc(_npc_thief_01):isMoveEnd() or not (Fn_get_distance(Fn_findNpcPuppet(_npc_thief_01):getWorldPos(), findGameObject2("Node", "locator2_thief_move_pos_10"):getWorldPos()) <= 0.1) or CautionLevel.value ~= 0 or _processingPcReset ~= false do
      wait()
    end
    Mv_gotoNextPhase()
  end)
end
function npcStopWait(A0_16, A1_17, A2_18, A3_19)
  local L4_20, L5_21
  L4_20 = print
  L5_21 = "print npcStopWait"
  L4_20(L5_21, A0_16, A1_17, A2_18)
  L4_20 = findGameObject2
  L5_21 = "Node"
  L4_20 = L4_20(L5_21, A0_16)
  L5_21 = L4_20
  L4_20 = L4_20.getWorldPos
  L4_20 = L4_20(L5_21)
  L5_21 = {
    {
      pos = A2_18,
      opt = {arrivedLength = 0}
    }
  }
  while true do
    pos_npc = Fn_findNpcPuppet(_npc_thief_01):getWorldPos()
    if Fn_get_distance(L4_20, pos_npc) <= 1 then
      if A1_17 ~= nil then
        for _FORV_10_ = 1, #A1_17 do
          print("\230\140\135\229\174\154\227\131\142\227\131\188\227\131\137\227\129\184\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
          Fn_turnNpc(_npc_thief_01, A1_17[_FORV_10_].node, nil, nil, true)
          print("lookaround\233\150\139\229\167\139")
          Fn_playMotionNpc(_npc_thief_01, A1_17[_FORV_10_].mot, false)
          print("wait\233\150\139\229\167\139")
          waitSeconds(2.4)
          wait(A1_17[_FORV_10_].time)
          print("\232\166\139\229\155\158\227\129\151\231\181\130\228\186\134print mot = ", A1_17[_FORV_10_].mot, "watch = ", A1_17[_FORV_10_].node)
        end
      end
      if A2_18 ~= nil then
        _task_npc_thief_01:setPosList(L5_21)
        _task_npc_thief_01:action()
        print("Action!!!!!")
      elseif A2_18 == nil then
        print("nextNode == nil!!!!")
      end
      print("print next = ", A2_18)
      break
    end
    wait()
  end
end
function charaMove(A0_22, A1_23, A2_24)
  local L3_25, L4_26
  L3_25 = Fn_findNpc
  L4_26 = A0_22
  L3_25 = L3_25(L4_26)
  L4_26 = {}
  L4_26.anim_walk_speed = 1
  L4_26.arrivedLength = 0.1
  L4_26.runLength = 99999
  L4_26.noTurn = true
  L4_26.recast = true
  Fn_moveNpc(A0_22, A1_23, L4_26)
  repeat
    wait()
  until L3_25:isMoveEnd()
  print("print moveend")
  L3_25:playMotion(A2_24)
end
