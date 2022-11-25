dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
enmgen2_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_01_01",
      name = "hand_01",
      ai_spawn_option = "Hand/sample"
    }
  },
  addHandSpawnSetName0 = "spawnSethand0",
  spawnSethand0 = {
    {
      type = "stalker",
      locator = "locator_01_02",
      name = "call_enemy_01"
    },
    {
      type = "stalker",
      locator = "locator_01_03",
      name = "call_enemy_02"
    },
    {
      type = "stalker",
      locator = "locator_01_04",
      name = "call_enemy_03"
    }
  },
  addHandSpawnSetName1 = "spawnSethand1",
  spawnSethand1 = {
    {
      type = "gellyfish",
      locator = "locator_01_05",
      name = "call_enemy_11"
    },
    {
      type = "gellyfish",
      locator = "locator_01_06",
      name = "call_enemy_12"
    },
    {
      type = "gellyfish",
      locator = "locator_01_07",
      name = "call_enemy_13"
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
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    local L3_10
    L3_10 = enmgen2_01
    L3_10.enemyDeadNum = enmgen2_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_11, L1_12
    L0_11 = enmgen2_01
    L0_11 = L0_11.spawnSet
    L0_11 = #L0_11
    return L0_11
  end,
  getEnemyDeadNum = function()
    local L1_13
    L1_13 = enmgen2_01
    L1_13 = L1_13.enemyDeadNum
    return L1_13
  end,
  getEnemyName = function(A0_14)
    local L1_15
    L1_15 = enmgen2_01
    L1_15 = L1_15.spawnSet
    L1_15 = L1_15[A0_14]
    L1_15 = L1_15.name
    return L1_15
  end
}
function Initialize()
  local L0_16, L1_17
end
function Ingame()
  invokeTask(function()
    local L0_18, L1_19, L2_20
    function L0_18(A0_21, A1_22, A2_23)
      local L3_24, L4_25
      L3_24 = findGameObject2
      L4_25 = "Node"
      L3_24 = L3_24(L4_25, A0_21)
      if L3_24 ~= nil then
        L4_25 = createGameObject2
        L4_25 = L4_25("SimpleModel")
        L4_25:setModelName(A1_22)
        L4_25:setName(A0_21)
        L4_25:setWorldPos(A2_23)
        L4_25:try_init()
        L4_25:waitForReady()
        L4_25:try_start()
        L3_24:appendChild(L4_25)
        L4_25:setActive(true)
      end
    end
    sim_create = L0_18
    L0_18 = sim_create
    L1_19 = "locator2_gp_m_bk_testbk_half"
    L2_20 = "gp_m_bk_testbk_third"
    L0_18(L1_19, L2_20, Vector(0, 0, 0))
    L0_18 = sim_create
    L1_19 = "locator2_hand_test_2"
    L2_20 = "nvpal01_base"
    L0_18(L1_19, L2_20, Vector(0, 0, 0))
    L0_18 = sim_create
    L1_19 = "locator2_gp_m_bk_testbk"
    L2_20 = "gp_m_bk_testbk"
    L0_18(L1_19, L2_20, Vector(0, 0, 0))
    L0_18 = sim_create
    L1_19 = "locator2_hand_test_3"
    L2_20 = "nvpal01_base"
    L0_18(L1_19, L2_20, Vector(0, 0, 0))
  end)
  Fn_missionStart()
end
function Finalize()
  local L0_26, L1_27
end
