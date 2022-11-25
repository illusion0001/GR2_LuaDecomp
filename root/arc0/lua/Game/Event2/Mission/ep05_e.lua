dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
_processingPcReset = false
_dameged_out = false
_thief_voice_hdl = nil
_kit_voice_hdl = nil
_initiative_cap_task = nil
_initiative_cap_view = false
_pc_arrive_goal = false
_move_sequence_task = nil
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
_thief_motion_task = nil
_demo_thief_motion_task = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_c_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_c_02"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_initiative_area_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_initiative_area_02"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_catwarp_warning_e_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_catwarp_area_e_01"
  L0_0(L1_1)
  L0_0 = {
    L1_1,
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
    }
  }
  L1_1 = {}
  L1_1.name = "npcgen2_thief_01"
  L1_1.type = "thug08"
  L1_1.node = "locator2_thief_01"
  L1_1.attach = true
  L1_1.reset = false
  L1_1 = Fn_setupNpc
  L1_1(L0_0)
  _npc_thief_01 = "npcgen2_thief_01"
  L1_1 = {
    {
      name = "demo_gorotsuki01",
      type = "man42",
      node = "locator2_demo_gorotsuki01_01"
    }
  }
  Fn_setupNpc(L1_1)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5
  L0_2 = print
  L1_3 = "E\227\131\145\227\131\188\227\131\136\233\150\139\229\167\139==============================="
  L0_2(L1_3)
  L0_2 = Fn_setCatWarp
  L1_3 = false
  L0_2(L1_3)
  L0_2 = Fn_pcSensorOn
  L1_3 = "pccubesensor2_catwarp_warning_e_01"
  L0_2(L1_3)
  L0_2 = Fn_pcSensorOn
  L1_3 = "pccubesensor2_catwarp_area_e_01"
  L0_2(L1_3)
  L0_2 = Fn_setCatWarpCheckPoint
  L1_3 = "locator2_pc_start_pos"
  L0_2(L1_3)
  L0_2 = Fn_setBgmPoint
  L1_3 = "event"
  L0_2(L1_3, L2_4)
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_userCtrlOn
  L0_2()
  L0_2 = invokeTask
  function L1_3()
    for _FORV_3_, _FORV_4_ in pairs(_npc_motion_tbl) do
      _npc_motion_task[_FORV_4_.name] = Fn_playLoopMotionInsert(_FORV_4_.name, _FORV_4_.motion, {
        _FORV_4_.motion
      }, 5, 5)
      print(_FORV_4_.name, _FORV_4_.motion)
    end
  end
  L0_2(L1_3)
  function L0_2()
    Fn_setGestureAction("locator2_man_lively_marker", false)
    Fn_playMotionNpc("npcgen2_man33_02", "check_out_00", true)
    Fn_turnNpc("npcgen2_man33_02")
    if _processingPcReset == false then
      Fn_kaiwaDemoView("ep05_00135k")
      invokeTask(function()
        Fn_turnNpc("npcgen2_man33_02", "locator2_man33_turn_box")
        wait()
        Fn_playMotionNpc("npcgen2_man33_02", "check_in_00", true)
        Fn_playMotionNpc("npcgen2_man33_02", "check_00", false)
      end)
    end
  end
  L1_3 = {}
  L2_4.id = "ui_event_guide_02"
  L2_4.func = L0_2
  L1_3.RL = L2_4
  L3_5.target = "locator2_man_lively_marker"
  L2_4(L3_5, L1_3, nil, false, false)
  L2_4()
  L2_4(L3_5, false)
  L2_4(L3_5)
  for _FORV_5_ = 1, 5 do
    _cap_task[_FORV_5_] = nil
  end
  L2_4()
  L2_4(L3_5, Fn_findNpcPuppet(_npc_thief_01))
  moveSequence()
  Mv_waitPhase()
  print("\226\152\133\226\152\133PC\227\129\140\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129")
  _pc_arrive_goal = true
  _move_sequence_task = Mv_safeTaskAbort(_move_sequence_task)
  Fn_sendEventComSb("naviTaskAbort")
  Fn_captionViewEnd()
  if _task_npc_thief_01 ~= nil then
    _task_npc_thief_01:terminate()
    _task_npc_thief_01:taskAbort()
    _task_npc_thief_01 = nil
    print("PC\227\129\140\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159\227\129\139\227\130\137\227\130\191\227\131\188\227\131\159\227\131\141\227\130\164\227\131\136\239\188\129")
  end
  Fn_pcSensorOff("pccubesensor2_c_01")
  Fn_pcSensorOff("pccubesensor2_c_02")
  Fn_setGestureAction("locator2_man_lively_marker", false)
  Fn_blackout(0.5)
  Fn_setNpcActive(_npc_thief_01, false)
  _thief_motion_task = Mv_safeTaskAbort(_thief_motion_task)
  _demo_thief_motion_task = Mv_safeTaskAbort(_demo_thief_motion_task)
  for _FORV_7_, _FORV_8_ in pairs(_npc_motion_tbl) do
    _npc_motion_task[_FORV_8_.name] = Mv_safeTaskAbort(_npc_motion_task[_FORV_8_.name])
    Fn_disappearNpc(_FORV_8_.name)
  end
  for _FORV_7_ = 1, 5 do
    _cap_task[_FORV_7_] = Mv_safeTaskAbort(_cap_task[_FORV_7_])
  end
  _FOR_()
  Fn_disappearNpc("demo_gorotsuki01")
  Fn_disappearNpc("npcgen2_man33_02")
  Fn_disappearNpc("npcgen2_chi11_02")
  Fn_disappearNpc("npcgen2_chi12_01")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Sound:stopSEHandle(_thief_voice_hdl)
  Sound:stopSEHandle(_kit_voice_hdl)
  _thief_voice_hdl = nil
  _kit_voice_hdl = nil
end
function npcInit_thief01()
  local L0_6, L1_7
  L0_6 = print
  L1_7 = "\226\152\133f: npcInit_thief01\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129"
  L0_6(L1_7)
  L0_6 = _task_npc_thief_01
  if L0_6 ~= nil then
    L0_6 = _task_npc_thief_01
    L1_7 = L0_6
    L0_6 = L0_6.taskAbort
    L0_6(L1_7)
    _task_npc_thief_01 = nil
    L0_6 = print
    L1_7 = "_task_npc_thief_01:taskAbort!!!!!"
    L0_6(L1_7)
  end
  L0_6 = {L1_7}
  L1_7 = {}
  L1_7.pos = "locator2_thief_move_pos_25_a"
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
  L1_7 = L1_7.setIndicationEnable
  L1_7(L1_7, true)
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
  L1_7(L1_7, true)
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
function pccubesensor2_in_agito_OnEnter()
  if _processingPcReset then
    return
  end
  Mv_gotoNextPhase()
end
function pccubesensor2_in_agito_OnLeave()
  local L0_8, L1_9
end
function pccubesensor2_initiative_area_OnEnter()
  _initiative_cap_task = invokeTask(function()
    _initiative_cap_view = true
    _kit_voice_hdl = Sound:playSEHandle("pc1_081", 0.2, "", nil)
    Fn_captionViewWait("ep05_02032")
    _initiative_cap_view = false
  end)
end
function pccubesensor2_initiative_area_OnLeave()
  Mv_safeTaskAbort(_initiative_cap_task)
  _initiative_cap_view = false
end
function pccubesensor2_catwarp_warning_e_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    Fn_captionViewWait("ep05_09000")
  end)
end
function pccubesensor2_catwarp_area_e_01_OnLeave()
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
    local L0_10, L1_11
    L0_10 = Mv_safeTaskAbort
    L1_11 = _move_sequence_task
    L0_10(L1_11)
    L0_10 = Mv_safeTaskAbort
    L1_11 = _safe_cap_task
    L0_10(L1_11)
    L0_10 = Player
    L1_11 = L0_10
    L0_10 = L0_10.setStay
    L0_10(L1_11, true)
    L0_10 = Sound
    L1_11 = L0_10
    L0_10 = L0_10.playSEHandle
    L0_10 = L0_10(L1_11, "pc1_072", 1, "", nil)
    _kit_voice_hdl = L0_10
    L0_10 = Fn_captionView
    L1_11 = "ep05_02001"
    L0_10(L1_11)
    L0_10 = waitSeconds
    L1_11 = 2
    L0_10(L1_11)
    L0_10 = Fn_blackout
    L0_10()
    L0_10 = Fn_pcSensorOff
    L1_11 = "pccubesensor2_initiative_area_01"
    L0_10(L1_11)
    L0_10 = Fn_pcSensorOff
    L1_11 = "pccubesensor2_initiative_area_02"
    L0_10(L1_11)
    L0_10 = Mv_safeTaskAbort
    L1_11 = _cap05_kill_task
    L0_10 = L0_10(L1_11)
    _cap05_kill_task = L0_10
    L0_10 = Fn_sendEventComSb
    L1_11 = "setIgnoreCameraOutCheckFlag"
    L0_10(L1_11, true)
    L0_10 = Camera
    L1_11 = L0_10
    L0_10 = L0_10.setControl
    L0_10(L1_11, Camera.kPlayer, Camera.kControl_All, false)
    L0_10 = _task_npc_thief_01
    L1_11 = L0_10
    L0_10 = L0_10.terminate
    L0_10(L1_11)
    L0_10 = Fn_findNpc
    L1_11 = _npc_thief_01
    L0_10 = L0_10(L1_11)
    L1_11 = L0_10.pauseMove
    L1_11(L0_10, true)
    L1_11 = Fn_resetPcPos
    L1_11("locator2_pc_start_pos")
    L1_11 = Fn_warpNpc
    L1_11(_npc_thief_01, "locator2_thief_reset_pos")
    L1_11 = Fn_warpNpc
    L1_11("npcgen2_man33_02", "locator2_man33_02")
    L1_11 = Fn_setGestureAction
    L1_11("locator2_man_lively_marker", false)
    L1_11 = Mv_viewObjWait
    L1_11 = L1_11(Fn_findNpcPuppet(_npc_thief_01), 0.3, 1.5)
    print("\227\130\171\227\131\161\227\131\169\229\144\145\227\129\141\227\129\141\227\129\163\227\129\159")
    waitSeconds(1)
    Fn_fadein()
    L1_11 = Mv_safeTaskAbort(L1_11)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Fn_sendEventComSb("setIgnoreCameraOutCheckFlag", false)
    L0_10:pauseMove(false)
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
    L0_12 = Fn_turnNpc
    L1_13 = _npc_thief_01
    L0_12(L1_13)
    L0_12 = Fn_playMotionNpc
    L1_13 = _npc_thief_01
    L0_12(L1_13, "talk_angry_00", false)
    L0_12 = Sound
    L1_13 = L0_12
    L0_12 = L0_12.stopSEHandle
    L0_12(L1_13, _thief_voice_hdl)
    L0_12 = Sound
    L1_13 = L0_12
    L0_12 = L0_12.playSEHandle
    L0_12 = L0_12(L1_13, "m12_914c", 1, "", Fn_findNpcPuppet(_npc_thief_01))
    _thief_voice_hdl = L0_12
    L0_12 = _dameged_out
    if L0_12 then
      L0_12 = Fn_captionViewWait
      L1_13 = "ep05_02031"
      L0_12(L1_13)
    else
      L0_12 = Fn_captionViewWait
      L1_13 = "ep05_02019"
      L0_12(L1_13)
    end
    L0_12 = Fn_playMotionNpc
    L1_13 = _npc_thief_01
    L0_12(L1_13, "stay", false)
    L0_12 = waitSeconds
    L1_13 = 1
    L0_12(L1_13)
    L0_12 = Sound
    L1_13 = L0_12
    L0_12 = L0_12.playSEHandle
    L0_12 = L0_12(L1_13, "pc1_069", 1, "", nil)
    _kit_voice_hdl = L0_12
    L0_12 = Fn_captionViewWait
    L1_13 = "ep05_02021"
    L0_12(L1_13)
    L0_12 = Fn_blackout
    L0_12()
    L0_12 = Fn_pcSensorOff
    L1_13 = "pccubesensor2_initiative_area_01"
    L0_12(L1_13)
    L0_12 = Fn_pcSensorOff
    L1_13 = "pccubesensor2_initiative_area_02"
    L0_12(L1_13)
    L0_12 = Mv_safeTaskAbort
    L1_13 = _cap05_kill_task
    L0_12 = L0_12(L1_13)
    _cap05_kill_task = L0_12
    _dameged_out = false
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
    L1_13 = Fn_warpNpc
    L1_13("npcgen2_man33_02", "locator2_man33_02")
    L1_13 = Fn_setGestureAction
    L1_13("locator2_man_lively_marker", false)
    L1_13 = Fn_sendEventComSb
    L1_13("setMissingRetryFlag", false)
    L1_13 = Mv_viewObjWait
    L1_13 = L1_13(Fn_findNpcPuppet(_npc_thief_01), 0.3, 1.5)
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
function moveSequence()
  _move_sequence_task = invokeTask(function()
    local L0_14, L1_15
    _insight_txt_num = 0
    _safe_txt_num = 0
    L0_14 = invokeTask
    function L1_15()
      while true do
        _cap_task[5] = Mv_safeTaskAbort(_cap_task[5])
        wait()
      end
    end
    L0_14 = L0_14(L1_15)
    _cap05_kill_task = L0_14
    L0_14 = print
    L1_15 = "npcStopWait\239\188\145\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129"
    L0_14(L1_15)
    L0_14 = npcStopWait
    L1_15 = "locator2_thief_move_pos_19_a"
    L0_14(L1_15, nil, "locator2_thief_move_pos_25_a")
    L0_14 = wait
    L1_15 = 15
    L0_14(L1_15)
    L0_14 = cap04
    L0_14()
    L0_14 = {L1_15}
    L1_15 = "locator2_thief_move_pos_19_c"
    L1_15 = {}
    L1_15.anim_walk_speed = 1
    L1_15.arrivedLength = 0.5
    L1_15.runLength = 99999
    L1_15.noTurn = true
    L1_15.recast = true
    print("\230\140\168\230\139\182NPC\239\188\154\231\174\177\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139")
    while Fn_moveNpc("npcgen2_man33_02", L0_14, L1_15):isRunning() do
      wait()
    end
    wait()
    Fn_playMotionNpc("npcgen2_man33_02", "check_in_00", true)
    Fn_playMotionNpc("npcgen2_man33_02", "check_00", false)
    Fn_setGestureAction("locator2_man_lively_marker", true)
    print("\230\140\168\230\139\182NPC\239\188\154\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179\230\156\137\229\138\185\239\188\129\239\188\129\239\188\129")
    print("npcStopWait2\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
    watchtable = {
      {
        node = "locator2_thief_move_pos_25",
        mot = "lookaround",
        time = 150
      }
    }
    npcStopWait("locator2_thief_move_pos_25_a", watchtable, "locator2_thief_move_pos_26")
    _task_npc_thief_01:setSightParam(_NPC_SIGHT_DEG, 40)
    _cap05_kill_task = Mv_safeTaskAbort(_cap05_kill_task)
    wait()
    cap05()
    Fn_pcSensorOn("pccubesensor2_c_01")
    Fn_pcSensorOn("pccubesensor2_c_02")
    npcStopWait("locator2_thief_move_pos_26", nil, "locator2_thief_move_pos_26_a")
    npcStopWait("locator2_thief_move_pos_26_a", nil, "locator2_thief_move_pos_27")
    npcStopWait("locator2_thief_move_pos_27", nil, "locator2_thief_move_pos_28")
    npcStopWait("locator2_thief_move_pos_28", nil, "locator2_thief_move_pos_29")
    npcStopWait("locator2_thief_move_pos_29", nil, "locator2_thief_move_pos_31")
    while not (Fn_get_distance(Fn_findNpcPuppet(_npc_thief_01):getWorldPos(), findGameObject2("Node", "locator2_thief_move_pos_31"):getWorldPos()) <= 0.1) or _processingPcReset ~= false do
      wait()
    end
    print("\226\152\133\230\179\165\230\163\146\227\129\140\230\156\128\231\181\130\229\156\176\231\130\185\227\129\171\231\157\128\227\129\132\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129")
    wait()
    Fn_findNpc(_npc_thief_01):pauseMove(true)
    Fn_playMotionNpc(_npc_thief_01, "stay", false)
    print("pauseMove!!!!!!!!!")
    wait()
    _task_npc_thief_01:terminate()
    print("\231\167\187\229\139\149\231\181\130\228\186\134\227\129\167\227\130\191\227\131\188\227\131\159\227\131\141\227\130\164\227\131\136\239\188\129\239\188\129\239\188\129\239\188\129")
    Fn_findNpc(_npc_thief_01):pauseMove(false)
    print("pauseMove\232\167\163\233\153\164!!!!!!!!!")
    Fn_turnNpc(_npc_thief_01, "locator2_thief_turn_last")
    _thief_motion_task = Fn_playLoopMotionInsert(_npc_thief_01, "talk_01", {"reply_yes"}, 5, 5)
    _demo_thief_motion_task = Fn_playLoopMotionInsert("demo_gorotsuki01", "talk_00", {"stay"}, 5, 5)
    print("\228\188\154\232\169\177\227\131\171\227\131\188\227\131\151\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129")
    waitSeconds(1)
    if _pc_arrive_goal == false then
      Fn_pcSensorOn("pccubesensor2_initiative_area_01")
      Fn_pcSensorOn("pccubesensor2_initiative_area_02")
    end
  end)
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
        print("Action!!!!!!!!!!!")
      end
      print("print next = ", A2_18)
      break
    end
    wait()
  end
end
