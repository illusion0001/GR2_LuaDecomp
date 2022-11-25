L0_0 = import
L0_0("GameDatabase")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Area")
L0_0 = import
L0_0("Player")
L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Pad")
L0_0 = dofile
L0_0("/Game/Supporter/supporter_spawn.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_spawner_register.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {
  {
    asset_name = "gui_marker_01",
    title = "",
    icon = "gui_3dicon_01",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_02",
    title = "",
    icon = "gui_3dicon_02",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_03",
    title = "",
    icon = "gui_3dicon_03",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_04",
    title = "",
    icon = "gui_3dicon_04",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_05",
    title = "",
    icon = "gui_3dicon_05",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_06",
    title = "",
    icon = "gui_3dicon_06",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_07",
    title = "",
    icon = "gui_3dicon_07",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_08",
    title = "",
    icon = "gui_3dicon_08",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_09",
    title = "",
    icon = "gui_3dicon_09",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_10",
    title = "",
    icon = "gui_3dicon_10",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_11",
    title = "",
    icon = "gui_3dicon_11",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_12",
    title = "",
    icon = "gui_3dicon_12",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_20",
    title = "",
    icon = "gui_3dicon_20",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_21",
    title = "",
    icon = "gui_3dicon_21",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_22",
    title = "",
    icon = "gui_3dicon_22",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_23",
    title = "",
    icon = "gui_3dicon_23",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_24",
    title = "",
    icon = "gui_3dicon_24",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_26",
    title = "",
    icon = "gui_3dicon_26",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_27",
    title = "",
    icon = "gui_3dicon_27",
    subtitle = ""
  },
  {
    asset_name = "gui_marker_28",
    title = "",
    icon = "gui_3dicon_28",
    subtitle = ""
  }
}
function main()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = HUD
  L1_2 = L0_1
  L0_1 = L0_1.menuOpen
  L2_3 = "Main"
  L0_1(L1_2, L2_3)
  L0_1 = DebugStage
  L1_2 = L0_1
  L0_1 = L0_1.createTestStage
  L0_1 = L0_1(L1_2)
  L1_2 = DebugStage
  L2_3 = L1_2
  L1_2 = L1_2.createTestPlayer
  L1_2 = L1_2(L2_3)
  L2_3 = nil
  L3_4 = 0
  for L7_8, L8_9 in L4_5(L5_6) do
    print(L7_8)
    pos = Vector(0, 0, 20 + 2 * L3_4)
    CreateMapmaker(L8_9, "default", pos)
    L3_4 = L3_4 + 1
  end
  L7_8 = Vector
  L8_9 = 0
  L8_9 = L7_8(L8_9, 0, 26)
  L4_5(L5_6, L6_7, L7_8, L8_9, L7_8(L8_9, 0, 26))
  L7_8 = Vector
  L8_9 = 0
  L8_9 = L7_8(L8_9, 0, 30)
  L4_5(L5_6, L6_7, L7_8, L8_9, L7_8(L8_9, 0, 30))
  L3_4 = 0
  for L7_8, L8_9 in L4_5(L5_6) do
    print(L7_8)
    pos = Vector(5, 0, 20 + 2 * L3_4)
    CreateMapmaker(L8_9, "D", pos)
    L3_4 = L3_4 + 1
  end
  L7_8 = Vector
  L8_9 = 5
  L8_9 = L7_8(L8_9, 0, 26)
  L4_5(L5_6, L6_7, L7_8, L8_9, L7_8(L8_9, 0, 26))
  L7_8 = Vector
  L8_9 = 5
  L8_9 = L7_8(L8_9, 0, 30)
  L4_5(L5_6, L6_7, L7_8, L8_9, L7_8(L8_9, 0, 30))
  L7_8 = "gui_marker_30"
  L5_6(L6_7, L7_8)
  L7_8 = "gui_marker_30"
  L5_6(L6_7, L7_8)
  L7_8 = "C"
  L8_9 = Vector
  L8_9 = L8_9(3, 5, 3)
  L5_6(L6_7, L7_8, L8_9, L8_9(3, 5, 3))
  L7_8 = Vector
  L8_9 = -15
  L8_9 = L7_8(L8_9, 0.1, -35)
  L5_6(L6_7, L7_8, L8_9, L7_8(L8_9, 0.1, -35))
  L7_8 = "motion_test_stage1_01"
  L7_8 = L5_6
  L8_9 = L4_5
  L6_7(L7_8, L8_9)
  L6_7()
  L6_7()
  L6_7()
  L7_8 = L6_7
  L8_9 = true
  L6_7(L7_8, L8_9)
end
function CreateMapmaker(A0_10, A1_11, A2_12)
  createGameObject2("MapMarker"):setName(A0_10.asset_name)
  createGameObject2("MapMarker"):setAssetName(A0_10.asset_name)
  createGameObject2("MapMarker"):setHudParameter(A0_10.title, A0_10.icon, A0_10.subtitle)
  createGameObject2("MapMarker"):setupPattern(A1_11)
  createGameObject2("MapMarker"):setPos(A2_12)
end
