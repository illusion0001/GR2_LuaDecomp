L0_0 = import
L0_0("Player")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("Font")
L0_0 = dofile
L0_0("/Game/Event2/Common/SuppoterCommon.lua")
L0_0 = dofile
L0_0("/Game/Supporter/supporter_spawn.lua")
L0_0 = dofile
L0_0("/Game/Event2/Common/CommonAll.lua")
L0_0 = dofile
L0_0("/Debug/ShortcutKey/setup.lua")
__keytype = 0
__crow_pup = nil
__TaskHndl = nil
function L0_0()
  DebugShortcutKey:registerKeyMap("common2", {
    esc = {desc = "", proc = nil},
    home = {desc = "", proc = nil},
    right = {desc = "", proc = nil},
    tab = {desc = "", proc = nil},
    f2 = {desc = "", proc = nil},
    f3 = {desc = "", proc = nil},
    f6 = {desc = "", proc = nil},
    num1 = {
      desc = "TuneChange Type1:Flick",
      proc = function()
        local L0_1
        L0_1 = Debug
        L0_1 = L0_1.setValue
        L0_1(L0_1, {
          "Game Objects",
          "Player",
          "Pad: KeyAssign"
        }, 0)
        function L0_1(A0_2)
          local L1_3, L2_4, L3_5, L4_6
          for L4_6 = 1, 60 do
            Font:asciiPrint(650, 300, "TuneChange Type1:Flick")
            wait()
          end
        end
        if __TaskHndl ~= nil then
          __TaskHndl:abort()
          __TaskHndl = nil
        end
        __TaskHndl = invokeTask(L0_1)
      end
    },
    num2 = {
      desc = "TuneChange Type2:R2cycle",
      proc = function()
        local L0_7
        L0_7 = Debug
        L0_7 = L0_7.setValue
        L0_7(L0_7, {
          "Game Objects",
          "Player",
          "Pad: KeyAssign"
        }, 1)
        function L0_7(A0_8)
          local L1_9, L2_10, L3_11, L4_12
          for L4_12 = 1, 60 do
            Font:asciiPrint(650, 300, "TuneChange Type2:R2cycle")
            wait()
          end
        end
        if __TaskHndl ~= nil then
          __TaskHndl:abort()
          __TaskHndl = nil
        end
        __TaskHndl = invokeTask(L0_7)
      end
    },
    num3 = {
      desc = "TuneChange Type3:R2+LStick",
      proc = function()
        local L0_13
        L0_13 = Debug
        L0_13 = L0_13.setValue
        L0_13(L0_13, {
          "Game Objects",
          "Player",
          "Pad: KeyAssign"
        }, 2)
        function L0_13(A0_14)
          local L1_15, L2_16, L3_17, L4_18
          for L4_18 = 1, 60 do
            Font:asciiPrint(650, 300, "TuneChange Type3:R2+LStick")
            wait()
          end
        end
        if __TaskHndl ~= nil then
          __TaskHndl:abort()
          __TaskHndl = nil
        end
        __TaskHndl = invokeTask(L0_13)
      end
    },
    num4 = {
      desc = "TuneChange Type4:R2+RStick",
      proc = function()
        local L0_19
        L0_19 = Debug
        L0_19 = L0_19.setValue
        L0_19(L0_19, {
          "Game Objects",
          "Player",
          "Pad: KeyAssign"
        }, 3)
        function L0_19(A0_20)
          local L1_21, L2_22, L3_23, L4_24
          for L4_24 = 1, 60 do
            Font:asciiPrint(650, 300, "TuneChange Type4:R2+RStick")
            wait()
          end
        end
        if __TaskHndl ~= nil then
          __TaskHndl:abort()
          __TaskHndl = nil
        end
        __TaskHndl = invokeTask(L0_19)
      end
    },
    num5 = {
      desc = "TuneChange Type5:R2+Button",
      proc = function()
        local L0_25
        L0_25 = Debug
        L0_25 = L0_25.setValue
        L0_25(L0_25, {
          "Game Objects",
          "Player",
          "Pad: KeyAssign"
        }, 4)
        function L0_25(A0_26)
          local L1_27, L2_28, L3_29, L4_30
          for L4_30 = 1, 60 do
            Font:asciiPrint(650, 300, "TuneChange Type5:R2+Button")
            wait()
          end
        end
        if __TaskHndl ~= nil then
          __TaskHndl:abort()
          __TaskHndl = nil
        end
        __TaskHndl = invokeTask(L0_25)
      end
    },
    num7 = {
      desc = "crow create",
      proc = function()
        if __crow_pup == nil then
          invokeTask(function()
            local L0_31
            L0_31 = Player
            L0_31 = L0_31.getPuppet
            L0_31 = L0_31(L0_31)
            L0_31 = L0_31.getWorldPos
            L0_31 = L0_31(L0_31)
            print("pos=" .. tostring(L0_31))
            __crow_pup = Supporter.Spawner.create_supporter_crow(L0_31)
          end)
        else
          __crow_pup:kill()
          __crow_pup = nil
        end
      end
    },
    num9 = {
      desc = "pc pos",
      proc = function()
        GameDatabase:set(ggd.Debug__ResetPcPos, true)
      end
    },
    num0 = {
      desc = "Retry",
      proc = function()
        if event_name ~= "action_review_free" then
          Fn_nextMission()
          Fn_exitSandbox()
        end
      end
    }
  }, true, true)
end
function Fn_DebugShortcutKey_User_Test_Stage()
  DebugShortcutKey:setup("user_test_stage", L0_0)
end
