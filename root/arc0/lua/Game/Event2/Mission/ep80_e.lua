dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_ash_cnt = 0
_crate_cnt = 0
enmgen2_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a_01",
      name = "ene_a_01"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    _ash_cnt = _ash_cnt + 1
  end
}
enmgen2_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a_02",
      name = "ene_a_02"
    },
    {
      type = "stalker",
      locator = "locator_a_03",
      name = "ene_a_03"
    }
  },
  onObjectAsh = function(A0_2, A1_3)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"ene_a_02", "ene_a_03"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_b_01",
      name = "ene_b_01"
    },
    {
      type = "gellyfish",
      locator = "locator_b_02",
      name = "ene_b_02"
    }
  },
  onObjectAsh = function(A0_8, A1_9)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_10, A1_11)
    Fn_enemyPopGemSetup(A0_10, {"ene_b_01"}, 1, GEM_ENERGY)
  end,
  onPopGem = function(A0_12, A1_13)
    Fn_enemyAshPopGem(A0_12, A1_13)
  end
}
enmgen2_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_b_03",
      name = "ene_b_03"
    }
  },
  onObjectAsh = function(A0_14, A1_15)
    _ash_cnt = _ash_cnt + 1
  end
}
function Initialize()
  local L0_16, L1_17
  L0_16 = GameDatabase
  L1_17 = L0_16
  L0_16 = L0_16.get
  L0_16 = L0_16(L1_17, ggd.EventFlags__ep80__BeginnerMode)
  if L0_16 == true then
    L0_16 = Fn_lockPlayerAbility
    L1_17 = Player
    L1_17 = L1_17.kAbility_Slider
    L0_16(L1_17)
  end
  L0_16 = Fn_userCtrlOff
  L0_16()
  L0_16 = {L1_17}
  L1_17 = "evarea2_po_a_15_crate"
  L1_17 = Fn_loadEventData
  L1_17("evx/ep80_common", L0_16, true)
  L1_17 = {
    {
      name = "thief",
      type = "man53",
      node = "locator2_thief_01",
      attach = false,
      anim_name = "check"
    },
    {
      name = "ve02",
      type = "ve02",
      node = "locator2_ve_b",
      attach = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L1_17)
  Fn_loadNpcEventMotion("thief", {
    "man01_runaway_ep80_00"
  })
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  _sdemo = SDemo.create("ep80_e")
end
function Ingame()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30
  L0_18 = Fn_setCatWarpCheckPoint
  L1_19 = "locator2_pc_start_pos"
  L0_18(L1_19)
  L0_18 = Fn_findNpc
  L1_19 = "thief"
  L0_18 = L0_18(L1_19)
  L1_19 = Fn_findNpcPuppet
  L2_20 = L0_18
  L1_19 = L1_19(L2_20)
  L2_20 = Fn_findNpc
  L3_21 = "ve02"
  L2_20 = L2_20(L3_21)
  L3_21 = Fn_findNpcPuppet
  L4_22 = L2_20
  L3_21 = L3_21(L4_22)
  L4_22 = Fn_sendEventComSb
  L5_23 = "requestCreateHaze"
  L4_22 = L4_22(L5_23, L6_24)
  L5_23 = Fn_sendEventComSb
  L5_23 = L5_23(L6_24, L7_25)
  _crate_cnt = L6_24
  for L9_27, L10_28 in L6_24(L7_25) do
    L12_30 = L10_28
    L11_29 = L10_28.setEventListener
    L11_29(L12_30, "broken", function(A0_31)
      _crate_cnt = _crate_cnt - 1
      if _crate_cnt <= 0 then
        Fn_sendEventComSb("requestSetHazeAlpha", L4_22, false, 3)
      end
    end)
  end
  L6_24(L7_25, L8_26, L9_27)
  L6_24(L7_25)
  L6_24()
  L9_27.time = 6
  L9_27.pos = "locator2_cut01_cam02"
  L10_28 = {}
  L10_28.time = 6
  L10_28.pos = "locator2_thief_01"
  L6_24(L7_25, L8_26, L9_27)
  while true do
    if L6_24 then
      L6_24()
    end
  end
  L6_24(L7_25)
  L10_28 = true
  L7_25(L8_26, L9_27, L10_28)
  L10_28 = {}
  L10_28.time = 3
  L10_28.pos = "locator2_cut02_cam02"
  L10_28 = {L11_29}
  L11_29 = {}
  L11_29.time = 3
  L11_29.pos = "locator2_cut02_aim02"
  L7_25(L8_26, L9_27, L10_28)
  for L10_28, L11_29 in L7_25(L8_26) do
    L12_30 = L11_29.setActive
    L12_30(L11_29, true)
  end
  L7_25(L8_26)
  L10_28 = "enmgen2_a_02"
  L10_28 = L7_25
  L11_29 = false
  L9_27(L10_28, L11_29)
  L10_28 = L8_26
  L11_29 = false
  L9_27(L10_28, L11_29)
  L10_28 = L7_25
  L9_27(L10_28)
  while true do
    L10_28 = L7_25
    if L9_27 == false then
      L9_27()
    end
  end
  L10_28 = L7_25
  L11_29 = L7_25
  L10_28 = L7_25.requestIdlingEnemy
  L12_30 = true
  L10_28(L11_29, L12_30)
  L10_28 = invokeTask
  function L11_29()
    waitSeconds(2)
    L8_26:requestSpawn()
    while L8_26:isSpawnOnStartFinished() == false do
      wait()
    end
    L8_26:requestIdlingEnemy(true)
    L9_27 = L9_27 + L8_26:getEnemyCount()
  end
  L10_28(L11_29)
  L10_28 = Fn_setBgmPoint
  L11_29 = "battle"
  L10_28(L11_29)
  L10_28 = invokeTask
  function L11_29()
    local L0_32, L1_33
    while true do
      L0_32 = L0_18
      L1_33 = L0_32
      L0_32 = L0_32.isMotionEnd
      L0_32 = L0_32(L1_33)
      if L0_32 == false then
        L0_32 = wait
        L0_32()
      end
    end
    L0_32 = Fn_warpNpc
    L1_33 = L0_18
    L0_32(L1_33, "locator2_escape_e_01")
    L0_32 = L2_20
    L1_33 = L0_32
    L0_32 = L0_32.setPilots
    L0_32(L1_33, {
      {
        pilot = L1_19,
        attach = "loc_driver1"
      }
    })
    repeat
      L0_32 = wait
      L0_32()
      L0_32 = L2_20
      L1_33 = L0_32
      L0_32 = L0_32.isRideOnPilot
      L0_32 = L0_32(L1_33)
    until L0_32
    L0_32 = Fn_playMotionNpc
    L1_33 = L2_20
    L0_32(L1_33, "fly", false)
    L0_32 = {}
    L1_33 = 1
    while findGameObject2("Node", "locator2_escape_f_" .. string.format("%02d", L1_33)) ~= nil do
      L0_32[L1_33] = {}
      L0_32[L1_33].pos = findGameObject2("Node", "locator2_escape_f_" .. string.format("%02d", L1_33)):getName()
      L0_32[L1_33].attr = "fly"
      do break end
      do break end
      L1_33 = L1_33 + 1
    end
    Fn_fly(L2_20, L0_32, {moveSpeed = 15, escape = true})
    L2_20:releasePilots({
      {pilot = L1_19}
    })
    repeat
      wait()
    until L2_20:isRideOffPilot()
    Fn_setNpcVisible(L0_18, false)
    Fn_setNpcVisible(L2_20, false)
  end
  L10_28(L11_29)
  while true do
    L10_28 = _sdemo
    L11_29 = L10_28
    L10_28 = L10_28.isPlay
    L10_28 = L10_28(L11_29)
    if L10_28 then
      L10_28 = wait
      L10_28()
    end
  end
  L10_28 = _sdemo
  L11_29 = L10_28
  L10_28 = L10_28.play
  L12_30 = nil
  L10_28(L11_29, L12_30, {
    {
      time = 1,
      pos = "locator2_cut02_aim03"
    }
  })
  while true do
    L10_28 = _sdemo
    L11_29 = L10_28
    L10_28 = L10_28.isPlay
    L10_28 = L10_28(L11_29)
    if L10_28 then
      L10_28 = wait
      L10_28()
    end
  end
  L10_28 = _sdemo
  L11_29 = L10_28
  L10_28 = L10_28.stop
  L12_30 = 2
  L10_28(L11_29, L12_30)
  L10_28 = waitSeconds
  L11_29 = 1
  L10_28(L11_29)
  L10_28 = Fn_missionView
  L11_29 = "ep80_00024"
  L10_28(L11_29)
  L10_28 = Fn_pcSensorOn
  L11_29 = "pccubesensor2_battle_navi_out"
  L10_28(L11_29)
  L10_28 = Fn_pcSensorOn
  L11_29 = "pccubesensor2_battle_outrange"
  L10_28(L11_29)
  L10_28 = Fn_userCtrlOn
  L10_28()
  L10_28 = waitSeconds
  L11_29 = 0.5
  L10_28(L11_29)
  L11_29 = L7_25
  L10_28 = L7_25.requestIdlingEnemy
  L12_30 = false
  L10_28(L11_29, L12_30)
  L11_29 = L7_25
  L10_28 = L7_25.setEnemyMarker
  L12_30 = true
  L10_28(L11_29, L12_30)
  L11_29 = L8_26
  L10_28 = L8_26.requestIdlingEnemy
  L12_30 = false
  L10_28(L11_29, L12_30)
  L11_29 = L8_26
  L10_28 = L8_26.setEnemyMarker
  L12_30 = true
  L10_28(L11_29, L12_30)
  L10_28 = Fn_tutorialCaption
  L11_29 = "kick_escape"
  L10_28(L11_29)
  while true do
    L10_28 = _ash_cnt
    if L9_27 > L10_28 then
      L11_29 = L7_25
      L10_28 = L7_25.getEnemyCount
      L10_28 = L10_28(L11_29)
      if L10_28 <= 0 then
        L11_29 = L8_26
        L10_28 = L8_26.getEnemyCount
        L10_28 = L10_28(L11_29)
      end
    end
    if not (L10_28 <= 0) then
      L10_28 = wait
      L10_28()
    end
  end
  _ash_cnt = 0
  L10_28 = Fn_tutorialCaptionKill
  L10_28()
  L10_28 = findGameObject2
  L11_29 = "EnemyGenerator"
  L12_30 = "enmgen2_b_01"
  L10_28 = L10_28(L11_29, L12_30)
  L12_30 = L10_28
  L11_29 = L10_28.requestSpawn
  L11_29(L12_30)
  while true do
    L12_30 = L10_28
    L11_29 = L10_28.isSpawnOnStartFinished
    L11_29 = L11_29(L12_30)
    if L11_29 == false then
      L11_29 = wait
      L11_29()
    end
  end
  L12_30 = L10_28
  L11_29 = L10_28.getEnemyCount
  L11_29 = L11_29(L12_30)
  L12_30 = {
    findGameObject2("Puppet", "ene_b_01"),
    findGameObject2("Puppet", "ene_b_02")
  }
  invokeTask(function()
    choice_look_idx(L12_30, 8)
  end)
  Fn_setBgmPoint("battle")
  waitSeconds(0.5)
  Fn_captionViewWait("ep80_00025", 2)
  waitSeconds(0.5)
  HUD:info("ep80_info_02", false)
  waitSeconds(1)
  Fn_tutorialCaption("gravitykick")
  while _ash_cnt == 0 do
    wait()
  end
  findGameObject2("EnemyGenerator", "enmgen2_b_02"):requestSpawn()
  while findGameObject2("EnemyGenerator", "enmgen2_b_02"):isSpawnOnStartFinished() == false do
    wait()
  end
  L11_29 = L11_29 + findGameObject2("EnemyGenerator", "enmgen2_b_02"):getEnemyCount()
  while L11_29 > _ash_cnt and (not (L10_28:getEnemyCount() <= 0) or not (0 >= findGameObject2("EnemyGenerator", "enmgen2_b_02"):getEnemyCount())) do
    wait()
  end
  Fn_tutorialCaptionKill()
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  waitSeconds(1)
  Fn_setKeepPlayerPos()
  if GameDatabase:get(ggd.EventFlags__ep80__BeginnerMode) == true then
    Fn_setNextMissionFlag()
  else
    Fn_setNextMissionFlag("ep80_e2")
  end
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_34, L1_35
end
function pccubesensor2_battle_navi_OnEnter(A0_36)
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_36:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_37)
  invokeTask(function()
    Fn_captionView("ep80_00110")
    waitSeconds(2)
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_37:setActive(false)
end
