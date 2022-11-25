dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm29_common.lua")
KDEMO_VIEW_DIST = 160
KDEMO_VIEW_TIME = 39
SDEMO_1ST_DEG = 38
ADVICE_TIME_C_01 = 15
ADVICE_TIME_C_02 = 30
ADVICE_TIME_C_03 = 45
NEAR_TIME_C = 15
ADVICE_DIST = 60
RAYCAST_DIST = 70
GOAL_HURRY_TIME = 15
_goal_area_flag = false
_goal_find_flag = false
function Initialize()
  Fn_pcSensorOff("pccubesensor2_catwarp_guide_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_03")
  Fn_pcSensorOff("pccubesensor2_goal_advice_c_01")
  Fn_pcSensorOff("pccubesensor2_goal_advice_c_02")
  Fn_pcSensorOff("pccubesensor2_goal_find_01")
  Fn_pcSensorOff("pccubesensor2_goal_area_01")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  boy_puppet = Fn_findNpcPuppet("sm29_client")
  _sdemo_cut01 = SDemo.create("sm29_c_cut01")
  _sdemo_cut02 = SDemo.create("sm29_c_cut02")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L0_0 = Fn_warpNpc
  L1_1 = "sm29_client"
  L2_2 = "locator2_boy_start_pos_03"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_guide_03"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_warning_03"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_area_03"
  L0_0(L1_1)
  L0_0 = switchTutorialCap
  L1_1 = false
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_setGrabNpc
  L1_1 = "sm29_client"
  L2_2 = false
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Mv_createNpcGrabSensor
  L1_1 = "sm29_client"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setActive
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = Fn_missionView
  L2_2 = "sm29_02000"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.3
  L1_1(L2_2)
  L1_1 = comSetNavi
  L2_2 = boy_puppet
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = switchTutorialCap
  L2_2 = true
  L1_1(L2_2)
  L1_1 = boy_puppet
  L2_2 = L1_1
  L1_1 = L1_1.isGrabbed
  L1_1 = L1_1(L2_2)
  if not L1_1 then
    L1_1 = inPcGrabSensor
    L1_1 = L1_1()
    if L1_1 then
      L1_1 = Fn_tutorialCaption
      L2_2 = "grab"
      L1_1(L2_2)
    end
  end
  L1_1 = Mv_NpcGrabCheckWait
  L2_2 = "sm29_client"
  L1_1(L2_2)
  L1_1 = comKillNavi
  L2_2 = boy_puppet
  L1_1(L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.setActive
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = {}
  L2_2 = {}
  L2_2.in_game_preview = "k_photo_sm2903"
  L1_1.view = L2_2
  L2_2 = Fn_gamePreviewView
  L3_3 = L1_1
  L2_2(L3_3)
  L2_2 = false
  L3_3 = invokeTask
  function L4_4()
    waitSeconds(KDEMO_VIEW_TIME)
    L2_2 = true
  end
  L3_3 = L3_3(L4_4)
  L4_4 = invokeTask
  function L5_5()
    waitSeconds(1)
    Fn_captionView("sm29_02001")
    while true do
      if Fn_getDistanceToPlayer("locator2_goal_01") < KDEMO_VIEW_DIST or L2_2 then
        Mv_gotoNextPhase()
        break
      end
      wait()
    end
  end
  L4_4 = L4_4(L5_5)
  L5_5 = Mv_waitPhase
  L5_5()
  L5_5 = Mv_safeTaskAbort
  L6_6 = L4_4
  L5_5 = L5_5(L6_6)
  L4_4 = L5_5
  L5_5 = Mv_safeTaskAbort
  L6_6 = L3_3
  L5_5 = L5_5(L6_6)
  L3_3 = L5_5
  L5_5 = Fn_pcSensorOn
  L6_6 = "pccubesensor2_goal_advice_c_01"
  L5_5(L6_6)
  L5_5 = Fn_pcSensorOn
  L6_6 = "pccubesensor2_goal_advice_c_02"
  L5_5(L6_6)
  L5_5 = Fn_pcSensorOn
  L6_6 = "pccubesensor2_goal_find_01"
  L5_5(L6_6)
  L5_5 = Fn_kaiwaDemoView
  L6_6 = "sm29_00400k"
  L5_5(L6_6)
  L5_5 = invokeTask
  function L6_6()
    local L0_13, L1_14, L2_15, L3_16
    L0_13 = ADVICE_TIME_C_01
    L0_13 = L0_13 - 5
    L1_14 = ADVICE_TIME_C_01
    L1_14 = L1_14 - 5
    L2_15 = nil
    L3_16 = {
      findGameObject2("Node", "locator2_raycast_advice_05"),
      findGameObject2("Node", "locator2_raycast_advice_06"),
      findGameObject2("Node", "locator2_goal_view_01"),
      findGameObject2("Node", "locator2_goal_01")
    }
    while true do
      if getWarningFlag() == true then
        wait()
      else
        if _goal_area_flag == false then
          if L0_13 == ADVICE_TIME_C_01 then
            Fn_captionViewWait("sm29_02002")
          elseif L0_13 == ADVICE_TIME_C_02 then
            Fn_captionViewWait("sm29_02003")
          elseif L0_13 == ADVICE_TIME_C_03 then
            Fn_captionViewWait("sm29_02004")
            if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_advice_pos_03"):getWorldPos()) > ADVICE_DIST then
              L2_15 = Mv_viewObj("locator2_advice_pos_03", 0.3)
              Fn_captionViewWait("sm29_02005", 3, 0.5)
              waitSeconds(2.5)
              L2_15 = Mv_safeTaskAbort(L2_15)
            end
            L0_13 = 0
          end
          waitSeconds(1)
          L0_13 = L0_13 + 1
          L1_14 = 0
        elseif _goal_area_flag == true then
          if L2_15 == nil then
            if L1_14 >= NEAR_TIME_C then
              Fn_captionViewEnd()
              Fn_captionViewWait("sm29_02007")
              L1_14 = 0
            end
            if L1_14 >= NEAR_TIME_C - 3 and arrayRaycastCheck(L3_16, RAYCAST_DIST) == true then
              L2_15 = Mv_viewObj("locator2_goal_view_01", 0.3)
              Fn_captionViewEnd()
              Fn_captionViewWait("sm29_02006")
              L2_15 = Mv_safeTaskAbort(L2_15)
              L1_14 = 0
            end
          else
          end
          waitSeconds(1)
          L1_14 = L1_14 + 1
          L0_13 = 0
        end
        wait()
      end
    end
  end
  L5_5 = L5_5(L6_6)
  L6_6 = Mv_waitPhase
  L6_6()
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_goal_advice_c_01"
  L6_6(L7_7)
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_goal_advice_c_02"
  L6_6(L7_7)
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_goal_find_01"
  L6_6(L7_7)
  L6_6 = Mv_safeTaskAbort
  L7_7 = L5_5
  L6_6 = L6_6(L7_7)
  L5_5 = L6_6
  L6_6 = Fn_captionViewEnd
  L6_6()
  L6_6 = Fn_pcSensorOn
  L7_7 = "pccubesensor2_goal_area_01"
  L6_6(L7_7)
  L6_6 = invokeTask
  function L7_7()
    view_task = Mv_viewObj("locator2_goal_01", 0.3)
    comSetNavi(findGameObject2("Node", "locator2_goal_01"))
    waitSeconds(1)
    view_task = Mv_safeTaskAbort(view_task)
    Fn_captionView("sm29_02008")
    while true do
      waitSeconds(GOAL_HURRY_TIME)
      Fn_captionViewWait("sm29_02009")
    end
  end
  L6_6 = L6_6(L7_7)
  L4_4 = L6_6
  L6_6 = Mv_waitPhase
  L6_6()
  L6_6 = Fn_blackout
  L6_6()
  L6_6 = Fn_userCtrlOff
  L6_6()
  L6_6 = Mv_safeTaskAbort
  L7_7 = L4_4
  L6_6 = L6_6(L7_7)
  L4_4 = L6_6
  L6_6 = Mv_safeTaskAbort
  L7_7 = view_task
  L6_6 = L6_6(L7_7)
  view_task = L6_6
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_catwarp_area_03"
  L6_6(L7_7)
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_catwarp_guide_03"
  L6_6(L7_7)
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_catwarp_warning_03"
  L6_6(L7_7)
  L6_6 = Fn_pcSensorOff
  L7_7 = "pccubesensor2_goal_area_01"
  L6_6(L7_7)
  L6_6 = Fn_setGrabReleaseNpc
  L7_7 = "sm29_client"
  L6_6(L7_7)
  L6_6 = Player
  L7_7 = L6_6
  L6_6 = L6_6.setGrabExceptionalObject
  L8_8 = {}
  L6_6(L7_7, L8_8)
  L6_6 = HUD
  L7_7 = L6_6
  L6_6 = L6_6.inGamePreviewExit
  L6_6(L7_7)
  L6_6 = Fn_resetPcPos
  L7_7 = "locator2_resetpos_gurigo_01"
  L6_6(L7_7)
  L6_6 = Fn_warpNpc
  L7_7 = "sm29_client"
  L8_8 = "locator2_boy_end_pos_03"
  L6_6(L7_7, L8_8)
  L6_6 = _sdemo_cut01
  L7_7 = L6_6
  L6_6 = L6_6.set
  L8_8 = "locator2_before_demo_gurigo_camera_01"
  L9_9 = "locator2_before_demo_gurigo_aim_01"
  L10_10 = false
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L6_6 = _sdemo_cut01
  L7_7 = L6_6
  L6_6 = L6_6.play
  L6_6(L7_7)
  L6_6 = Fn_naviKill
  L6_6()
  L6_6 = Fn_fadein
  L7_7 = 5
  L6_6(L7_7)
  L6_6 = Fn_kaiwaDemoView
  L7_7 = "sm29_00500k"
  L6_6(L7_7)
  L6_6 = Fn_turnNpc
  L7_7 = "sm29_client"
  L8_8 = "locator2_demo_gurigo_aim_02"
  L6_6(L7_7, L8_8)
  L6_6 = Player
  L7_7 = L6_6
  L6_6 = L6_6.setLookAtIk
  L8_8 = true
  L9_9 = 1
  L10_10 = findGameObject2
  L11_11 = "Node"
  L12_12 = "locator2_demo_gurigo_aim_02"
  L10_10 = L10_10(L11_11, L12_12)
  L11_11 = L10_10
  L10_10 = L10_10.getWorldPos
  L12_12 = L10_10(L11_11)
  L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L10_10(L11_11))
  L6_6 = waitSeconds
  L7_7 = 1
  L6_6(L7_7)
  L6_6 = Player
  L7_7 = L6_6
  L6_6 = L6_6.setLookAtIk
  L8_8 = false
  L9_9 = 1
  L10_10 = Vector
  L11_11 = 0
  L12_12 = 0
  L12_12 = L10_10(L11_11, L12_12, 0)
  L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L10_10(L11_11, L12_12, 0))
  L6_6 = Fn_fadein
  L6_6()
  L6_6 = waitSeconds
  L7_7 = 1
  L6_6(L7_7)
  L6_6 = 4
  L7_7 = {L8_8}
  L8_8 = {}
  L8_8.pos = "locator2_demo_gurigo_camera_02"
  L8_8.time = L6_6
  L8_8 = {L9_9}
  L9_9 = {}
  L9_9.pos = "locator2_demo_gurigo_aim_02"
  L9_9.time = L6_6
  L9_9 = _sdemo_cut02
  L10_10 = L9_9
  L9_9 = L9_9.set
  L11_11 = "locator2_demo_gurigo_camera_03"
  L12_12 = "locator2_demo_gurigo_aim_01"
  L9_9(L10_10, L11_11, L12_12, false)
  L9_9 = _sdemo_cut02
  L10_10 = L9_9
  L9_9 = L9_9.play
  L11_11 = L7_7
  L12_12 = L8_8
  L9_9(L10_10, L11_11, L12_12)
  L9_9 = Fn_resetPcPos
  L10_10 = "locator2_resetpos_hashira_01"
  L9_9(L10_10)
  L9_9 = Fn_warpNpc
  L10_10 = "sm29_client"
  L11_11 = "locator2_boy_hashira_01"
  L9_9(L10_10, L11_11)
  L9_9 = waitSeconds
  L10_10 = 1
  L9_9(L10_10)
  while true do
    L9_9 = _sdemo_cut01
    L10_10 = L9_9
    L9_9 = L9_9.isPlay
    L9_9 = L9_9(L10_10)
    if L9_9 then
      L9_9 = wait
      L9_9()
    end
  end
  L9_9 = waitSeconds
  L10_10 = 1.5
  L9_9(L10_10)
  L9_9 = Fn_setKittenAndCatActive
  L10_10 = true
  L9_9(L10_10)
  L9_9 = Fn_setNpcVisible
  L10_10 = "sm29_client"
  L11_11 = true
  L9_9(L10_10, L11_11)
  L9_9 = waitSeconds
  L10_10 = 2
  L9_9(L10_10)
  L9_9 = Fn_kaiwaDemoView
  L10_10 = "sm29_00600k"
  L9_9(L10_10)
  L9_9 = {}
  L9_9.degree_h = 90
  L9_9.degree_v = 90
  L9_9.in_length = 100
  L9_9.out_length = 100
  L9_9.valid = true
  L10_10 = findGameObject2
  L11_11 = "Node"
  L12_12 = "locator2_watch_hashira"
  L10_10 = L10_10(L11_11, L12_12)
  L9_9.target = L10_10
  L9_9.watchTarget = true
  L10_10 = waitSeconds
  L11_11 = 0.5
  L10_10(L11_11)
  L10_10 = Fn_findNpc
  L11_11 = "sm29_client"
  L10_10 = L10_10(L11_11)
  L11_11 = L10_10
  L10_10 = L10_10.setSightParam
  L12_12 = L9_9
  L10_10(L11_11, L12_12)
  L10_10 = waitSeconds
  L11_11 = 0.5
  L10_10(L11_11)
  L10_10 = waitSeconds
  L11_11 = 1
  L10_10(L11_11)
  L10_10 = 10
  L11_11 = {L12_12}
  L12_12 = {}
  L12_12.pos = "locator2_demo_hasira_camera_02"
  L12_12.time = L10_10
  L12_12 = {
    {
      pos = "locator2_demo_hashira_aim_02",
      time = L10_10
    }
  }
  _sdemo_cut02:play(L11_11, L12_12)
  waitSeconds(3)
  Fn_blackout(2)
  Fn_findNpc("sm29_client"):resetSightParam()
  Fn_disappearNpc("sm29_client")
  _sdemo_cut02:stop()
  waitSeconds(4.5)
  Fn_fadein()
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_catwarp_guide_03_OnLeave()
  Fn_pcSensorOn("pccubesensor2_catwarp_safe_03")
  if boy_puppet:isGrabbed() then
  else
    comCatWarpWarning("sm29_02012", boy_puppet)
  end
  onWarningFlag()
end
function pccubesensor2_catwarp_warning_03_OnLeave()
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  if boy_puppet:isGrabbed() then
    comCatWarpWarning("sm29_02011", "locator2_warning_navi_03")
  else
    Fn_captionView("sm29_09000")
  end
end
function pccubesensor2_catwarp_safe_03_OnEnter(A0_17)
  Fn_pcSensorOff(A0_17)
  if boy_puppet:isGrabbed() then
    comKillNavi()
  end
  offWarningFlag()
end
function pccubesensor2_catwarp_area_03_OnEnter()
  local L0_18, L1_19
end
function pccubesensor2_catwarp_area_03_OnLeave()
  catwarpFunc("locator2_boy_start_pos_03")
end
function pccubesensor2_goal_advice_c_01_OnEnter()
  if not _goal_area_flag then
    _goal_area_flag = true
    invokeAdviceMessage("locator2_goal_01", "sm29_02013")
  end
end
function pccubesensor2_goal_advice_c_02_OnLeave()
  local L0_20, L1_21
  _goal_area_flag = false
end
function pccubesensor2_goal_find_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_goal_area_01_OnEnter()
  Mv_gotoNextPhase()
end
