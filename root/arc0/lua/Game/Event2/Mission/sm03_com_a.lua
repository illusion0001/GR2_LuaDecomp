dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Mob/mob_event_util.lua")
_camera_request = false
_camera_request_flag = false
_once_camera_requested = false
_speed_on = false
_ship_start = false
_is_goal = false
_reset = false
_grab_start = false
_tutorial_cap_on = false
_box_is_grabbed = false
_box_is_arrived = false
_box_is_broken = false
function Initialize()
  _sdemo_cut01 = SDemo.create("sm46_com_cut01")
  _sdemo_cut01:setCameraParam(nil, nil, {deg = 30})
  Mob:restrict_sm03_00(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_getGameObject
  L1_1 = "mother2"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.sendEvent
  L3_3 = "getBackgroundElement2Handle"
  L4_4 = "port"
  L1_1 = L1_1(L2_2, L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.findSubArea
  L4_4 = "po_a_17"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = {
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8
  }
  L4_4 = "locator2_ship_move_c_01"
  L8_8 = "locator2_ship_move_c_05"
  L4_4 = {}
  for L8_8, L9_9 in L5_5(L6_6) do
    L4_4[L8_8] = findGameObject2("Node", L9_9)
  end
  L8_8 = Fn_createGimmickBg
  L9_9 = "locator2_box_event"
  L8_8 = L8_8(L9_9, "box_01", "woodbox_ms_01", true, "box_ms_02_event_02")
  function L9_9()
    if L8_8 == nil then
      return nil
    end
    if L8_8:getDynamicObject() ~= nil then
      return (L8_8:getDynamicObject())
    else
      return L8_8
    end
  end
  L9_9():setMoveThreshold(0)
  L9_9():setIgnoreGrab(true)
  while true do
    if _camera_request then
      if _camera_request_flag == true then
        _sdemo_cut01:set("locator2_jesture_cam_01", "locator2_jesture_aim_01")
        _sdemo_cut01:play()
      elseif _camera_request_flag == false then
        _sdemo_cut01:stop()
      end
      _camera_request = false
      print("\227\131\135\227\131\162\227\130\171\227\131\161\227\131\169\232\168\173\229\174\154\229\135\166\231\144\134\231\181\130\228\186\134")
    end
    if Fn_getMissionPart() == "sm03_c" then
      Player:setGrabExceptionalObject({
        "box_01",
        "box_01_dynamic"
      })
      L8_8:setEventListener("dynamic", function(A0_10)
        A0_10:getDynamicObject():setName("box_01_dynamic")
      end)
      L8_8:setIgnoreGrab(false)
      if L8_8:isGrabbed() and not _box_is_grabbed then
        _grab_start = false
        L8_8:setGrabReleasePermission(false)
        Fn_naviKill()
        L8_8:setMoveThreshold(-1)
        _box_is_grabbed = true
      end
    end
    if _grab_start and not _box_is_broken and not _box_is_grabbed then
      Fn_naviSet(L9_9())
      L8_8:setMoveThreshold(0)
      if L8_8:isBroken() then
        Fn_naviKill()
        _box_is_broken = true
        _grab_start = false
      end
    end
    if _tutorial_cap_on and not _box_is_arrived and L8_8:isGrabbed() == false then
      if Fn_getDistanceToPlayer(L8_8) <= 3 then
        Fn_tutorialCaption("grab")
      else
        Fn_tutorialCaptionKill()
      end
    end
    if _reset then
      L8_8:requestRestoreForce()
      Fn_warpArea("po_a_17", "locator2_ship_reset", false)
      L2_2:setMoveVelocity(0)
      if L5_5:isRunning() then
        L5_5:abort()
      end
      if L6_6:isRunning() then
        L6_6:abort()
      end
      _is_goal = false
      _box_is_grabbed = false
      _box_is_broken = false
      _reset = false
    end
    if _box_is_arrived then
      L9_9():setGrabReleaseForce(true)
      L9_9():setIgnoreGrab(true)
      Player:setGrabExceptionalObject({})
    end
    if _speed_on and L5_5 == nil then
      Area:setMoveEnable(true)
      L2_2:setMoveEnable(true)
    end
    if L7_7 == #L3_3 then
      print("\232\136\185\239\188\154\227\130\180\227\131\188\227\131\171")
      _is_goal = true
      _speed_on = false
    end
    if not _is_goal or not _box_is_arrived then
      wait()
    end
  end
end
function Finalize()
  Mob:restrict_sm03_00(false)
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function requestCameraSet(A0_11)
  if not _camera_request then
    _camera_request = true
    _camera_request_flag = A0_11
    _once_camera_requested = true
  end
end
function isOnceCameraSet()
  local L0_12, L1_13
  L0_12 = _once_camera_requested
  return L0_12
end
function requestShipSpeedUp()
  local L0_14, L1_15
  _speed_on = true
  _ship_start = true
end
function isShipGoal()
  local L0_16, L1_17
  L0_16 = _is_goal
  return L0_16
end
function isShipStart()
  local L0_18, L1_19
  L0_18 = _ship_start
  return L0_18
end
function requestReset()
  local L0_20, L1_21
  _reset = true
end
function isBoxGrabbed()
  local L0_22, L1_23
  L0_22 = _box_is_grabbed
  return L0_22
end
function requestGrabNavi()
  local L0_24, L1_25
  _grab_start = true
  _navi_wait = true
end
function requestTutorialCaption()
  local L0_26, L1_27
  _tutorial_cap_on = true
end
function isBoxBroken()
  local L0_28, L1_29
  L0_28 = _box_is_broken
  return L0_28
end
function requestRelease()
  local L0_30, L1_31
  _box_is_arrived = true
end
