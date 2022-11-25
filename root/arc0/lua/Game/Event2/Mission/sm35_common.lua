L0_0 = {}
L0_0.sm35_mot_01 = "kit01_lookaround_00"
L0_0.sm35_mot_02 = "kit01_stay_heat_00"
EVENT_PC_MOTION_TABLE = L0_0
LINEUP_TOP_WAIT = 1
LINEUP_RETRY = 0.3
L0_0 = {}
L0_0.man = {
  "man01_surprise_02",
  "man01_buyer_idle_00",
  "man01_idle_bu_00",
  "man01_idle_dt_00",
  "man01_idle_lo_00",
  "man01_stretch_00",
  "man01_reaction_goo_00",
  "man01_talk_agree_00",
  "man01_talk_laugh_03",
  "man01_talk_love_00",
  "man01_talk_love_01",
  "man01_cheer_00",
  "man01_cheer_soft_00",
  "man01_watching_00",
  "man01_watching_soft_00",
  "man01_stay_line_00",
  "man01_stay_line_01"
}
L0_0.wom = {
  "wom01_idle_lo_00",
  "wom01_talk_agree_00",
  "wom01_talk_laugh_03",
  "wom01_talk_love_00",
  "wom01_talk_love_01",
  "wom01_talk_sad_03",
  "wom01_cheer_00",
  "wom01_cheer_01",
  "wom01_cheer_soft_01",
  "wom01_lookup_demo_00",
  "wom01_stay_line_00",
  "wom01_watching_00",
  "wom01_watching_01",
  "wom01_watching_soft_00",
  "wom01_watching_soft_01",
  "wom01_stay_line_00",
  "wom01_stay_line_01"
}
L0_0.chi = {
  "chi01_shock_01",
  "chi01_idle_bu_01",
  "chi01_idle_dt_00",
  "chi01_idle_lo_01",
  "chi01_idle_po_00",
  "chi01_idle_up_00",
  "chi01_idle_up_01",
  "chi01_stretch_00",
  "chi01_watching_00",
  "chi01_worry_00",
  "chi01_talk_cry_00",
  "chi01_cheer_00",
  "chi01_lookup_00",
  "chi01_merry_01",
  "chi01_merry_00",
  "chi01_stay_line_00",
  "chi01_stay_line_01",
  "chi01_stay_tired_00"
}
FAN_MOTION_LOAD_TABLE = L0_0
L0_0 = {
  {
    main_type = "man",
    model_type = {"man"},
    find_caption = {"sm35_09000"},
    touch_caption = {"sm35_09001"},
    stay_motion = {
      alone = {
        "cleaning_00",
        "lookaround",
        "lookaround_01",
        "lookaround_02",
        "lookaround_03",
        "stay_01",
        "stay_02",
        "trouble_00",
        "man01_buyer_idle_00",
        "man01_idle_bu_00",
        "man01_idle_dt_00",
        "man01_idle_lo_00",
        "man01_stretch_00"
      },
      talk = {
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "stay_02",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_04",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_02",
        "threat_01",
        "man01_reaction_goo_00",
        "man01_talk_agree_00",
        "man01_talk_laugh_03",
        "man01_talk_love_00",
        "man01_talk_love_01"
      },
      look = {
        "handclap",
        "scared_01",
        "scared_03",
        "scared_04",
        "man01_cheer_00",
        "man01_cheer_soft_00",
        "man01_watching_00",
        "man01_watching_soft_00"
      },
      lineup = {
        "stay",
        "stay_01",
        "stay_02",
        "man01_stay_line_00",
        "man01_stay_line_01",
        "man01_watching_soft_00"
      }
    },
    touch_motion = {
      "check",
      "lookaround_01",
      "man01_surprise_02",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_02"
    }
  },
  {
    main_type = "wom",
    model_type = {"wom"},
    find_caption = {"sm35_09002"},
    touch_caption = {"sm35_09003"},
    stay_motion = {
      alone = {
        "caress_00",
        "idle_bu_00",
        "listen_00",
        "lookaround",
        "lookaround_01",
        "stay_03",
        "stay_rescued_00",
        "trouble_00",
        "wom01_idle_lo_00"
      },
      talk = {
        "angry_00",
        "handclap",
        "idle_bu_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_cid_00",
        "talk_cid_01",
        "talk_cid_02",
        "talk_cid_03",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_01",
        "talk_sad_02",
        "wom01_talk_agree_00",
        "wom01_talk_laugh_03",
        "wom01_talk_love_00",
        "wom01_talk_love_01",
        "wom01_talk_sad_03"
      },
      look = {
        "call_00",
        "wom01_cheer_00",
        "wom01_cheer_01",
        "wom01_cheer_soft_01",
        "wom01_lookup_demo_00",
        "wom01_stay_line_00",
        "wom01_watching_00",
        "wom01_watching_01",
        "wom01_watching_soft_00",
        "wom01_watching_soft_01"
      },
      lineup = {
        "caress_00",
        "photo_02",
        "photo_03",
        "stay",
        "stay_01",
        "stay_02",
        "stay_03",
        "wom01_idle_lo_00",
        "wom01_stay_line_00",
        "wom01_stay_line_01",
        "wom01_watching_soft_01"
      }
    },
    touch_motion = {
      "buyer_idle_00",
      "lookaround",
      "surprise_00",
      "surprise_01",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  },
  {
    main_type = "chi",
    model_type = {"kid", "chi"},
    find_caption = {"sm35_09004"},
    touch_caption = {"sm35_09005"},
    stay_motion = {
      alone = {
        "listen_00",
        "lookaround",
        "lookaround_01",
        "photo_02",
        "relax_00",
        "chi01_idle_bu_01",
        "chi01_idle_dt_00",
        "chi01_idle_lo_01",
        "chi01_idle_po_00",
        "chi01_idle_up_00",
        "chi01_idle_up_01",
        "chi01_stretch_00",
        "chi01_watching_00",
        "chi01_worry_00"
      },
      talk = {
        "photo_02",
        "relax_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "surprise_00",
        "talk_00",
        "talk_01",
        "talk_angry_00",
        "talk_laugh_00",
        "talk_sad_00",
        "chi01_talk_cry_00"
      },
      look = {
        "handclap",
        "relax_00",
        "stay_03",
        "surprise_00",
        "wavehand_00",
        "chi01_cheer_00",
        "chi01_lookup_00",
        "chi01_merry_01",
        "chi01_merry_00",
        "chi01_watching_00"
      },
      lineup = {
        "listen_00",
        "photo_00",
        "photo_01",
        "photo_02",
        "relax_00",
        "stay",
        "stay_01",
        "stay_02",
        "chi01_idle_lo_01",
        "chi01_idle_up_00",
        "chi01_stay_line_00",
        "chi01_stay_line_01",
        "chi01_stay_tired_00",
        "chi01_stretch_00"
      }
    },
    touch_motion = {
      "chi01_shock_01",
      "surprise_00",
      "surprise_01",
      "talk_angry_00"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  },
  {
    main_type = "chi",
    model_type = {"chi19"},
    find_caption = {"sm35_09006", "sm35_09007"},
    touch_caption = {"sm35_09010"},
    stay_motion = {
      alone = {
        "listen_00",
        "lookaround",
        "lookaround_01",
        "photo_02",
        "relax_00",
        "chi01_idle_bu_01",
        "chi01_idle_dt_00",
        "chi01_idle_lo_01",
        "chi01_idle_po_00",
        "chi01_idle_up_00",
        "chi01_idle_up_01",
        "chi01_stretch_00",
        "chi01_watching_00",
        "chi01_worry_00"
      },
      talk = {
        "photo_02",
        "relax_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "surprise_00",
        "talk_00",
        "talk_01",
        "talk_angry_00",
        "talk_laugh_00",
        "talk_sad_00",
        "chi01_talk_cry_00"
      },
      look = {
        "handclap",
        "relax_00",
        "stay_03",
        "surprise_00",
        "wavehand_00",
        "chi01_cheer_00",
        "chi01_lookup_00",
        "chi01_merry_01",
        "chi01_merry_00",
        "chi01_watching_00"
      },
      lineup = {
        "listen_00",
        "photo_00",
        "photo_01",
        "photo_02",
        "relax_00",
        "stay",
        "stay_01",
        "stay_02",
        "chi01_idle_lo_01",
        "chi01_idle_up_00",
        "chi01_stay_line_00",
        "chi01_stay_line_01",
        "chi01_stay_tired_00",
        "chi01_stretch_00"
      }
    },
    touch_motion = {
      "chi01_shock_01",
      "surprise_00",
      "surprise_01",
      "talk_angry_00"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  },
  {
    main_type = "chi",
    model_type = {"chi20"},
    find_caption = {"sm35_09008"},
    touch_caption = {"sm35_09009"},
    stay_motion = {
      alone = {
        "listen_00",
        "lookaround",
        "lookaround_01",
        "photo_02",
        "relax_00",
        "chi01_idle_bu_01",
        "chi01_idle_dt_00",
        "chi01_idle_lo_01",
        "chi01_idle_po_00",
        "chi01_idle_up_00",
        "chi01_idle_up_01",
        "chi01_stretch_00",
        "chi01_watching_00",
        "chi01_worry_00"
      },
      talk = {
        "photo_02",
        "relax_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "surprise_00",
        "talk_00",
        "talk_01",
        "talk_angry_00",
        "talk_laugh_00",
        "talk_sad_00",
        "chi01_talk_cry_00"
      },
      look = {
        "handclap",
        "relax_00",
        "stay_03",
        "surprise_00",
        "wavehand_00",
        "chi01_cheer_00",
        "chi01_lookup_00",
        "chi01_merry_01",
        "chi01_merry_00",
        "chi01_watching_00"
      },
      lineup = {
        "listen_00",
        "photo_00",
        "photo_01",
        "photo_02",
        "relax_00",
        "stay",
        "stay_01",
        "stay_02",
        "chi01_idle_lo_01",
        "chi01_idle_up_00",
        "chi01_stay_line_00",
        "chi01_stay_line_01",
        "chi01_stay_tired_00",
        "chi01_stretch_00"
      }
    },
    touch_motion = {
      "chi01_shock_01",
      "surprise_00",
      "surprise_01",
      "talk_angry_00"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  },
  {
    main_type = "man",
    model_type = {
      "man70",
      "man71",
      "man10",
      "man17",
      "man64",
      "man81"
    },
    find_caption = {
      "sm35_09011",
      "sm35_09012",
      "sm35_09013",
      "sm35_09014"
    },
    touch_caption = {"sm35_09015", "sm35_09016"},
    stay_motion = {
      alone = {
        "cleaning_00",
        "lookaround",
        "lookaround_01",
        "lookaround_02",
        "lookaround_03",
        "stay_01",
        "stay_02",
        "trouble_00",
        "man01_buyer_idle_00",
        "man01_idle_bu_00",
        "man01_idle_dt_00",
        "man01_idle_lo_00",
        "man01_stretch_00"
      },
      talk = {
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "stay_02",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_04",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_02",
        "threat_01",
        "man01_reaction_goo_00",
        "man01_talk_agree_00",
        "man01_talk_laugh_03",
        "man01_talk_love_00",
        "man01_talk_love_01"
      },
      look = {
        "handclap",
        "scared_01",
        "scared_03",
        "scared_04",
        "man01_cheer_00",
        "man01_cheer_soft_00",
        "man01_watching_00",
        "man01_watching_soft_00"
      },
      lineup = {
        "stay",
        "stay_01",
        "stay_02",
        "man01_stay_line_00",
        "man01_stay_line_01",
        "man01_watching_soft_00"
      }
    },
    touch_motion = {
      "check",
      "lookaround_01",
      "man01_surprise_02",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_02"
    }
  },
  {
    main_type = "man",
    model_type = {
      "man01",
      "man02",
      "man08",
      "man18",
      "man25",
      "man26",
      "man74",
      "man79",
      "man80",
      "man82",
      "man83"
    },
    find_caption = {
      "sm35_09017",
      "sm35_09018",
      "sm35_09019",
      "sm35_09020",
      "sm35_09021",
      "sm35_09022"
    },
    stay_motion = {
      alone = {
        "cleaning_00",
        "lookaround",
        "lookaround_01",
        "lookaround_02",
        "lookaround_03",
        "stay_01",
        "stay_02",
        "trouble_00",
        "man01_buyer_idle_00",
        "man01_idle_bu_00",
        "man01_idle_dt_00",
        "man01_idle_lo_00",
        "man01_stretch_00"
      },
      talk = {
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "stay_02",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_04",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_02",
        "threat_01",
        "man01_reaction_goo_00",
        "man01_talk_agree_00",
        "man01_talk_laugh_03",
        "man01_talk_love_00",
        "man01_talk_love_01"
      },
      look = {
        "handclap",
        "scared_01",
        "scared_03",
        "scared_04",
        "man01_cheer_00",
        "man01_cheer_soft_00",
        "man01_watching_00",
        "man01_watching_soft_00"
      },
      lineup = {
        "stay",
        "stay_01",
        "stay_02",
        "man01_stay_line_00",
        "man01_stay_line_01",
        "man01_watching_soft_00"
      }
    },
    touch_caption = {
      "sm35_09023",
      "sm35_09024",
      "sm35_09025"
    },
    touch_motion = {
      "check",
      "lookaround_01",
      "man01_surprise_02",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_02"
    }
  },
  {
    main_type = "man",
    model_type = {
      "man05",
      "man07",
      "man09",
      "man73"
    },
    find_caption = {"sm35_09026", "sm35_09027"},
    touch_caption = {"sm35_09028", "sm35_09029"},
    stay_motion = {
      alone = {
        "cleaning_00",
        "lookaround",
        "lookaround_01",
        "lookaround_02",
        "lookaround_03",
        "stay_01",
        "stay_02",
        "trouble_00",
        "man01_buyer_idle_00",
        "man01_idle_bu_00",
        "man01_idle_dt_00",
        "man01_idle_lo_00",
        "man01_stretch_00"
      },
      talk = {
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "stay_02",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_04",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_02",
        "threat_01",
        "man01_reaction_goo_00",
        "man01_talk_agree_00",
        "man01_talk_laugh_03",
        "man01_talk_love_00",
        "man01_talk_love_01"
      },
      look = {
        "handclap",
        "scared_01",
        "scared_03",
        "scared_04",
        "man01_cheer_00",
        "man01_cheer_soft_00",
        "man01_watching_00",
        "man01_watching_soft_00"
      },
      lineup = {
        "stay",
        "stay_01",
        "stay_02",
        "man01_stay_line_00",
        "man01_stay_line_01",
        "man01_watching_soft_00"
      }
    },
    touch_motion = {
      "check",
      "lookaround_01",
      "man01_surprise_02",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_02"
    }
  },
  {
    main_type = "man",
    model_type = {"man30"},
    find_caption = {"sm35_09030"},
    touch_caption = {"sm35_09031"},
    stay_motion = {
      alone = {
        "cleaning_00",
        "lookaround",
        "lookaround_01",
        "lookaround_02",
        "lookaround_03",
        "stay_01",
        "stay_02",
        "trouble_00",
        "man01_buyer_idle_00",
        "man01_idle_bu_00",
        "man01_idle_dt_00",
        "man01_idle_lo_00",
        "man01_stretch_00"
      },
      talk = {
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "stay_02",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_04",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_02",
        "threat_01",
        "man01_reaction_goo_00",
        "man01_talk_agree_00",
        "man01_talk_laugh_03",
        "man01_talk_love_00",
        "man01_talk_love_01"
      },
      look = {
        "handclap",
        "scared_01",
        "scared_03",
        "scared_04",
        "man01_cheer_00",
        "man01_cheer_soft_00",
        "man01_watching_00",
        "man01_watching_soft_00"
      },
      lineup = {
        "stay",
        "stay_01",
        "stay_02",
        "man01_stay_line_00",
        "man01_stay_line_01",
        "man01_watching_soft_00"
      }
    },
    touch_motion = {
      "check",
      "lookaround_01",
      "man01_surprise_02",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_02"
    }
  },
  {
    main_type = "man",
    model_type = {"man31"},
    find_caption = {"sm35_09032"},
    touch_caption = {"sm35_09033"},
    stay_motion = {
      alone = {
        "cleaning_00",
        "lookaround",
        "lookaround_01",
        "lookaround_02",
        "lookaround_03",
        "stay_01",
        "stay_02",
        "trouble_00",
        "man01_buyer_idle_00",
        "man01_idle_bu_00",
        "man01_idle_dt_00",
        "man01_idle_lo_00",
        "man01_stretch_00"
      },
      talk = {
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "stay_02",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_04",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_02",
        "threat_01",
        "man01_reaction_goo_00",
        "man01_talk_agree_00",
        "man01_talk_laugh_03",
        "man01_talk_love_00",
        "man01_talk_love_01"
      },
      look = {
        "handclap",
        "scared_01",
        "scared_03",
        "scared_04",
        "man01_cheer_00",
        "man01_cheer_soft_00",
        "man01_watching_00",
        "man01_watching_soft_00"
      },
      lineup = {
        "stay",
        "stay_01",
        "stay_02",
        "man01_stay_line_00",
        "man01_stay_line_01",
        "man01_watching_soft_00"
      }
    },
    touch_motion = {
      "check",
      "lookaround_01",
      "man01_surprise_02",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_02"
    }
  },
  {
    main_type = "wom",
    model_type = {
      "wom04",
      "wom38",
      "wom39",
      "wom40",
      "wom41",
      "wom44"
    },
    find_caption = {
      "sm35_09034",
      "sm35_09035",
      "sm35_09036",
      "sm35_09037"
    },
    touch_caption = {"sm35_09038", "sm35_09039"},
    stay_motion = {
      alone = {
        "caress_00",
        "idle_bu_00",
        "listen_00",
        "lookaround",
        "lookaround_01",
        "stay_03",
        "stay_rescued_00",
        "trouble_00",
        "wom01_idle_lo_00"
      },
      talk = {
        "angry_00",
        "handclap",
        "idle_bu_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_cid_00",
        "talk_cid_01",
        "talk_cid_02",
        "talk_cid_03",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_01",
        "talk_sad_02",
        "wom01_talk_agree_00",
        "wom01_talk_laugh_03",
        "wom01_talk_love_00",
        "wom01_talk_love_01",
        "wom01_talk_sad_03"
      },
      look = {
        "call_00",
        "wom01_cheer_00",
        "wom01_cheer_01",
        "wom01_cheer_soft_01",
        "wom01_lookup_demo_00",
        "wom01_stay_line_00",
        "wom01_watching_00",
        "wom01_watching_01",
        "wom01_watching_soft_00",
        "wom01_watching_soft_01"
      },
      lineup = {
        "caress_00",
        "photo_02",
        "stay",
        "stay_01",
        "stay_02",
        "stay_03",
        "wom01_idle_lo_00",
        "wom01_stay_line_00",
        "wom01_watching_soft_01"
      }
    },
    touch_motion = {
      "buyer_idle_00",
      "lookaround",
      "surprise_00",
      "surprise_01",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  },
  {
    main_type = "wom",
    model_type = {
      "wom04",
      "wom38",
      "wom39",
      "wom40",
      "wom41",
      "wom44"
    },
    find_caption = {
      "sm35_09040",
      "sm35_09041",
      "sm35_09042",
      "sm35_09043"
    },
    touch_caption = {"sm35_09044", "sm35_09045"},
    stay_motion = {
      alone = {
        "caress_00",
        "idle_bu_00",
        "listen_00",
        "lookaround",
        "lookaround_01",
        "stay_03",
        "stay_rescued_00",
        "trouble_00",
        "wom01_idle_lo_00"
      },
      talk = {
        "angry_00",
        "handclap",
        "idle_bu_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "talk_00",
        "talk_01",
        "talk_02",
        "talk_03",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_cid_00",
        "talk_cid_01",
        "talk_cid_02",
        "talk_cid_03",
        "talk_laugh_00",
        "talk_laugh_01",
        "talk_laugh_02",
        "talk_sad_00",
        "talk_sad_01",
        "talk_sad_02",
        "wom01_talk_agree_00",
        "wom01_talk_laugh_03",
        "wom01_talk_love_00",
        "wom01_talk_love_01",
        "wom01_talk_sad_03"
      },
      look = {
        "call_00",
        "wom01_cheer_00",
        "wom01_cheer_01",
        "wom01_cheer_soft_01",
        "wom01_lookup_demo_00",
        "wom01_stay_line_00",
        "wom01_watching_00",
        "wom01_watching_01",
        "wom01_watching_soft_00",
        "wom01_watching_soft_01"
      },
      lineup = {
        "caress_00",
        "photo_02",
        "photo_03",
        "stay",
        "stay_01",
        "stay_02",
        "stay_03",
        "wom01_idle_lo_00",
        "wom01_stay_line_00",
        "wom01_stay_line_01",
        "wom01_watching_soft_01"
      }
    },
    touch_motion = {
      "buyer_idle_00",
      "lookaround",
      "surprise_00",
      "surprise_01",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  },
  {
    main_type = "wom",
    model_type = {"wom43", "wom45"},
    find_caption = {"sm35_09046", "sm35_09047"},
    touch_caption = {"sm35_09048"},
    stay_motion = {
      alone = {
        "caress_00",
        "idle_bu_00",
        "listen_00",
        "lookaround",
        "lookaround_01",
        "stay_03",
        "stay_rescued_00",
        "trouble_00"
      },
      talk = {
        "angry_00",
        "handclap",
        "idle_bu_00",
        "reply_no",
        "reply_unknown_00",
        "reply_yes",
        "talk_00",
        "talk_02",
        "talk_angry_00",
        "talk_angry_01",
        "talk_angry_02",
        "talk_cid_00",
        "talk_cid_01",
        "talk_cid_02",
        "talk_cid_03",
        "wom01_talk_laugh_03",
        "wom01_talk_love_01"
      },
      look = {"call_00"},
      lineup = {
        "caress_00",
        "stay",
        "stay_01",
        "stay_03"
      }
    },
    touch_motion = {
      "buyer_idle_00",
      "lookaround",
      "surprise_00",
      "surprise_01",
      "talk_angry_01",
      "talk_angry_02"
    },
    lost_motion = {
      "lookaround",
      "lookaround_01"
    }
  }
}
FAN_CHARACTER_DATA = L0_0
L0_0 = {
  {
    model = {"man"},
    voice = {"m32_918", "m32_911"}
  },
  {
    model = {"wom"},
    voice = {"w16_918", "w16_911"}
  },
  {
    model = {
      "man05",
      "man07",
      "man73"
    },
    voice = {"m29_918", "m29_911"}
  },
  {
    model = {
      "man08",
      "man64",
      "man01"
    },
    voice = {"m30_918", "m30_911"}
  },
  {
    model = {
      "man02",
      "man09",
      "man25",
      "man26",
      "man83"
    },
    voice = {"m31_918", "m31_911"}
  },
  {
    model = {
      "man77",
      "man82",
      "man17",
      "man31"
    },
    voice = {"m32_918", "m32_911"}
  },
  {
    model = {
      "man10",
      "man74",
      "man81",
      "man18",
      "man30"
    },
    voice = {"m33_918", "m33_911"}
  },
  {
    model = {"man79"},
    voice = {"m34_918", "m34_911"}
  },
  {
    model = {"man80"},
    voice = {"m35_918", "m35_911"}
  },
  {
    model = {"man70", "man71"},
    voice = {"m36_918", "m36_911"}
  },
  {
    model = {"chi19"},
    voice = {"m37_919", "m37_911"}
  },
  {
    model = {
      "kid01",
      "kid02",
      "kid03"
    },
    voice = {"m38_919", "m38_911"}
  },
  {
    model = {"wom43"},
    voice = {"w13_918", "w13_911"}
  },
  {
    model = {"wom45"},
    voice = {"w14_918", "w14_911"}
  },
  {
    model = {"wom15"},
    voice = {"w15_918", "w15_911"}
  },
  {
    model = {
      "wom01",
      "wom05",
      "wom31",
      "wom41"
    },
    voice = {"w16_918", "w16_911"}
  },
  {
    model = {
      "wom03",
      "wom04",
      "wom44",
      "wom46"
    },
    voice = {"w17_918", "w17_911"}
  },
  {
    model = {"wom47"},
    voice = {"w18_918", "w18_911"}
  },
  {
    model = {"wom38"},
    voice = {"w19_918", "w19_911"}
  },
  {
    model = {"wom39"},
    voice = {"w20_918", "w20_911"}
  },
  {
    model = {"wom40"},
    voice = {"w21_918", "w20_911"}
  },
  {
    model = {"chi20"},
    voice = {"w22_919", "w22_911"}
  }
}
lively_voice_group = L0_0
L0_0 = "fan_find_caption_wait_task"
_ENV[L0_0] = nil
L0_0 = "score"
_ENV[L0_0] = 0
L0_0 = "fan_chase"
_ENV[L0_0] = 0
L0_0 = "escape_failed_flag"
_ENV[L0_0] = false
L0_0 = "fan_touch_stop_flag"
_ENV[L0_0] = false
L0_0 = "caption_interrupt_disabled"
_ENV[L0_0] = false
L0_0 = "check_course_out"
_ENV[L0_0] = false
L0_0 = "npc_motion_use"
_ENV[L0_0] = {}
L0_0 = "npc_model_name"
_ENV[L0_0] = {}
L0_0 = "npc_fan_task"
_ENV[L0_0] = {}
L0_0 = "npc_fan_move_task"
_ENV[L0_0] = {}
L0_0 = "npc_idle_touch_check_task"
_ENV[L0_0] = {}
L0_0 = "_lively_voice_loop_task_table"
_ENV[L0_0] = {}
L0_0 = "_npc_fan_stay_motion_task"
_ENV[L0_0] = {}
L0_0 = "_npc_fan_move_param"
_ENV[L0_0] = {}
L0_0 = "npc_fan_immobile_task"
_ENV[L0_0] = {}
L0_0 = "mob_to_npc_main_task"
_ENV[L0_0] = nil
L0_0 = "mob_to_npc_table"
_ENV[L0_0] = {}
L0_0 = "mob_to_npc_name"
_ENV[L0_0] = {}
L0_0 = "failed_action_task"
_ENV[L0_0] = {}
L0_0 = "_lineup_finish"
_ENV[L0_0] = {}
L0_0 = "_lineup_customers"
_ENV[L0_0] = {}
L0_0 = "_immobile_lineup_task"
_ENV[L0_0] = {}
L0_0 = "_radio_se_is_active"
_ENV[L0_0] = false
L0_0 = "Sub_Kit_MotionLoad"
_ENV[L0_0] = function()
  print("KIT ANINMATION LOAD")
  Fn_loadPlayerMotion(EVENT_PC_MOTION_TABLE)
end
L0_0 = "Sub_npcRandomTypeConv"
_ENV[L0_0] = function(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  for L4_5 = 1, #A0_1 do
    if A0_1[L4_5].type == "random_hex_dt" then
      if math.random(1, 3) == 1 then
        A0_1[L4_5].type = "man_hex_dt"
      elseif math.random(1, 3) == 2 then
        A0_1[L4_5].type = "wom_hex_dt"
      elseif math.random(1, 3) == 3 then
        A0_1[L4_5].type = "chi_hex_dt"
      end
    elseif A0_1[L4_5].type == "adult_hex_ed" then
      if math.random(1, 2) == 1 then
        A0_1[L4_5].type = "man_hex_ed"
      elseif math.random(1, 2) == 2 then
        A0_1[L4_5].type = "wom_hex_ed"
      end
    elseif A0_1[L4_5].type == "random_hex_ed" then
      if 1 <= math.random(1, 5) and 2 >= math.random(1, 5) then
        A0_1[L4_5].type = "man_hex_ed"
      elseif math.random(1, 5) <= 4 then
        A0_1[L4_5].type = "wom_hex_ed"
      elseif math.random(1, 5) == 5 then
        A0_1[L4_5].type = "chi_hex"
      end
    end
  end
end
L0_0 = "Sub_fan_MotionLoad"
_ENV[L0_0] = function(A0_6, A1_7, A2_8)
  local L3_9
  if A2_8 == "accordion" then
  elseif A2_8 == "salesman" then
  else
    L3_9 = FAN_CHARACTER_DATA
    L3_9 = L3_9[Sub_MobType_discrimination(A1_7)]
    if 0 < #FAN_MOTION_LOAD_TABLE[L3_9.main_type] then
      Fn_loadNpcEventMotion(A0_6, FAN_MOTION_LOAD_TABLE[L3_9.main_type])
    end
  end
end
L0_0 = "Sub_naviSet"
_ENV[L0_0] = function(A0_10, A1_11)
  if A0_10 ~= nil then
    HUD:naviSetActivate(true, A1_11)
    HUD:naviSetTarget(A0_10)
  end
end
L0_0 = "Sub_fan_motion_rand"
_ENV[L0_0] = function(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17
  L5_17 = RandI
  L5_17 = L5_17(1, #A1_13)
  L5_17 = A1_13[L5_17]
  Fn_playMotionNpc(A0_12, L5_17, A3_15, A4_16)
end
L0_0 = "Sub_ImmobileFanTask"
_ENV[L0_0] = function(A0_18, A1_19, A2_20)
  return invokeTask(function()
    local L0_21
    L0_21 = Fn_findNpc
    L0_21 = L0_21(A0_18)
    while true do
      if Fn_getDistanceToPlayer(L0_21) < 1 then
        escape_failed_flag = true
        fan_touch_stop_flag = true
        print("TOUCH:" .. A0_18)
        if _npc_fan_stay_motion_task[A0_18] ~= nil then
          _npc_fan_stay_motion_task[A0_18]:abort()
          _npc_fan_stay_motion_task[A0_18] = nil
        end
        Fn_turnNpc(L0_21)
        Fn_captionView(FAN_CHARACTER_DATA[A2_20].touch_caption[RandI(1, #FAN_CHARACTER_DATA[A2_20].touch_caption)])
        if A1_19 == true then
          Sub_fan_motion_rand(A0_18, FAN_CHARACTER_DATA[A2_20].touch_motion, FAN_CHARACTER_DATA[A2_20].main_type, false, {isRepeat = false, isStop = true})
        end
        break
      end
      wait()
    end
  end)
end
L0_0 = "setFanParam"
_ENV[L0_0] = function(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27, A6_28)
  local L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39, L18_40, L19_41, L20_42
  L7_29 = A0_22 or L7_29 or DEFAULT_SPEED
  L8_30 = A1_23 or L8_30 or DEFAULT_MOVE_OFF_DISTANCE
  L9_31 = A2_24 or L9_31 or DEFAULT_NPC_DEGREE_H
  L10_32 = A3_25 or L10_32 or DEFAULT_NPC_DEGREE_V
  L11_33 = A4_26 or L11_33 or DEFAULT_NPC_IN_LENGTH
  L12_34 = A5_27 or L12_34 or DEFAULT_NPC_OUT_LENGTH
  L13_35 = A6_28 or L13_35 or DEFAULT_NPC_MOVE_WAIT_SEC
  L14_36 = _npc_fan_move_param
  L14_36 = L14_36.npc_degree_h
  L14_36 = L14_36 ~= L9_31 or L14_36 ~= L10_32 or L14_36 ~= L11_33 or L14_36 ~= L12_34
  L15_37 = _npc_fan_move_param
  L15_37 = L15_37.npc_in_length
  L15_37 = L15_37 ~= L11_33
  L16_38 = _npc_fan_move_param
  L16_38.move_type = 1
  L16_38 = _npc_fan_move_param
  L16_38.speed = L7_29
  L16_38 = _npc_fan_move_param
  L16_38.move_on_distance = 20
  L16_38 = _npc_fan_move_param
  L16_38.move_off_distance = L8_30
  L16_38 = _npc_fan_move_param
  L16_38.npc_degree_h = L9_31
  L16_38 = _npc_fan_move_param
  L16_38.npc_degree_v = L10_32
  L16_38 = _npc_fan_move_param
  L16_38.npc_in_length = L11_33
  L16_38 = _npc_fan_move_param
  L16_38.npc_out_length = L12_34
  L16_38 = _npc_fan_move_param
  L16_38.npc_move_wait_sec = L13_35
  if L14_36 == true then
    L16_38 = {}
    L16_38.degree_h = L17_39
    L16_38.degree_v = L17_39
    L16_38.in_length = L17_39
    L16_38.out_length = L17_39
    L16_38.valid = true
    for L20_42, _FORV_21_ in L17_39(L18_40) do
      Fn_findNpc(L20_42):setSightParam(L16_38)
    end
  end
  if L15_37 == true then
    L16_38 = Fn_createChangeMobToNpc
    L18_40.degree = 45
    L18_40.range = L19_41
    L16_38(L17_39, L18_40)
  end
end
L0_0 = "invokeFanNpcTask"
_ENV[L0_0] = function(A0_43, A1_44, A2_45, A3_46)
  local L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53
  L4_47, L5_48 = nil, nil
  L6_49 = Fn_findNpc
  L7_50 = A0_43
  L6_49 = L6_49(L7_50)
  L7_50 = Fn_findNpcPuppet
  L8_51 = A0_43
  L7_50 = L7_50(L8_51)
  L8_51 = 0
  L9_52 = FAN_CHASE_MAX
  L9_52 = L9_52 - 1
  if L6_49 then
    L10_53 = print
    L10_53("NPC CHECK:" .. A0_43 .. " OK")
  else
    L10_53 = print
    L10_53("NPC CHECK:" .. A0_43 .. " NG")
  end
  L10_53 = {}
  L10_53.degree_h = _npc_fan_move_param.npc_degree_h
  L10_53.degree_v = _npc_fan_move_param.npc_degree_v
  L10_53.in_length = _npc_fan_move_param.npc_in_length
  L10_53.out_length = _npc_fan_move_param.npc_out_length
  L10_53.valid = true
  L6_49:setSightParam(L10_53)
  return invokeTask(function()
    while fan_touch_stop_flag == false do
      wait()
      if _npc_fan_move_param.move_type == 0 then
        repeat
          wait(2)
          while L9_52 < fan_chase do
            wait()
          end
        until Fn_getDistanceToPlayer(L7_50) <= _npc_fan_move_param.move_on_distance
      else
        repeat
          wait()
          while L9_52 < fan_chase do
            wait()
          end
        until L6_49:isInSight()
      end
      if _lineup_customers[A0_43] ~= nil then
        if _lineup_finish[A0_43] ~= nil then
          _lineup_finish[A0_43]:abort()
          _lineup_finish[A0_43] = nil
          RAC_stopNpcMoveTask(A0_43)
        end
        _immobile_lineup_task[A0_43]:abort()
        _immobile_lineup_task[A0_43] = nil
        RAC_setLineupIndex(LINE_NAME_PREFIX .. string.format("%02d", A3_46), A0_43, nil)
        _lineup_customers[A0_43] = nil
      end
      fan_chase = fan_chase + 1
      score = score + 1
      if escape_failed_flag == false and (fan_find_caption_wait_task == nil or not fan_find_caption_wait_task:isRunning()) then
        if caption_interrupt_disabled == false then
          Fn_captionView(FAN_CHARACTER_DATA[A1_44].find_caption[RandI(1, #FAN_CHARACTER_DATA[A1_44].find_caption)])
        end
        fan_find_caption_wait_task = invokeTask(waitSeconds, FAN_FIND_CAPTION_WAIT_SEC)
      end
      print("NPC CHASE ADD:" .. fan_chase .. " / " .. FAN_CHASE_MAX)
      print("NPC CHASE NAME CHECK:" .. A0_43)
      if escape_failed_flag == false then
        if _npc_fan_stay_motion_task[A0_43] ~= nil then
          _npc_fan_stay_motion_task[A0_43]:abort()
          _npc_fan_stay_motion_task[A0_43] = nil
        end
        if _lineup_customers[A0_43] ~= nil then
          RAC_setLineupIndex(LINE_NAME_PREFIX .. string.format("%02d", A3_46), A0_43, nil)
          _lineup_customers[A0_43] = nil
        end
        print("MODEL_TYPE: " .. A1_44)
        _lively_voice_loop_task_table[A0_43] = Sub_LivelyVoice_Loop(A2_45, 1, A0_43)
        L6_49:inform(nil, {
          aimPlayer = true,
          anim_in = "inform_ex_in_00",
          anim_lp = "inform_ex_00",
          anim_out = "inform_ex_out_00"
        })
        waitSeconds(0.8)
        L6_49:informEnd()
        repeat
          wait()
        until L6_49:isInformEnd()
        waitSeconds(_npc_fan_move_param.npc_move_wait_sec)
        print("NPC MOVE:" .. A0_43 .. " START")
        npc_fan_move_task[A0_43] = Fn_moveNpc(L6_49, {
          "locator2_kit_tailing_point_01"
        }, {
          anim_run_speed = _npc_fan_move_param.speed,
          runLength = -1
        })
      end
      while fan_touch_stop_flag == false do
        wait(2)
        if Player:getAction() == Player.kAction_Jump then
        else
        end
        L8_51 = Fn_getDistanceToPlayer(L7_50)
        if npc_fan_move_task[A0_43] == nil or not npc_fan_move_task[A0_43]:isRunning() then
          if L8_51 > 1 then
            if _lively_voice_loop_task_table[A0_43] ~= nil then
              _lively_voice_loop_task_table[A0_43]:abort()
              _lively_voice_loop_task_table[A0_43] = nil
            end
            npc_fan_move_task[A0_43] = Fn_moveNpc(L6_49, {
              "locator2_kit_tailing_point_01"
            }, {
              anim_run_speed = _npc_fan_move_param.speed,
              runLength = -1,
              arrivedLength = 1
            })
            _lively_voice_loop_task_table[A0_43] = Sub_LivelyVoice_Loop(A2_45, 1, A0_43)
          else
            npc_fan_move_task[A0_43] = invokeTask(Fn_turnNpc, A0_43)
          end
        end
        if 0 < _npc_fan_move_param.move_off_distance then
          if L8_51 > _npc_fan_move_param.move_off_distance then
            if npc_fan_move_task[A0_43] ~= nil then
              print("NPC MOVE:" .. A0_43 .. " STOP")
              npc_fan_move_task[A0_43]:abort()
              npc_fan_move_task[A0_43] = nil
            end
            if _lively_voice_loop_task_table[A0_43] ~= nil then
              _lively_voice_loop_task_table[A0_43]:abort()
              _lively_voice_loop_task_table[A0_43] = nil
            end
            RAC_stopNpcMoveTask(A0_43)
            print("NPC MOVE:" .. A0_43 .. " DISTANCE BREAK")
            fan_chase = fan_chase - 1
            if npc_motion_use[A0_43] == true then
              Sub_fan_motion_rand(A0_43, FAN_CHARACTER_DATA[A1_44].lost_motion, FAN_CHARACTER_DATA[A1_44].main_type, false)
            end
            break
          end
        elseif L8_51 > _npc_fan_move_param.npc_out_length and RAC_RaycastEyeSightBase(L7_50, Fn_getPlayer(), L8_51 + 1, _npc_fan_move_param.npc_degree_h) == false then
          if npc_fan_move_task[A0_43] ~= nil then
            print("NPC MOVE:" .. A0_43 .. " STOP")
            npc_fan_move_task[A0_43]:abort()
            npc_fan_move_task[A0_43] = nil
          end
          if _lively_voice_loop_task_table[A0_43] ~= nil then
            _lively_voice_loop_task_table[A0_43]:abort()
            _lively_voice_loop_task_table[A0_43] = nil
          end
          RAC_stopNpcMoveTask(A0_43)
          print("NPC MOVE:" .. A0_43 .. " SIGHT BREAK")
          fan_chase = fan_chase - 1
          if npc_motion_use[A0_43] == true then
            Sub_fan_motion_rand(A0_43, FAN_CHARACTER_DATA[A1_44].lost_motion, FAN_CHARACTER_DATA[A1_44].main_type, false)
          end
          break
        end
        if Player:getAction() == Player.kAction_Idle then
          if (npc_idle_touch_check_task[A0_43] == nil or not npc_idle_touch_check_task[A0_43]:isRunning()) and L8_51 < ESCAPE_FAILED_DISTANCE_IDLE then
            print("NPC MOVE:" .. A0_43 .. "IDLE FAILED CHECK START")
            npc_idle_touch_check_task[A0_43] = invokeTask(function()
              local L1_54
              L1_54 = false
              while true do
                if 0 >= ESCAPE_FAILED_DISTANCE_IDLE_SEC then
                  L1_54 = true
                  break
                end
                if Player:getAction() ~= Player.kAction_Idle then
                  L1_54 = false
                  break
                end
                waitSeconds(0.1)
              end
              if L1_54 then
                print("NPC MOVE:" .. A0_43 .. "IDLE FAILED CHECK END")
                Fn_captionView(FAN_CHARACTER_DATA[A1_44].touch_caption[RandI(1, #FAN_CHARACTER_DATA[A1_44].touch_caption)])
                escape_failed_flag = true
              else
                print("NPC MOVE:" .. A0_43 .. "IDLE FAILED CHECK STOP")
              end
            end)
          end
        elseif (0 <= 0 or 0 >= 12) and (L8_51 < ESCAPE_FAILED_DISTANCE_MOVE or Fn_getDistanceToPlayer(L7_50:getWorldPos() + Vector(0, 1, 0)) < ESCAPE_FAILED_DISTANCE_MOVE) then
          Fn_captionView(FAN_CHARACTER_DATA[A1_44].touch_caption[RandI(1, #FAN_CHARACTER_DATA[A1_44].touch_caption)])
          escape_failed_flag = true
          fan_touch_stop_flag = true
          print("NPC MOVE:" .. A0_43 .. " TOUCH")
          break
        end
      end
      if npc_idle_touch_check_task[A0_43] ~= nil then
        print("NPC MOVE:" .. A0_43 .. "IDLE FAILED CHECK STOP")
        npc_idle_touch_check_task[A0_43]:abort()
        npc_idle_touch_check_task[A0_43] = nil
      end
      print("NPC CHASE REMOVE:" .. fan_chase .. " / " .. FAN_CHASE_MAX)
    end
  end)
end
L0_0 = "Sub_MissionFailedNpcProcess"
_ENV[L0_0] = function()
  local L0_55, L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62
  fan_touch_stop_flag = true
  L0_55 = nil
  L1_56 = {}
  if L2_57 ~= nil then
    L2_57(L3_58)
    mob_to_npc_main_task = nil
    L2_57()
  end
  for L5_60 = 1, #L3_58 do
    L6_61 = FAN_CHARA_MOVE_TABLE
    L6_61 = L6_61[L5_60]
    L6_61 = L6_61.name
    L7_62 = npc_fan_move_task
    L7_62 = L7_62[L6_61]
    if L7_62 ~= nil then
      L7_62 = table
      L7_62 = L7_62.insert
      L7_62(L1_56, L6_61)
    end
    L7_62 = Sub_NpcTaskStop
    L7_62(L6_61)
  end
  for L5_60, L6_61 in L2_57(L3_58) do
    L7_62 = print
    L7_62("MOB2NPC PROCESS : " .. L6_61)
    L7_62 = L6_61
    if npc_fan_move_task[L7_62] ~= nil then
      table.insert(L1_56, L7_62)
    end
    Sub_NpcTaskStop(L7_62)
  end
  if L2_57 == false then
    L0_55 = L2_57
  end
  L2_57(L3_58)
  for L5_60, L6_61 in L2_57(L3_58) do
    L7_62 = {}
    L7_62.npc_name = L6_61
    L7_62.se_task = nil
    function L7_62.update(A0_63)
      if _lively_voice_loop_task_table[A0_63.npc_name] ~= nil then
        _lively_voice_loop_task_table[A0_63.npc_name]:abort()
        _lively_voice_loop_task_table[A0_63.npc_name] = nil
      end
      A0_63.se_task = Sub_LivelyVoice_Access(npc_model_name[A0_63.npc_name], 2, A0_63.npc_name)
      Fn_turnNpc(A0_63.npc_name)
      if npc_motion_use[A0_63.npc_name] == true then
        if RandI(1, 2) == 1 then
          Fn_findNpc(A0_63.npc_name):inform(nil, {
            aimPlayer = true,
            anim_in = "inform_ex_in_00",
            anim_lp = "inform_ex_00",
            anim_out = "inform_ex_out_00"
          })
        else
          Sub_fan_motion_rand(A0_63.npc_name, FAN_CHARACTER_DATA[Sub_MobType_discrimination(npc_model_name[A0_63.npc_name])].touch_motion, FAN_CHARACTER_DATA[Sub_MobType_discrimination(npc_model_name[A0_63.npc_name])].main_type, false, {isRepeat = false, isStop = true})
        end
      else
        Fn_findNpc(A0_63.npc_name):inform(nil, {
          aimPlayer = true,
          anim_in = "inform_ex_in_00",
          anim_lp = "inform_ex_00",
          anim_out = "inform_ex_out_00"
        })
      end
    end
    function L7_62.destractor(A0_64)
      if A0_64.se_task ~= nil then
        A0_64.se_task:abort()
        A0_64.se_task = nil
      end
    end
    failed_action_task[L6_61] = RAC_InvokeTaskWithDestractor(L7_62.update, L7_62.destractor, L7_62)
  end
  if L0_55 ~= nil then
    L2_57(L3_58)
    L2_57(L3_58)
    L0_55 = nil
  end
end
L0_0 = "Sub_MissionSuccessNpcProcess"
_ENV[L0_0] = function()
  local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70
  if L0_65 ~= nil then
    L0_65(L1_66)
    mob_to_npc_main_task = nil
  end
  for L3_68 = 1, #L1_66 do
    L4_69 = FAN_CHARA_MOVE_TABLE
    L4_69 = L4_69[L3_68]
    L4_69 = L4_69.name
    L5_70 = Sub_NpcTaskStop
    L5_70(L4_69)
  end
  for L3_68, L4_69 in L0_65(L1_66) do
    L5_70 = _npc_fan_stay_motion_task
    L5_70 = L5_70[L3_68]
    L5_70 = L5_70.abort
    L5_70(L5_70)
  end
  _npc_fan_stay_motion_task = L0_65
  for L3_68, L4_69 in L0_65(L1_66) do
    L5_70 = L4_69
    Sub_NpcTaskStop(L5_70)
  end
  if L0_65 ~= nil then
    L0_65(L1_66)
    fan_find_caption_wait_task = nil
  end
end
L0_0 = "Sub_npc_stay_motion_task"
_ENV[L0_0] = function(A0_71, A1_72, A2_73)
  return invokeTask(function()
    local L0_74, L1_75
    L0_74 = A2_73
    if L0_74 == "accordion" then
      L0_74 = Fn_playMotionNpc
      L1_75 = A0_71
      L0_74(L1_75, "accordion_00", false, {isRepeat = true})
      while true do
        L0_74 = wait
        L0_74()
      end
    else
      L0_74 = A2_73
      if L0_74 == "salesman" then
        L0_74 = Fn_playMotionNpc
        L1_75 = A0_71
        L0_74(L1_75, "vendor_attract_00", false, {isRepeat = true})
        while true do
          L0_74 = wait
          L0_74()
        end
      else
        L0_74 = FAN_CHARACTER_DATA
        L1_75 = A1_72
        L0_74 = L0_74[L1_75]
        L0_74 = L0_74.stay_motion
        L1_75 = A2_73
        L0_74 = L0_74[L1_75]
        if L0_74 ~= nil then
          while true do
            L1_75 = RandF
            L1_75 = L1_75(0, 3)
            Fn_playMotionNpc(A0_71, L0_74[RandI(1, #L0_74)], true)
            Fn_playMotionNpc(A0_71, "stay", false, {animBlendDuration = 0.7})
            if L1_75 > 0 then
              waitSeconds(L1_75)
            end
          end
        else
          L1_75 = print
          L1_75("ERROR: stay motion is nil. npc = " .. A0_71)
        end
      end
    end
  end)
end
L0_0 = "Sub_MobType_discrimination"
_ENV[L0_0] = function(A0_76)
  local L1_77, L2_78, L4_79, L5_80
  L1_77 = 1
  for _FORV_5_ = 1, #L4_79 do
    for _FORV_9_ in pairs(FAN_CHARACTER_DATA[_FORV_5_].model_type) do
      if string.find(A0_76, FAN_CHARACTER_DATA[_FORV_5_].model_type[_FORV_9_]) then
        L1_77 = _FORV_5_
      end
    end
  end
  return L1_77
end
L0_0 = "Sub_MobToNpc_SystemTask"
_ENV[L0_0] = function()
  local L0_81
  L0_81 = Fn_createChangeMobToNpc
  L0_81(mob_to_npc_table, {
    degree = 45,
    range = (_npc_fan_move_param.npc_in_length or DEFAULT_NPC_IN_LENGTH) + 1
  })
  L0_81 = 0
  return invokeTask(function()
    local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89
    while true do
      L0_82 = {}
      for L4_86, L5_87 in L1_83(L2_84) do
        L6_88 = npc_model_name
        L6_88 = L6_88[L7_89]
        if L6_88 == nil then
          L6_88 = L0_81
          L6_88 = L6_88 + 1
          L0_81 = L6_88
          L6_88 = print
          L6_88(L7_89)
          L6_88 = L5_87.name
          print("Mob To Npc", L6_88)
          print("chara_type", L7_89)
          Sub_fan_MotionLoad(L6_88, L7_89, "alone")
          npc_model_name[L6_88] = L7_89
          npc_motion_use[L6_88] = true
          npc_fan_task[L6_88] = invokeFanNpcTask(L6_88, Sub_MobType_discrimination(L7_89), L7_89, nil)
          table.insert(mob_to_npc_name, L6_88)
          table.insert(L0_82, L6_88)
        end
      end
      for L4_86, L5_87 in L1_83(L2_84) do
        L6_88 = nil
        for _FORV_10_, _FORV_11_ in L7_89(mob_to_npc_table) do
          if _FORV_11_.name == L5_87 then
            L6_88 = _FORV_10_
            break
          end
        end
        if L6_88 ~= nil then
          L7_89(mob_to_npc_table, L6_88)
        end
      end
      L1_83()
    end
  end)
end
L0_0 = "Sub_LivelyVoice_Loop"
_ENV[L0_0] = function(A0_90, A1_91, A2_92)
  local L3_93
  L3_93 = {}
  L3_93.npc_name = A2_92
  L3_93.model_name = A0_90
  L3_93.voice_no = A1_91
  L3_93.se_task = nil
  function L3_93.update(A0_94)
    local L1_95
    while true do
      L1_95 = Sub_LivelyVoice_Access
      L1_95 = L1_95(A0_94.model_name, A0_94.voice_no, A0_94.npc_name)
      A0_94.se_task = L1_95
      while true do
        L1_95 = A0_94.se_task
        if L1_95 ~= nil then
          L1_95 = A0_94.se_task
          L1_95 = L1_95.isRunning
          L1_95 = L1_95(L1_95)
        end
        if L1_95 then
          L1_95 = wait
          L1_95()
        end
      end
      L1_95 = A0_94.se_task
      if L1_95 ~= nil then
        L1_95 = A0_94.se_task
        L1_95 = L1_95.abort
        L1_95(L1_95)
        A0_94.se_task = nil
      end
      L1_95 = RandF
      L1_95 = L1_95(5, 10)
      waitSeconds(L1_95)
    end
  end
  function L3_93.destractor(A0_96)
    if A0_96.task_obj ~= nil then
      A0_96.task_obj:abort()
      A0_96.task_obj = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L3_93.update, L3_93.destractor, L3_93)
end
L0_0 = "Sub_LivelyVoice_Access"
_ENV[L0_0] = function(A0_97, A1_98, A2_99)
  return invokeTask(function()
    local L0_100, L1_101, L2_102, L3_103, L4_104
    L0_100, L1_101, L2_102 = nil, nil, nil
    L3_103 = Fn_findNpcPuppet
    L3_103 = L3_103(L4_104)
    for _FORV_7_ = 1, #lively_voice_group do
      for _FORV_11_ in pairs(lively_voice_group[_FORV_7_].model) do
        if string.find(A0_97, lively_voice_group[_FORV_7_].model[_FORV_11_]) then
          L0_100 = _FORV_7_
        end
      end
    end
    if L0_100 == nil then
      L0_100 = 1
    end
    if L4_104 == false then
      while 30 > 0 do
        wait()
        if _radio_se_is_active == true then
          Sound:stopSEHandle(L4_104)
          break
        end
      end
    end
  end)
end
L0_0 = "Sub_MissionFailedRestartProcess"
_ENV[L0_0] = function()
  local L0_105, L1_106, L2_107, L3_108, L4_109, L5_110
  L0_105()
  for L3_108 = 1, #L1_106 do
    L4_109 = FAN_CHARA_MOVE_TABLE
    L4_109 = L4_109[L3_108]
    L4_109 = L4_109.name
    L5_110 = Sub_NpcTaskStop
    L5_110(L4_109)
    L5_110 = Fn_setNpcActive
    L5_110(L4_109, true)
    L5_110 = Fn_warpNpc
    L5_110(L4_109, FAN_CHARA_MOVE_TABLE[L3_108].node)
    L5_110 = _lineup_customers
    L5_110 = L5_110[L4_109]
    if L5_110 ~= nil then
      L5_110 = RAC_setLineupIndex
      L5_110(LINE_NAME_PREFIX .. string.format("%02d", FAN_CHARA_MOVE_TABLE[L3_108].line_no), L4_109, nil)
      L5_110 = _lineup_customers
      L5_110[L4_109] = nil
    end
    L5_110 = Sub_GetNpcTypeName
    L5_110 = L5_110(L4_109, FAN_CHARA_MOVE_TABLE[L3_108].type)
    _npc_fan_stay_motion_task[L4_109] = Sub_npc_stay_motion_task(L4_109, Sub_MobType_discrimination(L5_110), FAN_CHARA_MOVE_TABLE[L3_108].stay_type)
  end
  for L3_108 = 1, #L1_106 do
    L4_109 = FAN_CHARA_IMMOBILE_TABLE
    L4_109 = L4_109[L3_108]
    L4_109 = L4_109.name
    L5_110 = Sub_NpcTaskStop
    L5_110(L4_109)
    L5_110 = Fn_setNpcActive
    L5_110(L4_109, true)
    L5_110 = Fn_warpNpc
    L5_110(L4_109, FAN_CHARA_IMMOBILE_TABLE[L3_108].node)
    L5_110 = Sub_GetNpcTypeName
    L5_110 = L5_110(L4_109, FAN_CHARA_IMMOBILE_TABLE[L3_108].type)
    _npc_fan_stay_motion_task[L4_109] = Sub_npc_stay_motion_task(L4_109, Sub_MobType_discrimination(L5_110), FAN_CHARA_IMMOBILE_TABLE[L3_108].stay_type)
  end
  for L3_108, L4_109 in L0_105(L1_106) do
    L5_110 = L4_109
    Sub_NpcTaskStop(L5_110)
    Fn_disappearMobToNpc(L5_110, 0)
    print("MOB2NPC REMOVE:" .. L5_110)
  end
  mob_to_npc_table = L0_105
  mob_to_npc_name = L0_105
  L0_105(L1_106)
  escape_failed_flag = false
  fan_touch_stop_flag = false
  check_course_out = false
end
L0_0 = "Sub_MissionFailedRestartTask"
_ENV[L0_0] = function()
  local L0_111, L1_112, L2_113, L3_114, L4_115, L5_116, L6_117
  for L3_114 = 1, #L1_112 do
    L4_115 = FAN_CHARA_MOVE_TABLE
    L4_115 = L4_115[L3_114]
    L4_115 = L4_115.name
    L5_116 = print
    L6_117 = "NPC TASK RESTART:"
    L6_117 = L6_117 .. L4_115
    L5_116(L6_117)
    L5_116 = npc_fan_task
    L5_116 = L5_116[L4_115]
    if L5_116 ~= nil then
      L5_116 = npc_fan_task
      L5_116 = L5_116[L4_115]
      L6_117 = L5_116
      L5_116 = L5_116.abort
      L5_116(L6_117)
      L5_116 = npc_fan_task
      L5_116[L4_115] = nil
    end
    L5_116 = Sub_GetNpcTypeName
    L6_117 = L4_115
    L5_116 = L5_116(L6_117, FAN_CHARA_MOVE_TABLE[L3_114].type)
    L6_117 = FAN_CHARA_MOVE_TABLE
    L6_117 = L6_117[L3_114]
    L6_117 = L6_117.line_no
    npc_fan_task[L4_115] = invokeFanNpcTask(L4_115, Sub_MobType_discrimination(L5_116), L5_116, L6_117)
  end
  for L3_114 = 1, #L1_112 do
    L4_115 = FAN_CHARA_IMMOBILE_TABLE
    L4_115 = L4_115[L3_114]
    L4_115 = L4_115.name
    L5_116 = npc_fan_immobile_task
    L5_116 = L5_116[L4_115]
    if L5_116 ~= nil then
      L5_116 = npc_fan_immobile_task
      L5_116 = L5_116[L4_115]
      L6_117 = L5_116
      L5_116 = L5_116.abort
      L5_116(L6_117)
      L5_116 = npc_fan_immobile_task
      L5_116[L4_115] = nil
    end
    L5_116 = Sub_GetNpcTypeName
    L6_117 = L4_115
    L5_116 = L5_116(L6_117, FAN_CHARA_IMMOBILE_TABLE[L3_114].type)
    L6_117 = npc_fan_immobile_task
    L6_117[L4_115] = Sub_ImmobileFanTask(L4_115, FAN_CHARA_IMMOBILE_TABLE[L3_114].motion_use, Sub_MobType_discrimination(L5_116))
  end
  if L0_111 ~= nil then
    L0_111(L1_112)
    fan_find_caption_wait_task = nil
  end
end
L0_0 = "Sub_NpcTaskStop"
_ENV[L0_0] = function(A0_118)
  print("NPC MOVE TASK KILL:(RUNNING)" .. A0_118)
  if npc_fan_task[A0_118] ~= nil then
    npc_fan_task[A0_118]:abort()
    npc_fan_task[A0_118] = nil
  end
  if npc_fan_immobile_task[A0_118] ~= nil then
    npc_fan_immobile_task[A0_118]:abort()
    npc_fan_immobile_task[A0_118] = nil
  end
  if npc_fan_move_task[A0_118] ~= nil then
    npc_fan_move_task[A0_118]:abort()
    npc_fan_move_task[A0_118] = nil
  end
  if npc_idle_touch_check_task[A0_118] ~= nil then
    npc_idle_touch_check_task[A0_118]:abort()
    npc_idle_touch_check_task[A0_118] = nil
  end
  if _lively_voice_loop_task_table[A0_118] ~= nil then
    _lively_voice_loop_task_table[A0_118]:abort()
    _lively_voice_loop_task_table[A0_118] = nil
  end
  if _npc_fan_stay_motion_task[A0_118] ~= nil then
    _npc_fan_stay_motion_task[A0_118]:abort()
    _npc_fan_stay_motion_task[A0_118] = nil
  end
  if failed_action_task[A0_118] ~= nil then
    failed_action_task[A0_118]:abort()
    failed_action_task[A0_118] = nil
  end
  if _immobile_lineup_task[A0_118] ~= nil then
    _immobile_lineup_task[A0_118]:abort()
    _immobile_lineup_task[A0_118] = nil
  end
  if _lineup_finish[A0_118] ~= nil then
    _lineup_finish[A0_118]:abort()
    _lineup_finish[A0_118] = nil
  end
  RAC_stopNpcMoveTask(A0_118)
  Fn_findNpc(A0_118):resetSightParam()
end
L0_0 = "Sub_MissionSuccessNpcDelete"
_ENV[L0_0] = function()
  local L0_119, L1_120, L2_121, L3_122, L4_123
  for L3_122 = 1, #L1_120 do
    L4_123 = FAN_CHARA_MOVE_TABLE
    L4_123 = L4_123[L3_122]
    L4_123 = L4_123.name
    Sub_NpcTaskStop(L4_123)
    Fn_disappearNpc(L4_123)
    print("NPC DELETE:" .. L4_123)
  end
  for L3_122 = 1, #L1_120 do
    L4_123 = FAN_CHARA_IMMOBILE_TABLE
    L4_123 = L4_123[L3_122]
    L4_123 = L4_123.name
    Sub_NpcTaskStop(L4_123)
    Fn_disappearNpc(L4_123)
    print("NPC DELETE:" .. L4_123)
  end
  for L3_122, L4_123 in L0_119(L1_120) do
    Sub_NpcTaskStop(L4_123)
    Fn_disappearMobToNpc(L4_123, 0)
    print("MOB2NPC REMOVE:" .. L4_123)
  end
  for L3_122, L4_123 in L0_119(L1_120) do
    Sub_NpcTaskStop(L4_123.name)
    Fn_disappearMobToNpc(L4_123.name, 0)
    print("MOB2NPC REMOVE:" .. L4_123.name)
  end
  L0_119(L1_120)
end
L0_0 = "Sub_GetNpcTypeName"
_ENV[L0_0] = function(A0_124, A1_125)
  local L2_126
  L2_126 = nil
  if string.find(A1_125, "_hex") ~= nil then
    L2_126 = Fn_getRandamNpcType(A0_124)
  else
    L2_126 = A1_125
  end
  return L2_126
end
L0_0 = "Sub_addLineup"
_ENV[L0_0] = function(A0_127, A1_128, A2_129, A3_130, A4_131)
  local L5_132
  L5_132 = RAC_addLineup
  L5_132 = L5_132(A0_127)
  if L5_132 ~= nil then
    print("addLineup.." .. A1_128)
    RAC_setLineupIndex(A0_127, A1_128, L5_132)
    return invokeTask(function()
      local L0_133, L1_134, L2_135, L3_136
      L0_133 = Fn_findNpc
      L1_134 = A1_128
      L0_133 = L0_133(L1_134)
      while true do
        repeat
          repeat
            L1_134 = RAC_getLineupIndex
            L2_135 = A0_127
            L3_136 = A1_128
            L1_134 = L1_134(L2_135, L3_136, L5_132)
            if L1_134 ~= nil then
              L2_135 = Fn_get_distance
              L3_136 = A2_129[L1_134]
              L3_136 = L3_136.getWorldPos
              L3_136 = L3_136(L3_136)
              L2_135 = L2_135(L3_136, _lineup_customers[A1_128]:getWorldPos())
              if L2_135 > 0.2 then
                L2_135 = _npc_fan_stay_motion_task
                L3_136 = A1_128
                L2_135 = L2_135[L3_136]
                if L2_135 ~= nil then
                  L2_135 = _npc_fan_stay_motion_task
                  L3_136 = A1_128
                  L2_135 = L2_135[L3_136]
                  L3_136 = L2_135
                  L2_135 = L2_135.abort
                  L2_135(L3_136)
                  L2_135 = _npc_fan_stay_motion_task
                  L3_136 = A1_128
                  L2_135[L3_136] = nil
                end
                L2_135 = _lineup_finish
                L3_136 = A1_128
                L2_135[L3_136] = RAC_invokeMoveCharaTask2(A1_128, {
                  A2_129[L1_134]:getName()
                }, {
                  arrivedLength = 0.05,
                  runLength = 65535,
                  anim_speed_over = true,
                  navimesh = false
                })
                while true do
                  L2_135 = _lineup_finish
                  L3_136 = A1_128
                  L2_135 = L2_135[L3_136]
                  if L2_135 ~= nil then
                    L2_135 = _lineup_finish
                    L3_136 = A1_128
                    L2_135 = L2_135[L3_136]
                    L3_136 = L2_135
                    L2_135 = L2_135.isRunning
                    L2_135 = L2_135(L3_136)
                  end
                  if L2_135 then
                    L2_135 = wait
                    L2_135()
                  end
                end
                L2_135 = _lineup_finish
                L3_136 = A1_128
                L2_135 = L2_135[L3_136]
                if L2_135 ~= nil then
                  L2_135 = _lineup_finish
                  L3_136 = A1_128
                  L2_135 = L2_135[L3_136]
                  L3_136 = L2_135
                  L2_135 = L2_135.abort
                  L2_135(L3_136)
                  L2_135 = _lineup_finish
                  L3_136 = A1_128
                  L2_135[L3_136] = nil
                end
                if L1_134 > 1 then
                  L2_135 = Fn_turnNpc
                  L3_136 = L0_133
                  L2_135(L3_136, A2_129[L1_134 - 1])
                end
                L2_135 = _npc_fan_stay_motion_task
                L3_136 = A1_128
                L2_135[L3_136] = Sub_npc_stay_motion_task(A1_128, A3_130, A4_131)
              else
                L2_135 = wait
                L2_135()
              end
              if L1_134 == 1 then
                L2_135 = LINEUP_RETRY
                L3_136 = Fn_get_distance
                L3_136 = L3_136(A2_129[1]:getWorldPos(), _lineup_customers[A1_128]:getWorldPos())
                if not (L2_135 > L3_136) then
                  else
                    L2_135 = L1_134 - 1
                    while true do
                      L3_136 = RAC_findLineupIndex
                      L3_136 = L3_136(A0_127, L2_135)
                      if L3_136 == nil then
                        print("HAS_INDEX NIL")
                        break
                      end
                      if not L3_136 then
                        while true do
                          print("FRONT to :" .. L1_134 .. " " .. L2_135)
                          RAC_setLineupIndex(A0_127, A1_128, L2_135)
                          L2_135 = L2_135 - 1
                          if L2_135 ~= 0 then
                            L3_136 = RAC_findLineupIndex(A0_127, L2_135)
                          end
                        end
                        break
                      end
                      if _lineup_customers[A1_128] ~= nil then
                      else
                        print("NIL!!!!!!!!!!!!!!!!!!!lineup_name.......919......." .. A1_128)
                      end
                      wait(5)
                    end
                  end
                end
            end
          until not L3_136
        until not (LINEUP_RETRY < Fn_get_distance(A2_129[L1_134]:getWorldPos(), _lineup_customers[A1_128]:getWorldPos()))
      end
      L1_134 = print
      L2_135 = "LineupFirst.."
      L3_136 = A1_128
      L2_135 = L2_135 .. L3_136
      L1_134(L2_135)
    end)
  end
  return nil
end
L0_0 = "Sub_fan_culling_task"
_ENV[L0_0] = function()
  return invokeTask(function()
    local L0_137, L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147
    while true do
      for L3_140, L4_141 in L0_137(L1_138) do
        L5_142 = fan_chase
        L6_143 = ACTIVE_FAN_CHASE_MAX
        if not (L5_142 <= L6_143) then
          L6_143 = L4_141
          L5_142 = L4_141.isRunning
          L5_142 = L5_142(L6_143)
          if L5_142 then
            L5_142 = npc_fan_move_task
            L5_142 = L5_142[L3_140]
            if L5_142 ~= nil then
              L5_142 = npc_fan_move_task
              L5_142 = L5_142[L3_140]
              L6_143 = L5_142
              L5_142 = L5_142.isRunning
              L5_142 = L5_142(L6_143)
              if L5_142 then
                L5_142 = Fn_findNpcPuppet
                L6_143 = L3_140
                L5_142 = L5_142(L6_143)
                L6_143 = Fn_getDistanceToPlayer
                L6_143 = L6_143(L7_144)
                if L6_143 > L7_144 then
                  if L7_144 ~= false then
                    L10_147 = 60
                  elseif L7_144 == false then
                    L7_144(L8_145)
                    L10_147 = 4
                    if L7_144 == "mtn_" then
                      L7_144(L8_145)
                      for L10_147, _FORV_11_ in L7_144(L8_145) do
                        if L3_140 == _FORV_11_ then
                          table.remove(mob_to_npc_name, L10_147)
                          break
                        end
                      end
                    else
                      L7_144(L8_145, L9_146)
                    end
                    fan_chase = L7_144
                  end
                end
              end
            end
          end
        end
      end
      L0_137(L1_138)
    end
  end)
end
