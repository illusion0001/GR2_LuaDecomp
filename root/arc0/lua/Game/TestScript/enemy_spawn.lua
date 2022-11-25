dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
enmgen2_simple_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_01",
      name = "stalker01"
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
  end
}
enmgen2_simple_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_ene_01",
      name = "runner01"
    },
    {
      type = "stalker",
      locator = "locator_ene_02",
      name = "stalker01"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
  end
}
function Initialize()
  if findGameObject2("EnemyGenerator", "enmgen2_01_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_01_01"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_01_02") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_01_02"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_01_03") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_01_03"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_01_04") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_01_04"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_02_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_02_01"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_02_02") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_02_02"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_02_03") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_02_03"):requestSpawn()
  end
  if findGameObject2("EnemyGenerator", "enmgen2_02_04") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_02_04"):requestSpawn()
  end
end
function Ingame()
  Fn_missionStart()
end
function Finalize()
  local L0_16, L1_17
end
