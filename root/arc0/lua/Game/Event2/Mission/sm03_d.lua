dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm03_common.lua")
import("Vehicle")
MNAVI_MAX = 3
POP_APPEAR = 110
SPEED_FIRST = 11
SPEED_AGAIN = 10
TIMER_01 = 10
TIMER_02 = 20
DISTANCE_CAP = 15
DISTANCE_RETRY = 150
MISS_TIME = 5
_puppet_tbl = {}
_mnavi_hdl = {}
_is_success = false
_cat_warp = false
_go_back = false
_is_in_sensor = false
_caption_on = false
_in_one_island = false
_in_same_island = false
_induce_up = false
_induce_down = false
_thief_cap_task = nil
_thief = nil
_pop_route = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_robber_a"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_robber_b"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_robber_c"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_over_up_a"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_over_down_a"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_over_up_b"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_over_down_b"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_over_up_c"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_over_down_c"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_return_haikanko_area"
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    {
      name = "robber_npc_a",
      type = "man53",
      node = "locator2_pop_a",
      active = false
    },
    {
      name = "robber_npc_b",
      type = "man53",
      node = "locator2_pop_b",
      active = false
    },
    {
      name = "robber_npc_c",
      type = "man53",
      node = "locator2_pop_c",
      active = false
    },
    {
      name = "hum_01",
      type = "man36",
      node = "locator2_man_cidtalk_01",
      not_mob = true,
      anim_name = "stay_01"
    },
    {
      name = "hum_02",
      type = "wom18",
      node = "locator2_wom_cidtalk_01",
      not_mob = true,
      anim_name = "listen_00"
    },
    {
      name = "hum_03",
      type = "chi12",
      node = "locator2_girl_cidtalk_01_d",
      not_mob = true,
      anim_name = "listen_00"
    },
    {
      name = "hum_04",
      type = "chi11",
      node = "locator2_boy_cidtalk_01_d",
      not_mob = true,
      anim_name = "listen_00"
    },
    {
      name = "hum_05",
      type = "wom17",
      node = "locator2_wom_cidtalk_03",
      not_mob = true,
      anim_name = "listen_00"
    }
  }
  L1_1 = {}
  L1_1.name = "haikanko_01"
  L1_1.type = "man38"
  L1_1.node = "locator2_haikanko_01_d"
  L1_1.reset = false
  L1_1 = Fn_setupNpc
  L1_1(L0_0)
  L1_1 = {}
  L1_1.label01 = "chi01_magichand_00"
  L1_1.label02 = "chi01_sq_magichand_00"
  Fn_loadNpcEventMotion("hum_03", L1_1)
  Fn_loadNpcEventMotion("hum_04", L1_1)
  for _FORV_5_, _FORV_6_ in pairs(L0_0) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  _cid_puppet = Fn_findNpcPuppet("sm03_client")
  _sdemo_cut04 = SDemo.create("sm03_d_cut04")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40
  L0_2 = {
    L1_3,
    L2_4,
    L3_5
  }
  L1_3 = "locator2_ride_pos_a"
  L2_4 = "locator2_ride_pos_b"
  L3_5 = "locator2_ride_pos_c"
  L1_3 = Fn_findNpc
  L2_4 = "robber_npc_a"
  L1_3 = L1_3(L2_4)
  L2_4 = L1_3
  L1_3 = L1_3.ignoreStoop
  L1_3(L2_4)
  L1_3 = Fn_findNpc
  L2_4 = "robber_npc_b"
  L1_3 = L1_3(L2_4)
  L2_4 = L1_3
  L1_3 = L1_3.ignoreStoop
  L1_3(L2_4)
  L1_3 = Fn_findNpc
  L2_4 = "robber_npc_c"
  L1_3 = L1_3(L2_4)
  L2_4 = L1_3
  L1_3 = L1_3.ignoreStoop
  L1_3(L2_4)
  L1_3 = Fn_missionStart
  L1_3()
  L1_3 = Fn_userCtrlOn
  L1_3()
  L1_3 = Fn_setCatWarpCheckPoint
  L2_4 = "locator2_pc_start_pos"
  L1_3(L2_4)
  L1_3 = Fn_playMotionNpc
  L2_4 = "haikanko_01"
  L3_5 = "stay_01"
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Fn_missionView
  L2_4 = "sm03_03014"
  L1_3(L2_4)
  L1_3 = waitSeconds
  L2_4 = 1.3
  L1_3(L2_4)
  L1_3 = setSearchNavi
  L1_3()
  L1_3 = waitSeconds
  L2_4 = 2.5
  L1_3(L2_4)
  L1_3 = Fn_captionView
  L2_4 = "sm03_03000"
  L1_3(L2_4)
  L1_3 = {
    L2_4,
    L3_5,
    L4_6
  }
  L2_4 = "a"
  L3_5 = "b"
  L4_6 = "c"
  L2_4 = {}
  L3_5 = {}
  L4_6 = {
    L5_7,
    L6_8,
    L7_9
  }
  L5_7 = {}
  L6_8 = {}
  L7_9 = {}
  L5_7 = {}
  L6_8 = {
    L7_9,
    L8_10,
    L9_11
  }
  L7_9 = 1
  L7_9 = {}
  for L11_13 = 1, #L1_3 do
    L12_14 = Fn_setNpcActive
    L13_15 = "robber_npc_"
    L13_15 = L13_15 .. L14_16
    L12_14(L13_15, L14_16)
    L12_14 = Fn_repeatPlayMotion
    L13_15 = "robber_npc_"
    L13_15 = L13_15 .. L14_16
    L12_14 = L12_14(L13_15, L14_16, L15_17)
    L5_7[L11_13] = L12_14
    L12_14 = 1
    while true do
      L13_15 = "locator2_chase_"
      L17_19 = "%02d"
      L18_20 = L6_8[L11_13]
      L13_15 = L13_15 .. L14_16 .. L15_17 .. L16_18
      if L14_16 ~= nil then
        L17_19 = L14_16
        L15_17[L12_14] = L16_18
        L12_14 = L12_14 + 1
      else
        break
      end
      L6_8[L11_13] = L15_17
    end
    L13_15 = "locator2_ve_"
    L13_15 = L13_15 .. L14_16
    L17_19 = "robber_ve"
    L18_20 = L11_13
    L17_19 = L17_19 .. L18_20
    L18_20 = L13_15
    L3_5[L11_13] = L15_17
    L2_4[L11_13] = L14_16
    L14_16(L15_17, L16_18)
    L14_16(L15_17, L16_18)
    L14_16(L15_17, L16_18)
    L7_9[L11_13] = L14_16
    do break end
    break
  end
  function L11_13()
    repeat
      if (_induce_up or _induce_down) and L9_11 then
        L8_10 = L8_10 + 1
      elseif not _induce_up or not _induce_down then
        L8_10 = 0
      end
      if L8_10 == 150 then
        if _induce_up then
          Fn_captionView("sm03_03017")
        elseif _induce_down then
          Fn_captionView("sm03_03018")
        end
        L9_11 = false
      end
      wait()
    until false
  end
  L11_13 = 0
  L12_14 = nil
  L13_15 = false
  while true do
    if L13_15 == true then
      L13_15 = false
      L12_14 = nil
    end
    if L12_14 == nil then
      if L14_16 then
        if L14_16 == nil then
          L12_14 = L14_16
        end
      end
    end
    for L17_19, L18_20 in L14_16(L15_17) do
      L19_21 = Mv_raycastCameraSight
      L20_22 = _puppet_tbl
      L21_23 = "robber_npc_"
      L22_24 = L18_20
      L21_23 = L21_23 .. L22_24
      L20_22 = L20_22[L21_23]
      L21_23 = 120
      L19_21 = L19_21(L20_22, L21_23)
      if L19_21 then
        _pop_route = L18_20
        L11_13 = L17_19
        L19_21 = stopSearch
        L19_21()
      end
    end
    if L14_16 ~= nil then
      L12_14 = L14_16
      break
    end
    L14_16()
  end
  L17_19 = "pop_id"
  L18_20 = L11_13
  L14_16(L15_17, L16_18, L17_19, L18_20)
  for L17_19, L18_20 in L14_16(L15_17) do
    if L17_19 ~= L11_13 then
      L19_21 = Mv_safeTaskAbort
      L20_22 = L18_20
      L19_21 = L19_21(L20_22)
      L18_20 = L19_21
      L19_21 = Mv_safeTaskAbort
      L20_22 = L7_9[L17_19]
      L19_21 = L19_21(L20_22)
      L7_9[L17_19] = L19_21
      L19_21 = Fn_disappearNpc
      L20_22 = "robber_npc_"
      L21_23 = L1_3[L17_19]
      L20_22 = L20_22 .. L21_23
      L19_21(L20_22)
      L19_21 = L2_4[L17_19]
      L20_22 = L19_21
      L19_21 = L19_21.setVisible
      L21_23 = false
      L19_21(L20_22, L21_23)
      L2_4[L17_19] = nil
      L3_5[L17_19] = nil
    end
  end
  L17_19 = _pop_route
  L17_19 = true
  L18_20 = false
  L15_17(L16_18, L17_19, L18_20)
  L15_17(L16_18)
  L15_17(L16_18)
  L17_19 = "robber_npc_"
  L18_20 = _pop_route
  L17_19 = L17_19 .. L18_20
  L15_17(L16_18)
  L17_19 = false
  L18_20 = false
  L15_17(L16_18, L17_19, L18_20)
  L15_17(L16_18)
  L17_19 = "pccubesensor2_robber_"
  L18_20 = _pop_route
  L17_19 = L17_19 .. L18_20
  L16_18(L17_19)
  L16_18()
  L17_19 = "pccubesensor2_robber_"
  L18_20 = _pop_route
  L17_19 = L17_19 .. L18_20
  L16_18(L17_19)
  L17_19 = "locator2_resetpos_"
  L18_20 = _pop_route
  L17_19 = L17_19 .. L18_20
  L16_18(L17_19)
  L17_19 = L5_7[L11_13]
  L5_7[L11_13] = L16_18
  L17_19 = L15_17
  L17_19 = L16_18
  L18_20 = true
  L19_21 = false
  L16_18(L17_19, L18_20, L19_21)
  L17_19 = L16_18
  L17_19 = Player
  L17_19 = L17_19.kAction_Float
  if L16_18 == L17_19 then
    L17_19 = L16_18
    L18_20 = Player
    L18_20 = L18_20.kAction_Float
    L19_21 = true
    L16_18(L17_19, L18_20, L19_21)
  end
  L17_19 = _puppet_tbl
  L18_20 = "robber_npc_"
  L19_21 = _pop_route
  L18_20 = L18_20 .. L19_21
  L17_19 = L17_19[L18_20]
  L18_20 = 0.5
  L19_21 = 1.5
  L17_19 = Fn_playMotionNpc
  L18_20 = "robber_npc_"
  L19_21 = _pop_route
  L18_20 = L18_20 .. L19_21
  L19_21 = "check_out_00"
  L20_22 = true
  L21_23 = {}
  L21_23.animBlendDuration = 0.5
  L17_19(L18_20, L19_21, L20_22, L21_23)
  L17_19 = Fn_turnNpc
  L18_20 = "robber_npc_"
  L19_21 = _pop_route
  L18_20 = L18_20 .. L19_21
  L17_19(L18_20)
  L17_19 = Fn_playMotionNpc
  L18_20 = "robber_npc_"
  L19_21 = _pop_route
  L18_20 = L18_20 .. L19_21
  L19_21 = "surprise"
  L20_22 = false
  L17_19(L18_20, L19_21, L20_22)
  L17_19 = waitSeconds
  L18_20 = 2
  L17_19(L18_20)
  L17_19 = Mv_safeTaskAbort
  L18_20 = L16_18
  L17_19 = L17_19(L18_20)
  L17_19 = Fn_pcSensorOff
  L18_20 = "pccubesensor2_far_d"
  L17_19(L18_20)
  L17_19 = Fn_pcSensorOff
  L18_20 = "pccubesensor2_warning_d"
  L17_19(L18_20)
  L17_19 = Fn_pcSensorOff
  L18_20 = "pccubesensor2_warp_d"
  L17_19(L18_20)
  L17_19 = Fn_kaiwaDemoView
  L18_20 = "sm03_01400k"
  L17_19(L18_20)
  L17_19 = Fn_moveNpc
  L18_20 = "robber_npc_"
  L19_21 = _pop_route
  L18_20 = L18_20 .. L19_21
  L19_21 = {L20_22}
  L20_22 = L0_2[L11_13]
  L20_22 = {}
  L20_22.runLength = -1
  L20_22.arrivedLength = 0
  L17_19 = L17_19(L18_20, L19_21, L20_22)
  L18_20 = "robber_npc_"
  L19_21 = _pop_route
  L18_20 = L18_20 .. L19_21
  _thief = L18_20
  while true do
    L18_20 = Mv_isSafeTaskRunning
    L19_21 = L17_19
    L18_20 = L18_20(L19_21)
    if L18_20 then
      L18_20 = wait
      L18_20()
    end
  end
  L18_20 = Fn_turnNpc
  L19_21 = _thief
  L20_22 = findGameObject2
  L21_23 = "Node"
  L22_24 = "locator2_turn_"
  L23_25 = _pop_route
  L22_24 = L22_24 .. L23_25
  L20_22 = L20_22(L21_23, L22_24)
  L21_23 = L20_22
  L20_22 = L20_22.getWorldPos
  L38_40 = L20_22(L21_23)
  L18_20(L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L20_22(L21_23))
  L18_20 = L2_4[L11_13]
  L19_21 = L18_20
  L18_20 = L18_20.setCollidable
  L20_22 = false
  L18_20(L19_21, L20_22)
  L18_20 = L2_4[L11_13]
  L19_21 = L18_20
  L18_20 = L18_20.setPilot
  L20_22 = _puppet_tbl
  L21_23 = "robber_npc_"
  L22_24 = _pop_route
  L21_23 = L21_23 .. L22_24
  L20_22 = L20_22[L21_23]
  L21_23 = "loc_driver1"
  L18_20(L19_21, L20_22, L21_23)
  L18_20 = Fn_findNpc
  L19_21 = "robber_npc_"
  L20_22 = _pop_route
  L19_21 = L19_21 .. L20_22
  L18_20 = L18_20(L19_21)
  L20_22 = L18_20
  L19_21 = L18_20.rideOnVehicle
  L19_21(L20_22)
  repeat
    L19_21 = wait
    L19_21()
    L20_22 = L18_20
    L19_21 = L18_20.isRideOnVehicle
    L19_21 = L19_21(L20_22)
  until L19_21
  L18_20 = nil
  L19_21 = L2_4[L11_13]
  L20_22 = L19_21
  L19_21 = L19_21.setCollidable
  L21_23 = true
  L19_21(L20_22, L21_23)
  L19_21 = Mv_safeTaskAbort
  L20_22 = L7_9[L11_13]
  L19_21 = L19_21(L20_22)
  L7_9[L11_13] = L19_21
  L19_21 = L2_4[L11_13]
  L20_22 = L19_21
  L19_21 = L19_21.setBaseSpeed
  L21_23 = 6
  L19_21(L20_22, L21_23)
  L19_21 = L2_4[L11_13]
  L20_22 = L19_21
  L19_21 = L19_21.setMomentRate
  L21_23 = 0.6
  L19_21(L20_22, L21_23)
  L19_21 = Mv_viewObjWait
  L20_22 = _puppet_tbl
  L21_23 = "robber_npc_"
  L22_24 = _pop_route
  L21_23 = L21_23 .. L22_24
  L20_22 = L20_22[L21_23]
  L21_23 = 0.5
  L22_24 = 1
  L19_21 = L19_21(L20_22, L21_23, L22_24)
  L20_22 = waitSeconds
  L21_23 = 1.2
  L20_22(L21_23)
  L20_22 = Mv_safeTaskAbort
  L21_23 = L19_21
  L20_22 = L20_22(L21_23)
  L19_21 = L20_22
  L20_22 = Player
  L21_23 = L20_22
  L20_22 = L20_22.setStay
  L22_24 = false
  L23_25 = false
  L20_22(L21_23, L22_24, L23_25)
  L20_22 = createGameObject2
  L21_23 = "PlayerSensor"
  L20_22 = L20_22(L21_23)
  L22_24 = L20_22
  L21_23 = L20_22.setDetectBehavior
  L23_25 = 1
  L21_23(L22_24, L23_25)
  L22_24 = L20_22
  L21_23 = L20_22.addBox
  L23_25 = Vector
  L24_26 = 8
  L25_27 = 8
  L26_28 = 8
  L38_40 = L23_25(L24_26, L25_27, L26_28)
  L21_23(L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L23_25(L24_26, L25_27, L26_28))
  L22_24 = L20_22
  L21_23 = L20_22.setPos
  L23_25 = Vector
  L24_26 = 0
  L25_27 = 0
  L26_28 = 0
  L38_40 = L23_25(L24_26, L25_27, L26_28)
  L21_23(L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L23_25(L24_26, L25_27, L26_28))
  L22_24 = L20_22
  L21_23 = L20_22.setOnEnter
  L23_25 = "thief_sensor_01_OnEnter"
  L21_23(L22_24, L23_25)
  L22_24 = L20_22
  L21_23 = L20_22.setOnLeave
  L23_25 = "thief_sensor_01_OnLeave"
  L21_23(L22_24, L23_25)
  L21_23 = _puppet_tbl
  L22_24 = "robber_npc_"
  L23_25 = _pop_route
  L22_24 = L22_24 .. L23_25
  L21_23 = L21_23[L22_24]
  L22_24 = L21_23
  L21_23 = L21_23.appendChild
  L23_25 = L20_22
  L21_23(L22_24, L23_25)
  L22_24 = L20_22
  L21_23 = L20_22.try_init
  L21_23(L22_24)
  L22_24 = L20_22
  L21_23 = L20_22.waitForReady
  L21_23(L22_24)
  L22_24 = L20_22
  L21_23 = L20_22.try_start
  L21_23(L22_24)
  L21_23 = invokeTask
  function L22_24()
    waitSeconds(5)
    L20_22:setActive(true)
  end
  L21_23(L22_24)
  L21_23 = {}
  function L22_24(A0_41, A1_42, A2_43)
    local L3_44, L4_45, L5_46
    L4_45 = A0_41
    L3_44 = A0_41.getName
    L3_44 = L3_44(L4_45)
    L4_45 = createGameObject2
    L5_46 = "Gem"
    L4_45 = L4_45(L5_46)
    L5_46 = L4_45.setGemModelNo
    L5_46(L4_45, A1_42)
    L5_46 = A0_41.getWorldPos
    L5_46 = L5_46(A0_41)
    L5_46 = L5_46 + Vector(0, 0 + A2_43, 0)
    L4_45:setWorldPos(L5_46)
    L4_45:setForceMove()
    L4_45:setVisibleBlockHalfSize(150)
    L4_45:setVisible(true)
    L4_45:try_init()
    L4_45:waitForReadyAsync(function()
      L4_45:try_start()
    end)
    return L4_45
  end
  function L23_25()
    local L0_47, L2_48
    for _FORV_3_ = 1, L2_48 - 1 do
      if _FORV_3_ % 2 == 0 then
        L21_23[_FORV_3_]:kill()
        L21_23[_FORV_3_] = nil
      end
    end
  end
  L24_26 = L2_4[L11_13]
  L25_27 = L24_26
  L24_26 = L24_26.setBaseSpeed
  L26_28 = SPEED_FIRST
  L24_26(L25_27, L26_28)
  L24_26 = invokeTask
  function L25_27()
    while true do
      if L2_4[L11_13]:getRemainingDist() <= 3 then
        L2_4[L11_13]:attach(L3_5[L11_13])
        L2_4[L11_13]:setBaseSpeed(SPEED_AGAIN)
      end
      wait()
    end
  end
  L24_26 = L24_26(L25_27)
  L25_27 = 0
  L26_28 = false
  L27_29 = invokeTask
  function L28_30()
    while true do
      if L26_28 then
        if Mv_raycastCameraSight(L2_4[L11_13], 150) then
          L25_27 = 0
        end
        waitSeconds(1)
        if not Mv_raycastCameraSight(L2_4[L11_13], 150) then
          L25_27 = L25_27 + 1
          print("not_insight_time = " .. L25_27)
        end
      end
      wait()
    end
  end
  L27_29 = L27_29(L28_30)
  L28_30 = nil
  while true do
    while true do
      for L32_34 = 1, L30_32 - 1 do
        L33_35 = L32_34 % 2
        if L33_35 == 0 then
          L33_35 = RandI
          L34_36 = -2
          L35_37 = 2
          L33_35 = L33_35(L34_36, L35_37)
          L34_36 = L22_24
          L35_37 = findGameObject2
          L36_38 = "Node"
          L37_39 = "locator2_chase_"
          L38_40 = _pop_route
          L37_39 = L37_39 .. L38_40 .. "_" .. string.format("%02d", L32_34)
          L35_37 = L35_37(L36_38, L37_39)
          L36_38 = 4
          L37_39 = L33_35
          L34_36 = L34_36(L35_37, L36_38, L37_39)
          L21_23[L32_34] = L34_36
        end
      end
      L32_34 = "robber_npc_"
      L33_35 = _pop_route
      L32_34 = L32_34 .. L33_35
      L32_34 = "sm03_03003"
      L30_32(L31_33)
      L26_28 = true
      L32_34 = invokeTask
      function L33_35()
        while Mv_isWaitPhase() do
          if L30_32 == TIMER_01 then
            Fn_captionViewWait("sm03_03005")
          elseif L30_32 == TIMER_02 then
            Fn_captionViewWait("sm03_03006")
            L30_32 = 0
          end
          L30_32 = L30_32 + 1
          waitSeconds(1)
        end
      end
      L32_34 = L32_34(L33_35)
      _rob_cap_task = L32_34
      while true do
        L32_34 = _is_success
        if L32_34 == true then
          L32_34 = Mv_safeTaskAbort
          L33_35 = L27_29
          L32_34 = L32_34(L33_35)
          L27_29 = L32_34
          L32_34 = Mv_safeTaskAbort
          L33_35 = _thief_cap_task
          L32_34 = L32_34(L33_35)
          _thief_cap_task = L32_34
          L33_35 = L20_22
          L32_34 = L20_22.setActive
          L34_36 = false
          L32_34(L33_35, L34_36)
          L32_34 = Fn_tutorialCaptionKill
          L32_34()
          L32_34 = Player
          L33_35 = L32_34
          L32_34 = L32_34.setStay
          L34_36 = true
          L35_37 = false
          L32_34(L33_35, L34_36, L35_37)
          L32_34 = invokeTask
          function L33_35()
            L28_30 = Mv_viewObjWait(L2_4[L11_13], 0.5, 1.5)
          end
          L32_34(L33_35)
          L32_34 = Fn_naviKill
          L32_34()
          L32_34 = Mv_gotoNextPhase
          L32_34()
          L32_34 = wait
          L32_34()
          break
        end
        L32_34 = Fn_getDistanceToPlayer
        L33_35 = _puppet_tbl
        L34_36 = "robber_npc_"
        L35_37 = _pop_route
        L34_36 = L34_36 .. L35_37
        L33_35 = L33_35[L34_36]
        L32_34 = L32_34(L33_35)
        L33_35 = DISTANCE_CAP
        if L32_34 < L33_35 and not L31_33 and L30_32 > 5 then
          L33_35 = _rob_cap_task
          L34_36 = L33_35
          L33_35 = L33_35.abort
          L33_35(L34_36)
          L33_35 = Fn_captionViewWait
          L34_36 = "sm03_03007"
          L33_35(L34_36)
        end
        L33_35 = _is_success
        if L33_35 == false then
          L33_35 = DISTANCE_RETRY
          if not (L32_34 > L33_35) then
            L33_35 = MISS_TIME
          elseif L25_27 >= L33_35 then
            L26_28 = false
            L33_35 = Fn_naviKill
            L33_35()
            L33_35 = _rob_cap_task
            L34_36 = L33_35
            L33_35 = L33_35.abort
            L33_35(L34_36)
            L33_35 = Fn_setNpcActive
            L34_36 = "robber_npc_"
            L35_37 = _pop_route
            L34_36 = L34_36 .. L35_37
            L35_37 = false
            L33_35(L34_36, L35_37)
            L33_35 = Fn_setAlpha
            L34_36 = L2_4[L11_13]
            L35_37 = false
            L36_38 = 0.5
            L37_39 = 10
            L33_35(L34_36, L35_37, L36_38, L37_39)
            L33_35 = L2_4[L11_13]
            L34_36 = L33_35
            L33_35 = L33_35.setVisible
            L35_37 = false
            L33_35(L34_36, L35_37)
            L33_35 = L2_4[L11_13]
            L34_36 = L33_35
            L33_35 = L33_35.setBaseSpeed
            L35_37 = 0
            L33_35(L34_36, L35_37)
            L34_36 = L20_22
            L33_35 = L20_22.setActive
            L35_37 = false
            L33_35(L34_36, L35_37)
            L33_35 = Fn_tutorialCaptionKill
            L33_35()
            L33_35 = Fn_captionViewWait
            L34_36 = "sm03_03008"
            L33_35(L34_36)
            L33_35 = waitSeconds
            L34_36 = 1
            L33_35(L34_36)
            break
          end
        end
        L33_35 = wait
        L33_35()
      end
      L32_34 = Mv_isWaitPhase
      L32_34 = L32_34()
      if L32_34 then
        L32_34 = Fn_blackout
        L32_34()
        L32_34 = Fn_userCtrlAllOff
        L32_34()
        L32_34 = Camera
        L33_35 = L32_34
        L32_34 = L32_34.setControl
        L34_36 = Camera
        L34_36 = L34_36.kPlayer
        L35_37 = Camera
        L35_37 = L35_37.kControl_All
        L36_38 = false
        L32_34(L33_35, L34_36, L35_37, L36_38)
        L32_34 = L23_25
        L32_34()
        L32_34 = Fn_resetPcPos
        L33_35 = "locator2_resetpos_"
        L34_36 = _pop_route
        L33_35 = L33_35 .. L34_36
        L32_34(L33_35)
        L32_34 = findGameObject2
        L33_35 = "Node"
        L34_36 = "locator2_chase_"
        L35_37 = _pop_route
        L36_38 = "_01"
        L34_36 = L34_36 .. L35_37 .. L36_38
        L32_34 = L32_34(L33_35, L34_36)
        L33_35 = L2_4[L11_13]
        L34_36 = L33_35
        L33_35 = L33_35.setWorldTransform
        L36_38 = L32_34
        L35_37 = L32_34.getWorldTransform
        L38_40 = L35_37(L36_38)
        L33_35(L34_36, L35_37, L36_38, L37_39, L38_40, L35_37(L36_38))
        L25_27 = 0
        L33_35 = Fn_setNpcActive
        L34_36 = "robber_npc_"
        L35_37 = _pop_route
        L34_36 = L34_36 .. L35_37
        L35_37 = true
        L33_35(L34_36, L35_37)
        L33_35 = Fn_setAlpha
        L34_36 = L2_4[L11_13]
        L35_37 = true
        L36_38 = 0.2
        L37_39 = 1
        L33_35(L34_36, L35_37, L36_38, L37_39)
        L33_35 = L2_4[L11_13]
        L34_36 = L33_35
        L33_35 = L33_35.setVisible
        L35_37 = true
        L33_35(L34_36, L35_37)
        L33_35 = L2_4[L11_13]
        L34_36 = L33_35
        L33_35 = L33_35.attach
        L35_37 = L3_5[L11_13]
        L33_35(L34_36, L35_37)
        L33_35 = L2_4[L11_13]
        L34_36 = L33_35
        L33_35 = L33_35.setBaseSpeed
        L35_37 = 10
        L33_35(L34_36, L35_37)
        L33_35 = Fn_fadein
        L33_35()
        L33_35 = Camera
        L34_36 = L33_35
        L33_35 = L33_35.setControl
        L35_37 = Camera
        L35_37 = L35_37.kPlayer
        L36_38 = Camera
        L36_38 = L36_38.kControl_All
        L37_39 = true
        L33_35(L34_36, L35_37, L36_38, L37_39)
        L33_35 = Mv_viewObjWait
        L34_36 = _puppet_tbl
        L35_37 = "robber_npc_"
        L36_38 = _pop_route
        L35_37 = L35_37 .. L36_38
        L34_36 = L34_36[L35_37]
        L35_37 = 0.5
        L36_38 = 1
        L33_35 = L33_35(L34_36, L35_37, L36_38)
        L19_21 = L33_35
        L33_35 = waitSeconds
        L34_36 = 0.8
        L33_35(L34_36)
        L33_35 = Mv_safeTaskAbort
        L34_36 = L19_21
        L33_35 = L33_35(L34_36)
        L19_21 = L33_35
        L33_35 = Fn_userCtrlOn
        L33_35()
        L33_35 = invokeTask
        function L34_36()
          waitSeconds(5)
          if not _is_success then
            L20_22:setActive(true)
          end
        end
        L33_35(L34_36)
      end
    end
  end
  L29_31()
  _rob_cap_task = L29_31
  L24_26 = L29_31
  L29_31(L30_32, L31_33)
  L29_31()
  L29_31()
  L29_31(L30_32)
  L29_31()
  L32_34 = "getBackgroundElement2Handle"
  L33_35 = "port"
  L32_34 = L30_32
  L33_35 = "po_a_02"
  L32_34 = L2_4[L11_13]
  L33_35 = L32_34
  L32_34 = L32_34.releasePilot
  L34_36 = _puppet_tbl
  L35_37 = "robber_npc_"
  L36_38 = _pop_route
  L35_37 = L35_37 .. L36_38
  L34_36 = L34_36[L35_37]
  L35_37 = L31_33
  L32_34(L33_35, L34_36, L35_37)
  L32_34 = Fn_setGrabNpc
  L33_35 = "robber_npc_"
  L34_36 = _pop_route
  L33_35 = L33_35 .. L34_36
  L34_36 = false
  L35_37 = false
  L32_34(L33_35, L34_36, L35_37)
  L32_34 = Player
  L33_35 = L32_34
  L32_34 = L32_34.setGrabObject
  L34_36 = _puppet_tbl
  L35_37 = "robber_npc_"
  L36_38 = _pop_route
  L35_37 = L35_37 .. L36_38
  L34_36 = L34_36[L35_37]
  L32_34(L33_35, L34_36)
  L32_34 = Sound
  L33_35 = L32_34
  L32_34 = L32_34.playSE
  L34_36 = "m16_936"
  L35_37 = 1
  L36_38 = ""
  L37_39 = _puppet_tbl
  L38_40 = "robber_npc_"
  L38_40 = L38_40 .. _pop_route
  L37_39 = L37_39[L38_40]
  L32_34(L33_35, L34_36, L35_37, L36_38, L37_39)
  L32_34 = waitSeconds
  L33_35 = 1.8
  L32_34(L33_35)
  L32_34 = Fn_createEffect
  L33_35 = "exp2"
  L34_36 = "ef_com_exp_01"
  L35_37 = L2_4[L11_13]
  L36_38 = false
  L32_34 = L32_34(L33_35, L34_36, L35_37, L36_38)
  L33_35 = Fn_createEffect
  L34_36 = "smoke"
  L35_37 = "ef_bg_ent_00a"
  L36_38 = L2_4[L11_13]
  L37_39 = false
  L33_35 = L33_35(L34_36, L35_37, L36_38, L37_39)
  L34_36 = Sound
  L35_37 = L34_36
  L34_36 = L34_36.playSE
  L36_38 = "ene_robot_missile_hit"
  L34_36(L35_37, L36_38)
  L34_36 = Mv_safeTaskAbort
  L35_37 = L28_30
  L34_36 = L34_36(L35_37)
  L28_30 = L34_36
  L34_36 = waitSeconds
  L35_37 = 0.5
  L34_36(L35_37)
  L34_36 = invokeTask
  function L35_37()
    Fn_setAlpha(L2_4[L11_13], false, 1, 10)
    L2_4[L11_13]:setVisible(false)
  end
  L34_36(L35_37)
  L34_36 = waitSeconds
  L35_37 = 1.5
  L34_36(L35_37)
  L34_36 = Fn_kaiwaDemoView
  L35_37 = "sm03_01500k"
  L34_36(L35_37)
  if L32_34 ~= nil then
    L34_36 = Fn_setAlpha
    L35_37 = L32_34
    L36_38 = false
    L37_39 = 1
    L38_40 = 1
    L34_36(L35_37, L36_38, L37_39, L38_40)
    L35_37 = L32_34
    L34_36 = L32_34.stop
    L34_36(L35_37)
    L35_37 = L32_34
    L34_36 = L32_34.setActive
    L36_38 = false
    L34_36(L35_37, L36_38)
    L35_37 = L32_34
    L34_36 = L32_34.kill
    L34_36(L35_37)
    L32_34 = nil
  end
  if L33_35 ~= nil then
    L34_36 = Fn_setAlpha
    L35_37 = L33_35
    L36_38 = false
    L37_39 = 1
    L38_40 = 1
    L34_36(L35_37, L36_38, L37_39, L38_40)
    L35_37 = L33_35
    L34_36 = L33_35.stop
    L34_36(L35_37)
    L35_37 = L33_35
    L34_36 = L33_35.setActive
    L36_38 = false
    L34_36(L35_37, L36_38)
    L35_37 = L33_35
    L34_36 = L33_35.kill
    L34_36(L35_37)
    L33_35 = nil
  end
  L34_36 = Player
  L35_37 = L34_36
  L34_36 = L34_36.setStay
  L36_38 = false
  L37_39 = false
  L34_36(L35_37, L36_38, L37_39)
  L34_36 = Fn_userCtrlOn
  L34_36()
  L34_36 = Mv_invokeMissionViewNaviCaption
  L35_37 = "sm03_03009"
  L36_38 = _puppet_tbl
  L36_38 = L36_38.haikanko_01
  L34_36 = L34_36(L35_37, L36_38)
  L35_37 = Fn_pcSensorOn
  L36_38 = "pccubesensor2_return_haikanko_area"
  L35_37(L36_38)
  L35_37 = Fn_pcSensorOn
  L36_38 = "pccubesensor2_far_d"
  L35_37(L36_38)
  L35_37 = Fn_pcSensorOn
  L36_38 = "pccubesensor2_warning_d"
  L35_37(L36_38)
  L35_37 = Fn_pcSensorOn
  L36_38 = "pccubesensor2_warp_d"
  L35_37(L36_38)
  _go_back = true
  L35_37 = 0
  L36_38 = invokeTask
  function L37_39()
    while Mv_isWaitPhase() do
      if L35_37 == 5 then
        Fn_captionView("sm03_03010")
      elseif L35_37 == 20 then
        Fn_captionView("sm03_03011")
      end
      L35_37 = L35_37 + 1
      if _cat_warp then
        repeat
          wait()
        until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false
        Fn_warpNpc("robber_npc_" .. _pop_route, "locator2_resetpos_" .. _pop_route)
        while Player:setGrabObject(_puppet_tbl["robber_npc_" .. _pop_route]) == false do
          wait()
        end
        L35_37 = 0
        _cat_warp = false
      end
      waitSeconds(1)
    end
  end
  L36_38 = L36_38(L37_39)
  L37_39 = Mv_waitPhase
  L37_39()
  L37_39 = Mv_safeTaskAbort
  L38_40 = L36_38
  L37_39 = L37_39(L38_40)
  L36_38 = L37_39
  L37_39 = Fn_blackout
  L37_39()
  L37_39 = Fn_userCtrlAllOff
  L37_39()
  L37_39 = Fn_pcSensorOff
  L38_40 = "pccubesensor2_far_d"
  L37_39(L38_40)
  L37_39 = Fn_pcSensorOff
  L38_40 = "pccubesensor2_warning_d"
  L37_39(L38_40)
  L37_39 = Fn_pcSensorOff
  L38_40 = "pccubesensor2_warp_d"
  L37_39(L38_40)
  L37_39 = Fn_setGrabReleaseNpc
  L38_40 = "robber_npc_"
  L38_40 = L38_40 .. _pop_route
  L37_39(L38_40)
  L37_39 = waitSeconds
  L38_40 = 2
  L37_39(L38_40)
  L37_39 = Fn_playMotionNpc
  L38_40 = "robber_npc_"
  L38_40 = L38_40 .. _pop_route
  L37_39(L38_40, "breath_00", false)
  L37_39 = Fn_playMotionNpc
  L38_40 = "haikanko_01"
  L37_39(L38_40, "stay", false)
  L37_39 = Fn_warpNpc
  L38_40 = "haikanko_01"
  L37_39(L38_40, "locator2_haikanko_01_d")
  L37_39 = Fn_warpNpc
  L38_40 = "robber_npc_"
  L38_40 = L38_40 .. _pop_route
  L37_39(L38_40, "locator2_rob_release")
  L37_39 = Fn_resetPcPos
  L38_40 = "locator2_pc_start_pos"
  L37_39(L38_40)
  L37_39 = Fn_fadein
  L37_39()
  L37_39 = waitSeconds
  L38_40 = 1
  L37_39(L38_40)
  L37_39 = Fn_kaiwaDemoView
  L38_40 = "sm03_01600k"
  L37_39(L38_40)
  L37_39 = waitSeconds
  L38_40 = 1
  L37_39(L38_40)
  L37_39 = Fn_blackout
  L37_39()
  L37_39 = Fn_disappearNpc
  L38_40 = "haikanko_01"
  L37_39(L38_40)
  L37_39 = Fn_disappearNpc
  L38_40 = "robber_npc_"
  L38_40 = L38_40 .. _pop_route
  L37_39(L38_40)
  L37_39 = Fn_userCtrlAllOff
  L37_39()
  L37_39 = waitSeconds
  L38_40 = 2
  L37_39(L38_40)
  L37_39 = Fn_resetPcPos
  L38_40 = "locator2_cidfront_d"
  L37_39(L38_40)
  L37_39 = Fn_warpNpc
  L38_40 = "sm03_client"
  L37_39(L38_40, "locator2_client_reset")
  L37_39 = Fn_getGameObject
  L38_40 = "npcManager"
  L37_39 = L37_39(L38_40)
  L38_40 = L37_39.createGameObject2
  L38_40 = L38_40(L37_39, "GimmickBg")
  L38_40:setName("ciguitar01")
  holdObject(L38_40, _cid_puppet, "ciguitar01_base", "loc_l_hand")
  _sdemo_cut04:set("locator2_sdemo_cam_d", "locator2_sdemo_aim_d")
  _sdemo_cut04:play()
  ;({})[1] = Fn_playLoopMotionInsert("hum_01", "stay_00", {
    "talk_laugh_01"
  }, 5, 5)
  ;({})[2] = Fn_playLoopMotionInsert("hum_02", "listen_00", {"caress_00"}, 3, 6)
  waitSeconds(0.7)
  ;({})[5] = Fn_playLoopMotionInsert("hum_05", "listen_00", {"handclap"}, 5, 5)
  waitSeconds(1)
  Fn_fadein()
  Sound:playSE("sm03_guitar", 1, "", _cid_puppet)
  waitSeconds(3)
  function kaiwa_func()
    local L0_49, L1_50
    L0_49 = Fn_warpNpc
    L1_50 = "hum_03"
    L0_49(L1_50, "locator2_chi_direction_01")
    L0_49 = Fn_warpNpc
    L1_50 = "hum_04"
    L0_49(L1_50, "locator2_chi_direction_02")
    L0_49 = L37_39
    L1_50 = L0_49
    L0_49 = L0_49.createGameObject2
    L0_49 = L0_49(L1_50, "GimmickBg")
    L1_50 = L0_49.setName
    L1_50(L0_49, "cimagichand01_01")
    L1_50 = holdObject
    L1_50(L0_49, Fn_findNpcPuppet("hum_03"), "cimagichand01_base", "loc_r_hand")
    L1_50 = L37_39
    L1_50 = L1_50.createGameObject2
    L1_50 = L1_50(L1_50, "GimmickBg")
    L1_50:setName("cimagichand01_02")
    holdObject(L1_50, Fn_findNpcPuppet("hum_04"), "cimagichand01_base", "loc_r_hand")
    Fn_playMotionNpc("hum_03", "chi01_magichand_00", false, {
      isRandom = true,
      isRepeat = true,
      animBlendDuration = 0.5
    })
    Fn_playMotionNpc("hum_04", "chi01_sq_magichand_00", false, {
      isRandom = true,
      isRepeat = true,
      animBlendDuration = 0.5
    })
  end
  Fn_kaiwaDemoView2("sm03_01700k", kaiwa_func)
  _sdemo_cut04:stop(1)
  waitSeconds(1)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_51, L1_52
end
function pccubesensor2_robber_OnEnter()
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function thief_sensor_01_OnEnter(A0_53)
  _is_in_sensor = true
  if Fn_findNpc("robber_npc_" .. _pop_route):isGrabbed() == false then
    Fn_tutorialCaption("grab")
  end
  if _thief_cap_task == nil then
    _thief_cap_task = invokeTask(function()
      while true do
        if Pad:getButton(Pad.kButton_RR) and _is_in_sensor then
          _is_success = true
          Fn_captionViewEnd()
          break
        end
        wait()
      end
    end)
  end
end
function thief_sensor_01_OnLeave(A0_54)
  _is_in_sensor = false
  Fn_tutorialCaptionKill()
end
function setSearchNavi()
  local L0_55, L1_56, L2_57, L3_58, L4_59
  L0_55 = {}
  for L4_59 = 1, MNAVI_MAX do
    L0_55[L4_59] = findGameObject2("Node", "pccubesensor2_island_navi_" .. string.format("%02d", L4_59))
    _mnavi_hdl[L4_59] = HUD:mnaviNew({
      name = "mnavi_" .. L4_59,
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    })
    _mnavi_hdl[L4_59]:setTarget(L0_55[L4_59])
    _mnavi_hdl[L4_59]:setActive(true)
  end
end
function stopInduce()
  Fn_pcSensorOff("pccubesensor2_over_up_a")
  Fn_pcSensorOff("pccubesensor2_over_down_a")
  Fn_pcSensorOff("pccubesensor2_over_up_b")
  Fn_pcSensorOff("pccubesensor2_over_down_b")
  Fn_pcSensorOff("pccubesensor2_over_up_c")
  Fn_pcSensorOff("pccubesensor2_over_down_c")
end
function stopSearch()
  Fn_pcSensorOff("pccubesensor2_island_navi_01")
  Fn_pcSensorOff("pccubesensor2_island_navi_02")
  Fn_pcSensorOff("pccubesensor2_island_navi_03")
  stopInduce()
  for _FORV_3_ = 1, MNAVI_MAX do
    _mnavi_hdl[_FORV_3_]:setActive(false)
  end
end
function inSearchSensor()
  for _FORV_3_ = 1, MNAVI_MAX do
    _mnavi_hdl[_FORV_3_]:setActive(false)
  end
  Fn_captionView("sm03_03016")
  _caption_on = true
  _in_one_island = true
end
function outSearchSensor()
  setSearchNavi()
  stopInduce()
  Fn_captionView("sm03_03013")
  _in_one_island = false
  _in_same_island = false
end
function pccubesensor2_island_navi_01_OnLeave()
  outSearchSensor()
end
function pccubesensor2_island_navi_02_OnLeave()
  outSearchSensor()
end
function pccubesensor2_island_navi_03_OnLeave()
  outSearchSensor()
end
function pccubesensor2_island_navi_01_OnEnter()
  inSearchSensor()
  Fn_pcSensorOn("pccubesensor2_over_up_a")
  Fn_pcSensorOn("pccubesensor2_over_down_a")
end
function pccubesensor2_island_navi_02_OnEnter()
  inSearchSensor()
  Fn_pcSensorOn("pccubesensor2_over_up_b")
  Fn_pcSensorOn("pccubesensor2_over_down_b")
end
function pccubesensor2_island_navi_03_OnEnter()
  inSearchSensor()
  Fn_pcSensorOn("pccubesensor2_over_up_c")
  Fn_pcSensorOn("pccubesensor2_over_down_c")
end
function pccubesensor2_over_up_OnEnter()
  local L0_60, L1_61
  _induce_up = true
end
function pccubesensor2_over_up_OnLeave()
  local L0_62, L1_63
  _induce_up = false
end
function pccubesensor2_over_down_OnEnter()
  local L0_64, L1_65
  _induce_down = true
end
function pccubesensor2_over_down_OnLeave()
  local L0_66, L1_67
  _induce_down = false
end
function pccubesensor2_far_d_OnLeave()
  if not _go_back then
    Fn_captionView("sm03_03021")
  else
    Fn_captionView("sm03_03022")
  end
end
function pccubesensor2_warning_d_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm03_03015")
  Player:setStay(false, false)
end
function pccubesensor2_warp_d_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    _cat_warp = true
  end)
end
function pccubesensor2_return_haikanko_area_OnEnter()
  Fn_pcSensorOff("pccubesensor2_return_haikanko_area")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
