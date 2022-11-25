dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_strong",
      locator = "locator2_nevi_01_01",
      name = "nevi_01_01"
    },
    {
      type = "treecannon_strong",
      locator = "locator2_nevi_01_02",
      name = "nevi_01_02"
    },
    {
      type = "treecannon_strong",
      locator = "locator2_nevi_01_03",
      name = "nevi_01_03"
    },
    {
      type = "imp_strong",
      locator = "locator2_nevi_01_04",
      name = "nevi_01_04"
    },
    {
      type = "imp_strong",
      locator = "locator2_nevi_01_05",
      name = "nevi_01_05"
    }
  }
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "defender_strong",
      locator = "locator2_nevi_02_01",
      name = "nevi_02_01",
      ai_spawn_option = "Defender/Defender_NoMove"
    },
    {
      type = "treecannon_strong",
      locator = "locator2_nevi_02_02",
      name = "nevi_02_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_02_03",
      name = "nevi_02_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_02_04",
      name = "nevi_02_04"
    },
    {
      type = "lasercannon_strong",
      locator = "locator2_nevi_02_05",
      name = "nevi_02_05"
    }
  }
}
enmgen2_nevi_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "defender_strong",
      locator = "locator2_nevi_03_01",
      name = "nevi_03_01",
      ai_spawn_option = "Defender/Defender_NoMove"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_03_02",
      name = "nevi_03_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_nevi_03_03",
      name = "nevi_03_03"
    },
    {
      type = "imp_strong",
      locator = "locator2_nevi_03_04",
      name = "nevi_03_04"
    },
    {
      type = "treecannon_strong",
      locator = "locator2_nevi_03_05",
      name = "nevi_03_05"
    }
  }
}
enmgen2_nevi_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "defender_strong",
      locator = "locator2_nevi_04_01",
      name = "nevi_04_01",
      ai_spawn_option = "Defender/Defender_NoMove"
    },
    {
      type = "defender_strong",
      locator = "locator2_nevi_04_02",
      name = "nevi_04_02",
      ai_spawn_option = "Defender/Defender_NoMove"
    },
    {
      type = "lasercannon_strong",
      locator = "locator2_nevi_04_03",
      name = "nevi_04_03"
    },
    {
      type = "lasercannon_strong",
      locator = "locator2_nevi_04_04",
      name = "nevi_04_04"
    },
    {
      type = "lasercannon_strong",
      locator = "locator2_nevi_04_05",
      name = "nevi_04_05"
    }
  }
}
function Initialize()
  Fn_userCtrlAllOff()
  Fn_pcSensorOff("pccubesensor2_01")
  _sdemo_cut01 = SDemo.create("cut01")
  GameDatabase:set(ggd.GlobalSystemFlags__Gauge, false)
  Fn_sendEventComSb("requestAnotherKittenKill")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = Fn_sendEventComSb
  L1_1 = "guideEffAllOff"
  L0_0(L1_1)
  L0_0 = Fn_sendRequestResetGachaTable
  L0_0()
  L0_0 = findGameObject2
  L1_1 = "EnemyGenerator"
  L2_2 = "enmgen2_nevi_01"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = findGameObject2
  L2_2 = "EnemyGenerator"
  L3_3 = "enmgen2_nevi_02"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = findGameObject2
  L3_3 = "EnemyGenerator"
  L4_4 = "enmgen2_nevi_03"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = findGameObject2
  L4_4 = "EnemyGenerator"
  L5_5 = "enmgen2_nevi_04"
  L3_3 = L3_3(L4_4, L5_5)
  L5_5 = L0_0
  L4_4 = L0_0.setEnemyMarker
  L6_6 = false
  L4_4(L5_5, L6_6)
  L5_5 = L1_1
  L4_4 = L1_1.setEnemyMarker
  L6_6 = false
  L4_4(L5_5, L6_6)
  L5_5 = L2_2
  L4_4 = L2_2.setEnemyMarker
  L6_6 = false
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setEnemyMarker
  L6_6 = false
  L4_4(L5_5, L6_6)
  L5_5 = L2_2
  L4_4 = L2_2.requestIdlingEnemy
  L6_6 = true
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.requestIdlingEnemy
  L6_6 = true
  L4_4(L5_5, L6_6)
  L4_4 = Fn_sendEventComSb
  L5_5 = "requestAnotherKittenSpawn"
  L6_6 = "locator2_a_kitten_start_pos_ep19_p"
  L7_7 = Supporter
  L7_7 = L7_7.FirstAction
  L7_7 = L7_7.Air
  L8_8 = true
  L9_9 = true
  L10_10 = true
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, false, false)
  repeat
    L4_4 = wait
    L4_4()
    L4_4 = Fn_sendEventComSb
    L5_5 = "requestAnotherKittenSpawnEnd"
    L4_4 = L4_4(L5_5)
  until L4_4
  L4_4 = Fn_sendEventComSb
  L5_5 = "requestAnotherKittenWarp"
  L6_6 = "locator2_a_kitten_start_pos_ep19_p"
  L7_7 = Supporter
  L7_7 = L7_7.FirstAction
  L7_7 = L7_7.Air
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = Fn_setCatWarpCheckPoint
  L5_5 = "locator2_restart_pos_ep19_p"
  L4_4(L5_5)
  L4_4 = Fn_sendEventComSb
  L5_5 = "requestAnotherKittenPuppet"
  L4_4 = L4_4(L5_5)
  L5_5 = Fn_sendEventComSb
  L6_6 = "requestAnotherKittenBrain"
  L5_5 = L5_5(L6_6)
  L7_7 = L5_5
  L6_6 = L5_5.requestTransform
  L8_8 = true
  L9_9 = false
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = _sdemo_cut01
  L7_7 = L6_6
  L6_6 = L6_6.set
  L8_8 = "locator2_cam_04"
  L9_9 = L4_4
  L10_10 = true
  L6_6(L7_7, L8_8, L9_9, L10_10, Vector(0, 0, 0))
  L6_6 = _sdemo_cut01
  L7_7 = L6_6
  L6_6 = L6_6.play
  L6_6(L7_7)
  L6_6 = Fn_missionStart
  L6_6()
  L6_6 = Sound
  L7_7 = L6_6
  L6_6 = L6_6.playSE
  L8_8 = "dm03_people_lost"
  L9_9 = 1
  L10_10 = ""
  L6_6(L7_7, L8_8, L9_9, L10_10, L4_4)
  L6_6 = Fn_createEffect
  L7_7 = "ef_ev_dis_02"
  L8_8 = "ef_ev_dis_02"
  L9_9 = L4_4
  L10_10 = false
  L6_6 = L6_6(L7_7, L8_8, L9_9, L10_10)
  L7_7 = invokeTask
  function L8_8()
    local L0_11, L1_12, L2_13, L3_14
    L0_11 = 0.04
    for _FORV_4_ = 1, 50 do
      L4_4:setAlpha(1 - _FORV_4_ / 50)
      waitSeconds(L0_11)
    end
  end
  L7_7(L8_8)
  L8_8 = L5_5
  L7_7 = L5_5.setAlphaToTransform
  L9_9 = 0
  L10_10 = 1.5
  L7_7(L8_8, L9_9, L10_10)
  L7_7 = Fn_sendEventComSb
  L8_8 = "missionComplete"
  L9_9 = "6"
  L7_7(L8_8, L9_9)
  repeat
    L7_7 = wait
    L7_7()
    L7_7 = Fn_sendEventComSb
    L8_8 = "isSecondHalfProcessStart"
    L7_7 = L7_7(L8_8)
  until L7_7
  L7_7 = Fn_setFeline
  L8_8 = true
  L9_9 = true
  L10_10 = true
  L7_7(L8_8, L9_9, L10_10, false)
  L7_7 = _sdemo_cut01
  L8_8 = L7_7
  L7_7 = L7_7.stop
  L9_9 = 0
  L7_7(L8_8, L9_9)
  L7_7 = Fn_sendEventComSb
  L8_8 = "requestAnotherKittenWarp"
  L9_9 = "locator2_a_kitten_start_pos_ep19_q"
  L7_7(L8_8, L9_9)
  L7_7 = Fn_setAlpha
  L8_8 = L4_4
  L9_9 = true
  L7_7(L8_8, L9_9)
  L8_8 = L5_5
  L7_7 = L5_5.requestTransform
  L9_9 = false
  L10_10 = false
  L7_7(L8_8, L9_9, L10_10)
  repeat
    L7_7 = wait
    L7_7()
    L7_7 = Fn_sendEventComSb
    L8_8 = "isSecondHalfProcessEnd"
    L7_7 = L7_7(L8_8)
  until L7_7
  L7_7 = Fn_userCtrlAllOff
  L7_7()
  L7_7 = waitSeconds
  L8_8 = 2
  L7_7(L8_8)
  L7_7 = Fn_kaiwaDemoView
  L8_8 = "ep19_00510k"
  L7_7(L8_8)
  L7_7 = GameDatabase
  L8_8 = L7_7
  L7_7 = L7_7.get
  L9_9 = ggd
  L9_9 = L9_9.Savedata__Info__ep19__ep19_info_03
  L7_7 = L7_7(L8_8, L9_9)
  if L7_7 ~= 2 then
    L7_7 = HUD
    L8_8 = L7_7
    L7_7 = L7_7.info
    L9_9 = "ep19_info_03"
    L10_10 = false
    L7_7(L8_8, L9_9, L10_10)
  else
    L7_7 = GameDatabase
    L8_8 = L7_7
    L7_7 = L7_7.get
    L9_9 = ggd
    L9_9 = L9_9.Savedata__Info__ep19__ep19_info_03
    L7_7 = L7_7(L8_8, L9_9)
    if L7_7 == 2 then
      L7_7 = HUD
      L8_8 = L7_7
      L7_7 = L7_7.info
      L9_9 = "ep19_info_03"
      L10_10 = true
      L7_7(L8_8, L9_9, L10_10)
    end
  end
  L7_7 = wait
  L7_7()
  L7_7 = GameDatabase
  L8_8 = L7_7
  L7_7 = L7_7.set
  L9_9 = ggd
  L9_9 = L9_9.GlobalSystemFlags__Gauge
  L10_10 = true
  L7_7(L8_8, L9_9, L10_10)
  L8_8 = L0_0
  L7_7 = L0_0.requestSpawn
  L7_7(L8_8)
  L8_8 = L1_1
  L7_7 = L1_1.requestSpawn
  L7_7(L8_8)
  L8_8 = L2_2
  L7_7 = L2_2.requestIdlingEnemy
  L9_9 = false
  L7_7(L8_8, L9_9)
  L8_8 = L3_3
  L7_7 = L3_3.requestIdlingEnemy
  L9_9 = false
  L7_7(L8_8, L9_9)
  L7_7 = Fn_userCtrlOn
  L7_7()
  L7_7 = Fn_tutorialCaption
  L8_8 = "feline"
  L7_7(L8_8)
  L7_7 = 0
  L8_8 = false
  L9_9 = invokeTask
  function L10_10()
    repeat
      L7_7 = L7_7 + 1
      if L7_7 >= 300 then
        Fn_tutorialCaptionKill()
        L8_8 = true
      end
      wait()
    until L8_8
  end
  L9_9 = L9_9(L10_10)
  L10_10 = Fn_playSupporterEventMotion
  L10_10(L4_4, "special_wait", -1, 0)
  L10_10 = Fn_missionView
  L10_10("ep19_17000")
  L10_10 = waitSeconds
  L10_10(1.3)
  L10_10 = Fn_naviSet
  L10_10(findGameObject2("Node", "locator2_navi_pos_01"))
  L10_10 = findGameObject2
  L10_10 = L10_10("Node", "locator2_navi_pos_01")
  while not is_check_eye_node(L10_10, 50, 10) do
    wait()
  end
  Fn_captionView("ep19_17001")
  Fn_pcSensorOn("pccubesensor2_01")
  waitPhase()
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_naviKill()
  GameDatabase:set(ggd.EventFlags__ep19__flag05, 1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Player:setEnergyInfinite(Player.kEnergy_FelineMP, false)
end
