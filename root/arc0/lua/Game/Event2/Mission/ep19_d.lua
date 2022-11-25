dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
_battle_clearDeadNum_wave = 11
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_strong",
      locator = "locator2_nevi_01_01",
      name = "enemy_01"
    },
    {
      type = "imp_strong",
      locator = "locator2_nevi_01_02",
      name = "enemy_02"
    },
    {
      type = "imp_strong",
      locator = "locator2_nevi_01_03",
      name = "enemy_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_01_04",
      name = "enemy_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_01_05",
      name = "enemy_05"
    },
    {
      type = "gellyfish_strong",
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
      type = "lasercannon_strong",
      locator = "locator2_nevi_02_01",
      name = "enemy_07"
    },
    {
      type = "lasercannon_strong",
      locator = "locator2_nevi_02_02",
      name = "enemy_08"
    },
    {
      type = "treecannon_strong",
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
function Initialize()
  Fn_pcSensorOff("pccubesensor2_caution_litho_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_02")
end
function Ingame()
  local L0_16
  L0_16 = Fn_setCatWarpCheckPoint
  L0_16("locator2_restart_pos_ep19_d")
  L0_16 = findGameObject2
  L0_16 = L0_16("Node", "locator2_litho_01")
  litho_task = invokeTask(function()
    local L0_17
    L0_17 = false
    while true do
      if L0_17 == false and Fn_getDistanceToPlayer(L0_16) > 30 then
        L0_17 = true
        Fn_naviSet(L0_16)
      elseif L0_17 == true and Fn_getDistanceToPlayer(L0_16) <= 10 then
        L0_17 = false
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
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep19_d_02")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensor2_catwarp")
  Fn_pcSensorOn("pccubesensor2_caution_litho_02")
  Fn_pcSensorOn("pccubesensor2_catwarp_litho_02")
  if findGameObject2("EnemyGenerator", "enmgen2_nevi_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_nevi_01"):requestSpawn()
  end
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("ep19_03003")
  HUD:counter999SetNum(_battle_clearDeadNum_wave)
  HUD:counter999SetVisible(true)
  Fn_setBgmPoint("battle")
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_missionView("ep19_09009", nil, nil, true)
  Fn_captionView("ep19_03001")
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
  waitSeconds(2)
  if findGameObject2("EnemyGenerator", "enmgen2_nevi_02") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_nevi_02"):requestSpawn()
  end
  repeat
    wait()
  until enmgen2_nevi_02:isEnemyAllDead()
  Fn_naviKill()
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_catwarp")
  Fn_pcSensorOff("pccubesensor2_caution_litho_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_02")
  return_task:abort()
  return_task = nil
  Fn_captionView("ep19_03004")
  waitSeconds(2)
  HUD:counter999SetVisible(false)
  waitSeconds(4)
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete", "2")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_18, L1_19
end
