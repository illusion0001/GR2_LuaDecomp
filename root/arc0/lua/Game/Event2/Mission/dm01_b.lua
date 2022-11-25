dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm01_common.lua")
import("Camera")
_isArrived = false
_isSky = false
_isArrivedMachine02 = false
_isArrivedMachine03 = false
_isArrivedMachine04 = false
_sdemo3 = nil
_sdemo4 = nil
_sdemo5 = nil
_sdemo7 = nil
ENEMY_MARKER_ACTIVE_DISTANCE = 20
_puppet_tbl = {}
_cat_warp_caption = "dm01_09003"
_cat_warp_return_point = "locator2_pc_start_pos"
_cat_warp_navi = nil
enmgen2_nevi_02a = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_01",
      name = "pawn_01_01"
    }
  }
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_01",
      name = "pawn_01_02"
    },
    {
      type = "gellyfish",
      locator = "locator_02",
      name = "pawn_01_03"
    },
    {
      type = "gellyfish",
      locator = "locator_03",
      name = "pawn_01_04"
    },
    {
      type = "gellyfish",
      locator = "locator_04",
      name = "pawn_01_05"
    },
    {
      type = "gellyfish",
      locator = "locator_05",
      name = "pawn_01_06"
    }
  }
}
enmgen2_nevi_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "pawn_02_01"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "pawn_02_02"
    },
    {
      type = "runner",
      locator = "locator_03",
      name = "pawn_02_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "pawn_02_04"
    }
  }
}
enmgen2_nevi_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "pawn_03_01"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "pawn_03_02"
    },
    {
      type = "runner",
      locator = "locator_03",
      name = "pawn_03_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "pawn_03_04"
    },
    {
      type = "runner",
      locator = "locator_05",
      name = "pawn_03_05"
    },
    {
      type = "gellyfish",
      locator = "locator_06",
      name = "pawn_03_06"
    },
    {
      type = "gellyfish",
      locator = "locator_07",
      name = "pawn_03_07"
    },
    {
      type = "gellyfish",
      locator = "locator_08",
      name = "pawn_03_08"
    }
  }
}
_enemyGenerator_01 = nil
_enemyGenerator_02 = nil
_enemyGenerator_03 = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5
  }
  L1_1.name = "gade_01"
  L1_1.type = "gad01"
  L1_1.node = "locator2_gade_0"
  L2_2.name = "cyanea_01"
  L2_2.type = "cya02"
  L2_2.node = "locator2_cyanea_0"
  L3_3.name = "zaza_01"
  L3_3.type = "zaz01"
  L3_3.node = "locator2_zaza"
  L4_4 = {}
  L4_4.name = "adicca"
  L4_4.type = "man77"
  L4_4.node = "locator2_adicca"
  L4_4.active = false
  L5_5 = {}
  L5_5.name = "police"
  L5_5.type = "man31"
  L5_5.node = "locator2_police"
  L5_5.active = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L6_6[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
  end
  L4_4 = "man01_appointment_00"
  L1_1(L2_2, L3_3)
  _sdemo3 = L1_1
  L4_4 = "locator2_aim_03"
  L4_4 = L3_3
  L5_5 = L1_1
  L6_6 = L2_2
  L3_3(L4_4, L5_5, L6_6, false)
  L4_4 = "dm01_a_part4"
  _sdemo4 = L3_3
  L4_4 = "Node"
  L5_5 = "locator2_cam_04"
  L4_4 = findGameObject2
  L5_5 = "Node"
  L6_6 = "locator2_aim_04"
  L4_4 = L4_4(L5_5, L6_6)
  L5_5 = _sdemo4
  L6_6 = L5_5
  L5_5 = L5_5.set
  L5_5(L6_6, L3_3, L4_4, false)
  L5_5 = SDemo
  L5_5 = L5_5.create
  L6_6 = "dm01_a_part5"
  L5_5 = L5_5(L6_6)
  _sdemo5 = L5_5
  L5_5 = findGameObject2
  L6_6 = "Node"
  L5_5 = L5_5(L6_6, "locator2_cam_05")
  L6_6 = findGameObject2
  L6_6 = L6_6("Node", "locator2_aim_05")
  _sdemo5:set(L5_5, L6_6, false)
  _sdemo7 = SDemo.create("dm01_a_part6p1")
  Fn_pcSensorOff("pccubesensor2_collect_02")
  Fn_pcSensorOff("pccubesensor2_collect_03")
  Fn_pcSensorOff("pccubesensor2_collect_04")
  Fn_pcSensorOff("pccubesensor2_machine_02")
  Fn_pcSensorOff("pccubesensor2_machine_03")
  Fn_pcSensorOff("pccubesensor2_machine_04")
  Fn_pcSensorOff("pccubesensor2_adicca")
  Fn_pcSensorOff("pccubesensor2_police")
  setPcSenserOff("pccubesensormulti2_area_out_02")
  setPcSenserOff("pccubesensormulti2_area_out_03")
  setPcSenserOff("pccubesensormulti2_area_out_04")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  energyCollectCreate()
end
function Ingame()
  _enemyGenerator_01 = findGameObject2("EnemyGenerator", "enmgen2_nevi_02a")
  _enemyGenerator_02 = findGameObject2("EnemyGenerator", "enmgen2_nevi_03")
  _enemyGenerator_03 = findGameObject2("EnemyGenerator", "enmgen2_nevi_04")
  setEnemyMarkerAndHoming(_enemyGenerator_01, false)
  setEnemyMarkerAndHoming(_enemyGenerator_02, false)
  setEnemyMarkerAndHoming(_enemyGenerator_03, false)
  Fn_setNpcActive("zaza_01", false)
  Fn_setNpcAlpha("zaza_01", false, 0)
  Fn_setNpcActive("gade_01", false)
  Fn_setNpcAlpha("gade_01", false, 0)
  Fn_setNpcActive("cyanea_01", false)
  Fn_setNpcAlpha("cyanea_01", false, 0)
  Fn_loadPlayerMotion(PC_MOTIONTABLE)
  Fn_setCatActive(false)
  Fn_userCtrlAllOff()
  RAC_startCatWarpControl("dm01_b_area_out_01", "pccubesensor2_area_out_01_near", "pccubesensor2_area_out_01_near", "pccubesensor2_area_out_01_long", "locator2_pc_start_pos", nil, nil, "dm01_01132")
  Fn_missionStart()
  playCollectEngineSE("dm01_engine_absorb", 2)
  playEngineEffectCollect(2)
  Fn_userCtrlOn()
  SkyOperationTutorial()
  MachineSearch01()
  MachineSearch02()
  MachineSearch03()
  AdiccaSearch()
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  endEngineSE()
  endEngineEffect()
end
function SkyOperationTutorial()
  local L0_7, L1_8, L2_9, L3_10
  L0_7 = Fn_captionViewWait
  L1_8 = "dm01_01133"
  L0_7(L1_8)
  L0_7 = Fn_captionViewWait
  L1_8 = "dm01_01134"
  L0_7(L1_8)
  L0_7 = Fn_missionView
  L1_8 = "dm01_01135"
  L0_7(L1_8)
  L0_7 = invokeTask
  function L1_8()
    waitSeconds(1.3)
    if _isSky == false then
      Fn_naviSet(findGameObject2("Node", "locator2_sky"))
    end
    waitSeconds(2.5)
    if _isSky == false then
      setTutorialCaption("gravity")
    end
  end
  L0_7(L1_8)
  while true do
    L0_7 = _isSky
    if L0_7 == false then
      L0_7 = wait
      L0_7()
    end
  end
  L0_7 = _enemyGenerator_01
  L1_8 = L0_7
  L0_7 = L0_7.requestSpawn
  L0_7(L1_8)
  L0_7 = Player
  L1_8 = L0_7
  L0_7 = L0_7.setEnergyInfinite
  L2_9 = Player
  L2_9 = L2_9.kEnergy_Gravity
  L3_10 = true
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = Fn_userCtrlOff
  L0_7()
  L0_7 = Fn_userCtrlGravityOff
  L0_7()
  L0_7 = Player
  L1_8 = L0_7
  L0_7 = L0_7.setStay
  L2_9 = true
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = endTutorialCaption
  L0_7()
  L0_7 = RAC_endCatWarpControl
  L1_8 = "dm01_b_area_out_01"
  L0_7(L1_8)
  L0_7 = waitSeconds
  L1_8 = 1
  L0_7(L1_8)
  L0_7 = Fn_captionView
  L1_8 = "dm01_01136"
  L0_7(L1_8)
  L0_7 = waitSeconds
  L1_8 = 2
  L0_7(L1_8)
  L0_7 = setTutorialCaption
  L1_8 = "camera"
  L0_7(L1_8)
  L0_7 = invokeTask
  function L1_8()
    while true do
      wait()
      waitSeconds(20)
      Fn_captionViewWait("dm01_01137")
    end
  end
  L0_7 = L0_7(L1_8)
  while true do
    L1_8 = Fn_isInSightTarget
    L2_9 = "locator2_machine_02"
    L3_10 = 0.3
    L1_8 = L1_8(L2_9, L3_10)
    if L1_8 == false then
      L1_8 = wait
      L1_8()
    end
  end
  L2_9 = L0_7
  L1_8 = L0_7.abort
  L1_8(L2_9)
  L0_7 = nil
  L1_8 = Camera
  L2_9 = L1_8
  L1_8 = L1_8.setControl
  L3_10 = Camera
  L3_10 = L3_10.kPlayer
  L1_8(L2_9, L3_10, Camera.kControl_All, false)
  L1_8 = Fn_pcSensorOff
  L2_9 = "pccubesensor2_sky_01"
  L1_8(L2_9)
  L1_8 = Fn_pcSensorOff
  L2_9 = "pccubesensor2_sky_02"
  L1_8(L2_9)
  L1_8 = endTutorialCaption
  L1_8()
  L1_8 = findGameObject2
  L2_9 = "Node"
  L3_10 = "locator2_cam_06"
  L1_8 = L1_8(L2_9, L3_10)
  L2_9 = findGameObject2
  L3_10 = "Node"
  L2_9 = L2_9(L3_10, "locator2_aim_06")
  L3_10 = findGameObject2
  L3_10 = L3_10("Node", "locator2_cam_07")
  _sdemo7:set(L3_10, L2_9, true)
  _sdemo7:play({
    {pos = L3_10, time = 0}
  }, {
    {pos = L2_9, time = 0}
  })
  waitSeconds(0.1)
  Sound:playSEHandle("cro022b", 1)
  Fn_captionView("dm01_01138")
  setEnemyMarkerAndHoming(_enemyGenerator_01, true)
  _sdemo7:play({
    {pos = L1_8, time = 2}
  }, {
    {pos = L2_9, time = 2}
  })
  waitSeconds(3)
  _sdemo7:stop(2)
  Player:setEnergyInfinite(Player.kEnergy_Gravity, false)
  Fn_userCtrlOn()
  Player:setStay(false)
end
function MachineSearch01()
  local L0_11, L1_12, L2_13, L3_14, L4_15
  L0_11 = Fn_pcSensorOn
  L1_12 = "pccubesensor2_machine_02"
  L0_11(L1_12)
  L0_11 = setPcSenserOn
  L1_12 = "pccubesensormulti2_area_out_02"
  L0_11(L1_12)
  L0_11 = RAC_missionNaviCaption
  L1_12 = "dm01_09004"
  L2_13 = findGameObject2
  L3_14 = "Node"
  L4_15 = "locator2_machine_02"
  L4_15 = L2_13(L3_14, L4_15)
  L0_11(L1_12, L2_13, L3_14, L4_15, L2_13(L3_14, L4_15))
  while true do
    L0_11 = _isArrivedMachine02
    if L0_11 == false then
      L0_11 = wait
      L0_11()
    end
  end
  L0_11 = setCatWarpReturnPoint
  L1_12 = "locator2_pc_checkpoint_02"
  L0_11(L1_12)
  _cat_warp_navi = "locator2_machine_02"
  L0_11 = Fn_naviKill
  L0_11()
  L0_11 = Fn_setBgmPoint
  L1_12 = "event"
  L2_13 = "battle"
  L0_11(L1_12, L2_13)
  L0_11 = wait
  L0_11()
  L0_11 = Fn_captionViewWait
  L1_12 = "dm01_01144"
  L0_11(L1_12)
  L0_11 = RAC_missionNaviCaption
  L1_12 = "dm01_09002"
  L0_11(L1_12)
  L0_11 = waitSeconds
  L1_12 = 1.3
  L0_11(L1_12)
  L0_11 = setTutorialCaption
  L1_12 = "gravitykick_ep01"
  L0_11(L1_12)
  repeat
    L0_11 = wait
    L0_11()
    L0_11 = _enemyGenerator_01
    L1_12 = L0_11
    L0_11 = L0_11.getEnemyCount
    L0_11 = L0_11(L1_12)
  until L0_11 <= 0
  L0_11 = endTutorialCaption
  L0_11()
  L0_11 = findGameObject2
  L1_12 = "EnemyGenerator"
  L2_13 = "enmgen2_nevi_02"
  L0_11 = L0_11(L1_12, L2_13)
  L2_13 = L0_11
  L1_12 = L0_11.requestSpawn
  L1_12(L2_13)
  L1_12 = waitSeconds
  L2_13 = 1.3
  L1_12(L2_13)
  L1_12 = Fn_captionView
  L2_13 = "dm01_01145"
  L1_12(L2_13)
  repeat
    L1_12 = wait
    L1_12()
    L2_13 = L0_11
    L1_12 = L0_11.getEnemyCount
    L1_12 = L1_12(L2_13)
  until L1_12 <= 0
  L1_12 = playCollectEngineSE
  L2_13 = "dm01_engine_full"
  L3_14 = 2
  L1_12(L2_13, L3_14)
  L1_12 = playEngineEffectFull
  L2_13 = 2
  L1_12(L2_13)
  L1_12 = Fn_captionView
  L2_13 = "dm01_01146"
  L1_12(L2_13)
  L1_12 = waitSeconds
  L2_13 = 1.3
  L1_12(L2_13)
  L1_12 = RAC_LookAtObjectWait
  L2_13 = "locator2_machine_02"
  L1_12(L2_13)
  L1_12 = Fn_setBgmPoint
  L2_13 = "event"
  L3_14 = "calm"
  L1_12(L2_13, L3_14)
  L1_12 = RAC_missionNaviCaption
  L2_13 = "dm01_09006"
  L3_14 = findGameObject2
  L4_15 = "Node"
  L4_15 = L3_14(L4_15, "locator2_machine_02")
  L1_12(L2_13, L3_14, L4_15, L3_14(L4_15, "locator2_machine_02"))
  L1_12 = Fn_pcSensorOn
  L2_13 = "pccubesensor2_collect_02"
  L1_12(L2_13)
  _cat_warp_navi = nil
  while true do
    L1_12 = _isCollectedMachine
    L1_12 = L1_12[2]
    if L1_12 == false then
      L1_12 = wait
      L1_12()
    end
  end
  L1_12 = Fn_blackout
  L1_12()
  L1_12 = Fn_coercionPoseNomal
  L1_12()
  L1_12 = Fn_setNpcActive
  L2_13 = "police"
  L3_14 = true
  L1_12(L2_13, L3_14)
  L1_12 = Area
  L2_13 = L1_12
  L1_12 = L1_12.requestBreak
  L3_14 = Fn_getPlayer
  L3_14 = L3_14()
  L4_15 = L3_14
  L3_14 = L3_14.getWorldPos
  L3_14 = L3_14(L4_15)
  L4_15 = 15
  L1_12(L2_13, L3_14, L4_15)
  L1_12 = Fn_missionViewEnd
  L1_12()
  L1_12 = Fn_naviKill
  L1_12()
  while true do
    L1_12 = HUD
    L2_13 = L1_12
    L1_12 = L1_12.faderStability
    L1_12 = L1_12(L2_13)
    if not L1_12 then
      L1_12 = wait
      L1_12()
    end
  end
  L1_12 = _sdemo3
  L2_13 = L1_12
  L1_12 = L1_12.play
  L1_12(L2_13)
  L1_12 = findGameObject2
  L2_13 = "Node"
  L3_14 = "locator2_pc_machine_02"
  L1_12 = L1_12(L2_13, L3_14)
  L2_13 = L1_12
  L1_12 = L1_12.getWorldTransform
  L2_13 = L1_12(L2_13)
  L3_14 = Fn_setPcPosRot
  L4_15 = L1_12
  L3_14(L4_15, L2_13, Player.kReset_Falling)
  L3_14 = Fn_fadein
  L3_14()
  L3_14 = energyCollectAction
  L3_14()
  L3_14 = Fn_moveNpc
  L4_15 = "police"
  L3_14 = L3_14(L4_15, {
    "locator2_police_move"
  }, {runLength = -1})
  L4_15 = _sdemo3
  L4_15 = L4_15.stop
  L4_15(L4_15)
  L4_15 = energyCollectActive
  L4_15(false)
  L4_15 = invokeTask
  L4_15(function()
    waitSeconds(1)
    RAC_LookAtObject("locator2_police_view")
  end)
  while true do
    L4_15 = L3_14.isRunning
    L4_15 = L4_15(L3_14)
    if L4_15 then
      L4_15 = wait
      L4_15()
    end
  end
  L4_15 = Fn_turnNpc
  L4_15("police")
  L4_15 = RAC_playerTurnWait
  L4_15(_puppet_tbl.police, 1, 2)
  L4_15 = Fn_kaiwaDemoView
  L4_15("dm01_00130k")
  L4_15 = RAC_LookAtObject
  L4_15("locator2_machine_03")
  L4_15 = invokeTask
  L4_15(function()
    RAC_playerTurnWait("locator2_machine_03", 1, 2)
  end)
  L4_15 = Fn_turnNpc
  L4_15("police", "locator2_machine_03")
  L4_15 = setPcSenserOff
  L4_15("pccubesensormulti2_area_out_02")
  L4_15 = setPcSenserOn
  L4_15("pccubesensormulti2_area_out_03")
  L4_15 = playCollectEngineSE
  L4_15("dm01_engine_absorb", 3)
  L4_15 = playEngineEffectCollect
  L4_15(3)
  L4_15 = Fn_pcSensorOff
  L4_15("pccubesensor2_machine_02")
  L4_15 = Fn_captionViewWait
  L4_15("dm01_01150")
  L4_15 = Fn_findNpc
  L4_15 = L4_15("police")
  L4_15 = L4_15.resetSightParam
  L4_15(L4_15)
  L4_15 = Fn_userCtrlOn
  L4_15()
  L4_15 = Fn_pcSensorOn
  L4_15("pccubesensor2_police")
end
function MachineSearch02()
  local L0_16, L1_17, L2_18, L3_19
  L0_16 = Fn_pcSensorOn
  L1_17 = "pccubesensor2_machine_03"
  L0_16(L1_17)
  L0_16 = RAC_missionNaviCaption
  L1_17 = "dm01_09004"
  L2_18 = findGameObject2
  L3_19 = "Node"
  L3_19 = L2_18(L3_19, "locator2_machine_03")
  L0_16(L1_17, L2_18, L3_19, L2_18(L3_19, "locator2_machine_03"))
  L0_16 = setEnemyMarkerAndHoming
  L1_17 = _enemyGenerator_02
  L2_18 = true
  L0_16(L1_17, L2_18)
  while true do
    L0_16 = _isArrivedMachine03
    if L0_16 == false then
      L0_16 = wait
      L0_16()
    end
  end
  L0_16 = setCatWarpReturnPoint
  L1_17 = "locator2_pc_checkpoint_03"
  L0_16(L1_17)
  _cat_warp_navi = "locator2_machine_03"
  L0_16 = Fn_naviKill
  L0_16()
  L0_16 = _enemyGenerator_02
  L1_17 = L0_16
  L0_16 = L0_16.getEnemyCount
  L0_16 = L0_16(L1_17)
  if L0_16 > 0 then
    L0_16 = Fn_setBgmPoint
    L1_17 = "event"
    L2_18 = "battle"
    L0_16(L1_17, L2_18)
    L0_16 = Fn_captionViewWait
    L1_17 = "dm01_01154"
    L0_16(L1_17)
    L0_16 = Fn_missionView
    L1_17 = "dm01_09002"
    L0_16(L1_17)
    L0_16 = waitSeconds
    L1_17 = 1.3
    L0_16(L1_17)
    L0_16 = setTutorialCaption
    L1_17 = "throw"
    L0_16(L1_17)
  end
  repeat
    L0_16 = wait
    L0_16()
    L0_16 = _enemyGenerator_02
    L1_17 = L0_16
    L0_16 = L0_16.getEnemyCount
    L0_16 = L0_16(L1_17)
  until L0_16 <= 0
  L0_16 = endTutorialCaption
  L0_16()
  L0_16 = playCollectEngineSE
  L1_17 = "dm01_engine_full"
  L2_18 = 3
  L0_16(L1_17, L2_18)
  L0_16 = playEngineEffectFull
  L1_17 = 3
  L0_16(L1_17)
  L0_16 = Fn_captionViewWait
  L1_17 = "dm01_01156"
  L0_16(L1_17)
  L0_16 = Fn_setBgmPoint
  L1_17 = "event"
  L2_18 = "calm"
  L0_16(L1_17, L2_18)
  L0_16 = Fn_pcSensorOn
  L1_17 = "pccubesensor2_collect_03"
  L0_16(L1_17)
  _cat_warp_navi = nil
  L0_16 = RAC_missionNaviCaption
  L1_17 = "dm01_09006"
  L2_18 = findGameObject2
  L3_19 = "Node"
  L3_19 = L2_18(L3_19, "locator2_machine_03")
  L0_16(L1_17, L2_18, L3_19, L2_18(L3_19, "locator2_machine_03"))
  while true do
    L0_16 = _isCollectedMachine
    L0_16 = L0_16[3]
    if L0_16 == false then
      L0_16 = wait
      L0_16()
    end
  end
  L0_16 = Fn_blackout
  L0_16()
  L0_16 = Fn_coercionPoseNomal
  L0_16()
  L0_16 = Area
  L1_17 = L0_16
  L0_16 = L0_16.requestBreak
  L2_18 = Fn_getPlayer
  L2_18 = L2_18()
  L3_19 = L2_18
  L2_18 = L2_18.getWorldPos
  L2_18 = L2_18(L3_19)
  L3_19 = 15
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = Fn_missionViewEnd
  L0_16()
  L0_16 = Fn_naviKill
  L0_16()
  while true do
    L0_16 = HUD
    L1_17 = L0_16
    L0_16 = L0_16.faderStability
    L0_16 = L0_16(L1_17)
    if not L0_16 then
      L0_16 = wait
      L0_16()
    end
  end
  L0_16 = _sdemo4
  L1_17 = L0_16
  L0_16 = L0_16.play
  L0_16(L1_17)
  L0_16 = findGameObject2
  L1_17 = "Node"
  L2_18 = "locator2_pc_machine_03"
  L0_16 = L0_16(L1_17, L2_18)
  L1_17 = L0_16
  L0_16 = L0_16.getWorldTransform
  L1_17 = L0_16(L1_17)
  L2_18 = Fn_setPcPosRot
  L3_19 = L0_16
  L2_18(L3_19, L1_17, Player.kReset_Falling)
  L2_18 = Fn_fadein
  L2_18()
  L2_18 = energyCollectAction
  L2_18()
  L2_18 = _sdemo4
  L3_19 = L2_18
  L2_18 = L2_18.stop
  L2_18(L3_19)
  L2_18 = energyCollectActive
  L3_19 = false
  L2_18(L3_19)
  L2_18 = setPcSenserOff
  L3_19 = "pccubesensormulti2_area_out_03"
  L2_18(L3_19)
  L2_18 = setPcSenserOn
  L3_19 = "pccubesensormulti2_area_out_04"
  L2_18(L3_19)
  L2_18 = Fn_userCtrlOn
  L2_18()
  L2_18 = Fn_pcSensorOff
  L3_19 = "pccubesensor2_machine_03"
  L2_18(L3_19)
  L2_18 = playCollectEngineSE
  L3_19 = "dm01_engine_absorb"
  L2_18(L3_19, 4)
  L2_18 = playEngineEffectCollect
  L3_19 = 4
  L2_18(L3_19)
  L2_18 = Fn_captionViewWait
  L3_19 = "dm01_01160"
  L2_18(L3_19)
end
function MachineSearch03()
  local L0_20, L1_21, L2_22, L3_23, L4_24
  L0_20 = Fn_pcSensorOn
  L1_21 = "pccubesensor2_machine_04"
  L0_20(L1_21)
  L0_20 = RAC_missionNaviCaption
  L1_21 = "dm01_09004"
  L2_22 = findGameObject2
  L3_23 = "Node"
  L4_24 = "locator2_machine_04"
  L4_24 = L2_22(L3_23, L4_24)
  L0_20(L1_21, L2_22, L3_23, L4_24, L2_22(L3_23, L4_24))
  L0_20 = setEnemyMarkerAndHoming
  L1_21 = _enemyGenerator_03
  L2_22 = true
  L0_20(L1_21, L2_22)
  while true do
    L0_20 = _isArrivedMachine04
    if L0_20 == false then
      L0_20 = wait
      L0_20()
    end
  end
  L0_20 = setCatWarpReturnPoint
  L1_21 = "locator2_pc_checkpoint_04"
  L0_20(L1_21)
  _cat_warp_navi = "locator2_machine_04"
  L0_20 = Fn_naviKill
  L0_20()
  L0_20 = nil
  L1_21 = _enemyGenerator_03
  L2_22 = L1_21
  L1_21 = L1_21.getEnemyCount
  L1_21 = L1_21(L2_22)
  if L1_21 > 0 then
    L1_21 = Fn_setBgmPoint
    L2_22 = "event"
    L3_23 = "battle"
    L1_21(L2_22, L3_23)
    L1_21 = wait
    L1_21()
    L1_21 = invokeTask
    function L2_22()
      Fn_captionViewWait("dm01_01164")
      Fn_missionView("dm01_09002")
      waitSeconds(1.3)
      L0_20 = CheckTutorialCaptionTask()
    end
    L1_21(L2_22)
    L1_21 = Player
    L2_22 = L1_21
    L1_21 = L1_21.setAbility
    L3_23 = Player
    L3_23 = L3_23.kAbility_SpAttack
    L4_24 = true
    L1_21(L2_22, L3_23, L4_24)
    L1_21 = HUD
    L2_22 = L1_21
    L1_21 = L1_21.spgSetDisableBar
    L3_23 = false
    L1_21(L2_22, L3_23)
  end
  repeat
    L1_21 = wait
    L1_21()
    L1_21 = _enemyGenerator_03
    L2_22 = L1_21
    L1_21 = L1_21.getEnemyCount
    L1_21 = L1_21(L2_22)
  until L1_21 <= 0
  if L0_20 ~= nil then
    L2_22 = L0_20
    L1_21 = L0_20.abort
    L1_21(L2_22)
  end
  L0_20 = nil
  L1_21 = endTutorialCaption
  L1_21()
  L1_21 = Fn_missionViewEnd
  L1_21()
  L1_21 = playCollectEngineSE
  L2_22 = "dm01_engine_full"
  L3_23 = 4
  L1_21(L2_22, L3_23)
  L1_21 = playEngineEffectFull
  L2_22 = 4
  L1_21(L2_22)
  L1_21 = RAC_LookAtObjectWait
  L2_22 = "locator2_machine_04"
  L1_21(L2_22)
  L1_21 = Fn_captionView
  L2_22 = "dm01_01166"
  L1_21(L2_22)
  L1_21 = waitSeconds
  L2_22 = 1.3
  L1_21(L2_22)
  L1_21 = Fn_setBgmPoint
  L2_22 = "event"
  L3_23 = "calm"
  L1_21(L2_22, L3_23)
  L1_21 = Fn_pcSensorOn
  L2_22 = "pccubesensor2_collect_04"
  L1_21(L2_22)
  _cat_warp_navi = nil
  L1_21 = RAC_missionNaviCaption
  L2_22 = "dm01_09006"
  L3_23 = findGameObject2
  L4_24 = "Node"
  L4_24 = L3_23(L4_24, "locator2_machine_04")
  L1_21(L2_22, L3_23, L4_24, L3_23(L4_24, "locator2_machine_04"))
  while true do
    L1_21 = _isCollectedMachine
    L1_21 = L1_21[4]
    if L1_21 == false then
      L1_21 = wait
      L1_21()
    end
  end
  L1_21 = Fn_blackout
  L1_21()
  L1_21 = Fn_coercionPoseNomal
  L1_21()
  L1_21 = Area
  L2_22 = L1_21
  L1_21 = L1_21.requestBreak
  L3_23 = Fn_getPlayer
  L3_23 = L3_23()
  L4_24 = L3_23
  L3_23 = L3_23.getWorldPos
  L3_23 = L3_23(L4_24)
  L4_24 = 15
  L1_21(L2_22, L3_23, L4_24)
  L1_21 = Fn_missionViewEnd
  L1_21()
  L1_21 = Fn_naviKill
  L1_21()
  while true do
    L1_21 = HUD
    L2_22 = L1_21
    L1_21 = L1_21.faderStability
    L1_21 = L1_21(L2_22)
    if not L1_21 then
      L1_21 = wait
      L1_21()
    end
  end
  L1_21 = _sdemo5
  L2_22 = L1_21
  L1_21 = L1_21.play
  L1_21(L2_22)
  L1_21 = Fn_userCtrlAllOff
  L1_21()
  L1_21 = findGameObject2
  L2_22 = "Node"
  L3_23 = "locator2_pc_machine_04"
  L1_21 = L1_21(L2_22, L3_23)
  L2_22 = L1_21
  L1_21 = L1_21.getWorldTransform
  L2_22 = L1_21(L2_22)
  L3_23 = Fn_setPcPosRot
  L4_24 = L1_21
  L3_23(L4_24, L2_22, Player.kReset_Falling)
  L3_23 = Fn_fadein
  L3_23()
  L3_23 = energyCollectAction
  L3_23()
  L3_23 = Fn_pcSensorOff
  L4_24 = "pccubesensor2_machine_04"
  L3_23(L4_24)
  L3_23 = RAC_showSPNpc
  L4_24 = "zaza_01"
  L3_23(L4_24)
  L3_23 = invokeTask
  L4_24 = Fn_turnNpc
  L3_23(L4_24, "zaza_01")
  L3_23 = wait
  L3_23()
  L3_23 = _sdemo5
  L4_24 = L3_23
  L3_23 = L3_23.play
  L3_23(L4_24, {
    {
      pos = findGameObject2("Node", "locator2_cam_09"),
      time = 1
    }
  }, {
    {
      pos = _puppet_tbl.zaza_01,
      time = 1
    }
  })
  L3_23 = RAC_playerTurnWait
  L4_24 = _puppet_tbl
  L4_24 = L4_24.zaza_01
  L3_23(L4_24, 1, 2)
  L3_23 = Fn_kaiwaDemoView
  L4_24 = "dm01_00310k"
  L3_23(L4_24)
  L3_23 = RAC_disappearSPNpc
  L4_24 = "zaza_01"
  L3_23(L4_24)
  L3_23 = RAC_showSPNpc
  L4_24 = "gade_01"
  L3_23(L4_24)
  L3_23 = RAC_showSPNpc
  L4_24 = "cyanea_01"
  L3_23(L4_24)
  L3_23 = Fn_moveNpc
  L4_24 = "gade_01"
  L3_23 = L3_23(L4_24, {
    "locator2_gade"
  }, {runLength = 10000})
  L4_24 = Fn_moveNpc
  L4_24 = L4_24("cyanea_01", {
    "locator2_cyanea"
  }, {runLength = 10000})
  Fn_captionViewWait("dm01_01169")
  _sdemo5:play({
    {
      pos = findGameObject2("Node", "locator2_cam_08"),
      time = 1
    }
  }, {
    {
      pos = _puppet_tbl.gade_01,
      time = 1
    }
  })
  RAC_playerTurnWait(_puppet_tbl.gade_01, 1, 2)
  L3_23:abort()
  L3_23 = nil
  L4_24:abort()
  L4_24 = nil
  invokeTask(Fn_turnNpc, "gade_01")
  invokeTask(Fn_turnNpc, "cyanea_01")
  waitSeconds(1)
  Fn_captionViewWait("dm01_01170")
  Fn_kaiwaDemoView("dm01_00320k")
  _cat_warp_caption = "dm01_01171"
  RAC_disappearSPNpc("gade_01")
  RAC_disappearSPNpc("cyanea_01")
  waitSeconds(2)
  _sdemo5:stop()
  energyCollectActive(false)
  Fn_userCtrlOn()
  Fn_captionViewWait("dm01_01172")
end
function CheckTutorialCaptionTask()
  local L0_25
  L0_25 = false
  return invokeTask(function()
    while true do
      if Player:getEnergy(Player.kEnergy_SpAttack) >= Player:getEnergyMax(Player.kEnergy_SpAttack) and L0_25 == false then
        setTutorialCaption("sp_attack")
        L0_25 = true
      end
      if Player:getEnergy(Player.kEnergy_SpAttack) < Player:getEnergyMax(Player.kEnergy_SpAttack) and L0_25 == true then
        endTutorialCaption()
        break
      end
      wait()
    end
  end)
end
function AdiccaSearch()
  local L0_26
  L0_26 = Fn_findNpcPuppet
  L0_26 = L0_26("adicca")
  _createActor("kit01", "locator2_kit")
  Fn_setNpcActive("adicca", true)
  Fn_playMotionNpc("adicca", "man01_appointment_00", false)
  Fn_pcSensorOn("pccubesensor2_adicca")
  RAC_missionNaviCaption("dm01_01173", L0_26)
  repeat
    wait()
  until _isArrived
  Fn_userCtrlOff()
  Fn_naviKill()
  RAC_LookAtObjectWait(L0_26)
  Fn_kaiwaDemoView("dm01_00330k")
end
function setEnemyMarkerAndHoming(A0_27, A1_28)
  local L2_29
  L2_29 = A0_27.setEnemyMarker
  L2_29(A0_27, A1_28)
  L2_29 = A0_27.getSpecTable
  L2_29 = L2_29(A0_27)
  L2_29 = L2_29.spawnSet
  for _FORV_6_, _FORV_7_ in pairs(L2_29) do
    if findGameObject2("EnemyBrain", _FORV_7_.name) ~= nil then
      findGameObject2("EnemyBrain", _FORV_7_.name):setEnableHomingTarget(A1_28)
    end
  end
end
function pccubesensor2_sky_01_OnEnter()
  _isSky = true
  Fn_naviKill()
end
function pccubesensor2_sky_01_OnLeave()
  local L0_30, L1_31
  _isSky = false
end
function pccubesensor2_sky_02_OnEnter()
  if _isSky == false then
    Fn_captionView("dm01_01116")
  end
end
function pccubesensor2_machine_02_OnEnter()
  invokeTask(function()
    _isArrivedMachine02 = true
    Fn_pcSensorOff("pccubesensor2_machine_02")
  end)
end
function pccubesensor2_machine_03_OnEnter()
  invokeTask(function()
    _isArrivedMachine03 = true
    Fn_pcSensorOff("pccubesensor2_machine_03")
  end)
end
function pccubesensor2_machine_04_OnEnter()
  invokeTask(function()
    _isArrivedMachine04 = true
    Fn_pcSensorOff("pccubesensor2_machine_04")
  end)
end
function pccubesensor2_adicca_OnEnter(A0_32)
  invokeTask(function()
    A0_32:setActive(false)
    _isArrived = true
  end)
end
function pccubesensor2_police_OnEnter()
  local L0_33, L1_34
  function L0_33()
    Fn_userCtrlOff()
    Fn_turnNpc("police")
    Fn_captionView("dm01_01174")
    Fn_findNpc("police"):resetSightParam()
    Fn_userCtrlOn()
  end
  L1_34 = {}
  L1_34.RL = {id = "dm01_09001", func = L0_33}
  Fn_gestureAction(L1_34)
end
function pccubesensor2_police_OnLeave()
  Fn_gestureActionCancel()
end
function setPcSenserOn(A0_35)
  Fn_pcSensorOn(A0_35 .. "_long")
  Fn_pcSensorOn(A0_35 .. "_near")
end
function setPcSenserOff(A0_36)
  Fn_pcSensorOff(A0_36 .. "_long")
  Fn_pcSensorOff(A0_36 .. "_near")
end
function setCatWarpReturnPoint(A0_37)
  local L1_38
  _cat_warp_return_point = A0_37
end
function doCatWarp_Caption(A0_39)
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    Fn_tutorialCaptionKill()
    RAC_missionNaviCaptionWait(nil, _cat_warp_navi, _cat_warp_caption)
    if _is_tutorial_caption == true then
      invokeTask(function()
        waitSeconds(3)
        setTutorialCaption(A0_39)
      end)
    end
    Player:setStay(false)
    Fn_userCtrlOn()
  end)
end
function doCatWarp_Warp(A0_40)
  invokeTask(function()
    Fn_userCtrlAllOff()
    if _cat_warp_navi ~= nil then
      Fn_naviKill()
    end
    Fn_catWarpIn()
    Fn_setCatWarpCheckPoint(_cat_warp_return_point)
    Fn_catWarpCheckPoint()
    wait()
    Fn_tutorialCaptionKill()
    Fn_catWarpOut()
    while not HUD:faderStability() do
      wait()
    end
    wait(15)
    if _is_tutorial_caption == true then
      setTutorialCaption(A0_40)
    end
    Fn_userCtrlOn()
    waitSeconds(1)
  end)
end
function pccubesensormulti2_area_out_02_near_OnEnter()
  if _cat_warp_navi ~= nil then
    Fn_naviKill()
  end
end
function pccubesensormulti2_area_out_02_near_OnLeave()
  doCatWarp_Caption("gravitykick_ep01")
end
function pccubesensormulti2_area_out_02_long_OnLeave()
  doCatWarp_Warp("gravitykick_ep01")
end
function pccubesensormulti2_area_out_03_near_OnEnter()
  if _cat_warp_navi ~= nil then
    Fn_naviKill()
  end
end
function pccubesensormulti2_area_out_03_near_OnLeave()
  doCatWarp_Caption("throw")
end
function pccubesensormulti2_area_out_03_long_OnLeave()
  doCatWarp_Warp("throw")
end
function pccubesensormulti2_area_out_04_near_OnEnter()
  if _cat_warp_navi ~= nil then
    Fn_naviKill()
  end
end
function pccubesensormulti2_area_out_04_near_OnLeave()
  doCatWarp_Caption("sp_attack")
end
function pccubesensormulti2_area_out_04_long_OnLeave()
  doCatWarp_Warp("sp_attack")
end
