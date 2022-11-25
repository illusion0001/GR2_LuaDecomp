dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
_next_phase = false
_next_phase2 = false
_ep02_00133k_done = false
_phase_b = false
_QUOTA_TUTORIAL = 7
_is_in_sensor = false
_currentMissionText = ""
function Initialize()
  Fn_userCtrlGravityOff()
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_pcSensorOff("pcspheresensor2_02")
  Fn_pcSensorOff("pccubesensor2_c_25")
  Fn_pcSensorOff("pccubesensor2_c_26")
  Fn_pcSensorOff("pccubesensor2_event_01")
  Fn_pcSensorOff("pccubesensor2_event_02")
  Fn_pcSensorOff("pccubesensor2_event_03")
  Fn_pcSensorOff("pccubesensor2_event_04")
  Fn_pcSensorOff("pccubesensor2_warp_02")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = Fn_coercionGravityRevert
  L0_0()
  L0_0 = Fn_lockPlayerAbility
  L1_1 = Player
  L1_1 = L1_1.kAbility_GravityShift
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestPartC"
  L2_2 = 1
  L0_0(L1_1, L2_2)
  L0_0 = waitComNextPhase
  L0_0()
  function L0_0()
    Fn_setCageMoveParam({
      speed = 4,
      accel = 0,
      decel = 6
    })
    Fn_cageMove()
    wait(15)
  end
  L1_1 = Fn_missionStart
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = HUD
  L2_2 = L1_1
  L1_1 = L1_1.fadein
  L3_3 = 2
  L1_1(L2_2, L3_3)
  L1_1 = Fn_sendEventComSb
  L2_2 = "requestPartC"
  L3_3 = 2
  L1_1(L2_2, L3_3)
  L1_1 = waitComNextPhase
  L1_1()
  L1_1 = Fn_kaiwaDemoView
  L2_2 = "ep02_00130k"
  L1_1(L2_2)
  L1_1 = Fn_unLockPlayerAbility
  L2_2 = Player
  L2_2 = L2_2.kAbility_GravityShift
  L1_1(L2_2)
  L1_1 = {}
  L1_1.r_stick = true
  L1_1.l_stick = true
  L1_1.v_infinite = false
  L1_1.g_infinite = false
  L1_1.s_infinite = false
  L2_2 = Fn_lockPlayerAbility
  L3_3 = nil
  L2_2(L3_3, L1_1)
  L2_2 = Fn_userCtrlOff
  L2_2()
  L2_2 = Fn_sendEventComSb
  L3_3 = "setOreVisible"
  L2_2(L3_3, "gravityore_pi_a_01_04", false)
  L2_2 = Fn_setCatWarpCheckPoint
  L3_3 = "locator2_pc_start_pos_02"
  L2_2(L3_3)
  L2_2 = wasOpenInfo
  L3_3 = ggd
  L3_3 = L3_3.Savedata__Info__ep02__ep02_info_05
  L2_2 = L2_2(L3_3)
  if not L2_2 then
    L2_2 = HUD
    L3_3 = L2_2
    L2_2 = L2_2.info
    L2_2(L3_3, "ep02_info_05", true, -1)
    L2_2 = waitSeconds
    L3_3 = 1
    L2_2(L3_3)
    L2_2 = Fn_captionView
    L3_3 = "ep02_02000"
    L2_2(L3_3, 0)
    repeat
      L2_2 = wait
      L2_2()
      L2_2 = wasOpenInfo
      L3_3 = ggd
      L3_3 = L3_3.Savedata__Info__ep02__ep02_info_05
      L2_2 = L2_2(L3_3)
    until L2_2
    L2_2 = Fn_captionViewEnd
    L2_2()
  end
  L2_2 = {}
  L2_2.r_stick = true
  L2_2.l_stick = true
  L2_2.v_infinite = false
  L2_2.g_infinite = false
  L2_2.s_infinite = false
  L3_3 = Fn_unLockPlayerAbility
  L3_3(nil, L2_2)
  L3_3 = Fn_userCtrlOn
  L3_3()
  _currentMissionText = "ep02_02001"
  L3_3 = Fn_missionViewWait
  L3_3("ep02_02001")
  _next_phase = false
  L3_3 = Fn_sendEventComSb
  L3_3("requestPartC", 3)
  L3_3 = waitComNextPhase
  L3_3()
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_event_01")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_event_02")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_event_03")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_event_04")
  _next_phase = false
  repeat
    L3_3 = wait
    L3_3()
    L3_3 = _next_phase
  until L3_3
  L3_3 = Fn_sendEventComSb
  L3_3("notify", "request_misai_warp", true)
  L3_3 = Fn_sendEventComSb
  L3_3("setOreVisible", "gravityore_pi_a_01_04", true)
  L3_3 = Sound
  L3_3 = L3_3.playSE
  L3_3(L3_3, "m03_803_radio", 1, "")
  L3_3 = Fn_captionView
  L3_3("ep02_02002")
  L3_3 = Fn_sendEventComSb
  L3_3("lookAtNodeWait", "gravityore_pi_a_01_04", 0, 0.5)
  L3_3 = waitSeconds
  L3_3(2)
  _currentMissionText = "ep02_02021"
  L3_3 = Fn_missionView
  L3_3("ep02_02021")
  L3_3 = waitSeconds
  L3_3(_MARKER_WAIT_AFTER_MISSION_VIEW)
  L3_3 = Fn_naviSet
  L3_3(Fn_sendEventComSb("getOreHandle", "gravityore_pi_a_01_04"))
  L3_3 = waitSeconds
  L3_3(_CAPTION_WAIT_AFTER_MARKER)
  L3_3 = Fn_captionView
  L3_3("ep02_02003")
  L3_3 = Fn_sendEventComSb
  L3_3("requestPartC", 4)
  L3_3 = waitComNextPhase
  L3_3()
  L3_3 = Fn_naviKill
  L3_3()
  L3_3 = waitSeconds
  L3_3(0.1)
  L3_3 = Player
  L3_3 = L3_3.setStay
  L3_3(L3_3, true, true)
  L3_3 = Fn_userCtrlOff
  L3_3()
  L3_3 = Player
  L3_3 = L3_3.setStay
  L3_3(L3_3, false)
  L3_3 = Fn_coercionGravityRevert
  L3_3()
  L3_3 = waitSeconds
  L3_3(2)
  L3_3 = Fn_sendEventComSb
  L3_3("requestPartC", 5)
  L3_3 = waitComNextPhase
  L3_3()
  L3_3 = Fn_pcSensorOff
  L3_3("pccubesensor2_warp_01")
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = waitSeconds
  L3_3(1)
  L3_3 = Fn_kaiwaDemoView
  L3_3("ep02_00132k")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_warp_02")
  L3_3 = Fn_setCatWarpCheckPoint
  L3_3("locator2_pc_start_pos_03")
  _next_phase2 = false
  _currentMissionText = "ep02_02004"
  L3_3 = Fn_missionView
  L3_3("ep02_02004")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_01")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_c_25")
  L3_3 = waitSeconds
  L3_3(_MARKER_WAIT_AFTER_MISSION_VIEW)
  L3_3 = Fn_naviSet
  L3_3(findGameObject2("Node", "locator2_navi_pi_a_16_01"))
  while true do
    L3_3 = Player
    L3_3 = L3_3.isGravityControlMode
    L3_3 = L3_3(L3_3)
    if L3_3 then
      L3_3 = invokeTask
      L3_3(function()
        waitSeconds(5)
        Fn_tutorialCaption("gravitymove")
        waitSeconds(10)
        Fn_tutorialCaptionKill()
      end)
      L3_3 = HUD
      L3_3 = L3_3.info
      L3_3(L3_3, "ep02_info_04")
      break
    end
    L3_3 = wait
    L3_3()
  end
  L3_3 = waitPhase2
  L3_3()
  L3_3 = Fn_tutorialCaptionKill
  L3_3()
  L3_3 = Fn_naviKill
  L3_3()
  L3_3 = Fn_sendEventComSb
  L3_3("requestPartC", 6)
  L3_3 = waitComNextPhase
  L3_3()
  L3_3 = Fn_pcSensorOff
  L3_3("pccubesensor2_01")
  L3_3 = Fn_pcSensorOff
  L3_3("pccubesensor2_01_enter")
  _is_in_sensor = false
  _next_phase2 = false
  L3_3 = _ep02_00133k_done
  if not L3_3 then
    L3_3 = "pi_a_25"
    Fn_pcSensorOn("pccubesensor2_c_25")
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_c_25"))
    while not _ep02_00133k_done do
      wait()
    end
    Fn_naviKill()
    Fn_tutorialCaptionKill()
  end
  L3_3 = "pi_a_06_02"
  Fn_pcSensorOn("pcspheresensor2_02")
  Fn_pcSensorOn("pcspheresensor2_02_enter")
  Fn_naviSet(findGameObject2("Node", "locator2_navi_pi_a_06_02"))
  waitPhase2()
  Fn_sendEventComSb("requestPartC", 7)
  waitComNextPhase()
  Fn_pcSensorOff("pcspheresensor2_02")
  Fn_pcSensorOff("pcspheresensor2_02_enter")
  _is_in_sensor = false
  _next_phase2 = false
  waitSeconds(2)
  Fn_kaiwaDemoView("ep02_00137k")
  Fn_sendEventComSb("requestPartC", 8)
  waitComNextPhase()
  Fn_pcSensorOn("pccubesensor2_c_26")
  _currentMissionText = "ep02_02006"
  Fn_missionView("ep02_02006")
  waitSeconds(_MARKER_WAIT_AFTER_MISSION_VIEW)
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_c_26"))
  while not _next_phase2 do
    if not false and 20 <= Fn_sendEventComSb("getOreBrokenCount", L3_3) then
      Fn_captionViewWait("ep02_02007")
    end
    wait()
  end
  Fn_naviKill()
  Player:setStay(true, false)
  Fn_userCtrlOff()
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_4, L1_5
end
function pccubesensor2_start_OnEnter()
  local L0_6, L1_7
end
function pccubesensor2_start_OnLeave(A0_8, A1_9)
  Fn_pcSensorOff(A0_8)
end
function pccubesensor2_ep02c_event_OnEnter(A0_10)
  Fn_pcSensorOff("pccubesensor2_event_01")
  Fn_pcSensorOff("pccubesensor2_event_02")
  Fn_pcSensorOff("pccubesensor2_event_03")
  Fn_pcSensorOff("pccubesensor2_event_04")
  _next_phase = true
end
function pccubesensor2_01_OnEnter(A0_11)
  local L1_12
  L1_12 = A0_11.getName
  L1_12 = L1_12(A0_11)
  if L1_12 == "pccubesensor2_01" then
    return
  end
  L1_12 = _is_in_sensor
  if L1_12 then
    return
  end
  _is_in_sensor = true
  L1_12 = "pi_a_16_01"
  invokeTask(function()
    _is_in_sensor = true
    Fn_naviKill()
    if Fn_sendEventComSb("getOreBrokenCount", L1_12) >= Fn_sendEventComSb("getOreQuotaCount", L1_12) then
      if not Fn_isCaptionView("ep02_02008") then
        Fn_captionViewWait("ep02_02008")
      end
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_12) < Fn_sendEventComSb("getOreQuotaCount", L1_12) and Fn_sendEventComSb("getOreBrokenCount", L1_12) > 0 then
      Fn_captionViewWait("ep02_02009")
    else
      Fn_captionViewWait("ep02_02010")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", true)
  _next_phase2 = true
end
function pccubesensor2_01_OnLeave(A0_13)
  local L1_14
  L1_14 = A0_13.getName
  L1_14 = L1_14(A0_13)
  if L1_14 == "pccubesensor2_01_enter" then
    return
  end
  L1_14 = _is_in_sensor
  if not L1_14 then
    return
  end
  _is_in_sensor = false
  L1_14 = "pi_a_16_01"
  sensorLeaveHandler(L1_14)
  invokeTask(function()
    if Fn_sendEventComSb("getOreBrokenCount", L1_14) >= Fn_sendEventComSb("getOreQuotaCount", L1_14) then
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_14) < Fn_sendEventComSb("getOreQuotaCount", L1_14) and Fn_sendEventComSb("getOreBrokenCount", L1_14) > 0 then
      Fn_captionViewWait("ep02_02012")
    else
      Fn_captionViewWait("ep02_02013")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", false)
end
function pcspheresensor2_02_OnEnter(A0_15)
  local L1_16
  L1_16 = A0_15.getName
  L1_16 = L1_16(A0_15)
  if L1_16 == "pcspheresensor2_02" then
    return
  end
  L1_16 = _is_in_sensor
  if L1_16 then
    return
  end
  _is_in_sensor = true
  L1_16 = "pi_a_06_02"
  invokeTask(function()
    Fn_naviKill()
    if Fn_sendEventComSb("getOreBrokenCount", L1_16) >= Fn_sendEventComSb("getOreQuotaCount", L1_16) then
      if not Fn_isCaptionView("ep02_02014") then
        Fn_captionViewWait("ep02_02014")
      end
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_16) < Fn_sendEventComSb("getOreQuotaCount", L1_16) and Fn_sendEventComSb("getOreBrokenCount", L1_16) > 0 then
      Fn_captionViewWait("ep02_02015")
    else
      Fn_captionViewWait("ep02_02016")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", true)
  _next_phase2 = true
end
function pcspheresensor2_02_OnLeave(A0_17)
  local L1_18
  L1_18 = A0_17.getName
  L1_18 = L1_18(A0_17)
  if L1_18 == "pcspheresensor2_02_enter" then
    return
  end
  L1_18 = _is_in_sensor
  if not L1_18 then
    return
  end
  _is_in_sensor = false
  L1_18 = "pi_a_06_02"
  sensorLeaveHandler(L1_18)
  invokeTask(function()
    if Fn_sendEventComSb("getOreBrokenCount", L1_18) >= Fn_sendEventComSb("getOreQuotaCount", L1_18) then
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_18) < Fn_sendEventComSb("getOreQuotaCount", L1_18) and Fn_sendEventComSb("getOreBrokenCount", L1_18) > 0 then
      Fn_captionViewWait("ep02_02018")
    else
      Fn_captionViewWait("ep02_02019")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", false)
end
function pccubesensor2_c_25_OnEnter(A0_19)
  Fn_pcSensorOff(A0_19)
  invokeTask(function()
    Fn_kaiwaDemoView("ep02_00133k")
    _ep02_00133k_done = true
  end)
  Fn_sendEventComSb("setMultiNaviEnable", true)
end
function pccubesensor2_c_25_OnLeave()
  Fn_sendEventComSb("setMultiNaviEnable", false)
end
function pccubesensor2_c_26_OnEnter(A0_20)
  Fn_pcSensorOff(A0_20)
  if _ep02_00133k_done then
    _next_phase2 = true
    return
  end
end
function pccubesensor2_c_26_OnLeave()
  local L0_21, L1_22
end
function sensorLeaveHandler(A0_23)
  sensorName = {}
  sensorName.pi_a_16_01 = "pccubesensor2_01"
  sensorName.pi_a_06_02 = "pcspheresensor2_02"
  naviName = {}
  naviName.pi_a_16_01 = "locator2_navi_pi_a_16_01"
  naviName.pi_a_06_02 = "locator2_navi_pi_a_06_02"
  if Fn_sendEventComSb("getOreBrokenCount", A0_23) >= Fn_sendEventComSb("getOreQuotaCount", A0_23) then
    Fn_pcSensorOff(sensorName[A0_23])
    Fn_pcSensorOff(sensorName[A0_23] .. "_enter")
  else
    invokeTask(function()
      Fn_missionView(_currentMissionText)
      Fn_naviSet(findGameObject2("Node", naviName[A0_23]))
    end)
  end
end
function pccubesensor2_warp_01_OnEnter()
  local L0_24, L1_25
end
function pccubesensor2_warp_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep02_02020")
    Fn_missionView(_currentMissionText)
  end)
end
