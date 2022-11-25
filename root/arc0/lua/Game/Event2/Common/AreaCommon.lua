import("Area")
import("Player")
dofile("/Game/Event2/Common/BulletCommon.lua")
if not wait_safe then
  function wait_safe()
    local L0_0, L1_1
  end
end
function debugPrintArea(A0_2)
  print(" [area com ] : " .. g_own:getName() .. " : " .. A0_2)
end
function Fn_getActiveAreaTable()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10
  L0_3 = Area
  L1_4 = L0_3
  L0_3 = L0_3.getActiveAreas
  L0_3 = L0_3(L1_4, L2_5)
  while true do
    L1_4 = true
    for L5_8, L6_9 in L2_5(L3_6) do
      L7_10 = string
      L7_10 = L7_10.match
      L7_10 = L7_10(L6_9, "_root")
      if L7_10 == nil then
        L7_10 = table
        L7_10 = L7_10.remove
        L7_10(L0_3, L5_8)
        L1_4 = false
        break
      end
    end
    if L1_4 ~= true then
    end
  end
  L1_4 = Area
  L1_4 = L1_4.getActiveAreas
  L1_4 = L1_4(L2_5, L3_6)
  while true do
    for L6_9, L7_10 in L3_6(L4_7) do
      if L7_10 ~= "ve_crane_root" and string.match(L7_10, "_root") ~= nil or string.match(L7_10, "sky_") ~= nil then
        table.remove(L1_4, L6_9)
        break
      end
    end
    if L2_5 ~= true then
    end
  end
  return L2_5, L3_6
end
function Fn_getActiveRootAreaTable()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18
  L0_11 = Area
  L1_12 = L0_11
  L0_11 = L0_11.getActiveAreas
  L2_13 = 1
  L0_11 = L0_11(L1_12, L2_13)
  L1_12 = {}
  L2_13 = 1
  for L6_17, L7_18 in L3_14(L4_15) do
    if string.match(L7_18, "_root") ~= nil then
      L1_12[L2_13] = L7_18
      L2_13 = L2_13 + 1
    end
  end
  return L1_12
end
function Fn_getActiveSubAreaTable()
  local L0_19, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26
  L0_19 = Area
  L1_20 = L0_19
  L0_19 = L0_19.getActiveAreas
  L2_21 = 2
  L0_19 = L0_19(L1_20, L2_21)
  L1_20 = {}
  L2_21 = 1
  for L6_25, L7_26 in L3_22(L4_23) do
    if string.match(L7_26, "_root") == nil and string.match(L7_26, "sky_") == nil then
      L1_20[L2_21] = L7_26
      L2_21 = L2_21 + 1
    end
  end
  return L1_20
end
function Fn_changeAppendArea(A0_27, A1_28)
  local L2_29, L3_30, L4_31
  L3_30 = A0_27
  L2_29 = A0_27.getWorldTransform
  L3_30 = L2_29(L3_30)
  L4_31 = A1_28.getParent
  L4_31 = L4_31(A1_28)
  while true do
    if L4_31 ~= nil and L4_31:getTypeName() ~= "Area" then
      L4_31 = L4_31:getParent()
      break
    end
  end
  if L4_31 ~= nil then
    L4_31:appendChild(A0_27)
    A0_27:setWorldTransform(pos, rot)
    A0_27:setForceMove()
  end
end
function Fn_getBgsetRootAreaHandleTable()
  local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48
  L0_32 = {}
  function L1_33(A0_49)
    local L1_50
    L1_50 = false
    if A0_49:getTypeName() == "Area" and string.match(A0_49:getName(), "_root") ~= nil then
      L1_50 = true
    end
    return L1_50
  end
  is_root_area = L1_33
  L1_33 = mother2
  L2_34 = L1_33
  L1_33 = L1_33.sendEvent
  L1_33 = L1_33(L2_34, L3_35)
  if L1_33 ~= nil then
    L2_34 = {}
    for L6_38, L7_39 in L3_35(L4_36) do
      L8_40 = is_root_area
      L9_41 = L7_39
      L8_40 = L8_40(L9_41)
      if L8_40 == true then
        L9_41 = L7_39
        L8_40 = L7_39.getName
        L8_40 = L8_40(L9_41)
        L2_34[L8_40] = L7_39
        L9_41 = L7_39.getDescendant
        L11_43.exclude_part = true
        L9_41 = L9_41(L10_42, L11_43)
        for L13_45, L14_46 in L10_42(L11_43) do
          L15_47 = is_root_area
          L16_48 = L14_46
          L15_47 = L15_47(L16_48)
          if L15_47 == true then
            L16_48 = L14_46
            L15_47 = L14_46.getName
            L15_47 = L15_47(L16_48)
            L2_34[L15_47] = L14_46
          end
        end
        L10_42()
      end
    end
    for L7_39, L8_40 in L4_36(L5_37) do
      L9_41 = L8_40.getName
      L9_41 = L9_41(L10_42)
      for L14_46, L15_47 in L11_43(L12_44) do
        L16_48 = L15_47.getName
        L16_48 = L16_48(L15_47)
        if L9_41 ~= L16_48 and L8_40:findSubArea(L16_48) ~= nil then
          break
        end
      end
      if L10_42 == false then
        L0_32[L3_35] = L8_40
      end
      L11_43()
    end
  end
  return L0_32
end
function Fn_getBgsetRootAreaNameTable()
  local L0_51, L1_52
  L0_51 = {}
  L1_52 = Fn_getBgsetRootAreaHandleTable
  L1_52 = L1_52()
  if L1_52 ~= nil then
    for _FORV_6_, _FORV_7_ in pairs(L1_52) do
      L0_51[1] = _FORV_7_:getName()
    end
  end
  return L0_51
end
function Fn_getBgsetSubAreaHandleTable()
  local L0_53, L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61
  L0_53 = {}
  L1_54 = Fn_getBgsetRootAreaHandleTable
  L1_54 = L1_54()
  if L1_54 ~= nil then
    L2_55 = 1
    for L6_59, L7_60 in L3_56(L4_57) do
      L8_61 = L7_60.getChildren
      L8_61 = L8_61(L7_60, {exclude_part = true})
      for _FORV_13_, _FORV_14_ in pairs(L8_61) do
        if _FORV_14_:getTypeName() == "Area" and string.match(_FORV_14_:getName(), "g1_base_") == nil then
          L0_53[L2_55] = _FORV_14_
          L2_55 = L2_55 + 1
        end
      end
      if true == false then
        L0_53[L2_55] = L7_60
        L2_55 = L2_55 + 1
      end
      wait()
    end
  end
  return L0_53
end
function Fn_getBgsetSubAreaNameTable()
  local L0_62, L1_63
  L0_62 = {}
  L1_63 = Fn_getBgsetSubAreaHandleTable
  L1_63 = L1_63()
  if L1_63 ~= nil then
    for _FORV_6_, _FORV_7_ in pairs(L1_63) do
      L0_62[1] = _FORV_7_:getName()
    end
  end
  return L0_62
end
function Fn_getBGSetSubAreaHandle(A0_64)
  local L1_65, L2_66
  L1_65 = nil
  L2_66 = Fn_getBgsetRootAreaHandleTable
  L2_66 = L2_66()
  if L2_66 ~= nil then
    for _FORV_6_, _FORV_7_ in pairs(L2_66) do
      L1_65 = _FORV_7_:findSubArea(A0_64)
      if L1_65 == nil then
      end
    end
  end
  return L1_65
end
function Fn_getParentArea(A0_67)
  local L1_68
  L1_68 = A0_67.getParent
  L1_68 = L1_68(A0_67)
  while L1_68 ~= nil and L1_68:getTypeName() ~= "Area" do
    L1_68 = L1_68:getParent()
  end
  return L1_68
end
function Fn_warpArea(A0_69, A1_70, A2_71, A3_72, A4_73)
  local L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81
  if A2_71 ~= false then
    L5_74 = HUD
    L6_75 = L5_74
    L5_74 = L5_74.faderAlpha
    L5_74 = L5_74(L6_75)
    if L5_74 < 1 then
      L5_74 = debugPrintArea
      L6_75 = "\231\148\187\233\157\162\227\129\171\230\152\160\227\129\163\227\129\166\227\129\132\227\130\139\229\143\175\232\131\189\230\128\167\227\129\140\227\129\130\227\130\139\227\129\174\227\129\167\231\167\187\229\139\149\227\129\151\227\129\190\227\129\155\227\130\147"
      L5_74(L6_75)
      L5_74 = false
      return L5_74
    end
  end
  L5_74 = A1_70
  if A1_70 ~= nil then
    L6_75 = type
    L7_76 = A1_70
    L6_75 = L6_75(L7_76)
    if L6_75 == "string" then
      L6_75 = findGameObject2
      L7_76 = "Node"
      L8_77 = A1_70
      L6_75 = L6_75(L7_76, L8_77)
      L5_74 = L6_75
    end
  end
  L6_75 = A3_72
  if A3_72 ~= nil then
    L7_76 = type
    L8_77 = A3_72
    L7_76 = L7_76(L8_77)
    if L7_76 == "string" then
      L7_76 = findGameObject2
      L8_77 = "Node"
      L9_78 = A3_72
      L7_76 = L7_76(L8_77, L9_78)
      L6_75 = L7_76
    end
  end
  L7_76 = Fn_findAreaHandle
  L8_77 = A0_69
  L7_76 = L7_76(L8_77)
  if L7_76 then
    L8_77 = debugPrintArea
    L9_78 = "\227\130\168\227\131\170\227\130\162\227\129\140\232\166\139\227\129\164\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\231\167\187\229\139\149\227\129\149\227\129\155\227\129\190\227\129\153"
    L8_77(L9_78)
    L8_77 = false
    L9_78 = Player
    L10_79 = L9_78
    L9_78 = L9_78.getRecentAreaName
    L9_78 = L9_78(L10_79)
    if L9_78 == A0_69 then
      L8_77 = true
    end
    L9_78 = Player
    L10_79 = L9_78
    L9_78 = L9_78.getPuppet
    L9_78 = L9_78(L10_79)
    L10_79 = nil
    if L6_75 == nil then
      L11_80 = createGameObject2
      L12_81 = "Node"
      L11_80 = L11_80(L12_81)
      L10_79 = L11_80
      L12_81 = L10_79
      L11_80 = L10_79.setName
      L11_80(L12_81, "tmp_pc_warp_node")
      L12_81 = L7_76
      L11_80 = L7_76.appendChild
      L11_80(L12_81, L10_79)
      L12_81 = L10_79
      L11_80 = L10_79.setWorldTransform
      L11_80(L12_81, L9_78:getWorldTransform())
      L12_81 = L10_79
      L11_80 = L10_79.try_init
      L11_80(L12_81)
      L12_81 = L10_79
      L11_80 = L10_79.waitForReady
      L11_80(L12_81)
      L12_81 = L10_79
      L11_80 = L10_79.try_start
      L11_80(L12_81)
    end
    L11_80 = Area
    L12_81 = L11_80
    L11_80 = L11_80.setEnableLoading
    L11_80(L12_81, false)
    L12_81 = L9_78
    L11_80 = L9_78.setCollidable
    L11_80(L12_81, false)
    L11_80 = Time
    L12_81 = L11_80
    L11_80 = L11_80.setInGameDeltaSec
    L11_80(L12_81, 0)
    L11_80 = wait
    L11_80()
    L11_80 = Area
    L12_81 = L11_80
    L11_80 = L11_80.setAnimMoveDriftEnable
    L11_80(L12_81, false, false, false)
    L11_80 = GameDatabase
    L12_81 = L11_80
    L11_80 = L11_80.set
    L11_80(L12_81, ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, false)
    if L8_77 == true then
      L11_80 = Area
      L12_81 = L11_80
      L11_80 = L11_80.setAreaFree
      L11_80(L12_81)
    end
    L12_81 = L7_76
    L11_80 = L7_76.setWorldTransform
    L11_80(L12_81, L5_74:getWorldTransform())
    L12_81 = L7_76
    L11_80 = L7_76.setForceMove
    L11_80(L12_81)
    L11_80 = wait
    L11_80()
    if L6_75 ~= nil then
      L11_80 = debugPrintArea
      L12_81 = "\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\227\131\175\227\131\188\227\131\151\227\129\149\227\129\155\227\129\190\227\129\153"
      L11_80(L12_81)
      L12_81 = L6_75
      L11_80 = L6_75.setForceMove
      L11_80(L12_81)
      L11_80 = wait
      L11_80()
      L12_81 = L6_75
      L11_80 = L6_75.getWorldTransform
      L12_81 = L11_80(L12_81)
      debugPrintArea("pc pos > " .. tostring(L11_80))
      debugPrintArea("pc rot > " .. tostring(L12_81))
      Bullet:reset(Bullet.ID.Shockwave, Bullet.Owner.All)
      if A4_73 == nil then
        Player:reset(Player.kReset_Standing, L11_80, L12_81)
      else
        Player:reset(A4_73, L11_80, L12_81)
      end
      wait()
    elseif L8_77 == true and L10_79 ~= nil then
      L12_81 = L10_79
      L11_80 = L10_79.setForceMove
      L11_80(L12_81)
      L12_81 = L10_79
      L11_80 = L10_79.getWorldTransform
      L12_81 = L11_80(L12_81)
      debugPrintArea("pc pos > " .. tostring(L11_80))
      debugPrintArea("pc rot > " .. tostring(L12_81))
      wait()
      Player:reset(Player.kReset_Standing, L11_80, L12_81)
      Bullet:reset(Bullet.ID.Shockwave, Bullet.Owner.All)
      wait()
      L10_79:try_term()
    end
    L11_80 = Area
    L12_81 = L11_80
    L11_80 = L11_80.setEnableLoading
    L11_80(L12_81, true)
    L12_81 = L9_78
    L11_80 = L9_78.setCollidable
    L11_80(L12_81, true)
    L11_80 = Time
    L12_81 = L11_80
    L11_80 = L11_80.resetInGameDeltaSec
    L11_80(L12_81)
    L11_80 = wait
    L11_80()
    L9_78 = nil
    L11_80 = GameDatabase
    L12_81 = L11_80
    L11_80 = L11_80.get
    L11_80 = L11_80(L12_81, ggd.GlobalSystemFlags__AreaDrift)
    if L11_80 then
      L11_80 = Area
      L12_81 = L11_80
      L11_80 = L11_80.setAnimMoveDriftEnable
      L11_80(L12_81, true, true, true)
      L11_80 = GameDatabase
      L12_81 = L11_80
      L11_80 = L11_80.set
      L11_80(L12_81, ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, true)
      L11_80 = wait
      L11_80()
    end
    L11_80 = debugPrintArea
    L12_81 = "\227\130\168\227\131\170\227\130\162\227\129\174\227\131\175\227\131\188\227\131\151\231\181\130\228\186\134"
    L11_80(L12_81)
    L11_80 = true
    return L11_80
  end
  L8_77 = debugPrintArea
  L9_78 = "\227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159"
  L8_77(L9_78)
  L8_77 = false
  return L8_77
end
function Fn_findAreaHandle(A0_82)
  local L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90
  L1_83 = Fn_getGameObject
  L2_84 = "bgManager"
  L1_83 = L1_83(L2_84)
  if L1_83 == nil then
    L2_84 = Fn_getGameObject
    L2_84 = L2_84(L3_85)
    L2_84 = L2_84.findGameObject2
    L2_84 = L2_84(L3_85, L4_86, L5_87)
    L1_83 = L2_84
  end
  if not L1_83 then
    L2_84 = debugPrintArea
    L2_84(L3_85)
    L2_84 = nil
    return L2_84
  end
  L2_84 = L1_83.sendEvent
  L2_84 = L2_84(L3_85, L4_86)
  for L6_88, L7_89 in L3_85(L4_86) do
    L8_90 = L7_89.getName
    L8_90 = L8_90(L7_89)
    if A0_82 == L8_90 then
      L8_90 = debugPrintArea
      L8_90(A0_82 .. "\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\140\227\129\130\227\130\138\227\129\190\227\129\151\227\129\159")
      return L7_89
    end
    L8_90 = L7_89.getDescendant
    L8_90 = L8_90(L7_89)
    for _FORV_12_, _FORV_13_ in pairs(L8_90) do
      if A0_82 == _FORV_13_:getName() then
        debugPrintArea(A0_82 .. "\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\140\227\129\130\227\130\138\227\129\190\227\129\151\227\129\159")
        return _FORV_13_
      end
    end
  end
  L3_85(L4_86)
  return L3_85
end
function Fn_findGimmickBgInBgset(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100, L10_101
  L2_93 = Fn_getGameObject
  L3_94 = "bgManager"
  L2_93 = L2_93(L3_94)
  if not L2_93 then
    L3_94 = nil
    return L3_94
  end
  L4_95 = L2_93
  L3_94 = L2_93.sendEvent
  L5_96 = "getBgsetHandle"
  L3_94 = L3_94(L4_95, L5_96)
  if not L3_94 then
    L4_95 = nil
    return L4_95
  end
  L4_95 = type
  L5_96 = A0_91
  L4_95 = L4_95(L5_96)
  if L4_95 == "table" then
    L5_96 = {}
    for L9_100, L10_101 in L6_97(L7_98) do
      L5_96[L10_101] = L3_94:findGameObject2("GimmickBg", L10_101)
    end
    return L5_96
  elseif L4_95 == "string" then
    if A1_92 then
      L5_96 = L3_94.findGameObjects
      return L5_96(L6_97, L7_98, L8_99)
    end
    L5_96 = L3_94.findGameObject2
    return L5_96(L6_97, L7_98, L8_99)
  end
  L5_96 = nil
  return L5_96
end
function Fn_resetArea()
  if not Fn_getGameObject("bgManager") then
    return nil
  end
  if not Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle") then
    return nil
  end
  Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle"):sendEvent("areaResetAndReConnct")
  wait()
  repeat
    wait()
  until Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle"):sendEvent("isConnectingFinish")
end
function Fn_switchDayAndNight(A0_102)
  if not Fn_getGameObject("bgManager") then
    return nil
  end
  if not Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle") then
    return nil
  end
  Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle"):sendEvent("switchDayAndNight", A0_102)
end
function Fn_windmillBroken()
  local L0_103
  L0_103 = Fn_getGameObject
  L0_103 = L0_103("bgManager")
  if L0_103 == nil then
    L0_103 = Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "bgManager")
  end
  if not L0_103 then
    debugPrintArea("bgManager\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
    return
  end
  L0_103:sendEvent("requestBgSet", {windmill_broken = true})
end
function Fn_windmillRestore()
  local L0_104
  L0_104 = Fn_getGameObject
  L0_104 = L0_104("bgManager")
  if L0_104 == nil then
    L0_104 = Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "bgManager")
  end
  if not L0_104 then
    debugPrintArea("bgManager\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
    return
  end
  L0_104:sendEvent("requestBgSet", {windmill_broken = false})
end
function Fn_jailCageRestoreForce()
  local L0_105
  L0_105 = Fn_getGameObject
  L0_105 = L0_105("bgManager")
  if L0_105 == nil then
    L0_105 = Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "bgManager")
  end
  if not L0_105 then
    debugPrintArea("bgManager\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
    return
  end
  L0_105:sendEvent("requestBgSet", {jailcage_restore_force = true})
end
function Fn_dtDemoObjectActive(A0_106)
  local L1_107
  L1_107 = Fn_getGameObject
  L1_107 = L1_107("bgManager")
  if L1_107 == nil then
    L1_107 = Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "bgManager")
  end
  if not L1_107 then
    debugPrintArea("bgManager\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
    return
  end
  L1_107:sendEvent("requestBgSet", {demo_object = A0_106})
end
function Fn_findVehicle(A0_108)
  if not Fn_getGameObject("bgManager") then
    return nil
  end
  if not Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle") then
    return nil
  end
  return Fn_getGameObject("bgManager"):sendEvent("getBgsetHandle"):findGameObject2("Vehicle", A0_108)
end
