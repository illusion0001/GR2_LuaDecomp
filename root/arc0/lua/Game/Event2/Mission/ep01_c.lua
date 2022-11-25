dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/area_controller.lua")
_next_phase = false
__enemy_cnt = 0
sdemo = nil
enmgen2_ep01_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_1_01",
      name = "ep01_b_1_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_1_02",
      name = "ep01_b_1_02"
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
  onObjectDead = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
enmgen2_ep01_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bosshand",
      locator = "locator_boss_01",
      name = "enemy_boss_hand"
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onObjectDead = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyDeadNum = A0_17:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_19)
    return #A0_19.spawnSet
  end,
  getEnemyRest = function(A0_20)
    local L1_21
    L1_21 = A0_20.spawnSet
    L1_21 = #L1_21
    L1_21 = L1_21 - A0_20.enemyDeadNum
    return L1_21
  end
}
function Initialize()
  local L0_22
  L0_22 = Fn_setCatActive
  L0_22(off)
  L0_22 = {
    {
      name = "sis_01",
      type = "sis01",
      node = "locator2_sis_11",
      attach = false
    }
  }
  Fn_setupNpc(L0_22)
  Fn_pcSensorOff("pccubesensor2_advance_02")
  _bu_ctrl = AreaController.create("bu_a_root")
  _crane_ctrl = AreaController.create("ve_crane_root")
end
function Ingame()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28
  L0_23 = mother2
  L1_24 = L0_23
  L0_23 = L0_23.sendEvent
  L2_25 = "getBackgroundElement2Handle"
  L3_26 = "scree"
  L0_23 = L0_23(L1_24, L2_25, L3_26)
  L2_25 = L0_23
  L1_24 = L0_23.findSubArea
  L3_26 = "wa_a_04"
  L1_24 = L1_24(L2_25, L3_26)
  L3_26 = L0_23
  L2_25 = L0_23.findSubArea
  L4_27 = "wa_a_05"
  L2_25 = L2_25(L3_26, L4_27)
  L4_27 = L1_24
  L3_26 = L1_24.setExpandedAabb
  L5_28 = true
  L3_26(L4_27, L5_28)
  L4_27 = L2_25
  L3_26 = L2_25.setExpandedAabb
  L5_28 = true
  L3_26(L4_27, L5_28)
  L3_26 = Player
  L4_27 = L3_26
  L3_26 = L3_26.setSituation
  L5_28 = Player
  L5_28 = L5_28.kSituation_Normal
  L3_26(L4_27, L5_28, true, 0, true, false)
  L3_26 = Fn_findAreaHandle
  L4_27 = "bu_a_root"
  L3_26 = L3_26(L4_27)
  if L3_26 then
    L5_28 = L3_26
    L4_27 = L3_26.setSceneParameters
    L4_27(L5_28, "storm_a_root")
  end
  L4_27 = Fn_findAreaHandle
  L5_28 = "wa_a_root"
  L4_27 = L4_27(L5_28)
  if L4_27 then
    L5_28 = L4_27.setSceneParameters
    L5_28(L4_27, "storm_a_root")
  end
  L5_28 = Sound
  L5_28 = L5_28.playSEHandle
  L5_28 = L5_28(L5_28, "ep01_storm_inside", 1, "", "locator2_boss_01")
  storm_in = L5_28
  L5_28 = Fn_findNpc
  L5_28 = L5_28("sis_01")
  Fn_sendEventComSb("enemy_b_01_call")
  Fn_sendEventComSb("enemy_b_11_call")
  Fn_sendEventComSb("enemy_b_12_call")
  Fn_sendEventComSb("enemy_b_13_call")
  Fn_sendEventComSb("enemy_b_02_call")
  invokeTask(function()
    local L0_29
    L0_29 = findGameObject2
    L0_29 = L0_29("Node", "locator2_boss_01")
    repeat
      if Fn_isInSightTarget(L0_29, 1.5) then
        Fn_captionView("ep01_02000")
        break
      end
      wait()
    until false
  end)
  Fn_sendEventComSb("enemy_idleOn")
  if findGameObject2("EnemyGenerator", "enmgen2_boss") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_boss"):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2_boss"):setEnemyMarker(true)
  end
  while _hand_puppet == nil do
    _hand_puppet = findGameObject2("Puppet", "enemy_boss_hand")
    wait()
  end
  _hand_puppet:getBrain():bossHandSetModelLocalScale(0.001)
  _hand_puppet:getBrain():setVisibleEnemyMarker(false)
  Fn_missionStart()
  Fn_userCtrlOn()
  waitSeconds(0.6)
  invokeTask(function()
    local L0_30, L1_31, L2_32, L3_33
    L0_30 = {
      L1_31,
      L2_32,
      L3_33,
      "locator2_sis_15",
      "locator2_sis_15_2"
    }
    L1_31 = "locator2_sis_12"
    L2_32 = "locator2_sis_13"
    L3_33 = "locator2_sis_14"
    L1_31 = Fn_moveNpc
    L2_32 = "sis_01"
    L3_33 = L0_30
    L1_31 = L1_31(L2_32, L3_33, {runLength = -1})
    repeat
      L2_32 = print
      L3_33 = L5_28
      L3_33 = L3_33.getMoveCurrentIndex
      L3_33 = L3_33(L3_33)
      L2_32(L3_33, L3_33(L3_33))
      L2_32 = wait
      L2_32()
      L2_32 = L5_28
      L3_33 = L2_32
      L2_32 = L2_32.getMoveCurrentIndex
      L2_32 = L2_32(L3_33)
    until L2_32 == 5
    L2_32 = L5_28
    L3_33 = L2_32
    L2_32 = L2_32.pauseMove
    L2_32(L3_33, true)
    L2_32 = {}
    L2_32.anim_in = "jump_run_00"
    L2_32.anim_lp = "jump_run_fall_00"
    L2_32.anim_out = "jump_run_land_00"
    L2_32.anim_stay = "stay"
    L2_32.height = 0.5
    L3_33 = L5_28
    L3_33 = L3_33.jump
    L3_33(L3_33, "locator2_sis_16", L2_32)
    repeat
      L3_33 = wait
      L3_33()
      L3_33 = L5_28
      L3_33 = L3_33.isJumpEnd
      L3_33 = L3_33(L3_33)
    until L3_33
    L3_33 = L5_28
    L3_33 = L3_33.pauseMove
    L3_33(L3_33, false)
    L3_33 = {
      "locator2_sis_17",
      "locator2_sis_18",
      "locator2_sis_19",
      "locator2_sis_20"
    }
    while Fn_moveNpc("sis_01", L3_33, {runLength = -1}):isRunning() do
      wait()
    end
    Fn_playMotionNpc("sis_01", "sit_squat_00", false)
    _bu_ctrl:setMoveParam({velocity = 20, move_wait = false})
    _bu_ctrl:move("locator2_bu_a_move_01")
    _crane_ctrl:setMoveParam({velocity = 20, move_wait = false})
    _crane_ctrl:move("locator2_bu_a_move_01")
    waitSeconds(3)
    Fn_sendEventComSb("enemy_idleOff")
    waitSeconds(6)
    _bu_ctrl:stop()
    _crane_ctrl:stop()
  end)
  Fn_captionViewWait("ep01_02004")
  navi_node = findGameObject2("Node", "locator2_help_01")
  Fn_naviSet(navi_node)
  waitPhace()
  Fn_blackout()
  Fn_sendEventComSb("enemy_kill")
  Player:setSituation(Player.kSituation_Normal, true, 0.1, true, false)
  _hand_puppet:getBrain():bossHandSetModelLocalScale(1)
  GameDatabase:set(ggd.GlobalSystemFlags__AreaResetCoercion, true)
  if invokeTask(function()
    repeat
      if Fn_sendEventComSb("check_semiretry") then
        Fn_pcSensorOn("pccubesensor2_06")
        Fn_pcSensorOn("pccubesensor2_07")
        Fn_pcSensorOn("pccubesensor2_08")
        Fn_pcSensorOn("pccubesensor2_09")
        Fn_pcSensorOn("pccubesensor2_10")
        Fn_sendEventComSb("change_semiretry")
        waitSeconds(1)
        navi_node = findGameObject2("Node", "locator2_help_01")
        Fn_naviSet(navi_node)
      end
      if Fn_sendEventComSb("check_miniretry") then
        Fn_pcSensorOn("pccubesensor2_09")
        Fn_pcSensorOn("pccubesensor2_10")
        Fn_sendEventComSb("change_miniretry")
        waitSeconds(1)
        navi_node = findGameObject2("Node", "locator2_navi_01")
        Fn_naviSet(navi_node)
      end
      wait()
    until false
  end) then
    invokeTask(function()
      repeat
        if Fn_sendEventComSb("check_semiretry") then
          Fn_pcSensorOn("pccubesensor2_06")
          Fn_pcSensorOn("pccubesensor2_07")
          Fn_pcSensorOn("pccubesensor2_08")
          Fn_pcSensorOn("pccubesensor2_09")
          Fn_pcSensorOn("pccubesensor2_10")
          Fn_sendEventComSb("change_semiretry")
          waitSeconds(1)
          navi_node = findGameObject2("Node", "locator2_help_01")
          Fn_naviSet(navi_node)
        end
        if Fn_sendEventComSb("check_miniretry") then
          Fn_pcSensorOn("pccubesensor2_09")
          Fn_pcSensorOn("pccubesensor2_10")
          Fn_sendEventComSb("change_miniretry")
          waitSeconds(1)
          navi_node = findGameObject2("Node", "locator2_navi_01")
          Fn_naviSet(navi_node)
        end
        wait()
      until false
    end):abort()
  end
  Fn_naviKill()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Sound:stopSEHandle(storm_in)
end
function pccubesensor2_06_OnEnter(A0_34)
  A0_34:setActive(false)
  Fn_naviKill()
  navi_node = findGameObject2("Node", "locator2_help_02")
  Fn_naviSet(navi_node)
end
function pccubesensor2_07_OnEnter(A0_35)
  A0_35:setActive(false)
  Fn_naviKill()
  invokeTask(function()
    local L0_36
    L0_36 = Fn_captionViewWait
    L0_36("ep01_02005")
    L0_36 = findGameObject2
    L0_36 = L0_36("Node", "locator2_navi_01")
    Fn_naviSet(L0_36)
  end)
  invokeTask(function()
    repeat
      print("\232\183\157\233\155\162" .. Fn_getDistanceToPlayer(sisy_pos))
      if findGameObject2("Node", "locator2_navi_01") ~= nil then
        if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_01"):getWorldPos()) < 10 then
          print("\227\131\138\227\131\147\230\182\136\227\129\153")
          Fn_naviKill()
        else
          print("\227\131\138\227\131\147\233\129\160\227\129\132")
        end
      else
        print("\227\131\138\227\131\147\231\132\161\227\129\151")
      end
      wait()
    until false
  end)
end
function pccubesensor2_08_OnEnter(A0_37)
  A0_37:setActive(false)
  Fn_sendEventComSb("enemy_c_01_call")
  invokeTask(function()
    Fn_captionView("ep01_02001")
  end)
end
function pccubesensor2_09_OnEnter(A0_38)
  Fn_tutorialCaptionKill()
  invokeTask(function()
    local L0_39
    L0_39 = Fn_findNpcPuppet
    L0_39 = L0_39("sis_01")
    repeat
      if Fn_isInSightTarget(L0_39, 1) then
        Fn_captionView("ep01_02002")
        A0_38:setActive(false)
        break
      end
      wait()
    until false
  end)
end
function pccubesensor2_10_OnEnter(A0_40)
  A0_40:setActive(false)
  _next_phase = true
end
function pccubesensor2_back_02_OnEnter(A0_41)
  A0_41:setActive(false)
  Fn_pcSensorOn("pccubesensor2_advance_02")
  Fn_captionView("ep01_02003")
  Fn_naviSet(findGameObject2("Node", "locator2_back_02"))
end
function pccubesensor2_advance_02_OnEnter(A0_42)
  A0_42:setActive(false)
  Fn_pcSensorOn("pccubesensor2_back_02")
  Fn_naviKill()
  Fn_sendEventComSb("stand_semiretry")
end
function navi_on()
  local L0_43, L1_44
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function ore_check_eye(A0_45, A1_46)
  local L2_47, L3_48, L4_49, L5_50
  if A1_46 == nil then
    A1_46 = 300
  end
  L2_47 = false
  L3_48 = Fn_isInSightTarget
  L4_49 = A0_45
  L3_48 = L3_48(L4_49)
  if L3_48 == true then
    L3_48 = Fn_getPcPosRot
    L4_49 = L3_48()
    L5_50 = L3_48.y
    L5_50 = L5_50 + 1.5
    L3_48.y = L5_50
    L5_50 = Query
    L5_50 = L5_50.setEyeSightTransform
    L5_50(L5_50, L3_48, L4_49)
    L5_50 = Query
    L5_50 = L5_50.setEyeSightAngle
    L5_50(L5_50, Deg2Rad(360))
    L5_50 = Query
    L5_50 = L5_50.setEyeSightRange
    L5_50(L5_50, A1_46)
    L5_50 = A0_45.getWorldPos
    L5_50 = L5_50(A0_45)
    if A1_46 >= Fn_getDistanceToPlayer(A0_45) and Query:raycastEyeSight(L5_50) == nil then
      L2_47 = true
    end
  end
  return L2_47
end
