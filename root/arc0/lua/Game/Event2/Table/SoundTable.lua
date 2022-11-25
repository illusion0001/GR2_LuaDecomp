L0_0 = {
  {
    "AM04A",
    "AM04B",
    "AM05A",
    "AM05B",
    "CM02"
  },
  {
    "CM31",
    "CM13A",
    "CM13B",
    "BM06",
    "CM03",
    "CM04"
  },
  {
    "CM09",
    "CM10",
    "CM11",
    "CM12"
  }
}
stream_header = L0_0
L0_0 = {}
L0_0.mine01 = {
  "anotherzone_se"
}
L0_0.mine02 = {
  "anotherzone_se"
}
L0_0.mine03 = {
  "anotherzone_se"
}
L0_0.mine04 = {
  "anotherzone_se"
}
L0_0.mine05 = {
  "anotherzone_se"
}
L0_0.mine99_001 = {
  "anotherzone_se"
}
L0_0.mine99_002 = {
  "anotherzone_se"
}
L0_0.mine99_003 = {
  "anotherzone_se"
}
L0_0.mine99_004 = {
  "anotherzone_se"
}
L0_0.mine99_005 = {
  "anotherzone_se"
}
L0_0.mine99_006 = {
  "anotherzone_se"
}
L0_0.mine99_007 = {
  "anotherzone_se"
}
L0_0.mine99_008 = {
  "anotherzone_se"
}
L0_0.mine99_009 = {
  "anotherzone_se"
}
L0_0.mine99_010 = {
  "anotherzone_se"
}
L0_0.mine99_011 = {
  "anotherzone_se"
}
L0_0.mine99_012 = {
  "anotherzone_se"
}
L0_0.mine99_013 = {
  "anotherzone_se"
}
L0_0.mine99_014 = {
  "anotherzone_se"
}
L0_0.mine99_025 = {
  "anotherzone_se"
}
L0_0.mine99_026 = {
  "anotherzone_se"
}
L0_0.mine99_027 = {
  "anotherzone_se",
  "ep04_se"
}
L0_0.mine99_028 = {
  "anotherzone_se"
}
L0_0.mine99_029 = {
  "anotherzone_se"
}
L0_0.mine99_030 = {
  "anotherzone_se",
  "ep12_se"
}
add_sxd_list = L0_0
L0_0 = {}
L0_0.bu_onEnter = bu_onEnter
L0_0.bu_onLeave = bu_onLeave
L0_0.wa_onEnter = bu_onEnter
L0_0.wa_onLeave = bu_onLeave
L0_0.pi_onEnter = amb_pi_01_onEnter
L0_0.pi_onLeave = amb_pi_01_onLeave
L0_0.az_onEnter = amb_az1_onEnter
L0_0.az_onLeave = amb_az1_onLeave
L0_0.az2_onEnter = amb_az2_onEnter
L0_0.az2_onLeave = amb_az2_onLeave
L0_0.az3_onEnter = amb_az3_onEnter
L0_0.az3_onLeave = amb_az3_onLeave
L0_0.az4_onEnter = amb_az4_onEnter
L0_0.az4_onLeave = amb_az4_onLeave
L0_0.az5_onEnter = amb_az5_onEnter
L0_0.az5_onLeave = amb_az5_onLeave
L0_0.az6_onEnter = amb_az6_onEnter
L0_0.az6_onLeave = amb_az6_onLeave
L0_0.co_in_onEnter = amb_co_a_onEnter
L0_0.co_in_onLeave = nil
L0_0.co_out_onEnter = nil
L0_0.co_out_onLeave = amb_co_a_onLeave
L0_0.et_onEnter = amb_ve_et_a_onEnter
L0_0.et_onLeave = amb_ve_et_a_onLeave
L0_0.et2_onEnter = amb_et2_a_onEnter
L0_0.et2_onLeave = amb_et2_a_onLeave
L0_0.et3_onEnter = amb_et3_a_onEnter
L0_0.et3_onLeave = amb_et3_a_onLeave
amb_list = L0_0
L0_0 = {}
L0_0.eventheader = {
  {
    label = "CM09",
    phase = "cc_onEnter",
    func = cc_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "cc_onLeave",
    func = cc_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "ed_onEnter",
    func = ed_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "ed_onLeave",
    func = ed_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM11",
    phase = "id_onEnter",
    func = id_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "id_onLeave",
    func = id_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM12",
    phase = "dt_onEnter",
    func = dt_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "dt_onLeave",
    func = dt_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "bu_onEnter",
    func = bu_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "bu_onLeave",
    func = bu_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM20",
    phase = "go_onEnter",
    func = go_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "go_onLeave",
    func = go_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM04",
    phase = "up_onEnter",
    func = up_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "up_onLeave",
    func = up_onLeave,
    fade_out = 2.5
  },
  {
    label = "BM06",
    phase = "po_onEnter",
    func = po_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "po_onLeave",
    func = po_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM03",
    phase = "lo_onEnter",
    func = lo_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "AI_Wind",
    phase = "lo_onLeave",
    func = lo_onLeave,
    fade_out = 2.5
  },
  {
    label = "",
    phase = "st_onEnter",
    func = amb_st_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "",
    phase = "st_onLeave",
    func = amb_st_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM28A",
    phase = "co_in_onEnter",
    func = amb_co_a_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "CM28A",
    phase = "co_out_onLeave",
    func = amb_co_a_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM28B",
    phase = "et_onEnter",
    func = amb_ve_et_a_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "CM28B",
    phase = "et_onLeave",
    func = amb_ve_et_a_onLeave,
    fade_out = 2.5
  },
  {
    label = "CM29",
    phase = "et2_onEnter",
    func = amb_et2_a_onEnter,
    fade_out = 2.5,
    deley = 1
  },
  {
    label = "CM29",
    phase = "et2_onLeave",
    func = amb_et2_a_onLeave,
    fade_out = 2.5
  },
  {
    label = "",
    phase = "episode_replay",
    fade_out = 1
  }
}
L0_0.livelyManager2 = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "le_battle_start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "le_battle_end",
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "CM04",
    phase = "up_replace_bgm",
    fade_in = 2.5,
    deley = 1
  },
  {
    label = "BM06",
    phase = "po_replace_bgm",
    fade_in = 2.5,
    deley = 1
  },
  {
    label = "CM03",
    phase = "lo_replace_bgm",
    fade_in = 2.5,
    deley = 1
  }
}
L0_0.ep00_00100m = {}
L0_0.ep00_a = {}
L0_0.ep00_b = {
  {
    label = "",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.ep00_00200m = {}
L0_0.ep00_c = {
  {
    label = "BM08",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.ep00_00300m = {
  {label = "BM08", phase = "play"}
}
L0_0.ep00_00400c = {
  {
    label = "CM38",
    phase = "play",
    func = amb_pi_01_onEnter,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep00_00500m = {
  {
    label = "CM44",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep01_a = {
  {
    label = "CM02",
    variable = "CM02A_trans_1",
    phase = "ep01_00010k",
    func = bu_onEnter,
    city_bgm = true
  }
}
L0_0.ep01_b = {
  {
    label = "CM02",
    variable = "CM02A_trans_1",
    phase = "start",
    func = bu_onEnter,
    fade_out = 2
  },
  {
    label = "",
    phase = "ep01_01020",
    fade_out = 5
  },
  {
    label = "BM07",
    phase = "ep01_01005",
    fade_in = 3,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep01_00200m = {
  {label = "BM07", phase = "play"}
}
L0_0.ep01_c = {
  {
    label = "BM07",
    phase = "start",
    func = bu_onEnter,
    fade_out = 2
  }
}
L0_0.ep01_00300m = {
  {
    label = "BM08",
    phase = "play",
    delay = 2,
    fade_out = 2
  }
}
L0_0.ep01_d = {
  {
    label = "BM08",
    phase = "start",
    func = bu_onEnter,
    fade_out = 2
  },
  {
    label = "BM09",
    phase = "ep01_01010k",
    kdemo = "end",
    delay = 0
  }
}
L0_0.ep01_00400m = {
  {
    label = "CM46A",
    phase = "play",
    delay = 0.4,
    fade_out = 2
  }
}
L0_0.ep01_00500c = {
  {
    label = "CM39",
    phase = "play",
    fade_out = 2
  },
  {
    label = "",
    phase = 19,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep02_a = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start",
    func = bu_onEnter,
    fade_out = 2
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "ep02_00010k",
    kdemo = "start",
    fade_out = 2
  }
}
L0_0.ep02_a2 = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start",
    func = bu_onEnter,
    city_bgm = false
  }
}
L0_0.ep02_00100c = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "play",
    fade_out = 2
  },
  {
    label = "CM02",
    variable = "CM02_trans_revise",
    phase = 16
  },
  {
    label = "CM02",
    variable = "CM02_trans_ducking",
    phase = 17
  },
  {
    label = "CM02",
    variable = "CM02_trans_ducking",
    phase = 18
  },
  {
    label = "CM02",
    variable = "CM02_trans_revise",
    phase = 19
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = 21,
    fade_in = 2
  },
  {label = "", phase = 22},
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep02_b = {
  {
    label = "",
    phase = "ep02_00110k",
    kdemo = "start",
    func = amb_st_onEnter,
    fade_out = 2.5
  }
}
L0_0.ep02_c = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter
  },
  {
    label = "BM07",
    phase = "ep02_00137k",
    kdemo = "start",
    fade_out = 3
  }
}
L0_0.ep02_d = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ep02_00140k",
    kdemo = "start",
    delay = 0
  },
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "ep02_00140k",
    kdemo = "end",
    fade_in = 5,
    fade_out = 2
  }
}
L0_0.ep02_e = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter
  },
  {
    label = "",
    phase = "ep02_04003",
    kdemo = "start",
    fade_out = 3
  },
  {
    label = "BM07",
    phase = "ep02_00145k",
    kdemo = "start",
    delay = 0
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "battle1",
    fade_out = 2
  }
}
L0_0.ep02_f = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.ep02_g = {
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "start",
    func = amb_pi_01_onEnter
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    phase = "battle_2",
    delay = 0
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end"
  }
}
L0_0.ep02_com_a = {
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "ep02_09027",
    func = amb_pi_01_onEnter
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "eventpoint_f_3_demo"
  }
}
L0_0.ep02_00200m = {
  {
    label = "BM09",
    phase = "play",
    func = bu_onEnter,
    fade_out = 1
  }
}
L0_0.ep02_00300c = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "play",
    fade_out = 2
  }
}
L0_0.eps03 = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start",
    func = bu_onEnter
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "eps03_00010k",
    kdemo = "start"
  }
}
L0_0.ep03_00100c = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "play",
    fade_out = 2
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = 12,
    fade_out = 2
  },
  {
    label = "",
    phase = 13,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep03_00200m = {
  {
    label = "",
    phase = "play",
    delay = 0
  }
}
L0_0.ep03_a = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_b = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_c = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_d = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_e = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_f = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_g = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_h = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_i = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_j = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_k = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_l = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_m = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_n = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  },
  {
    label = "CM08",
    variable = "CM08B_trans_1",
    phase = "ep03_14000"
  }
}
L0_0.ep03_o = {
  {
    label = "CM08",
    variable = "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_p = {
  {
    label = "CM08",
    variable = "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_q = {
  {
    label = "CM08",
    variable = "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_r = {
  {
    label = "CM08",
    variable = "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_s = {
  {
    label = "CM08",
    variable = "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_00300m = {
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "play",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_t = {
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "start",
    func = amb_az1_onEnter
  }
}
L0_0.ep03_00400m = {
  {
    label = "CM46A",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep03_00500c = {
  {
    label = "CM39",
    phase = "play",
    fade_out = 1
  },
  {
    label = "CM39",
    phase = 17,
    fade_in = 1,
    fade_out = 2
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = 18,
    fade_out = 3
  },
  {
    label = "",
    phase = 19,
    fade_out = 3
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 3
  }
}
L0_0.eps04 = {
  {
    label = "CM02",
    variable = "CM02C_trans_1",
    phase = "ic_tutorial_00920",
    func = bu_onEnter,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM02",
    variable = "CM02C_trans_1",
    phase = "ep04_00003",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.ep04_00100c = {
  {
    label = "CM40",
    phase = "play",
    fade_out = 2
  },
  {
    label = "CM40",
    phase = 11,
    fade_in = 2
  },
  {
    label = "",
    phase = 12,
    fade_out = 2
  },
  {
    label = "CM19",
    phase = 14,
    fade_out = 2
  },
  {
    label = "CM19",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep04_a = {
  {
    label = "CM19",
    phase = "start",
    func = bu_onEnter,
    fade_out = 1
  },
  {
    label = "",
    phase = "ep04_00110k",
    kdemo = "end",
    fade_out = 3
  }
}
L0_0.ep04_com_a = {
  {
    label = "CM14A",
    variable = "CM14A_trans_1",
    phase = "ep04_09023",
    func = bu_onEnter,
    fade_out = 1
  },
  {
    label = "",
    phase = "ep04_09029",
    func = bu_onEnter,
    fade_out = 2
  }
}
L0_0.ep04_00200m = {
  {
    label = "AM07_1",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep04_b = {
  {
    phase = "start",
    func = bu_onEnter,
    fade_out = 1
  }
}
L0_0.ep04_00300m = {
  {
    label = "CM40",
    phase = "play",
    fade_out = 4
  }
}
L0_0.ep04_c = {
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    func = bu_onEnter,
    fade_out = 2
  },
  {
    label = "",
    phase = "start",
    func = variable_amb004_set_05_OnEnter
  },
  {
    label = "CM14A",
    variable = "CM14B_trans_1",
    phase = "ep04_02000",
    fade_out = 1
  }
}
L0_0.ep04_00400m = {
  {
    label = "CM39",
    phase = "play",
    fade_out = 1
  }
}
L0_0.eps05_a = {
  {
    label = "",
    phase = "start",
    func = po_out_onEnter,
    fade_out = 4
  },
  {
    label = "AM06_1",
    phase = "eps05_00010k",
    kdemo = "end",
    fade_out = 4
  }
}
L0_0.eps05_00100m = {
  {
    label = "CM39",
    phase = "play",
    func = amb_onLeave,
    fade_out = 2
  }
}
L0_0.eps05_b = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    fade_out = 3,
    delay = 2,
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.ep05_00100c = {
  {
    label = "BM06",
    phase = "play",
    city_bgm = true
  }
}
L0_0.ep05_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter
  }
}
L0_0.ep05_b = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "ep05_01002",
    fade_out = 3
  }
}
L0_0.ep05_c = {
  {
    label = "CM16",
    phase = "start",
    func = lo_onEnter,
    city_bgm = false
  },
  {
    label = "CM16",
    phase = "ep05_02003",
    delay = 0
  }
}
L0_0.ep05_d = {
  {
    label = "CM16",
    phase = "start",
    func = lo_onEnter,
    city_bgm = false
  }
}
L0_0.ep05_e = {
  {
    label = "CM16",
    phase = "start",
    func = lo_onEnter,
    city_bgm = false
  }
}
L0_0.ep05_f = {
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 3,
    func = lo_onEnter
  },
  {
    label = "AM07_1",
    phase = "start",
    func = variable_amb007_set_0_OnEnter,
    city_bgm = false
  },
  {
    phase = "ep05_03001",
    func = Revset_eaves_large
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "ep05_00140k",
    kdemo = "end",
    fade_out = 2
  }
}
L0_0.ep05_00200c = {
  {
    label = "",
    phase = 2,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM40",
    phase = 4,
    fade_out = 2
  },
  {
    label = "CM40",
    phase = 11,
    fade_in = 2
  },
  {
    label = "",
    phase = 12,
    fade_out = 1.5
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep05_00300m = {
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "play",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep05_g = {
  {
    phase = "battle1",
    func = lo_onEnter,
    city_bgm = false
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "start",
    func = Revset_eaves_large,
    fade_out = 2,
    city_bgm = false
  },
  {
    phase = "ep05_04000",
    func = variable_amb007_set_0_OnEnter
  },
  {
    label = "",
    phase = "ep05_04002",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "ep05_00310k",
    kdemo = "start",
    city_bgm = false
  }
}
L0_0.ep05_00400c = {
  {
    label = "BM09",
    phase = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    city_bgm = true
  },
  {
    label = "",
    phase = "cancel",
    city_bgm = true
  }
}
L0_0.eps06 = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.ep06_00100c = {
  {
    label = "CM04",
    phase = "play",
    city_bgm = true
  }
}
L0_0.ep06_a = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  }
}
L0_0.ep06_a2 = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  }
}
L0_0.ep06_a3 = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  }
}
L0_0.ep06_b = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  }
}
L0_0.ep06_c = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 6.5,
    city_bgm = false
  },
  {
    label = "BM07",
    phase = "ep06_00175k",
    kdemo = "start",
    fade_out = 2.5,
    city_bgm = false
  },
  {
    label = "BM08",
    phase = "ep06_00175k",
    kdemo = "end",
    fade_out = 2.5,
    city_bgm = false
  }
}
L0_0.ep06_d = {
  {
    label = "BM08",
    phase = "start",
    func = po_onEnter,
    city_bgm = false
  },
  {
    label = "BM08",
    phase = "ep06_03003",
    func = lo_onEnter,
    city_bgm = false
  }
}
L0_0.ep06_e = {
  {
    label = "BM08",
    phase = "start",
    func = lo_onEnter,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_4",
    phase = "ep06_04004",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    phase = "ep06_04011",
    city_bgm = false
  }
}
L0_0.ep06_f = {
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    func = lo_onEnter,
    phase = "start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ep06_00195k",
    kdemo = "start",
    city_bgm = false
  }
}
L0_0.ep06_00200m = {
  {
    label = "",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep06_00300c = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "play",
    fade_out = 2
  },
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = 11,
    fade_out = 2
  },
  {
    label = "",
    phase = 12,
    fade_out = 3
  },
  {label = "CM40", phase = 13},
  {
    label = "BM06",
    phase = "end",
    fade_in = 4,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "BM06",
    phase = "cancel",
    fade_in = 4,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep07_00100c = {
  {
    label = "CM16",
    phase = "play",
    fade_out = 2
  },
  {
    label = "CM16",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep07_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.ep07_b = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  }
}
L0_0.ep07_com_a = {
  {
    label = "",
    phase = "ep07_09001",
    fade_out = 5,
    city_bgm = false
  }
}
L0_0.ep07_c = {
  {
    label = "CM16",
    phase = "start",
    func = up_onEnter,
    city_bgm = false
  }
}
L0_0.ep07_d = {
  {
    label = "CM16",
    phase = "start",
    func = go_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 3
  }
}
L0_0.ep07_e = {
  {
    label = "",
    phase = "start",
    func = go_onEnter,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM17",
    phase = "ep07_04006",
    city_bgm = false
  }
}
L0_0.ep07_f = {
  {
    label = "",
    phase = "start",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "BM07",
    phase = "ep07_00125k",
    kdemo = "end",
    func = po_onEnter
  }
}
L0_0.ep07_00200m = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "play",
    fade_out = 2,
    delay = 2.5,
    city_bgm = false
  }
}
L0_0.ep07_g = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    func = po_onEnter,
    phase = "start",
    city_bgm = false
  }
}
L0_0.ep07_00300m = {
  {
    label = "CM32",
    variable = "CM32A_trans_End",
    phase = "play",
    fade_in = 0.6
  }
}
L0_0.ep07_h = {
  {
    label = "CM39",
    phase = "start",
    func = po_onEnter
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "ep07_00330k",
    kdemo = "end",
    fade_out = 2
  },
  {
    label = "AM04B",
    variable = "AM04B_trans_1",
    phase = "ev_point1",
    func = po_onEnter,
    delay = 1.3,
    fade_out = 1
  }
}
L0_0.ep07_i = {
  {
    label = "AM04B",
    variable = "AM04B_trans_2",
    phase = "start",
    func = po_onEnter,
    delay = 0
  }
}
L0_0.ep07_j = {
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "start",
    func = po_onEnter,
    fade_out = 2
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "sdemo1",
    sdemo = 2,
    delay = 0
  }
}
L0_0.ep07_00400m = {
  {
    label = "CM46A",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep07_00500c = {
  {
    label = "CM39",
    phase = "play",
    fade_out = 1
  },
  {
    label = "CM39",
    phase = 18,
    fade_in = 2
  },
  {
    label = "",
    phase = 19,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.eps08 = {
  {
    label = "",
    phase = "start",
    func = po_onEnter
  },
  {
    label = "BM06",
    phase = "eps08_00010k",
    kdemo = "start",
    delay = 2,
    city_bgm = true
  }
}
L0_0.ep08_00100c = {
  {
    label = "BM06",
    phase = 2,
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.ep08_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "ev_point1",
    fade_out = 2
  }
}
L0_0.ep08_b = {
  {
    label = "CM16",
    phase = "start",
    func = go_onEnter,
    delay = 0
  },
  {
    phase = "ep08_00210k",
    kdemo = "start",
    func = variable_amb008_set_05_OnEnter
  },
  {
    label = "",
    phase = "ep08_00240k",
    "start",
    fade_out = 3
  }
}
L0_0.ep08_00300c = {
  {
    label = "",
    phase = 2,
    fade_out = 2
  }
}
L0_0.ep08_c = {
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    func = go_onEnter
  }
}
L0_0.ep08_d = {
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "start",
    func = go_onEnter,
    delay = 0
  },
  {
    label = "",
    phase = "ep08_03003",
    fade_out = 3
  }
}
L0_0.ep08_00600c = {
  {
    label = "BM07",
    phase = "play",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = 21,
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "",
    phase = "end",
    fade_out = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep09_header = {
  {
    label = "BM06",
    phase = "ft09_00010k",
    kdemo = "end",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.eps09 = {}
L0_0.ep09_00100c = {
  {
    label = "",
    phase = "play",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM38",
    phase = 5,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM38",
    phase = 16,
    fade_in = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = 17,
    city_bgm = false
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep09_a = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter,
    fade_out = 2
  }
}
L0_0.ep09_b = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_c = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_d = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_e = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_f = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_g = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_h = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  }
}
L0_0.ep09_i = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter
  },
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "ep09_a_c01",
    pdemo = "start"
  }
}
L0_0.ep09_j = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_k = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_l = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_m = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_n = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_o = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_p = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_q = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_r = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    fade_in = 2,
    func = amb_az2_onEnter
  }
}
L0_0.ep09_00200m = {
  {
    label = "BM08",
    phase = "play",
    delay = 0,
    fade_out = 2
  }
}
L0_0.ep09_s = {
  {
    label = "BM08",
    phase = "start",
    func = amb_az2_onEnter
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "battle",
    fade_out = 1
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_End2",
    phase = "battle_end"
  }
}
L0_0.ep09_t = {
  {label = "BM08", phase = "start"}
}
L0_0.ep09_00400m = {
  {label = "BM08", phase = "play"}
}
L0_0.ep09_00500c = {
  {label = "CM38", phase = 3},
  {
    label = "",
    phase = "end",
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.eps10 = {
  {
    label = "BM06",
    phase = "start",
    delay = 2.5,
    func = po_onEnter,
    city_bgm = ture
  }
}
L0_0.ep10_00100c = {
  {
    label = "CM19",
    phase = 4,
    fade_out = 3
  },
  {
    label = "CM19",
    phase = 13,
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "CM38",
    phase = 14,
    fade_out = 2
  },
  {
    label = "CM38",
    phase = 17,
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "",
    phase = 18,
    fade_out = 1
  },
  {
    label = "CM19",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep10_a = {
  {
    label = "CM19",
    phase = "start",
    func = go_onEnter,
    fade_out = 3
  }
}
L0_0.ep10_b = {
  {
    label = "CM19",
    phase = "start",
    func = go_onEnter,
    fade_out = 3
  }
}
L0_0.ep10_c = {
  {
    label = "CM19",
    phase = "start",
    func = go_onEnter,
    fade_out = 3
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "ep10_01004",
    fade_out = 0.5
  }
}
L0_0.ep10_d = {
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "battle1",
    func = go_onEnter
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "start"
  }
}
L0_0.ep10_00200m = {}
L0_0.ep10_e = {
  {
    label = "BM08",
    phase = "start",
    func = go_onEnter
  }
}
L0_0.ep10_00300m = {
  {label = "", phase = "play"}
}
L0_0.ep10_f = {
  {
    label = "BM08",
    phase = "start",
    func = go_onEnter
  },
  {
    label = "BM08",
    phase = "ep10_00320k",
    kdemo = "start"
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "boss",
    fade_out = 2
  }
}
L0_0.ep10_00400m = {
  {
    label = "CM46C",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep10_00500c = {
  {
    label = "CM39",
    phase = 2,
    fade_out = 1
  }
}
L0_0.ep10_00600m = {
  {
    label = "BM08",
    phase = "play",
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.ep11_00100c = {
  {
    label = "CM19",
    phase = "play",
    fade_out = 3
  }
}
L0_0.ep11_00200m = {
  {
    label = "BM08",
    phase = "play",
    fade_out = 3
  }
}
L0_0.ep11_a = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter
  }
}
L0_0.ep11_a2 = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter
  }
}
L0_0.ep11_b = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter
  }
}
L0_0.ep11_c = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter
  }
}
L0_0.ep11_00300m = {
  {
    label = "",
    phase = "play",
    fade_out = 4
  }
}
L0_0.ep11_d = {
  {
    label = "CM05",
    variable = "CM05A_trans_1",
    phase = "start",
    func = up_onEnter,
    fade_out = 2
  }
}
L0_0.ep11_00500c = {
  {label = "CM18", phase = "play"},
  {
    label = "",
    phase = "end",
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep12_a = {
  {
    label = "CM19",
    phase = "start",
    func = up_onEnter
  }
}
L0_0.ep12_b = {
  {
    label = "CM19",
    phase = "start",
    func = up_onEnter
  },
  {
    label = "",
    phase = "ep12_00120k",
    kdemo = "end",
    fade_out = 3
  }
}
L0_0.ep12_c = {
  {
    label = "CM05",
    variable = "CM05A_trans_1",
    phase = "start",
    func = az4_onEnter
  }
}
L0_0.ep12_d = {
  {
    label = "CM05",
    variable = "CM05A_trans_1",
    phase = "start",
    func = az4_onEnter
  }
}
L0_0.ep12_e = {
  {
    label = "CM05",
    variable = "CM05A_trans_1",
    phase = "start",
    func = az4_onEnter
  }
}
L0_0.ep12_f = {
  {
    label = "CM05",
    variable = "CM05A_trans_1",
    phase = "start",
    func = az4_onEnter
  }
}
L0_0.ep12_g = {
  {
    label = "CM05",
    variable = "CM05A_trans_1",
    phase = "start",
    func = az4_onEnter
  },
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "ep12_00205k",
    kdemo = "start",
    fade_in = 2
  }
}
L0_0.ep12_h = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_i = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_j = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_k = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_l = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_m = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_n = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_o = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_p = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_q = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_00300m = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  }
}
L0_0.ep12_r = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2,
    fade_out = 1
  }
}
L0_0.ep12_s = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_t = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_u = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_v = {
  {
    label = "CM05",
    variable = "CM05B_trans_1",
    phase = "start",
    func = az4_onEnter,
    fade_in = 2
  }
}
L0_0.ep12_00400m = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  }
}
L0_0.ep12_w = {
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "start",
    func = az4_onEnter
  }
}
L0_0.ep12_00500m = {
  {
    label = "CM46A",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep12_00600c = {
  {label = "BM09", phase = "play"},
  {
    label = "BM09",
    phase = 7,
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "",
    phase = 8,
    fade_out = 2
  },
  {label = "BM08", phase = 9},
  {
    label = "",
    phase = 16,
    fade_out = 2
  }
}
L0_0.ep12_00700m = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  }
}
L0_0.ep13_2a = {}
L0_0.ep13_a = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    city_bgm = true
  }
}
L0_0.ep13_00100c = {
  {
    label = "CM09",
    phase = "play",
    city_bgm = true
  }
}
L0_0.ep13_b = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "ep13_02000",
    fade_out = 3
  }
}
L0_0.ep13_c = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start",
    func = cc_onEnter,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "battle1",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ep13_02007"
  }
}
L0_0.ep13_00200m = {}
L0_0.ep13_d = {
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "start",
    func = cc_onEnter
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "ep13_00210k",
    kdemo = "end"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ep13_03003"
  }
}
L0_0.ep13_00300m = {}
L0_0.ep13_00400c = {
  {label = "CM39", phase = "play"},
  {
    label = "",
    phase = "end",
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.eps14 = {
  {
    label = "",
    phase = "start",
    func = cc_onEnter,
    fade_out = 3
  },
  {
    label = "CM09",
    phase = "eps14_00010k",
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "eps14_00020k",
    kdemo = "start",
    fade_out = 2
  },
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "eps14_00020k",
    kdemo = "end",
    fade_out = 3,
    delay = 2,
    city_bgm = true
  }
}
L0_0.ep14_00100c = {
  {
    label = "CM09",
    phase = "play",
    city_bgm = false
  },
  {
    label = "",
    phase = 4,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM38",
    phase = 6,
    city_bgm = true
  }
}
L0_0.ep14_a = {
  {
    label = "CM38",
    phase = "start",
    phase = "cc_onEnter",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "ep14_00110k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep14_b = {
  {
    label = "CM11",
    phase = "start",
    func = id_onEnter,
    city_bgm = true
  },
  {
    label = "CM11",
    phase = "ep14_01000",
    city_bgm = true
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "battle1",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end",
    city_bgm = false
  },
  {
    label = "CM11",
    phase = "ep14_01017",
    fade_in = 4,
    fade_out = 3,
    city_bgm = true
  },
  {
    label = "CM11",
    phase = "ep14_01019",
    fade_in = 4,
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.ep14_c = {
  {
    label = "CM11",
    phase = "start",
    func = id_onEnter,
    city_bgm = true
  }
}
L0_0.ep14_d = {
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "start",
    func = ed_onEnter,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep14_e = {
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "start",
    func = ed_onEnter,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "ep14_00160k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "",
    phase = "ep14_00161k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = "ep14_00162k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = "ep14_00163k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "ep14_04000",
    fade_out = 3,
    delay = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sdemo1",
    sdemo = 2,
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.ep14_f = {
  {
    label = "",
    phase = "start",
    fade_out = 3,
    func = ed_onEnter,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "ep14_00170k",
    kdemo = "start",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = "ep14_00171k",
    kdemo = "end",
    fade_in = 3,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = "ep14_00172k",
    kdemo = "end",
    fade_in = 3,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = "ep14_00173k",
    kdemo = "end",
    fade_in = 3,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = "ep14_05013",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "sdemo1",
    sdemo = 1,
    fade_in = 3,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "ep14_05004",
    fade_in = 3,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "ep14_00180k",
    kdemo = "start",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.ep14_com_a = {}
L0_0.ep14_00200c = {
  {
    label = "",
    phase = 2,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "",
    phase = 4,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM39",
    phase = 5,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "end",
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "CM09",
    phase = "cancel",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.eps15 = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    fade_out = 3,
    fade_in = 3,
    city_bgm = true
  }
}
L0_0.ep15_2a = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  }
}
L0_0.ep15_00100c = {
  {
    label = "CM19",
    phase = "play",
    city_bgm = false
  }
}
L0_0.ep15_a = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep15_b = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep15_c = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "CM17",
    phase = "ep15_00130k",
    kdemo = "end"
  }
}
L0_0.ep15_00200m = {
  {label = "CM17", phase = "play"}
}
L0_0.ep15_d = {
  {
    label = "CM17",
    phase = "start",
    func = dt_onEnter
  },
  {label = "CM17", phase = "battle1"},
  {
    label = "CM17",
    phase = "ep15_00210k",
    kdemo = "start"
  }
}
L0_0.ep15_d2 = {
  {
    label = "CM17",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep15_e = {
  {
    label = "CM13B",
    phase = "battle1",
    func = dt_onEnter
  },
  {label = "CM13B", phase = "start"}
}
L0_0.ep15_00300c = {
  {label = "CM13B", phase = "play"},
  {
    label = "",
    phase = 5,
    fade_out = 3
  },
  {
    label = "",
    phase = 6,
    fade_out = 3
  },
  {
    label = "BM09",
    phase = 7,
    fade_in = 2,
    fade_out = 3
  },
  {
    label = "BM09",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.eps16 = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep16_00000k = {}
L0_0.ep16_2a = {
  {
    label = "CM11",
    phase = "start",
    func = id_onEnter,
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep16_a = {
  {
    label = "CM11",
    phase = "start",
    func = id_onEnter,
    city_bgm = true
  },
  {
    label = "AM07_1",
    phase = "ep16_00111",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM17",
    phase = "ep16_00120k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep16_b = {
  {
    label = "CM17",
    phase = "start",
    func = id_onEnter,
    city_bgm = false
  }
}
L0_0.ep16_c = {
  {
    label = "CM11",
    phase = "start",
    fade_in = 3,
    fade_out = 2,
    func = id_onEnter,
    city_bgm = true
  },
  {
    label = "CM13B",
    phase = "sdemo1",
    sdemo = 2,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep16_com_a = {
  {
    label = "CM33",
    variable = "CM33A_trans_1",
    phase = "ep16_c_c01",
    func = id_onEnter,
    fade_out = 3
  }
}
L0_0.ep16_d = {
  {
    label = "CM33",
    variable = "CM33A_trans_1",
    phase = "start",
    func = id_onEnter
  },
  {
    label = "CM33",
    variable = "CM33A_trans_2",
    phase = "battle_unica1",
    fade_out = 3
  },
  {
    label = "CM33",
    variable = "CM33B_trans_2",
    phase = "battle_permet1",
    fade_out = 3
  },
  {
    label = "CM33",
    variable = "CM33A_trans_3",
    phase = "battle_unica2",
    fade_out = 3
  },
  {
    label = "CM33",
    variable = "CM33B_trans_3",
    phase = "battle_permet2",
    fade_out = 3
  }
}
L0_0.ep16_00300m = {
  {
    label = "CM46C",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep16_00400c = {
  {label = "BM07", phase = "play"},
  {
    label = "",
    phase = 6,
    fade_out = 2
  },
  {
    label = "CM18",
    phase = 7,
    fade_out = 2
  },
  {
    label = "BM07",
    phase = "cancel",
    fade_out = 0.5
  }
}
L0_0.ep17_00100m = {
  {
    label = "BM07",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep17_a = {
  {
    label = "CM17",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 3.5
  },
  {
    label = "CM16",
    phase = "ep17_00108",
    city_bgm = false,
    delay = 3
  }
}
L0_0.ep17_b = {
  {
    label = "CM16",
    phase = "start",
    func = cc_onEnter,
    city_bgm = false
  },
  {
    label = "BM07",
    phase = "ep17_00230k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep17_c = {
  {
    label = "CM16",
    phase = "start",
    fade_out = 2,
    func = ed_onEnter,
    city_bgm = false
  }
}
L0_0.ep17_d = {
  {
    label = "CM16",
    phase = "start",
    fade_out = 2,
    func = ed_onEnter,
    city_bgm = false
  }
}
L0_0.ep17_e = {
  {
    label = "CM16",
    phase = "start",
    fade_out = 2,
    func = ed_onEnter,
    city_bgm = false
  }
}
L0_0.ep17_00300m = {
  {
    label = "BM07",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep17_f = {
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    func = ed_onEnter,
    phase = "start"
  },
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    phase = "boss"
  }
}
L0_0.ep17_00400m = {
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    phase = "play",
    city_bgm = false
  }
}
L0_0.ep17_g = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "start",
    func = ed_onEnter,
    fade_out = 2
  },
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "ep17_00410k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep17_00500m = {
  {
    label = "CM46A",
    phase = "play",
    fade_out = 1,
    delay = 0.4,
    city_bgm = false
  }
}
L0_0.ep17_00600c = {
  {
    label = "CM38",
    phase = "play",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "end",
    func = cc_onEnter,
    fade_out = 3,
    city_bgm = true
  },
  {
    label = "CM09",
    phase = "cancel",
    func = cc_onEnter,
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.ep18_00100m = {
  {
    label = "BM07",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep18_00200c = {
  {
    label = "BM07",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep18_a = {
  {
    label = "BM07",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2
  },
  {
    label = "BM07",
    phase = "ep18_00210k",
    kdemo = "end",
    fade_out = 2
  }
}
L0_0.ep18_b = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "battle1",
    func = dt_onEnter,
    fade_out = 2
  },
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "start",
    fade_out = 2
  }
}
L0_0.ep18_c = {
  {
    label = "",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "",
    phase = "battle1",
    fade_out = 3
  },
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    phase = "sdemo1",
    sdemo = 1,
    delay = 5.7
  },
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    phase = "retry"
  },
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    phase = "ep18_00230k",
    kdemo = "start",
    fade_in = 1,
    fade_out = 2
  },
  {
    label = "",
    phase = "sdemo2",
    sdemo = 2,
    fade_out = 4
  }
}
L0_0.ep18_00300m = {}
L0_0.ep18_d = {
  {
    label = "",
    phase = "battle1",
    func = dt_onEnter,
    fade_out = 3
  },
  {
    label = "CM17",
    phase = "start",
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep18_e = {
  {
    label = "CM17",
    phase = "start",
    func = dt_onEnter,
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep18_00400m = {
  {
    label = "",
    phase = "play",
    fade_out = 4
  }
}
L0_0.ep18_f = {
  {
    label = "CM34",
    variable = "CM34B_trans_1",
    func = dt_onEnter,
    phase = "battle1"
  },
  {
    label = "CM34",
    variable = "CM34B_trans_1",
    phase = "start"
  }
}
L0_0.ep18_00500m = {
  {
    label = "CM46B",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep19_00100c = {
  {label = "", phase = "play"}
}
L0_0.ep19_00200m = {}
L0_0.ep19_a = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_b = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_c = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_d = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_e = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_00300m = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "play"
  }
}
L0_0.ep19_f = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_g = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_h = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_i = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_j = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_k = {
  {
    label = "CM27",
    variable = "CM27B_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_00400m = {
  {
    label = "CM27",
    variable = "CM27B_trans_1",
    func = amb_az3_onEnter,
    phase = "play"
  }
}
L0_0.ep19_l = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_m = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_n = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  }
}
L0_0.ep19_o = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  },
  {
    label = "CM27",
    variable = "CM27B_trans_1",
    phase = "ep19_16001"
  }
}
L0_0.ep19_com_a = {
  {
    label = "CM27",
    variable = "CM27B_trans_1",
    func = amb_az3_onEnter,
    phase = "ep19_09007"
  }
}
L0_0.ep19_00500m = {
  {
    label = "CM27",
    variable = "CM27B_trans_1",
    phase = "play"
  }
}
L0_0.ep19_p = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    func = amb_az3_onEnter,
    phase = "start"
  },
  {
    label = "AM04B",
    variable = "AM04B_trans_1",
    phase = "ep19_00510k",
    kdemo = "start",
    fade_in = 1
  }
}
L0_0.ep19_q = {
  {
    label = "AM04B",
    variable = "AM04B_trans_2",
    func = amb_az3_onEnter,
    phase = "start",
    fade_in = 1.5
  }
}
L0_0.ep19_00600m = {
  {
    label = "CM46C",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep20_00100c = {
  {
    label = "CM34",
    variable = "CM34B_trans_1",
    phase = "play",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.ep20_a = {
  {
    label = "CM34",
    variable = "CM34B_trans_1",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM34",
    variable = "CM34B_trans_1",
    phase = "ep20_00110k",
    kdemo = "end",
    fade_out = 2
  }
}
L0_0.ep20_00200m = {}
L0_0.ep20_b = {
  {
    label = "CM33",
    variable = "CM33C_trans_1",
    phase = "start",
    func = dt_onEnter,
    fade_out = 3
  }
}
L0_0.ep20_00300m = {
  {
    label = "CM33",
    variable = "CM33C_trans_3",
    phase = "play",
    fade_in = 0.5
  }
}
L0_0.ep20_c = {
  {
    label = "CM35",
    variable = "CM35_trans_1",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "CM35",
    variable = "CM35_trans_1",
    phase = "ep20_02100"
  }
}
L0_0.ep20_00400m = {
  {
    label = "CM35",
    variable = "CM35_trans_End2",
    phase = "play",
    fade_in = 0.5
  }
}
L0_0.ep20_d = {
  {
    label = "CM34",
    variable = "CM34C_trans_1",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2
  },
  {
    label = "CM34",
    variable = "CM34C_trans_1",
    phase = "ep20_00410k",
    kdemo = "start"
  }
}
L0_0.ep20_00500m = {
  {
    label = "CM34",
    variable = "CM34_trans_End2",
    phase = "play",
    fade_in = 0.3
  }
}
L0_0.eps21 = {
  {
    label = "",
    phase = "start",
    func = cc_onEnter,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "eps21_00020",
    city_bgm = true
  },
  {
    label = "CM09",
    phase = "eps21_00010k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.ep21_00100m = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  }
}
L0_0.ep21_00200c = {
  {
    label = "CM38",
    phase = "play",
    fade_out = 2
  },
  {
    label = "",
    phase = "end",
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep21_00300m = {
  {
    label = "CM28A",
    phase = "play",
    func = amb_co_a_onEnter,
    fade_out = 2
  }
}
L0_0.ep21_a = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_b = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_c = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_d = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_e = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_f = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_g = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_h = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_co_a_onEnter
  }
}
L0_0.ep21_00400m = {
  {
    label = "",
    phase = "play",
    fade_out = 8
  }
}
L0_0.ep21_i = {
  {
    label = "CM28B",
    phase = "start",
    func = et_onEnter,
    fade_in = 3
  }
}
L0_0.ep21_00500m = {
  {
    label = "",
    phase = "play",
    fade_out = 8
  }
}
L0_0.ep22_00100c = {
  {
    label = "",
    phase = "play",
    fade_out = 5
  }
}
L0_0.ep22_00200m = {
  {
    label = "BM03",
    phase = "play",
    func = amb_et2_a_onEnter
  }
}
L0_0.ep22_a = {
  {
    label = "CM29",
    variable = "CM29_trans_1",
    phase = "start",
    fade_out = 2,
    func = amb_et2_a_onEnter
  },
  {
    label = "CM29",
    variable = "CM29_trans_1",
    phase = "ep22_00210k",
    kdemo = "start"
  },
  {
    label = "CM29",
    variable = "CM29_trans_2",
    phase = "sdemo1",
    sdemo = 1
  },
  {
    label = "CM29",
    variable = "CM29_trans_3",
    phase = "ep22_00146"
  },
  {
    label = "CM29",
    variable = "CM29_trans_4",
    phase = "sdemo2",
    sdemo = 2
  },
  {
    label = "CM29",
    variable = "CM29_trans_5",
    phase = "ep22_00104"
  },
  {
    label = "CM29",
    variable = "CM29_trans_6",
    phase = "sdemo3",
    sdemo = 3
  },
  {
    label = "CM29",
    variable = "CM29_trans_7",
    phase = "ep22_00105"
  }
}
L0_0.ep22_b = {
  {
    label = "",
    phase = "ep22_01000",
    fade_out = 3
  },
  {
    label = "",
    phase = "start",
    func = amb_et2_a_onEnter,
    fade_out = 3
  }
}
L0_0.ep22_00300c = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  },
  {
    label = "",
    phase = 11,
    fade_out = 3
  },
  {
    label = "CM40",
    phase = 12,
    fade_out = 3
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 3
  }
}
L0_0.ep22_c = {
  {
    label = "CM16",
    phase = "start",
    func = amb_et2_a_onEnter,
    fade_in = 2,
    fade_out = 5
  },
  {
    phase = "ep22_00310k",
    kdemo = "start",
    func = Revset_corridor
  }
}
L0_0.ep22_00400m = {
  {
    label = "BM07",
    phase = "play",
    fade_out = 1.5
  }
}
L0_0.ep22_d = {
  {
    label = "BM08",
    phase = "start",
    func = amb_et2_a_onEnter
  },
  {
    phase = "ep22_03000",
    func = Revset_chamber
  }
}
L0_0.ep22_00500c = {
  {
    label = "CM40",
    phase = "play",
    fade_out = 2,
    fade_in = 2
  }
}
L0_0.ep23_a = {
  {
    label = "CM30",
    variable = "CM30A_trans_1",
    func = amb_et3_a_onEnter,
    phase = "start",
    fade_out = 2
  }
}
L0_0.ep23_00200c = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  },
  {
    label = "",
    phase = 4,
    fade_out = 2
  },
  {
    label = "BM07",
    phase = 5,
    fade_out = 2
  },
  {
    label = "BM07",
    phase = 12,
    fade_out = 2
  },
  {
    label = "BM08",
    phase = 13,
    fade_out = 2,
    delay = 1
  },
  {
    label = "BM07",
    phase = 14,
    fade_out = 2,
    fade_in = 2
  },
  {
    label = "BM07",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep23_b = {
  {
    label = "CM30",
    variable = "CM30A_trans_1",
    phase = "ep23_00210k",
    kdemo = "start",
    func = amb_et3_a_onEnter,
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_a_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_c = {
  {
    label = "CM30",
    variable = "CM30A_trans_1",
    phase = "start",
    func = amb_et3_a_onEnter
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_b_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_d = {
  {
    label = "CM30",
    variable = "CM30B_trans_1",
    phase = "start",
    func = amb_et3_a_onEnter,
    fade_in = 2
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_c_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_e = {
  {
    label = "CM30",
    variable = "CM30B_trans_1",
    phase = "start",
    func = amb_et3_a_onEnter,
    fade_in = 2
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_d_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_f = {
  {
    label = "CM30",
    variable = "CM30B_trans_1",
    phase = "start",
    func = amb_et3_a_onEnter,
    fade_in = 2
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_e_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_g = {
  {
    label = "CM30",
    variable = "CM30C_trans_1",
    phase = "start",
    func = amb_et3_a_onEnter,
    fade_in = 2
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_f_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_h = {
  {
    label = "CM30",
    variable = "CM30C_trans_1",
    phase = "start",
    func = amb_et3_a_onEnter,
    fade_in = 2
  },
  {
    label = "CM30",
    variable = "CM30_trans_ducking",
    phase = "ep23_g_c01"
  },
  {
    label = "CM30",
    variable = "CM30_trans_revise",
    phase = "ep23_demo_end"
  }
}
L0_0.ep23_00300m = {
  {
    label = "",
    phase = "play",
    fade_out = 2,
    func = amb_onLeave
  }
}
L0_0.ep23_00400c = {
  {
    label = "CM40",
    phase = "play",
    fade_out = 2
  },
  {
    label = "CM40",
    phase = 8,
    fade_out = 2
  },
  {
    label = "",
    phase = 9,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep24_00100m = {
  {
    label = "CM36B",
    variable = "CM36B_trans_Cro",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep24_00200c = {
  {
    label = "CM36B",
    variable = "CM36B_trans_Cro",
    phase = "play"
  }
}
L0_0.ep24_a = {
  {
    label = "CM36B",
    variable = "CM36B_trans_Cro",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep24_00300m = {
  {
    label = "CM36B",
    variable = "CM36B_trans_Cro",
    phase = "play"
  }
}
L0_0.ep24_b = {
  {
    label = "CM36B",
    variable = "CM36B_trans_Cro",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep24_00400m = {
  {
    label = "CM36B",
    variable = "CM36B_trans_End",
    phase = "play",
    fade_in = 1
  }
}
L0_0.ep24_c = {
  {
    label = "CM32",
    variable = "CM32B_trans_1",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep24_00500m = {
  {
    label = "CM32",
    variable = "CM32B_trans_End",
    phase = "play",
    fade_in = 0.5
  }
}
L0_0.ep25_00100c = {
  {
    label = "CM30",
    variable = "CM30C_trans_1",
    phase = "play",
    fade_in = 2
  },
  {
    label = "CM30",
    variable = "CM30C_trans_1",
    phase = 4,
    fade_in = 2
  },
  {
    label = "",
    phase = 5,
    fade_out = 2
  },
  {
    label = "CM40",
    phase = 6,
    fade_out = 2
  },
  {
    label = "CM40",
    phase = 15,
    fade_in = 2
  },
  {
    label = "",
    phase = 16,
    fade_out = 6
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep25_00200m = {}
L0_0.ep25_a = {
  {
    label = "CM36B",
    variable = "CM36B_trans_Kit",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep25_00300m = {
  {
    label = "CM36B",
    variable = "CM36B_trans_End",
    phase = "play",
    delay = 0.4
  }
}
L0_0.ep25_b = {
  {
    label = "CM36A",
    variable = "CM36A_trans_1",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep25_00400m = {
  {
    label = "CM36A",
    variable = "CM36A_trans_1",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep25_c = {
  {
    label = "CM36A",
    variable = "CM36A_trans_1",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.ep25_00500m = {
  {
    label = "CM36A",
    variable = "CM36A_trans_End",
    phase = "play",
    fade_in = 0.5
  }
}
L0_0.ep26_00100c = {
  {label = "CM38", phase = "play"},
  {
    label = "",
    phase = "end",
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.ep26_00200m = {
  {
    label = "CM37",
    variable = "CM37A_trans_1",
    phase = "play",
    func = dt_onEnter,
    fade_out = 2
  }
}
L0_0.ep26_a = {
  {
    label = "CM37",
    variable = "CM37A_trans_1",
    phase = "start",
    func = dt_onEnter,
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep26_00300m = {
  {
    label = "CM37",
    variable = "CM37B_trans_1",
    phase = "play",
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep26_b = {
  {
    label = "CM37",
    variable = "CM37B_trans_1",
    phase = "start",
    func = dt_onEnter,
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep26_00400m = {
  {
    label = "CM37",
    variable = "CM37B_trans_1",
    phase = "play",
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep26_c = {
  {
    label = "CM37",
    variable = "CM37B_trans_1",
    phase = "start",
    func = dt_onEnter,
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep26_00500m = {
  {
    label = "CM37",
    variable = "CM37B_trans_1",
    phase = "play",
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.ep26_d = {
  {
    label = "",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "CM37",
    variable = "CM37C_trans_2",
    phase = "ep26_00510k",
    kdemo = "end",
    forcing = true
  }
}
L0_0.ep26_00600m = {
  {
    label = "CM46C",
    phase = "play",
    delay = 0.4,
    fade_out = 1
  }
}
L0_0.ep26_e = {
  {
    label = "",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "CM37",
    variable = "CM37C_trans_1",
    func = dt_onEnter,
    phase = "ep26_04000"
  }
}
L0_0.ep26_f = {
  {
    label = "",
    phase = "start",
    func = ep26Stopamb,
    fade_out = 2
  }
}
L0_0.ep26_00700m = {}
L0_0.ep26_re01 = {
  {
    label = "BM05",
    phase = "start",
    func = dt_OnEnter,
    delay = 0.5,
    fade_in = 3
  }
}
L0_0.ep26_00750m = {}
L0_0.ep26_h = {}
L0_0.ep26_00800m = {}
L0_0.ep26_00900c = {
  {
    label = "",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep27_00100m = {
  {
    label = "CM09",
    phase = "play",
    city_bgm = true
  }
}
L0_0.ep27_a = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    city_bgm = true
  }
}
L0_0.ep27_b = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  }
}
L0_0.ep27_00300m = {
  {
    label = "",
    phase = "play",
    fade_out = 5,
    func = amb_onLeave
  }
}
L0_0.ep27_00400s = {}
L0_0.eps28 = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    city_bgm = true
  }
}
L0_0.mine01 = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "mine_start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine02 = {
  {
    label = "CM07",
    phase = "mine_start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine03 = {
  {
    label = "CM08",
    variable = "CM08A_trans_1",
    phase = "mine_start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine04 = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "mine_start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine05 = {
  {
    label = "CM27",
    variable = "CM27A_trans_1",
    phase = "mine_start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine_common = {
  {
    label = "BM07",
    phase = "mine_boss_before",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "mine_boss",
    fade_out = 1.5
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_End",
    phase = "mine_boss_finish"
  }
}
L0_0.mine99_001 = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_002 = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_003 = {
  {
    label = "CM06",
    variable = "CM06_trans_2",
    phase = "start",
    func = amb_pi_01_onEnter,
    fade_in = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_004 = {
  {
    label = "CM06",
    variable = "CM06_trans_3",
    phase = "start",
    func = amb_pi_01_onEnter,
    fade_in = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_005 = {
  {
    label = "CM06",
    variable = "CM06_trans_4",
    phase = "start",
    func = amb_pi_01_onEnter,
    fade_in = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_006 = {
  {
    label = "CM25",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_007 = {
  {
    label = "CM25",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_008 = {
  {
    label = "CM25",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_009 = {
  {
    label = "CM25",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_010 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "boss_battle",
    func = amb_pi_01_onEnter
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_End",
    phase = "boss_battle_end"
  },
  {label = "CM25", phase = "non_boss"},
  {label = "", phase = "end"}
}
L0_0.mine99_011 = {
  {
    label = "CM08",
    "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_012 = {
  {
    label = "CM08",
    "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_013 = {
  {
    label = "CM08",
    "CM08A_trans_1",
    phase = "start",
    func = amb_az1_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_014 = {
  {
    label = "CM08",
    "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter,
    fade_in = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_015 = {
  {
    label = "CM08",
    "CM08B_trans_1",
    phase = "start",
    func = amb_az1_onEnter,
    fade_in = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_016 = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_017 = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_018 = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_019 = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_020 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "boss_battle",
    func = amb_pi_01_onEnter
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_End",
    phase = "boss_battle_end"
  },
  {label = "CM07", phase = "non_boss"},
  {
    label = "",
    phase = "end",
    city_bgm = false
  }
}
L0_0.mine99_021 = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter,
    city_bgm = false
  },
  {
    phase = "ui_gaiku_04_21",
    func = amb_az2_onEnter
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_022 = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_023 = {
  {
    label = "CM26",
    variable = "CM26A_trans_1",
    phase = "start",
    func = amb_az2_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_024 = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    func = amb_az2_onEnter,
    fade_in = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_025 = {
  {
    label = "CM26",
    variable = "CM26B_trans_1",
    phase = "start",
    func = amb_az2_onEnter,
    fade_in = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "end",
    fade_out = 1
  }
}
L0_0.mine99_026 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "boss_battle"
  },
  {
    label = "CM32",
    variable = "CM32B_trans_1",
    phase = "boss_battle2"
  },
  {
    label = "CM32",
    variable = "CM32B_trans_End",
    phase = "boss_battle_end"
  },
  {label = "CM07", phase = "non_boss"},
  {label = "", phase = "end"}
}
L0_0.mine99_027 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "CM14A",
    variable = "CM14A_trans_1",
    phase = "boss_battle"
  },
  {
    label = "CM14A",
    variable = "CM14B_trans_2",
    phase = "boss_battle2"
  },
  {
    label = "",
    phase = "boss_battle_end"
  },
  {label = "CM25", phase = "non_boss"},
  {label = "", phase = "end"}
}
L0_0.mine99_028 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "CM20",
    phase = "boss_battle"
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "boss_battle2"
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_End",
    phase = "boss_battle_end"
  },
  {label = "CM07", phase = "non_boss"},
  {label = "", phase = "end"}
}
L0_0.mine99_029 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "CM34",
    variable = "CM34A_trans_1",
    phase = "boss_battle"
  },
  {
    label = "CM34",
    variable = "CM34_trans_End",
    phase = "boss_battle_end"
  },
  {
    label = "",
    phase = "boss_battle_end"
  },
  {label = "", phase = "non_boss"},
  {label = "", phase = "end"}
}
L0_0.mine99_030 = {
  {
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "CM05",
    variable = "CM05C_trans_1",
    phase = "boss_battle"
  },
  {
    label = "CM05",
    variable = "CM05_trans_End",
    phase = "boss_battle_end"
  },
  {
    label = "",
    phase = "boss_battle_end"
  },
  {label = "", phase = "non_boss"},
  {label = "", phase = "end"}
}
L0_0.mine99 = {
  {
    label = "",
    phase = "bgmstop",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm01_a = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm01_b = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.sm01_c = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.sm01_d = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter
  },
  {
    label = "BM07",
    phase = "sm01_03002",
    func = amb_pi_01_onEnter,
    fade_out = 2
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "ev_point1"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ev_point2"
  }
}
L0_0.sm01_e = {
  {
    label = "BM09",
    phase = "start",
    fade_in = 2,
    fade_out = 2,
    func = amb_pi_01_onEnter
  }
}
L0_0.sm01_f = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start",
    func = bu_onEnter,
    fade_out = 1,
    city_bgm = true
  }
}
L0_0.sm02_a = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start",
    func = bu_onEnter,
    city_bgm = true
  }
}
L0_0.sm02_b = {
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "start"
  },
  {
    label = "",
    phase = "sm02_01500k",
    kdemo = "end",
    fade_out = 2
  },
  {
    label = "BM09",
    phase = "sm02_01600k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM02",
    variable = "CM02B_trans_1",
    phase = "sm02_01600k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm03_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.sm03_b = {
  {label = "BM06", phase = "start"}
}
L0_0.sm03_c = {
  {label = "BM06", phase = "start"},
  {
    label = "BM07",
    phase = "sm03_02012",
    sdemo = "start",
    fade_in = 1,
    fade_out = 1
  }
}
L0_0.sm03_d = {
  {
    label = "BM06",
    phase = "start",
    fade_out = 2
  },
  {
    label = "BM07",
    phase = "sm03_03002",
    city_bgm = false
  },
  {
    label = "CM17",
    phase = "sm03_01400k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "sm03_01600k",
    kdemo = "start",
    fade_out = 1,
    city_bgm = true
  }
}
L0_0.sm04 = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.sm05_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.sm05_b = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "sm05_01001",
    fade_out = 1
  }
}
L0_0.sm05_c = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "timerstart",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "sm05_00400k",
    func = up_onEnter,
    fade_out = 1
  }
}
L0_0.sm06_a = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm06_b = {
  {
    label = "CM15",
    phase = "sm06_00950k",
    kdemo = "end"
  },
  {
    label = "",
    phase = "sm06_01000k",
    kdemo = "end",
    fade_out = 2
  },
  {
    label = "BM06",
    phase = "sm06_01050k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "sm06_01200k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "",
    phase = "sm06_01200k",
    kdemo = "end",
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm07_a = {
  {
    label = "CM03",
    phase = "start",
    func = lo_onEnter,
    city_bgm = true
  }
}
L0_0.sm07_b = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1,
    city_bgm = false
  }
}
L0_0.sm07_c = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm07_com_a = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm07_d = {
  {
    label = "CM17",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm07_e = {
  {
    label = "BM09",
    func = lo_onEnter,
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM03",
    phase = "sm07_00400k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm08_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm08_00300k",
    sdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM17",
    phase = "sm08_00300k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm08_b = {
  {
    label = "CM17",
    phase = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm08_00600k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "sm08_00700k",
    kdemo = "end",
    fade_out = 1,
    city_bgm = false
  }
}
L0_0.sm08_c = {
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "start",
    city_bgm = false
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_End",
    phase = "sm08_00900k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM13B",
    phase = "sdemo2",
    sdemo = 2,
    city_bgm = false
  }
}
L0_0.sm08_d = {
  {
    label = "CM13B",
    phase = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm08_01150k",
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm08_01200k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM04",
    phase = "sdemo2",
    sdemo = 3,
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm09_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "BM07",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "CM20",
    phase = "eventpoint",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm09_b = {
  {
    label = "CM20",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm09_c = {
  {
    label = "",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM16",
    phase = "sm09_00300k",
    kdemo = "end",
    city_bgm = false
  }
}
L0_0.sm09_d = {
  {
    label = "CM16",
    phase = "sm09_00310k",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm09_00420k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm09_00510k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM06",
    func = po_onEnter,
    phase = "sm09_00510k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm10 = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "race_preparation",
    fade_out = 0.5,
    city_bgm = false
  },
  {
    label = "CM14A",
    variable = "CM14A_trans_1",
    phase = "race_start"
  },
  {
    label = "CM14A",
    variable = "CM14B_trans_2",
    phase = "race_climax",
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "",
    phase = "race_end",
    city_bgm = true
  }
}
L0_0.sm11_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.sm11_b = {
  {
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.sm12_a = {
  {
    label = "CM03",
    phase = "start",
    func = lo_onEnter,
    city_bgm = true
  },
  {
    phase = "sm12_00400k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sdemo1",
    sdemo = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm12_00500k",
    fade_out = 1,
    city_bgm = false
  }
}
L0_0.sm12_b = {
  {
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm12_00700k",
    kdemo = "end",
    fade_out = 7.8,
    city_bgm = true
  },
  {
    label = "CM17",
    phase = "sm12_01011",
    city_bgm = false
  }
}
L0_0.sm12_c = {
  {
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 5,
    city_bgm = false
  },
  {
    label = "CM17",
    phase = "sm12_01200k",
    kdemo = "end",
    city_bgm = false
  }
}
L0_0.sm12_d = {
  {
    label = "CM17",
    phase = "start",
    func = po_onEnter,
    city_bgm = false
  },
  {
    label = "BM08",
    phase = "sm12_01400k",
    kdemo = "end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm12_01500k",
    kdemo = "start",
    fade_out = 2.5,
    city_bgm = false
  },
  {
    label = "BM06",
    func = po_onEnter,
    phase = "sm12_01600k",
    kdemo = "start",
    city_bgm = true
  }
}
L0_0.sm13 = {
  {
    label = "CM03",
    phase = "start",
    func = lo_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "race_pri",
    fade_out = 0.5,
    city_bgm = false
  },
  {
    label = "CM14A",
    variable = "CM14A_trans_1",
    phase = "race_start"
  },
  {
    label = "CM14A",
    variable = "CM14B_trans_2",
    phase = "race_climax",
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "",
    phase = "race_end",
    city_bgm = true
  }
}
L0_0.sm14_a = {
  {label = "BM06", phase = "start"},
  {label = "", phase = "end"}
}
L0_0.sm14_b = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.sm14_c = {
  {
    label = "CM06",
    variable = "CM06_trans_2",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.sm14_c2 = {
  {
    label = "CM06",
    variable = "CM06_trans_2",
    phase = "start",
    func = amb_pi_01_onEnter
  }
}
L0_0.sm14_d = {
  {
    label = "CM06",
    variable = "CM06_trans_3",
    phase = "start",
    func = amb_pi_01_onEnter
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm14_00600k",
    kdemo = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm14_03015"
  },
  {
    label = "CM06",
    variable = "CM06_trans_4",
    phase = "sm14_00700k",
    kdemo = "end"
  }
}
L0_0.sm14_e = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    fade_out = 1.5,
    city_bgm = true
  }
}
L0_0.sm15_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  }
}
L0_0.sm15_b = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  },
  {
    label = "BM07",
    phase = "sdemo2",
    sdemo = 5,
    city_bgm = false
  }
}
L0_0.sm15_c = {
  {
    label = "BM07",
    phase = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm15_02019",
    fade_out = 5,
    city_bgm = false
  },
  {
    label = "AM07_3",
    phase = "sm15_a_c01",
    pdemo = "start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm15_01100k",
    kdemo = "start",
    city_bgm = false
  }
}
L0_0.sm15_d = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm15_03002",
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm15_01200k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "sm15_01200k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm16_a = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  }
}
L0_0.sm16_a2 = {
  {
    label = "CM04",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm16_b = {
  {
    label = "CM03",
    phase = "start",
    city_bgm = true
  },
  {
    label = "CM19",
    phase = "sm16_00420k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm16_01023",
    fade_out = 5,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "sm16_01025",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm16_00600k",
    kdemo = "end",
    fade_out = 4,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm16_00700k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm16_00700k",
    kdemo = "end",
    func = up_onEnter,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM04",
    phase = "sm16_00800k",
    kdemo = "start",
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.sm17_a = {
  {
    label = "CM03",
    phase = "start",
    func = lo_onEnter,
    city_bgm = true
  }
}
L0_0.sm17_b = {
  {
    label = "CM04",
    phase = "start",
    city_bgm = true
  },
  {
    label = "BM07",
    phase = "sdemo1",
    sdemo = 1,
    city_bgm = false
  }
}
L0_0.sm17_c = {
  {
    label = "CM13A",
    variable = "CM13A_trans_1",
    phase = "start",
    city_bgm = false
  },
  {
    label = "CM13A",
    variable = "CM13A_trans_End",
    phase = "sm17_00800k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM20",
    phase = "sm17_00800k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm17_01100k = {
  {
    label = "",
    phase = "sm17_01100k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "sm17_01100k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm18_a = {
  {
    label = "BM06",
    phase = "start",
    func = po_onEnter,
    city_bgm = true
  },
  {
    label = "CM19",
    phase = "sm18_00110k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm18_00107",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm18_00200k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm18_b = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31B_trans_1",
    phase = "sm18_00220k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm18_00300k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm18_c = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31C_trans_1",
    phase = "sm18_00310k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm18_09020",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm18_00320k = {
  {
    label = "",
    phase = "sm18_00320k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "sm18_00320k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm19_a = {
  {
    label = "BM07",
    phase = "start",
    func = lo_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm19_00100k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm19_02008",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm19_b = {
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "start",
    func = lo_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "sm19_00130k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_4",
    phase = "sm19_00350k",
    kdemo = "end",
    city_bgm = false
  }
}
L0_0.sm19_c = {
  {
    label = "AM04A",
    variable = "AM04A_trans_4",
    phase = "start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    phase = "sm19_09006",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm19_02008",
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm19_00400k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM03",
    phase = "sm19_00400k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm20_a = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm20_00100k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "AM03",
    phase = "sdemo1",
    sdemo = 2,
    city_bgm = false
  }
}
L0_0.sm20_b = {
  {
    label = "AM03",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm20_c = {
  {
    label = "AM03",
    phase = "start",
    city_bgm = false
  },
  {
    label = "CM04",
    phase = "sm20_00700k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm21_a = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  },
  {
    label = "CM17",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm21_00400k",
    kdemo = "start",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM04",
    phase = "sm21_00400k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm21_a2 = {
  {
    label = "CM04",
    phase = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "CM17",
    phase = "sdemo3",
    sdemo = 6,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm21_00900k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false0
  }
}
L0_0.sm21_b = {
  {
    label = "CM19",
    phase = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm22_01100k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm21_c = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm21_01300k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM04",
    phase = "sm21_01400k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.sm22_a = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  },
  {
    label = "BM07",
    phase = "sm22_00100k",
    kdemo = "end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM08",
    phase = "sm22_00200k",
    kdemo = "end",
    fade_out = 1,
    city_bgm = false,
    delay = 1
  }
}
L0_0.sm22_b = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm22_c = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter,
    city_bgm = false
  }
}
L0_0.sm22_d = {
  {
    label = "BM08",
    phase = "start",
    func = up_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM39",
    phase = "sm22_00700k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm22_00800k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.sm22_01000k = {
  {
    label = "",
    phase = "sm22_01000k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM04",
    phase = "sm22_01000k",
    kdemo = "end",
    city_bgm = true
  }
}
L0_0.sm23 = {
  {
    label = "CM04",
    phase = "start",
    func = up_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "race_pri",
    fade_out = 0.5,
    city_bgm = false
  },
  {
    label = "CM14A",
    variable = "CM14A_trans_1",
    phase = "race_start"
  },
  {
    label = "CM14A",
    variable = "CM14B_trans_2",
    phase = "race_climax",
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "",
    phase = "race_end",
    fade_out = 2
  },
  {
    label = "CM04",
    phase = "sm23_00200k",
    kdemo = "start",
    fade_out = 2,
    delay = 1.5,
    city_bgm = true
  }
}
L0_0.sm24_a = {
  {
    label = "BM09",
    phase = "start",
    func = ed_onEnter,
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM16",
    phase = "sdemo1",
    sdemo = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm24_00200k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm24_b = {
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm24_00200k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm24_00300k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM16",
    phase = "sm24_01016",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm24_c = {
  {
    label = "CM16",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm24_c2 = {
  {
    label = "CM16",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm24_02018",
    fade_out = 6,
    city_bgm = false
  },
  {
    label = "AM07_1",
    phase = "sm24_02028",
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "sm24_00800k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm24_00900k = {
  {
    label = "",
    phase = "sm24_00900k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "sm24_00900k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm26 = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm26_00110k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04B",
    variable = "AM04B_trans_2",
    phase = "eventstart",
    city_bgm = false
  },
  {
    label = "AM04B",
    variable = "AM04B_trans_End",
    phase = "eventend",
    city_bgm = false
  },
  {
    label = "CM12",
    phase = "sm26_00192k",
    kdemo = "start",
    fade_out = 2,
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.sm27_a = {
  {
    label = "CM11",
    phase = "start",
    func = id_onEnter,
    city_bgm = true
  }
}
L0_0.sm27_b = {
  {
    label = "CM11",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm28_a = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  }
}
L0_0.sm28_b = {
  {
    label = "",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm28_c = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  }
}
L0_0.sm28_d = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm28_03015",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm28_00430k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM07",
    phase = "sm28_00430k",
    kdemo = "end",
    fade_in = 2,
    city_bgm = false
  }
}
L0_0.sm28_d2 = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  }
}
L0_0.sm28_e = {
  {
    label = "CM07",
    phase = "start",
    func = amb_pi_01_onEnter,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm28_04003",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm28_00520k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM07",
    phase = "sm28_00520k",
    kdemo = "end",
    fade_in = 2,
    city_bgm = false
  }
}
L0_0.sm28_f = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    fade_in = 2.5,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm29_a = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "sm29_00200k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "sm29_00200k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 1.5,
    city_bgm = true
  }
}
L0_0.sm29_b = {
  {
    label = "CM09",
    phase = "start",
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "sm29_00300k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "sm29_00300k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 1.5,
    city_bgm = true
  }
}
L0_0.sm29_c = {
  {
    label = "CM09",
    phase = "start",
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "sm29_00500k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm29_00600k",
    kdemo = "end",
    fade_out = 7,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "sdemo2",
    sdemo = 3,
    delay = 5,
    city_bgm = true
  }
}
L0_0.sm30_2a = {
  {
    label = "CM09",
    phase = "start",
    func = cc_onEnter,
    city_bgm = true
  }
}
L0_0.sm30_a = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  }
}
L0_0.sm30_a2 = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_00300k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "cut1_start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm30_00500k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_00500k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "cut1_end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm30_00400k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  }
}
L0_0.sm30_a3 = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_00600k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "cut2_start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm30_00800k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_00800k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "cut2_end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm30_00700k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  }
}
L0_0.sm30_a4 = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_00900k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "cut3_start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm30_01100k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_01100k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "cut3_end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm30_01000k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  }
}
L0_0.sm30_a5 = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_01200k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "cut4_start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm30_01400k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_01400k",
    kdemo = "end",
    fade_out = 1.5,
    delay = 4,
    city_bgm = false
  },
  {
    label = "",
    phase = "cut4_end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm30_01300k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  }
}
L0_0.sm30_b = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "pristart",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "cut5_start",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "cut5_restart",
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm30_01700k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm30_01700k",
    kdemo = "end",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "",
    phase = "cut5_end",
    fade_out = 1,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm30_01600k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "sm30_01800k",
    kdemo = "start",
    fade_out = 1.5,
    city_bgm = true
  }
}
L0_0.sm31_a = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  },
  {
    label = "CM19",
    phase = "kit08_cow_00_end",
    fade_out = 1.5,
    delay = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "eventpri",
    fade_out = 1
  },
  {
    label = "BM10",
    phase = "eventstart",
    fade_out = 1
  }
}
L0_0.sm31_b = {
  {
    label = "",
    phase = "eventpri",
    fade_out = 1
  },
  {
    label = "CM19",
    phase = "start",
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "eventstart",
    fade_out = 1
  }
}
L0_0.sm31_c = {
  {
    label = "",
    phase = "start",
    fade_out = 3.5
  },
  {
    label = "BM09",
    phase = "sm31_00550k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "BM07",
    phase = "sm31_00550k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm31_00700k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm31_b_c01",
    pdemo = "start",
    city_bgm = false
  },
  {
    label = "CM12",
    phase = "sdemo2",
    sdemo = 3,
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.sm31_00900k = {
  {
    label = "",
    phase = "sm31_00900k",
    kdemo = "start",
    fade_out = 3
  },
  {
    label = "CM12",
    phase = "sm31_00900k",
    kdemo = "end",
    fade_out = 3
  }
}
L0_0.sm32_a = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  },
  {
    label = "CM15",
    phase = "kit06_waitress_00",
    pdemo = "end",
    fade_out = 2,
    delay = 10.5
  },
  {
    label = "",
    phase = "sm32_00100k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "sm32_00101k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm32_b = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm32_00210k",
    kdemo = "end",
    delay = 4,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm32_00220k",
    kdemo = "start",
    delay = 4,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31B_trans_1",
    phase = "sm32_00220k",
    kdemo = "end",
    delay = 4,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm32_00230k",
    kdemo = "start",
    delay = 4,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31C_trans_1",
    phase = "sm32_00230k",
    kdemo = "end",
    delay = 4,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm32_00300k",
    kdemo = "start",
    delay = 4,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm32_c = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm32_c2 = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm32_00402k = {
  {
    label = "",
    phase = "sm32_00402k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm33_a = {
  {
    label = "CM10",
    phase = "start",
    func = ed_onEnter,
    city_bgm = true
  },
  {
    label = "BM09",
    phase = "sm33_00500k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "sm33_00500k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm33_b = {
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "start",
    func = ed_onEnter,
    city_bgm = true
  },
  {
    label = "CM10",
    variable = "CM10_trans_School",
    phase = "sdemo3",
    sdemo = 7,
    func = ed_onEnter,
    city_bgm = false
  }
}
L0_0.sm33_c = {
  {
    label = "CM10",
    variable = "CM10_trans_School",
    phase = "start",
    func = ed_onEnter,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm33_02004",
    fade_out = 4
  },
  {
    label = "CM16",
    phase = "sm33_02005",
    fade_in = 2,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm33_c2 = {
  {
    label = "",
    phase = "start",
    func = ed_onEnter,
    fade_out = 2.5,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm33_01200k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm33_01250k",
    kdemo = "end",
    fade_out = 2.5,
    city_bgm = true
  }
}
L0_0.sm34 = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  },
  {
    label = "",
    phase = "beforecount",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "eventstart"
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "eventend"
  },
  {
    label = "BM09",
    phase = "end_point1",
    fade_in = 2,
    fade_out = 2
  },
  {
    label = "CM12",
    phase = "end_point2",
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.sm35 = {
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "start",
    city_bgm = true
  },
  {
    label = "CM19",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "beforecount",
    fade_out = 2
  },
  {
    label = "CM31",
    variable = "CM31B_trans_1",
    phase = "eventstart"
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sdemo2",
    sdemo = 3,
    fade_out = 3.5
  },
  {
    label = "CM10",
    variable = "CM10_trans_Town",
    phase = "sm35_00200k",
    kdemo = "end",
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.sm36_a = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm36_00100k",
    kdemo = "end",
    fade_out = 4
  },
  {
    label = "CM19",
    phase = "sm36_00200k",
    kdemo = "start"
  }
}
L0_0.sm36_b = {
  {
    label = "CM19",
    phase = "start",
    func = dt_onEnter,
    city_bgm = false
  }
}
L0_0.sm36_c = {
  {
    label = "CM17",
    phase = "start",
    func = dt_onEnter,
    fade_out = 2,
    delay = 3,
    city_bgm = false
  },
  {
    label = "AM07_2",
    phase = "sdemo2",
    sdemo = 2,
    fade_out = 2,
    delay = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm36_01400k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm36_d = {
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "start",
    func = dt_onEnter,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm36_03004",
    city_bgm = false
  },
  {
    label = "BM07",
    phase = "sm36_01600k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm36_01700k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = true
  },
  {
    label = "CM12",
    phase = "sm36_01800k",
    kdemo = "start",
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.sm36_02000k = {
  {
    label = "",
    phase = "sm36_02000k",
    kdemo = "start",
    city_bgm = true,
    fade_out = 2
  },
  {
    label = "CM12",
    phase = "sm36_02000k",
    kdemo = "end",
    delay = 3,
    city_bgm = true,
    fade_out = 2
  }
}
L0_0.sm38_a = {
  {
    label = "CM09",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm38_b = {
  {phase = "start", city_bgm = true}
}
L0_0.sm38_c = {
  {phase = "start", city_bgm = true}
}
L0_0.sm38_d = {
  {phase = "start", city_bgm = true}
}
L0_0.sm39_a = {
  {
    label = "CM11",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm39_b = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "countdown",
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm39_01004",
    fade_out = 1.5
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "battle_end"
  },
  {
    label = "",
    phase = "sm39_00500k",
    kdemo = "end",
    fade_out = 1.5
  }
}
L0_0.sm39_c = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm39_02000",
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31B_trans_1",
    phase = "sm39_02003",
    fade_out = 1.5
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "battle_end"
  },
  {
    label = "CM31",
    variable = "CM31B_trans_1",
    phase = "sm39_02004",
    fade_out = 1.5
  }
}
L0_0.sm39_c2 = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm39_02001",
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31C_trans_1",
    phase = "sm39_02014",
    fade_out = 1.5
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm39_01100k",
    kdemo = "start"
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "battle_end"
  }
}
L0_0.sm39_d = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  },
  {
    label = "AM07_3",
    phase = "sdemo1",
    sdemo = 2,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm39_03007",
    fade_out = 1.5
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "sm39_03010"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end"
  },
  {
    label = "BM09",
    phase = "sm39_01600k",
    kdemo = "start",
    fade_in = 1,
    fade_out = 2,
    delay = 3.5
  },
  {
    label = "",
    phase = "sm39_01600k",
    kdemo = "end",
    fade_out = 2
  },
  {
    label = "CM11",
    phase = "sm39_01700k",
    kdemo = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm40_a = {
  {
    label = "BM09",
    phase = "start",
    fade_out = 2
  },
  {
    label = "CM10",
    phase = "sm40_00100k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm40_00108",
    fade_out = 2,
    delay = 2
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm40_00110"
  }
}
L0_0.sm40_b = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm40_c = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  },
  {
    label = "",
    phase = "sm40_02021",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm40_01300k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm40_01300k",
    kdemo = "end",
    city_bgm = true
  }
}
L0_0.sm41_a = {
  {
    label = "CM11",
    phase = "start",
    city_bgm = true
  },
  {
    label = "CM17",
    phase = "sm41_00300k",
    kdemo = "end",
    fade_out = 2
  },
  {
    label = "AM07_1",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 2
  }
}
L0_0.sm41_b = {
  {
    label = "AM07_1",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 2
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sdemo1",
    sdemo = 3,
    fade_out = 2,
    delay = 2
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm41_00600k",
    kdemo = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "sm41_00600k",
    kdemo = "end"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "sm41_01010"
  }
}
L0_0.sm41_c = {
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end"
  },
  {
    label = "CM11",
    phase = "sm41_00800k",
    kdemo = "start",
    fade_in = 1,
    fade_out = 2,
    delay = 2,
    city_bgm = true
  }
}
L0_0.sm42_a = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm42_b = {
  {phase = "start", city_bgm = true}
}
L0_0.sm42_b2 = {
  {
    phase = "start",
    func = lo_onEnter,
    city_bgm = true
  },
  {
    phase = "sm42_00400k",
    kdemo = "start",
    func = Revset_eaves_large,
    city_bgm = true
  },
  {
    phase = "sm42_00400k",
    kdemo = "end",
    func = variable_amb007_set_0_OnEnter,
    city_bgm = true
  }
}
L0_0.sm42_c = {
  {phase = "start", city_bgm = true}
}
L0_0.sm43_a = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "sm43_00200k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31A_trans_1",
    phase = "sm43_00109",
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sm43_00113",
    city_bgm = false
  }
}
L0_0.sm43_b = {
  {
    label = "",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM14A",
    variable = "CM14B_trans_1",
    phase = "sm43_01001",
    city_bgm = false
  },
  {
    label = "",
    phase = "sm43_01002",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM39",
    phase = "sm43_00400k",
    kdemo = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "sm43_00400k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm44_a = {
  {
    label = "CM10",
    phase = "start",
    city_bgm = true
  },
  {
    label = "CM19",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "chase_start",
    delay = 2,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "chase_reset",
    fade_out = 2
  },
  {
    label = "",
    phase = "chase_end",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.sm44_b = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "chase_start",
    delay = 2,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "chase_reset",
    fade_out = 2
  },
  {
    label = "",
    phase = "chase_end",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.sm44_c = {
  {
    label = "CM19",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM10",
    phase = "chase_start",
    delay = 2,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "chase_reset",
    fade_out = 2
  },
  {
    label = "",
    phase = "chase_end",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.sm44_c2 = {
  {
    label = "",
    phase = "start",
    fade_out = 2
  },
  {
    label = "CM17",
    phase = "chase_start"
  },
  {
    label = "",
    phase = "sm44_b_c01",
    pdemo = "start"
  },
  {
    label = "",
    phase = "chase_reset",
    fade_out = 2
  },
  {
    label = "BM09",
    phase = "sm44_00700k",
    kdemo = "start"
  },
  {
    label = "",
    phase = "sm44_00700k",
    kdemo = "end",
    city_bgm = true
  },
  {
    label = "CM10",
    phase = "mission_end",
    dalay = 4,
    city_bgm = true
  }
}
L0_0.sm45 = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  },
  {
    label = "CM19",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "info",
    city_bgm = false
  },
  {
    label = "",
    phase = "beforecount",
    fade_out = 1
  },
  {
    label = "",
    phase = "chase_reset",
    fade_out = 2
  },
  {
    label = "CM31",
    phase = "eventstart",
    city_bgm = false
  },
  {
    label = "CM31",
    variable = "CM31_trans_End",
    phase = "sdemo2",
    sdemo = 3,
    city_bgm = false
  },
  {
    label = "BM09",
    phase = "sm45_00200k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM12",
    phase = "sm45_00300k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm46_a = {
  {
    label = "BM09",
    phase = "start",
    fade_out = 2,
    delay = 1
  },
  {
    label = "CM10",
    phase = "sm46_00100k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm46_b = {
  {
    label = "CM09",
    phase = "start",
    city_bgm = true
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm46_00900k",
    kdemo = "end",
    fade_out = 2
  }
}
L0_0.sm46_c = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end"
  },
  {
    label = "CM09",
    phase = "sm46_01200k",
    kdemo = "start",
    city_bgm = true
  }
}
L0_0.sm46_c2 = {
  {
    label = "CM09",
    phase = "start",
    fade_out = 3,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm46_02014",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.sm46_d = {
  {
    label = "",
    phase = "start",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM09",
    phase = "sm46_a_c01",
    pdemo = "end",
    fade_in = 2,
    delay = 6,
    city_bgm = true
  },
  {
    label = "CM09",
    phase = "sm46_01800k",
    kdemo = "start",
    fade_in = 2,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm46_02000k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false,
    delay = 1
  },
  {
    label = "BM09",
    phase = "sm46_02100k",
    kdemo = "start"
  },
  {
    label = "CM10",
    phase = "sm46_02100k",
    kdemo = "end",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm47_a = {
  {
    label = "CM04",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm47_b = {
  {
    label = "CM04",
    phase = "start",
    city_bgm = true
  },
  {
    label = "CM04",
    phase = "info",
    city_bgm = true
  },
  {
    label = "",
    phase = "beforecount",
    fade_out = 1
  },
  {
    label = "",
    phase = "fail",
    fade_out = 1
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "eventstart"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "eventend"
  }
}
L0_0.sm47_c = {
  {
    label = "CM04",
    phase = "start",
    fade_in = 2,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "BM06",
    phase = "sdemo4",
    sdemo = 5,
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm48_a = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  },
  {
    label = "",
    phase = "sm48_00100k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm48_b = {
  {
    label = "",
    phase = "start",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm48_c = {
  {
    label = "CM06",
    variable = "CM06_trans_1",
    phase = "start",
    func = amb_pi_01_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm48_d = {
  {
    label = "CM06",
    variable = "CM06_trans_2",
    phase = "start",
    func = amb_pi_01_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm48_e = {
  {
    label = "CM06",
    variable = "CM06_trans_3",
    phase = "start",
    func = amb_pi_01_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM07",
    phase = "sm48_00505k",
    kdemo = "end",
    func = amb_pi_01_onEnter,
    fade_in = 2,
    fade_out = 1.5,
    city_bgm = false
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_1",
    phase = "sdemo3",
    sdemo = 4,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM05B",
    variable = "AM05B_trans_End2",
    phase = "sm48_00530k",
    kdemo = "start",
    city_bgm = false
  },
  {
    label = "CM06",
    variable = "CM06_trans_4",
    phase = "start",
    phase = "sm48_00530k",
    kdemo = "end",
    fade_in = 2,
    city_bgm = false
  }
}
L0_0.sm48_f = {
  {
    label = "CM12",
    phase = "start",
    func = dt_onEnter,
    city_bgm = true
  }
}
L0_0.sm49_a = {
  {
    label = "CM03",
    phase = "start",
    func = lo_onEnter,
    city_bgm = true
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "sm49_00100k",
    kdemo = "end",
    fade_out = 2,
    delay = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm49_00124",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "CM03",
    phase = "sm49_00230k",
    kdemo = "start",
    fade_in = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "sm49_00230k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm49_b = {
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "start",
    func = lo_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm49_01027",
    city_bgm = false
  },
  {
    label = "CM03",
    phase = "sm49_00300k",
    kdemo = "start",
    fade_in = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_4",
    phase = "sm49_00300k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    phase = "sm49_00400k",
    kdemo = "end",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.sm49_c = {
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    phase = "start",
    func = lo_onEnter,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "sm49_02017",
    city_bgm = false
  },
  {
    label = "CM03",
    phase = "sm49_00500k",
    kdemo = "start",
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.sm50_a = {
  {
    label = "CM12",
    phase = "start",
    city_bgm = true
  },
  {
    label = "",
    phase = "sm50_00110k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  },
  {
    label = "CM19",
    phase = "sm50_00120k",
    kdemo = "start",
    fade_out = 2,
    fade_in = 2,
    city_bgm = false
  }
}
L0_0.sm50_b = {
  {
    label = "CM19",
    phase = "start",
    city_bgm = false
  }
}
L0_0.sm50_c = {
  {
    label = "",
    phase = "start",
    city_bgm = false
  },
  {
    label = "CM12",
    phase = "sm50_00710k",
    kdemo = "start",
    fade_out = 2,
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.sm51_a = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm51_a2 = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm51_b = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  },
  {
    label = "BM10",
    phase = "sm51_00300k",
    kdemo = "start",
    fade_out = 2
  },
  {
    label = "BM06",
    phase = "sm51_00400k",
    kdemo = "start",
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  }
}
L0_0.sm51_b2 = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm51_b3 = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  }
}
L0_0.sm51_c = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  },
  {
    label = "BM10",
    phase = "sdemo0",
    sdemo = 2,
    fade_out = 2,
    delay = 0.7
  },
  {
    label = "BM06",
    phase = "sm51_00800k",
    kdemo = "start",
    fade_in = 3,
    fade_out = 2,
    city_bgm = true
  },
  {
    label = "",
    phase = "sm51_02007",
    fade_out = 2
  },
  {
    label = "BM10",
    phase = "sdemo3",
    sdemo = 7,
    fade_out = 2
  }
}
L0_0.sm51_00820k = {
  {
    label = "",
    phase = "sm51_00820k",
    kdemo = "start",
    fade_in = 3,
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.cm_table = {
  {
    label = "",
    phase = "challenge_pri",
    fade_out = 1
  },
  {
    label = "CM15",
    phase = "challenge_start"
  },
  {
    label = "",
    phase = "challenge_finish"
  }
}
L0_0.dm01_00100m = {
  {label = "CM45", phase = "play"}
}
L0_0.dm01_a = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "start",
    func = dt_onEnter
  }
}
L0_0.dm01_00300c = {}
L0_0.dm01_b = {
  {
    label = "CM32",
    variable = "CM32A_trans_1",
    phase = "start",
    func = dt_onEnter
  },
  {
    label = "",
    phase = "sdemo4",
    sdemo = 5,
    fade_out = 3
  },
  {
    label = "CM40",
    phase = "dm01_00310k",
    kdemo = "start",
    fade_out = 2
  },
  {
    label = "",
    phase = "dm01_00320k",
    kdemo = "end",
    fade_out = 4
  },
  {
    label = "CM12",
    phase = "dm01_01173",
    fade_in = 2,
    city_bgm = true
  }
}
L0_0.dm01_00400c = {
  {
    label = "CM12",
    phase = "play",
    city_bgm = false
  },
  {
    label = "",
    phase = 5,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "BM07",
    phase = 6,
    city_bgm = false
  },
  {
    label = "",
    phase = 12,
    fade_out = 2,
    city_bgm = false
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.dm01_00500m = {}
L0_0.dm02_00100c = {}
L0_0.dm02_a = {
  {
    label = "CM42",
    variable = "CM42A_trans_1",
    phase = "start",
    func = amb_dm_amb001_onEnter,
    city_bgm = false
  }
}
L0_0.dm02_00300m = {
  {
    label = "BM08",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm02_b = {
  {
    label = "CM42",
    variable = "CM42A_trans_1",
    phase = "start",
    func = amb_dm_amb001_onEnter,
    city_bgm = false
  }
}
L0_0.dm02_00400m = {
  {
    label = "CM40",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm02_c = {
  {
    label = "CM42",
    variable = "CM42B_trans_1",
    phase = "start",
    func = amb_dm_amb001_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.dm02_00500m = {
  {
    label = "",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm03_00100c = {}
L0_0.dm03_00200m = {
  {
    label = "",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm03_a = {
  {
    label = "CM30",
    variable = "CM30A_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_out = 2
  }
}
L0_0.dm03_b = {
  {
    label = "CM30",
    variable = "CM30B_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_out = 2
  }
}
L0_0.dm03_c = {
  {
    label = "CM30",
    variable = "CM30C_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_out = 2
  }
}
L0_0.dm03_00300c = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  }
}
L0_0.dm04_a = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_dm_amb002_onEnter,
    fade_out = 2
  }
}
L0_0.dm04_00100c = {}
L0_0.dm04_b = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_dm_amb002_onEnter,
    fade_out = 2
  }
}
L0_0.dm04_00200m = {
  {
    label = "CM41",
    variable = "CM41A_trans_1",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm04_c = {
  {
    label = "CM41",
    variable = "CM41A_trans_1",
    phase = "start",
    func = amb_dm_amb002_onEnter,
    fade_out = 2
  }
}
L0_0.dm04_d = {
  {
    label = "CM28A",
    phase = "start",
    func = amb_dm_amb002_onEnter,
    fade_in = 2,
    fade_out = 2
  }
}
L0_0.dm04_00300m = {
  {
    label = "CM41",
    variable = "CM41B_trans_1",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm04_e = {
  {
    label = "CM41",
    variable = "CM41B_trans_1",
    phase = "start",
    func = amb_dm_amb002_onEnter,
    fade_out = 2
  }
}
L0_0.dm04_00400m = {
  {
    label = "BM08",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm04_f = {
  {
    label = "BM08",
    phase = "start",
    func = amb_dm_amb002_onEnter,
    fade_out = 2
  }
}
L0_0.dm04_00500m = {
  {
    label = "",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm05_00100c = {
  {
    label = "CM09",
    phase = 2,
    fade_out = 2
  },
  {
    label = "CM09",
    phase = 6,
    fade_out = 2
  },
  {
    label = "",
    phase = 7,
    fade_out = 2
  },
  {
    label = "BM07",
    phase = 10,
    fade_out = 2
  },
  {
    label = "",
    phase = 16,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.dm05_a = {
  {
    label = "CM41",
    variable = "CM41C_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_in = 2
  }
}
L0_0.dm05_00200m = {
  {
    label = "CM41",
    variable = "CM41_trans_End",
    phase = "play",
    fade_out = 1.5
  }
}
L0_0.dm05_b = {
  {
    label = "CM32",
    variable = "CM32B_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_out = 2
  }
}
L0_0.dm05_00300m = {
  {
    label = "CM32",
    variable = "CM32B_trans_End",
    phase = "play",
    fade_out = 2
  }
}
L0_0.dm06_00100c = {
  {
    label = "BM07",
    phase = 2,
    fade_out = 2
  },
  {
    label = "BM07",
    phase = 6,
    fade_out = 2
  },
  {
    label = "",
    phase = 7,
    fade_out = 2
  },
  {
    label = "BM08",
    phase = 11,
    fade_out = 2
  },
  {
    label = "",
    phase = "cancel",
    fade_out = 2
  }
}
L0_0.dm06_a = {
  {
    label = "CM32",
    variable = "CM32B_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_out = 2
  }
}
L0_0.dm06_00200m = {
  {
    label = "",
    phase = "play",
    fade_out = 4.5
  }
}
L0_0.dm06_b = {
  {
    label = "CM43",
    variable = "CM43B_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_in = 2
  }
}
L0_0.dm06_c = {
  {
    label = "CM43",
    variable = "CM43B_trans_1",
    phase = "start",
    func = amb_dm_amb003_onEnter,
    fade_in = 2
  }
}
L0_0.dm06_00300m = {
  {
    label = "CM43",
    variable = "CM43_trans_End",
    phase = "play",
    fade_in = 2
  }
}
L0_0.dm06_d = {
  {
    label = "CM42",
    variable = "CM42B_trans_1",
    phase = "start",
    func = amb_dm_amb001_onEnter,
    fade_out = 2,
    city_bgm = false
  }
}
L0_0.dm06_00400m = {
  {
    label = "",
    phase = "play",
    fade_out = 3
  }
}
L0_0.dm06_00500c = {
  {label = "BM09", phase = 2},
  {
    label = "",
    phase = 12,
    fade_out = 3
  }
}
L0_0.dm06_re01 = {}
L0_0.dm06_00600m = {}
L0_0.ep80_a = {
  {
    label = "",
    phase = "start",
    city_bgm = false
  },
  {
    label = "AM06_1",
    phase = "sdemo1",
    sdemo = 1,
    delay = 3
  },
  {
    label = "CM39",
    phase = "eps05_00100m",
    city_bgm = false
  }
}
L0_0.ep80_b = {
  {
    label = "BM06",
    phase = "start",
    fade_in = 5,
    fade_out = 3,
    city_bgm = true
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "ep80_b_battle_start",
    city_bgm = false,
    fade_out = 2,
    delay = 0.2
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "1stbattle_end"
  }
}
L0_0.ep80_c = {
  {
    label = "BM06",
    phase = "ep80_00063",
    city_bgm = true,
    fade_out = 2,
    fade_in = 2
  },
  {
    label = "BM06",
    phase = "ep80_00040k",
    kdemo = "start",
    city_bgm = true,
    fade_out = 2,
    fade_in = 2
  }
}
L0_0.ep80_00100c = {}
L0_0.ep80_d = {
  {label = "BM06", phase = "start"},
  {
    label = "CM17",
    phase = "ep80_00110k",
    kdemo = "end",
    fade_out = 3,
    city_bgm = false
  }
}
L0_0.ep80_e = {
  {
    label = "",
    phase = "sdemo1",
    sdemo = 1,
    fade_out = 2
  },
  {
    label = "AM07_1",
    phase = "start",
    delay = 2
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "battle1",
    fade_out = 2,
    delay = 2
  }
}
L0_0.ep80_e2 = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start",
    fade_out = 2
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "sdemo1",
    fade_out = 2
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "boss2"
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_End",
    phase = "ep80_00066"
  }
}
L0_0.ep80_e3 = {
  {
    label = "AM04A",
    variable = "AM04A_trans_1",
    phase = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ep80_00030"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "box_clash",
    delay = 1
  }
}
L0_0.ep80_f = {
  {
    label = "AM04A",
    variable = "AM04A_trans_2",
    phase = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_3",
    phase = "ep80_00034"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "ep80_00038"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_4",
    phase = "ep80_00160k",
    kdemo = "end"
  }
}
L0_0.ep80_g = {
  {
    label = "AM04A",
    variable = "AM04A_trans_4",
    phase = "start"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_5",
    phase = "return_bungua"
  },
  {
    label = "AM04A",
    variable = "AM04A_trans_End",
    phase = "battle_end1"
  }
}
L0_0.ep80_h = {
  {
    label = "AM04B",
    variable = "AM04B_trans_1",
    phase = "start",
    fade_out = 2,
    delay = 1
  },
  {
    label = "AM04B",
    variable = "AM04B_trans_End",
    phase = "ep80_00041"
  }
}
L0_0.ep80_i = {
  {
    label = "AM04B",
    variable = "AM04B_trans_End",
    phase = "start"
  },
  {
    label = "AM05A",
    variable = "AM05A_trans_1",
    phase = "ep80_00180k",
    kdemo = "end",
    fade_out = 2
  }
}
L0_0.ep80_00600m = {
  {
    label = "CM46A",
    phase = "play",
    fade_out = 2
  }
}
L0_0.ep80_re02_Beginner = {
  {label = "BM09", phase = "ep80_00103"},
  {
    label = "",
    phase = "end",
    fade_out = 2
  }
}
L0_0.ep80_re02 = {
  {label = "BM09", phase = "ep80_00101"},
  {
    label = "",
    phase = "end",
    fade_out = 2
  }
}
L0_0.ep80_00700c = {
  {
    label = "",
    phase = "play",
    fade_out = 2
  }
}
L0_0.sm93_a = {
  {
    label = "BM06",
    phase = "start",
    fade_in = 5,
    fade_out = 3,
    city_bgm = true
  }
}
L0_0.sm93_b = {
  {
    label = "BM06",
    phase = "start",
    city_bgm = true
  },
  {
    label = "",
    phase = "clear_jingle",
    city_bgm = false
  },
  {
    label = "BM06",
    phase = "missionend",
    city_bgm = true,
    delay = 2,
    fade_in = 2
  }
}
bgm_list = L0_0
