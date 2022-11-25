dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep26_common.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
_core_cnt = 0
_time_cnt = 0
_breakcore_No = nil
bomb_time = 150
bomb_rand = 10
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01"
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
  onObjectDead = function(A0_6, A1_7)
  end
}
function Initialize()
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L0_8 = Fn_dtDemoObjectActive
  L1_9 = false
  L0_8(L1_9)
  L0_8 = Fn_MechCannonStartControlMode
  L0_8()
  L0_8 = setDebugDispMission
  L0_8()
  L0_8 = invokeTask
  function L1_9()
    while true do
      setDebugDispMissionText("core_cnt  : " .. tostring(_core_cnt))
      wait()
    end
  end
  L0_8(L1_9)
  while true do
    while true do
      L0_8 = _demon_puppet
      if L0_8 == nil then
        L0_8 = Fn_sendEventComSb
        L1_9 = "boss_name"
        L0_8 = L0_8(L1_9)
        _demon_puppet = L0_8
        L0_8 = wait
        L0_8()
      end
    end
  end
  while true do
    L0_8 = _demon_brain
    if L0_8 == nil then
      L0_8 = _demon_puppet
      L1_9 = L0_8
      L0_8 = L0_8.getBrain
      L0_8 = L0_8(L1_9)
      _demon_brain = L0_8
      L0_8 = wait
      L0_8()
    end
  end
  L0_8 = invokeTask
  function L1_9()
    boss_gauge = HUD:createBossHpGauge({
      obj = _demon_puppet
    })
    boss_gauge:setActive(true)
    while _demon_puppet:isRunning() do
      demon_health = _demon_brain:getHealth()
      boss_gauge:setHp((demon_health - _demon_brain:getMaxHealth() * 0.2867) / (_demon_brain:getMaxHealth() - _demon_brain:getMaxHealth() * 0.2867))
      wait()
    end
  end
  L0_8 = L0_8(L1_9)
  gauge_task = L0_8
  L0_8 = Fn_sendEventComSb
  L1_9 = "partchange"
  L0_8(L1_9)
  L0_8 = Fn_warshipWarpRequest
  L1_9 = findGameObject2
  L7_15 = L1_9(L2_10, L3_11)
  L0_8(L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L1_9(L2_10, L3_11))
  L0_8 = Fn_missionStart
  L0_8()
  L0_8 = Fn_userCtrlOn
  L0_8()
  L0_8 = Fn_captionViewWait
  L1_9 = "ep26_01000"
  L0_8(L1_9)
  L0_8 = Fn_captionViewWait
  L1_9 = "ep26_01001"
  L0_8(L1_9)
  L0_8 = {}
  L1_9 = {}
  for L5_13 = 1, 12 do
    L6_14 = {}
    L7_15 = string
    L7_15 = L7_15.format
    L7_15 = L7_15("%02d", L5_13)
    L6_14 = _demon_puppet:getJointWorldTransform("loc_setCore" .. L7_15)
    table.insert(L1_9, L6_14)
  end
  L3_11(L4_12)
  repeat
    _core_cnt = L3_11
    L3_11()
    L5_13 = _core_cnt
    L3_11(L4_12)
  until L3_11 >= 8
  L5_13 = false
  L3_11(L4_12, L5_13)
  if L3_11 ~= nil then
    L3_11(L4_12)
    gauge_task = nil
  end
  L3_11()
  L3_11()
  L3_11()
  L3_11()
end
function Finalize()
  Player:muteVoice(Player.kVoiceMuteLv_NoMute)
end
function navi_on()
  local L0_16, L1_17
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
