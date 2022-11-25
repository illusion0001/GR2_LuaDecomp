local L1_1
function L0_0(A0_2)
  local L1_3
  L1_3 = {}
  L1_3.capture_wait_notime = false
  L1_3.capture_wait = true
  L1_3.finish = false
  L1_3.sndmng = g_own:getGameObject("soundManager")
  L1_3.cdemo_name = A0_2
  L1_3[A0_2] = {
    RequestCapture = function(A0_4)
      print("RequestCapture for " .. A0_4)
      invokeSystemTask(function()
        HUD:menuNeedScriptingCapture()
        while CDemo.capture_wait do
          wait()
        end
        if not CDemo.capture_wait_notime then
          wait(90)
          Fn_mobWaitForReady()
        end
        print("\227\130\173\227\131\163\227\131\151\227\131\129\227\131\163\227\129\174\232\168\177\229\143\175\227\129\140\229\135\186\227\129\190\227\129\151\227\129\159")
        HUD:menuNotifyReadyCapture()
      end)
      return 0
    end,
    OnForward = function(A0_5, A1_6, A2_7, A3_8)
      print("OnForward to " .. A0_5 .. " by " .. A1_6)
      return A2_7
    end,
    OnBackward = function(A0_9, A1_10, A2_11, A3_12)
      print("OnBackward to " .. A0_9 .. " by " .. A1_10)
      return A2_11
    end,
    OnMove = function(A0_13, A1_14, A2_15, A3_16)
      CDemo.sndmng:sendEvent("request", CDemo.cdemo_name, "cdemo", A0_13)
      print("OnMove to " .. A0_13 .. " by " .. A1_14)
      Sound:pulse(A0_2 .. "_" .. A0_13)
      return 0
    end,
    OnPlay = function()
      CDemo.sndmng:sendEvent("request", CDemo.cdemo_name, "cdemo", "play")
      HUD:fadein(0)
      print("OnPlay")
      Sound:pulse(A0_2 .. "_0")
      return 0
    end,
    OnEnd = function()
      CDemo.sndmng:sendEvent("request", CDemo.cdemo_name, "cdemo", "end")
      CDemo.finish = true
      if CDemo.cdemo_name == "ep80_00700c" then
        HUD:blackout(0)
      end
      print("OnEnd")
      return 0
    end,
    OnPause = function(A0_17)
      print("OnPause at " .. A0_17)
      return 0
    end,
    OnCancel = function(A0_18)
      CDemo.sndmng:sendEvent("request", CDemo.cdemo_name, "cdemo", "cancel")
      CDemo.finish = true
      print("OnCancel at " .. A0_18)
      return 0
    end
  }
  return L1_3
end
getCDemoTable = L0_0
