import("common")
import("Debug")
import("GameDatabase")
import("Player")
import("HUD")
import("Pad")
function main()
  local L0_0
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {
    "Display",
    "File Asset Status"
  }, false)
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {
    "Display",
    "Warning Indicator"
  }, false)
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {"Display", "Debug Draw"}, true)
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {
    "Display",
    "Screen Console"
  }, true)
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {
    "Display",
    "DebugDrawGroup",
    "ScriptQuery"
  }, true)
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {
    "Display",
    "DebugDrawGroup",
    "ScriptDebugDraw"
  }, true)
  L0_0 = Debug
  L0_0 = L0_0.setSwitch
  L0_0(L0_0, {
    "Development",
    "Console",
    "Script"
  }, true)
  L0_0 = Debug
  L0_0 = L0_0.setValue
  L0_0(L0_0, {
    "Development",
    "Network",
    "Status",
    "ParamTableLocal"
  }, true)
  L0_0 = createSandbox2
  L0_0 = L0_0("father2")
  L0_0:setString("g_filename", "/Game/Event2/father2.lua")
  L0_0:try_init()
  L0_0:waitForReady()
  g_own:setGameObject("father2", L0_0)
  L0_0:try_start()
  while not GameDatabase:get(ggd.GlobalSystemFlags__PlayerSpawned) do
    wait()
  end
  L0_0 = nil
  createGameObject2("Area"):setName("test_kudo")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  Player:reset(Player.kReset_Standing, Vector(0, 1, 0), Quaternion(0, 0, 0, 1))
  while true do
    waitSeconds(3)
    monologueTest()
    HUD:fadein(1)
    while not HUD:faderStability() do
      wait()
    end
    wait()
  end
end
_capture_finish = false
_exitsandbox = false
function monologueTest()
  local L0_1
  _capture_finish = false
  L0_1 = {}
  function L0_1.OnEnter(A0_2)
    print("Enter page=" .. A0_2)
  end
  function L0_1.OnIdle(A0_3)
    print("Idle page=" .. A0_3)
  end
  function L0_1.OnCancel(A0_4)
    print("Cancel page=" .. A0_4)
  end
  function L0_1.RequestCapture(A0_5)
    print("Capture page=" .. A0_5)
    _waitSceneCapture()
  end
  function L0_1.WaitCapture(A0_6)
    print("WaitCapture page=" .. A0_6)
  end
  HUD:kaiwa("sm00_00000kme", L0_1, false)
  repeat
    wait()
  until _capture_finish
  print("monologue end")
end
function _waitSceneCapture()
  invokeSystemTask(function()
    _capture_finish = false
    print("wait capture")
    HUD:menuNeedScriptingCapture()
    while not _exitsandbox and not Pad:getButton(Pad.kButton_RL) do
      wait()
    end
    wait(10)
    HUD:menuNotifyReadyCapture()
    wait()
    print("finish capture")
    _capture_finish = true
  end)
end
function exitsandbox()
  local L0_7, L1_8
  _exitsandbox = true
end
setExitCallback(exitsandbox)
