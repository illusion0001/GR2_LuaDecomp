local L1_1
L0_0 = {}
LeRainbow = L0_0
L0_0 = LeRainbow
function L1_1()
  local L0_2
  L0_2 = {}
  L0_2.name = "rainbow"
  L0_2.task_run = nil
  L0_2.task_timer = nil
  L0_2.eff = nil
  L0_2.rate = 0.008333333333333333
  L0_2.scale = Vector(1.7, 1.7, 1)
  L0_2.time = 0
  LeRainbow._installMethods(L0_2)
  return L0_2
end
L0_0.create = L1_1
L0_0 = LeRainbow
function L1_1(A0_3)
  local L1_4
end
L0_0.init = L1_1
L0_0 = LeRainbow
function L1_1(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10)
  if A0_5.task_run then
    A0_5:debugPrint("\227\129\153\227\129\167\227\129\171\232\153\185\227\129\175\231\153\186\231\148\159\227\129\149\227\129\155\227\129\166\227\129\132\227\129\190\227\129\153")
    return
  end
  if A0_5:_exclusionArea() then
    A0_5:debugPrint("\231\153\186\231\148\159\227\129\167\227\129\141\227\129\170\227\129\132\227\130\168\227\131\170\227\130\162\227\129\171\227\129\132\227\129\190\227\129\153")
    return
  end
  A0_5.task_run = invokeTask(function()
    local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
    L0_11 = A0_5
    L1_12 = L0_11
    L0_11 = L0_11.debugPrint
    L2_13 = "\232\153\185\227\130\146\231\153\186\231\148\159\227\129\149\227\129\155\227\129\190\227\129\153"
    L0_11(L1_12, L2_13)
    L0_11 = 1
    L1_12 = 2
    L2_13 = 3
    L3_14 = Fn_getPlayer
    L3_14 = L3_14()
    L4_15 = L0_11
    L6_17 = L3_14
    L5_16 = L3_14.getWorldPos
    L5_16 = L5_16(L6_17)
    L6_17 = L5_16
    L7_18 = A0_5
    L8_19 = L7_18
    L7_18 = L7_18._getInitialTransform
    L9_20 = A3_8
    L8_19 = L7_18(L8_19, L9_20, L5_16)
    L9_20 = A0_5
    L9_20 = L9_20._createEff
    L9_20(L9_20, "rainbow01", "ef_ev_rbw_01m", L7_18, L8_19, A0_5.scale)
    L9_20 = A0_5.eff
    if L9_20 then
      L9_20 = A0_5
      L9_20 = L9_20.debugPrint
      L9_20(L9_20, "\232\153\185\227\129\174\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\227\129\174\230\186\150\229\130\153\227\129\140\227\129\167\227\129\141\227\129\159\227\129\174\227\129\167\227\128\129\232\161\168\231\164\186\229\135\166\231\144\134\227\130\146\229\174\159\232\161\140\227\129\151\227\129\190\227\129\153")
      while true do
        L9_20 = A0_5
        L9_20 = L9_20._exclusionArea
        L9_20 = L9_20(L9_20)
        if L9_20 then
          L9_20 = A0_5
          L9_20 = L9_20.debugPrint
          L9_20(L9_20, "\231\153\186\231\148\159\227\129\167\227\129\141\227\129\170\227\129\132\227\130\168\227\131\170\227\130\162\227\129\171\231\167\187\229\139\149\227\129\151\227\129\159\227\129\174\227\129\167\227\128\129\231\181\130\228\186\134\227\129\171\233\129\183\231\167\187\227\129\151\227\129\190\227\129\153")
          L4_15 = L2_13
        end
        if L4_15 == L0_11 then
          L9_20 = A0_5.eff
          L9_20 = L9_20.getAlpha
          L9_20 = L9_20(L9_20)
          L9_20 = L9_20 + A0_5.rate
          if L9_20 >= 1 then
            L9_20 = 1
          end
          A0_5.eff:setAlpha(L9_20)
          if L9_20 >= 1 then
            A0_5:debugPrint("\232\153\185\227\130\146\227\131\171\227\131\188\227\131\151\227\129\171\233\129\183\231\167\187\227\129\151\227\129\190\227\129\153")
            L4_15 = L1_12
            A0_5.time = 18000
            A0_5:_setCountTime()
          end
        elseif L4_15 == L1_12 then
          L9_20 = A0_5.time
          if L9_20 == 0 then
            L9_20 = A0_5
            L9_20 = L9_20.debugPrint
            L9_20(L9_20, "\232\153\185\227\130\146\227\130\168\227\131\179\227\131\137\227\129\171\233\129\183\231\167\187\227\129\151\227\129\190\227\129\153")
            L4_15 = L2_13
          end
        elseif L4_15 == L2_13 then
          L9_20 = A0_5.eff
          L9_20 = L9_20.getAlpha
          L9_20 = L9_20(L9_20)
          L9_20 = L9_20 - A0_5.rate
          if L9_20 <= 0 then
            L9_20 = 0
          end
          A0_5.eff:setAlpha(L9_20)
          if L9_20 <= 0 then
            A0_5:debugPrint("\227\131\171\227\131\188\227\131\151\229\135\166\231\144\134\227\130\146\230\138\156\227\129\145\227\129\166\229\190\140\229\135\166\231\144\134\227\130\146\229\174\159\232\161\140\227\129\151\227\129\190\227\129\153")
            break
          end
        else
          L9_20 = A0_5
          L9_20 = L9_20.debugPrint
          L9_20(L9_20, "\229\128\164\227\129\140\228\184\141\229\174\154\227\129\170\227\129\174\227\129\167\227\128\129\232\153\185\227\129\174\227\130\168\227\131\179\227\131\137\229\135\166\231\144\134\227\129\171\233\129\183\231\167\187\227\129\151\227\129\190\227\129\153")
          L4_15 = L2_13
        end
        L9_20 = L3_14.getWorldPos
        L9_20 = L9_20(L3_14)
        L5_16 = L9_20
        L9_20 = A0_5
        L9_20 = L9_20._updateRainbowPos
        L9_20(L9_20, L6_17, L5_16)
        L6_17 = L5_16
        L9_20 = wait
        L9_20()
      end
    end
    L9_20 = A0_5
    L9_20 = L9_20._termGameObj
    L9_20 = L9_20(L9_20, A0_5.eff)
    A0_5.eff = L9_20
    A0_5.task_run = nil
    L9_20 = A0_5
    L9_20 = L9_20.debugPrint
    L9_20(L9_20, "\232\153\185\227\129\175\231\181\130\228\186\134\227\129\151\227\129\190\227\129\151\227\129\159")
  end)
end
L0_0.run = L1_1
L0_0 = LeRainbow
function L1_1(A0_21)
  A0_21.task_run = A0_21:_abortTask(A0_21.task_run)
  A0_21.task_timer = A0_21:_abortTask(A0_21.task_timer)
  A0_21.time = 0
  A0_21.eff = A0_21:_termGameObj(A0_21.eff)
end
L0_0.kill = L1_1
L0_0 = LeRainbow
function L1_1(A0_22)
  local L1_23
  if A0_22 == nil then
    L1_23 = false
    return L1_23
  end
  L1_23 = true
  return L1_23
end
L0_0._isValid = L1_1
L0_0 = LeRainbow
function L1_1(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  for L4_28, L5_29 in L1_25(L2_26) do
    if type(L5_29) == "function" then
      A0_24[L4_28] = L5_29
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = LeRainbow
function L1_1(A0_30, A1_31)
  if A1_31 then
    A0_30:debugPrint(A1_31:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_31:isRunning() then
      A1_31:try_term()
    else
      A1_31:kill()
    end
  end
  return nil
end
L0_0._termGameObj = L1_1
L0_0 = LeRainbow
function L1_1(A0_32, A1_33)
  if A1_33 and A1_33:isRunning() then
    A1_33:abort()
  end
  return nil
end
L0_0._abortTask = L1_1
L0_0 = LeRainbow
function L1_1(A0_34)
  if A0_34.task_timer then
    A0_34:debugPrint("\227\129\153\227\129\167\227\129\171\232\153\185\227\129\174\227\130\191\227\130\164\227\131\158\227\131\188\227\129\175\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_34.task_timer = invokeTask(function()
    A0_34:debugPrint("\232\153\185\227\129\174\227\130\191\227\130\164\227\131\158\227\131\188\232\181\183\229\139\149")
    while true do
      A0_34.time = A0_34.time - 1
      if A0_34.time < 0 then
        A0_34.time = 0
      end
      wait()
    end
    A0_34:debugPrint("\232\153\185\227\129\174\227\130\191\227\130\164\227\131\158\227\131\188\231\181\130\228\186\134")
  end)
end
L0_0._setCountTime = L1_1
L0_0 = LeRainbow
function L1_1(A0_35, A1_36, A2_37, A3_38, A4_39, A5_40)
  A0_35.eff = createGameObject2("Effect")
  A0_35.eff:setName(A1_36)
  A0_35.eff:setModelName(A2_37)
  A0_35.eff:setWorldTransform(A3_38, A4_39)
  A0_35.eff:try_init()
  A0_35.eff:waitForReady()
  A0_35.eff:play()
  A0_35.eff:setLoop(true)
  A0_35.eff:setScale(A5_40)
  A0_35.eff:setAlpha(0)
  A0_35.eff:try_start()
end
L0_0._createEff = L1_1
L0_0 = LeRainbow
function L1_1(A0_41)
  if GameDatabase:get(ggd.Menu__MapName, new_city) == "go" or GameDatabase:get(ggd.Menu__MapName, new_city) == "lo" or GameDatabase:get(ggd.Menu__MapName, new_city) == "ed" then
    return true
  end
  return false
end
L0_0._exclusionArea = L1_1
L0_0 = LeRainbow
function L1_1(A0_42, A1_43, A2_44)
  local L3_45, L4_46, L5_47, L6_48, L7_49
  L4_46 = A0_42
  L3_45 = A0_42._getCorrectionParam
  L5_47 = A1_43
  L5_47 = L3_45(L4_46, L5_47)
  L7_49 = A0_42
  L6_48 = A0_42._correctionCalculate
  L6_48 = L6_48(L7_49, L3_45, L4_46, L5_47)
  L6_48 = A2_44 + L6_48
  L7_49 = XYZRotQuatD
  L7_49 = L7_49(0, -90 - L5_47, 0)
  return L6_48, L7_49
end
L0_0._getInitialTransform = L1_1
L0_0 = LeRainbow
function L1_1(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55, L6_56, L7_57
  L2_52 = 1500
  L3_53 = 10
  L4_54 = 90
  L5_55 = L2_52
  L6_56 = L3_53
  L7_57 = L4_54
  return L5_55, L6_56, L7_57
end
L0_0._getCorrectionParam = L1_1
L0_0 = LeRainbow
function L1_1(A0_58, A1_59, A2_60, A3_61)
  Vector(0, 0, 0).x = A1_59 * Cos(A3_61 * 3.1415926535 / 180)
  Vector(0, 0, 0).y = A1_59 * Tan(A2_60 * 3.1415926535 / 180)
  Vector(0, 0, 0).z = A1_59 * Sin(A3_61 * 3.1415926535 / 180)
  return (Vector(0, 0, 0))
end
L0_0._correctionCalculate = L1_1
L0_0 = LeRainbow
function L1_1(A0_62, A1_63, A2_64)
  local L3_65
  L3_65 = A0_62.eff
  L3_65 = L3_65.getWorldPos
  L3_65 = L3_65(L3_65)
  L3_65 = L3_65 + (A1_63 - A2_64) * -1
  A0_62.eff:setWorldPos(L3_65)
  A0_62.eff:setForceMove()
end
L0_0._updateRainbowPos = L1_1
L0_0 = LeRainbow
function L1_1(A0_66, A1_67)
  print(" - le rainbow - " .. A1_67)
end
L0_0.debugPrint = L1_1
L0_0 = LeRainbow
function L1_1(A0_68, A1_69, A2_70)
  local L3_71, L4_72
  L3_71 = A2_70
  function L4_72(A0_73)
    local L1_74
    L1_74 = A1_69
    L1_74 = L1_74 + 10
    if Debug:isDebugMenuOpen() then
      L1_74 = L1_74 + 200
    end
    Font:debugPrint(L1_74, 20 + 18 * L3_71, A0_73)
    L3_71 = L3_71 + 1
  end
  L4_72("- rainbow -")
  L4_72("run   task     : " .. (A0_68.task_run ~= nil and "run" or "nil"))
  L4_72("timer task     : " .. (A0_68.task_timer ~= nil and "run" or "nil"))
  L4_72("remaining time : " .. tostring(A0_68.time))
  L4_72("alpha          : " .. (A0_68.eff ~= nil and A0_68.eff:getAlpha() or "nil"))
  return L3_71 - A2_70
end
L0_0.debugDisp = L1_1
