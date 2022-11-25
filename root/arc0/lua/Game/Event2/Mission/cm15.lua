import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Mission/sm26_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
WALK_TIME = {40, 120}
MOB_REPOP_INTERVAL_SEC = 10
MOB_REPOP_DISTANCE = 30
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {}
  L0_0.timer = {
    start = GAME_TIME
  }
  Fn_challengeInitialize(L0_0)
  Fn_disableCostumeChange(true)
  SM26_Initialize(true, 15)
  SM26_SetSwpawnGroup()
  RAC_side_setupShopNpc(nil, nil, "ED")
  GameDatabase:set(ggd.GlobalSystemFlags__Mob, false)
  wait()
  GameDatabase:set(ggd.GlobalSystemFlags__Mob, true)
  Mob:restrict_cm15_00(true)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_1, L1_2
  L0_1 = {}
  L0_1.timer = true
  L1_2 = Fn_challengeStart
  L1_2(L0_1, nil, true, nil)
  L1_2 = SM26_InitGameParam
  L1_2()
  L1_2 = SM26_SetMapMaker
  L1_2(true)
  L1_2 = {}
  L1_2.train = "ic_cm_00004"
  L1_2.student = "ic_cm_00005"
  L1_2.balloon = "ic_cm_00006"
  L1_2.police = "ic_cm_00007"
  L1_2.accordion = "ic_cm_00008"
  SM26_GameLoop(true, L1_2)
  HUD:timerStop()
  if SM26_InvokeTimeTask(WALK_TIME, L1_2, "ic_cm_00003", "ic_cm_00002") ~= nil then
    SM26_InvokeTimeTask(WALK_TIME, L1_2, "ic_cm_00003", "ic_cm_00002"):abort()
  end
  Fn_naviKill()
  SM26_SetMapMaker(false)
  SM26_ClearFinalize()
  Fn_challengeFinish()
  Fn_pcSensorOff("pccubesensor2_out_of_area")
end
function Finalize()
  Mob:restrict_cm15_00(false)
  Fn_disableCostumeChange(false)
  SM26_ClearFinalize()
  SM26_MobReset()
  RAC_side_endShopNpcTask()
  Fn_challengeFinalize()
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_out_of_area_OnLeave()
  invokeTask(function()
    HUD:setUserControlLock(true)
    HUD:courseOutStart()
    Fn_catWarp()
  end)
end
