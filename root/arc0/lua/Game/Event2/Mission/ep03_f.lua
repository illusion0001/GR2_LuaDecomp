dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
import("GlobalGem")
_litho_theme = nil
_miss_check = nil
_enemy_max = 0
_miss_1st = false
_enemy_spawn_task = nil
_enm_damage = {}
_cactus_max = 99
_cactus_break = 0
_cactus_hdl = {}
_cactus_restore = 20
_erea_04_hdl = nil
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_spgem_info = false
_spgem_vc_no = nil
_spgem_set = false
_spgem_vc = false
_debug_flag = false
enmgen_litho_03_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_03_01_enm_01",
      name = "litho_03_enemy_01"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_01_enm_02",
      name = "litho_03_enemy_02"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_01_enm_03",
      name = "litho_03_enemy_03"
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
    _enm_damage[A1_7:getName()] = {attackerType = nil, damageType = nil}
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
enmgen_litho_03_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_03_01_enm_04",
      name = "litho_03_enemy_04"
    }
  },
  onUpdate = function(A0_17)
    local L1_18
  end,
  onEnter = function(A0_19)
    local L1_20
  end,
  onLeave = function(A0_21)
    local L1_22
  end,
  onSpawn = function(A0_23, A1_24)
    A0_23:getSpecTable().enemyDeadNum = A0_23:getSpecTable().enemyDeadNum - 1
    if A0_23:getSpecTable().enemyDeadNum < 0 then
      A0_23:getSpecTable().enemyDeadNum = 0
    end
    _enm_damage[A1_24:getName()] = {attackerType = nil, damageType = nil}
  end,
  onObjectDead = function(A0_25, A1_26)
  end,
  onObjectAsh = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
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
  isEnemyAllDead = function(A0_32)
    local L2_33
    L2_33 = A0_32.enemyDeadNum
    L2_33 = L2_33 >= #A0_32.spawnSet
    return L2_33
  end
}
enmgen_litho_03_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_01",
      name = "litho_03_enemy_05"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_02",
      name = "litho_03_enemy_06"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_03",
      name = "litho_03_enemy_07"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_04",
      name = "litho_03_enemy_08"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_05",
      name = "litho_03_enemy_09"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_06",
      name = "litho_03_enemy_10"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_03_02_enm_07",
      name = "litho_03_enemy_11"
    }
  },
  onUpdate = function(A0_34)
    local L1_35
  end,
  onEnter = function(A0_36)
    local L1_37
  end,
  onLeave = function(A0_38)
    local L1_39
  end,
  onSpawn = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = A0_40:getSpecTable().enemyDeadNum - 1
    if A0_40:getSpecTable().enemyDeadNum < 0 then
      A0_40:getSpecTable().enemyDeadNum = 0
    end
    _enm_damage[A1_41:getName()] = {attackerType = nil, damageType = nil}
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().enemyDeadNum = A0_44:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_46)
    return #A0_46.spawnSet
  end,
  getEnemyDeadNum = function(A0_47)
    local L1_48
    L1_48 = A0_47.enemyDeadNum
    return L1_48
  end,
  isEnemyAllDead = function(A0_49)
    local L2_50
    L2_50 = A0_49.enemyDeadNum
    L2_50 = L2_50 >= #A0_49.spawnSet
    return L2_50
  end
}
enmgen_litho_03_03_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator_litho_03_03_enm_01",
      name = "litho_03_enemy_12"
    }
  },
  onUpdate = function(A0_51)
    local L1_52
  end,
  onEnter = function(A0_53)
    local L1_54
  end,
  onLeave = function(A0_55)
    local L1_56
  end,
  onSpawn = function(A0_57, A1_58)
    A0_57:getSpecTable().enemyDeadNum = A0_57:getSpecTable().enemyDeadNum - 1
    if A0_57:getSpecTable().enemyDeadNum < 0 then
      A0_57:getSpecTable().enemyDeadNum = 0
    end
    _enm_damage[A1_58:getName()] = {attackerType = nil, damageType = nil}
  end,
  onObjectDead = function(A0_59, A1_60)
  end,
  onObjectAsh = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_63)
    return #A0_63.spawnSet
  end,
  getEnemyDeadNum = function(A0_64)
    local L1_65
    L1_65 = A0_64.enemyDeadNum
    return L1_65
  end,
  isEnemyAllDead = function(A0_66)
    local L2_67
    L2_67 = A0_66.enemyDeadNum
    L2_67 = L2_67 >= #A0_66.spawnSet
    return L2_67
  end
}
function Initialize()
  _start_sdemo = SDemo.create("litho_03_enemy")
  _enm_litho_03_01_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_03_01_01")
  _enm_litho_03_01_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_03_01_02")
  _enm_litho_03_02_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_03_02_01")
  _enm_litho_03_03_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_03_03_01")
  _enemy_max = enmgen_litho_03_01_01:getEnemyMax() + enmgen_litho_03_01_02:getEnemyMax() + enmgen_litho_03_02_01:getEnemyMax() + enmgen_litho_03_03_01:getEnemyMax()
  print("***** enemy_max : " .. _enemy_max)
  _event_motion_table = {
    label01 = "kit01_stay_heat_00",
    label02 = "kit01_stay_00"
  }
  Fn_loadPlayerMotion(_event_motion_table)
  findGameObject2("Node", "gem2_special_litho_03_01"):setActive(false)
  findGameObject2("Node", "gem2_special_litho_03_02"):setActive(false)
  findGameObject2("Node", "gem2_special_litho_03_03"):setActive(false)
  findGameObject2("Node", "gem2_special_litho_03_04"):setActive(false)
  Fn_vctrlOff("vctrl2_spgem_01")
  Fn_vctrlOff("vctrl2_spgem_02")
  Fn_vctrlOff("vctrl2_spgem_03")
  Fn_vctrlOff("vctrl2_spgem_04")
  Fn_pcSensorOff("pccubesensor2_vc_on_01")
  Fn_pcSensorOff("pccubesensor2_vc_on_02")
  Fn_pcSensorOff("pccubesensor2_vc_on_03")
  Fn_pcSensorOff("pccubesensor2_vc_on_04")
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_e")
  _catwarp_change = false
end
function Ingame()
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  invokeTask(function()
    repeat
      wait()
    until Player:getRecentAreaName() == "az_a_04" or _catwarp_change
    Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_f")
    print("***** ep03_catwarp point:" .. Fn_getCatWarpCheckPoint() .. " *****")
  end)
  Fn_missionStart()
  Fn_userCtrlOn()
  if _debug_flag then
    invokeTask(function()
      local L0_68
      L0_68 = nil
      repeat
        L0_68 = Fn_getCatWarpCheckPoint()
        debugDispPrint("catwarp : " .. L0_68)
        debugDispPrint("kitten area : " .. tostring(Player:getRecentAreaName()))
        if L0_68 ~= nil then
          print(">>>>>>>>>>>>>>>> \227\131\157\227\130\164\227\131\179\227\131\136\229\164\137\230\155\180 " .. L0_68)
        end
        wait()
      until false
    end)
  end
  _island_navi = invokeTask(function()
    Fn_sendEventComSb("ViewMission")
    waitSeconds(1.3)
    repeat
      if false == false and Fn_getDistanceToPlayer("locator2_litho_navi_03_02") > 5 then
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_03_02"))
        if not _catwarp_change then
          _catwarp_change = true
        end
      elseif true == true and Fn_getDistanceToPlayer("locator2_litho_navi_03_02") < 5 then
        Fn_naviKill()
      end
      wait()
    until Fn_sendEventComSb("isLithographStart")
    Fn_naviKill()
  end)
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  waitSeconds(1.8)
  theme_set()
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_userCtrlAllOff()
  Fn_lockPlayerAbility(Player.kAbility_GravityShift)
  Fn_userCtrlOn()
  _enm_litho_03_01_01_h:requestIdlingEnemy(false)
  _island_navi = invokeTask(function()
    local L0_69
    L0_69 = false
    _island_navi_disp = 100
    repeat
      if L0_69 == false and Fn_getDistanceToPlayer("locator2_litho_navi_03_01") > _island_navi_disp then
        L0_69 = true
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_03_01"))
      elseif L0_69 == true and Fn_getDistanceToPlayer("locator2_litho_navi_03_01") < _island_navi_hide then
        L0_69 = false
        Fn_naviKill()
      end
      wait()
    until _litho_theme
    Fn_naviKill()
  end)
  invokeTask(function()
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep03_09013")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_missionView("ep03_05003", nil, nil, true)
    Fn_setBgmPoint("battle")
    repeat
      repeat
        while not enmgen_litho_03_01_01:isEnemyAllDead() do
          wait()
        end
      until Fn_sendEventComSb("isMissionview") == false
      Fn_tutorialCaptionKill()
      repeat
        wait()
      until not Fn_isCaptionView()
      wait()
      Fn_tutorialCaption("throw")
      print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\232\161\168\231\164\186 <<<<<<<<<<")
      repeat
        while not enmgen_litho_03_01_01:isEnemyAllDead() do
          wait()
        end
      until Fn_sendEventComSb("isMissionview")
      print(">>>>>>>>>> \230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\233\157\158\232\161\168\231\164\186 <<<<<<<<<<")
      wait()
    until enmgen_litho_03_01_01:isEnemyAllDead()
    Fn_tutorialCaptionKill()
  end)
  repeat
    wait()
  until enmgen_litho_03_01_01:isEnemyAllDead() and enmgen_litho_03_01_02:isEnemyAllDead()
  Fn_captionViewWait("ep03_05004")
  Fn_userCtrlAllOff()
  while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
    wait()
  end
  if GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_05) ~= 2 then
    HUD:info("ep03_info_05", false)
    Player:dropGrabObject()
  elseif GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_05) == 2 then
    HUD:info("ep03_info_05", true)
  end
  Fn_unLockPlayerAbility(Player.kAbility_ExGrab)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  max_sp = Player:getEnergyMax(Player.kEnergy_SpAttack)
  Player:setEnergy(Player.kEnergy_SpAttack, max_sp)
  Fn_userCtrlOn()
  invokeTask(function()
    Fn_tutorialCaption("sp_grab")
    repeat
      wait()
    until enmgen_litho_03_02_01:isEnemyAllDead()
    Fn_tutorialCaptionKill()
  end)
  repeat
    wait()
  until enmgen_litho_03_02_01:isEnemyAllDead()
  Fn_pcSensorOn("pccubesensor2_vc_on_01")
  Fn_pcSensorOn("pccubesensor2_vc_on_02")
  Fn_pcSensorOn("pccubesensor2_vc_on_03")
  Fn_pcSensorOn("pccubesensor2_vc_on_04")
  repeat
    wait()
  until _spgem_vc
  while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
    wait()
  end
  if GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_07) ~= 2 then
    HUD:info("ep03_info_07", false)
  elseif GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_07) == 2 then
    HUD:info("ep03_info_07", true)
  end
  _spgem_info = true
  _guide_disp_task = invokeTask(function()
    _sp_max = Player:getEnergyMax(Player.kEnergy_SpAttack)
    repeat
      if Player:getEnergy(Player.kEnergy_SpAttack) < 250 and not false then
        Fn_tutorialCaption("sp_gem")
        break
      end
      wait()
    until false
    repeat
      wait()
    until _sp_max == Player:getEnergy(Player.kEnergy_SpAttack)
    Fn_tutorialCaptionKill()
  end)
  repeat
    wait()
  until _litho_theme
  if invokeTask(function()
    repeat
      while enmgen_litho_03_03_01:isEnemyAllDead() ~= true or GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
        wait()
      end
      GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
      if _litho_theme == nil then
        _litho_theme = true
      end
      wait()
    until _litho_theme
  end) ~= nil then
    invokeTask(function()
      repeat
        while enmgen_litho_03_03_01:isEnemyAllDead() ~= true or GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
          wait()
        end
        GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
        if _litho_theme == nil then
          _litho_theme = true
        end
        wait()
      until _litho_theme
    end):abort()
  end
  HUD:counter999SetVisible(false)
  _island_navi:abort()
  HUD:counter999SetVisible(false)
  Fn_setBgmPoint("event", "battle_end")
  Fn_pcSensorOff("pccubesensormulti2_area_out")
  Fn_naviKill()
  Fn_unLockPlayerAbility(Player.kAbility_GravityShift)
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("requestDriftArea", "az_a_08_19", true)
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function theme_set()
  local L0_70, L1_71
  L0_70 = print
  L1_71 = "*** ep03_f:theme_set ***"
  L0_70(L1_71)
  L0_70 = litho_init
  L0_70()
  L0_70 = _enm_litho_03_01_01_h
  L1_71 = L0_70
  L0_70 = L0_70.requestIdlingEnemy
  L0_70(L1_71, true)
  L0_70 = _start_sdemo
  L1_71 = L0_70
  L0_70 = L0_70.set
  L0_70(L1_71, "locator2_litho_03_enm_sd_cam", "locator2_litho_03_enm_sd_cam", kSDEMO_APPEND_AIM)
  L0_70 = {L1_71}
  L1_71 = {}
  L1_71.pos = "locator2_litho_03_enm_sd_cam"
  L1_71.time = 0
  L1_71.hashfunc = "Liner"
  L1_71 = {
    {
      pos = "locator2_litho_03_enm_01_sd_aim",
      time = 1.3,
      hashfunc = "EaseIn"
    },
    {
      pos = "locator2_litho_03_enm_02_sd_aim",
      time = 1.3,
      hashfunc = "Liner"
    },
    {
      pos = "locator2_litho_03_enm_03_sd_aim",
      time = 1.3,
      hashfunc = "EaseOut"
    }
  }
  _start_sdemo:play(L0_70, L1_71)
  waitSeconds(2.5)
  Fn_captionView("ep03_05002")
  waitSeconds(0.5)
  Fn_resetPcPos("locator2_pc_start_pos")
  waitSeconds(1.2)
  _start_sdemo:stop()
end
function litho_init()
  local L0_72, L1_73, L2_74, L3_75
  L0_72(L1_73)
  _area_04_hdl = L0_72
  for L3_75 = 1, _cactus_max do
    _cactus_hdl[L3_75] = _area_04_hdl:findChildNode(string.format("az_grab_cactus_04_%02d", L3_75), true)
    if _cactus_hdl[L3_75] ~= nil then
      if _cactus_hdl[L3_75]:isBroken() then
        _cactus_hdl[L3_75]:requestRestoreForce()
      end
    else
      break
    end
  end
  for L3_75, _FORV_4_ in L0_72(L1_73) do
    if _FORV_4_:isBroken() then
      _FORV_4_:requestRestoreForce()
    end
  end
  _enemy_spawn_task = L0_72
end
function prog_manage()
  if _enm_litho_03_01_01_h ~= nil then
    _enm_litho_03_01_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_03_01_01:isEnemyAllDead()
  if _enm_litho_03_01_02_h ~= nil then
    _enm_litho_03_01_02_h:requestSpawn()
  end
  EventHelper:timerCallback("imp_caption", 2, function()
    Fn_captionView("ep03_05005")
  end)
  repeat
    wait()
  until enmgen_litho_03_01_02:isEnemyAllDead()
  if _enm_litho_03_02_01_h ~= nil then
    _enm_litho_03_02_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_litho_03_02_01:isEnemyAllDead() and _spgem_info
  if _enm_litho_03_03_01_h ~= nil then
    _enm_litho_03_03_01_h:requestSpawn()
  end
end
function createGem(A0_76, A1_77)
  local L2_78, L3_79, L4_80
  L3_79 = A0_76
  L2_78 = A0_76.getName
  L2_78 = L2_78(L3_79)
  if L2_78 ~= nil then
    L3_79 = print
    L4_80 = "***** Gam create : "
    L4_80 = L4_80 .. L2_78 .. " *****"
    L3_79(L4_80)
    L3_79 = createGameObject2
    L4_80 = "Gem"
    L3_79 = L3_79(L4_80)
    L4_80 = L3_79.setName
    L4_80(L3_79, L2_78)
    L4_80 = L3_79.setGemModelNo
    L4_80(L3_79, A1_77)
    L4_80 = A0_76.getWorldPos
    L4_80 = L4_80(A0_76)
    L4_80 = L4_80 + Vector(0, 0, 0)
    L3_79:setWorldPos(L4_80)
    L3_79:setForceMove()
    L3_79:setVisibleBlockHalfSize(150)
    L3_79:setVisible(true)
    L3_79:try_init()
    L3_79:waitForReadyAsync(function()
      L3_79:try_start()
    end)
    return L3_79
  else
  end
  L3_79 = nil
  return L3_79
end
function pccubesensor2_vc_on_OnEnter(A0_81)
  if _spgem_set == false then
    _spgem_set = true
    invokeTask(function()
      Fn_pcSensorOff("pccubesensor2_vc_on_01")
      Fn_pcSensorOff("pccubesensor2_vc_on_02")
      Fn_pcSensorOff("pccubesensor2_vc_on_03")
      Fn_pcSensorOff("pccubesensor2_vc_on_04")
      _spgem_vc_no = string.sub(A0_81:getName(), -2)
      Fn_vctrlOn(string.format("vctrl2_spgem_%02d", _spgem_vc_no))
      findGameObject2("Node", string.format("gem2_special_litho_03_%02d", _spgem_vc_no)):setActive(true)
      print("spgem_vc_no [ " .. _spgem_vc_no .. " ]")
      print("vctrl       [ " .. string.format("vctrl2_spgem_%02d", _spgem_vc_no) .. " ]")
      print("spgem       [" .. string.format("gem2_special_litho_03_%02d", _spgem_vc_no) .. " ]")
      waitSeconds(1)
      Fn_vctrlOff(string.format("vctrl2_spgem_%02d", _spgem_vc_no))
      invokeTask(specialGemrReset, 10)
      _spgem_vc = true
    end)
  end
end
_specialgem_time = 60
function specialGemrReset(A0_82)
  if A0_82 ~= nil then
    _specialgem_time = A0_82
  end
  GlobalGem:SetSpecialGemGetCallback("specialGemReCreate")
end
function specialGemReCreate(A0_83)
  invokeTask(function()
    waitSeconds(_specialgem_time)
    createGem(A0_83, 6)
  end)
end
function Finalize()
  if Fn_getPlayer() then
    Fn_unLockPlayerAbility(Player.kAbility_GravityShift)
  end
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpEnable, true)
end
