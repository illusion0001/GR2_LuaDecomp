dofile("/Game/Event2/Common/EventCommon.lua")
_boss_area = false
_boss_brain = nil
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
enmgen_pre_boss = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "faker_boss_stone",
      locator = "locator_pre_boss",
      name = "ep03_pre_faker",
      ai_spawn_option = "Faker/faker_boss_mimic"
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
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum - 1
    if A0_10:getSpecTable().enemyDeadNum < 0 then
      A0_10:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
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
function Initialize()
  Fn_pcSensorOff("pccubesensor2_boss")
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_s")
end
function Ingame()
  Fn_setCatWarp(false)
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_pre_boss") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_pre_boss"):requestSpawn()
  end
  invokeTask(function()
    repeat
      wait()
    until Player:getRecentAreaName() == "az_a_07"
    Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_t")
    print("***** ep03_catwarp point:" .. Fn_getCatWarpCheckPoint() .. " *****")
  end)
  Fn_coercionPoseNomal()
  Fn_missionStart()
  Fn_userCtrlOn()
  _island_navi = invokeTask(function()
    Fn_sendEventComSb("ViewMission")
    waitSeconds(1.5)
    Fn_captionView("ep03_19002")
    repeat
      if false == false and Fn_getDistanceToPlayer("locator2_litho_navi_boss") > _island_navi_disp then
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_boss"))
      elseif true == true and Fn_getDistanceToPlayer("locator2_litho_navi_boss") < _island_navi_hide then
        Fn_naviKill()
      end
      wait()
    until _boss_area
    Fn_naviKill()
  end)
  Fn_pcSensorOn("pccubesensor2_boss")
  invokeTask(function()
    repeat
      _boss_brain = findGameObject2("EnemyBrain", "ep03_pre_faker")
      wait()
    until _boss_brain ~= nil
    repeat
      wait()
    until _boss_brain:eventMessage("IsMimmicDamaged")
    _boss_area = true
  end)
  while _boss_area == false do
    wait()
  end
  Fn_resetCoercionPose()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_boss")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_boss_OnEnter(A0_21)
  Fn_pcSensorOff(A0_21)
  Fn_captionView("ep03_19001")
end
function pccubesensor2_caption_OnEnter(A0_22, A1_23)
  Fn_pcSensorOff(A0_22)
  Fn_captionView("ep03_19000")
end
function Finalize()
  local L0_24, L1_25
end
