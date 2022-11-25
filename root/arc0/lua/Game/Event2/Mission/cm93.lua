dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
_kill_cnt = 0
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "enm_01_01"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "enm_01_02"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "enm_01_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "enm_01_04"
    },
    {
      type = "stalker",
      locator = "locator_05",
      name = "enm_01_05"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    Fn_popupScore(A1_11, 100)
  end
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "enm_02_01"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "enm_02_02"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "enm_02_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "enm_02_04"
    },
    {
      type = "stalker",
      locator = "locator_05",
      name = "enm_02_05"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onObjectAsh = function(A0_22, A1_23)
    Fn_popupScore(A1_23, 100)
  end
}
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "enm_01_01"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "enm_01_02"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "enm_01_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "enm_01_04"
    },
    {
      type = "stalker",
      locator = "locator_05",
      name = "enm_01_05"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onSpawn = function(A0_30, A1_31)
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
    Fn_popupScore(A1_35, 100)
  end
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "enm_01_01"
    },
    {
      type = "stalker",
      locator = "locator_02",
      name = "enm_01_02"
    },
    {
      type = "stalker",
      locator = "locator_03",
      name = "enm_01_03"
    },
    {
      type = "stalker",
      locator = "locator_04",
      name = "enm_01_04"
    },
    {
      type = "stalker",
      locator = "locator_05",
      name = "enm_01_05"
    }
  },
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onSpawn = function(A0_42, A1_43)
  end,
  onObjectDead = function(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
    Fn_popupScore(A1_47, 100)
  end
}
function Initialize()
  local L0_48
  L0_48 = Fn_userCtrlAllOff
  L0_48()
  L0_48 = GameDatabase
  L0_48 = L0_48.set
  L0_48(L0_48, ggd.Savedata__EventManageFlags__ChallengeType, 1)
  L0_48 = {}
  L0_48.timer = {
    max = {
      0,
      59,
      59,
      99
    },
    start = {
      0,
      1,
      30,
      0
    }
  }
  L0_48.score = {start = 0}
  Fn_challengeInitialize(L0_48)
end
function Ingame()
  local L0_49, L1_50, L2_51, L3_52, L4_53
  L0_49 = {}
  L0_49.timer = true
  L0_49.score = true
  L1_50(L2_51)
  for L4_53 = 1, 4 do
    if findGameObject2("EnemyGenerator", "enmgen2_0" .. L4_53) then
      findGameObject2("EnemyGenerator", "enmgen2_0" .. L4_53):requestSpawn()
      repeat
        wait()
      until findGameObject2("EnemyGenerator", "enmgen2_0" .. L4_53):getEnemyCount() <= 0
      if L4_53 < 4 then
        Fn_addTime({
          0,
          0,
          10,
          0
        })
      end
    end
  end
  L1_50()
  repeat
    L1_50()
  until L1_50
end
function Finalize()
  Fn_challengeFinalize()
end
