import("Debug")
import("Sound")
import("Font")
import("GameDatabase")
import("HUD")
import("Player")
import("common")
_diectory_task = nil
_move_task = nil
_invert = true
DebugShortcutKey:registerKeyMap("event", {
  del = {
    desc = "Exit Sandbox",
    proc = function()
      Debug:setSwitch({
        "Exit Sandbox"
      }, nil)
    end
  },
  s = {
    desc = "Stop BGM",
    proc = function()
      Sound:playBgm()
    end
  },
  a = {
    desc = "Disp Area Name",
    proc = function()
      Debug:setSwitch({
        "Display",
        "DebugDrawGroup",
        "Area"
      }, not Debug:getSwitch({
        "Display",
        "DebugDrawGroup",
        "Area"
      }))
    end
  },
  g = {
    desc = "Ghost Rec and upload",
    proc = function()
      GameDatabase:set(ggd.Debug__GhostRec, not GameDatabase:get(ggd.Debug__GhostRec))
    end
  },
  p = {
    desc = "Disp Player Pos",
    proc = function()
      GameDatabase:set(ggd.Debug__DispBg, not GameDatabase:get(ggd.Debug__DispBg))
    end
  },
  r = {
    desc = "Retry",
    proc = function()
      local L0_0, L1_1, L2_2
      L0_0 = HUD
      L1_1 = L0_0
      L0_0 = L0_0.naviSetActivate
      L2_2 = false
      L0_0(L1_1, L2_2)
      L0_0 = HUD
      L1_1 = L0_0
      L0_0 = L0_0.naviSetTarget
      L2_2 = nil
      L0_0(L1_1, L2_2)
      L0_0 = HUD
      L1_1 = L0_0
      L0_0 = L0_0.naviSetPochiDistanceDensity0
      L2_2 = 0
      L0_0(L1_1, L2_2)
      L0_0 = HUD
      L1_1 = L0_0
      L0_0 = L0_0.naviSetPochiDistanceDensity100
      L2_2 = 2
      L0_0(L1_1, L2_2)
      L0_0 = findGameObject2
      L1_1 = "Sandbox2"
      L2_2 = g_initial_sandbox_name
      L0_0 = L0_0(L1_1, L2_2)
      if L0_0 == nil then
        L1_1 = false
        return L1_1
      end
      L2_2 = L0_0
      L1_1 = L0_0.findGameObject2
      L1_1 = L1_1(L2_2, "Sandbox2", "mother2")
      if L1_1 == nil then
        L2_2 = false
        return L2_2
      end
      L2_2 = GameDatabase
      L2_2 = L2_2.get
      L2_2 = L2_2(L2_2, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L2_2 ~= "eventheader" then
        if L1_1:findGameObject2("Sandbox2", L2_2) == nil then
          return false
        end
        L1_1:findGameObject2("Sandbox2", L2_2):sendEvent("mission_retry")
      end
    end
  },
  n = {
    desc = "Next Mission Part",
    proc = function()
      local L0_3, L1_4, L2_5
      L0_3 = findGameObject2
      L1_4 = "Sandbox2"
      L2_5 = g_initial_sandbox_name
      L0_3 = L0_3(L1_4, L2_5)
      if L0_3 == nil then
        L1_4 = false
        return L1_4
      end
      L2_5 = L0_3
      L1_4 = L0_3.findGameObject2
      L1_4 = L1_4(L2_5, "Sandbox2", "mother2")
      if L1_4 == nil then
        L2_5 = false
        return L2_5
      end
      L2_5 = GameDatabase
      L2_5 = L2_5.get
      L2_5 = L2_5(L2_5, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L2_5 ~= "eventheader" then
        if L1_4:findGameObject2("Sandbox2", L2_5) == nil then
          return false
        end
        L1_4:findGameObject2("Sandbox2", L2_5):sendEvent("Fn_setNextMissionFlag")
        L1_4:findGameObject2("Sandbox2", L2_5):sendEvent("Fn_nextMission")
        L1_4:findGameObject2("Sandbox2", L2_5):sendEvent("Fn_exitSandbox")
      end
    end
  },
  k = {
    desc = "Kaiwa Demo",
    proc = function()
      if _diectory_task == nil then
        _diectory_task = invokeTask(function()
          local L0_6, L1_7
          L0_6 = 0
          while true do
            if L0_6 == 0 then
              L1_7 = HUD
              L1_7 = L1_7.setCheckDirectory
              L1_7(L1_7, "lua/kdemo", "evd", true)
              L0_6 = 1
            elseif L0_6 == 1 then
              L1_7 = HUD
              L1_7 = L1_7.menuStatus
              L1_7 = L1_7(L1_7, "Debug")
              if L1_7 ~= "running" then
                L1_7 = HUD
                L1_7 = L1_7.getSelectFileName
                L1_7 = L1_7(L1_7)
                if L1_7 == "" then
                  L0_6 = 0
                else
                  print(L1_7)
                  HUD:kaiwa(L1_7)
                  L0_6 = 2
                end
              end
            elseif L0_6 == 2 then
              L1_7 = HUD
              L1_7 = L1_7.menuStatus
              L1_7 = L1_7(L1_7, "Kaiwa")
              if L1_7 ~= "running" then
                L0_6 = 0
              end
            end
            L1_7 = wait
            L1_7()
          end
        end)
      elseif _diectory_task:isRunning() then
        HUD:endCheckDirectory()
        _diectory_task:abort()
        _diectory_task = nil
      end
    end
  },
  m = {
    desc = "Moive",
    proc = function()
      if _diectory_task == nil then
        _diectory_task = invokeTask(function()
          local L0_8, L1_9
          L0_8 = 0
          while true do
            if L0_8 == 0 then
              L1_9 = HUD
              L1_9 = L1_9.setCheckDirectory
              L1_9(L1_9, "mp4", "mp4", true)
              L0_8 = 1
            elseif L0_8 == 1 then
              L1_9 = HUD
              L1_9 = L1_9.menuStatus
              L1_9 = L1_9(L1_9, "Debug")
              if L1_9 ~= "running" then
                L1_9 = HUD
                L1_9 = L1_9.getSelectFileName
                L1_9 = L1_9(L1_9)
                if L1_9 == "" then
                  L0_8 = 0
                else
                  print(L1_9)
                  HUD:movie(L1_9)
                  L0_8 = 2
                end
              end
            elseif L0_8 == 2 then
              L1_9 = HUD
              L1_9 = L1_9.menuStatus
              L1_9 = L1_9(L1_9, "Movie")
              if L1_9 ~= "running" then
                L1_9 = HUD
                L1_9 = L1_9.fadein
                L1_9(L1_9, 0)
                L0_8 = 0
              end
            end
            L1_9 = wait
            L1_9()
          end
        end)
      elseif _diectory_task:isRunning() then
        HUD:endCheckDirectory()
        _diectory_task:abort()
        _diectory_task = nil
      end
    end
  },
  w = {
    desc = "Reset Player Position",
    proc = function()
      local L0_10, L1_11, L2_12
      L0_10 = findGameObject2
      L1_11 = "Sandbox2"
      L2_12 = g_initial_sandbox_name
      L0_10 = L0_10(L1_11, L2_12)
      if L0_10 == nil then
        L1_11 = false
        return L1_11
      end
      L2_12 = L0_10
      L1_11 = L0_10.findGameObject2
      L1_11 = L1_11(L2_12, "Sandbox2", "mother2")
      if L1_11 == nil then
        L2_12 = false
        return L2_12
      end
      L2_12 = GameDatabase
      L2_12 = L2_12.get
      L2_12 = L2_12(L2_12, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L1_11:findGameObject2("Sandbox2", L2_12) == nil then
        return false
      end
      if L1_11:findGameObject2("Sandbox2", L2_12):findGameObject2("Node", "locator2_pc_start_pos") ~= nil then
        Player:reset(Player.kReset_Standing, L1_11:findGameObject2("Sandbox2", L2_12):findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
      end
    end
  },
  q = {
    desc = "Invert formula",
    proc = function()
      local L1_13
      L1_13 = _invert
      L1_13 = not L1_13
      _invert = L1_13
    end
  },
  z = {
    desc = "game over call back",
    proc = function()
      if findGameObject2("Sandbox2", g_initial_sandbox_name) == nil then
        return false
      end
      findGameObject2("Sandbox2", g_initial_sandbox_name):sendEvent("gameOver")
    end
  },
  f = {
    desc = "fede",
    proc = function()
      if HUD:faderAlpha() > 0 then
        HUD:fadein(0.5)
      else
        HUD:blackout(0.5)
      end
    end
  },
  u = {
    desc = "Disp Phase",
    proc = function()
      if findGameObject2("Sandbox2", g_initial_sandbox_name) == nil then
        return false
      end
      findGameObject2("Sandbox2", g_initial_sandbox_name):sendEvent("debugDispPhase")
    end
  },
  num1 = {
    desc = "EventFlags_01",
    proc = function()
      local L0_14, L1_15, L2_16, L3_17
      L0_14 = GameDatabase
      L1_15 = L0_14
      L0_14 = L0_14.get
      L2_16 = ggd
      L2_16 = L2_16.Savedata__EventManageFlags__CurrentMissionName
      L0_14 = L0_14(L1_15, L2_16)
      L1_15 = string
      L1_15 = L1_15.match
      L2_16 = L0_14
      L3_17 = "(%w+%d+)_"
      L1_15 = L1_15(L2_16, L3_17)
      L2_16 = ggd
      L3_17 = "Savedata__EventFlags__"
      L3_17 = L3_17 .. L1_15 .. "__flag01"
      L2_16 = L2_16[L3_17]
      if L2_16 then
        L3_17 = GameDatabase
        L3_17 = L3_17.get
        L3_17 = L3_17(L3_17, L2_16)
        if _invert then
          L3_17 = L3_17 + 1
        else
          L3_17 = L3_17 - 1
        end
        GameDatabase:set(L2_16, L3_17)
      else
        L3_17 = print
        L3_17("ggd.Savedata__EventFlags__" .. L1_15 .. "__flag01 nil")
      end
    end
  },
  num2 = {
    desc = "EventFlags_02",
    proc = function()
      local L0_18, L1_19, L2_20, L3_21
      L0_18 = GameDatabase
      L1_19 = L0_18
      L0_18 = L0_18.get
      L2_20 = ggd
      L2_20 = L2_20.Savedata__EventManageFlags__CurrentMissionName
      L0_18 = L0_18(L1_19, L2_20)
      L1_19 = string
      L1_19 = L1_19.match
      L2_20 = L0_18
      L3_21 = "(%w+%d+)_"
      L1_19 = L1_19(L2_20, L3_21)
      L2_20 = ggd
      L3_21 = "Savedata__EventFlags__"
      L3_21 = L3_21 .. L1_19 .. "__flag02"
      L2_20 = L2_20[L3_21]
      if L2_20 then
        L3_21 = GameDatabase
        L3_21 = L3_21.get
        L3_21 = L3_21(L3_21, L2_20)
        if _invert then
          L3_21 = L3_21 + 1
        else
          L3_21 = L3_21 - 1
        end
        GameDatabase:set(L2_20, L3_21)
      end
    end
  },
  num3 = {
    desc = "EventFlags_03",
    proc = function()
      local L0_22, L1_23, L2_24, L3_25
      L0_22 = GameDatabase
      L1_23 = L0_22
      L0_22 = L0_22.get
      L2_24 = ggd
      L2_24 = L2_24.Savedata__EventManageFlags__CurrentMissionName
      L0_22 = L0_22(L1_23, L2_24)
      L1_23 = string
      L1_23 = L1_23.match
      L2_24 = L0_22
      L3_25 = "(%w+%d+)_"
      L1_23 = L1_23(L2_24, L3_25)
      L2_24 = ggd
      L3_25 = "Savedata__EventFlags__"
      L3_25 = L3_25 .. L1_23 .. "__flag03"
      L2_24 = L2_24[L3_25]
      if L2_24 then
        L3_25 = GameDatabase
        L3_25 = L3_25.get
        L3_25 = L3_25(L3_25, L2_24)
        if _invert then
          L3_25 = L3_25 + 1
        else
          L3_25 = L3_25 - 1
        end
        GameDatabase:set(L2_24, L3_25)
      end
    end
  },
  num4 = {
    desc = "EventFlags_04",
    proc = function()
      local L0_26, L1_27, L2_28, L3_29
      L0_26 = GameDatabase
      L1_27 = L0_26
      L0_26 = L0_26.get
      L2_28 = ggd
      L2_28 = L2_28.Savedata__EventManageFlags__CurrentMissionName
      L0_26 = L0_26(L1_27, L2_28)
      L1_27 = string
      L1_27 = L1_27.match
      L2_28 = L0_26
      L3_29 = "(%w+%d+)_"
      L1_27 = L1_27(L2_28, L3_29)
      L2_28 = ggd
      L3_29 = "Savedata__EventFlags__"
      L3_29 = L3_29 .. L1_27 .. "__flag04"
      L2_28 = L2_28[L3_29]
      if L2_28 then
        L3_29 = GameDatabase
        L3_29 = L3_29.get
        L3_29 = L3_29(L3_29, L2_28)
        if _invert then
          L3_29 = L3_29 + 1
        else
          L3_29 = L3_29 - 1
        end
        GameDatabase:set(L2_28, L3_29)
      end
    end
  },
  num5 = {
    desc = "EventFlags_05",
    proc = function()
      local L0_30, L1_31, L2_32, L3_33
      L0_30 = GameDatabase
      L1_31 = L0_30
      L0_30 = L0_30.get
      L2_32 = ggd
      L2_32 = L2_32.Savedata__EventManageFlags__CurrentMissionName
      L0_30 = L0_30(L1_31, L2_32)
      L1_31 = string
      L1_31 = L1_31.match
      L2_32 = L0_30
      L3_33 = "(%w+%d+)_"
      L1_31 = L1_31(L2_32, L3_33)
      L2_32 = ggd
      L3_33 = "Savedata__EventFlags__"
      L3_33 = L3_33 .. L1_31 .. "__flag05"
      L2_32 = L2_32[L3_33]
      if L2_32 then
        L3_33 = GameDatabase
        L3_33 = L3_33.get
        L3_33 = L3_33(L3_33, L2_32)
        if _invert then
          L3_33 = L3_33 + 1
        else
          L3_33 = L3_33 - 1
        end
        GameDatabase:set(L2_32, L3_33)
      end
    end
  },
  num6 = {
    desc = "Navi Node",
    proc = function()
      local L0_34, L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42
      L0_34 = findGameObject2
      L1_35 = "Sandbox2"
      L2_36 = g_initial_sandbox_name
      L0_34 = L0_34(L1_35, L2_36)
      if L0_34 == nil then
        L1_35 = false
        return L1_35
      end
      L2_36 = L0_34
      L1_35 = L0_34.findGameObject2
      L3_37 = "Sandbox2"
      L4_38 = "mother2"
      L1_35 = L1_35(L2_36, L3_37, L4_38)
      if L1_35 == nil then
        L2_36 = false
        return L2_36
      end
      L2_36 = GameDatabase
      L3_37 = L2_36
      L2_36 = L2_36.get
      L4_38 = ggd
      L4_38 = L4_38.Savedata__EventManageFlags__CurrentMissionName
      L2_36 = L2_36(L3_37, L4_38)
      L4_38 = L1_35
      L3_37 = L1_35.findGameObject2
      L5_39 = "Sandbox2"
      L6_40 = L2_36
      L3_37 = L3_37(L4_38, L5_39, L6_40)
      if L3_37 == nil then
        L4_38 = false
        return L4_38
      end
      L5_39 = L3_37
      L4_38 = L3_37.findGameObject2
      L6_40 = "Node"
      L7_41 = "dbg_navi_node"
      L4_38 = L4_38(L5_39, L6_40, L7_41)
      if L4_38 == nil then
        L6_40 = L3_37
        L5_39 = L3_37.createGameObject2
        L7_41 = "Node"
        L5_39 = L5_39(L6_40, L7_41)
        L4_38 = L5_39
        L6_40 = L4_38
        L5_39 = L4_38.setName
        L7_41 = "dbg_navi_node"
        L5_39(L6_40, L7_41)
        L6_40 = L4_38
        L5_39 = L4_38.try_init
        L5_39(L6_40)
        L6_40 = L4_38
        L5_39 = L4_38.waitForReady
        L5_39(L6_40)
        L6_40 = L4_38
        L5_39 = L4_38.try_start
        L5_39(L6_40)
        L5_39 = Player
        L6_40 = L5_39
        L5_39 = L5_39.getRecentAreaName
        L5_39 = L5_39(L6_40)
        L6_40 = nil
        L7_41 = L1_35.sendEvent
        L7_41 = L7_41(L8_42, "getBackgroundElement2HandleTable")
        if L7_41 ~= nil then
          for _FORV_11_, _FORV_12_ in L8_42(L7_41) do
            if _FORV_12_:getTypeName() == "Area" then
              L6_40 = _FORV_12_:findSubArea(L5_39)
              if L6_40 ~= nil then
                L6_40:appendChild(L4_38)
                break
              end
            end
          end
        end
        print("pos=" .. tostring(L8_42))
        L4_38:setWorldPos(L8_42)
        L4_38:setForceMove()
        HUD:naviSetActivate(true)
        HUD:naviSetTarget(L4_38)
      else
        L5_39 = HUD
        L6_40 = L5_39
        L5_39 = L5_39.naviSetActivate
        L7_41 = false
        L5_39(L6_40, L7_41)
        L5_39 = HUD
        L6_40 = L5_39
        L5_39 = L5_39.naviSetTarget
        L7_41 = nil
        L5_39(L6_40, L7_41)
        L6_40 = L4_38
        L5_39 = L4_38.try_term
        L5_39(L6_40)
      end
      L4_38 = nil
    end
  },
  num7 = {
    desc = "Disp Npc Name",
    proc = function()
      Debug:setSwitch({
        "Display",
        "DebugDrawGroup",
        "Npc"
      }, not Debug:getSwitch({
        "Display",
        "DebugDrawGroup",
        "Npc"
      }))
      Debug:setSwitch({
        "Display",
        "DebugDrawGroup",
        "Enemy"
      }, not Debug:getSwitch({
        "Display",
        "DebugDrawGroup",
        "Enemy"
      }))
    end
  },
  num8 = {
    desc = "Disp Mission Sandbox Text",
    proc = function()
      local L0_43, L1_44, L2_45
      L0_43 = findGameObject2
      L1_44 = "Sandbox2"
      L2_45 = g_initial_sandbox_name
      L0_43 = L0_43(L1_44, L2_45)
      if L0_43 == nil then
        L1_44 = false
        return L1_44
      end
      L2_45 = L0_43
      L1_44 = L0_43.findGameObject2
      L1_44 = L1_44(L2_45, "Sandbox2", "mother2")
      if L1_44 == nil then
        L2_45 = false
        return L2_45
      end
      L2_45 = GameDatabase
      L2_45 = L2_45.get
      L2_45 = L2_45(L2_45, ggd.Savedata__EventManageFlags__CurrentMissionName)
      if L2_45 ~= "eventheader" then
        if L1_44:findGameObject2("Sandbox2", L2_45) == nil then
          return false
        end
        L1_44:findGameObject2("Sandbox2", L2_45):sendEvent("setDebugDispMission")
      end
    end
  },
  num9 = {
    desc = "Disp Common Sandbox Text",
    proc = function()
      local L0_46, L1_47, L2_48
      L0_46 = findGameObject2
      L1_47 = "Sandbox2"
      L2_48 = g_initial_sandbox_name
      L0_46 = L0_46(L1_47, L2_48)
      if L0_46 == nil then
        L1_47 = false
        return L1_47
      end
      L2_48 = L0_46
      L1_47 = L0_46.findGameObject2
      L1_47 = L1_47(L2_48, "Sandbox2", "mother2")
      if L1_47 == nil then
        L2_48 = false
        return L2_48
      end
      L2_48 = GameDatabase
      L2_48 = L2_48.get
      L2_48 = L2_48(L2_48, ggd.Savedata__EventManageFlags__CurrentCommonSb)
      if L2_48 ~= "eventheader" then
        if L1_47:findGameObject2("Sandbox2", L2_48) == nil then
          return false
        end
        L1_47:findGameObject2("Sandbox2", L2_48):sendEvent("setDebugDispMission")
      end
    end
  },
  num0 = {
    desc = "Disp BGM",
    proc = function()
      local L0_49
      L0_49 = GameDatabase
      L0_49 = L0_49.get
      L0_49 = L0_49(L0_49, ggd.Debug__DispBgm)
      L0_49 = L0_49 + 1
      if L0_49 > 3 then
        L0_49 = 0
      end
      GameDatabase:set(ggd.Debug__DispBgm, L0_49)
    end
  }
})
