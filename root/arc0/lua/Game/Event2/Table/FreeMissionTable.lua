local L1_1
L0_0 = {}
L1_1 = {}
L1_1.node = "locator2_ep03_pos"
L1_1.opt = {
  sandbox = "ep03_header"
}
L0_0.ep03 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "ep04_sis_01",
  type = "sis01",
  node = "locator2_ep04_pos",
  free_only = true
}
L1_1.opt = {
  kaiwa = "ep04_00000k"
}
L0_0.ep04 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "ep05_vogo_01",
    type = "vog01",
    node = "locator2_vogo_01",
    anim_name = "confuse_00"
  },
  {
    name = "ep05_follower01",
    type = "man50",
    node = "locator2_ep05_follower01_01",
    anim_name = "count_00"
  },
  {
    name = "ep05_follower02",
    type = "man51",
    node = "locator2_ep05_follower02_01",
    anim_name = "lookaround_02"
  }
}
L1_1.opt = {
  sandbox = "ep05_header"
}
L0_0.ep05 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "ep06_madam_01",
    type = "wom27",
    node = "locator2_madam_01",
    anim_name = "talk_cid_03"
  },
  {
    name = "ep06_cid_01",
    type = "cid01",
    node = "locator2_cid_01",
    anim_name = "talk_lady_01"
  },
  {
    name = "ep06_ve_02",
    type = "ve02",
    node = "locator2_cid_ship_01",
    use_gravity = false,
    use_fall = false
  }
}
L1_1.opt = {
  sandbox = "ep06_header",
  kaiwa = "ep06_00010k",
  caption = "ep06_00000"
}
L0_0.ep06 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "ep07_sis_01",
    type = "sis01",
    node = "locator2_ep07_sis_01"
  },
  {
    name = "ep07_gawa_01",
    type = "man34",
    node = "locator2_ep07_gawa_01"
  }
}
L1_1.opt = {
  kaiwa = "ep07_00050k",
  sandbox = "ep07_header",
  caption = "ep07_00000"
}
L0_0.ep07 = L1_1
L1_1 = {}
L1_1.node = "locator2_ep08_pos"
L1_1.opt = {
  kaiwa = "ep08_00000k",
  sandbox = "ep08_header",
  caption = "ep08_00010"
}
L0_0.ep08 = L1_1
L1_1 = {}
L1_1.node = "locator2_crow01_01"
L1_1.opt = {
  kaiwa = "ep09_00000k",
  sandbox = "ep09_header",
  caption = "ep09_00000"
}
L0_0.ep09 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "ep10_crow",
  type = "crow01",
  node = "locator2_crow01_01",
  reset = false
}
L1_1.opt = {
  kaiwa = "ep10_00000k",
  sandbox = "ep10_header",
  caption = "ep10_09019"
}
L0_0.ep10 = L1_1
L1_1 = {}
L1_1.node = "locator2_man01_01"
L1_1.opt = {
  kaiwa = "ep11_00000k",
  caption = "ep11_00000"
}
L0_0.ep11 = L1_1
L1_1 = {}
L1_1.node = "locator2_01"
L1_1.opt = {caption = "ep14_00008"}
L0_0.ep14 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "ep15_pol_01",
  type = "man31",
  node = "locator2_pol_01"
}
L1_1.opt = {
  sandbox = "ep15_header",
  kaiwa2 = "ep15_00000k",
  caption = "ep15_00001",
  pc_pos_reset = true
}
L0_0.ep15 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "ep16_Adicca",
  type = "man77",
  node = "locator2_Adicca"
}
L1_1.opt = {
  sandbox = "ep16_header",
  kaiwa2 = "ep16_00000k",
  caption = "ft16_monologue01",
  pc_pos_reset = true
}
L0_0.ep16 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "ep18_kaji",
  type = "kaj01",
  node = "locator2_kaji_01",
  free_only = true
}
L1_1.opt = {
  kaiwa = "ep18_00000k",
  sandbox = "ep18_header",
  caption = "ep18_00000"
}
L0_0.ep18 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "ep21_ele_02",
  type = "ele02",
  node = "locator2_ele02_01",
  active = false
}
L1_1.marker = {
  active = false,
  ofs = Vector(0, 0.8, 0)
}
L1_1.opt = {
  sandbox = "ep21_header",
  active = false,
  yesno = "ic_midway_01"
}
L0_0.ep21 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "miz01",
    type = "miz01",
    node = "locator2_client",
    reset = false
  },
  {
    name = "worker",
    type = "man36",
    node = "locator2_man36_01",
    disable_collision = true,
    anim_name = "sit_01",
    reset = false
  }
}
L0_0.sm01 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm02_client",
  type = "sis01",
  node = "locator2_client"
}
L0_0.sm02 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm03_client",
  type = "cid01",
  node = "locator2_client"
}
L1_1.opt = {
  sandbox = "sm03_header",
  sandbox_af = "sm03_post"
}
L0_0.sm03 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm04_client",
  type = "man37",
  node = "locator2_client"
}
L1_1.opt = {
  sandbox = "sm04_header"
}
L0_0.sm04 = L1_1
L1_1 = {}
L1_1.node = "locator2_client"
L1_1.opt = {
  sandbox = "sm05_header",
  sandbox_af = "sm05_post",
  fader = "blackout",
  pc_pos_reset = true
}
L1_1.marker = {pattern = "default"}
L0_0.sm05 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm06_client",
  type = "sis01",
  node = "locator2_client"
}
L1_1.opt = {
  sandbox_af = "sm06_footer"
}
L0_0.sm06 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm07_client",
    type = "man42",
    node = "locator2_client"
  },
  {
    name = "sm07_hundred_legs_01",
    type = "man43",
    node = "locator2_hundred_legs_01",
    color_variation = 1,
    hair_variation = 1
  },
  {
    name = "sm07_hundred_legs_02",
    type = "man44",
    node = "locator2_hundred_legs_02",
    color_variation = 0,
    hair_variation = 0
  },
  {
    name = "sm07_hundred_legs_03",
    type = "man43",
    node = "locator2_hundred_legs_03",
    color_variation = 0,
    hair_variation = 0
  },
  {
    name = "sm07_hundred_legs_04",
    type = "man44",
    node = "locator2_hundred_legs_04",
    color_variation = 1,
    hair_variation = 1
  }
}
L1_1.opt = {
  sandbox = "sm07_header"
}
L1_1.evx = {
  spawn = "sm07_e",
  name = "sm07_object",
  evarea2 = {
    "evarea2_lo_a_01"
  }
}
L0_0.sm07 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm08_client",
    type = "vog01",
    node = "locator2_client"
  },
  {
    name = "sm08_phi_01",
    type = "phi01",
    node = "locator2_phi_01"
  }
}
L1_1.opt = {
  sandbox = "sm08_header",
  sandbox_af = "sm08_post"
}
L0_0.sm08 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm09_client",
  type = "man78",
  node = "locator2_client",
  anim_name = "lookaround_03"
}
L0_0.sm09 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm10_client",
    type = "chi13",
    node = "locator2_client",
    color_variation = 0,
    hair_variation = 0,
    face_tex_name = "chi13_face_a",
    not_mob = true
  },
  {
    name = "sm10_dove",
    type = "gull01",
    node = "locator2_dove",
    use_gravity = false,
    not_mob = true
  }
}
L1_1.opt = {
  sandbox = "sm10_header",
  fader = "blackout",
  pc_pos_reset = true,
  sandbox_af = "sm10_footer"
}
L0_0.sm10 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm11_client",
  type = "wom26",
  node = "locator2_client",
  not_mob = true
}
L1_1.opt = {
  sandbox_af = "sm11_footer"
}
L0_0.sm11 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm12_client",
  type = "wom23",
  node = "locator2_client",
  not_mob = true
}
L1_1.opt = {
  sandbox = "sm12_header",
  sandbox_af = "sm12_footer",
  fader = "blackout",
  pc_pos_reset = true
}
L0_0.sm12 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm13_client",
    type = "chi13",
    node = "locator2_client",
    color_variation = 1,
    hair_variation = 0,
    face_tex_name = "chi13_face_b",
    not_mob = true
  },
  {
    name = "sm13_bird_sdemo",
    type = "gull01",
    node = "locator2_bird_sdemo",
    use_gravity = false,
    not_mob = true
  }
}
L1_1.opt = {
  sandbox = "sm13_header",
  sandbox_af = "sm13_post",
  fader = "blackout",
  pc_pos_reset = true
}
L0_0.sm13 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "miz01",
    type = "miz01",
    node = "locator2_client",
    notCreateSandbox = {"sm14_b"},
    reset = false
  },
  {
    name = "worker",
    type = "man36",
    node = "locator2_man36_01",
    disable_collision = true,
    anim_name = "sit_01",
    reset = false
  }
}
L0_0.sm14 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm15_client",
  type = "wom23",
  node = "locator2_client",
  not_mob = true
}
L1_1.opt = {
  sandbox = "sm15_header",
  sandbox_af = "sm15_post"
}
L0_0.sm15 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm16_client",
  type = "man78",
  node = "locator2_client",
  anim_name = "lookaround_03"
}
L0_0.sm16 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm17_client",
  type = "man63",
  node = "locator2_client"
}
L1_1.opt = {
  sandbox = "sm17_header"
}
L1_1.marker = {pattern = "B"}
L0_0.sm17 = L1_1
L1_1 = {}
L1_1.chara = {
  name = "sm18_client",
  type = "man40",
  node = "locator2_client",
  anim_name = "trouble_00"
}
L0_0.sm18 = L1_1
L1_1 = {}
L1_1.node = "locator2_client"
L1_1.opt = {
  sandbox_af = "sm19_footer"
}
L0_0.sm19 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm20_client",
    type = "wom29",
    node = "locator2_client",
    anim_name = "stay_03",
    not_mob = true
  },
  {
    name = "sm20_dog_01",
    type = "dog02",
    node = "locator2_dog_01",
    anim_name = "rest_00",
    not_mob = true
  }
}
L1_1.opt = {sandbox_af = "sm20_post"}
L0_0.sm20 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm21_client",
    type = "man48",
    node = "locator2_client",
    not_mob = true
  },
  {
    name = "sm21_guid",
    type = "man41",
    node = "locator2_sm21_guid"
  }
}
L1_1.opt = {
  sandbox = "sm21_header",
  sandbox_af = "sm21_footer"
}
L0_0.sm21 = L1_1
L1_1 = {}
L1_1.node = "locator2_client"
L0_0.sm22 = L1_1
L1_1 = {}
L1_1.chara = {
  {
    name = "sm23_client",
    type = "chi13",
    node = "locator2_client",
    color_variation = 3,
    hair_variation = 0,
    face_tex_name = "chi13_face_d",
    not_mob = true
  },
  {
    name = "sm23_second_son",
    type = "chi13",
    node = "locator2_second_son",
    color_variation = 1,
    hair_variation = 0,
    face_tex_name = "chi13_face_b",
    not_mob = true
  },
  {
    name = "sm23_third_son",
    type = "chi13",
    node = "locator2_third_son",
    color_variation = 0,
    hair_variation = 0,
    face_tex_name = "chi13_face_a",
    not_mob = true
  },
  {
    name = "sm23_bird_sdemo",
    type = "gull01",
    node = "locator2_bird_sdemo",
    not_mob = true,
    use_gravity = false
  },
  {
    name = "sm23_second_son_bird",
    type = "gull01",
    node = "locator2_second_son_bird",
    not_mob = true,
    use_gravity = false
  },
  {
    name = "sm23_third_son_bird",
    type = "gull01",
    node = "locator2_third_son_bird",
    not_mob = true,
    use_gravity = false
  }
}
L1_1.opt = {
  sandbox = "sm23_header",
  sandbox_af = "sm23_post",
  fader = "blackout",
  pc_pos_reset = true
}
L0_0.sm23 = L1_1
L1_1 = "sm24"
L0_0[L1_1] = {
  node = "locator2_sm24_pos"
}
L1_1 = "sm26"
L0_0[L1_1] = {
  chara = {
    name = "sm26_client",
    type = "man64",
    node = "locator2_client",
    not_mob = true
  },
  opt = {
    sandbox_af = "sm26_footer"
  }
}
L1_1 = "sm27"
L0_0[L1_1] = {
  chara = {
    name = "sm27_client",
    type = "man26",
    node = "locator2_client",
    not_mob = true
  },
  opt = {
    sandbox = "sm27_header",
    sandbox_af = "sm27_footer"
  }
}
L1_1 = "sm28"
L0_0[L1_1] = {
  chara = {
    {
      name = "man73",
      type = "man73",
      node = "locator2_client",
      reset = false,
      not_mob = true
    }
  }
}
L1_1 = "sm29"
L0_0[L1_1] = {
  chara = {
    name = "sm29_client",
    type = "kid01",
    node = "locator2_client"
  }
}
L1_1 = "sm30"
L0_0[L1_1] = {
  chara = {
    name = "sm30_client",
    type = "man74",
    node = "locator2_client",
    anim_name = "idle_00",
    not_mob = true
  },
  opt = {sandbox_af = "sm30_post"}
}
L1_1 = "sm31"
L0_0[L1_1] = {
  chara = {
    {
      name = "sm31_client",
      type = "auj01",
      node = "locator2_client",
      anim_name = "talk_03"
    },
    {
      name = "sm31_yuji",
      type = "eug01",
      node = "locator2_yuji_start_pos",
      anim_name = "talk_00"
    }
  },
  opt = {
    sandbox = "sm31_header"
  }
}
L1_1 = "sm32"
L0_0[L1_1] = {
  chara = {
    name = "sm32_client",
    type = "kaj01",
    node = "locator2_client"
  }
}
L1_1 = "sm33"
L0_0[L1_1] = {
  chara = {
    name = "sm33_client",
    type = "new01",
    node = "locator2_client",
    anim_name = "stay_02"
  }
}
L1_1 = "sm34"
L0_0[L1_1] = {
  chara = {
    name = "sm34_client",
    type = "man64",
    node = "locator2_client",
    not_mob = true
  },
  opt = {
    sandbox_af = "sm34_footer"
  }
}
L1_1 = "sm35"
L0_0[L1_1] = {
  chara = {
    name = "sm35_client",
    type = "man74",
    node = "locator2_client",
    anim_name = "idle_00"
  }
}
L1_1 = "sm36"
L0_0[L1_1] = {
  chara = {
    name = "sm36_client",
    type = "kaj01",
    node = "locator2_client"
  }
}
L1_1 = "sm38"
L0_0[L1_1] = {
  chara = {
    name = "sm38_client",
    type = "chi20",
    node = "locator2_client",
    anim_name = "cry_00",
    not_mob = true
  },
  opt = {
    fader = "blackout",
    pc_pos_reset = true,
    sandbox_af = "sm38_footer"
  }
}
L1_1 = "sm39"
L0_0[L1_1] = {
  chara = {
    name = "sm39_client",
    type = "man74",
    node = "locator2_client",
    anim_name = "idle_00",
    not_mob = true
  },
  opt = {
    sandbox_af = "sm39_footer"
  }
}
L1_1 = "sm40"
L0_0[L1_1] = {
  node = "locator2_sm40_pos"
}
L1_1 = "sm41"
L0_0[L1_1] = {
  chara = {
    name = "sm41_client",
    type = "vog01",
    node = "locator2_client",
    anim_name = "confuse_00"
  },
  opt = {
    sandbox = "sm41_header"
  }
}
L1_1 = "sm42"
L0_0[L1_1] = {
  chara = {
    name = "sm42_client",
    type = "man01",
    node = "locator2_client",
    anim_name = "lookaround_03"
  }
}
L1_1 = "sm43"
L0_0[L1_1] = {
  chara = {
    {
      name = "sm43_client",
      type = "phi01",
      node = "locator2_client"
    },
    {
      name = "sm43_student_01",
      type = "man50",
      node = "locator2_student_01"
    },
    {
      name = "sm43_student_02",
      type = "man51",
      node = "locator2_student_02"
    },
    {
      name = "sm43_student_03",
      type = "man50",
      node = "locator2_student_03"
    },
    {
      name = "sm43_student_04",
      type = "man51",
      node = "locator2_student_04"
    },
    {
      name = "sm43_student_05",
      type = "man52",
      node = "locator2_student_05"
    },
    {
      name = "sm43_student_06",
      type = "man52",
      node = "locator2_student_06"
    },
    {
      name = "sm43_student_07",
      type = "man50",
      node = "locator2_student_07"
    },
    {
      name = "sm43_student_08",
      type = "man51",
      node = "locator2_student_08"
    }
  }
}
L1_1 = "sm44"
L0_0[L1_1] = {
  chara = {
    name = "sm44_client",
    type = "eug01",
    node = "locator2_client"
  },
  opt = {
    sandbox_af = "sm44_footer"
  }
}
L1_1 = "sm45"
L0_0[L1_1] = {
  chara = {
    name = "sm45_client",
    type = "man74",
    node = "locator2_client",
    anim_name = "idle_00",
    not_mob = true
  },
  opt = {
    sandbox_af = "sm45_footer"
  },
  evx = {
    spawn = "sm45",
    name = "sm45_object",
    evarea2 = {
      "evarea2_dt_a_root"
    }
  }
}
L1_1 = "sm46"
L0_0[L1_1] = {
  node = "locator2_client"
}
L1_1 = "sm47"
L0_0[L1_1] = {
  chara = {
    {
      name = "sm47_client",
      type = "man63",
      node = "locator2_client",
      use_gravity = false,
      disable_collision = true
    },
    {
      name = "sm47_mad_01",
      type = "wom27",
      node = "locator2_mad_01"
    }
  },
  opt = {
    sandbox = "sm47_header",
    fader = "blackout",
    pc_pos_reset = true
  }
}
L1_1 = "sm48"
L0_0[L1_1] = {
  chara = {
    {
      name = "man73",
      type = "man73",
      node = "locator2_client",
      reset = false,
      not_mob = true
    }
  }
}
L1_1 = "sm49"
L0_0[L1_1] = {
  chara = {
    name = "sm49_client",
    type = "man78",
    node = "locator2_client"
  },
  opt = {
    sandbox = "sm49_header"
  }
}
L1_1 = "sm50"
L0_0[L1_1] = {
  chara = {
    name = "sm50_client",
    type = "kaj01",
    node = "locator2_client"
  }
}
L1_1 = "sm51"
L0_0[L1_1] = {
  chara = {
    name = "sm51_client",
    type = "vog01",
    node = "locator2_client"
  },
  opt = {
    sandbox = "sm51_header",
    fader = "blackout",
    pc_pos_reset = true
  }
}
L1_1 = "cm01"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm02"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm03"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm04"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm05"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm06"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm07"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm08"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm09"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm10"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm11"
L0_0[L1_1] = {
  ggd = {
    {
      flag_name = "Savedata__EventManageFlags__CurrentFreeMode",
      flag_value = "ft11",
      node = "locator2_marker_02",
      retire_node = "locator2_retire_pos_02"
    },
    {
      flag_name = "Savedata__EventManageFlags__CurrentFreeMode",
      flag_value = "ft21",
      node = "locator2_marker_02",
      retire_node = "locator2_retire_pos_02"
    },
    {
      flag_name = "Savedata__EventManageFlags__CurrentFreeMode",
      flag_value = "ft28",
      node = "locator2_marker_02",
      retire_node = "locator2_retire_pos_02"
    },
    {
      node = "locator2_marker_01",
      retire_node = "locator2_retire_pos"
    }
  }
}
L1_1 = "cm12"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm13"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm14"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm15"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm16"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm17"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm18"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm19"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm20"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "mine_bu"
L0_0[L1_1] = {
  chara = {
    {
      name = "miz01",
      type = "miz01",
      node = "locator2_miz01_01"
    },
    {
      name = "driver",
      type = "man34",
      node = "locator2_man34_01",
      disable_collision = true,
      start = true,
      active = false
    },
    {
      name = "worker",
      type = "man36",
      node = "locator2_man36_01",
      disable_collision = true,
      start = true,
      anim_name = "sit_01"
    }
  }
}
L1_1 = "mine_po"
L0_0[L1_1] = {
  chara = {
    {
      name = "miz01",
      type = "miz01",
      node = "locator2_miz01_01"
    },
    {
      name = "driver",
      type = "man34",
      node = "locator2_man34_01",
      disable_collision = true,
      start = true,
      active = false
    },
    {
      name = "worker",
      type = "man36",
      node = "locator2_man36_01",
      disable_collision = true,
      start = true,
      anim_name = "sit_01"
    }
  }
}
L1_1 = "mine_hx"
L0_0[L1_1] = {
  chara = {
    {
      name = "man73",
      type = "man73",
      node = "locator2_man73_01"
    }
  }
}
L1_1 = "ep90"
L0_0[L1_1] = {
  chara = {
    {
      name = "vogo_01",
      type = "vog01",
      node = "locator2_vogo",
      anim_name = "confuse_00"
    },
    {
      name = "ve01",
      type = "ve01",
      node = "locator2_ve01",
      anim_name = "fly",
      use_gravity = false
    }
  },
  opt = {
    sandbox = "ep90_header"
  }
}
L1_1 = "sm90"
L0_0[L1_1] = {
  chara = {
    name = "miz01",
    type = "miz01",
    node = "locator2_mizai01_01",
    notCreateSandbox = {"sm90_b"}
  }
}
L1_1 = "sm91"
L0_0[L1_1] = {
  chara = {
    name = "sm91_client",
    type = "man78",
    node = "locator2_client"
  }
}
L1_1 = "sm92"
L0_0[L1_1] = {
  chara = {
    name = "sm92_client",
    type = "wom26",
    node = "locator2_client"
  }
}
L1_1 = "sm93"
L0_0[L1_1] = {
  ggd = {
    {
      flag_name = "EventFlags__sm93__TutorialFlags",
      flag_value = true,
      node = "locator2_cid01_01",
      opt = {
        sandbox = "sm93_header",
        kaiwa = "sm93_00100k",
        fader = "blackout"
      },
      marker = {
        ad_sub = "ui_acdialog_sub_05",
        map_sub = "ui_map_msinfo_header_05",
        pattern = "A"
      }
    },
    {
      flag_name = "EventFlags__sm93__TutorialFlags",
      flag_value = false,
      chara = {
        name = "cid01",
        type = "cid01",
        node = "locator2_cid01_02",
        anim_name = "sit_00"
      },
      opt = {
        sandbox = "sm93_header",
        kaiwa = "sm93_00100k",
        fader = "blackout"
      },
      marker = {
        ad_sub = "ui_acdialog_sub_05",
        map_sub = "ui_map_msinfo_header_05",
        pattern = "B"
      }
    }
  }
}
L1_1 = "sm94"
L0_0[L1_1] = {
  chara = {
    name = "sm94_wom01_01",
    type = "sis01",
    node = "locator2_wom01_01"
  }
}
L1_1 = "sm95"
L0_0[L1_1] = {
  node = "locator2_sm95_pos",
  opt = {fader = "blackout", pc_pos_reset = true}
}
L1_1 = "sm96"
L0_0[L1_1] = {
  node = "locator2_sm96_pos",
  opt = {fader = "blackout", pc_pos_reset = true}
}
L1_1 = "cm90"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm91"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
L1_1 = "cm92"
L0_0[L1_1] = {
  node = "locator2_marker_01"
}
free_setting_tbl = L0_0
L0_0 = "mine_jir_side_mission_tbl"
L1_1 = {"sm01", "sm14"}
_ENV[L0_0] = L1_1
L0_0 = "mine_hex_side_mission_tbl"
L1_1 = {"sm28", "sm48"}
_ENV[L0_0] = L1_1
