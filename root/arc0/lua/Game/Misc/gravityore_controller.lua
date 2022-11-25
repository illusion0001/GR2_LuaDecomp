local L1_1
L0_0 = {}
GravityOreControl = L0_0
L0_0 = GravityOreControl
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9)
  local L8_10
  L8_10 = {}
  GravityOreControl._installMethods(L8_10)
  L8_10.manager_name = A0_2
  L8_10.min_mimic = A2_4
  L8_10.max_mimic = A3_5
  L8_10.pointMax = A1_3
  L8_10.mgr = createGameObject2("GravityOreManager")
  L8_10.mgr:setName(A0_2 or A4_6)
  L8_10.mgr:try_init()
  L8_10.mgr:waitForReady()
  L8_10.mgr:try_start()
  if true == A5_7 and A4_6 then
    loadInstanceOreData(A4_6, A0_2, A6_8, A7_9)
  elseif A4_6 then
    L8_10.evd = _loadOreData(A4_6)
  end
  return L8_10
end
L0_0.crate = L1_1
L0_0 = GravityOreControl
function L1_1(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16
  for L4_15, L5_16 in L1_12(L2_13) do
    if type(L5_16) == "function" then
      A0_11[L4_15] = L5_16
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = GravityOreControl
function L1_1(A0_17)
  if A0_17 == nil then
    print("GravityOreControl._isValid")
    return false
  end
  return true
end
L0_0._isValid = L1_1
L0_0 = GravityOreControl
function L1_1(A0_18, A1_19)
  if not GravityOreControl._isValid(A0_18) then
    return false
  end
  if not A0_18.mgr then
    return false
  end
  A0_18.mgr:setSpawnPointMax(A0_18.pointMax)
  A0_18.mgr:setSpawnMimic(A0_18.min_mimic, A0_18.max_mimic)
  if true == A1_19 then
    A0_18.mgr:lottery()
  end
  A0_18.mgr:make()
  return true
end
L0_0.requestSpawn = L1_1
L0_0 = GravityOreControl
function L1_1(A0_20)
  if not GravityOreControl._isValid(A0_20) then
    return false
  end
  if not A0_20.mgr then
    return false
  end
  if not A0_20.mgr:isRunning() then
    return false
  end
  return A0_20.mgr:isObjAllReady()
end
L0_0.isObjAllReady = L1_1
L0_0 = GravityOreControl
function L1_1(A0_21, A1_22)
  if not GravityOreControl._isValid(A0_21) then
    return false
  end
  if not A0_21.mgr then
    return false
  end
  if not A0_21.mgr:isRunning() then
    return false
  end
  A0_21.mgr:requestRestor(A1_22)
  return true
end
L0_0.requestRestor = L1_1
L0_0 = GravityOreControl
function L1_1(A0_23, A1_24)
  if not GravityOreControl._isValid(A0_23) then
    return false
  end
  if not A0_23.mgr then
    return false
  end
  if not A0_23.mgr:isRunning() then
    return false
  end
  A0_23.mgr:requestBreak(A1_24)
  return true
end
L0_0.requestBreak = L1_1
L0_0 = GravityOreControl
function L1_1(A0_25)
  if not GravityOreControl._isValid(A0_25) then
    return false
  end
  if not A0_25.mgr then
    return false
  end
  if not A0_25.mgr:isRunning() then
    return false
  end
  return A0_25.mgr:getActiveNum()
end
L0_0.getActiveNum = L1_1
L0_0 = GravityOreControl
function L1_1(A0_26)
  if not GravityOreControl._isValid(A0_26) then
    return false
  end
  if not A0_26.mgr then
    return false
  end
  return A0_26.mgr:getBrokeNum()
end
L0_0.getBrokeNum = L1_1
L0_0 = GravityOreControl
function L1_1(A0_27)
  if not GravityOreControl._isValid(A0_27) then
    return false
  end
  A0_27.mgr:deleteAllChild()
  if A0_27.evd then
    A0_27.evd:try_term()
  end
  A0_27.mgr:try_term()
end
L0_0.finalize = L1_1
L0_0 = GravityOreControl
function L1_1(A0_28)
  if not GravityOreControl._isValid(A0_28) then
    return false
  end
  if A0_28.mgr and not A0_28.mgr:isRunning() then
    return false
  end
  return A0_28:isObjAllReady()
end
L0_0.isRunning = L1_1
function L0_0(A0_29)
  if _loadOreData(A0_29) then
    return true
  end
  return false
end
loadOreData = L0_0
function L0_0(A0_30)
  loadFileAsset("evb", "evx/" .. A0_30):wait()
  return (EventData:create(A0_30, nil, loadFileAsset("evb", "evx/" .. A0_30):getRoot()))
end
_loadOreData = L0_0
function L0_0(A0_31, A1_32, A2_33, A3_34)
  local L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45, L15_46, L16_47, L17_48, L18_49, L19_50, L20_51, L21_52, L22_53, L23_54, L24_55, L25_56, L26_57, L27_58, L28_59, L29_60, L30_61, L31_62, L32_63, L33_64
  L4_35 = Fn_getGameObject
  L5_36 = "bgManager"
  L4_35 = L4_35(L5_36)
  if L4_35 == nil then
    L5_36 = Fn_getGameObject
    L6_37 = "mother2"
    L5_36 = L5_36(L6_37)
    L6_37 = L5_36
    L5_36 = L5_36.findGameObject2
    L5_36 = L5_36(L6_37, L7_38, L8_39)
    L4_35 = L5_36
  end
  if not L4_35 then
    L5_36 = debugPrintArea
    L6_37 = "bgManager\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\227\129\174\227\129\167\233\135\141\229\138\155\233\137\177\231\159\179\227\130\146\233\133\141\231\189\174\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147"
    L5_36(L6_37)
    L5_36 = false
    return L5_36
  else
    if not A0_31 then
      L5_36 = debugPrintArea
      L6_37 = "EventFile\227\129\174\230\140\135\229\174\154\227\129\140\231\132\161\227\129\132\227\129\174\227\129\167\233\135\141\229\138\155\233\137\177\231\159\179\227\129\174\233\133\141\231\189\174\229\164\177\230\149\151"
      L5_36(L6_37)
      L5_36 = false
      return L5_36
    else
      L5_36 = type
      L6_37 = A0_31
      L5_36 = L5_36(L6_37)
      if "table" ~= L5_36 then
        L5_36 = {L6_37}
        L6_37 = A0_31
        A0_31 = L5_36
      end
    end
    L5_36 = {}
    L6_37 = L4_35.sendEvent
    L6_37 = L6_37(L7_38, L8_39)
    for L10_41, L11_42 in L7_38(L8_39) do
      L12_43 = L11_42.getDescendant
      L12_43 = L12_43(L13_44)
      for L16_47, L17_48 in L13_44(L14_45) do
        L19_50 = L17_48
        L18_49 = L17_48.getName
        L18_49 = L18_49(L19_50)
        L19_50 = true
        if A2_33 then
          L19_50 = false
          for L23_54 = 1, #A2_33 do
            L24_55 = A2_33[L23_54]
            if L18_49 == L24_55 then
              L19_50 = true
              break
            end
          end
        end
        if L19_50 and A3_34 then
          for L23_54 = 1, #A3_34 do
            L24_55 = A3_34[L23_54]
            if L18_49 == L24_55 then
              L19_50 = false
              break
            end
          end
        end
        if L19_50 then
          L5_36[L18_49] = L17_48
        end
      end
    end
    for L10_41 = 1, #A0_31 do
      L11_42 = loadFileAsset
      L12_43 = "evb"
      L11_42 = L11_42(L12_43, L13_44)
      if nil == L11_42 then
        L12_43 = print
        L12_43(L13_44)
        L12_43 = false
        return L12_43
      end
      L12_43 = L11_42.wait
      L12_43(L13_44)
      L12_43 = L11_42.getRoot
      L12_43 = L12_43(L13_44)
      for L18_49 = 1, L13_44 do
        L19_50 = L12_43.getChild
        L19_50 = L19_50(L20_51, L21_52)
        for L24_55, L25_56 in L21_52(L22_53) do
          L26_57 = string
          L26_57 = L26_57.find
          L26_57 = L26_57(L27_58, L28_59)
          if nil ~= L26_57 then
            L26_57 = _getTreeOfChildBundle
            L26_57 = L26_57(L27_58, L28_59)
            if L26_57 then
              for L30_61, L31_62 in L27_58(L28_59) do
                L32_63 = L31_62.type
                if "gravityore" == L32_63 then
                  L32_63 = createGameObject2
                  L33_64 = "GravityOre"
                  L32_63 = L32_63(L33_64)
                  L33_64 = L31_62.name
                  L33_64 = L33_64 .. "_" .. L24_55
                  L32_63:setName(L33_64)
                  L32_63:setBundle(L31_62.bundle)
                  L32_63:changeSavePathGameObjName(L33_64)
                  L32_63:setTransform(L19_50:worldToLocal(L31_62.bundle:getTranslation(), L31_62.bundle:getRotation()))
                  L25_56:appendChild(L32_63)
                  if A1_32 then
                    L32_63:setGravityOreManager(A1_32)
                  end
                end
              end
            end
            L26_57 = nil
          end
        end
      end
    end
  end
  L5_36 = true
  return L5_36
end
loadInstanceOreData = L0_0
function L0_0(A0_65, A1_66)
  local L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74
  if not A0_65 then
    return
  end
  L2_67 = {}
  L3_68 = print
  L5_70 = A0_65
  L4_69 = A0_65.getName
  L9_74 = L4_69(L5_70)
  L3_68(L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L4_69(L5_70))
  L3_68 = {}
  L4_69 = table
  L4_69 = L4_69.insert
  L5_70 = L3_68
  L6_71 = {}
  L6_71.bundle = A0_65
  L8_73 = A0_65
  L7_72 = A0_65.getChildCount
  L7_72 = L7_72(L8_73)
  L6_71.child_max = L7_72
  L6_71.child_count = 0
  L4_69(L5_70, L6_71)
  L4_69 = false
  L5_70 = false
  while true do
    L6_71 = #L3_68
    if L6_71 > 0 then
      L5_70 = false
      L6_71 = #L3_68
      L6_71 = L3_68[L6_71]
      L7_72 = L6_71.bundle
      L8_73 = L7_72
      L7_72 = L7_72.getName
      L7_72 = L7_72(L8_73)
      L8_73 = L6_71.bundle
      L9_74 = L8_73
      L8_73 = L8_73.getTypeName
      L8_73 = L8_73(L9_74)
      if true == L4_69 then
        L9_74 = L6_71.child_count
        if L9_74 <= 0 then
          L9_74 = A0_65.getName
          L9_74 = L9_74(A0_65)
          if 0 < #L3_68 - 1 then
            L9_74 = L3_68[#L3_68 - 1].bundle:getName()
          end
          table.insert(L2_67, {
            name = L7_72,
            type = L8_73,
            parrent = L9_74
          })
          if true == A1_66 then
            L2_67[#L2_67].bundle = L6_71.bundle
          end
        end
      end
      if not L5_70 then
        L9_74 = L6_71.child_max
        if L9_74 > L6_71.child_count then
          L9_74 = L6_71.child_count
          L9_74 = L9_74 + 1
          L6_71.child_count = L9_74
          L9_74 = L6_71.bundle
          L9_74 = L9_74.getChild
          L9_74 = L9_74(L9_74, L6_71.child_count)
          if nil ~= L9_74 and L6_71.bundle:getChildCount() > 0 then
            table.insert(L3_68, {
              bundle = L9_74,
              child_max = L6_71.bundle:getChildCount(),
              child_count = 0
            })
          else
            table.remove(L3_68)
          end
        else
          L9_74 = table
          L9_74 = L9_74.remove
          L9_74(L3_68)
        end
      else
        L9_74 = table
        L9_74 = L9_74.remove
        L9_74(L3_68)
      end
      L4_69 = true
    end
  end
  return L2_67
end
_getTreeOfChildBundle = L0_0
