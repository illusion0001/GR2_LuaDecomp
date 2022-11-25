dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_016"
_floor_num = 16
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
_eventEnd = false
_eventBattleNum = 0
_eventCount = 5
enmgen2_floor16_main = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor14_ene_01",
      type = "imp_mine_02",
      locator = "locator_01"
    },
    {
      name = "floor14_ene_02",
      type = "gellyfish_mine_02",
      locator = "locator_02"
    },
    {
      name = "floor14_ene_03",
      type = "lasercannon_mine_02",
      locator = "locator_03"
    },
    {
      name = "floor14_ene_04",
      type = "guardcore_mine_11",
      locator = "locator_04"
    },
    {
      name = "floor14_ene_05",
      type = "giant_weak",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyMaxNum = #A0_0:getSpecTable().spawnSet
    A0_0:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_2, A1_3)
    _eventCount = _eventCount - 1
    A0_2:getSpecTable().enemydeadNum = A0_2:getSpecTable().enemydeadNum + 1
    if A0_2:getSpecTable().enemydeadNum >= A0_2:getSpecTable().enemyMaxNum then
      _eventEnd = true
    end
  end
}
enmgen2_pi2_b_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "imp_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "imp_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "imp_mine_11",
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
  onSpawn = function(A0_4, A1_5)
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onPopGem = function(A0_8, A1_9)
    EnemeyDropGem(A0_8, A1_9)
  end
}
enmgen2_pi2_b_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "imp_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "imp_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "imp_mine_11",
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
  onSpawn = function(A0_10, A1_11)
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onPopGem = function(A0_14, A1_15)
    EnemeyDropGem(A0_14, A1_15)
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
  onSpawn = function(A0_16, A1_17)
  end,
  onObjectDead = function(A0_18, A1_19)
  end,
  onPopGem = function(A0_20, A1_21)
    EnemeyDropGem(A0_20, A1_21)
  end
}
enmgen2_pi2_b_07_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_07_01",
      type = "imp_mine_11",
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
      type = "imp_mine_11",
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
  onSpawn = function(A0_22, A1_23)
  end,
  onObjectDead = function(A0_24, A1_25)
  end,
  onPopGem = function(A0_26, A1_27)
    EnemeyDropGem(A0_26, A1_27)
  end
}
function InitializeBody()
  local L0_28
  L0_28 = print
  L0_28(string.format("mine99_%03d InitializeBody", _floor_num))
  L0_28 = {}
  L0_28.mineOreEvdName = "mine02_ore"
  L0_28.instance_flg = true
  L0_28.manager_name = g_own:getName()
  L0_28.deploy_areas = getElectedAreaNames()
  L0_28.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_28
end
function IngameBody()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41
  L0_29 = print
  L1_30 = string
  L1_30 = L1_30.format
  L2_31 = "mine99_%03d IngameBody"
  L12_41 = L1_30(L2_31, L3_32)
  L0_29(L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L1_30(L2_31, L3_32))
  L0_29 = Fn_getEneGenNameTable
  L0_29 = L0_29()
  L1_30 = {}
  L2_31 = 1
  _startAreaName = L3_32
  _goalAreaName = L3_32
  for L6_35, L7_36 in L3_32(L4_33) do
    for L11_40, L12_41 in L8_37(L9_38) do
      L1_30[L2_31] = findGameObject2("EnemyGenerator", L12_41)
      L2_31 = L2_31 + 1
    end
  end
  _eneList = L1_30
  for L7_36, L8_37 in L4_33(L5_34) do
    L11_40 = L9_38
    L12_41 = "floor16"
    if L10_39 ~= nil then
      L11_40 = L9_38
      L12_41 = _goalAreaName
      if L10_39 ~= nil then
        _eventBattleNum = L7_36
      end
    else
      L12_41 = L8_37
      L11_40 = L8_37.getName
      L11_40 = L11_40(L12_41)
      L12_41 = _startAreaName
      if L10_39 ~= nil then
      else
        L11_40 = L8_37
        L10_39(L11_40)
        L11_40 = L9_38
        L12_41 = ":Spawn!"
        L11_40 = L11_40 .. L12_41
        L10_39(L11_40)
      end
    end
  end
  L4_33()
  L4_33()
  L4_33()
  if L3_32 ~= 0 then
    L4_33(L5_34)
  end
  if not L4_33 then
    L4_33(L5_34)
    repeat
      L4_33()
    until L4_33
    L11_40 = Player
    L11_40 = L11_40.kAbility_Grab
    L12_41 = Player
    L12_41 = L12_41.kAbility_ExGrab
    L5_34(L6_35, L7_36)
    L5_34(L6_35)
    L5_34(L6_35, L7_36, L8_37, L9_38)
    L5_34()
    L5_34(L6_35)
    for L8_37, L9_38 in L5_34(L6_35) do
      if L8_37 == L10_39 then
        L11_40 = L9_38
        L10_39(L11_40)
      else
        L11_40 = L9_38
        L10_39(L11_40)
      end
    end
    _eventEnd = false
    _eventCount = 5
    L5_34(L6_35, L7_36)
    L5_34(L6_35, L7_36)
    L5_34(L6_35, L7_36)
    L5_34(L6_35, L7_36)
    L5_34(L6_35)
    while true do
      L5_34(L6_35, L7_36)
      if L5_34 == true then
        L5_34()
        L5_34()
        repeat
          L5_34()
        until L5_34
        L5_34()
        L5_34()
        break
      end
      L5_34()
    end
    L5_34(L6_35)
    L5_34(L6_35, L7_36)
    for L8_37, L9_38 in L5_34(L6_35) do
      L11_40 = L9_38
      L10_39(L11_40)
    end
  else
    L4_33(L5_34)
  end
  L4_33(L5_34)
end
function FinalizeBody()
  local L0_42
  L0_42 = print
  L0_42(string.format("mine99_%03d FinalizeBody", _floor_num))
  L0_42 = HUD
  L0_42 = L0_42.counter999SetVisible
  L0_42(L0_42, false)
  L0_42 = {
    Player.kAbility_GravityShift,
    Player.kAbility_GravityRevert,
    Player.kAbility_GravityBoost,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_SliderKick,
    Player.kAbility_Grab,
    Player.kAbility_ExGrab,
    Player.kAbility_Throw,
    Player.kAbility_SpAttack,
    Player.kAbility_SpTornado,
    Player.kAbility_SpTyphoon,
    Player.kAbility_SpBlackHole,
    Player.kAbility_FelineStart,
    Player.kAbility_FelineEnd
  }
  Fn_unLockPlayerAbility(L0_42)
end
