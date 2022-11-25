dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_move_tutorial = false
function Initialize()
  Fn_setCatActive(false)
  Fn_userCtrlOff()
  Font:openTextSet("Credits")
  Player:muteVoice(Player.kVoiceMuteLv_All)
end
function Ingame()
  local L0_0, L1_1
  L0_0 = Fn_setCagePos
  L1_1 = 350
  L0_0(L1_1, true, true)
  L0_0 = Fn_setCageMoveParam
  L1_1 = {}
  L1_1.speed = 4
  L1_1.accel = 0
  L1_1.decel = 6
  L0_0(L1_1)
  L0_0 = Fn_waitGravityStormPlay
  L0_0()
  L0_0 = Sound
  L1_1 = L0_0
  L0_0 = L0_0.playSEHandle
  L0_0 = L0_0(L1_1, "amb021", 1)
  _amb_voice = L0_0
  function L0_0()
    Fn_cageMove()
    wait(30)
  end
  L1_1 = Fn_missionStart
  L1_1(L0_0)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = waitSeconds
  L1_1(1)
  L1_1 = ep00_playabletelop
  L1_1()
  L1_1 = Sound
  L1_1 = L1_1.playSE
  L1_1(L1_1, "ep00_m02_801_radio", 1)
  L1_1 = Fn_captionViewWait
  L1_1("ep00_00100", 5)
  L1_1 = Sound
  L1_1 = L1_1.playSE
  L1_1(L1_1, "ep00_m02_802_radio", 1)
  L1_1 = Fn_captionViewWait
  L1_1("ep00_00101", 5)
  L1_1 = Sound
  L1_1 = L1_1.playSE
  L1_1(L1_1, "ep00_ryz_906c_radio", 1)
  L1_1 = Fn_captionViewWait
  L1_1("ep00_00102", 5)
  L1_1 = Fn_tutorialCaption
  L1_1("move_only")
  L1_1 = false
  _pad_timer = EventHelper:timerCallback("Pad Input Wait", 6, function()
    print("move timer END")
    L1_1 = true
  end)
  invokeTask(function()
    repeat
      wait()
    until moveCheck()
    print("move INPUT")
    L1_1 = true
    waitSeconds(2)
    Fn_tutorialCaptionKill()
    wait()
  end)
  repeat
    wait()
  until L1_1
  waitSeconds(3)
  Fn_tutorialCaptionKill()
  waitSeconds(1)
  Fn_tutorialCaption("camera_setting")
  waitSeconds(5)
  Fn_tutorialCaptionKill()
  waitSeconds(1)
  _move_tutorial = true
  waitSeconds(0.5)
  Sound:playSE("kit_459", 1)
  Fn_captionViewWait("ep00_00103")
  Sound:playSE("ep00_ryz_924c_radio", 1)
  Fn_captionViewWait("ep00_00104", 5)
  Sound:playSE("kit_458", 1)
  Fn_captionViewWait("ep00_00105")
  Sound:playSE("ep00_m02_801_radio", 1)
  Fn_captionViewWait("ep00_00110", 5)
  Sound:playSE("ep00_ryz_924a_radio", 1)
  Fn_captionViewWait("ep00_00111", 5)
  Fn_captionViewEnd()
  Fn_waitGravityStormOut()
  if _amb_voice ~= nil then
    Sound:stopSEHandle(_amb_voice)
  end
  Fn_sendEventComSb("requestTkgSet")
  waitSeconds(5)
  Sound:playSE("ep00_m02_803_radio", 1)
  Fn_captionViewWait("ep00_00112", 5)
  Sound:playSE("ep00_m02_802_radio", 1)
  Fn_captionViewWait("ep00_00113", 5)
  waitSeconds(3)
  Sound:playSE("ep00_ryz_914c_radio", 1)
  Fn_captionViewWait("ep00_00114", 5)
  Sound:playSE("ep00_ryz_081_radio", 1)
  Fn_captionViewWait("ep00_00115", 5)
  waitSeconds(1)
  Sound:playSE("kit_456", 1)
  Fn_captionView("ep00_00116", 5)
  Fn_waitCageMoveEnd()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  if _amb_voice ~= nil then
    Sound:stopSEHandle(_amb_voice)
  end
end
function cameraSetting(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7
  L2_4 = 0
  L3_5 = 0
  L4_6 = 5
  L5_7 = Camera
  L5_7 = L5_7.setControl
  L5_7(L5_7, Camera.kPlayer, Camera.kControl_All, true)
  L5_7 = Camera
  L5_7 = L5_7.setControl
  L5_7(L5_7, Camera.kPlayer, Camera.kControl_Pitch, A1_3)
  while true do
    L5_7 = Pad
    L5_7 = L5_7.getStick
    L5_7 = L5_7(L5_7, Pad.kStick_Camera)
    if 0 < (A1_3 and L5_7(L5_7, Pad.kStick_Camera) or L5_7) then
      if A1_3 then
        Camera:setPitchInvert(false)
      else
        Camera:setYawInvert(true)
      end
      if (A1_3 and L5_7(L5_7, Pad.kStick_Camera) or L5_7) >= 0.5 then
        L2_4 = L2_4 + 1
      end
    else
      if A1_3 then
        Camera:setPitchInvert(true)
      else
        Camera:setYawInvert(false)
      end
      if (A1_3 and L5_7(L5_7, Pad.kStick_Camera) or L5_7) <= -0.5 then
        L3_5 = L3_5 + 1
      end
    end
    if L4_6 < L2_4 or L4_6 < L3_5 or Fn_isInSightTarget(A0_2, 0.5) == true then
      if L2_4 > L3_5 then
        if A1_3 then
          Camera:setPitchInvert(false)
          break
        end
        Camera:setYawInvert(true)
      end
      break
    end
    wait()
  end
end
function moveCheck()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14
  L0_8 = 0
  L1_9 = 0
  L2_10 = 5
  while true do
    L3_11 = Pad
    L4_12 = L3_11
    L3_11 = L3_11.getStick
    L5_13 = Pad
    L5_13 = L5_13.kStick_Move
    L4_12 = L3_11(L4_12, L5_13)
    L5_13 = Pad
    L6_14 = L5_13
    L5_13 = L5_13.getStick
    L6_14 = L5_13(L6_14, Pad.kStick_Camera)
    if (L3_11 or L4_12) ~= 0 then
      L0_8 = L0_8 + 1
    elseif (L5_13 or L6_14) ~= 0 then
      L1_9 = L1_9 + 1
    end
    if not (L2_10 < L0_8) and not (L2_10 < L1_9) then
      wait()
    end
  end
  L3_11 = true
  return L3_11
end
function ep00_playabletelop()
  local L0_15
  L0_15 = 10
  invokeTask(function()
    waitSeconds(1)
    HUD:setPlayableTelop("LT", L0_15, {"ui_job_8"}, {"ui_name_6"})
    repeat
      wait()
    until _move_tutorial
    HUD:setPlayableTelop("RB", L0_15, {"ui_job_9"}, {"ui_name_7"})
    waitSeconds(L0_15)
    waitSeconds(2)
    HUD:setPlayableTelop("RT", L0_15, {"ui_job_15"}, {"ui_name_13"})
    HUD:setPlayableTelop("RC", L0_15, {"ui_job_16"}, {"ui_name_14"})
    waitSeconds(L0_15)
    Fn_waitGravityStormOut()
    waitSeconds(1)
    HUD:setPlayableTelop("LT", L0_15, {"ui_job_17"}, {"ui_name_15"})
    HUD:setPlayableTelop("LC", L0_15, {"ui_job_18"}, {"ui_name_16"})
    waitSeconds(L0_15)
    waitSeconds(2)
    HUD:setPlayableTelop("RT", L0_15, {"ui_job_19"}, {"ui_name_17"})
    HUD:setPlayableTelop("RC", L0_15, {"ui_job_20"}, {"ui_name_18"})
    waitSeconds(L0_15)
    waitSeconds(2)
    HUD:setPlayableTelop("LT", L0_15, {"ui_job_21"}, {"ui_name_19"})
    HUD:setPlayableTelop("LC", L0_15, {"ui_job_22"}, {"ui_name_20"})
  end)
end
