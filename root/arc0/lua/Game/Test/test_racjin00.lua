import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Misc/balloon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Npc/npc.lua")
puppet_tbl = {}
in_sensor_count = 0
enmgen = nil
request_respawn = false
stop_respawn = false
gimmick_bg_table = {}
npc_man_count = 36
npc_wom_count = 17
anim_chk_chara_type_tbl = {
  "kid01",
  "kid02",
  "cid01",
  "crow01",
  "duck01",
  "dus01",
  "ep90_thief",
  "gull01",
  "gull02",
  "man01",
  "man02",
  "man05",
  "man32",
  "man33",
  "man34",
  "man36",
  "man38",
  "man39",
  "man40",
  "man41",
  "man44",
  "man46",
  "man48",
  "man56",
  "man57",
  "man78",
  "miz01",
  "phi01",
  "rudder",
  "ryz01",
  "sis01",
  "thief",
  "tkg05",
  "ve01",
  "ve02",
  "ve03",
  "vog01",
  "wom01",
  "wom05",
  "wom17",
  "wom21",
  "wom23",
  "wom26",
  "wom27",
  "wom41"
}
anim_name_tbl = {
  kid01 = {
    "balloon_lost",
    "balloon_stay",
    "balloon_walk",
    "beckon",
    "bye",
    "cry_00",
    "cry_in_00",
    "cry_out_00",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "proud_00",
    "regret_00",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "run_down",
    "sad",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_02",
    "stay_03",
    "talk_00",
    "talk_01",
    "talk_angry_00",
    "talk_laugh_00",
    "talk_sad_00",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  kid02 = {
    "balloon_lost",
    "balloon_stay",
    "balloon_walk",
    "beckon",
    "bye",
    "cry_00",
    "cry_in_00",
    "cry_out_00",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "proud_00",
    "regret_00",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "run_down",
    "sad",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_02",
    "stay_03",
    "talk_00",
    "talk_01",
    "talk_angry_00",
    "talk_laugh_00",
    "talk_sad_00",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  kid03 = {
    "balloon_lost",
    "balloon_stay",
    "balloon_walk",
    "beckon",
    "bye",
    "cry_00",
    "cry_in_00",
    "cry_out_00",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "proud_00",
    "regret_00",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "run_down",
    "sad",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_02",
    "stay_03",
    "talk_00",
    "talk_01",
    "talk_angry_00",
    "talk_laugh_00",
    "talk_sad_00",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  kid04 = {
    "balloon_lost",
    "balloon_stay",
    "balloon_walk",
    "beckon",
    "bye",
    "cry_00",
    "cry_in_00",
    "cry_out_00",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "proud_00",
    "regret_00",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "run_down",
    "sad",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_02",
    "stay_03",
    "talk_00",
    "talk_01",
    "talk_angry_00",
    "talk_laugh_00",
    "talk_sad_00",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  kid06 = {
    "balloon_lost",
    "balloon_stay",
    "balloon_walk",
    "beckon",
    "bye",
    "cry_00",
    "cry_in_00",
    "cry_out_00",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "proud_00",
    "regret_00",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "run_down",
    "sad",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_02",
    "stay_03",
    "talk_00",
    "talk_01",
    "talk_angry_00",
    "talk_laugh_00",
    "talk_sad_00",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  cid01 = {
    "afraid_00",
    "bye",
    "fall",
    "fall_00",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "land_00",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_l_00",
    "turn_r",
    "turn_r_00",
    "walk",
    "walk1",
    "walk2",
    "walk_00",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r",
    "wave_hand_00",
    "wave_hand_01"
  },
  crow01 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  duck01 = {
    "quack_00",
    "run",
    "run1",
    "run2",
    "stay",
    "stay_01",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2"
  },
  dus01 = {
    "run",
    "stay",
    "turn_l",
    "turn_r",
    "walk",
    "walk_b"
  },
  ep90_thief = {
    "accordion_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_01",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  gull01 = {
    "eat",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fly",
    "fly1",
    "landing",
    "quack_00",
    "run",
    "run1",
    "run2",
    "stay",
    "stay_00",
    "stay_01",
    "takeoff",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2"
  },
  gull02 = {
    "fly",
    "fly1",
    "quack_00",
    "run",
    "run1",
    "run2",
    "stay",
    "stay_01",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2"
  },
  man01 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man02 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man05 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man32 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man33 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man34 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man36 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man38 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man39 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man40 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man41 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man44 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man46 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man48 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man56 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man57 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  man78 = {
    "accordion_00",
    "breath_00",
    "breath_in_00",
    "breath_out_00",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "driver_01",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "feeding_pigeon_00",
    "fly",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "porter_stay",
    "porter_walk",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "scared_00",
    "scared_in_00",
    "scared_out_00",
    "sit_00",
    "sit_01",
    "sit_floor_00",
    "sit_floor_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_arrest_00",
    "stay",
    "stay_00",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  miz01 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  phi01 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_01",
    "stay_02",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  rudder = {"rudder", "stay"},
  ryz01 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_01",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  sis01 = {
    "afraid_00",
    "arrest_00",
    "bye",
    "confuse_00",
    "confuse_01",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "hit_b_00",
    "hit_b_r_00",
    "hit_f_00",
    "hit_f_r_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "photo_couple_00",
    "photo_couple_in_00",
    "photo_couple_out_00",
    "pray_00",
    "pray_in_00",
    "pray_out_00",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "search_00",
    "shock_00",
    "shock_in_00",
    "shock_out_00",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_in_turn_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched_00",
    "stay",
    "stay_01",
    "stay_02",
    "stay_03",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "trouble_00",
    "turn_l",
    "turn_r",
    "vendor_attract_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  thief = {
    "accordion_00",
    "ash",
    "attack",
    "attack1",
    "bye",
    "check",
    "check_00",
    "cook_yakitori_00",
    "count_00",
    "crane",
    "damaged",
    "damaged_00",
    "damaged_01",
    "damaged_02",
    "damaged_atk_back_00",
    "damaged_atk_back_01",
    "damaged_atk_back_02",
    "damaged_atk_front_00",
    "damaged_atk_front_01",
    "damaged_atk_front_02",
    "damaged_large_back_end",
    "damaged_large_back_standup",
    "damaged_large_back_start",
    "damaged_large_front_end",
    "damaged_large_front_standup",
    "damaged_large_front_start",
    "damaged_middle_back",
    "damaged_middle_front",
    "down_lp_00",
    "down_lp_01",
    "down_st_00",
    "down_st_01",
    "driver_01",
    "dynamics_down_back",
    "dynamics_down_front",
    "dynamics_finish_back_standup",
    "dynamics_finish_front_standup",
    "ep90_demo_00",
    "ep90_demo_01",
    "ep90_demo_02",
    "fall",
    "fall2",
    "fall_damage",
    "fall_damage_standup",
    "fighting",
    "grabbed",
    "greeting",
    "gripping_ship_00",
    "gripping_ship_01",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "lookaround_01",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "pickup",
    "porter_walk_01",
    "reply_no",
    "reply_yes",
    "rudder",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatcher_00",
    "snatcher_01",
    "snatcher_arrest_00",
    "stay",
    "stay_01",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "throw",
    "touched",
    "turn_l",
    "turn_r",
    "viecle_a_00",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_fighting",
    "walk_fighting_b",
    "walk_fighting_b_loop",
    "walk_fighting_l",
    "walk_fighting_l_loop",
    "walk_fighting_loop",
    "walk_fighting_r",
    "walk_fighting_r_loop",
    "walk_l",
    "walk_r"
  },
  tkg05 = {
    "accept_00",
    "angry_00",
    "damage_large_b_00",
    "damage_large_f_00",
    "damage_small_b_00",
    "damage_small_f_00",
    "dig_00",
    "dig_01",
    "dig_idle_00",
    "dig_idle_01",
    "dig_in_00",
    "dig_in_01",
    "dig_out_00",
    "dig_out_01",
    "fall",
    "grabbed",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "reply_no",
    "reply_yes",
    "run",
    "scared_00",
    "sit_00",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "surprise_00",
    "talk_00",
    "talk_01",
    "turn_l",
    "turn_r",
    "walk",
    "walk_b",
    "walk_l",
    "walk_r"
  },
  ve01 = {
    "fly",
    "fly1",
    "stay",
    "stay_01"
  },
  ve02 = {
    "fly",
    "fly1",
    "stay",
    "stay_01"
  },
  ve03 = {
    "fly",
    "fly1",
    "stay",
    "stay_01"
  },
  vog01 = {
    "angry_00",
    "bye",
    "confuse_00",
    "confuse_01",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "hide_l_00",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "stay",
    "stay_00",
    "stay_01",
    "surprise",
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
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom01 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom05 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom17 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom21 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom23 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom26 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom27 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  },
  wom41 = {
    "bye",
    "fall",
    "grabbed",
    "greeting",
    "handclap",
    "inform_ed",
    "inform_in",
    "inform_lp",
    "land",
    "lookaround",
    "photo_00",
    "photo_01",
    "photo_02",
    "photo_03",
    "reply_no",
    "reply_yes",
    "run",
    "run1",
    "run2",
    "sit_00",
    "sit_01",
    "sit_in_00",
    "sit_out_00",
    "sit_ship_00",
    "sit_ship_01",
    "snatched",
    "stay",
    "talk_00",
    "talk_01",
    "talk_02",
    "talk_03",
    "talk_angry_00",
    "talk_angry_01",
    "talk_angry_02",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02",
    "talk_sad_00",
    "talk_sad_01",
    "talk_sad_02",
    "turn_l",
    "turn_r",
    "walk",
    "walk1",
    "walk2",
    "walk_b",
    "walk_b1",
    "walk_b2",
    "walk_l",
    "walk_r"
  }
}
pc_anim_name_tbl = {
  "kit01_backflip_00",
  "kit01_backflip_fly_00",
  "kit01_base",
  "kit01_blackhole_a_00",
  "kit01_blackhole_b_00",
  "kit01_blackhole_c_00",
  "kit01_crossedlegs_00",
  "kit01_damage_00",
  "kit01_damage_l_00",
  "kit01_dash_00",
  "kit01_dash_01",
  "kit01_dash_stop_00",
  "kit01_dash_stop_l_00",
  "kit01_dash_stop_r_00",
  "kit01_dead_00",
  "kit01_dodge_kick_00",
  "kit01_down_a_00",
  "kit01_down_a_01",
  "kit01_down_b_00",
  "kit01_down_b_01",
  "kit01_down_head_00",
  "kit01_down_roll_00",
  "kit01_ep90_demo_00",
  "kit01_ep90_demo_01",
  "kit01_ep90_demo_02",
  "kit01_fall_head_00",
  "kit01_fall_head_in_00",
  "kit01_fall_kick_a_00",
  "kit01_fall_kick_b_00",
  "kit01_fall_kick_combo_a_00",
  "kit01_fall_kick_combo_b_00",
  "kit01_fall_kick_combo_finish_a_00",
  "kit01_fall_kick_combo_finish_b_00",
  "kit01_fall_kick_short_bl_00",
  "kit01_fall_kick_short_br_00",
  "kit01_fall_kick_short_fl_00",
  "kit01_fall_kick_short_fr_00",
  "kit01_fall_l_a_00",
  "kit01_fall_l_b_00",
  "kit01_fall_landing_00",
  "kit01_fall_r_a_00",
  "kit01_fall_r_b_00",
  "kit01_fall_turn_00",
  "kit01_float_00",
  "kit01_float_fighting_00",
  "kit01_greeting_00",
  "kit01_gs00_base",
  "kit01_hail_00",
  "kit01_hand_00",
  "kit01_hang_a_00",
  "kit01_hang_b_00",
  "kit01_heavy_dodge_b_00",
  "kit01_heavy_dodge_f_00",
  "kit01_heavy_dodge_kick_00",
  "kit01_heavy_dodge_l_00",
  "kit01_heavy_dodge_r_00",
  "kit01_heavy_fall_kick_a_00",
  "kit01_heavy_fall_kick_b_00",
  "kit01_heavy_fall_kick_c_00",
  "kit01_heavy_fall_kick_d_00",
  "kit01_heavy_fall_kick_e_00",
  "kit01_heavy_kick_a_00",
  "kit01_heavy_kick_b_00",
  "kit01_heavy_kick_c_00",
  "kit01_heavy_landing_00",
  "kit01_heavy_run_l_00",
  "kit01_heavy_run_r_00",
  "kit01_heavy_run_step_l_00",
  "kit01_heavy_run_step_r_00",
  "kit01_jump_a_00",
  "kit01_jump_b_00",
  "kit01_jump_c_00",
  "kit01_jump_d_00",
  "kit01_jump_fall_00",
  "kit01_jump_kick_00",
  "kit01_jump_kick_a_00",
  "kit01_jump_kick_a_hit_00",
  "kit01_jump_kick_hit_00",
  "kit01_jump_kick_quick_00",
  "kit01_jump_kick_quick_hit_00",
  "kit01_jump_kick_quick_landing_00",
  "kit01_kick_00",
  "kit01_kick_ab_00",
  "kit01_kick_ab_hit_00",
  "kit01_kick_a_00",
  "kit01_kick_a_hit_00",
  "kit01_kick_b_00",
  "kit01_kick_b_hit_00",
  "kit01_kick_c_00",
  "kit01_kick_c_hit_00",
  "kit01_kick_d2e_00",
  "kit01_kick_d2e_hit_00",
  "kit01_kick_d2_00",
  "kit01_kick_d2_hit_00",
  "kit01_kick_d_00",
  "kit01_kick_d_hit_00",
  "kit01_kick_e_00",
  "kit01_kick_e_hit_00",
  "kit01_kick_f_00",
  "kit01_kick_f_hit_00",
  "kit01_kick_g_00",
  "kit01_kick_g_hit_00",
  "kit01_kick_h_00",
  "kit01_kick_h_hit_00",
  "kit01_kick_i_00",
  "kit01_kick_i_hit_00",
  "kit01_landing_00",
  "kit01_landing_hard",
  "kit01_landing_head_00",
  "kit01_landing_jump_00",
  "kit01_landing_norm",
  "kit01_landing_slide_00",
  "kit01_light_air_kick_bl_00",
  "kit01_light_air_kick_bl_hit_00",
  "kit01_light_air_kick_br_00",
  "kit01_light_air_kick_br_hit_00",
  "kit01_light_air_kick_fl_00",
  "kit01_light_air_kick_fl_hit_00",
  "kit01_light_air_kick_fr_00",
  "kit01_light_air_kick_fr_hit_00",
  "kit01_light_dash_00",
  "kit01_light_dodge_00",
  "kit01_light_dodge_kick_00",
  "kit01_light_fall_kick_a_00",
  "kit01_light_fall_kick_bl_00",
  "kit01_light_fall_kick_bl_hit_00",
  "kit01_light_fall_kick_br_00",
  "kit01_light_fall_kick_br_hit_00",
  "kit01_light_fall_kick_b_00",
  "kit01_light_fall_kick_c_00",
  "kit01_light_fall_kick_fl_00",
  "kit01_light_fall_kick_fl_hit_00",
  "kit01_light_fall_kick_fr_00",
  "kit01_light_fall_kick_fr_hit_00",
  "kit01_light_fall_kick_in_00",
  "kit01_light_landing_a_00",
  "kit01_light_landing_b_00",
  "kit01_light_roll_00",
  "kit01_light_run_00",
  "kit01_light_run_jump_in_00",
  "kit01_light_run_jump_straight_00",
  "kit01_light_run_jump_straight_attack_00",
  "kit01_light_run_jump_straight_loop_00",
  "kit01_light_run_l_00",
  "kit01_light_run_r_00",
  "kit01_light_run_stop_00",
  "kit01_light_stay_00",
  "kit01_light_stay_in_00",
  "kit01_light_stay_out_00",
  "kit01_mwalk_stance_low",
  "kit01_mwalk_start",
  "kit01_nage_air_f_00",
  "kit01_nage_f_00",
  "kit01_roll_a_00",
  "kit01_roll_b_00",
  "kit01_roll_c_00",
  "kit01_run_dodge_00",
  "kit01_run_down_l_00",
  "kit01_run_down_r_00",
  "kit01_run_hop_00",
  "kit01_run_jump_00",
  "kit01_run_kick_00",
  "kit01_run_kick_hit_00",
  "kit01_run_kick_hit_01",
  "kit01_run_l_00",
  "kit01_run_l_l_00",
  "kit01_run_l_r_00",
  "kit01_run_r_00",
  "kit01_run_r_l_00",
  "kit01_run_r_r_00",
  "kit01_run_slow_l_00",
  "kit01_run_slow_r_00",
  "kit01_run_step_down_l_00",
  "kit01_run_step_down_r_00",
  "kit01_run_step_l_00",
  "kit01_run_step_r_00",
  "kit01_run_stop_00",
  "kit01_run_stop_fighting_00",
  "kit01_run_stop_l_01",
  "kit01_run_stop_r_01",
  "kit01_run_turn_00",
  "kit01_salute_00",
  "kit01_slide_b_00",
  "kit01_slide_f_00",
  "kit01_slide_in_l_00",
  "kit01_slide_in_r_00",
  "kit01_slide_kick_00",
  "kit01_slide_l_00",
  "kit01_slide_r_00",
  "kit01_somersault_kick_00",
  "kit01_spiralclaw_a_00",
  "kit01_spiralclaw_b_00",
  "kit01_spiralclaw_c_00",
  "kit01_stay_00",
  "kit01_stay_fighting_00",
  "kit01_stay_fighting_in_00",
  "kit01_stay_fighting_out_00",
  "kit01_stay_heat_00",
  "kit01_stay_slope_l_00",
  "kit01_stay_slope_r_00",
  "kit01_storm_00",
  "kit01_touch_00",
  "kit01_walk_l_00",
  "kit01_walk_r_00",
  "kit01_walk_start_00",
  "kit01_walk_stop_00",
  "kit01_wall_jump_l_00",
  "kit01_wall_jump_l_a_00",
  "kit01_wall_jump_l_b_00",
  "kit01_wall_jump_l_c_00",
  "kit01_wall_jump_l_d_00"
}
se_name_tbl = {
  "bird_flyaway",
  "duck_quack",
  "ene_human_rocket_hit",
  "ene_robot_missile_hit",
  "energy_empty",
  "gull_cry",
  "ships_brake",
  "ships_land"
}
anim_chk_sdemo = nil
pc_anim_chk_sdemo = nil
se_chk_sdemo = nil
enmgen2_attacker_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki",
      locator = "locator2_attacker_01",
      name = "test_gorotuki"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectAsh = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
    request_respawn = true
  end
}
function Initialize()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17
  L0_10 = Fn_userCtrlOff
  L0_10()
  L0_10 = {
    L1_11,
    L2_12,
    L3_13,
    L4_14,
    L5_15,
    L6_16
  }
  L1_11 = {}
  L1_11.name = "test_gull01_01"
  L1_11.type = "gull01"
  L1_11.node = "locator2_gull01_01"
  L1_11.active = false
  L2_12.name = "test_duck01_01"
  L2_12.type = "duck01"
  L2_12.node = "locator2_duck01_01"
  L2_12.active = false
  L3_13.name = "test_callback_npc_01"
  L3_13.type = "thief"
  L3_13.node = "locator2_check_callback_npc_01"
  L3_13.active = false
  L4_14.name = "test_wom01"
  L4_14.type = "wom01"
  L4_14.node = "locator2_chk_anm_start_marker_01"
  L4_14.active = false
  L5_15.name = "test_man01"
  L5_15.type = "man02"
  L5_15.node = "locator2_chk_pc_anm_start_marker_01"
  L5_15.active = false
  L6_16 = {}
  L6_16.name = "test_man05"
  L6_16.type = "man05"
  L6_16.node = "locator2_chk_se_start_marker_01"
  L6_16.active = false
  L1_11 = #L0_10
  L1_11 = L1_11 + 1
  for L5_15, L6_16 in L2_12(L3_13) do
    L7_17 = {}
    L7_17.name = "test_chk_anim_" .. L6_16
    L7_17.type = L6_16
    L7_17.node = "locator2_check_anim_npc_01"
    L7_17.active = false
    L0_10[L1_11] = L7_17
    L1_11 = L1_11 + 1
  end
  L2_12(L3_13)
  for L5_15, L6_16 in L2_12(L3_13) do
    L7_17 = Fn_findNpc
    L7_17 = L7_17(L6_16.name)
    puppet_tbl[L6_16.name] = L7_17:getPuppet()
  end
  for L6_16, L7_17 in L3_13(L4_14) do
    gimmick_bg_table[L7_17] = findGameObject2("GimmickBg", L7_17)
    gimmick_bg_table[L7_17]:setActive(false)
  end
  L3_13(L4_14)
  L3_13(L4_14, L5_15)
  L3_13.key_guide = "ui_keyguide_ac_01"
  L3_13.ad_main = "NPC\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\131\129\227\130\167\227\131\131\227\130\175"
  L3_13.ad_sub = "ui_acdialog_sub_01"
  L3_13.map_main = nil
  L3_13.map_sub = "ui_map_msinfo_header_01"
  L6_16 = "locator2_chk_anm_start_marker_01"
  L7_17 = L3_13
  L5_15(L6_16, L7_17, L4_14, nil)
  L3_13(L4_14, L5_15)
  L3_13.key_guide = "ui_keyguide_ac_01"
  L3_13.ad_main = "\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\131\129\227\130\167\227\131\131\227\130\175"
  L3_13.ad_sub = "ui_acdialog_sub_01"
  L3_13.map_main = nil
  L3_13.map_sub = "ui_map_msinfo_header_01"
  L6_16 = "locator2_chk_pc_anm_start_marker_01"
  L7_17 = L3_13
  L5_15(L6_16, L7_17, L4_14, nil)
  L3_13(L4_14, L5_15)
  L3_13.key_guide = "ui_keyguide_ac_01"
  L3_13.ad_main = "SE\227\131\129\227\130\167\227\131\131\227\130\175"
  L3_13.ad_sub = "ui_acdialog_sub_01"
  L3_13.map_main = nil
  L3_13.map_sub = "ui_map_msinfo_header_01"
  L6_16 = "locator2_chk_se_start_marker_01"
  L7_17 = L3_13
  L5_15(L6_16, L7_17, L4_14, nil)
  anim_chk_sdemo = L3_13
  L6_16 = "locator2_check_anim_aim_01"
  L6_16 = L5_15
  L7_17 = L3_13
  L5_15(L6_16, L7_17, L4_14)
  pc_anim_chk_sdemo = L3_13
  L6_16 = "locator2_check_pc_anim_aim_01"
  L6_16 = L5_15
  L7_17 = L3_13
  L5_15(L6_16, L7_17, L4_14)
  se_chk_sdemo = L3_13
  L6_16 = "locator2_check_se_aim_01"
  L6_16 = L5_15
  L7_17 = L3_13
  L5_15(L6_16, L7_17, L4_14)
end
function Ingame()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23
  L0_18 = Player
  L0_18 = L0_18.getPuppet
  L0_18 = L0_18(L1_19)
  for L4_22, L5_23 in L1_19(L2_20) do
    L0_18:loadPoseAnimation(L5_23, L5_23)
  end
  while true do
    if L1_19 then
      L1_19()
    end
  end
  L0_18 = Fn_setNpcActive
  L0_18(L1_19, L2_20)
  L0_18 = Fn_setNpcActive
  L0_18(L1_19, L2_20)
  L0_18 = invokeDuckTask
  L0_18()
  L0_18 = Fn_missionView
  L0_18(L1_19)
  L0_18 = Fn_countDownWithTimer
  L0_18()
  L0_18 = HUD
  L0_18 = L0_18.timerStart
  L0_18(L1_19)
  L0_18 = Fn_userCtrlOn
  L0_18()
  L0_18 = Fn_naviSet
  L0_18(L1_19)
  L0_18 = false
  while true do
    L4_22 = findGameObject2
    L5_23 = "Node"
    L4_22 = L4_22(L5_23, "locator2_escape_pos_" .. string.format("%02d", L3_21))
    if L4_22 ~= nil then
      L5_23 = L4_22.getName
      L5_23 = L5_23(L4_22)
      L2_20[L3_21] = L5_23
    else
      break
    end
  end
  L4_22 = invokeForeverEscapeCharaTask
  L5_23 = "test_duck01_01"
  L4_22 = L4_22(L5_23, L2_20, L1_19)
  while true do
    L5_23 = HUD
    L5_23 = L5_23.timerGetSecond
    L5_23 = L5_23(L5_23)
    if L5_23 < 30 and not L0_18 then
      L5_23 = wait
      L5_23()
    end
  end
  L5_23 = L4_22.abort
  L5_23(L4_22)
  L4_22 = nil
  L5_23 = Fn_findNpc
  L5_23 = L5_23("test_duck01_01")
  L5_23:playMotion("stay")
  HUD:timerStop()
  HUD:timerSetVisible(false)
  if L0_18 then
    Fn_captionView("\230\141\149\227\129\190\227\129\136\227\129\159\239\188\129")
  else
    Fn_captionView("\230\174\139\229\191\181\239\188\129")
    break
  end
  L0_18 = Fn_naviKill
  L0_18()
  L0_18 = findGameObject2
  L0_18 = L0_18(L1_19, L2_20)
  enemy_gen = L0_18
  L0_18 = enemy_gen
  L0_18 = L0_18.requestSpawn
  L0_18(L1_19)
  L0_18 = invokeTask
  L0_18(L1_19)
  L0_18 = Fn_missionView
  L0_18(L1_19)
  L0_18 = Fn_countDownWithTimer
  L0_18()
  L0_18 = HUD
  L0_18 = L0_18.timerStart
  L0_18(L1_19)
  L0_18 = 100000
  in_sensor_count = 0
  L1_19(L2_20)
  L1_19(L2_20, L3_21)
  while true do
    if L2_20 < 30 then
      L2_20()
    end
  end
  stop_respawn = true
  L2_20(L3_21)
  L4_22 = false
  L2_20(L3_21, L4_22)
  L2_20(L3_21)
  L4_22 = false
  L2_20(L3_21, L4_22)
  L2_20(L3_21)
  L4_22 = true
  L2_20(L3_21, L4_22)
  L4_22 = "test_callback_npc_01"
  L5_23 = L3_21
  L4_22 = L3_21.changeDamageType
  L4_22(L5_23, 1)
  L5_23 = L3_21
  L4_22 = L3_21.setEventListener
  L4_22(L5_23, "npcDamaged", L2_20)
  L4_22 = true
  L2_20(L3_21, L4_22)
  L2_20(L3_21)
  L2_20()
  L2_20(L3_21)
  L2_20(L3_21)
  while true do
    if L2_20 < 30 then
      L2_20()
    end
  end
  L2_20()
  L2_20(L3_21)
  L4_22 = false
  L2_20(L3_21, L4_22)
  woodbox_restore_stop = true
  L4_22 = false
  L2_20(L3_21, L4_22)
  L4_22 = L2_20
  L5_23 = "npcDamaged"
  L3_21(L4_22, L5_23, nil)
end
function invokeDuckTask()
  return invokeTask(function()
    local L0_24, L1_25, L2_26
    L0_24 = 1
    L1_25 = {
      L2_26,
      "locator2_gull01_fly_b_"
    }
    L2_26 = "locator2_gull01_fly_a_"
    while true do
      L2_26 = 0
      repeat
        waitSeconds(0.5)
        L2_26 = Fn_getDistanceToPlayer(puppet_tbl.test_gull01_01)
      until L2_26 < 5
      while invokeFlyTask("test_gull01_01", L1_25[L0_24], 3):isRunning() do
        wait()
      end
      invokeFlyTask("test_gull01_01", L1_25[L0_24], 3):abort()
      L0_24 = L0_24 % #L1_25 + 1
    end
  end)
end
function invokeFlyTask(A0_27, A1_28, A2_29)
  return invokeTask(function()
    local L0_30, L1_31
    L0_30 = {}
    L1_31 = 1
    while true do
      if findGameObject2("Node", A1_28 .. string.format("%02d", L1_31)) ~= nil then
        L0_30[L1_31] = {}
        L0_30[L1_31].pos = findGameObject2("Node", A1_28 .. string.format("%02d", L1_31)):getName()
        if L1_31 == 1 then
          L0_30[L1_31].attr = "takeoff"
        else
          L0_30[L1_31].attr = "fly"
        end
      else
        if L1_31 >= 2 then
          L0_30[L1_31 - 1].attr = "land"
        end
        break
      end
      L1_31 = L1_31 + 1
    end
    Fn_fly(A0_27, L0_30, A2_29)
  end)
end
function invokeForeverEscapeCharaTask(A0_32, A1_33, A2_34)
  return invokeTask(function()
    local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43
    L0_35 = Fn_findNpc
    L1_36 = A0_32
    L0_35 = L0_35(L1_36)
    L1_36 = false
    L2_37 = false
    L3_38 = false
    L4_39 = false
    L6_41 = L0_35
    L5_40 = L0_35.setEventListener
    L7_42 = "npcDamaged"
    function L8_43()
      if not L0_35:isEnemy() then
        L0_35:changeEnemy()
      end
    end
    L5_40(L6_41, L7_42, L8_43)
    L6_41 = L0_35
    L5_40 = L0_35.setEventListener
    L7_42 = "npcDead"
    function L8_43()
      L4_39 = true
      L0_35:setEventListener("npcDead", nil)
    end
    L5_40(L6_41, L7_42, L8_43)
    L2_37 = true
    while not L1_36 and not L4_39 do
      L6_41 = L0_35
      L5_40 = L0_35.isEnemy
      L5_40 = L5_40(L6_41)
      if not L5_40 then
        L3_38 = false
        if L2_37 then
          repeat
            L5_40 = Fn_getDistanceToPlayer
            L6_41 = L0_35
            L5_40 = L5_40(L6_41)
            L3_38 = L5_40 < 5
            L6_41 = L0_35
            L5_40 = L0_35.isGrabbed
            L5_40 = L5_40(L6_41)
            L1_36 = L5_40
            if L1_36 then
              L5_40 = A2_34
              if L5_40 ~= nil then
                L5_40 = A2_34
                L5_40()
              end
            end
            L5_40 = wait
            L5_40()
          until L3_38 or L1_36
        end
        L5_40 = Npc
        L5_40 = L5_40.FindNearPoint
        L6_41 = Fn_getPlayerWorldPos
        L6_41 = L6_41()
        L7_42 = A1_33
        L8_43 = A1_33
        L8_43 = #L8_43
        L5_40 = L5_40(L6_41, L7_42, L8_43)
        L6_41 = Fn_moveNpc
        L7_42 = A0_32
        L8_43 = {
          A1_33[L5_40]
        }
        L6_41 = L6_41(L7_42, L8_43, {
          anm_walk_speed = 2,
          anm_walk_b_speed = 2,
          anm_run_speed = 2
        })
        repeat
          L8_43 = L0_35
          L7_42 = L0_35.getWorldPos
          L7_42 = L7_42(L8_43)
          L8_43 = L7_42.y
          L8_43 = L8_43 + 1.5
          L7_42.y = L8_43
          L8_43 = Query
          L8_43 = L8_43.setEyeSightTransform
          L8_43(L8_43, L7_42, L0_35:getWorldRot())
          L8_43 = Query
          L8_43 = L8_43.setEyeSightAngle
          L8_43(L8_43, Deg2Rad(60))
          L8_43 = Query
          L8_43 = L8_43.setEyeSightRange
          L8_43(L8_43, 5)
          L8_43 = Fn_getPlayerWorldPos
          L8_43 = L8_43()
          L8_43.y = L8_43.y + 1.5
          L3_38 = Query:checkEyeSightSphere(L8_43, 1) and Query:raycastEyeSight(L8_43) == nil
          L2_37 = L6_41:isRunning()
          L1_36 = L0_35:isGrabbed()
          if L1_36 and A2_34 ~= nil then
            A2_34()
          end
          wait()
        until L2_37 or L3_38 or L1_36
        L8_43 = L6_41
        L7_42 = L6_41.abort
        L7_42(L8_43)
        L6_41 = nil
        if not L3_38 then
          L7_42 = Fn_playMotionNpc
          L8_43 = A0_32
          L7_42(L8_43, "stay", false)
        end
      else
        L6_41 = L0_35
        L5_40 = L0_35.isGrabbedAction
        L5_40 = L5_40(L6_41)
        L1_36 = L5_40
        if L1_36 then
          L5_40 = A2_34
          if L5_40 ~= nil then
            L5_40 = A2_34
            L5_40()
          end
        end
        L5_40 = wait
        L5_40()
      end
    end
  end)
end
function invokeCheckAnimTask()
  return invokeTask(function()
    local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53
    L0_44 = Fn_userCtrlOff
    L0_44()
    L0_44 = anim_chk_sdemo
    L1_45 = L0_44
    L0_44 = L0_44.play
    L0_44(L1_45)
    L0_44 = false
    L1_45 = invokeTask
    function L2_46()
      local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59
      L0_54 = {
        L1_55,
        L2_56,
        L3_57,
        L4_58,
        L5_59
      }
      L4_58 = "\226\134\144\239\188\154\229\137\141\227\129\174\227\130\173\227\131\163\227\131\169\227\128\129\226\134\146\239\188\154\230\172\161\227\129\174\227\130\173\227\131\163\227\131\169"
      L5_59 = "L1\239\188\154\229\137\141\227\129\174\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\128\129R1\239\188\154\230\172\161\227\129\174\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179"
      for L4_58, L5_59 in L1_55(L2_56) do
        if L0_44 ~= true then
          Fn_captionView(L5_59)
        end
      end
    end
    L1_45 = L1_45(L2_46)
    L2_46 = invokeCtrlSdemoCameraTask
    L3_47 = anim_chk_sdemo
    L2_46 = L2_46(L3_47)
    function L3_47(A0_60, A1_61)
      Fn_warpNpc(A0_60, "locator2_check_anim_npc_01")
      Fn_playMotionNpc(A0_60, A1_61, false)
    end
    function L4_48(A0_62, A1_63)
      return invokeTask(function()
        while true do
          while Fn_findNpc(A0_62):isMotionEnd() == false do
            wait()
          end
          L3_47(A0_62, A1_63)
          wait()
        end
      end)
    end
    L5_49 = 1
    L6_50 = 1
    while true do
      L7_51 = anim_chk_chara_type_tbl
      L7_51 = L7_51[L5_49]
      L8_52 = anim_name_tbl
      L8_52 = L8_52[L7_51]
      L8_52 = L8_52[L6_50]
      L9_53 = "test_chk_anim_"
      L9_53 = L9_53 .. L7_51
      Fn_setNpcActive(L9_53, true)
      L3_47(L9_53, L8_52)
      waitSeconds(0.2)
      repeat
        wait()
        if Pad:getButton(Pad.kButton_RD) then
        elseif Pad:getButton(Pad.kButton_L1) then
        elseif Pad:getButton(Pad.kButton_R1) then
        elseif Pad:getButton(Pad.kButton_LL) then
        elseif Pad:getButton(Pad.kButton_LR) then
        end
      until 5 ~= 0
      L0_44 = true
      L4_48(L9_53, L8_52):abort()
      if 5 == 1 then
        Fn_setNpcActive(L9_53, false)
        break
      elseif 5 == 2 then
        L6_50 = L6_50 - 1
        if L6_50 < 1 then
          L6_50 = #anim_name_tbl[L7_51]
        end
        Fn_captionView(L6_50 .. ":" .. anim_name_tbl[L7_51][L6_50], nil, false)
      elseif 5 == 3 then
        L6_50 = L6_50 + 1
        if L6_50 > #anim_name_tbl[L7_51] then
          L6_50 = 1
        end
        Fn_captionView(L6_50 .. ":" .. anim_name_tbl[L7_51][L6_50], nil, false)
      elseif 5 == 4 then
        Fn_setNpcActive(L9_53, false)
        L5_49 = L5_49 - 1
        if L5_49 < 1 then
          L5_49 = #anim_chk_chara_type_tbl
        end
        L6_50 = 1
        Fn_captionView(L5_49 .. ":" .. anim_chk_chara_type_tbl[L5_49], nil, false)
      elseif 5 == 5 then
        Fn_setNpcActive(L9_53, false)
        L5_49 = L5_49 + 1
        if L5_49 > #anim_chk_chara_type_tbl then
          L5_49 = 1
        end
        L6_50 = 1
        Fn_captionView(L5_49 .. ":" .. anim_chk_chara_type_tbl[L5_49], nil, false)
      end
    end
    L8_52 = L2_46
    L7_51 = L2_46.abort
    L7_51(L8_52)
    L2_46 = nil
    L7_51 = anim_chk_sdemo
    L8_52 = L7_51
    L7_51 = L7_51.stop
    L9_53 = 0
    L7_51(L8_52, L9_53)
    L7_51 = Fn_userCtrlOn
    L7_51()
  end)
end
function invokeCheckPlayerAnimTask()
  return invokeTask(function()
    local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69, L6_70
    L0_64 = Fn_userCtrlOff
    L0_64()
    L0_64 = resetPcPos
    L1_65 = "warppoint2_pc_chk_pc_anm_01"
    L0_64(L1_65)
    L0_64 = pc_anim_chk_sdemo
    L1_65 = L0_64
    L0_64 = L0_64.play
    L0_64(L1_65)
    L0_64 = false
    L1_65 = invokeTask
    function L2_66()
      local L0_71, L1_72, L2_73, L3_74, L4_75, L5_76
      L0_71 = {
        L1_72,
        L2_73,
        L3_74,
        L4_75
      }
      L4_75 = "L1\239\188\154\229\137\141\227\129\174\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\128\129R1\239\188\154\230\172\161\227\129\174\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179"
      for L4_75, L5_76 in L1_72(L2_73) do
        if L0_64 ~= true then
          Fn_captionView(L5_76)
        end
      end
    end
    L1_65 = L1_65(L2_66)
    L2_66 = invokeCtrlSdemoCameraTask
    L3_67 = pc_anim_chk_sdemo
    L2_66 = L2_66(L3_67)
    function L3_67(A0_77)
      resetPcPos("warppoint2_pc_chk_pc_anm_01")
      Player:getPuppet():playPoseAnimation(A0_77, 0)
    end
    function L4_68(A0_78)
      return invokeTask(function()
        while true do
          while Player:getPuppet():isPoseAnimEnd() == false do
            wait()
          end
          L3_67(A0_78)
          wait()
        end
      end)
    end
    L5_69 = 1
    while true do
      L6_70 = pc_anim_name_tbl
      L6_70 = L6_70[L5_69]
      L3_67(L6_70)
      waitSeconds(0.2)
      repeat
        wait()
        if Pad:getButton(Pad.kButton_RD) then
        elseif Pad:getButton(Pad.kButton_L1) then
        elseif Pad:getButton(Pad.kButton_R1) then
        end
      until 3 ~= 0
      L0_64 = true
      L4_68(L6_70):abort()
      if 3 ~= 1 then
        if 3 == 2 then
          L5_69 = L5_69 - 1
          if L5_69 < 1 then
            L5_69 = #pc_anim_name_tbl
          end
          Fn_captionView(L5_69 .. ":" .. pc_anim_name_tbl[L5_69], nil, false)
        elseif 3 == 3 then
          L5_69 = L5_69 + 1
          if L5_69 > #pc_anim_name_tbl then
            L5_69 = 1
          end
          Fn_captionView(L5_69 .. ":" .. pc_anim_name_tbl[L5_69], nil, false)
        end
      end
    end
    L6_70 = L2_66.abort
    L6_70(L2_66)
    L2_66 = nil
    L6_70 = pc_anim_chk_sdemo
    L6_70 = L6_70.stop
    L6_70(L6_70, 0)
    L6_70 = resetPcPos
    L6_70("warppoint2_pc_chk_pc_anm_02")
    L6_70 = Fn_userCtrlOn
    L6_70()
  end)
end
function invokeCheckSeTask()
  return invokeTask(function()
    local L0_79, L1_80, L2_81
    L0_79 = Fn_userCtrlOff
    L0_79()
    L0_79 = resetPcPos
    L1_80 = "warppoint2_pc_chk_se_01"
    L0_79(L1_80)
    L0_79 = se_chk_sdemo
    L1_80 = L0_79
    L0_79 = L0_79.play
    L0_79(L1_80)
    L0_79 = false
    L1_80 = invokeTask
    function L2_81()
      local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87
      L0_82 = {
        L1_83,
        L2_84,
        L3_85
      }
      for L4_86, L5_87 in L1_83(L2_84) do
        if L0_79 ~= true then
          Fn_captionView(L5_87)
        end
      end
    end
    L1_80 = L1_80(L2_81)
    L2_81 = 1
    while true do
      Sound:playSE(se_name_tbl[L2_81], 1)
      waitSeconds(0.2)
      repeat
        wait()
        if Pad:getButton(Pad.kButton_RD) then
        elseif Pad:getButton(Pad.kButton_LL) then
        elseif Pad:getButton(Pad.kButton_LR) then
        elseif Pad:getButton(Pad.kButton_RR) then
        end
      until 4 ~= 0
      L0_79 = true
      if 4 ~= 1 then
        if 4 == 2 then
          L2_81 = L2_81 - 1
          if L2_81 < 1 then
            L2_81 = #se_name_tbl
          end
          Fn_captionView(L2_81 .. ":" .. se_name_tbl[L2_81], nil, false)
        elseif 4 == 3 then
          L2_81 = L2_81 + 1
          if L2_81 > #se_name_tbl then
            L2_81 = 1
          end
          Fn_captionView(L2_81 .. ":" .. se_name_tbl[L2_81], nil, false)
        elseif 4 == 4 then
          Fn_captionView(L2_81 .. ":" .. se_name_tbl[L2_81], nil, false)
        end
      end
    end
    se_chk_sdemo:stop(0)
    resetPcPos("warppoint2_pc_chk_se_02")
    Fn_userCtrlOn()
  end)
end
function invokeCtrlSdemoCameraTask(A0_88)
  local L1_89
  L1_89 = A0_88.cam_pos
  L1_89 = L1_89.getWorldPos
  L1_89 = L1_89(L1_89)
  return RAC_InvokeTaskWithDestractor(function()
    local L0_90, L1_91, L2_92, L3_93, L4_94, L5_95, L6_96, L7_97, L8_98, L9_99, L10_100, L11_101, L12_102, L13_103, L14_104
    L0_90 = Deg2Rad
    L1_91 = 360
    L0_90 = L0_90(L1_91)
    L1_91 = A0_88.aim_pos
    L2_92 = L1_91
    L1_91 = L1_91.getWorldPos
    L1_91 = L1_91(L2_92)
    L2_92 = vectorSub
    L3_93 = L1_89
    L4_94 = L1_91
    L2_92 = L2_92(L3_93, L4_94)
    L4_94 = L2_92
    L3_93 = L2_92.Length
    L3_93 = L3_93(L4_94)
    L4_94 = ArcTan2
    L5_95 = L2_92.y
    L6_96 = L2_92.x
    L4_94 = L4_94(L5_95, L6_96)
    L5_95 = ArcTan2
    L6_96 = L2_92.z
    L6_96 = -L6_96
    L7_97 = L2_92.x
    L5_95 = L5_95(L6_96, L7_97)
    L6_96 = L3_93 + 10
    L7_97 = 1.5
    L8_98 = Deg2Rad
    L9_99 = 89
    L8_98 = L8_98(L9_99)
    L9_99 = Deg2Rad
    L10_100 = -20
    L9_99 = L9_99(L10_100)
    while true do
      L10_100 = Pad
      L11_101 = L10_100
      L10_100 = L10_100.getStick
      L12_102 = Pad
      L12_102 = L12_102.kStick_Camera
      L11_101 = L10_100(L11_101, L12_102)
      L12_102 = Pad
      L13_103 = L12_102
      L12_102 = L12_102.getButton
      L14_104 = Pad
      L14_104 = L14_104.kButton_R2
      L12_102 = L12_102(L13_103, L14_104)
      L13_103 = Pad
      L14_104 = L13_103
      L13_103 = L13_103.getButton
      L13_103 = L13_103(L14_104, Pad.kButton_L2)
      if L10_100 ~= 0 or L11_101 ~= 0 or L12_102 or L13_103 then
        if L10_100 ~= 0 then
          L14_104 = L10_100 * 0.1
          L5_95 = L5_95 - L14_104
          if L5_95 < 0 then
            L5_95 = L5_95 + L0_90
          elseif L0_90 < L5_95 then
            L5_95 = L5_95 - L0_90
          end
        end
        if L11_101 ~= 0 then
          L14_104 = L11_101 * 0.05
          L4_94 = L4_94 + L14_104
          if L8_98 < L4_94 then
            L4_94 = L8_98
          elseif L9_99 > L4_94 then
            L4_94 = L9_99
          end
        end
        if L12_102 == true then
          L3_93 = L3_93 - 0.1
          if L7_97 > L3_93 then
            L3_93 = L7_97
          end
        elseif L13_103 == true then
          L3_93 = L3_93 + 0.1
          if L6_96 < L3_93 then
            L3_93 = L6_96
          end
        end
        L14_104 = Vector
        L14_104 = L14_104(L3_93, 0, 0)
        L14_104 = ZRotQuat(L4_94):Apply(L14_104)
        L14_104 = YRotQuat(L5_95):Apply(L14_104)
        L14_104.x = L14_104.x + L1_91.x
        L14_104.y = L14_104.y + L1_89.y
        L14_104.z = L14_104.z + L1_91.z
        A0_88.cam_pos:setWorldPos(L14_104)
      end
      L14_104 = wait
      L14_104()
    end
  end, function()
    A0_88.cam_pos:setWorldPos(L1_89)
  end)
end
function vectorAdd(A0_105, A1_106)
  CopyVector(A0_105).x = CopyVector(A0_105).x + A1_106.x
  CopyVector(A0_105).y = CopyVector(A0_105).y + A1_106.y
  CopyVector(A0_105).z = CopyVector(A0_105).z + A1_106.z
  return (CopyVector(A0_105))
end
function vectorSub(A0_107, A1_108)
  CopyVector(A0_107).x = CopyVector(A0_107).x - A1_108.x
  CopyVector(A0_107).y = CopyVector(A0_107).y - A1_108.y
  CopyVector(A0_107).z = CopyVector(A0_107).z - A1_108.z
  return (CopyVector(A0_107))
end
function sensorOn(A0_109)
  if type(A0_109) == "string" then
    findGameObject2("Sensor", A0_109):setActive(true)
  else
    A0_109:setActive(true)
  end
end
function sensorOff(A0_110)
  if type(A0_110) == "string" then
    findGameObject2("Sensor", A0_110):setActive(false)
  else
    A0_110:setActive(false)
  end
end
function resetPcPos(A0_111, A1_112)
  local L2_113, L3_114, L4_115
  L2_113 = nil
  L3_114 = type
  L4_115 = A0_111
  L3_114 = L3_114(L4_115)
  if L3_114 == "string" then
    L3_114 = findGameObject2
    L4_115 = "Node"
    L3_114 = L3_114(L4_115, A0_111)
    L2_113 = L3_114
  else
    L2_113 = A0_111
  end
  if L2_113 ~= nil then
    L3_114 = Area
    L4_115 = L3_114
    L3_114 = L3_114.setAnimMoveDriftEnable
    L3_114(L4_115, false, false, false)
    L3_114 = Time
    L4_115 = L3_114
    L3_114 = L3_114.setInGameDeltaSec
    L3_114(L4_115, 0)
    L3_114 = wait
    L3_114()
    L4_115 = L2_113
    L3_114 = L2_113.setForceMove
    L3_114(L4_115)
    L4_115 = L2_113
    L3_114 = L2_113.getWorldPos
    L3_114 = L3_114(L4_115)
    L4_115 = L2_113.getWorldRot
    L4_115 = L4_115(L2_113)
    if A1_112 == nil then
      Player:reset(Player.kReset_Standing, L3_114, L4_115)
    else
      Player:reset(A1_112, L3_114, L4_115)
    end
    wait()
    Time:resetInGameDeltaSec()
    wait()
    if GameDatabase:get(ggd.Debug__AreaDrift) == true and GameDatabase:get(ggd.GlobalSystemFlags__AreaDrift) == true then
      Area:setAnimMoveDriftEnable(true, true, true)
    end
    print(" << player common >> area loading...")
    DeltaTimer:new():start()
    DeltaTimer:new():stop()
    print(" << player common >> area load milli second = " .. DeltaTimer:new():getMSecond())
    print(" << player common >> area load second = " .. DeltaTimer:new():getSecond())
  end
end
function cubesensor2_defense_01_OnEnter(A0_116, A1_117)
  in_sensor_count = in_sensor_count + 1
end
function cubesensor2_defense_01_OnLeave(A0_118, A1_119)
  in_sensor_count = in_sensor_count - 1
end
function main()
  local L0_120, L1_121, L2_122, L3_123
  L0_120 = Debug
  L1_121 = L0_120
  L0_120 = L0_120.setSwitch
  L2_122 = {
    L3_123,
    "Console",
    "Script"
  }
  L3_123 = "Development"
  L3_123 = true
  L0_120(L1_121, L2_122, L3_123)
  L0_120 = Debug
  L1_121 = L0_120
  L0_120 = L0_120.setSwitch
  L2_122 = {
    L3_123,
    "Screen Console"
  }
  L3_123 = "Display"
  L3_123 = false
  L0_120(L1_121, L2_122, L3_123)
  L0_120 = Debug
  L1_121 = L0_120
  L0_120 = L0_120.setSwitch
  L2_122 = {
    L3_123,
    "File Asset Status"
  }
  L3_123 = "Display"
  L3_123 = false
  L0_120(L1_121, L2_122, L3_123)
  L0_120 = Debug
  L1_121 = L0_120
  L0_120 = L0_120.setSwitch
  L2_122 = {
    L3_123,
    "Warning Indicator"
  }
  L3_123 = "Display"
  L3_123 = false
  L0_120(L1_121, L2_122, L3_123)
  L0_120 = createSandbox2
  L1_121 = "father2"
  L0_120 = L0_120(L1_121)
  L2_122 = L0_120
  L1_121 = L0_120.setString
  L3_123 = "g_filename"
  L1_121(L2_122, L3_123, "/Game/Event2/father2.lua")
  L2_122 = L0_120
  L1_121 = L0_120.try_init
  L1_121(L2_122)
  L2_122 = L0_120
  L1_121 = L0_120.waitForReady
  L1_121(L2_122)
  L2_122 = L0_120
  L1_121 = L0_120.try_start
  L1_121(L2_122)
  while true do
    L2_122 = L0_120
    L1_121 = L0_120.sendEvent
    L3_123 = "isPcSpawned"
    L1_121 = L1_121(L2_122, L3_123)
    if not L1_121 then
      L1_121 = wait
      L1_121()
    end
  end
  L1_121 = DebugStage
  L2_122 = L1_121
  L1_121 = L1_121.createTestStage
  L1_121(L2_122)
  L1_121 = loadFileAsset
  L2_122 = "evb"
  L3_123 = "evx/test_racjin00"
  L1_121 = L1_121(L2_122, L3_123)
  L2_122, L3_123 = nil, nil
  if L1_121 ~= nil then
    L1_121:wait()
    L2_122 = L1_121:getRoot()
    L3_123 = EventData:create("test_racjin00", nil, L2_122)
    L3_123:try_init()
    L3_123:waitForReady()
    L3_123:try_start()
  end
  Initialize()
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  GameDatabase:reset(ggd.GlobalSystemFlags)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  invokeTask(function()
    Ingame()
  end)
end
