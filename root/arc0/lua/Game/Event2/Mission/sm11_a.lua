dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/sm11_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_cliant_name = "sm11_client"
_son_name = "sm11_son"
_exclusion_event_flg = false
_game_state_once = {}
_soliloquy_task = nil
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {L1_1}
  L1_1.name = L2_2
  L1_1.type = "man39"
  L1_1.node = "locator2_man39_01"
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  for _FORV_4_, _FORV_5_ in L1_1(L2_2) do
    _game_state_once[_FORV_5_] = false
  end
  _gesture = GestureEvent.create(nil, L1_1, L2_2, nil, gestureNpcActionCallback2)
  _gesture:stop()
  Mob:restrict_sm11_00(true)
end
function Ingame()
  local L0_3, L1_4, L2_5, L3_6
  L0_3 = Fn_findNpc
  L1_4 = _cliant_name
  L0_3 = L0_3(L1_4)
  L1_4 = Fn_findNpc
  L2_5 = _son_name
  L1_4 = L1_4(L2_5)
  L2_5 = Fn_repeatPlayMotion
  L3_6 = L1_4
  L2_5 = L2_5(L3_6, "handclap", {
    "vendor_attract_00"
  })
  L3_6 = Fn_missionStart
  L3_6()
  L3_6 = Fn_turnNpc
  L3_6(L0_3)
  L3_6 = Fn_kaiwaDemoView
  L3_6("sm11_00100k")
  L3_6 = Fn_userCtrlOn
  L3_6()
  L3_6 = {}
  L3_6.view = {
    info = "sm11_info_01",
    mission_target = "sm11_00101",
    in_game_preview = "k_photo_sm1101"
  }
  Fn_sideMissionStartView(L3_6)
  Fn_captionViewWait("sm11_00102")
  GameStateSet(_GAME_STATE.START)
  repeat
    if _gesture:getKnownKaiwaDemoCount() > 0 and _gesture:isInteraction() == false then
      if _gesture_state == GEATURE_START then
        GameStateSet(_GAME_STATE.CRANE)
      elseif _gesture_state == GEATURE_CRANE_NEAR then
        ExclusionEventStart(EventCraneDiscovery)
      end
    end
    if _study_phase == _GAME_STATE.SELF and _soliloquy_task ~= nil and _soliloquy_task:isRunning() == false then
      Fn_captionViewWait("sm11_00119")
      Fn_captionViewWait("sm11_00120")
      GameStateSet(_GAME_STATE.SHOP)
    end
    wait()
  until _study_phase == _GAME_STATE.CLEAR
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_crane")
  Fn_pcSensorOff("pccubesensor2_crane_near")
  Fn_pcSensorOff("pccubesensor2_shop")
  if L2_5 ~= nil and L2_5:isRunning() == true then
    L2_5:abort()
  end
  L2_5 = nil
  wait()
  Fn_playMotionNpc(L1_4, "stay", false)
  Fn_turnNpc(L1_4)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm11_00400k")
  HUD:enablePhotoMode(true)
  HUD:inGamePreviewExit()
  if Fn_lookAtObject(L1_4, 1) ~= nil and Fn_lookAtObject(L1_4, 1):isRunning() == true then
    Fn_lookAtObject(L1_4, 1):abort()
  end
  waitSeconds(1)
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:restrict_sm11_00(false)
end
function pccubesensor2_crane_OnEnter()
  ExclusionEventStart(EventCraneDiscovery)
end
function pccubesensor2_crane_near_OnEnter()
  SettingGeature(GEATURE_CRANE_NEAR)
end
_shop_hint_once = false
function pccubesensor2_shop_OnEnter()
  SettingGeature(GEATURE_SHOP_NEAR)
  if _shop_hint_once == false and _study_phase == _GAME_STATE.SELF then
    _shop_hint_once = true
    ExclusionEventStart(Event_Apporoach)
  end
end
function ResetGameState()
  GameStateSet(_study_phase)
end
function GameStateSet(A0_7)
  if A0_7 == _GAME_STATE.START then
    SettingGeature(GEATURE_START)
    Fn_pcSensorOn("pccubesensor2_crane")
    Fn_pcSensorOn("pccubesensor2_shop")
    Fn_pcSensorOn("pccubesensor2_crane_near")
    _study_phase = _GAME_STATE.START
  elseif A0_7 == _GAME_STATE.CRANE then
    SettingGeature(GEATURE_CRANE)
    Fn_pcSensorOn("pccubesensor2_crane")
    Fn_pcSensorOn("pccubesensor2_shop")
    Fn_pcSensorOn("pccubesensor2_crane_near")
    if _game_state_once[A0_7] == false then
      Fn_missionView("sm11_00128")
      waitSeconds(1.3)
      Fn_captionViewWait("sm11_00116")
    end
    _study_phase = _GAME_STATE.CRANE
  elseif A0_7 == _GAME_STATE.SELF then
    StopGeature()
    Fn_pcSensorOff("pccubesensor2_crane")
    Fn_pcSensorOn("pccubesensor2_shop")
    Fn_pcSensorOff("pccubesensor2_crane_near")
    if _game_state_once[A0_7] == false then
      Fn_missionView("sm11_00129")
      _soliloquy_task = soliloquy_task()
    end
    _study_phase = _GAME_STATE.SELF
  elseif A0_7 == _GAME_STATE.SHOP then
    if _soliloquy_task ~= nil and _soliloquy_task:isRunning() == true then
      _soliloquy_task:abort()
    end
    _soliloquy_task = nil
    SettingGeature(GEATURE_SHOP)
    Fn_pcSensorOff("pccubesensor2_crane")
    Fn_pcSensorOn("pccubesensor2_shop")
    Fn_pcSensorOff("pccubesensor2_crane_near")
    if _game_state_once[A0_7] == false then
      Fn_missionView("sm11_00130")
    end
    _study_phase = _GAME_STATE.SHOP
  elseif A0_7 == _GAME_STATE.CLEAR then
    if _soliloquy_task ~= nil and _soliloquy_task:isRunning() == true then
      _soliloquy_task:abort()
    end
    _soliloquy_task = nil
    StopGeature()
    Fn_pcSensorOff("pccubesensor2_crane")
    Fn_pcSensorOff("pccubesensor2_shop")
    Fn_pcSensorOff("pccubesensor2_crane_near")
    _study_phase = _GAME_STATE.CLEAR
  end
  _game_state_once[A0_7] = true
end
function ExclusionEventStart(A0_8)
  if _exclusion_event_flg == false then
    _exclusion_event_flg = true
    return invokeTask(function()
      local L0_9, L1_10
      L0_9 = _cancel_flag
      L1_10 = _break_flag
      _cancel_flag = false
      _break_flag = false
      A0_8()
      _cancel_flag = L0_9
      _break_flag = L1_10
      _exclusion_event_flg = false
    end)
  end
  return nil
end
_crane_event_once = 0
function EventCraneDiscovery()
  if _crane_event_once > 0 then
    return
  end
  if _gesture_state <= GEATURE_CRANE_NEAR then
    Player:setStay(true)
    waitSeconds(1)
    if HUD:inGamePreviewIsLarge() == false then
      HUD:inGamePreviewChange()
      while HUD:inGamePreviewIsIdle() == false do
        wait()
      end
      waitSeconds(0.5)
    end
    if _study_phase == _GAME_STATE.IMMEDIATELY_AFTER_THE_START then
      Fn_captionViewWait("sm11_00131", 4)
    else
      Fn_captionViewWait("sm11_00117")
    end
    waitSeconds(1)
    Player:setStay(false)
    if false == false and HUD:inGamePreviewIsLarge() == true then
      HUD:inGamePreviewChange()
    end
    Fn_captionViewWait("sm11_00118", 4)
    Fn_lookAtObject("locator2_crane_01"):abort()
    GameStateSet(_GAME_STATE.SELF)
    _crane_event_once = 1
  end
end
function soliloquy_task()
  return invokeTask(function()
    local L0_11, L1_12, L2_13, L3_14, L4_15
    L0_11 = 0
    for L4_15 = 0, 180 do
      if _study_phase == _GAME_STATE.SHOP or _study_phase == _GAME_STATE.CLEAR then
        return
      end
      if L0_11 >= 30 then
        if RandI(1, 10) > 5 then
          Fn_captionViewWait("sm11_00125")
        elseif _in_po_a_04 == true then
          Fn_captionViewWait("sm11_00132")
        elseif _in_po_a_01 == true then
          Fn_captionViewWait("sm11_00124")
        else
          Fn_captionViewWait("sm11_00123")
        end
        L0_11 = 0
      end
      L0_11 = L0_11 + 1
      waitSeconds(1)
    end
  end)
end
_in_po_a_04 = false
function pccubesensor2_po_a_04_OnEnter()
  local L0_16, L1_17
  _in_po_a_04 = true
end
function pccubesensor2_po_a_04_OnLeave()
  local L0_18, L1_19
  _in_po_a_04 = false
end
_in_po_a_01 = false
function pccubesensor2_po_a_01_OnEnter()
  local L0_20, L1_21
  _in_po_a_01 = true
end
function pccubesensor2_po_a_01_OnLeave()
  local L0_22, L1_23
  _in_po_a_01 = false
end
function Event_Apporoach()
  Fn_captionViewWait("sm11_00133")
  GameStateSet(_GAME_STATE.SHOP)
end
