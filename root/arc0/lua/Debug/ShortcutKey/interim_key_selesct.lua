import("Debug")
import("GameDatabase")
DebugShortcutKey:registerKeyMap("common", {
  right = {
    desc = "right",
    proc = function()
      invokeTask(function()
        GameDatabase:set(ggd.Debug__KeyRight, true)
        wait()
        GameDatabase:set(ggd.Debug__KeyRight, false)
      end)
    end
  },
  left = {
    desc = "left",
    proc = function()
      invokeTask(function()
        GameDatabase:set(ggd.Debug__KeyLeft, true)
        wait()
        GameDatabase:set(ggd.Debug__KeyLeft, false)
      end)
    end
  },
  up = {
    desc = "up",
    proc = function()
      invokeTask(function()
        GameDatabase:set(ggd.Debug__KeyUp, true)
        wait()
        GameDatabase:set(ggd.Debug__KeyUp, false)
      end)
    end
  },
  down = {
    desc = "down",
    proc = function()
      invokeTask(function()
        GameDatabase:set(ggd.Debug__KeyDown, true)
        wait()
        GameDatabase:set(ggd.Debug__KeyDown, false)
      end)
    end
  }
}, true, true)
