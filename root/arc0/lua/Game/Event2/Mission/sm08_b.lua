dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm08_common.lua")
OCC_UP = 0.021
OCC_UP_LOW = 0.006
ALL_ENEMY_NUM = 45
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
  Fn_pcSensorOff("pccubesensor2_away_from_po_a_17")
  Fn_pcSensorOff("pccubesensor2_warning_cap_area")
  Fn_pcSensorOff("pccubesensor2_warning_navi_kill_area")
  _sdemo_cut01 = SDemo.create("sm08_b_cut01")
  _sdemo_cut02 = SDemo.create("sm08_b_cut02")
  _sdemo_cut03 = SDemo.create("sm08_b_cut03")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
  L0_1 = 0
  L1_2 = false
  L2_3 = false
  L3_4 = false
  L4_5 = false
  L5_6 = false
  L6_7 = false
  L7_8 = false
  L8_9 = false
  L9_10 = false
  L10_11 = Fn_sendEventComSb
  L11_12 = "isAreaMove"
  L10_11 = L10_11(L11_12)
  if not L10_11 then
    L10_11 = Fn_userCtrlOff
    L10_11()
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestAreaLoad01"
    L10_11(L11_12)
    while true do
      L10_11 = Fn_sendEventComSb
      L11_12 = "isShipAnimLoadingNum"
      L10_11 = L10_11(L11_12)
      if L10_11 ~= 1 then
        L10_11 = wait
        L10_11()
      end
    end
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestWarpArea"
    L10_11(L11_12)
    while true do
      L10_11 = Fn_sendEventComSb
      L11_12 = "isShipWarp01"
      L10_11 = L10_11(L11_12)
      if not L10_11 then
        L10_11 = print
        L11_12 = "\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173"
        L10_11(L11_12)
        L10_11 = wait
        L10_11()
      end
    end
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestBoxSpawn"
    L10_11(L11_12)
    L10_11 = Fn_resetPcPos
    L11_12 = "locator2_pc_start_pos"
    L10_11(L11_12)
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestSpawnFi"
    L12_13 = "enmgen2_fi_battle_01"
    L10_11(L11_12, L12_13)
    while true do
      L10_11 = Fn_sendEventComSb
      L11_12 = "isSpawnFiEnd"
      L10_11 = L10_11(L11_12)
      if L10_11 then
        L10_11 = wait
        L10_11()
      end
    end
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestNpcOnLandingShip"
    L12_13 = _puppet_tbl
    L12_13 = L12_13.pre_01
    L13_14 = _puppet_tbl
    L13_14 = L13_14.sol_01
    L14_15 = _puppet_tbl
    L14_15 = L14_15.sol_02
    L10_11(L11_12, L12_13, L13_14, L14_15)
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestSpawnEnemy"
    L12_13 = {L13_14, L14_15}
    L13_14 = "enmgen2_phase01_start_f_01"
    L14_15 = "enmgen2_phase01_start_c_01"
    L10_11(L11_12, L12_13)
    while true do
      L10_11 = Fn_sendEventComSb
      L11_12 = "isSpawnEnemyEnd"
      L10_11 = L10_11(L11_12)
      if L10_11 then
        L10_11 = wait
        L10_11()
      end
    end
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestMoveArea"
    L10_11(L11_12)
    L10_11 = Fn_sendEventComSb
    L11_12 = "requestLandingShipSettingB01"
    L10_11(L11_12)
  end
  L10_11 = Fn_pcSensorOn
  L11_12 = "pccubesensor2_away_from_po_a_17"
  L10_11(L11_12)
  L10_11 = Fn_pcSensorOn
  L11_12 = "pccubesensor2_warning_cap_area"
  L10_11(L11_12)
  L10_11 = Fn_sendEventComSb
  L11_12 = "requestAnyChangeEnemyMarker"
  L12_13 = true
  L13_14 = "enmgen2_phase01_start_f_01"
  L10_11(L11_12, L12_13, L13_14)
  L10_11 = Fn_sendEventComSb
  L11_12 = "requestAnyChangeEnemyMarker"
  L12_13 = true
  L13_14 = "enmgen2_phase01_start_c_01"
  L10_11(L11_12, L12_13, L13_14)
  L10_11 = Fn_setCatWarpCheckPoint
  L11_12 = "locator2_pc_start_pos"
  L10_11(L11_12)
  L10_11 = Fn_missionStart
  L10_11()
  L10_11 = Fn_userCtrlOn
  L10_11()
  L10_11 = Fn_sendEventComSb
  L11_12 = "requestFiAIChange"
  L12_13 = 1
  L13_14 = false
  L10_11(L11_12, L12_13, L13_14)
  L10_11 = {L11_12, L12_13}
  L11_12 = "sm08_01010"
  L12_13 = "sm08_01011"
  L11_12 = false
  L12_13 = false
  L13_14 = {
    L14_15,
    L15_16,
    L16_17
  }
  L14_15 = "sm08_01012"
  L15_16 = "sm08_01013"
  L16_17 = "sm08_01014"
  L14_15 = false
  L15_16 = false
  L16_17 = false
  L17_18 = HUD
  L18_19 = L17_18
  L17_18 = L17_18.miniGaugeSetVisible
  L19_20 = true
  L17_18(L18_19, L19_20)
  L17_18 = HUD
  L18_19 = L17_18
  L17_18 = L17_18.miniGaugeSetNum
  L19_20 = 0
  L17_18(L18_19, L19_20)
  L17_18 = HUD
  L18_19 = L17_18
  L17_18 = L17_18.miniGaugeSetTextID
  L19_20 = "sm08_09000"
  L17_18(L18_19, L19_20)
  L17_18 = wait
  L18_19 = 60
  L17_18(L18_19)
  L17_18 = HUD
  L18_19 = L17_18
  L17_18 = L17_18.info
  L19_20 = "sm08_info_01"
  L20_21 = false
  L17_18(L18_19, L19_20, L20_21)
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestEnemyIdling"
  L19_20 = false
  L17_18(L18_19, L19_20)
  while true do
    L17_18 = Fn_sendEventComSb
    L18_19 = "isLandingShipSettingB"
    L19_20 = 1
    L17_18 = L17_18(L18_19, L19_20)
    if not L17_18 then
      L17_18 = wait
      L17_18()
    end
  end
  L17_18 = invokeTask
  function L18_19()
    while true do
      if Player:getEnergy(Player.kEnergy_Life) <= 0 then
        HUD:miniGaugeSetVisible(false)
      end
      wait()
    end
  end
  L17_18(L18_19)
  L17_18 = invokeTask
  function L18_19()
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
  L17_18(L18_19)
  function L17_18()
    local L0_22, L1_23, L2_24
    L0_22 = Fn_missionViewWait
    L1_23 = "sm08_01000"
    L0_22(L1_23)
    L0_22 = false
    L1_23 = invokeTask
    function L2_24()
      Fn_captionViewWait("sm08_01001")
      Fn_captionViewWait("sm08_01002")
      L0_22 = true
    end
    L1_23(L2_24)
    repeat
      L1_23 = L2_3
      if not L1_23 then
        L1_23 = countOccPoint
        L2_24 = L0_1
        L1_23 = L1_23(L2_24, OCC_UP, Fn_sendEventComSb("isEnemyExist"))
        L0_1 = L1_23
      else
        L1_23 = countOccPoint
        L2_24 = L0_1
        L1_23 = L1_23(L2_24, OCC_UP_LOW, Fn_sendEventComSb("isEnemyExist"))
        L0_1 = L1_23
      end
      L1_23 = Fn_sendEventComSb
      L2_24 = "isBoxBreakCount"
      L1_23 = L1_23(L2_24)
      if L1_23 then
        L2_24 = L9_10
        if not L2_24 then
          L2_24 = invokeTask
          L2_24(function()
            L9_10 = true
            print("\230\156\128\229\136\157\227\129\174\231\174\177\231\160\180\229\163\138")
            repeat
              wait()
            until L0_22
            Fn_captionViewWait("sm08_01015")
            if L0_1 < OCC_MAX then
              Fn_captionView("sm08_01016")
            end
          end)
        end
      end
      L2_24 = HUD
      L2_24 = L2_24.miniGaugeSetNum
      L2_24(L2_24, L0_1 / OCC_MAX)
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isEnemyCount")
      if L2_24 >= 12 then
        L2_24 = L1_2
        if not L2_24 then
          L2_24 = L6_7
          if L2_24 then
            while true do
              L2_24 = Fn_sendEventComSb
              L2_24 = L2_24("isLandingShipOpenB", 4)
              if L2_24 ~= 1 then
                L2_24 = wait
                L2_24()
              end
            end
            L2_24 = Fn_sendEventComSb
            L2_24("requestEnemySpawnBAdd", 4, 2)
            L2_24 = Fn_sendEventComSb
            L2_24("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_add_c_01_01")
            while true do
              L2_24 = Fn_sendEventComSb
              L2_24 = L2_24("isLandingShipOpenB", 4)
              if L2_24 ~= 2 then
                L2_24 = wait
                L2_24()
              end
            end
            L2_24 = waitSeconds
            L2_24(2)
            L2_24 = Fn_lookAtObject
            L2_24 = L2_24("locator2_view_pos_01", 0.5)
            while not Fn_isInSightTarget("locator2_view_pos_01", 0.5) do
              wait()
            end
            if L2_24 ~= nil then
              L2_24:abort()
            end
            invokeTask(function()
              Fn_captionViewWait("sm08_01017")
              if L0_1 < OCC_MAX then
                Fn_captionViewWait("sm08_01018")
              end
            end)
            while not Fn_sendEventComSb("isLandingShipSettingB", 3) do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 4)
            invokeTask(function()
              while Fn_isInSightTarget("locator2_sol_spawn_pos_f_01", 1) do
                wait()
              end
              Fn_sendEventComSb("requestSpawnEnemy", {
                "enmgen2_phase01_add_f_01"
              })
              while Fn_sendEventComSb("isSpawnEnemyEnd") do
                wait()
              end
              Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_add_f_01")
              Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 2)
            end)
            L1_2 = true
          end
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isEnemyCount")
      if L2_24 >= 21 then
        L2_24 = L2_3
        if not L2_24 then
          L2_24 = L7_8
          if L2_24 then
            while true do
              L2_24 = Fn_sendEventComSb
              L2_24 = L2_24("isLandingShipOpenB", 5)
              if L2_24 ~= 1 then
                L2_24 = wait
                L2_24()
              end
            end
            L2_24 = Fn_sendEventComSb
            L2_24("requestEnemySpawnBAdd", 5, 2)
            L2_24 = Fn_sendEventComSb
            L2_24("requestEnemySpawnBAdd", 6, 2)
            L2_24 = Fn_sendEventComSb
            L2_24("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_add_f_02")
            L2_24 = Fn_sendEventComSb
            L2_24("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_add_c_02_01")
            while true do
              L2_24 = Fn_sendEventComSb
              L2_24 = L2_24("isLandingShipOpenB", 5)
              if L2_24 ~= 2 then
                L2_24 = wait
                L2_24()
              end
            end
            L2_24 = waitSeconds
            L2_24(2)
            L2_24 = Fn_lookAtObject
            L2_24 = L2_24("locator2_view_pos_02", 0.5)
            while not Fn_isInSightTarget("locator2_view_pos_02", 0.5) do
              wait()
            end
            if L2_24 ~= nil then
              L2_24:abort()
            end
            invokeTask(function()
              Fn_captionViewWait("sm08_01005")
              if L0_1 < OCC_MAX then
                Fn_captionViewWait("sm08_01006")
              end
            end)
            while not Fn_sendEventComSb("isLandingShipSettingB", 5) do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 17)
            invokeTask(function()
              while Fn_isInSightTarget("locator2_sol_spawn_pos_c_03", 1) do
                wait()
              end
              Fn_sendEventComSb("requestSpawnEnemy", {
                "enmgen2_phase01_add_c_02_02"
              })
              while Fn_sendEventComSb("isSpawnEnemyEnd") do
                wait()
              end
              Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_add_c_02_02")
              Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 2)
            end)
            L2_3 = true
          end
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isEnemyCount")
      if L2_24 >= 6 then
        L2_24 = L3_4
        if not L2_24 then
          L2_24 = Fn_sendEventComSb
          L2_24("requestEnemySpawnBAdd", 2, 2)
          L2_24 = invokeTask
          L2_24(function()
            while not Fn_sendEventComSb("isLandingShipSettingB", 2) do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 4)
          end)
          L2_24 = true
          L3_4 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isEnemyCount")
      if L2_24 >= 15 then
        L2_24 = L4_5
        if not L2_24 then
          L2_24 = Fn_sendEventComSb
          L2_24("requestEnemySpawnBAdd", 4, 4)
          L2_24 = invokeTask
          L2_24(function()
            while not Fn_sendEventComSb("isLandingShipSettingB", 4) do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 3)
          end)
          L2_24 = true
          L4_5 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isEnemyCount")
      if L2_24 >= 30 then
        L2_24 = L5_6
        if not L2_24 then
          L2_24 = Fn_sendEventComSb
          L2_24("requestEnemySpawnBAdd", 6, 4)
          L2_24 = invokeTask
          L2_24(function()
            while not Fn_sendEventComSb("isLandingShipSettingB", 6) do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 5)
          end)
          L2_24 = true
          L5_6 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isLandingShipSettingB", 2)
      if L2_24 then
        L2_24 = L6_7
        if not L2_24 then
          while true do
            L2_24 = Fn_isInSightTarget
            L2_24 = L2_24("locator2_sol_spawn_pos_c_01", 1)
            if L2_24 then
              L2_24 = wait
              L2_24()
            end
          end
          L2_24 = Fn_sendEventComSb
          L2_24("requestSpawnEnemy", {
            "enmgen2_phase01_add_c_01_01"
          })
          while true do
            L2_24 = Fn_sendEventComSb
            L2_24 = L2_24("isSpawnEnemyEnd")
            if L2_24 then
              L2_24 = wait
              L2_24()
            end
          end
          L2_24 = Fn_sendEventComSb
          L2_24("requestLandingShipSettingB02")
          L2_24 = true
          L6_7 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isLandingShipSettingB", 4)
      if L2_24 then
        L2_24 = L7_8
        if not L2_24 then
          while true do
            L2_24 = Fn_isInSightTarget
            L2_24 = L2_24("locator2_sol_spawn_pos_f_02", 1)
            if not L2_24 then
              L2_24 = Fn_isInSightTarget
              L2_24 = L2_24("locator2_sol_spawn_pos_c_02", 1)
            end
            if L2_24 then
              L2_24 = wait
              L2_24()
            end
          end
          L2_24 = Fn_sendEventComSb
          L2_24("requestSpawnEnemy", {
            "enmgen2_phase01_add_f_02",
            "enmgen2_phase01_add_c_02_01"
          })
          while true do
            L2_24 = Fn_sendEventComSb
            L2_24 = L2_24("isSpawnEnemyEnd")
            if L2_24 then
              L2_24 = wait
              L2_24()
            end
          end
          L2_24 = Fn_sendEventComSb
          L2_24("requestLandingShipSettingB03")
          L2_24 = true
          L7_8 = L2_24
        end
      end
      L2_24 = L0_1
      if L2_24 >= 50 then
        L2_24 = L11_12
        if not L2_24 then
          L2_24 = Fn_captionView
          L2_24(L10_11[1])
          L2_24 = true
          L11_12 = L2_24
        end
      end
      L2_24 = L0_1
      if L2_24 >= 80 then
        L2_24 = L12_13
        if not L2_24 then
          L2_24 = Fn_captionView
          L2_24(L10_11[2])
          L2_24 = true
          L12_13 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isLandEnemyCount")
      if L2_24 >= ALL_ENEMY_NUM * 0.8 then
        L2_24 = L14_15
        if not L2_24 then
          L2_24 = Fn_captionView
          L2_24(L13_14[1])
          L2_24 = true
          L14_15 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isLandEnemyCount")
      if L2_24 >= ALL_ENEMY_NUM * 0.5 then
        L2_24 = L15_16
        if not L2_24 then
          L2_24 = Fn_captionView
          L2_24(L13_14[2])
          L2_24 = true
          L15_16 = L2_24
        end
      end
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isLandEnemyCount")
      if L2_24 >= ALL_ENEMY_NUM * 0.2 then
        L2_24 = L16_17
        if not L2_24 then
          L2_24 = Fn_captionView
          L2_24(L13_14[3])
          L2_24 = true
          L16_17 = L2_24
        end
      end
      L2_24 = L0_1
      if L2_24 >= OCC_MAX then
        L2_24 = Fn_pcSensorOff
        L2_24("pccubesensor2_away_from_po_a_17")
        L2_24 = Fn_pcSensorOff
        L2_24("pccubesensor2_warning_cap_area")
        L2_24 = Fn_pcSensorOff
        L2_24("pccubesensor2_warning_navi_kill_area")
        L2_24 = Fn_naviKill
        L2_24()
        _navi_on = false
        L2_24 = Fn_userCtrlOff
        L2_24()
        L2_24 = Fn_captionViewWait
        L2_24("sm08_01007")
        L2_24 = Fn_blackout
        L2_24()
        L2_24 = Fn_sendEventComSb
        L2_24("requestEnemyAllKill")
        L2_24 = Fn_sendEventComSb
        L2_24("requestFiKill")
        L2_24 = Fn_sendEventComSb
        L2_24("requestWarpArea")
        while true do
          L2_24 = Fn_sendEventComSb
          L2_24 = L2_24("isShipWarp01")
          if not L2_24 then
            L2_24 = print
            L2_24("\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173")
            L2_24 = wait
            L2_24()
          end
        end
        L2_24 = Fn_resetPcPos
        L2_24("locator2_pc_start_pos")
        L2_24 = Fn_warpNpc
        L2_24("pre_01", "locator2_president_02")
        L2_24 = Fn_warpNpc
        L2_24("sol_01", "locator2_soldier_01_02")
        L2_24 = Fn_warpNpc
        L2_24("sol_02", "locator2_soldier_02_02")
        L2_24 = Player
        L2_24 = L2_24.getEnergyMax
        L2_24 = L2_24(L2_24, Player.kEnergy_Life)
        Player:setEnergy(Player.kEnergy_Life, L2_24)
        Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
        L0_1 = 0
        HUD:miniGaugeSetNum(L0_1)
        Fn_sendEventComSb("requestEnemyCountReset")
        Fn_sendEventComSb("requestLandingShipSettingResetB")
        Fn_sendEventComSb("requestSpawnFi", "enmgen2_fi_battle_01")
        while Fn_sendEventComSb("isSpawnFiEnd") do
          wait()
        end
        Fn_sendEventComSb("requestSpawnEnemy", {
          "enmgen2_phase01_start_f_01",
          "enmgen2_phase01_start_c_01"
        })
        while Fn_sendEventComSb("isSpawnEnemyEnd") do
          wait()
        end
        Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_start_f_01")
        Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase01_start_c_01")
        Fn_sendEventComSb("requestResetBox")
        Fn_sendEventComSb("requestMoveArea")
        Fn_sendEventComSb("requestEnemyNotAshCountChangeB", 8, 1)
        L1_2 = false
        L2_3 = false
        L6_7 = false
        L7_8 = false
        L8_9 = false
        L3_4 = false
        L4_5 = false
        L5_6 = false
        L11_12 = false
        L12_13 = false
        L14_15 = false
        L15_16 = false
        L16_17 = false
        Fn_fadein()
        Fn_sendEventComSb("requestLandingShipSettingB01")
        Fn_userCtrlOn()
        Fn_pcSensorOn("pccubesensor2_away_from_po_a_17")
        Fn_pcSensorOn("pccubesensor2_warning_cap_area")
        while Fn_sendEventComSb("isLandingShipSettingB", 1) == false do
          wait()
        end
        return false
      end
      L2_24 = wait
      L2_24()
      L2_24 = Fn_sendEventComSb
      L2_24 = L2_24("isEnemyCount")
    until L2_24 >= ALL_ENEMY_NUM
    L1_23 = Fn_pcSensorOff
    L2_24 = "pccubesensor2_away_from_po_a_17"
    L1_23(L2_24)
    L1_23 = Fn_pcSensorOff
    L2_24 = "pccubesensor2_warning_cap_area"
    L1_23(L2_24)
    L1_23 = Fn_captionViewWait
    L2_24 = "sm08_01008"
    L1_23(L2_24)
    L1_23 = Fn_userCtrlAllOff
    L1_23()
    L1_23 = Fn_sendEventComSb
    L2_24 = "requestEnemyCountReset"
    L1_23(L2_24)
    L1_23 = true
    return L1_23
  end
  while true do
    L18_19 = L17_18
    L18_19 = L18_19()
    if L18_19 == false then
    end
  end
  L18_19 = HUD
  L19_20 = L18_19
  L18_19 = L18_19.miniGaugeSetVisible
  L20_21 = false
  L18_19(L19_20, L20_21)
  L18_19 = Fn_kaiwaDemoView
  L19_20 = "sm08_00500k"
  L18_19(L19_20)
  L18_19 = Fn_sendEventComSb
  L19_20 = "requestEnemyExitB"
  L18_19(L19_20)
  L18_19 = waitSeconds
  L19_20 = 1
  L18_19(L19_20)
  L18_19 = Fn_lookAtObject
  L19_20 = "locator2_last_view_pos"
  L20_21 = 0.5
  L18_19 = L18_19(L19_20, L20_21)
  while true do
    L19_20 = Fn_isInSightTarget
    L20_21 = "locator2_last_view_pos"
    L19_20 = L19_20(L20_21, 0.5)
    if not L19_20 then
      L19_20 = wait
      L19_20()
    end
  end
  if L18_19 ~= nil then
    L20_21 = L18_19
    L19_20 = L18_19.abort
    L19_20(L20_21)
  end
  L19_20 = waitSeconds
  L20_21 = 2
  L19_20(L20_21)
  L19_20 = Fn_blackout
  L19_20()
  L19_20 = Fn_sendEventComSb
  L20_21 = "requestEnemyAllKill"
  L19_20(L20_21)
  L19_20 = Fn_setNpcActive
  L20_21 = "pre_01"
  L19_20(L20_21, false)
  L19_20 = Fn_sendEventComSb
  L20_21 = "requestFiKill"
  L19_20(L20_21)
  L19_20 = Player
  L20_21 = L19_20
  L19_20 = L19_20.getEnergyMax
  L19_20 = L19_20(L20_21, Player.kEnergy_Life)
  L20_21 = Player
  L20_21 = L20_21.setEnergy
  L20_21(L20_21, Player.kEnergy_Life, L19_20)
  L20_21 = Player
  L20_21 = L20_21.setEnergy
  L20_21(L20_21, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  L20_21 = Fn_sendEventComSb
  L20_21("requestAreaLoad02")
  while true do
    L20_21 = Fn_sendEventComSb
    L20_21 = L20_21("isShipAnimLoadingNum")
    if L20_21 ~= 2 then
      L20_21 = wait
      L20_21()
    end
  end
  L20_21 = Fn_sendEventComSb
  L20_21("requestWarpArea")
  while true do
    L20_21 = Fn_sendEventComSb
    L20_21 = L20_21("isShipWarp01")
    if not L20_21 then
      L20_21 = print
      L20_21("\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173")
      L20_21 = wait
      L20_21()
    end
  end
  L20_21 = Fn_sendEventComSb
  L20_21("requestResetBox")
  L20_21 = Fn_resetPcPos
  L20_21("locator2_pc_reset_pos_b")
  L20_21 = Fn_warpNpc
  L20_21("pre_01", "locator2_president_reset")
  L20_21 = Fn_warpNpc
  L20_21("sol_01", "locator2_soldier_reset_01")
  L20_21 = Fn_warpNpc
  L20_21("sol_02", "locator2_soldier_reset_02")
  L20_21 = Player
  L20_21 = L20_21.setSituation
  L20_21(L20_21, Player.kSituation_Normal, true, 0, true, false)
  L20_21 = Fn_warpNpc
  L20_21("sm08_phi_01", "locator2_phi_reset_pos_b")
  L20_21 = Fn_setNpcActive
  L20_21("sm08_phi_01", true)
  L20_21 = _sdemo_cut01
  L20_21 = L20_21.set
  L20_21(L20_21, "locator2_sdemo_cam_b_01", "locator2_sdemo_aim_b_01")
  L20_21 = _sdemo_cut01
  L20_21 = L20_21.play
  L20_21(L20_21)
  L20_21 = Fn_fadein
  L20_21()
  L20_21 = Fn_sendEventComSb
  L20_21("requestNpcOnLandingShip", _puppet_tbl.pre_01, _puppet_tbl.sol_01, _puppet_tbl.sol_02)
  L20_21 = Fn_sendEventComSb
  L20_21("requestSpawnEnemy", {
    "enmgen2_phase02_start_landing_01",
    "enmgen2_president_ship_01"
  })
  while true do
    L20_21 = Fn_sendEventComSb
    L20_21 = L20_21("isSpawnEnemyEnd")
    if L20_21 then
      L20_21 = wait
      L20_21()
    end
  end
  L20_21 = Fn_sendEventComSb
  L20_21("requestLandingShipSettingCPre")
  L20_21 = waitSeconds
  L20_21(2)
  L20_21 = Fn_kaiwaDemoView
  L20_21("sm08_00600k")
  L20_21 = findGameObject2
  L20_21 = L20_21("Node", "locator2_sdemo_view_pos_b")
  Fn_playerTurn(L20_21)
  Fn_turnNpc("sm08_phi_01", "locator2_sdemo_view_pos_b")
  waitSeconds(0.1)
  _sdemo_cut01:stop()
  _sdemo_cut02:set("locator2_sdemo_cam_b_02", "locator2_sdemo_aim_b_02")
  _sdemo_cut02:play()
  Fn_sendEventComSb("requestLandingShipSettingC04_02")
  Fn_playerTurnEnd()
  Fn_setNpcActive("sm08_phi_01", false)
  Fn_sendEventComSb("requestSpawnFi", "enmgen2_fi_battle_02")
  while Fn_sendEventComSb("isSpawnFiEnd") do
    wait()
  end
  Fn_sendEventComSb("requestEnemyIdling", true)
  waitSeconds(2)
  Fn_sendEventComSb("requestLandingShipSettingC04_01")
  waitSeconds(1)
  Fn_sendEventComSb("requestLandingShipSettingC04_03")
  waitSeconds(1)
  Fn_sendEventComSb("requestLandingShipSettingC04_04")
  _sdemo_cut02:stop()
  _sdemo_cut03:set("locator2_sdemo_cam_b_03", "locator2_sdemo_aim_b_03")
  _sdemo_cut03:play()
  waitSeconds(3)
  Fn_kaiwaDemoView("sm08_00700k")
  _sdemo_cut03:stop(2)
  Player:setSituation(Player.kSituation_InCombat, true, 3, true, false)
  Fn_sendEventComSb("requestEnemyIdling", false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_25, L1_26
end
function pccubesensor2_away_from_po_a_17_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("sm08_01009")
  end)
end
function pccubesensor2_warning_cap_area_OnLeave()
  Player:setAction(Player.kAction_Float)
  Fn_captionView("sm08_01019")
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_warning_navi_kill_area"))
  _navi_on = true
  Fn_pcSensorOn("pccubesensor2_warning_navi_kill_area")
end
function pccubesensor2_warning_navi_kill_area_OnEnter()
  Fn_naviKill()
  _navi_on = false
  Fn_pcSensorOff("pccubesensor2_warning_navi_kill_area")
end
