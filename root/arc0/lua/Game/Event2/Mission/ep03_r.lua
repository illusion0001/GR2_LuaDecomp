dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("HUD")
import("GlobalGem")
_litho_09_goal = false
_litho_theme = nil
_enm_litho_09_01_h = nil
_enm_litho_09_02_h = nil
_enm_litho_09_03_h = nil
_enm_litho_09_04_h = nil
_enm_litho_09_05_h = nil
_enm_litho_09_06_h = nil
_enm_litho_09_07_h = nil
_poison_first_flag = true
_check_point_navi = nil
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_poison_task = nil
_catwarp = false
_island_sink_tbl = {
  {
    loc = "litho_09_01_sink"
  },
  {
    loc = "litho_09_02_sink"
  },
  {
    loc = "litho_09_03_sink"
  }
}
_debug_flag = false
_sink_island = nil
enmgen_litho_09_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_09_03_01",
      name = "litho_09_enemy_09"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_09_03_02",
      name = "litho_09_enemy_10"
    },
    {
      type = "stalker",
      locator = "locator_litho_09_03_03",
      name = "litho_09_enemy_11"
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
    A0_6:setEnemyMarker(false)
  end,
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "litho_09_enemy_11"
    }, 1, 5)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
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
enmgen_litho_09_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_litho_09_05_01",
      name = "litho_09_enemy_13"
    },
    {
      type = "runner",
      locator = "locator_litho_09_05_02",
      name = "litho_09_enemy_14"
    },
    {
      type = "runner",
      locator = "locator_litho_09_05_03",
      name = "litho_09_enemy_15"
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
    A0_27:setEnemyMarker(false)
  end,
  onSetupGem = function(A0_29, A1_30)
    Fn_enemyPopGemSetup(A0_29, {
      "litho_09_enemy_13",
      "litho_09_enemy_14",
      "litho_09_enemy_15"
    }, 1, 5)
  end,
  onPopGem = function(A0_31, A1_32)
    Fn_enemyAshPopGem(A0_31, A1_32)
  end,
  onObjectDead = function(A0_33, A1_34)
  end,
  onObjectAsh = function(A0_35, A1_36)
    A0_35:getSpecTable().enemyDeadNum = A0_35:getSpecTable().enemyDeadNum + 1
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
enmgen_litho_09_06 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_litho_09_06_01",
      name = "litho_09_enemy_16"
    },
    {
      type = "runner",
      locator = "locator_litho_09_06_02",
      name = "litho_09_enemy_17"
    },
    {
      type = "guardcore",
      locator = "locator_litho_09_06_03",
      name = "litho_09_enemy_18"
    },
    {
      type = "stalker",
      locator = "locator_litho_09_06_04",
      name = "litho_09_enemy_19"
    },
    {
      type = "stalker",
      locator = "locator_litho_09_06_05",
      name = "litho_09_enemy_20"
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onSetupGem = function(A0_48, A1_49)
    Fn_enemyPopGemSetup(A0_48, {
      "litho_09_enemy_19",
      "litho_09_enemy_20"
    }, 1, 5, "b1")
    Fn_enemyPopGemSetup(A0_48, {
      "litho_09_enemy_16",
      "litho_09_enemy_17"
    }, 1, 4, "e1")
    Fn_enemyPopGemSetup(A0_48, {
      "litho_09_enemy_18"
    }, 1, 6, "s1")
  end,
  onPopGem = function(A0_50, A1_51)
    Fn_enemyAshPopGem(A0_50, A1_51, {
      "b1",
      "e1",
      "s1"
    })
  end,
  onSpawn = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyDeadNum = A0_52:getSpecTable().enemyDeadNum - 1
    if A0_52:getSpecTable().enemyDeadNum < 0 then
      A0_52:getSpecTable().enemyDeadNum = 0
    end
    A0_52:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
    A0_56:getSpecTable().enemyDeadNum = A0_56:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_58)
    return #A0_58.spawnSet
  end,
  getEnemyDeadNum = function(A0_59)
    local L1_60
    L1_60 = A0_59.enemyDeadNum
    return L1_60
  end,
  isEnemyAllDead = function(A0_61)
    local L2_62
    L2_62 = A0_61.enemyDeadNum
    L2_62 = L2_62 >= #A0_61.spawnSet
    return L2_62
  end
}
enmgen_litho_09_07 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon",
      locator = "locator_litho_09_07_01",
      name = "litho_09_enemy_21"
    },
    {
      type = "treecannon",
      locator = "locator_litho_09_07_02",
      name = "litho_09_enemy_22"
    }
  },
  onUpdate = function(A0_63)
    local L1_64
  end,
  onEnter = function(A0_65)
    local L1_66
  end,
  onLeave = function(A0_67)
    local L1_68
  end,
  onSpawn = function(A0_69, A1_70)
    A0_69:getSpecTable().enemyDeadNum = A0_69:getSpecTable().enemyDeadNum - 1
    if A0_69:getSpecTable().enemyDeadNum < 0 then
      A0_69:getSpecTable().enemyDeadNum = 0
    end
    A0_69:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_71, A1_72)
  end,
  onObjectAsh = function(A0_73, A1_74)
    A0_73:getSpecTable().enemyDeadNum = A0_73:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_75)
    return #A0_75.spawnSet
  end,
  getEnemyDeadNum = function(A0_76)
    local L1_77
    L1_77 = A0_76.enemyDeadNum
    return L1_77
  end,
  isEnemyAllDead = function(A0_78)
    local L2_79
    L2_79 = A0_78.enemyDeadNum
    L2_79 = L2_79 >= #A0_78.spawnSet
    return L2_79
  end
}
function Initialize()
  _enm_litho_09_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_09_03")
  _enm_litho_09_05_h = findGameObject2("EnemyGenerator", "enmgen2_litho_09_05")
  _enm_litho_09_06_h = findGameObject2("EnemyGenerator", "enmgen2_litho_09_06")
  _enm_litho_09_07_h = findGameObject2("EnemyGenerator", "enmgen2_litho_09_07")
  Fn_vctrlOff("vctrl2_litho_09_route")
  Fn_pcSensorOff("pccubesensormulti2_out")
  _event_motion_table = {
    label01 = "kit01_stay_heat_00",
    label02 = "kit01_stay_00"
  }
  Fn_loadPlayerMotion(_event_motion_table)
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_q")
  _catwarp_change = false
end
function Ingame()
  Fn_setCatWarp(false)
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  invokeTask(function()
    repeat
      wait()
    until Player:getRecentAreaName() == "az_a_10"
    Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_r")
    print("***** ep03_catwarp point:" .. Fn_getCatWarpCheckPoint() .. " *****")
  end)
  if GameDatabase:get(ggd.GlobalSystemFlags__GameRetry) then
    Fn_resetPcPos("locator2_pc_restart_00")
  end
  Fn_missionStart()
  Fn_userCtrlOn()
  if _debug_flag then
    invokeTask(function()
      repeat
        debugDispPrint("_catwarp : " .. tostring(_catwarp))
        wait()
      until false
    end)
  end
  invokeTask(function()
    Fn_sendEventComSb("ViewMission")
    waitSeconds(1.3)
    repeat
      if false == false and Fn_getDistanceToPlayer("locator2_litho_navi_09_02") > 5 then
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_09_02"))
        if not _catwarp_change then
          _catwarp_change = true
        end
      elseif true == true and Fn_getDistanceToPlayer("locator2_litho_navi_09_02") < 5 then
        Fn_naviKill()
      end
      wait()
    until Fn_sendEventComSb("isLithographStart")
  end)
  if GameDatabase:get(ggd.GlobalSystemFlags__GameRetry) then
    Fn_sendEventComSb("LithographStart")
  end
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  Fn_playPlayerMotion(_event_motion_table.label01, 0, 0.15)
  Fn_captionViewWait("ep03_18004")
  theme_set()
  enargyGemrReset(10)
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_vctrlOn("vctrl2_litho_09_route")
  Fn_userCtrlAllOff()
  Player:setStay(true)
  waitSeconds(1.5)
  if GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_04) ~= 2 then
    HUD:info("ep03_info_04", false)
  elseif GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_04) == 2 then
    HUD:info("ep03_info_04", true)
  end
  Fn_vctrlOff("vctrl2_litho_09_route")
  Fn_unLockPlayerAbility(Player.kAbility_Slider)
  Fn_unlockPlayerLevelCap("Slider")
  Fn_lockPlayerAbility(Player.kAbility_GravityShift)
  Fn_lockPlayerAbility(Player.kAbility_GravityKick)
  HUD:grgDispReq_CutIn()
  Fn_playPlayerMotion(_event_motion_table.label02, 0, 0.3)
  Fn_userCtrlOn()
  Player:setStay(false)
  invokeTask(function()
    Fn_missionView("ep03_18003", nil, nil, true)
    Fn_naviSet(findGameObject2("Node", "locator2_checkpoint_navi_01"))
    waitSeconds(3.8)
    Fn_captionViewWait("ep03_18000")
    invokeTask(function()
      local L0_80
      L0_80 = false
      repeat
        if L0_80 == false and Pad:getButton(Pad.kButton_L2) == false then
          Fn_tutorialCaption("slider")
          L0_80 = true
        elseif L0_80 == true and Pad:getButton(Pad.kButton_L2) == true then
          L0_80 = false
          Fn_tutorialCaptionKill()
        end
        wait()
      until _litho_theme
    end)
  end)
  invokeTask(function()
    repeat
      repeat
        wait()
      until _litho_09_goal
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end)
  repeat
    if _litho_theme == false then
      restart_litho()
    end
    wait()
  until _litho_theme
  Fn_pcSensorOff("pccubesensormulti2_out")
  Fn_userCtrlAllOff()
  Player:setStay(true)
  Fn_sendEventComSb("setSecondHalfProcessPre")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessPreStart")
  Fn_naviKill()
  _poison_task:abort()
  if _enm_litho_09_03_h ~= nil then
    _enm_litho_09_03_h:requestAllEnemyKill(true)
  end
  if _enm_litho_09_05_h ~= nil then
    _enm_litho_09_05_h:requestAllEnemyKill(true)
  end
  if _enm_litho_09_06_h ~= nil then
    _enm_litho_09_06_h:requestAllEnemyKill(true)
  end
  if _enm_litho_09_07_h ~= nil then
    _enm_litho_09_07_h:requestAllEnemyKill(true)
  end
  Fn_sendEventComSb("requestPauseArea", "az_a_10", true)
  wait()
  Fn_sendEventComSb("requestStopArea", "az_a_10")
  wait()
  Fn_sendEventComSb("requestWarpArea", "az_a_10", "locator2_az_a_10_set_06", 0)
  repeat
    wait()
  until Fn_sendEventComSb("isAreaWarpEnd")
  Fn_sendEventComSb("setSecondHalfProcessPreEnd")
  Fn_findAreaHandle("az_a_07"):setExpandedAabb(true)
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("az_a_catwarp", true)
  Fn_unLockPlayerAbility(Player.kAbility_GravityShift)
  Fn_unLockPlayerAbility(Player.kAbility_GravityKick)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function theme_set()
  print("*** ep03_r: theme_set ***")
  litho_init()
  Fn_pcSensorOn("pccubesensormulti2_out")
  Fn_sendEventComSb("az_a_catwarp", false)
  if _poison_task ~= nil then
    _poison_task:abort()
  end
  _poison_task = invokeTask(poison_gas_check)
  Fn_pcSensorOn("pccubesensor2_checkpoint_01")
  Fn_pcSensorOn("pccubesensor2_checkpoint_02")
  Fn_pcSensorOn("pccubesensor2_checkpoint_03")
  Fn_pcSensorOn("pccubesensor2_checkpoint_04")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
end
function litho_init()
  print("*** ep03_r:litho_init ***")
  if _enm_litho_09_03_h ~= nil then
    _enm_litho_09_03_h:requestSpawn()
  end
  if _enm_litho_09_05_h ~= nil then
    _enm_litho_09_05_h:requestSpawn()
  end
  if _enm_litho_09_06_h ~= nil then
    _enm_litho_09_06_h:requestSpawn()
  end
  if _enm_litho_09_07_h ~= nil then
    _enm_litho_09_07_h:requestSpawn()
  end
end
function restart_litho()
  print("*** ep03_r:restart_litho ***")
  Player:applyPoisonDamage(0, 0.01)
  Fn_naviKill()
  Fn_userCtrlAllOff()
  Player:setStay(true)
  Fn_sendEventComSb("requestPauseArea", "az_a_10", true)
  wait()
  Fn_sendEventComSb("requestWarpArea", "az_a_10", "locator2_az_a_10_set_06", 0)
  repeat
    wait()
  until Fn_sendEventComSb("isAreaWarpEnd")
  if _enm_litho_09_03_h ~= nil then
    _enm_litho_09_03_h:requestAllEnemyKill()
  end
  if _enm_litho_09_05_h ~= nil then
    _enm_litho_09_05_h:requestAllEnemyKill()
  end
  if _enm_litho_09_06_h ~= nil then
    _enm_litho_09_06_h:requestAllEnemyKill()
  end
  if _enm_litho_09_07_h ~= nil then
    _enm_litho_09_07_h:requestAllEnemyKill()
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  if _poison_first_flag == false then
    GameDatabase:set(ggd.EventFlags__ep03__flag01, 0)
  end
  Fn_missionRetry(true)
end
function pccubesensor2_litho_09_goal_OnEnter()
  if _litho_09_goal == false then
    Fn_naviKill()
    _litho_09_goal = true
    Fn_pcSensorOff("pccubesensor2_litho_09_goal")
  end
end
function pccubesensormulti2_out_OnLeave()
  checkpoint_restart()
end
function checkpoint_restart()
  invokeTask(function()
    if _litho_theme == nil then
      print("***** area out >>> catwarp *****")
      invokeTask(function()
        Fn_sendEventComSb("requestPauseArea", "az_a_10", true)
        wait()
        if _catwarp == false then
          _catwarp = true
          Fn_catWarp()
          HUD:grgDispReq_CutIn()
          EventHelper:timerCallback("catwarp_end", 3, function()
            local L0_81, L1_82
            _catwarp = false
          end)
        else
          repeat
            wait()
          until _catwarp
        end
        waitSeconds(6)
        if _litho_theme ~= false then
          Fn_sendEventComSb("requestPauseArea", "az_a_10", false)
          wait()
          if _sink_island ~= nil then
            Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[_sink_island].loc)
          end
        end
      end)
    end
  end)
end
function pccubesensor2_checkpoint_01_OnEnter(A0_83)
  print("***** restart point >> locator2_pc_restart_01")
  Fn_pcSensorOff(A0_83)
  Fn_setCatWarpCheckPoint("locator2_pc_restart_01")
  Fn_naviSet(findGameObject2("Node", "locator2_checkpoint_navi_02"))
end
function pccubesensor2_checkpoint_02_OnEnter(A0_84)
  print("***** restart point >> locator2_pc_restart_02")
  Fn_pcSensorOff(A0_84)
  Fn_setCatWarpCheckPoint("locator2_pc_restart_02")
  Fn_naviSet(findGameObject2("Node", "locator2_checkpoint_navi_03"))
  _sink_island = 1
  Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[_sink_island].loc)
end
function pccubesensor2_checkpoint_03_OnEnter(A0_85)
  print("***** restart point >> locator2_pc_restart_03")
  Fn_pcSensorOff(A0_85)
  Fn_setCatWarpCheckPoint("locator2_pc_restart_03")
  Fn_naviSet(findGameObject2("Node", "locator2_checkpoint_navi_04"))
  _sink_island = 2
  Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[_sink_island].loc)
end
function pccubesensor2_checkpoint_04_OnEnter(A0_86)
  print("***** restart point >> locator2_pc_restart_04")
  Fn_pcSensorOff(A0_86)
  Fn_setCatWarpCheckPoint("locator2_pc_restart_04")
  Fn_naviSet(findGameObject2("Node", "locator2_checkpoint_goal"))
  _sink_island = 3
  Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[_sink_island].loc)
end
function poison_gas_check()
  if GameDatabase:get(ggd.EventFlags__ep03__flag01) ~= 4 then
    GameDatabase:set(ggd.EventFlags__ep03__flag01, 4)
    _poison_first_flag = false
  end
  repeat
    wait()
  until Fn_sendEventComSb("isPoisonAreaIN")
  print("***** posion gas IN *****")
  Player:applyPoisonDamage(0, 0.01)
  checkpoint_restart()
end
function createGem(A0_87, A1_88)
  local L2_89, L3_90, L4_91
  L3_90 = A0_87
  L2_89 = A0_87.getName
  L2_89 = L2_89(L3_90)
  if L2_89 ~= nil then
    L3_90 = print
    L4_91 = "***** Gam create : "
    L4_91 = L4_91 .. L2_89 .. " *****"
    L3_90(L4_91)
    L3_90 = createGameObject2
    L4_91 = "Gem"
    L3_90 = L3_90(L4_91)
    L4_91 = L3_90.setName
    L4_91(L3_90, L2_89)
    L4_91 = L3_90.setGemModelNo
    L4_91(L3_90, A1_88)
    L4_91 = A0_87.getWorldPos
    L4_91 = L4_91(A0_87)
    L4_91 = L4_91 + Vector(0, 0, 0)
    L3_90:setWorldPos(L4_91)
    L3_90:setForceMove()
    L3_90:setVisibleBlockHalfSize(150)
    L3_90:setVisible(true)
    L3_90:try_init()
    L3_90:waitForReadyAsync(function()
      L3_90:try_start()
    end)
    return L3_90
  else
  end
  L3_90 = nil
  return L3_90
end
_enargygem_time = 20
function enargyGemrReset(A0_92)
  if A0_92 ~= nil then
    _enargygem_time = A0_92
  end
  GlobalGem:SetEnargyGemGetCallback("enargyGemReCreate")
end
function enargyGemReCreate(A0_93)
  invokeTask(function()
    waitSeconds(_enargygem_time)
    createGem(A0_93, 4)
  end)
end
function Finalize()
  if Fn_getPlayer() then
    Fn_unLockPlayerAbility(Player.kAbility_GravityShift)
    Fn_unLockPlayerAbility(Player.kAbility_GravityKick)
  end
  if Fn_findAreaHandle("az_a_07") ~= nil then
    Fn_findAreaHandle("az_a_07"):setExpandedAabb(false)
  end
end
