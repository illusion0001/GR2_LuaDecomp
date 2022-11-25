dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
is_out_of_range_reset = false
is_out_of_range_caption = false
sdemo = nil
function Initialize()
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_capture_duck_out_01")
  Fn_pcSensorOff("pccubesensor2_capture_duck_out_02")
  sdemo = SDemo.create("sm02_sdemo")
  Mob:restrict_sm02_b_00(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  while true do
    L0_0 = Fn_sendEventComSb
    L1_1 = "missionPartInitIsEnd"
    L0_0 = L0_0(L1_1)
    if L0_0 == false then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = Fn_sendEventComSb
  L1_1 = "missionPartInitIsEnd"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "setNpcActive"
  L2_2 = "sm02_duck_01"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_findNpc
  L1_1 = "sm02_client"
  L0_0 = L0_0(L1_1)
  L1_1 = Fn_warpNpc
  L2_2 = L0_0
  L3_3 = "warppoint2_client_01"
  L1_1(L2_2, L3_3)
  L1_1 = Fn_watchNpc
  L2_2 = L0_0
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = Fn_setSisDollActive
  L2_2 = L0_0
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_playMotionNpc
  L2_2 = L0_0
  L3_3 = "stay_02"
  L1_1(L2_2, L3_3, false)
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.reset
  L1_1(L2_2)
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.set
  L3_3 = "locator2_sdemo_02_cam_01"
  L1_1(L2_2, L3_3, "locator2_sdemo_02_aim_01")
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.play
  L1_1(L2_2)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.play
  L3_3 = nil
  L1_1(L2_2, L3_3, {
    {
      pos = "locator2_sdemo_02_aim_02",
      time = 3,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L1_1 = sdemo
    L2_2 = L1_1
    L1_1 = L1_1.isPlay
    L1_1 = L1_1(L2_2)
    if L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.reset
  L1_1(L2_2)
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.set
  L3_3 = "locator2_sdemo_02_cam_02"
  L1_1(L2_2, L3_3, Fn_findNpcPuppet(L0_0), false, Vector(0, 1.5, 0))
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = Fn_kaiwaDemoView
  L2_2 = "sm02_00200k"
  L1_1(L2_2)
  L1_1 = sdemo
  L2_2 = L1_1
  L1_1 = L1_1.stop
  L3_3 = 1
  L1_1(L2_2, L3_3)
  L1_1 = Fn_sendEventComSb
  L2_2 = "setNpcActive"
  L3_3 = "sm02_duck_01"
  L1_1(L2_2, L3_3, true)
  L1_1 = Fn_setCatWarpCheckPoint
  L2_2 = "locator2_pc_start_pos"
  L1_1(L2_2)
  L1_1 = Fn_sendEventComSb
  L2_2 = "missionPartMainStart"
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = RAC_infoView
  L2_2 = "sm02_info_01"
  L1_1(L2_2)
  L1_1 = Fn_sendEventComSb
  L2_2 = "getCaptureDuckMaxCount"
  L1_1 = L1_1(L2_2)
  L2_2 = HUD
  L3_3 = L2_2
  L2_2 = L2_2.counter999SetTextID
  L2_2(L3_3, "sm02_01002")
  L2_2 = HUD
  L3_3 = L2_2
  L2_2 = L2_2.counter999SetNum
  L2_2(L3_3, L1_1)
  L2_2 = HUD
  L3_3 = L2_2
  L2_2 = L2_2.counter999SetVisible
  L2_2(L3_3, true)
  L2_2 = Fn_missionViewWait
  L3_3 = "sm02_01000"
  L2_2(L3_3)
  function L2_2()
    Fn_catWarp()
  end
  function L3_3()
    is_out_of_range_reset = false
    is_out_of_range_caption = false
    Fn_pcSensorOn("pccubesensor2_capture_duck_out_01")
    Fn_pcSensorOn("pccubesensor2_capture_duck_out_02")
    while is_out_of_range_reset == false do
      HUD:counter999SetNum(L1_1 - Fn_sendEventComSb("getCapturedDuckCount"))
      if 0 ~= HUD:counter999GetNum() then
        if is_out_of_range_caption == true then
          Player:setStay(true)
          Fn_captionViewWait("sm02_01001")
          is_out_of_range_caption = false
          Player:setStay(false)
        end
        wait()
      end
    end
    Fn_pcSensorOff("pccubesensor2_capture_duck_out_02")
    if is_out_of_range_reset == true then
      L2_2()
      return false
    end
    is_out_of_range_reset = false
    return true
  end
  while true do
    if L3_3() == false then
    else
    end
  end
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setStay
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = HUD
  L2_2 = L1_1
  L1_1 = L1_1.counter999SetVisible
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_kaiwaDemoView
  L2_2 = "sm02_01500k"
  L1_1(L2_2)
  L1_1 = Fn_blackout
  L1_1()
  L1_1 = Fn_resetPcPos
  L2_2 = "locator2_pc_start_pos"
  L1_1(L2_2)
  L1_1 = Fn_fadein
  L1_1()
  L1_1 = Fn_kaiwaDemoView
  L2_2 = "sm02_01600k"
  L1_1(L2_2)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setStay
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_playMotionNpc
  L2_2 = L0_0
  L3_3 = "stay_01"
  L1_1(L2_2, L3_3, false, {animBlendDuration = 0.5})
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Fn_setSisDollActive
  L2_2 = L0_0
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = Fn_setKeepPlayerPos
  L1_1()
  L1_1 = Fn_setNextMissionFlag
  L1_1()
  L1_1 = Fn_nextMission
  L1_1()
  L1_1 = Fn_exitSandbox
  L1_1()
end
function Finalize()
  Mob:restrict_sm02_b_00(false)
end
function pccubesensor2_capture_duck_out_01_OnEnter()
  local L0_4, L1_5
  is_out_of_range_caption = false
end
function pccubesensor2_capture_duck_out_01_OnLeave()
  local L0_6, L1_7
  is_out_of_range_caption = true
end
function pccubesensor2_capture_duck_out_02_OnEnter()
  local L0_8, L1_9
  is_out_of_range_reset = false
end
function pccubesensor2_capture_duck_out_02_OnLeave()
  local L0_10, L1_11
  is_out_of_range_reset = true
end
