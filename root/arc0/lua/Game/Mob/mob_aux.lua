import("Debug")
dofile("/Game/Misc/common_util.lua")
dofile("/Game/Mob/mob_navi.lua")
Mob.area_with_pat_list = {
  "bu_a_02",
  "bu_a_09",
  {
    "bu_a_12_01",
    {resourceName = "bu_a_12"}
  },
  {
    "bu_a_12_02",
    {resourceName = "bu_a_12"}
  },
  "bu_a_15",
  "po_a_01",
  "po_a_02",
  "po_a_03",
  "po_a_04",
  "po_a_15",
  {
    "po_a_13_01",
    {resourceName = "po_a_13"}
  },
  {
    "po_a_13_02",
    {resourceName = "po_a_13"}
  },
  {
    "po_a_13_03",
    {resourceName = "po_a_13"}
  },
  {
    "po_a_13_04",
    {resourceName = "po_a_13"}
  },
  {
    "po_a_06_02",
    {resourceName = "po_a_06"}
  },
  {
    "po_a_06_04",
    {resourceName = "po_a_06"}
  },
  "cc_a_root",
  "ed_a_root",
  "dt_a_root",
  {
    "id_a_root",
    {visbleRadius = 6}
  },
  "lo_a_01",
  "lo_a_02",
  "lo_a_05",
  {
    "lo_a_04_01",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_02",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_03",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_04",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_05",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_06",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_07",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_08",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_09",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_10",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_11",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_12",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_13",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_14",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_15",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_16",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_17",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_18",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_19",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_20",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_21",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_22",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_23",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_24",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_25",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_26",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_27",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_28",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_29",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_30",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_31",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_32",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_33",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_34",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_35",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_36",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_04_37",
    {resourceName = "lo_a_04"}
  },
  {
    "lo_a_06_01",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_02",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_03",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_04",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_05",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_06",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_07",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_08",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_09",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_10",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_11",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_12",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_13",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_14",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_15",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_16",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_17",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_18",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_19",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_20",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_21",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_22",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_23",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_24",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_25",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_26",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_27",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_28",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_06_29",
    {resourceName = "lo_a_06"}
  },
  {
    "lo_a_07_01",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_02",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_03",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_04",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_05",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_06",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_07",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_08",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_09",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_10",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_11",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_12",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_13",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_14",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_15",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_16",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_17",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_18",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_19",
    {resourceName = "lo_a_07"}
  },
  {
    "lo_a_07_20",
    {resourceName = "lo_a_07"}
  },
  "mi_a_01",
  "mi_a_02",
  "mi_a_03",
  "mi_a_04",
  "mi_a_05",
  {
    "mi_a_06_01",
    {resourceName = "mi_a_06"}
  },
  {
    "mi_a_06_02",
    {resourceName = "mi_a_06"}
  },
  "mi_a_07",
  "mi_a_08",
  {
    "mi_a_09_01",
    {resourceName = "mi_a_09"}
  },
  {
    "mi_a_09_02",
    {resourceName = "mi_a_09"}
  },
  "mi_a_10",
  {
    "mi_a_11_01",
    {resourceName = "mi_a_11"}
  },
  {
    "mi_a_11_02",
    {resourceName = "mi_a_11"}
  },
  {
    "mi_a_13_01",
    {resourceName = "mi_a_13"}
  },
  {
    "mi_a_13_02",
    {resourceName = "mi_a_13"}
  },
  "mi_a_17",
  {
    "mi_a_23_01",
    {resourceName = "mi_a_23"}
  },
  {
    "mi_a_23_02",
    {resourceName = "mi_a_23"}
  },
  {
    "mi_a_23_03",
    {resourceName = "mi_a_23"}
  },
  {
    "mi_a_23_04",
    {resourceName = "mi_a_23"}
  },
  {
    "mi_a_23_05",
    {resourceName = "mi_a_23"}
  },
  {
    "po_a_10_01",
    {resourceName = "po_a_10"}
  },
  {
    "po_a_10_02",
    {resourceName = "po_a_10"}
  },
  {
    "po_a_10_03",
    {resourceName = "po_a_10"}
  },
  {"po_a_17"},
  {
    "po_a_19_01",
    {resourceName = "po_a_19"}
  },
  {
    "po_a_19_02",
    {resourceName = "po_a_19"}
  },
  {
    "po_a_19_03",
    {resourceName = "po_a_19"}
  },
  {
    "mi_a_18_01",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_02",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_03",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_04",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_05",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_06",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_07",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_18_08",
    {resourceName = "mi_a_18"}
  },
  {
    "mi_a_20_01",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_02",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_03",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_04",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_05",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_06",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_07",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_08",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_09",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_10",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_11",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_20_12",
    {resourceName = "mi_a_20"}
  },
  {
    "mi_a_21_01",
    {resourceName = "mi_a_21"}
  },
  {
    "mi_a_21_02",
    {resourceName = "mi_a_21"}
  },
  {
    "mi_a_21_03",
    {resourceName = "mi_a_21"}
  },
  {
    "mi_a_21_04",
    {resourceName = "mi_a_21"}
  },
  {
    "mi_a_21_05",
    {resourceName = "mi_a_21"}
  },
  "up_a_00",
  "up_a_01",
  {
    "up_a_02_01",
    {resourceName = "up_a_02"}
  },
  {
    "up_a_02_02",
    {resourceName = "up_a_02"}
  },
  {
    "up_a_04_01",
    {resourceName = "up_a_04"}
  },
  {
    "up_a_04_02",
    {resourceName = "up_a_04"}
  },
  {
    "up_a_04_03",
    {resourceName = "up_a_04"}
  },
  "up_a_05",
  "up_a_12",
  {
    "up_a_12a",
    {
      resourceName = "up_a_12a",
      hat_vol_factor = 30,
      camera_far_thr = 450
    }
  },
  {
    "go_a_root",
    {resourceName = "go_a_01"}
  }
}
function Mob.getPartitionNameAndResourceName(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7, L8_8 = nil, nil
    if type(L6_6) == "table" then
      L7_7, L8_8 = table.unpack(L6_6)
    else
      L8_8 = nil
      L7_7 = L6_6
    end
    if L7_7 == A1_1 then
      return L7_7, L8_8
    end
  end
  return L2_2, L3_3
end
Mob.dont_create_mob_partition = false
Mob.area_record = {}
function Mob._mob_set_debug_settings()
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "All Off"
  })
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "Debug Draw GameObject"
  }, true)
  Debug:setSwitch({"Display", "FPS"}, true)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Mob"
  }, true)
end
function Mob.debug_func()
  dbg_print("This is debug_func in Lua script.")
end
function Mob.to_string_all(A0_9)
  return table.map(A0_9, function(A0_10)
    return tostring(A0_10)
  end)
end
function Mob.choose(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16, L6_17
  L2_13 = #A0_11
  L3_14 = math
  L3_14 = L3_14.floor
  L4_15 = A1_12 / L2_13
  L3_14 = L3_14(L4_15)
  L4_15 = A1_12 % L2_13
  L5_16 = L3_14 * L2_13
  L6_17 = {}
  for _FORV_10_ = 0, L5_16 - 1 do
    table.insert(L6_17, A0_11[_FORV_10_ % L2_13 + 1])
  end
  for _FORV_10_ = 1, L4_15 do
    table.insert(L6_17, A0_11[RandI(L2_13)])
  end
  return L6_17
end
function PointYaw(A0_18, A1_19, A2_20, A3_21)
  local L4_22
  L4_22 = {}
  L4_22.__index = {
    getVector = function(A0_23)
      return Vector(A0_23.x, A0_23.y, A0_23.z)
    end,
    getYawInDeg = function(A0_24)
      return Rad2Deg(A0_24.yaw)
    end,
    getYawInRad = function(A0_25)
      local L1_26
      L1_26 = A0_25.yaw
      return L1_26
    end
  }
  function L4_22.__tostring(A0_27)
    return string.format("(%.2f, %.2f, %.2f, yaw=%.2f)", A0_27.x, A0_27.y, A0_27.z, A0_27.yaw)
  end
  return setmetatable({
    x = A0_18,
    y = A1_19,
    z = A2_20,
    yaw = A3_21
  }, L4_22)
end
