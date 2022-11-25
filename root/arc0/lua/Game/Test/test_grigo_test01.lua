import("math")
import("Debug")
import("Area")
import("EventData")
import("Mob")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
U = dofile("/Game/Misc/underscore.lua")
drift_params = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.8,
    min_a = 0.1,
    max_t = 30,
    min_t = 10
  },
  y = {
    rand = 1,
    sign = 0.85,
    max_a = 1,
    min_a = 0.5,
    max_t = 10,
    min_t = 5
  },
  angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0,
    min_a = 0,
    max_t = 120,
    min_t = 30
  }
}
function _start_game_obj()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function put_gimmick(A0_0, A1_1, A2_2)
  createGameObject2("GimmickBg"):setName(A2_2)
  createGameObject2("GimmickBg"):setDrawModelName(A1_1)
  createGameObject2("GimmickBg"):setCollisionName(A1_1)
  createGameObject2("GimmickBg"):setAttributeName(A1_1)
  createGameObject2("GimmickBg"):setPos(A0_0)
  createGameObject2("GimmickBg"):setAutoRestore(5)
  return (createGameObject2("GimmickBg"))
end
function main()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Game Objects"
  L4_7 = "Player"
  L5_8 = "GravityPower: Infinite"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Mob
  L0_3 = L0_3._mob_set_debug_settings
  L0_3()
  L0_3 = createGameObject2
  L1_4 = "MobGlobal"
  L0_3 = L0_3(L1_4)
  g_mob_global = L0_3
  L0_3 = g_mob_global
  L1_4 = L0_3
  L0_3 = L0_3.setName
  L2_5 = "MobGlobal"
  L0_3(L1_4, L2_5)
  L0_3 = g_mob_global
  L1_4 = L0_3
  L0_3 = L0_3.try_init
  L0_3(L1_4)
  L0_3 = g_mob_global
  L1_4 = L0_3
  L0_3 = L0_3.waitForReady
  L0_3(L1_4)
  L0_3 = g_mob_global
  L1_4 = L0_3
  L0_3 = L0_3.try_start
  L0_3(L1_4)
  L0_3 = {
    L1_4,
    L2_5,
    L3_6,
    L4_7
  }
  L1_4 = {L2_5, L3_6}
  L2_5 = "motion_test_stage1_05"
  L3_6 = {}
  L3_6.fieldNamePrefix = ""
  L3_6.hasField = true
  L2_5 = {L3_6, L4_7}
  L3_6 = "motion_test_stage1_02"
  L4_7 = {}
  L4_7.fieldNamePrefix = ""
  L4_7.hasField = false
  L3_6 = {L4_7, L5_8}
  L4_7 = "motion_test_stage1_03"
  L5_8 = {}
  L5_8.fieldNamePrefix = ""
  L5_8.hasField = false
  L4_7 = {L5_8, L6_9}
  L5_8 = "motion_test_stage1_04"
  L6_9.fieldNamePrefix = ""
  L6_9.hasField = false
  L1_4 = Mob
  L2_5 = L1_4
  L1_4 = L1_4.registerBinders
  L3_6 = L0_3
  L1_4(L2_5, L3_6)
  main_pat = "motion_test_stage1_05"
  L1_4 = Area
  L2_5 = L1_4
  L1_4 = L1_4.setDriftRatioTrans
  L3_6 = 1
  L1_4(L2_5, L3_6)
  L1_4 = Area
  L2_5 = L1_4
  L1_4 = L1_4.setDriftRatioRot
  L3_6 = 1
  L1_4(L2_5, L3_6)
  L1_4 = createGameObject2
  L2_5 = "Area"
  L1_4 = L1_4(L2_5)
  L2_5 = false
  if L2_5 then
    L3_6 = L1_4
    L2_5 = L1_4.setName
    L4_7 = "test_z_root2"
    L2_5(L3_6, L4_7)
  else
    L3_6 = L1_4
    L2_5 = L1_4.setName
    L4_7 = "test_z_root3"
    L2_5(L3_6, L4_7)
  end
  L3_6 = L1_4
  L2_5 = L1_4.setSceneParameters
  L4_7 = "cubemap_03"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setEnableDebugDraw
  L4_7 = false
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setDriftParams
  L4_7 = drift_params
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setDriftInherit
  L4_7 = true
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setDriftEnable
  L4_7 = false
  L2_5(L3_6, L4_7)
  L2_5 = false
  if L2_5 then
    L2_5 = createGameObject2
    L3_6 = "TerrainBg"
    L2_5 = L2_5(L3_6)
    test_sky = L2_5
    L2_5 = test_sky
    L3_6 = L2_5
    L2_5 = L2_5.setName
    L4_7 = "sky_ux_01"
    L2_5(L3_6, L4_7)
    L2_5 = test_sky
    L3_6 = L2_5
    L2_5 = L2_5.setModelName
    L4_7 = "sky_ux_01"
    L2_5(L3_6, L4_7)
    L3_6 = L1_4
    L2_5 = L1_4.appendChild
    L4_7 = test_sky
    L2_5(L3_6, L4_7)
  end
  L2_5 = Vector
  L3_6 = -20
  L4_7 = 0
  L5_8 = 55
  L2_5 = L2_5(L3_6, L4_7, L5_8)
  L3_6 = DebugStage
  L4_7 = L3_6
  L3_6 = L3_6.createTestPlayer
  L5_8 = L2_5
  L10_13 = L7_10(L8_11)
  L10_13 = L6_9(L7_10, L8_11, L9_12, L10_13, L7_10(L8_11))
  L3_6 = L3_6(L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L6_9(L7_10, L8_11, L9_12, L10_13, L7_10(L8_11)))
  L4_7 = _start_game_obj
  L4_7()
  L4_7 = Area
  L5_8 = L4_7
  L4_7 = L4_7.setAnimMoveDriftEnable
  L4_7(L5_8, L6_9)
  L5_8 = L1_4
  L4_7 = L1_4.getDescendant
  L4_7 = L4_7(L5_8)
  L5_8 = L4_7[1]
  main_area = L5_8
  L5_8 = Sound
  L5_8 = L5_8.loadResource
  L5_8(L6_9, L7_10)
  L5_8 = _start_game_obj
  L5_8()
  L5_8 = false
  if L5_8 then
    L5_8 = Fn_gestureEventStart
    L9_12 = 0
    L10_13 = -35
    L5_8(L6_9, L7_10, L8_11)
  end
  L5_8 = {
    L6_9,
    L7_10,
    [6] = L8_11(L9_12, L10_13, "barrel_0")
  }
  L9_12 = 0
  L10_13 = -20
  L9_12 = "vendors"
  L9_12 = -17
  L10_13 = 0
  L9_12 = "bench_kw_01"
  L10_13 = "bench_0"
  L9_12 = Vector
  L10_13 = -17
  L9_12 = L9_12(L10_13, 0, -24)
  L10_13 = "barrel_kk_01"
  L10_13 = L8_11(L9_12, L10_13, "barrel_0")
  ;({
    L6_9,
    L7_10,
    [6] = L8_11(L9_12, L10_13, "barrel_0")
  })[3] = L8_11
  ;({
    L6_9,
    L7_10,
    [6] = L8_11(L9_12, L10_13, "barrel_0")
  })[4] = L9_12
  ;({
    L6_9,
    L7_10,
    [6] = L8_11(L9_12, L10_13, "barrel_0")
  })[5] = L10_13
  for L9_12, L10_13 in L6_9(L7_10) do
    main_area:appendChild(L10_13)
  end
  L6_9()
end
function test_del_area(A0_14)
  wait(120)
end
function spawn_npc(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L1_16 = dbg_print
  L1_16(L2_17)
  L1_16 = {
    L2_17,
    L3_18,
    L4_19,
    L5_20
  }
  L2_17.name = "posA"
  L6_21 = -25.3
  L2_17.pos = L3_18
  L3_18.name = "posB"
  L6_21 = 0
  L7_22 = -25.3
  L3_18.pos = L4_19
  L4_19.name = "posC"
  L6_21 = -12.7
  L7_22 = 0
  L8_23 = -35.3
  L4_19.pos = L5_20
  L5_20.name = "posD"
  L6_21 = Vector
  L7_22 = 2.7
  L8_23 = 0
  L6_21 = L6_21(L7_22, L8_23, -35.3)
  L5_20.pos = L6_21
  for L5_20, L6_21 in L2_17(L3_18) do
    L7_22 = createGameObject2
    L8_23 = "Node"
    L7_22 = L7_22(L8_23)
    L8_23 = L7_22.setName
    L8_23(L7_22, L6_21.name)
    L8_23 = L7_22.setPos
    L8_23(L7_22, L6_21.pos)
    L8_23 = A0_15.appendChild
    L8_23(A0_15, L7_22)
  end
  L3_18.label = "man01"
  L3_18.npcName = "NPC_man01"
  L6_21 = 0
  L7_22 = 45
  L3_18.pos = L4_19
  L6_21 = 0
  L7_22 = 0
  L8_23 = 1
  L3_18.rot = L4_19
  for L6_21, L7_22 in L3_18(L4_19) do
    L8_23 = {}
    L8_23.use_gravity = true
    Npc.Load(L7_22.npcName, A0_15, L7_22.pos, L7_22.rot, L7_22.label, L8_23)
  end
  L3_18()
  L3_18()
  L3_18()
  L5_20.arrivedLength = 3
  L5_20.runLength = -1
  L5_20.navimesh = true
  L5_20.noTurn = false
  L5_20.loop = true
  L5_20.recast = false
  L7_22 = L4_19
  L6_21 = L4_19.setMoveOption
  L8_23 = L5_20
  L6_21(L7_22, L8_23)
  L6_21 = {
    L7_22,
    L8_23,
    {
      pos = "posC",
      opt = {}
    },
    {
      pos = "posD",
      opt = {}
    }
  }
  L7_22 = {}
  L7_22.pos = "posA"
  L8_23 = {}
  L7_22.opt = L8_23
  L8_23 = {}
  L8_23.pos = "posB"
  L8_23.opt = {}
  L8_23 = L4_19
  L7_22 = L4_19.move
  L7_22(L8_23, L6_21)
end
