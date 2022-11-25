dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_ENEMYMARKER_RANGE = 50
_enemy_count = 0
_quota = {}
_next_phase = false
_next_phase2 = false
_is_in_sensor = false
_currentMissionText = ""
enmgen2_battle_e_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_e1_01",
      name = "enemy11"
    },
    {
      type = "stalker",
      locator = "locator_e1_02",
      name = "enemy12"
    },
    {
      type = "stalker",
      locator = "locator_e1_03",
      name = "enemy13"
    },
    {
      type = "stalker",
      locator = "locator_e1_04",
      name = "enemy14"
    },
    {
      type = "stalker",
      locator = "locator_e1_05",
      name = "enemy15"
    },
    {
      type = "gellyfish",
      locator = "locator_e1_06",
      name = "enemy16"
    },
    {
      type = "gellyfish",
      locator = "locator_e1_07",
      name = "enemy17"
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
  end,
  onObjectDead = function(A0_10, A1_11)
    A0_10:getSpecTable().deadEnemies = A0_10:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "enemy11",
      "enemy12",
      "enemy13",
      "enemy14",
      "enemy15"
    }, 3, _GEM.VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_battle_e_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_e2_01",
      name = "enemy21"
    },
    {
      type = "gellyfish",
      locator = "locator_e2_02",
      name = "enemy22"
    },
    {
      type = "gellyfish",
      locator = "locator_e2_03",
      name = "enemy23"
    },
    {
      type = "gellyfish",
      locator = "locator_e2_04",
      name = "enemy24"
    },
    {
      type = "gellyfish",
      locator = "locator_e2_05",
      name = "enemy25"
    },
    {
      type = "stalker",
      locator = "locator_e2_06",
      name = "enemy26"
    },
    {
      type = "stalker",
      locator = "locator_e2_07",
      name = "enemy27"
    },
    {
      type = "stalker",
      locator = "locator_e2_08",
      name = "enemy28"
    },
    {
      type = "stalker",
      locator = "locator_e2_09",
      name = "enemy29"
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
  end,
  onObjectDead = function(A0_26, A1_27)
    A0_26:getSpecTable().deadEnemies = A0_26:getSpecTable().deadEnemies + 1
    _enemy_count = _enemy_count - 1
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {
      "enemy21",
      "enemy22",
      "enemy23",
      "enemy24",
      "enemy25"
    }, 3, _GEM.VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
function Initialize()
  Fn_pcSensorOff("pcspheresensor2_e_01")
  Fn_pcSensorOff("pcspheresensor2_e_02")
  Fn_pcSensorOff("pccubesensor2_e_04")
  Fn_pcSensorOff("pccubesensormulti2_01")
  HUD:enemymarkerSetRange(_ENEMYMARKER_RANGE)
  GlobalGem:SetVitalGemGetCallback("onGetVitalGem")
end
function Ingame()
  local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39
  L0_32(L1_33)
  for L3_35 = 1, 7 do
    L7_39 = "gem2_energy_%02d"
    L7_39 = L6_38(L7_39, L3_35)
    L7_39 = false
    L5_37(L6_38, L7_39)
  end
  L0_32()
  L0_32()
  _next_phase2 = false
  _is_in_sensor = false
  L0_32(L1_33)
  L0_32(L1_33)
  if L0_32 ~= nil then
    L1_33(L2_34)
  end
  L1_33(L2_34, L3_35)
  _currentMissionText = "ep02_04001"
  L1_33(L2_34)
  L1_33(L2_34)
  L7_39 = L2_34(L3_35, L4_36)
  L1_33(L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L2_34(L3_35, L4_36))
  L1_33(L2_34)
  L1_33(L2_34)
  L1_33(L2_34)
  while true do
    if L1_33 then
      L1_33(L2_34)
      if not L1_33 then
        L1_33(L2_34, L3_35)
      end
      break
    end
    L1_33()
  end
  L1_33()
  L1_33()
  L1_33(L2_34, L3_35, L4_36)
  L1_33(L2_34, L3_35)
  while true do
    if not L2_34 then
      if L2_34 ~= nil and L1_33 then
        if L3_35 >= L4_36 then
          L3_35(L4_36)
          L3_35(L4_36)
        end
      end
      L3_35()
    end
  end
  L2_34(L3_35)
  L2_34(L3_35)
  L2_34(L3_35)
  _is_in_sensor = false
  for L5_37 = 1, 4 do
    L7_39 = "Gem"
    L7_39 = L6_38.setActive
    L7_39(L6_38, true)
  end
  _next_phase2 = false
  L2_34(L3_35)
  L2_34(L3_35)
  L7_39 = L3_35(L4_36, L5_37)
  L2_34(L3_35, L4_36, L5_37, L6_38, L7_39, L3_35(L4_36, L5_37))
  if L2_34 ~= nil then
    _enemy_count = L3_35
    L3_35(L4_36)
  end
  L3_35()
  L3_35()
  L3_35(L4_36, L5_37)
  L3_35(L4_36, L5_37)
  while true do
    if not L4_36 then
      if L4_36 ~= nil and L3_35 then
        L7_39 = L4_36
        if L5_37 >= L6_38 then
          L5_37(L6_38)
          L5_37(L6_38)
        end
      end
      L5_37()
    end
  end
  L4_36(L5_37)
  L4_36(L5_37)
  L4_36(L5_37)
  _is_in_sensor = false
  _next_phase2 = false
  L4_36(L5_37)
  L4_36(L5_37)
  L7_39 = 1
  L4_36(L5_37, L6_38, L7_39)
  L4_36(L5_37)
  L4_36(L5_37)
  for L7_39 = 5, 7 do
    findGameObject2("Gem", string.format("gem2_energy_%02d", L7_39)):setActive(true)
  end
  L4_36(L5_37, L6_38)
  L4_36(L5_37)
  _currentMissionText = "ep02_04018"
  L4_36(L5_37)
  L4_36(L5_37)
  L7_39 = "locator2_navi_e_01"
  L7_39 = L5_37(L6_38, L7_39)
  L4_36(L5_37, L6_38, L7_39, L5_37(L6_38, L7_39))
  L4_36(L5_37, L6_38)
  L4_36()
  L4_36()
  L4_36()
  L7_39 = false
  L4_36(L5_37, L6_38, L7_39)
  L4_36()
  L4_36(L5_37, L6_38)
  L4_36(L5_37, L6_38)
  L4_36()
  L4_36(L5_37)
  L4_36(L5_37)
  L4_36(L5_37, L6_38)
  L4_36()
  L4_36()
  L4_36(L5_37, L6_38)
  L4_36()
  L4_36()
  L4_36()
  L4_36()
end
function Finalize()
  local L0_40, L1_41
end
function pcspheresensor2_e_01_OnEnter(A0_42)
  local L1_43
  L1_43 = A0_42.getName
  L1_43 = L1_43(A0_42)
  if L1_43 == "pcspheresensor2_e_01" then
    return
  end
  L1_43 = _is_in_sensor
  if L1_43 then
    return
  end
  _is_in_sensor = true
  L1_43 = "pi_a_03_03"
  invokeTask(function()
    Fn_naviKill()
    if Fn_sendEventComSb("getOreBrokenCount", L1_43) >= Fn_sendEventComSb("getOreQuotaCount", L1_43) then
      if not Fn_isCaptionView("ep02_04004") then
        Fn_captionViewWait("ep02_04004")
      end
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_43) < Fn_sendEventComSb("getOreQuotaCount", L1_43) and Fn_sendEventComSb("getOreBrokenCount", L1_43) > 0 then
      Fn_captionViewWait("ep02_04005")
    else
      Fn_captionViewWait("ep02_04006")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", true)
  _next_phase2 = true
end
function pcspheresensor2_e_01_OnLeave(A0_44)
  local L1_45
  L1_45 = A0_44.getName
  L1_45 = L1_45(A0_44)
  if L1_45 == "pcspheresensor2_e_01_enter" then
    return
  end
  L1_45 = _is_in_sensor
  if not L1_45 then
    return
  end
  _is_in_sensor = false
  L1_45 = "pi_a_03_03"
  sensorLeaveHandler(L1_45)
  invokeTask(function()
    if Fn_sendEventComSb("getOreBrokenCount", L1_45) >= Fn_sendEventComSb("getOreQuotaCount", L1_45) then
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_45) < Fn_sendEventComSb("getOreQuotaCount", L1_45) and Fn_sendEventComSb("getOreBrokenCount", L1_45) > 0 then
      Fn_captionViewWait("ep02_04008")
    else
      Fn_captionViewWait("ep02_04009")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", false)
end
function pcspheresensor2_e_02_OnEnter(A0_46)
  local L1_47
  L1_47 = A0_46.getName
  L1_47 = L1_47(A0_46)
  if L1_47 == "pcspheresensor2_e_02" then
    return
  end
  L1_47 = _is_in_sensor
  if L1_47 then
    return
  end
  _is_in_sensor = true
  L1_47 = "pi_a_06_01"
  invokeTask(function()
    Fn_naviKill()
    if Fn_sendEventComSb("getOreBrokenCount", L1_47) >= Fn_sendEventComSb("getOreQuotaCount", L1_47) then
      if not Fn_isCaptionView("ep02_04010") then
        Fn_captionViewWait("ep02_04010")
      end
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_47) < Fn_sendEventComSb("getOreQuotaCount", L1_47) and Fn_sendEventComSb("getOreBrokenCount", L1_47) > 0 then
      Fn_captionViewWait("ep02_04011")
    else
      Fn_captionViewWait("ep02_04012")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", true)
  _next_phase2 = true
end
function pcspheresensor2_e_02_OnLeave(A0_48)
  local L1_49
  L1_49 = A0_48.getName
  L1_49 = L1_49(A0_48)
  if L1_49 == "pcspheresensor2_e_01_enter" then
    return
  end
  L1_49 = _is_in_sensor
  if not L1_49 then
    return
  end
  _is_in_sensor = false
  L1_49 = "pi_a_06_01"
  sensorLeaveHandler(L1_49)
  invokeTask(function()
    if Fn_sendEventComSb("getOreBrokenCount", L1_49) >= Fn_sendEventComSb("getOreQuotaCount", L1_49) then
    elseif Fn_sendEventComSb("getOreBrokenCount", L1_49) < Fn_sendEventComSb("getOreQuotaCount", L1_49) and Fn_sendEventComSb("getOreBrokenCount", L1_49) > 0 then
      Fn_captionViewWait("ep02_04014")
    else
      Fn_captionViewWait("ep02_04015")
    end
  end)
  Fn_sendEventComSb("setMultiNaviEnable", false)
end
function pccubesensor2_e_04_OnEnter()
  Fn_pcSensorOff("pccubesensormulti2_01")
  invokeTask(function()
    local L0_50
    L0_50 = findGameObject2
    L0_50 = L0_50("Node", "locator2_navi_e_01")
    while true do
      if Fn_isPlayerReyCheck(L0_50, 50) then
        _next_phase2 = true
        break
      end
      waitSeconds(1)
    end
  end)
end
function sensorLeaveHandler(A0_51)
  sensorName = {}
  sensorName.pi_a_03_03 = "pcspheresensor2_e_01"
  sensorName.pi_a_06_01 = "pcspheresensor2_e_02"
  naviName = {}
  naviName.pi_a_03_03 = "locator2_navi_pi_a_03_03"
  naviName.pi_a_06_01 = "locator2_navi_pi_a_06_01"
  if Fn_sendEventComSb("getOreBrokenCount", A0_51) >= Fn_sendEventComSb("getOreQuotaCount", A0_51) then
    Fn_pcSensorOff(sensorName[A0_51])
    Fn_pcSensorOff(sensorName[A0_51] .. "_enter")
  else
    invokeTask(function()
      Fn_missionView(_currentMissionText)
      Fn_naviSet(findGameObject2("Node", naviName[A0_51]))
    end)
  end
end
function pccubesensor2_warp_e_OnEnter()
  local L0_52, L1_53
end
function pccubesensor2_warp_e_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep02_02020")
    Fn_missionView(_currentMissionText)
  end)
end
