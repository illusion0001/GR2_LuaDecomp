import("Pad")
import("Query")
import("Camera")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_boy_task = nil
_girl_task = nil
function Initialize()
  local L0_0
  L0_0 = Fn_loadEventData
  L0_0("evx/ep90", {
    "evarea2_po_a_01"
  }, true)
  L0_0 = {
    {
      name = "boy",
      type = "chi11",
      node = "locator2_chi01"
    },
    {
      name = "girl",
      type = "chi14",
      node = "locator2_chi02"
    },
    {
      name = "duck01",
      type = "duck01",
      node = "locator2_duck01"
    },
    {
      name = "cid_01",
      type = "cid01",
      node = "locator2_cid01_01"
    }
  }
  Fn_setupNpc(L0_0)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = Fn_lockPlayerAbility
  L1_2 = nil
  L2_3 = {}
  L2_3.r_stick = true
  L0_1(L1_2, L2_3)
  L0_1 = Camera
  L1_2 = L0_1
  L0_1 = L0_1.setYawInvert
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Camera
  L1_2 = L0_1
  L0_1 = L0_1.setPitchInvert
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_findNpc
  L1_2 = "cid_01"
  L0_1 = L0_1(L1_2)
  L2_3 = L0_1
  L1_2 = L0_1.getPuppet
  L1_2 = L1_2(L2_3)
  L2_3 = Fn_findNpc
  L3_4 = "boy"
  L2_3 = L2_3(L3_4)
  L3_4 = Fn_findNpc
  L4_5 = "girl"
  L3_4 = L3_4(L4_5)
  L4_5 = Fn_repeatPlayMotion
  L5_6 = L2_3
  L6_7 = "talk_01"
  L7_8 = {L8_9}
  L8_9 = "talk_laugh_00"
  L8_9 = 10
  L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, 20)
  _boy_task = L4_5
  L4_5 = Fn_repeatPlayMotion
  L5_6 = L3_4
  L6_7 = "talk_00"
  L7_8 = {L8_9}
  L8_9 = "talk_01"
  L8_9 = 10
  L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, 20)
  _girl_task = L4_5
  L4_5 = Sound
  L5_6 = L4_5
  L4_5 = L4_5.playSE
  L6_7 = "syd001"
  L7_8 = 1
  L8_9 = ""
  L4_5(L5_6, L6_7, L7_8, L8_9, findGameObject2("Node", "locator2_cam_target_01"))
  L4_5 = Fn_captionViewWait
  L5_6 = "ft90_00200"
  L6_7 = 2
  L4_5(L5_6, L6_7)
  L4_5 = Sound
  L5_6 = L4_5
  L4_5 = L4_5.playSE
  L6_7 = "kit017"
  L7_8 = 0.5
  L8_9 = ""
  L4_5(L5_6, L6_7, L7_8, L8_9, Player.getPuppet())
  L4_5 = Fn_captionViewWait
  L5_6 = "ft90_00210"
  L4_5(L5_6)
  L4_5 = Fn_captionView
  L5_6 = "ic_tutorial_00050"
  L6_7 = 0
  L4_5(L5_6, L6_7)
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_cam_target_01"
  L4_5 = L4_5(L5_6, L6_7)
  L5_6 = Fn_naviSet
  L6_7 = L4_5
  L5_6(L6_7)
  L5_6 = 0
  L6_7 = 0
  L7_8 = 5
  L8_9 = Camera
  L8_9 = L8_9.setControl
  L8_9(L8_9, Camera.kPlayer, Camera.kControl_All, true)
  L8_9 = Camera
  L8_9 = L8_9.setControl
  L8_9(L8_9, Camera.kPlayer, Camera.kControl_Pitch, false)
  while true do
    while true do
      L8_9 = Pad
      L8_9 = L8_9.getStick
      L8_9 = L8_9(L8_9, Pad.kStick_Camera)
      if L8_9 > 0 then
        Camera:setYawInvert(true)
        if L8_9 >= 0.5 then
          L5_6 = L5_6 + 1
        end
      else
        Camera:setYawInvert(false)
        if L8_9 <= -0.5 then
          L6_7 = L6_7 + 1
        end
      end
      if L7_8 < L5_6 or L7_8 < L6_7 or Fn_isInSightTarget(L4_5, 0.5) == true then
        if L5_6 > L6_7 then
          Camera:setYawInvert(true)
        end
        break
      end
      wait()
    end
  end
  while true do
    L8_9 = Fn_isInSightTarget
    L8_9 = L8_9(L4_5, 1)
    if L8_9 == false then
      L8_9 = Fn_naviSet
      L8_9(L4_5)
    else
      L8_9 = Fn_naviKill
      L8_9()
      L8_9 = Fn_isInSightTarget
      L8_9 = L8_9(L4_5, 0.5)
    end
    if L8_9 ~= true then
      L8_9 = wait
      L8_9()
    end
  end
  L8_9 = Camera
  L8_9 = L8_9.setControl
  L8_9(L8_9, Camera.kPlayer, Camera.kControl_All, false)
  L8_9 = HUD
  L8_9 = L8_9.missionEnd
  L8_9(L8_9)
  L8_9 = Fn_lookAtObjectWait
  L8_9(L4_5, 0, 0.2)
  L8_9 = Player
  L8_9 = L8_9.setLookAtIk
  L8_9(L8_9, true, 1, L4_5:getWorldPos())
  L8_9 = L0_1.playMotion
  L8_9(L0_1, "wave_hand_00")
  L8_9 = false
  invokeTask(function()
    Sound:playSE("syd003", 1, "", findGameObject2("Node", "locator2_cam_target_01"))
    Fn_captionViewWait("ft90_00240")
    if L8_9 == false then
      Fn_captionViewWait("ft90_00250")
      if L8_9 == false then
        Fn_captionView("ic_tutorial_00060", 0)
        while L8_9 == false do
          if Fn_isInSightTarget(L1_2, 1) == false then
            Fn_naviSet(L1_2)
          else
            Fn_naviKill()
          end
          wait()
        end
      end
    end
  end)
  L5_6 = 0
  L6_7 = 0
  L7_8 = 5
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  Camera:setControl(Camera.kPlayer, Camera.kControl_Pitch, true)
  while true do
    while true do
      if 0 < Pad:getStick(Pad.kStick_Camera) then
        Camera:setPitchInvert(true)
        if 0.5 <= Pad:getStick(Pad.kStick_Camera) then
          L5_6 = L5_6 + 1
        end
      else
        Camera:setPitchInvert(false)
        if Pad:getStick(Pad.kStick_Camera) <= -0.5 then
          L6_7 = L6_7 + 1
        end
      end
      if L7_8 < L5_6 or L7_8 < L6_7 or Fn_isInSightTarget(L1_2, 0.5) == true then
        if L5_6 > L6_7 then
          Camera:setPitchInvert(true)
        end
        break
      end
      wait()
    end
  end
  while Fn_isInSightTarget(L1_2, 0.5) == false do
    wait()
  end
  Player:setLookAtIk(true, 1, L1_2:getWorldPos())
  L8_9 = true
  HUD:missionEnd()
  Fn_lookAtObjectWait(L1_2, 0, 0.3)
  Sound:playSE("kit019", 0.5, "", Player.getPuppet())
  Fn_captionViewWait("ft90_00270")
  Fn_captionViewEnd()
  L0_1:playMotion("stay")
  Fn_tutorialCaption("camera_setting")
  waitSeconds(6)
  Fn_tutorialCaptionKill()
  waitSeconds(0.5)
  Fn_kaiwaDemoView("ft90_00300k")
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  GameDatabase:set(ggd.EventFlags__sm93__TutorialFlags, true)
  Fn_unLockPlayerAbility(nil, {r_stick = true})
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_10, L1_11
end
