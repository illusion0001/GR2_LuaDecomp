dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("GlobalGem")
_litho_02 = false
_litho_theme = nil
_sdemo_end = false
_Kick_ChargeLv = 0
_tutorial_kick = false
__check_kLV = nil
_puppet_crow = nil
_brain_crow = nil
enmgen_litho_02_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_02_01_01",
      name = "litho_02_enemy_01"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_01_02",
      name = "litho_02_enemy_02"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_01_03",
      name = "litho_02_enemy_03"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_01_04",
      name = "litho_02_enemy_04"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_01_05",
      name = "litho_02_enemy_05"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_01_06",
      name = "litho_02_enemy_06"
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
      "litho_02_enemy_01",
      "litho_02_enemy_02",
      "litho_02_enemy_03",
      "litho_02_enemy_04",
      "litho_02_enemy_05",
      "litho_02_enemy_06"
    }, 6, 5)
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
enmgen_litho_02_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_02_02_01",
      name = "litho_02_enemy_07"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_02_02",
      name = "litho_02_enemy_08"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_02_03",
      name = "litho_02_enemy_09"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_02_04",
      name = "litho_02_enemy_10"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_02_05",
      name = "litho_02_enemy_11"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_02_06",
      name = "litho_02_enemy_12"
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
      "litho_02_enemy_07",
      "litho_02_enemy_08",
      "litho_02_enemy_09",
      "litho_02_enemy_10",
      "litho_02_enemy_11",
      "litho_02_enemy_12"
    }, 6, 4)
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
enmgen_litho_02_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_02_03_01",
      name = "litho_02_enemy_13"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_02",
      name = "litho_02_enemy_14"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_03",
      name = "litho_02_enemy_15"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_04",
      name = "litho_02_enemy_16"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_05",
      name = "litho_02_enemy_17"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_06",
      name = "litho_02_enemy_18"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_07",
      name = "litho_02_enemy_19"
    },
    {
      type = "stalker",
      locator = "locator_litho_02_03_08",
      name = "litho_02_enemy_20"
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
      "litho_02_enemy_13",
      "litho_02_enemy_14",
      "litho_02_enemy_15",
      "litho_02_enemy_16",
      "litho_02_enemy_17",
      "litho_02_enemy_18",
      "litho_02_enemy_19",
      "litho_02_enemy_20"
    }, 8, 5, "b1")
    Fn_enemyPopGemSetup(A0_54, {
      "litho_02_enemy_13",
      "litho_02_enemy_14",
      "litho_02_enemy_15",
      "litho_02_enemy_16",
      "litho_02_enemy_17",
      "litho_02_enemy_18",
      "litho_02_enemy_19",
      "litho_02_enemy_20"
    }, 4, 4, "e1")
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57, {"b1", "e1"})
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
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_vctrlOff("vctrl2_pre_litho_02")
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  _enm_litho_02_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_02_01")
  _enm_litho_02_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_02_02")
  _enm_litho_02_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_02_03")
  _enemy_max = enmgen_litho_02_01:getEnemyMax() + enmgen_litho_02_02:getEnemyMax() + enmgen_litho_02_03:getEnemyMax()
  findGameObject2("Node", "gem2_energy_litho_02_01"):setActive(false)
  findGameObject2("Node", "gem2_energy_litho_02_02"):setActive(false)
  findGameObject2("Node", "gem2_energy_litho_02_03"):setActive(false)
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
    local L0_63
    L0_63 = false
    repeat
      if L0_63 == false and Fn_getDistanceToPlayer("locator2_navi_litho_02") > 3 then
        L0_63 = true
        Fn_naviSet(findGameObject2("Node", "locator2_navi_litho_02"))
      elseif L0_63 == true and Fn_getDistanceToPlayer("locator2_navi_litho_02") < 3 then
        L0_63 = false
        Fn_naviKill()
      end
      wait()
    until Fn_sendEventComSb("isLithographStart")
    Fn_naviKill()
  end)
  Fn_sendEventComSb("aisleMissionView")
  waitSeconds(1.3)
  Fn_naviSet(findGameObject2("Node", "locator2_lithograph_02"))
  Fn_captionView("ep12_03001")
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  _litho_navi:abort()
  Fn_naviKill()
  litho_theme()
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  invokeTask(function()
    Fn_missionView("ep12_09009", nil, nil, true)
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep12_09015")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_setBgmPoint("battle")
    waitSeconds(1)
    if GameDatabase:get(ggd.Savedata__Info__ep12__ep12_info_01) ~= 2 then
      HUD:info("ep12_info_01", false)
    else
      HUD:info("ep12_info_01", true)
    end
    waitSeconds(1)
    Fn_tutorialCaption("jupiter")
  end)
  repeat
    wait()
  until _litho_theme
  HUD:counter999SetVisible(false)
  invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen_litho_02_03:isEnemyAllDead()
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end):abort()
  Fn_setBgmPoint("event", "battle_end")
  Fn_tutorialCaptionKill()
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_theme()
  print("*** ep12_h:litho_theme ***")
  Fn_sendEventComSb("statusChengeEp12", "demo")
  Fn_userCtrlAllOff()
  Player:setStay(true)
  litho_init()
  findGameObject2("Node", "gem2_energy_litho_02_01"):setActive(true)
  findGameObject2("Node", "gem2_energy_litho_02_02"):setActive(true)
  findGameObject2("Node", "gem2_energy_litho_02_03"):setActive(true)
  Fn_userCtrlOn()
  Player:setStay(false)
end
function litho_init()
  print("*** ep12_h:litho_init ***")
  _enemy_spawn_task = invokeTask(prog_manage)
  enargyGemrReset(10)
end
function prog_manage()
  if _enm_litho_02_01_h ~= nil then
    _enm_litho_02_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_02_01:isEnemyAllDead()
  if _enm_litho_02_02_h ~= nil then
    _enm_litho_02_02_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_02_02:isEnemyAllDead()
  if _enm_litho_02_03_h ~= nil then
    _enm_litho_02_03_h:requestSpawn()
  end
end
function restart_litho()
  print("*** ep12_h:restart_litho ***")
  if _enm_litho_02_01_h ~= nil then
    _enm_litho_02_01_h:requestIdlingEnemy(true)
  end
  if _enm_litho_02_02_h ~= nil then
    _enm_litho_02_02_h:requestIdlingEnemy(true)
  end
  if _enm_litho_02_03_h ~= nil then
    _enm_litho_02_03_h:requestIdlingEnemy(true)
  end
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function createGem(A0_64, A1_65)
  local L2_66, L3_67, L4_68
  L3_67 = A0_64
  L2_66 = A0_64.getName
  L2_66 = L2_66(L3_67)
  if L2_66 ~= nil then
    L3_67 = print
    L4_68 = "***** Gam create : "
    L4_68 = L4_68 .. L2_66 .. " *****"
    L3_67(L4_68)
    L3_67 = createGameObject2
    L4_68 = "Gem"
    L3_67 = L3_67(L4_68)
    L4_68 = L3_67.setName
    L4_68(L3_67, L2_66)
    L4_68 = L3_67.setGemModelNo
    L4_68(L3_67, A1_65)
    L4_68 = A0_64.getWorldPos
    L4_68 = L4_68(A0_64)
    L4_68 = L4_68 + Vector(0, 0, 0)
    L3_67:setWorldPos(L4_68)
    L3_67:setForceMove()
    L3_67:setVisible(true)
    L3_67:try_init()
    L3_67:waitForReadyAsync(function()
      L3_67:try_start()
    end)
    return L3_67
  else
  end
  L3_67 = nil
  return L3_67
end
_enargygem_time = 20
function enargyGemrReset(A0_69)
  if A0_69 ~= nil then
    _enargygem_time = A0_69
  end
  GlobalGem:SetEnargyGemGetCallback("enargyGemReCreate")
end
function enargyGemReCreate(A0_70)
  invokeTask(function()
    waitSeconds(_enargygem_time)
    createGem(A0_70, 4)
  end)
end
function Finalize()
  local L0_71, L1_72
end
