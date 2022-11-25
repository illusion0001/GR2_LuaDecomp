import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_ash_cnt = 0
enmgen2_ship_a = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_a_01",
      name = "ene_a_01",
      target_vehicle = "ene_a_ship"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a_01",
      name = "ene_a_02",
      target_vehicle = "ene_a_ship"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a_01",
      name = "ene_a_03",
      target_vehicle = "ene_a_ship"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a_01",
      name = "ene_a_04",
      target_vehicle = "ene_a_ship"
    },
    {
      type = "landingship",
      locator = "locator_a_01",
      name = "ene_a_ship"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "ene_a_01",
      "ene_a_02",
      "ene_a_03",
      "ene_a_04"
    }, 3, GEM_VITAL)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end
}
enmgen2_ship_b = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_b_01",
      name = "ene_b_01",
      target_vehicle = "ene_b_ship"
    },
    {
      type = "soldier_rifle",
      locator = "locator_b_01",
      name = "ene_b_02",
      target_vehicle = "ene_b_ship"
    },
    {
      type = "soldier_rifle",
      locator = "locator_b_01",
      name = "ene_b_03",
      target_vehicle = "ene_b_ship"
    },
    {
      type = "soldier_launcher",
      locator = "locator_b_01",
      name = "ene_b_04",
      target_vehicle = "ene_b_ship"
    },
    {
      type = "landingship",
      locator = "locator_b_01",
      name = "ene_b_ship"
    }
  },
  onObjectAsh = function(A0_6, A1_7)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "ene_b_01",
      "ene_b_02",
      "ene_b_03",
      "ene_b_04"
    }, 3, GEM_VITAL)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
enmgen2_bu_c = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_c_01",
      name = "ene_c_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_c_02",
      name = "ene_c_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_c_03",
      name = "ene_c_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_c_04",
      name = "ene_c_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_c_05",
      name = "ene_c_05"
    },
    {
      type = "officer_launcher",
      locator = "locator_c_06",
      name = "ene_c_06"
    }
  },
  onObjectAsh = function(A0_12, A1_13)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_14, A1_15)
    Fn_enemyPopGemSetup(A0_14, {
      "ene_c_01",
      "ene_c_02",
      "ene_c_03",
      "ene_c_04",
      "ene_c_05",
      "ene_c_06"
    }, 3, GEM_VITAL)
  end,
  onPopGem = function(A0_16, A1_17)
    Fn_enemyAshPopGem(A0_16, A1_17)
  end
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_bungua")
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
end
function Ingame()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31
  L0_18 = Fn_setCatWarpCheckPoint
  L1_19 = "locator2_pc_start_pos"
  L0_18(L1_19)
  L0_18 = Fn_pcSensorOn
  L1_19 = "pccubesensor2_battle_navi_out"
  L0_18(L1_19)
  L0_18 = Fn_pcSensorOn
  L1_19 = "pccubesensor2_battle_outrange"
  L0_18(L1_19)
  L0_18 = Fn_sendEventComSb
  L1_19 = "requestCreateGem"
  L0_18(L1_19)
  L0_18 = findGameObject2
  L1_19 = "EnemyGenerator"
  L2_20 = "enmgen2_ship_a"
  L0_18 = L0_18(L1_19, L2_20)
  L2_20 = L0_18
  L1_19 = L0_18.requestSpawn
  L1_19(L2_20)
  while true do
    L2_20 = L0_18
    L1_19 = L0_18.isSpawnOnStartFinished
    L1_19 = L1_19(L2_20)
    if L1_19 == false then
      L1_19 = wait
      L1_19()
    end
  end
  L1_19 = findGameObject2
  L2_20 = "Puppet"
  L3_21 = "ene_a_ship"
  L1_19 = L1_19(L2_20, L3_21)
  L3_21 = L1_19
  L2_20 = L1_19.getBrain
  L2_20 = L2_20(L3_21)
  L3_21 = enmgen2_ship_a
  L3_21 = L3_21.spawnSet
  L3_21 = #L3_21
  L3_21 = L3_21 - 1
  L5_23 = L0_18
  L4_22 = L0_18.setEnemyMarker
  L6_24 = false
  L4_22(L5_23, L6_24)
  L4_22 = set_enmgen_homing_target
  L5_23 = enmgen2_ship_a
  L5_23 = L5_23.spawnSet
  L6_24 = false
  L4_22(L5_23, L6_24)
  L4_22 = findGameObject2
  L5_23 = "EnemyGenerator"
  L6_24 = "enmgen2_bu_c"
  L4_22 = L4_22(L5_23, L6_24)
  L6_24 = L4_22
  L5_23 = L4_22.requestSpawn
  L5_23(L6_24)
  while true do
    L6_24 = L4_22
    L5_23 = L4_22.isSpawnOnStartFinished
    L5_23 = L5_23(L6_24)
    if L5_23 == false then
      L5_23 = wait
      L5_23()
    end
  end
  L5_23 = enmgen2_bu_c
  L5_23 = L5_23.spawnSet
  L5_23 = #L5_23
  L3_21 = L3_21 + L5_23
  L6_24 = L4_22
  L5_23 = L4_22.setEnemyMarker
  L7_25 = false
  L5_23(L6_24, L7_25)
  L5_23 = set_enmgen_homing_target
  L6_24 = enmgen2_bu_c
  L6_24 = L6_24.spawnSet
  L7_25 = false
  L5_23(L6_24, L7_25)
  L5_23 = Fn_missionStart
  L5_23()
  L5_23 = Fn_userCtrlOn
  L5_23()
  L5_23 = {L6_24}
  L6_24 = "locator2_open_a_01"
  L6_24 = {
    L7_25,
    L8_26,
    L9_27
  }
  L7_25 = "locator2_back_a_01"
  L8_26 = "locator2_back_a_02"
  L9_27 = "locator2_back_a_03"
  L8_26 = L2_20
  L7_25 = L2_20.setEventListener
  L9_27 = "enemy_landingship_event"
  L10_28 = get_ship_func
  L11_29 = "open"
  L12_30 = L5_23
  L13_31 = L6_24
  L13_31 = L10_28(L11_29, L12_30, L13_31, L0_18, L1_19)
  L7_25(L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L10_28(L11_29, L12_30, L13_31, L0_18, L1_19))
  L7_25 = Fn_missionView
  L8_26 = "ep80_01019"
  L7_25(L8_26)
  L7_25 = Fn_pcSensorOn
  L8_26 = "pccubesensor2_bungua"
  L7_25(L8_26)
  L7_25 = waitSeconds
  L8_26 = 2
  L7_25(L8_26)
  L7_25 = Fn_naviSet
  L8_26 = findGameObject2
  L9_27 = "Node"
  L10_28 = "locator2_bungua"
  L13_31 = L8_26(L9_27, L10_28)
  L7_25(L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L8_26(L9_27, L10_28))
  L7_25 = waitPhase
  L7_25()
  L7_25 = Fn_setCatWarpCheckPoint
  L8_26 = "locator2_bungua"
  L7_25(L8_26)
  L7_25 = Fn_naviKill
  L7_25()
  L7_25 = Fn_setBgmPoint
  L8_26 = "event"
  L9_27 = "return_bungua"
  L7_25(L8_26, L9_27)
  L7_25 = Mob
  L8_26 = L7_25
  L7_25 = L7_25.makeSituationPanic
  L9_27 = true
  L7_25(L8_26, L9_27)
  L7_25 = Fn_missionView
  L8_26 = "ep80_00040"
  L7_25(L8_26)
  L7_25 = waitSeconds
  L8_26 = 2
  L7_25(L8_26)
  L8_26 = L4_22
  L7_25 = L4_22.setEnemyMarker
  L9_27 = true
  L7_25(L8_26, L9_27)
  L7_25 = set_enmgen_homing_target
  L8_26 = enmgen2_bu_c
  L8_26 = L8_26.spawnSet
  L9_27 = true
  L7_25(L8_26, L9_27)
  L7_25 = set_enmgen_homing_target
  L8_26 = enmgen2_ship_a
  L8_26 = L8_26.spawnSet
  L9_27 = true
  L7_25(L8_26, L9_27)
  L7_25 = false
  L8_26 = invokeTask
  function L9_27()
    waitSeconds(1)
    Fn_tutorialCaption("tune_norm_mars_jupt")
    while _ash_cnt <= 5 do
      wait()
    end
    Fn_tutorialCaptionKill()
    L7_25 = true
  end
  L8_26 = L8_26(L9_27)
  while true do
    L9_27 = _ash_cnt
    if L9_27 <= 1 then
      L9_27 = wait
      L9_27()
    end
  end
  L9_27 = Fn_setBgmPoint
  L10_28 = "event"
  L11_29 = "battle"
  L9_27(L10_28, L11_29)
  L9_27 = findGameObject2
  L10_28 = "EnemyGenerator"
  L11_29 = "enmgen2_ship_b"
  L9_27 = L9_27(L10_28, L11_29)
  L11_29 = L9_27
  L10_28 = L9_27.requestSpawn
  L10_28(L11_29)
  while true do
    L11_29 = L9_27
    L10_28 = L9_27.isSpawnOnStartFinished
    L10_28 = L10_28(L11_29)
    if L10_28 == false then
      L10_28 = wait
      L10_28()
    end
  end
  L11_29 = L9_27
  L10_28 = L9_27.setEnemyMarker
  L12_30 = false
  L10_28(L11_29, L12_30)
  L10_28 = findGameObject2
  L11_29 = "Puppet"
  L12_30 = "ene_b_ship"
  L10_28 = L10_28(L11_29, L12_30)
  L12_30 = L10_28
  L11_29 = L10_28.getBrain
  L11_29 = L11_29(L12_30)
  L12_30 = enmgen2_ship_a
  L12_30 = L12_30.spawnSet
  L12_30 = #L12_30
  L12_30 = L12_30 - 1
  L3_21 = L3_21 + L12_30
  L12_30 = {
    L13_31,
    "locator2_open_b_02"
  }
  L13_31 = "locator2_open_b_01"
  L13_31 = {
    "locator2_back_b_01",
    "locator2_back_b_02",
    "locator2_back_b_03",
    "locator2_back_b_04"
  }
  L11_29:setEventListener("enemy_landingship_event", get_ship_func("open", L12_30, L13_31, L9_27, L10_28))
  while L3_21 > _ash_cnt and (not (1 >= L0_18:getEnemyCount()) or not (1 >= L9_27:getEnemyCount()) or not (L4_22:getEnemyCount() <= 0)) do
    wait()
  end
  if L8_26 ~= nil and L8_26:isRunning() == true then
    L8_26:abort()
  end
  L8_26 = nil
  if invokeTask(function()
    while L7_25 == false do
      wait()
    end
    waitSeconds(3)
    if L3_21 > _ash_cnt then
      Fn_tutorialCaption("throw")
      waitSeconds(3)
      while L3_21 - 3 > _ash_cnt do
        wait()
      end
      Fn_tutorialCaptionKill()
    end
  end) ~= nil and invokeTask(function()
    while L7_25 == false do
      wait()
    end
    waitSeconds(3)
    if L3_21 > _ash_cnt then
      Fn_tutorialCaption("throw")
      waitSeconds(3)
      while L3_21 - 3 > _ash_cnt do
        wait()
      end
      Fn_tutorialCaptionKill()
    end
  end):isRunning() == true then
    invokeTask(function()
      while L7_25 == false do
        wait()
      end
      waitSeconds(3)
      if L3_21 > _ash_cnt then
        Fn_tutorialCaption("throw")
        waitSeconds(3)
        while L3_21 - 3 > _ash_cnt do
          wait()
        end
        Fn_tutorialCaptionKill()
      end
    end):abort()
  end
  Fn_tutorialCaptionKill()
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  Fn_setBgmPoint("event", "battle_end1")
  Fn_blackout(0.5)
  Player:setStay(true)
  Fn_userCtrlOff()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function get_ship_func(A0_32, A1_33, A2_34, A3_35, A4_36)
  local L5_37
  function L5_37(A0_38)
    if A0_38.state == "wait" then
      if A0_32 == "open" then
        A0_38.changeState = "move"
        A0_38.movePoint = A1_33
      elseif A0_32 == "land_back" then
        A0_38.changeState = "move"
        A0_38.movePoint = A2_34
        A0_32 = "empty"
      end
    end
    if A0_38.state == "moveEnd" then
      if A0_32 == "open" then
        A0_38.changeState = "open"
      elseif A0_32 == "empty" and A4_36 ~= nil then
        Fn_setAlpha(A4_36, false)
      end
    end
    if A0_38.state == "openEnd" then
      A0_32 = "land_back"
      A3_35:setEnemyMarker(true)
    end
    return A0_38
  end
  return L5_37
end
function Finalize()
  local L0_39, L1_40
end
function pccubesensor2_battle_navi_OnEnter(A0_41)
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_41:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_42)
  invokeTask(function()
    Fn_captionView("ep80_00115")
    waitSeconds(2)
    Fn_naviSet(findGameObject2("Node", "locator2_bungua"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_42:setActive(false)
end
