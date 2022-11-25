dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/ep27_common.lua")
enmgen2_ep27a = {
  onEnter = function(A0_0)
    print("ENTER")
  end,
  onLeave = function(A0_1)
    print("LEAVE")
  end,
  onObjectDead = function(A0_2, A1_3)
    print("DEAD = " .. A1_3:getName())
  end,
  onObjectAsh = function(A0_4, A1_5)
    print("Ash = " .. A1_5:getName())
    A0_4:getSpecTable().enemyDeadNum = A0_4:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_6)
    local L1_7
    L1_7 = A0_6.enemyDeadNum
    return L1_7
  end
}
_sdemo1 = nil
_sdemo2 = nil
_sdemo3 = nil
_bt_gen = {}
_mob_hdl = {}
_eug_fri_hdl = {}
_puppet_tbl = {}
_fan_table = {}
_next_phase = false
_damage = false
_factory_navi = nil
_yumemi_navi = nil
_area_ctrl = nil
_fan_cap = {}
_mot_task_tbl = {}
_event_mot = {}
_bt_mot = {}
_crowfan_act = false
_CUT1_FRAME = 253
function Initialize()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16
  L0_8 = Font
  L0_8 = L0_8.openTextSet
  L0_8(L1_9, L2_10)
  L0_8 = Fn_disableCostumeChange
  L0_8(L1_9)
  L0_8 = Fn_userCtrlOff
  L0_8()
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = findGameObject2
  L0_8 = L0_8(L1_9, L2_10)
  _factory_navi = L0_8
  L0_8 = findGameObject2
  L0_8 = L0_8(L1_9, L2_10)
  _yumemi_navi = L0_8
  L0_8 = {
    L1_9,
    L2_10,
    L3_11,
    L4_12,
    L5_13
  }
  L1_9.name = "kaj01"
  L1_9.type = "kaj01"
  L1_9.node = "locator2_27a_kaj01"
  L1_9.active = false
  L2_10.name = "bul01"
  L2_10.type = "bul01"
  L2_10.node = "locator2_27a_bul01"
  L2_10.active = false
  L3_11.name = "auj01"
  L3_11.type = "auj01"
  L3_11.node = "locator2_27a_auj01_1"
  L3_11.active = false
  L3_11.disable_collision = true
  L4_12.name = "fan01"
  L4_12.type = "man05"
  L4_12.node = "locator2_crowfan_01"
  L4_12.active = false
  L5_13.name = "fan02"
  L5_13.type = "man08"
  L5_13.node = "locator2_crowfan_02"
  L5_13.active = false
  L1_9(L2_10)
  for L4_12, L5_13 in L1_9(L2_10) do
    L7_15 = L5_13.name
    L8_16 = Fn_findNpcPuppet
    L8_16 = L8_16(L5_13.name)
    L6_14[L7_15] = L8_16
  end
  L2_10.name = "bt_mob1"
  L2_10.type = "thug04"
  L2_10.node = "locator2_gorotsuki_01"
  L3_11.name = "bt_mob2"
  L3_11.type = "thug05"
  L3_11.node = "locator2_gorotsuki_02"
  _bt_gen = L2_10
  L2_10.attack_00 = "man27_attack_00"
  L2_10.attack_01 = "man27_attack_01"
  L2_10.damage_small = "man27_damage_small_f_00"
  L2_10.walk_fighting = "man27_walk_fighting_00"
  L2_10.walk_b_fighting = "man27_walk_b_fighting_00"
  L2_10.stay_fighting = "man27_stay_fighting_00"
  _bt_mot = L2_10
  L2_10(L3_11, L4_12)
  L2_10(L3_11, L4_12)
  L3_11.name = "mobwom"
  L3_11.type = "wom01"
  L3_11.node = "locator2_wom_near_fightingmans"
  L4_12.name = "wom38"
  L4_12.type = "wom38"
  L4_12.node = "locator2_wom38"
  L5_13.name = "wom41"
  L5_13.type = "wom41"
  L5_13.node = "locator2_wom41"
  L6_14.name = "wom42"
  L6_14.type = "wom42"
  L6_14.node = "locator2_wom42"
  L7_15 = {}
  L7_15.name = "man26"
  L7_15.type = "man26"
  L7_15.node = "locator2_man26"
  L8_16 = {}
  L8_16.name = "man64"
  L8_16.type = "man64"
  L8_16.node = "locator2_man64"
  _mob_hdl = L3_11
  for L6_14, L7_15 in L3_11(L4_12) do
    L8_16 = _puppet_tbl
    L8_16[L6_14] = Fn_findNpcPuppet(L7_15)
  end
  L4_12.name = "eug01"
  L4_12.type = "eug01"
  L4_12.node = "locator2_27a_eug01"
  L4_12.active = false
  L5_13.name = "kid03"
  L5_13.type = "kid03"
  L5_13.node = "locator2_27a_kid03"
  L5_13.active = false
  L6_14.name = "kid02"
  L6_14.type = "kid02"
  L6_14.node = "locator2_27a_kid02"
  L6_14.active = false
  L7_15 = {}
  L7_15.name = "kid01"
  L7_15.type = "kid01"
  L7_15.node = "locator2_27a_kid01"
  L7_15.active = false
  L7_15.disable_collision = true
  _eug_fri_hdl = L4_12
  for L7_15, L8_16 in L4_12(L5_13) do
    _puppet_tbl[L7_15] = Fn_findNpcPuppet(L8_16)
  end
  L4_12.run_stop_ep27_00 = "kaj01_run_stop_ep27_00"
  L4_12.drunk_ep27_00 = "auj01_drunk_ep27_00"
  L4_12.talk_ep27_00 = "kid01_talk_ep27_00"
  L4_12.talk_ep27_01 = "kid01_talk_ep27_01"
  _event_mot = L4_12
  L4_12(L5_13, L6_14)
  L4_12(L5_13, L6_14)
  L4_12(L5_13, L6_14)
  L4_12(L5_13, L6_14)
  L5_13.name = "f1_01"
  L5_13.type = "wom38"
  L5_13.node = "locator2_1_01"
  L5_13.active = false
  L5_13.color_variation = 1
  L5_13.hair_variation = 0
  L6_14.name = "f1_02"
  L6_14.type = "wom39"
  L6_14.node = "locator2_1_02"
  L6_14.active = false
  L6_14.color_variation = 0
  L6_14.hair_variation = 0
  L7_15 = {}
  L7_15.name = "f1_03"
  L7_15.type = "wom40"
  L7_15.node = "locator2_1_03"
  L7_15.active = false
  L7_15.color_variation = 2
  L7_15.hair_variation = 1
  L8_16 = {}
  L8_16.name = "f1_04"
  L8_16.type = "wom40"
  L8_16.node = "locator2_1_04"
  L8_16.active = false
  L8_16.color_variation = 3
  L8_16.hair_variation = 1
  _fan_table = L4_12
  L4_12(L5_13)
  L7_15 = "cc_a_root"
  L7_15 = {}
  L7_15.camera = true
  L7_15.scene_param = false
  _polydemo = L4_12
  L7_15 = "cc_a_root"
  L7_15 = {}
  L7_15.camera = true
  L7_15.scene_param = false
  _polydemo2 = L4_12
  L7_15 = "id_a_root"
  L7_15 = {}
  L7_15.camera = true
  L7_15.scene_param = false
  _polydemo3 = L4_12
  _area_ctrl = L4_12
  L4_12.velocity = 25
  L7_15 = L4_12
  L5_13(L6_14, L7_15)
  L7_15 = "ep27_00101"
  L8_16 = "ep27_00102"
  _fan_cap = L5_13
  L7_15 = "w20_001"
  L8_16 = "w21_001"
  _fan_voi = L5_13
  L5_13(L6_14)
  _sdemo2 = L5_13
  _sdemo3 = L5_13
  L7_15 = ggd
  L7_15 = L7_15.Savedata__Menu__MenuUnlock__TopMenuSaveLoad
  L8_16 = true
  L5_13(L6_14, L7_15, L8_16)
  L7_15 = "ep27"
  L5_13(L6_14, L7_15)
end
function Ingame()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34, L18_35, L19_36, L20_37, L21_38, L22_39, L23_40, L24_41, L25_42, L26_43, L27_44, L28_45, L29_46, L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56
  L0_17 = {
    L1_18,
    L2_19,
    L3_20,
    L4_21,
    L5_22,
    L6_23,
    L7_24,
    L8_25,
    L9_26,
    L10_27,
    L11_28,
    L12_29,
    L13_30,
    L14_31,
    L15_32,
    L16_33
  }
  L1_18 = {}
  L1_18.name = "syd"
  L1_18.pos = "LT"
  L1_18.chara = "ui_chara_3"
  L1_18.cv = "ui_cv_3"
  L2_19.name = "kaj"
  L2_19.pos = "RT"
  L2_19.chara = "ui_chara_4"
  L2_19.cv = "ui_cv_4"
  L3_20.name = "bul"
  L3_20.pos = "RC2"
  L3_20.chara = "ui_chara_5"
  L3_20.cv = "ui_cv_5"
  L4_21.name = "adi"
  L4_21.pos = "RB"
  L4_21.chara = "ui_chara_12"
  L4_21.cv = "ui_cv_12"
  L5_22 = {}
  L5_22.name = "auj"
  L5_22.pos = "LC2"
  L5_22.chara = "ui_chara_6"
  L5_22.cv = "ui_cv_6"
  L6_23 = {}
  L6_23.name = "eug"
  L6_23.pos = "LB"
  L6_23.chara = "ui_chara_7"
  L6_23.cv = "ui_cv_7"
  L7_24 = {}
  L7_24.name = "gad"
  L7_24.pos = "LT"
  L7_24.chara = "ui_chara_8"
  L7_24.cv = "ui_cv_8"
  L8_25 = {}
  L8_25.name = "cya"
  L8_25.pos = "LC"
  L8_25.chara = "ui_chara_9"
  L8_25.cv = "ui_cv_9"
  L9_26 = {}
  L9_26.name = "aki"
  L9_26.pos = "RT"
  L9_26.chara = "ui_chara_15"
  L9_26.cv = "ui_cv_15"
  L10_27 = {}
  L10_27.name = "bit"
  L10_27.pos = "RB"
  L10_27.chara = "ui_chara_16"
  L10_27.cv = "ui_cv_16"
  L11_28 = {}
  L11_28.name = "bra"
  L11_28.pos = "RT"
  L11_28.chara = "ui_chara_10"
  L11_28.cv = "ui_cv_10"
  L12_29 = {}
  L12_29.name = "kal"
  L12_29.pos = "LT"
  L12_29.chara = "ui_chara_11"
  L12_29.cv = "ui_cv_11"
  L13_30 = {}
  L13_30.name = "uni"
  L13_30.pos = "RT"
  L13_30.chara = "ui_chara_13"
  L13_30.cv = "ui_cv_13"
  L14_31 = {}
  L14_31.name = "per"
  L14_31.pos = "RB"
  L14_31.chara = "ui_chara_14"
  L14_31.cv = "ui_cv_14"
  L15_32 = {}
  L15_32.name = "cai"
  L15_32.pos = "LB"
  L15_32.chara = "ui_chara_23"
  L15_32.cv = "ui_cv_23"
  L16_33 = {}
  L16_33.name = "xer"
  L16_33.pos = "LT"
  L16_33.chara = "ui_chara_24"
  L16_33.cv = "ui_cv_24"
  L1_18 = {}
  L1_18.degree_h = 160
  L1_18.degree_v = 110
  L1_18.in_length = 35
  L1_18.out_length = 50
  L1_18.valid = true
  L1_18.watchTarget = true
  for L5_22, L6_23 in L2_19(L3_20) do
    L8_25 = L6_23
    L7_24 = L6_23.setSightParam
    L9_26 = L1_18
    L7_24(L8_25, L9_26)
  end
  L1_18.degree_h = 50
  L1_18.degree_v = 85
  for L5_22, L6_23 in L2_19(L3_20) do
    L7_24 = Fn_findNpc
    L8_25 = L6_23.name
    L7_24 = L7_24(L8_25)
    L8_25 = L7_24
    L7_24 = L7_24.setSightParam
    L9_26 = L1_18
    L7_24(L8_25, L9_26)
  end
  L2_19(L3_20, L4_21)
  while true do
    while true do
      if L2_19 == false then
        L2_19()
      end
    end
  end
  while true do
    if L2_19 == false then
      L2_19()
    end
  end
  L3_20(L4_21)
  L3_20(L4_21)
  L3_20(L4_21)
  while true do
    if L3_20 == false then
      L3_20()
    end
  end
  L3_20(L4_21)
  L3_20(L4_21)
  L5_22 = 0
  L3_20(L4_21, L5_22)
  L3_20(L4_21)
  L5_22 = 2
  L3_20(L4_21, L5_22)
  while true do
    if L3_20 == false then
      L3_20()
    end
  end
  L5_22 = false
  L3_20(L4_21, L5_22)
  L3_20(L4_21)
  L3_20(L4_21)
  L5_22 = true
  L3_20(L4_21, L5_22)
  L5_22 = "locator2_xii_start_pos"
  L5_22 = L3_20
  L5_22 = L4_21(L5_22)
  L6_23 = Fn_warpXii
  L7_24 = L4_21
  L8_25 = L5_22
  L6_23(L7_24, L8_25)
  L6_23 = Fn_userCtrlOn
  L6_23()
  L6_23 = Fn_fadein
  L7_24 = 1
  L6_23(L7_24)
  L6_23 = Fn_missionView
  L7_24 = "ep27_00108"
  L8_25, L9_26 = nil, nil
  L10_27 = true
  L6_23(L7_24, L8_25, L9_26, L10_27)
  L6_23 = Fn_captionView
  L7_24 = "ep27_00109"
  L6_23(L7_24)
  L6_23 = waitSeconds
  L7_24 = 3
  L6_23(L7_24)
  L6_23 = Fn_naviSet
  L7_24 = _factory_navi
  L6_23(L7_24)
  L6_23 = wait
  L7_24 = 38
  L6_23(L7_24)
  L6_23 = ep27telopView
  L7_24 = L0_17
  L8_25 = "syd"
  L6_23(L7_24, L8_25)
  L6_23 = Fn_pcSensorOn
  L7_24 = "pccubesensor2_fighting_persons"
  L6_23(L7_24)
  L6_23 = waitPhase
  L6_23()
  L6_23 = {}
  L6_23.degree_h = 200
  L6_23.degree_v = 125
  L6_23.in_length = 6
  L6_23.out_length = 8
  L6_23.valid = true
  L6_23.watchTarget = true
  L7_24 = copyTable
  L8_25 = L6_23
  L7_24 = L7_24(L8_25)
  L8_25 = Fn_findNpcPuppet
  L9_26 = "bt_mob2"
  L8_25 = L8_25(L9_26)
  L7_24.target = L8_25
  L7_24.targetJoint = "bn_head"
  L8_25 = _bt_gen
  L8_25 = L8_25.bt_mob1
  L9_26 = L8_25
  L8_25 = L8_25.setSightParam
  L10_27 = L7_24
  L8_25(L9_26, L10_27)
  L8_25 = copyTable
  L9_26 = L6_23
  L8_25 = L8_25(L9_26)
  L9_26 = Fn_findNpcPuppet
  L10_27 = "bt_mob1"
  L9_26 = L9_26(L10_27)
  L8_25.target = L9_26
  L8_25.targetJoint = "bn_head"
  L9_26 = _bt_gen
  L9_26 = L9_26.bt_mob2
  L10_27 = L9_26
  L9_26 = L9_26.setSightParam
  L11_28 = L8_25
  L9_26(L10_27, L11_28)
  L9_26 = {}
  L10_27 = _bt_mot
  L10_27 = L10_27.walk_fighting
  L9_26.anim_walk = L10_27
  L10_27 = _bt_mot
  L10_27 = L10_27.walk_b_fighting
  L9_26.anim_walk_b = L10_27
  L9_26.noTurn = true
  L9_26.runLength = -1
  L10_27 = 5
  L11_28, L12_29 = nil, nil
  L13_30 = invokeTask
  function L14_31()
    local L0_57
    L0_57 = 0
    while _damage == false do
      if L0_57 <= L10_27 then
        Sound:playSE("m34_923", 1, "", _puppet_tbl.bt_mob1)
        Fn_playNpcEventMotion("bt_mob1", _bt_mot.attack_00)
        wait(7)
        Sound:playSE("m34_505a", 1, "", _puppet_tbl.bt_mob1)
        Fn_playNpcEventMotion("bt_mob1", _bt_mot.damage_small)
        L0_57 = L0_57 + 1
      else
        L11_28 = Fn_moveNpc("bt_mob1", {
          "locator2_gorotsuki_01"
        }, L9_26, {goalDirection = true})
        while L11_28:isRunning() do
          wait()
        end
        while L12_29 and L12_29:isRunning() do
          Fn_playNpcEventMotion("bt_mob1", _bt_mot.stay_fighting)
        end
        L0_57 = 0
      end
      wait()
    end
  end
  L13_30 = L13_30(L14_31)
  L14_31 = invokeTask
  function L15_32()
    local L0_58
    L0_58 = 0
    while _damage == false do
      if L0_58 <= L10_27 then
        Sound:playSE("m35_505a", 1, "", _puppet_tbl.bt_mob2)
        Fn_playNpcEventMotion("bt_mob2", _bt_mot.damage_small)
        Sound:playSE("m35_923", 1, "", _puppet_tbl.bt_mob2)
        Fn_playNpcEventMotion("bt_mob2", _bt_mot.attack_01)
        L0_58 = L0_58 + 1
      else
        L12_29 = Fn_moveNpc("bt_mob2", {
          "locator2_gorotsuki_02"
        }, L9_26, {goalDirection = true})
        while L12_29:isRunning() do
          wait()
        end
        while L11_28 and L11_28:isRunning() do
          Fn_playNpcEventMotion("bt_mob2", _bt_mot.stay_fighting)
        end
        L0_58 = 0
      end
      wait()
    end
  end
  L14_31 = L14_31(L15_32)
  L15_32 = findGameObject2
  L16_33 = "EnemyGenerator"
  L15_32 = L15_32(L16_33, L17_34)
  function L16_33(A0_59)
    if A0_59.attacker == "player" then
      invokeTask(function()
        _damage = true
        if L13_30 then
          L13_30:abort()
          L13_30 = nil
        end
        if L14_31 then
          L14_31:abort()
          L14_31 = nil
        end
        wait(2)
        _bt_gen.bt_mob1:changeEnemy()
        _bt_gen.bt_mob1:setEventListener("damage", nil)
        _bt_gen.bt_mob2:changeEnemy()
        _bt_gen.bt_mob2:setEventListener("damage", nil)
      end)
      Mob:makeSituationPanic(true)
    end
  end
  for L20_37, L21_38 in L17_34(L18_35) do
    L22_39(L23_40, L24_41)
    L22_39(L23_40, L24_41)
    L22_39(L23_40, L24_41)
    L25_42 = L16_33
    L22_39(L23_40, L24_41, L25_42)
    L22_39(L23_40, L24_41)
  end
  L17_34(L18_35)
  L20_37 = false
  L17_34(L18_35, L19_36, L20_37)
  L20_37 = 40
  L21_38 = 1.5
  L18_35(L19_36, L20_37, L21_38)
  L18_35()
  L18_35(L19_36)
  L18_35(L19_36)
  L18_35(L19_36)
  L20_37 = Sound
  L21_38 = L20_37
  L20_37 = L20_37.playSEHandle
  L25_42 = _puppet_tbl
  L25_42 = L25_42.mobwom
  L20_37 = L20_37(L21_38, L22_39, L23_40, L24_41, L25_42)
  L21_38 = 80
  L18_35(L19_36, L20_37, L21_38)
  L18_35(L19_36)
  L20_37 = Sound
  L21_38 = L20_37
  L20_37 = L20_37.playSEHandle
  L25_42 = _puppet_tbl
  L25_42 = L25_42.mobwom
  L20_37 = L20_37(L21_38, L22_39, L23_40, L24_41, L25_42)
  L21_38 = 80
  L18_35(L19_36, L20_37, L21_38)
  L18_35(L19_36)
  L18_35(L19_36)
  L18_35(L19_36)
  L18_35()
  L20_37 = 1
  L21_38 = 1.5
  L18_35(L19_36, L20_37, L21_38)
  L20_37 = 2.5
  L18_35(L19_36, L20_37)
  L20_37 = "cro009c"
  L18_35(L19_36, L20_37)
  L20_37 = "locator2_view_fight"
  L20_37 = L18_35
  L21_38 = 1
  L19_36(L20_37, L21_38)
  L19_36()
  L20_37 = L19_36
  L21_38 = false
  L19_36(L20_37, L21_38)
  L20_37 = "ep27_00112"
  L21_38 = nil
  L19_36(L20_37, L21_38, L22_39, L23_40)
  L20_37 = L19_36
  L21_38 = true
  L19_36(L20_37, L21_38)
  L20_37 = L19_36
  L21_38 = true
  L19_36(L20_37, L21_38)
  L20_37 = L15_32
  L21_38 = true
  L19_36(L20_37, L21_38)
  L19_36()
  function L20_37()
    Fn_captionView("ep27_00113", 2)
    Sound:playSE("w19_003", 1, "", _puppet_tbl.wom38)
    waitSeconds(0.2)
    Sound:playSE("w16_920", 1, "", _puppet_tbl.wom41)
    Sound:playSE("w19_005", 1, "", _puppet_tbl.wom38)
    waitSeconds(1.8)
    Fn_captionView("ep27_00114", 2)
    Sound:playSE("m31_924c", 1, "", _puppet_tbl.man26)
    waitSeconds(0.3)
    Sound:playSE("m36_918c", 1, "", _puppet_tbl.man71)
    waitSeconds(0.5)
    Sound:playSE("m33_918b", 1, "", _puppet_tbl.man83)
    waitSeconds(1.2)
    Fn_captionView("ep27_00115", 2)
    Sound:playSE("w15_918c", 1, "", _puppet_tbl.wom42)
    waitSeconds(0.2)
    Sound:playSE("m33_920a", 1, "", _puppet_tbl.man81)
    waitSeconds(0.2)
    Sound:playSE("m33_918c", 1, "", _puppet_tbl.man81)
  end
  L20_37 = Fn_playLoopMotionRand
  L21_38 = "mobwom"
  L20_37 = L20_37(L21_38, L22_39, L23_40, L24_41)
  repeat
    L21_38 = wait
    L21_38()
    L21_38 = enmgen2_ep27a
    L21_38 = L21_38.getEnemyDeadNum
    L21_38 = L21_38(L22_39)
  until L21_38 > 1
  L21_38 = Mob
  L21_38 = L21_38.makeSituationPanic
  L21_38(L22_39, L23_40)
  L21_38 = L19_36.isRunning
  L21_38 = L21_38(L22_39)
  if L21_38 then
    L21_38 = L19_36.abort
    L21_38(L22_39)
  end
  L21_38 = Fn_captionViewEnd
  L21_38()
  L21_38 = Fn_setBgmPoint
  L21_38(L22_39, L23_40)
  L21_38 = Fn_blackout
  L21_38()
  L21_38 = actMobAfterBattle
  L21_38 = L21_38()
  L21_38[L22_39] = L20_37
  for L25_42, L26_43 in L22_39(L23_40) do
    L28_45 = L26_43
    L27_44 = L26_43.abort
    L27_44(L28_45)
    L26_43 = nil
  end
  for L25_42, L26_43 in L22_39(L23_40) do
    while true do
      L28_45 = L26_43
      L27_44 = L26_43.isRunning
      L27_44 = L27_44(L28_45)
      if L27_44 then
        L27_44 = wait
        L27_44()
      end
    end
  end
  for L25_42, L26_43 in L22_39(L23_40) do
    L27_44 = Fn_changeNpcToMob
    L28_45 = L25_42
    L27_44(L28_45)
    L27_44 = _puppet_tbl
    L27_44[L25_42] = nil
    L27_44 = _mob_hdl
    L27_44[L25_42] = nil
  end
  L22_39(L23_40, L24_41)
  L22_39(L23_40, L24_41)
  for L25_42, L26_43 in L22_39(L23_40) do
    L28_45 = L26_43
    L27_44 = L26_43.abort
    L27_44(L28_45)
    L26_43 = nil
  end
  L22_39(L23_40)
  L22_39(L23_40, L24_41)
  L23_40(L24_41)
  L25_42 = "locator2_sdemo_kaj_cam"
  L26_43 = Fn_getPlayer
  L26_43 = L26_43()
  L27_44 = L26_43
  L26_43 = L26_43.getWorldPos
  L26_43 = L26_43(L27_44)
  L27_44 = false
  L28_45 = Vector
  L39_56 = L28_45(L29_46, L30_47, L31_48)
  L23_40(L24_41, L25_42, L26_43, L27_44, L28_45, L29_46, L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56, L28_45(L29_46, L30_47, L31_48))
  L23_40(L24_41)
  L23_40()
  L25_42 = 1.5
  L23_40(L24_41, L25_42)
  L25_42 = "cro009b"
  L23_40(L24_41, L25_42)
  L23_40(L24_41)
  L23_40(L24_41)
  L25_42 = "kaj_901b"
  L26_43 = 1
  L27_44 = ""
  L28_45 = _puppet_tbl
  L28_45 = L28_45.kaj01
  L23_40(L24_41, L25_42, L26_43, L27_44, L28_45)
  L25_42 = true
  L26_43 = 1
  L27_44 = _puppet_tbl
  L27_44 = L27_44.kaj01
  L28_45 = L27_44
  L27_44 = L27_44.getWorldPos
  L39_56 = L27_44(L28_45)
  L23_40(L24_41, L25_42, L26_43, L27_44, L28_45, L29_46, L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56, L27_44(L28_45))
  L23_40(L24_41)
  L25_42 = "locator2_sdemo_kaj_cam"
  L26_43 = _puppet_tbl
  L26_43 = L26_43.kaj01
  L27_44 = true
  L28_45 = Vector
  L39_56 = L28_45(L29_46, L30_47, L31_48)
  L23_40(L24_41, L25_42, L26_43, L27_44, L28_45, L29_46, L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56, L28_45(L29_46, L30_47, L31_48))
  L23_40(L24_41)
  L25_42 = _event_mot
  L25_42 = L25_42.run_stop_ep27_00
  L26_43 = false
  L27_44 = 0
  L28_45 = false
  L23_40(L24_41, L25_42, L26_43, L27_44, L28_45, L29_46, L30_47)
  L23_40(L24_41)
  L25_42 = "kaj_023"
  L26_43 = 1
  L27_44 = ""
  L28_45 = _puppet_tbl
  L28_45 = L28_45.kaj01
  L23_40(L24_41, L25_42, L26_43, L27_44, L28_45)
  L23_40(L24_41)
  L23_40.runLength = 4
  L23_40.arrivedLength = 2
  L25_42 = "bul01"
  L26_43 = {L27_44}
  L27_44 = _puppet_tbl
  L27_44 = L27_44.kaj01
  L27_44 = L23_40
  L24_41(L25_42, L26_43, L27_44)
  repeat
    L24_41()
    L25_42 = "kaj01"
    L25_42 = L24_41
  until L24_41
  L25_42 = "ep27_00120k"
  L24_41(L25_42)
  L25_42 = L24_41
  L24_41(L25_42)
  L25_42 = "kaj01"
  L26_43 = "stay_00"
  L27_44 = false
  L24_41(L25_42, L26_43, L27_44)
  L25_42 = L24_41
  L26_43 = false
  L24_41(L25_42, L26_43)
  L25_42 = L24_41
  L26_43 = false
  L27_44 = 1
  L28_45 = Vector
  L39_56 = L28_45(L29_46, L30_47, L31_48)
  L24_41(L25_42, L26_43, L27_44, L28_45, L29_46, L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56, L28_45(L29_46, L30_47, L31_48))
  L25_42 = "ep27_00119"
  L26_43, L27_44 = nil, nil
  L28_45 = true
  L24_41(L25_42, L26_43, L27_44, L28_45)
  L25_42 = "ep27_00118"
  L24_41(L25_42)
  L25_42 = 3
  L24_41(L25_42)
  L25_42 = "Node"
  L26_43 = "locator2_ed_navi"
  L25_42 = Fn_naviSet
  L26_43 = L24_41
  L25_42(L26_43)
  L25_42 = wait
  L26_43 = 38
  L25_42(L26_43)
  L25_42 = ep27telopView
  L26_43 = L0_17
  L27_44 = "kaj"
  L25_42(L26_43, L27_44)
  L25_42 = waitSeconds
  L26_43 = _TELOP_WAIT
  L25_42(L26_43)
  L25_42 = invokeTask
  function L26_43()
    ep27telopView(L0_17, "bul")
  end
  L25_42(L26_43)
  L25_42 = wait
  L25_42()
  L25_42 = ep27telopView
  L26_43 = L0_17
  L27_44 = "adi"
  L25_42(L26_43, L27_44)
  L25_42 = createGameObject2
  L26_43 = "Node"
  L25_42 = L25_42(L26_43)
  L27_44 = L25_42
  L26_43 = L25_42.setName
  L28_45 = "locator_auj01_y_add"
  L26_43(L27_44, L28_45)
  L27_44 = L25_42
  L26_43 = L25_42.setPos
  L28_45 = Vector
  L39_56 = L28_45(L29_46, L30_47, L31_48)
  L26_43(L27_44, L28_45, L29_46, L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56, L28_45(L29_46, L30_47, L31_48))
  L26_43 = _puppet_tbl
  L26_43 = L26_43.auj01
  L27_44 = L26_43
  L26_43 = L26_43.appendChild
  L28_45 = L25_42
  L26_43(L27_44, L28_45)
  L27_44 = L25_42
  L26_43 = L25_42.try_init
  L26_43(L27_44)
  L27_44 = L25_42
  L26_43 = L25_42.waitForReady
  L26_43(L27_44)
  L27_44 = L25_42
  L26_43 = L25_42.try_start
  L26_43(L27_44)
  L26_43 = false
  L27_44 = invokeTask
  function L28_45()
    while Fn_getDistanceToPlayer(L24_41) > 50 do
      wait()
    end
    Fn_naviKill()
    L26_43 = true
  end
  L27_44(L28_45)
  while true do
    L27_44 = Fn_getDistanceToPlayer
    L28_45 = _puppet_tbl
    L28_45 = L28_45.kaj01
    L27_44 = L27_44(L28_45)
    if L27_44 < 15 then
      L27_44 = wait
      L27_44()
    end
  end
  L27_44 = Fn_setNpcActive
  L28_45 = "auj01"
  L27_44(L28_45, L29_46)
  L27_44 = Fn_watchNpc
  L28_45 = "auj01"
  L27_44(L28_45, L29_46)
  L27_44 = Fn_playNpcEventMotion
  L28_45 = "auj01"
  L27_44(L28_45, L29_46, L30_47, L31_48, L32_49)
  L27_44 = Fn_warpNpc
  L28_45 = "auj01"
  L27_44(L28_45, L29_46)
  L27_44 = "cibottle01_base"
  L28_45 = createGameObject2
  L28_45 = L28_45(L29_46)
  L29_46(L30_47, L31_48)
  L29_46(L30_47, L31_48)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46(L30_47, L31_48, L32_49)
  L29_46(L30_47)
  L29_46(L30_47)
  while L26_43 == false do
    L29_46()
  end
  L29_46()
  L29_46(L30_47, L31_48)
  L29_46(L30_47, L31_48)
  L29_46(L30_47)
  L29_46(L30_47, L31_48)
  L29_46(L30_47, L31_48)
  L39_56 = L30_47(L31_48, L32_49)
  L29_46(L30_47, L31_48, L32_49, L33_50, L34_51, L35_52, L36_53, L37_54, L38_55, L39_56, L30_47(L31_48, L32_49))
  L29_46(L30_47, L31_48, L32_49)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46()
  repeat
    L29_46()
    L39_56 = L30_47(L31_48)
  until L29_46 < 2.5
  L29_46()
  L29_46()
  L29_46()
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46()
  L29_46(L30_47)
  L29_46(L30_47, L31_48)
  L29_46(L30_47, L31_48)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46(L30_47)
  for L32_49, L33_50 in L29_46(L30_47) do
    L34_51 = Fn_setNpcActive
    L35_52 = L33_50
    L36_53 = true
    L34_51(L35_52, L36_53)
    L36_53 = "resetSightParam"
    L35_52 = L33_50
    L34_51 = L33_50[L36_53]
    L34_51(L35_52)
    L34_51 = Fn_watchNpc
    L35_52 = L33_50
    L36_53 = false
    L34_51(L35_52, L36_53)
  end
  L33_50 = 0.3
  L34_51 = false
  L29_46(L30_47, L31_48, L32_49, L33_50, L34_51)
  L33_50 = 0.3
  L34_51 = false
  L29_46(L30_47, L31_48, L32_49, L33_50, L34_51)
  L33_50 = "talk_00"
  L33_50 = 5
  L34_51 = 10
  L29_46(L30_47, L31_48, L32_49, L33_50, L34_51)
  L29_46(L30_47, L31_48, L32_49)
  L31_48.degree_h = L32_49
  L31_48.degree_v = 50
  L33_50 = "kid02"
  L31_48.target = L32_49
  L31_48.targetJoint = "bn_head"
  L31_48.watchTarget = L32_49
  L29_46(L30_47, L31_48)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46(L30_47)
  L29_46.degree_h = L30_47
  L29_46.degree_v = L30_47
  L29_46.in_length = L30_47
  L29_46.out_length = 50
  L29_46.valid = L30_47
  for L33_50, L34_51 in L30_47(L31_48) do
    L35_52 = Fn_setNpcActive
    L36_53 = L34_51.name
    L37_54 = true
    L35_52(L36_53, L37_54)
    L35_52 = "print"
    L35_52 = _ENV[L35_52]
    L36_53 = "tostring"
    L36_53 = _ENV[L36_53]
    L37_54 = L34_51.name
    L36_53 = L36_53(L37_54)
    L37_54 = "\227\130\146\227\130\162\227\130\175\227\131\134\227\130\163\227\131\150\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159"
    L36_53 = L36_53 .. L37_54
    L35_52(L36_53)
    L35_52 = Fn_findNpc
    L36_53 = L34_51.name
    L35_52 = L35_52(L36_53)
    L37_54 = L35_52
    L36_53 = L35_52.setSightParam
    L38_55 = L29_46
    L36_53(L37_54, L38_55)
    L36_53 = {
      L37_54,
      L38_55,
      L39_56,
      "talk_laugh_02"
    }
    L37_54 = "talk_00"
    L38_55 = "talk_01"
    L39_56 = "talk_02"
    L37_54 = "_mot_task_tbl"
    L37_54 = _ENV[L37_54]
    L38_55 = L34_51.name
    L39_56 = Fn_playLoopMotionRand
    L39_56 = L39_56(L35_52, L36_53, 5, 10)
    L37_54[L38_55] = L39_56
  end
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47()
  L30_47(L31_48, L32_49)
  repeat
    L30_47()
    L39_56 = L31_48(L32_49)
  until L30_47 < 2.5
  L30_47()
  L30_47()
  L30_47()
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47()
  L30_47(L31_48)
  L33_50 = nil
  L34_51 = true
  L30_47(L31_48, L32_49, L33_50, L34_51)
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47()
  L30_47(L31_48, L32_49)
  repeat
    L30_47()
    L39_56 = L31_48(L32_49)
  until L30_47 < 2.5
  L30_47()
  L30_47(L31_48, L32_49)
  L30_47()
  L30_47()
  L30_47(L31_48)
  L30_47(L31_48)
  L30_47()
  L30_47(L31_48)
  L30_47(L31_48, L32_49)
  L33_50 = nil
  L34_51 = true
  L30_47(L31_48, L32_49, L33_50, L34_51)
  L30_47(L31_48)
  L30_47(L31_48)
  L31_48(L32_49)
  L31_48(L32_49)
  L31_48(L32_49)
  L33_50 = "aki"
  L31_48(L32_49, L33_50)
  L31_48(L32_49)
  L33_50 = "bit"
  L31_48(L32_49, L33_50)
  L31_48()
  L31_48(L32_49)
  L31_48()
  L33_50 = "bit"
  L31_48(L32_49, L33_50)
  L33_50 = true
  L31_48(L32_49, L33_50)
  L33_50 = "locator2_view_pos01"
  L33_50 = L31_48
  L32_49(L33_50)
  L33_50 = "ep27_00133"
  L34_51 = 2.5
  L32_49(L33_50, L34_51)
  L33_50 = L32_49
  L34_51 = "pc2_048"
  L35_52 = 1
  L36_53 = ""
  L37_54 = nil
  L32_49(L33_50, L34_51, L35_52, L36_53, L37_54)
  L33_50 = 2.5
  L32_49(L33_50)
  L33_50 = L32_49
  L34_51 = false
  L32_49(L33_50, L34_51)
  L33_50 = "fan01"
  L34_51 = true
  L32_49(L33_50, L34_51)
  L33_50 = "fan02"
  L34_51 = true
  L32_49(L33_50, L34_51)
  L33_50 = "fan01"
  L33_50 = L32_49
  L34_51 = L29_46
  L32_49(L33_50, L34_51)
  L33_50 = "fan02"
  L33_50 = L32_49
  L34_51 = L29_46
  L32_49(L33_50, L34_51)
  L33_50 = "pccubesensor2_id_navi2"
  L32_49(L33_50)
  function L33_50()
    while true do
      if _crowfan_act then
        Sound:playSE("m29_901c", 1, "", _puppet_tbl.fan01)
        Fn_playMotionNpc("fan02", "wavehand_far_00", false)
        Fn_playMotionNpc("fan01", "wavehand_far_00", true)
        invokeTask(function()
          Fn_turnNpc("fan01")
        end)
        invokeTask(function()
          Fn_turnNpc("fan02")
        end)
        Sound:playSE("pc2_047", 1, "", nil)
        break
      end
      wait()
    end
  end
  L32_49(L33_50)
  L33_50 = "Node"
  L34_51 = "locator2_id_navi3"
  L33_50 = L30_47
  L32_49(L33_50)
  L33_50 = "pccubesensor2_id_navi3"
  L32_49(L33_50)
  L33_50 = 38
  L32_49(L33_50)
  L33_50 = L0_17
  L34_51 = "bra"
  L32_49(L33_50, L34_51)
  L33_50 = _TELOP_WAIT
  L33_50 = L33_50 + 1
  L32_49(L33_50)
  L33_50 = L0_17
  L34_51 = "kal"
  L32_49(L33_50, L34_51)
  L32_49()
  L32_49()
  L33_50 = L32_49
  L34_51 = true
  L32_49(L33_50, L34_51)
  L33_50 = "Node"
  L34_51 = "locator2_id_view_Loc"
  L33_50 = "Fn_lookAtTargetInput"
  L33_50 = _ENV[L33_50]
  L34_51 = L32_49
  L33_50(L34_51)
  L33_50 = Fn_captionView
  L34_51 = "ep27_00134"
  L35_52 = 2
  L33_50(L34_51, L35_52)
  L33_50 = waitSeconds
  L34_51 = 2
  L33_50(L34_51)
  L33_50 = findGameObject2
  L34_51 = "Node"
  L35_52 = "locator2_id_navi4"
  L33_50 = L33_50(L34_51, L35_52)
  L33_50 = Fn_naviSet
  L34_51 = L30_47
  L33_50(L34_51)
  L33_50 = Fn_pcSensorOn
  L34_51 = "pccubesensor2_id_navi4"
  L33_50(L34_51)
  L33_50 = Player
  L34_51 = L33_50
  L33_50 = L33_50.setStay
  L35_52 = false
  L33_50(L34_51, L35_52)
  L33_50 = waitPhase
  L33_50()
  L33_50 = Fn_naviKill
  L33_50()
  L33_50 = Fn_blackout
  L33_50()
  L33_50 = Player
  L34_51 = L33_50
  L33_50 = L33_50.setStay
  L35_52 = true
  L33_50(L34_51, L35_52)
  L33_50 = findGameObject2
  L34_51 = "Node"
  L35_52 = "locator2_pdemo_crow"
  L33_50 = L33_50(L34_51, L35_52)
  L34_51 = Fn_resetPcPos
  L35_52 = L33_50
  L34_51(L35_52)
  L34_51 = Fn_getPlayer
  L34_51 = L34_51()
  L35_52 = L34_51
  L34_51 = L34_51.setVisible
  L36_53 = false
  L34_51(L35_52, L36_53)
  while true do
    L34_51 = "_polydemo3"
    L34_51 = _ENV[L34_51]
    L35_52 = L34_51
    L34_51 = L34_51.isLoading
    L34_51 = L34_51(L35_52)
    L35_52 = false
    if L34_51 == L35_52 then
      L34_51 = wait
      L34_51()
    end
  end
  L34_51 = "_polydemo3"
  L34_51 = _ENV[L34_51]
  L35_52 = L34_51
  L34_51 = L34_51.play
  L34_51(L35_52)
  L34_51 = Fn_fadein
  L35_52 = 1
  L36_53 = false
  L34_51(L35_52, L36_53)
  L34_51 = wait
  L35_52 = "_CUT1_FRAME"
  L35_52 = _ENV[L35_52]
  L34_51(L35_52)
  L34_51 = Fn_kaiwaDemoView
  L35_52 = "ep27_00155k"
  L36_53 = nil
  L37_54 = "_polydemo3"
  L37_54 = _ENV[L37_54]
  L38_55 = "sehandle"
  L37_54 = L37_54[L38_55]
  L34_51(L35_52, L36_53, L37_54)
  while true do
    L34_51 = "_polydemo3"
    L34_51 = _ENV[L34_51]
    L35_52 = L34_51
    L34_51 = L34_51.isEnd
    L34_51 = L34_51(L35_52)
    L35_52 = false
    if L34_51 == L35_52 then
      L34_51 = wait
      L34_51()
    end
  end
  L34_51 = "_polydemo3"
  L34_51 = _ENV[L34_51]
  L35_52 = L34_51
  L34_51 = L34_51.stop
  L34_51(L35_52)
  L34_51 = "_polydemo3"
  L34_51 = _ENV[L34_51]
  L35_52 = L34_51
  L34_51 = L34_51.try_term
  L34_51(L35_52)
  L34_51 = Fn_getPlayer
  L34_51 = L34_51()
  L35_52 = L34_51
  L34_51 = L34_51.setVisible
  L36_53 = true
  L34_51(L35_52, L36_53)
  L34_51 = Fn_fadein
  L34_51()
  L34_51 = Player
  L35_52 = L34_51
  L34_51 = L34_51.setStay
  L36_53 = false
  L34_51(L35_52, L36_53)
  L34_51 = Fn_missionView
  L35_52 = "ep27_00126"
  L36_53, L37_54 = nil, nil
  L38_55 = true
  L34_51(L35_52, L36_53, L37_54, L38_55)
  L34_51 = waitSeconds
  L35_52 = 1
  L34_51(L35_52)
  L34_51 = Fn_captionView
  L35_52 = "ep27_00125"
  L34_51(L35_52)
  L34_51 = waitSeconds
  L35_52 = 3
  L34_51(L35_52)
  L34_51 = findGameObject2
  L35_52 = "Node"
  L36_53 = "locator2_dt_navi_01"
  L34_51 = L34_51(L35_52, L36_53)
  L35_52 = Fn_naviSet
  L36_53 = L34_51
  L35_52(L36_53)
  L35_52 = wait
  L36_53 = 38
  L35_52(L36_53)
  L35_52 = ep27telopView
  L36_53 = L0_17
  L37_54 = "uni"
  L35_52(L36_53, L37_54)
  L35_52 = Fn_pcSensorOn
  L36_53 = "pccubesensor2_dt_navi_01"
  L35_52(L36_53)
  L35_52 = "Fn_sendEventComSb"
  L35_52 = _ENV[L35_52]
  L36_53 = "addPhaseNum"
  L35_52(L36_53)
  L35_52 = waitSeconds
  L36_53 = _TELOP_WAIT
  L36_53 = L36_53 + 2
  L35_52(L36_53)
  L35_52 = ep27telopView
  L36_53 = L0_17
  L37_54 = "per"
  L35_52(L36_53, L37_54)
  L35_52 = waitPhase
  L35_52()
  L35_52 = Fn_naviKill
  L35_52()
  L35_52 = Player
  L36_53 = L35_52
  L35_52 = L35_52.setStay
  L37_54 = true
  L35_52(L36_53, L37_54)
  L35_52 = findGameObject2
  L36_53 = "Node"
  L37_54 = "locator2_dt_navi_02"
  L35_52 = L35_52(L36_53, L37_54)
  L36_53 = "Fn_lookAtTargetInput"
  L36_53 = _ENV[L36_53]
  L37_54 = L35_52
  L38_55 = 1.5
  L36_53(L37_54, L38_55)
  L36_53 = Fn_setCatWarpCheckPoint
  L37_54 = "locator2_dt_navi_02"
  L36_53(L37_54)
  L36_53 = Fn_captionView
  L37_54 = "ep27_00135"
  L36_53(L37_54)
  L36_53 = waitSeconds
  L37_54 = 3
  L36_53(L37_54)
  L36_53 = Player
  L37_54 = L36_53
  L36_53 = L36_53.setStay
  L38_55 = false
  L36_53(L37_54, L38_55)
  L36_53 = waitSeconds
  L37_54 = 0.3
  L36_53(L37_54)
  L36_53 = findGameObject2
  L37_54 = "Node"
  L38_55 = "locator2_dt_navi"
  L36_53 = L36_53(L37_54, L38_55)
  L34_51 = L36_53
  L36_53 = Fn_naviSet
  L37_54 = L34_51
  L36_53(L37_54)
  L36_53 = Fn_pcSensorOn
  L37_54 = "pcspheresensor2_new_eqo"
  L36_53(L37_54)
  L36_53 = wait
  L37_54 = 38
  L36_53(L37_54)
  L36_53 = ep27telopView
  L37_54 = L0_17
  L38_55 = "cai"
  L36_53(L37_54, L38_55)
  repeat
    L36_53 = wait
    L36_53()
    L36_53 = Fn_getDistanceToPlayer
    L38_55 = L34_51
    L37_54 = L34_51.getWorldPos
    L39_56 = L37_54(L38_55)
    L36_53 = L36_53(L37_54, L38_55, L39_56, L37_54(L38_55))
    L37_54 = 180
  until L36_53 < L37_54
  L36_53 = ep27telopView
  L37_54 = L0_17
  L38_55 = "xer"
  L36_53(L37_54, L38_55)
  L36_53 = waitPhase
  L36_53()
  L36_53 = Fn_naviKill
  L36_53()
  L36_53 = Fn_captionView
  L37_54 = "ep27_00127"
  L38_55 = 1.5
  L36_53(L37_54, L38_55)
  L36_53 = Sound
  L37_54 = L36_53
  L36_53 = L36_53.playSE
  L38_55 = "cro_247"
  L36_53(L37_54, L38_55)
  L36_53 = waitSeconds
  L37_54 = 0.5
  L36_53(L37_54)
  L36_53 = pcStayCamStopOn
  L36_53()
  L36_53 = findGameObject2
  L37_54 = "Node"
  L38_55 = "locator2_new_eqo_navi"
  L36_53 = L36_53(L37_54, L38_55)
  L34_51 = L36_53
  L36_53 = viewControl
  L37_54 = L34_51
  L38_55 = nil
  L39_56 = 1.5
  L36_53(L37_54, L38_55, L39_56)
  L36_53 = waitSeconds
  L37_54 = 1.5
  L36_53(L37_54)
  L36_53 = Fn_captionView
  L37_54 = "ep27_00128"
  L36_53(L37_54)
  L36_53 = waitSeconds
  L37_54 = 0.5
  L36_53(L37_54)
  L36_53 = "pcStayCamStopOff"
  L36_53 = _ENV[L36_53]
  L36_53()
  L36_53 = Fn_naviSet
  L37_54 = L34_51
  L36_53(L37_54)
  repeat
    L36_53 = wait
    L36_53()
    L36_53 = Fn_getDistanceToPlayer
    L38_55 = L34_51
    L37_54 = L34_51.getWorldPos
    L39_56 = L37_54(L38_55)
    L36_53 = L36_53(L37_54, L38_55, L39_56, L37_54(L38_55))
  until L36_53 < 2.5
  L36_53 = Fn_naviKill
  L36_53()
  L36_53 = Fn_blackout
  L37_54 = 1
  L36_53(L37_54)
  L36_53 = Player
  L37_54 = L36_53
  L36_53 = L36_53.setStay
  L38_55 = true
  L36_53(L37_54, L38_55)
  L36_53 = findGameObject2
  L37_54 = "Node"
  L38_55 = "locator2_sdemo_pc_pos"
  L36_53 = L36_53(L37_54, L38_55)
  L37_54 = Fn_resetPcPos
  L38_55 = L36_53
  L37_54(L38_55)
  L37_54 = "Fn_coercionPoseNomal"
  L37_54 = _ENV[L37_54]
  L37_54()
  L37_54 = findGameObject2
  L38_55 = "Node"
  L39_56 = "locator2_sdemo_crane_pos01"
  L37_54 = L37_54(L38_55, L39_56)
  L38_55 = "_area_ctrl"
  L38_55 = _ENV[L38_55]
  L39_56 = L38_55
  L38_55 = L38_55.warp
  L38_55(L39_56, L37_54)
  L38_55 = wait
  L38_55()
  L38_55 = {
    L39_56,
    "locator2_sdemo_crane_pos02_1",
    "locator2_sdemo_crane_pos02_2",
    "locator2_sdemo_crane_pos02_3",
    "locator2_sdemo_crane_pos02_4",
    "locator2_sdemo_crane_pos02_5",
    "locator2_sdemo_crane_pos03",
    "locator2_sdemo_crane_pos03_1",
    "locator2_sdemo_crane_pos03_2",
    "locator2_sdemo_crane_pos03_3",
    "locator2_sdemo_crane_pos03_4",
    "locator2_sdemo_crane_pos03_5",
    "locator2_sdemo_crane_pos04",
    "locator2_sdemo_crane_pos04_1"
  }
  L39_56 = "locator2_sdemo_crane_pos02"
  L39_56 = "_area_ctrl"
  L39_56 = _ENV[L39_56]
  L39_56 = L39_56.move
  L39_56(L39_56, L38_55)
  L39_56 = "_sdemo3"
  L39_56 = _ENV[L39_56]
  L39_56 = L39_56.set
  L39_56(L39_56, "locator2_sdemo2_cam_01", Fn_getPlayer(), false, Vector(0, 1.5, 0))
  L39_56 = "_sdemo3"
  L39_56 = _ENV[L39_56]
  L39_56 = L39_56.play
  L39_56(L39_56)
  L39_56 = Fn_fadein
  L39_56(nil, true)
  L39_56 = Fn_kaiwaDemoView
  L39_56("ep27_00160k")
  L39_56 = "Fn_resetCoercionPose"
  L39_56 = _ENV[L39_56]
  L39_56()
  L39_56 = "Fn_findAreaHandle"
  L39_56 = _ENV[L39_56]
  L39_56 = L39_56("ve_crane_root")
  Fn_captionView("ep27_00129")
  Sound:playSE("cro_247")
  Player:setLookAtIk(true, 1, L39_56:getWorldPos())
  waitSeconds(1.3)
  _sdemo3:set("locator2_sdemo2_cam_01", L39_56, true, Vector(0, -2, 0))
  _sdemo3:play()
  waitSeconds(4)
  Fn_captionViewWait("ep27_00130", 4)
  Fn_blackout(1.3)
  _sdemo3:stop(0)
  _area_ctrl:pause(true)
  _area_ctrl:stop()
  wait()
  _area_ctrl:warp("locator2_sdemo_crane_pos04_1")
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Fn_fadein(2)
  Player:setStay(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function actMob()
  local L0_60
  L0_60 = {
    Fn_playLoopMotionInsert("man26", "stay_00", {"stay_01", "stay_02"}, 5, 10),
    Fn_playLoopMotionInsert("wom42", "stay_02", {"talk_02"}, 3, 5),
    invokeTask(function()
      Fn_playMotionNpc("man64", "stay_02")
    end),
    Fn_playLoopMotionRand("man70", {
      "talk_01",
      "stay_01",
      "talk_sad_02",
      "talk_03"
    }, 3, 7),
    Fn_playLoopMotionRand("man71", {
      "talk_angry_00",
      "talk_01",
      "talk_laugh_00"
    }, 5, 10),
    Fn_playLoopMotionInsert("wom41", "stay_01", {"talk_03", "reply_yes"}, 5, 10),
    Fn_playLoopMotionInsert("man81", "lookaround_01", {"talk_00", "reply_yes"}, 5, 10),
    Fn_playLoopMotionRand("wom38", {
      "stay_rescued_00",
      "pray_00"
    }, 5, 10),
    Fn_playLoopMotionRand("man83", {
      "talk_laugh_02",
      "talk_04",
      "talk_laugh_01"
    }, 5, 10)
  }
  return L0_60
end
function actMobAfterBattle()
  local L0_61
  L0_61 = {}
  L0_61[1] = Fn_playLoopMotionInsert("man26", "stay_00", {
    "handclap",
    "vendor_attract_00"
  }, 5, 10)
  L0_61[2] = Fn_playLoopMotionInsert("wom42", "stay_02", {
    "handclap",
    "wavehand_near_00"
  }, 3, 5)
  L0_61[3] = invokeTask(function()
    Fn_playMotionNpc("man64", "stay_02")
  end)
  L0_61[4] = Fn_playLoopMotionRand("man70", {
    "talk_01",
    "stay_01",
    "talk_sad_02",
    "talk_03"
  }, 3, 7)
  L0_61[5] = Fn_playLoopMotionRand("man71", {
    "talk_angry_00",
    "talk_01",
    "talk_laugh_00"
  }, 5, 10)
  L0_61[6] = Fn_playLoopMotionInsert("wom41", "stay_01", {
    "wavehand_near_00",
    "reply_yes"
  }, 5, 10)
  L0_61[7] = Fn_playLoopMotionInsert("man81", "stay_01", {"reply_yes"}, 5, 10)
  L0_61[8] = Fn_playLoopMotionInsert("wom38", "stay_rescued_00", {
    "wavehand_far_00"
  }, 5, 10)
  L0_61[9] = Fn_playLoopMotionRand("man83", {
    "talk_laugh_02",
    "talk_04",
    "talk_laugh_01"
  }, 5, 10)
  return L0_61
end
function actCrowFanOnEnter(A0_62)
  local L1_63, L2_64
  L2_64 = A0_62
  L1_63 = A0_62.getName
  L1_63 = L1_63(L2_64)
  L2_64 = L1_63.sub
  L2_64 = L2_64(L1_63, 20, 20)
  captionAndVoice(L2_64)
  checkCrowFan(L2_64)
  Fn_pcSensorOff(A0_62)
end
function captionAndVoice(A0_65)
  local L1_66, L2_67
  L1_66 = Fn_findNpcPuppet
  L2_67 = "f"
  L2_67 = L2_67 .. A0_65 .. "_01"
  L1_66 = L1_66(L2_67)
  L2_67 = Fn_findNpcPuppet
  L2_67 = L2_67("f" .. A0_65 .. "_02")
  if #_fan_cap > 1 then
    invokeTask(function()
      Fn_captionView(_fan_cap[1], 2.5)
      Sound:setAudibleRange(Sound:playSEHandle(_fan_voi[1], 0.7, "", L1_66), 50)
      table.remove(_fan_cap, 1)
      table.remove(_fan_voi, 1)
      waitSeconds(2.5)
      Fn_captionView(_fan_cap[1], 2.5)
      Sound:setAudibleRange(Sound:playSEHandle(_fan_voi[1], 0.7, "", L2_67), 50)
      table.remove(_fan_cap, 1)
      table.remove(_fan_voi, 1)
    end)
  end
end
function checkCrowFan(A0_68)
  local L1_69, L2_70, L3_71, L4_72, L5_73, L6_74
  L1_69 = 1
  while true do
    while true do
      while true do
        while true do
          L2_70 = "f"
          L3_71 = A0_68
          L4_72 = "_"
          L5_73 = string
          L5_73 = L5_73.format
          L6_74 = "%02d"
          L5_73 = L5_73(L6_74, L1_69)
          L2_70 = L2_70 .. L3_71 .. L4_72 .. L5_73
          L3_71 = Fn_findNpcPuppet
          L4_72 = L2_70
          L3_71 = L3_71(L4_72)
          L4_72 = string
          L4_72 = L4_72.match
          L5_73 = L2_70
          L6_74 = "%d"
          L4_72 = L4_72(L5_73, L6_74)
          L5_73 = math
          L5_73 = L5_73.randomseed
          L6_74 = tonumber
          L6_74 = L6_74(L4_72)
          L5_73(L6_74, L6_74(L4_72))
          if L3_71 ~= nil then
            L5_73 = _mot_task_tbl
            L5_73 = L5_73[L2_70]
            L6_74 = L5_73
            L5_73 = L5_73.abort
            L5_73(L6_74)
            L5_73 = fanVoicePlay
            L6_74 = L3_71
            L5_73 = L5_73(L6_74)
            L6_74 = actCrowFanRand
            L6_74 = L6_74(L2_70)
            invokeTask(function()
              local L0_75
              while true do
                L0_75 = Fn_isInSightTarget
                L0_75 = L0_75(L3_71, 0.3)
                if L0_75 then
                  L0_75 = Sound
                  L0_75 = L0_75.setAudibleRange
                  L0_75(L0_75, Sound:playSEHandle("w16_918", 1, "", L3_71), 50)
                  L0_75 = Sound
                  L0_75 = L0_75.setAudibleRange
                  L0_75(L0_75, Sound:playSEHandle("w17_918", 1, "", L3_71), 50)
                else
                  L0_75 = Fn_getDistanceToPlayer
                  L0_75 = L0_75(L3_71)
                  if L0_75 > 60 then
                    L0_75 = L5_73
                    if L0_75 then
                      L0_75 = L5_73
                      L0_75 = L0_75.abort
                      L0_75(L0_75)
                      L0_75 = nil
                      L5_73 = L0_75
                    end
                    L0_75 = L6_74
                    if L0_75 then
                      L0_75 = L6_74
                      L0_75 = L0_75.abort
                      L0_75(L0_75)
                      L0_75 = nil
                      L6_74 = L0_75
                    end
                    L0_75 = wait
                    L0_75(3)
                    L0_75 = Fn_setNpcActive
                    L0_75(L2_70, false)
                  end
                end
                L0_75 = RandF
                L0_75 = L0_75(5)
                waitSeconds(L0_75)
              end
            end)
            L1_69 = L1_69 + 1
          end
        end
      end
      break
    end
  end
end
function actCrowFanRand(A0_76)
  local L1_77, L2_78, L3_79, L4_80, L5_81
  L1_77 = Fn_findNpc
  L2_78 = A0_76
  L1_77 = L1_77(L2_78)
  L2_78 = string
  L2_78 = L2_78.match
  L3_79 = A0_76
  L4_80 = "%d"
  L2_78 = L2_78(L3_79, L4_80)
  if L1_77 == nil then
    return
  end
  L4_80 = L1_77
  L3_79 = L1_77.getPuppet
  L3_79 = L3_79(L4_80)
  L4_80 = {
    L5_81,
    "stay_rescued_01",
    "talk_laugh_00",
    "talk_cid_01",
    "lookaround"
  }
  L5_81 = "wavehand_far_00"
  L5_81 = {
    "wavehand_near_00",
    "greeting",
    "talk_laugh_00",
    "talk_cid_02",
    "surprise_00"
  }
  return (invokeTask(function()
    local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89
    L0_82 = Fn_turnNpc
    L1_83 = L1_77
    L0_82(L1_83)
    L0_82 = {}
    L1_83 = {}
    while true do
      L2_84 = math
      L2_84 = L2_84.randomseed
      L3_85 = tonumber
      L4_86 = L2_78
      L7_89 = L3_85(L4_86)
      L2_84(L3_85, L4_86, L5_87, L6_88, L7_89, L3_85(L4_86))
      L2_84 = RandF
      L3_85 = 1
      L2_84 = L2_84(L3_85)
      L3_85 = waitSeconds
      L4_86 = L2_84
      L3_85(L4_86)
      L3_85 = Fn_getPlayer
      L3_85 = L3_85()
      L4_86 = L3_85
      L3_85 = L3_85.getWorldPos
      L3_85 = L3_85(L4_86)
      L4_86 = L3_79
      L5_87 = L4_86
      L4_86 = L4_86.getWorldPos
      L4_86 = L4_86(L5_87)
      L5_87 = L3_85.y
      L6_88 = L4_86.y
      L6_88 = L6_88 + 10
      L6_88 = L6_88 + 1.5
      if L5_87 > L6_88 then
        L0_82 = L4_80
      else
        L0_82 = L5_81
      end
      L5_87 = RandI
      L6_88 = #L0_82
      L5_87 = L5_87(L6_88)
      L6_88 = Fn_playMotionNpc
      L7_89 = A0_76
      L6_88(L7_89, L0_82[L5_87], false, {animBlendDuration = 1.5})
      L6_88 = {}
      L7_89 = L3_79
      L6_88.base = L7_89
      L6_88.base_joint = "bn_head"
      L7_89 = Fn_getPlayer
      L7_89 = L7_89()
      L6_88.target = L7_89
      L6_88.angle = 45
      L6_88.dist = 50
      while true do
        L7_89 = L1_77
        L7_89 = L7_89.isMotionEnd
        L7_89 = L7_89(L7_89)
        if L7_89 == false then
          L7_89 = Fn_isEyeSight
          L7_89 = L7_89(L6_88)
          if L7_89 == false then
            L7_89 = math
            L7_89 = L7_89.randomseed
            L7_89(tonumber(L2_78))
            L7_89 = RandF
            L7_89 = L7_89(1)
            waitSeconds(L7_89)
            Fn_playMotionNpc(A0_76, "stay_01", false, {animBlendDuration = 1.5})
            waitSeconds(1.5)
            if L3_85.y > L4_86.y + 10 + 1.5 then
              print("\227\129\157\227\129\147\227\129\157\227\129\147\233\171\152\227\129\132")
              L6_88 = {
                upperAnim = "wavehand_far_00"
              }
            else
              print("\230\175\148\232\188\131\231\154\132\232\191\145\227\129\132")
              L6_88 = {
                upperAnim = "wavehand_near_00"
              }
            end
            Fn_turnNpc(A0_76, nil, L6_88)
            break
          end
        end
        L7_89 = wait
        L7_89()
      end
    end
  end))
end
function fanVoicePlay(A0_90)
  local L1_91, L2_92
  L2_92 = A0_90
  L1_91 = A0_90.getName
  L1_91 = L1_91(L2_92)
  L2_92 = string
  L2_92 = L2_92.match
  L2_92 = L2_92(L1_91, "%d")
  return (invokeTask(function()
    local L0_93, L1_94, L2_95, L3_96
    while true do
      L0_93 = {
        L1_94,
        L2_95,
        L3_96,
        "w20_003",
        "w21_001",
        "w21_003",
        "w19_918",
        "w19_920",
        "w20_918",
        "w20_920",
        "w21_918",
        "w21_920"
      }
      L1_94 = "w19_003"
      L2_95 = "w19_005"
      L3_96 = "w20_001"
      L1_94 = math
      L1_94 = L1_94.randomseed
      L2_95 = tonumber
      L3_96 = L2_92
      L3_96 = L2_95(L3_96)
      L1_94(L2_95, L3_96, L2_95(L3_96))
      L1_94 = RandI
      L2_95 = #L0_93
      L1_94 = L1_94(L2_95)
      L2_95 = Sound
      L3_96 = L2_95
      L2_95 = L2_95.playSEHandle
      L2_95 = L2_95(L3_96, L0_93[L1_94], 1, "", A0_90)
      L3_96 = Sound
      L3_96 = L3_96.setAudibleRange
      L3_96(L3_96, L2_95, 60)
      L3_96 = RandF
      L3_96 = L3_96(3)
      waitSeconds(L3_96)
      L2_95 = nil
    end
  end))
end
function crowFanOnEnter(A0_97)
  _crowfan_act = true
  Fn_pcSensorOff(A0_97)
end
