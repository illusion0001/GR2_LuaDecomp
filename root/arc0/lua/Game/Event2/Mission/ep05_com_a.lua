dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
NEAR_DIST_BEFORE = 18
NEAR_DIST_AFTER = 13
BOX_MAX = 4
_box_hdl = {}
_box_broken = false
_vogo_demo_request = false
_vogo_demo_task = nil
_thief_navi_request = false
_thief_navi_task = nil
_once_requested_navi = false
_thief_puppet = nil
_navi_exsist = false
_now_missing_retry = false
_alert_cap_view = false
_ignore_camera_out_check = false
_crate_broken = false
_judge_dist = nil
_mnavi = nil
function Initialize()
  local L0_0
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  ship_hdl = L0_0
  L0_0 = ship_hdl
  L0_0 = L0_0.setName
  L0_0(L0_0, "ve_vogo_root")
  L0_0 = {}
  L0_0.xz = {
    rand = 1,
    sign = 1,
    max_a = 1,
    min_a = 0.5,
    max_t = 30,
    min_t = 10
  }
  L0_0.y = {
    rand = 1,
    sign = 0.5,
    max_a = 1,
    min_a = 0.5,
    max_t = 20,
    min_t = 10
  }
  L0_0.angle = {
    rand = 0,
    sign = 0,
    max_a = 0,
    min_a = 0,
    max_t = 60,
    min_t = 30
  }
  ship_hdl:setDriftParams(L0_0)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = findGameObject2
  L1_2 = "Node"
  L0_1 = L0_1(L1_2, L2_3)
  L1_2 = ship_hdl
  L1_2 = L1_2.setWorldTransform
  L6_7 = L3_4(L4_5)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L3_4(L4_5))
  L1_2 = ship_hdl
  L1_2 = L1_2.setForceMove
  L1_2(L2_3)
  L1_2 = {}
  for L5_6 = 1, BOX_MAX do
    L6_7 = Fn_createTerrainBg
    L6_7 = L6_7("locator2_com_box_0" .. L5_6, "box_0" .. L5_6, "box_ms_01", true)
    L1_2[L5_6] = L6_7
  end
  while true do
    if L2_3 then
      _vogo_demo_request = false
      while true do
        L5_6 = "GimmickBg"
        L6_7 = "bg2_box_vogo_"
        L6_7 = L6_7 .. string.format("%02d", L3_4)
        if L4_5 ~= nil then
          L6_7 = L4_5
          L5_6 = L4_5.setEventListener
          L5_6(L6_7, "broken", function(A0_8)
            if Fn_getDistanceToPlayer(L2_3) < 20 then
              _crate_broken = true
            end
          end)
        end
      end
      function L5_6()
        local L0_9
        while true do
          L0_9 = _crate_broken
          if L0_9 == true then
            L0_9 = Player
            L0_9 = L0_9.setStay
            L0_9(L0_9, true)
            L0_9 = waitSeconds
            L0_9(1)
            L0_9 = Mv_viewObj
            L0_9 = L0_9(L2_3, 0.4, 1.5)
            Player:setLookAtIk(true, 1, L2_3:getWorldPos())
            Fn_turnNpc("ep05_vogo_01")
            Fn_playMotionNpc("ep05_vogo_01", "angry_00", false)
            Sound:playSE("vog020a", 1, "", L2_3)
            Fn_captionViewWait("ep05_10000")
            L0_9 = Mv_safeTaskAbort(L0_9)
            Fn_blackout()
            Fn_playMotionNpc("ep05_vogo_01", "stay", false)
            wait()
            Fn_resetPcPos("locator2_pc_reset_com")
            Fn_warpNpc("ep05_vogo_01", "locator2_vogo_reset_com")
            Area:requestRestore()
            wait()
            Player:setStay(false)
            Fn_fadein()
            _crate_broken = false
          end
          L0_9 = wait
          L0_9()
        end
      end
      _vogo_demo_task = L4_5
    else
    end
    if L2_3 then
      if L2_3 == false then
        _thief_navi_task = L2_3
        L2_3(L3_4)
        _thief_navi_request = false
        _once_requested_navi = true
        L5_6 = L4_5 + 2
        L6_7 = L5_6 + 8
        if Fn_getMissionPart() == "ep05_c" then
          _judge_dist = NEAR_DIST_BEFORE
          print("\232\166\139\229\164\177\227\129\132\232\183\157\233\155\162\229\136\157\230\156\159\232\168\173\229\174\154 =", _judge_dist)
        elseif Fn_getMissionPart() == "ep05_d" or Fn_getMissionPart() == "ep05_e" then
          _judge_dist = NEAR_DIST_AFTER
          print("\232\166\139\229\164\177\227\129\132\232\183\157\233\155\162\229\136\157\230\156\159\232\168\173\229\174\154 =", _judge_dist)
        end
        _thief_navi_task = invokeTask(function()
          local L0_10, L1_11, L2_12
          while true do
            L0_10 = Fn_getDistanceToPlayer
            L1_11 = _thief_puppet
            L0_10 = L0_10(L1_11)
            L1_11 = _judge_dist
            if L0_10 <= L1_11 then
              L1_11 = 0
              L3_4 = L1_11
              L1_11 = _navi_exsist
              if L1_11 == false then
                L1_11 = HUD
                L2_12 = L1_11
                L1_11 = L1_11.naviSetPochiDistanceDensity0
                L1_11(L2_12, 0)
                L1_11 = HUD
                L2_12 = L1_11
                L1_11 = L1_11.naviSetPochiDistanceDensity100
                L1_11(L2_12, -1)
                L1_11 = MultiNaviSet
                L2_12 = _thief_puppet
                L1_11(L2_12)
                _navi_exsist = true
                L1_11 = print
                L2_12 = "COM:\227\131\138\227\131\147ON!!!!"
                L1_11(L2_12)
              end
            else
              L1_11 = Fn_isInSightTarget
              L2_12 = _thief_puppet
              L1_11 = L1_11(L2_12, 1)
              if L1_11 then
                L1_11 = Camera
                L2_12 = L1_11
                L1_11 = L1_11.getEyePos
                L1_11 = L1_11(L2_12)
                L2_12 = _thief_puppet
                L2_12 = L2_12.getWorldPos
                L2_12 = L2_12(L2_12)
                L2_12.y = L2_12.y + 1.5
                Query:setEyeSightTransform(L1_11)
                Query:setEyeSightAngle(Deg2Rad(50))
                Query:setEyeSightRange(15)
                Query:debugDrawEyeSight({
                  r = 1,
                  g = 1,
                  b = 1
                })
                if not Query:raycastEyeSight(L2_12) then
                  DebugDraw:setColor(0, 1, 0)
                  L2_3 = true
                else
                  DebugDraw:setColor(1, 0, 0)
                  L2_3 = false
                end
                DebugDraw:drawLines({L1_11, L2_12})
                if L2_3 then
                  L3_4 = 0
                  if _navi_exsist == false then
                    HUD:naviSetPochiDistanceDensity0(0)
                    HUD:naviSetPochiDistanceDensity100(-1)
                    MultiNaviSet(_thief_puppet)
                    _navi_exsist = true
                    print("COM:\227\131\138\227\131\147ON!!!!")
                  end
                else
                  L3_4 = L3_4 + 1
                end
              else
                L1_11 = L3_4
                L1_11 = L1_11 + 1
                L3_4 = L1_11
              end
            end
            L1_11 = _ignore_camera_out_check
            if L1_11 then
              L1_11 = 0
              L3_4 = L1_11
            end
            L1_11 = L3_4
            L2_12 = L4_5
            if L1_11 == L2_12 then
              L1_11 = MultiNaviKill
              L1_11()
              _navi_exsist = false
              L1_11 = print
              L2_12 = "COM:\227\131\138\227\131\147\227\130\173\227\131\171!!!!"
              L1_11(L2_12)
            else
              L1_11 = L3_4
              L2_12 = L5_6
              if L1_11 == L2_12 then
                _alert_cap_view = true
              else
                L1_11 = L3_4
                L2_12 = L6_7
                if L1_11 == L2_12 then
                  _now_missing_retry = true
                end
              end
            end
            L1_11 = L3_4
            if L1_11 > 0 then
              L1_11 = print
              L2_12 = "camera_out_time = "
              L1_11(L2_12, L3_4)
            end
            L1_11 = waitSeconds
            L2_12 = 1
            L1_11(L2_12)
          end
        end)
      end
    else
    end
    L2_3()
  end
end
function Finalize()
  local L0_13, L1_14
end
function vogoBoxBrokenDemo()
  local L0_15, L1_16
  _vogo_demo_request = true
end
function vogoBoxTaskAbort()
  _vogo_demo_task = Mv_safeTaskAbort(_vogo_demo_task)
end
function thiefNavi(A0_17)
  if _once_requested_navi == false then
    print("\229\136\157\227\130\129\227\129\166\227\131\138\227\131\147\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\130\146\227\129\151\227\129\159\227\129\168\227\129\141\227\129\174\229\135\166\231\144\134")
    _thief_puppet = A0_17
    _once_requested_navi = false
    _thief_navi_request = true
  elseif _once_requested_navi then
    _navi_exsist = false
  end
end
function naviTaskAbort()
  _thief_navi_task = Mv_safeTaskAbort(_thief_navi_task)
  MultiNaviKill()
  print("\226\152\133_thief_navi_task:abort!!!!!!!!!!!!!!")
end
function getAlertCapFlag()
  local L0_18, L1_19
  L0_18 = _alert_cap_view
  return L0_18
end
function getMissingRetryFlag()
  local L0_20, L1_21
  L0_20 = _now_missing_retry
  return L0_20
end
function setMissingRetryFlag(A0_22)
  _now_missing_retry = A0_22
  _alert_cap_view = A0_22
  print("_now_missing_retry = ", _now_missing_retry)
  print("_alert_cap_view = ", _alert_cap_view)
end
function setNaviExistFlag(A0_23)
  local L1_24
  _navi_exsist = A0_23
end
function setIgnoreCameraOutCheckFlag(A0_25)
  local L1_26
  _ignore_camera_out_check = A0_25
end
function changeNearDistToAfter(A0_27)
  if A0_27 == false then
    _judge_dist = NEAR_DIST_BEFORE
  elseif A0_27 == true then
    _judge_dist = NEAR_DIST_AFTER
  end
  print("\232\166\139\229\164\177\227\129\132\229\136\164\229\174\154\232\183\157\233\155\162\227\130\146\229\143\179\232\168\152\227\129\184\229\164\137\230\155\180\239\188\129\239\188\154", _judge_dist)
end
function MultiNaviSet(A0_28)
  if _mnavi == nil then
    _mnavi = HUD:mnaviNew({
      name = "navi",
      PochFadeLen0 = 0,
      PochFadeLen100 = -1
    })
    _mnavi:setActive(true)
    _mnavi:setTarget(A0_28)
    return true
  end
  return false
end
function MultiNaviKill()
  if _mnavi ~= nil then
    _mnavi:del(false)
    _mnavi:setActive(false)
    _mnavi = nil
    return true
  end
  return false
end
function getVogoBoxBroken()
  local L0_29, L1_30
  L0_29 = _crate_broken
  return L0_29
end
function areaRestore()
  Area:requestRestore()
end
