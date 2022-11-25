local L1_1, L2_2, L3_3
_mv_is_goto_next_phase = false
_mv_is_leave_area = false
_mv_cat_isleave = false
_mv_cat_sdemo_cut = nil
_mv_racer = nil
_mv_racer_03_mot = nil
_mv_kitun_02_mot = nil
_mv_kitun_01_mot = nil
_mv_restore_task = nil
_mv_timer_task = nil
_mv_timer_count = 0
_mv_navi_view_flg = false
function L0_0()
  while not _mv_is_goto_next_phase do
    wait()
  end
  _mv_is_goto_next_phase = false
end
Mv_waitPhase = L0_0
function L0_0()
  local L0_4, L1_5
  _mv_is_goto_next_phase = true
end
Mv_gotoNextPhase = L0_0
function L0_0()
  local L0_6, L1_7
  _mv_is_goto_next_phase = false
end
Mv_resetWaitPhase = L0_0
function L0_0()
  local L1_8
  L1_8 = _mv_is_goto_next_phase
  L1_8 = not L1_8
  return L1_8
end
Mv_isWaitPhase = L0_0
function L0_0(A0_9, A1_10)
  local L2_11
  L2_11 = Fn_lookAtObject
  L2_11 = L2_11(A0_9)
  if A1_10 == nil then
    A1_10 = 0.5
  end
  invokeTask(function()
    while not Fn_isInSightTarget(A0_9, A1_10) do
      wait()
    end
    L2_11:abort()
  end)
  return L2_11
end
Mv_viewObj = L0_0
function L0_0(A0_12, A1_13, A2_14)
  local L3_15, L4_16
  if A1_13 == nil then
    A1_13 = 0.5
  end
  L3_15 = _findObjectHandle
  L4_16 = A0_12
  L3_15 = L3_15(L4_16)
  L4_16 = nil
  if A2_14 ~= nil then
    L4_16 = createGameObject2("Node")
    L4_16:setName("ofsNode")
    L3_15:appendChild(L4_16)
    L4_16:setPos(Vector(0, A2_14, 0))
    L4_16:setForceMove()
  else
    L4_16 = L3_15
  end
  while not Fn_isInSightTarget(L4_16, A1_13) do
    wait()
  end
  return (Fn_lookAtObject(L3_15, A2_14))
end
Mv_viewObjWait = L0_0
function L0_0(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22)
  local L6_23, L7_24, L8_25, L9_26
  L6_23 = false
  L8_25 = A0_17
  L7_24 = A0_17.getWorldPos
  L7_24 = L7_24(L8_25)
  L9_26 = A0_17
  L8_25 = A0_17.getWorldRot
  L8_25 = L8_25(L9_26)
  L9_26 = A1_18.getWorldPos
  L9_26 = L9_26(A1_18)
  if A4_21 ~= nil then
    L7_24.x = L7_24.x + A4_21.x
    L7_24.y = L7_24.y + A4_21.y
    L7_24.z = L7_24.z + A4_21.z
  end
  if A5_22 ~= nil then
    L9_26.x = L9_26.x + A5_22.x
    L9_26.y = L9_26.y + A5_22.y
    L9_26.z = L9_26.z + A5_22.z
  end
  Query:setEyeSightTransform(L7_24, L8_25)
  Query:setEyeSightAngle(Deg2Rad(A2_19))
  Query:setEyeSightRange(A3_20)
  Query:debugDrawEyeSight({
    r = 1,
    g = 1,
    b = 1
  })
  if Query:checkEyeSightSphere(L9_26, 1) and Query:raycastEyeSight(L9_26) == nil then
    L6_23 = true
  end
  return L6_23
end
Mv_isEyesight = L0_0
function L0_0(A0_27, A1_28, A2_29, A3_30)
  local L4_31, L5_32, L6_33, L7_34
  L4_31 = false
  L6_33 = A0_27
  L5_32 = A0_27.getWorldPos
  L5_32 = L5_32(L6_33)
  L7_34 = A0_27
  L6_33 = A0_27.getWorldRot
  L6_33 = L6_33(L7_34)
  L7_34 = A1_28.getWorldPos
  L7_34 = L7_34(A1_28)
  if A2_29 ~= nil then
    L5_32.x = L5_32.x + A2_29.x
    L5_32.y = L5_32.y + A2_29.y
    L5_32.z = L5_32.z + A2_29.z
  end
  if A3_30 ~= nil then
    L7_34.x = L7_34.x + A3_30.x
    L7_34.y = L7_34.y + A3_30.y
    L7_34.z = L7_34.z + A3_30.z
  end
  Query:setEyeSightTransform(L5_32, L6_33)
  if Query:raycastEyeSight(L7_34) == nil then
    L4_31 = true
  end
  return L4_31
end
Mv_isThroughRay = L0_0
function L0_0(A0_35)
  local L1_36
  L1_36 = false
  if A0_35 ~= nil and A0_35:isRunning() then
    L1_36 = true
  end
  return L1_36
end
Mv_isSafeTaskRunning = L0_0
function L0_0(A0_37)
  if A0_37 ~= nil then
    A0_37:abort()
  end
  return nil
end
Mv_safeTaskAbort = L0_0
function L0_0(A0_38)
  if A0_38 ~= nil then
    A0_38:kill()
  end
  return nil
end
Mv_safeObjectKill = L0_0
function L0_0(A0_39)
  Fn_blackout()
  if A0_39 ~= nil then
    A0_39()
  end
  Fn_fadein()
end
Mv_sceneSwitchFade = L0_0
function L0_0(A0_40, A1_41, A2_42)
  task = invokeTask(function()
    local L0_43, L1_44
    L0_43 = nil
    L1_44 = false
    if type(A0_40) == "string" then
      L0_43 = findGameObject2("Node", A0_40)
    else
      L0_43 = A0_40
    end
    if A2_42 or A2_42 == nil then
      L1_44 = true
    end
    while true do
      if _mv_is_leave_area then
        if L1_44 then
          Fn_naviSet(L0_43)
        end
        Fn_captionViewWait(A1_41)
        while _mv_is_leave_area do
          wait()
        end
        Mv_viewObj(L0_43):abort()
        if L1_44 then
          Fn_naviKill()
        end
      end
      wait()
    end
  end)
  return task
end
Mv_warningLeaveArea = L0_0
function L0_0(A0_45)
  local L1_46
  _mv_is_leave_area = A0_45
end
Mv_setLeaveArea = L0_0
function L0_0(A0_47)
  local L1_48
  L1_48 = _mv_is_leave_area
  return L1_48
end
Mv_isLeaveArea = L0_0
function L0_0(A0_49, A1_50, A2_51, A3_52, A4_53)
  _mv_cat_sdemo_cut = A0_49
  _mv_racer = A1_50
  _mv_racer_03_mot = A2_51
  _mv_kitun_02_mot = A3_52
  _mv_kitun_01_mot = A4_53
end
Mv_gravityCatWarpInit = L0_0
function L0_0()
  local L0_54, L1_55, L2_56, L3_57, L4_58
  L0_54 = "locator2_cam_front_dove"
  L1_55 = "locator2_aim_front_dove"
  L2_56 = "locator2_cam_front_kitun"
  L3_57 = "locator2_aim_front_kitun"
  L4_58 = invokeTask
  L4_58(function()
    _mv_cat_sdemo_cut:set(L0_54, L1_55, false)
    _mv_cat_sdemo_cut:switchCamera(true)
    Fn_playMotionNpc(_mv_racer, _mv_racer_03_mot, false)
    waitSeconds(1)
    _mv_cat_sdemo_cut:set(L2_56, L3_57, false)
    _mv_cat_sdemo_cut:switchCamera(true)
    Fn_playPlayerMotion(_mv_kitun_02_mot, 0)
    waitSeconds(1)
    Fn_playPlayerMotion(_mv_kitun_01_mot, -1)
    _mv_cat_sdemo_cut:stop(0)
    waitSeconds(2)
  end)
  L4_58 = {}
  L4_58.timer = true
  L4_58.counter = true
  Fn_counterViewDelay(L4_58)
  Fn_countDown()
end
Mv_countDownSdemoFunc = L0_0
function L0_0()
  return (invokeTask(function()
    while true do
      if _mv_cat_isleave then
        Fn_catWarp()
        _mv_cat_isleave = false
      end
      wait()
    end
  end))
end
Mv_gravityCatWarp = L0_0
function L0_0(A0_59)
  local L1_60
  _mv_cat_isleave = A0_59
end
Mv_setGravityCatWarpLeaveArea = L0_0
function L0_0()
  local L0_61
  L0_61 = createGameObject2
  L0_61 = L0_61("GrabbedObjectGenerator")
  L0_61:setGenerationObjectIsWater(false)
  L0_61:setGenerationOnceNum(Player:getGrabSlotNum())
  L0_61:setCollisionHalfExtent(Vector(1.5, 1.5, 1.5))
  L0_61:setGenertionObjectName("cinewspaper01_base")
  L0_61:try_init()
  L0_61:waitForReady()
  L0_61:try_start()
  Fn_appendToPlayerJoint(L0_61, "bn_root")
  _mv_restore_task = invokeTask(function()
    repeat
      if Player:getGrabSlotNum() > Player:getGrabObjectCount() then
        Player:grabSilently(1)
      end
      waitSeconds(0.5)
    until false
  end)
end
Mv_startInfiniteGenerationPaper = L0_0
function L0_0()
  if _mv_restore_task ~= nil then
    _mv_restore_task:abort()
    _mv_restore_task = nil
  end
end
Mv_abortInfiniteGenerationPaper = L0_0
function L0_0(A0_62, A1_63)
  local L2_64, L3_65, L4_66
  L3_65 = A0_62
  L2_64 = A0_62.getName
  L2_64 = L2_64(L3_65)
  L3_65 = createGameObject2
  L4_66 = "Gem"
  L3_65 = L3_65(L4_66)
  L4_66 = L3_65.setGemModelNo
  L4_66(L3_65, A1_63)
  L4_66 = A0_62.appendChild
  L4_66(A0_62, L3_65)
  L4_66 = A0_62.getWorldPos
  L4_66 = L4_66(A0_62)
  L4_66 = L4_66 + Vector(0, 0, 0)
  L3_65:setWorldPos(L4_66)
  L3_65:setForceMove()
  L3_65:setVisible(true)
  L3_65:setVisibleBlockHalfSize(150)
  L3_65:try_init()
  L3_65:waitForReadyAsync(function()
    L3_65:try_start()
  end)
  return L3_65
end
Mv_createGem = L0_0
function L0_0(A0_67, A1_68, A2_69, A3_70)
  local L4_71, L5_72, L6_73, L7_74
  L4_71 = {}
  L5_72 = 0
  if A1_68 >= 2 then
    L5_72 = A3_70
  end
  for _FORV_9_ = 1, A0_67 do
    L4_71[_FORV_9_] = Fn_getDistanceToPlayer("locator2_target_" .. string.format("%02d", _FORV_9_ + L5_72))
  end
  for _FORV_11_ = 1, A0_67 do
    if A2_69[_FORV_11_ + L5_72] and L6_73 > L4_71[_FORV_11_] then
    end
  end
  return "locator2_target_" .. string.format("%02d", L7_74)
end
Mv_getTargetNearPlayer = L0_0
function L0_0()
  _mv_timer_task = invokeTask(function()
    while true do
      if not _mv_navi_view_flg then
        print("\227\130\171\227\130\166\227\131\179\227\131\136\228\184\173:" .. _mv_timer_count)
        waitSeconds(1)
        _mv_timer_count = _mv_timer_count + 1
      end
      wait()
    end
  end)
end
Mv_startCountSecond = L0_0
function L0_0()
  if _mv_timer_task ~= nil then
    _mv_timer_task:abort()
    _mv_timer_task = nil
  end
end
Mv_abortCountSecond = L0_0
function L0_0(A0_75)
  local L1_76
  L1_76 = nil
  L1_76 = createGameObject2("PlayerSensor")
  L1_76:setDetectBehavior(1)
  L1_76:addBox(Vector(6, 6, 6))
  L1_76:setPos(Vector(0, 0, 0))
  L1_76:setOnEnter("pccubesensor2_client_grab_sensorOnEnter")
  L1_76:setOnLeave("pccubesensor2_client_grab_sensorOnLeave")
  L1_76:setActive(false)
  Fn_findNpcPuppet(A0_75):appendChild(L1_76)
  L1_76:try_init()
  L1_76:waitForReady()
  L1_76:try_start()
  Player:setGrabExceptionalObject({
    Fn_findNpcPuppet(A0_75):getName()
  })
  return L1_76
end
Mv_createNpcGrabSensor = L0_0
function L0_0(A0_77, A1_78)
  local L2_79
  L2_79 = Fn_findNpcPuppet
  L2_79 = L2_79(A0_77)
  if A1_78 == nil then
    A1_78 = true
  end
  if A1_78 == true then
    Fn_naviSet(L2_79)
  end
  while Fn_findNpcPuppet(A0_77):isGrabbed() == false do
    wait()
  end
  if A1_78 == true then
    Fn_naviKill()
  end
  Fn_tutorialCaptionKill()
  Fn_captionViewEnd()
  return true
end
Mv_NpcGrabCheckWait = L0_0
function L0_0(A0_80, A1_81, A2_82, A3_83)
  local L4_84
  L4_84 = createGameObject2
  L4_84 = L4_84("DNode")
  L4_84:setName(A3_83)
  L4_84:setAsSphere(0.1)
  L4_84:try_init()
  L4_84:waitForReady()
  L4_84:try_start()
  A0_80:appendChild(L4_84)
  A0_80:setEventListener("dynamic", function(A0_85)
    A0_85:getDynamicObject():setName(A1_81)
    A0_85:getDynamicObject():appendChild(L4_84)
  end)
  A0_80:switchGravityGrabAsWeapon(false)
  A0_80:setIgnoreGrab(false)
  HUD:mnaviNew({
    name = "mnavi",
    PochFadeLen0 = 5,
    PochFadeLen100 = 20
  }):setTarget(A0_80)
  HUD:mnaviNew({
    name = "mnavi",
    PochFadeLen0 = 5,
    PochFadeLen100 = 20
  }):setActive(A2_82)
  return {
    navi = HUD:mnaviNew({
      name = "mnavi",
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    }),
    in_range_obj = L4_84
  }
end
Mv_initializeGimmickBgForTransportWithNavi = L0_0
function L0_0(A0_86)
  if A0_86.gimmickbg_hdl:getDynamicObject() ~= nil then
    A0_86.gimmickbg_hdl:getDynamicObject():kill()
  end
  A0_86.gimmickbg_hdl:requestRestoreForce()
  A0_86.gimmickbg_hdl:setIgnoreGrab(false)
  A0_86.gimmickbg_hdl:setMoveThreshold(-1)
  if A0_86.in_range_dnode ~= nil then
    A0_86.gimmickbg_hdl:appendChild(A0_86.in_range_dnode)
  end
  if A0_86.mnavi_hdl ~= nil then
    A0_86.mnavi_hdl:setActive(false)
    A0_86.mnavi_hdl:del()
    A0_86.mnavi_hdl = nil
  end
  A0_86.is_place_fixed = false
  A0_86.is_in_static_range = false
end
Mv_restoreGimmickBgForTransport = L0_0
function L0_0(A0_87, A1_88, A2_89, A3_90, A4_91)
  local L5_92, L6_93
  L5_92, L6_93 = nil, nil
  if A4_91 ~= false then
    L5_92 = Vehicle:spawnRoute(A0_87, g_own)
    L6_93 = Vehicle:spawnVehicle(A1_88, g_own)
  else
    L5_92 = Vehicle:spawnRoute(A0_87)
    L6_93 = Vehicle:spawnVehicle(A1_88)
  end
  L6_93:setName(A2_89)
  L6_93:attach(L5_92)
  L6_93:setWorldTransform(findGameObject2("Node", A3_90):getWorldTransform())
  return L6_93, L5_92
end
Mv_createScriptVehicle = L0_0
function L0_0(A0_94, A1_95, A2_96, A3_97)
  local L4_98, L5_99
  while true do
    L4_98 = Vehicle
    L5_99 = L4_98
    L4_98 = L4_98.isReady
    L4_98 = L4_98(L5_99)
    if not L4_98 then
      L4_98 = wait
      L4_98()
    end
  end
  L4_98 = Mv_createScriptVehicle
  L5_99 = A0_94
  L5_99 = L4_98(L5_99, A1_95, A2_96, A3_97)
  return L4_98, L5_99
end
Mv_createScriptVehicleWait = L0_0
L0_0 = 8.0E-4
L1_1 = 3.0E-4
L2_2 = 8.0E-4
function L3_3(A0_100, A1_101)
  if A0_100.gimmickbg_hdl:getDynamicObject() == nil then
    return
  end
  if A0_100.is_place_fixed then
    return
  end
  if not A0_100.is_in_static_range then
    return
  end
  if A0_100.gimmickbg_hdl:isGrabbed() then
    return
  end
  if Mv_isSafeTaskRunning(A0_100.static_decide_task) then
    return
  end
  A0_100.static_decide_task = Mv_safeTaskAbort(A0_100.static_decide_task)
  A0_100.static_decide_task = invokeTask(function()
    local L0_102, L1_103
    L0_102, L1_103 = nil, nil
    if A0_100.gimmickbg_hdl:getDynamicObject() ~= nil then
      L0_102 = A0_100.gimmickbg_hdl:getDynamicObject():getWorldPos() - A1_101:getWorldPos()
    end
    wait(1)
    if A0_100.gimmickbg_hdl:getDynamicObject() ~= nil then
      L1_103 = A0_100.gimmickbg_hdl:getDynamicObject():getWorldPos() - A1_101:getWorldPos()
    end
    if L0_102 ~= nil and L1_103 ~= nil and A0_100.is_in_static_range and not A0_100.gimmickbg_hdl:isGrabbed() and math.abs(L0_102.x - L1_103.x) < L0_0 and math.abs(L0_102.y - L1_103.y) < L1_1 and math.abs(L0_102.z - L1_103.z) < L2_2 then
      A0_100.is_place_fixed = true
      A0_100.gimmickbg_hdl:getDynamicObject():setIgnoreGrab(true)
      A0_100.gimmickbg_hdl:getDynamicObject():setMoveThreshold(0)
      A0_100.gimmickbg_hdl:getDynamicObject():setWorldTransform(A0_100.gimmickbg_hdl:getDynamicObject():getWorldTransform())
      A0_100.gimmickbg_hdl:getDynamicObject():setForceMove()
      A1_101:appendChild(A0_100.gimmickbg_hdl:getDynamicObject(), true)
      if A0_100.mnavi_hdl ~= nil then
        A0_100.mnavi_hdl:setActive(false)
        A0_100.mnavi_hdl:del()
      end
      Sound:pulse("success")
    end
  end)
end
Mv_checkTransportBagStatic = L3_3
function L3_3(A0_104, A1_105, A2_106, A3_107, A4_108)
  local L5_109, L6_110, L7_111
  L5_109 = false
  if A4_108 == nil then
    A4_108 = 1
  end
  L7_111 = A0_104
  L6_110 = A0_104.getWorldPos
  L6_110 = L6_110(L7_111)
  L7_111 = Camera
  L7_111 = L7_111.getEyePos
  L7_111 = L7_111(L7_111)
  if A2_106 ~= nil then
    L7_111.x = L7_111.x + A2_106.x
    L7_111.y = L7_111.y + A2_106.y
    L7_111.z = L7_111.z + A2_106.z
  end
  if A3_107 ~= nil then
    L6_110.x = L6_110.x + A3_107.x
    L6_110.y = L6_110.y + A3_107.y
    L6_110.z = L6_110.z + A3_107.z
  end
  if A1_105 == nil or A1_105 <= 0 or A1_105 >= Fn_get_distance(L6_110, L7_111) then
    Query:setEyeSightTransform(L7_111)
    if Fn_isInSightTarget(A0_104, A4_108) == true and (Query:raycastEyeSight(L6_110) == nil or Query:raycastEyeSight(L6_110).object == A0_104) then
      L5_109 = true
    end
  end
  return L5_109
end
Mv_raycastCameraSight = L3_3
function L3_3(A0_112, A1_113, A2_114)
  local L3_115
  L3_115 = Fn_lookAtObject
  L3_115 = L3_115(A0_112, A2_114)
  if A1_113 == nil then
    A1_113 = 0.5
  end
  invokeTask(function()
    local L0_116
    L0_116 = 0
    while not Fn_isInSightTarget(A0_112, A1_113) do
      if is_camera_input() == true then
        L0_116 = L0_116 + 1
        if not (L0_116 > 10) then
          else
            L0_116 = 0
          end
          wait()
        end
    end
    if L3_115 ~= nil and L3_115:isRunning() == true then
      L3_115:abort()
    end
    L3_115 = nil
  end)
  return L3_115
end
Mv_viewObjCancelByCameraInput = L3_3
function L3_3(A0_117, A1_118, A2_119, A3_120, A4_121, A5_122)
  return (invokeTask(function()
    if A3_120 ~= nil then
      waitSeconds(A3_120)
    end
    if A0_117 ~= nil then
      Fn_missionView(A0_117)
    end
    if A4_121 == nil then
      A4_121 = 1.3
    end
    waitSeconds(A4_121)
    if A1_118 ~= nil then
      if type(A1_118) == "string" then
        Fn_naviSet(findGameObject2("Node", A1_118))
      else
        Fn_naviSet(A1_118)
      end
    end
    if A5_122 == nil then
      A5_122 = 2.5
    end
    waitSeconds(A5_122)
    if A2_119 ~= nil then
      Fn_captionViewWait(A2_119)
    end
  end))
end
Mv_invokeMissionViewNaviCaption = L3_3
function L3_3(A0_123, A1_124, A2_125)
  local L3_126, L4_127
  L3_126 = Fn_findNpc
  L4_127 = A0_123
  L3_126 = L3_126(L4_127)
  if L3_126 ~= nil then
    L4_127 = L3_126.resetSightParam
    L4_127(L3_126)
    L4_127 = {}
    L4_127.valid = true
    L4_127.target = A1_124
    L4_127.forceTarget = true
    L4_127.watchTarget = false
    L3_126:setSightParam(L4_127)
    L3_126:inform(A1_124, A2_125)
  end
end
Mv_informNpc = L3_3
