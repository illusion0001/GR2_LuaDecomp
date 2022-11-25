import("Debug")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm03_common.lua")
_puppet_tbl = {}
_cid_talk_task = nil
_cid_talk_flg = false
_catwarp_reset = false
_is_bag_arrived = false
_near_kenka = false
_in_boatman04_sensor = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_baggages_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_c")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_c")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_c")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_last")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_last")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_last")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_kenka_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_pier_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_cid_talk_area_c")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_near_haikanko_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_haikanko_area")
  L0_0 = {
    {
      name = "boatman_01",
      type = "man41",
      node = "locator2_boatman_01_c",
      reset = false
    },
    {
      name = "boatman_02",
      type = "man33",
      node = "locator2_boatman_02_c"
    },
    {
      name = "boatman_03",
      type = "man40",
      node = "locator2_boatman_03_c"
    },
    {
      name = "boatman_04",
      type = "man39",
      node = "locator2_boatman_04_c",
      reset = false
    },
    {
      name = "boatmantalk",
      type = "man40",
      node = "locator2_boatmantalk_01_c",
      reset = false
    },
    {
      name = "boatmanrich",
      type = "man49",
      node = "locator2_boatmanrich_01"
    },
    {
      name = "gaw_01",
      type = "man34",
      node = "locator2_gaw_banga_01",
      active = false
    },
    {
      name = "chi_01",
      type = "chi11",
      node = "locator2_chi_cidtalk_01",
      active = false
    },
    {
      name = "chi_02",
      type = "chi12",
      node = "locator2_chi_cidtalk_02",
      active = false
    },
    {
      name = "haikanko_01",
      type = "man38",
      node = "locator2_haikanko_01",
      active = false,
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _cid_puppet = Fn_findNpcPuppet("sm03_client")
  _sdemo_cut01 = SDemo.create("sm03_c_cut01")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33
  L0_1 = Fn_findNpc
  L1_2 = "boatman_01"
  L0_1 = L0_1(L1_2)
  if L0_1 ~= nil then
    L0_1 = Fn_playMotionNpc
    L1_2 = "boatman_04"
    L2_3 = "sit_floor_01"
    L3_4 = false
    L0_1(L1_2, L2_3, L3_4)
  end
  L0_1 = Fn_sendEventComSb
  L1_2 = "isShipStart"
  L0_1 = L0_1(L1_2)
  if not L0_1 then
    L0_1 = Fn_sendEventComSb
    L1_2 = "requestShipSpeedUp"
    L0_1(L1_2)
  end
  L0_1 = createGameObject2
  L1_2 = "GimmickBg"
  L0_1 = L0_1(L1_2)
  L1_2 = holdObject
  L2_3 = L0_1
  L3_4 = _puppet_tbl
  L3_4 = L3_4.boatman_03
  L4_5 = "cimemo01_base"
  L5_6 = "loc_l_hand"
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = Fn_playMotionNpc
  L2_3 = "boatman_02"
  L3_4 = "check_00"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Fn_playMotionNpc
  L2_3 = "boatman_03"
  L3_4 = "count_00"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = createGameObject2
  L2_3 = "PlayerSensor"
  L1_2 = L1_2(L2_3)
  _boatman04_sensor = L1_2
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setDetectBehavior
  L3_4 = 1
  L1_2(L2_3, L3_4)
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.addBox
  L3_4 = Vector
  L4_5 = 3
  L5_6 = 3
  L6_7 = 3
  L32_33 = L3_4(L4_5, L5_6, L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L3_4(L4_5, L5_6, L6_7))
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setPos
  L3_4 = Vector
  L4_5 = 0
  L5_6 = 0
  L6_7 = 0
  L32_33 = L3_4(L4_5, L5_6, L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L3_4(L4_5, L5_6, L6_7))
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setOnEnter
  L3_4 = "_boatman04_sensorOnEnter"
  L1_2(L2_3, L3_4)
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setOnLeave
  L3_4 = "_boatman04_sensorOnLeave"
  L1_2(L2_3, L3_4)
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.setActive
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = _puppet_tbl
  L1_2 = L1_2.boatman_04
  L2_3 = L1_2
  L1_2 = L1_2.appendChild
  L3_4 = _boatman04_sensor
  L1_2(L2_3, L3_4)
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.try_init
  L1_2(L2_3)
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.waitForReady
  L1_2(L2_3)
  L1_2 = _boatman04_sensor
  L2_3 = L1_2
  L1_2 = L1_2.try_start
  L1_2(L2_3)
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_setCatWarpCheckPoint
  L2_3 = "locator2_pc_start_pos"
  L1_2(L2_3)
  L1_2 = Fn_playMotionNpc
  L2_3 = "boatmantalk"
  L3_4 = "lookaround_01"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2, L2_3, L3_4, L4_5 = nil, nil, nil, nil
  L5_6 = false
  L6_7 = Fn_missionView
  L7_8 = "sm03_02015"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 1.3
  L6_7(L7_8)
  L6_7 = Fn_sendEventComSb
  L7_8 = "requestGrabNavi"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 2.5
  L6_7(L7_8)
  L6_7 = Fn_captionView
  L7_8 = "sm03_02000"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 3
  L6_7(L7_8)
  L6_7 = Fn_sendEventComSb
  L7_8 = "requestTutorialCaption"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_baggages_area"
  L6_7(L7_8)
  L6_7 = 0
  L7_8 = false
  L8_9 = true
  function L9_10()
    L6_7 = 10
    Fn_pcSensorOn("pccubesensor2_baggages_area")
    Fn_sendEventComSb("requestReset")
    Fn_sendEventComSb("requestShipSpeedUp")
    Fn_turnNpc("boatman_01", "locator2_boatmantalk_01_c")
    Fn_turnNpc("boatmantalk", _puppet_tbl.boatman_01)
    L1_2 = Fn_playLoopMotionInsert("boatman_01", "talk_angry_00", {
      "talk_sad_02"
    }, 3, 5)
    L2_3 = Fn_playLoopMotionInsert("boatmantalk", "talk_sad_00", {
      "talk_angry_02"
    }, 6, 7)
    L7_8 = true
  end
  L10_11 = invokeTask
  function L11_12()
    while true do
      if Fn_sendEventComSb("isBoxBroken") then
        _boatman04_sensor:setActive(false)
        Player:setStay(true, false)
        Fn_userCtrlOff()
        Mv_viewObj(_puppet_tbl.boatman_01, 0.5, 1.5)
        L1_2 = Mv_safeTaskAbort(L1_2)
        L2_3 = Mv_safeTaskAbort(L2_3)
        Fn_turnNpc("boatman_01")
        Fn_turnNpc("boatmantalk")
        invokeTask(function()
          Fn_playMotionNpc("boatman_01", "talk_angry_00", false)
        end)
        Fn_playMotionNpc("boatmantalk", "talk_sad_02", false)
        Fn_captionViewWait("sm03_02028")
        waitSeconds(1)
        Fn_blackout()
        Fn_resetPcPos("locator2_pc_start_pos")
        L9_10()
        waitSeconds(1)
        Fn_fadein()
        Player:setStay(false, false)
        Fn_userCtrlOn()
        L8_9 = true
        Fn_missionView("sm03_02015")
        waitSeconds(1.3)
        Fn_sendEventComSb("requestGrabNavi")
        L6_7 = 0
      end
      if _catwarp_reset then
        _catwarp_reset = false
        _boatman04_sensor:setActive(false)
        Fn_naviKill()
        Fn_catWarp(nil, nil, L9_10())
        while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
          wait()
        end
        waitSeconds(2)
        L8_9 = true
        Fn_missionView("sm03_02015")
        waitSeconds(1.3)
        Fn_sendEventComSb("requestGrabNavi")
        L6_7 = 0
      end
      wait()
    end
  end
  L10_11 = L10_11(L11_12)
  L11_12 = invokeTask
  function L12_13()
    local L0_34
    L0_34 = Fn_moveNpc
    L0_34 = L0_34("boatman_01", {
      "locator2_boatman_01_kenka_01"
    }, {runLength = -1})
    while Mv_isSafeTaskRunning(L0_34) do
      wait()
    end
    Fn_turnNpc("boatman_01", "locator2_boatmantalk_01_c")
    Fn_turnNpc("boatmantalk", _puppet_tbl.boatman_01)
    L1_2 = Fn_playLoopMotionInsert("boatman_01", "talk_angry_00", {
      "talk_sad_02"
    }, 3, 5)
    L2_3 = Fn_playLoopMotionInsert("boatmantalk", "talk_sad_00", {
      "talk_angry_02"
    }, 6, 7)
    Fn_pcSensorOn("pccubesensor2_kenka_01")
    while true do
      if _near_kenka then
        if L6_7 == 0 then
          waitSeconds(1)
          Sound:playSE("m02_913b", 1, "")
          Fn_captionViewWait("sm03_02016")
          L6_7 = L6_7 + 1
        elseif L6_7 == 1 then
          Sound:playSE("m04_913a", 1, "")
          Fn_captionViewWait("sm03_02017")
          L6_7 = L6_7 + 1
        elseif L6_7 == 2 then
          Sound:playSE("m02_913a", 1, "")
          Fn_captionViewWait("sm03_02018")
          L6_7 = L6_7 + 1
        elseif L6_7 == 3 then
          Sound:playSE("m04_913c", 1, "")
          Fn_captionViewWait("sm03_02019")
          L6_7 = L6_7 + 1
        end
      end
      wait()
    end
  end
  L11_12 = L11_12(L12_13)
  L12_13 = nil
  L13_14 = false
  L14_15 = invokeTask
  function L15_16()
    repeat
      if Fn_sendEventComSb("isShipGoal") and not L13_14 then
        print("\227\130\191\227\130\185\227\130\175\231\148\159\230\136\144")
        L3_4 = invokeTask(function()
          local L0_35
          L0_35 = {
            "locator2_boatman04_walk_01",
            "locator2_boatman04_walk_02"
          }
          L4_5 = Fn_moveNpc("boatman_04", L0_35)
          while Mv_isSafeTaskRunning(L4_5) do
            wait()
          end
          L4_5:abort()
          wait()
          Fn_turnNpc("boatman_04", "locator2_boatman04_turn_01")
          L5_6 = true
          waitSeconds(1)
          L12_13 = invokeTask(function()
            while true do
              Fn_playMotionNpc("boatman_04", "talk_sad_01", true)
              Fn_playMotionNpc("boatman_04", "stay_01", true)
              Fn_playMotionNpc("boatman_04", "lookaround", true)
              Fn_playMotionNpc("boatman_04", "talk_sad_00", true)
              wait()
            end
          end)
        end)
        L13_14 = true
      end
      if L7_8 then
        L12_13 = Mv_safeTaskAbort(L12_13)
        L3_4 = Mv_safeTaskAbort(L3_4)
        Fn_killNpcTask("boatman_04")
        Fn_warpNpc("boatman_04", "locator2_boatman_04_c")
        Fn_playMotionNpc("boatman_04", "sit_floor_01", false)
        L7_8 = false
        L13_14 = false
      end
      wait()
    until false
  end
  L14_15 = L14_15(L15_16)
  L15_16 = invokeTask
  function L16_17()
    while true do
      if L8_9 then
        L8_9 = false
        while Fn_sendEventComSb("isBoxGrabbed") ~= true do
          print("\227\130\176\227\131\169\227\131\150\227\129\153\227\130\139\227\129\190\227\129\167\229\190\133\227\129\164")
          wait()
        end
        Fn_pcSensorOff("pccubesensor2_baggages_area")
        Fn_pcSensorOff("pccubesensor2_warning_bag")
        Fn_pcSensorOff("pccubesensor2_warp_bag")
        Fn_pcSensorOn("pccubesensor2_far_c")
        Fn_pcSensorOn("pccubesensor2_warning_c")
        Fn_pcSensorOn("pccubesensor2_warp_c")
        Mv_viewObj(_puppet_tbl.boatman_04, 0.5, 1.5)
        _boatman04_sensor:setActive(true)
        Fn_naviSet(_puppet_tbl.boatman_04)
        Fn_captionViewWait("sm03_02003")
      end
      wait()
    end
  end
  L15_16 = L15_16(L16_17)
  while true do
    while true do
      L16_17 = _in_boatman04_sensor
      if L16_17 == false then
        L16_17 = wait
        L16_17()
      end
    end
  end
  while true do
    L16_17 = Player
    L17_18 = L16_17
    L16_17 = L16_17.getAction
    L16_17 = L16_17(L17_18)
    L17_18 = _in_boatman04_sensor
    if L17_18 then
      L17_18 = Player
      L17_18 = L17_18.kAction_Idle
    end
    if L16_17 ~= L17_18 then
      L17_18 = wait
      L17_18()
    end
  end
  L16_17 = Fn_naviKill
  L16_17()
  L16_17 = Fn_sendEventComSb
  L17_18 = "requestRelease"
  L16_17(L17_18)
  L16_17 = Mv_safeTaskAbort
  L17_18 = L4_5
  L16_17 = L16_17(L17_18)
  L4_5 = L16_17
  L16_17 = Mv_safeTaskAbort
  L17_18 = L12_13
  L16_17 = L16_17(L17_18)
  L12_13 = L16_17
  L16_17 = Mv_safeTaskAbort
  L17_18 = L3_4
  L16_17 = L16_17(L17_18)
  L3_4 = L16_17
  L16_17 = Mv_safeTaskAbort
  L17_18 = L14_15
  L16_17 = L16_17(L17_18)
  L14_15 = L16_17
  L16_17 = Mv_safeTaskAbort
  L17_18 = L10_11
  L16_17 = L16_17(L17_18)
  L10_11 = L16_17
  L16_17 = Mv_safeTaskAbort
  L17_18 = L15_16
  L16_17 = L16_17(L17_18)
  L15_16 = L16_17
  L16_17 = waitSeconds
  L17_18 = 0.5
  L16_17(L17_18)
  _is_bag_arrived = true
  L16_17 = Fn_sendEventComSb
  L17_18 = "isShipGoal"
  L16_17 = L16_17(L17_18)
  if not L16_17 then
    L16_17 = Fn_playMotionNpc
    L17_18 = "boatman_04"
    L18_19 = "sit_floor_out_01"
    L19_20 = true
    L16_17(L17_18, L18_19, L19_20)
    L16_17 = Fn_playMotionNpc
    L17_18 = "boatman_04"
    L18_19 = "sit_floor_out_00"
    L19_20 = true
    L16_17(L17_18, L18_19, L19_20)
    L16_17 = Fn_playMotionNpc
    L17_18 = "boatman_04"
    L18_19 = "stay"
    L19_20 = false
    L16_17(L17_18, L18_19, L19_20)
    L16_17 = wait
    L16_17()
    L16_17 = Mv_viewObjWait
    L17_18 = _puppet_tbl
    L17_18 = L17_18.boatman_04
    L18_19 = 0.5
    L19_20 = 1.5
    L16_17 = L16_17(L17_18, L18_19, L19_20)
    L17_18 = Mv_safeTaskAbort
    L18_19 = L16_17
    L17_18 = L17_18(L18_19)
    L16_17 = L17_18
  end
  L16_17 = Fn_turnNpc
  L17_18 = "boatman_04"
  L16_17(L17_18)
  if L5_6 == false then
    L16_17 = Fn_kaiwaDemoView
    L17_18 = "sm03_00850k"
    L16_17(L17_18)
  elseif L5_6 then
    L16_17 = Fn_kaiwaDemoView
    L17_18 = "sm03_00870k"
    L16_17(L17_18)
  end
  L16_17 = waitSeconds
  L17_18 = 1
  L16_17(L17_18)
  L16_17 = Fn_pcSensorOn
  L17_18 = "pccubesensor2_pier_area"
  L16_17(L17_18)
  L16_17 = Fn_setCatWarpCheckPoint
  L17_18 = "locator2_boatman04_go_rich_01"
  L16_17(L17_18)
  L16_17 = Mv_invokeMissionViewNaviCaption
  L17_18 = "sm03_02020"
  L18_19 = _puppet_tbl
  L18_19 = L18_19.boatman_01
  L16_17 = L16_17(L17_18, L18_19)
  L17_18 = Fn_pcSensorOff
  L18_19 = "pccubesensor2_kenka_01"
  L17_18(L18_19)
  L17_18 = Mv_safeTaskAbort
  L18_19 = L11_12
  L17_18 = L17_18(L18_19)
  L11_12 = L17_18
  L17_18 = {
    L18_19,
    L19_20,
    L20_21
  }
  L18_19 = "locator2_boatman04_go_rich_01"
  L19_20 = "locator2_boatman04_go_rich_02"
  L20_21 = "locator2_boatman04_go_rich_03"
  L18_19 = nil
  L19_20 = invokeTask
  function L20_21()
    while true do
      if Fn_sendEventComSb("isShipGoal") then
        L4_5 = Fn_moveNpc("boatman_04", L17_18)
        print("\232\136\185\228\184\138\232\136\185\233\160\173\239\188\154\229\175\140\232\163\149\232\136\185\233\160\173\227\129\174\230\137\128\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139")
        while Mv_isSafeTaskRunning(L4_5) do
          wait()
        end
        waitSeconds(0.5)
        invokeTask(function()
          Fn_turnNpc("boatman_04", _puppet_tbl.boatmanrich)
        end)
        Fn_turnNpc("boatmanrich", _puppet_tbl.boatman_04)
        L3_4 = Fn_repeatPlayMotion("boatman_04", "talk_01", {"talk_01"}, 5, 10)
        L18_19 = Fn_repeatPlayMotion("boatmanrich", "talk_03", {"talk_03"}, 5, 10)
        break
      end
      wait()
    end
  end
  L19_20 = L19_20(L20_21)
  L20_21 = false
  while true do
    L21_22 = Player
    L22_23 = L21_22
    L21_22 = L21_22.getAction
    L21_22 = L21_22(L22_23)
    L22_23 = Fn_getDistanceToPlayer
    L23_24 = _puppet_tbl
    L23_24 = L23_24.boatman_01
    L22_23 = L22_23(L23_24)
    if L22_23 >= 200 then
      L23_24 = Player
      L23_24 = L23_24.kAction_Float
      if L21_22 == L23_24 and not L20_21 then
        L20_21 = true
        L23_24 = Fn_captionView
        L24_25 = "sm03_02029"
        L23_24(L24_25)
      end
    end
    L23_24 = Mv_isWaitPhase
    L23_24 = L23_24()
    if not L23_24 then
      L23_24 = Player
      L23_24 = L23_24.kAction_Idle
    end
    if L21_22 ~= L23_24 then
      L23_24 = wait
      L23_24()
    end
  end
  L21_22 = Mv_resetWaitPhase
  L21_22()
  L21_22 = Fn_pcSensorOff
  L22_23 = "pccubesensor2_pier_area"
  L21_22(L22_23)
  L21_22 = Fn_naviKill
  L21_22()
  L21_22 = Mv_safeTaskAbort
  L22_23 = L4_5
  L21_22 = L21_22(L22_23)
  L4_5 = L21_22
  L21_22 = Mv_safeTaskAbort
  L22_23 = L3_4
  L21_22 = L21_22(L22_23)
  L3_4 = L21_22
  L21_22 = Mv_safeTaskAbort
  L22_23 = L18_19
  L21_22 = L21_22(L22_23)
  L18_19 = L21_22
  L21_22 = Mv_safeTaskAbort
  L22_23 = L19_20
  L21_22 = L21_22(L22_23)
  L19_20 = L21_22
  L21_22 = wait
  L21_22()
  L21_22 = Fn_disappearNpc
  L22_23 = "boatman_04"
  L21_22(L22_23)
  L21_22 = Fn_disappearNpc
  L22_23 = "boatmanrich"
  L21_22(L22_23)
  L21_22 = Mv_safeTaskAbort
  L22_23 = L1_2
  L21_22 = L21_22(L22_23)
  L1_2 = L21_22
  L21_22 = Mv_safeTaskAbort
  L22_23 = L2_3
  L21_22 = L21_22(L22_23)
  L2_3 = L21_22
  L21_22 = Fn_playMotionNpc
  L22_23 = "boatman_01"
  L23_24 = "stay"
  L24_25 = false
  L21_22(L22_23, L23_24, L24_25)
  L21_22 = Fn_playMotionNpc
  L22_23 = "boatmantalk"
  L23_24 = "stay"
  L24_25 = false
  L21_22(L22_23, L23_24, L24_25)
  L21_22 = wait
  L21_22()
  L21_22 = Mv_viewObjWait
  L22_23 = _puppet_tbl
  L22_23 = L22_23.boatman_01
  L23_24 = 0.5
  L24_25 = 1.5
  L21_22 = L21_22(L22_23, L23_24, L24_25)
  L22_23 = Fn_turnNpc
  L23_24 = "boatman_01"
  L22_23(L23_24)
  L22_23 = Mv_safeTaskAbort
  L23_24 = L21_22
  L22_23 = L22_23(L23_24)
  L21_22 = L22_23
  L22_23 = Fn_kaiwaDemoView
  L23_24 = "sm03_00900k"
  L22_23(L23_24)
  L22_23 = waitSeconds
  L23_24 = 0.8
  L22_23(L23_24)
  L22_23 = Fn_blackout
  L22_23()
  L22_23 = Fn_userCtrlAllOff
  L22_23()
  L22_23 = Fn_pcSensorOff
  L23_24 = "pccubesensor2_far_c"
  L22_23(L23_24)
  L22_23 = Fn_pcSensorOff
  L23_24 = "pccubesensor2_warning_c"
  L22_23(L23_24)
  L22_23 = Fn_pcSensorOff
  L23_24 = "pccubesensor2_warp_c"
  L22_23(L23_24)
  L22_23 = Fn_disappearNpc
  L23_24 = "boatman_01"
  L22_23(L23_24)
  L22_23 = Fn_disappearNpc
  L23_24 = "boatman_02"
  L22_23(L23_24)
  L22_23 = Fn_disappearNpc
  L23_24 = "boatman_03"
  L22_23(L23_24)
  L22_23 = Fn_disappearNpc
  L23_24 = "boatmantalk"
  L22_23(L23_24)
  L22_23 = Fn_resetPcPos
  L23_24 = "locator2_cidfront_c"
  L22_23(L23_24)
  L22_23 = Fn_warpNpc
  L23_24 = "sm03_client"
  L24_25 = "locator2_cid_c"
  L22_23(L23_24, L24_25)
  L22_23 = Fn_setNpcActive
  L23_24 = "chi_01"
  L24_25 = true
  L22_23(L23_24, L24_25)
  L22_23 = Fn_setNpcActive
  L23_24 = "chi_02"
  L24_25 = true
  L22_23(L23_24, L24_25)
  L22_23 = createGameObject2
  L23_24 = "GimmickBg"
  L22_23 = L22_23(L23_24)
  L23_24 = holdObject
  L24_25 = L22_23
  L25_26 = _cid_puppet
  L26_27 = "ciguitar01_base"
  L27_28 = "loc_l_hand"
  L23_24(L24_25, L25_26, L26_27, L27_28)
  L23_24 = Fn_playLoopMotionRand
  L24_25 = "sm03_client"
  L25_26 = {L26_27, L27_28}
  L26_27 = "play_guitar_01"
  L27_28 = "talk_guitar_00"
  L26_27 = 5
  L27_28 = 10
  L23_24 = L23_24(L24_25, L25_26, L26_27, L27_28)
  L24_25 = Fn_playLoopMotionInsert
  L25_26 = "chi_01"
  L26_27 = "listen_00"
  L27_28 = {L28_29}
  L28_29 = "talk_laugh_00"
  L28_29 = 4
  L29_30 = 5
  L24_25 = L24_25(L25_26, L26_27, L27_28, L28_29, L29_30)
  L25_26 = Fn_playLoopMotionInsert
  L26_27 = "chi_02"
  L27_28 = "listen_00"
  L28_29 = {L29_30}
  L29_30 = "handclap"
  L29_30 = 3
  L30_31 = 5
  L25_26 = L25_26(L26_27, L27_28, L28_29, L29_30, L30_31)
  L26_27 = waitSeconds
  L27_28 = 3
  L26_27(L27_28)
  L26_27 = Fn_fadein
  L26_27()
  L26_27 = Sound
  L27_28 = L26_27
  L26_27 = L26_27.playSE
  L28_29 = "sm03_guitar"
  L29_30 = 1
  L30_31 = ""
  L31_32 = _cid_puppet
  L26_27(L27_28, L28_29, L29_30, L30_31, L31_32)
  L26_27 = waitSeconds
  L27_28 = 2
  L26_27(L27_28)
  L26_27 = Fn_kaiwaDemoView
  L27_28 = "sm03_01000k"
  L26_27(L27_28)
  L26_27 = Fn_setNpcActive
  L27_28 = "gaw_01"
  L28_29 = true
  L26_27(L27_28, L28_29)
  L26_27 = {L27_28}
  L27_28 = "locator2_gaw_banga_02"
  L27_28 = Fn_moveNpc
  L28_29 = "gaw_01"
  L29_30 = L26_27
  L27_28 = L27_28(L28_29, L29_30)
  L28_29 = waitSeconds
  L29_30 = 1.5
  L28_29(L29_30)
  L28_29 = Mv_viewObjWait
  L29_30 = "locator2_near_gaw_01"
  L30_31 = 0.3
  L28_29 = L28_29(L29_30, L30_31)
  while true do
    L29_30 = Mv_isSafeTaskRunning
    L30_31 = L27_28
    L29_30 = L29_30(L30_31)
    if L29_30 then
      L29_30 = wait
      L29_30()
    end
  end
  L29_30 = Mv_safeTaskAbort
  L30_31 = L27_28
  L29_30 = L29_30(L30_31)
  L27_28 = L29_30
  L29_30 = wait
  L29_30()
  L29_30 = Fn_turnNpc
  L30_31 = "gaw_01"
  L29_30(L30_31)
  L29_30 = wait
  L29_30()
  L29_30 = Player
  L30_31 = L29_30
  L29_30 = L29_30.setLookAtIk
  L31_32 = true
  L32_33 = 1
  L29_30(L30_31, L31_32, L32_33, (findGameObject2("Node", "locator2_kit_view"):getWorldPos()))
  L29_30 = waitSeconds
  L30_31 = 1
  L29_30(L30_31)
  L29_30 = Fn_kaiwaDemoView
  L30_31 = "sm03_01100k"
  L29_30(L30_31)
  L29_30 = Fn_userCtrlOn
  L29_30()
  L29_30 = Mv_safeTaskAbort
  L30_31 = L28_29
  L29_30 = L29_30(L30_31)
  L28_29 = L29_30
  L29_30 = Player
  L30_31 = L29_30
  L29_30 = L29_30.setLookAtIk
  L31_32 = false
  L32_33 = 1
  L29_30(L30_31, L31_32, L32_33, (findGameObject2("Node", "locator2_kit_view"):getWorldPos()))
  L29_30 = Fn_pcSensorOn
  L30_31 = "pccubesensor2_near_haikanko_area"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOn
  L30_31 = "pccubesensor2_cid_talk_area_c"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOn
  L30_31 = "pccubesensor2_far_last"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOn
  L30_31 = "pccubesensor2_warning_last"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOn
  L30_31 = "pccubesensor2_warp_last"
  L29_30(L30_31)
  L29_30 = Fn_setCatWarpCheckPoint
  L30_31 = "locator2_cidfront_c"
  L29_30(L30_31)
  L29_30 = waitSeconds
  L30_31 = 0.5
  L29_30(L30_31)
  L29_30 = Fn_turnNpc
  L30_31 = "gaw_01"
  L31_32 = "pccubesensor2_haikanko_area"
  L29_30(L30_31, L31_32)
  L29_30 = Fn_playMotionNpc
  L30_31 = "gaw_01"
  L31_32 = "inform_lp"
  L32_33 = false
  L29_30(L30_31, L31_32, L32_33)
  L29_30 = Fn_naviSet
  L30_31 = findGameObject2
  L31_32 = "Node"
  L32_33 = "locator2_navi_haikanko_area"
  L32_33 = L30_31(L31_32, L32_33)
  L29_30(L30_31, L31_32, L32_33, L30_31(L31_32, L32_33))
  L29_30 = Fn_captionViewWait
  L30_31 = "sm03_02004"
  L29_30(L30_31)
  L29_30 = Fn_missionViewWait
  L30_31 = "sm03_02021"
  L29_30(L30_31)
  L29_30 = Fn_playMotionNpc
  L30_31 = "gaw_01"
  L31_32 = "stay"
  L32_33 = false
  L29_30(L30_31, L31_32, L32_33)
  L29_30 = 1
  L30_31 = invokeTask
  function L31_32()
    while Mv_isWaitPhase() do
      if _cid_talk_flg then
        if L29_30 == 1 then
          L29_30 = L29_30 + 1
          Sound:playSE("sm03_guitar", 1, "", _cid_puppet)
        elseif L29_30 == 2 then
          L29_30 = L29_30 + 1
          Fn_captionViewWait("sm03_02006")
        elseif L29_30 == 3 then
          L29_30 = L29_30 + 1
          Sound:playSE("sm03_guitar", 1, "", _cid_puppet)
        elseif L29_30 == 4 then
          L29_30 = L29_30 + 1
          Fn_captionViewWait("sm03_02008")
        end
        waitSeconds(1.2)
      end
      wait()
    end
  end
  L30_31 = L30_31(L31_32)
  _cid_talk_task = L30_31
  while true do
    L30_31 = Fn_getDistanceToPlayer
    L31_32 = "pccubesensor2_haikanko_area"
    L30_31 = L30_31(L31_32)
    if L30_31 < 300 then
      L31_32 = Fn_disappearNpc
      L32_33 = "gaw_01"
      L31_32(L32_33)
      break
    end
    L31_32 = wait
    L31_32()
  end
  L30_31 = Fn_captionViewWait
  L31_32 = "sm03_02009"
  L30_31(L31_32)
  L30_31 = waitSeconds
  L31_32 = 2
  L30_31(L31_32)
  L30_31 = Fn_captionView
  L31_32 = "sm03_02010"
  L30_31(L31_32)
  L30_31 = Mv_waitPhase
  L30_31()
  L30_31 = Fn_pcSensorOn
  L31_32 = "pccubesensor2_haikanko_area"
  L30_31(L31_32)
  L30_31 = Fn_captionView
  L31_32 = "sm03_02011"
  L30_31(L31_32)
  while true do
    L30_31 = Player
    L31_32 = L30_31
    L30_31 = L30_31.getAction
    L30_31 = L30_31(L31_32)
    L31_32 = Mv_isWaitPhase
    L31_32 = L31_32()
    if not L31_32 then
      L31_32 = Player
      L31_32 = L31_32.kAction_Idle
    end
    if L30_31 ~= L31_32 then
      L31_32 = wait
      L31_32()
    end
  end
  L30_31 = Mv_resetWaitPhase
  L30_31()
  L30_31 = Fn_pcSensorOff
  L31_32 = "pccubesensor2_cid_talk_area_c"
  L30_31(L31_32)
  L30_31 = Fn_pcSensorOff
  L31_32 = "pccubesensor2_haikanko_area"
  L30_31(L31_32)
  L30_31 = Fn_naviKill
  L30_31()
  L30_31 = Mv_safeTaskAbort
  L31_32 = _cid_talk_task
  L30_31 = L30_31(L31_32)
  _cid_talk_task = L30_31
  L30_31 = Mv_safeTaskAbort
  L31_32 = L23_24
  L30_31 = L30_31(L31_32)
  L23_24 = L30_31
  L30_31 = Mv_safeTaskAbort
  L31_32 = L24_25
  L30_31 = L30_31(L31_32)
  L24_25 = L30_31
  L30_31 = Mv_safeTaskAbort
  L31_32 = L25_26
  L30_31 = L30_31(L31_32)
  L25_26 = L30_31
  L30_31 = Fn_userCtrlAllOff
  L30_31()
  L30_31 = waitSeconds
  L31_32 = 1
  L30_31(L31_32)
  L30_31 = Fn_captionView
  L31_32 = "sm03_02022"
  L30_31(L31_32)
  L30_31 = findGameObject2
  L31_32 = "Node"
  L32_33 = "locator2_shizai_01"
  L30_31 = L30_31(L31_32, L32_33)
  L31_32 = Player
  L32_33 = L31_32
  L31_32 = L31_32.setLookAtIk
  L31_32(L32_33, true, 1, L30_31:getWorldPos())
  L31_32 = Mv_viewObjWait
  L32_33 = "locator2_shizai_01"
  L31_32 = L31_32(L32_33)
  L32_33 = Mv_safeTaskAbort
  L32_33 = L32_33(L31_32)
  L31_32 = L32_33
  L32_33 = waitSeconds
  L32_33(4)
  L32_33 = Player
  L32_33 = L32_33.setLookAtIk
  L32_33(L32_33, false, 1, L30_31:getWorldPos())
  L32_33 = Fn_setNpcActive
  L32_33("haikanko_01", true)
  L32_33 = Sound
  L32_33 = L32_33.playSE
  L32_33(L32_33, "m06_914b", 1, "", _puppet_tbl.haikanko_01)
  L32_33 = Fn_captionView
  L32_33("sm03_02012")
  L32_33 = Fn_moveNpc
  L32_33 = L32_33("haikanko_01", {
    "locator2_haikanko_02"
  }, {runLength = -1})
  waitSeconds(2)
  Player:setLookAtIk(true, 1, _puppet_tbl.haikanko_01:getWorldPos())
  while Mv_isSafeTaskRunning(L32_33) do
    wait()
  end
  L32_33 = Mv_safeTaskAbort(L32_33)
  wait()
  Fn_turnNpc("haikanko_01")
  waitSeconds(1)
  Fn_kaiwaDemoView("sm03_01300k")
  Fn_userCtrlOn()
  Player:setLookAtIk(false, 1, _puppet_tbl.haikanko_01:getWorldPos())
  Fn_disappearNpc("gaw_01")
  Fn_disappearNpc("chi_01")
  Fn_disappearNpc("chi_02")
  L22_23:try_term()
  L0_1:try_term()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_36, L1_37
end
function _boatman04_sensorOnEnter(A0_38)
  local L1_39
  _in_boatman04_sensor = true
end
function _boatman04_sensorOnLeave(A0_40)
  local L1_41
  _in_boatman04_sensor = false
end
function pccubesensor2_pier_area_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_pier_area_OnLeave()
  Mv_resetWaitPhase()
end
function pccubesensor2_baggages_area_OnLeave()
  Fn_captionView("sm03_02013")
end
function pccubesensor2_warning_bag_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm03_02023")
  Player:setStay(false, false)
end
function pccubesensor2_warp_bag_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_far_c_OnLeave()
  if _is_bag_arrived then
    Fn_captionView("sm03_02024")
  else
    Fn_captionView("sm03_02025")
  end
end
function pccubesensor2_warning_c_OnLeave()
  Player:setStay(true, false)
  if _is_bag_arrived then
    Fn_captionView("sm03_02026")
  else
    Fn_captionView("sm03_02023")
  end
  Player:setStay(false, false)
end
function pccubesensor2_warp_c_OnLeave()
  local L0_42, L1_43
  _catwarp_reset = true
end
function pccubesensor2_far_last_OnLeave()
  Fn_captionView("sm03_02027")
end
function pccubesensor2_warning_last_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm03_02023")
  Player:setStay(false, false)
end
function pccubesensor2_warp_last_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_haikanko_area_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_haikanko_area_OnLeave()
  Mv_resetWaitPhase()
end
function pccubesensor2_near_haikanko_area_OnEnter()
  Fn_pcSensorOff("pccubesensor2_near_haikanko_area")
  Mv_gotoNextPhase()
end
function pccubesensor2_cid_talk_area_c_OnEnter()
  local L1_44
  L1_44 = _cid_talk_flg
  if not L1_44 then
    _cid_talk_flg = true
  end
end
function pccubesensor2_cid_talk_area_c_OnLeave()
  local L0_45, L1_46
  _cid_talk_flg = false
end
function pccubesensor2_kenka_01_OnEnter()
  local L0_47, L1_48
  _near_kenka = true
end
function pccubesensor2_kenka_01_OnLeave()
  local L0_49, L1_50
  _near_kenka = false
end
