dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_lockPlayerAbility
  L1_1 = Player
  L1_1 = L1_1.kAbility_RocketJump
  L0_0(L1_1)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.GlobalSystemFlags__GaugeCoercion
  L0_0(L1_1, L2_2, true)
  L0_0 = Fn_setCatWarp
  L1_1 = false
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    L2_2,
    {
      name = "locator2_arrow_03",
      start_cp = 3,
      end_cp = 5,
      atr = "small"
    },
    {
      name = "locator2_arrow_04",
      start_cp = 4,
      end_cp = 6,
      atr = "small"
    },
    {
      name = "locator2_arrow_05",
      start_cp = 5,
      end_cp = 6,
      atr = "small"
    },
    {
      name = "locator2_arrow_06",
      start_cp = 6,
      end_cp = 8,
      atr = "small"
    },
    {
      name = "locator2_arrow_07",
      start_cp = 8,
      end_cp = 10,
      atr = "small"
    },
    {
      name = "locator2_arrow_08",
      start_cp = 9,
      end_cp = 10,
      atr = "small"
    },
    {
      name = "locator2_arrow_09",
      start_cp = 9,
      end_cp = 10,
      atr = "small"
    }
  }
  L1_1 = {}
  L1_1.name = "locator2_arrow_01"
  L1_1.start_cp = 0
  L1_1.end_cp = 2
  L1_1.atr = "small"
  L2_2 = {}
  L2_2.name = "locator2_arrow_02"
  L2_2.start_cp = 1
  L2_2.end_cp = 4
  L2_2.atr = "small"
  L1_1 = Fn_setArrowTable
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = {
    L2_2,
    {
      name = "locator2_cp_02"
    },
    {
      name = "locator2_cp_03"
    },
    {
      name = "locator2_cp_04"
    },
    {
      name = "locator2_cp_05"
    },
    {
      name = "locator2_cp_06"
    },
    {
      name = "locator2_cp_07"
    },
    {
      name = "locator2_cp_08"
    },
    {
      name = "locator2_cp_09"
    },
    {
      name = "locator2_cp_10",
      opt = {marker = "goal"}
    }
  }
  L2_2 = {}
  L2_2.name = "locator2_cp_01"
  L2_2 = Fn_setCheckPointTable
  L2_2(L1_1, {
    size = Vector(3, 3, 3)
  })
  L2_2 = {}
  L2_2.counter = {
    max = #L1_1
  }
  Fn_challengeInitialize(L2_2)
end
function Ingame()
  local L0_3
  L0_3 = Fn_unLockPlayerAbility
  L0_3(Player.kAbility_GravityRevert)
  L0_3 = Player
  L0_3 = L0_3.setStay
  L0_3(L0_3, true)
  L0_3 = Player
  L0_3 = L0_3.setEnergy
  L0_3(L0_3, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  L0_3 = Player
  L0_3 = L0_3.setAttrTune
  L0_3(L0_3, Player.kAttrTune_Normal, true)
  L0_3 = {}
  L0_3.timer = true
  L0_3.counter = true
  Fn_challengeStart(L0_3, nil, true)
  HUD:grgDispReq_FadeIn()
  Fn_runCheckPoint()
  waitSeconds(0.5)
  Player:setStay(true)
  Fn_challengeFinish()
end
function Finalize()
  Fn_unLockPlayerAbility(Player.kAbility_RocketJump)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, false)
  Fn_challengeFinalize()
end
