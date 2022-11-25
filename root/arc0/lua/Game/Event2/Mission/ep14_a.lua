dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Misc/train_controller.lua")
_train_hdl = nil
_puppet_tbl = {}
_npcgen_tbl = {}
_go_station = false
_came_home_count = 0
_return_home = false
_pc_sensor = false
_navi_on = false
_arrived = false
_goto_id = false
_police_mot = {
  guard = "man31_guard_00"
}
_col = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "police",
      type = "man31",
      node = "locator2_man31",
      use_gravity = false
    },
    {
      name = "info_npc",
      type = "man30",
      node = "locator2_station_info"
    },
    {
      name = "stationmob",
      type = "man10",
      node = "locator2_man_01",
      anim_name = "stay_02"
    }
  }
  _npcgen_tbl = Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_station_info")
  Fn_pcSensorOff("pccubesensor2_on_train")
  Fn_pcSensorOff("pccubesensor2_station_01")
  Fn_pcSensorOff("pccubesensor2_arrive_check")
  Fn_pcSensorOff("pccubesensor2_station_02")
  Fn_pcSensorOff("pccubesensor2_id_navi_on")
  Fn_pcSensorOff("pccubesensor2_id")
  Fn_pcSensorOff("pccubesensormulti2_cat_warp_ed")
  Fn_loadNpcEventMotion("police", _police_mot)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  MissionEp14TrainCreate()
  _col = createGameObject2("GimmickBg")
  findGameObject2("Node", "locator2_set_col"):appendChild(_col)
  _col:setName("ep14_b_tunk_col")
  _col:setCollisionName("ep14_b_col")
  _col:overrideCollisionFilterLayer("Boundary")
  _col:try_init()
  _col:waitForReady()
  _col:try_start()
  _col:setCollidablePermission(false)
  HUD:furnitureReconfiguration("ep14")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25
  L0_1 = TrainController
  L0_1 = L0_1.setActiveHeksevillTrain
  L1_2 = false
  L0_1(L1_2)
  L0_1 = Fn_findNpc
  L1_2 = "police"
  L0_1 = L0_1(L1_2)
  function L1_2()
    Fn_playNpcEventMotion(L0_1, _police_mot.guard, false, 0.4, false)
  end
  L2_3 = Fn_missionStart
  L3_4 = L1_2
  L2_3(L3_4)
  L2_3 = wait
  L3_4 = 30
  L2_3(L3_4)
  L2_3 = Fn_kaiwaDemoView
  L3_4 = "ep14_00110k"
  L2_3(L3_4)
  L2_3 = Fn_userCtrlOn
  L2_3()
  L2_3 = invokeTask
  function L3_4()
    repeat
      wait()
    until L0_1:isMotionEnd()
    Fn_playMotionNpc("police", "stay_01", false)
  end
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 2
  L2_3(L3_4)
  L2_3 = Fn_missionView
  L3_4 = "ep14_00101"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 1.3
  L2_3(L3_4)
  L2_3 = findGameObject2
  L3_4 = "Node"
  L4_5 = "locator2_navi_station"
  L2_3 = L2_3(L3_4, L4_5)
  L3_4 = Fn_naviSet
  L4_5 = L2_3
  L3_4(L4_5)
  L3_4 = waitSeconds
  L4_5 = 2.5
  L3_4(L4_5)
  L3_4 = _train_controller_k
  L4_5 = L3_4
  L3_4 = L3_4.setStationActive
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = Fn_captionView
  L4_5 = "ep14_00100"
  L5_6 = 4
  L3_4(L4_5, L5_6)
  function L3_4()
    while true do
      if _return_home then
        Fn_captionViewWait("ep14_00117")
        Fn_turnNpc("police")
        Fn_playMotionNpc("police", _police_mot.guard)
        _return_home = false
        repeat
          wait()
        until L0_1:isMotionEnd()
        Fn_playMotionNpc("police", "stay_01", false)
      end
      wait()
    end
  end
  L4_5 = invokeTask
  L5_6 = L3_4
  L4_5 = L4_5(L5_6)
  L5_6 = waitPhase
  L5_6()
  L5_6 = Fn_naviKill
  L5_6()
  L6_7 = L4_5
  L5_6 = L4_5.abort
  L5_6(L6_7)
  L4_5 = nil
  L5_6 = Fn_findNpc
  L6_7 = "police"
  L5_6 = L5_6(L6_7)
  L6_7 = L5_6
  L5_6 = L5_6.kill
  L5_6(L6_7)
  L5_6 = rayCheckPcSetStay
  L6_7 = _puppet_tbl
  L6_7 = L6_7.info_npc
  L7_8 = 30
  L8_9 = 1.5
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_captionView
  L6_7 = "ep14_00102"
  L7_8 = 1.5
  L5_6(L6_7, L7_8)
  L5_6 = Sound
  L6_7 = L5_6
  L5_6 = L5_6.playSE
  L7_8 = "kit_512"
  L8_9 = 0.5
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = waitSeconds
  L6_7 = 1.3
  L5_6(L6_7)
  L5_6 = viewControl
  L6_7 = _puppet_tbl
  L6_7 = L6_7.info_npc
  L7_8 = nil
  L8_9 = 1.5
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_naviSet
  L6_7 = _puppet_tbl
  L6_7 = L6_7.info_npc
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_station_info"
  L5_6(L6_7)
  L5_6 = Fn_captionView
  L6_7 = "ep14_00103"
  L5_6(L6_7)
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.setStay
  L7_8 = false
  L5_6(L6_7, L7_8)
  L5_6 = waitPhase
  L5_6()
  L5_6 = Fn_naviKill
  L5_6()
  L5_6 = Fn_kaiwaDemoView
  L6_7 = "ep14_00115k"
  L5_6(L6_7)
  L5_6 = flg
  if L5_6 then
    L5_6 = Player
    L6_7 = L5_6
    L5_6 = L5_6.setLookAtIk
    L7_8 = false
    L8_9 = 1
    L9_10 = Vector
    L10_11 = 0
    L11_12 = 0
    L12_13 = 0
    L24_25 = L9_10(L10_11, L11_12, L12_13)
    L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L9_10(L10_11, L11_12, L12_13))
  end
  L5_6 = pcStayCamStopOff
  L5_6()
  L5_6 = Fn_setCatWarpCheckPoint
  L6_7 = "locator2_cat_warp_reset_01"
  L5_6(L6_7)
  L5_6 = Fn_missionView
  L6_7 = "ep14_00105"
  L5_6(L6_7)
  while true do
    L5_6 = _train_task_hdl
    if L5_6 == nil then
      L5_6 = wait
      L5_6()
    end
  end
  L5_6 = _train_controller_k
  L6_7 = L5_6
  L5_6 = L5_6.set
  L7_8 = {}
  L8_9 = TrainController
  L8_9 = L8_9.kParam_Speed
  L7_8[L8_9] = 0
  L8_9 = TrainController
  L8_9 = L8_9.kParam_MaxSpeed
  L7_8[L8_9] = 12
  L8_9 = TrainController
  L8_9 = L8_9.kParam_IdleTime
  L7_8[L8_9] = 6
  L8_9 = TrainController
  L8_9 = L8_9.kParam_RepopIdleTime
  L7_8[L8_9] = 0
  L8_9 = TrainController
  L8_9 = L8_9.kParam_AccelTime
  L7_8[L8_9] = 8
  L5_6(L6_7, L7_8)
  L5_6 = _train_controller_k
  L6_7 = L5_6
  L5_6 = L5_6.set
  L7_8 = {}
  L8_9 = TrainController
  L8_9 = L8_9.kParam_ForcedIdle
  L7_8[L8_9] = true
  L5_6(L6_7, L7_8)
  L5_6 = _train_controller_k
  L6_7 = L5_6
  L5_6 = L5_6.setStationRideMarkerHandle
  L7_8 = "oldnowa"
  L8_9 = nextPhase
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = _train_controller_k
  L6_7 = L5_6
  L5_6 = L5_6.getStationRideMarkerHandle
  L7_8 = "oldnowa"
  L7_8 = L5_6(L6_7, L7_8)
  L8_9 = waitSeconds
  L9_10 = 1.3
  L8_9(L9_10)
  L8_9 = Fn_captionView
  L9_10 = "ep14_00104"
  L10_11 = 2.5
  L8_9(L9_10, L10_11)
  L8_9 = waitSeconds
  L9_10 = 2.5
  L8_9(L9_10)
  L8_9 = _train_controller_k
  L9_10 = L8_9
  L8_9 = L8_9.setStationActive
  L10_11 = true
  L11_12 = "oldnowa"
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = findGameObject2
  L9_10 = "Node"
  L10_11 = "locator2_station_markerpos"
  L8_9 = L8_9(L9_10, L10_11)
  L9_10 = Fn_naviSet
  L10_11 = L8_9
  L9_10(L10_11)
  L9_10 = true
  L10_11 = invokeTask
  function L11_12()
    while _next_phase == false do
      if L9_10 and Fn_getDistanceToPlayer(L8_9) < 2 then
        Fn_naviKill()
        L9_10 = false
      elseif L9_10 == false and Fn_getDistanceToPlayer(L8_9) > 5 then
        Fn_naviSet(L8_9)
        L9_10 = true
      end
      wait()
    end
    Fn_naviKill()
  end
  L10_11(L11_12)
  L10_11 = waitPhase
  L10_11()
  if L9_10 then
    L10_11 = Fn_naviKill
    L10_11()
  end
  L10_11 = _train_controller_k
  L11_12 = L10_11
  L10_11 = L10_11.getCars
  L12_13 = L10_11(L11_12)
  L13_14 = findGameObject2
  L14_15 = "Node"
  L15_16 = "locator2_pcpos_on_train"
  L13_14 = L13_14(L14_15, L15_16)
  L14_15 = createGameObject2
  L15_16 = "Node"
  L14_15 = L14_15(L15_16)
  L16_17 = L14_15
  L15_16 = L14_15.setName
  L17_18 = "train_navi_node"
  L15_16(L16_17, L17_18)
  L16_17 = L14_15
  L15_16 = L14_15.setPos
  L17_18 = Vector
  L18_19 = 0
  L19_20 = 4.8
  L20_21 = 0
  L24_25 = L17_18(L18_19, L19_20, L20_21)
  L15_16(L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L17_18(L18_19, L19_20, L20_21))
  L16_17 = L14_15
  L15_16 = L14_15.setForceMove
  L15_16(L16_17)
  L16_17 = L10_11
  L15_16 = L10_11.appendChild
  L17_18 = L14_15
  L15_16(L16_17, L17_18)
  L16_17 = L14_15
  L15_16 = L14_15.try_init
  L15_16(L16_17)
  L16_17 = L14_15
  L15_16 = L14_15.waitForReady
  L15_16(L16_17)
  L16_17 = L14_15
  L15_16 = L14_15.try_start
  L15_16(L16_17)
  L15_16 = findGameObject2
  L16_17 = "PlayerSensor"
  L17_18 = "pccubesensor2_on_train"
  L15_16 = L15_16(L16_17, L17_18)
  if L15_16 then
    L17_18 = L15_16
    L16_17 = L15_16.setWorldPos
    L19_20 = L10_11
    L18_19 = L10_11.getWorldPos
    L24_25 = L18_19(L19_20)
    L16_17(L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L18_19(L19_20))
    L17_18 = L15_16
    L16_17 = L15_16.setForceMove
    L16_17(L17_18)
    L17_18 = L15_16
    L16_17 = L15_16.setPos
    L18_19 = Vector
    L19_20 = 0
    L20_21 = 6.2
    L21_22 = 0
    L24_25 = L18_19(L19_20, L20_21, L21_22)
    L16_17(L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L18_19(L19_20, L20_21, L21_22))
    L17_18 = L15_16
    L16_17 = L15_16.setForceMove
    L16_17(L17_18)
    L17_18 = L10_11
    L16_17 = L10_11.appendChild
    L18_19 = L15_16
    L16_17(L17_18, L18_19)
  end
  L16_17 = Fn_pcSensorOn
  L17_18 = L15_16
  L16_17(L17_18)
  function L16_17()
    _train_controller_k:put({station_name = "oldnowa", pc_ride_node = L13_14})
    wait()
    Fn_naviSet(findGameObject2("PlayerSensor", "pccubesensor2_station_01"))
    if _train_controller_k:get(TrainController.kParam_ForcedIdle) then
      _train_controller_k:set({
        [TrainController.kParam_ForcedIdle] = false
      })
      wait()
    end
    _train_controller_k:run()
  end
  _warp_add_func = L16_17
  L17_18 = wait
  L17_18()
  L17_18 = Fn_naviSet
  L18_19 = findGameObject2
  L19_20 = "PlayerSensor"
  L20_21 = "pccubesensor2_station_01"
  L24_25 = L18_19(L19_20, L20_21)
  L17_18(L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L18_19(L19_20, L20_21))
  L17_18 = _train_controller_k
  L18_19 = L17_18
  L17_18 = L17_18.setStationActive
  L19_20 = false
  L17_18(L18_19, L19_20)
  L17_18 = _navi_on
  if L17_18 then
    _navi_on = false
  end
  L17_18 = _train_controller_k
  L18_19 = L17_18
  L17_18 = L17_18.set
  L19_20 = {}
  L20_21 = TrainController
  L20_21 = L20_21.kParam_ForcedIdle
  L19_20[L20_21] = false
  L17_18(L18_19, L19_20)
  repeat
    L17_18 = wait
    L17_18()
    L17_18 = HUD
    L18_19 = L17_18
    L17_18 = L17_18.faderAlpha
    L17_18 = L17_18(L18_19)
  until L17_18 == 0
  L17_18 = invokeTask
  function L18_19()
    while true do
      if _pc_sensor == false and _navi_on == false then
        Fn_naviSet(L14_15)
        _navi_on = true
      elseif _pc_sensor and _navi_on and Player:getAction() == Player.kAction_Idle then
        Fn_naviKill()
        Fn_naviSet(findGameObject2("PlayerSensor", "pccubesensor2_station_01"))
        _navi_on = false
      end
      wait()
    end
  end
  L17_18 = L17_18(L18_19)
  L18_19 = Fn_captionViewWait
  L19_20 = "ep14_00106"
  L18_19(L19_20)
  L18_19 = {
    L19_20,
    L20_21,
    L21_22,
    L22_23,
    L23_24,
    L24_25
  }
  L19_20 = "ep14_00107"
  L20_21 = "ep14_00108"
  L21_22 = "ep14_00109"
  L22_23 = "ep14_00110"
  L23_24 = "ep14_00111"
  L24_25 = "ep14_00112"
  L19_20 = findGameObject2
  L20_21 = "Node"
  L21_22 = "locator2_cap_goal"
  L19_20 = L19_20(L20_21, L21_22)
  L20_21 = L19_20
  L19_20 = L19_20.getWorldPos
  L19_20 = L19_20(L20_21)
  L21_22 = L13_14
  L20_21 = L13_14.getWorldPos
  L20_21 = L20_21(L21_22)
  L21_22 = cueueCaptionView
  L22_23 = L19_20
  L23_24 = L20_21
  L24_25 = L18_19
  L21_22 = L21_22(L22_23, L23_24, L24_25)
  L22_23 = Fn_pcSensorOn
  L23_24 = "pccubesensor2_station_01"
  L22_23(L23_24)
  L22_23 = Fn_pcSensorOn
  L23_24 = "pccubesensor2_arrive_check"
  L22_23(L23_24)
  L22_23 = Fn_pcSensorOn
  L23_24 = "pccubesensor2_id_navi_on"
  L22_23(L23_24)
  L22_23 = _col
  L23_24 = L22_23
  L22_23 = L22_23.setCollidablePermission
  L24_25 = true
  L22_23(L23_24, L24_25)
  function L22_23()
    local L0_26
    L0_26 = Fn_pcSensorOff
    L0_26("pccubesensor2_station_01")
    L0_26 = Fn_setNpcActive
    L0_26("stationmob", false)
    L0_26 = L17_18
    L0_26 = L0_26.isRunning
    L0_26 = L0_26(L0_26)
    if L0_26 then
      L0_26 = L17_18
      L0_26 = L0_26.abort
      L0_26(L0_26)
      L0_26 = nil
      L17_18 = L0_26
    end
    L0_26 = Fn_naviKill
    L0_26()
    _warp_add_func = nil
    L0_26 = Fn_setCatWarpCheckPoint
    L0_26("locator2_cat_warp_reset_02")
    L0_26 = Fn_pcSensorOff
    L0_26("pccubesensormulti2_cat_warp_01")
    L0_26 = Fn_pcSensorOn
    L0_26("pccubesensormulti2_cat_warp_ed")
    L0_26 = Fn_pcSensorOn
    L0_26("pccubesensor2_id")
    L0_26 = Fn_missionView
    L0_26("ep14_00118")
    L0_26 = waitSeconds
    L0_26(1.3)
    L0_26 = findGameObject2
    L0_26 = L0_26("Node", "locator2_navi_id")
    Fn_naviSet(L0_26)
    waitSeconds(2.5)
    Fn_captionView("ep14_00119")
    waitPhase()
    Fn_naviKill()
    Fn_kaiwaDemoView("ep14_00119k")
    Fn_setKeepPlayerPos()
    Fn_setNextMissionFlag()
    Fn_nextMission()
    Fn_exitSandbox()
  end
  function L23_24()
    local L0_27
    L0_27 = Fn_pcSensorOn
    L0_27("pccubesensor2_id")
    while true do
      L0_27 = _id_navi_on
      if L0_27 == false then
        L0_27 = wait
        L0_27()
      end
    end
    L0_27 = Fn_missionView
    L0_27("ep14_00118")
    L0_27 = waitSeconds
    L0_27(1.3)
    L0_27 = findGameObject2
    L0_27 = L0_27("Node", "locator2_navi_id")
    Fn_naviSet(L0_27)
    waitPhase()
    Fn_naviKill()
    Fn_kaiwaDemoView("ep14_00119k")
    Fn_setKeepPlayerPos()
    Fn_setNextMissionFlag()
    Fn_nextMission()
    Fn_exitSandbox()
  end
  while true do
    L24_25 = _arrived
    if not L24_25 then
      L24_25 = _goto_id
      if L24_25 then
        L24_25 = L22_23
        L24_25()
      end
      L24_25 = _train_controller_k
      L24_25 = L24_25.isIdling
      L24_25 = L24_25(L24_25)
      if L24_25 then
        L24_25 = _train_controller_k
        L24_25 = L24_25.getStopStationName
        L24_25 = L24_25(L24_25)
        if L24_25 == "purejunu" then
          L24_25 = print
          L24_25(tostring(_train_controller_k:getStopStationName()))
          L24_25 = _train_controller_k
          L24_25 = L24_25.get
          L24_25 = L24_25(L24_25, TrainController.kParam_ForcedIdle)
          if L24_25 == false then
            L24_25 = _train_controller_k
            L24_25 = L24_25.set
            L24_25(L24_25, {
              [TrainController.kParam_ForcedIdle] = true
            })
          end
        end
      end
      L24_25 = wait
      L24_25()
    end
  end
  _warp_add_func = nil
  L24_25 = Fn_setCatWarpCheckPoint
  L24_25("locator2_cat_warp_reset_02")
  L24_25 = Fn_pcSensorOff
  L24_25("pccubesensormulti2_cat_warp_01")
  L24_25 = Fn_pcSensorOn
  L24_25("pccubesensormulti2_cat_warp_ed")
  while true do
    L24_25 = Fn_isCaptionView
    L24_25 = L24_25("ep14_00112")
    if L24_25 then
      L24_25 = Fn_isCaptionView
      L24_25 = L24_25()
    end
    if L24_25 then
      L24_25 = wait
      L24_25()
    end
  end
  L24_25 = _train_controller_k
  L24_25 = L24_25.get
  L24_25 = L24_25(L24_25, TrainController.kParam_ForcedIdle)
  if L24_25 == true then
    L24_25 = _train_controller_k
    L24_25 = L24_25.set
    L24_25(L24_25, {
      [TrainController.kParam_ForcedIdle] = false
    })
  end
  while true do
    L24_25 = _train_controller_k
    L24_25 = L24_25.isIdling
    L24_25 = L24_25(L24_25)
    if not L24_25 then
      L24_25 = _goto_id
      if L24_25 then
        L24_25 = L22_23
        L24_25()
      end
      L24_25 = wait
      L24_25()
    end
  end
  L24_25 = L17_18.abort
  L24_25(L17_18)
  L17_18 = nil
  L24_25 = Fn_naviKill
  L24_25()
  L24_25 = _goto_id
  if L24_25 then
    L24_25 = L22_23
    L24_25()
  else
    L24_25 = Fn_captionView
    L24_25("ep14_00120")
    L24_25 = waitSeconds
    L24_25(3)
  end
  while true do
    L24_25 = _train_controller_k
    L24_25 = L24_25.isIdling
    L24_25 = L24_25(L24_25)
    if L24_25 then
      L24_25 = wait
      L24_25()
    end
  end
  L24_25 = waitSeconds
  L24_25(1)
  L24_25 = _arrived
  if L24_25 then
    L24_25 = Fn_captionView
    L24_25("ep14_00113", 2.5)
    L24_25 = waitSeconds
    L24_25(3)
  else
    L24_25 = _goto_id
    if L24_25 then
      L24_25 = L23_24
      L24_25()
    else
      L24_25 = pcStayCamStopOn
      L24_25()
      L24_25 = viewControl
      L24_25(L10_11, 1, 0, 1)
      L24_25 = Fn_captionView
      L24_25("ep14_00113", 2.5)
      L24_25 = pcStayCamStopOff
      L24_25()
      L24_25 = waitSeconds
      L24_25(3)
    end
  end
  L24_25 = _pc_sensor
  if L24_25 then
    L24_25 = Fn_captionView
    L24_25("ep14_00121", 2.5)
    L24_25 = Fn_pcSensorOn
    L24_25("pccubesensor2_station_02")
    while true do
      L24_25 = Fn_isCaptionView
      L24_25 = L24_25()
      if L24_25 then
        L24_25 = wait
        L24_25()
        else
          L24_25 = waitSeconds
          L24_25(1.3)
        end
      end
    end
  L24_25 = _arrived
  if L24_25 then
    L24_25 = Fn_captionView
    L24_25("ep14_00122")
    L24_25 = waitSeconds
    L24_25(3.5)
  else
    L24_25 = findGameObject2
    L24_25 = L24_25("PlayerSensor", "pccubesensor2_station_01")
    Fn_naviSet(L24_25)
    while true do
      if _goto_id then
        L23_24()
      elseif 3 > Fn_getDistanceToPlayer(L24_25) then
        Fn_naviKill()
        break
      end
      wait()
    end
  end
  L24_25 = Fn_naviSet
  L24_25(_puppet_tbl.stationmob)
  L24_25 = viewControl
  L24_25(_puppet_tbl.stationmob, 0, 1.5)
  L24_25 = Fn_pcSensorOn
  L24_25("pccubesensor2_id")
  L24_25 = _next_phase
  if L24_25 then
    _next_phase = false
  end
  while true do
    L24_25 = _next_phase
    if L24_25 then
      L24_25 = Fn_naviKill
      L24_25()
      L24_25 = Fn_kaiwaDemoView
      L24_25("ep14_00119k")
      L24_25 = Fn_setKeepPlayerPos
      L24_25()
      L24_25 = Fn_setNextMissionFlag
      L24_25()
      L24_25 = Fn_nextMission
      L24_25()
      L24_25 = Fn_exitSandbox
      L24_25()
    else
      L24_25 = Fn_isCaptionView
      L24_25 = L24_25()
      if L24_25 == false then
        L24_25 = Fn_getDistanceToPlayer
        L24_25 = L24_25(_puppet_tbl.stationmob)
      end
    end
    if not (L24_25 < 2) then
      L24_25 = wait
      L24_25()
    end
  end
  L24_25 = Fn_naviKill
  L24_25()
  L24_25 = Fn_kaiwaDemoView
  L24_25("ep14_00120k")
  L24_25 = waitSeconds
  L24_25(1)
  L24_25 = Fn_captionView
  L24_25("ep14_00114")
  L24_25 = waitSeconds
  L24_25(1)
  L24_25 = findGameObject2
  L24_25 = L24_25("Node", "locator2_navi_id")
  Fn_naviSet(L24_25)
  waitPhase()
  Fn_naviKill()
  Fn_captionView("ep14_00116")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  TrainController.setActiveHeksevillTrain(true)
  if _next_phase then
    _next_phase = false
  end
end
function waitSensorInIdle()
  while _pc_sensor ~= true or Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
  _pc_sensor = false
end
function pccubesensor2_train_OnEnter()
  local L0_28, L1_29
  _pc_sensor = true
end
function pccubesensor2_train_OnLeave()
  local L0_30, L1_31
  _pc_sensor = false
end
function homePoliceOnEnter()
  local L0_32, L1_33
  L0_32 = _came_home_count
  if L0_32 > 0 then
    _return_home = true
  end
  L0_32 = _came_home_count
  L0_32 = L0_32 + 1
  _came_home_count = L0_32
end
function homePoliceOnLeave()
  if _go_station == false then
    invokeTask(function()
      Fn_turnNpc("police", 70)
    end)
  end
  _go_station = true
end
function pccubesensor2_station_01_OnEnter()
  local L1_34
  L1_34 = _goto_id
  if L1_34 == false then
    _arrived = true
  end
end
function pccubesensor2_station_01_OnLeave()
  local L0_35, L1_36
  _arrived = false
end
function goto_id_OnEnter(A0_37)
  if _arrived == false then
    _goto_id = true
  end
  Fn_pcSensorOff(A0_37)
end
function pccubesensor2_station_02_OnLeave(A0_38)
  if _pc_sensor and _navi_on == false and Player:getAction() == Player.kAction_Idle then
    invokeTask(function()
      while Fn_isCaptionView() do
        wait()
      end
      waitSeconds(1.3)
      Fn_captionView("ep14_00123", 2)
      Player:setAction(Player.kAction_Float)
      Fn_pcSensorOff(A0_38)
    end)
  end
end
function id_navi_on_OnEnter(A0_39)
  _id_navi_on = true
  Fn_pcSensorOff(A0_39)
end
