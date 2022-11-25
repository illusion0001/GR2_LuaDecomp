dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("GlobalGem")
_litho_theme = nil
_sdemo_end = false
_enemy_HP_max = 0
_enemy_HP = 0
_giant_brain = nil
_puppet_crow = nil
_brain_crow = nil
_flag_check = false
_killcheck_task = nil
enmgen_litho_03_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator_litho_03_01_01",
      name = "litho_03_enemy_01"
    },
    {
      type = "treecannon",
      locator = "locator_litho_03_01_03",
      name = "litho_03_enemy_03"
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
enmgen_litho_03_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_01",
      name = "litho_03_enemy_02"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_02",
      name = "litho_03_enemy_03"
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
  onSetupGem = function(A0_29, A1_30)
    Fn_enemyPopGemSetup(A0_29, {
      "litho_03_enemy_02",
      "litho_03_enemy_03"
    }, 2, 6)
  end,
  onPopGem = function(A0_31, A1_32)
    Fn_enemyAshPopGem(A0_31, A1_32)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_33)
    return #A0_33.spawnSet
  end,
  getEnemyDeadNum = function(A0_34)
    local L1_35
    L1_35 = A0_34.enemyDeadNum
    return L1_35
  end,
  isEnemyAllDead = function(A0_36)
    local L2_37
    L2_37 = A0_36.enemyDeadNum
    L2_37 = L2_37 >= #A0_36.spawnSet
    return L2_37
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  _enm_litho_03_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_03_01")
  _enm_litho_03_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_03_02")
  _enemy_max = enmgen_litho_03_01:getEnemyMax()
  specialGemrReset(10)
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
    local L0_38
    L0_38 = false
    repeat
      if L0_38 == false and Fn_getDistanceToPlayer("locator2_navi_litho_03") > 3 then
        L0_38 = true
        Fn_naviSet(findGameObject2("Node", "locator2_navi_litho_03"))
      elseif L0_38 == true and Fn_getDistanceToPlayer("locator2_navi_litho_03") < 3 then
        L0_38 = false
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
  invokeTask(function()
    Fn_sendEventComSb("requestCrowMove", "locator2_crow_pos_litho_03")
    repeat
      wait()
    until Fn_sendEventComSb("isCrowMoveEnd")
    wait()
    _brain_crow:setIdling(true)
  end)
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  if GameDatabase:get(ggd.Savedata__Info__ep12__ep12_info_03) ~= 2 then
    HUD:info("ep12_info_03", false)
  else
    HUD:info("ep12_info_03", true)
  end
  invokeTask(function()
    Fn_missionView("ep12_09010", nil, nil, true)
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep12_09015")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_setBgmPoint("battle")
    invokeTask(function()
      repeat
        wait()
      until Fn_sendEventComSb("isMissionview") == false
      waitSeconds(1.3)
      Fn_captionViewWait("ep12_04002", 5)
      repeat
        repeat
          while not _litho_theme do
            wait()
          end
        until Fn_sendEventComSb("isMissionview") == false
        Fn_tutorialCaptionKill()
        repeat
          wait()
        until not Fn_isCaptionView()
        wait()
        Fn_tutorialCaption("jupiter_grab")
        print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\232\161\168\231\164\186 <<<<<<<<<<")
        repeat
          while not _litho_theme do
            wait()
          end
        until Fn_sendEventComSb("isMissionview")
        wait()
        print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\233\157\158\232\161\168\231\164\186 <<<<<<<<<<")
        wait()
      until _litho_theme
      Fn_tutorialCaptionKill()
    end)
  end)
  _flag_check = invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen_litho_03_01:getEnemyDeadNum() >= 1
      wait()
      if _killcheck_task == nil then
        _killcheck_task = EventHelper:timerCallback("killcheck start", 1, function()
          print("time end")
          if _litho_theme ~= true then
            _litho_theme = false
          end
        end)
      end
      repeat
        while _litho_theme ~= false do
          wait()
        end
      until enmgen_litho_03_01:isEnemyAllDead()
      if _litho_theme == nil then
        _litho_theme = true
        _killcheck_task:abort()
      end
      wait()
    until false
  end)
  repeat
    if _litho_theme == false then
      _flag_check:abort()
      restart_litho()
    end
    wait()
  until _litho_theme
  HUD:counter999SetVisible(false)
  Fn_tutorialCaptionKill()
  _flag_check:abort()
  Fn_setBgmPoint("event", "battle_end")
  waitSeconds(1)
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  _brain_crow:setIdling(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function restart_litho()
  print("*** ep12_j:restart_litho ***")
  if _enm_litho_03_01_h ~= nil then
    _enm_litho_03_01_h:requestIdlingEnemy(true)
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
function litho_init()
  print("*** ep12_j:litho_init ***")
  if _enm_litho_03_01_h ~= nil then
    _enm_litho_03_01_h:requestSpawn()
  end
end
function createGem(A0_39, A1_40)
  local L2_41, L3_42, L4_43
  L3_42 = A0_39
  L2_41 = A0_39.getName
  L2_41 = L2_41(L3_42)
  if L2_41 ~= nil then
    L3_42 = print
    L4_43 = "***** Gam create : "
    L4_43 = L4_43 .. L2_41 .. " *****"
    L3_42(L4_43)
    L3_42 = createGameObject2
    L4_43 = "Gem"
    L3_42 = L3_42(L4_43)
    L4_43 = L3_42.setName
    L4_43(L3_42, L2_41)
    L4_43 = L3_42.setGemModelNo
    L4_43(L3_42, A1_40)
    L4_43 = A0_39.getWorldPos
    L4_43 = L4_43(A0_39)
    L4_43 = L4_43 + Vector(0, 0, 0)
    L3_42:setWorldPos(L4_43)
    L3_42:setForceMove()
    L3_42:setVisible(true)
    L3_42:try_init()
    L3_42:waitForReadyAsync(function()
      L3_42:try_start()
    end)
    return L3_42
  else
  end
  L3_42 = nil
  return L3_42
end
_specialgem_time = 60
function specialGemrReset(A0_44)
  if A0_44 ~= nil then
    _specialgem_time = A0_44
  end
  GlobalGem:SetSpecialGemGetCallback("specialGemReCreate")
end
function specialGemReCreate(A0_45)
  invokeTask(function()
    waitSeconds(_specialgem_time)
    createGem(A0_45, 6)
  end)
end
function Finalize()
  local L0_46, L1_47
end
