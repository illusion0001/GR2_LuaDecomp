import("math")
import("Debug")
import("HUD")
import("Font")
import("Pad")
dofile("/Debug/Action/debug_stage.lua")
test_cdemo = "ep90_00100c"
CDemo = {
  test_method = {
    RequestCapture = function(A0_0)
      print("RequestCapture for " .. A0_0)
      invokeSystemTask(function()
        local L0_1
        L0_1 = 0
        while L0_1 < 60 do
          L0_1 = L0_1 + 1
          wait()
        end
        HUD:menuNeedScriptingCapture()
        L0_1 = 0
        while L0_1 < 5 do
          L0_1 = L0_1 + 1
          wait()
        end
        HUD:menuNotifyReadyCapture()
      end)
      return 0
    end,
    OnForward = function(A0_2, A1_3, A2_4, A3_5)
      print("OnForward to " .. A0_2 .. " by " .. A1_3)
      return A2_4
    end,
    OnBackward = function(A0_6, A1_7, A2_8, A3_9)
      print("OnBackward to " .. A0_6 .. " by " .. A1_7)
      return A2_8
    end,
    OnMove = function(A0_10, A1_11, A2_12, A3_13)
      print("OnMove to " .. A0_10 .. " by " .. A1_11)
      return 0
    end,
    OnPlay = function()
      print("OnPlay")
      return 0
    end,
    OnEnd = function()
      print("OnEnd")
      return 0
    end,
    OnPause = function(A0_14)
      print("OnPause at " .. A0_14)
      return 0
    end,
    OnCancel = function(A0_15)
      print("OnCancel at " .. A0_15)
      return 0
    end
  }
}
CDemo[test_cdemo] = CDemo.test_method
function main()
  HUD:menuOpen("Gameover")
  HUD:menuOpen("Main")
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Debug:setSwitch({
    "Display",
    "Debug Draw GameObject"
  }, true)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  HUD:spgDispReq_FadeIn()
  setExitCallback(function()
    local L0_16, L1_17
  end)
  invokeTask(function()
    local L0_18, L1_19, L2_20
    L0_18 = 0
    while true do
      L1_19 = print
      L2_20 = L0_18
      L1_19(L2_20)
      if L0_18 == 0 then
        L1_19 = HUD
        L2_20 = L1_19
        L1_19 = L1_19.setCheckDirectory
        L1_19(L2_20, "gcd", "gcdm", true, "ep")
        L0_18 = 1
      elseif L0_18 == 1 then
        L1_19 = HUD
        L2_20 = L1_19
        L1_19 = L1_19.menuStatus
        L1_19 = L1_19(L2_20, "Debug")
        L1_19 = L1_19.state
        if L1_19 ~= "running" then
          L1_19 = HUD
          L2_20 = L1_19
          L1_19 = L1_19.getSelectFileName
          L1_19 = L1_19(L2_20)
          if L1_19 == "" then
            L0_18 = 0
          else
            L2_20 = tonumber
            L2_20 = L2_20(string.sub(L1_19, 3, 4))
            if L2_20 == nil or L2_20 >= 90 then
              L2_20 = 1
            end
            CDemo[L1_19] = CDemo.test_method
            HUD:cdemo(L1_19, L2_20)
            wait()
            HUD:menuOpen("CDemo")
            L0_18 = 2
          end
        end
      elseif L0_18 == 2 then
        L1_19 = HUD
        L2_20 = L1_19
        L1_19 = L1_19.menuStatus
        L1_19 = L1_19(L2_20, "CDemo")
        L1_19 = L1_19.state
        if L1_19 ~= "running" then
          L0_18 = 0
        end
      end
      L1_19 = wait
      L1_19()
    end
  end)
end
