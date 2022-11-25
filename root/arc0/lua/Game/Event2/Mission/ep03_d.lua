dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
_litho_theme = nil
_mnavi_hdl = {}
_ore_navi_hdl = {}
_ore_broken = {}
_mnavi_set_task = nil
_mnavi_max = 5
_mnavi_count = 1
_litho_02_ore_cnt = 0
_litho_02_ore_max = 0
_enm_litho_02_01_h = nil
_enm_litho_02_02_h = nil
_enm_litho_02_03_h = nil
_enm_litho_02_04_h = nil
_enm_hdl_tbl = {}
_enemy_spawn_task = nil
_enm_puppet = {}
_enm_dmg = {
  false,
  false,
  false,
  false,
  false,
  false
}
_miss_aim_pos = nil
_enemy_gen = 6
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_imp_spawn = false
mine_name = "ep03_mine"
_addGravityOre = {
  mineOreEvdName = "ep03_d_mine",
  instance_flg = false,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
enmgen_litho_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_02_01_enm_01",
      name = "litho_02_enemy_01"
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
    local L2_8
    _litho_theme = nil
    L2_8 = A1_7.getName
    L2_8 = L2_8(A1_7)
    _enm_puppet[tonumber(string.sub(L2_8, -2))] = findGameObject2("Puppet", L2_8)
    _enm_dmg[tonumber(string.sub(L2_8, -2))] = false
  end,
  onObjectDead = function(A0_9, A1_10)
  end,
  onObjectAsh = function(A0_11, A1_12)
    A0_11:getSpecTable().enemyDeadNum = A0_11:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_13, A1_14)
    Fn_enemyPopGemSetup(A0_13, {
      "litho_02_enemy_01"
    }, 1, 5)
  end,
  onPopGem = function(A0_15, A1_16)
    Fn_enemyAshPopGem(A0_15, A1_16)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_17)
    return #A0_17.spawnSet
  end,
  getEnemyDeadNum = function(A0_18)
    local L1_19
    L1_19 = A0_18.enemyDeadNum
    return L1_19
  end,
  isEnemyAllDead = function(A0_20)
    local L2_21
    L2_21 = A0_20.enemyDeadNum
    L2_21 = L2_21 >= #A0_20.spawnSet
    return L2_21
  end
}
enmgen_litho_02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_02_02_enm_01",
      name = "litho_02_enemy_02"
    }
  },
  onUpdate = function(A0_22)
    local L1_23
  end,
  onEnter = function(A0_24)
    local L1_25
  end,
  onLeave = function(A0_26)
    local L1_27
  end,
  onSpawn = function(A0_28, A1_29)
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onObjectAsh = function(A0_32, A1_33)
    A0_32:getSpecTable().enemyDeadNum = A0_32:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_34, A1_35)
    Fn_enemyPopGemSetup(A0_34, {
      "litho_02_enemy_02"
    }, 1, 5)
  end,
  onPopGem = function(A0_36, A1_37)
    Fn_enemyAshPopGem(A0_36, A1_37)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_38)
    return #A0_38.spawnSet
  end,
  getEnemyDeadNum = function(A0_39)
    local L1_40
    L1_40 = A0_39.enemyDeadNum
    return L1_40
  end,
  isEnemyAllDead = function(A0_41)
    local L2_42
    L2_42 = A0_41.enemyDeadNum
    L2_42 = L2_42 >= #A0_41.spawnSet
    return L2_42
  end
}
enmgen_litho_02_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_02_03_enm_01",
      name = "litho_02_enemy_03"
    }
  },
  onUpdate = function(A0_43)
    local L1_44
  end,
  onEnter = function(A0_45)
    local L1_46
  end,
  onLeave = function(A0_47)
    local L1_48
  end,
  onSpawn = function(A0_49, A1_50)
  end,
  onObjectDead = function(A0_51, A1_52)
  end,
  onObjectAsh = function(A0_53, A1_54)
    A0_53:getSpecTable().enemyDeadNum = A0_53:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_55, A1_56)
    Fn_enemyPopGemSetup(A0_55, {
      "litho_02_enemy_03"
    }, 1, 5)
  end,
  onPopGem = function(A0_57, A1_58)
    Fn_enemyAshPopGem(A0_57, A1_58)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_59)
    return #A0_59.spawnSet
  end,
  getEnemyDeadNum = function(A0_60)
    local L1_61
    L1_61 = A0_60.enemyDeadNum
    return L1_61
  end,
  isEnemyAllDead = function(A0_62)
    local L2_63
    L2_63 = A0_62.enemyDeadNum
    L2_63 = L2_63 >= #A0_62.spawnSet
    return L2_63
  end
}
enmgen_litho_02_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_02_04_enm_01",
      name = "litho_02_enemy_04"
    }
  },
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
  onObjectDead = function(A0_72, A1_73)
  end,
  onObjectAsh = function(A0_74, A1_75)
    A0_74:getSpecTable().enemyDeadNum = A0_74:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_76, A1_77)
    Fn_enemyPopGemSetup(A0_76, {
      "litho_02_enemy_04"
    }, 1, 5)
  end,
  onPopGem = function(A0_78, A1_79)
    Fn_enemyAshPopGem(A0_78, A1_79)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_80)
    return #A0_80.spawnSet
  end,
  getEnemyDeadNum = function(A0_81)
    local L1_82
    L1_82 = A0_81.enemyDeadNum
    return L1_82
  end,
  isEnemyAllDead = function(A0_83)
    local L2_84
    L2_84 = A0_83.enemyDeadNum
    L2_84 = L2_84 >= #A0_83.spawnSet
    return L2_84
  end
}
enmgen_litho_02_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_02_05_enm_01",
      name = "litho_02_enemy_05"
    }
  },
  onUpdate = function(A0_85)
    local L1_86
  end,
  onEnter = function(A0_87)
    local L1_88
  end,
  onLeave = function(A0_89)
    local L1_90
  end,
  onSpawn = function(A0_91, A1_92)
  end,
  onObjectDead = function(A0_93, A1_94)
  end,
  onObjectAsh = function(A0_95, A1_96)
    A0_95:getSpecTable().enemyDeadNum = A0_95:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_97, A1_98)
    Fn_enemyPopGemSetup(A0_97, {
      "litho_02_enemy_05"
    }, 1, 4)
  end,
  onPopGem = function(A0_99, A1_100)
    Fn_enemyAshPopGem(A0_99, A1_100)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_101)
    return #A0_101.spawnSet
  end,
  getEnemyDeadNum = function(A0_102)
    local L1_103
    L1_103 = A0_102.enemyDeadNum
    return L1_103
  end,
  isEnemyAllDead = function(A0_104)
    local L2_105
    L2_105 = A0_104.enemyDeadNum
    L2_105 = L2_105 >= #A0_104.spawnSet
    return L2_105
  end
}
enmgen_litho_02_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_02_06_enm_01",
      name = "litho_02_enemy_06"
    }
  },
  onUpdate = function(A0_106)
    local L1_107
  end,
  onEnter = function(A0_108)
    local L1_109
  end,
  onLeave = function(A0_110)
    local L1_111
  end,
  onSpawn = function(A0_112, A1_113)
  end,
  onObjectDead = function(A0_114, A1_115)
  end,
  onObjectAsh = function(A0_116, A1_117)
    A0_116:getSpecTable().enemyDeadNum = A0_116:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_118, A1_119)
    Fn_enemyPopGemSetup(A0_118, {
      "litho_02_enemy_06"
    }, 1, 4)
  end,
  onPopGem = function(A0_120, A1_121)
    Fn_enemyAshPopGem(A0_120, A1_121)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_122)
    return #A0_122.spawnSet
  end,
  getEnemyDeadNum = function(A0_123)
    local L1_124
    L1_124 = A0_123.enemyDeadNum
    return L1_124
  end,
  isEnemyAllDead = function(A0_125)
    local L2_126
    L2_126 = A0_125.enemyDeadNum
    L2_126 = L2_126 >= #A0_125.spawnSet
    return L2_126
  end
}
function Initialize()
  local L0_127, L1_128, L2_129, L3_130
  L0_127(L1_128)
  _litho_02_ore_max = L0_127
  for L3_130 = 1, _enemy_gen do
    _enm_hdl_tbl[L3_130] = findGameObject2("EnemyGenerator", string.format("enmgen2_litho_02_%02d", L3_130))
  end
  _sdemo = L0_127
  L3_130 = "locator2_enm_sd_aim"
  L0_127(L1_128, L2_129, L3_130, true)
  L0_127(L1_128)
  _catwarp_change = false
end
function Ingame()
  local L0_131, L1_132, L2_133, L3_134
  repeat
    L0_131()
  until L0_131
  for L3_134 = 1, _litho_02_ore_max do
    if Fn_getGravityOre2(string.format("gravityore_az_a_02_L02_%02d", L3_134)) ~= nil then
      Fn_getGravityOre2(string.format("gravityore_az_a_02_L02_%02d", L3_134)):setActive(false)
    end
  end
  while true do
    if L0_131 == false then
      L0_131()
    end
  end
  L0_131(L1_132)
  L0_131()
  L0_131()
  L0_131(L1_132)
  L0_131(L1_132)
  L0_131(L1_132)
  _litho_view_task = L0_131
  _island_navi = L0_131
  repeat
    L0_131()
  until L0_131
  L0_131()
  L0_131(L1_132, L2_133)
  L0_131(L1_132, L2_133)
  L0_131(L1_132)
  repeat
    L0_131()
  until L0_131
  _island_navi = L0_131
  L1_132(L2_133)
  L1_132(L2_133)
  L1_132(L2_133)
  repeat
    if L1_132 == false then
      L1_132(L2_133, L3_134)
      L1_132(L2_133, L3_134)
      L1_132()
    end
    L1_132()
  until L1_132
  L1_132(L2_133, L3_134)
  L1_132(L2_133, L3_134)
  L1_132(L2_133)
  if L1_132 ~= nil then
    L1_132(L2_133)
  end
  for _FORV_4_ = 1, _enemy_gen do
    _enm_hdl_tbl[_FORV_4_]:requestIdlingEnemy(true)
  end
  L1_132(L2_133)
  L1_132(L2_133, L3_134)
  if L1_132 ~= nil then
    L1_132(L2_133)
  end
  L1_132()
  L1_132(L2_133)
  for _FORV_4_ = 1, _enemy_gen do
    _enm_hdl_tbl[_FORV_4_]:requestAllEnemyKill()
  end
  repeat
    L1_132()
  until L1_132
  L1_132()
  L1_132()
  L1_132()
  L1_132()
end
function litho_init()
  local L0_135, L1_136, L2_137, L3_138, L4_139
  L0_135(L1_136)
  for L3_138 = 1, _litho_02_ore_max do
    L4_139 = _ore_navi_hdl
    L4_139[L3_138] = nil
    L4_139 = _ore_broken
    L4_139[L3_138] = nil
  end
  L0_135(L1_136)
  L0_135()
  repeat
    L0_135()
  until L0_135
  for L3_138 = 1, _litho_02_ore_max do
    repeat
      L4_139 = wait
      L4_139()
      L4_139 = Fn_sendEventComSb
      L4_139 = L4_139("isOreReady")
    until L4_139
    L4_139 = Fn_getGravityOre2
    L4_139 = L4_139(string.format("gravityore_az_a_03_L02_%02d", L3_138))
    if L4_139 ~= nil then
      L4_139:setActive(true)
      L4_139:setEventListener("broken", function(A0_140)
        local L1_141
        L1_141 = _litho_02_ore_cnt
        L1_141 = L1_141 + 1
        _litho_02_ore_cnt = L1_141
        L1_141 = print
        L1_141("_litho_02_ore_cnt:" .. _litho_02_ore_cnt)
        L1_141 = HUD
        L1_141 = L1_141.counter99_99AddNum
        L1_141(L1_141)
        L1_141 = tonumber
        L1_141 = L1_141(string.sub(L4_139:getName(), -2))
        _ore_broken[L1_141] = true
        if HUD:mnaviFind("mnavi_" .. L1_141):isValid() then
          HUD:mnaviFind("mnavi_" .. L1_141):setActive(false)
        end
      end)
    else
      print(string.format("handle nil : gravityore_az_a_03_L02_%02d", L3_138))
      break
    end
  end
  _enemy_spawn_task = L0_135
  L0_135(L1_136, L2_137)
  _mnavi_set_task = L0_135
end
function prog_manage()
  if _enm_hdl_tbl[3] ~= nil then
    _enm_hdl_tbl[3]:requestSpawn()
  end
  repeat
    wait()
  until _litho_02_ore_cnt == 3
  if _enm_hdl_tbl[4] ~= nil then
    _enm_hdl_tbl[4]:requestSpawn()
  end
  repeat
    wait()
  until _litho_02_ore_cnt == 7
  if _enm_hdl_tbl[6] ~= nil then
    _enm_hdl_tbl[6]:requestSpawn()
  end
  repeat
    wait()
  until _litho_02_ore_cnt == 12
  if _enm_hdl_tbl[5] ~= nil then
    _enm_hdl_tbl[5]:requestSpawn()
  end
  repeat
    wait()
  until _litho_02_ore_cnt == 18
  if _enm_hdl_tbl[1] ~= nil then
    _enm_hdl_tbl[1]:requestSpawn()
    _imp_spawn = true
  end
end
function imp_spawn_demo()
  Fn_userCtrlAllOff()
  Player:setStay(true)
  for _FORV_3_ = 1, _enemy_gen do
    if _enm_hdl_tbl[_FORV_3_] ~= nil then
      _enm_hdl_tbl[_FORV_3_]:requestIdlingEnemy(true)
    end
  end
  _FOR_:play()
  waitSeconds(1)
  Fn_captionView("ep03_02002")
  waitSeconds(2)
  _sdemo:stop(0)
  Fn_userCtrlOn()
  Player:setStay(false)
  for _FORV_3_ = 1, _enemy_gen do
    if _enm_hdl_tbl[_FORV_3_] ~= nil then
      _enm_hdl_tbl[_FORV_3_]:requestIdlingEnemy(false)
    end
  end
end
function damamge_dac(A0_142)
  local L1_143
  function L1_143(A0_144)
    local L1_145, L2_146, L3_147
    L1_145 = A0_144.name
    L2_146 = A0_144.attacker
    L3_147 = A0_144.damageHp
    print("enemy name " .. L1_145)
    print("enemy type " .. L2_146)
    print("damege" .. L3_147)
    if L2_146 == "player" and L3_147 > 1 then
      _enm_dmg[A0_142] = true
    end
    A0_144.ret = true
    return A0_144
  end
  _enm_hdl_tbl[A0_142]:setEventListener("DamageEnemyReport", L1_143)
end
function enm_dmg_check()
  repeat
    for _FORV_3_, _FORV_4_ in ipairs(_enm_dmg) do
      if _FORV_4_ == true then
        _litho_theme = false
      end
    end
    wait()
  until _litho_theme
end
function restart_litho()
  Fn_captionViewEnd()
  _island_navi:abort()
  for _FORV_3_ = 1, 6 do
    _enm_hdl_tbl[_FORV_3_]:requestIdlingEnemy(true)
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function ore_check_eye(A0_148, A1_149)
  local L2_150, L3_151, L4_152, L5_153
  if A1_149 == nil then
    A1_149 = 50
  end
  L2_150 = false
  L3_151 = Fn_isInSightTarget
  L4_152 = A0_148
  L3_151 = L3_151(L4_152)
  if L3_151 == true then
    L3_151 = Fn_getPcPosRot
    L4_152 = L3_151()
    L5_153 = L3_151.y
    L5_153 = L5_153 + 1.5
    L3_151.y = L5_153
    L5_153 = Query
    L5_153 = L5_153.setEyeSightTransform
    L5_153(L5_153, L3_151, L4_152)
    L5_153 = Query
    L5_153 = L5_153.setEyeSightAngle
    L5_153(L5_153, Deg2Rad(360))
    L5_153 = Query
    L5_153 = L5_153.setEyeSightRange
    L5_153(L5_153, A1_149)
    L5_153 = A0_148.getWorldPos
    L5_153 = L5_153(A0_148)
    if Query:checkEyeSightSphere(L5_153, 0.1) == true and Query:raycastEyeSight(L5_153) == nil then
      L2_150 = true
    end
  end
  return L2_150
end
function Finalize()
  local L0_154, L1_155
end
