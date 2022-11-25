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
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18
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
  L0_3 = Area
  L1_4 = L0_3
  L0_3 = L0_3.setDriftRatioTrans
  L2_5 = 1
  L0_3(L1_4, L2_5)
  L0_3 = Area
  L1_4 = L0_3
  L0_3 = L0_3.setDriftRatioRot
  L2_5 = 1
  L0_3(L1_4, L2_5)
  L0_3 = createGameObject2
  L1_4 = "Area"
  L0_3 = L0_3(L1_4)
  L2_5 = L0_3
  L1_4 = L0_3.setName
  L3_6 = "test_z_root2"
  L1_4(L2_5, L3_6)
  L2_5 = L0_3
  L1_4 = L0_3.setEnableDebugDraw
  L3_6 = false
  L1_4(L2_5, L3_6)
  L2_5 = L0_3
  L1_4 = L0_3.setDriftParams
  L3_6 = drift_params
  L1_4(L2_5, L3_6)
  L2_5 = L0_3
  L1_4 = L0_3.setDriftInherit
  L3_6 = true
  L1_4(L2_5, L3_6)
  L2_5 = L0_3
  L1_4 = L0_3.setDriftEnable
  L3_6 = false
  L1_4(L2_5, L3_6)
  L1_4 = false
  if L1_4 then
    L1_4 = createGameObject2
    L2_5 = "TerrainBg"
    L1_4 = L1_4(L2_5)
    test_sky = L1_4
    L1_4 = test_sky
    L2_5 = L1_4
    L1_4 = L1_4.setName
    L3_6 = "sky_ux_01"
    L1_4(L2_5, L3_6)
    L1_4 = test_sky
    L2_5 = L1_4
    L1_4 = L1_4.setModelName
    L3_6 = "sky_ux_01"
    L1_4(L2_5, L3_6)
    L2_5 = L0_3
    L1_4 = L0_3.appendChild
    L3_6 = test_sky
    L1_4(L2_5, L3_6)
  end
  L1_4 = Vector
  L2_5 = -20
  L3_6 = 0
  L4_7 = 55
  L1_4 = L1_4(L2_5, L3_6, L4_7)
  L2_5 = DebugStage
  L3_6 = L2_5
  L2_5 = L2_5.createTestPlayer
  L4_7 = L1_4
  L5_8 = YRotQuaternion
  L6_9 = Deg2Rad
  L7_10 = 90
  L15_18 = L6_9(L7_10)
  L15_18 = L5_8(L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18, L6_9(L7_10))
  L4_7 = L2_5(L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18, L5_8(L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18, L6_9(L7_10)))
  L5_8 = _start_game_obj
  L5_8()
  L5_8 = Area
  L6_9 = L5_8
  L5_8 = L5_8.setAnimMoveDriftEnable
  L7_10 = true
  L5_8(L6_9, L7_10)
  L6_9 = L0_3
  L5_8 = L0_3.getDescendant
  L5_8 = L5_8(L6_9)
  L6_9 = L5_8[1]
  L7_10 = nil
  L8_11 = dbg_print
  L8_11(L9_12, L10_13)
  L8_11 = {}
  for L12_15, L13_16 in L9_12(L10_13) do
    while true do
      L15_18 = L13_16
      L14_17 = L13_16.isLoading
      L14_17 = L14_17(L15_18)
      if L14_17 then
        L14_17 = wait
        L14_17()
      end
    end
    L15_18 = L13_16
    L14_17 = L13_16.getName
    L14_17 = L14_17(L15_18)
    L15_18 = createGameObject2
    L15_18 = L15_18("MobPartition")
    L15_18:setName(L14_17)
    Mob:registerAreaAndPartition(L13_16, L15_18)
    Mob:setFieldSetting(L15_18, {hasField = false})
    table.insert(L8_11, L15_18)
    dbg_print("areaName, patIdx: ", L14_17, Mob:findPartitionIdByName(L14_17))
  end
  L7_10 = L8_11[1]
  L12_15 = "kLoadMobPlacementFile"
  L13_16 = false
  L9_12(L10_13, L11_14, L12_15, L13_16)
  L12_15 = "kDebugSpecialMark"
  L13_16 = true
  L9_12(L10_13, L11_14, L12_15, L13_16)
  L12_15 = {}
  L12_15.hasField = true
  L12_15.fieldNamePrefix = ""
  L9_12(L10_13, L11_14, L12_15)
  if L9_12 then
    L12_15 = true
    L9_12(L10_13, L11_14, L12_15)
    L9_12(L10_13, L11_14)
    L12_15 = L9_12
    L10_13(L11_14, L12_15)
  end
  if L9_12 then
    L9_12(L10_13, L11_14)
    L9_12(L10_13, L11_14)
    L9_12(L10_13, L11_14)
    L9_12(L10_13, L11_14)
  end
  function L8_11(A0_19, A1_20, A2_21)
    local L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33
    L3_22 = false
    if L3_22 then
      L3_22 = Vector
      L4_23 = 7
      L5_24 = 0
      L6_25 = -31
      L3_22 = L3_22(L4_23, L5_24, L6_25)
      L4_23 = Mob
      L5_24 = L4_23
      L4_23 = L4_23.hatch
      L6_25 = A1_20
      L7_26 = {}
      L8_27 = PointYaw
      L8_27 = L8_27(L9_28, L10_29)
      L7_26.geom = L8_27
      L8_27 = Mob
      L8_27 = L8_27.getClassIdx
      L8_27 = L8_27(L9_28, L10_29)
      L7_26.class = L8_27
      L8_27 = Mob
      L8_27 = L8_27.kRoleSitAtTable
      L7_26.role = L8_27
      L4_23(L5_24, L6_25, L7_26)
    end
    L3_22 = false
    if L3_22 then
      L3_22 = Vector
      L4_23 = -13
      L5_24 = 0.67
      L6_25 = -22
      L3_22 = L3_22(L4_23, L5_24, L6_25)
      L4_23 = Mob
      L5_24 = L4_23
      L4_23 = L4_23.hatch
      L6_25 = A1_20
      L7_26 = {}
      L7_26.geom = L3_22
      L8_27 = Mob
      L8_27 = L8_27.getClassIdx
      L8_27 = L8_27(L9_28, L10_29)
      L7_26.class = L8_27
      L8_27 = Mob
      L8_27 = L8_27.kRoleBalloonMan
      L7_26.role = L8_27
      L4_23(L5_24, L6_25, L7_26)
    end
    L3_22 = false
    if L3_22 then
      L3_22 = 10
      L4_23 = 2.5
      L5_24 = Vector
      L6_25 = -16
      L7_26 = 0.66
      L8_27 = -22
      L5_24 = L5_24(L6_25, L7_26, L8_27)
      L6_25 = Mob
      L7_26 = L6_25
      L6_25 = L6_25.getClassInGroup
      L8_27 = "yy_jilga_roamer"
      L6_25 = L6_25(L7_26, L8_27)
      L7_26 = #L6_25
      L8_27 = {}
      for L12_31 = 1, L3_22 do
        L13_32 = Vector
        L14_33 = RandF
        L14_33 = L14_33(-L4_23, L4_23)
        L13_32 = L13_32(L14_33, 0, RandF(-L4_23, L4_23))
        L14_33 = {}
        L14_33.pos = L5_24 + L13_32
        L14_33.class = L6_25[RandI(L7_26)]
        table.insert(L8_27, L14_33)
      end
      for L12_31, L13_32 in L9_28(L10_29) do
        L14_33 = Mob
        L14_33 = L14_33.hatch
        L14_33(L14_33, A1_20, {
          geom = L13_32.pos,
          class = L13_32.class,
          role = Mob.kRoleRoam
        })
      end
    end
    L3_22 = false
    if L3_22 then
      L3_22 = Vector
      L4_23 = -13
      L5_24 = 0.06
      L6_25 = -22
      L3_22 = L3_22(L4_23, L5_24, L6_25)
      L4_23 = Mob
      L5_24 = L4_23
      L4_23 = L4_23.hatch
      L6_25 = A1_20
      L7_26 = {}
      L7_26.geom = L3_22
      L8_27 = Mob
      L8_27 = L8_27.getClassIdx
      L8_27 = L8_27(L9_28, L10_29)
      L7_26.class = L8_27
      L4_23(L5_24, L6_25, L7_26)
    end
    L3_22 = AabbByOriginAndHalfExtents
    L4_23 = Vector
    L5_24 = -13.76
    L6_25 = 0.58
    L7_26 = -16.76
    L4_23 = L4_23(L5_24, L6_25, L7_26)
    L5_24 = Vector
    L6_25 = 13.97
    L7_26 = 1
    L8_27 = 9.68
    L14_33 = L5_24(L6_25, L7_26, L8_27)
    L3_22 = L3_22(L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L5_24(L6_25, L7_26, L8_27))
    L4_23 = Mob
    L5_24 = L4_23
    L4_23 = L4_23.setDebugAabb
    L6_25 = L3_22
    L4_23(L5_24, L6_25)
  end
  on_start = L8_11
  L8_11 = _start_game_obj
  L8_11()
  L8_11 = {}
  L11_14.text = "ep05_00135"
  L11_14.time = 2
  L10_13.listen = L11_14
  L11_14.text = "ep05_00138"
  L11_14.time = 2
  L10_13.reply_yes = L11_14
  L11_14.text = "ep05_00139"
  L11_14.time = 2
  L10_13.reply_no = L11_14
  L8_11.other = L9_12
  L12_15, L13_16 = nil, nil
  L12_15 = L8_11
  L10_13(L11_14, L12_15)
  L12_15, L13_16 = nil, nil
  L14_17 = {}
  L10_13(L11_14, L12_15, L13_16, L14_17)
  L10_13(L11_14)
  L8_11 = {
    L9_12,
    L10_13,
    [8] = L11_14(L12_15, L13_16, L14_17)
  }
  L12_15 = 0
  L13_16 = -20
  L12_15 = "vendors"
  L12_15 = -17
  L13_16 = 0
  L14_17 = -22
  L12_15 = "bench_kw_01"
  L13_16 = "bench_0"
  L12_15 = Vector
  L13_16 = -17
  L14_17 = 0
  L15_18 = -24
  L12_15 = L12_15(L13_16, L14_17, L15_18)
  L13_16 = "barrel_kk_01"
  L14_17 = "barrel_0"
  L15_18 = L11_14(L12_15, L13_16, L14_17)
  ;({
    L9_12,
    L10_13,
    [8] = L11_14(L12_15, L13_16, L14_17)
  })[3] = L11_14
  ;({
    L9_12,
    L10_13,
    [8] = L11_14(L12_15, L13_16, L14_17)
  })[4] = L12_15
  ;({
    L9_12,
    L10_13,
    [8] = L11_14(L12_15, L13_16, L14_17)
  })[5] = L13_16
  ;({
    L9_12,
    L10_13,
    [8] = L11_14(L12_15, L13_16, L14_17)
  })[6] = L14_17
  ;({
    L9_12,
    L10_13,
    [8] = L11_14(L12_15, L13_16, L14_17)
  })[7] = L15_18
  for L12_15, L13_16 in L9_12(L10_13) do
    L15_18 = L6_9
    L14_17 = L6_9.appendChild
    L14_17(L15_18, L13_16)
  end
  L9_12()
  if L9_12 then
    L9_12(L10_13)
  end
  if L9_12 then
    L9_12(L10_13)
  end
end
function test_del_area(A0_34)
  wait(120)
end
function test_bird(A0_35)
  Mob:hatch(A0_35, {
    geom = AabbByOriginAndHalfExtents(Vector(-10, 0, -30), Vector(1, 1, 1)),
    class = Mob:getClassIdx("pigeon"),
    num = 3
  })
end
function spawn_npc(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44
  L1_37 = dbg_print
  L1_37(L2_38)
  L1_37 = {
    L2_38,
    L3_39,
    L4_40,
    L5_41
  }
  L2_38.name = "posA"
  L6_42 = -25.3
  L2_38.pos = L3_39
  L3_39.name = "posB"
  L6_42 = 0
  L7_43 = -25.3
  L3_39.pos = L4_40
  L4_40.name = "posC"
  L6_42 = -12.7
  L7_43 = 0
  L8_44 = -35.3
  L4_40.pos = L5_41
  L5_41.name = "posD"
  L6_42 = Vector
  L7_43 = 2.7
  L8_44 = 0
  L6_42 = L6_42(L7_43, L8_44, -35.3)
  L5_41.pos = L6_42
  for L5_41, L6_42 in L2_38(L3_39) do
    L7_43 = createGameObject2
    L8_44 = "Node"
    L7_43 = L7_43(L8_44)
    L8_44 = L7_43.setName
    L8_44(L7_43, L6_42.name)
    L8_44 = L7_43.setPos
    L8_44(L7_43, L6_42.pos)
    L8_44 = A0_36.appendChild
    L8_44(A0_36, L7_43)
  end
  L3_39.label = "man01"
  L3_39.npcName = "NPC_man01"
  L6_42 = 0
  L7_43 = 45
  L3_39.pos = L4_40
  L6_42 = 0
  L7_43 = 0
  L8_44 = 1
  L3_39.rot = L4_40
  for L6_42, L7_43 in L3_39(L4_40) do
    L8_44 = {}
    L8_44.use_gravity = true
    Npc.Load(L7_43.npcName, A0_36, L7_43.pos, L7_43.rot, L7_43.label, L8_44)
  end
  L3_39()
  L3_39()
  L3_39()
  L5_41.arrivedLength = 3
  L5_41.runLength = -1
  L5_41.navimesh = true
  L5_41.noTurn = false
  L5_41.loop = true
  L5_41.recast = false
  L7_43 = L4_40
  L6_42 = L4_40.setMoveOption
  L8_44 = L5_41
  L6_42(L7_43, L8_44)
  L6_42 = {
    L7_43,
    L8_44,
    {
      pos = "posC",
      opt = {}
    },
    {
      pos = "posD",
      opt = {}
    }
  }
  L7_43 = {}
  L7_43.pos = "posA"
  L8_44 = {}
  L7_43.opt = L8_44
  L8_44 = {}
  L8_44.pos = "posB"
  L8_44.opt = {}
  L8_44 = L4_40
  L7_43 = L4_40.move
  L7_43(L8_44, L6_42)
end
function disablePlacementAndKillPawnsFromPlacement(A0_45, A1_46)
  local L2_47, L3_48
  L2_47 = Mob
  L3_48 = L2_47
  L2_47 = L2_47.getHatReqIdxOfPawnId
  L2_47 = L2_47(L3_48, A0_45, A1_46)
  if L2_47 then
    L3_48 = Mob
    L3_48 = L3_48.setHatReqIdxEnabled
    L3_48 = L3_48(L3_48, A0_45, L2_47, false)
  end
  if L2_47 then
    L3_48 = Mob
    L3_48 = L3_48.collectPawnIdsWithHatReqIdx
    L3_48 = L3_48(L3_48, A0_45, L2_47)
    if L3_48 then
      Mob:killPawns(A0_45, L3_48)
    end
  end
end
function Mob.debug_func()
  local L0_49, L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58
  L0_49 = dbg_print
  L1_50 = "overidden Mob.debug_func[@test_zz] was called"
  L0_49(L1_50)
  L0_49 = Mob
  L1_50 = L0_49
  L0_49 = L0_49.getMainPartition
  L0_49 = L0_49(L1_50)
  L1_50 = Mob
  L2_51 = L1_50
  L1_50 = L1_50.topUpHatchery
  L1_50(L2_51)
  L1_50 = false
  if L1_50 then
    L1_50 = Mob
    L2_51 = L1_50
    L1_50 = L1_50.getDebugTargedPawnId
    L1_50 = L1_50(L2_51)
    L2_51 = Mob
    L3_52 = L2_51
    L2_51 = L2_51.getHatReqIdxOfPawnId
    L4_53 = L0_49
    L2_51 = L2_51(L3_52, L4_53, L5_54)
    L3_52 = dbg_print
    L4_53 = "hatReqIdx: "
    L3_52(L4_53, L5_54)
    L3_52 = Mob
    L4_53 = L3_52
    L3_52 = L3_52.collectPawnIdsWithHatReqIdx
    L3_52 = L3_52(L4_53, L5_54, L6_55)
    L4_53 = #L3_52
    for L8_57, L9_58 in L5_54(L6_55) do
      dbg_print("collectPawnIdsWithHatReqIdx: ", L8_57, L9_58)
    end
    L8_57 = L3_52
    L5_54(L6_55, L7_56, L8_57)
  end
end
