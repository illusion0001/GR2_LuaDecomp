dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm27_common.lua")
SM27_EVENT_MANNERS_DELAY = 1.3
beacon_phase_max = 3
beacon_next_phase = 2
beacon_phase = 1
beacon_away_from = false
beacon_grab_flag = false
beacon_transport_flag = false
beacon_caption_visible = false
beacon_not_have = false
in_lighthouse_sensor_flag = false
surveyor_grab = false
surveyor_grabbed = false
surveyor_action_task = nil
_player_motion_table = {
  kit01_stay_00 = "kit01_stay_00",
  lookaround_00 = "kit01_lookaround_00"
}
motion_data = {
  "lookaround",
  "lookaround_01"
}
_beacon_objs = {}
_becon_effects = {}
sdemo = nil
sm27_surveyor_motion_table = {
  repair_00 = "man01_repair_00",
  scared_high_00 = "man01_scared_high_00",
  walk_b_00 = "man01_walk_b_00"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  for L3_3 = 1, beacon_phase_max do
    Fn_pcSensorOff("pccubesensor2_beacon_cap_" .. string.format("%02d", L3_3))
    Fn_pcSensorOff("pccubesensor2_beacon_goal_" .. string.format("%02d", L3_3))
  end
  L3_3 = "beacon_01"
  L3_3 = L2_2(L3_3, "beacon_md_01", "locator2_beacon_01", false, false, nil, false, "beacon_md_01_sm27")
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3, "beacon_md_01", "locator2_beacon_01", false, false, nil, false, "beacon_md_01_sm27"))
  L3_3 = "beacon_02"
  L3_3 = L2_2(L3_3, "beacon_md_01", "locator2_beacon_02", true, false, nil, false, "beacon_md_01_sm27")
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3, "beacon_md_01", "locator2_beacon_02", true, false, nil, false, "beacon_md_01_sm27"))
  L3_3 = "beacon_03"
  L3_3 = L2_2(L3_3, "beacon_md_01", "locator2_beacon_03", true, false, nil, false, "beacon_md_01_sm27")
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3, "beacon_md_01", "locator2_beacon_03", true, false, nil, false, "beacon_md_01_sm27"))
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  for L3_3 = 1, beacon_phase_max do
    _beacon_objs[L3_3]:setGrabPickupPriorityHigh()
    _beacon_objs[L3_3]:setEnableDelayedCollision(false)
  end
  sdemo = L0_0
  L0_0(L1_1, L2_2)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9
  L0_4 = Fn_loadPlayerMotion
  L1_5 = _player_motion_table
  L0_4(L1_5)
  L0_4 = Fn_userCtrlAllOff
  L0_4()
  L0_4 = Fn_findNpc
  L1_5 = "sm27_client"
  L0_4 = L0_4(L1_5)
  L1_5 = L0_4
  L0_4 = L0_4.ignoreStoop
  L0_4(L1_5)
  L0_4 = Fn_playMotionNpc
  L1_5 = "sm27_client"
  L2_6 = "talk_03"
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.reset
  L0_4(L1_5)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.set
  L2_6 = "locator2_sdemo01_cam_01"
  L3_7 = "locator2_sdemo01_aim_01"
  L4_8 = false
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.play
  L0_4(L1_5)
  L0_4 = Fn_missionStart
  L0_4()
  L0_4 = waitSeconds
  L1_5 = 2
  L0_4(L1_5)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.play
  L2_6 = {L3_7}
  L3_7 = {}
  L3_7.pos = "locator2_sdemo01_cam_02"
  L3_7.time = 3
  L3_7.hashfunc = "EaseInOut"
  L3_7 = {L4_8}
  L4_8 = {}
  L4_8.pos = "locator2_sdemo01_aim_02"
  L4_8.time = 3
  L4_8.hashfunc = "EaseInOut"
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = waitSeconds
  L1_5 = 3
  L0_4(L1_5)
  L0_4 = Fn_kaiwaDemoView
  L1_5 = "sm27_00100k"
  L0_4(L1_5)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.stop
  L2_6 = 1
  L0_4(L1_5, L2_6)
  L0_4 = Fn_userCtrlOn
  L0_4()
  L0_4 = findGameObject2
  L1_5 = "GimmickBg"
  L2_6 = "beacon_01"
  L0_4 = L0_4(L1_5, L2_6)
  L2_6 = L0_4
  L1_5 = L0_4.setEventListener
  L3_7 = "dynamic"
  function L4_8(A0_10)
    A0_10:getDynamicObject():setName("dynamic_obj")
  end
  L1_5(L2_6, L3_7, L4_8)
  L1_5 = findGameObject2
  L2_6 = "GimmickBg"
  L3_7 = "beacon_02"
  L1_5 = L1_5(L2_6, L3_7)
  L3_7 = L1_5
  L2_6 = L1_5.setEventListener
  L4_8 = "dynamic"
  function L5_9(A0_11)
    A0_11:getDynamicObject():setName("dynamic_obj")
  end
  L2_6(L3_7, L4_8, L5_9)
  L2_6 = findGameObject2
  L3_7 = "GimmickBg"
  L4_8 = "beacon_03"
  L2_6 = L2_6(L3_7, L4_8)
  L4_8 = L2_6
  L3_7 = L2_6.setEventListener
  L5_9 = "dynamic"
  L3_7(L4_8, L5_9, function(A0_12)
    A0_12:getDynamicObject():setName("dynamic_obj")
  end)
  L3_7 = Player
  L4_8 = L3_7
  L3_7 = L3_7.setGrabExceptionalObject
  L5_9 = {
    "beacon_01",
    "beacon_02",
    "beacon_03",
    "dynamic_obj",
    Fn_findNpcPuppet("sm27_client"):getName()
  }
  L3_7(L4_8, L5_9)
  L3_7 = RAC_startCatWarpControl
  L4_8 = "sm27_outrange_warp"
  L5_9 = nil
  L3_7(L4_8, L5_9, "pccubesensor2_out_of_range_01", "pccubesensor2_out_of_range_02", "locator2_pc_start_pos", nil, nil, "sm27_00121", sm27_outrange_before1, sm27_outrange_grabreset1)
  L3_7 = Fn_pcSensorOn
  L4_8 = "pccubesensor2_beacon_not_have"
  L3_7(L4_8)
  L3_7 = sm27_npc_action
  L4_8 = "sm27_client"
  L3_7 = L3_7(L4_8)
  surveyor_action_task = L3_7
  L3_7 = findGameObject2
  L4_8 = "Node"
  L5_9 = "locator2_beacon_dummy"
  L3_7 = L3_7(L4_8, L5_9)
  L4_8 = RAC_LookAtObjectWait
  L5_9 = L3_7
  L4_8(L5_9, 1, 0.5)
  L4_8 = _beacon_objs
  L4_8 = L4_8[1]
  L5_9 = L4_8
  L4_8 = L4_8.setGrabReleasePermission
  L4_8(L5_9, false)
  L4_8 = Fn_captionViewWait
  L5_9 = "sm27_00100"
  L4_8(L5_9)
  L4_8 = Fn_pcSensorOn
  L5_9 = "pccubesensor2_beacon_cap_"
  L5_9 = L5_9 .. string.format("%02d", beacon_phase)
  L4_8(L5_9)
  L4_8 = Fn_missionView
  L5_9 = "sm27_00101"
  L4_8(L5_9)
  while true do
    L4_8 = _beacon_objs
    L5_9 = beacon_phase
    L4_8 = L4_8[L5_9]
    L5_9 = L4_8
    L4_8 = L4_8.isGrabbed
    L4_8 = L4_8(L5_9)
    if not L4_8 then
      L4_8 = beacon_not_have
      if L4_8 == true then
        L4_8 = beacon_away_from
        if L4_8 == false then
          L4_8 = Fn_captionViewWait
          L5_9 = "sm27_00102"
          L4_8(L5_9)
          beacon_away_from = true
        end
      end
    end
    L4_8 = _beacon_objs
    L5_9 = beacon_phase
    L4_8 = L4_8[L5_9]
    L5_9 = L4_8
    L4_8 = L4_8.isGrabbed
    L4_8 = L4_8(L5_9)
    if L4_8 then
      L4_8 = beacon_grab_flag
      if L4_8 == false then
        L4_8 = _beacon_objs
        L5_9 = beacon_phase
        L4_8 = L4_8[L5_9]
        L5_9 = L4_8
        L4_8 = L4_8.setGrabReleasePermission
        L4_8(L5_9, false)
        L4_8 = Fn_missionViewEnd
        L4_8()
        L4_8 = Fn_captionViewEnd
        L4_8()
        beacon_caption_visible = false
        L4_8 = Fn_pcSensorOff
        L5_9 = "pccubesensor2_beacon_not_have"
        L4_8(L5_9)
        L4_8 = Fn_naviKill
        L4_8()
        L4_8 = Fn_pcSensorOff
        L5_9 = "pccubesensor2_beacon_cap_"
        L5_9 = L5_9 .. string.format("%02d", beacon_phase)
        L4_8(L5_9)
        L4_8 = Fn_pcSensorOn
        L5_9 = "pccubesensor2_beacon_goal_"
        L5_9 = L5_9 .. string.format("%02d", beacon_phase)
        L4_8(L5_9)
        L4_8 = surveyor_action_task
        if L4_8 ~= nil then
          L4_8 = surveyor_action_task
          L5_9 = L4_8
          L4_8 = L4_8.abort
          L4_8(L5_9)
          surveyor_action_task = nil
        end
        L4_8 = findGameObject2
        L5_9 = "Node"
        L4_8 = L4_8(L5_9, "locator2_beacon_setup_" .. string.format("%02d", beacon_phase))
        L5_9 = RAC_LookAtObjectWait
        L5_9(L4_8, 1, 0.4)
        L5_9 = beacon_phase
        if L5_9 == 1 then
          L5_9 = Sound
          L5_9 = L5_9.playSE
          L5_9(L5_9, "m32_924a")
          L5_9 = RAC_missionNaviCaption
          L5_9("sm27_00105", L4_8, "sm27_00104")
          L5_9 = sm27_npc_inform_action
          L5_9("sm27_client", L4_8)
        else
          L5_9 = Fn_naviSet
          L5_9(L4_8)
          L5_9 = sm27_npc_inform_action
          L5_9("sm27_client", L4_8)
        end
        beacon_grab_flag = true
      end
    end
    L4_8 = beacon_phase
    if L4_8 == 1 then
      L4_8 = beacon_transport_flag
    else
      if L4_8 ~= true then
        L4_8 = beacon_phase
        if L4_8 == 2 then
          L4_8 = beacon_transport_flag
          if L4_8 == true then
            L4_8 = Player
            L5_9 = L4_8
            L4_8 = L4_8.getAction
            L4_8 = L4_8(L5_9)
            L5_9 = Player
            L5_9 = L5_9.kAction_Idle
          end
        end
    end
    elseif L4_8 == L5_9 then
      L4_8 = Fn_userCtrlAllOff
      L4_8()
      L4_8 = Player
      L5_9 = L4_8
      L4_8 = L4_8.setStay
      L4_8(L5_9, true)
      L4_8 = Fn_blackout
      L4_8()
      L4_8 = Fn_naviKill
      L4_8()
      L4_8 = Player
      L5_9 = L4_8
      L4_8 = L4_8.dropGrabObject
      L4_8(L5_9)
      L4_8 = _beacon_objs
      L5_9 = beacon_phase
      L4_8 = L4_8[L5_9]
      L5_9 = L4_8
      L4_8 = L4_8.requestRestoreForce
      L4_8(L5_9)
      L4_8 = _beacon_objs
      L5_9 = beacon_phase
      L4_8 = L4_8[L5_9]
      L5_9 = L4_8
      L4_8 = L4_8.setWorldTransform
      L4_8(L5_9, findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", beacon_phase)):getWorldTransform())
      L4_8 = _beacon_objs
      L5_9 = beacon_phase
      L4_8 = L4_8[L5_9]
      L5_9 = L4_8
      L4_8 = L4_8.setForceMove
      L4_8(L5_9)
      L4_8 = _beacon_objs
      L5_9 = beacon_phase
      L4_8 = L4_8[L5_9]
      L5_9 = L4_8
      L4_8 = L4_8.setIgnoreGrab
      L4_8(L5_9, true)
      L4_8 = beacon_phase
      if L4_8 == 1 then
        L4_8 = Fn_resetPcPos
        L5_9 = "locator2_beacon_setup_restart_"
        L5_9 = L5_9 .. string.format("%02d", beacon_phase)
        L4_8(L5_9, Player.kReset_Floating)
      else
        L4_8 = Fn_resetPcPos
        L5_9 = "locator2_beacon_setup_restart_"
        L5_9 = L5_9 .. string.format("%02d", beacon_phase)
        L4_8(L5_9)
      end
      L4_8 = Fn_pcSensorOff
      L5_9 = "pccubesensor2_beacon_goal_"
      L5_9 = L5_9 .. string.format("%02d", beacon_phase)
      L4_8(L5_9)
      beacon_grab_flag = false
      beacon_transport_flag = false
      L4_8 = beacon_phase
      if L4_8 == 1 then
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.reset
        L4_8(L5_9)
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.set
        L4_8(L5_9, "locator2_sdemo_beacon_start_cam_01", _beacon_objs[beacon_phase], false, Vector(0, 1.5, 0))
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.play
        L4_8(L5_9)
        L4_8 = Fn_fadein
        L4_8()
        L4_8 = waitSeconds
        L5_9 = 2
        L4_8(L5_9)
        L4_8 = findGameObject2
        L5_9 = "Node"
        L4_8 = L4_8(L5_9, "locator2_beacon_setup_" .. string.format("%02d", beacon_phase))
        L5_9 = L4_8
        L4_8 = L4_8.getWorldTransform
        L5_9 = L4_8(L5_9)
        L4_8.y = L4_8.y + 1.5
        _becon_effects[beacon_phase] = RAC_createEffect({
          eff_name = "ef_ev_glw_red",
          world_pos = L4_8,
          world_rot = L5_9,
          loop = true
        })
        waitSeconds(2)
        Fn_kaiwaDemoView("sm27_00200k")
        sdemo:stop()
      else
        L4_8 = Fn_coercionPoseNomal
        L4_8()
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.reset
        L4_8(L5_9)
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.set
        L4_8(L5_9, "locator2_sdemo_beacon02_cam_02", "locator2_sdemo_beacon02_aim_01", false)
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.play
        L4_8(L5_9)
        L4_8 = Fn_fadein
        L4_8()
        L4_8 = Fn_playPlayerMotion
        L5_9 = _player_motion_table
        L5_9 = L5_9.lookaround_00
        L4_8(L5_9, -1, 0.5)
        L4_8 = waitSeconds
        L5_9 = 0.5
        L4_8(L5_9)
        L4_8 = waitSeconds
        L5_9 = 3.5
        L4_8(L5_9)
        L4_8 = Fn_captionViewWait
        L5_9 = "sm27_00109"
        L4_8(L5_9)
        L4_8 = waitSeconds
        L5_9 = 2
        L4_8(L5_9)
        L4_8 = Player
        L5_9 = L4_8
        L4_8 = L4_8.setSituation
        L4_8(L5_9, Player.kSituation_Normal, true, 0, false, false)
        L4_8 = Fn_kaiwaDemoView
        L5_9 = "sm27_00300k"
        L4_8(L5_9)
        L4_8 = Fn_playPlayerMotion
        L5_9 = _player_motion_table
        L5_9 = L5_9.kit01_stay_00
        L4_8(L5_9, -1, 0.5)
        L4_8 = sdemo
        L5_9 = L4_8
        L4_8 = L4_8.stop
        L4_8(L5_9)
        break
      end
      L4_8 = beacon_phase
      L4_8 = L4_8 + 1
      beacon_phase = L4_8
      L4_8 = print
      L5_9 = "BEACON PHASE:"
      L5_9 = L5_9 .. beacon_phase .. " / " .. beacon_phase_max
      L4_8(L5_9)
      L4_8 = print
      L5_9 = "BEACON PHASE NEXT"
      L4_8(L5_9)
      L4_8 = Fn_pcSensorOn
      L5_9 = "pccubesensor2_beacon_cap_"
      L5_9 = L5_9 .. string.format("%02d", beacon_phase)
      L4_8(L5_9)
      L4_8 = Fn_userCtrlOn
      L4_8()
      L4_8 = Player
      L5_9 = L4_8
      L4_8 = L4_8.setStay
      L4_8(L5_9, false)
      L4_8 = Sound
      L5_9 = L4_8
      L4_8 = L4_8.setGlobalVariable
      L4_8(L5_9, "voice_type", "radio")
      L4_8 = Sound
      L5_9 = L4_8
      L4_8 = L4_8.playSE
      L4_8(L5_9, "m32_909c")
      L4_8 = Sound
      L5_9 = L4_8
      L4_8 = L4_8.setGlobalVariable
      L4_8(L5_9, "voice_type", "normal")
      L4_8 = Fn_captionViewWait
      L5_9 = "sm27_00106"
      L4_8(L5_9)
      L4_8 = Fn_naviSet
      L5_9 = _beacon_objs
      L5_9 = L5_9[beacon_phase]
      L4_8(L5_9)
      L4_8 = waitSeconds
      L5_9 = RAC_CAPTION_DELAY_DEFAULT
      L5_9 = L5_9 - RAC_NAVI_DELAY_DEFAULT
      L4_8(L5_9)
      L4_8 = Fn_captionViewWait
      L5_9 = "sm27_00107"
      L4_8(L5_9)
      L4_8 = _beacon_objs
      L5_9 = beacon_phase
      L4_8 = L4_8[L5_9]
      L5_9 = L4_8
      L4_8 = L4_8.setIgnoreGrab
      L4_8(L5_9, false)
    end
    L4_8 = wait
    L4_8()
  end
  beacon_phase = 2
  L4_8 = RAC_startCatWarpControl
  L5_9 = "sm27_outrange_warp"
  L4_8(L5_9, nil, "pccubesensor2_out_of_range_01", "pccubesensor2_out_of_range_02", "locator2_beacon_setup_restart_02", nil, nil, "sm27_00121", sm27_outrange_before2, sm27_outrange_grabreset2)
  L4_8 = Fn_userCtrlOn
  L4_8()
  L4_8 = Player
  L5_9 = L4_8
  L4_8 = L4_8.setStay
  L4_8(L5_9, false)
  L4_8 = Fn_setGrabNpc
  L5_9 = "sm27_client"
  L4_8(L5_9, true, false)
  L4_8 = _beacon_objs
  L4_8 = L4_8[3]
  L5_9 = L4_8
  L4_8 = L4_8.setIgnoreGrab
  L4_8(L5_9, true)
  L4_8 = _beacon_objs
  L4_8 = L4_8[3]
  L5_9 = L4_8
  L4_8 = L4_8.setGrabReleasePermission
  L4_8(L5_9, false)
  L4_8 = Fn_captionView
  L5_9 = "sm27_00110"
  L4_8(L5_9)
  L4_8 = waitSeconds
  L5_9 = SM27_EVENT_MANNERS_DELAY
  L4_8(L5_9)
  L4_8 = Fn_missionView
  L5_9 = "sm27_00113"
  L4_8(L5_9)
  L4_8 = waitSeconds
  L5_9 = RAC_NAVI_DELAY_DEFAULT
  L4_8(L5_9)
  L4_8 = Fn_findNpc
  L5_9 = "sm27_client"
  L4_8 = L4_8(L5_9)
  L5_9 = false
  beacon_transport_flag = false
  while true do
    if not L4_8:isGrabbed() then
      Fn_pcSensorOff("pccubesensor2_beacon_goal_" .. string.format("%02d", beacon_phase))
      sm27_grabNpcCaption("sm27_client", "sm27_00112", "ic_tutorial_00410", nil, "beacon_03", "pccubesensor2_surveyor_cap", false, "m32_906c", nil)
      if not L5_9 then
        RAC_changeNodeCatWarpControl("sm27_outrange_warp", "locator2_pc_start_pos")
        waitSeconds(1)
        Fn_kaiwaDemoView("sm27_00400k")
        if surveyor_action_task ~= nil then
          surveyor_action_task:abort()
          surveyor_action_task = nil
        end
        surveyor_action_task = invokeTask(function()
          while not Fn_findNpc("sm27_client"):isGrabbed() do
            wait()
          end
          Sound:playSE("m32_013")
          Fn_captionViewWait("sm27_00114")
          while not Fn_findNpc("sm27_client"):isGrabbed() do
            wait()
          end
          Fn_captionViewWait("sm27_00115")
          while not Fn_findNpc("sm27_client"):isGrabbed() do
            wait()
          end
          Sound:playSE("m32_013")
          Fn_captionViewWait("sm27_00116")
        end)
        L5_9 = true
      end
      Fn_pcSensorOn("pccubesensor2_beacon_goal_" .. string.format("%02d", beacon_phase))
      Fn_naviSet(findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", beacon_phase)))
    else
    end
    if not beacon_transport_flag or Player:getAction() == Player.kAction_Idle then
      wait()
    end
  end
  if surveyor_action_task ~= nil then
    surveyor_action_task:abort()
    surveyor_action_task = nil
  end
  L4_8 = Fn_userCtrlAllOff
  L4_8()
  L4_8 = Fn_blackout
  L4_8()
  L4_8 = Fn_naviKill
  L4_8()
  L4_8 = Fn_captionViewEnd
  L4_8()
  L4_8 = Player
  L5_9 = L4_8
  L4_8 = L4_8.dropGrabObject
  L4_8(L5_9)
  L4_8 = Fn_setGrabNpc
  L5_9 = "sm27_client"
  L4_8(L5_9, true, false)
  surveyor_grab = false
  surveyor_grabbed = false
  L4_8 = _beacon_objs
  L4_8 = L4_8[3]
  L5_9 = L4_8
  L4_8 = L4_8.requestRestoreForce
  L4_8(L5_9)
  L4_8 = _beacon_objs
  L4_8 = L4_8[3]
  L5_9 = L4_8
  L4_8 = L4_8.setWorldTransform
  L4_8(L5_9, findGameObject2("Node", "locator2_beacon_03_Retransport"):getWorldTransform())
  L4_8 = _beacon_objs
  L4_8 = L4_8[3]
  L5_9 = L4_8
  L4_8 = L4_8.setForceMove
  L4_8(L5_9)
  L4_8 = _beacon_objs
  L4_8 = L4_8[3]
  L5_9 = L4_8
  L4_8 = L4_8.setIgnoreGrab
  L4_8(L5_9, true)
  L4_8 = Fn_resetPcPos
  L5_9 = "locator2_beacon_setup_restart_"
  L5_9 = L5_9 .. string.format("%02d", beacon_phase)
  L4_8(L5_9)
  L4_8 = Fn_warpNpc
  L5_9 = "sm27_client"
  L4_8(L5_9, "locator2_beacon_surveyor_" .. string.format("%02d", beacon_phase))
  L4_8 = Fn_pcSensorOff
  L5_9 = "pccubesensor2_beacon_goal_"
  L5_9 = L5_9 .. string.format("%02d", beacon_phase)
  L4_8(L5_9)
  L4_8 = sdemo
  L5_9 = L4_8
  L4_8 = L4_8.reset
  L4_8(L5_9)
  L4_8 = sdemo
  L5_9 = L4_8
  L4_8 = L4_8.set
  L4_8(L5_9, "locator2_sdemo_beacon02_cam_02", "locator2_sdemo_beacon02_aim_01", false)
  L4_8 = sdemo
  L5_9 = L4_8
  L4_8 = L4_8.play
  L4_8(L5_9)
  L4_8 = false
  L5_9 = invokeTask
  L5_9(function()
    Fn_playNpcEventMotion("sm27_client", sm27_surveyor_motion_table.repair_00, true, 0, false)
    waitSeconds(5)
    findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", beacon_phase)):getWorldTransform().y = findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", beacon_phase)):getWorldTransform().y + 1.5
    _becon_effects[beacon_phase] = RAC_createEffect({
      eff_name = "ef_ev_glw_blue",
      world_pos = findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", beacon_phase)):getWorldTransform()
    })
    Fn_captionViewWait("sm27_00117")
    waitSeconds(1)
    L4_8 = true
  end)
  L5_9 = Fn_fadein
  L5_9()
  while L4_8 == false do
    L5_9 = wait
    L5_9()
  end
  function L5_9()
    Fn_playMotionNpc("sm27_client", "lookaround_01", false)
  end
  Fn_kaiwaDemoView2("sm27_00500k", L5_9)
  sdemo:stop()
  beacon_phase = 3
  RAC_startCatWarpControl("sm27_outrange_warp", nil, "pccubesensor2_out_of_range_01", "pccubesensor2_out_of_range_02", "locator2_beacon_setup_restart_02", nil, nil, "sm27_00121", sm27_outrange_before3, sm27_outrange_grabreset3)
  Fn_userCtrlOn()
  Fn_setGrabNpc("sm27_client", true, false)
  _beacon_objs[3]:setIgnoreGrab(true)
  _beacon_objs[3]:setGrabReleasePermission(false)
  Fn_missionView("sm27_00105")
  beacon_transport_flag = false
  while true do
    if not Fn_findNpc("sm27_client"):isGrabbed() then
      Fn_pcSensorOff("pccubesensor2_beacon_goal_" .. string.format("%02d", beacon_phase))
      GrabSensorOn("sm27_client", "beacon_03", "pccubesensor2_beacon_cap_03")
      WaitSecondsGrab("sm27_client", RAC_OPERATION_TUTORIAL_DELAY_DEFAULT)
      sm27_grabNpcCaption("sm27_client", nil, "ic_tutorial_00410", "sm27_00118", "beacon_03", "pccubesensor2_beacon_cap_03", true, nil, "m32_931b", 10)
      if not false then
        if surveyor_action_task ~= nil then
          surveyor_action_task:abort()
          surveyor_action_task = nil
        end
        surveyor_action_task = invokeTask(function()
          while not Fn_findNpc("sm27_client"):isGrabbed() do
            wait()
          end
          Sound:playSE("m32_013")
          Fn_captionViewWait("sm27_00119")
          while not Fn_findNpc("sm27_client"):isGrabbed() do
            wait()
          end
          Fn_captionViewWait("sm27_00120")
        end)
      end
      Fn_pcSensorOn("pccubesensor2_beacon_goal_" .. string.format("%02d", beacon_phase))
      Fn_naviSet(findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", beacon_phase)))
    else
    end
    if not beacon_transport_flag or Player:getAction() == Player.kAction_Idle then
      wait()
    end
  end
  if surveyor_action_task ~= nil then
    surveyor_action_task:abort()
    surveyor_action_task = nil
  end
  Fn_userCtrlAllOff()
  Fn_blackout()
  Fn_naviKill()
  Fn_captionViewEnd()
  RAC_endCatWarpControl("sm27_outrange_warp")
  Player:dropGrabObject()
  Fn_setGrabNpc("sm27_client", true, false)
  surveyor_grab = false
  surveyor_grabbed = false
  Fn_pcSensorOff("pccubesensor2_beacon_goal_" .. string.format("%02d", beacon_phase))
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Player:resetGrabPickupCategPriority()
  Player:setGrabExceptionalObject({})
  Player:setForcedNormalGrab(false)
  Sound:setGlobalVariable("voice_type", "normal")
end
function pccubesensor2_beacon_cap_OnEnter()
  _beacon_objs[beacon_phase]:setIgnoreGrab(false)
  Fn_naviKill()
  invokeTask(function()
    if beacon_phase == 1 then
      waitSeconds(RAC_OPERATION_TUTORIAL_DELAY_DEFAULT)
    end
    if not _beacon_objs[beacon_phase]:isGrabbed() then
      Fn_captionView("ic_tutorial_00410", 0)
    end
  end)
  Fn_pcSensorOn("pccubesensor2_beacon_not_have")
  beacon_caption_visible = true
  beacon_away_from = false
end
function pccubesensor2_beacon_cap_OnLeave()
  if not _beacon_objs[beacon_phase]:isGrabbed() then
    _beacon_objs[3]:setIgnoreGrab(true)
    Fn_naviSet(_beacon_objs[beacon_phase])
    Fn_captionViewEnd()
    beacon_caption_visible = false
  end
end
function pccubesensor2_beacon_goal_01_OnEnter()
  local L0_13, L1_14
  beacon_transport_flag = true
end
function pccubesensor2_beacon_goal_01_OnLeave()
  local L0_15, L1_16
  beacon_transport_flag = false
end
function pccubesensor2_beacon_goal_02_OnEnter()
  local L0_17, L1_18
  beacon_transport_flag = true
end
function pccubesensor2_beacon_goal_02_OnLeave()
  local L0_19, L1_20
  beacon_transport_flag = false
end
function pccubesensor2_surveyor_cap_OnEnter()
  print("pccubesensor2_surveyor_cap_OnEnter")
  Fn_setGrabNpc("sm27_client", false, false)
  _beacon_objs[3]:setIgnoreGrab(false)
end
function pccubesensor2_surveyor_cap_OnLeave()
  print("pccubesensor2_surveyor_cap_OnLeave")
  if not Fn_findNpc("sm27_client"):isGrabbed() and surveyor_grabbed == false then
    Fn_setGrabNpc("sm27_client", true, false)
    _beacon_objs[3]:setIgnoreGrab(true)
  end
end
function pccubesensor2_beacon_goal_03_OnEnter()
  local L0_21, L1_22
  beacon_transport_flag = true
end
function pccubesensor2_beacon_goal_03_OnLeave()
  local L0_23, L1_24
  beacon_transport_flag = false
end
function pccubesensor2_beacon_not_have_OnEnter()
  local L0_25, L1_26
  beacon_not_have = false
end
function pccubesensor2_beacon_not_have_OnLeave()
  local L0_27, L1_28
  beacon_not_have = true
end
function GrabSensorOn(A0_29, A1_30, A2_31)
  Player:setGrabPickupCategPriority("gimmickbg")
  Player:setGrabPickupCategPriority("npc")
  Fn_findNpc(A0_29):getPuppet():resetGrabPickupPriority()
  findGameObject2("GimmickBg", A1_30):setGrabPickupPriorityHigh()
  Fn_pcSensorOn(A2_31)
end
function sm27_npc_action(A0_32)
  return invokeTask(function()
    local L0_33, L1_34, L2_35, L3_36
    L0_33 = Fn_findNpc
    L1_34 = A0_32
    L0_33 = L0_33(L1_34)
    while true do
      repeat
        L1_34 = motion_data
        L2_35 = RandI
        L3_36 = 1
        L2_35 = L2_35(L3_36, #motion_data)
        L1_34 = L1_34[L2_35]
        L2_35 = Fn_playMotionNpc
        L3_36 = L0_33
        L2_35(L3_36, L1_34, true)
        L2_35 = Fn_playMotionNpc
        L3_36 = L0_33
        L2_35(L3_36, "stay", true)
        L2_35 = 0
        while true do
          L3_36 = L0_33.isInSight
          L3_36 = L3_36(L0_33)
          if L3_36 == false then
            L3_36 = false
            invokeTask(function()
              Fn_turnNpc(L0_33)
              L3_36 = true
            end)
            while L3_36 == false do
              L2_35 = L2_35 + 1
              wait()
            end
          else
          end
          L2_35 = L2_35 + 1
          L3_36 = wait
          L3_36()
        end
      until L2_35 < 90
    end
  end)
end
function sm27_npc_inform_action(A0_37, A1_38)
  invokeTask(function()
    Fn_findNpc(A0_37):turn(A1_38)
    repeat
      wait()
    until Fn_findNpc(A0_37):isTurnEnd()
    Fn_playMotionNpc(A0_37, "inform_in", true)
    waitSeconds(2)
    Fn_playMotionNpc(A0_37, "inform_ed", true)
    if surveyor_action_task ~= nil then
      surveyor_action_task:abort()
      surveyor_action_task = nil
    end
    surveyor_action_task = sm27_npc_action(A0_37)
  end)
end
function sm27_outrange_before1()
  Player:dropGrabObject()
  wait()
  if beacon_grab_flag == true then
    _beacon_objs[beacon_phase]:requestRestoreForce()
    _beacon_objs[beacon_phase]:setWorldTransform(findGameObject2("Node", "locator2_beacon_" .. string.format("%02d", beacon_phase)):getWorldTransform())
    _beacon_objs[beacon_phase]:setForceMove()
    _beacon_objs[beacon_phase]:setIgnoreGrab(false)
  end
end
function sm27_outrange_grabreset1()
  if beacon_grab_flag == true then
    Player:setGrabObject(_beacon_objs[beacon_phase])
  end
end
function sm27_outrange_before2()
  Player:dropGrabObject()
  wait()
  if surveyor_grab == true then
    Fn_warpNpc("sm27_client", "locator2_beacon_surveyor_01")
    Fn_setGrabNpc("sm27_client", false, false)
    _beacon_objs[3]:requestRestoreForce()
    _beacon_objs[3]:setWorldTransform(findGameObject2("Node", "locator2_beacon_03"):getWorldTransform())
    _beacon_objs[3]:setForceMove()
    _beacon_objs[3]:setIgnoreGrab(false)
    surveyor_grabbed = true
  end
end
function sm27_outrange_grabreset2()
  if surveyor_grabbed == true then
    Player:setGrabObject(Fn_findNpcPuppet("sm27_client"))
    Player:setGrabObject(_beacon_objs[3])
    surveyor_grabbed = false
  end
end
function sm27_outrange_before3()
  Player:dropGrabObject()
  wait()
  if surveyor_grab == true then
    Fn_warpNpc("sm27_client", "locator2_beacon_surveyor_02")
    Fn_setGrabNpc("sm27_client", false, false)
    _beacon_objs[3]:requestRestoreForce()
    _beacon_objs[3]:setWorldTransform(findGameObject2("Node", "locator2_beacon_03_Retransport"):getWorldTransform())
    _beacon_objs[3]:setForceMove()
    _beacon_objs[3]:setIgnoreGrab(false)
    surveyor_grabbed = true
  end
end
function sm27_outrange_grabreset3()
  if surveyor_grabbed == true then
    Player:setGrabObject(_beacon_objs[3])
    Player:setGrabObject(Fn_findNpcPuppet("sm27_client"))
    surveyor_grabbed = false
  end
end
function sm27_grabNpcCaption(A0_39, A1_40, A2_41, A3_42, A4_43, A5_44, A6_45, A7_46, A8_47, A9_48)
  local L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55
  L10_49 = Fn_findNpc
  L11_50 = A0_39
  L10_49 = L10_49(L11_50)
  L11_50 = findGameObject2
  L12_51 = "GimmickBg"
  L13_52 = A4_43
  L11_50 = L11_50(L12_51, L13_52)
  L12_51 = false
  L13_52 = false
  L14_53 = false
  L15_54 = false
  L16_55 = nil
  Fn_naviSet(L10_49)
  L14_53 = true
  GrabSensorOn(A0_39, A4_43, A5_44)
  surveyor_grab = false
  while not L10_49:isGrabbed() do
    if Fn_getDistanceToPlayer(L10_49) < 2 then
      if not L12_51 then
        if L15_54 == false and A1_40 ~= nil then
          if not A6_45 then
            L16_55 = invokeTask(function()
              Fn_turnNpc(L10_49)
              if surveyor_action_task ~= nil then
                surveyor_action_task:abort()
                surveyor_action_task = nil
              end
              surveyor_action_task = sm27_npc_action(A0_39)
            end)
          end
          if A7_46 ~= nil then
            Sound:playSE(A7_46)
          end
          Fn_captionViewWait(A1_40, 2)
          L15_54 = true
        end
        if A2_41 ~= nil then
          Fn_captionView(A2_41, 0)
        end
        L12_51 = true
        L13_52 = false
      end
      if L14_53 then
        Fn_naviKill()
        L14_53 = false
      end
    else
      if not L13_52 then
        if A3_42 ~= nil then
          if A9_48 and A9_48 <= Fn_getDistanceToPlayer(L10_49) then
            if A8_47 ~= nil then
              Sound:playSE(A8_47)
            end
            Fn_captionView(A3_42)
            L13_52 = true
            L12_51 = false
          end
        else
          Fn_captionViewEnd()
          L13_52 = true
          L12_51 = false
        end
      end
      if not L14_53 then
        Fn_naviSet(L10_49)
        L14_53 = true
      end
    end
    wait()
  end
  if L16_55 ~= nil then
    L16_55:abort()
    L16_55 = nil
  end
  if surveyor_action_task ~= nil then
    surveyor_action_task:abort()
    surveyor_action_task = nil
  end
  if L14_53 then
    Fn_naviKill()
    L14_53 = false
  end
  if L12_51 or L13_52 then
    Fn_captionViewEnd()
    L12_51 = false
    L13_52 = false
  end
  Fn_pcSensorOff(A5_44)
  surveyor_grab = true
end
