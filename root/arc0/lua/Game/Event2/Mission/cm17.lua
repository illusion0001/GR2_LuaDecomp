import("math")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm35_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_cm17_extend_num = {
  25,
  25,
  25,
  25,
  25,
  25,
  30,
  30,
  30,
  30
}
_cm17_extend_time = {
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  10,
  5
}
_cm17_extend_find_dist = {
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2,
  2
}
TIMER_MAX = {
  0,
  0,
  30,
  0
}
goal_point_pass = false
ESCAPE_TARGET_NODE = -0.8
ESCAPE_FAILED_DISTANCE_MOVE = 0.8
ESCAPE_FAILED_DISTANCE_IDLE = 0.8
ESCAPE_FAILED_DISTANCE_IDLE_SEC = 1
escape_failed_flag = false
fan_touch_stop_flag = false
FAN_CHASE_MAX = 300
ACTIVE_FAN_CHASE_MAX = 50
ACTIVE_FAN_CHASE_DIST = 20
MOB_REPOP_INTERVAL_SEC = 5
MOB_REPOP_DISTANCE = 20
NPC_REPOP_INTERVAL_SEC = 5
NPC_REPOP_DISTANCE = 20
check_course_out_multi_01 = true
check_course_out_multi_02 = false
FAN_FIND_CAPTION_WAIT_SEC = 3
LINE_NAME_PREFIX = "immobile_lineup_"
DEFAULT_SPEED = 2.5
DEFAULT_MOVE_OFF_DISTANCE = 300
DEFAULT_NPC_DEGREE_H = 80
DEFAULT_NPC_DEGREE_V = 90
DEFAULT_NPC_IN_LENGTH = 20
DEFAULT_NPC_OUT_LENGTH = 200
DEFAULT_NPC_MOVE_WAIT_SEC = 0.5
fan_find_num_now = 0
cm17_timer = 0
cm17_timer_bonus_flag = false
cm17_bonus_phase = 1
_cm17_bonus_num = _cm17_extend_num[1]
_cm17_bonus_find_dist = 0
goal_sensor_marker = {}
puppets_fan = {}
puppets_fan_reset_pos = {}
_immobile_lineup_node = {}
fan_culling_task = nil
npc_repop_task = nil
mob_repop_task = nil
FAN_CHARA_MOVE_TABLE = {
  {
    name = "npc_fan_distance_005",
    type = "random_hex_dt",
    node = "locator2_fan_distance_005",
    motion_use = false,
    stay_type = "alone",
    line_no = nil,
    repop_group = 16
  },
  {
    name = "npc_fan_distance_006",
    type = "random_hex_dt",
    node = "locator2_fan_distance_006",
    motion_use = false,
    stay_type = "alone",
    line_no = nil,
    repop_group = 17
  },
  {
    name = "npc_fan_distance_007",
    type = "random_hex_dt",
    node = "locator2_fan_distance_007",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 12
  },
  {
    name = "npc_fan_distance_008",
    type = "random_hex_dt",
    node = "locator2_fan_distance_008",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 15
  },
  {
    name = "npc_fan_distance_009",
    type = "random_hex_dt",
    node = "locator2_fan_distance_009",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 18
  },
  {
    name = "npc_fan_distance_010",
    type = "random_hex_dt",
    node = "locator2_fan_distance_010",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 16
  },
  {
    name = "npc_fan_distance_011",
    type = "random_hex_dt",
    node = "locator2_fan_distance_011",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 19
  },
  {
    name = "npc_fan_distance_012",
    type = "random_hex_dt",
    node = "locator2_fan_distance_012",
    motion_use = false,
    stay_type = "alone",
    line_no = nil,
    repop_group = 18
  },
  {
    name = "npc_fan_distance_013",
    type = "random_hex_dt",
    node = "locator2_fan_distance_013",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 20
  },
  {
    name = "npc_fan_sight_001",
    type = "random_hex_dt",
    node = "locator2_fan_sight_001",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_sight_002",
    type = "random_hex_dt",
    node = "locator2_fan_sight_002",
    motion_use = false,
    stay_type = "alone",
    line_no = nil,
    repop_group = 17
  },
  {
    name = "npc_fan_sight_003",
    type = "random_hex_dt",
    node = "locator2_fan_sight_003",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 16
  },
  {
    name = "npc_fan_sight_004",
    type = "random_hex_dt",
    node = "locator2_fan_sight_004",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 16
  },
  {
    name = "npc_fan_sight_005",
    type = "random_hex_dt",
    node = "locator2_fan_sight_005",
    motion_use = false,
    stay_type = "alone",
    line_no = nil,
    repop_group = 19
  },
  {
    name = "npc_fan_sight_006",
    type = "random_hex_dt",
    node = "locator2_fan_sight_006",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 15
  },
  {
    name = "npc_fan_sight_007",
    type = "random_hex_dt",
    node = "locator2_fan_sight_007",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 18
  },
  {
    name = "npc_fan_sight_008",
    type = "random_hex_dt",
    node = "locator2_fan_sight_008",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 12
  },
  {
    name = "npc_fan_sight_010",
    type = "random_hex_dt",
    node = "locator2_fan_sight_010",
    motion_use = false,
    stay_type = "alone",
    line_no = nil,
    repop_group = 21
  },
  {
    name = "npc_fan_sight_015",
    type = "random_hex_dt",
    node = "locator2_fan_sight_015",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_002",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_002",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 6
  },
  {
    name = "npc_fan_immobile_004",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_004",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 6
  },
  {
    name = "npc_fan_immobile_005",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_005",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_006",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_006",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_007",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_007",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_008",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_008",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_009",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_009",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_010",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_010",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_011",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_011",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_012",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_012",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_013",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_013",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_014",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_014",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_015",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_015",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_016",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_016",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_017",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_017",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_018",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_018",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_019",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_019",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_020",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_020",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_021",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_021",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_022",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_022",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_023",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_023",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_024",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_024",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_025",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_025",
    motion_use = true,
    stay_type = "lineup",
    line_no = 1,
    repop_group = 1
  },
  {
    name = "npc_fan_immobile_064",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_064",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_065",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_065",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_066",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_066",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_068",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_068",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_069",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_069",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_070",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_070",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_072",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_072",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_073",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_073",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_074",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_074",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_075",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_075",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_076",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_076",
    motion_use = true,
    stay_type = "look",
    line_no = nil,
    repop_group = 2
  },
  {
    name = "npc_fan_immobile_092",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_092",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 7
  },
  {
    name = "npc_fan_immobile_154",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_154",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 7
  },
  {
    name = "npc_fan_immobile_129",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_129",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_130",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_130",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_131",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_131",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_132",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_132",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_133",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_133",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_134",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_134",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_135",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_135",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_136",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_136",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_137",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_137",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_138",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_138",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 3
  },
  {
    name = "npc_fan_immobile_155",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_155",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2,
    repop_group = 4
  },
  {
    name = "npc_fan_immobile_156",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_156",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2,
    repop_group = 4
  },
  {
    name = "npc_fan_immobile_157",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_157",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2,
    repop_group = 4
  },
  {
    name = "npc_fan_immobile_158",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_158",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2,
    repop_group = 4
  },
  {
    name = "npc_fan_immobile_159",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_159",
    motion_use = true,
    stay_type = "lineup",
    line_no = 2,
    repop_group = 4
  },
  {
    name = "npc_fan_immobile_177",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_177",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 8
  },
  {
    name = "npc_fan_immobile_178",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_178",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 8
  },
  {
    name = "npc_fan_immobile_179",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_179",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_180",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_180",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_181",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_181",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_182",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_182",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_183",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_183",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_184",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_184",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_185",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_185",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_186",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_186",
    motion_use = true,
    stay_type = "lineup",
    line_no = 3,
    repop_group = 5
  },
  {
    name = "npc_fan_immobile_205",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_205",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_206",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_206",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_208",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_208",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_209",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_209",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_210",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_210",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_211",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_211",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_212",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_212",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 11
  },
  {
    name = "npc_fan_immobile_213",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_213",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 11
  },
  {
    name = "npc_fan_immobile_215",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_215",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 10
  },
  {
    name = "npc_fan_immobile_219",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_219",
    motion_use = true,
    stay_type = "talk",
    line_no = nil,
    repop_group = 9
  },
  {
    name = "npc_fan_immobile_220",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_220",
    motion_use = true,
    stay_type = "talk",
    line_no = nil,
    repop_group = 9
  },
  {
    name = "npc_fan_immobile_223",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_223",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 8
  },
  {
    name = "npc_fan_immobile_224",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_224",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 8
  },
  {
    name = "npc_fan_immobile_225",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_225",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 8
  },
  {
    name = "npc_fan_immobile_234",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_234",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 13
  },
  {
    name = "npc_fan_immobile_235",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_235",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 13
  },
  {
    name = "npc_fan_immobile_241",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_241",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 14
  },
  {
    name = "npc_fan_immobile_242",
    type = "random_hex_dt",
    node = "locator2_fan_immobile_242",
    motion_use = true,
    stay_type = "alone",
    line_no = nil,
    repop_group = 14
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
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {}
  L1_1 = {}
  L5_5 = 59
  L6_6 = 99
  L1_1.max = L2_2
  L1_1.start = L2_2
  L0_0.timer = L1_1
  L1_1 = {}
  L1_1.text = "ic_cm_00013"
  L1_1.start = 0
  L0_0.score = L1_1
  L1_1 = Fn_challengeInitialize
  L1_1(L2_2)
  L1_1 = Fn_disableCostumeChange
  L1_1(L2_2)
  L1_1 = set_bg_visible
  L1_1(L2_2)
  L1_1 = Sub_npcRandomTypeConv
  L1_1(L2_2)
  L1_1 = Sub_npcRandomTypeConv
  L1_1(L2_2)
  L1_1 = Fn_setupNpc
  L1_1(L2_2)
  L1_1 = Fn_setupNpc
  L1_1(L2_2)
  L1_1 = {}
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
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3)
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2()
  L5_5 = true
  L2_2(L3_3, L4_4, L5_5)
  L5_5 = true
  L2_2(L3_3, L4_4, L5_5)
  L2_2(L3_3, L4_4)
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19
  for L3_10 = 1, 7 do
    L12_19 = L6_13(L7_14, L8_15)
    L9_16 = L7_14.max
    L9_16 = L9_16.y
    L10_17 = L7_14.min
    L10_17 = L10_17.y
    L9_16 = L9_16 - L10_17
    L9_16 = L9_16 * 0.5
    L5_12.y = L8_15
    L9_16 = RAC_createGameObject2
    L10_17 = "sensor_maker"
    L11_18 = "MapMarker"
    L12_19 = L5_12
    L9_16 = L9_16(L10_17, L11_18, L12_19, L6_13)
    L8_15[L3_10] = L9_16
    L9_16 = L8_15
    L10_17 = "gui_marker_30"
    L8_15(L9_16, L10_17)
    L9_16 = L8_15
    L10_17 = "C"
    L11_18 = L7_14.max
    L12_19 = L7_14.min
    L11_18 = L11_18 - L12_19
    L8_15(L9_16, L10_17, L11_18)
    L9_16 = L8_15
    L10_17 = true
    L8_15(L9_16, L10_17)
    L8_15()
  end
  L1_8(L2_9, L3_10)
  L2_9(L3_10, L4_11)
  L2_9()
  for L5_12, L6_13 in L2_9(L3_10) do
    if L7_14 == "accordion" then
      L9_16 = L7_14
      L10_17 = {L11_18}
      L11_18 = {}
      L12_19 = Fn_findNpcPuppet
      L12_19 = L12_19(L6_13.name .. "_accordion")
      L11_18.pilot = L12_19
      L11_18.attach = "bn_spine1"
      L8_15(L9_16, L10_17)
    end
  end
  for L5_12, L6_13 in L2_9(L3_10) do
    if L7_14 == "accordion" then
      L9_16 = L7_14
      L10_17 = {L11_18}
      L11_18 = {}
      L12_19 = Fn_findNpcPuppet
      L12_19 = L12_19(L6_13.name .. "_accordion")
      L11_18.pilot = L12_19
      L11_18.attach = "bn_spine1"
      L8_15(L9_16, L10_17)
    end
    L7_14(L8_15)
  end
  for L5_12 = 1, #L3_10 do
    L9_16 = FAN_CHARA_MOVE_TABLE
    L9_16 = L9_16[L5_12]
    L9_16 = L9_16.type
    L9_16 = Sub_npc_stay_motion_task
    L10_17 = L6_13
    L11_18 = Sub_MobType_discrimination
    L12_19 = L7_14
    L11_18 = L11_18(L12_19)
    L12_19 = FAN_CHARA_MOVE_TABLE
    L12_19 = L12_19[L5_12]
    L12_19 = L12_19.stay_type
    L9_16 = L9_16(L10_17, L11_18, L12_19)
    L8_15[L6_13] = L9_16
  end
  for L5_12 = 1, #L3_10 do
    L9_16 = FAN_CHARA_IMMOBILE_TABLE
    L9_16 = L9_16[L5_12]
    L9_16 = L9_16.type
    L9_16 = Sub_npc_stay_motion_task
    L10_17 = L6_13
    L11_18 = Sub_MobType_discrimination
    L12_19 = L7_14
    L11_18 = L11_18(L12_19)
    L12_19 = FAN_CHARA_IMMOBILE_TABLE
    L12_19 = L12_19[L5_12]
    L12_19 = L12_19.stay_type
    L9_16 = L9_16(L10_17, L11_18, L12_19)
    L8_15[L6_13] = L9_16
  end
  L2_9.timer = true
  L2_9.score = true
  L3_10(L4_11, L5_12, L6_13)
  check_course_out = false
  L3_10(L4_11)
  mob_to_npc_main_task = L3_10
  fan_culling_task = L3_10
  npc_repop_task = L3_10
  mob_repop_task = L3_10
  for L8_15 = 1, #L6_13 do
    L9_16 = FAN_CHARA_MOVE_TABLE
    L9_16 = L9_16[L8_15]
    L9_16 = L9_16.line_no
    if L9_16 ~= nil then
      L10_17 = LINE_NAME_PREFIX
      L11_18 = string
      L11_18 = L11_18.format
      L12_19 = "%02d"
      L11_18 = L11_18(L12_19, L9_16)
      L10_17 = L10_17 .. L11_18
      L11_18 = _immobile_lineup_node
      L11_18 = L11_18[L9_16]
      if L11_18 == nil then
        L11_18 = _immobile_lineup_node
        L12_19 = RAC_initializeLineup
        L12_19 = L12_19(L10_17, "locator2_lineup_" .. string.format("%02d", L9_16) .. "_", 1)
        L11_18[L9_16] = L12_19
        L11_18 = start_game_obj
        L11_18()
      end
      L11_18 = L4_11[L9_16]
      if L11_18 == nil then
        L4_11[L9_16] = 1
      end
      L11_18 = _immobile_lineup_node
      L11_18 = L11_18[L9_16]
      L12_19 = L4_11[L9_16]
      L11_18 = L11_18[L12_19]
      if L11_18 ~= nil then
        L11_18 = FAN_CHARA_MOVE_TABLE
        L11_18 = L11_18[L8_15]
        L11_18 = L11_18.name
        L12_19 = Sub_GetNpcTypeName
        L12_19 = L12_19(L11_18, FAN_CHARA_MOVE_TABLE[L8_15].type)
        _lineup_customers[L11_18] = Fn_findNpcPuppet(L11_18)
        _immobile_lineup_task[L11_18] = Sub_addLineup(L10_17, L11_18, _immobile_lineup_node[L9_16], Sub_MobType_discrimination(L12_19), FAN_CHARA_MOVE_TABLE[L8_15].stay_type)
        Fn_warpNpc(L11_18, _immobile_lineup_node[L9_16][L4_11[L9_16]])
      else
        L11_18 = print
        L12_19 = string
        L12_19 = L12_19.format
        L12_19 = L12_19("ERROR: locator2_lineup_%02d_XX \227\129\174\227\131\173\227\130\177\227\131\188\227\130\191\227\129\174\229\144\136\232\168\136\232\183\157\233\155\162\227\129\140\231\159\173\227\129\132\227\129\174\227\129\167\232\161\140\229\136\151\227\129\174NPC\233\133\141\231\189\174\231\148\168\227\131\173\227\130\177\227\131\188\227\130\191\227\129\140\231\148\159\230\136\144\227\129\167\227\129\141\227\129\166\227\129\170\227\129\132\239\188\129\239\188\129\239\188\129", L9_16)
        L11_18(L12_19, L12_19("ERROR: locator2_lineup_%02d_XX \227\129\174\227\131\173\227\130\177\227\131\188\227\130\191\227\129\174\229\144\136\232\168\136\232\183\157\233\155\162\227\129\140\231\159\173\227\129\132\227\129\174\227\129\167\232\161\140\229\136\151\227\129\174NPC\233\133\141\231\189\174\231\148\168\227\131\173\227\130\177\227\131\188\227\130\191\227\129\140\231\148\159\230\136\144\227\129\167\227\129\141\227\129\166\227\129\170\227\129\132\239\188\129\239\188\129\239\188\129", L9_16))
      end
      L11_18 = L4_11[L9_16]
      L11_18 = L11_18 + 1
      L4_11[L9_16] = L11_18
    end
  end
  _cm17_bonus_find_dist = L5_12
  L5_12()
  for L8_15 = 1, #L6_13 do
    L9_16 = FAN_CHARA_MOVE_TABLE
    L9_16 = L9_16[L8_15]
    L9_16 = L9_16.name
    L10_17 = Sub_GetNpcTypeName
    L11_18 = FAN_CHARA_MOVE_TABLE
    L11_18 = L11_18[L8_15]
    L11_18 = L11_18.name
    L12_19 = FAN_CHARA_MOVE_TABLE
    L12_19 = L12_19[L8_15]
    L12_19 = L12_19.type
    L10_17 = L10_17(L11_18, L12_19)
    L11_18 = FAN_CHARA_MOVE_TABLE
    L11_18 = L11_18[L8_15]
    L11_18 = L11_18.line_no
    L12_19 = npc_model_name
    L12_19[L9_16] = L10_17
    L12_19 = npc_motion_use
    L12_19[L9_16] = FAN_CHARA_MOVE_TABLE[L8_15].motion_use
    L12_19 = npc_fan_task
    L12_19[L9_16] = invokeFanNpcTask(L9_16, Sub_MobType_discrimination(npc_model_name[L9_16]), L10_17, L11_18)
  end
  for L8_15 = 1, #L6_13 do
    L9_16 = FAN_CHARA_IMMOBILE_TABLE
    L9_16 = L9_16[L8_15]
    L9_16 = L9_16.name
    L10_17 = Sub_GetNpcTypeName
    L11_18 = L9_16
    L12_19 = FAN_CHARA_IMMOBILE_TABLE
    L12_19 = L12_19[L8_15]
    L12_19 = L12_19.type
    L10_17 = L10_17(L11_18, L12_19)
    L11_18 = npc_fan_immobile_task
    L12_19 = Sub_ImmobileFanTask
    L12_19 = L12_19(L9_16, FAN_CHARA_IMMOBILE_TABLE[L8_15].motion_use, Sub_MobType_discrimination(L10_17))
    L11_18[L9_16] = L12_19
  end
  while true do
    if not L6_13 then
      if L6_13 == true then
        L6_13(L7_14)
        escape_failed_flag = true
      end
      cm17_timer = L6_13
      if L6_13 <= 0 then
        L6_13(L7_14)
        escape_failed_flag = true
      end
      if L6_13 > 0 then
        if L6_13 >= L7_14 then
          cm17_timer = L6_13
          cm17_timer = L6_13
          L6_13(L7_14, L8_15)
          L9_16 = 1
          L6_13(L7_14, L8_15, L9_16)
          _cm17_bonus_find_dist = L6_13
          L9_16, L10_17 = nil, nil
          L11_18 = _cm17_bonus_find_dist
          L12_19 = nil
          L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, nil)
          L9_16 = " + "
          L10_17 = _cm17_extend_time
          L11_18 = cm17_bonus_phase
          L10_17 = L10_17[L11_18]
          L11_18 = " "
          L12_19 = _cm17_bonus_num
          L6_13(L7_14)
          L6_13(L7_14)
          if L6_13 ~= nil then
            cm17_bonus_phase = L6_13
          end
          _cm17_bonus_num = L6_13
        end
      end
      if L6_13 == true then
        L6_13(L7_14)
        L6_13(L7_14)
        L9_16 = 0
        L10_17 = 0
        L11_18 = 0
        L12_19 = 0
        L6_13(L7_14, L8_15)
        L6_13(L7_14, L8_15)
        L6_13()
        if L6_13 ~= nil then
          L6_13(L7_14)
          fan_culling_task = nil
        end
        if L6_13 ~= nil then
          L6_13(L7_14)
          npc_repop_task = nil
        end
        if L6_13 ~= nil then
          L6_13(L7_14)
          mob_repop_task = nil
        end
        fan_touch_stop_flag = true
        L6_13()
        break
      end
    end
    L6_13()
  end
  L6_13()
  if L5_12 ~= nil then
    L6_13(L7_14)
  end
  if not L6_13 then
    L6_13(L7_14)
    if L6_13 ~= nil then
      L6_13(L7_14)
      mob_to_npc_main_task = nil
    end
    L6_13(L7_14)
    L6_13()
    for L9_16 = 1, #L7_14 do
      L10_17 = Sub_NpcTaskStop
      L11_18 = FAN_CHARA_MOVE_TABLE
      L11_18 = L11_18[L9_16]
      L11_18 = L11_18.name
      L10_17(L11_18)
    end
    if L6_13 ~= nil then
      L6_13(L7_14)
      fan_culling_task = nil
    end
    if L6_13 ~= nil then
      L6_13(L7_14)
      npc_repop_task = nil
    end
    if L6_13 ~= nil then
      L6_13(L7_14)
      mob_repop_task = nil
    end
    L6_13()
    for L9_16, L10_17 in L6_13(L7_14) do
      L11_18 = Fn_findNpc
      L12_19 = L10_17
      L11_18 = L11_18(L12_19)
      if L11_18 ~= nil then
        L11_18 = Sub_NpcTaskStop
        L12_19 = L10_17
        L11_18(L12_19)
      end
    end
  end
  L6_13()
end
function Finalize()
  set_bg_visible(true)
  if fan_culling_task ~= nil then
    fan_culling_task:abort()
    fan_culling_task = nil
  end
  if npc_repop_task ~= nil then
    npc_repop_task:abort()
    npc_repop_task = nil
  end
  if mob_repop_task ~= nil then
    mob_repop_task:abort()
    mob_repop_task = nil
  end
  Sub_MissionSuccessNpcDelete()
  Fn_challengeFinalize()
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
  Mob:restrict_cm17_00(false)
  Fn_disableCostumeChange(false)
end
function pccubesensor2_goal_OnEnter()
  local L0_20, L1_21
  goal_point_pass = true
end
function pccubesensor2_goal_OnLeave()
  local L0_22, L1_23
  goal_point_pass = false
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
      if escape_failed_flag == false then
        if score ~= score then
          HUD:counter999SetNum(score)
        end
      end
      wait()
    end
  end)
end
function createMarker(A0_24, A1_25, A2_26, A3_27)
  local L4_28
  L4_28 = A2_26.getWorldPos
  L4_28 = L4_28(A2_26)
  createGameObject2("MapMarker"):setName(A0_24)
  createGameObject2("MapMarker"):setAssetName(A1_25)
  createGameObject2("MapMarker"):setupPattern("C", A3_27)
  createGameObject2("MapMarker"):setPos(L4_28)
  start_game_obj()
  return (createGameObject2("MapMarker"))
end
function invokeNpcRepopTask(A0_29, A1_30)
  local L2_31, L3_32
  L2_31 = {}
  L3_32 = 1
  while findGameObject2("Node", "locator2_npc_repop_dist_check_" .. string.format("%02d", L3_32)) ~= nil do
    L2_31[L3_32] = findGameObject2("Node", "locator2_npc_repop_dist_check_" .. string.format("%02d", L3_32))
    do break end
    do break end
    L3_32 = L3_32 + 1
  end
  return invokeTask(function()
    local L0_33, L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41
    while true do
      L0_33 = waitSeconds
      L1_34 = A0_29
      L0_33(L1_34)
      L0_33 = {}
      L1_34 = {}
      for L5_38, L6_39 in L2_35(L3_36) do
        L7_40 = Fn_getDistanceToPlayer
        L8_41 = L6_39
        L7_40 = L7_40(L8_41)
        L0_33[L5_38] = L7_40
        L7_40 = Fn_isInSightTarget
        L8_41 = L6_39
        L7_40 = L7_40(L8_41, 1)
        L1_34[L5_38] = L7_40
      end
      for L5_38, L6_39 in L2_35(L3_36) do
        L7_40 = L6_39.repop_group
        if L7_40 ~= nil then
          L7_40 = npc_fan_task
          L8_41 = L6_39.name
          L7_40 = L7_40[L8_41]
          if L7_40 ~= nil then
            L7_40 = npc_fan_task
            L8_41 = L6_39.name
            L7_40 = L7_40[L8_41]
            L8_41 = L7_40
            L7_40 = L7_40.isRunning
            L7_40 = L7_40(L8_41)
          elseif not L7_40 then
            L7_40 = A1_30
            L8_41 = L6_39.repop_group
            L8_41 = L0_33[L8_41]
            if L7_40 < L8_41 then
              L7_40 = L6_39.repop_group
              L7_40 = L1_34[L7_40]
              if L7_40 == false then
                L7_40 = Fn_setNpcActive
                L8_41 = L6_39.name
                L7_40(L8_41, true)
                L7_40 = Fn_warpNpc
                L8_41 = L6_39.name
                L7_40(L8_41, L6_39.node)
                L7_40 = Sub_GetNpcTypeName
                L8_41 = L6_39.name
                L7_40 = L7_40(L8_41, L6_39.type)
                L8_41 = npc_fan_task
                L8_41[L6_39.name] = invokeFanNpcTask(L6_39.name, Sub_MobType_discrimination(npc_model_name[L6_39.name]), L7_40, L6_39.line_no)
                L8_41 = L6_39.line_no
                if L8_41 ~= nil then
                  L8_41 = _lineup_customers
                  L8_41[L6_39.name] = Fn_findNpcPuppet(L6_39.name)
                  L8_41 = _immobile_lineup_task
                  L8_41 = L8_41[L6_39.name]
                  if L8_41 ~= nil then
                    L8_41 = _immobile_lineup_task
                    L8_41 = L8_41[L6_39.name]
                    L8_41 = L8_41.isRunning
                    L8_41 = L8_41(L8_41)
                  elseif not L8_41 then
                    L8_41 = LINE_NAME_PREFIX
                    L8_41 = L8_41 .. string.format("%02d", L6_39.line_no)
                    _immobile_lineup_task[L6_39.name] = Sub_addLineup(L8_41, L6_39.name, _immobile_lineup_node[L6_39.line_no], Sub_MobType_discrimination(L7_40), L6_39.stay_type)
                  end
                end
              end
            end
          end
        end
      end
    end
  end)
end
function set_bg_visible(A0_42)
  local L1_43, L2_44, L3_45, L4_46
  L1_43 = Fn_findAreaHandle
  L2_44 = "ji_a_root"
  L1_43 = L1_43(L2_44)
  L2_44 = L1_43.getDescendant
  L2_44 = L2_44(L3_45)
  for _FORV_6_, _FORV_7_ in L3_45(L4_46) do
    _FORV_7_:setEffectiveness(A0_42, true)
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_46) do
    _FORV_9_:setEffectiveness(A0_42, true)
  end
  if Fn_findAreaHandle("ve_crane_root") ~= nil then
    Fn_findAreaHandle("ve_crane_root"):setEffectiveness(A0_42, true)
  end
  if Fn_findAreaHandle("g1_crane_pd_01") ~= nil then
    Fn_findAreaHandle("g1_crane_pd_01"):setEffectiveness(A0_42, true)
  end
  Fn_findAreaHandle("cc_a_01"):setEffectiveness(A0_42, true)
  Fn_findAreaHandle("ed_a_01"):setEffectiveness(A0_42, true)
  Fn_findAreaHandle("id_a_01"):setEffectiveness(A0_42, true)
  Fn_findAreaHandle("dt_a_01"):setEffectiveness(A0_42, true)
  Fn_findAreaHandle("cc_a_root"):setEffectiveness(A0_42, true)
  Fn_findAreaHandle("ed_a_root"):setEffectiveness(A0_42, true)
  Fn_findAreaHandle("id_a_root"):setEffectiveness(A0_42, true)
end
