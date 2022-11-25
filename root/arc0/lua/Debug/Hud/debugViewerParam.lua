asset_table = {
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
    asset_name = "hud_target_lock",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "hud_gg",
    inout_anim_node = "loc_root",
    in_anim_name = "in",
    out_anim_name = "out",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_gg_blue",
        anim = {"ggbar"}
      },
      {
        name = "loc_bounce",
        anim = {"bounce"}
      },
      {
        name = "loc_gg_blue_full",
        anim = {"gg_full"}
      },
      {
        name = "loc_blue_bar",
        anim = {
          "bluein",
          "blueout",
          "blueidle"
        }
      },
      {
        name = "loc_orange_bar",
        anim = {
          "orangein",
          "orangeout",
          "orangeidle"
        }
      },
      {
        name = "loc_red_bar",
        anim = {
          "redin",
          "redout",
          "redidle"
        }
      },
      {
        name = "loc_black_ring",
        anim = {
          "blackin",
          "blackout",
          "blackdle"
        }
      },
      {
        name = "loc_effect_rot",
        anim = {
          "efin",
          "efout",
          "efidle"
        }
      },
      {
        name = "loc_orange_flick",
        anim = {
          "flin",
          "flout",
          "flidle"
        }
      }
    }
  },
  {
    asset_name = "camera_shutter",
    node = {
      {
        name = "loc_root",
        anim = {"press"}
      }
    }
  },
  {
    asset_name = "costume_page_num",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_02_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "costume_effect",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_color_ctl",
        anim = {"color"}
      }
    }
  },
  {
    asset_name = "costume_pic",
    db_value = {
      {
        key = "ui_costume_01",
        value = "ui_costume_02"
      },
      {
        key = "button_circle",
        value = "button_cross"
      }
    },
    node = {
      {
        name = "loc_pic_root",
        anim = {
          "in",
          "out",
          "idle",
          "slin",
          "slidle",
          "slout",
          "press"
        }
      }
    }
  },
  {
    asset_name = "gesture_window",
    text = {
      {
        node = "loc_btn_01",
        text_id = "ui_gesture_01"
      },
      {
        node = "loc_btn_02",
        text_id = "ui_gesture_02"
      },
      {
        node = "loc_btn_03",
        text_id = "ui_gesture_03"
      },
      {
        node = "loc_btn_04",
        text_id = "ui_gesture_04"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "game_yesno_layout",
    text = {
      {
        node = "loc_game_yesno_window",
        text_id = "game_yesno_window"
      },
      {
        node = "loc_game_yesno_button_01",
        text_id = "game_yesno_button"
      },
      {
        node = "loc_game_yesno_button_02",
        text_id = "game_yesno_button"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "game_yesno_window",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_debug_caption_14"
      },
      {
        node = "loc_text_02",
        text_id = "ui_debug_caption_15"
      },
      {
        node = "loc_libely_base2",
        text_id = "loc_libely_base2"
      },
      {
        node = "loc_libely_base3",
        text_id = "loc_libely_base3"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "game_yesno_button",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_game_yesno_01"
      }
    },
    db_value = {
      {
        key = "photomode_key_01",
        value = "photomode_key_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "press",
          "start1",
          "start2"
        }
      }
    }
  },
  {
    asset_name = "event_guide_btn",
    db_value = {
      {
        key = "photomode_key_01",
        value = "photomode_key_03"
      }
    },
    text = {
      {
        node = "text_01",
        text_id = "event_guide_btn_01"
      },
      {
        node = "text_02",
        text_id = "event_guide_btn_02"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "press"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "event_guide_layout",
    text = {
      {
        node = "event_guide_btn_01",
        text_id = "event_guide_btn_01"
      },
      {
        node = "event_guide_btn_02",
        text_id = "event_guide_btn_02"
      },
      {
        node = "event_guide_btn_03",
        text_id = "event_guide_btn_03"
      },
      {
        node = "event_guide_btn_04",
        text_id = "event_guide_btn_04"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_btn_ctl",
        anim = {"pos"}
      }
    }
  },
  {
    asset_name = "system_menu_btn",
    db_value = {
      {
        key = "text01",
        value = "ui_system_menu_1_1_1"
      },
      {
        key = "text02",
        value = "ui_system_menu_2_1_1"
      },
      {
        key = "text03",
        value = "ui_system_menu_3_1_1"
      }
    },
    node = {
      {
        name = "loc_btn_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_layout",
    text = {
      {
        node = "loc_info_spec_psnid",
        text_id = "loc_info_spec_psnid"
      },
      {
        node = "loc_info_spec_bar_1",
        text_id = "loc_info_spec_bar_1"
      },
      {
        node = "loc_info_spec_bar_2",
        text_id = "loc_info_spec_bar_2"
      },
      {
        node = "loc_info_spec_bar_3",
        text_id = "loc_info_spec_bar_3"
      },
      {
        node = "loc_text_01",
        text_id = "ui_info_spec_header_1_1"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_spec_bar",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_info_spec_category_1"
      },
      {
        node = "loc_text_02",
        text_id = "ui_info_spec_cnt_1"
      },
      {
        node = "loc_text_03",
        text_id = "ui_info_spec_main_1_1"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_icon",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_06",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_07",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_08",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_09",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "info_spec_psnid",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_info_spec_psnid"
      }
    },
    db_value = {
      {
        key = "ch_ghost_user",
        value = "ch_ghost_user_07"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_spec_screen_pic",
    db_value = {
      {
        key = "color_white",
        value = "ingame_pre_02"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "oshirase_main_list",
    text = {
      {
        node = "loc_oshirase_main_list_item",
        text_id = "loc_oshirase_main_list_item"
      },
      {
        node = "loc_text_01",
        text_id = "ui_oshirase_main_1_01"
      },
      {
        node = "loc_text_02",
        text_id = "ui_oshirase_main_2_01"
      }
    },
    db_value = {
      {
        key = "button_circle",
        value = "button_cross"
      }
    },
    node = {
      {
        name = "loc_root_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "move_up",
          "move_down"
        }
      },
      {
        name = "loc_active_ctl",
        anim = {
          "slin",
          "slout",
          "slidle",
          "press"
        }
      },
      {
        name = "loc_icon",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "oshirase_main_filter_btn",
    db_value = {
      {
        key = "text01",
        value = "ui_oshirase_filter_1_1"
      },
      {
        key = "text02",
        value = "ui_oshirase_filter_2_1"
      },
      {
        key = "button_circle",
        value = "button_cross"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "slin",
          "slout",
          "slidle"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "oshirase_main_filter",
    text = {
      {
        node = "loc_filter_btn_1",
        text_id = "loc_filter_btn_1"
      },
      {
        node = "loc_filter_btn_2",
        text_id = "loc_filter_btn_2"
      },
      {
        node = "loc_filter_btn_3",
        text_id = "loc_filter_btn_3"
      },
      {
        node = "loc_filter_btn_4",
        text_id = "loc_filter_btn_4"
      },
      {
        node = "loc_filter_btn_5",
        text_id = "loc_filter_btn_5"
      },
      {
        node = "loc_filter_btn_6",
        text_id = "loc_filter_btn_6"
      },
      {
        node = "loc_filter_btn_7",
        text_id = "loc_filter_btn_7"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "oshirase_main_list_item",
    db_value = {
      {
        key = "color_white",
        value = "oshirase_item_08"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_keta_pos",
        anim = {"keta_pos"}
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "oshirase_main_header",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_oshirase_main_header_01"
      },
      {
        node = "loc_text_01",
        text_id = "loc_text_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "oshirase_scrollbar",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "oshirase_main_layout",
    text = {
      {
        node = "loc_oshirase_main_header",
        text_id = "oshirase_main_header"
      },
      {
        node = "loc_list_01",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_list_02",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_list_03",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_list_04",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_list_05",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_list_06",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_list_07",
        text_id = "oshirase_main_list"
      },
      {
        node = "loc_oshirase_main_filter",
        text_id = "oshirase_main_filter"
      },
      {
        node = "loc_oshirase_scrollbar",
        text_id = "oshirase_scrollbar"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "oshirase_popup",
    db_value = {
      {
        key = "color_white",
        value = "ch_ghost_user"
      }
    },
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_oshirase_popup_1_01"
      },
      {
        node = "loc_text_02",
        text_id = "ui_oshirase_popup_2_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "powerup_level_spec",
    text = {
      {node = "loc_pos_1", text_id = "loc_pos_1"},
      {node = "loc_pos_2", text_id = "loc_pos_2"},
      {node = "loc_pos_3", text_id = "loc_pos_3"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "powerup_level_spec",
    text = {
      {node = "loc_pos_1", text_id = "loc_pos_1"},
      {node = "loc_pos_2", text_id = "loc_pos_2"},
      {node = "loc_pos_3", text_id = "loc_pos_3"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "powerup_level_spec_cnt",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_pup_level_spec_1_01"
      },
      {
        node = "loc_text_02",
        text_id = "ui_pup_level_spec_1_02"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "power_up_level_line",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "power_up_header",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_pup_header_01"
      },
      {
        node = "loc_text_02",
        text_id = "ui_pup_category_01"
      },
      {
        node = "loc_text_03",
        text_id = "ui_pup_content_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "change"
        }
      }
    }
  },
  {
    asset_name = "power_up_category",
    text = {
      {node = "loc_ctl_01", text_id = "loc_ctl_01"},
      {node = "loc_ctl_02", text_id = "loc_ctl_02"},
      {node = "loc_ctl_03", text_id = "loc_ctl_03"},
      {node = "loc_ctl_04", text_id = "loc_ctl_04"},
      {node = "loc_ctl_05", text_id = "loc_ctl_05"},
      {node = "loc_ctl_06", text_id = "loc_ctl_06"}
    },
    node = {
      {
        name = "loc_category_root",
        anim = {
          "in",
          "out",
          "idle",
          "slin",
          "slout",
          "slidle",
          "levelup"
        }
      },
      {
        name = "loc_keta_ctl",
        anim = {"keta_pos"}
      },
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce"}
      }
    }
  },
  {
    asset_name = "power_up_layout_01",
    text = {
      {
        node = "loc_header",
        text_id = "power_up_header"
      },
      {
        node = "loc_category_01",
        text_id = "power_up_category"
      },
      {
        node = "loc_category_02",
        text_id = "power_up_category"
      },
      {
        node = "loc_category_03",
        text_id = "power_up_category"
      },
      {
        node = "loc_category_04",
        text_id = "power_up_category"
      },
      {
        node = "loc_category_05",
        text_id = "power_up_category"
      },
      {
        node = "loc_category_06",
        text_id = "power_up_category"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "next",
          "back"
        }
      }
    }
  },
  {
    asset_name = "power_up_level",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_pup_level_skill_01"
      },
      {
        node = "loc_text_02",
        text_id = "ui_pup_level_skill_01"
      },
      {
        node = "loc_text_03",
        text_id = "ui_pup_level_skill_01"
      },
      {
        node = "loc_text_04",
        text_id = "ui_pup_level_tune_01"
      },
      {
        node = "loc_text_05",
        text_id = "ui_pup_level_tune_02"
      },
      {
        node = "loc_text_06",
        text_id = "ui_pup_level_tune_03"
      }
    },
    node = {
      {
        name = "loc_line_root",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right"
        }
      },
      {
        name = "loc_num_color",
        anim = {"color"}
      },
      {
        name = "loc_keta_ctl",
        anim = {"keta_pos"}
      },
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_05",
        anim = {"bounce"}
      }
    }
  },
  {
    asset_name = "power_up_level_guide",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_pup_level_01"
      }
    },
    db_value = {
      {
        key = "button_circle",
        value = "button_cross"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "change"
        }
      }
    }
  },
  {
    asset_name = "power_up_layout_02",
    text = {
      {
        node = "loc_header",
        text_id = "power_up_header"
      },
      {
        node = "loc_category",
        text_id = "power_up_category"
      },
      {
        node = "loc_guide",
        text_id = "power_up_level_guide"
      },
      {
        node = "loc_level_00",
        text_id = "00"
      },
      {
        node = "loc_level_01",
        text_id = "01"
      },
      {
        node = "loc_level_02",
        text_id = "02"
      },
      {
        node = "loc_level_03",
        text_id = "03"
      },
      {
        node = "loc_level_04",
        text_id = "04"
      },
      {
        node = "loc_level_05",
        text_id = "05"
      },
      {
        node = "loc_level_06",
        text_id = "06"
      },
      {
        node = "loc_level_07",
        text_id = "07"
      },
      {
        node = "loc_level_08",
        text_id = "08"
      },
      {
        node = "loc_level_spec",
        text_id = "loc_level_spec"
      },
      {
        node = "loc_level_line",
        text_id = "loc_level_line"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "back"
        }
      }
    }
  },
  {
    asset_name = "hud_vs_bar",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "idle2",
          "out"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      },
      {
        name = "loc_left_suzu_01",
        anim = {"blink"}
      },
      {
        name = "loc_left_suzu_02",
        anim = {"blink"}
      },
      {
        name = "loc_left_suzu_03",
        anim = {"blink"}
      },
      {
        name = "loc_right_suzu_01",
        anim = {"blink"}
      },
      {
        name = "loc_right_suzu_02",
        anim = {"blink"}
      },
      {
        name = "loc_right_suzu_03",
        anim = {"blink"}
      }
    }
  },
  {
    asset_name = "credit_01",
    text = {
      {node = "loc_scale", text_id = "loc_scale"},
      {node = "loc_scale2", text_id = "loc_scale2"},
      {
        node = "loc_thunder_scale",
        text_id = "loc_thunder_scale"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_color",
        anim = {"color"}
      },
      {
        name = "loc_scale",
        anim = {"scale_left"}
      },
      {
        name = "loc_scale2",
        anim = {"scale_left"}
      },
      {
        name = "loc_thunder_scale",
        anim = {"scale_left"}
      }
    }
  },
  {
    asset_name = "credit_01_layout",
    text = {
      {node = "loc_pos_1", text_id = "loc_pos_1"},
      {node = "loc_pos_2", text_id = "loc_pos_2"},
      {node = "loc_pos_3", text_id = "loc_pos_3"},
      {node = "loc_pos_4", text_id = "loc_pos_4"},
      {node = "loc_pos_5", text_id = "loc_pos_5"}
    },
    node = {
      {
        name = "loc_root",
        anim = {"idle"}
      }
    }
  },
  {
    asset_name = "network_id_set",
    text = {
      {
        node = "loc_text2",
        text_id = "ui_debug_onlineid_1_2"
      },
      {
        node = "loc_text1",
        text_id = "ui_debug_onlineid_1_1"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      }
    }
  },
  {
    asset_name = "network_id_layout",
    text = {
      {node = "loc_pos_1", text_id = "loc_pos_1"},
      {node = "loc_pos_2", text_id = "loc_pos_2"},
      {node = "loc_pos_3", text_id = "loc_pos_3"},
      {node = "loc_pos_4", text_id = "loc_pos_4"}
    },
    node = {
      {
        name = "loc_line_ctl",
        anim = {
          "in",
          "idle",
          "out"
        }
      }
    }
  },
  {
    asset_name = "counter_popup",
    node = {
      {
        name = "loc_keta_ctl",
        anim = {"pos"}
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {
          "in",
          "idle",
          "out"
        }
      }
    }
  },
  {
    asset_name = "counter_tarisman",
    node = {
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_root_position",
        anim = {"pos1", "pos2"}
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_05",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_ctl_06",
        anim = {"change"}
      },
      {
        name = "loc_num_06",
        anim = {"bounce", "num_in"}
      }
    }
  },
  {
    asset_name = "counter_bar",
    node = {
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_root_position",
        anim = {"pos1", "pos2"}
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "challenge_effect",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      }
    }
  },
  {
    asset_name = "finish_mark",
    text = {
      {
        node = "loc_trans",
        text_id = "ui_camera_guide_01"
      }
    },
    node = {
      {
        name = "loc_root_mark",
        anim = {"in", "idle"}
      },
      {
        name = "loc_trans",
        anim = {"angle"}
      },
      {
        name = "loc_point_arrow",
        anim = {
          "arrow_rotation"
        }
      },
      {
        name = "loc_finish_outside",
        anim = {"idle"}
      },
      {
        name = "loc_lockon",
        anim = {"in", "idle"}
      },
      {
        name = "loc_root_mark_2",
        anim = {"in", "idle"}
      }
    }
  },
  {
    asset_name = "finish_mark_scope",
    node = {
      {
        name = "loc_root",
        anim = {"in", "idle"}
      }
    }
  },
  {
    asset_name = "game_dialogue_layout",
    text = {
      {node = "loc_window", text_id = "loc_window"},
      {node = "loc_top", text_id = "loc_top"},
      {node = "loc_right", text_id = "loc_right"},
      {node = "loc_bottom", text_id = "loc_bottom"},
      {node = "loc_left", text_id = "loc_left"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "game_dialogue_window",
    text = {
      {
        node = "loc_text_2",
        text_id = "ui_debug_caption_14"
      },
      {
        node = "loc_text_3",
        text_id = "ui_debug_caption_15"
      },
      {
        node = "loc_libely_base2",
        text_id = "loc_libely_base2"
      },
      {
        node = "loc_libely_base3",
        text_id = "loc_libely_base3"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "game_dialogue_button",
    text = {
      {
        node = "loc_text",
        text_id = "ui_debug_caption_10"
      }
    },
    db_value = {
      {
        key = "photomode_key_01",
        value = "photomode_key_03"
      },
      {
        key = "photomode_key_01_b",
        value = "photomode_key_03_b"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "press"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "photo_item_num",
    node = {
      {
        name = "loc_root_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_left_arrow",
        anim = {
          "in",
          "out",
          "idle",
          "press"
        }
      },
      {
        name = "loc_right_arrow",
        anim = {
          "in",
          "out",
          "idle",
          "press"
        }
      },
      {
        name = "loc_num_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_04_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "photo_item_header",
    text = {
      {
        node = "loc_text_01",
        text_id = "ui_pitem_name"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "next",
          "prev"
        }
      },
      {
        name = "loc_scale_joint",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "treasure_st_timer",
    node = {
      {
        name = "loc_timer_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_base",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_timer_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_05_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_06_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "network_id_icon",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_point_arrow",
        anim = {
          "arrow_rotation"
        }
      },
      {
        name = "loc_user_ctl",
        anim = {"bounce"}
      }
    }
  },
  {
    asset_name = "network_id",
    text = {
      {
        node = "loc_text2",
        text_id = "ui_debug_onlineid_1_2"
      },
      {
        node = "loc_text1",
        text_id = "ui_debug_onlineid_1_1"
      },
      {node = "loc_trans", text_id = "loc_trans"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_trans",
        anim = {"angle"}
      }
    }
  },
  {
    asset_name = "info_bg_screen",
    db_value = {
      {
        key = "movieclip",
        value = "hud/hud_common_sideup"
      },
      {
        key = "hud/hud_common_sideup",
        value = true
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_layout",
    text = {
      {node = "loc_effect", text_id = "loc_effect"},
      {
        node = "loc_screen_1",
        text_id = "loc_screen_1"
      },
      {
        node = "loc_screen_2",
        text_id = "loc_screen_2"
      },
      {
        node = "loc_screen_3",
        text_id = "loc_screen_3"
      },
      {node = "loc_frame", text_id = "loc_frame"},
      {node = "loc_bg", text_id = "loc_bg"},
      {
        node = "loc_text_01",
        text_id = "ui_debug_text_01_h"
      },
      {
        node = "loc_text_02",
        text_id = "ui_debug_text_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_screen_ctl",
        anim = {"next", "prev"}
      },
      {
        name = "loc_text_ctl",
        anim = {"next", "prev"}
      }
    }
  },
  {
    asset_name = "info_effect",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_screen",
    db_value = {
      {
        key = "movieclip",
        value = "vision/gp_common_01"
      },
      {
        key = "vision/gp_common_01_loop",
        value = true
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "in2",
          "out2",
          "idle2"
        }
      }
    }
  },
  {
    asset_name = "info_screen_pic",
    db_value = {
      {
        key = "color_white",
        value = "photomode_key_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "in2",
          "out2",
          "idle2"
        }
      }
    }
  },
  {
    asset_name = "texture_button",
    db_value = {
      {
        key = "photomode_key_01",
        value = "photomode_key_06"
      },
      {
        key = "photomode_key_02",
        value = "photomode_key_06"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {"idle"}
      }
    }
  },
  {
    asset_name = "info_frame",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_bg",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "talisman_rt_sepa",
    node = {
      {
        name = "loc_stone",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_tal",
        anim = {
          "in",
          "idle",
          "out",
          "selectin",
          "selectout",
          "selectidle"
        }
      },
      {
        name = "loc_cursor",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_change",
        anim = {"change"}
      },
      {
        name = "loc_rot",
        anim = {"rot"}
      }
    }
  },
  {
    asset_name = "tarisman_rt_counter",
    node = {
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_keta_ctl",
        anim = {"pos"}
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_ctl_06",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_05",
        anim = {"bounce", "num_in"}
      },
      {
        name = "loc_num_06",
        anim = {"bounce", "num_in"}
      }
    }
  },
  {
    asset_name = "talisman_rt_talisman",
    text = {
      {node = "loc_tal01", text_id = "01"},
      {node = "loc_tal02", text_id = "02"},
      {node = "loc_tal03", text_id = "03"},
      {node = "loc_tal04", text_id = "04"},
      {node = "loc_tal05", text_id = "05"},
      {node = "loc_tal06", text_id = "06"},
      {node = "loc_tal07", text_id = "07"},
      {node = "loc_tal08", text_id = "08"},
      {node = "loc_tal09", text_id = "09"},
      {node = "loc_tal10", text_id = "10"},
      {node = "loc_tal11", text_id = "11"},
      {node = "loc_tal12", text_id = "12"},
      {node = "loc_tal13", text_id = "13"},
      {node = "loc_tal14", text_id = "14"},
      {node = "loc_tal15", text_id = "15"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_up",
        anim = {"up"}
      },
      {
        name = "loc_slide",
        anim = {"slide"}
      }
    }
  },
  {
    asset_name = "talisman_rt_detail",
    text = {
      {
        node = "loc_comment1",
        text_id = "loc_comment1"
      },
      {
        node = "loc_comment2",
        text_id = "loc_comment2"
      },
      {
        node = "loc_comment3",
        text_id = "loc_comment3"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_detail_bg",
        anim = {
          "in",
          "idle",
          "out"
        }
      }
    }
  },
  {
    asset_name = "talisman_rt_empty",
    text = {
      {
        node = "loc_text_empty",
        text_id = "ui_tarisman_rt_alert"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "talisman_rt_comment",
    text = {
      {
        node = "loc_text_comment",
        text_id = "ui_tarisman_rt_tag_01"
      },
      {
        node = "loc_text_explain",
        text_id = "ui_tarisman_rt_cap_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "talisman_rt_gem",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out",
          "upout"
        }
      }
    }
  },
  {
    asset_name = "talisman_rt_subtitle",
    text = {
      {
        node = "loc_text_subtitle",
        text_id = "ui_tarisman_rt_sub_02"
      }
    },
    node = {
      {
        name = "loc_subtitle",
        anim = {
          "slidein",
          "idle",
          "slideout",
          "out",
          "slideoutlong"
        }
      },
      {
        name = "loc_slide",
        anim = {"slide"}
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "talisman_rt_title",
    text = {
      {
        node = "loc_text_title",
        text_id = "ui_tarisman_rt_header"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "talisman_rt_layout",
    text = {
      {node = "loc_root", text_id = "loc_root"},
      {node = "loc_title", text_id = "loc_title"},
      {
        node = "loc_subtitle",
        text_id = "loc_subtitle"
      },
      {node = "loc_gem", text_id = "loc_gem"},
      {
        node = "loc_talisman",
        text_id = "loc_talisman"
      },
      {node = "loc_detail", text_id = "loc_detail"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_gem",
        anim = {"pos"}
      },
      {
        name = "loc_talisman",
        anim = {"pos"}
      }
    }
  },
  {
    asset_name = "camera_zoom",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
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
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "idle",
          "out",
          "change"
        }
      },
      {
        name = "loc_photomode_key_01",
        anim = {"press"}
      },
      {
        name = "loc_photomode_key_02",
        anim = {"press"}
      },
      {
        name = "loc_right_text",
        anim = {"press"}
      },
      {
        name = "loc_left_text",
        anim = {"press"}
      }
    }
  },
  {
    asset_name = "loading_icon",
    text = {
      {
        node = "loc_text",
        text_id = "ui_loading_01__"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {"idle"}
      },
      {
        name = "loc_icon",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "camera_view",
    text = {
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_02"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_03"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_02"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_03"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_02"
      },
      {
        node = "loc_root",
        text_id = "ui_option_header_03"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "option_layout",
    text = {
      {
        node = "loc_title",
        text_id = "ui_option_header_01"
      },
      {
        node = "loc_save",
        text_id = "ui_option_header_02"
      },
      {
        node = "loc_option",
        text_id = "ui_option_header_03"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "town_info",
    db_value = {
      {
        key = "movieclip",
        value = "vision/gp_common_01"
      },
      {
        key = "vision/gp_common_01_loop",
        value = true
      }
    },
    text = {
      {
        node = "ui_gaiku_01_01",
        text_id = "ui_gaiku_01_01"
      },
      {
        node = "ui_gaiku_02_01",
        text_id = "ui_gaiku_02_01"
      },
      {
        node = "ui_gaiku_03_01",
        text_id = "ui_gaiku_03_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_name_01",
        anim = {"pos"}
      },
      {
        name = "loc_name_02",
        anim = {"pos"}
      },
      {
        name = "loc_scale_01",
        anim = {"scale"}
      },
      {
        name = "loc_scale_02",
        anim = {"scale"}
      },
      {
        name = "loc_scale_03",
        anim = {"scale"}
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
    node = {
      {
        name = "loc_base",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_right_btn",
        anim = {
          "in",
          "out",
          "idle",
          "to_right"
        }
      },
      {
        name = "loc_left_btn",
        anim = {
          "in",
          "out",
          "idle",
          "to_left"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "ch_ghost_add",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "ch_ghost_user",
    text = {
      {
        node = "ui_ch_ghost_userid",
        text_id = "test"
      }
    },
    node = {
      {
        name = "loc_score_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_ch_base_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_user_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_friends_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "ch_ghost_friends_icon_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_icon_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_04_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "ch_ghost_coin",
    node = {
      {
        name = "loc_score_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_ch_base_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_num_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_05_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_06_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "ch_ghost_score_set",
    node = {
      {
        name = "loc_score_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_timer_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_ch_base_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "to_left",
          "to_right",
          "from_left",
          "from_right"
        }
      },
      {
        name = "loc_num_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_05_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_06_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_05_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_06_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_07_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "game_over_layout",
    text = {
      {
        node = "loc_button_1",
        text_id = "loc_button_1"
      },
      {
        node = "loc_button_2",
        text_id = "loc_button_2"
      },
      {
        node = "loc_button_3",
        text_id = "loc_button_3"
      },
      {node = "loc_title", text_id = "loc_title"}
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "game_over_title",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      },
      {
        name = "loc_sphere",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_sphere_scale",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "game_over_button",
    db_value = {
      {
        key = "text01",
        value = "ui_gameover_selects_01"
      }
    },
    text = {
      {
        node = "Baloon_exposed_text01_exposed",
        text_id = "test"
      }
    },
    node = {
      {
        name = "loc_ch_selects_1_ctl",
        anim = {
          "slin",
          "slout",
          "slidle"
        }
      },
      {
        name = "loc_ch_selects_1",
        anim = {
          "active_in",
          "active_out",
          "active",
          "non_active"
        }
      },
      {
        name = "loc_scale",
        anim = {"scale"}
      },
      {
        name = "loc_press",
        anim = {"press"}
      },
      {
        name = "loc_ch_selects_1",
        anim = {"press"}
      }
    }
  },
  {
    asset_name = "challenge_result_get",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale_get",
        anim = {"scale"}
      },
      {
        name = "loc_scale_record",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "hud_target",
    node = {
      {
        name = "loc_center_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_red_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_red_ctl",
        anim = {"scale"}
      },
      {
        name = "loc_blue_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_blue_ctl",
        anim = {"scale"}
      },
      {
        name = "loc_blue_line_ctl",
        anim = {"blue_line"}
      },
      {
        name = "loc_red_line_ctl",
        anim = {"red_line"}
      }
    }
  },
  {
    asset_name = "gui_target_blue",
    node = {
      {
        anim = {"targetef"}
      }
    }
  },
  {
    asset_name = "gui_target_red",
    node = {
      {
        anim = {"targetef"}
      }
    }
  },
  {
    asset_name = "gui_target_kick",
    node = {
      {
        anim = {"targetef"}
      }
    }
  },
  {
    asset_name = "object",
    text = {
      {
        node = "ui_object_ep90_01",
        text_id = "ui_object_ep90_01"
      },
      {
        node = "loc_root_ctl2",
        text_id = "loc_root_ctl2"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_sm_window_ctl",
        anim = {"scale"}
      },
      {
        name = "loc_text_ctl",
        anim = {"pos"}
      },
      {
        name = "loc_tuto_kazari",
        anim = {"scale"}
      },
      {
        name = "loc_tuto_kazari_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_tuto_kazari_pos",
        anim = {"pos"}
      },
      {
        name = "loc_text_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_root_ctl2",
        anim = {"pos"}
      }
    }
  },
  {
    asset_name = "sm_start",
    text = {
      {
        node = "ui_sm_main_sm90",
        text_id = "ui_sm_main_sm90"
      },
      {
        node = "ui_sm_sub_sm90",
        text_id = "ui_sm_sub_sm90"
      },
      {
        node = "ui_sm_end_sm90",
        text_id = "ui_sm_end_sm90"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_sm_window_ctl",
        anim = {"scale"}
      },
      {
        name = "loc_text_ctl",
        anim = {"pos"}
      },
      {
        name = "loc_tuto_kazari",
        anim = {"scale"}
      },
      {
        name = "loc_tuto_kazari_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_tuto_kazari_pos",
        anim = {"pos"}
      },
      {
        name = "loc_comp_window_ctl",
        anim = {"scale"}
      },
      {
        name = "loc_comp_window_old_ctl",
        anim = {"end_pos"}
      }
    }
  },
  {
    asset_name = "challenge_title",
    db_value = {
      {
        key = "text01",
        value = "ui_challenge_header"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "challenge_tarisman",
    db_value = {
      {
        key = "text02",
        value = "ui_challenge_perfect"
      }
    },
    node = {
      {
        name = "loc_gem_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_check_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_check_icon_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "challenge_button",
    db_value = {
      {
        key = "text01",
        value = "ui_challenge_selects_01"
      },
      {key = "text02", value = " "}
    },
    node = {
      {
        name = "loc_ch_selects_1_ctl",
        anim = {
          "slin",
          "slout",
          "slidle"
        }
      },
      {
        name = "loc_ch_selects_1",
        anim = {
          "active_in",
          "active_out",
          "active",
          "non_active"
        }
      },
      {
        name = "loc_net_number_1_1",
        anim = {"change"}
      },
      {
        name = "loc_net_number_2_1",
        anim = {"change"}
      },
      {
        name = "loc_net_number_2_2",
        anim = {"change"}
      },
      {
        name = "loc_press",
        anim = {"press"}
      }
    }
  },
  {
    asset_name = "challenge_base",
    text = {
      {
        node = "loc_score_1",
        text_id = "loc_score_1"
      },
      {
        node = "loc_score_2",
        text_id = "loc_score_2"
      },
      {
        node = "loc_score_3",
        text_id = "loc_score_3"
      },
      {
        node = "loc_high_score",
        text_id = "loc_high_score"
      },
      {
        node = "loc_caption",
        text_id = "loc_caption"
      },
      {
        node = "loc_selects",
        text_id = "loc_selects"
      },
      {node = "loc_screen", text_id = "loc_screen"},
      {
        node = "loc_tarisman",
        text_id = "loc_tarisman"
      },
      {node = "loc_title", text_id = "loc_title"},
      {
        node = "loc_myscore",
        text_id = "loc_myscore"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {"in", "out"}
      },
      {
        name = "loc_pos_ctl",
        anim = {"pos"}
      }
    }
  },
  {
    asset_name = "challenge_selects",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "challenge_bg",
    db_value = {
      {
        key = "text01",
        value = "ui_challenge_header"
      },
      {
        key = "text02",
        value = "ui_challenge_perfect"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "challenge_caption",
    db_value = {
      {
        key = "text01",
        value = "ui_challenge_main1_01"
      },
      {
        key = "text02",
        value = "ui_challenge_main2_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "challenge_score_set",
    node = {
      {
        name = "loc_score_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_05_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_06_obj",
        anim = {"change"}
      },
      {
        name = "loc_num_icon_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_timer_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_05_obj",
        anim = {"change"}
      },
      {
        name = "loc_timer_icon_obj",
        anim = {"change"}
      },
      {
        name = "loc_check_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_check_icon_obj",
        anim = {"change"}
      },
      {
        name = "loc_gem_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_gem_01_obj",
        anim = {"change"}
      },
      {
        name = "loc_gem_02_obj",
        anim = {"change"}
      },
      {
        name = "loc_gem_03_obj",
        anim = {"change"}
      },
      {
        name = "loc_gem_04_obj",
        anim = {"change"}
      },
      {
        name = "loc_gem_05_obj",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "challenge_high_score",
    text = {
      {
        node = "ui_challenge_hi_score",
        text_id = "ui_challenge_hi_score"
      }
    },
    node = {
      {
        name = "loc_score_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_01",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"change"}
      },
      {
        name = "loc_num_05",
        anim = {"change"}
      },
      {
        name = "loc_num_06",
        anim = {"change"}
      },
      {
        name = "loc_timer_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_timer_01",
        anim = {"change"}
      },
      {
        name = "loc_timer_02",
        anim = {"change"}
      },
      {
        name = "loc_timer_03",
        anim = {"change"}
      },
      {
        name = "loc_timer_04",
        anim = {"change"}
      },
      {
        name = "loc_timer_05",
        anim = {"change"}
      },
      {
        name = "loc_timer_icon",
        anim = {"icon_pos"}
      },
      {
        name = "loc_ch_highscore_add",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_particle",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "ui_challenge_hi_score",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "info_window",
    text = {
      {
        node = "locatorButtonRight",
        text_id = "locatorButtonRight"
      },
      {
        node = "locatorButtonLeft",
        text_id = "locatorButtonLeft"
      },
      {
        node = "loc_trans_pic",
        text_id = "loc_trans_pic"
      },
      {
        node = "loc_trans_txt",
        text_id = "loc_trans_txt"
      },
      {
        node = "info_window",
        text_id = "info_window"
      }
    },
    node = {
      {
        name = "info_window",
        anim = {"fadein", "fadeout"}
      },
      {
        name = "loc_trans_pic",
        anim = {
          "picin",
          "picout",
          "picbackin",
          "picbackout"
        }
      },
      {
        name = "loc_trans_txt",
        anim = {
          "txtin",
          "txtout",
          "txtbackin",
          "txtbackout"
        }
      },
      {
        name = "locatorButtonRight",
        anim = {"in", "out"}
      },
      {
        name = "locatorButtonLeft",
        anim = {"in", "out"}
      }
    }
  },
  {
    asset_name = "info_movie",
    db_value = {
      {
        key = "movieclip",
        value = "info/action_review_1"
      },
      {
        key = "info/action_review_1_loop",
        value = true
      }
    }
  },
  {
    asset_name = "challenge_screen",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    },
    db_value = {
      {
        key = "movieclip",
        value = "vision/gp_common_01"
      },
      {
        key = "vision/gp_common_01_loop",
        value = true
      }
    }
  },
  {
    asset_name = "key_guide",
    inout_anim_node = "loc_root",
    in_anim_name = "in",
    out_anim_name = "out",
    text = {
      {
        node = "ui_key_guide",
        text_id = "ui_caption_jimaku"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_scale_joint",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "caption",
    text = {
      {
        node = "ui_caption_tutorial",
        text_id = "ui_debug_caption_02"
      },
      {
        node = "ui_caption_tutorial_bloom",
        text_id = "ui_debug_caption_02"
      }
    },
    node = {
      {
        name = "loc_tutorial",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_pos",
        anim = {"pos"}
      },
      {
        name = "loc_tuto_joint",
        anim = {"scale"}
      },
      {
        name = "loc_tuto_scale_option",
        anim = {
          "scale_option"
        }
      },
      {
        name = "loc_kazari_option",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_monologue",
        anim = {
          "in",
          "out",
          "idle",
          "scale"
        }
      },
      {
        name = "loc_mono_joint",
        anim = {"scale"}
      },
      {
        name = "loc_jimaku",
        anim = {
          "in",
          "out",
          "idle"
        }
      }
    }
  },
  {
    asset_name = "tekinaviangle",
    node = {
      {
        name = "tekinaviangle",
        anim = {"fadein", "fadeout"}
      },
      {
        name = "loc01_ef",
        anim = {
          "ef",
          "ef2",
          "ef3",
          "ef4"
        }
      },
      {
        name = "loc_trans",
        anim = {"angle"}
      },
      {
        name = "loc_alpha",
        anim = {
          "ef2_alpha",
          "ef3_alpha",
          "ef2_alpha_full"
        }
      },
      {
        name = "loc_rotaton",
        anim = {
          "rotate_sikaku",
          "rotate2"
        }
      },
      {
        name = "ef01",
        anim = {
          "scale_sikaku",
          "scale2"
        }
      }
    }
  },
  {
    asset_name = "navi_point",
    inout_anim_node = "loc_root",
    in_anim_name = "in",
    out_anim_name = "out",
    text = {
      {
        node = "loc_trans",
        text_id = "ui_option_01",
        is_prev = true
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_point_root",
        anim = {"fademark"}
      },
      {
        name = "loc_navi_num_1",
        anim = {"change"}
      },
      {
        name = "loc_navi_num_2",
        anim = {"change"}
      },
      {
        name = "loc_navi_num_3",
        anim = {"change"}
      },
      {
        name = "loc_navi_num_4",
        anim = {"change"}
      },
      {
        name = "loc_navi_num_5",
        anim = {"change"}
      },
      {
        name = "loc_keta_pos",
        anim = {"keta_pos"}
      },
      {
        name = "loc_ef_root",
        anim = {"efin", "efout"}
      },
      {
        name = "loc_circle",
        anim = {
          "circle_effect"
        }
      },
      {
        name = "loc_joint",
        anim = {
          "circle_distance"
        }
      },
      {
        name = "loc_circle_scale",
        anim = {
          "circle_scale"
        }
      },
      {
        name = "loc_trans",
        anim = {"angle"}
      },
      {
        name = "loc_point_arrow",
        anim = {
          "arrow_rotation"
        }
      }
    }
  },
  {
    asset_name = "navipoint",
    inout_anim_node = "navipoint",
    in_anim_name = "fadein",
    out_anim_name = "fadeout",
    node = {
      {
        name = "navipoint",
        anim = {"fadein", "fadeout"}
      },
      {
        name = "loc_fontalpha",
        anim = {"fademark"}
      },
      {
        name = "loc01_ef",
        anim = {"distance"}
      },
      {
        name = "loc01_ef02",
        anim = {"ef"}
      },
      {
        name = "loc02_font01",
        anim = {"font01"}
      },
      {
        name = "loc02_font02",
        anim = {"font02"}
      },
      {
        name = "loc02_font03",
        anim = {"font03"}
      },
      {
        name = "loc02_font04",
        anim = {"font04"}
      },
      {
        name = "loc02_font05",
        anim = {"font05"}
      },
      {
        name = "loc02_font",
        anim = {
          "digit01",
          "digit02",
          "digit03",
          "digit04",
          "digit05"
        }
      },
      {
        name = "scaler01",
        anim = {"scaler"}
      }
    }
  },
  {
    asset_name = "naviangle",
    inout_anim_node = "naviangle",
    in_anim_name = "fadein",
    out_anim_name = "fadeout",
    node = {
      {
        name = "naviangle",
        anim = {"fadein", "fadeout"}
      },
      {
        name = "loc01_ef",
        anim = {"ef"}
      },
      {
        name = "loc_trans",
        anim = {"angle"}
      },
      {
        name = "loc02_font01",
        anim = {"font01"}
      },
      {
        name = "loc02_font02",
        anim = {"font02"}
      },
      {
        name = "loc02_font03",
        anim = {"font03"}
      },
      {
        name = "loc02_font04",
        anim = {"font04"}
      },
      {
        name = "loc02_font05",
        anim = {"font05"}
      },
      {
        name = "loc02_font",
        anim = {
          "digit01",
          "digit02",
          "digit03",
          "digit04",
          "digit05"
        }
      },
      {
        name = "scaler01",
        anim = {"scaler"}
      }
    }
  },
  {
    asset_name = "countdown_baloon",
    text = {
      {
        node = "ui_hud_count_start"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {"start_in"}
      }
    }
  },
  {
    asset_name = "countdown_test",
    db_value = {
      {
        key = "TEXTID_AAAA",
        value = "ui_option_01"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {"start_in", "finish_in"}
      }
    }
  },
  {
    asset_name = "counter_kazari",
    node = {
      {
        name = "loc_counter_kazari",
        anim = {
          "in",
          "idle",
          "out"
        }
      }
    }
  },
  {
    asset_name = "counter_gem",
    node = {
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_05",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_06",
        anim = {"change"}
      },
      {
        name = "loc_num_06",
        anim = {"bounce"}
      },
      {
        name = "loc_root_position",
        anim = {
          "pos1",
          "pos2",
          "pos3"
        }
      },
      {
        name = "loc_keta_pos",
        anim = {"keta_pos"}
      }
    }
  },
  {
    asset_name = "countdown",
    text = {
      {
        node = "ui_hud_count_start",
        text_id = "ui_hud_count_start",
        is_bloom = true
      },
      {
        node = "ui_hud_count_finish"
      },
      {
        node = "ui_hud_count_courseout"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "start_in",
          "finish_in",
          "courseout_in"
        }
      }
    }
  },
  {
    asset_name = "hud_mp",
    inout_anim_node = "loc_root",
    in_anim_name = "in",
    out_anim_name = "out",
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_mp_main",
        anim = {"mpbar"}
      },
      {
        name = "loc_mp_damage",
        anim = {"dmbar"}
      },
      {
        name = "loc_mp_frame_slash",
        anim = {"mp_slash"}
      },
      {
        name = "loc_mpbar_bounce",
        anim = {
          "mpbar_bounce"
        }
      },
      {
        name = "loc_sphere_bounce",
        anim = {
          "sphere_bounce"
        }
      },
      {
        name = "loc_mp_full_effect",
        anim = {
          "mp_full",
          "mp_wink",
          "mp_full_out",
          "full2"
        }
      },
      {
        name = "loc_mp_main_add",
        anim = {
          "mpbar_addin",
          "mainadd"
        }
      },
      {
        name = "loc_sphere_ctl",
        anim = {
          "wink_bounce"
        }
      }
    }
  },
  {
    asset_name = "hud_hp",
    inout_anim_node = "loc_scene_root",
    in_anim_name = "in",
    out_anim_name = "out",
    node = {
      {
        name = "loc_scene_root",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_hp",
        anim = {"hpbar"}
      },
      {
        name = "loc_damage",
        anim = {"dmbar"}
      },
      {
        name = "loc_red",
        anim = {"redbar"}
      },
      {
        name = "loc_mesh_root",
        anim = {"hp_level"}
      },
      {
        name = "loc_bounce",
        anim = {"bounce"}
      }
    }
  },
  {
    asset_name = "action_dialog",
    text = {
      {
        node = "ui_acdialog_main_01",
        text_id = "ui_acdialog_main_01"
      },
      {
        node = "ui_acdialog_main_02",
        text_id = "ui_acdialog_main_02"
      }
    },
    node = {
      {
        name = "loc_root",
        anim = {
          "in",
          "out",
          "idle",
          "press"
        }
      },
      {
        name = "loc_icon_ctl",
        anim = {
          "in",
          "out",
          "idle",
          "press"
        }
      },
      {
        name = "loc_scale_joint",
        anim = {"scale"}
      },
      {
        name = "loc_ac_kazari",
        anim = {"scale"}
      }
    }
  },
  {
    asset_name = "counter_99_99",
    text = {
      {
        node = "ui_hud_counter_slash_01"
      }
    },
    node = {
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce"}
      },
      {
        name = "loc_root_position",
        anim = {"pos1", "pos2"}
      },
      {
        name = "loc_icon_check",
        anim = {"iconchange"}
      },
      {
        name = "loc_keta_ctl",
        anim = {"keta_pos1", "keta_pos2"}
      },
      {
        name = "loc_keta_pos",
        anim = {"keta_pos"}
      }
    }
  },
  {
    asset_name = "counter_score",
    text = {
      {
        node = "ui_hud_counter_score_01"
      }
    },
    node = {
      {
        name = "loc_counter_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"bounce"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_05",
        anim = {"bounce"}
      },
      {
        name = "loc_root_position",
        anim = {"pos1", "pos2"}
      },
      {
        name = "loc_icon_check",
        anim = {"iconchange"}
      },
      {
        name = "loc_icon_ctl",
        anim = {"icon_pos"}
      },
      {
        name = "loc_keta_pos",
        anim = {"keta_pos"}
      }
    }
  },
  {
    asset_name = "counter_timer",
    inout_anim_node = "loc_timer_ctl",
    in_anim_name = "in",
    out_anim_name = "out",
    text = {
      {
        node = "ui_hud_counter_timer_01"
      }
    },
    node = {
      {
        name = "loc_root_position",
        anim = {"pos1", "pos2"}
      },
      {
        name = "loc_timer_ctl",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loca_watch_ctl",
        anim = {"watch_pos1", "watch_pos2"}
      },
      {
        name = "loc_watch_center",
        anim = {
          "watch_rotation"
        }
      },
      {
        name = "loc_num_ctl_01",
        anim = {"change"}
      },
      {
        name = "loc_num_01",
        anim = {"num_in"}
      },
      {
        name = "loc_num_ctl_02",
        anim = {"change"}
      },
      {
        name = "loc_num_02",
        anim = {"num_in"}
      },
      {
        name = "loc_num_ctl_03",
        anim = {"change"}
      },
      {
        name = "loc_num_03",
        anim = {"num_in", "bounce"}
      },
      {
        name = "loc_num_ctl_04",
        anim = {"change"}
      },
      {
        name = "loc_num_04",
        anim = {"num_in", "bounce"}
      },
      {
        name = "loc_num_ctl_05",
        anim = {"change"}
      },
      {
        name = "loc_num_05",
        anim = {"num_in", "bounce"}
      },
      {
        name = "loc_num_ctl_06",
        anim = {"change"}
      },
      {
        name = "loc_num_06",
        anim = {"num_in", "bounce"}
      }
    }
  },
  {
    asset_name = "ingame_preview",
    node = {
      {
        name = "loc_ingame_pre_01",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_ingame_pre_big",
        anim = {"change"}
      },
      {
        name = "loc_ingame_pre_02",
        anim = {
          "in",
          "out",
          "idle"
        }
      },
      {
        name = "loc_ingame_pre_small",
        anim = {"change"}
      }
    }
  },
  {
    asset_name = "photo_mode",
    node = {
      {
        name = "locator1",
        anim = {"fadein", "fadeout"}
      }
    }
  }
}
