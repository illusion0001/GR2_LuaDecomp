import("Debug")
import("GravityOre")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm48_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
SM48_GURIGO_DESTROY_HEIGHT = 9.5
mine_name = "sm48_e_mine"
_puppets = {}
_puppet_task = {}
_isInCage = false
_isBossDiscovery = false
_smokeTask = nil
_smokeNode = nil
_smokeEffect = nil
_se_hdl_gurigo_smoke = nil
_transceiverHandle = nil
_player_motion = {
  down_a_00 = "kit01_down_a_00",
  down_b_00 = "kit01_down_b_00",
  sp = "kit01_surprise_00"
}
_grigoMotions = {
  speak_01 = "mcgri01_warning_00",
  attack_00 = "mcgri01_attack_00"
}
_gurigo_se = {"w12_502", "w12_507"}
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
grigo_move_se = nil
grigo_stay_se = nil
_is_boss_in_sensor = false
_boss_respawn_counter = 0
enmgen2__pre_boss = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "faker_boss_stone",
      locator = "locator__pre_boss",
      name = "sm48_pre_faker",
      ai_spawn_option = "Faker/faker_boss_mimic"
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
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum - 1
    if A0_10:getSpecTable().enemyDeadNum < 0 then
      A0_10:getSpecTable().enemyDeadNum = 0
    end
    A1_11:setEnableHomingTarget(false)
    A1_11:setVisibleEnemyMarker(false)
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
enmgen2__boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker_boss",
      locator = "locator__boss",
      name = "_boss",
      ai_spawn_option = "Faker/faker_boss_sm48",
      navi_mesh_name = "pi_a_10_custom01"
    }
  },
  onUpdate = function(A0_21)
    if _is_boss_in_sensor then
      _boss_respawn_counter = _boss_respawn_counter + 1
      if _boss_respawn_counter % 100 == 0 then
        print(string.format("Boss Respawn Count : %d", _boss_respawn_counter))
      end
      if _boss_respawn_counter > 1800 then
        findGameObject2("EnemyBrain", "_boss"):eventMessage("requestRespawn")
        _boss_respawn_counter = 0
        _is_boss_in_sensor = false
        print("\227\131\156\227\130\185\227\129\174\230\185\167\227\129\141\231\155\180\227\129\151\227\130\146\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159")
      end
    else
      _boss_respawn_counter = 0
    end
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onLeave = function(A0_24)
    local L1_25
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onSpawn = function(A0_28, A1_29)
  end,
  onObjectAsh = function(A0_30, A1_31)
  end
}
function Initialize()
  local L0_32
  L0_32 = Fn_userCtrlAllOff
  L0_32()
  L0_32 = Fn_findAreaHandle
  L0_32 = L0_32("pi_a_01")
  L0_32 = L0_32.setExpandedAabb
  L0_32(L0_32, true)
  L0_32 = Fn_findAreaHandle
  L0_32 = L0_32("pi_a_10")
  L0_32 = L0_32.setExpandedAabb
  L0_32(L0_32, true)
  L0_32 = Fn_sendBulkMineSetupRun
  L0_32(mine_name, _gravityOre, _addGravityOre)
  L0_32 = Fn_loadPlayerMotion
  L0_32(_player_motion)
  L0_32 = _puppets
  L0_32.man73 = Fn_findNpcPuppet("man73")
  L0_32 = Fn_setNpcActive
  L0_32("man73", false)
  L0_32 = {
    {
      name = "_gurigo",
      type = "mcgri",
      node = "locator2__gurigo_pos_01",
      attach = false,
      active = true
    }
  }
  Fn_setupNpc(L0_32)
  for _FORV_4_, _FORV_5_ in pairs(L0_32) do
    _puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo = SDemo.create("sm48_sdemo")
  Fn_pcSensorOff("pccubesensor2__cage_01")
  Fn_pcSensorOn("pccubesensor2__boss_discovery")
  _isBossDiscovery = false
  _isInCage = false
  _smokeTask = nil
  _smokeNode = nil
  _smokeEffect = nil
  _se_hdl_gurigo_smoke = nil
  Fn_loadNpcEventMotion("_gurigo", _grigoMotions)
  RAC_startCatWarpControl("sm48_e_area_out", "pccubesensor2_area_out_near", "pccubesensor2_area_out_middle", "pccubesensor2_area_out_long", "locator2_pc_start_pos", "locator2_pc_start_pos", "locator2_pc_start_pos", "sm48_04000")
  Fn_sendMineSetupCallBrokenGravityOre("onOreBroken")
  repeat
    wait()
  until Fn_sendIsRunMine()
end
function Ingame()
  local L0_33, L1_34
  L0_33 = Fn_setCrewActive
  L1_34 = false
  L0_33(L1_34)
  L0_33 = Fn_setMineGravityStorm
  L0_33()
  L0_33 = Fn_setGravityStorm
  L1_34 = false
  L0_33(L1_34)
  L0_33 = Player
  L1_34 = L0_33
  L0_33 = L0_33.setTargetingPriority
  L0_33(L1_34, Player.kTargetingPrio_EnemyFirst)
  L0_33 = RAC_createGemWait
  L1_34 = "vital_gem_01"
  L0_33 = L0_33(L1_34, GEM_TYPE_HP_RECOVERY, "locator2_vital_gem_01")
  L1_34 = RAC_createGemWait
  L1_34 = L1_34("vital_gem_02", GEM_TYPE_SPECIAL_GAGE_RECOVERY, "locator2_vital_gem_02")
  Fn_findAreaHandle("pi_a_10"):appendChild(L0_33, true)
  Fn_findAreaHandle("pi_a_10"):appendChild(L1_34, true)
  Fn_coercionPoseNomal()
  wait()
  findGameObject2("EnemyGenerator", "enmgen2__pre_boss"):requestSpawn()
  while findGameObject2("EnemyGenerator", "enmgen2__pre_boss"):isSpawnOnStartFinished() == false do
    wait()
  end
  _sdemo:set("locator2__cam_01", Fn_getPlayer():getWorldPos(), false, Vector(0, 0, 0))
  _sdemo:play()
  Fn_playPlayerMotion(_player_motion.down_a_00, 0)
  Fn_missionStart()
  addSmokeEffect(_puppets._gurigo)
  waitSeconds(1)
  _sdemo:zoomIn(2.5, {deg = 30}, "easeIn")
  waitSeconds(0.5)
  Fn_kaiwaDemoView("sm48_00500k")
  Fn_playPlayerMotionWait(_player_motion.down_b_00, 0, 0.1)
  _sdemo:stop(1)
  waitSeconds(1)
  GurigoFoundBoss()
  findGameObject2("EnemyGenerator", "enmgen2__pre_boss"):requestAllEnemyKill()
  Fn_resetCoercionPose()
  battle_boss()
  escape()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Fn_resetCoercionPose()
    Player:setTargetingPriority(Player.kTargetingPrio_Default)
  end
  if _transceiverHandle then
    _transceiverHandle:try_term()
    _transceiverHandle = nil
  end
  RAC_endCatWarpControl("sm48_e_area_out")
end
function onOreBroken(A0_35)
  local L1_36
end
function GurigoFoundBoss()
  local L0_37
  L0_37 = Fn_kaiwaDemoView
  L0_37("sm48_00505k")
  L0_37 = Fn_findNpc
  L0_37 = L0_37("_gurigo")
  L0_37 = L0_37.changeDamageType
  L0_37(L0_37, 0)
  L0_37 = Player
  L0_37 = L0_37.setStay
  L0_37(L0_37, false)
  L0_37 = Fn_userCtrlOn
  L0_37()
  L0_37 = RAC_MultiNaviAdd
  L0_37("locator2_boss_navi")
  L0_37 = _puppet_task
  L0_37._gurigo = RAC_invokeMoveCharaTask("_gurigo", "locator2__gurigo_move", {
    arrivedLength = 0,
    runLength = 0,
    anim_run_speed = 1,
    anim_speed_over = true,
    navimesh = true,
    loop = true
  })
  L0_37 = Sound
  L0_37 = L0_37.playSEHandle
  L0_37 = L0_37(L0_37, "ene_bot_move", 1, "", _puppets._gurigo)
  grigo_move_se = L0_37
  repeat
    repeat
      L0_37 = wait
      L0_37()
      L0_37 = _isBossDiscovery
    until L0_37
    L0_37 = RAC_RaycastEyeSight
    L0_37 = L0_37(findGameObject2("Node", "locator2_boss_navi"), 100)
  until L0_37
  L0_37 = Sound
  L0_37 = L0_37.stopSEHandle
  L0_37(L0_37, grigo_move_se)
  L0_37 = RAC_MultiNaviClear
  L0_37()
  L0_37 = Player
  L0_37 = L0_37.setStay
  L0_37(L0_37, true)
  L0_37 = Fn_userCtrlAllOff
  L0_37()
  L0_37 = Fn_captionView
  L0_37("sm48_04001")
  L0_37 = RAC_LookAtObjectWait
  L0_37("locator2_boss_navi", 0, 0.5)
  L0_37 = {
    "locator2__gurigo_attack_boss3",
    "locator2__gurigo_attack_boss4",
    "locator2__gurigo_attack_boss5",
    "locator2__gurigo_attack_boss"
  }
  _puppet_task._gurigo = RAC_invokeMoveCharaTask2("_gurigo", L0_37, {
    arrivedLength = 0,
    runLength = 0,
    anim_run_speed = 1,
    anim_speed_over = true,
    navimesh = false
  })
  grigo_move_se = Sound:playSEHandle("ene_bot_move", 1, "", _puppets._gurigo)
  _sdemo:reset()
  _sdemo:set("locator2__boss_gurigo_cam_01", "locator2_boss_navi", kSDEMO_APPEND_ALL, Vector(0, 1.5, 0))
  _sdemo:play()
  _sdemo:zoomIn(1, {deg = 15}, "easeIn")
  Sound:pulse("ep13_announcement1")
  Fn_captionViewWait("sm48_04002")
  Fn_kaiwaDemoView("sm48_00510k")
  Fn_blackout()
  _sdemo:stop(0)
end
function battle_boss()
  _sdemo:reset()
  _sdemo:set("locator2__cam_02", "locator2__aim_02", true, Vector(0, 0, 0))
  _sdemo:play()
  waitSeconds(1)
  if Fn_getGravityOre2("gravityore_pi_a_01_01") ~= nil then
    Fn_getGravityOre2("gravityore_pi_a_01_01"):setActive(false)
  end
  if findGameObject2("EnemyGenerator", "enmgen2__boss") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2__boss"):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2__boss"):requestIdlingEnemy(true)
    while not findGameObject2("EnemyGenerator", "enmgen2__boss"):isPrepared() do
      wait()
    end
    findGameObject2("EnemyBrain", "_boss"):setEnableHomingTarget(false)
    findGameObject2("EnemyBrain", "_boss"):setVisibleEnemyMarker(false)
  end
  Fn_fadein()
  _sdemo:play({
    {
      time = 3.5,
      pos = "locator2__cam_06",
      hashfunc = "Linear"
    }
  }, {
    {
      time = 3.5,
      pos = "locator2__aim_06",
      hashfunc = "Linear"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  _sdemo:set("locator2__cam_05", "locator2__cam_07", true, Vector(0, 0, 0))
  _sdemo:play()
  _puppet_task._gurigo = RAC_invokeMoveCharaTask2("_gurigo", {
    "locator2__gurigo_battle_move01"
  }, {
    arrivedLength = 0,
    runLength = 0,
    anim_run_speed = 1,
    anim_speed_over = true,
    navimesh = false
  })
  waitSeconds(5)
  _sdemo:stop(1)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm48_00520k")
  findGameObject2("EnemyGenerator", "enmgen2__boss"):requestIdlingEnemy(false)
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_missionView("sm48_04006")
  findGameObject2("EnemyBrain", "_boss"):setEnableHomingTarget(true)
  findGameObject2("EnemyBrain", "_boss"):setVisibleEnemyMarker(true)
  repeat
    wait()
  until findGameObject2("EnemyGenerator", "enmgen2__boss"):getEnemyCount() == 0
  _puppet_task._gurigo:abort()
  _puppet_task._gurigo = nil
  invokeTask(function()
    local L0_38
    while true do
      L0_38 = _puppet_task
      L0_38 = L0_38._gurigo
      L0_38 = L0_38.isRunning
      L0_38 = L0_38(L0_38)
      if L0_38 then
        L0_38 = wait
        L0_38()
      end
    end
    L0_38 = Sound
    L0_38 = L0_38.stopSEHandle
    L0_38(L0_38, grigo_move_se)
    L0_38 = _puppet_task
    L0_38._gurigo = RAC_invokeMoveCharaTask("_gurigo", "locator2__gurigo_battle_move", {
      arrivedLength = 0,
      runLength = 0,
      anim_run_speed = 1,
      anim_speed_over = true,
      navimesh = false,
      loop = true
    })
    L0_38 = Sound
    L0_38 = L0_38.playSEHandle
    L0_38 = L0_38(L0_38, "ene_bot_move", 1, "", _puppets._gurigo)
    grigo_move_se = L0_38
    L0_38 = 300
    while true do
      if L0_38 < L0_38 + 1 and Fn_getDistanceToPlayer(_puppets._gurigo) < 3 then
        Sound:playSEHandle(_gurigo_se[RandI(#_gurigo_se)], 1, "", _puppets._gurigo)
        if RandI(1, 3) == 1 then
          Fn_captionView("sm48_04003")
        elseif RandI(1, 3) == 2 then
          Fn_captionView("sm48_03038")
        else
          Fn_captionView("sm48_04005")
        end
      end
      wait()
    end
  end):abort()
  Sound:stopSEHandle(grigo_move_se)
end
function escape()
  Player:setStay(true)
  Fn_userCtrlAllOff()
  Fn_blackout()
  Fn_resetPcPos("locator2_pc_start_pos2")
  _puppet_task._gurigo = RAC_invokeMoveCharaTask2("_gurigo", {
    "locator2__gurigo_cage_move04"
  }, {
    arrivedLength = 0,
    runLength = 0,
    anim_run_speed = 1,
    anim_speed_over = true,
    navimesh = false
  })
  _puppet_task._gurigo:abort()
  Fn_warpNpc("_gurigo", "locator2__gurigo_cage_move04")
  Fn_resetPcPos("locator2_pc_start_pos2")
  Fn_setCagePos(50)
  Fn_setCageMoveParam({
    speed = 8,
    accel = 0,
    decel = 10
  })
  Fn_fadein()
  grigo_stay_se = Sound:playSEHandle("ene_bot_stay", 1, "", _puppets._gurigo)
  Fn_kaiwaDemoView("sm48_00530k")
  sdemoCageAction()
  Fn_fadein()
  Fn_pcSensorOn("pccubesensor2__cage_01")
  Player:setStay(false)
  Fn_userCtrlOn()
  HUD:naviSetPochiDistanceDensity0(0)
  HUD:naviSetPochiDistanceDensity100(-1)
  while not _isInCage or Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
  RAC_missionNaviCaption("sm48_04008", _transceiverHandle):abort()
  _transceiverHandle:setPos(Vector(0, 10000, 0))
  Fn_kaiwaDemoView("sm48_00550k")
  Fn_pcSensorOff("pccubesensor2__cage_01")
  Fn_naviKill()
  Fn_setCageMoveParam({
    speed = 15,
    accel = 5,
    decel = 10
  })
  Fn_setCageMarker(false)
  while not (15 < Fn_getCageMoveDist()) do
    wait()
  end
  if Fn_getCatBrain() ~= nil then
    Fn_getCatBrain():clearFollowPoint()
    Fn_getCatBrain():setModeRidingCage(false)
  end
  Fn_blackout()
end
function pccubesensor2__cage_01_OnEnter()
  local L0_39, L1_40
  _isInCage = true
end
function pccubesensor2__cage_01_OnLeave()
  local L0_41, L1_42
  _isInCage = false
end
function pccubesensor2__boss_discovery_OnEnter()
  local L0_43, L1_44
  _isBossDiscovery = true
end
function pccubesensor2__boss_discovery_OnLeave()
  local L0_45, L1_46
  _isBossDiscovery = false
end
function sdemoCageAction()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53
  L0_47 = Player
  L1_48 = L0_47
  L0_47 = L0_47.setStay
  L2_49 = true
  L0_47(L1_48, L2_49)
  L0_47 = Fn_userCtrlAllOff
  L0_47()
  L0_47 = Fn_getCageHandle
  L0_47 = L0_47()
  L1_48 = Fn_createGimmickBg
  L2_49 = "locator2_pc_start_pos2"
  L3_50 = "transceiver"
  L4_51 = "citransceiver01_base"
  L1_48 = L1_48(L2_49, L3_50, L4_51)
  _transceiverHandle = L1_48
  L1_48 = _transceiverHandle
  L2_49 = L1_48
  L1_48 = L1_48.setIgnoreGrab
  L3_50 = true
  L1_48(L2_49, L3_50)
  L1_48 = _transceiverHandle
  L2_49 = L1_48
  L1_48 = L1_48.setActive
  L3_50 = true
  L1_48(L2_49, L3_50)
  L1_48 = _transceiverHandle
  L2_49 = L1_48
  L1_48 = L1_48.setForceMove
  L1_48(L2_49)
  L1_48 = _transceiverHandle
  L2_49 = L1_48
  L1_48 = L1_48.setWorldPos
  L3_50 = Vector
  L4_51 = 0
  L5_52 = 0
  L6_53 = 0
  L6_53 = L3_50(L4_51, L5_52, L6_53)
  L1_48(L2_49, L3_50, L4_51, L5_52, L6_53, L3_50(L4_51, L5_52, L6_53))
  L2_49 = L0_47
  L1_48 = L0_47.appendChild
  L3_50 = _transceiverHandle
  L4_51 = true
  L1_48(L2_49, L3_50, L4_51)
  L1_48 = _transceiverHandle
  L2_49 = L1_48
  L1_48 = L1_48.setPos
  L3_50 = Vector
  L4_51 = 0.5
  L5_52 = -4.5
  L6_53 = 0
  L6_53 = L3_50(L4_51, L5_52, L6_53)
  L1_48(L2_49, L3_50, L4_51, L5_52, L6_53, L3_50(L4_51, L5_52, L6_53))
  L1_48 = _transceiverHandle
  L2_49 = L1_48
  L1_48 = L1_48.setRot
  L3_50 = XYZRotQuaternionEular
  L4_51 = 270
  L5_52 = 0
  L6_53 = 0
  L6_53 = L3_50(L4_51, L5_52, L6_53)
  L1_48(L2_49, L3_50, L4_51, L5_52, L6_53, L3_50(L4_51, L5_52, L6_53))
  L1_48 = Fn_turnNpc
  L2_49 = "_gurigo"
  L3_50 = "locator2__gurigo_cage_turn"
  L1_48(L2_49, L3_50)
  L1_48 = Fn_captionViewWait
  L2_49 = "sm48_04007"
  L1_48(L2_49)
  L1_48 = _sdemo
  L2_49 = L1_48
  L1_48 = L1_48.reset
  L1_48(L2_49)
  L1_48 = _sdemo
  L2_49 = L1_48
  L1_48 = L1_48.set
  L3_50 = "locator2__gurigo_cam_01"
  L4_51 = _puppets
  L4_51 = L4_51._gurigo
  L5_52 = false
  L6_53 = Vector
  L6_53 = L6_53(0, 1, 0)
  L1_48(L2_49, L3_50, L4_51, L5_52, L6_53, L6_53(0, 1, 0))
  L1_48 = _sdemo
  L2_49 = L1_48
  L1_48 = L1_48.play
  L1_48(L2_49)
  L1_48 = Fn_playMotionNpc
  L2_49 = "_gurigo"
  L3_50 = _grigoMotions
  L3_50 = L3_50.speak_01
  L4_51 = false
  L5_52 = {}
  L5_52.isRepeat = true
  L1_48(L2_49, L3_50, L4_51, L5_52)
  L1_48 = Fn_captionViewWait
  L2_49 = "sm48_04009"
  L1_48(L2_49)
  L1_48 = Fn_setGravityStorm
  L2_49 = true
  L1_48(L2_49)
  L1_48 = Fn_cageMove
  L2_49 = false
  L3_50 = false
  L1_48(L2_49, L3_50)
  L1_48 = invokeTask
  function L2_49()
    waitSeconds(1)
    Fn_captionViewWait("sm48_04010")
    Sound:playSE("ene_bot_vo_call_nevi", 1, "", _puppets._gurigo)
    Fn_captionViewWait("sm48_04011")
  end
  L1_48(L2_49)
  L1_48 = _sdemo
  L2_49 = L1_48
  L1_48 = L1_48.play
  L3_50 = nil
  L4_51 = {L5_52}
  L5_52 = {}
  L5_52.time = 1.5
  L6_53 = L0_47.getWorldPos
  L6_53 = L6_53(L0_47)
  L5_52.pos = L6_53
  L5_52.hashfunc = "Linear"
  L1_48(L2_49, L3_50, L4_51)
  L1_48 = waitSeconds
  L2_49 = 1.5
  L1_48(L2_49)
  L1_48 = _sdemo
  L2_49 = L1_48
  L1_48 = L1_48.set
  L3_50 = "locator2__gurigo_cam_01"
  L4_51 = L0_47
  L5_52 = true
  L6_53 = Vector
  L6_53 = L6_53(0, 0, 0)
  L1_48(L2_49, L3_50, L4_51, L5_52, L6_53, L6_53(0, 0, 0))
  L1_48 = _sdemo
  L2_49 = L1_48
  L1_48 = L1_48.play
  L1_48(L2_49)
  L1_48 = true
  L2_49 = false
  L3_50 = Fn_findNpcPuppet
  L4_51 = "_gurigo"
  L3_50 = L3_50(L4_51)
  while L1_48 do
    L5_52 = L0_47
    L4_51 = L0_47.getWorldPos
    L4_51 = L4_51(L5_52)
    L6_53 = L3_50
    L5_52 = L3_50.getWorldPos
    L5_52 = L5_52(L6_53)
    L6_53 = L4_51.DistanceTo
    L6_53 = L6_53(L4_51, L5_52)
    print("cage > gurigo : " .. L6_53)
    if not L2_49 and L6_53 < SM48_GURIGO_DESTROY_HEIGHT then
      L2_49 = true
      _sdemo:set("locator2__gurigo_cam_02", L0_47, true, Vector(0, -5, 0))
      _sdemo:zoomIn(1, {deg = 20}, "easeIn")
      _sdemo:play()
    end
    if L6_53 < SM48_GURIGO_DESTROY_HEIGHT then
      L1_48 = false
      Sound:stopSEHandle(grigo_stay_se)
      invokeTask(function()
        Sound:playSE("ene_bot_suicide", 1, "")
        Sound:playSE("cage_land", 1, "", L0_47)
        clearSmokeEffect()
        invokeTask(function()
          waitSeconds(0.5)
          Fn_setNpcActive("_gurigo", false)
        end)
        Fn_playPlayerMotion(_player_motion.sp, 0, 0.3)
        Fn_captionViewWait("sm48_04012")
        while RAC_createEffect({
          eff_name = "ef_com_exp_02",
          pos_node = _puppets._gurigo,
          time = 2.7
        }) ~= nil and RAC_createEffect({
          eff_name = "ef_com_exp_02",
          pos_node = _puppets._gurigo,
          time = 2.7
        }):isRunning() do
          wait()
        end
      end)
    end
    wait()
  end
  L4_51 = waitSeconds
  L5_52 = 3
  L4_51(L5_52)
  L4_51 = Fn_captionViewWait
  L5_52 = "sm48_04013"
  L4_51(L5_52)
  L4_51 = Fn_blackout
  L4_51()
  L4_51 = _sdemo
  L5_52 = L4_51
  L4_51 = L4_51.stop
  L6_53 = 0
  L4_51(L5_52, L6_53)
  L4_51 = Fn_resetPcPos
  L5_52 = "locator2_pc_start_pos2"
  L4_51(L5_52)
  L4_51 = Fn_waitCageMoveEnd
  L4_51()
  L4_51 = Fn_setMineGravityStorm
  L4_51()
end
function addSmokeEffect(A0_54)
  if _smokeTask == nil then
    _smokeTask = invokeTask(function()
      _smokeNode = createGameObject2("Node")
      _smokeNode:setName("stingray_smoke_node1")
      _smokeNode:try_init()
      _smokeNode:waitForReady()
      _smokeNode:try_start()
      _smokeNode:setPos(({
        Vector(0, 1, 0)
      })[1])
      _smokeNode:setForceMove()
      A0_54:appendChild(_smokeNode)
      _smokeEffect = RAC_createEffect({
        eff_name = "ef_com_smk_07_l",
        parent_hdl = _smokeNode,
        loop = true
      })
      _se_hdl_gurigo_smoke = Sound:playSEHandle("ef_bg_ent_00a", 1, "", A0_54)
    end)
  end
end
function clearSmokeEffect()
  if _smokeEffect ~= nil then
    print("_smokeEffect:abort()")
    _smokeEffect:abort()
    _smokeEffect = nil
  end
  if _smokeNode ~= nil then
    print("_smokeNode:try_term()")
    _smokeNode:try_term()
    _smokeNode = nil
  end
  if _smokeTask ~= nil then
    print("_smokeTask:abort()")
    _smokeTask:abort()
    _smokeTask = nil
  end
  if _se_hdl_gurigo_smoke ~= nil then
    Sound:stopSEHandle(_se_hdl_gurigo_smoke)
    _se_hdl_gurigo_smoke = nil
  end
end
function cubesensor2_boss_01_OnEnter(A0_55)
  print("\227\131\156\227\130\185\227\129\140\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  _is_boss_in_sensor = true
end
function cubesensor2_boss_01_OnLeave(A0_56)
  print("\227\131\156\227\130\185\227\129\140\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\230\138\156\227\129\145\229\135\186\227\129\151\227\129\190\227\129\151\227\129\159")
  _is_boss_in_sensor = false
end
