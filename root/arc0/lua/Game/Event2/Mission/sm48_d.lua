import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm48_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
CAPTION_TIMER = 150
GEM_MAX = 99
REACTION_MANEKIN = 1
REACTION_CONTAINER = 2
REACTION_GURIGO = 3
JAMMER_ATTACK_CONTROL_NUM = 10
JAMMER_PLAYER_FOUND_DISTANCE = 10
RAYCAST_SEARCH_RANGE = 50
CONTAINER_DESTRUCTION_HELP_TIME = 300
DISTANCE_NEAR = 20
HELP_TIME_MAX = 1800
ENEMY_MARKER_ACTIVE_DISTANCE = 50
QUATER_TARGET = 1
HALF_TARGET1 = 0.73
HALF_TARGET2 = 0.46
HALF_TARGET3 = 0.33
FULL_TARGET = 0.2
NO_TARGET = 0
NAVI_WAIT_TIME_QUARTER = 20
NAVI_WAIT_TIME_HALF1 = 40
NAVI_WAIT_TIME_HALF2 = 60
NAVI_WAIT_TIME_HALF3 = 80
NAVI_WAIT_TIME = 100
DRIFT_MANEKIN = 1
DRIFT_CONTAINER = 2
DRIFT_MAX = DRIFT_CONTAINER
DETECT_MAX = DRIFT_MAX + 1
SENSOR_WAKE_BROKEN = 1
SENSOR_WAKE_NEVI_KILL = 2
PHASE_GEM_TALK = 0
PHASE_GURIGO_DETECT = 1
PHASE_GURIGO_FOUND = 2
PHASE_GURIGO_HELP = 3
mine_name = "sm48_d_mine"
_puppets = {}
_puppet_task = {}
_broken_ore = {}
_broken_count = 0
_detect_node = {}
_detect_state = {}
_detect_navi = {}
_gurigo_damage = false
_detect_grigo_long = false
_sdemo = nil
_mine_handle = nil
_captionWait = 0
_isSpawnNevi = {}
_smokeTask = nil
_smokeNode = nil
_smokeEffect = nil
_se_hdl_gurigo_smoke = nil
_help_time = 0
_isGrigoHelp = false
_isBattleEnd = false
_jammerAttackTask = {}
_enmgen_jammer = nil
_enmgen_lasercannon = nil
_grab_piller = {}
_grab_piller_task = {}
_grab_piller_max = 0
_grab_piller_num = 0
_grab_piller_revival = false
_grab_piller_revival_caption = false
_grabPillerInfinityCreateTask = nil
_hdl_gem = {}
_is_detect_sensor = true
_detect_se_handle = nil
_detect_se_index = 0
_detectDis = nil
_naviWait = 0
_gurigo_help_ok_check_task = nil
_isInGurigoHelpSensor = false
_gem_talk = false
_detect_phase = PHASE_GEM_TALK
_isEnemyBattleEnd = false
_isEnemyBattleEndCapture = false
_driftsWork = {}
_is_navi_display = {}
_grigoMotions = {
  down_01 = "mcgri01_down_01",
  damage01 = "mcgri01_damage_01"
}
_gurigo_se = {"w12_502", "w12_507"}
_SENSOR_SE_TABLE = {
  {
    dis = 30,
    se = "ep16_becon_react_l",
    vol = 1
  },
  {
    dis = 100,
    se = "ep16_becon_react_m",
    vol = 1
  },
  {
    dis = 200,
    se = "ep16_becon_react_s",
    vol = 1
  }
}
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_addGravityOre = {
  mineOreEvdName = "sm48_d_add_mine",
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
enmgen2__jammer = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator__jammer_01",
      name = "_jammer_01",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
    },
    {
      type = "jammer",
      locator = "locator__jammer_02",
      name = "_jammer_02",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
    },
    {
      type = "jammer",
      locator = "locator__jammer_03",
      name = "_jammer_03",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
    },
    {
      type = "jammer",
      locator = "locator__jammer_04",
      name = "_jammer_04",
      ai_spawn_option = "Jammer/Jammer_ScriptControl"
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
  onSpawn = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end
}
enmgen2__lasercannon = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator__lasercannon_01",
      name = "_lasercannon_01"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onObjectDead = function(A0_18, A1_19)
  end,
  onSpawn = function(A0_20, A1_21)
  end,
  onObjectAsh = function(A0_22, A1_23)
  end
}
enmgen2__nevi_first = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_01",
      name = "lunafishowner_01",
      ai_spawn_option = "LunaFishOwner/owner_num10"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_02",
      name = "childship_01"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_03",
      name = "lunafish_01"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onSpawn = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end
}
enmgen2__nevi_second = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_01",
      name = "_nevi_second_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_02",
      name = "_nevi_second_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_03",
      name = "_nevi_second_03"
    }
  },
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onSpawn = function(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
  end
}
function Initialize()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59
  L0_48 = Fn_userCtrlAllOff
  L0_48()
  L0_48 = Fn_sendBulkMineSetupRun
  L0_48(L1_49, L2_50, L3_51)
  L0_48 = Fn_sendMineSetupCallBrokenGravityOre
  L0_48(L1_49)
  L0_48 = {}
  _puppets = L0_48
  L0_48 = {}
  _puppet_task = L0_48
  L0_48 = {}
  _broken_ore = L0_48
  _broken_count = 0
  L0_48 = {}
  _detect_node = L0_48
  L0_48 = {}
  _detect_state = L0_48
  L0_48 = {}
  _detect_navi = L0_48
  _gurigo_damage = false
  _detect_grigo_long = false
  _sdemo = nil
  _mine_handle = nil
  _captionWait = 0
  L0_48 = {}
  _isSpawnNevi = L0_48
  _smokeTask = nil
  _smokeNode = nil
  _smokeEffect = nil
  _se_hdl_gurigo_smoke = nil
  _help_time = 0
  _isGrigoHelp = false
  _isBattleEnd = false
  L0_48 = {}
  _jammerAttackTask = L0_48
  _enmgen_jammer = nil
  _enmgen_lasercannon = nil
  L0_48 = {}
  _grab_piller = L0_48
  L0_48 = {}
  _grab_piller_task = L0_48
  _grab_piller_max = 0
  _grab_piller_num = 0
  _grab_piller_revival = false
  _grab_piller_revival_caption = false
  _grabPillerInfinityCreateTask = nil
  L0_48 = {}
  _hdl_gem = L0_48
  _is_detect_sensor = true
  _detect_se_handle = nil
  _detect_se_index = 0
  _detectDis = nil
  _naviWait = 0
  _gurigo_help_ok_check_task = nil
  _isInGurigoHelpSensor = false
  _gem_talk = false
  L0_48 = PHASE_GEM_TALK
  _detect_phase = L0_48
  _isEnemyBattleEnd = false
  _isEnemyBattleEndCapture = false
  L0_48 = {}
  _driftsWork = L0_48
  L0_48 = {}
  _is_navi_display = L0_48
  L0_48 = InitializeDriftsWork
  L0_48()
  L0_48 = _puppets
  L0_48.man73 = L1_49
  L0_48 = Fn_setNpcActive
  L0_48(L1_49, L2_50)
  L0_48 = {L1_49}
  L1_49.name = "_gurigo"
  L1_49.type = "mcgri"
  L1_49.node = "locator2__detect_03"
  L1_49.attach = false
  L1_49.active = false
  L1_49(L2_50)
  for L4_52, L5_53 in L1_49(L2_50) do
    L7_55 = L5_53.name
    L8_56 = Fn_findNpcPuppet
    L9_57 = L5_53.name
    L8_56 = L8_56(L9_57)
    L6_54[L7_55] = L8_56
  end
  while true do
    if L3_51 ~= nil then
      L7_55 = L3_51
      L4_52(L5_53)
      L4_52[L1_49] = L3_51
      L4_52[L1_49] = L5_53
      L4_52[L1_49] = false
    end
  end
  _sdemo = L2_50
  L2_50(L3_51, L4_52)
  L2_50()
  for L7_55 = 1, DRIFT_MAX do
    L8_56 = _driftsWork
    L8_56 = L8_56[L7_55]
    L9_57 = Fn_createGimmickBg
    L10_58 = "locator2_drift_"
    L11_59 = string
    L11_59 = L11_59.format
    L11_59 = L11_59("%02d", L7_55)
    L10_58 = L10_58 .. L11_59
    L11_59 = "drift_"
    L11_59 = L11_59 .. string.format("%02d", L7_55)
    L9_57 = L9_57(L10_58, L11_59, L2_50[L7_55], false, L3_51[L7_55])
    L8_56.hdl = L9_57
    L8_56 = _driftsWork
    L8_56 = L8_56[L7_55]
    L8_56 = L8_56.hdl
    L9_57 = L8_56
    L8_56 = L8_56.setIgnoreGrab
    L10_58 = true
    L8_56(L9_57, L10_58)
    L8_56 = _driftsWork
    L8_56 = L8_56[L7_55]
    L8_56 = L8_56.hdl
    L9_57 = L8_56
    L8_56 = L8_56.setActive
    L10_58 = true
    L8_56(L9_57, L10_58)
    L8_56 = _driftsWork
    L8_56 = L8_56[L7_55]
    L8_56 = L8_56.isSetNaviToDrift
    if L8_56 then
      L8_56 = _detect_node
      L9_57 = findGameObject2
      L10_58 = "Node"
      L11_59 = "locator2_drift_"
      L11_59 = L11_59 .. string.format("%02d", L7_55)
      L9_57 = L9_57(L10_58, L11_59)
      L8_56[L7_55] = L9_57
      L8_56 = DRIFT_MANEKIN
      if L7_55 == L8_56 then
        L8_56 = _detect_node
        L9_57 = findGameObject2
        L10_58 = "Node"
        L11_59 = "locator2__detect_01"
        L9_57 = L9_57(L10_58, L11_59)
        L8_56[L7_55] = L9_57
      end
    end
    L8_56 = {
      L9_57,
      L10_58,
      L11_59,
      "manekin_kw_04"
    }
    L9_57 = "manekin_kw_01"
    L10_58 = "manekin_kw_02"
    L11_59 = "manekin_kw_03"
    L9_57 = 1
    while true do
      L10_58 = "drift_"
      L11_59 = string
      L11_59 = L11_59.format
      L11_59 = L11_59("%02d", L7_55)
      L10_58 = L10_58 .. L11_59 .. "_" .. string.format("%02d", L9_57)
      L11_59 = "locator2_"
      L11_59 = L11_59 .. L10_58
      if findGameObject2("Node", L11_59) ~= nil then
        _driftsWork[L7_55].hdlChilds[L9_57] = Fn_createGimmickBg(L11_59, L10_58, L8_56[L9_57], false)
        _driftsWork[L7_55].hdlChilds[L9_57]:setIgnoreGrab(true)
        _driftsWork[L7_55].hdlChilds[L9_57]:setActive(true)
        L9_57 = L9_57 + 1
      end
    end
  end
  L4_52()
  L7_55 = "pccubesensor2_area_out_middle"
  L8_56 = "pccubesensor2_area_out_long"
  L9_57 = "locator2_pc_cat_warp_pos"
  L10_58 = "locator2_pc_cat_warp_pos"
  L11_59 = "locator2_pc_cat_warp_pos"
  L4_52(L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59, "sm48_03000")
  L4_52(L5_53, L6_54)
  repeat
    L4_52()
  until L4_52
end
function InitializeDriftsWork()
  local L0_60, L1_61, L2_62
  L0_60 = _driftsWork
  L1_61 = DRIFT_MANEKIN
  L2_62 = {}
  L2_62.hdl = nil
  L2_62.isSensorResponse = false
  L2_62.isNaviDelInSensor = false
  L2_62.targetState = NO_TARGET
  L2_62.sensorWakeType = SENSOR_WAKE_BROKEN
  L2_62.enemyGenerator = findGameObject2("EnemyGenerator", "enmgen2__nevi_second")
  L2_62.isEnd = false
  L2_62.isSensorInPlayer = false
  L2_62.eventWakeTask = nil
  L2_62.isEventWake = false
  L2_62.hdlNodeForRaycast = findGameObject2("Node", "locator2_drift_01_for_raycast")
  L2_62.sensorInCnt = 0
  L2_62.isDisplaySpecialCaption = false
  L2_62.isDisplayTutorial = false
  L2_62.hdlChilds = {}
  L2_62.isSetNaviToDrift = true
  L0_60[L1_61] = L2_62
  L0_60 = _driftsWork
  L1_61 = DRIFT_CONTAINER
  L2_62 = {}
  L2_62.hdl = nil
  L2_62.isSensorResponse = true
  L2_62.isNaviDelInSensor = false
  L2_62.targetState = NO_TARGET
  L2_62.sensorWakeType = SENSOR_WAKE_BROKEN
  L2_62.enemyGenerator = findGameObject2("EnemyGenerator", "enmgen2__nevi_first")
  L2_62.isEnd = false
  L2_62.isSensorInPlayer = false
  L2_62.eventWakeTask = nil
  L2_62.isEventWake = false
  L2_62.hdlNodeForRaycast = findGameObject2("Node", "locator2_drift_02_for_raycast")
  L2_62.sensorInCnt = 0
  L2_62.isDisplaySpecialCaption = false
  L2_62.isDisplayTutorial = false
  L2_62.hdlChilds = {}
  L2_62.isSetNaviToDrift = true
  L0_60[L1_61] = L2_62
end
function Ingame()
  local L0_63
  L0_63 = Fn_setCrewActive
  L0_63(false)
  L0_63 = Fn_setMineGravityStormAllOff
  L0_63()
  L0_63 = SetDriftsDestroyOnlyPlayer
  L0_63()
  L0_63 = RAC_createGemWait
  L0_63 = L0_63("vital_gem_02", GEM_TYPE_HP_RECOVERY, "locator2_vital_gem_02")
  Fn_findAreaHandle("pi_a_25"):appendChild(L0_63, true)
  createJemForJammerBattle()
  sdemoKitAppearance()
  detectLoop()
  battleLoop()
  sm48_FinalBoxGroup()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  StopDetectSe()
  RAC_endCatWarpControl("sm48_d_area_out")
  RAC_endCatWarpControl("sm48_d_grigo_help_area_out")
  HUD:enemymarkerSetRange()
  if _grabPillerInfinityCreateTask then
    _grabPillerInfinityCreateTask:abort()
    _grabPillerInfinityCreateTask = nil
  end
end
function onOreBroken(A0_64)
  print("\233\137\177\231\159\179\231\160\180\229\163\138.." .. A0_64:getName())
  _broken_count = _broken_count + 1
  _broken_ore[_broken_count] = A0_64:getName()
end
function pccubesensor2__detect_06_long_OnEnter()
  local L0_65, L1_66
  _detect_grigo_long = true
end
function pccubesensor2__detect_06_long_OnLeave()
  local L0_67, L1_68
  _detect_grigo_long = false
end
function driftsWorkTaskAbort(A0_69)
  if _driftsWork[A0_69].eventWakeTask ~= nil then
    _driftsWork[A0_69].eventWakeTask:abort()
    _driftsWork[A0_69].eventWakeTask = nil
  end
end
function pccubesensor2__nevi_first_OnEnter()
  local L0_70
  L0_70 = _driftsWork
  L0_70 = L0_70[DRIFT_CONTAINER]
  L0_70 = L0_70.eventWakeTask
  if L0_70 == nil then
    L0_70 = _driftsWork
    L0_70 = L0_70[DRIFT_CONTAINER]
    L0_70.eventWakeTask = invokeTask(function()
      local L0_71, L1_72, L2_73, L3_74, L4_75, L5_76
      while true do
        L0_71 = RAC_RaycastEyeSight
        L1_72 = _driftsWork
        L2_73 = DRIFT_CONTAINER
        L1_72 = L1_72[L2_73]
        L1_72 = L1_72.hdlNodeForRaycast
        L2_73 = RAYCAST_SEARCH_RANGE
        L0_71 = L0_71(L1_72, L2_73)
        if not L0_71 then
          L0_71 = wait
          L0_71()
        end
      end
      L0_71 = _isSpawnNevi
      L1_72 = REACTION_CONTAINER
      L0_71[L1_72] = true
      L0_71 = _driftsWork
      L1_72 = DRIFT_CONTAINER
      L0_71 = L0_71[L1_72]
      L0_71.isEventWake = true
      L0_71 = Fn_pcSensorOff
      L1_72 = "pccubesensor2__nevi_first"
      L0_71(L1_72)
      L0_71 = _driftsWork
      L1_72 = DRIFT_CONTAINER
      L0_71 = L0_71[L1_72]
      L0_71 = L0_71.enemyGenerator
      L1_72 = L0_71
      L0_71 = L0_71.requestPrepare
      L0_71(L1_72)
      L0_71 = Player
      L1_72 = L0_71
      L0_71 = L0_71.setStay
      L2_73 = true
      L0_71(L1_72, L2_73)
      L0_71 = Fn_userCtrlAllOff
      L0_71()
      L0_71 = RAC_LookAtObjectWait
      L1_72 = _driftsWork
      L2_73 = DRIFT_CONTAINER
      L1_72 = L1_72[L2_73]
      L1_72 = L1_72.hdl
      L0_71(L1_72)
      L0_71 = Player
      L1_72 = L0_71
      L0_71 = L0_71.setStay
      L2_73 = false
      L0_71(L1_72, L2_73)
      L0_71 = Fn_userCtrlOn
      L0_71()
      L0_71 = captionViewWaitDrifts
      L1_72 = DRIFT_CONTAINER
      L2_73 = "sm48_03001"
      L0_71(L1_72, L2_73)
      L0_71 = captionViewWaitDrifts
      L1_72 = DRIFT_CONTAINER
      L2_73 = "sm48_03002"
      L0_71(L1_72, L2_73)
      L0_71 = _detect_navi
      L1_72 = REACTION_CONTAINER
      L0_71[L1_72] = true
      L0_71 = WaitDriftBroken
      L1_72 = DRIFT_CONTAINER
      L0_71(L1_72)
      L0_71 = RAC_MultiNaviDel
      L1_72 = _detect_node
      L2_73 = REACTION_CONTAINER
      L1_72 = L1_72[L2_73]
      L0_71(L1_72)
      L0_71 = _detect_navi
      L1_72 = REACTION_CONTAINER
      L0_71[L1_72] = false
      L0_71 = 1
      L1_72 = Fn_findAreaHandle
      L2_73 = "pi_a_03"
      L1_72 = L1_72(L2_73)
      while true do
        L2_73 = "drift_01_jem_"
        L3_74 = string
        L3_74 = L3_74.format
        L4_75 = "%02d"
        L5_76 = L0_71
        L3_74 = L3_74(L4_75, L5_76)
        L2_73 = L2_73 .. L3_74
        L3_74 = "locator2_"
        L4_75 = L2_73
        L3_74 = L3_74 .. L4_75
        L4_75 = findGameObject2
        L5_76 = "Node"
        L4_75 = L4_75(L5_76, L3_74)
        if L4_75 ~= nil then
          L4_75 = GEM_TYPE_MONEY_SMALL
          if L0_71 == 5 then
            L4_75 = GEM_TYPE_HP_RECOVERY
          end
          L5_76 = RAC_createGemWait
          L5_76 = L5_76(L2_73, L4_75, L3_74)
          L1_72:appendChild(L5_76, true)
          L0_71 = L0_71 + 1
        end
      end
      L2_73 = _driftsWork
      L3_74 = DRIFT_CONTAINER
      L2_73 = L2_73[L3_74]
      L2_73 = L2_73.enemyGenerator
      L3_74 = L2_73
      L2_73 = L2_73.requestSpawn
      L2_73 = L2_73(L3_74)
      if L2_73 == true then
        L2_73 = print
        L3_74 = "_driftsWork[ DRIFT_CONTAINER ].enemyGenerator:requestSpawn\230\136\144\229\138\159"
        L2_73(L3_74)
      end
      L2_73 = _driftsWork
      L3_74 = DRIFT_CONTAINER
      L2_73 = L2_73[L3_74]
      L2_73 = L2_73.enemyGenerator
      L3_74 = L2_73
      L2_73 = L2_73.requestIdlingEnemy
      L4_75 = true
      L2_73(L3_74, L4_75)
      while true do
        L2_73 = _driftsWork
        L3_74 = DRIFT_CONTAINER
        L2_73 = L2_73[L3_74]
        L2_73 = L2_73.enemyGenerator
        L3_74 = L2_73
        L2_73 = L2_73.getEnemyCount
        L2_73 = L2_73(L3_74)
        if L2_73 == 0 then
          L2_73 = wait
          L2_73()
        end
      end
      L2_73 = Fn_captionView
      L3_74 = "sm48_03003"
      L2_73(L3_74)
      L2_73 = _driftsWork
      L3_74 = DRIFT_CONTAINER
      L2_73 = L2_73[L3_74]
      L2_73 = L2_73.enemyGenerator
      L3_74 = L2_73
      L2_73 = L2_73.requestIdlingEnemy
      L4_75 = false
      L2_73(L3_74, L4_75)
      L2_73 = _driftsWork
      L3_74 = DRIFT_CONTAINER
      L2_73 = L2_73[L3_74]
      L2_73 = L2_73.enemyGenerator
      L3_74 = L2_73
      L2_73 = L2_73.setEnemyMarker
      L4_75 = true
      L2_73(L3_74, L4_75)
      L2_73 = _driftsWork
      L3_74 = DRIFT_CONTAINER
      L2_73 = L2_73[L3_74]
      L2_73 = L2_73.sensorWakeType
      L3_74 = SENSOR_WAKE_NEVI_KILL
      while true do
        if L2_73 == L3_74 then
          L2_73 = _driftsWork
          L3_74 = DRIFT_CONTAINER
          L2_73 = L2_73[L3_74]
          L2_73 = L2_73.enemyGenerator
          L3_74 = L2_73
          L2_73 = L2_73.getEnemyCount
          L2_73 = L2_73(L3_74)
        end
        if L2_73 > 0 then
          L2_73 = wait
          L2_73()
        end
      end
      L2_73 = _driftsWork
      L3_74 = DRIFT_CONTAINER
      L2_73 = L2_73[L3_74]
      L2_73.isEnd = true
      L2_73 = RAC_startCatWarpControl
      L3_74 = "sm48_d_area_out"
      L4_75 = "pccubesensor2_area_out_near"
      L5_76 = "pccubesensor2_area_out_middle"
      L2_73(L3_74, L4_75, L5_76, "pccubesensor2_area_out_long", "locator2_drift_02_catwarp", "locator2_drift_02_catwarp", "locator2_drift_02_catwarp", "sm48_03000")
      L2_73 = Fn_captionViewWait
      L3_74 = "sm48_03045"
      L2_73(L3_74)
      L2_73 = _driftsWork
      L3_74 = DRIFT_MANEKIN
      L2_73 = L2_73[L3_74]
      L2_73 = L2_73.isEnd
      if L2_73 == true then
        L2_73 = _detect_navi
        L3_74 = REACTION_GURIGO
        L2_73[L3_74] = true
      else
        L2_73 = _detect_navi
        L3_74 = DRIFT_MANEKIN
        L2_73[L3_74] = true
      end
    end)
  end
end
function pccubesensor2__nevi_first_OnLeave()
  driftsWorkTaskAbort(DRIFT_CONTAINER)
end
function pccubesensor2_drift_01_OnEnter()
  local L0_77
  L0_77 = _driftsWork
  L0_77 = L0_77[DRIFT_CONTAINER]
  L0_77.isSensorInPlayer = true
end
function pccubesensor2_drift_01_OnLeave()
  local L0_78
  L0_78 = _driftsWork
  L0_78 = L0_78[DRIFT_CONTAINER]
  L0_78.isSensorInPlayer = false
end
function pccubesensor2_drift_02_OnEnter()
  local L0_79
  L0_79 = _driftsWork
  L0_79 = L0_79[DRIFT_MANEKIN]
  L0_79.isSensorInPlayer = true
end
function pccubesensor2_drift_02_OnLeave()
  local L0_80
  L0_80 = _driftsWork
  L0_80 = L0_80[DRIFT_MANEKIN]
  L0_80.isSensorInPlayer = false
end
function pccubesensor2__nevi_second_start_OnEnter()
  _detect_navi[REACTION_MANEKIN] = true
  Fn_pcSensorOff("pccubesensor2__nevi_second_start")
end
function pccubesensor2__nevi_second_OnEnter()
  if _isSpawnNevi[REACTION_MANEKIN] == true then
    return
  end
  invokeTask(function()
    _isSpawnNevi[REACTION_MANEKIN] = true
    findGameObject2("EnemyGenerator", "enmgen2__nevi_second"):requestPrepare()
    while findGameObject2("EnemyGenerator", "enmgen2__nevi_second"):isPrepared() == false do
      wait()
    end
    findGameObject2("EnemyGenerator", "enmgen2__nevi_second"):requestIdlingEnemy(true)
  end)
end
function pccubesensor2__nevi_second_OnLeave()
  Fn_pcSensorOff("pccubesensor2__nevi_second")
end
function pccubesensor2__nevi_second_caption_OnEnter()
  local L0_81
  L0_81 = _driftsWork
  L0_81 = L0_81[DRIFT_MANEKIN]
  L0_81 = L0_81.eventWakeTask
  if L0_81 == nil then
    L0_81 = _driftsWork
    L0_81 = L0_81[DRIFT_MANEKIN]
    L0_81.eventWakeTask = invokeTask(function()
      while not RAC_RaycastEyeSight(_driftsWork[DRIFT_MANEKIN].hdlNodeForRaycast, RAYCAST_SEARCH_RANGE) do
        wait()
      end
      _isSpawnNevi[REACTION_MANEKIN] = true
      _driftsWork[DRIFT_MANEKIN].isEventWake = true
      Fn_pcSensorOff("pccubesensor2__nevi_second_caption")
      repeat
        wait()
      until Fn_getDistanceToPlayer(_driftsWork[DRIFT_MANEKIN].hdl) <= 40 and RAC_RaycastEyeSight(_driftsWork[DRIFT_MANEKIN].hdlNodeForRaycast, RAYCAST_SEARCH_RANGE)
      Player:setStay(true)
      Fn_userCtrlAllOff()
      RAC_LookAtObjectWait(_driftsWork[DRIFT_MANEKIN].hdl)
      captionViewWaitDrifts(DRIFT_MANEKIN, "sm48_03041")
      captionViewWaitDrifts(DRIFT_MANEKIN, "sm48_03042")
      Player:setStay(false)
      Fn_userCtrlOn()
      captionViewDrifts(DRIFT_MANEKIN, "sm48_03043")
      repeat
        wait()
      until Fn_getDistanceToPlayer(_driftsWork[DRIFT_MANEKIN].hdl) <= 15 and RAC_RaycastEyeSight(_driftsWork[DRIFT_MANEKIN].hdlNodeForRaycast, RAYCAST_SEARCH_RANGE)
      RAC_MultiNaviDel(_detect_node[REACTION_MANEKIN])
      captionViewDrifts(DRIFT_MANEKIN, "sm48_03044")
      _driftsWork[DRIFT_MANEKIN].enemyGenerator:requestIdlingEnemy(false)
      _driftsWork[DRIFT_MANEKIN].enemyGenerator:setEnemyMarker(true)
      RAC_MultiNaviDel(_detect_node[REACTION_MANEKIN])
      _detect_navi[REACTION_MANEKIN] = false
      if _driftsWork[DRIFT_CONTAINER].sensorWakeType == SENSOR_WAKE_NEVI_KILL then
        while _driftsWork[DRIFT_MANEKIN].enemyGenerator:getEnemyCount() > 0 do
          wait()
        end
      end
      _driftsWork[DRIFT_MANEKIN].isEnd = true
      RAC_startCatWarpControl("sm48_d_area_out", "pccubesensor2_area_out_near", "pccubesensor2_area_out_middle", "pccubesensor2_area_out_long", "locator2_drift_01_catwarp", "locator2_drift_01_catwarp", "locator2_drift_01_catwarp", "sm48_03000")
      waitSeconds(3)
      Fn_captionViewWait("sm48_02031")
      if _driftsWork[REACTION_CONTAINER].isEnd == false then
        _detect_navi[REACTION_CONTAINER] = true
      else
        _detect_navi[REACTION_GURIGO] = true
      end
    end)
  end
end
function pccubesensor2__nevi_second_caption_OnLeave()
  driftsWorkTaskAbort(DRIFT_MANEKIN)
end
function pccubesensor2__nevi_third_OnEnter()
  _detect_navi[REACTION_GURIGO] = true
  Fn_pcSensorOn("pccubesensor2__detect_06_long")
  Fn_pcSensorOff("pccubesensor2__nevi_third")
end
function pccubesensor2__grigo_help_OnEnter()
  local L0_82, L1_83
  _isInGurigoHelpSensor = true
end
function pccubesensor2__grigo_help_OnLeave()
  local L0_84, L1_85
  _isInGurigoHelpSensor = false
end
function detectLoop()
  _enmgen_jammer = findGameObject2("EnemyGenerator", "enmgen2__jammer")
  _enmgen_lasercannon = findGameObject2("EnemyGenerator", "enmgen2__lasercannon")
  _enmgen_jammer:requestIdlingEnemy(true)
  _enmgen_jammer:setEnemyMarker(false)
  _enmgen_lasercannon:requestIdlingEnemy(true)
  _enmgen_lasercannon:setEnemyMarker(false)
  Fn_missionView("sm48_03010")
  RAC_gaugeInit("sm48_02016", HUD.kCountType_Up, 0.8)
  RAC_startCatWarpControl("sm48_d_area_out_gem_talk", "pccubesensor2_gem_talk_near", "pccubesensor2_gem_talk_middle", "pccubesensor2_gem_talk_long", "locator2_pc_cat_warp_pos", "gravityore_pi_a_09_01_03", "gravityore_pi_a_09_01_03", "sm48_03011")
  Fn_userCtrlOn()
  while true do
    _detectDis = nil
    UpdateInSightTarget()
    if _detect_phase == PHASE_GEM_TALK then
      if GemTalk() then
        _detect_phase = PHASE_GURIGO_DETECT
      end
    elseif _detect_phase == PHASE_GURIGO_DETECT then
      if GurigoDetect() then
        _detect_phase = PHASE_GURIGO_FOUND
      end
    elseif _detect_phase == PHASE_GURIGO_FOUND then
      if GurigoFound() then
        _detect_phase = PHASE_GURIGO_HELP
      end
    else
    end
    if _detect_phase ~= PHASE_GURIGO_HELP or not GurigoHelp() then
      NaviDelete()
      UpdateGauge()
      _captionWait = math.max(_captionWait - 1, 0)
      UpdateSensorSE()
      wait()
    end
  end
  RAC_MultiNaviClear()
  HUD:miniGaugeSetVisible(false)
end
function UpdateInSightTarget()
  local L0_86, L1_87, L2_88, L3_89, L4_90
  if L0_86 then
    if L0_86 then
      if L0_86 then
        for L3_89 = 1, DETECT_MAX do
          L4_90 = _detect_navi
          L4_90 = L4_90[L3_89]
          if L4_90 then
            L4_90 = Debug
            L4_90 = L4_90.getSwitch
            L4_90 = L4_90(L4_90, {"Display", "Debug Draw"})
            Debug:setSwitch({"Display", "Debug Draw"}, false)
            if Fn_isInSightTarget(_detect_node[L3_89], FULL_TARGET) then
              if _detect_state[L3_89] ~= FULL_TARGET and _is_navi_display[L3_89] ~= true then
                _is_navi_display[L3_89] = true
                RAC_MultiNaviAdd(_detect_node[L3_89])
                putDetectCaption(_detect_node[L3_89])
                _detect_state[L3_89] = FULL_TARGET
              end
              if _naviWait < NAVI_WAIT_TIME then
                _naviWait = NAVI_WAIT_TIME
              end
            elseif Fn_isInSightTarget(_detect_node[L3_89], HALF_TARGET3) then
              if _naviWait < NAVI_WAIT_TIME_HALF3 then
                _naviWait = NAVI_WAIT_TIME_HALF3
              end
            elseif Fn_isInSightTarget(_detect_node[L3_89], HALF_TARGET2) then
              if _naviWait < NAVI_WAIT_TIME_HALF2 then
                _naviWait = NAVI_WAIT_TIME_HALF2
              end
            elseif Fn_isInSightTarget(_detect_node[L3_89], HALF_TARGET1) then
              if _naviWait < NAVI_WAIT_TIME_HALF1 then
                _naviWait = NAVI_WAIT_TIME_HALF1
              end
              _detect_state[L3_89] = NO_TARGET
            elseif Fn_isInSightTarget(_detect_node[L3_89], QUATER_TARGET) then
              if _naviWait < NAVI_WAIT_TIME_QUARTER then
                _naviWait = NAVI_WAIT_TIME_QUARTER
              end
              _detect_state[L3_89] = NO_TARGET
            end
            Debug:setSwitch({"Display", "Debug Draw"}, L4_90)
            if _naviWait > 0 and (_detectDis == nil or Fn_getDistanceToPlayer(_detect_node[L3_89]) < _detectDis) then
              _detectDis = Fn_getDistanceToPlayer(_detect_node[L3_89])
            end
          end
        end
      end
    end
  end
end
function GemTalk()
  if not _gem_talk and getGemCount() >= 1 then
    waitSeconds(2)
    Fn_missionViewEnd()
    RAC_endCatWarpControl("sm48_d_area_out_gem_talk")
    Fn_kaiwaDemoView("sm48_00410k")
    Fn_missionView("sm48_03012")
    _detect_navi[REACTION_CONTAINER] = true
    _gem_talk = true
    return true
  end
  return false
end
function GurigoDetect()
  if _detect_navi[REACTION_GURIGO] == true then
    sm48_InitGrabPiller()
    setHomingTargetEnemyMarker_JammerLesercannon(false)
    Fn_setNpcActive("_gurigo", true)
    Fn_playMotionNpc("_gurigo", _grigoMotions.down_01, false)
    addSmokeEffect(_puppets._gurigo)
    return true
  else
    ContainerDestructionHelp()
  end
  return false
end
function GurigoFound()
  if not RAC_RaycastEyeSight(findGameObject2("Node", "locator2_gurigo_help_for_raycast"), RAYCAST_SEARCH_RANGE) then
  end
  if false then
    _is_detect_sensor = false
    HUD:miniGaugeSetVisible(false)
    for _FORV_4_, _FORV_5_ in ipairs(_driftsWork) do
      if _FORV_5_.enemyGenerator then
        _FORV_5_.enemyGenerator:setEnemyMarker(false)
      end
    end
    StopDetectSe()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    Fn_captionViewLock("sm48_03013")
    RAC_LookAtObjectWait("locator2__detect_06_long", 0, 0.3)
    waitSeconds(1)
    Fn_blackout()
    Fn_captionViewEnd()
    _detect_navi[REACTION_GURIGO] = false
    RAC_MultiNaviDel(_detect_node[REACTION_GURIGO])
    SdemoGurigoFound()
    Fn_kaiwaDemoView("sm48_00430k")
    Player:setStay(false)
    Fn_userCtrlOn()
    invokeTask(function()
      Fn_missionView("sm48_03016")
      waitSeconds(1.3)
      Fn_captionView("sm48_03015")
    end)
    print("\227\131\141\227\131\180\227\130\163\232\161\140\229\139\149\233\150\139\229\167\139")
    _enmgen_jammer:requestIdlingEnemy(false)
    _enmgen_jammer:setEnemyMarker(true)
    _enmgen_lasercannon:requestIdlingEnemy(false)
    _enmgen_lasercannon:setEnemyMarker(true)
    setHomingTargetEnemyMarker_JammerLesercannon(true)
    invokeTaskJammerAttackControl()
    print("\227\131\141\227\131\180\227\130\163\232\161\140\229\139\149\233\150\139\229\167\1392")
    Fn_findNpc("_gurigo"):changeDamageType(2)
    Fn_findNpc("_gurigo"):setEventListener("npcDamaged", function()
      print("gurigo damage!")
      if _puppet_task._gurigo ~= nil then
        _puppet_task._gurigo:abort()
        _puppet_task._gurigo = nil
        RAC_stopNpcMoveTask("_gurigo")
      end
      _gurigo_damage = true
    end)
    _help_time = 0
    RAC_startCatWarpControl("sm48_d_grigo_help_area_out", "pccubesensor2__grigo_help_area_near", "pccubesensor2__grigo_help_area_middle", "pccubesensor2__grigo_help_area_long", "locator2__restart", "locator2__detect_03", "locator2__detect_03", "sm48_03017")
    return true
  else
    ContainerDestructionHelp()
  end
  return false
end
function SdemoGurigoFound()
  Area:setAnimMoveDriftEnable(false)
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_gurigo_found_cam_01", "locator2__detect_03")
  _sdemo:play()
  Fn_fadein()
  waitSeconds(2)
  _sdemo:play({
    {
      pos = "locator2_sdemo_gurigo_found_cam_02",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  repeat
    wait()
  until not _sdemo:isPlay()
  Sound:playSE("ene_bot_vo_call_nevi", 1, "", _puppets._gurigo)
  Fn_captionViewWait("sm48_03014")
  _sdemo:stop(1.5)
  waitSeconds(1.5)
  Area:setAnimMoveDriftEnable(true)
end
function GurigoHelp()
  grabPillerInfinityCreate()
  CheckGurigoHelpBattle()
  if _isInGurigoHelpSensor then
    if _gurigo_help_ok_check_task then
      _gurigo_help_ok_check_task:abort()
      _gurigo_help_ok_check_task = nil
    end
    return true
  elseif _gurigo_damage and _isGrigoHelp == false then
    GurigoDamage()
  elseif _isGrigoHelp == false then
    HelpForJammerBattle()
  end
  return false
end
function CheckGurigoHelpBattle()
  if not _isEnemyBattleEndCapture and _gurigo_help_ok_check_task == nil then
    _gurigo_help_ok_check_task = invokeTask(function()
      while _enmgen_lasercannon:getEnemyCount() + _enmgen_jammer:getEnemyCount() > 0 do
        wait()
      end
      _isEnemyBattleEnd = true
      _isEnemyBattleEndCapture = true
      _isGrigoHelp = true
      Fn_captionViewWait("sm48_03018")
      RAC_MultiNaviAdd(_puppets._gurigo)
      RAC_changeNodeCatWarpControl("sm48_d_grigo_help_area_out", "locator2_grigo_help_cat_warp", nil, "locator2__detect_03")
      repeat
        wait()
      until _isInGurigoHelpSensor
    end)
  end
end
function GurigoDamage()
  RAC_MultiNaviClear()
  if _gurigo_help_ok_check_task then
    _gurigo_help_ok_check_task:abort()
    _gurigo_help_ok_check_task = nil
  end
  Fn_userCtrlAllOff()
  Player:setStay(true)
  setHomingTargetEnemyMarker_JammerLesercannon(false)
  _sdemo:reset()
  _sdemo:set(findGameObject2("Node", "locator2__detect_06_cam"), _puppets._gurigo, true)
  _sdemo:offset(Vector(0, 0, 0), Vector(0, 1.5, 0))
  _sdemo:play()
  for _FORV_3_, _FORV_4_ in pairs(_jammerAttackTask) do
    _FORV_4_:abort()
    _FORV_4_ = nil
  end
  waitSeconds(1)
  clearSmokeEffect()
  Sound:playSE("ene_bot_suicide", 1, "")
  Fn_setNpcActive("_gurigo", false)
  waitSeconds(1)
  Fn_captionViewWait("sm48_03019")
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
  Fn_blackout()
  Fn_resetPcPos("locator2__restart")
  _enmgen_jammer:requestAllEnemyKill()
  _enmgen_lasercannon:requestAllEnemyKill()
  releaseJemForJammerBattle()
  wait()
  _enmgen_jammer:requestSpawn()
  while _enmgen_jammer:getEnemyCount() == 0 do
    wait()
  end
  _enmgen_jammer:requestIdlingEnemy(false)
  _enmgen_lasercannon:requestSpawn()
  while _enmgen_lasercannon:getEnemyCount() == 0 do
    wait()
  end
  _enmgen_lasercannon:requestIdlingEnemy(false)
  setHomingTargetEnemyMarker_JammerLesercannon(true)
  createJemForJammerBattle()
  Fn_setNpcActive("_gurigo", true)
  Fn_warpNpc("_gurigo", "locator2__detect_03")
  Fn_playMotionNpc("_gurigo", _grigoMotions.down_01, false)
  addSmokeEffect(_puppets._gurigo)
  _isEnemyBattleEndCapture = false
  RAC_changeNodeCatWarpControl("sm48_d_grigo_help_area_out", "locator2__restart", "locator2__detect_03", "locator2__detect_03")
  _sdemo:stop(0)
  Fn_fadein()
  Player:setStay(false)
  Fn_userCtrlOn()
  _help_time = 0
  _gurigo_damage = false
  invokeTaskJammerAttackControl()
  Fn_captionView("sm48_03020")
end
function HelpForJammerBattle()
  local L0_91, L1_92, L2_93, L3_94, L4_95, L5_96
  L0_91 = _enmgen_lasercannon
  L0_91 = L0_91.getEnemyCount
  L0_91 = L0_91(L1_92)
  L0_91 = L0_91 + L1_92
  if L0_91 > 0 then
    _help_time = L1_92
    if L1_92 >= L2_93 then
      L1_92(L2_93)
      if L1_92 == 0 then
        _isEnemyBattleEnd = true
      end
      if not L1_92 then
        L1_92()
        for L4_95, L5_96 in L1_92(L2_93) do
          print(L5_96:getName() .. "\227\130\146\231\162\186\232\170\141\227\129\151\227\129\190\227\129\153")
          if not L5_96:isGrabbed() and not L5_96:isBroken() then
            print(L5_96:getName() .. "\227\129\171\227\131\138\227\131\147\227\130\146\227\129\164\227\129\145\227\129\190\227\129\153")
            RAC_MultiNaviAdd(L5_96)
            break
          end
        end
        while true do
          if L1_92 == 0 then
            _isEnemyBattleEnd = true
            break
          end
          for L5_96, _FORV_6_ in L2_93(L3_94) do
            if _FORV_6_:isGrabbed() then
              _help_time = 0
              break
            end
          end
          if not L1_92 then
          end
          if not L2_93 then
            L2_93()
          end
        end
      end
      L1_92()
      if not L1_92 then
        if not L1_92 then
          if not L1_92 then
            L1_92(L2_93)
            while true do
              if L1_92 == L2_93 then
                _help_time = 0
                if L1_92 == 0 then
                  _isEnemyBattleEnd = true
                  break
                end
              end
              if L1_92 ~= 0 then
                L1_92()
              end
            end
            L1_92()
          end
        end
      end
      _help_time = 0
    end
  end
end
function ContainerDestructionHelp()
  if _driftsWork[DRIFT_CONTAINER].hdl:isBroken() then
    if _driftsWork[DRIFT_CONTAINER].isDisplayTutorial then
      Fn_tutorialCaptionKill()
      _driftsWork[DRIFT_CONTAINER].isDisplayTutorial = false
    end
  elseif _driftsWork[DRIFT_CONTAINER].isSensorInPlayer then
    _driftsWork[DRIFT_CONTAINER].sensorInCnt = _driftsWork[DRIFT_CONTAINER].sensorInCnt + 1
    if _driftsWork[DRIFT_CONTAINER].sensorInCnt > CONTAINER_DESTRUCTION_HELP_TIME and not _driftsWork[DRIFT_CONTAINER].isDisplaySpecialCaption then
      Fn_captionViewWait("sm48_03023")
      Fn_tutorialCaption("jupiter_shift")
      _driftsWork[DRIFT_CONTAINER].isDisplayTutorial = true
      _driftsWork[DRIFT_CONTAINER].isDisplaySpecialCaption = true
    end
  else
    _driftsWork[DRIFT_CONTAINER].sensorInCnt = 0
    _driftsWork[DRIFT_CONTAINER].isDisplaySpecialCaption = false
    if _driftsWork[DRIFT_CONTAINER].isDisplayTutorial then
      Fn_tutorialCaptionKill()
      _driftsWork[DRIFT_CONTAINER].isDisplayTutorial = false
    end
  end
end
function NaviDelete()
  local L0_97, L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106
  for L3_100, L4_101 in L0_97(L1_98) do
    if L4_101 == L5_102 then
      if L5_102 <= L6_103 then
        L6_103(L7_104)
        L6_103[L3_100] = false
      end
    end
  end
  for L3_100, L4_101 in L0_97(L1_98) do
    if L5_102 then
      L5_102(L6_103)
      if L3_100 == L5_102 then
        L5_102(L6_103)
      end
    end
    if L5_102 then
      for L8_105, L9_106 in L5_102(L6_103) do
        if L9_106:isBroken() then
          RAC_MultiNaviDel(L9_106)
        end
      end
    end
  end
end
function UpdateGauge()
  local L0_107
  L0_107 = IrregularGaugeMax
  L0_107()
  L0_107 = math
  L0_107 = L0_107.max
  L0_107 = L0_107(_naviWait - 1, 0)
  _naviWait = L0_107
  L0_107 = HUD
  L0_107 = L0_107.miniGaugeIsVisible
  L0_107 = L0_107(L0_107)
  if L0_107 then
    L0_107 = 0
    if _naviWait > 0 then
      L0_107 = _naviWait / NAVI_WAIT_TIME * 100
      if L0_107 > 80 then
        L0_107 = 80
      end
    else
    end
    RAC_gaugeSetRate(RandI(L0_107, L0_107 + 20))
  end
end
function IrregularGaugeMax()
  local L0_108, L1_109, L2_110, L3_111, L4_112, L5_113, L6_114
  L0_108 = {L1_109, L2_110}
  for L4_112, L5_113 in L1_109(L2_110) do
    L6_114 = _driftsWork
    L6_114 = L6_114[L4_112]
    L6_114 = L6_114.sensorWakeType
    if L6_114 == SENSOR_WAKE_NEVI_KILL and L5_113 then
      L6_114 = findGameObject2
      L6_114 = L6_114("EnemyGenerator", L0_108[L4_112])
      if L6_114:getEnemyCount() > 0 and Fn_getDistanceToPlayer(L6_114) < DISTANCE_NEAR and _naviWait < NAVI_WAIT_TIME then
        _naviWait = NAVI_WAIT_TIME
        _detectDis = 0
      end
    end
  end
  for L4_112, L5_113 in L1_109(L2_110) do
    L6_114 = _driftsWork
    L6_114 = L6_114[L4_112]
    L6_114 = L6_114.hdl
    L6_114 = L6_114.isBroken
    L6_114 = L6_114(L6_114)
    if not L6_114 then
      L6_114 = Fn_getDistanceToPlayer
      L6_114 = L6_114(_driftsWork[L4_112].hdl)
      if L6_114 < DISTANCE_NEAR then
        L6_114 = DRIFT_MANEKIN
        if L4_112 ~= L6_114 then
          L6_114 = _naviWait
          if L6_114 < NAVI_WAIT_TIME then
            L6_114 = NAVI_WAIT_TIME
            _naviWait = L6_114
            _detectDis = 0
          end
        end
      end
    end
  end
end
function UpdateSensorSE()
  _detect_se_index = 0
  if _detectDis ~= nil then
    for _FORV_4_, _FORV_5_ in ipairs(_SENSOR_SE_TABLE) do
      if _detectDis < _FORV_5_.dis then
        _detect_se_index = _FORV_4_
        if _detect_se_index ~= _detect_se_index then
          if _detect_se_handle ~= nil then
            print("SE\229\134\141\231\148\159\229\129\156\230\173\162")
            Sound:stopSEHandle(_detect_se_handle)
            _detect_se_handle = nil
          end
          _detect_se_handle = Sound:playSEHandle(_FORV_5_.se, _FORV_5_.vol)
          print("SE\229\134\141\231\148\159\239\188\154" .. string.format("%d", _detect_se_index))
          print("Distance\239\188\154" .. string.format("%d", _detectDis))
        end
        break
      end
    end
  end
  if _detect_se_index == 0 then
    StopDetectSe()
  end
end
function putDetectCaption(A0_115)
  local L1_116, L2_117
  L1_116 = Fn_isCaptionView
  L1_116 = L1_116()
  if L1_116 then
    return
  end
  L1_116 = IsInvalidDetectCaption
  L1_116 = L1_116()
  if L1_116 then
    return
  end
  L1_116 = _captionWait
  if L1_116 > 0 then
    return
  end
  L1_116 = 10
  L2_117 = Fn_getDistanceToPlayer
  L2_117 = L2_117(A0_115)
  ;({})[1] = function()
    if L2_117 < L1_116 then
      Fn_captionView("sm48_03024")
    else
      Fn_captionView("sm48_03025")
    end
    Sound:playSE("kit031a_1", 1)
  end
  ;({})[2] = function()
    if L2_117 < L1_116 then
      Fn_captionView("sm48_03026")
    else
      Fn_captionView("sm48_03027")
    end
    Sound:playSE("kit031b_1", 1)
  end
  ;({})[3] = function()
    if L2_117 < L1_116 then
      Fn_captionView("sm48_03028")
    else
      Fn_captionView("sm48_03029")
    end
    Sound:playSE("kit031c_1", 1)
  end
  ;({})[math.random(1, 3)]()
  _captionWait = CAPTION_TIMER
end
function IsInvalidDetectCaption()
  for _FORV_3_, _FORV_4_ in ipairs(_driftsWork) do
    if not _FORV_4_.isEnd and _FORV_4_.isSensorInPlayer then
      return true
    end
  end
  return false
end
function battleLoop()
  local L0_118, L1_119, L2_120
  L0_118 = Fn_userCtrlAllOff
  L0_118()
  L0_118 = Fn_blackout
  L0_118()
  L0_118 = RAC_changeNodeCatWarpControl
  L1_119 = "sm48_d_grigo_help_area_out"
  L2_120 = "locator2_grigo_help_cat_warp"
  L0_118(L1_119, L2_120, "locator2__detect_03", "locator2__detect_03")
  L0_118 = Fn_setNpcActive
  L1_119 = "_gurigo"
  L2_120 = true
  L0_118(L1_119, L2_120)
  L0_118 = Fn_warpNpc
  L1_119 = "_gurigo"
  L2_120 = "locator2__detect_03"
  L0_118(L1_119, L2_120)
  L0_118 = Fn_playMotionNpc
  L1_119 = "_gurigo"
  L2_120 = _grigoMotions
  L2_120 = L2_120.down_01
  L0_118(L1_119, L2_120, false)
  L0_118 = addSmokeEffect
  L1_119 = _puppets
  L1_119 = L1_119._gurigo
  L0_118(L1_119)
  L0_118 = Fn_resetPcPos
  L1_119 = "locator2__pc_gurigo_repair"
  L0_118(L1_119)
  L0_118 = Fn_coercionPoseNomal
  L0_118()
  L0_118 = Fn_resetCoercionPose
  L0_118()
  L0_118 = Fn_fadein
  L0_118()
  L0_118 = waitSeconds
  L1_119 = 1
  L0_118(L1_119)
  L0_118 = Fn_kaiwaDemoView
  L1_119 = "sm48_00440k"
  L0_118(L1_119)
  L0_118 = Fn_missionView
  L1_119 = "sm48_03046"
  L0_118(L1_119)
  L0_118 = Fn_userCtrlOn
  L0_118()
  L0_118 = Fn_findNpc
  L1_119 = "_gurigo"
  L0_118 = L0_118(L1_119)
  L1_119 = false
  L2_120 = L0_118.changeDamageType
  L2_120(L0_118, 2)
  L2_120 = L0_118.setEventListener
  L2_120(L0_118, "npcDamaged", function()
    if not L1_119 then
      invokeTask(function()
        Sound:playSEHandle("ene_bot_dmg", 1, "", _puppets._gurigo)
        Sound:playSEHandle("ene_bot_vo_call_nevi", 1, "", _puppets._gurigo)
        Fn_captionView("sm48_03038")
        L1_119 = true
        L0_118:changeDamageType(0)
        Fn_userCtrlAllOff()
        Fn_playMotionNpc("_gurigo", _grigoMotions.damage01, true, {isStop = true})
      end)
    end
  end)
  while not L1_119 do
    L2_120 = wait
    L2_120()
  end
  L2_120 = Fn_missionViewEnd
  L2_120()
  L2_120 = RAC_changeNodeCatWarpControl
  L2_120("sm48_d_grigo_help_area_out", "locator2_grigo_help_cat_warp", nil, "locator2__gurigo_first_move01_01")
  L2_120 = waitSeconds
  L2_120(3)
  L2_120 = _puppet_task
  L2_120._gurigo = RAC_invokeMoveCharaTask("_gurigo", "locator2__gurigo_first_move", {
    arrivedLength = 0.1,
    runLength = -1,
    anim_run_speed = 1,
    anim_speed_over = true,
    navimesh = false,
    loop = false
  })
  L2_120 = Sound
  L2_120 = L2_120.playSEHandle
  L2_120 = L2_120(L2_120, "ene_bot_move", 1, "", _puppets._gurigo)
  RAC_LookAtObject("locator2__gurigo_first_move01", 0, 0.5)
  Fn_playPlayerMotion("stay", -1, 1)
  Fn_userCtrlOn()
  while _puppet_task._gurigo:isRunning() do
    wait()
  end
  _puppet_task._gurigo = RAC_invokeMoveCharaTask("_gurigo", "locator2__gurigo_first_move01_", {
    arrivedLength = 0.1,
    runLength = -1,
    anim_run_speed = 1,
    anim_speed_over = true,
    navimesh = false,
    loop = true
  })
  RAC_MultiNaviAdd(_puppets._gurigo)
  while 3 < Fn_getDistanceToPlayer(_puppets._gurigo) do
    wait()
  end
  invokeTask(function()
    local L0_121
    L0_121 = Fn_captionViewWait
    L0_121("sm48_03030")
    L0_121 = 300
    while true do
      if L0_121 < L0_121 + 1 and Fn_getDistanceToPlayer(_puppets._gurigo) < 3 then
        Sound:playSEHandle(_gurigo_se[RandI(#_gurigo_se)], 1, "", _puppets._gurigo)
        if RandI(1, 3) == 1 then
          Fn_captionView("sm48_03031")
        elseif RandI(1, 3) == 2 then
          Fn_captionView("sm48_03038")
        else
          Fn_captionView("sm48_03033")
        end
      end
      wait()
    end
  end):abort()
  Sound:stopSEHandle(L2_120)
  sdemoKitInGravityStorm()
end
function grabPillerInfinityCreate()
  local L0_122
  L0_122 = Debug
  L0_122 = L0_122.getSwitch
  L0_122 = L0_122(L0_122, {"Display", "Debug Draw"})
  Debug:setSwitch({"Display", "Debug Draw"}, false)
  if _grabPillerInfinityCreateTask == nil then
    _grabPillerInfinityCreateTask = invokeTask(function()
      local L0_123, L1_124, L2_125, L3_126, L4_127
      while true do
        for L3_126, L4_127 in L0_123(L1_124) do
          if L4_127:isBroken() and Fn_isInSightTarget(L4_127, 1) == false and Fn_getDistanceToPlayer(L4_127) > 10 then
            L4_127:requestRestoreForce()
          end
        end
        L0_123()
      end
    end)
  end
  Debug:setSwitch({"Display", "Debug Draw"}, L0_122)
end
function addSmokeEffect(A0_128)
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
      A0_128:appendChild(_smokeNode)
      _smokeEffect = RAC_createEffect({
        eff_name = "ef_com_smk_07_l",
        parent_hdl = _smokeNode,
        loop = true
      })
      _se_hdl_gurigo_smoke = Sound:playSEHandle("ef_bg_ent_00a", 1, "", A0_128)
    end)
  end
end
function clearSmokeEffect()
  print("clearSmokeEffect()")
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
function invokeTaskJammerAttackControl()
  local L0_129, L1_130, L2_131, L3_132
  for L3_132 = 1, JAMMER_ATTACK_CONTROL_NUM do
    _jammerAttackTask[L3_132] = invokeTask(function()
      local L0_133, L1_134, L2_135
      L0_133 = "_jammer_"
      L1_134 = string
      L1_134 = L1_134.format
      L2_135 = "%02d"
      L1_134 = L1_134(L2_135, L3_132)
      L0_133 = L0_133 .. L1_134
      L1_134 = findGameObject2
      L2_135 = "EnemyBrain"
      L1_134 = L1_134(L2_135, L0_133)
      L2_135 = findGameObject2
      L2_135 = L2_135("Puppet", L0_133)
      print(L0_133 .. "\227\129\174\230\148\187\230\146\131\231\174\161\231\144\134\227\130\183\227\130\185\227\131\134\227\131\160\227\130\146\232\181\183\229\139\149")
      while L1_134 ~= nil do
        repeat
          wait()
        until Fn_getDistanceToPlayer(L2_135) < JAMMER_PLAYER_FOUND_DISTANCE
        repeat
          wait()
        until L1_134:isReadyEnemy()
        L1_134:eventMessage("Attack")
        print(L0_133 .. "\227\129\174\230\148\187\230\146\131")
        waitSeconds(9)
      end
    end)
    break
  end
end
function sm48_InitGrabPiller()
  local L0_136, L1_137, L2_138, L3_139
  L0_136 = 1
  while true do
    while true do
      L1_137 = "locator2_pi_grab_piller_"
      L2_138 = string
      L2_138 = L2_138.format
      L3_139 = "%02d"
      L2_138 = L2_138(L3_139, L0_136)
      L1_137 = L1_137 .. L2_138
      L2_138 = findGameObject2
      L3_139 = "Node"
      L2_138 = L2_138(L3_139, L1_137)
      if L2_138 ~= nil then
        L3_139 = "grab_piller_for_jammer_"
        L3_139 = L3_139 .. string.format("%02d", L0_136)
        _grab_piller_task[L1_137] = invokeTask(function()
          sm48_CreateGrabPiller(L3_139, L2_138)
        end)
        _grab_piller_max = _grab_piller_max + 1
        _grab_piller_num = _grab_piller_num + 1
        L0_136 = L0_136 + 1
      end
    end
  end
  L1_137 = start_game_obj
  L1_137()
  L1_137 = true
  return L1_137
end
function sm48_CreateGrabPiller(A0_140, A1_141)
  print("name = " .. A0_140)
  _grab_piller[A0_140] = Fn_createGimmickBg(A1_141, A0_140, "pi_grab_piller_01")
  _grab_piller[A0_140]:setIgnoreGrab(false)
  _grab_piller[A0_140]:setActive(true)
  return _grab_piller[A0_140]
end
function sm48_FinalBoxGroup()
  local L0_142, L1_143, L2_144, L3_145, L4_146
  for L3_145, L4_146 in L0_142(L1_143) do
    sm48_ReleaseGrabPiller(L4_146)
  end
end
function sm48_ReleaseGrabPiller(A0_147)
  if A0_147 ~= nil then
    if A0_147:isGrabbed() then
      A0_147:setGrabReleaseForce(true)
    end
    if A0_147:getDynamicObject() ~= nil then
      A0_147:getDynamicObject():try_term()
    end
    A0_147:try_term()
    A0_147 = nil
  end
end
function setHomingTargetEnemyMarker(A0_148, A1_149)
  if findGameObject2("EnemyBrain", A0_148) ~= nil then
    findGameObject2("EnemyBrain", A0_148):setEnableHomingTarget(A1_149)
    findGameObject2("EnemyBrain", A0_148):setVisibleEnemyMarker(A1_149)
  end
end
function setHomingTargetEnemyMarker_JammerLesercannon(A0_150)
  setHomingTargetEnemyMarker("_lasercannon_01", A0_150)
  setHomingTargetEnemyMarker("_jammer_01", A0_150)
  setHomingTargetEnemyMarker("_jammer_02", A0_150)
  setHomingTargetEnemyMarker("_jammer_03", A0_150)
  setHomingTargetEnemyMarker("_jammer_04", A0_150)
end
function createJemForJammerBattle()
  local L0_151, L1_152, L2_153, L3_154, L4_155, L5_156, L6_157
  L0_151 = 1
  while true do
    L1_152 = "vital_gem_for_jammer_battle_"
    L1_152 = L1_152 .. L2_153
    L5_156 = L2_153
    if L3_154 ~= nil then
      L5_156 = L1_152
      L6_157 = GEM_TYPE_HP_RECOVERY
      L3_154[L0_151] = L4_155
      L0_151 = L0_151 + 1
      L5_156 = "[ node : "
      L6_157 = L2_153
      L3_154(L4_155)
    end
  end
  L1_152 = Fn_findAreaHandle
  L1_152 = L1_152(L2_153)
  for L5_156, L6_157 in L2_153(L3_154) do
    L1_152:appendChild(L6_157, true)
  end
end
function releaseJemForJammerBattle()
  for _FORV_3_, _FORV_4_ in ipairs(_hdl_gem) do
    if _hdl_gem[_FORV_3_] ~= nil then
      _hdl_gem[_FORV_3_]:try_term()
      _hdl_gem[_FORV_3_] = nil
    end
  end
end
function sdemoKitAppearance()
  local L0_158, L1_159, L2_160, L3_161, L4_162, L5_163, L6_164, L7_165
  L0_158 = 1
  L1_159 = 3
  L2_160 = 2
  L3_161 = L0_158 + L2_160
  L3_161 = L3_161 - 0.5
  L4_162 = 2
  L5_163 = Fn_findAreaHandle
  L6_164 = "pi_a_23"
  L5_163 = L5_163(L6_164)
  L7_165 = L5_163
  L6_164 = L5_163.setDriftEnable
  L6_164(L7_165, false)
  L6_164 = Fn_createEffect
  L7_165 = "ef_ev_bkinout01"
  L6_164 = L6_164(L7_165, "ef_ev_bkinout01", findGameObject2("Node", "locator2_gravity_storm_01"), "initonly")
  L7_165 = Fn_userCtrlAllOff
  L7_165()
  L7_165 = _sdemo
  L7_165 = L7_165.reset
  L7_165(L7_165)
  L7_165 = _sdemo
  L7_165 = L7_165.set
  L7_165(L7_165, "locator2_sdemo_kit_appearance_cam_01", "locator2_sdemo_kit_appearance_aim_01", false, Vector(0, 0, 0))
  L7_165 = _sdemo
  L7_165 = L7_165.play
  L7_165(L7_165)
  L7_165 = Sound
  L7_165 = L7_165.playSEHandle
  L7_165 = L7_165(L7_165, "ep21_storm", 2, "")
  Fn_missionStart()
  Fn_startEffect(L6_164)
  Fn_resetPcPos("locator2_pc_start_pos", Player.kReset_Falling)
  waitSeconds(0.3)
  Sound:stopSEHandle(L7_165)
  waitSeconds(0.4)
  _sdemo:play({
    {
      time = L0_158,
      pos = "locator2_sdemo_kit_appearance_cam_02",
      hashfunc = "Liner"
    }
  }, {
    {
      time = L0_158,
      pos = "locator2_sdemo_kit_appearance_aim_02",
      hashfunc = "EaseInOut"
    }
  })
  waitSeconds(2)
  _sdemo:stop(1)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm48_00400k")
  L5_163:setDriftEnable(true)
  Fn_userCtrlOn()
end
function sdemoKitInGravityStorm()
  local L0_166, L1_167, L2_168, L3_169, L4_170, L5_171, L6_172, L7_173
  L0_166 = Fn_userCtrlAllOff
  L0_166()
  L0_166 = _puppet_task
  L0_166 = L0_166._gurigo
  if L0_166 ~= nil then
    L0_166 = _puppet_task
    L0_166 = L0_166._gurigo
    L1_167 = L0_166
    L0_166 = L0_166.abort
    L0_166(L1_167)
    L0_166 = _puppet_task
    L0_166._gurigo = nil
    L0_166 = wait
    L0_166()
  end
  L0_166 = Fn_findNpc
  L1_167 = "_gurigo"
  L0_166 = L0_166(L1_167)
  L1_167 = L0_166
  L0_166 = L0_166.reset
  L0_166(L1_167)
  L0_166 = Sound
  L1_167 = L0_166
  L0_166 = L0_166.playSEHandle
  L2_168 = "ene_bot_stay"
  L3_169 = 1
  L4_170 = ""
  L5_171 = _puppets
  L5_171 = L5_171._gurigo
  L0_166 = L0_166(L1_167, L2_168, L3_169, L4_170, L5_171)
  L1_167 = Fn_blackout
  L1_167()
  L1_167 = Fn_captionViewEnd
  L1_167()
  L1_167 = RAC_MultiNaviClear
  L1_167()
  L1_167 = Fn_resetPcPos
  L2_168 = "locator2_sdemo_pc_01"
  L1_167(L2_168)
  L1_167 = Fn_playMotionNpc
  L2_168 = "_gurigo"
  L3_169 = "stay"
  L4_170 = false
  L1_167(L2_168, L3_169, L4_170)
  L1_167 = Fn_setNpcActive
  L2_168 = "_gurigo"
  L3_169 = true
  L1_167(L2_168, L3_169)
  L1_167 = Fn_warpNpc
  L2_168 = "_gurigo"
  L3_169 = "locator2_sdemo_gurigo_move01"
  L1_167(L2_168, L3_169)
  L1_167 = _sdemo
  L2_168 = L1_167
  L1_167 = L1_167.reset
  L1_167(L2_168)
  L1_167 = _sdemo
  L2_168 = L1_167
  L1_167 = L1_167.set
  L3_169 = "locator2_sdemo_kit_in_gravity_cam_01"
  L4_170 = "locator2_sdemo_kit_in_gravity_aim_01"
  L5_171 = false
  L6_172 = Vector
  L7_173 = 0
  L7_173 = L6_172(L7_173, 0, 0)
  L1_167(L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L6_172(L7_173, 0, 0))
  L1_167 = _sdemo
  L2_168 = L1_167
  L1_167 = L1_167.play
  L1_167(L2_168)
  L1_167 = Fn_fadein
  L1_167()
  L1_167 = Fn_captionView
  L2_168 = "sm48_03037"
  L1_167(L2_168)
  L1_167 = Sound
  L2_168 = L1_167
  L1_167 = L1_167.stopSEHandle
  L3_169 = L0_166
  L1_167(L2_168, L3_169)
  L1_167 = _puppet_task
  L2_168 = RAC_invokeMoveCharaTask
  L3_169 = "_gurigo"
  L4_170 = "locator2_sdemo_gurigo_move"
  L5_171 = {}
  L5_171.arrivedLength = 0.1
  L5_171.runLength = -1
  L5_171.anim_run_speed = 1
  L5_171.anim_speed_over = true
  L5_171.navimesh = false
  L5_171.loop = false
  L2_168 = L2_168(L3_169, L4_170, L5_171)
  L1_167._gurigo = L2_168
  L1_167 = Sound
  L2_168 = L1_167
  L1_167 = L1_167.playSEHandle
  L3_169 = "ene_bot_move"
  L4_170 = 1
  L5_171 = ""
  L6_172 = _puppets
  L6_172 = L6_172._gurigo
  L1_167 = L1_167(L2_168, L3_169, L4_170, L5_171, L6_172)
  while true do
    L2_168 = _puppet_task
    L2_168 = L2_168._gurigo
    L3_169 = L2_168
    L2_168 = L2_168.isRunning
    L2_168 = L2_168(L3_169)
    if L2_168 then
      L2_168 = wait
      L2_168()
    end
  end
  L2_168 = Fn_turnNpc
  L3_169 = "_gurigo"
  L2_168(L3_169)
  L2_168 = Sound
  L3_169 = L2_168
  L2_168 = L2_168.stopSEHandle
  L4_170 = L1_167
  L2_168(L3_169, L4_170)
  L2_168 = Sound
  L3_169 = L2_168
  L2_168 = L2_168.playSEHandle
  L4_170 = "ene_bot_vo_call_nevi"
  L5_171 = 1
  L6_172 = ""
  L7_173 = _puppets
  L7_173 = L7_173._gurigo
  L2_168(L3_169, L4_170, L5_171, L6_172, L7_173)
  L2_168 = Fn_captionViewWait
  L3_169 = "sm48_03032"
  L2_168(L3_169)
  L2_168 = Fn_captionView
  L3_169 = "sm48_03040"
  L2_168(L3_169)
  L2_168 = findGameObject2
  L3_169 = "Node"
  L4_170 = "locator2_gravity_storm_02"
  L2_168 = L2_168(L3_169, L4_170)
  L3_169 = Player
  L4_170 = L3_169
  L3_169 = L3_169.setLookAtIk
  L5_171 = true
  L6_172 = 1
  L7_173 = L2_168.getWorldPos
  L7_173 = L7_173(L2_168)
  L3_169(L4_170, L5_171, L6_172, L7_173, L7_173(L2_168))
  L3_169 = waitSeconds
  L4_170 = 1
  L3_169(L4_170)
  L3_169 = {L4_170}
  L4_170 = {}
  L4_170.pos = "locator2_sdemo_kit_in_gravity_cam_02"
  L4_170.time = 1.5
  L4_170 = {L5_171, L6_172}
  L5_171 = {}
  L5_171.pos = "locator2_sdemo_kit_in_gravity_aim_02"
  L5_171.time = 1.3
  L6_172 = {}
  L6_172.pos = "locator2_sdemo_kit_in_gravity_aim_03"
  L6_172.time = 1.2
  L6_172.hashfunc = "EaseInOut"
  L5_171 = Sound
  L6_172 = L5_171
  L5_171 = L5_171.playSEHandle
  L7_173 = "storm_inside"
  L5_171 = L5_171(L6_172, L7_173, 1, "")
  L6_172 = RAC_createEffect
  L7_173 = {}
  L7_173.eff_name = "ef_ev_bkinout02"
  L7_173.time = GATE_EFFECT_TIME
  L7_173.parent_hdl = L2_168
  L6_172 = L6_172(L7_173)
  L7_173 = _sdemo
  L7_173 = L7_173.play
  L7_173(L7_173, L3_169, L4_170)
  L7_173 = waitSeconds
  L7_173(1.5)
  L7_173 = Fn_captionView
  L7_173("sm48_03039", 3, Font.kLayerFront)
  L7_173 = invokeTask
  L7_173(function()
    local L0_174
    while true do
      L0_174 = L2_168
      L0_174 = L0_174.getWorldPos
      L0_174 = L0_174(L0_174)
      Vector(0, 0, 0).x = (Fn_getPlayerWorldPos().x - L0_174.x) / 30
      Vector(0, 0, 0).y = (Fn_getPlayerWorldPos().y - L0_174.y) / 30
      Vector(0, 0, 0).z = (Fn_getPlayerWorldPos().z - L0_174.z) / 30
      L0_174 = L0_174 + Vector(0, 0, 0)
      L2_168:setWorldPos(L0_174)
      wait()
      if not (Fn_getDistanceToPlayer(L2_168) < 1) then
      end
    end
  end)
  L7_173 = waitSeconds
  L7_173(2)
  L7_173 = Sound
  L7_173 = L7_173.stopSEHandle
  L7_173(L7_173, L5_171)
  L7_173 = Sound
  L7_173 = L7_173.playSEHandle
  L7_173 = L7_173(L7_173, "ep21_storm", 2, "")
  waitSeconds(0.5)
  Fn_captionViewEnd()
  Fn_blackout()
  _sdemo:stop(0)
  Sound:stopSEHandle(L7_173)
  Fn_disappearNpc("_gurigo")
  if L6_172 ~= nil then
    L6_172:abort()
    L6_172 = nil
  end
end
function StopDetectSe()
  if _detect_se_handle ~= nil then
    print("\227\130\187\227\131\179\227\130\181\227\131\188SE\229\129\156\230\173\162")
    Sound:stopSEHandle(_detect_se_handle)
    _detect_se_handle = nil
  end
end
function SetDriftsDestroyOnlyPlayer()
  for _FORV_3_, _FORV_4_ in ipairs(_driftsWork) do
    _FORV_4_.hdl:setEventFilter(1)
    if _FORV_4_.hdlChilds then
      for _FORV_8_, _FORV_9_ in ipairs(_FORV_4_.hdlChilds) do
        _FORV_9_:setEventFilter(1)
      end
    end
  end
end
function captionViewWaitDrifts(A0_175, A1_176)
  if not _driftsWork[A0_175].isEnd then
    Fn_captionViewWait(A1_176)
  end
end
function captionViewDrifts(A0_177, A1_178)
  if not _driftsWork[A0_177].isEnd then
    Fn_captionView(A1_178)
  end
end
function WaitDriftBroken(A0_179)
  while not _driftsWork[A0_179].hdl:isBroken() do
    wait()
  end
  while true do
    if _driftsWork[A0_179].hdlChilds then
      for _FORV_5_, _FORV_6_ in ipairs(_driftsWork[A0_179].hdlChilds) do
        if not _FORV_6_:isBroken() then
          break
        end
      end
    end
    if not false then
      wait()
    end
  end
end
