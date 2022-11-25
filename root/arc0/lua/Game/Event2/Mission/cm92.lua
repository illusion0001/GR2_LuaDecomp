dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/TestScript/action_review_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
import("Camera")
import("Font")
_next_phase = false
_enemy_cnt = 0
_time_cnt = 0
enmgen2_battle_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_01",
      name = "specialb01"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_02",
      name = "specialb02"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_03",
      name = "specialb03"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_04",
      name = "specialb04"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_05",
      name = "specialb05"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_7)
  end
}
enmgen2_battle_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_b_21",
      name = "specialb21"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_b_22",
      name = "specialb22"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_b_23",
      name = "specialb23"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_15)
  end
}
enmgen2_battle_b_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mosquito",
      locator = "locator_ene_b_31",
      name = "specialb31"
    },
    {
      type = "mosquito",
      locator = "locator_ene_b_32",
      name = "specialb32"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_23)
  end
}
enmgen2_battle_b_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_41",
      name = "specialb41"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_42",
      name = "specialb42"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_43",
      name = "specialb43"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_44",
      name = "specialb44"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_45",
      name = "specialb45"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_46",
      name = "specialb46"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_31)
  end
}
enmgen2_battle_b_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_b_51",
      name = "specialb51"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_52",
      name = "specialb52"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_53",
      name = "specialb53"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_54",
      name = "specialb54"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_55",
      name = "specialb55"
    },
    {
      type = "stalker",
      locator = "locator_ene_b_56",
      name = "specialb56"
    }
  },
  onUpdate = function(A0_32)
    local L1_33
  end,
  onEnter = function(A0_34)
    local L1_35
  end,
  onLeave = function(A0_36)
    local L1_37
  end,
  onObjectDead = function(A0_38, A1_39)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_39)
  end
}
enmgen2_battle_b_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mosquito",
      locator = "locator_ene_b_61",
      name = "specialb61"
    },
    {
      type = "mosquito",
      locator = "locator_ene_b_62",
      name = "specialb62"
    },
    {
      type = "mosquito",
      locator = "locator_ene_b_63",
      name = "specialb63"
    }
  },
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onObjectDead = function(A0_46, A1_47)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_47)
  end
}
enmgen2_battle_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_c_01",
      name = "specialc01"
    }
  },
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onObjectDead = function(A0_54, A1_55)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
  end
}
enmgen2_battle_c_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_c_21",
      name = "specialc21"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_c_22",
      name = "specialc22"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_c_23",
      name = "specialc23"
    }
  },
  onUpdate = function(A0_56)
    local L1_57
  end,
  onEnter = function(A0_58)
    local L1_59
  end,
  onLeave = function(A0_60)
    local L1_61
  end,
  onObjectDead = function(A0_62, A1_63)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_63)
  end
}
enmgen2_battle_c_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_c_31",
      name = "specialc31"
    },
    {
      type = "guardcore",
      locator = "locator_ene_c_32",
      name = "specialc32"
    }
  },
  onUpdate = function(A0_64)
    local L1_65
  end,
  onEnter = function(A0_66)
    local L1_67
  end,
  onLeave = function(A0_68)
    local L1_69
  end,
  onObjectDead = function(A0_70, A1_71)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_71)
  end
}
enmgen2_battle_d_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_d_01",
      name = "speciald01"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_02",
      name = "speciald02"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_04",
      name = "speciald04"
    },
    {
      type = "runner",
      locator = "locator_ene_d_05",
      name = "speciald05"
    },
    {
      type = "runner",
      locator = "locator_ene_d_06",
      name = "speciald06"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_07",
      name = "speciald07"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_08",
      name = "speciald08"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_09",
      name = "speciald09"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_010",
      name = "speciald010"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_011",
      name = "speciald011"
    }
  },
  onUpdate = function(A0_72)
    local L1_73
  end,
  onEnter = function(A0_74)
    local L1_75
  end,
  onLeave = function(A0_76)
    local L1_77
  end,
  onObjectDead = function(A0_78, A1_79)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_79)
  end
}
enmgen2_battle_d_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_21",
      name = "speciald21"
    },
    {
      type = "mechsmall",
      locator = "locator_ene_d_22",
      name = "speciald22"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_23",
      name = "speciald23"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_24",
      name = "speciald24"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_25",
      name = "speciald25"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_26",
      name = "speciald26"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_27",
      name = "speciald27"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_28",
      name = "speciald28"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_29",
      name = "speciald29"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_30",
      name = "speciald30"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_311",
      name = "speciald311"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_312",
      name = "speciald312"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_313",
      name = "speciald313"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_314",
      name = "speciald314"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_315",
      name = "speciald315"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_316",
      name = "speciald316"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_317",
      name = "speciald317"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_318",
      name = "speciald318"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_d_319",
      name = "speciald319"
    },
    {
      type = "officer_rifle",
      locator = "locator_ene_d_22",
      name = "speciald320",
      target_vehicle = "speciald22"
    }
  },
  onUpdate = function(A0_80)
    local L1_81
  end,
  onEnter = function(A0_82)
    local L1_83
  end,
  onLeave = function(A0_84)
    local L1_85
  end,
  onObjectAsh = function(A0_86, A1_87)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_87)
  end
}
enmgen2_battle_d_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_d_31",
      name = "speciald31"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_32",
      name = "speciald32"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_33",
      name = "speciald33"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_34",
      name = "speciald34"
    }
  },
  onUpdate = function(A0_88)
    local L1_89
  end,
  onEnter = function(A0_90)
    local L1_91
  end,
  onLeave = function(A0_92)
    local L1_93
  end,
  onObjectDead = function(A0_94, A1_95)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_95)
  end
}
enmgen2_battle_d_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_d_41",
      name = "speciald41"
    },
    {
      type = "runner",
      locator = "locator_ene_d_42",
      name = "speciald42"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_43",
      name = "speciald43"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_44",
      name = "speciald44"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_d_46",
      name = "speciald46"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_47",
      name = "speciald47"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_48",
      name = "speciald48"
    },
    {
      type = "stalker",
      locator = "locator_ene_d_49",
      name = "speciald49"
    }
  },
  onUpdate = function(A0_96)
    local L1_97
  end,
  onEnter = function(A0_98)
    local L1_99
  end,
  onLeave = function(A0_100)
    local L1_101
  end,
  onObjectDead = function(A0_102, A1_103)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_103)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_104, L1_105
    L0_104 = enmgen2_area_05
    L0_104 = L0_104.spawnSet
    L0_104 = #L0_104
    return L0_104
  end,
  getEnemyDeadNum = function()
    local L1_106
    L1_106 = enmgen2_area_05
    L1_106 = L1_106.enemyDeadNum
    return L1_106
  end,
  getEnemyName = function(A0_107)
    local L1_108
    L1_108 = enmgen2_area_05
    L1_108 = L1_108.spawnSet
    L1_108 = L1_108[A0_107]
    L1_108 = L1_108.name
    return L1_108
  end
}
enmgen2_battle_d_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_d_51",
      name = "speciald51"
    },
    {
      type = "giant",
      locator = "locator_ene_d_52",
      name = "speciald52"
    },
    {
      type = "guardcore",
      locator = "locator_ene_d_53",
      name = "speciald53"
    },
    {
      type = "guardcore",
      locator = "locator_ene_d_54",
      name = "speciald54"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_55",
      name = "speciald55"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_56",
      name = "speciald56"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_57",
      name = "speciald57"
    },
    {
      type = "mosquito",
      locator = "locator_ene_d_58",
      name = "speciald58"
    },
    {
      type = "runner",
      locator = "locator_ene_d_59",
      name = "speciald59"
    },
    {
      type = "runner",
      locator = "locator_ene_d_60",
      name = "speciald60"
    },
    {
      type = "runner",
      locator = "locator_ene_d_61",
      name = "speciald61"
    },
    {
      type = "runner",
      locator = "locator_ene_d_62",
      name = "speciald62"
    }
  },
  onUpdate = function(A0_109)
    local L1_110
  end,
  onEnter = function(A0_111)
    local L1_112
  end,
  onLeave = function(A0_113)
    local L1_114
  end,
  onObjectAsh = function(A0_115, A1_116)
    _enemy_cnt = _enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. _enemy_cnt)
    lowlife_gemset(A1_116)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_117, L1_118
    L0_117 = enmgen2_area_05
    L0_117 = L0_117.spawnSet
    L0_117 = #L0_117
    return L0_117
  end,
  getEnemyDeadNum = function()
    local L1_119
    L1_119 = enmgen2_area_05
    L1_119 = L1_119.enemyDeadNum
    return L1_119
  end,
  getEnemyName = function(A0_120)
    local L1_121
    L1_121 = enmgen2_area_05
    L1_121 = L1_121.spawnSet
    L1_121 = L1_121[A0_120]
    L1_121 = L1_121.name
    return L1_121
  end
}
function Initialize()
  cam_hdl = createGameObject2("CameraNode")
  cam_hdl:setName("cam_demo")
  cam_node = createGameObject2("GimmickBg")
  cam_node:setName("cam_node")
  cam_node:appendChild(cam_hdl)
  aim_node = createGameObject2("GimmickBg")
  aim_node:setName("aim_node")
  Fn_setCatWarp(true)
end
function Ingame()
  local L0_122, L1_123, L2_124, L3_125, L4_126, L5_127, L6_128, L7_129, L8_130, L9_131, L10_132, L11_133, L12_134, L13_135, L14_136, L15_137, L16_138, L17_139, L18_140, L19_141, L20_142, L21_143, L22_144, L23_145, L24_146, L25_147, L26_148, L27_149, L28_150, L29_151, L30_152, L31_153, L32_154, L33_155, L34_156, L35_157, L36_158
  L4_126 = "Console"
  L0_122(L1_123, L2_124, L3_125)
  L0_122(L1_123)
  for L3_125 = 1, 9 do
    L4_126 = create_setbox
    L4_126(L5_127, L6_128, L7_129)
  end
  for L3_125 = 21, 24 do
    L4_126 = create_setbox
    L4_126(L5_127, L6_128, L7_129)
  end
  L4_126 = "woodbox_kk_01"
  L8_130 = "woodbox_kk_01"
  L9_131 = "barrel_kk_01"
  L10_132 = "woodbox_kk_01"
  L11_133 = "barrel_kk_01"
  L12_134 = "woodbox_kk_01"
  L13_135 = "barrel_kk_01"
  L14_136 = "woodbox_kk_01"
  L0_122[1] = L1_123
  for L4_126 = 1, 6 do
    for L8_130 = 0, 3 do
      L9_131 = create_boxset
      L10_132 = "po_a_02"
      L11_133 = "locator2_box_1"
      L12_134 = L4_126
      L11_133 = L11_133 .. L12_134
      L12_134 = L0_122[1]
      L12_134 = L12_134[L4_126]
      L9_131(L10_132, L11_133, L12_134)
    end
  end
  for L4_126 = 11, 25 do
    for L8_130 = 0, 2 do
      L9_131 = create_boxset
      L10_132 = "po_a_04"
      L11_133 = "locator2_box_"
      L12_134 = L4_126
      L11_133 = L11_133 .. L12_134
      L12_134 = L0_122[1]
      L13_135 = L4_126 - 10
      L12_134 = L12_134[L13_135]
      L9_131(L10_132, L11_133, L12_134)
    end
  end
  i = 12
  L4_126 = "Node"
  L8_130 = i
  L1_123[L2_124] = L3_125
  L2_124(L3_125)
  L4_126 = "locator2_woman_04"
  L4_126 = L2_124
  L3_125(L4_126, L5_127)
  L4_126 = "Node"
  L4_126 = L2_124
  L3_125(L4_126, L5_127)
  L4_126 = "Node"
  L4_126 = L2_124
  L3_125(L4_126, L5_127)
  L4_126 = "locator2_pc_start_pos"
  L3_125(L4_126)
  L3_125()
  L3_125()
  L4_126 = "pccubesensor2_tut_09"
  L3_125(L4_126)
  L4_126 = L1_123[9]
  L3_125(L4_126)
  L4_126 = "EnemyGenerator"
  if L3_125 ~= nil then
    _enemy_cnt = 3
    L4_126 = L3_125.requestSpawn
    L4_126(L5_127)
  end
  L4_126 = wait
  L4_126(L5_127)
  L4_126 = L3_125.requestIdlingEnemy
  L4_126(L5_127, L6_128)
  L4_126 = waitPhace
  L4_126()
  _next_phase = false
  L4_126 = L3_125.requestIdlingEnemy
  L4_126(L5_127, L6_128)
  L4_126 = invokeTask
  L4_126 = L4_126(L5_127)
  enemy_cnt = L4_126
  while true do
    L4_126 = _enemy_cnt
    if L4_126 > 0 then
      L4_126 = wait
      L4_126()
    end
  end
  L4_126 = enemy_cnt
  L4_126 = L4_126.abort
  L4_126(L5_127)
  L4_126 = findGameObject2
  L4_126 = L4_126(L5_127, L6_128)
  __view_pos = L5_127
  if L5_127 ~= nil then
    _enemy_cnt = 2
    L6_128(L7_129)
  end
  __view_pos = nil
  enemy_cnt = L6_128
  while true do
    if L6_128 > 0 then
      L6_128()
    end
  end
  L6_128(L7_129)
  L8_130 = "enmgen2_b_06"
  if L6_128 ~= nil then
    _enemy_cnt = 3
    L8_130 = L6_128
    L7_129(L8_130)
  end
  function L8_130()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. _enemy_cnt .. "/" .. 3)
      wait()
    end
  end
  enemy_cnt = L7_129
  while true do
    if L7_129 > 0 then
      L7_129()
    end
  end
  L8_130 = L7_129
  L7_129(L8_130)
  L8_130 = "EnemyGenerator"
  L9_131 = "enmgen2_b_04"
  if L7_129 ~= nil then
    _enemy_cnt = 6
    L9_131 = L7_129
    L8_130 = L7_129.requestSpawn
    L8_130(L9_131)
  end
  L8_130 = findGameObject2
  L9_131 = "Node"
  L10_132 = "locator2_aim_b2"
  L8_130 = L8_130(L9_131, L10_132)
  L10_132 = L8_130
  L9_131 = L8_130.getWorldPos
  L9_131 = L9_131(L10_132)
  __view_pos = L9_131
  __view_pos = nil
  L9_131 = invokeTask
  function L10_132()
    local L0_159, L1_160
  end
  L9_131 = L9_131(L10_132)
  jupiterkick_help = L9_131
  L9_131 = invokeTask
  function L10_132()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. _enemy_cnt .. "/" .. 6)
      wait()
    end
  end
  L9_131 = L9_131(L10_132)
  enemy_cnt = L9_131
  while true do
    L9_131 = _enemy_cnt
    if L9_131 > 0 then
      L9_131 = wait
      L9_131()
    end
  end
  L9_131 = enemy_cnt
  L10_132 = L9_131
  L9_131 = L9_131.abort
  L9_131(L10_132)
  L9_131 = findGameObject2
  L10_132 = "Node"
  L11_133 = "locator2_aim_b3"
  L9_131 = L9_131(L10_132, L11_133)
  L11_133 = L9_131
  L10_132 = L9_131.getWorldPos
  L10_132 = L10_132(L11_133)
  __view_pos = L10_132
  L10_132 = findGameObject2
  L11_133 = "EnemyGenerator"
  L12_134 = "enmgen2_b_05"
  L10_132 = L10_132(L11_133, L12_134)
  if L10_132 ~= nil then
    _enemy_cnt = 6
    L12_134 = L10_132
    L11_133 = L10_132.requestSpawn
    L11_133(L12_134)
  end
  __view_pos = nil
  L11_133 = invokeTask
  function L12_134()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. _enemy_cnt .. "/" .. 6)
      wait()
    end
  end
  L11_133 = L11_133(L12_134)
  enemy_cnt = L11_133
  while true do
    L11_133 = _enemy_cnt
    if L11_133 > 0 then
      L11_133 = wait
      L11_133()
    end
  end
  L11_133 = enemy_cnt
  L12_134 = L11_133
  L11_133 = L11_133.abort
  L11_133(L12_134)
  L11_133 = NaviSet_Auto
  L12_134 = L1_123[11]
  L11_133(L12_134)
  L11_133 = waitPhace
  L11_133()
  L11_133 = Fn_naviKill
  L11_133()
  L11_133 = findGameObject2
  L12_134 = "EnemyGenerator"
  L13_135 = "enmgen2_c_02"
  L11_133 = L11_133(L12_134, L13_135)
  if L11_133 ~= nil then
    _enemy_cnt = 3
    L13_135 = L11_133
    L12_134 = L11_133.requestSpawn
    L12_134(L13_135)
  end
  L12_134 = Font
  L13_135 = L12_134
  L12_134 = L12_134.asciiPrint
  L14_136 = 100
  L18_140 = "/"
  L12_134(L13_135, L14_136, L15_137, L16_138)
  L12_134 = invokeTask
  function L13_135()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. _enemy_cnt .. "/" .. 3)
      wait()
    end
  end
  L12_134 = L12_134(L13_135)
  enemy_cnt = L12_134
  L12_134 = 15
  L13_135 = 15
  L14_136 = 0
  while true do
    if L15_137 > 0 then
      L18_140 = 1000
      L22_144 = 3
      L15_137(L16_138, L17_139, L18_140, L19_141)
      L12_134 = L12_134 + 1
      L15_137(L16_138)
      _time_cnt = L15_137
      if L13_135 < L12_134 and L14_136 <= 5 then
        for L18_140 = 1, 6 do
          for L22_144 = 0, 2 do
            L26_148 = L18_140
            L26_148 = L0_122[1]
            L26_148 = L26_148[L18_140]
            L23_145(L24_146, L25_147, L26_148)
          end
        end
        L14_136 = L14_136 + 1
        L12_134 = 0
        L13_135 = L13_135 + 10
        L15_137(L16_138)
        L15_137(L16_138)
      end
    end
  end
  L15_137(L16_138)
  if L15_137 ~= nil then
    _enemy_cnt = 2
    L16_138(L17_139)
  end
  enemy_cnt = L16_138
  L18_140 = 0
  while true do
    if L19_141 > 0 then
      L19_141(L20_142)
      _time_cnt = L19_141
      if L17_139 < L16_138 and L18_140 <= 5 then
        for L22_144 = 1, 6 do
          for L26_148 = 0, 2 do
            L30_152 = L22_144
            L30_152 = L0_122[1]
            L30_152 = L30_152[L22_144]
            L27_149(L28_150, L29_151, L30_152)
          end
        end
        L18_140 = L18_140 + 1
        L19_141(L20_142)
        L19_141(L20_142)
      end
    end
  end
  L19_141(L20_142)
  L19_141(L20_142)
  if L19_141 ~= nil then
    _enemy_cnt = 10
    L20_142(L21_143)
  end
  L20_142(L21_143)
  L20_142()
  L20_142()
  enemy_cnt = L20_142
  L22_144 = 0
  while true do
    if L23_145 > 0 then
      L23_145(L24_146)
      _time_cnt = L23_145
      if L21_143 < L20_142 and L22_144 <= 4 then
        for L26_148 = 11, 25 do
          L30_152 = L26_148
          L30_152 = L0_122[1]
          L31_153 = L26_148 - 10
          L30_152 = L30_152[L31_153]
          L27_149(L28_150, L29_151, L30_152)
        end
        L22_144 = L22_144 + 1
        L23_145(L24_146)
        L23_145(L24_146)
      end
    end
  end
  L23_145(L24_146)
  if L23_145 ~= nil then
    _enemy_cnt = 20
    L24_146(L25_147)
  end
  enemy_cnt = L24_146
  L26_148 = 0
  while true do
    if L27_149 > 0 then
      L27_149(L28_150)
      _time_cnt = L27_149
      if L25_147 < L24_146 and L26_148 <= 4 then
        for L30_152 = 11, 25 do
          L31_153 = create_boxset
          L32_154 = "po_a_04"
          L31_153(L32_154, L33_155, L34_156)
        end
        L26_148 = L26_148 + 1
        L27_149(L28_150)
        L27_149(L28_150)
      end
    end
  end
  L27_149(L28_150)
  if L27_149 ~= nil then
    _enemy_cnt = 4
    L28_150(L29_151)
  end
  L30_152 = "locator2_aim_d1"
  L30_152 = L28_150
  __view_pos = L29_151
  L30_152 = 3
  L29_151(L30_152)
  __view_pos = nil
  L30_152 = "Node"
  L31_153 = "locator2_box_20"
  L30_152 = L2_124
  L31_153 = 5
  L29_151(L30_152, L31_153)
  L30_152 = "Node"
  L31_153 = "locator2_box_25"
  L30_152 = L2_124
  L31_153 = 5
  L29_151(L30_152, L31_153)
  L30_152 = 1
  L29_151(L30_152)
  function L30_152()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. _enemy_cnt .. "/" .. 4)
      wait()
    end
  end
  enemy_cnt = L29_151
  while true do
    if L29_151 > 0 then
      L29_151()
    end
  end
  L30_152 = L29_151
  L29_151(L30_152)
  L30_152 = "EnemyGenerator"
  L31_153 = "enmgen2_d_04"
  if L29_151 ~= nil then
    _enemy_cnt = 8
    L31_153 = L29_151
    L30_152 = L29_151.requestSpawn
    L30_152(L31_153)
  end
  L30_152 = invokeTask
  function L31_153()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. _enemy_cnt .. "/" .. 8)
      wait()
    end
  end
  L30_152 = L30_152(L31_153)
  enemy_cnt = L30_152
  L30_152 = 0
  L31_153 = 25
  L32_154 = 0
  while true do
    if L33_155 > 0 then
      L30_152 = L30_152 + 1
      L33_155(L34_156)
      _time_cnt = L33_155
      if L31_153 < L30_152 and L32_154 <= 4 then
        for L36_158 = 11, 25 do
          create_boxset("po_a_04", "locator2_box_" .. L36_158, L0_122[1][L36_158 - 10])
        end
        L32_154 = L32_154 + 1
        L30_152 = 0
        L31_153 = L31_153 + 10
        L33_155(L34_156)
        L33_155(L34_156)
      end
    end
  end
  L33_155(L34_156)
  if L33_155 ~= nil then
    _enemy_cnt = 12
    L34_156(L35_157)
  end
  enemy_cnt = L34_156
  while true do
    if L34_156 > 0 then
      L34_156()
    end
  end
  L34_156(L35_157)
  L34_156(L35_157)
  L34_156(L35_157)
  L34_156()
  L36_158 = "clear_jingle"
  L34_156(L35_157, L36_158)
  L34_156(L35_157)
  L34_156()
  L34_156()
  L34_156()
  L34_156()
end
function Finalize()
  local L0_161, L1_162
end
function pc_tune_mars_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Mars do
    wait()
  end
end
function pc_tune_jupiter_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Jupiter do
    wait()
  end
end
function pc_tune_normal_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Normal do
    wait()
  end
end
function pccubesensor2_tut_09_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_09")
  Fn_naviKill()
  _next_phase = true
end
function pccubesensor2_tut_11_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_11")
  _next_phase = true
end
function pccubesensor2_tut_12_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_12")
  Fn_naviKill()
  navi_on()
end
function GemSetDisp(A0_163, A1_164)
  local L2_165, L3_166, L4_167, L5_168, L6_169
  L2_165 = nil
  for L6_169 = 1, 9 do
    L2_165 = findGameObject2("Gem", "gem2_navi_0" .. A0_163 .. "_0" .. L6_169)
    if L2_165 ~= nil then
      L2_165:setVisible(A1_164)
    end
  end
end
function navi_on()
  local L0_170, L1_171
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_172, A1_173, A2_174)
  Fn_naviSet(A0_172)
  if A1_173 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_173)
    HUD:naviSetPochiDistanceDensity0(A2_174)
  end
  Sound:pulse("navi_set")
end
