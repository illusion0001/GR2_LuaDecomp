mine_name = "mine03"
add_mine = ""
_mine_id = 3
_floor = 5
_boss_navi_range = 100
_enmgen_boss = "enmgen2_boss"
_enmgen_list = {
  "enmgen2_az_a_02_01",
  "enmgen2_az_a_03_01",
  "enmgen2_az_a_07_01",
  "enmgen2_az_a_10_01",
  "enmgen2_az_a_10_02",
  "enmgen2_az_a_10_03",
  "enmgen2_az_a_10_04",
  "enmgen2_az_a_05_01"
}
dofile("/Game/Event2/Mission/mine_base.lua")
_gravityOre = {
  mineOreEvdName = mine_name .. "_ore",
  instance_flg = true,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_POISON_START = 0.058
_catwarp_wait = 2
_poison_gas = false
_catwarp = false
_poison_se = nil
function uniqueIngameFunc()
  print("**** poison_observation : start ****")
  invokeTask(function()
    local L0_0, L1_1, L2_2
    L0_0, L1_1 = nil, nil
    repeat
      L2_2 = Fn_getPcPosRot
      L2_2 = L2_2()
      L0_0 = L2_2
      L2_2 = Query
      L2_2 = L2_2.setGfxObservationPoint
      L2_2(L2_2, L0_0)
      L2_2 = Query
      L2_2 = L2_2.getGfxObservationDensity
      L2_2 = L2_2(L2_2)
      L1_1 = L2_2
      L2_2 = debugDispPrint
      L2_2("PC POS : " .. tostring(L0_0))
      L2_2 = debugDispPrint
      L2_2("depth  : " .. tostring(L1_1))
      L2_2 = wait
      L2_2()
      L2_2 = Query
      L2_2 = L2_2.getGfxObservationDensity
      L2_2 = L2_2(L2_2)
    until L2_2 < _POISON_START
    L1_1 = 0
    repeat
      L2_2 = Fn_getPcPosRot
      L2_2 = L2_2()
      L0_0 = L2_2
      L2_2 = Query
      L2_2 = L2_2.setGfxObservationPoint
      L2_2(L2_2, L0_0)
      L2_2 = Query
      L2_2 = L2_2.getGfxObservationDensity
      L2_2 = L2_2(L2_2)
      L1_1 = L2_2
      L2_2 = _POISON_START
      if L1_1 < L2_2 then
        L2_2 = _poison_gas
        if L2_2 == true then
          L2_2 = print
          L2_2("****** poison out ******")
          _poison_gas = false
          L2_2 = Player
          L2_2 = L2_2.applyPoisonDamage
          L2_2(L2_2, 0, 0.01)
          L2_2 = _catwarp
          if L2_2 == false then
            L2_2 = _poison_se
            if L2_2 ~= nil then
              L2_2 = Sound
              L2_2 = L2_2.stopSEHandle
              L2_2(L2_2, _poison_se)
              _poison_se = nil
            end
            L2_2 = _poison_timer_task
            if L2_2 ~= nil then
              L2_2 = _poison_timer_task
              L2_2 = L2_2.abort
              L2_2(L2_2)
              _poison_timer_task = nil
            end
          end
        end
      else
        L2_2 = _POISON_START
        if L1_1 >= L2_2 then
          L2_2 = _poison_gas
          if L2_2 == false then
            L2_2 = print
            L2_2("****** poison [" .. L1_1 .. "] ****** PC POS [" .. tostring(L0_0) .. "] ******")
            L2_2 = invokeTask
            L2_2(poison_erea_in)
            L2_2 = _poison_timer_task
            if L2_2 == nil then
              L2_2 = print
              L2_2("****** poison catwarp count start ******")
              function L2_2()
                _catwarp = true
                Fn_catWarp()
                if _poison_se ~= nil then
                  Sound:stopSEHandle(_poison_se)
                  _poison_se = nil
                end
                waitSeconds(_catwarp_wait)
                Fn_userCtrlOn()
                _catwarp = false
                if _poison_timer_task ~= nil then
                  _poison_timer_task:abort()
                  _poison_timer_task = nil
                end
              end
              _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, L2_2)
            end
          end
        end
      end
      L2_2 = wait
      L2_2()
      L2_2 = false
    until L2_2
  end)
end
function poison_erea_in()
  print("************ poison erea in ************")
  _poison_gas = true
  Player:applyPoisonDamage(3, 999)
  _poison_se = Sound:playSEHandle("pc1_poisoned", 1, Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
enmgen2_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker",
      locator = "locator_boss",
      name = "mine03_boss",
      ai_spawn_option = "Faker/faker_boss_mine03",
      navi_mesh_name = "az_a_07_custom01"
    }
  },
  onUpdate = function(A0_3)
    local L1_4
  end,
  onEnter = function(A0_5)
    local L1_6
  end,
  onLeave = function(A0_7)
    local L1_8
  end,
  onObjectAsh = function(A0_9, A1_10)
    _boss_defeated = true
  end,
  onPopGem = function(A0_11, A1_12)
    invokeTask(function()
      if Fn_rewardMineBoss("boss03") then
        print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
      else
        Fn_EnemyDropGraviryOre(A0_11, A1_12, "infinity", 1)
      end
      EnemeyDropGem(A0_11, A1_12)
      Fn_bossDefeated()
    end)
  end,
  onObjectDead = function(A0_13, A1_14)
  end
}
enmgen2_az_a_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_01",
        name = "enemy_az_a_02_01"
      },
      {
        type = "gellyfish",
        locator = "locator_02",
        name = "enemy_az_a_02_02"
      },
      {
        type = "imp",
        locator = "locator_03",
        name = "enemy_az_a_02_03"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_01",
        name = "enemy_az_a_02_01"
      },
      {
        type = "gellyfish",
        locator = "locator_02",
        name = "enemy_az_a_02_02"
      },
      {
        type = "gellyfish",
        locator = "locator_03",
        name = "enemy_az_a_02_03"
      },
      {
        type = "imp",
        locator = "locator_04",
        name = "enemy_az_a_02_04"
      },
      {
        type = "imp",
        locator = "locator_05",
        name = "enemy_az_a_02_05"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_01",
        name = "enemy_az_a_02_01"
      },
      {
        type = "gellyfish",
        locator = "locator_02",
        name = "enemy_az_a_02_02"
      },
      {
        type = "gellyfish",
        locator = "locator_03",
        name = "enemy_az_a_02_03"
      },
      {
        type = "gellyfish",
        locator = "locator_04",
        name = "enemy_az_a_02_04"
      },
      {
        type = "imp",
        locator = "locator_05",
        name = "enemy_az_a_02_05"
      },
      {
        type = "imp",
        locator = "locator_06",
        name = "enemy_az_a_02_06"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_02_07"
      },
      {
        type = "lasercannon",
        locator = "locator_08",
        name = "enemy_az_a_02_08"
      },
      {
        type = "lasercannon",
        locator = "locator_09",
        name = "enemy_az_a_02_09"
      }
    }
  },
  onUpdate = function(A0_15)
    local L1_16
  end,
  onEnter = function(A0_17)
    local L1_18
  end,
  onLeave = function(A0_19)
    local L1_20
  end,
  onObjectDead = function(A0_21, A1_22)
  end,
  onSetupGem = function(A0_23, A1_24)
    Fn_enemyPopGemSetup(A0_23, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_25, A1_26)
    Fn_enemyAshPopGem(A0_25, A1_26, {"A"})
  end
}
enmgen2_az_a_03_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_03_01"
      },
      {
        type = "gellyfish",
        locator = "locator_05",
        name = "enemy_az_a_03_02"
      },
      {
        type = "gellyfish",
        locator = "locator_06",
        name = "enemy_az_a_03_03"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_03_04"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_03_01"
      },
      {
        type = "treecannon",
        locator = "locator_02",
        name = "enemy_az_a_03_02"
      },
      {
        type = "gellyfish",
        locator = "locator_05",
        name = "enemy_az_a_03_03"
      },
      {
        type = "gellyfish",
        locator = "locator_06",
        name = "enemy_az_a_03_04"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_03_05"
      },
      {
        type = "imp",
        locator = "locator_08",
        name = "enemy_az_a_03_06"
      },
      {
        type = "imp",
        locator = "locator_09",
        name = "enemy_az_a_03_07"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_03_01"
      },
      {
        type = "treecannon",
        locator = "locator_02",
        name = "enemy_az_a_03_02"
      },
      {
        type = "treecannon",
        locator = "locator_03",
        name = "enemy_az_a_03_03"
      },
      {
        type = "treecannon",
        locator = "locator_04",
        name = "enemy_az_a_03_04"
      },
      {
        type = "imp",
        locator = "locator_05",
        name = "enemy_az_a_03_05"
      },
      {
        type = "imp",
        locator = "locator_06",
        name = "enemy_az_a_03_06"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_03_07"
      },
      {
        type = "lasercannon",
        locator = "locator_08",
        name = "enemy_az_a_03_08"
      },
      {
        type = "lasercannon",
        locator = "locator_09",
        name = "enemy_az_a_03_09"
      }
    }
  },
  onUpdate = function(A0_27)
    local L1_28
  end,
  onEnter = function(A0_29)
    local L1_30
  end,
  onLeave = function(A0_31)
    local L1_32
  end,
  onObjectDead = function(A0_33, A1_34)
  end,
  onSetupGem = function(A0_35, A1_36)
    Fn_enemyPopGemSetup(A0_35, {
      "enemy_az_a_01_01"
    }, 1, GEM_VITAL, "A")
    Fn_enemyPopGemSetup(A0_35, {
      "enemy_az_a_01_03",
      "enemy_az_a_01_04"
    }, 1, GEM_VITAL, "B")
  end,
  onPopGem = function(A0_37, A1_38)
    Fn_enemyAshPopGem(A0_37, A1_38, {"A", "B"})
  end
}
enmgen2_az_a_07_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_07_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_07_02"
      },
      {
        type = "runner",
        locator = "locator_03",
        name = "enemy_az_a_07_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_07_04"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_07_01"
      },
      {
        type = "runner",
        locator = "locator_02",
        name = "enemy_az_a_07_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_07_03"
      },
      {
        type = "runner",
        locator = "locator_04",
        name = "enemy_az_a_07_04"
      },
      {
        type = "gellyfish",
        locator = "locator_05",
        name = "enemy_az_a_07_05"
      },
      {
        type = "imp",
        locator = "locator_06",
        name = "enemy_az_a_07_06"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_01",
        name = "enemy_az_a_07_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_07_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_07_03"
      },
      {
        type = "runner",
        locator = "locator_04",
        name = "enemy_az_a_07_04"
      },
      {
        type = "imp",
        locator = "locator_05",
        name = "enemy_az_a_07_05"
      },
      {
        type = "imp",
        locator = "locator_06",
        name = "enemy_az_a_07_06"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_07_07"
      },
      {
        type = "lasercannon",
        locator = "locator_08",
        name = "enemy_az_a_07_08"
      },
      {
        type = "lasercannon",
        locator = "locator_09",
        name = "enemy_az_a_07_09"
      }
    }
  },
  onUpdate = function(A0_39)
    local L1_40
  end,
  onEnter = function(A0_41)
    local L1_42
  end,
  onLeave = function(A0_43)
    local L1_44
  end,
  onObjectDead = function(A0_45, A1_46)
  end,
  onSetupGem = function(A0_47, A1_48)
    Fn_enemyPopGemSetup(A0_47, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_49, A1_50)
    Fn_enemyAshPopGem(A0_49, A1_50, {"A"})
  end
}
enmgen2_az_a_10_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_01"
      },
      {
        type = "imp",
        locator = "locator_02",
        name = "enemy_az_a_10_02"
      },
      {
        type = "gellyfish",
        locator = "locator_03",
        name = "enemy_az_a_10_03"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_01"
      },
      {
        type = "imp",
        locator = "locator_02",
        name = "enemy_az_a_10_02"
      },
      {
        type = "gellyfish",
        locator = "locator_03",
        name = "enemy_az_a_10_03"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_04"
      },
      {
        type = "treecannon",
        locator = "locator_05",
        name = "enemy_az_a_10_05"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_01"
      },
      {
        type = "imp",
        locator = "locator_02",
        name = "enemy_az_a_10_02"
      },
      {
        type = "gellyfish",
        locator = "locator_03",
        name = "enemy_az_a_10_03"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_04"
      },
      {
        type = "lasercannon",
        locator = "locator_05",
        name = "enemy_az_a_10_05"
      },
      {
        type = "imp",
        locator = "locator_06",
        name = "enemy_az_a_10_06"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_10_07"
      },
      {
        type = "lasercannon",
        locator = "locator_08",
        name = "enemy_az_a_10_08"
      }
    }
  },
  onUpdate = function(A0_51)
    local L1_52
  end,
  onEnter = function(A0_53)
    local L1_54
  end,
  onLeave = function(A0_55)
    local L1_56
  end,
  onObjectDead = function(A0_57, A1_58)
  end,
  onSetupGem = function(A0_59, A1_60)
    Fn_enemyPopGemSetup(A0_59, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_61, A1_62)
    Fn_enemyAshPopGem(A0_61, A1_62, {"A"})
  end
}
enmgen2_az_a_10_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_11"
      },
      {
        type = "lasercannon",
        locator = "locator_02",
        name = "enemy_az_a_10_12"
      },
      {
        type = "treecannon",
        locator = "locator_03",
        name = "enemy_az_a_10_13"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_14"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_11"
      },
      {
        type = "lasercannon",
        locator = "locator_02",
        name = "enemy_az_a_10_12"
      },
      {
        type = "treecannon",
        locator = "locator_03",
        name = "enemy_az_a_10_13"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_14"
      },
      {
        type = "treecannon",
        locator = "locator_05",
        name = "enemy_az_a_10_15"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_11"
      },
      {
        type = "lasercannon",
        locator = "locator_02",
        name = "enemy_az_a_10_12"
      },
      {
        type = "treecannon",
        locator = "locator_03",
        name = "enemy_az_a_10_13"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_14"
      },
      {
        type = "treecannon",
        locator = "locator_05",
        name = "enemy_az_a_10_15"
      },
      {
        type = "lasercannon",
        locator = "locator_06",
        name = "enemy_az_a_10_16"
      },
      {
        type = "imp",
        locator = "locator_07",
        name = "enemy_az_a_10_17"
      },
      {
        type = "imp",
        locator = "locator_08",
        name = "enemy_az_a_10_18"
      },
      {
        type = "treecannon",
        locator = "locator_09",
        name = "enemy_az_a_10_19"
      }
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
  onSetupGem = function(A0_71, A1_72)
    Fn_enemyPopGemSetup(A0_71, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_73, A1_74)
    Fn_enemyAshPopGem(A0_73, A1_74, {"A"})
  end
}
enmgen2_az_a_10_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_21"
      },
      {
        type = "lasercannon",
        locator = "locator_02",
        name = "enemy_az_a_10_22"
      },
      {
        type = "lasercannon",
        locator = "locator_03",
        name = "enemy_az_a_10_23"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_24"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_21"
      },
      {
        type = "imp",
        locator = "locator_02",
        name = "enemy_az_a_10_22"
      },
      {
        type = "imp",
        locator = "locator_03",
        name = "enemy_az_a_10_23"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_24"
      },
      {
        type = "lasercannon",
        locator = "locator_05",
        name = "enemy_az_a_10_25"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_21"
      },
      {
        type = "imp",
        locator = "locator_02",
        name = "enemy_az_a_10_22"
      },
      {
        type = "imp",
        locator = "locator_03",
        name = "enemy_az_a_10_23"
      },
      {
        type = "lasercannon",
        locator = "locator_04",
        name = "enemy_az_a_10_24"
      },
      {
        type = "lasercannon",
        locator = "locator_05",
        name = "enemy_az_a_10_25"
      },
      {
        type = "lasercannon",
        locator = "locator_06",
        name = "enemy_az_a_10_26"
      },
      {
        type = "treecannon",
        locator = "locator_07",
        name = "enemy_az_a_10_27"
      },
      {
        type = "jammer",
        locator = "locator_08",
        name = "enemy_az_a_10_28"
      },
      {
        type = "jammer",
        locator = "locator_09",
        name = "enemy_az_a_10_29"
      }
    }
  },
  onUpdate = function(A0_75)
    local L1_76
  end,
  onEnter = function(A0_77)
    local L1_78
  end,
  onLeave = function(A0_79)
    local L1_80
  end,
  onObjectDead = function(A0_81, A1_82)
  end,
  onSetupGem = function(A0_83, A1_84)
    Fn_enemyPopGemSetup(A0_83, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_85, A1_86)
    Fn_enemyAshPopGem(A0_85, A1_86, {"A"})
  end
}
enmgen2_az_a_10_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_01",
        name = "enemy_az_a_10_31"
      },
      {
        type = "lasercannon",
        locator = "locator_02",
        name = "enemy_az_a_10_32"
      },
      {
        type = "lasercannon",
        locator = "locator_03",
        name = "enemy_az_a_10_33"
      }
    },
    {
      {
        type = "jammer",
        locator = "locator_01",
        name = "enemy_az_a_10_31"
      },
      {
        type = "lasercannon",
        locator = "locator_02",
        name = "enemy_az_a_10_32"
      },
      {
        type = "imp",
        locator = "locator_03",
        name = "enemy_az_a_10_33"
      },
      {
        type = "treecannon",
        locator = "locator_04",
        name = "enemy_az_a_10_34"
      },
      {
        type = "lasercannon",
        locator = "locator_05",
        name = "enemy_az_a_10_35"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_01",
        name = "enemy_az_a_10_31"
      },
      {
        type = "imp",
        locator = "locator_02",
        name = "enemy_az_a_10_32"
      },
      {
        type = "imp",
        locator = "locator_03",
        name = "enemy_az_a_10_33"
      },
      {
        type = "jammer",
        locator = "locator_04",
        name = "enemy_az_a_10_34"
      },
      {
        type = "imp",
        locator = "locator_05",
        name = "enemy_az_a_10_35"
      },
      {
        type = "lasercannon",
        locator = "locator_06",
        name = "enemy_az_a_10_36"
      },
      {
        type = "lasercannon",
        locator = "locator_07",
        name = "enemy_az_a_10_37"
      },
      {
        type = "lasercannon",
        locator = "locator_08",
        name = "enemy_az_a_10_38"
      },
      {
        type = "treecannon",
        locator = "locator_09",
        name = "enemy_az_a_10_39"
      }
    }
  },
  onUpdate = function(A0_87)
    local L1_88
  end,
  onEnter = function(A0_89)
    local L1_90
  end,
  onLeave = function(A0_91)
    local L1_92
  end,
  onObjectDead = function(A0_93, A1_94)
  end,
  onSetupGem = function(A0_95, A1_96)
    Fn_enemyPopGemSetup(A0_95, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_97, A1_98)
    Fn_enemyAshPopGem(A0_97, A1_98, {"A"})
  end
}
enmgen2_az_a_05_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_05_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_05_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_05_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_05_04"
      },
      {
        type = "stalker",
        locator = "locator_05",
        name = "enemy_az_a_05_05"
      },
      {
        type = "stalker",
        locator = "locator_06",
        name = "enemy_az_a_05_06"
      },
      {
        type = "stalker",
        locator = "locator_07",
        name = "enemy_az_a_05_07"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_05_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_05_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_05_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_05_04"
      },
      {
        type = "stalker",
        locator = "locator_05",
        name = "enemy_az_a_05_05"
      },
      {
        type = "stalker",
        locator = "locator_06",
        name = "enemy_az_a_05_06"
      },
      {
        type = "stalker",
        locator = "locator_07",
        name = "enemy_az_a_05_07"
      },
      {
        type = "gellyfish",
        locator = "locator_08",
        name = "enemy_az_a_05_08"
      },
      {
        type = "gellyfish",
        locator = "locator_09",
        name = "enemy_az_a_05_09"
      },
      {
        type = "gellyfish",
        locator = "locator_10",
        name = "enemy_az_a_05_10"
      },
      {
        type = "gellyfish",
        locator = "locator_11",
        name = "enemy_az_a_05_11"
      },
      {
        type = "gellyfish",
        locator = "locator_12",
        name = "enemy_az_a_05_12"
      },
      {
        type = "gellyfish",
        locator = "locator_13",
        name = "enemy_az_a_05_13"
      },
      {
        type = "gellyfish",
        locator = "locator_14",
        name = "enemy_az_a_05_14"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_01",
        name = "enemy_az_a_05_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_05_02"
      },
      {
        type = "runner",
        locator = "locator_03",
        name = "enemy_az_a_05_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_05_04"
      },
      {
        type = "runner",
        locator = "locator_05",
        name = "enemy_az_a_05_05"
      },
      {
        type = "stalker",
        locator = "locator_06",
        name = "enemy_az_a_05_06"
      },
      {
        type = "runner",
        locator = "locator_07",
        name = "enemy_az_a_05_07"
      },
      {
        type = "imp",
        locator = "locator_08",
        name = "enemy_az_a_05_08"
      },
      {
        type = "imp",
        locator = "locator_09",
        name = "enemy_az_a_05_09"
      },
      {
        type = "imp",
        locator = "locator_10",
        name = "enemy_az_a_05_10"
      },
      {
        type = "imp",
        locator = "locator_11",
        name = "enemy_az_a_05_11"
      },
      {
        type = "imp",
        locator = "locator_12",
        name = "enemy_az_a_05_12"
      },
      {
        type = "imp",
        locator = "locator_13",
        name = "enemy_az_a_05_13"
      },
      {
        type = "imp",
        locator = "locator_14",
        name = "enemy_az_a_05_14"
      }
    }
  },
  onUpdate = function(A0_99)
    local L1_100
  end,
  onEnter = function(A0_101)
    local L1_102
  end,
  onLeave = function(A0_103)
    local L1_104
  end,
  onObjectDead = function(A0_105, A1_106)
  end,
  onSetupGem = function(A0_107, A1_108)
    Fn_enemyPopGemSetup(A0_107, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_109, A1_110)
    Fn_enemyAshPopGem(A0_109, A1_110, {"A"})
  end
}
enmgen2_az_a_04_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_04_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_04_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_04_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_04_04"
      },
      {
        type = "stalker",
        locator = "locator_05",
        name = "enemy_az_a_04_05"
      },
      {
        type = "stalker",
        locator = "locator_06",
        name = "enemy_az_a_04_06"
      },
      {
        type = "stalker",
        locator = "locator_07",
        name = "enemy_az_a_04_07"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_04_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_04_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_04_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_04_04"
      },
      {
        type = "stalker",
        locator = "locator_05",
        name = "enemy_az_a_04_05"
      },
      {
        type = "stalker",
        locator = "locator_06",
        name = "enemy_az_a_04_06"
      },
      {
        type = "stalker",
        locator = "locator_07",
        name = "enemy_az_a_04_07"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_01",
        name = "enemy_az_a_04_01"
      },
      {
        type = "stalker",
        locator = "locator_02",
        name = "enemy_az_a_04_02"
      },
      {
        type = "stalker",
        locator = "locator_03",
        name = "enemy_az_a_04_03"
      },
      {
        type = "stalker",
        locator = "locator_04",
        name = "enemy_az_a_04_04"
      },
      {
        type = "stalker",
        locator = "locator_05",
        name = "enemy_az_a_04_05"
      },
      {
        type = "stalker",
        locator = "locator_06",
        name = "enemy_az_a_04_06"
      },
      {
        type = "stalker",
        locator = "locator_07",
        name = "enemy_az_a_04_07"
      }
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
  onSetupGem = function(A0_119, A1_120)
    Fn_enemyPopGemSetup(A0_119, {
      "enemy_az_a_01_01",
      "enemy_az_a_01_02",
      "enemy_az_a_01_03"
    }, 1, GEM_VITAL, "A")
  end,
  onPopGem = function(A0_121, A1_122)
    Fn_enemyAshPopGem(A0_121, A1_122, {"A"})
  end
}
