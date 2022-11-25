dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/pdemo.lua")
_puppet_tbl = {}
_hdl_tbl = {}
_eve_flg = false
_next_cp = "locator2_cp_01"
_can_warp_flg = true
_cat_warp_task = nil
_EVENT_MOTION_TBL = {
  ready = "kit01_stay_fighting_in_00",
  wait = "kit01_stay_fighting_00",
  joy = "kit01_hail_00",
  droop = "kit01_stay_heat_00"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22
  }
  L1_1.name = "sm13_bird_sdemo"
  L1_1.type = "gull01"
  L1_1.node = "locator2_bird_sdemo"
  L1_1.use_gravity = false
  L1_1.not_mob = true
  L2_2.name = "sm13_bird_race"
  L2_2.type = "gull01"
  L2_2.node = "locator2_bird_race"
  L2_2.use_gravity = false
  L2_2.attach = false
  L3_3.name = "sm13_dusty"
  L3_3.type = "dus01"
  L3_3.node = "locator2_dusty"
  L3_3.active = false
  L4_4 = {}
  L4_4.name = "sm13_group_bird_leader"
  L4_4.type = "gull01"
  L4_4.node = "locator2_group_bird_leader"
  L4_4.use_gravity = false
  L4_4.active = false
  L4_4.attach = false
  L5_5 = {}
  L5_5.name = "sm13_group_bird_01"
  L5_5.type = "gull01"
  L5_5.node = "locator2_group_bird_01"
  L5_5.use_gravity = false
  L5_5.active = false
  L5_5.attach = false
  L6_6 = {}
  L6_6.name = "sm13_group_bird_02"
  L6_6.type = "gull01"
  L6_6.node = "locator2_group_bird_02"
  L6_6.use_gravity = false
  L6_6.active = false
  L6_6.attach = false
  L7_7 = {}
  L7_7.name = "sm13_group_bird_03"
  L7_7.type = "gull01"
  L7_7.node = "locator2_group_bird_03"
  L7_7.use_gravity = false
  L7_7.active = false
  L7_7.attach = false
  L8_8 = {}
  L8_8.name = "sm13_group_bird_04"
  L8_8.type = "gull01"
  L8_8.node = "locator2_group_bird_04"
  L8_8.use_gravity = false
  L8_8.active = false
  L8_8.attach = false
  L9_9 = {}
  L9_9.name = "sm13_lo_a_05_gallery_man_01"
  L9_9.type = "man32"
  L9_9.node = "locator2_lo_a_05_gallery_man_01"
  L9_9.attach = false
  L10_10 = {}
  L10_10.name = "sm13_lo_a_05_gallery_man_03"
  L10_10.type = "man36"
  L10_10.node = "locator2_lo_a_05_gallery_man_03"
  L10_10.attach = false
  L11_11 = {}
  L11_11.name = "sm13_lo_a_01_gallery_man_02"
  L11_11.type = "man36"
  L11_11.node = "locator2_lo_a_01_gallery_man_02"
  L11_11.attach = false
  L12_12.name = "sm13_lo_a_01_gallery_man_03"
  L12_12.type = "man41"
  L12_12.node = "locator2_lo_a_01_gallery_man_03"
  L12_12.attach = false
  L13_13.name = "sm13_lo_a_01_gallery_wom_01"
  L13_13.type = "wom17"
  L13_13.node = "locator2_lo_a_01_gallery_wom_01"
  L13_13.attach = false
  L14_14.name = "sm13_lo_a_01_gallery_wom_02"
  L14_14.type = "wom21"
  L14_14.node = "locator2_lo_a_01_gallery_wom_02"
  L14_14.attach = false
  L15_15.name = "sm13_lo_a_01_gallery_wom_03"
  L15_15.type = "wom23"
  L15_15.node = "locator2_lo_a_01_gallery_wom_03"
  L15_15.attach = false
  L16_16 = {}
  L16_16.name = "sm13_lo_a_02_gallery_man_01"
  L16_16.type = "man32"
  L16_16.node = "locator2_lo_a_02_gallery_man_01"
  L16_16.attach = false
  L17_17 = {}
  L17_17.name = "sm13_lo_a_02_gallery_man_03"
  L17_17.type = "man36"
  L17_17.node = "locator2_lo_a_02_gallery_man_03"
  L17_17.attach = false
  L18_18.name = "sm13_lo_a_02_gallery_man_04"
  L18_18.type = "man41"
  L18_18.node = "locator2_lo_a_02_gallery_man_04"
  L18_18.attach = false
  L19_19.name = "sm13_lo_a_02_gallery_wom_01"
  L19_19.type = "wom17"
  L19_19.node = "locator2_lo_a_02_gallery_wom_01"
  L19_19.attach = false
  L20_20.name = "sm13_lo_a_02_gallery_wom_02"
  L20_20.type = "wom21"
  L20_20.node = "locator2_lo_a_02_gallery_wom_02"
  L20_20.attach = false
  L21_21 = {}
  L21_21.name = "sm13_lo_a_02_gallery_wom_03"
  L21_21.type = "wom23"
  L21_21.node = "locator2_lo_a_02_gallery_wom_03"
  L21_21.attach = false
  L22_22 = {}
  L22_22.name = "sm13_lo_a_02_gallery_wom_04"
  L22_22.type = "wom25"
  L22_22.node = "locator2_lo_a_02_gallery_wom_04"
  L22_22.attach = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L7_7 = L5_5.name
    L8_8 = Fn_findNpcPuppet
    L9_9 = L5_5.name
    L8_8 = L8_8(L9_9)
    L6_6[L7_7] = L8_8
    L6_6 = _hdl_tbl
    L7_7 = L5_5.name
    L8_8 = Fn_findNpc
    L9_9 = L5_5.name
    L8_8 = L8_8(L9_9)
    L6_6[L7_7] = L8_8
  end
  L1_1.sm13_client = L2_2
  L1_1.sm13_client = L2_2
  _sdemo_cut01 = L1_1
  _sdemo_cut02 = L1_1
  L4_4 = "lo_a_01"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  _pdemo_cut01 = L1_1
  L4_4 = "lo_a_01"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  _pdemo_cut02 = L1_1
  L4_4 = 3
  L5_5 = 3
  L1_1.size = L2_2
  L1_1.marker = "air"
  _arrow_cnt = 1
  _arrow_hdls = L2_2
  function L4_4()
    L3_3()
    arrow_hdl = Fn_createRaceArrow("locator2_arrow_" .. string.format("%02d", _arrow_cnt))
    table.insert(_arrow_hdls, arrow_hdl)
    _arrow_cnt = _arrow_cnt + 1
  end
  function L5_5()
    local L0_29
    L0_29 = L2_2
    while L0_29 > 0 and findGameObject2("Gem", "gem2_energy_" .. string.format("%02d", L0_29)) ~= nil do
      findGameObject2("Gem", "gem2_energy_" .. string.format("%02d", L0_29)):setActive(false)
      L0_29 = L0_29 - 1
    end
    _next_cp = "locator2_cp_" .. string.format("%02d", L2_2)
    L2_2 = L2_2 + 1
    for _FORV_4_, _FORV_5_ in ipairs(_arrow_hdls) do
      if _FORV_5_ then
        _FORV_5_:try_term()
      end
    end
    _arrow_hdls = {}
  end
  function L6_6()
    L4_4()
    _eve_flg = true
    L3_3()
  end
  function L7_7()
    Fn_setBgmPoint("event", "race_climax")
    L3_3()
  end
  function L8_8()
    local L0_30
    L0_30 = 10
    while findGameObject2("Gem", "gem2_energy_" .. string.format("%02d", L0_30)) ~= nil do
      findGameObject2("Gem", "gem2_energy_" .. string.format("%02d", L0_30)):setActive(true)
      L0_30 = L0_30 + 1
    end
    L3_3()
  end
  L9_9 = 10
  while true do
    L10_10 = findGameObject2
    L11_11 = "Gem"
    L10_10 = L10_10(L11_11, L12_12)
    if L10_10 ~= nil then
      L11_11 = L10_10.setActive
      L11_11(L12_12, L13_13)
      L9_9 = L9_9 + 1
    end
  end
  L10_10 = {
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    L25_25,
    L26_26,
    L27_27,
    L28_28,
    {
      name = "locator2_cp_19",
      opt = {func = L5_5}
    },
    {
      name = "locator2_cp_20",
      opt = {func = L6_6}
    },
    {
      name = "locator2_cp_21",
      opt = {func = L4_4}
    },
    {
      name = "locator2_cp_22",
      opt = {func = L3_3}
    },
    {
      name = "locator2_cp_23",
      opt = {func = L3_3}
    },
    {
      name = "locator2_cp_24",
      opt = {func = L5_5}
    },
    {
      name = "locator2_cp_25",
      opt = {marker = "goal"}
    }
  }
  L11_11 = {}
  L11_11.name = "locator2_cp_01"
  L12_12.func = L3_3
  L11_11.opt = L12_12
  L12_12.name = "locator2_cp_02"
  L13_13.func = L3_3
  L12_12.opt = L13_13
  L13_13.name = "locator2_cp_03"
  L14_14.func = L4_4
  L13_13.opt = L14_14
  L14_14.name = "locator2_cp_04"
  L15_15.func = L3_3
  L14_14.opt = L15_15
  L15_15.name = "locator2_cp_05"
  L16_16 = {}
  L16_16.func = L3_3
  L15_15.opt = L16_16
  L16_16 = {}
  L16_16.name = "locator2_cp_06"
  L17_17 = {}
  L17_17.func = L4_4
  L16_16.opt = L17_17
  L17_17 = {}
  L17_17.name = "locator2_cp_07"
  L18_18.func = L8_8
  L17_17.opt = L18_18
  L18_18.name = "locator2_cp_08"
  L19_19.func = L5_5
  L18_18.opt = L19_19
  L19_19.name = "locator2_cp_09"
  L20_20.func = L4_4
  L19_19.opt = L20_20
  L20_20.name = "locator2_cp_10"
  L21_21 = {}
  L21_21.func = L3_3
  L20_20.opt = L21_21
  L21_21 = {}
  L21_21.name = "locator2_cp_11"
  L22_22 = {}
  L22_22.func = L4_4
  L21_21.opt = L22_22
  L22_22 = {}
  L22_22.name = "locator2_cp_12"
  L23_23.func = L5_5
  L22_22.opt = L23_23
  L23_23.name = "locator2_cp_13"
  L24_24.func = L3_3
  L23_23.opt = L24_24
  L24_24.name = "locator2_cp_14"
  L25_25.func = L4_4
  L24_24.opt = L25_25
  L25_25.name = "locator2_cp_15"
  L26_26 = {}
  L26_26.func = L4_4
  L25_25.opt = L26_26
  L26_26 = {}
  L26_26.name = "locator2_cp_16"
  L27_27 = {}
  L27_27.func = L4_4
  L26_26.opt = L27_27
  L27_27 = {}
  L27_27.name = "locator2_cp_17"
  L28_28 = {}
  L28_28.func = L7_7
  L27_27.opt = L28_28
  L28_28 = {}
  L28_28.name = "locator2_cp_18"
  L28_28.opt = {func = L3_3}
  L11_11 = Fn_setCheckPointTable
  L16_16 = 3
  L17_17 = 3
  L13_13.size = L14_14
  L13_13.marker = "air"
  L11_11(L12_12, L13_13)
  L11_11 = {}
  L11_11.vctrl2_cp_00 = L12_12
  L11_11.vctrl2_cp_01 = L12_12
  L11_11.vctrl2_cp_02 = L12_12
  L11_11.vctrl2_cp_03 = L12_12
  L11_11.vctrl2_cp_04 = L12_12
  L11_11.vctrl2_cp_05 = L12_12
  L11_11.vctrl2_cp_06 = L12_12
  L11_11.vctrl2_cp_07 = L12_12
  L11_11.vctrl2_cp_08 = L12_12
  L11_11.vctrl2_cp_09 = L12_12
  L11_11.vctrl2_cp_10 = L12_12
  L11_11.vctrl2_cp_11 = L12_12
  L11_11.vctrl2_cp_12 = L12_12
  L11_11.vctrl2_cp_13 = L12_12
  L11_11.vctrl2_cp_14 = L12_12
  L11_11.vctrl2_cp_15 = L12_12
  L11_11.vctrl2_cp_16 = L12_12
  L11_11.vctrl2_cp_17 = L12_12
  L11_11.vctrl2_cp_18 = L12_12
  L11_11.vctrl2_cp_19 = L12_12
  L11_11.vctrl2_cp_20 = L12_12
  L11_11.vctrl2_cp_21 = L12_12
  L11_11.vctrl2_cp_22 = L12_12
  L11_11.vctrl2_cp_23 = L12_12
  L11_11.vctrl2_cp_24 = L12_12
  for L15_15, L16_16 in L12_12(L13_13) do
    L17_17 = findGameObject2
    L17_17 = L17_17(L18_18, L19_19)
    if L17_17 ~= nil then
      L18_18(L19_19, L20_20)
      if L15_15 ~= "vctrl2_cp_01" then
        L18_18(L19_19, L20_20)
      end
    end
  end
  L16_16 = "locator2_group_bird_02"
  L16_16 = {L17_17}
  L17_17 = "locator2_group_bird_03"
  L17_17 = {L18_18}
  L12_12.formation_v = L13_13
  for L16_16, L17_17 in L13_13(L14_14) do
    for L21_21, L22_22 in L18_18(L19_19) do
      for L26_26, L27_27 in L23_23(L24_24) do
        L28_28 = findGameObject2
        L28_28 = L28_28("Node", L27_27)
        _puppet_tbl.sm13_group_bird_leader:appendChild(L28_28, true)
      end
    end
  end
  L16_16 = "Node"
  L17_17 = "locator2_second_son_bird_front_pos"
  L16_16 = true
  L13_13(L14_14, L15_15, L16_16)
  L14_14.max = L15_15
  L13_13.counter = L14_14
  L14_14(L15_15)
  L14_14()
  L14_14()
  L14_14(L15_15)
end
function Ingame()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45, L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, L22_53, L23_54, L24_55, L25_56
  L0_31 = {}
  L1_32 = nil
  L2_33 = false
  L3_34(L4_35)
  for L6_37 = 2, 11 do
    L10_41 = "%02d"
    L11_42 = L6_37
    L7_38(L8_39)
  end
  L3_34.moveSpeed = 12
  L3_34.escape = false
  L4_35.moveSpeed = 10
  L4_35.escape = false
  L6_37 = {}
  L6_37.name = "sm13_lo_a_05_gallery_man_01"
  L7_38.name = "sm13_lo_a_05_gallery_man_02"
  L8_39.name = "sm13_lo_a_05_gallery_man_03"
  L9_40.name = "sm13_lo_a_01_gallery_man_01"
  L10_41 = {}
  L10_41.name = "sm13_lo_a_01_gallery_man_02"
  L11_42 = {}
  L11_42.name = "sm13_lo_a_01_gallery_man_03"
  L12_43 = {}
  L12_43.name = "sm13_lo_a_01_gallery_wom_01"
  L13_44 = {}
  L13_44.name = "sm13_lo_a_01_gallery_wom_02"
  L14_45 = {}
  L14_45.name = "sm13_lo_a_01_gallery_wom_03"
  L15_46 = {}
  L15_46.name = "sm13_lo_a_02_gallery_man_01"
  L16_47 = {}
  L16_47.name = "sm13_lo_a_02_gallery_man_02"
  L17_48 = {}
  L17_48.name = "sm13_lo_a_02_gallery_man_03"
  L18_49 = {}
  L18_49.name = "sm13_lo_a_02_gallery_man_04"
  L19_50 = {}
  L19_50.name = "sm13_lo_a_02_gallery_wom_01"
  L20_51 = {}
  L20_51.name = "sm13_lo_a_02_gallery_wom_02"
  L21_52 = {}
  L21_52.name = "sm13_lo_a_02_gallery_wom_03"
  L22_53.name = "sm13_lo_a_02_gallery_wom_04"
  L6_37 = {}
  for L10_41, L11_42 in L7_38(L8_39) do
    L12_43 = Fn_playLoopMotionRand
    L13_44 = L11_42.name
    L14_45 = {L15_46, L16_47}
    L15_46 = "greeting"
    L16_47 = "handclap"
    L15_46 = 0
    L16_47 = 3
    L12_43 = L12_43(L13_44, L14_45, L15_46, L16_47)
    L6_37[L10_41] = L12_43
  end
  L7_38(L8_39)
  if not L8_39 then
    L8_39(L9_40)
    L8_39()
  end
  function L10_41()
    Fn_runCheckPoint()
    L8_39 = true
  end
  L9_40(L10_41)
  L10_41 = "event"
  L11_42 = "race_pri"
  L9_40(L10_41, L11_42)
  L10_41 = _sdemo_cut02
  L11_42 = "sm13_bird_race"
  L12_43 = "stay_01"
  L13_44 = _EVENT_MOTION_TBL
  L13_44 = L13_44.ready
  L14_45 = _EVENT_MOTION_TBL
  L14_45 = L14_45.wait
  L9_40(L10_41, L11_42, L12_43, L13_44, L14_45)
  L9_40()
  L9_40()
  _cat_warp_task = L9_40
  L9_40()
  L10_41 = L9_40
  L11_42 = {}
  L11_42.name = "bird_navi"
  L11_42.PochFadeLen0 = 20
  L11_42.PochFadeLen100 = 30
  L11_42 = L9_40
  L10_41 = L9_40.setTarget
  L12_43 = _puppet_tbl
  L12_43 = L12_43.sm13_bird_race
  L10_41(L11_42, L12_43)
  L11_42 = L9_40
  L10_41 = L9_40.setActive
  L12_43 = true
  L10_41(L11_42, L12_43)
  L10_41 = Fn_setBgmPoint
  L11_42 = "event"
  L12_43 = "race_start"
  L10_41(L11_42, L12_43)
  L10_41 = false
  L11_42 = false
  L12_43 = {}
  L13_44 = {
    L14_45,
    L15_46,
    L16_47,
    L17_48,
    L18_49,
    L19_50,
    L20_51,
    L21_52,
    L22_53,
    L23_54,
    L24_55,
    L25_56,
    {
      pos = "locator2_bird_path_07",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_07_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_08",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_08_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_09",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_09_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_10",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_10_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_11",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_11_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_12",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_12_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_13",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_13_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_14",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_14_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_15",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_15_over_run",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_16",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_16_over_run",
      attr = "fly"
    }
  }
  L14_45 = {}
  L14_45.pos = "locator2_bird_path_01"
  L14_45.attr = "takeoff"
  L15_46 = {}
  L15_46.pos = "locator2_bird_path_01_over_run"
  L15_46.attr = "fly"
  L16_47 = {}
  L16_47.pos = "locator2_bird_path_02"
  L16_47.attr = "fly"
  L17_48 = {}
  L17_48.pos = "locator2_bird_path_02_over_run"
  L17_48.attr = "fly"
  L18_49 = {}
  L18_49.pos = "locator2_bird_path_03"
  L18_49.attr = "fly"
  L19_50 = {}
  L19_50.pos = "locator2_bird_path_03_over_run"
  L19_50.attr = "fly"
  L20_51 = {}
  L20_51.pos = "locator2_bird_path_04"
  L20_51.attr = "fly"
  L21_52 = {}
  L21_52.pos = "locator2_bird_path_04_over_run"
  L21_52.attr = "fly"
  L22_53.pos = "locator2_bird_path_05"
  L22_53.attr = "fly"
  L23_54.pos = "locator2_bird_path_05_over_run"
  L23_54.attr = "fly"
  L24_55.pos = "locator2_bird_path_06"
  L24_55.attr = "fly"
  L25_56.pos = "locator2_bird_path_06_over_run"
  L25_56.attr = "fly"
  L12_43.start = L13_44
  L13_44 = {
    L14_45,
    L15_46,
    L16_47,
    L17_48,
    L18_49,
    L19_50,
    L20_51,
    L21_52,
    L22_53,
    L23_54,
    L24_55,
    L25_56,
    {
      pos = "locator2_bird_path_23",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_23_over_run",
      attr = "fly"
    }
  }
  L14_45 = {}
  L14_45.pos = "locator2_bird_path_17"
  L14_45.attr = "fly"
  L15_46 = {}
  L15_46.pos = "locator2_bird_path_17_over_run"
  L15_46.attr = "fly"
  L16_47 = {}
  L16_47.pos = "locator2_bird_path_18"
  L16_47.attr = "fly"
  L17_48 = {}
  L17_48.pos = "locator2_bird_path_18_over_run"
  L17_48.attr = "fly"
  L18_49 = {}
  L18_49.pos = "locator2_bird_path_19"
  L18_49.attr = "fly"
  L19_50 = {}
  L19_50.pos = "locator2_bird_path_19_over_run"
  L19_50.attr = "fly"
  L20_51 = {}
  L20_51.pos = "locator2_bird_path_20"
  L20_51.attr = "fly"
  L21_52 = {}
  L21_52.pos = "locator2_bird_path_20_over_run"
  L21_52.attr = "fly"
  L22_53.pos = "locator2_bird_path_21"
  L22_53.attr = "fly"
  L23_54.pos = "locator2_bird_path_21_over_run"
  L23_54.attr = "fly"
  L24_55.pos = "locator2_bird_path_22"
  L24_55.attr = "fly"
  L25_56.pos = "locator2_bird_path_22_over_run"
  L25_56.attr = "fly"
  L12_43.pre_trap = L13_44
  L13_44 = {L14_45, L15_46}
  L14_45 = {}
  L14_45.pos = "locator2_bird_path_24"
  L14_45.attr = "fly"
  L15_46 = {}
  L15_46.pos = "locator2_bird_path_25"
  L15_46.attr = "fly"
  L12_43.goal = L13_44
  L13_44 = {L14_45}
  L14_45 = {}
  L14_45.pos = "locator2_bird_path_land"
  L14_45.attr = "land"
  L12_43.land = L13_44
  L13_44 = {}
  L14_45 = {
    L15_46,
    L16_47,
    L17_48
  }
  L15_46 = {}
  L15_46.pos = "locator2_bird_path_21"
  L15_46.attr = "fly"
  L16_47 = {}
  L16_47.pos = "locator2_bird_path_22"
  L16_47.attr = "fly"
  L17_48 = {}
  L17_48.pos = "locator2_bird_path_23"
  L17_48.attr = "fly"
  L13_44.check_point = L14_45
  L14_45 = {L15_46}
  L15_46 = {}
  L15_46.pos = "locator2_group_bird_leave_path"
  L15_46.attr = "fly"
  L13_44.leave = L14_45
  L14_45 = {
    L15_46,
    L16_47,
    L17_48,
    L18_49
  }
  L15_46 = {}
  L15_46.name = "sm13_group_bird_01"
  L15_46.follow_node = "locator2_group_bird_01"
  L16_47 = {}
  L16_47.name = "sm13_group_bird_02"
  L16_47.follow_node = "locator2_group_bird_02"
  L17_48 = {}
  L17_48.name = "sm13_group_bird_03"
  L17_48.follow_node = "locator2_group_bird_03"
  L18_49 = {}
  L18_49.name = "sm13_group_bird_04"
  L18_49.follow_node = "locator2_group_bird_04"
  L15_46 = false
  L16_47 = false
  L17_48 = {}
  L17_48.moveSpeed = 35
  L17_48.escape = false
  L18_49 = false
  L19_50 = invokeTask
  function L20_51()
    local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65
    L0_57 = Fn_findNpc
    L1_58 = "sm13_bird_race"
    L0_57 = L0_57(L1_58)
    L1_58 = Sound
    L2_59 = L1_58
    L1_58 = L1_58.playSEHandle
    L3_60 = "bird_flying_l"
    L4_61 = 1
    L5_62 = "flying"
    L6_63 = _puppet_tbl
    L6_63 = L6_63.sm13_bird_race
    L1_58 = L1_58(L2_59, L3_60, L4_61, L5_62, L6_63)
    bird_se = L1_58
    L1_58 = Sound
    L2_59 = L1_58
    L1_58 = L1_58.setAudibleRange
    L3_60 = bird_se
    L4_61 = 15
    L1_58(L2_59, L3_60, L4_61)
    L1_58 = _hdl_tbl
    L1_58 = L1_58.sm13_bird_race
    L2_59 = L1_58
    L1_58 = L1_58.fly
    L3_60 = L12_43.start
    L4_61 = L3_34
    L1_58(L2_59, L3_60, L4_61)
    L1_58 = Fn_getDistanceToPlayer
    L2_59 = _puppet_tbl
    L2_59 = L2_59.sm13_bird_race
    L3_60 = L2_59
    L2_59 = L2_59.getWorldPos
    L8_65 = L2_59(L3_60)
    L1_58 = L1_58(L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L2_59(L3_60))
    L2_59 = Fn_getDistanceToPlayer
    L3_60 = _next_cp
    L2_59 = L2_59(L3_60)
    L3_60 = findGameObject2
    L4_61 = "Node"
    L5_62 = _next_cp
    L3_60 = L3_60(L4_61, L5_62)
    L4_61 = Fn_get_distance
    L5_62 = _puppet_tbl
    L5_62 = L5_62.sm13_bird_race
    L6_63 = L5_62
    L5_62 = L5_62.getWorldPos
    L5_62 = L5_62(L6_63)
    L7_64 = L3_60
    L6_63 = L3_60.getWorldPos
    L8_65 = L6_63(L7_64)
    L4_61 = L4_61(L5_62, L6_63, L7_64, L8_65, L6_63(L7_64))
    L5_62 = 0
    L6_63 = 150
    L7_64 = false
    L8_65 = 12
    repeat
      L1_58 = Fn_getDistanceToPlayer(_puppet_tbl.sm13_bird_race:getWorldPos())
      L2_59 = Fn_getDistanceToPlayer(_next_cp)
      L3_60 = findGameObject2("Node", _next_cp)
      L4_61 = Fn_get_distance(_puppet_tbl.sm13_bird_race:getWorldPos(), L3_60:getWorldPos())
      if L7_64 then
        L6_63 = L6_63 - 1
        L8_65 = 14
        L0_57:setFlyMoveSpeed(L8_65)
        if L6_63 <= 0 then
          L7_64 = false
          L6_63 = 150
        end
      elseif L2_59 < L4_61 - 5 and L1_58 < L2_59 then
        L8_65 = 20
        L0_57:setFlyMoveSpeed(L8_65)
        L5_62 = L5_62 + 1
      else
        L8_65 = 10
        if L5_62 >= 30 then
          L7_64 = true
          L5_62 = 0
        else
          L0_57:setFlyMoveSpeed(L8_65)
        end
      end
      wait()
    until L0_57:isFlyEnd()
    _hdl_tbl.sm13_bird_race:fly(L12_43.pre_trap, L3_34)
    repeat
      L1_58 = Fn_getDistanceToPlayer(_puppet_tbl.sm13_bird_race:getWorldPos())
      L2_59 = Fn_getDistanceToPlayer(_next_cp)
      while L3_60 == nil do
        L3_60 = findGameObject2("Node", _next_cp)
        wait()
      end
      L4_61 = Fn_get_distance(_puppet_tbl.sm13_bird_race:getWorldPos(), L3_60:getWorldPos())
      if not L16_47 then
        if L2_59 < L4_61 + 10 and L1_58 < L2_59 then
          L8_65 = 18
          L0_57:setFlyMoveSpeed(L8_65)
        else
          L8_65 = 10
          L0_57:setFlyMoveSpeed(L8_65)
        end
      else
        L8_65 = 10
      end
      wait()
    until L0_57:isFlyEnd()
    if not L16_47 then
      Fn_fly("sm13_bird_race", L12_43.goal, L4_35)
      is_bird_goal = true
      Fn_fly("sm13_bird_race", L12_43.land, L4_35)
      Fn_playMotionNpc("sm13_bird_race", "landing", true)
    end
  end
  L19_50(L20_51)
  L19_50 = invokeTask
  function L20_51()
    Fn_playMotionNpc("sm13_group_bird_leader", "fly", false)
    for _FORV_3_, _FORV_4_ in pairs(L14_45) do
      waitSeconds(RandI(0, 1))
      Fn_playMotionNpc(_FORV_4_.name, "fly", false)
    end
  end
  L19_50(L20_51)
  L19_50 = invokeTask
  function L20_51()
    local L0_66, L1_67
    L0_66 = {}
    L1_67 = nil
    while true do
      if L2_33 then
        L1_67 = Sound:playSEHandle("gull_cry", 1, "cry", _puppet_tbl.sm13_group_bird_leader)
        Sound:setAudibleRange(L1_67, 15)
        for _FORV_5_, _FORV_6_ in pairs(L14_45) do
          L0_66[_FORV_5_] = Sound:playSEHandle("gull_cry", 1, "cry", _puppet_tbl[_FORV_6_.name])
          Sound:setAudibleRange(L0_66[_FORV_5_], 15)
          wait(RandI(15, 60))
        end
      end
      wait()
    end
  end
  L19_50(L20_51)
  L19_50 = {}
  L20_51 = nil
  L21_52 = invokeTask
  L21_52 = L21_52(L22_53)
  L22_53(L23_54)
  while true do
    if L8_39 then
      L10_41 = true
      L22_53(L23_54)
      L22_53(L23_54, L24_55)
      break
    end
    if L22_53 then
      L10_41 = false
      break
    end
    L22_53()
  end
  L22_53(L23_54, L24_55)
  L22_53()
  L22_53()
  L22_53(L23_54)
  _can_warp_flg = false
  repeat
    L22_53()
  until L22_53 == false
  L22_53()
  for L25_56 = 1, 11 do
    Fn_pcSensorOff("pccubesensor2_outrange_" .. string.format("%02d", L25_56))
  end
  for L25_56 = 1, 5 do
    if L19_50[L25_56] ~= nil then
      Sound:stopSEHandle(L19_50[L25_56])
    end
  end
  if L22_53 ~= nil then
    L22_53(L23_54, L24_55)
  end
  L2_33 = false
  if not L10_41 then
    if L22_53 < 14 then
      L22_53(L23_54)
    else
      L22_53(L23_54)
    end
  end
  L22_53()
  if L21_52 ~= nil then
    L22_53(L23_54)
  end
  L21_52 = nil
  L22_53(L23_54, L24_55)
  L22_53.timer = false
  L22_53.counter = false
  L23_54(L24_55)
  L23_54(L24_55, L25_56)
  L23_54(L24_55, L25_56)
  L23_54(L24_55)
  L23_54(L24_55)
  L23_54(L24_55, L25_56)
  L23_54(L24_55, L25_56)
  L23_54()
  if L10_41 then
    while true do
      if L23_54 == false then
        L23_54()
      end
    end
    L23_54(L24_55)
    L23_54(L24_55)
    L23_54(L24_55)
    while true do
      if L23_54 == false then
        L23_54()
      end
    end
    L24_55(L25_56, L23_54)
    for _FORV_27_ = 1, #L6_37 do
      if L6_37[_FORV_27_] ~= nil then
        L6_37[_FORV_27_]:abort()
      end
      L6_37[_FORV_27_] = nil
    end
  else
    while true do
      if L23_54 == false then
        L23_54()
      end
    end
    L23_54()
    L23_54(L24_55, L25_56)
    L23_54(L24_55)
    L23_54()
    L23_54()
  end
  L23_54(L24_55)
  L23_54()
  L23_54(L24_55, L25_56)
  if L23_54 then
    L23_54(L24_55)
  end
  _cat_warp_task = nil
  L23_54()
  L23_54()
  L23_54()
  L23_54()
end
function Finalize()
  if _cat_warp_task then
    _cat_warp_task:abort()
  end
  _cat_warp_task = nil
end
function raceOutrangeOnLeave()
  if _can_warp_flg then
    HUD:courseOutStart()
    Mv_setGravityCatWarpLeaveArea(true)
  end
end
