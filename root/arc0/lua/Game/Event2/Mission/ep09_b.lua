dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
_battle_clearDeadNum_wave1 = 12
_battle_clearDeadNum_wave2_1 = 4
gem = {}
player_attack_first = false
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
      type = "stalker",
      locator = "locator2_nevi_01_03",
      name = "enemy_03"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_01_04",
      name = "enemy_04"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_2)
    local L1_3
    L1_3 = A0_2.enemyDeadNum
    return L1_3
  end,
  isEnemyAllDead = function(A0_4)
    local L2_5
    L2_5 = A0_4.enemyDeadNum
    L2_5 = L2_5 >= #A0_4.spawnSet
    return L2_5
  end
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator2_nevi_02_01",
      name = "enemy_05"
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_02_02",
      name = "enemy_06"
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_02_03",
      name = "enemy_07"
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_02_04",
      name = "enemy_08"
    }
  },
  onObjectAsh = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "enemy_05",
      "enemy_06",
      "enemy_07",
      "enemy_08"
    }, 4, 5)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_12)
    local L1_13
    L1_13 = A0_12.enemyDeadNum
    return L1_13
  end,
  isEnemyAllDead = function(A0_14)
    local L2_15
    L2_15 = A0_14.enemyDeadNum
    L2_15 = L2_15 >= #A0_14.spawnSet
    return L2_15
  end
}
enmgen2_nevi_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator2_nevi_03_01",
      name = "enemy_09"
    },
    {
      type = "imp",
      locator = "locator2_nevi_03_02",
      name = "enemy_10"
    }
  },
  onObjectAsh = function(A0_16, A1_17)
    A0_16:getSpecTable().enemyDeadNum = A0_16:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_18)
    local L1_19
    L1_19 = A0_18.enemyDeadNum
    return L1_19
  end,
  isEnemyAllDead = function(A0_20)
    local L2_21
    L2_21 = A0_20.enemyDeadNum
    L2_21 = L2_21 >= #A0_20.spawnSet
    return L2_21
  end
}
enmgen2_nevi_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator2_nevi_04_01",
      name = "enemy_11"
    },
    {
      type = "guardcore",
      locator = "locator2_nevi_04_02",
      name = "enemy_12"
    }
  },
  onObjectAsh = function(A0_22, A1_23)
    A0_22:getSpecTable().enemyDeadNum = A0_22:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_24, A1_25)
    Fn_enemyPopGemSetup(A0_24, {"enemy_11", "enemy_12"}, 1, 5)
  end,
  onPopGem = function(A0_26, A1_27)
    Fn_enemyAshPopGem(A0_26, A1_27)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_28)
    local L1_29
    L1_29 = A0_28.enemyDeadNum
    return L1_29
  end,
  isEnemyAllDead = function(A0_30)
    local L2_31
    L2_31 = A0_30.enemyDeadNum
    L2_31 = L2_31 >= #A0_30.spawnSet
    return L2_31
  end
}
function Initialize()
  local L0_32, L1_33, L2_34, L3_35
  for L3_35 = 1, 2 do
    gem[L3_35] = findGameObject2("Gem", string.format("gem2_vital_ep09_b_%02d", L3_35))
    gem[L3_35]:setActive(false)
  end
  L0_32(L1_33)
  L0_32(L1_33)
end
function Ingame()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41
  L0_36 = Fn_sendEventComSb
  L1_37 = "setSensorVisible"
  L2_38 = false
  L0_36(L1_37, L2_38)
  L0_36 = findGameObject2
  L1_37 = "EnemyGenerator"
  L2_38 = "enmgen2_nevi_01"
  L0_36 = L0_36(L1_37, L2_38)
  L1_37 = findGameObject2
  L2_38 = "EnemyGenerator"
  L3_39 = "enmgen2_nevi_02"
  L1_37 = L1_37(L2_38, L3_39)
  L2_38 = findGameObject2
  L3_39 = "EnemyGenerator"
  L4_40 = "enmgen2_nevi_03"
  L2_38 = L2_38(L3_39, L4_40)
  L3_39 = findGameObject2
  L4_40 = "EnemyGenerator"
  L5_41 = "enmgen2_nevi_04"
  L3_39 = L3_39(L4_40, L5_41)
  function L4_40(A0_42)
    if A0_42.attacker == "player" and A0_42.damageHp > 1 and player_attack_first == false then
      player_attack_first = true
    end
    A0_42.ret = true
    return A0_42
  end
  L5_41 = L0_36.setEventListener
  L5_41(L0_36, "DamageEnemyReport", L4_40)
  if L0_36 ~= nil then
    L5_41 = L0_36.requestPrepare
    L5_41(L0_36)
  end
  repeat
    L5_41 = wait
    L5_41()
    L5_41 = Fn_sendEventComSb
    L5_41 = L5_41("requestCrowSpawn")
  until L5_41
  L5_41 = Fn_setCatWarpCheckPoint
  L5_41("locator2_restart_pos_ep09_b")
  L5_41 = findGameObject2
  L5_41 = L5_41("Node", "locator2_litho_01")
  litho_task = invokeTask(function()
    local L0_43
    L0_43 = false
    while true do
      if L0_43 == false and Fn_getDistanceToPlayer(L5_41) > 30 then
        L0_43 = true
        Fn_naviSet(L5_41)
      elseif L0_43 == true and Fn_getDistanceToPlayer(L5_41) <= 10 then
        L0_43 = false
        Fn_naviKill()
      end
      wait()
    end
  end)
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_captionViewWait("ep09_01000", 2)
  waitSeconds(0.5)
  Fn_sendEventComSb("setSensorVisible", true)
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  litho_task:abort()
  litho_task = nil
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep09_b_02")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_caution_01")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_catwarp_01")
  Fn_pcSensorOn("pccubesensor2_caution_litho_01")
  Fn_pcSensorOn("pccubesensor2_catwarp_litho_01")
  repeat
    wait()
  until L0_36:isPrepared()
  L0_36:requestSpawn()
  for _FORV_9_ = 1, 2 do
    if gem[_FORV_9_] ~= nil then
      gem[_FORV_9_]:setActive(true)
    end
  end
  _FOR_:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("ep09_09017")
  HUD:counter999SetNum(_battle_clearDeadNum_wave1)
  HUD:counter999SetVisible(true)
  Fn_setBgmPoint("battle")
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_missionView("ep09_09100", nil, nil, true)
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
  waitSeconds(2)
  if L1_37 ~= nil then
    L1_37:requestSpawn()
  end
  repeat
    wait()
  until enmgen2_nevi_02:getEnemyDeadNum() >= _battle_clearDeadNum_wave2_1 - 1
  if L2_38 ~= nil then
    L2_38:requestSpawn()
  end
  repeat
    wait()
  until enmgen2_nevi_02:isEnemyAllDead()
  repeat
    wait()
  until enmgen2_nevi_03:isEnemyAllDead()
  waitSeconds(2)
  if L3_39 ~= nil then
    L3_39:requestSpawn()
  end
  repeat
    wait()
  until enmgen2_nevi_04:isEnemyAllDead()
  Fn_pcSensorOff("pccubesensor2_caution_litho_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_01")
  invokeTask(function()
    repeat
      wait()
    until player_attack_first
    Fn_captionViewWait("ep09_01001", nil, 1.75)
    Fn_captionView("ep09_01002")
  end):abort()
  return_task:abort()
  return_task = nil
  waitSeconds(2)
  HUD:counter999SetVisible(false)
  waitSeconds(1)
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("synchroArea")
  Fn_kaiwaDemoView("ep09_00120k")
  Fn_sendEventComSb("requestsupportCrowReset")
  Fn_sendEventComSb("requestsupportCrowReleaseIdling")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_44, L1_45
end
