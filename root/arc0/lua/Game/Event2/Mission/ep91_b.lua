import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_navi_market = false
enmgen2_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_b_01_01",
      name = "enm_b_01_01",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    },
    {
      type = "stalker",
      locator = "locator_b_01_02",
      name = "enm_b_01_02",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    }
  }
}
enmgen2_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_b_02_01",
      name = "enm_b_02_01"
    }
  }
}
enmgen2_b_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_b_03_01",
      name = "ene_b_03_01"
    },
    {
      type = "gellyfish",
      locator = "locator_b_03_02",
      name = "ene_b_03_02"
    },
    {
      type = "gellyfish",
      locator = "locator_b_03_03",
      name = "ene_b_03_03"
    }
  }
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_market")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = 0
  while true do
    if L0_0 == 0 then
      L1_1 = Fn_pcSensorOn
      L2_2 = "pccubesensor2_market"
      L1_1(L2_2)
      L0_0 = 1
    elseif L0_0 == 1 then
      L1_1 = _navi_market
      if L1_1 == true then
        L0_0 = 2
      end
    elseif L0_0 == 2 then
      L1_1 = invokeTask
      function L2_2()
        local L0_12, L1_13
        L0_12 = {
          L1_13,
          {
            "mmb017a",
            "mmb017b",
            "mmb017c"
          },
          {
            "mmc017a",
            "mmc017b",
            "mmc017c"
          },
          {
            "mwa017a",
            "mwa017b",
            "mwa017c"
          },
          {
            "mwb017a",
            "mwb017b",
            "mwb017c"
          },
          {
            "mwc017a",
            "mwc017b",
            "mwc017c"
          }
        }
        L1_13 = {
          "mma017a",
          "mma017b",
          "mma017c"
        }
        L1_13 = RandI
        L1_13 = L1_13(2, 4)
        for _FORV_6_ = 1, L1_13 do
          Sound:playSE(L0_12[Fn_get_random_index_teble(1, L1_13)[_FORV_6_]][RandI(1, 3)], RandF(0.3, 0.8), "", nil)
          waitSeconds(RandF(0.5, 1.5))
        end
      end
      L1_1(L2_2)
      L1_1 = Fn_sendEventComSb
      L2_2 = "getMobPanic"
      L1_1 = L1_1(L2_2)
      if L1_1 == false then
        L1_1 = Fn_sendEventComSb
        L2_2 = "setMobPanic"
        L3_3 = true
        L1_1(L2_2, L3_3)
        L1_1 = Mob
        L2_2 = L1_1
        L1_1 = L1_1.makeSituationPanic
        L3_3 = true
        L1_1(L2_2, L3_3)
      end
      L1_1 = findGameObject2
      L2_2 = "EnemyGenerator"
      L3_3 = "enmgen2_b_01"
      L1_1 = L1_1(L2_2, L3_3)
      L3_3 = L1_1
      L2_2 = L1_1.requestSpawn
      L2_2(L3_3)
      L2_2 = wait
      L2_2()
      L2_2 = {
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      }
      L3_3 = findGameObject2
      L4_4 = "Puppet"
      L3_3 = L3_3(L4_4, L5_5)
      L4_4 = findGameObject2
      L11_11 = L4_4(L5_5, L6_6)
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[2] = L4_4
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[3] = L5_5
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[4] = L6_6
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[5] = L7_7
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[6] = L8_8
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[7] = L9_9
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[8] = L10_10
      ;({
        L3_3,
        [10] = L4_4(L5_5, L6_6)
      })[9] = L11_11
      L3_3 = invokeTask
      function L4_4()
        choice_look_idx(L2_2, 8)
      end
      L3_3(L4_4)
      L3_3 = 0
      L4_4 = {}
      for L8_8, L9_9 in L5_5(L6_6) do
        L3_3 = L3_3 + 1
        L10_10 = L9_9.name
        L4_4[L3_3] = L10_10
      end
      while true do
        for L9_9, L10_10 in L6_6(L7_7) do
          L11_11 = findGameObject2
          L11_11 = L11_11("EnemyBrain", L10_10)
          if L11_11 ~= nil and 0 >= L11_11:getHealth() then
            break
          end
        end
        if not (L3_3 > L6_6) and L5_5 ~= true then
          L6_6()
        end
      end
      L6_6(L7_7)
      L6_6()
      for L9_9, L10_10 in L6_6(L7_7) do
        L3_3 = L3_3 + 1
        L11_11 = L10_10.name
        L4_4[L3_3] = L11_11
      end
      while true do
        for L10_10, L11_11 in L7_7(L8_8) do
        end
        if L7_7 <= 0 then
        end
        if not (L7_7 <= 0) and not (L3_3 <= L6_6) then
          L7_7()
        end
      end
      L0_0 = 3
      break
    elseif L0_0 == 3 then
      L1_1 = findGameObject2
      L2_2 = "EnemyGenerator"
      L3_3 = "enmgen2_b_03"
      L1_1 = L1_1(L2_2, L3_3)
      L3_3 = L1_1
      L2_2 = L1_1.requestSpawn
      L2_2(L3_3)
      L2_2 = wait
      L2_2()
      while true do
        L3_3 = L1_1
        L2_2 = L1_1.getEnemyCount
        L2_2 = L2_2(L3_3)
        if L2_2 > 0 then
          L2_2 = wait
          L2_2()
          do break end
          L1_1 = wait
          L1_1()
        end
      end
    end
  end
  L1_1 = Fn_setKeepPlayerPos
  L1_1()
  L1_1 = Fn_setNextMissionFlag
  L1_1()
  L1_1 = Fn_nextMission
  L1_1()
  L1_1 = Fn_exitSandbox
  L1_1()
end
function Finalize()
  local L0_14, L1_15
end
function pccubesensor2_market_OnEnter(A0_16)
  _navi_market = true
  A0_16:setActive(false)
end
