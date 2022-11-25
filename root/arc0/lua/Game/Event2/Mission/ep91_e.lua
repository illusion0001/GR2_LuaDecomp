dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
enmgen2_e_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_e_01_01",
      name = "ene_e_01_01"
    },
    {
      type = "mechsmall",
      locator = "locator_e_01_02",
      name = "ene_e_01_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_e_01_01",
      name = "ene_e_01_03",
      target_vehicle = "ene_e_01_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_e_01_02",
      name = "ene_e_01_04",
      target_vehicle = "ene_e_01_02"
    }
  }
}
enmgen2_e_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_e_02_01",
      name = "ene_e_02_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_02_02",
      name = "ene_e_02_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_02_03",
      name = "ene_e_02_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_02_04",
      name = "ene_e_02_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_02_05",
      name = "ene_e_02_05"
    }
  }
}
function Initialize()
  Fn_userCtrlOn()
  _sdemo = SDemo.create("ep91_c_01")
end
function Ingame()
  Fn_sendEventComSb("setCrowSpawn", "locator2_crow_start_pos_e")
  while Fn_sendEventComSb("getCrowRequest") == "spawn" do
    wait()
  end
  Fn_sendEventComSb("getCrowBrain"):setIdling(true)
  _sdemo:set("locator2_cut_e_cam01", "locator2_cut_e_aim01", true)
  _sdemo:play()
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_missionStart()
  while true do
    if 0 == 0 then
      findGameObject2("EnemyGenerator", "enmgen2_e_01"):requestSpawn()
      wait()
      findGameObject2("EnemyGenerator", "enmgen2_e_01"):setEnemyMarker(false)
      findGameObject2("EnemyGenerator", "enmgen2_e_02"):requestSpawn()
      wait()
      findGameObject2("EnemyGenerator", "enmgen2_e_02"):setEnemyMarker(false)
      _sdemo:play(nil, {
        {
          time = 1,
          pos = "locator2_cut_e_aim02"
        }
      })
      while _sdemo:isPlay() do
        wait()
      end
      _sdemo:play({
        {
          time = 2,
          pos = "locator2_cut_e_cam02"
        }
      }, {
        {
          time = 2,
          pos = "locator2_cut_e_aim03"
        }
      })
      while _sdemo:isPlay() do
        wait()
      end
      Fn_userCtrlOn()
      Fn_sendEventComSb("getCrowBrain"):setIdling(false)
      _sdemo:stop(1)
      waitSeconds(1)
      findGameObject2("EnemyGenerator", "enmgen2_e_01"):setEnemyMarker(true)
      findGameObject2("EnemyGenerator", "enmgen2_e_02"):setEnemyMarker(true)
      while true do
        if 0 < findGameObject2("EnemyGenerator", "enmgen2_e_01"):getEnemyCount() and 0 < findGameObject2("EnemyGenerator", "enmgen2_e_02"):getEnemyCount() then
          wait()
          do break end
          wait()
        end
      end
    end
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
