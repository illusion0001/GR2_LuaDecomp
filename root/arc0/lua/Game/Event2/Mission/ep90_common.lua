import("Time")
function is_camera_input(A0_0, A1_1)
  local L2_2
  L2_2 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_2 = true
  end
  return L2_2
end
function look_at_target_input(A0_3, A1_4)
  while true do
    if Fn_isInSightTarget(A0_3) == true then
      break
    end
    if is_camera_input() == true then
      if not (0 + 1 > 10) then
        else
        end
        wait()
      end
  end
  if Fn_lookAtObject(A0_3, A1_4) ~= nil and Fn_lookAtObject(A0_3, A1_4):isRunning() == true then
    Fn_lookAtObject(A0_3, A1_4):abort()
  end
  return true
end
function is_check_eye_node(A0_5, A1_6, A2_7, A3_8)
  local L4_9, L5_10, L6_11, L7_12
  if A1_6 == nil then
    A1_6 = 40
  end
  if A3_8 == nil then
    A3_8 = true
  end
  L4_9 = false
  L5_10 = Fn_isInSightTarget
  L6_11 = A0_5
  L7_12 = A2_7
  L5_10 = L5_10(L6_11, L7_12)
  if L5_10 == true then
    if A3_8 == true then
      L5_10 = Fn_getPcPosRot
      L6_11 = L5_10()
      L7_12 = L5_10.y
      L7_12 = L7_12 + 1.5
      L5_10.y = L7_12
      L7_12 = Query
      L7_12 = L7_12.setEyeSightTransform
      L7_12(L7_12, L5_10, L6_11)
      L7_12 = Query
      L7_12 = L7_12.setEyeSightAngle
      L7_12(L7_12, Deg2Rad(360))
      L7_12 = Query
      L7_12 = L7_12.setEyeSightRange
      L7_12(L7_12, A1_6)
      L7_12 = A0_5.getWorldPos
      L7_12 = L7_12(A0_5)
      if Query:checkEyeSightSphere(L7_12, 0.1) == true and Query:raycastEyeSight(L7_12) == nil then
        L4_9 = true
      end
    else
      L4_9 = true
    end
  end
  return L4_9
end
function create_haze()
  local L0_13, L1_14, L2_15, L3_16
  L0_13 = {}
  L1_14 = 1
  while true do
    L2_15 = findGameObject2
    L3_16 = "Node"
    L2_15 = L2_15(L3_16, "locator2_haze_" .. string.format("%02d", L1_14))
    if L2_15 ~= nil then
      L3_16 = createGameObject2
      L3_16 = L3_16("Effect")
      L3_16:setModelName("ef_ev_smk_bk")
      L3_16:setName("haze_" .. string.format("%02d", L1_14))
      L3_16:setLoop(true)
      L3_16:play()
      L3_16:setActive(false)
      L3_16:try_init()
      L3_16:waitForReady()
      L3_16:try_start()
      L2_15:appendChild(L3_16)
      L0_13[L1_14] = L3_16
    else
      break
    end
    L1_14 = L1_14 + 1
  end
  return L0_13
end
function vogo_crate_broken_demo()
  local L0_17, L1_18, L2_19, L3_20
  L0_17 = Fn_findNpc
  L1_18 = "vogo_01"
  L0_17 = L0_17(L1_18)
  L2_19 = L0_17
  L1_18 = L0_17.getPuppet
  L1_18 = L1_18(L2_19)
  L2_19 = false
  L3_20 = 1
  while findGameObject2("GimmickBg", "bg2_crate_before_" .. string.format("%02d", L3_20)) ~= nil do
    findGameObject2("GimmickBg", "bg2_crate_before_" .. string.format("%02d", L3_20)):setEventListener("broken", function(A0_21)
      local L1_22
      L1_22 = Fn_get_distance
      L1_22 = L1_22(L1_18:getWorldPos(), Fn_getPcPosRot())
      if L1_22 < 20 then
        L1_22 = true
        L2_19 = L1_22
      end
    end)
    L3_20 = L3_20 + 1
  end
  return invokeTask(function()
    local L0_23, L1_24
    while true do
      L0_23 = L2_19
      if L0_23 == true then
        L0_23 = Fn_userCtrlOff
        L0_23()
        L0_23 = Fn_lookAtObject
        L1_24 = L1_18
        L0_23 = L0_23(L1_24, 0.8)
        L1_24 = false
        invokeTask(function()
          local L0_25, L1_26
          L0_25 = 0
          L1_26 = L1_18
          L1_26 = L1_26.getWorldPos
          L1_26 = L1_26(L1_26)
          while L1_24 == false and Fn_isInSightTarget(L1_18) == false do
            Player:setLookAtIk(true, 1, L1_26)
            wait()
          end
          Player:setLookAtIk(false, 1, Vector(0, 0, 0))
          if L0_23 ~= nil and L0_23:isRunning() == true then
            L0_23:abort()
          end
          L0_23 = nil
        end)
        Fn_turnNpc(L0_17)
        L1_24 = true
        L0_17:playMotion("angry_00")
        Sound:playSE("vog020a", 1, "", L1_18)
        Fn_captionViewWait("ep90_00900")
        Fn_blackout()
        Fn_resetPcPos(findGameObject2("Node", "locator2_pc_reset_pos"))
        Fn_warpNpc(L0_17, "locator2_vogo")
        Area:requestRestore()
        wait()
        Fn_userCtrlOn()
        Fn_fadein()
        L2_19 = false
      else
      end
      L0_23 = wait
      L0_23()
    end
  end)
end
function vogo_battle_escape()
  local L0_27, L1_28, L2_29, L3_30, L4_31
  L0_27 = Fn_findNpc
  L1_28 = "vogo_01"
  L0_27 = L0_27(L1_28)
  L2_29 = L0_27
  L1_28 = L0_27.getPuppet
  L1_28 = L1_28(L2_29)
  L2_29 = 1
  L3_30 = {}
  while true do
    L4_31 = findGameObject2
    L4_31 = L4_31("Node", "locator2_vogo_escape_" .. string.format("%02d", L2_29))
    if L4_31 ~= nil then
      L3_30[L2_29] = L4_31
      L2_29 = L2_29 + 1
    end
  end
  L2_29 = 1
  L4_31 = {}
  while findGameObject2("Node", "locator2_vogo_hide_" .. string.format("%02d", L2_29)) ~= nil do
    L4_31[L2_29] = findGameObject2("Node", "locator2_vogo_hide_" .. string.format("%02d", L2_29))
    L2_29 = L2_29 + 1
  end
  return invokeTask(function()
    local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48, L17_49, L18_50, L19_51, L20_52
    L0_32 = {
      L1_33,
      L2_34,
      L3_35,
      L4_36
    }
    L1_33 = "ep90_00050"
    L2_34 = "ep90_00051"
    L1_33 = Fn_getPlayer
    L1_33 = L1_33()
    repeat
      L2_34 = Fn_get_shuffle_teble
      L2_34 = L2_34(L3_35)
      for L6_38, L7_39 in L3_35(L4_36) do
        L8_40 = Fn_moveNpc
        L9_41 = "vogo_01"
        L10_42 = {L11_43}
        L11_43.arrivedLength = 5
        L11_43.runLength = -1
        L8_40 = L8_40(L9_41, L10_42, L11_43)
        while true do
          L10_42 = L8_40
          L9_41 = L8_40.isRunning
          L9_41 = L9_41(L10_42)
          if L9_41 then
            L9_41 = wait
            L9_41()
          end
        end
        L8_40, L9_41 = nil, nil
        L10_42 = RandI
        L10_42 = L10_42(L11_43, L12_44)
        for L14_46 = 1, L10_42 do
          L15_47 = L0_27
          L15_47 = L15_47.playMotion
          L15_47(L16_48, L17_49)
          repeat
            L15_47 = wait
            L15_47()
            L15_47 = Fn_isInSightTarget
            L15_47 = L15_47(L16_48, L17_49)
            if L15_47 == false then
              L15_47 = L1_33.getWorldPos
              L15_47 = L15_47(L16_48)
              L15_47 = L15_47 - L16_48
              L15_47 = L15_47.Length
              L15_47 = L15_47(L16_48)
              if L15_47 > 10 then
                L15_47 = Fn_get_shuffle_teble
                L15_47 = L15_47(L16_48)
                for L19_51, L20_52 in L16_48(L17_49) do
                  if Fn_isInSightTarget(L20_52, 1) == false then
                    L9_41 = L20_52
                    break
                  end
                end
              end
            end
            if L9_41 == nil then
              L15_47 = L0_27
              L15_47 = L15_47.isMotionEnd
              L15_47 = L15_47(L16_48)
            end
          until L15_47
          if L9_41 == nil then
            L15_47 = L1_33.getWorldPos
            L15_47 = L15_47(L16_48)
            L15_47 = L15_47 - L16_48
            L15_47 = L15_47.Length
            L15_47 = L15_47(L16_48)
            if L15_47 < 20 then
              L15_47 = Fn_isInSightTarget
              L15_47 = L15_47(L16_48, L17_49)
              if L15_47 == true then
                L15_47 = Fn_captionView
                L15_47(L16_48)
                L15_47 = waitSeconds
                L15_47(L16_48)
                break
              end
            end
          end
        end
        if L9_41 ~= nil then
          L11_43(L12_44, L13_45)
          L9_41 = nil
          repeat
            for L15_47 = 1, L11_43 do
              L16_48(L17_49, L18_50)
              repeat
                L16_48()
              until L16_48
            end
            if L12_44 == false then
              if L12_44 > 10 then
                for L15_47, L16_48 in L12_44(L13_45) do
                  L19_51 = 1
                  if L17_49 == false then
                    L9_41 = L16_48
                    break
                  end
                end
              end
            end
            if L9_41 ~= nil then
              L12_44(L13_45, L14_46)
              L12_44(L13_45, L14_46)
              break
            end
            L12_44()
          until L12_44
        end
      end
      L3_35()
    until L3_35
    L1_33 = nil
  end)
end
function lockon_vogo_crate(A0_53)
  local L1_54
  L1_54 = 1
  while findGameObject2("Node", A0_53 .. "_" .. string.format("%02d", L1_54)) ~= nil do
    if not findGameObject2("Node", A0_53 .. "_" .. string.format("%02d", L1_54)):isBroken() then
      findGameObject2("Node", A0_53 .. "_" .. string.format("%02d", L1_54)):setLockonPermission(true)
      do break end
      break
    end
    L1_54 = L1_54 + 1
  end
end
function create_append_nodo(A0_55, A1_56, A2_57)
  local L3_58
  L3_58 = createGameObject2
  L3_58 = L3_58("Node")
  L3_58:setName(A0_55)
  A1_56:appendChild(L3_58)
  L3_58:setPos(A2_57)
  L3_58:try_init()
  L3_58:waitForReady()
  L3_58:try_start()
  return L3_58
end
function choice_look_idx(A0_59, A1_60)
  local L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67
  L2_61 = 1
  L3_62 = 0
  for L7_66, L8_67 in L4_63(L5_64) do
    if L3_62 < Fn_getDistanceToPlayer(L8_67) then
      L3_62, L2_61 = Fn_getDistanceToPlayer(L8_67), L7_66
    end
  end
  if A1_60 < L3_62 then
    L4_63(L5_64)
  end
end
