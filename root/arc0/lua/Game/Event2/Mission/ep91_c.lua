import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
enmgen2_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_c_01_01",
      name = "ene_c_01_01"
    },
    {
      type = "imp",
      locator = "locator_c_01_02",
      name = "ene_c_01_02"
    }
  }
}
enmgen2_c_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_c_02_01",
      name = "enm_c_02_01"
    },
    {
      type = "stalker",
      locator = "locator_c_02_02",
      name = "enm_c_02_02"
    },
    {
      type = "stalker",
      locator = "locator_c_02_03",
      name = "enm_c_02_03"
    },
    {
      type = "stalker",
      locator = "locator_c_02_04",
      name = "enm_c_02_04"
    },
    {
      type = "stalker",
      locator = "locator_c_02_05",
      name = "enm_c_02_05"
    }
  }
}
function Initialize()
  Fn_userCtrlOff()
  _sdemo = SDemo.create("ep91_c_01")
end
function Ingame()
  _sdemo:set("locator2_cut_c_cam01", "locator2_cut_c_aim01", true)
  _sdemo:play()
  Fn_resetPcPos("locator2_pc_start_pos")
  if Fn_sendEventComSb("getMobPanic") == false then
    Fn_sendEventComSb("setMobPanic", true)
    Mob:makeSituationPanic(true)
  end
  findGameObject2("EnemyGenerator", "enmgen2_c_02"):requestIdlingEnemy(true)
  findGameObject2("EnemyGenerator", "enmgen2_c_02"):setEnemyMarker(false)
  Fn_missionStart()
  while true do
    if 0 == 0 then
      findGameObject2("EnemyGenerator", "enmgen2_c_01"):requestSpawn()
      wait()
      waitSeconds(0.5)
      _sdemo:play({
        {
          time = 3,
          pos = "locator2_cut_c_cam02"
        }
      }, {
        {
          time = 3,
          pos = "locator2_cut_c_aim02"
        }
      })
      while _sdemo:isPlay() do
        wait()
      end
      Fn_userCtrlOn()
      _sdemo:stop(1)
      waitSeconds(1)
      findGameObject2("EnemyGenerator", "enmgen2_c_02"):requestIdlingEnemy(false)
      findGameObject2("EnemyGenerator", "enmgen2_c_02"):setEnemyMarker(true)
      while 0 < findGameObject2("EnemyGenerator", "enmgen2_c_01"):getEnemyCount() do
        wait()
      end
    elseif 1 == 1 then
      findGameObject2("EnemyGenerator", "enmgen2_c_02"):requestSpawn()
      wait()
      while 0 < findGameObject2("EnemyGenerator", "enmgen2_c_02"):getEnemyCount() do
        wait()
      end
      waitSeconds(1)
      break
    end
    wait()
  end
  Mob:makeSituationPanic(false)
  Fn_sendEventComSb("setMobPanic", false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
function pccubesensor2_market_OnEnter(A0_2)
  _navi_market = true
  A0_2:setActive(false)
end
