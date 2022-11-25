import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
test_mine_select_tbl = {}
test_mine_select_tbl.root = {
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine01",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine01_gravityDensity",
      data_label = "Mine01_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 0
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine01_mineLevel",
      data_label = "Mine01_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 1
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine01_unstableState",
      data_label = "Mine01_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine01_gravityStorm",
      data_label = "Mine01_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine01_impossibleMine",
      data_label = "Mine01_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine01_miningNum",
      data_label = "Mine01_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 1
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine02",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine02_gravityDensity",
      data_label = "Mine02_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 1
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine02_mineLevel",
      data_label = "Mine02_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 2
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine02_unstableState",
      data_label = "Mine02_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine02_gravityStorm",
      data_label = "Mine02_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine02_impossibleMine",
      data_label = "Mine02_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine02_miningNum",
      data_label = "Mine02_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 22
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine03",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine03_gravityDensity",
      data_label = "Mine03_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 2
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine03_mineLevel",
      data_label = "Mine03_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 3
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine03_unstableState",
      data_label = "Mine03_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine03_gravityStorm",
      data_label = "Mine03_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine03_impossibleMine",
      data_label = "Mine03_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine03_miningNum",
      data_label = "Mine03_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 333
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine04",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine04_gravityDensity",
      data_label = "Mine04_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 3
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine04_mineLevel",
      data_label = "Mine04_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 4
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine04_unstableState",
      data_label = "Mine04_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine04_gravityStorm",
      data_label = "Mine04_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine04_impossibleMine",
      data_label = "Mine04_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine04_miningNum",
      data_label = "Mine04_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 4444
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine05",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine05_gravityDensity",
      data_label = "Mine05_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 4
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine05_mineLevel",
      data_label = "Mine05_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 5
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine05_unstableState",
      data_label = "Mine05_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine05_gravityStorm",
      data_label = "Mine05_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine05_impossibleMine",
      data_label = "Mine05_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine05_miningNum",
      data_label = "Mine05_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 55555
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine06",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine06_gravityDensity",
      data_label = "Mine06_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 5
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine06_mineLevel",
      data_label = "Mine06_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 6
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine06_unstableState",
      data_label = "Mine06_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine06_gravityStorm",
      data_label = "Mine06_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine06_impossibleMine",
      data_label = "Mine06_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine06_miningNum",
      data_label = "Mine06_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 666666
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine07",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine07_gravityDensity",
      data_label = "Mine07_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 6
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine07_mineLevel",
      data_label = "Mine07_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 7
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine07_unstableState",
      data_label = "Mine07_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine07_gravityStorm",
      data_label = "Mine07_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine07_impossibleMine",
      data_label = "Mine07_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine07_miningNum",
      data_label = "Mine07_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 7777777
    }
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "Mine08",
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine08_gravityDensity",
      data_label = "Mine08_gravityDensity",
      step = 1,
      min = 0,
      max = 7,
      num = 7
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine08_mineLevel",
      data_label = "Mine08_mineLevel",
      step = 1,
      min = 1,
      max = 7,
      num = 7
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine08_unstableState",
      data_label = "Mine08_unstableState",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine08_gravityStorm",
      data_label = "Mine08_gravityStorm",
      data = false
    },
    {
      type = dbgCommon.kTypeBoolean,
      data_name = "Mine08_impossibleMine",
      data_label = "Mine08_impossibleMine",
      data = false
    },
    {
      type = dbgCommon.kTypeInteger,
      data_name = "Mine08_miningNum",
      data_label = "Mine08_miningNum",
      step = 1,
      min = 0,
      max = 9999999,
      num = 1234567
    }
  },
  {
    type = dbgCommon.kTypeInteger,
    data_name = "Current_MineID",
    data_label = "Current_MineID",
    step = 1,
    min = 0,
    max = 8,
    num = 0
  }
}
function test_mine_select_tbl.root.Execute(A0_0)
  local L1_1, L2_2
  L1_1 = wait
  L2_2 = 2
  L1_1(L2_2)
  L1_1 = {}
  TextParam = L1_1
  L1_1 = dbgCommon
  L1_1 = L1_1.get_param
  L2_2 = TextParam
  L1_1(L2_2, A0_0)
  L1_1 = HUD
  L2_2 = L1_1
  L1_1 = L1_1.mineSelectInit
  L1_1(L2_2)
  L1_1 = HUD
  L2_2 = L1_1
  L1_1 = L1_1.mineSelectSetting
  L1_1(L2_2, TextParam)
  L1_1 = HUD
  L2_2 = L1_1
  L1_1 = L1_1.mineSelectOpen
  L1_1(L2_2)
  while true do
    L1_1 = HUD
    L2_2 = L1_1
    L1_1 = L1_1.mineSelectGetResult
    L1_1 = L1_1(L2_2)
    L2_2 = 0
    if L1_1 ~= HUD.kHUDMineSelect_None then
      if L1_1 == HUD.kHUDMineSelect_Decide then
        print("mine select decide")
        L2_2 = HUD:mineSelectGetMineId()
        break
      end
      if L1_1 == HUD.kHUDMineSelect_Return then
        print("mine select return")
        break
      end
      if L1_1 == HUD.kHUDMineSelect_ReturnTown then
        print("mine select returntown")
      end
      break
    end
    wait()
  end
end
function test_mine_select()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  dbgCommon.TreeExecute(test_mine_select_tbl.root)
end
