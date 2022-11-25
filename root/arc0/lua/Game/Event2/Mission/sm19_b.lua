dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm19_common.lua")
import("Vehicle")
_puppet_tbl = {}
_npc_tbl = {}
_sis_discover = false
_grab_cap = false
_in_center_area = false
_near_sister = false
_brother_hit_navi = false
STEP = {
  RICH_OR_SISTER = 0,
  SELECT_RICH = 1,
  SELECT_SISTER = 2
}
_select = STEP.RICH_OR_SISTER
_script_ship = {
  ship = nil,
  pos_route_tbl = nil,
  route_object = nil
}
GEM_DIST = 90
_sdemo_cut02 = nil
SELECT_SISTER_FORCE_DISTANCE = 14
CRYING_DISTANCE = 25
CRYING_INTERVAL = 300
SISTER_LOOK_DISTANCE = 40
OUT_AREA_NAVI_DISTANCE_0 = 300
OUT_AREA_NAVI_DISTANCE_1 = 200
_areaOutCallBackFunc = nil
_more_important_navi_view = false
_cat_navi_view = false
_phase = 1
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_rich_grab_cap_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_near_send_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_send_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_return_poor_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_can_see_nevi")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lo_a_05")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_brother_hide_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_sister_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_discover_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_arrive_sister")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_b_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_b_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_b_phase05")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_b_phase05")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catnavikill_b_phase05")
  L0_0 = {
    {
      name = RICH_MAN_ID,
      type = "man48",
      node = "locator2_rich_man_pos_02b"
    },
    {
      name = BROTHER_ID,
      type = "chi11",
      node = "locator2_brother_01_pos_02b"
    },
    {
      name = SISTER_ID,
      type = "chi12",
      node = "locator2_sister_01_pos_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _sdemo_cut02 = SDemo.create("sm19_b_cut02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20
  L0_1 = Fn_findNpc
  L1_2 = BROTHER_ID
  L0_1 = L0_1(L1_2)
  L1_2 = Fn_findNpc
  L2_3 = SISTER_ID
  L1_2 = L1_2(L2_3)
  L2_3 = {}
  L2_3.label01 = "man48_scared_sm19_00"
  L3_4 = Fn_loadNpcEventMotion
  L4_5 = RICH_MAN_ID
  L5_6 = L2_3
  L3_4(L4_5, L5_6)
  L3_4 = setUserCtrlOn
  L4_5 = false
  L3_4(L4_5)
  L3_4 = Fn_coercionPoseNomal
  L3_4()
  L3_4 = Fn_warpNpc
  L4_5 = RICH_MAN_ID
  L5_6 = "locator2_rich_man_pos_02b"
  L3_4(L4_5, L5_6)
  L3_4 = Fn_warpNpc
  L4_5 = BROTHER_ID
  L5_6 = "locator2_brother_01_pos_02b"
  L3_4(L4_5, L5_6)
  L3_4 = Fn_setNpcActive
  L4_5 = SISTER_ID
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = Fn_sendEventComSb
  L4_5 = "requestSpawnEnemy"
  L5_6 = "enmgen2_water"
  L3_4(L4_5, L5_6)
  while true do
    L3_4 = Fn_sendEventComSb
    L4_5 = "isSpawnEnemyEnd"
    L5_6 = "enmgen2_water"
    L3_4 = L3_4(L4_5, L5_6)
    if L3_4 then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = Fn_sendEventComSb
  L4_5 = "requestChangeEnemyMarker"
  L5_6 = false
  L6_7 = "enmgen2_water"
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Fn_sendEventComSb
  L4_5 = "requestSpawnEnemy"
  L5_6 = "enmgen2_luna_only_b"
  L3_4(L4_5, L5_6)
  while true do
    L3_4 = Fn_sendEventComSb
    L4_5 = "isSpawnEnemyEnd"
    L5_6 = "enmgen2_luna_only_b"
    L3_4 = L3_4(L4_5, L5_6)
    if L3_4 then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = Fn_sendEventComSb
  L4_5 = "requestChangeEnemyMarker"
  L5_6 = false
  L6_7 = "enmgen2_luna_only_b"
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Fn_sendEventComSb
  L4_5 = "requestSpawnEnemy"
  L5_6 = "enmgen2_center_only_b"
  L3_4(L4_5, L5_6)
  while true do
    L3_4 = Fn_sendEventComSb
    L4_5 = "isSpawnEnemyEnd"
    L5_6 = "enmgen2_center_only_b"
    L3_4 = L3_4(L4_5, L5_6)
    if L3_4 then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = Fn_sendEventComSb
  L4_5 = "requestChangeEnemyMarker"
  L5_6 = false
  L6_7 = "enmgen2_center_only_b"
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Vehicle
  L4_5 = L3_4
  L3_4 = L3_4.SetPanic
  L5_6 = true
  L6_7 = findGameObject2
  L7_8 = "Node"
  L8_9 = "locator2_pc_start_pos"
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = L6_7
  L6_7 = L6_7.getWorldPos
  L19_20 = L6_7(L7_8)
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L6_7(L7_8))
  L3_4 = Fn_playMotionNpc
  L4_5 = RICH_MAN_ID
  L5_6 = "stay_02"
  L6_7 = false
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Fn_playMotionNpc
  L4_5 = BROTHER_ID
  L5_6 = "stay"
  L6_7 = false
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Fn_missionStart
  L3_4()
  L3_4 = invokeTask
  function L4_5()
    pos_route_tbl = {
      findGameObject2("Node", "locator2_ve02_esc_ship_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ve02_esc_ship_03"):getWorldPos()
    }
    _script_ship.ship, _script_ship.pos_route_tbl = Mv_createScriptVehicleWait(pos_route_tbl, "ForSm19Ship", "rich_bike", "locator2_ve02_esc_ship")
    print("\n\n\n\227\131\162\227\131\150\232\136\185\239\188\154\231\148\159\230\136\144\229\174\140\228\186\134")
    _script_ship.ship:setBaseSpeed(0)
    _script_ship.ship:setCurrSpeed(0)
    _script_ship.ship:setActive(true)
    while true do
      if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_resetpos_port")) < 140 then
      else
      end
      waitSeconds(1)
      if _script_ship.ship == nil then
        print("\227\131\143\227\131\179\227\131\137\227\131\171\227\129\170\227\129\151")
      else
        print("\227\131\143\227\131\179\227\131\137\227\131\171\231\162\186\232\170\141")
      end
      wait()
    end
  end
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_catnavikill_b_phase05"
  L3_4(L4_5)
  L3_4 = waitSeconds
  L4_5 = 1.5
  L3_4(L4_5)
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm19_00130k"
  L3_4(L4_5)
  L3_4 = Fn_resetCoercionPose
  L3_4()
  L3_4 = setUserCtrlOn
  L4_5 = true
  L3_4(L4_5)
  L3_4 = {L4_5, L5_6}
  L4_5 = "locator2_brother_01_hide_01"
  L5_6 = "locator2_brother_01_hide_02"
  L4_5 = Fn_moveNpc
  L5_6 = BROTHER_ID
  L6_7 = L3_4
  L7_8 = {}
  L7_8.runLength = -1
  L4_5 = L4_5(L5_6, L6_7, L7_8)
  L5_6 = invokeTask
  function L6_7()
    while Mv_isSafeTaskRunning(L4_5) do
      wait()
    end
    L4_5 = Mv_safeTaskAbort(L4_5)
    Fn_pcSensorOn("pccubesensor2_brother_hide_01")
    Fn_playMotionNpc(BROTHER_ID, "lookaround_01", false)
  end
  L5_6(L6_7)
  L5_6 = Fn_missionView
  L6_7 = "sm19_01000"
  L5_6(L6_7)
  L5_6 = waitSeconds
  L6_7 = 2.5
  L5_6(L6_7)
  _grab_cap = true
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.setGrabExceptionalObject
  L7_8 = {L8_9}
  L8_9 = RICH_MAN_ID
  L5_6(L6_7, L7_8)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_rich_grab_cap_01"
  L5_6(L6_7)
  while true do
    while true do
      L5_6 = _select
      L6_7 = STEP
      L6_7 = L6_7.RICH_OR_SISTER
      if L5_6 == L6_7 then
        L5_6 = _puppet_tbl
        L6_7 = RICH_MAN_ID
        L5_6 = L5_6[L6_7]
        L6_7 = L5_6
        L5_6 = L5_6.isGrabbed
        L5_6 = L5_6(L6_7)
        if L5_6 then
          L5_6 = STEP
          L5_6 = L5_6.SELECT_RICH
          _select = L5_6
        else
          L5_6 = Fn_getDistanceToPlayer
          L6_7 = _puppet_tbl
          L7_8 = RICH_MAN_ID
          L6_7 = L6_7[L7_8]
          L5_6 = L5_6(L6_7)
          L6_7 = SELECT_SISTER_FORCE_DISTANCE
          if L5_6 >= L6_7 then
            L5_6 = STEP
            L5_6 = L5_6.SELECT_SISTER
            _select = L5_6
          end
        end
        L5_6 = _select
        L6_7 = STEP
        L6_7 = L6_7.RICH_OR_SISTER
        if L5_6 ~= L6_7 then
          L5_6 = Fn_pcSensorOff
          L6_7 = "pccubesensor2_rich_grab_cap_01"
          L5_6(L6_7)
          L5_6 = Player
          L6_7 = L5_6
          L5_6 = L5_6.setGrabExceptionalObject
          L7_8 = {}
          L5_6(L6_7, L7_8)
        end
        L5_6 = wait
        L5_6()
      else
        L5_6 = _select
        L6_7 = STEP
        L6_7 = L6_7.SELECT_RICH
        if L5_6 == L6_7 then
          _phase = 1
          L5_6 = Fn_setCatWarpCheckPoint
          L6_7 = "locator2_pc_start_pos"
          L5_6(L6_7)
          L5_6 = Fn_pcSensorOn
          L6_7 = "pccubesensor2_catwarning_b_phase01"
          L5_6(L6_7)
          L5_6 = Fn_pcSensorOn
          L6_7 = "pccubesensor2_catwarp_b_phase01"
          L5_6(L6_7)
          L5_6 = Fn_pcSensorOff
          L6_7 = "pccubesensor2_brother_hide_01"
          L5_6(L6_7)
          L5_6 = Fn_naviKill
          L5_6()
          L5_6 = Fn_captionViewEnd
          L5_6()
          L5_6 = Fn_pcSensorOn
          L6_7 = "pccubesensor2_near_send_area"
          L5_6(L6_7)
          L5_6 = Fn_pcSensorOn
          L6_7 = "pccubesensor2_send_area"
          L5_6(L6_7)
          L5_6 = init_create_enemy_gem
          L6_7 = "locator2_send_area_for_gem"
          L5_6(L6_7)
          L5_6 = create_energy_gem
          L6_7 = GEM_DIST
          L5_6 = L5_6(L6_7)
          L6_7, L7_8 = nil, nil
          L8_9 = invokeTask
          function L9_10()
            Fn_missionView("sm19_01002")
            waitSeconds(1.3)
            Fn_naviSet(findGameObject2("Node", "locator2_navi_send_area"))
            viewTarget(findGameObject2("Node", "locator2_navi_send_area"), 0.5)
            if not Fn_sendEventComSb("isSpawnEnemy", "enmgen2_sky") then
              Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_sky")
            end
            while Fn_sendEventComSb("isSpawnEnemyEnd", "enmgen2_sky") do
              wait()
            end
            if not Fn_sendEventComSb("isSpawnEnemy", "enmgen2_sky02") then
              Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_sky02")
            end
            while Fn_sendEventComSb("isSpawnEnemyEnd", "enmgen2_sky02") do
              wait()
            end
            Fn_sendEventComSb("requestChangeEnemyMarker", false, "enmgen2_sky02")
            L6_7 = enemyRespawn("enmgen2_sky")
            L7_8 = enemyRespawn("enmgen2_sky02")
            Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_luna_only_b_rich")
            while Fn_sendEventComSb("isSpawnEnemyEnd", "enmgen2_luna_only_b_rich") do
              wait()
            end
            Fn_sendEventComSb("requestChangeEnemyMarker", false, "enmgen2_luna_only_b_rich")
            waitSeconds(2.5)
            Fn_captionViewWait("sm19_01026")
            waitSeconds(0.7)
            Sound:playSE("m03_936", 1, "")
            Fn_captionViewWait("sm19_01001")
            waitSeconds(0.7)
            Fn_captionView("sm19_01003")
          end
          L8_9 = L8_9(L9_10)
          L9_10 = waitSeconds
          L10_11 = 3
          L9_10(L10_11)
          L9_10 = Fn_sendEventComSb
          L10_11 = "requestEnemyCount"
          L11_12 = "enmgen2_sky"
          L9_10 = L9_10(L10_11, L11_12)
          L10_11 = Fn_sendEventComSb
          L11_12 = "requestEnemyCount"
          L12_13 = "enmgen2_sky02"
          L10_11 = L10_11(L11_12, L12_13)
          L9_10 = L9_10 + L10_11
          L10_11 = 0
          L11_12 = invokeTask
          function L12_13()
            while Mv_isWaitPhase() and Player:getDeathState() == Player.kDeath_Living do
              if Fn_sendEventComSb("requestEnemyCount", "enmgen2_sky") + Fn_sendEventComSb("requestEnemyCount", "enmgen2_sky02") < L9_10 then
                L9_10 = Fn_sendEventComSb("requestEnemyCount", "enmgen2_sky") + Fn_sendEventComSb("requestEnemyCount", "enmgen2_sky02")
                if L10_11 == 0 then
                  L10_11 = L10_11 + 1
                  Fn_captionView("sm19_01005")
                elseif L10_11 == 1 then
                  L10_11 = L10_11 + 1
                  Fn_captionView("sm19_01006")
                  break
                end
              end
              wait()
            end
          end
          L11_12 = L11_12(L12_13)
          L12_13 = Mv_waitPhase
          L12_13()
          L12_13 = stop_create_enemy_gem
          L12_13()
          L12_13 = Mv_safeTaskAbort
          L13_14 = L5_6
          L12_13 = L12_13(L13_14)
          L5_6 = L12_13
          L12_13 = Mv_safeTaskAbort
          L13_14 = L8_9
          L12_13 = L12_13(L13_14)
          L8_9 = L12_13
          _phase = 2
          L12_13 = Fn_setCatWarpCheckPoint
          L13_14 = "locator2_resetpos_port_02"
          L12_13(L13_14)
          L12_13 = Mv_safeTaskAbort
          L13_14 = L11_12
          L12_13 = L12_13(L13_14)
          L11_12 = L12_13
          L12_13 = Mv_safeTaskAbort
          L13_14 = L6_7
          L12_13 = L12_13(L13_14)
          L6_7 = L12_13
          L12_13 = Mv_safeTaskAbort
          L13_14 = L7_8
          L12_13 = L12_13(L13_14)
          L7_8 = L12_13
          L12_13 = Fn_sendEventComSb
          L13_14 = "requestDestroyEnemy"
          L14_15 = "enmgen2_sky"
          L12_13(L13_14, L14_15)
          L12_13 = Fn_sendEventComSb
          L13_14 = "requestDestroyEnemy"
          L14_15 = "enmgen2_sky02"
          L12_13(L13_14, L14_15)
          L12_13 = Fn_sendEventComSb
          L13_14 = "requestDestroyEnemy"
          L14_15 = "enmgen2_luna_only_b_rich"
          L12_13(L13_14, L14_15)
          L12_13 = Fn_blackout
          L12_13()
          L12_13 = setUserCtrlOn
          L13_14 = false
          L12_13(L13_14)
          L12_13 = Fn_resetPcPos
          L13_14 = "locator2_resetpos_port"
          L12_13(L13_14)
          L12_13 = grabReset
          L13_14 = RICH_MAN_ID
          L14_15 = "locator2_rich_man_pos_port"
          L12_13(L13_14, L14_15)
          L12_13 = Fn_playMotionNpc
          L13_14 = RICH_MAN_ID
          L14_15 = "stay_01"
          L15_16 = false
          L12_13(L13_14, L14_15, L15_16)
          L12_13 = waitSeconds
          L13_14 = 1.5
          L12_13(L13_14)
          L12_13 = Fn_fadein
          L12_13()
          L12_13 = waitSeconds
          L13_14 = 1
          L12_13(L13_14)
          L12_13 = setUserCtrlOn
          L13_14 = true
          L12_13(L13_14)
          L12_13 = Fn_kaiwaDemoView
          L13_14 = "sm19_00200k"
          L12_13(L13_14)
          L12_13 = waitSeconds
          L13_14 = 1
          L12_13(L13_14)
          L12_13 = Fn_missionView
          L13_14 = "sm19_01007"
          L12_13(L13_14)
          L12_13 = waitSeconds
          L13_14 = 1.3
          L12_13(L13_14)
          L12_13 = Fn_naviSet
          L13_14 = findGameObject2
          L14_15 = "Node"
          L15_16 = "locator2_navi_return_poor"
          L19_20 = L13_14(L14_15, L15_16)
          L12_13(L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L13_14(L14_15, L15_16))
          _more_important_navi_view = true
          L12_13 = invokeTask
          function L13_14()
            while true do
              if Fn_isInSightTarget(_puppet_tbl[RICH_MAN_ID], 1) == false and Fn_getDistanceToPlayer(_puppet_tbl[RICH_MAN_ID]) > 80 then
                print("\n\n\n\n\n\233\135\145\230\140\129\227\129\161\227\129\168\232\136\185\227\130\146\230\182\136\227\129\153")
                _puppet_tbl[RICH_MAN_ID]:setActive(false)
                break
              end
              wait()
            end
          end
          L12_13(L13_14)
          L12_13 = invokeTask
          function L13_14()
            local L0_21
            while true do
              L0_21 = findGameObject2
              L0_21 = L0_21("Node", "locator2_navi_return_lo_a_05")
              if L0_21 ~= nil and Mv_raycastCameraSight(L0_21, 100) then
                Fn_captionView("sm19_01027")
                break
              end
              wait()
            end
          end
          L12_13(L13_14)
          break
        else
          L5_6 = _select
          L6_7 = STEP
          L6_7 = L6_7.SELECT_SISTER
          if L5_6 == L6_7 then
            L5_6 = print
            L6_7 = "\n\n\n\n\n\232\136\185\227\130\146\230\182\136\227\129\153"
            L5_6(L6_7)
            _phase = 5
            L5_6 = Fn_setCatWarpCheckPoint
            L6_7 = "locator2_pc_start_pos"
            L5_6(L6_7)
            L5_6 = Fn_pcSensorOn
            L6_7 = "pccubesensor2_catwarning_b_phase05"
            L5_6(L6_7)
            L5_6 = Fn_pcSensorOn
            L6_7 = "pccubesensor2_catwarp_b_phase05"
            L5_6(L6_7)
            L5_6 = Fn_sendEventComSb
            L6_7 = "isSpawnEnemy"
            L7_8 = "enmgen2_center_only_b"
            L5_6 = L5_6(L6_7, L7_8)
            if not L5_6 then
              L5_6 = Fn_sendEventComSb
              L6_7 = "requestSpawnEnemy"
              L7_8 = "enmgen2_center_only_b"
              L5_6(L6_7, L7_8)
              L5_6 = Fn_sendEventComSb
              L6_7 = "requestChangeEnemyMarker"
              L7_8 = false
              L8_9 = "enmgen2_center_only_b"
              L5_6(L6_7, L7_8, L8_9)
            end
            L5_6 = Fn_sendEventComSb
            L6_7 = "isSpawnEnemy"
            L7_8 = "enmgen2_luna_only_b"
            L5_6 = L5_6(L6_7, L7_8)
            if not L5_6 then
              L5_6 = Fn_sendEventComSb
              L6_7 = "requestSpawnEnemy"
              L7_8 = "enmgen2_luna_only_b"
              L5_6(L6_7, L7_8)
              L5_6 = Fn_sendEventComSb
              L6_7 = "requestChangeEnemyMarker"
              L7_8 = false
              L8_9 = "enmgen2_luna_only_b"
              L5_6(L6_7, L7_8, L8_9)
            end
            L5_6 = Fn_setGrabNpc
            L6_7 = RICH_MAN_ID
            L7_8 = true
            L8_9 = true
            L5_6(L6_7, L7_8, L8_9)
            L5_6 = Fn_kaiwaDemoView
            L6_7 = "sm19_00330k"
            L5_6(L6_7)
            L5_6 = Fn_playMotionNpc
            L6_7 = RICH_MAN_ID
            L7_8 = "man48_scared_sm19_00"
            L8_9 = false
            L5_6(L6_7, L7_8, L8_9)
            L5_6 = Fn_missionView
            L6_7 = "sm19_01008"
            L5_6(L6_7)
            L5_6 = waitSeconds
            L6_7 = 3.8
            L5_6(L6_7)
            break
          end
        end
      end
    end
  end
  L5_6 = Fn_sendEventComSb
  L6_7 = "isSpawnEnemy"
  L7_8 = "enmgen2_center_only_b"
  L5_6 = L5_6(L6_7, L7_8)
  if not L5_6 then
    L5_6 = Fn_sendEventComSb
    L6_7 = "requestSpawnEnemy"
    L7_8 = "enmgen2_center_only_b"
    L5_6(L6_7, L7_8)
    L5_6 = Fn_sendEventComSb
    L6_7 = "requestChangeEnemyMarker"
    L7_8 = false
    L8_9 = "enmgen2_center_only_b"
    L5_6(L6_7, L7_8, L8_9)
  end
  L5_6 = Fn_sendEventComSb
  L6_7 = "isSpawnEnemy"
  L7_8 = "enmgen2_luna_only_b"
  L5_6 = L5_6(L6_7, L7_8)
  if not L5_6 then
    L5_6 = Fn_sendEventComSb
    L6_7 = "requestSpawnEnemy"
    L7_8 = "enmgen2_luna_only_b"
    L5_6(L6_7, L7_8)
    L5_6 = Fn_sendEventComSb
    L6_7 = "requestChangeEnemyMarker"
    L7_8 = false
    L8_9 = "enmgen2_luna_only_b"
    L5_6(L6_7, L7_8, L8_9)
  end
  _grab_cap = false
  L5_6 = Fn_setNpcActive
  L6_7 = SISTER_ID
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = Fn_repeatPlayMotion
  L6_7 = SISTER_ID
  L7_8 = "cry_00"
  L8_9 = {L9_10}
  L9_10 = "cry_00"
  L5_6 = L5_6(L6_7, L7_8, L8_9)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_return_poor_01"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_can_see_nevi"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_discover_area"
  L6_7(L7_8)
  L6_7 = enemyRespawn
  L7_8 = "enmgen2_center_only_b"
  L6_7 = L6_7(L7_8)
  L7_8 = _select
  L8_9 = STEP
  L8_9 = L8_9.SELECT_RICH
  if L7_8 == L8_9 then
    while true do
      L7_8 = _in_center_area
      if not L7_8 then
        L7_8 = wait
        L7_8()
      end
    end
    _phase = 5
    L7_8 = Fn_pcSensorOff
    L8_9 = "pccubesensor2_catwarning_b_phase01"
    L7_8(L8_9)
    L7_8 = Fn_pcSensorOff
    L8_9 = "pccubesensor2_catwarp_b_phase01"
    L7_8(L8_9)
    L7_8 = Fn_setCatWarpCheckPoint
    L8_9 = "locator2_resetpos_near_sister_lo05_02"
    L7_8(L8_9)
    L7_8 = Fn_pcSensorOn
    L8_9 = "pccubesensor2_catwarning_b_phase05"
    L7_8(L8_9)
    L7_8 = Fn_pcSensorOn
    L8_9 = "pccubesensor2_catwarp_b_phase05"
    L7_8(L8_9)
    L7_8 = Fn_missionView
    L8_9 = "sm19_01010"
    L7_8(L8_9)
    L7_8 = waitSeconds
    L8_9 = 2.5
    L7_8(L8_9)
  end
  L7_8 = Mv_isWaitPhase
  L7_8 = L7_8()
  if L7_8 then
    L7_8 = Fn_captionView
    L8_9 = "sm19_01009"
    L7_8(L8_9)
  end
  L7_8 = Mv_waitPhase
  L7_8()
  _sis_discover = true
  L7_8 = _select
  L8_9 = STEP
  L8_9 = L8_9.SELECT_RICH
  if L7_8 == L8_9 then
    L7_8 = Fn_disappearNpc
    L8_9 = RICH_MAN_ID
    L7_8(L8_9)
  end
  L7_8 = Mv_safeTaskAbort
  L8_9 = L6_7
  L7_8 = L7_8(L8_9)
  L6_7 = L7_8
  L7_8 = 0
  while true do
    L8_9 = Fn_get_distance
    L9_10 = Fn_getPlayer
    L9_10 = L9_10()
    L10_11 = L9_10
    L9_10 = L9_10.getWorldPos
    L9_10 = L9_10(L10_11)
    L11_12 = L1_2
    L10_11 = L1_2.getWorldPos
    L19_20 = L10_11(L11_12)
    L8_9 = L8_9(L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L10_11(L11_12))
    if L8_9 < 3 then
      L9_10 = Fn_isInSightTarget
      L10_11 = L1_2
      L11_12 = 0.5
      L9_10 = L9_10(L10_11, L11_12)
    end
    if not L9_10 then
      L9_10 = SISTER_LOOK_DISTANCE
      if L8_9 <= L9_10 then
        L9_10 = Fn_getPcPosRot
        L10_11 = L9_10()
        L11_12 = L9_10.y
        L11_12 = L11_12 + 1.5
        L9_10.y = L11_12
        L11_12 = _puppet_tbl
        L12_13 = SISTER_ID
        L11_12 = L11_12[L12_13]
        L12_13 = L11_12
        L11_12 = L11_12.getWorldPos
        L11_12 = L11_12(L12_13)
        L12_13 = L11_12.y
        L12_13 = L12_13 + 1.2
        L11_12.y = L12_13
        L12_13 = Query
        L13_14 = L12_13
        L12_13 = L12_13.setEyeSightTransform
        L14_15 = L9_10
        L15_16 = L10_11
        L12_13(L13_14, L14_15, L15_16)
        L12_13 = Query
        L13_14 = L12_13
        L12_13 = L12_13.setEyeSightAngle
        L14_15 = Deg2Rad
        L15_16 = 60
        L19_20 = L14_15(L15_16)
        L12_13(L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L14_15(L15_16))
        L12_13 = Query
        L13_14 = L12_13
        L12_13 = L12_13.setEyeSightRange
        L14_15 = 30
        L12_13(L13_14, L14_15)
        L12_13 = Query
        L13_14 = L12_13
        L12_13 = L12_13.debugDrawEyeSight
        L14_15 = {}
        L14_15.r = 1
        L14_15.g = 1
        L14_15.b = 1
        L12_13(L13_14, L14_15)
        L12_13 = Query
        L13_14 = L12_13
        L12_13 = L12_13.raycastEyeSight
        L14_15 = L11_12
        L12_13 = L12_13(L13_14, L14_15)
        L13_14 = false
        if not L12_13 then
          L14_15 = DebugDraw
          L15_16 = L14_15
          L14_15 = L14_15.setColor
          L16_17 = 0
          L17_18 = 1
          L18_19 = 0
          L14_15(L15_16, L16_17, L17_18, L18_19)
          L13_14 = true
        else
          L14_15 = DebugDraw
          L15_16 = L14_15
          L14_15 = L14_15.setColor
          L16_17 = 1
          L17_18 = 0
          L18_19 = 0
          L14_15(L15_16, L16_17, L17_18, L18_19)
          L13_14 = false
        end
        L14_15 = DebugDraw
        L15_16 = L14_15
        L14_15 = L14_15.drawLines
        L16_17 = {L17_18, L18_19}
        L17_18 = L9_10
        L18_19 = L11_12
        L14_15(L15_16, L16_17)
      end
    end
    if not L13_14 then
      L9_10 = CRYING_DISTANCE
      if L8_9 < L9_10 then
        if L7_8 <= 0 then
          L7_8 = CRYING_INTERVAL
          L9_10 = viewTarget
          L10_11 = "locator2_sister_01_pos_01"
          L11_12 = 0.8
          L9_10(L10_11, L11_12)
          L9_10 = CRYING_DISTANCE
          L9_10 = L8_9 / L9_10
          L9_10 = 1 - L9_10
          L9_10 = L9_10 * 0.75
          L9_10 = L9_10 + 0.25
          L10_11 = Sound
          L11_12 = L10_11
          L10_11 = L10_11.playSE
          L12_13 = "w09_917c"
          L13_14 = L9_10
          L14_15 = ""
          L10_11(L11_12, L12_13, L13_14, L14_15)
          L10_11 = Fn_captionViewWait
          L11_12 = "sm19_01029"
          L10_11(L11_12)
        else
          L7_8 = L7_8 - 1
        end
      else
        L7_8 = 0
      end
      L9_10 = wait
      L9_10()
    end
  end
  _phase = 6
  L8_9 = Fn_setCatWarpCheckPoint
  L9_10 = "locator2_resetpos_near_sister_lo05_02"
  L8_9(L9_10)
  L8_9 = setNaviAndView
  L9_10 = _puppet_tbl
  L10_11 = SISTER_ID
  L9_10 = L9_10[L10_11]
  L10_11 = 0.5
  L8_9(L9_10, L10_11)
  L8_9 = Fn_pcSensorOff
  L9_10 = "pccubesensor2_brother_hide_01"
  L8_9(L9_10)
  L8_9 = Fn_sendEventComSb
  L9_10 = "requestIdleEnemy"
  L10_11 = true
  L11_12 = "enmgen2_water"
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = Fn_sendEventComSb
  L9_10 = "requestIdleEnemy"
  L10_11 = true
  L11_12 = "enmgen2_center_only_b"
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = Fn_sendEventComSb
  L9_10 = "requestIdleEnemy"
  L10_11 = true
  L11_12 = "enmgen2_luna_only_b"
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = setUserCtrlOn
  L9_10 = false
  L8_9(L9_10)
  L8_9 = Mv_viewObj
  L9_10 = _puppet_tbl
  L10_11 = SISTER_ID
  L9_10 = L9_10[L10_11]
  L8_9 = L8_9(L9_10)
  L9_10 = Fn_captionViewWait
  L10_11 = "sm19_01011"
  L9_10(L10_11)
  L9_10 = Mv_safeTaskAbort
  L10_11 = L8_9
  L9_10 = L9_10(L10_11)
  L8_9 = L9_10
  L9_10 = setUserCtrlOn
  L10_11 = true
  L9_10(L10_11)
  L9_10 = Fn_sendEventComSb
  L10_11 = "requestIdleEnemy"
  L11_12 = false
  L12_13 = "enmgen2_water"
  L9_10(L10_11, L11_12, L12_13)
  L9_10 = Fn_sendEventComSb
  L10_11 = "requestIdleEnemy"
  L11_12 = false
  L12_13 = "enmgen2_center_only_b"
  L9_10(L10_11, L11_12, L12_13)
  L9_10 = Fn_sendEventComSb
  L10_11 = "requestIdleEnemy"
  L11_12 = false
  L12_13 = "enmgen2_luna_only_b"
  L9_10(L10_11, L11_12, L12_13)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_arrive_sister"
  L9_10(L10_11)
  L9_10 = 0
  L10_11 = invokeTask
  function L11_12()
    while true do
      if L9_10 == 10 then
        Fn_captionView("sm19_01012")
      elseif L9_10 == 20 then
        Fn_captionView("sm19_01013")
      elseif L9_10 == 30 then
        Fn_captionView("sm19_01014")
      end
      waitSeconds(1)
      L9_10 = L9_10 + 1
    end
  end
  L10_11 = L10_11(L11_12)
  L11_12 = enemyRespawn
  L12_13 = "enmgen2_center_only_b"
  L11_12 = L11_12(L12_13)
  L12_13 = Mv_waitPhase
  L12_13()
  L12_13 = Mv_safeTaskAbort
  L13_14 = L11_12
  L12_13 = L12_13(L13_14)
  L11_12 = L12_13
  L12_13 = Mv_safeTaskAbort
  L13_14 = L10_11
  L12_13 = L12_13(L13_14)
  L10_11 = L12_13
  L12_13 = Fn_warpNpc
  L13_14 = BROTHER_ID
  L14_15 = "locator2_brother_01_pos_03"
  L12_13(L13_14, L14_15)
  L12_13 = Fn_playMotionNpc
  L13_14 = BROTHER_ID
  L14_15 = "stay"
  L15_16 = false
  L12_13(L13_14, L14_15, L15_16)
  L12_13 = Fn_setNpcActive
  L13_14 = BROTHER_ID
  L14_15 = true
  L12_13(L13_14, L14_15)
  L12_13 = nil
  L13_14 = _select
  L14_15 = STEP
  L14_15 = L14_15.SELECT_SISTER
  if L13_14 == L14_15 then
    L13_14 = Fn_warpNpc
    L14_15 = RICH_MAN_ID
    L15_16 = "locator2_rich_man_hide"
    L13_14(L14_15, L15_16)
    L13_14 = Fn_repeatPlayMotion
    L14_15 = RICH_MAN_ID
    L15_16 = "vendor_angry_00"
    L16_17 = {L17_18}
    L17_18 = "vendor_angry_00"
    L13_14 = L13_14(L14_15, L15_16, L16_17)
    L12_13 = L13_14
  end
  L13_14 = waitSeconds
  L14_15 = 0.5
  L13_14(L14_15)
  L13_14 = Fn_kaiwaDemoView
  L14_15 = "sm19_00300k"
  L13_14(L14_15)
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.setGrabExceptionalObject
  L15_16 = {L16_17}
  L16_17 = SISTER_ID
  L13_14(L14_15, L15_16)
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_lo_a_05"
  L13_14(L14_15)
  L13_14 = enemyRespawn
  L14_15 = "enmgen2_center_only_b"
  L13_14 = L13_14(L14_15)
  L14_15 = Fn_setGrabNpc
  L15_16 = SISTER_ID
  L16_17 = false
  L17_18 = false
  L14_15(L15_16, L16_17, L17_18)
  L14_15 = Fn_missionView
  L15_16 = "sm19_01015"
  L14_15(L15_16)
  L14_15 = waitSeconds
  L15_16 = 1.3
  L14_15(L15_16)
  L14_15 = setNaviAndView
  L15_16 = _puppet_tbl
  L16_17 = SISTER_ID
  L15_16 = L15_16[L16_17]
  L16_17 = 0.5
  L14_15(L15_16, L16_17)
  _more_important_navi_view = true
  L14_15 = _puppet_tbl
  L15_16 = SISTER_ID
  L14_15 = L14_15[L15_16]
  L15_16 = L14_15
  L14_15 = L14_15.isGrabbed
  L14_15 = L14_15(L15_16)
  if L14_15 == false then
    L14_15 = Fn_pcSensorOn
    L15_16 = "pccubesensor2_warning_area"
    L14_15(L15_16)
  end
  while true do
    L14_15 = _puppet_tbl
    L15_16 = SISTER_ID
    L14_15 = L14_15[L15_16]
    L15_16 = L14_15
    L14_15 = L14_15.isGrabbed
    L14_15 = L14_15(L15_16)
    if L14_15 == false then
      L14_15 = wait
      L14_15()
    end
  end
  _phase = 7
  L14_15 = Fn_setCatWarpCheckPoint
  L15_16 = "locator2_resetpos_near_sister_lo05_02"
  L14_15(L15_16)
  L14_15 = Player
  L15_16 = L14_15
  L14_15 = L14_15.setGrabExceptionalObject
  L16_17 = {}
  L14_15(L15_16, L16_17)
  L14_15 = Mv_safeTaskAbort
  L15_16 = L13_14
  L14_15 = L14_15(L15_16)
  L13_14 = L14_15
  L14_15 = Fn_pcSensorOff
  L15_16 = "pccubesensor2_warning_area"
  L14_15(L15_16)
  L14_15 = Fn_tutorialCaptionKill
  L14_15()
  L14_15 = Fn_naviKill
  L14_15()
  L14_15 = Mv_safeTaskAbort
  L15_16 = L5_6
  L14_15 = L14_15(L15_16)
  L5_6 = L14_15
  L14_15 = waitSeconds
  L15_16 = 1
  L14_15(L15_16)
  L14_15 = setNaviAndView
  L15_16 = _puppet_tbl
  L16_17 = BROTHER_ID
  L15_16 = L15_16[L16_17]
  L16_17 = 0.5
  L14_15(L15_16, L16_17)
  L14_15 = Fn_pcSensorOn
  L15_16 = "pccubesensor2_sister_01"
  L14_15(L15_16)
  L14_15 = waitSeconds
  L15_16 = 2
  L14_15(L15_16)
  L14_15 = Sound
  L15_16 = L14_15
  L14_15 = L14_15.playSE
  L16_17 = "w09_920"
  L17_18 = 1
  L18_19 = ""
  L14_15(L15_16, L16_17, L17_18, L18_19)
  L14_15 = Fn_captionView
  L15_16 = "sm19_01016"
  L14_15(L15_16)
  L14_15 = enemyRespawn
  L15_16 = "enmgen2_center_only_b"
  L14_15 = L14_15(L15_16)
  L15_16 = nil
  L16_17 = invokeTask
  function L17_18()
    local L0_22
    while true do
      L0_22 = findGameObject2
      L0_22 = L0_22("Node", _puppet_tbl[BROTHER_ID])
      if Fn_getDistanceToPlayer(L0_22) < 30 and L15_16 == nil then
        invokeTask(function()
          Fn_playMotionNpc(RICH_MAN_ID, "scared_nevy_in_00", true)
          Fn_playMotionNpc(RICH_MAN_ID, "scared_nevy_00", false)
        end)
        Fn_turnNpc(BROTHER_ID)
        L15_16 = Fn_repeatPlayMotion(BROTHER_ID, "wavehand_00", {
          "wavehand_00"
        })
        Sound:playSE("w09_920", 1, "")
      elseif Fn_getDistanceToPlayer(L0_22) < 10 and L15_16 ~= nil then
        Fn_turnNpc(BROTHER_ID)
        break
      end
      wait()
    end
  end
  L16_17 = L16_17(L17_18)
  L17_18 = Mv_waitPhase
  L17_18()
  L17_18 = Fn_naviKill
  L17_18()
  L17_18 = Mv_safeTaskAbort
  L18_19 = L16_17
  L17_18 = L17_18(L18_19)
  L16_17 = L17_18
  L17_18 = Mv_safeTaskAbort
  L18_19 = L15_16
  L17_18 = L17_18(L18_19)
  L15_16 = L17_18
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestChangeEnemyMarker"
  L19_20 = false
  L17_18(L18_19, L19_20, "enmgen2_water")
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestChangeEnemyMarker"
  L19_20 = false
  L17_18(L18_19, L19_20, "enmgen2_center_only_b")
  L17_18 = Mv_safeTaskAbort
  L18_19 = L14_15
  L17_18 = L17_18(L18_19)
  L14_15 = L17_18
  L17_18 = Fn_blackout
  L17_18()
  L17_18 = Player
  L18_19 = L17_18
  L17_18 = L17_18.setStay
  L19_20 = true
  L17_18(L18_19, L19_20)
  L17_18 = setUserCtrlOn
  L18_19 = false
  L17_18(L18_19)
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestDestroyEnemy"
  L19_20 = "enmgen2_water"
  L17_18(L18_19, L19_20)
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestDestroyEnemy"
  L19_20 = "enmgen2_luna_only_b"
  L17_18(L18_19, L19_20)
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestDestroyEnemy"
  L19_20 = "enmgen2_center_only_b"
  L17_18(L18_19, L19_20)
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestIdleEnemy"
  L19_20 = true
  L17_18(L18_19, L19_20, "enmgen2_water")
  L17_18 = Fn_sendEventComSb
  L18_19 = "requestIdleEnemy"
  L19_20 = true
  L17_18(L18_19, L19_20, "enmgen2_center_only_b")
  L17_18 = Fn_resetPcPos
  L18_19 = "locator2_pc_pos_02"
  L17_18(L18_19)
  L17_18 = Fn_warpNpc
  L18_19 = BROTHER_ID
  L19_20 = "locator2_brother_01_pos_03"
  L17_18(L18_19, L19_20)
  L17_18 = grabReset
  L18_19 = SISTER_ID
  L19_20 = "locator2_sister_01_pos_02"
  L17_18(L18_19, L19_20)
  L17_18 = _select
  L18_19 = STEP
  L18_19 = L18_19.SELECT_SISTER
  if L17_18 == L18_19 then
    L17_18 = Fn_turnNpc
    L18_19 = RICH_MAN_ID
    L19_20 = _puppet_tbl
    L19_20 = L19_20[BROTHER_ID]
    L17_18(L18_19, L19_20)
    L17_18 = Fn_playMotionNpc
    L18_19 = RICH_MAN_ID
    L19_20 = "vendor_angry_00"
    L17_18(L18_19, L19_20, false)
  end
  L17_18 = waitSeconds
  L18_19 = 1
  L17_18(L18_19)
  L17_18 = Fn_fadein
  L17_18()
  L17_18 = Fn_moveNpc
  L18_19 = SISTER_ID
  L19_20 = {
    "locator2_sister_01_pos_03"
  }
  L17_18 = L17_18(L18_19, L19_20, {runLength = -1})
  while true do
    L18_19 = Mv_isSafeTaskRunning
    L19_20 = L17_18
    L18_19 = L18_19(L19_20)
    if L18_19 then
      L18_19 = wait
      L18_19()
    end
  end
  L18_19 = Mv_safeTaskAbort
  L19_20 = L17_18
  L18_19 = L18_19(L19_20)
  L17_18 = L18_19
  L18_19 = Fn_turnNpc
  L19_20 = BROTHER_ID
  L18_19(L19_20)
  L18_19 = _select
  L19_20 = STEP
  L19_20 = L19_20.SELECT_RICH
  if L18_19 == L19_20 then
    L18_19 = Fn_kaiwaDemoView
    L19_20 = "sm19_00310k"
    L18_19(L19_20)
    L18_19 = Fn_turnNpc
    L19_20 = SISTER_ID
    L18_19(L19_20)
    L18_19 = Fn_turnNpc
    L19_20 = BROTHER_ID
    L18_19(L19_20)
  else
    L18_19 = Mv_safeTaskAbort
    L19_20 = L12_13
    L18_19 = L18_19(L19_20)
    L12_13 = L18_19
    L18_19 = Fn_playMotionNpc
    L19_20 = RICH_MAN_ID
    L18_19(L19_20, "stay", false)
    L18_19 = waitSeconds
    L19_20 = 0.5
    L18_19(L19_20)
    L18_19 = Fn_kaiwaDemoView
    L19_20 = "sm19_00350k"
    L18_19(L19_20)
    L18_19 = Fn_turnNpc
    L19_20 = BROTHER_ID
    L18_19(L19_20)
    L18_19 = _sdemo_cut02
    L19_20 = L18_19
    L18_19 = L18_19.set
    L18_19(L19_20, "locator2_ang_cam_01", "locator2_cam_aim_01")
    L18_19 = _sdemo_cut02
    L19_20 = L18_19
    L18_19 = L18_19.play
    L18_19(L19_20)
    L18_19 = Fn_captionView
    L19_20 = "sm19_01017"
    L18_19(L19_20)
    L18_19 = invokeTask
    function L19_20()
      Fn_playMotionNpc(RICH_MAN_ID, "talk_angry_00", false)
      waitSeconds(3)
      Fn_playMotionNpc(RICH_MAN_ID, "stay", false, {animBlendDuration = 0.8})
    end
    L18_19(L19_20)
    L18_19 = waitSeconds
    L19_20 = 0.5
    L18_19(L19_20)
    L18_19 = Sound
    L19_20 = L18_19
    L18_19 = L18_19.playSE
    L18_19(L19_20, "m03_913b", 1, "")
    L18_19 = waitSeconds
    L19_20 = 2.5
    L18_19(L19_20)
    L18_19 = {
      L19_20,
      "locator2_rich_man_escape_02"
    }
    L19_20 = "locator2_rich_man_escape_01"
    L19_20 = Fn_moveNpc
    L19_20 = L19_20(RICH_MAN_ID, L18_19, {runLength = -1})
    Fn_turnNpc(SISTER_ID)
    waitSeconds(2.5)
    _sdemo_cut02:stop(1)
    waitSeconds(1.5)
    Fn_kaiwaDemoView("sm19_00370k")
    L19_20 = Mv_safeTaskAbort(L19_20)
    Fn_playMotionNpc(RICH_MAN_ID, "stay_01", false)
    Fn_setNpcActive(RICH_MAN_ID, false)
  end
  L18_19 = Fn_sendEventComSb
  L19_20 = "requestIdleEnemy"
  L18_19(L19_20, false, "enmgen2_water")
  L18_19 = Fn_sendEventComSb
  L19_20 = "requestIdleEnemy"
  L18_19(L19_20, false, "enmgen2_center_only_b")
  L18_19 = Player
  L19_20 = L18_19
  L18_19 = L18_19.setStay
  L18_19(L19_20, false)
  L18_19 = setUserCtrlOn
  L19_20 = true
  L18_19(L19_20)
  L18_19 = Vehicle
  L19_20 = L18_19
  L18_19 = L18_19.SetPanic
  L18_19(L19_20, false)
  L18_19 = Mv_safeTaskAbort
  L19_20 = npc_re_grab_task
  L18_19 = L18_19(L19_20)
  npc_re_grab_task = L18_19
  L18_19 = print
  L19_20 = "\n\n\n\n\n\232\136\185\227\130\146\230\182\136\227\129\151\227\129\166\230\172\161\227\129\184"
  L18_19(L19_20)
  L18_19 = Fn_setKeepPlayerPos
  L18_19()
  L18_19 = Fn_setNextMissionFlag
  L18_19()
  L18_19 = Fn_nextMission
  L18_19()
  L18_19 = Fn_exitSandbox
  L18_19()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function grabReset(A0_23, A1_24)
  Fn_appendNpcArea(A0_23, A1_24)
  wait()
  Fn_setGrabReleaseNpc(A0_23)
  wait()
  Fn_warpNpc(A0_23, A1_24)
  wait()
end
function enemyRespawn(A0_25)
  return (invokeTask(function()
    while true do
      if Fn_sendEventComSb("isEnemyGroupAllDead", A0_25) then
        waitSeconds(12)
        Fn_sendEventComSb("requestSpawnEnemy", A0_25)
      end
      waitSeconds(1)
    end
  end))
end
function pccubesensor2_rich_grab_cap_01_OnEnter(A0_26)
  if _grab_cap == true and not _puppet_tbl[RICH_MAN_ID]:isGrabbed() then
    Fn_tutorialCaption("grab")
  end
  Fn_setGrabNpc(RICH_MAN_ID, false, false)
end
function pccubesensor2_rich_grab_cap_01_OnLeave(A0_27)
  Fn_tutorialCaptionKill()
  Fn_captionView("sm19_01018")
  Fn_setGrabNpc(RICH_MAN_ID, true, true)
end
function pccubesensor2_brother_hide_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_brother_hide_01")
  if _select == STEP.SELECT_SISTER then
    invokeTask(function()
      Fn_playMotionNpc(BROTHER_ID, "stay", false)
      Fn_turnNpc(BROTHER_ID)
      Fn_kaiwaDemoView("sm19_00150k")
      Fn_naviSet(findGameObject2("Node", "pccubesensor2_lo_a_05"))
      _more_important_navi_view = true
      _brother_hit_navi = true
      Fn_playMotionNpc(BROTHER_ID, "scared_nevy_in_00", true)
      Fn_playMotionNpc(BROTHER_ID, "scared_nevy_00", false)
    end)
  end
end
function pccubesensor2_near_send_area_OnEnter()
  Fn_pcSensorOff("pccubesensor2_near_send_area")
  invokeTask(function()
    Fn_sendEventComSb("requestChangeEnemyMarker", false, "enmgen2_sky")
    Fn_appendNpcArea(RICH_MAN_ID, "locator2_rich_man_pos_port")
    Fn_captionViewWait("sm19_01019")
    Fn_captionViewWait("sm19_01020")
  end)
end
function pccubesensor2_send_area_OnEnter()
  Fn_pcSensorOff("pccubesensor2_send_area")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_return_poor_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_return_poor_01")
  if _brother_hit_navi == false then
    Fn_naviKill()
    _more_important_navi_view = false
  end
  if _select == STEP.SELECT_RICH and not _in_center_area then
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_lo_a_05"))
    _more_important_navi_view = true
  end
end
function pccubesensor2_return_poor_01_OnLeave()
  if _sis_discover == false then
    if _brother_hit_navi == false then
      setNaviAndView(findGameObject2("Node", "locator2_navi_return_poor"), 0.5)
      _more_important_navi_view = true
    end
  elseif _near_sister == true then
    setNaviAndView(findGameObject2("Node", "locator2_sister_01_pos_01"), 0.5)
    _more_important_navi_view = true
  end
end
function pccubesensor2_can_see_nevi_OnEnter()
  Fn_naviKill()
  _more_important_navi_view = false
  Fn_sendEventComSb("requestChangeEnemyMarker", true, "enmgen2_center_only_b")
  Fn_pcSensorOff("pccubesensor2_can_see_nevi")
  invokeTask(function()
    viewTarget(findGameObject2("Node", "locator2_lo_a_05"), 0.5)
    waitSeconds(1)
    Fn_captionViewWait("sm19_01022")
    if not _sis_discover and _select == STEP.SELECT_SISTER then
      Fn_captionViewWait("sm19_01023")
    end
    waitSeconds(2)
    _in_center_area = true
  end)
  if _brother_hit_navi == true then
    _brother_hit_navi = false
  end
end
function pccubesensor2_discover_area_OnEnter()
  Fn_pcSensorOff("pccubesensor2_return_poor_01")
  Fn_pcSensorOff("pccubesensor2_discover_area")
  Mv_gotoNextPhase()
end
function pccubesensor2_arrive_sister_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_arrive_sister")
  Mv_gotoNextPhase()
end
function pccubesensor2_warning_area_OnEnter()
  Fn_captionViewEnd()
  if _puppet_tbl[SISTER_ID]:isGrabbed() == false then
    Fn_tutorialCaption("grab")
  end
  Player:setGrabExceptionalObject({
    SISTER_ID
  })
  setNaviAndView(_puppet_tbl[SISTER_ID], 0.5)
  _more_important_navi_view = true
end
function pccubesensor2_warning_area_OnLeave()
  invokeTask(function()
    Fn_tutorialCaptionKill()
    wait()
    Fn_captionView("sm19_01025", 0)
    Player:setGrabExceptionalObject({})
  end)
end
function pccubesensor2_sister_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_sister_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_catwarning_OnLeave()
  print("\232\173\166\229\145\138\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\159\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    local L0_28
    L0_28 = Player
    L0_28 = L0_28.isGravityControlMode
    L0_28 = L0_28(L0_28)
    if not L0_28 then
      L0_28 = Player
      L0_28 = L0_28.getAction
      L0_28 = L0_28(L0_28)
    elseif L0_28 == Player.kAction_Jump then
      L0_28 = Player
      L0_28 = L0_28.setStay
      L0_28(L0_28, true)
    end
    L0_28 = _more_important_navi_view
    if L0_28 == false then
      L0_28 = nil
      if _phase == 5 then
        L0_28 = "locator2_navi_return_lo_a_05"
      end
      if L0_28 ~= nil then
        Fn_naviSet(findGameObject2("Node", L0_28))
        _cat_navi_view = true
      end
    end
    L0_28 = _phase
    if L0_28 == 1 then
      L0_28 = Fn_captionViewWait
      L0_28("sm19_09005")
    else
      L0_28 = _phase
      if L0_28 == 2 then
        L0_28 = Fn_captionViewWait
        L0_28("sm19_09007")
      else
        L0_28 = _phase
        if L0_28 == 5 then
          L0_28 = _select
          if L0_28 == STEP.SELECT_RICH then
            L0_28 = Fn_captionViewWait
            L0_28("sm19_09007")
          else
            L0_28 = _select
            if L0_28 == STEP.SELECT_SISTER then
              L0_28 = Fn_captionViewWait
              L0_28("sm19_09003")
            end
          end
        else
          L0_28 = _phase
          if L0_28 == 6 then
            L0_28 = Fn_captionViewWait
            L0_28("sm19_09010")
          else
            L0_28 = _phase
            if L0_28 == 7 then
              L0_28 = Fn_captionViewWait
              L0_28("sm19_09005")
            end
          end
        end
      end
    end
    L0_28 = Player
    L0_28 = L0_28.setStay
    L0_28(L0_28, false)
  end)
end
function pccubesensor2_catwarp_OnLeave()
  print("\227\131\175\227\131\188\227\131\151\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\159\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    local L0_29, L1_30
    L0_29 = nil
    L1_30 = Fn_findNpc
    L1_30 = L1_30(RICH_MAN_ID)
    print("_npc_hdl =", L1_30)
    if L1_30 ~= nil and L1_30:isGrabbed() then
      L0_29 = RICH_MAN_ID
    end
    L1_30 = Fn_findNpc(SISTER_ID)
    if L1_30 ~= nil and L1_30:isGrabbed() then
      L0_29 = SISTER_ID
    end
    if _phase == 5 or _phase == 6 or _phase == 7 then
      Fn_sendEventComSb("requestIdleEnemy", true, "enmgen2_center_only_b")
      print("\227\130\187\227\131\179\227\130\191\227\131\188\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\227\130\162\227\130\164\227\131\137\227\131\171\233\150\139\229\167\139")
    end
    Fn_catWarp()
    if L0_29 ~= nil then
      Fn_warpNpc(L0_29, Fn_getCatWarpCheckPoint())
      Player:setGrabExceptionalObject({L0_29})
      waitSeconds(0.1)
      Fn_setGrabNpc(L0_29, false, false)
      Player:setGrabObject(_puppet_tbl[L0_29])
      Player:setGrabExceptionalObject({})
    end
    if _phase == 1 then
      Fn_captionView("sm19_09005")
    elseif _phase == 2 then
      Fn_captionView("sm19_09007")
    elseif _phase == 5 then
      if _select == STEP.SELECT_RICH then
        Fn_captionView("sm19_09007")
      elseif _select == STEP.SELECT_SISTER then
        Fn_captionView("sm19_09003")
      end
    elseif _phase == 6 then
      Fn_captionView("sm19_09010")
    elseif _phase == 7 then
      Fn_captionView("sm19_09005")
    end
    if _phase == 5 or _phase == 6 or _phase == 7 then
      waitSeconds(2)
      Fn_sendEventComSb("requestIdleEnemy", false, "enmgen2_center_only_b")
      print("\227\130\187\227\131\179\227\130\191\227\131\188\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\227\130\162\227\130\164\227\131\137\227\131\171\232\167\163\233\153\164")
    end
  end)
end
function pccubesensor2_catnavikill_OnEnter()
  if _cat_navi_view == true then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
