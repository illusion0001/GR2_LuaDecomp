dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("Pad")
_litho_theme = nil
_enm_litho_01_01_h = false
_enm_litho_01_02_h = false
_imp_info = false
_debug_flag = true
_enemy_max = 0
enmgen_litho_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_01_enm_01_01",
      name = "litho_01_enemy_01"
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
      "litho_01_enemy_01"
    }, 1, 5)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
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
enmgen_litho_01_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_01_enm_01_02",
      name = "litho_01_enemy_02"
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
      "litho_01_enemy_02"
    }, 1, 5)
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
  Fn_vctrlOff("vctrl2_litho_start_01")
  _enm_litho_01_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_01_01")
  _enm_litho_01_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_01_02")
  _enemy_max = enmgen_litho_01_01:getEnemyMax() + enmgen_litho_01_02:getEnemyMax()
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_a")
  _catwarp_change = false
end
function Ingame()
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  invokeTask(function()
    repeat
      wait()
    until Player:getRecentAreaName() == "az_a_02" or _catwarp_change
    print(Player:getRecentAreaName())
    print(tostring(_catwarp_change))
    Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_b")
    print("***** ep03_catwarp point:" .. Fn_getCatWarpCheckPoint() .. " *****")
  end)
  Fn_missionStart()
  Fn_userCtrlOn()
  _litho_navi = invokeTask(function()
    local L0_42
    L0_42 = false
    Fn_captionView("ep03_01003")
    waitSeconds(1)
    invokeTask(function()
      waitSeconds(1)
      Fn_sendEventComSb("ViewMission")
    end)
    repeat
      if L0_42 == false and Fn_getDistanceToPlayer("locator2_litho_navi_01_02") > 5 then
        L0_42 = true
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_01_02"))
        if not _catwarp_change then
          _catwarp_change = true
        end
      elseif L0_42 == true and Fn_getDistanceToPlayer("locator2_litho_navi_01_02") < 5 then
        L0_42 = false
        Fn_naviKill()
      end
      wait()
    until false
  end)
  Fn_sendEventComSb("missionTextVisible", false)
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  _litho_navi:abort()
  Fn_sendEventComSb("requestGemReset", 1)
  Fn_sendEventComSb("vitalGemrReset", "20")
  Fn_sendEventComSb("enargyGemrReset", "20")
  waitSeconds(2)
  Fn_kaiwaDemoView("ep03_00220k")
  Fn_sendEventComSb("missionTextVisible", true)
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  litho_init()
  invokeTask(function()
    invokeTask(function()
      repeat
        wait()
      until _imp_info
      if GameDatabase:get(ggd.Savedata__Info__ep03__ep03_info_06) ~= 2 then
        HUD:info("ep03_info_06", false)
      else
        HUD:info("ep03_info_06", true)
      end
    end)
    _imp_info_timer = EventHelper:timerCallback("imp_info", 15, function()
      local L0_43, L1_44
      _imp_info = true
    end)
    repeat
      wait()
    until enmgen_litho_01_01:isEnemyAllDead()
    _imp_info_timer:abort()
    waitSeconds(2)
    _imp_info = true
  end)
  invokeTask(function()
    local L0_45
    L0_45 = false
    repeat
      if L0_45 == false and Fn_getDistanceToPlayer("locator2_litho_navi_01") > 50 then
        L0_45 = true
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_01"))
      elseif L0_45 == true and Fn_getDistanceToPlayer("locator2_litho_navi_01") < 25 then
        L0_45 = false
        Fn_naviKill()
      end
      wait()
    until _litho_theme
    Fn_naviKill()
  end)
  invokeTask(function()
    Fn_missionView("ep03_01005", nil, nil, true)
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetTextID("ep03_09013")
    HUD:counter999SetNum(_enemy_max)
    HUD:counter999SetVisible(true)
    Fn_setBgmPoint("battle")
    Fn_captionViewWait("ep03_01001")
  end)
  invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen_litho_01_02:isEnemyAllDead()
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end)
  repeat
    wait()
  until _litho_theme
  HUD:counter999SetVisible(false)
  Fn_setBgmPoint("event", "battle_end")
  if _catwarp_idling_task ~= nil then
    _catwarp_idling_task:abort()
  end
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_kaiwaDemoView("ep03_00230k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_init()
  print("*** ep03_b:litho_init ***")
  Fn_userCtrlAllOff()
  Fn_coercionPoseNomal()
  _enemy_spawn_task = invokeTask(prog_manage)
  waitSeconds(0.5)
  Fn_vctrlOn("vctrl2_litho_start_01")
  waitSeconds(0.5)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_litho_01_enemy_aim"):getWorldPos())
  waitSeconds(1)
  Fn_resetCoercionPose()
  wait()
  Fn_vctrlOff("vctrl2_litho_start_01")
  Fn_userCtrlOn()
  Fn_captionViewWait("ep03_01002")
end
function prog_manage()
  _catwarp_idling_task = invokeTask(enemy_catwarp_idling)
  if _enm_litho_01_01_h ~= nil then
    _enm_litho_01_01_h:requestSpawn()
  end
  _enm_litho_01_01_h:requestIdlingEnemy(true)
  waitSeconds(0.05)
  _enm_litho_01_01_h:requestIdlingEnemy(false)
  repeat
    wait()
  until enmgen_litho_01_01:isEnemyAllDead()
  if _enm_litho_01_02_h ~= nil then
    _enm_litho_01_02_h:requestSpawn()
  end
end
function enemy_catwarp_idling()
  local L0_46
  L0_46 = Fn_sendEventComSb
  L0_46 = L0_46("CatwarpWaitTime")
  repeat
    repeat
      wait()
    until Fn_sendEventComSb("isCatwarpStart")
    if _enm_litho_01_01_h ~= nil then
      _enm_litho_01_01_h:requestIdlingEnemy(true)
    end
    if _enm_litho_01_02_h ~= nil then
      _enm_litho_01_02_h:requestIdlingEnemy(true)
    end
    waitSeconds(L0_46)
    if _enm_litho_01_01_h ~= nil then
      _enm_litho_01_01_h:requestIdlingEnemy(false)
    end
    if _enm_litho_01_02_h ~= nil then
      _enm_litho_01_02_h:requestIdlingEnemy(false)
    end
    wait()
  until _litho_theme
end
function Finalize()
  local L0_47, L1_48
end
