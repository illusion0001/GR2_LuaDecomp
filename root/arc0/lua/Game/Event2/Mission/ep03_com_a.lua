dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Misc/lithograph_controller.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
import("GlobalGem")
mine_name = "ep03_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_debug_ep03 = false
_island_table = {
  ep03_a = {
    "dummy",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01"
  },
  ep03_b = {
    "dummy",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01"
  },
  ep03_c = {
    "dummy",
    "01",
    "02",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01"
  },
  ep03_d = {
    "dummy",
    "01",
    "02",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01"
  },
  ep03_e = {
    "dummy",
    "01",
    "02",
    "02",
    "01",
    "01",
    "01",
    "02",
    "01",
    "01"
  },
  ep03_f = {
    "dummy",
    "01",
    "02",
    "02",
    "01",
    "01",
    "01",
    "02",
    "01",
    "01"
  },
  ep03_g = {
    "dummy",
    "01",
    "02",
    "02",
    "02",
    "02",
    "01",
    "03",
    "01",
    "01"
  },
  ep03_j = {
    "dummy",
    "01",
    "02",
    "02",
    "02",
    "02",
    "01",
    "03",
    "01",
    "01"
  },
  ep03_k = {
    "dummy",
    "01",
    "02",
    "03",
    "02",
    "02",
    "01",
    "04",
    "01",
    "01"
  },
  ep03_l = {
    "dummy",
    "01",
    "02",
    "03",
    "02",
    "02",
    "01",
    "04",
    "02",
    "01"
  },
  ep03_m = {
    "dummy",
    "01",
    "03",
    "03",
    "02",
    "02",
    "01",
    "05",
    "02",
    "01"
  },
  ep03_n = {
    "dummy",
    "01",
    "03",
    "03",
    "02",
    "02",
    "01",
    "05",
    "02",
    "01"
  },
  ep03_o = {
    "dummy",
    "02",
    "03",
    "03",
    "02",
    "02",
    "01",
    "05",
    "02",
    "01"
  },
  ep03_p = {
    "dummy",
    "02",
    "03",
    "03",
    "02",
    "02",
    "01",
    "05",
    "02",
    "01"
  },
  ep03_q = {
    "dummy",
    "02",
    "03",
    "03",
    "02",
    "02",
    "01",
    "06",
    "02",
    "02"
  },
  ep03_r = {
    "dummy",
    "02",
    "03",
    "03",
    "02",
    "02",
    "01",
    "06",
    "02",
    "02"
  },
  ep03_s = {
    "dummy",
    "02",
    "03",
    "03",
    "02",
    "02",
    "02",
    "06",
    "02",
    "06"
  },
  ep03_t = {
    "dummy",
    "02",
    "03",
    "03",
    "02",
    "02",
    "02",
    "06",
    "02",
    "06"
  }
}
_islet_08_set = {
  {
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01"
  },
  {
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02"
  },
  {
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "03",
    "03",
    "03",
    "03",
    "03",
    "03",
    "03",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02",
    "02"
  },
  {
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04"
  },
  {
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "01",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05"
  },
  {
    "01",
    "01",
    "01",
    "01",
    "06",
    "06",
    "06",
    "06",
    "06",
    "06",
    "06",
    "06",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "04",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05",
    "05"
  }
}
_islet_09_set = {
  {
    "01",
    "01",
    "01"
  },
  {
    "02",
    "02",
    "02"
  }
}
_move_node_table = {
  lithograph_01 = {
    {
      island = "03",
      node = "02",
      velocity = 15,
      wait = true,
      se = "s",
      atime = 1.5,
      bdist = 8
    }
  },
  lithograph_02 = {
    {
      island = "08_20",
      node = "02",
      velocity = 8
    },
    {
      island = "08_21",
      node = "02",
      velocity = 8
    },
    {
      island = "08_22",
      node = "02",
      velocity = 8
    },
    {
      island = "08_23",
      node = "02",
      velocity = 8
    },
    {
      island = "08_24",
      node = "02",
      velocity = 8
    },
    {
      island = "08_25",
      node = "02",
      velocity = 8
    },
    {
      island = "08_26",
      node = "02",
      velocity = 8
    },
    {
      island = "08_27",
      node = "02",
      velocity = 8
    },
    {
      island = "08_28",
      node = "02",
      velocity = 8
    },
    {
      island = "04",
      node = "02",
      velocity = 15,
      wait = true,
      se = "m",
      atime = 1.5,
      bdist = 8
    }
  },
  lithograph_03 = {
    {
      island = "05",
      node = "02",
      velocity = 15,
      se = "l",
      atime = 1.5,
      bdist = 8
    },
    {
      island = "06",
      node = "02",
      velocity = 15
    },
    {
      island = "08_13",
      node = "03",
      velocity = 8
    },
    {
      island = "08_14",
      node = "03",
      velocity = 8
    },
    {
      island = "08_15",
      node = "03",
      velocity = 8
    },
    {
      island = "08_16",
      node = "03",
      velocity = 8
    },
    {
      island = "08_17",
      node = "03",
      velocity = 8
    },
    {
      island = "08_18",
      node = "03",
      velocity = 8
    },
    {
      island = "08_19",
      node = "03",
      velocity = 8
    }
  },
  lithograph_05 = {
    {
      island = "04",
      node = "03",
      velocity = 20,
      se = "m",
      atime = 1.5,
      bdist = 8
    },
    {
      island = "08_13",
      node = "04",
      velocity = 8
    },
    {
      island = "08_14",
      node = "04",
      velocity = 8
    },
    {
      island = "08_15",
      node = "04",
      velocity = 8
    },
    {
      island = "08_16",
      node = "04",
      velocity = 8
    },
    {
      island = "08_17",
      node = "04",
      velocity = 8
    },
    {
      island = "08_18",
      node = "04",
      velocity = 8
    },
    {
      island = "08_19",
      node = "04",
      velocity = 8
    },
    {
      island = "08_20",
      node = "04",
      velocity = 8
    },
    {
      island = "08_21",
      node = "04",
      velocity = 8
    },
    {
      island = "08_22",
      node = "04",
      velocity = 8
    },
    {
      island = "08_23",
      node = "04",
      velocity = 8
    },
    {
      island = "08_24",
      node = "04",
      velocity = 8
    },
    {
      island = "08_25",
      node = "04",
      velocity = 8
    },
    {
      island = "08_26",
      node = "04",
      velocity = 8
    },
    {
      island = "08_27",
      node = "04",
      velocity = 8
    },
    {
      island = "08_28",
      node = "04",
      velocity = 8
    }
  },
  lithograph_06 = {
    {
      island = "03",
      node = "03",
      velocity = 15,
      se = "m",
      atime = 1.5,
      bdist = 8
    },
    {
      island = "08_20",
      node = "05",
      velocity = 8
    },
    {
      island = "08_21",
      node = "05",
      velocity = 8
    },
    {
      island = "08_22",
      node = "05",
      velocity = 8
    },
    {
      island = "08_23",
      node = "05",
      velocity = 8
    },
    {
      island = "08_24",
      node = "05",
      velocity = 8
    },
    {
      island = "08_25",
      node = "05",
      velocity = 8
    },
    {
      island = "08_26",
      node = "05",
      velocity = 8
    },
    {
      island = "08_27",
      node = "05",
      velocity = 8
    },
    {
      island = "08_28",
      node = "05",
      velocity = 8
    }
  },
  lithograph_07 = {
    {
      island = "02",
      node = "02",
      velocity = 15,
      se = "l",
      atime = 1.5,
      bdist = 8
    }
  },
  lithograph_08 = {
    {
      island = "10",
      node = "02",
      velocity = 25,
      se = "l",
      atime = 1.5,
      bdist = 8
    },
    {
      island = "09_01",
      node = "02",
      velocity = 8
    },
    {
      island = "09_02",
      node = "02",
      velocity = 8
    },
    {
      island = "08_05",
      node = "06",
      velocity = 8
    },
    {
      island = "08_06",
      node = "06",
      velocity = 8
    },
    {
      island = "08_07",
      node = "06",
      velocity = 8
    },
    {
      island = "08_08",
      node = "06",
      velocity = 8
    },
    {
      island = "08_09",
      node = "06",
      velocity = 8
    },
    {
      island = "08_10",
      node = "06",
      velocity = 8
    },
    {
      island = "08_11",
      node = "06",
      velocity = 8
    },
    {
      island = "08_12",
      node = "06",
      velocity = 8
    }
  },
  lithograph_09 = {
    {
      island = "07",
      node = "02",
      velocity = 25,
      wait = true,
      se = "l",
      atime = 1.5,
      bdist = 8
    }
  },
  litho_05_01_sink = {
    {
      island = "05",
      node = "08",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_02_sink = {
    {
      island = "05",
      node = "07",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_03_sink = {
    {
      island = "05",
      node = "06",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_04_sink = {
    {
      island = "05",
      node = "05",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_05_sink = {
    {
      island = "05",
      node = "02",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_06_sink = {
    {
      island = "05",
      node = "03",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_07_sink = {
    {
      island = "05",
      node = "04",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_00_sink = {
    {
      island = "05",
      node = "08",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_05_99_sink = {
    {
      island = "05",
      node = "01",
      velocity = 1,
      wait = false,
      se = "s"
    }
  },
  litho_08_01_sink = {
    {
      island = "02",
      node = "03",
      velocity = 5,
      wait = true,
      se = "l",
      atime = 1,
      bdist = 1
    }
  },
  litho_08_02_sink = {
    {
      island = "02",
      node = "04",
      velocity = 5,
      wait = true,
      se = "l",
      atime = 5,
      bdist = 10
    }
  },
  litho_08_03_sink = {
    {
      island = "02",
      node = "05",
      velocity = 5,
      wait = true,
      se = "l",
      atime = 6,
      bdist = 15
    }
  },
  litho_08_04_sink = {
    {
      island = "02",
      node = "06",
      velocity = 5,
      wait = true,
      se = "l",
      atime = 5,
      bdist = 15
    }
  },
  litho_08_05_sink = {
    {
      island = "02",
      node = "07",
      velocity = 2.5,
      wait = true,
      se = "l",
      atime = 5,
      bdist = 1
    }
  },
  litho_09_01_sink = {
    {
      island = "10",
      node = "03",
      velocity = 10,
      wait = true,
      se = "m"
    }
  },
  litho_09_02_sink = {
    {
      island = "10",
      node = "04",
      velocity = 10,
      wait = true,
      se = "m"
    }
  },
  litho_09_03_sink = {
    {
      island = "10",
      node = "05",
      velocity = 10,
      wait = true,
      se = "m"
    }
  },
  litho_09_04_sink = {
    {
      island = "10",
      node = "06",
      velocity = 10,
      wait = true,
      se = "m"
    }
  },
  litho_03_02_reset = {
    {
      island = "08_19",
      node = "01",
      velocity = 20,
      wait = true,
      se = "s"
    }
  }
}
_gem_table = {
  {
    litho = "01",
    island = "02",
    set = "01",
    hdl = nil
  },
  {
    litho = "02",
    island = "03",
    set = "02",
    hdl = nil
  },
  {
    litho = "03",
    island = "04",
    set = "02",
    hdl = nil
  },
  {
    litho = "04",
    island = "02",
    set = "02",
    hdl = nil
  },
  {
    litho = "05",
    island = "05",
    set = "02",
    hdl = nil
  },
  {
    litho = "06",
    island = "04",
    set = "03",
    hdl = nil
  },
  {
    litho = "07",
    island = "03",
    set = "03",
    hdl = nil
  },
  {
    litho = "08",
    island = "02",
    set = "02",
    hdl = nil
  },
  {
    litho = "09",
    island = "10",
    set = "02",
    hdl = nil
  },
  {
    litho = "10",
    island = "07",
    set = "02",
    hdl = nil
  }
}
function sink_shake()
  invokeTask(function()
    waitSeconds(3)
    Camera:shake3D(5, 0.25, 1, Fn_findAreaHandle("az_a_02"):getWorldPos(), 0)
  end)
end
_progress_table = {
  ep03_a = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep03_b = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep03_c = {
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep03_d = {
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep03_e = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep03_f = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep03_g = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep03_h = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep03_i = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep03_j = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep03_k = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep03_l = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep03_m = {
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep03_n = {
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep03_o = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false
  },
  ep03_p = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false
  },
  ep03_q = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false
  },
  ep03_r = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false
  },
  ep03_s = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  },
  ep03_t = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  }
}
_mission_text_table = {
  {text = "ep03_09000", se = "skb_003"},
  {text = "ep03_09001", se = "skb_002"},
  {text = "ep03_09002", se = "skb_003"},
  {text = "ep03_09003", se = "skb_003"},
  {text = "ep03_09004", se = "skb_003"},
  {text = "ep03_09005", se = "skb_001"},
  {text = "ep03_09006", se = "skb_003"},
  {text = "ep03_09007", se = "skb_001"},
  {text = "ep03_09008", se = "skb_002"}
}
_guide_eff_table = {
  "ef_ev_hndpar01_01",
  "ef_ev_hndpar01_02",
  "ef_ev_hndpar01_03",
  "",
  "ef_ev_hndpar01_05",
  "ef_ev_hndpar01_06",
  "ef_ev_hndpar01_07",
  "ef_ev_hndpar01_08",
  "ef_ev_hndpar01_09"
}
_demo_table = {
  {
    first_half = {
      warp = "locator2_pc_sd_litho_01",
      cut1 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_01",
      cut1 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_aim",
        waittime = 1
      },
      cut2 = {
        cam = "locator2_litho_01_c_cam",
        aim = "locator2_hand_01_aim"
      },
      cut3 = {
        cam = "locator2_litho_01_c_cam",
        aim = "locator2_hand_01_b_aim",
        aim_time = 2
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_01_cam",
        aim = "locator2_litho_01_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_02",
      cut1 = {
        cam = "locator2_litho_02_cam",
        aim = "locator2_litho_02_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_02",
      cut1 = {
        cam = "locator2_litho_02_cam",
        aim = "locator2_litho_02_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_02_cam",
        aim = "locator2_litho_02_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_03",
      cut1 = {
        cam = "locator2_litho_03_cam_start",
        aim = "locator2_litho_03_aim"
      },
      cut2 = {
        cam = "locator2_enm_sd_cam",
        aim = "locator2_enm_sd_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_03",
      cut1 = {
        cam = "locator2_litho_03_cam",
        aim = "locator2_litho_03_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_03_cam",
        aim = "locator2_litho_03_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_04",
      vctrl = "vctrl2_litho_04"
    },
    second_half = {
      warp = "locator2_pc_sd_litho_04",
      cut1 = {
        cam = "locator2_litho_04_cam",
        aim = "locator2_litho_04_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_04_cam",
        aim = "locator2_litho_04_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_05_start",
      cut1 = {
        cam = "locator2_litho_05_cam_start",
        aim = "locator2_litho_05_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_05",
      cut1 = {
        cam = "locator2_litho_05_cam",
        aim = "locator2_litho_05_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_05_cam",
        aim = "locator2_litho_05_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_06",
      cut1 = {
        cam = "locator2_litho_06_cam",
        aim = "locator2_litho_06_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_06_b",
      cut1 = {
        cam = "locator2_litho_06_cam",
        aim = "locator2_litho_06_aim",
        waittime = 1
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_06_cam",
        aim = "locator2_litho_06_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_07",
      cut1 = {
        cam = "locator2_litho_07_b_cam",
        aim = "locator2_litho_07_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_07_b",
      cut1 = {
        cam = "locator2_litho_07_c_cam",
        aim = "locator2_litho_07_c_aim"
      },
      cut2 = {},
      cut3 = {}
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_07_cam",
        aim = "locator2_litho_07_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_08",
      cut1 = {
        cam = "locator2_litho_08_b_cam",
        aim = "locator2_litho_08_b_aim",
        waittime = 2
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_b_08",
      cut1 = {
        cam = "locator2_litho_08_c_cam",
        aim = "locator2_litho_08_b_aim"
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_08_cam",
        aim = "locator2_litho_08_aim"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sd_litho_09_start",
      cut1 = {
        cam = "locator2_litho_09_b_cam",
        aim = "locator2_litho_09_aim"
      },
      cut2 = {
        cam = "locator2_litho_09_cam",
        aim = "locator2_litho_09_b_aim"
      }
    },
    second_half = {
      warp = "locator2_pc_sd_litho_09_goal",
      cut1 = {
        cam = "locator2_nextpoint_09_cam",
        aim = "locator2_hand_09_b_aim"
      },
      cut2 = {
        cam = "locator2_nextpoint_09_cam",
        aim = "locator2_hand_09_b_aim"
      },
      cut3 = {
        cam = "locator2_nextpoint_09_cam_2",
        aim = "locator2_hand_09_b_aim_2",
        cam_time = 5,
        aim_time = 5
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_litho_09_cam",
        aim = "locator2_litho_09_aim"
      }
    }
  }
}
_area_ctrls = {}
_lithograph_id = nil
_move_request = false
_move_end = false
_mine_init = false
_warp_request = false
_warp_end = false
_warp_area = nil
_warp_node = nil
_warp_dist = nil
_pause_request = false
_pause_area = nil
_pause_value = nil
_stop_request = false
_stop_area = nil
_drift_request = false
_drift_area = nil
_drift_enable = true
_gem_request = false
_gem_reset_end = false
_gem_litho = 0
_litho_max = 9
_island_se_hdl = nil
_catwarp_request = false
_poison_limit = false
_az_a_04_obj = 24
_az_a_05_obj = 30
_litho_02_ore = 26
_litho_04_ore = 16
_litho_08_ore = 80
function Lithograph_OnInitialize(A0_0)
  local L1_1, L2_2
  if A0_0 ~= nil then
    L1_1 = Fn_getMissionPart
    L1_1 = L1_1()
    L2_2 = A0_0.getName
    L2_2 = L2_2(A0_0)
    return _progress_table[L1_1][tonumber(string.sub(L2_2, -2))]
  end
  L1_1 = false
  return L1_1
end
_observation = nil
function Initialize()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
  L0_3 = Fn_getMissionPart
  L0_3 = L0_3()
  L1_4 = math
  L1_4 = L1_4.ceil
  L8_11 = L3_6(L4_7, L5_8)
  L1_4 = L1_4(L2_5)
  L2_5(L3_6)
  L2_5(L3_6)
  for L5_8 = 2, 7 do
    L7_10 = "az_a_%02d"
    L8_11 = L5_8
    L7_10 = "locator2_"
    L8_11 = L6_9
    L7_10 = L7_10 .. L8_11 .. "_set_" .. _island_table[L0_3][L5_8]
    L8_11 = _area_ctrls
    L8_11[L6_9] = AreaController.create(L6_9)
    L8_11 = _area_ctrls
    L8_11 = L8_11[L6_9]
    L8_11 = L8_11.warp
    L8_11(L8_11, L7_10)
  end
  for L5_8 = 1, 28 do
    L7_10 = "az_a_08_%02d"
    L8_11 = L5_8
    L7_10 = string
    L7_10 = L7_10.format
    L8_11 = "locator2_%s_set_%02d"
    L7_10 = L7_10(L8_11, L6_9, _islet_08_set[tonumber(_island_table[L0_3][8])][L5_8])
    L8_11 = _area_ctrls
    L8_11[L6_9] = AreaController.create(L6_9)
    L8_11 = _area_ctrls
    L8_11 = L8_11[L6_9]
    L8_11 = L8_11.warp
    L8_11(L8_11, L7_10)
    if L5_8 == 19 and L1_4 <= 3 then
      L8_11 = _area_ctrls
      L8_11 = L8_11[L6_9]
      L8_11 = L8_11.handle
      L8_11 = L8_11.setDriftEnable
      L8_11(L8_11, false)
    end
  end
  for L5_8 = 1, 3 do
    L7_10 = "az_a_09_%02d"
    L8_11 = L5_8
    L7_10 = string
    L7_10 = L7_10.format
    L8_11 = "locator2_%s_set_%02d"
    L7_10 = L7_10(L8_11, L6_9, _islet_09_set[tonumber(_island_table[L0_3][9])][L5_8])
    L8_11 = _area_ctrls
    L8_11[L6_9] = AreaController.create(L6_9)
    L8_11 = _area_ctrls
    L8_11 = L8_11[L6_9]
    L8_11 = L8_11.warp
    L8_11(L8_11, L7_10)
  end
  L4_7[L2_5] = L5_8
  L4_7(L5_8, L6_9)
  _litho_ctrls = nil
  L7_10 = _mission_text_table
  L8_11 = _guide_eff_table
  _litho_ctrls = L4_7
  if L1_4 < 8 then
    L4_7(L5_8, L6_9)
    L4_7(L5_8, L6_9)
  else
    L4_7(L5_8, L6_9)
    L4_7(L5_8, L6_9)
  end
  for L7_10 = L1_4, 1, -1 do
    if L7_10 ~= 4 then
      L8_11 = gemLoad
      L8_11(L7_10)
    end
  end
  for L7_10 = 1, _litho_max do
    L8_11 = findGameObject2
    L8_11 = L8_11("ViewControl", string.format("vctrl2_litho_%02d", L7_10))
    if L8_11 ~= nil then
      Fn_vctrlOff(L8_11)
    end
  end
  if L0_3 ~= "ep03_t" then
    L7_10 = false
    L5_8(L6_9, L7_10)
  else
    L7_10 = false
    L5_8(L6_9, L7_10)
  end
  L5_8(L6_9)
  L7_10 = _gravityOre
  L8_11 = _addGravityOre
  L5_8(L6_9, L7_10, L8_11)
  repeat
    L5_8()
  until L5_8
end
function Ingame()
  local L0_12, L1_13
  L0_12 = mineInitLitho
  L0_12()
  L0_12 = invokeTask
  function L1_13()
    while true do
      if _ore_active_request then
        ore_active(_ore_active_name, active)
        _ore_active_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  L0_12 = poison_observation
  L0_12 = L0_12()
  _observation = L0_12
  L0_12 = GameDatabase
  L1_13 = L0_12
  L0_12 = L0_12.get
  L0_12 = L0_12(L1_13, ggd.GlobalSystemFlags__GameRetry)
  if L0_12 then
    L0_12 = Fn_getMissionPart
    L0_12 = L0_12()
    if L0_12 ~= "ep03_p" and L0_12 ~= "ep03_r" then
      L1_13 = Fn_captionView
      L1_13("ep03_09012")
    end
  end
  L0_12 = invokeTask
  function L1_13()
    while true do
      if Fn_getMissionPart() == "ep03_p" and _catwarp_request then
        print("request ep03_catwarp")
        ep03_catwarp()
        wait()
        repeat
          wait()
        until isCatwarpStart() == false
        _catwarp_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  L0_12 = invokeTask
  function L1_13()
    while true do
      if _gem_request then
        gemReset(_gem_litho)
        _gem_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  L0_12 = invokeTask
  function L1_13()
    while true do
      if _warp_request then
        print("***** warp_request *****")
        warpArea(_warp_area, _warp_node, _warp_dist)
        _warp_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  L0_12 = invokeTask
  function L1_13()
    while true do
      if _pause_request then
        print("***** pause_request *****")
        pauseArea(_pause_area, _pause_value)
        _pause_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  L0_12 = invokeTask
  function L1_13()
    while true do
      if _stop_request then
        print("***** stop_request *****")
        stopArea(_stop_area)
        _stop_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  L0_12 = invokeTask
  function L1_13()
    while true do
      if _drift_request then
        print("***** drift_request *****")
        areaDrift(area, val)
        _drift_request = false
      end
      wait()
    end
  end
  L0_12(L1_13)
  while true do
    L0_12 = _move_request
    if L0_12 == "ANY_MOVE" then
      L0_12 = print
      L1_13 = "***** move_request:ANY_MOVE *****"
      L0_12(L1_13)
      _move_request = false
      L0_12 = _move_id
      if L0_12 ~= nil then
        L0_12 = moveArea
        L1_13 = _move_id
        L0_12(L1_13)
      end
    else
      L0_12 = _move_request
      if L0_12 == "LITHO_MOVE" then
        L0_12 = print
        L1_13 = "***** move_request:LITHO_MOVE *****"
        L0_12(L1_13)
        L0_12 = _litho_ctrls
        L1_13 = L0_12
        L0_12 = L0_12.getCurrentLithographName
        L0_12 = L0_12(L1_13)
        repeat
          L1_13 = wait
          L1_13()
          L1_13 = _litho_ctrls
          L1_13 = L1_13.isSecondHalfProcessEventStart
          L1_13 = L1_13(L1_13)
        until L1_13
        L1_13 = tonumber
        L1_13 = L1_13(string.sub(L0_12, -2) + 1)
        if L1_13 == 4 then
          L1_13 = L1_13 + 1
        end
        print("***** next_litho gem & ore set : " .. L1_13 .. " *****")
        gemLoad(L1_13)
        hand_ore_set(L1_13)
        invokeTask(function()
          moveArea(L0_12)
        end)
        waitSeconds(3)
        _litho_ctrls:setSecondHalfProcessEnd()
        _move_request = false
      else
      end
    end
    L0_12 = wait
    L0_12()
  end
end
_catwarp_start = false
_catwarp_wait = 2
_part_now = nil
_part_area = {
  ep03_a = "az_a_01",
  ep03_b = "az_a_02",
  ep03_c = "az_a_02",
  ep03_d = "az_a_03",
  ep03_e = "az_a_03",
  ep03_f = "az_a_04",
  ep03_g = "az_a_04",
  ep03_h = "",
  ep03_i = "",
  ep03_j = "az_a_05",
  ep03_k = "az_a_05",
  ep03_l = "az_a_04",
  ep03_m = "az_a_04",
  ep03_n = "az_a_03",
  ep03_o = "az_a_03",
  ep03_p = "az_a_02",
  ep03_q = "az_a_02",
  ep03_r = "az_a_10",
  ep03_s = "az_a_10",
  ep03_t = "az_a_07"
}
function pccubesensor2_az_a_catwarp_OnLeave()
  print("********** ep03_catwarp **********")
  ep03_catwarp()
end
function ep03_catwarp()
  _catwarp_request = true
  invokeTask(function()
    print("ep03_catwarp point:" .. Fn_getCatWarpCheckPoint())
    if GameDatabase:get(ggd.EventFlags__ep03__flag01) == 1 then
      GameDatabase:set(ggd.EventFlags__ep03__flag01, 3)
      _catwarp_start = true
      Fn_catWarp()
      Fn_userCtrlOff()
      waitSeconds(_catwarp_wait + 0.5)
      Fn_kaiwaDemoView("ep03_00205k")
      Fn_userCtrlOn()
      _catwarp_start = false
      GameDatabase:set(ggd.EventFlags__ep03__flag01, 4)
    else
      _catwarp_start = true
      Fn_catWarp()
      waitSeconds(_catwarp_wait)
      _catwarp_start = false
    end
  end)
end
function pccubesensor2_az_a_catwarp_warning_OnLeave()
  print("ep03_catwarp_warning")
  if _poison_gas == false and not Fn_isCaptionView("ep03_09009") then
    Fn_captionView("ep03_09009")
  end
end
function az_a_catwarp(A0_14)
  if A0_14 then
    Fn_pcSensorOn("pccubesensor2_az_a_catwarp")
    Fn_pcSensorOn("pccubesensor2_az_a_catwarp_warning")
  else
    Fn_pcSensorOff("pccubesensor2_az_a_catwarp")
    Fn_pcSensorOff("pccubesensor2_az_a_catwarp_warning")
  end
end
function isCatwarpStart()
  local L0_15, L1_16
  L0_15 = _catwarp_start
  return L0_15
end
function CatwarpWaitTime()
  local L0_17, L1_18
  L0_17 = _catwarp_wait
  return L0_17
end
function requestCatwarp()
  if not _catwarp_request then
    print("_catwarp_request")
    _catwarp_request = true
    return true
  end
  return false
end
_poison_gas = false
_poison_first_timer = nil
_poison_timer_task = nil
_POISON_START = 0.058
function poison_observation()
  print("**** poison_observation : start ****")
  return invokeTask(function()
    local L0_19, L1_20
    L0_19, L1_20 = nil, nil
    repeat
      L0_19 = Fn_getPcPosRot()
      Query:setGfxObservationPoint(L0_19)
      L1_20 = Query:getGfxObservationDensity()
      wait()
    until Query:getGfxObservationDensity() < _POISON_START
    L1_20 = 0
    repeat
      L0_19 = Fn_getPcPosRot()
      Query:setGfxObservationPoint(L0_19)
      L1_20 = Query:getGfxObservationDensity()
      if L1_20 < _POISON_START then
        if _poison_gas == true then
          print("****** poison end ******")
          invokeTask(poison_area_out)
        end
      elseif L1_20 >= _POISON_START and _poison_gas == false then
        print("****** poison [" .. L1_20 .. "] ****** PC POS [" .. tostring(L0_19) .. "] ******")
        invokeTask(poison_erea_in)
        if _poison_timer_task == nil then
          print("****** poison catwarp count start ******")
          _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, function()
            _poison_limit = true
            if Fn_getMissionPart() ~= "ep03_p" and _catwarp_start == false then
              ep03_catwarp()
            elseif Fn_getMissionPart() == "ep03_p" then
              print("\227\129\170\227\129\171\227\130\130\227\129\151\227\129\170\227\129\132")
            end
          end)
        end
      end
      wait()
    until false
  end)
end
function poison_erea_in()
  print("************ poison in ************")
  _poison_gas = true
  _poison_limit = false
  if GameDatabase:get(ggd.EventFlags__ep03__flag01) ~= 4 then
    GameDatabase:set(ggd.EventFlags__ep03__flag01, 1)
  end
  Player:applyPoisonDamage(3, 999)
  _poison_se = Sound:playSEHandle("pc1_poisoned", 1, "", Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
function poison_area_out()
  print("************ poison out ************")
  _poison_gas = false
  _poison_limit = false
  if _poison_se ~= nil then
    Sound:stopSEHandle(_poison_se)
    _poison_se = nil
  end
  Player:applyPoisonDamage(0, 0.01)
  if _poison_timer_task ~= nil then
    _poison_timer_task:abort()
    _poison_timer_task = nil
  end
  if GameDatabase:get(ggd.EventFlags__ep03__flag01) == 1 then
    GameDatabase:set(ggd.EventFlags__ep03__flag01, 2)
    _poison_first_timer = EventHelper:timerCallback("poison_first", 3, function()
      if GameDatabase:get(ggd.EventFlags__ep03__flag01) == 2 then
        Fn_kaiwaDemoView("ep03_00205k")
        GameDatabase:set(ggd.EventFlags__ep03__flag01, 4)
      end
    end)
  elseif GameDatabase:get(ggd.EventFlags__ep03__flag01) == 3 and _poison_first_timer ~= nil then
    _poison_first_timer:abort()
  end
end
function isPoisonAreaIN()
  local L0_21, L1_22
  L0_21 = _poison_gas
  return L0_21
end
function isPoisonLimit()
  local L0_23, L1_24
  L0_23 = _poison_limit
  return L0_23
end
function moveArea(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32
  L1_26(L2_27)
  for L4_29, L5_30 in L1_26(L2_27) do
    L6_31 = "az_a_"
    L7_32 = L5_30.island
    L6_31 = L6_31 .. L7_32
    L7_32 = "locator2_az_a_"
    L7_32 = L7_32 .. L5_30.island .. "_set_" .. L5_30.node
    if L5_30.se ~= nil then
      print("***** island sound : " .. string.format("ep03_island_rise_%s", L5_30.se) .. " *****")
      _island_se_hdl = Sound:playSEHandle(string.format("ep03_island_rise_%s", L5_30.se), 1, "", Fn_findAreaHandle(L6_31))
      invokeTask(function()
        if L5_30.wait then
          repeat
            wait()
          until L5_30.bdist > Fn_findAreaHandle(L6_31):getMoveDistance()
          Sound:stopSEHandle(_island_se_hdl)
          print("***** island sound : " .. string.format("ep03_island_rise_%s", L5_30.se) .. " >>> STOP *****")
        else
          waitSeconds(3)
          Sound:stopSEHandle(_island_se_hdl)
          print("***** island sound : " .. string.format("ep03_island_rise_%s", L5_30.se) .. " >>> STOP *****")
        end
      end)
    end
    print("area_name:" .. L6_31)
    print("node_name:" .. L7_32)
    print("move_atime : " .. tostring(L5_30.atime) .. " | move_bdist : " .. tostring(L5_30.bdist))
    _area_ctrls[L6_31]:setMoveParam({
      velocity = L5_30.velocity,
      move_wait = L5_30.wait,
      move_type = 2,
      move_atime = L5_30.atime,
      move_bdist = L5_30.bdist
    })
    _area_ctrls[L6_31]:move(L7_32)
    do break end
    break
  end
  _move_end = true
end
function warpArea(A0_33, A1_34, A2_35)
  local L3_36, L4_37
  L3_36 = print
  L4_37 = "***** moveWarp : "
  L4_37 = L4_37 .. A0_33 .. " >>>" .. A1_34
  L3_36(L4_37)
  L3_36 = A0_33
  L4_37 = A1_34
  _area_ctrls[L3_36]:stop()
  wait()
  _area_ctrls[L3_36]:warp(L4_37, A2_35)
  _warp_end = true
end
function pauseArea(A0_38, A1_39)
  _area_ctrls[A0_38]:pause(A1_39)
  if A1_39 == true then
    _move_end = true
  else
    _move_end = false
  end
end
function stopArea(A0_40)
  _area_ctrls[A0_40]:pause()
  _move_end = true
end
function requestDriftArea(A0_41, A1_42)
  if not _drift_request then
    print("***** requestMoveArea *****")
    _drift_request = true
    _drift_area = A0_41
    _drift_enable = A1_42
    return true
  end
  return false
end
function areaDrift()
  Fn_findAreaHandle(_drift_area):setDriftEnable(_drift_enable)
end
function requestMoveArea(A0_43, A1_44)
  if _move_request == false then
    print("requestMoveArea : " .. tostring(A0_43) .. " | " .. tostring(A1_44))
    _move_request = A0_43
    _move_id = A1_44
    _move_end = false
    return true
  end
  return false
end
function isAreaMoveEnd()
  local L0_45, L1_46
  L0_45 = _move_end
  return L0_45
end
function requestWarpArea(A0_47, A1_48, A2_49)
  if not _warp_request then
    print("***** requestWarpArea *****")
    _warp_request = true
    _warp_area = A0_47
    _warp_node = A1_48
    _warp_dist = A2_49
    _warp_end = false
    return true
  end
  return false
end
function isAreaWarpEnd()
  local L0_50, L1_51
  L0_50 = _warp_end
  return L0_50
end
function requestPauseArea(A0_52, A1_53)
  if not _pause_request then
    print("***** requestPauseArea *****")
    _pause_request = true
    _pause_area = A0_52
    _pause_value = A1_53
    return true
  end
  return false
end
function requestStopArea(A0_54)
  if not _stop_request then
    print("***** requestStopArea *****")
    _stop_request = true
    _stop_area = A0_54
    return true
  end
  return false
end
function requestGravityOreMax(A0_55)
  local L1_56
  if A0_55 == "litho_02" then
    L1_56 = _litho_02_ore
    return L1_56
  elseif A0_55 == "litho_04" then
    L1_56 = _litho_04_ore
    return L1_56
  elseif A0_55 == "litho_08" then
    L1_56 = _litho_08_ore
    return L1_56
  else
    L1_56 = nil
    return L1_56
  end
end
function requestMineInit()
  local L0_57, L1_58
  L0_57 = _mine_init
  return L0_57
end
function requestGemReset(A0_59)
  if not _gem_request then
    _gem_request = true
    _gem_reset_end = false
    _gem_litho = A0_59
    return true
  end
  return false
end
function isGemResetEnd()
  local L0_60, L1_61
  L0_60 = _gem_reset_end
  return L0_60
end
function isOreReady()
  return Fn_sendIsRunMine()
end
function requestHandle(A0_62, A1_63)
  if findGameObject2(A0_62, A1_63) == nil then
    return nil
  else
    return (findGameObject2(A0_62, A1_63))
  end
end
function gemLoad(A0_64)
  local L1_65, L2_66, L3_67
  L1_65 = loadFileAsset
  L2_66 = "evb"
  L3_67 = "evx/ep03_gem"
  L1_65 = L1_65(L2_66, L3_67)
  L2_66 = string
  L2_66 = L2_66.format
  L3_67 = "evarea2_az_a_%02d_%02d"
  L2_66 = L2_66(L3_67, _gem_table[A0_64].island, _gem_table[A0_64].set)
  if L1_65 then
    L3_67 = print
    L3_67("***** lithograph_id:" .. A0_64 .. " gem spawn : " .. L2_66 .. " *****")
    L3_67 = L1_65.wait
    L3_67(L1_65)
    L3_67 = L1_65.findBundle
    L3_67 = L3_67(L1_65, L2_66)
    _gem_table[A0_64].hdl = EventData:create(L2_66, nil, L3_67)
    _gem_table[A0_64].hdl:try_init()
    _gem_table[A0_64].hdl:waitForReady()
    _gem_table[A0_64].hdl:try_start()
  end
end
function gemReset(A0_68)
  local L1_69, L2_70, L3_71
  L1_69 = _gem_table
  L1_69 = L1_69[A0_68]
  L1_69 = L1_69.hdl
  L2_70 = L1_69
  L1_69 = L1_69.try_term
  L1_69(L2_70)
  L1_69 = _gem_table
  L1_69 = L1_69[A0_68]
  L1_69.hdl = nil
  L1_69 = reloadFileAsset
  L2_70 = "evb"
  L3_71 = "evx/ep03_gem"
  L1_69 = L1_69(L2_70, L3_71)
  L2_70 = string
  L2_70 = L2_70.format
  L3_71 = "evarea2_az_a_%02d_%02d"
  L2_70 = L2_70(L3_71, _gem_table[A0_68].island, _gem_table[A0_68].set)
  if L1_69 then
    L3_71 = print
    L3_71("***** gem spawn : " .. L2_70 .. " *****")
    L3_71 = L1_69.wait
    L3_71(L1_69)
    L3_71 = L1_69.findBundle
    L3_71 = L3_71(L1_69, L2_70)
    _gem_table[A0_68].hdl = EventData:create(L2_70, nil, L3_71)
    _gem_table[A0_68].hdl:try_init()
    _gem_table[A0_68].hdl:waitForReady()
    _gem_table[A0_68].hdl:try_start()
  end
  _gem_reset_end = true
end
function createGem(A0_72, A1_73)
  local L2_74, L3_75, L4_76
  L3_75 = A0_72
  L2_74 = A0_72.getName
  L2_74 = L2_74(L3_75)
  if L2_74 ~= nil then
    L3_75 = print
    L4_76 = "***** Gam create : "
    L4_76 = L4_76 .. L2_74 .. " *****"
    L3_75(L4_76)
    L3_75 = createGameObject2
    L4_76 = "Gem"
    L3_75 = L3_75(L4_76)
    L4_76 = L3_75.setName
    L4_76(L3_75, L2_74)
    L4_76 = L3_75.setGemModelNo
    L4_76(L3_75, A1_73)
    L4_76 = A0_72.getWorldPos
    L4_76 = L4_76(A0_72)
    L4_76 = L4_76 + Vector(0, 0, 0)
    L3_75:setWorldPos(L4_76)
    L3_75:setForceMove()
    L3_75:setVisibleBlockHalfSize(150)
    L3_75:setVisible(true)
    L3_75:try_init()
    L3_75:waitForReadyAsync(function()
      L3_75:try_start()
    end)
    return L3_75
  else
  end
  L3_75 = nil
  return L3_75
end
_vitalGem_time = 20
function vitalGemrReset(A0_77)
  if A0_77 ~= nil then
    _vitalGem_time = A0_77
  end
  GlobalGem:SetVitalGemGetCallback("vitalGemReCreate")
end
function vitalGemReCreate(A0_78)
  invokeTask(function()
    waitSeconds(_vitalGem_time)
    createGem(A0_78, 5)
  end)
end
_enargygem_time = 20
function enargyGemrReset(A0_79)
  if A0_79 ~= nil then
    _enargygem_time = A0_79
  end
  GlobalGem:SetEnargyGemGetCallback("enargyGemReCreate")
end
function enargyGemReCreate(A0_80)
  invokeTask(function()
    waitSeconds(_enargygem_time)
    createGem(A0_80, 4)
  end)
end
_specialgem_time = 60
function specialGemrReset(A0_81)
  if A0_81 ~= nil then
    _specialgem_time = A0_81
  end
  GlobalGem:SetSpecialGemGetCallback("specialGemReCreate")
end
function specialGemReCreate(A0_82)
  invokeTask(function()
    waitSeconds(_specialgem_time)
    createGem(A0_82, 6)
  end)
end
hand_ore = 10
function mineInitLitho()
  local L0_83, L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93, L11_94
  L0_83 = Fn_getMissionPart
  L0_83 = L0_83()
  repeat
    L1_84 = wait
    L1_84()
    L1_84 = isOreReady
    L1_84 = L1_84()
  until L1_84
  L1_84 = true
  for L5_88, L6_89 in L2_85(L3_86) do
    if L5_88 ~= 4 then
      L7_90 = _gem_table
      L7_90 = L7_90[L5_88]
      L7_90 = L7_90.island
      if L6_89 then
        L11_94 = "gravityore_az_a_%02d_h%02d"
        L11_94 = " : true     *****"
        L8_91(L9_92)
        for L11_94 = 1, hand_ore do
          ore_active(string.format("gravityore_az_a_%02d_h%02d_%02d", L7_90, L5_88, L11_94), true)
        end
      elseif L6_89 == false and L1_84 == true then
        L11_94 = "gravityore_az_a_%02d_h%02d"
        L11_94 = " : true end *****"
        L8_91(L9_92)
        for L11_94 = 1, hand_ore do
          ore_active(string.format("gravityore_az_a_%02d_h%02d_%02d", L7_90, L5_88, L11_94), true)
        end
      elseif L6_89 == false then
        L11_94 = "gravityore_az_a_%02d_h%02d"
        L11_94 = " : false    *****"
        L8_91(L9_92)
        for L11_94 = 1, hand_ore do
          ore_active(string.format("gravityore_az_a_%02d_h%02d_%02d", L7_90, L5_88, L11_94), false)
        end
        L11_94 = "lithograph_%02d"
        L11_94 = " & "
        L8_91(L9_92)
        L11_94 = "lithograph_%02d"
        L11_94 = L10_93(L11_94, L5_88)
        L8_91(L9_92, L10_93)
        L11_94 = "hand_%02d"
        L11_94 = L10_93(L11_94, L5_88)
        L8_91(L9_92, L10_93)
      end
    end
    L1_84 = L6_89
  end
  L6_89 = -1
  L11_94 = L4_87(L5_88, L6_89)
  if L2_85 >= 8 then
    for L6_89 = 1, hand_ore do
      L7_90 = ore_active
      L7_90(L8_91, L9_92)
    end
  end
  _mine_init = true
end
function hand_ore_set(A0_95)
  invokeTask(function()
    local L0_96, L1_97, L2_98, L3_99, L4_100
    L0_96 = _gem_table
    L0_96 = L0_96[L1_97]
    L0_96 = L0_96.island
    L1_97(L2_98)
    for L4_100 = 1, hand_ore do
      ore_active(string.format("gravityore_az_a_%02d_h%02d_%02d", L0_96, A0_95, L4_100), true)
    end
    if L1_97 <= L2_98 then
      L4_100 = "lithograph_%02d"
      L4_100 = " & "
      L1_97(L2_98)
      L4_100 = "lithograph_%02d"
      L4_100 = L3_99(L4_100, A0_95)
      L1_97(L2_98, L3_99)
      L4_100 = "hand_%02d"
      L4_100 = L3_99(L4_100, A0_95)
      L1_97(L2_98, L3_99)
    end
  end)
end
function ore_active(A0_101, A1_102)
  if Fn_getGravityOre2(A0_101) ~= nil then
    Fn_getGravityOre2(A0_101):setActive(A1_102)
    Fn_getGravityOre2(A0_101):setVisiblePermission(A1_102)
    return true
  end
  return false
end
function requestOreActive(A0_103, A1_104)
  if not _ore_active_request then
    _ore_active_name = A0_103
    _ore_active = A1_104
    _ore_active_request = true
    return true
  end
  return false
end
function LithographStart()
  _litho_ctrls:LithographStart()
end
function isLithographStart()
  return _litho_ctrls:isLithographStart()
end
function setFirstHalfProcessEnd()
  _litho_ctrls:setFirstHalfProcessEnd()
end
function isFirstHalfProcessEnd()
  return _litho_ctrls:isFirstHalfProcessEnd()
end
function missionComplete()
  invokeTask(function()
    requestMoveArea("LITHO_MOVE")
    _litho_ctrls:missionComplete()
  end)
end
function setSecondHalfProcessEnd()
  _litho_ctrls:setSecondHalfProcessEnd()
end
function isSecondHalfProcessStart()
  return _litho_ctrls:isSecondHalfProcessStart()
end
function isSecondHalfProcessEventStart()
  return _litho_ctrls:isSecondHalfProcessEventStart()
end
function isSecondHalfProcessEnd()
  return _litho_ctrls:isSecondHalfProcessEnd()
end
function isSecondHalfProcessWait()
  return _litho_ctrls:isSecondHalfProcessWait()
end
function missionFailure()
  invokeTask(function()
    _litho_ctrls:missionFailure()
  end)
end
function isFailureProcessEnd()
  return _litho_ctrls:isFailureProcessEnd()
end
function missionTextVisible(A0_105)
  _litho_ctrls:setMissionEnable(A0_105)
end
function guideEffAllOff()
  return _litho_ctrls:guideEffAllOff()
end
function guideEffOff()
  return _litho_ctrls:guideEffOff()
end
function azSeUnload()
  return _litho_ctrls:azSeUnload()
end
function isMissionview()
  return _litho_ctrls:isMissionview()
end
function setSecondHalfProcessPre()
  return _litho_ctrls:setSecondHalfProcessPre()
end
function isSecondHalfProcessPreStart()
  return _litho_ctrls:isSecondHalfProcessPreStart()
end
function setSecondHalfProcessPreEnd()
  return _litho_ctrls:setSecondHalfProcessPreEnd()
end
_disp_mission_01 = false
_disp_mission_02 = false
function ViewMission()
  invokeTask(function()
    if Fn_getMissionPart() == "ep03_a" or Fn_getMissionPart() == "ep03_b" then
      if _disp_mission_01 == false then
        if GameDatabase:get(ggd.GlobalSystemFlags__GameRetry) then
          _disp_mission_01 = true
          Fn_missionView("ep03_00101", nil, nil, true)
        else
          _disp_mission_01 = true
          Fn_missionView("ep03_00101")
        end
      else
        Fn_missionView("ep03_00101", nil, nil, true)
      end
    elseif _disp_mission_02 == false then
      if GameDatabase:get(ggd.GlobalSystemFlags__GameRetry) then
        _disp_mission_02 = true
        Fn_missionView("ep03_01004", nil, nil, true)
      else
        _disp_mission_02 = true
        Fn_missionView("ep03_01004")
      end
    else
      Fn_missionView("ep03_01004", nil, nil, true)
    end
  end)
end
function Finalize()
  azSeUnload()
  if _poison_timer_task ~= nil then
    _poison_timer_task:abort()
  end
  if _poison_first_timer ~= nil then
    _poison_first_timer:abort()
  end
  if Fn_getPlayer() then
    Player:applyPoisonDamage(0, 0.01)
  end
  if _poison_se ~= nil then
    Sound:stopSEHandle(_poison_se)
    _poison_se = nil
  end
end
