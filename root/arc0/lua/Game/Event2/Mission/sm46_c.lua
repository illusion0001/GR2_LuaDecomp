dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm46_common.lua")
WORKER_PART_MAX = 5
WORKER_BT_TALK_CHARA = 6
WORKER_END_TALK_CHARA = 4
TYPE_VGEM = 5
TYPE_EGEM = 4
VGEM_MAX = 2
EGEM_MAX = 2
_WORK_MOTION = {
  count_00 = "man01_count_00",
  count_01 = "man01_count_01",
  guide_00 = "man01_guide_00"
}
_puppet_tbl = {}
_gesture = nil
_decide_flag = false
_ges_cancel_flag = false
_ges_break_flag = false
_npc_atari_flag = false
_npc_se_hdl = nil
_npc_kaiwa_table = {
  no_wom45 = {
    cnt = 0,
    kaiwa = "sm46_01500k",
    answer = false
  },
  no_man08 = {
    cnt = 0,
    kaiwa = "sm46_01510k",
    answer = false
  },
  yes_wom03 = {
    cnt = 0,
    kaiwa = "sm46_01520k",
    answer = true
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    {
      name = "worker04",
      type = "man08",
      node = "locator2_worker04_c_01",
      reset = false
    },
    {
      name = "worker05",
      type = "man02",
      node = "locator2_worker05_c_01",
      reset = false
    },
    {
      name = "worker06",
      type = "man09",
      node = "locator2_worker06_c_01",
      reset = false
    },
    {
      name = "worker07",
      type = "man10",
      node = "locator2_worker07_c_01",
      reset = false
    },
    {
      name = "worker08",
      type = "man25",
      node = "locator2_worker08_c_01",
      reset = false
    }
  }
  L1_1 = {}
  L1_1.name = "fa01"
  L1_1.type = "man07"
  L1_1.node = "locator2_fa_start_c_01"
  L1_1.reset = false
  L2_2.name = "son01"
  L2_2.type = "man83"
  L2_2.node = "locator2_son_start_c_01"
  L2_2.reset = false
  L3_3.name = "worker01"
  L3_3.type = "man10"
  L3_3.node = "locator2_worker01_c_01"
  L3_3.reset = false
  L4_4.name = "worker02"
  L4_4.type = "man25"
  L4_4.node = "locator2_worker02_c_01"
  L4_4.reset = false
  L5_5 = {}
  L5_5.name = "worker03"
  L5_5.type = "man26"
  L5_5.node = "locator2_worker03_c_01"
  L5_5.reset = false
  L1_1 = Fn_findNpc
  L1_1 = L1_1(L2_2)
  L2_2(L3_3)
  for L5_5, _FORV_6_ in L2_2(L3_3) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  fa_npc = L2_2
  son_npc = L2_2
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3)
  _sdemo_cut01 = L2_2
  L2_2(L3_3, L4_4)
  L2_2(L3_3)
  for L5_5 = 1, WORKER_MAX do
    Fn_loadNpcEventMotion("worker" .. string.format("%02d", L5_5), _MOTION_LIST)
  end
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15
  L0_6 = Mob
  L0_6 = L0_6.makeSituationPanic
  L0_6(L1_7, L2_8)
  L0_6 = Fn_sendEventComSb
  L0_6 = L0_6(L1_7, L2_8)
  if L0_6 == false then
    L0_6 = Fn_sendEventComSb
    L0_6(L1_7, L2_8)
    while true do
      L0_6 = Fn_sendEventComSb
      L0_6 = L0_6(L1_7)
      if L0_6 == false then
        L0_6 = wait
        L0_6()
      end
    end
    L0_6 = Fn_sendEventComSb
    L0_6(L1_7, L2_8)
  end
  L0_6 = {}
  for L4_10 = 1, EGEM_MAX do
    L9_15 = L4_10
    L0_6[L4_10] = L5_11
  end
  for L6_12 = 1, WORKER_MAX do
    function L9_15()
      L7_13[L6_12] = Fn_findNpc("worker" .. string.format("%02d", L6_12))
      while L7_13[L6_12]:isMoveEnd() == false do
        wait()
      end
      Fn_playMotionNpc("worker" .. string.format("%02d", L6_12), L1_7[L6_12 % 2 * 2 + 1], true)
      Fn_playMotionNpc("worker" .. string.format("%02d", L6_12), L1_7[L6_12 % 2 * 2 + 2], false)
    end
    L2_8[L6_12] = L8_14
    do break end
    break
  end
  L4_10()
  L4_10(L5_11)
  L4_10(L5_11)
  L4_10(L5_11)
  L4_10()
  L4_10(L5_11)
  while true do
    if L4_10 == false then
      L4_10()
    end
  end
  L4_10(L5_11, L6_12)
  L4_10()
  L4_10(L5_11)
  L4_10(L5_11)
  L4_10(L5_11)
  L4_10()
  L4_10()
  for L7_13 = 1, WORKER_MAX do
    L9_15 = L2_8[L7_13]
    L2_8[L7_13] = L8_14
  end
  L4_10(L5_11, L6_12)
  loop_motion_son = L4_10
  loop_motion = L4_10
  fa_loop_motion = L4_10
  L4_10(L5_11, L6_12)
  for L8_14 = 1, VGEM_MAX do
    L9_15 = findGameObject2
    L9_15 = L9_15("Node", "gem2_vital_" .. string.format("%02d", L8_14))
    L4_10[L8_14] = L9_15
    L9_15 = L4_10[L8_14]
    if L9_15 ~= nil then
      L9_15 = L4_10[L8_14]
      L9_15 = L9_15.setActive
      L9_15(L9_15, false)
    end
  end
  for L8_14 = 1, EGEM_MAX do
    L9_15 = L0_6[L8_14]
    L9_15 = L9_15.setActive
    L9_15(L9_15, false)
  end
  L5_11(L6_12, L7_13)
  L5_11(L6_12, L7_13)
  L5_11(L6_12)
  for L8_14 = 1, WORKER_MAX do
    L9_15 = Fn_warpNpc
    L9_15("worker" .. string.format("%02d", L8_14), "locator2_worker_escape_" .. string.format("%02d", L8_14))
  end
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12)
  L5_11(L6_12, L7_13)
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12, L7_13)
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12, L7_13, L8_14)
  L5_11(L6_12)
  L5_11(L6_12)
  L5_11(L6_12)
  L5_11()
  for L9_15 = 1, BT_BOX_MAX do
    L5_11[L9_15] = findGameObject2("Node", "bg2_bt_box_" .. string.format("%02d", L9_15))
    L5_11[L9_15]:requestBreak(L5_11[L9_15]:getWorldPos(), 0)
  end
  L6_12()
  L6_12()
  L6_12()
end
function Finalize()
  local L0_16, L1_17, L2_18, L3_19
  for L3_19 = 1, WORKER_MAX do
    Fn_disappearNpc("worker" .. string.format("%02d", L3_19))
  end
  L0_16(L1_17)
end
function pccubesensor2_battle_catwarp_warning_01_OnLeave()
  comCatWarpWarning("sm46_02009", "locator2_battle_warning_navi_01")
end
function pccubesensor2_battle_catwarp_warning_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_battle_catwarp_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
