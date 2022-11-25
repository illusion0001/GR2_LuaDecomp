dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/GemCommon.lua")
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_setCatWarp
  L1_1 = false
  L0_0(L1_1)
  function L0_0()
    local L0_3, L1_4
  end
  L1_1 = {
    L2_2,
    {
      name = "locator2_cp_01_02"
    },
    {
      name = "locator2_cp_01_03",
      opt = {
        size = Vector(1, 1.5, 1)
      }
    },
    {
      name = "locator2_cp_01_04"
    },
    {
      name = "locator2_cp_01_05"
    },
    {
      name = "locator2_cp_01_06"
    },
    {
      name = "locator2_cp_02_01",
      opt = {
        size = Vector(2, 2, 2)
      }
    },
    {
      name = "locator2_cp_02_02"
    },
    {
      name = "locator2_cp_02_03"
    },
    {
      name = "locator2_cp_02_04",
      opt = {
        size = Vector(2, 1, 2)
      }
    },
    {
      name = "locator2_cp_03_01"
    },
    {
      name = "locator2_cp_03_02",
      opt = {
        size = Vector(2, 2, 2)
      }
    },
    {
      name = "locator2_cp_03_03",
      opt = {func = L0_0, marker = "goal"}
    }
  }
  L2_2 = {}
  L2_2.name = "locator2_cp_01_01"
  L2_2 = Fn_setCheckPointTable
  L2_2(L1_1)
  L2_2 = {}
  L2_2.counter = {
    max = #L1_1
  }
  Fn_challengeInitialize(L2_2)
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10
  L0_5 = {}
  L0_5.vctrl2_cp_01 = L1_6
  L0_5.vctrl2_cp_02 = L1_6
  L0_5.vctrl2_cp_03 = L1_6
  L0_5.vctrl2_cp_04 = L1_6
  L0_5.vctrl2_cp_05 = L1_6
  L0_5.vctrl2_cp_06 = L1_6
  L0_5.vctrl2_cp_07 = L1_6
  L0_5.vctrl2_cp_08 = L1_6
  L0_5.vctrl2_cp_09 = L1_6
  L0_5.vctrl2_cp_10 = L1_6
  L0_5.vctrl2_cp_11 = L1_6
  L0_5.vctrl2_cp_12 = L1_6
  for L4_9, L5_10 in L1_6(L2_7) do
    if findGameObject2("ViewControl", L4_9) then
      findGameObject2("ViewControl", L4_9):setAimTarget(L5_10, Vector(0, 1, 0))
    end
  end
  L4_9 = true
  L1_6(L2_7, L3_8, L4_9)
  L1_6.timer = true
  L1_6.counter = true
  L4_9 = nil
  L5_10 = true
  L2_7(L3_8, L4_9, L5_10)
  L2_7()
  L2_7()
end
function Finalize()
  Player:setAttrTune(Player.kAttrTune_Normal, true)
  Fn_challengeFinalize()
end
function pccubesensor2_tutorial_sidejump_OnEnter()
  Fn_tutorialCaption("mars_sidejump")
end
function pccubesensor2_tutorial_bigjump_OnEnter()
  Fn_tutorialCaption("mars_bigjump")
end
function pccubesensor2_tutorial_bigjump_dodge_OnEnter()
  Fn_tutorialCaption("mars_bigjump_dodge")
end
