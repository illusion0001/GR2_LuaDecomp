local L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = dofile
L1_1 = "/Game/Misc/underscore.lua"
L0_0 = L0_0(L1_1)
U = L0_0
function L0_0(A0_6, A1_7)
  if A1_7 and A0_6 then
    while not Mob:isPartitionReady(A0_6) do
      wait()
    end
  end
end
function L1_1(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17
  L3_11 = {}
  for L7_15, L8_16 in L4_12(L5_13) do
    L9_17 = Mob
    L9_17 = L9_17.collectStopsInZone
    L9_17 = L9_17(L9_17, A0_8, L8_16)
    table.insert(L3_11, L9_17)
  end
  L3_11 = L4_12
  L7_15 = L3_11
  L8_16 = A2_10
  L4_12(L5_13, L6_14, L7_15, L8_16)
end
function L2_2(A0_18, A1_19, A2_20)
  local L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27
  L3_21 = {}
  for L7_25, L8_26 in L4_22(L5_23) do
    L9_27 = Mob
    L9_27 = L9_27.collectOverlappedStops
    L9_27 = L9_27(L9_27, A0_18, L8_26)
    table.insert(L3_21, L9_27)
  end
  L3_21 = L4_22
  L7_25 = L3_21
  L8_26 = A2_20
  L4_22(L5_23, L6_24, L7_25, L8_26)
end
function L3_3(A0_28, A1_29, A2_30)
  local L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37
  L3_31 = Mob
  L3_31 = L3_31.setHatReqIdxEnabled
  L7_35 = not A2_30
  L3_31(L4_32, L5_33, L6_34, L7_35)
  if A2_30 then
    L3_31 = {}
    for L7_35, L8_36 in L4_32(L5_33) do
      L9_37 = Mob
      L9_37 = L9_37.collectPawnIdsWithHatReqIdx
      L9_37 = L9_37(L9_37, A0_28, L8_36)
      if L9_37 then
        table.insert(L3_31, L9_37)
      end
    end
    L3_31 = L4_32
    L7_35 = L3_31
    L4_32(L5_33, L6_34, L7_35)
  end
end
function L4_4(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47
  L3_41 = {}
  for L7_45, L8_46 in L4_42(L5_43) do
    L9_47 = Mob
    L9_47 = L9_47.collectHatReqIdxInZone
    L9_47 = L9_47(L9_47, A0_38, L8_46, "placement")
    assert(L9_47)
    table.insert(L3_41, L9_47)
  end
  L3_41 = L4_42
  L7_45 = A2_40
  L4_42(L5_43, L6_44, L7_45)
end
function L5_5(A0_48, A1_49, A2_50)
  local L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57
  L3_51 = {}
  for L7_55, L8_56 in L4_52(L5_53) do
    L9_57 = Mob
    L9_57 = L9_57.collectHatReqIdxInVolume
    L9_57 = L9_57(L9_57, A0_48, L8_56, "placement")
    assert(L9_57)
    table.insert(L3_51, L9_57)
  end
  L3_51 = L4_52
  L7_55 = A2_50
  L4_52(L5_53, L6_54, L7_55)
end
function Mob.restrictNavForTutorialStart(A0_58, A1_59)
  local L2_60, L3_61
  L2_60 = "po_a_01"
  L3_61 = L0_0
  L3_61(L2_60, A1_59)
  L3_61 = Mob
  L3_61 = L3_61.findPartitionIdByName
  L3_61 = L3_61(L3_61, L2_60)
  Mob:navPicker_setUnwalkable(L3_61, "tutorial_start", "event_a", A1_59)
end
function Mob.restrictNavForTutorialEnd(A0_62, A1_63)
  local L2_64, L3_65
  L2_64 = "po_a_01"
  L3_65 = L0_0
  L3_65(L2_64, A1_63)
  L3_65 = Mob
  L3_65 = L3_65.findPartitionIdByName
  L3_65 = L3_65(L3_65, L2_64)
  Mob:navPicker_setUnwalkable(L3_65, "tutorial_end", "event_a", A1_63)
end
function Mob.restrict_ep13_00(A0_66, A1_67)
  local L2_68, L3_69
  L2_68 = "cc_a_root"
  L3_69 = L0_0
  L3_69(L2_68, A1_67)
  L3_69 = Mob
  L3_69 = L3_69.findPartitionIdByName
  L3_69 = L3_69(L3_69, L2_68)
  L5_5(L3_69, {
    "mob_volume_shop_ep13"
  }, A1_67)
end
function Mob.restrictPlc_ep14_00(A0_70, A1_71)
  local L2_72, L3_73
  L2_72 = "ed_a_root"
  L3_73 = L0_0
  L3_73(L2_72, A1_71)
  L3_73 = Mob
  L3_73 = L3_73.findPartitionIdByName
  L3_73 = L3_73(L3_73, L2_72)
  L5_5(L3_73, {
    "mob_volume_shop_ep14"
  }, A1_71)
end
function Mob.restrictFromEnteringBehindFerrisWheel(A0_74, A1_75)
  local L2_76, L3_77
  L2_76 = "ed_a_root"
  L3_77 = L0_0
  L3_77(L2_76, A1_75)
  L3_77 = Mob
  L3_77 = L3_77.findPartitionIdByName
  L3_77 = L3_77(L3_77, L2_76)
  L1_1(L3_77, {"space_08"}, A1_75)
end
function Mob.restrictOnNav__ed_a_root(A0_78, A1_79)
  local L2_80, L3_81, L4_82
  L2_80 = "ed_a_root"
  L3_81 = L0_0
  L4_82 = L2_80
  L3_81(L4_82, A1_79)
  L3_81 = Mob
  L4_82 = L3_81
  L3_81 = L3_81.findPartitionIdByName
  L3_81 = L3_81(L4_82, L2_80)
  L4_82 = Mob
  L4_82 = L4_82.getAabbOfZone
  L4_82 = L4_82(L4_82, L3_81, "space_01")
  Mob:navPicker_setUnwalkable(L3_81, L4_82, "event_a", A1_79)
end
function Mob.restrictZone_ep14_01(A0_83, A1_84)
  local L2_85, L3_86
  L2_85 = "ed_a_root"
  L3_86 = L0_0
  L3_86(L2_85, A1_84)
  L3_86 = Mob
  L3_86 = L3_86.findPartitionIdByName
  L3_86 = L3_86(L3_86, L2_85)
  L1_1(L3_86, {
    "school_zone_a"
  }, A1_84)
end
function Mob.restrictStops_ep14_02(A0_87, A1_88)
  local L2_89, L3_90
  L2_89 = "ed_a_root"
  L3_90 = L0_0
  L3_90(L2_89, A1_88)
  L3_90 = Mob
  L3_90 = L3_90.findPartitionIdByName
  L3_90 = L3_90(L3_90, L2_89)
  L2_2(L3_90, {
    "mob_volume_policestop01",
    "mob_volume_policestop02",
    "mob_volume_policestop03"
  }, A1_88)
end
function Mob.restrict_ep14_f_00(A0_91, A1_92)
  local L2_93
  L2_93 = "ed_a_root"
  L0_0(L2_93, A1_92)
  if A1_92 then
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_93),
      class = "man31"
    })
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrictNav_ep15_00(A0_94, A1_95)
  local L2_96, L3_97
  L2_96 = "dt_a_root"
  L3_97 = L0_0
  L3_97(L2_96, A1_95)
  L3_97 = Mob
  L3_97 = L3_97.findPartitionIdByName
  L3_97 = L3_97(L3_97, L2_96)
  Mob:navPicker_setUnwalkable(L3_97, "mob_volume_bridge01", "event_a", A1_95)
end
function Mob.restrict_ep17_00(A0_98, A1_99)
  local L2_100, L3_101
  L2_100 = "ed_a_root"
  L3_101 = L0_0
  L3_101(L2_100, A1_99)
  L3_101 = Mob
  L3_101 = L3_101.findPartitionIdByName
  L3_101 = L3_101(L3_101, L2_100)
  L2_2(L3_101, {
    "mob_volume_aki01",
    "mob_volume_aki02",
    "mob_volume_aki03"
  }, A1_99)
end
function Mob.restrict_ep18_00(A0_102, A1_103)
  local L2_104, L3_105
  L2_104 = "dt_a_root"
  L3_105 = L0_0
  L3_105(L2_104, A1_103)
  L3_105 = Mob
  L3_105 = L3_105.findPartitionIdByName
  L3_105 = L3_105(L3_105, L2_104)
  L1_1(L3_105, {
    "park_01",
    "park_02",
    "park_03",
    "park_side_lane_02",
    "park_side_lane_03",
    "park_side_lane_04",
    "park_side_lane_05"
  }, A1_103)
  L5_5(L3_105, {
    "mob_volume_ep18_01",
    "mob_volume_ep18_02",
    "mob_volume_ep18_03",
    "mob_volume_ep18_04",
    "mob_volume_ep18_05"
  }, A1_103)
end
function Mob.restrictFromEnteringSubway(A0_106, A1_107)
  local L2_108, L3_109
  L2_108 = "dt_a_root"
  L3_109 = L0_0
  L3_109(L2_108, A1_107)
  L3_109 = Mob
  L3_109 = L3_109.findPartitionIdByName
  L3_109 = L3_109(L3_109, L2_108)
  L1_1(L3_109, {
    "subway_station_a_area"
  }, A1_107)
end
function Mob.restrict_sm02_b_00(A0_110, A1_111)
  local L2_112
  L2_112 = "bu_a_02"
  L0_0(L2_112, A1_111)
  if A1_111 then
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_112),
      division = "duck"
    })
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrict_sm03_00(A0_113, A1_114)
  local L2_115, L3_116
  L2_115 = "po_a_01"
  L3_116 = L0_0
  L3_116(L2_115, A1_114)
  L3_116 = Mob
  L3_116 = L3_116.findPartitionIdByName
  L3_116 = L3_116(L3_116, L2_115)
  L5_5(L3_116, {
    "mob_volume_shop_sm03"
  }, A1_114)
  Mob:navPicker_setUnwalkable(L3_116, "mob_volume_shop_floor", "event_a", A1_114)
end
function Mob.restrict_sm06_00(A0_117, A1_118)
  local L2_119, L3_120
  L2_119 = "po_a_02"
  L3_120 = L0_0
  L3_120(L2_119, A1_118)
  L3_120 = Mob
  L3_120 = L3_120.findPartitionIdByName
  L3_120 = L3_120(L3_120, L2_119)
  L5_5(L3_120, {
    "mob_volume_shop_sm06"
  }, A1_118)
end
function Mob.restrictNavFor_sm06(A0_121, A1_122)
  local L2_123, L3_124, L4_125
  L2_123 = "po_a_02"
  L3_124 = L0_0
  L4_125 = L2_123
  L3_124(L4_125, A1_122)
  L3_124 = Mob
  L4_125 = L3_124
  L3_124 = L3_124.findPartitionIdByName
  L3_124 = L3_124(L4_125, L2_123)
  L4_125 = Mob
  L4_125 = L4_125.getAabbOfZone
  L4_125 = L4_125(L4_125, L3_124, "circuit_c")
  Mob:navPicker_setUnwalkable(L3_124, L4_125, "event_a", A1_122)
end
function Mob.restrictNavFor_sm10(A0_126, A1_127)
  local L2_128, L3_129, L4_130
  L2_128 = "po_a_01"
  L3_129 = L0_0
  L4_130 = L2_128
  L3_129(L4_130, A1_127)
  L3_129 = Mob
  L4_130 = L3_129
  L3_129 = L3_129.findPartitionIdByName
  L3_129 = L3_129(L4_130, L2_128)
  L4_130 = Mob
  L4_130 = L4_130.getAabbOfZone
  L4_130 = L4_130(L4_130, L3_129, "lord_03")
  Mob:navPicker_setUnwalkable(L3_129, L4_130, "event_a", A1_127)
end
function Mob.restrict_sm11_00(A0_131, A1_132)
  local L2_133
  L2_133 = nil
  L0_0(L2_133, A1_132)
  if A1_132 then
    Mob:applyScreeningRule({class = "man39", stdAppOnly = true})
    Mob:applyScreeningRule({class = "wom26", stdAppOnly = true})
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrict_sm15_c_00(A0_134, A1_135)
  local L2_136
  L2_136 = nil
  L0_0(L2_136, A1_135)
  if A1_135 then
    Mob:applyScreeningRule({
      initRole = "kRoleBalloonMan"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleStandWithBalloon"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleJuggle"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleBrushFloor"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleStandWithFlower"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleEatSomething"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleDrinkSomething"
    })
    Mob:applyScreeningRule({
      initRole = "kRoleCarryCargo"
    })
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrict_sm16_00(A0_137, A1_138)
  local L2_139
  L2_139 = nil
  L0_0(L2_139, A1_138)
  if A1_138 then
    Mob:applyScreeningRule({class = "chi15"})
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrict_sm20_00(A0_140, A1_141)
  local L2_142
  L2_142 = nil
  L0_0(L2_142, A1_141)
  if A1_141 then
    Mob:applyScreeningRule({class = "chi16"})
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrictFromEnteringForDaruma(A0_143, A1_144)
  local L2_145, L3_146
  L2_145 = "up_a_00"
  L3_146 = L0_0
  L3_146(L2_145, A1_144)
  L3_146 = Mob
  L3_146 = L3_146.findPartitionIdByName
  L3_146 = L3_146(L3_146, L2_145)
  L2_2(L3_146, {
    "volume_daruma"
  }, A1_144)
end
function Mob.restrict_sm24_00(A0_147, A1_148)
  local L2_149
  L2_149 = nil
  L0_0(L2_149, A1_148)
  if A1_148 then
    Mob:applyScreeningRule({class = "man81"})
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrict_sm26_00(A0_150, A1_151)
  local L2_152, L3_153
  L2_152 = "dt_a_root"
  L3_153 = L0_0
  L3_153(L2_152, A1_151)
  L3_153 = Mob
  L3_153 = L3_153.findPartitionIdByName
  L3_153 = L3_153(L3_153, L2_152)
  L5_5(L3_153, {
    "mob_volume_shop_sm26a_etc",
    "mob_volume_shop_sm26b_etc",
    "mob_volume_shop_sm26c_etc"
  }, A1_151)
end
function Mob.restrictNav_sm26_00(A0_154, A1_155)
  local L2_156, L3_157, L4_158
  L2_156 = "dt_a_root"
  L3_157 = L0_0
  L4_158 = L2_156
  L3_157(L4_158, A1_155)
  L3_157 = Mob
  L4_158 = L3_157
  L3_157 = L3_157.findPartitionIdByName
  L3_157 = L3_157(L4_158, L2_156)
  L4_158 = Mob
  L4_158 = L4_158.getAabbOfZone
  L4_158 = L4_158(L4_158, L3_157, "group_b")
  Mob:navPicker_setUnwalkable(L3_157, L4_158, "event_a", A1_155)
end
function Mob.restrict_sm31_00(A0_159, A1_160)
  local L2_161, L3_162
  L2_161 = "dt_a_root"
  L3_162 = L0_0
  L3_162(L2_161, A1_160)
  L3_162 = Mob
  L3_162 = L3_162.findPartitionIdByName
  L3_162 = L3_162(L3_162, L2_161)
  L5_5(L3_162, {
    "mob_volume_shop_sm26a_etc",
    "mob_volume_shop_sm31"
  }, A1_160)
end
function Mob.restrictStops_sm32_00(A0_163, A1_164)
  local L2_165, L3_166
  L2_165 = "dt_a_root"
  L3_166 = L0_0
  L3_166(L2_165, A1_164)
  L3_166 = Mob
  L3_166 = L3_166.findPartitionIdByName
  L3_166 = L3_166(L3_166, L2_165)
  L2_2(L3_166, {
    "mob_volume_bomb01"
  }, A1_164)
end
function Mob.restrictFromEnteringSchool(A0_167, A1_168)
  local L2_169, L3_170, L4_171
  L2_169 = "ed_a_root"
  L3_170 = L0_0
  L4_171 = L2_169
  L3_170(L4_171, A1_168)
  L3_170 = Mob
  L4_171 = L3_170
  L3_170 = L3_170.findPartitionIdByName
  L3_170 = L3_170(L4_171, L2_169)
  L4_171 = L1_1
  L4_171(L3_170, {
    "school_zone_a"
  }, A1_168)
  L4_171 = L4_4
  L4_171(L3_170, {
    "school_zone_a"
  }, A1_168)
  L4_171 = L5_5
  L4_171(L3_170, {
    "mob_volume_bench_sm33_f1",
    "mob_volume_bench_sm33_c1a",
    "mob_volume_bench_sm33_c1b",
    "mob_volume_bench_sm33_a1a",
    "mob_volume_bench_sm33_a1b",
    "mob_volume_bench_sm33_d1"
  }, A1_168)
  if A1_168 then
    L4_171 = Mob
    L4_171 = L4_171.collectPawnIdsByVolume
    L4_171 = L4_171(L4_171, L3_170, "mob_volume_sm33_school", {
      division = {"human", "grigo"}
    })
    Mob:killPawns(L3_170, L4_171)
  end
end
function Mob.restrict_sm34_00(A0_172, A1_173)
  local L2_174, L3_175
  L2_174 = "dt_a_root"
  L3_175 = L0_0
  L3_175(L2_174, A1_173)
  L3_175 = Mob
  L3_175 = L3_175.findPartitionIdByName
  L3_175 = L3_175(L3_175, L2_174)
  L5_5(L3_175, {
    "mob_volume_shop_sm26a_etc",
    "mob_volume_shop_sm26b_etc",
    "mob_volume_shop_sm26c_etc"
  }, A1_173)
end
function Mob.restrictNav_sm34_00(A0_176, A1_177)
  local L2_178, L3_179
  L2_178 = "dt_a_root"
  L3_179 = L0_0
  L3_179(L2_178, A1_177)
  L3_179 = Mob
  L3_179 = L3_179.findPartitionIdByName
  L3_179 = L3_179(L3_179, L2_178)
  Mob:navPicker_setUnwalkable(L3_179, "mob_volume_shop01", "event_a", A1_177)
end
function Mob.restrict_sm35_00(A0_180, A1_181)
  local L2_182, L3_183
  L2_182 = "ed_a_root"
  L3_183 = L0_0
  L3_183(L2_182, A1_181)
  L3_183 = Mob
  L3_183 = L3_183.findPartitionIdByName
  L3_183 = L3_183(L3_183, L2_182)
  if A1_181 then
    Mob:applyScreeningRule({
      partition = L3_183,
      class = "wom47",
      somebodyId = 2
    })
    Mob:applyScreeningRule({partition = L3_183, pawnIdModulo = 2})
  else
    Mob:clearScreeningRule()
  end
  L5_5(L3_183, {
    "mob_volume_shop_sm35"
  }, A1_181)
end
function Mob.restrict_sm36_00(A0_184, A1_185)
  local L2_186, L3_187
  L2_186 = "dt_a_root"
  L3_187 = L0_0
  L3_187(L2_186, A1_185)
  L3_187 = Mob
  L3_187 = L3_187.findPartitionIdByName
  L3_187 = L3_187(L3_187, L2_186)
  if A1_185 then
    Mob:applyScreeningRule({class = "man02", stdAppOnly = true})
    Mob:applyScreeningRule({class = "man26", stdAppOnly = true})
  else
    Mob:clearScreeningRule()
  end
  L5_5(L3_187, {
    "mob_volume_shop_sm36"
  }, A1_185)
end
function Mob.restrict_sm38_00(A0_188, A1_189)
  local L2_190, L3_191
  L2_190 = "cc_a_root"
  L3_191 = L0_0
  L3_191(L2_190, A1_189)
  L3_191 = Mob
  L3_191 = L3_191.findPartitionIdByName
  L3_191 = L3_191(L3_191, L2_190)
  L5_5(L3_191, {
    "mob_volume_shop_sm38"
  }, A1_189)
end
function Mob.restrict_sm40_00(A0_192, A1_193)
  local L2_194, L3_195
  L2_194 = "dt_a_root"
  L3_195 = L0_0
  L3_195(L2_194, A1_193)
  L3_195 = Mob
  L3_195 = L3_195.findPartitionIdByName
  L3_195 = L3_195(L3_195, L2_194)
  L5_5(L3_195, {
    "mob_volume_shop_sm40"
  }, A1_193)
end
function Mob.restrict_sm44_00(A0_196, A1_197)
  local L2_198
  L2_198 = "ed_a_root"
  L0_0(L2_198, A1_197)
  if A1_197 then
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_198),
      class = "man70"
    })
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_198),
      class = "man71"
    })
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_198),
      class = "wom38"
    })
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_198),
      class = "wom39"
    })
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_198),
      class = "wom40"
    })
    Mob:applyScreeningRule({
      partition = Mob:findPartitionIdByName(L2_198),
      initRole = "kRoleRoamDrunk"
    })
  else
    Mob:clearScreeningRule()
  end
end
function Mob.restrict_sm45_00(A0_199, A1_200)
  local L2_201, L3_202
  L2_201 = "dt_a_root"
  L3_202 = L0_0
  L3_202(L2_201, A1_200)
  L3_202 = Mob
  L3_202 = L3_202.findPartitionIdByName
  L3_202 = L3_202(L3_202, L2_201)
  L5_5(L3_202, {
    "mob_volume_shop_sm45a_etc",
    "mob_volume_shop_sm45b_etc",
    "mob_volume_shop_sm45c",
    "mob_volume_shop_sm45d"
  }, A1_200)
  if A1_200 then
    Mob:applyScreeningRule({
      initRole = "kRoleRelaxOnGround"
    })
  else
    Mob:clearScreeningRule()
  end
  L1_1(L3_202, {"group_m"}, A1_200)
end
function Mob.restrictNav_sm45_00(A0_203, A1_204)
  local L2_205, L3_206
  L2_205 = "dt_a_root"
  L3_206 = L0_0
  L3_206(L2_205, A1_204)
  L3_206 = Mob
  L3_206 = L3_206.findPartitionIdByName
  L3_206 = L3_206(L3_206, L2_205)
  Mob:navPicker_setUnwalkable(L3_206, "mob_volume_sm45_dresschange", "event_a", A1_204)
end
function Mob.restrict_cm12_00(A0_207, A1_208)
  local L2_209, L3_210
  L2_209 = "dt_a_root"
  L3_210 = L0_0
  L3_210(L2_209, A1_208)
  L3_210 = Mob
  L3_210 = L3_210.findPartitionIdByName
  L3_210 = L3_210(L3_210, L2_209)
  L5_5(L3_210, {
    "mob_volume_shop_sm26a_etc",
    "mob_volume_shop_sm26b_etc",
    "mob_volume_shop_sm26c_etc"
  }, A1_208)
end
function Mob.restrict_cm13_00(A0_211, A1_212)
  local L2_213, L3_214
  L2_213 = "ed_a_root"
  L3_214 = L0_0
  L3_214(L2_213, A1_212)
  L3_214 = Mob
  L3_214 = L3_214.findPartitionIdByName
  L3_214 = L3_214(L3_214, L2_213)
  L5_5(L3_214, {
    "mob_volume_shop_cm13"
  }, A1_212)
end
function Mob.restrict_cm14_00(A0_215, A1_216)
  local L2_217, L3_218
  L2_217 = "dt_a_root"
  L3_218 = L0_0
  L3_218(L2_217, A1_216)
  L3_218 = Mob
  L3_218 = L3_218.findPartitionIdByName
  L3_218 = L3_218(L3_218, L2_217)
  L5_5(L3_218, {
    "mob_volume_shop_sm26a_etc",
    "mob_volume_shop_sm26b_etc",
    "mob_volume_shop_sm26c_etc"
  }, A1_216)
end
function Mob.restrict_cm15_00(A0_219, A1_220)
  local L2_221, L3_222
  L2_221 = "ed_a_root"
  L3_222 = L0_0
  L3_222(L2_221, A1_220)
  L3_222 = Mob
  L3_222 = L3_222.findPartitionIdByName
  L3_222 = L3_222(L3_222, L2_221)
  Mob:navPicker_setUnwalkable(L3_222, "mob_volume_shoped01", "event_a", A1_220)
  L5_5(L3_222, {
    "mob_volume_shop_cm15"
  }, A1_220)
end
function Mob.restrict_cm16_00(A0_223, A1_224)
  local L2_225, L3_226
  L2_225 = "ed_a_root"
  L3_226 = L0_0
  L3_226(L2_225, A1_224)
  L3_226 = Mob
  L3_226 = L3_226.findPartitionIdByName
  L3_226 = L3_226(L3_226, L2_225)
  if A1_224 then
    Mob:applyScreeningRule({partition = L3_226, pawnIdModulo = 2})
  else
    Mob:clearScreeningRule()
  end
  L5_5(L3_226, {
    "mob_volume_shop_cm16"
  }, A1_224)
end
function Mob.restrict_cm17_00(A0_227, A1_228)
  local L2_229, L3_230
  L2_229 = "dt_a_root"
  L3_230 = L0_0
  L3_230(L2_229, A1_228)
  L3_230 = Mob
  L3_230 = L3_230.findPartitionIdByName
  L3_230 = L3_230(L3_230, L2_229)
  L5_5(L3_230, {
    "mob_volume_shop_sm45a_etc",
    "mob_volume_shop_sm45b_etc"
  }, A1_228)
  if A1_228 then
    Mob:applyScreeningRule({
      initRole = "kRoleRelaxOnGround"
    })
  else
    Mob:clearScreeningRule()
  end
end
