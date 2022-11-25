dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
import("Vehicle")
DESTROY_MAX = 100
FIRE_MAX = 9
FIRE_FIRST_PHASE = 1
FIRE_FIRST_PHASE_NUM = 6
WAIT_SET_BUILD_HDL_FRAME_CNT = 1
_global = {
  water_area = false,
  fire_eff_hdl = {},
  smoke_eff_hdl = {},
  vapor_eff_hdl = {},
  water_grab_able = false,
  grab_area_out = false,
  water_grab_now = false,
  navi_point = 0,
  mnavi_hdl = {},
  fire_hdl = {},
  fire_flag = {},
  gameover = false,
  retry_fire_flag = false,
  retry_fire_effect = {},
  retry_fire_build_hdl = {},
  landingship_phase = "",
  enemy_Reinforce = false,
  enemy_cnt = 0,
  enemy_max = 0,
  des_point = 0,
  fire_col = {},
  fire_num = 6,
  house_flag = {},
  water_flag = false,
  fire_plus_flag = false,
  chantyhouse_name_tbl = {
    "chantyhouse_fl_02_02",
    "chantyhouse_fl_03_02",
    "chantyhouse_fl_03_08",
    "washhouse_fl_01_01"
  },
  chantyhouse_name_tbl2 = {
    "chantyhouse_fl_01_01",
    "chantyhouse_fl_01_02",
    "chantyhouse_fl_01_03",
    "chantyhouse_fl_01_04",
    "chantyhouse_fl_01_05",
    "chantyhouse_fl_01_06",
    "chantyhouse_fl_02_01",
    "chantyhouse_fl_02_02",
    "chantyhouse_fl_02_03",
    "chantyhouse_fl_02_04",
    "chantyhouse_fl_02_05",
    "chantyhouse_fl_02_06",
    "chantyhouse_fl_02_07",
    "chantyhouse_fl_02_08",
    "chantyhouse_fl_02_09",
    "chantyhouse_fl_02_010",
    "chantyhouse_fl_02_011",
    "chantyhouse_fl_02_012",
    "chantyhouse_fl_02_013",
    "chantyhouse_fl_02_014",
    "chantyhouse_fl_02_015",
    "chantyhouse_fl_03_01",
    "chantyhouse_fl_03_02",
    "chantyhouse_fl_03_03",
    "chantyhouse_fl_03_04",
    "chantyhouse_fl_03_05",
    "chantyhouse_fl_03_06",
    "chantyhouse_fl_03_07",
    "chantyhouse_fl_03_08",
    "chantyhouse_fl_03_09",
    "chantyhouse_fl_03_010",
    "chantyhouse_fl_03_011",
    "chantyhouse_fl_03_012",
    "chantyhouse_fl_03_013",
    "chantyhouse_fl_03_014",
    "chantyhouse_fl_03_015",
    "chantyhouse_fl_03_016",
    "chantyhouse_fl_03_017",
    "chantyhouse_fl_03_018",
    "chantyhouse_fl_03_019",
    "washhouse_fl_01_01"
  },
  chantyhouse_hdl_tbl = {},
  chantyhouse_fire_tbl = {}
}
enmgen2_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_01",
      name = "ep06_e_landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_01",
      name = "enemy04",
      target_vehicle = "ep06_e_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "enemy05",
      target_vehicle = "enemy04"
    },
    {
      type = "officer_rifle",
      locator = "locator_01",
      name = "sol_rif_e_01",
      target_vehicle = "ep06_e_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_02",
      target_vehicle = "ep06_e_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_03",
      target_vehicle = "ep06_e_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_04",
      target_vehicle = "ep06_e_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_05",
      target_vehicle = "ep06_e_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_06",
      target_vehicle = "ep06_e_landingship01"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
    if A1_7:getName() ~= "ep06_e_landingship01" then
      _global.enemy_cnt = _global.enemy_cnt + 1
      _global.enemy_max = _global.enemy_max + 1
      print("ep06_e enmgen2_05 onSpawn " .. _global.enemy_cnt)
    end
  end,
  onObjectAsh = function(A0_8, A1_9)
    _global.enemy_cnt = _global.enemy_cnt - 1
    print("ep06_e enmgen2_05 onObjectAsh " .. _global.enemy_cnt)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_01",
      name = "ep06_e_landingship02"
    },
    {
      type = "mechsmall",
      locator = "locator_01",
      name = "enemy_e_04_02",
      target_vehicle = "ep06_e_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "enemy_e_05_02",
      target_vehicle = "enemy_e_04_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_01",
      name = "sol_rif_e_01_02",
      target_vehicle = "ep06_e_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_02_02",
      target_vehicle = "ep06_e_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_03_02",
      target_vehicle = "ep06_e_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_04_02",
      target_vehicle = "ep06_e_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_05_02",
      target_vehicle = "ep06_e_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_e_06_02",
      target_vehicle = "ep06_e_landingship02"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
    if A1_19:getName() ~= "ep06_e_landingship02" then
      _global.enemy_cnt = _global.enemy_cnt + 1
      _global.enemy_max = _global.enemy_max + 1
      print("ep06_e enmgen2_07 onSpawn " .. _global.enemy_cnt)
    end
  end,
  onObjectAsh = function(A0_20, A1_21)
    _global.enemy_cnt = _global.enemy_cnt - 1
    print("ep06_e enmgen2_07 onObjectAsh " .. _global.enemy_cnt)
  end,
  onObjectDead = function(A0_22, A1_23)
  end
}
function Initialize()
  _global.enemy_Reinforce = false
  _global.fire_num = FIRE_FIRST_PHASE_NUM
  for _FORV_3_ = 1, FIRE_MAX do
    _global.house_flag[_FORV_3_] = true
  end
  for _FORV_3_, _FORV_4_ in pairs(_global.chantyhouse_name_tbl) do
    _global.chantyhouse_fire_tbl[_FORV_4_] = -1
  end
  _global.chantyhouse_fire_tbl.chantyhouse_fl_03_02 = 5
  _global.chantyhouse_fire_tbl.washhouse_fl_01_01 = 6
  _global.chantyhouse_fire_tbl.chantyhouse_fl_03_08 = 10
  _global.chantyhouse_fire_tbl.chantyhouse_fl_02_02 = 11
end
function Ingame()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L21_45
  L0_24 = Fn_sendEventComSb
  L1_25 = "setLandingShipMove"
  L0_24(L1_25)
  L0_24 = false
  L1_25 = {}
  L2_26 = 0.005
  L3_27(L4_28)
  L3_27(L4_28)
  for L6_30, L7_31 in L3_27(L4_28) do
    L8_32 = setBuildBrokenListener
    L9_33 = L6_30
    L8_32(L9_33)
  end
  L3_27(L4_28)
  L3_27()
  if not L3_27 then
    L3_27(L4_28, L5_29)
    L3_27()
    L3_27(L4_28)
  else
    L6_30 = true
    L3_27(L4_28, L5_29, L6_30)
  end
  L6_30 = true
  L3_27(L4_28, L5_29, L6_30)
  L3_27(L4_28)
  if L3_27 ~= nil then
    L4_28(L5_29)
  end
  L6_30 = "Puppet"
  L7_31 = "ep06_e_landingship01"
  L7_31 = L5_29
  L6_30 = L5_29.getBrain
  L6_30 = L6_30(L7_31)
  L8_32 = L6_30
  L7_31 = L6_30.setEventListener
  L9_33 = "enemy_landingship_event"
  L10_34 = L4_28
  L7_31(L8_32, L9_33, L10_34)
  L7_31 = findGameObject2
  L8_32 = "EnemyGenerator"
  L9_33 = "enmgen2_07"
  L7_31 = L7_31(L8_32, L9_33)
  if L7_31 ~= nil then
    L9_33 = L7_31
    L8_32 = L7_31.requestPrepare
    L8_32(L9_33)
  end
  function L8_32(A0_46)
    if A0_46.state == "wait" then
      if _global.landingship_phase == "drop_mech" then
        A0_46.changeState = "move"
        A0_46.movePoint = {
          "locator2_drop_point_03"
        }
      elseif _global.landingship_phase == "land_back" then
        A0_46.changeState = "move"
        A0_46.movePoint = {
          "locator2_exit_point_03"
        }
        _global.landingship_phase = "empty"
      end
    end
    if A0_46.state == "moveEnd" then
      if _global.landingship_phase == "drop_mech" then
        A0_46.changeState = "drop"
        A0_46.dropEnemy = {
          "enemy_e_04_02"
        }
      elseif _global.landingship_phase == "drop_human" then
        A0_46.changeState = "open"
        A0_46.dropCount = 3
      elseif _global.landingship_phase == "empty" and findGameObject2("Puppet", "ep06_e_landingship02") ~= nil then
        findGameObject2("Puppet", "ep06_e_landingship02"):setVisible(false)
      end
    end
    if A0_46.state == "dropEnd" then
      A0_46.changeState = "open"
      A0_46.dropCount = 6
    end
    if A0_46.state == "openEnd" then
      _global.landingship_phase = "land_back"
      _global.fire_plus_flag = true
    end
    return A0_46
  end
  L9_33 = findGameObject2
  L10_34 = "Puppet"
  L11_35 = "ep06_e_landingship02"
  L9_33 = L9_33(L10_34, L11_35)
  L11_35 = L9_33
  L10_34 = L9_33.getBrain
  L10_34 = L10_34(L11_35)
  L11_35 = L10_34.setEventListener
  L11_35(L12_36, L13_37, L14_38)
  L11_35 = Fn_sendEventComSb
  L11_35(L12_36, L13_37, L14_38)
  L11_35 = Fn_repeatPlayMotion
  L11_35(L12_36, L13_37, L14_38)
  L11_35 = Fn_repeatPlayMotion
  L11_35(L12_36, L13_37, L14_38)
  L11_35 = Fn_repeatPlayMotion
  L11_35(L12_36, L13_37, L14_38)
  L11_35 = Fn_repeatPlayMotion
  L11_35(L12_36, L13_37, L14_38)
  L11_35 = findGameObject2
  L11_35 = L11_35(L12_36, L13_37)
  for L15_39 = 1, FIRE_MAX do
    L16_40 = _global
    L16_40 = L16_40.fire_eff_hdl
    L17_41 = Fn_createEffect
    L18_42 = "ef_ev_fire_"
    L19_43 = string
    L19_43 = L19_43.format
    L20_44 = "%02d"
    L19_43 = L19_43(L20_44, L21_45)
    L18_42 = L18_42 .. L19_43
    L19_43 = "ef_ev_fir_01"
    L20_44 = findGameObject2
    L20_44 = L20_44(L21_45, "locator2_fire_" .. string.format("%02d", L15_39))
    L20_44 = L20_44.getWorldPos
    L20_44 = L20_44(L21_45)
    L17_41 = L17_41(L18_42, L19_43, L20_44, L21_45)
    L16_40[L15_39] = L17_41
    L16_40 = _global
    L16_40 = L16_40.fire_eff_hdl
    L16_40 = L16_40[L15_39]
    L17_41 = L16_40
    L16_40 = L16_40.stop
    L16_40(L17_41)
    L16_40 = _global
    L16_40 = L16_40.smoke_eff_hdl
    L17_41 = Fn_createEffect
    L18_42 = "ef_ev_smoke_"
    L19_43 = string
    L19_43 = L19_43.format
    L20_44 = "%02d"
    L19_43 = L19_43(L20_44, L21_45)
    L18_42 = L18_42 .. L19_43
    L19_43 = "ef_ev_smk_03"
    L20_44 = findGameObject2
    L20_44 = L20_44(L21_45, "locator2_fire_" .. string.format("%02d", L15_39))
    L20_44 = L20_44.getWorldPos
    L20_44 = L20_44(L21_45)
    L17_41 = L17_41(L18_42, L19_43, L20_44, L21_45)
    L16_40[L15_39] = L17_41
    L16_40 = _global
    L16_40 = L16_40.vapor_eff_hdl
    L17_41 = Fn_createEffect
    L18_42 = "ef_ev_vapor_"
    L19_43 = string
    L19_43 = L19_43.format
    L20_44 = "%02d"
    L19_43 = L19_43(L20_44, L21_45)
    L18_42 = L18_42 .. L19_43
    L19_43 = "ef_ev_wtrpar_01"
    L20_44 = findGameObject2
    L20_44 = L20_44(L21_45, "locator2_fire_" .. string.format("%02d", L15_39))
    L20_44 = L20_44.getWorldPos
    L20_44 = L20_44(L21_45)
    L17_41 = L17_41(L18_42, L19_43, L20_44, L21_45)
    L16_40[L15_39] = L17_41
    L16_40 = _global
    L16_40 = L16_40.vapor_eff_hdl
    L16_40 = L16_40[L15_39]
    L17_41 = L16_40
    L16_40 = L16_40.stop
    L16_40(L17_41)
    L16_40 = "locator2_wc_sphere01_"
    L17_41 = string
    L17_41 = L17_41.format
    L18_42 = "%02d"
    L19_43 = L15_39
    L17_41 = L17_41(L18_42, L19_43)
    L16_40 = L16_40 .. L17_41
    L1_25[L15_39] = L16_40
    L16_40 = _global
    L16_40 = L16_40.fire_flag
    L16_40[L15_39] = false
  end
  L12_36(L13_37)
  L13_37.fire_col = L14_38
  for L16_40 = 1, FIRE_MAX do
    L17_41 = _global
    L17_41 = L17_41.fire_col
    L17_41 = L17_41[L16_40]
    L18_42 = L17_41
    L17_41 = L17_41.setEventListener
    L19_43 = "damage"
    L20_44 = L12_36
    L17_41(L18_42, L19_43, L20_44)
  end
  for L16_40 = 1, FIRE_MAX do
    L17_41 = "locator2_fire_"
    L18_42 = string
    L18_42 = L18_42.format
    L19_43 = "%02d"
    L20_44 = L16_40
    L18_42 = L18_42(L19_43, L20_44)
    L17_41 = L17_41 .. L18_42
    L18_42 = _global
    L18_42 = L18_42.fire_hdl
    L19_43 = findGameObject2
    L20_44 = "Node"
    L19_43 = L19_43(L20_44, L21_45)
    L18_42[L16_40] = L19_43
    L18_42 = _global
    L18_42 = L18_42.fire_col
    L18_42 = L18_42[L16_40]
    L19_43 = L18_42
    L18_42 = L18_42.setLockonPermission
    L20_44 = false
    L18_42(L19_43, L20_44)
    L18_42 = _global
    L18_42 = L18_42.fire_col
    L18_42 = L18_42[L16_40]
    L19_43 = L18_42
    L18_42 = L18_42.setActive
    L20_44 = false
    L18_42(L19_43, L20_44)
  end
  for L16_40 = 1, FIRE_FIRST_PHASE_NUM do
    L17_41 = _global
    L17_41 = L17_41.fire_eff_hdl
    L17_41 = L17_41[L16_40]
    L18_42 = L17_41
    L17_41 = L17_41.play
    L17_41(L18_42)
    L17_41 = _global
    L17_41 = L17_41.smoke_eff_hdl
    L17_41 = L17_41[L16_40]
    L18_42 = L17_41
    L17_41 = L17_41.play
    L17_41(L18_42)
    L17_41 = _global
    L17_41 = L17_41.vapor_eff_hdl
    L17_41 = L17_41[L16_40]
    L18_42 = L17_41
    L17_41 = L17_41.stop
    L17_41(L18_42)
    L17_41 = _global
    L17_41 = L17_41.fire_flag
    L17_41[L16_40] = true
    L17_41 = _global
    L17_41 = L17_41.fire_col
    L17_41 = L17_41[L16_40]
    L18_42 = L17_41
    L17_41 = L17_41.setActive
    L19_43 = true
    L17_41(L18_42, L19_43)
  end
  L13_37()
  L13_37()
  L16_40 = Fn_getPlayerWorldPos
  L20_44 = L16_40()
  L13_37(L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L21_45, L16_40())
  L16_40 = findGameObject2
  L17_41 = "Node"
  L18_42 = "locator2_view_01"
  L20_44 = L16_40(L17_41, L18_42)
  while true do
    L16_40 = Fn_isInSightTarget
    L17_41 = findGameObject2
    L18_42 = "Node"
    L19_43 = "locator2_view_01"
    L20_44 = L17_41(L18_42, L19_43)
    L16_40 = L16_40(L17_41, L18_42, L19_43, L20_44, L21_45, L17_41(L18_42, L19_43))
    if not L16_40 then
      L16_40 = wait
      L16_40()
    end
  end
  if L15_39 ~= nil then
    L17_41 = L15_39
    L16_40 = L15_39.abort
    L16_40(L17_41)
  end
  L16_40 = Fn_captionViewWait
  L17_41 = "ep06_04007"
  L18_42 = nil
  L16_40(L17_41, L18_42)
  L16_40 = waitSeconds
  L17_41 = 0.5
  L16_40(L17_41)
  L16_40 = invokeTask
  function L17_41()
    HUD:info("ep06_info_02", false)
    Fn_userCtrlOn()
    Player:setStay(false)
    waitSeconds(1)
    Fn_missionView("ep06_04000")
    waitSeconds(NAVI_WAIT)
    Fn_sendEventComSb("requestEnemyMarkerOn", "enmgen2_02", true)
    Fn_naviSet(findGameObject2("Node", "locator2_view_01"))
    HUD:miniGaugeSetVisible(true)
    HUD:miniGaugeSetNum(0)
    HUD:miniGaugeSetTextID("ep06_04009")
    HUD:miniGaugeSetType(HUD.kCountType_Up, 0.9)
    HUD:counter99_99SetVisible(true)
    HUD:counter99_99SetNum(_global.enemy_cnt)
    HUD:counter99_99SetMax(_global.enemy_max)
    HUD:counter99_99SetTextID("ep06_04010")
    HUD:counter99_99SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetVisible(true)
    HUD:counter999SetNum(_global.fire_num)
    HUD:counter999SetTextID("ep06_04012")
    HUD:counter999SetIcon(HUD.kCount999IconType_None)
  end
  L16_40(L17_41)
  L16_40 = Player
  L17_41 = L16_40
  L16_40 = L16_40.setEnergyInfinite
  L18_42 = Player
  L18_42 = L18_42.kEnergy_Life
  L19_43 = false
  L16_40(L17_41, L18_42, L19_43)
  L16_40 = Fn_sendEventComSb
  L17_41 = "requestIdleEnemy"
  L18_42 = "enmgen2_02"
  L19_43 = false
  L16_40(L17_41, L18_42, L19_43)
  L16_40 = Mob
  L17_41 = L16_40
  L16_40 = L16_40.makeSituationPanic
  L18_42 = true
  L16_40(L17_41, L18_42)
  L16_40 = false
  L17_41 = false
  L18_42 = false
  L19_43 = invokeTask
  function L20_44()
    local L0_47
    while true do
      L0_47 = L0_24
      if not L0_47 then
        L0_47 = HUD
        L0_47 = L0_47.miniGaugeSetNum
        L0_47(L0_47, _global.des_point / DESTROY_MAX)
        L0_47 = HUD
        L0_47 = L0_47.counter999SetNum
        L0_47(L0_47, _global.fire_num)
        L0_47 = Fn_sendEventComSb
        L0_47 = L0_47("requestCheckEnemyNum")
        if _global.enemy_Reinforce then
          L0_47 = L0_47 + _global.enemy_cnt
        end
        if L0_47 > _global.enemy_max then
          _global.enemy_max = L0_47
        end
        HUD:counter99_99SetMax(_global.enemy_max)
        HUD:counter99_99SetNum(L0_47)
        if Fn_sendEventComSb("requestCheckEnemyNum") <= 0 then
          L2_26 = 0.001
        elseif Fn_sendEventComSb("requestCheckEnemyNum") == 1 then
          L2_26 = 0.0015
        elseif Fn_sendEventComSb("requestCheckEnemyNum") == 2 then
          L2_26 = 0.002
        else
          L2_26 = 0.003
        end
        if _global.fire_num >= 1 then
          for _FORV_5_ = 1, _global.fire_num do
            _global.des_point = _global.des_point + L2_26
            if _global.des_point > DESTROY_MAX then
              _global.des_point = DESTROY_MAX
            end
            if _global.des_point == DESTROY_MAX then
              _global.gameover = true
              Fn_captionView("ep06_04020")
              getBuildHdlRetryFire()
              waitSeconds(2)
              retryFireEffect()
              Fn_whiteout(4)
              Fn_scriptGameOver()
              return
            end
          end
        end
        _FOR_()
      end
    end
  end
  L19_43 = L19_43(L20_44)
  L20_44 = invokeTask
  L20_44 = L20_44(L21_45)
  while true do
    if not L21_45 then
      L21_45()
    end
  end
  for _FORV_24_, _FORV_25_ in L21_45(_global.mnavi_hdl) do
    _global.mnavi_hdl[_FORV_24_]:setActive(true)
  end
  while not Fn_isInSightTarget(findGameObject2("Node", "locator2_fire_01"), 1) do
    wait()
  end
  if L15_39 ~= nil then
    L15_39:abort()
  end
  Fn_captionView("ep06_04002", nil, false)
  while not _global.water_flag do
    wait()
  end
  Fn_captionView("ep06_04003", nil, false)
  while true do
    if _global.fire_num <= 2 and _global.fire_plus_flag then
      _global.fire_plus_flag = false
      if FIRE_FIRST_PHASE == 1 then
        waitSeconds(1)
        for _FORV_25_ = FIRE_FIRST_PHASE_NUM + 1, FIRE_MAX do
          if _global.fire_col[_FORV_25_] ~= nil and _global.house_flag[_FORV_25_] then
            _global.fire_eff_hdl[_FORV_25_]:play()
            _global.smoke_eff_hdl[_FORV_25_]:play()
            _global.fire_flag[_FORV_25_] = true
            _global.fire_col[_FORV_25_]:setActive(true)
            _global.fire_num = _global.fire_num + 1
            print("\231\129\171\231\129\189\230\149\176\227\128\128" .. _global.fire_num)
          end
        end
        FIRE_FIRST_PHASE = 2
        FireCheck()
      end
    end
    if (Fn_sendEventComSb("isBattleEnd") == false or _global.enemy_cnt > 0) and _global.fire_num == 0 then
      if L16_40 == false then
        L16_40 = true
        L20_44 = Mv_safeTaskAbort(L20_44)
        Fn_naviKill()
        Fn_captionViewWait("ep06_04004", nil, false)
        Fn_missionView("ep06_04011")
      end
    elseif 0 >= Fn_sendEventComSb("requestCheckEnemyNum") + _global.enemy_cnt and _global.fire_num > 0 then
      if L17_41 == false then
        Fn_captionView("ep06_04005", nil, false)
        L17_41 = true
      end
    elseif 2 >= Fn_sendEventComSb("requestCheckEnemyNum") + _global.enemy_cnt and _global.fire_num > 0 then
      if L18_42 == false then
        L18_42 = true
        invokeTask(function()
          local L0_48
          while true do
            L0_48 = waitSeconds
            L0_48(5)
            L0_48 = _global
            L0_48 = L0_48.fire_num
            if L0_48 ~= 0 then
              L0_48 = _global
              L0_48 = L0_48.gameover
              if not L0_48 then
                L0_48 = _global
                L0_48 = L0_48.des_point
                if L0_48 <= 50 then
                  L0_48 = _global
                  L0_48.landingship_phase = "drop_mech"
                  L0_48 = _global
                  L0_48.enemy_Reinforce = true
                  L0_48 = findGameObject2
                  L0_48 = L0_48("EnemyGenerator", "enmgen2_05")
                  if not Fn_isInSightTarget(findGameObject2("Node", "locator2_found_ship_02"), 1) and Fn_isInSightTarget(findGameObject2("Node", "locator2_found_ship_01"), 1) then
                    L0_48 = findGameObject2("EnemyGenerator", "enmgen2_07")
                  end
                  if L0_48 ~= nil then
                    L0_48:requestSpawn()
                    while not L0_48:isPrepared() do
                      wait()
                    end
                    L0_48:setEnemyMarker(true)
                    L0_48:requestIdlingEnemy(false)
                  end
                  Fn_captionView("ep06_04006", nil, false)
                  break
                end
              end
            end
          end
        end)
      end
    elseif Fn_sendEventComSb("isBattleEnd") and _global.fire_num == 0 and _global.enemy_cnt <= 0 and not _global.gameover then
      L0_24 = true
      break
    end
    wait()
  end
  HUD:miniGaugeSetVisible(false)
  HUD:counter99_99SetVisible(false)
  HUD:counter999SetVisible(false)
  L19_43 = Mv_safeTaskAbort(L19_43)
  L20_44 = Mv_safeTaskAbort(L20_44)
  maltiNaviAllDelete()
  Fn_naviKill()
  Fn_sendEventComSb("setPrevPhaseContinue", true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setTargetingPriority(Player.kTargetingPrio_Default)
  end
end
function pccubesensor2_water_OnEnter()
  Mv_gotoNextPhase()
  Fn_tutorialCaption("grab")
  _global.water_area = true
end
function pccubesensor2_water_OnLeave()
  Fn_tutorialCaptionKill()
  _global.water_area = false
end
function pcspheresensor2_warp_warning_01_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep06_04008", nil, false)
    Player:setStay(false)
  end)
end
function pcspheresensor2_warp_area_01_OnLeave()
  runCatWarp()
end
function pccubesensor2_restore_area_01_OnEnter()
  local L0_49, L1_50
end
function maltiNaviAllDelete()
  for _FORV_3_, _FORV_4_ in pairs(_global.mnavi_hdl) do
    if _global.mnavi_hdl[_FORV_3_] ~= nil then
      _global.mnavi_hdl[_FORV_3_]:setActive(false)
      _global.mnavi_hdl[_FORV_3_]:del()
      _global.mnavi_hdl[_FORV_3_] = nil
    end
  end
end
function createMaltiNavi()
  local L0_51, L1_52, L2_53, L3_54
  for L3_54 = 1, FIRE_MAX do
    if _global.fire_flag[L3_54] then
      _global.mnavi_hdl[L3_54] = HUD:mnaviNew({
        name = "mnavi_" .. L3_54,
        PochFadeLen0 = 5,
        PochFadeLen100 = 20
      })
      _global.mnavi_hdl[L3_54]:setTarget(_global.fire_hdl[L3_54])
      _global.mnavi_hdl[L3_54]:setActive(true)
    else
      _global.mnavi_hdl[L3_54] = nil
    end
  end
end
function setBuildBrokenListener(A0_55)
  local L1_56, L2_57
  L1_56 = A0_55
  L2_57 = _global
  L2_57 = L2_57.chantyhouse_name_tbl
  L2_57 = L2_57[L1_56]
  _global.chantyhouse_hdl_tbl[L1_56] = Fn_findGimmickBgInBgset(L2_57)
  if _global.chantyhouse_hdl_tbl[L1_56] ~= nil then
    _global.chantyhouse_hdl_tbl[L1_56]:setEventListener("broken", buildBrokenListener)
  end
end
function checkBuildBroken()
  for _FORV_3_, _FORV_4_ in pairs(_global.chantyhouse_name_tbl) do
    if _global.chantyhouse_fire_tbl[_FORV_4_] ~= -1 and _global.chantyhouse_hdl_tbl[_FORV_3_] ~= nil and _global.chantyhouse_hdl_tbl[_FORV_3_]:isBroken() == false then
      _global.house_flag[_global.chantyhouse_fire_tbl[_FORV_4_]] = true
    end
  end
end
function buildBrokenListener(A0_58)
  local L1_59
  L1_59 = _global
  L1_59 = L1_59.chantyhouse_fire_tbl
  L1_59 = L1_59[A0_58:getName()]
  if L1_59 ~= -1 and L1_59 ~= nil then
    _global.house_flag[L1_59] = false
    if _global.fire_eff_hdl[L1_59] ~= nil then
      _global.fire_eff_hdl[L1_59]:stop()
    end
    if _global.vapor_eff_hdl[L1_59] ~= nil then
      _global.vapor_eff_hdl[L1_59]:stop()
    end
    if _global.smoke_eff_hdl[L1_59] ~= nil then
      _global.smoke_eff_hdl[L1_59]:stop()
    end
    if _global.fire_col[L1_59] ~= nil then
      _global.fire_col[L1_59]:setLockonPermission(false)
      _global.fire_col[L1_59]:setActive(false)
      if _global.fire_flag[L1_59] then
        _global.fire_num = _global.fire_num - 1
        if _global.fire_num < 0 then
          _global.fire_num = 0
        end
        _global.fire_flag[L1_59] = false
      end
    end
    if _global.mnavi_hdl[L1_59] ~= nil then
      _global.mnavi_hdl[L1_59]:setActive(false)
      _global.mnavi_hdl[L1_59]:del()
      _global.mnavi_hdl[L1_59] = nil
    end
  end
end
function setAbleFireLockon(A0_60)
  local L1_61, L2_62, L3_63, L4_64
  for L4_64 = 1, FIRE_MAX do
    if _global.fire_col[L4_64] ~= nil then
      if _global.fire_flag[L4_64] then
        _global.fire_col[L4_64]:setLockonPermission(A0_60)
      else
        _global.fire_col[L4_64]:setLockonPermission(false)
      end
    end
  end
end
function getBuildHdlRetryFire()
  local L0_65, L1_66, L2_67, L3_68, L4_69
  for L3_68, L4_69 in L0_65(L1_66) do
    _global.retry_fire_build_hdl[L3_68] = Fn_findGimmickBgInBgset(L4_69)
  end
end
function retryFireEffect()
  invokeTask(function()
    local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75
    for L3_73, L4_74 in L0_70(L1_71) do
      L5_75 = waitSeconds
      L5_75(0.02)
      L5_75 = nil
      if _global.retry_fire_build_hdl[L3_73]:isBroken() == true then
        L5_75 = Vector(0, 0, 0)
      else
        L5_75 = Vector(0, 2.5, 0)
      end
      _global.retry_fire_effect[L3_73] = Fn_createEffect("retry_fire_" .. string.format("%02d", L3_73), "ef_ev_fir_01", _global.retry_fire_build_hdl[L3_73]:getWorldPos() + L5_75, true)
    end
  end)
end
function FireCheck()
  local L0_76, L2_77, L3_78, L5_79
  L0_76 = 0
  for _FORV_4_ = 1, FIRE_MAX do
    if _global.fire_flag[_FORV_4_] then
      L0_76 = L0_76 + 1
    end
  end
  L2_77.fire_num = L0_76
end
