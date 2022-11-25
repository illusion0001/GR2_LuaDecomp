dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
GMOM_HINT_FORCE_FIND_SECONDS = 60
SE_TARGET_PLAYER = 1
SE_TARGET_GMOM = 2
SEARCH_DOG_DATA_TBL = {
  {
    found_sensor_name = "pccubesensor2_found_dog_01",
    dog_name = "sm40_dog_01",
    gmom_name = "sm40_gmom_01",
    dog_move_prefix = "locator2_move_01_",
    gmom_hint_start_idx = 1
  },
  {
    found_sensor_name = "pccubesensor2_found_dog_02",
    dog_name = "sm40_dog_02",
    gmom_name = "sm40_gmom_02",
    dog_move_prefix = "locator2_move_02_",
    gmom_hint_start_idx = 2
  }
}
GMOM_GRAB_TARGET_DATA_TBL = {
  {
    enable = false,
    target_navi = "locator2_gmom_01",
    target_pc_sensor_name = "pccubesensor2_gmom_01",
    check_sensor_fnc = function()
      local L1_0
      L1_0 = _gmom_sensor_flag
      L1_0 = L1_0[1]
      return L1_0
    end,
    reset_sensor_flag_fnc = function()
      local L1_1
      L1_1 = _gmom_sensor_flag
      L1_1[1] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_gmom_02",
    target_pc_sensor_name = "pccubesensor2_gmom_02",
    check_sensor_fnc = function()
      local L1_2
      L1_2 = _gmom_sensor_flag
      L1_2 = L1_2[2]
      return L1_2
    end,
    reset_sensor_flag_fnc = function()
      local L1_3
      L1_3 = _gmom_sensor_flag
      L1_3[2] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_01",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_01",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(1)
    end,
    reset_sensor_flag_fnc = function()
      local L1_4
      L1_4 = _gmom_hint_sensor_flag
      L1_4[1] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_02",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_02",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(2)
    end,
    reset_sensor_flag_fnc = function()
      local L1_5
      L1_5 = _gmom_hint_sensor_flag
      L1_5[2] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_03",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_03",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(3)
    end,
    reset_sensor_flag_fnc = function()
      local L1_6
      L1_6 = _gmom_hint_sensor_flag
      L1_6[3] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_04",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_04",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(4)
    end,
    reset_sensor_flag_fnc = function()
      local L1_7
      L1_7 = _gmom_hint_sensor_flag
      L1_7[4] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_05",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_05",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(5)
    end,
    reset_sensor_flag_fnc = function()
      local L1_8
      L1_8 = _gmom_hint_sensor_flag
      L1_8[5] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_06",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_06",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(6)
    end,
    reset_sensor_flag_fnc = function()
      local L1_9
      L1_9 = _gmom_hint_sensor_flag
      L1_9[6] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_07",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_07",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(7)
    end,
    reset_sensor_flag_fnc = function()
      local L1_10
      L1_10 = _gmom_hint_sensor_flag
      L1_10[7] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_08",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_08",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(8)
    end,
    reset_sensor_flag_fnc = function()
      local L1_11
      L1_11 = _gmom_hint_sensor_flag
      L1_11[8] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_09",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_09",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(9)
    end,
    reset_sensor_flag_fnc = function()
      local L1_12
      L1_12 = _gmom_hint_sensor_flag
      L1_12[9] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_10",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_10",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(10)
    end,
    reset_sensor_flag_fnc = function()
      local L1_13
      L1_13 = _gmom_hint_sensor_flag
      L1_13[10] = false
    end
  },
  {
    enable = false,
    target_navi = "locator2_navi_gmom_hint_01_11",
    target_pc_sensor_name = "pccubesensor2_gmom_hint_01_11",
    check_sensor_fnc = function()
      return getGmomHintSensorFlag(11)
    end,
    reset_sensor_flag_fnc = function()
      local L1_14
      L1_14 = _gmom_hint_sensor_flag
      L1_14[11] = false
    end
  }
}
GMOM_HINT_DATA_TBL = {
  {
    chk_in_sight_start_sensor_name = nil,
    chk_in_sight_start_sensor_flag_idx = nil,
    chk_in_sight_node_name = nil,
    found_caption = nil,
    found_se = nil,
    found_se_target = nil,
    kaiwa_id = nil,
    arrive_caption = "sm40_01000",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_01",
    set_enable_hint_idx_tbl = {
      3,
      4,
      5,
      6,
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 3
  },
  {
    chk_in_sight_start_sensor_name = nil,
    chk_in_sight_start_sensor_flag_idx = nil,
    chk_in_sight_node_name = nil,
    found_caption = nil,
    found_se = nil,
    found_se_target = nil,
    kaiwa_id = nil,
    arrive_caption = "sm40_01000",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_01",
    set_enable_hint_idx_tbl = {
      3,
      4,
      5,
      6,
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 3
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_01",
    chk_in_sight_start_sensor_flag_idx = 1,
    chk_in_sight_node_name = "locator2_gmom_hint_chk_in_sight_01_01",
    found_caption = "sm40_01002",
    found_se = "w13_003",
    found_se_target = SE_TARGET_GMOM,
    kaiwa_id = nil,
    arrive_caption = "sm40_01003",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_02",
    set_enable_hint_idx_tbl = {
      4,
      5,
      6,
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 4
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_02",
    chk_in_sight_start_sensor_flag_idx = 2,
    chk_in_sight_node_name = "locator2_navi_gmom_hint_01_02",
    found_caption = "sm40_01004",
    found_se = "w13_003",
    found_se_target = SE_TARGET_GMOM,
    kaiwa_id = nil,
    arrive_caption = "sm40_01005",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_gmom_hint_look_01_03",
    set_enable_hint_idx_tbl = {
      5,
      6,
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 5
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_03",
    chk_in_sight_start_sensor_flag_idx = 3,
    chk_in_sight_node_name = "locator2_navi_gmom_hint_01_03",
    found_caption = "sm40_01006",
    found_se = "w13_003",
    found_se_target = SE_TARGET_GMOM,
    kaiwa_id = nil,
    arrive_caption = "sm40_01007",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_04",
    set_enable_hint_idx_tbl = {
      6,
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 6
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_04",
    chk_in_sight_start_sensor_flag_idx = 4,
    chk_in_sight_node_name = "locator2_navi_gmom_hint_01_04",
    found_caption = nil,
    found_se = nil,
    found_se_target = nil,
    kaiwa_id = nil,
    arrive_caption = "sm40_01008",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_05",
    set_enable_hint_idx_tbl = {
      7,
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 7
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_05",
    chk_in_sight_start_sensor_flag_idx = 5,
    chk_in_sight_node_name = "locator2_navi_gmom_hint_01_05",
    found_caption = nil,
    found_se = nil,
    found_se_target = nil,
    kaiwa_id = nil,
    arrive_caption = "sm40_01009",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_gmom_hint_look_01_06",
    set_enable_hint_idx_tbl = {
      8,
      9,
      11,
      12,
      13
    },
    next_hint_idx = 8
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_06",
    chk_in_sight_start_sensor_flag_idx = 6,
    chk_in_sight_node_name = "locator2_navi_gmom_hint_01_06",
    found_caption = "sm40_01010",
    found_se = "w13_003",
    found_se_target = SE_TARGET_GMOM,
    kaiwa_id = nil,
    arrive_caption = "sm40_01011",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = nil,
    set_enable_hint_idx_tbl = {
      9,
      11,
      12,
      13
    },
    next_hint_idx = 9
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_07",
    chk_in_sight_start_sensor_flag_idx = 7,
    chk_in_sight_node_name = "locator2_navi_gmom_hint_01_07",
    found_caption = nil,
    found_se = nil,
    found_se_target = nil,
    kaiwa_id = nil,
    arrive_caption = "sm40_01012",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_08",
    set_enable_hint_idx_tbl = {
      10,
      11,
      12,
      13
    },
    next_hint_idx = 10
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_08",
    chk_in_sight_start_sensor_flag_idx = 8,
    chk_in_sight_node_name = "locator2_gmom_hint_chk_in_sight_01_08",
    found_caption = nil,
    found_se = nil,
    found_se_target = nil,
    kaiwa_id = nil,
    arrive_caption = "sm40_01013",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_09",
    set_enable_hint_idx_tbl = {
      11,
      12,
      13
    },
    next_hint_idx = 11
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_09",
    chk_in_sight_start_sensor_flag_idx = 9,
    chk_in_sight_node_name = "locator2_gmom_hint_chk_in_sight_01_09",
    found_caption = "sm40_01014",
    found_se = "w13_003",
    found_se_target = SE_TARGET_GMOM,
    kaiwa_id = nil,
    arrive_caption = "sm40_01015",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_10",
    set_enable_hint_idx_tbl = {12, 13},
    next_hint_idx = 12
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_10",
    chk_in_sight_start_sensor_flag_idx = 10,
    chk_in_sight_node_name = "locator2_gmom_hint_chk_in_sight_01_10",
    found_caption = "sm40_01016",
    found_se = nil,
    found_se_target = SE_TARGET_PLAYER,
    kaiwa_id = nil,
    arrive_caption = "sm40_01017",
    arrive_se = "w13_003",
    arrive_se_target = SE_TARGET_GMOM,
    look_node_name = "locator2_navi_gmom_hint_01_11",
    set_enable_hint_idx_tbl = {13},
    next_hint_idx = 13
  },
  {
    chk_in_sight_start_sensor_name = "pccubesensor2_gmom_find_hint_start_01_11",
    chk_in_sight_start_sensor_flag_idx = 11,
    chk_in_sight_node_name = "locator2_gmom_hint_chk_in_sight_01_11",
    found_caption = "sm40_01018",
    found_se = "w13_003",
    found_se_target = SE_TARGET_GMOM,
    kaiwa_id = "sm40_00600k",
    arrive_caption = "sm40_01019",
    arrive_se = nil,
    arrive_se_target = SE_TARGET_PLAYER,
    look_node_name = "locator2_navi_gmom_store_01",
    set_enable_hint_idx_tbl = nil,
    next_hint_idx = nil
  }
}
_puppet_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_gmom_sensor_flag = {}
_found_dog_idx = 0
_gmom_chk_find_hint_sensor_flag = {}
_gmom_hint_sensor_flag = {}
_gmom_hint_idx = 0
_gmom_course_out = false
_sdemo = nil
function Initialize()
  local L0_15
  L0_15 = {
    {
      name = "sm40_dog_01",
      type = "dog01",
      node = "locator2_dog_01",
      active = false
    },
    {
      name = "sm40_dog_02",
      type = "dog01",
      node = "locator2_dog_02",
      active = false
    },
    {
      name = "sm40_gmom_01",
      type = "wom43",
      node = "locator2_gmom_01",
      active = false
    },
    {
      name = "sm40_gmom_02",
      type = "wom43",
      node = "locator2_gmom_02",
      active = false
    },
    {
      name = "sm40_clerk",
      type = "man64",
      node = "locator2_clerk_01",
      active = false
    }
  }
  Fn_setupNpc(L0_15)
  for _FORV_4_, _FORV_5_ in pairs(L0_15) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_found_dog_01")
  Fn_pcSensorOff("pccubesensor2_found_dog_02")
  Fn_pcSensorOff("pccubesensor2_gmom_01")
  Fn_pcSensorOff("pccubesensor2_gmom_02")
  Fn_pcSensorOff("pccubesensor2_search_dog_out_01")
  Fn_pcSensorOff("pccubesensor2_search_dog_out_02")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_01")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_02")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_03")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_04")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_05")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_06")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_07")
  Fn_pcSensorOff("pccubesensor2_gmom_find_hint_start_01_08")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_01")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_02")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_03")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_04")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_05")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_06")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_07")
  Fn_pcSensorOff("pccubesensor2_gmom_hint_01_08")
  Fn_pcSensorOff("pccubesensor2_gmom_soliloquy_01")
  Fn_pcSensorOff("pccubesensormulti2_gmom_grab_out_01")
  Fn_pcSensorOff("pccubesensor2_gmom_grab_out_02")
  Fn_pcSensorOff("pccubesensor2_gmom_store_01")
  _sdemo = SDemo.create("sm40_sdemo")
  Mob:restrict_sm40_00(true)
end
function Ingame()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21
  L0_16()
  L0_16(L1_17)
  L3_19 = "dog01_sit_in_00"
  L4_20 = "dog01_sit_00"
  L0_16(L1_17, L2_18)
  L3_19 = "dog01_sit_in_00"
  L4_20 = "dog01_sit_00"
  L0_16(L1_17, L2_18)
  for L3_19, L4_20 in L0_16(L1_17) do
    L5_21 = Fn_setNpcActive
    L5_21(L4_20.dog_name, true)
    L5_21 = Fn_playMotionNpc
    L5_21(L4_20.dog_name, {
      "dog01_sit_in_00",
      "dog01_sit_00"
    }, false)
  end
  L0_16(L1_17)
  L0_16()
  L0_16()
  L0_16(L1_17)
  L0_16(L1_17)
  L0_16(L1_17)
  _found_dog_idx = 0
  for L3_19, L4_20 in L0_16(L1_17) do
    L5_21 = Fn_pcSensorOn
    L5_21(L4_20.found_sensor_name)
  end
  while true do
    if L0_16 <= 0 then
      L0_16()
    end
  end
  for L3_19, L4_20 in L0_16(L1_17) do
    L5_21 = Fn_pcSensorOff
    L5_21(L4_20.found_sensor_name)
  end
  L0_16(L1_17)
  L0_16(L1_17)
  for L3_19, L4_20 in L0_16(L1_17) do
    L5_21 = _found_dog_idx
    if L3_19 == L5_21 then
      L5_21 = Fn_setNpcActive
      L5_21(L4_20.gmom_name, true)
      L5_21 = Fn_playMotionNpc
      L5_21(L4_20.gmom_name, "lookaround", false, {isRepeat = true})
    else
      L5_21 = Fn_setNpcActive
      L5_21(L4_20.dog_name, false)
    end
  end
  L3_19 = true
  L1_17(L2_18, L3_19)
  L3_19 = Camera
  L3_19 = L3_19.kPlayer
  L4_20 = Camera
  L4_20 = L4_20.kControl_All
  L5_21 = false
  L1_17(L2_18, L3_19, L4_20, L5_21)
  L3_19 = 0
  L4_20 = 0.3
  L1_17(L2_18, L3_19, L4_20)
  L3_19 = true
  L4_20 = 1
  L5_21 = _puppet_tbl
  L5_21 = L5_21[L0_16]
  L5_21 = L5_21.getWorldPos
  L5_21 = L5_21(L5_21)
  L1_17(L2_18, L3_19, L4_20, L5_21, L5_21(L5_21))
  L1_17(L2_18)
  L1_17(L2_18)
  L3_19 = false
  L4_20 = 1
  L5_21 = Vector
  L5_21 = L5_21(0, 0, 0)
  L1_17(L2_18, L3_19, L4_20, L5_21, L5_21(0, 0, 0))
  L3_19 = Camera
  L3_19 = L3_19.kPlayer
  L4_20 = Camera
  L4_20 = L4_20.kControl_All
  L5_21 = true
  L1_17(L2_18, L3_19, L4_20, L5_21)
  L3_19 = false
  L1_17(L2_18, L3_19)
  L3_19 = SEARCH_DOG_DATA_TBL
  L4_20 = _found_dog_idx
  L3_19 = L3_19[L4_20]
  L3_19 = L3_19.gmom_name
  L4_20 = SEARCH_DOG_DATA_TBL
  L5_21 = _found_dog_idx
  L4_20 = L4_20[L5_21]
  L4_20 = L4_20.dog_move_prefix
  L3_19 = _found_dog_idx
  _gmom_hint_idx = L2_18
  L3_19 = "sm40_01022"
  L2_18(L3_19)
  L3_19 = "sm40_01023"
  L2_18(L3_19)
  L3_19 = "sm40_01024"
  L2_18(L3_19)
  L3_19 = _gmom_hint_idx
  L2_18()
  L3_19 = GMOM_GRAB_TARGET_DATA_TBL
  L4_20 = _gmom_hint_idx
  L3_19 = L3_19[L4_20]
  L3_19 = L3_19.target_pc_sensor_name
  L2_18(L3_19)
  L3_19 = _puppet_tbl
  L3_19 = L3_19[L0_16]
  L2_18(L3_19)
  while true do
    L3_19 = L1_17
    if L2_18 then
      L2_18()
    end
  end
  L3_19 = L1_17
  L2_18(L3_19)
  while true do
    L3_19 = _gmom_hint_idx
    if L2_18 == false then
      L2_18()
    end
  end
  L2_18()
  L3_19 = GMOM_GRAB_TARGET_DATA_TBL
  L4_20 = _gmom_hint_idx
  L3_19 = L3_19[L4_20]
  L3_19 = L3_19.target_pc_sensor_name
  L2_18(L3_19)
  L3_19 = _gmom_hint_idx
  L2_18()
  L2_18()
  L3_19 = "sm40_00400k"
  L2_18(L3_19)
  L3_19 = "hint_start_idx:"
  L4_20 = _gmom_hint_idx
  L3_19 = L3_19 .. L4_20
  L2_18(L3_19)
  L1_17()
  L3_19 = L1_17
  L3_19 = L2_18
  L2_18(L3_19)
  L3_19 = _gmom_hint_idx
  L3_19 = false
  L4_20 = findGameObject2
  L5_21 = "Node"
  L4_20 = L4_20(L5_21, L2_18.look_node_name)
  function L5_21()
    local L0_22, L1_23
    L0_22 = Camera
    L1_23 = L0_22
    L0_22 = L0_22.setControl
    L0_22(L1_23, Camera.kPlayer, Camera.kControl_All, false)
    L0_22 = Fn_lookAtObject
    L1_23 = L4_20
    L0_22 = L0_22(L1_23, 0.5)
    L1_23 = L2_18.arrive_se
    if L1_23 ~= nil then
      L1_23 = nil
      if L2_18.arrive_se_target == SE_TARGET_PLAYER then
        L1_23 = nil
      elseif L2_18.arrive_se_target == SE_TARGET_PLAYER then
        L1_23 = _puppet_tbl[L1_17]
      end
      Sound:playSE(L2_18.arrive_se, 1, "", L1_23)
    end
    L1_23 = L2_18.arrive_caption
    if L1_23 ~= nil then
      L1_23 = Fn_captionViewWait
      L1_23(L2_18.arrive_caption)
    else
      L1_23 = waitSeconds
      L1_23(3)
    end
    L1_23 = L0_22.abort
    L1_23(L0_22)
    L0_22 = nil
    L1_23 = Camera
    L1_23 = L1_23.setControl
    L1_23(L1_23, Camera.kPlayer, Camera.kControl_All, true)
    L1_23 = true
    L3_19 = L1_23
  end
  Fn_guideNpc(L1_17, L4_20, true, L5_21)
  while true do
    if L3_19 == false then
      wait()
    else
    end
  end
  L3_19 = L0_16
  L4_20 = 30
  L3_19 = Fn_setNpcActive
  L4_20 = "sm40_clerk"
  L5_21 = true
  L3_19(L4_20, L5_21)
  L3_19 = Fn_missionView
  L4_20 = "sm40_01025"
  L3_19(L4_20)
  L3_19 = Player
  L4_20 = L3_19
  L3_19 = L3_19.setGrabExceptionalObject
  L5_21 = {L1_17}
  L3_19(L4_20, L5_21)
  L3_19 = Fn_userCtrlOn
  L3_19()
  L3_19 = Fn_setGrabNpc
  L4_20 = L1_17
  L5_21 = false
  L3_19(L4_20, L5_21, false)
  function L3_19(A0_24)
    local L1_25, L2_26
    L1_25 = A0_24.kaiwa_id
    if L1_25 ~= nil then
      L1_25 = Fn_kaiwaDemoView
      L2_26 = A0_24.kaiwa_id
      L1_25(L2_26)
    end
    L1_25 = nil
    L2_26 = A0_24.look_node_name
    if L2_26 ~= nil then
      L2_26 = Camera
      L2_26 = L2_26.setControl
      L2_26(L2_26, Camera.kPlayer, Camera.kControl_All, false)
      L2_26 = Fn_lookAtObject
      L2_26 = L2_26(A0_24.look_node_name, 0.5)
      L1_25 = L2_26
    end
    L2_26 = A0_24.arrive_se
    if L2_26 ~= nil then
      L2_26 = nil
      if A0_24.arrive_se_target == SE_TARGET_PLAYER then
        L2_26 = nil
      elseif A0_24.arrive_se_target == SE_TARGET_PLAYER then
        L2_26 = _puppet_tbl[L1_17]
      end
      Sound:playSE(A0_24.arrive_se, 1, "", L2_26)
    end
    L2_26 = A0_24.arrive_caption
    if L2_26 ~= nil then
      L2_26 = Fn_captionViewWait
      L2_26(A0_24.arrive_caption)
    elseif L1_25 ~= nil then
      L2_26 = waitSeconds
      L2_26(3)
    end
    if L1_25 ~= nil then
      L2_26 = L1_25.abort
      L2_26(L1_25)
      L1_25 = nil
      L2_26 = Camera
      L2_26 = L2_26.setControl
      L2_26(L2_26, Camera.kPlayer, Camera.kControl_All, true)
    end
  end
  function L4_20(A0_27, A1_28, A2_29)
    local L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42
    _is_out_of_range = false
    L3_30(L4_31)
    for L6_33, L7_34 in L3_30(L4_31) do
      L8_35 = L7_34.chk_in_sight_start_sensor_flag_idx
      if L8_35 ~= nil then
        L8_35 = _gmom_chk_find_hint_sensor_flag
        L9_36 = L7_34.chk_in_sight_start_sensor_flag_idx
        L8_35[L9_36] = false
      end
    end
    L3_30(L4_31)
    L8_35 = true
    L9_36 = RAC_CarryMultiGrabClass
    L9_36 = L9_36.CARRY_TYPE_FLOATING
    L10_37 = "ic_tutorial_00410"
    L11_38 = nil
    L4_31(L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38)
    for L8_35, L9_36 in L5_32(L6_33) do
      L10_37 = L4_31
      L11_38 = L8_35
      L10_37(L11_38)
    end
    if L5_32 ~= nil then
      for L8_35, L9_36 in L5_32(L6_33) do
        L10_37 = A1_28[L9_36]
        if L10_37 ~= nil then
          L11_38 = L10_37.chk_in_sight_start_sensor_flag_idx
          if L11_38 ~= nil then
            L11_38 = L10_37.chk_in_sight_start_sensor_name
            if L11_38 ~= nil then
              L11_38 = _gmom_chk_find_hint_sensor_flag
              L11_38[L12_39] = false
              L11_38 = Fn_pcSensorOn
              L11_38(L12_39)
            end
          end
        end
      end
    end
    L8_35 = {}
    L9_36 = 0
    L10_37 = 0
    function L11_38()
      Player:setStay(true)
      if L5_32 ~= nil then
        L5_32:abort()
        L5_32 = nil
      end
      Fn_pcSensorOff("pccubesensormulti2_gmom_grab_out_01")
      _is_out_of_range = false
      _gmom_course_out = true
      if _puppet_tbl[L1_17]:isGrabbed() == true then
        Fn_captionViewWait("sm40_01026")
      end
      if L10_37 == 0 then
        L3_30:reqSetTargetActive(_gmom_hint_idx, true)
        L10_37 = _gmom_hint_idx
      end
      L7_34 = 0
      L9_36 = 0
      Player:setStay(false)
    end
    L12_39(L13_40)
    if A2_29 ~= nil then
      while true do
        if L12_39 == false then
          L12_39()
        end
      end
      L12_39(L13_40)
      L12_39(L13_40)
    end
    while true do
      if L12_39 then
        L12_39()
        if L12_39 == true then
          L12_39()
        else
          if L7_34 <= 0 then
            for L15_42, _FORV_16_ in L12_39(L13_40) do
              if _gmom_chk_find_hint_sensor_flag[_FORV_16_.chk_in_sight_start_sensor_flag_idx] == true and _puppet_tbl[L1_17]:isGrabbed() == true then
                if L8_35[L15_42] == nil then
                  L8_35[L15_42] = findGameObject2("Node", _FORV_16_.chk_in_sight_node_name)
                end
                if Fn_isInSightTarget(L8_35[L15_42], 1) == true and RAC_RaycastEyeSight(L8_35[L15_42], Fn_getDistanceToPlayer(L8_35[L15_42]) + 1, 90) == true then
                  L9_36 = L15_42
                  break
                end
              end
              if not (L9_36 > 0) then
              end
            end
          else
          end
          if L9_36 > 0 then
            for L15_42, _FORV_16_ in L12_39(L13_40) do
              if L15_42 ~= L9_36 then
                L4_31(L15_42)
              end
            end
            if L12_39 ~= nil then
              for L15_42, _FORV_16_ in L12_39(L13_40) do
                if A1_28[_FORV_16_] ~= nil and A1_28[_FORV_16_].chk_in_sight_start_sensor_flag_idx ~= nil and A1_28[_FORV_16_].chk_in_sight_start_sensor_name ~= nil then
                  _gmom_chk_find_hint_sensor_flag[A1_28[_FORV_16_].chk_in_sight_start_sensor_flag_idx] = false
                  Fn_pcSensorOn(A1_28[_FORV_16_].chk_in_sight_start_sensor_name)
                end
              end
            end
            if L10_37 > 0 then
              L12_39(L13_40)
              L10_37 = 0
            end
            if L5_32 ~= nil then
              L12_39(L13_40)
            end
            L12_39(L13_40)
            L12_39[L13_40] = false
            if L12_39 ~= nil then
              if L13_40 == L14_41 then
              elseif L13_40 == L14_41 then
              end
              L15_42 = A1_28[L9_36]
              L15_42 = L15_42.found_se
              L13_40(L14_41, L15_42, 1, "", L12_39)
            end
            if L12_39 ~= nil then
              L12_39(L13_40)
            end
            L15_42 = true
            L12_39(L13_40, L14_41, L15_42)
            L10_37 = L9_36
            L9_36 = 0
          end
        end
      else
        _gmom_hint_idx = L12_39
        L12_39(L13_40)
        _is_out_of_range = false
        L12_39(L13_40)
        _gmom_course_out = false
        L12_39(L13_40)
        L10_37 = 0
        L12_39(L13_40)
        if L5_32 ~= nil then
          L12_39(L13_40)
        end
        if L12_39 ~= nil then
          L12_39(L13_40)
        else
          break
        end
        L12_39(L13_40)
      end
    end
    if L12_39 ~= nil then
      L12_39(L13_40)
      kdemo_task = nil
    end
    if L5_32 ~= nil then
      L12_39(L13_40)
    end
    for L15_42, _FORV_16_ in L12_39(L13_40) do
      if _FORV_16_.chk_in_sight_start_sensor_flag_idx ~= nil and _FORV_16_.chk_in_sight_start_sensor_name ~= nil then
        Fn_pcSensorOff(_FORV_16_.chk_in_sight_start_sensor_name)
        _gmom_chk_find_hint_sensor_flag[_FORV_16_.chk_in_sight_start_sensor_flag_idx] = false
      end
    end
    L12_39(L13_40)
    _is_out_of_range = false
  end
  L5_21 = Fn_pcSensorOn
  L5_21("pccubesensor2_gmom_grab_out_02")
  L5_21 = Fn_pcSensorOn
  L5_21("pccubesensor2_gmom_soliloquy_01")
  L5_21 = L4_20
  L5_21(GMOM_GRAB_TARGET_DATA_TBL, GMOM_HINT_DATA_TBL, "sm40_00500k")
  L5_21 = Fn_pcSensorOff
  L5_21("pccubesensor2_gmom_soliloquy_01")
  L5_21 = Fn_setCatWarpCheckPoint
  L5_21("warppoint2_pc_gmom_grab_store_01")
  L5_21 = {
    {
      enable = true,
      target_navi = "locator2_navi_gmom_store_01",
      target_pc_sensor_name = "pccubesensor2_gmom_store_01",
      check_sensor_fnc = function()
        local L0_43, L1_44
        L0_43 = _is_in_sensor
        return L0_43
      end,
      reset_sensor_flag_fnc = function()
        local L0_45, L1_46
        _is_in_sensor = false
      end
    }
  }
  RAC_CarryMultiGrabClass.create():set(L1_17, L5_21, true, RAC_CarryMultiGrabClass.CARRY_TYPE_LANDING, "ic_tutorial_00410", nil)
  RAC_CarryMultiGrabClass.create():run()
  while RAC_CarryMultiGrabClass.create():isRunning() do
    wait()
  end
  RAC_CarryMultiGrabClass.create():kill()
  L5_21 = Fn_pcSensorOff
  L5_21("pccubesensor2_gmom_grab_out_02")
  do break end
  L3_19 = Fn_blackout
  L3_19()
  L3_19 = Fn_setGrabReleaseNpc
  L4_20 = L1_17
  L3_19(L4_20)
  L3_19 = Fn_setNpcActive
  L4_20 = L1_17
  L5_21 = false
  L3_19(L4_20, L5_21)
  L3_19 = Fn_userCtrlAllOff
  L3_19()
  L4_20 = L2_18
  L3_19 = L2_18.abort
  L3_19(L4_20)
  L3_19 = Fn_setNpcActive
  L4_20 = L0_16
  L5_21 = false
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNpcActive
  L4_20 = "sm40_clerk"
  L5_21 = false
  L3_19(L4_20, L5_21)
  L3_19 = Fn_setNextMissionFlag
  L3_19()
  L3_19 = Fn_nextMission
  L3_19()
  L3_19 = Fn_exitSandbox
  L3_19()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  Mob:restrict_sm40_00(false)
end
function invokeDogGotoGmomTask(A0_47, A1_48, A2_49)
  local L3_50
  L3_50 = {}
  L3_50.move_task = nil
  function L3_50.update(A0_51)
    local L1_52, L2_53
    L1_52 = invokeTask
    function L2_53()
      Sound:playSE("dog_bark", 1, "", _puppet_tbl[A0_47])
      waitSeconds(0.3)
      Sound:playSE("dog_bark", 1, "", _puppet_tbl[A0_47])
      waitSeconds(0.8)
      Sound:playSE("dog_bark", 1, "", _puppet_tbl[A0_47])
      waitSeconds(0.3)
      Sound:playSE("dog_bark", 1, "", _puppet_tbl[A0_47])
    end
    L1_52(L2_53)
    L1_52 = {}
    L2_53 = 1
    while findGameObject2("Node", A2_49 .. string.format("%02d", L2_53)) ~= nil do
      table.insert(L1_52, {
        pos = findGameObject2("Node", A2_49 .. string.format("%02d", L2_53)):getName(),
        opt = {runLength = -1}
      })
      do break end
      do break end
      L2_53 = L2_53 + 1
    end
    table.insert(L1_52, {
      pos = _puppet_tbl[A1_48],
      opt = {runLength = 3}
    })
    A0_51.move_task = Fn_moveNpc(A0_47, L1_52, {
      anim_walk_speed = 1,
      anim_run_speed = 1,
      arrivedLength = 1.5
    })
    while A0_51.move_task:isRunning() do
      wait()
    end
    A0_51.move_task:abort()
    A0_51.move_task = nil
    RAC_stopNpcMoveTask(A0_47)
    Fn_playMotionNpc(A0_47, {
      "dog01_sit_in_00",
      "dog01_sit_00"
    }, false)
  end
  function L3_50.destractor(A0_54)
    if A0_54.move_task ~= nil then
      A0_54.move_task:abort()
      A0_54.move_task = nil
      RAC_stopNpcMoveTask(A0_47)
    end
  end
  return RAC_InvokeTaskWithDestractor(L3_50.update, L3_50.destractor, L3_50)
end
function playSdemo03()
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_03_cam_01", Fn_getPlayer(), kSDEMO_APPEND_AIM, Vector(0, 1.2, 0))
  _sdemo:play()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
  Fn_playPlayerMotion("kit01_lookaround_00", 0, 0.2, true)
  Fn_missionStart()
  _sdemo:play({
    {
      pos = "locator2_sdemo_03_cam_02",
      time = 2,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo_03_cam_03",
      time = 2,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo_03_cam_04",
      time = 3,
      hashfunc = "EaseOut"
    }
  }, nil)
  Fn_captionViewWait("sm40_01027")
  waitSeconds(0.5)
  Fn_captionView("sm40_01028")
  while _sdemo:isPlay() do
    wait()
  end
  _sdemo:stop(1)
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
end
function setGmomCheckFindHintSensorFlag(A0_55, A1_56)
  _gmom_chk_find_hint_sensor_flag[A0_55] = A1_56
end
function setGmomHintSensorFlag(A0_57, A1_58)
  _gmom_hint_sensor_flag[A0_57] = A1_58
end
function getGmomHintSensorFlag(A0_59)
  return _puppet_tbl[SEARCH_DOG_DATA_TBL[_found_dog_idx].gmom_name]:isGrabbed() == true and _gmom_hint_sensor_flag[A0_59] == true
end
function pccubesensor2_found_dog_01_OnEnter()
  local L0_60, L1_61
  _found_dog_idx = 1
end
function pccubesensor2_found_dog_01_OnLeave()
  local L0_62, L1_63
end
function pccubesensor2_found_dog_02_OnEnter()
  local L0_64, L1_65
  _found_dog_idx = 2
end
function pccubesensor2_found_dog_02_OnLeave()
  local L0_66, L1_67
end
function pccubesensor2_gmom_01_OnEnter()
  local L1_68
  L1_68 = _gmom_sensor_flag
  L1_68[1] = true
end
function pccubesensor2_gmom_01_OnLeave()
  local L1_69
  L1_69 = _gmom_sensor_flag
  L1_69[1] = false
end
function pccubesensor2_gmom_02_OnEnter()
  local L1_70
  L1_70 = _gmom_sensor_flag
  L1_70[2] = true
end
function pccubesensor2_gmom_02_OnLeave()
  local L1_71
  L1_71 = _gmom_sensor_flag
  L1_71[2] = false
end
function pccubesensor2_search_dog_out_01_OnEnter()
  local L0_72, L1_73
end
function pccubesensor2_search_dog_out_01_OnLeave()
  Player:setStay(true)
  invokeTask(function()
    Fn_captionView("sm40_01031")
    RAC_LookAtObjectWait(findGameObject2("Node", "locator2_look_dog_lost_pos_02"), 0, 0.7)
    Player:setStay(false)
  end)
end
function pccubesensor2_search_dog_out_02_OnEnter()
  local L0_74, L1_75
end
function pccubesensor2_search_dog_out_02_OnLeave()
  Player:setStay(true)
  invokeTask(function()
    Fn_catWarp()
    Player:setStay(false)
  end)
end
function pccubesensor2_gmom_find_hint_start_01_01_OnEnter()
  setGmomCheckFindHintSensorFlag(1, true)
end
function pccubesensor2_gmom_find_hint_start_01_01_OnLeave()
  setGmomCheckFindHintSensorFlag(1, false)
end
function pccubesensor2_gmom_find_hint_start_01_02_OnEnter()
  setGmomCheckFindHintSensorFlag(2, true)
end
function pccubesensor2_gmom_find_hint_start_01_02_OnLeave()
  setGmomCheckFindHintSensorFlag(2, false)
end
function pccubesensor2_gmom_find_hint_start_01_03_OnEnter()
  setGmomCheckFindHintSensorFlag(3, true)
end
function pccubesensor2_gmom_find_hint_start_01_03_OnLeave()
  setGmomCheckFindHintSensorFlag(3, false)
end
function pccubesensor2_gmom_find_hint_start_01_04_OnEnter()
  setGmomCheckFindHintSensorFlag(4, true)
end
function pccubesensor2_gmom_find_hint_start_01_04_OnLeave()
  setGmomCheckFindHintSensorFlag(4, false)
end
function pccubesensor2_gmom_find_hint_start_01_05_OnEnter()
  setGmomCheckFindHintSensorFlag(5, true)
end
function pccubesensor2_gmom_find_hint_start_01_05_OnLeave()
  setGmomCheckFindHintSensorFlag(5, false)
end
function pccubesensor2_gmom_find_hint_start_01_06_OnEnter()
  setGmomCheckFindHintSensorFlag(6, true)
end
function pccubesensor2_gmom_find_hint_start_01_06_OnLeave()
  setGmomCheckFindHintSensorFlag(6, false)
end
function pccubesensor2_gmom_find_hint_start_01_07_OnEnter()
  setGmomCheckFindHintSensorFlag(7, true)
end
function pccubesensor2_gmom_find_hint_start_01_07_OnLeave()
  setGmomCheckFindHintSensorFlag(7, false)
end
function pccubesensor2_gmom_find_hint_start_01_08_OnEnter()
  setGmomCheckFindHintSensorFlag(8, true)
end
function pccubesensor2_gmom_find_hint_start_01_08_OnLeave()
  setGmomCheckFindHintSensorFlag(8, false)
end
function pccubesensor2_gmom_find_hint_start_01_09_OnEnter()
  setGmomCheckFindHintSensorFlag(9, true)
end
function pccubesensor2_gmom_find_hint_start_01_09_OnLeave()
  setGmomCheckFindHintSensorFlag(9, false)
end
function pccubesensor2_gmom_find_hint_start_01_10_OnEnter()
  setGmomCheckFindHintSensorFlag(10, true)
end
function pccubesensor2_gmom_find_hint_start_01_10_OnLeave()
  setGmomCheckFindHintSensorFlag(10, false)
end
function pccubesensor2_gmom_find_hint_start_01_11_OnEnter()
  setGmomCheckFindHintSensorFlag(11, true)
end
function pccubesensor2_gmom_find_hint_start_01_11_OnLeave()
  setGmomCheckFindHintSensorFlag(11, false)
end
function pccubesensor2_gmom_hint_01_01_OnEnter()
  setGmomHintSensorFlag(1, true)
end
function pccubesensor2_gmom_hint_01_01_OnLeave()
  setGmomHintSensorFlag(1, false)
end
function pccubesensor2_gmom_hint_01_02_OnEnter()
  setGmomHintSensorFlag(2, true)
end
function pccubesensor2_gmom_hint_01_02_OnLeave()
  setGmomHintSensorFlag(2, false)
end
function pccubesensor2_gmom_hint_01_03_OnEnter()
  setGmomHintSensorFlag(3, true)
end
function pccubesensor2_gmom_hint_01_03_OnLeave()
  setGmomHintSensorFlag(3, false)
end
function pccubesensor2_gmom_hint_01_04_OnEnter()
  setGmomHintSensorFlag(4, true)
end
function pccubesensor2_gmom_hint_01_04_OnLeave()
  setGmomHintSensorFlag(4, false)
end
function pccubesensor2_gmom_hint_01_05_OnEnter()
  setGmomHintSensorFlag(5, true)
end
function pccubesensor2_gmom_hint_01_05_OnLeave()
  setGmomHintSensorFlag(5, false)
end
function pccubesensor2_gmom_hint_01_06_OnEnter()
  setGmomHintSensorFlag(6, true)
end
function pccubesensor2_gmom_hint_01_06_OnLeave()
  setGmomHintSensorFlag(6, false)
end
function pccubesensor2_gmom_hint_01_07_OnEnter()
  setGmomHintSensorFlag(7, true)
end
function pccubesensor2_gmom_hint_01_07_OnLeave()
  setGmomHintSensorFlag(7, false)
end
function pccubesensor2_gmom_hint_01_08_OnEnter()
  setGmomHintSensorFlag(8, true)
end
function pccubesensor2_gmom_hint_01_08_OnLeave()
  setGmomHintSensorFlag(8, false)
end
function pccubesensor2_gmom_hint_01_09_OnEnter()
  setGmomHintSensorFlag(9, true)
end
function pccubesensor2_gmom_hint_01_09_OnLeave()
  setGmomHintSensorFlag(9, false)
end
function pccubesensor2_gmom_hint_01_10_OnEnter()
  setGmomHintSensorFlag(10, true)
end
function pccubesensor2_gmom_hint_01_10_OnLeave()
  setGmomHintSensorFlag(10, false)
end
function pccubesensor2_gmom_hint_01_11_OnEnter()
  setGmomHintSensorFlag(11, true)
end
function pccubesensor2_gmom_hint_01_11_OnLeave()
  setGmomHintSensorFlag(11, false)
end
function pccubesensor2_gmom_soliloquy_01_OnEnter()
  if _gmom_course_out == false and _puppet_tbl[SEARCH_DOG_DATA_TBL[_found_dog_idx].gmom_name]:isGrabbed() == true then
    Fn_pcSensorOff("pccubesensor2_gmom_soliloquy_01")
    Fn_captionView("sm40_01029")
  end
end
function pccubesensor2_gmom_soliloquy_01_OnLeave()
  local L0_76, L1_77
end
function pccubesensormulti2_gmom_grab_out_01_OnEnter()
  local L0_78, L1_79
  _is_out_of_range = false
end
function pccubesensormulti2_gmom_grab_out_01_OnLeave()
  local L0_80, L1_81
  _is_out_of_range = true
end
function pccubesensor2_gmom_grab_out_02_OnEnter()
  local L0_82, L1_83
end
function pccubesensor2_gmom_grab_out_02_OnLeave()
  Player:setStay(true)
  invokeTask(function()
    local L0_84
    L0_84 = Fn_captionViewWait
    L0_84("sm40_01030")
    L0_84 = Fn_catWarpIn
    L0_84()
    L0_84 = Fn_catWarpCheckPoint
    L0_84()
    L0_84 = SEARCH_DOG_DATA_TBL
    L0_84 = L0_84[_found_dog_idx]
    L0_84 = L0_84.gmom_name
    Fn_warpNpc(L0_84, Fn_getCatWarpCheckPoint())
    Player:dropGrabObject()
    Player:setGrabObject(_puppet_tbl[L0_84])
    Fn_catWarpOut()
    Player:setStay(false)
  end)
end
function pccubesensor2_gmom_store_01_OnEnter()
  local L0_85, L1_86
  _is_in_sensor = true
end
function pccubesensor2_gmom_store_01_OnLeave()
  local L0_87, L1_88
  _is_in_sensor = false
end
