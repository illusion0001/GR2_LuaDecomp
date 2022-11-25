dofile("/Game/Event2/Common/TutorialCommon.lua")
ADVICE_TIME00 = 15
ADVICE_TIME01 = 20
ADVICE_TIME02 = 40
ADVICE_TIME03 = 60
ADVICE_TIME04 = 80
MISSION_PHASE01 = 1
MISSION_PHASE02 = 2
MISSION_PHASE03 = 3
MISSION_PHASE04 = 4
MISSION_PHASE05 = 5
MISSION_PHASE06 = 6
MISSION_PHASE07 = 7
MISSION_PHASE08 = 8
PHOTO_TARGET_MAX = 5
PHOTO_SUCCESS_CNT = 3
NEAR_TIME = 20
_mission_phase = 0
_catwarp_flag = false
_advice_message_flag = false
_navi_set = nil
_warning_flag = false
_turorial_cap_view = false
_pc_grab_sensor_in = true
function pccubesensor2_client_grab_sensorOnEnter(A0_0)
  _pc_grab_sensor_in = true
  if _turorial_cap_view then
    Fn_tutorialCaption("grab")
  end
end
function pccubesensor2_client_grab_sensorOnLeave(A0_1)
  _pc_grab_sensor_in = false
  Fn_tutorialCaptionKill()
  invokeTask(function()
    wait()
    Fn_captionView("sm29_00116")
  end)
end
function invokeAdviceMessage(A0_2, A1_3)
  if _advice_message_flag == true then
    return false
  end
  invokeTask(function()
    local L0_4
    L0_4 = Player
    L0_4 = L0_4.setStay
    L0_4(L0_4, true)
    _advice_message_flag = true
    L0_4 = Mv_viewObj
    L0_4 = L0_4(A0_2)
    Player:setStay(false)
    Fn_captionViewWait(A1_3)
    L0_4 = Mv_safeTaskAbort(in_view_task)
    _advice_message_flag = false
  end)
end
function comCatWarpWarning(A0_5, A1_6)
  invokeTask(function()
    Fn_naviSet(findGameObject2("Node", A1_6))
    Fn_captionViewWait(A0_5)
  end)
end
function comSetNavi(A0_7)
  Fn_naviSet(A0_7)
  _navi_set = A0_7
end
function comKillNavi()
  Fn_naviKill()
  _navi_set = nil
end
function comKillBackNavi()
  Fn_naviKill()
  if _navi_set ~= nil then
    Fn_naviSet(_navi_set)
  end
end
function onWarningFlag()
  local L0_8, L1_9
  _warning_flag = true
end
function offWarningFlag()
  local L0_10, L1_11
  _warning_flag = false
end
function getWarningFlag()
  local L0_12, L1_13
  L0_12 = _warning_flag
  return L0_12
end
function nekowarpFunc(A0_14)
  return invokeTask(function()
    _catwarp_flag = true
    Player:setStay(true)
    Fn_userCtrlAllOff()
    Fn_catWarpIn()
    Fn_setCatWarpCheckPoint(A0_14)
    Fn_catWarpCheckPoint()
    Player:setStay(false)
    Fn_catWarpOut()
    while not HUD:faderStability() do
      wait()
    end
    wait(15)
    Fn_userCtrlOn()
    _cat_warp_flag = false
  end)
end
function catwarpFunc(A0_15)
  invokeTask(function()
    local L0_16
    L0_16 = Fn_findNpcPuppet
    L0_16 = L0_16("sm29_client")
    if L0_16:isGrabbed() == true then
      Fn_catWarp()
      Fn_setGrabReleaseNpc("sm29_client")
      Fn_warpNpc("sm29_client", A0_15)
      waitSeconds(1.5)
      Fn_setGrabNpc("sm29_client", false, false)
      Player:setGrabObject(L0_16)
    else
      Fn_catWarp()
    end
  end)
end
function arrayRaycastCheck(A0_17, A1_18)
  for _FORV_5_, _FORV_6_ in pairs(A0_17) do
    if Mv_raycastCameraSight(A0_17[_FORV_5_], A1_18) == true then
      return true
    end
  end
  return false
end
function switchTutorialCap(A0_19)
  local L1_20
  _turorial_cap_view = A0_19
end
function inPcGrabSensor()
  local L0_21, L1_22
  L0_21 = _pc_grab_sensor_in
  return L0_21
end
