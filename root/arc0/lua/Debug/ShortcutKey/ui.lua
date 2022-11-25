local L1_1, L2_2
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "Player"
L0_0(L1_1)
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = Debug
L1_1 = L0_0
L0_0 = L0_0.isDebugMenuOpen
L0_0 = L0_0(L1_1)
L1_1 = false
function L2_2(A0_3)
  local L1_4
  L1_4 = true
  if Debug:getSwitch(A0_3[1]) then
    L1_4 = false
  end
  for _FORV_5_ = 1, #A0_3 do
    Debug:setSwitch(A0_3[_FORV_5_], L1_4)
  end
end
DebugShortcutKey:registerKeyMap("ui", {
  a = {
    desc = "HudScatter",
    proc = function()
      local L0_5
      L0_5 = HUD
      L0_5 = L0_5.captionBegin
      L0_5(L0_5, "test", 5)
      L0_5 = HUD
      L0_5 = L0_5.placeNameStart
      L0_5(L0_5, {
        unique = "ui_gaiku_01_01",
        section = "ui_gaiku_02_01",
        town = "ui_gaiku_03_01"
      })
      L0_5 = HUD
      L0_5 = L0_5.courseOutStart
      L0_5(L0_5)
      L0_5 = HUD
      L0_5 = L0_5.missionBegin
      L0_5(L0_5, "test", 5)
      L0_5 = {
        {
          H = "\227\128\144\230\176\180\227\130\132\227\130\138\227\128\145",
          T = "\230\176\180\229\160\180\227\129\171\232\191\145\227\129\165\227\129\132\227\129\166\226\151\139\227\131\156\227\130\191\227\131\179\227\130\146\230\138\188\227\129\153\227\129\168\227\128\129\230\176\180\227\130\146\227\130\176\227\131\169\227\131\150\227\129\153\227\130\139\227\129\147\227\129\168\227\129\140\227\129\167\227\129\141\227\129\190\227\129\153\227\128\130\n\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\230\176\180\227\130\146\230\156\168\227\129\171\227\129\182\227\129\164\227\129\145\227\129\166\230\176\180\227\130\132\227\130\138\227\129\151\227\129\190\227\129\151\227\130\135\227\129\134\227\128\130",
          L = "*"
        }
      }
      HUD:info(L0_5, true, 15)
      HUD:courseOutStart()
      HUD:hpgDispReq_FadeIn()
      HUD:grgDispReq_FadeIn()
      HUD:spgDispReq_FadeIn()
      HUD:sideMissionEndOpen("test", "test2")
    end
  },
  c = {
    desc = "CostumeUnlock",
    proc = function()
      local L0_6
      L0_6 = {
        "kit02",
        "kit03",
        "kit05",
        "kit06",
        "kit07",
        "kit08",
        "kit18",
        "kit10",
        "kit13",
        "kit14",
        "kit15",
        "kit16",
        "kit19"
      }
      for _FORV_4_ = 1, #L0_6 do
        GameDatabase:set(ggd["Savedata__CostumeUnlock__" .. L0_6[_FORV_4_]], true)
      end
    end
  },
  m = {
    desc = "MissionFlagSetting",
    proc = function()
      local L0_7
      L0_7 = {
        "ep00",
        "ep01",
        "ep02",
        "ep03",
        "ep04",
        "ep05",
        "ep06",
        "ep07",
        "ep08",
        "ep09",
        "ep10",
        "ep11",
        "ep12",
        "ep13",
        "ep14",
        "ep15",
        "ep16",
        "ep17",
        "ep18",
        "ep19",
        "ep20",
        "ep21",
        "ep22",
        "ep23",
        "ep24",
        "ep25",
        "ep26",
        "ep27"
      }
      for _FORV_4_ = 1, #L0_7 do
        GameDatabase:set(ggd["Savedata__Menu__EventStateFlags__" .. L0_7[_FORV_4_]], 2)
        GameDatabase:set(ggd["Savedata__Menu__EventLockFlags__" .. L0_7[_FORV_4_]], false)
        GameDatabase:set(ggd["Savedata__EventFinishedFlags__" .. L0_7[_FORV_4_]], 1)
      end
      L0_7 = {
        "sm01",
        "sm02",
        "sm03",
        "sm04",
        "sm05",
        "sm06",
        "sm07",
        "sm08",
        "sm09",
        "sm10",
        "sm11",
        "sm12",
        "sm13",
        "sm14",
        "sm15",
        "sm16",
        "sm17",
        "sm18",
        "sm19",
        "sm20",
        "sm21",
        "sm22",
        "sm23",
        "sm24",
        "sm25",
        "sm26",
        "sm27",
        "sm28",
        "sm29",
        "sm30",
        "sm31",
        "sm32",
        "sm33",
        "sm34",
        "sm35",
        "sm36",
        "sm37",
        "sm38",
        "sm39",
        "sm40",
        "sm41",
        "sm42",
        "sm43",
        "sm44",
        "sm45",
        "sm46",
        "sm47",
        "sm48",
        "sm49",
        "sm50",
        "sm51"
      }
      for _FORV_4_ = 1, #L0_7 do
        GameDatabase:set(ggd["Savedata__Menu__EventStateFlags__" .. L0_7[_FORV_4_]], 2)
        GameDatabase:set(ggd["Savedata__Menu__EventLockFlags__" .. L0_7[_FORV_4_]], false)
        GameDatabase:set(ggd["Savedata__EventFinishedFlags__" .. L0_7[_FORV_4_]], 1)
      end
      L0_7 = {
        "cm01",
        "cm02",
        "cm03",
        "cm04",
        "cm05",
        "cm06",
        "cm07",
        "cm08",
        "cm09",
        "cm10",
        "cm11",
        "cm12",
        "cm13",
        "cm14",
        "cm15",
        "cm16",
        "cm17",
        "cm18",
        "cm19",
        "cm20"
      }
      for _FORV_4_ = 1, #L0_7 do
        GameDatabase:set(ggd["Savedata__Menu__EventStateFlags__" .. L0_7[_FORV_4_]], 2)
        GameDatabase:set(ggd["Savedata__Menu__EventLockFlags__" .. L0_7[_FORV_4_]], false)
        GameDatabase:set(ggd["Savedata__EventFinishedFlags__" .. L0_7[_FORV_4_]], 1)
        GameDatabase:set(ggd["Savedata__ChallengeClearState__" .. L0_7[_FORV_4_]], 1)
      end
    end
  },
  b = {
    desc = "OpenMissionReplay",
    proc = function()
      HUD:menuOpen("MissionReplay")
    end
  },
  d = {
    desc = "OpenDigoutResult",
    proc = function()
      HUD:menuOpen("DigoutResult")
    end
  },
  g = {
    desc = "GhostMarker_LengthMax",
    proc = function()
      if L1_1 then
        HUD:testGhostMarkerSetting({})
        L1_1 = false
      else
        HUD:testGhostMarkerSetting({length = 999.9})
        L1_1 = true
      end
    end
  },
  p = {
    desc = "PhotoIngamePreview",
    proc = function()
      invokeTask(function()
        local L0_8
        L0_8 = HUD
        L0_8 = L0_8.inGamePreviewExit
        L0_8(L0_8)
        L0_8 = wait
        L0_8()
        L0_8 = 1
        HUD:inGamePreviewCreate(L0_8, HUD.kIngamePreviewType_Treasure)
        while HUD:inGamePreviewIsLoading() do
          wait()
        end
        HUD:inGamePreviewFadeIn()
      end)
    end
  },
  f = {
    desc = "Switch_Fog",
    proc = function()
      local L0_9
      L0_9 = {
        {
          "Gfx",
          "Volumetric Fog",
          "Enabled"
        },
        {
          "Gfx",
          "Gradation",
          "Enabled"
        }
      }
      L2_2(L0_9)
    end
  },
  r = {
    desc = "AutoPhotoGhost_Upload",
    proc = function()
      HUD:uploadPhotoGhost()
      HUD:captionBegin("uploading photo ghost ", 5)
    end
  },
  t = {
    desc = "Switch_TexFileAsset",
    proc = function()
      if Debug:isDebugMenuOpen() then
        Debug:setDebugMenuFocus({})
      else
        Debug:setDebugMenuFocus({
          "Gfx",
          "TextureFileAsset",
          " "
        })
      end
    end
  },
  i = {
    desc = "Info all on",
    proc = function()
      local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
      for L3_13 = 1, 28 do
        for L7_17 = 1, 20 do
          L8_18 = ggd
          L9_19 = "Savedata__Info__ep"
          L10_20 = string
          L10_20 = L10_20.format
          L10_20 = L10_20("%02d", L3_13)
          L9_19 = L9_19 .. L10_20 .. "__ep" .. string.format("%02d", L3_13) .. "_info_" .. string.format("%02d", L7_17)
          L8_18 = L8_18[L9_19]
          if L8_18 then
            L9_19 = GameDatabase
            L10_20 = L9_19
            L9_19 = L9_19.get
            L9_19 = L9_19(L10_20, L8_18)
            L9_19 = L9_19 + 1
            if L9_19 > 2 then
              L9_19 = 0
            end
            L10_20 = GameDatabase
            L10_20 = L10_20.set
            L10_20(L10_20, L8_18, L9_19)
          end
          L9_19 = ggd
          L10_20 = "Savedata__Info__ep"
          L10_20 = L10_20 .. string.format("%02d", L3_13) .. "__ep" .. string.format("%02d", L3_13) .. "_info_" .. string.format("%02d", L7_17) .. "_as"
          L9_19 = L9_19[L10_20]
          if L9_19 then
            L10_20 = GameDatabase
            L10_20 = L10_20.get
            L10_20 = L10_20(L10_20, L9_19)
            L10_20 = L10_20 + 1
            if L10_20 > 2 then
              L10_20 = 0
            end
            GameDatabase:set(L9_19, L10_20)
          end
        end
      end
      for L3_13 = 1, 28 do
        for L7_17 = 1, 20 do
          L8_18 = ggd
          L9_19 = "Savedata__Info__eps"
          L10_20 = string
          L10_20 = L10_20.format
          L10_20 = L10_20("%02d", L3_13)
          L9_19 = L9_19 .. L10_20 .. "__eps" .. string.format("%02d", L3_13) .. "_info_" .. string.format("%02d", L7_17)
          L8_18 = L8_18[L9_19]
          if L8_18 then
            L9_19 = GameDatabase
            L10_20 = L9_19
            L9_19 = L9_19.get
            L9_19 = L9_19(L10_20, L8_18)
            L9_19 = L9_19 + 1
            if L9_19 > 2 then
              L9_19 = 0
            end
            L10_20 = GameDatabase
            L10_20 = L10_20.set
            L10_20(L10_20, L8_18, L9_19)
          end
        end
      end
      for L3_13 = 1, 51 do
        for L7_17 = 1, 20 do
          L8_18 = ggd
          L9_19 = "Savedata__Info__sm"
          L10_20 = string
          L10_20 = L10_20.format
          L10_20 = L10_20("%02d", L3_13)
          L9_19 = L9_19 .. L10_20 .. "__sm" .. string.format("%02d", L3_13) .. "_info_" .. string.format("%02d", L7_17)
          L8_18 = L8_18[L9_19]
          if L8_18 then
            L9_19 = GameDatabase
            L10_20 = L9_19
            L9_19 = L9_19.get
            L9_19 = L9_19(L10_20, L8_18)
            L9_19 = L9_19 + 1
            if L9_19 > 2 then
              L9_19 = 0
            end
            L10_20 = GameDatabase
            L10_20 = L10_20.set
            L10_20(L10_20, L8_18, L9_19)
          end
        end
      end
      for L3_13 = 1, 20 do
        for L7_17 = 1, 20 do
          L8_18 = ggd
          L9_19 = "Savedata__Info__cm"
          L10_20 = string
          L10_20 = L10_20.format
          L10_20 = L10_20("%02d", L3_13)
          L9_19 = L9_19 .. L10_20 .. "__cm" .. string.format("%02d", L3_13) .. "_info_" .. string.format("%02d", L7_17)
          L8_18 = L8_18[L9_19]
          if L8_18 then
            L9_19 = GameDatabase
            L10_20 = L9_19
            L9_19 = L9_19.get
            L9_19 = L9_19(L10_20, L8_18)
            L9_19 = L9_19 + 1
            if L9_19 > 2 then
              L9_19 = 0
            end
            L10_20 = GameDatabase
            L10_20 = L10_20.set
            L10_20(L10_20, L8_18, L9_19)
          end
        end
      end
      for L3_13 = 1, 6 do
        for L7_17 = 1, 10 do
          L8_18 = ggd
          L9_19 = "Savedata__Info__dm"
          L10_20 = string
          L10_20 = L10_20.format
          L10_20 = L10_20("%02d", L3_13)
          L9_19 = L9_19 .. L10_20 .. "__dm" .. string.format("%02d", L3_13) .. "_info_" .. string.format("%02d", L7_17)
          L8_18 = L8_18[L9_19]
          if L8_18 then
            L9_19 = GameDatabase
            L10_20 = L9_19
            L9_19 = L9_19.get
            L9_19 = L9_19(L10_20, L8_18)
            L9_19 = L9_19 + 1
            if L9_19 > 2 then
              L9_19 = 0
            end
            L10_20 = GameDatabase
            L10_20 = L10_20.set
            L10_20(L10_20, L8_18, L9_19)
          end
        end
      end
    end
  },
  num1 = {
    desc = "GPU_Profiler",
    proc = function()
      invokeTask(function()
        if L0_0 == true then
          L0_0 = false
          Debug:setDebugMenuFocus({
            "Performance",
            "Profiler",
            "None"
          })
          wait()
          Debug:setDebugMenuFocus({})
          wait()
        else
          L0_0 = true
          Debug:setDebugMenuFocus({
            "Performance",
            "Profiler",
            "GPU Summary"
          })
          wait()
          Debug:setDebugMenuFocus({})
        end
      end)
    end
  },
  num2 = {
    desc = "Switch_FPS",
    proc = function()
      local L0_21
      L0_21 = {
        {"Display", "FPS"},
        {
          "Display",
          "FIOS2Driver Status"
        }
      }
      L2_2(L0_21)
    end
  },
  num3 = {
    desc = "Screenshot",
    proc = function()
      Debug:setSwitch({
        "Capture / ScreenShot",
        "Screenshot"
      })
    end
  },
  num4 = {
    desc = "CaptureMovie",
    proc = function()
      Debug:setSwitch({
        "Capture / ScreenShot",
        "Capture Movie"
      })
    end
  },
  num5 = {
    desc = "Destroy all enemies",
    proc = function()
      Debug:setSwitch({
        "Game Objects",
        "Enemy",
        "EnemySpawn",
        "Destroy all enemies"
      })
    end
  },
  num6 = {
    desc = "Navi Node",
    proc = function()
      local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30
      L0_22 = findGameObject2
      L1_23 = "Sandbox2"
      L2_24 = g_initial_sandbox_name
      L0_22 = L0_22(L1_23, L2_24)
      if L0_22 == nil then
        L1_23 = false
        return L1_23
      end
      L2_24 = L0_22
      L1_23 = L0_22.findGameObject2
      L3_25 = "Sandbox2"
      L4_26 = "mother2"
      L1_23 = L1_23(L2_24, L3_25, L4_26)
      if L1_23 == nil then
        L2_24 = false
        return L2_24
      end
      L2_24 = GameDatabase
      L3_25 = L2_24
      L2_24 = L2_24.get
      L4_26 = ggd
      L4_26 = L4_26.Savedata__EventManageFlags__CurrentMissionName
      L2_24 = L2_24(L3_25, L4_26)
      L4_26 = L1_23
      L3_25 = L1_23.findGameObject2
      L5_27 = "Sandbox2"
      L6_28 = L2_24
      L3_25 = L3_25(L4_26, L5_27, L6_28)
      if L3_25 == nil then
        L4_26 = false
        return L4_26
      end
      L5_27 = L3_25
      L4_26 = L3_25.findGameObject2
      L6_28 = "Node"
      L7_29 = "dbg_navi_node"
      L4_26 = L4_26(L5_27, L6_28, L7_29)
      if L4_26 == nil then
        L6_28 = L3_25
        L5_27 = L3_25.createGameObject2
        L7_29 = "Node"
        L5_27 = L5_27(L6_28, L7_29)
        L4_26 = L5_27
        L6_28 = L4_26
        L5_27 = L4_26.setName
        L7_29 = "dbg_navi_node"
        L5_27(L6_28, L7_29)
        L6_28 = L4_26
        L5_27 = L4_26.try_init
        L5_27(L6_28)
        L6_28 = L4_26
        L5_27 = L4_26.waitForReady
        L5_27(L6_28)
        L6_28 = L4_26
        L5_27 = L4_26.try_start
        L5_27(L6_28)
        L5_27 = Player
        L6_28 = L5_27
        L5_27 = L5_27.getRecentAreaName
        L5_27 = L5_27(L6_28)
        L6_28 = nil
        L7_29 = L1_23.sendEvent
        L7_29 = L7_29(L8_30, "getBackgroundElement2HandleTable")
        if L7_29 ~= nil then
          for _FORV_11_, _FORV_12_ in L8_30(L7_29) do
            if _FORV_12_:getTypeName() == "Area" then
              L6_28 = _FORV_12_:findSubArea(L5_27)
              if L6_28 ~= nil then
                L6_28:appendChild(L4_26)
                break
              end
            end
          end
        end
        L4_26:setWorldPos(L8_30)
        L4_26:setForceMove()
        HUD:naviSetActivate(true)
        HUD:naviSetTarget(L4_26)
      else
        L5_27 = HUD
        L6_28 = L5_27
        L5_27 = L5_27.naviSetActivate
        L7_29 = false
        L5_27(L6_28, L7_29)
        L5_27 = HUD
        L6_28 = L5_27
        L5_27 = L5_27.naviSetTarget
        L7_29 = nil
        L5_27(L6_28, L7_29)
        L6_28 = L4_26
        L5_27 = L4_26.try_term
        L5_27(L6_28)
      end
      L4_26 = nil
    end
  },
  num7 = {
    desc = "Safe_Frame",
    proc = function()
      local L0_31
      L0_31 = {
        {"Display", "Safe Frame"},
        {
          "Display",
          "DebugDrawGroup",
          "Default"
        },
        {"Display", "Debug Draw"}
      }
      L2_2(L0_31)
      Debug:setValue({
        "Display",
        "DebugDraw PrimScale"
      }, 2)
    end
  },
  num0 = {
    desc = "Switch_Performance",
    proc = function()
      local L0_32
      L0_32 = {
        {
          "Gfx",
          "Volumetric Fog",
          "Enabled"
        },
        {
          "Gfx",
          "Gradation",
          "Enabled"
        }
      }
      L2_2(L0_32)
      if Debug:getSwitch(L0_32[1]) then
        Debug:setSwitch({
          "Performance",
          "SetPerformParam(Default)"
        })
      else
        Debug:setSwitch({
          "Performance",
          "SetPerformParam(Minimum)"
        })
      end
    end
  }
})
