dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
DOG_NOTICE_PC_CHECK_DIST = 1.5
DOG_TRACK_LOST_DIST = 20
DOG_TRACK_LEAVE_DIST = 3
DOG_STATE_NONE = 0
DOG_STATE_NORMAL = 1
DOG_STATE_DETOUR = 2
DOG_STATE_NOTICE_PC = 3
_puppet_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_sdemo = nil
_woodbox_tbl = {}
_enmgen_nevy_dog_track = nil
_dog_check_dist = false
_dog_state_proc_task = nil
_dog_state = DOG_STATE_NORMAL
_req_restart = false
_batte_out_processing = false
enmgen2_nevy_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  dead_count = 0,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "sm40_enemy_01",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "sm40_enemy_02",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "sm40_enemy_03",
      ai_spawn_option = "Stalker/Stalker_Hide"
    }
  },
  onSpawn = function(A0_0, A1_1)
  end,
  onUpdate = function(A0_2)
    local L1_3
  end,
  onEnter = function(A0_4)
    local L1_5
  end,
  onLeave = function(A0_6)
    local L1_7
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
    A0_10:getSpecTable().dead_count = A0_10:getSpecTable().dead_count + 1
  end
}
function Initialize()
  local L0_12
  L0_12 = {
    {
      name = "sm40_dog",
      type = "dog01",
      node = "locator2_dog01_01",
      active = false
    }
  }
  Fn_setupNpc(L0_12)
  for _FORV_4_, _FORV_5_ in pairs(L0_12) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_dog_tracking_out_01")
  Fn_pcSensorOff("pccubesensor2_dog_tracking_out_02")
  Fn_pcSensorOff("pccubesensor2_dog_tracking_out_03")
  Fn_pcSensorOff("pccubesensor2_dog_tracking_out_04")
  Fn_pcSensorOff("pccubesensor2_dog_tracking_out_05")
  Fn_pcSensorOff("pccubesensor2_dog_tracking_out_06")
  Fn_pcSensorOff("pccubesensor2_battle_out_01")
  Fn_pcSensorOff("pccubesensor2_battle_out_02")
  Fn_pcSensorOff("pccubesensor2_battle_out_03")
  _sdemo = SDemo.create("sm40_sdemo")
end
function Ingame()
  local L0_13, L1_14, L2_15, L3_16
  L0_13 = Fn_userCtrlOff
  L0_13()
  L0_13 = Fn_missionStart
  L1_14 = nil
  L2_15 = true
  L0_13(L1_14, L2_15)
  L0_13 = Fn_loadNpcEventMotion
  L1_14 = "sm40_dog"
  L2_15 = {
    L3_16,
    "dog01_sit_00",
    "dog01_sit_01",
    "dog01_scratch_00"
  }
  L3_16 = "dog01_sit_in_00"
  L0_13(L1_14, L2_15)
  L0_13 = 1
  while true do
    L1_14 = Fn_sendEventComSb
    L2_15 = "sm40_findGameObject2"
    L3_16 = "GimmickBg"
    L1_14 = L1_14(L2_15, L3_16, "bg2_woodbox_" .. string.format("%02d", L0_13))
    if L1_14 ~= nil then
      L3_16 = L1_14
      L2_15 = L1_14.setActive
      L2_15(L3_16, true)
      L2_15 = table
      L2_15 = L2_15.insert
      L3_16 = _woodbox_tbl
      L2_15(L3_16, L1_14)
    else
      break
    end
    L0_13 = L0_13 + 1
  end
  L0_13 = findGameObject2
  L1_14 = "EnemyGenerator"
  L2_15 = "enmgen2_nevy_01"
  L0_13 = L0_13(L1_14, L2_15)
  _enmgen_nevy_dog_track = L0_13
  L0_13 = _enmgen_nevy_dog_track
  L1_14 = L0_13
  L0_13 = L0_13.requestSpawn
  L0_13(L1_14)
  L0_13 = _enmgen_nevy_dog_track
  L1_14 = L0_13
  L0_13 = L0_13.requestIdlingEnemy
  L2_15 = true
  L0_13(L1_14, L2_15)
  L0_13 = playSdemo01
  L0_13()
  L0_13 = Fn_userCtrlOn
  L0_13()
  L0_13 = HUD
  L1_14 = L0_13
  L0_13 = L0_13.naviGetPochiDistanceDensity0
  L0_13 = L0_13(L1_14)
  L1_14 = HUD
  L2_15 = L1_14
  L1_14 = L1_14.naviGetPochiDistanceDensity100
  L1_14 = L1_14(L2_15)
  while true do
    L2_15 = HUD
    L3_16 = L2_15
    L2_15 = L2_15.captionGetTextId
    L2_15 = L2_15(L3_16)
    if L2_15 ~= nil then
      L2_15 = wait
      L2_15()
    end
  end
  function L2_15()
    RAC_NaviKill(false)
    Player:setStay(true)
    Fn_captionViewWait("sm40_00100")
    Fn_blackout()
    Fn_resetPcPos("warppoint2_pc_track_dog_restart_01")
    Fn_warpNpc("sm40_dog", "locator2_dog01_01")
    for _FORV_3_, _FORV_4_ in ipairs(_woodbox_tbl) do
      _woodbox_tbl[_FORV_3_]:requestRestoreForce()
    end
    _enmgen_nevy_dog_track:requestAllEnemyKill()
    _enmgen_nevy_dog_track:requestSpawn()
    Fn_fadein()
    Player:setStay(false)
    _dog_state_proc_task = invokeDogStateProcTask()
    HUD:naviSetPochiDistanceDensity0(8)
    HUD:naviSetPochiDistanceDensity100(10)
    Fn_naviSet(_puppet_tbl.sm40_dog)
  end
  function L3_16()
    local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22
    L0_17 = Fn_missionView
    L1_18 = "sm40_00102"
    L0_17(L1_18)
    L0_17 = waitSeconds
    L1_18 = 1.3
    L0_17(L1_18)
    L0_17 = Fn_captionView
    L1_18 = "sm40_00101"
    L0_17(L1_18)
    L0_17 = waitSeconds
    L1_18 = 1.3
    L0_17(L1_18)
    L0_17 = HUD
    L1_18 = L0_17
    L0_17 = L0_17.naviSetPochiDistanceDensity0
    L2_19 = 8
    L0_17(L1_18, L2_19)
    L0_17 = HUD
    L1_18 = L0_17
    L0_17 = L0_17.naviSetPochiDistanceDensity100
    L2_19 = 10
    L0_17(L1_18, L2_19)
    L0_17 = Fn_naviSet
    L1_18 = _puppet_tbl
    L1_18 = L1_18.sm40_dog
    L0_17(L1_18)
    _req_restart = false
    _dog_check_dist = true
    L0_17 = {}
    function L1_18()
      for _FORV_3_, _FORV_4_ in ipairs(_enmgen_nevy_dog_track:getSpecTable().spawnSet) do
        if L0_17[_FORV_4_.name] == nil and findGameObject2("EnemyBrain", _FORV_4_.name) ~= nil then
          print(_FORV_4_.name .. " ok")
          L0_17[_FORV_4_.name] = findGameObject2("EnemyBrain", _FORV_4_.name)
        end
        if L0_17[_FORV_4_.name] ~= nil and (L0_17[_FORV_4_.name]:isReadyEnemy() == true or L0_17[_FORV_4_.name]:isPlayMotion("spawn_hidden") == true or L0_17[_FORV_4_.name]:isPlayMotion("stay") == true) then
          return true
        end
      end
      return false
    end
    L2_19 = DOG_STATE_NONE
    L3_20 = nil
    L4_21 = true
    L5_22 = false
    while _dog_state_proc_task:isRunning() and L1_18() == false do
      wait()
      if _req_restart ~= true then
        if L2_19 ~= _dog_state then
          L2_19 = _dog_state
          if _dog_state == DOG_STATE_NORMAL then
            if L3_20 ~= nil then
              L3_20:abort()
              L3_20 = nil
            end
            if L5_22 == true then
              Fn_captionViewWait("sm40_00103")
              L5_22 = false
            end
          elseif _dog_state == DOG_STATE_NOTICE_PC then
            L3_20 = invokeTask(function()
              waitSeconds(1)
              Fn_captionViewWait("sm40_00118")
              waitSeconds(1)
              Fn_captionViewWait(({
                "sm40_00104",
                "sm40_00105",
                "sm40_00106"
              })[RandI(1, #{
                "sm40_00104",
                "sm40_00105",
                "sm40_00106"
              })])
              L5_22 = true
            end)
          end
        end
      end
    end
    _dog_check_dist = false
    if L3_20 ~= nil then
      L3_20:abort()
      L3_20 = nil
    end
    _dog_state_proc_task:abort()
    _dog_state_proc_task = nil
    if _req_restart == true then
      L2_15()
      return false
    end
    if L1_18() == false then
      Fn_playMotionNpc("sm40_dog", "bark", false, {isRepeat = true})
      Fn_captionView("sm40_00107")
      repeat
        if Fn_getDistanceToPlayer(_puppet_tbl.sm40_dog) >= DOG_TRACK_LOST_DIST then
          _req_restart = true
          break
        end
        wait()
      until L1_18() == true
      if _req_restart == true then
        L2_15()
        return false
      end
    end
    return true
  end
  while true do
    if L3_16() == false then
    end
  end
  RAC_NaviKill(false)
  HUD:naviSetPochiDistanceDensity0(L0_13)
  HUD:naviSetPochiDistanceDensity100(L1_14)
  for _FORV_7_, _FORV_8_ in ipairs(_enmgen_nevy_dog_track:getSpecTable().spawnSet) do
    findGameObject2("EnemyBrain", _FORV_8_.name):startMovingHiddenEnemy(true)
  end
  Mob:makeSituationPanic(true)
  Fn_captionView("sm40_00108")
  Fn_setCatWarpCheckPoint("warppoint2_pc_03")
  Fn_pcSensorOn("pccubesensor2_battle_out_01")
  _enmgen_nevy_dog_track:requestIdlingEnemy(false)
  while HUD:captionGetTextId() ~= nil do
    wait()
  end
  Fn_missionView("sm40_00109")
  while #_enmgen_nevy_dog_track:getSpecTable().spawnSet > _enmgen_nevy_dog_track:getSpecTable().dead_count do
    wait()
  end
  Fn_pcSensorOff("pccubesensor2_battle_out_01")
  Fn_pcSensorOff("pccubesensor2_battle_out_02")
  Fn_pcSensorOff("pccubesensor2_battle_out_03")
  Fn_naviKill()
  Mob:makeSituationPanic(false)
  Fn_captionViewWait("sm40_00110")
  Fn_blackout()
  Fn_userCtrlAllOff()
  invokeMoveDeactiveTask("sm40_dog", "locator2_dog_move_runaway_", 20):abort()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function invokeDogStateProcTask()
  local L0_23, L1_24, L2_25, L3_26
  L0_23 = DOG_STATE_NORMAL
  _dog_state = L0_23
  function L0_23()
    Sound:playSE("dog_bark", 1, "", _puppet_tbl.sm40_dog)
    waitSeconds(0.3)
    Sound:playSE("dog_bark", 1, "", _puppet_tbl.sm40_dog)
    waitSeconds(0.8)
    Sound:playSE("dog_bark", 1, "", _puppet_tbl.sm40_dog)
    waitSeconds(0.3)
    Sound:playSE("dog_bark", 1, "", _puppet_tbl.sm40_dog)
  end
  L1_24 = {
    L2_25,
    L3_26,
    {
      move_prefix = "locator2_dog_move_c_",
      walk_speed = 1,
      run_speed = 1,
      start_run_move_idx = 1,
      run_length = 2,
      look_target = "locator2_dog_look_target_03",
      detour_motion = "dog01_scratch_00",
      detour_se = nil,
      out_sensor = "pccubesensor2_dog_tracking_out_03",
      detour_caption = {"sm40_00113"}
    },
    {
      move_prefix = "locator2_dog_move_d_",
      walk_speed = 1,
      run_speed = 1,
      start_run_move_idx = 1,
      run_length = 2,
      look_target = "locator2_dog_look_target_04",
      detour_motion = {
        "dog01_sit_in_00",
        "dog01_sit_00"
      },
      detour_se = nil,
      out_sensor = "pccubesensor2_dog_tracking_out_04",
      detour_caption = {"sm40_00114"}
    },
    {
      move_prefix = "locator2_dog_move_e_",
      walk_speed = 1,
      run_speed = 1,
      start_run_move_idx = 1,
      run_length = 2,
      look_target = "locator2_dog_look_target_05",
      detour_motion = "dog01_scratch_00",
      detour_se = nil,
      out_sensor = "pccubesensor2_dog_tracking_out_05",
      detour_caption = {"sm40_00115"}
    },
    {
      move_prefix = "locator2_dog_move_f_",
      walk_speed = 1,
      run_speed = 1,
      start_run_move_idx = 1,
      run_length = 2,
      look_target = "locator2_dog_look_target_06",
      detour_motion = "bark",
      detour_se = L0_23,
      out_sensor = "pccubesensor2_dog_tracking_out_06",
      detour_caption = {"sm40_00116"}
    }
  }
  L2_25 = {}
  L2_25.move_prefix = "locator2_dog_move_a_"
  L2_25.walk_speed = 1.5
  L2_25.run_speed = 1
  L2_25.start_run_move_idx = 1
  L2_25.run_length = 30
  L2_25.look_target = "locator2_dog_look_target_01"
  L2_25.detour_motion = "bark"
  L2_25.detour_se = L0_23
  L2_25.out_sensor = "pccubesensor2_dog_tracking_out_01"
  L3_26 = {"sm40_00111"}
  L2_25.detour_caption = L3_26
  L3_26 = {}
  L3_26.move_prefix = "locator2_dog_move_b_"
  L3_26.walk_speed = 1
  L3_26.run_speed = 1
  L3_26.start_run_move_idx = 1
  L3_26.run_length = 2
  L3_26.look_target = "locator2_dog_look_target_02"
  L3_26.detour_motion = {
    "dog01_sit_in_00",
    "dog01_sit_01"
  }
  L3_26.detour_se = nil
  L3_26.out_sensor = "pccubesensor2_dog_tracking_out_02"
  L3_26.detour_caption = {"sm40_00112"}
  L2_25 = 1
  L3_26 = #L1_24
  return RAC_InvokeTaskWithDestractor(function()
    local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32
    L0_27 = Fn_findNpc
    L1_28 = "sm40_dog"
    L0_27 = L0_27(L1_28)
    _is_out_of_range = true
    L1_28 = Fn_pcSensorOn
    L2_29 = L1_24[1]
    L2_29 = L2_29.out_sensor
    L1_28(L2_29)
    L1_28 = _dog_state
    L2_29 = -1
    L3_30 = {}
    L4_31 = {}
    L5_32 = DOG_STATE_NONE
    L4_31[L5_32] = function()
      wait()
    end
    L5_32 = DOG_STATE_NORMAL
    L4_31[L5_32] = function()
      local L0_33, L1_34, L2_35
      L0_33 = L2_25
      L0_33 = L1_24[L0_33]
      L1_34 = {}
      L2_35 = 1
      while findGameObject2("Node", L0_33.move_prefix .. string.format("%02d", L2_35)) ~= nil do
        table.insert(L1_34, {
          pos = findGameObject2("Node", L0_33.move_prefix .. string.format("%02d", L2_35)):getWorldPos(),
          opt = {
            anim_walk_speed = L0_33.walk_speed,
            anim_run_speed = L0_33.run_speed,
            runLength = -1
          }
        })
        do break end
        do break end
        L2_35 = L2_35 + 1
      end
      L2_35 = 0
      if L1_28 ~= DOG_STATE_NOTICE_PC then
        L2_35 = L0_33.start_run_move_idx
        for _FORV_6_ = 1, math.min(L2_35, #L1_34) do
          L1_34[_FORV_6_].opt.runLength = 1000000
        end
      end
      if _FOR_ < 0 then
        for _FORV_6_ = math.max(1, L2_35 + 1), #L1_34 do
          L1_34[_FORV_6_].opt.runLength = -1
        end
      else
        for _FORV_7_ = #L1_34, 1, -1 do
          if _FORV_7_ ~= 1 or not Fn_get_distance(L1_34[_FORV_7_].pos, _puppet_tbl.sm40_dog:getWorldPos()) then
          end
          if L0_33.run_length > Fn_get_distance(L1_34[_FORV_7_].pos, L1_34[_FORV_7_ - 1].pos) then
            L1_34[_FORV_7_].opt.runLength = Fn_get_distance(L1_34[_FORV_7_].pos, L1_34[_FORV_7_ - 1].pos) + 1
          else
            L1_34[_FORV_7_].opt.runLength = L0_33.run_length - Fn_get_distance(L1_34[_FORV_7_].pos, L1_34[_FORV_7_ - 1].pos)
            break
          end
        end
      end
      waitSeconds(1)
      while Fn_moveNpc("sm40_dog", L1_34, {
        arrivedLength = 0.5,
        anim_speed_over = 1 < L0_33.walk_speed or 1 < L0_33.run_speed
      }, {
        startIndex = math.max(1, L2_29)
      }):isRunning() do
        if _dog_check_dist == true then
          if _is_out_of_range == false and Fn_getDistanceToPlayer(_puppet_tbl.sm40_dog) <= DOG_NOTICE_PC_CHECK_DIST then
            if 0 + 1 >= 30 then
              break
            end
          else
          end
          if Fn_getDistanceToPlayer(_puppet_tbl.sm40_dog) >= DOG_TRACK_LOST_DIST then
            _req_restart = true
            break
          end
        end
        wait()
      end
      L2_29 = L0_27:getMoveCurrentIndex()
      Fn_moveNpc("sm40_dog", L1_34, {
        arrivedLength = 0.5,
        anim_speed_over = 1 < L0_33.walk_speed or 1 < L0_33.run_speed
      }, {
        startIndex = math.max(1, L2_29)
      }):abort()
      RAC_stopNpcMoveTask("sm40_dog")
      _dog_state = DOG_STATE_NONE
    end
    L5_32 = DOG_STATE_DETOUR
    L4_31[L5_32] = function()
      local L0_36, L1_37
      L0_36 = L2_25
      L0_36 = L1_24[L0_36]
      L1_37 = L1_24
      L1_37 = #L1_37
      L1_37 = L1_37 <= L2_25
      waitSeconds(0.5)
      while invokeTask(Fn_turnNpc, "sm40_dog", L0_36.look_target):isRunning() do
        wait()
      end
      invokeTask(Fn_turnNpc, "sm40_dog", L0_36.look_target):abort()
      Fn_playMotionNpc("sm40_dog", L0_36.detour_motion, false)
      if type(L0_36.detour_se) == "string" then
        Sound:playSE(L0_36.detour_se, 1, "", _puppet_tbl.sm40_dog)
      elseif type(L0_36.detour_se) == "function" then
        invokeTask(L0_36.detour_se)
      end
      while invokeTask(function()
        local L0_38, L1_39, L2_40, L3_41, L4_42
        for L3_41, L4_42 in L0_38(L1_39) do
          while HUD:captionGetTextId() ~= nil do
            wait()
          end
          Fn_captionView(L4_42)
        end
      end):isRunning() do
        wait()
      end
      invokeTask(function()
        local L0_43, L1_44, L2_45, L3_46, L4_47
        for L3_46, L4_47 in L0_43(L1_44) do
          while HUD:captionGetTextId() ~= nil do
            wait()
          end
          Fn_captionView(L4_47)
        end
      end):abort()
      if false == true then
        Fn_playMotionNpc("sm40_dog", "stay", false)
        return
      end
      while invokeTask(waitSeconds, 1):isRunning() or L0_27:isMotionEnd() == false do
        wait()
      end
      invokeTask(waitSeconds, 1):abort()
      Fn_playMotionNpc("sm40_dog", "stay", false)
      if false == false then
        L2_25 = L2_25 + 1
        Fn_pcSensorOff(L0_36.out_sensor)
        _is_out_of_range = false
        if L2_25 <= L3_26 then
          _is_out_of_range = true
          Fn_pcSensorOn(L1_24[L2_25].out_sensor)
          _dog_state = DOG_STATE_NORMAL
        else
          _dog_state = DOG_STATE_NONE
        end
      end
    end
    L5_32 = DOG_STATE_NOTICE_PC
    L4_31[L5_32] = function()
      local L0_48, L1_49, L2_50
      L0_48 = 20
      L1_49 = nil
      L2_50 = 0
      while true do
        if Fn_getDistanceToPlayer(_puppet_tbl.sm40_dog) >= DOG_TRACK_LOST_DIST then
          _req_restart = true
          _dog_state = DOG_STATE_NONE
          break
        elseif L0_48 <= L2_50 or Fn_getDistanceToPlayer(_puppet_tbl.sm40_dog) >= DOG_TRACK_LEAVE_DIST then
          _dog_state = DOG_STATE_NORMAL
          break
        elseif L1_49 == nil or L1_49:isRunning() == false then
          L1_49 = invokeTask(Fn_turnNpc, "sm40_dog", Fn_getPlayer())
        end
        if _is_out_of_range == true then
          L2_50 = math.min(L2_50 + 1, L0_48)
        else
          L2_50 = 0
        end
        wait()
      end
      if L1_49 ~= nil then
        L1_49:abort()
        L1_49 = nil
      end
      Fn_playMotionNpc("sm40_dog", "stay", false)
    end
    while true do
      L5_32 = _dog_state
      if L5_32 ~= DOG_STATE_NONE then
        L5_32 = _dog_state
        print("_dog_state: " .. L5_32)
        L4_31[L5_32]()
        L1_28 = L5_32
      end
    end
  end, function()
    if L2_25 <= L3_26 then
      Fn_pcSensorOff(L1_24[L2_25].out_sensor)
      _is_out_of_range = false
    end
  end)
end
function invokeMoveDeactiveTask(A0_51, A1_52, A2_53)
  local L3_54
  L3_54 = {}
  L3_54.move_task = nil
  L3_54.deactive_task = nil
  function L3_54.update(A0_55)
    A0_55.deactive_task = RAC_InvokeAutoDeactiveNpcTask(A0_51, A2_53)
    A0_55.move_task = RAC_invokeMoveCharaTask(A0_51, A1_52, {
      runLength = -1,
      arrivedLength = 1.5,
      recast = true
    })
    while A0_55.deactive_task:isRunning() and A0_55.move_task:isRunning() do
      wait()
    end
    A0_55.move_task:abort()
    A0_55.move_task = nil
    RAC_stopNpcMoveTask(A0_51)
    while A0_55.deactive_task:isRunning() do
      wait()
    end
    A0_55.deactive_task:abort()
    A0_55.deactive_task = nil
  end
  function L3_54.destractor(A0_56)
    if A0_56.move_task ~= nil then
      A0_56.move_task:abort()
      A0_56.move_task = nil
      RAC_stopNpcMoveTask(A0_51)
    end
    if A0_56.deactive_task ~= nil then
      A0_56.deactive_task:abort()
      A0_56.deactive_task = nil
      Fn_setNpcActive(A0_51, false)
    end
  end
  return RAC_InvokeTaskWithDestractor(L3_54.update, L3_54.destractor, L3_54)
end
function playSdemo01()
  local L0_57
  L0_57 = Fn_kaiwaDemoView2
  L0_57("sm40_00100k", function()
    Fn_resetPcPos(findGameObject2("Node", "warppoint2_pc_01"))
    _sdemo:reset()
    _sdemo:set("locator2_sdemo_01_cam_01", Fn_getPlayer(), kSDEMO_APPEND_AIM, Vector(0, 1.2, 0))
    _sdemo:play()
    Fn_fadein()
  end)
  L0_57 = _sdemo
  L0_57 = L0_57.play
  L0_57(L0_57, {
    {
      pos = "locator2_sdemo_01_cam_02",
      time = 2,
      hashfunc = "EaseOut"
    }
  }, nil)
  L0_57 = Fn_captionViewWait
  L0_57("sm40_00117")
  while true do
    L0_57 = _sdemo
    L0_57 = L0_57.isPlay
    L0_57 = L0_57(L0_57)
    if L0_57 then
      L0_57 = wait
      L0_57()
    end
  end
  L0_57 = Fn_blackout
  L0_57()
  L0_57 = _sdemo
  L0_57 = L0_57.stop
  L0_57(L0_57, 0)
  L0_57 = Fn_resetPcPos
  L0_57(findGameObject2("Node", "warppoint2_pc_02"))
  L0_57 = {}
  L0_57.surprise_00 = "kit01_surprise_00"
  L0_57.stay = "kit01_stay_00"
  Fn_loadPlayerMotion(L0_57)
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_01_cam_03", "locator2_sdemo_01_aim_01")
  _sdemo:play()
  Fn_fadein()
  _sdemo:play({
    {
      pos = "locator2_sdemo_01_cam_04",
      time = 6,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo_01_aim_02",
      time = 6,
      hashfunc = "EaseInOut"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  Fn_kaiwaDemoView("sm40_00200k")
  waitSeconds(0.5)
  Fn_setNpcActive("sm40_dog", true)
  Fn_captionViewWait("sm40_00118")
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_01_cam_05", "locator2_sdemo_01_aim_03")
  waitSeconds(0.2)
  waitSeconds(0.5)
  Fn_captionViewWait("sm40_00119")
  Fn_captionViewWait("sm40_00120")
  Fn_playMotionNpc("sm40_dog", {
    "dog01_sit_in_00",
    "dog01_sit_00"
  }, false)
  Fn_captionViewWait("sm40_00121")
  _dog_state_proc_task = invokeDogStateProcTask()
  waitSeconds(0.3)
  Fn_captionView("sm40_00122")
  invokeTask(function()
    Fn_playPlayerMotionWait(L0_57.surprise_00, 0, 0.3)
    Fn_playPlayerMotion(L0_57.stay, -1, 0.2)
  end):abort()
  _sdemo:stop(1)
end
function pccubesensor2_dog_tracking_out_01_OnEnter()
  local L0_58, L1_59
  _is_out_of_range = false
end
function pccubesensor2_dog_tracking_out_01_OnLeave()
  local L0_60, L1_61
  _is_out_of_range = true
end
function pccubesensor2_dog_tracking_out_02_OnEnter()
  local L0_62, L1_63
  _is_out_of_range = false
end
function pccubesensor2_dog_tracking_out_02_OnLeave()
  local L0_64, L1_65
  _is_out_of_range = true
end
function pccubesensor2_dog_tracking_out_03_OnEnter()
  local L0_66, L1_67
  _is_out_of_range = false
end
function pccubesensor2_dog_tracking_out_03_OnLeave()
  local L0_68, L1_69
  _is_out_of_range = true
end
function pccubesensor2_dog_tracking_out_04_OnEnter()
  local L0_70, L1_71
  _is_out_of_range = false
end
function pccubesensor2_dog_tracking_out_04_OnLeave()
  local L0_72, L1_73
  _is_out_of_range = true
end
function pccubesensor2_dog_tracking_out_05_OnEnter()
  local L0_74, L1_75
  _is_out_of_range = false
end
function pccubesensor2_dog_tracking_out_05_OnLeave()
  local L0_76, L1_77
  _is_out_of_range = true
end
function pccubesensor2_dog_tracking_out_06_OnEnter()
  local L0_78, L1_79
  _is_out_of_range = false
end
function pccubesensor2_dog_tracking_out_06_OnLeave()
  local L0_80, L1_81
  _is_out_of_range = true
end
function pccubesensor2_battle_out_01_OnEnter()
  local L0_82, L1_83
end
function pccubesensor2_battle_out_01_OnLeave()
  Fn_pcSensorOff("pccubesensor2_battle_out_01")
  Fn_pcSensorOn("pccubesensor2_battle_out_02")
  Fn_pcSensorOn("pccubesensor2_battle_out_03")
  Player:setStay(true)
  _batte_out_processing = true
  invokeTask(function()
    local L0_84
    L0_84 = findGameObject2
    L0_84 = L0_84("Node", "locator2_navi_battle_01")
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("sm40_00123")
    Fn_lookAtObject(L0_84, 0, 0.7):abort()
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Fn_naviSet(L0_84)
    Player:setStay(false)
    _batte_out_processing = false
  end)
end
function pccubesensor2_battle_out_02_OnEnter()
  Fn_pcSensorOn("pccubesensor2_battle_out_01")
  Fn_pcSensorOff("pccubesensor2_battle_out_02")
  Fn_pcSensorOff("pccubesensor2_battle_out_03")
  Fn_naviKill()
end
function pccubesensor2_battle_out_02_OnLeave()
  local L0_85, L1_86
end
function pccubesensor2_battle_out_03_OnEnter()
  local L0_87, L1_88
end
function pccubesensor2_battle_out_03_OnLeave()
  Fn_pcSensorOn("pccubesensor2_battle_out_01")
  Fn_pcSensorOff("pccubesensor2_battle_out_02")
  Fn_pcSensorOff("pccubesensor2_battle_out_03")
  Player:setStay(true)
  invokeTask(function()
    while _batte_out_processing == true do
      wait()
    end
    Fn_naviKill()
    Player:setStay(true)
    Fn_catWarp()
    Player:setStay(false)
  end)
end
