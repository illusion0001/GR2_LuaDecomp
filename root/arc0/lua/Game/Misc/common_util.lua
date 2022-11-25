__loaded_game_misc_common_util__ = true
import("Debug")
function table.map(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L2_2 = {}
  for L6_6, L7_7 in L3_3(L4_4) do
    L2_2[L6_6] = A1_1(L7_7)
  end
  return L2_2
end
map = table.map
function table.filter(A0_8, A1_9)
  local L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L2_10 = {}
  for L6_14, L7_15 in L3_11(L4_12) do
    if A1_9(L7_15) then
      L2_10[L6_14] = L7_15
    end
  end
  return L2_10
end
function strcat(...)
  L0_16 = {
    ...
  }
  return table.concat(table.map(L0_16, function(A0_17)
    return tostring(A0_17)
  end))
end
function flatten(...)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
  L0_18 = 1
  L1_19 = {}
  L6_24 = ...
  ;({
    [4] = ...
  })[1] = L4_22
  ;({
    [4] = ...
  })[2] = L5_23
  ;({
    [4] = ...
  })[3] = L6_24
  for L5_23, L6_24 in L2_20(L3_21) do
    if type(L6_24) == "table" then
      for _FORV_10_, _FORV_11_ in pairs(L6_24) do
        L1_19[L0_18] = _FORV_11_
        L0_18 = L0_18 + 1
      end
    else
      L1_19[L0_18] = L6_24
      L0_18 = L0_18 + 1
    end
  end
  return L1_19
end
function iota(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30, L6_31
  L2_27 = {}
  for L6_31 = A0_25, A1_26 - 1 do
    table.insert(L2_27, L6_31)
  end
  return L2_27
end
function iter_vector(A0_32)
  local L1_33, L2_34, L3_35, L4_36
  L1_33 = 1
  L2_34 = #A0_32
  L3_35 = 1
  function L4_36()
    local L0_37, L1_38, L2_39
    L0_37 = L3_35
    L1_38 = L2_34
    if L0_37 <= L1_38 then
      L0_37 = L3_35
      L1_38 = L1_33
      L2_39 = L1_33
      L2_39 = L2_39 + 1
      L1_33 = L2_39
      L2_39 = L3_35
      L2_39 = L2_39 + 3
      L3_35 = L2_39
      L2_39 = L1_38
      return L2_39, Vector(A0_32[L0_37 + 0], A0_32[L0_37 + 1], A0_32[L0_37 + 2])
    end
  end
  return L4_36
end
function iter_sphere(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  L1_41 = 1
  L2_42 = #A0_40
  L3_43 = 1
  function L4_44()
    local L0_45, L1_46, L2_47
    L0_45 = L3_43
    L1_46 = L2_42
    if L0_45 <= L1_46 then
      L0_45 = L3_43
      L1_46 = L1_41
      L2_47 = L1_41
      L2_47 = L2_47 + 1
      L1_41 = L2_47
      L2_47 = L3_43
      L2_47 = L2_47 + 4
      L3_43 = L2_47
      L2_47 = L1_46
      return L2_47, Sphere(Vector(A0_40[L0_45 + 0], A0_40[L0_45 + 1], A0_40[L0_45 + 2]), A0_40[L0_45 + 3])
    end
  end
  return L4_44
end
function to_spheres(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53, L6_54
  L1_49 = {}
  for L5_53, L6_54 in L2_50(L3_51) do
    table.insert(L1_49, L6_54)
  end
  return L1_49
end
function dbg_print(...)
  local L1_56, L2_57, L3_58, L4_59, L5_60, L6_61
  L0_55 = {
    [7] = ...
  }
  L6_61 = ...
  ;({
    [7] = ...
  })[1] = L1_56
  ;({
    [7] = ...
  })[2] = L2_57
  ;({
    [7] = ...
  })[3] = L3_58
  ;({
    [7] = ...
  })[4] = L4_59
  ;({
    [7] = ...
  })[5] = L5_60
  ;({
    [7] = ...
  })[6] = L6_61
  L1_56 = {}
  for L5_60, L6_61 in L2_57(L3_58) do
    table.insert(L1_56, tostring(L6_61))
  end
  L5_60 = L4_59
  L6_61 = L3_58
  L4_59(L5_60, L6_61, Debug.kTextColor_Yellow, L2_57 .. "\n")
end
function warn(A0_62)
  Debug:consolePrint(Debug.kStandard, Debug.kTextColor_Red, A0_62 .. "\n")
end
