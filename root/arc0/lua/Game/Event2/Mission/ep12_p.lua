dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_litho_06 = false
_litho_theme = nil
_sdemo_end = false
_puppet_crow = nil
_brain_crow = nil
_laser_tesk = {}
_litho_06_goal = false
enmgen_litho_06_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator_litho_06_01_01",
      name = "litho_06_laser_01",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_01_02",
      name = "litho_06_laser_02",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_01_03",
      name = "litho_06_laser_03",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_01_04",
      name = "litho_06_laser_04",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_01_05",
      name = "litho_06_laser_05",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
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
enmgen_litho_06_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator_litho_06_02_01",
      name = "litho_06_laser_06",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_02_02",
      name = "litho_06_laser_07",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_02_03",
      name = "litho_06_laser_08",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_02_04",
      name = "litho_06_laser_09",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_02_05",
      name = "litho_06_laser_10",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
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
enmgen_litho_06_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator_litho_06_03_01",
      name = "litho_06_laser_11",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_03_02",
      name = "litho_06_laser_12",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_03_03",
      name = "litho_06_laser_13",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_litho_06_03_04",
      name = "litho_06_laser_14",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
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
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().enemyDeadNum = A0_44:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_46)
    return #A0_46.spawnSet
  end,
  getEnemyDeadNum = function(A0_47)
    local L1_48
    L1_48 = A0_47.enemyDeadNum
    return L1_48
  end,
  isEnemyAllDead = function(A0_49)
    local L2_50
    L2_50 = A0_49.enemyDeadNum
    L2_50 = L2_50 >= #A0_49.spawnSet
    return L2_50
  end
}
enmgen_litho_06_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_litho_06_04_01",
      name = "litho_06_giant_15"
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
  onSpawn = function(A0_57, A1_58)
    A0_57:getSpecTable().enemyDeadNum = A0_57:getSpecTable().enemyDeadNum - 1
    if A0_57:getSpecTable().enemyDeadNum < 0 then
      A0_57:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_59, A1_60)
  end,
  onObjectAsh = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_63)
    return #A0_63.spawnSet
  end,
  getEnemyDeadNum = function(A0_64)
    local L1_65
    L1_65 = A0_64.enemyDeadNum
    return L1_65
  end,
  isEnemyAllDead = function(A0_66)
    local L2_67
    L2_67 = A0_66.enemyDeadNum
    L2_67 = L2_67 >= #A0_66.spawnSet
    return L2_67
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  _enm_litho_06_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_01")
  _enm_litho_06_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_02")
  _enm_litho_06_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_03")
  _enm_litho_06_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_04")
  Fn_pcSensorOff("pccubesensor2_navi_01")
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
    local L0_68
    L0_68 = false
    repeat
      if L0_68 == false and Fn_getDistanceToPlayer("locator2_navi_litho_06") > 3 then
        L0_68 = true
        Fn_naviSet(findGameObject2("Node", "locator2_navi_litho_06"))
      elseif L0_68 == true and Fn_getDistanceToPlayer("locator2_navi_litho_06") < 3 then
        L0_68 = false
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
  Fn_sendEventComSb("requestMoveRubble", "ANY_MOVE", "litho_06_start", 4, 1.5)
  litho_theme()
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  invokeTask(function()
    HUD:info("ep12_info_05")
    Fn_missionView("ep12_09013", nil, nil, true)
    Fn_setBgmPoint("battle")
  end)
  _pc_dmg = invokeTask(function()
    repeat
      wait()
    until Player:getLastFrameDamagePoint() > 0
    _litho_theme = false
  end)
  Fn_pcSensorOn("pccubesensor2_navi_01")
  Fn_naviKill()
  wait(10)
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_navi_01"))
  repeat
    if _litho_theme == false then
      restart_litho()
      Fn_captionViewWait("ep12_07002")
    end
    wait()
  until _litho_theme
  _pc_dmg:abort()
  invokeTask(function()
    repeat
      repeat
        wait()
      until _litho_06_goal
      if _litho_theme == nil then
        _litho_theme = true
      end
      wait()
    until _litho_theme
  end):abort()
  for _FORV_4_, _FORV_5_ in ipairs(_laser_tesk) do
    if _FORV_5_ ~= nil then
      _FORV_5_:abort()
    end
  end
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("setSecondHalfProcessPre")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessPreStart")
  if _enm_litho_06_01_h ~= nil then
    _enm_litho_06_01_h:requestAllEnemyKill()
  end
  if _enm_litho_06_02_h ~= nil then
    _enm_litho_06_02_h:requestAllEnemyKill()
  end
  if _enm_litho_06_03_h ~= nil then
    _enm_litho_06_03_h:requestAllEnemyKill()
  end
  if _enm_litho_06_04_h ~= nil then
    _enm_litho_06_04_h:requestAllEnemyKill()
  end
  Fn_sendEventComSb("setSecondHalfProcessPreEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_theme()
  print("*** ep12_p:litho_theme ***")
  Fn_sendEventComSb("statusChengeEp12", "demo")
  Fn_userCtrlAllOff()
  Player:setStay(true)
  litho_init()
  waitSeconds(2)
  Fn_userCtrlOn()
  Player:setStay(false)
end
function litho_init()
  local L0_69, L1_70, L2_71, L3_72
  L0_69(L1_70)
  _litho_theme = nil
  if L0_69 ~= nil then
    L0_69(L1_70)
  end
  if L0_69 ~= nil then
    L0_69(L1_70)
  end
  if L0_69 ~= nil then
    L0_69(L1_70)
  end
  if L0_69 ~= nil then
    L0_69(L1_70)
  end
  for L3_72 = 1, 14 do
    Fn_pcSensorOn(string.format("pccubesensor2_laser_%02d", L3_72))
  end
  L0_69(L1_70, L2_71)
  L0_69(L1_70, L2_71)
  L0_69(L1_70, L2_71)
  L0_69(L1_70, L2_71)
end
function restart_litho()
  print("*** ep12_p:restart_litho ***")
  if _enm_litho_06_01_h ~= nil then
    _enm_litho_06_01_h:requestIdlingEnemy(false)
  end
  if _enm_litho_06_02_h ~= nil then
    _enm_litho_06_02_h:requestIdlingEnemy(false)
  end
  if _enm_litho_06_03_h ~= nil then
    _enm_litho_06_03_h:requestIdlingEnemy(false)
  end
  if _enm_litho_06_04_h ~= nil then
    _enm_litho_06_04_h:requestIdlingEnemy(false)
  end
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
  end
  for _FORV_3_, _FORV_4_ in ipairs(_laser_tesk) do
    if _FORV_4_ ~= nil then
      _FORV_4_:abort()
    end
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function pccubesensor2_litho_06_goal_OnEnter()
  if _litho_06_goal == false then
    _litho_06_goal = true
    Fn_pcSensorOff("pccubesensor2_litho_06_goal")
  end
end
function attack_laser(A0_73)
  local L1_74
  repeat
    L1_74 = findGameObject2
    L1_74 = L1_74("EnemyBrain", string.format("litho_06_laser_%02d", A0_73))
    if L1_74 ~= nil then
      L1_74:eventMessage("Laser")
      waitSeconds(10)
    end
    wait()
  until _litho_theme ~= nil
end
function pccubesensor2_laser_OnEnter(A0_75, A1_76)
  local L2_77, L3_78
  L3_78 = A0_75
  L2_77 = A0_75.getName
  L2_77 = L2_77(L3_78)
  L3_78 = print
  L3_78("lasercannon sensor:" .. L2_77)
  L3_78 = Fn_pcSensorOff
  L3_78(L2_77)
  L3_78 = string
  L3_78 = L3_78.sub
  L3_78 = L3_78(L2_77, -2)
  _laser_tesk[tonumber(L3_78)] = invokeTask(attack_laser, L3_78)
end
function guide_navi(A0_79)
  local L1_80
  L1_80 = findGameObject2
  L1_80 = L1_80("Node", string.format("pccubesensor2_navi_%02d", A0_79))
  if L1_80 ~= nil then
    print("***** guide_navi [ " .. A0_79 .. "] *****")
    Fn_pcSensorOn(L1_80)
    Fn_naviSet(L1_80)
  else
    print("nil ")
    Fn_naviKill()
  end
end
function pccubesensor2_navi_OnEnter(A0_81, A1_82)
  local L2_83
  L2_83 = Fn_pcSensorOff
  L2_83(A0_81)
  L2_83 = tonumber
  L2_83 = L2_83(string.sub(A0_81:getName(), -2))
  L2_83 = L2_83 + 1
  invokeTask(guide_navi, L2_83)
end
function requestAreaMannager(A0_84)
  if _request_area_manager then
    _request_area_manager = false
    _area_manege = true
    _area_manage_part = A0_84
  end
end
function Finalize()
  local L0_85, L1_86
end
