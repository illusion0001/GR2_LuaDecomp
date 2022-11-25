dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm17_common.lua")
PATIENCE_PARAM_FIRST = {
  MAX = 100,
  UP = 0.03,
  DOWN = 0.7
}
PATIENCE_PARAM_COMMON = {
  MAX = 100,
  UP = 0.12,
  DOWN = 0.7
}
STEP = {
  BEFORE_FIRST_GRAB = 0,
  FIRST_GRAB = 1,
  AFTER_FIRST_GRAB = 2
}
LYING_CNT = 4
NPC_MOTION = {
  DOWN_B_00 = "man57_down_b_00",
  DOWN_B_01 = "man57_down_b_01"
}
_puppet_tbl = {}
_ship_hdl = nil
_step_state = STEP.BEFORE_FIRST_GRAB
_is_in_enemy_area = true
_is_in_find_recipient_area = false
_recipient_navi_start = false
_enmgen_tbl = {
  enmgen2_c_01 = {enmgen = nil, check_node_hdl = nil},
  enmgen2_c_02 = {enmgen = nil, check_node_hdl = nil}
}
_is_catwarp_flg = true
_is_dist_catwarp = false
enmgen2_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_enmgen2_c_01_01",
      name = "enemy_c_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_enmgen2_c_01_02",
      name = "enemy_c_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_enmgen2_c_01_03",
      name = "enemy_c_01_03"
    }
  }
}
enmgen2_c_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_enmgen2_c_02_01",
      name = "enemy_c_02_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_enmgen2_c_02_01",
      name = "enemy_c_02_01_driver",
      target_vehicle = "enemy_c_02_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_enmgen2_c_02_02",
      name = "enemy_c_02_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_enmgen2_c_02_03",
      name = "enemy_c_02_03"
    }
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    {
      name = "lying03",
      type = "man57",
      node = "locator2_lying03_c_01",
      reset = false
    },
    {
      name = "lying04",
      type = "man57",
      node = "locator2_lying04_c_01",
      reset = false
    }
  }
  L1_1.name = "recipient_01"
  L1_1.type = "man49"
  L1_1.node = "locator2_recipient_01"
  L1_1.anim_name = "stay_01"
  L2_2.name = "driver01"
  L2_2.type = "man36"
  L2_2.node = "locator2_driver_c_01"
  L2_2.reset = false
  L3_3.name = "lying01"
  L3_3.type = "man57"
  L3_3.node = "locator2_lying01_c_01"
  L3_3.reset = false
  L4_4 = {}
  L4_4.name = "lying02"
  L4_4.type = "man57"
  L4_4.node = "locator2_lying02_c_01"
  L4_4.reset = false
  npc = L1_1
  L1_1(L2_2)
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  if L1_1 == nil then
    L1_1(L2_2, L3_3)
    for L4_4 = 1, LYING_CNT do
      Fn_loadNpcEventMotion(string.format("lying%02d", L4_4), NPC_MOTION)
    end
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14
  L0_5(L1_6)
  if L0_5 == nil then
    L3_8 = false
    L0_5(L1_6, L2_7, L3_8)
    for L3_8 = 1, LYING_CNT do
      if L3_8 == 2 or L3_8 == 4 then
        L4_9 = Fn_playMotionNpc
        L4_9(L5_10, L6_11, L7_12)
      else
        L4_9 = Fn_playMotionNpc
        L4_9(L5_10, L6_11, L7_12)
      end
    end
  end
  for L3_8, L4_9 in L0_5(L1_6) do
    L8_13 = L3_8
    L5_10.enmgen = L6_11
    L8_13 = string
    L8_13 = L8_13.format
    L9_14 = "locator2_%s"
    L9_14 = L8_13(L9_14, L3_8)
    L5_10.check_node_hdl = L6_11
  end
  L0_5(L1_6)
  L0_5(L1_6, L2_7)
  _ship_hdl = L0_5
  if L0_5 == nil then
    L0_5(L1_6)
    repeat
      _ship_hdl = L0_5
      L0_5()
    until L0_5 ~= nil
  end
  L3_8 = "bag_01"
  L0_5.bag_hdl = L1_6
  if L0_5 == nil then
    L0_5(L1_6)
    L0_5(L1_6)
  end
  L3_8 = true
  L0_5(L1_6, L2_7, L3_8)
  L0_5()
  L0_5(L1_6, L2_7)
  L3_8 = false
  L0_5(L1_6, L2_7, L3_8)
  L0_5()
  L0_5()
  L3_8 = "pccubesensor2_catwarp_c_02"
  L0_5(L1_6, L2_7, L3_8)
  L3_8 = invokeTask
  function L4_9()
    local L0_15
    repeat
      L0_15 = L2_7
      if L0_15 ~= nil then
        L0_15 = _is_in_enemy_area
        if L0_15 == false then
          L0_15 = _step_state
          if L0_15 == STEP.FIRST_GRAB then
            L0_15 = Player
            L0_15 = L0_15.getUnderfootObject
            L0_15 = L0_15(L0_15)
            if L0_15 ~= nil then
              L0_15 = _mission_data
              L0_15 = L0_15.bag_hdl
              L0_15 = L0_15.isGrabbed
              L0_15 = L0_15(L0_15)
              if L0_15 == false then
                L0_15 = invokeTask
                L0_15 = L0_15(function()
                  Fn_captionViewWait("sm17_02010")
                end)
                createStopGuideCaptionTask(L0_15, true)
                L2_7 = Mv_safeTaskAbort(L2_7)
                L2_7 = createCarryTask(PATIENCE_PARAM_COMMON)
                _step_state = STEP.AFTER_FIRST_GRAB
              end
            end
          end
        end
      end
      L0_15 = wait
      L0_15()
      L0_15 = false
    until L0_15
  end
  L3_8 = L3_8(L4_9)
  L4_9 = nil
  repeat
    if not L5_10 then
      L4_9 = L5_10
      L4_9 = L5_10
    end
    L8_13 = L5_10
    L9_14 = true
    L7_12(L8_13, L9_14)
    L8_13 = L6_11
    L7_12(L8_13)
    L8_13 = L7_12
    L7_12(L8_13)
    L8_13 = L5_10
    L8_13 = _mission_data
    L8_13 = L8_13.now_retry
    if not L8_13 then
      L8_13 = Fn_pcSensorOn
      L9_14 = "pccubesensor2_away_from_bisuma"
      L8_13(L9_14)
      L8_13 = Fn_pcSensorOn
      L9_14 = "pccubesensor2_enemy_change_01"
      L8_13(L9_14)
      L8_13 = patienceGaugeOn
      L9_14 = PATIENCE_PARAM_FIRST
      L8_13(L9_14)
      L8_13 = Mv_invokeMissionViewNaviCaption
      L9_14 = "sm17_02011"
      L8_13 = L8_13(L9_14, nil, "sm17_02006", 0.2)
      L8_13 = createStopGuideCaptionTask
      L9_14 = L7_12
      L8_13(L9_14, true)
      L8_13 = Mv_safeTaskAbort
      L9_14 = L2_7
      L8_13 = L8_13(L9_14)
      L8_13 = createCarryTask
      L9_14 = PATIENCE_PARAM_FIRST
      L8_13 = L8_13(L9_14)
    end
    repeat
      L8_13 = _mission_data
      L8_13 = L8_13.now_retry
      if not L8_13 then
        L8_13 = Mv_isSafeTaskRunning
        L9_14 = L7_12
        L8_13 = L8_13(L9_14)
        if not L8_13 then
          L8_13 = findGameObject2
          L9_14 = "PlayerSensor"
          L8_13 = L8_13(L9_14, "pccubesensor2_away_from_bisuma")
          L9_14 = L8_13
          L8_13 = L8_13.getCount
          L8_13 = L8_13(L9_14)
          if L8_13 == 0 then
            L8_13 = _mission_data
            L8_13 = L8_13.bag_hdl
            L9_14 = L8_13
            L8_13 = L8_13.isGrabbed
            L8_13 = L8_13(L9_14)
          end
        end
        if not L8_13 then
          L8_13 = wait
          L8_13()
          L8_13 = Mv_isWaitPhase
          L8_13 = L8_13()
        end
      end
    until not L8_13
    L8_13 = Mv_safeTaskAbort
    L9_14 = L7_12
    L8_13 = L8_13(L9_14)
    L8_13 = invokeTask
    function L9_14()
      local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22
      L0_16 = 1000
      L1_17 = 1100
      L2_18 = 1200
      L3_19 = false
      L4_20 = false
      L5_21 = false
      L6_22 = Fn_getDistanceToPlayer
      L6_22 = L6_22(findGameObject2("Node", "locator2_recipient_01"))
      while _is_catwarp_flg do
        L6_22 = Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_recipient_01"))
        if L2_18 < L6_22 and L5_21 == false then
          L5_21 = true
          if Player:getGrabObjectCount() > 0 then
            setIsCatwarp(true)
            _is_dist_catwarp = true
            Fn_catWarp()
            setIsCatwarp(false)
            Player:grabSilently(23)
            boxGrab(true)
          else
            Fn_catWarp()
          end
        elseif L1_17 < L6_22 and L4_20 == false then
          L4_20 = true
          invokeTask(function()
            Player:setStay(true)
            if caption ~= nil then
              Fn_captionViewLock(caption)
            else
              Fn_captionViewLock("sm17_09000")
            end
            Player:setStay(false)
          end)
        elseif L0_16 < L6_22 and L3_19 == false then
          L3_19 = true
          goalDistanceSet(true)
        elseif L0_16 > L6_22 then
          goalDistanceSet(false)
        end
        if L2_18 > L6_22 then
          L5_21 = false
        end
        if L1_17 > L6_22 then
          L4_20 = false
        end
        if L0_16 > L6_22 then
          L3_19 = false
        end
        wait()
      end
    end
    L8_13 = L8_13(L9_14)
    L9_14 = init_create_enemy_gem
    L9_14("locator2_recipient_01")
    L9_14 = nil
    if not _mission_data.now_retry then
      Mv_resetWaitPhase()
      Fn_pcSensorOff("pccubesensor2_away_from_bisuma")
      Fn_kaiwaDemoView("sm17_00800k")
      Fn_pcSensorOn("pccubesensor2_find_recipient_cap_01")
      Fn_pcSensorOn("pccubesensor2_arrive_goal")
      Fn_sensorOn("cubesensor2_bag_arrive_goal")
      findGameObject2("Sensor", "cubesensor2_bag_arrive_goal"):setFilterName(getBaggageHandle():getName())
      _recipient_navi_start = true
      L9_14 = Mv_invokeMissionViewNaviCaption("sm17_00101", _puppet_tbl.recipient_01, "sm17_02007", 0.8)
      createStopGuideCaptionTask(L9_14, true)
    end
    repeat
      while not _mission_data.now_retry or _is_dist_catwarp do
        if 0 < findGameObject2("PlayerSensor", "pccubesensor2_arrive_goal"):getCount() then
          if _mission_data.bag_hdl:isGrabbed() then
            print("\232\141\183\231\137\169\227\130\146\227\130\176\227\131\169\227\131\150\227\129\151\227\129\166\230\156\128\231\181\130\229\156\176\231\130\185\229\136\176\231\157\128\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159")
            Mv_gotoNextPhase()
          elseif 0 < findGameObject2("Sensor", "cubesensor2_bag_arrive_goal"):getCount() then
            print("\232\141\183\231\137\169\227\130\146\227\130\176\227\131\169\227\131\150\227\129\151\227\129\166\227\129\132\227\129\170\227\129\132\227\129\140\227\128\129\232\141\183\231\137\169\227\130\146\229\144\171\227\130\129\227\129\166\230\156\128\231\181\130\229\156\176\231\130\185\229\136\176\231\157\128\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159")
            Mv_gotoNextPhase()
          end
        end
        wait()
      end
    until not Mv_isWaitPhase()
    L9_14 = Mv_safeTaskAbort(L5_10)
    if _mission_data.now_retry then
      repeat
        wait()
      until not _mission_data.now_retry
    end
  until not Mv_isWaitPhase()
  do break end
  L3_8 = L5_10
  L4_9 = L5_10
  L5_10()
  L5_10()
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  for L8_13 = 1, 4 do
    L9_14 = Fn_disappearNpc
    L9_14("lying" .. string.format("%02d", L8_13))
  end
  _ship_hdl = L5_10
  L5_10(L6_11, L7_12)
  L5_10(L6_11)
  L5_10(L6_11, L7_12)
  L5_10()
  catwarp_task = L5_10
  _is_catwarp_flg = false
  L5_10()
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10()
  L5_10()
  L5_10()
  L5_10()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Player:setForcedNormalGrab(false)
  mobToPanic(false)
end
function pccubesensor2_away_from_bisuma_OnLeave()
  if _mission_data.now_retry == false and _mission_data.bag_hdl:isGrabbed() then
    print("\232\141\183\231\137\169\227\130\146\230\140\129\227\129\163\227\129\166\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\139\227\130\137\233\155\162\232\132\177\227\129\151\227\129\159")
    Mv_gotoNextPhase()
  end
end
function pccubesensor2_enemy_change_01_OnLeave()
  for _FORV_3_, _FORV_4_ in pairs(_enmgen_tbl) do
    _FORV_4_.enmgen:requestIdlingEnemy(true)
    _FORV_4_.enmgen:setEnemyMarker(false)
  end
  Fn_sendEventComSb("setEnemyForDemo", "enmgen2_com_01")
  Fn_sendEventComSb("setEnemyForDemo", "enmgen2_com_02")
  _is_in_enemy_area = false
  print("\229\133\181\229\163\171\227\131\158\227\131\188\227\130\171\227\131\188\233\157\158\232\161\168\231\164\186")
end
function pccubesensor2_enemy_change_01_OnEnter()
  for _FORV_3_, _FORV_4_ in pairs(_enmgen_tbl) do
    _FORV_4_.enmgen:requestIdlingEnemy(false)
    _FORV_4_.enmgen:setEnemyMarker(true)
  end
  Fn_sendEventComSb("setEnemyForBattle", "enmgen2_com_01")
  Fn_sendEventComSb("setEnemyForBattle", "enmgen2_com_02")
  _is_in_enemy_area = true
  print("\229\133\181\229\163\171\227\131\158\227\131\188\227\130\171\227\131\188\239\188\154\232\161\168\231\164\186")
end
function pccubesensor2_find_recipient_cap_01_OnEnter()
  if _mission_data.now_retry == false then
    _is_in_find_recipient_area = true
    stop_create_enemy_gem()
  end
end
function pccubesensor2_find_recipient_cap_01_OnLeave()
  local L0_23, L1_24
  _is_in_find_recipient_area = false
end
function boxGrab(A0_25)
  Fn_pcSensorOff("bag_caption_sensor")
  Fn_tutorialCaptionKill()
  if A0_25 then
    Fn_naviKill()
    if _recipient_navi_start then
      Fn_naviSet(_puppet_tbl.recipient_01)
    end
    _mission_data.is_box_navi_setted = false
  end
  if _step_state == STEP.BEFORE_FIRST_GRAB then
    _step_state = STEP.FIRST_GRAB
  end
end
function retry()
  Mv_sceneSwitchFade(function()
    retryCommon()
    Fn_resetPcPos("locator2_pc_start_pos")
    createBoxSensorNavi("locator2_bag_c_01", false)
    _ship_hdl:appendChild(_mission_data.bag_hdl, true)
    _is_in_enemy_area = true
    _recipient_navi_start = false
    _is_in_find_recipient_area = false
    _step_state = STEP.BEFORE_FIRST_GRAB
    for _FORV_3_, _FORV_4_ in pairs(_enmgen_tbl) do
      _FORV_4_.enmgen:requestAllEnemyKill()
      _FORV_4_.enmgen:requestSpawn()
    end
    Fn_sendEventComSb("resetEnemy", "enmgen2_com_01")
    Fn_sendEventComSb("resetEnemy", "enmgen2_com_02")
    while Fn_sendEventComSb("isEnemySpawned", "enmgen2_com_01") == false do
      wait()
    end
    while Fn_sendEventComSb("isEnemySpawned", "enmgen2_com_02") == false do
      wait()
    end
    Fn_sendEventComSb("setEnemyForBattle", "enmgen2_com_01")
    Fn_sendEventComSb("setEnemyForBattle", "enmgen2_com_02")
    mobToPanic(true)
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    appendedSensorOn()
    waitSeconds(2)
  end)
  Fn_userCtrlOn()
  _mission_data.now_retry = false
end
function catwarpRetry()
  retryCommon()
  Fn_resetPcPos("locator2_pc_start_pos")
  catwarp_flg = false
  createBoxSensorNavi("locator2_bag_c_01", false)
  appendedSensorOn()
  waitSeconds(2)
  Fn_userCtrlOn()
  _recipient_navi_start = true
  _step_state = STEP.FIRST_GRAB
  mobToPanic(true)
  _mission_data.now_retry = false
  _is_dist_catwarp = false
end
