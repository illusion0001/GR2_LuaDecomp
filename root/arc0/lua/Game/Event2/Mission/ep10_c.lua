dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep10_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
import("math")
import("DebugDraw")
_puppet_tbl = {}
_soldierInstance = {}
_soldierName = {}
_npcTable = {}
_soldier_max = 26
_mission_phase = 0
_selected_branch = 0
_sensor_max = 14
_hint1_kaiwa = false
_hint2_kaiwa = false
_hint3_kaiwa = false
_kaiwa_skip_flag = false
_kaiwa_task = nil
_kaiwa_skip_task = nil
_view_control_task = nil
_kaiwademo1 = false
_landing_wait_task = nil
_branch_select_phase = false
_branch_goal_OnEnter = false
_branch_incorrect_01_OnEnter = false
_branch_incorrect_02_OnEnter = false
_npc_damaged = false
_puppet_crow = nil
_brain_crow = nil
_crow_speed_task = nil
_crow_process_task = nil
_crow_move_bridge = false
_sol_motion_list = {
  talk_00 = "man57_talk_00",
  talk_01 = "man57_talk_01",
  lookaround = "man57_lookaround_00",
  rifle_push = "man57_rifle_push_00"
}
_sdemo_cut01 = nil
_kaiwademo_replay = false
_playing_detect_sis_and_cid_seq = false
_mechskytask = nil
_detected_soldier = false
_detected_on_sensor = false
_restart_warship = false
_PHASE = {
  BATTLE01 = 1,
  BATTLE02 = 2,
  BATTLE03 = 3,
  BRANCH = 4,
  EXAMINE = 5,
  CLEAR = 6
}
_BRANCH = {
  GOAL = 1,
  INCORRECT01 = 2,
  INCORRECT02 = 3
}
enmgen2_mechsmall = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator2_watch_21",
      name = "mechsmall01"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_22",
      name = "mechsmall02"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_28",
      name = "mechsmall03"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_36",
      name = "mechsmall04"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_37",
      name = "mechsmall05"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_44",
      name = "mechsmall06"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_45",
      name = "mechsmall07"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_46",
      name = "mechsmall08"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_47",
      name = "mechsmall09"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_48",
      name = "mechsmall10"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_49",
      name = "mechsmall11"
    },
    {
      type = "mechsmall",
      locator = "locator2_watch_50",
      name = "mechsmall12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_21",
      name = "sol_21",
      target_vehicle = "mechsmall01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_22",
      name = "sol_22",
      target_vehicle = "mechsmall02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_33",
      name = "sol_33",
      target_vehicle = "mechsmall03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_36",
      name = "sol_36",
      target_vehicle = "mechsmall04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_37",
      name = "sol_37",
      target_vehicle = "mechsmall05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_44",
      name = "sol_44",
      target_vehicle = "mechsmall06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_45",
      name = "sol_45",
      target_vehicle = "mechsmall07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_46",
      name = "sol_46",
      target_vehicle = "mechsmall08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_47",
      name = "sol_47",
      target_vehicle = "mechsmall09"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_48",
      name = "sol_48",
      target_vehicle = "mechsmall10"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_49",
      name = "sol_49",
      target_vehicle = "mechsmall11"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sol_50",
      name = "sol_50",
      target_vehicle = "mechsmall12"
    }
  }
}
enmgen2_mechsky = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_01",
      name = "mechsky01"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_02",
      name = "mechsky02"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_03",
      name = "mechsky03"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_04",
      name = "mechsky04"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_05",
      name = "mechsky05"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_06",
      name = "mechsky06"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_07",
      name = "mechsky07"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_08",
      name = "mechsky08"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_09",
      name = "mechsky09"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_10",
      name = "mechsky10"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_11",
      name = "mechsky11"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_12_move01",
      name = "mechsky12"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_13",
      name = "mechsky13"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_14",
      name = "mechsky14"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_15",
      name = "mechsky15"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_16",
      name = "mechsky16"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_01",
      name = "mechsky_sol01",
      target_vehicle = "mechsky01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_02",
      name = "mechsky_sol02",
      target_vehicle = "mechsky02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_03",
      name = "mechsky_sol03",
      target_vehicle = "mechsky03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_04",
      name = "mechsky_sol04",
      target_vehicle = "mechsky04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_05",
      name = "mechsky_sol05",
      target_vehicle = "mechsky05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_06",
      name = "mechsky_sol06",
      target_vehicle = "mechsky06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_07",
      name = "mechsky_sol07",
      target_vehicle = "mechsky07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_08",
      name = "mechsky_sol08",
      target_vehicle = "mechsky08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_09",
      name = "mechsky_sol09",
      target_vehicle = "mechsky09"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_10",
      name = "mechsky_sol10",
      target_vehicle = "mechsky10"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_11",
      name = "mechsky_sol11",
      target_vehicle = "mechsky11"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_12_move01",
      name = "mechsky_sol12",
      target_vehicle = "mechsky12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_13",
      name = "mechsky_sol13",
      target_vehicle = "mechsky13"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_14",
      name = "mechsky_sol14",
      target_vehicle = "mechsky14"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_15",
      name = "mechsky_sol15",
      target_vehicle = "mechsky15"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_16",
      name = "mechsky_sol16",
      target_vehicle = "mechsky16"
    }
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0(L1_1, L2_2)
  for L3_3 = 1, _soldier_max do
    Fn_loadNpcEventMotion("npcgen2_soldier_" .. string.format("%02d", L3_3), _sol_motion_list)
  end
  L0_0()
  L0_0()
  L1_1.name = "hst01"
  L1_1.type = "man36"
  L1_1.node = "locator2_hostage_01"
  L2_2.name = "hst02"
  L2_2.type = "chi11"
  L2_2.node = "locator2_hostage_02"
  L3_3.name = "hst03"
  L3_3.type = "chi12"
  L3_3.node = "locator2_hostage_03"
  L1_1(L2_2)
  for _FORV_4_, _FORV_5_ in L1_1(L2_2) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = L1_1
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20
  L0_4 = Fn_findNpc
  L1_5 = "cid01"
  L0_4 = L0_4(L1_5)
  if L0_4 then
    L2_6 = L0_4
    L1_5 = L0_4.ignoreStoop
    L1_5(L2_6)
  end
  L1_5 = Fn_findNpc
  L2_6 = "sis01"
  L1_5 = L1_5(L2_6)
  if L1_5 then
    L2_6 = L1_5.ignoreStoop
    L2_6(L3_7)
  end
  L2_6 = detectWarship
  L2_6()
  L2_6 = chackMonumentBroken
  L2_6()
  L2_6 = setVeCreanAreaGroup
  L2_6()
  L2_6 = Fn_disappearNpc
  L2_6(L3_7, L4_8)
  L2_6 = Fn_setNpcVisible
  L2_6(L3_7, L4_8)
  L2_6 = invokeTask
  L2_6(L3_7)
  L2_6 = {}
  for L6_10 = 1, 16 do
    L7_11 = findGameObject2
    L8_12 = "EnemyBrain"
    L9_13 = "mechsky"
    L10_14 = string
    L10_14 = L10_14.format
    L11_15 = "%02d"
    L10_14 = L10_14(L11_15, L12_16)
    L9_13 = L9_13 .. L10_14
    L7_11 = L7_11(L8_12, L9_13)
    L2_6[L6_10] = L7_11
    L7_11 = L2_6[L6_10]
    L8_12 = L7_11
    L7_11 = L7_11.setEnableHomingTarget
    L9_13 = false
    L7_11(L8_12, L9_13)
    L7_11 = L2_6[L6_10]
    L8_12 = L7_11
    L7_11 = L7_11.setVisibleEnemyMarker
    L9_13 = false
    L7_11(L8_12, L9_13)
  end
  for L7_11 = 1, 12 do
    L8_12 = findGameObject2
    L9_13 = "EnemyBrain"
    L10_14 = "mechsmall"
    L11_15 = string
    L11_15 = L11_15.format
    L11_15 = L11_15(L12_16, L13_17)
    L10_14 = L10_14 .. L11_15
    L8_12 = L8_12(L9_13, L10_14)
    L3_7[L7_11] = L8_12
    L8_12 = L3_7[L7_11]
    L9_13 = L8_12
    L8_12 = L8_12.setEnableHomingTarget
    L10_14 = false
    L8_12(L9_13, L10_14)
    L8_12 = L3_7[L7_11]
    L9_13 = L8_12
    L8_12 = L8_12.setVisibleEnemyMarker
    L10_14 = false
    L8_12(L9_13, L10_14)
  end
  _puppet_crow = L4_8
  _brain_crow = L4_8
  L7_11 = "Node"
  L8_12 = "locator2_crow_02"
  L7_11 = L6_10
  L15_19 = L6_10(L7_11)
  L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L6_10(L7_11))
  L4_8(L5_9)
  L7_11 = false
  L4_8(L5_9, L6_10, L7_11)
  _enmgen_mechsmall = L4_8
  _enmgen_mechsky = L4_8
  L4_8(L5_9, L6_10)
  L4_8(L5_9, L6_10)
  L4_8()
  L4_8.isRepeat = true
  L7_11 = "talk_00"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_03"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_00"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_01"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_00"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_01"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_00"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  L7_11 = "talk_01"
  L8_12 = false
  L9_13 = L4_8
  L5_9(L6_10, L7_11, L8_12, L9_13)
  _mission_phase = L5_9
  L5_9()
  L5_9()
  L5_9(L6_10)
  L5_9()
  L5_9(L6_10)
  L5_9(L6_10)
  L7_11 = "Node"
  L8_12 = "locator2_navi_07"
  L15_19 = L6_10(L7_11, L8_12)
  L5_9(L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L6_10(L7_11, L8_12))
  L5_9(L6_10)
  _crow_process_task = L5_9
  L5_9()
  L5_9(L6_10)
  L7_11 = "locator2_kaiwapoint_01"
  L7_11 = "Node"
  L8_12 = "locator2_kaiwapoint_02"
  L7_11 = findGameObject2
  L8_12 = "Node"
  L9_13 = "locator2_kaiwapoint_03"
  L7_11 = L7_11(L8_12, L9_13)
  L8_12 = findGameObject2
  L9_13 = "Node"
  L10_14 = "locator2_navi_07"
  L8_12 = L8_12(L9_13, L10_14)
  L10_14 = L8_12
  L9_13 = L8_12.getWorldTransform
  L10_14 = L9_13(L10_14)
  L11_15 = {
    L12_16,
    L13_17,
    L14_18,
    L15_19,
    L16_20
  }
  L12_16.pos = L13_17
  L12_16.action = L13_17
  L12_16.vel = 25
  L15_19 = L14_18
  L13_17.pos = L14_18
  L13_17.action = L14_18
  L13_17.vel = 25
  L15_19 = findGameObject2
  L15_19 = L15_19(L16_20, "locator2_crow_movepoints_00_02")
  L15_19 = L15_19.getWorldPos
  L15_19 = L15_19(L16_20)
  L14_18.pos = L15_19
  L15_19 = Supporter
  L15_19 = L15_19.MovePoint
  L15_19 = L15_19.Air
  L14_18.action = L15_19
  L14_18.vel = 25
  L15_19 = {}
  L15_19.pos = L16_20
  L15_19.action = L16_20
  L15_19.vel = 25
  L16_20.pos = findGameObject2("Node", "locator2_crow_movepoints_00_03"):getWorldPos()
  L16_20.action = Supporter.MovePoint.Idle
  L12_16(L13_17, L14_18)
  L12_16(L13_17)
  L12_16(L13_17)
  while true do
    if L12_16 ~= L13_17 then
    end
    if L12_16 ~= L13_17 then
      if L12_16 < 10 then
        if L12_16 == false then
          L12_16()
        end
      end
      if L12_16 < 10 then
        if L12_16 == false then
          L12_16()
        end
      end
      if L12_16 < 10 then
        if L12_16 == false then
          L12_16()
        end
      end
      L12_16()
    end
  end
  if L12_16 ~= L13_17 then
    if L12_16 ~= nil then
      L12_16(L13_17)
      _crow_process_task = nil
    end
    L12_16(L13_17, L14_18)
    L12_16()
    L12_16()
    L12_16()
    L12_16(L13_17)
    L15_19 = L14_18
    L14_18(L15_19, L16_20, L13_17)
    L14_18()
    L14_18()
    L15_19 = _soldierInstance
    L15_19 = L15_19[25]
    L15_19 = L15_19.npcName
    L14_18(L15_19, L16_20)
    L15_19 = _soldierInstance
    L15_19 = L15_19[26]
    L15_19 = L15_19.npcName
    L14_18(L15_19, L16_20)
    function L15_19()
      Fn_playMotionNpc(_soldierInstance[25].npcName, _sol_motion_list.rifle_push, false)
      waitSeconds(1)
      Fn_playMotionNpc(_soldierInstance[26].npcName, _sol_motion_list.rifle_push, false)
    end
    L14_18(L15_19)
    L14_18()
    L14_18()
    L15_19 = L14_18
    L14_18(L15_19, L16_20, false, 0, true, false)
    L15_19 = L14_18
    L14_18(L15_19, L16_20)
    L14_18()
    L15_19 = L14_18
    L14_18(L15_19, L16_20)
    L15_19 = L14_18
    L14_18(L15_19)
    L15_19 = _soldierName
    L15_19 = L15_19[25]
    L15_19 = {
      L16_20,
      {
        pos = _puppet_crow:getWorldPos(),
        action = Supporter.MovePoint.Air,
        vel = 20
      },
      {
        pos = findGameObject2("Node", "locator2_crow_movepoints_attack_07_01"):getWorldPos(),
        action = Supporter.MovePoint.Air,
        vel = 20
      },
      {
        pos = findGameObject2("Node", "locator2_crow_movepoints_attack_07_02"):getWorldPos(),
        action = Supporter.MovePoint.Air,
        vel = 20
      },
      {
        pos = findGameObject2("Node", "locator2_crow_movepoints_attack_07_02"):getWorldPos(),
        action = Supporter.MovePoint.Turn,
        duraion = 0.1,
        node_lookat = L14_18
      }
    }
    L16_20.pos = _puppet_crow:getWorldPos()
    L16_20.action = Supporter.MovePoint.Takeoff
    L16_20.vel = 20
    L16_20(L16_20)
    L16_20(L16_20, L15_19)
    L16_20(L16_20)
    L16_20(25, 26)
    L16_20(26, 25)
    _playing_detect_sis_and_cid_seq = false
    L16_20("\226\150\160\226\150\160\226\150\160\226\150\160\226\150\160\226\150\160\227\130\183\227\130\183\227\130\163\227\129\168\227\130\183\227\131\137\227\131\188\231\153\186\232\166\139\227\130\183\227\131\188\227\130\177\227\131\179\227\130\185\231\181\130\228\186\134")
    for _FORV_19_ = 1, _soldier_max do
      _soldierInstance[_FORV_19_]:setSightParam(60, 20)
      _soldierInstance[_FORV_19_]:setIndicationEnable(true)
    end
    while true do
      if L16_20 then
        L16_20(L16_20)
        L16_20("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:\229\186\131\229\160\180\229\137\141\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167")
        break
      end
      L16_20()
    end
    setCrowAttack(true, L16_20)
    print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[25]")
    print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[26]")
  end
  while true do
    if L12_16 ~= L13_17 then
      L12_16()
    end
  end
  L15_19 = true
  L12_16(L13_17, L14_18, L15_19, L16_20, true, true)
  L12_16()
  for L15_19 = 1, #L13_17 do
    L16_20.status = NPC_STATUS.TERMINATE
    L16_20(L16_20)
    L16_20.task = nil
  end
  L12_16(L13_17)
  L12_16(L13_17)
  L12_16(L13_17)
  L12_16()
  L12_16()
  L12_16()
  L12_16()
end
function Finalize()
  local L0_21, L1_22, L2_23, L3_24
  for L3_24 = 1, 6 do
    Fn_disappearNpc("hst0" .. L3_24)
  end
  L0_21()
  if L0_21 then
    L0_21(L1_22, L2_23)
    _sehandle = nil
  end
end
function pccubesensor2_01_OnEnter()
  invokeTask(function()
    local L0_25
    L0_25 = findGameObject2
    L0_25 = L0_25("Node", "locator2_viewpoint_01")
    Fn_captionViewWait("ep10_01003")
    wait(20)
    Fn_lookAtObject(L0_25):abort()
    crow_setMovePoints_bridge()
    _crow_move_bridge = true
    Fn_pcSensorOff("pccubesensor2_01")
  end)
end
function pccubesensor2_branch_goal_OnEnter(A0_26)
  local L1_27, L2_28
  L1_27 = _branch_select_phase
  if L1_27 == false then
    L1_27 = _BRANCH
    L1_27 = L1_27.GOAL
    _selected_branch = L1_27
    return
  end
  L1_27 = _branch_goal_OnEnter
  if L1_27 == true then
    return
  end
  L1_27 = print
  L2_28 = "\229\136\134\227\129\139\227\130\140\233\129\147\227\129\167\231\183\143\231\157\163\229\186\156\227\129\184\227\129\174\233\129\147\227\130\146\233\129\184\230\138\158\227\129\151\227\129\159"
  L1_27(L2_28)
  L1_27 = _branch_incorrect_01_OnEnter
  if L1_27 ~= true then
    L1_27 = _branch_incorrect_02_OnEnter
  elseif L1_27 == true then
    L1_27 = findGameObject2
    L2_28 = "Node"
    L1_27 = L1_27(L2_28, "locator2_crow_movepoints_08")
    L2_28 = {}
    L2_28.node_posrot = L1_27
    L2_28.forced = true
    _brain_crow:startWarpAction(L2_28)
  end
  L1_27 = _crow_process_task
  if L1_27 ~= nil then
    L1_27 = _crow_process_task
    L2_28 = L1_27
    L1_27 = L1_27.abort
    L1_27(L2_28)
    _crow_process_task = nil
  end
  L1_27 = invokeTask
  function L2_28()
    crow_process_branch_goal()
  end
  L1_27 = L1_27(L2_28)
  _crow_process_task = L1_27
end
function pccubesensor2_branch_incorrect_01_OnEnter(A0_29)
  local L1_30, L2_31
  L1_30 = _branch_select_phase
  if L1_30 == false then
    L1_30 = _BRANCH
    L1_30 = L1_30.INCORRECT01
    _selected_branch = L1_30
    return
  end
  L1_30 = _branch_incorrect_01_OnEnter
  if L1_30 == true then
    return
  end
  L1_30 = print
  L2_31 = "\229\136\134\227\129\139\227\130\140\233\129\147\227\129\167\231\183\143\231\157\163\229\186\156\227\129\184\227\129\174\233\129\147\227\129\168\227\129\175\233\128\134\229\129\180\227\129\174\233\129\147\227\130\146\233\129\184\230\138\158\227\129\151\227\129\159"
  L1_30(L2_31)
  L1_30 = _branch_goal_OnEnter
  if L1_30 ~= true then
    L1_30 = _branch_incorrect_02_OnEnter
  elseif L1_30 == true then
    L1_30 = findGameObject2
    L2_31 = "Node"
    L1_30 = L1_30(L2_31, "locator2_crow_movepoints_08")
    L2_31 = {}
    L2_31.node_posrot = L1_30
    L2_31.forced = true
    _brain_crow:startWarpAction(L2_31)
  end
  L1_30 = _crow_process_task
  if L1_30 ~= nil then
    L1_30 = _crow_process_task
    L2_31 = L1_30
    L1_30 = L1_30.abort
    L1_30(L2_31)
    _crow_process_task = nil
  end
  L1_30 = invokeTask
  function L2_31()
    crow_process_branch_incorrect_01()
  end
  L1_30 = L1_30(L2_31)
  _crow_process_task = L1_30
end
function pccubesensor2_branch_incorrect_02_OnEnter(A0_32)
  local L1_33, L2_34
  L1_33 = _branch_select_phase
  if L1_33 == false then
    L1_33 = _BRANCH
    L1_33 = L1_33.INCORRECT02
    _selected_branch = L1_33
    return
  end
  L1_33 = _branch_incorrect_02_OnEnter
  if L1_33 == true then
    return
  end
  L1_33 = print
  L2_34 = "\229\136\134\227\129\139\227\130\140\233\129\147\227\129\167\231\183\143\231\157\163\229\186\156\227\129\184\227\129\174\233\129\147\227\129\168\227\129\175\233\128\134\229\129\180\227\129\174\233\129\147\227\130\146\233\129\184\230\138\158\227\129\151\227\129\159"
  L1_33(L2_34)
  L1_33 = _branch_goal_OnEnter
  if L1_33 ~= true then
    L1_33 = _branch_incorrect_01_OnEnter
  elseif L1_33 == true then
    L1_33 = findGameObject2
    L2_34 = "Node"
    L1_33 = L1_33(L2_34, "locator2_crow_movepoints_08")
    L2_34 = {}
    L2_34.node_posrot = L1_33
    L2_34.forced = true
    _brain_crow:startWarpAction(L2_34)
  end
  L1_33 = _crow_process_task
  if L1_33 ~= nil then
    L1_33 = _crow_process_task
    L2_34 = L1_33
    L1_33 = L1_33.abort
    L1_33(L2_34)
    _crow_process_task = nil
  end
  L1_33 = invokeTask
  function L2_34()
    crow_process_branch_incorrect_02()
  end
  L1_33 = L1_33(L2_34)
  _crow_process_task = L1_33
end
function pccubesensor2_02_OnEnter(A0_35)
  print("pccubesensor2_02_OnEnter")
  print(_detected_soldier)
  print(_detected_on_sensor)
  if _detected_soldier == false and _detected_on_sensor == false and _begin_combat == false and _soldierInstance[25].status == NPC_STATUS.NORMAL and _soldierInstance[26].status == NPC_STATUS.NORMAL then
    invokeTask(function()
      print("\226\150\160\226\150\160\226\150\160\226\150\160\226\150\160\226\150\160\227\130\183\227\130\183\227\130\163\227\129\168\227\130\183\227\131\137\227\131\188\231\153\186\232\166\139\227\130\183\227\131\188\227\130\177\227\131\179\227\130\185\233\150\139\229\167\139")
      for _FORV_3_ = 1, _soldier_max do
        _soldierInstance[_FORV_3_]:setSightParam(0, 0)
        _soldierInstance[_FORV_3_]:setIndicationEnable(false)
      end
      _playing_detect_sis_and_cid_seq = true
      Fn_naviKill()
      Fn_pcSensorOff(A0_35)
      _mission_phase = _PHASE.EXAMINE
      drawCautionLevel()
    end)
  end
end
function pccubesensor2_03_OnEnter(A0_36)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_03_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky03"))
  detected_enemy_move("mechsky03", 0.5)
  detected_enemy_move("mechsky14", 0.7)
  detected_enemy_move("mechsky15", 1)
end
function pccubesensor2_04_OnEnter(A0_37)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_04_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky12"))
  detected_enemy_move("mechsky12", 0.5)
  detected_enemy_move("mechsky11", 0.8)
end
function pccubesensor2_05_OnEnter(A0_38)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_05_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky04"))
  detected_enemy_move("mechsky04", 0.5)
  detected_enemy_move("mechsky05", 0.7)
end
function pccubesensor2_06_OnEnter(A0_39)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_06_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky01"))
  detected_enemy_move("mechsky01", 0.5)
  detected_enemy_move("mechsky02", 0.7)
end
function pccubesensor2_06_02_OnEnter(A0_40)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_06_02_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky01"))
  detected_enemy_move("mechsky01", 0.5)
  detected_enemy_move("mechsky02", 0.8)
end
function pccubesensor2_07_OnEnter(A0_41)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_07_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky16"))
  detected_enemy_move("mechsky16", 0.5)
  detected_enemy_move("mechsky06", 0.9)
end
function pccubesensor2_08_OnEnter(A0_42)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_08_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky14"))
  detected_enemy_move("mechsky14", 0.5)
  detected_enemy_move("mechsky15", 0.7)
  detected_enemy_move("mechsky03", 0.9)
end
function pccubesensor2_09_OnEnter(A0_43)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_09_OnEnter:\230\169\159\230\162\176\229\133\181\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsmall03"))
  detected_enemy_move("mechsmall03", 0.5)
end
function pccubesensor2_10_OnEnter(A0_44)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_10_OnEnter:\230\169\159\230\162\176\229\133\181\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsmall02"))
  detected_enemy_move("mechsmall02", 0.5)
end
function pccubesensor2_11_OnEnter(A0_45)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_11_OnEnter:\230\169\159\230\162\176\229\133\181\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsmall02"))
  detected_enemy_move("mechsmall02", 0.5)
end
function pccubesensor2_12_OnEnter(A0_46)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_12_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky03"))
  detected_enemy_move("mechsky03", 0.5)
  detected_enemy_move("mechsky14", 0.8)
  detected_enemy_move("mechsky15", 0.9)
end
function pccubesensor2_13_OnEnter(A0_47)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_13_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky08"))
  detected_enemy_move("mechsky08", 0.5)
  detected_enemy_move("mechsky09", 0.8)
  detected_enemy_move("mechsky10", 0.9)
end
function pccubesensor2_14_OnEnter(A0_48)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_14_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky07"))
  detected_enemy_move("mechsky07", 0.5)
end
function pccubesensor2_15_OnEnter(A0_49)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_15_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky05"))
  detected_enemy_move("mechsky05", 0.7)
end
function pccubesensor2_16_OnEnter(A0_50)
  if _mission_phase == _PHASE.CLEAR then
    return
  end
  print("pccubesensor2_16_OnEnter:\233\163\155\232\161\140\229\133\181\229\153\168\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
  detectedEvent_start(findGameObject2("Puppet", "mechsky15"))
  detected_enemy_move("mechsky15", 0.7)
end
function detectedEvent_start(A0_51)
  print("\227\130\183\227\130\183\227\130\163\227\130\183\227\131\137\227\131\188\231\153\186\232\166\139\228\184\173\227\129\175\233\128\154\229\160\177\227\129\151\227\129\170\227\129\132", _playing_detect_sis_and_cid_seq)
  if _playing_detect_sis_and_cid_seq then
    return
  end
  _detected_on_sensor = true
  print("\226\150\160\226\150\160\226\150\160_detected_on_sensor = true\226\150\160\226\150\160")
  if _view_control_task ~= nil then
    _view_control_task:abort()
    _view_control_task = nil
  end
  _view_control_task = Fn_lookAtObject(A0_51)
  detectedBySoldier()
  if _kaiwa_task ~= nil then
    _kaiwa_task:abort()
    _kaiwa_task = nil
  end
end
function detected_enemy_move(A0_52, A1_53)
  invokeTask(function()
    local L0_54, L1_55, L2_56, L3_57
    L0_54 = waitSeconds
    L1_55 = A1_53
    L0_54(L1_55)
    L0_54 = createGameObject2
    L1_55 = "Node"
    L0_54 = L0_54(L1_55)
    L1_55 = "target_pc_pos_"
    L2_56 = A0_52
    L1_55 = L1_55 .. L2_56
    L3_57 = L0_54
    L2_56 = L0_54.setName
    L2_56(L3_57, L1_55)
    L3_57 = L0_54
    L2_56 = L0_54.try_init
    L2_56(L3_57)
    L3_57 = L0_54
    L2_56 = L0_54.waitForReady
    L2_56(L3_57)
    L3_57 = L0_54
    L2_56 = L0_54.try_start
    L2_56(L3_57)
    L3_57 = L0_54
    L2_56 = L0_54.setWorldPos
    L2_56(L3_57, Fn_getPlayerWorldPos())
    L3_57 = L0_54
    L2_56 = L0_54.setForceMove
    L2_56(L3_57)
    L2_56 = findGameObject2
    L3_57 = "EnemyBrain"
    L2_56 = L2_56(L3_57, A0_52)
    L3_57 = {}
    L3_57.loop = false
    L2_56:move({L1_55}, L3_57)
    waitSeconds(0.7)
    L2_56:endScriptAction()
    L0_54:kill()
    L0_54 = nil
  end)
end
function pccubesensor2_bridge_01_OnEnter(A0_58)
  _landing_wait_task = invokeTask(function()
    while true do
      if not Player:isGravityControlMode() and (Player:getAction() == Player.kAction_Idle or Player:getAction() == Player.kAction_Run) then
        _landing_wait_task:abort()
        _landing_wait_task = nil
        kaiwaDemo1_start(A0_58, false)
        break
      end
      wait()
    end
  end)
end
function pccubesensor2_bridge_01_OnLeave(A0_59)
  if _landing_wait_task ~= nil then
    _landing_wait_task:abort()
    _landing_wait_task = nil
  end
end
function kaiwaDemo1_start(A0_60, A1_61)
  if _crow_move_bridge == false then
    crow_setMovePoints_bridge()
    _crow_move_bridge = true
  end
  invokeTask(function()
    kaiwa_demo1(A1_61)
    Fn_pcSensorOff(A0_60)
    Fn_missionViewWait("ep10_01100")
  end)
end
function kaiwa_demo1(A0_62)
  local L1_63, L2_64, L3_65, L4_66
  for L4_66 = 3, _sensor_max do
    if findGameObject2("Node", "pccubesensor2_" .. string.format("%02d", L4_66)) ~= nil then
      Fn_pcSensorOff("pccubesensor2_" .. string.format("%02d", L4_66))
    end
  end
  L1_63(L2_64)
  L1_63()
  L1_63()
  if A0_62 == false then
    L4_66 = Camera
    L4_66 = L4_66.kControl_All
    L1_63(L2_64, L3_65, L4_66, false)
    L4_66 = "locator2_mechsky_15"
    L4_66 = L2_64(L3_65, L4_66)
    L1_63(L2_64, L3_65, L4_66, L2_64(L3_65, L4_66))
    L4_66 = 1
    L1_63(L2_64, L3_65, L4_66, findGameObject2("Node", "locator2_soldier_06_01"):getWorldPos())
  end
  L1_63(L2_64)
  while true do
    if L1_63 ~= 0 then
      L4_66 = L3_65
      L4_66 = L3_65(L4_66)
      L1_63(L2_64, L3_65, L4_66, L3_65(L4_66))
      L1_63()
    end
  end
  L1_63(L2_64)
  _kaiwademo1 = true
  L1_63()
  L1_63(L2_64, L3_65)
  L4_66 = 1
  L1_63(L2_64, L3_65, L4_66, Vector(0, 0, 0))
  L4_66 = Camera
  L4_66 = L4_66.kControl_All
  L1_63(L2_64, L3_65, L4_66, true)
  for L4_66 = 3, _sensor_max do
    if findGameObject2("Node", "pccubesensor2_" .. string.format("%02d", L4_66)) ~= nil then
      Fn_pcSensorOn("pccubesensor2_" .. string.format("%02d", L4_66))
    end
  end
  L1_63(L2_64)
  L1_63()
end
function hint_kaiwa1()
  _hint1_kaiwa = true
  if _kaiwademo1 == false then
    kaiwaDemo1_start("pccubesensor2_bridge_01", true)
  else
    invokeTask(function()
      hint_kaiwa1_setKaiwaTask()
      print("\230\161\159\230\169\139\227\129\167\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\227\129\140\231\181\130\228\186\134\227\129\151\227\129\159\227\129\174\227\129\1671\231\181\132\231\155\174\227\129\174\229\133\181\229\163\171\227\129\168\227\129\174\230\136\166\233\151\152\227\129\184")
    end)
  end
end
function hint_kaiwa1_setKaiwaTask()
  if _soldierInstance[6].status == NPC_STATUS.NORMAL or _soldierInstance[7].status == NPC_STATUS.NORMAL then
    if _kaiwa_task == nil then
      _kaiwa_task = invokeTask(function()
        _view_control_task = Fn_lookAtObject("npcgen2_soldier_06")
        Fn_captionViewWait("ep10_01005")
        Fn_captionViewWait("ep10_00153")
        Fn_captionView("ep10_00154")
        waitSeconds(0.5)
        HUD:info("ep10_info_03", true, 5)
        if _kaiwa_task ~= nil then
          _kaiwa_task:abort()
          _kaiwa_task = nil
        end
        if _kaiwa_skip_task ~= nil then
          _kaiwa_skip_task:abort()
          _kaiwa_skip_task = nil
        end
        if _view_control_task ~= nil then
          _view_control_task:abort()
          _view_control_task = nil
        end
      end)
    end
    if _kaiwa_skip_task == nil then
      _kaiwa_skip_task = invokeTask(function()
        while true do
          if _soldierInstance[6].status ~= NPC_STATUS.NORMAL or _soldierInstance[7].status ~= NPC_STATUS.NORMAL then
            print("\229\133\181\229\163\1716 or \229\133\181\229\163\1717\227\129\171\230\176\151\228\187\152\227\129\139\227\130\140\227\129\159\227\129\159\227\130\129\228\188\154\232\169\177\227\130\185\227\130\173\227\131\131\227\131\151")
            HUD:info("ep10_info_03", true, 5)
            _kaiwa_skip_flag = true
            if _kaiwa_task ~= nil then
              _kaiwa_task:abort()
              _kaiwa_task = nil
            end
            if _kaiwa_skip_task ~= nil then
              _kaiwa_skip_task:abort()
              _kaiwa_skip_task = nil
            end
            if _view_control_task ~= nil then
              _view_control_task:abort()
              _view_control_task = nil
            end
          end
          wait()
        end
      end)
    end
  end
end
function hint_kaiwa2()
  if _soldierInstance[9].status == NPC_STATUS.NORMAL or _soldierInstance[10].status == NPC_STATUS.NORMAL then
    if _kaiwa_task == nil then
      _kaiwa_task = invokeTask(function()
        _view_control_task = Fn_lookAtObject("npcgen2_soldier_09")
        Fn_captionViewWait("ep10_01006")
        if _view_control_task ~= nil then
          _view_control_task:abort()
          _view_control_task = nil
        end
        Fn_captionViewWait("ep10_01007")
        Fn_captionView("ep10_01008")
        waitSeconds(0.5)
        Fn_userCtrlOn()
        _soldierInstance[9]:setPosList(({
          {
            {
              pos = "locator2_soldier_09_01",
              opt = nil
            },
            {
              pos = "locator2_soldier_09_02",
              opt = nil
            }
          },
          {
            {
              pos = "locator2_soldier_10_01",
              opt = nil
            },
            {
              pos = "locator2_soldier_10_02",
              opt = nil
            }
          }
        })[1])
        _soldierInstance[10]:setPosList(({
          {
            {
              pos = "locator2_soldier_09_01",
              opt = nil
            },
            {
              pos = "locator2_soldier_09_02",
              opt = nil
            }
          },
          {
            {
              pos = "locator2_soldier_10_01",
              opt = nil
            },
            {
              pos = "locator2_soldier_10_02",
              opt = nil
            }
          }
        })[2])
        _hint2_kaiwa = true
        if _kaiwa_task ~= nil then
          _kaiwa_task:abort()
          _kaiwa_task = nil
        end
        if _kaiwa_skip_task ~= nil then
          _kaiwa_skip_task:abort()
          _kaiwa_skip_task = nil
        end
      end)
    end
    if _kaiwa_skip_task == nil then
      _kaiwa_skip_task = invokeTask(function()
        while true do
          if _soldierInstance[9].status ~= NPC_STATUS.NORMAL or _soldierInstance[10].status ~= NPC_STATUS.NORMAL then
            print("\229\133\181\229\163\1719 or \229\133\181\229\163\17110\227\129\171\230\176\151\228\187\152\227\129\139\227\130\140\227\129\159\227\129\159\227\130\129\228\188\154\232\169\177\227\130\185\227\130\173\227\131\131\227\131\151")
            _hint2_kaiwa = true
            if _kaiwa_task ~= nil then
              _kaiwa_task:abort()
              _kaiwa_task = nil
            end
            if _kaiwa_skip_task ~= nil then
              _kaiwa_skip_task:abort()
              _kaiwa_skip_task = nil
            end
            if _view_control_task ~= nil then
              _view_control_task:abort()
              _view_control_task = nil
            end
          end
          wait()
        end
      end)
    end
  end
end
function hint3_kaiwa()
  if _soldierInstance[18].status == NPC_STATUS.NORMAL or _soldierInstance[19].status == NPC_STATUS.NORMAL then
    if _kaiwa_task == nil then
      _kaiwa_task = invokeTask(function()
        _view_control_task = Fn_lookAtObject("npcgen2_soldier_18")
        Fn_captionViewWait("ep10_01009")
        if _view_control_task ~= nil then
          _view_control_task:abort()
          _view_control_task = nil
        end
        Fn_captionView("ep10_01010")
        _hint3_kaiwa = true
        if _kaiwa_task ~= nil then
          _kaiwa_task:abort()
          _kaiwa_task = nil
        end
        if _kaiwa_skip_task ~= nil then
          _kaiwa_skip_task:abort()
          _kaiwa_skip_task = nil
        end
      end)
    end
    if _kaiwa_skip_task == nil then
      _kaiwa_skip_task = invokeTask(function()
        while true do
          if _soldierInstance[18].status ~= NPC_STATUS.NORMAL or _soldierInstance[19].status ~= NPC_STATUS.NORMAL then
            print("\229\133\181\229\163\17118 or \229\133\181\229\163\17119\227\129\171\230\176\151\228\187\152\227\129\139\227\130\140\227\129\159\227\129\159\227\130\129\228\188\154\232\169\177\227\130\185\227\130\173\227\131\131\227\131\151")
            _hint3_kaiwa = true
            if _kaiwa_task ~= nil then
              _kaiwa_task:abort()
              _kaiwa_task = nil
            end
            if _kaiwa_skip_task ~= nil then
              _kaiwa_skip_task:abort()
              _kaiwa_skip_task = nil
            end
            if _view_control_task ~= nil then
              _view_control_task:abort()
              _view_control_task = nil
            end
          end
          wait()
        end
      end)
    end
  end
end
function crow_setMovePoints_bridge()
  local L0_67, L1_68
  L0_67 = findGameObject2
  L1_68 = "Node"
  L0_67 = L0_67(L1_68, "locator2_crow_movepoints_02")
  L1_68 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 25
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_00_04"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 25
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_00_06"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 25
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_00_07"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 25
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_00_07"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 25,
      enable_normal_gravity = true
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_00_07"):getWorldPos(),
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L0_67
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L1_68)
  _brain_crow:startMovePoint()
end
function crow_process()
  _brain_crow:setAbility(Supporter.Ability.Attack, false)
  while not _kaiwademo1 do
    wait()
  end
  while not _hint1_kaiwa do
    wait()
  end
  if _crow_process_task ~= nil then
    _crow_process_task:abort()
    _crow_process_task = nil
  end
  _crow_process_task = invokeTask(function()
    crow_process_battle01()
  end)
end
function crow_process_battle01()
  local L0_69, L1_70, L2_71, L3_72, L4_73, L5_74
  L0_69 = findGameObject2
  L1_70 = "Node"
  L2_71 = "locator2_crow_movepoints_attack_01"
  L0_69 = L0_69(L1_70, L2_71)
  L1_70 = L0_69
  L0_69 = L0_69.getWorldPos
  L0_69 = L0_69(L1_70)
  L1_70 = Fn_findNpcPuppet
  L2_71 = _soldierName
  L2_71 = L2_71[6]
  L1_70 = L1_70(L2_71)
  L2_71 = {
    L3_72,
    L4_73,
    L5_74,
    {
      pos = L0_69,
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L1_70
    }
  }
  L3_72 = {}
  L4_73 = _puppet_crow
  L5_74 = L4_73
  L4_73 = L4_73.getWorldPos
  L4_73 = L4_73(L5_74)
  L3_72.pos = L4_73
  L4_73 = Supporter
  L4_73 = L4_73.MovePoint
  L4_73 = L4_73.Takeoff
  L3_72.action = L4_73
  L3_72.vel = 5
  L4_73 = {}
  L5_74 = _puppet_crow
  L5_74 = L5_74.getWorldPos
  L5_74 = L5_74(L5_74)
  L4_73.pos = L5_74
  L5_74 = Supporter
  L5_74 = L5_74.MovePoint
  L5_74 = L5_74.Air
  L4_73.action = L5_74
  L4_73.vel = 20
  L5_74 = {}
  L5_74.pos = L0_69
  L5_74.action = Supporter.MovePoint.Air
  L5_74.vel = 20
  L3_72 = _kaiwa_skip_flag
  if L3_72 == false then
    L3_72 = _brain_crow
    L4_73 = L3_72
    L3_72 = L3_72.clearMovePoint
    L3_72(L4_73)
    L3_72 = _brain_crow
    L4_73 = L3_72
    L3_72 = L3_72.setMovePoints
    L5_74 = L2_71
    L3_72(L4_73, L5_74)
    L3_72 = _brain_crow
    L4_73 = L3_72
    L3_72 = L3_72.startMovePoint
    L3_72(L4_73)
  end
  L3_72 = setNpcDamagedTask
  L4_73 = 6
  L5_74 = 7
  L3_72(L4_73, L5_74)
  L3_72 = setNpcDamagedTask
  L4_73 = 7
  L5_74 = 6
  L3_72(L4_73, L5_74)
  while true do
    L3_72 = _kaiwa_skip_flag
    if L3_72 ~= true then
      L3_72 = _brain_crow
      L4_73 = L3_72
      L3_72 = L3_72.isMovePointEnd
      L3_72 = L3_72(L4_73)
      if L3_72 then
        L3_72 = _brain_crow
        L4_73 = L3_72
        L3_72 = L3_72.clearMovePoint
        L3_72(L4_73)
        L3_72 = print
        L4_73 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:1\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167"
        L3_72(L4_73)
        break
      end
    end
    L3_72 = wait
    L3_72()
  end
  L3_72 = {
    L4_73,
    [3] = L5_74(_soldierName[7])
  }
  L4_73 = Fn_findNpcPuppet
  L5_74 = _soldierName
  L5_74 = L5_74[6]
  L4_73 = L4_73(L5_74)
  L5_74 = Fn_findNpcPuppet
  L5_74 = L5_74(_soldierName[7])
  ;({
    L4_73,
    [3] = L5_74(_soldierName[7])
  })[2] = L5_74
  L4_73 = setCrowAttack
  L5_74 = true
  L4_73(L5_74, L3_72)
  L4_73 = print
  L5_74 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[6]"
  L4_73(L5_74)
  L4_73 = print
  L5_74 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[7]"
  L4_73(L5_74)
  while true do
    L4_73 = _soldierInstance
    L4_73 = L4_73[6]
    L4_73 = L4_73.status
    L5_74 = NPC_STATUS
    L5_74 = L5_74.DEAD
    if L4_73 == L5_74 then
      L4_73 = _soldierInstance
      L4_73 = L4_73[7]
      L4_73 = L4_73.status
      L5_74 = NPC_STATUS
      L5_74 = L5_74.DEAD
      if L4_73 == L5_74 then
        L4_73 = _detected_soldier
        if L4_73 == false then
          L4_73 = _PHASE
          L4_73 = L4_73.BATTLE02
          _mission_phase = L4_73
          L4_73 = drawCautionLevel
          L4_73()
        end
        _kaiwa_skip_flag = false
        L4_73 = print
        L5_74 = "1\229\155\158\231\155\174\227\129\174\229\133\181\229\163\171\227\129\168\227\129\174\230\136\166\233\151\152\231\181\130\228\186\134"
        L4_73(L5_74)
        break
      end
    end
    L4_73 = wait
    L4_73()
  end
  L4_73 = setCrowAttack
  L5_74 = false
  L4_73(L5_74, nil)
  L4_73 = {
    L5_74,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_02_01"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_02_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_02_03"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_02_03"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 20,
      enable_normal_gravity = true
    }
  }
  L5_74 = {}
  L5_74.pos = _puppet_crow:getWorldPos()
  L5_74.action = Supporter.MovePoint.Air
  L5_74.vel = 20
  L5_74 = _brain_crow
  L5_74 = L5_74.clearMovePoint
  L5_74(L5_74)
  L5_74 = _brain_crow
  L5_74 = L5_74.setMovePoints
  L5_74(L5_74, L4_73)
  L5_74 = _brain_crow
  L5_74 = L5_74.startMovePoint
  L5_74(L5_74)
  while true do
    L5_74 = _brain_crow
    L5_74 = L5_74.isMovePointEnd
    L5_74 = L5_74(L5_74)
    if L5_74 then
      L5_74 = _brain_crow
      L5_74 = L5_74.clearMovePoint
      L5_74(L5_74)
      L5_74 = print
      L5_74("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:1\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152\229\190\140\239\189\158\231\157\128\229\156\176\227\129\190\227\129\167")
      break
    end
    L5_74 = wait
    L5_74()
  end
  L5_74 = setNpcDamagedTask
  L5_74(9, 10)
  L5_74 = setNpcDamagedTask
  L5_74(10, 9)
  L5_74 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_03"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L5_74)
  _brain_crow:startMovePoint()
  while not _hint2_kaiwa or not _brain_crow:isMovePointEnd() do
    wait()
  end
  _brain_crow:clearMovePoint()
  if _crow_process_task ~= nil then
    _crow_process_task:abort()
    _crow_process_task = nil
  end
  _crow_process_task = invokeTask(function()
    crow_process_battle02()
  end)
end
function crow_process_battle02()
  local L0_75, L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82
  L0_75 = findGameObject2
  L1_76 = "Node"
  L2_77 = "locator2_crow_movepoints_attack_02_01"
  L0_75 = L0_75(L1_76, L2_77)
  L1_76 = L0_75
  L0_75 = L0_75.getWorldPos
  L0_75 = L0_75(L1_76)
  L1_76 = findGameObject2
  L2_77 = "Node"
  L3_78 = "locator2_crow_movepoints_attack_02_02"
  L1_76 = L1_76(L2_77, L3_78)
  L2_77 = L1_76
  L1_76 = L1_76.getWorldPos
  L1_76 = L1_76(L2_77)
  L2_77 = Fn_findNpcPuppet
  L3_78 = _soldierName
  L3_78 = L3_78[9]
  L2_77 = L2_77(L3_78)
  L3_78 = {
    L4_79,
    L5_80,
    L6_81,
    L7_82,
    {
      pos = L1_76,
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L2_77
    }
  }
  L4_79 = {}
  L5_80 = _puppet_crow
  L6_81 = L5_80
  L5_80 = L5_80.getWorldPos
  L5_80 = L5_80(L6_81)
  L4_79.pos = L5_80
  L5_80 = Supporter
  L5_80 = L5_80.MovePoint
  L5_80 = L5_80.Takeoff
  L4_79.action = L5_80
  L4_79.vel = 20
  L5_80 = {}
  L6_81 = _puppet_crow
  L7_82 = L6_81
  L6_81 = L6_81.getWorldPos
  L6_81 = L6_81(L7_82)
  L5_80.pos = L6_81
  L6_81 = Supporter
  L6_81 = L6_81.MovePoint
  L6_81 = L6_81.Air
  L5_80.action = L6_81
  L5_80.vel = 20
  L6_81 = {}
  L6_81.pos = L0_75
  L7_82 = Supporter
  L7_82 = L7_82.MovePoint
  L7_82 = L7_82.Air
  L6_81.action = L7_82
  L6_81.vel = 20
  L7_82 = {}
  L7_82.pos = L1_76
  L7_82.action = Supporter.MovePoint.Air
  L7_82.vel = 20
  L4_79 = _kaiwa_skip_flag
  if L4_79 == false then
    L4_79 = _brain_crow
    L5_80 = L4_79
    L4_79 = L4_79.clearMovePoint
    L4_79(L5_80)
    L4_79 = _brain_crow
    L5_80 = L4_79
    L4_79 = L4_79.setMovePoints
    L6_81 = L3_78
    L4_79(L5_80, L6_81)
    L4_79 = _brain_crow
    L5_80 = L4_79
    L4_79 = L4_79.startMovePoint
    L4_79(L5_80)
  end
  L4_79 = setNpcDamagedTask
  L5_80 = 9
  L6_81 = 10
  L4_79(L5_80, L6_81)
  L4_79 = setNpcDamagedTask
  L5_80 = 10
  L6_81 = 9
  L4_79(L5_80, L6_81)
  while true do
    L4_79 = _kaiwa_skip_flag
    if L4_79 ~= true then
      L4_79 = _brain_crow
      L5_80 = L4_79
      L4_79 = L4_79.isMovePointEnd
      L4_79 = L4_79(L5_80)
      if L4_79 then
        L4_79 = _brain_crow
        L5_80 = L4_79
        L4_79 = L4_79.clearMovePoint
        L4_79(L5_80)
        L4_79 = print
        L5_80 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:2\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167"
        L4_79(L5_80)
        break
      end
    end
    L4_79 = wait
    L4_79()
  end
  L4_79 = {
    L5_80,
    [4] = L6_81(L7_82)
  }
  L5_80 = Fn_findNpcPuppet
  L6_81 = _soldierName
  L6_81 = L6_81[9]
  L5_80 = L5_80(L6_81)
  L6_81 = Fn_findNpcPuppet
  L7_82 = _soldierName
  L7_82 = L7_82[10]
  L7_82 = L6_81(L7_82)
  ;({
    L5_80,
    [4] = L6_81(L7_82)
  })[2] = L6_81
  ;({
    L5_80,
    [4] = L6_81(L7_82)
  })[3] = L7_82
  L5_80 = setCrowAttack
  L6_81 = true
  L7_82 = L4_79
  L5_80(L6_81, L7_82)
  L5_80 = print
  L6_81 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[9]"
  L5_80(L6_81)
  L5_80 = print
  L6_81 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[10]"
  L5_80(L6_81)
  while true do
    L5_80 = _soldierInstance
    L5_80 = L5_80[9]
    L5_80 = L5_80.status
    L6_81 = NPC_STATUS
    L6_81 = L6_81.DEAD
    if L5_80 == L6_81 then
      L5_80 = _soldierInstance
      L5_80 = L5_80[10]
      L5_80 = L5_80.status
      L6_81 = NPC_STATUS
      L6_81 = L6_81.DEAD
      if L5_80 == L6_81 then
        L5_80 = _detected_soldier
        if L5_80 == false then
          L5_80 = _PHASE
          L5_80 = L5_80.BATTLE03
          _mission_phase = L5_80
          L5_80 = drawCautionLevel
          L5_80()
        end
        _kaiwa_skip_flag = false
        L5_80 = print
        L6_81 = "2\229\155\158\231\155\174\227\129\174\229\133\181\229\163\171\227\129\168\227\129\174\230\136\166\233\151\152\231\181\130\228\186\134"
        L5_80(L6_81)
        break
      end
    end
    L5_80 = wait
    L5_80()
  end
  L5_80 = setCrowAttack
  L6_81 = false
  L7_82 = nil
  L5_80(L6_81, L7_82)
  L5_80 = {
    L6_81,
    L7_82,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_03_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_04"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 20,
      enable_normal_gravity = true
    }
  }
  L6_81 = {}
  L7_82 = _puppet_crow
  L7_82 = L7_82.getWorldPos
  L7_82 = L7_82(L7_82)
  L6_81.pos = L7_82
  L7_82 = Supporter
  L7_82 = L7_82.MovePoint
  L7_82 = L7_82.Air
  L6_81.action = L7_82
  L6_81.vel = 20
  L7_82 = {}
  L7_82.pos = findGameObject2("Node", "locator2_crow_movepoints_03_01"):getWorldPos()
  L7_82.action = Supporter.MovePoint.Air
  L7_82.vel = 20
  L6_81 = _brain_crow
  L7_82 = L6_81
  L6_81 = L6_81.clearMovePoint
  L6_81(L7_82)
  L6_81 = _brain_crow
  L7_82 = L6_81
  L6_81 = L6_81.setMovePoints
  L6_81(L7_82, L5_80)
  L6_81 = _brain_crow
  L7_82 = L6_81
  L6_81 = L6_81.startMovePoint
  L6_81(L7_82)
  while true do
    L6_81 = _brain_crow
    L7_82 = L6_81
    L6_81 = L6_81.isMovePointEnd
    L6_81 = L6_81(L7_82)
    if L6_81 then
      L6_81 = _brain_crow
      L7_82 = L6_81
      L6_81 = L6_81.clearMovePoint
      L6_81(L7_82)
      L6_81 = print
      L7_82 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:2\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152\229\190\140\239\189\158\231\157\128\229\156\176\227\129\190\227\129\167"
      L6_81(L7_82)
      break
    end
    L6_81 = wait
    L6_81()
  end
  L6_81 = Fn_findNpcPuppet
  L7_82 = _soldierName
  L7_82 = L7_82[18]
  L6_81 = L6_81(L7_82)
  L7_82 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_05"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_06"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_06"):getWorldPos(),
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L6_81
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L7_82)
  _brain_crow:startMovePoint()
  while not _hint3_kaiwa or not _brain_crow:isMovePointEnd() do
    wait()
  end
  _brain_crow:clearMovePoint()
  if _crow_process_task ~= nil then
    _crow_process_task:abort()
    _crow_process_task = nil
  end
  _crow_process_task = invokeTask(function()
    crow_process_battle03()
  end)
end
function crow_process_battle03()
  local L0_83, L1_84, L2_85, L3_86, L4_87, L5_88
  L0_83 = findGameObject2
  L1_84 = "Node"
  L2_85 = "locator2_crow_movepoints_attack_03_01"
  L0_83 = L0_83(L1_84, L2_85)
  L1_84 = L0_83
  L0_83 = L0_83.getWorldPos
  L0_83 = L0_83(L1_84)
  L1_84 = findGameObject2
  L2_85 = "Node"
  L3_86 = "locator2_crow_movepoints_attack_03_02"
  L1_84 = L1_84(L2_85, L3_86)
  L2_85 = L1_84
  L1_84 = L1_84.getWorldPos
  L1_84 = L1_84(L2_85)
  L2_85 = Fn_findNpcPuppet
  L3_86 = _soldierName
  L3_86 = L3_86[18]
  L2_85 = L2_85(L3_86)
  L3_86 = {
    L4_87,
    L5_88,
    {
      pos = L1_84,
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = L1_84,
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L2_85
    }
  }
  L4_87 = {}
  L5_88 = _puppet_crow
  L5_88 = L5_88.getWorldPos
  L5_88 = L5_88(L5_88)
  L4_87.pos = L5_88
  L5_88 = Supporter
  L5_88 = L5_88.MovePoint
  L5_88 = L5_88.Takeoff
  L4_87.action = L5_88
  L4_87.vel = 20
  L5_88 = {}
  L5_88.pos = L0_83
  L5_88.action = Supporter.MovePoint.Air
  L5_88.vel = 20
  L4_87 = _kaiwa_skip_flag
  if L4_87 == false then
    L4_87 = _brain_crow
    L5_88 = L4_87
    L4_87 = L4_87.clearMovePoint
    L4_87(L5_88)
    L4_87 = _brain_crow
    L5_88 = L4_87
    L4_87 = L4_87.setMovePoints
    L4_87(L5_88, L3_86)
    L4_87 = _brain_crow
    L5_88 = L4_87
    L4_87 = L4_87.startMovePoint
    L4_87(L5_88)
  end
  L4_87 = setNpcDamagedTask
  L5_88 = 18
  L4_87(L5_88, 19)
  L4_87 = setNpcDamagedTask
  L5_88 = 19
  L4_87(L5_88, 18)
  while true do
    L4_87 = _kaiwa_skip_flag
    if L4_87 ~= true then
      L4_87 = _brain_crow
      L5_88 = L4_87
      L4_87 = L4_87.isMovePointEnd
      L4_87 = L4_87(L5_88)
      if L4_87 then
        L4_87 = _brain_crow
        L5_88 = L4_87
        L4_87 = L4_87.clearMovePoint
        L4_87(L5_88)
        L4_87 = print
        L5_88 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:3\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167"
        L4_87(L5_88)
        break
      end
    end
    L4_87 = wait
    L4_87()
  end
  L4_87 = {
    L5_88,
    Fn_findNpcPuppet(_soldierName[19])
  }
  L5_88 = Fn_findNpcPuppet
  L5_88 = L5_88(_soldierName[18])
  L5_88 = setCrowAttack
  L5_88(true, L4_87)
  L5_88 = print
  L5_88("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[18]")
  L5_88 = print
  L5_88("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[19]")
  while true do
    L5_88 = _soldierInstance
    L5_88 = L5_88[18]
    L5_88 = L5_88.status
    if L5_88 == NPC_STATUS.DEAD then
      L5_88 = _soldierInstance
      L5_88 = L5_88[19]
      L5_88 = L5_88.status
      if L5_88 == NPC_STATUS.DEAD then
        L5_88 = _detected_soldier
        if L5_88 == false then
          L5_88 = _PHASE
          L5_88 = L5_88.BRANCH
          _mission_phase = L5_88
          L5_88 = drawCautionLevel
          L5_88()
        end
        _kaiwa_skip_flag = false
        L5_88 = print
        L5_88("3\229\155\158\231\155\174\227\129\174\229\133\181\229\163\171\227\129\168\227\129\174\230\136\166\233\151\152\231\181\130\228\186\134")
        break
      end
    end
    L5_88 = wait
    L5_88()
  end
  L5_88 = setCrowAttack
  L5_88(false, nil)
  L5_88 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_07_01"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_08"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_08"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 20,
      enable_normal_gravity = true
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_08"):getWorldPos(),
      action = Supporter.MovePoint.Idle,
      vel = 20
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L5_88)
  _brain_crow:startMovePoint()
  while true do
    if _brain_crow:isMovePointEnd() then
      _brain_crow:clearMovePoint()
      print("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:3\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152\229\190\140\239\189\158\229\136\134\227\129\139\227\130\140\233\129\147\227\129\174\233\129\184\230\138\158\229\156\176\231\130\185\227\129\190\227\129\167")
      break
    end
    wait()
  end
  _branch_select_phase = true
  if _selected_branch == _BRANCH.GOAL then
    pccubesensor2_branch_goal_OnEnter("pccubesensor2_branch_goal")
  elseif _selected_branch == _BRANCH.INCORRECT01 then
    pccubesensor2_branch_incorrect_01_OnEnter("pccubesensor2_branch_incorrect_01")
  elseif _selected_branch == _BRANCH.INCORRECT02 then
    pccubesensor2_branch_incorrect_02_OnEnter("pccubesensor2_branch_incorrect_02")
  end
end
function crow_process_branch_goal()
  local L0_89, L1_90, L2_91, L3_92, L4_93, L5_94, L6_95
  _branch_goal_OnEnter = true
  _branch_incorrect_01_OnEnter = false
  _branch_incorrect_02_OnEnter = false
  L0_89 = _brain_crow
  L1_90 = L0_89
  L0_89 = L0_89.setAbility
  L2_91 = Supporter
  L2_91 = L2_91.Ability
  L2_91 = L2_91.Attack
  L3_92 = false
  L0_89(L1_90, L2_91, L3_92)
  L0_89 = _brain_crow
  L1_90 = L0_89
  L0_89 = L0_89.clearMovePoint
  L0_89(L1_90)
  while true do
    L0_89 = _brain_crow
    L1_90 = L0_89
    L0_89 = L0_89.isWarpActionEnd
    L0_89 = L0_89(L1_90)
    if L0_89 then
      L0_89 = print
      L1_90 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\175\227\131\188\227\131\151\229\174\140\228\186\134\227\130\146\231\162\186\232\170\141\227\129\151\227\129\159\227\129\159\227\130\129\230\172\161\227\129\174\232\161\140\229\139\149\227\129\184"
      L0_89(L1_90)
      break
    end
    L0_89 = wait
    L0_89()
  end
  L0_89 = _brain_crow
  L1_90 = L0_89
  L0_89 = L0_89.clearMovePoint
  L0_89(L1_90)
  L0_89 = {
    L1_90,
    L2_91,
    L3_92,
    L4_93,
    L5_94,
    L6_95
  }
  L1_90 = {}
  L2_91 = _puppet_crow
  L3_92 = L2_91
  L2_91 = L2_91.getWorldPos
  L2_91 = L2_91(L3_92)
  L1_90.pos = L2_91
  L2_91 = Supporter
  L2_91 = L2_91.MovePoint
  L2_91 = L2_91.Ground
  L1_90.action = L2_91
  L1_90.vel = 20
  L2_91 = {}
  L3_92 = findGameObject2
  L4_93 = "Node"
  L5_94 = "locator2_crow_movepoints_08_01"
  L3_92 = L3_92(L4_93, L5_94)
  L4_93 = L3_92
  L3_92 = L3_92.getWorldPos
  L3_92 = L3_92(L4_93)
  L2_91.pos = L3_92
  L3_92 = Supporter
  L3_92 = L3_92.MovePoint
  L3_92 = L3_92.Ground
  L2_91.action = L3_92
  L2_91.vel = 20
  L3_92 = {}
  L4_93 = findGameObject2
  L5_94 = "Node"
  L6_95 = "locator2_crow_movepoints_09"
  L4_93 = L4_93(L5_94, L6_95)
  L5_94 = L4_93
  L4_93 = L4_93.getWorldPos
  L4_93 = L4_93(L5_94)
  L3_92.pos = L4_93
  L4_93 = Supporter
  L4_93 = L4_93.MovePoint
  L4_93 = L4_93.Ground
  L3_92.action = L4_93
  L3_92.vel = 20
  L4_93 = {}
  L5_94 = findGameObject2
  L6_95 = "Node"
  L5_94 = L5_94(L6_95, "locator2_crow_movepoints_10")
  L6_95 = L5_94
  L5_94 = L5_94.getWorldPos
  L5_94 = L5_94(L6_95)
  L4_93.pos = L5_94
  L5_94 = Supporter
  L5_94 = L5_94.MovePoint
  L5_94 = L5_94.Ground
  L4_93.action = L5_94
  L4_93.vel = 20
  L5_94 = {}
  L6_95 = findGameObject2
  L6_95 = L6_95("Node", "locator2_crow_movepoints_11")
  L6_95 = L6_95.getWorldPos
  L6_95 = L6_95(L6_95)
  L5_94.pos = L6_95
  L6_95 = Supporter
  L6_95 = L6_95.MovePoint
  L6_95 = L6_95.Ground
  L5_94.action = L6_95
  L5_94.vel = 20
  L6_95 = {}
  L6_95.pos = findGameObject2("Node", "locator2_crow_movepoints_11"):getWorldPos()
  L6_95.action = Supporter.MovePoint.Idle
  L6_95.vel = 20
  L1_90 = _brain_crow
  L2_91 = L1_90
  L1_90 = L1_90.clearMovePoint
  L1_90(L2_91)
  L1_90 = _brain_crow
  L2_91 = L1_90
  L1_90 = L1_90.setMovePoints
  L3_92 = L0_89
  L1_90(L2_91, L3_92)
  L1_90 = _brain_crow
  L2_91 = L1_90
  L1_90 = L1_90.startMovePoint
  L1_90(L2_91)
  while true do
    L1_90 = _brain_crow
    L2_91 = L1_90
    L1_90 = L1_90.isMovePointEnd
    L1_90 = L1_90(L2_91)
    if L1_90 then
      L1_90 = _brain_crow
      L2_91 = L1_90
      L1_90 = L1_90.clearMovePoint
      L1_90(L2_91)
      L1_90 = print
      L2_91 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:4\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\174\229\176\145\227\129\151\229\137\141\227\129\190\227\129\167"
      L1_90(L2_91)
      break
    end
    L1_90 = wait
    L1_90()
  end
  L1_90 = _brain_crow
  L2_91 = L1_90
  L1_90 = L1_90.clearMovePoint
  L1_90(L2_91)
  L1_90 = findGameObject2
  L2_91 = "Node"
  L3_92 = "locator2_crow_movepoints_attack_04"
  L1_90 = L1_90(L2_91, L3_92)
  L2_91 = L1_90
  L1_90 = L1_90.getWorldPos
  L1_90 = L1_90(L2_91)
  L2_91 = Fn_findNpcPuppet
  L3_92 = _soldierName
  L3_92 = L3_92[4]
  L2_91 = L2_91(L3_92)
  L3_92 = {
    L4_93,
    L5_94,
    L6_95,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_12_01"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = L1_90,
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = L1_90,
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L2_91
    }
  }
  L4_93 = {}
  L5_94 = _puppet_crow
  L6_95 = L5_94
  L5_94 = L5_94.getWorldPos
  L5_94 = L5_94(L6_95)
  L4_93.pos = L5_94
  L5_94 = Supporter
  L5_94 = L5_94.MovePoint
  L5_94 = L5_94.Ground
  L4_93.action = L5_94
  L4_93.vel = 20
  L5_94 = {}
  L6_95 = findGameObject2
  L6_95 = L6_95("Node", "locator2_crow_movepoints_12")
  L6_95 = L6_95.getWorldPos
  L6_95 = L6_95(L6_95)
  L5_94.pos = L6_95
  L6_95 = Supporter
  L6_95 = L6_95.MovePoint
  L6_95 = L6_95.Ground
  L5_94.action = L6_95
  L5_94.vel = 20
  L6_95 = {}
  L6_95.pos = findGameObject2("Node", "locator2_crow_movepoints_12"):getWorldPos()
  L6_95.action = Supporter.MovePoint.Takeoff
  L6_95.vel = 20
  L4_93 = _brain_crow
  L5_94 = L4_93
  L4_93 = L4_93.clearMovePoint
  L4_93(L5_94)
  L4_93 = _brain_crow
  L5_94 = L4_93
  L4_93 = L4_93.setMovePoints
  L6_95 = L3_92
  L4_93(L5_94, L6_95)
  L4_93 = _brain_crow
  L5_94 = L4_93
  L4_93 = L4_93.startMovePoint
  L4_93(L5_94)
  L4_93 = setNpcDamagedTask
  L5_94 = 4
  L6_95 = 14
  L4_93(L5_94, L6_95)
  L4_93 = setNpcDamagedTask
  L5_94 = 14
  L6_95 = 4
  L4_93(L5_94, L6_95)
  while true do
    L4_93 = _brain_crow
    L5_94 = L4_93
    L4_93 = L4_93.isMovePointEnd
    L4_93 = L4_93(L5_94)
    if L4_93 then
      L4_93 = _brain_crow
      L5_94 = L4_93
      L4_93 = L4_93.clearMovePoint
      L4_93(L5_94)
      L4_93 = print
      L5_94 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:4\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167"
      L4_93(L5_94)
      break
    end
    L4_93 = wait
    L4_93()
  end
  L4_93 = {
    L5_94,
    [3] = L6_95(_soldierName[14])
  }
  L5_94 = Fn_findNpcPuppet
  L6_95 = _soldierName
  L6_95 = L6_95[4]
  L5_94 = L5_94(L6_95)
  L6_95 = Fn_findNpcPuppet
  L6_95 = L6_95(_soldierName[14])
  ;({
    L5_94,
    [3] = L6_95(_soldierName[14])
  })[2] = L6_95
  L5_94 = setCrowAttack
  L6_95 = true
  L5_94(L6_95, L4_93)
  L5_94 = print
  L6_95 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[4]"
  L5_94(L6_95)
  L5_94 = print
  L6_95 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[14]"
  L5_94(L6_95)
  while true do
    L5_94 = _soldierInstance
    L5_94 = L5_94[4]
    L5_94 = L5_94.status
    L6_95 = NPC_STATUS
    L6_95 = L6_95.DEAD
    if L5_94 == L6_95 then
      L5_94 = _soldierInstance
      L5_94 = L5_94[14]
      L5_94 = L5_94.status
      L6_95 = NPC_STATUS
      L6_95 = L6_95.DEAD
    end
    if L5_94 ~= L6_95 then
      L5_94 = wait
      L5_94()
    end
  end
  L5_94 = setCrowAttack
  L6_95 = false
  L5_94(L6_95, nil)
  L5_94 = {
    L6_95,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_12_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_13"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_13"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 20,
      enable_normal_gravity = true
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_13"):getWorldPos(),
      action = Supporter.MovePoint.Idle,
      vel = 20
    }
  }
  L6_95 = {}
  L6_95.pos = _puppet_crow:getWorldPos()
  L6_95.action = Supporter.MovePoint.Air
  L6_95.vel = 20
  L6_95 = _brain_crow
  L6_95 = L6_95.clearMovePoint
  L6_95(L6_95)
  L6_95 = _brain_crow
  L6_95 = L6_95.setMovePoints
  L6_95(L6_95, L5_94)
  L6_95 = _brain_crow
  L6_95 = L6_95.startMovePoint
  L6_95(L6_95)
  while true do
    L6_95 = _brain_crow
    L6_95 = L6_95.isMovePointEnd
    L6_95 = L6_95(L6_95)
    if L6_95 then
      L6_95 = _brain_crow
      L6_95 = L6_95.clearMovePoint
      L6_95(L6_95)
      L6_95 = print
      L6_95("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:4\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152\229\190\140 \231\157\128\229\156\176\231\130\185\227\129\190\227\129\167")
      break
    end
    L6_95 = wait
    L6_95()
  end
  L6_95 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_14"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_15"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_16"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L6_95)
  _brain_crow:startMovePoint()
end
function crow_process_branch_goal_restart()
  local L0_96, L1_97, L2_98
  L0_96 = Fn_findNpcPuppet
  L1_97 = _soldierName
  L1_97 = L1_97[25]
  L0_96 = L0_96(L1_97)
  L1_97 = {
    L2_98,
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_attack_07_01"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_attack_07_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_attack_07_02"):getWorldPos(),
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L0_96
    }
  }
  L2_98 = {}
  L2_98.pos = _puppet_crow:getWorldPos()
  L2_98.action = Supporter.MovePoint.Takeoff
  L2_98.vel = 20
  L2_98 = _brain_crow
  L2_98 = L2_98.clearMovePoint
  L2_98(L2_98)
  L2_98 = _brain_crow
  L2_98 = L2_98.setMovePoints
  L2_98(L2_98, L1_97)
  L2_98 = _brain_crow
  L2_98 = L2_98.startMovePoint
  L2_98(L2_98)
  L2_98 = setNpcDamagedTask
  L2_98(25, 26)
  L2_98 = setNpcDamagedTask
  L2_98(26, 25)
  while true do
    L2_98 = _brain_crow
    L2_98 = L2_98.isMovePointEnd
    L2_98 = L2_98(L2_98)
    if L2_98 then
      L2_98 = _brain_crow
      L2_98 = L2_98.clearMovePoint
      L2_98(L2_98)
      L2_98 = print
      L2_98("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:\229\186\131\229\160\180\229\137\141\227\129\174\230\136\166\233\151\152 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167")
      break
    end
    L2_98 = wait
    L2_98()
  end
  L2_98 = {
    Fn_findNpcPuppet(_soldierName[25]),
    Fn_findNpcPuppet(_soldierName[26])
  }
  setCrowAttack(true, L2_98)
  print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[25]")
  print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[26]")
end
function crow_process_branch_incorrect_01()
  local L0_99, L1_100, L2_101, L3_102, L4_103
  _branch_incorrect_01_OnEnter = true
  _branch_goal_OnEnter = false
  _branch_incorrect_02_OnEnter = false
  L0_99 = _brain_crow
  L1_100 = L0_99
  L0_99 = L0_99.setAbility
  L2_101 = Supporter
  L2_101 = L2_101.Ability
  L2_101 = L2_101.Attack
  L3_102 = false
  L0_99(L1_100, L2_101, L3_102)
  L0_99 = _brain_crow
  L1_100 = L0_99
  L0_99 = L0_99.clearMovePoint
  L0_99(L1_100)
  while true do
    L0_99 = _brain_crow
    L1_100 = L0_99
    L0_99 = L0_99.isWarpActionEnd
    L0_99 = L0_99(L1_100)
    if L0_99 then
      L0_99 = print
      L1_100 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\175\227\131\188\227\131\151\229\174\140\228\186\134\227\130\146\231\162\186\232\170\141\227\129\151\227\129\159\227\129\159\227\130\129\230\172\161\227\129\174\232\161\140\229\139\149\227\129\184"
      L0_99(L1_100)
      break
    end
    L0_99 = wait
    L0_99()
  end
  L0_99 = Fn_findNpcPuppet
  L1_100 = _soldierName
  L1_100 = L1_100[3]
  L0_99 = L0_99(L1_100)
  L1_100 = _brain_crow
  L2_101 = L1_100
  L1_100 = L1_100.clearMovePoint
  L1_100(L2_101)
  L1_100 = {
    L2_101,
    L3_102,
    L4_103,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_attack_05_01"):getWorldPos(),
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L0_99
    }
  }
  L2_101 = {}
  L3_102 = _puppet_crow
  L4_103 = L3_102
  L3_102 = L3_102.getWorldPos
  L3_102 = L3_102(L4_103)
  L2_101.pos = L3_102
  L3_102 = Supporter
  L3_102 = L3_102.MovePoint
  L3_102 = L3_102.Ground
  L2_101.action = L3_102
  L2_101.vel = 20
  L3_102 = {}
  L4_103 = findGameObject2
  L4_103 = L4_103("Node", "locator2_crow_movepoints_attack_05_01")
  L4_103 = L4_103.getWorldPos
  L4_103 = L4_103(L4_103)
  L3_102.pos = L4_103
  L4_103 = Supporter
  L4_103 = L4_103.MovePoint
  L4_103 = L4_103.Ground
  L3_102.action = L4_103
  L3_102.vel = 20
  L4_103 = {}
  L4_103.pos = findGameObject2("Node", "locator2_crow_movepoints_attack_05_01"):getWorldPos()
  L4_103.action = Supporter.MovePoint.Takeoff
  L4_103.vel = 20
  L2_101 = _brain_crow
  L3_102 = L2_101
  L2_101 = L2_101.clearMovePoint
  L2_101(L3_102)
  L2_101 = _brain_crow
  L3_102 = L2_101
  L2_101 = L2_101.setMovePoints
  L4_103 = L1_100
  L2_101(L3_102, L4_103)
  L2_101 = _brain_crow
  L3_102 = L2_101
  L2_101 = L2_101.startMovePoint
  L2_101(L3_102)
  L2_101 = setNpcDamagedTask
  L3_102 = 3
  L4_103 = 17
  L2_101(L3_102, L4_103)
  L2_101 = setNpcDamagedTask
  L3_102 = 3
  L4_103 = 21
  L2_101(L3_102, L4_103)
  L2_101 = setNpcDamagedTask
  L3_102 = 17
  L4_103 = 3
  L2_101(L3_102, L4_103)
  L2_101 = setNpcDamagedTask
  L3_102 = 17
  L4_103 = 21
  L2_101(L3_102, L4_103)
  L2_101 = setNpcDamagedTask
  L3_102 = 21
  L4_103 = 3
  L2_101(L3_102, L4_103)
  L2_101 = setNpcDamagedTask
  L3_102 = 21
  L4_103 = 17
  L2_101(L3_102, L4_103)
  while true do
    L2_101 = _brain_crow
    L3_102 = L2_101
    L2_101 = L2_101.isMovePointEnd
    L2_101 = L2_101(L3_102)
    if L2_101 then
      L2_101 = _brain_crow
      L3_102 = L2_101
      L2_101 = L2_101.clearMovePoint
      L2_101(L3_102)
      L2_101 = print
      L3_102 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:\231\183\143\231\157\163\229\186\156\227\129\168\227\129\175\233\128\134\229\129\180\227\129\174\233\129\147 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167"
      L2_101(L3_102)
      break
    end
    L2_101 = wait
    L2_101()
  end
  L2_101 = {
    L3_102,
    L4_103,
    Fn_findNpcPuppet(_soldierName[21])
  }
  L3_102 = Fn_findNpcPuppet
  L4_103 = _soldierName
  L4_103 = L4_103[3]
  L3_102 = L3_102(L4_103)
  L4_103 = Fn_findNpcPuppet
  L4_103 = L4_103(_soldierName[17])
  L3_102 = setCrowAttack
  L4_103 = true
  L3_102(L4_103, L2_101)
  L3_102 = print
  L4_103 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[3]"
  L3_102(L4_103)
  L3_102 = print
  L4_103 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[17]"
  L3_102(L4_103)
  L3_102 = print
  L4_103 = "\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[21]"
  L3_102(L4_103)
  while true do
    L3_102 = _soldierInstance
    L3_102 = L3_102[3]
    L3_102 = L3_102.status
    L4_103 = NPC_STATUS
    L4_103 = L4_103.DEAD
    if L3_102 == L4_103 then
      L3_102 = _soldierInstance
      L3_102 = L3_102[17]
      L3_102 = L3_102.status
      L4_103 = NPC_STATUS
      L4_103 = L4_103.DEAD
      if L3_102 == L4_103 then
        L3_102 = _soldierInstance
        L3_102 = L3_102[21]
        L3_102 = L3_102.status
        L4_103 = NPC_STATUS
        L4_103 = L4_103.DEAD
      end
    end
    if L3_102 ~= L4_103 then
      L3_102 = wait
      L3_102()
    end
  end
  L3_102 = setCrowAttack
  L4_103 = false
  L3_102(L4_103, nil)
  L3_102 = {
    L4_103,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_01"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_02"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 20,
      enable_normal_gravity = true
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_02"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_03"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_04"):getWorldPos(),
      action = Supporter.MovePoint.Ground,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect01_04"):getWorldPos(),
      action = Supporter.MovePoint.Idle,
      vel = 20
    }
  }
  L4_103 = {}
  L4_103.pos = _puppet_crow:getWorldPos()
  L4_103.action = Supporter.MovePoint.Air
  L4_103.vel = 20
  L4_103 = _brain_crow
  L4_103 = L4_103.clearMovePoint
  L4_103(L4_103)
  L4_103 = _brain_crow
  L4_103 = L4_103.setMovePoints
  L4_103(L4_103, L3_102)
  L4_103 = _brain_crow
  L4_103 = L4_103.startMovePoint
  L4_103(L4_103)
  while true do
    L4_103 = _brain_crow
    L4_103 = L4_103.isMovePointEnd
    L4_103 = L4_103(L4_103)
    if L4_103 then
      L4_103 = _brain_crow
      L4_103 = L4_103.clearMovePoint
      L4_103(L4_103)
      L4_103 = print
      L4_103("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:\231\183\143\231\157\163\229\186\156\227\129\168\227\129\175\233\128\134\229\129\180\227\129\167\227\129\1741\229\155\158\231\155\174\227\129\174\230\136\166\233\151\152\229\190\140 \231\157\128\229\156\176\231\130\185\227\129\190\227\129\167")
      break
    end
    L4_103 = wait
    L4_103()
  end
  L4_103 = setNpcDamagedTask
  L4_103(5, 22)
  L4_103 = setNpcDamagedTask
  L4_103(5, 23)
  L4_103 = setNpcDamagedTask
  L4_103(22, 5)
  L4_103 = setNpcDamagedTask
  L4_103(22, 23)
  L4_103 = setNpcDamagedTask
  L4_103(23, 5)
  L4_103 = setNpcDamagedTask
  L4_103(23, 22)
  L4_103 = {
    Fn_findNpcPuppet(_soldierName[5]),
    Fn_findNpcPuppet(_soldierName[22]),
    Fn_findNpcPuppet(_soldierName[23])
  }
  setCrowAttack(true, L4_103)
  print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[5]")
  print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[22]")
  print("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[23]")
  while _soldierInstance[5].status ~= NPC_STATUS.DEAD or _soldierInstance[22].status ~= NPC_STATUS.DEAD or _soldierInstance[23].status ~= NPC_STATUS.DEAD do
    wait()
  end
  setCrowAttack(false, nil)
  _brain_crow:setAbility(Supporter.Ability.Follow, true)
  print("\231\183\143\231\157\163\229\186\156\227\129\168\233\128\134\229\129\180\227\129\174\233\129\147\227\129\174\230\149\181\227\130\146\229\133\168\227\129\166\229\128\146\227\129\151\227\129\159\227\129\159\227\130\129\227\128\129\227\130\175\227\131\173\227\130\166\227\129\174\232\168\173\229\174\154\227\130\146\232\191\189\229\190\147\227\129\171\229\164\137\230\155\180")
end
function crow_process_branch_incorrect_02()
  local L0_104, L1_105, L2_106, L3_107
  _branch_incorrect_02_OnEnter = true
  _branch_goal_OnEnter = false
  _branch_incorrect_01_OnEnter = false
  L0_104 = _brain_crow
  L1_105 = L0_104
  L0_104 = L0_104.setAbility
  L2_106 = Supporter
  L2_106 = L2_106.Ability
  L2_106 = L2_106.Attack
  L3_107 = false
  L0_104(L1_105, L2_106, L3_107)
  L0_104 = _brain_crow
  L1_105 = L0_104
  L0_104 = L0_104.clearMovePoint
  L0_104(L1_105)
  while true do
    L0_104 = _brain_crow
    L1_105 = L0_104
    L0_104 = L0_104.isWarpActionEnd
    L0_104 = L0_104(L1_105)
    if L0_104 then
      L0_104 = print
      L1_105 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\175\227\131\188\227\131\151\229\174\140\228\186\134\227\130\146\231\162\186\232\170\141\227\129\151\227\129\159\227\129\159\227\130\129\230\172\161\227\129\174\232\161\140\229\139\149\227\129\184"
      L0_104(L1_105)
      break
    end
    L0_104 = wait
    L0_104()
  end
  L0_104 = Fn_findNpcPuppet
  L1_105 = _soldierName
  L1_105 = L1_105[11]
  L0_104 = L0_104(L1_105)
  L1_105 = _brain_crow
  L2_106 = L1_105
  L1_105 = L1_105.clearMovePoint
  L1_105(L2_106)
  L1_105 = {
    L2_106,
    L3_107,
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_attack_06"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_attack_06"):getWorldPos(),
      action = Supporter.MovePoint.Turn,
      duraion = 0.1,
      node_lookat = L0_104
    }
  }
  L2_106 = {}
  L3_107 = _puppet_crow
  L3_107 = L3_107.getWorldPos
  L3_107 = L3_107(L3_107)
  L2_106.pos = L3_107
  L3_107 = Supporter
  L3_107 = L3_107.MovePoint
  L3_107 = L3_107.Takeoff
  L2_106.action = L3_107
  L2_106.vel = 20
  L3_107 = {}
  L3_107.pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect02_01"):getWorldPos()
  L3_107.action = Supporter.MovePoint.Air
  L3_107.vel = 20
  L2_106 = _brain_crow
  L3_107 = L2_106
  L2_106 = L2_106.clearMovePoint
  L2_106(L3_107)
  L2_106 = _brain_crow
  L3_107 = L2_106
  L2_106 = L2_106.setMovePoints
  L2_106(L3_107, L1_105)
  L2_106 = _brain_crow
  L3_107 = L2_106
  L2_106 = L2_106.startMovePoint
  L2_106(L3_107)
  while true do
    L2_106 = _brain_crow
    L3_107 = L2_106
    L2_106 = L2_106.isMovePointEnd
    L2_106 = L2_106(L3_107)
    if L2_106 then
      L2_106 = _brain_crow
      L3_107 = L2_106
      L2_106 = L2_106.clearMovePoint
      L2_106(L3_107)
      L2_106 = print
      L3_107 = "\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:\229\136\134\227\129\139\227\130\140\233\129\147\227\129\174\233\150\128\227\130\146\233\128\154\227\129\163\227\129\159\229\133\136 \230\148\187\230\146\131\229\190\133\230\169\159\228\189\141\231\189\174\227\129\190\227\129\167"
      L2_106(L3_107)
      break
    end
    L2_106 = wait
    L2_106()
  end
  L2_106 = setNpcDamagedTask
  L3_107 = 11
  L2_106(L3_107, 12)
  L2_106 = setNpcDamagedTask
  L3_107 = 11
  L2_106(L3_107, 13)
  L2_106 = setNpcDamagedTask
  L3_107 = 12
  L2_106(L3_107, 11)
  L2_106 = setNpcDamagedTask
  L3_107 = 12
  L2_106(L3_107, 13)
  L2_106 = setNpcDamagedTask
  L3_107 = 13
  L2_106(L3_107, 11)
  L2_106 = setNpcDamagedTask
  L3_107 = 13
  L2_106(L3_107, 12)
  L2_106 = {
    L3_107,
    Fn_findNpcPuppet(_soldierName[12]),
    Fn_findNpcPuppet(_soldierName[13])
  }
  L3_107 = Fn_findNpcPuppet
  L3_107 = L3_107(_soldierName[11])
  L3_107 = setCrowAttack
  L3_107(true, L2_106)
  L3_107 = print
  L3_107("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[11]")
  L3_107 = print
  L3_107("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[12]")
  L3_107 = print
  L3_107("\227\130\175\227\131\173\227\130\166\227\129\174\230\148\187\230\146\131\229\175\190\232\177\161\227\130\146\232\168\173\229\174\154:_soldierName[13]")
  while true do
    L3_107 = _soldierInstance
    L3_107 = L3_107[11]
    L3_107 = L3_107.status
    if L3_107 == NPC_STATUS.DEAD then
      L3_107 = _soldierInstance
      L3_107 = L3_107[12]
      L3_107 = L3_107.status
      if L3_107 == NPC_STATUS.DEAD then
        L3_107 = _soldierInstance
        L3_107 = L3_107[13]
        L3_107 = L3_107.status
      end
    end
    if L3_107 ~= NPC_STATUS.DEAD then
      L3_107 = wait
      L3_107()
    end
  end
  L3_107 = setCrowAttack
  L3_107(false, nil)
  L3_107 = _brain_crow
  L3_107 = L3_107.clearMovePoint
  L3_107(L3_107)
  L3_107 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect02_02"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect02_03"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect02_04"):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = findGameObject2("Node", "locator2_crow_movepoints_incorrect02_04"):getWorldPos(),
      action = Supporter.MovePoint.Alight,
      vel = 20,
      enable_normal_gravity = true
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L3_107)
  _brain_crow:startMovePoint()
  while true do
    if _brain_crow:isMovePointEnd() then
      _brain_crow:clearMovePoint()
      print("\227\130\175\227\131\173\227\130\166\227\129\174\231\167\187\229\139\149\229\174\140\228\186\134:\229\136\134\227\129\139\227\130\140\233\129\147\227\129\174\233\150\128\227\130\146\233\128\154\227\129\163\227\129\159\229\133\136 \230\136\166\233\151\152\229\190\140\227\129\174\231\157\128\229\156\176\231\130\185\227\129\190\227\129\167")
      break
    end
    wait()
  end
  _brain_crow:setAbility(Supporter.Ability.Follow, true)
  print("\233\150\128\227\130\146\233\128\154\227\129\163\227\129\159\229\133\136\227\129\174\230\149\181\227\130\146\229\133\168\227\129\166\229\128\146\227\129\151\227\129\159\227\129\159\227\130\129\227\128\129\227\130\175\227\131\173\227\130\166\227\129\174\232\168\173\229\174\154\227\130\146\232\191\189\229\190\147\227\129\171\229\164\137\230\155\180")
end
function setNpcDamagedTask(A0_108, A1_109)
  Fn_findNpc(_soldierName[A0_108]):setEventListener("npcDamaged", function(A0_110)
    if _npc_damaged == false then
      setCrowAttack(false, nil)
      setCrowAction_FallKick(Fn_findNpcPuppet(_soldierName[A1_109]))
      _npc_damaged = true
      print("npcDamaged:\227\130\175\227\131\173\227\130\166\227\129\140\230\148\187\230\146\131\229\190\133\230\169\159\228\184\173\227\129\171\230\148\187\230\146\131\227\130\146\227\129\151\227\129\159")
      print("damagedNpcName:" .. _soldierName[A0_108] .. ", targetNpcName:" .. _soldierName[A1_109])
      if A0_110.damageType == "GravityThrow" or A0_110.damageType == "water" or A0_110.attacker == "supporter" then
        soldierActionep10c(_soldierName[A0_108], CALLBACK_REASON.BEGIN_COMBAT, true)
      end
    end
  end)
  Fn_findNpc(_soldierName[A0_108]):setEventListener("npcDead", function(A0_111)
    if _npc_damaged == false then
      setCrowAttack(false, nil)
      setCrowAction_FallKick(Fn_findNpcPuppet(_soldierName[A1_109]))
      _npc_damaged = true
      print("npcDead:\227\130\175\227\131\173\227\130\166\227\129\140\230\148\187\230\146\131\229\190\133\230\169\159\228\184\173\227\129\171\230\148\187\230\146\131\227\130\146\227\129\151\227\129\166\229\128\146\227\129\151\227\129\159")
      print("damagedNpcName:" .. _soldierName[A0_108] .. ", targetNpcName:" .. _soldierName[A1_109])
      if A0_111.damageType == "GravityThrow" or A0_111.damageType == "water" or A0_111.attacker == "supporter" then
        soldierActionep10c(_soldierName[A1_109], CALLBACK_REASON.BEGIN_COMBAT, true)
      end
    end
    _soldierInstance[A0_108].status = NPC_STATUS.DEAD
    if _soldierInstance[A0_108].status == NPC_STATUS.DEAD and _soldierInstance[A1_109].status == NPC_STATUS.DEAD then
      soldierActionep10c(_soldierName[A0_108], CALLBACK_REASON.DIED, true)
    end
  end)
end
function setCrowAction_FallKick(A0_112)
  local L1_113
  L1_113 = _brain_crow
  L1_113 = L1_113.clearSpAction
  L1_113(L1_113)
  L1_113 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.Takeoff,
      vel = 20
    },
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.FallKick,
      target = A0_112,
      power = 1000,
      vel = 20
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L1_113)
  _brain_crow:startMovePoint()
  print("\230\140\135\229\174\154\227\129\174\230\149\181\227\129\171\229\144\145\227\129\139\227\129\163\227\129\166\227\130\175\227\131\173\227\130\166\227\129\174\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\231\153\186\229\139\149")
  invokeTask(function()
    while true do
      if _brain_crow:isMovePointEnd() then
        _brain_crow:clearMovePoint()
        print("\230\140\135\229\174\154\227\129\174\230\149\181\227\129\171\229\144\145\227\129\139\227\129\163\227\129\166\227\130\175\227\131\173\227\130\166\227\129\174\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\231\153\186\229\139\149\229\174\140\228\186\134")
        break
      end
      wait()
    end
  end)
end
function setCrowAttack(A0_114, A1_115)
  local L2_116
  if A0_114 == true then
    L2_116 = print
    L2_116("\227\130\175\227\131\173\227\130\166\230\148\187\230\146\131\227\131\162\227\131\188\227\131\137")
    L2_116 = _brain_crow
    L2_116 = L2_116.setAbility
    L2_116(L2_116, Supporter.Ability.Attack, true)
    L2_116 = _brain_crow
    L2_116 = L2_116.setAbility
    L2_116(L2_116, Supporter.Ability.ActionInAir, true)
    L2_116 = _kaiwa_skip_flag
    if L2_116 == false then
      L2_116 = print
      L2_116("\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\230\148\187\230\146\131\233\150\139\229\167\139\227\129\153\227\130\139\227\129\190\227\129\167\229\190\133\227\129\164\232\168\173\229\174\154\227\129\171\227\129\153\227\130\139")
      L2_116 = {}
      L2_116.action = Supporter.SpAction.WaitForPlayerAttackStart_Fixed
      L2_116.target_type = Supporter.TargetType.TargetTable
      L2_116.targets = A1_115
      L2_116.power = 1000
      L2_116.forced = true
      _brain_crow:setSpAction(L2_116)
      _brain_crow:setAbility(Supporter.Ability.Damaged, false)
      _brain_crow:setAbility(Supporter.Ability.Avoid, false)
    else
      L2_116 = print
      L2_116("\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\174\230\148\187\230\146\131\227\130\146\229\190\133\227\129\159\227\129\154\227\129\171\230\148\187\230\146\131\233\150\139\229\167\139")
      L2_116 = _brain_crow
      L2_116 = L2_116.setThreatObjects
      L2_116(L2_116, A1_115)
    end
  else
    L2_116 = print
    L2_116("\227\130\175\227\131\173\227\130\166\233\157\158\230\148\187\230\146\131\227\131\162\227\131\188\227\131\137")
    L2_116 = _brain_crow
    L2_116 = L2_116.clearSpAction
    L2_116(L2_116)
    L2_116 = _brain_crow
    L2_116 = L2_116.setAbility
    L2_116(L2_116, Supporter.Ability.Attack, false)
    L2_116 = _brain_crow
    L2_116 = L2_116.setAbility
    L2_116(L2_116, Supporter.Ability.Damaged, true)
    L2_116 = _brain_crow
    L2_116 = L2_116.setAbility
    L2_116(L2_116, Supporter.Ability.Avoid, true)
    _npc_damaged = false
  end
end
function crowWarpControl()
  local L0_117
  L0_117 = {}
  L0_117.distance = 80
  _brain_crow:setWarpParams(L0_117)
end
function npcInit()
  _soldierName = {
    "npcgen2_soldier_01",
    "npcgen2_soldier_02",
    "npcgen2_soldier_03",
    "npcgen2_soldier_04",
    "npcgen2_soldier_05",
    "npcgen2_soldier_06",
    "npcgen2_soldier_07",
    "npcgen2_soldier_08",
    "npcgen2_soldier_09",
    "npcgen2_soldier_10",
    "npcgen2_soldier_11",
    "npcgen2_soldier_12",
    "npcgen2_soldier_13",
    "npcgen2_soldier_14",
    "npcgen2_soldier_15",
    "npcgen2_soldier_16",
    "npcgen2_soldier_17",
    "npcgen2_soldier_18",
    "npcgen2_soldier_19",
    "npcgen2_soldier_20",
    "npcgen2_soldier_21",
    "npcgen2_soldier_22",
    "npcgen2_soldier_23",
    "npcgen2_soldier_24",
    "npcgen2_soldier_25",
    "npcgen2_soldier_26"
  }
  for _FORV_4_ = 1, _soldier_max do
    if _mission_phase == _PHASE.BATTLE01 or _mission_phase == _PHASE.BATTLE02 and _FORV_4_ ~= 6 and _FORV_4_ ~= 7 or _mission_phase == _PHASE.BATTLE03 and _FORV_4_ ~= 6 and _FORV_4_ ~= 7 and _FORV_4_ ~= 9 and _FORV_4_ ~= 10 or _mission_phase == _PHASE.BRANCH and _FORV_4_ ~= 6 and _FORV_4_ ~= 7 and _FORV_4_ ~= 9 and _FORV_4_ ~= 10 and _FORV_4_ ~= 18 and _FORV_4_ ~= 19 or _mission_phase == _PHASE.EXAMINE and (_FORV_4_ ~= 6 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 7 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 9 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 10 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 18 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 19 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 4 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) and (_FORV_4_ ~= 14 or _soldierInstance[_FORV_4_].status ~= NPC_STATUS.DEAD) then
      if _soldierInstance[_FORV_4_] ~= nil and _soldierInstance[_FORV_4_].task ~= nil then
        _soldierInstance[_FORV_4_].task:abort()
        _soldierInstance[_FORV_4_].task = nil
      end
      _soldierInstance[_FORV_4_] = PerceivableNpc.new(_soldierName[_FORV_4_], true)
      _soldierInstance[_FORV_4_]:setPosList(({
        {
          {
            pos = "locator2_soldier_01_01",
            opt = nil
          },
          {
            pos = "locator2_soldier_01_02",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_02_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_03_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_04_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_05_01",
            opt = nil
          },
          {
            pos = "locator2_soldier_05_02",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_06_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_07_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_08_01",
            opt = nil
          },
          {
            pos = "locator2_soldier_08_02",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_09_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_10_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_11_01",
            opt = nil
          },
          {
            pos = "locator2_soldier_11_02",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_12_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_13_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_14_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_15_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_16_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_17_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_18_00",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_19_00",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_20_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_21_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_22_01",
            opt = nil
          },
          {
            pos = "locator2_soldier_22_02",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_23_01",
            opt = nil
          },
          {
            pos = "locator2_soldier_23_02",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_24_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_25_01",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_soldier_26_01",
            opt = nil
          }
        }
      })[_FORV_4_])
      _soldierInstance[_FORV_4_]:setMoveOption(_move_option_soldier_normal)
      _soldierInstance[_FORV_4_]:setChaseMoveOption(_move_option_soldier_alert)
      _soldierInstance[_FORV_4_]:setSightParam(60, 20)
      _soldierInstance[_FORV_4_]:setCautionCoefficient(_NPC_CAUTION_INC, _NPC_CAUTION_DEC)
      _soldierInstance[_FORV_4_]:setOnChangeState(soldierActionep10c)
      _soldierInstance[_FORV_4_]:setCombatReady(true)
      _soldierInstance[_FORV_4_]:setCombatTimeEnable(true)
      _soldierInstance[_FORV_4_]:setCombatTime(4)
      _soldierInstance[_FORV_4_]:setDismissMotion(_sol_motion_list.lookaround)
      _soldierInstance[_FORV_4_]:setIndicationEnable(true)
      _soldierInstance[_FORV_4_]:setIndicationRange(18)
      _soldierInstance[_FORV_4_]:setIndicationCoefficient(10, 3)
      _soldierInstance[_FORV_4_]:setTerminate(true)
      _soldierInstance[_FORV_4_]:action()
      Fn_findNpc(_soldierName[_FORV_4_]):enableHomingTarget(true)
      Fn_findNpc(_soldierName[_FORV_4_]):setDamage(true)
      Fn_findNpc(_soldierName[_FORV_4_]):setKnockbackAshFlag()
      _npcTable[_FORV_4_] = _soldierInstance[_FORV_4_]
      if _FORV_4_ == 6 then
        if _soldierInstance[7] == nil or _soldierInstance[7] and _soldierInstance[7].status ~= NPC_STATUS.DEAD then
          _soldierInstance[_FORV_4_]:setStayMotion(_sol_motion_list.talk_00)
        else
          Fn_playMotionNpc(_soldierInstance[_FORV_4_].npcName, _sol_motion_list.lookaround, false)
        end
        _soldierInstance[6]:setLoop(false)
      elseif _FORV_4_ == 7 then
        if _soldierInstance[6].status ~= NPC_STATUS.DEAD then
          _soldierInstance[_FORV_4_]:setStayMotion(_sol_motion_list.talk_01)
        else
          Fn_playMotionNpc(_soldierInstance[_FORV_4_].npcName, _sol_motion_list.lookaround, false)
        end
        _soldierInstance[7]:setLoop(false)
      elseif _FORV_4_ == 9 then
        if _soldierInstance[10] == nil or _soldierInstance[10] and _soldierInstance[10].status ~= NPC_STATUS.DEAD then
          _soldierInstance[_FORV_4_]:setStayMotion(_sol_motion_list.talk_01)
        else
          Fn_playMotionNpc(_soldierInstance[_FORV_4_].npcName, _sol_motion_list.lookaround, false)
        end
        _soldierInstance[9]:setLoop(false)
      elseif _FORV_4_ == 10 then
        if _soldierInstance[9].status ~= NPC_STATUS.DEAD then
          _soldierInstance[_FORV_4_]:setStayMotion(_sol_motion_list.talk_00)
        else
          Fn_playMotionNpc(_soldierInstance[_FORV_4_].npcName, _sol_motion_list.lookaround, false)
        end
        _soldierInstance[10]:setLoop(false)
      elseif _FORV_4_ == 18 then
        if _soldierInstance[19] == nil or _soldierInstance[19] and _soldierInstance[19].status ~= NPC_STATUS.DEAD then
          _soldierInstance[_FORV_4_]:setStayMotion(_sol_motion_list.talk_00)
        else
          Fn_playMotionNpc(_soldierInstance[_FORV_4_].npcName, _sol_motion_list.lookaround, false)
        end
        _soldierInstance[18]:setLoop(false)
      elseif _FORV_4_ == 19 then
        if _soldierInstance[18].status ~= NPC_STATUS.DEAD then
          _soldierInstance[_FORV_4_]:setStayMotion(_sol_motion_list.talk_01)
        end
        _soldierInstance[19]:setLoop(false)
      elseif _FORV_4_ == 4 then
        _soldierInstance[4]:setLoop(false)
      elseif _FORV_4_ == 14 then
        _soldierInstance[14]:setLoop(false)
      end
    end
  end
  _FOR_[2]:setIndicationRange(2)
  _soldierInstance[12]:setStayMotion(_sol_motion_list.talk_01)
  _soldierInstance[13]:setStayMotion(_sol_motion_list.talk_00)
  _soldierInstance[25]:setStayMotion(_sol_motion_list.rifle_push)
  _soldierInstance[26]:setStayMotion(_sol_motion_list.rifle_push)
  _soldierInstance[1]:setLoop(true)
  _soldierInstance[2]:setLoop(true)
  _soldierInstance[3]:setLoop(false)
  _soldierInstance[5]:setLoop(true)
  _soldierInstance[8]:setLoop(true)
  _soldierInstance[11]:setLoop(true)
  _soldierInstance[12]:setLoop(false)
  _soldierInstance[13]:setLoop(false)
  _soldierInstance[15]:setLoop(false)
  _soldierInstance[16]:setLoop(false)
  _soldierInstance[17]:setLoop(false)
  _soldierInstance[20]:setLoop(false)
  _soldierInstance[21]:setLoop(false)
  _soldierInstance[22]:setLoop(true)
  _soldierInstance[23]:setLoop(true)
  _soldierInstance[24]:setLoop(false)
  _soldierInstance[25]:setLoop(false)
  _soldierInstance[26]:setLoop(false)
end
function detectedBySoldier(A0_118)
  if _detected_soldier then
    return
  end
  print("\227\130\183\227\130\183\227\130\163\227\130\183\227\131\137\227\131\188\231\153\186\232\166\139\228\184\173\227\129\175\229\133\181\229\163\171\227\129\140\233\128\154\229\160\177\227\129\151\227\129\170\227\129\132", _playing_detect_sis_and_cid_seq)
  if _playing_detect_sis_and_cid_seq then
    return
  end
  _detected_soldier = true
  print("\226\150\160\226\150\160\226\150\160_detected_soldier = true\226\150\160\226\150\160")
  _sehandle = Sound:playSEHandle("ep10_siren", 1)
  if _detected_on_sensor == true then
    setPlayerIdle2()
    Fn_userCtrlAllOff()
  elseif _restart_warship == true then
    setPlayerIdle2()
  end
  setCrowAttack(false, nil)
  _kaiwa_skip_flag = false
  _mechskytask:abort()
  _mechskytask = nil
  clearMechSkyTask()
  _processingPcReset = true
  invokeTask(function()
    local L0_119, L1_120, L2_121, L3_122
    if L0_119 ~= true then
    else
      if L0_119 == false then
        L0_119(L1_120)
    end
    elseif L0_119 then
      L0_119(L1_120)
      _restart_warship = false
    end
    L0_119(L1_120)
    L0_119(L1_120)
    L0_119(L1_120, L2_121)
    L0_119(L1_120)
    L3_122 = 20
    L0_119(L1_120, L2_121, L3_122, true, true)
    L0_119(L1_120)
    if L0_119 ~= nil then
      L0_119(L1_120)
      _crow_process_task = nil
    end
    if L0_119 ~= nil then
      L0_119(L1_120)
      _view_control_task = nil
    end
    if L0_119 == L1_120 then
      L0_119(L1_120)
      L0_119()
      L3_122 = L2_121
      L2_121(L3_122, L0_119, L1_120)
      _hint1_kaiwa = false
    elseif L0_119 == L1_120 then
      L0_119(L1_120)
      L0_119()
      L3_122 = L2_121
      L2_121(L3_122, L0_119, L1_120)
    elseif L0_119 == L1_120 then
      L0_119(L1_120)
      L0_119()
      L3_122 = L2_121
      L2_121(L3_122, L0_119, L1_120)
    elseif L0_119 == L1_120 then
      L0_119(L1_120, L2_121)
      L0_119(L1_120)
      L0_119()
      L3_122 = L2_121
      L2_121(L3_122, L0_119, L1_120)
    elseif L0_119 == L1_120 then
      L0_119(L1_120)
      L0_119()
      L3_122 = L2_121
      L2_121(L3_122, L0_119, L1_120)
    end
    L0_119(L1_120)
    L0_119(L1_120)
    for L3_122 = 1, _soldier_max do
      if _npcTable[L3_122].status ~= NPC_STATUS.DEAD then
        if _npcTable[L3_122].npc:isEnemy() then
          _npcTable[L3_122].npc:changeNpc()
          print(_npcTable[L3_122].npcName .. "\227\130\146\233\128\154\229\184\184\227\130\185\227\131\134\227\131\188\227\130\191\227\130\185\227\129\171\230\136\187\227\129\153")
        end
        _npcTable[L3_122].npc:reset()
        _npcTable[L3_122].status = NPC_STATUS.NORMAL
        Fn_warpNpc(_soldierInstance[L3_122].npcName, "locator2_soldier_" .. string.format("%02d", L3_122) .. "_01")
      end
    end
    _begin_combat = false
    if L0_119 then
      L0_119(L1_120, L2_121)
      _sehandle = nil
    end
    L0_119()
    L0_119()
    L0_119()
    for L3_122 = 1, _soldier_max do
      if _mission_phase == _PHASE.BATTLE01 or _mission_phase == _PHASE.BATTLE02 and L3_122 ~= 6 and L3_122 ~= 7 or _mission_phase == _PHASE.BATTLE03 and L3_122 ~= 6 and L3_122 ~= 7 and L3_122 ~= 9 and L3_122 ~= 10 or _mission_phase == _PHASE.BRANCH and L3_122 ~= 6 and L3_122 ~= 7 and L3_122 ~= 9 and L3_122 ~= 10 and L3_122 ~= 18 and L3_122 ~= 19 or _mission_phase == _PHASE.EXAMINE and (L3_122 ~= 6 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 7 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 9 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 10 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 18 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 19 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 4 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) and (L3_122 ~= 14 or _soldierInstance[L3_122].status ~= NPC_STATUS.DEAD) then
        resurrectionSoldier(L3_122)
      else
        print("\226\150\160\226\150\160\226\150\160_mission_phase\226\150\160\226\150\160\226\150\160", _mission_phase, L3_122)
      end
    end
    L0_119()
    L0_119()
    L0_119()
    if L0_119 == L1_120 then
      L0_119(L1_120, L2_121)
      L0_119(L1_120, L2_121)
    end
    if L0_119 == L1_120 then
      _crow_process_task = L0_119
    elseif L0_119 == L1_120 then
      _crow_process_task = L0_119
    elseif L0_119 == L1_120 then
      _crow_process_task = L0_119
    elseif L0_119 == L1_120 then
      _crow_process_task = L0_119
    elseif L0_119 == L1_120 then
      _crow_process_task = L0_119
    end
    _detected_soldier = false
    L0_119(L1_120)
    _detected_on_sensor = false
    L0_119(L1_120)
    L0_119()
    L0_119()
    L3_122 = Player
    L3_122 = L3_122.getEnergyMax
    L3_122 = L3_122(L3_122, Player.kEnergy_Gravity)
    L0_119(L1_120, L2_121, L3_122, true)
    L0_119()
    L0_119(L1_120, L2_121)
    _processingPcReset = false
    if L0_119 ~= L1_120 then
      L0_119(L1_120)
    end
    L0_119()
    L0_119()
    _npc_damaged = false
  end)
end
function resurrectionSoldier(A0_123)
  if _npcTable[A0_123].status == NPC_STATUS.DEAD then
    Fn_disappearNpc(_npcTable[A0_123].npcName)
    Fn_setupNpc({
      {
        name = _npcTable[A0_123].npcName,
        type = "soldier",
        start = true
      }
    })
    Fn_loadNpcEventMotion(_npcTable[A0_123].npcName, _sol_motion_list)
    Fn_warpNpc(_soldierInstance[A0_123].npcName, "locator2_soldier_" .. string.format("%02d", A0_123) .. "_01")
    print(_npcTable[A0_123].npcName .. "\227\130\146\231\148\159\227\129\141\232\191\148\227\130\137\227\129\155\227\130\139")
  end
end
function detectedCaptionView(A0_124, A1_125)
  local L2_126, L3_127
  L2_126 = findGameObject2
  L3_127 = "EnemyBrain"
  L2_126 = L2_126(L3_127, A0_124)
  L3_127 = 0
  for _FORV_7_ = 1, #_soldierName do
    if _soldierName[_FORV_7_] == A0_124 then
      L3_127 = _FORV_7_
      break
    end
  end
  if L2_126 ~= nil and 0 < L2_126:getHealth() and _soldierInstance[L3_127].status ~= NPC_STATUS.DEAD then
    Fn_captionView(A1_125)
  end
end
function drawCautionLevel()
  CautionLevel.setNpc(_npcTable)
  CautionLevel.setLabel("ep10_09018")
  CautionLevel.drawTask()
  CautionLevel.setKeepVisible()
  Fn_naviKill()
end
function setupMechSkyTask()
  _mechskytask = invokeTask(function()
    local L0_128, L1_129, L2_130, L3_131, L4_132, L5_133
    L0_128 = {}
    L1_129 = findGameObject2
    L1_129 = L1_129(L2_130, L3_131)
    for L5_133 = 1, 16 do
      L0_128[L5_133] = findGameObject2("EnemyBrain", "mechsky" .. string.format("%02d", L5_133))
      repeat
        wait()
      until L0_128[L5_133]:isReadyEnemy()
    end
    for L5_133, _FORV_6_ in L2_130(L3_131) do
      _FORV_6_:setEnableHomingTarget(false)
      _FORV_6_:setVisibleEnemyMarker(false)
    end
    L2_130.loop = true
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    L3_131(L4_132, L5_133, L2_130)
    for _FORV_7_ = 1, #L3_131 do
      findGameObject2("Puppet", "mechsky" .. string.format("%02d", L3_131[_FORV_7_])):setPos(findGameObject2("Node", "locator2_mechsky_" .. string.format("%02d", L3_131[_FORV_7_])):getPos())
      findGameObject2("Puppet", "mechsky" .. string.format("%02d", L3_131[_FORV_7_])):setRot(findGameObject2("Node", "locator2_mechsky_" .. string.format("%02d", L3_131[_FORV_7_])):getRot())
    end
  end)
end
function clearMechSkyTask()
  local L0_134, L1_135, L2_136, L3_137, L4_138, L5_139
  L0_134 = {}
  L1_135 = findGameObject2
  L1_135 = L1_135(L2_136, L3_137)
  for L5_139 = 1, 16 do
    L0_134[L5_139] = findGameObject2("EnemyBrain", "mechsky" .. string.format("%02d", L5_139))
    L0_134[L5_139]:endScriptAction()
  end
end
function ep10c_sdemo_01()
  local L0_140, L1_141
  L0_140 = waitSeconds
  L1_141 = 0.7
  L0_140(L1_141)
  L0_140 = findGameObject2
  L1_141 = "Node"
  L0_140 = L0_140(L1_141, "locator2_cam_04")
  L1_141 = findGameObject2
  L1_141 = L1_141("Node", "locator2_aim_04")
  _sdemo_cut01:set(L0_140, L1_141)
  _sdemo_cut01:play()
  _sdemo_cut01:zoomIn(2, {deg = 30}, "Linear")
  _sdemo_cut01:zoomIn(3, {deg = 28}, "easeOut")
  Fn_kaiwaDemoView("ep10_00160k")
  _sdemo_cut01:stop(0)
  _sdemo_cut01 = nil
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_pcSensorOff("pccubesensor2_bridge_01")
end
function detectWarship()
  invokeTask(function()
    local L0_142
    L0_142 = nil
    while true do
      if L0_142 == nil then
        L0_142 = Fn_findAreaHandle("ar_a_root")
      elseif Fn_getDistanceToPlayer(L0_142) < 250 then
        print("\230\142\165\232\191\145\227\129\151\227\129\166\227\130\139\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\129", Fn_getDistanceToPlayer(L0_142))
        _restart_warship = true
        detectedBySoldier()
        break
      end
      wait(4)
    end
  end)
end
function chackMonumentBroken()
  invokeTask(function()
    local L0_143
    L0_143 = Fn_findGimmickBgInBgset
    L0_143 = L0_143("go_fountain_a_01")
    if L0_143:isBroken() == false then
      while true do
        print("go_fountain_a_01", L0_143, L0_143:isBroken())
        if L0_143:isBroken() == true then
          print("\226\150\160\226\150\160\227\131\162\227\131\139\227\131\165\227\131\161\227\131\179\227\131\136\229\163\138\227\130\140\227\129\159\226\150\160\226\150\160")
          if _soldierInstance[25].status <= 2 then
            _soldierInstance[25]:setCautionLevel(100)
            _soldierInstance[25].status = NPC_STATUS.ALERT
          end
          if 2 >= _soldierInstance[26].status then
            _soldierInstance[26]:setCautionLevel(100)
            _soldierInstance[26].status = NPC_STATUS.ALERT
          end
          break
        else
          if _detected_soldier then
            print("\226\150\160\226\150\160\231\153\186\232\166\139\227\129\149\227\130\140\227\129\166\227\131\162\227\131\139\227\131\165\227\131\161\227\131\179\227\131\136\229\136\164\229\174\154\231\181\130\228\186\134\226\150\160\226\150\160")
        end
        else
          wait(3)
          else
            print("\226\150\160\226\150\160\227\131\162\227\131\139\227\131\165\227\131\161\227\131\179\227\131\136\229\163\138\227\130\140\227\129\166\227\129\132\227\130\139\226\150\160\226\150\160")
          end
        end
      end
  end)
end
