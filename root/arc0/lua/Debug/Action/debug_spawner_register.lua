import("Debug")
import("math")
import("common")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_layout.lua")
dofile("/Debug/Action/debug_spawner.lua")
function Debug_RegisterSpawners()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30
  L0_0 = {}
  L0_0.name = "gellyfish x5 LayoutBeam"
  L1_1 = spawn_enemy
  L0_0.func = L1_1
  L1_1 = {}
  L1_1.enemy_class = "old_gellyfish"
  L2_2 = LayoutBeam
  L1_1.layout_func = L2_2
  L2_2 = {}
  L2_2.num = 5
  L2_2.space = 2
  L2_2.from_player_distance = 3
  L1_1.layout_args = L2_2
  L0_0.args = L1_1
  L1_1 = DebugSpawner
  L2_2 = L1_1
  L1_1 = L1_1.register
  L3_3 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = {}
  L1_1.name = "gellyfish x5 LayoutSphere"
  L2_2 = spawn_enemy
  L1_1.func = L2_2
  L2_2 = {}
  L2_2.enemy_class = "old_gellyfish"
  L3_3 = LayoutSphere
  L2_2.layout_func = L3_3
  L3_3 = {}
  L3_3.num = 5
  L3_3.radius = 5
  L3_3.from_player_distance = 10
  L2_2.layout_args = L3_3
  L1_1.args = L2_2
  L2_2 = DebugSpawner
  L3_3 = L2_2
  L2_2 = L2_2.register
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L2_2 = {}
  L2_2.name = "hander x5 LayoutCircle"
  L3_3 = spawn_enemy
  L2_2.func = L3_3
  L3_3 = {}
  L3_3.enemy_class = "new_hander"
  L4_4 = LayoutCircle
  L3_3.layout_func = L4_4
  L4_4 = {}
  L4_4.num = 5
  L4_4.radius = 5
  L4_4.from_player_distance = 10
  L3_3.layout_args = L4_4
  L2_2.args = L3_3
  L3_3 = DebugSpawner
  L4_4 = L3_3
  L3_3 = L3_3.register
  L5_5 = L2_2
  L3_3(L4_4, L5_5)
  L3_3 = {}
  L3_3.name = "supporter"
  L4_4 = spawn_supporter
  L3_3.func = L4_4
  L4_4 = {}
  L4_4.num = 1
  L5_5 = LayoutSphere_UpperHalf
  L4_4.layout_func = L5_5
  L5_5 = {}
  L5_5.num = 1
  L5_5.radius = 3
  L5_5.from_player_distance = 3
  L4_4.layout_args = L5_5
  L3_3.args = L4_4
  L4_4 = DebugSpawner
  L5_5 = L4_4
  L4_4 = L4_4.register
  L6_6 = L3_3
  L4_4(L5_5, L6_6)
  L4_4 = {}
  L4_4.name = "supporter x10 LayoutSphere_UpperHalf"
  L5_5 = spawn_supporter
  L4_4.func = L5_5
  L5_5 = {}
  L5_5.num = 1
  L6_6 = LayoutSphere_UpperHalf
  L5_5.layout_func = L6_6
  L6_6 = LayoutCircle
  L5_5.layout_func = L6_6
  L6_6 = {}
  L6_6.num = 10
  L6_6.radius = 2.5
  L6_6.from_player_distance = 7
  L5_5.layout_args = L6_6
  L4_4.args = L5_5
  L5_5 = DebugSpawner
  L6_6 = L5_5
  L5_5 = L5_5.register
  L7_7 = L4_4
  L5_5(L6_6, L7_7)
  L5_5 = {}
  L5_5.name = "supporter_on_ground"
  L6_6 = spawn_supporter_for_only_ground
  L5_5.func = L6_6
  L6_6 = {}
  L6_6.num = 1
  L7_7 = LayoutSphere_UpperHalf
  L6_6.layout_func = L7_7
  L7_7 = {}
  L7_7.num = 1
  L7_7.radius = 3
  L7_7.from_player_distance = 3
  L6_6.layout_args = L7_7
  L5_5.args = L6_6
  L6_6 = DebugSpawner
  L7_7 = L6_6
  L6_6 = L6_6.register
  L8_8 = L5_5
  L6_6(L7_7, L8_8)
  L6_6 = {}
  L6_6.name = "crow_with_kali"
  L7_7 = spawn_supporter_with_kali
  L6_6.func = L7_7
  L7_7 = {}
  L7_7.num = 1
  L8_8 = LayoutSphere_UpperHalf
  L7_7.layout_func = L8_8
  L8_8 = {}
  L8_8.num = 1
  L8_8.radius = 3
  L8_8.from_player_distance = 3
  L7_7.layout_args = L8_8
  L6_6.args = L7_7
  L7_7 = DebugSpawner
  L8_8 = L7_7
  L7_7 = L7_7.register
  L9_9 = L6_6
  L7_7(L8_8, L9_9)
  L7_7 = {}
  L7_7.name = "crow_of_enemy"
  L8_8 = spawn_crow_of_enemy
  L7_7.func = L8_8
  L8_8 = {}
  L8_8.num = 1
  L9_9 = LayoutSphere_UpperHalf
  L8_8.layout_func = L9_9
  L9_9 = {}
  L9_9.num = 1
  L9_9.radius = 3
  L9_9.from_player_distance = 3
  L8_8.layout_args = L9_9
  L7_7.args = L8_8
  L8_8 = DebugSpawner
  L9_9 = L8_8
  L8_8 = L8_8.register
  L10_10 = L7_7
  L8_8(L9_9, L10_10)
  L8_8 = {}
  L8_8.name = "crow_of_enemy x10 LayoutSphere_UpperHalf"
  L9_9 = spawn_crow_of_enemy
  L8_8.func = L9_9
  L9_9 = {}
  L9_9.num = 1
  L10_10 = LayoutSphere_UpperHalf
  L9_9.layout_func = L10_10
  L10_10 = LayoutCircle
  L9_9.layout_func = L10_10
  L10_10 = {}
  L10_10.num = 10
  L10_10.radius = 2.5
  L10_10.from_player_distance = 7
  L9_9.layout_args = L10_10
  L8_8.args = L9_9
  L9_9 = DebugSpawner
  L10_10 = L9_9
  L9_9 = L9_9.register
  L11_11 = L8_8
  L9_9(L10_10, L11_11)
  L9_9 = {}
  L9_9.name = "crow_with_garuda"
  L10_10 = spawn_crow_with_garuda
  L9_9.func = L10_10
  L10_10 = {}
  L10_10.num = 1
  L11_11 = LayoutSphere_UpperHalf
  L10_10.layout_func = L11_11
  L11_11 = LayoutCircle
  L10_10.layout_func = L11_11
  L11_11 = {}
  L11_11.num = 1
  L11_11.radius = 2.5
  L11_11.from_player_distance = 7
  L10_10.layout_args = L11_11
  L9_9.args = L10_10
  L10_10 = DebugSpawner
  L11_11 = L10_10
  L10_10 = L10_10.register
  L12_12 = L9_9
  L10_10(L11_11, L12_12)
  L10_10 = {}
  L10_10.name = "crow_with_ghost"
  L11_11 = spawn_crow_with_ghost
  L10_10.func = L11_11
  L11_11 = {}
  L11_11.num = 1
  L12_12 = LayoutSphere_UpperHalf
  L11_11.layout_func = L12_12
  L12_12 = LayoutCircle
  L11_11.layout_func = L12_12
  L12_12 = {}
  L12_12.num = 1
  L12_12.radius = 2.5
  L12_12.from_player_distance = 7
  L11_11.layout_args = L12_12
  L10_10.args = L11_11
  L11_11 = DebugSpawner
  L12_12 = L11_11
  L11_11 = L11_11.register
  L13_13 = L10_10
  L11_11(L12_12, L13_13)
  L11_11 = {}
  L11_11.name = "kitten_of_enemy"
  L12_12 = spawn_kitten_of_enemy
  L11_11.func = L12_12
  L12_12 = {}
  L12_12.num = 1
  L13_13 = LayoutSphere_UpperHalf
  L12_12.layout_func = L13_13
  L13_13 = {}
  L13_13.num = 1
  L13_13.radius = 3
  L13_13.from_player_distance = 3
  L12_12.layout_args = L13_13
  L11_11.args = L12_12
  L12_12 = DebugSpawner
  L13_13 = L12_12
  L12_12 = L12_12.register
  L14_14 = L11_11
  L12_12(L13_13, L14_14)
  L12_12 = {}
  L12_12.name = "kitten_of_enemy x10 LayoutSphere_UpperHalf"
  L13_13 = spawn_kitten_of_enemy
  L12_12.func = L13_13
  L13_13 = {}
  L13_13.num = 1
  L14_14 = LayoutSphere_UpperHalf
  L13_13.layout_func = L14_14
  L14_14 = LayoutCircle
  L13_13.layout_func = L14_14
  L14_14 = {}
  L14_14.num = 10
  L14_14.radius = 2.5
  L14_14.from_player_distance = 7
  L13_13.layout_args = L14_14
  L12_12.args = L13_13
  L13_13 = DebugSpawner
  L14_14 = L13_13
  L13_13 = L13_13.register
  L15_15 = L12_12
  L13_13(L14_14, L15_15)
  L13_13 = {}
  L13_13.name = "kitten_with_feline"
  L14_14 = spawn_kitten_with_feline
  L13_13.func = L14_14
  L14_14 = {}
  L14_14.num = 1
  L15_15 = LayoutSphere_UpperHalf
  L14_14.layout_func = L15_15
  L15_15 = LayoutCircle
  L14_14.layout_func = L15_15
  L15_15 = {}
  L15_15.num = 1
  L15_15.radius = 2.5
  L15_15.from_player_distance = 7
  L14_14.layout_args = L15_15
  L13_13.args = L14_14
  L14_14 = DebugSpawner
  L15_15 = L14_14
  L14_14 = L14_14.register
  L16_16 = L13_13
  L14_14(L15_15, L16_16)
  L14_14 = {}
  L14_14.name = "raven"
  L15_15 = spawn_raven
  L14_14.func = L15_15
  L15_15 = {}
  L15_15.num = 1
  L16_16 = LayoutSphere_UpperHalf
  L15_15.layout_func = L16_16
  L16_16 = {}
  L16_16.num = 1
  L16_16.radius = 3
  L16_16.from_player_distance = 3
  L15_15.layout_args = L16_16
  L14_14.args = L15_15
  L15_15 = DebugSpawner
  L16_16 = L15_15
  L15_15 = L15_15.register
  L17_17 = L14_14
  L15_15(L16_16, L17_17)
  L15_15 = {}
  L15_15.name = "raven x10 LayoutSphere_UpperHalf"
  L16_16 = spawn_raven
  L15_15.func = L16_16
  L16_16 = {}
  L16_16.num = 1
  L17_17 = LayoutSphere_UpperHalf
  L16_16.layout_func = L17_17
  L17_17 = LayoutCircle
  L16_16.layout_func = L17_17
  L17_17 = {}
  L17_17.num = 10
  L17_17.radius = 2.5
  L17_17.from_player_distance = 7
  L16_16.layout_args = L17_17
  L15_15.args = L16_16
  L16_16 = DebugSpawner
  L17_17 = L16_16
  L16_16 = L16_16.register
  L18_18 = L15_15
  L16_16(L17_17, L18_18)
  L16_16 = {}
  L16_16.name = "cat"
  L17_17 = spawn_cat
  L16_16.func = L17_17
  L17_17 = {}
  L17_17.num = 1
  L18_18 = LayoutSphere_UpperHalf
  L17_17.layout_func = L18_18
  L18_18 = {}
  L18_18.num = 1
  L18_18.radius = 3
  L18_18.from_player_distance = 3
  L17_17.layout_args = L18_18
  L16_16.args = L17_17
  L17_17 = DebugSpawner
  L18_18 = L17_17
  L17_17 = L17_17.register
  L19_19 = L16_16
  L17_17(L18_18, L19_19)
  L17_17 = {}
  L17_17.name = "cat x10 LayoutSphere_UpperHalf"
  L18_18 = spawn_cat
  L17_17.func = L18_18
  L18_18 = {}
  L18_18.num = 1
  L19_19 = LayoutSphere_UpperHalf
  L18_18.layout_func = L19_19
  L19_19 = LayoutCircle
  L18_18.layout_func = L19_19
  L19_19 = {}
  L19_19.num = 10
  L19_19.radius = 2.5
  L19_19.from_player_distance = 7
  L18_18.layout_args = L19_19
  L17_17.args = L18_18
  L18_18 = DebugSpawner
  L19_19 = L18_18
  L18_18 = L18_18.register
  L20_20 = L17_17
  L18_18(L19_19, L20_20)
  L18_18 = {}
  L18_18.name = "breakable x5 LayoutCircle"
  L19_19 = spawn_breakable
  L18_18.func = L19_19
  L19_19 = {}
  L20_20 = {
    L21_21,
    L22_22,
    L23_23
  }
  L21_21 = "woodbox_kk_01"
  L22_22 = "woodbox_kk_02"
  L23_23 = "table_kk_01"
  L19_19.object_list = L20_20
  L20_20 = LayoutCircle
  L19_19.layout_func = L20_20
  L20_20 = {}
  L20_20.num = 5
  L20_20.radius = 2.5
  L20_20.from_player_distance = 7
  L19_19.layout_args = L20_20
  L18_18.args = L19_19
  L19_19 = DebugSpawner
  L20_20 = L19_19
  L19_19 = L19_19.register
  L21_21 = L18_18
  L19_19(L20_20, L21_21)
  L19_19 = {}
  L19_19.name = "breakable x10 LayoutCircle"
  L20_20 = spawn_breakable
  L19_19.func = L20_20
  L20_20 = {}
  L21_21 = {
    L22_22,
    L23_23,
    L24_24
  }
  L22_22 = "woodbox_kk_01"
  L23_23 = "woodbox_kk_02"
  L24_24 = "table_kk_01"
  L20_20.object_list = L21_21
  L21_21 = LayoutCircle
  L20_20.layout_func = L21_21
  L21_21 = {}
  L21_21.num = 10
  L21_21.radius = 4
  L21_21.from_player_distance = 7
  L20_20.layout_args = L21_21
  L19_19.args = L20_20
  L20_20 = DebugSpawner
  L21_21 = L20_20
  L20_20 = L20_20.register
  L22_22 = L19_19
  L20_20(L21_21, L22_22)
  L20_20 = {}
  L20_20.name = "breakable(m) x5 LayoutCircle"
  L21_21 = spawn_breakable
  L20_20.func = L21_21
  L21_21 = {}
  L22_22 = {L23_23}
  L23_23 = "woodbox_kk_05"
  L21_21.object_list = L22_22
  L22_22 = LayoutCircle
  L21_21.layout_func = L22_22
  L22_22 = {}
  L22_22.num = 5
  L22_22.radius = 2.5
  L22_22.from_player_distance = 7
  L21_21.layout_args = L22_22
  L20_20.args = L21_21
  L21_21 = DebugSpawner
  L22_22 = L21_21
  L21_21 = L21_21.register
  L23_23 = L20_20
  L21_21(L22_22, L23_23)
  L21_21 = {}
  L21_21.name = "breakable(m) x10 LayoutCircle"
  L22_22 = spawn_breakable
  L21_21.func = L22_22
  L22_22 = {}
  L23_23 = {L24_24}
  L24_24 = "woodbox_kk_05"
  L22_22.object_list = L23_23
  L23_23 = LayoutCircle
  L22_22.layout_func = L23_23
  L23_23 = {}
  L23_23.num = 10
  L23_23.radius = 4
  L23_23.from_player_distance = 7
  L22_22.layout_args = L23_23
  L21_21.args = L22_22
  L22_22 = DebugSpawner
  L23_23 = L22_22
  L22_22 = L22_22.register
  L24_24 = L21_21
  L22_22(L23_23, L24_24)
  L22_22 = {}
  L22_22.name = "breakable(l) x5 LayoutCircle"
  L23_23 = spawn_breakable
  L22_22.func = L23_23
  L23_23 = {}
  L24_24 = {L25_25}
  L25_25 = "vendors_sk_11"
  L23_23.object_list = L24_24
  L24_24 = LayoutCircle
  L23_23.layout_func = L24_24
  L24_24 = {}
  L24_24.num = 5
  L24_24.radius = 5
  L24_24.from_player_distance = 7
  L23_23.layout_args = L24_24
  L22_22.args = L23_23
  L23_23 = DebugSpawner
  L24_24 = L23_23
  L23_23 = L23_23.register
  L25_25 = L22_22
  L23_23(L24_24, L25_25)
  L23_23 = {}
  L23_23.name = "breakable(l) x10 LayoutCircle"
  L24_24 = spawn_breakable
  L23_23.func = L24_24
  L24_24 = {}
  L25_25 = {L26_26}
  L26_26 = "vendors_sk_11"
  L24_24.object_list = L25_25
  L25_25 = LayoutCircle
  L24_24.layout_func = L25_25
  L25_25 = {}
  L25_25.num = 10
  L25_25.radius = 5
  L25_25.from_player_distance = 7
  L24_24.layout_args = L25_25
  L23_23.args = L24_24
  L24_24 = DebugSpawner
  L25_25 = L24_24
  L24_24 = L24_24.register
  L26_26 = L23_23
  L24_24(L25_25, L26_26)
  L24_24 = {}
  L24_24.name = "breakable(m) x10 LayoutCircle"
  L25_25 = spawn_breakable
  L24_24.func = L25_25
  L25_25 = {}
  L26_26 = {L27_27}
  L27_27 = "woodbox_kk_05"
  L25_25.object_list = L26_26
  L26_26 = LayoutCircle
  L25_25.layout_func = L26_26
  L26_26 = {}
  L26_26.num = 10
  L26_26.radius = 4
  L26_26.from_player_distance = 7
  L25_25.layout_args = L26_26
  L24_24.args = L25_25
  L25_25 = DebugSpawner
  L26_26 = L25_25
  L25_25 = L25_25.register
  L27_27 = L24_24
  L25_25(L26_26, L27_27)
  L25_25 = {}
  L25_25.name = "breakable(*) x5 LayoutCircle"
  L26_26 = spawn_breakable
  L25_25.func = L26_26
  L26_26 = {}
  L27_27 = {L28_28}
  L28_28 = "table_kk_01"
  L26_26.object_list = L27_27
  L27_27 = LayoutCircle
  L26_26.layout_func = L27_27
  L27_27 = {}
  L27_27.num = 5
  L27_27.radius = 5
  L27_27.from_player_distance = 7
  L26_26.layout_args = L27_27
  L25_25.args = L26_26
  L26_26 = DebugSpawner
  L27_27 = L26_26
  L26_26 = L26_26.register
  L28_28 = L25_25
  L26_26(L27_27, L28_28)
  L26_26 = {}
  L26_26.name = "breakable(*) x10 LayoutCircle"
  L27_27 = spawn_breakable
  L26_26.func = L27_27
  L27_27 = {}
  L28_28 = {L29_29}
  L29_29 = "table_kk_01"
  L27_27.object_list = L28_28
  L28_28 = LayoutCircle
  L27_27.layout_func = L28_28
  L28_28 = {}
  L28_28.num = 10
  L28_28.radius = 5
  L28_28.from_player_distance = 7
  L27_27.layout_args = L28_28
  L26_26.args = L27_27
  L27_27 = DebugSpawner
  L28_28 = L27_27
  L27_27 = L27_27.register
  L29_29 = L26_26
  L27_27(L28_28, L29_29)
  L27_27 = {}
  L27_27.name = "debri x5 LayoutCircle"
  L28_28 = spawn_debri
  L27_27.func = L28_28
  L28_28 = {}
  L29_29 = {
    L30_30,
    "woodbox_kk_02"
  }
  L30_30 = "woodbox_kk_01"
  L28_28.object_list = L29_29
  L29_29 = LayoutCircle
  L28_28.layout_func = L29_29
  L29_29 = {}
  L29_29.num = 5
  L29_29.radius = 2.5
  L29_29.from_player_distance = 7
  L28_28.layout_args = L29_29
  L27_27.args = L28_28
  L28_28 = DebugSpawner
  L29_29 = L28_28
  L28_28 = L28_28.register
  L30_30 = L27_27
  L28_28(L29_29, L30_30)
  L28_28 = {}
  L28_28.name = "debri x10 LayoutCircle"
  L29_29 = spawn_debri
  L28_28.func = L29_29
  L29_29 = {}
  L30_30 = {
    "woodbox_kk_01",
    "woodbox_kk_02"
  }
  L29_29.object_list = L30_30
  L30_30 = LayoutCircle
  L29_29.layout_func = L30_30
  L30_30 = {}
  L30_30.num = 10
  L30_30.radius = 4
  L30_30.from_player_distance = 7
  L29_29.layout_args = L30_30
  L28_28.args = L29_29
  L29_29 = DebugSpawner
  L30_30 = L29_29
  L29_29 = L29_29.register
  L29_29(L30_30, L28_28)
  L29_29 = {}
  L29_29.name = "clone_debri x5 LayoutCircle"
  L30_30 = spawn_clone_debri
  L29_29.func = L30_30
  L30_30 = {}
  L30_30.object_list = {
    "woodbox_kk_01",
    "woodbox_kk_02",
    "apple_kn_01_base",
    "dust_iy_01"
  }
  L30_30.layout_func = LayoutCircle
  L30_30.layout_args = {
    num = 5,
    radius = 2.5,
    from_player_distance = 7
  }
  L29_29.args = L30_30
  L30_30 = DebugSpawner
  L30_30 = L30_30.register
  L30_30(L30_30, L29_29)
  L30_30 = {}
  L30_30.name = "clone_debri x10 LayoutCircle"
  L30_30.func = spawn_clone_debri
  L30_30.args = {
    object_list = {
      "woodbox_kk_01",
      "woodbox_kk_02",
      "apple_kn_01_base",
      "dust_iy_01"
    },
    layout_func = LayoutCircle,
    layout_args = {
      num = 10,
      radius = 4,
      from_player_distance = 7
    }
  }
  DebugSpawner:register(L30_30)
end
