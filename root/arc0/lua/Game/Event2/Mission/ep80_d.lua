dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_sdemo = nil
_vog_task = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_po_a_15"
  L0_0(L1_1)
  L0_0 = {L1_1}
  L1_1 = "evarea2_po_a_01_vog"
  L1_1 = Fn_loadEventData
  L1_1("evx/ep80_common", L0_0, true)
  L1_1 = {
    {
      name = "vog01",
      type = "vog01",
      node = "locator2_vog01_01",
      attach = false,
      anim_name = "confuse_00"
    },
    {
      name = "man50",
      type = "man50",
      node = "locator2_man50_01",
      attach = false,
      anim_name = "lookaround_02"
    },
    {
      name = "man51",
      type = "man51",
      node = "locator2_man51_01",
      attach = false,
      anim_name = "count_00"
    },
    {
      name = "man52",
      type = "man52",
      node = "locator2_man52_01",
      attach = false,
      anim_name = "check_00"
    },
    {
      name = "thief",
      type = "man53",
      node = "locator2_escape_c_01",
      attach = false,
      anim_name = "trouble_00"
    },
    {
      name = "ve02",
      type = "ve02",
      node = "locator2_escape_c_01",
      attach = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L1_1)
  Fn_pcSensorOff("pccubesensormulti2_thief_navi_in")
  Fn_pcSensorOff("pccubesensormulti2_thief_navi_out")
  Fn_pcSensorOff("pccubesensormulti2_thief_navi_outrange")
  _sdemo = SDemo.create("ep80_a")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12
  L0_2 = GameDatabase
  L1_3 = L0_2
  L0_2 = L0_2.get
  L2_4 = ggd
  L2_4 = L2_4.EventFlags__ep80__BeginnerMode
  L0_2 = L0_2(L1_3, L2_4)
  if L0_2 == true then
    L0_2 = Fn_lockPlayerAbility
    L1_3 = Player
    L1_3 = L1_3.kAbility_Slider
    L0_2(L1_3)
  end
  L0_2 = Fn_setCatWarpCheckPoint
  L1_3 = "locator2_pc_start_pos"
  L0_2(L1_3)
  L0_2 = Fn_sendEventComSb
  L1_3 = "requestCrateSetActive"
  L2_4 = "bg2_crate_b"
  L3_5 = true
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Fn_findNpc
  L1_3 = "thief"
  L0_2 = L0_2(L1_3)
  L1_3 = Fn_findNpcPuppet
  L2_4 = L0_2
  L1_3 = L1_3(L2_4)
  L2_4 = Fn_findNpc
  L3_5 = "ve02"
  L2_4 = L2_4(L3_5)
  L3_5 = Fn_findNpcPuppet
  L4_6 = L2_4
  L3_5 = L3_5(L4_6)
  L4_6 = Fn_findNpc
  L5_7 = "vog01"
  L4_6 = L4_6(L5_7)
  L5_7 = Fn_findNpc
  L6_8 = "man50"
  L5_7 = L5_7(L6_8)
  L6_8 = Fn_findNpc
  L7_9 = "man51"
  L6_8 = L6_8(L7_9)
  L7_9 = Fn_findNpc
  L8_10 = "man52"
  L7_9 = L7_9(L8_10)
  L8_10 = set_man51_prop
  L8_10()
  L8_10 = vog_crate_broken_task
  L8_10 = L8_10()
  _vog_task = L8_10
  L8_10 = {}
  L9_11 = 1
  while true do
    L10_12 = findGameObject2
    L10_12 = L10_12("Node", "locator2_escape_c_" .. string.format("%02d", L9_11))
    if L10_12 ~= nil then
      L8_10[L9_11] = {}
      L8_10[L9_11].pos = L10_12:getName()
      L8_10[L9_11].attr = "fly"
    else
      break
    end
    L9_11 = L9_11 + 1
  end
  L10_12 = Fn_missionStart
  L10_12()
  function L10_12()
    Fn_resetPcPos("warppoint2_01")
    Fn_warpNpc(L2_4, "locator2_escape_c_01")
    L2_4:setPilots({
      {
        pilot = L1_3,
        attach = "loc_driver1"
      }
    })
    repeat
      wait()
    until L2_4:isRideOnPilot()
    Fn_playMotionNpc(L2_4, "fly", false)
    _sdemo:set("locator2_cut01_cam01", L1_3, kSDEMO_APPEND_AIM)
    _sdemo:offset(nil, Vector(0, 0.5, 0))
    _sdemo:switchCamera(true)
    invokeTask(function()
      Fn_fly(L2_4, L8_10, {moveSpeed = 16})
      L2_4:releasePilots({
        {pilot = L1_3, anim = "fly_l_out"}
      })
      repeat
        wait()
      until L2_4:isRideOffPilot()
      Fn_warpNpc(L0_2, "locator2_pilot_ride_off")
      Fn_playMotionNpc(L0_2, "breath_00", false)
    end)
  end
  Fn_kaiwaDemoView2("ep80_00110k", L10_12, true)
  waitSeconds(0.5)
  _sdemo:play({
    {
      time = 1.2,
      pos = "locator2_cut01_cam02"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  invokeTask(function()
    Fn_turnNpc(L4_6, "locator2_escape_c_04")
    Fn_playMotionNpc(L4_6, "angry_00", true)
    Fn_playMotionNpc(L4_6, "confuse_00")
  end)
  invokeTask(function()
    Fn_turnNpc(L5_7, "locator2_escape_c_04")
    Fn_playMotionNpc(L5_7, "inform_ex_in_00", true)
    Fn_playMotionNpc(L5_7, "inform_ex_00", true)
    Fn_playMotionNpc(L5_7, "inform_ex_out_00", true)
    Fn_playMotionNpc(L5_7, "lookaround_03")
  end)
  invokeTask(function()
    Fn_playMotionNpc(L7_9, "check_out_00", true)
    Fn_turnNpc(L7_9, "locator2_escape_c_04")
    Fn_playMotionNpc(L7_9, "lookaround_01")
  end)
  Fn_kaiwaDemoView("ep80_00120k")
  Fn_pcSensorOn("pccubesensor2_po_a_15")
  Fn_sendEventComSb("requestAreaMove")
  Fn_pcSensorOn("pccubesensormulti2_thief_navi_out")
  Fn_pcSensorOn("pccubesensormulti2_thief_navi_outrange")
  _sdemo:stop(1)
  Fn_userCtrlOn()
  Fn_missionView("ep80_00023")
  waitSeconds(1.3)
  HUD:naviSetPochiDistanceDensity0(25)
  HUD:naviSetPochiDistanceDensity100(30)
  Fn_naviSet(L1_3)
  waitPhase()
  Fn_pcSensorOff("pccubesensormulti2_thief_navi_in")
  Fn_pcSensorOff("pccubesensormulti2_thief_navi_out")
  Fn_pcSensorOff("pccubesensormulti2_thief_navi_outrange")
  Fn_naviKill()
  Fn_blackout(1)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _vog_task ~= nil and _vog_task:isRunning() == true then
    _vog_task:abort()
  end
  _vog_task = nil
end
function pccubesensormulti2_thief_navi_OnEnter(A0_13)
  Fn_pcSensorOn("pccubesensormulti2_thief_navi_out")
  A0_13:setActive(false)
end
function pccubesensormulti2_thief_navi_OnLeave(A0_14)
  Fn_captionView("ep80_00109")
  Fn_pcSensorOn("pccubesensormulti2_thief_navi_in")
  A0_14:setActive(false)
end
