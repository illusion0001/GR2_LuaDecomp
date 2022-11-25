dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/perceivable_npc.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm33_common.lua")
_puppet_tbl = {}
_sdemo_end = false
_turn_end = 0
_cap_start = false
_seen = false
_girl_arrive = false
_is_seen_the_girl = false
_see_roof = false
_too_far = false
_now_retry = false
_cap_wait = false
_mnavi = nil
_move_option = {
  anim_walk_speed = 1,
  runLength = 1000,
  arrivedLength = 0,
  navimesh = true,
  noTurn = true,
  recast = true,
  loop = false
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_above_statue_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_from_statue_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_near_statue_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lookout_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_club_house_warning_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_club_house_over_area")
  L0_0 = {
    {
      name = "sm33_girl_01",
      type = "wom39",
      node = "locator2_girl_01_demo1_01",
      active = false
    },
    {
      name = "sm33_girl_02",
      type = "wom40",
      node = "locator2_girl_02_demo1_01",
      active = false
    },
    {
      name = "sm33_girl_03",
      type = "wom38",
      node = "locator2_girl_03",
      active = false,
      anim_name = "lookaround",
      attach = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _npc_girl_03 = "sm33_girl_03"
  _sdemo_cut01 = SDemo.create("sm33_c_cut01")
  _sdemo_cut01:setCameraParam(nil, 0.1, nil)
  _sdemo_cut02 = SDemo.create("sm33_c_cut02")
  _sdemo_cut02:setCameraParam(nil, 0.1, nil)
  _sdemo_cut03 = SDemo.create("sm33_c_cut03")
  _sdemo_cut03:setCameraParam(nil, 0.1, nil)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1 = closeSchoolGates
  L0_1()
  L0_1 = Fn_setCostume
  L0_1(L1_2)
  L0_1 = Fn_disableCostumeChange
  L0_1(L1_2)
  L0_1 = Fn_setCatWarpCheckPoint
  L0_1(L1_2)
  L0_1 = Fn_loadPlayerMotion
  L0_1(L1_2)
  L0_1 = Fn_playPlayerMotion
  L0_1(L1_2, L2_3)
  L0_1 = {}
  L0_1.pray_00 = "wom01_pray_sm33_00"
  L0_1.pray_in_00 = "wom01_pray_sm33_in_00"
  L0_1.pray_out_00 = "wom01_pray_sm33_out_00"
  for L4_5 = 1, 3 do
    L5_6 = Fn_loadNpcEventMotion
    L6_7 = "sm33_girl_"
    L6_7 = L6_7 .. L7_8
    L5_6(L6_7, L7_8)
  end
  L1_2()
  L1_2()
  L1_2(L2_3)
  L1_2(L2_3)
  L4_5 = "g1_monument_yo_01_01"
  L5_6 = true
  function L4_5()
    repeat
      if L2_3:isBroken() then
        Player:setStay(true, false)
        Fn_captionViewWait("sm33_02000")
        Fn_blackout()
        Fn_resetPcPos("locator2_pc_start_pos")
        L2_3:requestRestoreForce()
        waitSeconds(2)
        Fn_fadein()
        Player:setStay(false)
      end
      wait()
    until false
  end
  L4_5 = Mv_waitPhase
  L4_5()
  L4_5 = Mv_safeTaskAbort
  L5_6 = L3_4
  L4_5 = L4_5(L5_6)
  L4_5 = Fn_naviKill
  L4_5()
  L4_5 = Fn_pcSensorOff
  L5_6 = "pccubesensor2_above_statue_01"
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L5_6 = "pccubesensor2_far_from_statue_01"
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L5_6 = "pccubesensor2_near_statue_01"
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L5_6 = "pccubesensor2_warp_c_01"
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 0.5
  L4_5(L5_6)
  L4_5 = Player
  L5_6 = L4_5
  L4_5 = L4_5.setStay
  L6_7 = true
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = Fn_setNpcActive
  L5_6 = "sm33_girl_03"
  L6_7 = true
  L4_5(L5_6, L6_7)
  L4_5 = Fn_moveNpc
  L5_6 = "sm33_girl_03"
  L6_7 = {L7_8}
  L4_5(L5_6, L6_7)
  L4_5 = Fn_captionView
  L5_6 = "sm33_02004"
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  L4_5 = Mv_viewObj
  L5_6 = _puppet_tbl
  L5_6 = L5_6.sm33_girl_03
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 2
  L4_5(L5_6)
  L4_5 = _sdemo_cut01
  L5_6 = L4_5
  L4_5 = L4_5.set
  L6_7 = "locator2_find_girl_camera_01"
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5 = _sdemo_cut01
  L5_6 = L4_5
  L4_5 = L4_5.setCameraParam
  L6_7 = nil
  L8_9.deg = 20
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5 = _sdemo_cut01
  L5_6 = L4_5
  L4_5 = L4_5.switchCamera
  L6_7 = true
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = Fn_fadein
  L4_5()
  L4_5 = waitSeconds
  L5_6 = 2
  L4_5(L5_6)
  L4_5 = Fn_captionViewWait
  L5_6 = "sm33_02005"
  L4_5(L5_6)
  L4_5 = _sdemo_cut01
  L5_6 = L4_5
  L4_5 = L4_5.switchCamera
  L6_7 = false
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = Player
  L5_6 = L4_5
  L4_5 = L4_5.setStay
  L6_7 = false
  L4_5(L5_6, L6_7, L7_8)
  _sdemo_end = true
  L4_5 = npcInit_girl_03
  L4_5()
  L4_5 = invokeTask
  function L5_6()
    local L0_16, L1_17, L2_18, L3_19
    L0_16 = 0
    repeat
      L1_17 = _girl_arrive
      if L1_17 == false then
        L1_17 = Fn_getDistanceToPlayer
        L2_18 = _puppet_tbl
        L2_18 = L2_18.sm33_girl_03
        L1_17 = L1_17(L2_18)
        L2_18 = Camera
        L3_19 = L2_18
        L2_18 = L2_18.getEyePos
        L2_18 = L2_18(L3_19)
        L3_19 = L2_18.y
        L3_19 = L3_19 + 1
        L2_18.y = L3_19
        L3_19 = _puppet_tbl
        L3_19 = L3_19.sm33_girl_03
        L3_19 = L3_19.getWorldPos
        L3_19 = L3_19(L3_19)
        L3_19.y = L3_19.y + 1.5
        Query:setEyeSightTransform(L2_18)
        Query:setEyeSightAngle(Deg2Rad(360))
        Query:setEyeSightRange(30)
        if L1_17 >= 15 then
          if Query:calcInSightRatioGameObject(_puppet_tbl.sm33_girl_03) ~= nil then
            if Query:raycastEyeSight(L3_19) == nil then
              L0_16 = 0
            else
              L0_16 = L0_16 + 1
              print("\227\130\191\227\130\164\227\131\158\227\131\188\227\130\171\227\130\166\227\131\179\227\131\136" .. L0_16)
            end
          else
            L0_16 = L0_16 + 1
            print("\227\130\191\227\130\164\227\131\158\227\131\188\227\130\171\227\130\166\227\131\179\227\131\136" .. L0_16)
          end
        else
          L0_16 = 0
        end
        if L0_16 == 300 then
          print("\232\166\139\229\164\177\227\129\163\227\129\159")
          _too_far = true
          Retry()
        elseif L0_16 == 150 and _now_retry == false then
          invokeTask(function()
            _cap_wait = true
            Fn_captionViewWait("sm33_02044")
            waitSeconds(2)
            _cap_wait = false
          end)
        end
      end
      L1_17 = wait
      L1_17()
      L1_17 = false
    until L1_17
  end
  L4_5 = L4_5(L5_6)
  L5_6 = invokeTask
  function L6_7()
    repeat
      if _now_retry == true then
        _cap_start = false
        _is_seen_the_girl = false
      elseif _now_retry == false then
        if Fn_get_distance(_puppet_tbl.sm33_girl_03:getWorldPos(), findGameObject2("Node", "locator2_girl_03_move_01"):getWorldPos()) <= 1 and _turn_end == 0 then
          _turn_end = _turn_end + 1
          cautionTaskAction()
          waitSeconds(3)
          _cap_start = true
        elseif Fn_get_distance(_puppet_tbl.sm33_girl_03:getWorldPos(), findGameObject2("Node", "locator2_girl_03_move_03"):getWorldPos()) <= 1 and _turn_end == 1 then
          _turn_end = _turn_end + 1
          waitSeconds(3)
          _cap_start = true
        elseif Fn_get_distance(_puppet_tbl.sm33_girl_03:getWorldPos(), findGameObject2("Node", "locator2_girl_03_move_04"):getWorldPos()) <= 1 and _turn_end == 2 then
          _turn_end = _turn_end + 1
          cautionTaskAction()
          waitSeconds(3)
          _cap_start = true
        elseif Fn_get_distance(_puppet_tbl.sm33_girl_03:getWorldPos(), findGameObject2("Node", "locator2_girl_03_move_07"):getWorldPos()) <= 1 and _turn_end == 3 then
          _turn_end = _turn_end + 1
          _cap_start = true
        elseif Fn_get_distance(_puppet_tbl.sm33_girl_03:getWorldPos(), findGameObject2("Node", "locator2_girl_03_move_11"):getWorldPos()) <= 1 and _turn_end == 4 then
          _turn_end = _turn_end + 1
          cautionTaskAction()
          waitSeconds(3)
          _cap_start = true
        end
        if not _is_seen_the_girl and _cap_start and not _too_far and not _seen and not _cap_wait then
          if _turn_end == 1 and Mv_raycastCameraSight(_puppet_tbl.sm33_girl_03) then
            Fn_captionView("sm33_02045")
            _cap_start = false
          elseif _turn_end == 2 and Mv_raycastCameraSight(_puppet_tbl.sm33_girl_03) then
            Fn_captionView("sm33_02046")
            _cap_start = false
          elseif _turn_end == 3 then
            Fn_captionView("sm33_02047")
            _cap_start = false
          elseif _turn_end == 4 then
            Fn_captionView("sm33_02048")
            _cap_start = false
          elseif _turn_end == 5 then
            Fn_captionView("sm33_02049")
            _cap_start = false
          end
        end
      end
      wait()
    until _girl_arrive
  end
  L5_6 = L5_6(L6_7)
  while true do
    L6_7 = findGameObject2
    L6_7 = L6_7(L7_8, L8_9)
    L6_7 = L6_7.getWorldPos
    L6_7 = L6_7(L7_8)
    if L8_9 <= 0.2 then
      L8_9(L9_10, L10_11)
      L8_9(L9_10, L10_11, L11_12)
      if L8_9 <= 25 then
        L8_9(L9_10)
      end
    end
    if L8_9 then
      L8_9()
    end
  end
  L6_7 = _mnavi
  L6_7 = L6_7.setActive
  L6_7(L7_8, L8_9)
  L6_7 = _mnavi
  L6_7 = L6_7.del
  L6_7(L7_8)
  L6_7 = waitSeconds
  L6_7(L7_8)
  L6_7 = Fn_kaiwaDemoView
  L6_7(L7_8)
  _girl_arrive = true
  L6_7 = L5_6.abort
  L6_7(L7_8)
  L5_6 = nil
  L6_7 = L4_5.abort
  L6_7(L7_8)
  L4_5 = nil
  L6_7 = invokeTask
  L6_7 = L6_7(L7_8)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8()
  mission_view_task = L7_8
  L7_8()
  L7_8()
  L7_8()
  L7_8()
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  _task_npc_girl_03 = nil
  L7_8(L8_9)
  L7_8(L8_9)
  L6_7 = nil
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  for L10_11 = 1, 2 do
    L14_15 = "%02d"
    L11_12(L12_13, L13_14)
  end
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9, L9_10, L10_11)
  L7_8(L8_9)
  for L10_11 = 1, 3 do
    L14_15 = "%02d"
    L11_12(L12_13, L13_14)
  end
  L10_11.runLength = 100
  L7_8(L8_9, L9_10, L10_11)
  L10_11.runLength = 100
  L7_8(L8_9, L9_10, L10_11)
  L7_8()
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L7_8(L8_9)
  L10_11.arrivedLength = 0
  L8_9(L9_10)
  L11_12.arrivedLength = 0
  L9_10(L10_11)
  L12_13.arrivedLength = 0
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12, L12_13, L13_14)
  L14_15 = {}
  L14_15.deg = 40
  L10_11(L11_12, L12_13, L13_14, L14_15)
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12)
  for L13_14 = 1, 3 do
    L14_15 = invokeTask
    L14_15(function()
      waitSeconds(RandF(0, 0.2))
      Fn_playNpcEventMotion("sm33_girl_" .. string.format("%02d", L13_14), L0_1.pray_in_00, 0, 0.1, true)
      Fn_playNpcEventMotion("sm33_girl_" .. string.format("%02d", L13_14), L0_1.pray_00, -1, 0, false)
    end)
    break
  end
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12, L12_13)
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12, L12_13)
  L10_11(L11_12)
  for L13_14 = 1, 3 do
    L14_15 = Fn_playMotionNpc
    L14_15(string.format("sm33_girl_%02d", L13_14), "stay", false, {animBlendDuration = 0.3})
    L14_15 = Fn_watchNpc
    L14_15(string.format("sm33_girl_%02d", L13_14), true)
  end
  L10_11(L11_12)
  L11_12.pos = "locator2_demo1_camera_03"
  L11_12.time = 0.3
  L14_15 = nil
  L11_12(L12_13, L13_14, L14_15, {deg = 70})
  L14_15 = nil
  L11_12(L12_13, L13_14, L14_15)
  for L14_15 = 1, 3 do
    invokeTask(function()
      waitSeconds(RandF(0, 0.3))
      Fn_playMotionNpc(string.format("sm33_girl_%02d", L14_15), "surprise_01", false, {animBlendDuration = 0.3})
      Sound:playSE(({
        "w19_009",
        "w20_005",
        "w21_005"
      })[L14_15])
    end)
    break
  end
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12()
  L11_12(L12_13)
  for L14_15 = 1, 3 do
    Fn_playMotionNpc("sm33_girl_" .. string.format("%02d", L14_15), "stay", false)
  end
  L11_12()
  L11_12()
  L11_12()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function goForward_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_near_statue_01_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_near_statue_01")
end
function pccubesensor2_far_from_statue_01_OnLeave()
  Player:setStay(true, false)
  Fn_naviSet(findGameObject2("Node", "locator2_navi_statue_01"))
  Fn_pcSensorOn("pccubesensor2_near_statue_01")
  Fn_captionView("sm33_02037")
  Player:setStay(false)
end
function pccubesensor2_warp_c_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    closeSchoolGates()
  end)
end
function pccubesensor2_club_house_warning_area_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm33_02050")
  Player:setStay(false)
end
function pccubesensor2_club_house_over_area_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    closeSchoolGates()
  end)
end
function npcInit_girl_03()
  local L0_20, L1_21, L2_22, L3_23
  L0_20 = _task_npc_girl_03
  if L0_20 ~= nil then
    L0_20 = _task_npc_girl_03
    L1_21 = L0_20
    L0_20 = L0_20.taskAbort
    L0_20(L1_21)
    _task_npc_girl_03 = nil
  end
  L0_20 = print
  L1_21 = "\227\130\191\227\130\185\227\130\175\227\129\174\229\136\157\230\156\159\229\140\150"
  L0_20(L1_21)
  L0_20 = nil
  L1_21 = findGameObject2
  L2_22 = "Node"
  L3_23 = "locator2_girl_03_move_12"
  L1_21 = L1_21(L2_22, L3_23)
  L2_22 = L1_21
  L1_21 = L1_21.getWorldPos
  L1_21 = L1_21(L2_22)
  L2_22 = _puppet_tbl
  L2_22 = L2_22.sm33_girl_03
  L3_23 = L2_22
  L2_22 = L2_22.getWorldPos
  L2_22 = L2_22(L3_23)
  L3_23 = Fn_get_distance
  L3_23 = L3_23(L1_21, L2_22)
  if L3_23 <= 1 then
    L3_23 = {
      {
        pos = "locator2_girl_03_move_12",
        opt = nil
      }
    }
    L0_20 = L3_23
  else
    L3_23 = {
      {
        pos = "locator2_girl_03_move_01",
        opt = nil
      }
    }
    L0_20 = L3_23
  end
  L3_23 = PerceivableNpc
  L3_23 = L3_23.new
  L3_23 = L3_23(_npc_girl_03)
  _task_npc_girl_03 = L3_23
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setPosList
  L3_23(L3_23, L0_20)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setMoveOption
  L3_23(L3_23, _move_option)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setSightParam
  L3_23(L3_23, 70, 20)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setCautionCoefficient
  L3_23(L3_23, 0.7, 0.3)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setAlertRange
  L3_23(L3_23, 1)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setIndicationRange
  L3_23(L3_23, 4)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setIndicationCoefficient
  L3_23(L3_23, 5, 3)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setOnChangeState
  L3_23(L3_23, callback)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setCombatReady
  L3_23(L3_23, false)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setChaseMode
  L3_23(L3_23, false)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setLoop
  L3_23(L3_23, false)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setChangeRouteImmediately
  L3_23(L3_23, true)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setDamageType
  L3_23(L3_23, 0)
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.setDismissMotion
  L3_23(L3_23, "lookaround_01")
  L3_23 = _girl_arrive
  if L3_23 == true then
    L3_23 = _task_npc_girl_03
    L3_23 = L3_23.setStayMotion
    L3_23(L3_23, "lookaround")
    L3_23 = _task_npc_girl_03
    L3_23 = L3_23.setSightParam
    L3_23(L3_23, 45, 12)
  else
    L3_23 = _task_npc_girl_03
    L3_23 = L3_23.setStayMotion
    L3_23(L3_23, "stay")
  end
  L3_23 = _task_npc_girl_03
  L3_23 = L3_23.action
  L3_23(L3_23)
  L3_23 = print
  L3_23("\231\167\187\229\139\149\232\168\173\229\174\154\227\129\174\229\136\157\230\156\159\229\140\150")
  L3_23 = {
    _task_npc_girl_03
  }
  CautionLevel.setNpc(L3_23)
  CautionLevel.setLabel("sm33_02038")
  CautionLevel.drawTask()
  CautionLevel.setKeepVisible(true)
  if _girl_arrive == false then
    Fn_missionView("sm33_02006")
  end
  invokeTask(function()
    while not _girl_arrive do
      if Fn_getDistanceToPlayer(_puppet_tbl.sm33_girl_03) <= 2 then
        _task_npc_girl_03:setCautionCoefficient(3, 0.1)
      elseif Fn_getDistanceToPlayer(_puppet_tbl.sm33_girl_03) <= 5 then
        _task_npc_girl_03:setCautionCoefficient(1.2, 0.3)
      else
        _task_npc_girl_03:setCautionCoefficient(0.7, 0.5)
      end
      wait()
    end
  end)
  waitSeconds(1.3)
  _mnavi = HUD:mnaviNew({
    name = "girl_navi",
    PochFadeLen0 = 0,
    PochFadeLen100 = -1
  })
  _mnavi:setTarget(_puppet_tbl.sm33_girl_03)
  _mnavi:setActive(true, true)
end
function callback(A0_24, A1_25)
  if A1_25 == CALLBACK_REASON.IS_INSIGHT then
    _is_seen_the_girl = true
    print("\232\166\150\231\149\140\227\129\171\227\129\168\227\130\137\227\129\136\227\129\159")
    invokeTask(function()
      _cap_wait = true
      Fn_captionViewWait("sm33_02039")
      waitSeconds(2)
      if _is_seen_the_girl then
        _cap_wait = false
      end
    end)
  elseif A1_25 == CALLBACK_REASON.CAUTION_OVERFLOW then
    print("\232\173\166\230\136\146\229\186\166\227\129\140MAX\227\129\171\227\129\170\227\129\163\227\129\159")
    _seen = true
    Retry()
  elseif A1_25 == CALLBACK_REASON.NO_CAUTION then
    _is_seen_the_girl = false
    print("\232\173\166\230\136\146\229\186\166\227\129\140\230\156\128\229\176\145\227\129\171\227\129\170\227\129\163\227\129\159")
    invokeTask(function()
      _cap_wait = true
      Fn_captionViewWait("sm33_02040")
      waitSeconds(2)
      if not _is_seen_the_girl then
        _cap_wait = false
      end
    end)
  end
end
function cautionTaskAction()
  local L0_26, L1_27
  L0_26 = {}
  L1_27 = _turn_end
  if L1_27 == 1 then
    L1_27 = {
      {
        pos = "locator2_girl_03_move_02",
        opt = {runLength = 1000}
      },
      {
        pos = "locator2_girl_03_move_03",
        opt = {runLength = 1000}
      },
      {
        pos = "locator2_girl_03_move_04",
        opt = {runLength = 1000}
      }
    }
    L0_26 = L1_27
  else
    L1_27 = _turn_end
    if L1_27 == 3 then
      L1_27 = {
        {
          pos = "locator2_girl_03_move_05",
          opt = {runLength = 1000}
        },
        {
          pos = "locator2_girl_03_move_06",
          opt = {runLength = 1000}
        },
        {
          pos = "locator2_girl_03_move_07",
          opt = {runLength = 1000}
        },
        {
          pos = "locator2_girl_03_move_08",
          opt = {runLength = 1000}
        },
        {
          pos = "locator2_girl_03_move_09",
          opt = {runLength = 1000}
        },
        {
          pos = "locator2_girl_03_move_10",
          opt = {runLength = 1000}
        },
        {
          pos = "locator2_girl_03_move_11",
          opt = {runLength = 1000}
        }
      }
      L0_26 = L1_27
    else
      L1_27 = _turn_end
      if L1_27 == 5 then
        L1_27 = {
          {
            pos = "locator2_girl_03_move_12",
            opt = {runLength = 1000, anim_run_speed = 1}
          }
        }
        L0_26 = L1_27
      end
    end
  end
  L1_27 = _task_npc_girl_03
  L1_27 = L1_27.setChangeRouteImmediately
  L1_27(L1_27, true)
  L1_27 = Fn_findNpc
  L1_27 = L1_27("sm33_girl_03")
  Fn_playMotionNpc(L1_27, "lookback_in_01", true, {animBlendDuration = 0.2})
  Fn_playMotionNpc(L1_27, "lookback_01", true)
  Fn_playMotionNpc(L1_27, "lookback_out_01", true)
  _task_npc_girl_03:setPosList(L0_26)
end
function Retry()
  if _seen == true or _too_far == true then
    if _now_retry then
      return
    end
    _now_retry = true
    _turn_end = 0
    invokeTask(function()
      local L0_28, L1_29, L2_30, L3_31, L4_32
      L0_28 = _mnavi
      L0_28 = L0_28.setActive
      L0_28(L1_29, L2_30, L3_31)
      L0_28 = _mnavi
      L0_28 = L0_28.del
      L0_28(L1_29)
      L0_28 = waitSeconds
      L0_28(L1_29)
      L0_28 = CautionLevel
      L0_28 = L0_28.setKeepVisible
      L0_28(L1_29)
      L0_28 = _task_npc_girl_03
      L0_28 = L0_28.terminate
      L0_28(L1_29)
      L0_28 = Player
      L0_28 = L0_28.isGravityControlMode
      L0_28 = L0_28(L1_29)
      if L0_28 then
        L0_28 = Player
        L0_28 = L0_28.setStay
        L0_28(L1_29, L2_30)
      else
        L0_28 = Fn_userCtrlAllOff
        L0_28()
      end
      L0_28 = _seen
      if L0_28 == true then
        L0_28 = Fn_turnNpc
        L0_28(L1_29)
        _cap_start = false
        L0_28 = Mv_viewObj
        L0_28(L1_29)
        L0_28 = Fn_playMotionNpc
        L0_28(L1_29, L2_30, L3_31)
        L0_28 = Sound
        L0_28 = L0_28.playSE
        L0_28(L1_29, L2_30)
        L0_28 = Fn_captionViewWait
        L0_28(L1_29)
        L0_28 = Fn_captionView
        L0_28(L1_29)
        L0_28 = waitSeconds
        L0_28(L1_29)
        L0_28 = Fn_playMotionNpc
        L4_32 = {}
        L4_32.animBlendDuration = 0.5
        L0_28(L1_29, L2_30, L3_31, L4_32)
        L0_28 = waitSeconds
        L0_28(L1_29)
      else
        L0_28 = _too_far
        if L0_28 == true then
          L0_28 = Fn_captionViewWait
          L0_28(L1_29)
        end
      end
      L0_28 = Fn_blackout
      L0_28()
      L0_28 = Fn_recoverEnergyFully
      L0_28()
      L0_28 = {}
      for L4_32 = 1, 30 do
        L0_28[L4_32] = findGameObject2("Node", "bg2_box_" .. string.format("%02d", L4_32))
        L0_28[L4_32]:requestRestoreForce()
      end
      L2_30(L3_31)
      if L2_30 == false then
        L2_30(L3_31)
        L4_32 = "locator2_girl_03_move_00"
        L2_30(L3_31, L4_32)
      else
        L2_30(L3_31)
        L4_32 = "locator2_girl_03_move_12"
        L2_30(L3_31, L4_32)
      end
      _too_far = false
      _seen = false
      _see_roof = false
      _now_retry = false
      L2_30()
      L2_30(L3_31)
      L2_30()
      L2_30(L3_31)
      L2_30()
      L2_30(L3_31)
      L2_30()
      L4_32 = false
      L2_30(L3_31, L4_32)
      L2_30(L3_31)
    end)
  end
end
