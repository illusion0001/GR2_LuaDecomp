import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/sm26_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
GAME_CLEAR_TIME_RANK1 = 1.5
GAME_CLEAR_TIME_RANK2 = 2.5
GAME_CLEAR_LINEUP_RANK1 = 20
GAME_CLEAR_LINEUP_RANK2 = 10
GAME_CLEAR_LINEUP_RANK3 = 5
WALK_TIME = {60}
costume_pdemo = nil
client_motion_task = nil
function Initialize()
  SM26_Initialize()
  RAC_startCatWarpControl("sm26_area_out", nil, "pccubesensor2_rangeout_caption", "pccubesensor2_rangeout_reset", "locator2_pc_start_pos", "locator2_pc_start_pos", "locator2_pc_start_pos", "sm26_00112")
  costume_pdemo = PDemo.create("kit06_waitress_00", findGameObject2("Node", "locator2_costume"), {camera = true, scene_param = false})
  RAC_side_setupShopNpc()
  Mob:restrictNav_sm26_00(true)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  while true do
    L0_0 = costume_pdemo
    L1_1 = L0_0
    L0_0 = L0_0.isLoading
    L0_0 = L0_0(L1_1)
    if L0_0 == false then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm26_00100k"
  L0_0(L1_1)
  L0_0 = Fn_blackout
  L0_0()
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrict_sm26_00
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = del_sm34_npc
  L0_0()
  L0_0 = Fn_setCostume
  L1_1 = "kit06"
  L0_0(L1_1)
  L0_0 = Fn_disableCostumeChange
  L1_1 = true
  L0_0(L1_1)
  L0_0 = wait
  L0_0()
  L0_0 = Fn_resetPcPos
  L1_1 = "locator2_costume_wait"
  L0_0(L1_1)
  L0_0 = Fn_setNpcActive
  L1_1 = "sm26_client"
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = costume_pdemo
  L1_1 = L0_0
  L0_0 = L0_0.play
  L0_0(L1_1)
  L0_0 = Fn_fadein
  L0_0()
  while true do
    L0_0 = costume_pdemo
    L1_1 = L0_0
    L0_0 = L0_0.isEnd
    L0_0 = L0_0(L1_1)
    if L0_0 == false then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm26_00110k"
  L0_0(L1_1)
  L0_0 = Fn_blackout
  L1_1 = 0.5
  L0_0(L1_1)
  L0_0 = costume_pdemo
  L1_1 = L0_0
  L0_0 = L0_0.stop
  L2_2 = 0
  L0_0(L1_1, L2_2)
  L0_0 = costume_pdemo
  L1_1 = L0_0
  L0_0 = L0_0.try_term
  L0_0(L1_1)
  L0_0 = Fn_playPlayerMotion
  L1_1 = "stay"
  L2_2 = -1
  L0_0(L1_1, L2_2)
  L0_0 = SM26_InitGameParam
  L0_0()
  L0_0 = Fn_resetPcPos
  L1_1 = "locator2_game_start"
  L0_0(L1_1)
  L0_0 = Fn_setNpcActive
  L1_1 = "sm26_client"
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Fn_warpNpc
  L1_1 = "sm26_client"
  L2_2 = "locator2_warp_npc_01"
  L0_0(L1_1, L2_2)
  L0_0 = SM26_playClientMotionTask
  L0_0 = L0_0()
  client_motion_task = L0_0
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictNav_sm26_00
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_fadein
  L1_1 = 0.5
  L0_0(L1_1)
  L0_0 = RAC_infoView
  L1_1 = "sm26_info_01"
  L0_0(L1_1)
  L0_0 = Fn_missionView
  L1_1 = "sm26_00100"
  L0_0(L1_1)
  L0_0 = Fn_countDownWithTimer
  L0_0()
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.timerSetSecond
  L2_2 = {
    L3_3,
    L4_4,
    0,
    0
  }
  L3_3 = 0
  L4_4 = 0
  L0_0(L1_1, L2_2)
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.timerSetVisible
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.timerStart
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_setBgmPoint
  L1_1 = "event"
  L2_2 = "eventstart"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_captionView
  L1_1 = "sm26_00101"
  L0_0(L1_1)
  L0_0 = SM26_SetMapMaker
  L1_1 = true
  L0_0(L1_1)
  L0_0 = kit_soliloquy_task
  L0_0 = L0_0()
  L1_1 = {}
  L1_1.train = "sm26_00110"
  L2_2 = SM26_InvokeTimeTask
  L3_3 = WALK_TIME
  L4_4 = L1_1
  L2_2 = L2_2(L3_3, L4_4, "sm26_00111")
  L3_3 = SM26_GameLoop
  L3_3()
  L3_3 = Fn_setBgmPoint
  L4_4 = "event"
  L3_3(L4_4, "eventend")
  L3_3 = HUD
  L4_4 = L3_3
  L3_3 = L3_3.timerStop
  L3_3(L4_4)
  if L2_2 ~= nil then
    L4_4 = L2_2
    L3_3 = L2_2.abort
    L3_3(L4_4)
    L2_2 = nil
  end
  L3_3 = Fn_userCtrlAllOff
  L3_3()
  L4_4 = L0_0
  L3_3 = L0_0.abort
  L3_3(L4_4)
  L0_0 = nil
  L3_3 = Fn_Finish
  L3_3()
  L3_3 = Fn_blackout
  L3_3()
  L3_3 = client_motion_task
  L4_4 = L3_3
  L3_3 = L3_3.abort
  L3_3(L4_4)
  client_motion_task = nil
  L3_3 = SM26_SetMapMaker
  L4_4 = false
  L3_3(L4_4)
  L3_3 = RAC_endCatWarpControl
  L4_4 = "sm26_area_out"
  L3_3(L4_4)
  L3_3 = Fn_resetPcPos
  L4_4 = "locator2_pc_start_pos"
  L3_3(L4_4)
  L3_3 = Fn_setNpcActive
  L4_4 = "sm26_client"
  L3_3(L4_4, true)
  L3_3 = Mob
  L4_4 = L3_3
  L3_3 = L3_3.letStateMode
  L3_3(L4_4, Mob.StateMode.kGrabbed, false)
  L3_3 = Mob
  L4_4 = L3_3
  L3_3 = L3_3.letStateMode
  L3_3(L4_4, Mob.StateMode.kGrabThrowing, false)
  L3_3 = SM26_ClearFinalize
  L3_3()
  L3_3 = HUD
  L4_4 = L3_3
  L3_3 = L3_3.counter999SetVisible
  L3_3(L4_4, false)
  L3_3 = HUD
  L4_4 = L3_3
  L3_3 = L3_3.timerGetSecond
  L3_3 = L3_3(L4_4)
  L4_4 = "sm26_00193k"
  if L3_3 ~= nil and L3_3 < 60 * GAME_CLEAR_TIME_RANK1 then
    SM26_RespawnClearLineUp(GAME_CLEAR_LINEUP_RANK1)
    L4_4 = "sm26_00191k"
  elseif L3_3 ~= nil and L3_3 < 60 * GAME_CLEAR_TIME_RANK2 then
    SM26_RespawnClearLineUp(GAME_CLEAR_LINEUP_RANK2)
    L4_4 = "sm26_00192k"
  else
    SM26_RespawnClearLineUp(GAME_CLEAR_LINEUP_RANK3)
  end
  Fn_fadein()
  Fn_playMotionNpc("sm26_client", NPC_MOTION.greeting, true)
  Fn_kaiwaDemoView(L4_4)
  L3_3 = Fn_playLoopMotionInsert
  L4_4 = "sm26_client"
  L3_3(L4_4, "stay", {
    NPC_MOTION.greeting
  }, 30, 40)
  L3_3 = RAC_endLineup
  L4_4 = "lineup_03"
  L3_3(L4_4)
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = Fn_setKeepPlayerPos
  L3_3()
  L3_3 = Fn_setNextMissionFlag
  L3_3()
  L3_3 = Fn_nextMission
  L3_3()
  L3_3 = Fn_exitSandbox
  L3_3()
end
function Finalize()
  Mob:restrictNav_sm26_00(false)
  SM26_ClearFinalize(false)
  SM26_MobReset()
  RAC_side_endShopNpcTask()
  Fn_disableCostumeChange(false)
  if client_motion_task ~= nil then
    client_motion_task:abort()
    client_motion_task = nil
  end
  Player:setForcedNormalGrab(false)
end
function kit_soliloquy_task()
  local L0_5
  L0_5 = 0
  return invokeTask(function()
    local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13
    L0_6 = {
      L1_7,
      L2_8,
      L3_9
    }
    L1_7 = "sm26_00102"
    L2_8 = "sm26_00103"
    L3_9 = "sm26_00104"
    L1_7 = {
      L2_8,
      L3_9,
      L4_10
    }
    L2_8 = 40
    L3_9 = 25
    L4_10 = 10
    L2_8 = {
      L3_9,
      L4_10,
      L5_11,
      L6_12,
      L7_13
    }
    L3_9 = "sm26_00105"
    L4_10 = "sm26_00106"
    L5_11 = "sm26_00107"
    L6_12 = "sm26_00108"
    L7_13 = "sm26_00109"
    L3_9 = {
      L4_10,
      L5_11,
      L6_12,
      L7_13,
      "kit024"
    }
    L4_10 = "pc1_051"
    L5_11 = "pc1_081"
    L6_12 = "kit055b"
    L7_13 = "kit052c_1"
    L4_10 = 1
    L5_11 = 0
    L6_12, L7_13 = nil, nil
    while true do
      L5_11 = _score
      if L5_11 ~= L5_11 then
        L6_12 = Sound:playSE("success")
        if L4_10 <= #L1_7 then
        end
      end
      if L1_7[L4_10] >= GAME_CLEAR_SCORE - _score == true then
        while Fn_captionViewLock(L0_6[L4_10], 1) == false do
          wait()
        end
        waitSeconds(3)
        L4_10 = L4_10 + 1
      end
      if Player:getGrabObjectCount() > L0_5 and Fn_isCaptionView() == false then
        Fn_captionView(L2_8[math.random(#L2_8)])
        L7_13 = Sound:playSE(L3_9[math.random(#L3_9)])
      end
      L0_5 = Player:getGrabObjectCount()
      wait()
    end
    Sound:stopSEHandle(L6_12)
    Sound:stopSEHandle(L7_13)
  end)
end
function del_sm34_npc()
  local L0_14, L1_15, L2_16, L3_17
  for L3_17 = 1, 30 do
    Fn_disappearNpc("passer_05_" .. string.format("%02d", L3_17))
  end
end
