dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm49_common.lua")
NEAR_VALUE_PHOTO_01 = 2
FAR_VALUE_PHOTO_01 = 60
NEAR_VALUE_PHOTO_02 = 5
FAR_VALUE_PHOTO_02 = 80
MISSION_ENEMY_MAX = 4
GEM_NODES = {
  "locator2_gem_b_01",
  "locator2_gem_b_02",
  "locator2_gem_b_03",
  "locator2_gem_b_04",
  "locator2_gem_b_05",
  "locator2_gem_b_06",
  "locator2_gem_b_07"
}
ENERGY_GEM_NODES = {
  "locator2_energy_01",
  "locator2_energy_02",
  "locator2_energy_03"
}
MISSION_RESULT = {
  NONE = nil,
  SUCCESS = 0,
  FARTHER = 1,
  NEARER = 2,
  MISSING = 3,
  ENEMY_ONE = 4,
  ENEMY_TWO = 5,
  ENEMY_THREE = 6
}
PHOTO_TARGET_TBL_01 = {
  {
    NAME = "sm49_enemy_01",
    TYPE = "imp",
    JOINT = "bn_c03_chest"
  },
  {
    NAME = "sm49_enemy_02",
    TYPE = "imp",
    JOINT = "bn_c03_chest"
  }
}
PHOTO_TARGET_TBL_02 = {
  {
    NAME = "sm49_enemy_01",
    TYPE = "imp",
    JOINT = "bn_c03_chest"
  },
  {
    NAME = "sm49_enemy_02",
    TYPE = "imp",
    JOINT = "bn_c03_chest"
  },
  {
    NAME = "sm49_enemy_03",
    TYPE = "imp",
    JOINT = "bn_c03_chest"
  },
  {
    NAME = "sm49_enemy_04",
    TYPE = "imp",
    JOINT = "bn_c03_chest"
  }
}
_dead_enemy_cnt = 0
_is_enemy_kill = false
_is_photo_area_distant = false
_dead_enemy_name = nil
_gesture_phase = 0
PHASE00 = 0
PHASE01 = 1
PHASE02 = 2
PHASE03 = 3
_start_point = true
_is_farther = nil
enmgen2_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "sm49_enemy_01",
      type = "imp",
      locator = "locator_enemy_b_01"
    },
    {
      name = "sm49_enemy_02",
      type = "imp",
      locator = "locator_enemy_b_02"
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
    print("\230\173\187\227\130\147\227\129\160")
  end,
  onObjectAsh = function(A0_8, A1_9)
    _dead_enemy_cnt = _dead_enemy_cnt + 1
    _is_enemy_kill = true
  end
}
enmgen2_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "sm49_enemy_03",
      type = "imp",
      locator = "locator_enemy_b_03"
    },
    {
      name = "sm49_enemy_04",
      type = "imp",
      locator = "locator_enemy_b_04"
    }
  },
  onUpdate = function(A0_10)
    local L1_11
  end,
  onEnter = function(A0_12)
    local L1_13
  end,
  onLeave = function(A0_14)
    local L1_15
  end,
  onObjectDead = function(A0_16, A1_17)
  end,
  onObjectAsh = function(A0_18, A1_19)
    _dead_enemy_cnt = _dead_enemy_cnt + 1
    _is_enemy_kill = true
  end
}
function Initialize()
  _client_hdl = Fn_findNpc("sm49_client")
  _client_puppet_hdl = Fn_findNpcPuppet("sm49_client")
  _mot_list = {
    watching_soft_00 = "man01_watching_soft_00"
  }
  Fn_loadNpcEventMotion("sm49_client", _mot_list)
  _sdemo_cut01 = SDemo.create("sm49_cut_b_01")
  Fn_pcSensorOff("pccubesensor2_client_b")
end
function Ingame()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30
  L0_20 = Fn_userCtrlAllOff
  L0_20()
  L0_20 = {}
  L1_21 = getCreatedGemHandleTable
  L2_22 = GEM_NODES
  L3_23 = L0_20
  L4_24 = 5
  L1_21(L2_22, L3_23, L4_24)
  L1_21 = {}
  L2_22 = getCreatedGemHandleTable
  L3_23 = ENERGY_GEM_NODES
  L4_24 = L1_21
  L5_25 = 4
  L2_22(L3_23, L4_24, L5_25)
  L2_22, L3_23 = nil, nil
  L4_24 = createEnemy
  L5_25 = "enmgen2_b_01"
  L6_26 = false
  L7_27 = false
  L4_24 = L4_24(L5_25, L6_26, L7_27)
  L2_22 = L4_24
  L4_24 = Fn_missionStart
  L4_24()
  L4_24 = Fn_setCatWarpCheckPoint
  L5_25 = "locator2_pc_start_pos"
  L4_24(L5_25)
  L4_24 = PHASE00
  _gesture_phase = L4_24
  L4_24 = Mob
  L5_25 = L4_24
  L4_24 = L4_24.makeSituationPanic
  L6_26 = true
  L4_24(L5_25, L6_26)
  L4_24 = waitSeconds
  L5_25 = 0.5
  L4_24(L5_25)
  L4_24 = Fn_turnNpc
  L5_25 = "sm49_client"
  L6_26 = "locator2_enemy_in_sight_view_01"
  L4_24(L5_25, L6_26)
  L4_24 = invokeTask
  function L5_25()
    Fn_playMotionNpc("sm49_client", "inform_ex_in_00", true)
    Fn_playMotionNpc("sm49_client", "inform_ex_00", true)
    Fn_playMotionNpc("sm49_client", "inform_ex_out_00", true)
    Fn_playMotionNpc("sm49_client", _mot_list.watching_soft_00, false, {animBlendDuration = 0.3})
  end
  L4_24(L5_25)
  L4_24 = Mv_viewObj
  L5_25 = "locator2_enemy_in_sight_view_01"
  L6_26 = 0.3
  L4_24 = L4_24(L5_25, L6_26)
  L5_25 = waitSeconds
  L6_26 = 0.5
  L5_25(L6_26)
  L5_25 = findGameObject2
  L6_26 = "Node"
  L7_27 = "locator2_enemy_in_sight_view_01"
  L5_25 = L5_25(L6_26, L7_27)
  L6_26 = L5_25
  L5_25 = L5_25.getWorldPos
  L5_25 = L5_25(L6_26)
  L6_26 = Player
  L7_27 = L6_26
  L6_26 = L6_26.setLookAtIk
  L8_28 = true
  L9_29 = 1
  L6_26(L7_27, L8_28, L9_29, L10_30)
  L6_26 = waitSeconds
  L7_27 = 3
  L6_26(L7_27)
  L6_26 = Fn_kaiwaDemoView
  L7_27 = "sm49_00250k"
  L6_26(L7_27)
  L6_26 = Fn_playMotionNpc
  L7_27 = "sm49_client"
  L8_28 = "stay"
  L9_29 = false
  L6_26(L7_27, L8_28, L9_29)
  L6_26 = Player
  L7_27 = L6_26
  L6_26 = L6_26.setLookAtIk
  L8_28 = false
  L9_29 = 1
  L6_26(L7_27, L8_28, L9_29, L10_30)
  L6_26 = Mv_safeTaskAbort
  L7_27 = L4_24
  L6_26 = L6_26(L7_27)
  L4_24 = L6_26
  L6_26 = Fn_userCtrlOn
  L6_26()
  L7_27 = L2_22
  L6_26 = L2_22.setEnemyMarker
  L8_28 = true
  L6_26(L7_27, L8_28)
  L7_27 = L2_22
  L6_26 = L2_22.requestIdlingEnemy
  L8_28 = false
  L6_26(L7_27, L8_28)
  L6_26 = Mv_viewObj
  L7_27 = "locator2_enemy_in_sight_view_01"
  L8_28 = 0.3
  L6_26 = L6_26(L7_27, L8_28)
  L7_27 = Fn_captionViewWait
  L8_28 = "sm49_01000"
  L7_27(L8_28)
  L7_27 = Fn_missionView
  L8_28 = "sm49_01029"
  L7_27(L8_28)
  L7_27 = waitSeconds
  L8_28 = 1.3
  L7_27(L8_28)
  L7_27 = Fn_captionViewWait
  L8_28 = "sm49_01030"
  L7_27(L8_28)
  L7_27 = Mv_safeTaskAbort
  L8_28 = L6_26
  L7_27 = L7_27(L8_28)
  L6_26 = L7_27
  L7_27 = PHOTO_MISSION
  L7_27 = L7_27.TWO_FLY_ENEMIES
  _photo_mission_state = L7_27
  L7_27 = {
    [4] = L8_28(L9_29)
  }
  L8_28 = unpack
  L9_29 = PHOTO_TARGET_TBL_01
  L9_29 = L8_28(L9_29)
  ;({
    [4] = L8_28(L9_29)
  })[1] = L8_28
  ;({
    [4] = L8_28(L9_29)
  })[2] = L9_29
  ;({
    [4] = L8_28(L9_29)
  })[3] = L10_30
  _photo_target_tbl = L7_27
  L7_27, L8_28 = nil, nil
  L9_29 = false
  L10_30()
  L7_27 = L10_30
  L8_28 = L10_30
  for _FORV_13_, _FORV_14_ in L10_30(_photo_target_tbl) do
    _enemy_hdl_tbl[_FORV_14_.NAME] = findGameObject2("Node", _FORV_14_.NAME)
  end
  L10_30(L7_27)
  L10_30(function()
    local L0_31
    while true do
      L0_31 = _photo_mission_state
      if L0_31 ~= PHOTO_MISSION.COMPLETE then
        L0_31 = _is_enemy_kill
        if L0_31 then
          L0_31 = Mv_safeObjectKill
          L0_31 = L0_31(L7_27)
          L7_27 = L0_31
          L0_31 = Mv_safeObjectKill
          L0_31 = L0_31(L8_28)
          L8_28 = L0_31
          L0_31 = Fn_captionViewWait
          L0_31("sm49_01006")
          function L0_31()
            local L0_32
            if L0_32 then
              L0_32(L0_32, false)
            end
            if L0_32 == PHOTO_MISSION.TWO_FLY_ENEMIES then
              L2_22 = L0_32
              L0_32(L0_32)
            elseif L0_32 == PHOTO_MISSION.FOUR_FLY_ENEMIES then
              L2_22 = L0_32
              L0_32(L0_32)
              L3_23 = L0_32
              L0_32(L0_32)
            end
            L2_22 = L0_32
            if L0_32 == PHOTO_MISSION.TWO_FLY_ENEMIES then
              _photo_target_tbl = L0_32
            else
              L3_23 = L0_32
              _photo_target_tbl = L0_32
            end
            L7_27 = L0_32
            L8_28 = L0_32
            for _FORV_3_, _FORV_4_ in L0_32(_photo_target_tbl) do
              _enemy_hdl_tbl[_FORV_4_.NAME] = findGameObject2("Puppet", _FORV_4_.NAME)
            end
            if L0_32 == PHOTO_MISSION.TWO_FLY_ENEMIES then
              L0_32(L7_27)
            else
              L0_32(L8_28)
            end
            L0_32(L0_20)
            L0_32(GEM_NODES, L0_20, 5)
            L0_32(L1_21)
            L0_32(ENERGY_GEM_NODES, L1_21, 4)
            Player:setEnergy(Player.kEnergy_Life, L0_32)
          end
          Fn_sceneConversion("locator2_pc_reset_pos_b_01", L0_31)
          L2_22:requestIdlingEnemy(false)
          if _photo_mission_state == PHOTO_MISSION.TWO_FLY_ENEMIES then
            Fn_captionViewWait("sm49_01033")
          elseif _photo_mission_state == PHOTO_MISSION.FOUR_FLY_ENEMIES then
            L3_23:requestIdlingEnemy(false)
            Fn_captionViewWait("sm49_01034")
          end
          _dead_enemy_cnt = 0
          _is_enemy_kill = false
        end
        L0_31 = wait
        L0_31()
      end
    end
  end)
  while true do
    if L10_30 ~= PHOTO_MISSION.COMPLETE then
      while true do
        if not L9_29 then
        end
        if L10_30 then
          L10_30()
        end
      end
      if L10_30 == PHOTO_MISSION.TWO_FLY_ENEMIES then
        L10_30(L7_27)
        while L7_27 ~= nil do
          if not L10_30 then
            L10_30()
          end
        end
        L10_30("\227\131\149\227\130\169\227\131\136\227\131\171\227\131\188\227\131\151\230\138\156\227\129\145\227\129\159")
        if not _start_point then
          if L10_30 == MISSION_RESULT.SUCCESS then
            Sound:pulse("success")
            L7_27 = Mv_safeObjectKill(L7_27)
            _photo_mission_state = PHOTO_MISSION.FOUR_FLY_ENEMIES
            Fn_captionViewWait("sm49_01014")
            _gesture_phase = PHASE01
            L3_23 = createEnemy("enmgen2_b_02", true, true)
            _photo_target_tbl = {
              unpack(PHOTO_TARGET_TBL_02)
            }
            for _FORV_14_, _FORV_15_ in pairs(_photo_target_tbl) do
              _enemy_hdl_tbl[_FORV_15_.NAME] = findGameObject2("Node", _FORV_15_.NAME)
            end
            setPhotoTarget(L8_28)
            Fn_captionViewWait("sm49_01035")
            Fn_missionViewWait("sm49_01036")
          elseif L10_30 == MISSION_RESULT.MISSING then
            Fn_captionView("sm49_01009")
          elseif L10_30 == MISSION_RESULT.ENEMY_ONE then
            if _is_farther ~= nil then
              Fn_captionView("sm49_01038")
            else
              Fn_captionView("sm49_01012")
            end
          elseif L10_30 == MISSION_RESULT.FARTHER then
            Fn_captionView("sm49_01010")
          elseif L10_30 == MISSION_RESULT.NEARER then
            Fn_captionView("sm49_01011")
          end
        elseif not _is_enemy_kill then
          Fn_captionView("sm49_01010")
        end
      elseif L10_30 == PHOTO_MISSION.FOUR_FLY_ENEMIES then
        L10_30(L8_28)
        while L8_28 ~= nil do
          if not L10_30 then
            L10_30()
          end
        end
        L10_30("\227\131\149\227\130\169\227\131\136\227\131\171\227\131\188\227\131\151\230\138\156\227\129\145\227\129\159")
        if L10_30 == MISSION_RESULT.SUCCESS then
          Sound:pulse("success")
          L8_28 = Mv_safeObjectKill(L8_28)
          _photo_mission_state = PHOTO_MISSION.COMPLETE
          Fn_captionViewWait("sm49_01020")
        elseif L10_30 == MISSION_RESULT.MISSING then
          Fn_captionView("sm49_01009")
        elseif L10_30 == MISSION_RESULT.ENEMY_THREE then
          Fn_captionView("sm49_01037")
        elseif L10_30 == MISSION_RESULT.ENEMY_TWO then
          Fn_captionView("sm49_01022")
        elseif L10_30 == MISSION_RESULT.ENEMY_ONE then
          Fn_captionView("sm49_01021")
        elseif L10_30 == MISSION_RESULT.FARTHER then
          Fn_captionView("sm49_01010")
        elseif L10_30 == MISSION_RESULT.NEARER then
          Fn_captionView("sm49_01011")
        end
      end
      L10_30()
    end
  end
  L10_30("\230\146\174\229\189\177\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\229\174\140\228\186\134")
  _gesture_phase = L10_30
  L10_30("sm49_01025")
  L10_30("sm49_00128")
  while true do
    if L10_30 ~= MISSION_ENEMY_MAX then
      L10_30()
    end
  end
  _gesture_phase = L10_30
  L10_30("locator2_catwarp_battle_end_02")
  L10_30(L10_30, false)
  L10_30(1)
  L10_30("sm49_00125")
  L10_30(1.3)
  L10_30(_client_puppet_hdl)
  Fn_pcSensorOn("pccubesensor2_client_b")
  waitSeconds(2.5)
  Fn_captionViewWait("sm49_01027")
  while true do
    if not Mv_isWaitPhase() and Player:getAction() == Player.kAction_Idle then
      Fn_naviKill()
      Fn_pcSensorOff("pccubesensor2_client_b")
      break
    end
    wait()
  end
  Mv_resetWaitPhase()
  Fn_userCtrlAllOff()
  Fn_turnNpc("sm49_client")
  waitSeconds(1)
  Fn_kaiwaDemoView("sm49_00300k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function createEnemy(A0_33, A1_34, A2_35)
  local L3_36
  L3_36 = nil
  L3_36 = findGameObject2("EnemyGenerator", A0_33)
  if L3_36 ~= nil then
    L3_36:setEnemyMarker(A1_34)
    L3_36:requestSpawn()
    while not L3_36:isPrepared() do
      print("\230\186\150\229\130\153\228\184\173")
      wait()
    end
    print("\231\181\130\227\130\143\227\129\163\227\129\159")
    L3_36:requestIdlingEnemy(not A2_35)
  end
  return L3_36
end
function checkPhotoResult(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47
  if A0_37 == nil then
    L1_38 = MISSION_RESULT
    L1_38 = L1_38.NONE
    return L1_38
  end
  L2_39 = A0_37
  L1_38 = A0_37.getPhotoState
  L1_38 = L1_38(L2_39)
  L2_39 = type
  L2_39 = L2_39(L3_40)
  if L2_39 ~= "table" then
    L2_39 = type
    L2_39 = L2_39(L3_40)
    if L2_39 == "number" then
      L2_39 = MISSION_RESULT
      L2_39 = L2_39.MISSING
      return L2_39
    end
    L2_39 = MISSION_RESULT
    L2_39 = L2_39.NONE
    return L2_39
  end
  L2_39 = 0
  _is_farther = nil
  for L6_43 = 1, #L1_38 do
    for L10_47, _FORV_11_ in L7_44(L8_45) do
      print("\227\130\171\227\131\161\227\131\169\227\129\171\229\134\153\227\129\163\227\129\159\233\187\146\232\159\178\239\188\154" .. L6_43, "\t\239\188\154\t", L1_38[L6_43].target:getName())
      print("\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\227\130\187\227\131\131\227\131\136\227\129\151\227\129\159\233\187\146\232\159\178\239\188\154" .. L10_47, "\239\188\154\t", _enemy_hdl_tbl[_FORV_11_.NAME]:getName())
      if L1_38[L6_43].target == _enemy_hdl_tbl[_FORV_11_.NAME] then
        print("\233\187\146\232\159\178\239\188\154\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\228\184\128\232\135\180\239\188\129\n")
        if L1_38[L6_43].state == kPHOTO_FAR then
          _is_farther = true
        elseif L1_38[L6_43].state == kPHOTO_NEAR then
          _is_farther = false
        else
          L2_39 = L2_39 + 1
        end
      else
        print("\233\187\146\232\159\178\239\188\154\228\184\128\232\135\180\227\129\151\227\129\166\227\129\170\227\129\132\n")
      end
    end
  end
  if L2_39 < L3_40 then
    if L2_39 == 3 then
      return L3_40
    elseif L2_39 == 2 then
      return L3_40
    elseif L2_39 == 1 then
      return L3_40
    elseif L3_40 then
      return L3_40
    else
      return L3_40
    end
  end
  return L3_40
end
function pccubesensor2_start_point_01_OnEnter()
  local L0_48, L1_49
  _start_point = true
end
function pccubesensor2_start_point_01_OnLeave()
  local L0_50, L1_51
  _start_point = false
end
function pccubesensor2_warning_area_02_OnLeave()
  _is_photo_area_distant = true
  Player:setStay(true, false)
  if _gesture_phase == PHASE00 then
    Fn_captionView("sm49_01031")
  elseif _gesture_phase == PHASE01 then
    Fn_captionView("sm49_01032")
  elseif _gesture_phase == PHASE02 then
    Fn_captionView("sm49_00104")
  elseif _gesture_phase == PHASE03 then
    Fn_captionView("sm49_09001")
  end
  Player:setStay(false)
end
function pccubesensor2_warning_area_02_OnEnter()
  local L0_52, L1_53
  _is_photo_area_distant = false
end
function pccubesensor2_over_area_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_client_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_client_OnLeave()
  Mv_resetWaitPhase()
end
