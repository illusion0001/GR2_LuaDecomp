import("GameDatabase")
import("math")
import("common")
import("Debug")
import("HUD")
import("Font")
import("Pad")
import("Debug")
import("Sound")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0
  L0_0 = nil
  Sound:loadResource("voice")
  Sound:loadResource("voice_jir")
  Sound:loadResource("voice_hex")
  Sound:loadResource("demo_se")
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Debug:setSwitch({"Display"}, false)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  HUD:spgDispReq_FadeIn()
  HUD:fadein(0.5)
  wait()
  while not HUD:faderStability() do
    wait()
  end
  invokeTask(function()
    local L0_1, L1_2, L2_3
    L0_1 = 0
    while true do
      if L0_1 == 0 then
        L1_2 = HUD
        L2_3 = L1_2
        L1_2 = L1_2.setCheckDirectory
        L1_2(L2_3, "lua/kdemo", "evd", true)
        L0_1 = 1
      elseif L0_1 == 1 then
        L1_2 = HUD
        L2_3 = L1_2
        L1_2 = L1_2.menuStatus
        L1_2 = L1_2(L2_3, "Debug")
        L1_2 = L1_2.state
        if L1_2 ~= "running" then
          L1_2 = HUD
          L2_3 = L1_2
          L1_2 = L1_2.getSelectFileName
          L1_2 = L1_2(L2_3)
          if L1_2 == "" then
            L0_1 = 0
          else
            L2_3 = string
            L2_3 = L2_3.match
            L2_3 = L2_3(L1_2, "(.-)_()")
            L0_0 = L2_3
            L2_3 = L0_0
            if L2_3 then
              L2_3 = Sound
              L2_3 = L2_3.loadResource
              L2_3(L2_3, L0_0 .. "_se")
              L2_3 = print
              L2_3("SE " .. L0_0 .. "_se \227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\227\129\190\227\129\151\227\129\159")
            end
            L2_3 = print
            L2_3(L1_2)
            L2_3 = {}
            function L2_3.OnEnter(A0_4)
              print("Enter page=" .. A0_4)
            end
            function L2_3.OnIdle(A0_5)
              print("Idle page=" .. A0_5)
            end
            function L2_3.OnCancel(A0_6)
              print("Cancel page=" .. A0_6)
            end
            function L2_3.RequestCapture(A0_7)
              print("Capture page=" .. A0_7)
              HUD:menuNotifyReadyCapture()
            end
            function L2_3.WaitCapture(A0_8)
              print("WaitCapture page=" .. A0_8)
            end
            HUD:kaiwa(L1_2, L2_3)
            L0_1 = 2
          end
        end
      elseif L0_1 == 2 then
        L1_2 = HUD
        L2_3 = L1_2
        L1_2 = L1_2.menuStatus
        L1_2 = L1_2(L2_3, "Kaiwa")
        L1_2 = L1_2.state
        if L1_2 ~= "running" then
          L1_2 = L0_0
          if L1_2 then
            L1_2 = Sound
            L2_3 = L1_2
            L1_2 = L1_2.unloadResource
            L1_2(L2_3, L0_0 .. "_se")
            L1_2 = print
            L2_3 = "SE "
            L2_3 = L2_3 .. L0_0 .. "_se \227\130\146\231\160\180\230\163\132\227\129\151\227\129\190\227\129\151\227\129\159"
            L1_2(L2_3)
          end
          L0_1 = 0
          L1_2 = HUD
          L2_3 = L1_2
          L1_2 = L1_2.fadein
          L1_2(L2_3, 0)
        end
      end
      L1_2 = wait
      L1_2()
    end
  end)
end
