dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
import("GlobalGem")
_enemyCount = 0
_isVitalGemInfoFinished = false
_isSpGemGet = false
_GEM = {
  SMALL = 1,
  MIDDLE = 2,
  LARGE = 3,
  ENERGY = 4,
  VITAL = 5,
  SPECIAL = 6
}
enmgen2_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator2_enemy_01",
      name = "enemy01"
    },
    {
      type = "stalker",
      locator = "locator2_enemy_02",
      name = "enemy02"
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
    _enemyCount = _enemyCount - 1
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {"enemy01", "enemy02"}, 2, _GEM.VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator2_enemy_03",
      name = "enemy03"
    },
    {
      type = "gellyfish",
      locator = "locator2_enemy_04",
      name = "enemy04"
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
    _enemyCount = _enemyCount - 1
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {"enemy03", "enemy04"}, 2, _GEM.VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator2_enemy_05",
      name = "enemy05"
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
    _enemyCount = _enemyCount - 1
  end,
  onSetupGem = function(A0_44, A1_45)
    Fn_enemyPopGemSetup(A0_44, {"enemy05"}, 1, _GEM.VITAL)
  end,
  onPopGem = function(A0_46, A1_47)
    Fn_enemyAshPopGem(A0_46, A1_47)
  end
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator2_enemy_06",
      name = "enemy06"
    },
    {
      type = "imp",
      locator = "locator2_enemy_07",
      name = "enemy07"
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
    _enemyCount = _enemyCount - 1
  end,
  onSetupGem = function(A0_60, A1_61)
    Fn_enemyPopGemSetup(A0_60, {"enemy06", "enemy07"}, 2, _GEM.VITAL)
  end,
  onPopGem = function(A0_62, A1_63)
    Fn_enemyAshPopGem(A0_62, A1_63)
  end
}
enmgen2_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator2_enemy_08",
      name = "enemy08"
    },
    {
      type = "gellyfish",
      locator = "locator2_enemy_09",
      name = "enemy09"
    },
    {
      type = "gellyfish",
      locator = "locator2_enemy_10",
      name = "enemy10"
    },
    {
      type = "gellyfish",
      locator = "locator2_enemy_11",
      name = "enemy11"
    },
    {
      type = "gellyfish",
      locator = "locator2_enemy_12",
      name = "enemy12"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_64)
    local L1_65
  end,
  onEnter = function(A0_66)
    local L1_67
  end,
  onLeave = function(A0_68)
    local L1_69
  end,
  onSpawn = function(A0_70, A1_71)
  end,
  onObjectAsh = function(A0_72, A1_73)
  end,
  onObjectDead = function(A0_74, A1_75)
    A0_74:getSpecTable().deadEnemies = A0_74:getSpecTable().deadEnemies + 1
    _enemyCount = _enemyCount - 1
  end,
  onSetupGem = function(A0_76, A1_77)
  end,
  onPopGem = function(A0_78, A1_79)
  end
}
enmgen2_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator2_enemy_13",
      name = "enemy13"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_80)
    local L1_81
  end,
  onEnter = function(A0_82)
    local L1_83
  end,
  onLeave = function(A0_84)
    local L1_85
  end,
  onSpawn = function(A0_86, A1_87)
  end,
  onObjectAsh = function(A0_88, A1_89)
  end,
  onObjectDead = function(A0_90, A1_91)
    A0_90:getSpecTable().deadEnemies = A0_90:getSpecTable().deadEnemies + 1
    _enemyCount = _enemyCount - 1
  end,
  onSetupGem = function(A0_92, A1_93)
    Fn_enemyPopGemSetup(A0_92, {"enemy13"}, 1, _GEM.VITAL)
  end,
  onPopGem = function(A0_94, A1_95)
    Fn_enemyAshPopGem(A0_94, A1_95)
  end
}
function Initialize()
  GlobalGem:SetVitalGemGetCallback("onGetVitalGem")
  GlobalGem:SetSpecialGemGetCallback("onGetSpGem")
  Fn_userCtrlOff()
end
function Ingame()
  local L0_96, L1_97, L2_98, L3_99, L4_100, L5_101, L6_102, L7_103, L8_104, L9_105, L10_106, L11_107, L12_108
  L0_96 = {
    L1_97,
    L2_98,
    L3_99,
    L4_100,
    L5_101,
    L6_102
  }
  L1_97 = Player
  L1_97 = L1_97.kAbility_Dodge
  L2_98 = Player
  L2_98 = L2_98.kAbility_KickCombo
  L3_99 = Player
  L3_99 = L3_99.kAbility_GravityKick
  L4_100 = Player
  L4_100 = L4_100.kAbility_Grab
  L5_101 = Player
  L5_101 = L5_101.kAbility_SpAttack
  L6_102 = Player
  L6_102 = L6_102.kAbility_AttrTuneSwitch
  L1_97 = Fn_lockPlayerAbility
  L2_98 = L0_96
  L3_99 = nil
  L1_97(L2_98, L3_99)
  L1_97 = Fn_missionStart
  L1_97()
  L1_97 = Fn_userCtrlOff
  L1_97()
  L1_97 = findGameObject2
  L2_98 = "EnemyGenerator"
  L3_99 = "enmgen2_01"
  L1_97 = L1_97(L2_98, L3_99)
  L3_99 = L1_97
  L2_98 = L1_97.requestIdlingEnemy
  L4_100 = true
  L2_98(L3_99, L4_100)
  L3_99 = L1_97
  L2_98 = L1_97.getSpecTable
  L2_98 = L2_98(L3_99)
  L2_98 = L2_98.spawnSet
  L2_98 = #L2_98
  _enemyCount = L2_98
  L2_98 = findGameObject2
  L3_99 = "Puppet"
  L4_100 = "enemy01"
  L2_98 = L2_98(L3_99, L4_100)
  L3_99 = Fn_lookAtObject
  L4_100 = L2_98
  L3_99 = L3_99(L4_100)
  L4_100 = waitSeconds
  L5_101 = 1.5
  L4_100(L5_101)
  L4_100 = Fn_missionView
  L5_101 = "\227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\155\239\188\129"
  L4_100(L5_101)
  L4_100 = waitSeconds
  L5_101 = 1.3
  L4_100(L5_101)
  L5_101 = L3_99
  L4_100 = L3_99.abort
  L4_100(L5_101)
  L4_100 = {L5_101, L6_102}
  L5_101 = Player
  L5_101 = L5_101.kAbility_Dodge
  L6_102 = Player
  L6_102 = L6_102.kAbility_KickCombo
  L5_101 = Fn_unLockPlayerAbility
  L6_102 = L4_100
  L7_103 = nil
  L5_101(L6_102, L7_103)
  L5_101 = Fn_userCtrlOn
  L5_101()
  L5_101 = waitSeconds
  L6_102 = 2.5
  L5_101(L6_102)
  L6_102 = L1_97
  L5_101 = L1_97.requestIdlingEnemy
  L7_103 = false
  L5_101(L6_102, L7_103)
  L5_101 = Fn_tutorialCaption
  L6_102 = "battle_ep02_01"
  L5_101(L6_102)
  while true do
    L5_101 = _enemyCount
    L7_103 = L1_97
    L6_102 = L1_97.getSpecTable
    L6_102 = L6_102(L7_103)
    L6_102 = L6_102.spawnSet
    L6_102 = #L6_102
    if L5_101 == L6_102 then
      L5_101 = wait
      L5_101()
    end
  end
  L5_101 = Fn_tutorialCaptionKill
  L5_101()
  L5_101 = waitSeconds
  L6_102 = 0.5
  L5_101(L6_102)
  L5_101 = Fn_tutorialCaption
  L6_102 = "battle_ep02_02"
  L5_101(L6_102)
  L5_101 = HUD
  L6_102 = L5_101
  L5_101 = L5_101.info
  L7_103 = "ep02_info_08"
  L8_104 = false
  L5_101(L6_102, L7_103, L8_104)
  while true do
    L5_101 = _enemyCount
    if L5_101 > 0 then
      L5_101 = wait
      L5_101()
    end
  end
  L5_101 = Sound
  L6_102 = L5_101
  L5_101 = L5_101.playSE
  L7_103 = "success"
  L5_101(L6_102, L7_103)
  L5_101 = Fn_tutorialCaptionKill
  L5_101()
  L5_101 = waitSeconds
  L6_102 = 2
  L5_101(L6_102)
  L5_101 = findGameObject2
  L6_102 = "EnemyGenerator"
  L7_103 = "enmgen2_02"
  L5_101 = L5_101(L6_102, L7_103)
  L1_97 = L5_101
  if L1_97 ~= nil then
    L6_102 = L1_97
    L5_101 = L1_97.getSpecTable
    L5_101 = L5_101(L6_102)
    L5_101 = L5_101.spawnSet
    L5_101 = #L5_101
    _enemyCount = L5_101
    L6_102 = L1_97
    L5_101 = L1_97.requestSpawn
    L5_101(L6_102)
  end
  L6_102 = L1_97
  L5_101 = L1_97.requestIdlingEnemy
  L7_103 = true
  L5_101(L6_102, L7_103)
  L5_101 = findGameObject2
  L6_102 = "Puppet"
  L7_103 = "enemy03"
  L5_101 = L5_101(L6_102, L7_103)
  L6_102 = Fn_lookAtObject
  L7_103 = L5_101
  L6_102 = L6_102(L7_103)
  L7_103 = waitSeconds
  L8_104 = 1.5
  L7_103(L8_104)
  L7_103 = Fn_missionView
  L8_104 = "\227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\155\239\188\129"
  L7_103(L8_104)
  L7_103 = waitSeconds
  L8_104 = 1.3
  L7_103(L8_104)
  L8_104 = L6_102
  L7_103 = L6_102.abort
  L7_103(L8_104)
  L7_103 = {L8_104}
  L8_104 = Player
  L8_104 = L8_104.kAbility_GravityKick
  L4_100 = L7_103
  L7_103 = Fn_unLockPlayerAbility
  L8_104 = L4_100
  L9_105 = nil
  L7_103(L8_104, L9_105)
  L7_103 = Fn_userCtrlOn
  L7_103()
  L7_103 = waitSeconds
  L8_104 = 2.5
  L7_103(L8_104)
  L8_104 = L1_97
  L7_103 = L1_97.requestIdlingEnemy
  L9_105 = false
  L7_103(L8_104, L9_105)
  L7_103 = Fn_tutorialCaption
  L8_104 = "battle_ep02_03"
  L7_103(L8_104)
  while true do
    L7_103 = _enemyCount
    if L7_103 > 0 then
      L7_103 = wait
      L7_103()
    end
  end
  L7_103 = Sound
  L8_104 = L7_103
  L7_103 = L7_103.playSE
  L9_105 = "success"
  L7_103(L8_104, L9_105)
  L7_103 = waitSeconds
  L8_104 = 2
  L7_103(L8_104)
  L7_103 = findGameObject2
  L8_104 = "EnemyGenerator"
  L9_105 = "enmgen2_03"
  L7_103 = L7_103(L8_104, L9_105)
  L1_97 = L7_103
  if L1_97 ~= nil then
    L8_104 = L1_97
    L7_103 = L1_97.getSpecTable
    L7_103 = L7_103(L8_104)
    L7_103 = L7_103.spawnSet
    L7_103 = #L7_103
    _enemyCount = L7_103
    L8_104 = L1_97
    L7_103 = L1_97.requestSpawn
    L7_103(L8_104)
  end
  L8_104 = L1_97
  L7_103 = L1_97.requestIdlingEnemy
  L9_105 = true
  L7_103(L8_104, L9_105)
  L7_103 = findGameObject2
  L8_104 = "Puppet"
  L9_105 = "enemy05"
  L7_103 = L7_103(L8_104, L9_105)
  L8_104 = Fn_lookAtObject
  L9_105 = L7_103
  L8_104 = L8_104(L9_105)
  L9_105 = waitSeconds
  L10_106 = 1.5
  L9_105(L10_106)
  L9_105 = Fn_missionView
  L10_106 = "\227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\155\239\188\129"
  L9_105(L10_106)
  L9_105 = waitSeconds
  L10_106 = 1.3
  L9_105(L10_106)
  L10_106 = L8_104
  L9_105 = L8_104.abort
  L9_105(L10_106)
  L9_105 = Fn_userCtrlOn
  L9_105()
  L9_105 = waitSeconds
  L10_106 = 2.5
  L9_105(L10_106)
  L10_106 = L1_97
  L9_105 = L1_97.requestIdlingEnemy
  L11_107 = false
  L9_105(L10_106, L11_107)
  while true do
    L9_105 = _enemyCount
    if L9_105 > 0 then
      L9_105 = wait
      L9_105()
    end
  end
  L9_105 = Fn_tutorialCaptionKill
  L9_105()
  L9_105 = Sound
  L10_106 = L9_105
  L9_105 = L9_105.playSE
  L11_107 = "success"
  L9_105(L10_106, L11_107)
  L9_105 = waitSeconds
  L10_106 = 1.5
  L9_105(L10_106)
  L9_105 = HUD
  L10_106 = L9_105
  L9_105 = L9_105.info
  L11_107 = "ep03_info_06"
  L12_108 = false
  L9_105(L10_106, L11_107, L12_108)
  L9_105 = findGameObject2
  L10_106 = "EnemyGenerator"
  L11_107 = "enmgen2_04"
  L9_105 = L9_105(L10_106, L11_107)
  L1_97 = L9_105
  if L1_97 ~= nil then
    L10_106 = L1_97
    L9_105 = L1_97.getSpecTable
    L9_105 = L9_105(L10_106)
    L9_105 = L9_105.spawnSet
    L9_105 = #L9_105
    _enemyCount = L9_105
    L10_106 = L1_97
    L9_105 = L1_97.requestSpawn
    L9_105(L10_106)
  end
  L10_106 = L1_97
  L9_105 = L1_97.requestIdlingEnemy
  L11_107 = true
  L9_105(L10_106, L11_107)
  L9_105 = findGameObject2
  L10_106 = "Puppet"
  L11_107 = "enemy06"
  L9_105 = L9_105(L10_106, L11_107)
  L10_106 = Fn_lookAtObject
  L11_107 = L9_105
  L10_106 = L10_106(L11_107)
  L11_107 = waitSeconds
  L12_108 = 1.5
  L11_107(L12_108)
  L11_107 = Fn_missionView
  L12_108 = "\227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\155\239\188\129"
  L11_107(L12_108)
  L11_107 = waitSeconds
  L12_108 = 1.3
  L11_107(L12_108)
  L11_107 = {L12_108}
  L12_108 = Player
  L12_108 = L12_108.kAbility_Grab
  L4_100 = L11_107
  L11_107 = Fn_unLockPlayerAbility
  L12_108 = L4_100
  L11_107(L12_108, nil)
  L12_108 = L10_106
  L11_107 = L10_106.abort
  L11_107(L12_108)
  L11_107 = waitSeconds
  L12_108 = 2.5
  L11_107(L12_108)
  L12_108 = L1_97
  L11_107 = L1_97.requestIdlingEnemy
  L11_107(L12_108, false)
  L11_107 = Fn_tutorialCaption
  L12_108 = "ep02_grab"
  L11_107(L12_108)
  while true do
    L11_107 = _enemyCount
    if L11_107 > 1 then
      L11_107 = wait
      L11_107()
    end
  end
  L11_107 = HUD
  L12_108 = L11_107
  L11_107 = L11_107.info
  L11_107(L12_108, "ep03_info_05", false)
  while true do
    L11_107 = _enemyCount
    if L11_107 > 0 then
      L11_107 = wait
      L11_107()
    end
  end
  L11_107 = Sound
  L12_108 = L11_107
  L11_107 = L11_107.playSE
  L11_107(L12_108, "success")
  L11_107 = Fn_tutorialCaptionKill
  L11_107()
  L11_107 = waitSeconds
  L12_108 = 2
  L11_107(L12_108)
  L11_107 = Fn_userCtrlOff
  L11_107()
  L11_107 = HUD
  L12_108 = L11_107
  L11_107 = L11_107.info
  L11_107(L12_108, "ep03_info_03", false)
  L11_107 = findGameObject2
  L12_108 = "Node"
  L11_107 = L11_107(L12_108, "locator2_gem_special")
  L9_105 = L11_107
  L11_107 = Fn_lookAtObject
  L12_108 = L9_105
  L11_107 = L11_107(L12_108)
  L10_106 = L11_107
  L11_107 = waitSeconds
  L12_108 = 1.5
  L11_107(L12_108)
  L11_107 = createGameObject2
  L12_108 = "Gem"
  L11_107 = L11_107(L12_108)
  L12_108 = L9_105.getWorldPos
  L12_108 = L12_108(L9_105)
  L11_107:setGemModelNo(_GEM.SPECIAL)
  L11_107:setWorldPos(L12_108)
  L11_107:setForceMove()
  L11_107:setVisible(true)
  L11_107:try_init()
  L11_107:waitForReadyAsync(function()
    L11_107:try_start()
  end)
  Fn_missionView("SP\227\130\184\227\130\167\227\131\160\227\130\146\229\143\150\229\190\151\227\129\151\227\130\141\239\188\129")
  Fn_naviSet(L9_105)
  waitSeconds(1.3)
  Fn_userCtrlOn()
  L10_106:abort()
  while _isSpGemGet == false do
    wait()
  end
  Fn_naviKill()
  Fn_userCtrlOff()
  waitSeconds(2)
  Fn_missionView("\227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\155\239\188\129")
  Fn_tutorialCaption("sp_attack")
  L1_97 = findGameObject2("EnemyGenerator", "enmgen2_05")
  if L1_97 ~= nil then
    _enemyCount = #L1_97:getSpecTable().spawnSet
    L1_97:requestSpawn()
  end
  waitSeconds(0.5)
  L4_100 = {
    Player.kAbility_SpAttack
  }
  Fn_unLockPlayerAbility(L4_100, nil)
  Fn_userCtrlOn()
  while _enemyCount > 0 do
    wait()
  end
  Fn_unLockPlayerAbility(L0_96, nil)
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Sound:playSE("success")
  Fn_captionViewEnd()
  Player:setStay(true)
  waitSeconds(2)
  L1_97 = findGameObject2("EnemyGenerator", "enmgen2_06")
  if L1_97 ~= nil then
    _enemyCount = #L1_97:getSpecTable().spawnSet
    L1_97:requestSpawn()
  end
  L9_105 = findGameObject2("Puppet", "enemy13")
  L10_106 = Fn_lookAtObject(L9_105)
  waitSeconds(1.5)
  Fn_missionView("\227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\155\239\188\129")
  waitSeconds(1.3)
  Player:setStay(false)
  L10_106:abort()
  while _enemyCount > 0 do
    wait()
  end
  Sound:playSE("success")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_109, L1_110
end
function onGetVitalGem()
  if _isVitalGemInfoFinished == true then
    return
  end
  HUD:info("ep02_info_12", false)
  _isVitalGemInfoFinished = true
end
function onGetSpGem()
  local L0_111, L1_112
  _isSpGemGet = true
end
