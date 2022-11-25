dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
mine_name = "sm28_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
sm28_broken_ore = {}
sm28_obj_sensor = {
  false,
  false,
  false,
  false,
  false,
  false
}
sm28_obj_talk = {
  false,
  false,
  false,
  false,
  false,
  false
}
sm28_stop_area_warp = false
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_03_01",
      name = "03_01"
    },
    {
      type = "treecannon_strong",
      locator = "locator_03_02",
      name = "03_02"
    }
  }
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator_04_01",
      name = "04_01"
    },
    {
      type = "imp_strong",
      locator = "locator_04_02",
      name = "04_02"
    }
  }
}
enmgen2_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lasercannon_strong",
      locator = "locator_05_01",
      name = "05_01"
    },
    {
      type = "gellyfish",
      locator = "locator_05_02",
      name = "05_02"
    }
  }
}
enmgen2_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_06_01",
      name = "06_01"
    },
    {
      type = "gellyfish",
      locator = "locator_06_02",
      name = "06_02"
    }
  }
}
enmgen2_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_07_01",
      name = "07_01"
    },
    {
      type = "gellyfish",
      locator = "locator_07_02",
      name = "07_02"
    }
  }
}
enmgen2_camera05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_camera05_01",
      name = "camera05_01"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {
      "camera05_01"
    }, 1, GEM_SPECIAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
function Initialize()
  Fn_sendBulkMineSetupRun(mine_name, _gravityOre, _addGravityOre)
  Fn_sendMineSetupCallBrokenGravityOre("onOreBroken")
  RAC_startCatWarpControl("sm28_area_out", "pccubesensor2_area_out_near", "pccubesensor2_area_out_middle", "pccubesensor2_area_out_long", "locator2_area_out_center", nil, "locator2_area_out_center", "sm28_09000")
  RAC_createGemAsync("camera01_gem", GEM_ENERGY, "locator2_camera01_gem")
  repeat
    wait()
  until Fn_sendIsRunMine()
end
function Ingame()
  local L0_4
  L0_4 = 1
  while findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)) ~= nil do
    findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)):setVisibleBlockEnable(false)
    findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)):setIgnoreGrab(true)
    findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)):setMoveThreshold(0)
    findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)):setEventListener("judge", judge_callback)
    findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)):setEventListener("dynamic", function(A0_5)
      A0_5:getDynamicObject():setEventListener("judge", judege_callback)
    end)
    findGameObject2("GimmickBg", "bg2_obj_" .. string.format("%02d", L0_4)):setEventListener("broken", function(A0_6)
      print("object broken = " .. A0_6:getName())
    end)
    L0_4 = L0_4 + 1
  end
  while true do
    wait()
  end
end
function Finalize()
  if Fn_getPlayer() then
    Player:setTargetingPriority(Player.kTargetingPrio_Default)
  end
end
function onOreBroken(A0_7)
  print("Break Ore.." .. A0_7:getName() .. "(" .. A0_7:getTypeName() .. ")")
  sm28_broken_ore[A0_7:getName()] = A0_7
end
function pccubesensor2_obj_OnEnter(A0_8)
  sm28_obj_sensor[RAC_getTailNumber(A0_8:getName(), 2)] = true
end
function pccubesensor2_obj_OnLeave(A0_9)
  sm28_obj_sensor[RAC_getTailNumber(A0_9:getName(), 2)] = false
end
function sm28_findGameObject2(A0_10, A1_11)
  return findGameObject2(A0_10, A1_11)
end
function sm28_naviSet(A0_12)
  local L1_13
  L1_13 = Fn_naviSet
  L1_13(findGameObject2("Node", A0_12))
end
function sm28_isOreBroken(A0_14)
  local L1_15
  L1_15 = sm28_broken_ore
  L1_15 = L1_15[A0_14]
  if L1_15 ~= nil then
    L1_15 = true
    return L1_15
  end
  L1_15 = false
  return L1_15
end
function sm28_getOreBroken()
  for _FORV_4_ in pairs(sm28_broken_ore) do
  end
  return 0 + 1
end
function sm28_requestRestoreForce()
  for _FORV_3_, _FORV_4_ in pairs(sm28_broken_ore) do
    _FORV_4_:requestRestoreForce()
  end
  sm28_broken_ore = {}
end
function sm28_spawnEnemy()
  local L0_16, L1_17, L2_18, L3_19
  for L3_19 = 1, 11 do
    if findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", L3_19)) ~= nil and L3_19 ~= 7 then
      print("........." .. findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", L3_19)):getName())
      findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", L3_19)):requestSpawn()
      findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", L3_19)):requestIdlingEnemy(false)
    end
  end
end
function sm28_spawnIndexEnemy(A0_20)
  if findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", A0_20)) ~= nil then
    print("........." .. findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", A0_20)):getName())
    findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", A0_20)):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2_" .. string.format("%02d", A0_20)):requestIdlingEnemy(false)
  end
end
function sm28_getEnemyCount(A0_21)
  if findGameObject2("EnemyGenerator", A0_21) ~= nil then
    return findGameObject2("EnemyGenerator", A0_21):getEnemyCount()
  end
  return 0
end
function sm28_checkObjectTalk()
  if Player:getAction() == Player.kAction_Idle then
    for _FORV_3_ = 1, #sm28_obj_talk do
      if not sm28_obj_talk[_FORV_3_] and sm28_obj_sensor[_FORV_3_] then
        return _FORV_3_
      end
    end
  end
  return _FOR_
end
function sm28_setObjectTalked(A0_22)
  sm28_obj_talk[A0_22] = true
end
function sm28_resetObjectTalked(A0_23)
  sm28_obj_talk[A0_23] = false
end
function sm28_isObjectTalked(A0_24)
  return sm28_obj_talk[A0_24]
end
function sm28_isObjectAllTalkedWithoutBed()
  local L0_25, L1_26, L3_27, L4_28, L5_29
  L0_25 = 0
  for L5_29 = 1, #L3_27 do
    if L5_29 ~= 3 and sm28_obj_talk[L5_29] == true then
      L0_25 = L0_25 + 1
    end
  end
  L1_26 = L0_25 >= 5
  return L1_26
end
function sm28_setStopAreaWarp(A0_30)
  sm28_stop_area_warp = A0_30
  RAC_stopCatWarpControl("sm28_area_out", sm28_stop_area_warp)
end
function sm28_isStopAreaWarp()
  local L0_31, L1_32
  L0_31 = sm28_stop_area_warp
  return L0_31
end
function judge_callback(A0_33, A1_34, A2_35, A3_36)
  print("judge:" .. A1_34 .. "=" .. A2_35)
  if A3_36:getName() ~= nil then
    print("  sender:" .. A3_36:getName())
  else
    print("  sender: not named")
  end
  return 0
end
