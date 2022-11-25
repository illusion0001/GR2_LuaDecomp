import("Area")
import("Vehicle")
import("Wind")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/area_controller.lua")
_area_tbl = {}
_small_tbl = {}
_bu_small = {
  "bu_a_01",
  "bu_a_04",
  "bu_a_05",
  "bu_a_07",
  "bu_a_08",
  "bu_a_11",
  "bu_a_18"
}
_area_ctrls = {}
_gull_task = {}
_gull_follow_end = false
_camera_setting_end = false
_sdemo = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_loadEventData
  L1_1 = "evx/bu_d_goto_po_setup"
  L2_2 = nil
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_findAreaHandle
  L1_1 = "bu_d_root"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.getDescendant
  L1_1 = L1_1(L2_2)
  L2_2 = Fn_findAreaHandle
  L2_2 = L2_2(L3_3)
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  is_bu_small = L3_3
  for L6_6, L7_7 in L3_3(L4_4) do
    L9_9 = L7_7
    L8_8 = L7_7.getName
    L8_8 = L8_8(L9_9)
    L9_9 = is_bu_small
    L9_9 = L9_9(L8_8)
    if L9_9 == false then
      L9_9 = _area_tbl
      L9_9[L8_8] = L7_7
    else
      L9_9 = _small_tbl
      L9_9[L8_8] = L7_7
    end
  end
  L4_4[L3_3] = L2_2
  for L7_7, L8_8 in L4_4(L5_5) do
    L9_9 = L8_8.getName
    L9_9 = L9_9(L8_8)
    _area_ctrls[L9_9] = AreaController.create(L9_9)
    _area_ctrls[L9_9]:load(L9_9 .. "_goto_po")
    _area_ctrls[L9_9]:warp("locator2_" .. L9_9 .. "_start")
  end
  L4_4(L5_5, L6_6, L7_7)
  L5_5.name = "miz01"
  L5_5.type = "miz01"
  L5_5.node = "locator2_miz01_01"
  L5_5.attach = false
  L6_6.name = "driver"
  L6_6.type = "man34"
  L6_6.node = "locator2_man34_01"
  L6_6.attach = false
  L6_6.disable_collision = true
  L7_7.name = "worker"
  L7_7.type = "man36"
  L7_7.node = "locator2_man36_01"
  L7_7.attach = false
  L7_7.disable_collision = true
  L8_8 = {}
  L8_8.name = "man32"
  L8_8.type = "man32"
  L8_8.node = "locator2_man32_01"
  L8_8.attach = false
  L5_5(L6_6)
  L8_8 = "cid01_lookaround_eps05_00"
  L5_5(L6_6, L7_7)
  L8_8 = "man01_shipland_00"
  L5_5(L6_6, L7_7)
  L8_8 = "man01_idle_bu_00"
  L5_5(L6_6, L7_7)
  for L8_8, L9_9 in L5_5(L6_6) do
    L9_9:setEffectiveness(false, true)
  end
  L5_5(L6_6, L7_7)
  L5_5(L6_6)
  L8_8 = "ship_jir_wall"
  L8_8 = true
  L6_6(L7_7, L8_8)
  L8_8 = "Boundary"
  L6_6(L7_7, L8_8)
  L8_8 = "ve_crane_root_custom01"
  if L6_6 ~= nil then
    L8_8 = L6_6
    L7_7(L8_8)
    L8_8 = L2_2
    L9_9 = L6_6
    L7_7(L8_8, L9_9)
  end
  L8_8 = "ep80_a"
  _sdemo = L7_7
  L8_8 = L2_2
  L9_9 = "bungua_to_jilga"
  L7_7(L8_8, L9_9)
  L8_8 = L7_7
  L9_9 = ggd
  L9_9 = L9_9.EventFlags__sm93__TutorialFlags
  L7_7(L8_8, L9_9, false)
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L16_26, L17_27, L18_28, L19_29, L20_30, L21_31, L22_32, L23_33, L24_34, L25_35
  for L3_13, L4_14 in L0_10(L1_11) do
    L5_15 = _area_ctrls
    L5_15 = L5_15[L3_13]
    L6_16 = L5_15
    L5_15 = L5_15.setPlayParam
    L7_17 = {}
    L7_17.ratio = 0.5
    L5_15(L6_16, L7_17)
    L5_15 = _area_ctrls
    L5_15 = L5_15[L3_13]
    L6_16 = L5_15
    L5_15 = L5_15.cue
    L5_15(L6_16)
  end
  L0_10(L1_11, L2_12)
  L2_12(L3_13)
  for L5_15, L6_16 in L2_12(L3_13) do
    L7_17 = _gull_task
    L8_18 = gull_follow
    L9_19 = L6_16.name
    L10_20 = L6_16.area_name
    L8_18 = L8_18(L9_19, L10_20)
    L7_17[L5_15] = L8_18
  end
  L5_15 = false
  L2_12(L3_13, L4_14, L5_15)
  L5_15 = "rudder"
  L5_15 = "rudder"
  L3_13(L4_14, L5_15)
  L5_15 = "rudder"
  L6_16 = false
  L3_13(L4_14, L5_15, L6_16)
  L5_15 = 15
  L6_16 = 0
  L7_17 = 0
  L8_18 = 0
  L9_19 = 0
  L3_13(L4_14, L5_15, L6_16, L7_17, L8_18, L9_19)
  L5_15 = "locator2_miz01_01"
  L3_13(L4_14, L5_15)
  L5_15 = "check_00"
  L6_16 = false
  L3_13(L4_14, L5_15, L6_16)
  L5_15 = "ef_bg_deb_02"
  L6_16 = Vector
  L7_17 = 0
  L8_18 = 0
  L9_19 = 0
  L6_16 = L6_16(L7_17, L8_18, L9_19)
  L7_17 = IdentQuat
  L7_17 = L7_17()
  L8_18 = Vector
  L9_19 = 1
  L10_20 = 1
  L11_21 = 1
  L25_35 = L8_18(L9_19, L10_20, L11_21)
  L3_13(L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L16_26, L17_27, L18_28, L19_29, L20_30, L21_31, L22_32, L23_33, L24_34, L25_35, L8_18(L9_19, L10_20, L11_21))
  L5_15 = "npcgen2_man35_01"
  L6_16 = "talk_00"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_01"
  L9_19 = "talk_laugh_00"
  L8_18 = 10
  L9_19 = 20
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L5_15 = "npcgen2_man33_01"
  L6_16 = "talk_01"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_00"
  L9_19 = "talk_laugh_01"
  L8_18 = 10
  L9_19 = 20
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L5_15 = Fn_missionStart
  L5_15()
  L5_15 = game_mode_select
  L5_15()
  L5_15 = Camera
  L6_16 = L5_15
  L5_15 = L5_15.setYawInvert
  L7_17 = false
  L5_15(L6_16, L7_17)
  L5_15 = Camera
  L6_16 = L5_15
  L5_15 = L5_15.setPitchInvert
  L7_17 = false
  L5_15(L6_16, L7_17)
  L5_15 = Fn_findNpc
  L6_16 = "npcgen2_cid01_01"
  L5_15 = L5_15(L6_16)
  L7_17 = L5_15
  L6_16 = L5_15.getPuppet
  L6_16 = L6_16(L7_17)
  L7_17 = findGameObject2
  L8_18 = "Node"
  L9_19 = "locator2_target_01"
  L7_17 = L7_17(L8_18, L9_19)
  L8_18 = findGameObject2
  L9_19 = "Node"
  L10_20 = "locator2_target_02"
  L8_18 = L8_18(L9_19, L10_20)
  L9_19 = findGameObject2
  L10_20 = "Node"
  L11_21 = "locator2_target_03"
  L9_19 = L9_19(L10_20, L11_21)
  L10_20 = waitSeconds
  L11_21 = 1
  L10_20(L11_21)
  L10_20 = Sound
  L11_21 = L10_20
  L10_20 = L10_20.playSE
  L12_22 = "syd001"
  L13_23 = 1
  L14_24 = ""
  L15_25 = L7_17
  L10_20(L11_21, L12_22, L13_23, L14_24, L15_25)
  L10_20 = Fn_captionViewWait
  L11_21 = "ep80_00051"
  L12_22 = 2
  L10_20(L11_21, L12_22)
  L10_20 = Sound
  L11_21 = L10_20
  L10_20 = L10_20.playSE
  L12_22 = "kit017"
  L13_23 = 0.5
  L14_24 = ""
  L15_25 = Fn_getPlayer
  L25_35 = L15_25()
  L10_20(L11_21, L12_22, L13_23, L14_24, L15_25, L16_26, L17_27, L18_28, L19_29, L20_30, L21_31, L22_32, L23_33, L24_34, L25_35, L15_25())
  L10_20 = Fn_captionViewWait
  L11_21 = "ep80_00052"
  L10_20(L11_21)
  L10_20 = Fn_captionView
  L11_21 = "ic_tutorial_00050"
  L12_22 = 0
  L10_20(L11_21, L12_22)
  L10_20 = nil
  L11_21 = invokeTask
  function L12_22()
    waitSeconds(0.5)
    L10_20 = create_marker("locator2_marker_left")
  end
  L11_21(L12_22)
  L11_21 = waitSeconds
  L12_22 = 0.5
  L11_21(L12_22)
  L11_21 = Camera
  L12_22 = L11_21
  L11_21 = L11_21.setControl
  L13_23 = Camera
  L13_23 = L13_23.kPlayer
  L14_24 = Camera
  L14_24 = L14_24.kControl_All
  L15_25 = true
  L11_21(L12_22, L13_23, L14_24, L15_25)
  L11_21 = Camera
  L12_22 = L11_21
  L11_21 = L11_21.setControl
  L13_23 = Camera
  L13_23 = L13_23.kPlayer
  L14_24 = Camera
  L14_24 = L14_24.kControl_Pitch
  L15_25 = false
  L11_21(L12_22, L13_23, L14_24, L15_25)
  L11_21 = 0
  while L11_21 < 10 do
    L12_22 = Pad
    L13_23 = L12_22
    L12_22 = L12_22.getStick
    L14_24 = Pad
    L14_24 = L14_24.kStick_Camera
    L13_23 = L12_22(L13_23, L14_24)
    if L12_22 > 0 then
      L14_24 = Camera
      L15_25 = L14_24
      L14_24 = L14_24.setYawInvert
      L16_26 = true
      L14_24(L15_25, L16_26)
      L11_21 = L11_21 + 1
    elseif L12_22 < 0 then
      L14_24 = Camera
      L15_25 = L14_24
      L14_24 = L14_24.setYawInvert
      L16_26 = false
      L14_24(L15_25, L16_26)
      L11_21 = L11_21 + 1
    end
    L14_24 = wait
    L14_24()
  end
  L12_22 = 0
  L13_23 = 0
  L14_24 = 5
  while true do
    while true do
      L15_25 = Pad
      L16_26 = L15_25
      L15_25 = L15_25.getStick
      L17_27 = Pad
      L17_27 = L17_27.kStick_Camera
      L16_26 = L15_25(L16_26, L17_27)
      if L15_25 > 0 then
        L17_27 = Camera
        L18_28 = L17_27
        L17_27 = L17_27.setYawInvert
        L19_29 = true
        L17_27(L18_28, L19_29)
        if L15_25 >= 0.5 then
          L12_22 = L12_22 + 1
        end
      elseif L15_25 < 0 then
        L17_27 = Camera
        L18_28 = L17_27
        L17_27 = L17_27.setYawInvert
        L19_29 = false
        L17_27(L18_28, L19_29)
        if L15_25 <= -0.5 then
          L13_23 = L13_23 + 1
        end
      end
      if not (L14_24 < L12_22) and not (L14_24 < L13_23) then
        L17_27 = Fn_isInSightTarget
        L18_28 = L7_17
        L19_29 = 0.5
        L17_27 = L17_27(L18_28, L19_29)
      elseif L17_27 == true then
        if L12_22 > L13_23 then
          L17_27 = Camera
          L18_28 = L17_27
          L17_27 = L17_27.setYawInvert
          L19_29 = true
          L17_27(L18_28, L19_29)
        end
        break
      end
      L17_27 = wait
      L17_27()
    end
  end
  while true do
    L15_25 = Fn_isInSightTarget
    L16_26 = L7_17
    L17_27 = 0.5
    L15_25 = L15_25(L16_26, L17_27)
    if L15_25 == false then
      L15_25 = wait
      L15_25()
    end
  end
  L15_25 = Camera
  L16_26 = L15_25
  L15_25 = L15_25.setControl
  L17_27 = Camera
  L17_27 = L17_27.kPlayer
  L18_28 = Camera
  L18_28 = L18_28.kControl_All
  L19_29 = false
  L15_25(L16_26, L17_27, L18_28, L19_29)
  L15_25 = invokeTask
  function L16_26()
    if L10_20 ~= nil then
      L10_20:playOut()
      while L10_20:isOutEnd() do
        wait()
      end
      L10_20:setVisible(false)
      L10_20:try_term()
    end
  end
  L15_25(L16_26)
  L15_25 = Fn_captionViewEnd
  L15_25()
  L15_25 = Camera
  L16_26 = L15_25
  L15_25 = L15_25.lookTo
  L18_28 = L7_17
  L17_27 = L7_17.getWorldPos
  L17_27 = L17_27(L18_28)
  L18_28 = 2
  L19_29 = 2
  L15_25(L16_26, L17_27, L18_28, L19_29)
  L15_25 = Fn_playerTurn
  L16_26 = L7_17
  L15_25(L16_26)
  L15_25 = invokeTask
  function L16_26()
    local L0_36
    while true do
      L0_36 = Fn_playMotionNpc
      L0_36(L5_15, "wave_hand_in_00", true)
      L0_36 = RandI
      L0_36 = L0_36(4, 8)
      for _FORV_4_ = 1, L0_36 do
        Fn_playMotionNpc(L5_15, "wave_hand_00", true)
      end
      Fn_playMotionNpc(L5_15, "wave_hand_out_00", true)
      waitSeconds(RandF(2, 4))
    end
  end
  L15_25 = L15_25(L16_26)
  L16_26 = nil
  L17_27 = false
  L18_28 = invokeTask
  function L19_29()
    Sound:playSE("syd003", 1, "", L7_17)
    Fn_captionViewWait("ep80_00053")
    if L17_27 == false then
      Fn_captionViewWait("ep80_00054")
      if L17_27 == false then
        Fn_captionView("ic_tutorial_00060", 0)
        L16_26 = create_marker("locator2_marker_up")
        while L17_27 == false do
          if Fn_isInSightTarget(L7_17, 1) == false and Fn_isInSightTarget(L8_18, 1) == false then
            Fn_naviSet(L8_18)
          else
            Fn_naviKill()
          end
          wait()
        end
      end
    end
  end
  L18_28(L19_29)
  L11_21 = 0
  while L11_21 < 10 do
    L18_28 = Pad
    L19_29 = L18_28
    L18_28 = L18_28.getStick
    L20_30 = Pad
    L20_30 = L20_30.kStick_Camera
    L19_29 = L18_28(L19_29, L20_30)
    if L19_29 > 0 then
      L20_30 = Camera
      L20_30 = L20_30.setPitchInvert
      L20_30(L21_31, L22_32)
      L11_21 = L11_21 + 1
    elseif L19_29 < 0 then
      L20_30 = Camera
      L20_30 = L20_30.setPitchInvert
      L20_30(L21_31, L22_32)
      L11_21 = L11_21 + 1
    end
    L20_30 = wait
    L20_30()
  end
  L12_22 = 0
  L13_23 = 0
  L14_24 = 5
  L18_28 = Camera
  L19_29 = L18_28
  L18_28 = L18_28.setControl
  L20_30 = Camera
  L20_30 = L20_30.kPlayer
  L18_28(L19_29, L20_30, L21_31, L22_32)
  L18_28 = Camera
  L19_29 = L18_28
  L18_28 = L18_28.setControl
  L20_30 = Camera
  L20_30 = L20_30.kPlayer
  L18_28(L19_29, L20_30, L21_31, L22_32)
  while true do
    while true do
      L18_28 = Pad
      L19_29 = L18_28
      L18_28 = L18_28.getStick
      L20_30 = Pad
      L20_30 = L20_30.kStick_Camera
      L19_29 = L18_28(L19_29, L20_30)
      if L19_29 > 0 then
        L20_30 = Camera
        L20_30 = L20_30.setPitchInvert
        L20_30(L21_31, L22_32)
        if L19_29 >= 0.5 then
          L12_22 = L12_22 + 1
        end
      elseif L19_29 < 0 then
        L20_30 = Camera
        L20_30 = L20_30.setPitchInvert
        L20_30(L21_31, L22_32)
        if L19_29 <= -0.5 then
          L13_23 = L13_23 + 1
        end
      end
      if not (L14_24 < L12_22) and not (L14_24 < L13_23) then
        L20_30 = Fn_isInSightTarget
        L20_30 = L20_30(L21_31, L22_32)
      elseif L20_30 == true then
        if L12_22 > L13_23 then
          L20_30 = Camera
          L20_30 = L20_30.setPitchInvert
          L20_30(L21_31, L22_32)
        end
        break
      end
      L20_30 = wait
      L20_30()
    end
  end
  while true do
    L18_28 = Fn_isInSightTarget
    L19_29 = L8_18
    L20_30 = 0.5
    L18_28 = L18_28(L19_29, L20_30)
    if L18_28 == false then
      L18_28 = wait
      L18_28()
    end
  end
  L18_28 = invokeTask
  function L19_29()
    if L16_26 ~= nil then
      L16_26:playOut()
      while L16_26:isOutEnd() do
        wait()
      end
      L16_26:setVisible(false)
      L16_26:try_term()
    end
  end
  L18_28(L19_29)
  L18_28 = Fn_naviKill
  L18_28()
  L18_28 = Fn_captionViewEnd
  L18_28()
  L18_28 = Fn_playerTurnEnd
  L18_28()
  L17_27 = true
  _camera_setting_end = true
  L18_28 = Camera
  L19_29 = L18_28
  L18_28 = L18_28.lookTo
  L20_30 = L8_18.getWorldPos
  L20_30 = L20_30(L21_31)
  L18_28(L19_29, L20_30, L21_31, L22_32)
  L18_28 = Camera
  L19_29 = L18_28
  L18_28 = L18_28.setControl
  L20_30 = Camera
  L20_30 = L20_30.kPlayer
  L18_28(L19_29, L20_30, L21_31, L22_32)
  L18_28 = Fn_userCtrlAllOff
  L18_28()
  L18_28 = Sound
  L19_29 = L18_28
  L18_28 = L18_28.playSE
  L20_30 = "kit019"
  L25_35 = L23_33()
  L18_28(L19_29, L20_30, L21_31, L22_32, L23_33, L24_34, L25_35, L23_33())
  L18_28 = Fn_captionViewWait
  L19_29 = "ep80_00055"
  L18_28(L19_29)
  if L15_25 ~= nil then
    L19_29 = L15_25
    L18_28 = L15_25.isRunning
    L18_28 = L18_28(L19_29)
    if L18_28 == true then
      L19_29 = L15_25
      L18_28 = L15_25.abort
      L18_28(L19_29)
    end
  end
  L15_25 = nil
  L19_29 = L6_16
  L18_28 = L6_16.isPoseAnimPlaying
  L20_30 = "wave_hand_in_00"
  L18_28 = L18_28(L19_29, L20_30)
  if L18_28 ~= true then
    L19_29 = L6_16
    L18_28 = L6_16.isPoseAnimPlaying
    L20_30 = "wave_hand_00"
    L18_28 = L18_28(L19_29, L20_30)
  else
    if L18_28 == true then
      repeat
        L18_28 = wait
        L18_28()
        L19_29 = L5_15
        L18_28 = L5_15.isMotionEnd
        L18_28 = L18_28(L19_29)
      until L18_28
      L18_28 = Fn_playMotionNpc
      L19_29 = L5_15
      L20_30 = "wave_hand_out_00"
      L18_28(L19_29, L20_30, L21_31)
  end
  else
    L18_28 = waitSeconds
    L19_29 = 1
    L18_28(L19_29)
  end
  L18_28 = {}
  L19_29 = invokeTask
  function L20_30()
    L18_28 = create_wind_effect()
  end
  L19_29(L20_30)
  function L19_29()
    Fn_findAreaHandle("ve_crane_root"):setSceneParameters("po_a_root")
    for _FORV_4_, _FORV_5_ in pairs(_area_ctrls) do
      _area_ctrls[_FORV_4_]:play()
    end
    ji_set_visible(true)
    Vehicle:setVisible(true)
    Wind:setWind()
    Camera:removeScreenEffect(0)
    for _FORV_4_, _FORV_5_ in pairs(L3_13) do
      if _FORV_5_ ~= nil and _FORV_5_:isRunning() == true then
        _FORV_5_:abort()
      end
    end
    L3_13 = {}
    Camera:stopShake(0)
  end
  ji_visible = L19_29
  L19_29 = Fn_kaiwaDemoView2
  L20_30 = "ep80_00010k"
  L19_29(L20_30, L21_31, L22_32)
  L19_29 = _sdemo
  L20_30 = L19_29
  L19_29 = L19_29.set
  L19_29(L20_30, L21_31, L22_32)
  L19_29 = _sdemo
  L20_30 = L19_29
  L19_29 = L19_29.switchCamera
  L19_29(L20_30, L21_31, L22_32)
  L19_29 = _sdemo
  L20_30 = L19_29
  L19_29 = L19_29.play
  L22_32.time = 2.5
  L22_32.pos = "locator2_cut01_cam02"
  L23_33.time = 4
  L23_33.pos = "locator2_cut01_aim02"
  L23_33.hashfunc = "EaseOut"
  L19_29(L20_30, L21_31, L22_32)
  L20_30 = L9_19
  L19_29 = L9_19.getWorldPos
  L19_29 = L19_29(L20_30)
  L20_30 = Player
  L20_30 = L20_30.setLookAtIk
  L24_34 = L19_29
  L20_30(L21_31, L22_32, L23_33, L24_34)
  L20_30 = waitSeconds
  L20_30(L21_31)
  L20_30 = Fn_playMotionNpc
  L24_34 = {}
  L24_34.isRepeat = true
  L20_30(L21_31, L22_32, L23_33, L24_34)
  L20_30 = Camera
  L20_30 = L20_30.lookTo
  L24_34 = "locator2_cut01_aim02"
  L24_34 = 0
  L20_30(L21_31, L22_32, L23_33, L24_34)
  L20_30 = waitSeconds
  L20_30(L21_31)
  L20_30 = Fn_captionView
  L20_30(L21_31, L22_32)
  while true do
    L20_30 = _sdemo
    L20_30 = L20_30.isPlay
    L20_30 = L20_30(L21_31)
    if L20_30 then
      L20_30 = wait
      L20_30()
    end
  end
  L20_30 = _sdemo
  L20_30 = L20_30.stop
  L20_30(L21_31, L22_32)
  L20_30 = waitSeconds
  L20_30(L21_31)
  L20_30 = camera_shake_task
  L20_30 = L20_30()
  L24_34 = 1
  L25_35 = L19_29
  L21_31(L22_32, L23_33, L24_34, L25_35)
  L21_31()
  L21_31(L22_32)
  if L21_31 ~= nil then
    if L21_31 == true then
      L21_31(L22_32)
    end
  end
  L20_30[3] = nil
  L21_31(L22_32)
  _gull_follow_end = true
  L24_34 = false
  L25_35 = {}
  L25_35.isRepeat = true
  L21_31(L22_32, L23_33, L24_34, L25_35)
  L24_34 = false
  L25_35 = {}
  L25_35.isRepeat = true
  L21_31(L22_32, L23_33, L24_34, L25_35)
  L21_31(L22_32)
  if L21_31 ~= nil then
    if L21_31 == true then
      L21_31(L22_32)
    end
  end
  if L21_31 ~= nil then
    if L21_31 == true then
      L21_31(L22_32)
    end
  end
  L20_30 = L21_31
  L21_31(L22_32, L23_33)
  L21_31(L22_32)
  L21_31(L22_32)
  for L24_34, L25_35 in L21_31(L22_32) do
    L25_35:try_term()
  end
  L18_28 = L21_31
  if L4_14 ~= nil then
    if L21_31 == true then
      L21_31(L22_32)
    end
  end
  for L24_34, L25_35 in L21_31(L22_32) do
    if L25_35 ~= nil and L25_35:isRunning() == true then
      L25_35:abort()
    end
    Fn_disappearNpc("gull_" .. L24_34)
  end
  _gull_task = L21_31
  for L24_34, L25_35 in L21_31(L22_32) do
    if L25_35:isPlayEnd() == false then
      L25_35:stop()
    end
  end
  L21_31()
  for L24_34, L25_35 in L21_31(L22_32) do
    L25_35:setEffectiveness(true, true)
  end
  L21_31()
  for L24_34, L25_35 in L21_31(L22_32) do
    Sound:stopSEHandle(L25_35)
  end
  if L21_31 == true then
    L21_31(L22_32)
  else
    L21_31()
  end
  L21_31()
  L21_31()
end
function Finalize()
  local L0_37, L1_38, L2_39, L3_40, L4_41
  _area_ctrls = L0_37
  _area_tbl = L0_37
  for L3_40, L4_41 in L0_37(L1_38) do
    if L4_41 ~= nil and L4_41:isRunning() == true then
      L4_41:abort()
    end
  end
  _gull_task = L0_37
  if L0_37 ~= nil then
    for L3_40, L4_41 in L0_37(L1_38) do
      Sound:stopSEHandle(L4_41)
    end
    se_tbl = L0_37
  end
  L3_40 = "ship_jir_wall"
  L3_40 = false
  L1_38(L2_39, L3_40)
  L3_40 = true
  L1_38(L2_39, L3_40)
end
function get_se_tbl()
  local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49
  L0_42 = {
    L1_43,
    L2_44,
    L3_45,
    L4_46,
    L5_47,
    L6_48,
    L7_49,
    {
      name = "bu_a_14_02",
      aa_x = -3,
      aa_y = -5,
      aa_z = -7.1,
      bb_x = 5,
      bb_y = -1,
      bb_z = 2.9
    },
    {
      name = "bu_a_15",
      aa_x = -6,
      aa_y = -3,
      aa_z = -8,
      bb_x = 6,
      bb_y = 3,
      bb_z = 8
    },
    {
      name = "ve_crane_root",
      aa_x = -9,
      aa_y = -4,
      aa_z = -10.5,
      bb_x = 4,
      bb_y = 9,
      bb_z = 10.5
    }
  }
  L1_43 = {L2_44}
  L1_43.name = "bu_a_02"
  L1_43.aa_x = -4.5
  L1_43.aa_y = -4
  L1_43.aa_z = -6
  L1_43.bb_x = 4.5
  L1_43.bb_y = -0.3
  L1_43.bb_z = 6
  L2_44.name = "bu_a_03_01"
  L2_44.aa_x = -6
  L2_44.aa_y = -5.3
  L2_44.aa_z = -5
  L2_44.bb_x = 6
  L2_44.bb_y = -0.3
  L2_44.bb_z = 5
  L3_45.name = "bu_a_03_02"
  L3_45.aa_x = -6
  L3_45.aa_y = -5.3
  L3_45.aa_z = -5
  L3_45.bb_x = 6
  L3_45.bb_y = -0.3
  L3_45.bb_z = 5
  L4_46.name = "bu_a_09"
  L4_46.aa_x = -5.67
  L4_46.aa_y = -5.8
  L4_46.aa_z = -11
  L4_46.bb_x = 5.33
  L4_46.bb_y = 3.2
  L4_46.bb_z = 0
  L5_47 = {}
  L5_47.name = "bu_a_12_01"
  L5_47.aa_x = -7
  L5_47.aa_y = -1.75
  L5_47.aa_z = -6
  L5_47.bb_x = 3
  L5_47.bb_y = 1.75
  L5_47.bb_z = 6
  L6_48 = {}
  L6_48.name = "bu_a_12_02"
  L6_48.aa_x = -7
  L6_48.aa_y = -1.75
  L6_48.aa_z = -6
  L6_48.bb_x = 3
  L6_48.bb_y = 1.75
  L6_48.bb_z = 6
  L7_49 = {}
  L7_49.name = "bu_a_14_01"
  L7_49.aa_x = -3
  L7_49.aa_y = -5
  L7_49.aa_z = -7.1
  L7_49.bb_x = 5
  L7_49.bb_y = -1
  L7_49.bb_z = 2.9
  L1_43 = {}
  for L5_47, L6_48 in L2_44(L3_45) do
    L7_49 = createGameObject2
    L7_49 = L7_49("GimmickBg")
    L7_49:try_init()
    L7_49:waitForReady()
    L7_49:try_start()
    L7_49:setLocalAabb(Aabb(Vector(L6_48.aa_x, L6_48.aa_y, L6_48.aa_z), Vector(L6_48.bb_x, L6_48.bb_y, L6_48.bb_z)))
    _area_tbl[L6_48.name]:appendChild(L7_49)
    L1_43[L6_48.name] = Sound:playSEHandleBox("ships_move", 1, "", L7_49)
  end
  L3_45(L4_46)
  L3_45(L4_46)
  L3_45(L4_46)
  L5_47 = Aabb
  L6_48 = Vector
  L7_49 = 2.1
  L6_48 = L6_48(L7_49, 13.5, 2.5)
  L7_49 = Vector
  L7_49 = L7_49(3.1, 14.5, -2.5)
  L7_49 = L5_47(L6_48, L7_49, L7_49(3.1, 14.5, -2.5))
  L3_45(L4_46, L5_47, L6_48, L7_49, L5_47(L6_48, L7_49, L7_49(3.1, 14.5, -2.5)))
  L5_47 = L2_44
  L3_45(L4_46, L5_47)
  L5_47 = "ships_windmill"
  L6_48 = 1
  L7_49 = ""
  L1_43.bu_a_15_2 = L3_45
  return L1_43
end
function get_gull_tbl()
  local L0_50, L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57
  L0_50 = {}
  L1_51 = 1
  for L5_55, L6_56 in L2_52(L3_53) do
    L7_57 = 1
    while true do
      if findGameObject2("Node", "locator2_gull_" .. L5_55 .. "_" .. string.format("%02d", L7_57)) ~= nil then
        L0_50[L1_51] = {
          name = "gull_" .. L1_51,
          type = "gull02",
          node = findGameObject2("Node", "locator2_gull_" .. L5_55 .. "_" .. string.format("%02d", L7_57)):getName(),
          use_gravity = false,
          attach = true,
          start = true,
          area_name = L5_55
        }
        L7_57 = L7_57 + 1
        L1_51 = L1_51 + 1
        break
      end
    end
  end
  return L0_50
end
function gull_follow(A0_58, A1_59)
  return invokeTask(function()
    local L0_60, L1_61
    L0_60 = Fn_findNpc
    L1_61 = A0_58
    L0_60 = L0_60(L1_61)
    L1_61 = L0_60.wanderFly
    L1_61(L0_60, 3, 1, 5)
    while true do
      L1_61 = _gull_follow_end
      if L1_61 == false then
        L1_61 = wait
        L1_61()
      end
    end
    L1_61 = RandI
    L1_61 = L1_61(5, 30)
    for _FORV_5_ = 1, L1_61 do
      waitSeconds(0.1)
    end
    L0_60:fly({
      {
        pos = "locator2_gull_" .. A1_59 .. "_goal",
        attr = "fly"
      }
    }, {
      moveSpeed = RandI(2, 3)
    })
  end)
end
function man32_action_task()
  return invokeTask(function()
    local L0_62, L1_63, L2_64
    L0_62 = Fn_findNpc
    L1_63 = "man32"
    L0_62 = L0_62(L1_63)
    L1_63 = Fn_playMotionNpc
    L2_64 = L0_62
    L1_63(L2_64, "sit_floor_02")
    while true do
      L1_63 = _camera_setting_end
      if L1_63 == false then
        L1_63 = wait
        L1_63()
      end
    end
    L1_63 = waitSeconds
    L2_64 = 2
    L1_63(L2_64)
    L1_63 = Fn_playMotionNpc
    L2_64 = L0_62
    L1_63(L2_64, "sit_floor_out_02", true)
    L1_63 = Fn_playMotionNpc
    L2_64 = L0_62
    L1_63(L2_64, "sit_floor_out_00", true)
    L2_64 = L0_62
    L1_63 = L0_62.setStagger
    L1_63(L2_64, true)
    L1_63 = Fn_moveNpc
    L2_64 = L0_62
    L1_63 = L1_63(L2_64, {
      "locator2_man32_move"
    }, {
      arrivedLength = 0,
      runLength = 30,
      navimesh = true,
      recast = false
    })
    while true do
      L2_64 = L1_63.isRunning
      L2_64 = L2_64(L1_63)
      if L2_64 then
        L2_64 = wait
        L2_64()
      end
    end
    L2_64 = L0_62.setStagger
    L2_64(L0_62, false)
    L2_64 = findGameObject2
    L2_64 = L2_64("Node", "locator2_man32_move")
    while Fn_isInSightTarget(L2_64, 1) == false do
      wait()
    end
    waitSeconds(0.5)
    Fn_playMotionNpc(L0_62, "man01_idle_bu_00", true, {isRepeat = false, isStop = true})
    waitSeconds(RandF(2, 4))
    while Fn_isInSightTarget(L2_64, 1) == false do
      wait()
    end
    Fn_playMotionNpc(L0_62, "sit_floor_in_00", true)
    Fn_playMotionNpc(L0_62, "sit_floor_in_02", true)
    Fn_playMotionNpc(L0_62, "sit_floor_02")
  end)
end
function create_wind_effect()
  local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78, L14_79, L15_80, L16_81
  L0_65 = {}
  L0_65.s_l = "ef_bg_smk_03"
  L0_65.s_r = "ef_bg_smk_04"
  L0_65.s_c = "ef_bg_smk_05"
  L0_65.l_l = "ef_bg_smk_06"
  L0_65.l_r = "ef_bg_smk_07"
  L0_65.l_c = "ef_bg_smk_08"
  L0_65.c_c = "ef_bg_smk_09"
  L1_66 = {}
  L1_66.bu_a_02 = 0.7
  L1_66.bu_a_03_01 = 0.6
  L1_66.bu_a_03_02 = 0.6
  L1_66.bu_a_08 = 0.5
  L1_66.bu_a_09 = 1
  L1_66.bu_a_12_01 = 0.7
  L1_66.bu_a_12_02 = 0.7
  L1_66.bu_a_14_01 = 0.5
  L1_66.bu_a_14_01 = 0.5
  L1_66.bu_a_15 = 1
  L2_67 = 1
  L3_68 = {}
  for L7_72, L8_73 in L4_69(L5_70) do
    for L12_77, L13_78 in L9_74(L10_75) do
      L14_79 = 1
      while true do
        L15_80 = "ef_"
        L16_81 = L12_77
        L15_80 = L15_80 .. L16_81 .. "_" .. L7_72 .. "_" .. string.format("%02d", L14_79)
        L16_81 = findGameObject2
        L16_81 = L16_81("Node", "locator2_" .. L15_80)
        if L16_81 ~= nil then
          if RandI(1, 10) <= 3 then
            Fn_createEffect(L15_80, L13_78, L16_81, true):setAlpha(0.7)
          elseif RandI(1, 10) <= 6 then
            Fn_createEffect(L15_80, L13_78, L16_81, true):setAlpha(0.5)
          else
            Fn_createEffect(L15_80, L13_78, L16_81, true):setAlpha(0.1)
          end
          if L12_77 == "c_c" and L1_66[L7_72] ~= nil then
            Fn_createEffect(L15_80, L13_78, L16_81, true):setScale(Vector(L1_66[L7_72], L1_66[L7_72], L1_66[L7_72]))
          end
          L3_68[L2_67] = Fn_createEffect(L15_80, L13_78, L16_81, true)
          L2_67 = L2_67 + 1
        else
          break
        end
        L14_79 = L14_79 + 1
      end
    end
  end
  return L3_68
end
function ji_set_visible(A0_82)
  local L1_83, L2_84
  L1_83 = Fn_findAreaHandle
  L2_84 = "ji_e_root"
  L1_83 = L1_83(L2_84)
  L2_84 = L1_83.getDescendant
  L2_84 = L2_84(L1_83)
  for _FORV_6_, _FORV_7_ in pairs(L2_84) do
    _FORV_7_:setEffectiveness(A0_82, true)
  end
end
function create_marker(A0_85)
  local L1_86
  L1_86 = createGameObject2
  L1_86 = L1_86("MapMarker")
  L1_86:setAssetName("gui_marker_26")
  L1_86:setupPattern("default")
  findGameObject2("Node", A0_85):appendChild(L1_86)
  L1_86:try_init()
  L1_86:waitForReady()
  L1_86:try_start()
  return L1_86
end
function game_mode_select()
  local L0_87, L1_88, L2_89, L3_90
  function L0_87()
    GameDatabase:set(ggd.EventFlags__ep80__BeginnerMode, true)
    GameDatabase:set(ggd.EventFlags__sm93__TutorialFlags, false)
  end
  L1_88 = false
  while true do
    repeat
      while true do
        if L1_88 == false then
          L2_89 = HUD
          L3_90 = L2_89
          L2_89 = L2_89.yesnoOpen2
          L2_89(L3_90, "ep80_10000")
          L2_89 = nil
          while true do
            L3_90 = HUD
            L3_90 = L3_90.yesnoResult
            L3_90 = L3_90(L3_90)
            L2_89 = L3_90
            if L2_89 ~= nil then
              L3_90 = HUD
              L3_90 = L3_90.kYesNoAnswerYes
              if L2_89 == L3_90 then
                L3_90 = L0_87
                L3_90()
                L1_88 = true
                break
              end
              L3_90 = HUD
              L3_90 = L3_90.kYesNoAnswerNo
            end
            if L2_89 == L3_90 then
              L3_90 = HUD
              L3_90 = L3_90.yesnoOpen
              L3_90(L3_90, "ep80_10003")
              L3_90 = nil
              while true do
                L3_90 = HUD:yesnoResult()
                if L3_90 ~= nil then
                  if L3_90 == HUD.kYesNoAnswerYes then
                    GameDatabase:set(ggd.EventFlags__ep80__BeginnerMode, false)
                    L1_88 = true
                    do break end
                    break
                  end
                end
                wait()
              end
            end
            L3_90 = wait
            L3_90()
          end
        end
      end
    until L3_90 ~= HUD.kYesNoAnswerNo
  end
end
function camera_shake_task()
  local L0_91
  L0_91 = {}
  L0_91[1] = invokeTask(function()
    while true do
      hz = RandF(0.05, 0.3)
      Camera:shake3D(2 / hz, RandF(0.09, 0.2), hz, _area_tbl.ve_crane_root:getWorldPos(), 0)
      waitSeconds(RandF(3, 5))
    end
  end)
  L0_91[2] = invokeTask(function()
    while true do
      waitSeconds(RandF(1, 3.5))
      Camera:shake3D(RandF(3, 7), RandF(0.001, 0.004), RandF(8, 12), _area_tbl.ve_crane_root:getWorldPos(), 0)
    end
  end)
  L0_91[3] = invokeTask(function()
    while true do
      waitSeconds(RandF(0.7, 6))
      Camera:shake3D(RandF(0.5, 2), RandF(0.003, 0.01), RandF(1, 12), _area_tbl.ve_crane_root:getWorldPos(), 0)
    end
  end)
  return L0_91
end
