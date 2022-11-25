dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_019"
_floor_num = 19
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
_eventEnd = false
_photo = nil
_PhotoCaption_Stopflag = false
_requestName = nil
_repoprequest = false
_mission_text_table = {
  {
    text = "ic_pi_monument_00170",
    se = "skb_003"
  }
}
enmgen2_floor17_pi2_a_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "ene_floor17_01_01",
      type = "stalker_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_floor17_01_02",
      type = "runner_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_floor17_01_03",
      type = "imp_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_floor17_01_04",
      type = "imp_mine_11",
      locator = "locator_04"
    },
    {
      name = "ene_floor17_01_05",
      type = "treecannon_mine_02",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_0, A1_1)
    local L2_2, L3_3
    L3_3 = A1_1
    L2_2 = A1_1.getName
    L2_2 = L2_2(L3_3)
    L3_3 = findGameObject2
    L3_3 = L3_3("Puppet", L2_2)
    if _photo:set(L3_3) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L2_2))
    end
    A0_0:getSpecTable().enemyMaxNum = #A0_0:getSpecTable().spawnSet
    A0_0:getSpecTable().enemydeadNum = 0
  end,
  onObjectDead = function(A0_4, A1_5)
    A0_4:getSpecTable().enemydeadNum = A0_4:getSpecTable().enemydeadNum + 1
    if A0_4:getSpecTable().enemydeadNum >= 3 then
      _repoprequest = true
      _requestName = A0_4:getName()
    end
  end
}
enmgen2_floor17_pi2_a_02_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "ene_floor17_02_01",
      type = "imp_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_floor17_02_02",
      type = "stalker_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_floor17_02_03",
      type = "gellyfish_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_floor17_02_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_floor17_02_05",
      type = "defender_mine_02",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_6, A1_7)
    local L2_8, L3_9
    L3_9 = A1_7
    L2_8 = A1_7.getName
    L2_8 = L2_8(L3_9)
    L3_9 = findGameObject2
    L3_9 = L3_9("Puppet", L2_8)
    if _photo:set(L3_9) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L2_8))
    end
  end,
  onObjectDead = function(A0_10, A1_11)
    A0_10:getSpecTable().enemydeadNum = A0_10:getSpecTable().enemydeadNum + 1
    if A0_10:getSpecTable().enemydeadNum >= 4 then
      _repoprequest = true
      _requestName = A0_10:getName()
    end
  end
}
enmgen2_floor17_pi2_b_05_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "ene_floor17_05_01",
      type = "treecannon_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_floor17_05_02",
      type = "imp_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_floor17_05_03",
      type = "imp_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_floor17_05_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_floor17_05_05",
      type = "runner_mine_02",
      locator = "locator_05"
    },
    {
      name = "ene_floor17_05_06",
      type = "jammer_mine_11",
      locator = "locator_06"
    },
    {
      name = "ene_floor17_05_07",
      type = "imp_mine_02",
      locator = "locator_07"
    },
    {
      name = "ene_floor17_05_08",
      type = "imp_mine_02",
      locator = "locator_08"
    },
    {
      name = "ene_floor17_05_09",
      type = "stalker_mine_02",
      locator = "locator_09"
    },
    {
      name = "ene_floor17_05_10",
      type = "runner_mine_02",
      locator = "locator_10"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_12, A1_13)
    local L2_14, L3_15
    L3_15 = A1_13
    L2_14 = A1_13.getName
    L2_14 = L2_14(L3_15)
    L3_15 = findGameObject2
    L3_15 = L3_15("Puppet", L2_14)
    if _photo:set(L3_15) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L2_14))
    end
  end,
  onObjectDead = function(A0_16, A1_17)
    A0_16:getSpecTable().enemydeadNum = A0_16:getSpecTable().enemydeadNum + 1
    if A0_16:getSpecTable().enemydeadNum >= 4 then
      _repoprequest = true
      _requestName = A0_16:getName()
    end
  end
}
enmgen2_floor17_pi2_b_06_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "ene_floor17_06_01",
      type = "lasercannon_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_floor17_06_02",
      type = "imp_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_floor17_06_03",
      type = "imp_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_floor17_06_04",
      type = "stalker_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_floor17_06_05",
      type = "defender_mine_02",
      locator = "locator_05"
    },
    {
      name = "ene_floor17_06_06",
      type = "giant_mine_11",
      locator = "locator_06"
    },
    {
      name = "ene_floor17_06_07",
      type = "lasercannon_mine_02",
      locator = "locator_07"
    },
    {
      name = "ene_floor17_06_08",
      type = "imp_mine_02",
      locator = "locator_08"
    },
    {
      name = "ene_floor17_06_09",
      type = "imp_mine_02",
      locator = "locator_09"
    },
    {
      name = "ene_floor17_06_10",
      type = "defender_mine_02",
      locator = "locator_10"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_18, A1_19)
    local L2_20, L3_21
    L3_21 = A1_19
    L2_20 = A1_19.getName
    L2_20 = L2_20(L3_21)
    L3_21 = findGameObject2
    L3_21 = L3_21("Puppet", L2_20)
    if _photo:set(L3_21) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L2_20))
    end
  end,
  onObjectDead = function(A0_22, A1_23)
    A0_22:getSpecTable().enemydeadNum = A0_22:getSpecTable().enemydeadNum + 1
    if A0_22:getSpecTable().enemydeadNum >= 4 then
      _repoprequest = true
      _requestName = A0_22:getName()
    end
  end
}
enmgen2_floor17_pi2_b_07_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "ene_floor17_07_01",
      type = "treecannon_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_floor17_07_02",
      type = "stalker_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_floor17_07_03",
      type = "defender_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_floor17_07_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_floor17_07_05",
      type = "imp_mine_02",
      locator = "locator_05"
    },
    {
      name = "ene_floor17_07_06",
      type = "giant_mine_11",
      locator = "locator_06"
    },
    {
      name = "ene_floor17_07_07",
      type = "imp_mine_02",
      locator = "locator_07"
    },
    {
      name = "ene_floor17_07_08",
      type = "guardcore_mine_11",
      locator = "locator_08"
    },
    {
      name = "ene_floor17_07_09",
      type = "stalker_mine_02",
      locator = "locator_09"
    },
    {
      name = "ene_floor17_07_10",
      type = "imp_mine_02",
      locator = "locator_10"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_24, A1_25)
    local L2_26, L3_27
    L3_27 = A1_25
    L2_26 = A1_25.getName
    L2_26 = L2_26(L3_27)
    L3_27 = findGameObject2
    L3_27 = L3_27("Puppet", L2_26)
    if _photo:set(L3_27) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L2_26))
    end
  end,
  onObjectDead = function(A0_28, A1_29)
    A0_28:getSpecTable().enemydeadNum = A0_28:getSpecTable().enemydeadNum + 1
    if A0_28:getSpecTable().enemydeadNum >= 3 then
      _repoprequest = true
      _requestName = A0_28:getName()
    end
  end
}
enmgen2_pi2_b_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "imp_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "imp_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "imp_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_02_04",
      type = "stalker_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_02_05",
      type = "stalker_mine_02",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_30, A1_31)
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onPopGem = function(A0_34, A1_35)
    EnemeyDropGem(A0_34, A1_35)
  end
}
enmgen2_pi2_b_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_01_01",
      type = "gellyfish_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_01_02",
      type = "stalker_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_01_03",
      type = "imp_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_01_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_01_05",
      type = "defender_mine_02",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_36, A1_37)
  end,
  onObjectDead = function(A0_38, A1_39)
  end,
  onPopGem = function(A0_40, A1_41)
    EnemeyDropGem(A0_40, A1_41)
  end
}
enmgen2_pi2_b_05_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_05_01",
      type = "treecannon_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_05_02",
      type = "stalker_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_05_03",
      type = "stalker_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_05_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_05_05",
      type = "imp_mine_02",
      locator = "locator_05"
    },
    {
      name = "ene_05_06",
      type = "lasercannon_mine_11",
      locator = "locator_06"
    },
    {
      name = "ene_05_07",
      type = "treecannon_mine_02",
      locator = "locator_07"
    },
    {
      name = "ene_05_08",
      type = "defender_mine_11",
      locator = "locator_08"
    },
    {
      name = "ene_05_09",
      type = "runner_mine_11",
      locator = "locator_09"
    },
    {
      name = "ene_05_10",
      type = "imp_mine_02",
      locator = "locator_10"
    },
    {
      name = "ene_05_11",
      type = "imp_mine_02",
      locator = "locator_11"
    },
    {
      name = "ene_05_12",
      type = "lasercannon_mine_02",
      locator = "locator_12"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_42, A1_43)
  end,
  onObjectDead = function(A0_44, A1_45)
  end,
  onPopGem = function(A0_46, A1_47)
    EnemeyDropGem(A0_46, A1_47)
  end
}
enmgen2_pi2_b_06_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_06_01",
      type = "runner_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_06_02",
      type = "guardcore_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_06_03",
      type = "imp_mine_02",
      locator = "locator_03"
    },
    {
      name = "ene_06_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_06_05",
      type = "lasercannon_mine_02",
      locator = "locator_05"
    },
    {
      name = "ene_06_06",
      type = "imp_mine_02",
      locator = "locator_06"
    },
    {
      name = "ene_06_07",
      type = "treecannon_mine_02",
      locator = "locator_07"
    },
    {
      name = "ene_06_08",
      type = "defender_mine_02",
      locator = "locator_08"
    },
    {
      name = "ene_06_09",
      type = "lasercannon_mine_02",
      locator = "locator_09"
    },
    {
      name = "ene_06_10",
      type = "imp_mine_02",
      locator = "locator_10"
    },
    {
      name = "ene_06_11",
      type = "imp_mine_02",
      locator = "locator_11"
    },
    {
      name = "ene_06_12",
      type = "imp_mine_02",
      locator = "locator_12"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_48, A1_49)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onPopGem = function(A0_52, A1_53)
    EnemeyDropGem(A0_52, A1_53)
  end
}
enmgen2_pi2_b_07_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_07_01",
      type = "imp_mine_02",
      locator = "locator_01"
    },
    {
      name = "ene_07_02",
      type = "lasercannon_mine_02",
      locator = "locator_02"
    },
    {
      name = "ene_07_03",
      type = "gellyfish_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_07_04",
      type = "imp_mine_02",
      locator = "locator_04"
    },
    {
      name = "ene_07_05",
      type = "stalker_mine_02",
      locator = "locator_05"
    },
    {
      name = "ene_07_06",
      type = "treecannon_mine_11",
      locator = "locator_06"
    },
    {
      name = "ene_07_07",
      type = "stalker_mine_11",
      locator = "locator_07"
    },
    {
      name = "ene_07_08",
      type = "guardcore_mine_02",
      locator = "locator_08"
    },
    {
      name = "ene_07_09",
      type = "treecannon_mine_11",
      locator = "locator_09"
    },
    {
      name = "ene_07_10",
      type = "lasercannon_mine_11",
      locator = "locator_10"
    },
    {
      name = "ene_07_11",
      type = "giant_mine_11",
      locator = "locator_11"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_54, A1_55)
  end,
  onObjectDead = function(A0_56, A1_57)
  end,
  onPopGem = function(A0_58, A1_59)
    EnemeyDropGem(A0_58, A1_59)
  end
}
function InitializeBody()
  local L0_60
  L0_60 = print
  L0_60(string.format("mine99_%03d InitializeBody", _floor_num))
  L0_60 = {}
  L0_60.mineOreEvdName = "mine02_ore"
  L0_60.instance_flg = true
  L0_60.manager_name = g_own:getName()
  L0_60.deploy_areas = getElectedAreaNames()
  L0_60.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_60
end
function IngameBody()
  local L0_61, L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74
  L0_61 = print
  L1_62 = string
  L1_62 = L1_62.format
  L2_63 = "mine99_%03d IngameBody"
  L13_74 = L1_62(L2_63, L3_64)
  L0_61(L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74, L1_62(L2_63, L3_64))
  L0_61 = Fn_getEneGenNameTable
  L0_61 = L0_61()
  L1_62 = {}
  L2_63 = 1
  _startAreaName = L3_64
  _goalAreaName = L3_64
  for L6_67, L7_68 in L3_64(L4_65) do
    for L11_72, L12_73 in L8_69(L9_70) do
      L13_74 = findGameObject2
      L13_74 = L13_74("EnemyGenerator", L12_73)
      L1_62[L2_63] = L13_74
      L2_63 = L2_63 + 1
    end
  end
  _eneList = L1_62
  for L8_69, L9_70 in L5_66(L6_67) do
    L13_74 = "floor17"
    if L11_72 ~= nil then
    else
      L13_74 = L9_70
      L13_74 = _startAreaName
      if L11_72 ~= nil then
      else
        L11_72(L12_73)
      end
    end
  end
  L5_66()
  L5_66(L6_67)
  L5_66()
  if L4_65 ~= 0 then
    L5_66(L6_67)
  end
  if not L5_66 then
    L5_66(L6_67)
    repeat
      L5_66()
    until L5_66
    L5_66(L6_67)
    L5_66()
    L5_66.near = 3
    L5_66.far = 30
    L6_67.left = -1
    L6_67.right = 1
    L6_67.top = -1
    L6_67.bottom = 1
    _photo = L7_68
    L7_68.suc = 0
    L7_68.near = 0
    L7_68.far = 0
    for L11_72, L12_73 in L8_69(L9_70) do
      L13_74 = L12_73.getName
      L13_74 = L13_74(L12_73)
      if string.match(L13_74, "floor17") ~= nil then
        L12_73:requestSpawn()
      else
        L12_73:requestAllEnemyKill()
      end
    end
    L8_69(L9_70)
    while true do
      if L9_70 and L8_69 == false then
        if L9_70 ~= nil then
          L9_70(L10_71)
          L9_70(L10_71, L11_72)
        end
      end
      if L9_70 ~= nil then
        L9_70(L10_71)
        while true do
          if L9_70 then
            if L9_70 == true then
              if L9_70 ~= nil then
                for L12_73, L13_74 in L9_70(L10_71) do
                  if L13_74:getName() == _requestName then
                    invokeTask(function()
                      L13_74:requestAllEnemyKill()
                      waitSeconds(2)
                      L13_74:requestSpawn()
                    end)
                    _repoprequest = false
                    _requestName = nil
                    break
                  else
                  end
                end
              end
            end
            if L9_70 then
              L9_70(L10_71, L11_72)
            elseif not L9_70 then
              L9_70(L10_71)
            end
          end
          if not L9_70 then
            L9_70()
          end
        end
        if L9_70 == false then
          _PhotoCaption_Stopflag = true
          L13_74 = false
          L9_70(L10_71, L11_72, L12_73, L13_74)
        end
        if L8_69 == false then
          if L10_71 == "table" then
            for L13_74, _FORV_14_ in L10_71(L11_72) do
              if _FORV_14_.dist < L5_66.near then
                L7_68.near = L7_68.near + 1
                print("\232\191\145\227\129\153\227\129\142\227\130\171\227\130\166\227\131\179\227\131\136 " .. L7_68.near)
              elseif _FORV_14_.dist > L5_66.far then
                L7_68.far = L7_68.far + 1
                print("\233\129\160\227\129\153\227\129\142\227\130\171\227\130\166\227\131\179\227\131\136 " .. L7_68.far)
              else
                L7_68.suc = L7_68.suc + 1
                print("\230\136\144\229\138\159\227\130\171\227\130\166\227\131\179\227\131\136 " .. L7_68.suc)
              end
            end
            if L10_71 >= 3 then
              L10_71(L11_72)
              L10_71(L11_72, L12_73)
              L10_71(L11_72)
              break
            else
              L10_71(L11_72)
              L13_74 = 0
              for _FORV_17_, _FORV_18_ in pairs(L10_71) do
                if L13_74 < L12_73 then
                  L13_74 = L12_73
                end
              end
              if #L9_70 < 3 then
                Fn_captionView("ic_pi_mine99_02_008")
              elseif L11_72 == "near" then
                Fn_captionView("ic_pi_mine99_02_002")
              elseif L11_72 == "far" then
                Fn_captionView("ic_pi_mine99_02_003")
              end
            end
          end
        end
      end
      L9_70()
    end
    L9_70()
    L9_70()
    repeat
      L9_70()
    until L9_70
    L9_70()
    L9_70()
    L9_70(L10_71)
    L9_70(L10_71)
    _photo = nil
    for L12_73, L13_74 in L9_70(L10_71) do
      L13_74:requestAllEnemyKill()
    end
  else
    L5_66(L6_67)
  end
  L5_66(L6_67)
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  if _photo ~= nil then
    print("\230\147\141\228\189\156\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
    _photo:coercionCaption(false)
    _photo:kill()
    _photo = nil
  end
end
