dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm39_common.lua")
dofile("/Game/Misc/sdemo.lua")
import("Vehicle")
extra_data_tbl = {
  {
    npc_name = "sm39_scene4_extra_01",
    move_prefix = "locator2_scene4_extra_01_move_",
    move_anim_speed = 1
  },
  {
    npc_name = "sm39_scene4_extra_02",
    move_prefix = "locator2_scene4_extra_02_move_",
    move_anim_speed = 0.9
  },
  {
    npc_name = "sm39_scene4_extra_03",
    move_prefix = "locator2_scene4_extra_03_move_",
    move_anim_speed = 0.8
  },
  {
    npc_name = "sm39_scene4_extra_04",
    move_prefix = "locator2_scene4_extra_04_move_",
    move_anim_speed = 1
  },
  {
    npc_name = "sm39_scene4_extra_05",
    move_prefix = "locator2_scene4_extra_05_move_",
    move_anim_speed = 0.9
  }
}
_extraMotionTable = {
  scared = "man01_scared_04",
  lookback_watch = "man01_lookback_watch_01",
  vendor_angry = "vendor_angry_00",
  run_afraid = "man01_run_afraid_00"
}
_nevy_effect_hdl = nil
_staff_scary_task_tbl = {}
_sdemo = nil
_smokeTask = {}
_smokeNode = {}
_smokeEffect = {}
_isNotCreateSmoke = false
_isCarStop = false
_shipSensor = nil
_isEnterShip = false
_stuffShip = nil
_brokenWoodboxNum = 0
SHIP_TASK_SENSOR = 1
SHIP_TASK_MOVE = 2
_shipTask = {}
SM39_SHIP_SMOKE_MAX = 12
SM39_SHIP_SMOKE_INTERVAL_MIN = 1
SM39_SHIP_SMOKE_INTERVAL_MAX = 3
SM39_SHIP_SPEED = 2.08
SM39_SHIP_SENSOR_RANGE = 7.5
SM39_IMP_SEARCH_DISTANCE = 10
SM39_IMP_ATTACK_SPEED = 8
enmgen2_scene4_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 1,
  dead_count = 0,
  ash_count = 0,
  spawnSet = {
    {
      type = "runner_strong",
      locator = "locator_01",
      name = "sm39_enemy_01_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_02",
      name = "sm39_enemy_01_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_03",
      name = "sm39_enemy_01_03"
    },
    {
      type = "runner_strong",
      locator = "locator_04",
      name = "sm39_enemy_01_04"
    },
    {
      type = "stalker_strong",
      locator = "locator_05",
      name = "sm39_enemy_01_05"
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
  onObjectAsh = function(A0_6, A1_7)
    A0_6:getSpecTable().ash_count = A0_6:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_8, A1_9)
    A0_8:getSpecTable().dead_count = A0_8:getSpecTable().dead_count + 1
  end
}
enmgen2_scene4_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  dead_count = 0,
  ash_count = 0,
  spawnSet = {
    {
      type = "imp_strong",
      locator = "locator_01",
      name = "sm39_enemy_02_01"
    },
    {
      type = "imp_strong",
      locator = "locator_02",
      name = "sm39_enemy_02_02"
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
  onObjectAsh = function(A0_16, A1_17)
    A0_16:getSpecTable().ash_count = A0_16:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_18, A1_19)
    A0_18:getSpecTable().dead_count = A0_18:getSpecTable().dead_count + 1
  end
}
enmgen2_scene4_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  dead_count = 0,
  ash_count = 0,
  spawnSet = {
    {
      type = "giant_strong",
      locator = "locator_01",
      name = "sm39_enemy_03_01"
    }
  },
  onUpdate = function(A0_20)
    local L1_21
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onLeave = function(A0_24)
    local L1_25
  end,
  onObjectAsh = function(A0_26, A1_27)
    A0_26:getSpecTable().ash_count = A0_26:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_28, A1_29)
    A0_28:getSpecTable().dead_count = A0_28:getSpecTable().dead_count + 1
  end
}
function Initialize()
  local L0_30
  L0_30 = {
    {
      name = "sm39_director_01",
      type = "man18",
      node = "locator2_director_01",
      active = false
    },
    {
      name = "sm39_assistant_01",
      type = "man17",
      node = "locator2_assistant_01",
      active = false,
      not_mob = true
    },
    {
      name = "sm39_scene4_actor",
      type = "ene_thug04",
      node = "locator2_scene4_actor_01",
      active = false,
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "sm39_scene4_extra_01",
      type = "ene_thug05",
      node = "locator2_scene4_extra_01",
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "sm39_scene4_extra_02",
      type = "ene_thug05",
      node = "locator2_scene4_extra_02",
      active = false,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "sm39_scene4_extra_03",
      type = "ene_thug04",
      node = "locator2_scene4_extra_03",
      active = false,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "sm39_scene4_extra_04",
      type = "ene_thug04",
      node = "locator2_scene4_extra_04",
      active = false,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "sm39_scene4_extra_05",
      type = "ene_thug05",
      node = "locator2_scene4_extra_05",
      active = false,
      color_variation = 2,
      hair_variation = 0
    }
  }
  Fn_setupNpc(L0_30)
  _sdemo = SDemo.create("sm39_sdemo")
  Fn_setCostume("kit05")
  Fn_setCatActive(false)
  Fn_setNpcActive("sm39_client", false)
  _brokenWoodboxNum = 0
  Fn_loadNpcEventMotion("sm39_scene4_extra_01", _extraMotionTable)
  Fn_loadNpcEventMotion("sm39_scene4_extra_02", _extraMotionTable)
  Fn_loadNpcEventMotion("sm39_scene4_extra_03", _extraMotionTable)
  Fn_loadNpcEventMotion("sm39_scene4_extra_04", _extraMotionTable)
  Fn_loadNpcEventMotion("sm39_scene4_extra_05", _extraMotionTable)
end
function Ingame()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38
  L0_31 = Fn_disableCostumeChange
  L1_32 = true
  L0_31(L1_32)
  L0_31 = ReleaseShipAll
  L0_31()
  L0_31 = InitializeShipWork
  L1_32 = "CarHexS06"
  L2_33 = "stuffShip"
  L0_31 = L0_31(L1_32, L2_33, L3_34, L4_35)
  _stuffShip = L0_31
  L0_31 = Fn_userCtrlOff
  L0_31()
  L0_31 = Fn_setNpcActive
  L1_32 = "sm39_director_01"
  L2_33 = true
  L0_31(L1_32, L2_33)
  L0_31 = Fn_setNpcActive
  L1_32 = "sm39_assistant_01"
  L2_33 = true
  L0_31(L1_32, L2_33)
  L0_31 = Fn_playMotionNpc
  L1_32 = "sm39_director_01"
  L2_33 = "stay_01"
  L0_31(L1_32, L2_33, L3_34)
  L0_31 = Fn_setNpcActive
  L1_32 = "sm39_scene4_actor"
  L2_33 = true
  L0_31(L1_32, L2_33)
  L0_31 = {}
  L1_32 = 1
  while true do
    L2_33 = findGameObject2
    L2_33 = L2_33(L3_34, L4_35)
    if L2_33 ~= nil then
      L3_34(L4_35, L5_36)
      L1_32 = L1_32 + 1
    end
  end
  L2_33 = Player
  L2_33 = L2_33.setEnergy
  L2_33(L3_34, L4_35, L5_36, L6_37, L7_38, L5_36(L6_37, L7_38))
  L2_33 = Player
  L2_33 = L2_33.setAttrTune
  L2_33(L3_34, L4_35, L5_36)
  L2_33 = {}
  for L6_37, L7_38 in L3_34(L4_35) do
    Fn_setNpcActive(L7_38.npc_name, true)
  end
  L4_35.enmgen_name = "enmgen2_scene4_01"
  L4_35.kill_count = 9
  L5_36[2] = "sm39_03001"
  L5_36[4] = "sm39_03002"
  L5_36[6] = "sm39_03003"
  L4_35.kill_caption_id_tbl = L5_36
  L4_35.start_choreograph_func = L5_36
  L4_35.kdemo_id = nil
  L4_35.mission_text_id = "sm39_03004"
  L5_36.enmgen_name = "enmgen2_scene4_02"
  L5_36.kill_count = nil
  L5_36.kill_caption_id_tbl = nil
  L5_36.start_choreograph_func = L6_37
  L5_36.kdemo_id = "sm39_01400k"
  L5_36.mission_text_id = "sm39_03005"
  L6_37.enmgen_name = "enmgen2_scene4_03"
  L6_37.kill_count = nil
  L6_37.kill_caption_id_tbl = nil
  L6_37.start_choreograph_func = L7_38
  L6_37.kdemo_id = "sm39_01500k"
  L6_37.mission_text_id = "sm39_03006"
  for _FORV_8_, _FORV_9_ in L5_36(L6_37) do
    L4_35[_FORV_8_] = findGameObject2("EnemyGenerator", _FORV_9_.enmgen_name)
  end
  L5_36(L6_37, L7_38, "pccubesensor2_battle_middle", "pccubesensor2_battle_long", "locator2_pc_start_pos", "locator2_pc_start_pos", "locator2_pc_start_pos", "sm39_03011")
  while true do
    if L7_38() == false then
    end
  end
  Area:requestBreak(findGameObject2("Node", "locator2_pc_start_pos"), 100)
  RAC_endCatWarpControl("sm39_d_area_out")
  Fn_naviKill()
  if _nevy_effect_hdl then
    _nevy_effect_hdl:try_term()
    _nevy_effect_hdl = nil
  end
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_warpNpc("sm39_director_01", "locator2_director_01")
  Fn_warpNpc("sm39_assistant_01", "locator2_assistant_01")
  Fn_playMotionNpc("sm39_director_01", "stay_01", false)
  Fn_playMotionNpc("sm39_assistant_01", "talk_03", false)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  waitSeconds(1)
  Fn_fadein(0.5)
  Fn_kaiwaDemoView("sm39_01600k")
  Fn_blackout(0.5)
  Fn_setNpcActive("sm39_director_01", false)
  Fn_setNpcActive("sm39_client", true)
  Fn_setCostume("kit01")
  Fn_setCatActive(true)
  Fn_resetPcPos("warppoint2_epilogue_pc_01")
  Fn_warpNpc("sm39_assistant_01", "warppoint2_epilogue_assistant_01")
  Fn_warpNpc("sm39_client", "warppoint2_epilogue_client_01")
  Fn_playMotionNpc("sm39_assistant_01", "talk_03", false)
  Fn_playMotionNpc("sm39_client", "idle_00", false)
  Fn_fadein(0.5)
  Fn_kaiwaDemoView("sm39_01700k")
  Player:setStay(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
  ReleaseShipAll()
end
function ReleaseShipAll()
  for _FORV_3_, _FORV_4_ in ipairs(_shipTask) do
    _shipTask[_FORV_3_]:abort()
    _shipTask[_FORV_3_] = nil
  end
  _shipTask = {}
  ReleaseShipWork(_stuffShip)
  if _shipSensor then
    _shipSensor:try_term()
    _shipSensor = nil
  end
end
function playScene4Sdemo01(A0_39)
  local L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48
  L1_40 = _sdemo
  L2_41 = L1_40
  L1_40 = L1_40.reset
  L1_40(L2_41)
  L1_40 = _sdemo
  L2_41 = L1_40
  L1_40 = L1_40.set
  L1_40(L2_41, L3_42, L4_43)
  L1_40 = _sdemo
  L2_41 = L1_40
  L1_40 = L1_40.play
  L1_40(L2_41)
  L1_40 = Fn_missionStart
  L1_40()
  L1_40 = Fn_kaiwaDemoView
  L2_41 = "sm39_01200k"
  L1_40(L2_41)
  L1_40 = _sdemo
  L2_41 = L1_40
  L1_40 = L1_40.play
  L5_44.pos = "locator2_scene4_sdemo_01_aim_02"
  L5_44.time = 2
  L5_44.hashfunc = "EaseOut"
  L1_40(L2_41, L3_42, L4_43)
  while true do
    L1_40 = _sdemo
    L2_41 = L1_40
    L1_40 = L1_40.isPlay
    L1_40 = L1_40(L2_41)
    if L1_40 then
      L1_40 = wait
      L1_40()
    end
  end
  L1_40 = waitSeconds
  L2_41 = 0.5
  L1_40(L2_41)
  L1_40 = _sdemo
  L2_41 = L1_40
  L1_40 = L1_40.play
  L4_43.pos = "locator2_scene4_sdemo_01_cam_02"
  L4_43.time = 2
  L4_43.hashfunc = "EaseOut"
  L1_40(L2_41, L3_42, L4_43)
  L1_40 = invokeTask
  function L2_41()
    waitSeconds(1)
    _nevy_effect_hdl = createGameObject2("Effect")
    _nevy_effect_hdl:setName("sm39_scene4_eff_nev_smk")
    _nevy_effect_hdl:setModelName("ef_ev_smk_bk")
    _nevy_effect_hdl:setWorldTransform(findGameObject2("GimmickBg", "bg2_nevy_woodbox_01"):getWorldTransform())
    _nevy_effect_hdl:play()
    start_game_obj()
  end
  L1_40(L2_41)
  while true do
    L1_40 = _sdemo
    L2_41 = L1_40
    L1_40 = L1_40.isPlay
    L1_40 = L1_40(L2_41)
    if L1_40 then
      L1_40 = wait
      L1_40()
    end
  end
  L1_40 = 1
  L2_41 = {}
  _brokenWoodboxNum = 0
  while true do
    if L4_43 == nil then
      L1_40 = L1_40 - 1
      break
    end
    L2_41[L1_40] = L4_43
    L1_40 = L1_40 + 1
  end
  for L6_45, L7_46 in L3_42(L4_43) do
    L8_47(L9_48, "broken", function(A0_49)
      _brokenWoodboxNum = _brokenWoodboxNum + 1
      if _brokenWoodboxNum == L1_40 and _nevy_effect_hdl then
        _nevy_effect_hdl:try_term()
        _nevy_effect_hdl = nil
      end
    end)
  end
  L4_43.name = "sm39_scene4_actor"
  L4_43.motion = "surprise"
  L5_44.name = "sm39_scene4_extra_01"
  L5_44.motion = L6_45
  L6_45.name = "sm39_scene4_extra_02"
  L6_45.motion = L7_46
  L7_46.name = "sm39_scene4_extra_04"
  L7_46.motion = L8_47
  L8_47.name = "sm39_scene4_extra_05"
  L8_47.motion = "surprise"
  L8_47.animBlendDuration = 0.5
  L4_43(L5_44, L6_45, L7_46, L8_47)
  L4_43(L5_44)
  L4_43(L5_44)
  L4_43(L5_44)
  L4_43(L5_44)
  for L7_46, L8_47 in L4_43(L5_44) do
    L9_48(L8_47.name, L8_47.motion, false, {animBlendDuration = 0.5})
    L9_48(RandF(0.05, 0.15))
  end
  L4_43(L5_44)
  L4_43(L5_44)
  L5_44(L6_45)
  L5_44(L6_45)
  while true do
    if L5_44 == false then
      L5_44()
    end
  end
  L5_44(L6_45)
  L5_44(L6_45, L7_46)
  for L8_47, L9_48 in L5_44(L6_45) do
    if L9_48.npc_name ~= "sm39_scene4_extra_02" then
      invokeTask(function()
        if L9_48.npc_name == "sm39_scene4_extra_01" then
          waitSeconds(0.75)
        end
        table.insert(L4_43, RAC_invokeMoveCharaTask(L9_48.npc_name, L9_48.move_prefix, {
          anim_run_speed = L9_48.move_anim_speed,
          runLength = -1
        }))
      end)
    else
    end
  end
  L8_47.runLength = -1
  L6_45(L7_46)
  while true do
    if L7_46 then
      L7_46()
    end
  end
  L7_46(L8_47)
  L7_46(L8_47)
  L7_46(L8_47)
  L7_46(L8_47, L9_48)
  L7_46(L8_47, L9_48)
  L7_46(L8_47, L9_48, false, {isRepeat = true})
  L7_46(L8_47, L9_48, false, {isRepeat = true})
  L7_46(L8_47, L9_48, 2)
  L7_46(L8_47)
  L7_46(L8_47, L9_48)
  for _FORV_10_, _FORV_11_ in L7_46(L8_47) do
    L4_43[_FORV_10_]:abort()
  end
  for _FORV_10_, _FORV_11_ in L7_46(L8_47) do
    Fn_setNpcActive(_FORV_11_.npc_name, false)
  end
  L7_46(L8_47)
  L7_46(L8_47, L9_48, L9_48("sm39_director_01", {
    "locator2_scene4_director_move_01"
  }))
  L7_46(L8_47)
  L7_46(L8_47, L9_48, L9_48("sm39_assistant_01", {
    "locator2_scene4_assistant_move_01"
  }))
  L7_46(L8_47)
  L7_46(L8_47, L9_48)
  L7_46(L8_47)
  L7_46()
end
function bulle02StartChoreograph(A0_50)
  local L1_51, L2_52, L3_53
  L1_51 = findGameObject2
  L2_52 = "EnemyGenerator"
  L3_53 = "enmgen2_scene4_01"
  L1_51 = L1_51(L2_52, L3_53)
  if L1_51 then
    L3_53 = L1_51
    L2_52 = L1_51.requestIdlingEnemy
    L2_52(L3_53, true)
  end
  L2_52 = Fn_userCtrlOff
  L2_52()
  L3_53 = A0_50
  L2_52 = A0_50.requestSpawn
  L2_52(L3_53)
  L3_53 = A0_50
  L2_52 = A0_50.requestIdlingEnemy
  L2_52(L3_53, true)
  L2_52 = Camera
  L3_53 = L2_52
  L2_52 = L2_52.setControl
  L2_52(L3_53, Camera.kPlayer, Camera.kControl_All, false)
  L2_52 = Fn_captionView
  L3_53 = "sm39_03009"
  L2_52(L3_53)
  L2_52 = Fn_getDistanceToPlayer
  L3_53 = _stuffShip
  L3_53 = L3_53.ship
  L2_52 = L2_52(L3_53)
  if L2_52 > 5 then
    L2_52 = RAC_LookAtObjectWait
    L3_53 = _stuffShip
    L3_53 = L3_53.ship
    L2_52(L3_53, 0, 0.5)
  end
  while true do
    L2_52 = HUD
    L3_53 = L2_52
    L2_52 = L2_52.captionGetTextId
    L2_52 = L2_52(L3_53)
    if L2_52 ~= nil then
      L2_52 = wait
      L2_52()
    end
  end
  L2_52 = _shipTask
  L3_53 = SHIP_TASK_SENSOR
  L2_52[L3_53] = invokeTask(function()
    local L0_54
    L0_54 = createGameObject2
    L0_54 = L0_54("Sensor")
    _shipSensor = L0_54
    L0_54 = _shipSensor
    L0_54 = L0_54.setName
    L0_54(L0_54, "ship_sensor")
    L0_54 = _shipSensor
    L0_54 = L0_54.setDetectMode
    L0_54(L0_54, 1)
    L0_54 = _shipSensor
    L0_54 = L0_54.setDetectBehavior
    L0_54(L0_54, 0)
    L0_54 = _shipSensor
    L0_54 = L0_54.addSphere
    L0_54(L0_54, SM39_SHIP_SENSOR_RANGE)
    L0_54 = _shipSensor
    L0_54 = L0_54.setBBoxOffset
    L0_54(L0_54, Vector(5000, 5000, 5000))
    L0_54 = _shipSensor
    L0_54 = L0_54.setOnEnter
    L0_54(L0_54, "onEnterShip")
    L0_54 = _shipSensor
    L0_54 = L0_54.setActive
    L0_54(L0_54, true)
    L0_54 = _shipSensor
    L0_54 = L0_54.getPos
    L0_54 = L0_54(L0_54)
    L0_54.z = L0_54.z - 10
    _shipSensor:setPos(L0_54)
    _shipSensor:try_init()
    _shipSensor:waitForReady()
    _shipSensor:try_start()
    _stuffShip.ship:appendChild(_shipSensor)
  end)
  L2_52 = _stuffShip
  L2_52 = L2_52.ship
  L3_53 = L2_52
  L2_52 = L2_52.setCurrSpeed
  L2_52(L3_53, 0)
  L2_52 = _stuffShip
  L2_52 = L2_52.ship
  L3_53 = L2_52
  L2_52 = L2_52.setBaseSpeed
  L2_52(L3_53, SM39_SHIP_SPEED)
  L2_52 = invokeTask
  function L3_53()
    local L0_55, L1_56, L2_57, L3_58
    for L3_58 = 1, SM39_SHIP_SMOKE_MAX do
      if not _isNotCreateSmoke then
        addSmokeEffect(_stuffShip.ship, L3_58)
        waitSeconds(RandF(SM39_SHIP_SMOKE_INTERVAL_MIN, SM39_SHIP_SMOKE_INTERVAL_MAX))
      end
    end
  end
  L2_52 = L2_52(L3_53)
  L3_53 = {}
  L3_53.speed = SM39_IMP_ATTACK_SPEED
  _stuffShip.ship:appendChild(findGameObject2("Node", "locator2_enemy_01_move_01"), true)
  _stuffShip.ship:appendChild(findGameObject2("Node", "locator2_enemy_02_move_01"), true)
  _stuffShip.ship:appendChild(findGameObject2("Node", "locator2_enemy_03_move_01"), true)
  enemyMoveScript("sm39_enemy_02_01", {
    "locator2_enemy_01_move_01"
  }, L3_53)
  enemyMoveScript("sm39_enemy_02_02", {
    "locator2_enemy_02_move_01"
  }, L3_53)
  _shipTask[SHIP_TASK_MOVE] = invokeTask(function()
    while _stuffShip.ship:getRemainingDist() > 0 do
      wait()
    end
    _stuffShip.ship:setCurrSpeed(0)
    _stuffShip.ship:setBaseSpeed(0)
    _isCarStop = true
    print("\232\136\185\227\129\140\231\155\174\231\154\132\229\156\176\227\129\171\229\136\176\231\157\128\227\129\151\227\129\190\227\129\151\227\129\159")
  end)
  if L1_51 then
    L1_51:requestIdlingEnemy(false)
  end
end
function enemyMoveScript(A0_59, A1_60, A2_61)
  local L3_62
  L3_62 = findGameObject2
  L3_62 = L3_62("Puppet", A0_59)
  invokeTask(function()
    local L0_63, L1_64, L2_65, L3_66, L4_67
    L0_63 = print
    L1_64 = A0_59
    L2_65 = "\227\129\174\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\231\167\187\229\139\149\231\153\186\232\161\140"
    L1_64 = L1_64 .. L2_65
    L0_63(L1_64)
    L0_63 = findGameObject2
    L1_64 = "EnemyBrain"
    L2_65 = A0_59
    L0_63 = L0_63(L1_64, L2_65)
    L1_64 = true
    L2_65 = A1_60
    repeat
      L3_66 = wait
      L3_66()
      L4_67 = L0_63
      L3_66 = L0_63.isReadyEnemy
      L3_66 = L3_66(L4_67)
    until L3_66
    L3_66 = print
    L4_67 = A0_59
    L4_67 = L4_67 .. "\227\129\140\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\231\167\187\229\139\149\228\184\173"
    L3_66(L4_67)
    L3_66 = {}
    L3_66.speed = 0.3
    L4_67 = false
    repeat
      while not _isCarStop and not _isEnterShip do
        if L3_62 == nil then
          return
        end
        if L1_64 then
          if L4_67 == false then
            L0_63:move(L2_65, A2_61)
            if L3_62 ~= nil and Fn_get_distance(_stuffShip.ship:getWorldPos(), L3_62:getWorldPos()) < 4 then
              L1_64 = false
              print(A0_59 .. "isAttack = false")
            end
          end
        else
          L0_63:move(L2_65, L3_66)
          invokeTask(function()
            local L0_68
            L0_68 = true
            L4_67 = L0_68
            L0_68 = waitSeconds
            L0_68(RandF(3.5, 5.5))
            L0_68 = false
            L4_67 = L0_68
          end)
          L1_64 = true
        end
        wait()
        if Fn_getDistanceToPlayer(_stuffShip.ship) < SM39_IMP_SEARCH_DISTANCE then
          _isNotCreateSmoke = true
          print(A0_59 .. "_isNotCreateSmoke = true")
          break
        end
      end
    until false
    L0_63:endScriptAction()
    print(A0_59 .. "\227\129\174\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\231\181\130\228\186\134")
  end)
end
function bulle03StartChoreograph(A0_69)
  local L1_70
  L1_70 = A0_69.requestSpawn
  L1_70(A0_69)
  L1_70 = A0_69.requestIdlingEnemy
  L1_70(A0_69, true)
  L1_70 = Camera
  L1_70 = L1_70.setControl
  L1_70(L1_70, Camera.kPlayer, Camera.kControl_All, false)
  L1_70 = findGameObject2
  L1_70 = L1_70("Node", "locator2_scene4_look_01")
  waitSeconds(1)
  Fn_captionView("sm39_03010")
  while invokeTask(function()
    waitSeconds(7)
  end):isRunning() and not Fn_isInSightTarget(L1_70, 0.5) do
    wait()
  end
  invokeTask(function()
    waitSeconds(7)
  end):abort()
  Fn_lookAtObject(L1_70, 0):abort()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  while HUD:captionGetTextId() ~= nil do
    wait()
  end
end
function invokeStaffScaryTask(A0_71, A1_72)
  local L2_73
  L2_73 = {}
  L2_73.move_task = nil
  function L2_73.update(A0_74)
    local L1_75
    L1_75 = RAC_invokeMoveCharaTask2
    L1_75 = L1_75(A0_71, A1_72, {runLength = -1})
    A0_74.move_task = L1_75
    while true do
      L1_75 = A0_74.move_task
      L1_75 = L1_75.isRunning
      L1_75 = L1_75(L1_75)
      if L1_75 then
        L1_75 = wait
        L1_75()
      end
    end
    L1_75 = A0_74.move_task
    L1_75 = L1_75.abort
    L1_75(L1_75)
    A0_74.move_task = nil
    L1_75 = Fn_turnNpc
    L1_75(A0_71, "locator2_scene4_director_assistant_turn_01")
    L1_75 = print
    L1_75(A1_72[#A1_72])
    L1_75 = ""
    if A0_71 == "sm39_director_01" then
      L1_75 = "stay_01"
    elseif A0_71 == "sm39_assistant_01" then
      L1_75 = "talk_angry_00"
    end
    Fn_playMotionNpc(A0_71, L1_75, false, {isRepeat = true})
  end
  function L2_73.destractor(A0_76)
    if A0_76.move_task ~= nil then
      A0_76.move_task:abort()
      A0_76.move_task = nil
      RAC_stopNpcMoveTask(A0_71)
    end
  end
  return RAC_InvokeTaskWithDestractor(L2_73.update, L2_73.destractor, L2_73)
end
function addSmokeEffect(A0_77, A1_78)
  local L2_79
  L2_79 = SM39_SHIP_SMOKE_MAX
  if A1_78 > L2_79 then
    return
  end
  if A0_77 == nil then
    return
  end
  L2_79 = A0_77.getName
  L2_79 = L2_79(A0_77)
  if _smokeTask[L2_79] == nil then
    _smokeTask[L2_79] = {}
  end
  _smokeTask[L2_79][A1_78] = invokeTask(function()
    if _smokeNode[L2_79] == nil then
      _smokeNode[L2_79] = {}
    end
    _smokeNode[L2_79][A1_78] = createGameObject2("Node")
    _smokeNode[L2_79][A1_78]:setName("stingray_smoke_node1")
    _smokeNode[L2_79][A1_78]:try_init()
    _smokeNode[L2_79][A1_78]:waitForReady()
    _smokeNode[L2_79][A1_78]:try_start()
    _smokeNode[L2_79][A1_78]:setPos(({
      Vector(1, 4, 0),
      Vector(1.5, 0, 0),
      Vector(-1, 4, -2),
      Vector(-1.5, 0, 0),
      Vector(1, 4, 1),
      Vector(1.5, 0, -2),
      Vector(1, 4, -2),
      Vector(-1.5, 0, -2),
      Vector(-1, 4, 1),
      Vector(1.5, 0, 1),
      Vector(-1, 4, 0),
      Vector(-1.5, 0, 1)
    })[A1_78])
    _smokeNode[L2_79][A1_78]:setForceMove()
    A0_77:appendChild(_smokeNode[L2_79][A1_78])
    if _smokeEffect[L2_79] == nil then
      _smokeEffect[L2_79] = {}
    end
    _smokeEffect[L2_79][A1_78] = RAC_createEffect({
      eff_name = "ef_bg_ent_00a",
      parent_hdl = _smokeNode[L2_79][A1_78],
      loop = true
    })
  end)
end
function onEnterShip(A0_80, A1_81)
  _isEnterShip = true
end
