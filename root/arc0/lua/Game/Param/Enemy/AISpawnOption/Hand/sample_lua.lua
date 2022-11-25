local L1_1
L0_0 = {}
L0_0.spawnOnStart = false
L0_0.autoPrepare = false
L1_1 = {
  {
    type = "hand",
    locator = "locator_01_01",
    name = "officer01",
    ai_spawn_option = "Hand/sample"
  },
  {
    type = "soldier_rifle",
    locator = "locator_01_01",
    name = "soldier01",
    group_name = "soldierGroup"
  },
  {
    type = "soldier_rifle",
    locator = "locator_01_01",
    name = "soldier02",
    group_name = "soldierGroup"
  },
  {
    type = "soldier_rifle",
    locator = "locator_01_01",
    name = "soldier03",
    group_name = "soldierGroup"
  }
}
L0_0.spawnSet = L1_1
L0_0.addHandSpawnSetName0 = "handSpawnSet0"
L1_1 = {
  {
    type = "stalker",
    locator = "locator_01_01",
    name = "call_soldier01"
  },
  {
    type = "stalker",
    locator = "locator_01_01",
    name = "call_soldier02"
  },
  {
    type = "stalker",
    locator = "locator_01_01",
    name = "call_soldier03"
  },
  {
    type = "stalker",
    locator = "locator_01_01",
    name = "call_soldier04"
  }
}
L0_0.handSpawnSet0 = L1_1
L0_0.addHandSpawnSetName1 = "handSpawnSet1"
L1_1 = {
  {
    type = "runner",
    locator = "locator_01_01",
    name = "call_soldier01"
  },
  {
    type = "runner",
    locator = "locator_01_01",
    name = "call_soldier02"
  },
  {
    type = "runner",
    locator = "locator_01_01",
    name = "call_soldier03"
  },
  {
    type = "runner",
    locator = "locator_01_01",
    name = "call_soldier04"
  }
}
L0_0.handSpawnSet1 = L1_1
function L1_1(A0_2)
  local L1_3
end
L0_0.onUpdate = L1_1
function L1_1(A0_4)
  local L1_5
end
L0_0.onEnter = L1_1
function L1_1(A0_6)
  local L1_7
end
L0_0.onLeave = L1_1
function L1_1(A0_8, A1_9)
end
L0_0.onObjectDead = L1_1
enemy_gen_01 = L0_0
