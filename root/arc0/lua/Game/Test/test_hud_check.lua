local L1_1
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = import
L1_1 = "math"
L0_0(L1_1)
L0_0 = import
L1_1 = "common"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "Font"
L0_0(L1_1)
L0_0 = import
L1_1 = "Pad"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Supporter/supporter_spawn.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_stage.lua"
L0_0(L1_1)
test_cdemo = "ep90_00100c"
L0_0 = {}
L1_1 = {}
function L1_1.RequestCapture(A0_2)
  print("RequestCapture for " .. A0_2)
  invokeSystemTask(function()
    local L0_3
    L0_3 = print
    L0_3("Start InvokeTask")
    L0_3 = 0
    while L0_3 < 60 do
      print("loop" .. L0_3)
      L0_3 = L0_3 + 1
      wait()
    end
    HUD:menuNeedScriptingCapture()
    while L0_3 >= 0 do
      print("loop" .. L0_3)
      L0_3 = L0_3 - 1
      wait()
    end
    print("Finish InvokeTask")
    HUD:menuNotifyReadyCapture()
  end)
  return 0
end
function L1_1.OnForward(A0_4, A1_5, A2_6, A3_7)
  print("OnForward to " .. A0_4 .. " by " .. A1_5)
  return A2_6
end
function L1_1.OnBackward(A0_8, A1_9, A2_10, A3_11)
  print("OnBackward to " .. A0_8 .. " by " .. A1_9)
  return A2_10
end
function L1_1.OnMove(A0_12, A1_13, A2_14, A3_15)
  print("OnMove to " .. A0_12 .. " by " .. A1_13)
  return 0
end
function L1_1.OnPlay()
  print("OnPlay")
  return 0
end
function L1_1.OnEnd()
  print("OnEnd")
  return 0
end
function L1_1.OnPause(A0_16)
  print("OnPause at " .. A0_16)
  return 0
end
function L1_1.OnCancel(A0_17)
  print("OnCancel at " .. A0_17)
  return 0
end
L0_0.test_method = L1_1
CDemo = L0_0
L0_0 = 1
L1_1 = {
  {name = "cm90"},
  {name = "test"}
}
L1_1.cursor = 1
function main()
  local L0_18, L1_19, L2_20
  L0_18 = HUD
  L1_19 = L0_18
  L0_18 = L0_18.menuOpen
  L2_20 = "Main"
  L0_18(L1_19, L2_20)
  L0_18 = HUD
  L1_19 = L0_18
  L0_18 = L0_18.menuOpen
  L2_20 = "Gameover"
  L0_18(L1_19, L2_20)
  L0_18 = DebugStage
  L1_19 = L0_18
  L0_18 = L0_18.createTestStage
  L0_18 = L0_18(L1_19)
  L1_19 = DebugStage
  L2_20 = L1_19
  L1_19 = L1_19.createTestPlayer
  L1_19 = L1_19(L2_20, Vector(-22, 0, 17.6), YRotQuaternion(Deg2Rad(90)))
  L2_20 = initializeAllGameObjects
  L2_20()
  L2_20 = waitForReadyAllGameObjects
  L2_20()
  L2_20 = startAllGameObjects
  L2_20()
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {"Display", "Debug Draw"}, true)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "Debug Draw GameObject"
  }, true)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "File Asset Status"
  }, false)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "File Asset Status"
  }, false)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "FIOS2Driver Status"
  }, false)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "Screen Console"
  }, true)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "Warning Indicator"
  }, false)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "HUD",
    "Off debug print"
  }, true)
  L2_20 = Debug
  L2_20 = L2_20.setSwitch
  L2_20(L2_20, {
    "Display",
    "HUD",
    "Off debug print"
  }, true)
  L2_20 = HUD
  L2_20 = L2_20.hpgDispReq_FadeIn
  L2_20(L2_20)
  L2_20 = HUD
  L2_20 = L2_20.grgDispReq_FadeIn
  L2_20(L2_20)
  L2_20 = HUD
  L2_20 = L2_20.spgDispReq_FadeIn
  L2_20(L2_20)
  L2_20 = {
    {
      func = funcGameover,
      label = "Gameover"
    },
    {
      func = funcKaiwaDemo,
      label = "kaiwa"
    },
    {
      func = funcMovie,
      label = "Movie"
    },
    {
      func = funcMissionPause,
      label = "MissionPause"
    },
    {
      func = funcQuest,
      label = "Quest"
    },
    {
      func = funcCdemo,
      label = "Cdemo"
    },
    {
      func = funcRanking,
      label = "RankingChecker"
    },
    {
      func = funcInGamePause,
      label = "InGamePause"
    },
    {
      func = funcInfo,
      label = "Info"
    }
  }
  L2_20.cursor = 1
  invokeTask(function()
    local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27
    L0_21 = 0
    L1_22 = 0
    while true do
      if L0_21 == 0 then
        L2_23(L3_24, L4_25)
        L0_21 = 1
      elseif L0_21 == 1 then
        L5_26 = 128
        L6_27 = "Select= Up or Down | Decide= Right"
        L2_23(L3_24, L4_25, L5_26, L6_27)
        L5_26 = 144
        L6_27 = "Control Player= Circle"
        L2_23(L3_24, L4_25, L5_26, L6_27)
        for L5_26 = 1, #L3_24 do
          L6_27 = 128
          if L5_26 == L2_20.cursor then
            L6_27 = 144
          end
          Debug:screenPrint(L6_27, 160 + 16 * (L5_26 - 1), L2_20[L5_26].label)
        end
        L5_26 = false
        L6_27 = 10
        if L2_23 then
          L2_20.cursor = L2_23
          if L2_23 < 1 then
            L2_20.cursor = L2_23
          end
        else
          L5_26 = false
          L6_27 = 12
          if L2_23 then
            L2_20.cursor = L2_23
            if L2_23 < L3_24 then
              L2_20.cursor = 1
            end
          else
            L5_26 = false
            L6_27 = 11
            if L2_23 then
              L0_21 = 2
            else
              L5_26 = false
              L6_27 = 1
              if L2_23 then
                L2_23(L3_24, L4_25)
                L0_21 = 3
              end
            end
          end
        end
      elseif L0_21 == 2 then
        L1_22 = L2_23
        if L1_22 == -1 then
          L0_21 = 0
          L1_22 = 0
        end
      elseif L0_21 == 3 then
        if L2_23 == -1 then
          L0_21 = 0
          L1_22 = 0
        end
      end
      L2_23()
    end
  end)
end
function testFunc()
  print("\227\131\134\227\130\185\227\131\136")
  HUD:fadein(0)
end
function funcPlayerMove(A0_28)
  Debug:screenPrint(16, 64, "Mode{ PlayerControl }")
  Debug:screenPrint(32, 80, "End:Triangle")
  if Pad:getButton(Pad.kButton_RU) then
    return -1
  end
  return A0_28
end
function callbackGameoverContinue()
  print("\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136\227\129\151\227\129\190\227\129\155\227\129\134")
end
function callbackGameoverReturnToTitle()
  print("\227\130\191\227\130\164\227\131\136\227\131\171\227\129\171\230\136\187\227\130\140\227\129\163\227\129\166\227\129\149")
end
function funcGameover(A0_29)
  Debug:screenPrint(16, 64, "Mode{ GameOver }")
  Debug:screenPrint(32, 80, "End:Triangle | Start:L3")
  if A0_29 == 0 then
    HUD:debugSetUTPadAccess(false)
    HUD:setGameoverCallback("callbackGameoverContinue")
    HUD:setGameoverCallbackToTitle(callbackGameoverReturnToTitle)
    return 1
  elseif A0_29 == 1 then
    if Pad:getButton(Pad.kButton_L3) then
      HUD:debugQuickGameover()
      return 2
    elseif Pad:getButton(Pad.kButton_RU) then
      return 3
    end
  elseif A0_29 == 2 then
    if 1 <= HUD:faderAlpha() then
      Debug:setSwitch({
        "Debug Switches",
        "Disable GameOverTransition"
      }, false)
      HUD:fadein(0)
      return 1
    end
  elseif A0_29 == 3 then
    HUD:delGameoverCallbackToTitle(callbackGameoverReturnToTitle)
    HUD:delGameoverCallback("callbackGameoverContinue")
    return -1
  end
  return A0_29
end
function funcKaiwaDemo(A0_30)
  local L1_31
  L1_31 = Debug
  L1_31 = L1_31.screenPrint
  L1_31(L1_31, 16, 64, "Mode{ KaiwaDemo }")
  if A0_30 == 0 then
    L1_31 = HUD
    L1_31 = L1_31.setCheckDirectory
    L1_31(L1_31, "lua/kdemo", "evd", true)
    L1_31 = A0_30 + 1
    return L1_31
  elseif A0_30 == 1 then
    L1_31 = HUD
    L1_31 = L1_31.menuStatus
    L1_31 = L1_31(L1_31, "Debug")
    L1_31 = L1_31.state
    if L1_31 ~= "running" then
      L1_31 = HUD
      L1_31 = L1_31.getSelectFileName
      L1_31 = L1_31(L1_31)
      if L1_31 == "" then
        return -1
      else
        HUD:kaiwa(L1_31)
        return A0_30 + 1
      end
    end
  else
    L1_31 = HUD
    L1_31 = L1_31.menuStatus
    L1_31 = L1_31(L1_31, "Kaiwa")
    L1_31 = L1_31.state
    if L1_31 ~= "running" then
      L1_31 = 0
      return L1_31
    end
  end
  return A0_30
end
function funcCdemo(A0_32)
  local L1_33
  if A0_32 == 0 then
    L1_33 = Debug
    L1_33 = L1_33.screenPrint
    L1_33(L1_33, 16, 64, "Mode{ ComicDemo }")
    L1_33 = Debug
    L1_33 = L1_33.screenPrint
    L1_33(L1_33, 32, 80, "End:Triangle | Select:Right | Number:Up or Down")
    L1_33 = Debug
    L1_33 = L1_33.screenPrint
    L1_33(L1_33, 32, 96, L0_0)
    L1_33 = HUD
    L1_33 = L1_33.debugIsUTPadState
    L1_33 = L1_33(L1_33, 0, false, 11)
    if L1_33 then
      L1_33 = HUD
      L1_33 = L1_33.setCheckDirectory
      L1_33(L1_33, "gcd", "gcdm", true, "ep")
      L1_33 = 1
      return L1_33
    else
      L1_33 = HUD
      L1_33 = L1_33.debugIsUTPadState
      L1_33 = L1_33(L1_33, 0, false, 0)
      if L1_33 then
        L1_33 = -1
        return L1_33
      else
        L1_33 = HUD
        L1_33 = L1_33.debugIsUTPadState
        L1_33 = L1_33(L1_33, 1, false, 10)
        if L1_33 then
          L1_33 = L0_0
          L1_33 = L1_33 + 28
          L1_33 = L1_33 + 1
          L1_33 = L1_33 % 28
          L0_0 = L1_33
        else
          L1_33 = HUD
          L1_33 = L1_33.debugIsUTPadState
          L1_33 = L1_33(L1_33, 1, false, 12)
          if L1_33 then
            L1_33 = L0_0
            L1_33 = L1_33 + 28
            L1_33 = L1_33 - 1
            L1_33 = L1_33 % 28
            L0_0 = L1_33
          end
        end
      end
    end
  elseif A0_32 == 1 then
    L1_33 = HUD
    L1_33 = L1_33.menuStatus
    L1_33 = L1_33(L1_33, "Debug")
    L1_33 = L1_33.state
    if L1_33 ~= "running" then
      L1_33 = HUD
      L1_33 = L1_33.getSelectFileName
      L1_33 = L1_33(L1_33)
      if L1_33 == "" then
        return 0
      else
        CDemo[L1_33] = CDemo.test_method
        CDemo[L1_33].RequestCapture = function(A0_34)
          print("Start Change RequestCapture for " .. A0_34)
          invokeSystemTask(function()
            print("InvokeTask<Change>")
            HUD:menuNeedScriptingCapture()
            print("InvokeScriptMove")
            HUD:menuNotifyReadyCapture()
          end)
          print("End Change RequestCapture for " .. A0_34)
          return 0
        end
        HUD:cdemo(L1_33, L0_0)
        wait()
        HUD:menuOpen("CDemo")
        return 2
      end
    end
  elseif A0_32 == 2 then
    L1_33 = HUD
    L1_33 = L1_33.menuStatus
    L1_33 = L1_33(L1_33, "CDemo")
    L1_33 = L1_33.state
    if L1_33 ~= "running" then
      L1_33 = 0
      return L1_33
    end
  end
  return A0_32
end
function funcMovie(A0_35)
  local L1_36
  L1_36 = Debug
  L1_36 = L1_36.screenPrint
  L1_36(L1_36, 16, 64, "Mode{ Movie }")
  if A0_35 == 0 then
    L1_36 = HUD
    L1_36 = L1_36.setCheckDirectory
    L1_36(L1_36, "mp4", "mp4", true)
    L1_36 = A0_35 + 1
    return L1_36
  elseif A0_35 == 1 then
    L1_36 = HUD
    L1_36 = L1_36.menuStatus
    L1_36 = L1_36(L1_36, "Debug")
    L1_36 = L1_36.state
    if L1_36 ~= "running" then
      L1_36 = HUD
      L1_36 = L1_36.getSelectFileName
      L1_36 = L1_36(L1_36)
      if L1_36 == "" then
        return -1
      else
        HUD:movie(L1_36, 1, "0.0.0.0", 1, "0.0.0.255", true)
        wait()
        return A0_35 + 1
      end
    end
  elseif A0_35 == 2 then
    L1_36 = HUD
    L1_36 = L1_36.menuStatus
    L1_36 = L1_36(L1_36, "Movie")
    L1_36 = L1_36.state
    if L1_36 ~= "no entry" then
      L1_36 = print
      L1_36("test")
      L1_36 = Pad
      L1_36 = L1_36.getButton
      L1_36 = L1_36(L1_36, Pad.kButton_RU)
      if L1_36 then
        L1_36 = HUD
        L1_36 = L1_36.movieWaitEnd
        L1_36(L1_36)
        L1_36 = A0_35 + 1
        return L1_36
      end
    end
  else
    L1_36 = HUD
    L1_36 = L1_36.menuStatus
    L1_36 = L1_36(L1_36, "Movie")
    L1_36 = L1_36.state
    if L1_36 ~= "running" then
      L1_36 = HUD
      L1_36 = L1_36.fadein
      L1_36(L1_36, 0)
      L1_36 = 0
      return L1_36
    end
  end
  return A0_35
end
function funcRanking(A0_37)
  Debug:screenPrint(16, 64, "Mode{ Ranking }")
  Debug:screenPrint(32, 80, "End:Triangle | Select:Up or Down | Start:Right")
  Debug:screenPrint(32, 96, L1_1[L1_1.cursor].name)
  if A0_37 == 0 then
    if HUD:debugIsUTPadState(0, false, 11) then
      HUD:startRankingChecker(L1_1[L1_1.cursor].name)
      return A0_37 + 1
    elseif HUD:debugIsUTPadState(0, false, 0) then
      return -1
    elseif HUD:debugIsUTPadState(1, false, 10) then
      L1_1.cursor = L1_1.cursor + 1
      if L1_1.cursor > #L1_1 then
        L1_1.cursor = 1
      end
    elseif HUD:debugIsUTPadState(1, false, 12) then
      L1_1.cursor = L1_1.cursor - 1
      if L1_1.cursor < 1 then
        L1_1.cursor = #L1_1
      end
    end
  elseif A0_37 == 1 then
    return 0
  end
  return A0_37
end
function funcMissionPause(A0_38)
  Debug:screenPrint(16, 64, "Mode{ MissionPause }")
  Debug:screenPrint(32, 80, "End:Triangle")
  if A0_38 == 0 then
    HUD:setMenuMissionCallback("testFunc", "testFunc")
    HUD:debugSetUTPadAccess(false)
    GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Challenge)
    GameDatabase:set(ggd.Menu__IsActiveCallback, true)
    HUD:timerSetSecond(0)
    HUD:timerSetVisible(true, true)
    HUD:timerStart()
    HUD:counter99_99SetMax(49)
    HUD:counter99_99SetNum(46)
    HUD:counter99_99SetVisible(true, true)
    return A0_38 + 1
  else
    if A0_38 == 1 and Pad:getButton(Pad.kButton_RU) then
      HUD:delMenuMissionCallback()
      GameDatabase:set(ggd.Menu__PlayMissionType, HUD.kHUDMissionType_Free)
      GameDatabase:set(ggd.Menu__IsActiveCallback, false)
      HUD:timerStop()
      HUD:timerSetVisible(false, true)
      HUD:counter99_99SetVisible(false, true)
      return -1
    else
    end
  end
  return A0_38
end
function funcQuest(A0_39)
  Debug:screenPrint(16, 64, "Mode{ QuestPause }")
  Debug:screenPrint(32, 80, "End:Triangle")
  if A0_39 == 0 then
    HUD:menuSetCallback(HUD.kCallback_Retire, testFunc)
    HUD:setMainMenuInfoParam("ui_topinfo_header_01", "ui_topinfo_main_sm90", ({
      "ui_debug_caption_11",
      "ui_debug_caption_12"
    })[RandI(1, #{
      "ui_debug_caption_11",
      "ui_debug_caption_12"
    })])
    HUD:debugSetUTPadAccess(false)
    return A0_39 + 1
  elseif A0_39 == 1 and Pad:getButton(Pad.kButton_RU) then
    HUD:menuDelCallback(HUD.kCallback_Retire)
    return -1
  end
  return A0_39
end
function TestInGamePauseSkip()
  print("\227\130\185\227\130\173\227\131\131\227\131\151\227\129\160\n")
end
function TestInGamePauseReturn()
  print("\227\129\164\227\129\165\227\129\145\227\129\166\227\131\187\227\131\187\227\131\187\n")
end
function funcInGamePause(A0_40)
  Debug:screenPrint(16, 64, "Mode{ InGamePause }")
  Debug:screenPrint(32, 80, "End:Triangle")
  if A0_40 == 0 then
    HUD:menuSetCallback(HUD.kCallback_IGPauseSkip, TestInGamePauseSkip)
    HUD:menuSetCallback(HUD.kCallback_IGPauseReturn, TestInGamePauseReturn)
    HUD:debugSetUTPadAccess(false)
    return 1
  elseif A0_40 == 1 and Pad:getButton(Pad.kButton_RU) then
    HUD:menuDelCallback(HUD.kCallback_IGPauseSkip)
    HUD:menuDelCallback(HUD.kCallback_IGPauseReturn)
    return -1
  end
  return A0_40
end
function funcInfo(A0_41)
  Debug:screenPrint(16, 64, "Mode{ funcInfo }")
  Debug:screenPrint(32, 80, "Pause:L3 | End:Triangle")
  if A0_41 == 0 then
    if Pad:getButton(Pad.kButton_RU) then
      return -1
    elseif Pad:getButton(Pad.kButton_L3) then
      HUD:info({
        {
          T = "ep90_00300k_030",
          L = "mp4/ep00_00100m"
        },
        {
          T = "test info 2",
          L = "mp4/ep00_00200m",
          R = "k_eco01_ikari"
        }
      })
      return 1
    end
  else
    return 0
  end
  return A0_41
end
