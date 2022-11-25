dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Mission/mine04_common.lua")
_event_file_name = "floor_022"
_floor_num = 22
_litho_theme = nil
_enemy_count_max = 0
_enmgen_list = nil
_litho_wait_task = nil
enmgen2_a_03_mine99_022 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "giant_mine_12",
      locator = "locator_mine99_022_01",
      name = "giant01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_mine99_022_03",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_mine99_022_05",
      name = "gellyfish02"
    },
    {
      type = "runner_mine_02",
      locator = "locator_mine99_022_06",
      name = "runner01"
    },
    {
      type = "runner_mine_02",
      locator = "locator_mine99_022_07",
      name = "runner02"
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
    HUD:counter999SetNum(0)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_a_18_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_18_01",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_18_02",
      name = "gellyfish02"
    },
    {
      type = "giant_mine_12",
      locator = "locator_a_18_03",
      name = "giant01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_18_06",
      name = "gellyfish03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_18_07",
      name = "gellyfish04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_18_08",
      name = "gellyfish05"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_18_09",
      name = "gellyfish06"
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
enmgen2_a_19_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "guardcore_mine_12",
      locator = "locator_a_19_01",
      name = "guardcore01"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_19_02",
      name = "treecannon01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_19_03",
      name = "runner01"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_19_04",
      name = "treecannon02"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_a_19_05",
      name = "treecannon03"
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
enmgen2_a_23_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_01",
      name = "stalker01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_02",
      name = "stalker02"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_23_03",
      name = "runner01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_04",
      name = "stalker04"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_05",
      name = "stalker05"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_06",
      name = "stalker06"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_23_07",
      name = "runner02"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_08",
      name = "stalker08"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_a_23_09",
      name = "stalker09"
    },
    {
      type = "jammer_mine_02",
      locator = "locator_a_23_10",
      name = "jammer01"
    },
    {
      type = "jammer_mine_02",
      locator = "locator_a_23_11",
      name = "jammer02"
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
  L0_54.mineOreEvdName = "mine04_ore"
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
    "az2_a_18",
    "az2_a_19",
    "az2_a_23"
  }
  if _create_fire_effect == false then
    putCandleFireEffect("az2_a_03", _candle_fire_max_az2_a_03, true)
    putCandleFireEffect("az2_a_18", _candle_fire_max_az2_a_18, true)
    putCandleFireEffect("az2_a_19", _candle_fire_max_az2_a_19, true)
    putCandleFireEffect("az2_a_20", _candle_fire_max_az2_a_20, true)
    putCandleFireEffect("az2_a_23", _candle_fire_max_az2_a_23, true)
    _create_fire_effect = true
  end
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
    Fn_missionView("ic_pi_monument_obj_00220", 0, nil, true)
    for _FORV_5_ = 1, #L0_55 do
      requestEnemyKill(L0_55[_FORV_5_], ({
        "a_18_01",
        "a_19_01",
        "a_23_01"
      })[_FORV_5_])
    end
    waitSeconds(2)
    if findGameObject2("EnemyGenerator", "enmgen2_a_03_mine99_022") ~= nil then
      findGameObject2("EnemyGenerator", "enmgen2_a_03_mine99_022"):requestSpawn()
      _enemyCount = #findGameObject2("EnemyGenerator", "enmgen2_a_03_mine99_022"):getSpecTable().spawnSet
      _enemyCountMax = _enemyCount
    end
    findGameObject2("EnemyGenerator", "enmgen2_a_03_mine99_022"):setEventListener("DamageEnemyReport", Fn_damageEnemyReport)
    findGameObject2("EnemyGenerator", "enmgen2_a_03_mine99_022"):setEventListener("DestroyEnemyReport", Fn_destroyEnemyReport)
    HUD:counter999SetTextID("ic_pi_mine99_002")
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetNum(1)
    HUD:counter999SetVisible(true)
    _litho_wait_task = invokeTask(function()
      while _litho_theme == nil do
        wait()
      end
      Fn_missionInfoEnd()
      HUD:counter999SetVisible(false)
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
      requestEnemyKill("az2_a_03", "a_03_mine99_022")
    end)
  end
end
function Fn_destroyEnemyReport(A0_56)
  local L1_57, L2_58
  L1_57 = _litho_theme
  if L1_57 == true then
    return
  end
  L1_57 = A0_56.name
  L2_58 = A0_56.attacker
  print("destroyEnemyName:" .. L1_57)
  print("attackerType:" .. L2_58)
  if L2_58 == "player" then
    invokeTask(function()
      Player:setStay(true)
      _litho_theme = false
    end)
  end
  if _litho_theme == nil then
    _litho_theme = true
  end
end
function Fn_damageEnemyReport(A0_59)
  local L1_60, L2_61, L3_62
  L1_60 = _litho_theme
  if L1_60 == true then
    return
  end
  L1_60 = A0_59.name
  L2_61 = A0_59.attacker
  L3_62 = A0_59.damageType
  if L2_61 == "player" and L3_62 ~= "none" then
    invokeTask(function()
      Player:setStay(true)
      _litho_theme = false
    end)
  end
  print("attackerName:" .. L1_60)
  print("attackerType:" .. L2_61)
  print("damageType:" .. L3_62)
end
function lithoThemeInit()
  _litho_theme = nil
  _enemyCount = 0
  _enemyCountMax = 0
  _vortex_hit = false
  _vortex_task = nil
  _damage_enemy_count = 0
  if _litho_wait_task ~= nil then
    _litho_wait_task:abort()
    _litho_wait_task = nil
  end
end
function requestEnemyKill(A0_63, A1_64)
  local L2_65
  L2_65 = Fn_findAreaHandle
  L2_65 = L2_65(A0_63)
  if L2_65 ~= nil then
    L2_65 = "enmgen2_"
    L2_65 = L2_65 .. A1_64
    if findGameObject2("EnemyGenerator", L2_65) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L2_65))
      findGameObject2("EnemyGenerator", L2_65):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L2_65))
    end
  else
    L2_65 = print
    L2_65(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_63))
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
