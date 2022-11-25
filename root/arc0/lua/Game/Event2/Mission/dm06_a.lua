dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm06_common.lua")
dm06_collectors_dead = 0
dm06_goal = false
dm06_collector_01 = nil
dm06_collector_02 = nil
dm06_collector_03 = nil
dm06_damage_task = nil
enmgen2_collector_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_collector_01",
      name = "collector0101",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_02",
      name = "collector0102",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = "locator_collector_03",
      name = "collector0103",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = "locator_collector_04",
      name = "collector0104",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_05",
      name = "collector0105",
      ai_spawn_option = "Collector/dm06_a"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    dm06_collectors_dead = dm06_collectors_dead + 1
  end
}
enmgen2_collector_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_collector_01",
      name = "collector0201",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = "locator_collector_02",
      name = "collector0202",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_03",
      name = "collector0203",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = "locator_collector_04",
      name = "collector0204",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = "locator_collector_05",
      name = "collector0205",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_06",
      name = "collector0206",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = "locator_collector_07",
      name = "collector0207",
      ai_spawn_option = "Collector/dm06_a"
    }
  },
  onObjectAsh = function(A0_2, A1_3)
    dm06_collectors_dead = dm06_collectors_dead + 1
  end
}
enmgen2_collector_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_collector_01",
      name = "collector0301",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_02",
      name = "collector0302",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = "locator_collector_03",
      name = "collector0303",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = "locator_collector_04",
      name = "collector0304",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_05",
      name = "collector0305",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = "locator_collector_06",
      name = "collector0306",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = "locator_collector_07",
      name = "collector0307",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = "locator_collector_08",
      name = "collector0308",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = "locator_collector_09",
      name = "collector0309",
      ai_spawn_option = "Collector/dm06_a"
    }
  },
  onObjectAsh = function(A0_4, A1_5)
    dm06_collectors_dead = dm06_collectors_dead + 1
  end
}
function Initialize()
  local L0_6
  L0_6 = {
    {
      name = "bit_01",
      type = "bit02",
      node = "locator2_bit_01"
    }
  }
  Fn_setupNpc(L0_6)
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_sendEventComSb("initArk")
  while Fn_sendEventComSb("isArkReady") == false do
    wait()
  end
  dm06_collector_01 = findGameObject2("EnemyGenerator", "enmgen2_collector_01")
  dm06_collector_02 = findGameObject2("EnemyGenerator", "enmgen2_collector_02")
  dm06_collector_03 = findGameObject2("EnemyGenerator", "enmgen2_collector_03")
  dm06_collector_01:requestIdlingEnemy(true)
  while true do
    if RAC_isReadyEnemy(dm06_collector_01) then
      setEnemyTarget(dm06_collector_01)
      break
    end
    wait()
  end
  Fn_lookAtObjectWait("locator2_ark_look")
  Fn_missionStart()
  waitSeconds(1)
  Fn_kaiwaDemoView("dm06_00110k")
  RAC_missionNaviCaption("dm06_00101", nil, "dm06_00100", nil, nil, nil, "cro_267")
  Fn_userCtrlOn()
  dm06_collector_01:requestIdlingEnemy(false)
  RAC_disappearSPNpc("bit_01")
  dm06_damage_task = invokeTask(damageArk)
  while dm06_collectors_dead < 4 do
    wait()
  end
  Fn_sendEventComSb("playArkEffect", "eff01")
  dm06_collector_02:requestSpawn()
  Sound:playSE("cro_269", 1, "")
  Fn_captionView("dm06_00102")
  while true do
    while true do
      if RAC_isReadyEnemy(dm06_collector_02) then
        setEnemyTarget(dm06_collector_02)
        break
      end
      wait()
    end
  end
  while dm06_collectors_dead < 11 do
    wait()
  end
  dm06_collector_03:requestSpawn()
  Sound:playSE("cro_269", 1, "")
  Fn_captionView("dm06_00103")
  while true do
    while true do
      if RAC_isReadyEnemy(dm06_collector_03) then
        setEnemyTarget(dm06_collector_03)
        break
      end
      wait()
    end
  end
  while dm06_collectors_dead < 16 do
    wait()
  end
  dm06_goal = true
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_7, L1_8
end
function pccubesensor2_outrange_01_OnLeave()
  local L0_9, L1_10
end
function pccubesensor2_outrange_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("pc2_079", 1, "")
    Fn_captionView("dm06_00104")
  end)
end
function setArkActive(A0_11)
  Fn_sendEventComSb("changeArk", A0_11)
  setEnemyTarget(dm06_collector_01)
  setEnemyTarget(dm06_collector_02)
  setEnemyTarget(dm06_collector_03)
end
function damageArk()
  RAC_gaugeInit("dm06_00109", HUD.kCountType_Down, 0.75, 1)
  while dm06_goal == false do
    RAC_gaugeSetRate(Fn_sendEventComSb("getArkHpRate") * 100)
    if Fn_sendEventComSb("getArkHpRate") <= 0 then
      Fn_captionViewWait("dm06_00108")
      Fn_scriptGameOver(true)
      break
    elseif Fn_sendEventComSb("getArkHpRate") <= 0.25 and Fn_sendEventComSb("getActiveArkNo") < 4 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_00107")
        setArkActive(4)
      end)
    elseif Fn_sendEventComSb("getArkHpRate") <= 0.5 and Fn_sendEventComSb("getActiveArkNo") < 3 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_00106")
        setArkActive(3)
      end)
    elseif 0.75 >= Fn_sendEventComSb("getArkHpRate") and Fn_sendEventComSb("getActiveArkNo") < 2 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_00105")
        setArkActive(2)
      end)
    end
    wait()
  end
end
