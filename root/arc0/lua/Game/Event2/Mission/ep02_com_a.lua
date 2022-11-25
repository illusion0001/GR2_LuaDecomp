dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
_request = {}
_requestId = 0
_requestResult = {}
_MAX_REQUEST_ID = 999
_MISSION_PART_C = 1
_MISSION_PART_D = 2
_MISSION_PART_E = 3
_MISSION_PART_F = 4
_missionPart = {}
_missionPart.ep02_c = _MISSION_PART_C
_missionPart.ep02_d = _MISSION_PART_D
_missionPart.ep02_e = _MISSION_PART_E
_missionPart.ep02_f = _MISSION_PART_F
_next_phase = false
_enemy_counter_enable = false
mine_name = "ep02_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_quota = {}
_QUOTA_TUTORIAL = 7
_islandNames = {
  "pi_a_01",
  "pi_a_03_01",
  "pi_a_03_02",
  "pi_a_03_03",
  "pi_a_06_01",
  "pi_a_06_02",
  "pi_a_06_04",
  "pi_a_09_02",
  "pi_a_10",
  "pi_a_11",
  "pi_a_13",
  "pi_a_16_01",
  "pi_a_16_02",
  "pi_a_16_03",
  "pi_a_25"
}
_break_count = {}
_MAX_GEM_COUNT = 999
_preciousGemCount = 0
_isCraneMoveEnd = false
_INIT_COUNTER_TIMER = 180
_multiNaviEnable = false
_miningTimer = nil
_kitMotionTable = {
  motion1 = "kit01_blushing_00",
  motion2 = "kit01_greeting_00",
  motion3 = "kit01_landing_00",
  motion4 = "kit01_stay_00"
}
_eventFlag = {}
_eventFlag.request_misai_warp = false
_eventFlag.sdemo1_ready = false
_eventFlag.misai_warp_ready = false
_eventFlag.ep02_00140k_done = false
_eventFlag.enemy_f1_ready = false
_eventFlag.enemy_g1_ready = false
_eventFlag.sdemo2_ready = false
_eventFlag.ep02_d_battle_ended = false
_MISAI_CHEER_WAIT = 450
_miner_caption_enable = true
_cheer_enable = false
_tkgMotions = {
  idle_00 = "tkg05_idle_00",
  watching_00 = "tkg05_watching_00",
  wow_00 = "tkg05_wow_00",
  reply_yes = "tkg05_reply_yes_00",
  reply_no = "tkg05_reply_no_00"
}
_misaiMotions = {
  edgy_00 = "tkg05_edgy_00",
  idle_00 = "tkg05_idle_00",
  cheer_00 = "tkg05_cheer_00",
  jealousy_00 = "tkg05_jealousy_00",
  watching_00 = "tkg05_watching_00",
  wow_00 = "tkg05_wow_00",
  hurryup_00 = "tkg05_hurryup_00",
  reply_yes = "tkg05_reply_yes_00",
  reply_no = "tkg05_reply_no_00"
}
_enemy_wave = 1
_wave4Start = false
_wave5Start = false
_enemy_count = 0
_total_enemy_count = 0
enmgen2_battle_f_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_f1_01",
      name = "wave1_01"
    },
    {
      type = "stalker",
      locator = "locator_f1_02",
      name = "wave1_02"
    },
    {
      type = "runner",
      locator = "locator_f1_03",
      name = "wave1_03"
    },
    {
      type = "stalker",
      locator = "locator_f1_04",
      name = "wave1_04"
    }
  },
  deadEnemies = 0,
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
    _enemy_count = _enemy_count + 1
  end,
  onObjectAsh = function(A0_8, A1_9)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
    A0_8:getSpecTable().deadEnemies = A0_8:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
    if A1_9:getName() == "wave1_03" and findGameObject2("EnemyGenerator", "enmgen2_f_02") ~= nil then
      _enemy_wave = 2
      findGameObject2("EnemyGenerator", "enmgen2_f_02"):requestSpawn()
      findGameObject2("EnemyGenerator", "enmgen2_f_02"):requestIdlingEnemy(false)
    end
    _cheer_enable = true
  end,
  onObjectDead = function(A0_10, A1_11)
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {"wave1_03"}, 1, _GEM.VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_battle_f_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_f2_01",
      name = "wave2_01"
    },
    {
      type = "gellyfish",
      locator = "locator_f2_02",
      name = "wave2_02"
    },
    {
      type = "gellyfish",
      locator = "locator_f2_03",
      name = "wave2_03"
    }
  },
  deadEnemies = 0,
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
    _enemy_count = _enemy_count + 1
  end,
  onObjectAsh = function(A0_24, A1_25)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
    _enemy_wave = 3
    A0_24:getSpecTable().deadEnemies = A0_24:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
    _cheer_enable = true
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {
      "wave2_01",
      "wave2_02",
      "wave2_03"
    }, 3, _GEM.VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
enmgen2_battle_f_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_f4_01",
      name = "wave4_01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_32)
    local L1_33
  end,
  onEnter = function(A0_34)
    local L1_35
  end,
  onLeave = function(A0_36)
    local L1_37
  end,
  onSpawn = function(A0_38, A1_39)
    _enemy_count = _enemy_count + 1
  end,
  onObjectAsh = function(A0_40, A1_41)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
    print("Guardcore Ash")
    A0_40:getSpecTable().deadEnemies = A0_40:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
    _cheer_enable = true
  end,
  onObjectDead = function(A0_42, A1_43)
    print("Guardcore Dead")
  end
}
enmgen2_battle_f_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "giant_weak",
      locator = "locator_f5_01",
      name = "wave5_01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_44)
    local L1_45
  end,
  onEnter = function(A0_46)
    local L1_47
  end,
  onLeave = function(A0_48)
    local L1_49
  end,
  onSpawn = function(A0_50, A1_51)
    _enemy_count = _enemy_count + 1
  end,
  onObjectAsh = function(A0_52, A1_53)
    GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
    HUD:counter999SubNum()
  end,
  onObjectDead = function(A0_54, A1_55)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
    A0_54:getSpecTable().deadEnemies = A0_54:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
    _cheer_enable = true
  end
}
function getMaxEnemies(A0_56)
  return #A0_56:getSpecTable().spawnSet
end
function getDeadEnemies(A0_57)
  return A0_57:getSpecTable().deadEnemies
end
function getLeftEnemies(A0_58)
  return getMaxEnemies(A0_58) - getDeadEnemies(A0_58)
end
function getEnemyName(A0_59, A1_60)
  return A0_59:getSpecTable().spawnSet[A1_60].name
end
function resetDeadCount(A0_61)
  A0_61:getSpecTable().deadEnemies = 0
end
function Initialize()
  local L0_62, L1_63, L2_64, L3_65, L4_66
  L0_62 = Fn_loadPlayerMotion
  L0_62(L1_63)
  L0_62 = Fn_sendBulkMineSetupRun
  L0_62(L1_63, L2_64, L3_65)
  repeat
    L0_62 = wait
    L0_62()
    L0_62 = Fn_sendIsRunMine
    L0_62 = L0_62()
  until L0_62
  L0_62 = Fn_sendMineSetupCallBrokenGravityOre
  L0_62(L1_63)
  L0_62 = breakCountInit
  L0_62()
  L0_62 = HUD
  L0_62 = L0_62.counter999SetIcon
  L0_62(L1_63, L2_64)
  L0_62 = HUD
  L0_62 = L0_62.counter999SetTextID
  L0_62(L1_63, L2_64)
  L0_62 = setCounterVisible
  L0_62(L1_63)
  L0_62 = Fn_sendMineSetupCallOnPreciousGemGet
  L0_62(L1_63)
  L0_62 = Fn_sendSetOtherPreciousGemCount
  L0_62(L1_63, L2_64)
  L0_62 = GlobalGem
  L0_62 = L0_62.SetVitalGemGetCallback
  L0_62(L1_63, L2_64)
  L0_62 = _quota
  L0_62.pi_a_16_01 = 11
  L0_62 = _quota
  L0_62.pi_a_06_02 = 4
  L0_62 = _quota
  L0_62.pi_a_03_03 = 8
  L0_62 = _quota
  L0_62.pi_a_06_01 = 5
  L0_62 = Fn_getMissionPart
  L0_62 = L0_62()
  _npc_tkg01 = "npcgen2_tkg01_01"
  _npc_tkg02 = "npcgen2_tkg01_02"
  _npc_tkg03 = "npcgen2_tkg01_03"
  _npc_tkg04 = "npcgen2_tkg01_04"
  _npc_tkg04b = "npcgen2_tkg01_04b"
  _npc_tkg05 = "npcgen2_tkg01_05"
  _npc_tkg06 = "npcgen2_tkg01_06"
  _npc_tkg07 = "npcgen2_tkg01_07"
  _npc_tkg08 = "npcgen2_tkg01_08"
  _npc_tkg09 = "npcgen2_tkg01_09"
  _npc_tkg10 = "npcgen2_tkg01_10"
  _npc_tkg31 = "npcgen2_tkg01_31"
  _npc_tkg32 = "npcgen2_tkg01_32"
  _npc_tkg33 = "npcgen2_tkg01_33"
  _npc_misai = "npcgen2_misai_01"
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  L1_63(L2_64, L3_65)
  sdemo1 = L1_63
  sdemo2 = L1_63
  sdemo3 = L1_63
  sdemo4 = L1_63
  sdemo5 = L1_63
  sdemo6 = L1_63
  sdemo7 = L1_63
  if L0_62 == "ep02_d" then
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
  elseif L0_62 == "ep02_e" or L0_62 == "ep02_f" or L0_62 == "ep02_g" then
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
    L1_63(L2_64, L3_65)
  end
  L1_63(L2_64, L3_65)
  for L4_66 = 1, 5 do
    findGameObject2("Gem", string.format("gem2_vital_%d", L4_66)):setActive(false)
  end
end
function Ingame()
  Fn_setCrewActive(false)
  Fn_setMineGravityStorm()
  dispatchTask = invokeTask(function()
    while true do
      dispatchRequestTask()
      wait()
    end
  end)
  while true do
    wait()
  end
end
function ingamePartC(A0_67)
  local L1_68
  L1_68 = {}
  L1_68[1] = partC_1
  L1_68[2] = partC_2
  L1_68[3] = partC_3
  L1_68[4] = partC_4
  L1_68[5] = partC_5
  L1_68[6] = partC_6
  L1_68[7] = partC_7
  L1_68[8] = partC_8
  L1_68[A0_67[1]]()
  _next_phase = true
end
function ingamePartD(A0_69)
  local L1_70
  L1_70 = {}
  L1_70[1] = partD_1
  L1_70[2] = partD_2
  L1_70[3] = partD_3
  L1_70[4] = partD_4
  _next_phase = false
  L1_70[A0_69[1]]()
  _next_phase = true
end
function ingamePartE(A0_71)
  local L1_72
  L1_72 = {}
  L1_72[1] = partE_1
  L1_72[2] = partE_2
  L1_72[3] = partE_3
  L1_72[4] = partE_4
  L1_72[5] = partE_5
  _next_phase = false
  L1_72[A0_71[1]]()
  _next_phase = true
end
function ingamePartF(A0_73)
  local L1_74
  L1_74 = {}
  L1_74[1] = partF_1
  L1_74[2] = partF_2
  L1_74[3] = partF_3
  _next_phase = false
  L1_74[A0_73[1]]()
  _next_phase = true
end
function ingamePartG(A0_75)
  local L1_76
  L1_76 = {}
  L1_76[1] = partG_1
  L1_76[2] = partG_2
  L1_76[3] = partG_3
  _next_phase = false
  L1_76[A0_75[1]]()
  _next_phase = true
end
function partC_1()
  local L0_77, L1_78, L2_79, L3_80, L4_81
  L0_77 = Fn_setNpcVisible
  L1_78 = _npc_tkg04b
  L2_79 = false
  L0_77(L1_78, L2_79)
  L0_77 = Fn_setNpcVisible
  L1_78 = _npc_tkg08
  L2_79 = false
  L0_77(L1_78, L2_79)
  L0_77 = Fn_setNpcVisible
  L1_78 = _npc_tkg09
  L2_79 = false
  L0_77(L1_78, L2_79)
  L0_77 = Fn_setNpcVisible
  L1_78 = _npc_tkg10
  L2_79 = false
  L0_77(L1_78, L2_79)
  _next_phase = false
  L0_77 = Fn_cageStop
  L0_77()
  L0_77 = Area
  L1_78 = L0_77
  L0_77 = L0_77.setSceneParametersInterpolateTime
  L2_79 = 0.01
  L0_77(L1_78, L2_79)
  L0_77 = Area
  L1_78 = L0_77
  L0_77 = L0_77.setForceSceneParams
  L0_77(L1_78)
  L0_77 = Fn_setCagePos
  L1_78 = 30
  L2_79 = true
  L0_77(L1_78, L2_79)
  L0_77 = Fn_setInvisibleColltion
  L1_78 = true
  L0_77(L1_78)
  L0_77 = Fn_getCageHandle
  L0_77 = L0_77()
  L2_79 = L0_77
  L1_78 = L0_77.getWorldTransform
  L2_79 = L1_78(L2_79)
  L3_80 = createGameObject2
  L4_81 = "Node"
  L3_80 = L3_80(L4_81)
  L4_81 = createGameObject2
  L4_81 = L4_81("Node")
  L3_80:setName("cage_kit_pos")
  L4_81:setName("cage_miz_pos")
  L3_80:try_init()
  L4_81:try_init()
  L3_80:waitForReady()
  L4_81:waitForReady()
  L3_80:try_start()
  L4_81:try_start()
  L0_77:appendChild(L3_80)
  L0_77:appendChild(L4_81)
  L3_80:setTransform(Vector(0.4, -4.3, 0.4), XYZRotQuatD(0, -90, 0))
  L4_81:setTransform(Vector(-0.6, -4.3, -0.4), XYZRotQuatD(0, -90, 0))
  L3_80:setForceMove()
  L4_81:setForceMove()
  Fn_resetPcPos(L3_80)
  Fn_warpNpc(_npc_tkg05, L4_81)
  L0_77:appendChild(Fn_findNpc(_npc_tkg05):getPuppet(), true)
  wait()
  Area:setSceneParametersInterpolateTime()
end
function partC_2()
  Fn_waitCageMoveEnd()
  Fn_findNpc(_npc_tkg05):appendChild(Fn_findNpc(_npc_tkg05):getPuppet(), true)
  _next_phase = false
  npcTkg01Action()
  npcTkg02Action()
  npcTkg03Action()
  npcTkg04Action()
  npcTkg04bAction()
  npcTkg05Action()
  npcTkg06Action()
  npcTkg07Action()
  Fn_userCtrlOff()
  _eventFlag.sdemo1_ready = true
  playSdemo1()
end
function partC_3()
  print("partC_3 BEGIN")
  _next_phase = false
  setCounterVisible(true)
  repeat
    wait()
  until getOreBrokenCount("pi_a_01") > _QUOTA_TUTORIAL
  _miner_caption_enable = false
  print("partC_3 END")
end
function partC_4()
  print("partC_4 BEGIN")
  _next_phase = false
  repeat
    wait()
  until _eventFlag.misai_warp_ready
  if _npc_tkg05_task ~= nil then
    _npc_tkg05_task:abort()
  end
  Fn_findNpc(_npc_tkg05):reset()
  repeat
    wait()
  until isOreBroken("gravityore_pi_a_01_04")
  print("partC_4 END")
end
function partC_5()
  print("partC_5 BEGIN")
  _next_phase = false
  setCounterVisible(false)
  playSdemo2()
  _npc_tkg05_task:abort()
  Fn_warpNpc(_npc_tkg05, "locator2_tkg01_05_01")
  npcTkg05Action()
  print("partC_5 END")
end
function partC_6()
  local L0_82, L1_83
  _next_phase = false
  L0_82 = Fn_setNpcVisible
  L1_83 = _npc_tkg31
  L0_82(L1_83, false)
  L0_82 = Fn_setNpcVisible
  L1_83 = _npc_tkg32
  L0_82(L1_83, false)
  L0_82 = Fn_setNpcVisible
  L1_83 = _npc_tkg33
  L0_82(L1_83, false)
  L0_82 = _npc_tkg01_task
  L1_83 = L0_82
  L0_82 = L0_82.abort
  L0_82(L1_83)
  L0_82 = _npc_tkg02_task
  L1_83 = L0_82
  L0_82 = L0_82.abort
  L0_82(L1_83)
  L0_82 = _npc_tkg06_task
  L1_83 = L0_82
  L0_82 = L0_82.abort
  L0_82(L1_83)
  L0_82 = Fn_disappearNpc
  L1_83 = _npc_tkg01
  L0_82(L1_83, nil)
  L0_82 = Fn_disappearNpc
  L1_83 = _npc_tkg02
  L0_82(L1_83, nil)
  L0_82 = Fn_disappearNpc
  L1_83 = _npc_tkg06
  L0_82(L1_83, nil)
  L0_82 = npcTkg08Action
  L0_82()
  L0_82 = npcTkg09Action
  L0_82()
  L0_82 = npcTkg10Action
  L0_82()
  _miner_caption_enable = true
  L0_82 = setCounterVisible
  L1_83 = true
  L0_82(L1_83)
  _phase_b = true
  L0_82 = "pi_a_16_01"
  L1_83 = {
    "gravityore_pi_a_16_01_01",
    "gravityore_pi_a_16_01_02",
    "gravityore_pi_a_16_01_03",
    "gravityore_pi_a_16_01_04",
    "gravityore_pi_a_16_01_05",
    "gravityore_pi_a_16_01_06",
    "gravityore_pi_a_16_01_07",
    "gravityore_pi_a_16_01_08",
    "gravityore_pi_a_16_01_09",
    "gravityore_pi_a_16_01_10",
    "gravityore_pi_a_16_01_11"
  }
  _miningTimer = LocalTimerClass.new()
  _miningTimer:setTime(0)
  _miningTimer:start()
  if waitToMine(L0_82, L1_83) then
    Fn_captionViewWait("ep02_02005")
  else
    Fn_captionViewWait("ep02_09014")
  end
end
function partC_7()
  local L0_84, L1_85
  L0_84 = "pi_a_06_02"
  L1_85 = {
    "gravityore_pi_a_16_02_01",
    "gravityore_pi_a_16_02_02",
    "gravityore_pi_a_16_02_03",
    "gravityore_pi_a_16_02_04",
    "gravityore_pi_a_16_02_05",
    "gravityore_pi_a_16_02_06",
    "gravityore_pi_a_16_02_07",
    "gravityore_pi_a_16_02_08",
    "gravityore_pi_a_16_02_09",
    "gravityore_pi_a_16_02_10",
    "gravityore_pi_a_16_02_11",
    "gravityore_pi_a_16_02_12",
    "gravityore_pi_a_16_02_13",
    "gravityore_pi_a_16_02_14",
    "gravityore_pi_a_16_02_15",
    "gravityore_pi_a_16_02_16",
    "gravityore_pi_a_16_02_17",
    "gravityore_pi_a_16_02_18",
    "gravityore_pi_a_16_02_19",
    "gravityore_pi_a_16_02_20"
  }
  waitToMine(L0_84, L1_85)
end
function partC_8()
  _miningTimer.task:abort()
  _miningTimer.task = nil
  _miningTimer = nil
  _npc_tkg03_task:abort()
  _npc_tkg04_task:abort()
  _npc_tkg04b_task:abort()
  _npc_tkg05_task:abort()
  _npc_tkg07_task:abort()
  _npc_tkg08_task:abort()
  _npc_tkg09_task:abort()
  _npc_tkg10_task:abort()
  Fn_disappearNpc(_npc_tkg03, nil)
  Fn_disappearNpc(_npc_tkg04, nil)
  Fn_disappearNpc(_npc_tkg04b, nil)
  Fn_disappearNpc(_npc_tkg05, nil)
  Fn_disappearNpc(_npc_tkg07, nil)
  Fn_disappearNpc(_npc_tkg08, nil)
  Fn_disappearNpc(_npc_tkg09, nil)
  Fn_disappearNpc(_npc_tkg10, nil)
end
function partD_1()
  local L0_86, L1_87, L2_88, L3_89
  _next_phase = false
  L0_86()
  L0_86(L1_87)
  for L3_89 = 1, 5 do
    findGameObject2("Gem", string.format("gem2_vital_%d", L3_89)):setActive(true)
  end
  L0_86()
  L0_86()
  L0_86()
  L1_87.pos = "locator2_sdemo3_camera_02"
  L1_87.time = 2
  L1_87.hashfunc = "Linear"
  L2_88.pos = "locator2_sdemo3_camera_03"
  L2_88.time = 2
  L2_88.hashfunc = "Linear"
  L3_89 = {}
  L3_89.pos = "locator2_sdemo3_camera_04"
  L3_89.time = 2
  L3_89.hashfunc = "Linear"
  L2_88.pos = "locator2_sdemo3_target_03"
  L2_88.time = 2
  L2_88.hashfunc = "Linear"
  L3_89 = {}
  L3_89.pos = "locator2_sdemo3_target_02"
  L3_89.time = 2
  L3_89.hashfunc = "Linear"
  L3_89 = L2_88
  L2_88(L3_89, "locator2_sdemo3_camera_01", "locator2_sdemo3_target_04", false)
  L3_89 = L2_88
  L2_88(L3_89, 0)
  L3_89 = "locator2_sdemo3_pc_pos_01"
  L2_88(L3_89, Player.kReset_Falling)
  L3_89 = L2_88
  L2_88(L3_89, 0)
  L3_89 = L2_88
  L2_88(L3_89, L0_86, L1_87)
  L3_89 = L2_88
  L2_88(L3_89, 0.5, {deg = 30}, "Linear")
end
function partD_2()
  _next_phase = false
  sdemo3:zoomOut(2, {deg = 45}, "Linear")
  waitSeconds(2)
  sdemo3:stop(0)
end
function partD_3()
  local L0_90
  L0_90 = setCounterVisible
  L0_90(false)
  L0_90 = {
    {
      pos = "locator2_sdemo4_target_01",
      time = 2,
      hashfunc = "EaseIn"
    },
    {
      pos = "locator2_sdemo4_target_02",
      time = 2,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo4_target_03",
      time = 2,
      hashfunc = "EaseOut"
    }
  }
  sdemo4:set("locator2_sdemo4_camera_01", "locator2_sdemo4_target_01", false)
  sdemo4:play(nil, L0_90)
end
function partD_4()
  _eventFlag.ep02_00140k_done = true
  repeat
    wait()
  until _miner1_removed and _miner2_removed and _miner3_removed
  sdemo4:stop()
end
function partE_1()
  local L0_91, L1_92
  L0_91 = setCounterVisible
  L1_92 = true
  L0_91(L1_92)
  L0_91 = Fn_warpCageMineArea
  L0_91()
  L0_91 = LocalTimerClass
  L0_91 = L0_91.new
  L0_91 = L0_91()
  _miningTimer = L0_91
  L0_91 = _miningTimer
  L1_92 = L0_91
  L0_91 = L0_91.setTime
  L0_91(L1_92, 0)
  L0_91 = _miningTimer
  L1_92 = L0_91
  L0_91 = L0_91.start
  L0_91(L1_92)
  L0_91 = "pi_a_03_03"
  L1_92 = {
    "gravityore_pi_a_03_03_01",
    "gravityore_pi_a_03_03_02",
    "gravityore_pi_a_03_03_03",
    "gravityore_pi_a_03_03_04",
    "gravityore_pi_a_03_03_05",
    "gravityore_pi_a_03_03_06",
    "gravityore_pi_a_03_03_07",
    "gravityore_pi_a_03_03_08"
  }
  if waitToMine(L0_91, L1_92) then
    Fn_captionViewWait("ep02_04002")
  else
    Fn_captionViewWait("ep02_09015")
  end
end
function partE_2()
  local L0_93, L1_94
  L0_93 = "pi_a_06_01"
  L1_94 = {
    "gravityore_pi_a_06_01_01",
    "gravityore_pi_a_06_01_02",
    "gravityore_pi_a_06_01_03",
    "gravityore_pi_a_06_01_04",
    "gravityore_pi_a_06_01_05",
    "gravityore_pi_a_06_01_06",
    "gravityore_pi_a_06_01_07",
    "gravityore_pi_a_06_01_08",
    "gravityore_pi_a_06_01_09",
    "gravityore_pi_a_06_01_10",
    "gravityore_pi_a_06_01_11",
    "gravityore_pi_a_06_01_12",
    "gravityore_pi_a_06_01_13",
    "gravityore_pi_a_06_01_14",
    "gravityore_pi_a_06_01_15",
    "gravityore_pi_a_06_01_16",
    "gravityore_pi_a_06_01_17",
    "gravityore_pi_a_06_01_18",
    "gravityore_pi_a_06_01_19",
    "gravityore_pi_a_06_01_20"
  }
  waitToMine(L0_93, L1_94)
  _miningTimer.task:abort()
  _miningTimer.task = nil
  _miningTimer = nil
end
function partE_3()
  Fn_setNpcVisible(_npc_misai, true)
  Fn_playMotionNpc(_npc_misai, "scared_00", false)
  if findGameObject2("EnemyGenerator", "enmgen2_f_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_f_01"):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2_f_01"):requestIdlingEnemy(true)
    _eventFlag.enemy_f1_ready = true
  end
end
function partE_4()
  local L0_95, L1_96, L2_97
  L0_95 = setCounterVisible
  L1_96 = false
  L0_95(L1_96)
  _misai_part_f = false
  L0_95 = misaiAction
  L0_95 = L0_95()
  _misaiTask = L0_95
  L0_95 = {L1_96}
  L1_96 = {}
  L1_96.pos = "locator2_sdemo5_camera_02"
  L1_96.time = 3
  L1_96.hashfunc = "Linear"
  L1_96 = {L2_97}
  L2_97 = {}
  L2_97.pos = "locator2_sdemo5_target_02"
  L2_97.time = 3
  L2_97.hashfunc = "Linear"
  L2_97 = sdemo5
  L2_97 = L2_97.set
  L2_97(L2_97, "locator2_sdemo5_camera_01", "locator2_sdemo5_target_01", false)
  L2_97 = sdemo5
  L2_97 = L2_97.play
  L2_97(L2_97, L0_95, L1_96)
  L2_97 = {
    "locator2_wave1_02_02"
  }
  findGameObject2("EnemyBrain", "wave1_02"):move(L2_97)
end
function partE_5()
  sdemo5:stop(0)
  findGameObject2("EnemyBrain", "wave1_02"):endScriptAction()
end
function partF_1()
  _misai_part_f = true
  Fn_warpCageMineArea()
  if not _eventFlag.enemy_f1_ready then
    Fn_setNpcVisible(_npc_misai, true)
    _misaiTask = misaiAction()
    if findGameObject2("EnemyGenerator", "enmgen2_f_01") ~= nil then
      findGameObject2("EnemyGenerator", "enmgen2_f_01"):requestSpawn()
      findGameObject2("EnemyGenerator", "enmgen2_f_01"):requestIdlingEnemy(true)
    end
  end
end
function partF_2()
  _enemy_counter_enable = true
  _total_enemy_count = 8
  HUD:counter999SetTextID("ep02_09025")
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetNum(_total_enemy_count)
  HUD:counter999SetVisible(true)
  if findGameObject2("EnemyGenerator", "enmgen2_f_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_f_01"):requestIdlingEnemy(false)
  end
  while _enemy_wave < 2 do
    wait()
  end
  HUD:info("ep02_info_08")
  repeat
    wait()
  until _enemy_wave == 3 and _enemy_count <= 0
  if findGameObject2("EnemyGenerator", "enmgen2_f_04") ~= nil then
    _enemy_wave = 4
    findGameObject2("EnemyGenerator", "enmgen2_f_04"):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2_f_04"):requestIdlingEnemy(false)
  end
  repeat
    wait()
  until _enemy_count > 0
  _wave4Start = true
  Fn_tutorialCaption("battle_ep02_02")
  repeat
    if HUD:captionGetTextId() == nil then
      Fn_tutorialCaptionKill()
      Fn_tutorialCaption("battle_ep02_02")
    end
    wait()
  until _enemy_count <= 0
  HUD:counter999SetVisible(false)
  Fn_tutorialCaptionKill()
end
function partF_3()
  local L0_98, L1_99, L2_100, L3_101
  L0_98 = Player
  L1_99 = L0_98
  L0_98 = L0_98.setStay
  L2_100 = true
  L3_101 = true
  L0_98(L1_99, L2_100, L3_101)
  L0_98 = Fn_userCtrlOff
  L0_98()
  L0_98 = Player
  L1_99 = L0_98
  L0_98 = L0_98.setStay
  L2_100 = false
  L0_98(L1_99, L2_100)
  L0_98 = Fn_coercionGravityRevert
  L0_98()
  L0_98 = Fn_setBgmPoint
  L1_99 = "event"
  L2_100 = "eventpoint_f_3_demo"
  L0_98(L1_99, L2_100)
  _misai_part_f3 = true
  L0_98 = {L1_99, L2_100}
  L1_99 = {}
  L1_99.pos = "locator2_sdemo6_target_02"
  L1_99.time = 1
  L1_99.hashfunc = "Linear"
  L2_100 = {}
  L2_100.pos = "locator2_sdemo6_target_03"
  L2_100.time = 1
  L2_100.hashfunc = "Linear"
  L1_99 = sdemo6
  L2_100 = L1_99
  L1_99 = L1_99.set
  L3_101 = "locator2_sdemo6_camera_01"
  L1_99(L2_100, L3_101, "locator2_sdemo6_target_01", false)
  L1_99 = sdemo6
  L2_100 = L1_99
  L1_99 = L1_99.zoomIn
  L3_101 = 0.5
  L1_99(L2_100, L3_101, {deg = 15}, "Linear")
  L1_99 = sdemo6
  L2_100 = L1_99
  L1_99 = L1_99.play
  L3_101 = nil
  L1_99(L2_100, L3_101, L0_98)
  L1_99 = waitSeconds
  L2_100 = 3
  L1_99(L2_100)
  _misai_part_f4 = true
  L1_99 = Camera
  L2_100 = L1_99
  L1_99 = L1_99.shake2D
  L3_101 = 8
  L1_99(L2_100, L3_101, 0.1, 20, 0)
  L1_99 = Sound
  L2_100 = L1_99
  L1_99 = L1_99.playSEHandle
  L3_101 = "ep02_earthquake"
  L1_99 = L1_99(L2_100, L3_101, 1)
  L2_100 = waitSeconds
  L3_101 = 3
  L2_100(L3_101)
  L2_100 = {
    L3_101,
    {
      pos = "locator2_sdemo6_camera_13",
      time = 2,
      hashfunc = "Linear"
    }
  }
  L3_101 = {}
  L3_101.pos = "locator2_sdemo6_camera_12"
  L3_101.time = 2
  L3_101.hashfunc = "Linear"
  L3_101 = {
    {
      pos = "locator2_sdemo6_target_12",
      time = 2,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo6_target_13",
      time = 2,
      hashfunc = "Linear"
    }
  }
  sdemo6:set("locator2_sdemo6_camera_11", "locator2_sdemo6_target_11", false)
  sdemo6:play(L2_100, L3_101)
  sdemo6:zoomOut(1, {deg = 45}, "Linear")
  _eventFlag.enemy_g1_ready = true
  if findGameObject2("EnemyGenerator", "enmgen2_f_05") ~= nil then
    _enemy_wave = 5
    findGameObject2("EnemyGenerator", "enmgen2_f_05"):requestSpawn()
    findGameObject2("EnemyGenerator", "enmgen2_f_05"):requestIdlingEnemy(true)
  end
  Sound:stopSEHandle(L1_99)
end
function partG_1()
  Player:setStay(true, true)
  Fn_userCtrlOff()
  Fn_warpCageMineArea()
  if not _eventFlag.enemy_g1_ready then
    Fn_setNpcVisible(_npc_misai, true)
    _misaiTask = misaiAction()
    _misai_part_g1 = true
    if findGameObject2("EnemyGenerator", "enmgen2_f_05") ~= nil then
      _enemy_wave = 5
      findGameObject2("EnemyGenerator", "enmgen2_f_05"):requestSpawn()
      findGameObject2("EnemyGenerator", "enmgen2_f_05"):requestIdlingEnemy(true)
    end
  end
end
function partG_2()
  waitSeconds(5)
  repeat
    wait()
  until _enemy_count > 0
  if _eventFlag.enemy_g1_ready then
    sdemo6:stop()
  end
  _wave5Start = true
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_captionView("ep02_09026")
  if findGameObject2("EnemyGenerator", "enmgen2_f_05") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_f_05"):requestIdlingEnemy(false)
  end
  _enemy_counter_enable = true
  _total_enemy_count = 1
  HUD:counter999SetTextID("ep02_09025")
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetNum(_total_enemy_count)
  HUD:counter999SetVisible(true)
  repeat
    wait()
  until _enemy_count <= 0
end
function partG_3()
  local L0_102
  L0_102 = HUD
  L0_102 = L0_102.enemymarkerSetRange
  L0_102(L0_102)
  L0_102 = HUD
  L0_102 = L0_102.counter999SetVisible
  L0_102(L0_102, false)
  _misai_part_g2 = true
  L0_102 = Player
  L0_102 = L0_102.setStay
  L0_102(L0_102, true, true)
  L0_102 = Fn_userCtrlOff
  L0_102()
  L0_102 = Player
  L0_102 = L0_102.setStay
  L0_102(L0_102, false)
  L0_102 = Fn_coercionGravityRevert
  L0_102()
  L0_102 = {
    {
      pos = "locator2_sdemo7_camera_02",
      time = 3,
      hashfunc = "EaseOut"
    }
  }
  sdemo7:set("locator2_sdemo7_camera_01", "locator2_sdemo7_target_01", false)
  sdemo7:play(L0_102, nil)
  waitSeconds(3)
  waitSeconds(3)
  HUD:blackout(2)
  waitSeconds(2)
  sdemo7:stop()
end
function dispatchRequestTask()
  local L0_103, L1_104, L2_105, L3_106, L4_107, L6_108
  L0_103 = _request
  L0_103 = #L0_103
  for L4_107 = 1, L0_103 do
    L6_108 = _requestResult
    L6_108[_request[L4_107].id] = _request[L4_107].command(_request[L4_107].param)
  end
  _request = L1_104
end
function getRequestId()
  local L0_109
  L0_109 = _requestId
  L0_109 = L0_109 + 1
  _requestId = L0_109
  L0_109 = _requestId
  if L0_109 > _MAX_REQUEST_ID then
    _requestId = 0
  end
  L0_109 = _requestId
  return L0_109
end
function getRequestResult(A0_110)
  return _requestResult[A0_110]
end
function Finalize()
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, true)
  Fn_sendStopOtherPreciousGemCount()
  if Fn_getPlayer() then
    Player:setStay(false)
    Fn_userCtrlOn()
  end
end
function breakCountInit()
  for _FORV_3_, _FORV_4_ in ipairs(_islandNames) do
    _break_count[_FORV_4_] = 0
  end
end
function onOreBroken(A0_111)
  local L1_112, L2_113, L3_114, L4_115, L5_116, L6_117
  L1_112 = A0_111.getName
  L1_112 = L1_112(L2_113)
  L5_116 = L1_112
  L6_117 = L3_114(L4_115, L5_116)
  L2_113(L3_114, L4_115, L5_116, L6_117, L3_114(L4_115, L5_116))
  for L5_116, L6_117 in L2_113(L3_114) do
    if string.match(L1_112, L6_117) ~= nil then
      _break_count[L6_117] = _break_count[L6_117] + 1
      break
    end
  end
  if L2_113 ~= nil then
    L2_113(L3_114, L4_115)
  end
end
function waitToMine(A0_118, A1_119)
  local L2_120, L3_121, L4_122, L5_123
  L2_120 = getOreQuotaCount
  L3_121 = A0_118
  L2_120 = L2_120(L3_121)
  L3_121 = {}
  for _FORV_7_ = 1, #A1_119 do
    L3_121[_FORV_7_] = nil
  end
  while true do
    if L2_120 <= _break_count[A0_118] then
      for _FORV_12_ = 1, #A1_119 do
        deleteMnavi(L3_121[_FORV_12_])
        L3_121[_FORV_12_] = nil
      end
      break
    end
    if #A1_119 - _break_count[A0_118] < 6 then
      for _FORV_12_ = 1, #A1_119 do
        if isOreBroken(A1_119[_FORV_12_]) or not _multiNaviEnable then
          deleteMnavi(L3_121[_FORV_12_])
          L3_121[_FORV_12_] = nil
        elseif _multiNaviEnable then
          if L3_121[_FORV_12_] == nil then
            L3_121[_FORV_12_] = setMnavi(getOreHandle(A1_119[_FORV_12_]))
          end
        end
      end
    end
    _FOR_()
  end
  return true
end
function onGetPreciousGem(A0_124)
  _preciousGemCount = _preciousGemCount + 1
  if not _enemy_counter_enable then
    HUD:counter999SetNum(_preciousGemCount)
  end
end
function testFunction(A0_125)
  local L1_126
  L1_126 = print
  L1_126(string.format("common sandbox test : %d, %d, %d", A0_125[1], A0_125[2], A0_125[3]))
  L1_126 = A0_125[1]
  L1_126 = L1_126 + A0_125[2]
  L1_126 = L1_126 + A0_125[3]
  return L1_126
end
function requestPartC(A0_127)
  table.insert(_request, {
    id = getRequestId(),
    command = ingamePartC,
    param = {A0_127}
  })
  return (getRequestId())
end
function requestPartD(A0_128)
  table.insert(_request, {
    id = getRequestId(),
    command = ingamePartD,
    param = {A0_128}
  })
  return (getRequestId())
end
function requestPartE(A0_129)
  table.insert(_request, {
    id = getRequestId(),
    command = ingamePartE,
    param = {A0_129}
  })
  return (getRequestId())
end
function requestPartF(A0_130)
  table.insert(_request, {
    id = getRequestId(),
    command = ingamePartF,
    param = {A0_130}
  })
  return (getRequestId())
end
function requestPartG(A0_131)
  table.insert(_request, {
    id = getRequestId(),
    command = ingamePartG,
    param = {A0_131}
  })
  return (getRequestId())
end
function requestBreakCountInit()
  table.insert(_request, {
    id = getRequestId(),
    command = berakCountInit,
    param = {}
  })
  return (getRequestId())
end
function getOreQuotaCount(A0_132)
  return _quota[A0_132]
end
function isOreBroken(A0_133)
  return getOreHandle(A0_133):isBroken()
end
function getOreBrokenCount(A0_134)
  return _break_count[A0_134]
end
function getOrePos(A0_135)
  return getOreHandle(A0_135):getWorldPos()
end
function getOreHandle(A0_136)
  return Fn_getGravityOre2(A0_136)
end
function setOreVisible(A0_137, A1_138)
  getOreHandle(A0_137):setActive(A1_138)
end
function getOreVisible(A0_139)
  return getOreHandle(A0_139):getActive()
end
function setCounterVisible(A0_140)
  HUD:counter999SetVisible(A0_140)
end
function getCounterVisible()
  return HUD:counter999IsVisible()
end
function lookAtNodeWait(A0_141, A1_142, A2_143)
  invokeTask(function()
    lookAtObject(getOreHandle(A0_141), 2, 3)
  end)
end
function playPlayerMotion(A0_144)
  invokeTask(function()
    Fn_playPlayerMotion(A0_144)
  end)
end
function setMultiNaviEnable(A0_145)
  local L1_146
  _multiNaviEnable = A0_145
end
function notify(A0_147, A1_148)
  _eventFlag[A0_147] = A1_148
end
function getNextPhase()
  local L0_149, L1_150
  L0_149 = _next_phase
  return L0_149
end
function resetNextPhase()
  local L0_151, L1_152
  _next_phase = false
end
function getMiningTime()
  if _miningTimer ~= nil then
    return _miningTimer:getTime()
  else
    return 0
  end
end
function setMiningTime(A0_153)
  if _miningTimer ~= nil then
    _miningTimer:setTime(A0_153)
  end
end
function requestTestFunction(A0_154, A1_155, A2_156)
  table.insert(_request, {
    id = getRequestId(),
    command = testFunction,
    param = {
      A0_154,
      A1_155,
      A2_156
    }
  })
  return (getRequestId())
end
function playSdemo1()
  local L0_157, L1_158, L2_159, L3_160
  L0_157 = HUD
  L1_158 = L0_157
  L0_157 = L0_157.blackout
  L2_159 = 1
  L0_157(L1_158, L2_159)
  L0_157 = waitSeconds
  L1_158 = 1
  L0_157(L1_158)
  L0_157 = findGameObject2
  L1_158 = "Node"
  L2_159 = "locator2_sdemo1_camera_01"
  L0_157 = L0_157(L1_158, L2_159)
  L1_158 = findGameObject2
  L2_159 = "Node"
  L3_160 = "locator2_sdemo1_target_04"
  L1_158 = L1_158(L2_159, L3_160)
  L2_159 = sdemo1
  L3_160 = L2_159
  L2_159 = L2_159.set
  L2_159(L3_160, L0_157, L1_158, false)
  L2_159 = {L3_160}
  L3_160 = {}
  L3_160.pos = "locator2_sdemo1_camera_02"
  L3_160.time = 6
  L3_160.hashfunc = "EaseOut"
  L3_160 = {
    {
      pos = "locator2_sdemo1_target_03",
      time = 2,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo1_target_02",
      time = 2,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo1_target_01",
      time = 2,
      hashfunc = "EaseOut"
    }
  }
  sdemo1:play(L2_159, L3_160)
  HUD:fadein(1)
  Fn_captionView("ep02_09000")
  waitSeconds(7)
  sdemo1:stop()
end
function playSdemo2()
  local L0_161, L1_162, L2_163
  L0_161 = {}
  L0_161.anim_walk_speed = 1
  L0_161.arrivedLength = 0.5
  L0_161.runLength = 99999
  L0_161.recast = false
  L1_162 = {
    L2_163,
    {
      pos = "locator2_sdemo2_miz_03",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_04",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_05",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_06",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_07",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_08",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_09",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_10",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_11",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_12",
      opt = nil
    },
    {
      pos = "locator2_sdemo2_miz_13",
      opt = nil
    }
  }
  L2_163 = {}
  L2_163.pos = "locator2_sdemo2_miz_02"
  L2_163.opt = nil
  L2_163 = {
    {
      pos = "locator2_sdemo2_camera_02",
      time = 1,
      hashfunc = "EaseOut"
    }
  }
  HUD:blackout(1)
  waitSeconds(1)
  _npc_tkg05_task = invokeTask(function()
    repeat
      wait()
    until _eventFlag.misai_warp_ready
    Fn_warpNpc(_npc_tkg05, "locator2_sdemo2_miz_01")
    print("\227\131\159\227\130\182\227\130\164\227\131\175\227\131\188\227\131\151")
    waitSeconds(2.5)
    Fn_playMotionNpc(_npc_tkg05, _misaiMotions.jealousy_00, false)
    misaiReady = true
    waitNpcMotionEnd(_npc_tkg05)
    Fn_captionView("ep02_09001")
    Fn_playMotionNpc(_npc_tkg05, _misaiMotions.jealousy_00, false)
    waitNpcMotionEnd(_npc_tkg05)
    Fn_moveNpc(_npc_tkg05, L1_162, L0_161)
    waitNpcMoveEnd(_npc_tkg05)
  end)
  _eventFlag.sdemo2_ready = true
  sdemo2:set("locator2_sdemo2_camera_01", "locator2_sdemo2_target_01", false)
  sdemo2:play()
  HUD:fadein(1)
  waitSeconds(1)
  waitSeconds(2.5)
  sdemo2:play(L2_163, nil)
  waitSeconds(4)
  waitSeconds(4)
  if invokeTask(function()
    local L0_164
    L0_164 = Fn_findNpcPuppet
    L0_164 = L0_164(_npc_tkg03)
    playerTurn(L0_164)
    Fn_playPlayerMotionWait(_kitMotionTable.motion1, 0)
    Fn_playPlayerMotion(_kitMotionTable.motion4, 0)
  end) ~= nil then
    invokeTask(function()
      local L0_165
      L0_165 = Fn_findNpcPuppet
      L0_165 = L0_165(_npc_tkg03)
      playerTurn(L0_165)
      Fn_playPlayerMotionWait(_kitMotionTable.motion1, 0)
      Fn_playPlayerMotion(_kitMotionTable.motion4, 0)
    end):abort()
  end
  playerTurn(nil)
  sdemo2:stop(0)
end
function npcTkg01Action()
  local L0_166, L1_167, L2_168, L3_169, L4_170, L5_171, L6_172
  L0_166 = {}
  L0_166.anim_walk_speed = 1
  L0_166.runLength = 99999
  L0_166.arrivedLength = 0
  L0_166.recast = true
  L1_167 = {}
  L1_167.startIndex = 1
  L1_167.goalDirection = true
  L2_168 = {
    L3_169,
    L4_170,
    L5_171,
    L6_172,
    {
      pos = "locator2_tkg01_01_06",
      opt = L0_166
    }
  }
  L3_169 = {}
  L3_169.pos = "locator2_tkg01_01_01"
  L3_169.opt = L0_166
  L4_170 = {}
  L4_170.pos = "locator2_tkg01_01_02"
  L4_170.opt = L0_166
  L5_171 = {}
  L5_171.pos = "locator2_tkg01_01_03"
  L5_171.opt = L0_166
  L6_172 = {}
  L6_172.pos = "locator2_tkg01_01_07"
  L6_172.opt = L0_166
  L3_169 = {
    L4_170,
    L5_171,
    L6_172,
    {
      pos = "locator2_tkg01_01_06",
      opt = L0_166
    }
  }
  L4_170 = {}
  L4_170.pos = "locator2_tkg01_01_05"
  L4_170.opt = L0_166
  L5_171 = {}
  L5_171.pos = "locator2_tkg01_01_04"
  L5_171.opt = L0_166
  L6_172 = {}
  L6_172.pos = "locator2_tkg01_01_05"
  L6_172.opt = L0_166
  L4_170 = {
    L5_171,
    L6_172,
    {
      pos = "locator2_tkg01_01_13",
      opt = L0_166
    },
    {
      pos = "locator2_tkg01_01_14",
      opt = L0_166
    },
    {
      pos = "locator2_tkg01_01_15",
      opt = L0_166
    }
  }
  L5_171 = {}
  L5_171.pos = "locator2_tkg01_01_11"
  L5_171.opt = L0_166
  L6_172 = {}
  L6_172.pos = "locator2_tkg01_01_12"
  L6_172.opt = L0_166
  L5_171 = {
    L6_172,
    {
      pos = "locator2_tkg01_01_22",
      opt = L0_166
    },
    {
      pos = "locator2_tkg01_01_23",
      opt = L0_166
    }
  }
  L6_172 = {}
  L6_172.pos = "locator2_tkg01_01_21"
  L6_172.opt = L0_166
  L6_172 = {
    {
      pos = "locator2_tkg01_01_31",
      opt = L0_166
    },
    {
      pos = "locator2_tkg01_01_32",
      opt = L0_166
    },
    {
      pos = "locator2_tkg01_01_33",
      opt = L0_166
    },
    {
      pos = "locator2_tkg01_01_34",
      opt = L0_166
    }
  }
  _npc_tkg01_task = invokeTask(function()
    repeat
      wait()
    until _eventFlag.sdemo1_ready
    Fn_playMotionNpc(_npc_tkg01, "accept_00", true)
    Fn_playMotionNpc(_npc_tkg01, _tkgMotions.wow_00, false)
    Sound:playSE("m02_011", 1)
    waitSeconds(7)
    Fn_findNpc(_npc_tkg01):move(L2_168, L1_167)
    waitNpcMoveEnd(_npc_tkg01)
    while true do
      drillWork(_npc_tkg01, "gravityore_pi_a_01_05", 0)
      Fn_findNpc(_npc_tkg01):move(L4_170, L1_167)
      waitNpcMoveEnd(_npc_tkg01)
      drillWork(_npc_tkg01, "gravityore_pi_a_01_33", 0)
      Fn_findNpc(_npc_tkg01):move(L5_171, L1_167)
      waitNpcMoveEnd(_npc_tkg01)
      drillWork(_npc_tkg01, "gravityore_pi_a_01_15", 1)
      Fn_findNpc(_npc_tkg01):move(L6_172, L1_167)
      waitNpcMoveEnd(_npc_tkg01)
      for _FORV_4_ = 1, 5 do
        Fn_playMotionNpc(_npc_tkg01, _tkgMotions.idle_00, true)
      end
      Fn_findNpc(_npc_tkg01):move(L3_169, L1_167)
      waitNpcMoveEnd(_npc_tkg01)
      if not _phase_b then
      end
    end
    Fn_playMotionNpc(_npc_tkg01, _tkgMotions.idle_00, true)
  end)
end
function npcTkg02Action()
  local L0_173, L1_174, L2_175, L3_176, L4_177, L5_178, L6_179, L7_180, L8_181
  L0_173 = {}
  L0_173.anim_walk_speed = 1
  L0_173.runLength = 99999
  L0_173.arrivedLength = 0
  L0_173.recast = true
  L1_174 = {}
  L1_174.startIndex = 1
  L1_174.goalDirection = true
  L2_175 = {L3_176}
  L3_176 = {}
  L3_176.pos = "locator2_tkg01_02_01"
  L3_176.opt = L0_173
  L3_176 = {L4_177}
  L4_177 = {}
  L4_177.pos = "locator2_tkg01_02_02"
  L4_177.opt = L0_173
  L4_177 = {L5_178, L6_179}
  L5_178 = {}
  L5_178.pos = "locator2_tkg01_02_11"
  L5_178.opt = L0_173
  L6_179 = {}
  L6_179.pos = "locator2_tkg01_02_12"
  L6_179.opt = L0_173
  L5_178 = {L6_179}
  L6_179 = {}
  L6_179.pos = "locator2_tkg01_02_21"
  L6_179.opt = L0_173
  L6_179 = {L7_180}
  L7_180 = {}
  L7_180.pos = "locator2_tkg01_02_31"
  L7_180.opt = L0_173
  L7_180 = {L8_181}
  L8_181 = {}
  L8_181.pos = "locator2_tkg01_02_41"
  L8_181.opt = L0_173
  L8_181 = {
    {
      pos = "locator2_tkg01_02_51",
      opt = L0_173
    }
  }
  Fn_setTurnParamNpc(_npc_tkg02, 1)
  _npc_tkg02_task = invokeTask(function()
    while true do
      Fn_findNpc(_npc_tkg02):move(L2_175, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      for _FORV_3_ = 1, 5 do
        Fn_playMotionNpc(_npc_tkg02, _tkgMotions.idle_00, true)
      end
      Fn_findNpc(_npc_tkg02):move(L3_176, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      drillWork(_npc_tkg02, "gravityore_pi_a_01_31", 0)
      Fn_findNpc(_npc_tkg02):move(L4_177, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      workersChat(_npc_tkg02, _npc_tkg06, 10)
      Fn_findNpc(_npc_tkg02):move(L5_178, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      drillWork(_npc_tkg02, "gravityore_pi_a_01_39", 0)
      Fn_findNpc(_npc_tkg02):move(L6_179, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      workersChat(_npc_tkg02, _npc_tkg06, 10)
      Fn_findNpc(_npc_tkg02):move(L7_180, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      drillWork(_npc_tkg02, "gravityore_pi_a_01_40", 0)
      Fn_findNpc(_npc_tkg02):move(L8_181, L1_174)
      waitNpcMoveEnd(_npc_tkg02)
      workersChat(_npc_tkg02, _npc_tkg06, 10)
      if not _phase_b then
        wait()
      end
    end
    Fn_playMotionNpc(_npc_tkg01, _tkgMotions.idle_00, true)
  end)
end
function npcTkg03Action()
  local L0_182, L1_183, L2_184, L3_185, L4_186
  L0_182 = {}
  L0_182.anim_walk_speed = 1
  L0_182.runLength = 99999
  L0_182.arrivedLength = 0
  L0_182.recast = true
  L1_183 = {}
  L1_183.startIndex = 1
  L1_183.goalDirection = true
  L2_184 = {L3_185, L4_186}
  L3_185 = {}
  L3_185.pos = "locator2_tkg01_03_01"
  L3_185.opt = L0_182
  L4_186 = {}
  L4_186.pos = "locator2_tkg01_03_02"
  L4_186.opt = L0_182
  L3_185 = {
    L4_186,
    {
      pos = "locator2_tkg01_03_12",
      opt = L0_182
    }
  }
  L4_186 = {}
  L4_186.pos = "locator2_tkg01_03_11"
  L4_186.opt = L0_182
  L4_186 = {
    {
      pos = "locator2_tkg01_03_21",
      opt = L0_182
    },
    {
      pos = "locator2_tkg01_03_22",
      opt = L0_182
    }
  }
  _npc_tkg03_task = invokeTask(function()
    local L0_187, L1_188, L2_189, L3_190
    while true do
      L0_187 = _eventFlag
      L0_187 = L0_187.request_misai_warp
      if not L0_187 then
        L0_187 = Fn_findNpc
        L1_188 = _npc_tkg03
        L0_187 = L0_187(L1_188)
        L1_188 = L0_187
        L0_187 = L0_187.move
        L2_189 = L2_184
        L3_190 = L1_183
        L0_187(L1_188, L2_189, L3_190)
        repeat
          L0_187 = wait
          L0_187()
          L0_187 = isNpcMoveEnd
          L1_188 = _npc_tkg03
          L0_187 = L0_187(L1_188)
          if not L0_187 then
            L0_187 = _eventFlag
            L0_187 = L0_187.request_misai_warp
          end
        until L0_187
        repeat
          L0_187 = wait
          L0_187()
          L0_187 = isNpcTurnEnd
          L1_188 = _npc_tkg03
          L0_187 = L0_187(L1_188)
          if not L0_187 then
            L0_187 = _eventFlag
            L0_187 = L0_187.request_misai_warp
          end
        until L0_187
        L0_187 = Fn_findNpc
        L1_188 = _npc_tkg03
        L0_187 = L0_187(L1_188)
        L1_188 = L0_187
        L0_187 = L0_187.playMotion
        L2_189 = _tkgMotions
        L2_189 = L2_189.idle_00
        L0_187(L1_188, L2_189)
        repeat
          L0_187 = wait
          L0_187()
          L0_187 = isNpcMotionEnd
          L1_188 = _npc_tkg03
          L0_187 = L0_187(L1_188)
          if not L0_187 then
            L0_187 = _eventFlag
            L0_187 = L0_187.request_misai_warp
          end
        until L0_187
        L0_187 = Fn_findNpc
        L1_188 = _npc_tkg03
        L0_187 = L0_187(L1_188)
        L1_188 = L0_187
        L0_187 = L0_187.move
        L2_189 = L3_185
        L3_190 = L1_183
        L0_187(L1_188, L2_189, L3_190)
        repeat
          L0_187 = wait
          L0_187()
          L0_187 = isNpcMoveEnd
          L1_188 = _npc_tkg03
          L0_187 = L0_187(L1_188)
          if not L0_187 then
            L0_187 = _eventFlag
            L0_187 = L0_187.request_misai_warp
          end
        until L0_187
        repeat
          L0_187 = wait
          L0_187()
          L0_187 = isNpcTurnEnd
          L1_188 = _npc_tkg03
          L0_187 = L0_187(L1_188)
          if not L0_187 then
            L0_187 = _eventFlag
            L0_187 = L0_187.request_misai_warp
          end
        until L0_187
        L0_187 = Fn_findNpc
        L1_188 = _npc_tkg03
        L0_187 = L0_187(L1_188)
        L1_188 = L0_187
        L0_187 = L0_187.playMotion
        L2_189 = _tkgMotions
        L2_189 = L2_189.idle_00
        L0_187(L1_188, L2_189)
        repeat
          L0_187 = wait
          L0_187()
          L0_187 = isNpcMotionEnd
          L1_188 = _npc_tkg03
          L0_187 = L0_187(L1_188)
          if not L0_187 then
            L0_187 = _eventFlag
            L0_187 = L0_187.request_misai_warp
          end
        until L0_187
        L0_187 = wait
        L0_187()
      end
    end
    L0_187 = Fn_findNpc
    L1_188 = _npc_tkg03
    L0_187 = L0_187(L1_188)
    L1_188 = L0_187
    L0_187 = L0_187.move
    L2_189 = L4_186
    L3_190 = L1_183
    L0_187(L1_188, L2_189, L3_190)
    L0_187 = waitNpcMoveEnd
    L1_188 = _npc_tkg03
    L0_187(L1_188)
    L0_187 = "gravityore_pi_a_01_04"
    while true do
      L1_188 = isOreBroken
      L2_189 = L0_187
      L1_188 = L1_188(L2_189)
      if not L1_188 then
        L1_188 = getOreVisible
        L2_189 = L0_187
        L1_188 = L1_188(L2_189)
        if L1_188 then
          L1_188 = nil
          L2_189 = isOreBroken
          L3_190 = L0_187
          L2_189 = L2_189(L3_190)
          if not L2_189 then
            L2_189 = Fn_playMotionNpc
            L3_190 = _npc_tkg03
            L2_189(L3_190, "dig_00", false)
            L2_189 = Sound
            L3_190 = L2_189
            L2_189 = L2_189.playSEHandle
            L2_189 = L2_189(L3_190, "npc_drill_digging", 1, "", Fn_findNpcPuppet(_npc_tkg03))
            L3_190 = Sound
            L3_190 = L3_190.playSEHandle
            L3_190 = L3_190(L3_190, "npc_drill_idling", 1, "", Fn_findNpcPuppet(_npc_tkg03))
            if L1_188 == nil then
              L1_188 = Fn_createEffect("ef_ev_jkpar_01", "ef_ev_jkpar_01", {
                obj = Fn_findNpcPuppet(_npc_tkg03),
                joint = "bn_r_drill3"
              }, true)
            end
            while not isNpcMotionEnd(_npc_tkg03) and not isOreBroken(L0_187) do
              wait()
            end
            if Sound:isPlayingSEHandle(L2_189) == 1 then
              Sound:stopSEHandle(L2_189)
            end
            if Sound:isPlayingSEHandle(L3_190) == 1 then
              Sound:stopSEHandle(L3_190)
            end
            if L1_188 ~= nil then
              L1_188:stop()
              L1_188:kill()
              L1_188 = nil
            end
          end
        else
          L1_188 = getNpcPos
          L2_189 = _npc_tkg03
          L1_188 = L1_188(L2_189)
          L2_189 = getNpcPos
          L3_190 = _npc_tkg04b
          L2_189 = L2_189(L3_190)
          L3_190 = Fn_get_distance
          L3_190 = L3_190(L1_188, L2_189)
          if L3_190 < 3 then
            L3_190 = Fn_turnNpc
            L3_190(_npc_tkg03, Fn_findNpcPuppet(_npc_tkg04b))
            L3_190 = Fn_playMotionNpc
            L3_190(_npc_tkg03, "talk_01", true)
          else
            L3_190 = Fn_playMotionNpc
            L3_190(_npc_tkg03, "stay", true)
          end
        end
        L1_188 = wait
        L1_188()
      end
    end
    L1_188 = Sound
    L2_189 = L1_188
    L1_188 = L1_188.playSE
    L3_190 = "m06_002"
    L1_188(L2_189, L3_190, 0.8)
    L1_188 = Fn_playMotionNpc
    L2_189 = _npc_tkg03
    L3_190 = "damage_small_f_00"
    L1_188(L2_189, L3_190, true)
    L1_188 = {}
    L1_188.upperAnim = "stay"
    L2_189 = Fn_turnNpc
    L3_190 = _npc_tkg03
    L2_189(L3_190, nil, L1_188)
    repeat
      L2_189 = wait
      L2_189()
      L2_189 = _eventFlag
      L2_189 = L2_189.sdemo2_ready
    until L2_189
    L2_189 = Fn_playMotionNpc
    L3_190 = _npc_tkg03
    L2_189(L3_190, _tkgMotions.wow_00, true, {animBlendDuration = 1})
    L2_189 = Fn_playMotionNpc
    L3_190 = _npc_tkg03
    L2_189(L3_190, _tkgMotions.watching_00, true, {animBlendDuration = 1})
    while true do
      L2_189 = Fn_findNpc
      L3_190 = _npc_tkg03
      L2_189 = L2_189(L3_190)
      L3_190 = L2_189
      L2_189 = L2_189.move
      L2_189(L3_190, L4_186, L1_183)
      L2_189 = waitNpcMoveEnd
      L3_190 = _npc_tkg03
      L2_189(L3_190)
    end
  end)
end
function npcTkg04Action()
  local L0_191, L1_192, L2_193
  L0_191 = {}
  L0_191.anim_walk_speed = 1
  L0_191.runLength = 99999
  L0_191.arrivedLength = 0
  L0_191.recast = true
  L1_192 = {}
  L1_192.startIndex = 1
  L1_192.goalDirection = true
  L2_193 = {
    {
      pos = "locator2_tkg01_04_07",
      opt = posOption1
    },
    {
      pos = "locator2_tkg01_04_08",
      opt = posOption1
    },
    {
      pos = "locator2_tkg01_04_09",
      opt = posOption1
    }
  }
  _npc_tkg04_task = invokeTask(function()
    repeat
      wait()
    until _eventFlag.sdemo1_ready
    waitNpcMotionEnd(_npc_tkg04)
    Fn_playMotionNpc(_npc_tkg04, _tkgMotions.watching_00, false)
    Sound:playSE("m03_002", 1)
    waitSeconds(7)
    while true do
      Fn_findNpc(_npc_tkg04):move({
        {
          pos = "locator2_tkg01_04_03",
          opt = L0_191
        }
      }, L1_192)
      waitNpcMoveAndTurnEnd(_npc_tkg04)
      drillWork(_npc_tkg04, "gravityore_pi_a_01_01", 0)
      Fn_playMotionNpc(_npc_tkg04, _tkgMotions.idle_00, true)
      Fn_findNpc(_npc_tkg04):move({
        {
          pos = "locator2_tkg01_04_04",
          opt = L0_191
        }
      }, L1_192)
      waitNpcMoveAndTurnEnd(_npc_tkg04)
      drillWork(_npc_tkg04, "gravityore_pi_a_01_12", 0)
      Fn_findNpc(_npc_tkg04):move({
        {
          pos = "locator2_tkg01_04_05",
          opt = L0_191
        }
      }, L1_192)
      waitNpcMoveAndTurnEnd(_npc_tkg04)
      drillWork(_npc_tkg04, "gravityore_pi_a_01_32", 0)
      Fn_playMotionNpc(_npc_tkg04, _tkgMotions.idle_00, true)
      Fn_findNpc(_npc_tkg04):move({
        {
          pos = "locator2_tkg01_04_06",
          opt = L0_191
        }
      }, L1_192)
      waitNpcMoveAndTurnEnd(_npc_tkg04)
      drillWork(_npc_tkg04, "gravityore_pi_a_01_03", 0)
      Fn_playMotionNpc(_npc_tkg04, _tkgMotions.idle_00, true)
      Fn_findNpc(_npc_tkg04):move(L2_193, L1_192)
      waitNpcMoveAndTurnEnd(_npc_tkg04)
      Fn_playMotionNpc(_npc_tkg04, _tkgMotions.idle_00, true)
    end
  end)
end
function npcTkg04bAction()
  _npc_tkg04b_task = invokeTask(function()
    local L0_194, L1_195, L2_196, L3_197
    L0_194 = Fn_setNpcVisible
    L1_195 = _npc_tkg04b
    L2_196 = false
    L0_194(L1_195, L2_196)
    repeat
      L0_194 = wait
      L0_194()
      L0_194 = _eventFlag
      L0_194 = L0_194.request_misai_warp
    until L0_194
    L0_194 = Fn_setNpcVisible
    L1_195 = _npc_tkg04b
    L2_196 = true
    L0_194(L1_195, L2_196)
    L0_194 = "gravityore_pi_a_01_04"
    while true do
      L1_195 = isOreBroken
      L2_196 = L0_194
      L1_195 = L1_195(L2_196)
      if not L1_195 then
        L1_195 = getOreVisible
        L2_196 = L0_194
        L1_195 = L1_195(L2_196)
        if L1_195 then
          L1_195 = nil
          L2_196 = isOreBroken
          L3_197 = L0_194
          L2_196 = L2_196(L3_197)
          if not L2_196 then
            L2_196 = Fn_playMotionNpc
            L3_197 = _npc_tkg04b
            L2_196(L3_197, "dig_00", false)
            L2_196 = Sound
            L3_197 = L2_196
            L2_196 = L2_196.playSEHandle
            L2_196 = L2_196(L3_197, "npc_drill_digging", 1, "", Fn_findNpcPuppet(_npc_tkg04b))
            L3_197 = Sound
            L3_197 = L3_197.playSEHandle
            L3_197 = L3_197(L3_197, "npc_drill_idling", 1, "", Fn_findNpcPuppet(_npc_tkg04b))
            if L1_195 == nil then
              L1_195 = Fn_createEffect("ef_ev_jkpar_01", "ef_ev_jkpar_01", {
                obj = Fn_findNpcPuppet(_npc_tkg04b),
                joint = "bn_r_drill3"
              }, true)
            end
            repeat
              wait()
            until isNpcMotionEnd(_npc_tkg04b) or isOreBroken(L0_194)
            if Sound:isPlayingSEHandle(L2_196) == 1 then
              Sound:stopSEHandle(L2_196)
            end
            if Sound:isPlayingSEHandle(L3_197) == 1 then
              Sound:stopSEHandle(L3_197)
            end
            if L1_195 ~= nil then
              L1_195:stop()
              L1_195:kill()
              L1_195 = nil
            end
          end
        else
          L1_195 = getNpcPos
          L2_196 = _npc_tkg04b
          L1_195 = L1_195(L2_196)
          L2_196 = getNpcPos
          L3_197 = _npc_tkg03
          L2_196 = L2_196(L3_197)
          L3_197 = Fn_get_distance
          L3_197 = L3_197(L1_195, L2_196)
          if L3_197 < 4 then
            L3_197 = Fn_turnNpc
            L3_197(_npc_tkg04b, Fn_findNpcPuppet(_npc_tkg03))
            L3_197 = Fn_playMotionNpc
            L3_197(_npc_tkg04b, "talk_01", true)
          else
            L3_197 = Fn_playMotionNpc
            L3_197(_npc_tkg04b, "stay", true)
          end
        end
        L1_195 = wait
        L1_195()
      end
    end
    L1_195 = Fn_playMotionNpc
    L2_196 = _npc_tkg04b
    L3_197 = "surprise_00"
    L1_195(L2_196, L3_197, true, {animBlendDuration = 1})
    L1_195 = {}
    L1_195.upperAnim = "stay"
    L2_196 = Fn_turnNpc
    L3_197 = _npc_tkg04b
    L2_196(L3_197, nil, L1_195)
    repeat
      L2_196 = wait
      L2_196()
      L2_196 = _eventFlag
      L2_196 = L2_196.sdemo2_ready
    until L2_196
    L2_196 = Sound
    L3_197 = L2_196
    L2_196 = L2_196.playSE
    L2_196(L3_197, "m03_002", 0.8)
    L2_196 = Fn_playMotionNpc
    L3_197 = _npc_tkg04b
    L2_196(L3_197, _tkgMotions.watching_00, true, {animBlendDuration = 1})
    L2_196 = Fn_playMotionNpc
    L3_197 = _npc_tkg04b
    L2_196(L3_197, _tkgMotions.wow_00, true, {animBlendDuration = 1})
    while true do
      L2_196 = Fn_findNpc
      L3_197 = _npc_tkg04b
      L2_196 = L2_196(L3_197)
      L3_197 = Fn_turnNpc
      L3_197(_npc_tkg04b, Fn_getPlayer())
      L3_197 = Fn_playMotionNpc
      L3_197(_npc_tkg04b, "talk_01", true, {animBlendDuration = 1})
      L3_197 = wait
      L3_197()
    end
  end)
end
function npcTkg05Action()
  local L0_198, L1_199, L2_200, L3_201, L4_202, L5_203, L6_204, L7_205
  L0_198 = {}
  L0_198.anim_walk_speed = 1
  L0_198.runLength = 99999
  L0_198.arrivedLength = 0
  L0_198.recast = true
  L1_199 = {}
  L1_199.startIndex = 1
  L1_199.goalDirection = true
  L2_200 = {
    L3_201,
    L4_202,
    L5_203,
    L6_204,
    L7_205,
    {
      pos = "locator2_tkg01_05_06",
      opt = L0_198
    }
  }
  L3_201 = {}
  L3_201.pos = "locator2_tkg01_05_01"
  L3_201.opt = L0_198
  L4_202 = {}
  L4_202.pos = "locator2_tkg01_05_02"
  L4_202.opt = L0_198
  L5_203 = {}
  L5_203.pos = "locator2_tkg01_05_03"
  L5_203.opt = L0_198
  L6_204 = {}
  L6_204.pos = "locator2_tkg01_05_04"
  L6_204.opt = L0_198
  L7_205 = {}
  L7_205.pos = "locator2_tkg01_05_05"
  L7_205.opt = L0_198
  L3_201 = {L4_202, L5_203}
  L4_202 = {}
  L4_202.pos = "locator2_tkg01_05_11"
  L4_202.opt = L0_198
  L5_203 = {}
  L5_203.pos = "locator2_tkg01_05_12"
  L5_203.opt = L0_198
  L4_202 = {L5_203}
  L5_203 = {}
  L5_203.pos = "locator2_tkg01_05_13"
  L5_203.opt = L0_198
  L5_203 = {L6_204, L7_205}
  L6_204 = {}
  L6_204.pos = "locator2_tkg01_05_21"
  L6_204.opt = L0_198
  L7_205 = {}
  L7_205.pos = "locator2_tkg01_05_22"
  L7_205.opt = L0_198
  L6_204 = {
    L7_205,
    {
      pos = "locator2_tkg01_05_32",
      opt = L0_198
    },
    {
      pos = "locator2_tkg01_05_33",
      opt = L0_198
    }
  }
  L7_205 = {}
  L7_205.pos = "locator2_tkg01_05_31"
  L7_205.opt = L0_198
  L7_205 = {
    {
      pos = "locator2_tkg01_05_41",
      opt = L0_198
    },
    {
      pos = "locator2_tkg01_05_42",
      opt = L0_198
    }
  }
  _npc_tkg05_task = invokeTask(function()
    Fn_playMotionNpc(_npc_tkg05, "stay", true, {animBlendDuration = 1})
    repeat
      wait()
    until _eventFlag.sdemo1_ready
    Fn_findNpc(_npc_tkg05):move(L2_200, L1_199)
    waitMisaiMoveEnd()
    drillWork(_npc_tkg05, "gravityore_pi_a_01_22", 0)
    Fn_findNpc(_npc_tkg05):move(L3_201, L1_199)
    waitMisaiMoveEnd()
    drillWork(_npc_tkg05, "gravityore_pi_a_01_44", 0)
    Fn_findNpc(_npc_tkg05):move(L4_202, L1_199)
    waitMisaiMoveEnd()
    drillWork(_npc_tkg05, "gravityore_pi_a_01_45", 0)
    Fn_findNpc(_npc_tkg05):move(L5_203, L1_199)
    waitMisaiMoveEnd()
    drillWork(_npc_tkg05, "gravityore_pi_a_01_23", 1)
    Fn_findNpc(_npc_tkg05):move(L6_204, L1_199)
    waitMisaiMoveEnd()
    drillWork(_npc_tkg05, "gravityore_pi_a_01_24", 0)
    Fn_findNpc(_npc_tkg05):move(L7_205, L1_199)
    waitMisaiMoveEnd()
    while true do
      Fn_playMotionNpc(_npc_tkg05, _misaiMotions.idle_00, true)
      if _eventFlag.request_misai_warp and not _eventFlag.misai_warp_ready then
        print("\227\131\159\227\130\182\227\130\164\227\128\129\227\131\175\227\131\188\227\131\151\230\186\150\229\130\153\229\174\140\228\186\134")
        _eventFlag.misai_warp_ready = true
      end
      wait()
    end
  end)
end
function waitMisaiMoveEnd()
  repeat
    if _eventFlag.request_misai_warp and not _eventFlag.misai_warp_ready then
      print("\227\131\159\227\130\182\227\130\164\227\128\129\227\131\175\227\131\188\227\131\151\230\186\150\229\130\153\229\174\140\228\186\134")
      _eventFlag.misai_warp_ready = true
    end
    wait()
  until isNpcMoveEnd(_npc_tkg05)
end
function npcTkg06Action()
  local L0_206, L1_207, L2_208, L3_209, L4_210, L5_211, L6_212, L7_213
  L0_206 = {}
  L0_206.anim_walk_speed = 1
  L0_206.runLength = 99999
  L0_206.arrivedLength = 0
  L0_206.recast = true
  L1_207 = {}
  L1_207.startIndex = 1
  L1_207.goalDirection = true
  L2_208 = {L3_209, L4_210}
  L3_209 = {}
  L3_209.pos = "locator2_tkg01_06_01"
  L3_209.opt = L0_206
  L4_210 = {}
  L4_210.pos = "locator2_tkg01_06_02"
  L4_210.opt = L0_206
  L3_209 = {
    L4_210,
    L5_211,
    L6_212,
    L7_213
  }
  L4_210 = {}
  L4_210.pos = "locator2_tkg01_06_11"
  L4_210.opt = L0_206
  L5_211 = {}
  L5_211.pos = "locator2_tkg01_06_12"
  L5_211.opt = L0_206
  L6_212 = {}
  L6_212.pos = "locator2_tkg01_06_13"
  L6_212.opt = L0_206
  L7_213 = {}
  L7_213.pos = "locator2_tkg01_06_14"
  L7_213.opt = L0_206
  L4_210 = {L5_211, L6_212}
  L5_211 = {}
  L5_211.pos = "locator2_tkg01_06_21"
  L5_211.opt = L0_206
  L6_212 = {}
  L6_212.pos = "locator2_tkg01_06_22"
  L6_212.opt = L0_206
  L5_211 = {L6_212, L7_213}
  L6_212 = {}
  L6_212.pos = "locator2_tkg01_06_31"
  L6_212.opt = L0_206
  L7_213 = {}
  L7_213.pos = "locator2_tkg01_06_32"
  L7_213.opt = L0_206
  L6_212 = {L7_213}
  L7_213 = {}
  L7_213.pos = "locator2_tkg01_06_41"
  L7_213.opt = L0_206
  L7_213 = {
    {
      pos = "locator2_tkg01_06_02",
      opt = L0_206
    }
  }
  _npc_tkg06_task = invokeTask(function()
    while true do
      while true do
        Fn_findNpc(_npc_tkg06):move(L2_208, L1_207)
        waitNpcMoveEnd(_npc_tkg06)
        for _FORV_3_ = 1, 3 do
          Fn_playMotionNpc(_npc_tkg06, _tkgMotions.idle_00, true)
        end
        Fn_findNpc(_npc_tkg06):move(L3_209, L1_207)
        waitNpcMoveEnd(_npc_tkg06)
        drillWork(_npc_tkg06, "gravityore_pi_a_01_06", 1)
        Fn_findNpc(_npc_tkg06):move(L4_210, L1_207)
        waitNpcMoveEnd(_npc_tkg06)
        workersChat(_npc_tkg06, _npc_tkg02, 10)
        Fn_findNpc(_npc_tkg06):move(L5_211, L1_207)
        waitNpcMoveEnd(_npc_tkg06)
        drillWork(_npc_tkg06, "gravityore_pi_a_01_26", 0)
        Fn_findNpc(_npc_tkg06):move(L6_212, L1_207)
        waitNpcMoveEnd(_npc_tkg06)
        if not _phase_b then
          wait()
        end
      end
    end
    while true do
      Fn_findNpc(_npc_tkg06):move(L7_213, L1_207)
      waitNpcMoveEnd(_npc_tkg06)
      Fn_playMotionNpc(_npc_tkg06, _tkgMotions.idle_00, true)
      wait()
    end
  end)
end
function npcTkg07Action()
  local L0_214, L1_215, L2_216, L3_217, L4_218, L5_219
  L0_214 = {}
  L0_214.anim_walk_speed = 1
  L0_214.runLength = 99999
  L0_214.arrivedLength = 0
  L0_214.recast = true
  L1_215 = {}
  L1_215.startIndex = 1
  L1_215.goalDirection = true
  L2_216 = {L3_217}
  L3_217 = {}
  L3_217.pos = "locator2_tkg01_07_01"
  L3_217.opt = L0_214
  L3_217 = {L4_218, L5_219}
  L4_218 = {}
  L4_218.pos = "locator2_tkg01_07_02"
  L4_218.opt = L0_214
  L5_219 = {}
  L5_219.pos = "locator2_tkg01_07_03"
  L5_219.opt = L0_214
  L4_218 = {
    L5_219,
    {
      pos = "locator2_tkg01_07_05",
      opt = L0_214
    },
    {
      pos = "locator2_tkg01_07_06",
      opt = L0_214
    }
  }
  L5_219 = {}
  L5_219.pos = "locator2_tkg01_07_04"
  L5_219.opt = L0_214
  L5_219 = {
    {
      pos = "locator2_tkg01_07_05",
      opt = L0_214
    },
    {
      pos = "locator2_tkg01_07_04",
      opt = L0_214
    }
  }
  _npc_tkg07_task = invokeTask(function()
    Fn_findNpc(_npc_tkg07):move(L2_216, L1_215)
    waitNpcMoveEnd(_npc_tkg07)
    repeat
      wait()
    until _eventFlag.sdemo1_ready
    waitNpcMotionEnd(_npc_tkg07)
    Fn_playMotionNpc(_npc_tkg07, _tkgMotions.watching_00, true)
    Sound:playSE("m05_005", 1)
    while true do
      Fn_findNpc(_npc_tkg07):move(L3_217, L1_215)
      waitNpcMoveEnd(_npc_tkg07)
      Fn_playMotionNpc(_npc_tkg07, _tkgMotions.idle_00, true)
      Fn_findNpc(_npc_tkg07):move(L4_218, L1_215)
      waitNpcMoveEnd(_npc_tkg07)
      for _FORV_3_ = 1, 3 do
        Fn_playMotionNpc(_npc_tkg07, _tkgMotions.idle_00, true)
      end
      Fn_findNpc(_npc_tkg07):move(L5_219, L1_215)
      waitNpcMoveEnd(_npc_tkg07)
      if not _phase_b then
        wait()
      end
    end
  end)
end
function npcTkg08Action()
  local L0_220, L1_221, L2_222, L3_223, L4_224, L5_225
  L0_220 = {}
  L0_220.anim_walk_speed = 1
  L0_220.runLength = 99999
  L0_220.arrivedLength = 0
  L0_220.recast = true
  L1_221 = {}
  L1_221.startIndex = 1
  L1_221.goalDirection = true
  L2_222 = {L3_223}
  L3_223 = {}
  L3_223.pos = "locator2_tkg01_08_01"
  L3_223.opt = L0_220
  L3_223 = {L4_224}
  L4_224 = {}
  L4_224.pos = "locator2_tkg01_08_02"
  L4_224.opt = L0_220
  L4_224 = {L5_225}
  L5_225 = {}
  L5_225.pos = "locator2_tkg01_08_03"
  L5_225.opt = L0_220
  L5_225 = {
    {
      pos = "locator2_tkg01_08_04",
      opt = L0_220
    },
    {
      pos = "locator2_tkg01_08_05",
      opt = L0_220
    }
  }
  Fn_setNpcVisible(_npc_tkg08, true)
  _npc_tkg08_task = invokeTask(function()
    Fn_findNpc(_npc_tkg08):move(L2_222, L1_221)
    waitNpcMoveEnd(_npc_tkg08)
    drillWork(_npc_tkg08, "gravityore_pi_a_25_06", 1, 30)
    Fn_playMotionNpc(_npc_tkg08, _tkgMotions.idle_00, true)
    Fn_findNpc(_npc_tkg08):move(L3_223, L1_221)
    waitNpcMoveEnd(_npc_tkg08)
    drillWork(_npc_tkg08, "gravityore_pi_a_25_05", 0, 20)
    Fn_playMotionNpc(_npc_tkg08, _tkgMotions.idle_00, true)
    Fn_findNpc(_npc_tkg08):move(L4_224, L1_221)
    waitNpcMoveEnd(_npc_tkg08)
    drillWork(_npc_tkg08, "gravityore_pi_a_25_04", 0, 20)
    Fn_playMotionNpc(_npc_tkg08, _tkgMotions.idle_00, true)
    while true do
      Fn_findNpc(_npc_tkg08):move(L5_225, L1_221)
      waitNpcMoveEnd(_npc_tkg08)
      Fn_playMotionNpc(_npc_tkg08, _tkgMotions.idle_00, true)
      wait()
    end
  end)
end
function npcTkg09Action()
  local L0_226, L1_227, L2_228, L3_229, L4_230
  L0_226 = {}
  L0_226.anim_walk_speed = 1
  L0_226.runLength = 99999
  L0_226.arrivedLength = 0
  L0_226.recast = true
  L1_227 = {}
  L1_227.startIndex = 1
  L1_227.goalDirection = true
  L2_228 = {L3_229}
  L3_229 = {}
  L3_229.pos = "locator2_tkg01_09_01"
  L3_229.opt = L0_226
  L3_229 = {L4_230}
  L4_230 = {}
  L4_230.pos = "locator2_tkg01_09_02"
  L4_230.opt = L0_226
  L4_230 = {
    {
      pos = "locator2_tkg01_09_03",
      opt = L0_226
    },
    {
      pos = "locator2_tkg01_09_04",
      opt = L0_226
    },
    {
      pos = "locator2_tkg01_09_03",
      opt = L0_226
    },
    {
      pos = "locator2_tkg01_09_05",
      opt = L0_226
    },
    {
      pos = "locator2_tkg01_09_06",
      opt = L0_226
    }
  }
  Fn_setNpcVisible(_npc_tkg09, true)
  _npc_tkg09_task = invokeTask(function()
    while true do
      Fn_findNpc(_npc_tkg09):move(L2_228, L1_227)
      waitNpcMoveEnd(_npc_tkg09)
      drillWork(_npc_tkg09, "gravityore_pi_a_25_07", 0, 20)
      Fn_playMotionNpc(_npc_tkg09, _tkgMotions.idle_00, true)
      Fn_findNpc(_npc_tkg09):move(L3_229, L1_227)
      waitNpcMoveEnd(_npc_tkg09)
      drillWork(_npc_tkg09, "gravityore_pi_a_25_11", 0, 20)
      Fn_playMotionNpc(_npc_tkg09, _tkgMotions.idle_00, true)
      Fn_findNpc(_npc_tkg09):move(L4_230, L1_227)
      waitNpcMoveEnd(_npc_tkg09)
      do break end
      wait()
    end
    Fn_playMotionNpc(_npc_tkg09, _tkgMotions.idle_00, true)
  end)
end
function npcTkg10Action()
  local L0_231, L1_232, L2_233
  L0_231 = {}
  L0_231.anim_walk_speed = 1
  L0_231.runLength = 99999
  L0_231.arrivedLength = 0
  L0_231.recast = true
  L1_232 = {}
  L1_232.startIndex = 1
  L1_232.goalDirection = true
  L2_233 = {
    {
      pos = "locator2_tkg01_10_01",
      opt = L0_231
    },
    {
      pos = "locator2_tkg01_10_02",
      opt = L0_231
    },
    {
      pos = "locator2_tkg01_10_03",
      opt = L0_231
    }
  }
  Fn_setNpcVisible(_npc_tkg10, true)
  _npc_tkg10_task = invokeTask(function()
    while true do
      Fn_findNpc(_npc_tkg10):move(L2_233, L1_232)
      waitNpcMoveEnd(_npc_tkg10)
      drillWork(_npc_tkg10, "gravityore_pi_a_25_01", 0, 60)
      Fn_playMotionNpc(_npc_tkg10, _tkgMotions.idle_00, true)
      wait()
    end
  end)
end
function tkg31Action()
  local L0_234, L1_235, L2_236, L3_237, L4_238, L5_239
  L0_234 = {}
  L0_234.anim_walk_speed = 1
  L0_234.anim_run_speed = 1
  L0_234.runLength = -1
  L0_234.arrivedLength = 0
  L0_234.recast = true
  L1_235 = {}
  L1_235.anim_walk_speed = 1
  L1_235.anim_run_speed = 1
  L1_235.runLength = 99999
  L1_235.arrivedLength = 0
  L1_235.recast = true
  L2_236 = {}
  L2_236.startIndex = 1
  L2_236.goalDirection = true
  L3_237 = {
    L4_238,
    L5_239,
    {
      pos = "locator2_tkg31_03",
      opt = L0_234
    },
    {
      pos = "locator2_tkg31_04",
      opt = L0_234
    },
    {
      pos = "locator2_tkg31_05",
      opt = L0_234
    },
    {
      pos = "locator2_tkg31_06",
      opt = L0_234
    },
    {
      pos = "locator2_tkg31_07",
      opt = L0_234
    },
    {
      pos = "locator2_tkg31_08",
      opt = L0_234
    },
    {
      pos = "locator2_tkg31_09",
      opt = L0_234
    }
  }
  L4_238 = {}
  L4_238.pos = "locator2_tkg31_01"
  L4_238.opt = L0_234
  L5_239 = {}
  L5_239.pos = "locator2_tkg31_02"
  L5_239.opt = L0_234
  L4_238 = {
    L5_239,
    {
      pos = "locator2_tkg31_12",
      opt = L1_235
    },
    {
      pos = "locator2_tkg31_13",
      opt = L1_235
    }
  }
  L5_239 = {}
  L5_239.pos = "locator2_tkg31_11"
  L5_239.opt = L1_235
  L5_239 = {
    {
      pos = "locator2_tkg31_21",
      opt = L0_234
    }
  }
  Fn_setNpcVisible(_npc_tkg31, true)
  invokeTask(function()
    Fn_findNpc(_npc_tkg31):move(L3_237, L2_236)
    waitNpcMoveEnd(_npc_tkg31)
    Fn_playMotionNpc(_npc_tkg31, "scared_00", false)
    repeat
      wait()
    until _eventFlag.ep02_d_battle_ended
    Fn_findNpc(_npc_tkg31):move(L4_238, L2_236)
    waitNpcMoveEnd(_npc_tkg31)
    Fn_turnNpc(_npc_tkg31)
    Fn_playMotionNpc(_npc_tkg31, _tkgMotions.watching_00, false)
    Sound:playSE("m06_002", 0.8)
    repeat
      wait()
    until _eventFlag.ep02_00140k_done
    Fn_findNpc(_npc_tkg31):move(L5_239, L2_236)
    waitNpcMoveEnd(_npc_tkg31)
    Fn_disappearNpc(_npc_tkg31, nil)
    _miner1_removed = true
  end)
end
function tkg32Action()
  local L0_240, L1_241, L2_242, L3_243, L4_244, L5_245
  L0_240 = {}
  L0_240.anim_walk_speed = 1
  L0_240.anim_run_speed = 1
  L0_240.runLength = -1
  L0_240.arrivedLength = 0
  L0_240.recast = true
  L1_241 = {}
  L1_241.anim_walk_speed = 1
  L1_241.anim_run_speed = 1
  L1_241.runLength = 99999
  L1_241.arrivedLength = 0
  L1_241.recast = true
  L2_242 = {}
  L2_242.startIndex = 1
  L2_242.goalDirection = true
  L3_243 = {
    L4_244,
    L5_245,
    {
      pos = "locator2_tkg32_03",
      opt = L0_240
    },
    {
      pos = "locator2_tkg32_04",
      opt = L0_240
    },
    {
      pos = "locator2_tkg32_05",
      opt = L0_240
    },
    {
      pos = "locator2_tkg32_06",
      opt = L0_240
    },
    {
      pos = "locator2_tkg32_07",
      opt = L0_240
    },
    {
      pos = "locator2_tkg32_08",
      opt = L0_240
    }
  }
  L4_244 = {}
  L4_244.pos = "locator2_tkg32_01"
  L4_244.opt = L0_240
  L5_245 = {}
  L5_245.pos = "locator2_tkg32_02"
  L5_245.opt = L0_240
  L4_244 = {
    L5_245,
    {
      pos = "locator2_tkg32_12",
      opt = L1_241
    }
  }
  L5_245 = {}
  L5_245.pos = "locator2_tkg32_11"
  L5_245.opt = L1_241
  L5_245 = {
    {
      pos = "locator2_tkg32_21",
      opt = L0_240
    }
  }
  Fn_setNpcVisible(_npc_tkg32, true)
  invokeTask(function()
    Fn_findNpc(_npc_tkg32):move(L3_243, L2_242)
    waitNpcMoveEnd(_npc_tkg32)
    Fn_playMotionNpc(_npc_tkg32, "scared_00", false)
    repeat
      wait()
    until _eventFlag.ep02_d_battle_ended
    Fn_findNpc(_npc_tkg32):move(L4_244, L2_242)
    waitNpcMoveEnd(_npc_tkg32)
    Fn_turnNpc(_npc_tkg32)
    Fn_playMotionNpc(_npc_tkg32, _tkgMotions.watching_00, false)
    repeat
      wait()
    until _eventFlag.ep02_00140k_done
    Fn_findNpc(_npc_tkg32):move(L5_245, L2_242)
    waitNpcMoveEnd(_npc_tkg32)
    Fn_disappearNpc(_npc_tkg32, nil)
    _miner2_removed = true
  end)
end
function tkg33Action()
  local L0_246, L1_247, L2_248, L3_249, L4_250
  L0_246 = {}
  L0_246.anim_walk_speed = 1
  L0_246.anim_run_speed = 1
  L0_246.runLength = -1
  L0_246.arrivedLength = 0
  L0_246.recast = true
  L1_247 = {}
  L1_247.startIndex = 1
  L1_247.goalDirection = true
  L2_248 = {
    L3_249,
    L4_250,
    {
      pos = "locator2_tkg33_03",
      opt = L0_246
    },
    {
      pos = "locator2_tkg33_04",
      opt = L0_246
    },
    {
      pos = "locator2_tkg33_05",
      opt = L0_246
    }
  }
  L3_249 = {}
  L3_249.pos = "locator2_tkg33_01"
  L3_249.opt = L0_246
  L4_250 = {}
  L4_250.pos = "locator2_tkg33_02"
  L4_250.opt = L0_246
  L3_249 = {
    L4_250,
    {
      pos = "locator2_tkg33_12",
      opt = L0_246
    },
    {
      pos = "locator2_tkg33_13",
      opt = L0_246
    },
    {
      pos = "locator2_tkg33_14",
      opt = L0_246
    }
  }
  L4_250 = {}
  L4_250.pos = "locator2_tkg33_11"
  L4_250.opt = L0_246
  L4_250 = {
    {
      pos = "locator2_tkg33_21",
      opt = L0_246
    }
  }
  Fn_setNpcVisible(_npc_tkg33, true)
  invokeTask(function()
    Fn_findNpc(_npc_tkg33):move(L2_248, L1_247)
    waitNpcMoveEnd(_npc_tkg33)
    Fn_playMotionNpc(_npc_tkg33, "scared_00", false)
    repeat
      wait()
    until _eventFlag.ep02_d_battle_ended
    Fn_findNpc(_npc_tkg33):move(L3_249, L1_247)
    waitNpcMoveEnd(_npc_tkg33)
    Fn_turnNpc(_npc_tkg33)
    Fn_playMotionNpc(_npc_tkg33, "accept_00", false)
    repeat
      wait()
    until _eventFlag.ep02_00140k_done
    Fn_findNpc(_npc_tkg33):move(L4_250, L1_247)
    waitNpcMoveEnd(_npc_tkg33)
    Fn_disappearNpc(_npc_tkg33, nil)
    _miner3_removed = true
  end)
end
function misaiAction()
  local L0_251
  L0_251 = {}
  for _FORV_4_ = 1, 7 do
    L0_251[_FORV_4_] = false
  end
  return invokeTask(function()
    local L0_252, L1_253, L2_254, L3_255, L4_256, L5_257, L6_258, L7_259, L8_260
    L0_252 = _misai_part_g1
    if not L0_252 then
      L0_252 = _misai_part_g2
      if not L0_252 then
        L0_252 = _misai_part_f
        if not L0_252 then
          L0_252 = Sound
          L1_253 = L0_252
          L0_252 = L0_252.playSE
          L2_254 = "mis021b_radio"
          L3_255 = 1
          L4_256 = ""
          L5_257 = Fn_findNpcPuppet
          L6_258 = _npc_misai
          L8_260 = L5_257(L6_258)
          L0_252(L1_253, L2_254, L3_255, L4_256, L5_257, L6_258, L7_259, L8_260, L5_257(L6_258))
          L0_252 = waitSeconds
          L1_253 = 0.5
          L0_252(L1_253)
          L0_252 = Fn_playMotionNpc
          L1_253 = _npc_misai
          L2_254 = "damage_middle_f_00"
          L3_255 = false
          L0_252(L1_253, L2_254, L3_255)
          L0_252 = waitNpcMotionEnd
          L1_253 = _npc_misai
          L0_252(L1_253)
          L0_252 = Fn_playMotionNpc
          L1_253 = _npc_misai
          L2_254 = "scared_00"
          L3_255 = false
          L0_252(L1_253, L2_254, L3_255)
          repeat
            L0_252 = wait
            L0_252()
            L0_252 = _misai_part_f
          until L0_252
        end
        L0_252 = {}
        L0_252.anim_walk_speed = 1
        L0_252.anim_run_speed = 1
        L0_252.runLength = -1
        L0_252.noTurn = false
        L0_252.recast = true
        L1_253 = {
          L2_254,
          L3_255,
          L4_256,
          L5_257,
          L6_258,
          L7_259
        }
        L2_254 = {}
        L2_254.pos = "locator2_misai_01"
        L2_254.opt = nil
        L3_255 = {}
        L3_255.pos = "locator2_misai_02"
        L3_255.opt = nil
        L4_256 = {}
        L4_256.pos = "locator2_misai_03"
        L4_256.opt = nil
        L5_257 = {}
        L5_257.pos = "locator2_misai_04"
        L5_257.opt = nil
        L6_258 = {}
        L6_258.pos = "locator2_misai_05"
        L6_258.opt = nil
        L7_259 = {}
        L7_259.pos = "locator2_misai_06"
        L7_259.opt = nil
        L2_254 = Player
        L3_255 = L2_254
        L2_254 = L2_254.getEnergy
        L4_256 = Player
        L4_256 = L4_256.kEnergy_Life
        L2_254 = L2_254(L3_255, L4_256)
        L3_255 = L2_254
        L4_256 = L3_255
        L5_257 = {}
        function L6_258(A0_261)
          if A0_261 == 0 then
            Fn_captionView("ep02_09002")
            Fn_playMotionNpc(_npc_misai, "scared_00", false)
            Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          elseif A0_261 < 0.2 then
            Fn_captionView("ep02_09003")
            Fn_playMotionNpc(_npc_misai, _misaiMotions.hurryup_00, false)
            Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          elseif A0_261 >= 0.2 and A0_261 < 0.5 then
            Fn_captionView("ep02_09004")
            Fn_playMotionNpc(_npc_misai, "call_00", false)
            Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          elseif A0_261 >= 0.5 then
            Fn_captionView("ep02_09005")
            Fn_playMotionNpc(_npc_misai, "scared_00", false)
            Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          elseif A0_261 >= 0.8 then
            Fn_captionView("ep02_09010")
            Fn_playMotionNpc(_npc_misai, "angry_00", false)
            Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          end
        end
        L5_257[1] = L6_258
        function L6_258()
          Fn_captionView("ep02_09006")
          Fn_playMotionNpc(_npc_misai, _misaiMotions.hurryup_00, false)
          Sound:playSE("mis_111", 1, "", Fn_findNpcPuppet(_npc_misai))
          L0_251[2] = true
        end
        L5_257[2] = L6_258
        function L6_258()
          Fn_captionView("ep02_09007")
          Fn_playMotionNpc(_npc_misai, _misaiMotions.reply_yes, false)
          Sound:playSE("mis_112", 1, "", Fn_findNpcPuppet(_npc_misai))
          L0_251[3] = true
        end
        L5_257[3] = L6_258
        function L6_258()
          Fn_captionView("ep02_09008")
          Fn_playMotionNpc(_npc_misai, "accept_00", false)
          Sound:playSE("mis_112", 1, "", Fn_findNpcPuppet(_npc_misai))
          L0_251[4] = true
        end
        L5_257[4] = L6_258
        function L6_258()
          Fn_captionView("ep02_09009")
          Fn_playMotionNpc(_npc_misai, _misaiMotions.cheer_00, false)
          Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          L0_251[5] = true
        end
        L5_257[5] = L6_258
        function L6_258()
          Fn_captionView("ep02_09010")
          Fn_playMotionNpc(_npc_misai, _misaiMotions.watching_00, false)
          Sound:playSE("mis_110", 1, "", Fn_findNpcPuppet(_npc_misai))
          L0_251[6] = true
        end
        L5_257[6] = L6_258
        function L6_258()
          Fn_captionView("ep02_09011")
          Fn_playMotionNpc(_npc_misai, "scared_00", false)
          Sound:playSE("mis_111", 1, "", Fn_findNpcPuppet(_npc_misai))
          L0_251[7] = true
        end
        L5_257[7] = L6_258
        L6_258 = Fn_moveNpc
        L7_259 = _npc_misai
        L8_260 = L1_253
        L6_258(L7_259, L8_260, L0_252)
        L6_258 = waitNpcMoveEnd
        L7_259 = _npc_misai
        L6_258(L7_259)
        L6_258 = Fn_turnNpc
        L7_259 = _npc_misai
        L6_258(L7_259)
        L6_258 = Fn_playMotionNpc
        L7_259 = _npc_misai
        L8_260 = "accept_00"
        L6_258(L7_259, L8_260, false)
        L6_258 = 3
        L7_259 = _MISAI_CHEER_WAIT
        while true do
          L8_260 = _misai_part_f3
          if not L8_260 then
            L7_259 = L7_259 - 1
            if L7_259 < 0 then
              L7_259 = 0
              _cheer_enable = true
            end
            L8_260 = Player
            L8_260 = L8_260.getEnergy
            L8_260 = L8_260(L8_260, Player.kEnergy_Life)
            L3_255 = L8_260
            L8_260 = isNpcMotionEnd
            L8_260 = L8_260(_npc_misai)
            if L8_260 then
              L8_260 = Fn_turnNpc
              L8_260(_npc_misai)
            end
            L8_260 = _wave4Start
            if L8_260 then
              L8_260 = L5_257[2]
              L8_260()
              L7_259 = _MISAI_CHEER_WAIT
              _wave4Start = false
              _cheer_enable = false
            elseif L4_256 > L3_255 then
              L8_260 = L5_257[1]
              L8_260(L3_255 / L2_254)
              L7_259 = _MISAI_CHEER_WAIT
              _cheer_enable = false
            else
              L8_260 = _cheer_enable
              if L8_260 then
                L8_260 = RandI
                L8_260 = L8_260(1, 10)
                if L8_260 < 10 then
                  L8_260 = L0_251[L6_258]
                  if not L8_260 then
                    L8_260 = L5_257[L6_258]
                    L8_260()
                  end
                  L6_258 = L6_258 + 1
                  if L6_258 > 6 then
                    L6_258 = 4
                  end
                  L7_259 = _MISAI_CHEER_WAIT
                  _cheer_enable = false
                end
              end
            end
            L4_256 = L3_255
            L8_260 = wait
            L8_260()
          end
        end
        L8_260 = {
          {
            pos = "locator2_sdemo6_misai_01",
            opt = nil
          },
          {
            pos = "locator2_sdemo6_misai_02",
            opt = nil
          },
          {
            pos = "locator2_sdemo6_misai_03",
            opt = nil
          }
        }
        Fn_moveNpc(_npc_misai, L8_260, L0_252)
        waitNpcMoveEnd(_npc_misai)
        Fn_captionView("ep02_09012")
        Sound:playSE("mis021c_radio", 1, "", Fn_findNpcPuppet(_npc_misai))
        waitSeconds(1)
        Fn_playMotionNpc(_npc_misai, "accept_00", false)
        waitSeconds(1)
        waitNpcMotionEnd(_npc_misai)
        repeat
          wait()
        until _misai_part_f4
        Fn_playMotionNpc(_npc_misai, "scared_00", false)
        Fn_captionView("ep02_09027")
        Sound:playSE("mis016b_radio", 1)
        waitSeconds(3)
      end
    end
    L0_252 = {}
    L0_252.anim_walk_speed = 1
    L0_252.anim_run_speed = 1
    L0_252.runLength = -1
    L0_252.noTurn = false
    L0_252.recast = true
    L1_253 = {L2_254, L3_255}
    L2_254 = {}
    L2_254.pos = "locator2_misai_05"
    L2_254.opt = nil
    L3_255 = {}
    L3_255.pos = "locator2_misai_06"
    L3_255.opt = nil
    L2_254 = {}
    L2_254.startIndex = 1
    L2_254.goalDirection = true
    L3_255 = Fn_moveNpc
    L4_256 = _npc_misai
    L5_257 = L1_253
    L6_258 = L0_252
    L7_259 = L2_254
    L3_255(L4_256, L5_257, L6_258, L7_259)
    L3_255 = waitNpcMoveEnd
    L4_256 = _npc_misai
    L3_255(L4_256)
    L3_255 = Fn_playMotionNpc
    L4_256 = _npc_misai
    L5_257 = "scared_00"
    L6_258 = false
    L3_255(L4_256, L5_257, L6_258)
    repeat
      L3_255 = wait
      L3_255()
      L3_255 = _misai_part_g2
    until L3_255
    L3_255 = {
      L4_256,
      L5_257,
      L6_258
    }
    L4_256 = {}
    L4_256.pos = "locator2_sdemo6_misai_01"
    L4_256.opt = nil
    L5_257 = {}
    L5_257.pos = "locator2_sdemo6_misai_02"
    L5_257.opt = nil
    L6_258 = {}
    L6_258.pos = "locator2_sdemo6_misai_03"
    L6_258.opt = nil
    L4_256 = Fn_moveNpc
    L5_257 = _npc_misai
    L6_258 = L3_255
    L7_259 = L0_252
    L4_256(L5_257, L6_258, L7_259)
    L4_256 = waitNpcMoveEnd
    L5_257 = _npc_misai
    L4_256(L5_257)
    L4_256 = Fn_captionView
    L5_257 = "ep02_09028"
    L4_256(L5_257)
    L4_256 = Sound
    L5_257 = L4_256
    L4_256 = L4_256.playSE
    L6_258 = "mis015c_radio"
    L7_259 = 0.8
    L4_256(L5_257, L6_258, L7_259)
    L4_256 = Fn_turnNpc
    L5_257 = _npc_misai
    L4_256(L5_257)
    L4_256 = Fn_playMotionNpc
    L5_257 = _npc_misai
    L6_258 = _misaiMotions
    L6_258 = L6_258.idle_00
    L7_259 = false
    L4_256(L5_257, L6_258, L7_259)
    L4_256 = waitNpcMotionEnd
    L5_257 = _npc_misai
    L4_256(L5_257)
  end)
end
function drillWork(A0_262, A1_263, A2_264, A3_265)
  local L4_266, L5_267, L6_268, L7_269, L8_270, L9_271
  L4_266 = A3_265 or L4_266(L5_267, L6_268)
  L5_267 = {}
  function L6_268()
    Fn_captionView("ep02_09016")
    Fn_playMotionNpc(A0_262, "accept_00", true)
  end
  L5_267[1] = L6_268
  function L6_268()
    Fn_captionView("ep02_09017")
    Fn_playMotionNpc(A0_262, "accept_00", true)
  end
  L5_267[2] = L6_268
  function L6_268()
    Fn_captionView("ep02_09018")
    Fn_playMotionNpc(A0_262, "accept_00", true)
  end
  L5_267[3] = L6_268
  L6_268 = {}
  function L7_269()
    Fn_captionView("ep02_09019")
    Fn_playMotionNpc(A0_262, "angry_00", true)
  end
  L6_268[1] = L7_269
  function L7_269()
    Fn_captionView("ep02_09020")
    Fn_playMotionNpc(A0_262, "angry_00", true)
  end
  L6_268[2] = L7_269
  function L7_269()
    Fn_captionView("ep02_09021")
    Fn_playMotionNpc(A0_262, "angry_00", true)
  end
  L6_268[3] = L7_269
  L7_269 = {}
  function L8_270()
    Fn_captionView("ep02_09022")
    Fn_playMotionNpc(A0_262, "angry_00", true)
  end
  L7_269[1] = L8_270
  function L8_270()
    Fn_captionView("ep02_09023")
    Fn_playMotionNpc(A0_262, "angry_00", true)
  end
  L7_269[2] = L8_270
  function L8_270()
    Fn_captionView("ep02_09024")
    Fn_playMotionNpc(A0_262, "angry_00", true)
  end
  L7_269[3] = L8_270
  L8_270 = isOreBroken
  L9_271 = A1_263
  L8_270 = L8_270(L9_271)
  if not L8_270 then
    L8_270 = waitNpcMotionEnd
    L9_271 = A0_262
    L8_270(L9_271)
    if A2_264 == 0 then
      L8_270 = Fn_playMotionNpc
      L9_271 = A0_262
      L8_270(L9_271, "dig_00", false)
    else
      L8_270 = Fn_playMotionNpc
      L9_271 = A0_262
      L8_270(L9_271, "dig_01", false)
    end
    L8_270 = Sound
    L9_271 = L8_270
    L8_270 = L8_270.playSEHandle
    L8_270 = L8_270(L9_271, "npc_drill_digging", 1, "", Fn_findNpcPuppet(A0_262))
    L9_271 = Sound
    L9_271 = L9_271.playSEHandle
    L9_271 = L9_271(L9_271, "npc_drill_idling", 1, "", Fn_findNpcPuppet(A0_262))
    while not isOreBroken(A1_263) and (A0_262 ~= _npc_tkg05 or not _eventFlag.request_misai_warp) do
      if isNpcMotionEnd(A0_262) then
        print(string.format("drillWork %s : %d ", A0_262, L4_266))
        L4_266 = L4_266 - 1
        if L4_266 < 0 then
          npcBreakOre(A0_262, getOreHandle(A1_263))
        end
        if A2_264 == 0 then
          Fn_playMotionNpc(A0_262, "dig_00", false)
        else
          Fn_playMotionNpc(A0_262, "dig_01", false)
        end
      end
      wait()
    end
    if Sound:isPlayingSEHandle(L8_270) == 1 then
      Sound:stopSEHandle(L8_270)
    end
    if Sound:isPlayingSEHandle(L9_271) == 1 then
      Sound:stopSEHandle(L9_271)
    end
    if Fn_createEffect("ef_ev_jkpar_01", "ef_ev_jkpar_01", {
      obj = Fn_findNpcPuppet(A0_262),
      joint = "bn_r_drill3"
    }, true) ~= nil then
      Fn_createEffect("ef_ev_jkpar_01", "ef_ev_jkpar_01", {
        obj = Fn_findNpcPuppet(A0_262),
        joint = "bn_r_drill3"
      }, true):stop()
      Fn_createEffect("ef_ev_jkpar_01", "ef_ev_jkpar_01", {
        obj = Fn_findNpcPuppet(A0_262),
        joint = "bn_r_drill3"
      }, true):kill()
    end
    if A0_262 == _npc_tkg05 and _eventFlag.request_misai_warp then
      print("\227\131\159\227\130\182\227\130\164\227\128\129\227\131\175\227\131\188\227\131\151\230\186\150\229\130\153\229\174\140\228\186\134")
      _eventFlag.misai_warp_ready = true
      return
    end
    if L4_266 >= 0 then
      Fn_playMotionNpc(A0_262, "damage_small_f_00", true)
      if _miner_caption_enable then
        if A0_262 == _npc_tkg05 then
          L6_268[RandI(#L6_268)]()
        elseif A0_262 == _npc_tkg08 or A0_262 == _npc_tkg09 or A0_262 == _npc_tkg10 then
          L7_269[RandI(#L7_269)]()
        else
          L5_267[RandI(#L5_267)]()
        end
      end
    else
      Fn_playMotionNpc(A0_262, "accept_00", true)
    end
  else
    L8_270 = Fn_playMotionNpc
    L9_271 = A0_262
    L8_270(L9_271, "stay", true)
  end
end
function workersChat(A0_272, A1_273, A2_274)
  local L3_275, L4_276, L5_277, L6_278, L7_279, L8_280, L9_281, L10_282
  L3_275 = 3
  L4_276 = 10
  L5_277 = getNpcPos
  L5_277 = L5_277(L6_278)
  for L9_281 = 1, L4_276 do
    L10_282 = _phase_b
    if L10_282 then
      return
    end
    L10_282 = getNpcPos
    L10_282 = L10_282(A1_273)
    if L3_275 > Fn_get_distance(L5_277, L10_282) then
      Fn_turnNpc(A0_272, Fn_findNpcPuppet(A1_273))
      Fn_playMotionNpc(A0_272, "accept_00", true)
      break
    end
    waitSeconds(1)
  end
  for L9_281 = 1, A2_274 do
    L10_282 = getNpcPos
    L10_282 = L10_282(A1_273)
    if L3_275 > Fn_get_distance(L5_277, L10_282) then
      Fn_playMotionNpc(A0_272, "talk_01", true)
    else
      break
    end
    waitSeconds(1)
  end
  L9_281 = L6_278
  if L3_275 > L7_279 then
    L9_281 = "accept_00"
    L10_282 = true
    L7_279(L8_280, L9_281, L10_282)
  end
end
