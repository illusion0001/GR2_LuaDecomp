dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm49_common.lua")
NEAR_VALUE_PHOTO_01 = 3.5
FAR_VALUE_PHOTO_01 = 13
NEAR_VALUE_PHOTO_02 = 1.5
FAR_VALUE_PHOTO_02 = 13
PHOTO_TARGET_DEFAULT = {
  {
    NAME = "sm49_enemy_01",
    TYPE = "guardcore",
    JOINT = "bn_core01_01"
  }
}
GEM_NODES = {
  "locator2_gem_a_01",
  "locator2_gem_a_02",
  "locator2_gem_a_03"
}
PHOTO_MISSION_ROUTE = {
  NONE = nil,
  BREAK_SHELL = 1,
  DIFFERENT_ANGLE = 2
}
MISSION_RESULT = {
  NONE = nil,
  SUCCESS = 0,
  FARTHER = 1,
  NEARER = 2,
  MISSING = 3,
  NO_CORE = 4,
  NOT_BREAK = 5,
  RESEMBLE = 6
}
_enmgen = nil
_dead_enemy_cnt = 0
_dead_enemy_name = nil
_photo01_angle = nil
_is_photo_area_distant = false
_is_enemy_kill = false
_gesture_phase = 0
PHASE00 = 0
PHASE01 = 1
PHASE02 = 2
_photo_target_node = {}
enmgen2_a = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "sm49_enemy_01",
      type = "guardcore",
      locator = "locator_enemy_a_01"
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
  end,
  onObjectAsh = function(A0_8, A1_9)
    _dead_enemy_cnt = _dead_enemy_cnt + 1
    _dead_enemy_name = A1_9:getName()
    print("\230\173\187\227\130\147\227\129\160\233\187\146\232\159\178\227\129\174\229\144\141\229\137\141", _dead_enemy_name)
    _is_enemy_kill = true
  end,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = _dead_enemy_cnt
    return L1_12
  end,
  isEnemyAllDead = function(A0_13)
    local L2_14
    L2_14 = _dead_enemy_cnt
    L2_14 = L2_14 >= #A0_13.spawnSet
    return L2_14
  end
}
function Initialize()
  _client_puppet_hdl = Fn_findNpcPuppet("sm49_client")
  _mot_list = {
    watching_soft_00 = "man01_watching_soft_00"
  }
  Fn_loadNpcEventMotion("sm49_client", _mot_list)
  Fn_pcSensorOff("pccubesensor2_photo_point_a")
  Fn_pcSensorOff("pccubesensor2_client_a")
end
function Ingame()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25
  L0_15 = Fn_userCtrlAllOff
  L0_15()
  L0_15 = {}
  L1_16 = getCreatedGemHandleTable
  L2_17 = GEM_NODES
  L3_18 = L0_15
  L4_19 = 5
  L1_16(L2_17, L3_18, L4_19)
  L1_16 = Fn_missionStart
  L1_16()
  L1_16 = Fn_setCatWarpCheckPoint
  L2_17 = "locator2_pc_start_pos"
  L1_16(L2_17)
  L1_16 = PHASE00
  _gesture_phase = L1_16
  L1_16 = waitSeconds
  L2_17 = 1
  L1_16(L2_17)
  L1_16 = Fn_kaiwaDemoView
  L2_17 = "sm49_00100k"
  L1_16(L2_17)
  L1_16 = findGameObject2
  L2_17 = "EnemyGenerator"
  L3_18 = "enmgen2_a"
  L1_16 = L1_16(L2_17, L3_18)
  _enmgen = L1_16
  L1_16 = _enmgen
  if L1_16 ~= nil then
    L1_16 = _enmgen
    L2_17 = L1_16
    L1_16 = L1_16.setEnemyMarker
    L3_18 = false
    L1_16(L2_17, L3_18)
    L1_16 = _enmgen
    L2_17 = L1_16
    L1_16 = L1_16.requestSpawn
    L1_16(L2_17)
    while true do
      L1_16 = _enmgen
      L2_17 = L1_16
      L1_16 = L1_16.isSpawnOnStartFinished
      L1_16 = L1_16(L2_17)
      if L1_16 == false then
        L1_16 = wait
        L1_16()
      end
    end
    L1_16 = _enmgen
    L2_17 = L1_16
    L1_16 = L1_16.requestIdlingEnemy
    L3_18 = true
    L1_16(L2_17, L3_18)
  end
  L1_16 = Player
  L2_17 = L1_16
  L1_16 = L1_16.setSituation
  L3_18 = Player
  L3_18 = L3_18.kSituation_Normal
  L4_19 = true
  L5_20 = 0
  L6_21 = true
  L7_22 = false
  L1_16(L2_17, L3_18, L4_19, L5_20, L6_21, L7_22)
  L1_16 = Fn_turnNpc
  L2_17 = "sm49_client"
  L3_18 = "locator2_client_turn_view"
  L1_16(L2_17, L3_18)
  L1_16 = invokeTask
  function L2_17()
    Fn_playMotionNpc("sm49_client", "inform_ex_in_00", true)
    Fn_playMotionNpc("sm49_client", "inform_ex_00", true)
    Fn_playMotionNpc("sm49_client", "inform_ex_out_00", true)
    Fn_playMotionNpc("sm49_client", _mot_list.watching_soft_00, false, {animBlendDuration = 0.3})
  end
  L1_16(L2_17)
  L1_16 = Sound
  L2_17 = L1_16
  L1_16 = L1_16.playSE
  L3_18 = "m06_920a"
  L4_19 = 1
  L5_20 = ""
  L6_21 = _client_puppet_hdl
  L1_16(L2_17, L3_18, L4_19, L5_20, L6_21)
  L1_16 = Mv_viewObj
  L2_17 = "sm49_enemy_01"
  L3_18 = 0.5
  L1_16 = L1_16(L2_17, L3_18)
  L2_17 = Mob
  L3_18 = L2_17
  L2_17 = L2_17.makeSituationPanic
  L4_19 = true
  L2_17(L3_18, L4_19)
  L2_17 = waitSeconds
  L3_18 = 4
  L2_17(L3_18)
  L2_17 = findGameObject2
  L3_18 = "Node"
  L4_19 = "locator2_cam_a_01"
  L2_17 = L2_17(L3_18, L4_19)
  L3_18 = L2_17
  L2_17 = L2_17.getWorldPos
  L2_17 = L2_17(L3_18)
  L3_18 = Player
  L4_19 = L3_18
  L3_18 = L3_18.setLookAtIk
  L5_20 = true
  L6_21 = 1
  L7_22 = L2_17
  L3_18(L4_19, L5_20, L6_21, L7_22)
  L3_18 = Fn_kaiwaDemoView
  L4_19 = "sm49_00200k"
  L3_18(L4_19)
  L3_18 = Mv_safeTaskAbort
  L4_19 = L1_16
  L3_18 = L3_18(L4_19)
  L1_16 = L3_18
  L3_18 = wait
  L3_18()
  L3_18 = Player
  L4_19 = L3_18
  L3_18 = L3_18.setLookAtIk
  L5_20 = false
  L6_21 = 1
  L7_22 = L2_17
  L3_18(L4_19, L5_20, L6_21, L7_22)
  L3_18 = Player
  L4_19 = L3_18
  L3_18 = L3_18.setSituation
  L5_20 = Player
  L5_20 = L5_20.kSituation_InCombat
  L6_21 = true
  L7_22 = 3
  L8_23 = true
  L9_24 = false
  L3_18(L4_19, L5_20, L6_21, L7_22, L8_23, L9_24)
  L3_18 = Fn_userCtrlOn
  L3_18()
  L3_18 = _enmgen
  L4_19 = L3_18
  L3_18 = L3_18.setEnemyMarker
  L5_20 = true
  L3_18(L4_19, L5_20)
  L3_18 = Fn_pcSensorOn
  L4_19 = "pccubesensor2_photo_point_a"
  L3_18(L4_19)
  L3_18 = Fn_captionViewWait
  L4_19 = "sm49_00100"
  L3_18(L4_19)
  L3_18 = Fn_missionView
  L4_19 = "sm49_00126"
  L3_18(L4_19)
  L3_18 = waitSeconds
  L4_19 = 1.3
  L3_18(L4_19)
  L3_18 = PHOTO_MISSION
  L3_18 = L3_18.ONE_SHELL_ENEMY
  _photo_mission_state = L3_18
  L3_18 = {
    [8] = L4_19(L5_20)
  }
  L4_19 = unpack
  L5_20 = PHOTO_TARGET_DEFAULT
  L10_25 = L4_19(L5_20)
  ;({
    [8] = L4_19(L5_20)
  })[1] = L4_19
  ;({
    [8] = L4_19(L5_20)
  })[2] = L5_20
  ;({
    [8] = L4_19(L5_20)
  })[3] = L6_21
  ;({
    [8] = L4_19(L5_20)
  })[4] = L7_22
  ;({
    [8] = L4_19(L5_20)
  })[5] = L8_23
  ;({
    [8] = L4_19(L5_20)
  })[6] = L9_24
  ;({
    [8] = L4_19(L5_20)
  })[7] = L10_25
  _photo_target_tbl = L3_18
  L3_18 = false
  L4_19 = PHOTO_MISSION_ROUTE
  L4_19 = L4_19.NONE
  L5_20, L6_21 = nil, nil
  L7_22 = {}
  L8_23 = {}
  L9_24 = createPhotoInstance
  L10_25 = NEAR_VALUE_PHOTO_01
  L9_24 = L9_24(L10_25, FAR_VALUE_PHOTO_01, {
    left = -0.7,
    right = 0.7,
    top = -0.5,
    bottom = 0.5
  })
  L5_20 = L9_24
  L9_24 = createPhotoInstance
  L10_25 = NEAR_VALUE_PHOTO_02
  L9_24 = L9_24(L10_25, FAR_VALUE_PHOTO_02, {
    left = -0.7,
    right = 0.7,
    top = -0.5,
    bottom = 0.5
  }, "sm49_user_photo01")
  L6_21 = L9_24
  L9_24 = createEnemyHandle
  L10_25 = L7_22
  L9_24(L10_25, L8_23, "locator2_enemy_front_")
  L9_24 = setPhotoTarget
  L10_25 = L5_20
  L9_24(L10_25)
  L9_24 = invokeTask
  function L10_25()
    local L0_26
    while true do
      L0_26 = _photo_mission_state
      if L0_26 ~= PHOTO_MISSION.COMPLETE then
        L0_26 = enmgen2_a
        L0_26 = L0_26.isEnemyAllDead
        L0_26 = L0_26(L0_26)
        if L0_26 then
          L0_26 = print
          L0_26("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\230\149\181\227\129\140\229\133\168\230\187\133")
          L0_26 = true
          L3_18 = L0_26
          L0_26 = Mv_safeObjectKill
          L0_26 = L0_26(L5_20)
          L5_20 = L0_26
          L0_26 = Mv_safeObjectKill
          L0_26 = L0_26(L6_21)
          L6_21 = L0_26
          L0_26 = Fn_captionViewWait
          L0_26("sm49_00105")
          function L0_26()
            local L0_27
            if L0_27 then
              L0_27(L0_27, false)
            end
            _photo_target_tbl = L0_27
            L0_27(L0_27)
            for _FORV_3_ = 1, #_enemy_hdl_tbl do
              _enemy_hdl_tbl[_FORV_3_] = Mv_safeObjectKill(_enemy_hdl_tbl[_FORV_3_])
            end
            L0_27("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\174\229\134\141\231\148\159\230\136\144\233\150\139\229\167\139")
            L0_27(L0_27)
            while true do
              if L0_27 == false then
                L0_27()
              end
            end
            L0_27("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\174\229\134\141\231\148\159\230\136\144\231\181\130\228\186\134")
            L0_27(L0_27, true)
            _photo_mission_state = L0_27
            L5_20 = L0_27
            L6_21 = L0_27
            L0_27(L7_22, L8_23, "locator2_enemy_front_")
            L0_27(L5_20)
            L0_27(L0_15)
            L0_27(GEM_NODES, L0_15, 5)
            Player:setEnergy(Player.kEnergy_Life, L0_27)
          end
          Fn_sceneConversion("locator2_pc_start_pos", L0_26)
          _enmgen:requestIdlingEnemy(false)
          Fn_captionViewWait("sm49_00106")
          _dead_enemy_cnt = 0
          L3_18 = false
        end
        L0_26 = wait
        L0_26()
      end
    end
  end
  L9_24(L10_25)
  L9_24 = invokeTask
  function L10_25()
    local L0_28, L1_29, L2_30, L3_31
    while true do
      if L0_28 ~= L1_29 then
        if L0_28 then
          L0_28(L1_29)
          for L3_31, _FORV_4_ in L0_28(L1_29) do
            if _dead_enemy_name == _FORV_4_.NAME then
              print("\229\144\141\229\137\141\228\184\128\232\135\180", L3_31, _FORV_4_.NAME)
              table.remove(_photo_target_tbl, L3_31)
              table.remove(_enemy_hdl_tbl, L3_31)
            end
          end
          _is_enemy_kill = false
        end
        L0_28()
      end
    end
  end
  L9_24(L10_25)
  L9_24 = false
  L10_25 = invokeTask
  L10_25(function()
    while _photo_mission_state ~= PHOTO_MISSION.COMPLETE do
      while not L3_18 and _photo_mission_state ~= PHOTO_MISSION.COMPLETE do
        if L8_23.sm49_enemy_01:isPlayMotion("battlestay_end") or L8_23.sm49_enemy_01:isPlayMotion("stay") then
          L9_24 = false
        else
          L9_24 = true
        end
        wait()
      end
      wait()
    end
  end)
  while true do
    L10_25 = _photo_mission_state
    if L10_25 ~= PHOTO_MISSION.COMPLETE then
      while true do
        if not L3_18 then
          L10_25 = _is_enemy_kill
          L10_25 = L10_25 or _is_photo_area_distant
        end
        if L10_25 then
          L10_25 = wait
          L10_25()
        end
      end
      L10_25 = _photo_mission_state
      if L10_25 == PHOTO_MISSION.ONE_SHELL_ENEMY then
        L10_25 = L5_20.run
        L10_25(L5_20)
        while L5_20 ~= nil do
          L10_25 = L5_20.isRunning
          L10_25 = L10_25(L5_20)
          if L10_25 and not L3_18 then
            L10_25 = _is_photo_area_distant
          end
          if not L10_25 then
            L10_25 = wait
            L10_25()
          end
        end
        L10_25 = print
        L10_25("\227\131\149\227\130\169\227\131\136\227\131\171\227\131\188\227\131\151\230\138\156\227\129\145\227\129\159")
        L10_25 = L8_23.sm49_enemy_01
        L10_25 = L10_25.getArmorNum
        L10_25 = L10_25(L10_25)
        if checkPhotoResult(L5_20, L9_24, L10_25, L4_19) == MISSION_RESULT.SUCCESS then
          Sound:pulse("success")
          L5_20 = Mv_safeObjectKill(L5_20)
          _photo_mission_state = PHOTO_MISSION.ONE_SHELL_ENEMY_BREAK_OR_ANGLE
          setPhotoTarget(L6_21)
          Fn_captionViewWait("sm49_00109")
          if not L3_18 then
            if L10_25 > 0 then
              Fn_captionViewWait("sm49_00110")
              Fn_missionView("sm49_00111")
              L4_19 = PHOTO_MISSION_ROUTE.BREAK_SHELL
            else
              Fn_captionViewWait("sm49_00112")
              Fn_missionView("sm49_00113")
              L4_19 = PHOTO_MISSION_ROUTE.DIFFERENT_ANGLE
            end
          end
        elseif checkPhotoResult(L5_20, L9_24, L10_25, L4_19) == MISSION_RESULT.MISSING then
          Fn_captionView("sm49_00107")
        elseif checkPhotoResult(L5_20, L9_24, L10_25, L4_19) == MISSION_RESULT.NO_CORE then
          Fn_captionView("sm49_00117")
        elseif checkPhotoResult(L5_20, L9_24, L10_25, L4_19) == MISSION_RESULT.FARTHER then
          Fn_captionView("sm49_00118")
        elseif checkPhotoResult(L5_20, L9_24, L10_25, L4_19) == MISSION_RESULT.NEARER then
          Fn_captionView("sm49_00119")
        elseif checkPhotoResult(L5_20, L9_24, L10_25, L4_19) == MISSION_RESULT.RESEMBLE then
          Fn_captionView("sm49_00127")
        end
      else
        L10_25 = _photo_mission_state
        if L10_25 == PHOTO_MISSION.ONE_SHELL_ENEMY_BREAK_OR_ANGLE then
          L10_25 = L6_21.run
          L10_25(L6_21)
          while L6_21 ~= nil do
            L10_25 = L6_21.isRunning
            L10_25 = L10_25(L6_21)
            if L10_25 and not L3_18 then
              L10_25 = _is_photo_area_distant
            end
            if not L10_25 then
              L10_25 = wait
              L10_25()
            end
          end
          L10_25 = print
          L10_25("\227\131\149\227\130\169\227\131\136\227\131\171\227\131\188\227\131\151\230\138\156\227\129\145\227\129\159")
          L10_25 = L8_23.sm49_enemy_01
          L10_25 = L10_25.getArmorNum
          L10_25 = L10_25(L10_25)
          armor_num = L10_25
          L10_25 = checkPhotoResult
          L10_25 = L10_25(L6_21, L9_24, armor_num, L4_19)
          if L10_25 == MISSION_RESULT.SUCCESS then
            Sound:pulse("success")
            L6_21 = Mv_safeObjectKill(L6_21)
            _photo_mission_state = PHOTO_MISSION.COMPLETE
            Fn_captionViewWait("sm49_01020")
          elseif L10_25 == MISSION_RESULT.MISSING then
            Fn_captionView("sm49_00107")
          elseif L10_25 == MISSION_RESULT.NOT_BREAK then
            Fn_captionView("sm49_00120")
          elseif L10_25 == MISSION_RESULT.RESEMBLE then
            Fn_captionView("sm49_00121")
          elseif L10_25 == MISSION_RESULT.NO_CORE then
            Fn_captionView("sm49_00117")
          elseif L10_25 == MISSION_RESULT.FARTHER then
            Fn_captionView("sm49_00118")
          elseif L10_25 == MISSION_RESULT.NEARER then
            Fn_captionView("sm49_00119")
          end
        end
      end
      L10_25 = wait
      L10_25()
    end
  end
  L10_25 = print
  L10_25("\230\146\174\229\189\177\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\229\174\140\228\186\134")
  L10_25 = PHASE01
  _gesture_phase = L10_25
  L10_25 = Fn_captionViewWait
  L10_25("sm49_00122")
  L10_25 = Fn_missionView
  L10_25("sm49_00123")
  while true do
    L10_25 = enmgen2_a
    L10_25 = L10_25.isEnemyAllDead
    L10_25 = L10_25(L10_25)
    if not L10_25 then
      L10_25 = wait
      L10_25()
    end
  end
  L10_25 = Mv_gotoNextPhase
  L10_25()
  L10_25 = PHASE02
  _gesture_phase = L10_25
  L10_25 = Fn_setCatWarpCheckPoint
  L10_25("locator2_catwarp_battle_end_01")
  L10_25 = Mob
  L10_25 = L10_25.makeSituationPanic
  L10_25(L10_25, false)
  L10_25 = waitSeconds
  L10_25(1)
  L10_25 = Fn_missionView
  L10_25("sm49_00125")
  L10_25 = waitSeconds
  L10_25(1.3)
  L10_25 = Fn_naviSet
  L10_25(_client_puppet_hdl)
  L10_25 = Mv_viewObj
  L10_25 = L10_25(_client_puppet_hdl, 0.3)
  Fn_pcSensorOn("pccubesensor2_client_a")
  waitSeconds(2.5)
  Fn_captionViewWait("sm49_00124")
  L10_25 = Mv_safeTaskAbort(L10_25)
  Mv_resetWaitPhase()
  while true do
    if not Mv_isWaitPhase() and Player:getAction() == Player.kAction_Idle then
      Fn_naviKill()
      Fn_pcSensorOff("pccubesensor2_client_a")
      break
    end
    wait()
  end
  Mv_resetWaitPhase()
  Fn_userCtrlAllOff()
  Fn_turnNpc("sm49_client")
  Fn_missionViewEnd()
  waitSeconds(1)
  Fn_kaiwaDemoView("sm49_00230k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function createEnemyHandle(A0_32, A1_33, A2_34)
  local L3_35, L4_36, L5_37, L6_38
  for L6_38, _FORV_7_ in L3_35(L4_36) do
    A0_32[_FORV_7_.NAME] = findGameObject2("Puppet", _FORV_7_.NAME)
    A1_33[_FORV_7_.NAME] = A0_32[_FORV_7_.NAME]:getBrain()
  end
  for L6_38 = 1, 5 do
    _enemy_hdl_tbl[L6_38] = createGameObject2("Node")
    _enemy_hdl_tbl[L6_38]:setName(A2_34 .. string.format("%02d", L6_38))
    A0_32.sm49_enemy_01:appendChild(_enemy_hdl_tbl[L6_38])
    _enemy_hdl_tbl[L6_38]:try_init()
    _enemy_hdl_tbl[L6_38]:waitForReady()
    _enemy_hdl_tbl[L6_38]:try_start()
  end
  L6_38 = 0
  L6_38 = L5_37(L6_38, 1.5, 0.5)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 1.5, 0.5))
  L6_38 = 0
  L6_38 = L5_37(L6_38, 1.5, -0.5)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 1.5, -0.5))
  L6_38 = -0.5
  L6_38 = L5_37(L6_38, 1.5, 0)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 1.5, 0))
  L6_38 = 0.5
  L6_38 = L5_37(L6_38, 1.5, 0)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 1.5, 0))
  L6_38 = 0
  L6_38 = L5_37(L6_38, 2.5, 0)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 2.5, 0))
  L6_38 = 0
  L6_38 = L5_37(L6_38, 0.47, -0.88)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 0.47, -0.88))
  L6_38 = 0
  L6_38 = L5_37(L6_38, 180.47, -0.88)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 180.47, -0.88))
  L6_38 = 0
  L6_38 = L5_37(L6_38, -89.53, -0.88)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, -89.53, -0.88))
  L6_38 = 0
  L6_38 = L5_37(L6_38, 90.47, -0.88)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 90.47, -0.88))
  L6_38 = -90
  L6_38 = L5_37(L6_38, 0.47, -0.88)
  L3_35(L4_36, L5_37, L6_38, L5_37(L6_38, 0.47, -0.88))
  for L6_38 = 1, 5 do
    _enemy_hdl_tbl[L6_38]:setForceMove()
    print("X\229\186\167\230\168\153", _enemy_hdl_tbl[L6_38]:getPos())
    print("Y\229\186\167\230\168\153", _enemy_hdl_tbl[L6_38]:getRot())
  end
end
function checkPhotoResult(A0_39, A1_40, A2_41, A3_42)
  local L4_43
  if A0_39 == nil then
    L4_43 = MISSION_RESULT
    L4_43 = L4_43.NONE
    return L4_43
  end
  L4_43 = A0_39.getPhotoState
  L4_43 = L4_43(A0_39)
  if type(L4_43) ~= "table" then
    if type(L4_43) == "number" then
      return MISSION_RESULT.MISSING
    else
      return MISSION_RESULT.NONE
    end
  end
  if _photo_mission_state == PHOTO_MISSION.ONE_SHELL_ENEMY_BREAK_OR_ANGLE and A3_42 == PHOTO_MISSION_ROUTE.BREAK_SHELL and A2_41 > 0 then
    return MISSION_RESULT.NOT_BREAK
  end
  if not A1_40 then
    return MISSION_RESULT.NO_CORE
  end
  for _FORV_8_ = 1, #L4_43 do
    if L4_43[_FORV_8_].state == kPHOTO_OK then
      if A2_41 <= 0 then
        _enemy_hdl_tbl[_FORV_8_] = Mv_safeObjectKill(_enemy_hdl_tbl[_FORV_8_])
      end
      return MISSION_RESULT.SUCCESS
    end
  end
  for _FORV_8_ = 1, #L4_43 do
    if L4_43[_FORV_8_].state == kPHOTO_FAR then
      return MISSION_RESULT.FARTHER
    elseif L4_43[_FORV_8_].state == kPHOTO_NEAR then
      return MISSION_RESULT.NEARER
    elseif L4_43[_FORV_8_].state == kPHOTO_ANGLE or L4_43[_FORV_8_].state == kPHOTO_BACK then
      return MISSION_RESULT.SUCCESS
    else
      return MISSION_RESULT.RESEMBLE
    end
  end
end
function pccubesensor2_photo_point_a_OnEnter()
  _enmgen:requestIdlingEnemy(false)
  Fn_pcSensorOff("pccubesensor2_photo_point_a")
end
function pccubesensor2_warning_area_01_OnLeave()
  _is_photo_area_distant = true
  Player:setStay(true, false)
  if _gesture_phase == PHASE00 then
    Fn_captionView("sm49_00103")
  elseif _gesture_phase == PHASE01 then
    Fn_captionView("sm49_00104")
  elseif _gesture_phase == PHASE02 then
    Fn_captionView("sm49_09001")
  end
  Player:setStay(false)
end
function pccubesensor2_warning_area_01_OnEnter()
  local L0_44, L1_45
  _is_photo_area_distant = false
end
function pccubesensor2_over_area_01_OnLeave()
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
