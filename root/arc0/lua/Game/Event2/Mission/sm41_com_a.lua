import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/HeaderCommon.lua")
import("Vehicle")
puppets = {}
nevybattle_spawn = {}
nevybattle_caption_flag = false
haze_tbl = {}
_script_ship = {
  ship = nil,
  pos_route_tbl = nil,
  route_object = nil
}
enmgen2_nevybattle_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      name = "enemy01a",
      type = "stalker_strong",
      locator = "locator2_nevybattle02_01"
    },
    {
      name = "enemy01b",
      type = "stalker_strong",
      locator = "locator2_nevybattle02_02"
    },
    {
      name = "enemy01c",
      type = "stalker_strong",
      locator = "locator2_nevybattle02_03"
    },
    {
      name = "enemy01d",
      type = "stalker_strong",
      locator = "locator2_nevybattle02_04"
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
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
    nevybattle_caption_flag = true
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      A0_12:getSpecTable().spawnSet[1].name,
      A0_12:getSpecTable().spawnSet[2].name,
      A0_12:getSpecTable().spawnSet[3].name,
      A0_12:getSpecTable().spawnSet[4].name
    }, 4, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_nevybattle_02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy02a",
      type = "stalker_strong",
      locator = "locator2_nevybattle02_01"
    },
    {
      name = "enemy02b",
      type = "runner_strong",
      locator = "locator2_nevybattle02_02"
    },
    {
      name = "enemy02c",
      type = "treecannon_strong",
      locator = "locator2_nevybattle02_03"
    },
    {
      name = "enemy02e",
      type = "guardcore_strong",
      locator = "locator2_nevybattle02_05"
    },
    {
      name = "enemy02f",
      type = "imp_strong",
      locator = "locator2_nevybattle02_06"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onSpawn = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
  end,
  onObjectDead = function(A0_26, A1_27)
    nevybattle_caption_flag = true
  end
}
function Initialize()
  local L0_28
  L0_28 = {
    {
      name = "npc_criminal",
      type = "man80",
      node = "locator2_criminal_01",
      active = false
    }
  }
  Fn_setupNpc(L0_28)
  for _FORV_4_, _FORV_5_ in pairs(L0_28) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  if Fn_getMissionPart() == "sm41_b" then
    Fn_setNpcActive("npc_criminal", true)
    Fn_warpNpc("npc_criminal", "locator2_criminal_02")
    Fn_playMotionNpc("npc_criminal", "check", false)
    sm41_createCriminalShip()
  end
  while true do
    wait()
  end
end
function Finalize()
  local L0_29, L1_30
end
function sm44_findGameObject2(A0_31, A1_32)
  return findGameObject2(A0_31, A1_32)
end
function sm41_spawnEnemy(A0_33)
  if (nevybattle_spawn[A0_33] == nil or not nevybattle_spawn[A0_33]) and findGameObject2("EnemyGenerator", A0_33) ~= nil then
    findGameObject2("EnemyGenerator", A0_33):requestSpawn()
    findGameObject2("EnemyGenerator", A0_33):requestIdlingEnemy(true)
    nevybattle_spawn[A0_33] = true
  end
end
function sm41_requestIdlingEnemy(A0_34, A1_35)
  if findGameObject2("EnemyGenerator", A0_34) ~= nil then
    findGameObject2("EnemyGenerator", A0_34):requestIdlingEnemy(A1_35)
  end
end
function sm41_getEnemyCount(A0_36)
  for _FORV_6_, _FORV_7_ in pairs(enmgen2_nevybattle_02_02.spawnSet) do
  end
  return 0 + 1
end
function sm41_setAutoRevirthSwitch(A0_37, A1_38)
  if findGameObject2("EnemyGenerator", A0_37) ~= nil then
    findGameObject2("EnemyGenerator", A0_37):setAutoRevirthSwitch(A1_38)
  end
end
function sm41_setEnemyMarker(A0_39, A1_40)
  if findGameObject2("EnemyGenerator", A0_39) ~= nil then
    findGameObject2("EnemyGenerator", A0_39):setEnemyMarker(A1_40)
  end
end
function sm41_getNevyCaptionFlag()
  local L0_41, L1_42
  L0_41 = nevybattle_caption_flag
  return L0_41
end
function sm41_clearNevyCaptionFlag()
  local L0_43, L1_44
  nevybattle_caption_flag = false
end
function sm41_createHaze()
  local L0_45
  L0_45 = haze_tbl
  L0_45 = #L0_45
  if L0_45 == 0 then
    L0_45 = 1
    while findGameObject2("Node", "locator2_haze2_" .. string.format("%02d", L0_45)) ~= nil do
      haze_tbl[L0_45] = RAC_createEffect({
        eff_name = "ef_ev_smk_bk",
        parent_hdl = findGameObject2("Node", "locator2_haze2_" .. string.format("%02d", L0_45)),
        loop = true
      })
      do break end
      do break end
      L0_45 = L0_45 + 1
    end
    for _FORV_4_, _FORV_5_ in pairs(haze_tbl) do
      _FORV_5_.eff_task:setActive(true)
    end
  end
end
function sm41_alphaOutHaze()
  local L0_46, L1_47, L2_48, L3_49, L4_50
  for L3_49, L4_50 in L0_46(L1_47) do
    invokeTask(function()
      L4_50.eff_task:setAlpha(false, 3, 10)
      L4_50.eff_task:setVisible(false)
    end)
    break
  end
end
function sm41_releaseHaze()
  local L0_51, L1_52, L2_53, L3_54, L4_55
  for L3_54 = 1, #L1_52 do
    L4_55 = haze_tbl
    L4_55 = L4_55[L3_54]
    if L4_55 ~= nil then
      L4_55 = haze_tbl
      L4_55 = L4_55[L3_54]
      invokeTask(function()
        L4_55:abort()
      end)
    else
    end
  end
  haze_tbl = L0_51
end
function sm41_createCriminalShip()
  if _script_ship.ship == nil then
    _script_ship.pos_route_tbl = {
      findGameObject2("Node", "locator2_criminal_ship"):getWorldPos(),
      findGameObject2("Node", "locator2_criminal_ship_dummy"):getWorldPos()
    }
    _script_ship.ship, _script_ship.route_object = CreateScriptVehicle(_script_ship.pos_route_tbl, "ForSm41Ship", "ship_01")
    _script_ship.ship:setWorldTransform(findGameObject2("Node", "locator2_criminal_ship"):getWorldTransform())
    _script_ship.ship:setBaseSpeed(0)
  end
end
function sm41_deleteCriminalShip()
  if _script_ship.ship ~= nil then
    _script_ship.ship:try_term()
    _script_ship.ship = nil
    _script_ship.pos_route_tbl = nil
    _script_ship.route_object = nil
  end
end
function sm41_findGameObject2(A0_56, A1_57)
  return findGameObject2(A0_56, A1_57)
end
function CreateScriptVehicle(A0_58, A1_59, A2_60)
  local L3_61, L4_62
  L3_61 = Vehicle
  L4_62 = L3_61
  L3_61 = L3_61.spawnRoute
  L3_61 = L3_61(L4_62, A0_58, g_own)
  L4_62 = Vehicle
  L4_62 = L4_62.spawnVehicle
  L4_62 = L4_62(L4_62, A1_59, g_own)
  L4_62:setName(A2_60)
  L4_62:setMomentRate(0)
  L4_62:setBaseSpeed(0)
  L4_62:procFloat(false)
  Vehicle:attach(L3_61, L4_62)
  return L4_62, L3_61
end
