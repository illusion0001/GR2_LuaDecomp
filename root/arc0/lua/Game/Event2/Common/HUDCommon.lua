import("HUD")
import("Font")
import("Area")
import("Player")
import("GameDatabase")
import("EventHelper")
import("Pad")
import("GlobalGem")
dofile("/Game/Event2/Common/PlayerCommon.lua")
__action_dialog = {}
__marker_set = {}
__caption = {text = nil, active = false}
__gesture_dialog = {cancel = false, visible = false}
__gesture_marker_set = {}
function checkTypeGetName(A0_0)
  if type(A0_0) == "string" then
    return A0_0
  else
    return A0_0:getName()
  end
end
function findNodeHandleAndGetName(A0_1, A1_2)
  local L2_3, L3_4
  L2_3, L3_4 = nil, nil
  if type(A0_1) == "string" then
    if A1_2 ~= nil then
      if A1_2 ~= "Puppet" then
        L2_3 = Fn_findNpc(A0_1)
      else
        L2_3 = findGameObject2(A1_2, A0_1)
      end
    else
      L2_3 = findGameObject2("Node", A0_1)
    end
    L3_4 = A0_1
  else
    L2_3 = A0_1
    L3_4 = A0_1:getName()
  end
  return L2_3, L3_4
end
function replaceMarkerName(A0_5)
  local L1_6, L2_7, L3_8
  L1_6 = A0_5
  L2_7 = "_marker"
  L1_6 = L1_6 .. L2_7
  L2_7 = string
  L2_7 = L2_7.find
  L3_8 = A0_5
  L3_8 = L2_7(L3_8, "npcgen2_")
  if L2_7 == 1 then
    L1_6 = string.sub(A0_5, L3_8, string.len(A0_5)) .. "_marker"
  end
  return L1_6
end
function replaceSensorName(A0_9)
  local L1_10, L2_11, L3_12
  L1_10 = A0_9
  L2_11 = "_sensor"
  L1_10 = L1_10 .. L2_11
  L2_11 = string
  L2_11 = L2_11.find
  L3_12 = A0_9
  L3_12 = L2_11(L3_12, "npcgen2_")
  if L2_11 == 1 then
    L1_10 = string.sub(A0_9, L3_12, string.len(A0_9)) .. "_sensor"
  end
  return L1_10
end
function setDialogActive(A0_13)
  if GameDatabase:get(ggd.GlobalSystemFlags__ActionDialogActive) == false then
    GameDatabase:set(ggd.GlobalSystemFlags__ActionDialogActive, true)
    A0_13.active = true
  end
end
function Fn_setSelfSandBoxMarker(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22
  for L4_18, L5_19 in L1_15(L2_16) do
    L6_20 = L5_19.sensor
    L6_20 = L6_20.hdl
    L7_21 = L6_20
    L6_20 = L6_20.getName
    L6_20 = L6_20(L7_21)
    L7_21 = string
    L7_21 = L7_21.find
    L8_22 = L6_20
    L7_21 = L7_21(L8_22, "Manhole")
    if L7_21 ~= nil then
      if A0_14 then
        L7_21 = string
        L7_21 = L7_21.match
        L8_22 = L6_20
        L7_21 = L7_21(L8_22, "Manhole%d+")
        if L7_21 then
          L8_22 = ggd
          L8_22 = L8_22["Savedata__Menu__ManholeFlags__" .. L7_21]
          if L8_22 then
            if GameDatabase:get(L8_22) then
              if string.find(L6_20, "_before") == nil then
                L5_19.sensor.hdl:setActive(true)
                L5_19.marker.hdl:playIn()
              end
            elseif string.find(L6_20, "_before") ~= nil then
              L5_19.sensor.hdl:setActive(true)
              L5_19.marker.hdl:playIn()
            end
          end
        end
      else
        L7_21 = L5_19.sensor
        L7_21 = L7_21.hdl
        L8_22 = L7_21
        L7_21 = L7_21.getActive
        L7_21 = L7_21(L8_22)
        if L7_21 then
          L7_21 = Fn_actionDialogCancel
          L8_22 = L5_19.sensor
          L8_22 = L8_22.hdl
          L7_21(L8_22)
          L7_21 = L5_19.sensor
          L7_21 = L7_21.hdl
          L8_22 = L7_21
          L7_21 = L7_21.setActive
          L7_21(L8_22, false)
          L7_21 = L5_19.marker
          L7_21 = L7_21.hdl
          L8_22 = L7_21
          L7_21 = L7_21.playOut
          L7_21(L8_22)
        end
      end
    else
      L7_21 = L5_19.sensor
      L7_21 = L7_21.hdl
      L8_22 = L7_21
      L7_21 = L7_21.setActive
      L7_21(L8_22, A0_14)
      if A0_14 then
        L7_21 = L5_19.marker
        L7_21 = L7_21.hdl
        L8_22 = L7_21
        L7_21 = L7_21.playIn
        L7_21(L8_22)
        L7_21 = L5_19.marker
        L7_21 = L7_21.hdl2
        if L7_21 then
          L7_21 = L5_19.marker
          L7_21 = L7_21.hdl2
          L8_22 = L7_21
          L7_21 = L7_21.playIn
          L7_21(L8_22)
        end
      else
        L7_21 = Fn_actionDialogCancel
        L8_22 = L5_19.sensor
        L8_22 = L8_22.hdl
        L7_21(L8_22)
        L7_21 = L5_19.marker
        L7_21 = L7_21.hdl
        L8_22 = L7_21
        L7_21 = L7_21.playOut
        L7_21(L8_22)
        L7_21 = L5_19.marker
        L7_21 = L7_21.hdl2
        if L7_21 then
          L7_21 = L5_19.marker
          L7_21 = L7_21.hdl2
          L8_22 = L7_21
          L7_21 = L7_21.playOut
          L7_21(L8_22)
        end
      end
    end
  end
end
function Fn_actionDialog(A0_23, A1_24, A2_25, A3_26, A4_27, A5_28, A6_29)
  local L7_30, L8_31
  L7_30 = checkTypeGetName
  L8_31 = A0_23
  L7_30 = L7_30(L8_31)
  L8_31 = {}
  L8_31.task = nil
  L8_31.active = false
  L8_31.cancel = false
  setDialogActive(L8_31)
  L8_31.task = invokeTask(function()
    local L0_32, L1_33, L2_34
    L0_32 = print
    L1_33 = " < hud com > "
    L2_34 = L7_30
    L1_33 = L1_33 .. L2_34 .. "\227\129\139\227\130\137\228\190\157\233\160\188\227\129\149\227\130\140\227\129\159activeDialog\227\130\146invokeTask\227\129\151\227\129\190\227\129\151\227\129\159"
    L0_32(L1_33)
    while true do
      L0_32 = L8_31.active
      if L0_32 ~= true then
        L0_32 = L8_31.cancel
        if L0_32 then
          return
        else
          L0_32 = setDialogActive
          L1_33 = L8_31
          L0_32(L1_33)
        end
        L0_32 = wait
        L0_32()
      end
    end
    L0_32 = HUD
    L1_33 = L0_32
    L0_32 = L0_32.inGamePreviewSetInputVisible
    L2_34 = false
    L0_32(L1_33, L2_34)
    L0_32 = Player
    L1_33 = L0_32
    L0_32 = L0_32.getAbility
    L2_34 = Player
    L2_34 = L2_34.kAbility_AttrTuneSwitch
    L0_32 = L0_32(L1_33, L2_34)
    L1_33 = Player
    L2_34 = L1_33
    L1_33 = L1_33.setAbility
    L1_33(L2_34, Player.kAbility_AttrTuneSwitch, false)
    L1_33 = nil
    while true do
      L2_34 = {}
      L2_34.title = A1_24
      L2_34.sub_title = A2_25
      L2_34.guide = A3_26
      L2_34.alert = A4_27
      L1_33 = HUD:actionDialogView(L2_34)
      if GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      elseif L1_33 <= HUD.kActionDialogState_None then
        if L8_31.cancel then
          HUD:inGamePreviewSetInputVisible(true)
          if L0_32 then
            Player:setAbility(Player.kAbility_AttrTuneSwitch, true)
          end
          HUD:actionDialogCancel()
        end
      elseif L1_33 == HUD.kActionDialogState_DecideFlow then
      elseif L1_33 == HUD.kActionDialogState_Decide then
        HUD:placeNameExit()
        HUD:inGamePreviewSetInputVisible(true)
        if L0_32 then
          Player:setAbility(Player.kAbility_AttrTuneSwitch, true)
        end
        if not L8_31.cancel and A5_28 ~= nil then
          A5_28()
        end
        break
      elseif L1_33 == HUD.kActionDialogState_OutFlow then
      elseif L1_33 == HUD.kActionDialogState_Out then
        HUD:inGamePreviewSetInputVisible(true)
        if L0_32 then
          Player:setAbility(Player.kAbility_AttrTuneSwitch, true)
        end
        if A6_29 ~= nil then
          A6_29()
        end
        break
      end
      wait()
    end
    L2_34 = __action_dialog
    L2_34 = L2_34[L7_30]
    if L2_34 ~= nil then
      L2_34 = __action_dialog
      L2_34 = L2_34[L7_30]
      L2_34 = L2_34.task
      if L2_34 == L8_31.task then
        L2_34 = __action_dialog
        L2_34[L7_30] = nil
      end
    end
    L2_34 = GameDatabase
    L2_34 = L2_34.set
    L2_34(L2_34, ggd.GlobalSystemFlags__ActionDialogActive, false)
    L2_34 = print
    L2_34(" < hud com > " .. L7_30 .. "\227\129\139\227\130\137\229\145\188\227\129\176\227\130\140\227\129\159actionDialog\227\129\140\231\181\130\228\186\134\227\129\151\227\129\190\227\129\151\227\129\159")
  end)
  __action_dialog[L7_30] = L8_31
end
function Fn_actionDialogCancel(A0_35)
  local L1_36
  L1_36 = checkTypeGetName
  L1_36 = L1_36(A0_35)
  if __action_dialog[L1_36] ~= nil then
    __action_dialog[L1_36].cancel = true
    __action_dialog[L1_36] = nil
    print(" < hud com > " .. L1_36 .. "\227\129\139\227\130\137\229\145\188\227\129\176\227\130\140\227\129\159actionDialog\227\130\146\229\137\138\233\153\164\228\190\157\233\160\188\227\130\146\229\135\186\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_gestureAction(A0_37, A1_38, A2_39)
  local L3_40, L4_41
  L3_40 = A2_39 and A2_39 or "global"
  L4_41 = __gesture_dialog
  L4_41 = L4_41[L3_40]
  if L4_41 ~= nil then
    L4_41 = print
    L4_41(" < hud com > \227\129\153\227\129\167\227\129\171" .. L3_40 .. "\227\129\139\227\130\137\228\190\157\233\160\188\227\129\149\227\130\140\227\129\159gesture\227\129\175\232\181\183\229\139\149\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153")
    return
  end
  L4_41 = {}
  L4_41.task = nil
  L4_41.active = false
  L4_41.cancel = false
  setDialogActive(L4_41)
  L4_41.task = invokeTask(function()
    local L0_42, L1_43, L2_44
    L0_42 = print
    L1_43 = " < hud com > "
    L2_44 = L3_40
    L1_43 = L1_43 .. L2_44 .. "\227\129\139\227\130\137\228\190\157\233\160\188\227\129\149\227\130\140\227\129\159gesture\227\130\146invokeTask\227\129\151\227\129\190\227\129\151\227\129\159"
    L0_42(L1_43)
    L0_42 = {}
    L1_43 = A0_37.RU
    if L1_43 ~= nil then
      L1_43 = table
      L1_43 = L1_43.insert
      L2_44 = L0_42
      L1_43(L2_44, {
        btn = Pad.kButton_RU,
        text = A0_37.RU.id or nil
      })
    end
    L1_43 = A0_37.RR
    if L1_43 ~= nil then
      L1_43 = table
      L1_43 = L1_43.insert
      L2_44 = L0_42
      L1_43(L2_44, {
        btn = Pad.kButton_RR,
        text = A0_37.RR.id or nil
      })
    end
    L1_43 = A0_37.RL
    if L1_43 ~= nil then
      L1_43 = table
      L1_43 = L1_43.insert
      L2_44 = L0_42
      L1_43(L2_44, {
        btn = Pad.kButton_RL,
        text = A0_37.RL.id or nil
      })
    end
    L1_43 = A0_37.RD
    if L1_43 ~= nil then
      L1_43 = table
      L1_43 = L1_43.insert
      L2_44 = L0_42
      L1_43(L2_44, {
        btn = Pad.kButton_RD,
        text = A0_37.RD.id or nil
      })
    end
    while true do
      L1_43 = L4_41.active
      if L1_43 ~= true then
        L1_43 = L4_41.cancel
        if L1_43 then
          return
        else
          L1_43 = setDialogActive
          L2_44 = L4_41
          L1_43(L2_44)
        end
        L1_43 = wait
        L1_43()
      end
    end
    L1_43 = false
    while L1_43 == false do
      L2_44 = Player
      L2_44 = L2_44.getAction
      L2_44 = L2_44(L2_44)
      if L2_44 ~= Player.kAction_Jump then
        L2_44 = GameDatabase
        L2_44 = L2_44.get
        L2_44 = L2_44(L2_44, ggd.GlobalSystemFlags__GameOver)
        if not L2_44 then
          L2_44 = HUD
          L2_44 = L2_44.openGesture
          L2_44(L2_44, L0_42)
          L2_44 = nil
          while Player:getAction() ~= Player.kAction_Jump and not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) do
            L2_44 = HUD:updateGesture(L4_41.cancel)
            if L2_44 == HUD.kGestureDecide then
              btn = HUD:getResultGesture()
              if btn == Pad.kButton_RR then
                if A0_37.RR ~= nil and A0_37.RR.func ~= nil then
                  if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                    HUD:disableCostumeChange(true)
                  end
                  A0_37.RR.func()
                  L1_43 = true
                  if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                    HUD:disableCostumeChange(false)
                  end
                  break
                end
              elseif btn == Pad.kButton_RL then
                if A0_37.RL ~= nil and A0_37.RL.func ~= nil then
                  if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                    HUD:disableCostumeChange(true)
                  end
                  A0_37.RL.func()
                  L1_43 = true
                  if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                    HUD:disableCostumeChange(false)
                  end
                  break
                end
              elseif btn == Pad.kButton_RU then
                if A0_37.RU ~= nil and A0_37.RU.func ~= nil then
                  if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                    HUD:disableCostumeChange(true)
                  end
                  A0_37.RU.func()
                  L1_43 = true
                  if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                    HUD:disableCostumeChange(false)
                  end
                  break
                end
              elseif btn == Pad.kButton_RD and A0_37.RD ~= nil and A0_37.RD.func ~= nil then
                if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                  HUD:disableCostumeChange(true)
                end
                A0_37.RD.func()
                L1_43 = true
                if not GameDatabase:get(ggd.Menu__DisableCostumeChange) then
                  HUD:disableCostumeChange(false)
                end
                break
              end
            elseif L2_44 == HUD.kGestureOut then
              if no_funcs ~= nil then
                no_funcs()
              end
              L1_43 = true
              break
            end
            wait()
          end
        end
      end
      L2_44 = wait
      L2_44()
    end
    L2_44 = __gesture_dialog
    L2_44 = L2_44[L3_40]
    if L2_44 ~= nil then
      L2_44 = __gesture_dialog
      L2_44 = L2_44[L3_40]
      L2_44 = L2_44.task
      if L2_44 == L4_41.task then
        L2_44 = __gesture_dialog
        L2_44[L3_40] = nil
      end
    end
    L2_44 = GameDatabase
    L2_44 = L2_44.set
    L2_44(L2_44, ggd.GlobalSystemFlags__ActionDialogActive, false)
    L2_44 = print
    L2_44(" < hud com > " .. L3_40 .. "\227\129\139\227\130\137\229\145\188\227\129\176\227\130\140\227\129\159gesture\227\129\140\231\181\130\228\186\134\227\129\151\227\129\190\227\129\151\227\129\159")
  end)
  __gesture_dialog[L3_40] = L4_41
end
function Fn_gestureActionCancel(A0_45)
  local L1_46
  L1_46 = A0_45 and A0_45 or "global"
  if __gesture_dialog[L1_46] ~= nil then
    __gesture_dialog[L1_46].cancel = true
    __gesture_dialog[L1_46] = nil
    print(" < hud com > " .. L1_46 .. "\227\129\139\227\130\137\229\145\188\227\129\176\227\130\140\227\129\159gesture\227\130\146\229\137\138\233\153\164\228\190\157\233\160\188\227\130\146\229\135\186\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_getGestureActionVisible(A0_47)
  local L1_48, L2_49
  L1_48 = A0_47 and A0_47 or "global"
  L2_49 = __gesture_dialog
  L2_49 = L2_49[L1_48]
  if L2_49 ~= nil then
    L2_49 = __gesture_dialog
    L2_49 = L2_49[L1_48]
    L2_49 = L2_49.active
    return L2_49
  end
  L2_49 = false
  return L2_49
end
function Fn_captionView(A0_50, A1_51, A2_52)
  local L3_53, L4_54, L5_55, L6_56
  L3_53 = A0_50 or "no text"
  L4_54 = A1_51 or 3
  L5_55 = HUD
  L6_56 = L5_55
  L5_55 = L5_55.captionBegin
  L5_55(L6_56, L3_53, L4_54, A2_52)
  L5_55 = g_own
  L6_56 = L5_55
  L5_55 = L5_55.getGameObject
  L5_55 = L5_55(L6_56, "soundManager")
  if L5_55 then
    L6_56 = event_name
    if not L6_56 then
      L6_56 = g_own
      L6_56 = L6_56.getName
      L6_56 = L6_56(L6_56)
    end
    L5_55:sendEvent("request", L6_56, "caption", L3_53)
  end
  return L4_54
end
function Fn_captionViewWait(A0_57, A1_58, A2_59, A3_60)
  local L4_61
  L4_61 = Fn_captionView
  L4_61 = L4_61(A0_57, A1_58, A3_60)
  L4_61 = A2_59 or L4_61
  if L4_61 > 0 then
    waitSeconds(L4_61)
  end
end
function Fn_captionViewEnd()
  HUD:captionEnd()
end
function Fn_isCaptionView(A0_62)
  if HUD:captionGetTextId() == nil then
    return false
  elseif A0_62 then
    if HUD:captionGetTextId() == A0_62 then
      return true
    else
      return false
    end
  end
  return true
end
function Fn_captionViewLock(A0_63, A1_64)
  if A1_64 == nil then
    A1_64 = 3
  end
  if A0_63 == nil then
    A0_63 = "\227\131\134\227\130\173\227\130\185\227\131\136\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\227\130\136\227\128\130"
  end
  if __caption.active == false then
    __caption.active = true
    __caption.text = A0_63
    invokeTask(function()
      local L0_65, L1_66
      L0_65 = HUD
      L1_66 = L0_65
      L0_65 = L0_65.captionBegin
      L0_65(L1_66, A0_63, A1_64)
      L0_65 = g_own
      L1_66 = L0_65
      L0_65 = L0_65.getGameObject
      L0_65 = L0_65(L1_66, "soundManager")
      if L0_65 then
        L1_66 = event_name
        if not L1_66 then
          L1_66 = g_own
          L1_66 = L1_66.getName
          L1_66 = L1_66(L1_66)
        end
        L0_65:sendEvent("request", L1_66, "caption", A0_63)
      end
      L1_66 = waitSeconds
      L1_66(A1_64)
      L1_66 = {}
      L1_66.text = nil
      L1_66.active = false
      __caption = L1_66
    end)
  end
  if __caption.text == A0_63 then
    return true
  end
  return false
end
function Fn_cityBlock(A0_67)
  local L1_68, L2_69
  L1_68 = HUD
  L2_69 = L1_68
  L1_68 = L1_68.placeNameStart
  L1_68(L2_69, A0_67)
  L1_68 = g_own
  L2_69 = L1_68
  L1_68 = L1_68.getGameObject
  L1_68 = L1_68(L2_69, "soundManager")
  if L1_68 then
    L2_69 = event_name
    if not L2_69 then
      L2_69 = g_own
      L2_69 = L2_69.getName
      L2_69 = L2_69(L2_69)
    end
    L1_68:sendEvent("request", L2_69, "city_block", A0_67.section)
  end
end
function Fn_missionView(A0_70, A1_71, A2_72, A3_73)
  local L4_74, L5_75, L6_76, L7_77
  L4_74 = A0_70 or "no text"
  L5_75 = A1_71 or 6
  L6_76 = g_own
  L7_77 = L6_76
  L6_76 = L6_76.getGameObject
  L6_76 = L6_76(L7_77, "soundManager")
  if L6_76 then
    L7_77 = event_name
    if not L7_77 then
      L7_77 = g_own
      L7_77 = L7_77.getName
      L7_77 = L7_77(L7_77)
    end
    L6_76:sendEvent("request", L7_77, "caption", L4_74)
  end
  L7_77 = HUD
  L7_77 = L7_77.setMainMenuObjectParam
  L7_77(L7_77, L4_74)
  if A3_73 ~= true then
    L7_77 = HUD
    L7_77 = L7_77.missionBegin
    L7_77(L7_77, L4_74, L5_75, A2_72)
    return L5_75
  end
  L7_77 = 0
  return L7_77
end
function Fn_missionViewWait(A0_78, A1_79, A2_80, A3_81, A4_82)
  local L5_83
  L5_83 = Fn_missionView
  L5_83 = L5_83(A0_78, A1_79, A3_81, A4_82)
  L5_83 = A2_80 or L5_83
  if L5_83 > 0 then
    waitSeconds(L5_83)
  end
end
function Fn_missionViewEnd()
  HUD:missionEnd()
end
function Fn_missionInfoEnd()
  HUD:setMainMenuObjectParam("")
end
function Fn_countDown(A0_84)
  HUD:countDownStart(A0_84)
  repeat
    wait()
  until HUD:isAnimEndCountDown()
end
function Fn_countDownWithTimer(A0_85)
  HUD:timerSetTextID("ui_hud_counter_timer_01")
  HUD:timerSetMax({
    0,
    59,
    59,
    99
  })
  HUD:timerSetSecond({
    0,
    0,
    0,
    0
  })
  Fn_countDown(A0_85)
  HUD:timerSetVisible(true)
end
function Fn_finish()
  HUD:countDownFinishStart()
  repeat
    wait()
  until HUD:isAnimEndCountDown()
end
Fn_Finish = Fn_finish
function Fn_createRaceArrow(A0_86, A1_87)
  local L2_88, L3_89, L4_90
  L2_88 = nil
  L3_89 = type
  L4_90 = A0_86
  L3_89 = L3_89(L4_90)
  if L3_89 == "string" then
    L3_89 = findGameObject2
    L4_90 = "Node"
    L3_89 = L3_89(L4_90, A0_86)
    L2_88 = L3_89
  else
    L2_88 = A0_86
  end
  L3_89 = createGameObject2
  L4_90 = "MapMarker"
  L3_89 = L3_89(L4_90)
  L4_90 = "arrow_"
  L4_90 = L4_90 .. L2_88:getName()
  L3_89:setName(L4_90)
  L3_89:setAssetName("gui_marker_24")
  if A1_87 == "small" then
    L3_89:setAssetName("gui_marker_26")
  end
  L3_89:setupPattern("default")
  if L2_88 ~= nil then
    L2_88:appendChild(L3_89)
  end
  L3_89:try_init()
  L3_89:waitForReady()
  L3_89:try_start()
  return L3_89
end
function Fn_naviSet(A0_91)
  if A0_91 ~= nil then
    HUD:naviSetActivate(true)
    HUD:naviSetTarget(A0_91)
  end
end
function Fn_naviKill()
  HUD:naviSetActivate(false)
  HUD:naviSetTarget(nil)
  HUD:naviSetPochiDistanceDensity0(0)
  HUD:naviSetPochiDistanceDensity100(2)
end
function Fn_kaiwaDemoView(A0_92, A1_93, A2_94)
  local L3_95, L4_96
  for _FORV_6_ = 0, 150 do
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) ~= false then
      wait()
    end
  end
  if not L3_95 then
  elseif L3_95 then
    L3_95(L4_96, false)
  end
  if L3_95 then
    L3_95:sendEvent("request", L4_96, "kdemo", A0_92, "start")
  end
  L4_96()
  if A2_94 then
    L4_96("Fn_kaiwaDemoView--- pause SE true ", A2_94)
    L4_96(L4_96, A2_94, true)
  end
  L4_96(L4_96, A0_92, A1_93)
  L4_96()
  if L3_95 then
    L3_95:sendEvent("request", L4_96, "kdemo", A0_92, "end")
  end
  if A2_94 then
    L4_96("Fn_kaiwaDemoView--- pauseSE false ", A2_94)
    L4_96(L4_96, A2_94, false)
  end
end
function Fn_kaiwaDemoView2(A0_97, A1_98, A2_99)
  local L3_100, L4_101, L5_102, L6_103
  for L6_103 = 0, 150 do
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) ~= false then
      wait()
    end
  end
  if not L3_100 then
  elseif L3_100 then
    L3_100(L4_101, L5_102)
  end
  if L3_100 then
    L6_103 = L3_100
    L5_102(L6_103, "request", L4_101, "kdemo", A0_97, "start")
  end
  L4_101()
  function L6_103(A0_104)
    print("Enter page=" .. A0_104)
  end
  L5_102.OnEnter = L6_103
  function L6_103(A0_105)
    print("Idle page=" .. A0_105)
  end
  L5_102.OnIdle = L6_103
  function L6_103(A0_106)
    print("Cancel page=" .. A0_106)
  end
  L5_102.OnCancel = L6_103
  function L6_103(A0_107)
    print("Capture page=" .. A0_107)
    invokeSystemTask(function()
      wait(10)
      print("NeedScriptingCapture")
      HUD:menuNeedScriptingCapture()
      if A1_98 then
        wait(10)
        A1_98()
        wait()
      end
      print("script func end")
      wait(10)
      HUD:menuNotifyReadyCapture()
      wait()
      print("Capture finish")
      L4_101 = true
    end)
  end
  L5_102.RequestCapture = L6_103
  function L6_103(A0_108)
    print("WaitCapture page=" .. A0_108)
  end
  L5_102.WaitCapture = L6_103
  L6_103 = HUD
  L6_103 = L6_103.kaiwa
  L6_103(L6_103, A0_97, L5_102, A2_99)
  L6_103 = wait
  L6_103()
  repeat
    L6_103 = wait
    L6_103()
  until L4_101
  L6_103 = Fn_fadein
  L6_103()
  if L3_100 then
    L6_103 = event_name
    if not L6_103 then
      L6_103 = g_own
      L6_103 = L6_103.getName
      L6_103 = L6_103(L6_103)
    end
    L3_100:sendEvent("request", L6_103, "kdemo", A0_97, "end")
  end
end
function setupMarkerBase(A0_109, A1_110, A2_111, A3_112)
  local L4_113, L5_114, L6_115, L7_116, L8_117, L9_118, L10_119, L11_120, L12_121
  L4_113 = {}
  L4_113.hdl = nil
  L4_113.name = nil
  L5_114 = {}
  L5_114.hdl = nil
  L5_114.name = nil
  L6_115 = {}
  L6_115.hdl = nil
  L6_115.name = nil
  L6_115.hdl2 = nil
  L6_115.name2 = nil
  L7_116 = findNodeHandleAndGetName
  L8_117 = A0_109.target
  L9_118 = A0_109.find_type
  L8_117 = L7_116(L8_117, L9_118)
  L4_113.name = L8_117
  L4_113.hdl = L7_116
  L7_116 = L4_113.hdl
  if L7_116 ~= nil then
    L7_116 = replaceSensorName
    L8_117 = L4_113.name
    L7_116 = L7_116(L8_117)
    L5_114.name = L7_116
    L7_116 = replaceMarkerName
    L8_117 = L4_113.name
    L7_116 = L7_116(L8_117)
    L6_115.name = L7_116
    L7_116 = L6_115.name
    L8_117 = "_02"
    L7_116 = L7_116 .. L8_117
    L6_115.name2 = L7_116
    L7_116 = findGameObject2
    L8_117 = "PlayerSensor"
    L9_118 = L5_114.name
    L7_116 = L7_116(L8_117, L9_118)
    if L7_116 ~= nil then
      L8_117 = print
      L9_118 = " < hud com > "
      L10_119 = L5_114.name
      L11_120 = " \227\130\146\228\184\128\229\186\166\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153"
      L9_118 = L9_118 .. L10_119 .. L11_120
      L8_117(L9_118)
      L9_118 = L7_116
      L8_117 = L7_116.setActive
      L10_119 = false
      L8_117(L9_118, L10_119)
      L9_118 = L7_116
      L8_117 = L7_116.try_term
      L8_117(L9_118)
      L7_116 = nil
    end
    L8_117 = findGameObject2
    L9_118 = "MapMarker"
    L10_119 = L6_115.name
    L8_117 = L8_117(L9_118, L10_119)
    if L8_117 ~= nil then
      L9_118 = print
      L10_119 = " < hud com > "
      L11_120 = L6_115.name
      L12_121 = " \227\130\146\228\184\128\229\186\166\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153"
      L10_119 = L10_119 .. L11_120 .. L12_121
      L9_118(L10_119)
      L10_119 = L8_117
      L9_118 = L8_117.setActive
      L11_120 = false
      L9_118(L10_119, L11_120)
      L10_119 = L8_117
      L9_118 = L8_117.try_term
      L9_118(L10_119)
      L8_117 = nil
    end
    L9_118 = findGameObject2
    L10_119 = "MapMarker"
    L11_120 = L6_115.name2
    L9_118 = L9_118(L10_119, L11_120)
    if L9_118 ~= nil then
      L10_119 = print
      L11_120 = " < hud com > "
      L12_121 = L6_115.name2
      L11_120 = L11_120 .. L12_121 .. " \227\130\146\228\184\128\229\186\166\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153"
      L10_119(L11_120)
      L11_120 = L9_118
      L10_119 = L9_118.setActive
      L12_121 = false
      L10_119(L11_120, L12_121)
      L11_120 = L9_118
      L10_119 = L9_118.try_term
      L10_119(L11_120)
      L9_118 = nil
    end
    L10_119 = "pccubesensor2_"
    L11_120 = L4_113.name
    L12_121 = "_OnEnter"
    L10_119 = L10_119 .. L11_120 .. L12_121
    L11_120 = "pccubesensor2_"
    L12_121 = L4_113.name
    L11_120 = L11_120 .. L12_121 .. "_OnLeave"
    L12_121 = _G
    L12_121[L10_119] = function()
      if A1_110.alert_id == "ui_acdialog_alert_01" then
        HUD:talismanSetForceVisible(true, true)
        HUD:enableShortCatTalismanOreList(true)
      end
      Fn_actionDialog(L5_114.name, A1_110.ad_title_id, A1_110.ad_sub_id, A1_110.giude_id, A1_110.alert_id, A2_111, A3_112)
    end
    L12_121 = _G
    L12_121[L11_120] = function()
      if A1_110.alert_id == "ui_acdialog_alert_01" then
        HUD:talismanSetForceVisible(false, true)
        HUD:enableShortCatTalismanOreList(false)
      end
      Fn_actionDialogCancel(L5_114.name)
    end
    L12_121 = createGameObject2
    L12_121 = L12_121("PlayerSensor")
    L5_114.hdl = L12_121
    L12_121 = L5_114.hdl
    L12_121 = L12_121.setName
    L12_121(L12_121, L5_114.name)
    L12_121 = L5_114.hdl
    L12_121 = L12_121.setDetectBehavior
    L12_121(L12_121, 1)
    L12_121 = A0_109.type_cylinder
    if L12_121 then
      L12_121 = L5_114.hdl
      L12_121 = L12_121.addCylinder
      L12_121(L12_121, A0_109.size or Vector(1.5, 1.5, 1.5), 32)
    else
      L12_121 = L5_114.hdl
      L12_121 = L12_121.addBox
      L12_121(L12_121, A0_109.size or Vector(1.5, 1.5, 1.5))
    end
    L12_121 = A0_109.size
    if L12_121 then
      L12_121 = L5_114.hdl
      L12_121 = L12_121.setPos
      L12_121(L12_121, Vector(0, A0_109.size.y, 0))
    else
      L12_121 = L5_114.hdl
      L12_121 = L12_121.setPos
      L12_121(L12_121, Vector(0, 1.5, 0))
    end
    L12_121 = L5_114.hdl
    L12_121 = L12_121.setOnEnter
    L12_121(L12_121, L10_119)
    L12_121 = L5_114.hdl
    L12_121 = L12_121.setOnLeave
    L12_121(L12_121, L11_120)
    L12_121 = L4_113.hdl
    L12_121 = L12_121.appendChild
    L12_121(L12_121, L5_114.hdl)
    L12_121 = A1_110.name
    if L12_121 ~= nil then
      L12_121 = createGameObject2
      L12_121 = L12_121("MapMarker")
      L6_115.hdl = L12_121
      L12_121 = L6_115.hdl
      L12_121 = L12_121.setName
      L12_121(L12_121, L6_115.name)
      L12_121 = L6_115.hdl
      L12_121 = L12_121.setAssetName
      L12_121(L12_121, A1_110.name)
      L12_121 = L6_115.hdl
      L12_121 = L12_121.setupPattern
      L12_121(L12_121, A1_110.pattern or "default")
      L12_121 = L4_113.hdl
      L12_121 = L12_121.appendChild
      L12_121(L12_121, L6_115.hdl)
      L12_121 = A1_110.name2
      if L12_121 ~= nil then
        L12_121 = createGameObject2
        L12_121 = L12_121("MapMarker")
        L6_115.hdl2 = L12_121
        L12_121 = L6_115.hdl2
        L12_121 = L12_121.setName
        L12_121(L12_121, L6_115.name2)
        L12_121 = L6_115.hdl2
        L12_121 = L12_121.setAssetName
        L12_121(L12_121, A1_110.name2)
        L12_121 = L6_115.hdl2
        L12_121 = L12_121.setupPattern
        L12_121(L12_121, A1_110.pattern or "default")
        L12_121 = L4_113.hdl
        L12_121 = L12_121.appendChild
        L12_121(L12_121, L6_115.hdl2)
      end
      L12_121 = A1_110.map_disp
      if L12_121 == true then
        L12_121 = nil
        if L4_113.hdl:getTypeName() == "Puppet" then
          L12_121 = "bn_root"
        end
        if L6_115.hdl2 then
          L6_115.hdl2:setHudParameter(A1_110.name2, A1_110.map_title_id, A1_110.map_sub_id, L12_121)
        else
          L6_115.hdl:setHudParameter(A1_110.name, A1_110.map_title_id, A1_110.map_sub_id, L12_121)
        end
      end
    end
    L12_121 = A1_110.active
    if L12_121 == false then
      L12_121 = L5_114.hdl
      L12_121 = L12_121.setActive
      L12_121(L12_121, false)
      L12_121 = L6_115.hdl
      if L12_121 then
        L12_121 = L6_115.hdl
        L12_121 = L12_121.playOut
        L12_121(L12_121, false)
      end
      L12_121 = L6_115.hdl2
      if L12_121 then
        L12_121 = L6_115.hdl2
        L12_121 = L12_121.playOut
        L12_121(L12_121, false)
      end
    end
    L12_121 = __marker_set
    L12_121 = L12_121[L4_113.name]
    if L12_121 == nil then
      L12_121 = __marker_set
      L12_121[L4_113.name] = {sensor = L5_114, marker = L6_115}
    end
  else
    L7_116 = print
    L8_117 = " < hud com > \227\131\142\227\131\188\227\131\137\227\129\140\229\143\150\229\190\151\227\129\167\227\129\141\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\131\158\227\131\188\227\130\171\227\131\188\227\129\175\228\189\156\230\136\144\227\129\151\227\129\190\227\129\155\227\130\147"
    L7_116(L8_117)
  end
  L7_116 = L5_114.hdl
  L8_117 = L6_115.hdl
  L9_118 = L4_113.hdl
  L10_119 = L6_115.hdl2
  return L7_116, L8_117, L9_118, L10_119
end
function Fn_changeMapMarker(A0_122, A1_123, A2_124)
  local L3_125, L4_126, L5_127, L6_128
  L4_126 = A0_122
  L3_125 = A0_122.getName
  L3_125 = L3_125(L4_126)
  L4_126 = __marker_set
  L4_126 = L4_126[L3_125]
  if L4_126 ~= nil then
    L4_126 = A1_123.name
    if L4_126 ~= nil then
      L4_126 = nil
      L5_127 = __marker_set
      L5_127 = L5_127[L3_125]
      L5_127 = L5_127.sensor
      if L5_127 then
        L5_127 = __marker_set
        L5_127 = L5_127[L3_125]
        L5_127 = L5_127.sensor
        L5_127 = L5_127.hdl
        if L5_127 then
          L5_127 = __marker_set
          L5_127 = L5_127[L3_125]
          L5_127 = L5_127.sensor
          L4_126 = L5_127.hdl
          L6_128 = L4_126
          L5_127 = L4_126.setActive
          L5_127(L6_128, false)
        end
      end
      if L4_126 then
        L5_127 = checkTypeGetName
        L6_128 = L4_126
        L5_127 = L5_127(L6_128)
        L6_128 = __action_dialog
        L6_128 = L6_128[L5_127]
        if L6_128 ~= nil then
          L6_128 = __action_dialog
          L6_128 = L6_128[L5_127]
          L6_128.cancel = true
        end
      end
      L5_127 = {}
      L5_127.hdl = nil
      L5_127.name = nil
      L5_127.hdl2 = nil
      L5_127.name2 = nil
      L6_128 = replaceMarkerName
      L6_128 = L6_128(L3_125)
      L5_127.name = L6_128
      L6_128 = L5_127.name
      L6_128 = L6_128 .. "_02"
      L5_127.name2 = L6_128
      L6_128 = createGameObject2
      L6_128 = L6_128("MapMarker")
      L5_127.hdl = L6_128
      L6_128 = L5_127.hdl
      L6_128 = L6_128.setName
      L6_128(L6_128, L5_127.name)
      L6_128 = L5_127.hdl
      L6_128 = L6_128.setAssetName
      L6_128(L6_128, A1_123.name)
      L6_128 = L5_127.hdl
      L6_128 = L6_128.setupPattern
      L6_128(L6_128, A1_123.pattern or "default")
      L6_128 = A0_122.appendChild
      L6_128(A0_122, L5_127.hdl)
      L6_128 = A1_123.name2
      if L6_128 ~= nil then
        L6_128 = createGameObject2
        L6_128 = L6_128("MapMarker")
        L5_127.hdl2 = L6_128
        L6_128 = L5_127.hdl2
        L6_128 = L6_128.setName
        L6_128(L6_128, L5_127.name2)
        L6_128 = L5_127.hdl2
        L6_128 = L6_128.setAssetName
        L6_128(L6_128, A1_123.name2)
        L6_128 = L5_127.hdl2
        L6_128 = L6_128.setupPattern
        L6_128(L6_128, A1_123.pattern or "default")
        L6_128 = A0_122.appendChild
        L6_128(A0_122, L5_127.hdl2)
      end
      L6_128 = A1_123.map_disp
      if L6_128 == true then
        L6_128 = nil
        if A0_122:getTypeName() == "Puppet" then
          L6_128 = "bn_root"
        end
        if L5_127.hdl2 then
          L5_127.hdl2:setHudParameter(A1_123.name2, A1_123.map_title_id, A1_123.map_sub_id, L6_128)
          L5_127.hdl:playOut()
          L5_127.hdl2:playOut()
        else
          L5_127.hdl:setHudParameter(A1_123.name, A1_123.map_title_id, A1_123.map_sub_id, L6_128)
          L5_127.hdl:playOut()
        end
      end
      L6_128 = __marker_set
      L6_128 = L6_128[L3_125]
      L6_128 = L6_128.marker
      L6_128 = L6_128.hdl
      if A2_124 ~= false then
        if L6_128:getMasterActive() and L6_128:getActive() then
          print(" < hud com > \227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\228\189\156\227\130\138\229\164\137\227\129\136\227\129\167out\227\130\162\227\131\139\227\131\161\227\131\188\227\130\183\227\131\167\227\131\179\227\130\146\229\134\141\231\148\159\227\129\151\227\129\190\227\129\153 : " .. L6_128:getName())
          L6_128:playOut()
          if __marker_set[L3_125].marker.hdl2 then
            __marker_set[L3_125].marker.hdl2:playOut()
          end
          repeat
            if 0 > 60 then
              print(" < hud com > \227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\228\189\156\227\130\138\229\164\137\227\129\136\227\129\167\227\128\129\227\130\162\227\131\139\227\131\161\227\131\188\227\130\183\227\131\167\227\131\179\227\129\174\231\181\130\228\186\134\227\129\174\229\136\164\229\174\154\227\129\140\229\143\150\229\190\151\227\129\167\227\129\141\227\129\154\227\129\171\239\188\145\231\167\146\231\181\140\233\129\142\227\129\151\227\129\159\227\129\174\227\129\167\229\188\183\229\136\182\231\154\132\227\129\171\231\181\130\227\130\143\227\130\138\227\129\190\227\129\153")
              break
            end
            wait()
          until L6_128:isOutEnd()
        else
          print(" < hud com > \227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\228\189\156\227\130\138\229\164\137\227\129\136\227\129\167out\227\130\162\227\131\139\227\131\161\227\131\188\227\130\183\227\131\167\227\131\179\227\130\146\229\134\141\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
        end
      end
      L6_128:try_term()
      if __marker_set[L3_125].marker.hdl2 then
        __marker_set[L3_125].marker.hdl2:try_term()
      end
      if L5_127.hdl2 then
        L5_127.hdl:try_init()
        L5_127.hdl2:try_init()
        L5_127.hdl:waitForReady()
        L5_127.hdl2:waitForReady()
        L5_127.hdl:try_start()
        L5_127.hdl2:try_start()
        wait()
        L5_127.hdl:playIn()
        L5_127.hdl2:playIn()
      else
        L5_127.hdl:try_init()
        L5_127.hdl:waitForReady()
        L5_127.hdl:try_start()
        wait()
        L5_127.hdl:playIn()
      end
      __marker_set[L3_125].marker = L5_127
      if L4_126 ~= nil then
        if L4_126:getPos().y < 100 then
          L4_126:setActive(true)
          L4_126:setPos(Vector(0, 100, 0))
          L4_126:setForceMove()
          wait(3)
          L4_126:setPos(Vector(0, A1_123.sensor_ofs, 0))
          L4_126:setForceMove()
          print(" < hud com > \227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\228\189\156\227\130\138\229\164\137\227\129\136\227\129\167\227\130\187\227\131\179\227\130\181\227\131\188\227\130\146\228\184\138\228\184\139\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
        else
          print(" < hud com > \227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\228\189\156\227\130\138\229\164\137\227\129\136\227\129\167\227\130\187\227\131\179\227\130\181\227\131\188\227\130\146\228\184\138\228\184\139\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147")
        end
      end
    end
  end
end
function Fn_setupGestureAction(A0_129, A1_130, A2_131, A3_132, A4_133)
  local L5_134, L6_135, L7_136, L8_137, L9_138
  L5_134 = {}
  L5_134.hdl = nil
  L5_134.name = nil
  L6_135 = {}
  L6_135.hdl = nil
  L6_135.name = nil
  L7_136 = {}
  L7_136.hdl = nil
  L7_136.name = nil
  L8_137 = findNodeHandleAndGetName
  L9_138 = A0_129.target
  L9_138 = L8_137(L9_138, A0_129.find_type)
  L5_134.name = L9_138
  L5_134.hdl = L8_137
  L8_137 = L5_134.hdl
  if L8_137 ~= nil then
    L8_137 = replaceSensorName
    L9_138 = L5_134.name
    L8_137 = L8_137(L9_138)
    L6_135.name = L8_137
    L8_137 = replaceMarkerName
    L9_138 = L5_134.name
    L8_137 = L8_137(L9_138)
    L7_136.name = L8_137
    L8_137 = "pccubesensor2_"
    L9_138 = L5_134.name
    L8_137 = L8_137 .. L9_138 .. "_OnEnter"
    L9_138 = "pccubesensor2_"
    L9_138 = L9_138 .. L5_134.name .. "_OnLeave"
    _G[L8_137] = function()
      Fn_gestureAction(A1_130, A2_131, L5_134.name)
    end
    _G[L9_138] = function()
      Fn_gestureActionCancel(L5_134.name)
    end
    L6_135.hdl = createGameObject2("PlayerSensor")
    L6_135.hdl:setName(L6_135.name)
    L6_135.hdl:setDetectBehavior(1)
    L6_135.hdl:addBox(A0_129.size or Vector(2, 1.5, 2))
    L6_135.hdl:setPos(Vector(0, 1.5, 0))
    L6_135.hdl:setOnEnter(L8_137)
    L6_135.hdl:setOnLeave(L9_138)
    if A3_132 ~= nil then
      L6_135.hdl:setActive(A3_132)
    end
    L5_134.hdl:appendChild(L6_135.hdl)
    if not A4_133 then
      L7_136.hdl = createGameObject2("MapMarker")
      L7_136.hdl:setName(L7_136.name)
      L7_136.hdl:setAssetName("gui_marker_20")
      L7_136.hdl:setupPattern(A0_129.pattern or "A")
      if A3_132 ~= nil then
        L7_136.hdl:setActive(A3_132)
      end
      L5_134.hdl:appendChild(L7_136.hdl)
    end
    __gesture_marker_set[L5_134.name] = {sensor = L6_135, marker = L7_136}
  end
  L8_137 = L6_135.hdl
  L9_138 = L7_136.hdl
  return L8_137, L9_138
end
function Fn_setGestureAction(A0_139, A1_140)
  local L2_141
  L2_141 = {}
  L2_141.hdl = nil
  L2_141.name = nil
  L2_141.hdl, L2_141.name = findNodeHandleAndGetName(A0_139, "Node")
  if __gesture_marker_set and __gesture_marker_set[L2_141.name] then
    if __gesture_marker_set[L2_141.name].sensor.hdl then
      __gesture_marker_set[L2_141.name].sensor.hdl:setActive(A1_140)
    end
    if __gesture_marker_set[L2_141.name].marker.hdl then
      if A1_140 then
        __gesture_marker_set[L2_141.name].marker.hdl:playIn()
      else
        __gesture_marker_set[L2_141.name].marker.hdl:playOut()
      end
    end
  end
end
function Fn_setSimpleMaker(A0_142, A1_143, A2_144, A3_145, A4_146)
  local L5_147, L6_148
  L5_147 = {}
  L5_147.target = A0_142
  L5_147.size = A4_146
  L6_148 = {}
  L6_148.name = "gui_marker_23"
  L6_148.ad_title_id = A1_143.ad_main
  L6_148.ad_sub_id = A1_143.ad_sub
  L6_148.map_title_id = A1_143.map_main
  L6_148.map_sub_id = A1_143.map_sub
  L6_148.giude_id = A1_143.key_guide
  L6_148.map_disp = false
  return setupMarkerBase(L5_147, L6_148, A2_144, A3_145)
end
function Fn_setKaiwaDemo(A0_149, A1_150, A2_151, A3_152, A4_153, A5_154, A6_155, A7_156, A8_157, A9_158)
  local L10_159, L11_160, L12_161
  function L10_159()
    if A8_157 then
      A8_157()
    end
    Fn_kaiwaDemoView(A1_150)
    if A2_151 then
      A2_151()
    end
    if A3_152 == true then
      Fn_disableKaiwaDemo(A0_149)
    end
  end
  L11_160 = {}
  L11_160.target = A0_149
  L12_161 = A5_154 or "Puppet"
  L11_160.find_type = L12_161
  L12_161 = {}
  L12_161.name = A4_153 or "gui_marker_07"
  if A4_153 ~= nil or not ("ui_acdialog_main_" .. A1_150) then
  end
  L12_161.ad_title_id = "ui_acdialog_main_" .. tostring(A7_156)
  L12_161.ad_sub_id = "ui_acdialog_sub_03"
  if A4_153 ~= nil or not ("ui_map_msinfo_main_" .. A1_150) then
  end
  L12_161.map_title_id = "ui_map_msinfo_main_" .. tostring(A7_156)
  L12_161.map_sub_id = "ui_map_msinfo_header_03"
  L12_161.giude_id = A9_158 or "ui_keyguide_ac_02"
  L12_161.map_disp = true
  L12_161.pattern = A6_155 or "A"
  return setupMarkerBase(L11_160, L12_161, L10_159)
end
function Fn_changeKaiwaDemo(A0_162, A1_163, A2_164, A3_165, A4_166, A5_167, A6_168)
  local L7_169, L8_170, L9_171, L10_172
  function L7_169()
    if A6_168 ~= nil then
      A6_168()
    end
    Fn_kaiwaDemoView(A1_163)
    if A2_164 ~= nil then
      A2_164()
    end
    if A3_165 == true then
      Fn_disableKaiwaDemo(A0_162)
    end
  end
  L8_170 = {}
  L8_170.hdl = nil
  L8_170.name = nil
  L9_171 = {}
  L9_171.hdl = nil
  L9_171.name = nil
  L10_172 = {}
  L10_172.name = "gui_marker_07"
  if A4_166 ~= nil or not ("ui_acdialog_main_" .. A1_163) then
  end
  L10_172.ad_title_id = "ui_acdialog_main_" .. A4_166
  L10_172.ad_sub_id = "ui_acdialog_sub_03"
  if A4_166 ~= nil or not ("ui_map_msinfo_main_" .. A1_163) then
  end
  L10_172.map_title_id = "ui_map_msinfo_main_" .. A4_166
  L10_172.map_sub_id = "ui_map_msinfo_header_03"
  L10_172.giude_id = "ui_keyguide_ac_02"
  L10_172.map_disp = true
  L10_172.pattern = A5_167 or "A"
  L8_170.hdl, L8_170.name = findNodeHandleAndGetName(A0_162, "Puppet")
  L9_171.name = replaceSensorName(L8_170.name)
  marker_name = replaceMarkerName(L8_170.name)
  _G["pccubesensor2_" .. L8_170.name .. "_OnEnter"] = function()
    Fn_actionDialog(L9_171.name, L10_172.ad_title_id, L10_172.ad_sub_id, L10_172.giude_id, nil, L7_169)
  end
  if findGameObject2("MapMarker", marker_name) then
    findGameObject2("MapMarker", marker_name):setActive(false)
    findGameObject2("MapMarker", marker_name):setHudParameter(L10_172.name, L10_172.map_title_id, L10_172.map_sub_id, "bn_root")
    findGameObject2("MapMarker", marker_name):setActive(true)
  end
end
function Fn_enableKaiwaDemo(A0_173, A1_174)
  local L2_175, L3_176
  L2_175 = {}
  L2_175.hdl = nil
  L2_175.name = nil
  L3_176 = findNodeHandleAndGetName
  L2_175.name, L3_176 = A0_173, L3_176(A0_173, A1_174 or "Puppet")
  L2_175.hdl = L3_176
  L3_176 = __marker_set
  L3_176 = L3_176[L2_175.name]
  if L3_176 ~= nil then
    L3_176 = __marker_set
    L3_176 = L3_176[L2_175.name]
    L3_176 = L3_176.sensor
    L3_176 = L3_176.hdl
    L3_176 = L3_176.setActive
    L3_176(L3_176, true)
    L3_176 = __marker_set
    L3_176 = L3_176[L2_175.name]
    L3_176 = L3_176.marker
    L3_176 = L3_176.hdl
    L3_176 = L3_176.playIn
    L3_176(L3_176)
  else
    L3_176 = checkTypeGetName
    L3_176 = L3_176(A0_173)
    if findGameObject2("PlayerSensor", replaceSensorName(L3_176)) ~= nil then
      findGameObject2("PlayerSensor", replaceSensorName(L3_176)):setActive(true)
    end
    if findGameObject2("MapMarker", replaceMarkerName(L3_176)) ~= nil then
      findGameObject2("MapMarker", replaceMarkerName(L3_176)):playIn()
    end
  end
end
function Fn_disableKaiwaDemo(A0_177)
  local L1_178, L2_179
  L1_178 = {}
  L1_178.hdl = nil
  L1_178.name = nil
  L2_179 = findNodeHandleAndGetName
  L1_178.name, L2_179 = A0_177, L2_179(A0_177, "Puppet")
  L1_178.hdl = L2_179
  L2_179 = __marker_set
  if L2_179 then
    L2_179 = __marker_set
    L2_179 = L2_179[L1_178.name]
    if L2_179 ~= nil then
      L2_179 = Fn_actionDialogCancel
      L2_179(__marker_set[L1_178.name].sensor.hdl)
      L2_179 = __marker_set
      L2_179 = L2_179[L1_178.name]
      L2_179 = L2_179.sensor
      L2_179 = L2_179.hdl
      L2_179 = L2_179.setActive
      L2_179(L2_179, false)
      L2_179 = __marker_set
      L2_179 = L2_179[L1_178.name]
      L2_179 = L2_179.marker
      L2_179 = L2_179.hdl
      L2_179 = L2_179.playOut
      L2_179(L2_179)
    end
  else
    L2_179 = checkTypeGetName
    L2_179 = L2_179(A0_177)
    if findGameObject2("PlayerSensor", replaceSensorName(L2_179)) ~= nil then
      findGameObject2("PlayerSensor", replaceSensorName(L2_179)):setActive(false)
    end
    if findGameObject2("MapMarker", replaceMarkerName(L2_179)) ~= nil then
      findGameObject2("MapMarker", replaceMarkerName(L2_179)):playOut()
    end
  end
end
function Fn_disableMarkerSet(A0_180, A1_181)
  if __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")] ~= nil then
    __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")].sensor.hdl:setActive(false)
    __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")].sensor.hdl:try_term()
    if __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")].marker.hdl and A1_181 ~= false then
      __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")].marker.hdl:playOut()
      repeat
        wait()
      until __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")].marker.hdl:isOutEnd()
    end
    __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")].marker.hdl:try_term()
    __marker_set[findNodeHandleAndGetName(A0_180, "Puppet")] = {}
  end
end
function getMarkerHandle(A0_182)
  local L1_183, L2_184
  L1_183, L2_184 = nil, nil
  if __marker_set[findNodeHandleAndGetName(A0_182, "Puppet")] ~= nil then
    L1_183 = __marker_set[findNodeHandleAndGetName(A0_182, "Puppet")].marker.hdl
    L2_184 = __marker_set[findNodeHandleAndGetName(A0_182, "Puppet")].marker.hdl2
  end
  return L1_183, L2_184
end
function Fn_setLivelyIcon(A0_185, A1_186, A2_187)
  local L3_188, L4_189, L5_190
  if A0_185 ~= nil then
    L4_189 = A0_185
    L3_188 = A0_185.getName
    L3_188 = L3_188(L4_189)
    L4_189 = replaceMarkerName
    L5_190 = L3_188
    L4_189 = L4_189(L5_190)
    L5_190 = findGameObject2
    L5_190 = L5_190("MapMarker", L4_189)
    if L5_190 ~= nil then
      if A1_186 == true then
        L5_190:playIn()
      else
        L5_190:playOut()
      end
    else
      L5_190 = createGameObject2("MapMarker")
      L5_190:setName(L4_189)
      L5_190:setAssetName("gui_marker_20")
      L5_190:setupPattern(A2_187 or "A")
      L5_190:try_init()
      L5_190:waitForReady()
      L5_190:try_start()
      A0_185:appendChild(L5_190)
      L5_190:setActive(true)
    end
  end
end
function Fn_activeLivelyAction(A0_191, A1_192)
  local L2_193
  L2_193 = {}
  L2_193.hdl = nil
  L2_193.name = nil
  L2_193.hdl, L2_193.name = findNodeHandleAndGetName(A0_191, "Puppet")
  if __gesture_marker_set[L2_193.name] ~= nil then
    __gesture_marker_set[L2_193.name].sensor.hdl:setActive(A1_192)
    if __gesture_marker_set[L2_193.name].marker.hdl then
      __gesture_marker_set[L2_193.name].marker.hdl:setActive(A1_192)
    end
  end
end
function Fn_fadein(A0_194, A1_195)
  HUD:fadein(A0_194 or 1)
  if A1_195 == false then
    return
  end
  while not HUD:faderStability() do
    wait()
  end
end
function Fn_blackout(A0_196)
  HUD:blackout(A0_196 or 1)
  while not HUD:faderStability() do
    wait()
  end
end
function Fn_whiteout(A0_197)
  HUD:whiteout(A0_197 or 1)
  while not HUD:faderStability() do
    wait()
  end
end
function Fn_sceneConversion(A0_198, A1_199)
  Fn_userCtrlAllOff()
  Fn_blackout()
  if A0_198 ~= nil then
    Fn_resetPcPos(A0_198)
  end
  if A1_199 ~= nil then
    A1_199()
  end
  Fn_fadein()
  Fn_userCtrlOn()
end
function Fn_sideMissionStartView(A0_200)
  if A0_200 and A0_200.view then
    Fn_infoView(A0_200)
    A0_200.mission_target = {
      before = function()
        Fn_userCtrlOn()
      end
    }
    Fn_missionTitleView(A0_200)
    Fn_missionTargetView(A0_200)
    Fn_gamePreviewView(A0_200)
    waitSeconds(4)
  end
end
function Fn_TutorialStartView(A0_201)
  Fn_missionTitleView(A0_201)
  Fn_missionTargetView(A0_201)
end
function Fn_infoView(A0_202)
  if A0_202.info and A0_202.info.before then
    A0_202.info.before()
  end
  if A0_202.view.info then
    waitSeconds(0.3)
    HUD:info(A0_202.view.info, true, 15)
  end
  if A0_202.info and A0_202.info.after then
    A0_202.info.after()
  end
end
function Fn_missionTitleView(A0_203)
  if A0_203.side_mission_title and A0_203.side_mission_title.before then
    A0_203.side_mission_title.before()
  end
  if A0_203.view.side_mission_title and A0_203.view.side_mission_title == true then
    Fn_sideMissionTitle()
  end
  if A0_203.side_mission_title and A0_203.side_mission_title.after then
    A0_203.side_mission_title.after()
  end
end
function Fn_missionTargetView(A0_204)
  if A0_204.mission_target and A0_204.mission_target.before then
    A0_204.mission_target.before()
  end
  if A0_204.view.mission_target then
    waitSeconds(0.3)
    Fn_missionView(A0_204.view.mission_target, 10)
    waitSeconds(0.3)
  end
  if A0_204.mission_target and A0_204.mission_target.after then
    A0_204.mission_target.after()
  end
end
function Fn_gamePreviewView(A0_205)
  if A0_205.in_game_preview and A0_205.in_game_preview.before then
    A0_205.in_game_preview.before()
  end
  if A0_205.view.in_game_preview then
    HUD:inGamePreviewCreate(A0_205.view.in_game_preview)
    while HUD:inGamePreviewIsLoading() do
      wait()
    end
    HUD:inGamePreviewFadeIn()
    while HUD:inGamePreviewIsLarge() do
      wait()
    end
  end
  if A0_205.in_game_preview and A0_205.in_game_preview.after then
    A0_205.in_game_preview.after()
  end
end
function Fn_digoutResultForMission()
  local L0_206, L1_207, L2_208, L3_209
  for L3_209 = 0, 98 do
    if GlobalGem:getTalismanOreInfo(L3_209) ~= nil then
      HUD:menuOpen("DigoutResult", "noname")
      wait()
      break
    end
  end
end
function Fn_disableCostumeChange(A0_210)
  HUD:disableCostumeChange(A0_210)
  GameDatabase:set(ggd.Menu__DisableCostumeChange, A0_210)
  print("\227\130\179\227\130\185\227\131\129\227\131\165\227\131\188\227\131\160\229\164\137\230\155\180\227\131\149\227\131\169\227\130\176", GameDatabase:get(ggd.Menu__DisableCostumeChange))
end
