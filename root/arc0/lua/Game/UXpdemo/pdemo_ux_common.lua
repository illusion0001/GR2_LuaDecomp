import("Debug")
import("GameScene")
import("math")
Debug:setSwitch({"Display"}, false)
Debug:setSwitch({
  "Display",
  "Screen Console"
}, true)
effect_table = {
  [0] = "gp_m_yukakem_d",
  [2] = {
    "gp_m_yukakem_c",
    "gp_m_yukakem_e"
  }
}
effect_objs = {}
effect_playing_cut = -1
function createEffect(A0_0)
  createGameObject2("Effect"):setName(A0_0)
  createGameObject2("Effect"):setModelName(A0_0)
  createGameObject2("Effect"):setFirstFrame(0)
  return (createGameObject2("Effect"))
end
function initializeAllCutEffects()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  for L3_4, L4_5 in L0_1(L1_2) do
    if L5_6 == "table" then
      L5_6[L3_4] = L6_7
      for L8_9, L9_10 in L5_6(L6_7) do
        effect_objs[L3_4][L8_9] = createEffect(L9_10)
      end
    else
      L5_6[L3_4] = L6_7
    end
  end
end
function playCutEffects(A0_11)
  if effect_playing_cut ~= A0_11 then
    if effect_objs[A0_11] ~= nil then
      if type(effect_objs[A0_11]) == "table" then
        for _FORV_4_, _FORV_5_ in pairs(effect_objs[A0_11]) do
          _FORV_5_:play()
        end
      else
        effect_objs[A0_11]:play()
      end
    end
    effect_playing_cut = A0_11
  end
end
function resetCutEffects()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21
  effect_playing_cut = -1
  for L3_15, L4_16 in L0_12(L1_13) do
    if L5_17 == "table" then
      for L8_20, L9_21 in L5_17(L6_18) do
        effect_objs[L3_15][L8_20]:try_term()
        effect_objs[L3_15][L8_20] = createEffect(L9_21)
      end
    else
      L5_17(L6_18)
      L5_17[L3_15] = L6_18
    end
  end
  L0_12()
  L0_12()
  L0_12()
end
function moveobj_line(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27)
  return invokeTask(function()
    local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37
    L0_28 = A0_22
    L1_29 = L0_28
    L0_28 = L0_28.getPos
    L0_28 = L0_28(L1_29)
    L1_29 = L0_28.x
    L2_30 = L0_28.y
    L3_31 = L0_28.z
    L4_32, L5_33, L6_34 = nil, nil, nil
    L7_35 = L1_29
    L8_36 = L2_30
    L9_37 = L3_31
    for _FORV_13_ = 1, A4_26 do
      if A5_27 then
        if L1_29 ~= A1_23 then
          L4_32 = L1_29 + (A1_23 - L1_29) * ((Sin(-1.57 + 3.14 / A4_26 * _FORV_13_) + 1) / 2)
        else
          L4_32 = L1_29
        end
        if L2_30 ~= A2_24 then
          L5_33 = L2_30 + (A2_24 - L2_30) * ((Sin(-1.57 + 3.14 / A4_26 * _FORV_13_) + 1) / 2)
        else
          L5_33 = L2_30
        end
        if L3_31 ~= A3_25 then
          L6_34 = L3_31 + (A3_25 - L3_31) * ((Sin(-1.57 + 3.14 / A4_26 * _FORV_13_) + 1) / 2)
        else
          L6_34 = L3_31
        end
      else
        if L1_29 ~= A1_23 then
          L4_32 = L1_29 + (A1_23 - L1_29) * (_FORV_13_ / A4_26)
        else
          L4_32 = L1_29
        end
        if L2_30 ~= A2_24 then
          L5_33 = L2_30 + (A2_24 - L2_30) * (_FORV_13_ / A4_26)
        else
          L5_33 = L2_30
        end
        if L3_31 ~= A3_25 then
          L6_34 = L3_31 + (A3_25 - L3_31) * (_FORV_13_ / A4_26)
        else
          L6_34 = L3_31
        end
      end
      L4_32 = L4_32 - L7_35
      L5_33 = L5_33 - L8_36
      L6_34 = L6_34 - L9_37
      L0_28 = A0_22:getPos()
      A0_22:setPos(Vector(L0_28.x + L4_32, L0_28.y + L5_33, L0_28.z + L6_34))
      L9_37, L8_36, L7_35 = L6_34, L5_33, L4_32
      wait()
    end
  end)
end
function moveobj_swing(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48, L11_49, L12_50, L13_51, L14_52, L15_53, L16_54, L17_55, L18_56, L19_57, L20_58, L21_59, L22_60, L23_61
  L3_41 = RandF
  L4_42 = -1
  L5_43 = 1
  L3_41 = L3_41(L4_42, L5_43)
  function L4_42()
    if RandI(1, 2) == 1 then
      return Sin
    else
      return Cos
    end
  end
  rndcurve = L4_42
  L4_42 = rndcurve
  L4_42 = L4_42()
  L5_43 = rndcurve
  L5_43 = L5_43()
  L6_44 = rndcurve
  L6_44 = L6_44()
  L8_46 = A0_38
  L7_45 = A0_38.getPos
  L7_45 = L7_45(L8_46)
  L8_46 = L7_45.x
  L9_47 = L7_45.y
  L10_48 = L7_45.z
  L11_49 = L8_46
  L12_50 = L9_47
  L13_51 = L10_48
  L14_52 = 0
  L15_53 = RandF
  L16_54 = 1
  L17_55 = 4
  L15_53 = L15_53(L16_54, L17_55)
  L16_54 = RandF
  L17_55 = 1
  L18_56 = 4
  L16_54 = L16_54(L17_55, L18_56)
  L17_55 = RandF
  L18_56 = 1
  L19_57 = 4
  L17_55 = L17_55(L18_56, L19_57)
  L18_56 = RandF
  L19_57 = 1
  L20_58 = 4
  L18_56 = L18_56(L19_57, L20_58)
  L19_57 = RandF
  L20_58 = 1
  L21_59 = 4
  L19_57 = L19_57(L20_58, L21_59)
  L20_58 = RandF
  L21_59 = 1
  L22_60 = 4
  L20_58 = L20_58(L21_59, L22_60)
  L21_59 = L8_46
  L22_60 = L9_47
  L23_61 = L10_48
  return invokeTask(function()
    local L0_62
    while true do
      L0_62 = L9_47
      L0_62 = L0_62 + (L4_42(L14_52) + L5_43(L14_52 / L15_53) + L6_44(L14_52 / L16_54)) * A1_39
      L12_50 = L0_62
      L0_62 = L8_46
      L0_62 = L0_62 + (L6_44(L14_52) + L4_42(L14_52 / L17_55) + L5_43(L14_52 / L18_56)) * A1_39 / 3
      L11_49 = L0_62
      L0_62 = L10_48
      L0_62 = L0_62 + (L5_43(L14_52) + L6_44(L14_52 / L19_57) + L4_42(L14_52 / L20_58)) * A1_39 / 3
      L13_51 = L0_62
      L0_62 = L11_49
      L11_49 = L11_49 - L21_59
      L12_50 = L12_50 - L22_60
      L13_51 = L13_51 - L23_61
      L7_45 = A0_38:getPos()
      A0_38:setPos(Vector(L7_45.x + L11_49, L7_45.y + L12_50, L7_45.z + L13_51))
      L23_61, L22_60, L21_59 = L13_51, L12_50, L0_62
      L14_52 = L14_52 + A2_40
      if L14_52 > 360 then
        L14_52 = 0
      end
      wait()
    end
  end)
end
function moveobj_turn(A0_63, A1_64)
  return invokeTask(function()
    local L0_65, L1_66
    L0_65 = RandI
    L1_66 = -1
    L0_65 = L0_65(L1_66, 1)
    L1_66 = nil
    if A1_64 == nil then
      A1_64 = 0.3
      L1_66 = RandF(0.01, A1_64) * L0_65
    else
      L1_66 = A1_64
    end
    while L0_65 ~= 0 do
      A0_63:setRot(A0_63:getRot() * XYZRotQuaternionEular(0, L1_66, 0))
      wait()
    end
  end)
end
function hatoSetup()
  obj = createGameObject2("Puppet")
  obj:loadModel("brd01_base")
  obj:loadBaseSkeleton("brd01_base")
  obj:loadPoseAnimation("brd01_base", "brd01_base")
  obj:setPos(Vector(0, 0, 0))
  obj:setRot(XYZRotQuaternionEular(0, 0, 0))
  return obj
end
function hatoReset(A0_67, A1_68, A2_69)
  A0_67:loadPoseAnimation("brd01_stay_00", "brd01_stay_00")
  A0_67:playPoseAnimation("brd01_stay_00")
  A0_67:setPos(A1_68)
  A0_67:setRot(A2_69)
  A0_67:setVisible(true)
end
function hatoFlyLine(A0_70, A1_71, A2_72, A3_73, A4_74)
  local L5_75, L6_76, L7_77, L8_78
  L6_76 = A0_70
  L5_75 = A0_70.getPos
  L5_75 = L5_75(L6_76)
  L6_76 = L5_75.x
  L6_76 = A1_71 - L6_76
  L7_77 = L5_75.y
  L7_77 = A2_72 - L7_77
  L8_78 = ArcTan2
  L8_78 = L8_78(L6_76, L7_77)
  A0_70:setRot(XYZRotQuaternionEular(0, Rad2Deg(L8_78), 0))
  invokeTask(function()
    A0_70:loadPoseAnimation("brd01_fly_00", "brd01_fly_00")
    A0_70:playPoseAnimation("brd01_fly_00")
    while moveobj_line(A0_70, A1_71, A2_72, A3_73, A4_74):isRunning() do
      wait()
    end
    A0_70:setVisible(false)
  end)
end
function hatoFlyLine2(A0_79, A1_80)
  return invokeTask(function()
    local L0_81, L1_82, L2_83, L3_84, L4_85, L5_86, L6_87, L7_88
    if L0_81 == nil then
      return
    end
    for L3_84 = 1, #L1_82 do
      L4_85 = A0_79
      L5_86 = L4_85
      L4_85 = L4_85.getPos
      L4_85 = L4_85(L5_86)
      L5_86 = A1_80[L3_84]
      L5_86 = L5_86.pos
      L5_86 = L5_86.x
      L6_87 = L4_85.x
      L5_86 = L5_86 - L6_87
      L6_87 = A1_80[L3_84]
      L6_87 = L6_87.pos
      L6_87 = L6_87.y
      L7_88 = L4_85.y
      L6_87 = L6_87 - L7_88
      L7_88 = ArcTan2
      L7_88 = L7_88(L5_86, L6_87)
      A0_79:setRot(XYZRotQuaternionEular(0, Rad2Deg(L7_88), 0))
      A0_79:loadPoseAnimation("brd01_fly_00", "brd01_fly_00")
      A0_79:playPoseAnimation("brd01_fly_00")
      while moveobj_line(A0_79, A1_80[L3_84].pos.x, A1_80[L3_84].pos.y, A1_80[L3_84].pos.z, A1_80[L3_84].speed):isRunning() do
        wait()
      end
    end
    L0_81(L1_82, L2_83)
  end)
end
function setParam(A0_89, A1_90, A2_91, A3_92)
  local L4_93, L5_94, L6_95, L7_96, L8_97, L9_98, L10_99
  L4_93 = A0_89[1]
  L5_94 = L4_93
  L6_95 = A0_89[2]
  L7_96, L8_97, L9_98, L10_99 = nil, nil, nil, nil
  if A3_92 == nil then
    A3_92 = "gravite2_uxvideo"
  end
  if A0_89[5] ~= nil then
    L10_99 = A0_89[5]
  end
  if L6_95 == 0 then
    if L4_93 ~= 0 then
      L6_95 = A2_91.cuts[L4_93].duration
      L4_93 = L4_93 - 1
    end
  else
    L6_95 = L6_95 - 1
  end
  if A0_89[4] ~= nil then
    L7_96 = A0_89[3]
    L8_97 = A0_89[4]
  else
    L7_96 = A2_91.cuts[L5_94 + 1].duration
    L8_97 = A0_89[3]
  end
  if L8_97 < 1 then
    L9_98 = A3_92 .. "_0" .. L8_97 * 10
  else
    L9_98 = A3_92 .. "_" .. L8_97 * 10
  end
  return invokeTask(function()
    local L0_100
    while true do
      L0_100 = A1_90
      L0_100 = L0_100.getCurrentCutIndex
      L0_100 = L0_100(L0_100)
      if L0_100 == L4_93 then
        L0_100 = A1_90
        L0_100 = L0_100.getCurrentCutFrame
        L0_100 = L0_100(L0_100)
      end
      if L0_100 ~= L6_95 then
        L0_100 = wait
        L0_100()
      end
    end
    L0_100 = print
    L0_100("---param start  ", A0_89, A1_90:getCurrentCutIndex(), A1_90:getCurrentCutFrame())
    while true do
      L0_100 = A1_90
      L0_100 = L0_100.getCurrentCutFrame
      L0_100 = L0_100(L0_100)
      if L0_100 ~= L7_96 then
        L0_100 = A0_89[5]
        if L0_100 ~= nil then
          L0_100 = nil
          if A1_90:getCurrentCutFrame() == A2_91.cuts[L4_93 + 1].duration then
            L0_100 = 0
          else
            L0_100 = A1_90:getCurrentCutFrame()
          end
          if 1 > math.floor((L8_97 + (L10_99 - L8_97) * ((L0_100 - A0_89[2]) / (L7_96 - A0_89[2])) + 0.05) * 10) / 10 then
            L9_98 = A3_92 .. "_0" .. math.floor((L8_97 + (L10_99 - L8_97) * ((L0_100 - A0_89[2]) / (L7_96 - A0_89[2])) + 0.05) * 10) / 10 * 10
          else
            L9_98 = A3_92 .. "_" .. math.floor((L8_97 + (L10_99 - L8_97) * ((L0_100 - A0_89[2]) / (L7_96 - A0_89[2])) + 0.05) * 10) / 10 * 10
          end
        end
        L0_100 = GameScene
        L0_100 = L0_100.SetSceneParameters
        L0_100(L0_100, L9_98)
        L0_100 = Debug
        L0_100 = L0_100.screenPrint
        L0_100(L0_100, 0, 450, {
          "sceneparamName >" .. L9_98
        })
        L0_100 = wait
        L0_100()
      end
    end
    L0_100 = print
    L0_100("---param end  ", A0_89, A1_90:getCurrentCutIndex(), A1_90:getCurrentCutFrame())
  end)
end
function sceneParamAnim(A0_101, A1_102, A2_103, A3_104)
  local L4_105, L5_106, L6_107
  for _FORV_7_ = 1, #A0_101 do
    setParam(A0_101[_FORV_7_], A1_102, A2_103, A3_104)
  end
end
