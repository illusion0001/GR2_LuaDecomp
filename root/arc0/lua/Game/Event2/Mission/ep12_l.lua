dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_litho_theme = nil
_puppet_crow = nil
_brain_crow = nil
enmgen_litho_04_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_litho_04_01_01",
      name = "litho_04_enemy_01"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_04_01_02",
      name = "litho_04_enemy_02"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_04_01_03",
      name = "litho_04_enemy_03"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_04_01_04",
      name = "litho_04_enemy_04"
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
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "litho_04_enemy_01"
    }, 1, 5)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
enmgen_litho_04_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_04_02_01",
      name = "litho_04_enemy_05"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_02",
      name = "litho_04_enemy_06"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_03",
      name = "litho_04_enemy_07"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_04",
      name = "litho_04_enemy_08"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_05",
      name = "litho_04_enemy_09"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_06",
      name = "litho_04_enemy_10"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_07",
      name = "litho_04_enemy_11"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_08",
      name = "litho_04_enemy_12"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_09",
      name = "litho_04_enemy_13"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_02_10",
      name = "litho_04_enemy_14"
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
  onSpawn = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum - 1
    if A0_27:getSpecTable().enemyDeadNum < 0 then
      A0_27:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_29, A1_30)
  end,
  onObjectAsh = function(A0_31, A1_32)
    A0_31:getSpecTable().enemyDeadNum = A0_31:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "litho_04_enemy_10"
    }, 1, 5, "b1")
    Fn_enemyPopGemSetup(A0_33, {
      "litho_04_enemy_14"
    }, 1, 5, "b2")
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36, {"b1", "b2"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end,
  isEnemyAllDead = function(A0_40)
    local L2_41
    L2_41 = A0_40.enemyDeadNum
    L2_41 = L2_41 >= #A0_40.spawnSet
    return L2_41
  end
}
enmgen_litho_04_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_04_03_03",
      name = "litho_04_enemy_17"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_04_03_04",
      name = "litho_04_enemy_18"
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
  onSpawn = function(A0_48, A1_49)
    A0_48:getSpecTable().enemyDeadNum = A0_48:getSpecTable().enemyDeadNum - 1
    if A0_48:getSpecTable().enemyDeadNum < 0 then
      A0_48:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onObjectAsh = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyDeadNum = A0_52:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_54, A1_55)
    Fn_enemyPopGemSetup(A0_54, {
      "litho_04_enemy_17",
      "litho_04_enemy_18"
    }, 2, 6)
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_58)
    return #A0_58.spawnSet
  end,
  getEnemyDeadNum = function(A0_59)
    local L1_60
    L1_60 = A0_59.enemyDeadNum
    return L1_60
  end,
  isEnemyAllDead = function(A0_61)
    local L2_62
    L2_62 = A0_61.enemyDeadNum
    L2_62 = L2_62 >= #A0_61.spawnSet
    return L2_62
  end
}
enmgen_litho_04_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_litho_04_04_01",
      name = "litho_04_enemy_19"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_04_02",
      name = "litho_04_enemy_20"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_04_03",
      name = "litho_04_enemy_21"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_04_04",
      name = "litho_04_enemy_22"
    },
    {
      type = "stalker",
      locator = "locator_litho_04_04_05",
      name = "litho_04_enemy_23"
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
  onSpawn = function(A0_69, A1_70)
    A0_69:getSpecTable().enemyDeadNum = A0_69:getSpecTable().enemyDeadNum - 1
    if A0_69:getSpecTable().enemyDeadNum < 0 then
      A0_69:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_71, A1_72)
  end,
  onObjectAsh = function(A0_73, A1_74)
    A0_73:getSpecTable().enemyDeadNum = A0_73:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_75, A1_76)
    Fn_enemyPopGemSetup(A0_75, {
      "litho_04_enemy_19"
    }, 1, 5, "b1")
    Fn_enemyPopGemSetup(A0_75, {
      "litho_04_enemy_20"
    }, 1, 5, "b2")
  end,
  onPopGem = function(A0_77, A1_78)
    Fn_enemyAshPopGem(A0_77, A1_78, {"b1", "b2"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_79)
    return #A0_79.spawnSet
  end,
  getEnemyDeadNum = function(A0_80)
    local L1_81
    L1_81 = A0_80.enemyDeadNum
    return L1_81
  end,
  isEnemyAllDead = function(A0_82)
    local L2_83
    L2_83 = A0_82.enemyDeadNum
    L2_83 = L2_83 >= #A0_82.spawnSet
    return L2_83
  end
}
enmgen_litho_04_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_litho_04_05_01",
      name = "litho_04_enemy_24"
    },
    {
      type = "runner",
      locator = "locator_litho_04_05_02",
      name = "litho_04_enemy_25"
    }
  },
  onUpdate = function(A0_84)
    local L1_85
  end,
  onEnter = function(A0_86)
    local L1_87
  end,
  onLeave = function(A0_88)
    local L1_89
  end,
  onSpawn = function(A0_90, A1_91)
    A0_90:getSpecTable().enemyDeadNum = A0_90:getSpecTable().enemyDeadNum - 1
    if A0_90:getSpecTable().enemyDeadNum < 0 then
      A0_90:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onObjectAsh = function(A0_94, A1_95)
    A0_94:getSpecTable().enemyDeadNum = A0_94:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_96)
    return #A0_96.spawnSet
  end,
  getEnemyDeadNum = function(A0_97)
    local L1_98
    L1_98 = A0_97.enemyDeadNum
    return L1_98
  end,
  isEnemyAllDead = function(A0_99)
    local L2_100
    L2_100 = A0_99.enemyDeadNum
    L2_100 = L2_100 >= #A0_99.spawnSet
    return L2_100
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  _enm_litho_04_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_04_01")
  _enm_litho_04_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_04_02")
  _enm_litho_04_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_04_03")
  _enm_litho_04_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_04_04")
  _enm_litho_04_05_h = findGameObject2("EnemyGenerator", "enmgen2_litho_04_05")
  _enemy_max = enmgen_litho_04_01:getEnemyMax() + enmgen_litho_04_02:getEnemyMax() + enmgen_litho_04_03:getEnemyMax() + enmgen_litho_04_04:getEnemyMax() + enmgen_litho_04_05:getEnemyMax()
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  _brain_crow:setAbility(Supporter.Ability.Parallel.Jupiter, false)
  Fn_missionStart()
  Fn_userCtrlOn()
  _litho_navi = invokeTask(function()
    local L0_101
    L0_101 = false
    repeat
      if L0_101 == false and Fn_getDistanceToPlayer("locator2_navi_litho_04") > 3 then
        L0_101 = true
        Fn_naviSet(findGameObject2("Node", "locator2_navi_litho_04"))
      elseif L0_101 == true and Fn_getDistanceToPlayer("locator2_navi_litho_04") < 3 then
        L0_101 = false
        Fn_naviKill()
      end
      wait()
    until Fn_sendEventComSb("isLithographStart")
    Fn_naviKill()
  end)
  Fn_sendEventComSb("aisleMissionView")
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  _litho_navi:abort()
  litho_init()
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  invokeTask(function()
    Fn_missionView("ep12_09011", nil, nil, true)
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep12_09015")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_setBgmPoint("battle")
  end)
  repeat
    wait()
  until _litho_theme
  HUD:counter999SetVisible(false)
  invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen_litho_04_04:isEnemyAllDead() and enmgen_litho_04_05:isEnemyAllDead()
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end):abort()
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_init()
  print("*** ep12_l:litho_init ***")
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
  end
  _enemy_spawn_task = invokeTask(prog_manage)
end
function prog_manage()
  if _enm_litho_04_01_h ~= nil then
    _enm_litho_04_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_04_01:isEnemyAllDead()
  if _enm_litho_04_02_h ~= nil then
    _enm_litho_04_02_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_04_02:isEnemyAllDead()
  if _enm_litho_04_03_h ~= nil then
    _enm_litho_04_03_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_04_03:isEnemyAllDead()
  if _enm_litho_04_04_h ~= nil then
    _enm_litho_04_04_h:requestSpawn()
  end
  if _enm_litho_04_05_h ~= nil then
    _enm_litho_04_05_h:requestSpawn()
  end
end
function Finalize()
  local L0_102, L1_103
end
