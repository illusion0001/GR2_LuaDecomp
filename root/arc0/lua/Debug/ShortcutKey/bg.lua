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
DebugShortcutKey:registerKeyMap("bg", {
  num1 = {
    desc = "GPU_Profiler",
    proc = function()
      invokeTask(function()
        if is_focus_perf == true then
          is_focus_perf = false
          Debug:setDebugMenuFocus({
            "Performance",
            "Profiler",
            "None"
          })
          wait()
          Debug:setDebugMenuFocus({})
          wait()
        else
          is_focus_perf = true
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
    desc = "Switch_ModelName",
    proc = function()
      local L0_5
      L0_5 = {
        {
          "Gfx",
          "ModelName Display"
        }
      }
      L1_1(L0_5)
    end
  },
  num7 = {
    desc = "Switch_SelectedModelList",
    proc = function()
      local L0_6
      L0_6 = {
        {
          "Gfx",
          "ModelName Display"
        },
        {"Display", "Debug Draw"}
      }
      L1_1(L0_6)
      if Debug:getSwitch(L0_6[1]) then
        Debug:setDebugMenuFocus({
          "Gfx",
          "SelectedModelList",
          " "
        })
      else
        Debug:setDebugMenuFocus({})
      end
    end
  },
  num8 = {
    desc = "Switch_BaseModelList",
    proc = function()
      if Debug:isDebugMenuOpen() then
        Debug:setDebugMenuFocus({})
      else
        Debug:setDebugMenuFocus({
          "Gfx",
          "BaseModelList(SubMesh)",
          " "
        })
      end
    end
  },
  num9 = {
    desc = "Switch_Light",
    proc = function()
      local L0_7
      L0_7 = {
        {
          "Display",
          "DebugDrawGroup",
          "Light"
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
  d = {
    desc = "Switch_Decal",
    proc = function()
      local L0_9
      L0_9 = {
        {
          "Display",
          "DebugDrawGroup",
          "Decal"
        },
        {"Display", "Debug Draw"}
      }
      L1_1(L0_9)
    end
  },
  c = {
    desc = "Switch_Collision",
    proc = function()
      local L0_10
      L0_10 = {
        {
          "Display",
          "DebugDrawGroup",
          "Collision"
        },
        {"Display", "Debug Draw"}
      }
      L1_1(L0_10)
    end
  },
  g = {
    desc = "Switch_Gimmick",
    proc = function()
      local L0_11
      L0_11 = {
        {
          "Display",
          "DebugDrawGroup",
          "GimmickBg"
        },
        {"Display", "Debug Draw"}
      }
      L1_1(L0_11)
    end
  },
  f = {
    desc = "Switch_Fog",
    proc = function()
      local L0_12
      L0_12 = {
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
      L1_1(L0_12)
    end
  },
  p = {
    desc = "Switch_Performance",
    proc = function()
      if Debug:isDebugMenuOpen() then
        Debug:setDebugMenuFocus({})
      else
        Debug:setDebugMenuFocus({
          "Performance",
          "Bg",
          " "
        })
      end
    end
  },
  s = {
    desc = "Switch_GraviryOre or Gem",
    proc = function()
      GameDatabase:set(ggd.Debug__ScriptObj, not GameDatabase:get(ggd.Debug__ScriptObj))
    end
  }
})
