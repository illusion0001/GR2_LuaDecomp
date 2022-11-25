local L1_1
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = Debug
L1_1 = L0_0
L0_0 = L0_0.isDebugMenuOpen
L0_0 = L0_0(L1_1)
function L1_1(A0_2)
  local L1_3
  L1_3 = true
  if Debug:getSwitch(A0_2[1]) then
    L1_3 = false
  end
  for _FORV_5_ = 1, #A0_2 do
    Debug:setSwitch(A0_2[_FORV_5_], L1_3)
  end
end
DebugShortcutKey:registerKeyMap("chara_motion", {
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
      local L0_4
      L0_4 = {
        {"Display", "FPS"},
        {
          "Display",
          "FIOS2Driver Status"
        }
      }
      L1_1(L0_4)
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
    desc = "Npc Name",
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
  num7 = {
    desc = "Switch_NodeName",
    proc = function()
      local L0_5
      L0_5 = {
        {
          "Viewer",
          "DrawNodeName"
        },
        {
          "Display",
          "DebugDrawGroup",
          "Locator"
        }
      }
      L1_1(L0_5)
    end
  },
  num8 = {
    desc = "Switch_ShowPuppetAnimInfo",
    proc = function()
      local L0_6
      L0_6 = {
        {
          "Viewer",
          "ShowPuppetAnimInfo"
        },
        {
          "Display",
          "DebugDrawGroup",
          "Animation"
        },
        {"Display", "Debug Draw"}
      }
      L1_1(L0_6)
    end
  },
  num9 = {
    desc = "Switch_Skeleton",
    proc = function()
      local L0_7
      L0_7 = {
        {
          "Display",
          "DebugDrawGroup",
          "Animation"
        },
        {
          "Viewer",
          "DrawPuppetSkeleton"
        },
        {"Display", "Debug Draw"}
      }
      L1_1(L0_7)
    end
  },
  num0 = {
    desc = "Switch_Performance",
    proc = function()
      local L0_8
      L0_8 = {
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
      L1_1(L0_8)
      if Debug:getSwitch(L0_8[1]) then
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
  },
  q = {
    desc = "Switch_PolyDemo_Capture_Mode",
    proc = function()
      local L0_9
      L0_9 = {
        {
          "Viewer",
          "PolyDemo Capture Mode"
        }
      }
      L1_1(L0_9)
    end
  }
})
