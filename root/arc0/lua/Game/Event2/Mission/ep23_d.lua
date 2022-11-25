dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/pdemo.lua")
_area_name = "et3_a_03"
_next_area = "et3_a_04"
function Initialize()
  Fn_setNoDamageMode(Player.kNoDamage_FromCrash, true)
  _pdemo = PDemo.create("ep23_c_c01", nil, {camera = false, scene_param = false})
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
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
  L0_0 = Fn_sendEventComSb
  L1_1 = "getComGameObject"
  L2_2 = "Node"
  L3_3 = "locator2_"
  L4_4 = _area_name
  L5_5 = "_theater_demo"
  L3_3 = L3_3 .. L4_4 .. L5_5
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.appendChild
  L3_3 = _pdemo
  L3_3 = L3_3.pdemo
  L1_1(L2_2, L3_3)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = Fn_userCtrlOn
  L1_1()
  function L1_1()
    waitSeconds(2)
    Fn_captionView("ep23_03000")
  end
  L2_2 = Fn_skipMissionRetryAtProcessing
  L3_3 = L1_1
  L2_2(L3_3)
  while true do
    L2_2 = Fn_sendEventComSb
    L3_3 = "isPuzzleClear"
    L2_2 = L2_2(L3_3)
    if L2_2 == false then
      L2_2 = wait
      L2_2()
    end
  end
  L2_2 = waitSeconds
  L3_3 = 0.5
  L2_2(L3_3)
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestGoalActive"
  L4_4 = _area_name
  L2_2(L3_3, L4_4)
  L2_2 = Fn_sendEventComSb
  L3_3 = "getComGameObject"
  L4_4 = "Node"
  L5_5 = "locator2_"
  L5_5 = L5_5 .. _area_name .. "_goal"
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  L3_3 = Fn_naviSet
  L4_4 = L2_2
  L3_3(L4_4)
  while true do
    L3_3 = Fn_sendEventComSb
    L4_4 = "isGoalSensorIn"
    L3_3 = L3_3(L4_4)
    if L3_3 == false then
      L3_3 = wait
      L3_3()
    end
  end
  L3_3 = Fn_naviKill
  L3_3()
  L3_3 = Fn_sendEventComSb
  L4_4 = "requestGoal"
  L5_5 = _area_name
  L3_3(L4_4, L5_5)
  L3_3 = Fn_sendEventComSb
  L4_4 = "requestGoalDisable"
  L3_3(L4_4)
  L3_3 = Fn_findAreaHandle
  L4_4 = "et3_a_root"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setSceneParameters
  L4_4(L5_5, "et3_blackout_root")
  L4_4 = wait
  L4_4()
  while true do
    L4_4 = Area
    L5_5 = L4_4
    L4_4 = L4_4.isSkyStable
    L4_4 = L4_4(L5_5)
    if L4_4 == false then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = waitSeconds
  L5_5 = 1
  L4_4(L5_5)
  L4_4 = Fn_sendEventComSb
  L5_5 = "createTheater"
  L4_4 = L4_4(L5_5, _area_name)
  L5_5 = L4_4.try_init
  L5_5(L4_4)
  L5_5 = L4_4.waitForReady
  L5_5(L4_4)
  L5_5 = L4_4.try_start
  L5_5(L4_4)
  while true do
    L5_5 = _pdemo
    L5_5 = L5_5.isLoading
    L5_5 = L5_5(L5_5)
    if L5_5 == false then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = _pdemo
  L5_5 = L5_5.play
  L5_5(L5_5)
  L5_5 = Fn_sendEventComSb
  L5_5("requestCreateSpotlight", _area_name)
  L5_5 = Fn_sendEventComSb
  L5_5("requestCreateNextStage")
  L5_5 = waitSeconds
  L5_5(0.5)
  L5_5 = Camera
  L5_5 = L5_5.lookTo
  L5_5(L5_5, L0_0:getWorldPos(), 2, 2)
  L5_5 = Fn_findNpcPuppet
  L5_5 = L5_5("kit04")
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 90
  Fn_captionView("ep23_03001", 10)
  Sound:playSE("ala_024", 1, "", L5_5)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 260
  Fn_captionView("ep23_03002", 6)
  Sound:playSE("ala_025", 1, "", L5_5)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 480
  Fn_setBgmPoint("event", "ep23_demo_end")
  Fn_sendEventComSb("requestSpotlightKill")
  invokeTask(function()
    waitSeconds(1.5)
    L3_3:setSceneParameters("et3_a_root")
  end)
  waitSeconds(0.5)
  Fn_sendEventComSb("requestBreakStage", _area_name)
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_" .. _area_name .. "_next_stage")
  repeat
    wait()
  until Fn_sendEventComSb("isNextPhase")
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_over_" .. _next_area)
  Fn_sendEventComSb("requestCreateDummyGimmick", _next_area)
  _pdemo:try_term()
  Fn_sendEventComSb("requestPrevStageKill")
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
