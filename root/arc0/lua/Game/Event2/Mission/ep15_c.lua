dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
GRI03_SPEED = 1
GRI03_CHECK_DIST = 2.5
GRI03_ST_NAVI_DIST = 55
GRI03_RE_NAVI_DIST = 20
GRI03_DEL_NAVI_DIST = 5
POL01_DIST = 5
CHILD_MAX = 5
CHILD_DIST = 20
_puppet_tbl = {}
_sdemo = nil
_grigo_bgm = nil
_child_task = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    {
      name = "chi04",
      type = "chi19",
      node = "locator2_child_04",
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "chi05",
      type = "chi19",
      node = "locator2_child_05"
    },
    {
      name = "pol01",
      type = "man31",
      node = "locator2_event_pol01_st_01",
      attach = false
    },
    {
      name = "wom41",
      type = "wom41",
      node = "locator2_event_wom_st_01",
      attach = false
    },
    {
      name = "kaji",
      type = "kaj01",
      node = "locator2_kaji_pos",
      active = true
    },
    {
      name = "police1",
      type = "man31",
      node = "locator2_police1_pos",
      active = true
    },
    {
      name = "police2",
      type = "man31",
      node = "locator2_police2_pos",
      active = true
    }
  }
  L1_1.name = "gri03"
  L1_1.type = "mcgri"
  L1_1.node = "locator2_grigoC_st_01"
  L2_2.name = "chi01"
  L2_2.type = "kid03"
  L2_2.node = "locator2_child_01"
  L3_3.name = "chi02"
  L3_3.type = "chi20"
  L3_3.node = "locator2_child_02"
  L4_4 = {}
  L4_4.name = "chi03"
  L4_4.type = "chi20"
  L4_4.node = "locator2_child_03"
  L4_4.color_variation = 1
  L4_4.hair_variation = 1
  L1_1(L2_2)
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1(L2_2)
  L1_1(L2_2)
  for L4_4 = 1, CHILD_MAX do
    Fn_setNpcActive("chi0" .. L4_4, false)
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  _sdemo = L1_1
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19
  L0_5 = Fn_sendEventComSb
  L1_6 = "changeCatWarpPoint"
  L2_7 = "locator2_restart_c_01"
  L0_5(L1_6, L2_7)
  L0_5 = {}
  L0_5.isRepeat = true
  L0_5.loop = true
  L1_6 = Fn_setNpcActive
  L2_7 = "ep15_pol_01"
  L3_8 = false
  L1_6(L2_7, L3_8)
  L1_6 = Fn_setNpcActive
  L2_7 = "bulbosa"
  L3_8 = false
  L1_6(L2_7, L3_8)
  L1_6 = Fn_missionStart
  L1_6()
  L1_6 = playerCoerctionStop
  L2_7 = true
  L1_6(L2_7)
  L1_6 = Sound
  L2_7 = L1_6
  L1_6 = L1_6.pulse
  L3_8 = "ep15_radio_call"
  L1_6(L2_7, L3_8)
  L1_6 = waitSeconds
  L2_7 = 1
  L1_6(L2_7)
  L1_6 = Fn_kaiwaDemoView
  L2_7 = "ep15_00114k"
  L1_6(L2_7)
  L1_6 = Player
  L2_7 = L1_6
  L1_6 = L1_6.setStay
  L3_8 = false
  L1_6(L2_7, L3_8)
  L1_6 = Fn_userCtrlOn
  L1_6()
  L1_6 = findGameObject2
  L2_7 = "Node"
  L3_8 = "locator2_grigoC_st_01"
  L1_6 = L1_6(L2_7, L3_8)
  L2_7 = findGameObject2
  L3_8 = "Node"
  L2_7 = L2_7(L3_8, L4_9)
  L3_8 = false
  L4_9(L5_10)
  L7_12 = nil
  L4_9(L5_10, L6_11, L7_12)
  L4_9()
  L4_9()
  L4_9(L5_10)
  for L7_12 = 1, CHILD_MAX do
    L8_13 = Fn_setNpcActive
    L9_14 = "chi0"
    L10_15 = L7_12
    L9_14 = L9_14 .. L10_15
    L10_15 = true
    L8_13(L9_14, L10_15)
  end
  L4_9(L5_10, L6_11)
  L7_12 = L4_9
  L5_10(L6_11, L7_12)
  L5_10.anim_walk_speed = L6_11
  L5_10.loop = true
  L7_12 = "locator2_grigoC_pos_01"
  L8_13 = "locator2_grigoC_pos_03"
  L9_14 = "locator2_grigoC_pos_05"
  L10_15 = "locator2_grigoC_pos_07"
  L14_19 = "locator2_grigoC_pos_08"
  L7_12 = Fn_moveNpc
  L8_13 = "gri03"
  L9_14 = L6_11
  L10_15 = L5_10
  L7_12 = L7_12(L8_13, L9_14, L10_15)
  L8_13 = childMove
  L8_13 = L8_13()
  _child_task = L8_13
  L8_13 = invokeGrigoWarningStart
  L9_14 = _puppet_tbl
  L9_14 = L9_14.gri03
  L8_13 = L8_13(L9_14)
  _grigo_bgm = L8_13
  L8_13 = Fn_captionViewWait
  L9_14 = "ep15_02001"
  L8_13(L9_14)
  L8_13 = waitSeconds
  L9_14 = 1
  L8_13(L9_14)
  L8_13 = Fn_captionViewWait
  L9_14 = "ep15_02002"
  L8_13(L9_14)
  L8_13 = RAC_LookAtObjectWait
  L9_14 = "locator2_grigo_aim_pos"
  L10_15 = nil
  L8_13(L9_14, L10_15, L11_16)
  L8_13 = Fn_findNpc
  L9_14 = "gri03"
  L8_13 = L8_13(L9_14)
  L10_15 = L8_13
  L9_14 = L8_13.changeDamageType
  L9_14(L10_15, L11_16)
  L9_14 = _sdemo
  L10_15 = L9_14
  L9_14 = L9_14.reset
  L9_14(L10_15)
  L9_14 = _sdemo
  L10_15 = L9_14
  L9_14 = L9_14.set
  L14_19 = Vector
  L14_19 = L14_19(0, 0, 0)
  L9_14(L10_15, L11_16, L12_17, L13_18, L14_19, L14_19(0, 0, 0))
  L9_14 = _sdemo
  L10_15 = L9_14
  L9_14 = L9_14.switchCamera
  L9_14(L10_15, L11_16, L12_17)
  L9_14 = waitSeconds
  L10_15 = 3
  L9_14(L10_15)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep15_02003"
  L9_14(L10_15)
  L9_14 = _sdemo
  L10_15 = L9_14
  L9_14 = L9_14.stop
  L9_14(L10_15, L11_16)
  L9_14 = Fn_userCtrlOn
  L9_14()
  L9_14 = Player
  L10_15 = L9_14
  L9_14 = L9_14.setStay
  L9_14(L10_15, L11_16)
  while true do
    L9_14 = Fn_getDistanceToPlayer
    L10_15 = _puppet_tbl
    L10_15 = L10_15.gri03
    L9_14 = L9_14(L10_15)
    L10_15 = CHILD_DIST
    if L9_14 < L10_15 then
      L9_14 = rayCheckPcSetStayVerB
      L10_15 = _puppet_tbl
      L10_15 = L10_15.gri03
      L9_14 = L9_14(L10_15, L11_16, L12_17, L13_18)
      if L9_14 == true then
        L9_14 = Fn_naviKill
        L9_14()
        L9_14 = invokeTask
        function L10_15()
          L8_13:setDamage(false)
          L8_13:enableHomingTarget(true)
          L8_13:changeDamageType(2)
          L8_13:setEventListener("npcDamaged", function()
            L8_13:changeDamageType(0)
            L8_13:setEventListener("npcDamaged", nil)
            if _grigo_bgm ~= nil then
              _grigo_bgm:abort()
              _grigo_bgm = nil
            end
            invokeGrigoWarningStop()
            invokeTask(function()
              L8_13:enableHomingTarget(false)
              L8_13:pauseMove(true)
              Fn_playMotionNpc("gri03", "mcgri01_smalldown_00", true)
              Fn_playMotionNpc("gri03", "mcgri01_down_01", true)
            end)
            grigo_hit_flag = true
          end)
          waitSeconds(0.5)
          if _child_task ~= nil then
            _child_task:abort()
            _child_task = nil
          end
          _child_task = childEscape()
        end
        L9_14(L10_15)
        L9_14 = Sound
        L10_15 = L9_14
        L9_14 = L9_14.pulse
        L9_14(L10_15, L11_16)
        L9_14 = Fn_captionViewWait
        L10_15 = "ep15_02004"
        L9_14(L10_15)
        break
      end
    else
      L9_14 = Fn_getDistanceToPlayer
      L10_15 = _puppet_tbl
      L10_15 = L10_15.gri03
      L10_15 = L10_15.getWorldPos
      L14_19 = L10_15(L11_16)
      L9_14 = L9_14(L10_15, L11_16, L12_17, L13_18, L14_19, L10_15(L11_16))
      L10_15 = GRI03_ST_NAVI_DIST
      if L9_14 > L10_15 then
        L9_14 = Fn_naviSet
        L10_15 = findGameObject2
        L14_19 = L10_15(L11_16, L12_17)
        L9_14(L10_15, L11_16, L12_17, L13_18, L14_19, L10_15(L11_16, L12_17))
      end
    end
    L9_14 = wait
    L9_14()
  end
  L9_14 = waitSeconds
  L10_15 = 0.5
  L9_14(L10_15)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep15_02005"
  L9_14(L10_15)
  L9_14 = Fn_missionView
  L10_15 = "ep15_02006"
  L9_14(L10_15)
  while true do
    L9_14 = grigo_hit_flag
    if L9_14 == true then
      L9_14 = Fn_naviKill
      L9_14()
      break
    end
    L9_14 = grigo03NaviCheck
    L9_14()
    L9_14 = wait
    L9_14()
  end
  L9_14 = Sound
  L10_15 = L9_14
  L9_14 = L9_14.playSE
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = Fn_captionView
  L10_15 = "ep15_02012"
  L9_14(L10_15)
  L9_14 = waitSeconds
  L10_15 = 1.2
  L9_14(L10_15)
  L9_14 = Sound
  L10_15 = L9_14
  L9_14 = L9_14.playSE
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = waitSeconds
  L10_15 = 2.3
  L9_14(L10_15)
  L9_14 = Sound
  L10_15 = L9_14
  L9_14 = L9_14.playSE
  L9_14(L10_15, L11_16, L12_17, L13_18)
  L9_14 = Fn_captionViewWait
  L10_15 = "ep15_02013"
  L9_14(L10_15)
  L9_14 = waitSeconds
  L10_15 = 0.5
  L9_14(L10_15)
  while true do
    L9_14 = RAC_RaycastEyeSight
    L10_15 = _puppet_tbl
    L10_15 = L10_15.gri03
    L9_14 = L9_14(L10_15, L11_16)
    if L9_14 == true then
      L9_14 = Fn_isInSightTarget
      L10_15 = _puppet_tbl
      L10_15 = L10_15.gri03
      L9_14 = L9_14(L10_15, L11_16)
      if L9_14 then
        L9_14 = Fn_naviKill
        L9_14()
        break
      end
    end
    L9_14 = grigo03NaviCheck
    L9_14()
    L9_14 = wait
    L9_14()
  end
  L9_14 = Fn_captionViewWait
  L10_15 = "ep15_02007"
  L9_14(L10_15)
  L9_14 = Fn_setLivelyIcon
  L10_15 = _puppet_tbl
  L10_15 = L10_15.gri03
  L9_14(L10_15, L11_16)
  L9_14 = false
  L10_15 = false
  while L9_14 == false do
    if not L10_15 then
      if L11_16 < L12_17 then
        L13_18.id = "ui_event_guide_03"
        L13_18.func = L11_16
        L12_17.RL = L13_18
        L14_19 = L12_17
        L13_18(L14_19)
        L10_15 = true
      end
    elseif L11_16 > L12_17 then
      L11_16()
      L10_15 = false
    end
    L11_16()
    L11_16()
  end
  L11_16()
  L11_16()
  L11_16(L12_17, L13_18)
  for L14_19 = 1, CHILD_MAX do
    Fn_disappearNpc("chi0" .. L14_19)
  end
  L11_16(L12_17, L13_18)
  L11_16()
  L11_16(L12_17)
  L11_16(L12_17)
  L11_16.walk01 = "man01_walk_00"
  L11_16.stay01 = "man01_stay_00"
  L11_16.talk01 = "man01_talk_02"
  L11_16.turnL = "man01_turn_l_00"
  L11_16.turnR = "man01_turn_r_00"
  L11_16.walkB = "man01_walk_b_00"
  L11_16.walkL = "man01_walk_l_00"
  L11_16.walkLlop = "man01_walk_l_loop_00"
  L11_16.walkRlop = "man01_walk_r_loop_00"
  L11_16.walkR = "man01_walk_r_00"
  L12_17.talk_angry01 = "wom01_talk_angry_00"
  L14_19 = "pol01"
  L13_18(L14_19, L11_16)
  L14_19 = "wom41"
  L13_18(L14_19, L12_17)
  L13_18()
  L14_19 = "pccubesensor2_police_event_01"
  L13_18(L14_19)
  L14_19 = "ep15_02009"
  L13_18(L14_19, "locator2_pol_event_navi_01", nil)
  L13_18()
  L13_18()
  L14_19 = false
  L13_18(L14_19)
  L14_19 = 0.2
  L13_18(L14_19)
  L14_19 = "locator2_event_target_pos_01"
  L13_18(L14_19, nil, DEF_RATIO)
  L14_19 = "ep15_02010"
  L13_18(L14_19)
  L14_19 = "pol01"
  L13_18(L14_19, true)
  L14_19 = "wom41"
  L13_18(L14_19, true)
  L13_18.anim_walk_speed = 0.8
  L14_19 = {}
  L14_19.anim_walk = "man01_walk_00"
  L14_19.anim_walk_speed = 0.8
  waitSeconds(1)
  RAC_LookAtObjectWait(_puppet_tbl.pol01, nil, DEF_RATIO - 0.1)
  waitSeconds(0.2)
  Fn_userCtrlOn()
  Fn_captionViewWait("ep15_02011")
  Fn_naviSet(_puppet_tbl.pol01)
  invoke_phase = invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer(_puppet_tbl.pol01:getWorldPos()) < POL01_DIST then
        _gotoNextPhase()
        break
      end
      wait()
    end
  end)
  _waitPhase()
  playerCoerctionStop(true)
  if invokeTask(function()
    local L0_20, L1_21, L2_22, L3_23
    L0_20 = false
    L1_21 = false
    L2_22 = {
      L3_23,
      "locator2_event_pol01_pos_02"
    }
    L3_23 = "locator2_event_pol01_pos_01"
    L3_23 = {
      "locator2_event_wom_pos_01",
      "locator2_event_wom_pos_02"
    }
    while true do
      if Fn_moveNpc("pol01", L2_22, L14_19):isRunning() == false and L1_21 == false then
        L1_21 = true
        Fn_turnNpc("pol01", _puppet_tbl.wom41, {
          upperAnim = L11_16.stay01
        })
        Fn_playMotionNpc("pol01", L11_16.talk01, false, L0_5)
      end
      if Fn_moveNpc("wom41", L3_23, L13_18):isRunning() == false and L0_20 == false then
        L0_20 = true
        Fn_turnNpc("wom41", _puppet_tbl.pol01)
        Fn_playMotionNpc("wom41", L12_17.talk_angry01, false, L0_5)
      end
      if L1_21 ~= true or L0_20 ~= true then
        wait()
      end
    end
  end) ~= nil then
    invokeTask(function()
      local L0_24, L1_25, L2_26, L3_27
      L0_24 = false
      L1_25 = false
      L2_26 = {
        L3_27,
        "locator2_event_pol01_pos_02"
      }
      L3_27 = "locator2_event_pol01_pos_01"
      L3_27 = {
        "locator2_event_wom_pos_01",
        "locator2_event_wom_pos_02"
      }
      while true do
        if Fn_moveNpc("pol01", L2_26, L14_19):isRunning() == false and L1_25 == false then
          L1_25 = true
          Fn_turnNpc("pol01", _puppet_tbl.wom41, {
            upperAnim = L11_16.stay01
          })
          Fn_playMotionNpc("pol01", L11_16.talk01, false, L0_5)
        end
        if Fn_moveNpc("wom41", L3_27, L13_18):isRunning() == false and L0_24 == false then
          L0_24 = true
          Fn_turnNpc("wom41", _puppet_tbl.pol01)
          Fn_playMotionNpc("wom41", L12_17.talk_angry01, false, L0_5)
        end
        if L1_25 ~= true or L0_24 ~= true then
          wait()
        end
      end
    end):abort()
  end
  if invoke_phase ~= nil then
    invoke_phase:abort()
    invoke_phase = nil
  end
  Fn_naviKill()
  Fn_findNpc("pol01"):turn(Fn_getPlayer(), {
    upperAnim = L11_16.stay01
  })
  Fn_turnNpc("wom41", Fn_getPlayer())
  Fn_kaiwaDemoView("ep15_00130k")
  Fn_setNpcActive("kaji", false)
  Fn_setNpcActive("police1", false)
  Fn_setNpcActive("police2", false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _grigo_bgm ~= nil then
    _grigo_bgm:abort()
    _grigo_bgm = nil
  end
  Mob:letStateMode(Mob.StateMode.kGrigoSuspend, false)
end
function pccubesensor2_grigoC_event_01_OnEnter(A0_28)
  Fn_pcSensorOff(A0_28)
  _gotoNextPhase()
end
function pccubesensor2_police_event_01_OnEnter(A0_29)
  Fn_pcSensorOff(A0_29)
  _gotoNextPhase()
end
function childMove()
  return invokeTask(function()
    local L0_30, L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37
    L0_30 = {}
    L1_31 = {}
    L1_31.anim_run_speed = 1
    L1_31.anim_speed_over = true
    L1_31.runLength = -1
    L2_32 = {}
    for L6_36 = 1, CHILD_MAX do
      L7_37 = Fn_moveNpc
      L7_37 = L7_37("chi0" .. L6_36, {
        "locator2_child_move_0" .. L6_36
      }, L1_31)
      L0_30[L6_36] = L7_37
      L2_32[L6_36] = false
    end
    L7_37 = "chi01_stay_line_00"
    for L7_37 = 1, CHILD_MAX do
      Fn_loadNpcEventMotion("chi0" .. L7_37, L3_33)
      while _puppet_tbl["chi0" .. L7_37]:isLoading() do
        wait()
      end
    end
    while true do
      for L7_37 = 1, CHILD_MAX do
        if L0_30[L7_37]:isRunning() == false and L2_32[L7_37] == false then
          L2_32[L7_37] = true
          invokeTask(function()
            Fn_turnNpc("chi0" .. L7_37, "locator2_child_view_01")
            Fn_findNpc("chi0" .. L7_37):playMotion(L3_33[L7_37], {
              {isRepeat = true}
            })
          end)
        else
        end
      end
      L4_34()
    end
  end)
end
function childEscape()
  invokeTask(function()
    local L0_38, L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45
    L0_38 = {
      L1_39,
      L2_40,
      L3_41,
      L4_42,
      L5_43
    }
    L1_39 = "chi01_talk_01"
    L2_40 = "chi01_cry_00"
    L1_39 = {}
    L1_39.anim_run_speed = 1.8
    L1_39.anim_speed_over = true
    L1_39.runLength = -1
    L2_40 = {}
    for L6_44 = 1, CHILD_MAX do
      L7_45 = Fn_moveNpc
      L7_45 = L7_45("chi0" .. L6_44, {
        "locator2_child_escape_relay_01",
        "locator2_child_escape_pos_0" .. L6_44
      }, L1_39)
      L2_40[L6_44] = L7_45
    end
    for L6_44 = 1, CHILD_MAX do
      L7_45 = L6_44 % 2
      if L7_45 then
        L7_45 = Sound
        L7_45 = L7_45.playSE
        L7_45(L7_45, "m37_933", 1, "")
      else
        L7_45 = Sound
        L7_45 = L7_45.playSE
        L7_45(L7_45, "w22_933", 1, "")
      end
      L7_45 = Fn_loadNpcEventMotion
      L7_45("chi0" .. L6_44, L0_38)
      while true do
        L7_45 = _puppet_tbl
        L7_45 = L7_45["chi0" .. L6_44]
        L7_45 = L7_45.isLoading
        L7_45 = L7_45(L7_45)
        if L7_45 then
          L7_45 = wait
          L7_45()
        end
      end
      L7_45 = waitSeconds
      L7_45(0.2 * (L6_44 % 2 + 1))
    end
    for L7_45 = 1, CHILD_MAX do
      L3_41[L7_45] = false
    end
    while true do
      for L7_45 = 1, CHILD_MAX do
        if L2_40[L7_45]:isRunning() == false and L3_41[L7_45] == false then
          L3_41[L7_45] = true
          invokeTask(function()
            if L7_45 == 1 then
              Fn_turnNpc("chi0" .. L7_45, "locator2_child_view_02")
            end
            Fn_findNpc("chi0" .. L7_45):playMotion(L0_38[L7_45], {
              {isRepeat = true}
            })
          end)
        else
        end
      end
      L4_42()
    end
  end)
end
function grigo03NaviCheck()
  if Fn_get_distance(_puppet_tbl.gri03:getWorldPos(), Fn_getPlayerWorldPos()) > GRI03_RE_NAVI_DIST then
    Fn_naviSet(_puppet_tbl.gri03)
  elseif Fn_get_distance(_puppet_tbl.gri03:getWorldPos(), Fn_getPlayerWorldPos()) < GRI03_DEL_NAVI_DIST then
    Fn_naviKill()
  end
end
