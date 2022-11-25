import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm48_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/bgset/bg_crane_ship_param.lua")
dofile("/Game/Event2/bgset/bg_cage_param.lua")
mine_name = "sm48_c_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_captionWait = 0
CAPTION_TIMER = 150
GATE_DIVE_DISTANCE = 50
ENEMY_MARKER_ACTIVE_DISTANCE = 30
MULTI_NAVI_MAX = 5
MULTI_NAVI_VALID_DIST = 5
QUATER_TARGET = 1
HALF_TARGET1 = 0.73
HALF_TARGET2 = 0.46
HALF_TARGET3 = 0.33
FULL_TARGET = 0.2
NO_TARGET = 0
DISTANCE_NEAR = 20
DISTANCE_EVENT01 = 150
DISTANCE_EVENT02 = 100
_naviWait = 0
NAVI_WAIT_TIME_QUARTER = 20
NAVI_WAIT_TIME_HALF1 = 40
NAVI_WAIT_TIME_HALF2 = 60
NAVI_WAIT_TIME_HALF3 = 80
NAVI_WAIT_TIME = 100
DRIFT_BENCH = 1
DRIFT_ANTENNA = 2
DRIFT_POT = 3
DRIFT_WOODBOX = 4
DRIFT_MAX = DRIFT_WOODBOX
NEXT_SENSOR_NONE = 0
NEXT_SENSOR_ANTENA = 1
NEXT_SENSOR_POT = 2
NEXT_SENSOR_WOODBOX = 3
SENSOR_WAKE_DRIFT_BROKEN = 1
SENSOR_WAKE_DRIFT_BROKEN_NEVI_KILL = 2
SENSOR_WAKE_KAIWA_DEMO_END = 3
SENSOR_WAKE_NEVI_KILL = 4
GRAVITY_STORM_WAKE_CNT = 3
NAIV_DEL_IN_SENSOR_DISTANCE = 5
_driftsWork = {}
RAYCAST_SEARCH_RANGE = 50
RAYCAST_SEARCH_ANGLE = 60
DRIFT_FOUND_WAIT = 1
STORM_SE_INSIDE = 1
STORM_SE_NORMAL = 2
STORM_SE_FAR = 3
STORM_SE_INSIDE_DISTANCE = 20
STORM_SE_NORMAL_DISTANCE = 50
_dummyObj = {}
_isGravityStorm = false
_driftClearCnt = 0
_isCaptionLock = false
_isFirstDriftDiscovery = false
_nextSensorIndexTbl = {}
_helpCaptionTask = nil
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
_detect_se_handle = nil
_detectDis = nil
_gravityStormSeTask = nil
_in_gravity_storm = false
enmgen2_nevi_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_01",
      name = "nevi_01_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_02",
      name = "nevi_01_02"
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
enmgen2_nevi_02 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_01",
      name = "nevi_02_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_02",
      name = "nevi_02_02"
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
enmgen2_nevi_03 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_01",
      name = "nevi_03_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_02",
      name = "nevi_03_02"
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
_driftAntenna_enemySpawnNum = 0
enmgen2_drift_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_01",
      name = "drift_02_nevi_01"
    },
    {
      type = "imp_strong",
      locator = "locator_02",
      name = "drift_02_nevi_02"
    },
    {
      type = "imp",
      locator = "locator_03",
      name = "drift_02_nevi_03"
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
  onObjectAsh = function(A0_44, A1_45)
  end,
  onSpawn = function(A0_46, A1_47)
    _driftAntenna_enemySpawnNum = _driftAntenna_enemySpawnNum + 1
    if _driftAntenna_enemySpawnNum ~= #A0_46:getSpecTable().spawnSet + 1 or not _driftsWork[DRIFT_ANTENNA].isEnd and _driftsWork[DRIFT_ANTENNA].isSensorInPlayer then
    else
      _driftAntenna_enemySpawnNum = #A0_46:getSpecTable().spawnSet
    end
  end
}
enmgen2_drift_03 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon_strong",
      locator = "locator_01",
      name = "drift_03_nevi_01"
    },
    {
      type = "treecannon",
      locator = "locator_02",
      name = "drift_03_nevi_02"
    },
    {
      type = "treecannon",
      locator = "locator_03",
      name = "drift_03_nevi_03"
    }
  },
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onObjectDead = function(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onSpawn = function(A0_58, A1_59)
  end,
  onSetupGem = function(A0_60, A1_61)
    Fn_enemyPopGemSetup(A0_60, {
      "drift_03_nevi_01",
      "drift_03_nevi_02",
      "drift_03_nevi_03"
    }, 3, GEM_VITAL)
  end,
  onPopGem = function(A0_62, A1_63)
    Fn_enemyAshPopGem(A0_62, A1_63)
  end
}
enmgen2_drift_04 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "drift_04_nevi_01",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "drift_04_nevi_02",
      ai_spawn_option = "Stalker/Stalker_Hide"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "drift_04_nevi_03",
      ai_spawn_option = "Stalker/Stalker_Hide"
    }
  },
  onUpdate = function(A0_64)
    local L1_65
  end,
  onEnter = function(A0_66)
    local L1_67
  end,
  onLeave = function(A0_68)
    local L1_69
  end,
  onObjectDead = function(A0_70, A1_71)
  end,
  onObjectAsh = function(A0_72, A1_73)
  end,
  onSpawn = function(A0_74, A1_75)
  end
}
function Initialize()
  local L0_76, L1_77, L2_78, L3_79, L4_80, L5_81, L6_82, L7_83, L8_84, L9_85, L10_86
  L0_76 = Fn_sendBulkMineSetupRun
  L0_76(L1_77, L2_78, L3_79)
  L0_76 = Fn_sendMineSetupCallBrokenGravityOre
  L0_76(L1_77)
  L0_76 = InitializeDriftsWork
  L0_76()
  L0_76 = Fn_setNpcActive
  L0_76(L1_77, L2_78)
  L0_76 = HUD
  L0_76 = L0_76.enemymarkerSetRange
  L0_76(L1_77, L2_78)
  L0_76 = {
    L1_77,
    L2_78,
    L3_79,
    L4_80
  }
  L4_80 = "woodbox_kk_01"
  for L4_80 = 1, DRIFT_MAX do
    L5_81 = _driftsWork
    L5_81 = L5_81[L4_80]
    L9_85 = "%02d"
    L10_86 = L4_80
    L9_85 = string
    L9_85 = L9_85.format
    L10_86 = "%02d"
    L9_85 = L9_85(L10_86, L4_80)
    L9_85 = L0_76[L4_80]
    L10_86 = true
    L5_81.hdl = L6_82
    L5_81 = _driftsWork
    L5_81 = L5_81[L4_80]
    L5_81 = L5_81.hdl
    L5_81 = L5_81.setIgnoreGrab
    L5_81(L6_82, L7_83)
    L5_81 = _driftsWork
    L5_81 = L5_81[L4_80]
    L5_81 = L5_81.hdl
    L5_81 = L5_81.setActive
    L5_81(L6_82, L7_83)
    L5_81 = DRIFT_POT
    if L4_80 ~= L5_81 then
      L5_81 = DRIFT_BENCH
    elseif L4_80 == L5_81 then
      L5_81 = _driftsWork
      L5_81 = L5_81[L4_80]
      L5_81 = L5_81.hdl
      L5_81 = L5_81.setMoveThreshold
      L5_81(L6_82, L7_83)
      L5_81 = _driftsWork
      L5_81 = L5_81[L4_80]
      L5_81 = L5_81.hdl
      L5_81 = L5_81.setEventListener
      L5_81(L6_82, L7_83, L8_84)
      L5_81 = _driftsWork
      L5_81 = L5_81[L4_80]
      L5_81 = L5_81.hdl
      L5_81 = L5_81.setEventListener
      L5_81(L6_82, L7_83, L8_84)
      L5_81 = _driftsWork
      L5_81 = L5_81[L4_80]
      L5_81 = L5_81.hdl
      L5_81 = L5_81.setEventListener
      L5_81(L6_82, L7_83, L8_84)
    end
    L5_81 = DRIFT_WOODBOX
    if L4_80 == L5_81 then
      L5_81 = {
        L6_82,
        L7_83,
        L8_84,
        L9_85
      }
      L6_82.name = "woodbox_kk_01"
      L6_82.isBrokenJem = true
      L6_82.gemType = L7_83
      L7_83.name = "woodbox_kk_01"
      L7_83.isBrokenJem = true
      L7_83.gemType = L8_84
      L8_84.name = "woodbox_kk_01"
      L8_84.isBrokenJem = true
      L9_85 = GEM_VITAL
      L8_84.gemType = L9_85
      L9_85 = {}
      L9_85.name = "woodbox_kk_01"
      L9_85.isBrokenJem = true
      L10_86 = GEM_S
      L9_85.gemType = L10_86
      for L9_85 = 1, #L5_81 do
        L10_86 = "locator2_drift_04_dummy_"
        L10_86 = L10_86 .. string.format("%02d", L9_85)
        _dummyObj[L9_85] = {
          hdl = nil,
          isBrokenJem = false,
          gemType = 0,
          locateName = "",
          isEnd = false
        }
        _dummyObj[L9_85].hdl = Fn_createGimmickBg(L10_86, "drift_04_dummy_" .. string.format("%02d", L9_85), L5_81[L9_85].name, true)
        _dummyObj[L9_85].hdl:setIgnoreGrab(true)
        _dummyObj[L9_85].hdl:setActive(true)
        _dummyObj[L9_85].node = findGameObject2("Node", L10_86)
        _dummyObj[L9_85].isBrokenJem = L5_81[L9_85].isBrokenJem
        _dummyObj[L9_85].gemType = L5_81[L9_85].gemType
        _dummyObj[L9_85].locateName = L10_86
        _dummyObj[L9_85].isEnd = false
      end
    end
  end
  L4_80 = "locator2_vital_gem_01"
  L4_80 = GEM_VITAL
  L5_81 = "locator2_vital_gem_02"
  L4_80 = "vital_gem_02"
  L5_81 = GEM_VITAL
  L4_80 = Fn_findAreaHandle
  L5_81 = "pi_a_25"
  L4_80 = L4_80(L5_81)
  L5_81 = L4_80
  L4_80 = L4_80.appendChild
  L4_80(L5_81, L6_82, L7_83)
  L4_80 = Fn_findAreaHandle
  L5_81 = "pi_a_06_02"
  L4_80 = L4_80(L5_81)
  L5_81 = L4_80
  L4_80 = L4_80.appendChild
  L4_80(L5_81, L6_82, L7_83)
  L4_80 = Fn_findAreaHandle
  L5_81 = "pi_a_03_03"
  L4_80 = L4_80(L5_81)
  L5_81 = L4_80
  L4_80 = L4_80.appendChild
  L4_80(L5_81, L6_82, L7_83)
  L4_80 = RAC_startCatWarpControl
  L5_81 = "sm48_c_area_out"
  L9_85 = "locator2_pc_cat_warp_pos"
  L10_86 = "locator2_pc_cat_warp_pos"
  L4_80(L5_81, L6_82, L7_83, L8_84, L9_85, L10_86, "locator2_pc_cat_warp_pos", "sm48_02001")
  _isFirstDriftDiscovery = false
  repeat
    L4_80 = wait
    L4_80()
    L4_80 = Fn_sendIsRunMine
    L4_80 = L4_80()
  until L4_80
end
function createJemGiveWhenWoodBoxBrokenInvokeTask()
  _createJemGiveWhenWoodBoxBrokenTask = invokeTask(function()
    local L0_87, L1_88, L2_89, L3_90, L4_91, L5_92, L6_93, L7_94
    L0_87 = Fn_findAreaHandle
    L0_87 = L0_87(L1_88)
    while true do
      for L4_91, L5_92 in L1_88(L2_89) do
        L6_93 = L5_92.isEnd
        if L6_93 == false then
          L6_93 = L5_92.isBrokenJem
          if L6_93 then
            L6_93 = L5_92.hdl
            L7_94 = L6_93
            L6_93 = L6_93.isBroken
            L6_93 = L6_93(L7_94)
            if L6_93 then
              L6_93 = L5_92.hdl
              L7_94 = L6_93
              L6_93 = L6_93.getDynamicObject
              L6_93 = L6_93(L7_94)
              if L6_93 == nil then
                L7_94 = findGameObject2
                L7_94 = L7_94("Node", L5_92.locateName)
                L6_93 = L7_94
              end
              L7_94 = RAC_createGemWait
              L7_94 = L7_94(L5_92.locateName, L5_92.gemType, L6_93, 0.7)
              if L7_94 ~= nil then
                L0_87:appendChild(L7_94, true)
              end
              _dummyObj[L4_91].isEnd = true
            end
          end
        end
      end
      L1_88()
    end
  end)
end
function InitializeDriftsWork()
  local L0_95
  L0_95 = _driftsWork
  L0_95[DRIFT_BENCH] = {
    hdl = nil,
    name = "DRIFT_BENCH",
    isSensorResponse = true,
    isNaviDelInSensor = false,
    targetState = NO_TARGET,
    sensorWakeType = SENSOR_WAKE_KAIWA_DEMO_END,
    enemyGenerator = nil,
    isEnd = false,
    isBroken = false,
    isEnemyGenerate = false,
    isSensorInPlayer = false,
    eventWakeTask = nil,
    isEventWake = false,
    hdlNodeForRaycast = findGameObject2("Node", "locator2_drift_01_for_raycast"),
    hdlNodeForCatWarp = findGameObject2("Node", "locator2_pc_cat_warp_pos"),
    isKaiwaDemoEnd = false,
    hdlNaviSensor = nil,
    naviAddControlTask = nil,
    hdlDynamicMultiNavi = nil
  }
  L0_95 = _driftsWork
  L0_95[DRIFT_ANTENNA] = {
    hdl = nil,
    name = "DRIFT_ANTENNA",
    isSensorResponse = false,
    isNaviDelInSensor = false,
    targetState = NO_TARGET,
    sensorWakeType = SENSOR_WAKE_DRIFT_BROKEN,
    enemyGenerator = nil,
    isEnd = false,
    isBroken = false,
    isEnemyGenerate = false,
    isSensorInPlayer = false,
    eventWakeTask = nil,
    isEventWake = false,
    hdlNodeForRaycast = findGameObject2("Node", "locator2_drift_02_for_raycast"),
    hdlNodeForCatWarp = findGameObject2("Node", "locator2_drift_02_catwarp"),
    isKaiwaDemoEnd = false,
    hdlNaviSensor = nil,
    naviAddControlTask = nil,
    hdlDynamicMultiNavi = nil
  }
  L0_95 = _driftsWork
  L0_95[DRIFT_POT] = {
    hdl = nil,
    name = "DRIFT_POT",
    isSensorResponse = false,
    isNaviDelInSensor = false,
    targetState = NO_TARGET,
    sensorWakeType = SENSOR_WAKE_NEVI_KILL,
    enemyGenerator = nil,
    isEnd = false,
    isBroken = false,
    isEnemyGenerate = false,
    isSensorInPlayer = false,
    eventWakeTask = nil,
    isEventWake = false,
    hdlNodeForRaycast = findGameObject2("Node", "locator2_drift_03_for_raycast"),
    hdlNodeForCatWarp = findGameObject2("Node", "locator2_drift_03_catwarp"),
    isKaiwaDemoEnd = false,
    hdlNaviSensor = nil,
    naviAddControlTask = nil,
    hdlDynamicMultiNavi = nil
  }
  L0_95 = _driftsWork
  L0_95[DRIFT_WOODBOX] = {
    hdl = nil,
    name = "DRIFT_WOODBOX",
    isSensorResponse = false,
    isNaviDelInSensor = true,
    targetState = NO_TARGET,
    sensorWakeType = SENSOR_WAKE_DRIFT_BROKEN_NEVI_KILL,
    enemyGenerator = nil,
    isEnd = false,
    isBroken = false,
    isEnemyGenerate = false,
    isSensorInPlayer = false,
    eventWakeTask = nil,
    isEventWake = false,
    hdlNodeForRaycast = findGameObject2("Node", "locator2_drift_04_for_raycast"),
    hdlNodeForCatWarp = findGameObject2("Node", "locator2_drift_04_catwarp"),
    isKaiwaDemoEnd = false,
    hdlNaviSensor = findGameObject2("Node", "locator2_drift_04"),
    naviAddControlTask = nil,
    hdlDynamicMultiNavi = nil
  }
  L0_95 = {
    "DRIFT_BENCH",
    "DRIFT_ANTENNA",
    "DRIFT_POT",
    "DRIFT_WOODBOX"
  }
  _nextSensorIndexTbl = L0_95
end
function Ingame()
  local L0_96, L1_97
  L0_96 = Fn_setCrewActive
  L1_97 = false
  L0_96(L1_97)
  L0_96 = Fn_setMineGravityStorm
  L0_96()
  L0_96 = Fn_warpCageMineArea
  L0_96()
  L0_96 = SetDriftsDestroyOnlyPlayer
  L0_96()
  L0_96 = createJemGiveWhenWoodBoxBrokenInvokeTask
  L0_96()
  L0_96 = createGravityStormSePlayInvokeTask
  L0_96()
  L0_96 = Fn_findAreaHandle
  L1_97 = "pi_a_01"
  L0_96 = L0_96(L1_97)
  L1_97 = L0_96.setDriftEnable
  L1_97(L0_96, false)
  L1_97 = Fn_missionStart
  L1_97()
  L1_97 = Fn_waitCageMoveEnd
  L1_97()
  L1_97 = Fn_setCageMoveSkip
  L1_97(false)
  L1_97 = Fn_userCtrlOn
  L1_97()
  L1_97 = Fn_kaiwaDemoView
  L1_97("sm48_00300k")
  L1_97 = Fn_missionView
  L1_97("sm48_02002")
  L1_97 = detectGame
  L1_97()
  L1_97 = findGameObject2
  L1_97 = L1_97("Node", "locator2_gravity_storm_01")
  while RAC_RaycastEyeSight(L1_97, GATE_DIVE_DISTANCE) == false do
    wait()
  end
  Fn_kaiwaDemoView("sm48_00320k")
  Fn_missionView("sm48_02003")
  Fn_userCtrlOn()
  Fn_pcSensorOn("pccubesensor2_gravity_storm")
  while _in_gravity_storm == false do
    wait()
  end
  Fn_userCtrlAllOff()
  Player:setGravityControlMode(true)
  Camera:lookTo(L1_97:getWorldPos(), 0.5, 0.5)
  Fn_blackout(0.5)
  StopDetectSe()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  StopDetectSe()
  RAC_endCatWarpControl("sm48_c_area_out")
  if _gravityStormSeTask then
    _gravityStormSeTask:abort()
    _gravityStormSeTask = nil
  end
  if _createJemGiveWhenWoodBoxBrokenTask then
    _createJemGiveWhenWoodBoxBrokenTask:abort()
    _createJemGiveWhenWoodBoxBrokenTask = nil
  end
  for _FORV_3_, _FORV_4_ in ipairs(_driftsWork) do
    if _FORV_4_.naviAddControlTask then
      _FORV_4_.naviAddControlTask:abort()
      _FORV_4_.naviAddControlTask = nil
    end
  end
  HUD:enemymarkerSetRange()
end
function onOreBroken(A0_98)
  print("\233\137\177\231\159\179\231\160\180\229\163\138.." .. A0_98:getName())
end
function pccubesensor2_gravity_storm_OnEnter(A0_99)
  _in_gravity_storm = true
  A0_99:setActive(false)
end
function GetDriftDiscoveryNum()
  for _FORV_4_, _FORV_5_ in ipairs(_driftsWork) do
    if _FORV_5_.isEventWake then
    end
  end
  return 0 + 1
end
function driftsWorkWakeEvent(A0_100, A1_101)
  while not RAC_RaycastEyeSight(_driftsWork[A0_100].hdlNodeForRaycast, RAYCAST_SEARCH_RANGE) do
    wait()
  end
  _driftsWork[A0_100].isEventWake = true
  Fn_pcSensorOff(A1_101)
  Player:setStay(true)
  Fn_userCtrlAllOff()
  RAC_LookAtObjectWait(_driftsWork[A0_100].hdl)
  if _isFirstDriftDiscovery == false then
    waitSeconds(DRIFT_FOUND_WAIT)
    Fn_kaiwaDemoView(({
      "sm48_00305k",
      "sm48_00306k",
      "sm48_00307k",
      "sm48_00308k"
    })[A0_100])
    if A0_100 == DRIFT_ANTENNA then
      Fn_captionView("sm48_02026")
    elseif A0_100 == DRIFT_POT then
      Fn_captionView("sm48_02027")
    elseif A0_100 == DRIFT_WOODBOX then
      Fn_captionView("sm48_02028")
    end
  end
  _isFirstDriftDiscovery = true
  _driftsWork[A0_100].isKaiwaDemoEnd = true
  Player:setStay(false)
  Fn_userCtrlOn()
  if _driftsWork[A0_100].enemyGenerator ~= nil then
    _driftsWork[A0_100].enemyGenerator:requestIdlingEnemy(false)
    _driftsWork[A0_100].enemyGenerator:setEnemyMarker(true)
  end
end
function driftsWorkTaskAbort(A0_102)
  if _driftsWork[A0_102].eventWakeTask ~= nil then
    _driftsWork[A0_102].eventWakeTask:abort()
    _driftsWork[A0_102].eventWakeTask = nil
  end
end
function pccubesensor2_drift_01_kaiwa_demo_OnEnter()
  local L0_103
  L0_103 = _driftsWork
  L0_103 = L0_103[DRIFT_BENCH]
  L0_103 = L0_103.eventWakeTask
  if L0_103 then
    return
  end
  L0_103 = _driftsWork
  L0_103 = L0_103[DRIFT_BENCH]
  L0_103 = L0_103.eventWakeTask
  if L0_103 == nil then
    L0_103 = _driftsWork
    L0_103 = L0_103[DRIFT_BENCH]
    L0_103.eventWakeTask = invokeTask(function()
      driftsWorkWakeEvent(DRIFT_BENCH, "pccubesensor2_drift_01_kaiwa_demo")
    end)
  end
end
function pccubesensor2_drift_01_kaiwa_demo_OnLeave()
  driftsWorkTaskAbort(DRIFT_BENCH)
end
function pccubesensor2_drift_01_OnEnter()
  local L0_104
  L0_104 = _driftsWork
  L0_104 = L0_104[DRIFT_BENCH]
  L0_104.isSensorInPlayer = true
end
function pccubesensor2_drift_01_OnLeave()
  local L0_105
  L0_105 = _driftsWork
  L0_105 = L0_105[DRIFT_BENCH]
  L0_105.isSensorInPlayer = false
end
function pccubesensor2_drift_02_OnEnter()
  local L0_106, L1_107
  L0_106 = _driftsWork
  L1_107 = DRIFT_ANTENNA
  L0_106 = L0_106[L1_107]
  L0_106.isSensorInPlayer = true
  L0_106 = _driftsWork
  L1_107 = DRIFT_ANTENNA
  L0_106 = L0_106[L1_107]
  L0_106 = L0_106.isEnd
  if L0_106 then
    return
  end
  L0_106 = _driftsWork
  L1_107 = DRIFT_ANTENNA
  L0_106 = L0_106[L1_107]
  L0_106.isSensorResponse = true
end
function pccubesensor2_drift_02_OnLeave()
  local L0_108
  L0_108 = _driftsWork
  L0_108 = L0_108[DRIFT_ANTENNA]
  L0_108.isSensorInPlayer = false
end
function pccubesensor2_drift_02_save_caption_OnEnter()
  if _driftsWork[DRIFT_ANTENNA].isEnd then
    return
  end
  _helpCaptionTask = setHelpCaptiontask("sm48_02000")
end
function pccubesensor2_drift_02_save_caption_OnLeave()
  if _helpCaptionTask ~= nil then
    print("_helpCaptionTask\232\167\163\230\148\190")
    _helpCaptionTask:abort()
    _helpCaptionTask = nil
  end
end
function pccubesensor2_drift_02_found_caption_OnEnter()
  local L0_109
  L0_109 = _driftsWork
  L0_109 = L0_109[DRIFT_ANTENNA]
  L0_109 = L0_109.eventWakeTask
  if L0_109 then
    return
  end
  L0_109 = _driftsWork
  L0_109 = L0_109[DRIFT_ANTENNA]
  L0_109.eventWakeTask = invokeTask(function()
    _driftsWork[DRIFT_ANTENNA].enemyGenerator = findGameObject2("EnemyGenerator", "enmgen2_drift_02")
    _driftsWork[DRIFT_ANTENNA].isEnemyGenerate = true
    driftsWorkWakeEvent(DRIFT_ANTENNA, "pccubesensor2_drift_02_found_caption")
    _driftsWork[DRIFT_ANTENNA].hdl:setLockonPermission(true)
    if GetDriftDiscoveryNum() > 1 then
      captionViewWaitDrifts(DRIFT_ANTENNA, "sm48_02006")
      captionViewWaitDrifts(DRIFT_ANTENNA, "sm48_02007")
      captionViewWaitDrifts(DRIFT_ANTENNA, "sm48_02008")
    end
  end)
end
function pccubesensor2_drift_02_found_caption_OnLeave()
  driftsWorkTaskAbort(DRIFT_ANTENNA)
end
function pccubesensor2_drift_03_OnEnter()
  local L0_110, L1_111
  L0_110 = _driftsWork
  L1_111 = DRIFT_POT
  L0_110 = L0_110[L1_111]
  L0_110.isSensorInPlayer = true
  L0_110 = _driftsWork
  L1_111 = DRIFT_POT
  L0_110 = L0_110[L1_111]
  L0_110 = L0_110.isEnd
  if L0_110 then
    return
  end
  L0_110 = _driftsWork
  L1_111 = DRIFT_POT
  L0_110 = L0_110[L1_111]
  L0_110.isSensorResponse = true
end
function pccubesensor2_drift_03_OnLeave()
  local L0_112
  L0_112 = _driftsWork
  L0_112 = L0_112[DRIFT_POT]
  L0_112.isSensorInPlayer = false
end
function pccubesensor2_drift_03_save_caption_OnEnter()
  if _driftsWork[DRIFT_POT].isEnd then
    return
  end
  _helpCaptionTask = setHelpCaptiontask("sm48_02027")
end
function pccubesensor2_drift_03_save_caption_OnLeave()
  if _helpCaptionTask ~= nil then
    print("_helpCaptionTask\232\167\163\230\148\190")
    _helpCaptionTask:abort()
    _helpCaptionTask = nil
  end
end
function pccubesensor2_drift_03_found_caption_OnEnter()
  local L0_113
  L0_113 = _driftsWork
  L0_113 = L0_113[DRIFT_POT]
  L0_113 = L0_113.eventWakeTask
  if L0_113 then
    return
  end
  L0_113 = _driftsWork
  L0_113 = L0_113[DRIFT_POT]
  L0_113.eventWakeTask = invokeTask(function()
    _driftsWork[DRIFT_POT].enemyGenerator = findGameObject2("EnemyGenerator", "enmgen2_drift_03")
    _driftsWork[DRIFT_POT].isEnemyGenerate = true
    driftsWorkWakeEvent(DRIFT_POT, "pccubesensor2_drift_03_found_caption")
    if GetDriftDiscoveryNum() > 1 then
      captionViewWaitDrifts(DRIFT_POT, "sm48_02010")
      captionViewWaitDrifts(DRIFT_POT, "sm48_02011")
      captionViewWaitDrifts(DRIFT_POT, "sm48_02012")
    end
  end)
end
function pccubesensor2_drift_03_found_caption_OnLeave()
  driftsWorkTaskAbort(DRIFT_POT)
end
function pccubesensor2_drift_04_OnEnter()
  _driftsWork[DRIFT_WOODBOX].isSensorInPlayer = true
  if _driftsWork[DRIFT_WOODBOX].isEnd then
    return
  end
  _driftsWork[DRIFT_WOODBOX].isSensorResponse = true
  invokeTask(function()
    if _driftsWork[DRIFT_WOODBOX].enemyGenerator == nil then
      _driftsWork[DRIFT_WOODBOX].enemyGenerator = findGameObject2("EnemyGenerator", "enmgen2_drift_04")
      invokeTask(function()
        while Fn_getDistanceToPlayer("enmgen2_drift_04") > 10 do
          wait()
        end
        _driftsWork[DRIFT_WOODBOX].isEnemyGenerate = true
        _driftsWork[DRIFT_WOODBOX].enemyGenerator:requestIdlingEnemy(false)
        _driftsWork[DRIFT_WOODBOX].enemyGenerator:setEnemyMarker(true)
      end)
    end
  end)
end
function pccubesensor2_drift_04_OnLeave()
  local L0_114
  L0_114 = _driftsWork
  L0_114 = L0_114[DRIFT_WOODBOX]
  L0_114.isSensorInPlayer = false
end
function pccubesensor2_drift_04_found_caption_OnEnter()
  local L0_115
  L0_115 = _driftsWork
  L0_115 = L0_115[DRIFT_WOODBOX]
  L0_115 = L0_115.eventWakeTask
  if L0_115 then
    return
  end
  L0_115 = _driftsWork
  L0_115 = L0_115[DRIFT_WOODBOX]
  L0_115.eventWakeTask = invokeTask(function()
    driftsWorkWakeEvent(DRIFT_WOODBOX, "pccubesensor2_drift_04_found_caption")
    if GetDriftDiscoveryNum() > 1 then
      captionViewWaitDrifts(DRIFT_WOODBOX, "sm48_02013")
      captionViewWaitDrifts(DRIFT_WOODBOX, "sm48_02014")
      captionViewWaitDrifts(DRIFT_WOODBOX, "sm48_02015")
      captionViewWaitDrifts(DRIFT_WOODBOX, "sm48_02029")
    end
  end)
end
function pccubesensor2_drift_04_found_caption_OnLeave()
  driftsWorkTaskAbort(DRIFT_WOODBOX)
end
function pccubesensor2_drift_04_dummy_obj_navi_OnEnter()
  local L0_116
  L0_116 = _driftsWork
  L0_116 = L0_116[DRIFT_WOODBOX]
  L0_116 = L0_116.naviAddControlTask
  if L0_116 == nil then
    L0_116 = _driftsWork
    L0_116 = L0_116[DRIFT_WOODBOX]
    L0_116.naviAddControlTask = NaviAddControlInvokeTask()
  end
end
function pccubesensor2_drift_04_dummy_obj_navi_OnLeave()
  RAC_MultiNaviClear()
  _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi = nil
  if _driftsWork[DRIFT_WOODBOX].naviAddControlTask then
    _driftsWork[DRIFT_WOODBOX].naviAddControlTask:abort()
    _driftsWork[DRIFT_WOODBOX].naviAddControlTask = nil
  end
end
function NaviAddControlInvokeTask()
  _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi = {}
  return invokeTask(function()
    local L0_117
    while true do
      L0_117 = 0
      if not _driftsWork[DRIFT_WOODBOX].hdl:isBroken() then
        L0_117 = L0_117 + 1
      end
      for _FORV_4_, _FORV_5_ in ipairs(_dummyObj) do
        if not _FORV_5_.hdl:isBroken() then
          L0_117 = L0_117 + 1
        end
      end
      if L0_117 <= MULTI_NAVI_MAX then
        if _driftsWork[DRIFT_WOODBOX].isEnd then
          RAC_MultiNaviClear()
          break
        end
        if not _driftsWork[DRIFT_WOODBOX].hdl:isBroken() then
          if Fn_getDistanceToPlayer(_driftsWork[DRIFT_WOODBOX].hdl) > MULTI_NAVI_VALID_DIST then
            if _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_driftsWork[DRIFT_WOODBOX].hdl:getName()] then
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_driftsWork[DRIFT_WOODBOX].hdl:getName()]:setActive(false)
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_driftsWork[DRIFT_WOODBOX].hdl:getName()]:del()
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_driftsWork[DRIFT_WOODBOX].hdl:getName()] = nil
            end
          else
            MULTI_NAVI_VALID_DIST = 20
            if not _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_driftsWork[DRIFT_WOODBOX].hdl:getName()] then
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_driftsWork[DRIFT_WOODBOX].hdl:getName()] = RAC_DynamicMultiNaviAdd(_driftsWork[DRIFT_WOODBOX].hdl)
            end
          end
        end
        for _FORV_5_, _FORV_6_ in ipairs(_dummyObj) do
          if Fn_getDistanceToPlayer(_FORV_6_.hdl) > MULTI_NAVI_VALID_DIST then
            if _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_FORV_6_.hdl:getName()] then
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_FORV_6_.hdl:getName()]:setActive(false)
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_FORV_6_.hdl:getName()]:del()
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_FORV_6_.hdl:getName()] = nil
            end
          else
            MULTI_NAVI_VALID_DIST = 20
            if not _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_FORV_6_.hdl:getName()] then
              _driftsWork[DRIFT_WOODBOX].hdlDynamicMultiNavi[_FORV_6_.hdl:getName()] = RAC_DynamicMultiNaviAdd(_FORV_6_.hdl)
            end
          end
        end
      end
      wait()
    end
  end)
end
function detectGame()
  local L0_118, L1_119, L2_120, L3_121, L4_122, L5_123, L6_124, L7_125, L8_126, L9_127, L10_128, L11_129
  L0_118 = NO_TARGET
  L1_119 = RAC_gaugeInit
  L2_120 = "sm48_02016"
  L3_121 = HUD
  L3_121 = L3_121.kCountType_Up
  L1_119(L2_120, L3_121, L4_122)
  L1_119 = findGameObject2
  L2_120 = "Node"
  L3_121 = "locator2_gravity_storm_01"
  L1_119 = L1_119(L2_120, L3_121)
  L2_120 = 0
  L3_121 = false
  while true do
    _naviWait = 0
    _detectDis = nil
    for L7_125, L8_126 in L4_122(L5_123) do
      if L10_128 then
        if not L10_128 then
        elseif not L10_128 then
        end
      else
        L11_129 = L10_128
        if not L10_128 then
        elseif not L10_128 then
        end
      end
      if L9_127 then
        L11_129 = UpdateSensor
        L11_129 = L11_129(L8_126.hdl, L8_126.targetState, L8_126.isNaviDelInSensor, L8_126.hdlNaviSensor)
        L10_128.targetState = L11_129
      end
    end
    L4_122()
    if L4_122 then
      if not (L4_122 >= L5_123) then
      elseif L4_122 then
        L0_118 = L4_122
        if not L4_122 then
          elseif L4_122 then
            if L4_122 == false then
              L5_123.eff_name = "ef_ev_bkinout02"
              L5_123.loop = true
              L5_123.parent_hdl = L6_124
              L4_122(L5_123)
            end
            _isGravityStorm = true
          end
          if not L4_122 then
            _captionWait = L4_122
            for L9_127, L10_128 in L6_124(L7_125) do
              L11_129 = _driftsWork
              L11_129 = L11_129[L5_123[L9_127]]
              L11_129 = L11_129.sensorWakeType
              if L11_129 ~= SENSOR_WAKE_DRIFT_BROKEN_NEVI_KILL then
                L11_129 = _driftsWork
                L11_129 = L11_129[L5_123[L9_127]]
                L11_129 = L11_129.sensorWakeType
              elseif L11_129 == SENSOR_WAKE_NEVI_KILL then
                L11_129 = findGameObject2
                L11_129 = L11_129("EnemyGenerator", L4_122[L9_127])
                if L11_129 ~= nil and 0 < L11_129:getEnemyCount() and Fn_getDistanceToPlayer(L11_129) < DISTANCE_NEAR and _naviWait < NAVI_WAIT_TIME then
                  _naviWait = NAVI_WAIT_TIME
                  _detectDis = 0
                end
              end
            end
            if L6_124 < L7_125 then
              for L9_127, L10_128 in L6_124(L7_125) do
                L11_129 = L10_128.hdl
                L11_129 = L11_129.isBroken
                L11_129 = L11_129(L11_129)
                if not L11_129 then
                  L11_129 = NAVI_WAIT_TIME
                  _naviWait = L11_129
                  _detectDis = 0
                  break
                end
              end
            end
            if L7_125 > 0 then
            else
            end
            L11_129 = L8_126(L9_127, L10_128)
            L7_125(L8_126, L9_127, L10_128, L11_129, L8_126(L9_127, L10_128))
            L2_120 = 0
            if L8_126 ~= nil then
              for L11_129, _FORV_12_ in L8_126(L9_127) do
                if _detectDis < _FORV_12_.dis then
                  L2_120 = L11_129
                  if L2_120 ~= L7_125 then
                    StopDetectSe()
                    _detect_se_handle = Sound:playSEHandle(_FORV_12_.se, _FORV_12_.vol)
                  end
                  break
                end
              end
            end
            if L2_120 == 0 then
              L8_126()
            end
            L8_126()
          end
        end
      end
  end
  L4_122()
  L4_122(L5_123, L6_124)
  L4_122(L5_123)
  L4_122(L5_123, L6_124, L7_125)
  L4_122(L5_123)
  L4_122(L5_123)
  L4_122(L5_123)
  L4_122(L5_123, L6_124)
  L4_122()
  L4_122(L5_123, L6_124)
  L4_122(L5_123, L6_124)
  L4_122()
  L4_122(L5_123, L6_124, L7_125, L8_126)
  L4_122(L5_123, L6_124)
  L4_122()
end
function StopDetectSe()
  if _detect_se_handle ~= nil then
    Sound:stopSEHandle(_detect_se_handle)
    _detect_se_handle = nil
  end
end
function UpdateDrift()
  local L0_130, L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138, L9_139
  for L3_133, L4_134 in L0_130(L1_131) do
    L5_135 = L4_134.isEnd
    if not L5_135 then
      L5_135 = L4_134.hdl
      L5_135 = L5_135.isBroken
      L5_135 = L5_135(L6_136)
      if L5_135 then
        L5_135 = RAC_MultiNaviDel
        L5_135(L6_136)
      end
      L5_135 = true
      if L6_136 == L7_137 then
        if not L6_136 then
          L5_135 = false
        end
      else
        if L6_136 ~= L7_137 then
        else
          if L6_136 == L7_137 then
            if L6_136 == L7_137 then
              if not L6_136 then
                L5_135 = false
              end
            end
            if L6_136 then
              if L6_136 then
                if L6_136 > 0 then
                  L5_135 = false
                elseif L6_136 == L7_137 then
                  L6_136(L7_137)
                end
              else
                L5_135 = false
              end
            else
              L5_135 = false
            end
        end
        elseif L6_136 == L7_137 then
          if L6_136 then
            L6_136(L7_137)
          else
            L5_135 = false
          end
        end
      end
      if not L6_136 then
        if L6_136 then
          if L3_133 == L6_136 then
            if L6_136 > 0 then
              L6_136(L7_137)
            end
          end
          L6_136.isBroken = true
        end
      end
      if L3_133 == L6_136 then
        if L6_136 then
          if L6_136 ~= nil then
            if L6_136 then
              L6_136(L7_137, L8_138)
            end
          end
        end
      end
      if L5_135 then
        for L9_139 = 1, #L7_137 do
          if _nextSensorIndexTbl[L9_139] == _driftsWork[L3_133].name then
            table.remove(_nextSensorIndexTbl, L9_139)
          end
        end
        L6_136(L7_137)
        L6_136.isSensorResponse = false
        L6_136.isEnd = true
        if L6_136 ~= nil then
          L6_136(L7_137)
          L6_136(L7_137)
          _helpCaptionTask = nil
        end
        _driftClearCnt = L6_136
        _naviWait = 0
        L9_139 = "pccubesensor2_area_out_middle"
        L6_136(L7_137, L8_138, L9_139, "pccubesensor2_area_out_long", _driftsWork[L3_133].hdlNodeForCatWarp, _driftsWork[L3_133].hdlNodeForCatWarp, _driftsWork[L3_133].hdlNodeForCatWarp, "sm48_02001")
        L6_136(L7_137)
      end
    else
    end
  end
end
function IsDriftBroken(A0_140, A1_141)
  local L2_142
  L2_142 = true
  if not A0_140:isBroken() then
    L2_142 = false
  end
  if A1_141 == DRIFT_WOODBOX then
    for _FORV_6_, _FORV_7_ in ipairs(_dummyObj) do
      if not _FORV_7_.hdl:isBroken() then
        L2_142 = false
      end
    end
  end
  return L2_142
end
function wakeSensorResponse(A0_143)
  if A0_143 == "DRIFT_ANTENNA" then
    _driftsWork[DRIFT_ANTENNA].isSensorResponse = true
    print("DRIFT_ANTENNA\232\181\183\229\139\149\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  elseif A0_143 == "DRIFT_POT" then
    _driftsWork[DRIFT_POT].isSensorResponse = true
    print("DRIFT_POT\232\181\183\229\139\149\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  elseif A0_143 == "DRIFT_WOODBOX" then
    _driftsWork[DRIFT_WOODBOX].isSensorResponse = true
    print("DRIFT_WOODBOX\232\181\183\229\139\149\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  end
end
function UpdateSensor(A0_144, A1_145, A2_146, A3_147)
  local L4_148, L5_149, L6_150, L7_151
  L4_148, L5_149 = nil, nil
  if A3_147 then
    L5_149 = A3_147
  else
    L5_149 = A0_144
  end
  L6_150 = Fn_getDistanceToPlayer
  L7_151 = L5_149
  L6_150 = L6_150(L7_151)
  L7_151 = HUD
  L7_151 = L7_151.miniGaugeSetVisible
  L7_151(L7_151, true)
  L7_151 = Debug
  L7_151 = L7_151.getSwitch
  L7_151 = L7_151(L7_151, {"Display", "Debug Draw"})
  Debug:setSwitch({"Display", "Debug Draw"}, false)
  if Fn_isInSightTarget(L5_149, FULL_TARGET) or L6_150 < DISTANCE_NEAR then
    if A1_145 ~= FULL_TARGET then
      if A2_146 then
        if L6_150 >= NAIV_DEL_IN_SENSOR_DISTANCE then
          L4_148 = RAC_MultiNaviAdd(L5_149)
        end
      else
        L4_148 = RAC_MultiNaviAdd(L5_149)
      end
      putDetectCaption(L5_149)
      A1_145 = FULL_TARGET
    end
    if _naviWait < NAVI_WAIT_TIME then
      _naviWait = NAVI_WAIT_TIME
    end
  elseif Fn_isInSightTarget(L5_149, HALF_TARGET3) then
    if _naviWait < NAVI_WAIT_TIME_HALF3 then
      _naviWait = NAVI_WAIT_TIME_HALF3
    end
  elseif Fn_isInSightTarget(L5_149, HALF_TARGET2) then
    if _naviWait < NAVI_WAIT_TIME_HALF2 then
      _naviWait = NAVI_WAIT_TIME_HALF2
    end
  elseif Fn_isInSightTarget(L5_149, HALF_TARGET1) then
    if _naviWait < NAVI_WAIT_TIME_HALF1 then
      _naviWait = NAVI_WAIT_TIME_HALF1
    end
  elseif Fn_isInSightTarget(L5_149, QUATER_TARGET) then
    if _naviWait < NAVI_WAIT_TIME_QUARTER then
      _naviWait = NAVI_WAIT_TIME_QUARTER
    end
  else
    A1_145 = NO_TARGET
  end
  Debug:setSwitch({"Display", "Debug Draw"}, L7_151)
  if A2_146 and L6_150 < NAIV_DEL_IN_SENSOR_DISTANCE then
    RAC_MultiNaviDel(L5_149)
  end
  if A1_145 == NO_TARGET and L6_150 >= DISTANCE_NEAR then
    RAC_MultiNaviDel(L5_149)
    L4_148 = nil
  end
  if _naviWait > 0 and (_detectDis == nil or L6_150 < _detectDis) then
    _detectDis = L6_150
  end
  return A1_145
end
function putDetectCaption(A0_152)
  local L1_153, L2_154
  L1_153 = _isCaptionLock
  if L1_153 then
    return
  end
  L1_153 = Fn_isCaptionView
  L1_153 = L1_153()
  if L1_153 then
    return
  end
  L1_153 = IsInvalidDetectCaption
  L1_153 = L1_153()
  if L1_153 then
    return
  end
  L1_153 = _captionWait
  if L1_153 > 0 then
    return
  end
  L1_153 = 20
  L2_154 = Fn_getDistanceToPlayer
  L2_154 = L2_154(A0_152)
  ;({})[1] = function()
    if L2_154 < L1_153 then
      Fn_captionView("sm48_02037")
    else
      Fn_captionView("sm48_02023")
    end
  end
  ;({})[2] = function()
    if L2_154 < L1_153 then
      Fn_captionView("sm48_02020")
    else
      Fn_captionView("sm48_02025")
    end
  end
  ;({})[3] = function()
    if L2_154 < L1_153 then
      Fn_captionView("sm48_02038")
    else
      Fn_captionView("sm48_02021")
    end
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
function SetDriftsDestroyOnlyPlayer()
  for _FORV_3_, _FORV_4_ in ipairs(_driftsWork) do
    _FORV_4_.hdl:setEventFilter(1)
  end
  for _FORV_3_, _FORV_4_ in ipairs(_dummyObj) do
    _FORV_4_.hdl:setEventFilter(1)
  end
end
function createGravityStormSePlayInvokeTask()
  _gravityStormSeTask = invokeTask(function()
    local L0_155, L1_156, L2_157, L3_158
    while true do
      L0_155 = _isGravityStorm
      if not L0_155 then
        L0_155 = wait
        L0_155()
      end
    end
    L0_155 = findGameObject2
    L1_156 = "Node"
    L2_157 = "locator2_gravity_storm_01"
    L0_155 = L0_155(L1_156, L2_157)
    L1_156 = nil
    L2_157 = 0
    function L3_158(A0_159, A1_160)
      if A0_159 ~= nil then
        print("\233\135\141\229\138\155\229\181\144SE\229\129\156\230\173\162")
        Sound:stopSEHandle(A0_159)
        A0_159 = nil
      end
      print(A1_160 .. "\227\130\146\229\134\141\231\148\159\233\150\139\229\167\139")
      return Sound:playSEHandle(A1_160)
    end
    while true do
      if Fn_getDistanceToPlayer(L0_155) < STORM_SE_INSIDE_DISTANCE then
        if L2_157 ~= STORM_SE_INSIDE then
          L1_156 = L3_158(L1_156, "storm_inside")
          L2_157 = STORM_SE_INSIDE
        end
      elseif Fn_getDistanceToPlayer(L0_155) < STORM_SE_NORMAL_DISTANCE then
        if L2_157 ~= STORM_SE_NORMAL then
          L1_156 = L3_158(L1_156, "storm")
          L2_157 = STORM_SE_NORMAL
        end
      elseif L2_157 ~= STORM_SE_FAR then
        L1_156 = L3_158(L1_156, "storm_far")
        L2_157 = STORM_SE_FAR
      end
      wait()
    end
  end)
end
function captionViewWaitDrifts(A0_161, A1_162)
  if not _driftsWork[A0_161].isEnd then
    Fn_captionViewWait(A1_162)
  end
end
function GetDriftDiscoveryNum()
  for _FORV_4_, _FORV_5_ in ipairs(_driftsWork) do
    if _FORV_5_.isKaiwaDemoEnd then
    end
  end
  return 0 + 1
end
function GetstartGravityStormNum()
  for _FORV_4_, _FORV_5_ in ipairs(_driftsWork) do
    if _FORV_5_.isEnd then
    end
  end
  return 0 + 1
end
function IsGravityStormWake()
  if GetDriftDiscoveryNum() > 0 then
    return true
  else
    return false
  end
end
function setHelpCaptiontask(A0_163)
  if _helpCaptionTask ~= nil then
    _helpCaptionTask:abort()
    _helpCaptionTask = nil
  end
  return invokeTask(function()
    print("\230\149\145\230\184\136\227\130\191\227\130\185\227\130\175\232\181\183\229\139\149")
    while true do
      waitSeconds(30)
      Fn_captionViewWait(A0_163)
      wait()
    end
  end)
end
function judge_callback(A0_164, A1_165, A2_166, A3_167)
  print("judge:" .. A1_165 .. "=" .. A2_166)
  if A3_167:getName() ~= nil then
    print("  sender:" .. A3_167:getName())
  else
    print("  sender: not named")
  end
  return 0
end
function damage_callback(A0_168, A1_169)
  print("judge:" .. A1_169)
end
