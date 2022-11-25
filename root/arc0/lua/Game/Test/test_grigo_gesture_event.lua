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
  L12_15 = L6_9(L7_10)
  L12_15 = L5_8(L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L6_9(L7_10))
  L2_5 = L2_5(L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L5_8(L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L6_9(L7_10)))
  L3_6 = _start_game_obj
  L3_6()
  L3_6 = Area
  L4_7 = L3_6
  L3_6 = L3_6.setAnimMoveDriftEnable
  L5_8 = true
  L3_6(L4_7, L5_8)
  L4_7 = L0_3
  L3_6 = L0_3.getDescendant
  L3_6 = L3_6(L4_7)
  L4_7 = L3_6[1]
  L5_8 = nil
  L6_9 = dbg_print
  L6_9(L7_10, L8_11)
  L6_9 = {}
  for L10_13, L11_14 in L7_10(L8_11) do
    while true do
      L12_15 = L11_14.isLoading
      L12_15 = L12_15(L11_14)
      if L12_15 then
        L12_15 = wait
        L12_15()
      end
    end
    L12_15 = createGameObject2
    L12_15 = L12_15("MobPartition")
    L12_15:setName(L11_14:getName())
    Mob:registerAreaAndPartition(L11_14, L12_15)
    Mob:setFieldSetting(L12_15, {hasField = false})
    table.insert(L6_9, L12_15)
  end
  L5_8 = L6_9[1]
  L10_13 = "kLoadMobPlacementFile"
  L11_14 = false
  L7_10(L8_11, L9_12, L10_13, L11_14)
  L10_13 = "kHatchBands"
  L11_14 = false
  L7_10(L8_11, L9_12, L10_13, L11_14)
  L10_13 = {}
  L10_13.hasField = true
  L10_13.fieldNamePrefix = ""
  L7_10(L8_11, L9_12, L10_13)
  function L6_9(A0_16, A1_17, A2_18)
    local L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32
    L3_19 = false
    if L3_19 then
      L3_19 = Mob
      L3_19 = L3_19.getNumGuides
      L3_19 = L3_19(L4_20, L5_21)
      L4_20(L5_21, L6_22)
      for L7_23 = 1, L3_19 do
        L8_24 = Mob
        L8_24 = L8_24.getGuideName
        L8_24 = L8_24(L9_25, L10_26, L11_27)
        L9_25(L10_26, L11_27)
        L13_29 = 3
        L13_29 = #L9_25
        L14_30 = type
        L15_31 = L9_25
        L16_32 = L14_30(L15_31)
        L10_26(L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L14_30(L15_31))
        for L13_29, L14_30 in L10_26(L11_27) do
          L16_32 = L14_30
          L15_31 = L14_30.getVector
          L15_31 = L15_31(L16_32)
          L16_32 = L14_30.getYawInDeg
          L16_32 = L16_32(L14_30)
          dbg_print("  i: ", L13_29, "pos:", L15_31, "yaw:", L16_32)
          Mob:hatch(A1_17, {
            geom = L15_31,
            class = Mob:getClassIdx("man01"),
            role = Mob.kRoleStay,
            yaw = L16_32
          })
        end
      end
    end
    L3_19 = false
    if L3_19 then
      function L3_19(A0_33)
        local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41
        L1_34 = {
          L2_35,
          [8] = L3_36(L4_37)
        }
        L5_38 = A0_33[2]
        L5_38 = L5_38.pos
        L8_41 = L3_36(L4_37)
        ;({
          L2_35,
          [8] = L3_36(L4_37)
        })[2] = L3_36
        ;({
          L2_35,
          [8] = L3_36(L4_37)
        })[3] = L4_37
        ;({
          L2_35,
          [8] = L3_36(L4_37)
        })[4] = L5_38
        ;({
          L2_35,
          [8] = L3_36(L4_37)
        })[5] = L6_39
        ;({
          L2_35,
          [8] = L3_36(L4_37)
        })[6] = L7_40
        ;({
          L2_35,
          [8] = L3_36(L4_37)
        })[7] = L8_41
        for L5_38, L6_39 in L2_35(L3_36) do
          L7_40 = L6_39.pos
          L8_41 = L6_39.name
          Mob:hatch(A1_17, {
            geom = Sphere(L7_40, 0),
            class = Mob:getClassIdx(L8_41),
            role = Mob.kRoleStay,
            yaw = L1_34[L5_38]
          })
        end
      end
      L8_24 = -11
      L6_22.pos = L7_23
      L6_22.name = "man01"
      L8_24 = Vector
      L8_24 = L8_24(L9_25, L10_26, L11_27)
      L7_23.pos = L8_24
      L7_23.name = "man02"
      L8_24 = Vector
      L8_24 = L8_24(L9_25, L10_26, L11_27)
      L7_23.pos = L8_24
      L7_23.name = "man04"
      L8_24 = {}
      L8_24.pos = L9_25
      L8_24.name = "wom01"
      L8_24 = {}
      L8_24.pos = L9_25
      L8_24.name = "wom01"
      L13_29 = -19.5
      L9_25.pos = L10_26
      L9_25.name = "wom02"
      for L8_24, L9_25 in L5_21(L6_22) do
        L10_26(L11_27)
      end
    end
    L3_19 = false
    if L3_19 then
      L3_19 = Vector
      L3_19 = L3_19(L4_20, L5_21, L6_22)
      L8_24 = Sphere
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.geom = L8_24
      L8_24 = Mob
      L8_24 = L8_24.getClassIdx
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.class = L8_24
      L8_24 = Mob
      L8_24 = L8_24.kRoleSitAtTable
      L7_23.role = L8_24
      L7_23.yaw = 0
      L4_20(L5_21, L6_22, L7_23)
    end
    L3_19 = false
    if L3_19 then
      L3_19 = {L4_20, L5_21}
      L8_24 = -22
      L4_20.pos = L5_21
      L4_20.name = "man04"
      L8_24 = 0.66
      L5_21.pos = L6_22
      L5_21.name = "man05"
      L8_24 = L3_19[2]
      L8_24 = L8_24.pos
      L16_32 = L6_22(L7_23)
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[2] = L6_22
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[3] = L7_23
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[4] = L8_24
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[5] = L9_25
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[6] = L10_26
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[7] = L11_27
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[8] = L12_28
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[9] = L13_29
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[10] = L14_30
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[11] = L15_31
      ;({
        L5_21,
        [13] = L6_22(L7_23)
      })[12] = L16_32
      for L8_24, L9_25 in L5_21(L6_22) do
        L13_29 = {}
        L14_30 = L9_25.pos
        L13_29.geom = L14_30
        L14_30 = Mob
        L15_31 = L14_30
        L14_30 = L14_30.getClassIdx
        L16_32 = L9_25.name
        L14_30 = L14_30(L15_31, L16_32)
        L13_29.class = L14_30
        L14_30 = L4_20[L8_24]
        L13_29.yaw = L14_30
        L14_30 = Mob
        L14_30 = L14_30.kRolePlayGame
        L13_29.role = L14_30
        L10_26(L11_27, L12_28, L13_29)
      end
    end
    L3_19 = false
    if L3_19 then
      L3_19 = Vector
      L3_19 = L3_19(L4_20, L5_21, L6_22)
      L7_23.geom = L3_19
      L8_24 = Mob
      L8_24 = L8_24.getClassIdx
      L8_24 = L8_24(L9_25, L10_26)
      L7_23.class = L8_24
      L8_24 = Mob
      L8_24 = L8_24.kRoleVendor
      L7_23.role = L8_24
      L4_20(L5_21, L6_22, L7_23)
      L8_24 = {}
      L8_24.geom = L4_20
      L8_24.class = L9_25
      L8_24.role = L9_25
      L5_21(L6_22, L7_23, L8_24)
    end
    L3_19 = false
    if L3_19 then
      L3_19 = Vector
      L3_19 = L3_19(L4_20, L5_21, L6_22)
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
      L8_24 = -22
      L8_24 = "yy_jilga_roamer"
      L8_24 = {}
      for L12_28 = 1, L3_19 do
        L13_29 = Vector
        L14_30 = RandF
        L15_31 = -L4_20
        L16_32 = L4_20
        L14_30 = L14_30(L15_31, L16_32)
        L15_31 = 0
        L16_32 = RandF
        L16_32 = L16_32(-L4_20, L4_20)
        L13_29 = L13_29(L14_30, L15_31, L16_32, L16_32(-L4_20, L4_20))
        L14_30 = {}
        L15_31 = L5_21 + L13_29
        L14_30.pos = L15_31
        L15_31 = RandI
        L16_32 = L7_23
        L15_31 = L15_31(L16_32)
        L15_31 = L6_22[L15_31]
        L14_30.class = L15_31
        L15_31 = table
        L15_31 = L15_31.insert
        L16_32 = L8_24
        L15_31(L16_32, L14_30)
      end
      for L12_28, L13_29 in L9_25(L10_26) do
        L14_30 = Mob
        L15_31 = L14_30
        L14_30 = L14_30.hatch
        L16_32 = A1_17
        L14_30(L15_31, L16_32, {
          geom = L13_29.pos,
          class = L13_29.class,
          role = Mob.kRoleRoam
        })
      end
    end
    L3_19 = Vector
    L3_19 = L3_19(L4_20, L5_21, L6_22)
    L7_23.geom = L3_19
    L8_24 = Mob
    L8_24 = L8_24.getClassIdx
    L8_24 = L8_24(L9_25, L10_26)
    L7_23.class = L8_24
    L4_20(L5_21, L6_22, L7_23)
    L3_19 = AabbByOriginAndHalfExtents
    L8_24 = 9.68
    L16_32 = L5_21(L6_22, L7_23, L8_24)
    L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L5_21(L6_22, L7_23, L8_24))
    L4_20(L5_21, L6_22)
  end
  on_start = L6_9
  L6_9 = _start_game_obj
  L6_9()
  function L6_9(A0_42, A1_43)
    local L2_44, L3_45
    L2_44 = dbg_print
    L3_45 = "*** called by registerNavigationCallback *** "
    L2_44(L3_45, tostring(A0_42))
  end
  g_naviFunc = L6_9
  L6_9 = nil
  L10_13 = 0
  L11_14 = 0
  L12_15 = -35
  L10_13, L11_14 = nil, nil
  L12_15 = L6_9
  L7_10(L8_11, L9_12, L10_13, L11_14, L12_15)
  L6_9 = {
    L7_10,
    L8_11,
    [7] = L9_12(L10_13, L11_14, L12_15)
  }
  L10_13 = 0
  L11_14 = -20
  L10_13 = "vendors"
  L10_13 = -17
  L11_14 = 0
  L12_15 = -22
  L10_13 = "bench_kw_01"
  L11_14 = "bench_0"
  L10_13 = Vector
  L11_14 = -17
  L12_15 = 0
  L10_13 = L10_13(L11_14, L12_15, -24)
  L11_14 = "barrel_kk_01"
  L12_15 = "barrel_0"
  L12_15 = L9_12(L10_13, L11_14, L12_15)
  ;({
    L7_10,
    L8_11,
    [7] = L9_12(L10_13, L11_14, L12_15)
  })[3] = L9_12
  ;({
    L7_10,
    L8_11,
    [7] = L9_12(L10_13, L11_14, L12_15)
  })[4] = L10_13
  ;({
    L7_10,
    L8_11,
    [7] = L9_12(L10_13, L11_14, L12_15)
  })[5] = L11_14
  ;({
    L7_10,
    L8_11,
    [7] = L9_12(L10_13, L11_14, L12_15)
  })[6] = L12_15
  for L10_13, L11_14 in L7_10(L8_11) do
    L12_15 = L4_7.appendChild
    L12_15(L4_7, L11_14)
  end
  L7_10()
end
function test_del_area(A0_46)
  wait(120)
end
function test_bird(A0_47)
  Mob:hatch(A0_47, {
    geom = AabbByOriginAndHalfExtents(Vector(-10, 0, -30), Vector(1, 1, 1)),
    class = Mob:getClassIdx("pigeon"),
    num = 3
  })
end
function spawn_npc(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56
  L1_49 = dbg_print
  L1_49(L2_50)
  L1_49 = {
    L2_50,
    L3_51,
    L4_52,
    L5_53
  }
  L2_50.name = "posA"
  L6_54 = -25.3
  L2_50.pos = L3_51
  L3_51.name = "posB"
  L6_54 = 0
  L7_55 = -25.3
  L3_51.pos = L4_52
  L4_52.name = "posC"
  L6_54 = -12.7
  L7_55 = 0
  L8_56 = -35.3
  L4_52.pos = L5_53
  L5_53.name = "posD"
  L6_54 = Vector
  L7_55 = 2.7
  L8_56 = 0
  L6_54 = L6_54(L7_55, L8_56, -35.3)
  L5_53.pos = L6_54
  for L5_53, L6_54 in L2_50(L3_51) do
    L7_55 = createGameObject2
    L8_56 = "Node"
    L7_55 = L7_55(L8_56)
    L8_56 = L7_55.setName
    L8_56(L7_55, L6_54.name)
    L8_56 = L7_55.setPos
    L8_56(L7_55, L6_54.pos)
    L8_56 = A0_48.appendChild
    L8_56(A0_48, L7_55)
  end
  L3_51.label = "man01"
  L3_51.npcName = "NPC_man01"
  L6_54 = 0
  L7_55 = 45
  L3_51.pos = L4_52
  L6_54 = 0
  L7_55 = 0
  L8_56 = 1
  L3_51.rot = L4_52
  for L6_54, L7_55 in L3_51(L4_52) do
    L8_56 = {}
    L8_56.use_gravity = true
    Npc.Load(L7_55.npcName, A0_48, L7_55.pos, L7_55.rot, L7_55.label, L8_56)
  end
  L3_51()
  L3_51()
  L3_51()
  L5_53.arrivedLength = 3
  L5_53.runLength = -1
  L5_53.navimesh = true
  L5_53.noTurn = false
  L5_53.loop = true
  L5_53.recast = false
  L7_55 = L4_52
  L6_54 = L4_52.setMoveOption
  L8_56 = L5_53
  L6_54(L7_55, L8_56)
  L6_54 = {
    L7_55,
    L8_56,
    {
      pos = "posC",
      opt = {}
    },
    {
      pos = "posD",
      opt = {}
    }
  }
  L7_55 = {}
  L7_55.pos = "posA"
  L8_56 = {}
  L7_55.opt = L8_56
  L8_56 = {}
  L8_56.pos = "posB"
  L8_56.opt = {}
  L8_56 = L4_52
  L7_55 = L4_52.move
  L7_55(L8_56, L6_54)
end
