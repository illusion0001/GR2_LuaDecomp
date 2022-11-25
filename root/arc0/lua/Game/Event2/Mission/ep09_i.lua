import("GlobalGem")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/pdemo.lua")
gem = {}
gem_max = 40
_mnavi_hdl = {}
_obj_navi_hdl = {}
gem_count_set_01 = 0
gem_count_set_02 = 0
gem_count_set_03 = 0
gem_count_set_04 = 0
gem_count_set_05 = 0
gem_count_set_06 = 0
gem_count_set_07 = 0
gem_count_set_08 = 0
_battle_clearCountNum_wave1 = 10
_battle_clearCountNum_wave1_1 = 5
_battle_clearCountNum_wave2 = 10
_battle_clearCountNum_wave2_1 = 5
_battle_clearCountNum_wave3 = 5
_battle_clearCountNum_wave4 = 15
navi_islet_01 = false
navi_islet_02 = false
navi_islet_03 = false
navi_islet_04 = false
navi_islet_05 = false
tut_phase = 0
islet_02_01_clear = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  for L3_3 = 1, gem_max do
    gem[L3_3] = findGameObject2("Gem", string.format("gem2_ep09_i_m_%02d", L3_3))
    gem[L3_3]:setActive(false)
  end
  _sdemo_cut01 = L0_0
  L3_3 = "az2_a_20"
  L3_3 = {}
  L3_3.camera = true
  L3_3.scene_param = false
  _polydemo = L0_0
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L33_37, L34_38, L35_39, L36_40, L37_41, L38_42, L39_43, L40_44, L41_45
  L0_4 = GlobalGem
  L1_5 = L0_4
  L0_4 = L0_4.SetPreciousGemAddCallback
  L2_6 = "GetPreciousGemCallback"
  L0_4(L1_5, L2_6)
  L0_4 = Fn_setCatWarpCheckPoint
  L1_5 = "locator2_restart_pos_ep09_i"
  L0_4(L1_5)
  L0_4 = findGameObject2
  L1_5 = "Node"
  L2_6 = "locator2_litho_01"
  L0_4 = L0_4(L1_5, L2_6)
  L1_5 = invokeTask
  function L2_6()
    local L0_46
    L0_46 = false
    while true do
      if L0_46 == false and Fn_getDistanceToPlayer(L0_4) > 30 then
        L0_46 = true
        Fn_naviSet(L0_4)
      elseif L0_46 == true and Fn_getDistanceToPlayer(L0_4) <= 10 then
        L0_46 = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L1_5 = L1_5(L2_6)
  litho_task = L1_5
  L1_5 = Fn_missionStart
  L1_5()
  L1_5 = Fn_userCtrlOn
  L1_5()
  L1_5 = Fn_captionView
  L2_6 = "ep09_08000"
  L1_5(L2_6)
  L1_5 = invokeTask
  function L2_6()
    waitPhase()
    Fn_sendEventComSb("lithographStart")
  end
  L1_5 = L1_5(L2_6)
  repeat
    L2_6 = wait
    L2_6()
    L2_6 = Fn_sendEventComSb
    L3_7 = "isLithographStart"
    L2_6 = L2_6(L3_7)
  until L2_6
  L2_6 = Fn_userCtrlAllOff
  L2_6()
  L2_6 = Fn_pcSensorOff
  L3_7 = "pccubesensor2_attribute"
  L2_6(L3_7)
  L3_7 = L1_5
  L2_6 = L1_5.abort
  L2_6(L3_7)
  L2_6 = litho_task
  L3_7 = L2_6
  L2_6 = L2_6.abort
  L2_6(L3_7)
  L2_6 = Fn_sendEventComSb
  L3_7 = "setFirstHalfProcessEnd"
  L2_6(L3_7)
  repeat
    L2_6 = wait
    L2_6()
    L2_6 = Fn_sendEventComSb
    L3_7 = "isFirstHalfProcessEnd"
    L2_6 = L2_6(L3_7)
  until L2_6
  L2_6 = {L3_7}
  L3_7 = Player
  L3_7 = L3_7.kAbility_FirstPersonView
  L3_7 = {}
  L4_8 = Fn_lockPlayerAbility
  L5_9 = L2_6
  L6_10 = L3_7
  L4_8(L5_9, L6_10)
  L4_8 = Fn_userCtrlAllOff
  L4_8()
  L4_8 = Fn_blackout
  L5_9 = 0
  L4_8(L5_9)
  while true do
    L4_8 = _polydemo
    L5_9 = L4_8
    L4_8 = L4_8.isLoading
    L4_8 = L4_8(L5_9)
    if L4_8 == false then
      L4_8 = wait
      L4_8()
    end
  end
  L4_8 = Fn_getPlayer
  L4_8 = L4_8()
  L6_10 = L4_8
  L5_9 = L4_8.setCollidable
  L7_11 = false
  L5_9(L6_10, L7_11)
  L6_10 = L4_8
  L5_9 = L4_8.setVisible
  L7_11 = false
  L5_9(L6_10, L7_11)
  L5_9 = Fn_setCatActive
  L6_10 = false
  L5_9(L6_10)
  L5_9 = Fn_sendEventComSb
  L6_10 = "requestAttributeHandle"
  L5_9 = L5_9(L6_10)
  if L5_9 ~= nil then
    L7_11 = L5_9
    L6_10 = L5_9.kill
    L6_10(L7_11)
    L5_9 = nil
  end
  L6_10 = Fn_sendEventComSb
  L7_11 = "requestAttributeEffect"
  L6_10 = L6_10(L7_11)
  if L6_10 ~= nil then
    L8_12 = L6_10
    L7_11 = L6_10.kill
    L7_11(L8_12)
    L6_10 = nil
  end
  L7_11 = _polydemo
  L8_12 = L7_11
  L7_11 = L7_11.play
  L7_11(L8_12)
  L7_11 = Fn_fadein
  L8_12 = 1
  L9_13 = false
  L7_11(L8_12, L9_13)
  L7_11 = Player
  L8_12 = L7_11
  L7_11 = L7_11.setAttrTune
  L9_13 = Player
  L9_13 = L9_13.kAttrTune_Mars
  L10_14 = true
  L7_11(L8_12, L9_13, L10_14)
  L7_11 = Fn_resetPcPos
  L8_12 = "locator2_pc_sdemo_end_pos"
  L9_13 = Player
  L9_13 = L9_13.kReset_Standing
  L7_11(L8_12, L9_13)
  L7_11 = Fn_getPlayerWorldPos
  L7_11 = L7_11()
  L8_12 = Vector
  L9_13 = 0
  L10_14 = 1
  L8_12 = L8_12(L9_13, L10_14, L11_15)
  L7_11 = L7_11 + L8_12
  L8_12 = Fn_getPlayerWorldPos
  L8_12 = L8_12()
  L9_13 = Vector
  L10_14 = 0
  L9_13 = L9_13(L10_14, L11_15, L12_16)
  L8_12 = L8_12 + L9_13
  while true do
    L9_13 = _polydemo
    L10_14 = L9_13
    L9_13 = L9_13.getCurrentFrame
    L9_13 = L9_13(L10_14)
    if L9_13 < 245 then
      L9_13 = _polydemo
      L10_14 = L9_13
      L9_13 = L9_13.getCurrentFrame
      L9_13 = L9_13(L10_14)
      if L9_13 == 160 then
        L9_13 = Sound
        L10_14 = L9_13
        L9_13 = L9_13.playSE
        L9_13(L10_14, L11_15)
      else
        L9_13 = _polydemo
        L10_14 = L9_13
        L9_13 = L9_13.getCurrentFrame
        L9_13 = L9_13(L10_14)
        if L9_13 == 105 then
          L9_13 = Sound
          L10_14 = L9_13
          L9_13 = L9_13.playSE
          L9_13(L10_14, L11_15)
        end
      end
      L9_13 = wait
      L9_13()
    end
  end
  L9_13 = Fn_blackout
  L10_14 = 0.5
  L9_13(L10_14)
  L10_14 = L4_8
  L9_13 = L4_8.setCollidable
  L9_13(L10_14, L11_15)
  L10_14 = L4_8
  L9_13 = L4_8.setVisible
  L9_13(L10_14, L11_15)
  L4_8 = nil
  L9_13 = Fn_setCatActive
  L10_14 = true
  L9_13(L10_14)
  L9_13 = GameDatabase
  L10_14 = L9_13
  L9_13 = L9_13.set
  L9_13(L10_14, L11_15, L12_16)
  L9_13 = _polydemo
  L10_14 = L9_13
  L9_13 = L9_13.try_term
  L9_13(L10_14)
  L9_13 = Fn_fadein
  L9_13()
  L9_13 = waitSeconds
  L10_14 = 0.25
  L9_13(L10_14)
  L9_13 = Fn_kaiwaDemoView
  L10_14 = "ep09_00140k"
  L9_13(L10_14)
  L9_13 = Fn_unLockPlayerAbility
  L10_14 = L2_6
  L9_13(L10_14, L11_15)
  L9_13 = GameDatabase
  L10_14 = L9_13
  L9_13 = L9_13.get
  L9_13 = L9_13(L10_14, L11_15)
  if L9_13 ~= 2 then
    L9_13 = HUD
    L10_14 = L9_13
    L9_13 = L9_13.info
    L9_13(L10_14, L11_15, L12_16)
  else
    L9_13 = GameDatabase
    L10_14 = L9_13
    L9_13 = L9_13.get
    L9_13 = L9_13(L10_14, L11_15)
    if L9_13 == 2 then
      L9_13 = HUD
      L10_14 = L9_13
      L9_13 = L9_13.info
      L9_13(L10_14, L11_15, L12_16)
    end
  end
  L9_13 = wait
  L9_13()
  L9_13 = {
    L10_14,
    L11_15,
    L12_16,
    L13_17,
    L14_18,
    L15_19,
    L16_20,
    L17_21,
    L18_22,
    L19_23,
    L20_24,
    L21_25
  }
  L10_14 = Player
  L10_14 = L10_14.kAbility_AttrTuneSwitch
  L14_18 = Player
  L14_18 = L14_18.kAbility_GravityRevert
  L15_19 = Player
  L15_19 = L15_19.kAbility_GravityBoost
  L21_25 = Player
  L21_25 = L21_25.kAbility_RocketJump
  L10_14 = {}
  L10_14.rocket_jump_interlock = false
  L11_15(L12_16, L13_17)
  L11_15()
  for L14_18 = 1, 5 do
    L15_19 = gem
    L15_19 = L15_19[L14_18]
    L15_19 = L15_19.setActive
    L15_19(L16_20, L17_21)
    L15_19 = gem
    L15_19 = L15_19[L14_18]
    L15_19 = L15_19.setVisibleBlockHalfSize
    L15_19(L16_20, L17_21)
  end
  L12_16(L13_17)
  L12_16(L13_17)
  L12_16(L13_17)
  L12_16(L13_17)
  L12_16(L13_17)
  L12_16()
  L12_16(L13_17)
  L12_16(L13_17)
  L14_18 = HUD
  L14_18 = L14_18.kCount99_99IconType_Stone
  L12_16(L13_17, L14_18)
  L14_18 = "ep09_09014"
  L12_16(L13_17, L14_18)
  L14_18 = _battle_clearCountNum_wave1
  L12_16(L13_17, L14_18)
  L14_18 = 0
  L12_16(L13_17, L14_18)
  L14_18 = true
  L12_16(L13_17, L14_18)
  L14_18 = true
  L12_16(L13_17, L14_18)
  L14_18 = 9999
  L12_16(L13_17, L14_18)
  L12_16(L13_17)
  tut_phase = 1
  L12_16(L13_17)
  navi_islet_01 = true
  L14_18 = "Node"
  L15_19 = "locator2_islet_01_01"
  L41_45 = L13_17(L14_18, L15_19)
  L12_16(L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28, L25_29, L26_30, L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L33_37, L34_38, L35_39, L36_40, L37_41, L38_42, L39_43, L40_44, L41_45, L13_17(L14_18, L15_19))
  L14_18 = invokeTask
  function L15_19()
    repeat
      L12_16 = L12_16 + 1
      if L12_16 >= 300 then
        Fn_tutorialCaptionKill()
        L13_17 = true
      end
      wait()
    until L13_17
  end
  L14_18 = L14_18(L15_19)
  L15_19 = invokeTask
  L15_19 = L15_19(L16_20)
  repeat
    L16_20()
  until L16_20 >= 5
  L16_20(L17_21)
  L16_20(L17_21)
  for L19_23 = 1, 5 do
    L21_25 = L19_23 + 5
    L21_25 = L20_24
    L22_26 = true
    L20_24(L21_25, L22_26)
    L21_25 = L19_23 + 5
    L21_25 = L20_24
    L22_26 = 100
    L20_24(L21_25, L22_26)
  end
  navi_islet_02 = true
  L17_21(L18_22)
  repeat
    L17_21()
  until L17_21 >= 5
  L17_21()
  L17_21(L18_22)
  L17_21(L18_22)
  L17_21(L18_22)
  L14_18 = nil
  L17_21(L18_22)
  L15_19 = nil
  L17_21()
  L17_21(L18_22)
  L17_21(L18_22)
  L17_21(L18_22)
  L17_21(L18_22)
  L17_21(L18_22, L19_23, L20_24)
  L17_21(L18_22, L19_23)
  repeat
    L17_21()
  until L17_21 ~= nil
  L17_21()
  for L21_25 = 1, 5 do
    L22_26 = gem
    L23_27 = L21_25 + 10
    L22_26 = L22_26[L23_27]
    L23_27 = L22_26
    L22_26 = L22_26.setActive
    L24_28 = true
    L22_26(L23_27, L24_28)
    L22_26 = gem
    L23_27 = L21_25 + 10
    L22_26 = L22_26[L23_27]
    L23_27 = L22_26
    L22_26 = L22_26.setVisibleBlockHalfSize
    L24_28 = 100
    L22_26(L23_27, L24_28)
  end
  L21_25 = "locator2_islet_02_02"
  L21_25 = L18_22
  L21_25 = waitSeconds
  L22_26 = 1
  L21_25(L22_26)
  L21_25 = invokeTask
  function L22_26()
    Fn_sendEventComSb("activeAreaIngame", 2)
  end
  L21_25(L22_26)
  L22_26 = L20_24
  L21_25 = L20_24.abort
  L21_25(L22_26)
  L21_25 = Fn_userCtrlOn
  L21_25()
  L21_25 = Fn_tutorialCaption
  L22_26 = "mars_bigjump"
  L21_25(L22_26)
  L21_25 = Fn_missionView
  L22_26 = "ep09_08003"
  L21_25(L22_26)
  L21_25 = HUD
  L22_26 = L21_25
  L21_25 = L21_25.counter99_99SetIcon
  L23_27 = HUD
  L23_27 = L23_27.kCount99_99IconType_Stone
  L21_25(L22_26, L23_27)
  L21_25 = HUD
  L22_26 = L21_25
  L21_25 = L21_25.counter99_99SetTextID
  L23_27 = "ep09_09014"
  L21_25(L22_26, L23_27)
  L21_25 = HUD
  L22_26 = L21_25
  L21_25 = L21_25.counter99_99SetMax
  L23_27 = _battle_clearCountNum_wave2
  L21_25(L22_26, L23_27)
  L21_25 = HUD
  L22_26 = L21_25
  L21_25 = L21_25.counter99_99SetNum
  L23_27 = 0
  L21_25(L22_26, L23_27)
  L21_25 = HUD
  L22_26 = L21_25
  L21_25 = L21_25.counter99_99SetVisible
  L23_27 = true
  L21_25(L22_26, L23_27)
  L21_25 = waitSeconds
  L22_26 = 1.3
  L21_25(L22_26)
  L21_25 = Player
  L22_26 = L21_25
  L21_25 = L21_25.getRecentAreaName
  L21_25 = L21_25(L22_26)
  L22_26 = Player
  L23_27 = L22_26
  L22_26 = L22_26.getRecentBgName
  L22_26 = L22_26(L23_27)
  if L21_25 == "az2_a_06_10" or L21_25 == "az2_a_09_29" or L22_26 == "az2_a_12_08" or L22_26 == "az2_a_12_09" or L22_26 == "az2_a_12_10" or L22_26 == "az2_a_12_12" then
    navi_islet_03 = true
    L23_27 = Fn_naviSet
    L24_28 = L18_22
    L23_27(L24_28)
  else
    navi_islet_02 = true
    L23_27 = Fn_naviSet
    L24_28 = L16_20
    L23_27(L24_28)
  end
  tut_phase = 2
  L23_27 = Fn_pcSensorOn
  L24_28 = "pccubesensor2_fall_01"
  L23_27(L24_28)
  L23_27 = Fn_pcSensorOn
  L24_28 = "pccubesensor2_islet_02"
  L23_27(L24_28)
  L23_27 = Fn_pcSensorOn
  L24_28 = "pccubesensor2_islet_03"
  L23_27(L24_28)
  L23_27 = 0
  L24_28 = false
  L25_29 = invokeTask
  L25_29 = L25_29(L26_30)
  repeat
    L26_30()
  until L26_30 >= 5
  L26_30(L27_31)
  L26_30(L27_31)
  islet_02_01_clear = true
  L29_33 = "locator2_islet_02_02"
  L41_45 = L27_31(L28_32, L29_33)
  L26_30(L27_31, L28_32, L29_33, L30_34, L31_35, L32_36, L33_37, L34_38, L35_39, L36_40, L37_41, L38_42, L39_43, L40_44, L41_45, L27_31(L28_32, L29_33))
  for L29_33 = 1, 5 do
    L30_34 = gem
    L31_35 = L29_33 + 15
    L30_34 = L30_34[L31_35]
    L31_35 = L30_34
    L30_34 = L30_34.setActive
    L32_36 = true
    L30_34(L31_35, L32_36)
    L30_34 = gem
    L31_35 = L29_33 + 15
    L30_34 = L30_34[L31_35]
    L31_35 = L30_34
    L30_34 = L30_34.setVisibleBlockHalfSize
    L32_36 = 100
    L30_34(L31_35, L32_36)
  end
  repeat
    L26_30()
  until L26_30 >= 5
  L26_30(L27_31)
  L26_30(L27_31)
  L26_30(L27_31)
  L26_30(L27_31)
  L26_30(L27_31)
  L25_29 = nil
  L26_30(L27_31)
  L26_30()
  L26_30(L27_31)
  L26_30(L27_31)
  L26_30(L27_31)
  L26_30(L27_31)
  L26_30(L27_31)
  repeat
    L26_30()
  until L26_30 ~= nil
  L26_30(L27_31, L28_32)
  L26_30()
  for L29_33 = 1, 5 do
    L30_34 = gem
    L31_35 = L29_33 + 20
    L30_34 = L30_34[L31_35]
    L31_35 = L30_34
    L30_34 = L30_34.setActive
    L32_36 = true
    L30_34(L31_35, L32_36)
    L30_34 = gem
    L31_35 = L29_33 + 20
    L30_34 = L30_34[L31_35]
    L31_35 = L30_34
    L30_34 = L30_34.setVisibleBlockHalfSize
    L32_36 = 100
    L30_34(L31_35, L32_36)
  end
  L29_33 = 1
  L28_32(L29_33)
  function L29_33()
    Fn_sendEventComSb("activeAreaIngame", 3)
  end
  L28_32(L29_33)
  L29_33 = L27_31
  L28_32(L29_33)
  L29_33 = 0.3
  L28_32(L29_33)
  while true do
    L29_33 = L28_32
    if L28_32 > 0 then
      L28_32()
    end
  end
  L29_33 = L28_32
  L30_34 = ggd
  L30_34 = L30_34.Savedata__Info__ep09__ep09_info_02
  if L28_32 ~= 2 then
    L29_33 = L28_32
    L30_34 = "ep09_info_02"
    L31_35 = false
    L28_32(L29_33, L30_34, L31_35)
  else
    L29_33 = L28_32
    L30_34 = ggd
    L30_34 = L30_34.Savedata__Info__ep09__ep09_info_02
    if L28_32 == 2 then
      L29_33 = L28_32
      L30_34 = "ep09_info_02"
      L31_35 = true
      L28_32(L29_33, L30_34, L31_35)
    end
  end
  L28_32()
  L28_32()
  L29_33 = "mars_bigjump_dodge"
  L28_32(L29_33)
  L29_33 = "ep09_08003"
  L28_32(L29_33)
  L29_33 = L28_32
  L30_34 = HUD
  L30_34 = L30_34.kCount99_99IconType_Stone
  L28_32(L29_33, L30_34)
  L29_33 = L28_32
  L30_34 = "ep09_09014"
  L28_32(L29_33, L30_34)
  L29_33 = L28_32
  L30_34 = _battle_clearCountNum_wave3
  L28_32(L29_33, L30_34)
  L29_33 = L28_32
  L30_34 = 0
  L28_32(L29_33, L30_34)
  L29_33 = L28_32
  L30_34 = true
  L28_32(L29_33, L30_34)
  L29_33 = 1.3
  L28_32(L29_33)
  L29_33 = L28_32
  L29_33 = Player
  L30_34 = L29_33
  L29_33 = L29_33.getRecentBgName
  L29_33 = L29_33(L30_34)
  if L28_32 == "az2_a_02_02" or L29_33 == "az2_a_12_13" or L29_33 == "az2_a_12_14" or L29_33 == "az2_a_12_15" or L29_33 == "az2_a_12_16" then
    navi_islet_05 = true
    L30_34 = Fn_naviSet
    L31_35 = L26_30
    L30_34(L31_35)
  elseif L28_32 == "az2_a_06_10" or L28_32 == "az2_a_09_29" or L29_33 == "az2_a_12_08" or L29_33 == "az2_a_12_09" or L29_33 == "az2_a_12_10" or L29_33 == "az2_a_12_12" then
    navi_islet_04 = true
    L30_34 = Fn_naviSet
    L31_35 = L19_23
    L30_34(L31_35)
  else
    navi_islet_02 = true
    L30_34 = Fn_naviSet
    L31_35 = L16_20
    L30_34(L31_35)
  end
  tut_phase = 3
  L30_34 = Fn_pcSensorOn
  L31_35 = "pccubesensor2_fall_01"
  L30_34(L31_35)
  L30_34 = Fn_pcSensorOn
  L31_35 = "pccubesensor2_fall_02"
  L30_34(L31_35)
  L30_34 = Fn_pcSensorOn
  L31_35 = "pccubesensor2_islet_02"
  L30_34(L31_35)
  L30_34 = Fn_pcSensorOn
  L31_35 = "pccubesensor2_islet_04"
  L30_34(L31_35)
  L30_34 = Fn_pcSensorOn
  L31_35 = "pccubesensor2_islet_05"
  L30_34(L31_35)
  L30_34 = 0
  L31_35 = false
  L32_36 = invokeTask
  function L33_37()
    repeat
      L30_34 = L30_34 + 1
      if L30_34 >= 300 then
        Fn_tutorialCaptionKill()
        L31_35 = true
      end
      wait()
    until L31_35
  end
  L32_36 = L32_36(L33_37)
  L33_37 = invokeTask
  L33_37 = L33_37(L34_38)
  repeat
    L34_38()
  until L34_38 >= 5
  L34_38(L35_39)
  L34_38(L35_39)
  L34_38(L35_39)
  L34_38(L35_39)
  L34_38(L35_39)
  L34_38(L35_39)
  L32_36 = nil
  L34_38(L35_39)
  L33_37 = nil
  L34_38()
  L34_38(L35_39)
  repeat
    L34_38()
  until L34_38 ~= nil
  L34_38(L35_39, L36_40)
  L34_38()
  for L37_41 = 1, 15 do
    L38_42(L39_43, L40_44)
    L38_42(L39_43, L40_44)
  end
  L36_40(L37_41)
  L36_40(L37_41)
  L36_40(L37_41)
  L36_40(L37_41)
  L36_40(L37_41)
  L36_40(L37_41)
  L36_40()
  L36_40(L37_41)
  L36_40(L37_41, L38_42)
  L36_40(L37_41, L38_42)
  L36_40(L37_41, L38_42)
  L36_40(L37_41, L38_42)
  L36_40(L37_41, L38_42)
  L36_40(L37_41)
  for L39_43 = 1, 3 do
    L41_45 = findGameObject2
    L41_45 = L41_45("Node", string.format("locator2_islet_%02d", L39_43 + 3))
    L40_44[L39_43] = L41_45
    L41_45 = HUD
    L41_45 = L41_45.mnaviNew
    L41_45 = L41_45(L41_45, {
      name = "mnavi_" .. L39_43
    })
    L40_44[L39_43] = L41_45
    L41_45 = L40_44
    L40_44(L41_45, _obj_navi_hdl[L39_43])
  end
  if L36_40 == "az2_a_04_01" or L37_41 == "az2_a_12_11" then
    for L41_45 = 1, 3 do
      _mnavi_hdl[L41_45]:setActive(true)
    end
  elseif L36_40 == "az2_a_02_02" or L37_41 == "az2_a_12_13" or L37_41 == "az2_a_12_14" or L37_41 == "az2_a_12_15" or L37_41 == "az2_a_12_16" then
    navi_islet_05 = true
    L38_42(L39_43)
  elseif L36_40 == "az2_a_06_10" or L36_40 == "az2_a_09_29" or L37_41 == "az2_a_12_08" or L37_41 == "az2_a_12_09" or L37_41 == "az2_a_12_10" or L37_41 == "az2_a_12_12" then
    navi_islet_04 = true
    L38_42(L39_43)
  else
    navi_islet_02 = true
    L38_42(L39_43)
  end
  tut_phase = 4
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  L38_42(L39_43)
  repeat
    L39_43()
  until L39_43 >= 15
  L41_45 = false
  L39_43(L40_44, L41_45)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L39_43(L40_44)
  L41_45 = "Lithograph"
  if L39_43 ~= nil then
    L41_45 = L39_43
    L40_44(L41_45, false)
  end
  L41_45 = L38_42
  L40_44(L41_45)
  L40_44()
  L41_45 = 1
  L40_44(L41_45)
  L41_45 = L40_44
  L40_44(L41_45, false)
  L41_45 = Player
  L41_45 = L41_45.kAbility_KickCombo
  L41_45 = {}
  Fn_unLockPlayerAbility(L40_44, L41_45)
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("synchroArea")
  gem = nil
  if L39_43 ~= nil then
    L39_43:setFarCulling(true)
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_47, L1_48
end
function pccubesensor2_fall_01_OnEnter()
  print("pccubesensor2_fall_01_OnEnter")
  if navi_islet_03 then
    navi_islet_03 = false
    Fn_naviKill()
  end
  if navi_islet_04 then
    navi_islet_04 = false
    Fn_naviKill()
  end
  if navi_islet_02 == false then
    navi_islet_02 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_01_02"))
  end
end
function pccubesensor2_fall_02_OnEnter()
  print("pccubesensor2_fall_02_OnEnter")
  if navi_islet_05 then
    navi_islet_05 = false
    Fn_naviKill()
  end
  if navi_islet_04 == false then
    navi_islet_04 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_02_02"))
  end
end
function pccubesensor2_fall_03_OnEnter()
  print("pccubesensor2_fall_03_OnEnter")
  for _FORV_3_ = 1, 3 do
    if _mnavi_hdl[_FORV_3_]:isValid() then
      _mnavi_hdl[_FORV_3_]:setActive(false)
    end
  end
  if _FOR_ == false then
    navi_islet_05 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_03"))
  end
end
function pccubesensor2_islet_01_OnEnter()
  print("pccubesensor2_islet_01_OnEnter")
  if navi_islet_01 then
    navi_islet_01 = false
    Fn_naviKill()
  end
end
function pccubesensor2_islet_01_OnLeave()
  print("pccubesensor2_islet_01_OnLeave")
  if navi_islet_01 == false then
    navi_islet_01 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_01_01"))
  end
end
function pccubesensor2_islet_02_OnEnter()
  print("pccubesensor2_islet_02_OnEnter")
  if navi_islet_02 then
    navi_islet_02 = false
    Fn_naviKill()
  end
  if tut_phase == 1 then
  elseif tut_phase == 2 then
    if islet_02_01_clear == false then
      if navi_islet_03 == false then
        navi_islet_03 = true
        Fn_naviSet(findGameObject2("Node", "locator2_islet_02_01"))
      end
    elseif navi_islet_04 == false then
      navi_islet_04 = true
      Fn_naviSet(findGameObject2("Node", "locator2_islet_02_02"))
    end
  elseif navi_islet_04 == false then
    navi_islet_04 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_02_02"))
  end
end
function pccubesensor2_islet_02_OnLeave()
  print("pccubesensor2_islet_02_OnLeave")
  if tut_phase == 1 and navi_islet_02 == false then
    navi_islet_02 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_01_02"))
  end
end
function pccubesensor2_islet_03_OnEnter()
  print("pccubesensor2_islet_03_OnEnter")
  if tut_phase == 2 and navi_islet_03 then
    navi_islet_03 = false
    Fn_naviKill()
  end
end
function pccubesensor2_islet_03_OnLeave()
  print("pccubesensor2_islet_03_OnLeave")
  if tut_phase == 2 and navi_islet_03 == false then
    navi_islet_03 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_02_01"))
  end
end
function pccubesensor2_islet_04_OnEnter()
  print("pccubesensor2_islet_04_OnEnter")
  if tut_phase == 2 then
    if islet_02_01_clear then
      if navi_islet_04 then
        navi_islet_04 = false
        Fn_naviKill()
      end
    elseif navi_islet_03 == false then
      navi_islet_03 = true
      Fn_naviSet(findGameObject2("Node", "locator2_islet_02_01"))
    end
  elseif tut_phase == 3 then
    if navi_islet_04 then
      navi_islet_04 = false
      Fn_naviKill()
    end
    if navi_islet_05 == false then
      navi_islet_05 = true
      Fn_naviSet(findGameObject2("Node", "locator2_islet_03"))
    end
  end
end
function pccubesensor2_islet_04_OnLeave()
  print("pccubesensor2_islet_04_OnLeave")
  if tut_phase == 2 and islet_02_01_clear and navi_islet_04 == false then
    navi_islet_04 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_02_02"))
  end
end
function pccubesensor2_islet_05_OnEnter()
  print("pccubesensor2_islet_05_OnEnter")
  if tut_phase == 3 then
    if navi_islet_05 then
      navi_islet_05 = false
      Fn_naviKill()
    end
  elseif tut_phase == 4 then
    if navi_islet_05 then
      navi_islet_05 = false
      Fn_naviKill()
    end
    for _FORV_3_ = 1, 3 do
      if _mnavi_hdl[_FORV_3_]:isValid() and _mnavi_hdl[_FORV_3_]:getActive() == false then
        _mnavi_hdl[_FORV_3_]:setActive(true)
      end
    end
  end
end
function pccubesensor2_islet_05_OnLeave()
  print("pccubesensor2_islet_05_OnLeave")
  if tut_phase == 3 and navi_islet_05 == false then
    navi_islet_05 = true
    Fn_naviSet(findGameObject2("Node", "locator2_islet_03"))
  end
end
function pccubesensor2_islet_06_OnEnter()
  print("pccubesensor2_islet_06_OnEnter")
  if tut_phase == 4 then
    if navi_islet_05 then
      navi_islet_05 = false
      Fn_naviKill()
    end
    for _FORV_3_ = 1, 3 do
      if _mnavi_hdl[_FORV_3_]:isValid() and _mnavi_hdl[_FORV_3_]:getActive() == false then
        _mnavi_hdl[_FORV_3_]:setActive(true)
      end
    end
  end
end
function pccubesensor2_islet_07_OnEnter()
  print("pccubesensor2_islet_07_OnEnter")
  if _mnavi_hdl[1]:isValid() and _mnavi_hdl[1]:getActive() then
    _mnavi_hdl[1]:setActive(false)
  end
end
function pccubesensor2_islet_07_OnLeave()
  print("pccubesensor2_islet_07_OnLeave")
  if _mnavi_hdl[1]:isValid() and _mnavi_hdl[1]:getActive() == false then
    _mnavi_hdl[1]:setActive(true)
  end
end
function pccubesensor2_islet_08_OnEnter()
  print("pccubesensor2_islet_08_OnEnter")
  if _mnavi_hdl[2]:isValid() and _mnavi_hdl[2]:getActive() then
    _mnavi_hdl[2]:setActive(false)
  end
end
function pccubesensor2_islet_08_OnLeave()
  print("pccubesensor2_islet_08_OnLeave")
  if _mnavi_hdl[2]:isValid() and _mnavi_hdl[2]:getActive() == false then
    _mnavi_hdl[2]:setActive(true)
  end
end
function pccubesensor2_islet_09_OnEnter()
  print("pccubesensor2_islet_09_OnEnter")
  if _mnavi_hdl[3]:isValid() and _mnavi_hdl[3]:getActive() then
    _mnavi_hdl[3]:setActive(false)
  end
end
function pccubesensor2_islet_09_OnLeave()
  print("pccubesensor2_islet_09_OnLeave")
  if _mnavi_hdl[3]:isValid() and _mnavi_hdl[3]:getActive() == false then
    _mnavi_hdl[3]:setActive(true)
  end
end
function pccubesensormulti2_catwarp_ep09_i_01_OnLeave()
  print("pccubesensormulti2_catwarp_ep09_i_01_OnLeave")
  invokeTask(function()
    Fn_catWarp()
    waitSeconds(1)
    Fn_captionViewLock("ep09_11005")
    HUD:info("ep09_info_01", true)
  end)
end
function pccubesensormulti2_catwarp_ep09_i_02_OnLeave()
  print("pccubesensormulti2_catwarp_ep09_i_02_OnLeave")
  invokeTask(function()
    Fn_catWarp()
    waitSeconds(1)
    Fn_captionViewLock("ep09_11005")
    HUD:info("ep09_info_02", true)
  end)
end
function pccubesensormulti2_catwarp_ep09_i_03_OnLeave()
  print("pccubesensormulti2_catwarp_ep09_i_01_OnLeave")
  invokeTask(function()
    Fn_catWarp()
    waitSeconds(1)
    Fn_captionViewLock("ep09_11005")
  end)
end
function GetPreciousGemCallback(A0_49)
  invokeTask(function()
    local L0_50
    L0_50 = A0_49
    L0_50 = L0_50.getName
    L0_50 = L0_50(L0_50)
    print(L0_50)
    if L0_50 == "gem2_ep09_i_m_01" or L0_50 == "gem2_ep09_i_m_02" or L0_50 == "gem2_ep09_i_m_03" or L0_50 == "gem2_ep09_i_m_04" or L0_50 == "gem2_ep09_i_m_05" then
      gem_count_set_01 = gem_count_set_01 + 1
    elseif L0_50 == "gem2_ep09_i_m_06" or L0_50 == "gem2_ep09_i_m_07" or L0_50 == "gem2_ep09_i_m_08" or L0_50 == "gem2_ep09_i_m_09" or L0_50 == "gem2_ep09_i_m_10" then
      gem_count_set_02 = gem_count_set_02 + 1
    elseif L0_50 == "gem2_ep09_i_m_11" or L0_50 == "gem2_ep09_i_m_12" or L0_50 == "gem2_ep09_i_m_13" or L0_50 == "gem2_ep09_i_m_14" or L0_50 == "gem2_ep09_i_m_15" then
      gem_count_set_03 = gem_count_set_03 + 1
    elseif L0_50 == "gem2_ep09_i_m_16" or L0_50 == "gem2_ep09_i_m_17" or L0_50 == "gem2_ep09_i_m_18" or L0_50 == "gem2_ep09_i_m_19" or L0_50 == "gem2_ep09_i_m_20" then
      gem_count_set_04 = gem_count_set_04 + 1
    elseif L0_50 == "gem2_ep09_i_m_21" or L0_50 == "gem2_ep09_i_m_22" or L0_50 == "gem2_ep09_i_m_23" or L0_50 == "gem2_ep09_i_m_24" or L0_50 == "gem2_ep09_i_m_25" then
      gem_count_set_05 = gem_count_set_05 + 1
    elseif L0_50 == "gem2_ep09_i_m_26" or L0_50 == "gem2_ep09_i_m_27" or L0_50 == "gem2_ep09_i_m_28" or L0_50 == "gem2_ep09_i_m_29" or L0_50 == "gem2_ep09_i_m_30" then
      gem_count_set_06 = gem_count_set_06 + 1
      if gem_count_set_06 >= 5 then
        _mnavi_hdl[1]:del(false)
        _mnavi_hdl[1]:setActive(false)
      end
    elseif L0_50 == "gem2_ep09_i_m_31" or L0_50 == "gem2_ep09_i_m_32" or L0_50 == "gem2_ep09_i_m_33" or L0_50 == "gem2_ep09_i_m_34" or L0_50 == "gem2_ep09_i_m_35" then
      gem_count_set_07 = gem_count_set_07 + 1
      if 5 <= gem_count_set_07 then
        _mnavi_hdl[2]:del(false)
        _mnavi_hdl[2]:setActive(false)
      end
    elseif L0_50 == "gem2_ep09_i_m_36" or L0_50 == "gem2_ep09_i_m_37" or L0_50 == "gem2_ep09_i_m_38" or L0_50 == "gem2_ep09_i_m_39" or L0_50 == "gem2_ep09_i_m_40" then
      gem_count_set_08 = gem_count_set_08 + 1
      if 5 <= gem_count_set_08 then
        _mnavi_hdl[3]:del(false)
        _mnavi_hdl[3]:setActive(false)
      end
    end
  end)
end
