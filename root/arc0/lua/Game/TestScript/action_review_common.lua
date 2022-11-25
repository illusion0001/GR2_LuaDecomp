local L1_1
function L0_0(A0_2, A1_3)
  local L2_4
  L2_4 = {}
  if Fn_getCharaHandle(A0_2) ~= nil then
    L2_4.chara = Fn_getCharaHandle(A0_2)
  else
    L2_4.chara = findGameObject2("Node", A0_2)
  end
  L2_4.node = A1_3
  __updateTarget[A0_2] = L2_4
end
Fn_setUpdataPosition = L0_0
function L0_0()
  Player:setAbility({
    Player.kAbility_Walk,
    Player.kAbility_Run,
    Player.kAbility_Jump,
    Player.kAbility_Dodge,
    Player.kAbility_KickCombo,
    Player.kAbility_GravityShift,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_Grab
  }, true)
  HUD:hpgDispReq_FadeIn()
end
Fn_userCtrlOn_NoHUD = L0_0
function L0_0(A0_5, A1_6)
  local L2_7, L3_8, L4_9
  L2_7 = Vector
  L3_8 = 3
  L4_9 = 3
  L2_7 = L2_7(L3_8, L4_9, 3)
  L3_8 = nil
  if A0_5 ~= nil then
    if A1_6 ~= nil then
      L2_7 = A1_6
    end
    L4_9 = "pccubesensor2_le_finish_OnEnter"
    _G[L4_9] = function()
      Finishgame(L3_8)
    end
    L3_8 = createGameObject2("PlayerSensor")
    L3_8:setName("pccubesensor2_le_finish")
    L3_8:setDetectBehavior(1)
    L3_8:addBox(L2_7)
    L3_8:setPos(Vector(0, L2_7.y / 2, 0))
    L3_8:setOnEnter(L4_9)
    L3_8:setActive(false)
    __sensor_handle.finish = L3_8
    A0_5:appendChild(L3_8)
  end
  return L3_8
end
Fn_setFinishSenser = L0_0
function L0_0(A0_10, A1_11)
  local L2_12, L3_13, L4_14
  L2_12 = Vector
  L3_13 = 50
  L4_14 = 50
  L2_12 = L2_12(L3_13, L4_14, 50)
  L3_13 = nil
  if A0_10 ~= nil then
    if A1_11 ~= nil then
      L2_12 = A1_11
    end
    L4_14 = "pccubesensor2_le_out_OnLeave"
    _G[L4_14] = function()
      Outgame()
      L3_13:setActive(false)
    end
    L3_13 = createGameObject2("PlayerSensor")
    L3_13:setName("pccubesensor2_le_out")
    L3_13:setDetectBehavior(1)
    L3_13:addBox(L2_12)
    L3_13:setOnLeave(L4_14)
    L3_13:setActive(false)
    __sensor_handle.out = L3_13
    A0_10:appendChild(L3_13)
  end
  return L3_13
end
Fn_setOutSenser = L0_0
function L0_0(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L3_18 = Fn_getSubAreaHandle
  L4_19 = "jilga"
  L5_20 = A0_15
  L3_18 = L3_18(L4_19, L5_20)
  if L3_18 == nil then
    L4_19 = nil
    return L4_19
  end
  L4_19 = A2_17
  L5_20 = createGameObject2
  L6_21 = "GimmickBg"
  L5_20 = L5_20(L6_21)
  L7_22 = L5_20
  L6_21 = L5_20.setName
  L8_23 = L4_19
  L6_21(L7_22, L8_23)
  L7_22 = L5_20
  L6_21 = L5_20.setDrawModelName
  L8_23 = L4_19
  L6_21(L7_22, L8_23)
  L7_22 = L5_20
  L6_21 = L5_20.setCollisionName
  L8_23 = L4_19
  L6_21(L7_22, L8_23)
  L7_22 = L5_20
  L6_21 = L5_20.setAttributeName
  L8_23 = L4_19
  L6_21(L7_22, L8_23)
  L7_22 = L5_20
  L6_21 = L5_20.try_init
  L6_21(L7_22)
  L7_22 = L5_20
  L6_21 = L5_20.waitForReady
  L6_21(L7_22)
  L6_21 = findGameObject2
  L7_22 = "Node"
  L8_23 = A1_16
  L6_21 = L6_21(L7_22, L8_23)
  L8_23 = L6_21
  L7_22 = L6_21.getWorldPos
  L7_22 = L7_22(L8_23)
  L8_23 = L6_21.getWorldRot
  L8_23 = L8_23(L6_21)
  L5_20:setWorldPos(L7_22)
  L5_20:setWorldRot(L8_23)
  L5_20:setForceMove()
  L5_20:try_start()
  return L5_20
end
create_setbox = L0_0
function L0_0(A0_24, A1_25, A2_26)
  local L3_27, L4_28, L5_29, L6_30, L7_31, L8_32
  L3_27 = Fn_getSubAreaHandle
  L4_28 = "jilga"
  L5_29 = A0_24
  L3_27 = L3_27(L4_28, L5_29)
  if L3_27 == nil then
    L4_28 = nil
    return L4_28
  end
  L4_28 = A2_26
  L5_29 = createGameObject2
  L6_30 = "GimmickBg"
  L5_29 = L5_29(L6_30)
  L7_31 = L5_29
  L6_30 = L5_29.setName
  L8_32 = L4_28
  L6_30(L7_31, L8_32)
  L7_31 = L5_29
  L6_30 = L5_29.setDrawModelName
  L8_32 = L4_28
  L6_30(L7_31, L8_32)
  L7_31 = L5_29
  L6_30 = L5_29.setCollisionName
  L8_32 = L4_28
  L6_30(L7_31, L8_32)
  L7_31 = L5_29
  L6_30 = L5_29.setAttributeName
  L8_32 = L4_28
  L6_30(L7_31, L8_32)
  L7_31 = L5_29
  L6_30 = L5_29.try_init
  L6_30(L7_31)
  L7_31 = L5_29
  L6_30 = L5_29.waitForReady
  L6_30(L7_31)
  L6_30 = findGameObject2
  L7_31 = "Node"
  L8_32 = A1_25
  L6_30 = L6_30(L7_31, L8_32)
  L8_32 = L6_30
  L7_31 = L6_30.getWorldPos
  L7_31 = L7_31(L8_32)
  L8_32 = L6_30.getWorldRot
  L8_32 = L8_32(L6_30)
  L3_27:appendChild(L5_29)
  L7_31.x = L7_31.x + (1.5 - RandF(0, 3))
  L7_31.z = L7_31.z + (1.5 - RandF(0, 3))
  L7_31.x = L7_31.x + (4 - RandF(0, 8))
  L7_31.z = L7_31.z + (4 - RandF(0, 8))
  L5_29:setWorldPos(L7_31)
  L5_29:setWorldRot(L8_32)
  L5_29:setForceMove()
  L5_29:try_start()
  return L5_29
end
create_boxset = L0_0
function L0_0(A0_33, A1_34, A2_35, A3_36, A4_37, A5_38)
  local L6_39, L7_40, L8_41, L9_42, L10_43, L11_44
  L6_39 = Fn_getSubAreaHandle
  L7_40 = "jilga"
  L8_41 = A0_33
  L6_39 = L6_39(L7_40, L8_41)
  if L6_39 == nil then
    L7_40 = nil
    return L7_40
  end
  L7_40 = A2_35
  L8_41 = createGameObject2
  L9_42 = "GimmickBg"
  L8_41 = L8_41(L9_42)
  L10_43 = L8_41
  L9_42 = L8_41.setName
  L11_44 = L7_40
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setDrawModelName
  L11_44 = L7_40
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setCollisionName
  L11_44 = L7_40
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setAttributeName
  L11_44 = L7_40
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setPos
  L11_44 = Vector
  L11_44 = L11_44(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5))
  L9_42(L10_43, L11_44, L11_44(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
  L10_43 = L8_41
  L9_42 = L8_41.try_init
  L9_42(L10_43)
  L10_43 = L8_41
  L9_42 = L8_41.waitForReady
  L9_42(L10_43)
  L9_42 = findGameObject2
  L10_43 = "Node"
  L11_44 = A1_34
  L9_42 = L9_42(L10_43, L11_44)
  L11_44 = L9_42
  L10_43 = L9_42.getWorldPos
  L10_43 = L10_43(L11_44)
  L11_44 = L9_42.getWorldRot
  L11_44 = L11_44(L9_42)
  L6_39:appendChild(L8_41)
  L10_43.x = L10_43.x + A3_36 * A5_38
  L10_43.z = L10_43.z + A4_37 * A5_38
  print("pos:" .. L10_43.x)
  L8_41:setWorldPos(L10_43)
  L8_41:setWorldRot(L11_44)
  L8_41:setForceMove()
  L8_41:try_start()
  return L8_41
end
create_alinebox = L0_0
tutorialCaptionHandle = nil
function L0_0(A0_45)
  if tutorialCaptionHandle ~= nil then
    return
  end
  tutorialCaptionHandle = invokeTask(function()
    local L0_46, L2_47
    L0_46, L2_47 = nil, nil
    while true do
      if A0_45 == "gravity" then
        if Player:isGravityControlMode() then
          L0_46 = "ar_02000"
        else
          L0_46 = "ar_02010"
        end
      elseif A0_45 == "gravityfirst" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_46 = "ar_02050"
          else
            L0_46 = "ar_02010"
          end
        end
      elseif A0_45 == "gravitysecond" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_46 = "ar_02060"
          else
            L0_46 = "ar_02065"
          end
        end
      elseif A0_45 == "attack" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_46 = "ar_02100"
          else
            L0_46 = "ar_02110"
          end
        end
      elseif A0_45 == "escape" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          L0_46 = "ar_02120"
        end
      elseif A0_45 == "gravitykick" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_46 = "ar_02100"
          else
            L0_46 = "ar_02010"
          end
        end
      elseif A0_45 == "mars" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_46 = "ar_02150"
        else
          L0_46 = "ar_02160"
        end
      elseif A0_45 == "marsgrav_kick" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAttrTune() == Player.kAttrTune_Mars and Player:isGravityControlMode() then
            L0_46 = "ar_02170"
          elseif Player:getAttrTune() == Player.kAttrTune_Mars then
            L0_46 = "ar_02010"
          elseif Player:isGravityControlMode() then
            L0_46 = "ar_02180"
          else
            L0_46 = "ar_02190"
          end
        end
      elseif A0_45 == "jupiter" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAttrTune() == Player.kAttrTune_Jupiter and Player:isGravityControlMode() then
            L0_46 = "ar_02200"
          elseif Player:getAttrTune() == Player.kAttrTune_Jupiter then
            L0_46 = "ar_02010"
          elseif Player:isGravityControlMode() then
            L0_46 = "ar_02210"
          else
            L0_46 = "ar_02220"
          end
        else
          L0_46 = "ar_02230"
        end
      elseif A0_45 == "jup_sli" then
        if Player:getAttrTune() ~= Player.kAttrTune_Jupiter then
          L0_46 = "ar_02240"
        else
          L0_46 = "ar_02250"
        end
      end
      if L0_46 ~= L2_47 then
        if L0_46 ~= nil then
          Fn_captionView(L0_46, 0)
        else
          HUD:captionEnd()
        end
        L2_47 = L0_46
      end
      wait()
    end
  end)
end
Fn_tutorialCaption = L0_0
function L0_0()
  if tutorialCaptionHandle ~= nil then
    tutorialCaptionHandle:abort()
    tutorialCaptionHandle = nil
    wait(3)
    HUD:captionEnd()
  end
end
Fn_tutorialCaptionKill = L0_0
function L0_0(A0_48, A1_49)
  local L2_50, L3_51, L4_52
  L3_51 = A0_48
  L2_50 = A0_48.getName
  L2_50 = L2_50(L3_51)
  L3_51 = createGameObject2
  L4_52 = "Gem"
  L3_51 = L3_51(L4_52)
  L4_52 = L3_51.setGemModelNo
  L4_52(L3_51, A1_49)
  L4_52 = A0_48.getWorldPos
  L4_52 = L4_52(A0_48)
  L4_52 = L4_52 + Vector(0, 3, 0)
  L3_51:setWorldPos(L4_52)
  L3_51:setForceMove()
  L3_51:setVisible(true)
  L3_51:try_init()
  L3_51:waitForReadyAsync(function()
    L3_51:try_start()
  end)
  return L3_51
end
create_gem = L0_0
function L0_0(A0_53, A1_54)
  local L2_55, L3_56, L4_57
  L3_56 = A0_53
  L2_55 = A0_53.getName
  L2_55 = L2_55(L3_56)
  L3_56 = createGameObject2
  L4_57 = "Gem"
  L3_56 = L3_56(L4_57)
  L4_57 = L3_56.setGemModelNo
  L4_57(L3_56, A1_54)
  L4_57 = A0_53.getWorldPos
  L4_57 = L4_57(A0_53)
  L4_57 = L4_57 + Vector(0, 1, 0)
  L3_56:setWorldPos(L4_57)
  L3_56:setForceMove()
  L3_56:setVisible(true)
  L3_56:try_init()
  L3_56:waitForReadyAsync(function()
    L3_56:try_start()
  end)
  return L3_56
end
create_gem_enemy = L0_0
function L0_0(A0_58)
  flag_tbl[PHASE][A0_58].gem:try_term()
  flag_tbl[PHASE][A0_58].gem = nil
end
delete_gem = L0_0
function L0_0(A0_59, A1_60)
  local L2_61, L3_62, L4_63, L5_64, L6_65
  L2_61 = nil
  for L6_65 = 1, 9 do
    L2_61 = findGameObject2("Gem", "gem2_navi_0" .. A0_59)
    if L2_61 ~= nil then
      L2_61:setVisible(A1_60)
    end
  end
end
GemSetDisp = L0_0
function L0_0(A0_66, A1_67)
  while not Fn_isInSightTarget(A0_66, 30) do
    if 0 < Pad:getStick(Pad.kStick_Camera) or 0 < Pad:getStick(Pad.kStick_Camera) then
      while not (0 + 1 > 20) do
        else
        end
        wait()
      end
  end
  Fn_lookAtObject(A0_66, A1_67):abort()
end
navi_look_at_target = L0_0
function L0_0(A0_68, A1_69)
  while A1_69 < Fn_get_distance(Fn_getPcPosRot(), A0_68:getWorldPos()) do
    wait()
  end
end
pc_target_near_wait = L0_0
function L0_0()
  local L0_70, L1_71
  L0_70 = "ui_sm_main_"
  L1_71 = string
  L1_71 = L1_71.sub
  L1_71 = L1_71(event_name, 1, 4)
  L0_70 = L0_70 .. L1_71
  L1_71 = "ui_sm_sub_04"
  if event_name == "sm93" then
    L1_71 = "ui_sm_sub_05"
  end
  HUD:sideMissionEndOpen(L0_70, L1_71)
  while HUD:sideMissionIsVisible() do
    wait()
  end
end
Fn_sideMissionEndTitle = L0_0
function L0_0(A0_72, A1_73)
  if Fn_getGameObject("mother2") == nil then
    return nil
  end
  if Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", A0_72) == nil then
    return nil
  end
  return Fn_getGameObject("mother2"):sendEvent("getBackgroundElement2Handle", A0_72):findSubArea(A1_73)
end
Fn_getSubAreaHandle = L0_0
function L0_0(A0_74, A1_75, A2_76)
  local L3_77, L4_78, L5_79, L6_80, L7_81, L8_82, L9_83, L10_84, L11_85
  function L3_77(A0_86)
    A0_86:try_init()
    A0_86:waitForReady()
    A0_86:try_start()
  end
  event_start = L3_77
  L3_77 = loadFileAsset
  L4_78 = "evb"
  L3_77 = L3_77(L4_78, L5_79)
  L4_78 = L3_77.wait
  L4_78(L5_79)
  L4_78 = L3_77.getRoot
  L4_78 = L4_78(L5_79)
  if L5_79 == "string" then
    L8_82 = nil
    L9_83 = root
    if A2_76 == true then
      L6_80(L7_81)
    end
  else
    for L8_82, L9_83 in L5_79(L6_80) do
      L11_85 = L4_78
      L10_84 = L4_78.findBundle
      L10_84 = L10_84(L11_85, L9_83)
      if L10_84 ~= nil then
        L11_85 = EventData
        L11_85 = L11_85.create
        L11_85 = L11_85(L11_85, L9_83, nil, L10_84)
        if A2_76 == true then
          event_start(L11_85)
        end
      end
    end
  end
end
load_event_evb = L0_0
function L0_0(A0_87)
  local L1_88
  L1_88 = Player
  L1_88 = L1_88.getEnergy
  L1_88 = L1_88(L1_88, Player.kEnergy_Life)
  if L1_88 <= Player:getEnergyMax(Player.kEnergy_Life) / 3 then
    L1_88 = __gemset
    if L1_88 == false then
      L1_88 = findGameObject2
      L1_88 = L1_88("Puppet", A0_87:getName())
      create_gem_enemy(L1_88, 5)
      __gemtime_cnt = __time_cnt
      __gemset = true
      print("gemtime" .. __gemtime_cnt)
    end
  end
end
lowlife_gemset = L0_0
