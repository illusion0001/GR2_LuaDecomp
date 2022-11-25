import("Mob")
import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
dofile("/Game/Misc/pdemo.lua")
_pdemo = nil
_ash_cnt = 0
enmgen2_ship_d = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_d_01",
      name = "ene_d_ship"
    },
    {
      type = "mechsmall",
      locator = "locator_d_01",
      name = "ene_d_mech_01",
      target_vehicle = "ene_d_ship",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "mechsmall",
      locator = "locator_d_01",
      name = "ene_d_mech_02",
      target_vehicle = "ene_d_ship",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "officer_rifle",
      locator = "locator_d_01",
      name = "ene_d_01",
      target_vehicle = "ene_d_mech_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_d_01",
      name = "ene_d_02",
      target_vehicle = "ene_d_mech_02"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "ene_d_mech_01",
      "ene_d_mech_02"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end
}
enmgen2_bu_e = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_launcher",
      locator = "locator_e_01",
      name = "ene_e_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_02",
      name = "ene_e_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_03",
      name = "ene_e_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_04",
      name = "ene_e_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_05",
      name = "ene_e_05"
    }
  },
  onObjectAsh = function(A0_6, A1_7)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "ene_e_01",
      "ene_e_02",
      "ene_e_03",
      "ene_e_04",
      "ene_e_05"
    }, 3, GEM_VITAL)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
enmgen2_bu_f = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_launcher",
      locator = "locator_f_01",
      name = "ene_f_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_f_02",
      name = "ene_f_02"
    }
  },
  onObjectAsh = function(A0_12, A1_13)
    _ash_cnt = _ash_cnt + 1
  end
}
function Initialize()
  local L0_14
  L0_14 = Fn_userCtrlOff
  L0_14()
  L0_14 = Fn_pcSensorOff
  L0_14("pccubesensor2_battle_navi_in")
  L0_14 = Fn_pcSensorOff
  L0_14("pccubesensor2_battle_navi_out")
  L0_14 = Fn_pcSensorOff
  L0_14("pccubesensor2_battle_outrange")
  L0_14 = loadFileAsset
  L0_14 = L0_14("nvm", "po_a_01_custom01")
  if L0_14 ~= nil then
    L0_14:wait()
    if Fn_findAreaHandle("po_a_01") ~= nil then
      Fn_findAreaHandle("po_a_01"):addNaviMeshAsset(L0_14)
    end
  end
  _pdemo = PDemo.create("ep07_b_c01", Fn_findAreaHandle("po_a_01"), {camera = true, scene_param = false})
end
function Ingame()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27
  L0_15 = Fn_setCatWarpCheckPoint
  L1_16 = "locator2_pc_start_pos"
  L0_15(L1_16)
  L0_15 = Fn_sendEventComSb
  L1_16 = "requestCreateGem"
  L0_15(L1_16)
  L0_15 = Area
  L1_16 = L0_15
  L0_15 = L0_15.setAreaFree
  L0_15(L1_16)
  L0_15 = Time
  L1_16 = L0_15
  L0_15 = L0_15.setInGameDeltaSec
  L2_17 = 0
  L0_15(L1_16, L2_17)
  L0_15 = wait
  L0_15()
  L0_15 = Fn_resetArea
  L0_15()
  L0_15 = Fn_setKittenAndCatActive
  L1_16 = false
  L0_15(L1_16)
  L0_15 = Fn_resetPcPos
  L1_16 = "locator2_pc_start_pos"
  L0_15(L1_16)
  L0_15 = Fn_setKittenAndCatActive
  L1_16 = false
  L0_15(L1_16)
  L0_15 = Fn_findAreaHandle
  L1_16 = "po_a_01"
  L0_15 = L0_15(L1_16)
  L1_16 = Fn_findAreaHandle
  L2_17 = "bu_a_09"
  L1_16 = L1_16(L2_17)
  L3_18 = L0_15
  L2_17 = L0_15.setDriftEnable
  L4_19 = false
  L2_17(L3_18, L4_19)
  L3_18 = L1_16
  L2_17 = L1_16.setDriftEnable
  L4_19 = false
  L2_17(L3_18, L4_19)
  L2_17 = Time
  L3_18 = L2_17
  L2_17 = L2_17.resetInGameDeltaSec
  L2_17(L3_18)
  L2_17 = wait
  L2_17()
  while true do
    L2_17 = _pdemo
    L3_18 = L2_17
    L2_17 = L2_17.isLoading
    L2_17 = L2_17(L3_18)
    if L2_17 == false then
      L2_17 = wait
      L2_17()
    end
  end
  L2_17 = _pdemo
  L3_18 = L2_17
  L2_17 = L2_17.setVisible
  L4_19 = true
  L2_17(L3_18, L4_19)
  L2_17 = _pdemo
  L3_18 = L2_17
  L2_17 = L2_17.switchCamera
  L4_19 = true
  L5_20 = 0
  L2_17(L3_18, L4_19, L5_20)
  L2_17 = Fn_missionStart
  L2_17()
  L2_17 = _pdemo
  L3_18 = L2_17
  L2_17 = L2_17.play
  L2_17(L3_18)
  while true do
    L2_17 = _pdemo
    L3_18 = L2_17
    L2_17 = L2_17.isEnd
    L2_17 = L2_17(L3_18)
    if L2_17 == false then
      L2_17 = wait
      L2_17()
    end
  end
  L2_17, L3_18, L4_19, L5_20, L6_21 = nil, nil, nil, nil, nil
  function L7_22()
    local L0_28, L1_29, L2_30
    L0_28 = false
    L1_29 = invokeTask
    function L2_30()
      L4_19 = findGameObject2("EnemyGenerator", "enmgen2_ship_d")
      L4_19:requestSpawn()
      while L4_19:isPrepared() == false do
        wait()
      end
      L4_19:setEnemyMarker(false)
      L0_28 = true
    end
    L1_29(L2_30)
    L1_29 = wait
    L1_29()
    L1_29 = false
    L2_30 = invokeTask
    L2_30(function()
      L5_20 = findGameObject2("EnemyGenerator", "enmgen2_bu_e")
      L5_20:requestSpawn()
      while L5_20:isPrepared() == false do
        wait()
      end
      L5_20:setEnemyMarker(false)
      L5_20:requestIdlingEnemy(true)
      L1_29 = true
    end)
    L2_30 = wait
    L2_30()
    L2_30 = false
    invokeTask(function()
      L6_21 = findGameObject2("EnemyGenerator", "enmgen2_bu_f")
      L6_21:requestSpawn()
      while L6_21:isPrepared() == false do
        wait()
      end
      L6_21:setEnemyMarker(false)
      L6_21:requestIdlingEnemy(true)
      L2_30 = true
    end)
    wait()
    L0_15:setDriftEnable(true)
    L1_16:setDriftEnable(true)
    Fn_setKittenAndCatActive(true)
    _pdemo:setVisible(false)
    _pdemo:stop(0)
    _pdemo:try_term()
    L2_17 = Fn_spawnSuppotCrow(nil, Supporter.FirstAction.Ground, "locator2_crow01_01")
    L3_18 = L2_17:getBrain()
    L3_18:setIdling(true)
    while L1_29 == false do
      wait()
    end
    while L0_28 == false do
      wait()
    end
    while L2_30 == false do
      wait()
    end
    while _pdemo:isStopped() == false do
      wait()
    end
  end
  L8_23 = Fn_kaiwaDemoView2
  L9_24 = "ep80_00170k"
  L10_25 = L7_22
  L11_26 = true
  L8_23(L9_24, L10_25, L11_26)
  L8_23 = Mob
  L9_24 = L8_23
  L8_23 = L8_23.makeSituationPanic
  L10_25 = true
  L8_23(L9_24, L10_25)
  L8_23 = Fn_pcSensorOn
  L9_24 = "pccubesensor2_battle_navi_out"
  L8_23(L9_24)
  L8_23 = Fn_pcSensorOn
  L9_24 = "pccubesensor2_battle_outrange"
  L8_23(L9_24)
  L8_23 = Player
  L9_24 = L8_23
  L8_23 = L8_23.setStay
  L10_25 = false
  L8_23(L9_24, L10_25)
  L8_23 = Fn_userCtrlOn
  L8_23()
  L8_23 = Fn_missionView
  L9_24 = "ep80_00116"
  L8_23(L9_24)
  L8_23 = enmgen2_ship_d
  L8_23 = L8_23.spawnSet
  L8_23 = #L8_23
  L8_23 = L8_23 - 1
  L9_24 = enmgen2_bu_e
  L9_24 = L9_24.spawnSet
  L9_24 = #L9_24
  L8_23 = L8_23 + L9_24
  L9_24 = enmgen2_bu_f
  L9_24 = L9_24.spawnSet
  L9_24 = #L9_24
  L8_23 = L8_23 + L9_24
  L10_25 = L5_20
  L9_24 = L5_20.requestIdlingEnemy
  L11_26 = false
  L9_24(L10_25, L11_26)
  L10_25 = L5_20
  L9_24 = L5_20.setEnemyMarker
  L11_26 = true
  L9_24(L10_25, L11_26)
  L10_25 = L6_21
  L9_24 = L6_21.requestIdlingEnemy
  L11_26 = false
  L9_24(L10_25, L11_26)
  L10_25 = L6_21
  L9_24 = L6_21.setEnemyMarker
  L11_26 = true
  L9_24(L10_25, L11_26)
  L10_25 = L3_18
  L9_24 = L3_18.setIdling
  L11_26 = false
  L9_24(L10_25, L11_26)
  L9_24 = {L10_25}
  L10_25 = "locator2_drop_d_01"
  L10_25 = {L11_26}
  L11_26 = "locator2_drop_d_02"
  L11_26 = {
    L12_27,
    "locator2_back_d_02",
    "locator2_back_d_03",
    "locator2_back_d_04"
  }
  L12_27 = "locator2_back_d_01"
  L12_27 = findGameObject2
  L12_27 = L12_27("Puppet", "ene_d_ship")
  L12_27:getBrain():setEventListener("enemy_landingship_event", get_ship_func("drop01", L9_24, L10_25, L11_26, L4_19, L12_27))
  while L8_23 > _ash_cnt and (not (1 >= L4_19:getEnemyCount()) or not (0 >= L5_20:getEnemyCount()) or not (0 >= L6_21:getEnemyCount())) do
    wait()
  end
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function get_ship_func(A0_31, A1_32, A2_33, A3_34, A4_35, A5_36)
  local L6_37
  function L6_37(A0_38)
    if A0_38.state == "wait" then
      if A0_31 == "drop01" then
        A0_38.changeState = "move"
        A0_38.movePoint = A1_32
      elseif A0_31 == "drop02" then
        A0_38.changeState = "move"
        A0_38.movePoint = A2_33
      elseif A0_31 == "land_back" then
        A0_38.changeState = "move"
        A0_38.movePoint = A3_34
        A0_31 = "empty"
      end
    end
    if A0_38.state == "moveEnd" then
      if A0_31 == "drop01" then
        A0_38.dropEnemy = {
          "ene_d_mech_01"
        }
        A0_38.changeState = "drop"
      elseif A0_31 == "drop02" then
        A0_38.dropEnemy = {
          "ene_d_mech_02"
        }
        A0_38.changeState = "drop"
      elseif A0_31 == "empty" and A5_36 ~= nil then
        Fn_setAlpha(A5_36, false)
      end
    end
    if A0_38.state == "dropEnd" then
      if A0_31 == "drop01" then
        A0_31 = "drop02"
        A4_35:setEnemyMarker(true)
      elseif A0_31 == "drop02" then
        A0_31 = "land_back"
      end
    end
    return A0_38
  end
  return L6_37
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
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_42:setActive(false)
end
