dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_event_now = false
_tunk_noticed = false
_sensor_flg = false
_created = false
_pup_tbl = {}
_npc_tbl = {}
_cap_tbl = {}
_cap_count = 0
_check_bench = nil
_enemy_max = 0
_enemy_kill = 0
_tunk_num = 0
_dummy_box_tbl = {}
_hml_mot = {
  idle_dt_02 = "man01_idle_dt_02",
  idle_lo_01 = "man01_idle_lo_01",
  disperse = "man01_disperse_ep14_00",
  guard = "man31_guard_00"
}
_ignored_battle = false
_sdemo = nil
_col = nil
enmgen2_home_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_01",
      name = "ene_01",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_ene_02",
      name = "ene_02",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_ene_03",
      name = "ene_03",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_ene_04",
      name = "ene_04",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_05",
      name = "ene_05",
      ai_spawn_option = "Gellyfish/gellyfish_Hide"
    }
  },
  onSpawn = function(A0_0, A1_1)
    _enemy_max = _enemy_max + 1
  end,
  onObjectAsh = function(A0_2, A1_3)
    _enemy_kill = _enemy_kill + 1
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {
      "ene_01",
      "ene_02",
      "ene_03",
      "ene_04"
    }, 2, 5)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_omake = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "omake_01",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "omake_02",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "omake_03",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "omake_04",
      ai_spawn_option = "Stalker/Stalker_Hide"
    }
  },
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "omake_01",
      "omake_02",
      "omake_03",
      "omake_04"
    }, 2, 5)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
function Initialize()
  local L0_12, L1_13, L2_14, L3_15
  L0_12 = sensorAllOff
  L0_12()
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = Fn_pcSensorOff
  L0_12(L1_13)
  L0_12 = {
    L1_13,
    L2_14,
    L3_15,
    {
      name = "owner02w",
      type = "wom_hex_id",
      node = "locator2_owner02_01",
      anim_name = "stay_02"
    },
    {
      name = "owner02m",
      type = "man_hex_id",
      node = "locator2_owner02_02",
      anim_name = "sit_floor_02"
    },
    {
      name = "owner03",
      type = "kid02",
      node = "locator2_owner03_01",
      active = false,
      anim_name = "sit_floor_01",
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "dog01_03",
      type = "dog04",
      node = "locator2_dog01_03",
      active = false,
      anim_name = "stay"
    },
    {
      name = "dog02_03",
      type = "dog02",
      node = "locator2_dog02_03",
      active = false,
      anim_name = "sit"
    },
    {
      name = "dog03_03",
      type = "dog03",
      node = "locator2_dog03_03",
      active = false,
      anim_name = "sit"
    },
    {
      name = "npc02",
      type = "man80",
      node = "locator2_vogo",
      active = false
    },
    {
      name = "hml01",
      type = "wom43",
      node = "locator2_homeless_01",
      active = false,
      anim_name = "sit_01"
    },
    {
      name = "hml02",
      type = "man08",
      node = "locator2_homeless_02",
      active = false,
      anim_name = "stay_02"
    },
    {
      name = "hml03",
      type = "man17",
      node = "locator2_homeless_03",
      active = false
    },
    {
      name = "hml04",
      type = "man_hex_id",
      node = "locator2_homeless_04",
      active = false,
      anim_name = "stay_01"
    },
    {
      name = "hml05",
      type = "wom_hex_id",
      node = "locator2_homeless_05",
      active = false,
      anim_name = "sit_00"
    },
    {
      name = "hml06",
      type = "man_hex_id",
      node = "locator2_homeless_06",
      active = false,
      anim_name = "sit_01"
    },
    {
      name = "hml07",
      type = "man_hex_id",
      node = "locator2_homeless_07",
      active = false
    },
    {
      name = "hml08",
      type = "wom_hex_id",
      node = "locator2_homeless_08",
      active = false,
      anim_name = "sit_01"
    },
    {
      name = "hml09",
      type = "man_hex_id",
      node = "locator2_homeless_09",
      active = false
    },
    {
      name = "hml10",
      type = "man_hex_id",
      node = "locator2_homeless_10",
      active = false
    },
    {
      name = "hml11",
      type = "man_hex_id",
      node = "locator2_homeless_11",
      active = false
    }
  }
  L1_13.name = "npc01"
  L1_13.type = "man73"
  L1_13.node = "locator2_npc_01"
  L1_13.anim_name = "lookaround_02"
  L2_14.name = "owner01"
  L2_14.type = "man_hex_id"
  L2_14.node = "locator2_owner01_01"
  L2_14.active = false
  L3_15.name = "dog01"
  L3_15.type = "dog01"
  L3_15.node = "locator2_owner01_01"
  L3_15.active = false
  _npc_tbl = L1_13
  for _FORV_4_, _FORV_5_ in L1_13(L2_14) do
    _pup_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14)
  _col = L1_13
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13(L2_14)
  L1_13(L2_14)
  L1_13(L2_14)
  L1_13(L2_14, L3_15)
  while true do
    if L2_14 ~= nil then
      L3_15(_dummy_box_tbl, L2_14)
    else
      break
    end
    L3_15()
  end
  L3_15.node = "locator2_owner03obj_01"
  L3_15.name = "owner03obj_01"
  L3_15.mdl_name = "apple_kn_01_base"
  for _FORV_6_, _FORV_7_ in L3_15(L2_14) do
    Fn_createTerrainBg(_FORV_7_.node, _FORV_7_.name, _FORV_7_.mdl_name, false):setIgnoreGrab(true)
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_15) do
  end
  _sdemo = SDemo.create("ep14_b_sdemo")
end
function Ingame()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46
  L0_16 = {}
  L0_16.degree_h = 180
  L0_16.degree_v = 160
  L0_16.valid = true
  L0_16.watchTarget = true
  L0_16.targetJoint = "bn_head"
  L0_16.onlyFace = true
  L1_17 = createNode
  L2_18 = _pup_tbl
  L2_18 = L2_18.npc01
  L3_19 = "npc01_view_node"
  L4_20 = true
  L1_17 = L1_17(L2_18, L3_19, L4_20)
  L2_18 = createNode
  L3_19 = _pup_tbl
  L3_19 = L3_19.owner01
  L4_20 = "owner01_view_node"
  L5_21 = true
  L2_18 = L2_18(L3_19, L4_20, L5_21)
  L3_19 = Fn_missionStart
  L3_19()
  L3_19 = Fn_userCtrlOn
  L3_19()
  L3_19 = Fn_missionView
  L4_20 = "ep14_01001"
  L3_19(L4_20)
  L3_19 = waitSeconds
  L4_20 = 3
  L3_19(L4_20)
  L3_19 = Fn_captionView
  L4_20 = "ep14_01000"
  L3_19(L4_20)
  L3_19 = waitSeconds
  L4_20 = 3
  L3_19(L4_20)
  L3_19 = print
  L4_20 = "x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=\227\128\128undrer_tunk\227\128\128x=x=x=x=x=x=x=x=x=x=x=x=x=x=x="
  L3_19(L4_20)
  L3_19 = Fn_pcSensorOn
  L4_20 = "pccubesensor2_notice_tunk"
  L3_19(L4_20)
  L3_19 = findGameObject2
  L4_20 = "Node"
  L5_21 = "locator2_home_01_look"
  L3_19 = L3_19(L4_20, L5_21)
  L4_20 = findGameObject2
  L5_21 = "Node"
  L6_22 = "locator2_home_01_look2"
  L4_20 = L4_20(L5_21, L6_22)
  while true do
    L5_21 = _tunk_noticed
    if L5_21 == false then
      L5_21 = rayCheck
      L6_22 = L3_19
      L5_21 = L5_21(L6_22, L7_23)
      if L5_21 == false then
        L5_21 = rayCheck
        L6_22 = L4_20
        L5_21 = L5_21(L6_22, L7_23)
      end
    end
    if L5_21 then
      L5_21 = wait
      L5_21()
    end
  end
  L5_21 = waitSeconds
  L6_22 = 1
  L5_21(L6_22)
  L5_21 = Fn_captionView
  L6_22 = "ep14_01002"
  L5_21(L6_22, L7_23)
  L5_21 = Sound
  L6_22 = L5_21
  L5_21 = L5_21.playSE
  L5_21(L6_22, L7_23, L8_24)
  L5_21 = pcStayCamStopOn
  L5_21()
  L5_21 = waitSeconds
  L6_22 = 1.3
  L5_21(L6_22)
  L5_21 = findGameObject2
  L6_22 = "Node"
  L5_21 = L5_21(L6_22, L7_23)
  L6_22 = Fn_naviSet
  L6_22(L7_23)
  L6_22 = viewControl
  L10_26 = 0.5
  L6_22(L7_23, L8_24, L9_25, L10_26)
  L6_22 = pcStayCamStopOff
  L6_22()
  L6_22 = waitSeconds
  L6_22(L7_23)
  L6_22 = _tunk_noticed
  if L6_22 == false then
    L6_22 = Fn_captionView
    L6_22(L7_23)
  end
  L6_22 = {
    L7_23,
    L8_24,
    L9_25,
    L10_26
  }
  L10_26 = "pccubesensor2_home_01_4"
  for L10_26, L11_27 in L7_23(L8_24) do
    L12_28 = Fn_pcSensorOn
    L13_29 = L11_27
    L12_28(L13_29)
  end
  L7_23()
  L7_23()
  while true do
    if L7_23 then
      L7_23()
    end
  end
  L7_23()
  L7_23()
  L10_26 = L8_24.y
  if L9_25 > 50 then
    L10_26 = pcStayCamStopOff
    L10_26()
    while L9_25 > 50 do
      L10_26 = wait
      L10_26()
    end
    L10_26 = pcStayCamStopOn
    L10_26()
  end
  L10_26 = {
    L11_27,
    L12_28,
    L13_29,
    L14_30
  }
  L11_27 = {
    L12_28,
    [20] = L13_29()
  }
  L12_28 = "locator2_tunk_pos_01"
  L13_29 = Fn_getPlayerWorldPos
  L30_46 = L13_29()
  ;({
    L12_28,
    [20] = L13_29()
  })[2] = L13_29
  ;({
    L12_28,
    [20] = L13_29()
  })[3] = L14_30
  ;({
    L12_28,
    [20] = L13_29()
  })[4] = L15_31
  ;({
    L12_28,
    [20] = L13_29()
  })[5] = L16_32
  ;({
    L12_28,
    [20] = L13_29()
  })[6] = L17_33
  ;({
    L12_28,
    [20] = L13_29()
  })[7] = L18_34
  ;({
    L12_28,
    [20] = L13_29()
  })[8] = L19_35
  ;({
    L12_28,
    [20] = L13_29()
  })[9] = L20_36
  ;({
    L12_28,
    [20] = L13_29()
  })[10] = L21_37
  ;({
    L12_28,
    [20] = L13_29()
  })[11] = L22_38
  ;({
    L12_28,
    [20] = L13_29()
  })[12] = L23_39
  ;({
    L12_28,
    [20] = L13_29()
  })[13] = L24_40
  ;({
    L12_28,
    [20] = L13_29()
  })[14] = L25_41
  ;({
    L12_28,
    [20] = L13_29()
  })[15] = L26_42
  ;({
    L12_28,
    [20] = L13_29()
  })[16] = L27_43
  ;({
    L12_28,
    [20] = L13_29()
  })[17] = L28_44
  ;({
    L12_28,
    [20] = L13_29()
  })[18] = L29_45
  ;({
    L12_28,
    [20] = L13_29()
  })[19] = L30_46
  L12_28 = {
    [19] = L13_29()
  }
  L13_29 = Fn_getPlayerWorldPos
  L30_46 = L13_29()
  ;({
    [19] = L13_29()
  })[1] = L13_29
  ;({
    [19] = L13_29()
  })[2] = L14_30
  ;({
    [19] = L13_29()
  })[3] = L15_31
  ;({
    [19] = L13_29()
  })[4] = L16_32
  ;({
    [19] = L13_29()
  })[5] = L17_33
  ;({
    [19] = L13_29()
  })[6] = L18_34
  ;({
    [19] = L13_29()
  })[7] = L19_35
  ;({
    [19] = L13_29()
  })[8] = L20_36
  ;({
    [19] = L13_29()
  })[9] = L21_37
  ;({
    [19] = L13_29()
  })[10] = L22_38
  ;({
    [19] = L13_29()
  })[11] = L23_39
  ;({
    [19] = L13_29()
  })[12] = L24_40
  ;({
    [19] = L13_29()
  })[13] = L25_41
  ;({
    [19] = L13_29()
  })[14] = L26_42
  ;({
    [19] = L13_29()
  })[15] = L27_43
  ;({
    [19] = L13_29()
  })[16] = L28_44
  ;({
    [19] = L13_29()
  })[17] = L29_45
  ;({
    [19] = L13_29()
  })[18] = L30_46
  L13_29 = {
    L14_30,
    [18] = L15_31()
  }
  L14_30 = "locator2_tunk_pos_02"
  L15_31 = Fn_getPlayerWorldPos
  L30_46 = L15_31()
  ;({
    L14_30,
    [18] = L15_31()
  })[2] = L15_31
  ;({
    L14_30,
    [18] = L15_31()
  })[3] = L16_32
  ;({
    L14_30,
    [18] = L15_31()
  })[4] = L17_33
  ;({
    L14_30,
    [18] = L15_31()
  })[5] = L18_34
  ;({
    L14_30,
    [18] = L15_31()
  })[6] = L19_35
  ;({
    L14_30,
    [18] = L15_31()
  })[7] = L20_36
  ;({
    L14_30,
    [18] = L15_31()
  })[8] = L21_37
  ;({
    L14_30,
    [18] = L15_31()
  })[9] = L22_38
  ;({
    L14_30,
    [18] = L15_31()
  })[10] = L23_39
  ;({
    L14_30,
    [18] = L15_31()
  })[11] = L24_40
  ;({
    L14_30,
    [18] = L15_31()
  })[12] = L25_41
  ;({
    L14_30,
    [18] = L15_31()
  })[13] = L26_42
  ;({
    L14_30,
    [18] = L15_31()
  })[14] = L27_43
  ;({
    L14_30,
    [18] = L15_31()
  })[15] = L28_44
  ;({
    L14_30,
    [18] = L15_31()
  })[16] = L29_45
  ;({
    L14_30,
    [18] = L15_31()
  })[17] = L30_46
  L14_30 = {
    L15_31,
    L16_32,
    [17] = L17_33()
  }
  L15_31 = "locator2_tunk_pos_02"
  L16_32 = "locator2_tunk_pos_03"
  L17_33 = Fn_getPlayerWorldPos
  L30_46 = L17_33()
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[3] = L17_33
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[4] = L18_34
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[5] = L19_35
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[6] = L20_36
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[7] = L21_37
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[8] = L22_38
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[9] = L23_39
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[10] = L24_40
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[11] = L25_41
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[12] = L26_42
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[13] = L27_43
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[14] = L28_44
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[15] = L29_45
  ;({
    L15_31,
    L16_32,
    [17] = L17_33()
  })[16] = L30_46
  L11_27 = Fn_moveNpc
  L12_28 = "npc01"
  L13_29 = _tunk_num
  L13_29 = L10_26[L13_29]
  L14_30 = {}
  L14_30.runLength = -1
  L14_30.arrivedLength = 2.5
  L11_27 = L11_27(L12_28, L13_29, L14_30)
  L12_28 = Player
  L13_29 = L12_28
  L12_28 = L12_28.setLookAtIk
  L14_30 = true
  L15_31 = 0.8
  L17_33 = L5_21
  L16_32 = L5_21.getWorldTransform
  L30_46 = L16_32(L17_33)
  L12_28(L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L16_32(L17_33))
  L12_28 = waitSeconds
  L13_29 = 0.8
  L12_28(L13_29)
  L12_28 = Player
  L13_29 = L12_28
  L12_28 = L12_28.setLookAtIk
  L14_30 = false
  L15_31 = 1
  L16_32 = Vector
  L17_33 = 0
  L30_46 = L16_32(L17_33, L18_34, L19_35)
  L12_28(L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L16_32(L17_33, L18_34, L19_35))
  while true do
    L13_29 = L11_27
    L12_28 = L11_27.isRunning
    L12_28 = L12_28(L13_29)
    if L12_28 then
      L12_28 = wait
      L12_28()
    end
  end
  L12_28 = invokeTask
  function L13_29()
    Fn_turnNpc("npc01")
  end
  L12_28(L13_29)
  L12_28 = viewControl
  L13_29 = L1_17
  L14_30 = nil
  L15_31 = 1
  L12_28(L13_29, L14_30, L15_31)
  L12_28 = Player
  L13_29 = L12_28
  L12_28 = L12_28.setLookAtIk
  L14_30 = true
  L15_31 = 1
  L16_32 = _pup_tbl
  L16_32 = L16_32.npc01
  L17_33 = L16_32
  L16_32 = L16_32.getWorldTransform
  L30_46 = L16_32(L17_33)
  L12_28(L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L16_32(L17_33))
  L12_28 = waitSeconds
  L13_29 = 1
  L12_28(L13_29)
  L12_28 = Fn_kaiwaDemoView
  L13_29 = "ep14_00121k"
  L12_28(L13_29)
  L12_28 = _col
  L13_29 = L12_28
  L12_28 = L12_28.setCollidablePermission
  L14_30 = false
  L12_28(L13_29, L14_30)
  L12_28 = Player
  L13_29 = L12_28
  L12_28 = L12_28.setLookAtIk
  L14_30 = false
  L15_31 = 1
  L16_32 = Vector
  L17_33 = 0
  L30_46 = L16_32(L17_33, L18_34, L19_35)
  L12_28(L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L16_32(L17_33, L18_34, L19_35))
  L12_28 = invokeTask
  function L13_29()
    Fn_playMotionNpc("npc01", "talk_sad_02", true)
    Fn_playMotionNpc("npc01", "stay_01", false)
  end
  L12_28(L13_29)
  L12_28 = pcStayCamStopOff
  L12_28()
  L12_28 = print
  L13_29 = "x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=\227\128\128angry_npc\227\128\128x=x=x=x=x=x=x=x=x=x=x=x=x=x=x="
  L12_28(L13_29)
  L12_28 = waitSeconds
  L13_29 = 1
  L12_28(L13_29)
  L12_28 = Fn_captionView
  L13_29 = "ep14_01004"
  L12_28(L13_29)
  L12_28 = waitSeconds
  L13_29 = 3
  L12_28(L13_29)
  L12_28 = findGameObject2
  L13_29 = "Node"
  L14_30 = "locator2_building_navi1"
  L12_28 = L12_28(L13_29, L14_30)
  while true do
    L13_29 = rayCheck
    L14_30 = L12_28
    L15_31 = 80
    L13_29 = L13_29(L14_30, L15_31)
    if L13_29 == false then
      L13_29 = wait
      L13_29()
    end
  end
  L13_29 = waitSeconds
  L14_30 = 1
  L13_29(L14_30)
  L13_29 = Sound
  L14_30 = L13_29
  L13_29 = L13_29.playSE
  L15_31 = "kit_512"
  L16_32 = 0.5
  L13_29(L14_30, L15_31, L16_32)
  L13_29 = pcStayCamStopOn
  L13_29()
  L13_29 = viewControl
  L14_30 = L12_28
  L15_31 = 1
  L16_32 = 1
  L13_29(L14_30, L15_31, L16_32)
  L13_29 = pcStayCamStopOff
  L13_29()
  L13_29 = Fn_captionView
  L14_30 = "ep14_01005"
  L13_29(L14_30)
  L13_29 = waitSeconds
  L14_30 = 1.3
  L13_29(L14_30)
  L13_29 = Fn_naviSet
  L14_30 = L12_28
  L13_29(L14_30)
  repeat
    L13_29 = wait
    L13_29()
    L13_29 = Fn_getDistanceToPlayer
    L15_31 = L12_28
    L14_30 = L12_28.getWorldPos
    L30_46 = L14_30(L15_31)
    L13_29 = L13_29(L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L14_30(L15_31))
  until L13_29 < 30
  L13_29 = Fn_naviKill
  L13_29()
  L13_29 = Player
  L14_30 = L13_29
  L13_29 = L13_29.setStay
  L15_31 = true
  L13_29(L14_30, L15_31)
  L13_29 = Fn_captionView
  L14_30 = "ep14_01033"
  L13_29(L14_30)
  L13_29 = waitSeconds
  L14_30 = 0.5
  L13_29(L14_30)
  L13_29 = Player
  L14_30 = L13_29
  L13_29 = L13_29.setStay
  L15_31 = false
  L13_29(L14_30, L15_31)
  L13_29 = waitSeconds
  L14_30 = 2.8
  L13_29(L14_30)
  L13_29 = Fn_pcSensorOn
  L14_30 = "pccubesensor2_front_of_door_04"
  L13_29(L14_30)
  L13_29 = findGameObject2
  L14_30 = "Node"
  L15_31 = "locator2_view_door_04"
  L13_29 = L13_29(L14_30, L15_31)
  L14_30 = Fn_lookAtTargetInput
  L15_31 = L13_29
  L14_30(L15_31)
  L14_30 = Fn_naviSet
  L15_31 = L13_29
  L14_30(L15_31)
  L14_30 = waitPhase
  L14_30()
  L14_30 = Fn_naviKill
  L14_30()
  L14_30 = pcStayCamStopOn
  L14_30()
  L14_30 = inSensorGravityCtrlModeOff
  L14_30()
  L14_30 = {
    L15_31,
    L16_32,
    L17_33,
    L18_34,
    L19_35,
    L20_36,
    L21_37
  }
  L15_31 = "locator2_owner01_01"
  L16_32 = "locator2_owner01_02"
  L17_33 = "locator2_owner01_03"
  L21_37 = "locator2_owner01_07"
  L15_31 = false
  L16_32 = false
  function L17_33()
    local L0_47, L1_48
    L0_47 = _npc_tbl
    L0_47 = L0_47.owner01
    L1_48 = L0_47
    L0_47 = L0_47.setSightParam
    L0_47(L1_48, L0_16)
    L0_47 = getNotVisiblePos
    L1_48 = L14_30
    L0_47 = L0_47(L1_48, 3.5, 1.5)
    L1_48 = Fn_warpNpc
    L1_48("owner01", L0_47)
    L1_48 = wait
    L1_48()
    L1_48 = Fn_setNpcActive
    L1_48("owner01", true)
    L1_48 = {
      {
        pos = Fn_getPlayer(),
        opt = {runLength = -1}
      },
      {
        pos = "locator2_owner01_05"
      }
    }
    waitSeconds(1)
    Sound:playSE("m33_914b", 1, "", _pup_tbl.owner01)
    while Fn_moveNpc("owner01", L1_48, {
      runLength = -1,
      arrivedLength = 3,
      avoidance = true
    }):isRunning() do
      wait()
    end
    L15_31 = true
    Fn_turnNpc("owner01")
    Fn_playMotionNpc("owner01", "talk_angry_00", false)
    waitSeconds(0.4)
    Sound:playSE("m33_914a", 1, "", _pup_tbl.owner01)
    waitSeconds(1.8)
    L16_32 = true
    while _npc_tbl.owner01:isMotionEnd() == false do
      wait()
    end
    Fn_playMotionNpc("owner01", "stay_01", false)
  end
  L18_34(L19_35)
  while L15_31 == false do
    L18_34()
  end
  L21_37 = 1
  L22_38 = _pup_tbl
  L22_38 = L22_38.owner01
  L23_39 = L22_38
  L22_38 = L22_38.getWorldTransform
  L30_46 = L22_38(L23_39)
  L18_34(L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L22_38(L23_39))
  L21_37 = 0
  L22_38 = 2
  L18_34(L19_35, L20_36, L21_37, L22_38)
  while L16_32 == false do
    L18_34()
  end
  L21_37 = 1
  L22_38 = Vector
  L23_39 = 0
  L30_46 = L22_38(L23_39, L24_40, L25_41)
  L18_34(L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L22_38(L23_39, L24_40, L25_41))
  L18_34(L19_35)
  L18_34()
  L18_34(L19_35)
  L21_37 = {
    L22_38,
    L23_39,
    L24_40
  }
  L22_38 = "talk_00"
  L23_39 = "talk_angry_00"
  L22_38 = 5
  L23_39 = 10
  L18_34(L19_35, L20_36, L21_37, L22_38, L23_39)
  L13_29 = L18_34
  L18_34(L19_35)
  L18_34(L19_35)
  while true do
    if L18_34 == false then
    end
    if L18_34 > 4 then
      L18_34()
    end
  end
  L18_34()
  L18_34()
  L21_37 = 0.8
  L22_38 = 2
  L18_34(L19_35, L20_36, L21_37, L22_38)
  L18_34(L19_35)
  L18_34()
  L18_34(L19_35)
  L18_34(L19_35, L20_36)
  L18_34(L19_35, L20_36)
  L18_34(L19_35, L20_36)
  L18_34(L19_35, L20_36)
  L18_34(L19_35, L20_36)
  for L21_37 = 1, 3 do
    L22_38 = _npc_tbl
    L23_39 = "dog0"
    L23_39 = L23_39 .. L24_40 .. L25_41
    L22_38 = L22_38[L23_39]
    L23_39 = L22_38
    L22_38 = L22_38.setSightParam
    L22_38(L23_39, L24_40)
  end
  L13_29 = L18_34
  L18_34(L19_35)
  L21_37 = 1.3
  L22_38 = 0
  L21_37 = L18_34
  L22_38 = L19_35
  L20_36(L21_37, L22_38)
  L21_37 = L13_29
  L22_38 = L18_34
  L20_36(L21_37, L22_38)
  L21_37 = L18_34
  L20_36(L21_37)
  L21_37 = L18_34
  L20_36(L21_37)
  L21_37 = L18_34
  L20_36(L21_37)
  while true do
    L21_37 = L18_34
    L22_38 = 20
    if L20_36 ~= false then
      L21_37 = L18_34
    end
    if L20_36 > 20 then
      L20_36()
    end
  end
  L20_36()
  L20_36()
  L21_37 = L20_36
  L20_36(L21_37)
  L21_37 = L20_36
  L20_36(L21_37)
  L20_36.npc01 = nil
  L20_36.owner01 = nil
  L21_37 = "owner03"
  L20_36(L21_37)
  L21_37 = L20_36
  L22_38 = L0_16
  L20_36(L21_37, L22_38)
  L21_37 = L20_36
  L22_38 = {}
  L22_38.forceTarget = true
  L20_36(L21_37, L22_38)
  function L21_37()
    Fn_turnNpc("dog03_03")
  end
  L20_36(L21_37)
  L21_37 = "dog02_03"
  L22_38 = "sit_out"
  L23_39 = true
  L20_36(L21_37, L22_38, L23_39)
  function L21_37(A0_49)
    while L20_36 do
      if RandI(2) == 1 then
        Fn_turnNpc(A0_49, nil)
      end
      Fn_playMotionNpc(A0_49, "bark")
      wait()
    end
  end
  L22_38 = invokeTask
  L23_39 = L21_37
  L22_38(L23_39, L24_40)
  L22_38 = invokeTask
  L23_39 = L21_37
  L22_38(L23_39, L24_40)
  L22_38 = invokeTask
  L23_39 = L21_37
  L22_38(L23_39, L24_40)
  function L22_38(A0_50, A1_51)
    while L20_36 do
      Sound:playSE(A0_50, 1, "", _pup_tbl[A1_51])
      wait(RandI(12, 30))
    end
  end
  L23_39 = {
    L24_40,
    L25_41,
    L26_42
  }
  L24_40.se_name = "dog_angry"
  L24_40.npc_name = "dog01_03"
  L25_41.se_name = "dog_angry_l"
  L25_41.npc_name = "dog02_03"
  L26_42.se_name = "dog_angry_s"
  L26_42.npc_name = "dog03_03"
  for L27_43, L28_44 in L24_40(L25_41) do
    L29_45 = invokeTask
    L30_46 = L22_38
    L29_45(L30_46, L28_44.se_name, L28_44.npc_name)
  end
  L24_40(L25_41, L26_42)
  L24_40(L25_41)
  L24_40()
  L24_40(L25_41)
  L13_29 = L24_40
  L24_40(L25_41)
  L12_28 = L24_40
  while true do
    if L24_40 == false then
      L24_40()
    end
  end
  L24_40()
  L24_40()
  L24_40(L25_41)
  L24_40(L25_41, L26_42)
  L24_40(L25_41, L26_42)
  L24_40(L25_41, L26_42, L27_43)
  L24_40(L25_41)
  L24_40(L25_41, L26_42, L27_43)
  L24_40(L25_41)
  L24_40(L25_41)
  L24_40(L25_41, L26_42)
  L24_40()
  L24_40()
  L24_40()
  L24_40()
  L24_40()
  L12_28 = L24_40
  L24_40(L25_41, L26_42, L27_43)
  L29_45 = L12_28
  L30_46 = L28_44(L29_45)
  L24_40(L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L28_44(L29_45))
  L24_40(L25_41)
  L24_40(L25_41, L26_42)
  L24_40(L25_41, L26_42)
  L27_43.goalDirection = true
  L24_40(L25_41, L26_42, L27_43)
  L29_45 = 0
  L30_46 = 0
  L30_46 = L28_44(L29_45, L30_46, 0)
  L24_40(L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L28_44(L29_45, L30_46, 0))
  L24_40(L25_41)
  L24_40(L25_41, L26_42)
  L29_45 = L28_44
  L30_46 = L28_44(L29_45)
  L24_40(L25_41, L26_42, L27_43, L28_44, L29_45, L30_46, L28_44(L29_45))
  L24_40(L25_41)
  L12_28 = L24_40
  L24_40(L25_41, L26_42, L27_43, L28_44)
  L24_40(L25_41)
  L24_40()
  L24_40.degree_h = 180
  L24_40.degree_v = 130
  L24_40.in_length = 5
  L24_40.out_length = 20
  L24_40.valid = true
  L24_40.watchTarget = true
  L25_41(L26_42, L27_43)
  L26_42(L27_43)
  L29_45 = 1
  L30_46 = Vector
  L30_46 = L30_46(0, 0, 0)
  L26_42(L27_43, L28_44, L29_45, L30_46, L30_46(0, 0, 0))
  L26_42(L27_43)
  L26_42(L27_43, L28_44)
  L26_42(L27_43)
  L26_42(L27_43)
  L26_42(L27_43)
  L29_45 = false
  L26_42(L27_43, L28_44, L29_45)
  L26_42(L27_43)
  L12_28 = L26_42
  L26_42(L27_43)
  L26_42(L27_43)
  L26_42(L27_43)
  for L29_45, L30_46 in L26_42(L27_43) do
    if string.match(L29_45, "hml") ~= nil then
      Fn_setNpcActive(L30_46, true)
    end
  end
  L29_45 = -1
  L30_46 = 0
  L26_42(L27_43, L28_44, L29_45, L30_46, false)
  L29_45 = -1
  L30_46 = 0
  L26_42(L27_43, L28_44, L29_45, L30_46, false)
  L29_45 = -1
  L30_46 = 0
  L26_42(L27_43, L28_44, L29_45, L30_46, false)
  L29_45 = -1
  L30_46 = 0
  L26_42(L27_43, L28_44, L29_45, L30_46, false)
  L29_45 = false
  L30_46 = {}
  L30_46.isRepeat = true
  L26_42(L27_43, L28_44, L29_45, L30_46)
  L26_42()
  L26_42()
  L26_42(L27_43)
  L26_42()
  L26_42()
  L26_42(L27_43, L28_44)
  L26_42(L27_43)
  L26_42()
  L26_42.degree_h = 90
  L26_42.degree_v = 130
  L26_42.in_length = 20
  L26_42.out_length = 30
  L26_42.valid = true
  L26_42.watchTarget = true
  L29_45 = L26_42
  L27_43(L28_44, L29_45)
  L29_45 = L26_42
  L27_43(L28_44, L29_45)
  L29_45 = L26_42
  L27_43(L28_44, L29_45)
  L27_43(L28_44)
  L27_43(L28_44)
  L27_43(L28_44)
  L27_43(L28_44)
  L27_43(L28_44)
  L27_43(L28_44)
  L29_45 = "locator2_navi_battle_area"
  L12_28 = L27_43
  L27_43(L28_44)
  L27_43(L28_44)
  L27_43(L28_44)
  L27_43(L28_44)
  L29_45 = "enmgen2_home_02"
  L29_45 = L27_43
  L28_44(L29_45)
  L29_45 = "EnemyGenerator"
  L30_46 = "enmgen2_omake"
  L30_46 = L28_44
  L29_45 = L28_44.requestPrepare
  L29_45(L30_46)
  L29_45 = waitSeconds
  L30_46 = 3
  L29_45(L30_46)
  repeat
    L29_45 = wait
    L29_45()
    L29_45 = Fn_getDistanceToPlayer
    L30_46 = L12_28
    L29_45 = L29_45(L30_46)
  until L29_45 < 25
  L29_45 = Player
  L30_46 = L29_45
  L29_45 = L29_45.setStay
  L29_45(L30_46, true)
  L29_45 = Fn_naviKill
  L29_45()
  L29_45 = Fn_captionViewWait
  L30_46 = "ep14_01032"
  L29_45(L30_46)
  L29_45 = Player
  L30_46 = L29_45
  L29_45 = L29_45.setStay
  L29_45(L30_46, false)
  L29_45 = findGameObject2
  L30_46 = "Node"
  L29_45 = L29_45(L30_46, "locator2_navi_home_02")
  L30_46 = 0
  while true do
    if is_check_eye_node(L29_45, 150) then
      pcStayCamStopOn()
      break
    elseif L30_46 > 480 and false == false then
      Fn_naviSet(L29_45)
    end
    L30_46 = L30_46 + 1
    wait()
  end
  if true == false then
    Fn_naviSet(L29_45)
  end
  viewControl(L29_45, nil, 1, 2.5)
  pcStayCamStopOff()
  if Fn_getDistanceToPlayer(L29_45) > 40 then
    Fn_captionView("ep14_01013")
  end
  Fn_pcSensorOn("pccubesensor2_home_02")
  while not _next_phase do
    wait()
  end
  _next_phase = false
  Fn_naviKill()
  pcStayCamStopOn()
  wait()
  inSensorGravityCtrlModeOff()
  L29_45 = findGameObject2("Node", "locator2_home_02_look")
  Player:setLookAtIk(true, 1, L29_45:getWorldTransform())
  viewControl(L29_45, 1, nil, 1)
  Fn_captionView("ep14_01014", 2)
  Player:setLookAtIk(false, 0.5, Vector(0, 0, 0))
  waitSeconds(2)
  L27_43:requestSpawn()
  for _FORV_35_, _FORV_36_ in ipairs(_dummy_box_tbl) do
    _dummy_box_tbl[_FORV_35_]:setActive(false)
  end
  pcStayCamStopOff()
  Fn_captionView("ep14_01015", 2)
  Sound:playSE("kit_512", 0.5)
  waitSeconds(2.5)
  Fn_setBgmPoint("battle")
  Fn_setCatWarpCheckPoint("locator2_navi_home_02")
  L28_44:requestSpawn()
  waitSeconds(3.3)
  Mob:makeSituationPanic(true)
  Fn_pcSensorOn("pccubesensor2_ignored_battle")
  L29_45 = findGameObject2("Node", "locator2_navi_home_03")
  while _ignored_battle == false and L27_43:getEnemyCount() ~= 0 do
    wait()
  end
  Fn_pcSensorOn("pccubesensor2_home_03")
  print("x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=\227\128\128goal\227\128\128x=x=x=x=x=x=x=x=x=x=x=x=x=x=x=")
  L27_43:setEnemyMarker(false)
  L28_44:setEnemyMarker(false)
  Fn_setBgmPoint("event", "battle_end")
  Fn_captionView("ep14_01017", 3)
  waitSeconds(3.3)
  Fn_naviSet(L29_45)
  Fn_captionView("ep14_01019")
  waitSensorInIdle()
  Fn_naviKill()
  Player:setStay(true)
  Fn_coercionPoseNomal()
  L27_43:requestAllEnemyKill()
  L28_44:requestAllEnemyKill()
  while Fn_isCaptionView() do
    wait()
  end
  Fn_pcSensorOff("pccubesensor2_home_03")
  Fn_setCatWarpCheckPoint("locator2_navi_home_03")
  Fn_sendEventComSb("ship_flg")
  Fn_sendEventComSb("ep14_b_c_brahman_ON")
  Fn_pcSensorOn("pccubesensor2_brahman")
  _sdemo:set("locator2_sdemo_goal_cam", "locator2_navi_brahman", false)
  _sdemo:play()
  L5_21 = findGameObject2("Node", "locator2_navi_home_03_2")
  Player:setLookAtIk(true, 1, L5_21:getWorldPos())
  waitSeconds(1)
  Fn_userCtrlAllOff()
  Fn_userCtrlOn()
  Fn_captionViewWait("ep14_01024", 2)
  Fn_captionViewWait("ep14_01025", 2)
  waitSeconds(1)
  Fn_captionView("ep14_01026", 2)
  Sound:playSE("kit_512", 0.5)
  _sdemo:zoomIn(1.3, {deg = 10})
  waitSeconds(1.3)
  Fn_captionViewWait("ep14_01027", 2.5)
  waitSeconds(0.3)
  L5_21 = findGameObject2("Node", "locator2_navi_brahman")
  Fn_naviSet(L5_21)
  _sdemo:stop(0)
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Player:setStay(false)
  Fn_resetCoercionPose()
  waitPhase()
  Fn_naviKill()
  Player:setStay(true)
  Fn_sendEventComSb("changeNearBraFlg")
  if inSensorGravityCtrlModeOff() then
    Player:setLookAtIk(true, 0.7, L5_21:getWorldPos())
    waitSeconds(0.7)
  end
  while Fn_sendEventComSb("getNearBraFlg") do
    wait()
  end
  Fn_kaiwaDemoView("ep14_00130k")
  if inSensorGravityCtrlModeOff() then
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end
  Player:setStay(false)
  if _next_phase then
    _next_phase = false
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  ignoreGrabBench(false)
  Mob:makeSituationPanic(false)
end
function waitSensorInIdle()
  while _sensor_flg ~= true or Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
  _sensor_flg = false
end
function ignoreGrabBench()
  local L0_52, L1_53, L2_54
  L0_52 = Fn_findAreaHandle
  L1_53 = "g1_base_id_e2_road"
  L0_52 = L0_52(L1_53)
  if L0_52 then
    L2_54 = L0_52
    L1_53 = L0_52.getSandbox2
    L1_53 = L1_53(L2_54)
    L2_54 = {
      "bench_kk_03_2",
      "bench_kk_03_4",
      "bench_kk_03_6",
      "bench_kk_03_9",
      "bench_kk_02_1",
      "bench_kk_02_2"
    }
    return invokeTask(function()
      local L0_55, L1_56, L2_57, L3_58, L4_59
      while true do
        for L3_58, L4_59 in L0_55(L1_56) do
          if L1_53:findGameObject2("GimmickBg", L4_59) then
            L1_53:findGameObject2("GimmickBg", L4_59):try_term()
          end
        end
        L0_55()
      end
    end)
  else
  end
end
function pccubesensor2_home_sensor_OnEnter()
  local L0_60, L1_61
  _sensor_flg = true
end
function pccubesensor2_home_sensor_OnLeave()
  local L0_62, L1_63
  _sensor_flg = false
end
function pccubesensor2_notice_tunk_OnEnter(A0_64)
  _tunk_noticed = true
  Fn_pcSensorOff(A0_64)
end
function sensorAllOff()
  local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70
  L0_65 = {
    L1_66,
    L2_67,
    L3_68,
    L4_69
  }
  L4_69 = "pccubesensor2_home_01_4"
  for L4_69, L5_70 in L1_66(L2_67) do
    Fn_pcSensorOff(L5_70)
  end
end
function tunk1OnEnter()
  _tunk_num = 1
  _next_phase = true
  sensorAllOff()
end
function tunk2OnEnter()
  _tunk_num = 2
  _next_phase = true
  sensorAllOff()
end
function tunk3OnEnter()
  _tunk_num = 3
  _next_phase = true
  sensorAllOff()
end
function tunk4OnEnter()
  _tunk_num = 4
  _next_phase = true
  sensorAllOff()
end
function pccubesensor2_bench_OnEnter(A0_71)
  if _check_bench == nil then
    _check_bench = ignoreGrabBench()
  end
end
function pccubesensor2_bench_OnLeave()
  if _check_bench then
    _check_bench:abort()
    _check_bench = nil
  end
end
function pccubesensor2_ignored_battle_OnLeave(A0_72)
  _ignored_battle = true
  Fn_pcSensorOff(A0_72)
end
