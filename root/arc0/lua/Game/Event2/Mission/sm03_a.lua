import("Debug")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_puppet_tbl = {}
_bangua_in = true
_anyone_talk = false
_event_motion_table = {
  label01 = "kit01_greeting_00"
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_gaw_yatai")
  L0_0 = {
    {
      name = "sis_01",
      type = "sis01",
      node = "locator2_sis_01"
    },
    {
      name = "wom_info",
      type = "wom17",
      node = "locator2_wom_info"
    },
    {
      name = "man_info",
      type = "man36",
      node = "locator2_man_info"
    },
    {
      name = "gaw01",
      type = "man34",
      node = "locator2_gaw_yatai",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadPlayerMotion(_event_motion_table)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm03_client"
  L2_3 = "check_00"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Fn_playMotionNpc
  L1_2 = "sis_01"
  L2_3 = "stay"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "wom_info"
  L2_3 = "lookaround"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "man_info"
  L2_3 = "lookaround"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "sm03_00100k"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_far_01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_warp_01"
  L0_1(L1_2)
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_missionViewWait
  L1_2 = "sm03_00100"
  L0_1(L1_2)
  L0_1 = {}
  function L1_2()
    Fn_setGestureAction(_puppet_tbl.sis_01, false)
    Fn_kaiwaDemoView("sm03_00200k")
    Mv_gotoNextPhase()
  end
  L0_1[1] = L1_2
  function L1_2()
    Fn_setGestureAction(_puppet_tbl.wom_info, false)
    Fn_kaiwaDemoView("sm03_00210k")
    _anyone_talk = true
  end
  L0_1[2] = L1_2
  function L1_2()
    Fn_setGestureAction(_puppet_tbl.man_info, false)
    Fn_kaiwaDemoView("sm03_00220k")
    _anyone_talk = true
  end
  L0_1[3] = L1_2
  L1_2 = {
    L2_3,
    L3_4,
    L4_5
  }
  L2_3 = {}
  L2_3.target = L3_4
  L3_4.target = L4_5
  L4_5.target = L5_6
  L2_3 = {}
  for L6_7 = 1, L4_5(L5_6) do
    L7_8 = {}
    L7_8.RL = {
      id = "ui_event_guide_02",
      func = L0_1[L6_7]
    }
    L2_3[L6_7] = L7_8
    L7_8 = Fn_setupGestureAction
    L7_8(L1_2[L6_7], L2_3[L6_7], nil, nil, false)
  end
  L3_4()
  while true do
    L6_7 = _puppet_tbl
    L6_7 = L6_7.sis_01
    L7_8 = 25
    if not L5_6 then
      L5_6()
    end
  end
  L6_7 = "sm03_00102"
  L5_6(L6_7)
  L6_7 = L3_4
  L6_7 = L4_5
  L5_6()
  L6_7 = "pccubesensor2_far_01"
  L5_6(L6_7)
  L6_7 = "pccubesensor2_warp_01"
  L5_6(L6_7)
  L6_7 = _puppet_tbl
  L6_7 = L6_7.wom_info
  L7_8 = false
  L5_6(L6_7, L7_8)
  L6_7 = _puppet_tbl
  L6_7 = L6_7.man_info
  L7_8 = false
  L5_6(L6_7, L7_8)
  L6_7 = "gaw01"
  L7_8 = true
  L5_6(L6_7, L7_8)
  L6_7 = "locator2_navi_gaw"
  L7_8 = 0.5
  L6_7 = Fn_naviSet
  L7_8 = findGameObject2
  L7_8 = L7_8("Node", "locator2_navi_gaw")
  L6_7(L7_8, L7_8("Node", "locator2_navi_gaw"))
  L6_7 = Fn_captionViewWait
  L7_8 = "sm03_00103"
  L6_7(L7_8)
  L6_7 = Mv_safeTaskAbort
  L7_8 = L5_6
  L6_7 = L6_7(L7_8)
  L6_7 = Fn_playMotionNpc
  L7_8 = "sis_01"
  L6_7(L7_8, "stay", false)
  L6_7 = wait
  L6_7()
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_far_02"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_warp_02"
  L6_7(L7_8)
  L6_7 = Fn_setCatWarpCheckPoint
  L7_8 = "locator2_pc_restart_pos"
  L6_7(L7_8)
  L6_7 = Fn_missionView
  L7_8 = "sm03_00104"
  L6_7(L7_8)
  while true do
    L6_7 = Fn_getDistanceToPlayer
    L7_8 = _puppet_tbl
    L7_8 = L7_8.gaw01
    L6_7 = L6_7(L7_8)
    if L6_7 < 100 then
      L7_8 = Fn_captionView
      L7_8("sm03_00105")
      break
    end
    L7_8 = wait
    L7_8()
  end
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_gaw_yatai"
  L6_7(L7_8)
  while true do
    L6_7 = Player
    L7_8 = L6_7
    L6_7 = L6_7.getAction
    L6_7 = L6_7(L7_8)
    L7_8 = Mv_isWaitPhase
    L7_8 = L7_8()
    if not L7_8 then
      L7_8 = Player
      L7_8 = L7_8.kAction_Idle
    end
    if L6_7 ~= L7_8 then
      L7_8 = wait
      L7_8()
    end
  end
  L6_7 = Fn_naviKill
  L6_7()
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_gaw_yatai"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_warp_02"
  L6_7(L7_8)
  L6_7 = Mv_viewObjWait
  L7_8 = _puppet_tbl
  L7_8 = L7_8.gaw01
  L6_7 = L6_7(L7_8, 0.5, 1.5)
  L7_8 = waitSeconds
  L7_8(1)
  L7_8 = Mv_safeTaskAbort
  L7_8 = L7_8(L6_7)
  L6_7 = L7_8
  L7_8 = Fn_kaiwaDemoView
  L7_8("sm03_00300k")
  L7_8 = Fn_blackout
  L7_8()
  L7_8 = Fn_userCtrlOff
  L7_8()
  L7_8 = Fn_resetPcPos
  L7_8("locator2_resetpos_bye_gaw_01")
  L7_8 = Fn_warpNpc
  L7_8("gaw01", "locator2_gaw_move_01")
  L7_8 = Fn_sendEventComSb
  L7_8("requestCameraSet", true)
  L7_8 = waitSeconds
  L7_8(2.5)
  L7_8 = Fn_fadein
  L7_8()
  L7_8 = Fn_playMotionNpc
  L7_8("gaw01", "reply_yes", true)
  L7_8 = Fn_moveNpc
  L7_8 = L7_8("gaw01", {
    "locator2_gaw_move_02"
  }, {runLength = 1000})
  Fn_playPlayerMotion(_event_motion_table.label01, 0, 0.1, true)
  while Mv_isSafeTaskRunning(L7_8) and Fn_isInSightTarget(_puppet_tbl.gaw01, 2) do
    wait()
  end
  L7_8 = Mv_safeTaskAbort(L7_8)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_navi_gaw"):getWorldPos() + Vector(0, 1.5, 0))
  Fn_kaiwaDemoView("sm03_00400k")
  Player:setLookAtIk(false, 1, findGameObject2("Node", "locator2_navi_gaw"):getWorldPos() + Vector(0, 1.5, 0))
  Fn_disappearNpc("gaw01")
  Fn_disappearNpc("sis_01")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10
end
function pccubesensor2_gaw_yatai_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_gaw_yatai_OnLeave()
  Mv_resetWaitPhase()
end
function pccubesensor2_far_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_navi_banga"))
  Fn_captionView("sm03_00106")
  _bangua_in = false
end
function pccubesensor2_far_01_OnEnter()
  _bangua_in = true
  Fn_naviKill()
end
function pccubesensor2_far_02_OnLeave()
  Fn_captionView("sm03_00107")
end
function pccubesensor2_warp_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
