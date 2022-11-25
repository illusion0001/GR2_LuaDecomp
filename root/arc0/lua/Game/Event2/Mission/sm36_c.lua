import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_arrive_trading_site = false
_next_phase = false
_puppet_tbl = {}
_hdl_tbl = {}
_event_motion_table_c = {
  fight_in = "kit01_stay_fighting_in_00",
  fighting = "kit01_stay_fighting_00"
}
_ship_hdl = nil
_SHIP_SPEED_01 = 12
_SHIP_SPEED_02 = 8
_kit_insight = false
_caution_task = nil
_fly_task = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm36_suspect",
      type = "man26",
      node = "locator2_suspect_c",
      reset = false
    },
    {
      name = "sm36_organization_01",
      type = "thug04",
      node = "locator2_organization_c_01",
      reset = false
    },
    {
      name = "sm36_organization_02",
      type = "thug05",
      node = "locator2_organization_c_02",
      reset = false
    },
    {
      name = "sm36_organization_03",
      type = "thug04",
      node = "locator2_organization_c_03",
      reset = false,
      color_variation = 1
    },
    {
      name = "sm36_organization_04",
      type = "thug05",
      node = "locator2_organization_c_04",
      reset = false,
      color_variation = 1
    },
    {
      name = "sm36_organization_05",
      type = "thug04",
      node = "locator2_organization_c_05",
      reset = false,
      hair_variation = 1
    },
    {
      name = "sm36_organization_06",
      type = "thug05",
      node = "locator2_organization_c_06",
      reset = false,
      hair_variation = 1
    },
    {
      name = "sm36_organization_07",
      type = "thug04",
      node = "locator2_organization_c_07",
      reset = false,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "sm36_organization_08",
      type = "thug05",
      node = "locator2_organization_c_08",
      reset = false,
      color_variation = 1,
      hair_variation = 1
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _hdl_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _sdemo_cut00 = SDemo.create("sm36_c_cut00")
  _sdemo_cut01 = SDemo.create("sm36_c_cut01")
  _sdemo_cut02 = SDemo.create("sm36_c_cut02")
  _sdemo_cut03 = SDemo.create("sm36_c_cut03")
  Fn_pcSensorOff("pccubesensor2_trading_site")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30
  L0_1 = true
  L1_2 = true
  L2_3 = true
  while true do
    L3_4 = Vehicle
    L4_5 = L3_4
    L3_4 = L3_4.isReady
    L3_4 = L3_4(L4_5)
    if not L3_4 then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = {}
  L4_5 = {}
  L5_6 = {}
  L6_7 = {}
  L7_8 = {
    L8_9,
    L9_10,
    L10_11,
    L11_12,
    L12_13
  }
  L11_12 = "gem2_energy_04"
  L12_13 = "gem2_energy_05"
  for L11_12, L12_13 in L8_9(L9_10) do
    L13_14 = findGameObject2
    L14_15 = "Gem"
    L15_16 = L12_13
    L13_14 = L13_14(L14_15, L15_16)
    L3_4[L11_12] = L13_14
    L13_14 = findGameObject2
    L14_15 = "Gem"
    L15_16 = L12_13
    L13_14 = L13_14(L14_15, L15_16)
    L4_5[L11_12] = L13_14
    L13_14 = print
    L14_15 = "\227\130\184\227\130\167\227\131\160\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\231\162\186\228\191\157"
    L13_14(L14_15)
  end
  if L8_9 ~= nil then
    while true do
      L11_12 = L8_9
      L12_13 = true
      if L10_11 then
        L10_11()
      end
    end
    L11_12 = string
    L11_12 = L11_12.format
    L12_13 = "\227\130\168\227\131\170\227\130\162\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\229\190\133\227\129\161\230\153\130\233\150\147:%d"
    L13_14 = L9_10
    L29_30 = L11_12(L12_13, L13_14)
    L10_11(L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L11_12(L12_13, L13_14))
  end
  L10_11.name = "sm36_organization_01"
  L10_11.node = "locator2_organization_c_01"
  L11_12 = {L12_13, L13_14}
  L12_13 = "locator2_organization_01_surround_path_01"
  L13_14 = "locator2_organization_01_surround_path_02"
  L10_11.path = L11_12
  L10_11.motion = "talk_02"
  L10_11.is_surround = true
  L11_12 = {}
  L11_12.name = "sm36_organization_02"
  L11_12.node = "locator2_organization_c_02"
  L12_13 = {L13_14, L14_15}
  L13_14 = "locator2_organization_02_surround_path_01"
  L14_15 = "locator2_organization_02_surround_path_02"
  L11_12.path = L12_13
  L11_12.motion = "talk_03"
  L11_12.is_surround = true
  L12_13 = {}
  L12_13.name = "sm36_organization_03"
  L12_13.node = "locator2_organization_c_03"
  L13_14 = {L14_15, L15_16}
  L14_15 = "locator2_organization_03_surround_path_01"
  L15_16 = "locator2_organization_03_surround_path_02"
  L12_13.path = L13_14
  L12_13.motion = "sit_floor_01"
  L12_13.is_surround = true
  L13_14 = {}
  L13_14.name = "sm36_organization_04"
  L13_14.node = "locator2_organization_c_04"
  L14_15 = {L15_16}
  L15_16 = "locator2_organization_04_fixed_path_01"
  L13_14.path = L14_15
  L13_14.motion = "talk_03"
  L13_14.is_surround = false
  L14_15 = {}
  L14_15.name = "sm36_organization_05"
  L14_15.node = "locator2_organization_c_05"
  L15_16 = {L16_17}
  L16_17 = "locator2_organization_05_fixed_path_01"
  L14_15.path = L15_16
  L14_15.motion = "talk_02"
  L14_15.is_surround = false
  L15_16 = {}
  L15_16.name = "sm36_organization_06"
  L15_16.node = "locator2_organization_c_06"
  L16_17 = {L17_18}
  L17_18 = "locator2_organization_06_fixed_path_01"
  L15_16.path = L16_17
  L15_16.motion = "man01_count_01"
  L15_16.is_surround = false
  L16_17 = {}
  L16_17.name = "sm36_organization_07"
  L16_17.node = "locator2_organization_c_07"
  L17_18 = {L18_19}
  L18_19 = "locator2_organization_07_fixed_path_01"
  L16_17.path = L17_18
  L16_17.motion = "talk_01"
  L16_17.is_surround = false
  L17_18 = {}
  L17_18.name = "sm36_organization_08"
  L17_18.node = "locator2_organization_c_08"
  L18_19 = {L19_20}
  L17_18.path = L18_19
  L17_18.motion = "talk_02"
  L17_18.is_surround = false
  L11_12 = "getShipHandle"
  _ship_hdl = L10_11
  if L10_11 == nil then
    L11_12 = "requestCreateShip"
    L12_13 = "locator2_ship_com_c"
    L10_11(L11_12, L12_13)
    repeat
      L11_12 = "getShipHandle"
      _ship_hdl = L10_11
      L10_11()
    until L10_11 ~= nil
    L11_12 = 2
    L10_11(L11_12)
  end
  L10_11()
  L11_12 = "setShipRoute"
  L12_13 = 0
  L10_11(L11_12, L12_13)
  L11_12 = "pccubesensor2_trading_site"
  L10_11(L11_12)
  L11_12 = false
  L12_13 = false
  L13_14 = 200
  L14_15 = 70
  L15_16 = 0
  L16_17 = false
  L17_18 = _ship_hdl
  L18_19 = L17_18
  L17_18 = L17_18.setCollidable
  L17_18(L18_19, L19_20)
  L17_18 = _ship_hdl
  L18_19 = L17_18
  L17_18 = L17_18.setPilot
  L17_18(L18_19, L19_20, L20_21)
  L17_18 = Fn_findNpc
  L18_19 = "sm36_suspect"
  L17_18 = L17_18(L18_19)
  L18_19 = L17_18.ignoreStoop
  L18_19(L19_20)
  L18_19 = L17_18.rideOnVehicle
  L18_19(L19_20)
  repeat
    L18_19 = wait
    L18_19()
    L18_19 = L17_18.isRideOnVehicle
    L18_19 = L18_19(L19_20)
  until L18_19
  L17_18 = nil
  L18_19 = _ship_hdl
  L18_19 = L18_19.setCollidable
  L18_19(L19_20, L20_21)
  L18_19 = Fn_sendEventComSb
  L18_19(L19_20, L20_21, L21_22)
  L18_19 = Player
  L18_19 = L18_19.setStay
  L18_19(L19_20, L20_21)
  L18_19 = {L19_20}
  L19_20.pos = "locator2_cam_c_start_01"
  L19_20.time = 1.5
  cam_point = L18_19
  L18_19 = {L19_20}
  L19_20.pos = "locator2_aim_c_start_02"
  L19_20.time = 5
  aim_point = L18_19
  L18_19 = _sdemo_cut00
  L18_19 = L18_19.set
  L22_23 = false
  L18_19(L19_20, L20_21, L21_22, L22_23)
  L18_19 = _sdemo_cut00
  L18_19 = L18_19.play
  L18_19(L19_20, L20_21, L21_22)
  while true do
    L18_19 = _sdemo_cut00
    L18_19 = L18_19.isPlay
    L18_19 = L18_19(L19_20)
    if L18_19 then
      L18_19 = wait
      L18_19()
    end
  end
  L18_19 = Camera
  L18_19 = L18_19.lookTo
  L22_23 = "locator2_aim_c_start_02"
  L22_23 = 0
  L18_19(L19_20, L20_21, L21_22, L22_23)
  L18_19 = _sdemo_cut00
  L18_19 = L18_19.stop
  L18_19(L19_20)
  L18_19 = Fn_loadPlayerMotion
  L18_19(L19_20)
  L18_19 = Fn_loadNpcEventMotion
  L20_21.count_01 = "man01_count_01"
  L18_19(L19_20, L20_21)
  L18_19 = Fn_loadNpcEventMotion
  L20_21.fly_l_in = "man01_vbike02_stay_l_in_00"
  L18_19(L19_20, L20_21)
  L18_19 = Player
  L18_19 = L18_19.setStay
  L18_19(L19_20, L20_21)
  L18_19 = Fn_userCtrlOn
  L18_19()
  L18_19 = Fn_missionView
  L18_19(L19_20)
  L18_19 = waitSeconds
  L18_19(L19_20)
  L18_19 = Fn_naviSet
  L18_19(L19_20)
  L18_19 = Fn_userCtrlOn
  L18_19()
  L18_19 = {}
  L19_20(L20_21)
  while true do
    if L19_20 then
      L19_20()
      L18_19 = L19_20
    end
  end
  for L22_23 = 1, #L18_19 do
    L23_24 = L18_19[L22_23]
    L23_24 = L23_24.setVisibleBlockEnable
    L23_24(L24_25, L25_26)
  end
  _caution_task = L19_20
  while true do
    if not L19_20 then
      if L19_20 == nil then
        _fly_task = L19_20
      end
      if L19_20 == true and L10_11 == false and L16_17 then
        _next_phase = true
      end
      L19_20()
    end
  end
  _next_phase = false
  L19_20()
  L19_20(L20_21)
  L22_23 = "locator2_pc_reset_pos_c_01"
  L23_24 = L20_21
  L21_22(L22_23, L23_24)
  L21_22()
  L22_23 = 3
  L21_22(L22_23)
  L22_23 = L21_22
  L23_24 = "locator2_cam_c_01"
  L21_22(L22_23, L23_24, L24_25, L25_26)
  L22_23 = L21_22
  L21_22(L22_23)
  L22_23 = {}
  L22_23.pos = "locator2_cam_c_02"
  L22_23.time = 1.5
  L22_23 = _sdemo_cut01
  L23_24 = L22_23
  L22_23 = L22_23.play
  L22_23(L23_24, L24_25, L25_26)
  while true do
    L22_23 = _sdemo_cut01
    L23_24 = L22_23
    L22_23 = L22_23.isPlay
    L22_23 = L22_23(L23_24)
    if L22_23 then
      L22_23 = wait
      L22_23()
    end
  end
  L22_23 = waitSeconds
  L23_24 = 2
  L22_23(L23_24)
  L22_23 = Fn_kaiwaDemoView
  L23_24 = "sm36_01300k"
  L22_23(L23_24)
  L22_23 = _sdemo_cut01
  L23_24 = L22_23
  L22_23 = L22_23.set
  L22_23(L23_24, L24_25, L25_26, L26_27)
  L22_23 = {L23_24}
  L23_24 = {}
  L23_24.pos = "locator2_cam_c_03"
  L23_24.time = 1.5
  L23_24 = {L24_25}
  L24_25.pos = "locator2_aim_c_03"
  L24_25.time = 1.5
  L24_25(L25_26, L26_27, L27_28)
  for L27_28, L28_29 in L24_25(L25_26) do
    L29_30 = Mv_safeTaskAbort
    L29_30(L6_7[L27_28])
    L29_30 = L28_29.is_surround
    if L29_30 then
      L29_30 = Fn_moveNpc
      L29_30(L28_29.name, L28_29.path, {
        anim_run_speed = 1.2,
        anim_speed_over = true,
        runLength = -1,
        recast = true
      })
      L29_30 = print
      L29_30("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\174\232\191\145\227\129\143\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139")
    else
      L29_30 = Fn_moveNpc
      L29_30(L28_29.name, L28_29.path, {
        anim_run_speed = 0.8,
        runLength = -1,
        recast = true
      })
      L29_30 = invokeTask
      L29_30(function()
        while not _hdl_tbl[L28_29.name]:isMoveEnd() do
          wait()
        end
        Fn_turnNpc(L28_29.name)
        Fn_playMotionNpc(L28_29.name, "fighting", false)
      end)
      break
    end
  end
  L24_25(L25_26, L26_27, L27_28)
  L24_25(L25_26, L26_27)
  L25_26(L26_27)
  for L28_29, L29_30 in L25_26(L26_27) do
    if L29_30.is_surround then
      invokeTask(function()
        while not _hdl_tbl[L29_30.name]:isMoveEnd() do
          wait()
        end
        Fn_turnNpc(L29_30.name)
        print("\227\130\173\227\131\136\227\130\165\227\131\179\229\155\178\227\130\128\239\188\154\231\167\187\229\139\149\231\181\130\227\130\143\227\129\163\227\129\159", L29_30.name)
      end)
    else
    end
  end
  L25_26(L26_27)
  L25_26(L26_27)
  L25_26()
  L25_26(L26_27, L27_28)
  L28_29 = 1
  L29_30 = L24_25
  L25_26(L26_27, L27_28, L28_29, L29_30)
  L25_26()
  L25_26()
  L25_26()
  L25_26()
end
function Finalize()
  if _caution_task and _caution_task:isRunning() then
    _caution_task:abort()
  end
  _caution_task = nil
  if _fly_task and _fly_task:isRunning() then
    _fly_task:abort()
  end
  _fly_task = nil
end
function createGem(A0_31, A1_32)
  local L2_33, L3_34, L4_35
  L3_34 = A0_31
  L2_33 = A0_31.getName
  L2_33 = L2_33(L3_34)
  L3_34 = createGameObject2
  L4_35 = "Gem"
  L3_34 = L3_34(L4_35)
  L4_35 = L3_34.setGemModelNo
  L4_35(L3_34, A1_32)
  L4_35 = A0_31.getWorldPos
  L4_35 = L4_35(A0_31)
  L4_35 = L4_35 + Vector(0, 0, 0)
  L3_34:setWorldPos(L4_35)
  L3_34:setForceMove()
  L3_34:setVisible(true)
  L3_34:try_init()
  L3_34:waitForReadyAsync(function()
    L3_34:try_start()
  end)
  return L3_34
end
function pccubesensor2_trading_site_OnEnter()
  local L0_36, L1_37
  _arrive_trading_site = true
end
function pccubesensor2_trading_site_OnLeave()
  local L0_38, L1_39
  _arrive_trading_site = false
end
function isInsightObject(A0_40, A1_41)
  local L2_42
  if A1_41 == nil then
    L2_42 = Vector
    L2_42 = L2_42(0, 0, 0)
    A1_41 = L2_42
  end
  L2_42 = Camera
  L2_42 = L2_42.getEyePos
  L2_42 = L2_42(L2_42)
  L2_42.y = L2_42.y + 1
  Query:setEyeSightTransform(L2_42)
  Query:setEyeSightAngle(Deg2Rad(360))
  Query:setEyeSightRange(30)
  return true
end
