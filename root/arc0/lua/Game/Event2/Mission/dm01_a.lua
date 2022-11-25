dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm01_common.lua")
import("Camera")
RUFFIAN_BATTLE_END_NUM = 2
TUTORIAL_ENEMY_NUM = 2
MACHINE_ENEMY_NUM = 5
LB_ENEMY_INDEX = 6
GORO_MOTION = {
  stay_01 = "man27_stay_fighting_00",
  stay_02 = "man27_stay_01",
  run_01 = "man01_run_afraid_00",
  run_02 = "man01_run_afraid_01",
  talk_01 = "man01_talk_angry_00",
  talk_02 = "man01_talk_laugh_00",
  talk_03 = "man01_talk_laugh_01",
  kick = "man27_dlc_gravcollector_00",
  surprise = "man01_surprise_00",
  lookback = "man01_lookback_watch_01"
}
_isJoinBackupRuffian_01 = false
_isJoinBackupRuffian_02 = false
_backupRuffians = {}
_is_dead = {}
_sdemoRuffiansEntry = nil
_sdemoEnergyCollection = nil
_sdemoNeviEntry = nil
_enmgen__ruffianCnt = 0
_goroTable_01 = {"goro_01_01", "goro_01_02"}
_goroTable_02 = {
  "goro_01",
  "goro_02",
  "goro_03",
  "goro_04",
  "goro_05"
}
enmgen2_bokan_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  onObjectAsh = function(A0_0, A1_1)
    local L2_2
    L2_2 = _enmgen__ruffianCnt
    L2_2 = L2_2 - 1
    _enmgen__ruffianCnt = L2_2
    L2_2 = _is_dead
    L2_2[A1_1:getName()] = true
  end
}
enmgen2_bokan_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  onObjectAsh = function(A0_3, A1_4)
    local L2_5
    L2_5 = _enmgen__ruffianCnt
    L2_5 = L2_5 - 1
    _enmgen__ruffianCnt = L2_5
    L2_5 = _is_dead
    L2_5[A1_4:getName()] = true
  end
}
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_04_01",
      name = "pawn04_01"
    },
    {
      type = "stalker",
      locator = "locator_04_02",
      name = "pawn04_02"
    },
    {
      type = "stalker",
      locator = "locator_04_03",
      name = "pawn04_03"
    }
  }
}
function Initialize()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11
  L0_6 = {
    L1_7,
    L2_8,
    L3_9,
    L4_10,
    L5_11,
    {
      name = "goro_04",
      type = "thug05",
      node = "locator2_bokan_04"
    },
    {
      name = "goro_05",
      type = "thug05",
      node = "locator2_bokan_05",
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "goro_art_01",
      type = "thug04",
      node = "locator2_bokan_04",
      active = false
    },
    {
      name = "goro_art_02",
      type = "thug05",
      node = "locator2_bokan_05",
      color_variation = 2,
      hair_variation = 1,
      active = false
    }
  }
  L1_7.name = "goro_01_01"
  L1_7.type = "thug04"
  L1_7.node = "locator2_bokan_01_01"
  L1_7.color_variation = 2
  L1_7.hair_variation = 1
  L2_8.name = "goro_01_02"
  L2_8.type = "thug05"
  L2_8.node = "locator2_bokan_01_02"
  L2_8.color_variation = 3
  L2_8.hair_variation = 0
  L3_9.name = "goro_01"
  L3_9.type = "thug04"
  L3_9.node = "locator2_bokan_01"
  L3_9.color_variation = 2
  L3_9.hair_variation = 0
  L4_10 = {}
  L4_10.name = "goro_02"
  L4_10.type = "thug04"
  L4_10.node = "locator2_bokan_02"
  L4_10.color_variation = 1
  L4_10.hair_variation = 1
  L5_11 = {}
  L5_11.name = "goro_03"
  L5_11.type = "thug04"
  L5_11.node = "locator2_bokan_03"
  L1_7(L2_8)
  for L4_10, L5_11 in L1_7(L2_8) do
    Fn_loadNpcEventMotion(L5_11.name, GORO_MOTION)
  end
  _sdemoRuffiansEntry = L1_7
  L4_10 = "Node"
  L5_11 = "locator2_cam_01"
  L4_10 = findGameObject2
  L5_11 = "Node"
  L4_10 = L4_10(L5_11, "locator2_aim_01")
  L5_11 = false
  L1_7(L2_8, L3_9, L4_10, L5_11)
  _sdemoNeviEntry = L1_7
  L4_10 = "Node"
  L5_11 = "locator2_cam_nevi_02"
  L4_10 = findGameObject2
  L5_11 = "Node"
  L4_10 = L4_10(L5_11, "locator2_aim_nevi")
  L5_11 = false
  L1_7(L2_8, L3_9, L4_10, L5_11)
  _sdemoEnergyCollection = L1_7
  L4_10 = "Node"
  L5_11 = "locator2_cam_02"
  L4_10 = findGameObject2
  L5_11 = "Node"
  L4_10 = L4_10(L5_11, "locator2_aim_02")
  L5_11 = false
  L1_7(L2_8, L3_9, L4_10, L5_11)
  _backupRuffians = L1_7
  for L4_10, L5_11 in L1_7(L2_8) do
    _backupRuffians[L4_10] = Fn_findNpc(L5_11)
  end
  for L4_10, L5_11 in L1_7(L2_8) do
    table.insert(_backupRuffians, Fn_findNpc(L5_11))
  end
  L1_7(L2_8)
  L1_7(L2_8)
  L1_7(L2_8)
  L4_10 = "pccubesensor2_area_out_near"
  L5_11 = "pccubesensor2_area_out_long"
  L1_7(L2_8, L3_9, L4_10, L5_11, "locator2_pc_start_pos", "locator2_pc_start_pos", nil, "dm01_00113")
  L1_7()
end
function Ingame()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19
  L0_12 = findGameObject2
  L1_13 = "EnemyGenerator"
  L2_14 = "enmgen2_bokan_02"
  L0_12 = L0_12(L1_13, L2_14)
  L1_13 = findGameObject2
  L2_14 = "EnemyGenerator"
  L1_13 = L1_13(L2_14, L3_15)
  L2_14 = findGameObject2
  L2_14 = L2_14(L3_15, L4_16)
  for L6_18 = L3_15 + 1, L4_16 - 1 do
    L7_19 = _backupRuffians
    L7_19 = L7_19[L6_18]
    L7_19 = L7_19.setEventListener
    L7_19(L7_19, "npcDamaged", function(A0_20)
      local L3_21
      for _FORV_4_ = L3_21 + 1, LB_ENEMY_INDEX - 1 do
        ChangeNpcToEnemy(_backupRuffians[_FORV_4_], L1_13)
      end
      _isJoinBackupRuffian_01 = true
    end)
  end
  for L6_18 = LB_ENEMY_INDEX, #L4_16 do
    L7_19 = _backupRuffians
    L7_19 = L7_19[L6_18]
    L7_19 = L7_19.setEventListener
    L7_19(L7_19, "npcDamaged", function(A0_22)
      local L1_23, L3_24
      for _FORV_4_ = 1, #L3_24 do
        ChangeNpcToEnemy(_backupRuffians[_FORV_4_], L1_13)
      end
      _isJoinBackupRuffian_02 = true
    end)
  end
  L3_15(L4_16)
  L3_15()
  L3_15()
  L3_15(L4_16)
  L3_15()
  L7_19 = ""
  L3_15(L4_16, L5_17, L6_18, L7_19)
  L3_15(L4_16)
  L3_15(L4_16, L5_17)
  L3_15(L4_16, L5_17)
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15()
  for L6_18 = 1, TUTORIAL_ENEMY_NUM do
    L7_19 = ChangeNpcToEnemy
    L7_19(_backupRuffians[L6_18], L0_12)
  end
  while true do
    if L3_15 > 0 then
      L3_15()
    end
  end
  L3_15()
  L3_15()
  L3_15(L4_16)
  if L3_15 == false then
    for L6_18 = L3_15 + 1, L4_16 - 1 do
      L7_19 = ChangeNpcToEnemy
      L7_19(_backupRuffians[L6_18], L1_13)
    end
  else
    for L6_18 = 1, #L4_16 do
      L7_19 = ChangeNpcToEnemy
      L7_19(_backupRuffians[L6_18], L1_13)
    end
  end
  while true do
    if L3_15 > 0 then
      L3_15()
    end
  end
  for L6_18 = 1, #L4_16 do
    L7_19 = ChangeNpcToEnemy
    L7_19(_backupRuffians[L6_18], L1_13)
  end
  while true do
    if L3_15 > L4_16 then
      L3_15()
    end
  end
  L3_15(L4_16, L5_17)
  L3_15(L4_16, L5_17)
  L3_15()
  L3_15()
  for L7_19, _FORV_8_ in L4_16(L5_17) do
    if not _FORV_8_:isNpc() then
      _FORV_8_:changeNpc()
      while not _FORV_8_:isNpc() do
        wait()
      end
    end
    _FORV_8_:reset()
    if _is_dead[_FORV_8_:getName()] == true then
      Fn_setNpcActive(_FORV_8_:getName(), false)
    else
      table.insert(L3_15, _FORV_8_:getName())
    end
  end
  if L4_16 == 0 then
    L3_15[1] = "goro_art_01"
    L3_15[2] = "goro_art_02"
  elseif L4_16 == 1 then
    L3_15[2] = "goro_art_02"
  end
  L4_16(L5_17)
  L4_16(L5_17, L6_18)
  L4_16(L5_17, L6_18)
  L4_16(L5_17, L6_18)
  L4_16(L5_17, L6_18)
  L7_19 = false
  L4_16(L5_17, L6_18, L7_19, {animBlendDuration = 0.3})
  L4_16(L5_17)
  L4_16()
  L7_19 = false
  L4_16(L5_17, L6_18, L7_19, {animBlendDuration = 0.3})
  L4_16(L5_17)
  L4_16(L5_17, L6_18)
  L4_16(L5_17)
  L4_16(L5_17)
  L7_19 = {}
  L7_19.pos = "locator2_cam_nevi_01"
  L7_19.time = 2
  L7_19.hashfunc = "EaseInOut"
  L7_19 = nil
  L4_16(L5_17, L6_18, L7_19)
  L7_19 = 1
  L4_16(L5_17, L6_18, L7_19)
  L7_19 = false
  L4_16(L5_17, L6_18, L7_19, {animBlendDuration = 0.3, isStop = true})
  L4_16(L5_17)
  L7_19 = "locator2_bokan_run_01"
  L4_16(L5_17, L6_18, L7_19)
  L7_19 = 1
  L4_16(L5_17, L6_18, L7_19)
  L4_16(L5_17)
  L7_19 = true
  L4_16(L5_17, L6_18, L7_19, {animBlendDuration = 0.3, isStop = true})
  L4_16(L5_17)
  L7_19 = "locator2_bokan_run_02"
  L4_16(L5_17, L6_18, L7_19)
  L4_16(L5_17)
  L4_16(L5_17)
  L4_16(L5_17, L6_18)
  L4_16(L5_17)
  L4_16(L5_17)
  L4_16()
  L4_16(L5_17, L6_18)
  L7_19 = "enmgen2_nevi_01"
  L4_16(L5_17, L6_18, L7_19)
  L4_16(L5_17, L6_18)
  L4_16(L5_17)
  L4_16(L5_17)
  L4_16(L5_17)
  L7_19 = 1
  L4_16(L5_17, L6_18, L7_19)
  L4_16(L5_17)
  repeat
    L4_16()
  until L4_16 == 0
  L4_16(L5_17)
  L4_16(L5_17, L6_18)
  L4_16()
  L4_16(L5_17)
  L4_16(L5_17, L6_18)
  L4_16(L5_17)
  L4_16(L5_17)
  L4_16(L5_17, L6_18)
  L7_19 = nil
  L4_16(L5_17, L6_18, L7_19)
  L4_16(L5_17)
  L4_16(L5_17)
  L7_19 = "Node"
  L7_19 = L6_18(L7_19, "locator2_machine_01")
  L4_16(L5_17, L6_18, L7_19, L6_18(L7_19, "locator2_machine_01"))
  L4_16()
  L4_16(L5_17)
  while true do
    if L4_16 == false then
      L4_16()
    end
  end
  L4_16()
  L7_19 = L6_18
  L7_19 = 15
  L4_16(L5_17, L6_18, L7_19)
  L4_16()
  L4_16()
  L4_16(L5_17)
  L7_19 = L4_16
  L6_18(L7_19, L5_17, Player.kReset_Falling)
  L6_18()
  L7_19 = "dm01_00125"
  L6_18(L7_19)
  L7_19 = 2
  L6_18(L7_19)
  L7_19 = L6_18
  L6_18(L7_19)
  L7_19 = false
  L6_18(L7_19)
  L6_18()
  L6_18()
  L6_18()
  L6_18()
end
function Finalize()
  endEngineSE()
  endEngineEffect()
  RAC_endCatWarpControl("dm01_a_area_out")
  for _FORV_3_, _FORV_4_ in ipairs(_backupRuffians) do
    Fn_disappearNpc(_FORV_4_:getName())
  end
end
function playGoroMotion()
  Fn_playMotionNpc("goro_01", GORO_MOTION.talk_01, false, {animBlendDuration = 0.3, isRepeat = true})
  Fn_playMotionNpc("goro_02", GORO_MOTION.talk_02, false, {animBlendDuration = 0.3, isRepeat = true})
  Fn_playMotionNpc("goro_03", GORO_MOTION.talk_03, false, {animBlendDuration = 0.3, isRepeat = true})
  Fn_playMotionNpc("goro_04", GORO_MOTION.kick, false, {animBlendDuration = 0.3, isRepeat = true})
  Fn_playMotionNpc("goro_05", GORO_MOTION.stay_02, false, {animBlendDuration = 0.3, isRepeat = true})
end
function ChangeNpcToEnemy(A0_25, A1_26)
  if not A0_25:isEnemy() then
    A0_25:changeEnemy()
    _enmgen__ruffianCnt = _enmgen__ruffianCnt + 1
  end
  while not A0_25:isEnemy() do
    wait()
  end
  A0_25:setEnemyGenerator(A1_26)
  A0_25:setEnemyGeneratorBattle(A1_26)
end
function RevertGoro(A0_27, A1_28)
  local L2_29
  L2_29 = {A1_28}
  invokeTask(function()
    Fn_moveNpc(A0_27, L2_29, {
      runLength = -1,
      anim_run = GORO_MOTION.run_01,
      noTurn = true
    })
    waitSeconds(5)
    Fn_disappearNpc(A0_27)
  end)
end
function pccubesensor2_bokan_01_OnEnter()
  local L0_30, L1_31
  _isJoinBackupRuffian_01 = true
end
function pccubesensor2_bokan_02_OnEnter()
  local L0_32, L1_33
  _isJoinBackupRuffian_02 = true
end
