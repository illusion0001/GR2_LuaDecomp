dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_litho_theme = nil
_enm_litho_05_01_h = nil
_enm_litho_05_02_h = nil
_enm_litho_05_03_h = nil
_enm_litho_05_04_h = nil
_enm_litho_05_05_h = nil
_enm_litho_05_06_h = nil
_cactus_max = 36
_cactus_hdl = {}
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_island_sink_task = nil
_island_sink_tbl = {
  {
    loc = "litho_05_01_sink",
    wait_time = 15
  },
  {
    loc = "litho_05_02_sink",
    wait_time = 15
  },
  {
    loc = "litho_05_03_sink",
    wait_time = 12
  },
  {
    loc = "litho_05_04_sink",
    wait_time = 12
  },
  {
    loc = "litho_05_05_sink",
    wait_time = 10
  },
  {
    loc = "litho_05_06_sink",
    wait_time = 8
  },
  {
    loc = "litho_05_07_sink",
    wait_time = 6
  },
  {
    loc = "litho_05_99_sink",
    wait_time = 2
  },
  {
    loc = "litho_05_00_sink",
    wait_time = 2
  }
}
_enemy_max = 0
_giant_kill = false
enmgen_litho_05_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_05_01_enm_01",
      name = "litho_05_enemy_01"
    },
    {
      type = "stalker",
      locator = "locator_litho_05_01_enm_02",
      name = "litho_05_enemy_02"
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
  onSpawn = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
enmgen_litho_05_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_litho_05_02_enm_01",
      name = "litho_05_enemy_03"
    }
  },
  onUpdate = function(A0_17)
    local L1_18
  end,
  onEnter = function(A0_19)
    local L1_20
  end,
  onLeave = function(A0_21)
    local L1_22
  end,
  onSpawn = function(A0_23, A1_24)
    A0_23:getSpecTable().enemyDeadNum = A0_23:getSpecTable().enemyDeadNum - 1
    if A0_23:getSpecTable().enemyDeadNum < 0 then
      A0_23:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_25, A1_26)
  end,
  onObjectAsh = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_29)
    return #A0_29.spawnSet
  end,
  getEnemyDeadNum = function(A0_30)
    local L1_31
    L1_31 = A0_30.enemyDeadNum
    return L1_31
  end,
  isEnemyAllDead = function(A0_32)
    local L2_33
    L2_33 = A0_32.enemyDeadNum
    L2_33 = L2_33 >= #A0_32.spawnSet
    return L2_33
  end
}
enmgen_litho_05_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_05_03_enm_01",
      name = "litho_05_enemy_04"
    }
  },
  onUpdate = function(A0_34)
    local L1_35
  end,
  onEnter = function(A0_36)
    local L1_37
  end,
  onLeave = function(A0_38)
    local L1_39
  end,
  onSpawn = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = A0_40:getSpecTable().enemyDeadNum - 1
    if A0_40:getSpecTable().enemyDeadNum < 0 then
      A0_40:getSpecTable().enemyDeadNum = 0
    end
  end,
  onSetupGem = function(A0_42, A1_43)
    Fn_enemyPopGemSetup(A0_42, {
      "litho_05_enemy_04"
    }, 1, 5)
  end,
  onPopGem = function(A0_44, A1_45)
    Fn_enemyAshPopGem(A0_44, A1_45)
  end,
  onObjectDead = function(A0_46, A1_47)
  end,
  onObjectAsh = function(A0_48, A1_49)
    A0_48:getSpecTable().enemyDeadNum = A0_48:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_50)
    return #A0_50.spawnSet
  end,
  getEnemyDeadNum = function(A0_51)
    local L1_52
    L1_52 = A0_51.enemyDeadNum
    return L1_52
  end,
  isEnemyAllDead = function(A0_53)
    local L2_54
    L2_54 = A0_53.enemyDeadNum
    L2_54 = L2_54 >= #A0_53.spawnSet
    return L2_54
  end
}
enmgen_litho_05_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_litho_05_04_enm_01",
      name = "litho_05_enemy_05"
    }
  },
  onUpdate = function(A0_55)
    local L1_56
  end,
  onEnter = function(A0_57)
    local L1_58
  end,
  onLeave = function(A0_59)
    local L1_60
  end,
  onSpawn = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum - 1
    if A0_61:getSpecTable().enemyDeadNum < 0 then
      A0_61:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_63, A1_64)
  end,
  onObjectAsh = function(A0_65, A1_66)
    A0_65:getSpecTable().enemyDeadNum = A0_65:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
    if HUD:counter999GetNum() == 0 then
      _giant_kill = true
    end
  end,
  onSetupGem = function(A0_67, A1_68)
    Fn_enemyPopGemSetup(A0_67, {
      "litho_05_enemy_05"
    }, 1, 5)
  end,
  onPopGem = function(A0_69, A1_70)
    Fn_enemyAshPopGem(A0_69, A1_70)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_71)
    return #A0_71.spawnSet
  end,
  getEnemyDeadNum = function(A0_72)
    local L1_73
    L1_73 = A0_72.enemyDeadNum
    return L1_73
  end,
  isEnemyAllDead = function(A0_74)
    local L2_75
    L2_75 = A0_74.enemyDeadNum
    L2_75 = L2_75 >= #A0_74.spawnSet
    return L2_75
  end
}
enmgen_litho_05_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_05_05_enm_01",
      name = "litho_05_enemy_06"
    },
    {
      type = "stalker",
      locator = "locator_litho_05_05_enm_02",
      name = "litho_05_enemy_07"
    }
  },
  onUpdate = function(A0_76)
    local L1_77
  end,
  onEnter = function(A0_78)
    local L1_79
  end,
  onLeave = function(A0_80)
    local L1_81
  end,
  onSpawn = function(A0_82, A1_83)
    A0_82:getSpecTable().enemyDeadNum = A0_82:getSpecTable().enemyDeadNum - 1
    if A0_82:getSpecTable().enemyDeadNum < 0 then
      A0_82:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_84, A1_85)
  end,
  onObjectAsh = function(A0_86, A1_87)
    A0_86:getSpecTable().enemyDeadNum = A0_86:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_88, A1_89)
    Fn_enemyPopGemSetup(A0_88, {
      "litho_05_enemy_06",
      "litho_05_enemy_07"
    }, 2, 5)
  end,
  onPopGem = function(A0_90, A1_91)
    Fn_enemyAshPopGem(A0_90, A1_91)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_92)
    return #A0_92.spawnSet
  end,
  getEnemyDeadNum = function(A0_93)
    local L1_94
    L1_94 = A0_93.enemyDeadNum
    return L1_94
  end,
  isEnemyAllDead = function(A0_95)
    local L2_96
    L2_96 = A0_95.enemyDeadNum
    L2_96 = L2_96 >= #A0_95.spawnSet
    return L2_96
  end
}
enmgen_litho_05_06 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_05_06_enm_02",
      name = "litho_05_enemy_09"
    }
  },
  onUpdate = function(A0_97)
    local L1_98
  end,
  onEnter = function(A0_99)
    local L1_100
  end,
  onLeave = function(A0_101)
    local L1_102
  end,
  onSpawn = function(A0_103, A1_104)
    A0_103:getSpecTable().enemyDeadNum = A0_103:getSpecTable().enemyDeadNum - 1
    if A0_103:getSpecTable().enemyDeadNum < 0 then
      A0_103:getSpecTable().enemyDeadNum = 0
    end
  end,
  onSetupGem = function(A0_105, A1_106)
    Fn_enemyPopGemSetup(A0_105, {
      "litho_05_enemy_09"
    }, 1, 6)
  end,
  onPopGem = function(A0_107, A1_108)
    Fn_enemyAshPopGem(A0_107, A1_108)
  end,
  onObjectDead = function(A0_109, A1_110)
  end,
  onObjectAsh = function(A0_111, A1_112)
    A0_111:getSpecTable().enemyDeadNum = A0_111:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_113)
    return #A0_113.spawnSet
  end,
  getEnemyDeadNum = function(A0_114)
    local L1_115
    L1_115 = A0_114.enemyDeadNum
    return L1_115
  end,
  isEnemyAllDead = function(A0_116)
    local L2_117
    L2_117 = A0_116.enemyDeadNum
    L2_117 = L2_117 >= #A0_116.spawnSet
    return L2_117
  end
}
function Initialize()
  _enm_litho_05_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_01")
  _enm_litho_05_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_02")
  _enm_litho_05_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_03")
  _enm_litho_05_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_04")
  _enm_litho_05_05_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_05")
  _enm_litho_05_06_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_06")
  _enm_litho_05_07_h = findGameObject2("EnemyGenerator", "enmgen2_litho_05_07")
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  _area_05_hdl = Fn_findAreaHandle("az_a_05")
  _enemy_max = enmgen_litho_05_01:getEnemyMax() + enmgen_litho_05_02:getEnemyMax() + enmgen_litho_05_03:getEnemyMax() + enmgen_litho_05_04:getEnemyMax() + enmgen_litho_05_05:getEnemyMax() + enmgen_litho_05_06:getEnemyMax()
  _event_motion_table = {
    label01 = "kit01_stay_heat_00",
    label02 = "kit01_stay_00"
  }
  Fn_loadPlayerMotion(_event_motion_table)
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_g")
  _catwarp_change = false
end
function Ingame()
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  invokeTask(function()
    repeat
      wait()
    until Player:getRecentAreaName() == "az_a_05" or _catwarp_change
    Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_j")
    print("***** ep03_catwarp point:" .. Fn_getCatWarpCheckPoint() .. " *****")
  end)
  Fn_missionStart()
  Fn_userCtrlOn()
  _island_navi = invokeTask(function()
    Fn_sendEventComSb("ViewMission")
    waitSeconds(1.3)
    repeat
      if false == false and Fn_getDistanceToPlayer("locator2_litho_navi_05_02") > 5 then
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_05_02"))
        if not _catwarp_change then
          _catwarp_change = true
        end
      elseif true == true and Fn_getDistanceToPlayer("locator2_litho_navi_05_02") < 5 then
        Fn_naviKill()
      end
      wait()
    until Fn_sendEventComSb("isLithographStart")
    Fn_naviKill()
  end)
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  litho_init()
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  Fn_sendEventComSb("vitalGemrReset", "30")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_userCtrlAllOff()
  Player:setStay(true)
  HUD:info("ep03_info_02", true)
  Fn_userCtrlOn()
  Player:setStay(false)
  max_sp = Player:getEnergyMax(Player.kEnergy_SpAttack)
  Player:setEnergy(Player.kEnergy_SpAttack, max_sp)
  _island_navi = invokeTask(function()
    local L0_118
    L0_118 = false
    _island_navi_disp = 150
    repeat
      if L0_118 == false and Fn_getDistanceToPlayer("locator2_litho_navi_05_01") > _island_navi_disp then
        L0_118 = true
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_05_01"))
      elseif L0_118 == true and Fn_getDistanceToPlayer("locator2_litho_navi_05_01") < _island_navi_hide then
        L0_118 = false
        Fn_naviKill()
      end
      wait()
    until _litho_theme
    Fn_naviKill()
  end)
  invokeTask(function()
    Fn_missionView("ep03_10003", nil, nil, true)
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep03_09013")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_setBgmPoint("battle")
  end)
  invokeTask(function()
    Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[8].loc)
    repeat
      wait()
    until Fn_sendEventComSb("isAreaMoveEnd")
    waitSeconds(5)
    Fn_captionViewWait("ep03_10005")
    Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[9].loc)
    repeat
      wait()
    until Fn_sendEventComSb("isAreaMoveEnd")
    waitSeconds(5)
    Fn_captionViewWait("ep03_10006")
    Fn_captionViewWait("ep03_10007")
    start_drift()
  end)
  invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen_litho_05_01:isEnemyAllDead() and enmgen_litho_05_02:isEnemyAllDead() and enmgen_litho_05_03:isEnemyAllDead() and enmgen_litho_05_04:isEnemyAllDead() and enmgen_litho_05_05:isEnemyAllDead() and enmgen_litho_05_06:isEnemyAllDead()
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end)
  repeat
    wait()
  until _litho_theme
  if _giant_kill then
    waitSeconds(2.5)
  end
  Fn_userCtrlAllOff()
  Player:setStay(true)
  Fn_sendEventComSb("setSecondHalfProcessPre")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessPreStart")
  Fn_setBgmPoint("event", "battle_end")
  HUD:counter999SetVisible(false)
  _island_navi:abort()
  stop_drift()
  Fn_sendEventComSb("requestStopArea", "az_a_05")
  Fn_sendEventComSb("requestWarpArea", "az_a_05", "locator2_az_a_05_set_02", 0)
  repeat
    wait()
  until Fn_sendEventComSb("isAreaWarpEnd")
  Fn_sendEventComSb("setSecondHalfProcessPreEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_init()
  local L0_119, L1_120, L2_121, L3_122
  L0_119(L1_120)
  for L3_122 = 1, _cactus_max do
    _cactus_hdl[L3_122] = _area_05_hdl:findChildNode(string.format("az_cactus_05_%02d", L3_122), true)
    if _cactus_hdl[L3_122] ~= nil and _cactus_hdl[L3_122]:isBroken() then
      _cactus_hdl[L3_122]:requestRestoreForce()
    end
  end
  _enemy_spawn_task = L0_119
end
function prog_manage()
  if _enm_litho_05_01_h ~= nil then
    _enm_litho_05_01_h:requestSpawn()
  end
  if _enm_litho_05_02_h ~= nil then
    _enm_litho_05_02_h:requestSpawn()
  end
  if _enm_litho_05_06_h ~= nil then
    _enm_litho_05_06_h:requestSpawn()
  end
  invokeTask(function()
    repeat
      wait()
    until enmgen_litho_05_02:isEnemyAllDead()
    if _enm_litho_05_03_h ~= nil then
      _enm_litho_05_03_h:requestSpawn()
    end
  end)
  invokeTask(function()
    repeat
      wait()
    until enmgen_litho_05_01:isEnemyAllDead()
    if _enm_litho_05_05_h ~= nil then
      _enm_litho_05_05_h:requestSpawn()
    end
  end)
  invokeTask(function()
    repeat
      wait()
    until enmgen_litho_05_06:isEnemyAllDead() and enmgen_litho_05_05:isEnemyAllDead()
    if _enm_litho_05_04_h ~= nil then
      _enm_litho_05_04_h:requestSpawn()
    end
  end)
end
function start_drift()
  local L0_123
  L0_123 = {}
  L0_123.xz = {
    rand = 1,
    sign = 1,
    max_a = 0,
    min_a = 0,
    max_t = 20,
    min_t = 20
  }
  L0_123.y = {
    rand = 1,
    sign = 1,
    max_a = 0.5,
    min_a = 0.1,
    max_t = 1,
    min_t = 0.1
  }
  L0_123.angle = {
    rand = 1,
    sign = 1,
    max_a = 0,
    min_a = 0,
    max_t = 20,
    min_t = 20
  }
  _area_05_hdl:setDriftParams(L0_123)
  _island_sink_task = invokeTask(function()
    local L0_124
    L0_124 = 4
    repeat
      L0_124 = L0_124 + RandI(-2, 2)
      if L0_124 < 2 then
        L0_124 = 2
      elseif L0_124 > 7 then
        L0_124 = 7
      end
      if 4 ~= L0_124 then
        Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[L0_124].loc)
        repeat
          wait()
        until Fn_sendEventComSb("isAreaMoveEnd")
        waitSeconds(_island_sink_tbl[L0_124].wait_time)
      end
      wait()
    until _litho_theme
  end)
end
function stop_drift()
  local L0_125
  L0_125 = {}
  L0_125.xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.8,
    min_a = 0.1,
    max_t = 30,
    min_t = 10
  }
  L0_125.y = {
    rand = 1,
    sign = 0.85,
    max_a = 1,
    min_a = 0.5,
    max_t = 10,
    min_t = 5
  }
  L0_125.angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0,
    min_a = 0,
    max_t = 120,
    min_t = 30
  }
  _area_05_hdl:setDriftParams(L0_125)
  Fn_sendEventComSb("requestWarpArea", "az_a_05", "locator2_az_a_05_set_02", 0)
  repeat
    wait()
  until Fn_sendEventComSb("isAreaWarpEnd")
end
function Finalize()
  local L0_126, L1_127
end
