dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_ENEMYMARKER_RANGE = 50
_enemy_count = 0
_miner1_removed = false
_miner2_removed = false
_miner3_removed = false
_battle_ended = false
_next_phase = false
enmgen2_battle_d_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator2_enemy11_01",
      name = "enemy11"
    },
    {
      type = "stalker",
      locator = "locator2_enemy12_01",
      name = "enemy12"
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
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
    A0_10:getSpecTable().deadEnemies = A0_10:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {"enemy11", "enemy12"}, 2, _GEM.VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_battle_d_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_d2_01",
      name = "enemy21"
    },
    {
      type = "stalker",
      locator = "locator_d2_02",
      name = "enemy22"
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
  end,
  onObjectAsh = function(A0_24, A1_25)
  end,
  onObjectDead = function(A0_26, A1_27)
    A0_26:getSpecTable().deadEnemies = A0_26:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {"enemy21", "enemy22"}, 2, _GEM.VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
enmgen2_battle_d_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_d3_01",
      name = "speciald31"
    },
    {
      type = "gellyfish",
      locator = "locator_d3_02",
      name = "speciald32"
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
  end,
  onObjectAsh = function(A0_40, A1_41)
  end,
  onObjectDead = function(A0_42, A1_43)
    A0_42:getSpecTable().deadEnemies = A0_42:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
  end,
  onSetupGem = function(A0_44, A1_45)
    Fn_enemyPopGemSetup(A0_44, {"speciald31", "speciald32"}, 2, _GEM.VITAL)
  end,
  onPopGem = function(A0_46, A1_47)
    Fn_enemyAshPopGem(A0_46, A1_47)
  end
}
enmgen2_battle_d_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_d4_01",
      name = "speciald41"
    },
    {
      type = "gellyfish",
      locator = "locator_d4_02",
      name = "speciald42"
    },
    {
      type = "gellyfish",
      locator = "locator_d4_03",
      name = "speciald43"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onSpawn = function(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onObjectDead = function(A0_58, A1_59)
    A0_58:getSpecTable().deadEnemies = A0_58:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
  end
}
function Initialize()
  GlobalGem:SetVitalGemGetCallback("onGetVitalGem")
  HUD:enemymarkerSetRange(_ENEMYMARKER_RANGE)
end
function Ingame()
  local L0_60, L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71, L12_72, L13_73
  L0_60 = Fn_setCatWarpCheckPoint
  L1_61 = "locator2_pc_start_pos"
  L0_60(L1_61)
  L0_60 = findGameObject2
  L1_61 = "EnemyGenerator"
  L2_62 = "enmgen2_d_01"
  L0_60 = L0_60(L1_61, L2_62)
  if L0_60 ~= nil then
    L2_62 = L0_60
    L1_61 = L0_60.getSpecTable
    L1_61 = L1_61(L2_62)
    L1_61 = L1_61.spawnSet
    L1_61 = #L1_61
    _enemy_count = L1_61
    L2_62 = L0_60
    L1_61 = L0_60.setEnemyMarker
    L3_63 = false
    L1_61(L2_62, L3_63)
    while true do
      L2_62 = L0_60
      L1_61 = L0_60.isSpawnOnStartFinished
      L1_61 = L1_61(L2_62)
      if not L1_61 then
        L1_61 = wait
        L1_61()
      end
    end
    L2_62 = L0_60
    L1_61 = L0_60.requestIdlingEnemy
    L3_63 = true
    L1_61(L2_62, L3_63)
  end
  L1_61 = Player
  L2_62 = L1_61
  L1_61 = L1_61.setStay
  L3_63 = true
  L4_64 = false
  L1_61(L2_62, L3_63, L4_64)
  L1_61 = Fn_userCtrlOff
  L1_61()
  L1_61 = Fn_sendEventComSb
  L2_62 = "requestPartD"
  L3_63 = 1
  L1_61(L2_62, L3_63)
  L1_61 = waitComNextPhase
  L1_61()
  L1_61 = findGameObject2
  L2_62 = "EnemyBrain"
  L3_63 = "enemy11"
  L1_61 = L1_61(L2_62, L3_63)
  L2_62 = findGameObject2
  L3_63 = "EnemyBrain"
  L4_64 = "enemy12"
  L2_62 = L2_62(L3_63, L4_64)
  L3_63 = {
    L4_64,
    L5_65,
    L6_66
  }
  L4_64 = "locator2_enemy11_02"
  L5_65 = "locator2_enemy11_03"
  L6_66 = "locator2_enemy11_04"
  L4_64 = {
    L5_65,
    L6_66,
    L7_67
  }
  L5_65 = "locator2_enemy12_02"
  L6_66 = "locator2_enemy12_03"
  L7_67 = "locator2_enemy12_04"
  L5_65 = invokeTask
  function L6_66()
    waitSeconds(3)
    L1_61:move(L3_63)
    L2_62:move(L4_64)
  end
  L5_65(L6_66)
  L5_65 = Fn_missionStart
  L5_65()
  L5_65 = waitSeconds
  L6_66 = 2
  L5_65(L6_66)
  L5_65 = Fn_captionView
  L6_66 = "ep02_03000"
  L5_65(L6_66)
  L5_65 = Fn_sendEventComSb
  L6_66 = "requestPartD"
  L7_67 = 2
  L5_65(L6_66, L7_67)
  L5_65 = waitComNextPhase
  L5_65()
  L6_66 = L1_61
  L5_65 = L1_61.endScriptAction
  L5_65(L6_66)
  L6_66 = L2_62
  L5_65 = L2_62.endScriptAction
  L5_65(L6_66)
  L5_65 = Player
  L6_66 = L5_65
  L5_65 = L5_65.setStay
  L7_67 = false
  L5_65(L6_66, L7_67)
  L5_65 = Fn_userCtrlOn
  L5_65()
  L5_65 = waitSeconds
  L6_66 = 1
  L5_65(L6_66)
  _currentMissionText = "ep02_03003"
  L5_65 = Fn_missionView
  L6_66 = "ep02_03003"
  L5_65(L6_66)
  L6_66 = L0_60
  L5_65 = L0_60.setEnemyMarker
  L7_67 = true
  L5_65(L6_66, L7_67)
  L6_66 = L0_60
  L5_65 = L0_60.requestIdlingEnemy
  L7_67 = false
  L5_65(L6_66, L7_67)
  L5_65 = HUD
  L6_66 = L5_65
  L5_65 = L5_65.info
  L7_67 = "ep02_info_06"
  L8_68 = false
  L5_65(L6_66, L7_67, L8_68)
  L5_65 = Fn_tutorialCaption
  L6_66 = "battle_ep02_01"
  L5_65(L6_66)
  while true do
    L5_65 = _enemy_count
    if not (L5_65 <= 0) then
      L5_65 = findGameObject2
      L6_66 = "EnemyGenerator"
      L7_67 = "enmgen2_d_01"
      L5_65 = L5_65(L6_66, L7_67)
      if L5_65 ~= nil then
        L7_67 = L5_65
        L6_66 = L5_65.getSpecTable
        L6_66 = L6_66(L7_67)
        L6_66 = L6_66.deadEnemies
        if L6_66 >= 1 then
          L6_66 = Fn_tutorialCaptionKill
          L6_66()
        end
      end
      L6_66 = wait
      L6_66()
    end
  end
  L5_65 = Fn_tutorialCaptionKill
  L5_65()
  L5_65 = waitSeconds
  L6_66 = 2
  L5_65(L6_66)
  L5_65 = findGameObject2
  L6_66 = "EnemyGenerator"
  L7_67 = "enmgen2_d_02"
  L5_65 = L5_65(L6_66, L7_67)
  if L5_65 ~= nil then
    L7_67 = L5_65
    L6_66 = L5_65.getSpecTable
    L6_66 = L6_66(L7_67)
    L6_66 = L6_66.spawnSet
    L6_66 = #L6_66
    _enemy_count = L6_66
    L7_67 = L5_65
    L6_66 = L5_65.requestSpawn
    L6_66(L7_67)
  end
  L6_66 = Fn_tutorialCaption
  L7_67 = "battle_ep02_02"
  L6_66(L7_67)
  while true do
    L6_66 = _enemy_count
    if not (L6_66 <= 0) then
      L6_66 = findGameObject2
      L7_67 = "EnemyGenerator"
      L8_68 = "enmgen2_d_02"
      L6_66 = L6_66(L7_67, L8_68)
      if L6_66 ~= nil then
        L8_68 = L6_66
        L7_67 = L6_66.getSpecTable
        L7_67 = L7_67(L8_68)
        L7_67 = L7_67.deadEnemies
        if L7_67 >= 1 then
          L7_67 = Fn_tutorialCaptionKill
          L7_67()
        end
      end
      L7_67 = wait
      L7_67()
    end
  end
  L6_66 = Fn_tutorialCaptionKill
  L6_66()
  L6_66 = {L7_67, L8_68}
  L7_67 = Player
  L7_67 = L7_67.kAbility_Grab
  L8_68 = Player
  L8_68 = L8_68.kAbility_Throw
  L7_67 = Fn_unLockPlayerAbility
  L8_68 = L6_66
  L9_69 = nil
  L7_67(L8_68, L9_69)
  L7_67 = findGameObject2
  L8_68 = "EnemyGenerator"
  L9_69 = "enmgen2_d_03"
  L7_67 = L7_67(L8_68, L9_69)
  if L7_67 ~= nil then
    L9_69 = L7_67
    L8_68 = L7_67.getSpecTable
    L8_68 = L8_68(L9_69)
    L8_68 = L8_68.spawnSet
    L8_68 = #L8_68
    _enemy_count = L8_68
    L9_69 = L7_67
    L8_68 = L7_67.requestSpawn
    L8_68(L9_69)
  end
  L8_68 = Fn_captionViewWait
  L9_69 = "ep02_03006"
  L8_68(L9_69)
  L8_68 = waitSeconds
  L9_69 = 3
  L8_68(L9_69)
  L8_68 = HUD
  L9_69 = L8_68
  L8_68 = L8_68.info
  L10_70 = "ep02_info_13"
  L11_71 = false
  L8_68(L9_69, L10_70, L11_71)
  L8_68 = Fn_tutorialCaption
  L9_69 = "ep02_grab"
  L8_68(L9_69)
  while true do
    L8_68 = _enemy_count
    if not (L8_68 <= 0) then
      L8_68 = findGameObject2
      L9_69 = "EnemyGenerator"
      L10_70 = "enmgen2_d_03"
      L8_68 = L8_68(L9_69, L10_70)
      if L8_68 ~= nil then
        L10_70 = L8_68
        L9_69 = L8_68.getSpecTable
        L9_69 = L9_69(L10_70)
        L9_69 = L9_69.deadEnemies
        if L9_69 >= 1 then
          L9_69 = Fn_tutorialCaptionKill
          L9_69()
        end
      end
      L9_69 = wait
      L9_69()
    end
  end
  L8_68 = Fn_tutorialCaptionKill
  L8_68()
  L8_68 = Fn_tutorialCaption
  L9_69 = "ep02_grab"
  L8_68(L9_69)
  L8_68 = findGameObject2
  L9_69 = "EnemyGenerator"
  L10_70 = "enmgen2_d_04"
  L8_68 = L8_68(L9_69, L10_70)
  if L8_68 ~= nil then
    L10_70 = L8_68
    L9_69 = L8_68.getSpecTable
    L9_69 = L9_69(L10_70)
    L9_69 = L9_69.spawnSet
    L9_69 = #L9_69
    _enemy_count = L9_69
    L10_70 = L8_68
    L9_69 = L8_68.requestSpawn
    L9_69(L10_70)
  end
  L9_69 = 300
  while true do
    L10_70 = _enemy_count
    if not (L10_70 <= 0) then
      L10_70 = findGameObject2
      L11_71 = "EnemyGenerator"
      L12_72 = "enmgen2_d_04"
      L10_70 = L10_70(L11_71, L12_72)
      if L10_70 ~= nil then
        L12_72 = L10_70
        L11_71 = L10_70.getSpecTable
        L11_71 = L11_71(L12_72)
        L11_71 = L11_71.deadEnemies
        if L11_71 >= 1 then
          L11_71 = Fn_tutorialCaptionKill
          L11_71()
        end
      end
      L9_69 = L9_69 - 1
      if L9_69 < 0 then
        L11_71 = Fn_tutorialCaptionKill
        L11_71()
      end
      L11_71 = wait
      L11_71()
    end
  end
  L10_70 = Fn_tutorialCaptionKill
  L10_70()
  L10_70 = HUD
  L11_71 = L10_70
  L10_70 = L10_70.blackout
  L12_72 = 0
  L10_70(L11_71, L12_72)
  _battle_ended = true
  L10_70 = Fn_sendEventComSb
  L11_71 = "notify"
  L12_72 = "ep02_d_battle_ended"
  L13_73 = _battle_ended
  L10_70(L11_71, L12_72, L13_73)
  L10_70 = Fn_userCtrlOff
  L10_70()
  L10_70 = findGameObject2
  L11_71 = "Node"
  L12_72 = "locator2_pc_pos_02"
  L10_70 = L10_70(L11_71, L12_72)
  L11_71 = L10_70
  L10_70 = L10_70.getWorldTransform
  L11_71 = L10_70(L11_71)
  L12_72 = Fn_setPcPosRot
  L13_73 = L10_70
  L12_72(L13_73, L11_71)
  L12_72 = Player
  L13_73 = L12_72
  L12_72 = L12_72.setSituation
  L12_72(L13_73, Player.kSituation_Normal, true, 0, false, false)
  L12_72 = Fn_sendEventComSb
  L13_73 = "requestPartD"
  L12_72(L13_73, 3)
  L12_72 = waitComNextPhase
  L12_72()
  L12_72 = HUD
  L13_73 = L12_72
  L12_72 = L12_72.fadein
  L12_72(L13_73, 0)
  L12_72 = waitSeconds
  L13_73 = 3
  L12_72(L13_73)
  L12_72 = Fn_sendEventComSb
  L13_73 = "playPlayerMotion"
  L12_72(L13_73, "kit01_greeting_00")
  L12_72 = waitSeconds
  L13_73 = 2
  L12_72(L13_73)
  L12_72 = Player
  L13_73 = L12_72
  L12_72 = L12_72.setSituation
  L12_72(L13_73, Player.kSituation_Normal, true, 1, true, false)
  L12_72 = Fn_kaiwaDemoView
  L13_73 = "ep02_00140k"
  L12_72(L13_73)
  L12_72 = Fn_sendEventComSb
  L13_73 = "requestPartD"
  L12_72(L13_73, 4)
  L12_72 = waitComNextPhase
  L12_72()
  L12_72 = Fn_userCtrlOn
  L12_72()
  L12_72 = Fn_setKeepPlayerPos
  L12_72()
  L12_72 = Fn_setNextMissionFlag
  L12_72()
  L12_72 = Fn_nextMission
  L12_72()
  L12_72 = Fn_exitSandbox
  L12_72()
end
function Finalize()
  local L0_74, L1_75
end
function pccubesensor2_warp_d_OnEnter()
  local L0_76, L1_77
end
function pccubesensor2_warp_d_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep02_02020")
    Fn_missionView(_currentMissionText)
  end)
end
