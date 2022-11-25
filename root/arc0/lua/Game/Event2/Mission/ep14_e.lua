import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Mob/mob_event_util.lua")
_sdemo = nil
_schoolnavi = nil
_view_node = nil
_now_notice_act = false
_police_pup_tbl = {
  {},
  {},
  {}
}
_check_task = nil
_arrivalschool = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_school"
  L0_0(L1_1)
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "ep14_sdemo"
  L0_0 = L0_0(L1_1)
  _sdemo = L0_0
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_start_pos"
  L0_0(L1_1)
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictFromEnteringBehindFerrisWheel
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictZone_ep14_01
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictStops_ep14_02
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5
  }
  L1_1 = {}
  L1_1.name = "police01"
  L1_1.type = "man31"
  L1_1.node = "locator2_police_1_1"
  L1_1.anim_name = "lookaround_01"
  L2_2 = {}
  L2_2.name = "police02"
  L2_2.type = "man31"
  L2_2.node = "locator2_police_1_2"
  L2_2.anim_name = "lookaround_03"
  L3_3 = {}
  L3_3.name = "police03"
  L3_3.type = "man31"
  L3_3.node = "locator2_police_1_3"
  L3_3.anim_name = "lookaround_01"
  L4_4 = {}
  L4_4.name = "police04"
  L4_4.type = "man31"
  L4_4.node = "locator2_police_1_4"
  L4_4.anim_name = "lookaround_03"
  L5_5 = {}
  L5_5.name = "police05"
  L5_5.type = "man31"
  L5_5.node = "locator2_police_1_5"
  L5_5.anim_name = "lookaround_01"
  L1_1 = {
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L2_2 = {}
  L2_2.name = "police06"
  L2_2.type = "man31"
  L2_2.node = "locator2_police_2_1"
  L2_2.anim_name = "lookaround_03"
  L3_3 = {}
  L3_3.name = "police07"
  L3_3.type = "man31"
  L3_3.node = "locator2_police_2_2"
  L3_3.anim_name = "lookaround_01"
  L4_4 = {}
  L4_4.name = "police08"
  L4_4.type = "man31"
  L4_4.node = "locator2_police_2_3"
  L4_4.anim_name = "lookaround_03"
  L5_5 = {}
  L5_5.name = "police09"
  L5_5.type = "man31"
  L5_5.node = "locator2_police_2_4"
  L5_5.anim_name = "lookaround_01"
  L6_6.name = "police10"
  L6_6.type = "man31"
  L6_6.node = "locator2_police_2_5"
  L6_6.anim_name = "lookaround_03"
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7
  }
  L3_3 = {}
  L3_3.name = "police11"
  L3_3.type = "man31"
  L3_3.node = "locator2_police_3_1"
  L3_3.anim_name = "lookaround_01"
  L4_4 = {}
  L4_4.name = "police12"
  L4_4.type = "man31"
  L4_4.node = "locator2_police_3_2"
  L4_4.anim_name = "lookaround_03"
  L5_5 = {}
  L5_5.name = "police13"
  L5_5.type = "man31"
  L5_5.node = "locator2_police_3_3"
  L5_5.anim_name = "lookaround_01"
  L6_6.name = "police14"
  L6_6.type = "man31"
  L6_6.node = "locator2_police_3_4"
  L6_6.anim_name = "lookaround_03"
  L7_7.name = "police15"
  L7_7.type = "man31"
  L7_7.node = "locator2_police_3_5"
  L7_7.anim_name = "lookaround_01"
  L3_3 = Fn_setupNpc
  L4_4 = L0_0
  L3_3 = L3_3(L4_4)
  L4_4 = Fn_setupNpc
  L5_5 = L1_1
  L4_4 = L4_4(L5_5)
  L5_5 = Fn_setupNpc
  L5_5 = L5_5(L6_6)
  for L9_9, _FORV_10_ in L6_6(L7_7) do
    _police_pup_tbl[1][L9_9] = Fn_findNpcPuppet(L9_9)
  end
  for L9_9, _FORV_10_ in L6_6(L7_7) do
    _police_pup_tbl[2][L9_9] = Fn_findNpcPuppet(L9_9)
  end
  for L9_9, _FORV_10_ in L6_6(L7_7) do
    _police_pup_tbl[3][L9_9] = Fn_findNpcPuppet(L9_9)
  end
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13
  L0_10 = Fn_sendEventComSb
  L1_11 = "ep14_e_setShipPos"
  L0_10(L1_11)
  L0_10 = Fn_sendEventComSb
  L1_11 = "ePartbrahmanControl"
  L0_10(L1_11)
  while true do
    L0_10 = Fn_sendEventComSb
    L1_11 = "nowBraPhase"
    L0_10 = L0_10(L1_11)
    if L0_10 ~= 1 then
      L0_10 = wait
      L0_10()
    end
  end
  L0_10 = Fn_missionStart
  L0_10()
  L0_10 = Fn_kaiwaDemoView
  L1_11 = "ep14_00160k"
  L0_10(L1_11)
  L0_10 = {
    L1_11,
    L2_12,
    L3_13
  }
  L1_11 = "ep14_00161k"
  L2_12 = "ep14_00162k"
  L3_13 = "ep14_00163k"
  L1_11 = {
    L2_12,
    L3_13,
    {
      text = "ep14_04012",
      btn = Pad.kButton_RR
    }
  }
  L2_12 = {}
  L2_12.text = "ep14_04010"
  L3_13 = Pad
  L3_13 = L3_13.kButton_RL
  L2_12.btn = L3_13
  L3_13 = {}
  L3_13.text = "ep14_04011"
  L3_13.btn = Pad.kButton_RD
  L2_12 = HUD
  L3_13 = L2_12
  L2_12 = L2_12.selectionOpen
  L2_12(L3_13, "ep14_04013", L1_11)
  L2_12 = nil
  while true do
    L3_13 = HUD
    L3_13 = L3_13.selectionResult
    L3_13 = L3_13(L3_13)
    L2_12 = L3_13
    if L2_12 ~= nil then
      L3_13 = Pad
      L3_13 = L3_13.kButton_RL
      if L2_12 == L3_13 then
        L3_13 = Fn_kaiwaDemoView
        L3_13(L0_10[1])
      else
        L3_13 = Pad
        L3_13 = L3_13.kButton_RD
        if L2_12 == L3_13 then
          L3_13 = Fn_kaiwaDemoView
          L3_13(L0_10[2])
        else
          L3_13 = Pad
          L3_13 = L3_13.kButton_RR
          if L2_12 == L3_13 then
            L3_13 = Fn_kaiwaDemoView
            L3_13(L0_10[3])
          end
        end
      end
      L3_13 = print
      L3_13("kButton:" .. L2_12)
      break
    end
    L3_13 = wait
    L3_13()
  end
  L3_13 = Fn_sendEventComSb
  L3_13("sdemoShipMove")
  L3_13 = waitSeconds
  L3_13(0.8)
  L3_13 = Fn_sendEventComSb
  L3_13 = L3_13("checkComSbViewNode")
  _view_node = L3_13
  L3_13 = _sdemo
  L3_13 = L3_13.set
  L3_13(L3_13, "locator2_cam_01", _view_node, true)
  L3_13 = _sdemo
  L3_13 = L3_13.play
  L3_13(L3_13)
  L3_13 = Fn_getPlayer
  L3_13 = L3_13()
  L3_13 = L3_13.setVisible
  L3_13(L3_13, false)
  L3_13 = Sound
  L3_13 = L3_13.playSE
  L3_13(L3_13, "kit_512", 1)
  L3_13 = Fn_captionView
  L3_13("ep14_02020", 2)
  L3_13 = Fn_sendEventComSb
  L3_13("addBraPhase")
  while true do
    L3_13 = Fn_sendEventComSb
    L3_13 = L3_13("nowBraPhase")
    if L3_13 ~= 3 then
      L3_13 = wait
      L3_13()
    end
  end
  L3_13 = waitSeconds
  L3_13(2.5)
  L3_13 = Fn_captionView
  L3_13("ep14_04000", 2.5)
  L3_13 = waitSeconds
  L3_13(3.5)
  L3_13 = _sdemo
  L3_13 = L3_13.stop
  L3_13(L3_13, 0)
  L3_13 = Fn_getPlayer
  L3_13 = L3_13()
  L3_13 = L3_13.setVisible
  L3_13(L3_13, true)
  L3_13 = Fn_userCtrlOn
  L3_13()
  L3_13 = Player
  L3_13 = L3_13.setStay
  L3_13(L3_13, false)
  L3_13 = Fn_sendEventComSb
  L3_13("addBraPhase")
  L3_13 = waitSeconds
  L3_13(1)
  L3_13 = Fn_captionView
  L3_13("ep14_04001")
  L3_13 = waitSeconds
  L3_13(1)
  L3_13 = Fn_missionView
  L3_13("ep14_04007")
  L3_13 = waitSeconds
  L3_13(1.3)
  L3_13 = Fn_tutorialCaption
  L3_13("grab")
  while true do
    L3_13 = Fn_sendEventComSb
    L3_13 = L3_13("isBraGrabbed")
    if L3_13 == false then
      L3_13 = wait
      L3_13()
    end
  end
  L3_13 = invokeTask
  L3_13(function()
    while not _arrivalschool do
      if Fn_sendEventComSb("isGrabbedBrahman") then
        if findGameObject2("PlayerSensor", "pccubesensor2_school"):getActive() == false then
          Fn_pcSensorOn("pccubesensor2_school")
        end
      elseif findGameObject2("PlayerSensor", "pccubesensor2_school"):getActive() then
        Fn_pcSensorOff("pccubesensor2_school")
      end
      wait()
    end
    Fn_pcSensorOff("pccubesensor2_school")
  end)
  L3_13 = Fn_tutorialCaptionKill
  L3_13()
  L3_13 = Fn_naviSet
  L3_13(findGameObject2("PlayerSensor", "pccubesensor2_school"))
  L3_13 = waitSeconds
  L3_13(2.5)
  while true do
    L3_13 = Fn_isCaptionView
    L3_13 = L3_13()
    L3_13 = L3_13 or _now_notice_act
    if L3_13 then
      L3_13 = wait
      L3_13()
    end
  end
  L3_13 = Fn_captionView
  L3_13("ep14_04014")
  L3_13 = Fn_pcSensorOn
  L3_13("pccubesensor2_school")
  L3_13 = waitPhase
  L3_13()
  _arrivalschool = true
  L3_13 = Player
  L3_13 = L3_13.setStay
  L3_13(L3_13, true)
  L3_13 = Fn_naviKill
  L3_13()
  L3_13 = Fn_userCtrlOff
  L3_13()
  while true do
    L3_13 = Fn_isCaptionView
    L3_13 = L3_13()
    if L3_13 then
      L3_13 = wait
      L3_13()
    end
  end
  L3_13 = Fn_blackout
  L3_13(1)
  _arrived = true
  L3_13 = Fn_pcSensorOff
  L3_13("pccubesensormulti2_monitoring_01")
  L3_13 = Fn_sendEventComSb
  L3_13("addBraPhase")
  L3_13 = wait
  L3_13()
  L3_13 = findGameObject2
  L3_13 = L3_13("Node", "locator2_kit_school")
  Fn_resetPcPos(L3_13)
  wait()
  Fn_fadein(2, false)
  _sdemo:set("locator2_sdemo_02", "locator2_aim_03")
  _sdemo:play()
  waitSeconds(3)
  _sdemo:stop()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setStay(false)
  end
  Fn_tutorialCaptionKill()
  Mob:restrictFromEnteringBehindFerrisWheel(false)
  Mob:restrictZone_ep14_01(false)
  Mob:restrictStops_ep14_02(false)
end
function monitoringOnEnter()
  _arrived = true
  _check_task = invokeTask(function()
    while true do
      if Fn_sendEventComSb("isBraGrabbed") and _now_notice_act == false then
        _now_notice_act = true
        Fn_sendEventComSb("noticeFlgOn")
        print("_noticed = true \227\129\171\227\129\153\227\130\139")
        invokeTask(function()
          local L0_14
          L0_14 = Player
          L0_14 = L0_14.setStay
          L0_14(L0_14, true)
          L0_14 = Fn_userCtrlAllOff
          L0_14()
          L0_14 = waitSeconds
          L0_14(0.6)
          L0_14 = Fn_captionView
          L0_14("ep14_04008", 2)
          L0_14 = waitSeconds
          L0_14(0.5)
          L0_14 = viewControl
          L0_14(_view_node)
          L0_14 = Fn_captionView
          L0_14("ep14_04009")
          L0_14 = waitSeconds
          L0_14(2)
          L0_14 = Fn_blackout
          L0_14()
          L0_14 = Fn_sendEventComSb
          L0_14("braReset")
          L0_14 = findGameObject2
          L0_14 = L0_14("Node", "locator2_pc_start_pos")
          Fn_resetPcPos(L0_14)
          while Fn_sendEventComSb("checkBraResetFlg") do
            wait()
          end
          Fn_fadein()
          Player:setStay(false)
          Fn_userCtrlOn()
          _now_notice_act = false
        end)
        break
      end
      wait()
    end
  end)
end
function monitoringOnLeave()
  if _check_task ~= nil then
    _check_task:abort()
    _check_task = nil
  end
end
function monitoringPoliceOnEnter(A0_15)
  local L1_16, L2_17
  L1_16 = Fn_sendEventComSb
  L2_17 = "isBraGrabbed"
  L1_16 = L1_16(L2_17)
  if L1_16 then
    L1_16 = _now_notice_act
    if L1_16 == false then
      _arrived = true
      _now_notice_act = true
      L2_17 = A0_15
      L1_16 = A0_15.getName
      L1_16 = L1_16(L2_17)
      L2_17 = tonumber
      L2_17 = L2_17(string.sub(L1_16, -1))
      invokeTask(function()
        local L0_18, L1_19, L2_20, L3_21, L4_22
        while true do
          L0_18 = canSeePolice
          L1_19 = L2_17
          L0_18 = L0_18(L1_19)
          if L0_18 == false then
            L0_18 = wait
            L0_18()
          end
        end
        L0_18 = wait
        L1_19 = 20
        L0_18(L1_19)
        while true do
          L0_18 = canSeePolice
          L1_19 = L2_17
          L0_18 = L0_18(L1_19)
          if L0_18 == false then
            L0_18 = wait
            L0_18()
          end
        end
        L0_18 = pcStayCamStopOn
        L0_18()
        L0_18 = serchNearPolice
        L1_19 = L2_17
        L0_18 = L0_18(L1_19)
        L1_19 = reactionPolice
        L2_20 = L2_17
        L3_21 = L0_18
        L1_19(L2_20, L3_21)
        L1_19 = _police_pup_tbl
        L2_20 = L2_17
        L1_19 = L1_19[L2_20]
        L1_19 = L1_19[L0_18]
        L2_20 = L1_19
        L1_19 = L1_19.getWorldPos
        L1_19 = L1_19(L2_20)
        L2_20 = L1_19.y
        L2_20 = L2_20 + 1.5
        L1_19.y = L2_20
        L2_20 = wait
        L2_20()
        L2_20 = Sound
        L3_21 = L2_20
        L2_20 = L2_20.playSEHandle
        L4_22 = "m32_601"
        L2_20 = L2_20(L3_21, L4_22, 1, "", L1_19)
        L3_21 = Sound
        L4_22 = L3_21
        L3_21 = L3_21.setAudibleRange
        L3_21(L4_22, L2_20, 80)
        L3_21 = Fn_captionViewWait
        L4_22 = "ep14_05017"
        L3_21(L4_22, 2, 1)
        L3_21 = Sound
        L4_22 = L3_21
        L3_21 = L3_21.playSEHandle
        L3_21 = L3_21(L4_22, "ep14_siren", 1)
        L4_22 = waitSeconds
        L4_22(0.6)
        L4_22 = viewControl
        L4_22(_police_pup_tbl[L2_17][L0_18], nil, 0, 1.3)
        L4_22 = Fn_captionViewWait
        L4_22("ep14_05018", 2)
        L4_22 = Fn_blackout
        L4_22()
        L4_22 = resetMonitoringMotion
        L4_22(L2_17)
        L4_22 = Fn_sendEventComSb
        L4_22("braReset")
        L4_22 = findGameObject2
        L4_22 = L4_22("Node", "locator2_pc_start_pos")
        Fn_resetPcPos(L4_22)
        while Fn_sendEventComSb("checkBraResetFlg") do
          wait()
        end
        Sound:stopSEHandle(L3_21)
        L3_21 = nil
        Fn_fadein()
        pcStayCamStopOff()
        _now_notice_act = false
      end)
    end
  else
  end
end
function canSeePolice(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29
  L1_24 = false
  for L5_28, L6_29 in L2_25(L3_26) do
    if rayCheck(L6_29, 80, 1.5) and L1_24 == false then
      L1_24 = true
    end
  end
  return L1_24
end
function serchNearPolice(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39
  L1_31, L2_32 = nil, nil
  L3_33 = Fn_getPlayerWorldPos
  L3_33 = L3_33()
  while L1_31 == nil do
    for L7_37, L8_38 in L4_34(L5_35) do
      L9_39 = L8_38.getWorldPos
      L9_39 = L9_39(L8_38)
      if L2_32 == nil or L2_32 > Fn_get_distance(L3_33, L9_39) then
        L2_32, L1_31 = Fn_get_distance(L3_33, L9_39), L7_37
      end
    end
    L4_34()
  end
  return L1_31
end
function reactionPolice(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47
  L2_42 = false
  L3_43 = {}
  L3_43.degree_h = 200
  L3_43.degree_v = 180
  L3_43.in_length = 60
  L3_43.out_length = 80
  L3_43.valid = true
  L3_43.targetJoint = "bn_head"
  L3_43.watchTarget = true
  L3_43.onlyFace = true
  L3_43.forceTarget = true
  for L7_47, _FORV_8_ in L4_44(L5_45) do
    Fn_findNpc(L7_47):setSightParam(L3_43)
    wait()
    invokeTask(function()
      if L7_47 == A1_41 then
        Fn_turnNpc(L7_47)
        Fn_playMotionNpc(L7_47, "scared_03", false, {animBlendDuration = 0.5})
        L2_42 = true
      else
        while L2_42 == false do
          wait()
        end
        Fn_turnNpc(L7_47)
        if tonumber(string.sub(L7_47, -1)) % 2 == 0 then
          Fn_playMotionNpc(L7_47, "scared_04", false, {animBlendDuration = 0.5})
        else
          Fn_playMotionNpc(L7_47, "shock_in_00", true, {animBlendDuration = 0.5})
          Fn_playNpcEventMotion(L7_47, "shock_00", true, 0.4, false, 0, false)
        end
      end
    end)
    break
  end
end
function resetMonitoringMotion(A0_48)
  local L1_49, L2_50, L3_51, L4_52
  for L4_52, _FORV_5_ in L1_49(L2_50) do
    if tonumber(string.sub(L4_52, -1)) % 2 == 0 then
      Fn_playMotionNpc(L4_52, "lookaround_03", false, {animBlendDuration = 0.5})
    else
      Fn_playMotionNpc(L4_52, "lookaround_01", false, {animBlendDuration = 0.5})
    end
  end
end
