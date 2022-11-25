dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_017"
_floor_num = 17
_litho_theme = nil
_enemy_count_max = 0
_enemy_destroy_num = 0
_correct_answer_tbl = {
  "mothership01",
  "giant01",
  "guardcore01",
  "lasercannon01"
}
_litho_wait_task = nil
_mission_text_table = {
  {
    text = "ic_pi_monument_00190",
    se = "skb_002"
  }
}
enmgen2_a_04_mine99_021 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "giant_mine_11",
      locator = "locator_mine99_021_01",
      name = "giant01"
    },
    {
      type = "guardcore_mine_11",
      locator = "locator_mine99_021_02",
      name = "guardcore01"
    },
    {
      type = "lasercannon_mine_11",
      locator = "locator_mine99_021_03",
      name = "lasercannon01"
    },
    {
      type = "mothership_mine_11",
      locator = "locator_mine99_021_04",
      name = "mothership01",
      ai_spawn_option = "MotherShip/MotherShip_Test"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_mine99_021_04",
      name = "childship01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_a_05_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "guardcore_mine_11",
      locator = "locator_a_05_01",
      name = "guardcore01"
    },
    {
      type = "imp_mine_02",
      locator = "locator_a_05_02",
      name = "imp01"
    },
    {
      type = "imp_mine_02",
      locator = "locator_a_05_03",
      name = "imp02"
    },
    {
      type = "runner_mine_11",
      locator = "locator_a_05_04",
      name = "runner01"
    },
    {
      type = "stalker_mine_11",
      locator = "locator_a_05_05",
      name = "stalker01"
    },
    {
      type = "stalker_mine_11",
      locator = "locator_a_05_06",
      name = "stalker02"
    },
    {
      type = "stalker_mine_11",
      locator = "locator_a_05_07",
      name = "stalker03"
    },
    {
      type = "treecannon_mine_02",
      locator = "locator_a_05_08",
      name = "treecannon01"
    },
    {
      type = "gellyfish_mine_11",
      locator = "locator_a_05_09",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_11",
      locator = "locator_a_05_10",
      name = "gellyfish02"
    },
    {
      type = "gellyfish_mine_11",
      locator = "locator_a_05_11",
      name = "gellyfish03"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onPopGem = function(A0_24, A1_25)
    EnemeyDropGem(A0_24, A1_25)
  end
}
enmgen2_a_06_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "lasercannon_mine_11",
      locator = "locator_a_06_01",
      name = "lasercannon01"
    },
    {
      type = "giant_mine_11",
      locator = "locator_a_06_02",
      name = "giant01"
    },
    {
      type = "imp_mine_02",
      locator = "locator_a_06_03",
      name = "imp01"
    },
    {
      type = "imp_mine_02",
      locator = "locator_a_06_04",
      name = "imp02"
    },
    {
      type = "treecannon_mine_11",
      locator = "locator_a_06_05",
      name = "treecannon01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_06_06",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_06_07",
      name = "gellyfish02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_06_08",
      name = "gellyfish03"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onSpawn = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onPopGem = function(A0_38, A1_39)
    EnemeyDropGem(A0_38, A1_39)
  end
}
enmgen2_a_07_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_11",
      locator = "locator_a_07_01",
      name = "defender01"
    },
    {
      type = "defender_mine_11",
      locator = "locator_a_07_02",
      name = "defender02"
    },
    {
      type = "lasercannon_mine_11",
      locator = "locator_a_07_03",
      name = "lasercannon01"
    },
    {
      type = "lasercannon_mine_11",
      locator = "locator_a_07_04",
      name = "lasercannon02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_07_05",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_07_06",
      name = "gellyfish02"
    },
    {
      type = "runner_mine_11",
      locator = "locator_a_07_07",
      name = "runner01"
    },
    {
      type = "stalker_mine_02",
      locator = "locator_a_07_08",
      name = "stalker01"
    },
    {
      type = "stalker_mine_02",
      locator = "locator_a_07_09",
      name = "stalker02"
    },
    {
      type = "runner_mine_11",
      locator = "locator_a_07_10",
      name = "runner01"
    },
    {
      type = "runner_mine_11",
      locator = "locator_a_07_11",
      name = "runner02"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onSpawn = function(A0_46, A1_47)
  end,
  onObjectAsh = function(A0_48, A1_49)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onPopGem = function(A0_52, A1_53)
    EnemeyDropGem(A0_52, A1_53)
  end
}
function InitializeBody()
  local L0_54
  L0_54 = {}
  L0_54.mineOreEvdName = "mine02_ore"
  L0_54.instance_flg = true
  L0_54.manager_name = g_own:getName()
  L0_54.deploy_areas = getElectedAreaNames()
  L0_54.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_54
end
function IngameBody()
  local L0_55
  L0_55 = {
    "pi2_a_05",
    "pi2_a_06",
    "pi2_a_07"
  }
  Fn_missionStart()
  Fn_showMineName()
  Fn_userCtrlOn()
  if Fn_getMine99FloorClear() then
    Fn_setGravityGateActive(true)
  else
    lithoThemeInit()
    missionTextVisible(true)
    repeat
      wait()
    until isLithographStart()
    setFirstHalfProcessEnd()
    Fn_missionView("ic_pi_monument_obj_00190", 0, nil, true)
    for _FORV_5_ = 1, #L0_55 do
      requestEnemyKill(L0_55[_FORV_5_], ({
        "a_05_01",
        "a_06_01",
        "a_07_01"
      })[_FORV_5_])
    end
    _litho_start = true
    waitSeconds(2)
    if findGameObject2("EnemyGenerator", "enmgen2_a_04_mine99_021") ~= nil then
      findGameObject2("EnemyGenerator", "enmgen2_a_04_mine99_021"):requestSpawn()
      _enemy_count_max = #findGameObject2("EnemyGenerator", "enmgen2_a_04_mine99_021"):getSpecTable().spawnSet
    end
    findGameObject2("EnemyGenerator", "enmgen2_a_04_mine99_021"):setEventListener("DestroyEnemyReport", Fn_destroyEnemyReport)
    HUD:counter999SetTextID("ic_pi_mine99_002")
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetNum(_enemy_count_max)
    HUD:counter999SetVisible(true)
    _litho_wait_task = invokeTask(function()
      while _litho_theme == nil do
        wait()
      end
      HUD:counter999SetVisible(false)
      Fn_missionInfoEnd()
      if _litho_theme == true then
        missionComplete()
        repeat
          wait()
        until isSecondHalfProcessWait()
        setSecondHalfProcessEnd()
        Fn_setMine99FloorClear()
        lithoThemeInit()
        Fn_setGravityGateActive(true)
      elseif _litho_theme == false then
        missionFailure()
        repeat
          wait()
        until isFailureProcessEnd()
        Fn_blackout()
        Fn_retryMine99()
      end
    end)
  end
end
function Fn_destroyEnemyReport(A0_56)
  local L1_57, L2_58
  L1_57 = A0_56.name
  L2_58 = A0_56.attacker
  if L1_57 == "childship01" then
    return
  end
  HUD:counter999SubNum()
  _enemy_destroy_num = _enemy_destroy_num + 1
  if L1_57 == _correct_answer_tbl[_enemy_destroy_num] then
    Sound:playSE("success")
    if _enemy_destroy_num == _enemy_count_max then
      _litho_theme = true
    end
  else
    _litho_theme = false
  end
  print("destroyEnemyName:" .. L1_57)
  print("attackerType:" .. L2_58)
end
function lithoThemeInit()
  _litho_theme = nil
  _enemy_count_max = 0
  _enemy_destroy_num = 0
  if _litho_wait_task ~= nil then
    _litho_wait_task:abort()
    _litho_wait_task = nil
  end
end
function requestEnemyKill(A0_59, A1_60)
  local L2_61
  L2_61 = Fn_findAreaHandle
  L2_61 = L2_61(A0_59)
  if L2_61 ~= nil then
    L2_61 = "enmgen2_"
    L2_61 = L2_61 .. A1_60
    if findGameObject2("EnemyGenerator", L2_61) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L2_61))
      findGameObject2("EnemyGenerator", L2_61):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L2_61))
    end
  else
    L2_61 = print
    L2_61(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_59))
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
