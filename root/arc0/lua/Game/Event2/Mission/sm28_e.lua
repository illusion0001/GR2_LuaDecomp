dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
puppets = {}
puppet_task = {}
_sm28_search = false
_sm28_battle_out_task = nil
_sm28_cage = false
_sm28_transceiver_obj = nil
_detect_se_handle = nil
_SM28_SEARCH_FIND1 = 13
_SM28_SEARCH_FIND2 = 10
_SENSOR_SE_TABLE = {
  {
    dis = 30,
    se = "ep16_becon_react_l",
    vol = 1
  },
  {
    dis = 60,
    se = "ep16_becon_react_m",
    vol = 1
  },
  {
    dis = 120,
    se = "ep16_becon_react_s",
    vol = 1
  }
}
_sm28_obj_talk = {
  "sm28_00311k",
  "sm28_00312k",
  "sm28_00313k",
  "sm28_00314k",
  "sm28_00315k",
  "sm28_00316k"
}
_sm28_obj_checked = {}
enmgen2_search01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_search_01",
      name = "search_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_search_02",
      name = "search_02"
    },
    {
      type = "guardcore_strong",
      locator = "locator_search_04",
      name = "search_04"
    },
    {
      type = "guardcore_strong",
      locator = "locator_search_05",
      name = "search_05"
    }
  },
  totalAshCount = 0,
  onSpawn = function(A0_0, A1_1)
    print(A0_0:getName() .. ":onSpawn(" .. A1_1:getName() .. ")")
    A0_0:getSpecTable().totalAshCount = 0
  end,
  onObjectAsh = function(A0_2, A1_3)
    A0_2:getSpecTable().totalAshCount = A0_2:getSpecTable().totalAshCount + 1
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {
      A0_4:getSpecTable().spawnSet[3].name,
      A0_4:getSpecTable().spawnSet[4].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end,
  isEnemyAllAsh = function(A0_8)
    local L2_9
    L2_9 = A0_8.totalAshCount
    if L2_9 >= #A0_8.spawnSet then
      L2_9 = true
      return L2_9
    end
    L2_9 = false
    return L2_9
  end
}
enmgen2_search02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "defender_strong",
      locator = "locator_search_06",
      name = "search_06"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_search_07",
      name = "search_07"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_search_08",
      name = "search_08"
    },
    {
      type = "runner_strong",
      locator = "locator_search_09",
      name = "search_09"
    }
  },
  onSetupGem = function(A0_10, A1_11)
    Fn_enemyPopGemSetup(A0_10, {
      A0_10:getSpecTable().spawnSet[4].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_12, A1_13)
    Fn_enemyAshPopGem(A0_12, A1_13)
  end
}
function Initialize()
  puppets.man73 = Fn_findNpcPuppet("man73")
  Fn_setNpcActive("man73", false)
  _sm28_transceiver_obj = RAC_createGimmickBg("transceiver", "citransceiver01_base", "locator2_search", true)
end
function Ingame()
  local L0_14, L1_15, L2_16, L3_17
  L0_14()
  L0_14(L1_15)
  L0_14()
  L0_14(L1_15, L2_16)
  L0_14()
  L0_14(L1_15)
  _sm28_obj_checked = L0_14
  for L3_17 = 1, #L1_15 do
    _sm28_obj_checked[L3_17] = Fn_sendEventComSb("sm28_isObjectTalked", L3_17)
  end
  L0_14(L1_15)
  L0_14(L1_15, L2_16)
  L0_14()
  L0_14(L1_15)
  L0_14()
  L0_14(L1_15, L2_16)
  L0_14()
  L0_14()
  L0_14(L1_15)
  L0_14()
  L0_14(L1_15)
  L3_17 = {"kit_596", 100}
  L0_14(L1_15, L2_16)
  L0_14(L1_15)
  L0_14()
  L0_14()
  L0_14(L1_15)
  L0_14(L1_15)
  while true do
    if L0_14 ~= L1_15 then
      L0_14()
    end
  end
  L0_14(L1_15, L2_16)
  L0_14(L1_15)
  L0_14()
  L0_14()
  L0_14()
  L0_14(L1_15)
  L0_14()
  L3_17 = "locator2_cage"
  L3_17 = "Node"
  L3_17 = L0_14.appendChild
  L3_17(L0_14, L1_15, true)
  L3_17 = L1_15.setPos
  L3_17(L1_15, Vector(0.5, -4.5, 0))
  L3_17 = L0_14.appendChild
  L3_17(L0_14, L2_16, true)
  L3_17 = L2_16.setPos
  L3_17(L2_16, "locator2_cage")
  L3_17 = L2_16.setPos
  L3_17(L2_16, Vector(0.5, -4.5, 0))
  L3_17 = RAC_missionNaviCaption
  L3_17("sm28_04001", L1_15)
  L3_17 = invokeTask
  L3_17 = L3_17(function()
    while true do
      wait()
      ObjectTalk({
        true,
        false,
        false,
        true,
        true,
        true
      })
    end
  end)
  Fn_setCagePos(nil, false)
  Fn_setCageMarker(false)
  while not (Fn_getCageMoveDist() > 15) do
    wait()
  end
  Fn_blackout()
  if Fn_getCatBrain() ~= nil then
    Fn_getCatBrain():clearFollowPoint()
    Fn_getCatBrain():setModeRidingCage(false)
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  RAC_naviPochiNoneEnd()
  if _detect_se_handle ~= nil then
    Sound:stopSEHandle(_detect_se_handle)
    _detect_se_handle = nil
  end
  gaugeOff()
end
function spawn_Enemy()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27
  L0_18 = findGameObject2
  L1_19 = "EnemyGenerator"
  L2_20 = "enmgen2_search01"
  L0_18 = L0_18(L1_19, L2_20)
  L1_19 = findGameObject2
  L2_20 = "EnemyGenerator"
  L3_21 = "enmgen2_search02"
  L1_19 = L1_19(L2_20, L3_21)
  L3_21 = L0_18
  L2_20 = L0_18.requestSpawn
  L2_20(L3_21)
  L3_21 = L0_18
  L2_20 = L0_18.requestIdlingEnemy
  L4_22 = true
  L2_20(L3_21, L4_22)
  L3_21 = L0_18
  L2_20 = L0_18.setEnemyMarker
  L4_22 = false
  L2_20(L3_21, L4_22)
  L2_20 = Fn_sendEventComSb
  L3_21 = "sm28_setStopAreaWarp"
  L4_22 = true
  L2_20(L3_21, L4_22)
  L2_20 = RAC_startCatWarpControl
  L3_21 = "sm28_e_area_out"
  L4_22 = "pccubesensor2_battle_near"
  L8_26 = "locator2_battle_center"
  L9_27 = "locator2_battle_center"
  L2_20(L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, "sm28_04002")
  L2_20 = 1
  while true do
    L3_21 = "vital_gem_"
    L4_22 = string
    L4_22 = L4_22.format
    L4_22 = L4_22(L5_23, L6_24)
    L3_21 = L3_21 .. L4_22
    L4_22 = RAC_createGemAsync
    L8_26 = L3_21
    L4_22 = L4_22(L5_23, L6_24, L7_25)
    if L4_22 ~= nil then
      L2_20 = L2_20 + 1
    end
  end
  L2_20 = waitSeconds
  L3_21 = 1
  L2_20(L3_21)
  L2_20 = Player
  L3_21 = L2_20
  L2_20 = L2_20.playVoice
  L4_22 = {L5_23}
  L2_20(L3_21, L4_22)
  L2_20 = Fn_captionView
  L3_21 = "sm28_04003"
  L2_20(L3_21)
  L2_20 = {
    L3_21,
    L4_22,
    [8] = L5_23(L6_24, L7_25)
  }
  L3_21 = findGameObject2
  L4_22 = "Puppet"
  L3_21 = L3_21(L4_22, L5_23)
  L4_22 = findGameObject2
  L4_22 = L4_22(L5_23, L6_24)
  L9_27 = L5_23(L6_24, L7_25)
  ;({
    L3_21,
    L4_22,
    [8] = L5_23(L6_24, L7_25)
  })[3] = L5_23
  ;({
    L3_21,
    L4_22,
    [8] = L5_23(L6_24, L7_25)
  })[4] = L6_24
  ;({
    L3_21,
    L4_22,
    [8] = L5_23(L6_24, L7_25)
  })[5] = L7_25
  ;({
    L3_21,
    L4_22,
    [8] = L5_23(L6_24, L7_25)
  })[6] = L8_26
  ;({
    L3_21,
    L4_22,
    [8] = L5_23(L6_24, L7_25)
  })[7] = L9_27
  L3_21 = 1
  L4_22 = 0
  for L8_26, L9_27 in L5_23(L6_24) do
    if L4_22 < Fn_getDistanceToPlayer(L9_27) then
      L4_22, L3_21 = Fn_getDistanceToPlayer(L9_27), L8_26
    end
  end
  L8_26 = 0.1
  L5_23(L6_24, L7_25, L8_26)
  L2_20 = Fn_kaiwaDemoView
  L3_21 = "sm28_00515k"
  L2_20(L3_21)
  L3_21 = L0_18
  L2_20 = L0_18.requestIdlingEnemy
  L4_22 = false
  L2_20(L3_21, L4_22)
  L3_21 = L0_18
  L2_20 = L0_18.setEnemyMarker
  L4_22 = true
  L2_20(L3_21, L4_22)
  L2_20 = Fn_userCtrlOn
  L2_20()
  L2_20 = Fn_missionView
  L3_21 = "sm28_04004"
  L2_20(L3_21)
  L2_20 = Player
  L3_21 = L2_20
  L2_20 = L2_20.setTargetingPriority
  L4_22 = Player
  L4_22 = L4_22.kTargetingPrio_EnemyFirst
  L2_20(L3_21, L4_22)
  L2_20 = 1
  while true do
    if L2_20 == 1 then
      L4_22 = L0_18
      L3_21 = L0_18.getSpecTable
      L3_21 = L3_21(L4_22)
      L4_22 = L3_21
      L3_21 = L3_21.isEnemyAllAsh
      L3_21 = L3_21(L4_22)
      if not L3_21 then
        L4_22 = L0_18
        L3_21 = L0_18.getEnemyCount
        L3_21 = L3_21(L4_22)
      elseif L3_21 == 0 then
        L4_22 = L1_19
        L3_21 = L1_19.requestSpawn
        L3_21(L4_22)
        L4_22 = L1_19
        L3_21 = L1_19.requestIdlingEnemy
        L3_21(L4_22, L5_23)
        L3_21 = Player
        L4_22 = L3_21
        L3_21 = L3_21.playVoice
        L3_21(L4_22, L5_23)
        L3_21 = Fn_captionView
        L4_22 = "sm28_04005"
        L3_21(L4_22)
        L2_20 = 2
      end
    else
      L4_22 = L1_19
      L3_21 = L1_19.getEnemyCount
      L3_21 = L3_21(L4_22)
    end
    if L3_21 ~= 0 then
      L3_21 = wait
      L3_21()
    end
  end
  L3_21 = Player
  L4_22 = L3_21
  L3_21 = L3_21.setTargetingPriority
  L3_21(L4_22, L5_23)
  L3_21 = Fn_naviKill
  L3_21()
  L4_22 = L0_18
  L3_21 = L0_18.requestAllEnemyKill
  L3_21(L4_22)
  L4_22 = L1_19
  L3_21 = L1_19.requestAllEnemyKill
  L3_21(L4_22)
  L3_21 = waitSeconds
  L4_22 = 3
  L3_21(L4_22)
  while true do
    L3_21 = GameDatabase
    L4_22 = L3_21
    L3_21 = L3_21.get
    L3_21 = L3_21(L4_22, L5_23)
    if L3_21 then
      L3_21 = wait
      L3_21()
    end
  end
  L3_21 = RAC_endCatWarpControl
  L4_22 = "sm28_e_area_out"
  L3_21(L4_22)
  L3_21 = Fn_sendEventComSb
  L4_22 = "sm28_setStopAreaWarp"
  L3_21(L4_22, L5_23)
end
function look_for_loop(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38
  L1_29 = {
    L2_30,
    L3_31,
    L4_32,
    L5_33,
    L6_34
  }
  L2_30 = 1
  L3_31 = 0.73
  L4_32 = 0.46
  L5_33 = 0.33
  L6_34 = 0.22
  L2_30 = {
    L3_31,
    L4_32,
    L5_33,
    L6_34,
    L7_35
  }
  L3_31 = 10
  L4_32 = 20
  L5_33 = 40
  L6_34 = 60
  L7_35 = 80
  L3_31 = Fn_userCtrlOn
  L3_31()
  L3_31 = Fn_missionView
  L4_32 = "sm28_04006"
  L3_31(L4_32)
  L3_31 = gaugeInit
  L3_31()
  L3_31 = false
  L4_32 = false
  L5_33 = 0
  L6_34 = 0
  L7_35 = nil
  while true do
    L8_36 = nil
    if A0_28 == 1 then
      L9_37 = RAC_RaycastEyeSight
      L9_37 = L9_37(L10_38, _SM28_SEARCH_FIND1, 360, nil, 0.3)
      if not L9_37 then
        else
          L9_37 = RAC_RaycastEyeSight
          L9_37 = L9_37(L10_38, _SM28_SEARCH_FIND2, 90, nil, 0.3)
          if L9_37 then
            L9_37 = Fn_isInSightTarget
            L9_37 = L9_37(L10_38, 0.8)
          end
        end
        if not L9_37 then
          L9_37 = 0
          for _FORV_13_ = 1, #L1_29 do
            if Fn_isInSightTarget(_sm28_transceiver_obj, L1_29[_FORV_13_]) then
              L9_37 = _FORV_13_
            end
          end
          if L9_37 == L10_38 then
            L3_31 = true
          elseif L9_37 < 3 then
            L3_31 = false
          end
          if L3_31 then
            if not L4_32 then
              if L5_33 == 0 then
                Fn_captionView(L10_38[math.random(#L10_38)])
                L5_33 = 150
              end
              L10_38()
              L10_38(_sm28_transceiver_obj)
              L4_32 = true
            end
            L7_35 = L10_38
          else
            L10_38()
            L4_32 = false
          end
          if L9_37 > 0 then
            if L8_36 == nil or L8_36 > L7_35 then
              L8_36 = L7_35
            end
          end
          RAC_gaugeSetRate(RandI(L10_38, L10_38 + 20))
          L5_33 = math.max(L5_33 - 1, 0)
          L6_34 = 0
          if L8_36 ~= nil then
            for _FORV_15_, _FORV_16_ in ipairs(_SENSOR_SE_TABLE) do
              if L8_36 < _FORV_16_.dis then
                L6_34 = _FORV_15_
                if L6_34 ~= L6_34 then
                  if _detect_se_handle ~= nil then
                    Sound:stopSEHandle(_detect_se_handle)
                    _detect_se_handle = nil
                  end
                  _detect_se_handle = Sound:playSEHandle(_FORV_16_.se, _FORV_16_.vol)
                end
                break
              end
            end
          end
          if L6_34 == 0 and _detect_se_handle ~= nil then
            Sound:stopSEHandle(_detect_se_handle)
            _detect_se_handle = nil
          end
          ObjectTalk({
            true,
            false,
            true,
            true,
            true,
            true
          })
          wait()
        end
      end
  end
  L8_36 = Fn_naviKill
  L8_36()
  L8_36 = Fn_captionViewEnd
  L8_36()
  L8_36 = gaugeOff
  L8_36()
  L8_36 = _detect_se_handle
  if L8_36 ~= nil then
    L8_36 = Sound
    L9_37 = L8_36
    L8_36 = L8_36.stopSEHandle
    L8_36(L9_37, L10_38)
    _detect_se_handle = nil
  end
end
function pccubesensor2_search_OnEnter()
  local L0_39, L1_40
  _sm28_search = true
end
function pccubesensor2_search_OnLeave()
  local L0_41, L1_42
  _sm28_search = false
end
function pccubesensor2_cage_OnEnter()
  _sm28_cage = true
  Fn_naviKill()
end
function pccubesensor2_cage_OnLeave()
  local L0_43
  _sm28_cage = false
  L0_43 = Fn_naviSet
  L0_43(findGameObject2("Node", "locator2_cage"))
end
debug_draw = nil
function gaugeInit()
  RAC_gaugeInit("sm28_04011", HUD.kCountType_Up, 0.8)
  if debug_draw == nil then
    debug_draw = Debug:getSwitch({"Display", "Debug Draw"})
  end
  Debug:setSwitch({"Display", "Debug Draw"}, false)
end
function gaugeOff()
  HUD:miniGaugeSetVisible(false)
  if debug_draw ~= nil then
    Debug:setSwitch({"Display", "Debug Draw"}, debug_draw)
    debug_draw = nil
  end
end
function ObjectTalk(A0_44)
  local L1_45
  L1_45 = Fn_sendEventComSb
  L1_45 = L1_45("sm28_checkObjectTalk")
  if L1_45 ~= 0 and (A0_44 == nil or A0_44[L1_45]) and Player:getAction() == Player.kAction_Idle then
    Fn_kaiwaDemoView(_sm28_obj_talk[L1_45])
    Fn_sendEventComSb("sm28_setObjectTalked", L1_45)
  end
end
