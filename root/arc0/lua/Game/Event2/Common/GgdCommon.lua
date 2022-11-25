import("math")
import("common")
import("GameDatabase")
import("HUD")
import("Player")
import("Analytics")
dofile("/Game/Event2/Common/SystemScriptCommon.lua")
dofile("/Game/Event2/Table/MissionTable.lua")
dofile("/Game/Event2/Table/FreeTimeBgTable.lua")
dofile("/Game/Param/Player/PlayerLevel.lua")
dofile("/Game/Event2/Table/FreeMissionTable.lua")
dofile("/Game/Event2/Table/FreeTimeTable.lua")
dofile("/Game/Event2/Table/ReturnTitle.lua")
function setFreeTimeFlags(A0_0)
  debugPrint("setFreeTimeFlags")
  GameDatabase:set(ggd.Savedata__EventManageFlags__CityGem, A0_0[INDEX_GEM])
  GameDatabase:set(ggd.Savedata__EventManageFlags__Outrange, A0_0[INDEX_OUTRANGE])
  GameDatabase:set(ggd.Savedata__EventManageFlags__Manhole, A0_0[INDEX_MANHOLE])
  GameDatabase:set(ggd.Savedata__EventManageFlags__InfoActor, A0_0[INDEX_INFO_ACTOR])
  GameDatabase:set(ggd.Savedata__EventManageFlags__TreasureBox, A0_0[INDEX_TRESURE_BOX])
  GameDatabase:set(ggd.Savedata__EventManageFlags__PhotoGhost, A0_0[INDEX_PHOTO_GHOST])
  GameDatabase:set(ggd.Savedata__EventManageFlags__Mob, A0_0[INDEX_MOB])
  GameDatabase:set(ggd.Savedata__EventManageFlags__WarShip, A0_0[INDEX_WARSHIP])
  GameDatabase:set(ggd.Savedata__EventManageFlags__WarShipCannon, A0_0[INDEX_CANNON])
  GameDatabase:set(ggd.Savedata__EventManageFlags__Station, A0_0[INDEX_STATION])
  GameDatabase:set(ggd.Savedata__EventManageFlags__Vehicle, A0_0[INDEX_VEHICLE])
end
function backupFreeTimeFlags()
  debugPrint("backupFreeTimeFlags")
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__CityGem, GameDatabase:get(ggd.Savedata__EventManageFlags__CityGem))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__Outrange, GameDatabase:get(ggd.Savedata__EventManageFlags__Outrange))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__Manhole, GameDatabase:get(ggd.Savedata__EventManageFlags__Manhole))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__InfoActor, GameDatabase:get(ggd.Savedata__EventManageFlags__InfoActor))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__TreasureBox, GameDatabase:get(ggd.Savedata__EventManageFlags__TreasureBox))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__PhotoGhost, GameDatabase:get(ggd.Savedata__EventManageFlags__PhotoGhost))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__Mob, GameDatabase:get(ggd.Savedata__EventManageFlags__Mob))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__WarShip, GameDatabase:get(ggd.Savedata__EventManageFlags__WarShip))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__WarShipCannon, GameDatabase:get(ggd.Savedata__EventManageFlags__WarShipCannon))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__Station, GameDatabase:get(ggd.Savedata__EventManageFlags__Station))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__Vehicle, GameDatabase:get(ggd.Savedata__EventManageFlags__Vehicle))
  GameDatabase:set(ggd.Savedata__FreeTimeFlags__Costume, GameDatabase:get(ggd.Savedata__Player__Costume))
end
function rollbackFreeTimeFlags()
  debugPrint("rollbackFreeTimeFlags")
  GameDatabase:set(ggd.Savedata__EventManageFlags__CityGem, GameDatabase:get(ggd.Savedata__FreeTimeFlags__CityGem))
  GameDatabase:set(ggd.Savedata__EventManageFlags__Outrange, GameDatabase:get(ggd.Savedata__FreeTimeFlags__Outrange))
  GameDatabase:set(ggd.Savedata__EventManageFlags__Manhole, GameDatabase:get(ggd.Savedata__FreeTimeFlags__Manhole))
  GameDatabase:set(ggd.Savedata__EventManageFlags__InfoActor, GameDatabase:get(ggd.Savedata__FreeTimeFlags__InfoActor))
  GameDatabase:set(ggd.Savedata__EventManageFlags__TreasureBox, GameDatabase:get(ggd.Savedata__FreeTimeFlags__TreasureBox))
  GameDatabase:set(ggd.Savedata__EventManageFlags__PhotoGhost, GameDatabase:get(ggd.Savedata__FreeTimeFlags__PhotoGhost))
  GameDatabase:set(ggd.Savedata__EventManageFlags__Mob, GameDatabase:get(ggd.Savedata__FreeTimeFlags__Mob))
  GameDatabase:set(ggd.Savedata__EventManageFlags__WarShip, GameDatabase:get(ggd.Savedata__FreeTimeFlags__WarShip))
  GameDatabase:set(ggd.Savedata__EventManageFlags__WarShipCannon, GameDatabase:get(ggd.Savedata__FreeTimeFlags__WarShipCannon))
  GameDatabase:set(ggd.Savedata__EventManageFlags__Station, GameDatabase:get(ggd.Savedata__FreeTimeFlags__Station))
  GameDatabase:set(ggd.Savedata__EventManageFlags__Vehicle, GameDatabase:get(ggd.Savedata__FreeTimeFlags__Vehicle))
  if GameDatabase:get(ggd.Savedata__FreeTimeFlags__Costume) ~= "None" then
    GameDatabase:set(ggd.Savedata__Player__Costume, GameDatabase:get(ggd.Savedata__FreeTimeFlags__Costume))
  else
    debugPrint("Savedata__FreeTimeFlags__Costume\227\129\140None\227\129\170\227\129\174\227\129\171Savedata__Player__Costume\227\129\171\230\155\184\227\129\141\232\190\188\227\129\191\227\130\146\227\129\151\227\130\136\227\129\134\227\129\168\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function setNextBgset(A0_1)
  local L1_2
  L1_2 = GameDatabase
  L1_2 = L1_2.get
  L1_2 = L1_2(L1_2, ggd.Savedata__EventManageFlags__CurrentBgSet)
  if A0_1 == "bg_mine_base" then
    if string.find(L1_2, "bg_mine") == nil or GameDatabase:get(ggd.Savedata__EventManageFlags__LateBgSet) == "None" then
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, "bg_mine_01")
    else
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, GameDatabase:get(ggd.Savedata__EventManageFlags__LateBgSet))
    end
  else
    if L1_2 ~= A0_1 then
      GameDatabase:set(ggd.GlobalSystemFlags__AreaChange, true)
    end
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, A0_1)
  end
end
function getNextFreeTime(A0_3)
  local L1_4, L2_5
  L1_4 = string
  L1_4 = L1_4.match
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, "%l+")
  if L1_4 ~= "ep" and L1_4 ~= "eps" then
    L2_5 = nil
    return L2_5
  end
  L2_5 = tonumber
  L2_5 = L2_5(string.match(A0_3, "%d+"))
  if L1_4 == "ep" then
    L2_5 = L2_5 + 1
  end
  return "ft" .. string.format("%02d", L2_5)
end
function isMissionTypeDemo(A0_6)
  local L1_7
  if A0_6 == "movie" or A0_6 == "c_demo" or A0_6 == "staff" or A0_6 == "chapter" or A0_6 == "recoll" then
    L1_7 = true
    return L1_7
  end
  L1_7 = false
  return L1_7
end
function findTreeTimePrepareDemo(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21
  L1_9 = tonumber
  L2_10 = string
  L2_10 = L2_10.match
  L3_11 = GameDatabase
  L4_12 = L3_11
  L3_11 = L3_11.get
  L5_13 = ggd
  L5_13 = L5_13.Savedata__EventManageFlags__CurrentFreeMode
  L3_11 = L3_11(L4_12, L5_13)
  L4_12 = "%d+"
  L13_21 = L2_10(L3_11, L4_12)
  L1_9 = L1_9(L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L2_10(L3_11, L4_12))
  if L1_9 > 21 then
    L1_9 = 21
  end
  L2_10 = {}
  L3_11 = A0_8 or 1
  L4_12 = "ep"
  L5_13 = string
  L5_13 = L5_13.format
  L5_13 = L5_13(L6_14, L7_15)
  L4_12 = L4_12 .. L5_13 .. L6_14
  L5_13 = nil
  for L9_17 = 1, #L7_15 do
    L10_18 = main_mission
    L10_18 = L10_18[L9_17]
    L11_19 = INDEX_NAME
    L5_13 = L10_18[L11_19]
    if L5_13 == L4_12 then
      L10_18 = main_mission
      L11_19 = L9_17 + 1
      L10_18 = L10_18[L11_19]
      L11_19 = INDEX_NAME
      L10_18 = L10_18[L11_19]
      L11_19 = main_mission
      L12_20 = L9_17 + 1
      L11_19 = L11_19[L12_20]
      L12_20 = INDEX_TYPE
      L11_19 = L11_19[L12_20]
      L12_20 = main_mission
      L13_21 = L9_17 + 2
      L12_20 = L12_20[L13_21]
      L13_21 = INDEX_NAME
      L12_20 = L12_20[L13_21]
      L13_21 = main_mission
      L13_21 = L13_21[L9_17 + 2]
      L13_21 = L13_21[INDEX_TYPE]
      if isMissionTypeDemo(L11_19) then
        table.insert(L2_10, {category = L11_19, name = L10_18})
        if isMissionTypeDemo(L13_21) then
          table.insert(L2_10, {category = L13_21, name = L12_20})
        end
      end
      break
    end
  end
  return L2_10
end
function findDemoListAndNextMission(A0_22, A1_23)
  local L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39, L18_40, L19_41, L20_42, L21_43, L22_44, L23_45
  L2_24 = 0
  for L6_28 = 1, #L4_26 do
    L7_29 = main_mission
    L7_29 = L7_29[L6_28]
    L8_30 = INDEX_NAME
    L7_29 = L7_29[L8_30]
    if L7_29 == A0_22 then
      L2_24 = L6_28
      break
    end
  end
  L6_28 = false
  L7_29 = false
  L8_30 = main_mission
  L8_30 = L8_30[L2_24]
  L9_31 = INDEX_NAME
  L8_30 = L8_30[L9_31]
  L9_31 = main_mission
  L9_31 = L9_31[L2_24]
  L10_32 = INDEX_TYPE
  L9_31 = L9_31[L10_32]
  L10_32 = string
  L10_32 = L10_32.match
  L11_33 = L8_30
  L10_32 = L10_32(L11_33, L12_34)
  L10_32 = L10_32 or L8_30
  L11_33 = string
  L11_33 = L11_33.match
  L11_33 = L11_33(L12_34, L13_35)
  if L2_24 > 0 then
    if not A1_23 then
      L2_24 = L2_24 + 1
    end
    for L15_37 = L2_24, #L13_35 do
      L17_39 = INDEX_NAME
      L17_39 = main_mission
      L17_39 = L17_39[L15_37]
      L17_39 = L17_39[L18_40]
      if L18_40 then
        L20_42.category = L17_39
        L20_42.name = L16_38
        L18_40(L19_41, L20_42)
        for L21_43, L22_44 in L18_40(L19_41) do
          if L16_38 == L22_44 then
            L7_29 = true
            break
          end
        end
        if not L7_29 then
          elseif L17_39 == "header" or L17_39 == "extra" then
          else
            L21_43 = ggd
            L21_43 = L21_43.Savedata__EventManageFlags__MonologueEnd
            if L18_40 ~= "None" then
              L21_43 = L3_25
              L22_44 = {}
              L22_44.category = "monologue"
              L22_44.name = L18_40
              L20_42(L21_43, L22_44)
              L21_43 = L20_42
              L22_44 = ggd
              L22_44 = L22_44.Savedata__EventManageFlags__MonologueStart
              L23_45 = "None"
              L20_42(L21_43, L22_44, L23_45)
            end
            if L19_41 ~= "None" and L11_33 == "sm" and L16_38 == "eventheader" then
              L21_43 = L3_25
              L22_44 = {}
              L22_44.category = "monologue"
              L22_44.name = L19_41
              L20_42(L21_43, L22_44)
              L21_43 = L20_42
              L22_44 = ggd
              L22_44 = L22_44.Savedata__EventManageFlags__MonologueEnd
              L23_45 = "None"
              L20_42(L21_43, L22_44, L23_45)
            end
            if L11_33 == "sm" then
              L21_43 = L20_42
              L22_44 = ggd
              L22_44 = L22_44.GlobalSystemFlags__SideEnd
              L23_45 = L10_32
              L20_42(L21_43, L22_44, L23_45)
            end
            L21_43 = L20_42
            L22_44 = ggd
            L22_44 = L22_44.Savedata__EventManageFlags__MissionReplay
            if L20_42 == "Node" then
              L21_43 = L16_38
              L22_44 = "%l+"
              if L20_42 == "eps" then
                L21_43 = L15_37 + 1
                L21_43 = INDEX_NAME
                if L20_42 == "eventheader" then
                  L6_28 = true
                end
              elseif L11_33 == "ep" and L16_38 == "eventheader" then
                L21_43 = string
                L21_43 = L21_43.match
                L22_44 = GameDatabase
                L23_45 = L22_44
                L22_44 = L22_44.get
                L22_44 = L22_44(L23_45, ggd.Savedata__EventManageFlags__CurrentFreeMode)
                L23_45 = "%d+"
                L23_45 = L21_43(L22_44, L23_45)
                L21_43 = tonumber
                L22_44 = string
                L22_44 = L22_44.match
                L23_45 = GameDatabase
                L23_45 = L23_45.get
                L23_45 = L23_45(L23_45, ggd.Savedata__EventManageFlags__ClearEpisodeNum)
                L23_45 = L22_44(L23_45, "%d+")
                L21_43 = L21_43(L22_44, L23_45, L22_44(L23_45, "%d+"))
                if L20_42 == L21_43 then
                  L22_44 = GameDatabase
                  L23_45 = L22_44
                  L22_44 = L22_44.set
                  L22_44(L23_45, ggd.Savedata__EventManageFlags__CurrentFreeMode, "ft" .. string.format("%02d", L20_42 + 1))
                end
              end
            end
            if L16_38 == "eventheader" then
              L21_43 = L15_37
            else
              L21_43 = L15_37 + 1
              if L20_42 then
                L21_43 = L15_37 + 2
                if L20_42 then
                  L21_43 = L15_37 + 1
                  L21_43 = INDEX_NAME
                  L21_43 = main_mission
                  L22_44 = L15_37 + 1
                  L21_43 = L21_43[L22_44]
                  L22_44 = INDEX_TYPE
                  L21_43 = L21_43[L22_44]
                  L22_44 = main_mission
                  L23_45 = L15_37 + 2
                  L22_44 = L22_44[L23_45]
                  L23_45 = INDEX_NAME
                  L22_44 = L22_44[L23_45]
                  L23_45 = main_mission
                  L23_45 = L23_45[L15_37 + 2]
                  L23_45 = L23_45[INDEX_TYPE]
                  if isMissionTypeDemo(L21_43) then
                    table.insert(L4_26, {category = L21_43, name = L20_42})
                    if isMissionTypeDemo(L23_45) then
                      table.insert(L4_26, {category = L23_45, name = L22_44})
                    end
                  end
                end
              end
            end
            break
          end
          else
            L12_34(L13_35)
          end
        end
    end
  if L6_28 then
    L23_45 = L13_35(L14_36, L15_37)
    L17_39 = string
    L17_39 = L17_39.format
    L17_39 = L17_39(L18_40, L19_41)
    L13_35(L14_36, L15_37, L16_38)
    L13_35(L14_36, L15_37, L16_38)
  end
  if L12_34 ~= "None" and L12_34 ~= L8_30 then
    if L3_25 ~= nil then
      for L17_39, L18_40 in L14_36(L15_37) do
        L21_43 = "(.-)_()"
        if L19_41 == L10_32 then
          L21_43 = L18_40
          L19_41(L20_42, L21_43)
        end
      end
    end
    if L4_26 ~= nil then
      for L17_39, L18_40 in L14_36(L15_37) do
        L21_43 = "(.-)_()"
        if L19_41 == L10_32 then
          L21_43 = L18_40
          L19_41(L20_42, L21_43)
        end
      end
    end
  end
  return L13_35, L14_36, L15_37, L16_38
end
function setStartMission()
  local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56, L11_57
  L0_46 = GameDatabase
  L1_47 = L0_46
  L0_46 = L0_46.get
  L2_48 = ggd
  L2_48 = L2_48.Savedata__EventManageFlags__CurrentMissionName
  L0_46 = L0_46(L1_47, L2_48)
  L1_47 = GameDatabase
  L2_48 = L1_47
  L1_47 = L1_47.get
  L3_49 = ggd
  L3_49 = L3_49.Savedata__EventManageFlags__CurrentMissionType
  L1_47 = L1_47(L2_48, L3_49)
  L2_48 = findDemoListAndNextMission
  L3_49 = L0_46
  L4_50 = true
  L5_51 = L2_48(L3_49, L4_50)
  L6_52 = GameDatabase
  L7_53 = L6_52
  L6_52 = L6_52.get
  L8_54 = ggd
  L8_54 = L8_54.Savedata__EventManageFlags__ClearEpisodeNum
  L6_52 = L6_52(L7_53, L8_54)
  if L6_52 > 4 then
    L6_52 = GameDatabase
    L7_53 = L6_52
    L6_52 = L6_52.set
    L8_54 = ggd
    L8_54 = L8_54.GlobalSystemFlags__PhotoItemLoad
    L9_55 = true
    L6_52(L7_53, L8_54, L9_55)
  end
  L6_52 = isMissionTypeDemo
  L7_53 = L1_47
  L6_52 = L6_52(L7_53)
  if not L6_52 then
    L6_52, L7_53 = nil, nil
    L8_54 = L5_51
    return L6_52, L7_53, L8_54
  end
  if L3_49 > 0 and not L4_50 then
    L6_52 = main_mission
    L6_52 = L6_52[L3_49]
    L7_53 = INDEX_NAME
    L6_52 = L6_52[L7_53]
    L7_53 = GameDatabase
    L8_54 = L7_53
    L7_53 = L7_53.get
    L9_55 = ggd
    L9_55 = L9_55.Savedata__EventManageFlags__MissionReplay
    L7_53 = L7_53(L8_54, L9_55)
    L8_54 = GameDatabase
    L9_55 = L8_54
    L8_54 = L8_54.get
    L10_56 = ggd
    L10_56 = L10_56.Savedata__EventManageFlags__CurrentMissionName
    L8_54 = L8_54(L9_55, L10_56)
    L9_55 = string
    L9_55 = L9_55.match
    L10_56 = L6_52
    L11_57 = "(.-)_()"
    L9_55 = L9_55(L10_56, L11_57)
    L9_55 = L9_55 or L6_52
    L10_56 = string
    L10_56 = L10_56.match
    L11_57 = L8_54
    L10_56 = L10_56(L11_57, "(.-)_()")
    L10_56 = L10_56 or L8_54
    if L7_53 ~= "None" and L10_56 ~= L9_55 then
      L11_57 = GameDatabase
      L11_57 = L11_57.get
      L11_57 = L11_57(L11_57, ggd.Savedata__EventManageFlags__CurrentFreeMode)
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionName, "eventheader")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionType, "free")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyCommonSb, "None")
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, free_bg_tbl[L11_57])
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentCommonSb, "None")
      GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
      GameDatabase:set(ggd.GlobalSystemFlags__SideEnd, "None")
      rollbackFreeTimeFlags()
      L5_51 = findTreeTimePrepareDemo()
      debugPrint("Episode Replay Demo Start > " .. L11_57)
    else
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__ReadyMissionName, L6_52)
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__ReadyMissionType, main_mission[L3_49][INDEX_TYPE])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__ReadyCommonSb, main_mission[L3_49][INDEX_SANDBOX] or "None")
      if L6_52 ~= "eventheader" then
        L11_57 = setNextBgset
        L11_57(main_mission[L3_49][INDEX_BGSET_NAME])
      else
        L11_57 = GameDatabase
        L11_57 = L11_57.set
        L11_57(L11_57, ggd.Savedata__EventManageFlags__CurrentBgSet, free_bg_tbl[GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentFreeMode)])
      end
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__CityGem, main_mission[L3_49][INDEX_GEM])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__Outrange, main_mission[L3_49][INDEX_OUTRANGE])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__Manhole, main_mission[L3_49][INDEX_MANHOLE])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__InfoActor, main_mission[L3_49][INDEX_INFO_ACTOR])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__TreasureBox, main_mission[L3_49][INDEX_TRESURE_BOX])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__PhotoGhost, main_mission[L3_49][INDEX_PHOTO_GHOST])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__Mob, main_mission[L3_49][INDEX_MOB])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__WarShip, main_mission[L3_49][INDEX_WARSHIP])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__WarShipCannon, main_mission[L3_49][INDEX_CANNON])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__Station, main_mission[L3_49][INDEX_STATION])
      L11_57 = GameDatabase
      L11_57 = L11_57.set
      L11_57(L11_57, ggd.Savedata__EventManageFlags__Vehicle, main_mission[L3_49][INDEX_VEHICLE])
    end
  end
  L6_52 = L2_48
  L7_53 = L4_50
  L8_54 = L5_51
  return L6_52, L7_53, L8_54
end
function setNextMission(A0_58)
  local L1_59, L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66, L9_67, L10_68, L11_69, L12_70, L13_71, L14_72, L15_73, L16_74, L17_75, L18_76
  L1_59 = GameDatabase
  L2_60 = L1_59
  L1_59 = L1_59.get
  L3_61 = ggd
  L3_61 = L3_61.Savedata__EventManageFlags__CurrentMissionName
  L1_59 = L1_59(L2_60, L3_61)
  L2_60 = GameDatabase
  L3_61 = L2_60
  L2_60 = L2_60.get
  L4_62 = ggd
  L4_62 = L4_62.Savedata__EventManageFlags__CurrentMissionType
  L2_60 = L2_60(L3_61, L4_62)
  L3_61 = GameDatabase
  L4_62 = L3_61
  L3_61 = L3_61.set
  L5_63 = ggd
  L5_63 = L5_63.Savedata__EventManageFlags__LateMissionName
  L6_64 = L1_59
  L3_61(L4_62, L5_63, L6_64)
  L3_61 = GameDatabase
  L4_62 = L3_61
  L3_61 = L3_61.set
  L5_63 = ggd
  L5_63 = L5_63.Savedata__EventManageFlags__LateMissionType
  L6_64 = L2_60
  L3_61(L4_62, L5_63, L6_64)
  if A0_58 then
    L1_59 = A0_58
  end
  L3_61 = string
  L3_61 = L3_61.find
  L4_62 = L1_59
  L5_63 = "header"
  L3_61 = L3_61(L4_62, L5_63)
  if L3_61 == nil then
    L3_61 = "Savedata__EventClearFlags__"
    L4_62 = string
    L4_62 = L4_62.match
    L5_63 = L1_59
    L6_64 = "(.-)_()"
    L4_62 = L4_62(L5_63, L6_64)
    L4_62 = L4_62 or L1_59
    L5_63 = "__"
    L6_64 = L1_59
    L3_61 = L3_61 .. L4_62 .. L5_63 .. L6_64
    L4_62 = ggd
    L4_62 = L4_62[L3_61]
    if L4_62 then
      L5_63 = GameDatabase
      L6_64 = L5_63
      L5_63 = L5_63.set
      L7_65 = L4_62
      L8_66 = 1
      L5_63(L6_64, L7_65, L8_66)
    else
      L5_63 = debugPrint
      L6_64 = L3_61
      L7_65 = " \227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\227\128\130\229\159\186\229\185\185\233\131\168\229\136\134\227\129\171\232\191\189\229\138\160\227\129\174\228\190\157\233\160\188\227\130\146\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\227\128\130"
      L6_64 = L6_64 .. L7_65
      L5_63(L6_64)
    end
  else
    L3_61 = debugPrint
    L4_62 = L1_59
    L5_63 = " \227\129\175\227\130\175\227\131\170\227\130\162\227\131\149\227\131\169\227\130\176\227\129\174\231\174\161\231\144\134\229\164\150\227\129\167\227\129\153\227\128\130"
    L4_62 = L4_62 .. L5_63
    L3_61(L4_62)
  end
  L3_61 = findDemoListAndNextMission
  L4_62 = L1_59
  L6_64 = L3_61(L4_62)
  if L4_62 <= 0 then
    L7_65 = L3_61
    L8_66 = L5_63
    return L7_65, L8_66
  end
  L7_65 = main_mission
  L7_65 = L7_65[L4_62]
  L8_66 = INDEX_NAME
  L8_66 = L7_65[L8_66]
  L9_67 = INDEX_TYPE
  L9_67 = L7_65[L9_67]
  L10_68 = INDEX_SANDBOX
  L10_68 = L7_65[L10_68]
  L10_68 = L10_68 or "None"
  L11_69 = nil
  L12_70 = setNextBgset
  L13_71 = INDEX_BGSET_NAME
  L13_71 = L7_65[L13_71]
  L12_70(L13_71)
  L12_70 = debugPrint
  L13_71 = "NextMission > "
  L14_72 = L8_66
  L13_71 = L13_71 .. L14_72
  L12_70(L13_71)
  L12_70 = string
  L12_70 = L12_70.match
  L13_71 = L8_66
  L14_72 = "(.-)_()"
  L12_70 = L12_70(L13_71, L14_72)
  L12_70 = L12_70 or L8_66
  L13_71 = string
  L13_71 = L13_71.match
  L14_72 = L1_59
  L15_73 = "(.-)_()"
  L13_71 = L13_71(L14_72, L15_73)
  L13_71 = L13_71 or L1_59
  L14_72 = string
  L14_72 = L14_72.match
  L15_73 = L8_66
  L16_74 = "%l+"
  L14_72 = L14_72(L15_73, L16_74)
  L15_73 = string
  L15_73 = L15_73.match
  L16_74 = L1_59
  L17_75 = "%l+"
  L15_73 = L15_73(L16_74, L17_75)
  L16_74 = tonumber
  L17_75 = string
  L17_75 = L17_75.match
  L18_76 = L1_59
  L18_76 = L17_75(L18_76, "%d+")
  L16_74 = L16_74(L17_75, L18_76, L17_75(L18_76, "%d+"))
  L17_75 = GameDatabase
  L18_76 = L17_75
  L17_75 = L17_75.get
  L17_75 = L17_75(L18_76, ggd.Savedata__EventManageFlags__MissionReplay)
  if L17_75 ~= "None" and L17_75 ~= L1_59 and L13_71 ~= L12_70 then
    L18_76 = GameDatabase
    L18_76 = L18_76.get
    L18_76 = L18_76(L18_76, ggd.Savedata__EventManageFlags__CurrentFreeMode)
    L5_63 = false
    if L15_73 == "ep" then
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionName, "eventheader")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionType, "free")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyCommonSb, "None")
    else
      HUD:blackout(1)
      while not HUD:faderStability() do
        wait()
      end
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, "eventheader")
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, "free")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionName, "None")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionType, "None")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyCommonSb, "None")
    end
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, free_bg_tbl[L18_76])
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentCommonSb, "None")
    GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
    GameDatabase:set(ggd.GlobalSystemFlags__SideEnd, "None")
    rollbackFreeTimeFlags()
    L6_64 = findTreeTimePrepareDemo()
    debugPrint("Episode Replay End > " .. L18_76)
  else
    if L2_60 == "free" then
      L18_76 = backupFreeTimeFlags
      L18_76()
      L18_76 = #L3_61
      if L18_76 >= 1 then
        L18_76 = GameDatabase
        L18_76 = L18_76.set
        L18_76(L18_76, ggd.GlobalSystemFlags__AreaResetCoercion, true)
      end
    end
    if L9_67 == "free" then
      if L15_73 == "ep" or L15_73 == "eps" then
        L18_76 = setFreeTimeFlags
        L18_76(L7_65)
      else
        L18_76 = rollbackFreeTimeFlags
        L18_76()
      end
    else
      L18_76 = setFreeTimeFlags
      L18_76(L7_65)
    end
    if L9_67 == "free" then
      L18_76 = getNextFreeTime
      L18_76 = L18_76(L1_59)
      if L18_76 ~= nil then
        GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentFreeMode, L18_76)
      else
        L18_76 = GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentFreeMode)
      end
      L11_69 = free_bg_tbl[L18_76]
    end
    if L14_72 == "sm" then
      L18_76 = GameDatabase
      L18_76 = L18_76.get
      L18_76 = L18_76(L18_76, ggd.Savedata__EventManageFlags__CurrentFreeMode)
      if (L18_76 == "ft28" or L18_76 == "ft21") and GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_hex_01" then
        L11_69 = "bg_world_01"
        debugPrint("Overraide Bgset : bg_hex_01 > bg_world_01" .. L8_66)
      end
    end
    if L11_69 then
      L18_76 = debugPrint
      L18_76("NextBgset > " .. tostring(L11_69))
      L18_76 = GameDatabase
      L18_76 = L18_76.set
      L18_76(L18_76, ggd.Savedata__EventManageFlags__CurrentBgSet, L11_69)
    else
      L18_76 = debugPrint
      L18_76("not change Bgset")
    end
    L18_76 = false
    if #L3_61 >= 1 and L3_61[1].category == "monologue" then
      L18_76 = true
    end
    if #L3_61 < 1 or L18_76 then
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, L8_66)
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, L9_67)
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentCommonSb, L10_68)
    else
      GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, L3_61[1].name)
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, L3_61[1].category)
      GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentCommonSb, "None")
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionName, L8_66)
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionType, L9_67)
      GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyCommonSb, L10_68)
    end
    if L13_71 ~= L12_70 then
      if L9_67 == "free" and GameDatabase:get(ggd.Savedata__EventManageFlags__MissionReplay) == "None" then
        if L15_73 == "sm" and (GameDatabase:get(ggd.Savedata__EventManageFlags__PastSideMission) or L18_76 == true) then
          GameDatabase:set(ggd.GlobalSystemFlags__SkipPlayerStartPos, false)
          GameDatabase:set(ggd.GlobalSystemFlags__GameClear, true)
        end
        if L15_73 == "cm" then
          GameDatabase:set(ggd.GlobalSystemFlags__GameClear, true)
        end
      end
      if #L3_61 >= 1 then
        GameDatabase:set(ggd.GlobalSystemFlags__AreaResetCoercion, true)
      end
      setEventFinishedFlags(L13_71, L12_70, L9_67)
    elseif L15_73 == "cm" then
      setEventFinishedFlags(L13_71, L12_70, L9_67)
    end
  end
  L18_76 = L3_61
  return L18_76, L5_63, L6_64
end
function setEventFinishedFlags(A0_77, A1_78, A2_79)
  local L3_80, L4_81, L5_82
  if A2_79 ~= "free" then
    L3_80 = ggd
    L4_81 = "Savedata__Menu__EventStateFlags__"
    L5_82 = A1_78
    L4_81 = L4_81 .. L5_82
    L3_80 = L3_80[L4_81]
    if L3_80 then
      L4_81 = GameDatabase
      L5_82 = L4_81
      L4_81 = L4_81.get
      L4_81 = L4_81(L5_82, L3_80)
      if L4_81 == 0 then
        L4_81 = GameDatabase
        L5_82 = L4_81
        L4_81 = L4_81.set
        L4_81(L5_82, L3_80, 1)
        L4_81 = HUD
        L5_82 = L4_81
        L4_81 = L4_81.setTimeStampMissionUnlock
        L4_81(L5_82, A1_78)
      end
    end
  end
  L3_80 = ggd
  L4_81 = "Savedata__EventFinishedFlags__"
  L5_82 = A0_77
  L4_81 = L4_81 .. L5_82
  L3_80 = L3_80[L4_81]
  if L3_80 then
    L4_81 = GameDatabase
    L5_82 = L4_81
    L4_81 = L4_81.get
    L4_81 = L4_81(L5_82, L3_80)
    if L4_81 == 0 then
      L4_81 = GameDatabase
      L5_82 = L4_81
      L4_81 = L4_81.set
      L4_81(L5_82, L3_80, 1)
      L4_81 = GameDatabase
      L5_82 = L4_81
      L4_81 = L4_81.set
      L4_81(L5_82, ggd.GlobalSystemFlags__ClearMissionName, A0_77)
      L4_81 = string
      L4_81 = L4_81.match
      L5_82 = A0_77
      L4_81 = L4_81(L5_82, "%l+")
      if L4_81 ~= "cm" then
        L5_82 = tonumber
        L5_82 = L5_82(string.match(A0_77, "%d+"))
        GameDatabase:set(ggd.Savedata__RewardFlags__Index, A0_77)
        Analytics:missionStatus(Analytics.kMissionClear)
        setClearEpisode(L4_81, L5_82)
        setPlayerExperience(A0_77)
      end
    end
  end
end
function setRollbackMission()
  local L0_83, L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92, L10_93, L11_94, L12_95, L13_96
  L0_83 = Analytics
  L1_84 = L0_83
  L0_83 = L0_83.missionStatus
  L2_85 = Analytics
  L2_85 = L2_85.kMissionRetire
  L0_83(L1_84, L2_85)
  L0_83 = GameDatabase
  L1_84 = L0_83
  L0_83 = L0_83.get
  L2_85 = ggd
  L2_85 = L2_85.Savedata__EventManageFlags__CurrentMissionName
  L0_83 = L0_83(L1_84, L2_85)
  L1_84 = GameDatabase
  L2_85 = L1_84
  L1_84 = L1_84.get
  L3_86 = ggd
  L3_86 = L3_86.Savedata__EventManageFlags__CurrentMissionType
  L1_84 = L1_84(L2_85, L3_86)
  L2_85 = GameDatabase
  L3_86 = L2_85
  L2_85 = L2_85.get
  L4_87 = ggd
  L4_87 = L4_87.Savedata__EventManageFlags__CurrentFreeMode
  L2_85 = L2_85(L3_86, L4_87)
  L3_86 = {}
  L4_87 = {
    L5_88,
    L6_89,
    L7_90,
    L8_91,
    L9_92,
    L10_93
  }
  L5_88 = ggd
  L5_88 = L5_88.Savedata__EventManageFlags
  L6_89 = ggd
  L6_89 = L6_89.Savedata__FreeTimeFlags
  L7_90 = ggd
  L7_90 = L7_90.Savedata__EventClearFlags
  L8_91 = ggd
  L8_91 = L8_91.Savedata__EventFlags
  L9_92 = ggd
  L9_92 = L9_92.Savedata__Info
  L10_93 = ggd
  L10_93 = L10_93.Savedata__BrokenObj
  L5_88 = GameDatabase
  L6_89 = L5_88
  L5_88 = L5_88.restore
  L7_90 = L4_87
  L5_88(L6_89, L7_90)
  L5_88 = GameDatabase
  L6_89 = L5_88
  L5_88 = L5_88.reset
  L7_90 = ggd
  L7_90 = L7_90.Savedata__TalismanOre
  L5_88(L6_89, L7_90)
  L5_88 = GameDatabase
  L6_89 = L5_88
  L5_88 = L5_88.reset
  L7_90 = ggd
  L7_90 = L7_90.Savedata__EventManageFlags__MonologueStart
  L5_88(L6_89, L7_90)
  L5_88 = GameDatabase
  L6_89 = L5_88
  L5_88 = L5_88.reset
  L7_90 = ggd
  L7_90 = L7_90.Savedata__EventManageFlags__MonologueEnd
  L5_88(L6_89, L7_90)
  L5_88 = string
  L5_88 = L5_88.match
  L6_89 = L0_83
  L7_90 = "(.-)_()"
  L5_88 = L5_88(L6_89, L7_90)
  L5_88 = L5_88 or L0_83
  L6_89 = GameDatabase
  L7_90 = L6_89
  L6_89 = L6_89.get
  L8_91 = ggd
  L8_91 = L8_91.Savedata__EventManageFlags__MissionReplay
  L6_89 = L6_89(L7_90, L8_91)
  if L6_89 == "None" then
    L6_89 = ggd
    L7_90 = "Savedata__EventClearFlags__"
    L8_91 = L5_88
    L7_90 = L7_90 .. L8_91
    L6_89 = L6_89[L7_90]
    if L6_89 ~= nil then
      L7_90 = GameDatabase
      L8_91 = L7_90
      L7_90 = L7_90.reset
      L9_92 = L6_89
      L7_90(L8_91, L9_92)
      L7_90 = debugPrint
      L8_91 = "EventClearFlags\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136"
      L7_90(L8_91)
    end
  else
    L6_89 = debugPrint
    L7_90 = "\227\130\168\227\131\148\227\130\189\227\131\188\227\131\137\227\131\170\227\131\151\227\131\172\227\130\164\227\129\174\227\131\170\227\130\191\227\130\164\227\130\162\227\129\167\227\129\175EventClearFlags\227\130\146\227\131\170\227\130\187\227\131\131\227\131\136\227\129\151\227\129\190\227\129\155\227\130\147"
    L6_89(L7_90)
  end
  L6_89 = ggd
  L7_90 = "Savedata__EventFlags__"
  L8_91 = L5_88
  L7_90 = L7_90 .. L8_91
  L6_89 = L6_89[L7_90]
  if L6_89 then
    L7_90 = GameDatabase
    L8_91 = L7_90
    L7_90 = L7_90.reset
    L9_92 = L6_89
    L7_90(L8_91, L9_92)
  end
  L7_90 = ggd
  L8_91 = "EventFlags__"
  L9_92 = L5_88
  L8_91 = L8_91 .. L9_92
  L7_90 = L7_90[L8_91]
  if L7_90 ~= nil then
    L8_91 = GameDatabase
    L9_92 = L8_91
    L8_91 = L8_91.reset
    L10_93 = L7_90
    L8_91(L9_92, L10_93)
  end
  L8_91 = GameDatabase
  L9_92 = L8_91
  L8_91 = L8_91.set
  L10_93 = ggd
  L10_93 = L10_93.Savedata__EventManageFlags__LateMissionName
  L11_94 = L0_83
  L8_91(L9_92, L10_93, L11_94)
  L8_91 = GameDatabase
  L9_92 = L8_91
  L8_91 = L8_91.set
  L10_93 = ggd
  L10_93 = L10_93.Savedata__EventManageFlags__LateMissionType
  L11_94 = L1_84
  L8_91(L9_92, L10_93, L11_94)
  L8_91 = getMissionInfo
  L9_92 = L0_83
  L9_92 = L8_91(L9_92)
  L10_93 = string
  L10_93 = L10_93.match
  L11_94 = L0_83
  L12_95 = "%l+"
  L10_93 = L10_93(L11_94, L12_95)
  L11_94 = tonumber
  L12_95 = string
  L12_95 = L12_95.match
  L13_96 = L0_83
  L13_96 = L12_95(L13_96, "%d+")
  L11_94 = L11_94(L12_95, L13_96, L12_95(L13_96, "%d+"))
  L12_95 = string
  L12_95 = L12_95.sub
  L13_96 = L0_83
  L12_95 = L12_95(L13_96, 1, 4)
  if L10_93 == "ep" or L10_93 == "sm" then
    L13_96 = ggd
    L13_96 = L13_96["Savedata__Info__" .. L12_95]
    if L13_96 then
      GameDatabase:reset(L13_96)
    end
  end
  if L12_95 == "ep07" then
    L13_96 = GameDatabase
    L13_96 = L13_96.reset
    L13_96(L13_96, ggd.Savedata__BrokenObj__ep07)
  elseif L12_95 == "ep10" then
    L13_96 = GameDatabase
    L13_96 = L13_96.reset
    L13_96(L13_96, ggd.Savedata__BrokenObj__ep10)
  elseif L12_95 == "ep26" then
    L13_96 = GameDatabase
    L13_96 = L13_96.reset
    L13_96(L13_96, ggd.Savedata__BrokenObj__ep26)
  end
  L13_96 = GameDatabase
  L13_96 = L13_96.set
  L13_96(L13_96, ggd.GlobalSystemFlags__SideEnd, "None")
  if L2_85 == nil or L2_85 == "" then
    L13_96 = "ft"
    L2_85 = L13_96 .. string.format("%02d", L9_92)
    L13_96 = GameDatabase
    L13_96 = L13_96.set
    L13_96(L13_96, ggd.Savedata__EventManageFlags__CurrentFreeMode, L2_85)
  end
  if L8_91 == "ep" then
    L13_96 = GameDatabase
    L13_96 = L13_96.get
    L13_96 = L13_96(L13_96, ggd.Savedata__EventManageFlags__MissionReplay)
    if L13_96 == "None" then
      L13_96 = string
      L13_96 = L13_96.match
      L13_96 = L13_96(L0_83, "(.-)_()")
      L13_96 = L13_96 .. "_"
      for _FORV_17_ = 1, #main_mission do
        if string.find(main_mission[_FORV_17_][INDEX_NAME], L13_96) ~= nil then
          if main_mission[_FORV_17_][INDEX_TYPE] == "header" then
            GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, main_mission[_FORV_17_ - 1][INDEX_NAME])
            GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, main_mission[_FORV_17_ - 1][INDEX_TYPE])
            GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentCommonSb, main_mission[_FORV_17_ - 1][INDEX_SANDBOX])
            GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, free_bg_tbl[L2_85])
            rollbackFreeTimeFlags()
            break
          end
          GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, main_mission[_FORV_17_][INDEX_NAME])
          GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, main_mission[_FORV_17_][INDEX_TYPE])
          GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentCommonSb, main_mission[_FORV_17_][INDEX_SANDBOX])
          GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, main_mission[_FORV_17_][INDEX_BGSET_NAME])
          setFreeTimeFlags(main_mission[_FORV_17_])
          break
        end
      end
    end
  else
    L13_96 = GameDatabase
    L13_96 = L13_96.set
    L13_96(L13_96, ggd.Savedata__EventManageFlags__CurrentMissionName, "eventheader")
    L13_96 = GameDatabase
    L13_96 = L13_96.set
    L13_96(L13_96, ggd.Savedata__EventManageFlags__CurrentMissionType, "free")
    L13_96 = GameDatabase
    L13_96 = L13_96.set
    L13_96(L13_96, ggd.Savedata__EventManageFlags__CurrentCommonSb, "None")
    L13_96 = GameDatabase
    L13_96 = L13_96.set
    L13_96(L13_96, ggd.Savedata__EventManageFlags__CurrentBgSet, free_bg_tbl[L2_85])
    L13_96 = rollbackFreeTimeFlags
    L13_96()
    L13_96 = findTreeTimePrepareDemo
    L13_96 = L13_96()
    L3_86 = L13_96
  end
  return L3_86
end
function setExceptionMission(A0_97, A1_98)
  if A1_98 then
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionName, "free")
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, "free")
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentBgSet, A1_98)
    GameDatabase:set(ggd.Savedata__EventManageFlags__CityGem, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__Outrange, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__Manhole, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__TreasureBox, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__PhotoGhost, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__WarShip, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__WarShipCannon, false)
    GameDatabase:set(ggd.Savedata__EventManageFlags__Station, false)
  else
    setNextMission(A0_97)
  end
end
function setClearEpisode(A0_99, A1_100)
  local L2_101, L3_102
  L2_101 = GameDatabase
  L3_102 = L2_101
  L2_101 = L2_101.get
  L2_101 = L2_101(L3_102, ggd.Savedata__EventManageFlags__ClearEpisodeNum)
  L3_102 = GameDatabase
  L3_102 = L3_102.get
  L3_102 = L3_102(L3_102, ggd.Savedata__EventManageFlags__ClearSideNum)
  if A0_99 == "ep" then
    L2_101 = L2_101 + 1
    GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentEpisodeNum, A1_100 + 1)
    GameDatabase:set(ggd.Savedata__EventManageFlags__ClearEpisodeNum, L2_101)
    GameDatabase:set(ggd.GlobalSystemFlags__NetWorkService, true)
  elseif A0_99 == "sm" then
    L3_102 = L3_102 + 1
    GameDatabase:set(ggd.Savedata__EventManageFlags__ClearSideNum, L3_102)
    if L3_102 == 1 then
      GameDatabase:set(ggd.GlobalSystemFlags__Trophy, 7)
    elseif L3_102 == 20 then
      GameDatabase:set(ggd.GlobalSystemFlags__Trophy, 8)
    elseif L3_102 == 40 then
      GameDatabase:set(ggd.GlobalSystemFlags__Trophy, 9)
    elseif L3_102 == 49 then
      GameDatabase:set(ggd.GlobalSystemFlags__Trophy, 10)
    end
  end
  setMissionClearRate(L2_101, L3_102)
end
function setMissionClearRate(A0_103, A1_104)
  local L2_105
  L2_105 = A0_103 + A1_104
  L2_105 = L2_105 / 77
  L2_105 = L2_105 * 100
  if L2_105 > 0 and L2_105 < 1 then
    L2_105 = 1
  end
  if L2_105 > 100 then
    L2_105 = 100
  end
  L2_105 = math.floor(L2_105)
  GameDatabase:set(ggd.Savedata__StatisticalChart__MissionRate, L2_105 .. "%")
end
function setPlayerExperience(A0_106)
  local L1_107, L2_108
  L1_107 = GameDatabase
  L2_108 = L1_107
  L1_107 = L1_107.get
  L1_107 = L1_107(L2_108, ggd.Savedata__Player__Experience)
  L2_108 = _exp
  L2_108 = L2_108[A0_106]
  if L2_108 then
    L2_108 = _exp
    L2_108 = L2_108[A0_106]
    L1_107 = L1_107 + L2_108
    L2_108 = GameDatabase
    L2_108 = L2_108.set
    L2_108(L2_108, ggd.Savedata__Player__Experience, L1_107)
  end
  L2_108 = GameDatabase
  L2_108 = L2_108.get
  L2_108 = L2_108(L2_108, ggd.Savedata__Player__Level)
  L2_108 = L2_108 + 1
  if _level[L2_108] and L1_107 >= _level[L2_108] then
    GameDatabase:set(ggd.Savedata__Player__Level, L2_108)
    GameDatabase:set(ggd.Savedata__Player__LevelUp, true)
    Player:setPowerUpLevel(Player.kPowUpCateg_Base, L2_108)
  end
end
function setNextMissionDemo(A0_109, A1_110, A2_111, A3_112)
  local L4_113, L5_114, L6_115, L7_116
  if A1_110 then
    L4_113 = GameDatabase
    L5_114 = L4_113
    L4_113 = L4_113.get
    L6_115 = ggd
    L6_115 = L6_115.Savedata__EventManageFlags__CurrentMissionName
    L4_113 = L4_113(L5_114, L6_115)
    L5_114 = GameDatabase
    L6_115 = L5_114
    L5_114 = L5_114.get
    L7_116 = ggd
    L7_116 = L7_116.Savedata__EventManageFlags__CurrentMissionType
    L5_114 = L5_114(L6_115, L7_116)
    L6_115 = GameDatabase
    L7_116 = L6_115
    L6_115 = L6_115.set
    L6_115(L7_116, ggd.Savedata__EventManageFlags__CurrentMissionName, A1_110)
    L6_115 = GameDatabase
    L7_116 = L6_115
    L6_115 = L6_115.set
    L6_115(L7_116, ggd.Savedata__EventManageFlags__CurrentMissionType, A2_111)
    L6_115 = A3_112 - 1
    L6_115 = A0_109[L6_115]
    if L6_115 then
      L6_115 = GameDatabase
      L7_116 = L6_115
      L6_115 = L6_115.set
      L6_115(L7_116, ggd.Savedata__EventManageFlags__LateMissionName, A0_109[A3_112 - 1].name)
      L6_115 = GameDatabase
      L7_116 = L6_115
      L6_115 = L6_115.set
      L6_115(L7_116, ggd.Savedata__EventManageFlags__LateMissionType, A0_109[A3_112 - 1].category)
    else
      L6_115 = GameDatabase
      L7_116 = L6_115
      L6_115 = L6_115.set
      L6_115(L7_116, ggd.Savedata__EventManageFlags__LateMissionName, L4_113)
      L6_115 = GameDatabase
      L7_116 = L6_115
      L6_115 = L6_115.set
      L6_115(L7_116, ggd.Savedata__EventManageFlags__LateMissionType, L5_114)
    end
  else
    L4_113 = GameDatabase
    L5_114 = L4_113
    L4_113 = L4_113.get
    L6_115 = ggd
    L6_115 = L6_115.Savedata__EventManageFlags__ReadyMissionName
    L4_113 = L4_113(L5_114, L6_115)
    if L4_113 ~= "None" and L4_113 ~= "" and L4_113 ~= nil then
      L5_114 = GameDatabase
      L6_115 = L5_114
      L5_114 = L5_114.set
      L7_116 = ggd
      L7_116 = L7_116.Savedata__EventManageFlags__LateMissionName
      L5_114(L6_115, L7_116, GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName))
      L5_114 = GameDatabase
      L6_115 = L5_114
      L5_114 = L5_114.set
      L7_116 = ggd
      L7_116 = L7_116.Savedata__EventManageFlags__LateMissionType
      L5_114(L6_115, L7_116, GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionType))
      L5_114 = GameDatabase
      L6_115 = L5_114
      L5_114 = L5_114.set
      L7_116 = ggd
      L7_116 = L7_116.Savedata__EventManageFlags__CurrentMissionName
      L5_114(L6_115, L7_116, GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName))
      L5_114 = GameDatabase
      L6_115 = L5_114
      L5_114 = L5_114.set
      L7_116 = ggd
      L7_116 = L7_116.Savedata__EventManageFlags__CurrentMissionType
      L5_114(L6_115, L7_116, GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionType))
      L5_114 = GameDatabase
      L6_115 = L5_114
      L5_114 = L5_114.set
      L7_116 = ggd
      L7_116 = L7_116.Savedata__EventManageFlags__CurrentCommonSb
      L5_114(L6_115, L7_116, GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyCommonSb))
    end
  end
  L4_113 = GameDatabase
  L5_114 = L4_113
  L4_113 = L4_113.get
  L6_115 = ggd
  L6_115 = L6_115.Savedata__EventManageFlags__MissionReplay
  L4_113 = L4_113(L5_114, L6_115)
  if L4_113 == "None" then
    L4_113 = GameDatabase
    L5_114 = L4_113
    L4_113 = L4_113.get
    L6_115 = ggd
    L6_115 = L6_115.Savedata__EventManageFlags__CurrentMissionName
    L4_113 = L4_113(L5_114, L6_115)
    L5_114 = GameDatabase
    L6_115 = L5_114
    L5_114 = L5_114.get
    L7_116 = ggd
    L7_116 = L7_116.Savedata__EventManageFlags__LateMissionName
    L5_114 = L5_114(L6_115, L7_116)
    L6_115 = string
    L6_115 = L6_115.match
    L7_116 = L4_113
    L6_115 = L6_115(L7_116, "(.-)_()")
    L6_115 = L6_115 or L4_113
    L7_116 = string
    L7_116 = L7_116.match
    L7_116 = L7_116(L5_114, "(.-)_()")
    L7_116 = L7_116 or L5_114
    if L7_116 ~= L6_115 then
      setEventFinishedFlags(L7_116, L6_115, GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionType))
    end
  end
  L4_113 = _autoSaveReq
  L4_113()
end
function getCreateSandboxParam()
  local L0_117, L1_118, L2_119
  L0_117 = GameDatabase
  L1_118 = L0_117
  L0_117 = L0_117.get
  L2_119 = ggd
  L2_119 = L2_119.Savedata__EventManageFlags__CurrentMissionName
  L0_117 = L0_117(L1_118, L2_119)
  L1_118 = GameDatabase
  L2_119 = L1_118
  L1_118 = L1_118.get
  L1_118 = L1_118(L2_119, ggd.Savedata__EventManageFlags__CurrentMissionType)
  L2_119 = GameDatabase
  L2_119 = L2_119.get
  L2_119 = L2_119(L2_119, ggd.Savedata__EventManageFlags__CurrentCommonSb)
  if GameDatabase:get(ggd.GlobalSystemFlags__Demo) and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= "None" and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= "" and GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName) ~= nil then
    L0_117 = GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName)
    L1_118 = GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionType)
    L2_119 = GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyCommonSb)
  end
  return L0_117, L1_118, L2_119
end
function DBG_setCurrentMission()
  local L0_120, L1_121, L2_122, L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139
  L0_120 = GameDatabase
  L1_121 = L0_120
  L0_120 = L0_120.get
  L2_122 = ggd
  L2_122 = L2_122.Debug__TitleSkip
  L0_120 = L0_120(L1_121, L2_122)
  if not L0_120 then
    L0_120 = debugPrint
    L1_121 = "\239\188\129\239\188\129\227\131\135\227\131\144\227\131\131\227\130\176\227\129\174\227\130\191\227\130\164\227\131\136\227\131\171\227\130\185\227\130\173\227\131\131\227\131\151\227\129\140\231\132\161\227\129\132\227\129\174\227\129\167\227\128\129\227\131\135\227\131\144\227\131\131\227\130\176\227\129\174\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\232\168\173\229\174\154\227\129\175\227\129\151\227\129\190\227\129\155\227\130\147\239\188\129\239\188\129"
    L0_120(L1_121)
    L0_120 = true
    return L0_120
  else
    L0_120 = debugPrint
    L1_121 = "\239\188\129\239\188\129\227\130\191\227\130\164\227\131\136\227\131\171\227\129\171\230\136\187\227\129\163\227\129\159\230\153\130\227\129\171\227\131\135\227\131\144\227\131\131\227\130\176\227\129\167\227\129\174\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\232\168\173\229\174\154\227\129\140\232\181\183\229\139\149\227\129\151\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\227\129\151\227\129\190\227\129\153\239\188\129\239\188\129"
    L0_120(L1_121)
    L0_120 = GameDatabase
    L1_121 = L0_120
    L0_120 = L0_120.set
    L2_122 = ggd
    L2_122 = L2_122.Debug__TitleSkip
    L3_123 = false
    L0_120(L1_121, L2_122, L3_123)
  end
  L0_120 = GameDatabase
  L1_121 = L0_120
  L0_120 = L0_120.get
  L2_122 = ggd
  L2_122 = L2_122.Debug__StartMission
  L0_120 = L0_120(L1_121, L2_122)
  if L0_120 == "None" or L0_120 == nil then
    L1_121 = debugPrint
    L2_122 = "\239\188\129\239\188\129\227\131\135\227\131\144\227\131\131\227\130\176\231\148\168\227\129\174\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\140\229\174\154\231\190\169\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\228\189\149\227\130\130\227\129\151\227\129\190\227\129\155\227\130\147\239\188\129\239\188\129"
    L1_121(L2_122)
    L1_121 = true
    return L1_121
  end
  L1_121 = dofile
  L2_122 = "/Game/Event2/Table/RewardTable.lua"
  L1_121(L2_122)
  L1_121 = GameDatabase
  L2_122 = L1_121
  L1_121 = L1_121.get
  L3_123 = ggd
  L3_123 = L3_123.Debug__UserTest
  L1_121 = L1_121(L2_122, L3_123)
  if L1_121 then
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.set
    L3_123 = ggd
    L3_123 = L3_123.Debug__PlayerLevel
    L4_124 = false
    L1_121(L2_122, L3_123, L4_124)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.set
    L3_123 = ggd
    L3_123 = L3_123.Savedata__Player__Costume
    L4_124 = "kit01"
    L1_121(L2_122, L3_123, L4_124)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__EventManageFlags
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__EventFinishedFlags
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__EventClearFlags
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__EventFlags
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__FreeTimeFlags
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__Mine99
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__CreneShipFlags
    L1_121(L2_122, L3_123)
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.reset
    L3_123 = ggd
    L3_123 = L3_123.Savedata__BrokenObj
    L1_121(L2_122, L3_123)
  else
    L1_121 = GameDatabase
    L2_122 = L1_121
    L1_121 = L1_121.set
    L3_123 = ggd
    L3_123 = L3_123.Debug__PlayerLevel
    L4_124 = true
    L1_121(L2_122, L3_123, L4_124)
  end
  L1_121 = GameDatabase
  L2_122 = L1_121
  L1_121 = L1_121.set
  L3_123 = ggd
  L3_123 = L3_123.Debug__DebugFontDisp
  L4_124 = true
  L1_121(L2_122, L3_123, L4_124)
  L1_121 = string
  L1_121 = L1_121.match
  L2_122 = L0_120
  L3_123 = "%l+"
  L1_121 = L1_121(L2_122, L3_123)
  L2_122 = tonumber
  L3_123 = string
  L3_123 = L3_123.match
  L4_124 = L0_120
  L19_139 = L3_123(L4_124, L5_125)
  L2_122 = L2_122(L3_123, L4_124, L5_125, L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139, L3_123(L4_124, L5_125))
  L3_123 = "ep"
  L4_124 = 0
  if L1_121 == "ep" or L1_121 == "eps" or L1_121 == "ft" then
    L3_123 = L1_121
    L4_124 = L2_122
  elseif L1_121 == "sm" or L1_121 == "cm" then
    L19_139 = L6_126(L7_127, L8_128)
    L3_123 = L6_126
    L19_139 = L7_127(L8_128, L9_129)
    L4_124 = L6_126
  elseif L1_121 == "dm" then
    L5_125(L6_126, L7_127)
    L5_125(L6_126, L7_127, L8_128)
  end
  if L1_121 == "eps" then
    L19_139 = L8_128(L9_129)
    L5_125(L6_126, L7_127, L8_128, L9_129, L10_130, L11_131, L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139, L8_128(L9_129))
  end
  if L1_121 == "mine" then
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
  end
  L5_125(L6_126, L7_127, L8_128)
  L5_125(L6_126, L7_127, L8_128)
  if L4_124 > 0 then
    if L4_124 == 80 then
      L5_125(L6_126)
      if not L5_125 then
        L5_125(L6_126, L7_127)
      end
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
    end
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    if L4_124 >= 3 then
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      if L4_124 == 3 then
        if L0_120 == "ep03_o" or L0_120 == "ep03_p" or L0_120 == "ep03_q" or L0_120 == "ep03_r" then
          L5_125(L6_126, L7_127, L8_128)
        elseif L0_120 == "ep03_s" or L0_120 == "ep03_t" then
          L5_125(L6_126, L7_127, L8_128)
          L5_125(L6_126, L7_127, L8_128)
        end
      else
        L5_125(L6_126, L7_127, L8_128)
        L5_125(L6_126, L7_127, L8_128)
      end
    end
    if L4_124 >= 9 then
      if L4_124 == 9 then
        if L0_120 == "ep09_j" or L0_120 == "ep09_k" or L0_120 == "ep09_l" or L0_120 == "ep09_m" or L0_120 == "ep09_n" or L0_120 == "ep09_o" or L0_120 == "ep09_p" or L0_120 == "ep09_q" or L0_120 == "ep09_r" or L0_120 == "ep09_s" or L0_120 == "ep09_t" then
          L5_125(L6_126, L7_127, L8_128)
        end
      else
        L5_125(L6_126, L7_127, L8_128)
      end
    end
    if L4_124 >= 12 then
      if L4_124 == 9 then
        if L0_120 == "ep12_g" or L0_120 == "ep12_h" or L0_120 == "ep12_i" or L0_120 == "ep12_j" or L0_120 == "ep12_k" or L0_120 == "ep12_l" or L0_120 == "ep12_m" or L0_120 == "ep12_n" or L0_120 == "ep12_o" or L0_120 == "ep12_p" or L0_120 == "ep12_q" or L0_120 == "ep12_r" or L0_120 == "ep12_s" or L0_120 == "ep12_t" or L0_120 == "ep12_u" or L0_120 == "ep12_v" or L0_120 == "ep12_w" then
          L5_125(L6_126, L7_127, L8_128)
        end
      else
        L5_125(L6_126, L7_127, L8_128)
      end
    end
    for L8_128 = 0, L4_124 - 1 do
      if L10_130 then
        L11_131(L12_132, L13_133, L14_134)
      end
      if L10_130 then
        L11_131(L12_132, L13_133, L14_134)
      end
      if L10_130 then
        L11_131(L12_132, L13_133, L14_134)
      end
      L11_131(L12_132, L13_133)
      L11_131(L12_132, L13_133, L14_134, L15_135, L16_136)
    end
    if (L3_123 == "ep" or L3_123 == "ft") and L4_124 == 3 then
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
    end
    if (L3_123 == "ep" or L3_123 == "ft") and L4_124 == 4 then
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
    end
    if L4_124 >= 5 then
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
    end
    if L4_124 > 21 then
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
      L5_125(L6_126, L7_127, L8_128)
    end
  end
  if L1_121 == "ft" then
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125(L6_126, L7_127, L8_128)
    L5_125.ft03 = "eps03"
    L5_125.ft04 = "eps04"
    L5_125.ft05 = "eps05_b"
    L5_125.ft06 = "eps06"
    L5_125.ft07 = "ep06_00300c"
    L5_125.ft08 = "eps08"
    L5_125.ft09 = "ep08_00600c"
    L5_125.ft10 = "eps10"
    L5_125.ft11 = "ep10_00600m"
    L5_125.ft14 = "ep13_00400c"
    L5_125.ft15 = "eps15"
    L5_125.ft16 = "eps16"
    L5_125.ft18 = "ep17_00600c"
    L5_125.ft21 = "eps21"
    L5_125.ft28 = "eps28"
    if L6_126 then
      for L10_130 = 1, #L8_128 do
        if L11_131 == L6_126 then
          L11_131(L12_132)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          L11_131(L12_132, L13_133, L14_134)
          break
        end
      end
    else
      L7_127(L8_128)
      if L2_122 < 5 or L2_122 > 30 then
        L7_127(L8_128, L9_129, L10_130)
        L7_127(L8_128, L9_129, L10_130)
        L7_127(L8_128, L9_129, L10_130)
        L7_127(L8_128, L9_129, L10_130)
      end
      if L2_122 < 13 then
        L7_127(L8_128, L9_129, L10_130)
      end
    end
    if L7_127 == 1 then
      for L11_131 = 1, 51 do
        if L11_131 ~= 25 and L11_131 ~= 37 then
          if L12_132 then
            L13_133(L14_134, L15_135, L16_136)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__EventManageFlags__ClearSideNum
            L13_133(L14_134, L15_135, L16_136)
            L18_138 = L11_131
            L18_138 = true
            L13_133(L14_134, L15_135, L16_136, L17_137, L18_138)
            L13_133(L14_134, L15_135)
          end
          if L13_133 then
            L14_134(L15_135, L16_136, L17_137)
          end
        end
      end
      for L11_131 = 1, 20 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
        if L13_133 then
          L14_134(L15_135, L16_136, L17_137)
        end
      end
      for L11_131 = 1, 21 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = "/21"
          L14_134(L15_135, L16_136, L17_137)
        end
      end
    elseif L7_127 == 2 then
      L8_128(L9_129, L10_130, L11_131)
      for L11_131 = 1, 51 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
      end
      for L11_131 = 1, 20 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
      end
    elseif L7_127 == 3 then
      for L12_132 = L2_122 - 1, 1, -1 do
        if L14_134 then
          break
        end
      end
      if L8_128 then
        for L13_133, L14_134 in L10_130(L11_131) do
          for L18_138, L19_139 in L15_135(L16_136) do
            if L14_134 == L19_139 then
              table.insert(L9_129, L19_139)
              break
            end
          end
        end
        for L13_133, L14_134 in L10_130(L11_131) do
          if L15_135 then
            L18_138 = L15_135
            L19_139 = 1
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__EventManageFlags__ClearSideNum
            L19_139 = GameDatabase
            L19_139 = L19_139.get
            L19_139 = L19_139(L19_139, ggd.Savedata__EventManageFlags__ClearSideNum)
            L19_139 = L19_139 + 1
            L16_136(L17_137, L18_138, L19_139)
          end
        end
      end
      for L12_132, L13_133 in L9_129(L10_130) do
        if L14_134 then
          L18_138 = 1
          L15_135(L16_136, L17_137, L18_138)
          L18_138 = GameDatabase
          L19_139 = L18_138
          L18_138 = L18_138.get
          L18_138 = L18_138(L19_139, ggd.Savedata__EventManageFlags__ClearSideNum)
          L18_138 = L18_138 + 1
          L15_135(L16_136, L17_137, L18_138)
          L18_138 = false
          L19_139 = true
          L15_135(L16_136, L17_137, L18_138, L19_139, true)
          L18_138 = string
          L18_138 = L18_138.match
          L19_139 = L13_133
          L19_139 = L18_138(L19_139, "%d+")
          L19_139 = L17_137(L18_138, L19_139, L18_138(L19_139, "%d+"))
          L15_135(L16_136, L17_137, L18_138, L19_139, L17_137(L18_138, L19_139, L18_138(L19_139, "%d+")))
        end
        if L15_135 then
          L18_138 = L15_135
          L19_139 = 1
          L16_136(L17_137, L18_138, L19_139)
        end
      end
      for L12_132 = 1, 20 do
        if L13_133 then
          L14_134(L15_135, L16_136, L17_137)
        end
      end
      for L12_132 = 1, 21 do
        if L13_133 then
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = L14_134
          L15_135(L16_136, L17_137, L18_138)
          L18_138 = L14_134
          L19_139 = "/21"
          L18_138 = L18_138 .. L19_139
          L15_135(L16_136, L17_137, L18_138)
        end
      end
    elseif L7_127 == 4 then
      L8_128(L9_129, L10_130, L11_131)
      for L11_131 = 1, 51 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
      end
      for L11_131 = 1, 20 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
      end
      for L11_131 = 1, 21 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = "/21"
          L14_134(L15_135, L16_136, L17_137)
        end
      end
    elseif L7_127 == 5 then
      for L11_131 = 1, 51 do
        if L11_131 ~= 25 and L11_131 ~= 37 then
          if L12_132 then
            L13_133(L14_134, L15_135, L16_136)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__EventManageFlags__ClearSideNum
            L13_133(L14_134, L15_135, L16_136)
            L18_138 = L11_131
            L18_138 = true
            L13_133(L14_134, L15_135, L16_136, L17_137, L18_138)
            L13_133(L14_134, L15_135)
          end
          if L13_133 then
            L14_134(L15_135, L16_136, L17_137)
          end
        end
      end
      for L11_131 = 1, 20 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
        if L13_133 then
          L14_134(L15_135, L16_136, L17_137)
        end
        L18_138 = L11_131
        if L14_134 then
          L18_138 = 1
          L15_135(L16_136, L17_137, L18_138)
        end
        L18_138 = string
        L18_138 = L18_138.format
        L19_139 = "%02d"
        L18_138 = L18_138(L19_139, L11_131)
        L18_138 = false
        L19_139 = true
        L15_135(L16_136, L17_137, L18_138, L19_139, true)
      end
      for L11_131 = 1, 21 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = "/21"
          L14_134(L15_135, L16_136, L17_137)
        end
      end
    else
      for L11_131, L12_132 in L8_128(L9_129) do
        if L13_133 then
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = L17_137
          L19_139 = ggd
          L19_139 = L19_139.Savedata__EventManageFlags__ClearSideNum
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = "%02d"
          L19_139 = L11_131
          L18_138 = true
          L19_139 = true
          L14_134(L15_135, L16_136, L17_137, L18_138, L19_139)
          L18_138 = L12_132
          L19_139 = "%d+"
          L19_139 = L17_137(L18_138, L19_139)
          L19_139 = L16_136(L17_137, L18_138, L19_139, L17_137(L18_138, L19_139))
          L14_134(L15_135, L16_136, L17_137, L18_138, L19_139, L16_136(L17_137, L18_138, L19_139, L17_137(L18_138, L19_139)))
        end
        if L14_134 then
          L18_138 = 1
          L15_135(L16_136, L17_137, L18_138)
        end
      end
      for L11_131 = 1, 20 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
        end
      end
      for L11_131 = 1, 21 do
        if L12_132 then
          L13_133(L14_134, L15_135, L16_136)
          L14_134(L15_135, L16_136, L17_137)
          L18_138 = "/21"
          L14_134(L15_135, L16_136, L17_137)
        end
      end
    end
    L8_128(L9_129)
  else
    for L8_128 = 1, #L6_126 do
      if L9_129 == L0_120 then
        L9_129()
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        L9_129(L10_130, L11_131, L12_132)
        if L1_121 ~= "ep" then
          if L9_129 == "sm28" or L9_129 == "sm48" then
            L11_131(L12_132, L13_133, L14_134)
          end
          if L11_131 == 1 then
            for L15_135 = 1, 51 do
              if L15_135 ~= 25 and L15_135 ~= 37 then
                L18_138 = string
                L18_138 = L18_138.format
                L19_139 = "%02d"
                L18_138 = L18_138(L19_139, L15_135)
                if L16_136 then
                  L18_138 = L17_137
                  L19_139 = L16_136
                  L17_137(L18_138, L19_139, 1)
                  L18_138 = L17_137
                  L19_139 = ggd
                  L19_139 = L19_139.Savedata__EventManageFlags__ClearSideNum
                  L17_137(L18_138, L19_139, GameDatabase:get(ggd.Savedata__EventManageFlags__ClearSideNum) + 1)
                  L18_138 = "sm"
                  L19_139 = "sm"
                  L19_139 = L19_139 .. string.format("%02d", L15_135)
                  L17_137(L18_138, L19_139, false, true, true)
                  L18_138 = "Savedata__EventClearFlags__sm"
                  L19_139 = L15_135
                  L17_137(L18_138, L19_139)
                end
                L18_138 = "Savedata__Menu__EventStateFlags__sm"
                L19_139 = string
                L19_139 = L19_139.format
                L19_139 = L19_139("%02d", L15_135)
                L18_138 = L18_138 .. L19_139
                if L17_137 then
                  L18_138 = GameDatabase
                  L19_139 = L18_138
                  L18_138 = L18_138.set
                  L18_138(L19_139, L17_137, 1)
                end
              end
            end
          end
          if L12_132 == "test" then
            L12_132(L13_133, L14_134, L15_135)
            L12_132(L13_133, L14_134, L15_135)
            L12_132(L13_133, L14_134, L15_135)
            L12_132(L13_133, L14_134, L15_135)
          end
        elseif L2_122 == 27 then
          L11_131(L12_132, L13_133, L14_134)
        else
          L19_139 = L14_134(L15_135)
          L11_131(L12_132, L13_133, L14_134, L15_135, L16_136, L17_137, L18_138, L19_139, L14_134(L15_135))
        end
        if L9_129 ~= nil then
          if L1_121 == "ep" then
            next_mission = L12_132
            next_mission = L12_132
            if L12_132 ~= nil then
            else
              if L12_132 == L9_129 then
            end
            else
              next_mission = L12_132
            end
          else
          end
          if L11_131 then
            if L11_131 then
              L11_131(L12_132, L13_133, L14_134)
            end
          end
        elseif L11_131 then
          if L11_131 then
            L11_131(L12_132, L13_133, L14_134)
          end
        end
        if L10_130 then
          if L12_132 == "cm04" or L12_132 == "cm19" then
            L13_133(L14_134, L15_135, L16_136)
          else
            L13_133(L14_134, L15_135, L16_136)
          end
          L13_133.ft03 = "eps03"
          L13_133.ft04 = "eps04"
          L13_133.ft05 = "eps05_b"
          L13_133.ft06 = "eps06"
          L13_133.ft07 = "ep06_00300c"
          L13_133.ft08 = "eps08"
          L13_133.ft09 = "ep08_00600c"
          L13_133.ft10 = "eps10"
          L13_133.ft11 = "ep10_00600m"
          L13_133.ft14 = "ep13_00400c"
          L13_133.ft15 = "eps15"
          L13_133.ft16 = "eps16"
          L13_133.ft18 = "ep17_00600c"
          L13_133.ft21 = "eps21"
          L13_133.ft28 = "eps28"
          if L14_134 then
            for L18_138 = 1, #L16_136 do
              L19_139 = main_mission
              L19_139 = L19_139[L18_138]
              L19_139 = L19_139[INDEX_NAME]
              if L19_139 == L14_134 then
                L19_139 = debugPrint
                L19_139("\239\188\129\239\188\129" .. L10_130 .. "\227\129\170\227\129\174\227\129\167" .. L14_134 .. "\227\129\174\230\172\161\227\129\174\232\161\140\227\129\174\232\168\173\229\174\154\227\130\146FreeTimeFlags\227\129\171\229\143\141\230\152\160\227\129\151\227\129\190\227\129\153\239\188\129\239\188\129")
                L18_138 = L18_138 + 1
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__CityGem, main_mission[L18_138][INDEX_GEM])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Outrange, main_mission[L18_138][INDEX_OUTRANGE])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Manhole, main_mission[L18_138][INDEX_MANHOLE])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__InfoActor, main_mission[L18_138][INDEX_INFO_ACTOR])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__TreasureBox, main_mission[L18_138][INDEX_TRESURE_BOX])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__PhotoGhost, main_mission[L18_138][INDEX_PHOTO_GHOST])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Mob, main_mission[L18_138][INDEX_MOB])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__WarShip, main_mission[L18_138][INDEX_WARSHIP])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__WarShipCannon, main_mission[L18_138][INDEX_CANNON])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Station, main_mission[L18_138][INDEX_STATION])
                L19_139 = GameDatabase
                L19_139 = L19_139.set
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Vehicle, main_mission[L18_138][INDEX_VEHICLE])
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__CityGem)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Outrange)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Manhole)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__InfoActor)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__TreasureBox)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__PhotoGhost)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Mob)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__WarShip)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__WarShipCannon)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Station)
                L19_139 = GameDatabase
                L19_139 = L19_139.backup
                L19_139(L19_139, ggd.Savedata__FreeTimeFlags__Vehicle)
                break
              end
            end
          else
            L15_135(L16_136)
            L18_138 = "%d+"
            L19_139 = L16_136(L17_137, L18_138)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__CityGem
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__Outrange
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__Manhole
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__InfoActor
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__TreasureBox
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__PhotoGhost
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__Mob
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__WarShip
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            L18_138 = ggd
            L18_138 = L18_138.Savedata__FreeTimeFlags__Station
            L19_139 = true
            L16_136(L17_137, L18_138, L19_139)
            if L15_135 < 5 or L15_135 == 98 then
              L18_138 = ggd
              L18_138 = L18_138.Savedata__FreeTimeFlags__CityGem
              L19_139 = false
              L16_136(L17_137, L18_138, L19_139)
              L18_138 = ggd
              L18_138 = L18_138.Savedata__FreeTimeFlags__TreasureBox
              L19_139 = false
              L16_136(L17_137, L18_138, L19_139)
              L18_138 = ggd
              L18_138 = L18_138.Savedata__FreeTimeFlags__PhotoGhost
              L19_139 = false
              L16_136(L17_137, L18_138, L19_139)
              L18_138 = ggd
              L18_138 = L18_138.Savedata__FreeTimeFlags__WarShip
              L19_139 = false
              L16_136(L17_137, L18_138, L19_139)
              L18_138 = ggd
              L18_138 = L18_138.Savedata__FreeTimeFlags__Station
              L19_139 = false
              L16_136(L17_137, L18_138, L19_139)
            end
          end
        end
        L11_131(L12_132)
        break
      end
    end
  end
  L5_125(L6_126)
  L6_126.ep = L7_127
  L6_126.ft = 20
  L6_126.eps = 30
  for L14_134, L15_135 in L11_131(L12_132) do
    L18_138 = "%l+"
    L18_138 = string
    L18_138 = L18_138.match
    L19_139 = L14_134
    L19_139 = L18_138(L19_139, "%d+")
    if L14_134 == L0_120 then
      break
    elseif L4_124 >= L17_137 then
      if L10_130 < L17_137 then
        L18_138 = string
        L18_138 = L18_138.match
        L19_139 = L14_134
        L18_138 = L18_138(L19_139, "%l+")
      else
        L18_138 = L6_126[L16_136]
        L19_139 = L6_126[L9_129]
        if L18_138 < L19_139 then
          L18_138 = string
          L18_138 = L18_138.match
          L19_139 = L14_134
          L18_138 = L18_138(L19_139, "%l+")
        end
      end
    end
  end
  for L16_136 = 1, L5_125 do
    L18_138 = "Savedata__HomeInfo__Photo__photo_a_"
    L19_139 = string
    L19_139 = L19_139.format
    L19_139 = L19_139("%02d", L16_136)
    L18_138 = L18_138 .. L19_139
    L18_138 = nil
    L19_139 = L12_132[L17_137]
    if L18_138 == L19_139 then
      L18_138 = false
      L12_132[L17_137] = L18_138
    end
  end
  L13_133(L14_134, L15_135)
  L7_127(L8_128, L9_129)
  L7_127(L8_128, L9_129)
  return L7_127
end
function _findCurrentFreeTime(A0_140)
  local L1_141, L2_142, L3_143, L4_144, L5_145
  L1_141 = A0_140
  if A0_140 == "ep00" or A0_140 == "ep01" or A0_140 == "ep02" then
    L1_141 = "ep03"
    L5_145 = "\227\130\146"
    L2_142(L3_143)
  elseif A0_140 == "ep12" or A0_140 == "ep13" then
    L1_141 = "ep11"
    L5_145 = "\227\130\146"
    L2_142(L3_143)
  elseif A0_140 == "ep17" then
    L1_141 = "ep16"
    L5_145 = "\227\130\146"
    L2_142(L3_143)
  elseif A0_140 == "ep19" or A0_140 == "ep20" then
    L1_141 = "ep18"
    L5_145 = "\227\130\146"
    L2_142(L3_143)
  elseif A0_140 == "ep22" or A0_140 == "ep23" or A0_140 == "ep24" or A0_140 == "ep25" or A0_140 == "ep26" or A0_140 == "ep27" then
    L1_141 = "ep21"
    L5_145 = "\227\130\146"
    L2_142(L3_143)
  end
  for L5_145 = 3, 28 do
    if free_time_tbl["ft" .. string.format("%02d", L5_145)] then
      if L1_141 == free_time_tbl["ft" .. string.format("%02d", L5_145)].story then
        return "ft" .. string.format("%02d", L5_145)
      end
      for _FORV_11_ = 1, #free_time_tbl["ft" .. string.format("%02d", L5_145)].side do
        if A0_140 == free_time_tbl["ft" .. string.format("%02d", L5_145)].side[_FORV_11_] then
          return "ft" .. string.format("%02d", L5_145)
        end
      end
      for _FORV_11_ = 1, #free_time_tbl["ft" .. string.format("%02d", L5_145)].challenge do
        if A0_140 == free_time_tbl["ft" .. string.format("%02d", L5_145)].challenge[_FORV_11_] then
          return "ft" .. string.format("%02d", L5_145)
        end
      end
    end
  end
  return L2_142
end
function _findCurrentFreeTime2(A0_146)
  local L1_147, L2_148, L3_149, L4_150
  for L4_150 = A0_146, 28 do
    if free_time_tbl["ft" .. string.format("%02d", L4_150)] then
      return "ft" .. string.format("%02d", L4_150)
    end
  end
  return L1_147
end
function _setMissionProgressStatus(A0_151, A1_152)
  local L2_153, L3_154, L4_155, L5_156, L6_157, L7_158, L8_159, L9_160
  for L5_156 = 1, #L3_154 do
    L6_157 = main_mission
    L6_157 = L6_157[L5_156]
    L7_158 = INDEX_NAME
    L6_157 = L6_157[L7_158]
    L7_158 = string
    L7_158 = L7_158.match
    L8_159 = L6_157
    L9_160 = "%l+"
    L7_158 = L7_158(L8_159, L9_160)
    L8_159 = tonumber
    L9_160 = string
    L9_160 = L9_160.match
    L9_160 = L9_160(L6_157, "%d+")
    L8_159 = L8_159(L9_160, L9_160(L6_157, "%d+"))
    if (L7_158 == "ep" or L7_158 == "sm") and L8_159 == A1_152 then
      L9_160 = ggd
      L9_160 = L9_160[A0_151 .. string.format("%02d", L8_159) .. "__" .. L6_157]
      if L9_160 then
        GameDatabase:set(L9_160, 1)
      end
    end
  end
end
