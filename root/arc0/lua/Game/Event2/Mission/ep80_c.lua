import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
dofile("/Game/Misc/pdemo.lua")
_next_phase = false
_pdemo = nil
_sdemo = nil
_vog_task = nil
_finish_land = false
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = {L1_1, L2_2}
  L1_1 = "evarea2_po_a_01_man40"
  L2_2 = "evarea2_po_a_01_vog"
  L1_1 = Fn_loadEventData
  L2_2 = "evx/ep80_common"
  L1_1(L2_2, L0_0, true)
  L1_1 = {
    L2_2,
    {
      name = "man50",
      type = "man50",
      node = "locator2_man50_01",
      attach = false,
      active = false,
      anim_name = "lookaround_02"
    },
    {
      name = "man51",
      type = "man51",
      node = "locator2_man51_01",
      attach = false,
      active = false,
      anim_name = "count_00"
    },
    {
      name = "man52",
      type = "man52",
      node = "locator2_man52_01",
      attach = false,
      active = false,
      anim_name = "check_00"
    },
    {
      name = "gull01",
      type = "gull01",
      node = "locator2_gull01_01",
      attach = false,
      use_gravity = false
    },
    {
      name = "vendor",
      type = "man40",
      node = "locator2_man40_01",
      attach = false,
      use_gravity = false,
      active = false
    }
  }
  L2_2 = {}
  L2_2.name = "vog01"
  L2_2.type = "vog01"
  L2_2.node = "locator2_vog01_01"
  L2_2.attach = false
  L2_2.active = false
  L2_2.anim_name = "confuse_00"
  L2_2 = Fn_setupNpc
  L2_2(L1_1)
  L2_2 = Fn_pcSensorOff
  L2_2("pccubesensor2_gull_goal")
  L2_2 = Fn_pcSensorOff
  L2_2("pccubesensor2_land")
  L2_2 = Fn_pcSensorOff
  L2_2("pccubesensor2_vog")
  L2_2 = Fn_pcSensorOff
  L2_2("pccubesensor2_gull_navi_in")
  L2_2 = Fn_pcSensorOff
  L2_2("pccubesensor2_gull_navi_out")
  L2_2 = Fn_pcSensorOff
  L2_2("pccubesensor2_gull_outrange")
  L2_2 = GameDatabase
  L2_2 = L2_2.get
  L2_2 = L2_2(L2_2, ggd.EventFlags__ep80__BeginnerMode)
  if L2_2 == true then
    L2_2 = Fn_setNpcActive
    L2_2("vendor", true)
    L2_2 = mob_placement_enabled
    L2_2("po_a_01", "vendors_sk_09_03_event", false)
  end
  L2_2 = Fn_findAreaHandle
  L2_2 = L2_2("po_a_01")
  _pdemo = PDemo.create("ep90_sd_yakitori", L2_2, {camera = true, scene_param = false})
  _sdemo = SDemo.create("ep80_header")
end
function Ingame()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
  L0_3 = GameDatabase
  L1_4 = L0_3
  L0_3 = L0_3.get
  L2_5 = ggd
  L2_5 = L2_5.EventFlags__ep80__BeginnerMode
  L0_3 = L0_3(L1_4, L2_5)
  if L0_3 == true then
    L0_3 = Fn_lockPlayerAbility
    L1_4 = Player
    L1_4 = L1_4.kAbility_Slider
    L0_3(L1_4)
  end
  L0_3 = Fn_setCatWarpCheckPoint
  L1_4 = "locator2_pc_start_pos"
  L0_3(L1_4)
  L0_3 = Fn_sendEventComSb
  L1_4 = "requestCrateSetActive"
  L2_5 = "bg2_crate_b"
  L3_6 = false
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Fn_findNpc
  L1_4 = "gull01"
  L0_3 = L0_3(L1_4)
  L1_4 = Fn_findNpcPuppet
  L2_5 = L0_3
  L1_4 = L1_4(L2_5)
  L2_5 = Fn_setNpcVisible
  L3_6 = "gull01"
  L4_7 = false
  L2_5(L3_6, L4_7)
  L2_5 = Fn_createGimmickBg
  L3_6 = nil
  L4_7 = "skewered01"
  L5_8 = "ciskewered01_base"
  L6_9 = true
  L2_5 = L2_5(L3_6, L4_7, L5_8, L6_9)
  L4_7 = L2_5
  L3_6 = L2_5.setActive
  L5_8 = false
  L3_6(L4_7, L5_8)
  L3_6 = Fn_createGimmickBg
  L4_7 = findGameObject2
  L5_8 = "Node"
  L6_9 = "locator2_skewered02"
  L4_7 = L4_7(L5_8, L6_9)
  L5_8 = "skewered02"
  L6_9 = "ciskewered02_base"
  L7_10 = true
  L3_6 = L3_6(L4_7, L5_8, L6_9, L7_10)
  L5_8 = L3_6
  L4_7 = L3_6.setActive
  L6_9 = false
  L4_7(L5_8, L6_9)
  L4_7 = findGameObject2
  L5_8 = "Node"
  L6_9 = "locator2_vog01_01"
  L4_7 = L4_7(L5_8, L6_9)
  L5_8 = GameDatabase
  L6_9 = L5_8
  L5_8 = L5_8.get
  L7_10 = ggd
  L7_10 = L7_10.EventFlags__ep80__BeginnerMode
  L5_8 = L5_8(L6_9, L7_10)
  if L5_8 == true then
    L5_8 = Fn_userCtrlOff
    L5_8()
    L5_8 = Area
    L6_9 = L5_8
    L5_8 = L5_8.requestRestore
    L5_8(L6_9)
    L5_8 = wait
    L5_8()
    L5_8 = Fn_findNpc
    L6_9 = "vendor"
    L5_8 = L5_8(L6_9)
    L6_9 = Fn_findNpcPuppet
    L7_10 = L5_8
    L6_9 = L6_9(L7_10)
    L7_10 = Fn_playMotionNpc
    L8_11 = L5_8
    L7_10(L8_11, "cook_yakitori_00", false)
    L7_10 = Fn_setKittenAndCatActive
    L8_11 = false
    L7_10(L8_11)
    L7_10 = Fn_resetPcPos
    L8_11 = "locator2_pc_start_pos"
    L7_10(L8_11)
    L7_10 = Fn_setNpcVisible
    L8_11 = "vendor"
    L7_10(L8_11, false)
    while true do
      L7_10 = _pdemo
      L8_11 = L7_10
      L7_10 = L7_10.isLoading
      L7_10 = L7_10(L8_11)
      if L7_10 == false then
        L7_10 = wait
        L7_10()
      end
    end
    L7_10 = _pdemo
    L8_11 = L7_10
    L7_10 = L7_10.setVisible
    L7_10(L8_11, true)
    L7_10 = _pdemo
    L8_11 = L7_10
    L7_10 = L7_10.switchCamera
    L7_10(L8_11, true, 0)
    L7_10 = Fn_missionStart
    L7_10()
    L7_10 = Fn_kaiwaDemoView
    L8_11 = "ep80_00040k"
    L7_10(L8_11)
    L7_10 = _pdemo
    L8_11 = L7_10
    L7_10 = L7_10.play
    L7_10(L8_11)
    while true do
      L7_10 = _pdemo
      L8_11 = L7_10
      L7_10 = L7_10.isEnd
      L7_10 = L7_10(L8_11)
      if L7_10 == false then
        L7_10 = wait
        L7_10()
      end
    end
    L7_10 = Fn_setKittenAndCatActive
    L8_11 = true
    L7_10(L8_11)
    L7_10 = Fn_setNpcVisible
    L8_11 = "vendor"
    L7_10(L8_11, true)
    L7_10 = _pdemo
    L8_11 = L7_10
    L7_10 = L7_10.stop
    L7_10(L8_11, 2)
    L7_10 = _pdemo
    L8_11 = L7_10
    L7_10 = L7_10.try_term
    L7_10(L8_11)
    L7_10 = Fn_pcSensorOn
    L8_11 = "pccubesensor2_gull_navi_out"
    L7_10(L8_11)
    L7_10 = Fn_pcSensorOn
    L8_11 = "pccubesensor2_gull_outrange"
    L7_10(L8_11)
    L7_10 = Fn_userCtrlOn
    L7_10()
    L7_10 = Fn_setNpcVisible
    L8_11 = "gull01"
    L7_10(L8_11, true)
    L8_11 = L2_5
    L7_10 = L2_5.setActive
    L7_10(L8_11, true)
    L7_10 = Fn_attachJoint
    L8_11 = L2_5
    L7_10(L8_11, L1_4, "loc_ci00")
    L7_10 = HUD
    L8_11 = L7_10
    L7_10 = L7_10.naviSetPochiDistanceDensity0
    L7_10(L8_11, 30)
    L7_10 = HUD
    L8_11 = L7_10
    L7_10 = L7_10.naviSetPochiDistanceDensity100
    L7_10(L8_11, 40)
    L7_10 = Fn_naviSet
    L8_11 = L1_4
    L7_10(L8_11)
    L7_10 = invokeTask
    function L8_11()
      waitSeconds(1)
      Fn_captionViewWait("ep80_00046")
      Fn_missionView("ep80_00047")
      waitSeconds(2.5)
      Fn_tutorialCaption("gravity")
    end
    L7_10(L8_11)
    while true do
      L7_10 = Fn_get_distance
      L8_11 = L1_4.getWorldPos
      L8_11 = L8_11(L1_4)
      L7_10 = L7_10(L8_11, Fn_getPlayerWorldPos())
      if L7_10 > 15 then
        L7_10 = wait
        L7_10()
      end
    end
    L7_10 = get_move_tbl
    L8_11 = "a"
    L7_10 = L7_10(L8_11)
    L8_11 = L7_10[1]
    L8_11.attr = "takeoff"
    L8_11 = #L7_10
    L8_11 = L7_10[L8_11]
    L8_11.attr = "land"
    L8_11 = fly_escape_player
    L8_11(L0_3, L7_10, {moveSpeed = 10})
    while true do
      L8_11 = Fn_get_distance
      L8_11 = L8_11(L1_4:getWorldPos(), Fn_getPlayerWorldPos())
      if L8_11 > 30 then
        L8_11 = wait
        L8_11()
      end
    end
    L8_11 = Fn_setCatWarpCheckPoint
    L8_11("warppoint2_gull_interval")
    L8_11 = Fn_tutorialCaptionKill
    L8_11()
    L8_11 = setup_vog
    L8_11()
    L8_11 = get_move_tbl
    L8_11 = L8_11("b")
    L8_11[1].attr = "takeoff"
    L8_11[#L8_11].attr = "land"
    fly_escape_player(L0_3, L8_11, {moveSpeed = 10})
    L2_5:setActive(false)
    L3_6:setActive(true)
    Fn_playMotionNpc(L0_3, "eat", false)
    Fn_pcSensorOn("pccubesensor2_gull_goal")
    Fn_pcSensorOn("pccubesensor2_land")
    waitPhase()
    Fn_naviKill()
    Player:setStay(true)
    Fn_userCtrlOff()
    _sdemo:set("locator2_cut01_cam01", L1_4, kSDEMO_APPEND_AIM)
    _sdemo:offset(nil, Vector(0, 0.5, 0))
    _sdemo:play({
      {
        time = 4,
        pos = "locator2_cut01_cam02"
      }
    })
    waitSeconds(1)
    if _finish_land == true then
      Player:setGravityControlMode(false)
      for _FORV_12_ = 0, 20 do
        if Player:getAction() ~= Player.kAction_Idle then
          waitSeconds(0.1)
        end
      end
      waitSeconds(0.5)
      Fn_playerTurn(L1_4)
    end
    Fn_pcSensorOff("pccubesensor2_land")
    Sound:playSE("kit051c")
    Fn_captionView("ep80_00048")
    waitSeconds(1)
    move_c = get_move_tbl("c")
    move_c[1].attr = "takeoff"
    invokeTask(function()
      Fn_fly(L0_3, move_c, {moveSpeed = 15})
    end)
    while _sdemo:isPlay() do
      wait()
    end
    if _finish_land == true then
      Fn_playerTurnEnd()
    end
    _sdemo:set("locator2_cut_03_cam01", L1_4, kSDEMO_APPEND_AIM)
    _sdemo:play({
      {
        time = 4,
        pos = "locator2_cut01_cam03"
      }
    })
    Sound:playSE("kit051b_1")
    Fn_captionView("ep80_00049")
    while _sdemo:isPlay() do
      wait()
    end
    waitSeconds(2)
    _sdemo:set()
    _sdemo:play({
      {
        time = 1,
        pos = "locator2_cut01_cam04"
      }
    }, {
      {
        time = 1,
        pos = "locator2_cut01_aim04"
      }
    })
    while _sdemo:isPlay() do
      wait()
    end
    Fn_resetPcPos("warppoint2_gull_goal")
    Fn_captionView("ep80_00050")
    waitSeconds(2)
    _sdemo:play({
      {
        time = 1,
        pos = "locator2_cut01_cam05"
      }
    }, {
      {
        time = 1,
        pos = "locator2_cut01_aim05"
      }
    })
    while _sdemo:isPlay() do
      wait()
    end
    Camera:lookTo(L4_7:getWorldPos() + Vector(0, 1.5, 0), 0, 0)
    _sdemo:stop(1)
    waitSeconds(1)
    Fn_kaiwaDemoView("ep80_00050k")
    Player:setStay(false)
    Fn_userCtrlOn()
    waitSeconds(0.5)
    Fn_missionView("ep80_00106")
    waitSeconds(1.3)
    Fn_naviSet(L4_7)
    Fn_setCatWarpCheckPoint("warppoint2_gull_goal")
    Fn_pcSensorOff("pccubesensor2_gull_navi_in")
    Fn_pcSensorOff("pccubesensor2_gull_navi_out")
    Fn_pcSensorOff("pccubesensor2_gull_outrange")
  else
    L5_8 = setup_vog
    L5_8()
    L5_8 = Fn_missionStart
    L5_8()
    L5_8 = Fn_captionViewWait
    L6_9 = "ep80_00062"
    L5_8(L6_9)
    L5_8 = Fn_userCtrlOn
    L5_8()
    L5_8 = Fn_lookAtTargetInput
    L6_9 = L4_7
    L5_8(L6_9)
    L5_8 = Fn_captionViewWait
    L6_9 = "ep80_00063"
    L5_8(L6_9)
    L5_8 = Fn_missionView
    L6_9 = "ep80_00107"
    L5_8(L6_9)
    L5_8 = waitSeconds
    L6_9 = 1.3
    L5_8(L6_9)
    L5_8 = Fn_naviSet
    L6_9 = L4_7
    L5_8(L6_9)
    L5_8 = waitSeconds
    L6_9 = 2.5
    L5_8(L6_9)
    L5_8 = Fn_tutorialCaption
    L6_9 = "gravity"
    L5_8(L6_9)
  end
  L5_8 = Fn_pcSensorOn
  L6_9 = "pccubesensor2_vog"
  L5_8(L6_9)
  L5_8 = Fn_findNpc
  L6_9 = "vog01"
  L5_8 = L5_8(L6_9)
  L6_9 = create_mission_marker_story
  L7_10 = Fn_findNpcPuppet
  L8_11 = L5_8
  L7_10 = L7_10(L8_11)
  L8_11 = "ep80"
  L6_9(L7_10, L8_11, {}, true)
  L6_9 = start_game_obj
  L6_9()
  L6_9 = waitPhase
  L6_9()
  L6_9 = Fn_naviKill
  L6_9()
  L6_9 = Fn_tutorialCaptionKill
  L6_9()
  while true do
    L6_9 = wait
    L6_9()
  end
end
function Finalize()
  if _vog_task ~= nil and _vog_task:isRunning() == true then
    _vog_task:abort()
  end
  _vog_task = nil
  mob_placement_enabled("po_a_01", "vendors_sk_09_03_event", true)
end
function pccubesensor2_gull_navi_OnEnter(A0_12)
  Fn_pcSensorOn("pccubesensor2_gull_navi_out")
  A0_12:setActive(false)
end
function pccubesensor2_gull_navi_OnLeave(A0_13)
  Fn_captionView("ep80_00108")
  Fn_pcSensorOn("pccubesensor2_gull_navi_in")
  A0_13:setActive(false)
end
function pccubesensormulti2_land_OnEnter(A0_14)
  local L1_15
  _finish_land = true
end
function pccubesensormulti2_land_OnLeave(A0_16)
  local L1_17
  _finish_land = false
end
function get_move_tbl(A0_18)
  local L1_19, L2_20, L3_21
  L1_19 = 1
  L2_20 = {}
  while true do
    L3_21 = "locator2_gull01_escape_"
    L3_21 = L3_21 .. A0_18 .. "_" .. string.format("%02d", L1_19)
    if findGameObject2("Node", L3_21) ~= nil then
      L2_20[L1_19] = {pos = L3_21, attr = ""}
    else
      break
    end
    L1_19 = L1_19 + 1
  end
  return L2_20
end
function create_mission_marker_story(A0_22, A1_23, A2_24, A3_25)
  local L4_26, L5_27, L6_28, L7_29, L8_30, L9_31
  L4_26 = {}
  L4_26.target = A0_22
  L4_26.find_type = "Node"
  L5_27 = nil
  L6_28 = {}
  L6_28.name = "gui_marker_01"
  L7_29 = "ui_acdialog_main_"
  L8_30 = A1_23
  L7_29 = L7_29 .. L8_30
  L6_28.ad_title_id = L7_29
  L6_28.ad_sub_id = "ui_acdialog_sub_01"
  L7_29 = "ui_map_msinfo_main_"
  L8_30 = A1_23
  L7_29 = L7_29 .. L8_30
  L6_28.map_title_id = L7_29
  L6_28.map_sub_id = "ui_map_msinfo_header_01"
  L6_28.giude_id = "ui_keyguide_ac_01"
  if A3_25 then
    L7_29 = "A"
  else
    L7_29 = L7_29 or "default"
  end
  L6_28.pattern = L7_29
  L6_28.active = true
  L6_28.map_disp = true
  L7_29 = A2_24.marker
  if L7_29 then
    L7_29 = A2_24.marker
    L7_29 = L7_29.ad_main
    L7_29 = L7_29 or L6_28.ad_title_id
    L6_28.ad_title_id = L7_29
    L7_29 = A2_24.marker
    L7_29 = L7_29.ad_sub
    L7_29 = L7_29 or L6_28.ad_sub_id
    L6_28.ad_sub_id = L7_29
    L7_29 = A2_24.marker
    L7_29 = L7_29.map_main
    L7_29 = L7_29 or L6_28.map_title_id
    L6_28.map_title_id = L7_29
    L7_29 = A2_24.marker
    L7_29 = L7_29.map_sub
    L7_29 = L7_29 or L6_28.map_sub_id
    L6_28.map_sub_id = L7_29
    L7_29 = A2_24.marker
    L7_29 = L7_29.key_guide
    L7_29 = L7_29 or L6_28.giude_id
    L6_28.giude_id = L7_29
    L7_29 = A2_24.marker
    L7_29 = L7_29.pattern
    L7_29 = L7_29 or L6_28.pattern
    L6_28.pattern = L7_29
    L7_29 = A2_24.marker
    L7_29 = L7_29.active
    if L7_29 == nil then
      L7_29 = L6_28.active
    elseif not L7_29 then
      L7_29 = A2_24.marker
      L7_29 = L7_29.active
    end
    L6_28.active = L7_29
    L7_29 = A2_24.marker
    L5_27 = L7_29.ofs
  end
  L7_29, L8_30 = nil, nil
  L9_31 = A2_24.opt
  if L9_31 then
    L9_31 = A2_24.opt
    L7_29 = L9_31.kaiwa
    L9_31 = A2_24.opt
    L9_31 = L9_31.kaiwa2
    kaiwa2 = L9_31
    L9_31 = A2_24.opt
    L8_30 = L9_31.yesno
  end
  function L9_31()
    local L0_32, L1_33, L2_34, L3_35
    L0_32 = getMarkerHandle
    L1_33 = A0_22
    L0_32 = L0_32(L1_33)
    L2_34 = L0_32
    L1_33 = L0_32.playOut
    L1_33(L2_34)
    repeat
      L1_33 = wait
      L1_33()
      L2_34 = L0_32
      L1_33 = L0_32.isOutEnd
      L1_33 = L1_33(L2_34)
    until L1_33
    L1_33 = L7_29
    if L1_33 then
      L1_33 = Fn_kaiwaDemoView
      L2_34 = L7_29
      L1_33(L2_34)
      L1_33 = wait
      L1_33()
    end
    L1_33 = kaiwa2
    if L1_33 then
      L1_33 = GameDatabase
      L2_34 = L1_33
      L1_33 = L1_33.set
      L3_35 = ggd
      L3_35 = L3_35.Savedata__EventManageFlags__MonologueStart
      L1_33(L2_34, L3_35, kaiwa2)
    end
    L1_33 = false
    L2_34 = false
    L3_35 = L8_30
    if L3_35 then
      L2_34 = true
      L3_35 = Fn_userCtrlOff
      L3_35()
      L3_35 = HUD
      L3_35 = L3_35.yesnoOpen
      L3_35(L3_35, L8_30)
      L3_35 = nil
      while true do
        L3_35 = HUD:yesnoResult()
        if L3_35 ~= nil then
          if L3_35 == HUD.kYesNoAnswerYes then
            L1_33 = true
          elseif L3_35 == HUD.kYesNoAnswerNo then
          end
        else
          wait()
          else
            L1_33 = true
          end
        end
      end
    if L2_34 then
      L3_35 = Fn_userCtrlOn
      L3_35()
    end
    if L1_33 then
      L3_35 = Fn_naviKill
      L3_35()
      L3_35 = Fn_setKeepPlayerPos
      L3_35()
      L3_35 = Fn_setNextMissionFlag
      L3_35("ep80_c")
      L3_35 = Fn_nextMission
      L3_35()
      L3_35 = Fn_exitSandbox
      L3_35()
    else
      L3_35 = L0_32.playIn
      L3_35(L0_32)
    end
  end
  if L5_27 then
    setupMarkerBase(L4_26, L6_28, L9_31):setPos(L5_27)
  end
end
function setup_vog()
  Fn_sendEventComSb("requestCrateSetActive", "bg2_crate_a", true)
  Fn_sendEventComSb("requestVogoShipSetVisible", true)
  Fn_setNpcActive("vog01", true)
  Fn_setNpcActive("man50", true)
  Fn_setNpcActive("man51", true)
  Fn_setNpcActive("man52", true)
  set_man51_prop()
  _vog_task = vog_crate_broken_task()
end
