local L1_1
L0_0 = {}
L1_1 = {}
L0_0.funcs = L1_1
L0_0.__index = L0_0
function L1_1(A0_2, A1_3)
  return L0_0:new(A1_3)
end
L0_0.__call = L1_1
function L1_1(A0_4, A1_5, A2_6)
  return setmetatable({
    _val = A1_5,
    chained = A2_6 or false
  }, A0_4)
end
L0_0.new = L1_1
function L1_1(A0_7)
  if type(A0_7) == "function" then
    return A0_7
  end
  return coroutine.wrap(function()
    local L0_8, L2_9, L3_10
    for _FORV_3_ = 1, #L2_9 do
      coroutine.yield(A0_7[_FORV_3_])
    end
  end)
end
L0_0.iter = L1_1
function L1_1(A0_11, A1_12, A2_13)
  local L3_14
  if A1_12 == nil then
    A1_12 = A0_11
    A0_11 = 1
  end
  A2_13 = A2_13 or 1
  L3_14 = coroutine
  L3_14 = L3_14.wrap
  L3_14 = L3_14(function()
    local L0_15, L1_16, L2_17, L3_18
    for L3_18 = A0_11, A1_12, A2_13 do
      coroutine.yield(L3_18)
    end
  end)
  return L0_0:new(L3_14)
end
L0_0.range = L1_1
function L1_1(A0_19)
  local L1_20
  return A0_19
end
L0_0.identity = L1_1
function L1_1(A0_21)
  local L1_22
  A0_21.chained = true
  return A0_21
end
L0_0.chain = L1_1
function L1_1(A0_23)
  local L1_24
  L1_24 = A0_23._val
  return L1_24
end
L0_0.value = L1_1
L1_1 = L0_0.funcs
function L1_1.each(A0_25, A1_26)
  local L2_27, L3_28, L4_29, L5_30
  for L5_30 in L2_27(L3_28) do
    A1_26(L5_30)
  end
  return A0_25
end
L1_1 = L0_0.funcs
function L1_1.map(A0_31, A1_32)
  local L2_33, L3_34, L4_35, L5_36, L6_37
  L2_33 = {}
  for L6_37 in L3_34(L4_35) do
    L2_33[#L2_33 + 1] = A1_32(L6_37)
  end
  return L2_33
end
L1_1 = L0_0.funcs
function L1_1.reduce(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44
  for L6_44 in L3_41(L4_42) do
    A1_39 = A2_40(A1_39, L6_44)
  end
  return A1_39
end
L1_1 = L0_0.funcs
function L1_1.detect(A0_45, A1_46)
  local L2_47, L3_48, L4_49, L5_50
  for L5_50 in L2_47(L3_48) do
    if A1_46(L5_50) then
      return L5_50
    end
  end
  return L2_47
end
L1_1 = L0_0.funcs
function L1_1.select(A0_51, A1_52)
  local L2_53, L3_54, L4_55, L5_56, L6_57
  L2_53 = {}
  for L6_57 in L3_54(L4_55) do
    if A1_52(L6_57) then
      L2_53[#L2_53 + 1] = L6_57
    end
  end
  return L2_53
end
L1_1 = L0_0.funcs
function L1_1.reject(A0_58, A1_59)
  local L2_60, L3_61, L4_62, L5_63, L6_64
  L2_60 = {}
  for L6_64 in L3_61(L4_62) do
    if not A1_59(L6_64) then
      L2_60[#L2_60 + 1] = L6_64
    end
  end
  return L2_60
end
L1_1 = L0_0.funcs
function L1_1.all(A0_65, A1_66)
  local L2_67, L3_68, L4_69, L5_70
  A1_66 = A1_66 or L0_0.identity
  for L5_70 in L2_67(L3_68) do
    if not A1_66(L5_70) then
      return false
    end
  end
  return L2_67
end
L1_1 = L0_0.funcs
function L1_1.any(A0_71, A1_72)
  local L2_73, L3_74, L4_75, L5_76
  A1_72 = A1_72 or L0_0.identity
  for L5_76 in L2_73(L3_74) do
    if A1_72(L5_76) then
      return true
    end
  end
  return L2_73
end
L1_1 = L0_0.funcs
function L1_1.include(A0_77, A1_78)
  for _FORV_5_ in L0_0.iter(A0_77) do
    if _FORV_5_ == A1_78 then
      return true
    end
  end
  return false
end
L1_1 = L0_0.funcs
function L1_1.invoke(A0_79, A1_80, ...)
  L2_81 = {
    ...
  }
  L0_0.funcs.each(A0_79, function(A0_82)
    local L2_83
    L2_83 = A1_80
    L2_83 = A0_82[L2_83]
    L2_83(A0_82, unpack(L2_81))
  end)
  return A0_79
end
L1_1 = L0_0.funcs
function L1_1.pluck(A0_84, A1_85)
  return L0_0.funcs.map(A0_84, function(A0_86)
    return A0_86[A1_85]
  end)
end
L1_1 = L0_0.funcs
function L1_1.min(A0_87, A1_88)
  A1_88 = A1_88 or L0_0.identity
  return L0_0.funcs.reduce(A0_87, {item = nil, value = nil}, function(A0_89, A1_90)
    if A0_89.item == nil then
      A0_89.item = A1_90
      A0_89.value = A1_88(A1_90)
    elseif A1_88(A1_90) < A0_89.value then
      A0_89.value, A0_89.item = A1_88(A1_90), A1_90
    end
    return A0_89
  end).item
end
L1_1 = L0_0.funcs
function L1_1.max(A0_91, A1_92)
  A1_92 = A1_92 or L0_0.identity
  return L0_0.funcs.reduce(A0_91, {item = nil, value = nil}, function(A0_93, A1_94)
    if A0_93.item == nil then
      A0_93.item = A1_94
      A0_93.value = A1_92(A1_94)
    elseif A1_92(A1_94) > A0_93.value then
      A0_93.value, A0_93.item = A1_92(A1_94), A1_94
    end
    return A0_93
  end).item
end
L1_1 = L0_0.funcs
function L1_1.to_array(A0_95)
  local L1_96
  L1_96 = {}
  for _FORV_5_ in L0_0.iter(A0_95) do
    L1_96[#L1_96 + 1] = _FORV_5_
  end
  return L1_96
end
L1_1 = L0_0.funcs
function L1_1.reverse(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102
  L1_98 = {}
  for L5_102 in L2_99(L3_100) do
    table.insert(L1_98, 1, L5_102)
  end
  return L1_98
end
L1_1 = L0_0.funcs
function L1_1.sort(A0_103, A1_104)
  local L2_105
  L2_105 = A0_103
  if type(A0_103) == "function" then
    L2_105 = L0_0.funcs.to_array(A0_103)
  end
  table.sort(L2_105, A1_104)
  return L2_105
end
L1_1 = L0_0.funcs
function L1_1.first(A0_106, A1_107)
  if A1_107 == nil then
    return A0_106[1]
  else
    A1_107 = math.min(A1_107, #A0_106)
    for _FORV_6_ = 1, A1_107 do
      ;({})[_FORV_6_] = A0_106[_FORV_6_]
    end
    return {}
  end
end
L1_1 = L0_0.funcs
function L1_1.rest(A0_108, A1_109)
  local L2_110, L3_111, L4_112, L5_113, L7_114
  A1_109 = A1_109 or 2
  L2_110 = {}
  for L7_114 = A1_109, #A0_108 do
    L2_110[#L2_110 + 1] = A0_108[L7_114]
  end
  return L2_110
end
L1_1 = L0_0.funcs
function L1_1.slice(A0_115, A1_116, A2_117)
  local L3_118, L4_119
  L3_118 = {}
  L4_119 = math
  L4_119 = L4_119.max
  L4_119 = L4_119(A1_116, 1)
  A1_116 = L4_119
  L4_119 = math
  L4_119 = L4_119.min
  L4_119 = L4_119(A1_116 + A2_117 - 1, #A0_115)
  for _FORV_8_ = A1_116, L4_119 do
    L3_118[#L3_118 + 1] = A0_115[_FORV_8_]
  end
  return L3_118
end
L1_1 = L0_0.funcs
function L1_1.flatten(A0_120)
  local L1_121, L2_122, L3_123, L4_124, L5_125, L6_126
  L1_121 = {}
  for L5_125 in L2_122(L3_123) do
    L6_126 = type
    L6_126 = L6_126(L5_125)
    if L6_126 == "table" then
      L6_126 = L0_0.funcs
      L6_126 = L6_126.flatten
      L6_126 = L6_126(L5_125)
      L0_0.funcs.each(L6_126, function(A0_127)
        local L1_128
        L1_128 = L1_121
        L1_128 = #L1_128
        L1_128 = L1_128 + 1
        L1_121[L1_128] = A0_127
      end)
    else
      L6_126 = #L1_121
      L6_126 = L6_126 + 1
      L1_121[L6_126] = L5_125
    end
  end
  return L1_121
end
L1_1 = L0_0.funcs
function L1_1.push(A0_129, A1_130)
  table.insert(A0_129, A1_130)
  return A0_129
end
L1_1 = L0_0.funcs
function L1_1.pop(A0_131)
  return table.remove(A0_131)
end
L1_1 = L0_0.funcs
function L1_1.shift(A0_132)
  return table.remove(A0_132, 1)
end
L1_1 = L0_0.funcs
function L1_1.unshift(A0_133, A1_134)
  table.insert(A0_133, 1, A1_134)
  return A0_133
end
L1_1 = L0_0.funcs
function L1_1.join(A0_135, A1_136)
  return table.concat(A0_135, A1_136)
end
L1_1 = L0_0.funcs
function L1_1.keys(A0_137)
  local L1_138
  L1_138 = {}
  for _FORV_5_, _FORV_6_ in pairs(A0_137) do
    L1_138[#L1_138 + 1] = _FORV_5_
  end
  return L1_138
end
L1_1 = L0_0.funcs
function L1_1.values(A0_139)
  local L1_140
  L1_140 = {}
  for _FORV_5_, _FORV_6_ in pairs(A0_139) do
    L1_140[#L1_140 + 1] = _FORV_6_
  end
  return L1_140
end
L1_1 = L0_0.funcs
function L1_1.extend(A0_141, A1_142)
  for _FORV_5_, _FORV_6_ in pairs(A1_142) do
    A0_141[_FORV_5_] = _FORV_6_
  end
  return A0_141
end
L1_1 = L0_0.funcs
function L1_1.is_empty(A0_143)
  return next(A0_143) == nil
end
L1_1 = L0_0.funcs
function L1_1.is_equal(A0_144, A1_145, A2_146)
  local L3_147, L4_148, L5_149, L6_150, L7_151, L8_152, L9_153, L10_154, L11_155, L12_156
  L3_147 = type
  L4_148 = A0_144
  L3_147 = L3_147(L4_148)
  L4_148 = type
  L5_149 = A1_145
  L4_148 = L4_148(L5_149)
  if L3_147 ~= L4_148 then
    L5_149 = false
    return L5_149
  end
  if L3_147 ~= "table" then
    L5_149 = A0_144 == A1_145
    return L5_149
  end
  L5_149 = getmetatable
  L6_150 = A0_144
  L5_149 = L5_149(L6_150)
  if not A2_146 and L5_149 then
    L6_150 = L5_149.__eq
    if L6_150 then
      L6_150 = A0_144 == A1_145
      return L6_150
    end
  end
  L6_150 = L0_0.funcs
  L6_150 = L6_150.is_equal
  for L10_154, L11_155 in L7_151(L8_152) do
    L12_156 = A1_145[L10_154]
    if L12_156 == nil or not L6_150(L11_155, L12_156, A2_146) then
      return false
    end
  end
  for L10_154, L11_155 in L7_151(L8_152) do
    L12_156 = A0_144[L10_154]
    if L12_156 == nil then
      return false
    end
  end
  return L7_151
end
L1_1 = L0_0.funcs
function L1_1.compose(...)
  local L1_158
  function L0_157(A0_159, ...)
    L2_160 = #A0_159
    if L2_160 > 1 then
      L2_160 = A0_159[1]
      return L2_160(L0_157(_.rest(A0_159), ...))
    else
      L2_160 = A0_159[1]
      return L2_160(...)
    end
  end
  L1_158 = {
    ...
  }
  return function(...)
    local L1_162, L2_163
    L0_161 = L0_157
    L1_162 = L1_158
    L2_163 = ...
    return L0_161(L1_162, L2_163)
  end
end
L1_1 = L0_0.funcs
function L1_1.wrap(A0_164, A1_165)
  local L2_166
  function L2_166(...)
    local L1_168, L2_169
    L0_167 = A1_165
    L1_168 = A0_164
    L2_169 = ...
    return L0_167(L1_168, L2_169)
  end
  return L2_166
end
L1_1 = L0_0.funcs
function L1_1.curry(A0_170, A1_171)
  local L2_172
  function L2_172(...)
    local L1_174, L2_175
    L0_173 = A0_170
    L1_174 = A1_171
    L2_175 = ...
    return L0_173(L1_174, L2_175)
  end
  return L2_172
end
function L1_1()
  return L0_0.keys(L0_0.funcs)
end
L0_0.functions = L1_1
L1_1 = L0_0.functions
L0_0.methods = L1_1
L1_1 = L0_0.funcs
L1_1.for_each = L0_0.funcs.each
L1_1 = L0_0.funcs
L1_1.collect = L0_0.funcs.map
L1_1 = L0_0.funcs
L1_1.inject = L0_0.funcs.reduce
L1_1 = L0_0.funcs
L1_1.foldl = L0_0.funcs.reduce
L1_1 = L0_0.funcs
L1_1.filter = L0_0.funcs.select
L1_1 = L0_0.funcs
L1_1.every = L0_0.funcs.all
L1_1 = L0_0.funcs
L1_1.some = L0_0.funcs.any
L1_1 = L0_0.funcs
L1_1.head = L0_0.funcs.first
L1_1 = L0_0.funcs
L1_1.tail = L0_0.funcs.rest
function L1_1()
  local L0_176, L1_177, L2_178, L3_179, L4_180, L5_181, L6_182
  function L0_176(A0_183)
    local L1_184
    L1_184 = false
    if getmetatable(A0_183) == L0_0 then
      L1_184 = A0_183.chained
      A0_183 = A0_183._val
    end
    return A0_183, L1_184
  end
  function L1_177(A0_185, A1_186)
    if A1_186 then
      A0_185 = L0_0:new(A0_185, true)
    end
    return A0_185
  end
  for L5_181, L6_182 in L2_178(L3_179) do
    L0_0[L5_181] = function(A0_187, ...)
      local L2_189
      L1_188 = L0_176
      L2_189 = A0_187
      L2_189 = L1_188(L2_189)
      return L1_177(L6_182(L1_188, ...), L2_189)
    end
    break
  end
end
L1_1()
return L0_0:new()
