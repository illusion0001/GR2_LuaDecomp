dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm06_common.lua")
dm06_boss_angry = false
dm06_damage_task = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "dm06_b"
  L0_0 = L0_0(L1_1)
  sdemo1 = L0_0
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "locator2_cam_01")
  L1_1 = findGameObject2
  L1_1 = L1_1("Node", "locator2_aim_01")
  sdemo1:set(L0_0, L1_1, false)
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_sendEventComSb("initArk")
  while Fn_sendEventComSb("isArkReady") == false do
    wait()
  end
  Fn_sendEventComSb("playArkEffect", "eff02")
  Fn_sendEventComSb("requestBossSpawn", "enmgen2_boss_b", "kyodai_collector_b")
  while Fn_sendEventComSb("isBossSpawned") == false do
    wait()
  end
  Fn_lookAtObjectWait("locator2_waypoint_01")
  Fn_missionStart()
  RAC_missionNaviCaption("dm06_01001", nil, "dm06_01000", nil, nil, nil, "cro018c")
  Fn_userCtrlOn()
  Fn_sendEventComSb("startBoss_B")
  invokeTask(function()
    while Fn_sendEventComSb("getBossBrain"):isRunning() and not (Fn_sendEventComSb("getBossBrain"):getMaxHealth() - Fn_sendEventComSb("getBossDamage") < 30) do
      wait()
    end
    dm06_boss_angry = true
  end)
  dm06_damage_task = invokeTask(damageArk)
  while dm06_boss_angry == false do
    wait()
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
function setArkActive(A0_4)
  Fn_sendEventComSb("changeArk", A0_4)
end
function damageArk()
  RAC_gaugeInit("dm06_00109", HUD.kCountType_Down, 0.75, 1)
  while dm06_goal == false do
    RAC_gaugeSetRate(Fn_sendEventComSb("getArkHpRate") * 100)
    if Fn_sendEventComSb("getArkHpRate") <= 0 then
      Fn_captionViewWait("dm06_01005")
      Fn_scriptGameOver(true)
      break
    elseif Fn_sendEventComSb("getArkHpRate") <= 0.25 and Fn_sendEventComSb("getActiveArkNo") < 4 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_01004")
        setArkActive(4)
      end)
    elseif Fn_sendEventComSb("getArkHpRate") <= 0.5 and Fn_sendEventComSb("getActiveArkNo") < 3 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_01003")
        setArkActive(3)
      end)
    elseif 0.75 >= Fn_sendEventComSb("getArkHpRate") and Fn_sendEventComSb("getActiveArkNo") < 2 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_01002")
        setArkActive(2)
      end)
    end
    wait()
  end
end
function pccubesensor2_outrange_01_OnLeave()
  local L0_5, L1_6
end
function pccubesensor2_outrange_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("pc2_079", 1, "")
    Fn_captionView("dm06_01006")
  end)
end
