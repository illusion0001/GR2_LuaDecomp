dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm34_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
NEED_MIN_POINT_TBL = {45}
NEED_HAND_OUT_POINT = 70
CLEAR_TIME_RANK1 = 1
CLEAR_TIME_RANK2 = 2
CLEAR_LINEUP_RANK1 = 20
CLEAR_LINEUP_RANK2 = 10
CLEAR_LINEUP_RANK3 = 5
MOTION_TBL = {
  stay_01 = "man01_call_00",
  stay_02 = "man01_merry_00",
  stay_03 = "man01_watching_soft_00",
  greeting = "man01_greeting_00"
}
GROUP_TBL = {
  {group_idx = 3}
}
max_npc_count = {}
spawn_npc_count = {}
task_dest_manager = {}
effect = {}
costume_pdemo = nil
function Initialize()
  SM34_SetUpChara()
  RAC_startCatWarpControl("sm34_area_out", nil, "pccubesensor2_area_out_caption", "pccubesensor2_area_out_reset", "locator2_pc_start_pos", nil, "locator2_pc_start_pos", "sm34_00100")
  costume_pdemo = PDemo.create("kit06_waitress_00", findGameObject2("Node", "warppoint2_pc_01"), {camera = true, scene_param = false})
  RAC_side_setupShopNpc()
  Mob:restrictNav_sm34_00(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
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
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = SM34_Initialize
  L1_1 = GROUP_TBL
  L2_2 = max_npc_count
  L3_3 = spawn_npc_count
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm34_00100k"
  L0_0(L1_1)
  L0_0 = Fn_blackout
  L0_0()
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrict_sm34_00
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Fn_setCostume
  L1_1 = "kit06"
  L0_0(L1_1)
  L0_0 = Fn_disableCostumeChange
  L1_1 = true
  L0_0(L1_1)
  L0_0 = wait
  L0_0()
  L0_0 = Fn_resetPcPos
  L1_1 = "warppoint2_pc_02"
  L0_0(L1_1)
  L0_0 = Fn_setNpcActive
  L1_1 = "sm34_client"
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setStay
  L2_2 = true
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
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.restrictNav_sm34_00
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm34_00110k"
  L0_0(L1_1)
  L0_0 = Fn_blackout
  L1_1 = 0.5
  L0_0(L1_1)
  L0_0 = Fn_resetPcPos
  L1_1 = "warppoint2_pc_01"
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
  L0_0 = Fn_createGimmickBg
  L1_1 = "loc_l_hand"
  L2_2 = "flyer_pc"
  L3_3 = "ciflyer02_base"
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L1_1 = Fn_attachJoint
  L2_2 = L0_0
  L3_3 = Player
  L4_4 = L3_3
  L3_3 = L3_3.getPuppet
  L3_3 = L3_3(L4_4)
  L4_4 = "loc_l_hand"
  L1_1(L2_2, L3_3, L4_4)
  L2_2 = L0_0
  L1_1 = L0_0.setPos
  L3_3 = Vector
  L4_4 = 0.03
  L5_5 = -0.01
  L6_6 = -0.02
  L10_10 = L3_3(L4_4, L5_5, L6_6)
  L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L3_3(L4_4, L5_5, L6_6))
  L2_2 = L0_0
  L1_1 = L0_0.setRot
  L3_3 = XYZRotQuaternionEular
  L4_4 = 0
  L5_5 = 0
  L6_6 = 85
  L10_10 = L3_3(L4_4, L5_5, L6_6)
  L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L3_3(L4_4, L5_5, L6_6))
  L1_1 = Fn_setNpcActive
  L2_2 = "sm34_client"
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = Fn_warpNpc
  L2_2 = "sm34_client"
  L3_3 = "warppoint2_npc"
  L1_1(L2_2, L3_3)
  L1_1 = Fn_fadein
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setStay
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = RAC_infoView
  L2_2 = "sm34_info_01"
  L1_1(L2_2)
  L1_1 = Fn_missionView
  L2_2 = "sm34_00101"
  L1_1(L2_2)
  L1_1 = Fn_setBgmPoint
  L2_2 = "event"
  L3_3 = "beforecount"
  L1_1(L2_2, L3_3)
  L1_1 = Fn_countDown
  L1_1()
  L1_1 = Fn_setBgmPoint
  L2_2 = "event"
  L3_3 = "eventstart"
  L1_1(L2_2, L3_3)
  L1_1 = SM34_InitMob
  L1_1()
  L1_1 = {}
  L1_1.str_score = "sm34_00102"
  L2_2 = NEED_HAND_OUT_POINT
  L1_1.num_score = L2_2
  L2_2 = SM34_SetUpHUD
  L3_3 = nil
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L2_2 = SM34_AddScore
  L2_2 = L2_2()
  L3_3 = KitSoliloquyTask
  L3_3 = L3_3()
  L4_4 = SM34_CleanupTaskDestManagerTask
  L4_4 = L4_4()
  L5_5 = Fn_userCtrlOn
  L5_5()
  while true do
    L5_5 = NEED_HAND_OUT_POINT
    L6_6 = got_guest_num
    L5_5 = L5_5 - L6_6
    L6_6 = Mob
    L6_6 = L6_6.getLeafletCount
    L6_6 = L6_6(L7_7)
    L5_5 = L5_5 - L6_6
    if L5_5 > 0 then
      L5_5 = wait
      L5_5()
      L5_5 = {}
      L5_5.caption = "sm34_00103"
      L5_5.sound = "m31_006"
      L6_6 = NEED_HAND_OUT_POINT
      L6_6 = L6_6 - L7_7
      L6_6 = L6_6 - L7_7
      L10_10 = L6_6
      L7_7(L8_8, L9_9, L10_10, L5_5)
      L10_10 = got_guest_num
      L10_10 = Mob
      L10_10 = L10_10.getLeafletCount
      L10_10 = L10_10(L10_10)
      L10_10 = 0
      L7_7(L8_8, L9_9, L10_10)
    end
  end
  L5_5 = Fn_userCtrlOff
  L5_5()
  L6_6 = L2_2
  L5_5 = L2_2.abort
  L5_5(L6_6)
  L2_2 = nil
  L6_6 = L3_3
  L5_5 = L3_3.abort
  L5_5(L6_6)
  L3_3 = nil
  L5_5 = SM34_EndHUD
  L5_5()
  L5_5 = Fn_setBgmPoint
  L6_6 = "event"
  L5_5(L6_6, L7_7)
  L5_5 = Fn_finish
  L5_5()
  L6_6 = L4_4
  L5_5 = L4_4.abort
  L5_5(L6_6)
  L4_4 = nil
  L5_5 = Fn_blackout
  L5_5()
  L6_6 = L0_0
  L5_5 = L0_0.setActive
  L5_5(L6_6, L7_7)
  L5_5 = SM34_ClearFinalize
  L5_5()
  L5_5 = RAC_endCatWarpControl
  L6_6 = "sm34_area_out"
  L5_5(L6_6)
  L5_5 = SM34_InitializeLineup
  L6_6 = "locator2_lineup_clear_"
  L5_5(L6_6)
  L5_5 = Fn_resetPcPos
  L6_6 = "locator2_pc_start_pos"
  L5_5(L6_6)
  L5_5 = Fn_setNpcActive
  L6_6 = "sm34_client"
  L5_5(L6_6, L7_7)
  L5_5 = "sm34_00400k"
  L6_6 = HUD
  L6_6 = L6_6.timerGetSecond
  L6_6 = L6_6(L7_7)
  if L6_6 ~= nil then
    if L6_6 < L7_7 then
      L7_7(L8_8)
      L5_5 = "sm34_00200k"
    end
  elseif L6_6 ~= nil then
    if L6_6 < L7_7 then
      L7_7(L8_8)
      L5_5 = "sm34_00300k"
    end
  else
    L7_7(L8_8)
  end
  L6_6 = Fn_fadein
  L6_6()
  L6_6 = Fn_playMotionNpc
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = Fn_setBgmPoint
  L6_6(L7_7, L8_8)
  L6_6 = Fn_kaiwaDemoView
  L6_6(L7_7)
  L6_6 = Fn_setBgmPoint
  L6_6(L7_7, L8_8)
  L6_6 = Fn_playLoopMotionInsert
  L10_10 = MOTION_TBL
  L10_10 = L10_10.greeting
  L10_10 = 30
  L6_6 = L6_6(L7_7, L8_8, L9_9, L10_10, 40)
  if L7_7 ~= "ft14" then
    L7_7()
    if L6_6 ~= nil then
      L7_7(L8_8)
    end
    L6_6 = nil
    for L10_10 = 1, 30 do
      Fn_disappearNpc("passer_05_" .. string.format("%02d", L10_10))
    end
    L7_7(L8_8)
    L7_7()
  end
  L7_7()
  L7_7()
  L7_7()
  L7_7()
  L7_7()
end
function Finalize()
  Mob:restrictNav_sm34_00(false)
  SM34_FinalizeMob()
  RAC_side_endShopNpcTask()
  Fn_disableCostumeChange(false)
  Sound:setGlobalVariable("voice_type", "normal")
end
function KitSoliloquyTask()
  return invokeTask(function()
    local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
    L0_11 = {
      L1_12,
      L2_13,
      L3_14
    }
    L1_12 = "sm34_00104"
    L2_13 = "sm34_00105"
    L3_14 = "sm34_00106"
    L1_12 = {
      L2_13,
      L3_14,
      L4_15
    }
    L2_13 = 55
    L3_14 = 35
    L4_15 = 10
    L2_13 = {
      L3_14,
      L4_15,
      L5_16,
      L6_17,
      "sm34_00111"
    }
    L3_14 = "sm34_00107"
    L4_15 = "sm34_00108"
    L5_16 = "sm34_00109"
    L6_17 = "sm34_00110"
    L3_14 = {
      L4_15,
      L5_16,
      L6_17,
      "kit052c_1",
      "kit024"
    }
    L4_15 = "pc1_051"
    L5_16 = "pc1_081"
    L6_17 = "kit055b"
    L4_15 = 0
    L5_16 = 1
    L6_17 = nil
    while true do
      L4_15 = Mob:getLeafletCount() + got_guest_num
      if L5_16 <= #L1_12 then
      end
      if SM34_getEventCaptionFinish() == true then
        if L1_12[L5_16] >= NEED_HAND_OUT_POINT - got_guest_num - Mob:getLeafletCount() == true then
          Fn_captionViewEnd()
          while Fn_captionViewLock(L0_11[L5_16], 1) == false do
            wait()
          end
          waitSeconds(3)
          L5_16 = L5_16 + 1
        elseif L4_15 ~= L4_15 and Fn_isCaptionView() == false and (L4_15 < NEED_HAND_OUT_POINT - NEED_MIN_POINT_TBL[1] - 5 or L4_15 > NEED_HAND_OUT_POINT - NEED_MIN_POINT_TBL[1] + 5) then
          L6_17 = Sound:playSE(L3_14[math.random(#L3_14)])
          Fn_captionView(L2_13[RandI(1, #L2_13)])
        end
      end
      wait()
    end
    Sound:stopSEHandle(L6_17)
  end)
end
