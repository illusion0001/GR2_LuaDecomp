dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_litho_theme = nil
_puppet_crow = nil
_brain_crow = nil
_enm_litho_01_01_h = nil
enmgen_litho_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_01_01_01",
      name = "litho_01_enemy_01"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_01_02",
      name = "litho_01_enemy_02"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_01_03",
      name = "litho_01_enemy_03"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_01_04",
      name = "litho_01_enemy_04"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_01_05",
      name = "litho_01_enemy_05"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_01_06",
      name = "litho_01_enemy_06"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_01_07",
      name = "litho_01_enemy_07"
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
enmgen_litho_01_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_litho_01_02_01",
      name = "litho_01_enemy_08"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_02_03",
      name = "litho_01_enemy_10"
    },
    {
      type = "runner",
      locator = "locator_litho_01_02_04",
      name = "litho_01_enemy_11"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_02_07",
      name = "litho_01_enemy_14"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_02_08",
      name = "litho_01_enemy_15"
    },
    {
      type = "stalker",
      locator = "locator_litho_01_02_09",
      name = "litho_01_enemy_16"
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
  onPopGem = function(A0_29, A1_30)
    Fn_enemyAshPopGem(A0_29, A1_30)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_31)
    return #A0_31.spawnSet
  end,
  getEnemyDeadNum = function(A0_32)
    local L1_33
    L1_33 = A0_32.enemyDeadNum
    return L1_33
  end,
  isEnemyAllDead = function(A0_34)
    local L2_35
    L2_35 = A0_34.enemyDeadNum
    L2_35 = L2_35 >= #A0_34.spawnSet
    return L2_35
  end
}
enmgen_litho_01_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_litho_01_03_01",
      name = "litho_01_enemy_17"
    },
    {
      type = "runner",
      locator = "locator_litho_01_03_02",
      name = "litho_01_enemy_18"
    }
  },
  onSpawn = function(A0_36, A1_37)
    A0_36:getSpecTable().enemyDeadNum = A0_36:getSpecTable().enemyDeadNum - 1
    if A0_36:getSpecTable().enemyDeadNum < 0 then
      A0_36:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_38, A1_39)
  end,
  onObjectAsh = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = A0_40:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_42, A1_43)
    Fn_enemyPopGemSetup(A0_42, {
      "litho_01_enemy_17"
    }, 1, 5)
  end,
  onPopGem = function(A0_44, A1_45)
    Fn_enemyAshPopGem(A0_44, A1_45)
  end,
  onUpdate = function(A0_46)
    local L1_47
  end,
  onEnter = function(A0_48)
    local L1_49
  end,
  onLeave = function(A0_50)
    local L1_51
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_52)
    return #A0_52.spawnSet
  end,
  getEnemyDeadNum = function(A0_53)
    local L1_54
    L1_54 = A0_53.enemyDeadNum
    return L1_54
  end,
  isEnemyAllDead = function(A0_55)
    local L2_56
    L2_56 = A0_55.enemyDeadNum
    L2_56 = L2_56 >= #A0_55.spawnSet
    return L2_56
  end
}
enmgen_litho_01_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_01_04_01",
      name = "litho_01_enemy_21"
    },
    {
      type = "imp",
      locator = "locator_litho_01_04_02",
      name = "litho_01_enemy_22"
    }
  },
  onUpdate = function(A0_57)
    local L1_58
  end,
  onEnter = function(A0_59)
    local L1_60
  end,
  onLeave = function(A0_61)
    local L1_62
  end,
  onSpawn = function(A0_63, A1_64)
    A0_63:getSpecTable().enemyDeadNum = A0_63:getSpecTable().enemyDeadNum - 1
    if A0_63:getSpecTable().enemyDeadNum < 0 then
      A0_63:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_65, A1_66)
  end,
  onObjectAsh = function(A0_67, A1_68)
    A0_67:getSpecTable().enemyDeadNum = A0_67:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_69, A1_70)
    Fn_enemyPopGemSetup(A0_69, {
      "litho_01_enemy_21",
      "litho_01_enemy_21"
    }, 1, 5)
  end,
  onPopGem = function(A0_71, A1_72)
    Fn_enemyAshPopGem(A0_71, A1_72)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_73)
    return #A0_73.spawnSet
  end,
  getEnemyDeadNum = function(A0_74)
    local L1_75
    L1_75 = A0_74.enemyDeadNum
    return L1_75
  end,
  isEnemyAllDead = function(A0_76)
    local L2_77
    L2_77 = A0_76.enemyDeadNum
    L2_77 = L2_77 >= #A0_76.spawnSet
    return L2_77
  end
}
function Initialize()
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  _enm_litho_01_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_01_01")
  _enm_litho_01_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_01_02")
  _enm_litho_01_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_01_03")
  _enm_litho_01_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_01_04")
  _enemy_max = enmgen_litho_01_01:getEnemyMax() + enmgen_litho_01_02:getEnemyMax() + enmgen_litho_01_03:getEnemyMax() + enmgen_litho_01_04:getEnemyMax()
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  Fn_missionStart()
  Fn_userCtrlOn()
  _litho_navi = invokeTask(function()
    local L0_78
    L0_78 = false
    repeat
      if L0_78 == false and Fn_getDistanceToPlayer("locator2_navi_litho_01") > 3 then
        L0_78 = true
        Fn_naviSet(findGameObject2("Node", "locator2_navi_litho_01"))
      elseif L0_78 == true and Fn_getDistanceToPlayer("locator2_navi_litho_01") < 3 then
        L0_78 = false
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
  _brain_crow:setIdling(false)
  invokeTask(function()
    Fn_missionView("ep12_09008", nil, nil, true)
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep12_09015")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_setBgmPoint("battle")
  end)
  repeat
    if _litho_theme == false then
      restart_litho()
    end
    wait()
  until _litho_theme
  invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen_litho_01_03:isEnemyAllDead() and enmgen_litho_01_04:isEnemyAllDead()
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end):abort()
  HUD:counter999SetVisible(false)
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete")
  _brain_crow:setIdling(true)
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  _brain_crow:setIdling(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_init()
  print("*** ep12_d:litho_init ***")
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
  end
  _enemy_spawn_task = invokeTask(prog_manage)
end
function prog_manage()
  if _enm_litho_01_01_h ~= nil then
    _enm_litho_01_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_01_01:isEnemyAllDead()
  if _enm_litho_01_02_h ~= nil then
    _enm_litho_01_02_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_01_02:isEnemyAllDead()
  if _enm_litho_01_03_h ~= nil then
    _enm_litho_01_03_h:requestSpawn()
  end
  if _enm_litho_01_04_h ~= nil then
    _enm_litho_01_04_h:requestSpawn()
  end
end
function Finalize()
  local L0_79, L1_80
end
