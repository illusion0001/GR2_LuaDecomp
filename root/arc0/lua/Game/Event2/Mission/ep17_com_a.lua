dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_MAX_REQUEST_ID = 999
_missionRetry = false
_request = {}
_requestId = 0
_requestResult = {}
_next_phase = false
_npcTable = {}
_any_hack = false
_npc_bots = {}
_policeNameList = {}
_police_motion = {}
_botNameList = {}
_police_puppet_tbl = {}
_FRIEND_STATUS = {
  NORMAL = 1,
  STAY = 2,
  HACK = 3,
  FORCED = 4
}
_friend = {
  npc = nil,
  npcPuppet = nil,
  status = _FRIEND_STATUS.FORCED,
  command = nil,
  target = nil,
  hackEnable = false,
  busy = false
}
_friend.npc = Fn_findNpc(_npc_friend)
_friend.npcPuppet = Fn_findNpcPuppet(_npc_friend)
_friend.status = _FRIEND_STATUS.FORCED
_friend.command = nil
_friend.target = nil
_friend.hackEnable = false
_friend.busy = false
_processingPcReset = false
_is_demo_time = false
_friend_move_task = {}
_target_move_task = {}
_sdemo1_ready = false
_sdemo2_ready = false
_partD_done = false
_partE_done = false
_in_event_05 = false
_goal = false
_timer_started = false
_last_hacking_phase = false
_in_terrace_sensor = false
_reset_e3 = false
_is_part_e3 = false
_disappear_route = false
enmgen2_for_npcGenerator = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {},
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().totalAshCount = A0_8:getSpecTable().totalAshCount + 1
  end,
  onObjectDead = function(A0_10, A1_11)
    A0_10:getSpecTable().totalDeadCount = A0_10:getSpecTable().totalDeadCount + 1
  end
}
function Initialize()
  local L0_12, L1_13, L2_14
  L0_12 = Fn_getMissionPart
  L0_12 = L0_12()
  _npc_friend = "npcgen2_friend_01"
  _npc_police_101 = "npcgen2_police_101"
  _npc_police_102 = "npcgen2_police_102"
  _npc_police_103 = "npcgen2_police_103"
  _npc_police_104 = "npcgen2_police_104"
  _npc_police_105 = "npcgen2_police_105"
  _npc_police_106 = "npcgen2_police_106"
  _npc_police_107 = "npcgen2_police_107"
  _npc_bot_101 = "npcgen2_bot_101"
  _npc_bot_102 = "npcgen2_bot_102"
  _npc_bot_103 = "npcgen2_bot_103"
  _npc_bot_201 = "npcgen2_bot_201"
  _npc_bot_301 = "npcgen2_bot_301"
  _npc_bot_302 = "npcgen2_bot_302"
  _policeNameList = L1_13
  _botNameList = L1_13
  _MAX_POLICE = L1_13
  _MAX_BOT = L1_13
  L2_14.done = false
  L2_14.start = "locator2_target_01"
  L2_14.goal = "locator2_lead_01"
  L2_14.police = {
    {
      police = _npc_police_101,
      goal = "locator2_lead_01_police_101"
    },
    {
      police = _npc_police_102,
      goal = "locator2_lead_01_police_102"
    }
  }
  _hackingData = L1_13
  _sdemo1 = L1_13
  _sdemo2 = L1_13
  for _FORV_4_ = 1, _MAX_POLICE do
    Fn_setNpcActive(_policeNameList[_FORV_4_], false)
    _mot_list = {
      whistle = "man31_whistle_00",
      walk01 = "man01_walk_00",
      stay01 = "man01_stay_00",
      talk01 = "man01_talk_02",
      turnL = "man01_turn_l_00",
      turnR = "man01_turn_r_00",
      walkB = "man01_walk_b_00",
      walkL = "man01_walk_l_00",
      walkLlop = "man01_walk_l_loop_00",
      walkRlop = "man01_walk_r_loop_00",
      walkR = "man01_walk_r_00",
      run01 = "man01_run_00"
    }
    Fn_loadNpcEventMotion(_policeNameList[_FORV_4_], _mot_list)
    _police_puppet_tbl[_policeNameList[_FORV_4_]] = Fn_findNpcPuppet(_policeNameList[_FORV_4_])
  end
  for _FORV_4_ = 1, _MAX_BOT do
    Fn_setNpcActive(_botNameList[_FORV_4_], false)
  end
  L2_14(L1_13, "friend")
  L2_14(_npc_friend, false)
  L2_14(_npc_friend, false)
  if L2_14 ~= "ep17_c" then
  elseif L2_14 == "ep17_e" then
    L2_14(_npc_friend, true)
    L2_14(_npc_friend, true)
  end
  if L2_14 ~= "ep17_d" then
  elseif L2_14 == "ep17_e" then
    if L2_14 == "ep17_e" then
      L2_14("locator2_pc_start_pos_e")
      L2_14()
    else
      L2_14("locator2_pc_start_pos_d_01")
    end
    L2_14()
    L2_14()
    L2_14()
    L2_14()
    L2_14()
    L2_14()
  end
  L2_14("pccubesensor2_limit_01")
  L2_14("pccubesensor2_event_01")
  L2_14("pccubesensor2_event_02")
  L2_14("pccubesensor2_event_03_01")
  L2_14("pccubesensor2_event_03_02")
  L2_14("pccubesensor2_event_03_03")
  L2_14("pccubesensor2_event_04")
  L2_14("pccubesensor2_event_05")
  L2_14("pccubesensor2_event_88")
  L2_14("pccubesensor2_event_99")
  L2_14("pccubesensormulti2_hiroba_forbid_01")
  L2_14("pccubesensormulti2_hiroba_forbid_02")
  L2_14("pccubesensor2_hide_01")
  L2_14("pccubesensor2_guide_c_01")
  L2_14("pccubesensor2_guide_c_02")
  L2_14("pccubesensor2_guide_d_01")
  L2_14("pccubesensor2_guide_d_02")
  L2_14("pccubesensor2_guide_e_01")
  L2_14("pccubesensor2_guide_e_02")
  L2_14("pccubesensor2_terrace_01")
  if L0_12 == "ep17_d" or L0_12 == "ep17_e" then
    L2_14.done = true
    L2_14(_npc_friend, "locator2_friend_d_start")
    for _FORV_5_ = 1, #_npc_bots do
      if _npc_bots[_FORV_5_].npcName == _npc_bot_101 then
        Fn_warpNpc(_npc_bot_101, _hackingData[1].goal)
        _npc_bots[_FORV_5_]:setPosList({
          {
            pos = _hackingData[1].goal,
            opt = posOption
          }
        })
        break
      end
    end
    for _FORV_6_ = 1, #_hackingData[1].police do
      for _FORV_10_ = 1, #_policeNameList do
        if _policeNameList[_FORV_10_] == _hackingData[1].police[_FORV_6_].police then
          _hackingData[1].police[_FORV_6_].instance = _policeNameList[_FORV_10_]
          table.insert(L2_14, _hackingData[1].police[_FORV_6_])
        end
      end
    end
    for _FORV_6_ = 1, #L2_14 do
      Fn_warpNpc(L2_14[_FORV_6_].police, L2_14[_FORV_6_].goal)
    end
  end
  if L0_12 == "ep17_e" then
    L2_14.done = true
    L2_14(_npc_friend, "locator2_friend_e_start")
    for _FORV_5_ = 1, #_npc_bots do
      if _npc_bots[_FORV_5_].npcName == _npc_bot_201 then
        Fn_warpNpc(_npc_bot_201, _hackingData[2].goal)
        _npc_bots[_FORV_5_]:setPosList({
          {
            pos = _hackingData[2].goal,
            opt = posOption
          }
        })
        break
      end
    end
    for _FORV_6_ = 1, #_hackingData[2].police do
      for _FORV_10_ = 1, #_policeNameList do
        if _policeNameList[_FORV_10_] == _hackingData[2].police[_FORV_6_].police then
          _hackingData[2].police[_FORV_6_].instance = _policeNameList[_FORV_10_]
          table.insert(L2_14, _hackingData[2].police[_FORV_6_])
        end
      end
    end
    for _FORV_6_ = 1, #L2_14 do
      Fn_warpNpc(L2_14[_FORV_6_].police, L2_14[_FORV_6_].goal)
    end
  end
end
function Ingame()
  dispatchTask = invokeTask(function()
    while true do
      dispatchRequestTask()
      wait()
    end
  end)
end
function ingameSection(A0_15)
  local L1_16
  L1_16 = {}
  L1_16.b0 = part_b0
  L1_16.b1 = part_b1
  L1_16.b2 = part_b2
  L1_16.c1 = part_c1
  L1_16.c2 = part_c2
  L1_16.c3 = part_c3
  L1_16.c4 = part_c4
  L1_16.c5 = part_c5
  L1_16.c6 = part_c6
  L1_16.d1 = part_d1
  L1_16.d2 = part_d2
  L1_16.e1 = part_e1
  L1_16.e2 = part_e2
  L1_16.e3 = part_e3
  L1_16[A0_15[1]]()
  _next_phase = true
end
function part_b1()
  local L0_17, L1_18
  _next_phase = false
end
function part_b2()
  _next_phase = false
  Fn_setNpcActive(_npc_friend, true)
  Fn_setNpcVisible(_npc_friend, true)
end
function part_c1()
  local L0_19, L1_20, L2_21, L3_22
  _next_phase = false
  L0_19()
  L0_19()
  L0_19()
  L0_19()
  L0_19()
  L0_19()
  L0_19(L1_20)
  L0_19(L1_20)
  L0_19(L1_20)
  for L3_22 = 1, _MAX_BOT do
    botAction(L3_22)
  end
  L0_19(L1_20, L2_21)
  L0_19(L1_20, L2_21)
  L0_19(L1_20, L2_21)
  L0_19(L1_20)
end
function part_c2()
  local L0_23
  _next_phase = false
  L0_23 = Fn_naviSet
  L0_23(findGameObject2("Node", "locator2_friend_01"))
  L0_23 = HUD
  L0_23 = L0_23.naviSetPochiDistanceDensity0
  L0_23(L0_23, 0)
  L0_23 = HUD
  L0_23 = L0_23.naviSetPochiDistanceDensity100
  L0_23(L0_23, -1)
  L0_23 = Sound
  L0_23 = L0_23.playSE
  L0_23(L0_23, "ali_009", 1, "", Fn_findNpcPuppet(_npc_friend))
  L0_23 = {}
  L0_23.anim_walk_speed = 0.5
  L0_23.anim_speed_over = true
  L0_23.arrivedLength = 0.1
  L0_23.navimesh = true
  L0_23.noTurn = false
  L0_23.recast = true
  invokeTask(function()
    _friend_move_task[1] = Fn_moveNpc(_npc_friend, {
      "locator2_friend_01"
    }, L0_23)
    waitNpcMoveEnd(_npc_friend)
    _friend_move_task[1] = Mv_safeTaskAbort(_friend_move_task[1])
    wait()
    Fn_turnNpc(_npc_friend, "locator2_bot_101_01")
  end)
  while _processingPcReset do
    wait()
  end
end
function part_c3()
  _next_phase = false
  while not _sdemo1_ready or _processingPcReset or CautionLevel.value ~= 0 do
    wait()
  end
  CautionLevel.allTerminate()
  print("\229\133\168\232\173\166\230\136\146NPC\239\188\154\229\188\183\229\136\182\229\129\156\230\173\162\239\188\134\230\142\162\231\159\165\228\184\141\229\143\175")
  _npc_bots[1]:setAlertRange(0)
  _npc_bots[1]:setCautionRange(0)
  for _FORV_3_ = 1, _MAX_BOT do
    _npc_bots[_FORV_3_]:restart()
  end
  print("\227\130\176\227\131\170\227\130\180\239\188\154\230\132\159\231\159\165\232\183\157\233\155\1620\227\129\171\227\129\151\227\129\166\233\128\154\229\184\184\230\140\153\229\139\149\227\129\171\227\130\130\227\129\169\227\129\153")
  Fn_pcSensorOn("pccubesensor2_event_01")
  Fn_naviKill()
  Fn_userCtrlOff()
  _is_demo_time = true
  Fn_captionViewEnd()
  _sdemo1:set("locator2_sdemo1_camera_01", "locator2_sdemo1_target_01")
  _sdemo1:play()
  invokeTask(function()
    wait()
    Fn_resetPcPos("locator2_resetpos_demo_01")
  end)
  waitSeconds(1)
  _sdemo1:zoomIn(3, {deg = 30})
  Fn_captionViewWait("ep17_09000")
  _sdemo1:zoomOut(2, {deg = 45})
  waitSeconds(2)
  _sdemo1:stop()
  Fn_userCtrlOn()
  _is_demo_time = false
  _npc_bots[1]:setAlertRange(3)
  _npc_bots[1]:setCautionRange(9.2)
  _npc_bots[1]:setDetectGravity(true)
  print("\227\130\176\227\131\170\227\130\180101\227\129\174\230\142\162\231\159\165\232\168\173\229\174\154\227\130\146\233\128\154\229\184\184\227\129\171\230\136\187\227\129\153")
  Fn_pcSensorOn("pccubesensor2_guide_c_01")
end
function part_c4()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32
  _next_phase = false
  L0_24 = 0
  while true do
    L1_25 = nil
    while L1_25 == nil do
      for L5_29 = 1, #L3_27 do
        L6_30 = Fn_get_distance
        L7_31 = Fn_findNpcPuppet
        L8_32 = _npc_friend
        L7_31 = L7_31(L8_32)
        L8_32 = L7_31
        L7_31 = L7_31.getWorldPos
        L7_31 = L7_31(L8_32)
        L8_32 = _npc_bots
        L8_32 = L8_32[L5_29]
        L8_32 = L8_32.npcPuppet
        L8_32 = L8_32.getWorldPos
        L8_32 = L8_32(L8_32)
        L6_30 = L6_30(L7_31, L8_32, L8_32(L8_32))
        if L6_30 < 3 then
          L6_30 = _processingPcReset
          if L6_30 == false then
            L6_30 = _npc_bots
            L6_30 = L6_30[L5_29]
            L6_30 = L6_30.status
            L7_31 = NPC_STATUS
            L7_31 = L7_31.NORMAL
            if L6_30 ~= L7_31 then
              L6_30 = _npc_bots
              L6_30 = L6_30[L5_29]
              L6_30 = L6_30.status
              L7_31 = NPC_STATUS
              L7_31 = L7_31.CAUTION
              if L6_30 ~= L7_31 then
                L6_30 = _npc_bots
                L6_30 = L6_30[L5_29]
                L6_30 = L6_30.status
                L7_31 = NPC_STATUS
                L7_31 = L7_31.ALERT
              end
            elseif L6_30 == L7_31 then
              L6_30 = _npc_bots
              L1_25 = L6_30[L5_29]
              break
            end
          end
        end
      end
      L2_26()
    end
    L2_26(L3_27, L4_28, L5_29)
    L2_26(L3_27)
    L2_26(L3_27)
    L6_30 = ""
    L7_31 = L1_25.npcPuppet
    L2_26(L3_27, L4_28, L5_29, L6_30, L7_31)
    L2_26(L3_27)
    L2_26(L3_27)
    L0_24 = L0_24 + 1
    L2_26(L3_27)
    L2_26(L3_27, L4_28)
    L2_26(L3_27)
    if L0_24 == 1 then
      L2_26(L3_27)
    end
    L2_26(L3_27, L4_28)
    L2_26(L3_27)
    L8_32 = L3_27(L4_28, L5_29)
    L2_26(L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L3_27(L4_28, L5_29))
    while not L2_26 do
      if L3_27 == 0 then
        L3_27(L4_28)
        L3_27(L4_28)
      else
        if L3_27 ~= L4_28 then
        end
        if L3_27 == L4_28 then
          L3_27(L4_28)
        end
      end
      for L6_30 = 1, #L4_28 do
        L7_31 = getNodePos
        L8_32 = _hackingData
        L8_32 = L8_32[L6_30]
        L8_32 = L8_32.start
        L7_31 = L7_31(L8_32)
        L8_32 = L1_25.npcPuppet
        L8_32 = L8_32.getWorldPos
        L8_32 = L8_32(L8_32)
        if Fn_get_distance(L7_31, L8_32) < 10 and _hackingData[L6_30].done == false and L1_25.status == NPC_STATUS.HACKED then
          _hackingData[L6_30].done = true
          result = L6_30
          break
        end
      end
      if L3_27 == 0 then
        L3_27(L4_28, L5_29)
      end
      L3_27()
    end
  end
  L6_30 = 1
  L7_31 = ""
  L8_32 = L1_25.npcPuppet
  L3_27(L4_28, L5_29, L6_30, L7_31, L8_32)
  L3_27.anim_walk_speed = 1
  L3_27.anim_speed_over = true
  L3_27.arrivedLength = 0.1
  L3_27.navimesh = true
  L3_27.noTurn = false
  L3_27.recast = true
  L4_28.startIndex = 1
  L4_28.goalDirection = true
  L6_30 = {}
  L6_30.pos = "locator2_friend_02"
  L6_30.opt = L3_27
  L6_30 = _friend_move_task
  L7_31 = Fn_moveNpc
  L8_32 = _npc_friend
  L7_31 = L7_31(L8_32, {
    "locator2_friend_02"
  }, L3_27)
  L6_30[2] = L7_31
  L6_30 = invokeTask
  function L7_31()
    while _friend_move_task[2] == nil or _friend_move_task[2]:isRunning() ~= false do
      do break end
      wait()
    end
    _friend_move_task[2] = Mv_safeTaskAbort(_friend_move_task[2])
  end
  L6_30(L7_31)
  L6_30 = Fn_naviKill
  L6_30()
  L6_30 = Fn_pcSensorOn
  L7_31 = "pccubesensor2_guide_c_02"
  L6_30(L7_31)
  _disappear_route = false
  L6_30 = L1_25.npcName
  L7_31 = _npc_bots
  L7_31 = L7_31[1]
  L7_31 = L7_31.npcName
  if L6_30 ~= L7_31 then
    L6_30 = _npc_bots
    L6_30 = L6_30[1]
    L6_30 = L6_30.status
    L7_31 = NPC_STATUS
    L7_31 = L7_31.NORMAL
    if L6_30 == L7_31 then
      L6_30 = Fn_isInSightTarget
      L7_31 = _npc_bots
      L7_31 = L7_31[1]
      L7_31 = L7_31.npcPuppet
      L8_32 = 1
      L6_30 = L6_30(L7_31, L8_32)
      if L6_30 then
        L6_30 = Camera
        L7_31 = L6_30
        L6_30 = L6_30.getEyePos
        L6_30 = L6_30(L7_31)
        L7_31 = _npc_bots
        L7_31 = L7_31[1]
        L7_31 = L7_31.npcPuppet
        L8_32 = L7_31
        L7_31 = L7_31.getWorldPos
        L7_31 = L7_31(L8_32)
        L8_32 = Query
        L8_32 = L8_32.setEyeSightTransform
        L8_32(L8_32, L6_30)
        L8_32 = Query
        L8_32 = L8_32.setEyeSightAngle
        L8_32(L8_32, Deg2Rad(50))
        L8_32 = Query
        L8_32 = L8_32.setEyeSightRange
        L8_32(L8_32, 15)
        L8_32 = Query
        L8_32 = L8_32.debugDrawEyeSight
        L8_32(L8_32, {
          r = 1,
          g = 1,
          b = 1
        })
        L8_32 = Query
        L8_32 = L8_32.raycastEyeSight
        L8_32 = L8_32(L8_32, L7_31)
        if not L8_32 then
          DebugDraw:setColor(0, 1, 0)
        else
          DebugDraw:setColor(1, 0, 0)
        end
        DebugDraw:drawLines({L6_30, L7_31})
        if false == false then
          _disappear_route = true
          print("\233\129\174\232\148\189\231\137\169\227\129\140\227\129\130\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129")
        end
      else
        L6_30 = Fn_isInSightTarget
        L7_31 = _npc_bots
        L7_31 = L7_31[1]
        L7_31 = L7_31.npcPuppet
        L8_32 = 1
        L6_30 = L6_30(L7_31, L8_32)
        if L6_30 == false then
          _disappear_route = true
          L6_30 = print
          L7_31 = "\227\130\171\227\131\161\227\131\169\229\164\150\227\129\160\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129"
          L6_30(L7_31)
        end
      end
    end
  end
  L6_30 = _disappear_route
  if L6_30 then
    L6_30 = Fn_setNpcActive
    L7_31 = _npc_bots
    L7_31 = L7_31[1]
    L7_31 = L7_31.npcName
    L8_32 = false
    L6_30(L7_31, L8_32)
    L6_30 = _npc_bots
    L6_30 = L6_30[1]
    L7_31 = L6_30
    L6_30 = L6_30.terminate
    L6_30(L7_31)
    L6_30 = _npc_bots
    L6_30 = L6_30[1]
    L7_31 = L6_30
    L6_30 = L6_30.setCautionRange
    L6_30(L7_31)
    L6_30 = print
    L7_31 = "\232\170\152\229\176\142\227\130\176\227\131\170\227\130\180\227\129\175\232\166\143\229\174\154\227\129\167\227\129\175\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\166\143\229\174\154\227\130\176\227\131\170\227\130\180\233\157\158\232\161\168\231\164\186\227\129\171\227\129\151\227\129\166\227\130\191\227\131\188\227\131\159\227\131\141\227\130\164\227\131\136"
    L6_30(L7_31)
  end
  L6_30 = invokeTask
  function L7_31()
    waitSeconds(1)
    Fn_missionView("ep17_09037")
  end
  L6_30(L7_31)
  L6_30 = waitMoveToPolice
  L7_31 = L1_25
  L8_32 = result
  L6_30(L7_31, L8_32)
  L6_30 = wait
  L6_30()
  L6_30 = waitSeconds
  L7_31 = 3
  L6_30(L7_31)
  L6_30 = trickPolice
  L7_31 = L1_25
  L8_32 = result
  L6_30(L7_31, L8_32)
  L6_30 = waitSeconds
  L7_31 = 10
  L6_30(L7_31)
  while true do
    L6_30 = _processingPcReset
    if L6_30 then
      L6_30 = wait
      L6_30()
    end
  end
  L6_30 = Fn_naviKill
  L6_30()
  L6_30 = Fn_pcSensorOff
  L7_31 = "pccubesensor2_guide_c_02"
  L6_30(L7_31)
  L6_30 = Fn_naviKill
  L6_30()
  L6_30 = Fn_naviSet
  L7_31 = findGameObject2
  L8_32 = "Node"
  L8_32 = L7_31(L8_32, "locator2_target_01")
  L6_30(L7_31, L8_32, L7_31(L8_32, "locator2_target_01"))
  L6_30 = Fn_pcSensorOn
  L7_31 = "pccubesensor2_event_02"
  L6_30(L7_31)
  L6_30 = {L7_31}
  L7_31 = {}
  L7_31.pos = "locator2_target_01"
  L7_31.opt = L3_27
  L7_31 = _friend_move_task
  L8_32 = Fn_moveNpc
  L8_32 = L8_32(_npc_friend, {
    "locator2_target_01"
  }, L3_27)
  L7_31[3] = L8_32
  L7_31 = invokeTask
  function L8_32()
    repeat
      while _friend_move_task[3] ~= nil do
        wait()
        do break end
        break
      end
    until _friend_move_task[3]:isRunning()
    _friend_move_task[3] = Mv_safeTaskAbort(_friend_move_task[3])
  end
  L7_31(L8_32)
end
function part_c6()
  local L0_33, L1_34, L2_35
  _next_phase = false
  L0_33 = waitSeconds
  L1_34 = 3
  L0_33(L1_34)
  while true do
    L0_33 = _sdemo2_ready
    L0_33 = L0_33 and _processingPcReset
    if L0_33 then
      L0_33 = wait
      L0_33()
    end
  end
  L0_33 = CautionLevel
  L0_33 = L0_33.allTerminate
  L0_33()
  L0_33 = print
  L1_34 = "\229\133\168\232\173\166\230\136\146NPC\239\188\154\229\188\183\229\136\182\229\129\156\230\173\162\239\188\134\230\142\162\231\159\165\228\184\141\229\143\175"
  L0_33(L1_34)
  L0_33 = Fn_naviKill
  L0_33()
  L0_33 = Fn_userCtrlOff
  L0_33()
  _is_demo_time = true
  L0_33 = Fn_captionViewEnd
  L0_33()
  L0_33 = Fn_setKittenAndCatActive
  L1_34 = false
  L0_33(L1_34)
  L0_33 = _sdemo2
  L1_34 = L0_33
  L0_33 = L0_33.set
  L2_35 = "locator2_sdemo2_camera_01"
  L0_33(L1_34, L2_35, "locator2_sdemo2_target_02")
  L0_33 = _sdemo2
  L1_34 = L0_33
  L0_33 = L0_33.play
  L0_33(L1_34)
  L0_33 = Fn_resetPcPos
  L1_34 = "locator2_resetpos_demo_02"
  L0_33(L1_34)
  L0_33 = waitSeconds
  L1_34 = 0.5
  L0_33(L1_34)
  L0_33 = _sdemo2
  L1_34 = L0_33
  L0_33 = L0_33.zoomIn
  L2_35 = 2
  L0_33(L1_34, L2_35, {deg = 20}, "easeInOut")
  L0_33 = {L1_34}
  L1_34 = {}
  L1_34.pos = "locator2_sdemo2_target_03"
  L1_34.time = 2
  L1_34 = _sdemo2
  L2_35 = L1_34
  L1_34 = L1_34.play
  L1_34(L2_35, nil, L0_33)
  L1_34 = Fn_captionViewWait
  L2_35 = "ep17_09002"
  L1_34(L2_35, 3, 2)
  L1_34 = {L2_35}
  L2_35 = {}
  L2_35.pos = "locator2_sdemo2_target_04"
  L2_35.time = 2
  L2_35 = _sdemo2
  L2_35 = L2_35.play
  L2_35(L2_35, nil, L1_34)
  L2_35 = waitSeconds
  L2_35(2)
  L2_35 = {
    {
      pos = "locator2_sdemo2_target_05",
      time = 2
    }
  }
  _sdemo2:play(nil, L2_35)
  waitSeconds(2)
  Fn_setKittenAndCatActive(true)
  Camera:lookTo(findGameObject2("Node", "locator2_sdemo2_target_05"):getWorldPos(), 0, 0)
  _sdemo2:stop(2)
  waitSeconds(2)
  Fn_userCtrlOn()
  for _FORV_6_ = 1, _MAX_BOT do
    _npc_bots[_FORV_6_]:restart()
  end
  print("\232\173\166\230\136\146\227\130\176\227\131\170\227\130\180\239\188\154\233\128\154\229\184\184\230\140\153\229\139\149\227\129\171\230\136\187\227\129\153")
  _is_demo_time = false
end
function part_d1()
  _next_phase = false
  Fn_pcSensorOn("pccubesensor2_limit_01")
  Fn_pcSensorOn("pccubesensormulti2_hiroba_forbid_01")
  HUD:info("ep17_info_01", false)
  wait()
  Fn_missionView("ep17_09038")
  invokeTask(function()
    waitSeconds(1.3)
    Fn_naviSet(findGameObject2("Node", _hackingData[2].start))
    waitSeconds(1.2)
    Fn_captionView("ep17_09003")
    _friend.status = _FRIEND_STATUS.NORMAL
  end)
  while _processingPcReset do
    wait()
  end
end
function part_d2()
  local L0_36, L1_37, L2_38, L3_39
  _next_phase = false
  while true do
    L0_36 = print
    L1_37 = "HACKING_START2\227\129\167\227\129\153\239\188\129\239\188\129\239\188\129"
    L0_36(L1_37)
    L0_36 = waitHacking
    L0_36()
    L0_36 = Fn_missionView
    L1_37 = "ep17_09036"
    L0_36(L1_37)
    L0_36 = _friend
    L0_36 = L0_36.target
    L1_37 = waitLead
    L2_38 = L0_36
    L1_37 = L1_37(L2_38)
    if L1_37 == false then
      L2_38 = print
      L3_39 = "HACKING_START2\227\129\184\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129"
      L2_38(L3_39)
    end
  end
  L2_38 = Sound
  L3_39 = L2_38
  L2_38 = L2_38.playSE
  L2_38(L3_39, "ep17_grigo_hacking", 1, "", L0_36.npcPuppet)
  L2_38 = Fn_naviKill
  L2_38()
  L2_38 = Fn_pcSensorOn
  L3_39 = "pccubesensor2_guide_d_02"
  L2_38(L3_39)
  _disappear_route = false
  L2_38 = L0_36.npcName
  L3_39 = _npc_bots
  L3_39 = L3_39[4]
  L3_39 = L3_39.npcName
  if L2_38 ~= L3_39 then
    L2_38 = _npc_bots
    L2_38 = L2_38[4]
    L2_38 = L2_38.status
    L3_39 = NPC_STATUS
    L3_39 = L3_39.NORMAL
    if L2_38 == L3_39 then
      L2_38 = Fn_isInSightTarget
      L3_39 = _npc_bots
      L3_39 = L3_39[4]
      L3_39 = L3_39.npcPuppet
      L2_38 = L2_38(L3_39, 1)
      if L2_38 then
        L2_38 = Camera
        L3_39 = L2_38
        L2_38 = L2_38.getEyePos
        L2_38 = L2_38(L3_39)
        L3_39 = _npc_bots
        L3_39 = L3_39[4]
        L3_39 = L3_39.npcPuppet
        L3_39 = L3_39.getWorldPos
        L3_39 = L3_39(L3_39)
        Query:setEyeSightTransform(L2_38)
        Query:setEyeSightAngle(Deg2Rad(50))
        Query:setEyeSightRange(15)
        Query:debugDrawEyeSight({
          r = 1,
          g = 1,
          b = 1
        })
        if not Query:raycastEyeSight(L3_39) then
          DebugDraw:setColor(0, 1, 0)
        else
          DebugDraw:setColor(1, 0, 0)
        end
        DebugDraw:drawLines({L2_38, L3_39})
        if false == false then
          _disappear_route = true
          print("\233\129\174\232\148\189\231\137\169\227\129\140\227\129\130\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129")
        end
      else
        L2_38 = Fn_isInSightTarget
        L3_39 = _npc_bots
        L3_39 = L3_39[4]
        L3_39 = L3_39.npcPuppet
        L2_38 = L2_38(L3_39, 1)
        if L2_38 == false then
          _disappear_route = true
          L2_38 = print
          L3_39 = "\227\130\171\227\131\161\227\131\169\229\164\150\227\129\160\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129"
          L2_38(L3_39)
        end
      end
    end
  end
  L2_38 = _disappear_route
  if L2_38 then
    L2_38 = Fn_setNpcActive
    L3_39 = _npc_bots
    L3_39 = L3_39[4]
    L3_39 = L3_39.npcName
    L2_38(L3_39, false)
    L2_38 = _npc_bots
    L2_38 = L2_38[4]
    L3_39 = L2_38
    L2_38 = L2_38.terminate
    L2_38(L3_39)
    L2_38 = _npc_bots
    L2_38 = L2_38[4]
    L3_39 = L2_38
    L2_38 = L2_38.setCautionRange
    L2_38(L3_39)
    L2_38 = print
    L3_39 = "\232\170\152\229\176\142\227\130\176\227\131\170\227\130\180\227\129\175\232\166\143\229\174\154\227\129\167\227\129\175\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\166\143\229\174\154\227\130\176\227\131\170\227\130\180\233\157\158\232\161\168\231\164\186\227\129\171\227\129\151\227\129\166\227\130\191\227\131\188\227\131\159\227\131\141\227\130\164\227\131\136"
    L2_38(L3_39)
  end
  L2_38 = invokeTask
  function L3_39()
    waitSeconds(1)
    Fn_missionView("ep17_09037")
  end
  L2_38(L3_39)
  L2_38 = waitMoveToPolice
  L3_39 = L0_36
  L2_38(L3_39, L1_37)
  L2_38 = waitSeconds
  L3_39 = 3
  L2_38(L3_39)
  L2_38 = trickPolice
  L3_39 = L0_36
  L2_38(L3_39, L1_37)
  L2_38 = waitSeconds
  L3_39 = 10
  L2_38(L3_39)
  while true do
    L2_38 = _processingPcReset
    if L2_38 then
      L2_38 = wait
      L2_38()
    end
  end
  L2_38 = Fn_pcSensorOff
  L3_39 = "pccubesensor2_guide_d_02"
  L2_38(L3_39)
  L2_38 = Fn_pcSensorOn
  L3_39 = "pccubesensor2_event_03_01"
  L2_38(L3_39)
  L2_38 = Fn_pcSensorOn
  L3_39 = "pccubesensor2_event_03_02"
  L2_38(L3_39)
  L2_38 = Fn_pcSensorOn
  L3_39 = "pccubesensor2_event_03_03"
  L2_38(L3_39)
  L2_38 = Fn_pcSensorOff
  L3_39 = "pccubesensormulti2_hiroba_forbid_01"
  L2_38(L3_39)
  L2_38 = Fn_pcSensorOn
  L3_39 = "pccubesensormulti2_hiroba_forbid_02"
  L2_38(L3_39)
  L2_38 = Fn_naviKill
  L2_38()
  L2_38 = Fn_naviSet
  L3_39 = findGameObject2
  L3_39 = L3_39("Node", "locator2_target_02_sensorpos")
  L2_38(L3_39, L3_39("Node", "locator2_target_02_sensorpos"))
  while true do
    L2_38 = _partD_done
    L2_38 = L2_38 and _processingPcReset
    if L2_38 then
      L2_38 = wait
      L2_38()
    end
  end
  L2_38 = Fn_naviKill
  L2_38()
end
function part_e1()
  local L0_40
  _next_phase = false
  L0_40 = Fn_pcSensorOff
  L0_40("pccubesensor2_event_03_01")
  L0_40 = Fn_pcSensorOff
  L0_40("pccubesensor2_event_03_02")
  L0_40 = Fn_pcSensorOff
  L0_40("pccubesensor2_event_03_03")
  L0_40 = Fn_pcSensorOn
  L0_40("pccubesensor2_limit_01")
  L0_40 = Fn_pcSensorOn
  L0_40("pccubesensormulti2_hiroba_forbid_02")
  L0_40 = Player
  L0_40 = L0_40.setStay
  L0_40(L0_40, true)
  L0_40 = Fn_userCtrlAllOff
  L0_40()
  L0_40 = print
  L0_40("e1\227\129\174\230\147\141\228\189\156\231\166\129\230\173\162\239\188\129\239\188\129\239\188\129\239\188\129")
  L0_40 = Mv_viewObj
  L0_40 = L0_40("locator2_police_105_01", 0.3, 1)
  waitSeconds(1.5)
  Fn_captionViewWait("ep17_09004")
  L0_40 = Mv_safeTaskAbort(L0_40)
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_naviSet(findGameObject2("Node", _hackingData[3].start))
  Fn_missionView("ep17_02001")
  Fn_pcSensorOn("pccubesensor2_terrace_01")
  _friend.status = _FRIEND_STATUS.NORMAL
end
function part_e2()
  local L0_41, L1_42, L2_43, L3_44, L4_45, L5_46
  L0_41 = print
  L1_42 = "****part_e2"
  L0_41(L1_42)
  _next_phase = false
  _last_hacking_phase = true
  L0_41 = invokeTask
  function L1_42()
    while not _processingPcReset do
      if _npc_bots[5].status ~= NPC_STATUS.DEAD and _npc_bots[6].status ~= NPC_STATUS.DEAD and Mv_raycastCameraSight(_npc_bots[5].npcPuppet, 30, nil, nil, 0.9) and Mv_raycastCameraSight(_npc_bots[6].npcPuppet, 30, nil, nil, 0.9) and not _processingPcReset then
        Fn_captionView("ep17_09012")
        break
      end
      wait()
    end
  end
  L0_41 = L0_41(L1_42)
  repeat
    L1_42 = print
    L2_43 = "****part_e2 01"
    L1_42(L2_43)
    L1_42 = waitHacking
    L1_42()
    L1_42 = Fn_missionView
    L2_43 = "ep17_09036"
    L1_42(L2_43)
    L1_42 = _friend
    L1_42 = L1_42.target
    L2_43 = print
    L3_44 = "\226\152\133\226\152\133target ="
    L4_45 = L1_42
    L2_43(L3_44, L4_45)
    L2_43 = waitLead
    L3_44 = L1_42
    L2_43 = L2_43(L3_44)
  until L2_43 ~= false
  L3_44 = print
  L4_45 = "****part_e2 02"
  L3_44(L4_45)
  L3_44 = Sound
  L4_45 = L3_44
  L3_44 = L3_44.playSE
  L5_46 = "ep17_grigo_hacking"
  L3_44(L4_45, L5_46, 1, "", L1_42.npcPuppet)
  L3_44 = Mv_safeTaskAbort
  L4_45 = L0_41
  L3_44 = L3_44(L4_45)
  L0_41 = L3_44
  L3_44 = Fn_naviKill
  L3_44()
  L3_44 = Fn_pcSensorOff
  L4_45 = "pccubesensor2_terrace_01"
  L3_44(L4_45)
  L3_44 = Fn_pcSensorOn
  L4_45 = "pccubesensor2_guide_e_02"
  L3_44(L4_45)
  L3_44 = L1_42.npcName
  L4_45 = _npc_bots
  L4_45 = L4_45[5]
  L4_45 = L4_45.npcName
  if L3_44 ~= L4_45 then
    L3_44 = L1_42.npcName
    L4_45 = _npc_bots
    L4_45 = L4_45[6]
    L4_45 = L4_45.npcName
    if L3_44 ~= L4_45 then
      L3_44 = print
      L4_45 = "\232\170\152\229\176\142\227\129\151\227\129\159\227\129\174\227\129\175bot05\227\129\167\227\130\130\227\129\170\227\129\132\227\129\151bot06\227\129\167\227\130\130\227\129\170\227\129\139\227\129\163\227\129\159\239\188\129\239\188\129"
      L3_44(L4_45)
      _disappear_route = false
      L3_44 = L1_42.npcName
      L4_45 = _npc_bots
      L4_45 = L4_45[5]
      L4_45 = L4_45.npcName
      if L3_44 ~= L4_45 then
        L3_44 = _npc_bots
        L3_44 = L3_44[5]
        L3_44 = L3_44.status
        L4_45 = NPC_STATUS
        L4_45 = L4_45.NORMAL
        if L3_44 == L4_45 then
          L3_44 = Fn_isInSightTarget
          L4_45 = _npc_bots
          L4_45 = L4_45[5]
          L4_45 = L4_45.npcPuppet
          L5_46 = 1
          L3_44 = L3_44(L4_45, L5_46)
          if L3_44 then
            L3_44 = Camera
            L4_45 = L3_44
            L3_44 = L3_44.getEyePos
            L3_44 = L3_44(L4_45)
            L4_45 = _npc_bots
            L4_45 = L4_45[5]
            L4_45 = L4_45.npcPuppet
            L5_46 = L4_45
            L4_45 = L4_45.getWorldPos
            L4_45 = L4_45(L5_46)
            L5_46 = Query
            L5_46 = L5_46.setEyeSightTransform
            L5_46(L5_46, L3_44)
            L5_46 = Query
            L5_46 = L5_46.setEyeSightAngle
            L5_46(L5_46, Deg2Rad(50))
            L5_46 = Query
            L5_46 = L5_46.setEyeSightRange
            L5_46(L5_46, 15)
            L5_46 = Query
            L5_46 = L5_46.debugDrawEyeSight
            L5_46(L5_46, {
              r = 1,
              g = 1,
              b = 1
            })
            L5_46 = Query
            L5_46 = L5_46.raycastEyeSight
            L5_46 = L5_46(L5_46, L4_45)
            if not L5_46 then
              DebugDraw:setColor(0, 1, 0)
            else
              DebugDraw:setColor(1, 0, 0)
            end
            DebugDraw:drawLines({L3_44, L4_45})
            if false == false then
              _disappear_route = true
              print("\233\129\174\232\148\189\231\137\169\227\129\140\227\129\130\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129")
            end
          else
            L3_44 = Fn_isInSightTarget
            L4_45 = _npc_bots
            L4_45 = L4_45[5]
            L4_45 = L4_45.npcPuppet
            L5_46 = 1
            L3_44 = L3_44(L4_45, L5_46)
            if L3_44 == false then
              _disappear_route = true
              L3_44 = print
              L4_45 = "\227\130\171\227\131\161\227\131\169\229\164\150\227\129\160\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129"
              L3_44(L4_45)
            end
          end
        end
      end
      L3_44 = _disappear_route
      if L3_44 then
        L3_44 = Fn_setNpcActive
        L4_45 = _npc_bots
        L4_45 = L4_45[1]
        L4_45 = L4_45.npcName
        L5_46 = false
        L3_44(L4_45, L5_46)
        L3_44 = _npc_bots
        L3_44 = L3_44[5]
        L4_45 = L3_44
        L3_44 = L3_44.terminate
        L3_44(L4_45)
        L3_44 = _npc_bots
        L3_44 = L3_44[5]
        L4_45 = L3_44
        L3_44 = L3_44.setCautionRange
        L3_44(L4_45)
        L3_44 = print
        L4_45 = "\232\170\152\229\176\142\227\130\176\227\131\170\227\130\180\227\129\175\232\166\143\229\174\154\227\129\167\227\129\175\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\166\143\229\174\154\227\130\176\227\131\170\227\130\180\233\157\158\232\161\168\231\164\186\227\129\171\227\129\151\227\129\166\227\130\191\227\131\188\227\131\159\227\131\141\227\130\164\227\131\136"
        L3_44(L4_45)
      end
      _disappear_route = false
      L3_44 = L1_42.npcName
      L4_45 = _npc_bots
      L4_45 = L4_45[6]
      L4_45 = L4_45.npcName
      if L3_44 ~= L4_45 then
        L3_44 = _npc_bots
        L3_44 = L3_44[6]
        L3_44 = L3_44.status
        L4_45 = NPC_STATUS
        L4_45 = L4_45.NORMAL
        if L3_44 == L4_45 then
          L3_44 = Fn_isInSightTarget
          L4_45 = _npc_bots
          L4_45 = L4_45[6]
          L4_45 = L4_45.npcPuppet
          L5_46 = 1
          L3_44 = L3_44(L4_45, L5_46)
          if L3_44 then
            L3_44 = Camera
            L4_45 = L3_44
            L3_44 = L3_44.getEyePos
            L3_44 = L3_44(L4_45)
            L4_45 = _npc_bots
            L4_45 = L4_45[6]
            L4_45 = L4_45.npcPuppet
            L5_46 = L4_45
            L4_45 = L4_45.getWorldPos
            L4_45 = L4_45(L5_46)
            L5_46 = Query
            L5_46 = L5_46.setEyeSightTransform
            L5_46(L5_46, L3_44)
            L5_46 = Query
            L5_46 = L5_46.setEyeSightAngle
            L5_46(L5_46, Deg2Rad(50))
            L5_46 = Query
            L5_46 = L5_46.setEyeSightRange
            L5_46(L5_46, 15)
            L5_46 = Query
            L5_46 = L5_46.debugDrawEyeSight
            L5_46(L5_46, {
              r = 1,
              g = 1,
              b = 1
            })
            L5_46 = Query
            L5_46 = L5_46.raycastEyeSight
            L5_46 = L5_46(L5_46, L4_45)
            if not L5_46 then
              DebugDraw:setColor(0, 1, 0)
            else
              DebugDraw:setColor(1, 0, 0)
            end
            DebugDraw:drawLines({L3_44, L4_45})
            if false == false then
              disappear_route_02 = true
              print("\233\129\174\232\148\189\231\137\169\227\129\140\227\129\130\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129")
            end
          else
            L3_44 = Fn_isInSightTarget
            L4_45 = _npc_bots
            L4_45 = L4_45[6]
            L4_45 = L4_45.npcPuppet
            L5_46 = 1
            L3_44 = L3_44(L4_45, L5_46)
            if L3_44 == false then
              disappear_route_02 = true
              L3_44 = print
              L4_45 = "\227\130\171\227\131\161\227\131\169\229\164\150\227\129\160\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129"
              L3_44(L4_45)
            end
          end
        end
      end
      L3_44 = _disappear_route
      if L3_44 then
        L3_44 = Fn_setNpcActive
        L4_45 = _npc_bots
        L4_45 = L4_45[1]
        L4_45 = L4_45.npcName
        L5_46 = false
        L3_44(L4_45, L5_46)
        L3_44 = _npc_bots
        L3_44 = L3_44[6]
        L4_45 = L3_44
        L3_44 = L3_44.terminate
        L3_44(L4_45)
        L3_44 = _npc_bots
        L3_44 = L3_44[6]
        L4_45 = L3_44
        L3_44 = L3_44.setCautionRange
        L3_44(L4_45)
        L3_44 = print
        L4_45 = "\232\170\152\229\176\142\227\130\176\227\131\170\227\130\180\227\129\175\232\166\143\229\174\154\227\129\167\227\129\175\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\166\143\229\174\154\227\130\176\227\131\170\227\130\180\233\157\158\232\161\168\231\164\186\227\129\171\227\129\151\227\129\166\227\130\191\227\131\188\227\131\159\227\131\141\227\130\164\227\131\136"
        L3_44(L4_45)
      end
    end
  end
  L3_44 = invokeTask
  function L4_45()
    waitSeconds(1)
    Fn_missionView("ep17_09037")
  end
  L3_44(L4_45)
  L3_44 = waitMoveToPolice
  L4_45 = L1_42
  L5_46 = L2_43
  L3_44(L4_45, L5_46)
  L3_44 = waitSeconds
  L4_45 = 3
  L3_44(L4_45)
  L3_44 = trickPolice
  L4_45 = L1_42
  L5_46 = L2_43
  L3_44(L4_45, L5_46)
  L3_44 = print
  L4_45 = "****part_e2 03"
  L3_44(L4_45)
  L3_44 = waitSeconds
  L4_45 = 4
  L3_44(L4_45)
  L3_44 = _friend
  L4_45 = _FRIEND_STATUS
  L4_45 = L4_45.FORCED
  L3_44.status = L4_45
  L3_44 = Fn_gestureActionCancel
  L3_44()
  L3_44 = _friend
  L3_44.livelyAction = false
  L3_44 = {}
  L3_44.anim_walk_speed = 0.6
  L3_44.anim_speed_over = true
  L3_44.arrivedLength = 0.1
  L3_44.navimesh = true
  L3_44.noTurn = false
  L3_44.recast = true
  L4_45 = {}
  L4_45.startIndex = 1
  L4_45.goalDirection = true
  L5_46 = {
    {
      pos = "locator2_friend_03",
      opt = L3_44
    }
  }
  _friend_move_task[4] = Fn_moveNpc(_npc_friend, L5_46, L3_44)
  print("****part_e2 04")
  waitSeconds(6)
  while _processingPcReset do
    wait()
  end
  Fn_pcSensorOff("pccubesensormulti2_hiroba_forbid_02")
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_guide_e_02")
  Fn_naviKill()
  Fn_naviSet(findGameObject2("Node", "locator2_target_04"))
  Fn_pcSensorOn("pccubesensor2_event_04")
  if _friend_move_task[4] ~= nil then
    while _friend_move_task[4] ~= nil and _friend_move_task[4]:isRunning() do
      wait()
    end
  end
  _friend_move_task[4] = Mv_safeTaskAbort(_friend_move_task[4])
  wait()
  Fn_turnNpc(_npc_friend, "locator2_friend_03_turn")
  print("****part_e2 05")
  while not _partE_done or _processingPcReset do
    wait()
  end
  print("****part_e2 06")
  Fn_naviKill()
  Player:setStay(true)
  Fn_captionViewWait("ep17_09005")
  Player:setStay(false)
end
function part_e3()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58
  L0_47 = print
  L1_48 = "****part_e3"
  L0_47(L1_48)
  _is_part_e3 = true
  L0_47 = 0
  _next_phase = false
  L1_48 = invokeTask
  function L2_49()
    while true do
      if _reset_e3 then
        print("\231\137\185\229\136\165\231\184\174\229\176\143\227\131\170\227\131\136\227\131\169\227\130\164\229\135\166\231\144\134\233\150\139\229\167\139part_e3_phase =", L0_47)
        Fn_blackout()
        Fn_resetPcPos("locator2_target_04")
        if L0_47 >= 4 then
          Fn_warpNpc(_hackingData[3].police[1].police, "locator2_lead_03_police_105")
          Fn_warpNpc("_npc_bot_301", "locator2_bot_302_hide_pos")
          print("\230\156\128\229\190\140\227\129\174\232\173\166\229\139\153\229\174\152\227\129\168bot302\227\130\146\227\131\175\227\131\188\227\131\151")
        end
        Fn_fadein()
        Fn_userCtrlOn()
        Player:setStay(false)
        if L0_47 >= 8 and L0_47 < 10 then
          Fn_naviSet(findGameObject2("Node", "locator2_target_99"))
        end
        if L0_47 >= 5 then
          Fn_warpNpc(_hackingData[4].police[1].police, "locator2_police_05")
          Fn_warpNpc(_hackingData[4].police[2].police, "locator2_police_15")
        end
        _reset_e3 = false
        print("\231\137\185\229\136\165\231\184\174\229\176\143\227\131\170\227\131\136\227\131\169\227\130\164\229\135\166\231\144\134\231\181\130\228\186\134")
      end
      wait()
    end
  end
  L1_48(L2_49)
  L0_47 = 1
  L1_48 = Fn_kaiwaDemoView
  L2_49 = "ep17_00265k"
  L1_48(L2_49)
  L0_47 = 2
  L1_48 = _friend
  L2_49 = _FRIEND_STATUS
  L2_49 = L2_49.FORCED
  L1_48.status = L2_49
  L1_48 = Fn_gestureActionCancel
  L1_48()
  L1_48 = _friend
  L1_48.livelyAction = false
  L1_48 = {}
  L1_48.anim_walk_speed = 1.5
  L1_48.anim_speed_over = true
  L1_48.arrivedLength = 0.1
  L1_48.navimesh = true
  L1_48.noTurn = false
  L1_48.recast = true
  L2_49 = {}
  L2_49.startIndex = 1
  L2_49.goalDirection = true
  L3_50 = {
    L4_51,
    L5_52,
    L6_53,
    L7_54,
    L8_55
  }
  L4_51 = {}
  L4_51.pos = "locator2_friend_11"
  L4_51.opt = L1_48
  L5_52 = {}
  L5_52.pos = "locator2_friend_12"
  L5_52.opt = L1_48
  L6_53 = {}
  L6_53.pos = "locator2_friend_13"
  L6_53.opt = L1_48
  L7_54 = {}
  L7_54.pos = "locator2_friend_14"
  L7_54.opt = L1_48
  L8_55 = {}
  L8_55.pos = "locator2_friend_15"
  L8_55.opt = L1_48
  L4_51 = _friend_move_task
  L5_52 = Fn_moveNpc
  L6_53 = _npc_friend
  L7_54 = L3_50
  L8_55 = L1_48
  L5_52 = L5_52(L6_53, L7_54, L8_55)
  L4_51[5] = L5_52
  L0_47 = 3
  L4_51 = _friend_move_task
  L4_51 = L4_51[5]
  while true do
    if L4_51 ~= nil then
      L4_51 = _friend_move_task
      L4_51 = L4_51[5]
      if L4_51 ~= nil then
        L4_51 = _friend_move_task
        L4_51 = L4_51[5]
        L5_52 = L4_51
        L4_51 = L4_51.isRunning
        L4_51 = L4_51(L5_52)
      end
    end
    if L4_51 ~= false then
      L4_51 = wait
      L4_51()
    end
  end
  L4_51 = _friend_move_task
  L5_52 = Mv_safeTaskAbort
  L6_53 = _friend_move_task
  L6_53 = L6_53[5]
  L5_52 = L5_52(L6_53)
  L4_51[5] = L5_52
  L4_51 = wait
  L4_51()
  L0_47 = 4
  L4_51 = Fn_kaiwaDemoView
  L5_52 = "ep17_00270k"
  L4_51(L5_52)
  L0_47 = 5
  L4_51 = {}
  L4_51.anim_walk_speed = 1
  L4_51.anim_run_speed = 1
  L4_51.anim_speed_over = true
  L4_51.runLength = -1
  L4_51.arrivedLength = 0.1
  L4_51.navimesh = true
  L4_51.noTurn = false
  L4_51.recast = true
  L5_52 = {
    L6_53,
    L7_54,
    L8_55,
    L9_56,
    L10_57
  }
  L6_53 = {}
  L6_53.pos = "locator2_police_01"
  L6_53.opt = L4_51
  L7_54 = {}
  L7_54.pos = "locator2_police_02"
  L7_54.opt = L4_51
  L8_55 = {}
  L8_55.pos = "locator2_police_03"
  L8_55.opt = L4_51
  L9_56 = {}
  L9_56.pos = "locator2_police_04"
  L9_56.opt = L4_51
  L10_57 = {}
  L10_57.pos = "locator2_police_05"
  L10_57.opt = L4_51
  L6_53 = {
    L7_54,
    L8_55,
    L9_56,
    L10_57,
    L11_58
  }
  L7_54 = {}
  L7_54.pos = "locator2_police_11"
  L7_54.opt = L4_51
  L8_55 = {}
  L8_55.pos = "locator2_police_12"
  L8_55.opt = L4_51
  L9_56 = {}
  L9_56.pos = "locator2_police_13"
  L9_56.opt = L4_51
  L10_57 = {}
  L10_57.pos = "locator2_police_14"
  L10_57.opt = L4_51
  L11_58 = {}
  L11_58.pos = "locator2_police_15"
  L11_58.opt = L4_51
  L7_54 = {L8_55, L9_56}
  L8_55 = {}
  L8_55.pos = "locator2_lead_04_police_106"
  L9_56 = {}
  L9_56.pos = "locator2_lead_04_police_106"
  L9_56.opt = L4_51
  L8_55 = {L9_56, L10_57}
  L9_56 = {}
  L9_56.pos = "locator2_lead_04_police_107"
  L10_57 = {}
  L10_57.pos = "locator2_lead_04_police_107"
  L10_57.opt = L4_51
  L9_56 = Fn_moveNpc
  L10_57 = _hackingData
  L10_57 = L10_57[4]
  L10_57 = L10_57.police
  L10_57 = L10_57[1]
  L10_57 = L10_57.police
  L11_58 = L7_54
  L9_56(L10_57, L11_58)
  L9_56 = Fn_moveNpc
  L10_57 = _hackingData
  L10_57 = L10_57[4]
  L10_57 = L10_57.police
  L10_57 = L10_57[2]
  L10_57 = L10_57.police
  L11_58 = L8_55
  L9_56(L10_57, L11_58)
  L0_47 = 6
  L9_56 = _friend
  L10_57 = _FRIEND_STATUS
  L10_57 = L10_57.FORCED
  L9_56.status = L10_57
  L9_56 = {}
  L9_56.anim_walk_speed = 1.5
  L9_56.anim_speed_over = true
  L9_56.arrivedLength = 0.1
  L9_56.navimesh = true
  L9_56.noTurn = false
  L9_56.recast = true
  L10_57 = {}
  L10_57.startIndex = 1
  L10_57.goalDirection = true
  L11_58 = {
    {
      pos = "locator2_friend_16",
      opt = L9_56
    },
    {
      pos = "locator2_friend_17",
      opt = L9_56
    },
    {
      pos = "locator2_friend_99",
      opt = L9_56
    }
  }
  _friend_move_task[6] = Fn_moveNpc(_npc_friend, L11_58, L9_56)
  L0_47 = 7
  Fn_pcSensorOn("pccubesensor2_event_99")
  L0_47 = 8
  Fn_naviSet(findGameObject2("Node", "locator2_target_99"))
  L0_47 = 9
  while not _goal do
    wait()
  end
  L0_47 = 10
  Fn_naviKill()
  L0_47 = 11
  _is_part_e3 = false
end
function dispatchRequestTask()
  local L0_59, L1_60, L2_61, L3_62, L4_63, L6_64
  L0_59 = _request
  L0_59 = #L0_59
  for L4_63 = 1, L0_59 do
    L6_64 = _requestResult
    L6_64[_request[L4_63].id] = _request[L4_63].command(_request[L4_63].param)
  end
  _request = L1_60
end
function getRequestId()
  local L0_65
  L0_65 = _requestId
  L0_65 = L0_65 + 1
  _requestId = L0_65
  L0_65 = _requestId
  if L0_65 > _MAX_REQUEST_ID then
    _requestId = 0
  end
  L0_65 = _requestId
  return L0_65
end
function getRequestResult(A0_66)
  return _requestResult[A0_66]
end
function Finalize()
  local L0_67, L1_68
end
function testFunction(A0_69)
  local L1_70, L2_71
  L1_70 = A0_69[1]
  L2_71 = A0_69[2]
  L1_70 = L1_70 + L2_71
  L2_71 = A0_69[3]
  L1_70 = L1_70 + L2_71
  return L1_70
end
function requestSection(A0_72)
  table.insert(_request, {
    id = getRequestId(),
    command = ingameSection,
    param = {A0_72}
  })
  return (getRequestId())
end
function lookAtNodeWait(A0_73, A1_74, A2_75)
  invokeTask(function()
    Fn_lookAtObjectWait(A0_73, A1_74, A2_75)
  end)
end
function notify(A0_76, A1_77)
  _eventFlag[A0_76] = A1_77
end
function getNextPhase()
  local L0_78, L1_79
  L0_78 = _next_phase
  return L0_78
end
function resetNextPhase()
  local L0_80, L1_81
  _next_phase = false
end
function checkMissionRetry()
  local L0_82, L1_83
  L0_82 = _missionRetry
  return L0_82
end
function resetMissionRetry()
  local L0_84, L1_85
  _missionRetry = false
  _processingPcReset = false
end
function requestTestFunction(A0_86, A1_87, A2_88)
  table.insert(_request, {
    id = getRequestId(),
    command = testFunction,
    param = {
      A0_86,
      A1_87,
      A2_88
    }
  })
  return (getRequestId())
end
function friendInit()
  friendDamaged = {}
  friendDamaged[1] = function()
    Fn_captionView("ep17_09006")
  end
  friendDamaged[2] = function()
    Fn_captionView("ep17_09007")
  end
  friendDamaged[3] = function()
    Fn_captionView("ep17_09008")
  end
  Fn_findNpc(_npc_friend):changeDamageType(2)
  Fn_findNpc(_npc_friend):setEventListener("npcDamaged", function(A0_89)
    if A0_89.attacker == "player" then
      friendDamaged[RandI(1, 3)]()
    end
  end)
  _friend.status = _FRIEND_STATUS.NOP
  friendAction()
end
function friendAction()
  local L0_90, L1_91, L2_92, L3_93
  function L0_90()
    local L0_94, L1_95, L2_96, L3_97, L4_98
    L0_94 = Sound
    L1_95 = L0_94
    L0_94 = L0_94.playSE
    L2_96 = "ep17_grigo_move"
    L3_97 = 1
    L4_98 = ""
    L0_94(L1_95, L2_96, L3_97, L4_98, Fn_findNpcPuppet(_npc_friend))
    L0_94 = _friend
    L1_95 = _FRIEND_STATUS
    L1_95 = L1_95.STAY
    L0_94.status = L1_95
  end
  function L1_91()
    local L0_99, L1_100, L2_101, L3_102, L4_103
    L0_99 = Sound
    L1_100 = L0_99
    L0_99 = L0_99.playSE
    L2_101 = "ep17_grigo_move"
    L3_102 = 1
    L4_103 = ""
    L0_99(L1_100, L2_101, L3_102, L4_103, Fn_findNpcPuppet(_npc_friend))
    L0_99 = _friend
    L1_100 = _FRIEND_STATUS
    L1_100 = L1_100.NORMAL
    L0_99.status = L1_100
  end
  L2_92 = {}
  L3_93 = {}
  L3_93.id = "ep17_09009"
  L3_93.func = L0_90
  L2_92.RL = L3_93
  L3_93 = {}
  L3_93.RL = {id = "ep17_09010", func = L1_91}
  invokeTask(function()
    local L0_104, L1_105
    L0_104.livelyAction = false
    while true do
      if L0_104 == L1_105 then
        L1_105.anim_walk_speed = 0.7
        L1_105.anim_run_speed = 0.7
        L1_105.anim_speed_over = true
        L1_105.runLength = -1
        L1_105.arrivedLength = 3
        L1_105.navimesh = true
        L1_105.noTurn = false
        L1_105.recast = true
        if L0_104:isMoveEnd() and 3 < Fn_getDistanceToPlayer(Fn_findNpcPuppet(_npc_friend):getWorldPos()) then
          _friend_move_task[7] = Fn_moveNpc(_npc_friend, {
            Fn_getPlayer()
          }, L1_105)
        end
        for _FORV_5_ = 1, #_npc_bots do
          if 3 > Fn_get_distance(Fn_findNpcPuppet(_npc_friend):getWorldPos(), _npc_bots[_FORV_5_].npcPuppet:getWorldPos()) and _friend.hackEnable and (_npc_bots[_FORV_5_].status == NPC_STATUS.NORMAL or _npc_bots[_FORV_5_].status == NPC_STATUS.CAUTION or _npc_bots[_FORV_5_].status == NPC_STATUS.ALERT) then
            _friend.status = _FRIEND_STATUS.HACK
            _friend.target = _npc_bots[_FORV_5_]
            break
          end
        end
        if Fn_getDistanceToPlayer(Fn_findNpcPuppet(_npc_friend)) < 2 and _processingPcReset == false then
          if not _friend.livelyAction then
            Fn_captionViewEnd()
            Fn_gestureAction(L2_92)
            _friend.livelyAction = true
          end
        elseif _friend.livelyAction then
          Fn_gestureActionCancel()
          _friend.livelyAction = false
        end
      elseif L0_104 == L1_105 then
        for _FORV_3_ = 1, #L1_105 do
          if 3 > Fn_get_distance(Fn_findNpcPuppet(_npc_friend):getWorldPos(), _npc_bots[_FORV_3_].npcPuppet:getWorldPos()) and _friend.hackEnable and (_npc_bots[_FORV_3_].status == NPC_STATUS.NORMAL or _npc_bots[_FORV_3_].status == NPC_STATUS.CAUTION or _npc_bots[_FORV_3_].status == NPC_STATUS.ALERT) then
            _friend.status = _FRIEND_STATUS.HACK
            _friend.target = _npc_bots[_FORV_3_]
            break
          end
        end
        if L0_104 < 2 then
          if L0_104 == false then
            if not L0_104 then
              if not L0_104 then
                L0_104()
                L0_104(L1_105)
                L0_104.livelyAction = true
              end
            end
          end
        elseif L0_104 then
          L0_104()
          L0_104.livelyAction = false
        end
      end
      if L0_104 == L1_105 then
        L0_104(L1_105, _friend.target.npcPuppet)
        L0_104(L1_105)
        L0_104(L1_105, "ep17_grigo_hacking", 1, "", _friend.target.npcPuppet)
        L0_104(L1_105)
        L0_104(L1_105)
        L0_104(L1_105)
        L0_104(L1_105)
        _any_hack = true
        L0_104.status = L1_105
      else
      end
      L0_104()
    end
  end)
end
function npcInit()
  local L0_106, L1_107, L2_108, L3_109, L4_110, L5_111, L6_112, L7_113
  L0_106 = {
    L1_107,
    L2_108,
    L3_109,
    L4_110,
    L5_111,
    L6_112,
    L7_113
  }
  L1_107 = "locator2_police_101_01"
  L6_112 = "locator2_police_106_01"
  L7_113 = "locator2_police_107_01"
  L1_107 = {}
  for L5_111, L6_112 in L2_108(L3_109) do
    L7_113 = {}
    L7_113.name = _policeNameList[L5_111]
    L7_113.type = "man31"
    L7_113.node = L6_112
    L7_113.start = true
    L7_113.attach = true
    L7_113.reset = true
    L1_107[L5_111] = L7_113
  end
  L2_108(L3_109)
  for L5_111, L6_112 in L2_108(L3_109) do
    L7_113 = {
      "lookaround_01",
      "lookaround",
      "stay",
      "stay_01",
      "stay_02"
    }
    _police_motion[L6_112] = Fn_playLoopMotionRand(L6_112, L7_113, 5, 10)
  end
  L2_108(L3_109)
  L4_110.pos = "locator2_bot_101_01"
  L4_110.opt = nil
  L5_111.pos = "locator2_bot_101_02"
  L5_111.opt = nil
  L6_112 = {}
  L6_112.pos = "locator2_bot_101_03"
  L6_112.opt = nil
  L7_113 = {}
  L7_113.pos = "locator2_bot_101_04"
  L7_113.opt = nil
  L5_111.pos = "locator2_bot_102_01"
  L5_111.opt = nil
  L6_112 = {}
  L6_112.pos = "locator2_bot_102_02"
  L6_112.opt = nil
  L7_113 = {}
  L7_113.pos = "locator2_bot_102_03"
  L7_113.opt = nil
  L6_112 = {}
  L6_112.pos = "locator2_bot_103_01"
  L6_112.opt = nil
  L7_113 = {}
  L7_113.pos = "locator2_bot_103_02"
  L7_113.opt = nil
  L6_112 = {
    L7_113,
    {
      pos = "locator2_bot_201_02",
      opt = nil
    },
    {
      pos = "locator2_bot_201_03",
      opt = nil
    },
    {
      pos = "locator2_bot_201_04",
      opt = nil
    },
    {
      pos = "locator2_bot_201_05",
      opt = nil
    },
    {
      pos = "locator2_bot_201_06",
      opt = nil
    }
  }
  L7_113 = {}
  L7_113.pos = "locator2_bot_201_01"
  L7_113.opt = nil
  L7_113 = {
    {
      pos = "locator2_bot_301_01",
      opt = nil
    },
    {
      pos = "locator2_bot_301_02",
      opt = nil
    },
    {
      pos = "locator2_bot_301_03",
      opt = nil
    },
    {
      pos = "locator2_bot_301_04",
      opt = nil
    }
  }
  _npc_bots = L3_109
  for L6_112 = 1, _MAX_BOT do
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    if L7_113 ~= nil then
      L7_113 = _npc_bots
      L7_113 = L7_113[L6_112]
      L7_113 = L7_113.taskAbort
      L7_113(L7_113)
    end
    L7_113 = _npc_bots
    L7_113[L6_112] = PerceivableNpc.new(_botNameList[L6_112])
    L7_113 = Fn_setNpcActive
    L7_113(_botNameList[L6_112], true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setCautionMode
    L7_113(L7_113, 2)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setAlertRange
    L7_113(L7_113, 3)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setCautionRange
    L7_113(L7_113, 9.2)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setPosList
    L7_113(L7_113, L2_108[L6_112])
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setChangeRouteImmediately
    L7_113(L7_113, true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setMoveOption
    L7_113(L7_113, _move_option_bot_normal)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setLoop
    L7_113(L7_113, true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setChaseMoveOption
    L7_113(L7_113, _move_option_bot_alert)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setOnChangeState
    L7_113(L7_113, botEvent)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setCombatReady
    L7_113(L7_113, false)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setCombatTimeEnable
    L7_113(L7_113, true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setCombatTime
    L7_113(L7_113, 60)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setCombatReadyIfDamaged
    L7_113(L7_113, true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setEnemyGenerator
    L7_113(L7_113, findGameObject2("EnemyGenerator", "enmgen2_for_npcGenerator"))
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setChaseMode
    L7_113(L7_113, true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setDetectGravity
    L7_113(L7_113, true)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setStayMotion
    L7_113(L7_113, "stay")
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setDismissMotion
    L7_113(L7_113, "stay")
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.setLivelyActionEnable
    L7_113(L7_113, false)
    L7_113 = _npc_bots
    L7_113 = L7_113[L6_112]
    L7_113 = L7_113.action
    L7_113(L7_113)
    L7_113 = _npcTable
    L7_113[L6_112] = _npc_bots[L6_112]
  end
  L3_109(L4_110)
end
function botAction(A0_114)
  invokeTask(function()
    local L0_115, L1_116
    L0_115 = 0
    while true do
      L1_116 = _npc_bots
      L1_116 = L1_116[A0_114]
      if L1_116 ~= nil then
        L1_116 = _npc_bots
        L1_116 = L1_116[A0_114]
        L1_116 = L1_116.status
        if L1_116 == NPC_STATUS.HACKED then
          L0_115 = L0_115 - 1
          if L0_115 < 0 then
            L1_116 = findGameObject2
            L1_116 = L1_116("Node", _npc_bots[A0_114].npcName .. "_hacked")
            Fn_createEffect("ef_com_hit_00_s", "ef_com_hit_00_s", L1_116, false)
            L0_115 = 60
          end
        end
        L1_116 = wait
        L1_116()
      end
    end
  end)
end
function pccubesensormulti2_hiroba_forbid_01_OnEnter()
  if _processingPcReset then
    return
  end
  detectedInTheSky()
end
function pccubesensor2_limit_01_OnEnter(A0_117)
  local L1_118
end
function pccubesensor2_limit_01_OnLeave(A0_119)
  if _processingPcReset then
    return
  end
  detectedInTheSky()
end
function pccubesensor2_event_01_OnEnter(A0_120)
  _sdemo1_ready = true
  Fn_pcSensorOff(A0_120)
end
function pccubesensor2_event_02_OnEnter(A0_121)
  local L1_122
  _sdemo2_ready = true
end
function pccubesensor2_event_03_OnEnter(A0_123)
  if Player:getAttrTune() ~= Player.kAttrTune_Normal then
    Player:setAttrTune(Player.kAttrTune_Normal, false)
  end
  if Player:isGravityControlMode() then
    Fn_coercionGravityRevert()
    Player:setStay(true)
  else
    Fn_userCtrlOff()
  end
  _partD_done = true
end
function pccubesensor2_event_04_OnEnter(A0_124)
  local L1_125
  _partE_done = true
end
function pccubesensor2_event_05_OnEnter(A0_126)
  Fn_pcSensorOff("pccubesensor2_event_05")
  if _npc_bots[5].status == NPC_STATUS.DEAD or _npc_bots[6].status ~= NPC_STATUS.DEAD then
  end
end
function pccubesensor2_event_88_OnEnter(A0_127)
  if not _kaiwa.ep17_00265k then
    Fn_captionView("ep17_09013")
  end
end
function pccubesensor2_event_99_OnEnter(A0_128)
  local L1_129
  _goal = true
end
function pccubesensor2_event_01_OnLeave(A0_130)
  local L1_131
  _sdemo1_ready = false
end
function pccubesensor2_event_02_OnLeave(A0_132)
  local L1_133
end
function pccubesensor2_event_03_OnLeave(A0_134)
  local L1_135
end
function pccubesensor2_event_04_OnLeave(A0_136)
  local L1_137
  _partE_done = false
end
function pccubesensor2_event_05_OnLeave(A0_138)
  local L1_139
end
function pccubesensor2_event_88_OnLeave(A0_140)
  local L1_141
end
function pccubesensor2_event_99_OnLeave(A0_142)
  local L1_143
end
function pccubesensor2_hide_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_hide_01")
  Fn_naviKill()
end
function pccubesensor2_terrace_01_OnEnter()
  local L0_144, L1_145
  _in_terrace_sensor = true
end
function pccubesensor2_terrace_01_OnLeave()
  local L0_146, L1_147
  _in_terrace_sensor = false
end
function pccubesensor2_guide_c_01_OnLeave()
  Fn_naviSet(Fn_findNpcPuppet(_npc_friend))
  Fn_captionView("ep17_09040")
end
function pccubesensor2_guide_c_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_guide_c_02_OnLeave()
  Fn_naviSet(findGameObject2("Node", _hackingData[1].start))
  Fn_captionView("ep17_09040")
end
function pccubesensor2_guide_c_02_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_guide_d_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_info_navi_01"))
  Fn_captionView("ep17_09040")
end
function pccubesensor2_guide_d_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_guide_d_02_OnLeave()
  Fn_naviSet(findGameObject2("Node", _hackingData[2].start))
  Fn_captionView("ep17_09040")
end
function pccubesensor2_guide_d_02_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_guide_e_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_backstreet_e_01"))
  Fn_captionView("ep17_09040")
end
function pccubesensor2_guide_e_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_guide_e_02_OnLeave()
  Fn_naviSet(findGameObject2("Node", _hackingData[3].start))
  Fn_captionView("ep17_09040")
end
function pccubesensor2_guide_e_02_OnEnter()
  Fn_naviKill()
end
function botEvent(A0_148, A1_149)
  if _processingPcReset or _is_demo_time then
    return
  end
  if A1_149 == CALLBACK_REASON.DAMAGED then
    Fn_captionView("ep17_09014")
  elseif A1_149 == CALLBACK_REASON.DIED then
    _any_hack = false
  elseif A1_149 == CALLBACK_REASON.BEGIN_COMBAT then
    Fn_captionView("ep17_09015")
  elseif A1_149 == CALLBACK_REASON.IS_INSIGHT then
    Fn_captionView("ep17_09016")
    invokeTask(function()
      waitSeconds(2)
      Sound:playSE("kit_529", 1, Fn_getPlayer())
    end)
  elseif A1_149 == CALLBACK_REASON.RECEIVE_REPORT then
    Fn_captionView("ep17_09017")
  elseif A1_149 == CALLBACK_REASON.OUT_OF_RANGE then
    Fn_captionView("ep17_09018")
  elseif A1_149 == CALLBACK_REASON.CAUTION_OVERFLOW then
    Fn_captionView("ep17_09019")
  elseif A1_149 == CALLBACK_REASON.LOST_TARGET then
    Fn_captionView("ep17_09020")
  elseif A1_149 == CALLBACK_REASON.NO_CAUTION then
    Fn_captionView("ep17_09021")
  elseif A1_149 == CALLBACK_REASON.DETECTED_GRAVITY then
    Fn_captionViewWait("ep17_09022")
    if _processingPcReset == false and _is_demo_time == fasle then
      Fn_captionViewWait("ep17_09039")
    end
  elseif A1_149 == CALLBACK_REASON.TARGET_CAPTURE then
    if _processingPcReset == false then
      detectedByGrigo(A0_148)
    end
  elseif A1_149 == CALLBACK_REASON.FORCED_TERMINATION then
  end
end
function policeEvent(A0_150, A1_151)
  if _processingPcReset or _is_demo_time then
    return
  end
  if A1_151 == CALLBACK_REASON.DAMAGED then
    Fn_captionView("ep17_09023")
  elseif A1_151 == CALLBACK_REASON.IS_INSIGHT or A1_151 == CALLBACK_REASON.TARGET_CAPTURE or A1_151 == CALLBACK_REASON.CAUTION_OVERFLOW or A1_151 == CALLBACK_REASON.INDICATION_OVERFLOW then
    if _processingPcReset == false then
      detectedByPolice(A0_150)
    end
  elseif A1_151 == CALLBACK_REASON.RECEIVE_REPORT then
    Fn_captionView("ep17_09024")
  elseif A1_151 == CALLBACK_REASON.OUT_OF_RANGE then
    Fn_captionView("ep17_09025")
  elseif A1_151 == CALLBACK_REASON.LOST_TARGET then
    Fn_captionView("ep17_09026")
  elseif A1_151 == CALLBACK_REASON.NO_CAUTION then
    Fn_captionView("ep17_09027")
  elseif A1_151 == CALLBACK_REASON.FORCED_TERMINATION then
  end
end
function detectedByGrigo(A0_152, A1_153)
  local L2_154, L3_155, L4_156, L5_157, L6_158
  if L2_154 then
    return
  end
  L2_154(L3_155)
  _processingPcReset = true
  L2_154()
  L2_154()
  L2_154(L3_155)
  L2_154(L3_155)
  L2_154()
  L2_154()
  for L5_157 = 1, 7 do
    L6_158 = _friend_move_task
    L6_158 = L6_158[L5_157]
    if L6_158 ~= nil then
      L6_158 = _friend_move_task
      L6_158[L5_157] = Mv_safeTaskAbort(_friend_move_task[L5_157])
    end
  end
  L2_154(L3_155, L4_156)
  L2_154(L3_155)
  L2_154()
  L2_154(L3_155)
  L2_154()
  if L2_154 == false then
    for L5_157, L6_158 in L2_154(L3_155) do
      Fn_warpNpc(L6_158, L6_158)
    end
    for L5_157, L6_158 in L2_154(L3_155) do
      Fn_warpNpc(L6_158, L6_158)
    end
  end
  L2_154(L3_155)
  L2_154(L3_155)
  L2_154(L3_155)
  for L5_157 = 1, _MAX_BOT do
    L6_158 = _npc_bots
    L6_158 = L6_158[L5_157]
    L6_158 = L6_158.restart
    L6_158(L6_158)
  end
  L2_154(L3_155)
  L2_154(L3_155, L4_156)
  _missionRetry = true
end
function detectedByPolice(A0_159)
  local L1_160, L2_161, L3_162, L4_163, L5_164, L6_165
  if L1_160 then
    return
  end
  L1_160(L2_161)
  _processingPcReset = true
  L1_160()
  L1_160()
  for L4_163 = 1, _MAX_POLICE do
    L5_164 = Fn_playMotionNpc
    L6_165 = _policeNameList
    L6_165 = L6_165[L4_163]
    L5_164(L6_165, "stay", false)
  end
  L1_160(L2_161)
  L1_160()
  L1_160()
  for L4_163 = 1, 7 do
    L5_164 = _friend_move_task
    L5_164 = L5_164[L4_163]
    if L5_164 ~= nil then
      L5_164 = _friend_move_task
      L6_165 = Mv_safeTaskAbort
      L6_165 = L6_165(_friend_move_task[L4_163])
      L5_164[L4_163] = L6_165
    end
  end
  L1_160(L2_161, L3_162)
  L1_160(L2_161)
  L1_160.anim_turn_l = "man01_turn_l_00"
  L1_160.anim_turn_r = "man01_turn_r_00"
  for L5_164 = 1, 7 do
    L6_165 = invokeTask
    L6_165(function()
      waitSeconds(0.2 * RandI(1, 3))
      Fn_findNpc(_policeNameList[L5_164]):turn(Fn_getPlayer(), L1_160)
      while not Fn_findNpc(_policeNameList[L5_164]):isTurnEnd() do
        wait()
      end
      waitSeconds(0.1 * RandI(0, 3))
      if RandI(0, 3) == 0 then
        Fn_playMotionNpc("npcgen2_police_10" .. string.format("%d", L5_164), "surprise", true)
      end
      waitSeconds(0.2 * RandI(1, 3))
      Fn_playNpcEventMotion("npcgen2_police_10" .. string.format("%d", L5_164), _mot_list.whistle, false, 0, false)
      print("\232\173\166\229\139\153\229\174\152\239\188\154\231\172\155\229\144\185\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\239\188\129")
      wait(18)
      Sound:playSE("ene_human_whistle_m51", 1, "", Fn_findNpcPuppet(_policeNameList[L5_164]))
      print("\231\172\155SE\239\188\129\239\188\129")
    end)
    break
  end
  L6_165 = L3_162(L4_163)
  L2_161(L3_162, L4_163, L5_164, L6_165, L3_162(L4_163))
  L2_161(L3_162)
  L2_161()
  L2_161(L3_162)
  L2_161()
  if L2_161 == false then
    for L5_164, L6_165 in L2_161(L3_162) do
      Fn_warpNpc(L6_165, L6_165)
    end
    for L5_164, L6_165 in L2_161(L3_162) do
      Fn_warpNpc(L6_165, L6_165)
    end
  end
  L2_161(L3_162)
  L2_161(L3_162)
  L2_161(L3_162)
  for L5_164 = 1, _MAX_BOT do
    L6_165 = _npc_bots
    L6_165 = L6_165[L5_164]
    L6_165 = L6_165.restart
    L6_165(L6_165)
  end
  L2_161(L3_162)
  L2_161()
  L2_161(L3_162, L4_163)
  for L5_164 = 1, _MAX_POLICE do
  end
  _missionRetry = true
end
function detectedInTheSky()
  if _processingPcReset then
    return
  end
  print("\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\166\227\131\170\227\131\136\227\131\169\227\130\164")
  invokeTask(function()
    local L0_166, L1_167, L2_168, L3_169, L4_170
    _processingPcReset = true
    L0_166()
    L0_166()
    L0_166(L1_167)
    L0_166(L1_167)
    L3_169 = false
    L0_166(L1_167, L2_168, L3_169)
    L0_166()
    for L3_169 = 1, 7 do
      L4_170 = _friend_move_task
      L4_170 = L4_170[L3_169]
      if L4_170 ~= nil then
        L4_170 = _friend_move_task
        L4_170[L3_169] = Mv_safeTaskAbort(_friend_move_task[L3_169])
      end
    end
    L0_166(L1_167, L2_168)
    L0_166(L1_167)
    L0_166(L1_167)
    L0_166()
    L0_166(L1_167)
    L0_166()
    if L0_166 == false then
      for L3_169, L4_170 in L0_166(L1_167) do
        Fn_warpNpc(L4_170, L4_170)
      end
      for L3_169, L4_170 in L0_166(L1_167) do
        Fn_warpNpc(L4_170, L4_170)
      end
    end
    L0_166(L1_167)
    L0_166(L1_167)
    L0_166(L1_167)
    for L3_169 = 1, _MAX_BOT do
      L4_170 = _npc_bots
      L4_170 = L4_170[L3_169]
      L4_170 = L4_170.restart
      L4_170(L4_170)
    end
    L0_166(L1_167)
    L0_166(L1_167, L2_168)
    _missionRetry = true
  end)
end
function waitHacking()
  _friend.target = nil
  _friend.hackEnable = true
  while _friend.target == nil or _friend.target.status ~= NPC_STATUS.HACKED do
    wait()
  end
  _friend.hackEnable = false
end
function waitLead(A0_171)
  local L1_172, L2_173, L3_174, L4_175, L5_176, L6_177, L7_178
  L1_172 = false
  while not L1_172 do
    if L2_173 ~= 0 then
      if L2_173 ~= L3_174 then
      end
    elseif L2_173 == L3_174 then
      return L2_173
    end
    if L2_173 == false then
      for L5_176 = 1, #L3_174 do
        L6_177 = getNodePos
        L7_178 = _hackingData
        L7_178 = L7_178[L5_176]
        L7_178 = L7_178.start
        L6_177 = L6_177(L7_178)
        L7_178 = A0_171.npcPuppet
        L7_178 = L7_178.getWorldPos
        L7_178 = L7_178(L7_178)
        if Fn_get_distance(L6_177, L7_178) < 10 and _hackingData[L5_176].done == false and A0_171.status == NPC_STATUS.HACKED then
          _hackingData[L5_176].done = true
          L1_172 = true
          result = L5_176
          break
        end
      end
    elseif L2_173 then
      for L5_176 = 1, #L3_174 do
        L6_177 = getNodePos
        L7_178 = _hackingData
        L7_178 = L7_178[L5_176]
        L7_178 = L7_178.start
        L6_177 = L6_177(L7_178)
        L7_178 = A0_171.npcPuppet
        L7_178 = L7_178.getWorldPos
        L7_178 = L7_178(L7_178)
        if Fn_get_distance(L6_177, L7_178) < 10 and _hackingData[L5_176].done == false and A0_171.status == NPC_STATUS.HACKED and _in_terrace_sensor then
          _hackingData[L5_176].done = true
          L1_172 = true
          result = L5_176
          break
        end
      end
    end
    L2_173()
  end
  return L2_173
end
function waitMoveToPolice(A0_179, A1_180)
  local L2_181, L3_182, L4_183, L5_184, L6_185
  L2_181 = {}
  L2_181.anim_walk_speed = 0.6
  L2_181.anim_speed_over = true
  L2_181.arrivedLength = 0.1
  L2_181.navimesh = true
  L2_181.noTurn = false
  L2_181.recast = true
  L3_182 = {}
  L3_182.startIndex = 1
  L3_182.goalDirection = true
  L4_183 = {L5_184}
  L5_184 = {}
  L6_185 = _hackingData
  L6_185 = L6_185[A1_180]
  L6_185 = L6_185.start
  L5_184.pos = L6_185
  L5_184.opt = L2_181
  L6_185 = A0_179
  L5_184 = A0_179.terminate
  L5_184(L6_185)
  L6_185 = A0_179
  L5_184 = A0_179.setPosList
  L5_184(L6_185, L4_183)
  L5_184 = _target_move_task
  L6_185 = Fn_moveNpc
  L6_185 = L6_185(A0_179.npcName, {
    _hackingData[A1_180].start
  }, L2_181)
  L5_184[1] = L6_185
  L5_184 = Fn_captionView
  L6_185 = "ep17_09034"
  L5_184(L6_185)
  while true do
    L5_184 = Fn_findNpcPuppet
    L6_185 = A0_179.npcName
    L5_184 = L5_184(L6_185)
    L6_185 = L5_184
    L5_184 = L5_184.getWorldPos
    L5_184 = L5_184(L6_185)
    L6_185 = findGameObject2
    L6_185 = L6_185("Node", _hackingData[A1_180].start)
    L6_185 = L6_185.getWorldPos
    L6_185 = L6_185(L6_185)
    if not (Fn_get_distance(L5_184, L6_185) < 1.5) or _target_move_task[1]:isRunning() ~= false then
      wait()
    end
  end
  L5_184 = _target_move_task
  L6_185 = Mv_safeTaskAbort
  L6_185 = L6_185(_target_move_task[1])
  L5_184[1] = L6_185
  _any_hack = false
end
function trickPolice(A0_186, A1_187)
  local L2_188, L3_189, L4_190, L5_191, L6_192, L7_193, L8_194, L9_195, L10_196, L11_197
  L2_188 = {}
  for L6_192 = 1, #L4_190 do
    for L10_196 = 1, #L8_194 do
      L11_197 = _policeNameList
      L11_197 = L11_197[L10_196]
      if L11_197 == _hackingData[A1_187].police[L6_192].police then
        L11_197 = _hackingData
        L11_197 = L11_197[A1_187]
        L11_197 = L11_197.police
        L11_197 = L11_197[L6_192]
        L11_197.instance = _policeNameList[L10_196]
        L11_197 = table
        L11_197 = L11_197.insert
        L11_197(L2_188, _hackingData[A1_187].police[L6_192])
      end
    end
  end
  L3_189.anim_turn_l = "man01_turn_l_00"
  L3_189.anim_turn_r = "man01_turn_r_00"
  if not L4_190 then
    for L7_193 = 1, #L2_188 do
      L8_194(L9_195)
      L11_197 = _police_motion
      L11_197 = L11_197[L2_188[L7_193].instance]
      L8_194(L9_195, L10_196, L11_197)
      L11_197 = L3_189
      L8_194(L9_195, L10_196, L11_197)
      while true do
        if not L8_194 then
          L8_194()
        end
      end
      if not L8_194 then
      end
    end
  end
  L4_190()
  while true do
    if L4_190 then
      L4_190()
    end
  end
  if not L4_190 then
    for L7_193 = 1, #L2_188 do
      L11_197 = "talk_00"
      L9_195(L10_196, L11_197, false)
    end
    L4_190(L5_191)
    L4_190(L5_191, L6_192, L7_193, L8_194, L9_195)
  end
  L4_190(L5_191)
  while true do
    if L4_190 then
      L4_190()
    end
  end
  L4_190.anim_walk_speed = 0.35
  L4_190.anim_speed_over = false
  L4_190.arrivedLength = 0.1
  L4_190.runLength = 99999
  L4_190.navimesh = false
  L4_190.noTurn = false
  L4_190.recast = true
  L5_191.startIndex = 1
  L5_191.goalDirection = true
  L7_193.pos = L8_194
  L7_193.opt = L4_190
  L7_193(L8_194)
  L7_193(L8_194, L9_195)
  L11_197 = _hackingData
  L11_197 = L11_197[A1_187]
  L11_197 = L11_197.goal
  L11_197 = L4_190
  L7_193[2] = L8_194
  L7_193.anim_walk_speed = 1
  L7_193.runLength = 99999
  L7_193.arrivedLength = 0.1
  L7_193.navimesh = false
  L7_193.noTurn = false
  L7_193.recast = true
  L7_193.anim_walk = "man01_walk_00"
  L7_193.anim_walk_b = "man01_walk_b_00"
  L7_193.anim_run = "man01_run_00"
  for L11_197 = 1, #L2_188 do
    invokeTask(function()
      waitSeconds(3)
      while _processingPcReset do
        print("\227\131\170\227\131\136\227\131\169\227\130\164\229\135\166\231\144\134\228\184\173\227\129\170\227\129\174\227\129\167trickPolice\232\173\166\229\174\152\231\167\187\229\139\149\227\129\190\227\129\167\233\128\178\227\129\190\227\129\155\227\129\170\227\129\132")
        wait()
      end
      Fn_moveNpc(L2_188[L11_197].instance, {
        L2_188[L11_197].goal
      }, L7_193)
      print("\232\173\166\229\174\152\231\167\187\229\139\149\233\150\139\229\167\139\239\188\154", L2_188[L11_197].instance, L2_188[L11_197].goal)
      invokeTask(function()
        local L0_198
        while true do
          L0_198 = Fn_findNpc
          L0_198 = L0_198(L2_188[L11_197].instance)
          L0_198 = L0_198.isMoveEnd
          L0_198 = L0_198(L0_198)
          if L0_198 then
            L0_198 = Fn_findNpc
            L0_198 = L0_198(L2_188[L11_197].instance)
            L0_198 = L0_198.isTurnEnd
            L0_198 = L0_198(L0_198)
            if L0_198 then
              L0_198 = {
                "lookaround_01",
                "lookaround",
                "stay",
                "stay_01",
                "stay_02"
              }
              _police_motion[L2_188[L11_197].instance] = Fn_playLoopMotionRand(L2_188[L11_197].instance, L0_198, 5, 10)
              print("\232\173\166\229\139\153\229\174\152\232\170\152\229\176\142\227\129\149\227\130\140\231\167\187\229\139\149\231\181\130\228\186\134\227\129\167\227\131\171\227\131\188\227\131\151\227\131\162\229\134\141\233\150\139\239\188\154", L2_188[L11_197].instance)
              break
            end
          end
          L0_198 = wait
          L0_198()
        end
      end)
    end)
    break
  end
  L8_194(L9_195)
end
function kitCaptureVoice()
  Sound:playSE(({
    "pc1_065",
    "pc1_066",
    "pc1_067"
  })[RandI(1, 3)], 1, "", Player:getPuppet())
end
function policeCallVoice(A0_199)
  Sound:playSE(({
    "ene_human_vo_call_m51",
    "ene_human_vo_call_m52"
  })[RandI(1, 2)], 1, "", A0_199)
end
function grigoHackingEffect(A0_200)
  invokeTask(function()
    for _FORV_4_ = 1, 5 do
      Fn_findNpc(A0_200):changeMode("hacking")
      waitSeconds(0.1)
      Fn_findNpc(A0_200):changeMode("friend")
      waitSeconds(0.1)
    end
    waitSeconds(0.5)
    Fn_findNpc(A0_200):changeMode("normal")
  end)
end
function retry_e3()
  local L0_201, L1_202
  _reset_e3 = true
end
function npcGrigoRevive()
  local L0_203, L1_204, L2_205, L3_206
  L0_203 = {}
  for _FORV_4_ = 1, _MAX_BOT do
    L0_203[_FORV_4_] = false
  end
  for _FORV_6_ = 1, _MAX_BOT do
    L2_205[_FORV_6_] = 0
  end
  invokeTask(function()
    local L0_207, L1_208, L2_209, L3_210
    while true do
      for L3_210 = 1, _MAX_BOT do
        if L3_210 ~= 5 then
          if _npc_bots[L3_210].status == NPC_STATUS.DEAD then
            L2_205[L3_210] = L2_205[L3_210] + 1
          end
          if _npc_bots[L3_210].status == NPC_STATUS.DEAD and not L0_203[L3_210] and L2_205[L3_210] >= L1_204 and not Fn_isInSightTarget(_npc_bots[L3_210].npcPuppet, 1) and Fn_getDistanceToPlayer(_npc_bots[L3_210].npcPuppet) >= 10 then
            invokeTask(function()
              print("\227\130\176\227\131\170\227\130\180\230\173\187\228\189\147\233\157\158\232\161\168\231\164\186\239\188\134\227\131\175\227\131\188\227\131\151\239\188\129\239\188\154", _npc_bots[L3_210].npcName)
              L0_203[L3_210] = true
              Fn_setNpcActive(_npc_bots[L3_210].npcName, false)
              Fn_warpNpc(_npc_bots[L3_210].npcName, L3_206[L3_210])
              while not (Fn_getDistanceToPlayer(L3_206[L3_210]) >= 12) or Fn_isInSightTarget(L3_206[L3_210], 1) do
                wait()
              end
              _npc_bots[L3_210]:terminate()
              _npc_bots[L3_210].caution = 0
              _npc_bots[L3_210].combatReady = false
              _npc_bots[L3_210].combatReady2 = false
              _npc_bots[L3_210]:setDamagedEvent()
              _npc_bots[L3_210].npc:setEventListener("npcGrabbed", function()
                _npc_bots[L3_210].npc:setEventListener("npcGrabbed", nil)
              end)
              _npc_bots[L3_210].npc:setEventListener("npcDead", function()
                _npc_bots[L3_210].npc:setEventListener("npcDead", nil)
                _npc_bots[L3_210].battleTimerTask = Mv_safeTaskAbort(_npc_bots[L3_210].battleTimerTask)
                _npc_bots[L3_210].callbackReason = CALLBACK_REASON.DIED
                _npc_bots[L3_210].status = NPC_STATUS.DEAD
              end)
              _npc_bots[L3_210].npc:setEventListener("npcFall", function()
                _npc_bots[L3_210].npc:setEventListener("npcFall", nil)
              end)
              _npc_bots[L3_210].npc:changeMode("normal")
              _npc_bots[L3_210]:restart()
              L2_205[L3_210] = 0
              Fn_setNpcActive(_npc_bots[L3_210].npcName, true)
              print("\227\130\176\227\131\170\227\130\180\232\152\135\231\148\159\229\174\140\228\186\134\239\188\129\239\188\154", _npc_bots[L3_210].npcName)
              L0_203[L3_210] = false
            end)
          end
        else
        end
      end
      L0_207(L1_208)
    end
  end)
end
function hackTimerControl()
  invokeTask(function()
    while true do
      for _FORV_3_ = 1, _MAX_BOT do
        if _npc_bots[_FORV_3_].status == NPC_STATUS.HACKED then
          HUD:timerSetSecond(69)
          HUD:timerSetVisible(true)
          HUD:timerStart()
          while _npc_bots[_FORV_3_].status == NPC_STATUS.HACKED do
            wait()
          end
          HUD:timerStop()
          HUD:timerSetVisible(false)
        end
      end
      _FOR_()
    end
  end)
end
function friendMoveSoundControl()
  local L0_211, L1_212, L2_213
  L0_211 = Fn_findNpc
  L1_212 = _npc_friend
  L0_211 = L0_211(L1_212)
  L1_212 = Fn_findNpcPuppet
  L2_213 = _npc_friend
  L1_212 = L1_212(L2_213)
  L2_213 = false
  print("friendMoveSoundControl\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    while true do
      if L2_213 == false and L0_211:isMoveEnd() == false then
        move_se_hdl = Sound:playSEHandle("ene_bot_move", 1, "", L1_212)
        L2_213 = true
      elseif L2_213 and L0_211:isMoveEnd() then
        Sound:stopSEHandle(move_se_hdl)
        L2_213 = false
      end
      wait()
    end
  end)
end
function botMoveSoundControl()
  local L0_214, L1_215
  L0_214 = {}
  L1_215 = {}
  for _FORV_5_ = 1, _MAX_BOT do
    L0_214[_FORV_5_] = false
    L1_215[_FORV_5_] = nil
  end
  print("botMoveSoundControl\233\150\139\229\167\139\239\188\129\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    while true do
      for _FORV_3_ = 1, _MAX_BOT do
        if L0_214[_FORV_3_] == false and _npc_bots[_FORV_3_].npc:isMoveEnd() == false and _npc_bots[_FORV_3_].npc:isNpc() then
          L1_215[_FORV_3_] = Sound:playSEHandle("ene_bot_move", 1, "", _npc_bots[_FORV_3_].npcPuppet)
          L0_214[_FORV_3_] = true
        elseif L0_214[_FORV_3_] and _npc_bots[_FORV_3_].npc:isMoveEnd() or L0_214[_FORV_3_] and _npc_bots[_FORV_3_].npc:isEnemy() then
          Sound:stopSEHandle(L1_215[_FORV_3_])
          if _npc_bots[_FORV_3_].npc:isEnemy() == false then
          elseif _npc_bots[_FORV_3_].npc:isEnemy() then
          end
          L0_214[_FORV_3_] = false
        end
      end
      _FOR_()
    end
  end)
end
