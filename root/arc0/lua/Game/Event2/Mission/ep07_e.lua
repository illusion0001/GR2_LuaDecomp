dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
CLOW_MOVE_A_SPEED = 20
CLOW_CHASE_SPEED = 11
CLOW_CHASE_SPEED_HIGH = 50
CLOW_MOVE_C_SPEED = 20
CLOW_CHASE_SPEED_CHANGE_NODE = 21
CLOW_CHASE_LIMIT_LENGTH = 200
CLOW_CHASE_LIMIT_LENGTH_2 = 400
CLOW_CHASE_CAPTION_TABLE = {
  {
    locator = "locator2_race_crow_move_b_03",
    caption = "ep07_04000",
    se = "kit842b"
  },
  {
    locator = "locator2_race_crow_move_b_09",
    caption = "ep07_04001",
    se = "kit044a"
  },
  {
    locator = "locator2_race_crow_move_b_17",
    caption = "ep07_04002",
    se = "kit051c_1"
  },
  {
    locator = "locator2_race_crow_move_b_23",
    caption = "ep07_04003",
    se = "kit044c"
  }
}
_puppet_tbl = {}
_is_in_sensor = false
_sdemo = nil
_clow_lost_check_dist = 0
_is_ar_attack = false
_crow_move_start = false
_crow_speed_up_check = false
function Initialize()
  local L0_0
  L0_0 = Fn_setNpcActive
  L0_0("ep07_sis_01", false)
  L0_0 = Fn_setNpcActive
  L0_0("ep07_gawa_01", false)
  L0_0 = {
    {
      name = "ep07_soldier",
      type = "soldier",
      node = "locator2_soldier_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _puppet_tbl.ep07_merchant_01 = Fn_findNpcPuppet("ep07_merchant_01")
  _sdemo = SDemo.create("base")
  Fn_sensorOff("cubesensor2_race_lost_check_dist_change_01")
  Fn_pcSensorOff("pccubesensor2_race_wait_01")
  Fn_pcSensorOff("pccubesensor2_race_goal_01")
  Fn_pcSensorOff("pccubesensormulti2_ar_attack_e_01")
  Fn_userCtrlAllOff()
  Fn_coercionPoseNomal()
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
  L0_1 = Fn_sendEventComSb
  L1_2 = "getFreighterHundle"
  L0_1 = L0_1(L1_2)
  L2_3 = L0_1
  L1_2 = L0_1.setActive
  L3_4 = true
  L1_2(L2_3, L3_4)
  L1_2 = findGameObject2
  L2_3 = "Node"
  L3_4 = "locator2_reighter_pos"
  L1_2 = L1_2(L2_3, L3_4)
  L3_4 = L0_1
  L2_3 = L0_1.setWorldTransform
  L5_6 = L1_2
  L4_5 = L1_2.getWorldTransform
  L10_11 = L4_5(L5_6)
  L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L4_5(L5_6))
  L3_4 = L0_1
  L2_3 = L0_1.setForceMove
  L2_3(L3_4)
  L2_3 = 1
  while true do
    L3_4 = Fn_sendEventComSb
    L4_5 = "ep07_findGameObject2"
    L5_6 = "GimmickBg"
    L6_7 = "bg2_woodbox_"
    L7_8 = string
    L7_8 = L7_8.format
    L8_9 = "%02d"
    L9_10 = L2_3
    L7_8 = L7_8(L8_9, L9_10)
    L6_7 = L6_7 .. L7_8
    L3_4 = L3_4(L4_5, L5_6, L6_7)
    if L3_4 ~= nil then
      L5_6 = L3_4
      L4_5 = L3_4.getDynamicObject
      L4_5 = L4_5(L5_6)
      if L4_5 ~= nil then
        L6_7 = L4_5
        L5_6 = L4_5.try_term
        L5_6(L6_7)
      end
      L6_7 = L3_4
      L5_6 = L3_4.try_term
      L5_6(L6_7)
    else
      break
    end
    L2_3 = L2_3 + 1
  end
  L2_3 = Fn_loadNpcEventMotion
  L3_4 = "ep07_soldier"
  L4_5 = {L5_6, L6_7}
  L5_6 = "man57_talk_00"
  L6_7 = "man57_talk_01"
  L2_3(L3_4, L4_5)
  L2_3 = Fn_setNpcActive
  L3_4 = "ep07_merchant_01"
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = Fn_warpNpc
  L3_4 = "ep07_merchant_01"
  L4_5 = "warppoint2_merchant_01"
  L2_3(L3_4, L4_5)
  L2_3 = Fn_playMotionNpc
  L3_4 = "ep07_merchant_01"
  L4_5 = {L5_6, L6_7}
  L5_6 = "talk_00"
  L6_7 = "talk_01"
  L5_6 = false
  L6_7 = {}
  L6_7.isRepeat = true
  L6_7.isRandom = true
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = Fn_setNpcActive
  L3_4 = "ep07_soldier"
  L4_5 = true
  L2_3(L3_4, L4_5)
  L2_3 = Fn_playMotionNpc
  L3_4 = "ep07_soldier"
  L4_5 = {L5_6, L6_7}
  L5_6 = "man57_talk_00"
  L6_7 = "man57_talk_01"
  L5_6 = false
  L6_7 = {}
  L6_7.isRepeat = true
  L6_7.isRandom = true
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = _puppet_tbl
  L3_4 = Fn_spawnSuppotCrow
  L4_5 = true
  L5_6 = Supporter
  L5_6 = L5_6.FirstAction
  L5_6 = L5_6.Ground
  L6_7 = "locator2_race_crow_01"
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  L2_3.pup_crow = L3_4
  L2_3 = _puppet_tbl
  L2_3 = L2_3.pup_crow
  L3_4 = L2_3
  L2_3 = L2_3.getBrain
  L2_3 = L2_3(L3_4)
  L4_5 = L2_3
  L3_4 = L2_3.setIdling
  L5_6 = true
  L3_4(L4_5, L5_6)
  L4_5 = L2_3
  L3_4 = L2_3.setLockonNavi
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.set
  L5_6 = "locator2_sdemo_02_cam_01"
  L6_7 = "locator2_sdemo_02_aim_01"
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.play
  L3_4(L4_5)
  L3_4 = invokeCrowMoveTask
  L3_4 = L3_4()
  L4_5 = Fn_missionStart
  L4_5()
  L4_5 = _sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L6_7 = {L7_8}
  L7_8 = {}
  L7_8.pos = "locator2_sdemo_02_cam_02"
  L7_8.time = 3
  L7_8.hashfunc = "EaseInOut"
  L7_8 = nil
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = Fn_captionView
  L5_6 = "ep07_04004"
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 0.2
  L4_5(L5_6)
  _crow_move_start = true
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  while true do
    L4_5 = _sdemo
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = wait
  L5_6 = 10
  L4_5(L5_6)
  L4_5 = _sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L6_7 = {L7_8}
  L7_8 = {}
  L7_8.pos = "locator2_sdemo_02_cam_03"
  L7_8.time = 2
  L7_8.hashfunc = "EaseInOut"
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo_02_aim_02"
  L8_9.time = 2
  L8_9.hashfunc = "Linear"
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = invokeTask
  function L5_6()
    waitSeconds(1.3)
    Sound:playSE("kit_477", 1)
    Fn_captionViewWait("ep07_04005")
    waitSeconds(0.5)
    Sound:playSE("kit_479", 1)
    Fn_captionViewWait("ep07_04006")
    Fn_setBgmPoint("event", "cro_move")
  end
  L4_5(L5_6)
  while true do
    L4_5 = _sdemo
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = waitSeconds
  L5_6 = 0.2
  L4_5(L5_6)
  L4_5 = _sdemo
  L5_6 = L4_5
  L4_5 = L4_5.play
  L6_7 = {L7_8}
  L7_8 = {}
  L7_8.pos = "locator2_sdemo_02_cam_04"
  L7_8.time = 1
  L7_8.hashfunc = "EaseInOut"
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo_02_aim_03"
  L8_9.time = 1.5
  L8_9.hashfunc = "EaseOut"
  L4_5(L5_6, L6_7, L7_8)
  while true do
    L4_5 = _sdemo
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = _sdemo
  L5_6 = L4_5
  L4_5 = L4_5.stop
  L6_7 = 1
  L4_5(L5_6, L6_7)
  L4_5 = Fn_userCtrlOn
  L4_5()
  _is_ar_attack = false
  L4_5 = Fn_pcSensorOn
  L5_6 = "pccubesensormulti2_ar_attack_e_01"
  L4_5(L5_6)
  while true do
    L4_5 = HUD
    L5_6 = L4_5
    L4_5 = L4_5.captionGetTextId
    L4_5 = L4_5(L5_6)
    if L4_5 ~= nil then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = Fn_missionView
  L5_6 = "ep07_04007"
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 1.3
  L4_5(L5_6)
  L4_5 = HUD
  L5_6 = L4_5
  L4_5 = L4_5.naviSetPochiDistanceDensity0
  L6_7 = 0
  L4_5(L5_6, L6_7)
  L4_5 = HUD
  L5_6 = L4_5
  L4_5 = L4_5.naviSetPochiDistanceDensity100
  L6_7 = -1
  L4_5(L5_6, L6_7)
  L4_5 = Fn_naviSet
  L5_6 = _puppet_tbl
  L5_6 = L5_6.pup_crow
  L4_5(L5_6)
  L4_5 = invokeTask
  function L5_6()
    local L0_12, L1_13
    L0_12 = false
    L1_13 = 0
    for _FORV_6_, _FORV_7_ in ipairs(CLOW_CHASE_CAPTION_TABLE) do
      while true do
        if L1_13 > 0 then
          L1_13 = L1_13 - 1
        end
        if findGameObject2("Node", _FORV_7_.locator):getWorldPos():DistanceTo(_puppet_tbl.pup_crow:getWorldPos()) < 20 then
          if Fn_isInSightTarget(_puppet_tbl.pup_crow, 1) then
            Sound:playSE(_FORV_7_.se, 1)
            Fn_captionView(_FORV_7_.caption)
            break
          end
        else
        end
        if true ~= true then
          if Fn_isInSightTarget(_puppet_tbl.pup_crow, 1) and (L0_12 == false or L1_13 <= 0) and HUD:captionGetTextId() == nil then
            if L1_13 <= 0 and Player:getAction() == Player.kAction_Float and Fn_getDistanceToPlayer(_puppet_tbl.pup_crow:getWorldPos()) > 150 then
              Sound:playSE("kit051a", 1)
              Fn_captionView("ep07_04008")
              L1_13 = 300
            end
            if L0_12 == false and Fn_getDistanceToPlayer(_puppet_tbl.pup_crow:getWorldPos()) < 15 then
              Sound:playSE("kit058c", 1)
              Fn_captionView("ep07_04009")
              L0_12 = true
            end
          end
          wait()
        end
      end
    end
  end
  L4_5 = L4_5(L5_6)
  L5_6 = CLOW_CHASE_LIMIT_LENGTH
  _clow_lost_check_dist = L5_6
  L5_6 = findGameObject2
  L6_7 = "Sensor"
  L7_8 = "cubesensor2_race_lost_check_dist_change_01"
  L5_6 = L5_6(L6_7, L7_8)
  L7_8 = L5_6
  L6_7 = L5_6.setFilterName
  L8_9 = _puppet_tbl
  L8_9 = L8_9.pup_crow
  L9_10 = L8_9
  L8_9 = L8_9.getName
  L10_11 = L8_9(L9_10)
  L6_7(L7_8, L8_9, L9_10, L10_11, L8_9(L9_10))
  L6_7 = Fn_sensorOn
  L7_8 = L5_6
  L6_7(L7_8)
  function L5_6(A0_14)
    if A0_14 == 1 then
      arAttack()
    elseif A0_14 == 2 then
      Fn_naviKill()
      Sound:playSE("kit034c", 1)
      Fn_captionViewWait("ep07_04010")
      Fn_blackout()
      if L3_4 ~= nil then
        L3_4:abort()
        L3_4 = nil
      end
      _puppet_tbl.pup_crow:getBrain():setMoveVelocityRatio(1, 0)
    end
    Fn_missionRetry()
  end
  L6_7 = nil
  while true do
    L8_9 = L3_4
    L7_8 = L3_4.isRunning
    L7_8 = L7_8(L8_9)
    if L7_8 then
      L7_8 = _is_ar_attack
      if L7_8 == true then
        L6_7 = 1
        break
      else
        L7_8 = _clow_lost_check_dist
        L8_9 = Fn_getDistanceToPlayer
        L9_10 = _puppet_tbl
        L9_10 = L9_10.pup_crow
        L10_11 = L9_10
        L9_10 = L9_10.getWorldPos
        L10_11 = L9_10(L10_11)
        L8_9 = L8_9(L9_10, L10_11, L9_10(L10_11))
        if L7_8 < L8_9 then
          L6_7 = 2
          break
        end
      end
    end
    L7_8 = wait
    L7_8()
  end
  L7_8 = Fn_sensorOff
  L8_9 = "cubesensor2_race_lost_check_dist_change_01"
  L7_8(L8_9)
  L8_9 = L4_5
  L7_8 = L4_5.abort
  L7_8(L8_9)
  L4_5 = nil
  L7_8 = Fn_pcSensorOff
  L8_9 = "pccubesensormulti2_ar_attack_e_01"
  L7_8(L8_9)
  _is_ar_attack = false
  if L6_7 ~= nil then
    L7_8 = L5_6
    L8_9 = L6_7
    L7_8(L8_9)
  else
    L8_9 = L3_4
    L7_8 = L3_4.abort
    L7_8(L8_9)
    L3_4 = nil
    L7_8 = _puppet_tbl
    L7_8 = L7_8.pup_crow
    L8_9 = L7_8
    L7_8 = L7_8.getBrain
    L7_8 = L7_8(L8_9)
    L8_9 = L7_8
    L7_8 = L7_8.setMoveVelocityRatio
    L9_10 = 1
    L10_11 = 0
    L7_8(L8_9, L9_10, L10_11)
  end
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_navi_race_goal_01"
  L7_8 = L7_8(L8_9, L9_10)
  L8_9 = Fn_naviSet
  L9_10 = L7_8
  L8_9(L9_10)
  L8_9 = Fn_pcSensorOn
  L9_10 = "pccubesensor2_race_wait_01"
  L8_9(L9_10)
  _is_in_sensor = false
  L8_9 = invokeTask
  L9_10 = waitSeconds
  L10_11 = 5
  L8_9 = L8_9(L9_10, L10_11)
  while true do
    L9_10 = _is_in_sensor
    if L9_10 == false then
      L10_11 = L8_9
      L9_10 = L8_9.isRunning
      L9_10 = L9_10(L10_11)
      if L9_10 then
        L9_10 = _clow_lost_check_dist
        L10_11 = Fn_getDistanceToPlayer
        L10_11 = L10_11(L7_8:getWorldPos())
        if L9_10 < L10_11 then
          L6_7 = 2
          break
        end
      end
    end
    L9_10 = wait
    L9_10()
  end
  L10_11 = L8_9
  L9_10 = L8_9.abort
  L9_10(L10_11)
  L8_9 = nil
  L9_10 = Fn_pcSensorOff
  L10_11 = "pccubesensor2_race_wait_01"
  L9_10(L10_11)
  _is_in_sensor = false
  if L6_7 ~= nil then
    L9_10 = L5_6
    L10_11 = L6_7
    L9_10(L10_11)
  end
  L8_9 = {}
  L9_10 = _puppet_tbl
  L9_10 = L9_10.pup_crow
  L10_11 = L9_10
  L9_10 = L9_10.getWorldPos
  L9_10 = L9_10(L10_11)
  L10_11 = table
  L10_11 = L10_11.insert
  L10_11(L8_9, {
    pos = L9_10,
    action = Supporter.MovePoint.Air,
    vel = CLOW_MOVE_C_SPEED
  })
  L10_11 = 1
  while findGameObject2("Node", "locator2_race_crow_move_c_" .. string.format("%02d", L10_11)) ~= nil do
    table.insert(L8_9, {
      pos = findGameObject2("Node", "locator2_race_crow_move_c_" .. string.format("%02d", L10_11)):getWorldPos(),
      action = Supporter.MovePoint.Air,
      vel = CLOW_MOVE_C_SPEED
    })
    do break end
    do break end
    L10_11 = L10_11 + 1
  end
  L2_3:setIdling(false)
  L2_3:setMovePoints(L8_9)
  L2_3:startMovePoint()
  repeat
    if _clow_lost_check_dist < Fn_getDistanceToPlayer(L7_8:getWorldPos()) then
      L6_7 = 2
      break
    end
    wait()
  until L2_3:isMovePointEnd()
  L2_3:clearMovePoint()
  L2_3:setIdling(true)
  if L6_7 ~= nil then
    L5_6(L6_7)
  end
  L8_9 = _puppet_tbl
  L8_9 = L8_9.pup_crow
  L9_10 = L8_9
  L8_9 = L8_9.setActive
  L10_11 = false
  L8_9(L9_10, L10_11)
  L8_9 = findGameObject2
  L9_10 = "Puppet"
  L10_11 = "_puppet_supporter_raven"
  L8_9 = L8_9(L9_10, L10_11)
  if L8_9 ~= nil then
    L10_11 = L8_9
    L9_10 = L8_9.setActive
    L9_10(L10_11, false)
  end
  _is_in_sensor = false
  L8_9 = Fn_pcSensorOn
  L9_10 = "pccubesensor2_race_goal_01"
  L8_9(L9_10)
  while true do
    L8_9 = _is_in_sensor
    if L8_9 == false then
      L8_9 = _clow_lost_check_dist
      L9_10 = Fn_getDistanceToPlayer
      L10_11 = L7_8.getWorldPos
      L10_11 = L10_11(L7_8)
      L9_10 = L9_10(L10_11, L10_11(L7_8))
      if L8_9 < L9_10 then
        L6_7 = 2
        break
      end
    end
    L8_9 = wait
    L8_9()
  end
  L8_9 = Fn_naviKill
  L8_9()
  L8_9 = Fn_pcSensorOff
  L9_10 = "pccubesensor2_race_goal_01"
  L8_9(L9_10)
  _is_in_sensor = false
  if L6_7 ~= nil then
    L8_9 = L5_6
    L9_10 = L6_7
    L8_9(L9_10)
  else
  end
  L0_1 = nil
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setStay
  L5_6 = true
  L3_4(L4_5, L5_6)
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setStay
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = Fn_userCtrlOff
  L3_4()
  L3_4 = Fn_resetCoercionPose
  L3_4()
  L3_4 = Fn_setKeepPlayerPos
  L3_4()
  L3_4 = Fn_setNextMissionFlag
  L3_4()
  L3_4 = Fn_nextMission
  L3_4()
  L3_4 = Fn_exitSandbox
  L3_4()
end
function Finalize()
  if Fn_getPlayer() then
    Fn_resetCoercionPose()
  end
end
function invokeCrowMoveTask()
  local L0_15
  _crow_move_start = false
  _crow_speed_up_check = false
  L0_15 = {}
  L0_15.force_end_task = nil
  function L0_15.update(A0_16)
    local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42
    while true do
      L1_17 = _crow_move_start
      if not L1_17 then
        L1_17 = wait
        L1_17()
      end
    end
    L1_17 = waitSeconds
    L2_18 = 1
    L1_17(L2_18)
    L1_17 = {}
    L2_18 = 1
    while true do
      L3_19 = findGameObject2
      L4_20 = "Node"
      L5_21 = "locator2_race_crow_move_a_"
      L5_21 = L5_21 .. L6_22
      L3_19 = L3_19(L4_20, L5_21)
      if L3_19 ~= nil then
        if L2_18 == 1 then
          L4_20 = table
          L4_20 = L4_20.insert
          L5_21 = L1_17
          L6_22.node = L3_19
          L6_22.action = L7_23
          L4_20(L5_21, L6_22)
        end
        L4_20 = table
        L4_20 = L4_20.insert
        L5_21 = L1_17
        L6_22.node = L3_19
        L6_22.action = L7_23
        L6_22.vel = L7_23
        L4_20(L5_21, L6_22)
      else
        break
      end
      L2_18 = L2_18 + 1
    end
    L3_19 = L2_18
    L2_18 = 1
    while true do
      L4_20 = findGameObject2
      L5_21 = "Node"
      L9_25 = L2_18
      L4_20 = L4_20(L5_21, L6_22)
      if L4_20 ~= nil then
        L5_21 = CLOW_CHASE_SPEED
        if L2_18 >= L6_22 then
          L5_21 = CLOW_CHASE_SPEED_HIGH
        end
        L8_24.node = L4_20
        L9_25 = Supporter
        L9_25 = L9_25.MovePoint
        L9_25 = L9_25.Air
        L8_24.action = L9_25
        L8_24.vel = L5_21
        L6_22(L7_23, L8_24)
      else
        break
      end
      L2_18 = L2_18 + 1
    end
    L4_20 = _puppet_tbl
    L4_20 = L4_20.pup_crow
    L5_21 = L4_20
    L4_20 = L4_20.getBrain
    L4_20 = L4_20(L5_21)
    L5_21 = L4_20.setMovePoints
    L5_21(L6_22, L7_23)
    L5_21 = L4_20.startMovePoint
    L5_21(L6_22)
    L5_21 = {}
    for L9_25 = 1, L7_23 - 1 do
      L10_26 = Fn_get_distance
      L11_27 = L1_17[L9_25]
      L11_27 = L11_27.node
      L11_27 = L11_27.getWorldPos
      L11_27 = L11_27(L12_28)
      L26_42 = L12_28(L13_29)
      L10_26 = L10_26(L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36, L21_37, L22_38, L23_39, L24_40, L25_41, L26_42, L12_28(L13_29))
      L5_21[L9_25] = L10_26
    end
    L9_25 = pc_dist_to_goal
    L7_23(L8_24, L9_25)
    L9_25 = L8_24
    L9_25 = 1
    L10_26 = 1
    L11_27 = nil
    for L15_31 = 1, #L1_17 do
      L16_32 = L1_17[L15_31]
      L16_32 = L16_32.node
      L16_32 = L16_32.getWorldPos
      L16_32 = L16_32(L17_33)
      if L11_27 == nil or L11_27 > L17_33 then
        L9_25 = L15_31
        L11_27 = L17_33
      end
    end
    L11_27 = 0
    for L16_32 = L9_25, #L5_21 do
      L11_27 = L11_27 + L17_33
    end
    for L16_32 = L10_26, #L5_21 do
    end
    repeat
      repeat
        L16_32 = _puppet_tbl
        L16_32 = L16_32.pup_crow
        L16_32 = L16_32.getWorldPos
        L16_32 = L16_32(L17_33)
        L21_37 = 200
        for L25_41 = 1, #L1_17 do
          L26_42 = L1_17[L25_41]
          L26_42 = L26_42.node
          L26_42 = L26_42.getWorldPos
          L26_42 = L26_42(L26_42)
          if L19_35 == nil or L19_35 > Fn_getDistanceToPlayer(L26_42) then
          end
          if 0 < L17_33:Dot(L26_42 - L15_31) and L21_37 > Fn_getDistanceToPlayer(L26_42) then
            L21_37 = Fn_getDistanceToPlayer(L26_42)
          end
        end
        if L20_36 ~= nil then
          if L9_25 < L20_36 then
            L9_25 = L20_36
            L22_38(L23_39)
          end
        elseif L18_34 ~= nil and L18_34 > L9_25 then
          L9_25 = L18_34
          L22_38(L23_39)
        end
        L26_42 = L23_39(L24_40)
        for L26_42 = L9_25 + 1, #L5_21 do
        end
        L11_27 = L23_39
        for L20_36 = L10_26, L18_34 - 1 do
          L21_37 = Fn_get_distance
          L26_42 = L23_39(L24_40)
          L21_37 = L21_37(L22_38, L23_39, L24_40, L25_41, L26_42, L23_39(L24_40))
          if L21_37 <= 3 then
            L10_26 = L20_36 + 1
            L21_37 = print
            L21_37(L22_38)
            break
          end
        end
        L26_42 = L19_35(L20_36)
        for L21_37 = L10_26 + 1, #L5_21 do
        end
        if L10_26 >= L17_33 then
          if L13_29 <= 0 then
            if L14_30 == nil then
            end
            L21_37 = 0
            L21_37 = L20_36 - L14_30
            L21_37 = L21_37 * L19_35
            L21_37 = L21_37 + L22_38
            L21_37 = L21_37 + L17_33
            L21_37 = L21_37 / L22_38
            L23_39(L24_40)
            L26_42 = L18_34
            L23_39(L24_40, L25_41, L26_42)
          else
          end
        end
        L17_33(L18_34, L19_35)
        if L17_33 > 50 then
          L17_33(L18_34, L19_35)
        end
        if L17_33 == nil then
          if L10_26 > L17_33 then
            A0_16.force_end_task = L17_33
          end
        end
        L17_33()
      until L17_33 ~= nil
    until L17_33 == false
    if L15_31 ~= nil then
      L16_32 = L15_31
      L15_31(L16_32)
      A0_16.force_end_task = nil
    end
  end
  function L0_15.destructor(A0_43)
    _puppet_tbl.pup_crow:getBrain():clearMovePoint()
    if A0_43.force_end_task ~= nil then
      A0_43.force_end_task:abort()
      A0_43.force_end_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L0_15.update, L0_15.destructor, L0_15)
end
function arAttack()
  local L0_44
  L0_44 = Player
  L0_44 = L0_44.setStay
  L0_44(L0_44, true)
  L0_44 = Player
  L0_44 = L0_44.setNoDamageMode
  L0_44(L0_44, Player.kNoDamage_All, true)
  L0_44 = Sound
  L0_44 = L0_44.playSEHandle
  L0_44 = L0_44(L0_44, "ep10_siren", 1, "", Fn_findAreaHandle("ar_a_root"))
  Fn_findNpc("ep07_soldier"):changeEnemy()
  Fn_findNpc("ep07_soldier"):getBrain():setVisibleEnemyMarker(false)
  Fn_findNpc("ep07_soldier"):getBrain():setEnableHomingTarget(false)
  waitSeconds(0.5)
  Fn_playMotionNpc("ep07_merchant_01", {
    "scared_in_00",
    "scared_00"
  }, false)
  waitSeconds(0.5)
  Fn_captionView("ep07_04011")
  waitSeconds(2)
  Fn_blackout()
  Fn_findNpc("ep07_soldier"):changeNpc()
  Sound:stopSEHandle(L0_44)
  L0_44 = nil
  Player:setStay(false)
  Fn_userCtrlOff()
  Player:setNoDamageMode(Player.kNoDamage_All, false)
end
function cubesensor2_race_lost_check_dist_change_01_OnEnter()
  Fn_sensorOff("cubesensor2_race_lost_check_dist_change_01")
  _clow_lost_check_dist = CLOW_CHASE_LIMIT_LENGTH_2
end
function cubesensor2_race_lost_check_dist_change_01_OnLeave()
  local L0_45, L1_46
end
function pccubesensor2_race_wait_01_OnEnter()
  local L0_47, L1_48
  _is_in_sensor = true
end
function pccubesensor2_race_wait_01_OnLeave()
  local L0_49, L1_50
  _is_in_sensor = false
end
function pccubesensor2_race_goal_01_OnEnter()
  local L0_51, L1_52
  _is_in_sensor = true
end
function pccubesensor2_race_goal_01_OnLeave()
  local L0_53, L1_54
  _is_in_sensor = false
end
function pccubesensormulti2_ar_attack_e_01_OnEnter()
  local L0_55, L1_56
  _is_ar_attack = true
end
function pccubesensormulti2_ar_attack_e_01_OnLeave()
  local L0_57, L1_58
  _is_ar_attack = false
end
