dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
MIZ_ID = "miz_01"
MIZ_WARNING_LV1_DISTANCE = 12
MIZ_WARNING_LV2_DISTANCE = 6
CAT_WARP_SENSER_SIZE_MERGIN = 40
MIZ_ONLY_GRAB_DISTANCE = 6
_view_task = nil
_cat_warp_miz_locate = nil
_cat_warp_miz_flag = false
_cat_warp_miz_fall_flag = false
_cat_warp_miz_grab_flag = false
_cat_warp_miz_next_phase = false
_cat_warp_caption_flag = false
_cat_warp_blackout_only_flag = false
_cat_warp_request_flag = false
_cat_warp_request_warning_flag = false
_navi_complete = true
_navi_locate = nil
_navi_enable_lookat = true
_miz_fall_time = 0
_miz_y_old = 0
MIZ_FALL_TIME_LIMIT = 150
_grab_release = false
_ng_near_grab = false
_grab_cap_wait = 0
function setUserCtrlOn(A0_0)
  if A0_0 == true then
    Fn_userCtrlOn()
    Player:setStay(false)
  else
    Fn_userCtrlAllOff()
    Player:setStay(true)
  end
end
function showMissionStart(A0_1, A1_2, A2_3, A3_4)
  local L4_5
  A3_4 = A3_4 or false
  L4_5 = Mv_invokeMissionViewNaviCaption
  L4_5 = L4_5(A0_1, A1_2, A2_3)
  while true do
    if Mv_isSafeTaskRunning(L4_5) == false then
      L4_5 = Mv_safeTaskAbort(L4_5)
      break
    end
    wait()
  end
  if A3_4 == true then
    viewTarget(A1_2, 0.5)
  end
end
function playerNearWait(A0_6, A1_7, A2_8)
  A1_7 = A1_7 or false
  if A0_6 ~= nil then
    while (not (Fn_getDistanceToPlayer(A0_6) <= 4) or A1_7 and Player:getAction() ~= Player.kAction_Idle) and (A2_8 == nil or A2_8() ~= true) do
      wait()
    end
  end
end
function mizNextWaitPhase(A0_9)
  local L1_10, L2_11, L3_12
  L1_10 = Fn_findNpc
  L2_11 = MIZ_ID
  L1_10 = L1_10(L2_11)
  L2_11 = Fn_findNpcPuppet
  L3_12 = L1_10
  L2_11 = L2_11(L3_12)
  L3_12 = L1_10.isGrabbed
  L3_12 = L3_12(L1_10)
  while true do
    if L3_12 ~= L1_10:isGrabbed() then
      L3_12 = L1_10:isGrabbed()
      if L1_10:isGrabbed() == true then
        Fn_naviSet(findGameObject2("Node", A0_9))
      else
        Fn_naviSet(L2_11)
        if Fn_sendEventComSb("getCatWarpPlaying") == false then
          Fn_captionView("sm01_09017")
        end
        invokeTask(function()
          waitSeconds(0.5)
          Fn_playMotionNpc(L1_10, "stay", false)
        end)
      end
    end
    if Mv_isWaitPhase() == false then
      Mv_resetWaitPhase()
      break
    end
    wait()
  end
end
function viewTarget(A0_13, A1_14, A2_15)
  _view_task = Mv_safeTaskAbort(_view_task)
  if A0_13 ~= nil and is_camera_input() == false then
    A2_15 = A2_15 or false
    if A2_15 == true then
      Mv_safeTaskAbort(Mv_viewObjWait(A0_13, A1_14))
    else
      _view_task = Fn_lookAtObject(A0_13)
      invokeTask(function()
        local L0_16
        L0_16 = 30
        while true do
          L0_16 = L0_16 - 1
          if Fn_isInSightTarget(A0_13, A1_14) or L0_16 <= 0 or is_camera_input() == true then
            _view_task = Mv_safeTaskAbort(_view_task)
            break
          end
          wait()
        end
      end)
    end
  end
end
function setNaviAndView(A0_17, A1_18, A2_19)
  A2_19 = A2_19 or false
  if A0_17 ~= nil then
    Fn_naviSet(A0_17)
    viewTarget(A0_17, A1_18, A2_19)
  end
end
function createCatWarpSensor(A0_20, A1_21, A2_22, A3_23)
  local L4_24
  if A3_23 ~= nil then
    L4_24 = A3_23.setActive
    L4_24(A3_23, false)
    L4_24 = A3_23.kill
    L4_24(A3_23)
    A3_23 = nil
    L4_24 = wait
    L4_24()
  end
  L4_24 = createGameObject2
  L4_24 = L4_24("PlayerSensor")
  L4_24:setName(A2_22)
  L4_24:addBox(A1_21)
  L4_24:setOnLeave(A2_22 .. "_OnLeave")
  Fn_findAreaHandle("pi2_a_root"):appendChild(L4_24)
  L4_24:setWorldPos(A0_20)
  L4_24:try_init()
  L4_24:waitForReady()
  L4_24:try_start()
  return L4_24
end
function createMizWarpTask(A0_25, A1_26)
  return invokeTask(function()
    local L0_27, L1_28, L2_29, L3_30, L4_31
    L0_27 = Fn_findNpc
    L1_28 = MIZ_ID
    L0_27 = L0_27(L1_28)
    L1_28 = Fn_findNpcPuppet
    L2_29 = L0_27
    L1_28 = L1_28(L2_29)
    while true do
      L2_29 = false
      L3_30 = false
      L4_31 = _cat_warp_blackout_only_flag
      if L4_31 == true then
        L4_31 = Fn_userCtrlAllOff
        L4_31()
        L4_31 = Fn_blackout
        L4_31()
        L3_30 = true
        L4_31 = Fn_resetPcPos
        L4_31(Fn_getCatWarpCheckPoint())
        L4_31 = waitSeconds
        L4_31(1)
        L4_31 = A0_25
        if L4_31 ~= nil then
          L4_31 = A0_25
          L4_31()
        end
        L4_31 = Fn_userCtrlOn
        L4_31()
        L2_29 = true
        L4_31 = clearMizFallFlag
        L4_31()
        _cat_warp_blackout_only_flag = false
      end
      L4_31 = _cat_warp_miz_next_phase
      if L4_31 == true then
        L2_29 = true
      end
      L4_31 = _cat_warp_miz_flag
      if L4_31 == true then
        L4_31 = findGameObject2
        L4_31 = L4_31("Node", _cat_warp_miz_locate)
        L4_31 = L4_31.getWorldPos
        L4_31 = L4_31(L4_31)
        if L2_29 or L1_28:getWorldPos():DistanceTo(L4_31) > 70 and Fn_sendEventComSb("isOreMining") == false then
          if _cat_warp_miz_grab_flag == true then
            Fn_warpNpc(L0_27, Fn_getCatWarpCheckPoint())
            Player:setGrabExceptionalObject({
              MIZ_ID
            })
            waitSeconds(0.1)
            Fn_setGrabNpc(L0_27, false, _grab_release)
            while Player:setGrabObject(L1_28) == false do
              wait()
            end
            Player:setGrabExceptionalObject({})
          else
            Fn_warpNpc(L0_27, _cat_warp_miz_locate)
          end
        end
        clearMizFallFlag()
        _cat_warp_miz_flag = false
      end
      if L3_30 == true then
        L4_31 = Fn_fadein
        L4_31()
        L3_30 = false
        L4_31 = A1_26
        if L4_31 ~= nil then
          L4_31 = A1_26
          L4_31()
        end
      end
      L4_31 = _navi_complete
      if L4_31 == false then
        L4_31 = _navi_locate
        if L4_31 ~= nil then
          L4_31 = findGameObject2
          L4_31 = L4_31("Node", _navi_locate)
          if L4_31 ~= nil and Fn_getDistanceToPlayer(L4_31) < 40 then
            _navi_complete = true
            Fn_naviKill()
          end
        end
      end
      L4_31 = wait
      L4_31()
    end
  end)
end
function createGrabCaptionWaitTask()
  return invokeTask(function()
    _grab_cap_wait = 0
    while true do
      if _grab_cap_wait > 0 then
        _grab_cap_wait = _grab_cap_wait - 1
      end
      wait()
    end
  end)
end
function createMizNearGrabTask()
  return invokeTask(function()
    local L0_32, L1_33
    L0_32 = Fn_findNpc
    L1_33 = MIZ_ID
    L0_32 = L0_32(L1_33)
    L1_33 = Fn_findNpcPuppet
    L1_33 = L1_33(L0_32)
    while true do
      if Fn_getDistanceToPlayer(L1_33) < MIZ_ONLY_GRAB_DISTANCE then
        if _ng_near_grab == false and L0_32:isGrabbed() == false then
          if false == false then
            Player:setGrabExceptionalObject({
              MIZ_ID
            })
            Fn_setGrabNpc(L0_32, false, _grab_release)
          end
          if _grab_cap_wait <= 0 and Fn_sendEventComSb("isEscapeEnemy") == false and Fn_sendEventComSb("getCatWarpPlaying") == false then
            Fn_tutorialCaption("grab")
          end
        else
          Fn_tutorialCaptionKill()
        end
      else
        if true == true and L0_32:isGrabbed() == false then
          Player:setGrabExceptionalObject({})
          Fn_setGrabNpc(L0_32, true, true)
        end
        Fn_tutorialCaptionKill()
      end
      wait()
    end
  end)
end
function createCatWarpTask()
  local L0_34, L1_35
  L0_34 = Fn_findNpc
  L1_35 = MIZ_ID
  L0_34 = L0_34(L1_35)
  L1_35 = Fn_findNpcPuppet
  L1_35 = L1_35(L0_34)
  L0_34:setEventListener("npcFall", eventMizFallCallback)
  return invokeTask(function()
    while true do
      checkMizFall()
      if _cat_warp_request_flag == true or true == true then
        if Fn_sendEventComSb("getCatWarpPlaying") == false then
          Fn_sendEventComSb("setCatWarpPlaying", true)
          if true == true then
            Fn_captionViewWait("sm01_09006")
          end
          _cat_warp_miz_grab_flag = L0_34:isGrabbed()
          if true == false then
            _cat_warp_retry = true
            Fn_setGrabReleaseNpc(L0_34)
            Fn_catWarp()
            if _cat_warp_miz_grab_flag == true then
              L0_34:setIgnoreGrab(false)
              while Player:setGrabObject(L1_35) == false do
                wait()
              end
            end
            Fn_captionViewEnd()
          else
            _cat_warp_blackout_only_flag = true
            _navi_complete = true
          end
          if _cat_warp_miz_grab_flag == false and (Fn_sendEventComSb("getMissionTerm") == "TAKE" or Fn_sendEventComSb("getMissionTerm") == "TAKE_ORE" or Fn_sendEventComSb("getMissionTerm") == "BACK") then
            Fn_naviSet(L1_35)
          end
          if _cat_warp_miz_locate ~= nil then
            _cat_warp_miz_flag = true
          end
          clearMizFallFlag()
          Fn_sendEventComSb("setCatWarpPlaying", false)
        end
        _cat_warp_request_flag = false
      elseif _cat_warp_request_warning_flag == true then
        _cat_warp_request_warning_flag = false
        Player:setStay(true)
        if L0_34:isGrabbed() == false and (Fn_sendEventComSb("getMissionTerm") == "TAKE" or Fn_sendEventComSb("getMissionTerm") == "TAKE_ORE" or Fn_sendEventComSb("getMissionTerm") == "BACK" or Fn_sendEventComSb("getMizWarningTime") > 1) then
          Fn_naviSet(L1_35)
        else
          Fn_naviSet(findGameObject2("Node", _navi_locate))
          _navi_complete = false
        end
        displayWarningCaption()
        waitSeconds(3)
        Player:setStay(false)
      end
      wait()
    end
  end)
end
function checkMizFall()
  local L0_36, L1_37
  L0_36 = Fn_findNpc
  L1_37 = MIZ_ID
  L0_36 = L0_36(L1_37)
  L1_37 = Fn_findNpcPuppet
  L1_37 = L1_37(L0_36)
  if Fn_getDistanceToPlayer(L1_37) > 15 and Fn_sendEventComSb("getCatWarpPlaying") == false and _cat_warp_blackout_only_flag == false and _cat_warp_miz_flag == false then
    if L0_36:isFall() == true then
      _miz_fall_time = _miz_fall_time + 1
    else
      if _miz_y_old > L1_37:getWorldPos().y + 0.3 then
        _miz_fall_time = _miz_fall_time + 1
      end
      _miz_y_old = L1_37:getWorldPos().y
    end
    if true == false then
      _miz_fall_time = 0
    elseif _miz_fall_time > MIZ_FALL_TIME_LIMIT then
      Fn_sendEventComSb("setMizFallFlag", true)
    end
  else
    clearMizFallFlag()
  end
end
function eventMizFallCallback()
  Fn_sendEventComSb("setMizFallFlag", true)
end
function clearMizFallFlag()
  Fn_sendEventComSb("setMizFallFlag", false)
  _miz_fall_time = 0
end
function displayWarningCaption()
  if Fn_sendEventComSb("getMissionTerm") == "BATTLE" or Fn_sendEventComSb("getMissionTerm") == "FIRST_BATTLE" then
    if Fn_findNpc(MIZ_ID):isGrabbed() == false and Fn_sendEventComSb("getMizWarningTime") > 1 then
      Fn_captionView("sm01_09027")
    else
      Fn_captionView("sm01_09026")
    end
  elseif Fn_sendEventComSb("getMissionTerm") == "BACK" then
    Fn_captionView("sm01_09024")
  elseif Fn_sendEventComSb("getMissionTerm") == "MINING" or Fn_sendEventComSb("getMissionTerm") == "ONLY_MINING" then
    Fn_captionView("sm01_09023")
  elseif Fn_findNpc(MIZ_ID):isGrabbed() == true then
    Fn_captionView("sm01_09008")
  else
    Fn_captionView("sm01_09024")
  end
end
function createGrabTask(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43, A6_44)
  A5_43 = A5_43 or false
  return (invokeTask(function()
    local L0_45, L1_46, L2_47, L3_48
    L0_45 = Fn_findNpc
    L1_46 = MIZ_ID
    L0_45 = L0_45(L1_46)
    L1_46 = Fn_findNpcPuppet
    L2_47 = L0_45
    L1_46 = L1_46(L2_47)
    L2_47 = false
    L3_48 = Player
    L3_48 = L3_48.getEnergy
    L3_48 = L3_48(L3_48, Player.kEnergy_Life)
    while true do
      if A4_42() > 0 then
        if A1_39() == false then
          if L0_45:isGrabbed() == false then
            if A5_43 == true then
              if L2_47 == false and A6_44 then
                Fn_naviSet(L1_46)
              end
              L2_47 = true
            end
            A0_38(true)
          else
            if L2_47 == true then
              Fn_naviKill()
            end
            L2_47 = false
            A0_38(false)
          end
        else
          if A5_43 == true then
            if L2_47 == true then
              Fn_naviKill()
            end
            L2_47 = false
          end
          A0_38(false)
        end
        if A1_39() == false then
          Fn_sendEventComSb("battleMizGrabRelease", A2_40() or L3_48 > Player:getEnergy(Player.kEnergy_Life))
          A3_41()
        end
        L3_48 = Player:getEnergy(Player.kEnergy_Life)
      end
      wait()
    end
  end))
end
function createMizGrabNaviKillTask()
  return (invokeTask(function()
    local L0_49, L1_50
    L0_49 = Fn_findNpc
    L1_50 = MIZ_ID
    L0_49 = L0_49(L1_50)
    L1_50 = L0_49.isGrabbed
    L1_50 = L1_50(L0_49)
    while true do
      if L0_49:isGrabbed() == true and L1_50 ~= L0_49:isGrabbed() then
        Fn_naviKill()
      end
      L1_50 = L0_49:isGrabbed()
      wait()
    end
  end))
end
function createMizJudgeTask(A0_51, A1_52, A2_53, A3_54, A4_55, A5_56)
  return (invokeTask(function()
    local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67
    L0_57 = Fn_findNpc
    L1_58 = MIZ_ID
    L0_57 = L0_57(L1_58)
    L1_58 = Fn_findNpcPuppet
    L2_59 = L0_57
    L1_58 = L1_58(L2_59)
    L3_60 = L0_57
    L2_59 = L0_57.isGrabbed
    L2_59 = L2_59(L3_60)
    L3_60 = Fn_sendEventComSb
    L4_61 = "clearMizBattleJudge"
    L3_60(L4_61)
    while true do
      L3_60 = 1000
      L4_61 = 0
      L5_62 = A0_51
      L5_62 = L5_62()
      if L5_62 == false then
        L5_62 = A1_52
        L5_62 = L5_62()
        if L5_62 == false then
          L5_62 = A3_54
          L5_62 = L5_62()
          for L9_66 = 1, L5_62 do
            L10_67 = "enemy"
            L10_67 = L10_67 .. string.format("%02d", L9_66)
            if A2_53()[L10_67] then
              if Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos()) <= MIZ_WARNING_LV2_DISTANCE then
                L4_61 = 2
              elseif Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos()) <= MIZ_WARNING_LV1_DISTANCE and L4_61 == 0 then
                L4_61 = 1
              end
              if L3_60 > Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos()) then
                L3_60 = Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos())
              end
            end
          end
          for L9_66, L10_67 in L6_63(L7_64) do
            if findGameObject2("Puppet", L10_67) ~= nil then
              if Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos()) <= MIZ_WARNING_LV2_DISTANCE then
                L4_61 = 2
              elseif Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos()) <= MIZ_WARNING_LV1_DISTANCE and L4_61 == 0 then
                L4_61 = 1
              end
              if L3_60 > Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos()) then
                L3_60 = Fn_get_distance(L1_58:getWorldPos(), findGameObject2("Puppet", L10_67):getWorldPos())
              end
            end
          end
          L6_63 = L6_63 == false and L6_63 == false and L2_59 ~= L6_63 and L5_62 > 0
          L2_59 = L7_64
          L9_66 = L4_61
          L10_67 = L6_63
          if L7_64 == true then
            L8_65()
          end
        end
      end
      L5_62 = wait
      L5_62()
    end
  end))
end
function createMizOreCarry(A0_68, A1_69, A2_70)
  return (invokeTask(function()
    local L0_71, L1_72
    L0_71 = Fn_findNpc
    L1_72 = MIZ_ID
    L0_71 = L0_71(L1_72)
    L1_72 = Fn_findNpcPuppet
    L1_72 = L1_72(L0_71)
    Fn_sendEventComSb("requestOreDistanceOn")
    waitSeconds(0.2)
    while true do
      if A2_70() == false then
        if L0_71:isGrabbed() == true then
          if Fn_sendEventComSb("isOreDistanceOn") == false then
            Fn_sendEventComSb("requestOreDistanceOn")
            Fn_naviKill()
          end
          if Fn_sendEventComSb("isNearOre") == true then
            if false == false then
              Fn_captionView("sm01_09018", 0)
            end
          elseif true == true then
            Fn_captionViewEnd()
          end
        elseif Fn_sendEventComSb("isNearOre") == false then
          if true == true and false == false and Fn_getDistanceToPlayer(L1_72) < 5 then
            A0_68()
            Fn_naviSet(L1_72)
            repeat
              wait()
            until not L0_71:isFall()
            Fn_captionViewWait("sm01_01017")
            Fn_playMotionNpc(L0_71, "stay", false)
            Fn_sendEventComSb("requestOreDistanceOff")
          end
        else
          Fn_captionViewEnd()
          Fn_setGrabNpc(L0_71, true, true)
          Fn_playMotionNpc(L0_71, "stay", false)
          Fn_naviKill()
          A1_69()
          break
        end
      end
      wait()
    end
    Fn_sendEventComSb("requestOreDistanceOff")
  end))
end
function updateCatWarp(A0_73, A1_74, A2_75, A3_76, A4_77, A5_78, A6_79)
  Fn_setCatWarpCheckPoint(A0_73)
  _cat_warp_miz_locate = A1_74
  _cat_warp_miz_next_phase = A2_75
  if A6_79 == nil or A6_79 == true then
    _cat_warp_caption_flag = true
  else
    _cat_warp_caption_flag = false
  end
  _navi_locate = A4_77
  if A5_78 == nil then
    _navi_enable_lookat = true
  else
    _navi_enable_lookat = A5_78
  end
  _navi_complete = true
  if A3_76 == true then
    _cat_warp_miz_fall_flag = true
  else
    _cat_warp_miz_fall_flag = false
  end
end
function getCatWarpAreaSize(A0_80, A1_81)
  local L2_82
  L2_82 = Fn_get_distance
  L2_82 = L2_82(A0_80, A1_81)
  L2_82 = L2_82 / 2
  L2_82 = L2_82 + CAT_WARP_SENSER_SIZE_MERGIN
  return Vector(L2_82, L2_82, L2_82)
end
function MizDig()
  local L0_83, L1_84, L2_85, L3_86, L4_87
  L0_83 = Fn_sendEventComSb
  L1_84 = "getNearOre"
  L0_83 = L0_83(L1_84)
  if L0_83 ~= nil then
    L1_84 = Fn_findNpc
    L2_85 = MIZ_ID
    L1_84 = L1_84(L2_85)
    L2_85 = Fn_findNpcPuppet
    L3_86 = L1_84
    L2_85 = L2_85(L3_86)
    L3_86 = Fn_turnNpc
    L4_87 = L1_84
    L3_86(L4_87, L0_83:getWorldPos())
    L3_86 = waitSeconds
    L4_87 = 0.2
    L3_86(L4_87)
    L4_87 = L2_85
    L3_86 = L2_85.getTransform
    L4_87 = L3_86(L4_87)
    L4_87 = L4_87 * YRotQuat(Deg2Rad(15))
    L2_85:setRot(L4_87)
  end
end
function isEnemyGroupAllDead(A0_88)
  if findGameObject2("EnemyGenerator", A0_88) ~= nil then
    return findGameObject2("EnemyGenerator", A0_88):getSpecTable():isEnemyAllDead()
  end
  return true
end
function isRetry(A0_89)
  local L1_90, L2_91, L3_92
  A0_89 = A0_89 or 0
  L1_90 = false
  L2_91 = false
  L3_92 = false
  if _miz_is_dead == true then
    L2_91 = true
    print("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\227\131\159\227\130\182\227\130\164\227\129\140\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159")
  elseif A0_89 > 0 and A0_89 <= Fn_sendEventComSb("isMizBrokenCount") then
    Fn_sendEventComSb("hideDigEffect")
    Sound:playSE("mis013c_radio", 1, "")
    Fn_playMotionNpc(MIZ_ID, "angry_00", false)
    Fn_captionViewWait("sm01_01005")
    Fn_captionViewWait("sm01_01006")
    Fn_naviKill()
    L1_90 = true
    Fn_sendEventComSb("setAllMizOreBrokenHintCap")
    print("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\227\131\159\227\130\182\227\130\164\227\129\140\229\143\150\227\130\139\233\137\177\231\159\179\227\129\140\231\132\161\227\129\143\227\129\170\227\129\163\227\129\159")
  elseif Fn_sendEventComSb("getMizFallFlag") == true and Fn_sendEventComSb("getCatWarpPlaying") == false then
    L3_92 = true
    print("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\227\131\159\227\130\182\227\130\164\227\129\140\229\165\136\232\144\189\227\129\171\232\144\189\227\129\161\227\129\159")
  end
  if L2_91 == true or L3_92 == true then
    Fn_naviKill()
    if L2_91 == true then
      Fn_captionViewWait("sm01_09020")
    else
      Fn_captionViewWait("sm01_09021")
    end
    L1_90 = true
  end
  return L1_90, L2_91, L3_92
end
function createMizAppendAreaTask()
  return invokeTask(function()
    local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102, L10_103, L11_104, L12_105, L13_106
    L0_93 = Fn_findNpc
    L1_94 = MIZ_ID
    L0_93 = L0_93(L1_94)
    L1_94 = Fn_findNpcPuppet
    L2_95 = L0_93
    L1_94 = L1_94(L2_95)
    L2_95, L3_96 = nil, nil
    while true do
      L5_98 = L0_93
      L4_97 = L0_93.isGrabbed
      L4_97 = L4_97(L5_98)
      if L4_97 == false then
        L5_98 = L1_94
        L4_97 = L1_94.getWorldPos
        L4_97 = L4_97(L5_98)
        L6_99 = L0_93
        L5_98 = L0_93.findArea
        L7_100 = L4_97
        L5_98 = L5_98(L6_99, L7_100)
        L2_95 = L5_98
        L5_98 = wait
        L5_98()
        L5_98 = Fn_getDistanceToPlayer
        L6_99 = L1_94
        L5_98 = L5_98(L6_99)
        if L2_95 == nil and L5_98 < 50 then
          L7_100 = L0_93
          L6_99 = L0_93.findAreaCollidable
          L6_99 = L6_99(L7_100)
          L2_95 = L6_99
          L6_99 = wait
          L6_99()
        end
        if L2_95 == nil and L5_98 < 20 then
          L6_99 = Player
          L7_100 = L6_99
          L6_99 = L6_99.getRecentAreaName
          L6_99 = L6_99(L7_100)
          if L6_99 ~= nil then
            L7_100 = Fn_findAreaHandle
            L8_101 = L6_99
            L7_100 = L7_100(L8_101)
            L2_95 = L7_100
            L7_100 = wait
            L7_100()
          end
        end
        if L2_95 == nil then
          L6_99 = Fn_getActiveSubAreaTable
          L6_99 = L6_99()
          L7_100 = nil
          L8_101 = 0
          for L12_105, L13_106 in L9_102(L10_103) do
            if Fn_findAreaHandle(L13_106) ~= nil then
              if L7_100 == nil then
                L7_100, L8_101 = Fn_findAreaHandle(L13_106), Fn_get_distance(L4_97, Fn_findAreaHandle(L13_106):getWorldPos())
              elseif L8_101 > Fn_get_distance(L4_97, Fn_findAreaHandle(L13_106):getWorldPos()) then
                L7_100, L8_101 = Fn_findAreaHandle(L13_106), Fn_get_distance(L4_97, Fn_findAreaHandle(L13_106):getWorldPos())
              end
            end
          end
          L9_102()
        end
        if L2_95 ~= nil and L2_95 ~= L3_96 then
          L7_100 = L1_94
          L6_99 = L1_94.getWorldPos
          L6_99 = L6_99(L7_100)
          L8_101 = L2_95
          L7_100 = L2_95.appendChild
          L7_100(L8_101, L9_102)
          L8_101 = L0_93
          L7_100 = L0_93.setPos
          L12_105 = 0
          L13_106 = L9_102(L10_103, L11_104, L12_105)
          L7_100(L8_101, L9_102, L10_103, L11_104, L12_105, L13_106, L9_102(L10_103, L11_104, L12_105))
          L8_101 = L1_94
          L7_100 = L1_94.setWorldPos
          L7_100(L8_101, L9_102)
          L8_101 = L1_94
          L7_100 = L1_94.setForceMove
          L7_100(L8_101)
          L3_96 = L2_95
        end
        if L2_95 == nil then
          L6_99 = Fn_sendEventComSb
          L7_100 = "getCatWarpPlaying"
          L6_99 = L6_99(L7_100)
          if L6_99 == false then
            L6_99 = Fn_sendEventComSb
            L7_100 = "getMizFallFlag"
            L6_99 = L6_99(L7_100)
            if L6_99 == false then
              L6_99 = _cat_warp_miz_locate
              if L6_99 ~= nil then
                L6_99 = Fn_getDistanceToPlayer
                L7_100 = L1_94
                L6_99 = L6_99(L7_100)
                if L6_99 > 20 then
                  L6_99 = Fn_isInSightTarget
                  L7_100 = L1_94
                  L8_101 = 1
                  L6_99 = L6_99(L7_100, L8_101)
                  if L6_99 == false then
                    L6_99 = Fn_warpNpc
                    L7_100 = L0_93
                    L8_101 = _cat_warp_miz_locate
                    L6_99(L7_100, L8_101)
                  end
                end
              end
            end
          end
        end
      end
      L4_97 = waitSeconds
      L5_98 = 0.5
      L4_97(L5_98)
    end
  end)
end
