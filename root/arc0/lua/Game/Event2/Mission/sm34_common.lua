MAX_SPAWN_GROUP_COUNT = 4
PASSER_NAME_PREFIX = "passer_"
PASSER_LOCATOR_NAME_PREFIX = "locator2_passer_"
PASSER_SENSOR_NAME_PREFIX = "pccubesensor2_passer_"
LINEUP_SPACE = 1
LINEUP_RETRY = 0.3
L0_0 = {}
L0_0.stay_01 = "man01_call_00"
L0_0.stay_02 = "man01_merry_00"
L0_0.stay_03 = "man01_watching_soft_00"
L0_0.greeting = "man01_greeting_00"
MOTION_TBL = L0_0
_passer_spawn_step = 0
L0_0 = {}
_max_npc_count = L0_0
L0_0 = {}
puppet_tbl = L0_0
_g3_locator_name = "locator2_lineup_"
L0_0 = {}
guest_lineup_index = L0_0
L0_0 = {}
guest_lineup_task = L0_0
L0_0 = {}
guest_lineup_node = L0_0
L0_0 = {}
guest_finish = L0_0
L0_0 = {}
guests = L0_0
got_guest_num = 0
L0_0 = {}
receive_flyer_flag = L0_0
is_in_sensor = false
L0_0 = {}
task_dest_manager = L0_0
_is_event_caption_finish = true
RET_MAX = 4
L0_0 = RET_MAX
_line_up_ret_max = L0_0
L0_0 = {
  {
    _mot01 = "man01_lookaround_00",
    _mot02 = "man01_lookaround_01",
    _mot03 = "man01_lookaround_02",
    _mot04 = "man01_stay_01",
    _mot05 = "man01_stay_line_00",
    _mot06 = "man01_stay_line_01",
    _mot07 = "man01_stretch_00"
  },
  {
    _mot01 = "wom01_lookaround_00",
    _mot02 = "wom01_lookaround_01",
    _mot03 = "wom01_stay_01",
    _mot04 = "wom01_stay_03",
    _mot05 = "wom01_stay_line_00",
    _mot06 = "wom01_stay_line_01",
    _mot07 = "wom01_watching_soft_00"
  },
  {
    _mot01 = "chi01_relax_00",
    _mot02 = "chi01_stay_01",
    _mot03 = "chi01_stay_02",
    _mot04 = "chi01_stay_line_00",
    _mot05 = "chi01_stay_line_01",
    _mot06 = "chi01_stay_tired_00",
    _mot07 = "chi01_stretch_00"
  }
}
_line_up_motion = L0_0
L0_0 = {}
_line_up_motion_task_tbl = L0_0
GAME_TIME = 60
L0_0 = {
  {delta_score = 20, add_sec = 10},
  {delta_score = 20, add_sec = 10},
  {delta_score = 20, add_sec = 10},
  {delta_score = 25, add_sec = 10},
  {delta_score = 25, add_sec = 10},
  {delta_score = 25, add_sec = 10},
  {delta_score = 30, add_sec = 10},
  {delta_score = 30, add_sec = 10},
  {delta_score = 30, add_sec = 10},
  {delta_score = 30, add_sec = 5}
}
BONUS_TIME_DATA = L0_0
CHAIN_MAX_SECONDS = 5
CHAIN_BONUS = 0.1
HAND_OUT_ADD_BASE_POINT = 10
L0_0 = CHAIN_MAX_SECONDS
chain_seconds = L0_0
chain_timer_task = nil
chain_count = 0
hand_out_chain_bonus_point = 1
hand_out_point = 0
bonus_time_idx = 1
bonus_time_score_tmp = 0
function L0_0(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  _passer_spawn_step = 0
  for L6_7 = 1, MAX_SPAWN_GROUP_COUNT do
    L7_8 = string
    L7_8 = L7_8.format
    L8_9 = "%02d"
    L9_10 = L6_7
    L7_8 = L7_8(L8_9, L9_10)
    L8_9 = receive_flyer_flag
    L9_10 = {}
    L8_9[L7_8] = L9_10
    A1_2[L6_7] = 0
    A2_3[L6_7] = 0
  end
  for L6_7 = 2, MAX_SPAWN_GROUP_COUNT do
    L7_8 = Fn_pcSensorOff
    L8_9 = "pccubesensor2_group_"
    L9_10 = string
    L9_10 = L9_10.format
    L9_10 = L9_10("%02d", L6_7)
    L8_9 = L8_9 .. L9_10
    L7_8(L8_9)
  end
  for L6_7 = 1, MAX_SPAWN_GROUP_COUNT do
    L7_8 = 1
    while true do
      L8_9 = PASSER_NAME_PREFIX
      L9_10 = string
      L9_10 = L9_10.format
      L9_10 = L9_10("%02d", L6_7)
      L8_9 = L8_9 .. L9_10 .. "_" .. string.format("%02d", L7_8)
      L9_10 = puppet_tbl
      L9_10 = L9_10[L8_9]
      if L9_10 ~= nil then
        L9_10 = A1_2[L6_7]
        L9_10 = L9_10 + 1
        A1_2[L6_7] = L9_10
        L9_10 = string
        L9_10 = L9_10.format
        L9_10 = L9_10("%02d", L6_7)
        receive_flyer_flag[L9_10][string.format("%02d", L7_8)] = false
        L9_10 = PASSER_SENSOR_NAME_PREFIX
        L9_10 = L9_10 .. string.format("%02d", L6_7) .. "_" .. string.format("%02d", L7_8)
        createPcCubeSensor(L9_10, Vector(0, 0.6, 0), Vector(1, 1.3, 1), "pccubesensor2_passer_xx_xx_OnEnter", "pccubesensor2_passer_xx_xx_OnLeave", puppet_tbl[L8_9])
        Fn_pcSensorOff(L9_10)
      else
        break
      end
      L7_8 = L7_8 + 1
    end
  end
  _max_npc_count = A1_2
end
SM34_Initialize = L0_0
function L0_0(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16
  if A0_11 == nil then
    A0_11 = false
  end
  L2_13 = "man_hex_dt"
  L3_14 = "wom_hex_dt"
  L4_15 = "chi_hex_dt"
  if A1_12 == 13 then
    L2_13 = "man_hex_ed"
    L3_14 = "wom_hex_ed"
    L4_15 = "man_hex_ed"
  end
  L5_16 = {
    {
      name = "passer_02_01",
      type = L2_13,
      node = "locator2_passer_02_01",
      active = false,
      attach = false
    },
    {
      name = "passer_02_02",
      type = L2_13,
      node = "locator2_passer_02_02",
      active = false,
      attach = false
    },
    {
      name = "passer_02_03",
      type = L2_13,
      node = "locator2_passer_02_03",
      active = false,
      attach = false
    },
    {
      name = "passer_02_04",
      type = L2_13,
      node = "locator2_passer_02_04",
      active = false,
      attach = false
    },
    {
      name = "passer_02_05",
      type = L2_13,
      node = "locator2_passer_02_05",
      active = false,
      attach = false
    },
    {
      name = "passer_02_06",
      type = L2_13,
      node = "locator2_passer_02_06",
      active = false,
      attach = false
    },
    {
      name = "passer_02_07",
      type = L3_14,
      node = "locator2_passer_02_07",
      active = false,
      attach = false
    },
    {
      name = "passer_02_08",
      type = L3_14,
      node = "locator2_passer_02_08",
      active = false,
      attach = false
    },
    {
      name = "passer_02_09",
      type = L3_14,
      node = "locator2_passer_02_09",
      active = false,
      attach = false
    },
    {
      name = "passer_02_10",
      type = L3_14,
      node = "locator2_passer_02_10",
      active = false,
      attach = false
    },
    {
      name = "passer_02_11",
      type = L3_14,
      node = "locator2_passer_02_11",
      active = false,
      attach = false
    },
    {
      name = "passer_02_12",
      type = L3_14,
      node = "locator2_passer_02_12",
      active = false,
      attach = false
    },
    {
      name = "passer_02_13",
      type = L4_15,
      node = "locator2_passer_02_13",
      active = false,
      attach = false
    },
    {
      name = "passer_02_14",
      type = L4_15,
      node = "locator2_passer_02_14",
      active = false,
      attach = false
    },
    {
      name = "passer_02_15",
      type = L4_15,
      node = "locator2_passer_02_15",
      active = false,
      attach = false
    },
    {
      name = "passer_03_01",
      type = L2_13,
      node = "locator2_passer_03_01",
      active = false,
      attach = false
    },
    {
      name = "passer_03_02",
      type = L2_13,
      node = "locator2_passer_03_02",
      active = false,
      attach = false
    },
    {
      name = "passer_03_03",
      type = L2_13,
      node = "locator2_passer_03_03",
      active = false,
      attach = false
    },
    {
      name = "passer_03_04",
      type = L2_13,
      node = "locator2_passer_03_04",
      active = false,
      attach = false
    },
    {
      name = "passer_03_05",
      type = L2_13,
      node = "locator2_passer_03_05",
      active = false,
      attach = false
    },
    {
      name = "passer_03_06",
      type = L2_13,
      node = "locator2_passer_03_06",
      active = false,
      attach = false
    },
    {
      name = "passer_03_07",
      type = L3_14,
      node = "locator2_passer_03_07",
      active = false,
      attach = false
    },
    {
      name = "passer_03_08",
      type = L3_14,
      node = "locator2_passer_03_08",
      active = false,
      attach = false
    },
    {
      name = "passer_03_09",
      type = L3_14,
      node = "locator2_passer_03_09",
      active = false,
      attach = false
    },
    {
      name = "passer_03_10",
      type = L3_14,
      node = "locator2_passer_03_10",
      active = false,
      attach = false
    },
    {
      name = "passer_03_11",
      type = L3_14,
      node = "locator2_passer_03_11",
      active = false,
      attach = false
    },
    {
      name = "passer_03_12",
      type = L3_14,
      node = "locator2_passer_03_12",
      active = false,
      attach = false
    },
    {
      name = "passer_03_13",
      type = L4_15,
      node = "locator2_passer_03_13",
      active = false,
      attach = false
    },
    {
      name = "passer_03_14",
      type = L4_15,
      node = "locator2_passer_03_14",
      active = false,
      attach = false
    },
    {
      name = "passer_03_15",
      type = L4_15,
      node = "locator2_passer_03_15",
      active = false,
      attach = false
    },
    {
      name = "passer_03_16",
      type = L4_15,
      node = "locator2_passer_03_16",
      active = false,
      attach = false
    },
    {
      name = "passer_03_17",
      type = L2_13,
      node = "locator2_passer_03_17",
      active = false,
      attach = false
    },
    {
      name = "passer_03_18",
      type = L2_13,
      node = "locator2_passer_03_18",
      active = false,
      attach = false
    },
    {
      name = "passer_03_19",
      type = L2_13,
      node = "locator2_passer_03_19",
      active = false,
      attach = false
    },
    {
      name = "passer_03_20",
      type = L2_13,
      node = "locator2_passer_03_20",
      active = false,
      attach = false
    },
    {
      name = "passer_04_01",
      type = L2_13,
      node = "locator2_passer_04_01",
      active = false,
      attach = false
    },
    {
      name = "passer_04_02",
      type = L2_13,
      node = "locator2_passer_04_02",
      active = false,
      attach = false
    },
    {
      name = "passer_04_03",
      type = L2_13,
      node = "locator2_passer_04_03",
      active = false,
      attach = false
    },
    {
      name = "passer_04_04",
      type = L2_13,
      node = "locator2_passer_04_04",
      active = false,
      attach = false
    },
    {
      name = "passer_04_05",
      type = L2_13,
      node = "locator2_passer_04_05",
      active = false,
      attach = false
    },
    {
      name = "passer_04_06",
      type = L2_13,
      node = "locator2_passer_04_06",
      active = false,
      attach = false
    },
    {
      name = "passer_04_07",
      type = L3_14,
      node = "locator2_passer_04_07",
      active = false,
      attach = false
    },
    {
      name = "passer_04_08",
      type = L3_14,
      node = "locator2_passer_04_08",
      active = false,
      attach = false
    },
    {
      name = "passer_04_09",
      type = L3_14,
      node = "locator2_passer_04_09",
      active = false,
      attach = false
    },
    {
      name = "passer_04_10",
      type = L3_14,
      node = "locator2_passer_04_10",
      active = false,
      attach = false
    },
    {
      name = "passer_04_11",
      type = L3_14,
      node = "locator2_passer_04_11",
      active = false,
      attach = false
    },
    {
      name = "passer_04_12",
      type = L3_14,
      node = "locator2_passer_04_12",
      active = false,
      attach = false
    },
    {
      name = "passer_04_13",
      type = L4_15,
      node = "locator2_passer_04_13",
      active = false,
      attach = false
    },
    {
      name = "passer_04_14",
      type = L4_15,
      node = "locator2_passer_04_14",
      active = false,
      attach = false
    },
    {
      name = "passer_04_15",
      type = L4_15,
      node = "locator2_passer_04_15",
      active = false,
      attach = false
    },
    {
      name = "passer_04_16",
      type = L4_15,
      node = "locator2_passer_04_16",
      active = false,
      attach = false
    },
    {
      name = "passer_04_17",
      type = L2_13,
      node = "locator2_passer_04_17",
      active = false,
      attach = false
    },
    {
      name = "passer_04_18",
      type = L2_13,
      node = "locator2_passer_04_18",
      active = false,
      attach = false
    },
    {
      name = "passer_04_19",
      type = L2_13,
      node = "locator2_passer_04_19",
      active = false,
      attach = false
    },
    {
      name = "passer_04_20",
      type = L2_13,
      node = "locator2_passer_04_20",
      active = false,
      attach = false
    },
    {
      name = "passer_04_21",
      type = L2_13,
      node = "locator2_passer_04_21",
      active = false,
      attach = false
    },
    {
      name = "passer_04_22",
      type = L2_13,
      node = "locator2_passer_04_22",
      active = false,
      attach = false
    },
    {
      name = "passer_04_23",
      type = L3_14,
      node = "locator2_passer_04_23",
      active = false,
      attach = false
    },
    {
      name = "passer_04_24",
      type = L3_14,
      node = "locator2_passer_04_24",
      active = false,
      attach = false
    },
    {
      name = "passer_04_25",
      type = L3_14,
      node = "locator2_passer_04_25",
      active = false,
      attach = false
    },
    {
      name = "passer_05_01",
      type = L2_13,
      node = "locator2_passer_04_01",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_02",
      type = L2_13,
      node = "locator2_passer_04_02",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_03",
      type = L2_13,
      node = "locator2_passer_04_03",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_04",
      type = L2_13,
      node = "locator2_passer_04_04",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_05",
      type = L2_13,
      node = "locator2_passer_04_05",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_06",
      type = L2_13,
      node = "locator2_passer_04_06",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_07",
      type = L3_14,
      node = "locator2_passer_04_07",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_08",
      type = L3_14,
      node = "locator2_passer_04_08",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_09",
      type = L3_14,
      node = "locator2_passer_04_09",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_10",
      type = L3_14,
      node = "locator2_passer_04_10",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_11",
      type = L3_14,
      node = "locator2_passer_04_11",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_12",
      type = L3_14,
      node = "locator2_passer_04_12",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_13",
      type = L4_15,
      node = "locator2_passer_04_13",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_14",
      type = L4_15,
      node = "locator2_passer_04_14",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_15",
      type = L4_15,
      node = "locator2_passer_04_15",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_16",
      type = L4_15,
      node = "locator2_passer_04_16",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_17",
      type = L2_13,
      node = "locator2_passer_04_17",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_18",
      type = L2_13,
      node = "locator2_passer_04_18",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_19",
      type = L2_13,
      node = "locator2_passer_04_19",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_20",
      type = L2_13,
      node = "locator2_passer_04_20",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_21",
      type = L2_13,
      node = "locator2_passer_04_21",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_22",
      type = L2_13,
      node = "locator2_passer_04_22",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_23",
      type = L3_14,
      node = "locator2_passer_04_23",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_24",
      type = L3_14,
      node = "locator2_passer_04_24",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_25",
      type = L3_14,
      node = "locator2_passer_04_25",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_26",
      type = L3_14,
      node = "locator2_passer_04_26",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_27",
      type = L3_14,
      node = "locator2_passer_04_27",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_28",
      type = L3_14,
      node = "locator2_passer_04_28",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_29",
      type = L4_15,
      node = "locator2_passer_04_29",
      active = false,
      not_mob = true
    },
    {
      name = "passer_05_30",
      type = L4_15,
      node = "locator2_passer_04_30",
      active = false,
      not_mob = true
    }
  }
  Fn_setupNpc(L5_16)
  for _FORV_9_, _FORV_10_ in pairs(L5_16) do
    puppet_tbl[_FORV_10_.name] = Fn_findNpcPuppet(_FORV_10_.name)
    Fn_loadNpcEventMotion(_FORV_10_.name, MOTION_TBL)
  end
  if A0_11 == false then
    Fn_loadNpcEventMotion("sm34_client", MOTION_TBL)
  else
    SM34_InitializeLineup(_g3_locator_name)
  end
end
SM34_SetUpChara = L0_0
function L0_0(A0_17, A1_18)
  if A0_17 == nil then
    A0_17 = {
      0,
      0,
      0,
      0
    }
  end
  if A1_18.num_score == nil then
    A1_18.num_score = 0
  end
  if A1_18.num_chain == nil then
    A1_18.num_chain = 0
  end
  HUD:counter99_99SetIcon(HUD.kCount99_99IconType_Checkbox)
  HUD:timerSetSecond(A0_17)
  HUD:timerSetVisible(true)
  HUD:timerStart()
  if A1_18.str_score ~= nil then
    HUD:counter999SetIcon(HUD.kCount999IconType_Stone, 0)
    HUD:counter999SetVisible(true, true, 0)
    HUD:counter999SetTextID(A1_18.str_score, 0)
    HUD:counter999SetNum(A1_18.num_score, 0)
  end
  if A1_18.str_chain ~= nil then
    HUD:counter999SetIcon(HUD.kCount999IconType_Question, 1)
    HUD:counter999SetVisible(true, true, 1)
    HUD:counter999SetTextID(A1_18.str_chain, 1)
    HUD:counter999SetNum(A1_18.num_chain, 1)
  end
end
SM34_SetUpHUD = L0_0
function L0_0()
  HUD:timerStop()
  HUD:timerSetVisible(false)
  HUD:counter999SetVisible(false, false, 0)
  HUD:counter999SetVisible(false, false, 1)
end
SM34_EndHUD = L0_0
function L0_0(A0_19, A1_20, A2_21, A3_22)
  local L4_23
  L4_23 = A3_22.check_spawn_idx
  if L4_23 == nil then
    A3_22.check_spawn_idx = 1
  end
  L4_23 = A3_22.is_challenge
  if L4_23 == nil then
    A3_22.is_challenge = false
  end
  if A1_20 ~= nil then
    L4_23 = _passer_spawn_step
    L4_23 = L4_23 + 1
    if L4_23 <= #A0_19 then
      if A3_22.is_challenge then
      else
      end
      if A2_21 <= A0_19[L4_23] and checkNextSpawn(A1_20, A3_22) == true then
        table.insert(task_dest_manager, invokeSpawnPasserLargeGroupTask(A1_20, A1_20[A3_22.check_spawn_idx].group_idx, A3_22.check_spawn_idx, A3_22))
      end
    end
  end
end
SM34_SpawnPasserLargeGroup = L0_0
function L0_0(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31
  L1_25 = {}
  for L5_29 = 1, A0_24 do
    L6_30 = PASSER_NAME_PREFIX
    L7_31 = "05_"
    L6_30 = L6_30 .. L7_31 .. string.format("%02d", L5_29)
    L7_31 = Fn_findNpc
    L7_31 = L7_31(L6_30)
    L7_31 = L7_31.getActive
    L7_31 = L7_31(L7_31)
    if L7_31 == false then
      L7_31 = table
      L7_31 = L7_31.insert
      L7_31(L1_25, L5_29)
    end
  end
  L2_26(L3_27)
  for L5_29 = 1, #L1_25 do
    L6_30 = RandI
    L7_31 = L5_29
    L6_30 = L6_30(L7_31, #L1_25)
    L7_31 = PASSER_NAME_PREFIX
    L7_31 = L7_31 .. "05_" .. string.format("%02d", L1_25[L6_30])
    print(L7_31 .. " \231\148\159\230\136\144")
    Fn_setNpcActive(L7_31, true)
    Fn_playMotionNpc(L7_31, "stay", false)
    if Fn_findNpc(L7_31) ~= nil and Fn_findNpc(L7_31):isStarted() then
      guests[L7_31] = Fn_findNpcPuppet(L7_31)
    end
    Fn_warpNpc(L7_31, guest_lineup_node[L5_29])
    playNpcLineUpMotion(L7_31, L5_29, _line_up_ret_max)
    L1_25[L6_30], L1_25[L5_29] = L1_25[L5_29], L1_25[L6_30]
    Fn_findNpc(L7_31):setStagger(true)
  end
end
SM34_RespawnClearLineUp = L0_0
function L0_0(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42
  L1_33 = {}
  guest_lineup_index = L1_33
  L1_33 = {}
  guest_lineup_task = L1_33
  L1_33 = {}
  guest_lineup_node = L1_33
  L1_33 = {}
  _line_up_motion_task_tbl = L1_33
  L1_33 = {}
  L2_34 = {}
  L3_35 = {}
  L4_36 = 1
  while true do
    L5_37 = findGameObject2
    L6_38 = "Node"
    L7_39 = A0_32
    L8_40 = string
    L8_40 = L8_40.format
    L9_41 = "%02d"
    L10_42 = L4_36
    L8_40 = L8_40(L9_41, L10_42)
    L7_39 = L7_39 .. L8_40
    L5_37 = L5_37(L6_38, L7_39)
    if L5_37 ~= nil then
      L1_33[L4_36] = L5_37
      if L4_36 == 1 then
        L6_38 = print
        L7_39 = "LineupNode.."
        L8_40 = L1_33[L4_36]
        L9_41 = L8_40
        L8_40 = L8_40.getName
        L8_40 = L8_40(L9_41)
        L7_39 = L7_39 .. L8_40
        L6_38(L7_39)
      else
        L6_38 = L1_33[L4_36]
        L7_39 = L6_38
        L6_38 = L6_38.getWorldPos
        L6_38 = L6_38(L7_39)
        L7_39 = L4_36 - 1
        L7_39 = L1_33[L7_39]
        L8_40 = L7_39
        L7_39 = L7_39.getWorldPos
        L7_39 = L7_39(L8_40)
        L6_38 = L6_38 - L7_39
        L7_39 = L4_36 - 1
        L9_41 = L6_38
        L8_40 = L6_38.Length
        L8_40 = L8_40(L9_41)
        L2_34[L7_39] = L8_40
        L7_39 = print
        L8_40 = "LineupBaseNode.."
        L9_41 = L1_33[L4_36]
        L10_42 = L9_41
        L9_41 = L9_41.getName
        L9_41 = L9_41(L10_42)
        L10_42 = "("
        L8_40 = L8_40 .. L9_41 .. L10_42 .. L2_34[L4_36 - 1] .. ")"
        L7_39(L8_40)
        L7_39 = L4_36 - 1
        L9_41 = L6_38
        L8_40 = L6_38.Normalize
        L8_40 = L8_40(L9_41)
        L3_35[L7_39] = L8_40
      end
      L4_36 = L4_36 + 1
    end
  end
  L4_36 = 1
  L5_37 = 1
  L6_38 = 0
  while true do
    L7_39, L8_40 = nil, nil
    if L4_36 == 1 then
      L9_41 = L1_33[1]
      L10_42 = L9_41
      L9_41 = L9_41.getWorldTransform
      L10_42 = L9_41(L10_42)
      L8_40 = L10_42
      L7_39 = L9_41
      L6_38 = 0
    else
      L9_41 = LINEUP_SPACE
      L6_38 = L6_38 + L9_41
      L9_41 = L2_34[L5_37]
      if L6_38 < L9_41 then
        L9_41 = L1_33[L5_37]
        L10_42 = L9_41
        L9_41 = L9_41.getWorldTransform
        L10_42 = L9_41(L10_42)
        L8_40 = L10_42
        L7_39 = L9_41
        L9_41 = L3_35[L5_37]
        L9_41 = L9_41 * L6_38
        L7_39 = L7_39 + L9_41
      else
        L9_41 = #L1_33
        L9_41 = L9_41 - 1
        if L5_37 < L9_41 then
          while true do
            L9_41 = L2_34[L5_37]
            if L6_38 > L9_41 then
              L9_41 = L2_34[L5_37]
              L6_38 = L6_38 - L9_41
              L5_37 = L5_37 + 1
            end
          end
          L9_41 = L1_33[L5_37]
          L10_42 = L9_41
          L9_41 = L9_41.getWorldTransform
          L10_42 = L9_41(L10_42)
          L8_40 = L10_42
          L7_39 = L9_41
          L9_41 = L3_35[L5_37]
          L9_41 = L9_41 * L6_38
          L7_39 = L7_39 + L9_41
          do break end
          do break end
          L9_41 = guest_lineup_node
          L10_42 = L4_36 - 1
          L9_41 = L9_41[L10_42]
          L10_42 = L9_41
          L9_41 = L9_41.getWorldPos
          L9_41 = L9_41(L10_42)
          L9_41 = L9_41 - L7_39
          L10_42 = Fn_get_distance_angle
          L10_42 = L10_42(L7_39, guest_lineup_node[L4_36 - 1]:getWorldPos())
          L8_40 = YRotQuat(Deg2Rad(L10_42))
          L9_41 = A0_32
          L10_42 = string
          L10_42 = L10_42.format
          L10_42 = L10_42("%03d", L4_36)
          L9_41 = L9_41 .. L10_42
          L10_42 = print
          L10_42("LineupNode.." .. L9_41)
          L10_42 = guest_lineup_node
          L10_42[L4_36] = RAC_createGameObject2(L9_41, "Node", L7_39, L8_40)
          L4_36 = L4_36 + 1
        end
      end
    end
  end
end
SM34_InitializeLineup = L0_0
function L0_0()
  return invokeTask(function()
    local L0_43
    while true do
      repeat
        L0_43 = waitSeconds
        L0_43(2)
        L0_43 = 1
        while true do
          if task_dest_manager[L0_43]:isRunning() == false then
            table.remove(task_dest_manager, L0_43)
          else
            L0_43 = L0_43 + 1
          end
        end
      until L0_43 <= #task_dest_manager
    end
  end)
end
SM34_CleanupTaskDestManagerTask = L0_0
function L0_0()
  Mob:topUpHatchery()
  Mob:letStateMode(Mob.StateMode.kLeaflet, true)
  Mob:getLeafletCount(0)
end
SM34_InitMob = L0_0
function L0_0()
  Mob:letStateMode(Mob.StateMode.kLeaflet, false)
  Mob:topUpHatchery()
end
SM34_FinalizeMob = L0_0
function L0_0()
  local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53
  for L3_47, L4_48 in L0_44(L1_45) do
    for L8_52 = 1, L4_48 do
      L9_53 = PASSER_NAME_PREFIX
      L9_53 = L9_53 .. string.format("%02d", L3_47) .. "_" .. string.format("%02d", L8_52)
      Fn_setNpcActive(L9_53, false)
      if _line_up_motion_task_tbl[L9_53] ~= nil then
        _line_up_motion_task_tbl[L9_53]:abort()
        _line_up_motion_task_tbl[L9_53] = nil
      end
    end
  end
  for L3_47 = 1, #L1_45 do
    L4_48 = task_dest_manager
    L4_48 = L4_48[L3_47]
    L4_48 = L4_48.abort
    L4_48(L5_49)
    L4_48 = task_dest_manager
    L4_48[L3_47] = nil
  end
  task_dest_manager = L0_44
  for L3_47, L4_48 in L0_44(L1_45) do
    if L4_48 ~= nil then
      L5_49(L6_50)
      L4_48 = nil
    end
  end
  for L3_47 = 1, #L1_45 do
    L4_48 = guest_lineup_node
    L4_48 = L4_48[L3_47]
    if L4_48 ~= nil then
      L4_48 = guest_lineup_node
      L4_48 = L4_48[L3_47]
      L4_48 = L4_48.try_term
      L4_48(L5_49)
      L4_48 = guest_lineup_node
      L4_48[L3_47] = nil
    end
  end
  for L3_47, L4_48 in L0_44(L1_45) do
    if L4_48 ~= nil then
      L5_49(L6_50)
      L4_48 = nil
    end
  end
  guest_finish = L0_44
  guests = L0_44
end
SM34_ClearFinalize = L0_0
function L0_0()
  local L0_54, L1_55
  L0_54 = _is_event_caption_finish
  return L0_54
end
SM34_getEventCaptionFinish = L0_0
function L0_0(A0_56, A1_57)
  if A1_57 == nil then
    A1_57 = false
  end
  return invokeTask(function()
    local L0_58, L1_59, L2_60
    L0_58 = {}
    L1_59 = 0
    L2_60 = 1
    while true do
      L1_59 = Mob:getLeafletCount() + got_guest_num
      if L1_59 ~= L1_59 then
        invokeTask(function()
          if A1_57 == true then
            if L1_59 >= bonus_time_score_tmp + BONUS_TIME_DATA[bonus_time_idx].delta_score then
              HUD:timerSetSecond(HUD:timerGetSecond() + BONUS_TIME_DATA[bonus_time_idx].add_sec)
              Sound:playSE("sys_info", 1)
              Fn_captionView(A0_56)
              bonus_time_score_tmp = bonus_time_score_tmp + BONUS_TIME_DATA[bonus_time_idx].delta_score
              bonus_time_idx = math.min(bonus_time_idx + 1, #BONUS_TIME_DATA)
            end
            HUD:scorePop(HAND_OUT_ADD_BASE_POINT * hand_out_chain_bonus_point, Fn_getPlayer(), "bn_head")
            HUD:counter999AddNum(HAND_OUT_ADD_BASE_POINT * hand_out_chain_bonus_point, 0)
            addChain()
          end
          Sound:playSEHandle("sm34_flyer")
          Sound:playSEHandle("success")
          L0_58[L2_60] = RAC_createEffect({
            eff_name = "ef_pl_kira_00",
            world_pos = Fn_getPlayerWorldPos(),
            time = 3,
            loop = false
          })
          L2_60 = L2_60 + 1
        end)
      end
      wait(2)
    end
    for _FORV_6_ in ipairs(L0_58) do
      if L0_58[_FORV_6_]:isRunning() == false and L0_58[_FORV_6_] ~= nil then
        L0_58[_FORV_6_]:abort()
        L0_58[_FORV_6_] = nil
      end
    end
    L0_58 = {}
  end)
end
SM34_AddScore = L0_0
function L0_0()
  if chain_timer_task ~= nil then
    chain_timer_task:abort()
    chain_timer_task = nil
  end
  chain_count = chain_count + 1
  HUD:counter999AddNum(1, 1)
  chain_seconds = math.max(chain_seconds - CHAIN_BONUS, 1)
  hand_out_chain_bonus_point = hand_out_chain_bonus_point + CHAIN_BONUS
  chain_timer_task = invokeTask(function()
    waitSeconds(chain_seconds)
    HUD:counter999SubNum(chain_count, 1)
    chain_count = 0
    chain_seconds = CHAIN_MAX_SECONDS
    hand_out_chain_bonus_point = 1
  end)
end
addChain = L0_0
function L0_0(A0_61, A1_62, A2_63)
  local L3_64, L4_65, L5_66, L6_67, L7_68
  L3_64 = A1_62.check_spawn_idx
  if A2_63 == nil then
    A2_63 = 15
  end
  L4_65 = A0_61[L3_64]
  L4_65 = L4_65.group_idx
  if L4_65 == 3 then
    L4_65 = A1_62.is_challenge
    if L4_65 == false then
      L4_65 = Fn_getDistanceToPlayer
      L5_66 = "locator2_lineup_00"
      L4_65 = L4_65(L5_66)
      L5_66 = Fn_getDistanceToPlayer
      L6_67 = "locator2_lineup2_00"
      L5_66 = L5_66(L6_67)
      if L4_65 < L5_66 then
        _g3_locator_name = "locator2_lineup2_"
      else
        _g3_locator_name = "locator2_lineup_"
      end
      L4_65 = SM34_InitializeLineup
      L5_66 = _g3_locator_name
      L4_65(L5_66)
    end
  end
  L4_65 = 1
  while true do
    L5_66 = _max_npc_count
    L6_67 = A0_61[L3_64]
    L6_67 = L6_67.group_idx
    L5_66 = L5_66[L6_67]
    if L4_65 < L5_66 then
      L5_66 = findGameObject2
      L6_67 = "Node"
      L7_68 = "locator2_passer_"
      L7_68 = L7_68 .. string.format("%02d", A0_61[L3_64].group_idx) .. "_" .. string.format("%02d", L4_65)
      L5_66 = L5_66(L6_67, L7_68)
      L6_67 = A0_61[L3_64]
      L6_67 = L6_67.group_idx
      if L6_67 == 3 then
        L6_67 = findGameObject2
        L7_68 = "Node"
        L6_67 = L6_67(L7_68, _g3_locator_name .. string.format("%03d", L4_65))
        L5_66 = L6_67
      end
      L6_67 = print
      L7_68 = "............."
      L7_68 = L7_68 .. L5_66:getName()
      L6_67(L7_68)
      L6_67 = false
      L7_68 = Fn_isInSightTarget
      L7_68 = L7_68(L5_66, 1)
      if L7_68 then
        L7_68 = Fn_getDistanceToPlayer
        L7_68 = L7_68(L5_66)
        if A2_63 >= L7_68 then
          return false
        end
        L6_67 = true
      end
      if L6_67 == true then
        L7_68 = A0_61[L3_64]
        table.remove(A0_61, L3_64)
        if A0_61[1] == nil then
          table.insert(A0_61, L7_68)
          return false
        end
        table.insert(A0_61, L7_68)
        break
      end
    end
    L4_65 = L4_65 + 1
  end
  L5_66 = true
  return L5_66
end
checkNextSpawn = L0_0
function L0_0(A0_69, A1_70, A2_71, A3_72)
  return invokeTask(function()
    local L0_73, L1_74, L2_75, L3_76
    L0_73, L1_74 = nil, nil
    L2_75 = _passer_spawn_step
    L2_75 = L2_75 + 1
    _passer_spawn_step = L2_75
    L2_75 = respawnPasser
    L3_76 = A1_70
    L2_75(L3_76, A3_72.is_challenge)
    L2_75 = A3_72.sound
    if L2_75 ~= nil then
      L2_75 = Sound
      L3_76 = L2_75
      L2_75 = L2_75.setGlobalVariable
      L2_75(L3_76, "voice_type", "radio")
      L2_75 = Sound
      L3_76 = L2_75
      L2_75 = L2_75.playSE
      L2_75 = L2_75(L3_76, A3_72.sound)
      L1_74 = L2_75
      L2_75 = Sound
      L3_76 = L2_75
      L2_75 = L2_75.setGlobalVariable
      L2_75(L3_76, "voice_type", "normal")
    end
    L2_75 = A3_72.is_challenge
    if L2_75 then
      L2_75 = A1_70
      if L2_75 == 2 then
        L2_75 = RAC_setAccordionNpc
        L3_76 = "jugg_01"
        L2_75 = L2_75(L3_76, "man01", "locator2_passer_jugg", true, true)
        L0_73 = L2_75
        L2_75 = passer_group01_animation
        L2_75()
      end
    end
    L2_75 = table
    L2_75 = L2_75.remove
    L3_76 = A0_69
    L2_75(L3_76, A2_71)
    L2_75 = A0_69[1]
    if L2_75 == nil then
      L2_75 = nil
      A0_69 = L2_75
    end
    L2_75 = "pccubesensor2_group_"
    L3_76 = string
    L3_76 = L3_76.format
    L3_76 = L3_76("%02d", A1_70)
    L2_75 = L2_75 .. L3_76
    L3_76 = "locator2_navi_group_"
    is_in_sensor = false
    if _g3_locator_name == "locator2_lineup2_" and A3_72.is_challenge == false then
      L2_75 = "pccubesensor2_group2_" .. string.format("%02d", A1_70)
      L3_76 = "locator2_navi_group2_"
      print("........" .. L3_76)
    end
    RAC_MultiNaviAdd(findGameObject2("Node", L3_76 .. string.format("%02d", A1_70)))
    Fn_pcSensorOn(L2_75)
    if A3_72.caption ~= nil then
      Fn_captionViewEnd()
      Sound:playSE("sys_info", 1)
      while Fn_captionViewLock(A3_72.caption) == false do
        wait()
        _is_event_caption_finish = false
        break
      end
      waitSeconds(3)
      _is_event_caption_finish = true
    end
    if L1_74 ~= nil then
      Sound:stopSEHandle(L1_74)
    end
  end)
end
invokeSpawnPasserLargeGroupTask = L0_0
function L0_0()
  local L0_77, L1_78
  L0_77 = {
    L1_78,
    {
      name = MOTION_TBL.stay_02
    },
    {
      name = MOTION_TBL.stay_03
    }
  }
  L1_78 = {}
  L1_78.name = MOTION_TBL.stay_01
  L1_78 = 1
  invokeTask(function()
    local L0_79, L1_80
    while true do
      L0_79 = math
      L0_79 = L0_79.random
      L1_80 = L0_77
      L1_80 = #L1_80
      L0_79 = L0_79(L1_80)
      L1_80 = L1_78
      L1_80 = L1_80 + 1
      L1_78 = L1_80
      L1_80 = "passer_02_"
      L1_80 = L1_80 .. string.format("%02d", L1_78)
      if L1_80 ~= nil then
        L1_80 = math
        L1_80 = L1_80.random
        L1_80 = L1_80(0, 0.5)
        waitSeconds(L1_80)
        Fn_playMotionNpc("passer_02_" .. string.format("%02d", L1_78), L0_77[L0_79].name, false, {animBlendDuration = 0.3})
      else
        break
      end
      L1_80 = wait
      L1_80()
    end
  end)
end
passer_group01_animation = L0_0
function L0_0(A0_81, A1_82, A2_83)
  local L3_84, L4_85, L5_86, L6_87
  L3_84 = 0
  L4_85 = Fn_getRandamNpcType
  L5_86 = A0_81
  L4_85 = L4_85(L5_86)
  L5_86 = string
  L5_86 = L5_86.find
  L6_87 = L4_85
  L5_86 = L5_86(L6_87, "man")
  if L5_86 ~= nil then
    L3_84 = 1
  end
  L5_86 = string
  L5_86 = L5_86.find
  L6_87 = L4_85
  L5_86 = L5_86(L6_87, "wom")
  if L5_86 ~= nil then
    L3_84 = 2
  end
  L5_86 = string
  L5_86 = L5_86.find
  L6_87 = L4_85
  L5_86 = L5_86(L6_87, "chi")
  if L5_86 ~= nil then
    L3_84 = 3
  end
  L5_86 = string
  L5_86 = L5_86.find
  L6_87 = L4_85
  L5_86 = L5_86(L6_87, "kid")
  if L5_86 ~= nil then
    L3_84 = 3
  end
  if L3_84 ~= 0 then
    L5_86 = print
    L6_87 = "npc_type................"
    L6_87 = L6_87 .. L4_85
    L5_86(L6_87)
    L5_86 = Fn_loadNpcEventMotion
    L6_87 = A0_81
    L5_86(L6_87, _line_up_motion[L3_84])
    L5_86 = RandI
    L6_87 = 1
    L5_86 = L5_86(L6_87, A2_83)
    L6_87 = A1_82 % L5_86
    if L6_87 == 0 then
      A2_83 = RET_MAX
      L6_87 = math
      L6_87 = L6_87.random
      L6_87 = L6_87(1, RAC_GetTableLength(_line_up_motion[L3_84]))
      if _line_up_motion_task_tbl[A0_81] == nil then
        _line_up_motion_task_tbl[A0_81] = Sub_npc_stay_motion_task(A0_81, _line_up_motion[L3_84]["_mot" .. string.format("%02d", L6_87)])
      end
    else
      L6_87 = Fn_playMotionNpc
      L6_87(A0_81, "stay", false)
      A2_83 = A2_83 - 1
    end
  end
end
playNpcLineUpMotion = L0_0
function L0_0(A0_88, A1_89)
  return invokeTask(function()
    local L0_90
    while true do
      L0_90 = RandF
      L0_90 = L0_90(0, 3)
      Fn_playMotionNpc(A0_88, A1_89, true, {animBlendDuration = 0.3})
      Fn_playMotionNpc(A0_88, "stay", false, {animBlendDuration = 0.3})
      if L0_90 > 0 then
        waitSeconds(L0_90)
      end
    end
  end)
end
Sub_npc_stay_motion_task = L0_0
function L0_0(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100, L10_101, L11_102
  L2_93 = {}
  for L6_97 = 1, L4_95[A0_91] do
    L7_98 = PASSER_NAME_PREFIX
    L8_99 = string
    L8_99 = L8_99.format
    L9_100 = "%02d"
    L10_101 = A0_91
    L8_99 = L8_99(L9_100, L10_101)
    L9_100 = "_"
    L10_101 = string
    L10_101 = L10_101.format
    L11_102 = "%02d"
    L10_101 = L10_101(L11_102, L6_97)
    L7_98 = L7_98 .. L8_99 .. L9_100 .. L10_101
    L8_99 = Fn_findNpc
    L9_100 = L7_98
    L8_99 = L8_99(L9_100)
    L9_100 = L8_99
    L8_99 = L8_99.getActive
    L8_99 = L8_99(L9_100)
    if L8_99 == false then
      L8_99 = table
      L8_99 = L8_99.insert
      L9_100 = L2_93
      L10_101 = L6_97
      L8_99(L9_100, L10_101)
    end
  end
  for L6_97 = 1, #L2_93 do
    L7_98 = RandI
    L8_99 = L6_97
    L9_100 = #L2_93
    L7_98 = L7_98(L8_99, L9_100)
    L8_99 = PASSER_NAME_PREFIX
    L9_100 = string
    L9_100 = L9_100.format
    L10_101 = "%02d"
    L11_102 = A0_91
    L9_100 = L9_100(L10_101, L11_102)
    L10_101 = "_"
    L11_102 = string
    L11_102 = L11_102.format
    L11_102 = L11_102("%02d", L2_93[L7_98])
    L8_99 = L8_99 .. L9_100 .. L10_101 .. L11_102
    L9_100 = print
    L10_101 = L8_99
    L11_102 = " \231\148\159\230\136\144"
    L10_101 = L10_101 .. L11_102
    L9_100(L10_101)
    L9_100 = Fn_setNpcActive
    L10_101 = L8_99
    L11_102 = true
    L9_100(L10_101, L11_102)
    L9_100 = Fn_warpNpc
    L10_101 = L8_99
    L11_102 = PASSER_LOCATOR_NAME_PREFIX
    L11_102 = L11_102 .. string.format("%02d", A0_91) .. "_" .. string.format("%02d", L2_93[L7_98])
    L9_100(L10_101, L11_102)
    L9_100 = Fn_playMotionNpc
    L10_101 = L8_99
    L11_102 = "stay"
    L9_100(L10_101, L11_102, false)
    L9_100 = spawn_npc_count
    L10_101 = spawn_npc_count
    L10_101 = L10_101[A0_91]
    L10_101 = L10_101 + 1
    L9_100[A0_91] = L10_101
    if A0_91 == 3 then
      L9_100 = Fn_findNpc
      L10_101 = L8_99
      L9_100 = L9_100(L10_101)
      if L9_100 ~= nil then
        L11_102 = L9_100
        L10_101 = L9_100.isStarted
        L10_101 = L10_101(L11_102)
        if L10_101 then
          L10_101 = guests
          L11_102 = Fn_findNpcPuppet
          L11_102 = L11_102(L8_99)
          L10_101[L8_99] = L11_102
        end
      end
      L10_101 = Fn_warpNpc
      L11_102 = L8_99
      L10_101(L11_102, guest_lineup_node[L6_97])
      L11_102 = L9_100
      L10_101 = L9_100.getActive
      L10_101 = L10_101(L11_102)
      if L10_101 then
        L10_101 = guest_lineup_task
        L10_101 = L10_101[L8_99]
        if L10_101 == nil then
          L11_102 = L9_100
          L10_101 = L9_100.setStagger
          L10_101(L11_102, true)
          L10_101 = guest_lineup_task
          L11_102 = addLineup
          L11_102 = L11_102(L8_99, _g3_locator_name)
          L10_101[L8_99] = L11_102
          L10_101 = guest_lineup_task
          L10_101 = L10_101[L8_99]
          if L10_101 == nil then
            L10_101 = guest_lineup_index
            L10_101[L8_99] = 0
            L10_101 = Fn_disappearNpc
            L11_102 = L8_99
            L10_101(L11_102)
            L10_101 = guests
            L10_101[L8_99] = nil
          end
        end
      end
    end
    if A1_92 and A0_91 == 4 then
      L9_100 = findGameObject2
      L10_101 = "Node"
      L11_102 = "locator2_TV"
      L9_100 = L9_100(L10_101, L11_102)
      L10_101 = Fn_findNpc
      L11_102 = L8_99
      L10_101 = L10_101(L11_102)
      L11_102 = {}
      L11_102.degree_h = 90
      L11_102.degree_v = 45
      L11_102.in_length = 100
      L11_102.out_length = 100
      L11_102.valid = true
      L11_102.target = L9_100
      L11_102.watchTarget = true
      L10_101:setSightParam(L11_102)
      L10_101:setStagger(true)
    end
    L9_100 = playNpcLineUpMotion
    L10_101 = L8_99
    L11_102 = L6_97
    L9_100(L10_101, L11_102, _line_up_ret_max)
    L9_100 = table
    L9_100 = L9_100.insert
    L10_101 = task_dest_manager
    L11_102 = invokeCheckReceiveFlyer
    L11_102 = L11_102(A0_91, L2_93[L7_98])
    L9_100(L10_101, L11_102, L11_102(A0_91, L2_93[L7_98]))
    L9_100 = L2_93[L6_97]
    L10_101 = L2_93[L7_98]
    L2_93[L6_97] = L10_101
    L2_93[L7_98] = L9_100
  end
  return L3_94
end
respawnPasser = L0_0
function L0_0(A0_103, A1_104)
  local L2_105, L3_106, L4_107, L5_108
  L2_105[A0_103] = 0
  for L5_108 = 1, #L3_106 do
    if not findLineupIndex(L5_108) then
      print("addLineup.." .. A0_103 .. "(" .. L5_108 .. ")")
      guest_lineup_index[A0_103] = L5_108
      return invokeTask(function()
        local L0_109, L1_110, L2_111, L3_112
        L0_109 = Fn_findNpc
        L1_110 = A0_103
        L0_109 = L0_109(L1_110)
        L1_110 = 1
        L3_112 = L0_109
        L2_111 = L0_109.playMotion
        L2_111(L3_112, "stay")
        while true do
          repeat
            L2_111 = Fn_get_distance
            L3_112 = guest_lineup_node
            L3_112 = L3_112[guest_lineup_index[A0_103]]
            L3_112 = L3_112.getWorldPos
            L3_112 = L3_112(L3_112)
            L2_111 = L2_111(L3_112, Fn_findNpcPuppet(A0_103):getWorldPos())
            if L2_111 > 0.2 then
              L2_111 = _line_up_motion_task_tbl
              L3_112 = A0_103
              L2_111 = L2_111[L3_112]
              if L2_111 ~= nil then
                L2_111 = _line_up_motion_task_tbl
                L3_112 = A0_103
                L2_111 = L2_111[L3_112]
                L3_112 = L2_111
                L2_111 = L2_111.abort
                L2_111(L3_112)
                L2_111 = _line_up_motion_task_tbl
                L3_112 = A0_103
                L2_111[L3_112] = nil
              end
              L2_111 = guest_finish
              L3_112 = A0_103
              L2_111[L3_112] = RAC_invokeMoveCharaTask2(A0_103, {
                guest_lineup_node[guest_lineup_index[A0_103]]:getName()
              }, {
                arrivedLength = 0,
                runLength = 10000,
                anim_walk_speed = 1.5,
                anim_speed_over = true,
                navimesh = false,
                recast = true
              })
              while true do
                L2_111 = guest_finish
                L3_112 = A0_103
                L2_111 = L2_111[L3_112]
                if L2_111 ~= nil then
                  L2_111 = guest_finish
                  L3_112 = A0_103
                  L2_111 = L2_111[L3_112]
                  L3_112 = L2_111
                  L2_111 = L2_111.isRunning
                  L2_111 = L2_111(L3_112)
                  if not L2_111 then
                    L2_111 = guest_finish
                    L3_112 = A0_103
                    L2_111 = L2_111[L3_112]
                    L3_112 = L2_111
                    L2_111 = L2_111.abort
                    L2_111(L3_112)
                    L2_111 = guest_finish
                    L3_112 = A0_103
                    L2_111[L3_112] = nil
                    break
                  end
                end
                L2_111 = wait
                L2_111()
              end
              L2_111 = guest_lineup_index
              L3_112 = A0_103
              L2_111 = L2_111[L3_112]
              if L2_111 > 1 then
                L2_111 = Fn_turnNpc
                L3_112 = A0_103
                L2_111(L3_112, findGameObject2("Node", A1_104 .. string.format("%02d", 0)))
              end
              L2_111 = playNpcLineUpMotion
              L3_112 = A0_103
              L2_111(L3_112, L1_110, _line_up_ret_max)
              L1_110 = L1_110 + 1
            else
              L2_111 = wait
              L2_111()
            end
            L2_111 = guest_lineup_index
            L3_112 = A0_103
            L2_111 = L2_111[L3_112]
            if L2_111 ~= 1 then
              L3_112 = L0_109
              L2_111 = L0_109.turn
              L2_111(L3_112, guest_lineup_node[guest_lineup_index[A0_103] - 1])
              L2_111 = guest_lineup_index
              L3_112 = A0_103
              L2_111 = L2_111[L3_112]
              L2_111 = L2_111 - 1
              while true do
                L3_112 = findLineupIndex
                L3_112 = L3_112(L2_111)
                if not L3_112 then
                  while true do
                    wait()
                    L2_111 = L2_111 - 1
                    L3_112 = findLineupIndex(L2_111)
                    if L3_112 or L2_111 <= 0 then
                      L2_111 = L2_111 + 1
                      break
                    end
                  end
                  guest_lineup_index[A0_103] = L2_111
                  do break end
                  break
                end
                waitSeconds(0.1)
              end
            end
          until not (LINEUP_RETRY < Fn_get_distance(guest_lineup_node[guest_lineup_index[A0_103]]:getWorldPos(), guests[A0_103]:getWorldPos()))
        end
        L2_111 = print
        L3_112 = "LineupFirst.."
        L3_112 = L3_112 .. A0_103
        L2_111(L3_112)
        L3_112 = L0_109
        L2_111 = L0_109.turn
        L2_111(L3_112, findGameObject2("Node", A1_104 .. string.format("%02d", 0)))
      end)
    end
  end
  L5_108 = ")"
  L2_105(L3_106)
  return L2_105
end
addLineup = L0_0
function L0_0(A0_113, A1_114)
  local L2_115
  L2_115 = {}
  L2_115.npc_name = PASSER_NAME_PREFIX .. string.format("%02d", A0_113) .. "_" .. string.format("%02d", A1_114)
  L2_115.sensor_name = nil
  L2_115.move_task = nil
  L2_115.deactive_task = nil
  L2_115.flyer_hdl = nil
  function L2_115.update(A0_116)
    local L1_117, L2_118
    L1_117 = string
    L1_117 = L1_117.format
    L2_118 = "%02d"
    L1_117 = L1_117(L2_118, A0_113)
    L2_118 = string
    L2_118 = L2_118.format
    L2_118 = L2_118("%02d", A1_114)
    receive_flyer_flag[L1_117][L2_118] = false
    A0_116.sensor_name = PASSER_SENSOR_NAME_PREFIX .. string.format("%02d", A0_113) .. "_" .. string.format("%02d", A1_114)
    Fn_pcSensorOn(A0_116.sensor_name)
    while receive_flyer_flag[L1_117][L2_118] == false do
      wait()
    end
    Fn_findNpc(L2_115.npc_name):resetSightParam()
    if guest_lineup_task[L2_115.npc_name] ~= nil then
      print(L2_115.npc_name .. "..........addline\227\130\191\227\130\185\227\130\175\232\167\163\230\148\190")
      guest_lineup_task[L2_115.npc_name]:abort()
      guest_lineup_task[L2_115.npc_name] = nil
    end
    Fn_pcSensorOff(A0_116.sensor_name)
    A0_116.sensor_name = nil
    receive_flyer_flag[L1_117][L2_118] = false
    L1_117 = got_guest_num
    L1_117 = L1_117 + 1
    got_guest_num = L1_117
    L1_117 = spawn_npc_count
    L2_118 = A0_113
    L1_117[L2_118] = spawn_npc_count[A0_113] - 1
    L1_117 = Fn_createGimmickBg
    L2_118 = "loc_l_hand"
    L1_117 = L1_117(L2_118, "flyer_" .. string.format("%02d", A1_114), "ciflyer01_base")
    A0_116.flyer_hdl = L1_117
    L1_117 = A0_116.flyer_hdl
    L2_118 = L1_117
    L1_117 = L1_117.setCollidablePermission
    L1_117(L2_118, false)
    L1_117 = Fn_attachJoint
    L2_118 = A0_116.flyer_hdl
    L1_117(L2_118, puppet_tbl[A0_116.npc_name], "loc_l_hand")
    L1_117 = RAC_InvokeAutoDeactiveNpcTask
    L2_118 = A0_116.npc_name
    L1_117 = L1_117(L2_118, 10)
    A0_116.deactive_task = L1_117
    L1_117 = A0_116.deactive_task
    L2_118 = L1_117
    L1_117 = L1_117.isRunning
    L1_117 = L1_117(L2_118)
    if L1_117 then
      L1_117 = print
      L2_118 = A0_116.npc_name
      L2_118 = L2_118 .. ".................\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\130\191\227\130\185\227\130\175\232\167\163\230\148\190"
      L1_117(L2_118)
      L1_117 = _line_up_motion_task_tbl
      L2_118 = A0_116.npc_name
      L1_117 = L1_117[L2_118]
      if L1_117 ~= nil then
        L1_117 = _line_up_motion_task_tbl
        L2_118 = A0_116.npc_name
        L1_117 = L1_117[L2_118]
        L2_118 = L1_117
        L1_117 = L1_117.abort
        L1_117(L2_118)
        L1_117 = _line_up_motion_task_tbl
        L2_118 = A0_116.npc_name
        L1_117[L2_118] = nil
      end
      L1_117 = Fn_findNpc
      L2_118 = A0_116.npc_name
      L1_117 = L1_117(L2_118)
      while true do
        L2_118 = L1_117.isMotionEnd
        L2_118 = L2_118(L1_117)
        if L2_118 == false then
          L2_118 = A0_116.deactive_task
          L2_118 = L2_118.isRunning
          L2_118 = L2_118(L2_118)
        end
        if L2_118 then
          L2_118 = wait
          L2_118()
        end
      end
      L2_118 = guest_lineup_index
      L2_118[A0_116.npc_name] = 0
    end
    function L1_117()
      local L0_119, L1_120, L2_121, L3_122, L4_123, L5_124, L6_125, L7_126
      L0_119 = 1
      L1_120 = {}
      L2_121 = "locator2_passer_move_01"
      L3_122 = puppet_tbl
      L3_122 = L3_122[L4_123]
      L3_122 = L3_122.getWorldPos
      L3_122 = L3_122(L4_123)
      while true do
        L4_123()
        L7_126 = string
        L7_126 = L7_126.format
        L7_126 = L7_126("%02d", L0_119)
        if L4_123 ~= nil then
          L7_126 = L4_123.getWorldPos
          L7_126 = L7_126(L4_123)
          if L5_124 > 1 then
            L7_126 = L1_120
            L6_125(L7_126, {
              L5_124,
              L4_123:getName()
            })
          end
        else
          function L7_126(A0_127, A1_128)
            return A0_127[1] < A1_128[1]
          end
          L5_124(L6_125, L7_126)
          L7_126 = L5_124
          L7_126 = L1_120[L6_125]
          L2_121 = L7_126[2]
          break
        end
        L0_119 = L0_119 + 1
      end
      for L7_126, _FORV_8_ in L4_123(L5_124) do
        table.remove(L1_120, L7_126)
      end
      return L2_121
    end
    L2_118 = A0_116.deactive_task
    L2_118 = L2_118.isRunning
    L2_118 = L2_118(L2_118)
    if L2_118 then
      L2_118 = L1_117
      L2_118 = L2_118()
      if L2_118 ~= nil then
        print("\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\130\191\227\130\185\227\130\175\232\167\163\230\148\190")
        if _line_up_motion_task_tbl[A0_116.npc_name] ~= nil then
          _line_up_motion_task_tbl[A0_116.npc_name]:abort()
          _line_up_motion_task_tbl[A0_116.npc_name] = nil
        end
        A0_116.move_task = Fn_moveNpc(A0_116.npc_name, L2_118, {runLength = 1000000, recast = true})
      end
      while A0_116.deactive_task:isRunning() do
        if A0_116.move_task ~= nil and A0_116.move_task:isRunning() == false then
          L2_118 = L1_117()
          A0_116.move_task = Fn_moveNpc(A0_116.npc_name, L2_118, {runLength = 1000000, recast = true})
        end
        wait()
      end
      if A0_116.move_task ~= nil then
        A0_116.move_task:abort()
        A0_116.move_task = nil
      end
      RAC_stopNpcMoveTask(A0_116.npc_name)
    end
    L2_118 = A0_116.deactive_task
    L2_118 = L2_118.abort
    L2_118(L2_118)
    A0_116.deactive_task = nil
    L2_118 = A0_116.flyer_hdl
    L2_118 = L2_118.kill
    L2_118(L2_118)
    A0_116.flyer_hdl = nil
    L2_118 = print
    L2_118(A0_116.npc_name .. " \231\160\180\230\163\132")
  end
  function L2_115.destractor(A0_129)
    if A0_129.sensor_name ~= nil then
      Fn_pcSensorOff(A0_129.sensor_name)
      receive_flyer_flag[string.format("%02d", A0_113)][string.format("%02d", A1_114)] = false
      A0_129.sensor_name = nil
    end
    if A0_129.move_task ~= nil then
      A0_129.move_task:abort()
      A0_129.move_task = nil
      RAC_stopNpcMoveTask(A0_129.npc_name)
    end
    if A0_129.deactive_task ~= nil then
      A0_129.deactive_task:abort()
      A0_129.deactive_task = nil
    end
    if A0_129.flyer_hdl ~= nil then
      A0_129.flyer_hdl:kill()
      A0_129.flyer_hdl = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L2_115.update, L2_115.destractor, L2_115)
end
invokeCheckReceiveFlyer = L0_0
function L0_0(A0_130)
  for _FORV_4_, _FORV_5_ in pairs(guest_lineup_index) do
    if A0_130 == guest_lineup_index[_FORV_4_] then
      return true
    end
  end
  return false
end
findLineupIndex = L0_0
function L0_0(A0_131, A1_132, A2_133, A3_134, A4_135, A5_136)
  local L6_137
  L6_137 = createGameObject2
  L6_137 = L6_137("PlayerSensor")
  L6_137:setName(A0_131)
  L6_137:setDetectBehavior(1)
  L6_137:addBox(A2_133)
  L6_137:setPos(A1_132)
  L6_137:setOnEnter(A3_134 ~= nil and A3_134 or A0_131 .. "_OnEnter")
  L6_137:setOnLeave(A4_135 ~= nil and A4_135 or A0_131 .. "_OnLeave")
  L6_137:try_init()
  L6_137:waitForReady()
  L6_137:try_start()
  if A5_136 ~= nil then
    A5_136:appendChild(L6_137)
  end
  return L6_137
end
createPcCubeSensor = L0_0
function L0_0(A0_138)
  local L1_139
  L1_139 = A0_138.getName
  L1_139 = L1_139(A0_138)
  receive_flyer_flag[string.sub(L1_139, -5, -4)][string.sub(L1_139, -2)] = true
end
pccubesensor2_passer_xx_xx_OnEnter = L0_0
function L0_0(A0_140)
  local L1_141
  L1_141 = A0_140.getName
  L1_141 = L1_141(A0_140)
  receive_flyer_flag[string.sub(L1_141, -5, -4)][string.sub(L1_141, -2)] = false
end
pccubesensor2_passer_xx_xx_OnLeave = L0_0
function L0_0(A0_142)
  is_in_sensor = true
  Fn_pcSensorOff(A0_142:getName())
  RAC_MultiNaviDel("locator2_navi_group_02")
end
pccubesensor2_group_02_OnEnter = L0_0
function L0_0(A0_143)
  local L1_144
  is_in_sensor = false
end
pccubesensor2_group_02_OnLeave = L0_0
function L0_0(A0_145)
  is_in_sensor = true
  Fn_pcSensorOff(A0_145:getName())
  RAC_MultiNaviDel("locator2_navi_group_03")
end
pccubesensor2_group_03_OnEnter = L0_0
function L0_0(A0_146)
  local L1_147
  is_in_sensor = false
end
pccubesensor2_group_03_OnLeave = L0_0
function L0_0(A0_148)
  is_in_sensor = true
  Fn_pcSensorOff(A0_148:getName())
  RAC_MultiNaviDel("locator2_navi_group2_03")
end
pccubesensor2_group2_03_OnEnter = L0_0
function L0_0(A0_149)
  local L1_150
  is_in_sensor = false
end
pccubesensor2_group2_03_OnLeave = L0_0
function L0_0(A0_151)
  is_in_sensor = true
  Fn_pcSensorOff(A0_151:getName())
  RAC_MultiNaviDel("locator2_navi_group_04")
end
pccubesensor2_group_04_OnEnter = L0_0
function L0_0(A0_152)
  local L1_153
  is_in_sensor = false
end
pccubesensor2_group_04_OnLeave = L0_0
