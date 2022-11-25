dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_boss_health = 300
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon_freeze",
      locator = "locator_boss_01",
      name = "demon01",
      ai_spawn_option = "Demon/demon_boss_02"
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
enmgen2_durga_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "durga",
      locator = "locator_durga_01",
      name = "durga01"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
  end
}
function Initialize()
  Fn_loadEventData("evx/ep26_boss", "evarea2_dt_c_root", true)
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
end
function Ingame()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24
  L0_16 = Fn_lookAtObject
  L1_17 = "locator2_camera_01"
  L2_18 = 0
  L0_16 = L0_16(L1_17, L2_18)
  view_task = L0_16
  L0_16 = Player
  L1_17 = L0_16
  L0_16 = L0_16.setEnergyFakeLimit
  L2_18 = Player
  L2_18 = L2_18.kEnergy_Life
  L3_19 = 100
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = Player
  L1_17 = L0_16
  L0_16 = L0_16.setAbility
  L2_18 = Player
  L2_18 = L2_18.kAbility_TalismanEffect
  L3_19 = false
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.set
  L2_18 = ggd
  L2_18 = L2_18.Savedata__Menu__MenuUnlock__TopMenuTalisman
  L3_19 = false
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = Fn_createGimmickBg
  L1_17 = "locator2_daemon_01"
  L2_18 = "crystal"
  L3_19 = "nvwol02crystal"
  L4_20 = true
  L0_16 = L0_16(L1_17, L2_18, L3_19, L4_20)
  crystal = L0_16
  L0_16 = findGameObject2
  L1_17 = "EnemyGenerator"
  L2_18 = "enmgen2_a_boss"
  L0_16 = L0_16(L1_17, L2_18)
  if L0_16 ~= nil then
    L2_18 = L0_16
    L1_17 = L0_16.requestSpawn
    L1_17(L2_18)
  end
  L2_18 = L0_16
  L1_17 = L0_16.setEnemyMarker
  L3_19 = false
  L1_17(L2_18, L3_19)
  while true do
    L1_17 = findGameObject2
    L2_18 = "Puppet"
    L3_19 = "demon01"
    L1_17 = L1_17(L2_18, L3_19)
    if L1_17 == nil then
      L1_17 = wait
      L1_17()
    end
  end
  L1_17 = findGameObject2
  L2_18 = "Puppet"
  L3_19 = "demon01"
  L1_17 = L1_17(L2_18, L3_19)
  while true do
    L3_19 = L1_17
    L2_18 = L1_17.getBrain
    L2_18 = L2_18(L3_19)
    if L2_18 == nil then
      L2_18 = wait
      L2_18()
    end
  end
  L3_19 = L1_17
  L2_18 = L1_17.getBrain
  L2_18 = L2_18(L3_19)
  L3_19 = Fn_sendEventComSb
  L4_20 = "demon_del"
  L3_19(L4_20)
  L3_19 = FatalMarker
  L3_19 = L3_19.create
  L4_20 = kFATAL_TYPE_EMP
  L3_19 = L3_19(L4_20)
  L5_21 = L3_19
  L4_20 = L3_19.set
  L6_22 = L1_17
  L7_23 = "loc_setCore13"
  L8_24 = false
  L4_20(L5_21, L6_22, L7_23, L8_24)
  L4_20 = invokeTask
  function L5_21()
    boss_gauge = HUD:createBossHpGauge({obj = L1_17})
    boss_gauge:setActive(true)
    while L1_17:isRunning() do
      boss_gauge:setHp(L2_18:getHealth() / L2_18:getMaxHealth())
      wait()
    end
  end
  L4_20 = L4_20(L5_21)
  gauge_task = L4_20
  L4_20 = findGameObject2
  L5_21 = "Node"
  L6_22 = "locator2_daemon_01"
  L4_20 = L4_20(L5_21, L6_22)
  L5_21 = L4_20
  L4_20 = L4_20.getWorldPos
  L4_20 = L4_20(L5_21)
  L5_21 = Fn_findGimmickBgInBgset
  L6_22 = "g1_building_pd_77b_01"
  L5_21 = L5_21(L6_22)
  L7_23 = L5_21
  L6_22 = L5_21.requestBreak
  L8_24 = L4_20
  L6_22(L7_23, L8_24, 5, 0.1)
  L6_22 = findGameObject2
  L7_23 = "EnemyGenerator"
  L8_24 = "enmgen2_durga_01"
  L6_22 = L6_22(L7_23, L8_24)
  if L6_22 ~= nil then
    L8_24 = L6_22
    L7_23 = L6_22.requestSpawn
    L7_23(L8_24)
  end
  L8_24 = L6_22
  L7_23 = L6_22.requestIdlingEnemy
  L7_23(L8_24, true)
  L8_24 = L6_22
  L7_23 = L6_22.setEnemyMarker
  L7_23(L8_24, false)
  L7_23 = Player
  L8_24 = L7_23
  L7_23 = L7_23.setAbility
  L7_23(L8_24, {
    Player.kAbility_SpAttack,
    Player.kAbility_SpTornado,
    Player.kAbility_SpTyphoon,
    Player.kAbility_SpBlackHole
  }, false)
  L7_23 = findGameObject2
  L8_24 = "Puppet"
  L7_23 = L7_23(L8_24, "durga01")
  dur_pup = L7_23
  L7_23 = dur_pup
  L8_24 = L7_23
  L7_23 = L7_23.loadPoseAnimation
  L7_23(L8_24, "imprison", "ang01_ep26_imprison_00")
  while true do
    L7_23 = dur_pup
    L8_24 = L7_23
    L7_23 = L7_23.isLoading
    L7_23 = L7_23(L8_24)
    if L7_23 then
      L7_23 = wait
      L7_23()
    end
  end
  L7_23 = dur_pup
  L8_24 = L7_23
  L7_23 = L7_23.getBrain
  L7_23 = L7_23(L8_24)
  dur_brain = L7_23
  L7_23 = dur_brain
  L8_24 = L7_23
  L7_23 = L7_23.setEnableHomingTarget
  L7_23(L8_24, false)
  L7_23 = Fn_createEffect
  L8_24 = "ef_bos_ks06"
  L7_23 = L7_23(L8_24, "ef_bos_ks06", Vector(0, 1.2, 0.7), false)
  durga_eff = L7_23
  L7_23 = dur_pup
  L8_24 = L7_23
  L7_23 = L7_23.appendChild
  L7_23(L8_24, durga_eff)
  L7_23 = Fn_sendEventComSb
  L8_24 = "boss_hearth_return"
  L7_23 = L7_23(L8_24)
  _boss_health = L7_23
  L7_23 = _boss_health
  L8_24 = L2_18.getMaxHealth
  L8_24 = L8_24(L2_18)
  L8_24 = L8_24 * 0.375
  if L7_23 < L8_24 then
    L8_24 = L2_18
    L7_23 = L2_18.getMaxHealth
    L7_23 = L7_23(L8_24)
    L7_23 = L7_23 * 0.375
    _boss_health = L7_23
  end
  L7_23 = print
  L8_24 = "gethealth"
  L8_24 = L8_24 .. _boss_health
  L7_23(L8_24)
  repeat
    L7_23 = wait
    L7_23()
    L8_24 = L2_18
    L7_23 = L2_18.isReadyEnemy
    L7_23 = L7_23(L8_24)
  until L7_23
  L8_24 = L2_18
  L7_23 = L2_18.cmd
  L7_23(L8_24, "setHealth", _boss_health)
  L7_23 = Sound
  L8_24 = L7_23
  L7_23 = L7_23.playSEHandle
  L7_23 = L7_23(L8_24, "ene_durga_crystal_beam", 1, "", durga_eff)
  L8_24 = Fn_missionStart
  L8_24()
  L8_24 = view_task
  if L8_24 ~= nil then
    L8_24 = view_task
    L8_24 = L8_24.abort
    L8_24(L8_24)
    view_task = nil
  end
  L8_24 = dur_pup
  L8_24 = L8_24.playPoseAnimation
  L8_24 = L8_24(L8_24, "imprison")
  print("\227\131\137\227\131\171\227\130\172\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179", L8_24)
  Fn_userCtrlOn()
  Fn_kaiwaDemoView("ep26_00510k")
  Fn_missionView("ep26_03000", 5)
  while not L2_18:isFatalAction() do
    wait()
  end
  L3_19:run()
  repeat
    wait()
  until L3_19:isFatalFinish()
  L3_19:kill()
  L3_19 = nil
  Fn_whiteout(0.3)
  boss_gauge:setActive(false)
  if gauge_task ~= nil then
    gauge_task:abort()
    gauge_task = nil
  end
  Fn_sendEventComSb("demon_spown")
  Sound:stopSEHandle(L7_23)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setAbility(Player.kAbility_TalismanEffect, true)
    Player:setEnergyFakeLimit(Player.kEnergy_Life)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
end
function navi_on()
  local L0_25, L1_26
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
