dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_ash_cnt = 0
_crate_cnt = 0
_sdemo = nil
_finish_land = false
enmgen2_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_c_01",
      name = "ene_c_01"
    },
    {
      type = "gellyfish",
      locator = "locator_c_02",
      name = "ene_c_02"
    },
    {
      type = "imp",
      locator = "locator_c_03",
      name = "ene_c_03"
    },
    {
      type = "gellyfish",
      locator = "locator_c_04",
      name = "ene_c_04"
    },
    {
      type = "gellyfish",
      locator = "locator_c_05",
      name = "ene_c_05"
    },
    {
      type = "imp",
      locator = "locator_c_06",
      name = "ene_c_06"
    },
    {
      type = "gellyfish",
      locator = "locator_c_07",
      name = "ene_c_07"
    },
    {
      type = "gellyfish",
      locator = "locator_c_08",
      name = "ene_c_08"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    _ash_cnt = _ash_cnt + 1
  end
}
enmgen2_c_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_c_giant",
      name = "giant"
    }
  },
  onObjectAsh = function(A0_2, A1_3)
    _ash_cnt = _ash_cnt + 1
  end
}
function Initialize()
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  Fn_pcSensorOff("pccubesensormulti2_finish")
  _sdemo = SDemo.create("ep80_e2")
  _sdemo:load("ep80_a_c01_camera1_c01", Fn_findAreaHandle("po_a_15"))
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23
  L0_4 = GameDatabase
  L1_5 = L0_4
  L0_4 = L0_4.get
  L0_4 = L0_4(L1_5, L2_6)
  if L0_4 == true then
    L0_4 = Fn_lockPlayerAbility
    L1_5 = Player
    L1_5 = L1_5.kAbility_Slider
    L0_4(L1_5)
  end
  L0_4 = Fn_setCatWarpCheckPoint
  L1_5 = "locator2_pc_start_pos"
  L0_4(L1_5)
  L0_4 = Fn_sendEventComSb
  L1_5 = "requestCreateHaze"
  L0_4 = L0_4(L1_5, L2_6)
  L1_5 = Fn_sendEventComSb
  L5_9 = 1
  L1_5(L2_6, L3_7, L4_8, L5_9)
  L1_5 = Fn_sendEventComSb
  L1_5 = L1_5(L2_6, L3_7)
  _crate_cnt = L2_6
  if L2_6 > 0 then
    for L5_9, L6_10 in L2_6(L3_7) do
      L8_12 = L6_10
      L7_11 = L6_10.setEventListener
      L9_13 = "broken"
      function L10_14(A0_24)
        _crate_cnt = _crate_cnt - 1
        if _crate_cnt <= 0 then
          Fn_sendEventComSb("requestSetHazeAlpha", L0_4, false, 3)
        end
      end
      L7_11(L8_12, L9_13, L10_14)
    end
  end
  L2_6()
  enmgen_c_01 = L2_6
  L2_6(L3_7)
  while true do
    if L2_6 == false then
      L2_6()
    end
  end
  L2_6(L3_7, L4_8)
  L5_9 = "locator2_lookat"
  L5_9 = L3_7
  if L4_8 > 8 then
    L5_9 = L4_8
    L7_11 = L3_7
    L6_10 = L3_7.getWorldPos
    L6_10 = L6_10(L7_11)
    L7_11 = 2
    L8_12 = 2
    L4_8(L5_9, L6_10, L7_11, L8_12)
  end
  L5_9 = "battle"
  L4_8(L5_9)
  L5_9 = 1.5
  L4_8(L5_9)
  L5_9 = "ep80_00065"
  L4_8(L5_9)
  L5_9 = 2
  L4_8(L5_9)
  L5_9 = L4_8
  L6_10 = Player
  L6_10 = L6_10.kEnergy_SpAttack
  L7_11 = Player
  L8_12 = L7_11
  L7_11 = L7_11.getEnergyMax
  L9_13 = Player
  L9_13 = L9_13.kEnergy_SpAttack
  L19_23 = L7_11(L8_12, L9_13)
  L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L7_11(L8_12, L9_13))
  L5_9 = "ep80_00111"
  L4_8(L5_9)
  L5_9 = 2.5
  L4_8(L5_9)
  L5_9 = Fn_pcSensorOn
  L6_10 = "pccubesensor2_battle_navi_out"
  L5_9(L6_10)
  L5_9 = Fn_pcSensorOn
  L6_10 = "pccubesensor2_battle_outrange"
  L5_9(L6_10)
  L5_9 = Fn_userCtrlOn
  L5_9()
  L5_9 = enmgen_c_01
  L6_10 = L5_9
  L5_9 = L5_9.requestIdlingEnemy
  L7_11 = false
  L5_9(L6_10, L7_11)
  while true do
    L5_9 = _ash_cnt
    if L2_6 > L5_9 then
      L5_9 = enmgen_c_01
      L6_10 = L5_9
      L5_9 = L5_9.getEnemyCount
      L5_9 = L5_9(L6_10)
    end
    if not (L5_9 <= 0) then
      L5_9 = wait
      L5_9()
    end
  end
  if L4_8 ~= nil then
    L6_10 = L4_8
    L5_9 = L4_8.isRunning
    L5_9 = L5_9(L6_10)
    if L5_9 == true then
      L6_10 = L4_8
      L5_9 = L4_8.abort
      L5_9(L6_10)
    end
  end
  L5_9 = Fn_tutorialCaptionKill
  L5_9()
  L5_9 = waitSeconds
  L6_10 = 0.5
  L5_9(L6_10)
  L5_9 = Player
  L6_10 = L5_9
  L5_9 = L5_9.setStay
  L7_11 = true
  L5_9(L6_10, L7_11)
  L5_9 = Fn_userCtrlOff
  L5_9()
  L5_9 = findGameObject2
  L6_10 = "EnemyGenerator"
  L7_11 = "enmgen2_c_02"
  L5_9 = L5_9(L6_10, L7_11)
  L7_11 = L5_9
  L6_10 = L5_9.requestSpawn
  L6_10(L7_11)
  while true do
    L7_11 = L5_9
    L6_10 = L5_9.isSpawnOnStartFinished
    L6_10 = L6_10(L7_11)
    if L6_10 == false then
      L6_10 = wait
      L6_10()
    end
  end
  L7_11 = L5_9
  L6_10 = L5_9.requestIdlingEnemy
  L8_12 = true
  L6_10(L7_11, L8_12)
  _ash_cnt = 0
  L6_10 = findGameObject2
  L7_11 = "Puppet"
  L8_12 = "giant"
  L6_10 = L6_10(L7_11, L8_12)
  while true do
    L8_12 = L6_10
    L7_11 = L6_10.isPoseAnimPlaying
    L9_13 = "spawn"
    L7_11 = L7_11(L8_12, L9_13)
    if L7_11 == false then
      L7_11 = wait
      L7_11()
    end
  end
  L8_12 = L6_10
  L7_11 = L6_10.getBrain
  L7_11 = L7_11(L8_12)
  L9_13 = L7_11
  L8_12 = L7_11.setVisibleBossMarker
  L10_14 = true
  L8_12(L9_13, L10_14)
  L8_12 = invokeTask
  function L9_13()
    while L7_11:getArmorNum() == L7_11:getArmorNum() and L7_11:getHealth() * 0.7 < L7_11:getHealth() do
      wait()
    end
    Fn_setBgmPoint("event", "boss2")
    Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  end
  L8_12 = L8_12(L9_13)
  L9_13 = _sdemo
  L10_14 = L9_13
  L9_13 = L9_13.switchCamera
  L11_15 = true
  L12_16 = 0
  L9_13(L10_14, L11_15, L12_16)
  L9_13 = Fn_setKittenAndCatActive
  L10_14 = false
  L9_13(L10_14)
  L9_13 = Fn_resetPcPos
  L10_14 = "warppoint2_01"
  L9_13(L10_14)
  L9_13 = Fn_setKittenAndCatActive
  L10_14 = true
  L9_13(L10_14)
  L9_13 = _sdemo
  L10_14 = L9_13
  L9_13 = L9_13.play
  L9_13(L10_14)
  while true do
    L9_13 = _sdemo
    L10_14 = L9_13
    L9_13 = L9_13.isPlay
    L9_13 = L9_13(L10_14)
    if L9_13 == true then
      L9_13 = wait
      L9_13()
    end
  end
  L9_13 = _sdemo
  L10_14 = L9_13
  L9_13 = L9_13.stop
  L11_15 = 1
  L9_13(L10_14, L11_15)
  L9_13 = waitSeconds
  L10_14 = 1
  L9_13(L10_14)
  L9_13 = findGameObject2
  L10_14 = "Node"
  L11_15 = "locator2_lookat_giant"
  L9_13 = L9_13(L10_14, L11_15)
  L10_14 = Camera
  L11_15 = L10_14
  L10_14 = L10_14.lookTo
  L13_17 = L9_13
  L12_16 = L9_13.getWorldPos
  L12_16 = L12_16(L13_17)
  L13_17 = 1
  L10_14(L11_15, L12_16, L13_17, L14_18)
  L10_14 = invokeTask
  function L11_15()
    HUD:createBossHpGauge({obj = L6_10}):setActive(true)
    while L6_10:isRunning() do
      HUD:createBossHpGauge({obj = L6_10}):setHp(L7_11:getHealth() / L7_11:getMaxHealth())
      wait()
    end
  end
  L10_14 = L10_14(L11_15)
  L11_15 = Fn_missionView
  L12_16 = "ep80_00119"
  L11_15(L12_16)
  L11_15 = Player
  L12_16 = L11_15
  L11_15 = L11_15.setStay
  L13_17 = false
  L11_15(L12_16, L13_17)
  L11_15 = Fn_userCtrlOn
  L11_15()
  L11_15 = waitSeconds
  L12_16 = 0.5
  L11_15(L12_16)
  L12_16 = L5_9
  L11_15 = L5_9.requestIdlingEnemy
  L13_17 = false
  L11_15(L12_16, L13_17)
  L11_15 = waitSeconds
  L12_16 = 2
  L11_15(L12_16)
  L11_15 = get_sp_tutorial_task
  L11_15 = L11_15()
  while true do
    L11_15 = _ash_cnt
    if L11_15 == 0 then
      L11_15 = wait
      L11_15()
    end
  end
  if L10_14 ~= nil then
    L12_16 = L10_14
    L11_15 = L10_14.isRunning
    L11_15 = L11_15(L12_16)
    if L11_15 == true then
      L12_16 = L10_14
      L11_15 = L10_14.abort
      L11_15(L12_16)
    end
  end
  L10_14 = nil
  L11_15 = HUD
  L12_16 = L11_15
  L11_15 = L11_15.deleteBossHpGauge
  L11_15(L12_16)
  if L4_8 ~= nil then
    L12_16 = L4_8
    L11_15 = L4_8.isRunning
    L11_15 = L11_15(L12_16)
    if L11_15 == true then
      L12_16 = L4_8
      L11_15 = L4_8.abort
      L11_15(L12_16)
    end
  end
  L11_15 = Fn_tutorialCaptionKill
  L11_15()
  L11_15 = {}
  L12_16 = 1
  while true do
    L13_17 = findGameObject2
    L17_21 = "%02d"
    L18_22 = L12_16
    L13_17 = L13_17(L14_18, L15_19)
    if L13_17 ~= nil then
      L11_15[L12_16] = L13_17
    else
      break
    end
    L12_16 = L12_16 + 1
  end
  L13_17 = nil
  for L17_21, L18_22 in L14_18(L15_19) do
    L19_23 = Fn_isInSightTarget
    L19_23 = L19_23(L18_22, 1)
    if L19_23 == true then
      L19_23 = Query
      L19_23 = L19_23.setEyeSightTransform
      L19_23(L19_23, Fn_getPcPosRot())
      L19_23 = Query
      L19_23 = L19_23.setEyeSightAngle
      L19_23(L19_23, Deg2Rad(360))
      L19_23 = Query
      L19_23 = L19_23.setEyeSightRange
      L19_23(L19_23, 50)
      L19_23 = Query
      L19_23 = L19_23.raycastEyeSight
      L19_23 = L19_23(L19_23, L18_22:getWorldPos())
      if L19_23 == nil then
        L19_23 = createGameObject2
        L19_23 = L19_23("GimmickBg")
        L18_22:appendChild(L19_23)
        L19_23:try_init()
        L19_23:waitForReady()
        L19_23:try_start()
        L19_23:setLockonPermission(true)
        break
      end
    end
  end
  L14_18(L15_19)
  if L13_17 ~= nil then
    for L17_21 = 0, 10 do
      L18_22 = Fn_getDistanceToPlayer
      L19_23 = L13_17
      L18_22 = L18_22(L19_23)
      if not (L18_22 < 2) then
        L18_22 = waitSeconds
        L19_23 = 0.1
        L18_22(L19_23)
      end
    end
    L14_18(L15_19)
  else
    L14_18(L15_19)
  end
  L14_18(L15_19, L16_20)
  L14_18()
  L14_18(L15_19)
  if L14_18 == true then
    L14_18(L15_19, L16_20)
    for L17_21 = 0, 20 do
      L18_22 = Player
      L19_23 = L18_22
      L18_22 = L18_22.getAction
      L18_22 = L18_22(L19_23)
      L19_23 = Player
      L19_23 = L19_23.kAction_Idle
      if L18_22 ~= L19_23 then
        L18_22 = waitSeconds
        L19_23 = 0.1
        L18_22(L19_23)
      end
    end
  end
  L14_18(L15_19)
  L14_18(L15_19)
  L14_18(L15_19)
  L14_18(L15_19)
  L17_21 = "locator2_haze_b_01"
  L17_21 = 1
  L15_19(L16_20, L17_21)
  while true do
    if L15_19 <= 0 then
      L15_19()
    end
  end
  L15_19(L16_20)
  L15_19(L16_20)
  L15_19(L16_20)
  L15_19(L16_20)
  L15_19(L16_20)
  L15_19()
  L15_19()
end
function Finalize()
  Fn_sendEventComSb("requestAreaStop")
  _create_tbl = nil
  Mob:makeSituationPanic(false)
  _resetHUD()
end
function pccubesensor2_battle_navi_OnEnter(A0_25)
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_25:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_26)
  invokeTask(function()
    Fn_captionView("ep80_00110")
    waitSeconds(2)
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_26:setActive(false)
end
function pccubesensormulti2_finish_OnEnter(A0_27)
  local L1_28
  _finish_land = true
end
function pccubesensormulti2_finish_OnLeave(A0_29)
  local L1_30
  _finish_land = false
end
function get_sp_tutorial_task()
  return invokeTask(function()
    while Player:getEnergyMax(Player.kEnergy_SpAttack) > Player:getEnergy(Player.kEnergy_SpAttack) do
      wait()
    end
    Fn_tutorialCaption("sp_attack")
    waitSeconds(0.5)
    while Player:getEnergyMax(Player.kEnergy_SpAttack) == Player:getEnergy(Player.kEnergy_SpAttack) do
      wait()
    end
    Fn_tutorialCaptionKill()
  end)
end
