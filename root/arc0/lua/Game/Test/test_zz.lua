import("math")
import("Debug")
import("Area")
import("EventData")
import("Mob")
import("Player")
import("Pad")
import("Sound")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
dofile("/Game/Misc/gesture.lua")
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
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15
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
    L4_7,
    L5_8
  }
  L1_4 = {L2_5, L3_6}
  L2_5 = "motion_test_stage1_01"
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
  L6_9 = {}
  L6_9.fieldNamePrefix = ""
  L6_9.hasField = false
  L5_8 = {L6_9, L7_10}
  L6_9 = "motion_test_stage1_05"
  L7_10 = {}
  L7_10.fieldNamePrefix = ""
  L7_10.hasField = true
  L1_4 = Mob
  L2_5 = L1_4
  L1_4 = L1_4.registerBinders
  L3_6 = L0_3
  L1_4(L2_5, L3_6)
  main_pat = "motion_test_stage1_01"
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
  L3_6 = L1_4
  L2_5 = L1_4.setName
  L4_7 = "test_z_root2"
  L2_5(L3_6, L4_7)
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
  L6_9 = YRotQuaternion
  L7_10 = Deg2Rad
  L12_15 = L7_10(L8_11)
  L12_15 = L6_9(L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L7_10(L8_11))
  L5_8 = L3_6(L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L6_9(L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L7_10(L8_11)))
  L6_9 = _start_game_obj
  L6_9()
  L6_9 = Area
  L7_10 = L6_9
  L6_9 = L6_9.setAnimMoveDriftEnable
  L6_9(L7_10, L8_11)
  L7_10 = L1_4
  L6_9 = L1_4.getDescendant
  L6_9 = L6_9(L7_10)
  L7_10 = L6_9[1]
  main_area = L7_10
  L7_10 = false
  if L7_10 then
    L7_10 = Mob
    L7_10 = L7_10.letStateMode
    L7_10(L8_11, L9_12, L10_13)
    L7_10 = Mob
    L7_10 = L7_10.getLeafletCount
    L7_10(L8_11, L9_12)
    L7_10 = Mob
    L7_10 = L7_10.getLeafletCount
    L7_10 = L7_10(L8_11)
    L8_11(L9_12, L10_13)
  end
  L7_10 = false
  if L7_10 then
    L7_10 = Sound
    L7_10 = L7_10.loadResource
    L7_10(L8_11, L9_12)
    L7_10 = Sound
    L7_10 = L7_10.loadResource
    L7_10(L8_11, L9_12)
    L7_10 = Sound
    L7_10 = L7_10.loadResource
    L7_10(L8_11, L9_12)
    L7_10 = Sound
    L7_10 = L7_10.loadResource
    L7_10(L8_11, L9_12)
  end
  function L7_10(A0_16, A1_17, A2_18)
    local L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30
    L3_19 = false
    if L3_19 then
      L3_19 = Vector
      L4_20 = 7
      L5_21 = 0
      L6_22 = -31
      L3_19 = L3_19(L4_20, L5_21, L6_22)
      L4_20 = Mob
      L5_21 = L4_20
      L4_20 = L4_20.hatch
      L6_22 = A1_17
      L7_23 = {}
      L8_24 = PointYaw
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.geom = L8_24
      L8_24 = Mob
      L8_24 = L8_24.getClassIdx
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.class = L8_24
      L8_24 = Mob
      L8_24 = L8_24.kRoleSitAtTable
      L7_23.role = L8_24
      L4_20(L5_21, L6_22, L7_23)
    end
    L3_19 = false
    if L3_19 then
      L3_19 = Vector
      L4_20 = -13
      L5_21 = 0.67
      L6_22 = -22
      L3_19 = L3_19(L4_20, L5_21, L6_22)
      L4_20 = Mob
      L5_21 = L4_20
      L4_20 = L4_20.hatch
      L6_22 = A1_17
      L7_23 = {}
      L7_23.geom = L3_19
      L8_24 = Mob
      L8_24 = L8_24.getClassIdx
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.class = L8_24
      L8_24 = Mob
      L8_24 = L8_24.kRoleBalloonMan
      L7_23.role = L8_24
      L4_20(L5_21, L6_22, L7_23)
    end
    L3_19 = false
    if L3_19 then
      L3_19 = 10
      L4_20 = 2.5
      L5_21 = Vector
      L6_22 = -16
      L7_23 = 0.66
      L8_24 = -22
      L5_21 = L5_21(L6_22, L7_23, L8_24)
      L6_22 = Mob
      L7_23 = L6_22
      L6_22 = L6_22.getClassInGroup
      L8_24 = "yy_jilga_roamer"
      L6_22 = L6_22(L7_23, L8_24)
      L7_23 = #L6_22
      L8_24 = {}
      for L12_28 = 1, L3_19 do
        L13_29 = Vector
        L14_30 = RandF
        L14_30 = L14_30(-L4_20, L4_20)
        L13_29 = L13_29(L14_30, 0, RandF(-L4_20, L4_20))
        L14_30 = {}
        L14_30.pos = L5_21 + L13_29
        L14_30.class = L6_22[RandI(L7_23)]
        table.insert(L8_24, L14_30)
      end
      for L12_28, L13_29 in L9_25(L10_26) do
        L14_30 = Mob
        L14_30 = L14_30.hatch
        L14_30(L14_30, A1_17, {
          geom = L13_29.pos,
          class = L13_29.class,
          role = Mob.kRoleRoam
        })
      end
    end
    L3_19 = false
    if L3_19 then
      L3_19 = Vector
      L4_20 = -13
      L5_21 = 0.06
      L6_22 = -22
      L3_19 = L3_19(L4_20, L5_21, L6_22)
      L4_20 = Mob
      L5_21 = L4_20
      L4_20 = L4_20.hatch
      L6_22 = A1_17
      L7_23 = {}
      L7_23.geom = L3_19
      L8_24 = Mob
      L8_24 = L8_24.getClassIdx
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.class = L8_24
      L4_20(L5_21, L6_22, L7_23)
    end
    L3_19 = AabbByOriginAndHalfExtents
    L4_20 = Vector
    L5_21 = -13.76
    L6_22 = 0.58
    L7_23 = -16.76
    L4_20 = L4_20(L5_21, L6_22, L7_23)
    L5_21 = Vector
    L6_22 = 13.97
    L7_23 = 1
    L8_24 = 9.68
    L14_30 = L5_21(L6_22, L7_23, L8_24)
    L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L5_21(L6_22, L7_23, L8_24))
    L4_20 = Mob
    L5_21 = L4_20
    L4_20 = L4_20.setDebugAabb
    L6_22 = L3_19
    L4_20(L5_21, L6_22)
  end
  on_start = L7_10
  L7_10 = _start_game_obj
  L7_10()
  L7_10 = false
  if L7_10 then
    L7_10 = {}
    L10_13.text = "ep05_00135"
    L10_13.time = 2
    L9_12.listen = L10_13
    L10_13.text = "ep05_00138"
    L10_13.time = 2
    L9_12.reply_yes = L10_13
    L10_13.text = "ep05_00139"
    L10_13.time = 2
    L9_12.reply_no = L10_13
    L7_10.other = L8_11
    L11_14, L12_15 = nil, nil
    L11_14 = L7_10
    L9_12(L10_13, L11_14)
    L11_14, L12_15 = nil, nil
    L9_12(L10_13, L11_14, L12_15, {})
    L9_12(L10_13)
  end
  L7_10 = {
    L8_11,
    L9_12,
    [6] = L10_13(L11_14, L12_15, "barrel_0")
  }
  L11_14 = 0
  L12_15 = -20
  L11_14 = "vendors"
  L11_14 = -17
  L12_15 = 0
  L11_14 = "bench_kw_01"
  L12_15 = "bench_0"
  L11_14 = Vector
  L12_15 = -17
  L11_14 = L11_14(L12_15, 0, -24)
  L12_15 = "barrel_kk_01"
  L12_15 = L10_13(L11_14, L12_15, "barrel_0")
  ;({
    L8_11,
    L9_12,
    [6] = L10_13(L11_14, L12_15, "barrel_0")
  })[3] = L10_13
  ;({
    L8_11,
    L9_12,
    [6] = L10_13(L11_14, L12_15, "barrel_0")
  })[4] = L11_14
  ;({
    L8_11,
    L9_12,
    [6] = L10_13(L11_14, L12_15, "barrel_0")
  })[5] = L12_15
  for L11_14, L12_15 in L8_11(L9_12) do
    main_area:appendChild(L12_15)
  end
  L8_11()
  if L8_11 then
    L8_11(L9_12)
  end
  if L8_11 then
    L8_11(L9_12)
  end
end
function test_del_area(A0_31)
  wait(120)
end
function test_bird(A0_32)
  Mob:hatch(A0_32, {
    geom = AabbByOriginAndHalfExtents(Vector(-10, 0, -30), Vector(1, 1, 1)),
    class = Mob:getClassIdx("pigeon"),
    num = 3
  })
end
function spawn_npc(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41
  L1_34 = dbg_print
  L1_34(L2_35)
  L1_34 = {
    L2_35,
    L3_36,
    L4_37,
    L5_38
  }
  L2_35.name = "posA"
  L6_39 = -25.3
  L2_35.pos = L3_36
  L3_36.name = "posB"
  L6_39 = 0
  L7_40 = -25.3
  L3_36.pos = L4_37
  L4_37.name = "posC"
  L6_39 = -12.7
  L7_40 = 0
  L8_41 = -35.3
  L4_37.pos = L5_38
  L5_38.name = "posD"
  L6_39 = Vector
  L7_40 = 2.7
  L8_41 = 0
  L6_39 = L6_39(L7_40, L8_41, -35.3)
  L5_38.pos = L6_39
  for L5_38, L6_39 in L2_35(L3_36) do
    L7_40 = createGameObject2
    L8_41 = "Node"
    L7_40 = L7_40(L8_41)
    L8_41 = L7_40.setName
    L8_41(L7_40, L6_39.name)
    L8_41 = L7_40.setPos
    L8_41(L7_40, L6_39.pos)
    L8_41 = A0_33.appendChild
    L8_41(A0_33, L7_40)
  end
  L3_36.label = "man01"
  L3_36.npcName = "NPC_man01"
  L6_39 = 0
  L7_40 = 45
  L3_36.pos = L4_37
  L6_39 = 0
  L7_40 = 0
  L8_41 = 1
  L3_36.rot = L4_37
  for L6_39, L7_40 in L3_36(L4_37) do
    L8_41 = {}
    L8_41.use_gravity = true
    Npc.Load(L7_40.npcName, A0_33, L7_40.pos, L7_40.rot, L7_40.label, L8_41)
  end
  L3_36()
  L3_36()
  L3_36()
  L5_38.arrivedLength = 3
  L5_38.runLength = -1
  L5_38.navimesh = true
  L5_38.noTurn = false
  L5_38.loop = true
  L5_38.recast = false
  L7_40 = L4_37
  L6_39 = L4_37.setMoveOption
  L8_41 = L5_38
  L6_39(L7_40, L8_41)
  L6_39 = {
    L7_40,
    L8_41,
    {
      pos = "posC",
      opt = {}
    },
    {
      pos = "posD",
      opt = {}
    }
  }
  L7_40 = {}
  L7_40.pos = "posA"
  L8_41 = {}
  L7_40.opt = L8_41
  L8_41 = {}
  L8_41.pos = "posB"
  L8_41.opt = {}
  L8_41 = L4_37
  L7_40 = L4_37.move
  L7_40(L8_41, L6_39)
end
function disablePlacementAndKillPawnsFromPlacement(A0_42, A1_43)
  local L2_44, L3_45
  L2_44 = Mob
  L3_45 = L2_44
  L2_44 = L2_44.getHatReqIdxOfPawnId
  L2_44 = L2_44(L3_45, A0_42, A1_43)
  if L2_44 then
    L3_45 = Mob
    L3_45 = L3_45.setHatReqIdxEnabled
    L3_45 = L3_45(L3_45, A0_42, L2_44, false)
  end
  if L2_44 then
    L3_45 = Mob
    L3_45 = L3_45.collectPawnIdsWithHatReqIdx
    L3_45 = L3_45(L3_45, A0_42, L2_44)
    if L3_45 then
      Mob:killPawns(A0_42, L3_45)
    end
  end
end
function Mob.debug_func()
  local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
  L0_46 = dbg_print
  L0_46(L1_47)
  L0_46 = Mob
  L0_46 = L0_46.getMainPartition
  L0_46 = L0_46(L1_47)
  L2_48(L3_49, L4_50)
  for L5_51, L6_52 in L2_48(L3_49) do
    L8_54 = "kv: "
    L9_55 = L5_51
    L7_53(L8_54, L9_55, L6_52)
  end
  if L1_47 then
    L1_47(L2_48, L3_49)
    for L4_50, L5_51 in L1_47(L2_48) do
      L8_54 = L4_50
      L9_55 = ", "
      L6_52(L7_53, L8_54, L9_55, L5_51)
    end
  end
  if L1_47 then
    L9_55 = L3_49(L4_50, L5_51, L6_52)
    L3_49(L4_50, L5_51)
    for L6_52, L7_53 in L3_49(L4_50) do
      L8_54 = dbg_print
      L9_55 = "pid: "
      L8_54(L9_55, L6_52, L7_53)
    end
  end
  if L1_47 then
    L1_47(L2_48)
    main_area = nil
  end
  if L1_47 then
    if L1_47 == 0 then
      L4_50.class = "man01"
      L2_48(L3_49, L4_50)
    else
      L2_48(L3_49)
    end
  end
  if L1_47 then
    L1_47(L2_48, L3_49)
  end
  if L1_47 then
    L2_48(L3_49, L4_50)
    L2_48(L3_49, L4_50, L5_51, L6_52, L7_53)
  end
  if L1_47 then
    L1_47(L2_48)
  end
  if L1_47 then
    L3_49(L4_50, L5_51)
    for L8_54, L9_55 in L5_51(L6_52) do
      dbg_print("collectPawnIdsWithHatReqIdx: ", L8_54, L9_55)
    end
    L8_54 = L3_49
    L5_51(L6_52, L7_53, L8_54)
  end
  if L1_47 then
    L3_49(L4_50, L5_51, L6_52)
  end
end
