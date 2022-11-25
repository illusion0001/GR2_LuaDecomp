dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm17_common.lua")
PATIENCE_PARAM = {
  MAX = 100,
  UP = 0.07,
  DOWN = 0.7
}
PATIENCE_UP_EVENT = 0.7
EVENT_MOTION_TABLE = {
  MOTION_PLAYER_DEAD = "kit01_dead_00",
  MOTION_PLAYER_DOWN = "kit01_down_b_01"
}
NPC_MOTION = {
  GROGGY_U_00 = "man01_groggy_u_00",
  DOWN_B_00 = "man01_down_b_00"
}
_puppet_tbl = {}
_pdemo_01 = nil
_sdemo_cut01 = nil
_catwarp_flg = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_stun_area_01")
  L0_0 = {
    {
      name = "crowd_01",
      type = "wom29",
      node = "locator2_crowd_01",
      active = false
    },
    {
      name = "crowd_02",
      type = "man46",
      node = "locator2_crowd_02",
      active = false
    },
    {
      name = "crowd_03",
      type = "man45",
      node = "locator2_crowd_03",
      active = false
    },
    {
      name = "crowd_04",
      type = "wom27",
      node = "locator2_crowd_04",
      color_variation = 3,
      active = false
    },
    {
      name = "crowd_05",
      type = "chi15",
      node = "locator2_crowd_05",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadPlayerMotion(EVENT_MOTION_TABLE)
  if GameDatabase:get(ggd.EventFlags__sm17__flag01) ~= 1 then
    Fn_loadNpcEventMotion("sm17_client", NPC_MOTION)
    GameDatabase:set(ggd.EventFlags__sm17__flag01, 1)
  end
  Fn_loadNpcEventMotion("crowd_01", {
    nurse_00 = "wom21_nurse_00"
  })
  _pdemo_01 = PDemo.create("sm17_a_c01", Fn_findAreaHandle("up_a_00"), {camera = true, scene_param = false})
  _sdemo_cut01 = SDemo.create("sm17_a_cut01")
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = false
  L1_2 = HUD
  L2_3 = L1_2
  L1_2 = L1_2.miniGaugeSetVisible
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = createBoxSensorNavi
  L2_3 = "locator2_create_node_01"
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = warningAreaDistant
  L2_3 = "sm17_09000"
  L1_2 = L1_2(L2_3)
  L2_3 = warningGoalDistant
  L3_4 = "sm17_09001"
  L2_3 = L2_3(L3_4)
  while true do
    L3_4 = _pdemo_01
    L4_5 = L3_4
    L3_4 = L3_4.isLoading
    L3_4 = L3_4(L4_5)
    if L3_4 == false then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = Fn_playMotionNpc
  L4_5 = "sm17_client"
  L5_6 = NPC_MOTION
  L5_6 = L5_6.GROGGY_U_00
  L6_7 = true
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Fn_missionStart
  L3_4()
  L3_4 = appendCatsensor
  L4_5 = "pccubesensor2_area_distant"
  L5_6 = "pccubesensor2_catwarp_a_01"
  L6_7 = "pccubesensor2_catwarp_a_02"
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm17_00200k"
  L3_4(L4_5)
  L3_4 = mobToPanic
  L4_5 = true
  L3_4(L4_5)
  L3_4 = Fn_userCtrlOn
  L3_4()
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setGrabExceptionalObject
  L5_6 = GRAB_PERMIT_NAME
  L3_4(L4_5, L5_6)
  L3_4 = invokeTask
  function L4_5()
    Sound:playSE("m02_916a", 1, _puppet_tbl.sm17_client)
    Fn_playMotionNpc("sm17_client", NPC_MOTION.DOWN_B_00, true, {animBlendDuration = 0.75})
  end
  L3_4(L4_5)
  L3_4 = invokeTask
  function L4_5()
    local L0_16, L1_17
    L0_16 = Fn_getDistanceToPlayer
    L1_17 = "locator2_navi_goal_01"
    L0_16 = L0_16(L1_17)
    L1_17 = Fn_getDistanceToPlayer
    L1_17 = L1_17(getBaggageHandle())
    while true do
      L0_16 = Fn_getDistanceToPlayer("locator2_navi_goal_01")
      L1_17 = Fn_getDistanceToPlayer(getBaggageHandle())
      if L0_16 <= 1000 then
        _catwarp_flg = true
      end
      if L1_17 <= 50 and not isMobPanic() and Player:getGrabObjectCount() == 0 then
        mobToPanic(true)
      end
      wait()
    end
  end
  L3_4 = L3_4(L4_5)
  L4_5, L5_6 = nil, nil
  function L6_7()
    L4_5 = Mv_viewObjCancelByCameraInput(_mission_data.bag_hdl)
    L5_6 = Mv_invokeMissionViewNaviCaption("sm17_00101", _mission_data.bag_hdl, nil, 0.8)
    _mission_data.is_box_navi_setted = true
  end
  L7_8 = createStopGuideCaptionTask
  L8_9 = L5_6
  L7_8(L8_9)
  L7_8 = waitBagGrab
  L8_9 = L6_7
  L7_8(L8_9)
  L7_8 = _mission_data
  L7_8 = L7_8.bag_hdl
  L8_9 = L7_8
  L7_8 = L7_8.setGrabReleasePermission
  L9_10 = false
  L7_8(L8_9, L9_10)
  L7_8 = Mv_safeTaskAbort
  L8_9 = L4_5
  L7_8 = L7_8(L8_9)
  L4_5 = L7_8
  L7_8 = Mv_safeTaskAbort
  L8_9 = L5_6
  L7_8 = L7_8(L8_9)
  L5_6 = L7_8
  L7_8 = waitSeconds
  L8_9 = 1
  L7_8(L8_9)
  L7_8 = Mv_viewObjCancelByCameraInput
  L8_9 = "locator2_navi_goal_01"
  L9_10 = 0.3
  L7_8 = L7_8(L8_9, L9_10)
  L8_9 = waitSeconds
  L9_10 = 1.5
  L8_9(L9_10)
  L8_9 = init_create_enemy_gem
  L9_10 = "locator2_navi_goal_01"
  L8_9(L9_10)
  L8_9 = Mv_safeTaskAbort
  L9_10 = L7_8
  L8_9 = L8_9(L9_10)
  L7_8 = L8_9
  L8_9 = Fn_kaiwaDemoView
  L9_10 = "sm17_00250k"
  L8_9(L9_10)
  L8_9 = _mission_data
  L8_9 = L8_9.bag_hdl
  L9_10 = L8_9
  L8_9 = L8_9.setGrabReleasePermission
  L10_11 = true
  L8_9(L9_10, L10_11)
  L8_9 = invokeTask
  function L9_10()
    local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
    L0_18 = 1050
    L1_19 = 1120
    L2_20 = 1220
    L3_21 = false
    L4_22 = false
    L5_23 = false
    L6_24 = Fn_getDistanceToPlayer
    L6_24 = L6_24(findGameObject2("Node", "locator2_navi_goal_01"))
    while true do
      if _catwarp_flg then
        L6_24 = Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_goal_01"))
        if L2_20 < L6_24 and L5_23 == false then
          print("\227\131\175\227\131\188\227\131\151")
          L5_23 = true
          if Player:getGrabObjectCount() > 0 then
            setIsCatwarp(true)
            Fn_catWarp()
            setIsCatwarp(false)
            Player:grabSilently(9)
            L0_1 = false
          else
            Fn_catWarp()
            L0_1 = true
          end
        elseif L1_19 < L6_24 and L4_22 == false then
          L4_22 = true
          print("\232\170\152\229\176\142")
          invokeTask(function()
            Player:setStay(true)
            if locator_navi ~= nil then
              Fn_naviSet(findGameObject2("Node", locator_navi))
            end
            if caption ~= nil then
              Fn_captionViewLock(caption)
            else
              Fn_captionViewLock("sm17_09000")
            end
            Player:setStay(false)
          end)
        end
        if L2_20 > L6_24 then
          L5_23 = false
        end
        if L1_19 > L6_24 then
          L4_22 = false
        end
        if L0_18 > L6_24 then
          L3_21 = false
        end
      end
      wait()
    end
  end
  L8_9 = L8_9(L9_10)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_stun_area_01"
  L9_10(L10_11)
  L9_10 = HUD
  L10_11 = L9_10
  L9_10 = L9_10.info
  L9_10(L10_11, L11_12, L12_13)
  L9_10 = wait
  L9_10()
  L9_10 = patienceGaugeOn
  L10_11 = PATIENCE_PARAM
  L9_10(L10_11)
  repeat
    L9_10 = invokeTask
    function L10_11()
      local L0_25
      L0_25 = findGameObject2
      L0_25 = L0_25("Node", "locator2_navi_goal_01")
      if not _mission_data.bag_hdl:isGrabbed() then
        L0_25 = getBaggageHandle()
        _mission_data.is_box_navi_setted = true
      end
      Fn_naviSet(L0_25)
      waitSeconds(2.5)
      Fn_captionViewWait("sm17_00100")
    end
    L9_10 = L9_10(L10_11)
    L10_11 = createStopGuideCaptionTask
    L10_11(L11_12, L12_13)
    L10_11 = createCarryTask
    L10_11 = L10_11(L11_12)
    repeat
      if L11_12 then
        repeat
          L11_12()
        until not L11_12
        break
      end
      L11_12()
    until not L11_12
    L9_10 = L11_12
    L10_11 = L11_12
  until not L11_12
  L9_10 = Fn_naviKill
  L9_10()
  L9_10 = Fn_pcSensorOff
  L10_11 = "pccubesensor2_stun_area_01"
  L9_10(L10_11)
  L9_10 = _mission_data
  L9_10 = L9_10.bag_hdl
  L10_11 = L9_10
  L9_10 = L9_10.setGrabReleasePermission
  L9_10(L10_11, L11_12)
  L9_10 = invokeTask
  function L10_11()
    while true do
      HUD:miniGaugeSetNum(_mission_data.patience_point / PATIENCE_PARAM.MAX)
      _mission_data.patience_point = _mission_data.patience_point + PATIENCE_UP_EVENT
      if _mission_data.patience_point > PATIENCE_PARAM.MAX then
        _mission_data.patience_point = PATIENCE_PARAM.MAX
      end
      wait()
    end
  end
  L9_10 = L9_10(L10_11)
  L10_11 = Mv_safeTaskAbort
  L10_11 = L10_11(L11_12)
  L8_9 = L10_11
  L10_11 = Mv_safeTaskAbort
  L10_11 = L10_11(L11_12)
  L2_3 = L10_11
  L10_11 = Fn_captionViewWait
  L10_11(L11_12)
  L10_11 = waitSeconds
  L10_11(L11_12)
  L10_11 = Mv_safeTaskAbort
  L10_11 = L10_11(L11_12)
  L9_10 = L10_11
  L10_11 = HUD
  L10_11 = L10_11.miniGaugeSetVisible
  L10_11(L11_12, L12_13)
  L10_11 = Fn_kaiwaDemoView
  L10_11(L11_12)
  L10_11 = Camera
  L10_11 = L10_11.shake2D
  L14_15 = 1
  L10_11(L11_12, L12_13, L13_14, L14_15, 0)
  L10_11 = Camera
  L10_11 = L10_11.setScreenEffect
  L14_15 = 0
  L14_15 = IdentQuat
  L14_15 = L14_15()
  L10_11(L11_12, L12_13, L13_14, L14_15, Vector(3, 3, 3))
  L10_11 = Camera
  L10_11 = L10_11.removeScreenEffect
  L10_11(L11_12, L12_13)
  L10_11 = waitSeconds
  L10_11(L11_12)
  L10_11 = Fn_userCtrlOff
  L10_11()
  L10_11 = Fn_coercionGravityRevert
  L10_11()
  L10_11 = Fn_findAreaHandle
  L10_11 = L10_11(L11_12)
  L11_12(L12_13, L13_14)
  L11_12(L12_13)
  L11_12(L12_13, L13_14)
  L11_12(L12_13)
  repeat
    L11_12()
  until L11_12 >= 330
  L11_12(L12_13)
  repeat
    L11_12()
  until L11_12
  L11_12(L12_13)
  L11_12(L12_13, L13_14)
  L10_11 = nil
  for L14_15 = 1, 5 do
    Fn_setNpcActive("crowd_" .. string.format("%02d", L14_15), true)
  end
  L11_12(L12_13)
  L11_12()
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L14_15 = false
  L11_12(L12_13, L13_14, L14_15)
  L14_15 = false
  L11_12(L12_13, L13_14, L14_15)
  L14_15 = false
  L11_12(L12_13, L13_14, L14_15)
  L14_15 = false
  L11_12(L12_13, L13_14, L14_15)
  L14_15 = false
  L11_12(L12_13, L13_14, L14_15)
  L11_12(L12_13)
  L14_15 = "locator2_a_demoport_aim_01"
  L11_12(L12_13, L13_14, L14_15, false)
  L11_12(L12_13)
  if L3_4 ~= nil then
    if L11_12 == true then
      L11_12(L12_13)
    end
  end
  L3_4 = nil
  L11_12(L12_13)
  L11_12()
  L11_12(L12_13)
  L11_12(L12_13, L13_14)
  L14_15 = 1
  L11_12(L12_13, L13_14, L14_15, _puppet_tbl.crowd_01:getWorldPos())
  L14_15 = {}
  L14_15.animBlendDuration = 0.75
  L11_12(L12_13, L13_14, L14_15)
  L11_12(L12_13, L13_14)
  L11_12(L12_13)
  L14_15 = {}
  L14_15.animBlendDuration = 0.75
  L11_12(L12_13, L13_14, L14_15)
  L11_12(L12_13, L13_14)
  L11_12(L12_13)
  L14_15 = 1
  L11_12(L12_13, L13_14, L14_15, Vector(0, 0, 0))
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12()
  L11_12()
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12()
  L11_12()
  L11_12()
  L11_12()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Player:setForcedNormalGrab(false)
  mobToPanic(false)
end
function pccubesensor2_stun_area_01_OnEnter()
  if _mission_data.now_retry == false and _mission_data.bag_hdl:isGrabbed() then
    Mv_gotoNextPhase()
  end
end
function boxGrab(A0_26)
  Fn_pcSensorOff("bag_caption_sensor")
  Fn_tutorialCaptionKill()
  if A0_26 then
    Fn_naviKill()
    Fn_naviSet(findGameObject2("Node", "locator2_navi_goal_01"))
    _mission_data.is_box_navi_setted = false
  end
end
function retry()
  Mv_sceneSwitchFade(function()
    retryCommon()
    Fn_resetPcPos("locator2_pc_start_pos")
    _catwarp_flg = false
    createBoxSensorNavi("locator2_create_node_01", false)
    appendedSensorOn()
    waitSeconds(2)
  end)
  Fn_userCtrlOn()
  _mission_data.now_retry = false
end
function catwarpRetry()
  retryCommon()
  Fn_resetPcPos("locator2_pc_start_pos")
  _catwarp_flg = false
  createBoxSensorNavi("locator2_create_node_01", false)
  appendedSensorOn()
  waitSeconds(2)
  Fn_userCtrlOn()
  Mob:makeSituationPanic(true)
  _mission_data.now_retry = false
end
