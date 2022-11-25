dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
enmgen_01 = nil
enmgen_02 = nil
_battle_clearDeadNum_wave1 = 11
_battle_clearDeadNum_wave2 = 1
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator2_nevi_01",
      name = "lunafishowner_01",
      ai_spawn_option = "LunaFishOwner/owner_num03"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_02",
      name = "enemy_01"
    },
    {
      type = "treecannon",
      locator = "locator2_nevi_03",
      name = "enemy_02"
    },
    {
      type = "treecannon",
      locator = "locator2_nevi_04",
      name = "enemy_03"
    },
    {
      type = "lunafishowner",
      locator = "locator2_nevi_05",
      name = "lunafishowner_02",
      ai_spawn_option = "LunaFishOwner/owner_num03"
    },
    {
      type = "gellyfish",
      locator = "locator2_nevi_06",
      name = "enemy_04"
    },
    {
      type = "imp",
      locator = "locator2_nevi_07",
      name = "enemy_05"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator2_nevi_01",
      name = "enemy_06"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator2_nevi_01",
      name = "lunafish_01"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    if A1_1:getName() ~= "lunafishowner_01" and A1_1:getName() ~= "lunafishowner_02" then
      A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
      HUD:counter999SubNum()
    end
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "lunafish_01",
      "enemy_01",
      "enemy_02",
      "enemy_03",
      "enemy_04",
      "enemy_05"
    }, 2, 4)
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
      type = "mothership",
      locator = "locator2_nevi_02_01",
      name = "mothership",
      ai_spawn_option = "MotherShip/ep09_MotherShip"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator2_nevi_02_01",
      name = "enemy_07"
    }
  },
  onObjectDead = function(A0_10, A1_11)
    if A1_11:getName() == A0_10:getSpecTable().getEnemyName(1) then
      A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
      HUD:counter999SubNum()
    end
  end,
  onObjectAsh = function(A0_12, A1_13)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_14)
    local L1_15
    L1_15 = A0_14.enemyDeadNum
    return L1_15
  end,
  isEnemyAllDead = function(A0_16)
    local L2_17
    L2_17 = A0_16.enemyDeadNum
    L2_17 = L2_17 >= #A0_16.spawnSet
    return L2_17
  end,
  getEnemyName = function(A0_18)
    local L1_19
    L1_19 = enmgen2_nevi_02
    L1_19 = L1_19.spawnSet
    L1_19 = L1_19[A0_18]
    L1_19 = L1_19.name
    return L1_19
  end
}
function Initialize()
  Fn_userCtrlOff()
  Player:setAttrTune(Player.kAttrTune_Mars, true)
  enmgen_01 = findGameObject2("EnemyGenerator", "enmgen2_nevi_01")
  enmgen_02 = findGameObject2("EnemyGenerator", "enmgen2_nevi_02")
  wait()
  _sdemo_cut01 = SDemo.create("cut01")
end
function Ingame()
  Fn_sendEventComSb("requestSupportCrowSpawn", "locator2_crow_start_pos_ep09_s", Supporter.FirstAction.Ground, true)
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSpawn")
  Fn_sendEventComSb("requestSupportCrowLockToWarp", "locator2_crow_move_pos_ep09_s")
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep09_s")
  Fn_missionStart()
  Fn_coercionPoseNomal()
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_caution_09")
  Fn_sendEventComSb("requestComSensorOff", "pccubesensormulti2_catwarp_09")
  if enmgen_01 ~= nil then
    enmgen_01:requestSpawn()
  end
  enmgen_01:requestIdlingEnemy(true)
  enmgen_01:setEnemyMarker(false)
  waitSeconds(1)
  Fn_resetCoercionPose()
  Fn_userCtrlOn()
  Fn_captionViewWait("ep09_19000")
  Fn_captionView("ep09_19004")
  Fn_lookAtObject("locator2_nevi_06"):abort()
  Fn_sendEventComSb("requestsupportCrowReleaseIdling")
  Fn_missionView("ep09_19001")
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Checkbox)
  HUD:counter999SetTextID("ep09_09017")
  HUD:counter999SetNum(_battle_clearDeadNum_wave1)
  HUD:counter999SetVisible(true)
  return_task = invokeTask(function()
    while true do
      if return_flag and Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_01")) <= 100 then
        return_flag = false
        Fn_naviKill()
      end
      wait()
    end
  end)
  enmgen_01:requestIdlingEnemy(false)
  enmgen_01:setEnemyMarker(true)
  repeat
    wait()
  until enmgen2_nevi_01:getEnemyDeadNum() == _battle_clearDeadNum_wave1
  HUD:counter999SetVisible(false)
  waitSeconds(3)
  if enmgen_02 ~= nil then
    enmgen_02:requestPrepare()
  end
  repeat
    wait()
  until enmgen_02:isPrepared()
  enmgen_02:requestSpawn()
  Fn_userCtrlOff()
  _sdemo_cut01:set("locator2_cam_01", findGameObject2("Puppet", "mothership"), true)
  _sdemo_cut01:play()
  Fn_setBgmPoint("event", "battle")
  Fn_resetPcPos("locator2_pc_move_pos")
  Fn_sendEventComSb("requestSupportCrowLockToWarp", "locator2_crow_move_pos_ep09_s02")
  waitSeconds(2)
  Fn_captionView("ep09_19002")
  waitSeconds(3)
  _sdemo_cut01:stop()
  Fn_userCtrlOn()
  Fn_sendEventComSb("requestsupportCrowReleaseIdling")
  Fn_missionView("ep09_19003")
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("ep09_09017")
  HUD:counter999SetNum(_battle_clearDeadNum_wave2)
  HUD:counter999SetVisible(true)
  repeat
    wait()
  until enmgen2_nevi_02:isEnemyAllDead()
  Fn_naviKill()
  return_task:abort()
  return_task = nil
  HUD:counter999SetVisible(false)
  waitSeconds(3)
  Fn_setBgmPoint("event", "battle_end")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_20, L1_21
end
function pccubesensormulti2_caution_ep09_s_OnLeave()
  print("pccubesensormulti2_caution_ep09_s_OnLeave")
  invokeTask(function()
    if return_flag == false then
      return_flag = true
      Fn_naviSet(findGameObject2("Node", "locator2_navi_01"))
    end
    if Player:getAbility(Player.kAbility_GravityShift) then
      Fn_coercionGravityShift()
    end
    if not Fn_isCaptionView("ic_warning_00110") then
      Fn_captionViewLock("ic_warning_00110")
    end
  end)
end
