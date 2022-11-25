dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_puppet_tbl = {}
function Initialize()
  chara_table = {
    {
      name = "sm22_old_regime",
      type = "man56",
      node = "locator2_old_regime_a",
      reset = false,
      active = false
    },
    {
      name = "sm22_subordinate_01",
      type = "man57",
      node = "locator2_subordinate_01",
      reset = false,
      attach = false,
      active = false
    },
    {
      name = "sm22_subordinate_02",
      type = "man57",
      node = "locator2_subordinate_02",
      reset = false,
      attach = false,
      active = false
    }
  }
  Fn_setupNpc(chara_table)
  for _FORV_3_, _FORV_4_ in pairs(chara_table) do
    _puppet_tbl[_FORV_4_.name] = Fn_findNpcPuppet(_FORV_4_.name)
  end
  _sdemo_cut01 = SDemo.create("sm22_a_cut01")
  _sdemo_cut02 = SDemo.create("sm22_a_cut02")
  _sdemo_cut03 = SDemo.create("sm22_a_cut03")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestSpawnEnemy"
  L2_2 = "enmgen2_landingship"
  L0_0(L1_1, L2_2)
  while true do
    L0_0 = Fn_sendEventComSb
    L1_1 = "isSpawnEnemyEnd"
    L0_0 = L0_0(L1_1)
    if L0_0 then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestChangeShipMarker"
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestIdleShip"
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = 1
  L1_1, L2_2, L3_3, L4_4 = nil, nil, nil, nil
  L5_5 = Mv_viewObj
  L5_5 = L5_5(L6_6, L7_7)
  L1_1 = L5_5
  L5_5 = {}
  for L9_9, L10_10 in L6_6(L7_7) do
    L11_11 = L10_10.name
    if L11_11 == "sm22_old_regime" then
      L11_11 = Fn_repeatPlayMotion
      L12_12 = L10_10.name
      L13_13 = "talk_02"
      L11_11 = L11_11(L12_12, L13_13, L14_14)
      L5_5[L9_9] = L11_11
    else
      L11_11 = string
      L11_11 = L11_11.sub
      L12_12 = L10_10.name
      L13_13 = 1
      L11_11 = L11_11(L12_12, L13_13, L14_14)
      if L11_11 == "sm22_sub" then
        L11_11 = waitSeconds
        L12_12 = 0.5
        L11_11(L12_12)
        L11_11 = Fn_playLoopMotionRand
        L12_12 = L10_10.name
        L13_13 = {L14_14, L15_15}
        L11_11 = L11_11(L12_12, L13_13, L14_14, L15_15)
        L5_5[L9_9] = L11_11
      end
    end
  end
  L6_6.nevy_in = ""
  L6_6.nevy = "man01_scared_nevy_00"
  L6_6.nevy_out = "man01_scared_out_00"
  L6_6.inform_00 = "man01_inform_nevy_00"
  L6_6.turn_l = "man01_turn_l_00"
  L6_6.turn_r = "man01_turn_r_00"
  MAN_MOT_LIST = L6_6
  for L9_9, L10_10 in L6_6(L7_7) do
    L11_11 = string
    L11_11 = L11_11.sub
    L12_12 = L10_10.type
    L13_13 = 1
    L11_11 = L11_11(L12_12, L13_13, L14_14)
    if L11_11 == "man" then
      L11_11 = Fn_loadNpcEventMotion
      L12_12 = L10_10.name
      L13_13 = MAN_MOT_LIST
      L11_11(L12_12, L13_13)
    end
  end
  L6_6()
  L6_6()
  L6_6(L7_7)
  L6_6(L7_7)
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L6_6(L7_7)
  L6_6(L7_7)
  L9_9 = 0.01
  L10_10 = {}
  L10_10.deg = 50
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L9_9 = "locator2_aim_a_01"
  L10_10 = false
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L6_6(L7_7)
  L7_7.pos = "locator2_cam_a_01"
  L7_7.time = 1.5
  cam_point = L6_6
  L7_7.pos = "locator2_aim_a_01"
  L7_7.time = 1.5
  aim_point = L6_6
  L9_9 = aim_point
  L6_6(L7_7, L8_8, L9_9)
  while true do
    if L6_6 then
      L6_6()
    end
  end
  L6_6(L7_7)
  L9_9 = aim_point
  L6_6(L7_7, L8_8, L9_9)
  L6_6(L7_7)
  L7_7.pos = "locator2_cam_a_01"
  L7_7.time = 1
  cam_point = L6_6
  L7_7.pos = "locator2_aim_a_02"
  L7_7.time = 1
  aim_point = L6_6
  L6_6(L7_7, L8_8)
  while true do
    if L6_6 then
      L6_6()
    end
  end
  L6_6(L7_7, L8_8)
  while true do
    if L6_6 then
      L6_6()
    end
  end
  L6_6(L7_7, L8_8)
  while true do
    if L6_6 then
      L6_6()
    end
  end
  L6_6(L7_7, L8_8)
  L6_6(L7_7, L8_8)
  L6_6(L7_7)
  L9_9 = "sm22_enemy_a_b_02_01"
  L9_9 = "requestEnemyHandle"
  L10_10 = "sm22_enemy_a_b_03_01"
  L9_9 = _sdemo_cut01
  L10_10 = L9_9
  L9_9 = L9_9.play
  L11_11 = cam_point
  L12_12 = aim_point
  L9_9(L10_10, L11_11, L12_12)
  while true do
    L9_9 = _sdemo_cut01
    L10_10 = L9_9
    L9_9 = L9_9.isPlay
    L9_9 = L9_9(L10_10)
    if L9_9 then
      L9_9 = wait
      L9_9()
    end
  end
  L9_9 = {
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17
  }
  L10_10 = "locator2_subordinate_move_01"
  L11_11 = "locator2_subordinate_move_02"
  L12_12 = "locator2_subordinate_move_03"
  L13_13 = "locator2_subordinate_move_04"
  L17_17 = "locator2_subordinate_move_08"
  L10_10 = {
    L11_11,
    L12_12,
    L13_13,
    L14_14
  }
  L11_11 = "locator2_subordinate_move_01"
  L12_12 = "locator2_subordinate_move_02"
  L13_13 = "locator2_subordinate_move_03"
  L11_11 = false
  L12_12 = false
  L13_13 = false
  for L17_17, _FORV_18_ in L14_14(L15_15) do
    if L5_5[L17_17] ~= nil then
      L5_5[L17_17]:abort()
    end
    L5_5[L17_17] = nil
  end
  L14_14(L15_15)
  L14_14(L15_15)
  L14_14(L15_15)
  do break end
  L11_11 = waitSeconds
  L12_12 = 1.7
  L11_11(L12_12)
  L11_11 = Mob
  L12_12 = L11_11
  L11_11 = L11_11.makeSituationPanic
  L13_13 = true
  L11_11(L12_12, L13_13)
  L11_11 = findGameObject2
  L12_12 = "Node"
  L13_13 = "locator2_aim_a_05"
  L11_11 = L11_11(L12_12, L13_13)
  L12_12 = _puppet_tbl
  L12_12 = L12_12.sm22_old_regime
  L13_13 = L12_12
  L12_12 = L12_12.appendChild
  L12_12(L13_13, L14_14, L15_15)
  L12_12 = waitSeconds
  L13_13 = 1.5
  L12_12(L13_13)
  L12_12 = _sdemo_cut01
  L13_13 = L12_12
  L12_12 = L12_12.stop
  L12_12(L13_13, L14_14)
  L12_12 = Fn_setNpcVisible
  L13_13 = "sm22_old_regime"
  L12_12(L13_13, L14_14)
  L12_12 = _sdemo_cut02
  L13_13 = L12_12
  L12_12 = L12_12.set
  L12_12(L13_13, L14_14, L15_15, L16_16)
  L12_12 = _sdemo_cut02
  L13_13 = L12_12
  L12_12 = L12_12.play
  L12_12(L13_13)
  L12_12 = {
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17
  }
  L13_13 = "m23_936a"
  L17_17 = "w07_936a"
  L13_13 = Fn_get_shuffle_teble
  L13_13 = L13_13(L14_14)
  L14_14(L15_15)
  L14_14(L15_15)
  L17_17 = "locator2_subordinate_move_03"
  L17_17 = 0
  L15_15(L16_16, L17_17)
  L16_16.pos = "locator2_cam_a_04"
  L16_16.time = 1.5
  cam_point = L15_15
  L16_16.pos = "locator2_aim_a_05"
  L16_16.time = 1.5
  aim_point = L15_15
  L17_17 = nil
  L15_15(L16_16, L17_17, 0.01, {deg = 60})
  L17_17 = "locator2_cam_a_03"
  L15_15(L16_16, L17_17, "locator2_aim_a_05")
  L15_15(L16_16)
  L15_15(L16_16)
  L17_17 = true
  L15_15(L16_16, L17_17)
  L17_17 = L14_14
  L17_17 = "requestBrain"
  repeat
    L17_17 = wait
    L17_17()
    L17_17 = L16_16.isReadyEnemy
    L17_17 = L17_17(L16_16)
  until L17_17
  L17_17 = L16_16.move
  L17_17(L16_16, {
    "locator2_enemymove_move_01"
  })
  L17_17 = _sdemo_cut03
  L17_17 = L17_17.play
  L17_17(L17_17, cam_point, aim_point)
  while true do
    while true do
      L17_17 = _sdemo_cut03
      L17_17 = L17_17.isPlay
      L17_17 = L17_17(L17_17)
      if L17_17 then
        L17_17 = wait
        L17_17()
      end
    end
  end
  repeat
    L17_17 = wait
    L17_17()
    L17_17 = L16_16.isMoveEnd
    L17_17 = L17_17(L16_16)
  until L17_17
  L17_17 = L16_16.endScriptAction
  L17_17(L16_16)
  L17_17 = {}
  L17_17.degree_h = 90
  L17_17.degree_v = 90
  L17_17.in_length = 100
  L17_17.out_length = 100
  L17_17.valid = true
  L17_17.target = L8_8
  L17_17.watchTarget = true
  waitSeconds(0.5)
  if L15_15:isRunning() then
    L15_15:abort()
  end
  Fn_findNpc("sm22_old_regime"):setSightParam(L17_17)
  Fn_playMotionNpc("sm22_old_regime", "surprise", false)
  waitSeconds(2)
  Fn_kaiwaDemoView("sm22_00300k")
  Fn_findNpc("sm22_old_regime"):resetSightParam()
  if subordinat_move_task:isRunning() then
    subordinat_move_task:abort()
  end
  subordinat_move_task = nil
  if subordinat_move_task2:isRunning() then
    subordinat_move_task2:abort()
  end
  subordinat_move_task2 = nil
  Fn_resetCoercionPose()
  _sdemo_cut03:stop(3)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
