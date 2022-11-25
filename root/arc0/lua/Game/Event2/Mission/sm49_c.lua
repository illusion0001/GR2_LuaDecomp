dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm49_common.lua")
NEAR_VALUE_PHOTO_01 = 5
FAR_VALUE_PHOTO_01 = 15
MISSION_ENEMY_MAX = 3
GEM_NODES = {
  "locator2_gem_c_01",
  "locator2_gem_c_02",
  "locator2_gem_c_03",
  "locator2_gem_c_04",
  "locator2_gem_c_05",
  "locator2_gem_c_06",
  "locator2_gem_c_07",
  "locator2_gem_c_08"
}
MISSION_RESULT = {
  NONE = nil,
  SUCCESS = 0,
  FARTHER = 1,
  NEARER = 2,
  MISSING = 3,
  ONLY_PC = 4,
  ONLY_ENEMY = 5,
  NOT_ATTACK = 6
}
PHOTO_TARGET_TBL = {
  {
    NAME = "sm49_enemy_01",
    TYPE = "stalker",
    JOINT = "bn_root"
  },
  {
    NAME = "sm49_enemy_02",
    TYPE = "stalker",
    JOINT = "bn_root"
  },
  {
    NAME = "sm49_enemy_03",
    TYPE = "guardcore",
    JOINT = "bn_root"
  }
}
_is_enemy_kill = false
_is_photo_area_distant = false
_gesture_phase = 0
PHASE00 = 0
PHASE01 = 1
function Initialize()
  Fn_userCtrlAllOff()
  _client_hdl = Fn_findNpc("sm49_client")
  _client_puppet_hdl = Fn_findNpcPuppet("sm49_client")
  _sdemo_cut01 = SDemo.create("sm49_cut_c_01")
  _sdemo_cut02 = SDemo.create("sm49_cut_c_02")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L0_0 = {}
  L1_1 = getCreatedGemHandleTable
  L2_2 = GEM_NODES
  L3_3 = L0_0
  L4_4 = 5
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = Fn_sendEventComSb
  L2_2 = "spawnEnemy"
  L1_1(L2_2)
  L1_1 = Fn_turnNpc
  L2_2 = "sm49_client"
  L3_3 = "locator2_view_point_c"
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_playMotionNpc
  L2_2 = "sm49_client"
  L3_3 = "surprise"
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Mv_viewObj
  L2_2 = "locator2_view_point_c"
  L3_3 = 0.15
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = findGameObject2
  L3_3 = "Node"
  L4_4 = "locator2_view_point_c"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = L2_2
  L2_2 = L2_2.getWorldPos
  L2_2 = L2_2(L3_3)
  L3_3 = Player
  L4_4 = L3_3
  L3_3 = L3_3.setLookAtIk
  L5_5 = true
  L6_6 = 1
  L7_7 = L2_2
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3 = waitSeconds
  L4_4 = 2.5
  L3_3(L4_4)
  L3_3 = Mv_safeTaskAbort
  L4_4 = L1_1
  L3_3 = L3_3(L4_4)
  L1_1 = L3_3
  L3_3 = Fn_kaiwaDemoView
  L4_4 = "sm49_00400k"
  L3_3(L4_4)
  L3_3 = Player
  L4_4 = L3_3
  L3_3 = L3_3.setLookAtIk
  L5_5 = false
  L6_6 = 1
  L7_7 = L2_2
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3 = Fn_setCatWarpCheckPoint
  L4_4 = "locator2_pc_start_pos"
  L3_3(L4_4)
  L3_3 = PHASE00
  _gesture_phase = L3_3
  L3_3 = Mob
  L4_4 = L3_3
  L3_3 = L3_3.makeSituationPanic
  L5_5 = true
  L3_3(L4_4, L5_5)
  L3_3 = {
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    "locator2_client_escape_move_06"
  }
  L4_4 = "locator2_client_escape_move_01"
  L5_5 = "locator2_client_escape_move_02"
  L6_6 = "locator2_client_escape_move_03"
  L7_7 = "locator2_client_escape_move_04"
  L8_8 = "locator2_client_escape_move_05"
  L4_4 = Fn_moveNpc
  L5_5 = "sm49_client"
  L6_6 = L3_3
  L7_7 = {}
  L7_7.anim_run_speed = 1
  L7_7.anim_speed_over = true
  L7_7.runLength = -1
  L7_7.recast = true
  L4_4 = L4_4(L5_5, L6_6, L7_7)
  client_move_task = L4_4
  L4_4 = invokeTask
  function L5_5()
    while not _client_hdl:isMoveEnd() do
      wait()
    end
    print("\230\150\176\232\129\158\232\168\152\232\128\133\239\188\154\229\136\176\231\157\128")
    client_move_task = Mv_safeTaskAbort(client_move_task)
    Fn_playMotionNpc("sm49_client", "scared_in_00", false)
    waitSeconds(0.6)
    Fn_playMotionNpc("sm49_client", "scared_00", false)
  end
  L4_4(L5_5)
  L4_4 = PHOTO_MISSION
  L4_4 = L4_4.ATTACK_ENEMY
  _photo_mission_state = L4_4
  L4_4 = false
  L5_5 = nil
  L6_6 = deleteEnemyHandleTable
  L6_6()
  L6_6 = createGameObject2
  L7_7 = "Node"
  L6_6 = L6_6(L7_7)
  L8_8 = L6_6
  L7_7 = L6_6.setName
  L7_7(L8_8, "locator2_kit")
  L8_8 = L6_6
  L7_7 = L6_6.try_init
  L7_7(L8_8)
  L8_8 = L6_6
  L7_7 = L6_6.waitForReady
  L7_7(L8_8)
  L8_8 = L6_6
  L7_7 = L6_6.try_start
  L7_7(L8_8)
  L7_7 = Fn_getPlayer
  L7_7 = L7_7()
  L8_8 = L7_7
  L7_7 = L7_7.appendChild
  L7_7(L8_8, L6_6)
  L8_8 = L6_6
  L7_7 = L6_6.setPos
  L7_7(L8_8, Vector(0, 1, 0))
  L8_8 = L6_6
  L7_7 = L6_6.setForceMove
  L7_7(L8_8)
  L7_7 = PHOTO_TARGET_TBL
  _photo_target_tbl = L7_7
  L7_7 = createPhotoInstance
  L8_8 = NEAR_VALUE_PHOTO_01
  L7_7 = L7_7(L8_8, FAR_VALUE_PHOTO_01, nil, "sm49_user_photo03")
  L5_5 = L7_7
  L7_7 = Fn_sendEventComSb
  L8_8 = "getEnemyHandleTable"
  L7_7 = L7_7(L8_8)
  _enemy_hdl_tbl = L7_7
  L7_7 = setPhotoTarget
  L8_8 = L5_5
  L7_7(L8_8, L6_6)
  L7_7 = Fn_userCtrlOn
  L7_7()
  L7_7 = Fn_sendEventComSb
  L8_8 = "activateEnemyAIMarker"
  L7_7(L8_8)
  L7_7 = Fn_captionViewWait
  L8_8 = "sm49_02000"
  L7_7(L8_8)
  L7_7 = Fn_missionView
  L8_8 = "sm49_02001"
  L7_7(L8_8)
  L7_7 = invokeTask
  function L8_8()
    local L0_9, L1_10
    function L0_9()
      local L0_11
      L0_11 = HUD
      L0_11 = L0_11.isPhotoMode
      L0_11 = L0_11(L0_11)
      if L0_11 then
        L0_11 = HUD
        L0_11 = L0_11.setPhotoMode
        L0_11(L0_11, false)
      end
      L0_11 = Fn_sendEventComSb
      L0_11("resetEnemySpawn")
      L0_11 = Fn_sendEventComSb
      L0_11("requestEnemyAllKill")
      L0_11 = Fn_sendEventComSb
      L0_11("spawnEnemy")
      while true do
        L0_11 = Fn_sendEventComSb
        L0_11 = L0_11("isEnemySpawnEnd")
        if not L0_11 then
          L0_11 = wait
          L0_11()
        end
      end
      L0_11 = deleteEnemyHandleTable
      L0_11()
      L0_11 = Fn_sendEventComSb
      L0_11("resetEnemyHandle")
      L0_11 = Fn_sendEventComSb
      L0_11 = L0_11("getEnemyHandleTable")
      _enemy_hdl_tbl = L0_11
      L0_11 = Mv_safeObjectKill
      L0_11 = L0_11(L5_5)
      L5_5 = L0_11
      L0_11 = createPhotoInstance
      L0_11 = L0_11(NEAR_VALUE_PHOTO_01, FAR_VALUE_PHOTO_01, nil, "sm49_user_photo03")
      L5_5 = L0_11
      L0_11 = setPhotoTarget
      L0_11(L5_5, L6_6)
      L0_11 = deleteGem
      L0_11(L0_0)
      L0_11 = getCreatedGemHandleTable
      L0_11(GEM_NODES, L0_0, 5)
      L0_11 = Player
      L0_11 = L0_11.getEnergyMax
      L0_11 = L0_11(L0_11, Player.kEnergy_Life)
      Player:setEnergy(Player.kEnergy_Life, L0_11)
    end
    function L1_10()
      Fn_sendEventComSb("activateEnemyAIMarker")
      Fn_captionViewWait("sm49_02004")
      Fn_sendEventComSb("resetEnemyCount")
      _photo_mission_state = PHOTO_MISSION.ATTACK_ENEMY
      L4_4 = false
    end
    while _photo_mission_state ~= PHOTO_MISSION.COMPLETE do
      if _photo_mission_state == PHOTO_MISSION.ATTACK_ENEMY and Fn_sendEventComSb("getEnemyCount") >= 3 then
        print("\227\131\170\227\131\136\227\131\169\227\130\164")
        L4_4 = true
        L5_5 = Mv_safeObjectKill(L5_5)
        Fn_captionViewWait("sm49_02005")
        Fn_sceneConversion("locator2_pc_reset_pos_c_01", L0_9)
        L1_10()
      end
      wait()
    end
  end
  L7_7(L8_8)
  while true do
    L7_7 = _photo_mission_state
    L8_8 = PHOTO_MISSION
    L8_8 = L8_8.COMPLETE
    if L7_7 ~= L8_8 then
      while true do
        if not L4_4 then
          L7_7 = _is_enemy_kill
          L7_7 = L7_7 or _is_photo_area_distant
        end
        if L7_7 then
          L7_7 = wait
          L7_7()
        end
      end
      L7_7 = _photo_mission_state
      L8_8 = PHOTO_MISSION
      L8_8 = L8_8.ATTACK_ENEMY
      if L7_7 == L8_8 then
        L8_8 = L5_5
        L7_7 = L5_5.run
        L7_7(L8_8)
        while L5_5 ~= nil do
          L8_8 = L5_5
          L7_7 = L5_5.isRunning
          L7_7 = L7_7(L8_8)
          if L7_7 and not L4_4 then
            L7_7 = _is_photo_area_distant
          end
          if not L7_7 then
            L7_7 = wait
            L7_7()
          end
        end
        L7_7 = print
        L8_8 = "\227\131\149\227\130\169\227\131\136\227\131\171\227\131\188\227\131\151\230\138\156\227\129\145\227\129\159"
        L7_7(L8_8)
        L7_7 = checkPhotoResult
        L8_8 = L5_5
        L7_7 = L7_7(L8_8, L6_6)
        L8_8 = MISSION_RESULT
        L8_8 = L8_8.SUCCESS
        if L7_7 == L8_8 then
          L8_8 = Sound
          L8_8 = L8_8.pulse
          L8_8(L8_8, "success")
          L8_8 = PHOTO_MISSION
          L8_8 = L8_8.COMPLETE
          _photo_mission_state = L8_8
          L8_8 = Fn_captionViewWait
          L8_8("sm49_02010")
        else
          L8_8 = MISSION_RESULT
          L8_8 = L8_8.MISSING
          if L7_7 == L8_8 then
            L8_8 = Fn_captionView
            L8_8("sm49_02006")
          else
            L8_8 = MISSION_RESULT
            L8_8 = L8_8.ONLY_ENEMY
            if L7_7 == L8_8 then
              L8_8 = Fn_captionView
              L8_8("sm49_02012")
            else
              L8_8 = MISSION_RESULT
              L8_8 = L8_8.ONLY_PC
              if L7_7 == L8_8 then
                L8_8 = Fn_captionView
                L8_8("sm49_02007")
              else
                L8_8 = MISSION_RESULT
                L8_8 = L8_8.FARTHER
                if L7_7 == L8_8 then
                  L8_8 = Fn_captionView
                  L8_8("sm49_02008")
                else
                  L8_8 = MISSION_RESULT
                  L8_8 = L8_8.NEARER
                  if L7_7 == L8_8 then
                    L8_8 = Fn_captionView
                    L8_8("sm49_02009")
                  else
                    L8_8 = MISSION_RESULT
                    L8_8 = L8_8.NOT_ATTACK
                    if L7_7 == L8_8 then
                      L8_8 = Fn_captionViewWait
                      L8_8("sm49_02011")
                    end
                  end
                end
              end
            end
          end
        end
      end
      L7_7 = wait
      L7_7()
    end
  end
  L7_7 = Mv_safeObjectKill
  L8_8 = L5_5
  L7_7 = L7_7(L8_8)
  L5_5 = L7_7
  L7_7 = PHOTO_MISSION
  L7_7 = L7_7.COMPLETE
  _photo_mission_state = L7_7
  L7_7 = print
  L8_8 = "\230\146\174\229\189\177\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\229\174\140\228\186\134"
  L7_7(L8_8)
  L7_7 = PHASE01
  _gesture_phase = L7_7
  L7_7 = Fn_kaiwaDemoView
  L8_8 = "sm49_00450k"
  L7_7(L8_8)
  L7_7 = Fn_captionViewWait
  L8_8 = "sm49_02013"
  L7_7(L8_8)
  L7_7 = Fn_missionView
  L8_8 = "sm49_00128"
  L7_7(L8_8)
  while true do
    L7_7 = Fn_sendEventComSb
    L8_8 = "isEnemyAllDead"
    L7_7 = L7_7(L8_8)
    if not L7_7 then
      L7_7 = wait
      L7_7()
    end
  end
  L7_7 = Fn_captionViewWait
  L8_8 = "sm49_02017"
  L7_7(L8_8)
  L7_7 = Mv_gotoNextPhase
  L7_7()
  L7_7 = Mob
  L8_8 = L7_7
  L7_7 = L7_7.makeSituationPanic
  L7_7(L8_8, false)
  function L7_7()
    Fn_warpNpc("sm49_client", "locator2_client_reset_pos_c")
    Fn_playMotionNpc("sm49_client", "stay", false)
    _sdemo_cut02:set("locator2_cam_c_02_01", "locator2_aim_c_02_01", false)
    _sdemo_cut02:play()
    waitSeconds(2)
  end
  L8_8 = Fn_sceneConversion
  L8_8("locator2_pc_reset_pos_c_02", L7_7)
  L8_8 = Fn_userCtrlAllOff
  L8_8()
  L8_8 = waitSeconds
  L8_8(1.5)
  L8_8 = Fn_kaiwaDemoView
  L8_8("sm49_00500k")
  L8_8 = {
    "locator2_client_escape_move_07",
    "locator2_client_escape_move_08",
    "locator2_client_escape_move_09"
  }
  client_move_task = Fn_moveNpc("sm49_client", L8_8, {
    anim_run_speed = 1,
    anim_speed_over = true,
    runLength = -1,
    recast = true
  })
  Sound:playSE("m06_910c", 1, "", _client_puppet_hdl)
  Fn_captionViewWait("sm49_02016")
  waitSeconds(1)
  client_move_task = Mv_safeTaskAbort(client_move_task)
  Fn_setNpcActive("sm49_client", false)
  Fn_kaiwaDemoView("sm49_00800k")
  _sdemo_cut02:stop(2)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function checkPhotoResult(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25
  if A0_12 == nil then
    L2_14 = MISSION_RESULT
    L2_14 = L2_14.NONE
    return L2_14
  end
  L3_15 = A0_12
  L2_14 = A0_12.getPhotoState
  L2_14 = L2_14(L3_15)
  L3_15 = print
  L4_16 = "photo_state : "
  L5_17 = type
  L5_17 = L5_17(L6_18)
  L4_16 = L4_16 .. L5_17
  L3_15(L4_16)
  L3_15 = type
  L4_16 = L2_14
  L3_15 = L3_15(L4_16)
  if L3_15 ~= "table" then
    L3_15 = type
    L4_16 = L2_14
    L3_15 = L3_15(L4_16)
    if L3_15 == "number" then
      L3_15 = MISSION_RESULT
      L3_15 = L3_15.MISSING
      return L3_15
    end
    L3_15 = MISSION_RESULT
    L3_15 = L3_15.NONE
    return L3_15
  end
  L3_15 = L2_14[1]
  L3_15 = L3_15.target
  if L3_15 ~= A1_13 then
    L3_15 = MISSION_RESULT
    L3_15 = L3_15.ONLY_ENEMY
    return L3_15
  end
  L3_15 = {}
  L4_16 = 0
  L5_17 = nil
  for L9_21 = 1, #L7_19 do
    L3_15[L9_21] = false
  end
  for L9_21 = 2, #L2_14 do
    for L13_25, _FORV_14_ in L10_22(L11_23) do
      print("\227\130\171\227\131\161\227\131\169\227\129\171\229\134\153\227\129\163\227\129\159\233\187\146\232\159\178\239\188\154" .. L9_21, "\t\239\188\154\t", L2_14[L9_21].target)
      print("\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\227\130\187\227\131\131\227\131\136\227\129\151\227\129\159\233\187\146\232\159\178\239\188\154" .. L13_25, _enemy_hdl_tbl[_FORV_14_.NAME])
      if L2_14[L9_21].target == _enemy_hdl_tbl[_FORV_14_.NAME] then
        print("\233\187\146\232\159\178\239\188\154\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\228\184\128\232\135\180\239\188\129\n")
        L3_15[L13_25] = true
        if L2_14[L9_21].state == kPHOTO_FAR then
          L5_17 = true
        elseif L2_14[L9_21].state == kPHOTO_NEAR then
          L5_17 = false
        else
          L4_16 = L4_16 + 1
        end
      else
        print("\233\187\146\232\159\178\239\188\154\228\184\128\232\135\180\227\129\151\227\129\166\227\129\170\227\129\132")
      end
    end
  end
  if L6_18 == false then
    if L6_18 == false then
      if L6_18 == false then
        return L6_18
      end
    end
  end
  if L4_16 == 0 then
    if L5_17 then
      return L6_18
    else
      return L6_18
    end
  end
  for L11_23 = 1, MISSION_ENEMY_MAX do
    L13_25 = "\231\149\170\229\143\183:"
    L13_25 = L13_25 .. L11_23
    L12_24(L13_25)
    L13_25 = L6_18[L11_23]
    L12_24(L13_25)
    L13_25 = L3_15[L11_23]
    L12_24(L13_25)
    if L12_24 then
      if L12_24 then
      end
    end
  end
  if not L7_19 then
    return L8_20
  end
  return L8_20
end
function pccubesensor2_warning_area_03_OnLeave()
  _is_photo_area_distant = true
  Player:setStay(true, false)
  if _gesture_phase == PHASE00 then
    Fn_captionView("sm49_02002")
  elseif _gesture_phase == PHASE01 then
    Fn_captionView("sm49_02003")
  end
  Player:setStay(false)
end
function pccubesensor2_warning_area_03_OnEnter()
  local L0_26, L1_27
  _is_photo_area_distant = false
end
function pccubesensor2_over_area_03_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
