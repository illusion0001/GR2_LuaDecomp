dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
_battle_clearDeadNum = 18
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator2_nevi_01_01",
      name = "enemy_01"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_01_02",
      name = "enemy_02"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_01_03",
      name = "enemy_03"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_01_04",
      name = "enemy_04"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_01_05",
      name = "enemy_05"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_01_06",
      name = "enemy_06"
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
      "enemy_04",
      "enemy_05",
      "enemy_06"
    }, 6, 5)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end,
  enemyDeadNum = 0,
  isEnemyAllDead = function(A0_6)
    local L2_7
    L2_7 = A0_6.enemyDeadNum
    L2_7 = L2_7 >= #A0_6.spawnSet
    return L2_7
  end
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_02_01",
      name = "enemy_07"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_02_02",
      name = "enemy_08"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_02_03",
      name = "enemy_09"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_02_04",
      name = "enemy_10"
    },
    {
      type = "imp_strong",
      locator = "locator2_nevi_02_05",
      name = "enemy_11"
    }
  },
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_10, A1_11)
    Fn_enemyPopGemSetup(A0_10, {
      "enemy_07",
      "enemy_08",
      "enemy_09",
      "enemy_10",
      "enemy_11"
    }, 5, 5)
  end,
  onPopGem = function(A0_12, A1_13)
    Fn_enemyAshPopGem(A0_12, A1_13)
  end,
  enemyDeadNum = 0,
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
      type = "gellyfish_strong",
      locator = "locator2_nevi_03_01",
      name = "enemy_12"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_02",
      name = "enemy_13"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_03",
      name = "enemy_14"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_03_04",
      name = "enemy_15"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_03_05",
      name = "enemy_16"
    },
    {
      type = "stalker_strong",
      locator = "locator2_nevi_03_06",
      name = "enemy_17"
    },
    {
      type = "guardcore_strong",
      locator = "locator2_nevi_03_07",
      name = "enemy_18"
    }
  },
  onObjectAsh = function(A0_16, A1_17)
    A0_16:getSpecTable().enemyDeadNum = A0_16:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_18, A1_19)
    Fn_enemyPopGemSetup(A0_18, {
      "enemy_12",
      "enemy_13",
      "enemy_14",
      "enemy_15",
      "enemy_16",
      "enemy_17",
      "enemy_18"
    }, 7, 5)
  end,
  onPopGem = function(A0_20, A1_21)
    Fn_enemyAshPopGem(A0_20, A1_21)
  end,
  enemyDeadNum = 0,
  isEnemyAllDead = function(A0_22)
    local L2_23
    L2_23 = A0_22.enemyDeadNum
    L2_23 = L2_23 >= #A0_22.spawnSet
    return L2_23
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Mars, true)
  Fn_pcSensorOff("pccubesensor2_caution_litho_04")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_04")
end
function Ingame()
  local L0_24, L1_25, L2_26
  L0_24 = Fn_setCatWarpCheckPoint
  L1_25 = "locator2_restart_pos_ep19_i"
  L0_24(L1_25)
  L0_24 = findGameObject2
  L1_25 = "Node"
  L2_26 = "locator2_litho_01"
  L0_24 = L0_24(L1_25, L2_26)
  L1_25 = invokeTask
  function L2_26()
    local L0_27
    L0_27 = false
    while true do
      if L0_27 == false and Fn_getDistanceToPlayer(L0_24) > 30 then
        L0_27 = true
        Fn_naviSet(L0_24)
      elseif L0_27 == true and Fn_getDistanceToPlayer(L0_24) <= 10 then
        L0_27 = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L1_25 = L1_25(L2_26)
  litho_task = L1_25
  L1_25 = Fn_missionStart
  L1_25()
  L1_25 = Fn_userCtrlOn
  L1_25()
  repeat
    L1_25 = wait
    L1_25()
    L1_25 = Fn_sendEventComSb
    L2_26 = "isLithographStart"
    L1_25 = L1_25(L2_26)
  until L1_25
  L1_25 = {
    L2_26,
    Player.kAbility_GravityBoost,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_SliderKick
  }
  L2_26 = Player
  L2_26 = L2_26.kAbility_GravityShift
  L2_26 = {}
  Fn_lockPlayerAbility(L1_25, L2_26)
  litho_task:abort()
  litho_task = nil
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep19_i_02")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensor2_catwarp")
  Fn_pcSensorOn("pccubesensor2_caution_litho_04")
  Fn_pcSensorOn("pccubesensor2_catwarp_litho_04")
  if findGameObject2("EnemyGenerator", "enmgen2_nevi_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_nevi_01"):requestSpawn()
  end
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("ep19_08003")
  HUD:counter999SetNum(_battle_clearDeadNum)
  HUD:counter999SetVisible(true)
  Fn_setBgmPoint("battle")
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_missionView("ep19_09011", nil, nil, true)
  Fn_captionView("ep19_08001")
  return_task = invokeTask(function()
    while true do
      if return_flag and Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_01")) <= 40 then
        return_flag = false
        Fn_naviKill()
      end
      wait()
    end
  end)
  repeat
    wait()
  until enmgen2_nevi_01:isEnemyAllDead()
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep19_i_03")
  waitSeconds(2)
  if findGameObject2("EnemyGenerator", "enmgen2_nevi_02") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_nevi_02"):requestSpawn()
  end
  repeat
    wait()
  until enmgen2_nevi_02:isEnemyAllDead()
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep19_i_02")
  waitSeconds(2)
  if findGameObject2("EnemyGenerator", "enmgen2_nevi_03") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_nevi_03"):requestSpawn()
  end
  repeat
    wait()
  until enmgen2_nevi_03:isEnemyAllDead()
  Fn_naviKill()
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_catwarp")
  Fn_pcSensorOff("pccubesensor2_caution_litho_04")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_04")
  return_task:abort()
  return_task = nil
  Fn_captionView("ep19_08004")
  waitSeconds(2)
  HUD:counter999SetVisible(false)
  waitSeconds(4)
  Fn_setBgmPoint("event", "battle_end")
  Fn_unLockPlayerAbility(L1_25, L2_26)
  Fn_sendEventComSb("missionComplete", "4")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_28, L1_29
end
