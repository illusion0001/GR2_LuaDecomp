dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm34_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
NEED_MIN_POINT_TBL = {
  25,
  75,
  125
}
GROUP_TBL = {
  {group_idx = 2},
  {group_idx = 3},
  {group_idx = 4}
}
MOB_REPOP_INTERVAL_SEC = 20
MOB_REPOP_DISTANCE = 50
max_npc_count = {}
spawn_npc_count = {}
is_courseout = false
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {}
  L0_0.timer = {
    start = {
      0,
      1,
      0,
      0
    }
  }
  Fn_challengeInitialize(L0_0)
  Fn_disableCostumeChange(true)
  SM34_SetUpChara(true)
  RAC_side_setupShopNpc()
  GameDatabase:set(ggd.GlobalSystemFlags__Mob, false)
  wait()
  GameDatabase:set(ggd.GlobalSystemFlags__Mob, true)
  Mob:restrict_cm12_00(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  is_courseout = false
  L0_1 = del_sm34_npc
  L0_1()
  L0_1 = del_sm26_npc
  L0_1()
  L0_1 = SM34_Initialize
  L1_2 = GROUP_TBL
  L2_3 = max_npc_count
  L3_4 = spawn_npc_count
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_createGimmickBg
  L1_2 = "loc_l_hand"
  L2_3 = "flyer_pc"
  L3_4 = "ciflyer02_base"
  L0_1 = L0_1(L1_2, L2_3, L3_4)
  L1_2 = Fn_attachJoint
  L2_3 = L0_1
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.getPuppet
  L3_4 = L3_4(L4_5)
  L4_5 = "loc_l_hand"
  L1_2(L2_3, L3_4, L4_5)
  L2_3 = L0_1
  L1_2 = L0_1.setPos
  L3_4 = Vector
  L4_5 = 0.03
  L5_6 = -0.01
  L6_7 = -0.02
  L8_9 = L3_4(L4_5, L5_6, L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L3_4(L4_5, L5_6, L6_7))
  L2_3 = L0_1
  L1_2 = L0_1.setRot
  L3_4 = XYZRotQuaternionEular
  L4_5 = 0
  L5_6 = 0
  L6_7 = 85
  L8_9 = L3_4(L4_5, L5_6, L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L3_4(L4_5, L5_6, L6_7))
  L1_2 = {}
  L1_2.timer = true
  L2_3 = Fn_challengeStart
  L3_4 = L1_2
  L4_5 = nil
  L5_6 = true
  L6_7 = nil
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = SM34_InitMob
  L2_3()
  L2_3 = {}
  L2_3.str_score = "ic_cm_00009"
  L2_3.str_chain = "ic_cm_00010"
  L3_4 = SM34_SetUpHUD
  L4_5 = GAME_TIME
  L5_6 = L2_3
  L3_4(L4_5, L5_6)
  L3_4 = SM34_AddScore
  L4_5 = "ic_cm_00002"
  L5_6 = true
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = SM34_CleanupTaskDestManagerTask
  L4_5 = L4_5()
  L5_6 = RAC_invokeMobRepopTask
  L6_7 = MOB_REPOP_INTERVAL_SEC
  L7_8 = MOB_REPOP_DISTANCE
  L5_6 = L5_6(L6_7, L7_8)
  while true do
    L6_7 = HUD
    L7_8 = L6_7
    L6_7 = L6_7.timerGetSecond
    L6_7 = L6_7(L7_8)
    if L6_7 > 0 then
      L6_7 = wait
      L6_7()
      L6_7 = GROUP_TBL
      L6_7 = #L6_7
      if L6_7 > 0 then
        L6_7 = math
        L6_7 = L6_7.random
        L7_8 = GROUP_TBL
        L7_8 = #L7_8
        L6_7 = L6_7(L7_8)
        L7_8 = {}
        L7_8.caption = "ic_cm_00011"
        L7_8.check_spawn_idx = L6_7
        L7_8.is_challenge = true
        L8_9 = Mob
        L8_9 = L8_9.getLeafletCount
        L8_9 = L8_9(L8_9)
        L8_9 = L8_9 + got_guest_num
        SM34_SpawnPasserLargeGroup(NEED_MIN_POINT_TBL, GROUP_TBL, L8_9, L7_8)
      end
    end
  end
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_out_of_area"
  L6_7(L7_8)
  if L5_6 ~= nil then
    L7_8 = L5_6
    L6_7 = L5_6.abort
    L6_7(L7_8)
    L5_6 = nil
  end
  if L3_4 ~= nil then
    L7_8 = L3_4
    L6_7 = L3_4.abort
    L6_7(L7_8)
    L3_4 = nil
  end
  L7_8 = L4_5
  L6_7 = L4_5.abort
  L6_7(L7_8)
  L4_5 = nil
  L6_7 = SM34_ClearFinalize
  L6_7()
  while true do
    L6_7 = is_courseout
    if L6_7 == true then
      L6_7 = wait
      L6_7()
    end
  end
  L6_7 = Fn_challengeFinish
  L6_7()
end
function Finalize()
  Mob:restrict_cm12_00(false)
  SM34_FinalizeMob()
  RAC_side_endShopNpcTask()
  Fn_disableCostumeChange(false)
  Fn_challengeFinalize()
end
function pccubesensor2_out_of_area_OnLeave()
  invokeTask(function()
    is_courseout = true
    HUD:setUserControlLock(true)
    HUD:courseOutStart()
    Fn_catWarp()
    is_courseout = false
  end)
end
function del_sm34_npc()
  local L0_10, L1_11, L2_12, L3_13
  for L3_13 = 1, 30 do
    Fn_disappearNpc("passer_05_" .. string.format("%02d", L3_13))
  end
end
function del_sm26_npc()
  local L0_14, L1_15, L2_16, L3_17
  for L3_17 = 1, 30 do
    Fn_disappearNpc("sm26_passer_05_" .. string.format("%02d", L3_17))
  end
end
