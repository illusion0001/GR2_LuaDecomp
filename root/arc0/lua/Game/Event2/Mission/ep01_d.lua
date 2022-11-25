dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Common/CloneDebriCommon.lua")
_next_phase = false
_move_end = false
_fall_out = false
time_count = nil
throw_1st = false
wait_flg = false
input = false
sdemo = nil
icon_wait1 = 8
icon_wait2 = 7
icon_wait3 = 2
icon_wait4 = 2
enmgen2_ep01_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bosshand",
      locator = "locator_boss_01",
      name = "enemy_boss_hand"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
function Initialize()
  local L0_11, L1_12, L2_13
  L0_11 = {L1_12, L2_13}
  L1_12 = {}
  L1_12.name = "sis_01"
  L1_12.type = "sis01"
  L1_12.node = "locator2_sis_start"
  L1_12.attach = false
  L1_12.anim_name = "nursing_00"
  L2_13 = {}
  L2_13.name = "cid_01"
  L2_13.type = "cid01"
  L2_13.node = "locator2_cid_start"
  L2_13.attach = false
  L2_13.anim_name = "injured_00"
  L1_12 = Fn_setupNpc
  L2_13 = L0_11
  L1_12(L2_13)
  L1_12 = Fn_findAreaHandle
  L2_13 = "wa_a_05"
  L1_12 = L1_12(L2_13)
  L2_13 = createGameObject2
  L2_13 = L2_13("Node")
  L2_13:setName("sdemo_base")
  L1_12:appendChild(L2_13)
  L2_13:setTransform(Vector(51.7820323028, 68, 70.3108891325), XYZRotQuatD(0, 240, 0))
  L2_13:try_init()
  L2_13:waitForReady()
  L2_13:try_start()
  objname = {
    "wa_a_15",
    "wa_a_15",
    "wa_a_15",
    "wa_a_16",
    "wa_a_15",
    "wa_a_16",
    "wa_a_15",
    "wa_a_14",
    "wa_a_14",
    "wa_a_15",
    "wa_a_15",
    "test_eff_size"
  }
  offset_testbg = Fn_createGimmickBg("locator2_offset_01", "offset", "offset_test", false)
  _bu_ctrl = AreaController.create("bu_a_root")
  _crane_ctrl = AreaController.create("ve_crane_root")
  if Fn_findAreaHandle("wa_a_root") then
    Fn_findAreaHandle("wa_a_root"):setSceneParameters("storm_a_root")
  end
  pdemo0 = PDemo.create("ep01_d_c01_pre", L2_13, {camera = true})
  pdemo1 = PDemo.create("ep01_d_c01", L2_13, {camera = true})
  pdemo2 = PDemo.create("ep01_d_c02", L2_13, {camera = true})
  pdemo3 = PDemo.create("ep01_a_c02", Fn_findAreaHandle("wa_a_root"), {camera = true})
  pdemo4 = PDemo.create("ep01_d_c03", L2_13, {camera = true})
  pdemo5 = PDemo.create("ep01_d_c04_1", L2_13, {camera = true})
  pdemo6 = PDemo.create("ep01_d_c04_2", L2_13, {camera = true})
  pdemo7 = PDemo.create("ep01_d_c05t08", L2_13, {camera = true})
  pdemo8 = PDemo.create("ep01_d_c09", L2_13, {camera = true})
  pdemo9 = PDemo.create("ep01_d_c10", L2_13, {camera = true})
  while pdemo1:isLoading() do
    wait()
  end
  while pdemo2:isLoading() do
    wait()
  end
  enmgen = findGameObject2("EnemyGenerator", "enmgen2_boss")
  if enmgen ~= nil then
    enmgen:requestSpawn()
    enmgen:setEnemyMarker(true)
  end
  hand_hdl = findGameObject2("Puppet", "enemy_boss_hand")
  hand_brain_hdl = findGameObject2("EnemyBrain", "enemy_boss_hand")
end
function Ingame()
  local L0_14, L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33, L20_34, L21_35, L22_36, L23_37, L24_38, L25_39, L26_40, L27_41, L28_42, L29_43
  L0_14 = mother2
  L1_15 = L0_14
  L0_14 = L0_14.sendEvent
  L2_16 = "getBackgroundElement2Handle"
  L3_17 = "scree"
  L0_14 = L0_14(L1_15, L2_16, L3_17)
  L2_16 = L0_14
  L1_15 = L0_14.findSubArea
  L3_17 = "wa_a_01"
  L1_15 = L1_15(L2_16, L3_17)
  L3_17 = L0_14
  L2_16 = L0_14.findSubArea
  L4_18 = "wa_a_02"
  L2_16 = L2_16(L3_17, L4_18)
  L4_18 = L0_14
  L3_17 = L0_14.findSubArea
  L5_19 = "wa_a_03"
  L3_17 = L3_17(L4_18, L5_19)
  L5_19 = L0_14
  L4_18 = L0_14.findSubArea
  L6_20 = "wa_a_04"
  L4_18 = L4_18(L5_19, L6_20)
  L6_20 = L0_14
  L5_19 = L0_14.findSubArea
  L7_21 = "wa_a_05"
  L5_19 = L5_19(L6_20, L7_21)
  L7_21 = L0_14
  L6_20 = L0_14.findSubArea
  L8_22 = "wa_a_06"
  L6_20 = L6_20(L7_21, L8_22)
  L8_22 = L0_14
  L7_21 = L0_14.findSubArea
  L9_23 = "wa_a_07"
  L7_21 = L7_21(L8_22, L9_23)
  L9_23 = L0_14
  L8_22 = L0_14.findSubArea
  L10_24 = "wa_a_08"
  L8_22 = L8_22(L9_23, L10_24)
  L10_24 = L0_14
  L9_23 = L0_14.findSubArea
  L11_25 = "wa_a_09"
  L9_23 = L9_23(L10_24, L11_25)
  L11_25 = L0_14
  L10_24 = L0_14.findSubArea
  L12_26 = "wa_a_11"
  L10_24 = L10_24(L11_25, L12_26)
  L12_26 = L1_15
  L11_25 = L1_15.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L2_16
  L11_25 = L2_16.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L3_17
  L11_25 = L3_17.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L4_18
  L11_25 = L4_18.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L5_19
  L11_25 = L5_19.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L6_20
  L11_25 = L6_20.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L7_21
  L11_25 = L7_21.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L8_22
  L11_25 = L8_22.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L9_23
  L11_25 = L9_23.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L12_26 = L10_24
  L11_25 = L10_24.setExpandedAabb
  L13_27 = true
  L11_25(L12_26, L13_27)
  L11_25 = HUD
  L12_26 = L11_25
  L11_25 = L11_25.prepareIconGuide
  L13_27 = Pad
  L13_27 = L13_27.kButton_R1
  L11_25(L12_26, L13_27)
  L11_25 = HUD
  L12_26 = L11_25
  L11_25 = L11_25.prepareIconGuide
  L13_27 = Pad
  L13_27 = L13_27.kButton_RL
  L11_25(L12_26, L13_27)
  L11_25 = Fn_findAreaHandle
  L12_26 = "wa_a_05"
  L11_25 = L11_25(L12_26)
  L13_27 = L11_25
  L12_26 = L11_25.setDriftEnable
  L14_28 = false
  L12_26(L13_27, L14_28)
  L12_26 = hand_brain_hdl
  L13_27 = L12_26
  L12_26 = L12_26.getArmorNum
  L12_26 = L12_26(L13_27)
  _is_armor = L12_26
  L12_26 = print
  L13_27 = "\229\178\169\227\129\174\230\149\176"
  L14_28 = _is_armor
  L13_27 = L13_27 .. L14_28
  L12_26(L13_27)
  L12_26 = Fn_warpArea
  L13_27 = "bu_a_root"
  L14_28 = "locator2_bu_a_move_01"
  L12_26(L13_27, L14_28)
  L12_26 = Fn_warpArea
  L13_27 = "ve_crane_root"
  L14_28 = "locator2_bu_a_move_01"
  L12_26(L13_27, L14_28)
  L12_26 = Player
  L13_27 = L12_26
  L12_26 = L12_26.getPuppet
  L12_26 = L12_26(L13_27)
  L13_27 = Sound
  L14_28 = L13_27
  L13_27 = L13_27.playSEHandle
  L15_29 = "ep01_storm_inside"
  L16_30 = 1
  L17_31 = ""
  L18_32 = "locator2_storm_01"
  L13_27 = L13_27(L14_28, L15_29, L16_30, L17_31, L18_32)
  storm_in = L13_27
  L13_27 = Player
  L14_28 = L13_27
  L13_27 = L13_27.setEnergyInfinite
  L15_29 = Player
  L15_29 = L15_29.kEnergy_Gravity
  L16_30 = true
  L13_27(L14_28, L15_29, L16_30)
  L13_27 = Player
  L14_28 = L13_27
  L13_27 = L13_27.setParameter
  L15_29 = Player
  L15_29 = L15_29.kParam_GravFallSpeed
  L16_30 = 15
  L17_31 = 8
  L13_27(L14_28, L15_29, L16_30, L17_31)
  L13_27 = Player
  L14_28 = L13_27
  L13_27 = L13_27.setSpecialTuning
  L15_29 = Player
  L15_29 = L15_29.kSpecialTuning_Ep01Tutorial
  L13_27(L14_28, L15_29)
  L13_27 = Camera
  L14_28 = L13_27
  L13_27 = L13_27.setControl
  L15_29 = Camera
  L15_29 = L15_29.kPlayer
  L16_30 = Camera
  L16_30 = L16_30.kControl_Gyro
  L17_31 = false
  L13_27(L14_28, L15_29, L16_30, L17_31)
  L13_27 = Camera
  L14_28 = L13_27
  L13_27 = L13_27.setControl
  L15_29 = Camera
  L15_29 = L15_29.kPlayer
  L16_30 = Camera
  L16_30 = L16_30.kControl_ResetView
  L17_31 = false
  L13_27(L14_28, L15_29, L16_30, L17_31)
  L13_27 = Player
  L14_28 = L13_27
  L13_27 = L13_27.setControl
  L15_29 = Player
  L15_29 = L15_29.kControl_Stick
  L16_30 = false
  L13_27(L14_28, L15_29, L16_30)
  L13_27 = Fn_createTerrainBg
  L14_28 = "locator2_rock_02"
  L15_29 = "rock_02"
  L16_30 = objname
  L16_30 = L16_30[2]
  L17_31 = true
  L13_27 = L13_27(L14_28, L15_29, L16_30, L17_31)
  L14_28 = Fn_createTerrainBg
  L15_29 = "locator2_rock_03"
  L16_30 = "rock_03"
  L17_31 = objname
  L17_31 = L17_31[3]
  L18_32 = true
  L14_28 = L14_28(L15_29, L16_30, L17_31, L18_32)
  L15_29 = Fn_createTerrainBg
  L16_30 = "locator2_rock_04"
  L17_31 = "rock_04"
  L18_32 = objname
  L18_32 = L18_32[4]
  L19_33 = true
  L15_29 = L15_29(L16_30, L17_31, L18_32, L19_33)
  L16_30 = Fn_createTerrainBg
  L17_31 = "locator2_rock_06"
  L18_32 = "rock_06"
  L19_33 = objname
  L19_33 = L19_33[6]
  L20_34 = true
  L16_30 = L16_30(L17_31, L18_32, L19_33, L20_34)
  L17_31 = Fn_createTerrainBg
  L18_32 = "locator2_rock_07"
  L19_33 = "rock_07"
  L20_34 = objname
  L20_34 = L20_34[7]
  L21_35 = true
  L17_31 = L17_31(L18_32, L19_33, L20_34, L21_35)
  L18_32 = Fn_createTerrainBg
  L19_33 = "locator2_rock_08"
  L20_34 = "rock_08"
  L21_35 = objname
  L21_35 = L21_35[8]
  L22_36 = true
  L18_32 = L18_32(L19_33, L20_34, L21_35, L22_36)
  L19_33 = Fn_createTerrainBg
  L20_34 = "locator2_rock_09"
  L21_35 = "rock_09"
  L22_36 = objname
  L22_36 = L22_36[9]
  L23_37 = true
  L19_33 = L19_33(L20_34, L21_35, L22_36, L23_37)
  L20_34 = Fn_createTerrainBg
  L21_35 = "locator2_rock_10"
  L22_36 = "rock_10"
  L23_37 = objname
  L23_37 = L23_37[10]
  L24_38 = true
  L20_34 = L20_34(L21_35, L22_36, L23_37, L24_38)
  L21_35 = HUD
  L22_36 = L21_35
  L21_35 = L21_35.sightMarkerSetDisable
  L23_37 = true
  L21_35(L22_36, L23_37)
  L21_35 = Fn_findNpc
  L22_36 = "sis_01"
  L21_35 = L21_35(L22_36)
  repeat
    L22_36 = wait
    L22_36()
    L23_37 = L21_35
    L22_36 = L21_35.isReadyNpc
    L22_36 = L22_36(L23_37)
  until L22_36
  L23_37 = L21_35
  L22_36 = L21_35.ignoreStoop
  L22_36(L23_37)
  L22_36 = Fn_findNpc
  L23_37 = "cid_01"
  L22_36 = L22_36(L23_37)
  repeat
    L23_37 = wait
    L23_37()
    L24_38 = L22_36
    L23_37 = L22_36.isReadyNpc
    L23_37 = L23_37(L24_38)
  until L23_37
  L24_38 = L22_36
  L23_37 = L22_36.ignoreStoop
  L23_37(L24_38)
  repeat
    L23_37 = print
    L24_38 = "brain\229\190\133\230\169\159\228\184\173"
    L23_37(L24_38)
    L23_37 = wait
    L23_37()
    L23_37 = hand_brain_hdl
    L24_38 = L23_37
    L23_37 = L23_37.isReadyEnemy
    L23_37 = L23_37(L24_38)
  until L23_37
  function L23_37()
    invokeTask(function()
      pdemo0:play()
      pdemo0:setCurrentFrame(3)
      ret = hand_brain_hdl:bossHandChangeCut("cut01pre")
      print("\227\131\151\227\131\172", ret)
    end)
  end
  L24_38 = Fn_missionStart
  L25_39 = L23_37
  L24_38(L25_39)
  L24_38 = Fn_userCtrlAllOff
  L24_38()
  L24_38 = Fn_kaiwaDemoView
  L25_39 = "ep01_00310k"
  L24_38(L25_39)
  L24_38 = Fn_missionView
  L25_39 = "ep01_03000"
  L26_40 = 5
  L24_38(L25_39, L26_40)
  L24_38 = Fn_captionView
  L25_39 = "ep01_03001"
  L24_38(L25_39)
  L24_38 = waitSeconds
  L25_39 = 2.5
  L24_38(L25_39)
  repeat
    L24_38 = print
    L25_39 = "\227\130\171\227\131\131\227\131\136\239\188\144\229\134\141\231\148\159\231\181\130\228\186\134\229\190\133\227\129\161"
    L26_40 = pdemo0
    L27_41 = L26_40
    L26_40 = L26_40.getCurrentFrame
    L29_43 = L26_40(L27_41)
    L24_38(L25_39, L26_40, L27_41, L28_42, L29_43, L26_40(L27_41))
    L24_38 = wait
    L24_38()
    L24_38 = pdemo0
    L25_39 = L24_38
    L24_38 = L24_38.getCurrentFrame
    L24_38 = L24_38(L25_39)
  until L24_38 >= 119
  L24_38 = hand_brain_hdl
  L25_39 = L24_38
  L24_38 = L24_38.bossHandChangeCut
  L26_40 = "cut01"
  L24_38 = L24_38(L25_39, L26_40)
  ret = L24_38
  L24_38 = print
  L25_39 = "\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\239\188\145"
  L26_40 = ret
  L24_38(L25_39, L26_40)
  L24_38 = pdemo1
  L25_39 = L24_38
  L24_38 = L24_38.play
  L24_38(L25_39)
  L24_38 = pdemo0
  L25_39 = L24_38
  L24_38 = L24_38.stop
  L26_40 = 0
  L24_38(L25_39, L26_40)
  L24_38 = pdemo0
  L25_39 = L24_38
  L24_38 = L24_38.reset
  L24_38(L25_39)
  L24_38 = print
  L25_39 = "\227\130\171\227\131\131\227\131\136\239\188\145\227\130\185\227\130\191\227\131\188\227\131\136"
  L24_38(L25_39)
  wait_cnt = 0
  L24_38 = 82
  repeat
    repeat
      L25_39 = wait
      L25_39()
      L25_39 = pdemo1
      L26_40 = L25_39
      L25_39 = L25_39.getCurrentFrame
      L25_39 = L25_39(L26_40)
    until L25_39 >= 43
    L25_39 = Sound
    L26_40 = L25_39
    L25_39 = L25_39.playSE
    L27_41 = "pc1_528c"
    L28_42 = 1
    L29_43 = ""
    L25_39(L26_40, L27_41, L28_42, L29_43, L12_26)
    L25_39 = HUD
    L26_40 = L25_39
    L25_39 = L25_39.openIconGuide
    L27_41 = Pad
    L27_41 = L27_41.kButton_R1
    L25_39(L26_40, L27_41)
    L25_39 = wait
    L26_40 = icon_wait1
    L25_39(L26_40)
    repeat
      L25_39 = pdemo1
      L26_40 = L25_39
      L25_39 = L25_39.getCurrentFrame
      L25_39 = L25_39(L26_40)
      wait_cnt = L25_39
      L25_39 = print
      L26_40 = wait_cnt
      L25_39(L26_40)
      L25_39 = wait
      L25_39()
      L25_39 = HUD
      L26_40 = L25_39
      L25_39 = L25_39.isPressIconGuide
      L25_39 = L25_39(L26_40)
      input = L25_39
      L25_39 = input
      if L25_39 ~= true then
        L25_39 = wait_cnt
      end
    until L24_38 <= L25_39
    L25_39 = HUD
    L26_40 = L25_39
    L25_39 = L25_39.isPressIconGuide
    L25_39 = L25_39(L26_40)
    input = L25_39
    L25_39 = input
    if L25_39 == false then
      L25_39 = HUD
      L26_40 = L25_39
      L25_39 = L25_39.closeIconGuide
      L25_39(L26_40)
      L25_39 = Sound
      L26_40 = L25_39
      L25_39 = L25_39.playSE
      L27_41 = "sys_alert_info"
      L28_42 = 1
      L25_39(L26_40, L27_41, L28_42)
      L25_39 = waitSeconds
      L26_40 = 0.8
      L25_39(L26_40)
      L25_39 = Sound
      L26_40 = L25_39
      L25_39 = L25_39.playSE
      L27_41 = "pc1_011"
      L28_42 = 1
      L29_43 = ""
      L25_39(L26_40, L27_41, L28_42, L29_43, L12_26)
      L25_39 = Fn_blackout
      L26_40 = 0.6
      L25_39(L26_40)
      L25_39 = pdemo1
      L26_40 = L25_39
      L25_39 = L25_39.stop
      L25_39(L26_40)
      L25_39 = pdemo1
      L26_40 = L25_39
      L25_39 = L25_39.reset
      L25_39(L26_40)
      L25_39 = pdemo0
      L26_40 = L25_39
      L25_39 = L25_39.play
      L25_39(L26_40)
      L25_39 = pdemo0
      L26_40 = L25_39
      L25_39 = L25_39.setCurrentFrame
      L27_41 = 5
      L25_39(L26_40, L27_41)
      L25_39 = print
      L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\144\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136"
      L27_41 = ret
      L25_39(L26_40, L27_41)
      L25_39 = hand_brain_hdl
      L26_40 = L25_39
      L25_39 = L25_39.bossHandChangeCut
      L27_41 = "cut01pre"
      L25_39 = L25_39(L26_40, L27_41)
      ret = L25_39
      L25_39 = Fn_fadein
      L25_39()
      repeat
        L25_39 = print
        L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\144\229\134\141\231\148\159\231\181\130\228\186\134\229\190\133\227\129\161"
        L27_41 = pdemo0
        L28_42 = L27_41
        L27_41 = L27_41.getCurrentFrame
        L29_43 = L27_41(L28_42)
        L25_39(L26_40, L27_41, L28_42, L29_43, L27_41(L28_42))
        L25_39 = wait
        L25_39()
        L25_39 = pdemo0
        L26_40 = L25_39
        L25_39 = L25_39.getCurrentFrame
        L25_39 = L25_39(L26_40)
      until L25_39 >= 119
      wait_cnt = 0
      L25_39 = hand_brain_hdl
      L26_40 = L25_39
      L25_39 = L25_39.bossHandChangeCut
      L27_41 = "cut01"
      L25_39(L26_40, L27_41)
      L25_39 = pdemo1
      L26_40 = L25_39
      L25_39 = L25_39.play
      L25_39(L26_40)
      L25_39 = pdemo1
      L26_40 = L25_39
      L25_39 = L25_39.setCurrentFrame
      L27_41 = 0
      L25_39(L26_40, L27_41)
      L25_39 = print
      L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\145\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136"
      L25_39(L26_40)
      L25_39 = pdemo0
      L26_40 = L25_39
      L25_39 = L25_39.stop
      L27_41 = 0
      L25_39(L26_40, L27_41)
      L25_39 = pdemo0
      L26_40 = L25_39
      L25_39 = L25_39.reset
      L25_39(L26_40)
    end
    L25_39 = input
  until L25_39 == true
  L25_39 = HUD
  L26_40 = L25_39
  L25_39 = L25_39.pressIconGuide
  L25_39(L26_40)
  L25_39 = Sound
  L26_40 = L25_39
  L25_39 = L25_39.playSE
  L27_41 = "sys_gauge_success"
  L25_39(L26_40, L27_41)
  L25_39 = pdemo2
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo1
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo1
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = pdemo0
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = print
  L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\146\227\130\185\227\130\191\227\131\188\227\131\136"
  L25_39(L26_40)
  L25_39 = Player
  L26_40 = L25_39
  L25_39 = L25_39.setAction
  L27_41 = Player
  L27_41 = L27_41.kAction_Float
  L25_39(L26_40, L27_41)
  L25_39 = waitSeconds
  L26_40 = 1
  L25_39(L26_40)
  repeat
    L25_39 = print
    L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\146\229\134\141\231\148\159\231\181\130\228\186\134\229\190\133\227\129\161"
    L25_39(L26_40)
    L25_39 = wait
    L25_39()
    L25_39 = pdemo2
    L26_40 = L25_39
    L25_39 = L25_39.isEnd
    L25_39 = L25_39(L26_40)
  until L25_39
  L25_39 = hand_brain_hdl
  L26_40 = L25_39
  L25_39 = L25_39.bossHandChangeCut
  L27_41 = "cut01pre"
  L25_39 = L25_39(L26_40, L27_41)
  ret = L25_39
  L25_39 = Fn_captionView
  L26_40 = "ep01_03002"
  L25_39(L26_40)
  L25_39 = pdemo3
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo2
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo2
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L26_40 = L12_26
  L25_39 = L12_26.setVisible
  L27_41 = false
  L25_39(L26_40, L27_41)
  L25_39 = enmgen
  L26_40 = L25_39
  L25_39 = L25_39.setVisible
  L27_41 = false
  L25_39(L26_40, L27_41)
  repeat
    L25_39 = wait
    L25_39()
    L25_39 = pdemo3
    L26_40 = L25_39
    L25_39 = L25_39.isEnd
    L25_39 = L25_39(L26_40)
  until L25_39
  L26_40 = L12_26
  L25_39 = L12_26.setVisible
  L27_41 = true
  L25_39(L26_40, L27_41)
  L25_39 = pdemo4
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo3
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo3
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = print
  L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\147\227\130\185\227\130\191\227\131\188\227\131\136"
  L25_39(L26_40)
  L25_39 = resetPcPosNowait
  L26_40 = "locator2_reset_02"
  L27_41 = Player
  L27_41 = L27_41.kReset_Standing
  L25_39(L26_40, L27_41)
  repeat
    repeat
      L25_39 = print
      L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\147\229\134\141\231\148\159\231\181\130\228\186\134\229\190\133\227\129\161"
      L25_39(L26_40)
      L25_39 = wait
      L25_39()
      L25_39 = pdemo4
      L26_40 = L25_39
      L25_39 = L25_39.isEnd
      L25_39 = L25_39(L26_40)
    until L25_39
    wait_cnt = 0
    input = false
    L26_40 = L12_26
    L25_39 = L12_26.setVisible
    L27_41 = true
    L25_39(L26_40, L27_41)
    L25_39 = pdemo5
    L26_40 = L25_39
    L25_39 = L25_39.play
    L25_39(L26_40)
    L25_39 = pdemo5
    L26_40 = L25_39
    L25_39 = L25_39.setCurrentFrame
    L27_41 = 0
    L25_39(L26_40, L27_41)
    L25_39 = pdemo4
    L26_40 = L25_39
    L25_39 = L25_39.stop
    L27_41 = 0
    L28_42 = true
    L25_39(L26_40, L27_41, L28_42)
    L25_39 = pdemo4
    L26_40 = L25_39
    L25_39 = L25_39.reset
    L25_39(L26_40)
    L25_39 = print
    L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\148\239\188\191\239\188\145\227\130\185\227\130\191\227\131\188\227\131\136"
    L25_39(L26_40)
    L25_39 = enmgen
    L26_40 = L25_39
    L25_39 = L25_39.setVisible
    L27_41 = true
    L25_39(L26_40, L27_41)
    L25_39 = hand_brain_hdl
    L26_40 = L25_39
    L25_39 = L25_39.bossHandChangeCut
    L27_41 = "cut04"
    L25_39(L26_40, L27_41)
    L25_39 = wait
    L26_40 = 30
    L25_39(L26_40)
    L25_39 = Sound
    L26_40 = L25_39
    L25_39 = L25_39.playSE
    L27_41 = "pc1_528b"
    L28_42 = 1
    L29_43 = ""
    L25_39(L26_40, L27_41, L28_42, L29_43, L12_26)
    L25_39 = HUD
    L26_40 = L25_39
    L25_39 = L25_39.openIconGuide
    L27_41 = Pad
    L27_41 = L27_41.kButton_R1
    L25_39(L26_40, L27_41)
    L25_39 = wait
    L26_40 = icon_wait2
    L25_39(L26_40)
    L25_39 = pdemo5
    L26_40 = L25_39
    L25_39 = L25_39.getCurrentFrame
    L25_39 = L25_39(L26_40)
    wait_cnt = L25_39
    L25_39 = 71
    repeat
      L26_40 = wait
      L26_40()
      L26_40 = pdemo5
      L27_41 = L26_40
      L26_40 = L26_40.getCurrentFrame
      L26_40 = L26_40(L27_41)
      wait_cnt = L26_40
      L26_40 = HUD
      L27_41 = L26_40
      L26_40 = L26_40.isPressIconGuide
      L26_40 = L26_40(L27_41)
      input = L26_40
      L26_40 = print
      L27_41 = "R1\227\131\156\227\130\191\227\131\179\229\190\133\230\169\159\228\184\173"
      L28_42 = wait_cnt
      L26_40(L27_41, L28_42)
      L26_40 = input
      if L26_40 ~= true then
        L26_40 = wait_cnt
      end
    until L25_39 <= L26_40
    L26_40 = HUD
    L27_41 = L26_40
    L26_40 = L26_40.isPressIconGuide
    L26_40 = L26_40(L27_41)
    input = L26_40
    L26_40 = input
    if L26_40 == true then
      L26_40 = HUD
      L27_41 = L26_40
      L26_40 = L26_40.pressIconGuide
      L26_40(L27_41)
      L26_40 = Sound
      L27_41 = L26_40
      L26_40 = L26_40.playSE
      L28_42 = "sys_gauge_success"
      L26_40(L27_41, L28_42)
      L26_40 = print
      L27_41 = "\230\136\144\229\138\159\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
      L26_40(L27_41)
    end
    repeat
      L26_40 = pdemo5
      L27_41 = L26_40
      L26_40 = L26_40.getCurrentFrame
      L26_40 = L26_40(L27_41)
      wait_cnt = L26_40
      L26_40 = wait
      L26_40()
      L26_40 = wait_cnt
    until L25_39 < L26_40
    L26_40 = input
    if L26_40 == false then
      L26_40 = Sound
      L27_41 = L26_40
      L26_40 = L26_40.playSE
      L28_42 = "sys_alert_info"
      L29_43 = 1
      L26_40(L27_41, L28_42, L29_43)
      L26_40 = HUD
      L27_41 = L26_40
      L26_40 = L26_40.closeIconGuide
      L26_40(L27_41)
      L26_40 = Sound
      L27_41 = L26_40
      L26_40 = L26_40.playSE
      L28_42 = "pc1_011"
      L29_43 = 1
      L26_40(L27_41, L28_42, L29_43, "", L12_26)
      repeat
        L26_40 = wait
        L26_40()
        L26_40 = pdemo5
        L27_41 = L26_40
        L26_40 = L26_40.isEnd
        L26_40 = L26_40(L27_41)
      until L26_40
      L26_40 = Fn_blackout
      L27_41 = 0.6
      L26_40(L27_41)
      L26_40 = pdemo5
      L27_41 = L26_40
      L26_40 = L26_40.stop
      L26_40(L27_41)
      L26_40 = pdemo5
      L27_41 = L26_40
      L26_40 = L26_40.reset
      L26_40(L27_41)
      L26_40 = enmgen
      L27_41 = L26_40
      L26_40 = L26_40.setVisible
      L28_42 = false
      L26_40(L27_41, L28_42)
      L26_40 = pdemo4
      L27_41 = L26_40
      L26_40 = L26_40.play
      L26_40(L27_41)
      L26_40 = Fn_fadein
      L26_40()
    end
    L26_40 = print
    L27_41 = "\229\133\168\228\189\147\227\131\171\227\131\188\227\131\151"
    L26_40(L27_41)
    L26_40 = input
  until L26_40 == true
  L26_40 = L12_26
  L25_39 = L12_26.setVisible
  L27_41 = false
  L25_39(L26_40, L27_41)
  L25_39 = Fn_captionView
  L26_40 = "ep01_03003"
  L25_39(L26_40)
  L25_39 = enmgen
  L26_40 = L25_39
  L25_39 = L25_39.setVisible
  L27_41 = false
  L25_39(L26_40, L27_41)
  L25_39 = pdemo6
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo5
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo5
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = pdemo4
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = print
  L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\148\239\188\191\239\188\146\227\130\185\227\130\191\227\131\188\227\131\136\227\128\128\227\130\173\227\131\136\227\130\165\227\131\179\230\181\174\227\129\132\227\129\166\233\128\131\227\129\146\227\130\139"
  L25_39(L26_40)
  repeat
    L25_39 = wait
    L25_39()
    L25_39 = pdemo6
    L26_40 = L25_39
    L25_39 = L25_39.isEnd
    L25_39 = L25_39(L26_40)
  until L25_39
  L25_39 = hand_brain_hdl
  L26_40 = L25_39
  L25_39 = L25_39.setEnableHomingTarget
  L27_41 = false
  L25_39(L26_40, L27_41)
  L26_40 = L12_26
  L25_39 = L12_26.setVisible
  L27_41 = true
  L25_39(L26_40, L27_41)
  L25_39 = resetPcPosNowait
  L26_40 = "locator2_reset_00"
  L27_41 = Player
  L27_41 = L27_41.kReset_Floating
  L25_39(L26_40, L27_41)
  L25_39 = hand_brain_hdl
  L26_40 = L25_39
  L25_39 = L25_39.bossHandChangeCut
  L27_41 = "cut05t08"
  L25_39(L26_40, L27_41)
  L25_39 = enmgen
  L26_40 = L25_39
  L25_39 = L25_39.setVisible
  L27_41 = true
  L25_39(L26_40, L27_41)
  L25_39 = pdemo7
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo6
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo6
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = print
  L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\149\239\189\158\239\188\152\227\130\185\227\130\191\227\131\188\227\131\136\227\128\128\229\178\169\230\138\149\227\129\146\227\129\139\227\130\137\227\129\164\227\129\139\227\129\191\227\129\171\230\157\165\227\130\139\227\129\190\227\129\167"
  L25_39(L26_40)
  repeat
    repeat
      hit = false
      input = false
      repeat
        L25_39 = wait
        L25_39()
        L25_39 = hand_brain_hdl
        L26_40 = L25_39
        L25_39 = L25_39.getPlayMotionFrame
        L25_39 = L25_39(L26_40)
      until L25_39 > 100
      L25_39 = Sound
      L26_40 = L25_39
      L25_39 = L25_39.playSE
      L27_41 = "pc1_528a"
      L28_42 = 1
      L29_43 = ""
      L25_39(L26_40, L27_41, L28_42, L29_43, L12_26)
      L25_39 = print
      L26_40 = "\227\130\173\227\131\136\227\130\165\227\131\179\227\131\156\227\130\164\227\130\185"
      L25_39(L26_40)
      L25_39 = wait
      L26_40 = 15
      L25_39(L26_40)
      L25_39 = Camera
      L26_40 = L25_39
      L25_39 = L25_39.lookTo
      L27_41 = findGameObject2
      L28_42 = "Node"
      L29_43 = "locator2_aim_01"
      L27_41 = L27_41(L28_42, L29_43)
      L28_42 = L27_41
      L27_41 = L27_41.getWorldPos
      L27_41 = L27_41(L28_42)
      L28_42 = 0
      L29_43 = 0
      L25_39(L26_40, L27_41, L28_42, L29_43)
      L25_39 = HUD
      L26_40 = L25_39
      L25_39 = L25_39.openIconGuide
      L27_41 = Pad
      L27_41 = L27_41.kButton_RL
      L25_39(L26_40, L27_41)
      L25_39 = wait
      L26_40 = icon_wait3
      L25_39(L26_40)
      L25_39 = kick_unseal
      L25_39()
      L25_39 = kickonece
      L25_39()
      L25_39 = 0
      L26_40 = hand_brain_hdl
      L27_41 = L26_40
      L26_40 = L26_40.getPlayMotionFrame
      L26_40 = L26_40(L27_41)
      L26_40 = 40 + L26_40
      repeat
        L27_41 = hand_brain_hdl
        L28_42 = L27_41
        L27_41 = L27_41.getPlayMotionFrame
        L27_41 = L27_41(L28_42)
        L25_39 = L27_41
        L27_41 = Player
        L28_42 = L27_41
        L27_41 = L27_41.getAction
        L27_41 = L27_41(L28_42)
        L28_42 = Player
        L28_42 = L28_42.kAction_AnyGravKick
        if L27_41 ~= L28_42 then
          L27_41 = HUD
          L28_42 = L27_41
          L27_41 = L27_41.isPressIconGuide
          L27_41 = L27_41(L28_42)
        elseif L27_41 then
          input = true
        end
        L27_41 = input
        if L27_41 == true then
          L27_41 = Sound
          L28_42 = L27_41
          L27_41 = L27_41.playSE
          L29_43 = "sys_gauge_success"
          L27_41(L28_42, L29_43)
          L27_41 = print
          L28_42 = "\230\136\144\229\138\159\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
          L27_41(L28_42)
          L27_41 = HUD
          L28_42 = L27_41
          L27_41 = L27_41.pressIconGuide
          L27_41(L28_42)
        end
        L27_41 = print
        L28_42 = "\229\178\169\229\163\138\227\129\151\229\190\133\227\129\161"
        L29_43 = L25_39
        L27_41(L28_42, L29_43)
        L27_41 = wait
        L27_41()
        L27_41 = input
      until L27_41 == true or L26_40 <= L25_39
      L27_41 = Player
      L28_42 = L27_41
      L27_41 = L27_41.getAction
      L27_41 = L27_41(L28_42)
      L28_42 = Player
      L28_42 = L28_42.kAction_AnyGravKick
      if L27_41 ~= L28_42 then
        L27_41 = HUD
        L28_42 = L27_41
        L27_41 = L27_41.isPressIconGuide
        L27_41 = L27_41(L28_42)
      elseif L27_41 then
        input = true
      end
      L27_41 = input
      if L27_41 == false then
        L27_41 = HUD
        L28_42 = L27_41
        L27_41 = L27_41.closeIconGuide
        L27_41(L28_42)
        L27_41 = Sound
        L28_42 = L27_41
        L27_41 = L27_41.playSE
        L29_43 = "sys_alert_info"
        L27_41(L28_42, L29_43, 1)
      end
      L27_41 = kick_seal
      L27_41()
      repeat
        L27_41 = wait
        L27_41()
        L27_41 = hand_brain_hdl
        L28_42 = L27_41
        L27_41 = L27_41.getPlayMotionFrame
        L27_41 = L27_41(L28_42)
        if not (L27_41 > 184) then
          L27_41 = hand_brain_hdl
          L28_42 = L27_41
          L27_41 = L27_41.getArmorNum
          L27_41 = L27_41(L28_42)
        end
      until L27_41 <= 0
      L27_41 = hand_brain_hdl
      L28_42 = L27_41
      L27_41 = L27_41.getPlayMotionFrame
      L27_41 = L27_41(L28_42)
      break_time = L27_41
      L27_41 = kickonecekill
      L27_41()
      L27_41 = print
      L28_42 = "\229\178\169\229\163\138\227\129\151\231\181\130\227\130\143\227\130\138"
      L27_41(L28_42)
      L27_41 = input
      if L27_41 == false then
        L27_41 = print
        L28_42 = "\229\178\169\229\163\138\227\129\151\229\164\177\230\149\151\229\135\166\231\144\134"
        L27_41(L28_42)
        L27_41 = ep01GetLocatorPos
        L28_42 = "locator2_01"
        L27_41 = L27_41(L28_42)
        L28_42 = Fn_getPlayerWorldTransform
        L28_42 = L28_42()
        L29_43 = NormalizeVector
        L29_43 = L29_43(L28_42 - L27_41)
        Player:applyImpactDamage(L27_41, L29_43, 0, false)
        Sound:playSE("pc1_011", 1, "", L12_26)
        Fn_blackout(0.6)
        viewtaskkill()
        pdemo7:stop()
        pdemo7:reset()
        hand_brain_hdl:setEnableHomingTarget(false)
        Fn_resetPcPos("locator2_reset_00", Player.kReset_Floating)
        hand_brain_hdl:bossHandChangeCut("cut05t08")
        pdemo7:play()
        pdemo7:setCurrentFrame(0)
        print("\227\130\171\227\131\131\227\131\136\239\188\149\239\189\158\239\188\152\227\130\185\227\130\191\227\131\188\227\131\136")
        Fn_fadein()
      else
        repeat
          L27_41 = wait
          L27_41()
          L27_41 = hand_brain_hdl
          L28_42 = L27_41
          L27_41 = L27_41.getPlayMotionFrame
          L27_41 = L27_41(L28_42)
          if not (L27_41 > 200) then
            L27_41 = hand_brain_hdl
            L28_42 = L27_41
            L27_41 = L27_41.getArmorNum
            L27_41 = L27_41(L28_42)
          end
        until L27_41 <= 0
      end
      _time_cnt2 = 0
      limit_02 = 33
      L27_41 = hand_brain_hdl
      L28_42 = L27_41
      L27_41 = L27_41.getArmorNum
      L27_41 = L27_41(L28_42)
      if L27_41 <= 0 then
        L27_41 = Player
        L28_42 = L27_41
        L27_41 = L27_41.shiftGravity
        L29_43 = Vector
        L29_43 = L29_43(0.7653, 0.0278, 0)
        L27_41(L28_42, L29_43, 0)
        L27_41 = pdemo7
        L28_42 = L27_41
        L27_41 = L27_41.stop
        L27_41(L28_42)
        L27_41 = wait
        L28_42 = 3
        L27_41(L28_42)
        L27_41 = Camera
        L28_42 = L27_41
        L27_41 = L27_41.lookTo
        L29_43 = findGameObject2
        L29_43 = L29_43("Node", "locator2_aim_01")
        L29_43 = L29_43.getWorldPos
        L29_43 = L29_43(L29_43)
        L27_41(L28_42, L29_43, 0, 0)
        L27_41 = print
        L28_42 = "\227\130\171\227\131\161\227\131\169\227\131\170\227\130\187\227\131\131\227\131\136"
        L27_41(L28_42)
        L27_41 = Fn_lookAtObject
        L28_42 = "enemy_boss_hand"
        L29_43 = 0
        L27_41 = L27_41(L28_42, L29_43, "loc_setCore01")
        view_task = L27_41
        repeat
          L27_41 = wait
          L27_41()
          L27_41 = hand_brain_hdl
          L28_42 = L27_41
          L27_41 = L27_41.getPlayMotionFrame
          L27_41 = L27_41(L28_42)
        until L27_41 > 200
        L27_41 = hand_brain_hdl
        L28_42 = L27_41
        L27_41 = L27_41.setEnableHomingTarget
        L29_43 = true
        L27_41(L28_42, L29_43)
        repeat
          L27_41 = wait
          L27_41()
          L27_41 = hand_brain_hdl
          L28_42 = L27_41
          L27_41 = L27_41.getPlayMotionFrame
          L27_41 = L27_41(L28_42)
        until L27_41 > 242
        L27_41 = Sound
        L28_42 = L27_41
        L27_41 = L27_41.playSE
        L29_43 = "pc1_527c"
        L27_41(L28_42, L29_43, 1, "", L12_26)
        L27_41 = HUD
        L28_42 = L27_41
        L27_41 = L27_41.openIconGuide
        L29_43 = Pad
        L29_43 = L29_43.kButton_RL
        L27_41(L28_42, L29_43)
        L27_41 = wait
        L28_42 = icon_wait4
        L27_41(L28_42)
        L27_41 = kick_unseal
        L27_41()
        L27_41 = kickonece
        L27_41()
        input = false
        repeat
          L27_41 = _time_cnt2
          L27_41 = L27_41 + 1
          _time_cnt2 = L27_41
          L27_41 = Player
          L28_42 = L27_41
          L27_41 = L27_41.getAction
          L27_41 = L27_41(L28_42)
          L28_42 = Player
          L28_42 = L28_42.kAction_AnyGravKick
          if L27_41 ~= L28_42 then
            L27_41 = HUD
            L28_42 = L27_41
            L27_41 = L27_41.isPressIconGuide
            L27_41 = L27_41(L28_42)
          elseif L27_41 then
            input = true
          end
          L27_41 = print
          L28_42 = "\227\131\149\227\131\172\227\131\188\227\131\160"
          L29_43 = pdemo7
          L29_43 = L29_43.getCurrentFrame
          L29_43 = L29_43(L29_43, 0)
          L27_41(L28_42, L29_43, L29_43(L29_43, 0))
          L27_41 = print
          L28_42 = "\227\131\156\227\130\191\227\131\179\230\138\188\227\129\151\229\190\133\227\129\161"
          L29_43 = _time_cnt2
          L27_41(L28_42, L29_43)
          L27_41 = wait
          L27_41()
          L27_41 = input
          if L27_41 ~= true then
            L27_41 = _time_cnt2
            L28_42 = limit_02
          end
        until L27_41 >= L28_42
        L27_41 = Player
        L28_42 = L27_41
        L27_41 = L27_41.getAction
        L27_41 = L27_41(L28_42)
        L28_42 = Player
        L28_42 = L28_42.kAction_AnyGravKick
        if L27_41 ~= L28_42 then
          L27_41 = HUD
          L28_42 = L27_41
          L27_41 = L27_41.isPressIconGuide
          L27_41 = L27_41(L28_42)
        elseif L27_41 then
          input = true
        end
        L27_41 = input
        if L27_41 == true then
          L27_41 = HUD
          L28_42 = L27_41
          L27_41 = L27_41.pressIconGuide
          L27_41(L28_42)
          L27_41 = Sound
          L28_42 = L27_41
          L27_41 = L27_41.playSE
          L29_43 = "sys_gauge_success"
          L27_41(L28_42, L29_43)
          L27_41 = print
          L28_42 = "\230\136\144\229\138\159\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
          L27_41(L28_42)
          while true do
            L27_41 = hit
            if L27_41 == false then
              L27_41 = _time_cnt2
            end
            if L27_41 < 70 then
              L27_41 = _time_cnt2
              L27_41 = L27_41 + 1
              _time_cnt2 = L27_41
              L27_41 = hand_brain_hdl
              L28_42 = L27_41
              L27_41 = L27_41.bossHandIsDamageCut
              L29_43 = "cut05t08"
              L27_41 = L27_41(L28_42, L29_43)
              hit = L27_41
              L27_41 = print
              L28_42 = "\227\131\156\227\130\185\227\129\171\227\130\173\227\131\131\227\130\175\227\129\140\229\189\147\227\129\159\227\130\139\227\129\174\229\190\133\227\129\161"
              L27_41(L28_42)
              L27_41 = wait
              L27_41()
            end
          end
        end
        L27_41 = input
        if L27_41 ~= false then
          L27_41 = _time_cnt2
        elseif L27_41 >= 70 then
          L27_41 = print
          L28_42 = "\229\164\177\230\149\151\229\135\166\231\144\134"
          L27_41(L28_42)
          L27_41 = viewtaskkill
          L27_41()
          L27_41 = HUD
          L28_42 = L27_41
          L27_41 = L27_41.closeIconGuide
          L27_41(L28_42)
          L27_41 = Sound
          L28_42 = L27_41
          L27_41 = L27_41.playSE
          L29_43 = "sys_alert_info"
          L27_41(L28_42, L29_43, 1)
          L27_41 = Fn_userCtrlAllOff
          L27_41()
          L27_41 = print
          L28_42 = "\229\178\169\227\129\175\229\163\138\227\129\155\227\129\159\227\129\145\227\129\169\230\141\149\227\129\190\227\129\163\227\129\159"
          L27_41(L28_42)
          L27_41 = CloneDebri
          L28_42 = L27_41
          L27_41 = L27_41.resetIdlingCloneDebriAll
          L27_41(L28_42)
          repeat
            L27_41 = wait
            L27_41()
            L27_41 = hand_brain_hdl
            L28_42 = L27_41
            L27_41 = L27_41.getPlayMotionFrame
            L27_41 = L27_41(L28_42)
            L28_42 = break_time
            L28_42 = L28_42 + 120
          until L27_41 > L28_42
          L27_41 = ep01GetLocatorPos
          L28_42 = "locator2_01"
          L27_41 = L27_41(L28_42)
          L28_42 = Fn_blackout
          L29_43 = 0.6
          L28_42(L29_43)
          L28_42 = Sound
          L29_43 = L28_42
          L28_42 = L28_42.playSE
          L28_42(L29_43, "pc1_011_dark", 1, "", L12_26)
          L28_42 = waitSeconds
          L29_43 = 0.5
          L28_42(L29_43)
          L28_42 = pdemo7
          L29_43 = L28_42
          L28_42 = L28_42.stop
          L28_42(L29_43)
          L28_42 = pdemo7
          L29_43 = L28_42
          L28_42 = L28_42.reset
          L28_42(L29_43)
          L28_42 = hand_brain_hdl
          L29_43 = L28_42
          L28_42 = L28_42.setEnableHomingTarget
          L28_42(L29_43, false)
          L28_42 = Fn_resetPcPos
          L29_43 = "locator2_reset_00"
          L28_42(L29_43, Player.kReset_Floating)
          L28_42 = hand_brain_hdl
          L29_43 = L28_42
          L28_42 = L28_42.bossHandChangeCut
          L28_42(L29_43, "cut05t08")
          L28_42 = pdemo7
          L29_43 = L28_42
          L28_42 = L28_42.play
          L28_42(L29_43)
          L28_42 = pdemo7
          L29_43 = L28_42
          L28_42 = L28_42.setCurrentFrame
          L28_42(L29_43, 0)
          L28_42 = print
          L29_43 = "\227\130\171\227\131\131\227\131\136\239\188\149\239\189\158\239\188\152\227\130\185\227\130\191\227\131\188\227\131\136"
          L28_42(L29_43)
          L28_42 = Fn_fadein
          L28_42()
        end
      end
      L27_41 = hand_brain_hdl
      L28_42 = L27_41
      L27_41 = L27_41.getArmorNum
      L27_41 = L27_41(L28_42)
    until L27_41 <= 0
    L27_41 = hit
  until L27_41 == true
  L25_39 = HUD
  L26_40 = L25_39
  L25_39 = L25_39.pressIconGuide
  L25_39(L26_40)
  L25_39 = hand_brain_hdl
  L26_40 = L25_39
  L25_39 = L25_39.bossHandChangeCut
  L27_41 = "cut08_damage_00_add"
  L25_39(L26_40, L27_41)
  L25_39 = wait
  L26_40 = 6
  L25_39(L26_40)
  L25_39 = enmgen
  L26_40 = L25_39
  L25_39 = L25_39.setVisible
  L27_41 = false
  L25_39(L26_40, L27_41)
  L25_39 = pdemo8
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo8
  L26_40 = L25_39
  L25_39 = L25_39.setCurrentFrame
  L25_39(L26_40)
  L25_39 = resetPcPosNowait
  L26_40 = "locator2_reset_20"
  L27_41 = Player
  L27_41 = L27_41.kReset_Floating
  L25_39(L26_40, L27_41)
  L25_39 = pdemo7
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo7
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = print
  L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\153\227\130\185\227\130\191\227\131\188\227\131\136"
  L25_39(L26_40)
  L25_39 = hand_brain_hdl
  L26_40 = L25_39
  L25_39 = L25_39.setEnableHomingTarget
  L27_41 = false
  L25_39(L26_40, L27_41)
  L25_39 = hand_brain_hdl
  L26_40 = L25_39
  L25_39 = L25_39.bossHandChangeCut
  L27_41 = "cut10"
  L25_39(L26_40, L27_41)
  repeat
    L25_39 = print
    L26_40 = "\227\130\171\227\131\131\227\131\136\239\188\153\227\131\149\227\131\172\227\131\188\227\131\160"
    L27_41 = pdemo8
    L28_42 = L27_41
    L27_41 = L27_41.getCurrentFrame
    L29_43 = L27_41(L28_42)
    L25_39(L26_40, L27_41, L28_42, L29_43, L27_41(L28_42))
    L25_39 = wait
    L25_39()
    L25_39 = pdemo8
    L26_40 = L25_39
    L25_39 = L25_39.isEnd
    L25_39 = L25_39(L26_40)
  until L25_39
  L25_39 = resetPcPosNowait
  L26_40 = "locator2_reset_01"
  L27_41 = Player
  L27_41 = L27_41.kReset_Floating
  L25_39(L26_40, L27_41)
  L25_39 = enmgen
  L26_40 = L25_39
  L25_39 = L25_39.setVisible
  L27_41 = true
  L25_39(L26_40, L27_41)
  L25_39 = pdemo9
  L26_40 = L25_39
  L25_39 = L25_39.play
  L25_39(L26_40)
  L25_39 = pdemo8
  L26_40 = L25_39
  L25_39 = L25_39.stop
  L27_41 = 0
  L25_39(L26_40, L27_41)
  L25_39 = pdemo8
  L26_40 = L25_39
  L25_39 = L25_39.try_term
  L25_39(L26_40)
  L25_39 = print
  L26_40 = "\227\130\171\227\131\131\227\131\13610\227\130\185\227\130\191\227\131\188\227\131\136"
  L25_39(L26_40)
  L25_39 = Sound
  L26_40 = L25_39
  L25_39 = L25_39.playSE
  L27_41 = "pc1_530b"
  L28_42 = 1
  L29_43 = ""
  L25_39(L26_40, L27_41, L28_42, L29_43, L12_26)
  L25_39 = Fn_captionView
  L26_40 = "ep01_03022"
  L27_41 = 2
  L25_39(L26_40, L27_41)
  L25_39 = waitSeconds
  L26_40 = 2
  L25_39(L26_40)
  L25_39 = Fn_captionViewEnd
  L25_39()
  L25_39 = HUD
  L26_40 = L25_39
  L25_39 = L25_39.info
  L27_41 = "ep01_info_01"
  L28_42 = false
  L25_39(L26_40, L27_41, L28_42)
  L25_39 = FatalMarker
  L25_39 = L25_39.create
  L26_40 = kFATAL_TYPE_EMP
  L25_39 = L25_39(L26_40)
  L27_41 = L25_39
  L26_40 = L25_39.set
  L28_42 = hand_hdl
  L29_43 = "loc_setCore01"
  L26_40(L27_41, L28_42, L29_43, false)
  L27_41 = L25_39
  L26_40 = L25_39.run
  L26_40(L27_41)
  repeat
    L26_40 = wait
    L26_40()
    L27_41 = L25_39
    L26_40 = L25_39.isFatalFinish
    L26_40 = L26_40(L27_41)
  until L26_40
  L26_40 = Fn_whiteout
  L27_41 = 0.3
  L26_40(L27_41)
  L28_42 = "kill"
  L27_41 = L25_39
  L26_40 = L25_39[L28_42]
  L26_40(L27_41)
  L25_39 = nil
  L27_41 = L11_25
  L26_40 = L11_25.setDriftEnable
  L28_42 = true
  L26_40(L27_41, L28_42)
  L26_40 = "Fn_setNextMissionFlag"
  L26_40 = _ENV[L26_40]
  L26_40()
  L26_40 = "Fn_nextMission"
  L26_40 = _ENV[L26_40]
  L26_40()
  L26_40 = "Fn_exitSandbox"
  L26_40 = _ENV[L26_40]
  L26_40()
end
function Finalize()
  Sound:stopSEHandle(storm_in)
  kick_unseal()
  if Fn_getPlayer() then
    Player:setParameter(Player.kParam_GravFallSpeed)
    gravity_unseal(true, true)
    Player:setSpecialTuning(Player.kSpecialTuning_None)
  end
  HUD:sightMarkerSetDisable(false)
  HUD:closeIconGuide()
  Camera:setControl(Camera.kPlayer, Camera.kControl_Gyro, true)
  Camera:setControl(Camera.kPlayer, Camera.kControl_ResetView, true)
  Player:setControl(Player.kControl_Stick, true)
end
function navi_on()
  local L0_44, L1_45
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pc_gavitykick_wait()
  while Player:getAction() ~= Player.kAction_AnyGravKick do
    print("gravitykick_wait")
    wait()
  end
end
function gravity_unseal(A0_46, A1_47)
  local L2_48, L3_49
  L2_48 = {}
  L2_48.r_stick = A1_47
  L2_48.l_stick = A0_46
  L3_49 = {
    Player.kAbility_GravityShift
  }
  Fn_unLockPlayerAbility(L3_49, L2_48)
  print("\233\135\141\229\138\155\229\164\137\229\140\150\232\167\163\230\148\190")
end
function kick_seal()
  local L0_50, L1_51
  L0_50 = {}
  L0_50.r_stick = true
  L0_50.l_stick = true
  L1_51 = {
    Player.kAbility_GravityKick
  }
  Fn_lockPlayerAbility(L1_51, L0_50)
  print("\227\130\173\227\131\131\227\130\175\229\176\129\229\141\176")
end
function kick_unseal()
  local L0_52, L1_53
  L0_52 = Fn_userCtrlAllOff
  L0_52()
  L0_52 = {}
  L0_52.r_stick = false
  L0_52.l_stick = false
  L1_53 = {
    Player.kAbility_GravityKick
  }
  Fn_unLockPlayerAbility(L1_53, L0_52)
  print("\227\130\173\227\131\131\227\130\175\232\167\163\230\148\190")
end
function viewtaskkill()
  if view_task ~= nil then
    view_task:abort()
    view_task = nil
  end
end
function kickonece()
  kick_onece = invokeTask(function()
    pc_gavitykick_wait()
    kick_seal()
    Player:setControl(Player.kControl_Stick, false)
  end)
end
function kickonecekill()
  if kick_onece ~= nil then
    kick_onece:abort()
    kick_onece = nil
    print("\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\229\176\129\229\141\176\227\129\174\229\135\166\231\144\134\232\167\163\233\153\164")
  end
end
function ep01GetLocatorPos(A0_54)
  return findGameObject2("Node", A0_54):getWorldTransform()
end
function resetPcPosNowait(A0_55, A1_56)
  local L2_57, L3_58, L4_59, L5_60, L6_61
  L2_57 = nil
  L3_58 = A0_55
  L4_59 = type
  L5_60 = A0_55
  L4_59 = L4_59(L5_60)
  if L4_59 == "string" then
    L4_59 = findGameObject2
    L5_60 = "Node"
    L6_61 = A0_55
    L4_59 = L4_59(L5_60, L6_61)
    L2_57 = L4_59
  else
    L2_57 = A0_55
    if A0_55 then
      L5_60 = A0_55
      L4_59 = A0_55.getName
      L4_59 = L4_59(L5_60)
      L3_58 = L4_59
    end
  end
  if L2_57 ~= nil then
    L4_59 = Player
    L5_60 = L4_59
    L4_59 = L4_59.getPuppet
    L4_59 = L4_59(L5_60)
    L6_61 = L2_57
    L5_60 = L2_57.getWorldTransform
    L6_61 = L5_60(L6_61)
    if A1_56 == nil then
      Player:reset(Player.kReset_Standing, L5_60, L6_61)
    else
      Player:reset(A1_56, L5_60, L6_61)
    end
    print(g_own:getName() .. " pc pos > " .. tostring(L5_60))
    print(g_own:getName() .. " pc rot > " .. tostring(L6_61))
    print(g_own:getName() .. " area loading...")
    _accessIndicatorBegin()
    while Area:isLoading() do
      wait()
    end
    _accessIndicatorEnd()
    print(g_own:getName() .. " area load finish!!")
    if GameDatabase:get(ggd.Debug__AreaDrift) == true and GameDatabase:get(ggd.GlobalSystemFlags__AreaDrift) == true then
      Area:setAnimMoveDriftEnable(true, true, true)
      print(" < plr com > move area")
    end
  elseif L3_58 then
    L4_59 = print
    L5_60 = " < plr com > Fn_resetPcPos\239\188\154"
    L6_61 = L3_58
    L5_60 = L5_60 .. L6_61 .. "\227\129\174\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
    L4_59(L5_60)
  else
    L4_59 = print
    L5_60 = " < plr com > Fn_resetPcPos\239\188\154\231\172\172\228\184\128\229\188\149\230\149\176\227\129\171\230\157\165\227\129\166\227\129\132\227\130\139\229\128\164\232\135\170\228\189\147\227\129\140nil\227\129\167\227\129\153"
    L4_59(L5_60)
  end
end
