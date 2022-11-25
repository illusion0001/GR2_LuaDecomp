dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/fatal_marker.lua")
ENEMY_TYPE_LUMINO = 1
ENEMY_TYPE_TENEBRIA = 2
_enemyWork = {
  {
    name = "lumino_01",
    gauge_text = "ui_boss_hp_09",
    event_name = "enemy_lumino_event",
    caption1 = "dm05_01002",
    caption2 = "dm05_01003"
  },
  {
    name = "tenebria_01",
    gauge_text = "ui_boss_hp_10",
    event_name = "enemy_tenebria_event",
    caption1 = "dm05_01004",
    caption2 = "dm05_01005"
  }
}
_chargeCount = 0
enmgen2_lumino_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator_lumino_01",
      name = "lumino_01",
      ai_spawn_option = "Lumino/dm05_b"
    }
  }
}
enmgen2_tenebria_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator_tenebria_01",
      name = "tenebria_01",
      ai_spawn_option = "Tenebria/dm05_b"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator_tenebria",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator_tenebria",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator_tenebria",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator_tenebria",
      name = "call_tenebria_04"
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "bit_01",
      type = "bit02",
      node = "locator2_bit_01"
    }
  }
  Fn_setupNpc(L0_0)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
end
function Ingame()
  for _FORV_3_, _FORV_4_ in ipairs(_enemyWork) do
    _enemyWork[_FORV_3_].enemyGenerator = findGameObject2("EnemyGenerator", "enmgen2_" .. _FORV_4_.name)
    _enemyWork[_FORV_3_].puppet = findGameObject2("Puppet", _FORV_4_.name)
    _enemyWork[_FORV_3_].brain = findGameObject2("EnemyBrain", _FORV_4_.name)
    _enemyWork[_FORV_3_].brain:setVisibleBossMarker(true)
    _enemyWork[_FORV_3_].brain:setEventListener(_enemyWork[_FORV_3_].event_name, function(A0_1)
      if A0_1.eventType == "charge_result" then
        if A0_1.chargeResult == true then
          Fn_captionView(({
            "dm05_01011",
            "dm05_01012",
            "dm05_01013"
          })[math.random(#{
            "dm05_01011",
            "dm05_01012",
            "dm05_01013"
          })])
        else
          Fn_captionView(({
            "dm05_01014",
            "dm05_01015",
            "dm05_01016"
          })[math.random(#{
            "dm05_01014",
            "dm05_01015",
            "dm05_01016"
          })])
        end
      elseif A0_1.eventType == "charge_start" then
        _chargeCount = _chargeCount + 1
        if _chargeCount == 1 then
          Fn_captionView("dm05_01007")
        else
          Fn_captionView(({
            "dm05_01008",
            "dm05_01009",
            "dm05_01010"
          })[math.random(#{
            "dm05_01008",
            "dm05_01009",
            "dm05_01010"
          })])
        end
      elseif A0_1.eventType == "power_down" then
        Fn_captionView(({
          "dm05_01017",
          "dm05_01018",
          "dm05_01019"
        })[math.random(#{
          "dm05_01017",
          "dm05_01018",
          "dm05_01019"
        })])
      end
      return A0_1
    end)
    _enemyWork[_FORV_3_].caption1_flag = false
    _enemyWork[_FORV_3_].caption2_flag = false
  end
  BossRequestIdling(true)
  Fn_userCtrlAllOff()
  for _FORV_4_, _FORV_5_ in ipairs(_enemyWork) do
    FatalMarker.create(kFATAL_TYPE_ACT):set(_FORV_5_.puppet, "bn_c03_neck", true, true, 0, _FORV_5_.gauge_text)
  end
  Fn_missionStart()
  Fn_kaiwaDemoView("dm05_00210k")
  RAC_missionNaviCaption("dm05_01000", nil, "dm05_01006")
  Fn_userCtrlOn()
  RAC_disappearSPNpc("bit_01")
  BossRequestIdling(false)
  FatalMarker.create(kFATAL_TYPE_ACT):run()
  while FatalMarker.create(kFATAL_TYPE_ACT):isFatalFinish() == false do
    for _FORV_4_, _FORV_5_ in ipairs(_enemyWork) do
      if _FORV_5_.caption1_flag == false and _FORV_5_.brain:getHealth() / _FORV_5_.brain:getMaxHealth() < 0.7 then
        _FORV_5_.caption1_flag = true
        Fn_captionView(_FORV_5_.caption1)
      elseif _FORV_5_.caption2_flag == false and _FORV_5_.brain:getHealth() / _FORV_5_.brain:getMaxHealth() < 0.3 then
        _FORV_5_.caption2_flag = true
        Fn_captionView(_FORV_5_.caption2)
      end
    end
    wait()
  end
  FatalMarker.create(kFATAL_TYPE_ACT):kill()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
function pccubesensor2_area_OnEnter(A0_4)
  local L1_5
  L1_5 = RAC_getTailNumber
  L1_5 = L1_5(A0_4:getName(), 2)
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_pc_area_" .. string.format("%02d", L1_5))
  end)
end
function pccubesensormulti2_outrange_01_OnLeave()
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    Fn_captionView("dm05_01001")
    RAC_LookAtObject(_findObjectHandle("locator2_pc_start_pos"), 0, 0.2)
    Player:setStay(false)
    Fn_userCtrlOn()
  end)
end
function pccubesensormulti2_outrange_02_OnLeave()
  invokeTask(function()
    StageReset()
  end)
end
function StageReset()
  Fn_userCtrlAllOff()
  Fn_catWarpIn()
  BossRequestIdling(true)
  Fn_catWarpCheckPoint()
  Fn_catWarpOut()
  while not HUD:faderStability() do
    wait()
  end
  wait(15)
  Fn_userCtrlOn()
  BossRequestIdling(false)
end
function BossRequestIdling(A0_6)
  for _FORV_4_, _FORV_5_ in ipairs(_enemyWork) do
    _FORV_5_.enemyGenerator:requestIdlingEnemy(false)
  end
end
