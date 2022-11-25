dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
_puppet_tbl = {}
_sdemo = nil
function Initialize()
  _puppet_tbl.sm07_hundred_legs_01 = Fn_findNpcPuppet("sm07_hundred_legs_01")
  _puppet_tbl.sm07_hundred_legs_02 = Fn_findNpcPuppet("sm07_hundred_legs_02")
  _puppet_tbl.sm07_hundred_legs_03 = Fn_findNpcPuppet("sm07_hundred_legs_03")
  _puppet_tbl.sm07_hundred_legs_04 = Fn_findNpcPuppet("sm07_hundred_legs_04")
  _sdemo = SDemo.create("sm07_sdemo")
end
function Ingame()
  Fn_userCtrlOff()
  Fn_coercionPoseNomal()
  Fn_setCatWarp(true)
  Fn_loadNpcEventMotion("sm07_hundred_legs_01", {
    "man01_handclap_00"
  })
  Fn_loadNpcEventMotion("sm07_hundred_legs_04", {
    "man01_merry_00"
  })
  playSdemo04()
  Fn_userCtrlOn()
  Fn_resetCoercionPose()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
  L0_0 = _puppet_tbl
  L0_0.sm07_hundred_legs_01 = nil
  L0_0 = _puppet_tbl
  L0_0.sm07_hundred_legs_02 = nil
  L0_0 = _puppet_tbl
  L0_0.sm07_hundred_legs_03 = nil
  L0_0 = _puppet_tbl
  L0_0.sm07_hundred_legs_04 = nil
end
function playSdemo04()
  Fn_setNpcActive("sm07_hundred_legs_01", true)
  Fn_setNpcActive("sm07_hundred_legs_02", true)
  Fn_setNpcActive("sm07_hundred_legs_03", true)
  Fn_setNpcActive("sm07_hundred_legs_04", true)
  Fn_warpNpc("sm07_hundred_legs_01", "warppoint2_hundred_legs_01")
  Fn_warpNpc("sm07_hundred_legs_02", "warppoint2_hundred_legs_02")
  Fn_warpNpc("sm07_hundred_legs_03", "warppoint2_hundred_legs_03")
  Fn_warpNpc("sm07_hundred_legs_04", "warppoint2_hundred_legs_04")
  Fn_warpNpc("sm07_client", "warppoint2_client_01")
  Fn_playMotionNpc("sm07_client", "talk_03", false)
  Fn_playMotionNpc("sm07_hundred_legs_01", "man01_handclap_00", false)
  Fn_playMotionNpc("sm07_hundred_legs_02", "vendor_attract_00", false)
  Fn_playMotionNpc("sm07_hundred_legs_03", "vendor_attract_00", false, {animStartFrame = 70})
  Fn_playMotionNpc("sm07_hundred_legs_04", "man01_merry_00", false)
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_04_cam_01", "locator2_sdemo_04_aim_01")
  _sdemo:play()
  Fn_missionStart()
  invokeTask(function()
    local L0_2
    L0_2 = {
      {
        name = "sm07_client",
        se = "m10_918"
      },
      {
        name = "sm07_hundred_legs_01",
        se = "m11_918"
      },
      {
        name = "sm07_hundred_legs_02",
        se = "m12_918"
      },
      {
        name = "sm07_hundred_legs_03",
        se = "m11_920"
      },
      {
        name = "sm07_hundred_legs_04",
        se = "m12_920"
      }
    }
    for _FORV_4_, _FORV_5_ in ipairs(L0_2) do
      Sound:playSE(L0_2[_FORV_4_].se, 1, "", Fn_findNpcPuppet(L0_2[_FORV_4_].name))
      print("[" .. L0_2[_FORV_4_].name .. "]\227\129\139\227\130\137[" .. L0_2[_FORV_4_].se .. "]\227\130\146\229\134\141\231\148\159\227\129\151\227\129\190\227\129\151\227\129\159")
      waitSeconds(RandF(0.1, 0.2))
    end
  end)
  _sdemo:play({
    {
      pos = "locator2_sdemo_04_cam_02",
      time = 2,
      hashfunc = "EaseInOut"
    }
  }, nil)
  while _sdemo:isPlay() do
    wait()
  end
  Fn_kaiwaDemoView("sm07_00400k")
  _sdemo:stop(1)
end
