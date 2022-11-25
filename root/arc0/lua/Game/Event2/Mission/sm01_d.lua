dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm01_common.lua")
_enemy_03_cnt = 0
_enemy_round_num = 0
_enemy_max_num = 0
_is_enemy_alive = {}
_enmgen_hdl = {}
_enemy_table_ref = {}
_miz_is_dead = false
_is_attacked = false
_is_retrying = false
_sdemo_cut01 = nil
MIZ_SCREAM_DISTANCE = 200
MIZ_ENEMY_DISTANCE = 180
MIZ_ENEMY_ATTACK_WAIT = 300
enmgen2_area_03 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_e_01",
      name = "enemy01"
    },
    {
      type = "stalker",
      locator = "locator_e_02",
      name = "enemy02"
    },
    {
      type = "guardcore",
      locator = "locator_e_03",
      name = "enemy03"
    },
    {
      type = "imp",
      locator = "locator_e_04",
      name = "enemy04"
    },
    {
      type = "imp",
      locator = "locator_e_05",
      name = "enemy05"
    }
  },
  onObjectDead = function(A0_0, A1_1)
    _enemy_03_cnt = _enemy_03_cnt - 1
    _is_enemy_alive[A1_1:getName()] = false
    if A1_1:getName() == "enemy01" or A1_1:getName() == "enemy02" or A1_1:getName() == "enemy04" or A1_1:getName() == "enemy05" then
      Fn_sendEventComSb("endEnemyAttackMiz")
    end
  end
}
enmgen2_area_03_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator_e_10",
      name = "enemy01"
    },
    {
      type = "treecannon",
      locator = "locator_e_11",
      name = "enemy02"
    },
    {
      type = "giant",
      locator = "locator_e_12",
      name = "enemy03"
    }
  },
  onObjectDead = function(A0_2, A1_3)
    local L2_4
    L2_4 = _enemy_03_cnt
    L2_4 = L2_4 - 1
    _enemy_03_cnt = L2_4
    L2_4 = _is_enemy_alive
    L2_4[A1_3:getName()] = false
  end
}
function Initialize()
  local L0_5
  L0_5 = Fn_pcSensorOff
  L0_5("pccubesensor2_return_around_miz")
  L0_5 = {
    {
      name = MIZ_ID,
      type = "tkg05",
      node = "locator2_miz_d_01",
      use_fall = true
    }
  }
  Fn_setupNpc(L0_5)
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_area_03"))
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_area_03_02"))
  table.insert(_enemy_table_ref, enmgen2_area_03)
  table.insert(_enemy_table_ref, enmgen2_area_03_02)
  _enemy_round_num = 1
  _is_enemy_alive = {}
  for _FORV_4_, _FORV_5_ in pairs(_enemy_table_ref[_enemy_round_num].spawnSet) do
    _is_enemy_alive[_FORV_5_.name] = true
  end
  _enemy_03_cnt = #_enemy_table_ref[_enemy_round_num].spawnSet
  _enemy_max_num = _enemy_03_cnt
  _sdemo_cut01 = SDemo.create("sm03_a_cut01")
  _sdemo_cut01:set("locator2_sdemo_cam_d_01", "locator2_sdemo_aim_d_01")
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21
  L0_6(L1_7)
  L0_6()
  L0_6()
  L0_6(L1_7, L2_8)
  L3_9 = "locator2_d_escape_03"
  miz_escape_locate_talbe = L0_6
  for L3_9 = 1, #L1_7 do
    L4_10 = findGameObject2
    L5_11 = "Node"
    L6_12 = miz_escape_locate_talbe
    L6_12 = L6_12[L3_9]
    L4_10 = L4_10(L5_11, L6_12)
    if L4_10 ~= nil then
      L5_11 = Fn_sendEventComSb
      L6_12 = "addMizEscapePos"
      L8_14 = L4_10
      L7_13 = L4_10.getWorldPos
      L7_13 = L7_13(L8_14)
      L7_13 = L7_13.x
      L9_15 = L4_10
      L8_14 = L4_10.getWorldPos
      L8_14 = L8_14(L9_15)
      L8_14 = L8_14.y
      L10_16 = L4_10
      L9_15 = L4_10.getWorldPos
      L9_15 = L9_15(L10_16)
      L9_15 = L9_15.z
      L5_11(L6_12, L7_13, L8_14, L9_15)
    end
  end
  L0_6(L1_7, L2_8)
  L0_6(L1_7, L2_8)
  L0_6(L1_7, L2_8)
  L0_6()
  L0_6(L1_7)
  L3_9 = L0_6
  L2_8(L3_9)
  L3_9 = createMizWarpTask
  L3_9 = L3_9()
  L4_10 = updateCatWarp
  L5_11 = "locator2_pc_start_pos"
  L6_12 = nil
  L7_13 = false
  L8_14 = false
  L9_15 = "locator2_miz_d_01"
  L10_16 = true
  L11_17 = false
  L4_10(L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17)
  L4_10 = findGameObject2
  L5_11 = "Node"
  L6_12 = "locator2_pc_start_pos"
  L4_10 = L4_10(L5_11, L6_12)
  L5_11 = L4_10
  L4_10 = L4_10.getWorldPos
  L4_10 = L4_10(L5_11)
  L5_11 = findGameObject2
  L6_12 = "Node"
  L7_13 = "locator2_miz_d_01"
  L5_11 = L5_11(L6_12, L7_13)
  L6_12 = L5_11
  L5_11 = L5_11.getWorldPos
  L5_11 = L5_11(L6_12)
  L6_12 = Vector
  L7_13 = L4_10.x
  L8_14 = L5_11.x
  L7_13 = L7_13 + L8_14
  L7_13 = L7_13 / 2
  L8_14 = L4_10.y
  L9_15 = L5_11.y
  L8_14 = L8_14 + L9_15
  L8_14 = L8_14 / 2
  L9_15 = L4_10.z
  L10_16 = L5_11.z
  L9_15 = L9_15 + L10_16
  L9_15 = L9_15 / 2
  L6_12 = L6_12(L7_13, L8_14, L9_15)
  sensor_pos = L6_12
  L6_12 = getCatWarpAreaSize
  L7_13 = L4_10
  L8_14 = L5_11
  L6_12 = L6_12(L7_13, L8_14)
  L7_13 = createCatWarpSensor
  L8_14 = sensor_pos
  L9_15 = L6_12
  L10_16 = "catWarpSensor"
  L7_13 = L7_13(L8_14, L9_15, L10_16)
  L8_14 = createCatWarpSensor
  L9_15 = sensor_pos
  L10_16 = Vector
  L11_17 = L6_12.x
  L11_17 = L11_17 - 20
  L12_18 = L6_12.y
  L12_18 = L12_18 - 20
  L13_19 = L6_12.z
  L13_19 = L13_19 - 20
  L10_16 = L10_16(L11_17, L12_18, L13_19)
  L11_17 = "catWarpWarningSensor"
  L8_14 = L8_14(L9_15, L10_16, L11_17)
  L9_15 = Fn_missionView
  L10_16 = "sm01_02036"
  L9_15(L10_16)
  L9_15 = Fn_sendEventComSb
  L10_16 = "changeMissionTerm"
  L11_17 = "BACK"
  L9_15(L10_16, L11_17)
  L9_15 = waitSeconds
  L10_16 = 1.3
  L9_15(L10_16)
  L9_15 = Fn_pcSensorOn
  L10_16 = "pccubesensor2_return_around_miz"
  L9_15(L10_16)
  L9_15 = setNaviAndView
  L10_16 = findGameObject2
  L11_17 = "Node"
  L12_18 = "locator2_miz_d_01"
  L10_16 = L10_16(L11_17, L12_18)
  L11_17 = 0.5
  L9_15(L10_16, L11_17)
  L9_15 = waitSeconds
  L10_16 = 2.5
  L9_15(L10_16)
  L9_15 = 0
  while true do
    L10_16 = Fn_getDistanceToPlayer
    L11_17 = L1_7
    L10_16 = L10_16(L11_17)
    if L9_15 == 0 then
      L11_17 = MIZ_SCREAM_DISTANCE
      L11_17 = L11_17 + 150
      if L10_16 < L11_17 then
        L11_17 = Fn_captionView
        L12_18 = "sm01_03001"
        L11_17(L12_18)
        L9_15 = 1
      end
    elseif L9_15 == 1 then
      L11_17 = MIZ_SCREAM_DISTANCE
      L11_17 = L11_17 + 50
      if L10_16 < L11_17 then
        L11_17 = _enmgen_hdl
        L12_18 = _enemy_round_num
        L11_17 = L11_17[L12_18]
        L12_18 = L11_17
        L11_17 = L11_17.requestIdlingEnemy
        L13_19 = true
        L11_17(L12_18, L13_19)
        L9_15 = 2
      end
    elseif L9_15 == 2 then
      L11_17 = MIZ_ENEMY_DISTANCE
      if L10_16 < L11_17 then
        L11_17 = invokeTask
        function L12_18()
          local L0_22
          L0_22 = Sound
          L0_22 = L0_22.playSEHandle
          L0_22 = L0_22(L0_22, "mis020_radio", 1, "", L1_7)
          Sound:setAudibleRange(L0_22, 500)
          Fn_captionViewWait("sm01_03002")
          Fn_captionViewWait("sm01_03003")
        end
        L11_17(L12_18)
        break
      end
    end
    L11_17 = wait
    L11_17()
  end
  L10_16 = Mv_waitPhase
  L10_16()
  L10_16 = updateCatWarp
  L11_17 = "locator2_pc_reset_pos_01"
  L12_18 = "locator2_miz_d_01"
  L13_19 = false
  L14_20 = false
  L15_21 = "locator2_miz_d_01"
  L10_16(L11_17, L12_18, L13_19, L14_20, L15_21)
  L10_16 = findGameObject2
  L11_17 = "Node"
  L12_18 = "locator2_pc_reset_pos_01"
  L10_16 = L10_16(L11_17, L12_18)
  L11_17 = L10_16
  L10_16 = L10_16.getWorldPos
  L10_16 = L10_16(L11_17)
  sensor_pos = L10_16
  L10_16 = createCatWarpSensor
  L11_17 = sensor_pos
  L12_18 = Vector
  L13_19 = 100
  L14_20 = 100
  L15_21 = 145
  L12_18 = L12_18(L13_19, L14_20, L15_21)
  L13_19 = "catWarpSensor"
  L14_20 = L7_13
  L10_16 = L10_16(L11_17, L12_18, L13_19, L14_20)
  L7_13 = L10_16
  L10_16 = createCatWarpSensor
  L11_17 = sensor_pos
  L12_18 = Vector
  L13_19 = 80
  L14_20 = 80
  L15_21 = 125
  L12_18 = L12_18(L13_19, L14_20, L15_21)
  L13_19 = "catWarpWarningSensor"
  L14_20 = L8_14
  L10_16 = L10_16(L11_17, L12_18, L13_19, L14_20)
  L8_14 = L10_16
  L10_16 = Fn_pcSensorOff
  L11_17 = "pccubesensor2_return_around_miz"
  L10_16(L11_17)
  L10_16 = Fn_naviKill
  L10_16()
  L10_16 = Player
  L11_17 = L10_16
  L10_16 = L10_16.setStay
  L12_18 = true
  L13_19 = false
  L10_16(L11_17, L12_18, L13_19)
  L10_16 = Fn_blackout
  L10_16()
  L10_16 = Fn_warpNpc
  L11_17 = L0_6
  L12_18 = "locator2_miz_d_01"
  L10_16(L11_17, L12_18)
  L10_16 = Fn_resetPcPos
  L11_17 = "locator2_pc_reset_pos_01"
  L10_16(L11_17)
  L10_16 = _sdemo_cut01
  L11_17 = L10_16
  L10_16 = L10_16.play
  L10_16(L11_17)
  L10_16 = Fn_playMotionNpc
  L11_17 = L0_6
  L12_18 = "scared_00"
  L13_19 = false
  L10_16(L11_17, L12_18, L13_19)
  L10_16 = findGameObject2
  L11_17 = "EnemyBrain"
  L12_18 = "enemy03"
  L10_16 = L10_16(L11_17, L12_18)
  repeat
    L11_17 = wait
    L11_17()
    L12_18 = L10_16
    L11_17 = L10_16.isReadyEnemy
    L11_17 = L11_17(L12_18)
  until L11_17
  L12_18 = L10_16
  L11_17 = L10_16.playMotion
  L13_19 = "attack"
  L11_17(L12_18, L13_19)
  L11_17 = Fn_fadein
  L11_17()
  L11_17 = waitSeconds
  L12_18 = 3
  L11_17(L12_18)
  L11_17 = Fn_kaiwaDemoView
  L12_18 = "sm01_00600k"
  L11_17(L12_18)
  L11_17 = _sdemo_cut01
  L12_18 = L11_17
  L11_17 = L11_17.stop
  L13_19 = 2
  L11_17(L12_18, L13_19)
  L11_17 = _enmgen_hdl
  L12_18 = _enemy_round_num
  L11_17 = L11_17[L12_18]
  L12_18 = L11_17
  L11_17 = L11_17.setEnemyMarker
  L13_19 = true
  L11_17(L12_18, L13_19)
  L11_17 = Player
  L12_18 = L11_17
  L11_17 = L11_17.setStay
  L13_19 = false
  L14_20 = false
  L11_17(L12_18, L13_19, L14_20)
  L11_17 = Player
  L12_18 = L11_17
  L11_17 = L11_17.setGrabExceptionalObject
  L13_19 = {L14_20}
  L14_20 = MIZ_ID
  L11_17(L12_18, L13_19)
  L11_17 = Fn_setBgmPoint
  L12_18 = "event"
  L13_19 = "ev_point1"
  L11_17(L12_18, L13_19)
  _ng_near_grab = false
  _grab_release = true
  L11_17 = createMizAppendAreaTask
  L11_17 = L11_17()
  L12_18 = createGrabCaptionWaitTask
  L12_18 = L12_18()
  L13_19 = createMizNearGrabTask
  L13_19 = L13_19()
  L14_20 = invokeTask
  function L15_21()
    local L0_23
    L0_23 = Fn_moveNpc
    L0_23 = L0_23(L0_6, {
      "locator2_miz_d_02",
      "locator2_miz_d_03"
    }, {arrivedLength = 0, runLength = -1})
    repeat
      wait()
    until Mv_isSafeTaskRunning(L0_23) == false
    L0_23 = Mv_safeTaskAbort(L0_23)
    Fn_turnNpc(L0_6)
    Fn_playMotionNpc(L0_6, "scared_00", false)
  end
  L14_20(L15_21)
  L14_20 = Fn_missionView
  L15_21 = "sm01_03004"
  L14_20(L15_21)
  L14_20 = Fn_sendEventComSb
  L15_21 = "changeMissionTerm"
  L14_20(L15_21, "BATTLE")
  L14_20 = waitSeconds
  L15_21 = 1
  L14_20(L15_21)
  L15_21 = L10_16
  L14_20 = L10_16.endScriptAction
  L14_20(L15_21)
  L14_20 = _enmgen_hdl
  L15_21 = _enemy_round_num
  L14_20 = L14_20[L15_21]
  L15_21 = L14_20
  L14_20 = L14_20.requestIdlingEnemy
  L14_20(L15_21, false)
  L14_20 = createGrabTask
  function L15_21(A0_24)
    local L1_25
  end
  L14_20 = L14_20(L15_21, function()
    local L0_26, L1_27
    L0_26 = _miz_is_dead
    return L0_26
  end, function()
    local L0_28, L1_29
    L0_28 = _is_attacked
    return L0_28
  end, function()
    local L0_30, L1_31
    _is_attacked = false
  end, function()
    local L0_32, L1_33
    L0_32 = _enemy_03_cnt
    return L0_32
  end, false, true)
  L15_21 = createMizJudgeTask
  L15_21 = L15_21(function()
    local L0_34, L1_35
    L0_34 = _is_retrying
    return L0_34
  end, function()
    local L0_36, L1_37
    L0_36 = _miz_is_dead
    return L0_36
  end, function()
    local L0_38, L1_39
    L0_38 = _is_enemy_alive
    return L0_38
  end, function()
    local L0_40, L1_41
    L0_40 = _enemy_max_num
    return L0_40
  end, function()
    local L0_42, L1_43
    _miz_is_dead = true
  end, {})
  while 0 < _enemy_03_cnt or _enemy_round_num == 1 do
    if 0 < Player:getLastFrameDamagePoint() then
      _is_attacked = true
    end
    if _enemy_round_num == 1 and MIZ_ENEMY_ATTACK_WAIT - 1 == 0 then
      if _is_enemy_alive[({
        "enemy01",
        "enemy02",
        "enemy04",
        "enemy05"
      })[RandI(1, #{
        "enemy01",
        "enemy02",
        "enemy04",
        "enemy05"
      })]] == true then
        if ({
          "enemy01",
          "enemy02",
          "enemy04",
          "enemy05"
        })[RandI(1, #{
          "enemy01",
          "enemy02",
          "enemy04",
          "enemy05"
        })] == "enemy04" or ({
          "enemy01",
          "enemy02",
          "enemy04",
          "enemy05"
        })[RandI(1, #{
          "enemy01",
          "enemy02",
          "enemy04",
          "enemy05"
        })] == "enemy05" then
          Fn_sendEventComSb("enemyAttackMiz", findGameObject2("EnemyBrain", ({
            "enemy01",
            "enemy02",
            "enemy04",
            "enemy05"
          })[RandI(1, #{
            "enemy01",
            "enemy02",
            "enemy04",
            "enemy05"
          })]), true)
        else
          Fn_sendEventComSb("enemyAttackMiz", findGameObject2("EnemyBrain", ({
            "enemy01",
            "enemy02",
            "enemy04",
            "enemy05"
          })[RandI(1, #{
            "enemy01",
            "enemy02",
            "enemy04",
            "enemy05"
          })]))
        end
      end
    end
    if isRetry() == true then
      retry()
      Fn_sendEventComSb("endEnemyAttackMiz")
    end
    if _enemy_round_num == 1 and 0 >= _enemy_03_cnt then
      _enemy_round_num = 2
      _enmgen_hdl[_enemy_round_num]:requestPrepare()
      while not _enmgen_hdl[_enemy_round_num]:isPrepared() do
        wait()
      end
      _enmgen_hdl[_enemy_round_num]:requestSpawn()
      _is_enemy_alive = {}
      for _FORV_20_, _FORV_21_ in pairs(_enemy_table_ref[_enemy_round_num].spawnSet) do
        _is_enemy_alive[_FORV_21_.name] = true
      end
      Fn_sendEventComSb("requestUnlockonOreTask")
      _enmgen_hdl[_enemy_round_num]:setEnemyMarker(true)
      Fn_naviKill()
      waitSeconds(1)
      Fn_captionView("sm01_03007")
      viewTarget(findGameObject2("Node", "locator2_away_from_area_navi"), 0.5)
      waitSeconds(3)
      Fn_naviKill()
      _enemy_03_cnt = #_enemy_table_ref[_enemy_round_num].spawnSet
      _enemy_max_num = _enemy_03_cnt
    end
    wait()
  end
  Fn_setBgmPoint("event", "ev_point2")
  Fn_sendEventComSb("endEscapeEnemy")
  Fn_sendEventComSb("requestUnlockonOreTaskAbout")
  L3_9 = Mv_safeTaskAbort(L3_9)
  L11_17 = Mv_safeTaskAbort(L11_17)
  L12_18 = Mv_safeTaskAbort(L12_18)
  L13_19 = Mv_safeTaskAbort(L13_19)
  L14_20 = Mv_safeTaskAbort(L14_20)
  L15_21 = Mv_safeTaskAbort(L15_21)
  Fn_captionViewWait("sm01_03005")
  Fn_blackout()
  Fn_setGrabReleaseNpc(L0_6)
  Fn_sendEventComSb("clearMizEscapePos")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_44, L1_45
end
function pccubesensor2_return_around_miz_OnEnter()
  Mv_gotoNextPhase()
end
function catWarpSensor_OnLeave()
  local L0_46, L1_47
  _cat_warp_request_flag = true
end
function catWarpWarningSensor_OnLeave()
  local L0_48, L1_49
  _cat_warp_request_warning_flag = true
end
function retry()
  local L0_50
  _is_retrying = true
  L0_50()
  L0_50(false)
  L0_50(1)
  L0_50(L0_50, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  L0_50("endEscapeEnemy")
  _miz_is_dead = false
  _is_attacked = false
  L0_50("clearMizBattleJudge")
  L0_50()
  L0_50("locator2_pc_reset_pos_01")
  L0_50(0.5)
  _is_enemy_alive = L0_50
  for _FORV_3_, _FORV_4_ in L0_50(_enemy_table_ref[_enemy_round_num].spawnSet) do
    _is_enemy_alive[_FORV_4_.name] = true
  end
  _enemy_03_cnt = L0_50
  _enemy_max_num = L0_50
  L0_50(L0_50)
  L0_50(L0_50)
  while true do
    if not L0_50 then
      L0_50()
    end
  end
  L0_50(L0_50)
  Fn_warpNpc(L0_50, "locator2_miz_d_03")
  Fn_fadein()
  setUserCtrlOn(true)
  _is_retrying = false
  Fn_sendEventComSb("retryHintCaption")
end
