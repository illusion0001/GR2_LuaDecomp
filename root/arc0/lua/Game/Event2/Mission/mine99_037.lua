dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_037"
_floor_num = 37
_total_fuel = 0
function InitializeBody()
  local L0_0
  L0_0 = {}
  L0_0.mineOreEvdName = "mine04_ore"
  L0_0.instance_flg = true
  L0_0.manager_name = g_own:getName()
  L0_0.deploy_areas = getElectedAreaNames()
  L0_0.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_0
end
function IngameBody()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = {L1_2, L2_3}
  L1_2()
  L1_2()
  L1_2()
  L1_2(L2_3)
  if L1_2 then
    L1_2(L2_3)
  else
    L1_2(L2_3)
    repeat
      L1_2()
    until L1_2
    L1_2()
    L4_5 = nil
    L5_6 = true
    L1_2(L2_3, L3_4, L4_5, L5_6)
    for L4_5, L5_6 in L1_2(L2_3) do
      requestEnemyKill(L5_6)
    end
    _total_fuel = 0
    L1_2(L2_3, L3_4)
    L4_5 = 0.8
    L1_2(L2_3, L3_4, L4_5)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3)
    repeat
      L1_2()
      L1_2()
    until L1_2 >= 1
    L1_2(L2_3)
    L1_2(L2_3, L3_4)
    L1_2()
    L1_2()
    repeat
      L1_2()
    until L1_2
    L1_2()
    L1_2()
    L2_3(L3_4)
  end
  L1_2(L2_3)
end
function FinalizeBody()
  HUD:miniGaugeSetVisible(false)
end
function checkPlayerMotion()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12
  L0_7 = {
    L1_8,
    L2_9,
    L3_10,
    L4_11
  }
  L4_11 = "lively_action_11"
  for L4_11, L5_12 in L1_8(L2_9) do
    if Fn_getPlayer():isPoseAnimPlaying(L5_12) then
      _total_fuel = _total_fuel + 0.001
      HUD:miniGaugeSetNum(_total_fuel)
      break
    end
  end
end
function pccubesensor2_01_OnEnter(A0_13)
  local L1_14
end
function pccubesensor2_01_OnLeave(A0_15)
  invokeTask(function()
    Player:setStay(true)
    Fn_userCtrlOff()
    Fn_catWarp()
    Player:setStay(false)
    Fn_userCtrlOn()
  end)
end
function requestEnemySpawn(A0_16)
  local L1_17
  L1_17 = Fn_findAreaHandle
  L1_17 = L1_17(A0_16)
  if L1_17 ~= nil then
    L1_17 = "enmgen2_"
    L1_17 = L1_17 .. A0_16
    if findGameObject2("EnemyGenerator", L1_17) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\135\186\231\143\190\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130", L1_17))
      findGameObject2("EnemyGenerator", L1_17):requestSpawn()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_17))
    end
  else
    L1_17 = print
    L1_17(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_16))
  end
end
function requestEnemyKill(A0_18)
  local L1_19
  L1_19 = Fn_findAreaHandle
  L1_19 = L1_19(A0_18)
  if L1_19 ~= nil then
    L1_19 = "enmgen2_"
    L1_19 = L1_19 .. A0_18
    if findGameObject2("EnemyGenerator", L1_19) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L1_19))
      findGameObject2("EnemyGenerator", L1_19):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_19))
    end
  else
    L1_19 = print
    L1_19(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_18))
  end
end
enmgen2_az2_a_19 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      type = "runner_mine_12",
      locator = "locator_az2_a_19_01",
      name = "ene001"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_az2_a_19_02",
      name = "ene002"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_az2_a_19_03",
      name = "ene003"
    },
    {
      type = "runner_mine_12",
      locator = "locator_az2_a_19_04",
      name = "ene004"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_az2_a_19_05",
      name = "ene005"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator_az2_a_19_06",
      name = "ene006"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator_az2_a_19_07",
      name = "ene007"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_08",
      name = "ene008"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_09",
      name = "ene009"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_10",
      name = "ene010"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_11",
      name = "ene011"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_12",
      name = "ene012"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_13",
      name = "ene013"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_14",
      name = "ene014"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_19_15",
      name = "ene015"
    }
  },
  onUpdate = function(A0_20)
    local L1_21
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onLeave = function(A0_24)
    local L1_25
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onObjectAsh = function(A0_28, A1_29)
  end
}
enmgen2_az2_a_17 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_mine_12",
      locator = "locator_az2_a_17_01",
      name = "ene_az2_a_17_01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_az2_a_17_02",
      name = "ene_az2_a_17_02"
    },
    {
      type = "runner_mine_12",
      locator = "locator_az2_a_17_03",
      name = "ene_az2_a_17_03"
    },
    {
      type = "defender_mine_12",
      locator = "locator_az2_a_17_04",
      name = "ene_az2_a_17_04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_17_05",
      name = "ene_az2_a_17_05"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_17_06",
      name = "ene_az2_a_17_06"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_az2_a_17_07",
      name = "ene_az2_a_17_07"
    }
  },
  onUpdate = function(A0_30)
    local L1_31
  end,
  onEnter = function(A0_32)
    local L1_33
  end,
  onLeave = function(A0_34)
    local L1_35
  end,
  onPopGem = function(A0_36, A1_37)
    EnemeyDropGem(A0_36, A1_37)
  end,
  onObjectAsh = function(A0_38, A1_39)
  end,
  onObjectDead = function(A0_40, A1_41)
  end
}
enmgen2_az2_a_21 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_mine_12",
      locator = "locator_az2_a_21_01",
      name = "ene_az2_a_21_01"
    },
    {
      type = "imp_mine_12",
      locator = "locator_az2_a_21_02",
      name = "ene_az2_a_21_02"
    },
    {
      type = "imp_mine_12",
      locator = "locator_az2_a_21_03",
      name = "ene_az2_a_21_03"
    },
    {
      type = "imp_mine_12",
      locator = "locator_az2_a_21_04",
      name = "ene_az2_a_21_04"
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onPopGem = function(A0_48, A1_49)
    EnemeyDropGem(A0_48, A1_49)
  end,
  onObjectAsh = function(A0_50, A1_51)
  end,
  onObjectDead = function(A0_52, A1_53)
  end
}
