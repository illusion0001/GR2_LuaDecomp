dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm06_common.lua")
dm06_damage_task = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "kat_01",
      type = "wom01",
      node = "locator2_kat"
    },
    {
      name = "bit_01",
      type = "bit02",
      node = "locator2_bit"
    }
  }
  Fn_setupNpc(L0_0)
  sdemo = SDemo.create("dm06_c")
  camera1 = findGameObject2("Node", "locator2_cam_02")
  target1 = findGameObject2("Node", "locator2_aim_02")
  sdemo:set(camera1, target1, true)
  camera2 = findGameObject2("Node", "locator2_cam_01")
  target2 = findGameObject2("Node", "locator2_aim_01")
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_sendEventComSb("setDustyActive")
  Fn_sendEventComSb("initArk")
  while Fn_sendEventComSb("isArkReady") == false do
    wait()
  end
  Fn_sendEventComSb("requestBossSpawn", "enmgen2_boss_c", "kyodai_collector_c")
  while Fn_sendEventComSb("isBossSpawned") == false do
    wait()
  end
  Fn_missionStart()
  waitSeconds(1)
  Fn_kaiwaDemoView("dm06_00210k")
  waitSeconds(2)
  RAC_disappearSPNpc("bit_01")
  sdemo:play({
    {
      pos = camera1,
      time = 4
    },
    {
      pos = camera2,
      time = 2
    }
  }, {
    {
      pos = target1,
      time = 2
    },
    {
      pos = target2,
      time = 3
    }
  })
  waitSeconds(0.5)
  Fn_missionView("dm06_02000")
  waitSeconds(10)
  sdemo:stop(1.5)
  dm06_damage_task = invokeTask(damageArk)
  Fn_sendEventComSb("startBoss_C1")
  Sound:playSE("pc2_079", 1, "")
  Fn_captionView("dm06_02001")
  Fn_userCtrlOn()
  while Fn_sendEventComSb("isBossGoal") == false do
    wait()
  end
  Fn_kaiwaDemoView("dm06_00220k")
  Fn_captionViewWait("dm06_02002")
  Fn_missionView("dm06_02003")
  Fn_sendEventComSb("startBoss_C2")
  while Fn_sendEventComSb("isBossDead") == false do
    wait()
  end
  if Fn_sendEventComSb("isTrophyUnlock") == true then
    print("\227\131\136\227\131\173\227\131\149\227\130\163\227\131\188 No.46:\229\183\168\229\164\167\227\130\179\227\131\172\227\130\175\227\130\191\227\131\188\227\130\146\228\184\128\229\155\158\227\130\130\231\174\177\232\136\159\227\129\171\230\136\187\227\130\137\227\129\155\227\129\170\227\129\132\231\138\182\230\133\139\227\129\167\227\130\175\227\131\170\227\130\162")
    Net:trophyUnlock(46)
  end
  Fn_captionViewWait("dm06_02004")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
function setArkActive(A0_3)
  Fn_sendEventComSb("changeArk", A0_3)
end
function damageArk()
  RAC_gaugeInit("dm06_00109", HUD.kCountType_Down, 0.75, 1)
  while dm06_goal == false do
    RAC_gaugeSetRate(Fn_sendEventComSb("getArkHpRate") * 100)
    if Fn_sendEventComSb("getArkHpRate") <= 0 then
      Fn_captionViewWait("dm06_02010")
      Fn_scriptGameOver(true)
      break
    elseif Fn_sendEventComSb("getArkHpRate") <= 0.25 and Fn_sendEventComSb("getActiveArkNo") < 4 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_02009")
        setArkActive(4)
      end)
    elseif Fn_sendEventComSb("getArkHpRate") <= 0.5 and Fn_sendEventComSb("getActiveArkNo") < 3 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_02008")
        setArkActive(3)
      end)
    elseif 0.75 >= Fn_sendEventComSb("getArkHpRate") and Fn_sendEventComSb("getActiveArkNo") < 2 then
      invokeTask(function()
        Sound:playSE("cro_268", 1, "")
        Fn_captionView("dm06_02007")
        setArkActive(2)
      end)
    end
    wait()
  end
end
function pccubesensor2_outrange_01_OnLeave()
  local L0_4, L1_5
end
function pccubesensor2_outrange_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("pc2_079", 1, "")
    Fn_captionView("dm06_02011")
  end)
end
