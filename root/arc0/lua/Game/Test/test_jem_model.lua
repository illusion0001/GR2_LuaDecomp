local L1_1, L2_2, L3_3
L0_0 = import
L1_1 = "math"
L0_0(L1_1)
L0_0 = import
L1_1 = "EventData"
L0_0(L1_1)
L0_0 = import
L1_1 = "common"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "DeltaTimer"
L0_0(L1_1)
L0_0 = import
L1_1 = "Player"
L0_0(L1_1)
L0_0 = import
L1_1 = "Query"
L0_0(L1_1)
L0_0 = import
L1_1 = "Pad"
L0_0(L1_1)
L0_0 = import
L1_1 = "Area"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "EventHelper"
L0_0(L1_1)
L0_0 = import
L1_1 = "GlobalGem"
L0_0(L1_1)
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/GemCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_spawner_register.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_stage.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Hud/debugCommon.lua"
L0_0(L1_1)
L0_0 = {}
function L1_1()
  local L0_4, L1_5
end
L0_0.None = L1_1
function L1_1()
  GlobalGem:ClearTalismanOre()
end
L0_0.ClearTalismanOre = L1_1
L1_1 = {L2_2, L3_3}
L2_2 = {}
L3_3 = dbgCommon
L3_3 = L3_3.kTypeFunction
L2_2.type = L3_3
L3_3 = L0_0.None
L2_2.data = L3_3
L2_2.data_label = "None"
L3_3 = {}
L3_3.type = dbgCommon.kTypeFunction
L3_3.data = L0_0.ClearTalismanOre
L3_3.data_label = "ClearTalismanOre"
L0_0.root = L1_1
L1_1 = setEnableDebugDraw
L2_2 = true
L1_1(L2_2)
L1_1 = {
  L2_2,
  L3_3,
  {no = 3},
  {no = 4},
  {no = 5},
  {no = 6}
}
L2_2 = {}
L2_2.no = 1
L3_3 = {}
L3_3.no = 2
L2_2 = Vector
L3_3 = 4
L2_2 = L2_2(L3_3, 3, 20)
L3_3 = {
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 0, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 2, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_01_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 4, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 6, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 8, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_02_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 10, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_lo,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 12, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_mi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 14, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Lo,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  },
  {
    no = Talisman.kForm_03_hi,
    name = Talisman.kNameHiLo_Hi,
    isDynamic = false,
    pos = Vector(L2_2.x + 16, L2_2.y, L2_2.z)
  }
}
function talisman_relottery_func(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11, L6_12, L7_13, L8_14
  L5_11 = print
  L6_12 = "talisman_relottery_func"
  L5_11(L6_12)
  L5_11 = print
  L6_12 = A0_6
  L5_11(L6_12)
  L5_11 = print
  L6_12 = A1_7
  L5_11(L6_12)
  L5_11 = print
  L6_12 = A2_8
  L5_11(L6_12)
  L5_11 = print
  L6_12 = A3_9
  L5_11(L6_12)
  L5_11 = print
  L6_12 = A4_10
  L5_11(L6_12)
  L5_11 = 2
  L6_12 = 123
  L7_13 = 45
  L8_14 = 67
  print("shape =" .. L5_11)
  print("skill1=" .. L6_12)
  print("skill2=" .. L7_13)
  print("skill3=" .. L8_14)
  return L5_11, L6_12, L7_13, L8_14
end
function main()
  GameDatabase:reset(ggd.Savedata)
  HUD:menuOpen("Main")
  HUD:menuSetCallback(HUD.kCallback_TalismanRelottery, talisman_relottery_func)
  DeltaTimer:new():start()
  wait()
  global_gem_initialize()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  for _FORV_9_, _FORV_10_ in ipairs(L1_1) do
    createGameObject2("Gem"):setGemModelNo(_FORV_10_.no)
    createGameObject2("Gem"):setPos(Vector(-5, 1.5, 20) + Vector(2 * 0, 0, 0))
  end
  for _FORV_9_, _FORV_10_ in ipairs(L3_3) do
    createGameObject2("Talisman"):setPos(Vector(-5, 1.5, 20) + Vector(2 * (0 + 1), 0, 0))
    createGameObject2("Talisman"):setSkilId(1, 2, 3)
    createGameObject2("Talisman"):setModelNo(_FORV_10_.no)
    createGameObject2("Talisman"):setNameRarity(_FORV_10_.name)
    seid = ({
      HUD.kGemSE_TalismanN,
      HUD.kGemSE_TalismanU,
      HUD.kGemSE_TalismanR
    })[math.ceil(#{
      HUD.kGemSE_TalismanN,
      HUD.kGemSE_TalismanU,
      HUD.kGemSE_TalismanR
    } / 6 * (((_FORV_10_.no - 1) % 3 + 1) * 2 - 1))]
    createGameObject2("Talisman"):setGetSe(seid)
  end
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  GlobalGem:SetPreciousGemAddCallback("GetPreciousGemCallback")
  GlobalGem:SetTalismanGetCallback("GetTalismanCallback")
  GlobalGem:SetEnargyGemGetCallback("GetEnargyGemCallback")
  GlobalGem:SetVitalGemGetCallback("GetVitalGemCallback")
  GlobalGem:SetSpecialGemGetCallback("GetSpecialGemCallback")
  GlobalGem:SetCrowPreciousGemAddCallback("GetCrowPreciousGemCallback")
  GlobalGem:SetOtherPreciousGemCountEnable(false)
  Area:setAnimMoveDriftEnable(true)
  Debug:setSwitch({
    "Development",
    "Talisman",
    "Enable Talisman Random"
  }, true)
  Debug:setSwitch({
    "Development",
    "Talisman",
    "Enable Talisman Ore"
  }, true)
  invokeTask(function()
    local L0_15, L1_16, L2_17, L3_18
    L0_15 = HUD
    L0_15 = L0_15.stackTelopStart
    L0_15()
    while true do
      L0_15 = Pad
      L1_16 = L0_15
      L0_15 = L0_15.getButton
      L2_17 = Pad
      L2_17 = L2_17.kButton_RU
      L0_15 = L0_15(L1_16, L2_17)
      if L0_15 then
        L0_15 = HUD
        L1_16 = L0_15
        L0_15 = L0_15.menuOpen
        L2_17 = "Talisman"
        L0_15(L1_16, L2_17)
      end
      L0_15 = Pad
      L1_16 = L0_15
      L0_15 = L0_15.getButton
      L2_17 = Pad
      L2_17 = L2_17.kButton_RL
      L0_15 = L0_15(L1_16, L2_17)
      if L0_15 then
        L0_15 = HUD
        L1_16 = L0_15
        L0_15 = L0_15.menuOpen
        L2_17 = "DigoutResult"
        L3_18 = "ui_talisman_rs_header_1_01"
        L0_15(L1_16, L2_17, L3_18)
      end
      L0_15 = Pad
      L1_16 = L0_15
      L0_15 = L0_15.getButton
      L2_17 = Pad
      L2_17 = L2_17.kButton_RR
      L0_15 = L0_15(L1_16, L2_17)
      if L0_15 then
        L0_15 = HUD
        L1_16 = L0_15
        L0_15 = L0_15.menuOpen
        L2_17 = "Main"
        L3_18 = "OreList"
        L0_15(L1_16, L2_17, L3_18)
      end
      L0_15 = Pad
      L1_16 = L0_15
      L0_15 = L0_15.getButton
      L2_17 = Pad
      L2_17 = L2_17.kButton_L1
      L0_15 = L0_15(L1_16, L2_17)
      if L0_15 then
        L0_15 = HUD
        L1_16 = L0_15
        L0_15 = L0_15.giveUniqueTalisman
        L2_17 = 16
        L0_15 = L0_15(L1_16, L2_17)
        if L0_15 then
        end
        L0_15 = HUD
        L1_16 = L0_15
        L0_15 = L0_15.captionBegin
        L2_17 = "\227\130\191\227\131\170\227\130\185\227\131\158\227\131\179\227\130\146\227\130\130\227\130\137\227\129\132\227\129\190\227\129\151\227\129\159"
        L3_18 = 3
        L0_15(L1_16, L2_17, L3_18)
        L0_15 = wait
        L0_15()
        L0_15 = wait
        L0_15()
        L0_15 = wait
        L0_15()
      end
      L0_15 = Pad
      L1_16 = L0_15
      L0_15 = L0_15.getButton
      L2_17 = Pad
      L2_17 = L2_17.kButton_R3
      L0_15 = L0_15(L1_16, L2_17)
      if L0_15 then
        L0_15 = GameDatabase
        L1_16 = L0_15
        L0_15 = L0_15.get
        L2_17 = ggd
        L2_17 = L2_17.Savedata__TalismanOre__Stock00__Hi
        L0_15 = L0_15(L1_16, L2_17)
        L1_16 = GameDatabase
        L2_17 = L1_16
        L1_16 = L1_16.get
        L3_18 = ggd
        L3_18 = L3_18.Savedata__TalismanOre__Stock00__Lo
        L1_16 = L1_16(L2_17, L3_18)
        L2_17 = GameDatabase
        L3_18 = L2_17
        L2_17 = L2_17.get
        L2_17 = L2_17(L3_18, ggd.Savedata__TalismanOre__Stock00__Other)
        L3_18 = GlobalGem
        L3_18 = L3_18.convertTalismanOreInfo
        L3_18 = L3_18(L3_18, L0_15, L1_16, L2_17)
        print(L3_18)
      end
      L0_15 = wait
      L0_15()
    end
    L0_15 = HUD
    L0_15 = L0_15.stackTelopFinish
    L0_15()
  end)
end
function GetPreciousGemCallback(A0_19)
  print("GetPreciousGem")
end
function GetTalismanCallback(A0_20)
  local L1_21, L2_22
  L1_21 = print
  L2_22 = "GetTalisman"
  L1_21(L2_22)
  L2_22 = A0_20
  L1_21 = A0_20.getStackTelopIconType
  L1_21 = L1_21(L2_22)
  L2_22 = A0_20.getUnknownName
  L2_22 = L2_22(A0_20)
  HUD:stackTelopAddItem(L1_21, L2_22)
end
function GetEnargyGemCallback(A0_23)
  print("GetEnargyGem")
end
function GetVitalGemCallback(A0_24)
  print("GetVitalGem")
end
function GetSpecialGemCallback(A0_25)
  print("GetSpecialGem")
end
function GetCrowPreciousGemCallback(A0_26)
  print("GetCrowPreciousGem")
end
