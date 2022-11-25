import("GameDatabase")
import("Debug")
dofile("/Debug/ShortcutKey/setup.lua")
GameDatabase:reset(ggd.Debug)
if g_initial_sandbox_category == nil then
  g_initial_sandbox_category = "LaunchScript"
end
if g_initial_sandbox_name == nil then
  g_initial_sandbox_name = "root"
end
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = nil
  L1_1 = g_initial_sandbox_category
  if L1_1 == "LaunchScript" then
    L1_1 = g_initial_sandbox_name
    if L1_1 ~= "story" then
      L1_1 = g_initial_sandbox_name
      if L1_1 ~= "side" then
        L1_1 = g_initial_sandbox_name
        if L1_1 ~= "challenge" then
          L1_1 = g_initial_sandbox_name
          if L1_1 ~= "dlc" then
            L1_1 = g_initial_sandbox_name
            if L1_1 ~= "free" then
              L1_1 = g_initial_sandbox_name
              if L1_1 ~= "free_side_past_play" then
                L1_1 = g_initial_sandbox_name
                if L1_1 ~= "free_side_not_play" then
                  L1_1 = g_initial_sandbox_name
                  if L1_1 ~= "free_side_not_play2" then
                    L1_1 = g_initial_sandbox_name
                    if L1_1 ~= "free_side_comp" then
                      L1_1 = g_initial_sandbox_name
                      if L1_1 ~= "free_all_comp" then
                        L1_1 = g_initial_sandbox_name
                        if L1_1 ~= "mine" then
                          L1_1 = g_initial_sandbox_name
                          if L1_1 ~= "user" then
                            L1_1 = g_initial_sandbox_name
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    else
      if L1_1 == "user_sample" then
        L1_1 = Debug
        L2_2 = L1_1
        L1_1 = L1_1.isDebugShortcutKeyUsable
        L1_1 = L1_1(L2_2)
        if L1_1 then
          function L1_1()
            DebugShortcutKey:dofile("interim_key_selesct")
          end
          L2_2 = DebugShortcutKey
          L3_3 = L2_2
          L2_2 = L2_2.setup
          L4_4 = "interim"
          L2_2(L3_3, L4_4, L1_1)
        end
        L1_1 = debugSelectMission
        L2_2 = g_initial_sandbox_name
        L1_1(L2_2)
        L1_1 = GameDatabase
        L2_2 = L1_1
        L1_1 = L1_1.set
        L3_3 = ggd
        L3_3 = L3_3.Debug__PlayerLevel
        L4_4 = true
        L1_1(L2_2, L3_3, L4_4)
        L1_1 = GameDatabase
        L2_2 = L1_1
        L1_1 = L1_1.set
        L3_3 = ggd
        L3_3 = L3_3.Debug__TitleSkip
        L4_4 = true
        L1_1(L2_2, L3_3, L4_4)
        L1_1 = findGameObject2
        L2_2 = "DebugShortcutKey"
        L3_3 = "dbg_shortcutkey_interim"
        L1_1 = L1_1(L2_2, L3_3)
        if L1_1 then
          L3_3 = L1_1
          L2_2 = L1_1.try_term
          L2_2(L3_3)
        end
    end
    else
      L1_1 = string
      L1_1 = L1_1.match
      L2_2 = g_initial_sandbox_name
      L3_3 = "%l+"
      L1_1 = L1_1(L2_2, L3_3)
      if L1_1 == "ep" or L1_1 == "eps" or L1_1 == "sm" or L1_1 == "cm" or L1_1 == "dm" or L1_1 == "ft" then
        L2_2 = GameDatabase
        L3_3 = L2_2
        L2_2 = L2_2.set
        L4_4 = ggd
        L4_4 = L4_4.Debug__StartMission
        L2_2(L3_3, L4_4, g_initial_sandbox_name)
        L2_2 = GameDatabase
        L3_3 = L2_2
        L2_2 = L2_2.set
        L4_4 = ggd
        L4_4 = L4_4.Debug__PlayerLevel
        L2_2(L3_3, L4_4, true)
        L2_2 = GameDatabase
        L3_3 = L2_2
        L2_2 = L2_2.set
        L4_4 = ggd
        L4_4 = L4_4.Debug__TitleSkip
        L2_2(L3_3, L4_4, true)
        g_initial_sandbox_name = "root"
      end
    end
  else
    L1_1 = g_initial_sandbox_category
    if L1_1 == "Mission" then
      L1_1 = GameDatabase
      L2_2 = L1_1
      L1_1 = L1_1.set
      L3_3 = ggd
      L3_3 = L3_3.Debug__StartMission
      L4_4 = g_initial_sandbox_name
      L1_1(L2_2, L3_3, L4_4)
      L1_1 = GameDatabase
      L2_2 = L1_1
      L1_1 = L1_1.set
      L3_3 = ggd
      L3_3 = L3_3.Debug__PlayerLevel
      L4_4 = true
      L1_1(L2_2, L3_3, L4_4)
      L1_1 = GameDatabase
      L2_2 = L1_1
      L1_1 = L1_1.set
      L3_3 = ggd
      L3_3 = L3_3.Debug__TitleSkip
      L4_4 = true
      L1_1(L2_2, L3_3, L4_4)
      g_initial_sandbox_name = "root"
      g_initial_sandbox_category = "LaunchScript"
    else
      L1_1 = g_initial_sandbox_category
      if L1_1 == "TestBootupMission" then
        L1_1 = GameDatabase
        L2_2 = L1_1
        L1_1 = L1_1.set
        L3_3 = ggd
        L3_3 = L3_3.Debug__StartMission
        L4_4 = g_initial_sandbox_name
        L1_1(L2_2, L3_3, L4_4)
        L1_1 = GameDatabase
        L2_2 = L1_1
        L1_1 = L1_1.set
        L3_3 = ggd
        L3_3 = L3_3.Debug__TitleSkip
        L4_4 = true
        L1_1(L2_2, L3_3, L4_4)
        g_initial_sandbox_name = "root"
        g_initial_sandbox_category = "LaunchScript"
      else
        L1_1 = g_initial_sandbox_category
        if L1_1 == "PdemoBatch" then
          L0_0 = g_initial_sandbox_name
          g_initial_sandbox_category = "Viewer"
          g_initial_sandbox_name = "viewer_pdemo"
        end
      end
    end
  end
  L1_1 = g_initial_sandbox_name
  if L1_1 == "root" then
    L1_1 = GameDatabase
    L2_2 = L1_1
    L1_1 = L1_1.get
    L3_3 = ggd
    L3_3 = L3_3.Debug__StartMission
    L1_1 = L1_1(L2_2, L3_3)
    if L1_1 == "None" then
      L1_1 = g_initial_sandbox_name
    elseif not L1_1 then
      L1_1 = GameDatabase
      L2_2 = L1_1
      L1_1 = L1_1.get
      L3_3 = ggd
      L3_3 = L3_3.Debug__StartMission
      L1_1 = L1_1(L2_2, L3_3)
    end
    g_start_sandbox_name = L1_1
  else
    L1_1 = g_initial_sandbox_name
    g_start_sandbox_name = L1_1
  end
  L1_1 = createGameObject2
  L2_2 = "EnemyManager"
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.try_init
  L2_2(L3_3)
  L3_3 = L1_1
  L2_2 = L1_1.waitForReady
  L2_2(L3_3)
  L3_3 = L1_1
  L2_2 = L1_1.try_start
  L2_2(L3_3)
  L2_2 = nil
  L3_3 = g_initial_sandbox_category
  if L3_3 then
    L3_3 = g_initial_sandbox_name
    if L3_3 then
      L3_3 = "/Game/"
      L4_4 = g_initial_sandbox_category
      L3_3 = L3_3 .. L4_4 .. "/" .. g_initial_sandbox_name .. ".lua"
      L4_4 = createSandbox2
      L4_4 = L4_4(g_initial_sandbox_name)
      L2_2 = L4_4
      L4_4 = L2_2.setString
      L4_4(L2_2, "g_filename", L3_3)
      if L0_0 then
        L4_4 = L2_2.setString
        L4_4(L2_2, "g_batch_name", L0_0)
      end
    end
  end
  L3_3 = createGameObject2
  L4_4 = "DebugCamera2"
  L3_3 = L3_3(L4_4)
  L4_4 = L3_3.setName
  L4_4(L3_3, "debug2")
  L4_4 = Debug
  L4_4 = L4_4.isDebugShortcutKeyUsable
  L4_4 = L4_4(L4_4)
  if L4_4 then
    function L4_4()
      DebugShortcutKey:dofile("common")
      DebugShortcutKey:dofile("user")
    end
    DebugShortcutKey:setup("global", L4_4)
  end
  L4_4 = initializeAllGameObjects
  L4_4()
  L4_4 = waitForReadyAllGameObjects
  L4_4()
  L4_4 = startAllGameObjects
  L4_4()
  if L2_2 then
    L4_4 = L2_2.setGameObject
    L4_4(L2_2, "enemyManager", L1_1)
  end
  L4_4 = Debug
  L4_4 = L4_4.setSwitch
  L4_4(L4_4, {
    "Display",
    "File Asset Status"
  }, false)
  L4_4 = Debug
  L4_4 = L4_4.setSwitch
  L4_4(L4_4, {
    "Display",
    "Warning Indicator"
  }, false)
end
function exitsandbox()
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, true)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, true)
  Debug:setSwitch({
    "Display",
    "Time Manager"
  }, false)
end
setExitCallback(exitsandbox)
import("Font")
import("Pad")
_debugLine = 0
function debugDispPrint(A0_5)
  local L1_6
  L1_6 = Debug
  L1_6 = L1_6.isDebugMenuOpen
  L1_6 = L1_6(L1_6)
  if L1_6 then
    L1_6 = 250
  else
    L1_6 = L1_6 or 50
  end
  Font:debugPrint(L1_6, 50 + 20 * _debugLine, A0_5)
  _debugLine = _debugLine + 1
end
function debugSelectMission(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12
  L1_8 = 2
  L2_9 = dofile
  L3_10 = "/Game/LaunchScript/"
  L4_11 = A0_7
  L5_12 = ".lua"
  L3_10 = L3_10 .. L4_11 .. L5_12
  L2_9(L3_10)
  L2_9 = select_mission
  if L2_9 == nil then
    L2_9 = debugExtractMission
    L3_10 = A0_7
    L3_10 = L2_9(L3_10)
    L1_8 = L3_10
    select_mission = L2_9
  else
    L1_8 = 1
  end
  L2_9 = select_mission
  if L2_9 ~= nil then
    L2_9 = select_mission
    L2_9 = #L2_9
  elseif L2_9 <= 0 then
    return
  end
  g_initial_sandbox_name = "root"
  L2_9 = false
  L3_10 = 0
  L4_11 = 0
  L5_12 = 1
  while true do
    if not Debug:isDebugMenuOpen() then
      if Pad:getButton(Pad.kButton_LR) or GameDatabase:get(ggd.Debug__KeyRight) then
        if not L2_9 then
          L2_9 = true
          if L4_11 == 0 then
          else
          end
          L4_11 = L4_11 + 1
          L5_12 = 1
        end
      elseif Pad:getButton(Pad.kButton_LL) or GameDatabase:get(ggd.Debug__KeyLeft) then
        if not L2_9 then
          L2_9 = true
          L4_11 = L4_11 - 1
          if L4_11 < 0 then
            L4_11 = 0
            Debug:setSwitch({
              "Exit Sandbox"
            }, nil)
          end
          L5_12 = L5_12
        end
      elseif Pad:getButton(Pad.kButton_LU) or GameDatabase:get(ggd.Debug__KeyUp) then
        L3_10 = L3_10 + 1
        if L3_10 > 20 then
          L3_10 = 20
        end
        if not L2_9 or L3_10 > 10 then
          L2_9 = true
          L5_12 = L5_12 - 1
          if L5_12 <= 0 then
            if L4_11 == 0 then
              L5_12 = #select_mission
            elseif L4_11 == 1 then
              L5_12 = #select_mission[L5_12].part
            end
          end
        end
      elseif Pad:getButton(Pad.kButton_LD) or GameDatabase:get(ggd.Debug__KeyDown) then
        L3_10 = L3_10 + 1
        if L3_10 > 20 then
          L3_10 = 20
        end
        if not L2_9 or L3_10 > 10 then
          L2_9 = true
          L5_12 = L5_12 + 1
          if L4_11 == 0 then
            if L5_12 > #select_mission then
              L5_12 = 1
            end
          elseif L4_11 == 1 and L5_12 > #select_mission[L5_12].part then
            L5_12 = 1
          end
        end
      elseif Pad:getButton(Pad.kButton_L1) then
        L3_10 = L3_10 + 1
        if L3_10 > 20 then
          L3_10 = 20
        end
        if not L2_9 or L3_10 > 10 then
          L2_9 = true
          L5_12 = L5_12 - 10
          if L5_12 <= 0 then
            L5_12 = 1
          end
        end
      elseif Pad:getButton(Pad.kButton_R1) then
        L3_10 = L3_10 + 1
        if L3_10 > 20 then
          L3_10 = 20
        end
        if not L2_9 or L3_10 > 10 then
          L2_9 = true
          L5_12 = L5_12 + 10
          if L4_11 == 0 then
            if L5_12 > #select_mission then
              L5_12 = #select_mission
            end
          elseif L4_11 == 1 and L5_12 > #select_mission[L5_12].part then
            L5_12 = #select_mission[L5_12].part
          end
        end
      else
        L3_10 = 0
        L2_9 = false
      end
    end
    _debugLine = 0
    if L4_11 == 0 then
      debugDispPrint("L : return top menu")
      if L1_8 == 1 then
        debugDispPrint("R : mission start")
      else
        debugDispPrint("R : part select")
      end
    else
      debugDispPrint("L : " .. A0_7 .. " select")
      debugDispPrint("R : mission start ")
    end
    debugDispPrint("U or D : 1move   L1 or R1 : 10move")
    if L4_11 == 0 then
      debugDispPrint("== " .. A0_7 .. " select ==")
      debugDispTable(L5_12, select_mission)
    elseif L4_11 ~= L1_8 then
      debugDispPrint("== part select ==")
      debugDispTable(L5_12, select_mission[L5_12].part)
    end
    debugDispPrint("================")
    if L4_11 == L1_8 then
      if L4_11 == 1 then
        if select_mission[L5_12].part then
          GameDatabase:set(ggd.Debug__StartMission, select_mission[L5_12].part[1])
          break
        end
        GameDatabase:set(ggd.Debug__StartMission, select_mission[L5_12])
        break
      end
      GameDatabase:set(ggd.Debug__StartMission, select_mission[L5_12].part[L5_12])
      break
    end
    wait()
  end
end
function debugExtractMission()
  local L0_13, L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27
  L0_13 = find_mission_type
  if not L0_13 then
    return
  end
  L0_13 = sm_clear_state
  if L0_13 then
    L0_13 = GameDatabase
    L0_13 = L0_13.set
    L0_13(L1_14, L2_15, L3_16)
  end
  L0_13 = find_mission_type
  if L0_13 ~= "ft" then
    L0_13 = dofile
    L0_13(L1_14)
    L0_13 = {}
    L4_17 = find_mission_type
    L5_18 = find_mission_type
    L4_17 = find_mission_type
    L5_18 = false
    if L6_19 == "ep" then
      L2_15[2] = "eps"
    end
    for L9_22, L10_23 in L6_19(L7_20) do
      L11_24 = string
      L11_24 = L11_24.match
      L12_25 = INDEX_NAME
      L12_25 = L10_23[L12_25]
      L13_26 = "%l+"
      L11_24 = L11_24(L12_25, L13_26)
      L12_25 = string
      L12_25 = L12_25.match
      L13_26 = INDEX_NAME
      L13_26 = L10_23[L13_26]
      L14_27 = "%d+"
      L12_25 = L12_25(L13_26, L14_27)
      if L11_24 ~= "ch" then
        L13_26 = L2_15[1]
        if L11_24 ~= L13_26 then
          L13_26 = L2_15[2]
        else
          if L11_24 == L13_26 then
            if L3_16 ~= L12_25 or L11_24 ~= L4_17 then
              L13_26 = #L1_14
              if L13_26 > 0 then
                L13_26 = L4_17
                L14_27 = L3_16
                L13_26 = L13_26 .. L14_27 .. "  : " .. string.format("%-2s", #L1_14) .. " part"
                if L4_17 == "eps" then
                  L14_27 = L4_17
                  L13_26 = L14_27 .. L3_16 .. " : " .. string.format("%-2s", #L1_14) .. " part"
                end
                L14_27 = {}
                L14_27.name = L13_26
                L14_27.part = L1_14
                table.insert(L0_13, L14_27)
                if string.find(L10_23[INDEX_NAME], "_header") == nil then
                  table.insert(L1_14, L10_23[INDEX_NAME])
                end
              end
              if L5_18 then
                L13_26 = string
                L13_26 = L13_26.find
                L14_27 = INDEX_NAME
                L14_27 = L10_23[L14_27]
                L13_26 = L13_26(L14_27, "_header")
                if L13_26 == nil then
                  L13_26 = table
                  L13_26 = L13_26.insert
                  L14_27 = L1_14
                  L13_26(L14_27, L10_23[INDEX_NAME])
                end
                L5_18 = false
                L4_17 = L11_24
              else
                L4_17 = L11_24
              end
            else
              L13_26 = string
              L13_26 = L13_26.find
              L14_27 = INDEX_NAME
              L14_27 = L10_23[L14_27]
              L13_26 = L13_26(L14_27, "_header")
              if L13_26 == nil then
                L13_26 = table
                L13_26 = L13_26.insert
                L14_27 = L1_14
                L13_26(L14_27, L10_23[INDEX_NAME])
              end
            end
        end
        else
          L13_26 = INDEX_NAME
          L13_26 = L10_23[L13_26]
          if L13_26 ~= "eventheader" then
            L13_26 = #L1_14
            if L13_26 > 0 then
              L13_26 = L4_17
              L14_27 = L3_16
              L13_26 = L13_26 .. L14_27 .. "  : " .. string.format("%-2s", #L1_14) .. " part"
              if L4_17 == "eps" then
                L14_27 = L4_17
                L13_26 = L14_27 .. L3_16 .. " : " .. string.format("%-2s", #L1_14) .. " part"
              end
              L14_27 = {}
              L14_27.name = L13_26
              L14_27.part = L1_14
              table.insert(L0_13, L14_27)
              L5_18 = true
            end
          end
        end
      end
    end
    if L6_19 == "cm" then
      return L6_19, L7_20
    end
    return L6_19, L7_20
  else
    L0_13 = dofile
    L0_13(L1_14)
    L0_13 = {}
    for L4_17, L5_18 in L1_14(L2_15) do
      L6_19(L7_20, L8_21)
    end
    L1_14(L2_15)
    return L1_14, L2_15
  end
end
function debugDispTable(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37
  L2_30 = 0
  L3_31 = 15
  for L7_35, L8_36 in L4_32(L5_33) do
    L9_37 = L8_36.name
    if L9_37 then
      L9_37 = L8_36.name
    else
      L9_37 = L9_37 or L8_36
    end
    if L3_31 < #A1_29 then
      if not (L2_30 > L3_31) then
        if A0_28 == L7_35 then
          debugDispPrint(" > " .. L9_37)
          L2_30 = L2_30 + 1
        elseif A0_28 - L7_35 < 6 then
          debugDispPrint("   " .. L9_37)
          L2_30 = L2_30 + 1
        elseif L3_31 > #A1_29 - A0_28 and L7_35 > #A1_29 - L3_31 - 1 then
          debugDispPrint("   " .. L9_37)
          L2_30 = L2_30 + 1
        end
        elseif A0_28 == L7_35 then
          debugDispPrint(" > " .. L9_37)
        else
          debugDispPrint("   " .. L9_37)
        end
      end
  end
end
