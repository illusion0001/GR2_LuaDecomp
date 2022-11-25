import("math")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/sm35_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
FAN_CHASE_MAX = 50
ESCAPE_TARGET_NODE = -1
ESCAPE_FAILED_DISTANCE_MOVE = 1
ESCAPE_FAILED_DISTANCE_IDLE = 2
ESCAPE_FAILED_DISTANCE_IDLE_SEC = 2
CHECK_POINT_RESTART_INTERVAL = 5
FAN_FIND_CAPTION_WAIT_SEC = 3
pc_restart_pos = "locator2_pc_restart_pos_00"
SM35_PLAYER_MOTION = {
  greeting = "kit01_greeting_00"
}
DEFAULT_SPEED = 2
DEFAULT_MOVE_OFF_DISTANCE = 20
DEFAULT_NPC_DEGREE_H = 45
DEFAULT_NPC_DEGREE_V = 45
DEFAULT_NPC_IN_LENGTH = 10
DEFAULT_NPC_OUT_LENGTH = 20
DEFAULT_NPC_MOVE_WAIT_SEC = 1
FAN_CHARA_MOVE_TABLE = {
  {
    name = "npc_fan_move_001",
    type = "adult_hex_ed",
    node = "locator2_fan_move_001",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_002",
    type = "adult_hex_ed",
    node = "locator2_fan_move_002",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_003",
    type = "adult_hex_ed",
    node = "locator2_fan_move_003",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_004",
    type = "adult_hex_ed",
    node = "locator2_fan_move_004",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_005",
    type = "adult_hex_ed",
    node = "locator2_fan_move_005",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_006",
    type = "adult_hex_ed",
    node = "locator2_fan_move_006",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_007",
    type = "adult_hex_ed",
    node = "locator2_fan_move_007",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_008",
    type = "adult_hex_ed",
    node = "locator2_fan_move_008",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_009",
    type = "adult_hex_ed",
    node = "locator2_fan_move_009",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_010",
    type = "adult_hex_ed",
    node = "locator2_fan_move_010",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_011",
    type = "adult_hex_ed",
    node = "locator2_fan_move_011",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_012",
    type = "adult_hex_ed",
    node = "locator2_fan_move_012",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_013",
    type = "adult_hex_ed",
    node = "locator2_fan_move_013",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_014",
    type = "adult_hex_ed",
    node = "locator2_fan_move_014",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_015",
    type = "adult_hex_ed",
    node = "locator2_fan_move_015",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_018",
    type = "adult_hex_ed",
    node = "locator2_fan_move_018",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_019",
    type = "adult_hex_ed",
    node = "locator2_fan_move_019",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_020",
    type = "adult_hex_ed",
    node = "locator2_fan_move_020",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_021",
    type = "adult_hex_ed",
    node = "locator2_fan_move_021",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_022",
    type = "adult_hex_ed",
    node = "locator2_fan_move_022",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_023",
    type = "adult_hex_ed",
    node = "locator2_fan_move_023",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_024",
    type = "adult_hex_ed",
    node = "locator2_fan_move_024",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_025",
    type = "adult_hex_ed",
    node = "locator2_fan_move_025",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_026",
    type = "adult_hex_ed",
    node = "locator2_fan_move_026",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_027",
    type = "adult_hex_ed",
    node = "locator2_fan_move_027",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_028",
    type = "adult_hex_ed",
    node = "locator2_fan_move_028",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_029",
    type = "adult_hex_ed",
    node = "locator2_fan_move_029",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_030",
    type = "adult_hex_ed",
    node = "locator2_fan_move_030",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_031",
    type = "adult_hex_ed",
    node = "locator2_fan_move_031",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_032",
    type = "adult_hex_ed",
    node = "locator2_fan_move_032",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_033",
    type = "adult_hex_ed",
    node = "locator2_fan_move_033",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_034",
    type = "adult_hex_ed",
    node = "locator2_fan_move_034",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_035",
    type = "adult_hex_ed",
    node = "locator2_fan_move_035",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_036",
    type = "adult_hex_ed",
    node = "locator2_fan_move_036",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_037",
    type = "adult_hex_ed",
    node = "locator2_fan_move_037",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_038",
    type = "adult_hex_ed",
    node = "locator2_fan_move_038",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_039",
    type = "adult_hex_ed",
    node = "locator2_fan_move_039",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_040",
    type = "adult_hex_ed",
    node = "locator2_fan_move_040",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_041",
    type = "adult_hex_ed",
    node = "locator2_fan_move_041",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_042",
    type = "adult_hex_ed",
    node = "locator2_fan_move_042",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_043",
    type = "adult_hex_ed",
    node = "locator2_fan_move_043",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_044",
    type = "adult_hex_ed",
    node = "locator2_fan_move_044",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_045",
    type = "adult_hex_ed",
    node = "locator2_fan_move_045",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_046",
    type = "adult_hex_ed",
    node = "locator2_fan_move_046",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_047",
    type = "adult_hex_ed",
    node = "locator2_fan_move_047",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_048",
    type = "adult_hex_ed",
    node = "locator2_fan_move_048",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_049",
    type = "adult_hex_ed",
    node = "locator2_fan_move_049",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_050",
    type = "adult_hex_ed",
    node = "locator2_fan_move_050",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_051",
    type = "adult_hex_ed",
    node = "locator2_fan_move_051",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_052",
    type = "adult_hex_ed",
    node = "locator2_fan_move_052",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_053",
    type = "adult_hex_ed",
    node = "locator2_fan_move_053",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_054",
    type = "adult_hex_ed",
    node = "locator2_fan_move_054",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_055",
    type = "adult_hex_ed",
    node = "locator2_fan_move_055",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_056",
    type = "adult_hex_ed",
    node = "locator2_fan_move_056",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_057",
    type = "adult_hex_ed",
    node = "locator2_fan_move_057",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_058",
    type = "adult_hex_ed",
    node = "locator2_fan_move_058",
    motion_use = true,
    stay_type = "alone"
  }
}
FAN_CHARA_IMMOBILE_TABLE = {
  {
    name = "npc_fan_immobile_001",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_001",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_002",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_002",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_003",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_003",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_004",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_004",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_005",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_005",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_006",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_006",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_007",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_007",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_008",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_008",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_009",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_009",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_010",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_010",
    motion_use = true,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_011",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_011",
    motion_use = true,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_012",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_012",
    motion_use = false,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_013",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_013",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_014",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_014",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_015",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_015",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_016",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_016",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_017",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_017",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_018",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_018",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_019",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_019",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_020",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_020",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_021",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_021",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_022",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_022",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_023",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_023",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_024",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_024",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_025",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_025",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_026",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_026",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_027",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_027",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_028",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_028",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_029",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_029",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_030",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_030",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_031",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_031",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_032",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_032",
    motion_use = false,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_033",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_033",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_034",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_034",
    motion_use = false,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_035",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_035",
    motion_use = false,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_036",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_036",
    motion_use = false,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_037",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_037",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_038",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_038",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_039",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_039",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_040",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_040",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_041",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_041",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_042",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_042",
    motion_use = false,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_043",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_043",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_044",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_044",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_045",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_045",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_046",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_046",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_047",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_047",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_048",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_048",
    motion_use = true,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_049",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_049",
    motion_use = true,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_050",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_050",
    motion_use = true,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_051",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_051",
    motion_use = true,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_052",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_052",
    motion_use = false,
    stay_type = "lineup"
  },
  {
    name = "npc_fan_immobile_053",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_053",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_054",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_054",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_055",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_055",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_056",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_056",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_057",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_057",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_058",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_058",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_059",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_059",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_060",
    type = "adult_hex_ed",
    node = "locator2_fan_immobile_060",
    motion_use = false,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_061",
    type = "man_hex_ed",
    node = "locator2_fan_immobile_061",
    motion_use = false,
    stay_type = "accordion"
  },
  {
    name = "npc_fan_immobile_062",
    type = "man25",
    node = "locator2_fan_immobile_062",
    motion_use = false,
    stay_type = "salesman"
  },
  {
    name = "npc_fan_immobile_063",
    type = "man26",
    node = "locator2_fan_immobile_063",
    motion_use = false,
    stay_type = "salesman"
  }
}
CHECK_POINT_MANAGER_COM = {
  {num = 1, cap = "sm35_00100"},
  {num = 3, cap = "sm35_00101"},
  {num = 6, cap = "sm35_00102"},
  {num = 9, cap = "sm35_00103"},
  {num = 11, cap = "sm35_00104"},
  {num = 13, cap = "sm35_00105"}
}
CHECK_POINT_MAX = 18
NPC_FAN_EPILOGUE_MAX = 10
check_point_pass = 1
check_point_restart_pass = 1
check_point_restart_check_now = 1
check_point_manager_cap_num = 1
check_point_manager_cap_restart_num = 1
fan_find_num_now = -1
goal_point_pass = false
getaway_complete = false
check_point_sensor = false
puppets = {}
sdemo = nil
camlook = nil
sm35_costume_pdemo = nil
manager_com_task = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = set_bg_visible
  L1_1 = false
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    {
      name = "npc_fan_eplogue_005",
      type = "wom_hex_dt",
      node = "locator2_fan_eplogue_005"
    },
    {
      name = "npc_fan_eplogue_006",
      type = "wom_hex_dt",
      node = "locator2_fan_eplogue_001"
    },
    {
      name = "npc_fan_eplogue_007",
      type = "wom_hex_dt",
      node = "locator2_fan_eplogue_002"
    },
    {
      name = "npc_fan_eplogue_008",
      type = "man_hex_dt",
      node = "locator2_fan_eplogue_003"
    },
    {
      name = "npc_fan_eplogue_009",
      type = "man_hex_dt",
      node = "locator2_fan_eplogue_004"
    },
    {
      name = "npc_fan_eplogue_010",
      type = "man_hex_dt",
      node = "locator2_fan_eplogue_005"
    }
  }
  L1_1 = {}
  L1_1.name = "npc_fan_immobile_084"
  L1_1.type = "man01"
  L1_1.node = "locator2_fan_dummy_001"
  L2_2.name = "npc_fan_immobile_085"
  L2_2.type = "ve03"
  L2_2.node = "locator2_fan_dummy_001"
  L3_3.name = "npc_fan_eplogue_001"
  L3_3.type = "man_hex_dt"
  L3_3.node = "locator2_fan_eplogue_001"
  L4_4.name = "npc_fan_eplogue_002"
  L4_4.type = "man_hex_dt"
  L4_4.node = "locator2_fan_eplogue_002"
  L5_5.name = "npc_fan_eplogue_003"
  L5_5.type = "man_hex_dt"
  L5_5.node = "locator2_fan_eplogue_003"
  L6_6 = {}
  L6_6.name = "npc_fan_eplogue_004"
  L6_6.type = "wom_hex_dt"
  L6_6.node = "locator2_fan_eplogue_004"
  L1_1 = Sub_npcRandomTypeConv
  L1_1(L2_2)
  L1_1 = Sub_npcRandomTypeConv
  L1_1(L2_2)
  L1_1 = Fn_setupNpc
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
  for L5_5, L6_6 in L2_2(L3_3) do
    puppets[L6_6.name] = Fn_findNpcPuppet(L6_6.name)
  end
  for L5_5 = 1, #L3_3 do
    L6_6 = Sub_GetNpcTypeName
    L6_6 = L6_6(FAN_CHARA_MOVE_TABLE[L5_5].name, FAN_CHARA_MOVE_TABLE[L5_5].type)
    Sub_fan_MotionLoad(FAN_CHARA_MOVE_TABLE[L5_5].name, L6_6, FAN_CHARA_MOVE_TABLE[L5_5].stay_type)
  end
  for L5_5 = 1, #L3_3 do
    L6_6 = Sub_GetNpcTypeName
    L6_6 = L6_6(FAN_CHARA_IMMOBILE_TABLE[L5_5].name, FAN_CHARA_IMMOBILE_TABLE[L5_5].type)
    Sub_fan_MotionLoad(FAN_CHARA_IMMOBILE_TABLE[L5_5].name, L6_6, FAN_CHARA_IMMOBILE_TABLE[L5_5].stay_type)
  end
  for L6_6 = 1, CHECK_POINT_MAX do
    Fn_pcSensorOff("pccubesensor2_check_point_" .. string.format("%02d", L6_6))
  end
  L3_3(L4_4)
  L3_3(L4_4)
  for L6_6 = 1, NPC_FAN_EPILOGUE_MAX do
    Fn_setNpcActive("npc_fan_eplogue_" .. string.format("%03d", L6_6), false)
  end
  L6_6 = "Node"
  L6_6 = {}
  L6_6.camera = true
  L6_6.scene_param = false
  sm35_costume_pdemo = L3_3
  sdemo = L3_3
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23
  L0_7 = {}
  L0_7.guide = "man74_guide_r_00"
  L0_7.idle = "man74_idle_00"
  L1_8(L2_9, L3_10)
  L1_8(L2_9, L3_10, L4_11)
  for L4_11, L5_12 in L1_8(L2_9) do
    if L6_13 == "accordion" then
      L10_17 = {}
      L11_18 = Fn_findNpcPuppet
      L11_18 = L11_18(L12_19)
      L10_17.pilot = L11_18
      L10_17.attach = "bn_spine1"
      L7_14(L8_15, L9_16)
    end
  end
  for L4_11, L5_12 in L1_8(L2_9) do
    if L6_13 == "accordion" then
      L10_17 = {}
      L11_18 = Fn_findNpcPuppet
      L11_18 = L11_18(L12_19)
      L10_17.pilot = L11_18
      L10_17.attach = "bn_spine1"
      L7_14(L8_15, L9_16)
    end
    L6_13(L7_14)
  end
  for L4_11 = 1, #L2_9 do
    L10_17 = Sub_MobType_discrimination
    L11_18 = L6_13
    L10_17 = L10_17(L11_18)
    L11_18 = FAN_CHARA_MOVE_TABLE
    L11_18 = L11_18[L4_11]
    L11_18 = L11_18.stay_type
    L7_14[L5_12] = L8_15
  end
  for L4_11 = 1, #L2_9 do
    L10_17 = Sub_MobType_discrimination
    L11_18 = L6_13
    L10_17 = L10_17(L11_18)
    L11_18 = FAN_CHARA_IMMOBILE_TABLE
    L11_18 = L11_18[L4_11]
    L11_18 = L11_18.stay_type
    L7_14[L5_12] = L8_15
  end
  L2_9(L3_10, L4_11)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12, L6_13)
  while true do
    if L3_10 == false then
      L3_10()
    end
  end
  L3_10()
  L3_10()
  L3_10()
  L3_10(L4_11)
  L3_10()
  if L3_10 == true then
    L4_11(L5_12)
  end
  L4_11(L5_12, L6_13)
  L4_11(L5_12)
  L4_11(L5_12)
  L4_11(L5_12, L6_13)
  L4_11(L5_12)
  L4_11()
  while true do
    if L4_11 == false then
      L4_11()
    end
  end
  L4_11()
  L4_11(L5_12, L6_13)
  L4_11(L5_12)
  L3_10()
  L3_10(L4_11, L5_12)
  L3_10()
  L3_10(L4_11)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12, L6_13)
  L5_12(L6_13)
  L10_17 = Vector
  L11_18 = 0
  L16_23 = L10_17(L11_18, L12_19, L13_20)
  L5_12(L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L10_17(L11_18, L12_19, L13_20))
  L5_12(L6_13)
  L5_12()
  L6_13(L7_14)
  L9_16.pos = "locator2_overlook_cam_01"
  L9_16.time = 4
  L9_16.hashfunc = "EaseInOut"
  L10_17 = {}
  L10_17.pos = "locator2_overlook_aim_point_03"
  L10_17.time = 4
  L10_17.hashfunc = "EaseInOut"
  L6_13(L7_14, L8_15, L9_16)
  while true do
    if L6_13 then
      L6_13()
    end
  end
  L6_13(L7_14, L8_15)
  L6_13(L7_14)
  L4_11()
  L4_11(L5_12)
  L4_11(L5_12, L6_13)
  L4_11(L5_12, L6_13)
  L4_11(L5_12, L6_13)
  L4_11(L5_12, L6_13)
  L4_11()
  L4_11()
  L16_23 = L5_12(L6_13, L7_14)
  L4_11(L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L5_12(L6_13, L7_14))
  L4_11(L5_12)
  L4_11()
  for L7_14 = 1, #L5_12 do
    L10_17 = FAN_CHARA_MOVE_TABLE
    L10_17 = L10_17[L7_14]
    L10_17 = L10_17.name
    L11_18 = FAN_CHARA_MOVE_TABLE
    L11_18 = L11_18[L7_14]
    L11_18 = L11_18.type
    L10_17 = FAN_CHARA_MOVE_TABLE
    L10_17 = L10_17[L7_14]
    L10_17 = L10_17.line_no
    L11_18 = npc_model_name
    L11_18[L8_15] = L9_16
    L11_18 = npc_motion_use
    L11_18[L8_15] = L12_19
    L11_18 = npc_fan_task
    L15_22 = npc_model_name
    L15_22 = L15_22[L8_15]
    L15_22 = L9_16
    L16_23 = L10_17
    L11_18[L8_15] = L12_19
  end
  for L7_14 = 1, #L5_12 do
    L10_17 = L8_15
    L11_18 = FAN_CHARA_IMMOBILE_TABLE
    L11_18 = L11_18[L7_14]
    L11_18 = L11_18.type
    L10_17 = npc_fan_immobile_task
    L11_18 = Sub_ImmobileFanTask
    L15_22 = L9_16
    L16_23 = L14_21(L15_22)
    L11_18 = L11_18(L12_19, L13_20, L14_21, L15_22, L16_23, L14_21(L15_22))
    L10_17[L8_15] = L11_18
  end
  mob_to_npc_main_task = L4_11
  while true do
    if not L7_14 then
      if L7_14 == true then
        L10_17 = "\233\128\154\233\129\142"
        L7_14(L8_15)
        L10_17 = "%02d"
        L11_18 = check_point_pass
        L7_14(L8_15)
        L7_14(L8_15)
        if L7_14 >= L8_15 then
          L10_17 = "\227\130\146\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136\229\156\176\231\130\185\227\129\171\232\168\173\229\174\154"
          L7_14(L8_15)
          check_point_restart_pass = L7_14
          L10_17 = check_point_pass
          pc_restart_pos = L7_14
          check_point_restart_check_now = 1
          check_point_manager_cap_restart_num = L7_14
        else
          check_point_restart_check_now = L7_14
        end
        check_point_pass = L7_14
        L7_14(L8_15, L9_16)
        if L7_14 > L8_15 then
          L7_14(L8_15)
          goal_point_pass = true
        else
          L10_17 = "%02d"
          L11_18 = check_point_pass
          L7_14(L8_15)
          L10_17 = "pccubesensor2_check_point_"
          L11_18 = string
          L11_18 = L11_18.format
          L11_18 = L11_18(L12_19, L13_20)
          L10_17 = L10_17 .. L11_18
          L7_14(L8_15, L9_16)
          if L7_14 ~= nil then
            if L7_14 > L8_15 then
              if L7_14 ~= nil then
                if L7_14 then
                  L7_14(L8_15)
                end
                manager_com_task = nil
              end
              manager_com_task = L7_14
            end
          end
          check_point_sensor = false
        end
      end
      if L7_14 == true then
        L7_14()
        L7_14(L8_15)
        if L7_14 == false then
          escape_failed_flag = true
        end
      end
      if L7_14 == L8_15 and L4_11 == false then
        L7_14(L8_15)
        L7_14(L8_15)
        L10_17 = 1
        L11_18 = ""
        L7_14(L8_15, L9_16, L10_17, L11_18, L12_19)
        L7_14(L8_15)
        L10_17 = false
        L7_14(L8_15, L9_16, L10_17)
      end
      if L7_14 == true then
        L7_14(L8_15)
        L7_14(L8_15)
        L7_14()
        L7_14()
        L7_14()
        L7_14(L8_15)
        L7_14()
        fan_chase = 0
        fan_find_num_now = -1
        L7_14(L8_15)
        L10_17 = "%02d"
        L11_18 = check_point_pass
        L7_14(L8_15)
        check_point_pass = L7_14
        check_point_restart_check_now = 1
        check_point_manager_cap_num = L7_14
        L7_14(L8_15, L9_16)
        L10_17 = false
        L7_14(L8_15, L9_16, L10_17)
        L7_14(L8_15)
        L7_14()
        escape_failed_flag = false
        L7_14()
        if L7_14 == 1 then
          L7_14()
        else
          L7_14(L8_15)
          L7_14(L8_15, L9_16)
          L7_14()
          L7_14(L8_15, L9_16)
        end
        check_course_out = false
        L7_14(L8_15)
        L10_17 = "pccubesensor2_check_point_"
        L11_18 = string
        L11_18 = L11_18.format
        L11_18 = L11_18(L12_19, L13_20)
        L10_17 = L10_17 .. L11_18
        L7_14(L8_15, L9_16)
        L10_17 = "%02d"
        L11_18 = check_point_pass
        L7_14(L8_15)
        L7_14()
        L7_14(L8_15, L9_16)
        L7_14()
        mob_to_npc_main_task = L7_14
        goal_point_pass = false
      end
      L7_14()
    end
  end
  L7_14()
  if L7_14 ~= nil then
    L7_14(L8_15)
    mob_to_npc_main_task = nil
  end
  L7_14()
  L7_14(L8_15)
  for L10_17 = 1, #L8_15 do
    L11_18 = Sub_NpcTaskStop
    L11_18(L12_19)
  end
  for L10_17, L11_18 in L7_14(L8_15) do
    if L12_19 ~= nil then
      L12_19(L13_20)
    end
  end
  L7_14(L8_15, L9_16)
  L7_14(L8_15)
  L7_14(L8_15, L9_16)
  L7_14(L8_15)
  L10_17 = "locator2_epilogue_camera_01"
  L10_17 = L9_16
  L11_18 = L8_15
  L15_22 = 0
  L16_23 = 1.5
  L16_23 = L14_21(L15_22, L16_23, 0)
  L9_16(L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L14_21(L15_22, L16_23, 0))
  L10_17 = L9_16
  L11_18 = 0.1
  L12_19.deg = 15
  L9_16(L10_17, L11_18, L12_19, L13_20)
  L10_17 = L9_16
  L9_16(L10_17)
  L10_17 = EVENT_PC_MOTION_TABLE
  L10_17 = L10_17.sm35_mot_02
  L11_18 = -1
  L9_16(L10_17, L11_18, L12_19)
  L10_17 = 0.2
  L9_16(L10_17)
  function L10_17()
    local L0_24, L1_25, L2_26, L3_27
    for L3_27 = 1, 5 do
      Sound:playSE("pc1_085", 1, "", Fn_getPlayer())
      waitSeconds(1)
    end
  end
  L10_17 = invokeTask
  function L11_18()
    Fn_turnNpc("sm35_client", "locator2_epilogue_client_turn_target_01")
    Fn_playMotionNpc("sm35_client", "lookaround_01", false)
  end
  L10_17 = L10_17(L11_18)
  L11_18 = {}
  for L15_22 = 1, NPC_FAN_EPILOGUE_MAX do
    L16_23 = Fn_setNpcActive
    L16_23("npc_fan_eplogue_" .. string.format("%03d", L15_22), true)
    L16_23 = Fn_findNpc
    L16_23 = L16_23("npc_fan_eplogue_" .. string.format("%03d", L15_22))
    L11_18[L15_22] = Fn_moveNpc(L16_23, {
      "locator2_epilogue_fans_goal_01"
    }, {
      anim_run_speed = speed,
      runLength = -1
    })
  end
  L15_22 = {}
  L15_22.deg = 50
  L16_23 = "Linear"
  L12_19(L13_20, L14_21, L15_22, L16_23)
  while true do
    if L12_19 then
      L12_19()
    end
  end
  L12_19(L13_20)
  L10_17 = nil
  L12_19()
  L12_19(L13_20)
  L12_19(L13_20, L14_21)
  L15_22 = 1
  L12_19(L13_20, L14_21, L15_22)
  L7_14()
  L7_14(L8_15, L9_16)
  L10_17 = false
  L7_14(L8_15, L9_16, L10_17)
  L7_14(L8_15)
  L7_14(L8_15)
  L7_14()
  L7_14(L8_15)
  L7_14()
  L7_14()
  L7_14()
  L7_14()
  L7_14()
  L7_14()
end
function Finalize()
  set_bg_visible(true)
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
  Mob:restrict_sm35_00(false)
  Fn_disableCostumeChange(false)
  Sound:setGlobalVariable("voice_type", "normal")
end
function pccubesensor2_check_point_OnEnter()
  local L0_28, L1_29
  check_point_sensor = true
end
function pccubesensor2_check_point_OnLeave()
  local L0_30, L1_31
  check_point_sensor = false
end
function pccubesensormulti2_course_out_OnEnter()
  local L0_32, L1_33
  check_course_out = false
end
function pccubesensormulti2_course_out_OnLeave()
  local L0_34, L1_35
  check_course_out = true
end
function pccubesensor2_goal_point_OnEnter()
  local L0_36, L1_37
  getaway_complete = true
end
function pccubesensor2_goal_point_OnLeave()
  local L0_38, L1_39
  getaway_complete = false
end
function set_bg_visible(A0_40)
  if Fn_findAreaHandle("dt_a_root") then
    Fn_findAreaHandle("dt_a_root"):setEffectiveness(A0_40, true)
  end
end
