dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  _sdemo_cut01 = SDemo.create("sm47_a_cut_01")
end
function Ingame()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestShipCreate"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestBagCreate"
  L0_0(L1_1)
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L1_1 = "isBagCreateEnd"
    L0_0 = L0_0(L1_1)
  until L0_0
  L0_0 = Fn_sendEventComSb
  L1_1 = "getVeHdl"
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = invokeTask
  function L2_2()
    Fn_turnNpc("sm47_client")
  end
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.7
  L1_1(L2_2)
  L1_1 = Fn_turnNpc
  L2_2 = "sm47_mad_01"
  L1_1(L2_2)
  L1_1 = Fn_kaiwaDemoView
  L2_2 = "sm47_00100k"
  L1_1(L2_2)
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.set
  L1_1(L2_2, "locator2_sdemo_cam_a_01", "locator2_sdemo_aim_a_01")
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm47_00100"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 2
  L1_1(L2_2)
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.set
  L1_1(L2_2, "locator2_sdemo_cam_a_02", "locator2_sdemo_aim_a_02")
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm47_00101"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.5
  L1_1(L2_2)
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.set
  L1_1(L2_2, "locator2_sdemo_cam_a_04", "locator2_sdemo_aim_a_04")
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm47_00102"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.5
  L1_1(L2_2)
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.set
  L1_1(L2_2, "locator2_sdemo_cam_a_03", "locator2_sdemo_aim_a_03")
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm47_00103"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.set
  L1_1(L2_2, "locator2_sdemo_cam_a_05", "locator2_sdemo_aim_a_05")
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm47_00104"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.set
  L1_1(L2_2, "locator2_sdemo_cam_a_06", "locator2_sdemo_aim_a_06")
  L1_1 = _sdemo_cut01
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm47_00105"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = Fn_captionViewEnd
  L1_1()
  L1_1 = {L2_2}
  L2_2 = {}
  L2_2.pos = "locator2_sdemo_cam_a_08"
  L2_2.time = 3.5
  L2_2 = {
    {
      pos = "locator2_sdemo_aim_a_08",
      time = 3.5
    }
  }
  _sdemo_cut01:set("locator2_sdemo_cam_a_07", "locator2_sdemo_aim_a_07")
  Fn_captionView("sm47_00106")
  waitSeconds(1.5)
  Fn_captionViewEnd()
  _sdemo_cut01:play(L1_1, L2_2)
  waitSeconds(1)
  Fn_captionViewEnd()
  waitSeconds(3)
  Fn_captionViewWait("sm47_00107")
  Fn_kaiwaDemoView("sm47_00200k")
  Fn_blackout()
  _sdemo_cut01:stop(0)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
