dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
function Initialize()
  Fn_userCtrlAllOff()
  _sdemo_cut01 = SDemo.create("cut01")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.get
  L2_2 = ggd
  L2_2 = L2_2.EventFlags__ep19__flag05
  L0_0 = L0_0(L1_1, L2_2)
  if L0_0 == 0 then
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestAnotherKittenSpawn"
    L2_2 = "locator2_a_kitten_start_pos_ep19_q"
    L3_3 = Supporter
    L3_3 = L3_3.FirstAction
    L3_3 = L3_3.Ground
    L0_0(L1_1, L2_2, L3_3, true, true, true, false, false)
    repeat
      L0_0 = wait
      L0_0()
      L0_0 = Fn_sendEventComSb
      L1_1 = "requestAnotherKittenSpawnEnd"
      L0_0 = L0_0(L1_1)
    until L0_0
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestAnotherKittenWarp"
    L2_2 = "locator2_a_kitten_start_pos_ep19_q"
    L0_0(L1_1, L2_2)
  end
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestAnotherKittenPuppet"
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_sendEventComSb
  L2_2 = "requestAnotherKittenBrain"
  L1_1 = L1_1(L2_2)
  L2_2 = Fn_setCatWarpCheckPoint
  L3_3 = "locator2_restart_pos_ep19_q"
  L2_2(L3_3)
  L2_2 = _sdemo_cut01
  L3_3 = L2_2
  L2_2 = L2_2.set
  L2_2(L3_3, "locator2_cam_01", L0_0, true, Vector(0, 0.5, 0))
  L2_2 = _sdemo_cut01
  L3_3 = L2_2
  L2_2 = L2_2.play
  L2_2(L3_3)
  L2_2 = Fn_resetPcPos
  L3_3 = "locator2_pc_start_pos"
  L2_2(L3_3)
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestComSensorOff"
  L2_2(L3_3, "pccubesensor2_catwarp")
  L2_2 = Fn_setFeline
  L3_3 = true
  L2_2(L3_3, true, true, false)
  L2_2 = Fn_userCtrlAllOff
  L2_2()
  function L2_2()
    if GameDatabase:get(ggd.EventFlags__ep19__flag05) == 0 then
      L1_1:playAnim("special_wait", 0, 0.25)
    end
  end
  L3_3 = Fn_missionStart
  L3_3(L2_2)
  L3_3 = GameDatabase
  L3_3 = L3_3.set
  L3_3(L3_3, ggd.EventFlags__ep19__flag05, 0)
  L3_3 = L1_1.requestTransform
  L3_3(L1_1, true)
  L3_3 = Fn_captionViewWait
  L3_3("ep19_18001")
  L3_3 = Fn_setBgmPoint
  L3_3("battle")
  L3_3 = _sdemo_cut01
  L3_3 = L3_3.stop
  L3_3(L3_3, 1)
  L3_3 = waitSeconds
  L3_3(1)
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = Fn_missionView
  L3_3("ep19_18000")
  L3_3 = GameDatabase
  L3_3 = L3_3.set
  L3_3(L3_3, ggd.EventFlags__ep19__flag03, 1)
  L3_3 = Fn_sendEventComSb
  L3_3("requestAnotherKittenReleaseIdle")
  L3_3 = L1_1.getMaxHealth
  L3_3 = L3_3(L1_1)
  L1_1:setHealth(L3_3)
  L1_1:setEnemyBossNavi(true)
  L1_1:setLockonNavi(true)
  invokeTask(function()
    HUD:createBossHpGauge({obj = L0_0}):setActive(true)
    while L0_0:isRunning() do
      if L1_1:getHealth() <= 0 then
        _next_phase = true
        break
      else
        HUD:createBossHpGauge({obj = L0_0}):setHp(L1_1:getHealth() / L1_1:getMaxHealth())
      end
      wait()
    end
    HUD:createBossHpGauge({obj = L0_0}):setActive(false)
  end)
  waitPhase()
  FatalMarker.create(kFATAL_TYPE_EMP, nil, false):set(L0_0, "bn_c01_pelvis0", true)
  FatalMarker.create(kFATAL_TYPE_EMP, nil, false):run()
  repeat
    wait()
  until FatalMarker.create(kFATAL_TYPE_EMP, nil, false):isFatalFinish()
  FatalMarker.create(kFATAL_TYPE_EMP, nil, false):kill()
  Fn_whiteout(0.3)
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_catwarp")
  Fn_pcSensorOff("pccubesensor2_caution_ak_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_ak_03")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Player:setEnergyInfinite(Player.kEnergy_FelineMP, false)
end
function pccubesensor2_caution_ak_03_OnLeave()
  print("pccubesensor2_caution_ak_03_OnLeave")
end
function pccubesensor2_catwarp_ak_03_OnLeave()
  print("pccubesensor2_catwarp_ak_03_OnLeave")
  invokeTask(function()
    if not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      Player:applyPoisonDamage(0, 0.1)
      Fn_sendEventComSb("requestStopPoisonSE")
      Fn_sendEventComSb("requestAnotherKittenWarp", "locator2_a_kitten_restart_pos_ep19_q")
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
      Fn_sendEventComSb("requestAnotherKittenReleaseIdle")
    else
      print(" << ep19_q >> game over \227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  end)
end
