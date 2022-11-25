import("DebugDraw")
import("HUD")
import("Mob")
import("PhotoMgr")
kPHOTO_OK = 0
kPHOTO_NEAR = 1
kPHOTO_FAR = 2
kPHOTO_ANGLE = 3
kPHOTO_OUT = 4
kPHOTO_BACK = 5
kPHOTO_NO_TERGET = -1
kPHOTO_TYPE_ONCE = 0
kPHOTO_TYPE_ANY = 1
kPHOTO_TYPE_ALL = 2
kPHOTO_CAPTION_ON = true
kPHOTO_CAPTION_OFF = false
Photo = {}
function Photo.create(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
-- fail 11
null
8
-- fail 19
null
8
  local L6_6, L7_7
  L6_6 = true
  if A0_0 == false then
    L6_6 = false
  end
  L7_7 = {}
  L7_7.caption = L6_6
  L7_7.dist = {near = 3.5, far = 13}
  L7_7.ratio = {
    left = -0.5,
    right = 0.5,
    top = -0.5,
    bottom = 0.5
  }
  L7_7.target = {}
  L7_7.frame_in = {}
  L7_7.state = kPHOTO_NO_TERGET
  L7_7.type = A1_1 or kPHOTO_TYPE_ONCE
  L7_7.finish = false
  L7_7.main_task = nil
  L7_7.photo_mode = A2_2 or false
  L7_7.cap_task = nil
  L7_7.debug_task = nil
  L7_7.raycast = {}
  L7_7.save_name = A5_5
  L7_7.mob_tacking = nil
  Photo._installMethods(L7_7)
  return L7_7
end
function Photo.set(A0_8, A1_9, A2_10)
  local L3_11
  L3_11 = Photo
  L3_11 = L3_11._isValid
  L3_11 = L3_11(A0_8)
  if not L3_11 then
    L3_11 = false
    return L3_11
  end
  L3_11 = A1_9
  if type(L3_11) == "string" then
    L3_11 = findGameObject2("Node", L3_11)
  end
  if L3_11 == nil and type(A1_9) == "string" then
    print(A1_9 .. "\227\129\175\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
    return false
  end
  if A2_10 then
    L3_11 = {node = L3_11, joint = A2_10}
  end
  table.insert(A0_8.target, L3_11)
  return true
end
function Photo.reset(A0_12)
  if not Photo._isValid(A0_12) then
    return false
  end
  A0_12.target = {}
end
function Photo.param(A0_13, A1_14, A2_15, A3_16)
-- fail 13
null
4
-- fail 21
null
4
  if not Photo._isValid(A0_13) then
    return false
  end
  A0_13.dist = {near = 3.5, far = 13}
  A0_13.ratio = {
    left = -0.5,
    right = 0.5,
    top = -0.5,
    bottom = 0.5
  }
  A0_13.caption = A3_16
end
function Photo.run(A0_17)
  if not Photo._isValid(A0_17) then
    return false
  end
  if not A0_17.main_task then
    A0_17:_debug(true)
    A0_17.finish = false
    A0_17.main_task = invokeTask(function()
      A0_17:_caption(true)
      HUD:menuSetCallback(HUD.kCallback_JustShutterEvent, function()
        A0_17:_photoJustShutterCallback()
      end)
      HUD:menuSetCallback(HUD.kCallback_ShutterEvent, function(A0_18)
        A0_17:_photoCallback(A0_18)
      end)
      while not A0_17.finish do
        if 0 > 90 then
          PhotoMgr:DeleteAllItem()
        end
        wait()
      end
      HUD:menuSetCallback(HUD.kCallback_JustShutterEvent)
      HUD:menuSetCallback(HUD.kCallback_ShutterEvent)
      if A0_17.photo_mode == false then
        HUD:setPhotoMode(false)
      end
      A0_17:_caption(false)
      wait()
      A0_17.main_task = nil
      A0_17:_debug(false)
    end)
  end
end
function Photo.isRunning(A0_19)
  if not Photo._isValid(A0_19) then
    return false
  end
  if A0_19.main_task and A0_19.main_task:isRunning() then
    return true
  end
  return false
end
function Photo.getPhotoState(A0_20)
  if not Photo._isValid(A0_20) then
    return false
  end
  if A0_20.finish then
    if A0_20.type == kPHOTO_TYPE_ONCE then
      return A0_20.state
    end
    return #A0_20.frame_in ~= 0 and A0_20.frame_in or A0_20.state
  end
  return nil
end
function Photo.resetCaption(A0_21)
  if not Photo._isValid(A0_21) then
    return false
  end
  if A0_21.caption then
    A0_21:_caption(false)
    wait()
    A0_21:_caption(true)
  end
end
function Photo.coercionCaption(A0_22, A1_23)
  if not Photo._isValid(A0_22) then
    return false
  end
  if A0_22.main_task and A0_22.main_task:isRunning() then
    A0_22.caption = true
    A0_22:_caption(A1_23)
    A0_22.caption = A1_23
  end
end
function Photo.kill(A0_24)
  if not Photo._isValid(A0_24) then
    return false
  end
  HUD:menuSetCallback(HUD.kCallback_JustShutterEvent)
  HUD:menuSetCallback(HUD.kCallback_ShutterEvent)
  HUD:setPhotoMode(false)
  A0_24:_caption(false)
  if A0_24.main_task and A0_24.main_task:isRunning() then
    A0_24.main_task:abort()
    A0_24.main_task = nil
  end
  if A0_24.mob_tacking and A0_24.mob_tacking:isRunning() then
    A0_24.mob_tacking:abort()
    A0_24.mob_tacking = nil
    A0_24.target = {}
  end
  A0_24:_debug(false)
end
function Photo.trakingMob(A0_25, A1_26)
  if not Photo._isValid(A0_25) then
    return false
  end
  if not A0_25.mob_tacking then
    A0_25.mob_tacking = invokeTask(function()
      local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34
      while true do
        L0_27 = {}
        A0_25.target = L0_27
        L0_27 = HUD
        L0_27 = L0_27.isPhotoMode
        L0_27 = L0_27(L1_28)
        if L0_27 then
          L0_27 = Mob
          L0_27 = L0_27.getPhotablePawnSetArrayInCamera
          L0_27 = L0_27(L1_28)
          for L4_31, L5_32 in L1_28(L2_29) do
            L6_33 = A0_25
            L7_34 = L6_33
            L6_33 = L6_33.set
            L6_33(L7_34, L5_32[2], A1_26)
            L6_33 = table
            L6_33 = L6_33.unpack
            L7_34 = L5_32
            L7_34 = L6_33(L7_34)
            print("pset", i, L6_33, L7_34)
          end
        end
        L0_27 = wait
        L0_27(L1_28)
      end
    end)
  end
end
function Photo._caption(A0_35, A1_36)
  if not A0_35.caption then
    return false
  end
  if A1_36 then
    A0_35.cap_task = invokeTask(function()
      while HUD:captionGetTextId() ~= nil do
        wait()
      end
      Fn_captionView("ic_camera_00100", 0)
      A0_35.cap_task = nil
    end)
  else
    if A0_35.cap_task and A0_35.cap_task:isRunning() then
      A0_35.cap_task:abort()
      A0_35.cap_task = nil
      wait()
    end
    if HUD:captionGetTextId() == "ic_camera_00100" then
      Fn_captionViewEnd()
    end
  end
end
function Photo._isFrameIn(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48
  L1_38 = {}
  A0_37.frame_in = L1_38
  L1_38 = {}
  A0_37.raycast = L1_38
  L1_38 = false
  L2_39 = Camera
  L2_39 = L2_39.getEyePos
  L2_39 = L2_39(L3_40)
  L6_43 = Quat
  L7_44 = 0
  L8_45 = 0
  L9_46 = 0
  L10_47 = 1
  L11_48 = L6_43(L7_44, L8_45, L9_46, L10_47)
  L3_40(L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48, L6_43(L7_44, L8_45, L9_46, L10_47))
  L6_43 = 120
  L11_48 = L5_42(L6_43)
  L3_40(L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47, L11_48, L5_42(L6_43))
  L3_40(L4_41, L5_42)
  for L6_43, L7_44 in L3_40(L4_41) do
    L8_45 = L7_44
    L9_46 = nil
    L10_47 = type
    L11_48 = L7_44
    L10_47 = L10_47(L11_48)
    if L10_47 == "table" then
      L8_45 = L7_44.node
      L11_48 = L8_45
      L10_47 = L8_45.getTypeName
      L10_47 = L10_47(L11_48)
      if L10_47 == "Puppet" then
        L11_48 = L8_45
        L10_47 = L8_45.getJointWorldTransform
        L10_47 = L10_47(L11_48, L7_44.joint)
        L9_46 = L10_47
      else
        L11_48 = L8_45
        L10_47 = L8_45.getWorldPos
        L10_47 = L10_47(L11_48)
        L9_46 = L10_47
      end
    else
      L11_48 = L8_45
      L10_47 = L8_45.getWorldPos
      L10_47 = L10_47(L11_48)
      L9_46 = L10_47
      L11_48 = L8_45
      L10_47 = L8_45.getTypeName
      L10_47 = L10_47(L11_48)
      if L10_47 == "Puppet" then
        L10_47 = L9_46.y
        L10_47 = L10_47 + 1.5
        L9_46.y = L10_47
      end
    end
    L10_47 = HUD
    L11_48 = L10_47
    L10_47 = L10_47.isPhotoFrameIn
    L10_47 = L10_47(L11_48, L9_46)
    if L10_47 then
      L10_47 = Query
      L11_48 = L10_47
      L10_47 = L10_47.raycastEyeSight
      L10_47 = L10_47(L11_48, L9_46)
      L11_48 = table
      L11_48 = L11_48.insert
      L11_48(A0_37.raycast, {
        target = L8_45,
        hit = L10_47,
        s_pos = L2_39,
        t_pos = L9_46
      })
      if not L10_47 then
        L11_48 = {}
        L11_48.target = L8_45
        L11_48.state = kPHOTO_OK
        L11_48.dist = 0
        L11_48.ratio = {x = 0, y = 0}
        table.insert(A0_37.frame_in, L11_48)
        L1_38 = true
        if A0_37.type == kPHOTO_TYPE_ONCE then
          A0_37.state = kPHOTO_OK
          break
        end
      else
        L11_48 = A0_37.type
        if L11_48 == kPHOTO_TYPE_ONCE then
          L11_48 = kPHOTO_OUT
          A0_37.state = L11_48
          break
        end
        L11_48 = A0_37.type
        if L11_48 == kPHOTO_TYPE_ALL then
          L11_48 = kPHOTO_OUT
          A0_37.state = L11_48
          L11_48 = {}
          A0_37.frame_in = L11_48
          L1_38 = false
          break
        end
      end
    else
      L10_47 = A0_37.type
      L11_48 = kPHOTO_TYPE_ONCE
      if L10_47 == L11_48 then
        L10_47 = kPHOTO_OUT
        A0_37.state = L10_47
        break
      end
      L10_47 = A0_37.type
      L11_48 = kPHOTO_TYPE_ALL
      if L10_47 == L11_48 then
        L10_47 = kPHOTO_OUT
        A0_37.state = L10_47
        L10_47 = {}
        A0_37.frame_in = L10_47
        L1_38 = false
        break
      end
    end
  end
  return L1_38
end
function Photo._isJudge(A0_49)
  for _FORV_4_, _FORV_5_ in pairs(A0_49.frame_in) do
    _FORV_5_.dist = (Camera:getEyePos() - _FORV_5_.target:getWorldPos()):Length() / HUD:getPhotoZoomRate()
    if Query:calcInSightAngleRatioGameObject(_FORV_5_.target) ~= nil then
      _FORV_5_.ratio = Query:calcInSightAngleRatioGameObject(_FORV_5_.target)
      if Query:calcInSightAngleRatioGameObject(_FORV_5_.target).x < A0_49.ratio.left or Query:calcInSightAngleRatioGameObject(_FORV_5_.target).x > A0_49.ratio.right or Query:calcInSightAngleRatioGameObject(_FORV_5_.target).y < A0_49.ratio.top or Query:calcInSightAngleRatioGameObject(_FORV_5_.target).y > A0_49.ratio.bottom then
        A0_49.state = kPHOTO_ANGLE
        _FORV_5_.state = kPHOTO_ANGLE
      end
      if (Camera:getEyePos() - _FORV_5_.target:getWorldPos()):Length() / HUD:getPhotoZoomRate() < A0_49.dist.near then
        A0_49.state = kPHOTO_NEAR
        _FORV_5_.state = kPHOTO_NEAR
      elseif (Camera:getEyePos() - _FORV_5_.target:getWorldPos()):Length() / HUD:getPhotoZoomRate() > A0_49.dist.far then
        A0_49.state = kPHOTO_FAR
        _FORV_5_.state = kPHOTO_FAR
      end
    else
      A0_49.state = kPHOTO_BACK
      _FORV_5_.state = kPHOTO_BACK
    end
  end
end
function Photo._photoJustShutterCallback(A0_50)
  if A0_50:_isFrameIn() then
    A0_50:_isJudge()
  end
end
function Photo._photoCallback(A0_51, A1_52)
  if A0_51.save_name then
    HUD:setMissionPhoto(A0_51.save_name)
  end
  if A1_52 == false then
    A0_51.state = nil
  end
  A0_51.finish = true
end
function Photo._isValid(A0_53)
  local L1_54
  if A0_53 == nil then
    L1_54 = false
    return L1_54
  end
  L1_54 = true
  return L1_54
end
function Photo._installMethods(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60
  for L4_59, L5_60 in L1_56(L2_57) do
    if type(L5_60) == "function" then
      A0_55[L4_59] = L5_60
    end
  end
end
function Photo._debug(A0_61, A1_62)
  if A1_62 then
    if not A0_61.debug_task then
      A0_61.debug_task = invokeTask(function()
        local L0_63, L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70
        while true do
          L0_63 = Debug
          L1_64 = L0_63
          L0_63 = L0_63.getSwitch
          L5_68 = "ScriptDebugDraw"
          L0_63 = L0_63(L1_64, L2_65)
          if L0_63 then
            L0_63 = "OK"
            L1_64 = A0_61.state
            if L1_64 == L2_65 then
              L0_63 = "OK"
            else
              L1_64 = A0_61.state
              if L1_64 == L2_65 then
                L0_63 = "near"
              else
                L1_64 = A0_61.state
                if L1_64 == L2_65 then
                  L0_63 = "far"
                else
                  L1_64 = A0_61.state
                  if L1_64 == L2_65 then
                    L0_63 = "angle over"
                  else
                    L1_64 = A0_61.state
                    if L1_64 == L2_65 then
                      L0_63 = "out"
                    else
                      L1_64 = A0_61.state
                      if L1_64 == L2_65 then
                        L0_63 = "back or side"
                      else
                        L0_63 = "no target"
                      end
                    end
                  end
                end
              end
            end
            L1_64 = Font
            L1_64 = L1_64.debugPrint
            L5_68 = "result : "
            L6_69 = L0_63
            L7_70 = " caption_id : "
            L5_68 = L5_68 .. L6_69 .. L7_70 .. tostring(HUD:captionGetTextId())
            L1_64(L2_65, L3_66, L4_67, L5_68)
            L1_64 = 1
            for L5_68, L6_69 in L2_65(L3_66) do
              L7_70 = Font
              L7_70 = L7_70.debugPrint
              L7_70(L7_70, 250, 60 + L1_64 * 20, "name   : " .. tostring(L6_69.target:getName()))
              L1_64 = L1_64 + 1
              L7_70 = Font
              L7_70 = L7_70.debugPrint
              L7_70(L7_70, 280, 60 + L1_64 * 20, "x : " .. L6_69.ratio.x .. " y : " .. L6_69.ratio.y)
              L1_64 = L1_64 + 1
              L7_70 = Font
              L7_70 = L7_70.debugPrint
              L7_70(L7_70, 280, 60 + L1_64 * 20, "dist   : " .. L6_69.dist)
              L1_64 = L1_64 + 1
              L7_70 = "OK"
              if L6_69.state == kPHOTO_OK then
                L7_70 = "OK"
              elseif L6_69.state == kPHOTO_NEAR then
                L7_70 = "near"
              elseif L6_69.state == kPHOTO_FAR then
                L7_70 = "far"
              elseif L6_69.state == kPHOTO_ANGLE then
                L7_70 = "angle over"
              elseif L6_69.state == kPHOTO_OUT then
                L7_70 = "out"
              elseif L6_69.state == kPHOTO_BACK then
                L7_70 = "back or side"
              else
                L7_70 = "no target"
              end
              Font:debugPrint(280, 60 + L1_64 * 20, "result : " .. L7_70)
              L1_64 = L1_64 + 1
            end
            for L5_68, L6_69 in L2_65(L3_66) do
              L7_70 = DebugDraw
              L7_70 = L7_70.setTransform
              L7_70(L7_70)
              L7_70 = DebugDraw
              L7_70 = L7_70.drawString3D
              L7_70(L7_70, L6_69.target:getName())
              L7_70 = L6_69.hit
              if not L7_70 then
                L7_70 = DebugDraw
                L7_70 = L7_70.setColor
                L7_70(L7_70, 0, 1, 0)
              else
                L7_70 = DebugDraw
                L7_70 = L7_70.setColor
                L7_70(L7_70, 1, 0, 0)
              end
              L7_70 = DebugDraw
              L7_70 = L7_70.drawLines
              L7_70(L7_70, {
                L6_69.s_pos,
                L6_69.t_pos
              })
            end
          end
          L0_63 = wait
          L0_63()
        end
      end)
    end
  elseif A0_61.debug_task and A0_61.debug_task:isRunning() then
    A0_61.debug_task:abort()
    A0_61.debug_task = nil
  end
end
