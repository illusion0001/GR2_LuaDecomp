dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_battle_clearDeadNum_wave1 = 11
_battle_clearDeadNum_wave2 = 2
_battle_clearDeadNum_wave3 = 5
enmgen_01 = nil
enmgen_02 = nil
enmgen_03 = nil
gem = {}
vital_gem_num = 2
energy_gem_num = 3
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator2_nevi_01_01",
      name = "enemy_01"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_02",
      name = "enemy_02"
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_01_03",
      name = "enemy_03"
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_01_04",
      name = "enemy_04"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "enemy_01",
      "enemy_02",
      "enemy_03",
      "enemy_04"
    }, 4, 5)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_6)
    local L1_7
    L1_7 = A0_6.enemyDeadNum
    return L1_7
  end,
  isEnemyAllDead = function(A0_8)
    local L2_9
    L2_9 = A0_8.enemyDeadNum
    L2_9 = L2_9 >= #A0_8.spawnSet
    return L2_9
  end
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator2_nevi_02_01",
      name = "enemy_05"
    },
    {
      type = "imp",
      locator = "locator2_nevi_02_02",
      name = "enemy_06"
    }
  },
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {"enemy_05", "enemy_06"}, 1, 4)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_16)
    local L1_17
    L1_17 = A0_16.enemyDeadNum
    return L1_17
  end,
  isEnemyAllDead = function(A0_18)
    local L2_19
    L2_19 = A0_18.enemyDeadNum
    L2_19 = L2_19 >= #A0_18.spawnSet
    return L2_19
  end
}
enmgen2_nevi_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator2_nevi_03_01",
      name = "lunafishowner_01",
      ai_spawn_option = "LunaFishOwner/owner_num05"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator2_nevi_03_01",
      name = "enemy_07"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator2_nevi_03_01",
      name = "lunafish_01"
    }
  },
  onObjectAsh = function(A0_20, A1_21)
    A0_20:getSpecTable().enemyDeadNum = A0_20:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_22, A1_23)
    Fn_enemyPopGemSetup(A0_22, {
      "lunafish_01"
    }, 3, 5)
  end,
  onPopGem = function(A0_24, A1_25)
    Fn_enemyAshPopGem(A0_24, A1_25)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_26)
    local L1_27
    L1_27 = A0_26.enemyDeadNum
    return L1_27
  end
}
function Initialize()
  local L0_28, L1_29, L2_30, L3_31
  L3_31 = true
  L0_28(L1_29, L2_30, L3_31)
  enmgen_01 = L0_28
  enmgen_02 = L0_28
  enmgen_03 = L0_28
  for L3_31 = 1, vital_gem_num do
    gem[L3_31] = findGameObject2("Gem", string.format("gem2_vital_ep09_m_%02d", L3_31))
    gem[L3_31]:setActive(false)
  end
  for L3_31 = 1, energy_gem_num do
    gem[L3_31 + vital_gem_num] = findGameObject2("Gem", string.format("gem2_energy_ep09_m_%02d", L3_31))
    gem[L3_31 + vital_gem_num]:setActive(false)
  end
  L0_28(L1_29)
  L0_28(L1_29)
end
function Ingame()
  local L0_32
  L0_32 = Fn_setCatWarpCheckPoint
  L0_32("locator2_restart_pos_ep09_m")
  L0_32 = findGameObject2
  L0_32 = L0_32("Node", "locator2_litho_01")
  litho_task = invokeTask(function()
    local L0_33
    L0_33 = false
    while true do
      if L0_33 == false and Fn_getDistanceToPlayer(L0_32) > 30 then
        L0_33 = true
        Fn_naviSet(L0_32)
      elseif L0_33 == true and Fn_getDistanceToPlayer(L0_32) <= 10 then
        L0_33 = false
        Fn_naviKill()
      end
      wait()
    end
  end)
  Fn_missionStart()
  Fn_userCtrlOn()
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  litho_task:abort()
  litho_task = nil
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep09_m_02")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_caution_06")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_catwarp_06")
  Fn_pcSensorOn("pccubesensor2_caution_litho_06")
  Fn_pcSensorOn("pccubesensor2_catwarp_litho_06")
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  if enmgen_01 ~= nil then
    enmgen_01:requestSpawn()
    enmgen_01:requestIdlingEnemy(true)
    enmgen_01:setEnemyMarker(false)
  end
  Fn_setBgmPoint("battle")
  waitSeconds(1)
  Fn_captionViewWait("ep09_13001")
  Fn_lookAtObject("locator2_aim_nevi_01"):abort()
  waitSeconds(0.3)
  if GameDatabase:get(ggd.Savedata__Info__ep09__ep09_info_04) ~= 2 then
    HUD:info("ep09_info_04", false)
  elseif GameDatabase:get(ggd.Savedata__Info__ep09__ep09_info_04) == 2 then
    HUD:info("ep09_info_04", true)
  end
  wait()
  Fn_userCtrlOn()
  Fn_tutorialCaption("mars_kick")
  enmgen_01:requestIdlingEnemy(false)
  enmgen_01:setEnemyMarker(true)
  for _FORV_5_ = 1, vital_gem_num + energy_gem_num do
    if gem[_FORV_5_] ~= nil then
      gem[_FORV_5_]:setActive(true)
    end
  end
  Fn_missionView("ep09_09150", nil, nil, true)
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("ep09_09017")
  HUD:counter999SetNum(_battle_clearDeadNum_wave1)
  HUD:counter999SetVisible(true)
  return_task = invokeTask(function()
    while true do
      if return_flag and Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_01")) <= 30 then
        return_flag = false
        Fn_naviKill()
      end
      wait()
    end
  end)
  repeat
    wait()
  until enmgen2_nevi_01:isEnemyAllDead()
  invokeTask(function()
    repeat
      wait()
    until enmgen2_nevi_01:getEnemyDeadNum() >= 2
    Fn_tutorialCaptionKill()
  end):abort()
  Fn_tutorialCaptionKill()
  waitSeconds(2)
  if enmgen_02 ~= nil then
    enmgen_02:requestSpawn()
    enmgen_02:requestIdlingEnemy(true)
    enmgen_02:setEnemyMarker(false)
  end
  Player:setStay(true)
  waitSeconds(1)
  Fn_captionViewWait("ep09_13003")
  Fn_lookAtObject("locator2_aim_nevi_02"):abort()
  waitSeconds(0.3)
  if GameDatabase:get(ggd.Savedata__Info__ep09__ep09_info_05) ~= 2 then
    HUD:info("ep09_info_05", false)
  elseif GameDatabase:get(ggd.Savedata__Info__ep09__ep09_info_05) == 2 then
    HUD:info("ep09_info_05", true)
  end
  wait()
  Player:setStay(false)
  enmgen_02:requestIdlingEnemy(false)
  enmgen_02:setEnemyMarker(true)
  Fn_missionView("ep09_13004", nil, nil, true)
  Fn_tutorialCaption("marsgrav_kick")
  repeat
    wait()
  until enmgen2_nevi_02:isEnemyAllDead()
  invokeTask(function()
    repeat
      wait()
    until enmgen2_nevi_02:getEnemyDeadNum() >= 1
    Fn_tutorialCaptionKill()
  end):abort()
  Fn_tutorialCaptionKill()
  if enmgen_03 ~= nil then
    enmgen_03:requestSpawn()
  end
  waitSeconds(3.5)
  Player:setStay(true)
  waitSeconds(1)
  Fn_captionViewWait("ep09_13005")
  Fn_lookAtObject("locator2_nevi_03_01"):abort()
  Player:setStay(false)
  Fn_missionView("ep09_13006", nil, nil, true)
  Fn_tutorialCaption("marsgrav_kick")
  repeat
    wait()
  until enmgen2_nevi_03:getEnemyDeadNum() == _battle_clearDeadNum_wave3
  Fn_captionView("ep09_13007")
  Fn_pcSensorOff("pccubesensor2_caution_litho_06")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_06")
  return_task:abort()
  return_task = nil
  invokeTask(function()
    repeat
      wait()
    until enmgen2_nevi_03:getEnemyDeadNum() >= 2
    Fn_tutorialCaptionKill()
  end):abort()
  Fn_tutorialCaptionKill()
  waitSeconds(2)
  HUD:counter999SetVisible(false)
  waitSeconds(1)
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("synchroArea")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_34, L1_35
end
