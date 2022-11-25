import("math")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm35_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
FAN_CHASE_MAX = 60
ACTIVE_FAN_CHASE_MAX = 50
ACTIVE_FAN_CHASE_DIST = 20
ESCAPE_TARGET_NODE = -1
ESCAPE_FAILED_DISTANCE_MOVE = 1
ESCAPE_FAILED_DISTANCE_IDLE = 2
ESCAPE_FAILED_DISTANCE_IDLE_SEC = 1
CHECK_POINT_RESTART_INTERVAL = 1
FAN_FIND_CAPTION_WAIT_SEC = 3
DEFAULT_SPEED = 2
DEFAULT_MOVE_OFF_DISTANCE = 30
DEFAULT_NPC_DEGREE_H = 45
DEFAULT_NPC_DEGREE_V = 45
DEFAULT_NPC_IN_LENGTH = 15
DEFAULT_NPC_OUT_LENGTH = 30
DEFAULT_NPC_MOVE_WAIT_SEC = 0.5
FAN_CHARA_MOVE_TABLE = {
  {
    name = "npc_fan_move_012",
    type = "random_hex_ed",
    node = "locator2_fan_move_012",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_013",
    type = "random_hex_ed",
    node = "locator2_fan_move_013",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_014",
    type = "random_hex_ed",
    node = "locator2_fan_move_014",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_015",
    type = "random_hex_ed",
    node = "locator2_fan_move_015",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_016",
    type = "random_hex_ed",
    node = "locator2_fan_move_016",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_017",
    type = "random_hex_ed",
    node = "locator2_fan_move_017",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_018",
    type = "random_hex_ed",
    node = "locator2_fan_move_018",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_019",
    type = "random_hex_ed",
    node = "locator2_fan_move_019",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_021",
    type = "random_hex_ed",
    node = "locator2_fan_move_021",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_027",
    type = "random_hex_ed",
    node = "locator2_fan_move_027",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_028",
    type = "random_hex_ed",
    node = "locator2_fan_move_028",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_029",
    type = "random_hex_ed",
    node = "locator2_fan_move_029",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_030",
    type = "random_hex_ed",
    node = "locator2_fan_move_030",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_031",
    type = "random_hex_ed",
    node = "locator2_fan_move_031",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_move_033",
    type = "random_hex_ed",
    node = "locator2_fan_move_033",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_035",
    type = "random_hex_ed",
    node = "locator2_fan_move_035",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_039",
    type = "random_hex_ed",
    node = "locator2_fan_move_039",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_040",
    type = "random_hex_ed",
    node = "locator2_fan_move_040",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_041",
    type = "random_hex_ed",
    node = "locator2_fan_move_041",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_move_042",
    type = "random_hex_ed",
    node = "locator2_fan_move_042",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_move_043",
    type = "random_hex_ed",
    node = "locator2_fan_move_043",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_move_044",
    type = "random_hex_ed",
    node = "locator2_fan_move_044",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_015",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_015",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_016",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_016",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_018",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_018",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_019",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_019",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_020",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_020",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_021",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_021",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_024",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_024",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_026",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_026",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_027",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_027",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_029",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_029",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_030",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_030",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_032",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_032",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_033",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_033",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_034",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_034",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_035",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_035",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_037",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_037",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_038",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_038",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_039",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_039",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_040",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_040",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_041",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_041",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_043",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_043",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_044",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_044",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_045",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_045",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_move_047",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_047",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_048",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_048",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_049",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_049",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_051",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_051",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_052",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_052",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_056",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_056",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_058",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_058",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_060",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_060",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_061",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_061",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_063",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_063",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_066",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_066",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_move_067",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_067",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_cm16_move_068",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_068",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_cm16_move_069",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_069",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_cm16_move_072",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_072",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_cm16_move_073",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_073",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_cm16_move_075",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_move_075",
    motion_use = true,
    stay_type = "look"
  }
}
FAN_CHARA_IMMOBILE_TABLE = {
  {
    name = "npc_fan_immobile_009",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_009",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_010",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_010",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_011",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_011",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_012",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_012",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_013",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_013",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_014",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_014",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_015",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_015",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_016",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_016",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_020",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_020",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_022",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_022",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_024",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_024",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_029",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_029",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_immobile_030",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_030",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_031",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_031",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_045",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_045",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_immobile_063",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_063",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_066",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_066",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_075",
    type = "random_hex_ed",
    node = "locator2_fan_immobile_075",
    motion_use = true,
    stay_type = "look"
  },
  {
    name = "npc_fan_immobile_078",
    type = "man_hex_ed",
    node = "locator2_fan_immobile_078",
    motion_use = false,
    stay_type = "accordion"
  },
  {
    name = "npc_fan_immobile_079",
    type = "man25",
    node = "locator2_fan_immobile_079",
    motion_use = false,
    stay_type = "salesman"
  },
  {
    name = "npc_fan_immobile_080",
    type = "man26",
    node = "locator2_fan_immobile_080",
    motion_use = false,
    stay_type = "salesman"
  },
  {
    name = "npc_fan_cm16_imm_008",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_008",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_011",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_011",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_018",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_018",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_019",
    type = "chi_hex",
    node = "locator2_fan_cm16_imm_019",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_020",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_020",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_026",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_026",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_imm_028",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_028",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_030",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_030",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_imm_033",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_033",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_034",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_034",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_036",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_036",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_042",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_042",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_043",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_043",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_046",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_046",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_048",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_048",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_051",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_051",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_052",
    type = "chi_hex",
    node = "locator2_fan_cm16_imm_052",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_055",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_055",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_057",
    type = "chi_hex",
    node = "locator2_fan_cm16_imm_057",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_imm_058",
    type = "chi_hex",
    node = "locator2_fan_cm16_imm_058",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_imm_059",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_059",
    motion_use = true,
    stay_type = "alone"
  },
  {
    name = "npc_fan_cm16_imm_061",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_061",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_063",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_063",
    motion_use = true,
    stay_type = "talk"
  },
  {
    name = "npc_fan_cm16_imm_065",
    type = "random_hex_ed",
    node = "locator2_fan_cm16_imm_065",
    motion_use = true,
    stay_type = "alone"
  }
}
CHECK_POINT_MAX = 7
check_point_restart = "locator2_pc_restart_pos_00"
check_point_pass = 1
check_point_restart_pass = 1
check_point_restart_check_now = 1
check_point_manager_cap_num = 1
check_point_manager_cap_restart_num = 1
fan_find_num_now = -1
goal_point_pass = false
escape_failed_flag = false
fan_touch_stop_flag = false
check_point_sensor = false
fan_culling_task = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {}
  L1_1 = {}
  L1_1.text = nil
  L6_6 = 99
  L1_1.max = L2_2
  L6_6 = 0
  L1_1.start = L2_2
  L0_0.timer = L1_1
  L1_1 = {}
  L1_1.text = nil
  L1_1.max = L2_2
  L1_1.start = 0
  L0_0.counter = L1_1
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
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L3_3()
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16
  for L3_10, L4_11 in L0_7(L1_8) do
    if L5_12 == "accordion" then
      L6_13 = L4_11.name
      L7_14 = L5_12
      L6_13 = L5_12.setPilots
      L8_15 = {L9_16}
      L9_16 = {}
      L9_16.pilot = Fn_findNpcPuppet(L4_11.name .. "_accordion")
      L9_16.attach = "bn_spine1"
      L6_13(L7_14, L8_15)
    end
  end
  for L3_10, L4_11 in L0_7(L1_8) do
    if L5_12 == "accordion" then
      L6_13 = L4_11.name
      L7_14 = L5_12
      L6_13 = L5_12.setPilots
      L8_15 = {L9_16}
      L9_16 = {}
      L9_16.pilot = Fn_findNpcPuppet(L4_11.name .. "_accordion")
      L9_16.attach = "bn_spine1"
      L6_13(L7_14, L8_15)
    end
    L6_13 = L4_11.name
    L6_13 = L5_12
    L5_12(L6_13)
  end
  L1_8(L2_9, L3_10)
  L2_9(L3_10, L4_11)
  L2_9()
  for L5_12 = 1, #L3_10 do
    L6_13 = FAN_CHARA_MOVE_TABLE
    L6_13 = L6_13[L5_12]
    L6_13 = L6_13.name
    L7_14 = Sub_GetNpcTypeName
    L8_15 = L6_13
    L9_16 = FAN_CHARA_MOVE_TABLE
    L9_16 = L9_16[L5_12]
    L9_16 = L9_16.type
    L7_14 = L7_14(L8_15, L9_16)
    L8_15 = _npc_fan_stay_motion_task
    L9_16 = Sub_npc_stay_motion_task
    L9_16 = L9_16(L6_13, Sub_MobType_discrimination(L7_14), FAN_CHARA_MOVE_TABLE[L5_12].stay_type)
    L8_15[L6_13] = L9_16
  end
  for L5_12 = 1, #L3_10 do
    L6_13 = FAN_CHARA_IMMOBILE_TABLE
    L6_13 = L6_13[L5_12]
    L6_13 = L6_13.name
    L7_14 = Sub_GetNpcTypeName
    L8_15 = L6_13
    L9_16 = FAN_CHARA_IMMOBILE_TABLE
    L9_16 = L9_16[L5_12]
    L9_16 = L9_16.type
    L7_14 = L7_14(L8_15, L9_16)
    L8_15 = _npc_fan_stay_motion_task
    L9_16 = Sub_npc_stay_motion_task
    L9_16 = L9_16(L6_13, Sub_MobType_discrimination(L7_14), FAN_CHARA_IMMOBILE_TABLE[L5_12].stay_type)
    L8_15[L6_13] = L9_16
  end
  L2_9.timer = true
  L2_9.counter = true
  L6_13 = true
  L3_10(L4_11, L5_12, L6_13)
  L6_13 = "locator2_pc_restart_pos_01"
  L9_16 = L4_11(L5_12, L6_13)
  L3_10(L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L4_11(L5_12, L6_13))
  L3_10(L4_11)
  L3_10()
  for L6_13 = 1, #L4_11 do
    L7_14 = FAN_CHARA_MOVE_TABLE
    L7_14 = L7_14[L6_13]
    L7_14 = L7_14.name
    L8_15 = Sub_GetNpcTypeName
    L9_16 = FAN_CHARA_MOVE_TABLE
    L9_16 = L9_16[L6_13]
    L9_16 = L9_16.name
    L8_15 = L8_15(L9_16, FAN_CHARA_MOVE_TABLE[L6_13].type)
    L9_16 = FAN_CHARA_MOVE_TABLE
    L9_16 = L9_16[L6_13]
    L9_16 = L9_16.line_no
    npc_model_name[L7_14] = L8_15
    npc_motion_use[L7_14] = FAN_CHARA_MOVE_TABLE[L6_13].motion_use
    npc_fan_task[L7_14] = invokeFanNpcTask(L7_14, Sub_MobType_discrimination(npc_model_name[L7_14]), L8_15, L9_16)
  end
  for L6_13 = 1, #L4_11 do
    L7_14 = FAN_CHARA_IMMOBILE_TABLE
    L7_14 = L7_14[L6_13]
    L7_14 = L7_14.name
    L8_15 = Sub_GetNpcTypeName
    L9_16 = L7_14
    L8_15 = L8_15(L9_16, FAN_CHARA_IMMOBILE_TABLE[L6_13].type)
    L9_16 = npc_fan_immobile_task
    L9_16[L7_14] = Sub_ImmobileFanTask(L7_14, FAN_CHARA_IMMOBILE_TABLE[L6_13].motion_use, Sub_MobType_discrimination(L8_15))
  end
  mob_to_npc_main_task = L3_10
  fan_culling_task = L3_10
  while true do
    if not L5_12 then
      if L5_12 == true then
        L6_13 = "\227\131\129\227\130\167\227\131\131\227\130\175\227\131\157\227\130\164\227\131\179\227\131\136"
        L7_14 = check_point_pass
        L8_15 = "\233\128\154\233\129\142"
        L6_13 = L6_13 .. L7_14 .. L8_15
        L5_12(L6_13)
        L6_13 = "pccubesensor2_check_point_"
        L7_14 = string
        L7_14 = L7_14.format
        L8_15 = "%02d"
        L9_16 = check_point_pass
        L7_14 = L7_14(L8_15, L9_16)
        L6_13 = L6_13 .. L7_14
        L5_12(L6_13)
        L6_13 = false
        L5_12(L6_13)
        L6_13 = CHECK_POINT_RESTART_INTERVAL
        if L5_12 >= L6_13 then
          L6_13 = "\227\131\129\227\130\167\227\131\131\227\130\175\227\131\157\227\130\164\227\131\179\227\131\136"
          L7_14 = check_point_pass
          L8_15 = "\227\130\146\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136\229\156\176\231\130\185\227\129\171\232\168\173\229\174\154"
          L6_13 = L6_13 .. L7_14 .. L8_15
          L5_12(L6_13)
          check_point_restart_pass = L5_12
          L6_13 = string
          L6_13 = L6_13.format
          L7_14 = "%02d"
          L8_15 = check_point_pass
          L6_13 = L6_13(L7_14, L8_15)
          check_point_restart = L5_12
          check_point_restart_check_now = 1
          check_point_manager_cap_restart_num = L5_12
        else
          check_point_restart_check_now = L5_12
        end
        check_point_pass = L5_12
        L6_13 = L5_12
        L7_14 = 1
        L5_12(L6_13, L7_14)
        L6_13 = CHECK_POINT_MAX
        if L5_12 > L6_13 then
          goal_point_pass = true
        else
          L6_13 = "pccubesensor2_check_point_"
          L7_14 = string
          L7_14 = L7_14.format
          L8_15 = "%02d"
          L9_16 = check_point_pass
          L7_14 = L7_14(L8_15, L9_16)
          L6_13 = L6_13 .. L7_14
          L5_12(L6_13)
          L6_13 = findGameObject2
          L7_14 = "Node"
          L8_15 = "locator2_pc_restart_pos_"
          L9_16 = string
          L9_16 = L9_16.format
          L9_16 = L9_16("%02d", check_point_pass)
          L8_15 = L8_15 .. L9_16
          L6_13 = L6_13(L7_14, L8_15)
          L7_14 = true
          L5_12(L6_13, L7_14)
          check_point_sensor = false
        end
      end
      if L5_12 == true then
        L5_12()
        L6_13 = L5_12
        L5_12(L6_13)
        if L5_12 == false then
          escape_failed_flag = true
        end
      end
      if L5_12 == true then
        L5_12()
        L5_12()
        L5_12()
        L5_12()
        fan_chase = 0
        fan_find_num_now = 0
        L6_13 = false
        L5_12(L6_13)
        L6_13 = "pccubesensor2_check_point_"
        L7_14 = string
        L7_14 = L7_14.format
        L8_15 = "%02d"
        L9_16 = check_point_pass
        L7_14 = L7_14(L8_15, L9_16)
        L6_13 = L6_13 .. L7_14
        L5_12(L6_13)
        check_point_pass = L5_12
        check_point_restart_check_now = 1
        L6_13 = L5_12
        L7_14 = check_point_pass
        L7_14 = L7_14 - 1
        L5_12(L6_13, L7_14)
        L6_13 = 1
        L5_12(L6_13)
        mob_to_npc_main_task = L5_12
        L6_13 = check_point_restart
        L5_12(L6_13)
        escape_failed_flag = false
        L5_12()
        L6_13 = findGameObject2
        L7_14 = "Node"
        L8_15 = "locator2_pc_restart_pos_"
        L9_16 = string
        L9_16 = L9_16.format
        L9_16 = L9_16("%02d", check_point_pass)
        L8_15 = L8_15 .. L9_16
        L6_13 = L6_13(L7_14, L8_15)
        L7_14 = true
        L5_12(L6_13, L7_14)
        L6_13 = "pccubesensor2_check_point_"
        L7_14 = string
        L7_14 = L7_14.format
        L8_15 = "%02d"
        L9_16 = check_point_pass
        L7_14 = L7_14(L8_15, L9_16)
        L6_13 = L6_13 .. L7_14
        L5_12(L6_13)
        L5_12()
        L5_12()
        L6_13 = L5_12
        L7_14 = false
        L5_12(L6_13, L7_14)
        escape_failed_flag = false
        fan_touch_stop_flag = false
        check_course_out = false
        L5_12()
        goal_point_pass = false
      end
      L5_12()
    end
  end
  L5_12()
  if L5_12 ~= nil then
    L6_13 = L5_12
    L5_12(L6_13)
    fan_culling_task = nil
  end
  L5_12()
  L6_13 = L5_12
  L7_14 = false
  L5_12(L6_13, L7_14)
  L5_12()
end
function Finalize()
  Fn_disableCostumeChange(false)
  set_bg_visible(true)
  if fan_culling_task ~= nil then
    fan_culling_task:abort()
    fan_culling_task = nil
  end
  Sub_MissionSuccessNpcDelete()
  Fn_challengeFinalize()
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
  Mob:restrict_cm16_00(false)
end
function pccubesensor2_check_point_OnEnter()
  local L0_17, L1_18
  check_point_sensor = true
end
function pccubesensor2_check_point_OnLeave()
  local L0_19, L1_20
  check_point_sensor = false
end
function pccubesensormulti2_course_out_OnEnter()
  local L0_21, L1_22
  check_course_out = false
end
function pccubesensormulti2_course_out_OnLeave()
  local L0_23, L1_24
  check_course_out = true
end
function set_bg_visible(A0_25)
  Fn_findAreaHandle("dt_a_root"):setEffectiveness(A0_25, true)
end
