dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep10_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
sdemo = nil
_puppet_crow = nil
_brain_crow = nil
_life_gem_max = 5
_sis_cid_initial_position = true
_enmgen_battle = nil
_puppet_tbl = {}
_next_phase = false
_sdemo_cut02 = nil
_chara_table = {}
enmgen2_battle_soldier = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_01_26",
      name = "soldier01_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_01_27",
      name = "soldier01_02"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_01_28",
      name = "soldier01_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_01_29",
      name = "soldier01_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_01_30",
      name = "soldier01_05"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_01_31",
      name = "soldier01_06"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_01_32",
      name = "soldier01_07"
    },
    {
      type = "officer_rifle",
      locator = "locator2_01_33",
      name = "soldier01_08"
    },
    {
      type = "officer_rifle",
      locator = "locator2_01_34",
      name = "soldier01_09"
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
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end,
  getEnemyName = function(A0_16, A1_17)
    local L2_18
    L2_18 = A0_16.spawnSet
    L2_18 = L2_18[A1_17]
    L2_18 = L2_18.name
    return L2_18
  end
}
enmgen2_battle_soldier2 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_02_01",
      name = "soldier02_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_02_02",
      name = "soldier02_02"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_02_03",
      name = "soldier02_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_02_04",
      name = "soldier02_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_02_05",
      name = "soldier02_05"
    },
    {
      type = "mechsmall",
      locator = "locator2_soldier_02_06",
      name = "mechsmall01"
    },
    {
      type = "officer_launcher",
      locator = "locator2_soldier_02_06",
      name = "soldier02_06",
      target_vehicle = "mechsmall01"
    },
    {
      type = "mechsmall",
      locator = "locator2_soldier_02_07",
      name = "mechsmall02"
    },
    {
      type = "officer_launcher",
      locator = "locator2_soldier_02_07",
      name = "soldier02_07",
      target_vehicle = "mechsmall02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_02_08",
      name = "soldier02_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_02_09",
      name = "soldier02_09"
    }
  },
  onUpdate = function(A0_19)
    local L1_20
  end,
  onEnter = function(A0_21)
    local L1_22
  end,
  onLeave = function(A0_23)
    local L1_24
  end,
  onObjectDead = function(A0_25, A1_26)
  end,
  onObjectAsh = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_29)
    return #A0_29.spawnSet
  end,
  getEnemyDeadNum = function(A0_30)
    local L1_31
    L1_31 = A0_30.enemyDeadNum
    return L1_31
  end,
  getEnemyName = function(A0_32, A1_33)
    local L2_34
    L2_34 = A0_32.spawnSet
    L2_34 = L2_34[A1_33]
    L2_34 = L2_34.name
    return L2_34
  end,
  getEnemyName = function(A0_35, A1_36)
    local L2_37
    L2_37 = A0_35.spawnSet
    L2_37 = L2_37[A1_36]
    L2_37 = L2_37.name
    return L2_37
  end
}
enmgen2_battle_soldier3 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "officer_launcher",
      locator = "locator2_soldier_03_01",
      name = "soldier03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_03_02",
      name = "soldier03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_03_03",
      name = "soldier03_03"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_03_04",
      name = "soldier03_04"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_03_05",
      name = "soldier03_05"
    }
  },
  onUpdate = function(A0_38)
    local L1_39
  end,
  onEnter = function(A0_40)
    local L1_41
  end,
  onLeave = function(A0_42)
    local L1_43
  end,
  onObjectDead = function(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
    A0_46:getSpecTable().enemyDeadNum = A0_46:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_48)
    return #A0_48.spawnSet
  end,
  getEnemyDeadNum = function(A0_49)
    local L1_50
    L1_50 = A0_49.enemyDeadNum
    return L1_50
  end,
  getEnemyName = function(A0_51, A1_52)
    local L2_53
    L2_53 = A0_51.spawnSet
    L2_53 = L2_53[A1_52]
    L2_53 = L2_53.name
    return L2_53
  end,
  getEnemyName = function(A0_54, A1_55)
    local L2_56
    L2_56 = A0_54.spawnSet
    L2_56 = L2_56[A1_55]
    L2_56 = L2_56.name
    return L2_56
  end
}
enmgen2_battle_soldier4 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_04_01",
      name = "soldier04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_04_02",
      name = "soldier04_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_soldier_04_03",
      name = "soldier04_03"
    },
    {
      type = "officer_rifle",
      locator = "locator2_soldier_04_04",
      name = "soldier04_04"
    },
    {
      type = "officer_launcher",
      locator = "locator2_soldier_04_05",
      name = "soldier04_05"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_04_06",
      name = "soldier04_06"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_04_07",
      name = "soldier04_07"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_04_08",
      name = "soldier04_08"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_soldier_04_09",
      name = "soldier04_09"
    }
  },
  onUpdate = function(A0_57)
    local L1_58
  end,
  onEnter = function(A0_59)
    local L1_60
  end,
  onLeave = function(A0_61)
    local L1_62
  end,
  onObjectDead = function(A0_63, A1_64)
  end,
  onObjectAsh = function(A0_65, A1_66)
    A0_65:getSpecTable().enemyDeadNum = A0_65:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_67)
    return #A0_67.spawnSet
  end,
  getEnemyDeadNum = function(A0_68)
    local L1_69
    L1_69 = A0_68.enemyDeadNum
    return L1_69
  end,
  getEnemyName = function(A0_70, A1_71)
    local L2_72
    L2_72 = A0_70.spawnSet
    L2_72 = L2_72[A1_71]
    L2_72 = L2_72.name
    return L2_72
  end,
  getEnemyName = function(A0_73, A1_74)
    local L2_75
    L2_75 = A0_73.spawnSet
    L2_75 = L2_75[A1_74]
    L2_75 = L2_75.name
    return L2_75
  end
}
function Initialize()
  local L0_76, L1_77, L2_78, L3_79, L4_80
  L0_76()
  L1_77.name = "sis01"
  L1_77.type = "sis01"
  L1_77.node = "locator2_sis_01"
  L1_77.anim_name = "afraid_00"
  L1_77.attach = false
  L2_78.name = "cid01"
  L2_78.type = "cid01"
  L2_78.node = "locator2_cid_01"
  L2_78.anim_name = "afraid_protect_00"
  L2_78.attach = false
  _chara_table = L0_76
  for L3_79 = 1, _life_gem_max do
    L4_80 = findGameObject2
    L4_80 = L4_80("Node", "locator2_life_gem_" .. string.format("%02d", L3_79))
    createGem(L4_80, 5)
  end
  enmgen = L0_76
  enmgen2 = L0_76
  enmgen3 = L0_76
  enmgen4 = L0_76
  L3_79 = enmgen3
  L4_80 = enmgen4
  L0_76(L1_77, L2_78, L3_79, L4_80)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  L0_76(L1_77, L2_78)
  _sdemo_cut02 = L0_76
end
function Ingame()
  local L0_81, L1_82, L2_83, L3_84, L4_85
  L0_81 = setVeCreanAreaGroup
  L0_81()
  L0_81 = Fn_disappearNpc
  L1_82 = "ep10_crow"
  L2_83 = 0
  L0_81(L1_82, L2_83)
  L0_81 = Fn_setNpcVisible
  L1_82 = "ep10_crow"
  L2_83 = false
  L0_81(L1_82, L2_83)
  L0_81 = Fn_setBgmPoint
  L1_82 = "battle"
  L0_81(L1_82)
  L0_81 = Fn_setBgmPoint
  L1_82 = "battle"
  L0_81(L1_82)
  L0_81 = Sound
  L1_82 = L0_81
  L0_81 = L0_81.playSEHandle
  L2_83 = "ep10_siren"
  L3_84 = 1
  L0_81 = L0_81(L1_82, L2_83, L3_84)
  _handle = L0_81
  L0_81 = Fn_coercionPoseBattle
  L0_81()
  L0_81 = enmgen
  L1_82 = L0_81
  L0_81 = L0_81.requestSpawn
  L0_81(L1_82)
  L0_81 = Vector
  L1_82 = -203.425537
  L2_83 = 986.46814
  L3_84 = -25.383646
  L0_81 = L0_81(L1_82, L2_83, L3_84)
  L1_82 = Vector
  L2_83 = -202.868103
  L3_84 = 987.183472
  L4_85 = -24.959187
  L1_82 = L1_82(L2_83, L3_84, L4_85)
  L2_83 = _sdemo_cut02
  L3_84 = L2_83
  L2_83 = L2_83.set
  L4_85 = L0_81
  L2_83(L3_84, L4_85, L1_82)
  L2_83 = {L3_84}
  L3_84 = {}
  L4_85 = Vector
  L4_85 = L4_85(-202.630661, 986.405212, -24.778296)
  L3_84.pos = L4_85
  L3_84.time = 2
  L3_84 = _sdemo_cut02
  L4_85 = L3_84
  L3_84 = L3_84.play
  L3_84(L4_85, nil, L2_83)
  L3_84 = _sdemo_cut02
  L4_85 = L3_84
  L3_84 = L3_84.setCameraParam
  L3_84(L4_85, nil, 0.1, {deg = 50})
  L3_84 = Fn_getPlayer
  L3_84 = L3_84()
  L4_85 = L3_84.setVisible
  L4_85(L3_84, false)
  L4_85 = invokeTask
  L4_85(function()
    wait()
    Fn_resetPcPos("locator2_pc_start_pos")
  end)
  L4_85 = findGameObject2
  L4_85 = L4_85("Puppet", "sis01")
  if L4_85 then
    L4_85 = Fn_disappearNpc
    L4_85("sis01")
  end
  L4_85 = findGameObject2
  L4_85 = L4_85("Puppet", "cid01")
  if L4_85 then
    L4_85 = Fn_disappearNpc
    L4_85("cid01")
  end
  L4_85 = Fn_setupNpc
  L4_85(_chara_table)
  L4_85 = Fn_spawnSuppotCrow
  L4_85 = L4_85(false, Supporter.FirstAction.Ground)
  _puppet_crow = L4_85
  L4_85 = _puppet_crow
  L4_85 = L4_85.getBrain
  L4_85 = L4_85(L4_85)
  _brain_crow = L4_85
  L4_85 = _puppet_crow
  L4_85 = L4_85.setWorldTransform
  L4_85(L4_85, findGameObject2("Node", "locator2_crow_pos"):getWorldTransform())
  L4_85 = _puppet_crow
  L4_85 = L4_85.setForceMove
  L4_85(L4_85)
  L4_85 = _brain_crow
  L4_85 = L4_85.setIdling
  L4_85(L4_85, true)
  L4_85 = Fn_missionStart
  L4_85()
  L4_85 = invokeTask
  L4_85(function()
    _sdemo_cut02:zoomOut(4, {deg = 55}, "easeInOut")
  end)
  L4_85 = Fn_captionView
  L4_85("ep10_01004")
  L4_85 = invokeTask
  L4_85(function()
    L3_84:setVisible(true)
    enmgen2:requestSpawn()
    enmgen3:requestSpawn()
    enmgen4:requestSpawn()
  end)
  L4_85 = wait
  L4_85(90)
  function L4_85()
    Fn_resetPcPos("locator2_pc_reset_pos")
  end
  Fn_kaiwaDemoView2("ep10_00180k", L4_85, true)
  Camera:lookTo(findGameObject2("Puppet", "soldier01_09"):getWorldPos(), 0, 0)
  Player:setSituation(Player.kSituation_Normal, false, 0, false, false)
  _sdemo_cut02:stop(0)
  Fn_userCtrlOn()
  Fn_missionView("ep10_01001")
  _brain_crow:setIdling(false)
  enmgen:setEnemyMarker(true)
  enmgen2:setEnemyMarker(true)
  enmgen3:setEnemyMarker(true)
  enmgen4:setEnemyMarker(true)
  wait(20)
  enmgen:requestIdlingEnemy(false)
  enmgen2:requestIdlingEnemy(false)
  enmgen3:requestIdlingEnemy(false)
  enmgen4:requestIdlingEnemy(false)
  while not (20 < enmgen:getSpecTable().enemyDeadNum + enmgen2:getSpecTable().enemyDeadNum + enmgen3:getSpecTable().enemyDeadNum + enmgen4:getSpecTable().enemyDeadNum) do
    wait()
  end
  Fn_captionViewWait("ep10_01002", 5)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _handle then
    Sound:stopSEHandle(_handle)
    _handle = nil
  end
  returnVeCreanAreaGroup()
end
function pccubesensor2_ep10d_area_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionView("ep10_01013")
  end)
end
function ep10c_sdemo_02()
  local L0_86, L1_87
end
