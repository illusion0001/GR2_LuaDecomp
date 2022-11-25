dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm17_common.lua")
LYING_CNT = 6
NPC_MOTION = {
  DOWN_B_00 = "man57_down_b_00",
  DOWN_B_01 = "man57_down_b_01"
}
BISUMA_GUIDE_CAPTION_INTERVAL = 30
_puppet_tbl = {}
_bisuma_guide_caption_task = nil
_bisuma_guide_caption_timer = BISUMA_GUIDE_CAPTION_INTERVAL
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    {
      name = "lying04",
      type = "man57",
      node = "locator2_lying04_b_01"
    },
    {
      name = "lying05",
      type = "man57",
      node = "locator2_lying05_b_01"
    },
    {
      name = "lying06",
      type = "man57",
      node = "locator2_lying06_b_01"
    }
  }
  L1_1.name = "driver01"
  L1_1.type = "man36"
  L1_1.node = "locator2_driver_b_01"
  L2_2.name = "lying01"
  L2_2.type = "man57"
  L2_2.node = "locator2_lying01_b_01"
  L3_3.name = "lying02"
  L3_3.type = "man57"
  L3_3.node = "locator2_lying02_b_01"
  L4_4 = {}
  L4_4.name = "lying03"
  L4_4.type = "man57"
  L4_4.node = "locator2_lying03_b_01"
  L1_1(L2_2)
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1(L2_2, L3_3)
  for L4_4 = 1, LYING_CNT do
    Fn_loadNpcEventMotion(string.format("lying%02d", L4_4), NPC_MOTION)
  end
  _sdemo_cut01 = L1_1
  L1_1(L2_2, L3_3)
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15
  L0_5 = Fn_setCatWarpCheckPoint
  L1_6 = "locator2_pc_start_pos"
  L0_5(L1_6)
  L0_5 = Fn_sendEventComSb
  L1_6 = "requestCreateShip"
  L0_5(L1_6)
  L0_5 = nil
  repeat
    L1_6 = Fn_sendEventComSb
    L2_7 = "getShipHandle"
    L1_6 = L1_6(L2_7)
    L0_5 = L1_6
    L1_6 = wait
    L1_6()
  until L0_5 ~= nil
  L1_6 = nil
  if L1_6 == nil then
    L2_7 = createBox
    L3_8 = "locator2_bag_b_01"
    L4_9 = false
    L2_7(L3_8, L4_9)
    L2_7 = _mission_data
    L1_6 = L2_7.bag_hdl
  end
  L3_8 = L0_5
  L2_7 = L0_5.appendChild
  L4_9 = L1_6
  L5_10 = true
  L2_7(L3_8, L4_9, L5_10)
  L3_8 = L1_6
  L2_7 = L1_6.setVisibleBlockEnable
  L4_9 = false
  L2_7(L3_8, L4_9)
  L2_7 = Fn_missionStart
  L2_7()
  L2_7 = Fn_userCtrlOn
  L2_7()
  L2_7 = warningGoalDistant
  L3_8 = "sm17_01006"
  L2_7 = L2_7(L3_8)
  L3_8 = Fn_pcSensorOn
  L4_9 = "pccubesensor2_guide_bisuma"
  L3_8(L4_9)
  L3_8 = Fn_pcSensorOn
  L4_9 = "pccubesensor2_cap_01"
  L3_8(L4_9)
  L3_8 = Fn_pcSensorOn
  L4_9 = "pccubesensor2_can_see_bisuma"
  L3_8(L4_9)
  L3_8 = createGuideCaptionTask
  L3_8()
  L3_8 = Fn_getDistanceToPlayer
  L4_9 = "locator2_navi_bisuma_01"
  L3_8 = L3_8(L4_9)
  L4_9 = invokeTask
  function L5_10()
    while true do
      if Fn_getDistanceToPlayer("locator2_navi_bisuma_01") < L3_8 - 5 then
        Fn_captionViewWait("sm17_01000")
        break
      end
      wait()
    end
  end
  L4_9(L5_10)
  L4_9 = Mv_viewObjCancelByCameraInput
  L5_10 = "locator2_navi_bisuma_01"
  L4_9 = L4_9(L5_10)
  L5_10 = Mv_invokeMissionViewNaviCaption
  L6_11 = "sm17_01001"
  L5_10 = L5_10(L6_11, L7_12, L8_13, L9_14)
  L6_11 = invokeTask
  L6_11 = L6_11(L7_12)
  L7_12()
  L7_12()
  L10_15 = false
  L7_12(L8_13, L9_14, L10_15)
  for L10_15 = 1, LYING_CNT do
    if L10_15 == 2 or L10_15 == 4 or L10_15 == 6 then
      Fn_playMotionNpc(string.format("lying%02d", L10_15), NPC_MOTION.DOWN_B_01, false)
    else
      Fn_playMotionNpc(string.format("lying%02d", L10_15), NPC_MOTION.DOWN_B_00, false)
    end
  end
  L7_12(L8_13)
  L7_12()
  L2_7 = L7_12
  L6_11 = L7_12
  L7_12(L8_13)
  L7_12(L8_13)
  L7_12(L8_13)
  L8_13.pos = "locator2_lying04_b_01"
  L8_13.time = 2
  L10_15 = nil
  L8_13(L9_14, L10_15, L7_12)
  L8_13(L9_14)
  L10_15 = 2.5
  L8_13(L9_14, L10_15)
  L10_15 = L1_6.getWorldPos
  L10_15 = L10_15(L1_6)
  L9_14.pos = L10_15
  L9_14.time = 1
  L10_15 = L9_14
  L9_14(L10_15, nil, L8_13)
  L10_15 = L9_14
  L9_14(L10_15, 1, {deg = 25})
  L10_15 = 1.5
  L9_14(L10_15)
  L10_15 = "sm17_00700k"
  L9_14(L10_15)
  L10_15 = "requestSpawnEnemy"
  L9_14(L10_15, "enmgen2_com_01")
  L10_15 = "setEnemyForDemo"
  L9_14(L10_15, "enmgen2_com_01")
  L10_15 = {}
  L10_15.pos = "locator2_b_demo_camera_01"
  L10_15.time = 2
  L10_15 = {
    {
      pos = "locator2_b_demo_aim_02",
      time = 1.5
    }
  }
  _sdemo_cut01:play(L9_14, L10_15)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_b_demo_aim_02"):getWorldPos())
  Fn_disappearNpc("lying05")
  Fn_disappearNpc("lying06")
  Fn_sendEventComSb("requestPrepareEnemy", "enmgen2_com_02")
  waitSeconds(1.5)
  Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_com_02")
  Fn_sendEventComSb("setEnemyForDemo", "enmgen2_com_02")
  Fn_kaiwaDemoView("sm17_00750k")
  _sdemo_cut01:stop(1)
  Player:setLookAtIk(true, 1, L1_6:getWorldPos())
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  waitSeconds(1)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_cap_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_cap_01")
  Fn_captionView("sm17_01004")
end
function pccubesensor2_can_see_bisuma_OnEnter()
  Fn_pcSensorOff("pccubesensor2_can_see_bisuma")
  Fn_captionView("sm17_01005")
  Mv_gotoNextPhase()
end
function pccubesensor2_arrive_bisuma_OnEnter()
  Fn_pcSensorOff("pccubesensor2_arrive_bisuma")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_guide_bisuma_OnEnter()
  abortBisumaGuideCaptionTask()
end
function pccubesensor2_guide_bisuma_OnLeave()
  createGuideCaptionTask()
end
function createGuideCaptionTask()
  _bisuma_guid_caption_task = Mv_safeTaskAbort(_bisuma_guid_caption_task)
  _bisuma_guid_caption_task = invokeTask(function()
    repeat
      if _bisuma_guide_caption_timer > 0 then
        _bisuma_guide_caption_timer = _bisuma_guide_caption_timer - gameTickToSecond(1)
      end
      if _bisuma_guide_caption_timer <= 0 then
        Fn_captionView("sm17_01006")
        _bisuma_guide_caption_timer = BISUMA_GUIDE_CAPTION_INTERVAL
      end
      wait()
    until false
  end)
end
function abortBisumaGuideCaptionTask()
  _bisuma_guid_caption_task = Mv_safeTaskAbort(_bisuma_guid_caption_task)
end
