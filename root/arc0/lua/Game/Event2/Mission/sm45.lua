import("math")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
dofile("/Game/Event2/Mission/sm35_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
FAN_CHASE_MAX = 300
ACTIVE_FAN_CHASE_MAX = 50
ACTIVE_FAN_CHASE_DIST = 20
FAN_CHASE_CONDITION = 100
ESCAPE_TARGET_NODE = -1
ESCAPE_FAILED_DISTANCE_MOVE = 0.8
ESCAPE_FAILED_DISTANCE_IDLE = 0.8
ESCAPE_FAILED_DISTANCE_IDLE_SEC = 2
CHECK_POINT_MAX = 8
FAN_FIND_CAPTION_WAIT_SEC = 3
CHECK_POINT_MANAGER_COM = {
  {num = 1, cap = "sm45_00100"},
  {num = 2, cap = "sm45_00101"},
  {num = 4, cap = "sm45_00102"},
  {num = 5, cap = "sm45_00103"},
  {num = 7, cap = "sm45_00104"}
}
pc_restart_pos = "locator2_pc_restart_pos"
SM45_PLAYER_MOTION = {
  greeting = "kit01_greeting_00"
}
check_point_restart_check_now = 1
check_point_manager_cap_num = 1
FAN_WARP_DISTANCE = 10
LINE_NAME_PREFIX = "immobile_lineup_"
DEFAULT_SPEED = 2
DEFAULT_MOVE_OFF_DISTANCE = 300
DEFAULT_NPC_DEGREE_H = 45
DEFAULT_NPC_DEGREE_V = 45
DEFAULT_NPC_IN_LENGTH = 10
DEFAULT_NPC_OUT_LENGTH = 200
DEFAULT_NPC_MOVE_WAIT_SEC = 0.5
gold_point_appear = false
escape_failed_flag = false
check_course_out_multi_01 = true
check_course_out_multi_02 = false
set_check_point_idx = 1
check_point_pass = 1
puppets = {}
sdemo = nil
_fan_warp_task = nil
puppets_fan = {}
puppets_fan_reset_pos = {}
_immobile_lineup_node = {}
FAN_CHARA_MOVE_TABLE = {
  {
    name = "npc_fan_distance_001",
    type = "chi_hex_dt",
    node = "locator2_fan_distance_001",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_002",
    type = "chi_hex_dt",
    node = "locator2_fan_distance_002",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_003",
    type = "random_hex_dt",
    node = "locator2_fan_distance_003",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_004",
    type = "random_hex_dt",
    node = "locator2_fan_distance_004",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_005",
    type = "random_hex_dt",
    node = "locator2_fan_distance_005",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_006",
    type = "random_hex_dt",
    node = "locator2_fan_distance_006",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_007",
    type = "random_hex_dt",
    node = "locator2_fan_distance_007",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_008",
    type = "random_hex_dt",
    node = "locator2_fan_distance_008",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_009",
    type = "random_hex_dt",
    node = "locator2_fan_distance_009",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_010",
    type = "random_hex_dt",
    node = "locator2_fan_distance_010",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_011",
    type = "random_hex_dt",
    node = "locator2_fan_distance_011",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_012",
    type = "random_hex_dt",
    node = "locator2_fan_distance_012",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_013",
    type = "random_hex_dt",
    node = "locator2_fan_distance_013",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_distance_015",
    type = "random_hex_dt",
    node = "locator2_fan_distance_015",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_001",
    type = "random_hex_dt",
    node = "locator2_fan_sight_001",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_002",
    type = "random_hex_dt",
    node = "locator2_fan_sight_002",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_003",
    type = "random_hex_dt",
    node = "locator2_fan_sight_003",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_004",
    type = "random_hex_dt",
    node = "locator2_fan_sight_004",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_005",
    type = "random_hex_dt",
    node = "locator2_fan_sight_005",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_006",
    type = "random_hex_dt",
    node = "locator2_fan_sight_006",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_007",
    type = "random_hex_dt",
    node = "locator2_fan_sight_007",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_008",
    type = "random_hex_dt",
    node = "locator2_fan_sight_008",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_009",
    type = "random_hex_dt",
    node = "locator2_fan_sight_009",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_010",
    type = "random_hex_dt",
    node = "locator2_fan_sight_010",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_012",
    type = "random_hex_dt",
    node = "locator2_fan_sight_012",
    motion_use = false,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_013",
    type = "random_hex_dt",
    node = "locator2_fan_sight_013",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_014",
    type = "random_hex_dt",
    node = "locator2_fan_sight_014",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_015",
    type = "random_hex_dt",
    node = "locator2_fan_sight_015",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_sight_019",
    type = "random_hex_dt",
    node = "locator2_fan_sight_019",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_003",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_003",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_004",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_004",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_005",
    type = "chi_hex_dt",
    node = "locator2_fan_immobile_005",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_006",
    type = "chi_hex_dt",
    node = "locator2_fan_immobile_006",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_007",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_007",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_008",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_008",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_009",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_009",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_010",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_010",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_011",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_011",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_012",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_012",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_013",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_013",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_014",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_014",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_015",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_015",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_016",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_016",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_017",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_017",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_018",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_018",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_019",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_019",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_020",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_020",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_021",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_021",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_022",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_022",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_023",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_023",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_024",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_024",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_025",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_025",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_026",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_026",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_027",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_027",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_028",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_028",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_029",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_029",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_030",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_030",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1
  },
  {
    name = "npc_fan_immobile_064",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_064",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_065",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_065",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_066",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_066",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_067",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_067",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_068",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_068",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_069",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_069",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_070",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_070",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_071",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_071",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_072",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_072",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_073",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_073",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_074",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_074",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_075",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_075",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_080",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_080",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_081",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_081",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_082",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_082",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_083",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_083",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_084",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_084",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_085",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_085",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_086",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_086",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_087",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_087",
    motion_use = true,
    stay_type = "alone",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_129",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_129",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_130",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_130",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_131",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_131",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_132",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_132",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_133",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_133",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_134",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_134",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_135",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_135",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_136",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_136",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_137",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_137",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_138",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_138",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_139",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_139",
    motion_use = true,
    stay_type = "lineup",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_153",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_153",
    motion_use = true,
    stay_type = "talk",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_154",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_154",
    motion_use = true,
    stay_type = "talk",
    line_no = nil
  },
  {
    name = "npc_fan_immobile_155",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_155",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2
  },
  {
    name = "npc_fan_immobile_156",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_156",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2
  },
  {
    name = "npc_fan_immobile_157",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_157",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2
  },
  {
    name = "npc_fan_immobile_158",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_158",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2
  },
  {
    name = "npc_fan_immobile_159",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_159",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2
  },
  {
    name = "npc_fan_immobile_160",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_160",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2
  },
  {
    name = "npc_fan_immobile_179",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_179",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_180",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_180",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_181",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_181",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_182",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_182",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_183",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_183",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_184",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_184",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_185",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_185",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_186",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_186",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_187",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_187",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_188",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_188",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_189",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_189",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  },
  {
    name = "npc_fan_immobile_190",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_190",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3
  }
}
FAN_CHARA_IMMOBILE_TABLE = {
  {
    name = "npc_fan_immobile_149",
    type = "man01",
    node = "locator2_fan_immobile_149",
    motion_use = false,
    stay_type = "salesman",
    color_variation = 1,
    hair_variation = 1
  },
  {
    name = "npc_fan_immobile_201",
    type = "man09",
    node = "locator2_fan_immobile_201",
    motion_use = false,
    stay_type = "salesman",
    color_variation = 1,
    hair_variation = 1
  },
  {
    name = "npc_fan_immobile_202",
    type = "man64",
    node = "locator2_fan_immobile_202",
    motion_use = false,
    stay_type = "salesman",
    color_variation = 1,
    hair_variation = 1
  },
  {
    name = "npc_fan_immobile_203",
    type = "man83",
    node = "locator2_fan_immobile_203",
    motion_use = false,
    stay_type = "salesman",
    color_variation = 1,
    hair_variation = 1
  },
  {
    name = "npc_fan_immobile_204",
    type = "man17",
    node = "locator2_fan_immobile_204",
    motion_use = false,
    stay_type = "salesman",
    color_variation = 1,
    hair_variation = 1
  },
  {
    name = "npc_fan_immobile_205",
    type = "man18",
    node = "locator2_fan_immobile_205",
    motion_use = false,
    stay_type = "salesman",
    color_variation = 1,
    hair_variation = 1
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = set_bg_visible
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4
  }
  L1_1.name = "npc_fan_dummy_001"
  L1_1.type = "ve03"
  L1_1.node = "locator2_fan_dummy_001"
  L2_2.name = "npc_fan_dummy_002"
  L2_2.type = "ve01"
  L2_2.node = "locator2_fan_dummy_002"
  L3_3.name = "sdemo_fan_wom01"
  L3_3.type = "wom03"
  L3_3.node = "locator2_epilogue_fan_wom01"
  L3_3.active = false
  L3_3.not_mob = true
  L4_4.name = "sdemo_fan_wom02"
  L4_4.type = "wom04"
  L4_4.node = "locator2_epilogue_fan_wom02"
  L4_4.active = false
  L4_4.not_mob = true
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = puppets
    L6_6[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
  end
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  for L5_5, L6_6 in L2_2(L3_3) do
    if L6_6.stay_type == "accordion" then
      table.insert(L1_1, {
        name = L6_6.name .. "_accordion",
        type = "ciaccordion01",
        node = L6_6.node
      })
    end
  end
  for L5_5, L6_6 in L2_2(L3_3) do
    if L6_6.stay_type == "accordion" then
      table.insert(L1_1, {
        name = L6_6.name .. "_accordion",
        type = "ciaccordion01",
        node = L6_6.node
      })
    end
  end
  L2_2(L3_3)
  for L5_5 = 1, #L3_3 do
    L6_6 = puppets_fan
    L6_6[L5_5] = Fn_findNpcPuppet(FAN_CHARA_MOVE_TABLE[L5_5].name)
    L6_6 = puppets_fan_reset_pos
    L6_6[L5_5] = FAN_CHARA_MOVE_TABLE[L5_5].node
    L6_6 = Sub_GetNpcTypeName
    L6_6 = L6_6(FAN_CHARA_MOVE_TABLE[L5_5].name, FAN_CHARA_MOVE_TABLE[L5_5].type)
    Sub_fan_MotionLoad(FAN_CHARA_MOVE_TABLE[L5_5].name, L6_6, FAN_CHARA_MOVE_TABLE[L5_5].stay_type)
  end
  for L5_5 = 1, CHECK_POINT_MAX do
    L6_6 = Fn_pcSensorOff
    L6_6("pccubesensor2_checkpoint_" .. string.format("%02d", L5_5))
  end
  L2_2(L3_3)
  L2_2(L3_3)
  L5_5 = "Node"
  L6_6 = "locator2_pc_pdemo"
  L5_5 = {}
  L5_5.camera = true
  L5_5.scene_param = false
  sm45_costume_pdemo = L2_2
  sdemo = L2_2
  L2_2(L3_3, L4_4)
  L2_2(L3_3, L4_4)
  L5_5 = true
  L2_2(L3_3, L4_4, L5_5)
  L2_2(L3_3)
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27
  L0_7 = {}
  L0_7.guide = "man74_guide_r_00"
  L0_7.idle = "man74_idle_00"
  L1_8(L2_9, L3_10)
  L4_11 = false
  L1_8(L2_9, L3_10, L4_11)
  for L4_11, L5_12 in L1_8(L2_9) do
    if L6_13 == "accordion" then
      L10_17 = {}
      L10_17.pilot = L11_18
      L10_17.attach = "bn_spine1"
      L7_14(L8_15, L9_16)
    end
  end
  for L4_11, L5_12 in L1_8(L2_9) do
    if L6_13 == "accordion" then
      L10_17 = {}
      L10_17.pilot = L11_18
      L10_17.attach = "bn_spine1"
      L7_14(L8_15, L9_16)
    end
    L6_13(L7_14)
  end
  for L4_11 = 1, #L2_9 do
    L10_17 = Sub_MobType_discrimination
    L10_17 = L10_17(L11_18)
    L7_14[L5_12] = L8_15
  end
  for L4_11 = 1, #L2_9 do
    L10_17 = Sub_MobType_discrimination
    L10_17 = L10_17(L11_18)
    L7_14[L5_12] = L8_15
  end
  while true do
    if L1_8 == false then
      L1_8()
    end
  end
  L1_8()
  L1_8()
  L1_8(L2_9)
  L1_8()
  if L1_8 == true then
    L2_9(L3_10)
  end
  L2_9(L3_10)
  L2_9(L3_10)
  L2_9()
  L2_9(L3_10)
  L2_9(L3_10)
  L4_11 = true
  L2_9(L3_10, L4_11)
  L2_9(L3_10)
  L2_9()
  while true do
    if L2_9 == false then
      L2_9()
    end
  end
  L2_9()
  L4_11 = 0
  L2_9(L3_10, L4_11)
  L2_9(L3_10)
  L4_11 = false
  L2_9(L3_10, L4_11)
  L1_8(L2_9, L3_10)
  L4_11 = true
  L2_9(L3_10, L4_11)
  L4_11 = ESCAPE_TARGET_NODE
  L4_11 = L1_8
  L3_10(L4_11, L5_12)
  L4_11 = {}
  for L8_15 = 1, #L6_13 do
    if L9_16 ~= nil then
      L10_17 = LINE_NAME_PREFIX
      L10_17 = L10_17 .. L11_18
      if L11_18 == nil then
        L11_18[L9_16] = L12_19
        L11_18()
      end
      if L11_18 == nil then
        L4_11[L9_16] = 1
      end
      if L11_18 ~= nil then
        L13_20[L11_18] = L14_21
        L18_25 = Sub_MobType_discrimination
        L19_26 = L12_19
        L18_25 = L18_25(L19_26)
        L19_26 = FAN_CHARA_MOVE_TABLE
        L19_26 = L19_26[L8_15]
        L19_26 = L19_26.stay_type
        L13_20[L11_18] = L14_21
        L13_20(L14_21, L15_22)
      else
        L20_27 = L12_19(L13_20, L14_21)
        L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L12_19(L13_20, L14_21))
      end
      L4_11[L9_16] = L11_18
    end
  end
  L5_12()
  L5_12(L6_13)
  L5_12(L6_13, L7_14)
  L7_14(L8_15)
  L10_17 = L5_12
  L20_27 = L12_19(L13_20, L14_21, L15_22)
  L7_14(L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L12_19(L13_20, L14_21, L15_22))
  L7_14(L8_15)
  L7_14()
  L7_14(L8_15)
  L10_17 = {L11_18}
  L11_18.pos = "locator2_overlook_cam_02"
  L11_18.time = 6
  L11_18.hashfunc = "EaseInOut"
  L12_19.pos = "locator2_overlook_aim_03"
  L12_19.time = 3
  L12_19.hashfunc = "EaseIn"
  L13_20.pos = "locator2_overlook_aim_02"
  L13_20.time = 3
  L13_20.hashfunc = "EaseOut"
  L8_15(L9_16, L10_17, L11_18)
  while true do
    if L8_15 then
      L8_15()
    end
  end
  L10_17 = 4
  L8_15(L9_16, L10_17)
  L8_15(L9_16)
  L5_12(L6_13, L7_14, L8_15)
  L5_12()
  L5_12()
  L6_13()
  L6_13()
  L6_13()
  L6_13(L7_14)
  mob_to_npc_main_task = L6_13
  L7_14()
  for L10_17 = 1, #L8_15 do
    L14_21[L11_18] = L12_19
    L14_21[L11_18] = L15_22
    L18_25 = npc_model_name
    L18_25 = L18_25[L11_18]
    L18_25 = L12_19
    L19_26 = L13_20
    L14_21[L11_18] = L15_22
  end
  for L10_17 = 1, #L8_15 do
    L18_25 = L12_19
    L20_27 = L17_24(L18_25)
    L13_20[L11_18] = L14_21
  end
  L7_14(L8_15, L9_16)
  L7_14(L8_15, L9_16)
  L7_14(L8_15, L9_16)
  L10_17 = nil
  while true do
    while true do
      if L11_18 <= L12_19 then
        L11_18()
        if L11_18 == false then
          if L11_18 >= L12_19 then
            gold_point_appear = true
            L11_18(L12_19)
          end
        end
        if L11_18 == true then
          if L11_18 < L12_19 then
            L11_18(L12_19)
            gold_point_appear = false
            for L14_21 = check_point_pass, CHECK_POINT_MAX do
              L18_25 = "%02d"
              L19_26 = L14_21
              L15_22(L16_23)
            end
            L11_18()
          end
        end
        if L11_18 == true then
          if L11_18 < L12_19 then
            for L14_21 = 1, L12_19 - 1 do
              L18_25 = "%02d"
              L19_26 = L14_21
              L15_22(L16_23)
            end
            L11_18(L12_19)
            check_point_pass = L11_18
            if L11_18 >= L12_19 then
              L11_18(L12_19)
              L20_27 = L12_19(L13_20, L14_21)
              L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L12_19(L13_20, L14_21))
              if L11_18 ~= nil then
                if L11_18 > L12_19 then
                  if L10_17 ~= nil then
                    if L11_18 then
                      L11_18(L12_19)
                    end
                    L10_17 = nil
                  end
                  L10_17 = L11_18
                end
              end
            end
          end
        end
        if L11_18 == true then
          if L11_18 == true then
            L11_18(L12_19)
          else
            L11_18(L12_19)
          end
          escape_failed_flag = true
        end
        if L11_18 == true then
          L11_18()
          if L11_18 ~= nil then
            L11_18(L12_19)
            _fan_warp_task = nil
          end
          fan_touch_stop_flag = true
          if L11_18 == true then
            L11_18(L12_19)
            gold_point_appear = false
            L11_18(L12_19)
            L11_18(L12_19)
          end
          L11_18()
          L11_18(L12_19, L13_20)
          L11_18()
          L11_18(L12_19)
          L11_18()
          for L16_23 = 1, #L14_21 do
            if L17_24 ~= nil then
              L18_25 = LINE_NAME_PREFIX
              L19_26 = string
              L19_26 = L19_26.format
              L20_27 = "%02d"
              L19_26 = L19_26(L20_27, L17_24)
              L18_25 = L18_25 .. L19_26
              L19_26 = _immobile_lineup_node
              L19_26 = L19_26[L17_24]
              if L19_26 ~= nil then
                L19_26 = L12_19[L17_24]
                if L19_26 == nil then
                  L12_19[L17_24] = 1
                end
                L19_26 = _immobile_lineup_node
                L19_26 = L19_26[L17_24]
                L20_27 = L12_19[L17_24]
                L19_26 = L19_26[L20_27]
                if L19_26 ~= nil then
                  L19_26 = FAN_CHARA_MOVE_TABLE
                  L19_26 = L19_26[L16_23]
                  L19_26 = L19_26.name
                  L20_27 = Sub_GetNpcTypeName
                  L20_27 = L20_27(L19_26, FAN_CHARA_MOVE_TABLE[L16_23].type)
                  _lineup_customers[L19_26] = Fn_findNpcPuppet(L19_26)
                  _immobile_lineup_task[L19_26] = Sub_addLineup(L18_25, L19_26, _immobile_lineup_node[L17_24], Sub_MobType_discrimination(L20_27), FAN_CHARA_MOVE_TABLE[L16_23].stay_type)
                  Fn_warpNpc(L19_26, _immobile_lineup_node[L17_24][L12_19[L17_24]])
                else
                  L19_26 = print
                  L20_27 = string
                  L20_27 = L20_27.format
                  L20_27 = L20_27("ERROR: locator2_lineup_%02d_XX \227\129\174\227\131\173\227\130\177\227\131\188\227\130\191\227\129\174\229\144\136\232\168\136\232\183\157\233\155\162\227\129\140\231\159\173\227\129\132\227\129\174\227\129\167\232\161\140\229\136\151\227\129\174NPC\233\133\141\231\189\174\231\148\168\227\131\173\227\130\177\227\131\188\227\130\191\227\129\140\231\148\159\230\136\144\227\129\167\227\129\141\227\129\166\227\129\170\227\129\132\239\188\129\239\188\129\239\188\129", L17_24)
                  L19_26(L20_27, L20_27("ERROR: locator2_lineup_%02d_XX \227\129\174\227\131\173\227\130\177\227\131\188\227\130\191\227\129\174\229\144\136\232\168\136\232\183\157\233\155\162\227\129\140\231\159\173\227\129\132\227\129\174\227\129\167\232\161\140\229\136\151\227\129\174NPC\233\133\141\231\189\174\231\148\168\227\131\173\227\130\177\227\131\188\227\130\191\227\129\140\231\148\159\230\136\144\227\129\167\227\129\141\227\129\166\227\129\170\227\129\132\239\188\129\239\188\129\239\188\129", L17_24))
                end
              end
              L19_26 = L12_19[L17_24]
              L19_26 = L19_26 + 1
              L12_19[L17_24] = L19_26
            end
          end
          fan_chase = 0
          score = 0
          check_point_pass = 1
          L13_20(L14_21)
          check_course_out_multi_01 = true
          check_course_out_multi_02 = false
          L13_20(L14_21, L15_22)
          L13_20(L14_21)
          L13_20()
          check_point_manager_cap_num = 1
          L13_20()
          L13_20()
          L13_20()
          L13_20(L14_21, L15_22)
          L13_20()
          mob_to_npc_main_task = L13_20
          set_check_point_idx = 1
        end
      end
    end
  end
  while true do
    if L11_18 == true then
      L11_18()
    end
  end
  L11_18()
  L11_18(L12_19)
  L11_18(L12_19)
  if L11_18 ~= nil then
    L11_18(L12_19)
    _fan_warp_task = nil
  end
  if L6_13 ~= nil then
    L11_18(L12_19)
  end
  if L11_18 ~= nil then
    L11_18(L12_19)
    mob_to_npc_main_task = nil
  end
  L11_18()
  L11_18()
  L11_18(L12_19, L13_20)
  L11_18()
  for L15_22 = 1, #L13_20 do
    if L17_24 ~= nil then
      L18_25 = L17_24
      if L17_24 then
        L18_25 = L11_18
        L19_26 = L16_23
        L17_24(L18_25, L19_26)
      end
    end
    L18_25 = L16_23
    L17_24(L18_25)
    L18_25 = L16_23
    L19_26 = false
    L17_24(L18_25, L19_26)
  end
  for L15_22, L16_23 in L12_19(L13_20) do
    L18_25 = L16_23
    if L17_24 ~= nil then
      L18_25 = L16_23
      L17_24(L18_25)
      L18_25 = L11_18
      L19_26 = L16_23
      L17_24(L18_25, L19_26)
      L18_25 = L16_23
      L19_26 = false
      L17_24(L18_25, L19_26)
    end
  end
  L12_19(L13_20)
  L12_19(L13_20, L14_21, L15_22)
  L15_22(L16_23)
  L18_25 = L13_20
  L19_26 = false
  L20_27 = Vector
  L20_27 = L20_27(0, 1.5, 0)
  L15_22(L16_23, L17_24, L18_25, L19_26, L20_27, L20_27(0, 1.5, 0))
  L15_22(L16_23)
  L18_25 = "locator2_epilogue_manager_pos_02"
  L16_23(L17_24, L18_25)
  L18_25 = "stay"
  L16_23(L17_24, L18_25)
  function L18_25()
    local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33
    L0_28 = 1
    for L4_32, L5_33 in L1_29(L2_30) do
      if Fn_findNpc(L5_33) ~= nil then
        Fn_setNpcActive(L5_33, true)
        Fn_warpNpc(L5_33, string.format("locator2_epilogue_fan_warppos_%02d", L0_28))
        npc_fan_move_task[L5_33] = Fn_moveNpc(L5_33, {
          string.format("locator2_epilogue_fans_goal_01_%02d", L0_28),
          string.format("locator2_epilogue_fans_goal_02_%02d", L0_28),
          string.format("locator2_epilogue_fans_goal_03_%02d", L0_28)
        }, {
          anim_run_speed = speed,
          runLength = -1
        })
        L0_28 = L0_28 + 1
        if L0_28 == 4 then
          waitSeconds(0.2)
          L0_28 = 1
        end
      end
    end
    L16_23 = L1_29
  end
  L18_25 = Fn_fadein
  L18_25()
  L18_25 = Fn_playMotionNpc
  L19_26 = L15_22
  L20_27 = "inform_in"
  L18_25(L19_26, L20_27, false)
  L18_25 = Sound
  L19_26 = L18_25
  L18_25 = L18_25.playSE
  L20_27 = "m33_911"
  L18_25(L19_26, L20_27, 1)
  L18_25 = Fn_captionView
  L19_26 = "sm45_00113"
  L18_25(L19_26)
  L18_25 = sdemo
  L19_26 = L18_25
  L18_25 = L18_25.play
  L20_27 = {
    {
      pos = "locator2_epilogue_camera_02",
      time = 6,
      hashfunc = "EaseInOut"
    }
  }
  L18_25(L19_26, L20_27, nil)
  while not L16_23 do
    L18_25 = wait
    L18_25()
  end
  L18_25 = waitSeconds
  L19_26 = 2
  L18_25(L19_26)
  do break end
  L13_20()
  L13_20(L14_21)
  L15_22(L16_23)
  L18_25 = L13_20
  L19_26 = false
  L20_27 = Vector
  L20_27 = L20_27(0, 1.5, 0)
  L15_22(L16_23, L17_24, L18_25, L19_26, L20_27, L20_27(0, 1.5, 0))
  L15_22(L16_23)
  L15_22()
  L15_22(L16_23, L17_24)
  L18_25 = false
  L15_22(L16_23, L17_24, L18_25)
  L18_25 = false
  L15_22(L16_23, L17_24, L18_25)
  L15_22(L16_23)
  L15_22()
  L15_22(L16_23, L17_24)
  L15_22(L16_23, L17_24)
  for L18_25, L19_26 in L15_22(L16_23) do
    L20_27 = RAC_endLineup
    L20_27(LINE_NAME_PREFIX .. string.format("%02d", L18_25))
  end
  _immobile_lineup_node = nil
  L18_25 = L13_20
  L15_22(L16_23, L17_24, L18_25)
  L15_22()
  L15_22(L16_23)
  L18_25 = "locator2_epilogue_fan_move_01"
  L18_25 = {}
  L18_25.arrivedLength = 0.5
  L18_25.runLength = 2
  L18_25 = {L19_26}
  L19_26 = "locator2_epilogue_fan_move_02"
  L19_26 = {}
  L19_26.arrivedLength = 0.5
  L19_26.runLength = 1
  L18_25 = 1
  L17_24(L18_25)
  L18_25 = "Node"
  L19_26 = "locator2_epilogue_aim_03"
  L18_25 = L17_24
  L19_26 = nil
  L20_27 = {
    {
      pos = L13_20,
      time = 2,
      hashfunc = "EaseInOut"
    }
  }
  L17_24(L18_25, L19_26, L20_27)
  while true do
    L18_25 = L17_24
    if L17_24 then
      L17_24()
    end
  end
  L18_25 = L17_24
  L19_26 = true
  L20_27 = 1
  L17_24(L18_25, L19_26, L20_27, Fn_findNpcPuppet("sdemo_fan_wom01"):getWorldPos() + Vector(0, 1.5, 0))
  L18_25 = Fn_turnNpc
  L19_26 = "sm45_client"
  L20_27 = "locator2_epilogue_fan_wom01"
  while true do
    L19_26 = L17_24
    L18_25 = L17_24.isRunning
    L18_25 = L18_25(L19_26)
    if L18_25 then
      L18_25 = wait
      L18_25()
    end
  end
  L18_25 = Player
  L19_26 = L18_25
  L18_25 = L18_25.setLookAtIk
  L20_27 = false
  L18_25(L19_26, L20_27, 1, Vector(0, 0, 0))
  L18_25 = Fn_kaiwaDemoView
  L19_26 = "sm45_00300k"
  L18_25(L19_26)
  L18_25 = waitSeconds
  L19_26 = 0.5
  L18_25(L19_26)
  L18_25 = sdemo
  L19_26 = L18_25
  L18_25 = L18_25.stop
  L20_27 = 2
  L18_25(L19_26, L20_27)
  L18_25 = Fn_userCtrlOn
  L18_25()
  L18_25 = Fn_setKeepPlayerPos
  L18_25()
  L18_25 = Fn_setNextMissionFlag
  L18_25()
  L18_25 = Fn_nextMission
  L18_25()
  L18_25 = Fn_exitSandbox
  L18_25()
end
function Finalize()
  set_bg_visible(true)
  Mob:restrictNav_sm45_00(false)
  Mob:restrict_sm45_00(false)
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
  Fn_disableCostumeChange(false)
  Sound:setGlobalVariable("voice_type", "normal")
end
function pccubesensor2_checkpoint_01_OnEnter()
  local L0_34, L1_35
  set_check_point_idx = 2
end
function pccubesensor2_checkpoint_01_OnLeave()
  local L0_36, L1_37
end
function pccubesensor2_checkpoint_02_OnEnter()
  local L0_38, L1_39
  set_check_point_idx = 3
end
function pccubesensor2_checkpoint_02_OnLeave()
  local L0_40, L1_41
end
function pccubesensor2_checkpoint_03_OnEnter()
  local L0_42, L1_43
  set_check_point_idx = 4
end
function pccubesensor2_checkpoint_03_OnLeave()
  local L0_44, L1_45
end
function pccubesensor2_checkpoint_04_OnEnter()
  local L0_46, L1_47
  set_check_point_idx = 5
end
function pccubesensor2_checkpoint_04_OnLeave()
  local L0_48, L1_49
end
function pccubesensor2_checkpoint_05_OnEnter()
  local L0_50, L1_51
  set_check_point_idx = 6
end
function pccubesensor2_checkpoint_05_OnLeave()
  local L0_52, L1_53
end
function pccubesensor2_checkpoint_06_OnEnter()
  local L0_54, L1_55
  set_check_point_idx = 7
end
function pccubesensor2_checkpoint_06_OnLeave()
  local L0_56, L1_57
end
function pccubesensor2_checkpoint_07_OnEnter()
  local L0_58, L1_59
  set_check_point_idx = 8
end
function pccubesensor2_checkpoint_07_OnLeave()
  local L0_60, L1_61
end
function pccubesensor2_checkpoint_08_OnEnter()
  local L0_62, L1_63
  set_check_point_idx = 9
end
function pccubesensor2_checkpoint_08_OnLeave()
  local L0_64, L1_65
end
function pccubesensormulti2_course_out_OnEnter()
  print("course1 sensor in")
  check_course_out = false
  check_course_out_multi_01 = true
end
function pccubesensormulti2_course_out_OnLeave()
  print("course1 sensor out")
  if check_course_out_multi_02 == false then
    check_course_out = true
  end
  check_course_out_multi_01 = false
end
function pccubesensormulti2_course_out2_OnEnter()
  print("course2 sensor in")
  check_course_out = false
  check_course_out_multi_02 = true
end
function pccubesensormulti2_course_out2_OnLeave()
  print("course2 sensor out")
  if check_course_out_multi_01 == false then
    check_course_out = true
  end
  check_course_out_multi_02 = false
end
function Sub_fan_hud()
  return invokeTask(function()
    while true do
      if score ~= score then
        HUD:counter999SetNum(score)
      end
      wait()
    end
  end)
end
function Sub_fan_warp_checker()
  return invokeTask(function()
    local L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77, L12_78, L13_79, L14_80, L15_81, L16_82, L17_83, L18_84, L19_85
    L0_66 = {
      L1_67,
      L2_68,
      L3_69,
      L4_70,
      L5_71,
      L6_72,
      L7_73,
      L8_74
    }
    L1_67 = {}
    L1_67.locator = "locator2_warppoint_01"
    L1_67.dist = 5
    L2_68 = {}
    L2_68.locator = "locator2_warppoint_02"
    L2_68.dist = 5
    L3_69 = {}
    L3_69.locator = "locator2_warppoint_03"
    L3_69.dist = 5
    L4_70 = {}
    L4_70.locator = "locator2_warppoint_04"
    L4_70.dist = 5
    L5_71 = {}
    L5_71.locator = "locator2_warppoint_05"
    L5_71.dist = 5
    L6_72 = {}
    L6_72.locator = "locator2_warppoint_06"
    L6_72.dist = 5
    L7_73 = {}
    L7_73.locator = "locator2_warppoint_07"
    L7_73.dist = 5
    L8_74 = {}
    L8_74.locator = "locator2_warppoint_08"
    L8_74.dist = 5
    L1_67, L2_68, L3_69, L4_70, L5_71 = nil, nil, nil, nil, nil
    L6_72 = 10
    L7_73 = nil
    L8_74 = 0
    L9_75 = 1
    L10_76 = 1
    L11_77 = 1
    L12_78 = nil
    L13_79 = 0
    while true do
      if L14_80 >= 2 then
        if L11_77 ~= L14_80 then
          L11_77 = check_point_pass
          L13_79 = fan_chase
        end
        L2_68 = 0
        repeat
          if L13_79 >= 0 then
            L14_80(L15_81)
            L5_71 = L14_80
            L12_78 = L14_80
            for L17_83, L18_84 in L14_80(L15_81) do
              L19_85 = L18_84.isRunning
              L19_85 = L19_85(L18_84)
              if L19_85 then
                L19_85 = L17_83
                L4_70 = Fn_findNpcPuppet(L19_85)
                L3_69 = Fn_findNpc(L19_85)
                distance = Fn_getDistanceToPlayer(L3_69)
                if distance > L0_66[check_point_pass - 1].dist and Fn_isInSightTarget(L4_70, 0.7) == false and Fn_isInSightTarget(L5_71, 0.7) == false and L6_72 < L12_78 then
                  L7_73 = L19_85
                  L8_74 = distance
                  L9_75 = L10_76
                end
                L10_76 = L10_76 + 1
              end
            end
            if L8_74 > L14_80 then
              L14_80(L15_81)
              L14_80(L15_81, L16_82)
              npc = L14_80
              if L14_80 ~= nil then
                L14_80(L15_81)
                L14_80[L7_73] = nil
              end
              L17_83 = {L18_84}
              L18_84 = "locator2_kit_tailing_point_01"
              L18_84 = {}
              L19_85 = speed
              L18_84.anim_run_speed = L19_85
              L18_84.runLength = -1
              L14_80[L7_73] = L15_81
              L2_68 = L2_68 + 1
              L13_79 = L13_79 - 1
              L14_80(L15_81)
            else
              L14_80(L15_81)
            end
            L7_73 = nil
            L8_74 = 0
            L10_76 = 1
            L9_75 = 1
          else
            L14_80(L15_81)
            L2_68 = 3
          end
          L14_80()
        until L2_68 >= 3
        L14_80(L15_81)
        L14_80(L15_81)
        L14_80(L15_81)
      end
      L14_80()
    end
  end)
end
function set_bg_visible(A0_86)
  local L1_87, L2_88, L3_89
  L1_87 = Fn_findAreaHandle
  L2_88 = "ji_a_root"
  L1_87 = L1_87(L2_88)
  if L1_87 ~= nil then
    L2_88 = L1_87.getDescendant
    L2_88 = L2_88(L3_89)
    for _FORV_6_, _FORV_7_ in L3_89(L2_88) do
      if _FORV_7_ ~= nil then
        _FORV_7_:setEffectiveness(A0_86, true)
      end
    end
  end
  L2_88 = Fn_findAreaHandle
  L2_88 = L2_88(L3_89)
  if L2_88 ~= nil then
    for _FORV_7_, _FORV_8_ in pairs(L3_89) do
      if _FORV_8_ ~= nil then
        _FORV_8_:setEffectiveness(A0_86, true)
      end
    end
  end
  if L3_89 ~= nil then
    L3_89:setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("g1_crane_pd_01") ~= nil then
    Fn_findAreaHandle("g1_crane_pd_01"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("cc_a_01") ~= nil then
    Fn_findAreaHandle("cc_a_01"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("ed_a_01") ~= nil then
    Fn_findAreaHandle("ed_a_01"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("id_a_01") ~= nil then
    Fn_findAreaHandle("id_a_01"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("dt_a_01") ~= nil then
    Fn_findAreaHandle("dt_a_01"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("cc_a_root") ~= nil then
    Fn_findAreaHandle("cc_a_root"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("ed_a_root") ~= nil then
    Fn_findAreaHandle("ed_a_root"):setEffectiveness(A0_86, true)
  end
  if Fn_findAreaHandle("id_a_root") ~= nil then
    Fn_findAreaHandle("id_a_root"):setEffectiveness(A0_86, true)
  end
end
