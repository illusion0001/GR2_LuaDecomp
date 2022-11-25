dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("GlobalGem")
_litho_theme = nil
_enm_litho_07_01_h = nil
_enm_litho_07_02_h = nil
_litho_timer_task = nil
_clear_time_first = {
  0,
  0,
  19,
  99
}
_clear_time_second = {
  0,
  0,
  39,
  99
}
_spgem_01_h = nil
_spgem_02_h = nil
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_enemy_max = 0
_giant_spawn = false
_guide_disp = true
_sp_gem_01_h = nil
_sp_gem_02_h = nil
_sp_gem_01 = false
_sp_gem_02 = false
enmgen_litho_07_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_01",
      name = "litho_07_enemy_01"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_02",
      name = "litho_07_enemy_02"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_03",
      name = "litho_07_enemy_03"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_04",
      name = "litho_07_enemy_04"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_05",
      name = "litho_07_enemy_05"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_06",
      name = "litho_07_enemy_06"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_07_01_enm_07",
      name = "litho_07_enemy_07"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "litho_07_enemy_01"
    }, 1, 6, "gem_01_01")
    Fn_enemyPopGemSetup(A0_12, {
      "litho_07_enemy_03"
    }, 1, 6, "gem_01_02")
    Fn_enemyPopGemSetup(A0_12, {
      "litho_07_enemy_05"
    }, 1, 6, "gem_01_03")
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15, {
      "gem_01_01",
      "gem_01_02",
      "gem_01_03"
    })
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
enmgen_litho_07_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_litho_07_02_enm_01",
      name = "litho_07_enemy_11"
    }
  },
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onSpawn = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum - 1
    if A0_27:getSpecTable().enemyDeadNum < 0 then
      A0_27:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_29, A1_30)
  end,
  onObjectAsh = function(A0_31, A1_32)
    A0_31:getSpecTable().enemyDeadNum = A0_31:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "litho_07_enemy_11"
    }, 1, 4)
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end,
  isEnemyAllDead = function(A0_40)
    local L2_41
    L2_41 = A0_40.enemyDeadNum
    L2_41 = L2_41 >= #A0_40.spawnSet
    return L2_41
  end
}
function Initialize()
  Fn_vctrlOff("vctrl2_litho_07")
  _enm_litho_07_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_07_01")
  _enm_litho_07_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_07_02")
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  _enemy_max = enmgen_litho_07_01:getEnemyMax() + enmgen_litho_07_02:getEnemyMax()
  _sdemo = SDemo.create("giant_sdemo")
  _sp_gem_01_h = findGameObject2("Node", "gem2_litho_07_special_01")
  _sp_gem_02_h = findGameObject2("Node", "gem2_litho_07_special_02")
  _sp_gem_01_h:setActive(false)
  _sp_gem_02_h:setActive(false)
  _sp_max = Player:getEnergyMax(Player.kEnergy_SpAttack)
  _debug_flug = false
  _debug_tuto_disp = false
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_m")
  _catwarp_change = false
end
function Ingame()
  local L0_42, L1_43, L2_44, L3_45
  L0_42(L1_43)
  while true do
    if L0_42 == false then
      L0_42()
    end
  end
  L0_42(L1_43)
  L0_42()
  L0_42()
  if L0_42 == true then
    L0_42(L1_43)
  end
  _island_navi = L0_42
  repeat
    L0_42()
  until L0_42
  L0_42()
  L0_42()
  L0_42(L1_43, L2_44)
  _sp_gem_01 = true
  L0_42(L1_43)
  L0_42(L1_43)
  repeat
    L0_42()
  until L0_42
  L0_42()
  L0_42(L1_43, L2_44)
  if L0_42 ~= 2 then
    L0_42()
    L3_45 = false
    L0_42(L1_43, L2_44, L3_45)
  elseif L0_42 == 2 then
    L3_45 = true
    L0_42(L1_43, L2_44, L3_45)
  end
  L0_42(L1_43)
  L0_42()
  L0_42(L1_43, L2_44)
  L0_42(L1_43)
  L0_42(L1_43)
  max_sp = L0_42
  L3_45 = max_sp
  L0_42(L1_43, L2_44, L3_45)
  L3_45 = false
  L0_42(L1_43, L2_44, L3_45)
  _island_navi = L0_42
  L0_42(L1_43)
  L0_42(L1_43, L2_44)
  L0_42(L1_43)
  L0_42(L1_43)
  repeat
    if L0_42 == false then
      L0_42()
    end
    L0_42()
  until L0_42
  L0_42(L1_43, L2_44)
  L0_42(L1_43)
  if L0_42 ~= nil then
    L0_42(L1_43)
  end
  L0_42(L1_43)
  L0_42()
  L0_42(L1_43)
  if L0_42 ~= nil then
    L0_42(L1_43, L2_44)
  end
  L0_42(L1_43, L2_44)
  if L0_42 ~= nil then
    L0_42(L1_43)
  end
  L0_42(L1_43, L2_44)
  L0_42()
  L0_42(L1_43)
  L0_42(L1_43)
  repeat
    L0_42()
  until L0_42
  L3_45 = "lithograph_01"
  L0_42(L1_43, L2_44)
  L3_45 = "hand_01"
  L0_42(L1_43, L2_44)
  for L3_45 = 1, 10 do
    repeat
      wait()
    until Fn_sendEventComSb("requestOreActive", string.format("gravityore_az_a_02_h01_%02d", L3_45), false)
  end
  L3_45 = "lithograph_08"
  L0_42(L1_43, L2_44)
  L3_45 = "hand_08"
  L0_42(L1_43, L2_44)
  L0_42(L1_43)
  repeat
    L0_42()
  until L0_42
  L0_42()
  L0_42()
  L0_42()
  L0_42()
end
function theme_set()
  print("*** ep03_n : theme_set ***")
  litho_init()
  _enm_litho_07_01_h:requestIdlingEnemy(true)
end
function litho_init()
  print("*** ep03_n:litho_init ***")
  _enemy_spawn_task = invokeTask(prog_manage)
end
function prog_manage()
  print("*** ep03_n:prog_manage ***")
  if _enm_litho_07_01_h ~= nil then
    _enm_litho_07_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_07_01:isEnemyAllDead()
  _giant_pupeet = findGameObject2("Puppet", "litho_07_enemy_11")
  waitSeconds(1.4)
  if _enm_litho_07_02_h ~= nil then
    _enm_litho_07_02_h:requestSpawn()
    _giant_spawn = true
    _guide_disp = false
  end
  _sp_gem_02_h:setActive(true)
  _sp_gem_02 = true
  _enm_litho_07_02_h:requestIdlingEnemy(true)
end
function litho_timer(A0_46)
  while _litho_theme ~= true do
    if _litho_theme == nil then
      HUD:timerSetSecond(A0_46)
      HUD:timerSetVisible(true)
      HUD:timerStart()
      _timer_se = Sound:playSEHandle("sys_countdown", 1)
      while HUD:timerGetSecond() > 0 do
        wait()
      end
      _litho_theme = false
      HUD:timerStop()
      if _timer_se ~= nil then
        Sound:stopSEHandle(_timer_se)
      end
    end
    wait()
  end
end
function sp_guide_disp()
  local L0_47
  L0_47 = false
  invokeTask(function()
    repeat
      if Fn_sendEventComSb("isMissionview") then
        print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\233\157\158\232\161\168\231\164\186 <<<<<<<<<<")
        _guide_disp = false
        repeat
          while not _litho_theme do
            wait()
          end
        until Fn_sendEventComSb("isMissionview") == false
        Fn_tutorialCaptionKill()
        repeat
          wait()
        until not Fn_isCaptionView()
        _guide_disp = true
      end
      wait()
    until _litho_theme
  end)
  invokeTask(function()
    repeat
      if _guide_disp then
        if _sp_max == Player:getEnergy(Player.kEnergy_SpAttack) then
          if L0_47 ~= "sp_attack" then
            L0_47 = "sp_attack"
            Fn_tutorialCaptionKill()
            wait()
            print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137 [SP Attack] <<<<<<<<<<")
            Fn_tutorialCaption("sp_attack")
          end
        elseif L0_47 ~= "sp_gem" then
          if L0_47 == false then
            L0_47 = "sp_gem"
            Fn_tutorialCaptionKill()
            wait()
            print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137 [SP Gam] <<<<<<<<<<")
            Fn_tutorialCaption("sp_gem")
          elseif L0_47 == "sp_attack" then
            L0_47 = "sp_gem"
            Fn_tutorialCaptionKill()
            waitSeconds(10)
            if _guide_disp then
              if _sp_max == Player:getEnergy(Player.kEnergy_SpAttack) then
                L0_47 = "sp_attack"
                print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137 [SP Attack] <<<<<<<<<<")
                Fn_tutorialCaption("sp_attack")
              else
                print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137 [SP Gam] <<<<<<<<<<")
                Fn_tutorialCaption("sp_gem")
              end
            else
              L0_47 = false
            end
          end
        end
      else
        L0_47 = false
        if _giant_spawn then
          print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\233\157\158\232\161\168\231\164\186 <<<<<<<<<<")
          Fn_tutorialCaptionKill()
          repeat
            wait()
          until _giant_spawn == false
        end
      end
      wait()
    until _litho_theme
    Fn_tutorialCaptionKill()
  end)
end
function giant_spawn_demo()
  repeat
    wait()
  until _giant_spawn
  Fn_userCtrlAllOff()
  Player:setStay(true)
  _sdemo:set("locator2_giant_cam", "locator2_giant_aim", true)
  wait(3)
  Fn_getPlayer():setVisible(false)
  _sdemo:play()
  _sdemo:zoomIn(4, {deg = 25}, "easeOut")
  waitSeconds(3)
  Fn_resetPcPos("locator2_pc_sd_litho_07_02")
  Fn_getPlayer():setVisible(true)
  _sdemo:stop(2)
  Fn_userCtrlOn()
  Player:setStay(false)
  waitSeconds(3)
  _enm_litho_07_02_h:requestIdlingEnemy(false)
end
function giant_dead_demo()
  Fn_tutorialCaptionKill()
  Fn_userCtrlAllOff()
  Player:setStay(true)
  _sdemo:set("locator2_giant_cam", "locator2_giant_aim", true)
  wait(3)
  _sdemo:play()
  _sdemo:zoomOut(3, {deg = 50}, "easein")
  waitSeconds(2.5)
  _sdemo:stop(1)
end
function createGem(A0_48, A1_49)
  local L2_50, L3_51, L4_52
  L3_51 = A0_48
  L2_50 = A0_48.getName
  L2_50 = L2_50(L3_51)
  if L2_50 ~= nil then
    L3_51 = print
    L4_52 = "***** Gam create : "
    L4_52 = L4_52 .. L2_50 .. " *****"
    L3_51(L4_52)
    L3_51 = createGameObject2
    L4_52 = "Gem"
    L3_51 = L3_51(L4_52)
    L4_52 = L3_51.setName
    L4_52(L3_51, L2_50)
    L4_52 = L3_51.setGemModelNo
    L4_52(L3_51, A1_49)
    L4_52 = A0_48.getWorldPos
    L4_52 = L4_52(A0_48)
    L4_52 = L4_52 + Vector(0, 0, 0)
    L3_51:setWorldPos(L4_52)
    L3_51:setForceMove()
    L3_51:setVisibleBlockHalfSize(150)
    L3_51:setVisible(true)
    L3_51:try_init()
    L3_51:waitForReadyAsync(function()
      L3_51:try_start()
    end)
    return L3_51
  else
  end
  L3_51 = nil
  return L3_51
end
_specialgem_time = 60
function specialGemrReset(A0_53)
  if A0_53 ~= nil then
    _specialgem_time = A0_53
  end
  GlobalGem:SetSpecialGemGetCallback("specialGemReCreate")
end
_debug_gem_name = nil
function specialGemReCreate(A0_54)
  invokeTask(function()
    _debug_gem_name = A0_54:getName()
    if A0_54:getName() == "gem2_litho_07_special_01" then
      _sp_gem_01 = false
      invokeTask(function()
        waitSeconds(_specialgem_time)
        repeat
          wait()
        until _sp_max > Player:getEnergy(Player.kEnergy_SpAttack)
        createGem(A0_54, 6)
        _sp_gem_01 = true
      end)
    elseif A0_54:getName() == "gem2_litho_07_special_02" then
      _sp_gem_02 = false
      invokeTask(function()
        waitSeconds(_specialgem_time)
        repeat
          wait()
        until _sp_max > Player:getEnergy(Player.kEnergy_SpAttack)
        createGem(A0_54, 6)
        _sp_gem_02 = true
      end)
    end
  end)
end
function restart_litho()
  print("*** ep03_n:restart_litho ***")
  _island_navi:abort()
  if _enm_litho_07_01_h ~= nil then
    _enm_litho_07_01_h:requestIdlingEnemy(true)
  end
  if _enm_litho_07_02_h ~= nil then
    _enm_litho_07_02_h:requestIdlingEnemy(true)
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function Finalize()
  if _timer_se ~= nil then
    Sound:stopSEHandle(_timer_se)
  end
end
