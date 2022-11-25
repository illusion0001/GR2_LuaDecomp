dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/pdemo.lua")
_area_name = "et3_a_07"
_cid01_mot = {
  wait = "cid01_stay_03",
  lookback_in = "cid01_lookback_in_00",
  lookback = "cid01_lookback_00",
  lookback_out = "cid01_lookback_out_00"
}
function Initialize()
  Fn_setNoDamageMode(Player.kNoDamage_FromCrash, true)
  chara_table = {
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_cid01",
      attach = false,
      active = false,
      disable_collision = true
    }
  }
  Fn_setupNpc(chara_table)
  Fn_loadNpcEventMotion("cid01", _cid01_mot)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestComSensorOn"
  L2_2 = "pccubesensor2_over_"
  L3_3 = _area_name
  L2_2 = L2_2 .. L3_3
  L0_0(L1_1, L2_2)
  L0_0 = Fn_sendEventComSb
  L1_1 = "moveTuneGimmick"
  L2_2 = _area_name
  L0_0(L1_1, L2_2)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestCreateTheaterCollision"
  L2_2 = _area_name
  L0_0(L1_1, L2_2)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  function L0_0()
    waitSeconds(2)
    Fn_captionView("ep23_07000")
  end
  L1_1 = Fn_skipMissionRetryAtProcessing
  L2_2 = L0_0
  L1_1(L2_2)
  while true do
    L1_1 = Fn_sendEventComSb
    L2_2 = "isPuzzleClear"
    L1_1 = L1_1(L2_2)
    if L1_1 == false then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Fn_sendEventComSb
  L2_2 = "requestGoalActive"
  L3_3 = _area_name
  L1_1(L2_2, L3_3)
  L1_1 = Fn_sendEventComSb
  L2_2 = "getComGameObject"
  L3_3 = "Node"
  L4_4 = "locator2_"
  L5_5 = _area_name
  L6_6 = "_goal"
  L4_4 = L4_4 .. L5_5 .. L6_6
  L1_1 = L1_1(L2_2, L3_3, L4_4)
  L2_2 = Fn_naviSet
  L3_3 = L1_1
  L2_2(L3_3)
  while true do
    L2_2 = Fn_sendEventComSb
    L3_3 = "isGoalSensorIn"
    L2_2 = L2_2(L3_3)
    if L2_2 == false then
      L2_2 = wait
      L2_2()
    end
  end
  L2_2 = Fn_naviKill
  L2_2()
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestGoal"
  L4_4 = _area_name
  L2_2(L3_3, L4_4)
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestGoalDisable"
  L2_2(L3_3)
  L2_2 = Fn_findAreaHandle
  L3_3 = "et3_a_root"
  L2_2 = L2_2(L3_3)
  L4_4 = L2_2
  L3_3 = L2_2.setSceneParameters
  L5_5 = "et3_blackout_root"
  L3_3(L4_4, L5_5)
  L3_3 = wait
  L3_3()
  while true do
    L3_3 = Area
    L4_4 = L3_3
    L3_3 = L3_3.isSkyStable
    L3_3 = L3_3(L4_4)
    if L3_3 == false then
      L3_3 = wait
      L3_3()
    end
  end
  L3_3 = waitSeconds
  L4_4 = 1
  L3_3(L4_4)
  L3_3 = Fn_sendEventComSb
  L4_4 = "createTheater"
  L5_5 = _area_name
  L3_3 = L3_3(L4_4, L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.try_init
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.waitForReady
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.try_start
  L4_4(L5_5)
  L4_4 = Fn_findNpc
  L5_5 = "cid01"
  L4_4 = L4_4(L5_5)
  L5_5 = Fn_findNpcPuppet
  L6_6 = L4_4
  L5_5 = L5_5(L6_6)
  L6_6 = Fn_setNpcActive
  L6_6(L4_4, true)
  L6_6 = Fn_playNpcEventMotion
  L6_6(L4_4, _cid01_mot.wait, -1, 0.1, false)
  L6_6 = Fn_sendEventComSb
  L6_6("requestCreateSpotlight", _area_name, 1)
  L6_6 = Fn_sendEventComSb
  L6_6("requestCreateNextStage")
  L6_6 = waitSeconds
  L6_6(0.5)
  L6_6 = Camera
  L6_6 = L6_6.lookTo
  L6_6(L6_6, findGameObject2("Node", "locator2_cid01"):getWorldPos(), 2, 2)
  L6_6 = false
  invokeTask(function()
    Fn_playNpcEventMotion(L4_4, _cid01_mot.lookback_in, 0, 0.3, true)
    L6_6 = true
    Fn_playNpcEventMotion(L4_4, _cid01_mot.lookback, 0, 0, true)
    Fn_playNpcEventMotion(L4_4, _cid01_mot.lookback_out, 0, 0, true)
    Fn_playNpcEventMotion(L4_4, _cid01_mot.wait, -1, 0.3, true)
  end)
  while L6_6 == false do
    wait()
  end
  waitSeconds(1)
  Sound:playSE("syd_184", 1, "", L5_5)
  Fn_captionViewWait("ep23_07001", 5)
  waitSeconds(1)
  Fn_setBgmPoint("event", "ep23_demo_end")
  invokeTask(function()
    Sound:playSE("dm03_people_lost", 1, "", L5_5)
    Fn_createEffect("ef_ev_dis_02", "ef_ev_dis_02", L5_5:getWorldPos() + Vector(0, 1, 0), false)
    Fn_setNpcAlpha(L4_4, false)
  end)
  waitSeconds(1)
  Sound:playSE("kit_556")
  Fn_captionViewWait("ep23_07005")
  Fn_sendEventComSb("requestSpotlightKill")
  invokeTask(function()
    waitSeconds(1.5)
    L2_2:setSceneParameters("et3_a_root")
  end)
  waitSeconds(0.5)
  Fn_sendEventComSb("requestBreakStage", _area_name)
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_" .. _area_name .. "_next_stage")
  repeat
    wait()
  until Fn_sendEventComSb("isNextPhase")
  Fn_whiteout(3)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Fn_setNoDamageMode(Player.kNoDamage_FromCrash, false)
  end
end
