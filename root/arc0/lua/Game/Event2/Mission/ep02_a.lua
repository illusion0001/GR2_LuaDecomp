dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
dofile("/Game/Misc/pdemo.lua")
_npc_sis = "npcgen2_sis_01"
_npc_gwana = "npcgen2_gwn_01"
_npc_misai = "npcgen2_miz_01"
_npc_man01 = "npcgen2_man_01"
_npc_chi01 = "npcgen2_chi11_01"
_npc_chi02 = "npcgen2_chi12_01"
_kaiwa_cecie = false
_kaiwa_gwana = false
_kaiwa_misai = false
_pdemo = nil
_next_phase = false
_restart = false
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_setCatWarp
  L0_0(false)
  L0_0 = {
    {
      name = _npc_sis,
      type = "sis01",
      node = "locator2_sis_01"
    },
    {
      name = _npc_gwana,
      type = "man34",
      node = "locator2_gwn_01"
    },
    {
      name = _npc_misai,
      type = "miz01",
      node = "locator2_miz_01"
    },
    {
      name = _npc_man01,
      type = "man36",
      node = "locator2_man_01"
    }
  }
  Fn_setupNpc(L0_0)
  Fn_setKaiwaDemo(Fn_findNpcPuppet(_npc_sis), "ep02_00020k", function()
    local L0_1, L1_2
    _kaiwa_cecie = true
  end, true, nil, nil, nil, "ep02_00133")
  Fn_setKaiwaDemo(Fn_findNpcPuppet(_npc_gwana), "ep02_00030k", function()
    local L0_3, L1_4
    _kaiwa_gwana = true
  end, true, nil, nil, nil, "ep02_00134")
  Fn_setKaiwaDemo(Fn_findNpcPuppet(_npc_misai), "ep02_00040k", function()
    local L0_5, L1_6
    _kaiwa_misai = true
  end, true, nil, nil, nil, "ep02_00135")
  Fn_disableKaiwaDemo(_npc_sis)
  Fn_disableKaiwaDemo(_npc_gwana)
  Fn_disableKaiwaDemo(_npc_misai)
  Fn_pcSensorOff("pccubesensor2_warp_02")
  Fn_pcSensorOff("pccubesensor2_warp_03")
  Fn_pcSensorOff("pcspheresensor2_warp_01")
  Fn_pcSensorOff("pcspheresensor2_warp_02")
  Fn_pcSensorOff("pcspheresensor2_warp_03")
  Fn_pcSensorOff("pccubesensor2_miz_01")
  Fn_pcSensorOff("pccubesensor2_miz_02")
  _pdemo = PDemo.create("ep02_a_c01", Fn_findAreaHandle("bu_a_09"), {camera = true, scene_param = false})
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26
  L0_7 = setNpcMotion
  L0_7()
  L0_7 = Fn_setKittenAndCatActive
  L1_8 = false
  L0_7(L1_8)
  L0_7 = print
  L1_8 = "pdemo \230\186\150\229\130\153\233\150\139\229\167\139"
  L0_7(L1_8)
  while true do
    L0_7 = _pdemo
    L1_8 = L0_7
    L0_7 = L0_7.isLoading
    L0_7 = L0_7(L1_8)
    if L0_7 == false then
      L0_7 = wait
      L0_7()
    end
  end
  L0_7 = print
  L1_8 = "pdemo \230\186\150\229\130\153\231\181\130\228\186\134"
  L0_7(L1_8)
  L0_7 = _pdemo
  L1_8 = L0_7
  L0_7 = L0_7.play
  L0_7(L1_8)
  L0_7 = Fn_missionStart
  L1_8 = pdemoSetupDone
  L0_7(L1_8)
  L0_7 = Fn_setCatActive
  L1_8 = true
  L0_7(L1_8)
  L0_7 = waitSeconds
  L1_8 = 0.5
  L0_7(L1_8)
  L0_7 = Sound
  L1_8 = L0_7
  L0_7 = L0_7.playSE
  L2_9 = "kit021b"
  L3_10 = 1
  L0_7(L1_8, L2_9, L3_10)
  repeat
    L0_7 = wait
    L0_7()
    L0_7 = _pdemo
    L1_8 = L0_7
    L0_7 = L0_7.isEnd
    L0_7 = L0_7(L1_8)
  until L0_7
  L0_7 = Fn_kaiwaDemoView
  L1_8 = "ep02_00010k"
  L0_7(L1_8)
  L0_7 = _pdemo
  L1_8 = L0_7
  L0_7 = L0_7.stop
  L2_9 = 0
  L0_7(L1_8, L2_9)
  L0_7 = _pdemo
  L1_8 = L0_7
  L0_7 = L0_7.try_term
  L0_7(L1_8)
  L0_7 = Fn_setKittenActive
  L1_8 = true
  L0_7(L1_8)
  L0_7 = Fn_userCtrlOff
  L0_7()
  L0_7 = {}
  L0_7.r_stick = false
  L0_7.l_stick = true
  L0_7.v_infinite = true
  L0_7.g_infinite = true
  L0_7.s_infinite = false
  L1_8 = {
    L2_9,
    L3_10,
    L4_11,
    L5_12,
    L6_13,
    L7_14,
    L8_15,
    L9_16
  }
  L2_9 = Player
  L2_9 = L2_9.kAbility_Walk
  L3_10 = Player
  L3_10 = L3_10.kAbility_Run
  L4_11 = Player
  L4_11 = L4_11.kAbility_Dodge
  L5_12 = Player
  L5_12 = L5_12.kAbility_Jump
  L6_13 = Player
  L6_13 = L6_13.kAbility_KickCombo
  L7_14 = Player
  L7_14 = L7_14.kAbility_GravityShift
  L8_15 = Player
  L8_15 = L8_15.kAbility_GravityBoost
  L9_16 = Player
  L9_16 = L9_16.kAbility_GravityKick
  L2_9 = Fn_lockPlayerAbility
  L3_10 = L1_8
  L4_11 = L0_7
  L2_9(L3_10, L4_11)
  L2_9 = false
  repeat
    L2_9 = true
    L3_10 = waitSeconds
    L4_11 = 1
    L3_10(L4_11)
    L3_10 = Fn_userCtrlOff
    L3_10()
    L3_10 = Fn_captionView
    L4_11 = "ep02_00143"
    L3_10(L4_11)
    L3_10 = waitSeconds
    L4_11 = 1
    L3_10(L4_11)
    L3_10 = {L4_11}
    L4_11 = Player
    L4_11 = L4_11.kAbility_GravityShift
    L4_11 = Fn_unLockPlayerAbility
    L5_12 = L3_10
    L6_13 = nil
    L4_11(L5_12, L6_13)
    L4_11 = Fn_tutorialCaption
    L5_12 = "gravity_ep02_01"
    L4_11(L5_12)
    L4_11 = Fn_missionView
    L5_12 = "ep02_00144"
    L4_11(L5_12)
    L4_11 = Fn_userCtrlOn
    L4_11()
    while true do
      L4_11 = isFloat
      L4_11 = L4_11()
      if not L4_11 then
        L4_11 = wait
        L4_11()
      end
    end
    L4_11 = {L5_12}
    L5_12 = Player
    L5_12 = L5_12.kAbility_GravityShift
    L5_12 = Fn_lockPlayerAbility
    L6_13 = L4_11
    L7_14 = L0_7
    L5_12(L6_13, L7_14)
    L5_12 = Fn_tutorialCaptionKill
    L5_12()
    L5_12 = Sound
    L6_13 = L5_12
    L5_12 = L5_12.playSE
    L7_14 = "success"
    L5_12(L6_13, L7_14)
    L5_12 = Fn_userCtrlOff
    L5_12()
    L5_12 = Fn_captionView
    L6_13 = "ep02_00145"
    L5_12(L6_13)
    L5_12 = waitSeconds
    L6_13 = 1
    L5_12(L6_13)
    L5_12 = Fn_tutorialCaption
    L6_13 = "gravitycancel_ep02_01"
    L5_12(L6_13)
    L5_12 = Fn_missionView
    L6_13 = "ep02_00146"
    L5_12(L6_13)
    L5_12 = Fn_userCtrlOn
    L5_12()
    while true do
      L5_12 = isNoGravityIdle
      L5_12 = L5_12()
      if not L5_12 then
        L5_12 = _restart
        if L5_12 then
          L2_9 = false
        end
        L5_12 = wait
        L5_12()
      end
    end
    L5_12 = Fn_tutorialCaptionKill
    L5_12()
    L5_12 = waitSeconds
    L6_13 = 1
    L5_12(L6_13)
  until L2_9
  L3_10 = Sound
  L4_11 = L3_10
  L3_10 = L3_10.playSE
  L5_12 = "success"
  L3_10(L4_11, L5_12)
  L3_10 = Fn_userCtrlOff
  L3_10()
  repeat
    L2_9 = true
    L3_10 = Fn_captionView
    L4_11 = "ep02_00147"
    L3_10(L4_11)
    L3_10 = waitSeconds
    L4_11 = 1
    L3_10(L4_11)
    L3_10 = {L4_11}
    L4_11 = Player
    L4_11 = L4_11.kAbility_GravityShift
    L4_11 = Fn_unLockPlayerAbility
    L5_12 = L3_10
    L6_13 = nil
    L4_11(L5_12, L6_13)
    L4_11 = Fn_tutorialCaption
    L5_12 = "gravity_ep02_01"
    L4_11(L5_12)
    L4_11 = Fn_missionView
    L5_12 = "ep02_00148"
    L4_11(L5_12)
    L4_11 = Fn_userCtrlOn
    L4_11()
    while true do
      L4_11 = isFloat
      L4_11 = L4_11()
      if not L4_11 then
        L4_11 = wait
        L4_11()
      end
    end
    L4_11 = {L5_12}
    L5_12 = Player
    L5_12 = L5_12.kAbility_GravityShift
    L5_12 = Fn_lockPlayerAbility
    L6_13 = L4_11
    L7_14 = L0_7
    L5_12(L6_13, L7_14)
    L5_12 = Fn_tutorialCaptionKill
    L5_12()
    L5_12 = Sound
    L6_13 = L5_12
    L5_12 = L5_12.playSE
    L7_14 = "success"
    L5_12(L6_13, L7_14)
    L5_12 = Fn_userCtrlOff
    L5_12()
    L5_12 = Fn_captionView
    L6_13 = "ep02_00149"
    L5_12(L6_13)
    L5_12 = waitSeconds
    L6_13 = 1
    L5_12(L6_13)
    L5_12 = Fn_userCtrlOn
    L5_12()
    L5_12 = Fn_tutorialCaption
    L6_13 = "gravitycancel_ep02_01"
    L5_12(L6_13)
    L5_12 = Fn_missionView
    L6_13 = "ep02_00150"
    L5_12(L6_13)
    while true do
      L5_12 = isNoGravityIdle
      L5_12 = L5_12()
      if not L5_12 then
        L5_12 = _restart
        if L5_12 then
          L2_9 = false
        end
        L5_12 = wait
        L5_12()
      end
    end
    L5_12 = Fn_tutorialCaptionKill
    L5_12()
    L5_12 = waitSeconds
    L6_13 = 1
    L5_12(L6_13)
  until L2_9
  L3_10 = Sound
  L4_11 = L3_10
  L3_10 = L3_10.playSE
  L5_12 = "success"
  L3_10(L4_11, L5_12)
  L3_10 = Fn_pcSensorOff
  L4_11 = "pccubesensor2_warp_00"
  L3_10(L4_11)
  L3_10 = {}
  L3_10.r_stick = true
  L3_10.l_stick = false
  L3_10.v_infinite = false
  L3_10.g_infinite = false
  L3_10.s_infinite = false
  L4_11 = {L5_12}
  L5_12 = Player
  L5_12 = L5_12.kAbility_GravityShift
  L5_12 = Fn_unLockPlayerAbility
  L6_13 = L4_11
  L7_14 = L3_10
  L5_12(L6_13, L7_14)
  L5_12 = waitSeconds
  L6_13 = 1
  L5_12(L6_13)
  L5_12 = Fn_captionView
  L6_13 = "ep02_00136"
  L5_12(L6_13)
  L5_12 = findGameObject2
  L6_13 = "Node"
  L7_14 = "locator2_tut_01"
  L5_12 = L5_12(L6_13, L7_14)
  L6_13 = invokeTask
  function L7_14()
    playerTurn(L5_12)
  end
  L6_13(L7_14)
  L6_13 = lookAtObject
  L7_14 = findGameObject2
  L8_15 = "Node"
  L9_16 = "locator2_target_01"
  L7_14 = L7_14(L8_15, L9_16)
  L8_15 = _LOOKTO_RESET_DURATION
  L9_16 = _LOOKTO_DISABLESTICK_DURATION
  L6_13(L7_14, L8_15, L9_16)
  L6_13 = Fn_setCatWarpCheckPoint
  L7_14 = "locator2_pc_00"
  L6_13(L7_14)
  L6_13 = Fn_userCtrlOn
  L6_13()
  L6_13 = {}
  L6_13.r_stick = false
  L6_13.l_stick = false
  L6_13.v_infinite = false
  L6_13.g_infinite = false
  L6_13.s_infinite = false
  L7_14 = Fn_lockPlayerAbility
  L8_15 = nil
  L9_16 = L6_13
  L7_14(L8_15, L9_16)
  L7_14 = Fn_missionView
  L8_15 = "ep02_00101"
  L7_14(L8_15)
  L7_14 = waitSeconds
  L8_15 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L7_14(L8_15)
  L7_14 = Fn_naviSet
  L8_15 = L5_12
  L7_14(L8_15)
  L7_14 = waitSeconds
  L8_15 = _CAPTION_WAIT_AFTER_MARKER
  L7_14(L8_15)
  L7_14 = Fn_captionViewWait
  L8_15 = "ep02_00100"
  L7_14(L8_15)
  L7_14 = Fn_tutorialCaption
  L8_15 = "gravity_ep02_01"
  L7_14(L8_15)
  L7_14 = findGameObject2
  L8_15 = "Node"
  L9_16 = "locator2_tut_01"
  L7_14 = L7_14(L8_15, L9_16)
  L8_15 = L7_14
  L7_14 = L7_14.getWorldPos
  L7_14 = L7_14(L8_15)
  repeat
    L8_15 = wait
    L8_15()
    L8_15 = isFloatNear
    L9_16 = L7_14
    L10_17 = 10
    L8_15 = L8_15(L9_16, L10_17)
  until L8_15
  L8_15 = Fn_tutorialCaptionKill
  L8_15()
  L8_15 = Fn_naviKill
  L8_15()
  L8_15 = Sound
  L9_16 = L8_15
  L8_15 = L8_15.playSE
  L10_17 = "success"
  L8_15(L9_16, L10_17)
  L8_15 = Fn_captionView
  L9_16 = "ep02_00137"
  L8_15(L9_16)
  L8_15 = Fn_pcSensorOff
  L9_16 = "pccubesensor2_warp_01"
  L8_15(L9_16)
  L8_15 = Fn_pcSensorOn
  L9_16 = "pcspheresensor2_warp_01"
  L8_15(L9_16)
  L8_15 = Fn_setCatWarpCheckPoint
  L9_16 = "locator2_tut_01"
  L8_15(L9_16)
  L8_15 = Player
  L9_16 = L8_15
  L8_15 = L8_15.setStay
  L10_17 = true
  L8_15(L9_16, L10_17)
  L8_15 = Fn_userCtrlOff
  L8_15()
  L8_15 = waitSeconds
  L9_16 = 1
  L8_15(L9_16)
  L8_15 = HUD
  L9_16 = L8_15
  L8_15 = L8_15.info
  L10_17 = "ep02_info_02"
  L11_18 = false
  L8_15(L9_16, L10_17, L11_18)
  L8_15 = lookAtObject
  L9_16 = findGameObject2
  L10_17 = "Node"
  L11_18 = "locator2_sis_target_01"
  L9_16 = L9_16(L10_17, L11_18)
  L10_17 = _LOOKTO_RESET_DURATION
  L11_18 = _LOOKTO_DISABLESTICK_DURATION
  L8_15(L9_16, L10_17, L11_18)
  L8_15 = Fn_captionView
  L9_16 = "ep02_00102"
  L8_15(L9_16)
  L8_15 = waitSeconds
  L9_16 = 1
  L8_15(L9_16)
  L8_15 = Fn_enableKaiwaDemo
  L9_16 = _npc_sis
  L8_15(L9_16)
  L8_15 = {}
  L8_15.r_stick = true
  L8_15.l_stick = true
  L8_15.v_infinite = false
  L8_15.g_infinite = false
  L8_15.s_infinite = false
  L9_16 = {
    L10_17,
    L11_18,
    L12_19,
    L13_20,
    L14_21,
    L15_22,
    L16_23
  }
  L10_17 = Player
  L10_17 = L10_17.kAbility_Walk
  L11_18 = Player
  L11_18 = L11_18.kAbility_Run
  L12_19 = Player
  L12_19 = L12_19.kAbility_Dodge
  L13_20 = Player
  L13_20 = L13_20.kAbility_Jump
  L14_21 = Player
  L14_21 = L14_21.kAbility_KickCombo
  L15_22 = Player
  L15_22 = L15_22.kAbility_GravityBoost
  L16_23 = Player
  L16_23 = L16_23.kAbility_GravityKick
  L10_17 = Fn_unLockPlayerAbility
  L11_18 = L9_16
  L12_19 = L8_15
  L10_17(L11_18, L12_19)
  L10_17 = Player
  L11_18 = L10_17
  L10_17 = L10_17.setStay
  L12_19 = false
  L10_17(L11_18, L12_19)
  L10_17 = Fn_userCtrlOn
  L10_17()
  L10_17 = Fn_missionView
  L11_18 = "ep02_00103"
  L10_17(L11_18)
  L10_17 = waitSeconds
  L11_18 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L10_17(L11_18)
  L10_17 = invokeTask
  function L11_18()
    waitSeconds(2)
    Fn_tutorialCaption("gravity_ep02_02")
  end
  L10_17(L11_18)
  L10_17 = Fn_naviSet
  L11_18 = Fn_findNpcPuppet
  L12_19 = _npc_sis
  L19_26 = L11_18(L12_19)
  L10_17(L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L11_18(L12_19))
  repeat
    L10_17 = wait
    L10_17()
    L10_17 = _kaiwa_cecie
  until L10_17
  L10_17 = Fn_naviKill
  L10_17()
  L10_17 = Fn_tutorialCaptionKill
  L10_17()
  L10_17 = Fn_pcSensorOff
  L11_18 = "pcspheresensor2_warp_01"
  L10_17(L11_18)
  L10_17 = Fn_setCatWarpCheckPoint
  L11_18 = "locator2_pc_01"
  L10_17(L11_18)
  L10_17 = Fn_pcSensorOn
  L11_18 = "pccubesensor2_warp_02"
  L10_17(L11_18)
  L10_17 = waitSeconds
  L11_18 = 1
  L10_17(L11_18)
  L10_17 = findGameObject2
  L11_18 = "Node"
  L12_19 = "locator2_tut_02"
  L10_17 = L10_17(L11_18, L12_19)
  L11_18 = invokeTask
  function L12_19()
    playerTurn(L10_17)
  end
  L11_18(L12_19)
  L11_18 = lookAtObject
  L12_19 = findGameObject2
  L13_20 = "Node"
  L14_21 = "locator2_target_02"
  L12_19 = L12_19(L13_20, L14_21)
  L13_20 = _LOOKTO_RESET_DURATION
  L14_21 = _LOOKTO_DISABLESTICK_DURATION
  L11_18(L12_19, L13_20, L14_21)
  L11_18 = Fn_missionView
  L12_19 = "ep02_00105"
  L11_18(L12_19)
  L11_18 = waitSeconds
  L12_19 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L11_18(L12_19)
  L11_18 = Fn_naviSet
  L12_19 = L10_17
  L11_18(L12_19)
  L11_18 = waitSeconds
  L12_19 = _CAPTION_WAIT_AFTER_MARKER
  L11_18(L12_19)
  L11_18 = Fn_tutorialCaption
  L12_19 = "gravity_ep02_01"
  L11_18(L12_19)
  L11_18 = invokeTask
  function L12_19()
    while not Player:isGravityControlMode() or Player:getAction() ~= Player.kAction_Float and Player:getAction() ~= Player.kAction_Jump do
      wait()
    end
    waitSeconds(2)
    Fn_tutorialCaptionKill()
    Fn_captionViewWait("ep02_00104")
    Fn_tutorialCaption("gravity_ep02_01")
  end
  L11_18 = L11_18(L12_19)
  L12_19 = findGameObject2
  L13_20 = "Node"
  L14_21 = "locator2_tut_02"
  L12_19 = L12_19(L13_20, L14_21)
  L13_20 = L12_19
  L12_19 = L12_19.getWorldPos
  L12_19 = L12_19(L13_20)
  repeat
    L13_20 = wait
    L13_20()
    L13_20 = isFloatNear
    L14_21 = L12_19
    L15_22 = 10
    L13_20 = L13_20(L14_21, L15_22)
  until L13_20
  if L11_18 ~= nil then
    L14_21 = L11_18
    L13_20 = L11_18.isRunning
    L13_20 = L13_20(L14_21)
    if L13_20 then
      L14_21 = L11_18
      L13_20 = L11_18.abort
      L13_20(L14_21)
    end
  end
  L11_18 = nil
  L13_20 = Player
  L14_21 = L13_20
  L13_20 = L13_20.setStay
  L15_22 = true
  L16_23 = false
  L13_20(L14_21, L15_22, L16_23)
  L13_20 = Fn_userCtrlOff
  L13_20()
  L13_20 = Fn_tutorialCaptionKill
  L13_20()
  L13_20 = Fn_naviKill
  L13_20()
  L13_20 = Sound
  L14_21 = L13_20
  L13_20 = L13_20.playSE
  L15_22 = "success"
  L13_20(L14_21, L15_22)
  L13_20 = Fn_pcSensorOff
  L14_21 = "pccubesensor2_warp_02"
  L13_20(L14_21)
  L13_20 = Fn_setCatWarpCheckPoint
  L14_21 = "locator2_tut_02"
  L13_20(L14_21)
  L13_20 = Player
  L14_21 = L13_20
  L13_20 = L13_20.setStay
  L15_22 = true
  L13_20(L14_21, L15_22)
  L13_20 = Fn_userCtrlOff
  L13_20()
  L13_20 = Fn_pcSensorOn
  L14_21 = "pcspheresensor2_warp_02"
  L13_20(L14_21)
  L13_20 = Fn_captionViewWait
  L14_21 = "ep02_00106"
  L13_20(L14_21)
  L13_20 = Fn_findNpcPuppet
  L14_21 = _npc_gwana
  L13_20 = L13_20(L14_21)
  L14_21 = false
  L15_22 = invokeTask
  function L16_23()
    repeat
      if Fn_isInSightTarget(L13_20, 1) then
        Fn_playMotionNpc(_npc_gwana, "wavehand_far_00", true, {isRepeat = false, animBlendDuration = 0.5})
        Fn_playMotionNpc(_npc_gwana, "stay_00", false, {isRepeat = true, animBlendDuration = 0.5})
      else
        Fn_playMotionNpc(_npc_gwana, "stay_00", false, {isRepeat = true, animBlendDuration = 0.5})
      end
      wait()
    until L14_21
  end
  L15_22(L16_23)
  L15_22 = Sound
  L16_23 = L15_22
  L15_22 = L15_22.playSEHandle
  L17_24 = "gaw_901b"
  L18_25 = 1
  L19_26 = ""
  L15_22 = L15_22(L16_23, L17_24, L18_25, L19_26, L13_20)
  L16_23 = Sound
  L17_24 = L16_23
  L16_23 = L16_23.setAudibleRange
  L18_25 = L15_22
  L19_26 = 70
  L16_23(L17_24, L18_25, L19_26)
  L16_23 = Fn_captionViewWait
  L17_24 = "ep02_00130"
  L16_23(L17_24)
  L16_23 = Fn_captionViewWait
  L17_24 = "ep02_00131"
  L16_23(L17_24)
  L16_23 = Fn_missionView
  L17_24 = "ep02_00132"
  L16_23(L17_24)
  L16_23 = waitSeconds
  L17_24 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L16_23(L17_24)
  L16_23 = Sound
  L17_24 = L16_23
  L16_23 = L16_23.stopSEHandle
  L18_25 = L15_22
  L16_23(L17_24, L18_25)
  L16_23 = Fn_tutorialCaption
  L17_24 = "camera_ep02_01"
  L16_23(L17_24)
  repeat
    L16_23 = wait
    L16_23()
    L16_23 = Fn_isInSightTarget
    L17_24 = L13_20
    L18_25 = 0.5
    L16_23 = L16_23(L17_24, L18_25)
  until L16_23
  L14_21 = true
  L16_23 = Fn_lookAtObject
  L17_24 = L13_20
  L16_23 = L16_23(L17_24)
  repeat
    L17_24 = wait
    L17_24()
    L17_24 = Fn_isInSightTarget
    L18_25 = L13_20
    L19_26 = 0.3
    L17_24 = L17_24(L18_25, L19_26)
  until L17_24
  if L16_23 ~= nil then
    L18_25 = L16_23
    L17_24 = L16_23.isRunning
    L17_24 = L17_24(L18_25)
    if L17_24 then
      L18_25 = L16_23
      L17_24 = L16_23.abort
      L17_24(L18_25)
    end
  end
  L16_23 = nil
  L17_24 = Fn_tutorialCaptionKill
  L17_24()
  L17_24 = Fn_captionView
  L18_25 = "ep02_00107"
  L17_24(L18_25)
  L17_24 = waitSeconds
  L18_25 = 1
  L17_24(L18_25)
  L17_24 = Fn_enableKaiwaDemo
  L18_25 = _npc_gwana
  L17_24(L18_25)
  L17_24 = Player
  L18_25 = L17_24
  L17_24 = L17_24.setStay
  L19_26 = false
  L17_24(L18_25, L19_26)
  L17_24 = Fn_userCtrlOn
  L17_24()
  L17_24 = invokeTask
  function L18_25()
    waitSeconds(2)
    Fn_tutorialCaption("gravity_ep02_02")
  end
  L17_24(L18_25)
  L17_24 = Fn_missionView
  L18_25 = "ep02_00108"
  L17_24(L18_25)
  L17_24 = waitSeconds
  L18_25 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L17_24(L18_25)
  L17_24 = Fn_naviSet
  L18_25 = Fn_findNpcPuppet
  L19_26 = _npc_gwana
  L19_26 = L18_25(L19_26)
  L17_24(L18_25, L19_26, L18_25(L19_26))
  repeat
    L17_24 = wait
    L17_24()
    L17_24 = _kaiwa_gwana
  until L17_24
  L17_24 = Fn_naviKill
  L17_24()
  L17_24 = Fn_tutorialCaptionKill
  L17_24()
  L17_24 = Fn_pcSensorOff
  L18_25 = "pcspheresensor2_warp_02"
  L17_24(L18_25)
  L17_24 = Fn_setCatWarpCheckPoint
  L18_25 = "locator2_pc_02"
  L17_24(L18_25)
  L17_24 = Fn_pcSensorOn
  L18_25 = "pccubesensor2_warp_03"
  L17_24(L18_25)
  L17_24 = Fn_pcSensorOn
  L18_25 = "pccubesensor2_miz_01"
  L17_24(L18_25)
  L17_24 = Fn_pcSensorOn
  L18_25 = "pccubesensor2_miz_02"
  L17_24(L18_25)
  L17_24 = waitSeconds
  L18_25 = 1
  L17_24(L18_25)
  L17_24 = findGameObject2
  L18_25 = "Node"
  L19_26 = "locator2_tut_03"
  L17_24 = L17_24(L18_25, L19_26)
  L18_25 = invokeTask
  function L19_26()
    playerTurn(L17_24)
  end
  L18_25(L19_26)
  L18_25 = lookAtObject
  L19_26 = findGameObject2
  L19_26 = L19_26("Node", "locator2_target_03")
  L18_25(L19_26, _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
  L18_25 = Fn_captionViewWait
  L19_26 = "ep02_00109"
  L18_25(L19_26)
  L18_25 = Fn_missionView
  L19_26 = "ep02_00105"
  L18_25(L19_26)
  L18_25 = waitSeconds
  L19_26 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L18_25(L19_26)
  L18_25 = Fn_naviSet
  L19_26 = L17_24
  L18_25(L19_26)
  _next_phase = false
  L18_25 = false
  L19_26 = findGameObject2
  L19_26 = L19_26("Node", "locator2_tut_03")
  L19_26 = L19_26.getWorldPos
  L19_26 = L19_26(L19_26)
  while true do
    if isFloatNear(L19_26, 10) then
      Player:setStay(true)
      Fn_userCtrlOff()
      Sound:playSE("success")
      if Fn_get_distance(L19_26, Fn_getPcPosRot()) < 3 then
        Fn_captionViewWait("ep02_00138")
      elseif Fn_get_distance(L19_26, Fn_getPcPosRot()) < 5 then
        Fn_captionViewWait("ep02_00139")
      else
        Fn_captionViewWait("ep02_00140")
      end
      L18_25 = true
      break
    end
    if not _next_phase then
      wait()
    end
  end
  Fn_naviKill()
  if L18_25 then
    HUD:info("ep02_info_07", false)
  end
  Fn_pcSensorOff("pccubesensor2_miz_01")
  Fn_pcSensorOff("pccubesensor2_miz_02")
  Fn_pcSensorOff("pccubesensor2_warp_03")
  Fn_pcSensorOn("pcspheresensor2_warp_03")
  Fn_setCatWarpCheckPoint("locator2_tut_03")
  lookAtObject(findGameObject2("Node", "locator2_miz_target_01"), _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
  Fn_captionView("ep02_00110")
  waitSeconds(1)
  Fn_enableKaiwaDemo(_npc_misai)
  Player:setStay(false)
  Fn_userCtrlOn()
  if Player:isGravityControlMode() then
    invokeTask(function()
      waitSeconds(2)
      Fn_tutorialCaption("gravitycancel_ep02_01")
      repeat
        while Player:isGravityControlMode() ~= false or Player:getAction() ~= Player.kAction_Idle do
          wait()
        end
      until _kaiwa_misai
      Fn_tutorialCaptionKill()
    end)
  end
  Fn_missionView("ep02_00111")
  waitSeconds(_MARKER_WAIT_AFTER_MISSION_VIEW)
  Fn_naviSet(Fn_findNpcPuppet(_npc_misai))
  repeat
    wait()
  until _kaiwa_misai
  Fn_naviKill()
  Fn_tutorialCaptionKill()
  Fn_pcSensorOff("pcspheresensor2_warp_03")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_27, L1_28
end
function isFloatNear(A0_29, A1_30)
  if A1_30 > Fn_get_distance(A0_29, Fn_getPcPosRot()) and isFloat() then
    return true
  end
  return false
end
function isFloat()
  if Player:isGravityControlMode() and Player:getAction() == Player.kAction_Float then
    return true
  else
    return false
  end
end
function isNoGravityIdle()
  if not Player:isGravityControlMode() and Player:getAction() == Player.kAction_Idle then
    return true
  else
    return false
  end
end
function pccubesensor2_warp_OnLeave(A0_31)
  local L1_32
  L1_32 = _restart
  if L1_32 then
    return
  end
  _restart = true
  L1_32 = {}
  L1_32.pccubesensor2_warp_00 = {
    aim = "locator2_aim_00",
    opt = Player.kReset_Standing
  }
  L1_32.pccubesensor2_warp_01 = {
    aim = "locator2_tut_01",
    opt = Player.kReset_Standing
  }
  L1_32.pcspheresensor2_warp_01 = {
    aim = "locator2_sis_target_01",
    opt = Player.kReset_Floating
  }
  L1_32.pccubesensor2_warp_02 = {
    aim = "locator2_tut_02",
    opt = Player.kReset_Standing
  }
  L1_32.pcspheresensor2_warp_02 = {
    aim = "locator2_pc_02",
    opt = Player.kReset_Floating
  }
  L1_32.pccubesensor2_warp_03 = {
    aim = "locator2_tut_03",
    opt = Player.kReset_Standing
  }
  L1_32.pcspheresensor2_warp_03 = {
    aim = "locator2_miz_target_01",
    opt = Player.kReset_Floating
  }
  invokeTask(function()
    local L0_33, L1_34, L2_35, L3_36
    L0_33 = Fn_userCtrlOff
    L0_33()
    L0_33 = Fn_catWarpIn
    L0_33()
    L0_33 = A0_31
    L1_34 = L0_33
    L0_33 = L0_33.getName
    L0_33 = L0_33(L1_34)
    L1_34 = Fn_getCatWarpCheckPoint
    L1_34 = L1_34()
    L2_35 = L1_32[L0_33]
    if L2_35 ~= nil then
      L2_35 = L1_32[L0_33]
      L2_35 = L2_35.opt
      L3_36 = L1_32[L0_33]
      L3_36 = L3_36.aim
      Fn_resetPcPos(L1_34, L2_35)
      lookAtObject(L3_36, _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
    end
    L2_35 = Fn_catWarpOut
    L2_35()
    while true do
      L2_35 = HUD
      L3_36 = L2_35
      L2_35 = L2_35.faderStability
      L2_35 = L2_35(L3_36)
      if not L2_35 then
        L2_35 = wait
        L2_35()
      end
    end
    L2_35 = wait
    L3_36 = 15
    L2_35(L3_36)
    L2_35 = Fn_userCtrlOn
    L2_35()
    _restart = false
  end)
end
function setNpcMotion()
  local L0_37, L1_38, L2_39, L3_40, L4_41
  L0_37 = {}
  L0_37.isRepeat = true
  L0_37.isRandom = true
  L0_37.animBlendDuration = 1
  L1_38 = {L2_39, L3_40}
  L2_39 = "stay"
  L3_40 = "stay_01"
  L2_39 = Fn_playMotionNpc
  L3_40 = _npc_sis
  L4_41 = L1_38
  L2_39(L3_40, L4_41, false, L0_37)
  L2_39 = {L3_40}
  L3_40 = "stay_00"
  L3_40 = Fn_playMotionNpc
  L4_41 = _npc_gwana
  L3_40(L4_41, L2_39, false, L0_37)
  L3_40 = {
    L4_41,
    "stay_01",
    "stay_02",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_04",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02"
  }
  L4_41 = "stay_00"
  L4_41 = Fn_playMotionNpc
  L4_41(_npc_misai, L3_40, false, L0_37)
  L4_41 = {
    "stay_00",
    "stay_01",
    "stay_02",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_04",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02"
  }
  Fn_playMotionNpc(_npc_man01, L4_41, false, L0_37)
end
