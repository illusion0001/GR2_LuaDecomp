local L1_1
L0_0 = {}
__tb_table = L0_0
__tb_active = true
function L0_0(A0_2)
  local L1_3
  if A0_2 == "po_a_root" then
    L1_3 = 1
    return L1_3
  elseif A0_2 == "bu_d_root" then
    L1_3 = 1
    return L1_3
  elseif A0_2 == "ve_crane_root" then
    L1_3 = 1
    return L1_3
  elseif A0_2 == "ve_vogo_root" then
    L1_3 = 1
    return L1_3
  elseif A0_2 == "lo_a_root" then
    L1_3 = 2
    return L1_3
  elseif A0_2 == "mi_a_root" then
    L1_3 = 3
    return L1_3
  elseif A0_2 == "up_a_root" then
    L1_3 = 4
    return L1_3
  elseif A0_2 == "ar_a_root" then
    L1_3 = 4
    return L1_3
  elseif A0_2 == "go_a_root" then
    L1_3 = 4
    return L1_3
  elseif A0_2 == "dt_a_root" then
    L1_3 = 5
    return L1_3
  elseif A0_2 == "g1_crane_pd_01" then
    L1_3 = 5
    return L1_3
  elseif A0_2 == "cc_a_root" then
    L1_3 = 6
    return L1_3
  elseif A0_2 == "ed_a_root" then
    L1_3 = 7
    return L1_3
  elseif A0_2 == "id_a_root" then
    L1_3 = 8
    return L1_3
  end
  L1_3 = nil
  return L1_3
end
_getAreaNameToId = L0_0
function L0_0(A0_4)
  local L1_5
  if A0_4 == 1 then
    L1_5 = "po_a_root"
    return L1_5
  elseif A0_4 == 2 then
    L1_5 = "lo_a_root"
    return L1_5
  elseif A0_4 == 3 then
    L1_5 = "mi_a_root"
    return L1_5
  elseif A0_4 == 4 then
    L1_5 = "up_a_root"
    return L1_5
  elseif A0_4 == 5 then
    L1_5 = "dt_a_root"
    return L1_5
  elseif A0_4 == 6 then
    L1_5 = "cc_a_root"
    return L1_5
  elseif A0_4 == 7 then
    L1_5 = "ed_a_root"
    return L1_5
  elseif A0_4 == 8 then
    L1_5 = "id_a_root"
    return L1_5
  end
  L1_5 = nil
  return L1_5
end
_getIdToAreaName = L0_0
function L0_0(A0_6)
  local L1_7
  L1_7 = A0_6.getTypeName
  L1_7 = L1_7(A0_6)
  if L1_7 == "Area" then
    L1_7 = string
    L1_7 = L1_7.match
    L1_7 = L1_7(A0_6:getName(), "_root")
    if L1_7 ~= nil then
      return A0_6
    end
  end
  L1_7 = A0_6.getParent
  L1_7 = L1_7(A0_6)
  if L1_7 == nil then
    return nil
  end
  return _findUpAreaRoot(L1_7)
end
_findUpAreaRoot = L0_0
function L0_0(A0_8)
  local L1_9
  L1_9 = A0_8.getTypeName
  L1_9 = L1_9(A0_8)
  if L1_9 == "Area" then
    L1_9 = string
    L1_9 = L1_9.find
    L1_9 = L1_9(A0_8:getName(), "_lod")
    if L1_9 == nil then
      return A0_8
    end
  end
  L1_9 = A0_8.getParent
  L1_9 = L1_9(A0_8)
  if L1_9 == nil then
    return nil
  end
  return _findUpArea(L1_9)
end
_findUpArea = L0_0
function L0_0(A0_10, A1_11, A2_12)
  local L3_13, L4_14, L5_15, L6_16, L7_17
  L3_13 = 1
  L4_14 = 1
  L5_15 = {}
  while true do
    L6_16 = A0_10
    L7_17 = string
    L7_17 = L7_17.format
    L7_17 = L7_17("%03d", L4_14)
    L6_16 = L6_16 .. L7_17
    L7_17 = findGameObject2
    L7_17 = L7_17("Node", L6_16)
    if L7_17 ~= nil then
      if A2_12 and A2_12 > A1_11:DistanceTo(L7_17:getWorldPos()) then
        print(" [ net com ] " .. L7_17:getName() .. " \227\129\140 " .. tostring(A2_12) .. "\228\187\165\228\184\139\227\129\170\227\129\174\227\129\167\227\131\170\227\130\185\227\131\136\227\129\171\232\191\189\229\138\160\227\129\151\227\129\190\227\129\155\227\130\147")
      end
      if false then
        L5_15[L3_13] = {
          name = L6_16,
          hdl = L7_17,
          area = _findUpArea(L7_17),
          dist = A1_11:DistanceTo(L7_17:getWorldPos())
        }
        L3_13 = L3_13 + 1
      end
      L4_14 = L4_14 + 1
    end
  end
  L6_16 = #L5_15
  if L6_16 > 0 then
    return L5_15
  end
  L6_16 = nil
  return L6_16
end
_findNodeTable = L0_0
function L0_0(A0_18)
  local L1_19, L2_20, L3_21, L4_22
  L1_19 = findGameObject2
  L2_20 = "Node"
  L3_21 = A0_18
  L1_19 = L1_19(L2_20, L3_21)
  if not L1_19 then
    L2_20 = nil
    return L2_20
  end
  L2_20 = _findUpAreaRoot
  L3_21 = L1_19
  L2_20 = L2_20(L3_21)
  if L2_20 then
    L3_21 = _getAreaNameToId
    L4_22 = L2_20.getName
    L4_22 = L4_22(L2_20)
    L3_21 = L3_21(L4_22, L4_22(L2_20))
    L4_22 = {}
    if L3_21 then
      L4_22 = _findNodeTable("locator2_tg_" .. L3_21, L1_19:getWorldPos())
    end
    if L4_22 and #L4_22 > 0 then
      table.sort(L4_22, function(A0_23, A1_24)
        return A0_23.dist < A1_24.dist
      end)
      return L4_22[RandI(1, 5)].hdl, L4_22[RandI(1, 5)].area
    end
  end
  L3_21 = false
  return L3_21
end
_findNearNode = L0_0
function L0_0(A0_25)
  local L1_26, L2_27
  L1_26 = print
  L2_27 = " [ net com ]_findTreasureBoxNodes"
  L1_26(L2_27)
  if A0_25 then
    L1_26 = _getAreaNameToId
    L2_27 = A0_25
    L1_26 = L1_26(L2_27)
    L2_27 = {}
    if L1_26 then
      L2_27 = _findNodeTable("locator2_tb_" .. L1_26, Fn_getPlayerWorldPos(), 8)
    end
    if L2_27 and #L2_27 > 0 then
      return L2_27
    end
  end
  L1_26 = false
  return L1_26
end
findTreasureBoxNodes = L0_0
function L0_0(A0_28, A1_29, A2_30, A3_31, A4_32)
  local L5_33, L6_34, L7_35, L8_36, L9_37, L10_38
  L5_33 = "sensor_"
  L6_34 = A0_28
  L5_33 = L5_33 .. L6_34
  L6_34 = "marker_"
  L7_35 = A0_28
  L6_34 = L6_34 .. L7_35
  L7_35 = L5_33
  L8_36 = "_OnEnter"
  L7_35 = L7_35 .. L8_36
  L8_36 = L5_33
  L9_37 = "_OnLeave"
  L8_36 = L8_36 .. L9_37
  L9_37 = _G
  function L10_38(A0_39)
    Fn_actionDialog(A0_39, A3_31, "ui_acdialog_sub_06", "ui_keyguide_ac_01", nil, A2_30)
  end
  L9_37[L7_35] = L10_38
  L9_37 = _G
  function L10_38(A0_40)
    Fn_actionDialogCancel(A0_40)
  end
  L9_37[L8_36] = L10_38
  L9_37 = createGameObject2
  L10_38 = "PlayerSensor"
  L9_37 = L9_37(L10_38)
  L10_38 = L9_37.setName
  L10_38(L9_37, L5_33)
  L10_38 = L9_37.setDetectBehavior
  L10_38(L9_37, 1)
  L10_38 = L9_37.addBox
  L10_38(L9_37, Vector(1.5, 1.5, 1.5))
  L10_38 = L9_37.setPos
  L10_38(L9_37, Vector(0, 1.5, 0))
  L10_38 = L9_37.setOnEnter
  L10_38(L9_37, L7_35)
  L10_38 = L9_37.setOnLeave
  L10_38(L9_37, L8_36)
  L10_38 = nil
  if A4_32 then
    L10_38 = createGameObject2("MapMarker")
    L10_38:setName(L6_34)
    L10_38:setAssetName("gui_marker_11")
    L10_38:setHudParameter("gui_marker_11", "ui_map_msinfo_treasure", "ui_map_msinfo_header_11", A1_29)
    L10_38:setupPattern("A")
  end
  return L9_37, L10_38
end
_createNetworkMaker = L0_0
function L0_0(A0_41, A1_42, A2_43, A3_44)
  local L4_45
  L4_45 = createGameObject2
  L4_45 = L4_45("GhostPuppet")
  L4_45:setName(A0_41)
  L4_45:setAssetName(A1_42)
  L4_45:setGhostType(GhostPuppet.kGhostType_RandomAnim)
  if A3_44 ~= nil then
    L4_45:addRandomAnimNameTbl(A3_44)
  end
  return L4_45, nil
end
_createNetworkGhost = L0_0
function L0_0()
  local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51, L6_52
  L0_46 = HUD
  L1_47 = L0_46
  L0_46 = L0_46.resetTPGhost
  L0_46(L1_47)
  L0_46 = wait
  L0_46()
  L0_46 = GameDatabase
  L1_47 = L0_46
  L0_46 = L0_46.get
  L2_48 = ggd
  L2_48 = L2_48.Savedata__EventManageFlags__ClearEpisodeNum
  L0_46 = L0_46(L1_47, L2_48)
  if L0_46 < 12 then
    L1_47 = 4
  else
    L1_47 = L1_47 or 8
  end
  L2_48 = nil
  for L6_52 = 1, L1_47 do
    L2_48 = _getIdToAreaName(L6_52)
    if L2_48 then
      HUD:downloadAreaInfo(L6_52)
    end
  end
end
downloadNetworkData = L0_0
function L0_0(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60
  L1_54 = __tb_table
  L1_54 = L1_54[A0_53]
  if L1_54 == nil then
    L1_54 = HUD
    L2_55 = L1_54
    L1_54 = L1_54.getTreasureInfo
    L3_56 = A0_53
    L1_54 = L1_54(L2_55, L3_56)
    L2_55 = _findNearNode
    L3_56 = L1_54.locater
    L2_55 = L2_55(L3_56)
    if L2_55 then
      function L3_56()
        local L0_61, L1_62, L2_63
        L0_61 = HUD
        L1_62 = L0_61
        L0_61 = L0_61.treasureStartOpen
        L2_63 = A0_53
        L0_61(L1_62, L2_63)
        L0_61 = wait
        L0_61()
        L0_61 = HUD
        L1_62 = L0_61
        L0_61 = L0_61.treasureStartSelected
        L0_61 = L0_61(L1_62)
        L1_62 = HUD
        L1_62 = L1_62.kTreasureStartButton_Start
        if L0_61 == L1_62 then
          L1_62 = print
          L2_63 = "\229\174\157\230\142\162\227\129\151\233\150\139\229\167\139"
          L1_62(L2_63)
          L1_62 = _getIdToAreaName
          L2_63 = A0_53
          L1_62 = L1_62(L2_63)
          L2_63 = GameDatabase
          L2_63 = L2_63.set
          L2_63(L2_63, ggd.Savedata__TreasureFlags__Network__AreaId, A0_53)
          L2_63 = GameDatabase
          L2_63 = L2_63.set
          L2_63(L2_63, ggd.Savedata__TreasureFlags__Network__TBox, L1_54.locater)
          L2_63 = GameDatabase
          L2_63 = L2_63.set
          L2_63(L2_63, ggd.Savedata__TreasureFlags__Network__TGhost, L2_55:getName())
          L2_63 = GameDatabase
          L2_63 = L2_63.set
          L2_63(L2_63, ggd.Savedata__TreasureFlags__Network__IsMenu, false)
          L2_63 = GameDatabase
          L2_63 = L2_63.get
          L2_63 = L2_63(L2_63, ggd.Savedata__EventManageFlags__CurrentBgSet)
          Fn_setKeepPlayerPos()
          Fn_setNextMissionFlag("treasure_" .. L2_63)
          Fn_nextMission()
          Fn_exitSandbox()
        else
          L1_62 = HUD
          L1_62 = L1_62.kTreasureStartButton_Back
          if L0_61 == L1_62 then
            L1_62 = print
            L2_63 = "select back"
            L1_62(L2_63)
          end
        end
      end
      L4_57 = print
      L5_58 = " treasure ghost node name : "
      L7_60 = L2_55
      L6_59 = L2_55.getName
      L6_59 = L6_59(L7_60)
      L5_58 = L5_58 .. L6_59
      L4_57(L5_58)
      L4_57 = print
      L5_58 = " treasure ghost parent    : "
      L6_59 = tostring
      L7_60 = L2_55.getParent
      L7_60 = L7_60(L2_55)
      L6_59 = L6_59(L7_60, L7_60(L2_55))
      L5_58 = L5_58 .. L6_59
      L4_57(L5_58)
      L4_57 = _createNetworkGhost
      L5_58 = L1_54.onlineId
      L6_59 = "ghost03"
      L7_60 = HUD
      L7_60 = L7_60.kGhostColor_Yellow
      L5_58 = L4_57(L5_58, L6_59, L7_60, {
        {anim_name = "stay"}
      })
      L6_59 = _createNetworkMaker
      L7_60 = "tr_"
      L7_60 = L7_60 .. L1_54.locater
      L7_60 = L6_59(L7_60, L1_54.onlineId, L3_56, "ui_treasure_start_header", true)
      L2_55:appendChild(L4_57)
      L2_55:appendChild(L6_59)
      L2_55:appendChild(L7_60)
      L4_57:try_init()
      L6_59:try_init()
      L7_60:try_init()
      if not __tb_active then
        L4_57:setActive(false)
        L6_59:setActive(false)
        L7_60:setActive(false)
        print(" treasure ghost " .. L4_57:getName() .. " \227\129\175\228\189\156\230\136\144\227\129\151\227\129\190\227\129\153\227\129\140\227\128\129\233\135\141\229\138\155\229\181\144\231\153\186\231\148\159\228\184\173\227\129\167Active\227\129\171\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147")
      end
      L4_57:waitForReadyAsync(function(A0_64)
        if __tb_table[A0_53] then
          HUD:createGhostMarker({
            id = L1_54.onlineId,
            obj = L4_57,
            joint = "bn_root",
            color = color
          }):setActive(false)
          __tb_table[A0_53].marker = HUD:createGhostMarker({
            id = L1_54.onlineId,
            obj = L4_57,
            joint = "bn_root",
            color = color
          })
        end
        A0_64:try_start()
        A0_64:setFade(0, 1, 1.5)
        A0_64:play()
        if __tb_active and __tb_table[A0_53].marker then
          __tb_table[A0_53].marker:setActive(true)
        end
      end)
      L6_59:waitForReadyAsync(function(A0_65)
        A0_65:try_start()
      end)
      L7_60:waitForReadyAsync(function(A0_66)
        A0_66:try_start()
      end)
      __tb_table[A0_53] = {
        node = L2_55,
        ghost = L4_57,
        sensor = L6_59,
        icon = L7_60,
        marker = L5_58,
        info = L1_54
      }
    else
    end
  else
  end
end
generateTreasure = L0_0
function L0_0(A0_67)
  if __tb_table[A0_67] then
    invokeTask(deleteTreasureGhost, __tb_table[A0_67].ghost)
    __tb_table[A0_67].ghost = nil
    invokeTask(function()
      Fn_actionDialogCancel(__tb_table[A0_67].sensor)
      __tb_table[A0_67].sensor:try_term()
      __tb_table[A0_67].icon:try_term()
      __tb_table[A0_67].marker:del()
      wait()
      __tb_table[A0_67] = nil
    end)
  end
end
deleteTreasure = L0_0
function L0_0(A0_68)
  A0_68:setFade(1, 0, 1.5)
  while not A0_68:isFadeEnd() do
    wait()
  end
  A0_68:try_term()
end
deleteTreasureGhost = L0_0
function L0_0(A0_69)
  __tb_active = A0_69
  if __tb_table then
    for _FORV_4_, _FORV_5_ in pairs(__tb_table) do
      if _FORV_5_.ghost and not _FORV_5_.ghost:isStopped() then
        _FORV_5_.ghost:setActive(A0_69)
      end
      if _FORV_5_.sensor and not _FORV_5_.sensor:isStopped() then
        if A0_69 == false then
          Fn_actionDialogCancel(_FORV_5_.sensor)
        end
        _FORV_5_.sensor:setActive(A0_69)
      end
      if _FORV_5_.icon and not _FORV_5_.icon:isStopped() then
        _FORV_5_.icon:setActive(A0_69)
      end
      if _FORV_5_.marker then
        _FORV_5_.marker:setActive(A0_69)
      end
    end
  end
end
setTreasureGhostActive = L0_0
function L0_0(A0_70)
  local L1_71, L2_72, L3_73
  L1_71 = nil
  L2_72 = HUD
  L3_73 = L2_72
  L2_72 = L2_72.fadeout
  L2_72(L3_73, 0.5)
  L2_72 = __tb_table
  L2_72 = L2_72[A0_70]
  if L2_72 then
    L2_72 = __tb_table
    L2_72 = L2_72[A0_70]
    L1_71 = L2_72.info
  end
  if L1_71 == nil then
    L2_72 = HUD
    L3_73 = L2_72
    L2_72 = L2_72.getTreasureInfo
    L2_72 = L2_72(L3_73, A0_70)
    L1_71 = L2_72
  end
  if L1_71 then
    L2_72 = L1_71.locater
    if L2_72 then
      L2_72 = L1_71.locater
      if L2_72 ~= "" then
        L2_72 = GameDatabase
        L3_73 = L2_72
        L2_72 = L2_72.set
        L2_72(L3_73, ggd.Savedata__TreasureFlags__Network__AreaId, A0_70)
        L2_72 = GameDatabase
        L3_73 = L2_72
        L2_72 = L2_72.set
        L2_72(L3_73, ggd.Savedata__TreasureFlags__Network__TBox, L1_71.locater)
        L2_72 = GameDatabase
        L3_73 = L2_72
        L2_72 = L2_72.set
        L2_72(L3_73, ggd.Savedata__TreasureFlags__Network__TGhost, "None")
        L2_72 = GameDatabase
        L3_73 = L2_72
        L2_72 = L2_72.set
        L2_72(L3_73, ggd.Savedata__TreasureFlags__Network__IsMenu, true)
        L2_72 = GameDatabase
        L3_73 = L2_72
        L2_72 = L2_72.get
        L2_72 = L2_72(L3_73, ggd.Savedata__EventManageFlags__ClearEpisodeNum)
        L3_73 = nil
        if L2_72 < 21 then
          if A0_70 < 5 then
            L3_73 = "treasure_bg_jilga_01"
          else
            L3_73 = "treasure_bg_hex_01"
          end
        else
          L3_73 = "treasure_bg_world_01"
        end
        if L3_73 then
          Fn_setNextMissionFlag(L3_73)
          Fn_nextMission()
          Fn_exitSandbox()
        else
          print(" [ net com ] next mission name  nil")
        end
      end
    end
  else
    L2_72 = print
    L3_73 = " [ net com ] Tbox info nil or locater nil"
    L2_72(L3_73)
    L2_72 = invokeTask
    function L3_73()
      waitSeconds(3)
      while not HUD:faderStability() do
        wait()
      end
      HUD:fadein(0.5)
    end
    L2_72(L3_73)
  end
end
treasureStart = L0_0
