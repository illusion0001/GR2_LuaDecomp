dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
_battle_clearDeadNum_wave1 = 6
gem = {}
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator2_nevi_01_01",
      name = "enemy_01"
    },
    {
      type = "gellyfish",
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
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_01_05",
      name = "enemy_05"
    },
    {
      type = "gellyfish",
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
      "enemy_02",
      "enemy_03",
      "enemy_04",
      "enemy_05",
      "enemy_06"
    }, 2, 5)
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
function Initialize()
  local L0_10, L1_11, L2_12, L3_13
  for L3_13 = 1, 2 do
    gem[L3_13] = findGameObject2("Gem", string.format("gem2_vital_ep09_d_%02d", L3_13))
    gem[L3_13]:setActive(false)
  end
  L0_10(L1_11)
  L0_10(L1_11)
end
function Ingame()
  local L0_14, L1_15
  L0_14 = findGameObject2
  L1_15 = "EnemyGenerator"
  L0_14 = L0_14(L1_15, "enmgen2_nevi_01")
  if L0_14 ~= nil then
    L1_15 = L0_14.requestPrepare
    L1_15(L0_14)
  end
  repeat
    L1_15 = wait
    L1_15()
    L1_15 = Fn_sendEventComSb
    L1_15 = L1_15("requestCrowSpawn")
  until L1_15
  L1_15 = Fn_setCatWarpCheckPoint
  L1_15("locator2_restart_pos_ep09_d")
  L1_15 = findGameObject2
  L1_15 = L1_15("Node", "locator2_litho_01")
  litho_task = invokeTask(function()
    local L0_16
    L0_16 = false
    while true do
      if L0_16 == false and Fn_getDistanceToPlayer(L1_15) > 30 then
        L0_16 = true
        Fn_naviSet(L1_15)
      elseif L0_16 == true and Fn_getDistanceToPlayer(L1_15) <= 10 then
        L0_16 = false
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
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep09_d_02")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_caution_02")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_catwarp_02")
  Fn_pcSensorOn("pccubesensor2_caution_litho_02")
  Fn_pcSensorOn("pccubesensor2_catwarp_litho_02")
  repeat
    wait()
  until L0_14:isPrepared()
  L0_14:requestSpawn()
  for _FORV_5_ = 1, 2 do
    if gem[_FORV_5_] ~= nil then
      gem[_FORV_5_]:setActive(true)
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
  Fn_missionView("ep09_09120", nil, nil, true)
  invokeTask(function()
    waitSeconds(3)
    Fn_captionViewWait("ep09_03001", nil, 2)
    Fn_captionView("ep09_03002")
  end)
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
  Fn_pcSensorOff("pccubesensor2_caution_litho_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_02")
  return_task:abort()
  return_task = nil
  waitSeconds(2)
  HUD:counter999SetVisible(false)
  waitSeconds(2)
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("synchroArea")
  Fn_sendEventComSb("requestsupportCrowReset")
  Fn_sendEventComSb("requestsupportCrowReleaseIdling")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_17, L1_18
end
