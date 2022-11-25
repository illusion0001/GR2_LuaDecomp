import("Font")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Debug/ShortcutKey/user_test_stage.lua")
dofile("/Game/TestScript/action_review_common.lua")
__enemy_gen = false
__enemy_cnt = {}
__enemy_num = 0
__enemy_set = 0
__group_cnt = 0
__enemy_cnt_view = 0
__time_cnt = 0
__gemtime_cnt = 0
__gemset = false
__ars_cat_warp = false
__ars_cat_warp_inrange = 1
enmgen2_battle_f_11 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_ene_f_111",
      name = "specialf111"
    },
    {
      type = "officer_rifle",
      locator = "locator_ene_f_111",
      name = "specialf112",
      target_vehicle = "specialf111"
    },
    {
      type = "mechsmall",
      locator = "locator_ene_f_113",
      name = "specialf113"
    },
    {
      type = "officer_rifle",
      locator = "locator_ene_f_113",
      name = "specialf114",
      target_vehicle = "specialf113"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_115",
      name = "specialf115"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_116",
      name = "specialf116"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_117",
      name = "specialf117"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_118",
      name = "specialf118"
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
  onObjectAsh = function(A0_6, A1_7)
    __enemy_cnt[11] = __enemy_cnt[11] - 1
    lowlife_gemset(A1_7)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_8, L1_9
    L0_8 = enmgen2_area_05
    L0_8 = L0_8.spawnSet
    L0_8 = #L0_8
    return L0_8
  end,
  getEnemyDeadNum = function()
    local L1_10
    L1_10 = enmgen2_area_05
    L1_10 = L1_10.enemyDeadNum
    return L1_10
  end,
  getEnemyName = function(A0_11)
    local L1_12
    L1_12 = enmgen2_area_05
    L1_12 = L1_12.spawnSet
    L1_12 = L1_12[A0_11]
    L1_12 = L1_12.name
    return L1_12
  end
}
enmgen2_battle_f_12 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_f_121",
      name = "specialf121"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_122",
      name = "specialf122"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_123",
      name = "specialf123"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_123",
      name = "specialf124"
    }
  },
  onUpdate = function(A0_13)
    local L1_14
  end,
  onEnter = function(A0_15)
    local L1_16
  end,
  onLeave = function(A0_17)
    local L1_18
  end,
  onObjectDead = function(A0_19, A1_20)
    __enemy_cnt[12] = __enemy_cnt[12] - 1
    lowlife_gemset(A1_20)
  end
}
enmgen2_battle_f_13 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_f_131",
      name = "specialf131"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_132",
      name = "specialf132"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_133",
      name = "specialf133"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_134",
      name = "specialf134"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_135",
      name = "specialf135"
    }
  },
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onObjectDead = function(A0_27, A1_28)
    __enemy_cnt[13] = __enemy_cnt[13] - 1
    lowlife_gemset(A1_28)
  end
}
enmgen2_battle_f_14 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_f_141",
      name = "specialf141"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_142",
      name = "specialf142"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_143",
      name = "specialf143"
    }
  },
  onUpdate = function(A0_29)
    local L1_30
  end,
  onEnter = function(A0_31)
    local L1_32
  end,
  onLeave = function(A0_33)
    local L1_34
  end,
  onObjectDead = function(A0_35, A1_36)
    __enemy_cnt[14] = __enemy_cnt[14] - 1
    lowlife_gemset(A1_36)
  end
}
enmgen2_battle_f_15 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_f_151",
      name = "specialf151"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_152",
      name = "specialf152"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_153",
      name = "specialf153"
    },
    {
      type = "runner",
      locator = "locator_ene_f_155",
      name = "specialf155"
    },
    {
      type = "runner",
      locator = "locator_ene_f_156",
      name = "specialf156"
    },
    {
      type = "runner",
      locator = "locator_ene_f_157",
      name = "specialf157"
    }
  },
  onUpdate = function(A0_37)
    local L1_38
  end,
  onEnter = function(A0_39)
    local L1_40
  end,
  onLeave = function(A0_41)
    local L1_42
  end,
  onObjectDead = function(A0_43, A1_44)
    __enemy_cnt[15] = __enemy_cnt[15] - 1
    lowlife_gemset(A1_44)
  end
}
enmgen2_battle_f_16 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_161",
      name = "specialf161"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_162",
      name = "specialf162"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_163",
      name = "specialf163"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_164",
      name = "specialf164"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_165",
      name = "specialf165"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_166",
      name = "specialf166"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_167",
      name = "specialf167"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_168",
      name = "specialf168"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_169",
      name = "specialf169"
    }
  },
  onUpdate = function(A0_45)
    local L1_46
  end,
  onEnter = function(A0_47)
    local L1_48
  end,
  onLeave = function(A0_49)
    local L1_50
  end,
  onObjectAsh = function(A0_51, A1_52)
    __enemy_cnt[16] = __enemy_cnt[16] - 1
    lowlife_gemset(A1_52)
  end
}
enmgen2_battle_f_17 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_f_171",
      name = "specialf171"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_172",
      name = "specialf172"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_173",
      name = "specialf173"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_174",
      name = "specialf174"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_175",
      name = "specialf175"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_176",
      name = "specialf176"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_177",
      name = "specialf177"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_178",
      name = "specialf178"
    },
    {
      type = "stalker",
      locator = "locator_ene_f_179",
      name = "specialf179"
    }
  },
  onUpdate = function(A0_53)
    local L1_54
  end,
  onEnter = function(A0_55)
    local L1_56
  end,
  onLeave = function(A0_57)
    local L1_58
  end,
  onObjectDead = function(A0_59, A1_60)
    __enemy_cnt[17] = __enemy_cnt[17] - 1
    lowlife_gemset(A1_60)
  end
}
enmgen2_battle_f_18 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_181",
      name = "specialf181"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_182",
      name = "specialf182"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_183",
      name = "specialf183"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_184",
      name = "specialf184"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_185",
      name = "specialf185"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_186",
      name = "specialf186"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_187",
      name = "specialf187"
    },
    {
      type = "soldier_rifle",
      locator = "locator_ene_f_188",
      name = "specialf188"
    }
  },
  onUpdate = function(A0_61)
    local L1_62
  end,
  onEnter = function(A0_63)
    local L1_64
  end,
  onLeave = function(A0_65)
    local L1_66
  end,
  onObjectAsh = function(A0_67, A1_68)
    __enemy_cnt[18] = __enemy_cnt[18] - 1
    lowlife_gemset(A1_68)
  end
}
enmgen2_battle_f_19 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_f_192",
      name = "specialf192"
    },
    {
      type = "giant",
      locator = "locator_ene_f_193",
      name = "specialf193"
    }
  },
  onUpdate = function(A0_69)
    local L1_70
  end,
  onEnter = function(A0_71)
    local L1_72
  end,
  onLeave = function(A0_73)
    local L1_74
  end,
  onObjectDead = function(A0_75, A1_76)
    __enemy_cnt[19] = __enemy_cnt[19] - 1
    lowlife_gemset(A1_76)
  end
}
enmgen2_battle_f_20 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_f_201",
      name = "specialf201"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_202",
      name = "specialf202"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_203",
      name = "specialf203"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_204",
      name = "specialf204"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_205",
      name = "specialf205"
    }
  },
  onUpdate = function(A0_77)
    local L1_78
  end,
  onEnter = function(A0_79)
    local L1_80
  end,
  onLeave = function(A0_81)
    local L1_82
  end,
  onObjectDead = function(A0_83, A1_84)
    __enemy_cnt[20] = __enemy_cnt[20] - 1
    lowlife_gemset(A1_84)
  end
}
enmgen2_battle_f_21 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_ene_f_211",
      name = "specialf211"
    },
    {
      type = "mechsmall",
      locator = "locator_ene_f_213",
      name = "specialf213"
    }
  },
  onUpdate = function(A0_85)
    local L1_86
  end,
  onEnter = function(A0_87)
    local L1_88
  end,
  onLeave = function(A0_89)
    local L1_90
  end,
  onObjectAsh = function(A0_91, A1_92)
    __enemy_cnt[21] = __enemy_cnt[21] - 1
    lowlife_gemset(A1_92)
  end
}
enmgen2_battle_f_22 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_f_221",
      name = "specialf221"
    },
    {
      type = "guardcore",
      locator = "locator_ene_f_222",
      name = "specialf222"
    },
    {
      type = "guardcore",
      locator = "locator_ene_f_223",
      name = "specialf223"
    }
  },
  onUpdate = function(A0_93)
    local L1_94
  end,
  onEnter = function(A0_95)
    local L1_96
  end,
  onLeave = function(A0_97)
    local L1_98
  end,
  onObjectDead = function(A0_99, A1_100)
    __enemy_cnt[22] = __enemy_cnt[22] - 1
    lowlife_gemset(A1_100)
  end
}
enmgen2_battle_f_23 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_f_231",
      name = "specialf231"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_232",
      name = "specialf232"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_233",
      name = "specialf233"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_234",
      name = "specialf234"
    },
    {
      type = "mosquito",
      locator = "locator_ene_f_235",
      name = "specialf235"
    }
  },
  onUpdate = function(A0_101)
    local L1_102
  end,
  onEnter = function(A0_103)
    local L1_104
  end,
  onLeave = function(A0_105)
    local L1_106
  end,
  onObjectDead = function(A0_107, A1_108)
    __enemy_cnt[23] = __enemy_cnt[23] - 1
    lowlife_gemset(A1_108)
  end
}
enmgen2_battle_f_24 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_f_241",
      name = "specialf241"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_242",
      name = "specialf242"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_243",
      name = "specialf243"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_f_244",
      name = "specialf244"
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
  onObjectDead = function(A0_115, A1_116)
    __enemy_cnt[24] = __enemy_cnt[24] - 1
    lowlife_gemset(A1_116)
  end
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_enmgen_19")
  for _FORV_3_ = 11, 24 do
    __enemy_cnt[_FORV_3_] = 0
  end
  Fn_setCatWarp(true)
  root_tbl = {
    "evarea2_po_a_04_box",
    "evarea2_po_a_04_box2"
  }
  load_event_evb("evx/ep90_common", root_tbl)
  Fn_DebugShortcutKey_User_Test_Stage()
end
function Ingame()
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  Player:setEnergyInfinite(Player.kEnergy_Gravity, true)
  HUD:grgDispReq_FadeOut()
  Player:setEnergyInfinite(Player.kEnergy_SpAttack, true)
  HUD:spgDispReq_FadeOut()
  Fn_setCheckPoint("locator2_pc_start_pos")
  while true do
    if __enemy_set ~= 0 then
      if __enemy_cnt[__enemy_set] == 0 then
        enemy_cnt:abort()
        __enemy_cnt[__enemy_set] = -1
        __enemy_set = 0
        __enemy_gen = false
        __group_cnt = __group_cnt + 1
        print("enemy:", __enemy_cnt[__enemy_set])
        print("group:", __group_cnt)
        if __group_cnt >= 8 then
          for _FORV_3_ = 11, 24 do
            if __enemy_cnt[_FORV_3_] >= -1 then
              __enemy_cnt[_FORV_3_] = 0
            end
          end
          __group_cnt = 0
        elseif __group_cnt == 1 then
          Fn_pcSensorOn("pccubesensor2_enmgen_19")
        end
      else
        waitSeconds(1)
        __time_cnt = __time_cnt + 1
        if __gemtime_cnt + 5 <= __time_cnt then
          __gemset = false
        end
      end
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_117, L1_118
end
function pccubesensor2_enmgen_11_OnEnter()
  __enemy_set = 11
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 8
    findGameObject2("EnemyGenerator", "enmgen2_f_11"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 8)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_11_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_12_OnEnter()
  __enemy_set = 12
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 4
    findGameObject2("EnemyGenerator", "enmgen2_f_12"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 4)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_12_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_13_OnEnter()
  __enemy_set = 13
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 5
    findGameObject2("EnemyGenerator", "enmgen2_f_13"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 5)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_13_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_14_OnEnter()
  __enemy_set = 14
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 3
    findGameObject2("EnemyGenerator", "enmgen2_f_14"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 3)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_14_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_15_OnEnter()
  __enemy_set = 15
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 6
    findGameObject2("EnemyGenerator", "enmgen2_f_15"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 6)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_15_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_16_OnEnter()
  __enemy_set = 16
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 9
    findGameObject2("EnemyGenerator", "enmgen2_f_16"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 9)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_16_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_17_OnEnter()
  __enemy_set = 17
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 9
    findGameObject2("EnemyGenerator", "enmgen2_f_17"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 9)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_17_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_18_OnEnter()
  __enemy_set = 18
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 8
    findGameObject2("EnemyGenerator", "enmgen2_f_18"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 8)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_18_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_19_OnEnter()
  __enemy_set = 19
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 2
    findGameObject2("EnemyGenerator", "enmgen2_f_19"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 2)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_19_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_20_OnEnter()
  __enemy_set = 20
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 5
    findGameObject2("EnemyGenerator", "enmgen2_f_20"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 5)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_20_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_22_OnEnter()
  __enemy_set = 22
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 3
    findGameObject2("EnemyGenerator", "enmgen2_f_22"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 3)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_22_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_23_OnEnter()
  __enemy_set = 23
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 5
    findGameObject2("EnemyGenerator", "enmgen2_f_23"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 5)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_23_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
function pccubesensor2_enmgen_24_OnEnter()
  __enemy_set = 24
  if __enemy_cnt[__enemy_set] == 0 then
    __enemy_gen = true
    __enemy_cnt[__enemy_set] = 4
    findGameObject2("EnemyGenerator", "enmgen2_f_24"):requestSpawn()
  end
  if __enemy_cnt[__enemy_set] >= 0 then
    enemy_cnt = invokeTask(function()
      while true do
        Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt[__enemy_set] .. "/" .. 4)
        wait()
      end
    end)
  end
end
function pccubesensor2_enmgen_24_OnLeave()
  __enemy_set = 0
  enemy_cnt:abort()
end
