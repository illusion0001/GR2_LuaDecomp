dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm01_common.lua")
TARGET_MAX = 30
RETRY_BREAK_MAX = 25
_enemy_cnt = 0
_enemy_max_num = 0
_is_enemy_alive = {}
_enmgen_hdl = {}
_enemy_table_ref = {}
_miz_is_dead = false
_is_attacked = false
_is_retrying = false
_is_grab_guide = false
MIZ_ENEMY_ATTACK_WAIT = 300
MIZ_SKIP_CARRY_DISTANCE = 7
GRAB_CAPTION_WAIT = 100
enmgen2_01_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a02_01",
      name = "enemy01"
    },
    {
      type = "stalker",
      locator = "locator_a02_02",
      name = "enemy02"
    },
    {
      type = "gellyfish",
      locator = "locator_a02_03",
      name = "enemy03"
    },
    {
      type = "gellyfish",
      locator = "locator_a02_04",
      name = "enemy04"
    },
    {
      type = "gellyfish",
      locator = "locator_a02_05",
      name = "enemy05"
    }
  },
  enemyDeadNum = 0,
  onObjectDead = function(A0_0, A1_1)
    _enemy_cnt = _enemy_cnt - 1
    _is_enemy_alive[A1_1:getName()] = false
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
    if A1_1:getName() == "enemy01" or A1_1:getName() == "enemy02" then
      Fn_sendEventComSb("endEnemyAttackMiz")
    end
  end,
  onSpawn = function(A0_2, A1_3)
    _enemy_cnt = _enemy_cnt + 1
    _is_enemy_alive[A1_3:getName()] = true
    A0_2:getSpecTable().enemyDeadNum = A0_2:getSpecTable().enemyDeadNum - 1
    if A0_2:getSpecTable().enemyDeadNum < 0 then
      A0_2:getSpecTable().enemyDeadNum = 0
    end
  end,
  isEnemyAllDead = function(A0_4)
    local L2_5
    L2_5 = A0_4.enemyDeadNum
    L2_5 = L2_5 >= #A0_4.spawnSet
    return L2_5
  end
}
enmgen2_01_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a02_06",
      name = "enemy06"
    },
    {
      type = "stalker",
      locator = "locator_a02_07",
      name = "enemy07"
    },
    {
      type = "gellyfish",
      locator = "locator_a02_08",
      name = "enemy08"
    },
    {
      type = "gellyfish",
      locator = "locator_a02_09",
      name = "enemy09"
    },
    {
      type = "gellyfish",
      locator = "locator_a02_10",
      name = "enemy10"
    }
  }
}
function Initialize()
  local L0_6
  L0_6 = Fn_userCtrlAllOff
  L0_6()
  L0_6 = Fn_pcSensorOff
  L0_6("pccubesensor2_can_see_land_01")
  L0_6 = {
    {
      name = MIZ_ID,
      type = "tkg05",
      node = "locator2_miz_b_02",
      reset = false,
      use_fall = true
    }
  }
  Fn_setupNpc(L0_6)
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_01_01"))
  table.insert(_enmgen_hdl, findGameObject2("EnemyGenerator", "enmgen2_01_02"))
  table.insert(_enemy_table_ref, enmgen2_01_01)
  table.insert(_enemy_table_ref, enmgen2_01_02)
  for _FORV_4_, _FORV_5_ in pairs(enmgen2_01_01.spawnSet) do
    _is_enemy_alive[_FORV_5_.name] = true
  end
  _enemy_max_num = #enmgen2_01_01.spawnSet
  _ng_near_grab = true
end
function Ingame()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31
  L0_7 = Fn_setCrewActive
  L0_7(L1_8)
  L0_7 = Fn_setMineGravityStorm
  L0_7()
  L0_7 = createGameObject2
  L0_7 = L0_7(L1_8)
  L1_8(L2_9, L3_10)
  L4_11 = "locator2_b_escape_03"
  L5_12 = "locator2_b_escape_04"
  L6_13 = "locator2_b_escape_05"
  L7_14 = "locator2_b_escape_06"
  L8_15 = "locator2_b_escape_07"
  miz_escape_locate_talbe = L1_8
  for L4_11 = 1, #L2_9 do
    L5_12 = findGameObject2
    L6_13 = "Node"
    L7_14 = miz_escape_locate_talbe
    L7_14 = L7_14[L4_11]
    L5_12 = L5_12(L6_13, L7_14)
    if L5_12 ~= nil then
      L6_13 = Fn_sendEventComSb
      L7_14 = "addMizEscapePos"
      L9_16 = L5_12
      L8_15 = L5_12.getWorldPos
      L8_15 = L8_15(L9_16)
      L8_15 = L8_15.x
      L10_17 = L5_12
      L9_16 = L5_12.getWorldPos
      L9_16 = L9_16(L10_17)
      L9_16 = L9_16.y
      L11_18 = L5_12
      L10_17 = L5_12.getWorldPos
      L10_17 = L10_17(L11_18)
      L10_17 = L10_17.z
      L6_13(L7_14, L8_15, L9_16, L10_17)
    end
  end
  L1_8(L2_9, L3_10)
  L1_8(L2_9, L3_10)
  L1_8(L2_9, L3_10)
  L2_9.speed = 4
  L2_9.accel = 0
  L2_9.decel = 3
  L1_8(L2_9)
  L4_11 = createGameObject2
  L5_12 = "Node"
  L4_11 = L4_11(L5_12)
  L5_12 = createGameObject2
  L6_13 = "Node"
  L5_12 = L5_12(L6_13)
  L7_14 = L4_11
  L6_13 = L4_11.try_init
  L6_13(L7_14)
  L7_14 = L5_12
  L6_13 = L5_12.try_init
  L6_13(L7_14)
  L7_14 = L4_11
  L6_13 = L4_11.waitForReady
  L6_13(L7_14)
  L7_14 = L5_12
  L6_13 = L5_12.waitForReady
  L6_13(L7_14)
  L7_14 = L4_11
  L6_13 = L4_11.try_start
  L6_13(L7_14)
  L7_14 = L5_12
  L6_13 = L5_12.try_start
  L6_13(L7_14)
  L7_14 = L1_8
  L6_13 = L1_8.appendChild
  L8_15 = L4_11
  L6_13(L7_14, L8_15)
  L7_14 = L1_8
  L6_13 = L1_8.appendChild
  L8_15 = L5_12
  L6_13(L7_14, L8_15)
  L7_14 = L4_11
  L6_13 = L4_11.setTransform
  L8_15 = Vector
  L9_16 = 0.4
  L10_17 = -4.3
  L11_18 = 0.4
  L8_15 = L8_15(L9_16, L10_17, L11_18)
  L9_16 = XYZRotQuatD
  L10_17 = 0
  L11_18 = -90
  L12_19 = 0
  L24_31 = L9_16(L10_17, L11_18, L12_19)
  L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L9_16(L10_17, L11_18, L12_19))
  L7_14 = L5_12
  L6_13 = L5_12.setTransform
  L8_15 = Vector
  L9_16 = -0.6
  L10_17 = -4.3
  L11_18 = -0.4
  L8_15 = L8_15(L9_16, L10_17, L11_18)
  L9_16 = XYZRotQuatD
  L10_17 = 0
  L11_18 = -90
  L12_19 = 0
  L24_31 = L9_16(L10_17, L11_18, L12_19)
  L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L9_16(L10_17, L11_18, L12_19))
  L6_13 = Fn_resetPcPos
  L7_14 = L4_11
  L6_13(L7_14)
  L6_13 = Fn_findNpc
  L7_14 = MIZ_ID
  L6_13 = L6_13(L7_14)
  L7_14 = Fn_findNpcPuppet
  L8_15 = L6_13
  L7_14 = L7_14(L8_15)
  L9_16 = L6_13
  L8_15 = L6_13.ignoreStoop
  L8_15(L9_16)
  L8_15 = Fn_warpNpc
  L9_16 = L6_13
  L10_17 = L5_12
  L8_15(L9_16, L10_17)
  L9_16 = L1_8
  L8_15 = L1_8.appendChild
  L10_17 = L7_14
  L11_18 = true
  L8_15(L9_16, L10_17, L11_18)
  L8_15 = Fn_userCtrlOn
  L8_15()
  L8_15 = Fn_cageMove
  L8_15()
  L8_15 = HUD
  L9_16 = L8_15
  L8_15 = L8_15.menuSetCallback
  L10_17 = HUD
  L10_17 = L10_17.kCallback_Retire
  L11_18 = mission_retire
  L8_15(L9_16, L10_17, L11_18)
  L8_15 = waitSeconds
  L9_16 = 1
  L8_15(L9_16)
  L8_15 = Fn_missionStart
  L8_15()
  L9_16 = L4_11
  L8_15 = L4_11.try_term
  L8_15(L9_16)
  L9_16 = L5_12
  L8_15 = L5_12.try_term
  L8_15(L9_16)
  L4_11, L5_12 = nil, nil
  function L8_15()
    if _is_grab_guide == true and L6_13:isGrabbed() == false then
      Fn_naviSet(L6_13)
      L0_7:setActive(true)
    end
  end
  L9_16 = createMizWarpTask
  L10_17 = nil
  L11_18 = L8_15
  L9_16 = L9_16(L10_17, L11_18)
  L10_17 = createMizAppendAreaTask
  L10_17 = L10_17()
  L11_18 = createCatWarpTask
  L11_18 = L11_18()
  L12_19 = createGrabCaptionWaitTask
  L12_19 = L12_19()
  L13_20 = createMizNearGrabTask
  L13_20 = L13_20()
  L14_21 = waitSeconds
  L15_22 = 2
  L14_21(L15_22)
  L14_21 = Fn_captionViewWait
  L15_22 = "sm01_01000"
  L14_21(L15_22)
  L14_21 = waitSeconds
  L15_22 = 1
  L14_21(L15_22)
  L14_21 = Fn_captionViewWait
  L15_22 = "sm01_01001"
  L14_21(L15_22)
  L14_21 = Fn_waitCageMoveEnd
  L14_21()
  L15_22 = L6_13
  L14_21 = L6_13.appendChild
  L16_23 = L7_14
  L17_24 = true
  L14_21(L15_22, L16_23, L17_24)
  L14_21 = Fn_userCtrlOn
  L14_21()
  L14_21 = updateCatWarp
  L15_22 = "locator2_pc_start_pos_02"
  L16_23 = "locator2_miz_b_03"
  L17_24 = false
  L18_25 = true
  L14_21(L15_22, L16_23, L17_24, L18_25)
  L14_21 = findGameObject2
  L15_22 = "Node"
  L16_23 = "locator2_miz_b_03"
  L14_21 = L14_21(L15_22, L16_23)
  L15_22 = L14_21
  L14_21 = L14_21.getWorldPos
  L14_21 = L14_21(L15_22)
  L15_22 = createCatWarpSensor
  L16_23 = L14_21
  L17_24 = Vector
  L18_25 = 65
  L19_26 = 65
  L20_27 = 65
  L17_24 = L17_24(L18_25, L19_26, L20_27)
  L18_25 = "catWarpSensor"
  L15_22 = L15_22(L16_23, L17_24, L18_25)
  L16_23 = createCatWarpSensor
  L17_24 = L14_21
  L18_25 = Vector
  L19_26 = 45
  L20_27 = 45
  L21_28 = 45
  L18_25 = L18_25(L19_26, L20_27, L21_28)
  L19_26 = "catWarpWarningSensor"
  L16_23 = L16_23(L17_24, L18_25, L19_26)
  L17_24 = Fn_moveNpc
  L18_25 = L6_13
  L19_26 = {L20_27}
  L20_27 = "locator2_miz_b_03"
  L20_27 = {}
  L20_27.arrivedLength = 0
  L20_27.runLength = -1
  L17_24 = L17_24(L18_25, L19_26, L20_27)
  repeat
    L18_25 = wait
    L18_25()
    L18_25 = Mv_isSafeTaskRunning
    L19_26 = L17_24
    L18_25 = L18_25(L19_26)
  until L18_25 == false
  L18_25 = Mv_safeTaskAbort
  L19_26 = L17_24
  L18_25 = L18_25(L19_26)
  L17_24 = L18_25
  L18_25 = waitSeconds
  L19_26 = 0.5
  L18_25(L19_26)
  L18_25 = Fn_kaiwaDemoView
  L19_26 = "sm01_00150k"
  L18_25(L19_26)
  _is_grab_guide = true
  L19_26 = L0_7
  L18_25 = L0_7.setDetectBehavior
  L20_27 = 1
  L18_25(L19_26, L20_27)
  L19_26 = L0_7
  L18_25 = L0_7.addBox
  L20_27 = Vector
  L21_28 = 5
  L22_29 = 4
  L23_30 = 5
  L24_31 = L20_27(L21_28, L22_29, L23_30)
  L18_25(L19_26, L20_27, L21_28, L22_29, L23_30, L24_31, L20_27(L21_28, L22_29, L23_30))
  L19_26 = L0_7
  L18_25 = L0_7.setOnLeave
  L20_27 = "client_sensor_OnLeave"
  L18_25(L19_26, L20_27)
  L19_26 = L7_14
  L18_25 = L7_14.appendChild
  L20_27 = L0_7
  L18_25(L19_26, L20_27)
  L19_26 = L0_7
  L18_25 = L0_7.setActive
  L20_27 = false
  L18_25(L19_26, L20_27)
  L19_26 = L0_7
  L18_25 = L0_7.try_init
  L18_25(L19_26)
  L19_26 = L0_7
  L18_25 = L0_7.waitForReady
  L18_25(L19_26)
  L19_26 = L0_7
  L18_25 = L0_7.try_start
  L18_25(L19_26)
  _ng_near_grab = false
  _grab_release = false
  L18_25 = Fn_missionView
  L19_26 = "sm01_01002"
  L18_25(L19_26)
  L18_25 = waitSeconds
  L19_26 = 1.3
  L18_25(L19_26)
  L19_26 = L0_7
  L18_25 = L0_7.setActive
  L20_27 = true
  L18_25(L19_26, L20_27)
  L19_26 = L6_13
  L18_25 = L6_13.isGrabbed
  L18_25 = L18_25(L19_26)
  if L18_25 == false then
    L18_25 = Fn_naviSet
    L19_26 = L7_14
    L18_25(L19_26)
  end
  while true do
    L19_26 = L6_13
    L18_25 = L6_13.isGrabbed
    L18_25 = L18_25(L19_26)
    if L18_25 == false then
      L18_25 = wait
      L18_25()
    end
  end
  L19_26 = L0_7
  L18_25 = L0_7.setActive
  L20_27 = false
  L18_25(L19_26, L20_27)
  L18_25 = Fn_tutorialCaptionKill
  L18_25()
  L18_25 = Fn_naviKill
  L18_25()
  _is_grab_guide = false
  L18_25 = setNaviAndView
  L19_26 = findGameObject2
  L20_27 = "Node"
  L21_28 = "locator2_navi_land_01"
  L19_26 = L19_26(L20_27, L21_28)
  L20_27 = 0.5
  L18_25(L19_26, L20_27)
  L18_25 = updateCatWarp
  L19_26 = "locator2_pc_start_pos_02"
  L20_27 = "locator2_miz_b_03"
  L21_28 = true
  L22_29 = true
  L23_30 = "locator2_navi_land_01"
  L24_31 = true
  L18_25(L19_26, L20_27, L21_28, L22_29, L23_30, L24_31)
  L18_25 = findGameObject2
  L19_26 = "Node"
  L20_27 = "locator2_pc_start_pos_02"
  L18_25 = L18_25(L19_26, L20_27)
  L19_26 = L18_25
  L18_25 = L18_25.getWorldPos
  L18_25 = L18_25(L19_26)
  L19_26 = findGameObject2
  L20_27 = "Node"
  L21_28 = "locator2_navi_land_01"
  L19_26 = L19_26(L20_27, L21_28)
  L20_27 = L19_26
  L19_26 = L19_26.getWorldPos
  L19_26 = L19_26(L20_27)
  L20_27 = Vector
  L21_28 = L18_25.x
  L22_29 = L19_26.x
  L21_28 = L21_28 + L22_29
  L21_28 = L21_28 / 2
  L22_29 = L18_25.y
  L23_30 = L19_26.y
  L22_29 = L22_29 + L23_30
  L22_29 = L22_29 / 2
  L23_30 = L18_25.z
  L24_31 = L19_26.z
  L23_30 = L23_30 + L24_31
  L23_30 = L23_30 / 2
  L20_27 = L20_27(L21_28, L22_29, L23_30)
  L14_21 = L20_27
  L20_27 = getCatWarpAreaSize
  L21_28 = L18_25
  L22_29 = L19_26
  L20_27 = L20_27(L21_28, L22_29)
  L21_28 = createCatWarpSensor
  L22_29 = L14_21
  L23_30 = L20_27
  L24_31 = "catWarpSensor"
  L21_28 = L21_28(L22_29, L23_30, L24_31, L15_22)
  L15_22 = L21_28
  L21_28 = createCatWarpSensor
  L22_29 = L14_21
  L23_30 = Vector
  L24_31 = L20_27.x
  L24_31 = L24_31 - 20
  L23_30 = L23_30(L24_31, L20_27.y - 20, L20_27.z - 20)
  L24_31 = "catWarpWarningSensor"
  L21_28 = L21_28(L22_29, L23_30, L24_31, L16_23)
  L16_23 = L21_28
  L21_28 = Fn_sendEventComSb
  L22_29 = "requestOreSpawn"
  L23_30 = false
  L21_28(L22_29, L23_30)
  L21_28 = Fn_sendEventComSb
  L22_29 = "startAutoRespawnOre"
  L21_28(L22_29)
  L21_28 = Fn_pcSensorOn
  L22_29 = "pccubesensor2_can_see_land_01"
  L21_28(L22_29)
  L21_28 = mizNextWaitPhase
  L22_29 = "locator2_navi_land_01"
  L21_28(L22_29)
  L21_28 = _enmgen_hdl
  L21_28 = L21_28[1]
  L22_29 = L21_28
  L21_28 = L21_28.setAutoRevirthSwitch
  L23_30 = false
  L21_28(L22_29, L23_30)
  L21_28 = _enmgen_hdl
  L21_28 = L21_28[1]
  L22_29 = L21_28
  L21_28 = L21_28.requestIdlingEnemy
  L23_30 = true
  L21_28(L22_29, L23_30)
  L21_28 = Fn_naviKill
  L21_28()
  L21_28 = waitSeconds
  L22_29 = 0.5
  L21_28(L22_29)
  L21_28 = viewTarget
  L22_29 = findGameObject2
  L23_30 = "Node"
  L24_31 = "locator2_can_see_enemy_01"
  L22_29 = L22_29(L23_30, L24_31)
  L23_30 = 0.3
  L24_31 = true
  L21_28(L22_29, L23_30, L24_31)
  L21_28 = waitSeconds
  L22_29 = 0.5
  L21_28(L22_29)
  L21_28 = Fn_sendEventComSb
  L22_29 = "requestOreSpawn"
  L23_30 = false
  L21_28(L22_29, L23_30)
  L21_28 = Fn_kaiwaDemoView
  L22_29 = "sm01_00200k"
  L21_28(L22_29)
  _grab_release = true
  L21_28 = Fn_setGrabNpc
  L22_29 = L6_13
  L23_30 = false
  L24_31 = _grab_release
  L21_28(L22_29, L23_30, L24_31)
  L21_28 = updateCatWarp
  L22_29 = "locator2_miz_b_land_01"
  L23_30 = "locator2_miz_b_land_01"
  L24_31 = false
  L21_28(L22_29, L23_30, L24_31, false, "locator2_navi_land_01")
  L21_28 = findGameObject2
  L22_29 = "Node"
  L23_30 = "locator2_navi_land_01"
  L21_28 = L21_28(L22_29, L23_30)
  L22_29 = L21_28
  L21_28 = L21_28.getWorldPos
  L21_28 = L21_28(L22_29)
  L14_21 = L21_28
  L21_28 = createCatWarpSensor
  L22_29 = L14_21
  L23_30 = Vector
  L24_31 = 100
  L23_30 = L23_30(L24_31, 120, 115)
  L24_31 = "catWarpSensor"
  L21_28 = L21_28(L22_29, L23_30, L24_31, L15_22)
  L15_22 = L21_28
  L21_28 = createCatWarpSensor
  L22_29 = L14_21
  L23_30 = Vector
  L24_31 = 80
  L23_30 = L23_30(L24_31, 100, 95)
  L24_31 = "catWarpWarningSensor"
  L21_28 = L21_28(L22_29, L23_30, L24_31, L16_23)
  L16_23 = L21_28
  L21_28 = _enmgen_hdl
  L21_28 = L21_28[1]
  L22_29 = L21_28
  L21_28 = L21_28.setEnemyMarker
  L23_30 = true
  L21_28(L22_29, L23_30)
  L21_28 = _enmgen_hdl
  L21_28 = L21_28[1]
  L22_29 = L21_28
  L21_28 = L21_28.requestIdlingEnemy
  L23_30 = false
  L21_28(L22_29, L23_30)
  _cat_warp_miz_fall_flag = false
  L21_28 = createGrabTask
  function L22_29(A0_32)
    L0_7:setActive(A0_32)
  end
  function L23_30()
    local L0_33, L1_34
    L0_33 = _miz_is_dead
    return L0_33
  end
  function L24_31()
    local L0_35, L1_36
    L0_35 = _is_attacked
    return L0_35
  end
  L21_28 = L21_28(L22_29, L23_30, L24_31, function()
    local L0_37, L1_38
    _is_attacked = false
  end, function()
    local L0_39, L1_40
    L0_39 = _enemy_cnt
    return L0_39
  end, true, false)
  L22_29 = createMizJudgeTask
  function L23_30()
    local L0_41, L1_42
    L0_41 = _is_retrying
    return L0_41
  end
  function L24_31()
    local L0_43, L1_44
    L0_43 = _miz_is_dead
    return L0_43
  end
  L22_29 = L22_29(L23_30, L24_31, function()
    local L0_45, L1_46
    L0_45 = _is_enemy_alive
    return L0_45
  end, function()
    local L0_47, L1_48
    L0_47 = _enemy_max_num
    return L0_47
  end, function()
    local L0_49, L1_50
    _miz_is_dead = true
  end, {})
  L23_30 = Fn_missionView
  L24_31 = "sm01_01004"
  L23_30(L24_31)
  L23_30 = Player
  L24_31 = L23_30
  L23_30 = L23_30.setTargetingPriority
  L23_30(L24_31, Player.kTargetingPrio_EnemyFirst)
  L23_30 = Fn_setBgmPoint
  L24_31 = "event"
  L23_30(L24_31, "ev_point1")
  L23_30 = Fn_sendEventComSb
  L24_31 = "changeMissionTerm"
  L23_30(L24_31, "FIRST_BATTLE")
  L23_30 = waitSeconds
  L24_31 = 3.8
  L23_30(L24_31)
  L23_30 = MIZ_ENEMY_ATTACK_WAIT
  while true do
    L24_31 = Player
    L24_31 = L24_31.getLastFrameDamagePoint
    L24_31 = L24_31(L24_31)
    if L24_31 > 0 then
      _is_attacked = true
    end
    L23_30 = L23_30 - 1
    if L23_30 == 0 then
      L24_31 = {"enemy01", "enemy02"}
      if _is_enemy_alive[L24_31[RandI(1, #L24_31)]] == true then
        Fn_sendEventComSb("enemyAttackMiz", findGameObject2("EnemyBrain", L24_31[RandI(1, #L24_31)]))
      end
      L23_30 = MIZ_ENEMY_ATTACK_WAIT
    end
    L24_31 = isRetry
    L24_31 = L24_31(RETRY_BREAK_MAX)
    if L24_31 == true then
      retry(true)
      Fn_sendEventComSb("endEnemyAttackMiz")
      L23_30 = MIZ_ENEMY_ATTACK_WAIT
    end
    if _enemy_cnt == 0 or isEnemyGroupAllDead("enmgen2_01_01") == true then
      Fn_setBgmPoint("event", "ev_point2")
      Fn_sendEventComSb("endEnemyAttackMiz")
      Fn_sendEventComSb("endEscapeEnemy")
      break
    end
    wait()
  end
  L24_31 = Mv_safeTaskAbort
  L24_31 = L24_31(L21_28)
  L21_28 = L24_31
  L24_31 = Mv_safeTaskAbort
  L24_31 = L24_31(L22_29)
  L22_29 = L24_31
  L24_31 = Fn_sendEventComSb
  L24_31 = L24_31("isMizBrokenCount")
  if L24_31 < RETRY_BREAK_MAX then
    L24_31 = L6_13.isGrabbed
    L24_31 = L24_31(L6_13)
    if L24_31 == true then
      L24_31 = Player
      L24_31 = L24_31.setTargetingPriority
      L24_31(L24_31, Player.kTargetingPrio_GimmickBgFirst)
      L24_31 = GRAB_CAPTION_WAIT
      _grab_cap_wait = L24_31
      L24_31 = Fn_captionViewWait
      L24_31("sm01_01014")
    else
      L24_31 = Fn_naviSet
      L24_31(L7_14)
      L24_31 = Fn_playMotionNpc
      L24_31(L6_13, "stay", false)
      L24_31 = Fn_sendEventComSb
      L24_31 = L24_31("getHandleNearPuppet", L7_14)
      if L24_31 ~= nil and L24_31("getHandleNearPuppet", L7_14) <= MIZ_SKIP_CARRY_DISTANCE then
        _ng_near_grab = true
      else
        _ng_near_grab = false
      end
      Fn_turnNpc(L6_13)
      Fn_missionView("sm01_01016")
      Fn_sendEventComSb("changeMissionTerm", "BACK")
      waitSeconds(3.8)
      if L6_13:isGrabbed() == false then
        Fn_captionViewWait("sm01_01015")
        playerNearWait(L7_14, false, function()
          return L6_13:isGrabbed()
        end)
        Fn_naviKill()
      end
      if L24_31 == nil or L24_31("getHandleNearPuppet", L7_14) > MIZ_SKIP_CARRY_DISTANCE then
        while true do
          if 120 - 1 == 0 or 100 > 120 - 1 and L6_13:isGrabbed() == true then
            _grab_cap_wait = GRAB_CAPTION_WAIT
            Fn_captionViewWait("sm01_01017")
          end
          if L6_13:isGrabbed() ~= true then
            wait()
          end
        end
      end
    end
  end
  L24_31 = Fn_naviKill
  L24_31()
  L24_31 = Fn_setBgmPoint
  L24_31("event", "ev_point3")
  L24_31 = Fn_sendEventComSb
  L24_31("requestBrokenCountReset")
  L24_31 = createMizOreCarry
  L24_31 = L24_31(function()
    return L0_7:setActive(true)
  end, function()
    return L0_7:setActive(false)
  end, function()
    local L0_51, L1_52
    L0_51 = _is_retrying
    return L0_51
  end)
  while L24_31 ~= nil and Mv_isSafeTaskRunning(L24_31) == true or false == true do
    _ng_near_grab = false
    if L6_13:isGrabbed() == true or Fn_sendEventComSb("getHandleNearPuppet", L7_14) == nil or Fn_sendEventComSb("getHandleNearPuppet", L7_14) > MIZ_SKIP_CARRY_DISTANCE then
      Fn_missionView("sm01_01018")
      Fn_sendEventComSb("changeMissionTerm", "TAKE_ORE")
      waitSeconds(3.8)
      if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_land_01")) > 70 then
        Fn_naviSet(findGameObject2("Node", "locator2_navi_land_01"))
        while true do
          while true do
            if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_land_01")) < 70 then
              Fn_naviKill()
              break
            end
            wait()
          end
        end
      end
    end
    while Mv_isSafeTaskRunning(L24_31) == true do
      if isRetry(RETRY_BREAK_MAX) == true then
        L0_7:setActive(false)
        retry(false)
        L0_7:setActive(true)
        break
      end
      wait()
    end
    if true == false then
      _ng_near_grab = true
      Fn_setGrabNpc(L6_13, true, true)
      Fn_sendEventComSb("abortAutoRespawnTask")
      Fn_turnNpc(L6_13)
      waitSeconds(0.2)
      Fn_userCtrlAllOff()
      if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
        repeat
          wait()
        until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
      end
      Fn_kaiwaDemoView("sm01_00300k")
      Fn_userCtrlOn()
      MizDig()
      Fn_sendEventComSb("moveToNearOre", nil, nil, nil, 5)
      Fn_sendEventComSb("stopDrillSound")
      Fn_missionView("sm01_01021")
      Fn_sendEventComSb("changeMissionTerm", "MINING")
      waitSeconds(1.3)
      Fn_sendEventComSb("requestClearCounter")
      Fn_sendEventComSb("setCounterMax", TARGET_MAX)
      Fn_sendEventComSb("requestCounterOn")
      while Fn_sendEventComSb("isMoveToNearOre") == true do
        wait()
      end
      MizDig()
      if Fn_sendEventComSb("isNearOreBroken") == false and Fn_sendEventComSb("getNearOre") ~= nil then
        if Fn_sendEventComSb("getNearOre"):getTagText() ~= "L" then
          Fn_sendEventComSb("playDrillSound", 1)
          Fn_playMotionNpc(L6_13, "dig_in_00", true)
          Fn_sendEventComSb("stopDrillSound")
          Fn_sendEventComSb("playDrillSound", 2)
          Fn_playMotionNpc(L6_13, "dig_00", false)
        else
          Fn_sendEventComSb("playDrillSound", 1)
          Fn_playMotionNpc(L6_13, "dig_in_01", true)
          Fn_sendEventComSb("stopDrillSound")
          Fn_sendEventComSb("playDrillSound", 2)
          Fn_playMotionNpc(L6_13, "dig_01", false)
        end
      end
      Fn_sendEventComSb("startOreMining")
      while not (Fn_sendEventComSb("requestCount") >= TARGET_MAX) do
        if isRetry(RETRY_BREAK_MAX) == true then
          retry(false)
          L24_31 = Mv_safeTaskAbort(L24_31)
          L24_31 = createMizOreCarry(function()
            return L0_7:setActive(true)
          end, function()
            return L0_7:setActive(false)
          end, function()
            local L0_53, L1_54
            L0_53 = _is_retrying
            return L0_53
          end)
          Fn_sendEventComSb("requestCounterOff")
          break
        end
        wait()
      end
      if true == false then
        L24_31 = Mv_safeTaskAbort(L24_31)
        Fn_sendEventComSb("endOreMining")
        Fn_sendEventComSb("requesOreMizBreak")
      end
    end
    wait()
  end
  Fn_missionInfoEnd()
  Fn_sendEventComSb("requestCounterOff")
  Fn_sendEventComSb("requestClearCounter")
  Fn_captionViewWait("sm01_01024")
  Fn_missionView("sm01_02036")
  Fn_sendEventComSb("changeMissionTerm", "BACK")
  waitSeconds(1.3)
  Fn_naviSet(L7_14)
  playerNearWait(L7_14, true)
  Fn_naviKill()
  Fn_playMotionNpc(L6_13, "stay", false)
  Fn_sendEventComSb("stopDrillSound")
  waitSeconds(0.2)
  Fn_turnNpc(L6_13)
  waitSeconds(0.2)
  Fn_userCtrlAllOff()
  if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
    repeat
      wait()
    until GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and Player:getAction() ~= Player.kAction_CatWarpOut
  end
  Fn_kaiwaDemoView("sm01_00330k")
  _grab_release = false
  Fn_userCtrlOn()
  Fn_sendEventComSb("requestBrokenCountReset")
  Fn_sendEventComSb("clearMizEscapePos")
  L11_18 = Mv_safeTaskAbort(L11_18)
  L10_17 = Mv_safeTaskAbort(L10_17)
  L9_16 = Mv_safeTaskAbort(L9_16)
  L12_19 = Mv_safeTaskAbort(L12_19)
  L13_20 = Mv_safeTaskAbort(L13_20)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_55, L1_56
end
function client_sensor_OnLeave()
  _grab_cap_wait = GRAB_CAPTION_WAIT
  if _is_grab_guide == true and Fn_findNpc(MIZ_ID):isGrabbed() == false then
    Fn_captionView("sm01_01025")
  end
end
function pccubesensor2_can_see_land_01_OnEnter(A0_57)
  if Fn_findNpc(MIZ_ID):isGrabbed() == true then
    Mv_gotoNextPhase()
    A0_57:setActive(false)
  end
end
function catWarpSensor_OnLeave()
  local L0_58, L1_59
  _cat_warp_request_flag = true
end
function catWarpWarningSensor_OnLeave()
  local L0_60, L1_61
  _cat_warp_request_warning_flag = true
end
function retry(A0_62)
  _is_retrying = true
  Fn_blackout()
  setUserCtrlOn(false)
  waitSeconds(1)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  _miz_is_dead = false
  _is_attacked = false
  Fn_sendEventComSb("clearMizBattleJudge")
  clearMizFallFlag()
  Fn_resetPcPos("locator2_pc_retry_pos")
  waitSeconds(0.5)
  if A0_62 == true then
    for _FORV_4_ = 1, #_enmgen_hdl do
      _enmgen_hdl[_FORV_4_]:requestAllEnemyKill()
      _enmgen_hdl[_FORV_4_]:requestPrepare()
      while not _enmgen_hdl[_FORV_4_]:isPrepared() and 100 - 1 ~= 0 do
        wait()
      end
      _enmgen_hdl[_FORV_4_]:requestSpawn()
      for _FORV_9_, _FORV_10_ in pairs(_enemy_table_ref[_FORV_4_].spawnSet) do
        _is_enemy_alive[_FORV_10_.name] = true
      end
    end
    _FOR_()
  end
  Fn_sendEventComSb("requestOreSpawn", true)
  Fn_sendEventComSb("requestBrokenCountReset")
  Fn_sendEventComSb("requestClearCounter")
  Fn_sendEventComSb("endEscapeEnemy")
  Fn_sendEventComSb("endOreMining")
  Fn_warpNpc(Fn_findNpc(MIZ_ID), "locator2_miz_move_02")
  Fn_fadein()
  setUserCtrlOn(true)
  _is_retrying = false
  Fn_sendEventComSb("retryHintCaption")
end
