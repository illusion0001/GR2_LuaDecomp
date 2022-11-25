dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("GlobalGem")
_litho_07 = false
_litho_theme = false
_sdemo_end = false
_enm_litho_07_01_h = nil
_litho_timer_task = nil
_clear_time = {
  0,
  1,
  29,
  99
}
_puppet_crow = nil
_brain_crow = nil
_count_dead = 0
enmgen_litho_07_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_litho_07_01_01",
      name = "litho_07_enemy_01"
    },
    {
      type = "stalker",
      locator = "locator_litho_07_01_02",
      name = "litho_07_enemy_02"
    },
    {
      type = "stalker",
      locator = "locator_litho_07_01_03",
      name = "litho_07_enemy_03"
    },
    {
      type = "guardcore",
      locator = "locator_litho_07_01_04",
      name = "litho_07_enemy_04"
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
    _count_dead = _count_dead + 1
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "litho_07_enemy_01"
    }, 1, 6, "s1")
    Fn_enemyPopGemSetup(A0_12, {
      "litho_07_enemy_04"
    }, 1, 4, "e1")
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15, {"s1", "e1"})
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
enmgen_litho_07_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_07_02_01",
      name = "litho_07_enemy_05"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_02_02",
      name = "litho_07_enemy_06"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_02_03",
      name = "litho_07_enemy_07"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_02_04",
      name = "litho_07_enemy_08"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_02_05",
      name = "litho_07_enemy_09"
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
    _count_dead = _count_dead + 1
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "litho_07_enemy_05",
      "litho_07_enemy_06",
      "litho_07_enemy_07",
      "litho_07_enemy_08",
      "litho_07_enemy_09"
    }, 2, 6)
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36)
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
enmgen_litho_07_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_litho_07_03_01",
      name = "litho_07_enemy_10"
    },
    {
      type = "guardcore",
      locator = "locator_litho_07_03_02",
      name = "litho_07_enemy_11"
    },
    {
      type = "guardcore",
      locator = "locator_litho_07_03_03",
      name = "litho_07_enemy_12"
    },
    {
      type = "guardcore",
      locator = "locator_litho_07_03_04",
      name = "litho_07_enemy_13"
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
    _count_dead = _count_dead + 1
  end,
  onSetupGem = function(A0_54, A1_55)
    Fn_enemyPopGemSetup(A0_54, {
      "litho_07_enemy_10",
      "litho_07_enemy_12"
    }, 2, 6, "s1")
    Fn_enemyPopGemSetup(A0_54, {
      "litho_07_enemy_11",
      "litho_07_enemy_13"
    }, 1, 4, "e1")
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57, {"s1", "e1"})
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
enmgen_litho_07_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_litho_07_04_01",
      name = "litho_07_enemy_14"
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
    _count_dead = _count_dead + 1
  end,
  onSetupGem = function(A0_75, A1_76)
    Fn_enemyPopGemSetup(A0_75, {
      "litho_07_enemy_14"
    }, 1, 5)
  end,
  onPopGem = function(A0_77, A1_78)
    Fn_enemyAshPopGem(A0_77, A1_78)
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
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  _enm_litho_07_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_07_01")
  _enm_litho_07_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_07_02")
  _enm_litho_07_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_07_03")
  _enm_litho_07_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_07_04")
  _litho_07_spgem_01_h = findGameObject2("Node", "gem2_special_litho_07_01")
  _litho_07_spgem_02_h = findGameObject2("Node", "gem2_special_litho_07_02")
  _litho_07_spgem_03_h = findGameObject2("Node", "gem2_special_litho_07_03")
  _litho_07_spgem_01_h:setActive(false)
  _litho_07_spgem_02_h:setActive(false)
  _litho_07_spgem_03_h:setActive(false)
  _enemy_max = enmgen_litho_07_01:getEnemyMax() + enmgen_litho_07_03:getEnemyMax() + enmgen_litho_07_04:getEnemyMax()
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
    local L0_84
    L0_84 = false
    repeat
      if L0_84 == false and Fn_getDistanceToPlayer("locator2_navi_litho_07") > 3 then
        L0_84 = true
        Fn_naviSet(findGameObject2("Node", "locator2_navi_litho_07"))
      elseif L0_84 == true and Fn_getDistanceToPlayer("locator2_navi_litho_07") < 3 then
        L0_84 = false
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
  Fn_unLockPlayerAbility(Player.kAbility_SpBlackHole)
  Fn_recoverEnergyFully()
  _litho_07_spgem_01_h:setActive(true)
  _litho_07_spgem_02_h:setActive(true)
  _litho_07_spgem_03_h:setActive(true)
  specialGemrReset(10)
  litho_init()
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  if GameDatabase:get(ggd.Savedata__Info__ep12__ep12_info_04) ~= 2 then
    HUD:info("ep12_info_04", false)
  else
    HUD:info("ep12_info_04", true)
  end
  _litho_timer_task = invokeTask(litho_timer, _clear_time)
  _brain_crow:setIdling(false)
  Fn_sendEventComSb("statusChengeEp12", "litho")
  invokeTask(function()
    Fn_missionView("ep12_09014", nil, nil, true)
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
  Fn_userCtrlAllOff()
  Fn_setBgmPoint("event", "battle_end")
  HUD:counter999SetVisible(false)
  HUD:timerStop()
  HUD:timerSetVisible(false)
  if _timer_se ~= nil then
    Sound:stopSEHandle(_timer_se)
  end
  if _litho_timer_task ~= nil then
    _litho_timer_task:abort()
  end
  if invokeTask(function()
    repeat
      repeat
        wait()
      until _count_dead >= _enemy_max
      if _litho_theme == nil then
        _litho_theme = true
      end
      wait()
    until _litho_theme
  end) ~= nil then
    invokeTask(function()
      repeat
        repeat
          wait()
        until _count_dead >= _enemy_max
        if _litho_theme == nil then
          _litho_theme = true
        end
        wait()
      until _litho_theme
    end):abort()
  end
  waitSeconds(1.5)
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
  local L0_85
  L0_85 = print
  L0_85("*** ep12_s:litho_init ***")
  _litho_theme = nil
  L0_85 = _enemy_spawn_task
  if L0_85 ~= nil then
    L0_85 = _enemy_spawn_task
    L0_85 = L0_85.abort
    L0_85(L0_85)
  end
  L0_85 = invokeTask
  L0_85 = L0_85(prog_manage)
  _enemy_spawn_task = L0_85
  L0_85 = Player
  L0_85 = L0_85.getEnergyMax
  L0_85 = L0_85(L0_85, Player.kEnergy_SpAttack)
  Player:setEnergy(Player.kEnergy_SpAttack, L0_85)
end
function prog_manage()
  print("*** ep12_s:prog_manage ***")
  if _enm_litho_07_01_h ~= nil then
    _enm_litho_07_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_07_01:isEnemyAllDead()
  if _enm_litho_07_03_h ~= nil then
    _enm_litho_07_03_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_07_03:isEnemyAllDead()
  if _enm_litho_07_04_h ~= nil then
    _enm_litho_07_04_h:requestSpawn()
  end
end
function litho_timer(A0_86)
  while _litho_theme ~= true do
    if _litho_theme == nil then
      HUD:timerSetSecond(A0_86)
      HUD:timerSetVisible(true)
      HUD:timerStart()
      _timer_se = Sound:playSEHandle("sys_countdown", 1)
      while HUD:timerGetSecond() > 0 do
        wait()
      end
      _litho_theme = false
      HUD:timerStop()
      if _timer_se ~= nil then
        Sound:stopSEHandle(_timer_se)
      end
    end
    wait()
  end
end
function createGem(A0_87, A1_88)
  local L2_89, L3_90, L4_91
  L3_90 = A0_87
  L2_89 = A0_87.getName
  L2_89 = L2_89(L3_90)
  if L2_89 ~= nil then
    L3_90 = print
    L4_91 = "***** Gam create : "
    L4_91 = L4_91 .. L2_89 .. " *****"
    L3_90(L4_91)
    L3_90 = createGameObject2
    L4_91 = "Gem"
    L3_90 = L3_90(L4_91)
    L4_91 = L3_90.setName
    L4_91(L3_90, L2_89)
    L4_91 = L3_90.setGemModelNo
    L4_91(L3_90, A1_88)
    L4_91 = A0_87.getWorldPos
    L4_91 = L4_91(A0_87)
    L4_91 = L4_91 + Vector(0, 0, 0)
    L3_90:setWorldPos(L4_91)
    L3_90:setForceMove()
    L3_90:setVisible(true)
    L3_90:try_init()
    L3_90:waitForReadyAsync(function()
      L3_90:try_start()
    end)
    return L3_90
  else
  end
  L3_90 = nil
  return L3_90
end
_specialgem_time = 10
function specialGemrReset(A0_92)
  if A0_92 ~= nil then
    _specialgem_time = A0_92
  end
  GlobalGem:SetSpecialGemGetCallback("specialGemReCreate")
end
function specialGemReCreate(A0_93)
  invokeTask(function()
    waitSeconds(_specialgem_time)
    createGem(A0_93, 6)
  end)
end
function restart_litho()
  print("*** ep12_s:restart_litho ***")
  if _enm_litho_07_01_h ~= nil then
    _enm_litho_07_01_h:requestIdlingEnemy(false)
  end
  if _enm_litho_07_02_h ~= nil then
    _enm_litho_07_02_h:requestIdlingEnemy(false)
  end
  if _enm_litho_07_03_h ~= nil then
    _enm_litho_07_03_h:requestIdlingEnemy(false)
  end
  if _enm_litho_07_04_h ~= nil then
    _enm_litho_07_04_h:requestIdlingEnemy(false)
  end
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
  end
  Fn_userCtrlAllOff()
  Player:setStay(true)
  HUD:blackout(1)
  while not HUD:faderStability() do
    wait()
  end
  if _enm_litho_07_01_h ~= nil then
    _enm_litho_07_01_h:requestAllEnemyKill()
  end
  if _enm_litho_07_02_h ~= nil then
    _enm_litho_07_02_h:requestAllEnemyKill()
  end
  if _enm_litho_07_03_h ~= nil then
    _enm_litho_07_03_h:requestAllEnemyKill()
  end
  if _enm_litho_07_04_h ~= nil then
    _enm_litho_07_04_h:requestAllEnemyKill()
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function Finalize()
  if _timer_se ~= nil then
    Sound:stopSEHandle(_timer_se)
  end
end
