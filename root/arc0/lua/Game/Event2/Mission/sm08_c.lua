dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm08_common.lua")
OCC_UP = 0.005
ALL_ENEMY_NUM = 27
_navi_on = false
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "pre_01",
      type = "man40",
      node = "locator2_president",
      reset = false,
      use_gravity = false
    },
    {
      name = "sol_01",
      type = "man57",
      node = "locator2_soldier_01",
      reset = false,
      use_gravity = false
    },
    {
      name = "sol_02",
      type = "man57",
      node = "locator2_soldier_02",
      reset = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_ship_on_01")
  Fn_pcSensorOff("pccubesensor2_away_from_po_a_17")
  Fn_pcSensorOff("pccubesensor2_warning_cap_area")
  Fn_pcSensorOff("pccubesensor2_warning_navi_kill_area")
  _sdemo_cut01 = SDemo.create("sm08_c_cut01")
  _sdemo_cut02 = SDemo.create("sm08_c_cut02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
  L0_1 = 0
  L1_2 = false
  L2_3 = Fn_sendEventComSb
  L3_4 = "isBoxBreakAllPart"
  L2_3 = L2_3(L3_4)
  if L2_3 then
    L1_2 = true
  end
  L2_3 = Fn_sendEventComSb
  L3_4 = "isShipWarp01"
  L2_3 = L2_3(L3_4)
  if not L2_3 then
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestAreaLoad02"
    L2_3(L3_4)
    while true do
      L2_3 = Fn_sendEventComSb
      L3_4 = "isShipAnimLoadingNum"
      L2_3 = L2_3(L3_4)
      if L2_3 ~= 2 then
        L2_3 = wait
        L2_3()
      end
    end
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestWarpArea"
    L2_3(L3_4)
    while true do
      L2_3 = Fn_sendEventComSb
      L3_4 = "isShipWarp01"
      L2_3 = L2_3(L3_4)
      if not L2_3 then
        L2_3 = print
        L3_4 = "\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173"
        L2_3(L3_4)
        L2_3 = wait
        L2_3()
      end
    end
    L2_3 = Fn_resetPcPos
    L3_4 = "locator2_pc_start_pos"
    L2_3(L3_4)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestSpawnFi"
    L4_5 = "enmgen2_fi_battle_02"
    L2_3(L3_4, L4_5)
    while true do
      L2_3 = Fn_sendEventComSb
      L3_4 = "isSpawnFiEnd"
      L2_3 = L2_3(L3_4)
      if L2_3 then
        L2_3 = wait
        L2_3()
      end
    end
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestNpcOnLandingShip"
    L4_5 = _puppet_tbl
    L4_5 = L4_5.pre_01
    L5_6 = _puppet_tbl
    L5_6 = L5_6.sol_01
    L6_7 = _puppet_tbl
    L6_7 = L6_7.sol_02
    L2_3(L3_4, L4_5, L5_6, L6_7)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestSpawnEnemy"
    L4_5 = {L5_6, L6_7}
    L5_6 = "enmgen2_phase02_start_landing_01"
    L6_7 = "enmgen2_president_ship_01"
    L2_3(L3_4, L4_5)
    while true do
      L2_3 = Fn_sendEventComSb
      L3_4 = "isSpawnEnemyEnd"
      L2_3 = L2_3(L3_4)
      if L2_3 then
        L2_3 = wait
        L2_3()
      end
    end
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestBoxSpawn"
    L2_3(L3_4)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestLandingShipSettingC04_01"
    L2_3(L3_4)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestLandingShipSettingC04_02"
    L2_3(L3_4)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestLandingShipSettingC04_03"
    L2_3(L3_4)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestLandingShipSettingC04_04"
    L2_3(L3_4)
    L2_3 = Fn_sendEventComSb
    L3_4 = "requestLandingShipSettingCPre"
    L2_3(L3_4)
  end
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestSpawnEnemy"
  L4_5 = "enmgen2_phase02_start_trans_01"
  L2_3(L3_4, L4_5)
  while true do
    L2_3 = Fn_sendEventComSb
    L3_4 = "isSpawnEnemyEnd"
    L2_3 = L2_3(L3_4)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestAnyChangeEnemyMarker"
  L4_5 = true
  L5_6 = "enmgen2_phase02_start_landing_01"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestAnyChangeEnemyMarker"
  L4_5 = true
  L5_6 = "enmgen2_phase02_start_trans_01"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestLandingShipSettingC01"
  L2_3(L3_4)
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_pc_start_pos"
  L2_3(L3_4)
  L2_3 = Fn_missionStart
  L2_3()
  L2_3 = Fn_userCtrlOn
  L2_3()
  L2_3 = waitSeconds
  L3_4 = 1
  L2_3(L3_4)
  L2_3 = Fn_setNpcActive
  L3_4 = "sm08_client"
  L4_5 = false
  L2_3(L3_4, L4_5)
  L2_3 = Fn_setNpcActive
  L3_4 = "sm08_phi_01"
  L4_5 = false
  L2_3(L3_4, L4_5)
  L2_3 = true
  L3_4 = true
  L4_5 = true
  L5_6 = {L6_7, L7_8}
  L6_7 = "sm08_01010"
  L7_8 = "sm08_01011"
  L6_7 = false
  L7_8 = false
  L8_9 = {
    L9_10,
    L10_11,
    L11_12
  }
  L9_10 = "sm08_01012"
  L10_11 = "sm08_01013"
  L11_12 = "sm08_01014"
  L9_10 = false
  L10_11 = false
  L11_12 = false
  L12_13 = invokeTask
  function L13_14()
    while true do
      if Player:getEnergy(Player.kEnergy_Life) <= 0 then
        HUD:miniGaugeSetVisible(false)
      end
      wait()
    end
  end
  L12_13(L13_14)
  L12_13 = invokeTask
  function L13_14()
    while Fn_sendEventComSb("isEnemyCount") < ALL_ENEMY_NUM do
      if Fn_sendEventComSb("isEnemyExist") == 0 then
        L0_1 = L0_1 - 0.1
        if L0_1 < 0 then
          L0_1 = 0
        end
      end
      HUD:miniGaugeSetNum(L0_1 / OCC_MAX)
      wait()
    end
  end
  L12_13(L13_14)
  function L12_13()
    local L0_18, L1_19, L2_20
    L0_18 = Fn_missionViewWait
    L1_19 = "sm08_02000"
    L0_18(L1_19)
    L0_18 = HUD
    L1_19 = L0_18
    L0_18 = L0_18.miniGaugeSetVisible
    L2_20 = true
    L0_18(L1_19, L2_20)
    L0_18 = HUD
    L1_19 = L0_18
    L0_18 = L0_18.miniGaugeSetNum
    L2_20 = 0
    L0_18(L1_19, L2_20)
    L0_18 = HUD
    L1_19 = L0_18
    L0_18 = L0_18.miniGaugeSetTextID
    L2_20 = "sm08_09000"
    L0_18(L1_19, L2_20)
    L0_18 = Fn_pcSensorOn
    L1_19 = "pccubesensor2_away_from_po_a_17"
    L0_18(L1_19)
    L0_18 = Fn_pcSensorOn
    L1_19 = "pccubesensor2_warning_cap_area"
    L0_18(L1_19)
    L0_18 = false
    L1_19 = invokeTask
    function L2_20()
      Fn_captionViewWait("sm08_02001")
      Fn_captionViewWait("sm08_02002")
      L0_18 = true
    end
    L1_19(L2_20)
    repeat
      L1_19 = Fn_sendEventComSb
      L2_20 = "isBoxBreakCount"
      L1_19 = L1_19(L2_20)
      if L1_19 then
        L2_20 = L0_1
        L2_20 = L2_20 + 1
        L0_1 = L2_20
        L2_20 = L1_2
        if not L2_20 then
          L2_20 = invokeTask
          L2_20(function()
            L1_2 = true
            print("\230\156\128\229\136\157\227\129\174\231\174\177\231\160\180\229\163\138")
            repeat
              wait()
            until L0_18
            Fn_captionViewWait("sm08_02012")
            if L0_1 < OCC_MAX then
              Fn_captionView("sm08_02013")
            end
          end)
        end
      end
      L2_20 = countOccPoint
      L2_20 = L2_20(L0_1, OCC_UP, Fn_sendEventComSb("isEnemyExist"))
      L0_1 = L2_20
      L2_20 = HUD
      L2_20 = L2_20.miniGaugeSetNum
      L2_20(L2_20, L0_1 / OCC_MAX)
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isLandEnemyCount")
      if L2_20 >= 10 then
        L2_20 = L2_3
        if L2_20 then
          L2_20 = Fn_sendEventComSb
          L2_20 = L2_20("isEnemyCount")
          if L2_20 < 20 then
            L2_20 = invokeTask
            L2_20(function()
              Fn_naviSet(findGameObject2("Node", "locator2_navi_ship_01"))
              _navi_on = true
              Fn_pcSensorOn("pccubesensor2_ship_on_01")
              Fn_captionViewWait("sm08_02003")
              if L0_1 < OCC_MAX then
                Fn_missionView("sm08_02004")
              end
            end)
            L2_20 = false
            L2_3 = L2_20
          end
        end
      end
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isLandEnemyCount")
      if L2_20 >= 3 then
        L2_20 = L3_4
        if L2_20 then
          while true do
            L2_20 = Fn_isInSightTarget
            L2_20 = L2_20("locator2_sol_spawn_pos_01", 1)
            if L2_20 then
              L2_20 = wait
              L2_20()
            end
          end
          L2_20 = Fn_sendEventComSb
          L2_20("requestSpawnEnemy", "enmgen2_phase02_add_trans_01")
          while true do
            L2_20 = Fn_sendEventComSb
            L2_20 = L2_20("isSpawnEnemyEnd")
            if L2_20 then
              L2_20 = wait
              L2_20()
            end
          end
          L2_20 = Fn_sendEventComSb
          L2_20("requestAnyChangeEnemyMarker", true, "enmgen2_phase02_add_trans_01")
          L2_20 = Fn_sendEventComSb
          L2_20("requestLandingShipSettingC02")
          L2_20 = Fn_captionViewWait
          L2_20("sm08_02005")
          L2_20 = false
          L3_4 = L2_20
        end
      end
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isLandEnemyCount")
      if L2_20 >= 5 then
        L2_20 = L4_5
        if L2_20 then
          L2_20 = Fn_sendEventComSb
          L2_20("requestLandingShipSettingC03")
          L2_20 = Fn_captionViewWait
          L2_20("sm08_02006")
          L2_20 = false
          L4_5 = L2_20
        end
      end
      L2_20 = L0_1
      if L2_20 >= 50 then
        L2_20 = L6_7
        if not L2_20 then
          L2_20 = Fn_captionView
          L2_20(L5_6[1])
          L2_20 = true
          L6_7 = L2_20
        end
      end
      L2_20 = L0_1
      if L2_20 >= 80 then
        L2_20 = L7_8
        if not L2_20 then
          L2_20 = Fn_captionView
          L2_20(L5_6[2])
          L2_20 = true
          L7_8 = L2_20
        end
      end
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isLandEnemyCount")
      if L2_20 >= ALL_ENEMY_NUM * 0.8 then
        L2_20 = L9_10
        if not L2_20 then
          L2_20 = Fn_captionView
          L2_20(L8_9[1])
          L2_20 = true
          L9_10 = L2_20
        end
      end
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isLandEnemyCount")
      if L2_20 >= ALL_ENEMY_NUM * 0.5 then
        L2_20 = L10_11
        if not L2_20 then
          L2_20 = Fn_captionView
          L2_20(L8_9[2])
          L2_20 = true
          L10_11 = L2_20
        end
      end
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isLandEnemyCount")
      if L2_20 >= ALL_ENEMY_NUM * 0.2 then
        L2_20 = L11_12
        if not L2_20 then
          L2_20 = Fn_captionView
          L2_20(L8_9[3])
          L2_20 = true
          L11_12 = L2_20
        end
      end
      L2_20 = L0_1
      if L2_20 >= OCC_MAX then
        L2_20 = Fn_pcSensorOff
        L2_20("pccubesensor2_away_from_po_a_17")
        L2_20 = Fn_pcSensorOff
        L2_20("pccubesensor2_warning_cap_area")
        L2_20 = Fn_pcSensorOff
        L2_20("pccubesensor2_warning_navi_kill_area")
        L2_20 = Fn_naviKill
        L2_20()
        _navi_on = false
        L2_20 = Fn_userCtrlOff
        L2_20()
        L2_20 = Fn_captionViewWait
        L2_20("sm08_02007")
        L2_20 = Fn_blackout
        L2_20()
        L2_20 = HUD
        L2_20 = L2_20.miniGaugeSetVisible
        L2_20(L2_20, false)
        L2_20 = Fn_sendEventComSb
        L2_20("requestEnemyAllKill")
        L2_20 = Fn_sendEventComSb
        L2_20("requestFiKill")
        L2_20 = Fn_sendEventComSb
        L2_20("requestWarpArea")
        while true do
          L2_20 = Fn_sendEventComSb
          L2_20 = L2_20("isShipWarp01")
          if not L2_20 then
            L2_20 = print
            L2_20("\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173")
            L2_20 = wait
            L2_20()
          end
        end
        L2_20 = Fn_resetPcPos
        L2_20("locator2_pc_start_pos")
        L2_20 = Player
        L2_20 = L2_20.getEnergyMax
        L2_20 = L2_20(L2_20, Player.kEnergy_Life)
        Player:setEnergy(Player.kEnergy_Life, L2_20)
        Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
        L0_1 = 0
        L2_3 = true
        L1_2 = false
        L3_4 = true
        L4_5 = true
        L6_7 = false
        L7_8 = false
        L9_10 = false
        L10_11 = false
        L11_12 = false
        Fn_sendEventComSb("requestEnemyCountReset")
        Fn_sendEventComSb("requestEnemyCountResetCALL")
        Fn_sendEventComSb("requestLandingShipSettingResetC")
        Fn_sendEventComSb("requestSpawnFi", "enmgen2_fi_battle_02")
        while Fn_sendEventComSb("isSpawnFiEnd") do
          wait()
        end
        Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_phase02_start_landing_01")
        while Fn_sendEventComSb("isSpawnEnemyEnd") do
          wait()
        end
        Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_phase02_start_trans_01")
        while Fn_sendEventComSb("isSpawnEnemyEnd") do
          wait()
        end
        Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase02_start_landing_01")
        Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase02_start_trans_01")
        Fn_sendEventComSb("requestResetBox")
        Fn_sendEventComSb("requestLandingShipSettingC01")
        Fn_sendEventComSb("requestEnemyNotAshCountChangeC", 10, 0)
        Fn_fadein()
        Fn_sendEventComSb("requestLandingShipSettingC04_01")
        Fn_sendEventComSb("requestLandingShipSettingC04_02")
        Fn_sendEventComSb("requestLandingShipSettingC04_03")
        Fn_sendEventComSb("requestLandingShipSettingC04_04")
        Fn_userCtrlOn()
        return false
      end
      L2_20 = wait
      L2_20()
      L2_20 = Fn_sendEventComSb
      L2_20 = L2_20("isEnemyCount")
    until L2_20 >= ALL_ENEMY_NUM
    L1_19 = Fn_pcSensorOff
    L2_20 = "pccubesensor2_away_from_po_a_17"
    L1_19(L2_20)
    L1_19 = Fn_pcSensorOff
    L2_20 = "pccubesensor2_warning_cap_area"
    L1_19(L2_20)
    L1_19 = Fn_captionViewWait
    L2_20 = "sm08_02009"
    L1_19(L2_20)
    L1_19 = Fn_sendEventComSb
    L2_20 = "requestEnemyCountReset"
    L1_19(L2_20)
    L1_19 = true
    return L1_19
  end
  while true do
    L13_14 = L12_13
    L13_14 = L13_14()
    if L13_14 == false then
    end
  end
  L13_14 = Fn_blackout
  L13_14()
  L13_14 = Fn_sendEventComSb
  L14_15 = "requestChangeEnemyMarker"
  L15_16 = false
  L13_14(L14_15, L15_16)
  L13_14 = Fn_sendEventComSb
  L14_15 = "requestEnemyAllKill"
  L13_14(L14_15)
  L13_14 = Fn_sendEventComSb
  L14_15 = "requestEnemyPresidentKill"
  L13_14(L14_15)
  L13_14 = Fn_sendEventComSb
  L14_15 = "requestFiKill"
  L13_14(L14_15)
  L13_14 = HUD
  L14_15 = L13_14
  L13_14 = L13_14.miniGaugeSetVisible
  L15_16 = false
  L13_14(L14_15, L15_16)
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.setSituation
  L15_16 = Player
  L15_16 = L15_16.kSituation_Normal
  L16_17 = true
  L13_14(L14_15, L15_16, L16_17, 0, true, false)
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.getEnergyMax
  L15_16 = Player
  L15_16 = L15_16.kEnergy_Life
  L13_14 = L13_14(L14_15, L15_16)
  L14_15 = Player
  L15_16 = L14_15
  L14_15 = L14_15.setEnergy
  L16_17 = Player
  L16_17 = L16_17.kEnergy_Life
  L14_15(L15_16, L16_17, L13_14)
  L14_15 = Player
  L15_16 = L14_15
  L14_15 = L14_15.setEnergy
  L16_17 = Player
  L16_17 = L16_17.kEnergy_Gravity
  L14_15(L15_16, L16_17, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  L14_15 = Fn_userCtrlOff
  L14_15()
  L14_15 = Fn_sendEventComSb
  L15_16 = "requestResetBox"
  L14_15(L15_16)
  L14_15 = Fn_resetPcPos
  L15_16 = "locator2_pc_start_pos"
  L14_15(L15_16)
  L14_15 = Fn_warpNpc
  L15_16 = "pre_01"
  L16_17 = "locator2_president_reset"
  L14_15(L15_16, L16_17)
  L14_15 = Fn_warpNpc
  L15_16 = "sol_01"
  L16_17 = "locator2_soldier_reset_01"
  L14_15(L15_16, L16_17)
  L14_15 = Fn_warpNpc
  L15_16 = "sol_02"
  L16_17 = "locator2_soldier_reset_02"
  L14_15(L15_16, L16_17)
  L14_15 = Fn_sendEventComSb
  L15_16 = "requestNpcOnLandingShip"
  L16_17 = _puppet_tbl
  L16_17 = L16_17.pre_01
  L14_15(L15_16, L16_17, _puppet_tbl.sol_01, _puppet_tbl.sol_02)
  L14_15 = {
    L15_16,
    L16_17,
    "enmgen2_phase03_02_01",
    "enmgen2_phase03_03_01",
    "enmgen2_phase03_03_02",
    "enmgen2_phase03_04_01",
    "enmgen2_phase03_05_01"
  }
  L15_16 = "enmgen2_phase03_01_01"
  L16_17 = "enmgen2_phase03_01_02"
  L15_16 = Fn_sendEventComSb
  L16_17 = "requestSpawnEnemy"
  L15_16(L16_17, L14_15)
  while true do
    L15_16 = Fn_sendEventComSb
    L16_17 = "isSpawnEnemyEnd"
    L15_16 = L15_16(L16_17)
    if L15_16 then
      L15_16 = wait
      L15_16()
    end
  end
  L15_16 = Fn_warpNpc
  L16_17 = "sm08_phi_01"
  L15_16(L16_17, "locator2_phi_sdemo_reset_pos")
  L15_16 = Fn_setNpcActive
  L16_17 = "sm08_phi_01"
  L15_16(L16_17, true)
  L15_16 = _sdemo_cut01
  L16_17 = L15_16
  L15_16 = L15_16.set
  L15_16(L16_17, "locator2_sdemo_cam_c_01", "locator2_sdemo_aim_c_01")
  L15_16 = _sdemo_cut01
  L16_17 = L15_16
  L15_16 = L15_16.play
  L15_16(L16_17)
  L15_16 = Fn_fadein
  L15_16()
  L15_16 = waitSeconds
  L16_17 = 1
  L15_16(L16_17)
  L15_16 = Fn_kaiwaDemoView
  L16_17 = "sm08_00900k"
  L15_16(L16_17)
  L15_16 = waitSeconds
  L16_17 = 1
  L15_16(L16_17)
  L15_16 = findGameObject2
  L16_17 = "Node"
  L15_16 = L15_16(L16_17, "locator2_sdemo_view_pos")
  L16_17 = Fn_playerTurn
  L16_17(L15_16)
  L16_17 = {}
  L16_17.degree_h = 90
  L16_17.degree_v = 90
  L16_17.in_length = 100
  L16_17.out_length = 100
  L16_17.target = findGameObject2("Node", "locator2_sdemo_view_pos")
  L16_17.valid = true
  L16_17.watchTarget = true
  Fn_findNpc("sm08_phi_01"):setSightParam(L16_17)
  waitSeconds(1)
  Fn_sendEventComSb("requestLandingShipMove", 1)
  Fn_sendEventComSb("requestLandingShipMove", 2)
  Fn_sendEventComSb("requestLandingShipSettingD01")
  Fn_sendEventComSb("requestLandingShipSettingD02")
  Fn_sendEventComSb("requestLandingShipSettingD03")
  Fn_sendEventComSb("requestLandingShipSettingD04")
  Fn_sendEventComSb("requestLandingShipSettingD05")
  _sdemo_cut01:stop()
  _sdemo_cut02:set("locator2_sdemo_cam_c_02", "locator2_sdemo_aim_c_02")
  _sdemo_cut02:play()
  waitSeconds(2)
  Fn_kaiwaDemoView("sm08_01000k")
  Fn_playerTurnEnd()
  Fn_findNpc("sm08_phi_01"):resetSightParam()
  Fn_setNpcActive("sm08_phi_01", false)
  Player:setSituation(Player.kSituation_InCombat, true, 3, true, false)
  Fn_sendEventComSb("requestSpawnFi", "enmgen2_fi_battle_02")
  while Fn_sendEventComSb("isSpawnFiEnd") do
    wait()
  end
  _sdemo_cut02:stop()
  _sdemo_cut01:set("locator2_sdemo_cam_c_01", "locator2_sdemo_aim_c_01")
  _sdemo_cut01:play()
  waitSeconds(0.5)
  _sdemo_cut01:stop(2)
  Fn_sendEventComSb("requestMoveArea")
  while not Fn_sendEventComSb("isAreaMove") do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_21, L1_22
end
function pccubesensor2_ship_on_01_OnEnter()
  Fn_naviKill()
  _navi_on = false
  Fn_pcSensorOff("pccubesensor2_ship_on_01")
end
function pccubesensor2_away_from_po_a_17_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("sm08_02010")
  end)
end
function pccubesensor2_warning_cap_area_OnLeave()
  Player:setAction(Player.kAction_Float)
  Fn_captionView("sm08_01019")
  if not _navi_on then
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_warning_navi_kill_area"))
    _navi_on = true
    Fn_pcSensorOn("pccubesensor2_warning_navi_kill_area")
  end
end
function pccubesensor2_warning_navi_kill_area_OnEnter()
  Fn_naviKill()
  _navi_on = false
  Fn_pcSensorOff("pccubesensor2_warning_navi_kill_area")
end
