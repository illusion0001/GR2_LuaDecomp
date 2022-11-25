dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_loadEventData
  L0_0("evx/sm50_common", "evarea2_dt_a_root", true)
  L0_0 = {
    {
      name = "npcgen2_man82_01",
      type = "man82",
      node = "locator2_man82_01"
    },
    {
      name = "npcgen2_man31_01",
      type = "man31",
      node = "locator2_man31_01",
      anim_name = "stay_02"
    },
    {
      name = "npcgen2_man81_01",
      type = "man81",
      node = "locator2_man81_01",
      anim_name = "stay_01"
    },
    {
      name = "bul01",
      type = "bul01",
      node = "locator2_bul01_02"
    }
  }
  Fn_setupNpc(L0_0)
  Fn_loadPlayerMotion({
    "kit01_point_00"
  })
  _sdemo = SDemo.create("sm50_c")
  _sdemo:setCameraParam(nil, 0.1, nil)
end
function Ingame()
  local L0_1
  L0_1 = Fn_warpNpc
  L0_1("sm50_client", "locator2_kaj01_01")
  L0_1 = _sdemo
  L0_1 = L0_1.set
  L0_1(L0_1, "locator2_cut_01_cam01", "locator2_cut_01_aim01")
  L0_1 = _sdemo
  L0_1 = L0_1.switchCamera
  L0_1(L0_1, true)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "obj_drop", 0.5)
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_01_cam02",
      time = 0.5,
      hashfunc = "EaseIn"
    }
  })
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = waitSeconds
  L0_1(0.1)
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "obj_drop", 0.5)
  L0_1 = _sdemo
  L0_1 = L0_1.set
  L0_1(L0_1, "locator2_cut_02_cam01", "locator2_cut_02_aim01")
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_02_cam02",
      time = 0.5,
      hashfunc = "EaseIn"
    }
  })
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = waitSeconds
  L0_1(0.1)
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "obj_drop", 0.7)
  L0_1 = _sdemo
  L0_1 = L0_1.set
  L0_1(L0_1, "locator2_cut_03_cam01", "locator2_cut_03_aim01")
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_03_cam02",
      time = 0.5,
      hashfunc = "EaseIn"
    }
  })
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = waitSeconds
  L0_1(0.1)
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "obj_drop", 0.8)
  L0_1 = _sdemo
  L0_1 = L0_1.set
  L0_1(L0_1, "locator2_cut_04_cam01", "locator2_cut_04_aim01")
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_04_cam02",
      time = 0.5,
      hashfunc = "EaseIn"
    }
  })
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = waitSeconds
  L0_1(0.1)
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "obj_drop", 1)
  L0_1 = _sdemo
  L0_1 = L0_1.set
  L0_1(L0_1, "locator2_cut_05_cam01", "locator2_cut_05_aim01")
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_05_cam02",
      time = 0.5,
      hashfunc = "EaseIn"
    }
  })
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = waitSeconds
  L0_1(0.1)
  L0_1 = Fn_playPlayerMotion
  L0_1("kit01_point_00", 0, 0.3, true)
  L0_1 = _sdemo
  L0_1 = L0_1.set
  L0_1(L0_1, "locator2_cut_06_cam01", "locator2_cut_06_aim01")
  L0_1 = _sdemo
  L0_1 = L0_1.switchCamera
  L0_1(L0_1, true)
  L0_1 = waitSeconds
  L0_1(0.5)
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "kit_802", 1)
  L0_1 = invokeTask
  L0_1(function()
    waitSeconds(1.5)
    Fn_playMotionNpc("npcgen2_man82_01", "shock_in_00", true)
    Fn_playMotionNpc("npcgen2_man82_01", "shock_00", false)
  end)
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_06_cam02",
      time = 1,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = _sdemo
  L0_1 = L0_1.play
  L0_1(L0_1, {
    {
      pos = "locator2_cut_06_cam03",
      time = 1.5,
      hashfunc = "EaseIn"
    }
  }, {
    {
      pos = "locator2_cut_06_aim02",
      time = 1.5,
      hashfunc = "EaseIn"
    }
  })
  L0_1 = waitSeconds
  L0_1(0.5)
  L0_1 = Fn_whiteout
  L0_1(2)
  while true do
    L0_1 = _sdemo
    L0_1 = L0_1.isPlay
    L0_1 = L0_1(L0_1)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = waitSeconds
  L0_1(1.5)
  function L0_1()
    Fn_playMotionNpc("npcgen2_man82_01", "stay", false)
    Fn_fadein(1)
    _sdemo:stop(0)
  end
  Fn_kaiwaDemoView2("sm50_00700k", L0_1)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm50_00710k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
