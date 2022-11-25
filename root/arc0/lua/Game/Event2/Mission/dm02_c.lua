dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/GemCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm02_common.lua")
MEMORY_DEBRIS_PARAM_TBL = {
  {
    memory_name = "out_01",
    locator_name = "locator2_out_mem_debris_01"
  },
  {
    memory_name = "out_02",
    locator_name = "locator2_out_mem_debris_02"
  },
  {
    memory_name = "out_03",
    locator_name = "locator2_out_mem_debris_03"
  },
  {
    memory_name = "out_04",
    locator_name = "locator2_out_mem_debris_04"
  },
  {
    memory_name = "middle_01",
    locator_name = "locator2_middle_mem_debris_01"
  },
  {
    memory_name = "middle_02",
    locator_name = "locator2_middle_mem_debris_02"
  },
  {
    memory_name = "middle_03",
    locator_name = "locator2_middle_mem_debris_03"
  },
  {
    memory_name = "midin_01",
    locator_name = "locator2_midin_mem_debris_01"
  },
  {
    memory_name = "midin_02",
    locator_name = "locator2_midin_mem_debris_02"
  },
  {
    memory_name = "midin_03",
    locator_name = "locator2_midin_mem_debris_03"
  },
  {
    memory_name = "in_01",
    locator_name = "locator2_in_mem_debris_01"
  },
  {
    memory_name = "in_03",
    locator_name = "locator2_in_mem_debris_03"
  },
  {
    memory_name = "start",
    locator_name = "locator2_start_mem_debris_01"
  }
}
ENM_STATE_PREPARE = 1
ENM_STATE_PATROL = 2
ENM_STATE_CHASE_INIT = 3
ENM_STATE_CHASE = 4
ENM_STATE_BATTLE_INIT = 5
ENM_STATE_BATTLE = 6
ENM_STATE_DEAD = 7
DM02_ZAZA_MOTION = {
  scared_00 = "chi01_scared_00",
  jump_00 = "zaz01_jump_00",
  fall_00 = "zaz01_jump_fall_00",
  land_00 = "zaz01_jump_land_00"
}
dm02_zaza_task = nil
dm02_zaza_arrive = false
dm02_zaza_puppet = nil
dm02_zaza_wait = false
dm02_zaza_warning = {}
dm02_zaza_captured = false
dm02_enemy_sensor1 = nil
dm02_enemy_sensor2 = nil
dm02_zaza_landname = "start"
dm02_zaza_checkpoint = "locator2_zaza_01"
dm02_zaza_panic_task = nil
dm02_zaza_move_task = nil
dm02_zaza_jumping = false
_jump_distination_sensor = nil
dm02_zaza_area_sensor = {}
dm02_zaza_jump_caption_long = 10
dm02_zaza_jump_caption_near = 9
dm02_out_high = true
dm02_middle_high = false
dm02_midin_high = false
dm02_in_high = false
dm02_rebirth_time = 60
dm02_gem_display_out = true
dm02_gem_display_middle = false
dm02_gem_display_midin = false
dm02_gem_display_in = false
_enmgen_tbl = {}
_enemy_state = {}
dm02_enemy_jump = {}
dm02_respawn_task = {}
dm02_area_handle = {}
az5_c_03_move_task = nil
az5_c_04_move_task = nil
az5_c_05_move_task = nil
az5_c_06_move_task = nil
az5_c_03_root_move_task = nil
az5_c_04_root_move_task = nil
az5_c_05_root_move_task = nil
az5_c_06_root_move_task = nil
spinner_in_move_task = nil
spinner_midin_move_task = nil
spinner_middle_move_task = nil
spinner_out_move_task = nil
dm02_replace_task = nil
_ark_wing_01_hdl = nil
_ark_wing_02_hdl = nil
_ark_wing_03_hdl = nil
_ark_wing_04_hdl = nil
_ark_head_hdl = nil
_goal_error_cap_wait_task = nil
_extra_mem_debris_caption_idx = 1
_trophy_41_attainable = true
DM02_AREA_TABLE = {
  "out_01",
  "out_02",
  "out_03",
  "out_04",
  "middle_01",
  "middle_02",
  "middle_03",
  "midin_01",
  "midin_02",
  "midin_03",
  "in_01",
  "in_02",
  "in_03",
  "ark_01"
}
DM02_ENEMY_GENERATOR = {
  "enmgen2_in_01_01",
  "enmgen2_in_01_02",
  "enmgen2_in_02_01",
  "enmgen2_in_02_02",
  "enmgen2_in_03_02",
  "enmgen2_midin_01_01",
  "enmgen2_midin_01_02",
  "enmgen2_midin_02_01",
  "enmgen2_midin_02_02",
  "enmgen2_midin_03_02",
  "enmgen2_middle_01_01",
  "enmgen2_middle_01_02",
  "enmgen2_middle_02_01",
  "enmgen2_middle_02_02",
  "enmgen2_middle_03_02",
  "enmgen2_ark_01_01",
  "enmgen2_ark_01_02"
}
enmgen2_ark_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_ark_01_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_0)
    local L1_1
  end,
  onObjectDead = function(A0_2, A1_3)
  end,
  onEnter = function(A0_4)
    enmgen2_onEnter(A0_4)
  end,
  onUpdate = function(A0_5)
    enmgen2_onUpdate(A0_5)
  end,
  onSpawn = function(A0_6, A1_7)
    enmgen2_onSpawn(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    enmgen2_onObjectAsh(A0_8, A1_9)
  end
}
enmgen2_ark_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_01",
      name = "collector_ark_01_up02",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_10)
    local L1_11
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onEnter = function(A0_14)
    enmgen2_onEnter(A0_14)
  end,
  onUpdate = function(A0_15)
    enmgen2_onUpdate(A0_15)
  end,
  onSpawn = function(A0_16, A1_17)
    enmgen2_onSpawn(A0_16, A1_17)
  end,
  onObjectAsh = function(A0_18, A1_19)
    enmgen2_onObjectAsh(A0_18, A1_19)
  end
}
enmgen2_in_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_01",
      name = "collector_in_01_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onEnter = function(A0_24)
    enmgen2_onEnter(A0_24)
  end,
  onUpdate = function(A0_25)
    enmgen2_onUpdate(A0_25)
  end,
  onSpawn = function(A0_26, A1_27)
    enmgen2_onSpawn(A0_26, A1_27)
  end,
  onObjectAsh = function(A0_28, A1_29)
    enmgen2_onObjectAsh(A0_28, A1_29)
  end
}
enmgen2_in_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_in_02_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_30)
    local L1_31
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onEnter = function(A0_34)
    enmgen2_onEnter(A0_34)
  end,
  onUpdate = function(A0_35)
    enmgen2_onUpdate(A0_35)
  end,
  onSpawn = function(A0_36, A1_37)
    enmgen2_onSpawn(A0_36, A1_37)
  end,
  onObjectAsh = function(A0_38, A1_39)
    enmgen2_onObjectAsh(A0_38, A1_39)
  end
}
enmgen2_in_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_01",
      name = "collector_in_01_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_40)
    local L1_41
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onEnter = function(A0_44)
    enmgen2_onEnter(A0_44)
  end,
  onUpdate = function(A0_45)
    enmgen2_onUpdate(A0_45)
  end,
  onSpawn = function(A0_46, A1_47)
    enmgen2_onSpawn(A0_46, A1_47)
  end,
  onObjectAsh = function(A0_48, A1_49)
    enmgen2_onObjectAsh(A0_48, A1_49)
  end
}
enmgen2_in_02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_in_02_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_50)
    local L1_51
  end,
  onObjectDead = function(A0_52, A1_53)
  end,
  onEnter = function(A0_54)
    enmgen2_onEnter(A0_54)
  end,
  onUpdate = function(A0_55)
    enmgen2_onUpdate(A0_55)
  end,
  onSpawn = function(A0_56, A1_57)
    enmgen2_onSpawn(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
    enmgen2_onObjectAsh(A0_58, A1_59)
  end
}
enmgen2_in_03_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_01",
      name = "collector_in_03_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_60)
    local L1_61
  end,
  onObjectDead = function(A0_62, A1_63)
  end,
  onEnter = function(A0_64)
    enmgen2_onEnter(A0_64)
  end,
  onUpdate = function(A0_65)
    enmgen2_onUpdate(A0_65)
  end,
  onSpawn = function(A0_66, A1_67)
    enmgen2_onSpawn(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
    enmgen2_onObjectAsh(A0_68, A1_69)
  end
}
enmgen2_midin_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_01",
      name = "collector_midin_01_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_70)
    local L1_71
  end,
  onObjectDead = function(A0_72, A1_73)
  end,
  onEnter = function(A0_74)
    enmgen2_onEnter(A0_74)
  end,
  onUpdate = function(A0_75)
    enmgen2_onUpdate(A0_75)
  end,
  onSpawn = function(A0_76, A1_77)
    enmgen2_onSpawn(A0_76, A1_77)
  end,
  onObjectAsh = function(A0_78, A1_79)
    enmgen2_onObjectAsh(A0_78, A1_79)
  end
}
enmgen2_midin_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_midin_02_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_80)
    local L1_81
  end,
  onObjectDead = function(A0_82, A1_83)
  end,
  onEnter = function(A0_84)
    enmgen2_onEnter(A0_84)
  end,
  onUpdate = function(A0_85)
    enmgen2_onUpdate(A0_85)
  end,
  onSpawn = function(A0_86, A1_87)
    enmgen2_onSpawn(A0_86, A1_87)
  end,
  onObjectAsh = function(A0_88, A1_89)
    enmgen2_onObjectAsh(A0_88, A1_89)
  end
}
enmgen2_midin_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_01",
      name = "collector_midin_01_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_90)
    local L1_91
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onEnter = function(A0_94)
    enmgen2_onEnter(A0_94)
  end,
  onUpdate = function(A0_95)
    enmgen2_onUpdate(A0_95)
  end,
  onSpawn = function(A0_96, A1_97)
    enmgen2_onSpawn(A0_96, A1_97)
  end,
  onObjectAsh = function(A0_98, A1_99)
    enmgen2_onObjectAsh(A0_98, A1_99)
  end
}
enmgen2_midin_02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_midin_02_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_100)
    local L1_101
  end,
  onObjectDead = function(A0_102, A1_103)
  end,
  onEnter = function(A0_104)
    enmgen2_onEnter(A0_104)
  end,
  onUpdate = function(A0_105)
    enmgen2_onUpdate(A0_105)
  end,
  onSpawn = function(A0_106, A1_107)
    enmgen2_onSpawn(A0_106, A1_107)
  end,
  onObjectAsh = function(A0_108, A1_109)
    enmgen2_onObjectAsh(A0_108, A1_109)
  end
}
enmgen2_midin_03_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_01",
      name = "collector_midin_03_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_110)
    local L1_111
  end,
  onObjectDead = function(A0_112, A1_113)
  end,
  onEnter = function(A0_114)
    enmgen2_onEnter(A0_114)
  end,
  onUpdate = function(A0_115)
    enmgen2_onUpdate(A0_115)
  end,
  onSpawn = function(A0_116, A1_117)
    enmgen2_onSpawn(A0_116, A1_117)
  end,
  onObjectAsh = function(A0_118, A1_119)
    enmgen2_onObjectAsh(A0_118, A1_119)
  end
}
enmgen2_middle_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_01",
      name = "collector_middle_01_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_120)
    local L1_121
  end,
  onObjectDead = function(A0_122, A1_123)
  end,
  onEnter = function(A0_124)
    enmgen2_onEnter(A0_124)
  end,
  onUpdate = function(A0_125)
    enmgen2_onUpdate(A0_125)
  end,
  onSpawn = function(A0_126, A1_127)
    enmgen2_onSpawn(A0_126, A1_127)
  end,
  onObjectAsh = function(A0_128, A1_129)
    enmgen2_onObjectAsh(A0_128, A1_129)
  end
}
enmgen2_middle_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_middle_02_up01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_130)
    local L1_131
  end,
  onObjectDead = function(A0_132, A1_133)
  end,
  onEnter = function(A0_134)
    enmgen2_onEnter(A0_134)
  end,
  onUpdate = function(A0_135)
    enmgen2_onUpdate(A0_135)
  end,
  onSpawn = function(A0_136, A1_137)
    enmgen2_onSpawn(A0_136, A1_137)
  end,
  onObjectAsh = function(A0_138, A1_139)
    enmgen2_onObjectAsh(A0_138, A1_139)
  end
}
enmgen2_middle_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_01",
      name = "collector_middle_01_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_140)
    local L1_141
  end,
  onObjectDead = function(A0_142, A1_143)
  end,
  onEnter = function(A0_144)
    enmgen2_onEnter(A0_144)
  end,
  onUpdate = function(A0_145)
    enmgen2_onUpdate(A0_145)
  end,
  onSpawn = function(A0_146, A1_147)
    enmgen2_onSpawn(A0_146, A1_147)
  end,
  onObjectAsh = function(A0_148, A1_149)
    enmgen2_onObjectAsh(A0_148, A1_149)
  end
}
enmgen2_middle_02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_01",
      name = "collector_middle_02_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_150)
    local L1_151
  end,
  onObjectDead = function(A0_152, A1_153)
  end,
  onEnter = function(A0_154)
    enmgen2_onEnter(A0_154)
  end,
  onUpdate = function(A0_155)
    enmgen2_onUpdate(A0_155)
  end,
  onSpawn = function(A0_156, A1_157)
    enmgen2_onSpawn(A0_156, A1_157)
  end,
  onObjectAsh = function(A0_158, A1_159)
    enmgen2_onObjectAsh(A0_158, A1_159)
  end
}
enmgen2_middle_03_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_01",
      name = "collector_middle_03_down01",
      ai_spawn_option = "Collector/dm02_c"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = dm02_rebirth_time,
  onLeave = function(A0_160)
    local L1_161
  end,
  onObjectDead = function(A0_162, A1_163)
  end,
  onEnter = function(A0_164)
    enmgen2_onEnter(A0_164)
  end,
  onUpdate = function(A0_165)
    enmgen2_onUpdate(A0_165)
  end,
  onSpawn = function(A0_166, A1_167)
    enmgen2_onSpawn(A0_166, A1_167)
  end,
  onObjectAsh = function(A0_168, A1_169)
    enmgen2_onObjectAsh(A0_168, A1_169)
  end
}
function Initialize()
  local L0_170, L1_171, L2_172, L3_173, L4_174
  L3_173 = "maze"
  bg_root_area = L0_170
  L3_173 = false
  L4_174 = false
  L0_170(L1_171, L2_172, L3_173, L4_174)
  L3_173 = false
  L0_170(L1_171, L2_172, L3_173)
  L3_173 = "az5_c_01"
  L0_170.az5_c_01 = L1_171
  L3_173 = "az5_c_02"
  L0_170.az5_c_02 = L1_171
  L3_173 = "az5_c_03_anim_move"
  L0_170.az5_c_03 = L1_171
  L3_173 = "az5_c_04_anim_move"
  L0_170.az5_c_04 = L1_171
  L3_173 = "az5_c_05_anim_move"
  L0_170.az5_c_05 = L1_171
  L3_173 = "az5_c_06_anim_move"
  L0_170.az5_c_06 = L1_171
  L3_173 = "az5_c_03_anim_spin"
  L0_170.az5_c_03_root = L1_171
  L3_173 = "az5_c_04_anim_spin"
  L0_170.az5_c_04_root = L1_171
  L3_173 = "az5_c_05_anim_spin"
  L0_170.az5_c_05_root = L1_171
  L3_173 = "az5_c_06_anim_spin"
  L0_170.az5_c_06_root = L1_171
  for L3_173, L4_174 in L0_170(L1_171) do
    resetAreaMove(L4_174)
    L4_174:setExpandedAabb(true)
  end
  L1_171.name = "bit"
  L1_171.type = "bit01"
  L1_171.node = "locator2_bit_01"
  L1_171.active = true
  L2_172.name = "zaza_01"
  L2_172.type = "zaz01"
  L2_172.node = "locator2_zaza_01"
  L2_172.active = false
  L1_171(L2_172)
  L3_173 = DM02_ZAZA_MOTION
  L1_171(L2_172, L3_173)
  dm02_zaza_puppet = L1_171
  L3_173 = 0.5
  L1_171(L2_172, L3_173)
  L3_173 = "spheresensor2_collector1"
  dm02_enemy_sensor1 = L1_171
  L3_173 = "spheresensor2_collector2"
  dm02_enemy_sensor2 = L1_171
  L3_173 = dm02_enemy_sensor1
  L1_171(L2_172, L3_173)
  L3_173 = dm02_enemy_sensor2
  L1_171(L2_172, L3_173)
  L3_173 = "bg2_ark_01"
  _ark_body_hdl = L1_171
  L3_173 = createGameObject2
  L4_174 = "GimmickBg"
  L3_173 = L3_173(L4_174)
  _ark_wing_01_hdl = L3_173
  L3_173 = _ark_wing_01_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setName
  L3_173(L4_174, "ark_wing_01")
  L3_173 = _ark_wing_01_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setDrawModelName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_01_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setCollisionName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_01_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setAttributeName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_body_hdl
  L4_174 = L3_173
  L3_173 = L3_173.appendChild
  L3_173(L4_174, _ark_wing_01_hdl)
  L3_173 = _ark_wing_01_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setVisibleBlockEnable
  L3_173(L4_174, false)
  L3_173 = createGameObject2
  L4_174 = "GimmickBg"
  L3_173 = L3_173(L4_174)
  _ark_wing_02_hdl = L3_173
  L3_173 = _ark_wing_02_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setName
  L3_173(L4_174, "ark_wing_02")
  L3_173 = _ark_wing_02_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setDrawModelName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_02_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setCollisionName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_02_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setAttributeName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_body_hdl
  L4_174 = L3_173
  L3_173 = L3_173.appendChild
  L3_173(L4_174, _ark_wing_02_hdl)
  L3_173 = _ark_wing_02_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setVisibleBlockEnable
  L3_173(L4_174, false)
  L3_173 = createGameObject2
  L4_174 = "GimmickBg"
  L3_173 = L3_173(L4_174)
  _ark_wing_03_hdl = L3_173
  L3_173 = _ark_wing_03_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setName
  L3_173(L4_174, "ark_wing_03")
  L3_173 = _ark_wing_03_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setDrawModelName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_03_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setCollisionName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_03_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setAttributeName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_body_hdl
  L4_174 = L3_173
  L3_173 = L3_173.appendChild
  L3_173(L4_174, _ark_wing_03_hdl)
  L3_173 = _ark_wing_03_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setVisibleBlockEnable
  L3_173(L4_174, false)
  L3_173 = createGameObject2
  L4_174 = "GimmickBg"
  L3_173 = L3_173(L4_174)
  _ark_wing_04_hdl = L3_173
  L3_173 = _ark_wing_04_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setName
  L3_173(L4_174, "ark_wing_04")
  L3_173 = _ark_wing_04_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setDrawModelName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_04_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setCollisionName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_wing_04_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setAttributeName
  L3_173(L4_174, L1_171)
  L3_173 = _ark_body_hdl
  L4_174 = L3_173
  L3_173 = L3_173.appendChild
  L3_173(L4_174, _ark_wing_04_hdl)
  L3_173 = _ark_wing_04_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setVisibleBlockEnable
  L3_173(L4_174, false)
  L3_173 = createGameObject2
  L4_174 = "GimmickBg"
  L3_173 = L3_173(L4_174)
  _ark_head_hdl = L3_173
  L3_173 = _ark_head_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setName
  L3_173(L4_174, "ark_head")
  L3_173 = _ark_head_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setDrawModelName
  L3_173(L4_174, L2_172)
  L3_173 = _ark_head_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setCollisionName
  L3_173(L4_174, L2_172)
  L3_173 = _ark_head_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setAttributeName
  L3_173(L4_174, L2_172)
  L3_173 = _ark_body_hdl
  L4_174 = L3_173
  L3_173 = L3_173.appendChild
  L3_173(L4_174, _ark_head_hdl)
  L3_173 = _ark_head_hdl
  L4_174 = L3_173
  L3_173 = L3_173.setVisibleBlockEnable
  L3_173(L4_174, false)
  L3_173 = memoryDebrisGetCallback
  L1_171(L2_172, L3_173)
  L1_171(L2_172)
  L1_171(L2_172)
  L1_171(L2_172)
  L1_171(L2_172)
  _jump_distination_sensor = L1_171
  L3_173 = "spheresensor2_jump_collector"
  L1_171(L2_172, L3_173)
  L3_173 = 7
  L1_171(L2_172, L3_173)
  L3_173 = "Puppet"
  L1_171(L2_172, L3_173)
  L3_173 = 0
  L1_171(L2_172, L3_173)
  L3_173 = 1
  L1_171(L2_172, L3_173)
  L3_173 = "spheresensor2_jump_collector_OnEnter"
  L1_171(L2_172, L3_173)
  L3_173 = "spheresensor2_jump_collector_OnLeave"
  L1_171(L2_172, L3_173)
  L1_171(L2_172)
  L3_173 = "GemGetCallback"
  L1_171(L2_172, L3_173)
  L1_171()
end
function Ingame()
  local L0_175, L1_176, L2_177, L3_178, L4_179, L5_180, L6_181, L7_182, L8_183, L9_184
  L0_175()
  L0_175()
  L0_175(L1_176, L2_177, L3_178, L4_179)
  L0_175(L1_176, L2_177, L3_178)
  L0_175()
  L0_175()
  L0_175()
  L0_175()
  L0_175()
  for L3_178, L4_179 in L0_175(L1_176) do
    L6_181 = "EnemyGenerator"
    L7_182 = L4_179
    if L5_180 ~= nil then
      L6_181 = _enmgen_tbl
      L6_181[L4_179] = L5_180
      L7_182 = L5_180
      L6_181 = L5_180.requestSpawn
      L6_181(L7_182)
      L7_182 = L5_180
      L6_181 = L5_180.setEnemyMarker
      L8_183 = false
      L6_181(L7_182, L8_183)
    end
  end
  L6_181 = "move_wing_03"
  L7_182 = true
  L6_181 = _ark_body_hdl
  L7_182 = L6_181
  L6_181 = L6_181.getNodePosRot
  L8_183 = "move_wing_04"
  L9_184 = true
  L7_182 = L6_181(L7_182, L8_183, L9_184)
  L8_183 = _ark_body_hdl
  L9_184 = L8_183
  L8_183 = L8_183.getNodePosRot
  L9_184 = L8_183(L9_184, "move_head", true)
  L0_175.x = L0_175.x + 3.2
  L2_177.z = L2_177.z + 3.2
  L4_179.z = L4_179.z - 3.2
  L6_181.x = L6_181.x - 3.2
  L7_182 = L7_182 * XRotQuat(Deg2Rad(-25))
  _ark_wing_01_hdl:setTransform(L0_175, L1_176)
  _ark_wing_02_hdl:setTransform(L2_177, L3_178)
  _ark_wing_03_hdl:setTransform(L4_179, L5_180)
  _ark_wing_04_hdl:setTransform(L6_181, L7_182)
  _ark_head_hdl:setTransform(L8_183, L9_184)
  L0_175()
  L0_175(L1_176)
  L0_175(L1_176)
  L1_176.eff_name = "ef_ev_dis_01"
  L1_176.world_pos = L2_177
  L1_176.time = 6
  L0_175(L1_176)
  L0_175(L1_176, L2_177)
  L0_175(L1_176)
  L7_182 = L0_175
  L6_181 = L0_175.getWorldPos
  L9_184 = L6_181(L7_182)
  L2_177(L3_178, L4_179, L5_180, L6_181, L7_182, L8_183, L9_184, L6_181(L7_182))
  L3_178.eff_name = "ef_ev_dis_01"
  L3_178.pos_node = L0_175
  L3_178.time = 6
  L2_177(L3_178)
  L2_177(L3_178)
  L2_177(L3_178, L4_179)
  L2_177(L3_178)
  L2_177(L3_178)
  L2_177(L3_178)
  L2_177(L3_178)
  while true do
    if L2_177 then
      L2_177()
    end
  end
  L6_181 = Vector
  L7_182 = 0
  L8_183 = 0
  L9_184 = 0
  L9_184 = L6_181(L7_182, L8_183, L9_184)
  L2_177(L3_178, L4_179, L5_180, L6_181, L7_182, L8_183, L9_184, L6_181(L7_182, L8_183, L9_184))
  L2_177(L3_178)
  L0_175(L1_176)
  L0_175(L1_176)
  L0_175(L1_176, L2_177)
  L0_175(L1_176)
  if L0_175 == 1 then
    while L1_176 > 0 do
    end
    L2_177(L3_178, L4_179)
    L2_177(L3_178, L4_179)
    L2_177(L3_178, L4_179)
    L2_177(L3_178, L4_179)
  end
  for L3_178, L4_179 in L0_175(L1_176) do
    L6_181 = L5_180
    L7_182 = true
    L5_180(L6_181, L7_182)
  end
  L0_175()
  L0_175()
  L0_175(L1_176, L2_177)
  dm02_zaza_task = L0_175
  while true do
    if L0_175 then
      L0_175()
    end
  end
  L0_175(L1_176)
  L0_175()
  if L0_175 == true then
    L0_175(L1_176, L2_177)
  end
  for L6_181 = #L3_178, 1, -1 do
    L7_182 = L1_176 % 2
    if L7_182 == 0 then
      L7_182 = isMemoryDebrisAcquired
      L8_183 = MEMORY_DEBRIS_PARAM_TBL
      L8_183 = L8_183[L6_181]
      L8_183 = L8_183.memory_name
      L7_182 = L7_182(L8_183)
    end
    L7_182 = math
    L7_182 = L7_182.floor
    L8_183 = L1_176 / 2
    L7_182 = L7_182(L8_183)
  end
  L6_181 = L0_175
  L3_178(L4_179, L5_180, L6_181)
  if L3_178 == 1 then
    if L0_175 >= L3_178 then
      L3_178(L4_179, L5_180)
    end
  end
  L0_175()
  if L0_175 == 1 then
    L0_175(L1_176, L2_177)
  end
  L0_175()
  L0_175()
  L0_175()
end
function Finalize()
  local L0_185, L1_186, L2_187, L3_188, L4_189
  L0_185(L1_186)
  L0_185(L1_186)
  _ark_wing_01_hdl = nil
  L0_185(L1_186)
  _ark_wing_02_hdl = nil
  L0_185(L1_186)
  _ark_wing_03_hdl = nil
  L0_185(L1_186)
  _ark_wing_04_hdl = nil
  L0_185(L1_186)
  _ark_head_hdl = nil
  L0_185()
  for L3_188, L4_189 in L0_185(L1_186) do
    _enmgen_tbl[L3_188]:requestAllEnemyKill()
  end
  _enmgen_tbl = L0_185
  _enemy_state = L0_185
  L3_188 = false
  L4_189 = false
  L0_185(L1_186, L2_187, L3_188, L4_189)
  L3_188 = false
  L0_185(L1_186, L2_187, L3_188)
  for L3_188, L4_189 in L0_185(L1_186) do
    resetAreaMove(L4_189)
  end
  L0_185(L1_186)
  _jump_distination_sensor = nil
end
function resetAreaMove(A0_190)
  A0_190:reset()
  A0_190:stopMoveAnim()
  A0_190:resetMoveAnim()
end
function pcspheresensor2_hakobune_01_OnEnter()
  if _goal_error_cap_wait_task == nil or _goal_error_cap_wait_task:isRunning() == false then
    Fn_captionView("dm02_02001")
    _goal_error_cap_wait_task = invokeTask(waitSeconds, 15)
  end
end
function spheresensor2_zaza_01_OnEnter()
  dm02_zaza_arrive = true
  Fn_pcSensorOff("pcspheresensor2_hakobune_01")
end
function spinner_in_move()
  spinner_in_move_task = invokeTask(function()
    dm02_area_handle.az5_c_06:setMoveAnimMode("parent")
    az5_c_06_root_move_task = dm_areaAnimate(dm02_area_handle.az5_c_06_root, "az5_c_06_spin", 0.2, true, true)
    while true do
      if dm02_in_high == true and false == false then
        az5_c_06_move_task = dm_areaAnimate(dm02_area_handle.az5_c_06, "az5_c_06_rise", 1, false, true)
      elseif dm02_in_high == false and false == false then
        az5_c_06_move_task = dm_areaAnimate(dm02_area_handle.az5_c_06, "az5_c_06_drop", 1, false, true)
      end
      if az5_c_06_move_task ~= nil then
        while az5_c_06_move_task:isRunning() do
          wait()
        end
        az5_c_06_move_task:abort()
        az5_c_06_move_task = nil
      else
        wait()
      end
    end
  end)
end
function spinner_midin_move()
  spinner_midin_move_task = invokeTask(function()
    dm02_area_handle.az5_c_05:setMoveAnimMode("parent")
    az5_c_05_root_move_task = dm_areaAnimate(dm02_area_handle.az5_c_05_root, "az5_c_05_spin", 0.15, true, true)
    while true do
      if dm02_midin_high == true and false == false then
        az5_c_05_move_task = dm_areaAnimate(dm02_area_handle.az5_c_05, "az5_c_05_rise", 1, false, true)
      elseif dm02_midin_high == false and false == false then
        az5_c_05_move_task = dm_areaAnimate(dm02_area_handle.az5_c_05, "az5_c_05_drop", 1, false, true)
      end
      if az5_c_05_move_task ~= nil then
        while az5_c_05_move_task:isRunning() do
          wait()
        end
        az5_c_05_move_task:abort()
        az5_c_05_move_task = nil
      else
        wait()
      end
    end
  end)
end
function spinner_middle_move()
  spinner_middle_move_task = invokeTask(function()
    dm02_area_handle.az5_c_04:setMoveAnimMode("parent")
    az5_c_04_root_move_task = dm_areaAnimate(dm02_area_handle.az5_c_04_root, "az5_c_04_spin", 0.125, true, true)
    while true do
      if dm02_middle_high == true and false == false then
        az5_c_04_move_task = dm_areaAnimate(dm02_area_handle.az5_c_04, "az5_c_04_rise", 1, false, true)
      elseif dm02_middle_high == false and false == false then
        az5_c_04_move_task = dm_areaAnimate(dm02_area_handle.az5_c_04, "az5_c_04_drop", 1, false, true)
      end
      if az5_c_04_move_task ~= nil then
        while az5_c_04_move_task:isRunning() do
          wait()
        end
        az5_c_04_move_task:abort()
        az5_c_04_move_task = nil
      else
        wait()
      end
    end
  end)
end
function spinner_out_move()
  spinner_out_move_task = invokeTask(function()
    print("spinner_out_move start")
    dm02_area_handle.az5_c_03:setMoveAnimMode("parent")
    az5_c_03_root_move_task = dm_areaAnimate(dm02_area_handle.az5_c_03_root, "az5_c_03_spin", 0.1, true, true)
    while true do
      if dm02_out_high == true and false == false then
        az5_c_03_move_task = dm_areaAnimate(dm02_area_handle.az5_c_03, "az5_c_03_rise", 1, false, true)
      elseif dm02_out_high == false and false == false then
        az5_c_03_move_task = dm_areaAnimate(dm02_area_handle.az5_c_03, "az5_c_03_drop", 1, false, true)
      end
      if az5_c_03_move_task ~= nil then
        while az5_c_03_move_task:isRunning() do
          wait()
        end
        az5_c_03_move_task:abort()
        az5_c_03_move_task = nil
      else
        wait()
      end
    end
  end)
end
function dm02_zaza_update()
  local L0_191
  while true do
    L0_191 = dm02_zaza_arrive
    if L0_191 == false then
      L0_191 = dm02_zaza_panic_task
      if L0_191 ~= nil then
        L0_191 = dm02_zaza_panic_task
        L0_191 = L0_191.isRunning
        L0_191 = L0_191(L0_191)
        if L0_191 == false then
          L0_191 = dm02_zaza_panic_task
          L0_191 = L0_191.abort
          L0_191(L0_191)
          dm02_zaza_panic_task = nil
        end
      end
      L0_191 = dm02_zaza_move_task
      if L0_191 ~= nil then
        L0_191 = dm02_zaza_move_task
        L0_191 = L0_191.isRunning
        L0_191 = L0_191(L0_191)
        if L0_191 == false then
          L0_191 = dm02_zaza_move_task
          L0_191 = L0_191.abort
          L0_191(L0_191)
          dm02_zaza_move_task = nil
        end
      end
      L0_191 = dm02_zaza_captured
      if L0_191 then
        L0_191 = StageReset
        L0_191("dm02_02021")
      else
        L0_191 = dm02_zaza_panic_task
        if L0_191 ~= nil then
          L0_191 = dm02_zaza_panic_task
          L0_191 = L0_191.isRunning
          L0_191 = L0_191(L0_191)
        elseif L0_191 == false then
          L0_191 = findWarningEnemy
          L0_191 = L0_191(dm02_zaza_landname)
          if L0_191 ~= nil then
            print("Zaza is panicking at " .. L0_191)
            Fn_captionView("dm02_02004")
            _trophy_41_attainable = false
            zaza_run(dm02_zaza_landname, L0_191)
          end
        end
      end
      L0_191 = wait
      L0_191()
    end
  end
end
function zaza_jump_wait(A0_192)
  wait()
  while dm02_zaza_area_sensor[A0_192] == true do
    if dm02_zaza_jump_caption_long < Fn_getDistanceToPlayer(dm02_zaza_puppet) then
      if false == false and findWarningEnemy(dm02_zaza_landname) == nil then
        Fn_captionView("dm02_02025")
      end
    else
    end
    if false == false and findJumpEnemy(A0_192) ~= nil then
      if false == false and findWarningEnemy(dm02_zaza_landname) == nil then
        Fn_captionView("dm02_02026")
      end
    else
    end
    if false == false and false == false and dm02_zaza_wait == true then
      break
    end
    wait()
  end
  invokeTask(function()
    local L0_193, L1_194, L2_195, L3_196, L4_197, L5_198, L6_199, L7_200, L8_201
    L0_193 = 0
    L1_194 = string
    L1_194 = L1_194.match
    L2_195 = A0_192
    L3_196 = "([A-Za-z]+)_[0-9]+"
    L1_194 = L1_194(L2_195, L3_196)
    if L1_194 == "out" then
      L0_193 = 2
    elseif L1_194 == "middle" then
      L0_193 = -6
    elseif L1_194 == "midin" then
      L0_193 = 6
    elseif L1_194 == "in" then
      L0_193 = -6
    elseif L1_194 == "ark" then
      L0_193 = 2
    end
    L1_194 = findGameObject2
    L2_195 = "Node"
    L3_196 = "locator2_"
    L4_197 = A0_192
    L5_198 = "_jump"
    L3_196 = L3_196 .. L4_197 .. L5_198
    L1_194 = L1_194(L2_195, L3_196)
    L2_195 = findGameObject2
    L3_196 = "Node"
    L4_197 = "locator2_ark"
    L2_195 = L2_195(L3_196, L4_197)
    L4_197 = L1_194
    L3_196 = L1_194.getParent
    L3_196 = L3_196(L4_197)
    L5_198 = L3_196
    L4_197 = L3_196.appendChild
    L6_199 = _jump_distination_sensor
    L4_197(L5_198, L6_199)
    while true do
      L5_198 = L1_194
      L4_197 = L1_194.getWorldPos
      L4_197 = L4_197(L5_198)
      L6_199 = L2_195
      L5_198 = L2_195.getWorldPos
      L5_198 = L5_198(L6_199)
      L6_199 = dm02_zaza_puppet
      L7_200 = L6_199
      L6_199 = L6_199.getWorldPos
      L6_199 = L6_199(L7_200)
      L7_200 = Fn_get_distance
      L8_201 = Vector
      L8_201 = L8_201(L4_197.x, 0, L4_197.z)
      L7_200 = L7_200(L8_201, Vector(L5_198.x, 0, L5_198.z))
      L8_201 = NormalizeVector
      L8_201 = L8_201(Vector(L6_199.x, 0, L6_199.z))
      L8_201 = L8_201 * L7_200
      L8_201 = YRotQuat(Deg2Rad(L0_193)):Apply(L8_201) + L5_198
      L8_201.y = L4_197.y
      _jump_distination_sensor:setWorldPos(L8_201)
      wait()
    end
  end):abort()
  if true == false then
    _jump_distination_sensor:leaveFromParent()
    _jump_distination_sensor:setPos(0, 0, 0)
  end
  return true
end
function cubesensor2_out_01_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.out_01 = true
    if zaza_jump_wait("out_01") then
      Fn_sensorOff("cubesensor2_out_01")
      Fn_sensorOff("cubesensor2_out_02")
      Fn_sensorOff("cubesensor2_out_03")
      Fn_sensorOff("cubesensor2_out_04")
      dm02_out_high = false
      dm02_middle_high = true
      if dm02_gem_display_middle == false then
        dm02_gem_display_middle = true
        setActiveMemoryDebris("middle_01")
        setActiveMemoryDebris("middle_02")
        setActiveMemoryDebris("middle_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("out_01")
    end
  end)
end
function cubesensor2_out_02_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.out_02 = true
    if zaza_jump_wait("out_02") then
      Fn_sensorOff("cubesensor2_out_01")
      Fn_sensorOff("cubesensor2_out_02")
      Fn_sensorOff("cubesensor2_out_03")
      Fn_sensorOff("cubesensor2_out_04")
      dm02_out_high = false
      dm02_middle_high = true
      if dm02_gem_display_middle == false then
        dm02_gem_display_middle = true
        setActiveMemoryDebris("middle_01")
        setActiveMemoryDebris("middle_02")
        setActiveMemoryDebris("middle_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("out_02")
    end
  end)
end
function cubesensor2_out_03_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.out_03 = true
    if zaza_jump_wait("out_03") then
      Fn_sensorOff("cubesensor2_out_01")
      Fn_sensorOff("cubesensor2_out_02")
      Fn_sensorOff("cubesensor2_out_03")
      Fn_sensorOff("cubesensor2_out_04")
      dm02_out_high = false
      dm02_middle_high = true
      if dm02_gem_display_middle == false then
        dm02_gem_display_middle = true
        setActiveMemoryDebris("middle_01")
        setActiveMemoryDebris("middle_02")
        setActiveMemoryDebris("middle_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("out_03")
    end
  end)
end
function cubesensor2_out_04_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.out_04 = true
    if zaza_jump_wait("out_04") then
      Fn_sensorOff("cubesensor2_out_01")
      Fn_sensorOff("cubesensor2_out_02")
      Fn_sensorOff("cubesensor2_out_03")
      Fn_sensorOff("cubesensor2_out_04")
      dm02_out_high = false
      dm02_middle_high = true
      if dm02_gem_display_middle == false then
        dm02_gem_display_middle = true
        setActiveMemoryDebris("middle_01")
        setActiveMemoryDebris("middle_02")
        setActiveMemoryDebris("middle_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("out_04")
      Fn_sensorOff("cubesensor2_out_04")
    end
  end)
end
function cubesensor2_middle_01_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.middle_01 = true
    if zaza_jump_wait("middle_01") then
      Fn_sensorOff("cubesensor2_middle_01")
      Fn_sensorOff("cubesensor2_middle_02")
      Fn_sensorOff("cubesensor2_middle_03")
      dm02_out_high = true
      dm02_middle_high = false
      dm02_midin_high = true
      if dm02_gem_display_midin == false then
        dm02_gem_display_midin = true
        setActiveMemoryDebris("midin_01")
        setActiveMemoryDebris("midin_02")
        setActiveMemoryDebris("midin_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("middle_01")
    end
  end)
end
function cubesensor2_middle_02_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.middle_02 = true
    if zaza_jump_wait("middle_02") then
      Fn_sensorOff("cubesensor2_middle_01")
      Fn_sensorOff("cubesensor2_middle_02")
      Fn_sensorOff("cubesensor2_middle_03")
      dm02_out_high = true
      dm02_middle_high = false
      dm02_midin_high = true
      if dm02_gem_display_midin == false then
        dm02_gem_display_midin = true
        setActiveMemoryDebris("midin_01")
        setActiveMemoryDebris("midin_02")
        setActiveMemoryDebris("midin_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("middle_02")
    end
  end)
end
function cubesensor2_middle_03_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.middle_03 = true
    if zaza_jump_wait("middle_03") then
      Fn_sensorOff("cubesensor2_middle_01")
      Fn_sensorOff("cubesensor2_middle_02")
      Fn_sensorOff("cubesensor2_middle_03")
      dm02_out_high = true
      dm02_middle_high = false
      dm02_midin_high = true
      if dm02_gem_display_midin == false then
        dm02_gem_display_midin = true
        setActiveMemoryDebris("midin_01")
        setActiveMemoryDebris("midin_02")
        setActiveMemoryDebris("midin_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("middle_03")
    end
  end)
end
function cubesensor2_midin_01_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.midin_01 = true
    if zaza_jump_wait("midin_01") then
      Fn_sensorOff("cubesensor2_midin_01")
      Fn_sensorOff("cubesensor2_midin_02")
      Fn_sensorOff("cubesensor2_midin_03")
      dm02_middle_high = true
      dm02_midin_high = false
      dm02_in_high = true
      if dm02_gem_display_in == false then
        dm02_gem_display_in = true
        setActiveMemoryDebris("in_01")
        setActiveMemoryDebris("in_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("midin_01")
    end
  end)
end
function cubesensor2_midin_02_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.midin_02 = true
    if zaza_jump_wait("midin_02") then
      Fn_sensorOff("cubesensor2_midin_01")
      Fn_sensorOff("cubesensor2_midin_02")
      Fn_sensorOff("cubesensor2_midin_03")
      dm02_middle_high = true
      dm02_midin_high = false
      dm02_in_high = true
      if dm02_gem_display_in == false then
        dm02_gem_display_in = true
        setActiveMemoryDebris("in_01")
        setActiveMemoryDebris("in_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("midin_02")
    end
  end)
end
function cubesensor2_midin_03_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.midin_03 = true
    if zaza_jump_wait("midin_03") then
      Fn_sensorOff("cubesensor2_midin_01")
      Fn_sensorOff("cubesensor2_midin_02")
      Fn_sensorOff("cubesensor2_midin_03")
      dm02_middle_high = true
      dm02_midin_high = false
      dm02_in_high = true
      if dm02_gem_display_in == false then
        dm02_gem_display_in = true
        setActiveMemoryDebris("in_01")
        setActiveMemoryDebris("in_03")
      end
      Fn_captionView("dm02_02003")
      zaza_jump("midin_03")
    end
  end)
end
function cubesensor2_in_01_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.in_01 = true
    if zaza_jump_wait("in_01") then
      Fn_sensorOff("cubesensor2_in_01")
      Fn_sensorOff("cubesensor2_in_02")
      Fn_sensorOff("cubesensor2_in_03")
      dm02_midin_high = true
      dm02_in_high = false
      Fn_captionView("dm02_02003")
      zaza_jump("in_01")
    end
  end)
end
function cubesensor2_in_02_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.in_02 = true
    if zaza_jump_wait("in_02") then
      Fn_sensorOff("cubesensor2_in_01")
      Fn_sensorOff("cubesensor2_in_02")
      Fn_sensorOff("cubesensor2_in_03")
      dm02_midin_high = true
      dm02_in_high = false
      Fn_captionView("dm02_02003")
      zaza_jump("in_02")
    end
  end)
end
function cubesensor2_in_03_OnEnter()
  invokeTask(function()
    dm02_zaza_area_sensor.in_03 = true
    if zaza_jump_wait("in_03") then
      Fn_sensorOff("cubesensor2_in_01")
      Fn_sensorOff("cubesensor2_in_02")
      Fn_sensorOff("cubesensor2_in_03")
      dm02_midin_high = true
      dm02_in_high = false
      Fn_captionView("dm02_02003")
      zaza_jump("in_03")
    end
  end)
end
function cubesensor2_zaza_land_OnLeave(A0_202, A1_203)
  if A1_203:getName() == "zaza_01" and dm02_zaza_jumping == false then
    dm02_zaza_area_sensor[string.match(A0_202:getName(), "cubesensor2_([A-Za-z]+_[0-9]+)")] = false
  end
end
function spheresensor2_ark_01_OnEnter()
  invokeTask(function()
    local L0_204, L1_205
    L0_204 = dm02_zaza_area_sensor
    L0_204.ark_01 = true
    L0_204 = zaza_jump_wait
    L1_205 = "ark_01"
    L0_204 = L0_204(L1_205)
    if L0_204 then
      dm02_zaza_jumping = true
      L0_204 = print
      L1_205 = "Zaza Jumps to ark_01"
      L0_204(L1_205)
      L0_204 = Fn_sensorOff
      L1_205 = "spheresensor2_ark_01"
      L0_204(L1_205)
      L0_204 = Fn_captionView
      L1_205 = "dm02_02003"
      L0_204(L1_205)
      L0_204 = _jump_distination_sensor
      L1_205 = L0_204
      L0_204 = L0_204.getName
      L0_204 = L0_204(L1_205)
      L1_205 = {}
      L1_205.anim_in = DM02_ZAZA_MOTION.jump_00
      L1_205.anim_lp = DM02_ZAZA_MOTION.fall_00
      L1_205.anim_out = DM02_ZAZA_MOTION.land_00
      L1_205.anim_stay = "stay_00"
      L1_205.height = 1
      Fn_findNpc("zaza_01"):jump(L0_204, L1_205)
      while not Fn_findNpc("zaza_01"):isJumpEnd() do
        if 0 > 90 then
          Fn_warpNpc("zaza_01", L0_204)
          Fn_appendNpcArea("zaza_01", L0_204)
          break
        end
        wait()
      end
      dm02_zaza_jumping = false
      replaceNode("locator2_ark_01_pos01", dm02_zaza_puppet:getWorldPos(), "locator2_ark")
      zaza_move("locator2_ark_01_pos01", true)
      dm02_in_high = true
    end
  end)
end
function spheresensor2_ark_01_OnLeave(A0_206)
  dm02_zaza_area_sensor.ark_01 = false
end
function spheresensor2_jump_collector_OnEnter(A0_207, A1_208)
  if string.match(A1_208:getName(), "collector_([A-Za-z]+_[0-9]+)_[A-Za-z0-9]+") ~= nil then
    dm02_enemy_jump[A1_208:getName()] = string.match(A1_208:getName(), "collector_([A-Za-z]+_[0-9]+)_[A-Za-z0-9]+")
  end
end
function spheresensor2_jump_collector_OnLeave(A0_209, A1_210)
  if string.match(A1_210:getName(), "collector_([A-Za-z]+_[0-9]+)_[A-Za-z0-9]+") ~= nil then
    dm02_enemy_jump[A1_210:getName()] = nil
  end
end
function spheresensor2_collector1_OnEnter(A0_211, A1_212)
  if string.match(A1_212:getName(), "collector_([A-Za-z]+_[0-9]+)_[A-Za-z0-9]+") ~= nil then
    dm02_zaza_warning[A1_212:getName()] = string.match(A1_212:getName(), "collector_([A-Za-z]+_[0-9]+)_[A-Za-z0-9]+")
  end
end
function spheresensor2_collector2_OnEnter(A0_213, A1_214)
  local L2_215, L3_216
  L2_215 = string
  L2_215 = L2_215.match
  L3_216 = A1_214.getName
  L3_216 = L3_216(A1_214)
  L2_215 = L2_215(L3_216, "collector_([A-Za-z]+_[0-9]+)_[A-Za-z0-9]+")
  if L2_215 ~= nil then
    L3_216 = dm02_zaza_jumping
    if L3_216 == false then
      L3_216 = A1_214.getName
      L3_216 = L3_216(A1_214)
      if dm02_zaza_landname == L2_215 and _enemy_state[L3_216] ~= nil and _enemy_state[L3_216] ~= ENM_STATE_DEAD and string.match(L3_216, "collector_[A-Za-z]+_[0-9]+_([A-Za-z]+)[0-9]+") == "up" then
        dm02_zaza_captured = true
      end
    end
  end
end
function zaza_jump(A0_217)
  local L1_218, L2_219, L3_220, L4_221, L5_222
  dm02_zaza_wait = false
  L1_218 = 1
  L2_219 = nil
  L3_220 = 0
  while true do
    L4_221 = findGameObject2
    L5_222 = "Node"
    L4_221 = L4_221(L5_222, "locator2_" .. A0_217 .. "_pos" .. string.format("%02d", L1_218))
    if L4_221 ~= nil then
      L5_222 = Fn_get_distance
      L5_222 = L5_222(dm02_zaza_puppet:getWorldPos(), L4_221:getWorldPos())
      if L2_219 == nil or L3_220 > L5_222 then
        L2_219 = L4_221
        L3_220 = L5_222
      end
      L1_218 = L1_218 + 1
    end
  end
  if L2_219 ~= nil then
    dm02_zaza_jumping = true
    L4_221 = print
    L5_222 = "Zaza Jumps to "
    L5_222 = L5_222 .. A0_217
    L4_221(L5_222)
    dm02_zaza_landname = A0_217
    L4_221 = "locator2_"
    L5_222 = A0_217
    L4_221 = L4_221 .. L5_222 .. "_pos01"
    dm02_zaza_checkpoint = L4_221
    L4_221 = _jump_distination_sensor
    L5_222 = L4_221
    L4_221 = L4_221.getName
    L4_221 = L4_221(L5_222)
    L5_222 = {}
    L5_222.anim_in = DM02_ZAZA_MOTION.jump_00
    L5_222.anim_lp = DM02_ZAZA_MOTION.fall_00
    L5_222.anim_out = DM02_ZAZA_MOTION.land_00
    L5_222.anim_stay = "stay_00"
    L5_222.height = 1
    Fn_findNpc("zaza_01"):jump(L4_221, L5_222)
    while not Fn_findNpc("zaza_01"):isJumpEnd() do
      if 0 > 90 then
        Fn_warpNpc("zaza_01", L4_221)
        Fn_appendNpcArea("zaza_01", L4_221)
        break
      end
      wait()
    end
    dm02_zaza_jumping = false
    zaza_move(dm02_zaza_checkpoint, true)
  end
end
function zaza_move(A0_223, A1_224, A2_225)
  local L3_226
  L3_226 = print
  L3_226("zaza_move start.." .. A0_223)
  L3_226 = dm02_zaza_move_task
  if L3_226 ~= nil then
    L3_226 = dm02_zaza_move_task
    L3_226 = L3_226.abort
    L3_226(L3_226)
    dm02_zaza_move_task = nil
  end
  dm02_zaza_wait = false
  L3_226 = {}
  L3_226.checkpoint = A0_223
  L3_226.jump_point = A1_224
  if A2_225 ~= nil then
    L3_226.end_motion = A2_225
  else
    L3_226.end_motion = "stay"
  end
  L3_226.move_task = nil
  function L3_226.update(A0_227)
    local L1_228, L2_229
    L1_228 = Fn_moveNpc
    L2_229 = "zaza_01"
    L1_228 = L1_228(L2_229, {
      A0_227.checkpoint
    }, {arrivedLength = 0, runLength = -1})
    A0_227.move_task = L1_228
    while true do
      L1_228 = A0_227.move_task
      L2_229 = L1_228
      L1_228 = L1_228.isRunning
      L1_228 = L1_228(L2_229)
      if L1_228 then
        L1_228 = wait
        L1_228()
      end
    end
    L1_228 = A0_227.jump_point
    if L1_228 == true then
      L1_228 = findGameObject2
      L2_229 = "Node"
      L1_228 = L1_228(L2_229, A0_227.checkpoint)
      L2_229 = L1_228.getWorldTransform
      L2_229 = L2_229(L1_228)
      L2_229 = L2_229 + L2_229(L1_228):Apply(Vector(0, 0, 5))
      wait()
      Fn_turnNpc("zaza_01", L2_229)
      dm02_zaza_wait = true
    end
  end
  function L3_226.destractor(A0_230)
    if A0_230.move_task ~= nil then
      A0_230.move_task:abort()
      A0_230.move_task = nil
    end
    Fn_playMotionNpc("zaza_01", A0_230.end_motion, false)
  end
  dm02_zaza_move_task = RAC_InvokeTaskWithDestractor(L3_226.update, L3_226.destractor, L3_226)
end
function zaza_run(A0_231, A1_232)
  local L2_233
  L2_233 = print
  L2_233("zaza_run start.." .. A0_231)
  L2_233 = dm02_zaza_panic_task
  if L2_233 ~= nil then
    L2_233 = dm02_zaza_panic_task
    L2_233 = L2_233.abort
    L2_233(L2_233)
    dm02_zaza_panic_task = nil
  else
    L2_233 = dm02_zaza_move_task
    if L2_233 ~= nil then
      L2_233 = dm02_zaza_move_task
      L2_233 = L2_233.abort
      L2_233(L2_233)
      dm02_zaza_move_task = nil
    end
  end
  L2_233 = {}
  L2_233.land_name = A0_231
  function L2_233.update(A0_234)
    local L1_235, L2_236, L3_237, L4_238, L5_239, L6_240, L7_241
    L1_235 = nil
    while true do
      L2_236, L3_237 = nil, nil
      for L7_241, _FORV_8_ in L4_238(L5_239) do
        if findGameObject2("Puppet", L7_241) ~= nil and _FORV_8_ == A0_234.land_name and string.match(L7_241, "collector_[A-Za-z]+_[0-9]+_([A-Za-z]+)[0-9]+") == "up" and _enemy_state[L7_241] ~= nil and _enemy_state[L7_241] ~= ENM_STATE_DEAD and (L3_237 == nil or L3_237 > Fn_get_distance(dm02_zaza_puppet:getWorldPos(), findGameObject2("Puppet", L7_241):getWorldPos())) then
          L3_237, L2_236 = Fn_get_distance(dm02_zaza_puppet:getWorldPos(), findGameObject2("Puppet", L7_241):getWorldPos()), findGameObject2("Puppet", L7_241)
        end
      end
      if L2_236 ~= nil then
        if not L4_238 then
          while true do
            L7_241 = findGameObject2
            L7_241 = L7_241("Node", "locator2_" .. A0_234.land_name .. "_pos" .. string.format("%02d", L6_240))
            if L7_241 ~= nil then
              if Fn_get_distance(dm02_zaza_puppet:getWorldPos(), L7_241:getWorldPos()) > 0.3 and Fn_get_distance(dm02_zaza_puppet:getWorldPos(), L7_241:getWorldPos()) < Fn_get_distance(L2_236:getWorldPos(), L7_241:getWorldPos()) and L3_237 < Fn_get_distance(L2_236:getWorldPos(), L7_241:getWorldPos()) and (L4_238 == nil or L5_239 == nil or L5_239 > Fn_get_distance(dm02_zaza_puppet:getWorldPos(), L7_241:getWorldPos())) then
              end
            end
          end
          if L4_238 ~= nil then
            L7_241 = L4_238.getName
            L7_241 = L7_241(L4_238)
            if L1_235 ~= L7_241 then
              L7_241 = L4_238.getName
              L7_241 = L7_241(L4_238)
              L1_235 = L7_241
              L7_241 = print
              L7_241("Zaza Escapes to " .. L1_235 .. " From " .. L2_236:getName())
              L7_241 = zaza_move
              L7_241(L1_235, false, DM02_ZAZA_MOTION.scared_00)
            end
          elseif L1_235 ~= nil and L4_238 == nil then
            L1_235 = nil
            L7_241 = dm02_zaza_move_task
            if L7_241 ~= nil then
              L7_241 = dm02_zaza_move_task
              L7_241 = L7_241.abort
              L7_241(L7_241)
              dm02_zaza_move_task = nil
            end
            L7_241 = print
            L7_241("Zaza Can't Escape From " .. L2_236:getName())
          end
        end
      else
        break
      end
      L4_238()
    end
    L2_236 = Fn_captionView
    L3_237 = "dm02_02022"
    L2_236(L3_237)
    L2_236 = zaza_move
    L3_237 = dm02_zaza_checkpoint
    L2_236(L3_237, L4_238)
    while true do
      L2_236 = dm02_zaza_move_task
      if L2_236 ~= nil then
        L2_236 = dm02_zaza_move_task
        L3_237 = L2_236
        L2_236 = L2_236.isRunning
        L2_236 = L2_236(L3_237)
      end
      if L2_236 then
        L2_236 = wait
        L2_236()
      end
    end
  end
  function L2_233.destractor(A0_242)
    if dm02_zaza_move_task ~= nil then
      dm02_zaza_move_task:abort()
      dm02_zaza_move_task = nil
    end
  end
  dm02_zaza_wait = false
  dm02_zaza_panic_task = RAC_InvokeTaskWithDestractor(L2_233.update, L2_233.destractor, L2_233)
end
function spheresensor2_collector1_OnLeave(A0_243, A1_244)
end
function spheresensor2_collector2_OnLeave(A0_245, A1_246)
end
function pccubesensor2_outrange_OnLeave()
  invokeTask(function()
    StageReset("dm02_02007")
  end)
end
function cubesensor2_outrange_OnLeave(A0_247, A1_248)
  local L2_249, L3_250, L4_251, L5_252, L6_253, L7_254, L8_255, L9_256, L10_257, L11_258, L12_259, L13_260, L14_261, L15_262
  L3_250 = A1_248
  L2_249 = A1_248.getName
  L2_249 = L2_249(L3_250)
  if L2_249 == "zaza_01" then
    L3_250 = dm02_zaza_jumping
    if L3_250 == false then
      L3_250 = invokeTask
      L3_250(L4_251)
    end
  else
    L3_250 = false
    for L7_254, L8_255 in L4_251(L5_252) do
      L9_256 = L8_255.getSpecTable
      L9_256 = L9_256(L10_257)
      for L13_260, L14_261 in L10_257(L11_258) do
        L15_262 = L14_261.name
        if L15_262 == L2_249 then
          L15_262 = A1_248.getBrain
          L15_262 = L15_262(A1_248)
          if L15_262 ~= nil then
            RAC_createEffect({
              eff_name = "ef_gcl_dth",
              world_pos = A1_248:getWorldTransform()
            })
            _enmgen_tbl[L7_254]:requestEnemyKill(L15_262)
            enmgen2_onObjectAsh(_enmgen_tbl[L7_254], L15_262)
          end
          L3_250 = true
          break
        end
      end
      if L3_250 ~= true then
      end
    end
  end
end
function replaceNode(A0_263, A1_264, A2_265)
  local L3_266, L4_267, L5_268, L6_269, L7_270, L8_271, L9_272
  L3_266 = _findObjectHandle
  L4_267 = A0_263
  L3_266 = L3_266(L4_267)
  L4_267 = _findObjectHandle
  L5_268 = A2_265
  L4_267 = L4_267(L5_268)
  L6_269 = L3_266
  L5_268 = L3_266.getWorldPos
  L5_268 = L5_268(L6_269)
  L7_270 = L4_267
  L6_269 = L4_267.getWorldPos
  L6_269 = L6_269(L7_270)
  L5_268 = L5_268 - L6_269
  L7_270 = L4_267
  L6_269 = L4_267.getWorldPos
  L6_269 = L6_269(L7_270)
  L6_269 = A1_264 - L6_269
  L5_268.y = 0
  L6_269.y = 0
  L8_271 = L5_268
  L7_270 = L5_268.Length
  L7_270 = L7_270(L8_271)
  L8_271 = NormalizeVector
  L9_272 = L6_269
  L8_271 = L8_271(L9_272)
  L9_272 = L8_271 * L7_270
  L9_272 = L9_272 + L4_267:getWorldPos()
  L9_272.y = L3_266:getWorldPos().y
  L3_266:setWorldPos(L9_272)
  L3_266:setForceMove()
end
function CollectorReset()
  for _FORV_3_, _FORV_4_ in pairs(_enmgen_tbl) do
    _enmgen_tbl[_FORV_3_]:requestAllEnemyKill()
    _enmgen_tbl[_FORV_3_]:requestSpawn()
  end
end
function StageReset(A0_273)
  local L1_274, L2_275, L3_276, L4_277, L5_278, L6_279
  L1_274()
  L1_274(L2_275, L3_276)
  if A0_273 ~= nil then
    L1_274(L2_275)
  end
  L1_274()
  dm02_zaza_wait = true
  dm02_zaza_warning = L1_274
  dm02_zaza_captured = false
  dm02_zaza_landname = "start"
  dm02_zaza_checkpoint = "locator2_zaza_02"
  if L1_274 ~= nil then
    L1_274(L2_275)
    dm02_zaza_panic_task = nil
  end
  if L1_274 ~= nil then
    L1_274(L2_275)
    dm02_zaza_move_task = nil
  end
  dm02_zaza_area_sensor = L1_274
  for L4_277, L5_278 in L1_274(L2_275) do
    L6_279 = findGameObject2
    L6_279 = L6_279("Sensor", "cubesensor2_" .. L5_278)
    if L6_279 ~= nil then
      Fn_sensorOn(L6_279)
    end
  end
  L1_274(L2_275)
  L1_274()
  L1_274()
  L1_274(L2_275)
  dm02_zaza_checkpoint = "locator2_zaza_02"
  L4_277 = false
  L1_274(L2_275, L3_276, L4_277)
  L1_274(L2_275, L3_276)
  L1_274(L2_275, L3_276)
  L1_274(L2_275, L3_276)
  L1_274()
  L1_274()
  L1_274(L2_275, L3_276)
end
function createVitalGem()
  local L0_280, L1_281
  L0_280 = 1
  L1_281 = releaseVitalGem
  L1_281()
  while true do
    L1_281 = "vital_gem_"
    L1_281 = L1_281 .. string.format("%02d", L0_280)
    if RAC_createGemAsync(L1_281, GEM_VITAL, "locator2_" .. L1_281) ~= nil then
      L0_280 = L0_280 + 1
    end
  end
end
function releaseVitalGem()
  local L0_282
  L0_282 = 1
  while findGameObject2("Node", "locator2_vital_gem_" .. string.format("%02d", L0_282)) ~= nil do
    if findGameObject2("Gem", "vital_gem_" .. string.format("%02d", L0_282)) ~= nil then
      findGameObject2("Gem", "vital_gem_" .. string.format("%02d", L0_282)):setVisible(false)
      findGameObject2("Gem", "vital_gem_" .. string.format("%02d", L0_282)):try_term()
    end
    L0_282 = L0_282 + 1
  end
end
function memoryDebrisGetCallback(A0_283)
  for _FORV_4_, _FORV_5_ in ipairs(MEMORY_DEBRIS_PARAM_TBL) do
    if _FORV_5_.memory_name == A0_283 then
      showExtraMemDebrisCaption()
      break
    end
  end
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__dm02) == 1 then
    for _FORV_5_ = #MEMORY_DEBRIS_PARAM_TBL, 1, -1 do
      if MEMORY_DEBRIS_PARAM_TBL[_FORV_5_].memory_name == A0_283 then
        if math.floor(GameDatabase:get(ggd.Savedata__EventFlags__dm02__flag03) / 2 ^ (_FORV_5_ - 1)) % 2 == 0 then
          HUD:counter99_99AddNum()
        end
        break
      end
    end
  end
end
function showExtraMemDebrisCaption()
  local L0_284
  L0_284 = {
    "dm02_02009",
    "dm02_02010",
    "dm02_02011",
    "dm02_02012",
    "dm02_02013",
    "dm02_02014",
    "dm02_02015",
    "dm02_02016",
    "dm02_02017",
    "dm02_02018",
    "dm02_02019",
    "dm02_02020",
    "dm02_02024"
  }
  if _extra_mem_debris_caption_idx <= #L0_284 then
    Fn_captionView(L0_284[_extra_mem_debris_caption_idx])
    _extra_mem_debris_caption_idx = _extra_mem_debris_caption_idx + 1
  end
end
function findWarningEnemy(A0_285)
  local L1_286, L2_287, L3_288, L4_289
  for L4_289, _FORV_5_ in L1_286(L2_287) do
    if _FORV_5_ == A0_285 and string.match(L4_289, "collector_[A-Za-z]+_[0-9]+_([A-Za-z]+)[0-9]+") == "up" and _enemy_state[L4_289] ~= nil and _enemy_state[L4_289] ~= ENM_STATE_DEAD then
      return L4_289
    end
  end
  return L1_286
end
function findJumpEnemy(A0_290)
  local L1_291, L2_292, L3_293, L4_294
  for L4_294, _FORV_5_ in L1_291(L2_292) do
    if _FORV_5_ == A0_290 and string.match(L4_294, "collector_[A-Za-z]+_[0-9]+_([A-Za-z]+)[0-9]+") == "up" and _enemy_state[L4_294] ~= nil and _enemy_state[L4_294] ~= ENM_STATE_DEAD then
      return L4_294
    end
  end
  return L1_291
end
function enmgen2_onEnter(A0_295)
  local L1_296, L2_297, L3_298
  L2_297 = A0_295
  L1_296 = A0_295.getName
  L1_296 = L1_296(L2_297)
  L2_297 = string
  L2_297 = L2_297.match
  L3_298 = L1_296
  L2_297 = L2_297(L3_298, "enmgen2_([A-Za-z]+_[0-9]+)_[0-9]+")
  L3_298 = RAC_getTailNumber
  L3_298 = L3_298(L1_296, 2)
  print("enmgen2_onEnter " .. L1_296 .. "(" .. L2_297 .. "-" .. L3_298 .. ")")
  A0_295:requestIdlingEnemy(false)
end
function enmgen2_onSpawn(A0_299, A1_300)
  local L2_301, L3_302, L4_303
  L3_302 = A0_299
  L2_301 = A0_299.getName
  L2_301 = L2_301(L3_302)
  L3_302 = string
  L3_302 = L3_302.match
  L4_303 = L2_301
  L3_302 = L3_302(L4_303, "enmgen2_([A-Za-z]+_[0-9]+)_[0-9]+")
  L4_303 = RAC_getTailNumber
  L4_303 = L4_303(L2_301, 2)
  print("enmgen2_onSpawn " .. L2_301 .. "(" .. L3_302 .. "-" .. L4_303 .. ")")
  A1_300:setEnableTarget(false)
  _enemy_state[A1_300:getName()] = ENM_STATE_PREPARE
end
function enmgen2_onObjectAsh(A0_304, A1_305)
  local L2_306, L3_307, L4_308, L5_309, L6_310
  L3_307 = A0_304
  L2_306 = A0_304.getName
  L2_306 = L2_306(L3_307)
  L3_307 = string
  L3_307 = L3_307.match
  L4_308 = L2_306
  L5_309 = "enmgen2_([A-Za-z]+_[0-9]+)_[0-9]+"
  L3_307 = L3_307(L4_308, L5_309)
  L4_308 = RAC_getTailNumber
  L5_309 = L2_306
  L6_310 = 2
  L4_308 = L4_308(L5_309, L6_310)
  L5_309 = print
  L6_310 = "enmgen2_onObjectAsh "
  L6_310 = L6_310 .. L2_306 .. "(" .. L3_307 .. "-" .. L4_308 .. ")"
  L5_309(L6_310)
  L6_310 = A1_305
  L5_309 = A1_305.getName
  L5_309 = L5_309(L6_310)
  L6_310 = findGameObject2
  L6_310 = L6_310("Puppet", L5_309)
  if L6_310 ~= nil then
    L6_310:getBrain():endScriptAction()
    if math.random(100) < 33 then
      print(L5_309 .. "_gem")
      RAC_createGemAsync(L5_309 .. "_gem", GEM_VITAL, L6_310)
    end
  end
  dm02_zaza_warning[L5_309] = nil
  dm02_enemy_jump[L5_309] = nil
  _enemy_state[L5_309] = ENM_STATE_DEAD
end
function enmgen2_onUpdate(A0_311)
  local L1_312, L2_313, L3_314, L4_315, L5_316, L6_317, L7_318, L8_319, L9_320
  L2_313 = A0_311
  L1_312 = A0_311.getName
  L1_312 = L1_312(L2_313)
  L2_313 = string
  L2_313 = L2_313.match
  L3_314 = L1_312
  L4_315 = "enmgen2_([A-Za-z]+_[0-9]+)_[0-9]+"
  L2_313 = L2_313(L3_314, L4_315)
  L3_314 = RAC_getTailNumber
  L4_315 = L1_312
  L5_316 = 2
  L3_314 = L3_314(L4_315, L5_316)
  L5_316 = A0_311
  L4_315 = A0_311.getSpecTable
  L4_315 = L4_315(L5_316)
  L5_316 = L4_315.spawnSet
  L5_316 = L5_316[1]
  L5_316 = L5_316.name
  L6_317 = findGameObject2
  L7_318 = "Puppet"
  L8_319 = L5_316
  L6_317 = L6_317(L7_318, L8_319)
  if L6_317 ~= nil then
    L7_318 = _enemy_state
    L7_318 = L7_318[L5_316]
    L8_319 = ENM_STATE_DEAD
  else
    if L7_318 == L8_319 then
      L7_318 = _enemy_state
      L7_318 = L7_318[L5_316]
      L8_319 = ENM_STATE_DEAD
      if L7_318 == L8_319 then
        L7_318 = dm02_respawn_task
        L7_318 = L7_318[L1_312]
        if L7_318 ~= nil then
          L7_318 = dm02_respawn_task
          L7_318 = L7_318[L1_312]
          L8_319 = L7_318
          L7_318 = L7_318.isRunning
          L7_318 = L7_318(L8_319)
        elseif not L7_318 then
          L7_318 = dm02_respawn_task
          L8_319 = invokeTask
          function L9_320()
            waitSeconds(dm02_rebirth_time)
            while dm02_zaza_landname == L2_313 do
              wait(2)
            end
            A0_311:requestSpawn()
          end
          L8_319 = L8_319(L9_320)
          L7_318[L1_312] = L8_319
        end
      end
  end
  else
    L7_318 = dm02_respawn_task
    L7_318 = L7_318[L1_312]
    if L7_318 ~= nil then
      L7_318 = dm02_respawn_task
      L7_318 = L7_318[L1_312]
      L8_319 = L7_318
      L7_318 = L7_318.abort
      L7_318(L8_319)
      L7_318 = dm02_respawn_task
      L7_318[L1_312] = nil
    end
    L8_319 = L6_317
    L7_318 = L6_317.getBrain
    L7_318 = L7_318(L8_319)
    L8_319 = _enemy_state
    L8_319 = L8_319[L5_316]
    L9_320 = ENM_STATE_PREPARE
    if L8_319 ~= L9_320 then
      L9_320 = L7_318
      L8_319 = L7_318.isReadyEnemy
      L8_319 = L8_319(L9_320)
      if L8_319 == false then
        L9_320 = L7_318
        L8_319 = L7_318.setEnableTarget
        L8_319(L9_320, false)
        L8_319 = _enemy_state
        L9_320 = ENM_STATE_PREPARE
        L8_319[L5_316] = L9_320
      end
    end
    L8_319 = _enemy_state
    L8_319 = L8_319[L5_316]
    L9_320 = ENM_STATE_PREPARE
    if L8_319 == L9_320 then
      L9_320 = L7_318
      L8_319 = L7_318.isReadyEnemy
      L8_319 = L8_319(L9_320)
      if L8_319 then
        L8_319 = _enemy_state
        L9_320 = ENM_STATE_PATROL
        L8_319[L5_316] = L9_320
      end
    else
      L8_319 = _enemy_state
      L8_319 = L8_319[L5_316]
      L9_320 = ENM_STATE_PATROL
      if L8_319 == L9_320 then
        L8_319 = Fn_getDistanceToPlayer
        L9_320 = L6_317
        L8_319 = L8_319(L9_320)
        if L8_319 < 10 then
          L8_319 = _enemy_state
          L9_320 = ENM_STATE_BATTLE_INIT
          L8_319[L5_316] = L9_320
        else
          L8_319 = dm02_zaza_landname
          if L8_319 == L2_313 then
            L8_319 = _enemy_state
            L9_320 = ENM_STATE_CHASE_INIT
            L8_319[L5_316] = L9_320
          else
            L9_320 = L7_318
            L8_319 = L7_318.isMoveEnd
            L8_319 = L8_319(L9_320)
            if L8_319 == true then
              L8_319 = {}
              L9_320 = 1
              while findGameObject2("Node", "locator2_" .. L2_313 .. "_collector" .. string.format("%02d", L3_314) .. "_" .. string.format("%02d", L9_320)) ~= nil do
                table.insert(L8_319, findGameObject2("Node", "locator2_" .. L2_313 .. "_collector" .. string.format("%02d", L3_314) .. "_" .. string.format("%02d", L9_320)):getName())
                L9_320 = L9_320 + 1
              end
              if #L8_319 > 0 then
                print("enmgen2_onUpdate " .. L1_312 .. "(" .. L2_313 .. "-" .. L3_314 .. ") Patroling")
                L7_318:move(L8_319, {invincible = false})
              end
            end
          end
        end
      else
        L8_319 = _enemy_state
        L8_319 = L8_319[L5_316]
        L9_320 = ENM_STATE_CHASE_INIT
        if L8_319 == L9_320 then
          L9_320 = L7_318
          L8_319 = L7_318.move
          L8_319(L9_320, {
            "spheresensor2_collector2"
          }, {invincible = false})
          L8_319 = _enemy_state
          L9_320 = ENM_STATE_CHASE
          L8_319[L5_316] = L9_320
        else
          L8_319 = _enemy_state
          L8_319 = L8_319[L5_316]
          L9_320 = ENM_STATE_CHASE
          if L8_319 == L9_320 then
            L8_319 = Fn_getDistanceToPlayer
            L9_320 = L6_317
            L8_319 = L8_319(L9_320)
            if L8_319 < 10 then
              L8_319 = _enemy_state
              L9_320 = ENM_STATE_BATTLE_INIT
              L8_319[L5_316] = L9_320
            else
              L8_319 = dm02_zaza_landname
              if L8_319 ~= L2_313 then
                L8_319 = _enemy_state
                L9_320 = ENM_STATE_PATROL
                L8_319[L5_316] = L9_320
              end
            end
          else
            L8_319 = _enemy_state
            L8_319 = L8_319[L5_316]
            L9_320 = ENM_STATE_BATTLE_INIT
            if L8_319 == L9_320 then
              L8_319 = print
              L9_320 = "enmgen2_onUpdate "
              L9_320 = L9_320 .. L1_312 .. "(" .. L2_313 .. "-" .. L3_314 .. ") Patroling"
              L8_319(L9_320)
              L9_320 = L7_318
              L8_319 = L7_318.endScriptAction
              L8_319(L9_320)
              L9_320 = L7_318
              L8_319 = L7_318.setEnableTarget
              L8_319(L9_320, true)
              L8_319 = _enemy_state
              L9_320 = ENM_STATE_BATTLE
              L8_319[L5_316] = L9_320
            else
              L8_319 = _enemy_state
              L8_319 = L8_319[L5_316]
              L9_320 = ENM_STATE_BATTLE
              if L8_319 == L9_320 then
                L8_319 = Fn_getDistanceToPlayer
                L9_320 = L6_317
                L8_319 = L8_319(L9_320)
                if L8_319 >= 30 then
                  L9_320 = L7_318
                  L8_319 = L7_318.setEnableTarget
                  L8_319(L9_320, false)
                  L8_319 = _enemy_state
                  L9_320 = ENM_STATE_PATROL
                  L8_319[L5_316] = L9_320
                end
              end
            end
          end
        end
      end
    end
  end
end
