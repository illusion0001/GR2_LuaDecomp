dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
function Initialize()
  Fn_userCtrlOff()
  _sdemo_cut01 = SDemo.create("cut01")
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0, L1_1, L2_2
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.get
  L2_2 = ggd
  L2_2 = L2_2.EventFlags__ep19__flag04
  L0_0 = L0_0(L1_1, L2_2)
  if L0_0 == 0 then
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestAnotherKittenSpawn"
    L2_2 = "locator2_a_kitten_start_pos_ep19_k"
    L0_0(L1_1, L2_2, Supporter.FirstAction.Ground, true, false, false, true, false)
    repeat
      L0_0 = wait
      L0_0()
      L0_0 = Fn_sendEventComSb
      L1_1 = "requestAnotherKittenSpawnEnd"
      L0_0 = L0_0(L1_1)
    until L0_0
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestAnotherKittenWarp"
    L2_2 = "locator2_a_kitten_start_pos_ep19_k"
    L0_0(L1_1, L2_2)
  end
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestAnotherKittenPuppet"
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_sendEventComSb
  L2_2 = "requestAnotherKittenBrain"
  L1_1 = L1_1(L2_2)
  L2_2 = Fn_setCatWarpCheckPoint
  L2_2("locator2_restart_pos_ep19_k")
  L2_2 = Fn_resetPcPos
  L2_2("locator2_pc_start_pos")
  L2_2 = _sdemo_cut01
  L2_2 = L2_2.set
  L2_2(L2_2, "locator2_cam_01", L0_0, true, Vector(0, 0.5, 0))
  L2_2 = _sdemo_cut01
  L2_2 = L2_2.play
  L2_2(L2_2)
  L2_2 = Fn_sendEventComSb
  L2_2("requestComSensorOff", "pccubesensor2_catwarp")
  function L2_2()
    if GameDatabase:get(ggd.EventFlags__ep19__flag04) == 0 then
      L1_1:playAnim("special_wait", 0, 0.25)
    end
  end
  Fn_sendEventComSb("setSensorVisible", false)
  Fn_missionStart(L2_2)
  GameDatabase:set(ggd.EventFlags__ep19__flag04, 0)
  Fn_captionViewWait("ep19_11002", 2)
  Fn_setBgmPoint("battle")
  _sdemo_cut01:stop(1)
  waitSeconds(1)
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_missionView("ep19_11000")
  GameDatabase:set(ggd.EventFlags__ep19__flag01, 1)
  Fn_sendEventComSb("requestAnotherKittenReleaseIdle")
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
  Fn_blackout()
  invokeTask(function()
    waitSeconds(90)
    Fn_captionView("ep19_11010")
  end):abort()
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_catwarp")
  Fn_pcSensorOff("pccubesensor2_caution_ak_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_ak_01")
  L1_1:setEnemyBossNavi(false)
  L1_1:setLockonNavi(false)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
function pccubesensor2_caution_ak_01_OnLeave()
  print("pccubesensor2_caution_ak_01_OnLeave")
end
function pccubesensor2_catwarp_ak_01_OnLeave()
  print("pccubesensor2_catwarp_ak_01_OnLeave")
  invokeTask(function()
    if not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      Player:applyPoisonDamage(0, 0.1)
      Fn_sendEventComSb("requestStopPoisonSE")
      Fn_sendEventComSb("requestAnotherKittenWarp", "locator2_a_kitten_restart_pos_ep19_k")
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
      Fn_sendEventComSb("requestAnotherKittenReleaseIdle")
    else
      print(" << ep19_k >> game over \227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  end)
end
