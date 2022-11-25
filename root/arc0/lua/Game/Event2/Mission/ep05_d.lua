dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
_processingPcReset = false
_dameged_out = false
_thief_voice_hdl = nil
_kit_voice_hdl = nil
_safe_cap_task = nil
_pair_talk_task = nil
_in_pair_talk_sensor = false
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
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_pair_talk_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_d_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_d_01")
  L0_0 = {
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
      reset = false,
      anim_name = "stay_02"
    },
    {
      name = "npcgen2_chi11_01",
      type = "chi11",
      node = "locator2_chi11_01",
      attach = true,
      reset = false,
      anim_name = "talk_laugh_00"
    },
    {
      name = "npcgen2_wom18_01",
      type = "wom18",
      node = "locator2_wom18_01",
      attach = true,
      reset = false,
      anim_name = "talk_00"
    },
    {
      name = "npcgen2_man32_02",
      type = "man32",
      node = "locator2_man32_02",
      attach = true,
      reset = false,
      anim_name = "talk_angry_01"
    },
    {
      name = "npcgen2_man33_01",
      type = "man33",
      node = "locator2_man33_01",
      attach = true,
      reset = false,
      anim_name = "talk_01"
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
      reset = false,
      anim_name = "talk_sad_00"
    },
    {
      name = "npcgen2_wom17_02",
      type = "wom17",
      node = "locator2_wom17_02",
      attach = true,
      reset = false,
      anim_name = "talk_01"
    }
  }
  Fn_setupNpc(L0_0)
  _npc_thief_01 = "npcgen2_thief_01"
end
function Ingame()
  local L0_1, L1_2
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2, "bgmpoint3")
  L0_1()
  L0_1(L1_2, _global_test)
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2, "check_00", false)
  for _FORV_3_ = 1, 5 do
    _cap_task[_FORV_3_] = nil
  end
  L0_1()
  L0_1(L1_2, Fn_findNpcPuppet(_npc_thief_01))
  moveSequence()
  Mv_waitPhase()
  Fn_disappearNpc("npcgen2_wom17_01")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Sound:stopSEHandle(_thief_voice_hdl)
  Sound:stopSEHandle(_kit_voice_hdl)
end
function npcInit_thief01()
  local L0_3, L1_4
  L0_3 = _task_npc_thief_01
  if L0_3 ~= nil then
    L0_3 = _task_npc_thief_01
    L1_4 = L0_3
    L0_3 = L0_3.taskAbort
    L0_3(L1_4)
    _task_npc_thief_01 = nil
  end
  L0_3 = {L1_4}
  L1_4 = {}
  L1_4.pos = "locator2_thief_move_pos_19_a"
  L1_4.opt = {arrivedLength = 0}
  L1_4 = PerceivableNpc
  L1_4 = L1_4.new
  L1_4 = L1_4(_npc_thief_01)
  _task_npc_thief_01 = L1_4
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setPosList
  L1_4(L1_4, L0_3)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setMoveOption
  L1_4(L1_4, _move_option_thief_normal)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setSightParam
  L1_4(L1_4, _NPC_SIGHT_DEG, _NPC_SIGHT_LEN)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setCautionCoefficient
  L1_4(L1_4, _NPC_CAUTION_INC, _NPC_CAUTION_DEC)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setIndicationCoefficient
  L1_4(L1_4, _NPC_INDICATION_INC, _NPC_INDICATION_DEC)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setIndicationRange
  L1_4(L1_4, _NPC_INDICATION_LEN)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setOnChangeState
  L1_4(L1_4, thiefAction)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setPerceiveEachOther
  L1_4(L1_4, true)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setCombatReady
  L1_4(L1_4, false)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setChaseMode
  L1_4(L1_4, false)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setLoop
  L1_4(L1_4, false)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setChangeRouteImmediately
  L1_4(L1_4, true)
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.setStayMotion
  L1_4(L1_4, "lookaround")
  L1_4 = _task_npc_thief_01
  L1_4 = L1_4.action
  L1_4(L1_4)
  L1_4 = {
    _task_npc_thief_01
  }
  CautionLevel.setNpc(L1_4)
end
function pccubesensor2_pair_talk_01_OnEnter()
  local L0_5, L1_6
  _in_pair_talk_sensor = true
end
function pccubesensor2_pair_talk_01_OnLeave()
  local L0_7, L1_8
  _in_pair_talk_sensor = false
end
function pccubesensor2_catwarp_warning_d_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    Fn_captionViewWait("ep05_09000")
  end)
end
function pccubesensor2_catwarp_area_d_01_OnLeave()
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
    local L0_9, L1_10
    L0_9 = Mv_safeTaskAbort
    L1_10 = _safe_cap_task
    L0_9(L1_10)
    L0_9 = Mv_safeTaskAbort
    L1_10 = _pair_talk_task
    L0_9(L1_10)
    L0_9 = Player
    L1_10 = L0_9
    L0_9 = L0_9.setStay
    L0_9(L1_10, true)
    L0_9 = Sound
    L1_10 = L0_9
    L0_9 = L0_9.playSEHandle
    L0_9 = L0_9(L1_10, "pc1_072", 1, "", nil)
    _kit_voice_hdl = L0_9
    L0_9 = Fn_captionView
    L1_10 = "ep05_02001"
    L0_9(L1_10)
    L0_9 = waitSeconds
    L1_10 = 2
    L0_9(L1_10)
    L0_9 = Fn_blackout
    L0_9()
    L0_9 = Fn_sendEventComSb
    L1_10 = "setIgnoreCameraOutCheckFlag"
    L0_9(L1_10, true)
    L0_9 = Camera
    L1_10 = L0_9
    L0_9 = L0_9.setControl
    L0_9(L1_10, Camera.kPlayer, Camera.kControl_All, false)
    L0_9 = _task_npc_thief_01
    L1_10 = L0_9
    L0_9 = L0_9.terminate
    L0_9(L1_10)
    L0_9 = Fn_findNpc
    L1_10 = _npc_thief_01
    L0_9 = L0_9(L1_10)
    L1_10 = L0_9.pauseMove
    L1_10(L0_9, true)
    L1_10 = Fn_resetPcPos
    L1_10("locator2_pc_start_pos")
    L1_10 = Fn_warpNpc
    L1_10(_npc_thief_01, "locator2_thief_reset_pos")
    L1_10 = Fn_warpNpc
    L1_10("npcgen2_man33_02", "locator2_man33_02")
    L1_10 = Fn_playMotionNpc
    L1_10("npcgen2_man33_02", "check_00", false)
    L1_10 = Mv_viewObjWait
    L1_10 = L1_10(Fn_findNpcPuppet(_npc_thief_01), 0.3, 1.5)
    print("\227\130\171\227\131\161\227\131\169\229\144\145\227\129\141\227\129\141\227\129\163\227\129\159")
    waitSeconds(1)
    Fn_fadein()
    L1_10 = Mv_safeTaskAbort(L1_10)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Fn_sendEventComSb("setIgnoreCameraOutCheckFlag", false)
    L0_9:pauseMove(false)
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
    local L0_11, L1_12
    L0_11 = Mv_safeTaskAbort
    L1_12 = _safe_cap_task
    L0_11(L1_12)
    L0_11 = Mv_safeTaskAbort
    L1_12 = _pair_talk_task
    L0_11(L1_12)
    L0_11 = Player
    L1_12 = L0_11
    L0_11 = L0_11.setStay
    L0_11(L1_12, true)
    L0_11 = Fn_turnNpc
    L1_12 = _npc_thief_01
    L0_11(L1_12)
    L0_11 = Fn_playMotionNpc
    L1_12 = _npc_thief_01
    L0_11(L1_12, "talk_angry_00", false)
    L0_11 = Sound
    L1_12 = L0_11
    L0_11 = L0_11.stopSEHandle
    L0_11(L1_12, _thief_voice_hdl)
    L0_11 = Sound
    L1_12 = L0_11
    L0_11 = L0_11.playSEHandle
    L0_11 = L0_11(L1_12, "m12_914c", 1, "", Fn_findNpcPuppet(_npc_thief_01))
    _thief_voice_hdl = L0_11
    L0_11 = _dameged_out
    if L0_11 then
      L0_11 = Fn_captionViewWait
      L1_12 = "ep05_02031"
      L0_11(L1_12)
    else
      L0_11 = Fn_captionViewWait
      L1_12 = "ep05_02019"
      L0_11(L1_12)
    end
    L0_11 = Fn_playMotionNpc
    L1_12 = _npc_thief_01
    L0_11(L1_12, "stay", false)
    L0_11 = waitSeconds
    L1_12 = 1
    L0_11(L1_12)
    L0_11 = Sound
    L1_12 = L0_11
    L0_11 = L0_11.playSEHandle
    L0_11 = L0_11(L1_12, "pc1_069", 1, "", nil)
    _kit_voice_hdl = L0_11
    L0_11 = Fn_captionViewWait
    L1_12 = "ep05_02021"
    L0_11(L1_12)
    L0_11 = Fn_blackout
    L0_11()
    L0_11 = Fn_sendEventComSb
    L1_12 = "setIgnoreCameraOutCheckFlag"
    L0_11(L1_12, true)
    L0_11 = Camera
    L1_12 = L0_11
    L0_11 = L0_11.setControl
    L0_11(L1_12, Camera.kPlayer, Camera.kControl_All, false)
    L0_11 = _task_npc_thief_01
    L1_12 = L0_11
    L0_11 = L0_11.terminate
    L0_11(L1_12)
    L0_11 = Fn_findNpc
    L1_12 = _npc_thief_01
    L0_11 = L0_11(L1_12)
    L1_12 = L0_11.pauseMove
    L1_12(L0_11, true)
    L1_12 = Fn_resetPcPos
    L1_12("locator2_pc_start_pos")
    L1_12 = Fn_warpNpc
    L1_12(_npc_thief_01, "locator2_thief_reset_pos")
    L1_12 = Fn_warpNpc
    L1_12("npcgen2_man33_02", "locator2_man33_02")
    L1_12 = Fn_playMotionNpc
    L1_12("npcgen2_man33_02", "check_00", false)
    _dameged_out = false
    L1_12 = Fn_sendEventComSb
    L1_12("setMissingRetryFlag", false)
    L1_12 = Mv_viewObjWait
    L1_12 = L1_12(Fn_findNpcPuppet(_npc_thief_01), 0.3, 1.5)
    waitSeconds(1)
    Fn_fadein()
    L1_12 = Mv_safeTaskAbort(L1_12)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Fn_sendEventComSb("setIgnoreCameraOutCheckFlag", false)
    L0_11:pauseMove(false)
    npcInit_thief01()
    Player:setStay(false)
    _processingPcReset = false
    moveSequence()
  end)
end
function moveSequence()
  local L0_13, L1_14, L2_15
  _insight_txt_num = 0
  _safe_txt_num = 0
  L0_13 = {
    L1_14,
    L2_15,
    {
      node = "locator2_thief_move_pos_09",
      mot = "lookaround",
      time = 180
    }
  }
  L1_14 = {}
  L1_14.node = "locator2_thief_move_pos_10_a"
  L1_14.mot = "lookaround"
  L1_14.time = 30
  L2_15 = {}
  L2_15.node = "locator2_thief_move_pos_10_b"
  L2_15.mot = "lookaround"
  L2_15.time = 60
  watchtable = L0_13
  L0_13 = npcStopWait
  L1_14 = "locator2_thief_move_pos_10"
  L2_15 = watchtable
  L0_13(L1_14, L2_15, "locator2_thief_move_pos_19_a")
  L0_13 = print
  L1_14 = "D1\229\186\166\231\155\174\227\129\174npcStopWait\227\131\171\227\131\188\227\131\151\230\138\156\227\129\145\227\129\159\227\129\168\227\129\147\227\130\141\239\188\129"
  L0_13(L1_14)
  L0_13 = cap03
  L0_13()
  L0_13 = {L1_14, L2_15}
  L1_14 = {}
  L1_14.node = "locator2_thief_move_pos_19_b"
  L1_14.mot = "greeting"
  L1_14.time = 1
  L2_15 = {}
  L2_15.node = "locator2_thief_move_pos_19_b"
  L2_15.mot = "talk_00"
  L2_15.time = 0.5
  watchtable = L0_13
  L0_13 = npcStopWait
  L1_14 = "locator2_thief_move_pos_19_a"
  L2_15 = watchtable
  L0_13(L1_14, L2_15)
  L0_13 = Sound
  L1_14 = L0_13
  L0_13 = L0_13.playSEHandle
  L2_15 = "m12_901b"
  L0_13 = L0_13(L1_14, L2_15, 1, "", Fn_findNpcPuppet("npcgen2_man33_02"))
  _thief_voice_hdl = L0_13
  L0_13 = Fn_captionView
  L1_14 = "ep05_02002"
  L0_13(L1_14)
  L0_13 = wait
  L1_14 = 30
  L0_13(L1_14)
  L0_13 = Fn_playMotionNpc
  L1_14 = "npcgen2_man33_02"
  L2_15 = "check_out_00"
  L0_13(L1_14, L2_15, true)
  L0_13 = {L1_14}
  L1_14 = "locator2_thief_move_pos_19_b"
  L1_14 = charaMove
  L2_15 = "npcgen2_man33_02"
  L1_14(L2_15, L0_13, "talk_00")
  L1_14 = Fn_pcSensorOn
  L2_15 = "pccubesensor2_pair_talk_01"
  L1_14(L2_15)
  L1_14 = 0
  L2_15 = {}
  _pair_talk_task = invokeTask(function()
    while true do
      waitSeconds(1)
      L2_15[0] = function()
        _thief_voice_hdl = Sound:playSEHandle("m02_901b", 1, "", Fn_findNpcPuppet("npcgen2_man33_02"))
        Fn_captionViewWait("ep05_02033")
      end
      L2_15[1] = function()
        _thief_voice_hdl = Sound:playSEHandle("m12_904c", 1, "", Fn_findNpcPuppet(_npc_thief_01))
        Fn_captionViewWait("ep05_02034")
      end
      L2_15[2] = function()
        _thief_voice_hdl = Sound:playSEHandle("m12_915b", 1, "", Fn_findNpcPuppet(_npc_thief_01))
        Fn_captionViewWait("ep05_02035")
      end
      if _in_pair_talk_sensor and CautionLevel.value == 0 then
        L2_15[L1_14]()
      end
      L1_14 = L1_14 + 1
      print("mes_count = " .. L1_14)
      if L1_14 >= 3 then
        print("mes_count = 3\227\129\171\227\129\170\227\129\163\227\129\159\227\129\159\227\130\129_pair_talk_task\227\130\146break!!!!!")
        break
      end
    end
  end)
  watchtable = {
    {
      node = "locator2_thief_move_pos_19_b",
      mot = "talk_00",
      time = 300
    }
  }
  npcStopWait("locator2_thief_move_pos_19_a", watchtable)
  Mv_safeTaskAbort(_pair_talk_task)
  Fn_pcSensorOff("pccubesensor2_pair_talk_01")
  if _processingPcReset then
    return
  end
  Mv_gotoNextPhase()
end
function npcStopWait(A0_16, A1_17, A2_18)
  local L3_19, L4_20
  L3_19 = print
  L4_20 = "print npcStopWait"
  L3_19(L4_20, A0_16, A1_17, A2_18)
  L3_19 = findGameObject2
  L4_20 = "Node"
  L3_19 = L3_19(L4_20, A0_16)
  L4_20 = L3_19
  L3_19 = L3_19.getWorldPos
  L3_19 = L3_19(L4_20)
  L4_20 = {
    {
      pos = A2_18,
      opt = {arrivedLength = 0}
    }
  }
  while true do
    pos_npc = Fn_findNpcPuppet(_npc_thief_01):getWorldPos()
    if Fn_get_distance(L3_19, pos_npc) <= 1 then
      if A1_17 ~= nil then
        for _FORV_9_ = 1, #A1_17 do
          print("stopNode\228\187\152\232\191\145\227\129\174\227\129\159\227\130\129\227\128\129watchNode\227\129\184\227\130\191\227\131\188\227\131\179")
          _task_npc_thief_01:setStayMotion(A1_17[_FORV_9_].mot)
          Fn_turnNpc(_npc_thief_01, A1_17[_FORV_9_].node)
          print("\230\140\135\229\174\154\230\153\130\233\150\147wait\227\129\153\227\130\139", A1_17[_FORV_9_].time)
          wait(A1_17[_FORV_9_].time)
          print("print mot = ", A1_17[_FORV_9_].mot, "watch = ", A1_17[_FORV_9_].node)
        end
      end
      if _FOR_ then
      else
      end
      if A2_18 ~= nil then
        _task_npc_thief_01:setPosList(L4_20)
        _task_npc_thief_01:action()
        print("Action!!!!!")
      end
      print("print next = ", A2_18)
      break
    end
    wait()
  end
end
function charaMove(A0_21, A1_22, A2_23)
  local L3_24, L4_25
  L3_24 = Fn_findNpc
  L4_25 = A0_21
  L3_24 = L3_24(L4_25)
  L4_25 = {}
  L4_25.anim_walk_speed = 1
  L4_25.arrivedLength = 0.1
  L4_25.runLength = 99999
  L4_25.noTurn = true
  L4_25.recast = true
  Fn_moveNpc(A0_21, A1_22, L4_25)
  repeat
    wait()
  until L3_24:isMoveEnd()
  print("print moveend")
  L3_24:playMotion(A2_23)
end
