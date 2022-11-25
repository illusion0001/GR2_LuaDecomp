dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm08_common.lua")
OCC_UP = 0.005
RASH_COUNT_MAX = 5500
ALL_ENEMY_NUM = 73
_navi_on = false
_puppet_tbl = {}
enmgen2_sdemo_d_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_landingship_sdemo_01",
      name = "soldier01",
      target_vehicle = "sdemo_landingship01"
    },
    {
      type = "landingship",
      locator = "locator_landingship_sdemo_01",
      name = "sdemo_landingship01"
    }
  }
}
enmgen2_sdemo_d_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_landingship_sdemo_02",
      name = "soldier02",
      target_vehicle = "sdemo_landingship02"
    },
    {
      type = "landingship",
      locator = "locator_landingship_sdemo_02",
      name = "sdemo_landingship02"
    }
  }
}
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
    },
    {
      name = "man_01",
      type = "man45",
      node = "locator2_sm08_man",
      active = false,
      not_mob = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_away_from_po_a_17")
  Fn_pcSensorOff("pccubesensor2_warning_cap_area")
  Fn_pcSensorOff("pccubesensor2_warning_navi_kill_area")
  _sdemo_cut01 = SDemo.create("sm08_d_cut01")
  _sdemo_cut02 = SDemo.create("sm08_d_cut02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L34_35, L35_36, L36_37, L37_38, L38_39, L39_40, L40_41, L41_42, L42_43, L43_44
  L0_1 = RASH_COUNT_MAX
  L1_2 = 0
  L2_3 = true
  L3_4 = true
  L4_5 = true
  L5_6 = true
  L6_7 = {}
  L7_8 = false
  L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L17_18 = {
    L18_19,
    L19_20,
    L20_21,
    L21_22,
    L22_23,
    L23_24,
    L24_25
  }
  L18_19 = "enmgen2_phase03_01_01"
  L19_20 = "enmgen2_phase03_01_02"
  L20_21 = "enmgen2_phase03_02_01"
  L21_22 = "enmgen2_phase03_03_01"
  L22_23 = "enmgen2_phase03_03_02"
  L23_24 = "enmgen2_phase03_04_01"
  L24_25 = "enmgen2_phase03_05_01"
  L18_19 = {}
  L18_19.label01 = "kit01_stay_heat_00"
  L19_20 = Fn_loadPlayerMotion
  L20_21 = L18_19
  L19_20(L20_21)
  L19_20 = Fn_sendEventComSb
  L20_21 = "isBoxBreakAllPart"
  L19_20 = L19_20(L20_21)
  if L19_20 then
    L7_8 = true
  end
  L19_20 = Fn_userCtrlOff
  L19_20()
  L19_20 = Fn_sendEventComSb
  L20_21 = "isAreaMove"
  L19_20 = L19_20(L20_21)
  if not L19_20 then
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestAreaLoad02"
    L19_20(L20_21)
    while true do
      L19_20 = Fn_sendEventComSb
      L20_21 = "isShipAnimLoadingNum"
      L19_20 = L19_20(L20_21)
      if L19_20 ~= 2 then
        L19_20 = wait
        L19_20()
      end
    end
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestWarpArea"
    L19_20(L20_21)
    while true do
      L19_20 = Fn_sendEventComSb
      L20_21 = "isShipWarp01"
      L19_20 = L19_20(L20_21)
      if not L19_20 then
        L19_20 = print
        L20_21 = "\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173"
        L19_20(L20_21)
        L19_20 = wait
        L19_20()
      end
    end
    L19_20 = Fn_resetPcPos
    L20_21 = "locator2_pc_start_pos"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestBoxSpawn"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestNpcOnLandingShip"
    L21_22 = _puppet_tbl
    L21_22 = L21_22.pre_01
    L22_23 = _puppet_tbl
    L22_23 = L22_23.sol_01
    L23_24 = _puppet_tbl
    L23_24 = L23_24.sol_02
    L19_20(L20_21, L21_22, L22_23, L23_24)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestSpawnEnemy"
    L21_22 = L17_18
    L19_20(L20_21, L21_22)
    while true do
      L19_20 = Fn_sendEventComSb
      L20_21 = "isSpawnEnemyEnd"
      L19_20 = L19_20(L20_21)
      if L19_20 then
        L19_20 = wait
        L19_20()
      end
    end
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestSpawnFi"
    L21_22 = "enmgen2_fi_battle_02"
    L19_20(L20_21, L21_22)
    while true do
      L19_20 = Fn_sendEventComSb
      L20_21 = "isSpawnFiEnd"
      L19_20 = L19_20(L20_21)
      if L19_20 then
        L19_20 = wait
        L19_20()
      end
    end
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestMoveArea"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipMove"
    L21_22 = 1
    L19_20(L20_21, L21_22)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipMove"
    L21_22 = 2
    L19_20(L20_21, L21_22)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipSettingD01"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipSettingD02"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipSettingD03"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipSettingD04"
    L19_20(L20_21)
    L19_20 = Fn_sendEventComSb
    L20_21 = "requestLandingShipSettingD05"
    L19_20(L20_21)
  end
  L19_20 = Fn_pcSensorOn
  L20_21 = "pccubesensor2_away_from_po_a_17"
  L19_20(L20_21)
  L19_20 = Fn_pcSensorOn
  L20_21 = "pccubesensor2_warning_cap_area"
  L19_20(L20_21)
  L19_20 = Fn_setNpcActive
  L20_21 = "sm08_client"
  L19_20(L20_21)
  L19_20 = Fn_setNpcActive
  L20_21 = "sm08_phi_01"
  L19_20(L20_21)
  L19_20 = Fn_setCatWarpCheckPoint
  L20_21 = "locator2_pc_start_pos"
  L19_20(L20_21)
  L19_20 = Fn_missionStart
  L19_20()
  L19_20 = Fn_userCtrlOn
  L19_20()
  L19_20 = HUD
  L20_21 = L19_20
  L19_20 = L19_20.miniGaugeSetVisible
  L21_22 = true
  L19_20(L20_21, L21_22)
  L19_20 = HUD
  L20_21 = L19_20
  L19_20 = L19_20.miniGaugeSetNum
  L21_22 = 0
  L19_20(L20_21, L21_22)
  L19_20 = HUD
  L20_21 = L19_20
  L19_20 = L19_20.miniGaugeSetTextID
  L21_22 = "sm08_09000"
  L19_20(L20_21, L21_22)
  L19_20 = {L20_21, L21_22}
  L20_21 = "sm08_01010"
  L21_22 = "sm08_01011"
  L20_21 = false
  L21_22 = false
  L22_23 = {
    L23_24,
    L24_25,
    L25_26
  }
  L23_24 = "sm08_01012"
  L24_25 = "sm08_01013"
  L25_26 = "sm08_01014"
  L23_24 = false
  L24_25 = false
  L25_26 = false
  L26_27 = invokeTask
  function L27_28()
    while Fn_sendEventComSb("isEnemyCount") < ALL_ENEMY_NUM do
      if Fn_sendEventComSb("isBoxBreakCount") and not L7_8 then
        invokeTask(function()
          L7_8 = true
          print("\230\156\128\229\136\157\227\129\174\231\174\177\231\160\180\229\163\138")
          while Fn_isCaptionView() do
            wait()
          end
          Fn_captionViewWait("sm08_04019")
          if L1_2 < OCC_MAX then
            Fn_captionView("sm08_04020")
          end
        end)
      end
      wait()
    end
  end
  L26_27 = L26_27(L27_28)
  L27_28 = Fn_missionViewWait
  L28_29 = "sm08_04000"
  L27_28(L28_29)
  L27_28 = invokeTask
  function L28_29()
    while not Fn_sendEventComSb("isViewControlFlg", 1) do
      wait()
    end
    waitSeconds(3)
    Mv_viewObjCancelByCameraInput("locator2_view_openship_01")
    while Fn_isCaptionView() do
      wait()
    end
    Fn_captionViewWait("sm08_04005")
  end
  L27_28 = L27_28(L28_29)
  L12_13 = L27_28
  while true do
    L27_28 = Fn_sendEventComSb
    L28_29 = "isLandingShipSettingD"
    L29_30 = 1
    L27_28 = L27_28(L28_29, L29_30)
    if L27_28 ~= 1 then
      L27_28 = wait
      L27_28()
    end
  end
  L27_28 = Fn_sendEventComSb
  L28_29 = "requestAnyChangeEnemyMarker"
  L29_30 = true
  L30_31 = "enmgen2_phase03_01_01"
  L27_28(L28_29, L29_30, L30_31)
  L27_28 = Fn_sendEventComSb
  L28_29 = "requestAnyChangeEnemyMarker"
  L29_30 = true
  L30_31 = "enmgen2_phase03_01_02"
  L27_28(L28_29, L29_30, L30_31)
  L27_28 = invokeTask
  function L28_29()
    Fn_captionViewWait("sm08_04017")
    Fn_captionViewWait("sm08_04018")
    while Fn_sendEventComSb("isLandingShipSettingD", 1) ~= 2 do
      wait()
    end
    Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
    while Fn_sendEventComSb("isLandingShipSettingD", 1) ~= 3 do
      wait()
    end
    Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
  end
  L27_28(L28_29)
  L27_28 = 0
  L28_29 = invokeTask
  function L29_30()
    while true do
      waitSeconds(1)
      L27_28 = L27_28 + 1
      print(L27_28 .. "\231\167\146   \230\149\181\227\129\174\230\149\176" .. Fn_sendEventComSb("isEnemyExist"))
    end
  end
  L28_29 = L28_29(L29_30)
  L29_30 = invokeTask
  function L30_31()
    while true do
      if Player:getEnergy(Player.kEnergy_Life) <= 0 then
        HUD:miniGaugeSetVisible(false)
      end
      wait()
    end
  end
  L29_30(L30_31)
  L29_30 = invokeTask
  function L30_31()
    while Fn_sendEventComSb("isEnemyCount") < ALL_ENEMY_NUM do
      if Fn_sendEventComSb("isEnemyExist") == 0 then
        L1_2 = L1_2 - 0.1
        if L1_2 < 0 then
          L1_2 = 0
        end
      end
      HUD:miniGaugeSetNum(L1_2 / OCC_MAX)
      wait()
    end
  end
  L29_30(L30_31)
  function L29_30()
    local L0_45
    L0_45 = HUD
    L0_45 = L0_45.miniGaugeSetVisible
    L0_45(L0_45, true)
    L0_45 = HUD
    L0_45 = L0_45.miniGaugeSetNum
    L0_45(L0_45, 0)
    L0_45 = HUD
    L0_45 = L0_45.miniGaugeSetTextID
    L0_45(L0_45, "sm08_09000")
    repeat
      L0_45 = Fn_sendEventComSb
      L0_45 = L0_45("isEnemyExist")
      if L0_45 >= 10 then
        L0_45 = countOccPoint
        L0_45 = L0_45(L1_2, OCC_UP, 10)
        L1_2 = L0_45
      else
        L0_45 = countOccPoint
        L0_45 = L0_45(L1_2, OCC_UP, Fn_sendEventComSb("isEnemyExist"))
        L1_2 = L0_45
      end
      L0_45 = HUD
      L0_45 = L0_45.miniGaugeSetNum
      L0_45(L0_45, L1_2 / OCC_MAX)
      L0_45 = L27_28
      if L0_45 >= 15 then
        L0_45 = L2_3
        if L0_45 then
          L0_45 = Fn_sendEventComSb
          L0_45("requestLandingShipMove", 3)
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while not Fn_sendEventComSb("isViewControlFlg", 2) do
              wait()
            end
            waitSeconds(3)
            Mv_viewObjCancelByCameraInput("locator2_view_openship_02")
            Fn_captionViewWait("sm08_04001")
            if L1_2 < OCC_MAX then
              Fn_captionViewWait("sm08_04002")
            end
          end)
          L13_14 = L0_45
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while Fn_sendEventComSb("isLandingShipSettingD", 3) ~= 1 do
              wait()
            end
            Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_02_01")
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 5)
            while Fn_sendEventComSb("isLandingShipSettingD", 3) ~= 2 do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 5)
          end)
          L8_9 = L0_45
          L0_45 = false
          L2_3 = L0_45
        end
      end
      L0_45 = L27_28
      if L0_45 >= 48 then
        L0_45 = L3_4
        if L0_45 then
          L0_45 = Fn_sendEventComSb
          L0_45("requestLandingShipMove", 4)
          L0_45 = Fn_sendEventComSb
          L0_45("requestLandingShipMove", 5)
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while not Fn_sendEventComSb("isViewControlFlg", 3) do
              wait()
            end
            waitSeconds(3)
            Mv_viewObjCancelByCameraInput("locator2_view_openship_03")
            Fn_captionViewWait("sm08_04009")
            if L1_2 < OCC_MAX then
              Fn_captionViewWait("sm08_04010")
            end
          end)
          L14_15 = L0_45
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while Fn_sendEventComSb("isLandingShipSettingD", 5) ~= 1 do
              wait()
            end
            Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_03_01")
            Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_03_02")
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 9)
            while Fn_sendEventComSb("isLandingShipSettingD", 5) ~= 2 do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 5)
            while Fn_sendEventComSb("isLandingShipSettingD", 5) ~= 3 do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 5)
          end)
          L9_10 = L0_45
          L0_45 = false
          L3_4 = L0_45
        end
      end
      L0_45 = L27_28
      if L0_45 >= 95 then
        L0_45 = L4_5
        if L0_45 then
          L0_45 = Fn_sendEventComSb
          L0_45("requestLandingShipMove", 6)
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while not Fn_sendEventComSb("isViewControlFlg", 4) do
              wait()
            end
            waitSeconds(3)
            Mv_viewObjCancelByCameraInput("locator2_view_openship_04")
            Fn_captionViewWait("sm08_04003")
            if L1_2 < OCC_MAX then
              Fn_captionViewWait("sm08_04004")
            end
          end)
          L15_16 = L0_45
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while Fn_sendEventComSb("isLandingShipSettingD", 6) ~= 1 do
              wait()
            end
            Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_04_01")
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
            while Fn_sendEventComSb("isLandingShipSettingD", 6) ~= 2 do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
          end)
          L10_11 = L0_45
          L0_45 = false
          L4_5 = L0_45
        end
      end
      L0_45 = L27_28
      if L0_45 >= 118 then
        L0_45 = L5_6
        if L0_45 then
          L0_45 = Fn_sendEventComSb
          L0_45("requestLandingShipMove", 7)
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while not Fn_sendEventComSb("isViewControlFlg", 5) do
              wait()
            end
            waitSeconds(3)
            Mv_viewObjCancelByCameraInput("locator2_view_openship_05")
            Fn_captionViewWait("sm08_04007")
            if L1_2 < OCC_MAX then
              Fn_captionViewWait("sm08_04008")
            end
          end)
          L16_17 = L0_45
          L0_45 = invokeTask
          L0_45 = L0_45(function()
            while Fn_sendEventComSb("isLandingShipSettingD", 7) ~= 1 do
              wait()
            end
            Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_05_01")
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
            while Fn_sendEventComSb("isLandingShipSettingD", 7) ~= 2 do
              wait()
            end
            Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
          end)
          L11_12 = L0_45
          L0_45 = false
          L5_6 = L0_45
        end
      end
      L0_45 = L1_2
      if L0_45 >= 50 then
        L0_45 = L20_21
        if not L0_45 then
          L0_45 = Fn_captionView
          L0_45(L19_20[1])
          L0_45 = true
          L20_21 = L0_45
        end
      end
      L0_45 = L1_2
      if L0_45 >= 80 then
        L0_45 = L21_22
        if not L0_45 then
          L0_45 = Fn_captionView
          L0_45(L19_20[2])
          L0_45 = true
          L21_22 = L0_45
        end
      end
      L0_45 = Fn_sendEventComSb
      L0_45 = L0_45("isLandEnemyCount")
      if L0_45 >= ALL_ENEMY_NUM * 0.8 then
        L0_45 = L23_24
        if not L0_45 then
          L0_45 = Fn_captionView
          L0_45(L22_23[1])
          L0_45 = true
          L23_24 = L0_45
        end
      end
      L0_45 = Fn_sendEventComSb
      L0_45 = L0_45("isLandEnemyCount")
      if L0_45 >= ALL_ENEMY_NUM * 0.5 then
        L0_45 = L24_25
        if not L0_45 then
          L0_45 = Fn_captionView
          L0_45(L22_23[2])
          L0_45 = true
          L24_25 = L0_45
        end
      end
      L0_45 = Fn_sendEventComSb
      L0_45 = L0_45("isLandEnemyCount")
      if L0_45 >= ALL_ENEMY_NUM * 0.2 then
        L0_45 = L25_26
        if not L0_45 then
          L0_45 = Fn_captionView
          L0_45(L22_23[3])
          L0_45 = true
          L25_26 = L0_45
        end
      end
      L0_45 = L0_1
      if L0_45 == 500 then
        L0_45 = Fn_captionView
        L0_45("sm08_04011")
      end
      L0_45 = L1_2
      if L0_45 >= OCC_MAX then
        L0_45 = Fn_pcSensorOff
        L0_45("pccubesensor2_away_from_po_a_17")
        L0_45 = Fn_pcSensorOff
        L0_45("pccubesensor2_warning_cap_area")
        L0_45 = Fn_pcSensorOff
        L0_45("pccubesensor2_warning_navi_kill_area")
        L0_45 = Fn_naviKill
        L0_45()
        _navi_on = false
        L0_45 = Fn_userCtrlOff
        L0_45()
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L8_9)
        L8_9 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L9_10)
        L9_10 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L10_11)
        L10_11 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L11_12)
        L11_12 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L12_13)
        L12_13 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L13_14)
        L13_14 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L14_15)
        L14_15 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L15_16)
        L15_16 = L0_45
        L0_45 = Mv_safeTaskAbort
        L0_45 = L0_45(L16_17)
        L16_17 = L0_45
        L0_45 = Fn_captionViewWait
        L0_45("sm08_04013")
        L0_45 = Fn_blackout
        L0_45()
        L0_45 = Fn_sendEventComSb
        L0_45("requestEnemyAllKill")
        L0_45 = Fn_sendEventComSb
        L0_45("requestFiKill")
        L0_45 = Fn_sendEventComSb
        L0_45("requestWarpArea")
        while true do
          L0_45 = Fn_sendEventComSb
          L0_45 = L0_45("isShipWarp01")
          if not L0_45 then
            L0_45 = print
            L0_45("\232\188\184\233\128\129\232\136\185\227\131\175\227\131\188\227\131\151\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\228\184\173")
            L0_45 = wait
            L0_45()
          end
        end
        L0_45 = Fn_resetPcPos
        L0_45("locator2_pc_start_pos")
        L0_45 = Fn_warpNpc
        L0_45("pre_01", "locator2_president")
        L0_45 = Fn_warpNpc
        L0_45("sol_01", "locator2_soldier_01")
        L0_45 = Fn_warpNpc
        L0_45("sol_02", "locator2_soldier_02")
        L0_45 = Player
        L0_45 = L0_45.getEnergyMax
        L0_45 = L0_45(L0_45, Player.kEnergy_Life)
        Player:setEnergy(Player.kEnergy_Life, L0_45)
        Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
        HUD:miniGaugeSetVisible(false)
        L0_1 = RASH_COUNT_MAX
        L1_2 = 0
        L20_21 = false
        L21_22 = false
        L23_24 = false
        L24_25 = false
        L25_26 = false
        L2_3 = true
        L3_4 = true
        L4_5 = true
        L5_6 = true
        Fn_sendEventComSb("requestEnemyCountReset")
        Fn_sendEventComSb("requestLandingShipSettingResetD")
        Fn_sendEventComSb("requestResetBox")
        Fn_sendEventComSb("requestSpawnFi", "enmgen2_fi_battle_02")
        while Fn_sendEventComSb("isSpawnFiEnd") do
          wait()
        end
        Fn_sendEventComSb("requestSpawnEnemy", L17_18)
        while Fn_sendEventComSb("isSpawnEnemyEnd") do
          wait()
        end
        Fn_sendEventComSb("requestLandingShipMove", 1)
        Fn_sendEventComSb("requestLandingShipMove", 2)
        Fn_sendEventComSb("requestLandingShipSettingD01")
        Fn_sendEventComSb("requestLandingShipSettingD02")
        Fn_sendEventComSb("requestLandingShipSettingD03")
        Fn_sendEventComSb("requestLandingShipSettingD04")
        Fn_sendEventComSb("requestLandingShipSettingD05")
        Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 8, 1)
        Fn_sendEventComSb("requestMoveArea")
        Fn_fadein()
        Fn_userCtrlOn()
        L12_13 = invokeTask(function()
          while not Fn_sendEventComSb("isViewControlFlg", 1) do
            wait()
          end
          waitSeconds(3)
          Mv_viewObjCancelByCameraInput("locator2_view_openship_01")
        end)
        Fn_missionViewWait("sm08_04000")
        Fn_pcSensorOn("pccubesensor2_away_from_po_a_17")
        Fn_pcSensorOn("pccubesensor2_warning_cap_area")
        while Fn_sendEventComSb("isLandingShipSettingD", 1) ~= 1 do
          wait()
        end
        Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_01_01")
        Fn_sendEventComSb("requestAnyChangeEnemyMarker", true, "enmgen2_phase03_01_02")
        invokeTask(function()
          while Fn_sendEventComSb("isLandingShipSettingD", 1) ~= 2 do
            wait()
          end
          Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
          while Fn_sendEventComSb("isLandingShipSettingD", 1) ~= 3 do
            wait()
          end
          Fn_sendEventComSb("requestEnemyNotAshCountChangeD", 6)
        end)
        L27_28 = 0
        return false
      end
      L0_45 = L0_1
      if L0_45 <= 0 then
        L0_45 = Fn_captionViewWait
        L0_45("sm08_04015")
      end
      L0_45 = Fn_sendEventComSb
      L0_45 = L0_45("isEnemyCount")
      if L0_45 >= ALL_ENEMY_NUM then
        L0_45 = Fn_pcSensorOff
        L0_45("pccubesensor2_away_from_po_a_17")
        L0_45 = Fn_pcSensorOff
        L0_45("pccubesensor2_warning_cap_area")
        L0_45 = waitSeconds
        L0_45(1)
        L0_45 = Fn_kaiwaDemoView
        L0_45("sm08_01150k")
        L0_45 = true
        return L0_45
      else
        L0_45 = L0_1
        if L0_45 <= 0 then
          L0_45 = Fn_pcSensorOff
          L0_45("pccubesensor2_away_from_po_a_17")
          L0_45 = Fn_pcSensorOff
          L0_45("pccubesensor2_warning_cap_area")
          L0_45 = waitSeconds
          L0_45(1)
          L0_45 = Fn_kaiwaDemoView
          L0_45("sm08_01100k")
          L0_45 = true
          return L0_45
        end
      end
      L0_45 = L0_1
      L0_45 = L0_45 - 1
      L0_1 = L0_45
      L0_45 = wait
      L0_45()
      L0_45 = false
    until L0_45
  end
  while true do
    L30_31 = L29_30
    L30_31 = L30_31()
    if L30_31 == false then
    end
  end
  L30_31 = Fn_blackout
  L30_31()
  L30_31 = Player
  L30_31 = L30_31.getEnergyMax
  L30_31 = L30_31(L31_32, L32_33)
  L34_35 = L30_31
  L31_32(L32_33, L33_34, L34_35)
  L31_32()
  if L28_29 ~= nil then
    L31_32(L32_33)
    L28_29 = nil
  end
  L31_32(L32_33, L33_34)
  L31_32(L32_33)
  L31_32(L32_33)
  L31_32(L32_33, L33_34)
  L31_32(L32_33, L33_34)
  L31_32(L32_33)
  L34_35 = "locator2_sdemo_aim_d_01"
  L31_32(L32_33, L33_34, L34_35)
  L31_32(L32_33)
  for L34_35 = 1, 2 do
    L35_36 = findGameObject2
    L36_37 = "EnemyGenerator"
    L37_38 = "enmgen2_sdemo_d_0"
    L38_39 = L34_35
    L37_38 = L37_38 .. L38_39
    L35_36 = L35_36(L36_37, L37_38)
    enmgen = L35_36
    L35_36 = enmgen
    if L35_36 ~= nil then
      L35_36 = enmgen
      L36_37 = L35_36
      L35_36 = L35_36.requestSpawn
      L35_36(L36_37)
      L35_36 = enmgen
      L36_37 = L35_36
      L35_36 = L35_36.setEnemyMarker
      L37_38 = false
      L35_36(L36_37, L37_38)
      while true do
        L35_36 = enmgen
        L36_37 = L35_36
        L35_36 = L35_36.isPrepared
        L35_36 = L35_36(L36_37)
        if not L35_36 then
          L35_36 = wait
          L35_36()
        end
      end
    end
  end
  function L34_35(A0_46)
    local L1_47
    L1_47 = A0_46.state
    if L1_47 == "wait" then
      L1_47 = L33_34
      if L1_47 == 0 then
        A0_46.changeState = "move"
        L1_47 = {
          "locator2_landingship_sdemo_move_02"
        }
        A0_46.movePoint = L1_47
        L1_47 = 1
        L33_34 = L1_47
      end
    end
    return A0_46
  end
  L35_36 = Fn_playPlayerMotion
  L36_37 = L18_19.label01
  L37_38 = -1
  L35_36(L36_37, L37_38)
  L35_36 = Fn_playMotionNpc
  L36_37 = "sm08_phi_01"
  L37_38 = "breath_00"
  L38_39 = false
  L35_36(L36_37, L37_38, L38_39)
  L35_36 = waitSeconds
  L36_37 = 0.5
  L35_36(L36_37)
  L35_36 = findGameObject2
  L36_37 = "Puppet"
  L37_38 = "sdemo_landingship01"
  L35_36 = L35_36(L36_37, L37_38)
  L36_37 = findGameObject2
  L37_38 = "Puppet"
  L38_39 = "sdemo_landingship02"
  L36_37 = L36_37(L37_38, L38_39)
  L38_39 = L35_36
  L37_38 = L35_36.getBrain
  L37_38 = L37_38(L38_39)
  L39_40 = L36_37
  L38_39 = L36_37.getBrain
  L38_39 = L38_39(L39_40)
  L39_40 = L37_38.setEventListener
  L39_40(L40_41, L41_42, L42_43)
  L39_40 = L38_39.setEventListener
  L39_40(L40_41, L41_42, L42_43)
  L39_40 = Fn_fadein
  L39_40()
  L39_40 = waitSeconds
  L39_40(L40_41)
  L39_40 = Fn_kaiwaDemoView
  L39_40(L40_41)
  L39_40 = {L40_41}
  L40_41.pos = "locator2_sdemo_aim_d_01_01"
  L40_41.time = 4.5
  L43_44 = L39_40
  L40_41(L41_42, L42_43, L43_44)
  L40_41(L41_42)
  L40_41()
  while true do
    if L40_41 then
      L40_41()
    end
  end
  L43_44 = true
  L40_41(L41_42, L42_43, L43_44, 0, true, false)
  L43_44 = false
  L40_41(L41_42, L42_43, L43_44)
  for L43_44 = 1, 2 do
    enmgen = findGameObject2("EnemyGenerator", "enmgen2_sdemo_d_0" .. L43_44)
    if enmgen ~= nil then
      enmgen:requestAllEnemyKill()
    end
  end
  L40_41(L41_42, L42_43)
  L40_41(L41_42)
  L40_41(L41_42)
  while true do
    if L40_41 ~= 3 then
      L40_41()
    end
  end
  L40_41(L41_42)
  L40_41(L41_42)
  for L43_44 = 1, 12 do
  end
  L40_41(L41_42)
  L40_41(L41_42, L42_43)
  L40_41(L41_42, L42_43)
  L40_41(L41_42, L42_43)
  L40_41(L41_42, L42_43)
  L40_41(L41_42)
  L43_44 = "locator2_sdemo_aim_d_02"
  L40_41(L41_42, L42_43, L43_44)
  L40_41(L41_42)
  L43_44 = {"talk_00"}
  L43_44 = "stay_00"
  L42_43()
  L43_44 = 1.5
  L42_43(L43_44)
  L43_44 = {}
  L43_44.pos = "locator2_sdemo_cam_d_03"
  L43_44.time = 2.5
  L43_44 = {
    {
      pos = "locator2_sdemo_aim_d_03",
      time = 2.5
    }
  }
  L39_40 = L43_44
  L43_44 = _sdemo_cut02
  L43_44 = L43_44.play
  L43_44(L43_44, L42_43, L39_40)
  while true do
    L43_44 = _sdemo_cut01
    L43_44 = L43_44.isPlay
    L43_44 = L43_44(L43_44)
    if L43_44 then
      L43_44 = wait
      L43_44()
    end
  end
  L43_44 = waitSeconds
  L43_44(4)
  L43_44 = Fn_kaiwaDemoView
  L43_44("sm08_01300k")
  L43_44 = _sdemo_cut02
  L43_44 = L43_44.stop
  L43_44(L43_44, 2)
  L43_44 = waitSeconds
  L43_44(2)
  if L40_41 ~= nil then
    L43_44 = L40_41.abort
    L43_44(L40_41)
  end
  if L41_42 ~= nil then
    L43_44 = L41_42.abort
    L43_44(L41_42)
  end
  L43_44 = Fn_playMotionNpc
  L43_44("sm08_client", "stay", false)
  L43_44 = Fn_playMotionNpc
  L43_44("man_01", "stay", false)
  L43_44 = Fn_disappearNpc
  L43_44("pre_01")
  L43_44 = Fn_disappearNpc
  L43_44("sol_01")
  L43_44 = Fn_disappearNpc
  L43_44("sol_02")
  L43_44 = Fn_setKeepPlayerPos
  L43_44()
  L43_44 = Fn_setNextMissionFlag
  L43_44()
  L43_44 = Fn_nextMission
  L43_44()
  L43_44 = Fn_exitSandbox
  L43_44()
end
function Finalize()
  local L0_48, L1_49
end
function pccubesensor2_away_from_po_a_17_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("sm08_04016")
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
