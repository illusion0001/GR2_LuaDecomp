dofile("/Game/Event2/Common/EventCommon.lua")
KAIWA_CNT = 4
_kaiwa_cnt = 0
_follow_range = 2
_bul01_follow = true
function Initialize()
  local L0_0
  L0_0 = Fn_loadEventData
  L0_0("evx/sm50_common", "evarea2_dt_a_root", true)
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_outrange_03")
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    {
      name = "bul01",
      type = "bul01",
      node = "locator2_bul01_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  function end_func()
    local L1_1
    L1_1 = _kaiwa_cnt
    L1_1 = L1_1 + 1
    _kaiwa_cnt = L1_1
  end
  Fn_setKaiwaDemo(Fn_findNpcPuppet("npcgen2_man82_01"), "sm50_00130k", end_func, true)
  Fn_setKaiwaDemo(Fn_findNpcPuppet("npcgen2_man81_01"), "sm50_00140k", end_func, true)
  Fn_setKaiwaDemo(Fn_findNpcPuppet("npcgen2_man31_01"), "sm50_00150k", end_func, true)
  Fn_setKaiwaDemo(Fn_findNpcPuppet("sm50_client"), "sm50_00160k", end_func, true)
  Fn_disableKaiwaDemo(Fn_findNpcPuppet("npcgen2_man82_01"))
  Fn_disableKaiwaDemo(Fn_findNpcPuppet("npcgen2_man81_01"))
  Fn_disableKaiwaDemo(Fn_findNpcPuppet("npcgen2_man31_01"))
  Fn_disableKaiwaDemo(Fn_findNpcPuppet("sm50_client"))
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8
  L0_2 = {}
  L0_2.isRepeat = true
  L0_2.isRandom = true
  L1_3 = {
    L2_4,
    L3_5,
    L4_6,
    L5_7,
    L6_8,
    "talk_02",
    "talk_03",
    "talk_04",
    "talk_laugh_00",
    "talk_laugh_01",
    "talk_laugh_02"
  }
  L2_4 = "stay_00"
  L3_5 = "stay_01"
  L4_6 = "stay_02"
  L2_4 = Fn_findNpc
  L3_5 = "npcgen2_man81_01"
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4
  L2_4 = L2_4.playMotion
  L4_6 = L1_3
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = Fn_findNpc
  L3_5 = "npcgen2_man31_02"
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4
  L2_4 = L2_4.playMotion
  L4_6 = L1_3
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = Fn_findNpc
  L3_5 = "npcgen2_man82_01"
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4
  L2_4 = L2_4.playMotion
  L4_6 = {
    L5_7,
    L6_8,
    "stay_02"
  }
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = Fn_findNpc
  L3_5 = "npcgen2_man31_01"
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4
  L2_4 = L2_4.playMotion
  L4_6 = {L5_7}
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = Fn_missionStart
  L2_4()
  L2_4 = Fn_turnNpc
  L3_5 = "sm50_client"
  L2_4(L3_5)
  L2_4 = Fn_kaiwaDemoView
  L3_5 = "sm50_00100k"
  L2_4(L3_5)
  L2_4 = "locator2_bul01_01"
  L3_5 = {}
  L4_6 = 1
  while true do
    if L5_7 ~= nil then
      if L6_8 == false then
        L3_5[L6_8] = Fn_getDistanceToPlayer(L5_7)
      end
    else
      break
    end
    L4_6 = L4_6 + 1
  end
  if L3_5 ~= nil then
    L5_7(L6_8)
    for _FORV_8_, _FORV_9_ in L5_7(L6_8) do
      L2_4 = _FORV_8_
      break
    end
  end
  L5_7(L6_8, L2_4)
  L5_7(L6_8, true)
  bul_hdl = L5_7
  L5_7()
  L5_7(L6_8)
  L6_8("sm50_client", bul_hdl)
  L6_8(L6_8, true, 1, L5_7:getWorldPos())
  L6_8(L2_4, 1)
  L6_8(0.5)
  L6_8("bul01", "greeting", true)
  follow_task = L6_8
  while true do
    if L6_8 == true then
      L6_8()
    end
  end
  follow_task = nil
  L6_8(0.8)
  L6_8("sm50_00110k")
  invokeTask(function()
    pointNpc("bul01", L6_8, true)
  end)
  waitSeconds(1)
  Fn_turnNpc("sm50_client", L6_8)
  Player:setLookAtIk(true, 1, L6_8:getWorldPos())
  Fn_captionViewWait("sm50_00100")
  if Fn_lookAtObject("locator2_warehouse") ~= nil and Fn_lookAtObject("locator2_warehouse"):isRunning() == true then
    Fn_lookAtObject("locator2_warehouse"):abort()
  end
  waitSeconds(1)
  Fn_kaiwaDemoView("sm50_00120k")
  Fn_userCtrlOn()
  print("\229\144\145\227\129\141\229\155\186\229\174\154\232\167\163\233\153\164")
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  _bul01_follow = true
  pc_follow("bul01")
  Fn_enableKaiwaDemo(Fn_findNpcPuppet("npcgen2_man82_01"))
  Fn_enableKaiwaDemo(Fn_findNpcPuppet("npcgen2_man81_01"))
  Fn_enableKaiwaDemo(Fn_findNpcPuppet("npcgen2_man31_01"))
  Fn_enableKaiwaDemo(Fn_findNpcPuppet("sm50_client"))
  bul_boyaki()
  Fn_missionViewWait("sm50_00101")
  while _kaiwa_cnt < KAIWA_CNT do
    wait()
  end
  _bul01_follow = false
  waitSeconds(1)
  Fn_userCtrlOff()
  waitSeconds(0.5)
  Fn_lookAtTargetInput(Fn_findNpcPuppet("bul01"), 1)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm50_00170k")
  waitSeconds(1)
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10
end
function pointNpc(A0_11, A1_12, A2_13, A3_14, A4_15)
  local L5_16, L6_17, L7_18
  L5_16 = Fn_findNpc
  L6_17 = A0_11
  L5_16 = L5_16(L6_17)
  L7_18 = A1_12
  L6_17 = A1_12.getWorldPos
  L6_17 = L6_17(L7_18)
  L7_18 = Fn_turnNpc
  L7_18(A0_11, L6_17)
  L7_18 = {}
  L7_18.anim_in = "inform_in"
  L7_18.anim_lp = "inform_lp"
  L7_18.anim_out = "inform_ed"
  L7_18.anim_stay = "stay"
  L5_16:inform(A1_12, L7_18)
  waitSeconds(1.5)
  if A3_14 ~= nil then
    invokeTask(function()
      A3_14()
    end)
  end
  waitSeconds(1.5)
  L5_16:informEnd()
  while not L5_16:isInformEnd() do
    wait()
  end
end
function bul_boyaki()
  invokeTask(function()
    repeat
      wait()
    until Player:isGravityControlMode()
    repeat
      if Player:isGravityControlMode() then
        waitSeconds(1)
        Fn_captionViewWait("sm50_00102")
      end
      waitSeconds(RandF(10, 20))
      if Player:isGravityControlMode() then
        waitSeconds(1)
        Fn_captionViewWait("sm50_00103")
      end
      waitSeconds(RandF(10, 20))
    until false
  end)
end
function pccubesensor2_outrange_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_outrange_02_OnLeave(A0_19)
  A0_19:setActive(false)
  Fn_pcSensorOn("pccubesensor2_outrange_03")
  cap_on = invokeTask(function()
    repeat
      Fn_captionViewWait("sm50_00104")
      waitSeconds(RandF(10, 20))
    until false
  end)
end
function pccubesensor2_outrange_03_OnEnter(A0_20)
  A0_20:setActive(false)
  Fn_pcSensorOn("pccubesensor2_outrange_02")
  if cap_on ~= nil then
    cap_on:abort()
    cap_pn = nil
  end
end
function pc_follow(A0_21)
  invokeTask(function()
    local L0_22, L1_23
    L0_22 = nil
    L1_23 = Fn_findNpcPuppet
    L1_23 = L1_23(A0_21)
    while _bul01_follow == true do
      if L0_22 ~= nil then
        if L0_22:isRunning() == false then
          L0_22 = nil
          Fn_playMotionNpc(A0_21, "stay", false)
        end
      elseif Fn_getDistanceToPlayer(L1_23) > _follow_range then
        L0_22 = Fn_moveNpc(A0_21, {
          Fn_getPlayer()
        }, {
          arrivedLength = 2,
          runLength = 4,
          anim_walk_speed = 1.3,
          anim_run_speed = 1.3,
          anim_speed_over = true
        })
      else
        Fn_turnNpc(A0_21)
      end
      wait()
    end
    if L0_22 ~= nil and L0_22:isRunning() == true then
      L0_22:abort()
    end
    L0_22 = nil
    Fn_playMotionNpc(A0_21, "stay", false)
  end)
end
