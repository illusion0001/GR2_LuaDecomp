import("math")
import("Debug")
import("Area")
import("EventData")
import("Mob")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
U = dofile("/Game/Misc/underscore.lua")
enmgen2_01 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_01"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_02"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_03"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_04"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_05"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_06"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_01"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_02"
    },
    {
      type = "people",
      locator = "locator_01",
      name = "peple_01"
    },
    {
      type = "people",
      locator = "locator_01",
      name = "peple_12"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end
}
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
function put_gimmick(A0_10, A1_11, A2_12)
  createGameObject2("GimmickBg"):setName(A2_12)
  createGameObject2("GimmickBg"):setDrawModelName(A1_11)
  createGameObject2("GimmickBg"):setCollisionName(A1_11)
  createGameObject2("GimmickBg"):setAttributeName(A1_11)
  createGameObject2("GimmickBg"):setPos(A0_10)
  createGameObject2("GimmickBg"):setAutoRestore(5)
  return (createGameObject2("GimmickBg"))
end
function main()
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L18_31
  L0_13 = Mob
  L0_13 = L0_13._mob_set_debug_settings
  L0_13()
  L0_13 = createGameObject2
  L1_14 = "MobGlobal"
  L0_13 = L0_13(L1_14)
  g_mob_global = L0_13
  L0_13 = g_mob_global
  L1_14 = L0_13
  L0_13 = L0_13.setName
  L2_15 = "MobGlobal"
  L0_13(L1_14, L2_15)
  L0_13 = g_mob_global
  L1_14 = L0_13
  L0_13 = L0_13.try_init
  L0_13(L1_14)
  L0_13 = g_mob_global
  L1_14 = L0_13
  L0_13 = L0_13.waitForReady
  L0_13(L1_14)
  L0_13 = g_mob_global
  L1_14 = L0_13
  L0_13 = L0_13.try_start
  L0_13(L1_14)
  L0_13 = {
    L1_14,
    L2_15,
    L3_16,
    L4_17,
    L5_18
  }
  L1_14 = {L2_15, L3_16}
  L2_15 = "motion_test_stage1_01"
  L3_16 = {}
  L3_16.fieldNamePrefix = ""
  L3_16.hasField = true
  L2_15 = {L3_16, L4_17}
  L3_16 = "motion_test_stage1_02"
  L4_17 = {}
  L4_17.fieldNamePrefix = ""
  L4_17.hasField = false
  L3_16 = {L4_17, L5_18}
  L4_17 = "motion_test_stage1_03"
  L5_18 = {}
  L5_18.fieldNamePrefix = ""
  L5_18.hasField = false
  L4_17 = {L5_18, L6_19}
  L5_18 = "motion_test_stage1_04"
  L6_19 = {}
  L6_19.fieldNamePrefix = ""
  L6_19.hasField = false
  L5_18 = {L6_19, L7_20}
  L6_19 = "motion_test_stage1_05"
  L7_20 = {}
  L7_20.fieldNamePrefix = ""
  L7_20.hasField = true
  L1_14 = Mob
  L2_15 = L1_14
  L1_14 = L1_14.registerBinders
  L3_16 = L0_13
  L1_14(L2_15, L3_16)
  main_pat = "motion_test_stage1_01"
  L1_14 = Area
  L2_15 = L1_14
  L1_14 = L1_14.setDriftRatioTrans
  L3_16 = 1
  L1_14(L2_15, L3_16)
  L1_14 = Area
  L2_15 = L1_14
  L1_14 = L1_14.setDriftRatioRot
  L3_16 = 1
  L1_14(L2_15, L3_16)
  L1_14 = createGameObject2
  L2_15 = "Area"
  L1_14 = L1_14(L2_15)
  L3_16 = L1_14
  L2_15 = L1_14.setName
  L4_17 = "test_z_root2"
  L2_15(L3_16, L4_17)
  L3_16 = L1_14
  L2_15 = L1_14.setEnableDebugDraw
  L4_17 = false
  L2_15(L3_16, L4_17)
  L3_16 = L1_14
  L2_15 = L1_14.setDriftParams
  L4_17 = drift_params
  L2_15(L3_16, L4_17)
  L3_16 = L1_14
  L2_15 = L1_14.setDriftInherit
  L4_17 = true
  L2_15(L3_16, L4_17)
  L3_16 = L1_14
  L2_15 = L1_14.setDriftEnable
  L4_17 = false
  L2_15(L3_16, L4_17)
  L2_15 = Vector
  L3_16 = -20
  L4_17 = 0
  L5_18 = 55
  L2_15 = L2_15(L3_16, L4_17, L5_18)
  L3_16 = DebugStage
  L4_17 = L3_16
  L3_16 = L3_16.createTestPlayer
  L5_18 = L2_15
  L6_19 = YRotQuaternion
  L7_20 = Deg2Rad
  L8_21 = 90
  L18_31 = L7_20(L8_21)
  L18_31 = L6_19(L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L18_31, L7_20(L8_21))
  L3_16 = L3_16(L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L18_31, L6_19(L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L18_31, L7_20(L8_21)))
  L4_17 = _start_game_obj
  L4_17()
  L4_17, L5_18 = nil, nil
  L6_19 = loadFileAsset
  L7_20 = "evb"
  L8_21 = "evx/test_mob_to_npc"
  L6_19 = L6_19(L7_20, L8_21)
  L4_17 = L6_19
  if L4_17 then
    L7_20 = L4_17
    L6_19 = L4_17.wait
    L6_19(L7_20)
    L7_20 = L4_17
    L6_19 = L4_17.getRoot
    L6_19 = L6_19(L7_20)
    L7_20 = EventData
    L8_21 = L7_20
    L7_20 = L7_20.create
    L9_22 = "test_mob_to_npc"
    L10_23 = "motion_test_stage1_01"
    L11_24 = L6_19
    L7_20 = L7_20(L8_21, L9_22, L10_23, L11_24)
    L5_18 = L7_20
  end
  L6_19 = createGameObject2
  L7_20 = "ChangeMobToNpc"
  L6_19 = L6_19(L7_20)
  L8_21 = L6_19
  L7_20 = L6_19.setName
  L9_22 = "toNpcObj"
  L7_20(L8_21, L9_22)
  L8_21 = L6_19
  L7_20 = L6_19.try_init
  L7_20(L8_21)
  L8_21 = L6_19
  L7_20 = L6_19.waitForReady
  L7_20(L8_21)
  L8_21 = L6_19
  L7_20 = L6_19.try_start
  L7_20(L8_21)
  L7_20 = nil
  L8_21 = {}
  L8_21.mob = true
  L10_23 = L6_19
  L9_22 = L6_19.setEventListener
  L11_24 = "mobToNpc"
  function L12_25(A0_32)
    L7_20 = Npc.Create(A0_32.name, nil, A0_32.pos, A0_32.rot, A0_32.label, L8_21)
    A0_32.npcgen = L7_20.generator
    return A0_32
  end
  L9_22(L10_23, L11_24, L12_25)
  L9_22 = _start_game_obj
  L9_22()
  L9_22 = findGameObject2
  L10_23 = "EnemyGenerator"
  L11_24 = "enmgen2_01"
  L9_22 = L9_22(L10_23, L11_24)
  L10_23 = {}
  L11_24 = Mob
  L11_24 = L11_24.Division
  L11_24 = L11_24.kHuman
  L10_23.division = L11_24
  L11_24 = Mob
  L11_24 = L11_24.SwitchSelection
  L11_24 = L11_24.kNpc
  L10_23.selection = L11_24
  L11_24 = Mob
  L11_24 = L11_24.SwitchMethod
  L11_24 = L11_24.kPlayerRange
  L10_23.method = L11_24
  L10_23.playerRangeDistance = 2
  L10_23.playerRangeDegree = 90
  L10_23.keepInCameraSec = 1
  L11_24 = Mob
  L12_25 = L11_24
  L11_24 = L11_24.setSwitchOutEnv
  L13_26 = {L14_27, L15_28}
  L11_24(L12_25, L13_26, L14_27)
  L11_24 = Area
  L12_25 = L11_24
  L11_24 = L11_24.setAnimMoveDriftEnable
  L13_26 = true
  L11_24(L12_25, L13_26)
  L12_25 = L1_14
  L11_24 = L1_14.getDescendant
  L11_24 = L11_24(L12_25)
  L12_25 = L11_24[1]
  function L13_26(A0_33, A1_34, A2_35)
    local L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47
    L3_36 = false
    if L3_36 then
      L3_36 = 1
      L4_37 = 2.5
      L5_38 = Vector
      L6_39 = -16
      L7_40 = 0.66
      L8_41 = -22
      L5_38 = L5_38(L6_39, L7_40, L8_41)
      L6_39 = Mob
      L7_40 = L6_39
      L6_39 = L6_39.getClassInGroup
      L8_41 = "yy_jilga_roamer"
      L6_39 = L6_39(L7_40, L8_41)
      L7_40 = #L6_39
      L8_41 = {}
      for L12_45 = 1, L3_36 do
        L13_46 = Vector
        L14_47 = RandF
        L14_47 = L14_47(-L4_37, L4_37)
        L13_46 = L13_46(L14_47, 0, RandF(-L4_37, L4_37))
        L14_47 = {}
        L14_47.pos = L5_38 + L13_46
        L14_47.class = L6_39[RandI(L7_40)]
        table.insert(L8_41, L14_47)
      end
      for L12_45, L13_46 in L9_42(L10_43) do
        L14_47 = Mob
        L14_47 = L14_47.hatch
        L14_47(L14_47, A1_34, {
          geom = L13_46.pos,
          class = L13_46.class,
          role = Mob.kRoleRoam
        })
      end
    end
    L3_36 = false
    if L3_36 then
      L3_36 = Vector
      L4_37 = -13
      L5_38 = 0.67
      L6_39 = -22
      L3_36 = L3_36(L4_37, L5_38, L6_39)
      L4_37 = Mob
      L5_38 = L4_37
      L4_37 = L4_37.hatch
      L6_39 = A1_34
      L7_40 = {}
      L7_40.geom = L3_36
      L8_41 = Mob
      L8_41 = L8_41.getClassIdx
      L8_41 = L8_41(L9_42, L10_43)
      L7_40.class = L8_41
      L4_37(L5_38, L6_39, L7_40)
    end
    L3_36 = AabbByOriginAndHalfExtents
    L4_37 = Vector
    L5_38 = -13.76
    L6_39 = 0.58
    L7_40 = -16.76
    L4_37 = L4_37(L5_38, L6_39, L7_40)
    L5_38 = Vector
    L6_39 = 13.97
    L7_40 = 1
    L8_41 = 9.68
    L14_47 = L5_38(L6_39, L7_40, L8_41)
    L3_36 = L3_36(L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47, L5_38(L6_39, L7_40, L8_41))
    L4_37 = Mob
    L5_38 = L4_37
    L4_37 = L4_37.setDebugAabb
    L6_39 = L3_36
    L4_37(L5_38, L6_39)
  end
  on_start = L13_26
  L13_26 = _start_game_obj
  L13_26()
  L13_26 = false
  if L13_26 then
    L13_26 = Fn_gestureEventStart
    L17_30 = 0
    L18_31 = -35
    L13_26(L14_27, L15_28, L16_29)
  end
  L13_26 = {
    L14_27,
    L15_28,
    [6] = L16_29(L17_30, L18_31, "barrel_0")
  }
  L17_30 = 0
  L18_31 = -20
  L17_30 = "vendors"
  L17_30 = -17
  L18_31 = 0
  L17_30 = "bench_kw_01"
  L18_31 = "bench_0"
  L17_30 = Vector
  L18_31 = -17
  L17_30 = L17_30(L18_31, 0, -24)
  L18_31 = "barrel_kk_01"
  L18_31 = L16_29(L17_30, L18_31, "barrel_0")
  ;({
    L14_27,
    L15_28,
    [6] = L16_29(L17_30, L18_31, "barrel_0")
  })[3] = L16_29
  ;({
    L14_27,
    L15_28,
    [6] = L16_29(L17_30, L18_31, "barrel_0")
  })[4] = L17_30
  ;({
    L14_27,
    L15_28,
    [6] = L16_29(L17_30, L18_31, "barrel_0")
  })[5] = L18_31
  L14_27()
  for L17_30, L18_31 in L14_27(L15_28) do
    L12_25:appendChild(L18_31)
  end
  L14_27.label = "man01"
  L14_27.name = "testNpc01"
  L17_30 = 0
  L18_31 = 51
  L14_27.pos = L15_28
  L17_30 = -0.48
  L18_31 = 0
  L14_27.rot = L15_28
  L14_27.opt = L15_28
  L17_30 = nil
  L18_31 = L14_27.pos
  L16_29()
  L17_30 = 30
  L16_29(L17_30)
  L17_30 = L16_29
  L16_29(L17_30)
  L15_28.generator = nil
  g_spawn_npc = false
  repeat
    L16_29()
    if L16_29 then
      g_spawn_npc = false
      L16_29.label = "man01"
      L16_29.name = "testNpc01"
      L17_30 = Vector
      L18_31 = -12
      L17_30 = L17_30(L18_31, 0, 51)
      L16_29.pos = L17_30
      L17_30 = Quat
      L18_31 = 0
      L17_30 = L17_30(L18_31, -0.48, 0, 0.88)
      L16_29.rot = L17_30
      L17_30 = {}
      L16_29.opt = L17_30
      L17_30 = Npc
      L17_30 = L17_30.Create
      L18_31 = L16_29.name
      L17_30 = L17_30(L18_31, nil, L16_29.pos, L16_29.rot, L16_29.label, L16_29.opt)
      L18_31 = _start_game_obj
      L18_31()
      L18_31 = waitForReadyAllGameObjects
      L18_31()
      L18_31 = wait
      L18_31(30)
      L18_31 = L17_30.generator
      L18_31 = L18_31.changeMob
      L18_31(L18_31)
      L17_30.generator = nil
      L17_30 = nil
    end
  until L16_29
end
function test_bird(A0_48)
  Mob:hatch(A0_48, {
    geom = AabbByOriginAndHalfExtents(Vector(-10, 0, -30), Vector(1, 1, 1)),
    class = Mob:getClassIdx("pigeon"),
    num = 3
  })
end
function Mob.debug_func()
  dbg_print("overidden Mob.debug_func[@test_zz] was called")
  g_spawn_npc = true
end
