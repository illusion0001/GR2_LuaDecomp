import("GameDatabase")
import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm42_common.lua")
ADVICE_TIME01 = 30
ADVICE_TIME02 = 60
ADVICE_TIME03 = 300
EVENT_TIME = 0
ADVICE_TIME04 = 300
ADVICE_TIME05 = 180
MARKET_PO01 = 1
MARKET_PO01_PHOTO01 = 23
MARKET_PO02 = 2
MARKET_PO02_PHOTO01 = 25
MARKET_ADD_01 = 3
MARKET_ADD_01_PHOTO01 = 42
MARKET_POS_INIT = MARKET_PO01 + MARKET_PO02 + MARKET_ADD_01
MARKET_PHOTO = {
  NEAR = 5,
  FAR = 12,
  LEFT = -1,
  RIGHT = 1,
  TOP = -1,
  BOTTOM = 1,
  NEED_LOCATOR = 1
}
GSTONE_PHOTO = {
  [MARKET_PO01] = {
    NEAR = 10,
    FAR = 60,
    LEFT = -1,
    RIGHT = 1,
    TOP = -1,
    BOTTOM = 1,
    NEED_LOCATOR = 3
  },
  [MARKET_PO02] = {
    NEAR = 8,
    FAR = 60,
    LEFT = -1,
    RIGHT = 1,
    TOP = -1,
    BOTTOM = 1,
    NEED_LOCATOR = 3
  },
  [MARKET_ADD_01] = {
    NEAR = 10,
    FAR = 60,
    LEFT = -1,
    RIGHT = 1,
    TOP = -1,
    BOTTOM = 1,
    NEED_LOCATOR = 3
  }
}
GSTONE_CHECK_NODE01 = 16
GSTONE_CHECK_NODE02 = 16
GSTONE_SUC_LOCATOR = 2
POOR_MAX = 3
_puppet_tbl = {}
_photo = nil
_photo_area = false
_once_leave_sensor = false
_harbor_flag = true
_now_market = MARKET_POS_INIT
_market_flag = false
_first_grab_navi = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_harbor_area_away_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_area_navi_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_area_navi_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market02_area_navi_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_area_event_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_area_event_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_market02_area_event_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_area_photo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_area_photo_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market02_area_photo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_stone_event_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market02_stone_event_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_stone_away_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market02_stone_away_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market01_stone_photo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_market02_stone_photo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_flag_event_start_area_b_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lower_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lower_target_front_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lower_target_inside_01")
  L0_0 = {
    {
      name = "miz01",
      type = "miz01",
      node = "locator2_miz_01",
      active = false
    },
    {
      name = "poor01",
      type = "man42",
      node = "locator2_poor_setup_01",
      active = false
    },
    {
      name = "poor02",
      type = "man43",
      node = "locator2_poor_setup_02",
      active = false
    },
    {
      name = "poor03",
      type = "man44",
      node = "locator2_poor_setup_03",
      active = false
    },
    {
      name = "flag_man48",
      type = "man48",
      node = "locator2_flag_pilot_b_01",
      active = false
    },
    {
      name = "flag_wom29",
      type = "wom29",
      node = "locator2_flag_pilot_b_02",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _client_puppet = Fn_findNpcPuppet("sm42_client")
  _client_npc = Fn_findNpc("sm42_client")
  _sdemo_cut01 = SDemo.create("sm42_a_cut01")
  _sdemo_cut02 = SDemo.create("sm42_a_cut02")
  _sdemo_cut03 = SDemo.create("sm42_a_cut03")
  market_flag = false
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm21) == 1 then
    print("sm21\227\130\175\227\131\170\227\130\162\230\184\136\227\129\191")
    comSetClearEventFlag(true)
  else
    print("sm21\227\130\175\227\131\170\227\130\162\227\131\149\227\131\169\227\130\176\227\129\140\231\171\139\227\129\163\227\129\166\227\129\132\227\129\170\227\129\132")
    comSetClearEventFlag(false)
  end
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L0_1 = _client_puppet
  L1_2 = L0_1
  L0_1 = L0_1.isGrabbed
  L0_1 = L0_1(L1_2)
  if L0_1 == false then
    L0_1 = Mv_createNpcGrabSensor
    L1_2 = "sm42_client"
    L0_1 = L0_1(L1_2)
    L2_3 = L0_1
    L1_2 = L0_1.setActive
    L3_4 = true
    L1_2(L2_3, L3_4)
    L1_2 = Fn_warpNpc
    L2_3 = "sm42_client"
    L3_4 = "locator2_client_b_start_pos_01"
    L1_2(L2_3, L3_4)
    L1_2 = waitSeconds
    L2_3 = 0.5
    L1_2(L2_3)
    L1_2 = Fn_setGrabNpc
    L2_3 = "sm42_client"
    L3_4 = false
    L4_5 = false
    L1_2(L2_3, L3_4, L4_5)
    L1_2 = Player
    L2_3 = L1_2
    L1_2 = L1_2.setGrabObject
    L3_4 = _client_puppet
    L1_2(L2_3, L3_4)
    L1_2 = waitSeconds
    L2_3 = 0.5
    L1_2(L2_3)
    L2_3 = L0_1
    L1_2 = L0_1.setActive
    L3_4 = false
    L1_2(L2_3, L3_4)
  end
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Fn_tutorialCaptionKill
  L0_1()
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = setCatWarpClientPos
  L1_2 = "locator2_client_b_start_pos_01"
  L0_1(L1_2)
  L0_1 = invokeClientCatwarpCheck
  L1_2 = "sm42_client"
  L0_1 = L0_1(L1_2)
  L1_2 = {
    L2_3,
    L3_4,
    L4_5,
    L5_6,
    L6_7,
    L7_8
  }
  L2_3 = {
    [20] = L3_4(L4_5, L5_6)
  }
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_market01_resetpos_01"
  L21_22 = L3_4(L4_5, L5_6)
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[1] = L3_4
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[2] = L4_5
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[3] = L5_6
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[4] = L6_7
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[5] = L7_8
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[6] = L8_9
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[7] = L9_10
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[8] = L10_11
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[9] = L11_12
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[10] = L12_13
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[11] = L13_14
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[12] = L14_15
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[13] = L15_16
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[14] = L16_17
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[15] = L17_18
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[16] = L18_19
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[17] = L19_20
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[18] = L20_21
  ;({
    [20] = L3_4(L4_5, L5_6)
  })[19] = L21_22
  L3_4 = {
    [19] = L4_5(L5_6, L6_7)
  }
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_market01_resetpos_01"
  L21_22 = L4_5(L5_6, L6_7)
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[1] = L4_5
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[2] = L5_6
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[3] = L6_7
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[4] = L7_8
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[5] = L8_9
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[6] = L9_10
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[7] = L10_11
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[8] = L11_12
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[9] = L12_13
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[10] = L13_14
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[11] = L14_15
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[12] = L15_16
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[13] = L16_17
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[14] = L17_18
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[15] = L18_19
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[16] = L19_20
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[17] = L20_21
  ;({
    [19] = L4_5(L5_6, L6_7)
  })[18] = L21_22
  L4_5 = {
    [18] = L5_6(L6_7, L7_8)
  }
  L5_6 = findGameObject2
  L6_7 = "Node"
  L7_8 = "locator2_market01_resetpos_02"
  L21_22 = L5_6(L6_7, L7_8)
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[1] = L5_6
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[2] = L6_7
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[3] = L7_8
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[4] = L8_9
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[5] = L9_10
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[6] = L10_11
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[7] = L11_12
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[8] = L12_13
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[9] = L13_14
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[10] = L14_15
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[11] = L15_16
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[12] = L16_17
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[13] = L17_18
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[14] = L18_19
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[15] = L19_20
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[16] = L20_21
  ;({
    [18] = L5_6(L6_7, L7_8)
  })[17] = L21_22
  L5_6 = {
    [17] = L6_7(L7_8, L8_9)
  }
  L6_7 = findGameObject2
  L7_8 = "Node"
  L21_22 = L6_7(L7_8, L8_9)
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[1] = L6_7
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[2] = L7_8
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[3] = L8_9
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[4] = L9_10
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[5] = L10_11
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[6] = L11_12
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[7] = L12_13
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[8] = L13_14
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[9] = L14_15
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[10] = L15_16
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[11] = L16_17
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[12] = L17_18
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[13] = L18_19
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[14] = L19_20
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[15] = L20_21
  ;({
    [17] = L6_7(L7_8, L8_9)
  })[16] = L21_22
  L6_7 = {
    [16] = L7_8(L8_9, L9_10)
  }
  L7_8 = findGameObject2
  L21_22 = L7_8(L8_9, L9_10)
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[1] = L7_8
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[2] = L8_9
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[3] = L9_10
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[4] = L10_11
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[5] = L11_12
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[6] = L12_13
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[7] = L13_14
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[8] = L14_15
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[9] = L15_16
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[10] = L16_17
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[11] = L17_18
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[12] = L18_19
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[13] = L19_20
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[14] = L20_21
  ;({
    [16] = L7_8(L8_9, L9_10)
  })[15] = L21_22
  L7_8 = {
    [15] = L8_9(L9_10, L10_11)
  }
  L21_22 = L8_9(L9_10, L10_11)
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[1] = L8_9
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[2] = L9_10
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[3] = L10_11
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[4] = L11_12
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[5] = L12_13
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[6] = L13_14
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[7] = L14_15
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[8] = L15_16
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[9] = L16_17
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[10] = L17_18
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[11] = L18_19
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[12] = L19_20
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[13] = L20_21
  ;({
    [15] = L8_9(L9_10, L10_11)
  })[14] = L21_22
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_market01_area_navi_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_market01_area_navi_02"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_market02_area_navi_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_harbor_area_away_01"
  L2_3(L3_4)
  L2_3 = Fn_missionViewWait
  L3_4 = "sm42_01000"
  L2_3(L3_4)
  L2_3 = Fn_captionView
  L3_4 = "sm42_01001"
  L2_3(L3_4)
  L2_3 = invokeTask
  function L3_4()
    local L0_23
    L0_23 = 0
    while true do
      if L0_23 == ADVICE_TIME01 then
        Fn_captionView("sm42_01002")
      elseif L0_23 == ADVICE_TIME02 then
        Fn_captionView("sm42_01003")
      else
        if L0_23 == ADVICE_TIME03 then
          comViewNaviCap("locator2_market01_navi_01", nil, "sm42_01004")
          L0_23 = ADVICE_TIME02
        else
        end
      end
      waitSeconds(1)
      L0_23 = L0_23 + 1
    end
  end
  L2_3 = L2_3(L3_4)
  L3_4 = invokeTask
  function L4_5()
    local L0_24
    L0_24 = MARKET_POS_INIT
    while true do
      if _now_market == MARKET_PO01 and L0_24 ~= _now_market then
        L0_24 = _now_market
        Fn_pcSensorOn("pccubesensor2_market01_area_event_01")
        comViewCapNavi("locator2_market01_navi_01", "sm42_01005", "locator2_market01_navi_01")
      elseif _now_market == MARKET_PO02 and L0_24 ~= _now_market then
        L0_24 = _now_market
        Fn_pcSensorOn("pccubesensormulti2_market02_area_event_01")
        comViewCapNavi("locator2_market02_navi_01", "sm42_01005", "locator2_market02_navi_01")
      elseif _now_market == MARKET_ADD_01 and L0_24 ~= _now_market then
        L0_24 = _now_market
        Fn_pcSensorOn("pccubesensor2_market01_area_event_02")
        comViewCapNavi("locator2_market01_navi_02", "sm42_01005", "locator2_market01_navi_02")
      end
      wait()
    end
  end
  L3_4 = L3_4(L4_5)
  market_task = L3_4
  L3_4 = Mv_waitPhase
  L3_4()
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_market01_area_navi_01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_market01_area_navi_02"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_market02_area_navi_01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_market01_area_event_01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_market01_area_event_02"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensormulti2_market02_area_event_01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_harbor_area_away_01"
  L3_4(L4_5)
  L3_4 = Fn_naviKill
  L3_4()
  L3_4 = Mv_safeTaskAbort
  L4_5 = market_task
  L3_4 = L3_4(L4_5)
  market_task = L3_4
  L3_4 = Mv_safeTaskAbort
  L4_5 = L2_3
  L3_4 = L3_4(L4_5)
  L2_3 = L3_4
  L3_4 = Mv_safeTaskAbort
  L4_5 = view_task
  L3_4 = L3_4(L4_5)
  view_task = L3_4
  L3_4 = Mv_safeTaskAbort
  L4_5 = L0_1
  L3_4 = L3_4(L4_5)
  L0_1 = L3_4
  L3_4 = {
    L4_5,
    L5_6,
    L6_7
  }
  L4_5 = "locator2_market01_client_01"
  L5_6 = "locator2_market02_client_01"
  L6_7 = "locator2_market01_client_02"
  L4_5 = Mv_viewObj
  L5_6 = _now_market
  L5_6 = L3_4[L5_6]
  L4_5 = L4_5(L5_6)
  L5_6 = Fn_captionViewWait
  L6_7 = "sm42_01006"
  L5_6(L6_7)
  L5_6 = Fn_blackout
  L5_6()
  L5_6 = Fn_resetArea
  L5_6()
  L5_6 = Area
  L6_7 = L5_6
  L5_6 = L5_6.requestRestore
  L5_6(L6_7)
  L5_6 = Fn_userCtrlAllOff
  L5_6()
  L5_6 = Fn_setGrabReleaseNpc
  L6_7 = "sm42_client"
  L5_6(L6_7)
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.setGrabExceptionalObject
  L7_8 = {}
  L5_6(L6_7, L7_8)
  L5_6, L6_7 = nil, nil
  L7_8 = _now_market
  if L7_8 == L8_9 then
    L7_8 = Fn_warpNpc
    L7_8(L8_9, L9_10)
    L5_6 = "locator2_market01_client_01"
    L7_8 = Fn_resetPcPos
    L7_8(L8_9)
    L6_7 = "locator2_market01_resetpos_01"
    L7_8 = Fn_setCatWarpCheckPoint
    L7_8(L8_9)
    L7_8 = Fn_pcSensorOn
    L7_8(L8_9)
  else
    L7_8 = _now_market
    if L7_8 == L8_9 then
      L7_8 = Fn_warpNpc
      L7_8(L8_9, L9_10)
      L5_6 = "locator2_market02_client_01"
      L7_8 = Fn_resetPcPos
      L7_8(L8_9)
      L6_7 = "locator2_market02_resetpos_01"
      L7_8 = Fn_setCatWarpCheckPoint
      L7_8(L8_9)
      L7_8 = Fn_pcSensorOn
      L7_8(L8_9)
    else
      L7_8 = _now_market
      if L7_8 == L8_9 then
        L7_8 = Fn_warpNpc
        L7_8(L8_9, L9_10)
        L5_6 = "locator2_market01_client_02"
        L7_8 = Fn_resetPcPos
        L7_8(L8_9)
        L6_7 = "locator2_market01_resetpos_02"
        L7_8 = Fn_setCatWarpCheckPoint
        L7_8(L8_9)
        L7_8 = Fn_pcSensorOn
        L7_8(L8_9)
      end
    end
  end
  L7_8 = Fn_fadein
  L7_8(L8_9)
  L7_8 = Fn_kaiwaDemoView
  L7_8(L8_9)
  L7_8 = Fn_userCtrlOn
  L7_8()
  L7_8 = Fn_missionView
  L7_8(L8_9)
  L7_8 = Fn_playMotionNpc
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = waitSeconds
  L7_8(L8_9)
  L7_8 = false
  L11_12 = true
  L12_13 = {}
  L12_13.near = L13_14
  L12_13.far = L13_14
  L13_14.left = L14_15
  L13_14.right = L14_15
  L13_14.top = L14_15
  L13_14.bottom = L14_15
  _photo = L8_9
  if L8_9 == L9_10 then
    for L11_12 = 1, MARKET_PO01_PHOTO01 do
      L12_13 = _photo
      L12_13 = L12_13.set
      L16_17 = "%02d"
      L12_13(L13_14, L14_15)
    end
  elseif L8_9 == L9_10 then
    for L11_12 = 1, MARKET_PO02_PHOTO01 do
      L12_13 = _photo
      L12_13 = L12_13.set
      L16_17 = "%02d"
      L12_13(L13_14, L14_15)
    end
  elseif L8_9 == L9_10 then
    for L11_12 = MARKET_PO01_PHOTO01, L9_10 + L10_11 do
      L12_13 = _photo
      L12_13 = L12_13.set
      L16_17 = "%02d"
      L12_13(L13_14, L14_15)
    end
  end
  while L7_8 == false do
    if L9_10 == true then
      L9_10(L10_11)
      L9_10(L10_11)
      L9_10(L10_11)
      repeat
        L9_10()
        if L9_10 ~= false then
        end
      until not L9_10
      if L9_10 == true then
        L11_12 = "\230\146\174\229\189\177\231\181\144\230\158\156\227\129\174\229\158\139 \226\134\146 "
        L12_13 = type
        L12_13 = L12_13(L13_14)
        L11_12 = L11_12 .. L12_13
        L10_11(L11_12)
        L11_12 = L9_10
        if L10_11 ~= "table" then
          L11_12 = "sm42_01008"
          L10_11(L11_12)
          L11_12 = "\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\140\228\184\128\227\129\164\227\129\151\227\129\139\229\134\153\227\129\163\227\129\166\227\129\132\227\129\170\227\129\132"
          L10_11(L11_12)
        else
          L11_12 = L9_10
          if L10_11 == "table" then
            L11_12 = "\227\131\149\227\131\172\227\131\188\227\131\160\229\134\133\227\129\174\229\128\139\230\149\176"
            L12_13 = #L9_10
            L11_12 = L11_12 .. L12_13
            L10_11(L11_12)
            L11_12 = L10_11
            L12_13 = "success"
            L10_11(L11_12, L12_13)
            L7_8 = true
            L10_11()
            L10_11()
            L11_12 = "sm42_01009"
            L10_11(L11_12)
            break
          end
        end
      end
    end
    L9_10()
  end
  L11_12 = false
  L9_10(L10_11, L11_12)
  _photo = nil
  _photo_area = false
  L9_10()
  L9_10(L10_11)
  L9_10(L10_11)
  L9_10(L10_11)
  L11_12 = {}
  L9_10(L10_11, L11_12)
  L11_12 = "sm42_00210k"
  L10_11(L11_12)
  L11_12 = "sm42_client"
  L12_13 = L10_11
  L11_12 = L10_11.setActive
  L11_12(L12_13, L13_14)
  L11_12 = Fn_setGrabNpc
  L12_13 = "sm42_client"
  L11_12(L12_13, L13_14, L14_15)
  L11_12 = Fn_missionView
  L12_13 = "sm42_01010"
  L11_12(L12_13)
  L11_12 = clientGrabWait
  L12_13 = Fn_findNpcPuppet
  L21_22 = L12_13(L13_14)
  L11_12(L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L12_13(L13_14))
  L11_12 = Fn_setCatWarpCheckPoint
  L12_13 = L6_7
  L11_12(L12_13)
  L11_12 = Fn_tutorialCaptionKill
  L11_12()
  L11_12 = setCatWarpClientPos
  L12_13 = L5_6
  L11_12(L12_13)
  L11_12 = invokeClientCatwarpCheck
  L12_13 = "sm42_client"
  L11_12 = L11_12(L12_13)
  L0_1 = L11_12
  L11_12 = _now_market
  L12_13 = MARKET_PO01
  if L11_12 ~= L12_13 then
    L11_12 = _now_market
    L12_13 = MARKET_ADD_01
  else
    if L11_12 == L12_13 then
      L11_12 = Fn_pcSensorOn
      L12_13 = "pccubesensor2_market01_stone_event_01"
      L11_12(L12_13)
      L11_12 = Fn_pcSensorOn
      L12_13 = "pccubesensor2_market01_stone_away_01"
      L11_12(L12_13)
      L11_12 = waitSeconds
      L12_13 = 1
      L11_12(L12_13)
      L11_12 = comViewCapNavi
      L12_13 = nil
      L11_12(L12_13, L13_14, L14_15)
  end
  else
    L11_12 = _now_market
    L12_13 = MARKET_PO02
    if L11_12 == L12_13 then
      L11_12 = Fn_pcSensorOn
      L12_13 = "pccubesensor2_market02_stone_event_01"
      L11_12(L12_13)
      L11_12 = Fn_pcSensorOn
      L12_13 = "pccubesensor2_market02_stone_away_01"
      L11_12(L12_13)
      L11_12 = waitSeconds
      L12_13 = 1
      L11_12(L12_13)
      L11_12 = comViewCapNavi
      L12_13 = nil
      L11_12(L12_13, L13_14, L14_15)
    end
  end
  L12_13 = L10_11
  L11_12 = L10_11.setActive
  L11_12(L12_13, L13_14)
  L11_12 = invokeTask
  function L12_13()
    waitSeconds(5)
    Fn_captionView("sm42_01068")
  end
  L11_12(L12_13)
  L11_12 = Mv_waitPhase
  L11_12()
  L11_12 = Fn_pcSensorOff
  L12_13 = "pccubesensor2_market01_stone_event_01"
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L12_13 = "pccubesensor2_market02_stone_event_01"
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L12_13 = "pccubesensor2_market01_stone_away_01"
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L12_13 = "pccubesensor2_market02_stone_away_01"
  L11_12(L12_13)
  L11_12 = Fn_naviKill
  L11_12()
  L11_12 = nil
  L12_13 = _now_market
  if L12_13 ~= 1 then
    L12_13 = _now_market
  else
    if L12_13 == 3 then
      L11_12 = "locator2_market01_stone_navi_01"
  end
  else
    L12_13 = _now_market
    if L12_13 == 2 then
      L11_12 = "locator2_market02_stone_navi_01"
    end
  end
  L12_13 = comGetClearEventFlag
  L12_13 = L12_13()
  if L12_13 == true then
    L12_13 = clearEventFunc
    L12_13()
  end
  L12_13 = Fn_userCtrlAllOff
  L12_13()
  L12_13 = Player
  L12_13 = L12_13.setStay
  L12_13(L13_14, L14_15)
  L12_13 = comViewNaviCap
  L12_13(L13_14, L14_15, L15_16)
  L12_13 = waitSeconds
  L12_13(L13_14)
  L12_13 = Player
  L12_13 = L12_13.setStay
  L12_13(L13_14, L14_15)
  L12_13 = waitSeconds
  L12_13(L13_14)
  L12_13 = Fn_kaiwaDemoView
  L12_13(L13_14)
  L12_13 = Fn_userCtrlOn
  L12_13()
  L12_13 = Fn_missionView
  L12_13(L13_14)
  L12_13 = _now_market
  if L12_13 ~= 1 then
    L12_13 = _now_market
  else
    if L12_13 == 3 then
      L12_13 = Fn_pcSensorOn
      L12_13(L13_14)
  end
  else
    L12_13 = _now_market
    if L12_13 == 2 then
      L12_13 = Fn_pcSensorOn
      L12_13(L13_14)
    end
  end
  L12_13 = waitSeconds
  L12_13(L13_14)
  L12_13 = invokeTask
  L12_13(L13_14)
  L12_13 = false
  L16_17 = true
  L17_18.near = L18_19
  L17_18.far = L18_19
  L18_19.left = L19_20
  L18_19.right = L19_20
  L18_19.top = L19_20
  L18_19.bottom = L19_20
  _photo = L13_14
  if L13_14 ~= L14_15 then
  else
    if L13_14 == L14_15 then
      for L16_17 = 1, GSTONE_CHECK_NODE01 do
        L21_22 = "%02d"
        L17_18(L18_19, L19_20)
      end
  end
  elseif L13_14 == L14_15 then
    for L16_17 = 1, GSTONE_CHECK_NODE02 do
      L21_22 = "%02d"
      L17_18(L18_19, L19_20)
    end
  end
  while L12_13 == false do
    if L13_14 == true then
      L13_14(L14_15)
      L13_14(L14_15)
      repeat
        L13_14()
        if L13_14 ~= false then
        end
      until not L13_14
      if L13_14 == true then
        L16_17 = 0
        L17_18(L18_19)
        if L17_18 == "table" then
          L17_18(L18_19)
          if L17_18 >= L18_19 then
            for L20_21 = 1, #L13_14 do
              L21_22 = L13_14[L20_21]
              L21_22 = L21_22.state
              if L21_22 ~= kPHOTO_OUT then
                L21_22 = L13_14[L20_21]
                L21_22 = L21_22.state
              else
                if L21_22 == kPHOTO_NO_TERGET then
                  L21_22 = print
                  L21_22("\227\131\149\227\131\172\227\131\188\227\131\160\229\164\150\227\129\139\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\230\156\170\231\153\187\233\140\178")
              end
              else
                L21_22 = L13_14[L20_21]
                L21_22 = L21_22.state
                if L21_22 == kPHOTO_NEAR then
                  L21_22 = print
                  L21_22("\232\191\145\227\129\153\227\129\142")
                else
                  L21_22 = L13_14[L20_21]
                  L21_22 = L21_22.state
                  if L21_22 == kPHOTO_FAR then
                    L16_17 = L16_17 + 1
                    L21_22 = print
                    L21_22("\233\129\160\227\129\153\227\129\142")
                  else
                    L21_22 = print
                    L21_22("OK")
                  end
                end
              end
            end
            L17_18(L18_19)
            L17_18(L18_19)
            L17_18(L18_19)
            if L14_15 < L17_18 then
              L17_18(L18_19, L19_20)
              L17_18()
              L17_18()
              L12_13 = true
              L17_18(L18_19)
              break
            elseif L15_16 > L16_17 then
              L17_18(L18_19)
            elseif L15_16 < L16_17 then
              L17_18(L18_19)
            elseif L15_16 == L16_17 then
              L17_18(L18_19)
            end
          else
            L17_18(L18_19)
          end
        else
          L17_18(L18_19)
        end
      end
    end
    L13_14()
  end
  L13_14(L14_15, L15_16)
  _photo = nil
  _photo_area = false
  _once_leave_sensor = false
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14(L14_15, L15_16)
  L16_17 = false
  L13_14(L14_15, L15_16, L16_17)
  L15_16.id = "ui_event_guide_02"
  L15_16.func = L13_14
  L14_15.RL = L15_16
  L16_17 = {}
  L16_17.target = "locator2_miz_01"
  L15_16(L16_17, L17_18, L18_19, L19_20, L20_21)
  L15_16()
  L16_17 = "sm42_01020"
  L15_16(L16_17, L17_18, L18_19)
  L16_17 = "locator2_lower_target_front_navi_01"
  L15_16(L16_17, L17_18, L18_19)
  L16_17 = invokeTask
  L16_17 = L16_17(L17_18)
  L17_18()
  while L15_16 == true do
    L17_18()
  end
  L16_17 = L17_18
  L17_18(L18_19)
  L17_18(L18_19)
  L17_18(L18_19, L19_20, L20_21)
  L18_19()
  L18_19(L19_20)
  for L21_22 = 1, POOR_MAX do
    Fn_setNpcActive("poor" .. string.format("%02d", L21_22), true)
    Fn_setNpcVisible("poor" .. string.format("%02d", L21_22), true)
    print("\227\130\162\227\130\184\227\131\136\227\129\174\227\130\173\227\131\163\227\131\169\229\135\186\231\143\190")
  end
  L21_22 = {"stay_02"}
  L18_19(L19_20, L20_21, L21_22)
  L21_22 = {"stay_01"}
  L18_19(L19_20, L20_21, L21_22)
  L21_22 = {"talk_02"}
  L18_19(L19_20, L20_21, L21_22)
  while L15_16 == true do
    L18_19()
  end
  L18_19()
  event_task = L18_19
  L18_19(L19_20)
  L21_22 = "sm42_01025"
  L18_19(L19_20, L20_21, L21_22)
  L18_19()
  L18_19(L19_20)
  L18_19()
  L18_19(L19_20)
  L18_19()
  L0_1 = L18_19
  L18_19(L19_20)
  L18_19(L19_20)
  L18_19()
  L18_19()
  L18_19()
end
function Finalize()
  local L0_25, L1_26, L2_27, L3_28
  if L0_25 then
    L0_25(L1_26, L2_27)
  end
  for L3_28 = 1, POOR_MAX do
    Fn_disappearNpc("poor" .. string.format("%02d", L3_28))
  end
  L0_25(L1_26)
  if L0_25 ~= nil then
    L0_25(L1_26)
  end
  if L0_25 ~= nil then
    L0_25(L1_26)
  end
  if L0_25 ~= nil then
    L0_25(L1_26, L2_27)
  end
end
function pccubesensor2_client_grab_sensorOnEnter(A0_29)
  invokeTask(function()
    if _first_grab_navi == false then
      waitSeconds(1)
    end
    if _client_puppet:isGrabbed() == false then
      Fn_tutorialCaption("grab")
    end
  end)
end
function pccubesensor2_client_grab_sensorOnLeave(A0_30)
  Fn_tutorialCaptionKill()
  _first_grab_navi = false
  Fn_captionView("sm42_01026")
end
function pccubesensor2_harbor_area_away_01_OnEnter()
  if _harbor_flag == false then
    Fn_naviKill()
  end
end
function pccubesensor2_harbor_area_away_01_OnLeave()
  _harbor_flag = false
  Fn_naviSet(findGameObject2("Node", "locator2_market01_navi_01"))
  Fn_captionView("sm42_01027")
end
function pccubesensor2_market01_area_navi_01_OnEnter()
  local L0_31, L1_32
  L0_31 = MARKET_PO01
  _now_market = L0_31
end
function pccubesensor2_market01_area_event_01_OnEnter()
  _now_market = MARKET_PO01
  Mv_gotoNextPhase()
end
function pccubesensor2_market01_area_navi_02_OnEnter()
  local L0_33, L1_34
  L0_33 = MARKET_ADD_01
  _now_market = L0_33
end
function pccubesensor2_market01_area_event_02_OnEnter()
  _now_market = MARKET_ADD_01
  Mv_gotoNextPhase()
end
function pccubesensor2_market02_area_navi_01_OnEnter()
  local L0_35, L1_36
  L0_35 = MARKET_PO02
  _now_market = L0_35
end
function pccubesensormulti2_market02_area_event_01_OnEnter()
  _now_market = MARKET_PO02
  Mv_gotoNextPhase()
end
function marketOnEnterFunc()
  _photo_area = true
  if _once_leave_sensor then
    Fn_naviKill()
    invokeTask(function()
      Fn_captionViewWait("sm42_01028")
      if _photo_area and _photo ~= nil then
        _photo:resetCaption()
      end
    end)
  end
end
function marketOnLeaveFunc()
  _photo_area = false
  Fn_naviSet(_client_puppet)
  invokeTask(function()
    Fn_turnNpc("sm42_client")
    Fn_playMotionNpc("sm42_client", "talk_01", false)
    Fn_captionViewWait("sm42_01029")
    Fn_playMotionNpc("sm42_client", "stay_01", false)
  end)
  _once_leave_sensor = true
end
function pccubesensor2_market01_area_photo_01_OnEnter()
  marketOnEnterFunc()
end
function pccubesensor2_market01_area_photo_01_OnLeave()
  marketOnLeaveFunc()
end
function pccubesensor2_market01_area_photo_02_OnEnter()
  marketOnEnterFunc()
end
function pccubesensor2_market01_area_photo_02_OnLeave()
  marketOnLeaveFunc()
end
function pccubesensor2_market02_area_photo_01_OnEnter()
  marketOnEnterFunc()
end
function pccubesensor2_market02_area_photo_01_OnLeave()
  marketOnLeaveFunc()
end
function pccubesensor2_market01_stone_event_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_market02_stone_event_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_market01_away_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_market01_stone_navi_01"))
  Fn_captionView("sm42_01030")
end
function pccubesensor2_market01_away_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_market02_away_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_market02_stone_navi_01"))
  Fn_captionView("sm42_01030")
end
function pccubesensor2_market02_away_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_market01_stone_photo_01_OnEnter()
  _photo_area = true
  if _once_leave_sensor then
    Fn_naviKill()
    invokeTask(function()
      Fn_captionViewWait("sm42_01031")
      if _photo_area and _photo ~= nil then
        _photo:resetCaption()
      end
    end)
  end
end
function pccubesensor2_market01_stone_photo_01_OnLeave()
  _photo_area = false
  Fn_naviSet(findGameObject2("Node", "locator2_market01_stone_navi_01"))
  Fn_captionView("sm42_01032")
  _once_leave_sensor = true
end
function pccubesensor2_market02_stone_photo_01_OnEnter()
  _photo_area = true
  if _once_leave_sensor then
    Fn_naviKill()
    invokeTask(function()
      Fn_captionViewWait("sm42_01031")
      if _photo_area and _photo ~= nil then
        _photo:resetCaption()
      end
    end)
  end
end
function pccubesensor2_market02_stone_photo_01_OnLeave()
  _photo_area = false
  Fn_naviSet(findGameObject2("Node", "locator2_market02_stone_navi_01"))
  Fn_captionView("sm42_01032")
  _once_leave_sensor = true
end
function pccubesensor2_lower_area_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_lower_target_front_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_lower_target_inside_01_OnEnter()
  Mv_gotoNextPhase()
end
function clearEventFunc()
  Fn_pcSensorOn("pccubesensormulti2_flag_event_start_area_b_01")
  comInitFlagEventArray("b")
  comInvokeFlagEventInit("ForSm21Ship02", "sm21_bike", "locator2_flag_ship_b_01", "flag_man48", "flag_wom29")
end
function pccubesensor2_flag_event_kaiwa_sensorOnEnter()
  invokeTask(function()
    _event_bike.kaiwa_flag = true
    _event_bike.sensor:setActive(false)
    Fn_kaiwaDemoView("sm42_00330k")
    _event_bike.pos_route_tbl = _comBike[comGetCreateDirection()][BIKE_ESCAPE]
    comFlagEventReRoute()
    Fn_pcSensorOff("pccubesensormulti2_flag_event_start_area_b_01")
  end)
end
function pccubesensormulti2_flag_event_start_area_b_01_OnEnter()
  comOnEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_b_01_OnLeave()
  comOffEventAreaFlag()
end
