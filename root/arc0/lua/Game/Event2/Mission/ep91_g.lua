dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
enmgen2_g = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_g_01",
      name = "ene_g_01"
    },
    {
      type = "mechsmall",
      locator = "locator_g_02",
      name = "ene_g_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_g_01",
      name = "ene_g_09",
      target_vehicle = "ene_g_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_g_02",
      name = "ene_g_10",
      target_vehicle = "ene_g_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_g_03",
      name = "ene_g_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_g_04",
      name = "ene_g_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_g_05",
      name = "ene_g_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_g_06",
      name = "ene_g_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_g_07",
      name = "ene_g_07"
    },
    {
      type = "soldier_launcher",
      locator = "locator_g_08",
      name = "ene_g_08"
    }
  }
}
function Initialize()
  Fn_loadEventData("evx/ep90_common", {
    "evarea2_po_a_04_crate_after_dummy"
  })
  Fn_pcSensorOff("pccubesensor2_g_navi_01")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_sendEventComSb
  L1_1 = "setCrowSpawn"
  L2_2 = "locator2_crow_start_pos_g"
  L0_0(L1_1, L2_2)
  L0_0 = findGameObject2
  L1_1 = "EnemyGenerator"
  L2_2 = "enmgen2_g"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = 0
  while true do
    if L1_1 == 0 then
      L3_3 = L0_0
      L2_2 = L0_0.setEnemyMarker
      L2_2(L3_3, L4_4)
      L3_3 = L0_0
      L2_2 = L0_0.requestSpawn
      L2_2(L3_3)
      L2_2 = waitSeconds
      L3_3 = 1
      L2_2(L3_3)
      L2_2 = Fn_naviSet
      L3_3 = findGameObject2
      L9_9 = L3_3(L4_4, L5_5)
      L2_2(L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L3_3(L4_4, L5_5))
      L2_2 = Fn_pcSensorOn
      L3_3 = "pccubesensor2_g_navi_01"
      L2_2(L3_3)
      L2_2 = waitPhace
      L2_2()
      L1_1 = 1
    elseif L1_1 == 1 then
      L3_3 = L0_0
      L2_2 = L0_0.setEnemyMarker
      L2_2(L3_3, L4_4)
      L2_2 = 1
      L3_3 = {}
      for L7_7, L8_8 in L4_4(L5_5) do
        L9_9 = L8_8.name
        L3_3[L2_2] = L9_9
        L2_2 = L2_2 + 1
      end
      while true do
        if L5_5 > 0 then
          for L8_8, L9_9 in L5_5(L6_6) do
            if findGameObject2("EnemyBrain", L9_9) ~= nil and 0 < findGameObject2("EnemyBrain", L9_9):getHealth() then
              break
            end
          end
        end
        if L4_4 ~= true then
          L5_5()
          do break end
          L2_2 = wait
          L2_2()
        end
      end
    end
  end
  L2_2 = waitSeconds
  L3_3 = 5
  L2_2(L3_3)
  L2_2 = Fn_blackout
  L2_2()
  L2_2 = Fn_sendEventComSb
  L3_3 = "setCrowKill"
  L2_2(L3_3)
  L2_2 = wait
  L2_2()
  L2_2 = Fn_setNextMissionFlag
  L3_3 = "ep91_header"
  L2_2(L3_3)
  L2_2 = Fn_nextMission
  L2_2()
  L2_2 = Fn_exitSandbox
  L2_2()
end
function Finalize()
  local L0_10, L1_11
end
function nextPhace()
  local L0_12, L1_13
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pccubesensor2_navi_OnEnter(A0_14)
  Fn_naviKill()
  Fn_pcSensorOff(A0_14)
  _next_phase = true
end
