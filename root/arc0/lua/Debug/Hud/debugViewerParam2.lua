asset_table2 = {
  play_speed_tbl = {
    1,
    0.5,
    0.25,
    0.1,
    0.033,
    3,
    2,
    1.5
  },
  {
    asset_name = "challenge_result_coin",
    anim = {
      {
        name = "in",
        {
          node = "loc_score_ctl",
          anim = "in"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "in"
        }
      },
      {
        name = "out",
        {
          node = "loc_score_ctl",
          anim = "out"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "out"
        }
      },
      {
        name = "idle",
        {
          node = "loc_score_ctl",
          anim = "idle"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "idle"
        }
      },
      {
        name = "change",
        {
          node = "loc_num_01_obj",
          anim = "change"
        },
        {
          node = "loc_num_02_obj",
          anim = "change"
        },
        {
          node = "loc_num_03_obj",
          anim = "change"
        },
        {
          node = "loc_num_04_obj",
          anim = "change"
        },
        {
          node = "loc_num_05_obj",
          anim = "change"
        },
        {
          node = "loc_num_06_obj",
          anim = "change"
        }
      },
      {
        name = "pos",
        {node = "loc_pos", anim = "pos"}
      }
    }
  },
  {
    asset_name = "treasure_st_timer",
    anim = {
      {
        name = "in",
        {
          node = "loc_timer_ctl",
          anim = "in"
        },
        {node = "loc_base", anim = "in"}
      },
      {
        name = "out",
        {
          node = "loc_timer_ctl",
          anim = "out"
        },
        {node = "loc_base", anim = "out"}
      },
      {
        name = "idle",
        {
          node = "loc_timer_ctl",
          anim = "idle"
        },
        {node = "loc_base", anim = "idle"}
      },
      {
        name = "change",
        {
          node = "loc_timer_01_obj",
          anim = "change"
        },
        {
          node = "loc_timer_02_obj",
          anim = "change"
        },
        {
          node = "loc_timer_03_obj",
          anim = "change"
        },
        {
          node = "loc_timer_04_obj",
          anim = "change"
        },
        {
          node = "loc_timer_05_obj",
          anim = "change"
        },
        {
          node = "loc_timer_06_obj",
          anim = "change"
        },
        {
          node = "loc_timer_07_obj",
          anim = "change"
        }
      }
    }
  },
  {
    asset_name = "talisman_rt_sepa",
    anim = {
      {
        name = "in",
        {node = "loc_stone", anim = "in"}
      },
      {
        name = "analyze",
        {node = "loc_stone", anim = "out"},
        {node = "loc_tal", anim = "in"}
      },
      {
        name = "out",
        {node = "loc_tal", anim = "out"}
      },
      {
        name = "idle",
        {node = "loc_tal", anim = "idle"}
      },
      {
        name = "change",
        {node = "loc_change", anim = "change"}
      },
      {
        name = "cursor_in",
        {node = "loc_cursor", anim = "in"},
        {node = "loc_tal", anim = "selectin"}
      },
      {
        name = "cursor_out",
        {node = "loc_cursor", anim = "out"},
        {node = "loc_tal", anim = "selectout"}
      },
      {
        name = "cursor_idle",
        {node = "loc_cursor", anim = "idle"},
        {node = "loc_tal", anim = "selectidle"}
      },
      {
        name = "rot",
        {node = "loc_rot", anim = "rot"}
      }
    }
  },
  {
    asset_name = "camera_guide",
    text = {
      {
        node = "loc_right_text",
        text_id = "ui_camera_guide_01"
      }
    },
    anim = {
      {
        name = "in",
        {node = "loc_root", anim = "in"}
      },
      {
        name = "out",
        {node = "loc_root", anim = "out"}
      },
      {
        name = "idle",
        {node = "loc_root", anim = "idle"}
      },
      {
        name = "change",
        {node = "loc_root", anim = "change"}
      },
      {
        name = "press",
        {
          node = "loc_photomode_key_01",
          anim = "press"
        },
        {
          node = "loc_photomode_key_02",
          anim = "press"
        },
        {
          node = "loc_right_text",
          anim = "press"
        },
        {
          node = "loc_left_text",
          anim = "press"
        }
      }
    }
  },
  {
    asset_name = "ch_ghost_vs",
    text = {
      {
        node = "ui_ch_ghost_vs",
        text_id = "ui_ch_ghost_vs"
      }
    },
    anim = {
      {
        name = "in",
        {node = "loc_base", anim = "in"},
        {
          node = "loc_right_btn",
          anim = "in"
        },
        {
          node = "loc_left_btn",
          anim = "in"
        }
      },
      {
        name = "out",
        {node = "loc_base", anim = "out"},
        {
          node = "loc_right_btn",
          anim = "out"
        },
        {
          node = "loc_left_btn",
          anim = "out"
        }
      },
      {
        name = "idle",
        {node = "loc_base", anim = "idle"},
        {
          node = "loc_right_btn",
          anim = "idle"
        },
        {
          node = "loc_left_btn",
          anim = "idle"
        }
      },
      {
        name = "to_left",
        {
          node = "loc_left_btn",
          anim = "to_left"
        }
      },
      {
        name = "to_right",
        {
          node = "loc_right_btn",
          anim = "to_right"
        }
      },
      {
        name = "scale",
        {node = "loc_scale", anim = "scale"}
      }
    }
  },
  {
    asset_name = "ch_ghost_user",
    text = {
      {
        node = "ui_ch_ghost_userid",
        text_id = "aaaa"
      }
    },
    anim = {
      {
        name = "in",
        {
          node = "loc_score_ctl",
          anim = "in"
        },
        {
          node = "loc_friends_ctl",
          anim = "in"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "in"
        },
        {
          node = "loc_user_ctl",
          anim = "in"
        }
      },
      {
        name = "out",
        {
          node = "loc_score_ctl",
          anim = "out"
        },
        {
          node = "loc_friends_ctl",
          anim = "out"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "out"
        },
        {
          node = "loc_user_ctl",
          anim = "out"
        }
      },
      {
        name = "idle",
        {
          node = "loc_score_ctl",
          anim = "idle"
        },
        {
          node = "loc_friends_ctl",
          anim = "idle"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "idle"
        },
        {
          node = "loc_user_ctl",
          anim = "idle"
        }
      },
      {
        name = "to_right",
        {
          node = "loc_score_ctl",
          anim = "to_right"
        },
        {
          node = "loc_friends_ctl",
          anim = "to_right"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "to_right"
        },
        {
          node = "loc_user_ctl",
          anim = "to_right"
        }
      },
      {
        name = "to_left",
        {
          node = "loc_score_ctl",
          anim = "to_left"
        },
        {
          node = "loc_friends_ctl",
          anim = "to_left"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "to_left"
        },
        {
          node = "loc_user_ctl",
          anim = "to_left"
        }
      },
      {
        name = "from_right",
        {
          node = "loc_score_ctl",
          anim = "from_right"
        },
        {
          node = "loc_friends_ctl",
          anim = "from_right"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "from_right"
        },
        {
          node = "loc_user_ctl",
          anim = "from_right"
        }
      },
      {
        name = "from_left",
        {
          node = "loc_score_ctl",
          anim = "from_left"
        },
        {
          node = "loc_friends_ctl",
          anim = "from_left"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "from_left"
        },
        {
          node = "loc_user_ctl",
          anim = "from_left"
        }
      },
      {
        name = "change_num",
        {
          node = "loc_num_01_obj",
          anim = "change"
        },
        {
          node = "loc_num_02_obj",
          anim = "change"
        },
        {
          node = "loc_num_03_obj",
          anim = "change"
        },
        {
          node = "loc_num_04_obj",
          anim = "change"
        }
      },
      {
        name = "change_icon",
        {
          node = "ch_ghost_friends_icon_obj",
          anim = "change"
        }
      }
    }
  },
  {
    asset_name = "ch_ghost_coin",
    anim = {
      {
        name = "in",
        {
          node = "loc_score_ctl",
          anim = "in"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "in"
        }
      },
      {
        name = "out",
        {
          node = "loc_score_ctl",
          anim = "out"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "out"
        }
      },
      {
        name = "idle",
        {
          node = "loc_score_ctl",
          anim = "idle"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "idle"
        }
      },
      {
        name = "to_right",
        {
          node = "loc_score_ctl",
          anim = "to_right"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "to_right"
        }
      },
      {
        name = "to_left",
        {
          node = "loc_score_ctl",
          anim = "to_left"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "to_left"
        }
      },
      {
        name = "from_right",
        {
          node = "loc_score_ctl",
          anim = "from_right"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "from_right"
        }
      },
      {
        name = "from_left",
        {
          node = "loc_score_ctl",
          anim = "from_left"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "from_left"
        }
      },
      {
        name = "change_num",
        {
          node = "loc_num_01_obj",
          anim = "change"
        },
        {
          node = "loc_num_02_obj",
          anim = "change"
        },
        {
          node = "loc_num_03_obj",
          anim = "change"
        },
        {
          node = "loc_num_04_obj",
          anim = "change"
        },
        {
          node = "loc_num_05_obj",
          anim = "change"
        },
        {
          node = "loc_num_06_obj",
          anim = "change"
        }
      }
    }
  },
  {
    asset_name = "ch_ghost_score_set",
    text = {
      {
        node = "ui_ch_ghost_userid",
        text_id = "aaaa"
      }
    },
    anim = {
      {
        name = "in",
        {
          node = "loc_score_ctl",
          anim = "in"
        },
        {
          node = "loc_timer_ctl",
          anim = "in"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "in"
        }
      },
      {
        name = "out",
        {
          node = "loc_score_ctl",
          anim = "out"
        },
        {
          node = "loc_timer_ctl",
          anim = "out"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "out"
        }
      },
      {
        name = "idle",
        {
          node = "loc_score_ctl",
          anim = "idle"
        },
        {
          node = "loc_timer_ctl",
          anim = "idle"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "idle"
        }
      },
      {
        name = "to_right",
        {
          node = "loc_score_ctl",
          anim = "to_right"
        },
        {
          node = "loc_timer_ctl",
          anim = "to_right"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "to_right"
        }
      },
      {
        name = "to_left",
        {
          node = "loc_score_ctl",
          anim = "to_left"
        },
        {
          node = "loc_timer_ctl",
          anim = "to_left"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "to_left"
        }
      },
      {
        name = "from_right",
        {
          node = "loc_score_ctl",
          anim = "from_right"
        },
        {
          node = "loc_timer_ctl",
          anim = "from_right"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "from_right"
        }
      },
      {
        name = "from_left",
        {
          node = "loc_score_ctl",
          anim = "from_left"
        },
        {
          node = "loc_timer_ctl",
          anim = "from_left"
        },
        {
          node = "loc_ch_base_ctl",
          anim = "from_left"
        }
      },
      {
        name = "change_num",
        {
          node = "loc_num_01_obj",
          anim = "change"
        },
        {
          node = "loc_num_02_obj",
          anim = "change"
        },
        {
          node = "loc_num_03_obj",
          anim = "change"
        },
        {
          node = "loc_num_04_obj",
          anim = "change"
        },
        {
          node = "loc_num_05_obj",
          anim = "change"
        },
        {
          node = "loc_num_06_obj",
          anim = "change"
        },
        {
          node = "loc_timer_01_obj",
          anim = "change"
        },
        {
          node = "loc_timer_02_obj",
          anim = "change"
        },
        {
          node = "loc_timer_03_obj",
          anim = "change"
        },
        {
          node = "loc_timer_04_obj",
          anim = "change"
        },
        {
          node = "loc_timer_05_obj",
          anim = "change"
        },
        {
          node = "loc_timer_06_obj",
          anim = "change"
        },
        {
          node = "loc_timer_07_obj",
          anim = "change"
        }
      }
    }
  },
  {
    asset_name = "game_over_button",
    db_value = {
      {
        key = "text01",
        value = "ui_gameover_selects_01"
      },
      {
        key = "ui_gameover_selects_01",
        value = 382
      },
      {key = "text02", value = " "}
    },
    anim = {
      {
        name = "in",
        {
          node = "loc_ch_selects_1_ctl",
          anim = "slin"
        }
      },
      {
        name = "out",
        {
          node = "loc_ch_selects_1_ctl",
          anim = "slout"
        }
      },
      {
        name = "idle",
        {
          node = "loc_ch_selects_1_ctl",
          anim = "slidle"
        }
      },
      {
        name = "scale",
        {node = "loc_scale", anim = "scale"}
      },
      {
        name = "press",
        {node = "loc_press", anim = "press"},
        {
          node = "loc_ch_selects_1",
          anim = "press"
        }
      },
      {
        name = "active_in",
        {
          node = "loc_ch_selects_1",
          anim = "active_in"
        }
      },
      {
        name = "active_out",
        {
          node = "loc_ch_selects_1",
          anim = "active_out"
        }
      },
      {
        name = "active",
        {
          node = "loc_ch_selects_1",
          anim = "active"
        }
      },
      {
        name = "non_active",
        {
          node = "loc_ch_selects_1",
          anim = "non_active"
        }
      }
    }
  },
  {
    asset_name = "hud_target",
    anim = {
      {
        name = "in",
        {
          node = "loc_center_root",
          anim = "in"
        },
        {
          node = "loc_blue_root",
          anim = "in"
        },
        {
          node = "loc_red_root",
          anim = "in"
        }
      },
      {
        name = "out",
        {
          node = "loc_center_root",
          anim = "out"
        },
        {
          node = "loc_blue_root",
          anim = "out"
        },
        {
          node = "loc_red_root",
          anim = "out"
        }
      },
      {
        name = "idle",
        {
          node = "loc_center_root",
          anim = "idle"
        },
        {
          node = "loc_blue_root",
          anim = "idle"
        },
        {
          node = "loc_red_root",
          anim = "idle"
        }
      },
      {
        name = "scale",
        {
          node = "loc_red_ctl",
          anim = "scale"
        },
        {
          node = "loc_blue_ctl",
          anim = "scale"
        }
      },
      {
        name = "blue_line",
        {
          node = "loc_blue_line_ctl",
          anim = "blue_line"
        }
      }
    }
  }
}
