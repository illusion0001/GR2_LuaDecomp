dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/dm04_common.lua")
FIELD_01 = 1
FIELD_02 = 2
FIELD_03 = 3
FIELD_04 = 4
FIELD_05 = 5
FIELD_06 = 6
FIELD_07 = 7
FIELD_08 = 8
FIELD_09 = 9
FIELD_MAX = FIELD_09
_enmgen_tenebria = nil
_enmgen_black_tbl = {}
_black_field_hdl_tbl = {}
_white_field_hdl_tbl = {}
_powerup_first_success = true
enmgen2_tenebria = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria",
      locator = "locator_tenebria",
      name = "tenebria",
      ai_spawn_option = "Tenebria/dm04_e"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica",
      locator = "locator_tenebria",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica",
      locator = "locator_tenebria",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica",
      locator = "locator_tenebria",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica",
      locator = "locator_tenebria",
      name = "call_tenebria_04"
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
  end,
  onObjectAsh = function(A0_8, A1_9)
  end
}
enmgen2_black_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b01_01",
      name = "blacknevi_01_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b01_02",
      name = "blacknevi_01_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_10, A1_11)
  end,
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onObjectDead = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
    A0_20:getSpecTable().dead_count = A0_20:getSpecTable().dead_count + 1
  end
}
enmgen2_black_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b02_01",
      name = "blacknevi_02_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b02_02",
      name = "blacknevi_02_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_22, A1_23)
  end,
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
  end,
  onObjectAsh = function(A0_32, A1_33)
    A0_32:getSpecTable().dead_count = A0_32:getSpecTable().dead_count + 1
  end
}
enmgen2_black_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b03_01",
      name = "blacknevi_03_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b03_02",
      name = "blacknevi_03_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_34, A1_35)
  end,
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().dead_count = A0_44:getSpecTable().dead_count + 1
  end
}
enmgen2_black_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b04_01",
      name = "blacknevi_04_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b04_02",
      name = "blacknevi_04_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_46, A1_47)
  end,
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
  end,
  onObjectAsh = function(A0_56, A1_57)
    A0_56:getSpecTable().dead_count = A0_56:getSpecTable().dead_count + 1
  end
}
enmgen2_black_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b05_01",
      name = "blacknevi_05_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b05_02",
      name = "blacknevi_05_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_58, A1_59)
  end,
  onUpdate = function(A0_60)
    local L1_61
  end,
  onEnter = function(A0_62)
    local L1_63
  end,
  onLeave = function(A0_64)
    local L1_65
  end,
  onObjectDead = function(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
    A0_68:getSpecTable().dead_count = A0_68:getSpecTable().dead_count + 1
  end
}
enmgen2_black_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b06_01",
      name = "blacknevi_06_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b06_02",
      name = "blacknevi_06_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_70, A1_71)
  end,
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
  end,
  onObjectAsh = function(A0_80, A1_81)
    A0_80:getSpecTable().dead_count = A0_80:getSpecTable().dead_count + 1
  end
}
enmgen2_black_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b07_01",
      name = "blacknevi_07_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b07_02",
      name = "blacknevi_07_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_82, A1_83)
  end,
  onUpdate = function(A0_84)
    local L1_85
  end,
  onEnter = function(A0_86)
    local L1_87
  end,
  onLeave = function(A0_88)
    local L1_89
  end,
  onObjectDead = function(A0_90, A1_91)
  end,
  onObjectAsh = function(A0_92, A1_93)
    A0_92:getSpecTable().dead_count = A0_92:getSpecTable().dead_count + 1
  end
}
enmgen2_black_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b08_01",
      name = "blacknevi_08_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b08_02",
      name = "blacknevi_08_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_94, A1_95)
  end,
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
  end,
  onObjectAsh = function(A0_104, A1_105)
    A0_104:getSpecTable().dead_count = A0_104:getSpecTable().dead_count + 1
  end
}
enmgen2_black_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b09_01",
      name = "blacknevi_09_01"
    },
    {
      type = "stalker_dark",
      locator = "locator_b09_02",
      name = "blacknevi_09_02"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  dead_count = 0,
  onSpawn = function(A0_106, A1_107)
  end,
  onUpdate = function(A0_108)
    local L1_109
  end,
  onEnter = function(A0_110)
    local L1_111
  end,
  onLeave = function(A0_112)
    local L1_113
  end,
  onObjectDead = function(A0_114, A1_115)
  end,
  onObjectAsh = function(A0_116, A1_117)
    A0_116:getSpecTable().dead_count = A0_116:getSpecTable().dead_count + 1
  end
}
function Initialize()
  local L0_118, L1_119, L2_120, L3_121
  _enmgen_tenebria = L0_118
  for L3_121 = 1, FIELD_MAX do
    _black_field_hdl_tbl[L3_121] = findGameObject2("GimmickBg", "bg2_field_b" .. string.format("%02d", L3_121))
    _white_field_hdl_tbl[L3_121] = findGameObject2("GimmickBg", "bg2_field_w" .. string.format("%02d", L3_121))
    _black_field_hdl_tbl[L3_121]:setActive(false)
    _white_field_hdl_tbl[L3_121]:setActive(true)
    _enmgen_black_tbl[L3_121] = findGameObject2("EnemyGenerator", "enmgen2_black_" .. string.format("%02d", L3_121))
  end
  L0_118(L1_119)
end
function Ingame()
  local L0_122, L1_123, L2_124, L3_125, L4_126, L5_127, L6_128, L7_129, L8_130
  L0_122 = Fn_userCtrlAllOff
  L0_122()
  L0_122 = _enmgen_tenebria
  L1_123 = L0_122
  L0_122 = L0_122.requestIdlingEnemy
  L2_124 = true
  L0_122(L1_123, L2_124)
  L0_122 = _enmgen_tenebria
  L1_123 = L0_122
  L0_122 = L0_122.requestSpawn
  L0_122(L1_123)
  L0_122 = findGameObject2
  L1_123 = "Puppet"
  L2_124 = "tenebria"
  L0_122 = L0_122(L1_123, L2_124)
  L1_123 = findGameObject2
  L2_124 = "EnemyBrain"
  L3_125 = "tenebria"
  L1_123 = L1_123(L2_124, L3_125)
  L2_124 = Fn_setBgmPoint
  L3_125 = "event"
  L4_126 = "boss"
  L2_124(L3_125, L4_126)
  L2_124 = Fn_missionStart
  L2_124()
  L2_124 = Fn_lookAtObjectWait
  L3_125 = "locator2_tenebria_view"
  L2_124(L3_125)
  L2_124 = Fn_kaiwaDemoView
  L3_125 = "dm04_00310k"
  L2_124(L3_125)
  L2_124 = Fn_missionView
  L3_125 = "dm04_04000"
  L2_124(L3_125)
  L2_124 = Fn_userCtrlOn
  L2_124()
  L2_124 = _enmgen_tenebria
  L3_125 = L2_124
  L2_124 = L2_124.requestIdlingEnemy
  L4_126 = false
  L2_124(L3_125, L4_126)
  L2_124 = HUD
  L3_125 = L2_124
  L2_124 = L2_124.createBossHpGauge
  L4_126 = {}
  L4_126.obj = L0_122
  L2_124 = L2_124(L3_125, L4_126)
  L4_126 = L2_124
  L3_125 = L2_124.setActive
  L3_125(L4_126, L5_127)
  L3_125 = invokeBossBattleEnemyRespawnTask
  L4_126 = _white_field_hdl_tbl
  L8_130 = false
  L3_125 = L3_125(L4_126, L5_127, L6_128, L7_129, L8_130)
  L4_126 = {}
  for L8_130 = 1, FIELD_MAX do
    L4_126[L8_130] = "locator2_powerup_pos_" .. string.format("%02d", L8_130)
  end
  L8_130 = _black_field_hdl_tbl
  repeat
    L6_128()
    L8_130 = L1_123.getHealth
    L8_130 = L8_130(L1_123)
    L8_130 = L8_130 / L1_123:getMaxHealth()
    L6_128(L7_129, L8_130)
  until L6_128 == true
  L6_128(L7_129)
  L6_128(L7_129)
  L3_125 = nil
  L6_128()
  if L6_128 == true then
    L8_130 = ggd
    L8_130 = L8_130.EventFlags__dm04__flag03
    if L6_128 ~= 1 then
      L8_130 = 43
      L6_128(L7_129, L8_130)
    end
  end
  L6_128()
  L6_128()
  L6_128()
  L6_128()
end
function Finalize()
  local L0_131, L1_132
end
function powerUpEventCallback(A0_133)
  if A0_133.eventType == "charge_start" then
    Fn_captionView(({
      "dm04_04002",
      "dm04_04003",
      "dm04_04004"
    })[RandI(1, #{
      "dm04_04002",
      "dm04_04003",
      "dm04_04004"
    })])
  elseif A0_133.eventType == "charge_result" then
    if A0_133.chargeResult == true then
      if _powerup_first_success == true then
        _powerup_first_success = false
        invokeTask(function()
          Fn_kaiwaDemoView("dm04_00318k")
          if GameDatabase:get(ggd.EventFlags__dm04__flag03) ~= 1 then
            HUD:info("dm04_info_05", false)
          end
        end)
      else
        Fn_captionView(({
          "dm04_04005",
          "dm04_04006",
          "dm04_04007"
        })[RandI(#{
          "dm04_04005",
          "dm04_04006",
          "dm04_04007"
        })])
      end
    else
      Fn_captionView(({
        "dm04_04008",
        "dm04_04009",
        "dm04_04010"
      })[RandI(1, #{
        "dm04_04008",
        "dm04_04009",
        "dm04_04010"
      })])
    end
  elseif A0_133.eventType == "power_down" then
    Fn_captionView(({
      "dm04_04011",
      "dm04_04012",
      "dm04_04013"
    })[RandI(1, #{
      "dm04_04011",
      "dm04_04012",
      "dm04_04013"
    })])
  end
end
function outrange_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("cro_260", 1)
    Fn_captionViewWait("dm04_04001")
  end)
end
