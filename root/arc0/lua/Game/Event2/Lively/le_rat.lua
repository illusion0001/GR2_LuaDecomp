import("HUD")
LeRat = {}
function LeRat.create()
  local L0_0
  L0_0 = {}
  L0_0.name = "rat"
  L0_0.evb = nil
  L0_0.rat = {}
  L0_0.sensor = ""
  L0_0.prefix = ""
  L0_0.task_update = nil
  L0_0.task_run = nil
  L0_0.task_escape = {}
  L0_0.is_update = false
  L0_0.is_escape = false
  LeRat._installMethods(L0_0)
  return L0_0
end
function LeRat.init(A0_1)
  local L1_2
end
function LeRat.setUpdateEvb(A0_3, A1_4)
  if not LeRat._isValid(A0_3) then
    return false
  end
  A0_3.is_update = A1_4
end
function LeRat.updateEvb(A0_5)
  if not LeRat._isValid(A0_5) then
    return false
  end
  if A0_5.task_update then
    A0_5:debugPrint("\227\129\153\227\129\167\227\129\171\227\131\141\227\130\186\227\131\159\227\130\146\233\133\141\231\189\174\227\129\149\227\129\155\227\130\139\227\129\159\227\130\129\227\129\174evb\227\130\146\228\189\156\230\136\144\227\129\153\227\130\139\227\130\191\227\130\185\227\130\175\227\129\175\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_5.task_update = invokeTask(function()
    local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
    L0_6, L1_7 = nil, nil
    while true do
      L2_8 = A0_5.is_update
      if L2_8 then
        L2_8 = Player
        L3_9 = L2_8
        L2_8 = L2_8.getRecentAreaName
        L2_8 = L2_8(L3_9)
        L0_6 = L2_8
        if L0_6 ~= nil and L0_6 ~= L1_7 then
          L2_8 = A0_5
          L3_9 = L2_8
          L2_8 = L2_8._findUpRoot
          L4_10 = Fn_findAreaHandle
          L5_11 = L0_6
          L6_12 = L4_10(L5_11)
          L2_8 = L2_8(L3_9, L4_10, L5_11, L6_12, L4_10(L5_11))
          L3_9 = A0_5
          L4_10 = L3_9
          L3_9 = L3_9._getAreaRootToEvbName
          L5_11 = L2_8
          L3_9 = L3_9(L4_10, L5_11)
          if L3_9 then
            L4_10 = nil
            L5_11 = A0_5.evb
            if L5_11 then
              L5_11 = A0_5.evb
              L6_12 = L5_11
              L5_11 = L5_11.getName
              L5_11 = L5_11(L6_12)
              L4_10 = L5_11
            end
            if L3_9 ~= L4_10 then
              L5_11 = A0_5
              L6_12 = L5_11
              L5_11 = L5_11.debugPrint
              L5_11(L6_12, "\228\189\156\230\136\144\227\129\153\227\130\139evb\227\129\175 " .. L3_9 .. " \227\129\167\227\129\153\227\128\130")
              L5_11 = A0_5
              L6_12 = L5_11
              L5_11 = L5_11._termGameObj
              L5_11 = L5_11(L6_12, A0_5.evb)
              A0_5.evb = L5_11
              L5_11 = loadFileAsset
              L6_12 = "evb"
              L5_11 = L5_11(L6_12, "evx/" .. L3_9)
              if L5_11 then
                L6_12 = L5_11.wait
                L6_12(L5_11)
                L6_12 = L5_11.getRoot
                L6_12 = L6_12(L5_11)
                if L6_12 then
                  EventData:create(L3_9, nil, L6_12):try_init()
                  EventData:create(L3_9, nil, L6_12):waitForReady()
                  EventData:create(L3_9, nil, L6_12):try_start()
                  A0_5.evb = EventData:create(L3_9, nil, L6_12)
                end
              end
            end
          else
            L4_10 = A0_5
            L5_11 = L4_10
            L4_10 = L4_10._termGameObj
            L6_12 = A0_5.evb
            L4_10 = L4_10(L5_11, L6_12)
            A0_5.evb = L4_10
          end
          L1_7 = L0_6
        end
      else
        L2_8 = A0_5
        L3_9 = L2_8
        L2_8 = L2_8._termGameObj
        L4_10 = A0_5.evb
        L2_8 = L2_8(L3_9, L4_10)
        A0_5.evb = L2_8
        L0_6, L1_7 = nil, nil
      end
      L2_8 = wait
      L3_9 = 15
      L2_8(L3_9)
    end
  end)
end
function LeRat.run(A0_13)
  if not LeRat._isValid(A0_13) then
    return false
  end
  if A0_13.task_run then
    A0_13:debugPrint("\227\129\153\227\129\167\227\129\171\227\131\141\227\130\186\227\131\159\227\129\175\229\139\149\227\129\132\227\129\166\227\129\132\227\129\190\227\129\153")
    return
  end
  A0_13.task_run = invokeTask(function()
    local L0_14, L1_15, L2_16, L3_17, L4_18
    for L3_17 = 1, 10 do
      L4_18 = A0_13.prefix
      L4_18 = L4_18 .. string.format("%02d", L3_17) .. "_start"
      if A0_13:_createRat(L3_17, L4_18) ~= nil then
      end
    end
    A0_13.is_escape = false
    for L3_17 = 1, #L1_15 do
      L4_18 = A0_13.task_escape
      L4_18[L3_17] = invokeTask(function()
        A0_13:_escape(L3_17, A0_13.rat[L3_17])
        A0_13.task_escape[L3_17] = nil
      end)
      break
    end
    A0_13.task_run = nil
  end)
end
function LeRat.terminate(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24
  if not L1_20 then
    return L1_20
  end
  for L4_23, L5_24 in L1_20(L2_21) do
    A0_19:_abortTask(L5_24)
  end
  A0_19.task_escape = L1_20
  for L4_23, L5_24 in L1_20(L2_21) do
    A0_19:_termGameObj(L5_24:getBrain())
    A0_19:_termGameObj(L5_24)
  end
  A0_19.rat = L1_20
end
function LeRat.kill(A0_25)
  if not LeRat._isValid(A0_25) then
    return false
  end
  A0_25.task_run = A0_25:_abortTask(A0_25.task_run)
  A0_25:terminate()
  A0_25.evb = A0_25:_termGameObj(A0_25.evb)
  A0_25:debugPrint("kill finish")
end
function LeRat.onEnter(A0_26, A1_27)
  local L2_28
  L2_28 = LeRat
  L2_28 = L2_28._isValid
  L2_28 = L2_28(A0_26)
  if not L2_28 then
    L2_28 = false
    return L2_28
  end
  L2_28 = A0_26.evb
  if L2_28 then
    L2_28 = A1_27.getName
    L2_28 = L2_28(A1_27)
    A0_26.prefix = "locator2" .. string.sub(L2_28, 22) .. "_"
    A0_26.sensor = L2_28
    A0_26:run()
    A0_26:debugPrint("start rat ...")
  end
end
function LeRat.onLeave(A0_29, A1_30)
  if not LeRat._isValid(A0_29) then
    return false
  end
  if A0_29.sensor == A1_30:getName() then
    A0_29.prefix = ""
    A0_29.sensor = ""
    A0_29.task_run = A0_29:_abortTask(A0_29.task_run)
    A0_29:terminate()
    A0_29:debugPrint("end rat ...")
  end
end
function LeRat._isValid(A0_31)
  local L1_32
  if A0_31 == nil then
    L1_32 = false
    return L1_32
  end
  L1_32 = true
  return L1_32
end
function LeRat._installMethods(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38
  for L4_37, L5_38 in L1_34(L2_35) do
    if type(L5_38) == "function" then
      A0_33[L4_37] = L5_38
    end
  end
end
function LeRat._termGameObj(A0_39, A1_40)
  if A1_40 then
    A0_39:debugPrint(A1_40:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_40:isRunning() then
      A1_40:try_term()
    else
      A1_40:kill()
    end
  end
  return nil
end
function LeRat._abortTask(A0_41, A1_42)
  if A1_42 and A1_42:isRunning() then
    A1_42:abort()
  end
  return nil
end
function LeRat._findUpRoot(A0_43, A1_44)
  local L2_45, L3_46
  if A1_44 then
    L3_46 = A1_44
    L2_45 = A1_44.getName
    L2_45 = L2_45(L3_46)
    L3_46 = A1_44
    while true do
      if string.match(L2_45, "root") then
        A0_43:debugPrint("root\227\129\175 " .. L2_45 .. " \227\129\167\227\129\153\227\128\130")
        break
      end
      L3_46 = L3_46:getParent()
      L2_45 = L3_46:getName()
    end
    return L2_45
  end
  L2_45 = nil
  return L2_45
end
function LeRat._getAreaRootToEvbName(A0_47, A1_48)
  local L2_49, L3_50
  L2_49 = nil
  L3_50 = GameDatabase
  L3_50 = L3_50.get
  L3_50 = L3_50(L3_50, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if string.match(L3_50, "dm") == nil then
    if A1_48 == "po_a_root" then
      L2_49 = "le18_po_a"
    elseif A1_48 == "mi_a_root" then
      L2_49 = "le18_mi_a"
    elseif A1_48 == "lo_a_root" then
      L2_49 = "le18_lo_a"
    elseif A1_48 == "up_a_root" then
      L2_49 = "le18_up_a"
    elseif A1_48 == "go_a_root" then
      L2_49 = "le18_go_a"
    elseif A1_48 == "de_a_root" then
      L2_49 = "le18_de_a"
    elseif A1_48 == "id_a_root" then
      L2_49 = "le18_id_a"
    elseif A1_48 == "dt_a_root" then
      L2_49 = "le18_dt_a"
    elseif A1_48 == "cc_a_root" then
      L2_49 = "le18_cc_a"
    elseif A1_48 == "bu_a_root" then
      L2_49 = "le18_bu_a"
    elseif A1_48 == "bu_d_root" then
      L2_49 = "le18_bu_b"
    elseif A1_48 == "ve_crane_root" and tonumber(string.match(L3_50, "%d+")) == 10 then
      L2_49 = "le18_go_a"
    end
  end
  return L2_49
end
function LeRat._createRat(A0_51, A1_52, A2_53)
  local L3_54, L4_55, L5_56
  L3_54 = findGameObject2
  L4_55 = "Node"
  L5_56 = A2_53
  L3_54 = L3_54(L4_55, L5_56)
  if L3_54 then
    L4_55 = createGameObject2
    L5_56 = "Puppet"
    L4_55 = L4_55(L5_56)
    L5_56 = createGameObject2
    L5_56 = L5_56("ActorBrain")
    table.insert(A0_51.rat, L4_55)
    L4_55:setName(string.format("LeRatPu_%02d", A1_52))
    L5_56:setName(string.format("LeRatBr_%02d", A1_52))
    L4_55:loadModel("rat01_base")
    L4_55:loadBaseSkeleton("rat01_base", "rat01_base")
    L4_55:waitForLoading()
    L4_55:loadPoseAnimation("stay", "rat01_stay_00")
    L4_55:loadPoseAnimation("run", "rat01_run_00")
    L4_55:waitForLoading()
    L4_55:try_init()
    L5_56:try_init()
    L4_55:waitForReady()
    L5_56:waitForReady()
    L4_55:setBrain(L5_56)
    L4_55:try_start()
    L5_56:try_start()
    L3_54:appendChild(L4_55)
    L4_55:setUseAnimLocomotion(true)
    L4_55:playPoseAnimation("stay")
    A0_51:debugPrint("create " .. L4_55:getName())
    return L4_55
  end
  L4_55 = nil
  return L4_55
end
function LeRat._escape(A0_57, A1_58, A2_59)
  local L3_60, L4_61, L5_62, L6_63, L7_64, L8_65
  L3_60 = findGameObject2
  L4_61 = "Node"
  L5_62 = A0_57.prefix
  L6_63 = string
  L6_63 = L6_63.format
  L7_64 = "%02d"
  L8_65 = A1_58
  L6_63 = L6_63(L7_64, L8_65)
  L7_64 = "_check01"
  L5_62 = L5_62 .. L6_63 .. L7_64
  L3_60 = L3_60(L4_61, L5_62)
  L4_61 = findGameObject2
  L5_62 = "Node"
  L6_63 = A0_57.prefix
  L7_64 = string
  L7_64 = L7_64.format
  L8_65 = "%02d"
  L7_64 = L7_64(L8_65, A1_58)
  L8_65 = "_check02"
  L6_63 = L6_63 .. L7_64 .. L8_65
  L4_61 = L4_61(L5_62, L6_63)
  L5_62 = nil
  L6_63 = 0
  L7_64 = RandI
  L8_65 = 15
  L7_64 = L7_64(L8_65, 30)
  L8_65 = RandI
  L8_65 = L8_65(0, 1)
  L8_65 = 3 + L8_65
  A0_57:debugPrint("escape " .. A2_59:getName() .. " start")
  if A0_57:_conditionsToEscape(L6_63, L7_64, L8_65, A2_59) or A0_57.is_escape then
    while L3_60 do
      L5_62 = L3_60
      if L4_61 and Fn_getDistanceToPlayer(L4_61) >= Fn_getDistanceToPlayer(L3_60) then
        L5_62 = L4_61
      end
      A2_59:playPoseAnimation("run")
      A2_59:setWorldRot(L5_62:getWorldRot())
      A0_57:debugPrint("escape_node " .. L5_62:getName())
      do break end
      L6_63 = L6_63 + 1
      wait()
    end
  end
  if A0_57.is_escape == false then
    A0_57.is_escape = true
  end
  if L5_62 then
    while not (Fn_get_distance(A2_59:getWorldPos(), L5_62:getWorldPos()) <= 0.3) do
      wait()
    end
  end
  A0_57:debugPrint("escape " .. A2_59:getName() .. " finish")
  for _FORV_12_ = 1, 10 do
    A2_59:setAlpha(1 - 1 / _FORV_12_)
  end
  A2_59:setActive(false)
end
function LeRat._conditionsToEscape(A0_66, A1_67, A2_68, A3_69, A4_70)
  if HUD:faderAlpha() > 0 then
    return false
  end
  if A3_69 >= Fn_getDistanceToPlayer(A4_70) then
    return true
  elseif Fn_isInSightTarget(A4_70, 0.8) and A1_67 >= A2_68 * 30 then
    return true
  end
  return false
end
function LeRat._setEscapeQuat(A0_71, A1_72, A2_73)
  local L3_74, L4_75, L5_76
  L4_75 = A1_72
  L3_74 = A1_72.getWorldPos
  L3_74 = L3_74(L4_75)
  L5_76 = A2_73
  L4_75 = A2_73.getWorldPos
  L4_75 = L4_75(L5_76)
  L5_76 = NormalizeVector
  L5_76 = L5_76(L4_75 - L3_74)
  L5_76.y = 0
  L5_76 = NormalizeVector(L5_76)
  A0_71:debugPrint("before " .. tostring(A1_72:getWorldRot()))
  A1_72:setWorldRot(YRotQuat(ArcTan2(L5_76.x, L5_76.z)))
  A1_72:setForceMove()
  A0_71:debugPrint("after  " .. tostring(A1_72:getWorldRot()))
end
function LeRat.debugPrint(A0_77, A1_78)
  print(" - le rat - " .. A1_78)
end
function LeRat.debugDisp(A0_79, A1_80, A2_81)
  local L3_82, L4_83
  L3_82 = 0 + A2_81
  function L4_83(A0_84)
    local L1_85
    L1_85 = A1_80
    L1_85 = L1_85 + 10
    if Debug:isDebugMenuOpen() then
      L1_85 = L1_85 + 200
    end
    Font:debugPrint(L1_85, 20 + 18 * L3_82, A0_84)
    L3_82 = L3_82 + 1
  end
  L4_83("- Rat -")
  L4_83("run    task  : " .. (A0_79.task_run ~= nil and "run" or "nil"))
  L4_83("update task  : " .. (A0_79.task_update ~= nil and "run" or "nil"))
  L4_83("is_update    : " .. tostring(A0_79.is_update))
  L4_83("is_escape    : " .. tostring(A0_79.is_escape))
  L4_83("sensor       : " .. tostring(A0_79.sensor))
  L4_83("prefix       : " .. tostring(A0_79.prefix))
  for _FORV_8_, _FORV_9_ in ipairs(A0_79.rat) do
    L4_83(_FORV_9_:getName() .. " : escape " .. (A0_79.task_escape[_FORV_8_] ~= nil and "run" or "nil"))
  end
  return L3_82 - A2_81
end
function pccubesensor2_set_rat_OnEnter(A0_86)
  if _le_rat then
    _le_rat:onEnter(A0_86)
  end
end
function pccubesensor2_set_rat_OnLeave(A0_87)
  if _le_rat then
    _le_rat:onLeave(A0_87)
  end
end
