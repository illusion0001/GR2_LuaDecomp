dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep27_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_npc_tbl = {}
_puppet_tbl = {}
_event_mot = {}
_sdemo = nil
_missing_flg = false
_next_phase = false
_check_obj = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Font
  L1_1 = L0_0
  L0_0 = L0_0.openTextSet
  L0_0(L1_1, L2_2)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_missing_dusty"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_missing_dusty2"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_missing_dusty3"
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_start_pos"
  L0_0(L1_1)
  L0_0 = Fn_setAreaWarp
  L1_1 = "ve_crane_root"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_createGimmickBg
  L1_1 = "locator2_woodbox_01"
  L0_0 = L0_0(L1_1, L2_2, L3_3, L4_4, L5_5)
  L1_1 = L0_0.switchGravityGrabAsWeapon
  L1_1(L2_2, L3_3)
  L1_1 = L0_0.setIgnoreGrab
  L1_1(L2_2, L3_3)
  L1_1 = L0_0.setMoveThreshold
  L1_1(L2_2, L3_3)
  L1_1 = L0_0.setActive
  L1_1(L2_2, L3_3)
  L1_1 = {
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    {
      name = "phi01",
      type = "phi01",
      node = "locator2_27b_phi01",
      active = false
    },
    {
      name = "man50",
      type = "man50",
      node = "locator2_man50",
      active = false
    },
    {
      name = "man51",
      type = "man51",
      node = "locator2_man51",
      active = false
    },
    {
      name = "man52",
      type = "man52",
      node = "locator2_man52"
    },
    {
      name = "man38",
      type = "man38",
      node = "locator2_mob_man38"
    },
    {
      name = "chi",
      type = "chi19",
      node = "locator2_hint_chi",
      active = false,
      color_variation = 3,
      hair_variation = 1,
      anim_name = "sit_floor_00"
    },
    {
      name = "wom",
      type = "wom01",
      node = "locator2_hint_wom",
      active = false,
      color_variation = 2,
      hair_variation = 1
    }
  }
  L2_2.name = "ryz02"
  L2_2.type = "ryz02"
  L2_2.node = "locator2_27b_ryz02"
  L3_3.name = "sis01"
  L3_3.type = "sis01"
  L3_3.node = "locator2_27b_sis01"
  L3_3.anim_name = "stay_02"
  L4_4.name = "miz01"
  L4_4.type = "miz01"
  L4_4.node = "locator2_27b_miz01"
  L4_4.active = false
  L5_5.name = "gawan"
  L5_5.type = "man34"
  L5_5.node = "locator2_27b_man34"
  L5_5.active = false
  L6_6 = {}
  L6_6.name = "vog01"
  L6_6.type = "vog01"
  L6_6.node = "locator2_27b_vog01"
  L6_6.active = false
  _npc_tbl = L2_2
  for L5_5, L6_6 in L2_2(L3_3) do
    _puppet_tbl[L6_6.name] = Fn_findNpcPuppet(L6_6.name)
  end
  L2_2.wavehand_00 = "sis01_wavehand_00"
  _event_mot = L2_2
  L2_2(L3_3, L4_4)
  _sdemo = L2_2
  L2_2(L3_3)
  L2_2(L3_3, L4_4)
  L3_3.node = "locator2_woodboxvogo_01"
  L3_3.mdl = "woodboxvogo_kk_02"
  L4_4.node = "locator2_woodboxvogo_02"
  L4_4.mdl = "woodboxvogo_kk_03"
  L5_5.node = "locator2_woodboxvogo_03"
  L5_5.mdl = "woodboxvogo_kk_01"
  L6_6 = {}
  L6_6.node = "locator2_woodboxvogo_04"
  L6_6.mdl = "woodboxvogo_kk_01"
  for L6_6, _FORV_7_ in L3_3(L4_4) do
    Fn_createTerrainBg(_FORV_7_.node, "tbg_vogo_" .. L6_6, _FORV_7_.mdl, false)
  end
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35
  L0_7 = {
    L1_8,
    L2_9,
    L3_10,
    L4_11,
    L5_12,
    L6_13,
    L7_14
  }
  L1_8 = {}
  L1_8.name = "ryz"
  L1_8.pos = "RT"
  L1_8.chara = "ui_chara_17"
  L1_8.cv = "ui_cv_17"
  L2_9 = {}
  L2_9.name = "sis"
  L2_9.pos = "RB"
  L2_9.chara = "ui_chara_18"
  L2_9.cv = "ui_cv_18"
  L3_10 = {}
  L3_10.name = "vog"
  L3_10.pos = "RT"
  L3_10.chara = "ui_chara_19"
  L3_10.cv = "ui_cv_19"
  L4_11 = {}
  L4_11.name = "phi"
  L4_11.pos = "LT"
  L4_11.chara = "ui_chara_20"
  L4_11.cv = "ui_cv_20"
  L5_12 = {}
  L5_12.name = "gaw"
  L5_12.pos = "RT"
  L5_12.chara = "ui_chara_21"
  L5_12.cv = "ui_cv_21"
  L6_13 = {}
  L6_13.name = "miz"
  L6_13.pos = "RB"
  L6_13.chara = "ui_chara_22"
  L6_13.cv = "ui_cv_22"
  L7_14 = {}
  L7_14.name = "ele"
  L7_14.pos = "LB"
  L7_14.chara = "ui_chara_25"
  L7_14.cv = "ui_cv_25"
  L1_8 = findGameObject2
  L2_9 = "GimmickBg"
  L3_10 = "box_for_delivery"
  L1_8 = L1_8(L2_9, L3_10)
  L2_9 = {L3_10, L4_11}
  L3_10 = "box_for_delivery"
  L4_11 = "dyn_box_for_delivery"
  function L3_10(A0_36)
    local L1_37
    L1_37 = A0_36.getDynamicObject
    L1_37 = L1_37(A0_36)
    L1_37:setName("dyn_box_for_delivery")
    if L1_37:isGrabbed() == false then
      Fn_naviSet(L1_37)
      L1_37:setMoveThreshold(0)
    end
  end
  L5_12 = L1_8
  L4_11 = L1_8.setEventListener
  L6_13 = "dynamic"
  L7_14 = L3_10
  L4_11(L5_12, L6_13, L7_14)
  L4_11 = findGameObject2
  L5_12 = "Node"
  L6_13 = "bg2_woodbox_01_2"
  L4_11 = L4_11(L5_12, L6_13)
  L6_13 = L4_11
  L5_12 = L4_11.setActive
  L7_14 = false
  L5_12(L6_13, L7_14)
  L5_12 = Fn_playLoopMotionRand
  L6_13 = "man52"
  L7_14 = {L8_15, L9_16}
  L8_15 = "talk_03"
  L9_16 = "talk_02"
  L8_15 = 5
  L9_16 = 10
  L5_12(L6_13, L7_14, L8_15, L9_16)
  L5_12 = Fn_playLoopMotionRand
  L6_13 = "man38"
  L7_14 = {
    L8_15,
    L9_16,
    L10_17
  }
  L8_15 = "talk_01"
  L9_16 = "talk_sad_00"
  L10_17 = "talk_sad_02"
  L8_15 = 5
  L9_16 = 10
  L5_12(L6_13, L7_14, L8_15, L9_16)
  L5_12 = {}
  L5_12.degree_h = 180
  L5_12.degree_v = 130
  L5_12.valid = true
  L5_12.watchTarget = true
  L5_12.targetJoint = "bn_head"
  L5_12.onlyFace = true
  L6_13 = _npc_tbl
  L6_13 = L6_13.sis01
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.ryz02
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.miz01
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.gawan
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.man50
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.man51
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.phi01
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L6_13 = Fn_sendEventComSb
  L7_14 = "checkPhaseNum"
  L6_13 = L6_13(L7_14)
  while true do
    if L6_13 < 3 then
      L6_13 = Fn_sendEventComSb
      L7_14 = "checkPhaseNum"
      L6_13 = L6_13(L7_14)
    end
    if L6_13 ~= 2 then
      L6_13 = wait
      L6_13()
    end
  end
  L6_13 = Fn_disableCostumeChange
  L7_14 = true
  L6_13(L7_14)
  L6_13 = Fn_missionStart
  L6_13()
  L6_13 = Fn_missionView
  L7_14 = "ep27_01001"
  L8_15, L9_16 = nil, nil
  L10_17 = true
  L6_13(L7_14, L8_15, L9_16, L10_17)
  L6_13 = Fn_userCtrlOn
  L6_13()
  L6_13 = Fn_naviSet
  L7_14 = _puppet_tbl
  L7_14 = L7_14.ryz02
  L6_13(L7_14)
  L6_13 = waitSeconds
  L7_14 = 1
  L6_13(L7_14)
  L6_13 = Fn_captionView
  L7_14 = "ep27_01000"
  L6_13(L7_14)
  L6_13 = waitSeconds
  L7_14 = 3
  L6_13(L7_14)
  L6_13 = wait
  L7_14 = 38
  L6_13(L7_14)
  L6_13 = ep27telopView
  L7_14 = L0_7
  L8_15 = "ryz"
  L6_13(L7_14, L8_15)
  L6_13 = _npc_tbl
  L6_13 = L6_13.sis01
  L7_14 = L6_13
  L6_13 = L6_13.setSightParam
  L8_15 = {}
  L8_15.in_length = 35
  L8_15.out_length = 50
  L8_15.targetJoint = "bn_head"
  L6_13(L7_14, L8_15)
  repeat
    L6_13 = wait
    L6_13()
    L6_13 = Fn_getDistanceToPlayer
    L7_14 = _puppet_tbl
    L7_14 = L7_14.ryz02
    L8_15 = L7_14
    L7_14 = L7_14.getWorldPos
    L28_35 = L7_14(L8_15)
    L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L7_14(L8_15))
  until L6_13 < 60
  repeat
    L6_13 = wait
    L6_13()
    L6_13 = Fn_getDistanceToPlayer
    L7_14 = _puppet_tbl
    L7_14 = L7_14.ryz02
    L8_15 = L7_14
    L7_14 = L7_14.getWorldPos
    L28_35 = L7_14(L8_15)
    L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L7_14(L8_15))
  until L6_13 < 40
  L6_13 = invokeTask
  function L7_14()
    Fn_turnNpc("sis01")
    Sound:setAudibleRange(Sound:playSEHandle("sis_140", 1), 40)
    Fn_captionView("ep27_01002", 2)
    Fn_playNpcEventMotion("sis01", _event_mot.wavehand_00)
    Fn_playMotionNpc("sis01", "stay_02", false)
    waitSeconds(1)
    Fn_turnNpc("ryz02")
    _npc_tbl.ryz02:setSightParam({
      in_length = 35,
      out_length = 50,
      targetJoint = "bn_head"
    })
  end
  L6_13(L7_14)
  repeat
    L6_13 = wait
    L6_13()
    L6_13 = Fn_getDistanceToPlayer
    L7_14 = _puppet_tbl
    L7_14 = L7_14.ryz02
    L8_15 = L7_14
    L7_14 = L7_14.getWorldPos
    L28_35 = L7_14(L8_15)
    L6_13 = L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L7_14(L8_15))
  until L6_13 < 2.5
  L6_13 = Fn_naviKill
  L6_13()
  L6_13 = Player
  L7_14 = L6_13
  L6_13 = L6_13.setStay
  L8_15 = true
  L6_13(L7_14, L8_15)
  L6_13 = invokeTask
  function L7_14()
    Fn_turnNpc("ryz02")
  end
  L6_13 = L6_13(L7_14)
  L7_14 = inSensorGravityCtrlModeOff
  L7_14 = L7_14()
  if L7_14 then
    L8_15 = Player
    L9_16 = L8_15
    L8_15 = L8_15.setLookAtIk
    L10_17 = true
    L11_18 = 0.6
    L12_19 = _puppet_tbl
    L12_19 = L12_19.sis01
    L13_20 = L12_19
    L12_19 = L12_19.getWorldTransform
    L28_35 = L12_19(L13_20)
    L8_15(L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L12_19(L13_20))
    L8_15 = waitSeconds
    L9_16 = 0.6
    L8_15(L9_16)
  end
  while true do
    L9_16 = L6_13
    L8_15 = L6_13.isRunning
    L8_15 = L8_15(L9_16)
    if L8_15 then
      L8_15 = wait
      L8_15()
    end
  end
  L8_15 = Fn_kaiwaDemoView
  L9_16 = "ep27_00170k"
  L8_15(L9_16)
  if L7_14 then
    L8_15 = Player
    L9_16 = L8_15
    L8_15 = L8_15.setLookAtIk
    L10_17 = false
    L11_18 = 1
    L12_19 = Vector
    L13_20 = 0
    L14_21 = 0
    L15_22 = 0
    L28_35 = L12_19(L13_20, L14_21, L15_22)
    L8_15(L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L12_19(L13_20, L14_21, L15_22))
  end
  L8_15 = wait
  L9_16 = 38
  L8_15(L9_16)
  L8_15 = ep27telopView
  L9_16 = L0_7
  L10_17 = "sis"
  L8_15(L9_16, L10_17)
  L8_15 = Fn_setNpcActive
  L9_16 = "vog01"
  L10_17 = true
  L8_15(L9_16, L10_17)
  L8_15 = Fn_setNpcActive
  L9_16 = "phi01"
  L10_17 = true
  L8_15(L9_16, L10_17)
  L8_15 = Fn_setNpcActive
  L9_16 = "man50"
  L10_17 = true
  L8_15(L9_16, L10_17)
  L8_15 = Fn_setNpcActive
  L9_16 = "man51"
  L10_17 = true
  L8_15(L9_16, L10_17)
  L9_16 = L1_8
  L8_15 = L1_8.setActive
  L10_17 = true
  L8_15(L9_16, L10_17)
  L8_15 = _npc_tbl
  L8_15 = L8_15.ryz02
  L9_16 = L8_15
  L8_15 = L8_15.resetSightParam
  L8_15(L9_16)
  L8_15 = _npc_tbl
  L8_15 = L8_15.sis01
  L9_16 = L8_15
  L8_15 = L8_15.resetSightParam
  L8_15(L9_16)
  L8_15 = _npc_tbl
  L8_15 = L8_15.ryz02
  L9_16 = L8_15
  L8_15 = L8_15.setSightParam
  L10_17 = {}
  L10_17.degree_h = 60
  L10_17.degree_v = 45
  L10_17.watchTarget = false
  L10_17.valid = false
  L8_15(L9_16, L10_17)
  L8_15 = _npc_tbl
  L8_15 = L8_15.sis01
  L9_16 = L8_15
  L8_15 = L8_15.setSightParam
  L10_17 = {}
  L10_17.degree_h = 60
  L10_17.degree_v = 45
  L10_17.watchTarget = false
  L10_17.valid = false
  L8_15(L9_16, L10_17)
  L8_15 = Fn_watchNpc
  L9_16 = "ryz02"
  L10_17 = false
  L8_15(L9_16, L10_17)
  L8_15 = Fn_watchNpc
  L9_16 = "sis01"
  L10_17 = false
  L8_15(L9_16, L10_17)
  L8_15 = {}
  L8_15.in_length = 25
  L8_15.out_length = 30
  L8_15.targetJoint = "bn_head"
  L9_16 = _npc_tbl
  L9_16 = L9_16.phi01
  L10_17 = L9_16
  L9_16 = L9_16.setSightParam
  L11_18 = L8_15
  L9_16(L10_17, L11_18)
  L9_16 = _npc_tbl
  L9_16 = L9_16.man50
  L10_17 = L9_16
  L9_16 = L9_16.setSightParam
  L11_18 = L8_15
  L9_16(L10_17, L11_18)
  L9_16 = _npc_tbl
  L9_16 = L9_16.man51
  L10_17 = L9_16
  L9_16 = L9_16.setSightParam
  L11_18 = L8_15
  L9_16(L10_17, L11_18)
  L9_16 = actNpc
  L9_16 = L9_16()
  L10_17 = findGameObject2
  L11_18 = "Node"
  L12_19 = "locator2_27b_vog0_Loc"
  L10_17 = L10_17(L11_18, L12_19)
  L11_18 = Fn_captionView
  L12_19 = "ep27_01003"
  L13_20 = 2.5
  L11_18(L12_19, L13_20)
  L11_18 = Sound
  L12_19 = L11_18
  L11_18 = L11_18.playSE
  L13_20 = "vog_935b_ingame"
  L14_21 = 1
  L15_22 = ""
  L16_23 = L10_17
  L11_18(L12_19, L13_20, L14_21, L15_22, L16_23)
  L11_18 = waitSeconds
  L12_19 = 0.8
  L11_18(L12_19)
  L11_18 = Sound
  L12_19 = L11_18
  L11_18 = L11_18.playSE
  L13_20 = "vog016c_1_ingame"
  L14_21 = 1
  L15_22 = ""
  L16_23 = L10_17
  L11_18(L12_19, L13_20, L14_21, L15_22, L16_23)
  L11_18 = waitSeconds
  L12_19 = 1
  L11_18(L12_19)
  L11_18 = Player
  L12_19 = L11_18
  L11_18 = L11_18.setLookAtIk
  L13_20 = true
  L14_21 = 1
  L15_22 = _puppet_tbl
  L15_22 = L15_22.vog01
  L16_23 = L15_22
  L15_22 = L15_22.getWorldPos
  L28_35 = L15_22(L16_23)
  L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L15_22(L16_23))
  L11_18 = Fn_lookAtTargetInput
  L12_19 = _puppet_tbl
  L12_19 = L12_19.vog01
  L13_20 = 1.5
  L11_18(L12_19, L13_20)
  L11_18 = waitSeconds
  L12_19 = 1
  L11_18(L12_19)
  L11_18 = Fn_captionView
  L12_19 = "ep27_01004"
  L13_20 = 2
  L11_18(L12_19, L13_20)
  L11_18 = waitSeconds
  L12_19 = 1
  L11_18(L12_19)
  L11_18 = Player
  L12_19 = L11_18
  L11_18 = L11_18.setStay
  L13_20 = false
  L11_18(L12_19, L13_20)
  L11_18 = Player
  L12_19 = L11_18
  L11_18 = L11_18.setLookAtIk
  L13_20 = false
  L14_21 = 1
  L15_22 = Vector
  L16_23 = 0
  L17_24 = 0
  L18_25 = 0
  L28_35 = L15_22(L16_23, L17_24, L18_25)
  L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L15_22(L16_23, L17_24, L18_25))
  L11_18 = waitSeconds
  L12_19 = 1
  L11_18(L12_19)
  L11_18 = Fn_naviSet
  L12_19 = _puppet_tbl
  L12_19 = L12_19.vog01
  L11_18(L12_19)
  repeat
    L11_18 = wait
    L11_18()
    L11_18 = Fn_getDistanceToPlayer
    L12_19 = _puppet_tbl
    L12_19 = L12_19.vog01
    L13_20 = L12_19
    L12_19 = L12_19.getWorldPos
    L28_35 = L12_19(L13_20)
    L11_18 = L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L12_19(L13_20))
  until L11_18 < 2.5
  L11_18 = Fn_naviKill
  L11_18()
  L11_18 = Player
  L12_19 = L11_18
  L11_18 = L11_18.setGrabExceptionalObject
  L13_20 = L2_9
  L11_18(L12_19, L13_20)
  L11_18 = Player
  L12_19 = L11_18
  L11_18 = L11_18.setAbility
  L13_20 = Player
  L13_20 = L13_20.kAbility_Grab
  L14_21 = false
  L11_18(L12_19, L13_20, L14_21)
  L11_18 = Fn_setCatWarpCheckPoint
  L12_19 = "locator2_crow01"
  L11_18(L12_19)
  L11_18 = ep27telopEnd
  L12_19 = L0_7
  L13_20 = "sis"
  L11_18(L12_19, L13_20)
  L11_18 = pcStayCamStopOn
  L11_18()
  L11_18 = inSensorGravityCtrlModeOff
  L11_18 = L11_18()
  if L11_18 then
    L12_19 = Player
    L13_20 = L12_19
    L12_19 = L12_19.setLookAtIk
    L14_21 = true
    L15_22 = 0.6
    L16_23 = _puppet_tbl
    L16_23 = L16_23.vog01
    L17_24 = L16_23
    L16_23 = L16_23.getWorldTransform
    L28_35 = L16_23(L17_24)
    L12_19(L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L16_23(L17_24))
    L12_19 = waitSeconds
    L13_20 = 0.6
    L12_19(L13_20)
  end
  L12_19 = invokeTask
  function L13_20()
    Fn_turnNpc("vog01")
  end
  L12_19 = L12_19(L13_20)
  while true do
    L14_21 = L12_19
    L13_20 = L12_19.isRunning
    L13_20 = L13_20(L14_21)
    if L13_20 then
      L13_20 = wait
      L13_20()
    end
  end
  L13_20 = Fn_killNpcTask
  L14_21 = "vog01"
  L13_20(L14_21)
  L14_21 = L9_16
  L13_20 = L9_16.abort
  L13_20(L14_21)
  L9_16 = nil
  L13_20 = Fn_killNpcTask
  L14_21 = "phi01"
  L13_20(L14_21)
  L13_20 = Fn_playMotionNpc
  L14_21 = "vog01"
  L15_22 = "stay_01"
  L16_23 = false
  L17_24 = {}
  L17_24.animBlendDuration = 0.5
  L13_20(L14_21, L15_22, L16_23, L17_24)
  L13_20 = Fn_kaiwaDemoView
  L14_21 = "ep27_00180k"
  L13_20(L14_21)
  L13_20 = invokeTask
  function L14_21()
    ep27telopView(L0_7, "vog")
    Fn_missionView("ep27_01005", nil, nil, true)
    Fn_captionView("ep27_01006")
    _npc_tbl.vog01:setSightParam(L8_15)
  end
  L13_20(L14_21)
  L14_21 = L1_8
  L13_20 = L1_8.setIgnoreGrab
  L15_22 = false
  L13_20(L14_21, L15_22)
  if L11_18 then
    L13_20 = Player
    L14_21 = L13_20
    L13_20 = L13_20.setLookAtIk
    L15_22 = false
    L16_23 = 1
    L17_24 = Vector
    L18_25 = 0
    L19_26 = 0
    L20_27 = 0
    L28_35 = L17_24(L18_25, L19_26, L20_27)
    L13_20(L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L17_24(L18_25, L19_26, L20_27))
  end
  L13_20 = pcStayCamStopOff
  L13_20()
  L13_20 = Fn_naviSet
  L14_21 = L1_8
  L13_20(L14_21)
  L13_20 = wait
  L14_21 = 5
  L13_20(L14_21)
  L13_20 = Player
  L14_21 = L13_20
  L13_20 = L13_20.setAbility
  L15_22 = Player
  L15_22 = L15_22.kAbility_Grab
  L16_23 = true
  L13_20(L14_21, L15_22, L16_23)
  while true do
    if L1_8 then
      L14_21 = L1_8
      L13_20 = L1_8.isGrabbed
      L13_20 = L13_20(L14_21)
      if L13_20 then
        L14_21 = L1_8
        L13_20 = L1_8.isGrabReleasePermission
        L13_20 = L13_20(L14_21)
        if L13_20 then
          L14_21 = L1_8
          L13_20 = L1_8.setGrabReleasePermission
          L15_22 = false
          L13_20(L14_21, L15_22)
        end
        break
      end
    else
      L14_21 = L1_8
      L13_20 = L1_8.getDynamicObject
      L13_20 = L13_20(L14_21)
      if L13_20 then
        L14_21 = L1_8
        L13_20 = L1_8.getDynamicObject
        L13_20 = L13_20(L14_21)
        L14_21 = L13_20
        L13_20 = L13_20.isGrabbed
        L13_20 = L13_20(L14_21)
        if L13_20 then
          L14_21 = L1_8
          L13_20 = L1_8.getDynamicObject
          L13_20 = L13_20(L14_21)
          L15_22 = L13_20
          L14_21 = L13_20.isGrabReleasePermission
          L14_21 = L14_21(L15_22)
          if L14_21 then
            L15_22 = L13_20
            L14_21 = L13_20.setGrabReleasePermission
            L16_23 = false
            L14_21(L15_22, L16_23)
          end
          break
        end
      end
    end
    L13_20 = wait
    L13_20()
  end
  L13_20 = Fn_naviKill
  L13_20()
  function L13_20()
    L1_8:requestRestoreForce()
    wait()
    while Player:setGrabObject(L1_8) == false do
      wait()
    end
    Fn_naviKill()
    Fn_naviSet(_puppet_tbl.gawan)
  end
  _warp_add_func = L13_20
  L14_21 = {}
  L14_21.sit_floor_out_00 = "man01_sit_floor_out_00"
  L15_22 = Fn_loadNpcEventMotion
  L16_23 = "phi01"
  L17_24 = L14_21
  L15_22(L16_23, L17_24)
  L15_22 = Fn_playNpcEventMotion
  L16_23 = "phi01"
  L17_24 = L14_21.sit_floor_out_00
  L18_25 = false
  L19_26 = 0.5
  L20_27 = true
  L21_28 = 0
  L22_29 = true
  L15_22(L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29)
  L15_22 = Fn_playMotionNpc
  L16_23 = "phi01"
  L17_24 = "stay_02"
  L18_25 = false
  L19_26 = {}
  L19_26.animBlendDuration = 0.5
  L15_22(L16_23, L17_24, L18_25, L19_26)
  L15_22 = wait
  L16_23 = 10
  L15_22(L16_23)
  L15_22 = Fn_setNpcActive
  L16_23 = "gawan"
  L17_24 = true
  L15_22(L16_23, L17_24)
  L15_22 = Fn_naviSet
  L16_23 = _puppet_tbl
  L16_23 = L16_23.gawan
  L15_22(L16_23)
  L15_22 = findGameObject2
  L16_23 = "Node"
  L17_24 = "bg2_ve_a_root"
  L15_22 = L15_22(L16_23, L17_24)
  repeat
    L16_23 = wait
    L16_23()
    L16_23 = Fn_getDistanceToPlayer
    L18_25 = L15_22
    L17_24 = L15_22.getWorldPos
    L28_35 = L17_24(L18_25)
    L16_23 = L16_23(L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L17_24(L18_25))
  until L16_23 < 135
  L16_23 = ep27telopEnd
  L17_24 = L0_7
  L18_25 = "vog"
  L16_23(L17_24, L18_25)
  L16_23 = waitSeconds
  L17_24 = 1
  L16_23(L17_24)
  L16_23 = ep27telopView
  L17_24 = L0_7
  L18_25 = "phi"
  L16_23(L17_24, L18_25)
  repeat
    L16_23 = wait
    L16_23()
    L16_23 = Fn_getDistanceToPlayer
    L18_25 = L15_22
    L17_24 = L15_22.getWorldPos
    L28_35 = L17_24(L18_25)
    L16_23 = L16_23(L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L17_24(L18_25))
  until L16_23 < 60
  L16_23 = Fn_captionView
  L17_24 = "ep27_01007"
  L16_23(L17_24)
  L16_23 = Sound
  L17_24 = L16_23
  L16_23 = L16_23.playSE
  L18_25 = "cro_247"
  L16_23(L17_24, L18_25)
  L16_23 = _npc_tbl
  L16_23 = L16_23.gawan
  L17_24 = L16_23
  L16_23 = L16_23.setSightParam
  L18_25 = {}
  L18_25.in_length = 40
  L18_25.out_length = 50
  L18_25.targetJoint = "bn_head"
  L16_23(L17_24, L18_25)
  repeat
    L16_23 = wait
    L16_23()
    L16_23 = Fn_getDistanceToPlayer
    L17_24 = _puppet_tbl
    L17_24 = L17_24.gawan
    L18_25 = L17_24
    L17_24 = L17_24.getWorldPos
    L28_35 = L17_24(L18_25)
    L16_23 = L16_23(L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L17_24(L18_25))
  until L16_23 < 30
  L16_23 = invokeTask
  function L17_24()
    Fn_turnNpc("gawan")
    waitSeconds(0.5)
    Fn_playMotionNpc("gawan", "greeting")
  end
  L16_23(L17_24)
  repeat
    L16_23 = wait
    L16_23()
    L16_23 = Fn_getDistanceToPlayer
    L17_24 = _puppet_tbl
    L17_24 = L17_24.gawan
    L18_25 = L17_24
    L17_24 = L17_24.getWorldPos
    L28_35 = L17_24(L18_25)
    L16_23 = L16_23(L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L17_24(L18_25))
  until L16_23 < 2.5
  L16_23 = Fn_naviKill
  L16_23()
  L16_23 = Fn_missionInfoEnd
  L16_23()
  L16_23 = ep27telopEnd
  L17_24 = L0_7
  L18_25 = "phi"
  L16_23(L17_24, L18_25)
  _warp_add_func = nil
  L16_23 = Fn_setCatWarpCheckPoint
  L17_24 = "locator2_cro_pos_01"
  L16_23(L17_24)
  L16_23 = Fn_blackout
  L16_23()
  L16_23 = Fn_userCtrlAllOff
  L16_23()
  L17_24 = L1_8
  L16_23 = L1_8.getDynamicObject
  L16_23 = L16_23(L17_24)
  L18_25 = L1_8
  L17_24 = L1_8.setGrabReleaseForce
  L19_26 = true
  L17_24(L18_25, L19_26)
  L18_25 = L1_8
  L17_24 = L1_8.try_term
  L17_24(L18_25)
  L17_24 = wait
  L17_24()
  L18_25 = L16_23
  L17_24 = L16_23.setActive
  L19_26 = false
  L17_24(L18_25, L19_26)
  L18_25 = L4_11
  L17_24 = L4_11.setActive
  L19_26 = true
  L17_24(L18_25, L19_26)
  L17_24 = Player
  L18_25 = L17_24
  L17_24 = L17_24.setGrabExceptionalObject
  L19_26 = {}
  L17_24(L18_25, L19_26)
  L17_24 = {
    L18_25,
    L19_26,
    L20_27
  }
  L18_25 = Player
  L18_25 = L18_25.kAbility_Grab
  L19_26 = Player
  L19_26 = L19_26.kAbility_ExGrab
  L20_27 = Player
  L20_27 = L20_27.kAbility_Throw
  L18_25 = Fn_lockPlayerAbility
  L19_26 = L17_24
  L18_25(L19_26)
  L18_25 = wait
  L18_25()
  L18_25 = findGameObject2
  L19_26 = "Node"
  L20_27 = "locator2_cro_pos_01"
  L18_25 = L18_25(L19_26, L20_27)
  L19_26 = Fn_resetPcPos
  L20_27 = L18_25
  L19_26(L20_27)
  L19_26 = Fn_coercionPoseNomal
  L19_26()
  L19_26 = Fn_setNpcActive
  L20_27 = "miz01"
  L21_28 = true
  L19_26(L20_27, L21_28)
  L19_26 = _npc_tbl
  L19_26 = L19_26.miz01
  L20_27 = L19_26
  L19_26 = L19_26.setSightParam
  L21_28 = {}
  L21_28.in_length = 45
  L21_28.out_length = 50
  L19_26(L20_27, L21_28)
  L19_26 = wait
  L19_26()
  L19_26 = Fn_fadein
  L19_26()
  L19_26 = Fn_kaiwaDemoView
  L20_27 = "ep27_00190k"
  L19_26(L20_27)
  L19_26 = Fn_resetCoercionPose
  L19_26()
  L19_26 = ep27telopView
  L20_27 = L0_7
  L21_28 = "gaw"
  L19_26(L20_27, L21_28)
  L19_26 = waitSeconds
  L20_27 = 0.5
  L19_26(L20_27)
  L19_26 = Fn_captionView
  L20_27 = "ep27_01008"
  L19_26(L20_27)
  L19_26 = Sound
  L20_27 = L19_26
  L19_26 = L19_26.setAudibleRange
  L21_28 = Sound
  L22_29 = L21_28
  L21_28 = L21_28.playSEHandle
  L23_30 = "mis_132"
  L24_31 = 1
  L25_32 = ""
  L26_33 = _puppet_tbl
  L26_33 = L26_33.miz01
  L21_28 = L21_28(L22_29, L23_30, L24_31, L25_32, L26_33)
  L22_29 = 60
  L19_26(L20_27, L21_28, L22_29)
  L19_26 = waitSeconds
  L20_27 = 0.8
  L19_26(L20_27)
  L19_26 = _npc_tbl
  L19_26 = L19_26.gawan
  L20_27 = L19_26
  L19_26 = L19_26.resetSightParam
  L19_26(L20_27)
  L19_26 = Player
  L20_27 = L19_26
  L19_26 = L19_26.setLookAtIk
  L21_28 = true
  L22_29 = 1
  L23_30 = _puppet_tbl
  L23_30 = L23_30.miz01
  L24_31 = L23_30
  L23_30 = L23_30.getWorldPos
  L28_35 = L23_30(L24_31)
  L19_26(L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L23_30(L24_31))
  L19_26 = waitSeconds
  L20_27 = 0.6
  L19_26(L20_27)
  L19_26 = invokeTask
  function L20_27()
    Fn_turnNpc("gawan", _puppet_tbl.miz01)
    waitSeconds(2)
    Fn_playMotionNpc("miz01", "wavehand_far_00", false)
  end
  L19_26(L20_27)
  L19_26 = viewControl
  L20_27 = _puppet_tbl
  L20_27 = L20_27.miz01
  L21_28 = nil
  L22_29 = 1.5
  L19_26(L20_27, L21_28, L22_29)
  L19_26 = Player
  L20_27 = L19_26
  L19_26 = L19_26.setLookAtIk
  L21_28 = false
  L22_29 = 1
  L23_30 = Vector
  L24_31 = 0
  L25_32 = 0
  L26_33 = 0
  L28_35 = L23_30(L24_31, L25_32, L26_33)
  L19_26(L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L23_30(L24_31, L25_32, L26_33))
  L19_26 = Fn_userCtrlOn
  L19_26()
  L19_26 = Fn_captionView
  L20_27 = "ep27_01009"
  L21_28 = 5
  L19_26(L20_27, L21_28)
  L19_26 = waitSeconds
  L20_27 = 1
  L19_26(L20_27)
  L19_26 = Fn_naviSet
  L20_27 = _puppet_tbl
  L20_27 = L20_27.miz01
  L19_26(L20_27)
  repeat
    L19_26 = wait
    L19_26()
    L19_26 = Fn_getDistanceToPlayer
    L20_27 = _puppet_tbl
    L20_27 = L20_27.miz01
    L21_28 = L20_27
    L20_27 = L20_27.getWorldPos
    L28_35 = L20_27(L21_28)
    L19_26 = L19_26(L20_27, L21_28, L22_29, L23_30, L24_31, L25_32, L26_33, L27_34, L28_35, L20_27(L21_28))
  until L19_26 < 2.5
  L19_26 = Fn_naviKill
  L19_26()
  L19_26 = ep27telopEnd
  L20_27 = L0_7
  L21_28 = "gaw"
  L19_26(L20_27, L21_28)
  L19_26 = pcStayCamStopOn
  L19_26()
  L19_26 = inSensorGravityCtrlModeOff
  L19_26()
  L19_26 = Fn_kaiwaDemoView
  L20_27 = "ep27_00195k"
  L19_26(L20_27)
  L19_26 = ep27telopView
  L20_27 = L0_7
  L21_28 = "miz"
  L19_26(L20_27, L21_28)
  L19_26 = Fn_pcSensorOn
  L20_27 = "pccubesensor2_missing_dusty"
  L19_26(L20_27)
  L19_26 = Fn_setNpcActive
  L20_27 = "chi"
  L21_28 = true
  L19_26(L20_27, L21_28)
  L19_26 = Fn_setNpcActive
  L20_27 = "wom"
  L21_28 = true
  L19_26(L20_27, L21_28)
  L19_26 = Fn_watchNpc
  L20_27 = "chi"
  L21_28 = false
  L19_26(L20_27, L21_28)
  L19_26 = Fn_watchNpc
  L20_27 = "wom"
  L21_28 = false
  L19_26(L20_27, L21_28)
  L19_26 = Fn_repeatPlayMotion
  L20_27 = "wom"
  L21_28 = "talk_sad_00"
  L22_29 = {L23_30}
  L23_30 = "talk_sad_02"
  L23_30 = 5
  L24_31 = 10
  L19_26 = L19_26(L20_27, L21_28, L22_29, L23_30, L24_31)
  L20_27 = findGameObject2
  L21_28 = "Node"
  L22_29 = "locator2_dusty_se_01"
  L20_27 = L20_27(L21_28, L22_29)
  L21_28 = Sound
  L22_29 = L21_28
  L21_28 = L21_28.setAudibleRange
  L23_30 = Sound
  L24_31 = L23_30
  L23_30 = L23_30.playSEHandle
  L25_32 = "cat_call_4"
  L26_33 = 1
  L27_34 = ""
  L28_35 = L20_27
  L23_30 = L23_30(L24_31, L25_32, L26_33, L27_34, L28_35)
  L24_31 = 40
  L21_28(L22_29, L23_30, L24_31)
  L21_28 = waitSeconds
  L22_29 = 1
  L21_28(L22_29)
  L21_28 = invokeTask
  function L22_29()
    local L0_38
    L0_38 = _npc_tbl
    L0_38 = L0_38.miz01
    L0_38 = L0_38.resetSightParam
    L0_38(L0_38)
    L0_38 = _npc_tbl
    L0_38 = L0_38.miz01
    L0_38 = L0_38.setSightParam
    L0_38(L0_38, {
      degree_h = 60,
      degree_v = 45,
      watchTarget = false,
      valid = false
    })
    L0_38 = Fn_watchNpc
    L0_38("miz01", false)
    L0_38 = createNode
    L0_38 = L0_38(_puppet_tbl.miz01, "miz_se_pos", true)
    Sound:playSE("mis014a", 0.6, "", L0_38)
    Fn_turnNpc("miz01", 180)
  end
  L21_28 = L21_28(L22_29)
  while true do
    L23_30 = L21_28
    L22_29 = L21_28.isRunning
    L22_29 = L22_29(L23_30)
    if L22_29 then
      L22_29 = wait
      L22_29()
    end
  end
  L22_29 = waitSeconds
  L23_30 = 0.5
  L22_29(L23_30)
  L22_29 = Fn_playMotionNpc
  L23_30 = "miz01"
  L24_31 = "lookaround_01"
  L25_32 = false
  L22_29(L23_30, L24_31, L25_32)
  L22_29 = viewControl
  L23_30 = L20_27
  L24_31 = nil
  L25_32 = 1
  L26_33 = 0.3
  L22_29(L23_30, L24_31, L25_32, L26_33)
  L22_29 = Fn_captionView
  L23_30 = "ep27_01011"
  L22_29(L23_30)
  L22_29 = Fn_setBgmPoint
  L23_30 = "event"
  L24_31 = "bgmpoint"
  L22_29(L23_30, L24_31)
  L22_29 = waitSeconds
  L23_30 = 1
  L22_29(L23_30)
  L22_29 = pcStayCamStopOff
  L22_29()
  L22_29 = findGameObject2
  L23_30 = "Node"
  L24_31 = "locator2_missing_dusty"
  L22_29 = L22_29(L23_30, L24_31)
  L23_30 = Fn_naviSet
  L24_31 = L22_29
  L23_30(L24_31)
  L23_30 = waitPhase
  L23_30()
  L23_30 = Fn_naviKill
  L23_30()
  L23_30 = pcStayCamStopOn
  L23_30()
  L23_30 = inSensorGravityCtrlModeOff
  L23_30()
  L23_30 = Fn_pcSensorOn
  L24_31 = "pccubesensor2_missing_dusty2"
  L23_30(L24_31)
  L23_30 = viewControl
  L24_31 = L22_29
  L25_32, L26_33 = nil, nil
  L27_34 = 0.5
  L23_30(L24_31, L25_32, L26_33, L27_34)
  L23_30 = waitSeconds
  L24_31 = 0.7
  L23_30(L24_31)
  L23_30 = Fn_captionView
  L24_31 = "ep27_01012"
  L25_32 = 2.5
  L23_30(L24_31, L25_32)
  L23_30 = waitSeconds
  L24_31 = 1.5
  L23_30(L24_31)
  L24_31 = L19_26
  L23_30 = L19_26.abort
  L23_30(L24_31)
  L23_30 = Fn_repeatPlayMotion
  L24_31 = "wom"
  L25_32 = "talk_angry_02"
  L26_33 = {L27_34}
  L27_34 = "talk_sad_01"
  L27_34 = 2
  L28_35 = 3
  L23_30 = L23_30(L24_31, L25_32, L26_33, L27_34, L28_35)
  L24_31 = waitSeconds
  L25_32 = 1
  L24_31(L25_32)
  L24_31 = Fn_captionView
  L25_32 = "ep27_01013"
  L26_33 = 2.8
  L24_31(L25_32, L26_33)
  L24_31 = invokeTask
  function L25_32()
    Sound:playSE("w16_914b", 1, "", _puppet_tbl.wom)
    waitSeconds(1.6)
    Sound:playSE("w16_011", 1, "", _puppet_tbl.wom)
  end
  L24_31(L25_32)
  L24_31 = waitSeconds
  L25_32 = 0.8
  L24_31(L25_32)
  L24_31 = _puppet_tbl
  L24_31 = L24_31.wom
  L25_32 = viewControl
  L26_33 = L24_31
  L27_34 = 2
  L28_35 = 1
  L25_32(L26_33, L27_34, L28_35, 0.3)
  L25_32 = ep27telopEnd
  L26_33 = L0_7
  L27_34 = "miz"
  L25_32(L26_33, L27_34)
  L25_32 = Fn_captionView
  L26_33 = "ep27_01014"
  L27_34 = 2
  L25_32(L26_33, L27_34)
  L25_32 = findGameObject2
  L26_33 = "Node"
  L27_34 = "locator2_hint_view"
  L25_32 = L25_32(L26_33, L27_34)
  L26_33 = viewControl
  L27_34 = L25_32
  L28_35 = nil
  L26_33(L27_34, L28_35, nil, 0.5)
  L26_33 = pcStayCamStopOff
  L26_33()
  L26_33 = ep27telopView
  L27_34 = L0_7
  L28_35 = "ele"
  L26_33(L27_34, L28_35)
  L26_33 = Sound
  L27_34 = L26_33
  L26_33 = L26_33.playSE
  L28_35 = "m37_005"
  L26_33(L27_34, L28_35, 1, "", _puppet_tbl.chi)
  L26_33 = invokeTask
  function L27_34()
    Fn_playMotionNpc("chi", "sit_floor_out_00", true, {animBlendDuration = 0.5})
    Fn_turnNpc("chi", L24_31)
  end
  L26_33(L27_34)
  L26_33 = waitSeconds
  L27_34 = 2
  L26_33(L27_34)
  L26_33 = Fn_captionView
  L27_34 = "ep27_01015"
  L28_35 = 2
  L26_33(L27_34, L28_35)
  L26_33 = waitSeconds
  L27_34 = 1
  L26_33(L27_34)
  L26_33 = findGameObject2
  L27_34 = "Node"
  L28_35 = "locator2_missing_dusty2"
  L26_33 = L26_33(L27_34, L28_35)
  L22_29 = L26_33
  L26_33 = Fn_naviSet
  L27_34 = L22_29
  L26_33(L27_34)
  L26_33 = Fn_lookAtTargetInput
  L27_34 = L22_29
  L28_35 = 10
  L26_33(L27_34, L28_35)
  L26_33 = waitSeconds
  L27_34 = 1.5
  L26_33(L27_34)
  L26_33 = Fn_captionView
  L27_34 = "ep27_01016"
  L26_33(L27_34)
  L26_33 = waitSeconds
  L27_34 = 1
  L26_33(L27_34)
  L26_33 = invokeTask
  function L27_34()
    local L0_39, L1_40
    L0_39 = Fn_playMotionNpc
    L1_40 = "chi"
    L0_39(L1_40, "reply_yes", false, {animBlendDuration = 0.3})
    L0_39 = waitSeconds
    L1_40 = 1
    L0_39(L1_40)
    L0_39 = Sound
    L1_40 = L0_39
    L0_39 = L0_39.playSE
    L0_39(L1_40, "m37_910c", 1, "", _puppet_tbl.chi)
    L0_39 = Fn_moveNpc
    L1_40 = "chi"
    L0_39 = L0_39(L1_40, {
      "locator2_hint_chi_movepos"
    }, {runLength = 2, goalDirection = true})
    L1_40 = waitSeconds
    L1_40(0.2)
    L1_40 = L23_30
    L1_40 = L1_40.abort
    L1_40(L1_40)
    L1_40 = Sound
    L1_40 = L1_40.playSE
    L1_40(L1_40, "w16_914b", 1, "", _puppet_tbl.wom)
    L1_40 = Fn_turnNpc
    L1_40("wom", "locator2_hint_chi_movepos")
    L1_40 = waitSeconds
    L1_40(1)
    L1_40 = {}
    L1_40.runLength = 3
    L1_40.anim_run_speed = 0.7
    while L0_39:isRunning() do
      wait()
    end
    Fn_turnNpc("chi", _puppet_tbl.wom)
    while Fn_moveNpc("wom", {
      _puppet_tbl.chi
    }, L1_40):isRunning() do
      wait()
    end
    Fn_repeatPlayMotion("chi", "talk_laugh_00", {"talk_00", "talk_01"}, 5, 10)
    Fn_repeatPlayMotion("wom", "talk_sad_00", {"talk_02", "talk_03"}, 5, 10)
  end
  L26_33(L27_34)
  L26_33 = waitPhase
  L26_33()
  L26_33 = Fn_naviKill
  L26_33()
  L26_33 = ep27telopEnd
  L27_34 = L0_7
  L28_35 = "ele"
  L26_33(L27_34, L28_35)
  L26_33 = Fn_setNpcActive
  L27_34 = "wom"
  L28_35 = false
  L26_33(L27_34, L28_35)
  L26_33 = Fn_setNpcActive
  L27_34 = "chi"
  L28_35 = false
  L26_33(L27_34, L28_35)
  L26_33 = Fn_setNpcActive
  L27_34 = "miz01"
  L28_35 = false
  L26_33(L27_34, L28_35)
  L26_33 = Fn_blackout
  L26_33()
  L26_33 = Player
  L27_34 = L26_33
  L26_33 = L26_33.setStay
  L28_35 = true
  L26_33(L27_34, L28_35)
  L26_33 = findGameObject2
  L27_34 = "Node"
  L28_35 = "locator2_cro_pos_03"
  L26_33 = L26_33(L27_34, L28_35)
  L27_34 = Fn_resetPcPos
  L28_35 = L26_33
  L27_34(L28_35)
  L27_34 = wait
  L27_34()
  L27_34 = Fn_fadein
  L28_35 = nil
  L27_34(L28_35, false)
  L27_34 = Fn_pcSensorOn
  L28_35 = "pccubesensor2_missing_dusty3"
  L27_34(L28_35)
  L27_34 = findGameObject2
  L28_35 = "Node"
  L27_34 = L27_34(L28_35, "locator2_finding_dusty")
  L25_32 = L27_34
  L27_34 = _sdemo
  L28_35 = L27_34
  L27_34 = L27_34.set
  L27_34(L28_35, "locator2_sdemo_dus_cam", L26_33, false, Vector(0, 1.5, 0))
  L27_34 = _sdemo
  L28_35 = L27_34
  L27_34 = L27_34.play
  L27_34(L28_35)
  L27_34 = waitSeconds
  L28_35 = 0.5
  L27_34(L28_35)
  L27_34 = Fn_captionViewWait
  L28_35 = "ep27_01017"
  L27_34(L28_35, 2)
  L27_34 = findGameObject2
  L28_35 = "Node"
  L27_34 = L27_34(L28_35, "locator2_dusty_se_02")
  L28_35 = Sound
  L28_35 = L28_35.setAudibleRange
  L28_35(L28_35, Sound:playSEHandle("cat_call_2", 1, "", L27_34), 60)
  L28_35 = waitSeconds
  L28_35(0.3)
  L28_35 = Player
  L28_35 = L28_35.setLookAtIk
  L28_35(L28_35, true, 1, L27_34:getWorldPos())
  L28_35 = waitSeconds
  L28_35(0.8)
  L28_35 = {
    {pos = L27_34, time = 1}
  }
  _sdemo:play(nil, L28_35)
  waitSeconds(2)
  _sdemo:stop()
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Player:setStay(false)
  Fn_captionView("ep27_01019")
  waitSeconds(1)
  L22_29 = findGameObject2("Node", "locator2_missing_dusty3")
  Fn_naviSet(L22_29)
  waitPhase()
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  Mob:restrictFromEnteringSubway(false)
  Fn_disableCostumeChange(false)
end
function waitApproachingCat(A0_41)
  local L1_42
  L1_42 = _puppet_tbl
  L1_42 = L1_42.dus01
  L1_42 = L1_42.getWorldPos
  L1_42 = L1_42(L1_42)
  while A0_41 < Fn_get_distance(L1_42, Fn_getPcPosRot()) do
    wait()
  end
end
function pccubesensor2_missing_dusty_OnEnter()
  Fn_pcSensorOff("pccubesensor2_missing_dusty")
  Fn_setNpcVisible("dus01", true)
  _missing_flg = true
end
function pccubesensor2_missing_dusty2_OnEnter()
  Fn_pcSensorOff("pccubesensor2_missing_dusty2")
  _missing_flg = true
end
function actNpc()
  Fn_playMotionNpc("man50", "stay_02", false)
  Fn_playMotionNpc("man51", "stay_01", false)
  Fn_playMotionNpc("phi01", "sit_floor_00", false)
  return Fn_playLoopMotionInsert("vog01", "confuse_01", {"angry_00"}, 5, 10)
end
