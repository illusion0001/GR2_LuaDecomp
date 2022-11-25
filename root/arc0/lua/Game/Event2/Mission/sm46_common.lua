TARGET_RAY_DIST = 80
GRAB_VIEW_WAIT = 1
ADVICE_TIME01 = 30
ADVICE_TIME02 = 60
WORKER_MAX = 8
BOX_MAX = 10
BT_BOX_MAX = 16
VIEW_TIME_OVER = 3
PT_BRAKE = 0
PT_BRAKE_FLOAT = 1
PT_STOP = 2
PT_STOP_FLOAT = 3
PT_STOP_GROUND = 4
CTRL_ON = 0
CTRL_OFF = 1
CTRL_ALL_OFF = 2
CATWARP_PHASE01 = 1
CATWARP_PHASE02 = 2
CATWARP_PHASE03 = 3
CATWARP_PHASE04 = 4
CATWARP_PHASE05 = 5
NAVI_WAIT_TIME = 1.3
CAP_WAIT_TIME = 2.5
MISSION_WAIT_TIME = 7
MUSIC_PLAY_DIST = 120
CLIENT_WARNING_DIST01 = 20
CLIENT_WARNING_DIST02 = 5
L0_0 = {}
L0_0.count_00 = "man01_count_00"
L0_0.count_01 = "man01_count_01"
L0_0.guide_00 = "man01_guide_00"
_WORK_MOTION = L0_0
L0_0 = {}
L0_0.gaming_00 = "man01_gaming_00"
L0_0.run_afraid_00 = "man01_run_afraid_00"
L0_0.run_afraid_01 = "man01_run_afraid_01"
L0_0.groggy_in_00 = "man01_groggy_in_00"
L0_0.groggy_in_01 = "man01_groggy_in_01"
L0_0.groggy_d_00 = "man01_groggy_d_00"
L0_0.groggy_d_01 = "man01_groggy_d_01"
L0_0.nevy_in = "man01_scared_nevy_in_00"
L0_0.nevy = "man01_scared_nevy_00"
L0_0.scared_in = "man01_scared_in_00"
L0_0.scared = "man01_scared_00"
L0_0.sup = "man01_surprise_00"
L0_0.sca = "man01_scared_04"
_MOTION_LIST = L0_0
L0_0 = {
  {
    name = "son01",
    motion = {
      _WORK_MOTION.count_01
    }
  },
  {
    name = "worker01",
    motion = {"stay_00", "stay_01"}
  },
  {
    name = "worker02",
    motion = {"stay_00", "stay_01"}
  },
  {
    name = "worker03",
    motion = {
      "talk_00",
      "talk_01",
      "talk_02"
    }
  },
  {
    name = "worker04",
    motion = {"stay_00", "stay_01"}
  },
  {
    name = "worker05",
    motion = {"talk_00", "talk_01"}
  },
  {
    name = "worker06",
    motion = {"stay_00", "stay_01"}
  },
  {
    name = "worker07",
    motion = {"talk_00", "talk_01"}
  },
  {
    name = "worker08",
    motion = {"stay_00", "stay_01"}
  }
}
_worker_motion = L0_0
_warning_flag = false
_navi_set_flag = false
_warning_navi_flag = false
_warning_sensor_flag = false
L0_0 = CATWARP_PHASE01
_cat_warp_phase = L0_0
L0_0 = {}
_com_npc_motion = L0_0
L0_0 = {}
_com_npc_flag = L0_0
_stop_flag = false
_grab_first_flag = false
function L0_0(A0_1)
  invokeTask(function()
    if _grab_first_flag == false then
      waitSeconds(1)
      _grab_first_flag = true
    end
    if Fn_findNpcPuppet("fa01"):isGrabbed() == false then
      Fn_tutorialCaption("grab")
    end
  end)
end
pccubesensor2_client_grab_sensorOnEnter = L0_0
function L0_0(A0_2)
  Fn_tutorialCaptionKill()
end
pccubesensor2_client_grab_sensorOnLeave = L0_0
function L0_0(A0_3)
  local L1_4, L2_5
  L1_4 = Fn_findNpcPuppet
  L2_5 = A0_3
  L1_4 = L1_4(L2_5)
  L2_5 = invokeTask
  L2_5 = L2_5(function()
    while true do
      if Fn_getDistanceToPlayer(L1_4) > CLIENT_WARNING_DIST01 then
        Fn_captionView("sm46_00109")
        comSetNavi(L1_4)
        while Fn_getDistanceToPlayer(L1_4) > CLIENT_WARNING_DIST02 do
          wait()
        end
        comKillNavi()
      end
      wait()
    end
  end)
  Mv_NpcGrabCheckWait(A0_3, false)
  L2_5 = Mv_safeTaskAbort(L2_5)
  comKillNavi()
end
clientGrabWait = L0_0
function L0_0(A0_6, A1_7, A2_8)
  return invokeTask(function()
    local L0_9, L1_10
    L0_9 = findGameObject2
    L1_10 = "Node"
    L0_9 = L0_9(L1_10, A0_6)
    L1_10 = Fn_captionView
    L1_10(A2_8)
    L1_10 = Fn_isInSightTarget
    L1_10 = L1_10(A0_6, 0.5)
    if L1_10 then
      L1_10 = Fn_lookAtTargetInput
      L1_10(A0_6)
      L1_10 = waitSeconds
      L1_10(0.5)
    else
      L1_10 = Player
      L1_10 = L1_10.setStay
      L1_10(L1_10, true)
      L1_10 = Fn_userCtrlAllOff
      L1_10()
      L1_10 = Mv_viewObj
      L1_10 = L1_10(A0_6, 0.3)
      waitSeconds(1)
      waitSeconds(1.5)
      L1_10 = Mv_safeTaskAbort(L1_10)
      Player:setStay(false)
      Fn_userCtrlOn()
    end
    L1_10 = comSetNavi
    L1_10(findGameObject2("Node", A1_7))
    L1_10 = Mv_safeTaskAbort
    L1_10 = L1_10(com_view_task)
    com_view_task = L1_10
  end)
end
invokeFindTargetControl = L0_0
function L0_0(A0_11, A1_12)
  Fn_captionView(A0_11)
  _warning_sensor_flag = true
  if _navi_set_flag == false then
    _warning_navi_flag = true
    Fn_naviSet(findGameObject2("Node", A1_12))
  end
end
comGuideFunc = L0_0
function L0_0(A0_13, A1_14)
  invokeTask(function()
    invokePlayerCoerctionStop(PT_BRAKE, PT_CTRL_ON, false, 3)
    Fn_captionView(A0_13)
    _warning_sensor_flag = true
    if _navi_set_flag == false then
      _warning_navi_flag = true
      Fn_naviSet(findGameObject2("Node", A1_14))
    end
  end)
end
comCatWarpWarning = L0_0
function L0_0(A0_15)
  if _navi_set_flag == false then
    Fn_naviSet(A0_15)
    _navi_set_flag = true
  end
end
comSetNavi = L0_0
function L0_0()
  if _navi_set_flag == true then
    Fn_naviKill()
    _navi_set_flag = false
  end
end
comKillNavi = L0_0
function L0_0()
  if _warning_navi_flag == true then
    Fn_naviKill()
    _warning_navi_flag = false
  end
  _warning_sensor_flag = false
end
killWarningNavi = L0_0
function L0_0(A0_16)
  local L1_17
  _cat_warp_phase = A0_16
end
setCatWarpPhase = L0_0
function L0_0()
  local L0_18, L1_19
  L0_18 = _cat_warp_phase
  return L0_18
end
getCatWarpPhase = L0_0
function L0_0(A0_20)
  local L1_21
  _navi_set_flag = A0_20
end
setClientNavi = L0_0
function L0_0()
  local L0_22, L1_23
  L0_22 = _warning_sensor_flag
  return L0_22
end
getWarningFlag = L0_0
function L0_0(A0_24, A1_25)
  invokeTask(function()
    local L0_26
    L0_26 = Fn_findNpcPuppet
    L0_26 = L0_26(A0_24)
    if L0_26:isGrabbed() == true then
      Fn_catWarp()
      Fn_setGrabReleaseNpc(A0_24)
      Fn_warpNpc(A0_24, A1_25)
      waitSeconds(1.5)
      Fn_setGrabNpc(A0_24, false, false)
      Player:setGrabObject(L0_26)
    else
      Fn_catWarp()
    end
  end)
end
catwarpFunc = L0_0
function L0_0(A0_27, A1_28, A2_29, A3_30)
  if A3_30 == nil then
    A3_30 = 0.1
  end
  if A2_29 == true and Player:getAttrTune() ~= Player.kAttrTune_Normal then
    Player:setAttrTune(Player.kAttrTune_Normal, false)
  end
  if control_sw == CTRL_ALL_OFF then
    Fn_userCtrlAllOff()
  else
    if control_sw == CTRL_OFF then
      Fn_userCtrlOff()
    else
    end
  end
  if A0_27 == PT_BRAKE then
    Player:setStay(true)
    waitSeconds(A3_30)
    Player:setStay(false)
  elseif A0_27 == PT_BRAKE_FLOAT then
    Player:setStay(true)
    waitSeconds(A3_30)
  elseif A0_27 == PT_STOP then
    Fn_coercionGravityRevert()
    Player:setStay(true)
    waitSeconds(A3_30)
    Player:setStay(false)
    if Player:isGravityControlMode() == true then
      Fn_coercionGravityShift()
    else
      Fn_coercionGravityRevert()
    end
  elseif A0_27 == PT_STOP_FLOAT then
    Fn_coercionGravityRevert()
    Player:setStay(true)
    waitSeconds(A3_30)
    Player:setStay(false)
    Fn_coercionGravityShift()
  else
    if A0_27 == PT_STOP_GROUND then
      Fn_coercionGravityRevert()
      Player:setStay(true)
      waitSeconds(A3_30)
      Player:setStay(false)
      if Player:isGravityControlMode() then
        Fn_coercionGravityRevert()
      end
    else
    end
  end
end
playerCoerctionStop = L0_0
function L0_0(A0_31, A1_32, A2_33, A3_34)
  return invokeTask(function()
    playerCoerctionStop(A0_31, A1_32, A2_33, A3_34)
  end)
end
invokePlayerCoerctionStop = L0_0
function L0_0(A0_35, A1_36)
  for _FORV_5_, _FORV_6_ in pairs(A0_35) do
    if Mv_raycastCameraSight(A0_35[_FORV_5_], A1_36) == true then
      return true
    end
  end
  return false
end
arrayRaycastCheck = L0_0
function L0_0(A0_37, A1_38, A2_39)
  local L3_40
  L3_40 = _stop_flag
  if L3_40 == false then
    _stop_flag = true
    L3_40 = findGameObject2
    L3_40 = L3_40("Node", A0_37)
    L3_40 = L3_40.getWorldPos
    L3_40 = L3_40(L3_40)
    Fn_captionView(A2_39)
    Player:setStay(true)
    Fn_userCtrlAllOff()
    Camera:lookTo(L3_40, 2, 2)
    waitSeconds(2)
    Player:setStay(false)
    Fn_userCtrlOn()
    _stop_flag = false
  end
end
comStopViewCap = L0_0
function L0_0(A0_41, A1_42)
  if _stop_flag == false then
    _stop_flag = true
    Player:setStay(true)
    Fn_userCtrlOff()
    view_task = comViewconWait(A0_41, A1_42, VIEW_TIME_OVER)
    Player:setStay(false)
    Fn_userCtrlOn()
    _stop_flag = false
  end
end
comStopViewCon = L0_0
function L0_0(A0_43, A1_44, A2_45)
  if _stop_flag == false then
    _stop_flag = true
    Player:setStay(true)
    Fn_userCtrlAllOff()
    comViewconWait(A0_43, A1_44, VIEW_TIME_OVER)
    Player:setStay(false)
    Fn_userCtrlOn()
    Fn_captionView(A2_45)
    _stop_flag = false
  end
end
comStopViewConCap = L0_0
function L0_0(A0_46, A1_47, A2_48)
  local L3_49, L4_50, L5_51
  L3_49 = Fn_lookAtObject
  L4_50 = A0_46
  L3_49 = L3_49(L4_50)
  if A1_47 == nil then
    A1_47 = 0.5
  end
  if A2_48 == nil then
    A2_48 = 0
  end
  L4_50 = false
  L5_51 = invokeTask
  L5_51 = L5_51(function()
    waitSeconds(A2_48)
    L4_50 = true
  end)
  while L4_50 == false do
    if Fn_isInSightTarget(A0_46, A1_47) then
      L4_50 = true
    end
    wait()
  end
  L3_49 = Mv_safeTaskAbort(L3_49)
  L5_51 = Mv_safeTaskAbort(L5_51)
  return true
end
comViewconWait = L0_0
function L0_0(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59
  L2_54 = {}
  L2_54.isStop = true
  L2_54.animBlendDuration = 0.25
  if A1_53 == nil then
    for L6_58, L7_59 in L3_55(L4_56) do
      if _com_npc_motion[L7_59.name] == nil then
        waitSeconds(0.2)
        _com_npc_motion[L7_59.name] = invokeTask(function()
          while _com_npc_flag[L7_59.name] == true do
            for _FORV_3_ = 1, #L7_59.motion do
              if _com_npc_flag[L7_59.name] ~= false then
                Fn_playMotionNpc(L7_59.name, L7_59.motion[_FORV_3_], true, L2_54)
              end
            end
            _FOR_()
          end
        end)
      end
      _com_npc_flag[L7_59.name] = true
      break
    end
  else
    for L6_58, L7_59 in L3_55(L4_56) do
      if L7_59.name == A1_53 then
        if _com_npc_motion[L7_59.name] == nil then
          waitSeconds(0.2)
          _com_npc_motion[L7_59.name] = invokeTask(function()
            while _com_npc_flag[L7_59.name] == true do
              for _FORV_3_ = 1, #L7_59.motion do
                if _com_npc_flag[L7_59.name] ~= false then
                  Fn_playMotionNpc(L7_59.name, L7_59.motion[_FORV_3_], true, L2_54)
                end
              end
              _FOR_()
            end
          end)
        end
        _com_npc_flag[L7_59.name] = true
        break
      else
      end
    end
  end
end
playNpcMotion = L0_0
function L0_0(A0_60, A1_61)
  if A1_61 == nil then
    for _FORV_5_, _FORV_6_ in pairs(A0_60) do
      _com_npc_motion[_FORV_6_.name] = Mv_safeTaskAbort(_com_npc_motion[_FORV_6_.name])
      _com_npc_flag[_FORV_6_.name] = false
    end
  else
    for _FORV_5_, _FORV_6_ in pairs(A0_60) do
      if _FORV_6_.name == A1_61 then
        _com_npc_motion[_FORV_6_.name] = Mv_safeTaskAbort(_com_npc_motion[_FORV_6_.name])
        _com_npc_flag[_FORV_6_.name] = false
      end
    end
  end
end
stopNpcMotion = L0_0
function L0_0(A0_62)
  local L1_63
  L1_63 = createGameObject2
  L1_63 = L1_63("GimmickBg")
  L1_63:setDrawModelName("cimemo01_base")
  L1_63:setCollidablePermission(false)
  L1_63:try_init()
  L1_63:waitForReady()
  L1_63:try_start()
  Fn_attachJoint(L1_63, Fn_findNpcPuppet(A0_62), "loc_l_hand")
end
set_npc_memo = L0_0
function L0_0(A0_64, A1_65, A2_66, A3_67, A4_68)
  local L5_69
  L5_69 = Fn_findNpcPuppet
  L5_69 = L5_69(A0_64)
  return invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer(L5_69) > A3_67 then
        Fn_captionViewWait(A1_65)
        if A2_66 == true then
          comSetNavi(A0_64)
        end
        while Fn_getDistanceToPlayer(L5_69) > A4_68 do
          wait()
        end
        if A2_66 == true then
          comKillNavi()
        end
      end
      wait()
    end
  end)
end
guideNaviWait = L0_0
function L0_0()
  local L0_70, L1_71
  _stop_flag = false
end
clearStopFlag = L0_0
function L0_0(A0_72, A1_73, A2_74)
  local L3_75
  function L3_75(A0_76, A1_77, A2_78)
    local L3_79
    L3_79 = 1
    return L3_79
  end
  return invokeTask(function()
    local L0_80, L1_81
    L0_80 = Fn_findAreaHandle
    L1_81 = A1_73
    L0_80 = L0_80(L1_81)
    L1_81 = L0_80.findChildNode
    L1_81 = L1_81(L0_80, A2_74, true)
    while true do
      if Fn_getDistanceToPlayer(_puppet_tbl[A0_72]) <= 60 then
        if L0_80 == nil then
          L0_80 = Fn_findAreaHandle(A1_73)
        end
        while true do
          L1_81 = L0_80:findChildNode(A2_74, true)
          if L1_81 ~= nil then
            L1_81:setIgnoreGrab(true)
            L1_81:setDetectable(false)
            L1_81:setEventListener("judge", L3_75)
            break
          end
          wait()
        end
      end
      wait()
    end
  end)
end
benchNoGrab = L0_0
