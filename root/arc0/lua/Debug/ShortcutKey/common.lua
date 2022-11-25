import("Debug")
filming_flag = false
function cancel_filming_mode()
  if filming_flag == true then
    Debug:setValue({
      "Performance",
      "SetPerformParam(Default)"
    })
    filming_flag = false
  end
end
DebugShortcutKey:registerKeyMap("common", {
  esc = {desc = "Exit App", proc = nil},
  home = {desc = "PS button", proc = nil},
  right = {
    desc = "Open DebugMenu",
    proc = function()
      Debug:openDebugMenu()
    end
  },
  tab = {
    desc = "Toggle DebugMenuDisp",
    proc = function()
      Debug:toggleDebugMenuDisp()
    end
  },
  space = {
    desc = "Pause Game",
    proc = function()
      Debug:pauseGame()
    end
  },
  period = {
    desc = "Frame advance",
    proc = function()
      Debug:advanceFrame()
    end
  },
  f2 = {
    desc = "Revert keys to init-map",
    revert_all = true,
    proc = function()
      DebugShortcutKey:dofile("user")
      cancel_filming_mode()
    end
  },
  f3 = {
    desc = "Switch KeyMap: Action",
    revert_all = true,
    proc = function()
      cancel_filming_mode()
      DebugShortcutKey:dofile("action")
    end
  },
  f6 = {
    desc = "Switch KeyMap: Event",
    revert_all = true,
    proc = function()
      cancel_filming_mode()
      DebugShortcutKey:dofile("event")
    end
  },
  f7 = {
    desc = "Switch KeyMap: CHARA_MOTION",
    revert_all = true,
    proc = function()
      cancel_filming_mode()
      Debug:setSwitch({"Display", "Debug Draw"}, true)
      DebugShortcutKey:dofile("chara_motion")
    end
  },
  f8 = {
    desc = "Switch KeyMap: UI",
    revert_all = true,
    proc = function()
      cancel_filming_mode()
      Debug:setSwitch({"Display", "Debug Draw"}, true)
      DebugShortcutKey:dofile("ui")
    end
  },
  f9 = {
    desc = "Switch KeyMap: BG",
    revert_all = true,
    proc = function()
      cancel_filming_mode()
      Debug:setSwitch({"Display", "Debug Draw"}, true)
      DebugShortcutKey:dofile("bg")
    end
  },
  f11 = {
    desc = "Switch KeyMap: CAPTURE",
    revert_all = true,
    proc = function()
      filming_flag = true
      Debug:setValue({
        "Performance",
        "SetPerformParam(Maximum)"
      })
      Debug:setSwitch({"Display", "Debug Draw"}, true)
      DebugShortcutKey:dofile("capture")
    end
  }
}, true, true)
