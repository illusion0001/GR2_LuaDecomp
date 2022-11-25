import("math")
import("Debug")
import("Area")
import("EventData")
import("Mob")
import("Player")
import("Pad")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Misc/gesture.lua")
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
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30
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
  L2_15 = L1_14.setSceneParameters
  L4_17 = "cubemap_03"
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
  L17_30 = L7_20(L8_21)
  L17_30 = L6_19(L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L7_20(L8_21))
  L3_16 = L3_16(L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L6_19(L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L7_20(L8_21)))
  playerPuppet = L3_16
  L3_16 = _start_game_obj
  L3_16()
  L3_16, L4_17 = nil, nil
  L5_18 = loadFileAsset
  L6_19 = "evb"
  L7_20 = "evx/test_mob_to_npc"
  L5_18 = L5_18(L6_19, L7_20)
  L3_16 = L5_18
  if L3_16 then
    L6_19 = L3_16
    L5_18 = L3_16.wait
    L5_18(L6_19)
    L6_19 = L3_16
    L5_18 = L3_16.getRoot
    L5_18 = L5_18(L6_19)
    L6_19 = EventData
    L7_20 = L6_19
    L6_19 = L6_19.create
    L8_21 = "test_mob_to_npc"
    L9_22 = "motion_test_stage1_01"
    L10_23 = L5_18
    L6_19 = L6_19(L7_20, L8_21, L9_22, L10_23)
    L4_17 = L6_19
  end
  L5_18 = createGameObject2
  L6_19 = "ChangeMobToNpc"
  L5_18 = L5_18(L6_19)
  L7_20 = L5_18
  L6_19 = L5_18.setName
  L8_21 = "toNpcObj"
  L6_19(L7_20, L8_21)
  L7_20 = L5_18
  L6_19 = L5_18.try_init
  L6_19(L7_20)
  L7_20 = L5_18
  L6_19 = L5_18.waitForReady
  L6_19(L7_20)
  L7_20 = L5_18
  L6_19 = L5_18.try_start
  L6_19(L7_20)
  L6_19 = nil
  L7_20 = {}
  L7_20.mob = true
  L9_22 = L5_18
  L8_21 = L5_18.setEventListener
  L10_23 = "mobToNpc"
  function L11_24(A0_31)
    L6_19 = Npc.Create(A0_31.name, nil, A0_31.pos, A0_31.rot, A0_31.label, L7_20)
    A0_31.npcgen = L6_19.generator
    return A0_31
  end
  L8_21(L9_22, L10_23, L11_24)
  L8_21 = _start_game_obj
  L8_21()
  L8_21 = findGameObject2
  L9_22 = "EnemyGenerator"
  L10_23 = "enmgen2_01"
  L8_21 = L8_21(L9_22, L10_23)
  L9_22 = {}
  L10_23 = Mob
  L10_23 = L10_23.Division
  L10_23 = L10_23.kHuman
  L9_22.division = L10_23
  L10_23 = Mob
  L10_23 = L10_23.SwitchSelection
  L10_23 = L10_23.kNpc
  L9_22.selection = L10_23
  L10_23 = Mob
  L10_23 = L10_23.SwitchMethod
  L10_23 = L10_23.kPlayerRange
  L9_22.method = L10_23
  L9_22.playerRangeDistance = 2
  L9_22.playerRangeDegree = 90
  L9_22.keepInCameraSec = 1
  L10_23 = Mob
  L11_24 = L10_23
  L10_23 = L10_23.setSwitchOutEnv
  L12_25 = {L13_26, L14_27}
  L10_23(L11_24, L12_25, L13_26)
  L10_23 = Mob
  L11_24 = L10_23
  L10_23 = L10_23.letStateMode
  L12_25 = Mob
  L12_25 = L12_25.StateMode
  L12_25 = L12_25.kSwitchOut
  L10_23(L11_24, L12_25, L13_26)
  L10_23 = Mob
  L11_24 = L10_23
  L10_23 = L10_23.letStateMode
  L12_25 = Mob
  L12_25 = L12_25.StateMode
  L12_25 = L12_25.kGrabbed
  L10_23(L11_24, L12_25, L13_26)
  L10_23 = Area
  L11_24 = L10_23
  L10_23 = L10_23.setAnimMoveDriftEnable
  L12_25 = true
  L10_23(L11_24, L12_25)
  L11_24 = L1_14
  L10_23 = L1_14.getDescendant
  L10_23 = L10_23(L11_24)
  L11_24 = L10_23[1]
  function L12_25(A0_32, A1_33, A2_34)
    local L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46
    L3_35 = 5
    L4_36 = 2.5
    L5_37 = Vector
    L6_38 = -16
    L7_39 = 0.66
    L8_40 = -22
    L5_37 = L5_37(L6_38, L7_39, L8_40)
    L6_38 = Mob
    L7_39 = L6_38
    L6_38 = L6_38.getClassInGroup
    L8_40 = "yy_jilga_roamer"
    L6_38 = L6_38(L7_39, L8_40)
    L7_39 = #L6_38
    L8_40 = {}
    for L12_44 = 1, L3_35 do
      L13_45 = Vector
      L14_46 = RandF
      L14_46 = L14_46(-L4_36, L4_36)
      L13_45 = L13_45(L14_46, 0, RandF(-L4_36, L4_36))
      L14_46 = {}
      L14_46.pos = L5_37 + L13_45
      L14_46.class = L6_38[RandI(L7_39)]
      table.insert(L8_40, L14_46)
    end
    for L12_44, L13_45 in L9_41(L10_42) do
      L14_46 = Mob
      L14_46 = L14_46.hatch
      L14_46(L14_46, A1_33, {
        geom = L13_45.pos,
        class = L13_45.class,
        role = Mob.kRoleRoam
      })
    end
    L3_35 = Vector
    L4_36 = -13
    L5_37 = 0.67
    L6_38 = -22
    L3_35 = L3_35(L4_36, L5_37, L6_38)
    L4_36 = Mob
    L5_37 = L4_36
    L4_36 = L4_36.hatch
    L6_38 = A1_33
    L7_39 = {}
    L7_39.geom = L3_35
    L8_40 = Mob
    L8_40 = L8_40.getClassIdx
    L8_40 = L8_40(L9_41, L10_42)
    L7_39.class = L8_40
    L4_36(L5_37, L6_38, L7_39)
    L3_35 = AabbByOriginAndHalfExtents
    L4_36 = Vector
    L5_37 = -13.76
    L6_38 = 0.58
    L7_39 = -16.76
    L4_36 = L4_36(L5_37, L6_38, L7_39)
    L5_37 = Vector
    L6_38 = 13.97
    L7_39 = 1
    L8_40 = 9.68
    L14_46 = L5_37(L6_38, L7_39, L8_40)
    L3_35 = L3_35(L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L5_37(L6_38, L7_39, L8_40))
    L4_36 = Mob
    L5_37 = L4_36
    L4_36 = L4_36.setDebugAabb
    L6_38 = L3_35
    L4_36(L5_37, L6_38)
  end
  on_start = L12_25
  L12_25 = _start_game_obj
  L12_25()
  L12_25 = {}
  L15_28.text = "ep05_00135"
  L15_28.time = 2
  L14_27.listen = L15_28
  L15_28.text = "ep05_00138"
  L15_28.time = 2
  L14_27.reply_yes = L15_28
  L15_28.text = "ep05_00139"
  L15_28.time = 2
  L14_27.reply_no = L15_28
  L12_25.other = L13_26
  L16_29, L17_30 = nil, nil
  L16_29 = L12_25
  L14_27(L15_28, L16_29)
  L16_29, L17_30 = nil, nil
  L14_27(L15_28, L16_29, L17_30, {})
  L14_27(L15_28)
  L12_25 = {
    L13_26,
    L14_27,
    [6] = L15_28(L16_29, L17_30, "barrel_0")
  }
  L16_29 = 0
  L17_30 = -20
  L16_29 = "vendors"
  L16_29 = -17
  L17_30 = 0
  L16_29 = "bench_kw_01"
  L17_30 = "bench_0"
  L16_29 = Vector
  L17_30 = -17
  L16_29 = L16_29(L17_30, 0, -24)
  L17_30 = "barrel_kk_01"
  L17_30 = L15_28(L16_29, L17_30, "barrel_0")
  ;({
    L13_26,
    L14_27,
    [6] = L15_28(L16_29, L17_30, "barrel_0")
  })[3] = L15_28
  ;({
    L13_26,
    L14_27,
    [6] = L15_28(L16_29, L17_30, "barrel_0")
  })[4] = L16_29
  ;({
    L13_26,
    L14_27,
    [6] = L15_28(L16_29, L17_30, "barrel_0")
  })[5] = L17_30
  L13_26()
  for L16_29, L17_30 in L13_26(L14_27) do
    L11_24:appendChild(L17_30)
  end
end
function test_bird(A0_47)
  Mob:hatch(A0_47, {
    geom = AabbByOriginAndHalfExtents(Vector(-10, 0, -30), Vector(1, 1, 1)),
    class = Mob:getClassIdx("pigeon"),
    num = 3
  })
end
