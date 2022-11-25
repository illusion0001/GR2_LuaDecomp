dofile("/Game/Event2/Common/EventCommon.lua")
_area_name = "et3_a_01"
_kit_mot_list = {
  surprise = "kit01_surprise_00"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "bit01",
      type = "bit01",
      node = "locator2_bit01",
      attach = false,
      use_gravity = false
    },
    {
      name = "bit02",
      type = "bit01",
      node = "locator2_bit02",
      attach = false,
      use_gravity = false,
      active = false
    },
    {
      name = "bit03",
      type = "bit01",
      node = "locator2_bit03",
      attach = false,
      use_gravity = false,
      active = false
    },
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_cid01",
      attach = false,
      use_gravity = false,
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  Fn_loadPlayerMotion(_kit_mot_list)
  _sdemo = SDemo.create("ep23_a")
  _sdemo:setCameraParam(nil, 0.1, nil)
  Player:setAttrTune(Player.kAttrTune_Normal)
  Player:setSituation(Player.kSituation_Normal, true, 0.01, false, false)
  Fn_missionInfoEnd()
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.set
  L2_3 = "locator2_cut01_cam01"
  L3_4 = "locator2_cut01_aim01"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.switchCamera
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = Fn_findNpc
  L1_2 = "bit01"
  L0_1 = L0_1(L1_2)
  L1_2 = Fn_findNpcPuppet
  L2_3 = L0_1
  L1_2 = L1_2(L2_3)
  L2_3 = Fn_findNpc
  L3_4 = "bit02"
  L2_3 = L2_3(L3_4)
  L3_4 = Fn_findNpcPuppet
  L4_5 = L2_3
  L3_4 = L3_4(L4_5)
  L4_5 = Fn_findNpc
  L5_6 = "bit03"
  L4_5 = L4_5(L5_6)
  L5_6 = Fn_findNpcPuppet
  L6_7 = L4_5
  L5_6 = L5_6(L6_7)
  L6_7 = Fn_missionStart
  L6_7()
  L6_7 = waitSeconds
  L6_7(1)
  L6_7 = Fn_captionView
  L6_7("ep23_00100")
  L6_7 = Sound
  L6_7 = L6_7.playSE
  L6_7(L6_7, "bit_053", 1, "", L1_2)
  L6_7 = _sdemo
  L6_7 = L6_7.play
  L6_7(L6_7, {
    {
      time = 2,
      pos = "locator2_cut01_cam02",
      hashfunc = "EaseIn"
    }
  })
  while true do
    L6_7 = _sdemo
    L6_7 = L6_7.isPlay
    L6_7 = L6_7(L6_7)
    if L6_7 then
      L6_7 = wait
      L6_7()
    end
  end
  L6_7 = {}
  L6_7[1] = linear_move_task(L0_1, L1_2, 10)
  _sdemo:play({
    {
      time = 3,
      pos = "locator2_cut01_cam03",
      hashfunc = "EaseOut"
    }
  }, {
    {
      time = 3,
      pos = "locator2_cut01_aim02",
      hashfunc = "EaseOut"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  Fn_setNpcActive(L2_3, true)
  Fn_captionView("ep23_00101")
  Sound:playSE("bit_054", 1, "", L3_4)
  _sdemo:play(nil, {
    {
      time = 1,
      pos = "locator2_cut01_aim03",
      hashfunc = "EaseIn"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  L6_7[2] = linear_move_task(L2_3, L3_4, 5)
  _sdemo:play({
    {
      time = 3,
      pos = "locator2_cut01_cam04",
      hashfunc = "EaseIn"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  Fn_resetPcPos("warppoint2_01")
  Fn_setNpcActive(L4_5, true)
  _sdemo:play(nil, {
    {
      time = 1,
      pos = "locator2_cut01_aim04",
      hashfunc = "EaseInOut"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  L6_7[3] = linear_move_task(L4_5, L5_6, 4, true)
  Fn_captionView("ep23_00102")
  Sound:playSE("kit_553")
  Fn_setNpcActive("cid01", true)
  waitSeconds(1)
  _sdemo:play({
    {
      time = 5,
      pos = "locator2_cut01_cam05"
    }
  }, {
    {
      time = 5,
      pos = "locator2_cut01_aim05"
    }
  })
  waitSeconds(4)
  Fn_playPlayerMotion(_kit_mot_list.surprise, 0, 0.3)
  while _sdemo:isPlay() do
    wait()
  end
  Fn_blackout()
  _sdemo:stop(0)
  for _FORV_10_, _FORV_11_ in pairs(L6_7) do
    if _FORV_11_ ~= nil and _FORV_11_:isRunning() == true then
      _FORV_11_:abort()
    end
  end
  L6_7 = {}
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_8, L1_9
end
function linear_move_task(A0_10, A1_11, A2_12, A3_13)
  local L4_14
  L4_14 = A0_10.getName
  L4_14 = L4_14(A0_10)
  return invokeTask(function()
    createGameObject2("GimmickBg"):setWorldPos(A1_11:getWorldPos())
    createGameObject2("GimmickBg"):try_init()
    createGameObject2("GimmickBg"):waitForReady()
    createGameObject2("GimmickBg"):try_start()
    createGameObject2("GimmickBg"):clearCurve()
    createGameObject2("GimmickBg"):appendCurvePoint(findGameObject2("Node", "locator2_" .. L4_14):getWorldPos(), Vector(0, 0, 0), A2_12, "Linear", true)
    createGameObject2("GimmickBg"):appendCurvePoint(findGameObject2("Node", "locator2_" .. L4_14 .. "_move"):getWorldPos(), Vector(0, 0, 0), A2_12, "Linear", true)
    createGameObject2("GimmickBg"):setCurveRepeatCount(0)
    while createGameObject2("GimmickBg"):isCurveMoving() do
      A1_11:setWorldPos(createGameObject2("GimmickBg"):getWorldPos())
      A1_11:setForceMove()
      wait()
    end
    if A3_13 == true then
      Sound:playSE("dm03_people_lost", 1, "", A1_11)
      Fn_createEffect("ef_ev_dis_02", "ef_ev_dis_02", A1_11:getWorldPos() + Vector(0, 0.25, 0), false)
    end
    Fn_setNpcAlpha(A0_10, false)
  end)
end
