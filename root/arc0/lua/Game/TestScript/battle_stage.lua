import("math")
import("Yaml")
import("Player")
import("Debug")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Supporter/supporter_spawn.lua")
__enemy_gen = {}
__san_point = {}
__ta = {}
__at = {}
__pl = {}
__record_disp_flag = true
__player_dead_num = {}
__sensor_onenter = {
  false,
  false,
  false,
  false
}
__stage_disp = {
  true,
  true,
  true,
  true,
  false
}
SanPointClass = {}
function SanPointClass.new(A0_0, A1_1)
  local L2_2, L3_3
  L2_2 = {}
  L2_2.max = A0_0
  L3_3 = L2_2.max
  L2_2.point = L3_3
  L2_2.add = A1_1
  function L3_3()
    L2_2.point = L2_2.point + L2_2.add
  end
  L2_2.step = L3_3
  function L3_3(A0_4)
    local L1_5
    L1_5 = L2_2.point
    L1_5 = L1_5 + A0_4
    L2_2.point = L1_5
    L1_5 = L2_2.point
    if L1_5 > L2_2.max then
      L1_5 = L2_2.max
      L2_2.point = L1_5
    end
  end
  L2_2.set_point = L3_3
  function L3_3()
    local L0_6, L1_7
    L0_6 = L2_2.point
    return L0_6
  end
  L2_2.get_point = L3_3
  function L3_3(A0_8)
    local L1_9
    L2_2.add = A0_8
  end
  L2_2.set_addpoint = L3_3
  function L3_3()
    local L0_10, L1_11
    L0_10 = L2_2.add
    return L0_10
  end
  L2_2.get_addpoint = L3_3
  return L2_2
end
TimeAttackClass = {}
function TimeAttackClass.new()
  local L0_12, L1_13
  L0_12 = {}
  L0_12.oldtime = 0
  L1_13 = L0_12.oldtime
  L0_12.nowtime = L1_13
  L1_13 = {}
  L0_12.recordtime = L1_13
  L0_12.index = 0
  function L1_13()
    local L0_14, L1_15, L2_16
    L0_14 = L0_12.index
    L0_14 = L0_14 + 1
    L0_12.index = L0_14
    L0_14 = L0_12.recordtime
    L1_15 = L0_12.recordtime
    L1_15 = #L1_15
    L1_15 = L1_15 + 1
    L2_16 = L0_12.nowtime
    L2_16 = L2_16 - L0_12.oldtime
    L0_14[L1_15] = L2_16
    L0_14 = L0_12.nowtime
    L0_12.oldtime = L0_14
  end
  L0_12.record = L1_13
  function L1_13(A0_17)
    local L1_18
    L0_12.nowtime = A0_17
  end
  L0_12.setnowtime = L1_13
  function L1_13()
    local L1_19
    L1_19 = L0_12.recordtime
    L1_19 = #L1_19
    return L1_19
  end
  L0_12.getrecordmax = L1_13
  function L1_13(A0_20)
    return L0_12.recordtime[A0_20]
  end
  L0_12.getrecord = L1_13
  function L1_13()
    local L0_21, L1_22
    L0_21 = L0_12.recordtime
    return L0_21
  end
  L0_12.getrecordtable = L1_13
  return L0_12
end
AttTimeClass = {}
function AttTimeClass.new()
  local L0_23, L1_24
  L0_23 = {}
  L0_23.normaltime = 0
  L0_23.marstime = 0
  L0_23.jupitertime = 0
  L0_23.startflag = false
  function L1_24()
    local L0_25
    L0_25 = L0_23.startflag
    if L0_25 == true then
      return
    end
    L0_23.startflag = true
    L0_25 = nil
    while L0_23.startflag do
      L0_25 = Player:getAttrTune()
      if L0_25 == Player.kAttrTune_Normal then
        L0_23.normaltime = L0_23.normaltime + 1
      elseif L0_25 == Player.kAttrTune_Mars then
        L0_23.marstime = L0_23.marstime + 1
      elseif L0_25 == Player.kAttrTune_Jupiter then
        L0_23.jupitertime = L0_23.jupitertime + 1
      end
      wait()
    end
    return
  end
  L0_23.start = L1_24
  function L1_24()
    local L0_26, L1_27
    L0_23.startflag = false
  end
  L0_23.stop = L1_24
  function L1_24(A0_28)
    local L1_29
    L0_23.normaltime = A0_28
  end
  L0_23.setnormaltime = L1_24
  function L1_24()
    local L0_30, L1_31
    L0_30 = L0_23.normaltime
    return L0_30
  end
  L0_23.getnormaltime = L1_24
  function L1_24(A0_32)
    local L1_33
    L0_23.marstime = A0_32
  end
  L0_23.setmarstime = L1_24
  function L1_24()
    local L0_34, L1_35
    L0_34 = L0_23.marstime
    return L0_34
  end
  L0_23.getmarstime = L1_24
  function L1_24(A0_36)
    local L1_37
    L0_23.jupitertime = A0_36
  end
  L0_23.setjupitertime = L1_24
  function L1_24()
    local L0_38, L1_39
    L0_38 = L0_23.jupitertime
    return L0_38
  end
  L0_23.getjupitertime = L1_24
  return L0_23
end
PlayerLifeClass = {}
function PlayerLifeClass.new()
  local L0_40
  L0_40 = {}
  L0_40.lifemax = Player:getEnergyMax(Player.kEnergy_Life)
  function L0_40.setlife(A0_41)
    if A0_41 > L0_40.lifemax then
      Player:setEnergy(Player.kEnergy_Life, L0_40.lifemax)
    else
      Player:setEnergy(Player.kEnergy_Life, A0_41)
    end
  end
  function L0_40.getlife()
    return Player:getEnergy(Player.kEnergy_Life)
  end
  function L0_40.getlifemax()
    local L0_42, L1_43
    L0_42 = L0_40.lifemax
    return L0_42
  end
  function L0_40.regenelife(A0_44, A1_45)
    local L2_46
    L2_46 = 0
    while true do
      if A0_44 < L2_46 + A1_45 then
        L0_40.setlife(L0_40.getlife() + (A0_44 - L2_46))
        break
      else
        L0_40.setlife(L0_40.getlife() + A1_45)
      end
      L2_46 = L2_46 + A1_45
      wait()
    end
  end
  return L0_40
end
enmgen2_area_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01_01",
      name = "area_01_hander01"
    },
    {
      type = "stalker",
      locator = "locator_01_02",
      name = "area_01_hander02"
    },
    {
      type = "stalker",
      locator = "locator_01_03",
      name = "area_01_hander03"
    },
    {
      type = "stalker",
      locator = "locator_01_04",
      name = "area_01_hander04"
    },
    {
      type = "stalker",
      locator = "locator_01_05",
      name = "area_01_hander05"
    },
    {
      type = "stalker",
      locator = "locator_01_06",
      name = "area_01_hander06"
    }
  },
  onUpdate = function(A0_47)
    local L1_48
  end,
  onEnter = function(A0_49)
    local L1_50
  end,
  onLeave = function(A0_51)
    local L1_52
  end,
  onObjectDead = function(A0_53, A1_54)
  end,
  onObjectAsh = function(A0_55, A1_56)
    local L3_57
    L3_57 = enmgen2_area_01
    L3_57.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_58, L1_59
    L0_58 = enmgen2_area_01
    L0_58 = L0_58.spawnSet
    L0_58 = #L0_58
    return L0_58
  end,
  getEnemyDeadNum = function()
    local L1_60
    L1_60 = enmgen2_area_01
    L1_60 = L1_60.enemyDeadNum
    return L1_60
  end,
  getEnemyName = function(A0_61)
    local L1_62
    L1_62 = enmgen2_area_01
    L1_62 = L1_62.spawnSet
    L1_62 = L1_62[A0_61]
    L1_62 = L1_62.name
    return L1_62
  end
}
enmgen2_area_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_02_01",
      name = "area_02_gellyfish01"
    },
    {
      type = "gellyfish",
      locator = "locator_02_02",
      name = "area_02_gellyfish02"
    },
    {
      type = "gellyfish",
      locator = "locator_02_03",
      name = "area_02_gellyfish03"
    },
    {
      type = "gellyfish",
      locator = "locator_02_04",
      name = "area_02_gellyfish04"
    },
    {
      type = "gellyfish",
      locator = "locator_02_05",
      name = "area_02_gellyfish05"
    },
    {
      type = "gellyfish",
      locator = "locator_02_06",
      name = "area_02_gellyfish06"
    },
    {
      type = "stalker",
      locator = "locator_02_07",
      name = "area_02_hander01"
    },
    {
      type = "guardcore",
      locator = "locator_02_08",
      name = "area_02_guardcore02"
    },
    {
      type = "stalker",
      locator = "locator_02_09",
      name = "area_02_hander03"
    }
  },
  onUpdate = function(A0_63)
    local L1_64
  end,
  onEnter = function(A0_65)
    local L1_66
  end,
  onLeave = function(A0_67)
    local L1_68
  end,
  onObjectDead = function(A0_69, A1_70)
  end,
  onObjectAsh = function(A0_71, A1_72)
    local L3_73
    L3_73 = enmgen2_area_02
    L3_73.enemyDeadNum = enmgen2_area_02.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_74, L1_75
    L0_74 = enmgen2_area_02
    L0_74 = L0_74.spawnSet
    L0_74 = #L0_74
    return L0_74
  end,
  getEnemyDeadNum = function()
    local L1_76
    L1_76 = enmgen2_area_02
    L1_76 = L1_76.enemyDeadNum
    return L1_76
  end,
  getEnemyName = function(A0_77)
    local L1_78
    L1_78 = enmgen2_area_02
    L1_78 = L1_78.spawnSet
    L1_78 = L1_78[A0_77]
    L1_78 = L1_78.name
    return L1_78
  end
}
enmgen2_area_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_03_01",
      name = "area_03_hander01"
    },
    {
      type = "mosquito",
      locator = "locator_03_02",
      name = "area_03_mosquito01"
    },
    {
      type = "giant",
      locator = "locator_03_03",
      name = "area_03_giant01"
    },
    {
      type = "mosquito",
      locator = "locator_03_04",
      name = "area_03_mosquito02"
    },
    {
      type = "mosquito",
      locator = "locator_03_05",
      name = "area_03_mosquito03"
    },
    {
      type = "stalker",
      locator = "locator_03_06",
      name = "area_03_hander02"
    }
  },
  onUpdate = function(A0_79)
    local L1_80
  end,
  onEnter = function(A0_81)
    local L1_82
  end,
  onLeave = function(A0_83)
    local L1_84
  end,
  onObjectDead = function(A0_85, A1_86)
  end,
  onObjectAsh = function(A0_87, A1_88)
    local L3_89
    L3_89 = enmgen2_area_03
    L3_89.enemyDeadNum = enmgen2_area_03.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_90, L1_91
    L0_90 = enmgen2_area_03
    L0_90 = L0_90.spawnSet
    L0_90 = #L0_90
    return L0_90
  end,
  getEnemyDeadNum = function()
    local L1_92
    L1_92 = enmgen2_area_03
    L1_92 = L1_92.enemyDeadNum
    return L1_92
  end,
  getEnemyName = function(A0_93)
    local L1_94
    L1_94 = enmgen2_area_03
    L1_94 = L1_94.spawnSet
    L1_94 = L1_94[A0_93]
    L1_94 = L1_94.name
    return L1_94
  end
}
enmgen2_area_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_04_06",
      name = "area_04_gellyfish01"
    },
    {
      type = "gellyfish",
      locator = "locator_04_07",
      name = "area_04_gellyfish02"
    },
    {
      type = "gellyfish",
      locator = "locator_04_08",
      name = "area_04_gellyfish03"
    },
    {
      type = "gellyfish",
      locator = "locator_04_09",
      name = "area_04_gellyfish04"
    },
    {
      type = "gellyfish",
      locator = "locator_04_010",
      name = "area_04_gellyfish05"
    },
    {
      type = "gellyfish",
      locator = "locator_04_011",
      name = "area_04_gellyfish06"
    },
    {
      type = "gellyfish",
      locator = "locator_04_012",
      name = "area_04_gellyfish07"
    },
    {
      type = "gellyfish",
      locator = "locator_04_013",
      name = "area_04_gellyfish08"
    },
    {
      type = "gellyfish",
      locator = "locator_04_014",
      name = "area_04_gellyfish09"
    },
    {
      type = "gellyfish",
      locator = "locator_04_015",
      name = "area_04_gellyfish10"
    },
    {
      type = "gellyfish",
      locator = "locator_04_016",
      name = "area_04_gellyfish11"
    },
    {
      type = "gellyfish",
      locator = "locator_04_017",
      name = "area_04_gellyfish12"
    },
    {
      type = "gellyfish",
      locator = "locator_04_018",
      name = "area_04_gellyfish13"
    },
    {
      type = "gellyfish",
      locator = "locator_04_019",
      name = "area_04_gellyfish14"
    }
  },
  onUpdate = function(A0_95)
    local L1_96
  end,
  onEnter = function(A0_97)
    local L1_98
  end,
  onLeave = function(A0_99)
    local L1_100
  end,
  onObjectDead = function(A0_101, A1_102)
  end,
  onObjectAsh = function(A0_103, A1_104)
    local L3_105
    L3_105 = enmgen2_area_04
    L3_105.enemyDeadNum = enmgen2_area_04.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_106, L1_107
    L0_106 = enmgen2_area_04
    L0_106 = L0_106.spawnSet
    L0_106 = #L0_106
    return L0_106
  end,
  getEnemyDeadNum = function()
    local L1_108
    L1_108 = enmgen2_area_04
    L1_108 = L1_108.enemyDeadNum
    return L1_108
  end,
  getEnemyName = function(A0_109)
    local L1_110
    L1_110 = enmgen2_area_04
    L1_110 = L1_110.spawnSet
    L1_110 = L1_110[A0_109]
    L1_110 = L1_110.name
    return L1_110
  end
}
enmgen2_area_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_05_01",
      name = "area_05_runner01"
    },
    {
      type = "runner",
      locator = "locator_05_02",
      name = "area_05_runner02"
    },
    {
      type = "treecannon",
      locator = "locator_05_03",
      name = "area_05_treecannon"
    },
    {
      type = "runner",
      locator = "locator_05_04",
      name = "area_05_runner04"
    },
    {
      type = "runner",
      locator = "locator_05_05",
      name = "area_05_runner05"
    }
  },
  onUpdate = function(A0_111)
    local L1_112
  end,
  onEnter = function(A0_113)
    local L1_114
  end,
  onLeave = function(A0_115)
    local L1_116
  end,
  onObjectDead = function(A0_117, A1_118)
  end,
  onObjectAsh = function(A0_119, A1_120)
    local L3_121
    L3_121 = enmgen2_area_05
    L3_121.enemyDeadNum = enmgen2_area_05.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_122, L1_123
    L0_122 = enmgen2_area_05
    L0_122 = L0_122.spawnSet
    L0_122 = #L0_122
    return L0_122
  end,
  getEnemyDeadNum = function()
    local L1_124
    L1_124 = enmgen2_area_05
    L1_124 = L1_124.enemyDeadNum
    return L1_124
  end,
  getEnemyName = function(A0_125)
    local L1_126
    L1_126 = enmgen2_area_05
    L1_126 = L1_126.spawnSet
    L1_126 = L1_126[A0_125]
    L1_126 = L1_126.name
    return L1_126
  end
}
function Initialize()
  local L0_127, L1_128, L2_129, L3_130, L4_131, L5_132, L6_133, L7_134, L8_135
  L0_127, L1_128 = nil, nil
  L2_129 = Fn_getPlayer
  L2_129 = L2_129()
  L3_130 = nil
  L4_131 = {
    L5_132,
    L6_133,
    L7_134,
    L8_135,
    "spawner2_wom01_02",
    "spawner2_wom01_03",
    "spawner2_chi01_01",
    "spawner2_chi01_02",
    "spawner2_chi01_03"
  }
  L8_135 = "spawner2_wom01_01"
  __san_point = L5_132
  __ta = L5_132
  __at = L5_132
  __pl = L5_132
  for L8_135 = 1, 4 do
    Fn_pcSensorOff("pccubesensor2_navi_0" .. L8_135)
    Fn_pcSensorOff("pccubesensor2_subnavi_0" .. L8_135)
  end
  L5_132(L6_133)
  for L8_135 = 1, #L4_131 do
    L3_130 = findGameObject2("Puppet", L4_131[L8_135])
    if L3_130 ~= nil then
      L3_130:setIgnoreGrab(true)
    end
  end
  L8_135 = Player
  L8_135 = L8_135.getEnergyMax
  L8_135 = L8_135(L8_135, Player.kEnergy_Life)
  L5_132(L6_133, L7_134, L8_135, L8_135(L8_135, Player.kEnergy_Life))
  L8_135 = Player
  L8_135 = L8_135.getEnergyMax
  L8_135 = L8_135(L8_135, Player.kEnergy_Gravity)
  L5_132(L6_133, L7_134, L8_135, L8_135(L8_135, Player.kEnergy_Gravity))
  L8_135 = 0
  L5_132(L6_133, L7_134, L8_135)
end
function Ingame()
  local L0_136, L1_137, L2_138, L3_139, L4_140, L5_141, L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149
  L0_136, L1_137, L2_138, L3_139 = nil, nil, nil, nil
  L4_140 = {}
  L8_144 = "woodbox_kk_01"
  L13_149 = "barrel_kk_01"
  L4_140[1] = L5_141
  L8_144 = "woodbox_kk_01"
  L4_140[2] = L5_141
  L8_144 = "woodbox_kk_01"
  L4_140[3] = L5_141
  for L8_144 = 1, 9 do
    for L12_148 = 0, 5 do
      L13_149 = create_boxset
      L13_149("po_a_01", "locator2_box_0" .. L8_144, L4_140[1][L8_144])
    end
  end
  for L8_144 = 10, 13 do
    for L12_148 = 0, 5 do
      L13_149 = create_boxset
      L13_149("po_a_02", "locator2_box_0" .. L8_144, L4_140[2][L8_144 - 9])
    end
  end
  for L8_144 = 14, 20 do
    for L12_148 = 0, 20 do
      L13_149 = create_boxset
      L13_149("po_a_04", "locator2_box_0" .. L8_144, L4_140[3][L8_144 - 13])
    end
  end
  L5_141()
  if L5_141 == true then
    L8_144 = true
    L5_141(L6_142, L7_143, L8_144)
    L8_144 = 34.9472
    L8_144 = 0
    L13_149 = L7_143(L8_144, L9_145, L10_146, L11_147)
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L7_143(L8_144, L9_145, L10_146, L11_147))
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147)
  end
  L5_141(L6_142)
  L5_141(L6_142, L7_143)
  L5_141(L6_142)
  L5_141(L6_142)
  if L5_141 == false then
    L8_144 = "locator2_navi_01"
    L13_149 = L6_142(L7_143, L8_144)
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L6_142(L7_143, L8_144))
  end
  L5_141(L6_142)
  L5_141(L6_142)
  L5_141(L6_142)
  if L5_141 == true then
    L5_141.stage1 = 0
    L5_141(L6_142)
    L0_136 = L5_141
    L5_141(L6_142)
    L3_139 = 0
    while true do
      if L5_141 < L6_142 then
        L8_144 = 1000
        L5_141(L6_142, L7_143, L8_144, L9_145)
        if L5_141 <= 0 then
          if L5_141 == true then
            L5_141.stage1 = L6_142
            countflag = false
          end
        elseif L5_141 > 0 then
          countflag = true
        end
        L5_141()
      end
    end
    L5_141(L6_142)
    L5_141()
    L5_141()
  else
    L5_141.stage1 = 0
  end
  if L5_141 == true then
    L5_141(L6_142)
    L5_141(L6_142)
    L8_144 = "locator2_navi_02"
    L13_149 = L6_142(L7_143, L8_144)
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L6_142(L7_143, L8_144))
    L0_136 = L5_141
    L5_141(L6_142)
    L5_141.stage2 = 0
    L3_139 = 0
    while true do
      if L5_141 < L6_142 then
        L8_144 = 1000
        L5_141(L6_142, L7_143, L8_144, L9_145)
        if L5_141 <= 0 then
          if L5_141 == true then
            L5_141.stage2 = L6_142
            countflag = false
          end
        elseif L5_141 > 0 then
          countflag = true
        end
        L5_141()
      end
    end
    L5_141(L6_142)
    L5_141()
    L5_141()
  else
    L5_141.stage2 = 0
  end
  if L5_141 == true then
    L5_141(L6_142)
    L5_141(L6_142)
    L8_144 = "locator2_navi_03"
    L13_149 = L6_142(L7_143, L8_144)
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L6_142(L7_143, L8_144))
    L0_136 = L5_141
    L5_141(L6_142)
    L5_141.stage3 = 0
    L3_139 = 0
    while true do
      if L5_141 < L6_142 then
        L8_144 = 1000
        L5_141(L6_142, L7_143, L8_144, L9_145)
        if L5_141 <= 0 then
          if L5_141 == true then
            L5_141.stage3 = L6_142
            countflag = false
          end
        elseif L5_141 > 0 then
          countflag = true
        end
        L5_141()
      end
    end
    L5_141(L6_142)
    L5_141()
    L5_141()
  else
    L5_141.stage3 = 0
  end
  if L5_141 == true then
    L5_141(L6_142)
    L5_141(L6_142)
    L8_144 = "locator2_navi_04"
    L13_149 = L6_142(L7_143, L8_144)
    L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L6_142(L7_143, L8_144))
    L0_136 = L5_141
    L5_141(L6_142)
    L0_136 = L5_141
    L5_141(L6_142)
    L5_141.stage4 = 0
    L3_139 = 0
    while true do
      if L5_141 < L6_142 then
        L8_144 = 1000
        L13_149 = enmgen2_area_05
        L13_149 = L13_149.getEnemyMax
        L13_149 = L13_149()
        L5_141(L6_142, L7_143, L8_144, L9_145)
        if L5_141 <= 0 then
          if L5_141 == true then
            L5_141.stage4 = L6_142
            countflag = false
          end
        elseif L5_141 > 0 then
          countflag = true
        end
        L5_141()
      end
    end
    L5_141(L6_142)
    L5_141()
    L5_141()
  else
    L5_141.stage4 = 0
  end
  if L5_141 == true then
    L0_136 = L5_141
    L5_141(L6_142)
    L5_141.stage3 = 0
    L3_139 = 0
    while true do
      if L5_141 < L6_142 then
        L8_144 = 1000
        L5_141(L6_142, L7_143, L8_144, L9_145)
        if L5_141 <= 0 then
          if L5_141 == true then
            L5_141.stage3 = L6_142
            countflag = false
          end
        elseif L5_141 > 0 then
          countflag = true
        end
        L5_141()
      end
    end
    L5_141()
  else
    L5_141.stage5 = 0
  end
  L5_141(L6_142)
  L5_141()
  L5_141(L6_142, L7_143)
  L5_141(L6_142)
  L5_141.stage_record = L6_142
  L5_141.tune_time = L6_142
  L5_141.player_dead = L6_142
  L5_141.ver = 1
  L8_144 = 0
  for L13_149 = 1, L11_147() do
    L5_141.stage_record["stage" .. L13_149] = __ta.getrecord(L13_149) / 30
    L5_141.player_dead["stage" .. L13_149] = __player_dead_num["stage" .. L13_149]
    L8_144 = L8_144 + __player_dead_num["stage" .. L13_149]
  end
  L10_146.num = L9_145
  L10_146.num = L8_144
  L10_146.normaltime = L11_147
  L10_146.marstime = L11_147
  L10_146.jupitertime = L11_147
  for L13_149 = 1, 100 do
    if L6_142 ~= nil then
    end
  end
  L13_149 = L7_143
  L13_149 = L5_141
  L10_146(L11_147, L12_148, L13_149)
  L10_146(L11_147)
  L10_146(L11_147)
  L10_146(L11_147)
end
function Finalize()
  local L0_150, L1_151
end
function pccubesensor2_navi_01_OnEnter(A0_152)
  Fn_naviKill()
  Fn_pcSensorOff(A0_152)
  Fn_pcSensorOn("pccubesensor2_subnavi_01")
  __sensor_onenter[1] = true
end
function pccubesensor2_navi_01_OnLeave(A0_153)
  local L1_154
end
function pccubesensor2_subnavi_01_OnEnter(A0_155)
  Fn_naviKill()
end
function pccubesensor2_subnavi_01_OnLeave(A0_156)
  local L1_157
  L1_157 = Fn_naviSet
  L1_157(findGameObject2("Node", "locator2_navi_01"))
end
function pccubesensor2_navi_02_OnEnter(A0_158)
  Fn_naviKill()
  Fn_pcSensorOff(A0_158)
  Fn_pcSensorOn("pccubesensor2_subnavi_02")
  __sensor_onenter[2] = true
end
function pccubesensor2_navi_02_OnLeave(A0_159)
  local L1_160
end
function pccubesensor2_subnavi_02_OnEnter(A0_161)
  Fn_naviKill()
end
function pccubesensor2_subnavi_02_OnLeave(A0_162)
  local L1_163
  L1_163 = Fn_naviSet
  L1_163(findGameObject2("Node", "locator2_navi_02"))
end
function pccubesensor2_navi_03_OnEnter(A0_164)
  Fn_naviKill()
  Fn_pcSensorOff(A0_164)
  Fn_pcSensorOn("pccubesensor2_subnavi_03")
  __sensor_onenter[3] = true
end
function pccubesensor2_navi_03_OnLeave(A0_165)
  local L1_166
end
function pccubesensor2_subnavi_03_OnEnter(A0_167)
  Fn_naviKill()
end
function pccubesensor2_subnavi_03_OnLeave(A0_168)
  local L1_169
  L1_169 = Fn_naviSet
  L1_169(findGameObject2("Node", "locator2_navi_03"))
end
function pccubesensor2_navi_04_OnEnter(A0_170)
  Fn_naviKill()
  Fn_pcSensorOff(A0_170)
  Fn_pcSensorOn("pccubesensor2_subnavi_04")
  __sensor_onenter[4] = true
end
function pccubesensor2_navi_04_OnLeave(A0_171)
  local L1_172
end
function pccubesensor2_subnavi_04_OnEnter(A0_173)
  Fn_naviKill()
end
function pccubesensor2_subnavi_04_OnLeave(A0_174)
  local L1_175
  L1_175 = Fn_naviSet
  L1_175(findGameObject2("Node", "locator2_navi_04"))
end
function pccubesensor2_man01_01_OnEnter(A0_176)
  invokeTask(function()
    invokeTask(function()
      local L0_177
      L0_177 = __pl
      L0_177 = L0_177.getlifemax
      L0_177 = L0_177()
      L0_177 = L0_177 / 3
      __pl.regenelife(L0_177, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\231\148\183:\229\138\169\227\129\139\227\129\163\227\129\159\227\130\136\227\128\128\227\129\130\227\130\138\227\129\140\227\129\168\227\129\134")
    wait(150)
    findGameObject2("Puppet", "spawner2_man01_01"):kill()
  end)
  Fn_pcSensorOff(A0_176)
end
function pccubesensor2_man01_01_OnLeave(A0_178)
  local L1_179
end
function pccubesensor2_wom_02_OnEnter(A0_180)
  invokeTask(function()
    invokeTask(function()
      local L0_181
      L0_181 = __pl
      L0_181 = L0_181.getlifemax
      L0_181 = L0_181()
      L0_181 = L0_181 / 3
      __pl.regenelife(L0_181, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\229\165\179:\230\151\165\231\132\188\227\129\145\227\129\151\227\129\161\227\130\131\227\129\134\227\129\139\227\130\137\227\128\128\230\151\169\227\129\143\233\128\128\230\178\187\227\129\151\227\129\166\227\129\161\227\130\135\227\129\134\227\129\160\227\129\132")
    wait(150)
    findGameObject2("Puppet", "spawner2_wom01_02"):kill()
  end)
  Fn_pcSensorOff(A0_180)
end
function pccubesensor2_wom_02_OnLeave(A0_182)
  local L1_183
end
function pccubesensor2_wom_01_OnEnter(A0_184)
  invokeTask(function()
    invokeTask(function()
      local L0_185
      L0_185 = __pl
      L0_185 = L0_185.getlifemax
      L0_185 = L0_185()
      L0_185 = L0_185 / 3
      __pl.regenelife(L0_185, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\229\165\179:\230\128\170\230\136\145\227\129\151\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\230\176\151\227\130\146\227\129\164\227\129\145\227\129\166\227\129\173")
    wait(150)
    findGameObject2("Puppet", "spawner2_wom01_01"):kill()
  end)
  Fn_pcSensorOff(A0_184)
end
function pccubesensor2_wom_01_OnLeave(A0_186)
  local L1_187
end
function pccubesensor2_chi01_02_OnEnter(A0_188)
  invokeTask(function()
    invokeTask(function()
      local L0_189
      L0_189 = __pl
      L0_189 = L0_189.getlifemax
      L0_189 = L0_189()
      L0_189 = L0_189 / 3
      __pl.regenelife(L0_189, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\229\173\144\228\190\155:\227\129\147\227\130\140\231\181\130\227\130\143\227\129\163\227\129\159\227\130\137\233\163\178\227\129\191\232\161\140\227\129\147\227\129\134\227\130\136")
    wait(150)
    findGameObject2("Puppet", "spawner2_chi01_02"):kill()
  end)
  Fn_pcSensorOff(A0_188)
end
function pccubesensor2_chi01_02_OnLeave(A0_190)
  local L1_191
end
function pccubesensor2_chi01_03_OnEnter(A0_192)
  invokeTask(function()
    invokeTask(function()
      local L0_193
      L0_193 = __pl
      L0_193 = L0_193.getlifemax
      L0_193 = L0_193()
      L0_193 = L0_193 / 3
      __pl.regenelife(L0_193, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\229\173\144\228\190\155:\227\129\188\227\129\143\227\129\174\229\176\134\230\157\165\227\129\174\229\164\162\227\129\175\230\149\180\233\170\168\233\153\162\227\129\174\229\133\136\231\148\159\227\129\171\227\129\170\227\130\139\227\129\147\227\129\168\227\129\170\227\130\147\227\129\160")
    wait(150)
    findGameObject2("Puppet", "spawner2_chi01_03"):kill()
  end)
  Fn_pcSensorOff(A0_192)
end
function pccubesensor2_chi01_03_OnLeave(A0_194)
  local L1_195
end
function pccubesensor2_man01_02_OnEnter(A0_196)
  invokeTask(function()
    invokeTask(function()
      local L0_197
      L0_197 = __pl
      L0_197 = L0_197.getlifemax
      L0_197 = L0_197()
      L0_197 = L0_197 / 3
      __pl.regenelife(L0_197, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\231\148\183:\227\129\132\227\128\129\227\129\132\227\129\143\227\130\137\227\129\167\227\130\130\227\130\132\227\130\139\227\129\139\227\130\137\227\128\128\227\129\191\227\128\129\232\166\139\233\128\131\227\129\151\227\129\166\227\129\143\227\130\140\226\128\166")
    wait(150)
    findGameObject2("Puppet", "spawner2_man01_02"):kill()
  end)
  Fn_pcSensorOff(A0_196)
end
function pccubesensor2_man01_02_OnLeave(A0_198)
  local L1_199
end
function pccubesensor2_chi01_01_OnEnter(A0_200)
  invokeTask(function()
    invokeTask(function()
      local L0_201
      L0_201 = __pl
      L0_201 = L0_201.getlifemax
      L0_201 = L0_201()
      L0_201 = L0_201 / 3
      __pl.regenelife(L0_201, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\229\173\144\228\190\155:\227\129\138\229\167\137\227\129\161\227\130\131\227\130\147\227\128\128\227\129\140\227\130\147\227\129\176\227\129\163\227\129\166\239\188\129")
    wait(150)
    findGameObject2("Puppet", "spawner2_chi01_01"):kill()
  end)
  Fn_pcSensorOff(A0_200)
end
function pccubesensor2_chi01_01_OnLeave(A0_202)
  local L1_203
end
function pccubesensor2_man01_03_OnEnter(A0_204)
  invokeTask(function()
    invokeTask(function()
      local L0_205
      L0_205 = __pl
      L0_205 = L0_205.getlifemax
      L0_205 = L0_205()
      L0_205 = L0_205 / 3
      __pl.regenelife(L0_205, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\231\148\183:\228\187\138\230\151\165\227\129\175\229\186\151\227\129\152\227\129\190\227\129\132\227\129\160\227\130\136\227\128\128\229\184\176\227\129\163\227\129\166\227\129\138\227\129\143\227\130\140")
    wait(150)
    findGameObject2("Puppet", "spawner2_man01_03"):kill()
  end)
  Fn_pcSensorOff(A0_204)
end
function pccubesensor2_man01_03_OnLeave(A0_206)
  local L1_207
end
function pccubesensor2_wom_03_OnEnter(A0_208)
  invokeTask(function()
    invokeTask(function()
      local L0_209
      L0_209 = __pl
      L0_209 = L0_209.getlifemax
      L0_209 = L0_209()
      L0_209 = L0_209 / 3
      __pl.regenelife(L0_209, 1)
    end)
    Sound:pulse("hp_item_get")
    Fn_captionView("\229\165\179:\227\129\130\227\130\137\227\129\130\227\130\137\227\128\128\227\130\183\227\130\167\227\131\171\227\130\191\227\131\188\227\129\140\227\129\151\227\129\190\227\129\163\227\129\166\227\129\151\227\129\190\227\129\132\227\129\190\227\129\151\227\129\159\227\130\143")
    wait(150)
    findGameObject2("Puppet", "spawner2_wom01_03"):kill()
  end)
  Fn_pcSensorOff(A0_208)
end
function pccubesensor2_wom_03_OnLeave(A0_210)
  local L1_211
end
function pccubesensor2_recorddispoff_01_OnEnter(A0_212)
  local L1_213
end
function pccubesensor2_recorddispoff_01_OnLeave(A0_214)
  __record_disp_flag = false
  Fn_pcSensorOff(A0_214)
end
function create_boxset(A0_215, A1_216, A2_217)
  local L3_218, L4_219, L5_220, L6_221, L7_222, L8_223
  L3_218 = Fn_getSubAreaHandle
  L4_219 = "jilga"
  L5_220 = A0_215
  L3_218 = L3_218(L4_219, L5_220)
  if L3_218 == nil then
    L4_219 = nil
    return L4_219
  end
  L4_219 = A2_217
  L5_220 = createGameObject2
  L6_221 = "GimmickBg"
  L5_220 = L5_220(L6_221)
  L7_222 = L5_220
  L6_221 = L5_220.setName
  L8_223 = L4_219
  L6_221(L7_222, L8_223)
  L7_222 = L5_220
  L6_221 = L5_220.setDrawModelName
  L8_223 = L4_219
  L6_221(L7_222, L8_223)
  L7_222 = L5_220
  L6_221 = L5_220.setCollisionName
  L8_223 = L4_219
  L6_221(L7_222, L8_223)
  L7_222 = L5_220
  L6_221 = L5_220.setAttributeName
  L8_223 = L4_219
  L6_221(L7_222, L8_223)
  L7_222 = L5_220
  L6_221 = L5_220.try_init
  L6_221(L7_222)
  L7_222 = L5_220
  L6_221 = L5_220.waitForReady
  L6_221(L7_222)
  L6_221 = findGameObject2
  L7_222 = "Node"
  L8_223 = A1_216
  L6_221 = L6_221(L7_222, L8_223)
  L8_223 = L6_221
  L7_222 = L6_221.getWorldPos
  L7_222 = L7_222(L8_223)
  L8_223 = L6_221.getWorldRot
  L8_223 = L8_223(L6_221)
  L3_218:appendChild(L5_220)
  L7_222.x = L7_222.x + (3 - RandF(0, 6))
  L7_222.z = L7_222.z + (3 - RandF(0, 6))
  L7_222.x = L7_222.x + (8 - RandF(0, 16))
  L7_222.z = L7_222.z + (8 - RandF(0, 16))
  L5_220:setWorldPos(L7_222)
  L5_220:setWorldRot(L8_223)
  L5_220:setForceMove()
  L5_220:try_start()
  return L5_220
end
function enemy_spawn(A0_224, A1_225, A2_226, A3_227, A4_228, A5_229)
  local L6_230
  L6_230 = {}
  L6_230.entry_class = "stalker"
  L6_230.spawncount = 1
  L6_230.front_length = 100
  L6_230.center_offset_y = 0
  L6_230.radius = 0
  L6_230.ground = true
  L6_230.entry_class = A0_224
  L6_230.front_length = A1_225
  L6_230.center_offset_y = A2_226
  L6_230.radius = A3_227
  L6_230.spawncount = A5_229
  L6_230.ground = A4_228
  DebugEnemySpawn(L6_230)
end
