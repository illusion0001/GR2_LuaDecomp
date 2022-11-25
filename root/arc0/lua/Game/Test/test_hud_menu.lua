import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
CDemo = {
  ep01_02c = {
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
function main()
  local L0_16, L1_17, L2_18, L3_19
  L0_16 = HUD
  L1_17 = L0_16
  L0_16 = L0_16.menuOpen
  L2_18 = "Gameover"
  L0_16(L1_17, L2_18)
  L0_16 = HUD
  L1_17 = L0_16
  L0_16 = L0_16.menuOpen
  L2_18 = "Main"
  L0_16(L1_17, L2_18)
  L0_16 = Vector
  L1_17 = -22
  L2_18 = 0
  L3_19 = 17.6
  L0_16 = L0_16(L1_17, L2_18, L3_19)
  org = L0_16
  L0_16 = createGameObject2
  L1_17 = "TerrainBg"
  L0_16 = L0_16(L1_17)
  L2_18 = L0_16
  L1_17 = L0_16.setName
  L3_19 = "motion_test_stage1"
  L1_17(L2_18, L3_19)
  L2_18 = L0_16
  L1_17 = L0_16.setModelName
  L3_19 = "motion_test_stage1"
  L1_17(L2_18, L3_19)
  L2_18 = L0_16
  L1_17 = L0_16.setCollisionName
  L3_19 = "motion_test_stage1"
  L1_17(L2_18, L3_19)
  L2_18 = L0_16
  L1_17 = L0_16.setPos
  L3_19 = Vector
  L3_19 = L3_19(0, -0.6, 0)
  L1_17(L2_18, L3_19, L3_19(0, -0.6, 0))
  L1_17 = DebugStage
  L2_18 = L1_17
  L1_17 = L1_17.createTestPlayer
  L3_19 = org
  L1_17 = L1_17(L2_18, L3_19, YRotQuaternion(Deg2Rad(90)))
  L2_18 = print
  L3_19 = "init all"
  L2_18(L3_19)
  L2_18 = initializeAllGameObjects
  L2_18()
  L2_18 = print
  L3_19 = "wait ready all"
  L2_18(L3_19)
  L2_18 = waitForReadyAllGameObjects
  L2_18()
  L2_18 = print
  L3_19 = "start all"
  L2_18(L3_19)
  L2_18 = startAllGameObjects
  L2_18()
  L2_18 = Debug
  L3_19 = L2_18
  L2_18 = L2_18.setSwitch
  L2_18(L3_19, {
    "Display",
    "Debug Draw GameObject"
  }, true)
  L2_18 = Debug
  L3_19 = L2_18
  L2_18 = L2_18.setSwitch
  L2_18(L3_19, {
    "Display",
    "Warning Indicator"
  }, false)
  L2_18 = HUD
  L3_19 = L2_18
  L2_18 = L2_18.hpgDispReq_FadeIn
  L2_18(L3_19)
  L2_18 = HUD
  L3_19 = L2_18
  L2_18 = L2_18.grgDispReq_FadeIn
  L2_18(L3_19)
  L2_18 = HUD
  L3_19 = L2_18
  L2_18 = L2_18.spgDispReq_FadeIn
  L2_18(L3_19)
  L2_18 = "photo_mode"
  L3_19 = "locator1"
  HUD:testCreate(L2_18, L3_19)
  HUD:testSetAnim({Circle = "action"})
  setExitCallback(function()
    local L0_20, L1_21
  end)
  invokeTask(function()
    local L0_22, L1_23
    L0_22 = "ep90_01800k"
    L1_23 = nil
    while true do
      HUD:testCreate(L2_18, L3_19)
      if HUD:testGetKey("L1") then
        if L1_23 ~= nil then
          L1_23:wait()
          HUD:kaiwa(L1_23:getRoot())
        else
          HUD:kaiwa(L0_22)
        end
      elseif HUD:testGetKey("R1") then
        HUD:info({
          {
            T = "ep90_00300k_030",
            L = "mp4/ep00_00100m"
          },
          {
            T = "test info 2",
            L = "kk_cro01_ikari",
            R = "k_eco01_ikari"
          }
        })
      elseif HUD:testGetKey("Triangle") then
        HUD:cdemo("ep01_02c")
        HUD:menuOpen("CDemo")
        wait()
      elseif HUD:testGetKey("L2") then
        HUD:fadeout(1, 3)
      elseif HUD:testGetKey("R2") then
        HUD:fadein(3)
      elseif HUD:testGetKey("Square") then
        HUD:yesnoSetThreshold(5, 1, 0.3)
        invokeTask(function()
          while true do
            if HUD:yesnoView("ic_001") <= HUD.kYesNoAnswerNone then
              if HUD:yesnoView("ic_001") == HUD.kYesNoAnswerIn then
                print("[[YesNoInputStart/please lock PC!]]")
              end
              if HUD:testGetKey("R1") then
                HUD:yesnoCancel()
              end
            elseif HUD:yesnoView("ic_001") == HUD.kYesNoAnswerYesFlow then
            elseif HUD:yesnoView("ic_001") == HUD.kYesNoAnswerYes then
              print("[[YES]]")
              break
            elseif HUD:yesnoView("ic_001") == HUD.kYesNoAnswerNoFlow then
            elseif HUD:yesnoView("ic_001") == HUD.kYesNoAnswerNo then
              print("[[NO]]")
              break
            end
            wait()
          end
        end)
      end
      wait()
    end
  end)
end
