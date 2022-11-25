dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
_npc_cid = "npcgen2_cid_01"
_npc_gal01 = "npcgen2_gal_01"
_npc_gal02 = "npcgen2_gal_02"
_npc_gal03 = "npcgen2_gal_03"
_npc_kid01 = "npcgen2_chi11_01"
_npc_kid02 = "npcgen2_chi12_01"
_gem_tbl = {}
_guide_type = nil
_next_phase = false
_cid_near = false
_bungua_near = false
_wa_area_visit = false
function Initialize()
  local L0_0
  L0_0 = Fn_setCatWarp
  L0_0(false)
  L0_0 = pc_sensor_all_off
  L0_0()
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_wa_area")
  L0_0 = setup_debri
  L0_0()
  L0_0 = {
    {
      name = "magichand01",
      type = "cimagichand01",
      anim_name = "magichand_00"
    }
  }
  Fn_setupNpc(L0_0)
  Fn_setNpcVisible(_npc_cid, false)
  Fn_setNpcVisible(_npc_gal01, false)
  Fn_setNpcVisible(_npc_gal02, false)
  Fn_setNpcVisible(_npc_gal03, false)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L0_1 = {}
  L1_2 = 1
  while true do
    L2_3 = findGameObject2
    L3_4 = "Gem"
    L4_5 = string
    L4_5 = L4_5.format
    L5_6 = "gem2_energy_%02d"
    L6_7 = L1_2
    L21_22 = L4_5(L5_6, L6_7)
    L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L4_5(L5_6, L6_7))
    if L2_3 ~= nil then
      L4_5 = L2_3
      L3_4 = L2_3.setActive
      L5_6 = false
      L3_4(L4_5, L5_6)
      L0_1[L1_2] = L2_3
    else
      break
    end
    L1_2 = L1_2 + 1
  end
  L2_3 = Fn_lockPlayerAbility
  L3_4 = nil
  L4_5 = {}
  L4_5.v_infinite = true
  L4_5.g_infinite = true
  L2_3(L3_4, L4_5)
  L2_3 = Fn_missionStart
  L2_3()
  L2_3 = Fn_userCtrlOn
  L2_3()
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_wa_area"
  L2_3(L3_4)
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_pc_03"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_bu_wa_warp"
  L2_3(L3_4)
  L2_3 = Fn_captionViewWait
  L3_4 = "ep02_00112"
  L2_3(L3_4)
  L2_3 = Fn_missionView
  L3_4 = "ep02_00114"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_wa_tut_00"
  L2_3(L3_4)
  L2_3 = Fn_naviSet
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_wa_tut_00"
  L21_22 = L3_4(L4_5, L5_6)
  L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L3_4(L4_5, L5_6))
  repeat
    L2_3 = wait
    L2_3()
    L2_3 = _wa_area_visit
  until L2_3
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_pc_restart_pos_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOff
  L3_4 = "pccubesensor2_wa_area"
  L2_3(L3_4)
  repeat
    L2_3 = wait
    L2_3()
    L2_3 = _isInSensor
    L2_3 = L2_3.pccubesensor2_wa_tut_00
  until L2_3
  L2_3 = Fn_pcSensorOff
  L3_4 = "pccubesensor2_wa_tut_00"
  L2_3(L3_4)
  L2_3 = Fn_naviKill
  L2_3()
  L2_3 = Player
  L3_4 = L2_3
  L2_3 = L2_3.setStay
  L4_5 = true
  L5_6 = false
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_userCtrlOff
  L2_3()
  L2_3 = Player
  L3_4 = L2_3
  L2_3 = L2_3.isGravityControlMode
  L2_3 = L2_3(L3_4)
  if L2_3 then
    L2_3 = Player
    L3_4 = L2_3
    L2_3 = L2_3.setGravityControlMode
    L4_5 = false
    L2_3(L3_4, L4_5)
  end
  L2_3 = Fn_captionViewWait
  L3_4 = "ep02_00115"
  L2_3(L3_4)
  L2_3 = false
  while true do
    L3_4 = LocalTimerClass
    L3_4 = L3_4.new
    L3_4 = L3_4()
    L5_6 = L3_4
    L4_5 = L3_4.setTime
    L6_7 = 0
    L4_5(L5_6, L6_7)
    L5_6 = L3_4
    L4_5 = L3_4.start
    L4_5(L5_6)
    L4_5 = pc_sensor_all_off
    L4_5()
    L4_5 = Fn_setCatWarpCheckPoint
    L5_6 = "locator2_wa_tut_00"
    L4_5(L5_6)
    _next_phase = false
    L4_5 = Fn_pcSensorOn
    L5_6 = "pccubesensor2_wa_tut_01"
    L4_5(L5_6)
    L4_5 = Fn_pcSensorOn
    L5_6 = "pccubesensor2_wa_warp_01"
    L4_5(L5_6)
    L4_5 = Player
    L5_6 = L4_5
    L4_5 = L4_5.setStay
    L6_7 = false
    L4_5(L5_6, L6_7)
    L4_5 = Fn_userCtrlOn
    L4_5()
    L4_5 = findGameObject2
    L5_6 = "Node"
    L6_7 = "locator2_wa_tut_01"
    L4_5 = L4_5(L5_6, L6_7)
    L5_6 = invokeTask
    function L6_7()
      playerTurn(L4_5)
    end
    L5_6(L6_7)
    L5_6 = lookAtObject
    L6_7 = L4_5
    L7_8 = _LOOKTO_RESET_DURATION
    L8_9 = _LOOKTO_DISABLESTICK_DURATION
    L5_6(L6_7, L7_8, L8_9)
    L5_6 = Fn_missionView
    L6_7 = "ep02_00151"
    L5_6(L6_7)
    L5_6 = waitSeconds
    L6_7 = _MARKER_WAIT_AFTER_MISSION_VIEW
    L5_6(L6_7)
    L5_6 = Fn_naviSet
    L6_7 = L4_5
    L5_6(L6_7)
    L5_6 = waitSeconds
    L6_7 = _CAPTION_WAIT_AFTER_MARKER
    L5_6(L6_7)
    L5_6 = Fn_tutorialCaption
    L6_7 = "gravity_ep02_04"
    L5_6(L6_7)
    L5_6 = Player
    L6_7 = L5_6
    L5_6 = L5_6.setEnergyInfinite
    L7_8 = Player
    L7_8 = L7_8.kEnergy_Gravity
    L8_9 = false
    L5_6(L6_7, L7_8, L8_9)
    L5_6 = {}
    L5_6.r_stick = false
    L5_6.l_stick = false
    L5_6.v_infinite = true
    L5_6.g_infinite = true
    L5_6.s_infinite = false
    L6_7 = Fn_unLockPlayerAbility
    L7_8 = nil
    L8_9 = L5_6
    L6_7(L7_8, L8_9)
    while true do
      L6_7 = _isInSensor
      L6_7 = L6_7.pccubesensor2_wa_tut_01
      if L6_7 then
        L6_7 = Player
        L7_8 = L6_7
        L6_7 = L6_7.isGravityControlMode
        L6_7 = L6_7(L7_8)
        if L6_7 then
          L6_7 = Player
          L7_8 = L6_7
          L6_7 = L6_7.getAction
          L6_7 = L6_7(L7_8)
          L7_8 = Player
          L7_8 = L7_8.kAction_Idle
        end
      end
      if L6_7 ~= L7_8 then
        L6_7 = wait
        L6_7()
      end
    end
    L6_7 = Fn_pcSensorOff
    L7_8 = "pccubesensor2_wa_tut_01"
    L6_7(L7_8)
    L6_7 = Sound
    L7_8 = L6_7
    L6_7 = L6_7.playSE
    L8_9 = "success"
    L6_7(L7_8, L8_9)
    L6_7 = Fn_naviKill
    L6_7()
    L6_7 = Fn_tutorialCaptionKill
    L6_7()
    L6_7 = Fn_pcSensorOff
    L7_8 = "pccubesensor2_wa_warp_01"
    L6_7(L7_8)
    L6_7 = Fn_setCatWarpCheckPoint
    L7_8 = "locator2_wa_tut_01"
    L6_7(L7_8)
    L6_7 = Player
    L7_8 = L6_7
    L6_7 = L6_7.setStay
    L8_9 = false
    L6_7(L7_8, L8_9)
    L6_7 = Fn_userCtrlOn
    L6_7()
    L6_7 = Fn_pcSensorOn
    L7_8 = "pccubesensor2_wa_tut_02"
    L6_7(L7_8)
    L6_7 = Fn_pcSensorOn
    L7_8 = "pccubesensor2_wa_warp_02"
    L6_7(L7_8)
    L6_7 = waitSeconds
    L7_8 = 1
    L6_7(L7_8)
    L6_7 = Fn_captionView
    L7_8 = "ep02_00152"
    L6_7(L7_8)
    L6_7 = findGameObject2
    L7_8 = "Node"
    L8_9 = "locator2_wa_tut_02"
    L6_7 = L6_7(L7_8, L8_9)
    L7_8 = lookAtObject
    L8_9 = L6_7
    L9_10 = _LOOKTO_RESET_DURATION
    L10_11 = _LOOKTO_DISABLESTICK_DURATION
    L7_8(L8_9, L9_10, L10_11)
    L7_8 = Fn_missionView
    L8_9 = "ep02_00122"
    L7_8(L8_9)
    L7_8 = waitSeconds
    L8_9 = _MARKER_WAIT_AFTER_MISSION_VIEW
    L7_8(L8_9)
    L7_8 = Fn_naviSet
    L8_9 = L6_7
    L7_8(L8_9)
    L7_8 = waitSeconds
    L8_9 = _CAPTION_WAIT_AFTER_MARKER
    L7_8(L8_9)
    L7_8 = Fn_tutorialCaption
    L8_9 = "gravitycancel_ep02_01"
    L7_8(L8_9)
    while true do
      L7_8 = _isInSensor
      L7_8 = L7_8.pccubesensor2_wa_tut_02
      if L7_8 then
        L7_8 = Player
        L8_9 = L7_8
        L7_8 = L7_8.isGravityControlMode
        L7_8 = L7_8(L8_9)
        if not L7_8 then
          L7_8 = Player
          L8_9 = L7_8
          L7_8 = L7_8.getAction
          L7_8 = L7_8(L8_9)
          L8_9 = Player
          L8_9 = L8_9.kAction_Idle
        end
      end
      if L7_8 ~= L8_9 then
        L7_8 = wait
        L7_8()
      end
    end
    L7_8 = Fn_pcSensorOff
    L8_9 = "pccubesensor2_wa_tut_02"
    L7_8(L8_9)
    L7_8 = Sound
    L8_9 = L7_8
    L7_8 = L7_8.playSE
    L9_10 = "success"
    L7_8(L8_9, L9_10)
    L7_8 = Fn_naviKill
    L7_8()
    L7_8 = Fn_tutorialCaptionKill
    L7_8()
    L7_8 = Fn_tutorialCaptionKill
    L7_8()
    L7_8 = Fn_pcSensorOff
    L8_9 = "pccubesensor2_wa_warp_02"
    L7_8(L8_9)
    L7_8 = Fn_setCatWarpCheckPoint
    L8_9 = "locator2_wa_tut_02"
    L7_8(L8_9)
    L7_8 = Fn_pcSensorOn
    L8_9 = "pccubesensor2_wa_tut_03_01"
    L7_8(L8_9)
    L7_8 = Fn_pcSensorOn
    L8_9 = "pccubesensor2_wa_warp_03"
    L7_8(L8_9)
    L7_8 = tutorial_gem
    L7_8()
    L7_8 = Fn_captionView
    L8_9 = "ep02_00153"
    L7_8(L8_9)
    L7_8 = findGameObject2
    L8_9 = "Node"
    L9_10 = "locator2_wa_tut_03_01"
    L7_8 = L7_8(L8_9, L9_10)
    L8_9 = invokeTask
    function L9_10()
      playerTurn(L7_8)
    end
    L8_9(L9_10)
    L8_9 = lookAtObject
    L9_10 = L7_8
    L10_11 = _LOOKTO_RESET_DURATION
    L11_12 = _LOOKTO_DISABLESTICK_DURATION
    L8_9(L9_10, L10_11, L11_12)
    L8_9 = Fn_missionView
    L9_10 = "ep02_00118"
    L8_9(L9_10)
    L8_9 = waitSeconds
    L9_10 = _MARKER_WAIT_AFTER_MISSION_VIEW
    L8_9(L9_10)
    L8_9 = Fn_naviSet
    L9_10 = L7_8
    L8_9(L9_10)
    L8_9 = waitSeconds
    L9_10 = _CAPTION_WAIT_AFTER_MARKER
    L8_9(L9_10)
    L8_9 = Fn_tutorialCaption
    L9_10 = "gravity_ep02_04"
    L8_9(L9_10)
    while true do
      L8_9 = _isInSensor
      L8_9 = L8_9.pccubesensor2_wa_tut_03_01
      if L8_9 then
        L8_9 = Player
        L9_10 = L8_9
        L8_9 = L8_9.isGravityControlMode
        L8_9 = L8_9(L9_10)
        if L8_9 then
          L8_9 = Player
          L9_10 = L8_9
          L8_9 = L8_9.getAction
          L8_9 = L8_9(L9_10)
          L9_10 = Player
          L9_10 = L9_10.kAction_Idle
        end
      end
      if L8_9 ~= L9_10 then
        L8_9 = wait
        L8_9()
      end
    end
    L8_9 = Fn_pcSensorOff
    L9_10 = "pccubesensor2_wa_tut_03_01"
    L8_9(L9_10)
    L8_9 = Sound
    L9_10 = L8_9
    L8_9 = L8_9.playSE
    L10_11 = "success"
    L8_9(L9_10, L10_11)
    L8_9 = Fn_naviKill
    L8_9()
    L8_9 = Fn_tutorialCaptionKill
    L8_9()
    L8_9 = Fn_pcSensorOff
    L9_10 = "pccubesensor2_wa_warp_03"
    L8_9(L9_10)
    L8_9 = Fn_setCatWarpCheckPoint
    L9_10 = "locator2_wa_tut_03_01"
    L8_9(L9_10)
    if not L2_3 then
      L8_9 = HUD
      L9_10 = L8_9
      L8_9 = L8_9.info
      L10_11 = "ep02_info_03"
      L11_12 = false
      L8_9(L9_10, L10_11, L11_12)
      L2_3 = true
    end
    L8_9 = Fn_pcSensorOn
    L9_10 = "pccubesensor2_wa_warp_04"
    L8_9(L9_10)
    L8_9 = Fn_pcSensorOn
    L9_10 = "pccubesensor2_wa_tut_03_02"
    L8_9(L9_10)
    L8_9 = findGameObject2
    L9_10 = "Node"
    L10_11 = "locator2_wa_tut_03_02"
    L8_9 = L8_9(L9_10, L10_11)
    L9_10 = lookAtObject
    L10_11 = L8_9
    L11_12 = _LOOKTO_RESET_DURATION
    L9_10(L10_11, L11_12, L12_13)
    L9_10 = Fn_tutorialCaption
    L10_11 = "move_ep02_01"
    L9_10(L10_11)
    L9_10 = Fn_missionView
    L10_11 = "ep02_00118"
    L9_10(L10_11)
    L9_10 = waitSeconds
    L10_11 = _MARKER_WAIT_AFTER_MISSION_VIEW
    L9_10(L10_11)
    L9_10 = -1
    L10_11 = invokeTask
    function L11_12()
      local L0_23, L1_24, L2_25, L3_26, L4_27
      L0_23 = {
        L1_24,
        L2_25,
        L3_26
      }
      L1_24 = "pccubesensor2_wa_tut_03_02"
      L2_25 = "pccubesensor2_wa_tut_03_03"
      L3_26 = "pccubesensor2_wa_tut_03_04"
      L1_24 = {
        L2_25,
        L3_26,
        L4_27
      }
      L2_25 = "locator2_wa_tut_03_02"
      L3_26 = "locator2_wa_tut_03_03"
      L4_27 = "locator2_wa_tut_03_04"
      L2_25 = 1
      L3_26 = true
      while true do
        if L2_25 > 3 then
          L4_27 = 1
          L9_10 = L4_27
          break
        else
          L4_27 = Player
          L4_27 = L4_27.isGravityControlMode
          L4_27 = L4_27(L4_27)
          if not L4_27 then
            L4_27 = 2
            L9_10 = L4_27
            break
          end
        end
        if L3_26 then
          L4_27 = Fn_pcSensorOn
          L4_27(L0_23[L2_25])
          L4_27 = findGameObject2
          L4_27 = L4_27("Node", L1_24[L2_25])
          Fn_naviSet(L4_27)
          L3_26 = false
        end
        L4_27 = _next_phase
        if L4_27 then
          L2_25 = L2_25 + 1
          L3_26 = true
          _next_phase = false
        end
        L4_27 = wait
        L4_27()
      end
    end
    L10_11(L11_12)
    repeat
      L10_11 = wait
      L10_11()
    until L9_10 > 0
    L10_11 = Fn_tutorialCaptionKill
    L10_11()
    L10_11 = Fn_pcSensorOn
    L11_12 = "pccubesensor2_wa_tut_04"
    L10_11(L11_12)
    L10_11 = findGameObject2
    L11_12 = "Node"
    L10_11 = L10_11(L11_12, L12_13)
    L11_12 = Fn_naviSet
    L11_12(L12_13)
    L11_12 = waitSeconds
    L11_12(L12_13)
    if L9_10 == 1 then
      L11_12 = Fn_tutorialCaption
      L11_12(L12_13)
    else
      L11_12 = Fn_tutorialCaption
      L11_12(L12_13)
    end
    while true do
      L11_12 = _isInSensor
      L11_12 = L11_12.pccubesensor2_wa_tut_04
      if L11_12 then
        L11_12 = Player
        L11_12 = L11_12.getAction
        L11_12 = L11_12(L12_13)
      end
      if L11_12 ~= L12_13 then
        L11_12 = wait
        L11_12()
      end
    end
    L11_12 = Fn_pcSensorOff
    L11_12(L12_13)
    L11_12 = Fn_naviKill
    L11_12()
    L11_12 = Fn_tutorialCaptionKill
    L11_12()
    L11_12 = Fn_pcSensorOff
    L11_12(L12_13)
    L11_12 = Fn_setCatWarpCheckPoint
    L11_12(L12_13)
    L11_12 = Fn_pcSensorOn
    L11_12(L12_13)
    L11_12 = Fn_pcSensorOn
    L11_12(L12_13)
    L11_12 = findGameObject2
    L11_12 = L11_12(L12_13, L13_14)
    L15_16 = _LOOKTO_DISABLESTICK_DURATION
    L12_13(L13_14, L14_15, L15_16)
    L12_13(L13_14)
    L12_13(L13_14)
    L12_13(L13_14)
    L12_13(L13_14)
    L12_13(L13_14)
    L12_13(L13_14)
    L12_13(L13_14)
    while true do
      if L12_13 ~= L13_14 then
        L12_13()
      end
    end
    L12_13(L13_14)
    L12_13(L13_14, L14_15)
    L12_13()
    L12_13()
    L12_13(L13_14)
    L12_13(L13_14)
    for L15_16, L16_17 in L12_13(L13_14) do
      L17_18 = L16_17.setActive
      L17_18(L18_19, L19_20)
    end
    L12_13(L13_14)
    L12_13(L13_14)
    L12_13(L13_14)
    L15_16 = _LOOKTO_RESET_DURATION
    L16_17 = _LOOKTO_DISABLESTICK_DURATION
    L13_14(L14_15, L15_16, L16_17)
    L15_16 = "Node"
    L16_17 = "locator2_wa_tut_06"
    L21_22 = L14_15(L15_16, L16_17)
    L13_14(L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L14_15(L15_16, L16_17))
    L13_14(L14_15)
    L15_16 = "ep02_info_01"
    L16_17 = false
    L13_14(L14_15, L15_16, L16_17)
    while true do
      if L13_14 ~= L14_15 then
        L13_14()
      end
    end
    L13_14(L14_15)
    L15_16 = "success"
    L13_14(L14_15, L15_16)
    L13_14()
    L13_14()
    L13_14(L14_15)
    L13_14(L14_15)
    L15_16 = true
    L13_14(L14_15, L15_16)
    L13_14()
    L13_14(L14_15)
    L16_17 = L3_4
    L15_16 = L3_4.stop
    L15_16(L16_17)
    L16_17 = L3_4
    L15_16 = L3_4.getTime
    L15_16 = L15_16(L16_17)
    L16_17 = print
    L17_18 = string
    L17_18 = L17_18.format
    L21_22 = L17_18(L18_19, L19_20)
    L16_17(L17_18, L18_19, L19_20, L20_21, L21_22, L17_18(L18_19, L19_20))
    if L13_14 >= L15_16 then
      L16_17 = Fn_captionViewWait
      L17_18 = "ep02_00123"
      L16_17(L17_18)
    elseif L13_14 < L15_16 and L14_15 > L15_16 then
      L16_17 = Fn_captionViewWait
      L17_18 = "ep02_00157"
      L16_17(L17_18)
    else
      L16_17 = Fn_captionViewWait
      L17_18 = "ep02_00158"
      L16_17(L17_18)
    end
    L16_17 = {L17_18, L18_19}
    L17_18 = {}
    L17_18.text = "ep02_00124"
    L17_18.btn = L18_19
    L18_19.text = "ep02_00125"
    L18_19.btn = L19_20
    L17_18 = HUD
    L17_18 = L17_18.yesnoOpen
    L17_18(L18_19, L19_20)
    L17_18 = nil
    repeat
      L17_18 = L18_19
      L18_19()
    until L17_18 ~= nil
    if L17_18 == L18_19 then
      _restart = true
      L18_19()
      L18_19()
      L18_19(L19_20)
      for L21_22, _FORV_22_ in L18_19(L19_20) do
        _FORV_22_:setActive(false)
      end
      L21_22 = Player
      L21_22 = L21_22.getEnergyMax
      L21_22 = L21_22(L21_22, Player.kEnergy_Gravity)
      L18_19(L19_20, L20_21, L21_22, true)
      L21_22 = Fn_resetPcPos
      L21_22(L18_19, L19_20)
      L21_22 = lookAtObject
      L21_22(findGameObject2("Node", L20_21), _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
      L21_22 = Fn_catWarpOut
      L21_22()
      while true do
        L21_22 = HUD
        L21_22 = L21_22.faderStability
        L21_22 = L21_22(L21_22)
        if not L21_22 then
          L21_22 = wait
          L21_22()
        end
      end
      L21_22 = wait
      L21_22(15)
      L21_22 = Fn_userCtrlOn
      L21_22()
      _restart = false
    end
  end
  L18_19(L19_20, L20_21)
  L19_20(L20_21)
  L21_22 = _LOOKTO_RESET_DURATION
  L19_20(L20_21, L21_22, _LOOKTO_DISABLESTICK_DURATION)
  L19_20(L20_21)
  L21_22 = false
  L19_20(L20_21, L21_22)
  L19_20()
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L21_22 = "Node"
  L21_22 = L20_21(L21_22, "locator2_bungua")
  L19_20(L20_21, L21_22, L20_21(L21_22, "locator2_bungua"))
  L19_20(L20_21)
  L19_20(L20_21)
  L21_22 = true
  L19_20(L20_21, L21_22)
  L21_22 = true
  L19_20(L20_21, L21_22)
  L21_22 = true
  L19_20(L20_21, L21_22)
  L21_22 = true
  L19_20(L20_21, L21_22)
  L19_20()
  L21_22 = "locator2_cid"
  while true do
    L21_22 = _bungua_near
    if not L21_22 then
      L21_22 = _cid_near
      if L21_22 then
        L21_22 = Fn_isPlayerReyCheck
        L21_22 = L21_22(L19_20, 50)
        if L21_22 then
          break
        end
      end
    end
    L21_22 = waitSeconds
    L21_22(0.1)
  end
  L21_22 = Fn_naviKill
  L21_22()
  L21_22 = Fn_tutorialCaptionKill
  L21_22()
  L21_22 = Player
  L21_22 = L21_22.setStay
  L21_22(L21_22, true, false)
  L21_22 = Fn_userCtrlOff
  L21_22()
  L21_22 = HUD
  L21_22 = L21_22.info
  L21_22(L21_22, "ep02_info_11", false)
  L21_22 = Fn_setCatWarpCheckPoint
  L21_22("locator2_bungua_restart")
  L21_22 = Fn_pcSensorOff
  L21_22("pccubesensor2_wa_warp_07")
  L21_22 = Fn_pcSensorOn
  L21_22("pccubesensor2_bu_wa_warp")
  L21_22 = waitSeconds
  L21_22(1)
  L21_22 = Player
  L21_22 = L21_22.setStay
  L21_22(L21_22, false)
  L21_22 = Fn_userCtrlOn
  L21_22()
  if not L20_21 then
    L21_22 = Fn_captionViewWait
    L21_22("ep02_00141")
    L21_22 = Fn_missionView
    L21_22("ep02_00142")
    L21_22 = waitSeconds
    L21_22(_MARKER_WAIT_AFTER_MISSION_VIEW)
    L21_22 = Fn_pcSensorOn
    L21_22("pccubesensor2_wa_area")
    while true do
      L21_22 = _cid_near
      if L21_22 then
        L21_22 = Fn_isPlayerReyCheck
        L21_22 = L21_22(L19_20, 40)
        if L21_22 then
          L21_22 = Fn_pcSensorOff
          L21_22("pccubesensor2_wa_area")
          break
        end
      end
      L21_22 = waitSeconds
      L21_22(0.1)
    end
  end
  L21_22 = Fn_pcSensorOff
  L21_22("pccubesensor2_bungua")
  L21_22 = Fn_pcSensorOff
  L21_22("pccubesensor2_cid_near")
  L21_22 = Fn_pcSensorOn
  L21_22("pccubesensor2_cid")
  L21_22 = Player
  L21_22 = L21_22.setStay
  L21_22(L21_22, true, false)
  L21_22 = Fn_userCtrlOff
  L21_22()
  L21_22 = Fn_captionViewWait
  L21_22("ep02_00129")
  L21_22 = Fn_findNpcPuppet
  L21_22 = L21_22(_npc_cid)
  lookAtObject(L21_22, _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
  waitSeconds(1)
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_naviSet(L21_22)
  waitPhase()
  Fn_tutorialCaptionKill()
  Fn_naviKill()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_28, L1_29
end
function pc_sensor_all_off()
  Fn_pcSensorOff("pccubesensor2_bu_wa_warp")
  Fn_pcSensorOff("pccubesensor2_wa_warp_01")
  Fn_pcSensorOff("pccubesensor2_wa_warp_02")
  Fn_pcSensorOff("pccubesensor2_wa_warp_03")
  Fn_pcSensorOff("pccubesensor2_wa_warp_04")
  Fn_pcSensorOff("pccubesensor2_wa_warp_05")
  Fn_pcSensorOff("pccubesensor2_wa_warp_06")
  Fn_pcSensorOff("pccubesensor2_wa_warp_07")
  Fn_pcSensorOff("pccubesensor2_wa_tut_01")
  Fn_pcSensorOff("pccubesensor2_wa_tut_02")
  Fn_pcSensorOff("pccubesensor2_wa_tut_03_01")
  Fn_pcSensorOff("pccubesensor2_wa_tut_03_02")
  Fn_pcSensorOff("pccubesensor2_wa_tut_03_03")
  Fn_pcSensorOff("pccubesensor2_wa_tut_03_04")
  Fn_pcSensorOff("pccubesensor2_wa_tut_04")
  Fn_pcSensorOff("pccubesensor2_wa_tut_05")
  Fn_pcSensorOff("pccubesensor2_wa_tut_06")
  Fn_pcSensorOff("pccubesensor2_fall")
  Fn_pcSensorOff("pccubesensor2_bungua")
  Fn_pcSensorOff("pccubesensor2_cid_near")
  Fn_pcSensorOff("pccubesensor2_cid")
end
function pccubesensor2_warp_OnLeave(A0_30)
  local L1_31
  L1_31 = _restart
  if L1_31 then
    return
  end
  _restart = true
  L1_31 = {}
  L1_31.pccubesensor2_bu_wa_warp = {
    aim = "locator2_wa_tut_00",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_01 = {
    aim = "locator2_wa_tut_01",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_02 = {
    aim = "locator2_wa_tut_02",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_03 = {
    aim = "locator2_wa_tut_03_01",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_04 = {
    aim = "locator2_wa_tut_04",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_05 = {
    aim = "locator2_wa_tut_05",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_06 = {
    aim = "locator2_wa_tut_06",
    opt = Player.kReset_Standing
  }
  L1_31.pccubesensor2_wa_warp_07 = {
    aim = "locator2_bungua",
    opt = Player.kReset_Standing
  }
  if Fn_getCatWarpCheckPoint() == "locator2_bungua_restart" then
    L1_31.pccubesensor2_bu_wa_warp.aim = "locator2_cid"
    L1_31.pccubesensor2_bu_wa_warp.opt = Player.kReset_Standing
  end
  invokeTask(function()
    local L0_32, L1_33, L2_34, L3_35
    L0_32 = Fn_userCtrlOff
    L0_32()
    L0_32 = Fn_catWarpIn
    L0_32()
    L0_32 = A0_30
    L1_33 = L0_32
    L0_32 = L0_32.getName
    L0_32 = L0_32(L1_33)
    L1_33 = Fn_getCatWarpCheckPoint
    L1_33 = L1_33()
    L2_34 = L1_31[L0_32]
    if L2_34 ~= nil then
      L2_34 = L1_31[L0_32]
      L2_34 = L2_34.opt
      L3_35 = L1_31[L0_32]
      L3_35 = L3_35.aim
      Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
      Fn_resetPcPos(L1_33, L2_34)
      lookAtObject(L3_35, _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
    end
    L2_34 = Fn_catWarpOut
    L2_34()
    while true do
      L2_34 = HUD
      L3_35 = L2_34
      L2_34 = L2_34.faderStability
      L2_34 = L2_34(L3_35)
      if not L2_34 then
        L2_34 = wait
        L2_34()
      end
    end
    L2_34 = wait
    L3_35 = 15
    L2_34(L3_35)
    L2_34 = Fn_userCtrlOn
    L2_34()
    _restart = false
  end)
end
function setup_debri()
  local L0_36, L1_37, L2_38, L3_39
  L0_36 = {}
  L1_37 = {}
  L1_37.rand = 0.5
  L1_37.sign = 0.5
  L1_37.max_a = 0.5
  L1_37.min_a = 0.2
  L1_37.max_t = 10
  L1_37.min_t = 5
  L0_36.tx = L1_37
  L1_37 = {}
  L1_37.rand = 0.5
  L1_37.sign = 0.5
  L1_37.max_a = 0.2
  L1_37.min_a = 0
  L1_37.max_t = 10
  L1_37.min_t = 5
  L0_36.ty = L1_37
  L1_37 = {}
  L1_37.rand = 0.5
  L1_37.sign = 0.5
  L1_37.max_a = 1
  L1_37.min_a = 0.5
  L1_37.max_t = 20
  L1_37.min_t = 10
  L0_36.tz = L1_37
  L1_37 = 1
  while true do
    L2_38 = findGameObject2
    L3_39 = "GimmickBg"
    L2_38 = L2_38(L3_39, string.format("bg2_rock_%02d", L1_37))
    if L2_38 ~= nil then
      L3_39 = findGameObject2
      L3_39 = L3_39("Node", string.format("bg2_rock_gem_%02d", L1_37))
      if L3_39 ~= nil then
        L2_38:appendChild(L3_39)
      end
      L2_38:setFloaterParams(L0_36)
    else
      break
    end
    L1_37 = L1_37 + 1
  end
end
function tutorial_gem()
  local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47
  for L3_43, L4_44 in L0_40(L1_41) do
    L6_46 = L4_44
    L5_45 = L4_44.kill
    L5_45(L6_46)
  end
  _gem_tbl = L0_40
  L4_44 = "locator2_tut_gem_04"
  for L4_44, L5_45 in L1_41(L2_42) do
    L6_46 = findGameObject2
    L7_47 = "Node"
    L6_46 = L6_46(L7_47, L5_45)
    if L6_46 ~= nil then
      L7_47 = createGameObject2
      L7_47 = L7_47("Gem")
      L7_47:setGemModelNo(_GEM.ENERGY)
      L7_47:try_init()
      L7_47:setVisibleBlockHalfSize(150)
      L7_47:waitForReadyAsync(function()
        L7_47:try_start()
      end)
      L6_46:appendChild(L7_47)
      _gem_tbl[L4_44] = L7_47
    else
    end
  end
end
function setNpcMotion()
  local L0_48, L1_49, L2_50, L3_51
  L0_48 = {}
  L0_48.isRepeat = true
  L0_48.isRandom = true
  L1_49 = npcPlaySyncMotion
  L2_50 = _npc_cid
  L3_51 = Fn_findNpcPuppet
  L3_51 = L3_51("magichand01")
  L1_49(L2_50, L3_51, "loc_r_hand", "magichand_00")
  L1_49 = {
    L2_50,
    L3_51,
    {
      motion = "talk_cid_00",
      se = ""
    },
    {
      motion = "talk_laugh_00",
      se = "w06_002"
    }
  }
  L2_50 = {}
  L2_50.motion = "stay_01"
  L2_50.se = ""
  L3_51 = {}
  L3_51.motion = "talk_cid_00"
  L3_51.se = ""
  L2_50 = playMotionWithSE
  L3_51 = _npc_gal01
  L2_50(L3_51, L1_49, L0_48, true)
  L2_50 = {
    L3_51,
    {
      motion = "talk_cid_01",
      se = "w07_001"
    },
    {
      motion = "talk_cid_01",
      se = "w07_002"
    },
    {
      motion = "talk_laugh_01",
      se = "w07_003"
    }
  }
  L3_51 = {}
  L3_51.motion = "stay_02"
  L3_51.se = ""
  L3_51 = playMotionWithSE
  L3_51(_npc_gal02, L2_50, L0_48, true)
  L3_51 = {
    {motion = "stay_03", se = ""},
    {
      motion = "talk_cid_02",
      se = ""
    },
    {
      motion = "talk_cid_02",
      se = "w08_001"
    },
    {
      motion = "talk_laugh_02",
      se = ""
    }
  }
  playMotionWithSE(_npc_gal03, L3_51, L0_48, true)
end
function playMotionWithSE(A0_52, A1_53, A2_54, A3_55)
  local L4_56, L5_57
  L4_56 = Fn_findNpc
  L5_57 = A0_52
  L4_56 = L4_56(L5_57)
  L5_57 = Fn_findNpcPuppet
  L5_57 = L5_57(A0_52)
  if L4_56 ~= nil then
    invokeTask(function()
      repeat
        if A1_53[RandI(#A1_53)].motion ~= nil or A1_53[RandI(#A1_53)].motion ~= "" then
          L4_56:playMotion(A1_53[RandI(#A1_53)].motion, opt)
        end
        if A1_53[RandI(#A1_53)].se ~= nil or A1_53[RandI(#A1_53)].se ~= "" then
          Sound:playSE(A1_53[RandI(#A1_53)].se, 1, "", L5_57)
        end
        while not L4_56:isMotionEnd() do
          wait()
        end
      until not A3_55
    end)
  end
end
function pccubesensor2_fall_OnEnter(A0_58)
  local L1_59
  _guide_type = "gyro_ep02_01"
end
function pccubesensor2_fall_OnLeave(A0_60)
  local L1_61
  _guide_type = "move_ep02_01"
end
function pccubesensor2_bungua_OnEnter(A0_62)
  local L1_63
  _bungua_near = true
end
function pccubesensor2_cid_near_OnEnter(A0_64)
  local L1_65
  _cid_near = true
end
function pccubesensor2_cid_near_OnLeave(A0_66)
  local L1_67
  _cid_near = false
end
function pccubesensor2_wa_area_OnEnter(A0_68)
  if not _wa_area_visit then
    _wa_area_visit = true
  else
    invokeTask(function()
      Fn_captionView("ep02_00159")
    end)
  end
end
function pccubesensor2_wa_area_OnLeave(A0_69)
  local L1_70
end
