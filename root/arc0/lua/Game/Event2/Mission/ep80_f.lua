import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_enemy_near = false
_jupiter_out = false
_crate_cnt = 0
_counter_view = false
enmgen2_pier_a = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 3,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a_01",
      name = "ene_a_01"
    },
    {
      type = "stalker",
      locator = "locator_a_02",
      name = "ene_a_02"
    },
    {
      type = "stalker",
      locator = "locator_a_03",
      name = "ene_a_03"
    },
    {
      type = "stalker",
      locator = "locator_a_04",
      name = "ene_a_04"
    },
    {
      type = "stalker",
      locator = "locator_a_05",
      name = "ene_a_05"
    },
    {
      type = "stalker",
      locator = "locator_a_06",
      name = "ene_a_06"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {
      "ene_a_01",
      "ene_a_02",
      "ene_a_03",
      "ene_a_04",
      "ene_a_05",
      "ene_a_06"
    }, 3, GEM_ENERGY)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
function Initialize()
  local L0_4
  L0_4 = {
    {
      name = "vog01",
      type = "vog01",
      node = "locator2_vog01_01",
      anim_name = "hide_l_00"
    }
  }
  Fn_setupNpc(L0_4)
  Fn_pcSensorOff("pccubesensor2_navi")
  Fn_pcSensorOff("pccubesensor2_near")
  Fn_pcSensorOff("pccubesensor2_jupiter_in")
  Fn_pcSensorOff("pccubesensor2_jupiter_out")
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23
  L0_5 = Fn_setCatWarpCheckPoint
  L1_6 = "locator2_pc_start_pos"
  L0_5(L1_6)
  L0_5 = Fn_sendEventComSb
  L1_6 = "requestCreateGem"
  L0_5(L1_6)
  L0_5 = Fn_sendEventComSb
  L1_6 = "requestCreateHaze"
  L2_7 = "haze_a"
  L0_5 = L0_5(L1_6, L2_7)
  L1_6 = Fn_sendEventComSb
  L2_7 = "requestSetHazeAlpha"
  L3_8 = L0_5
  L4_9 = true
  L1_6(L2_7, L3_8, L4_9, L5_10)
  L1_6 = findGameObject2
  L2_7 = "EnemyGenerator"
  L3_8 = "enmgen2_pier_a"
  L1_6 = L1_6(L2_7, L3_8)
  L3_8 = L1_6
  L2_7 = L1_6.setEnemyMarker
  L4_9 = false
  L2_7(L3_8, L4_9)
  L3_8 = L1_6
  L2_7 = L1_6.requestSpawn
  L2_7(L3_8)
  L2_7 = "crate_a"
  L3_8 = Fn_sendEventComSb
  L4_9 = "requestGetCrateTable"
  L3_8 = L3_8(L4_9, L5_10)
  L4_9 = #L3_8
  for L8_13, L9_14 in L5_10(L6_11) do
    L11_16 = L9_14
    L10_15 = L9_14.setEventListener
    L10_15(L11_16, L12_17, L13_18)
    L10_15 = createGameObject2
    L11_16 = "Node"
    L10_15 = L10_15(L11_16)
    L11_16 = L10_15.setName
    L11_16(L12_17, L13_18)
    L11_16 = L9_14.appendChild
    L11_16(L12_17, L13_18)
    L11_16 = L10_15.setPos
    L18_23 = L13_18(L14_19, L15_20, L16_21)
    L11_16(L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L13_18(L14_19, L15_20, L16_21))
    L11_16 = L10_15.try_init
    L11_16(L12_17)
    L11_16 = L10_15.waitForReady
    L11_16(L12_17)
    L11_16 = L10_15.try_start
    L11_16(L12_17)
    L11_16 = HUD
    L11_16 = L11_16.mnaviNew
    L18_23 = "%02d"
    L13_18.name = L14_19
    L11_16 = L11_16(L12_17, L13_18)
    L12_17(L13_18, L14_19)
    L12_17(L13_18, L14_19)
    L12_17(L13_18, L14_19)
    L12_17(L13_18, L14_19)
    L12_17(L13_18, L14_19, L15_20)
    do break end
    break
  end
  L5_10()
  L5_10()
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L5_10(L6_11)
  L6_11(L7_12)
  while true do
    if L6_11 == false then
      L6_11()
    end
  end
  function L8_13()
    L1_6:requestIdlingEnemy(true)
    while _enemy_near == false do
      wait()
    end
    L1_6:requestIdlingEnemy(false)
    Mob:makeSituationPanic(true)
  end
  L7_12(L8_13)
  L7_12()
  L8_13 = "Node"
  L9_14 = "locator2_vog_crate"
  while true do
    L8_13 = Fn_getPcPosRot
    L9_14 = L8_13()
    L10_15 = L8_13.y
    L10_15 = L10_15 + 1.5
    L8_13.y = L10_15
    L10_15 = Query
    L11_16 = L10_15
    L10_15 = L10_15.setEyeSightTransform
    L10_15(L11_16, L12_17, L13_18)
    L10_15 = Query
    L11_16 = L10_15
    L10_15 = L10_15.setEyeSightAngle
    L18_23 = L12_17(L13_18)
    L10_15(L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L12_17(L13_18))
    L10_15 = Query
    L11_16 = L10_15
    L10_15 = L10_15.setEyeSightRange
    L10_15(L11_16, L12_17)
    L10_15 = Query
    L11_16 = L10_15
    L10_15 = L10_15.raycastEyeSight
    L18_23 = L12_17(L13_18)
    L10_15 = L10_15(L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L12_17(L13_18))
    if L10_15 ~= nil then
      L10_15 = waitSeconds
      L11_16 = 0.1
      L10_15(L11_16)
    end
  end
  L8_13 = Player
  L9_14 = L8_13
  L8_13 = L8_13.setStay
  L10_15 = true
  L8_13(L9_14, L10_15)
  L8_13 = Player
  L9_14 = L8_13
  L8_13 = L8_13.setStay
  L10_15 = false
  L8_13(L9_14, L10_15)
  L8_13 = Fn_userCtrlOff
  L8_13()
  L8_13 = Fn_naviKill
  L8_13()
  L8_13 = Fn_lookAtTargetInput
  L9_14 = L0_5[1]
  L10_15 = 1
  L8_13(L9_14, L10_15)
  L8_13 = Fn_captionViewWait
  L9_14 = "ep80_00034"
  L8_13(L9_14)
  L9_14 = L1_6
  L8_13 = L1_6.setEnemyMarker
  L10_15 = true
  L8_13(L9_14, L10_15)
  L8_13 = waitSeconds
  L9_14 = 1
  L8_13(L9_14)
  L8_13 = Fn_kaiwaDemoView
  L9_14 = "ep80_00150k"
  L8_13(L9_14)
  L8_13 = Fn_setCatWarpCheckPoint
  L9_14 = "warppoint2_pier"
  L8_13(L9_14)
  L8_13 = Fn_pcSensorOn
  L9_14 = "pccubesensor2_battle_navi_out"
  L8_13(L9_14)
  L8_13 = Fn_pcSensorOn
  L9_14 = "pccubesensor2_battle_outrange"
  L8_13(L9_14)
  L8_13 = Fn_userCtrlOn
  L8_13()
  L8_13 = Fn_captionView
  L9_14 = "ep80_00035"
  L8_13(L9_14)
  L8_13 = waitSeconds
  L9_14 = 2
  L8_13(L9_14)
  L8_13 = findGameObject2
  L9_14 = "Node"
  L10_15 = "warppoint2_pc_jupiter"
  L8_13 = L8_13(L9_14, L10_15)
  L9_14 = HUD
  L10_15 = L9_14
  L9_14 = L9_14.naviSetPochiDistanceDensity0
  L11_16 = 20
  L9_14(L10_15, L11_16)
  L9_14 = HUD
  L10_15 = L9_14
  L9_14 = L9_14.naviSetPochiDistanceDensity100
  L11_16 = 30
  L9_14(L10_15, L11_16)
  L9_14 = Fn_naviSet
  L10_15 = L8_13
  L9_14(L10_15)
  L9_14 = Fn_lookAtTargetInput
  L10_15 = L8_13
  L9_14(L10_15)
  L9_14 = Fn_pcSensorOn
  L10_15 = "pccubesensor2_jupiter_in"
  L9_14(L10_15)
  L9_14 = 200
  L10_15 = 0
  L11_16 = invokeTask
  L11_16 = L11_16(L12_17)
  L12_17()
  if L11_16 ~= nil then
    if L12_17 == true then
      L12_17(L13_18)
    end
  end
  L11_16 = L12_17
  L12_17(L13_18, L14_19)
  L12_17(L13_18, L14_19)
  L12_17()
  L12_17()
  if L12_17 < L13_18 then
    L12_17(L13_18, L14_19, L15_20, L16_21)
  end
  L12_17(L13_18, L14_19, L15_20)
  L12_17(L13_18)
  L12_17(L13_18, L14_19, L15_20, L16_21)
  for L15_20, L16_21 in L12_17(L13_18) do
    L18_23 = L16_21
    if L17_22 == false then
      L18_23 = L16_21
      L17_22(L18_23, true)
    end
  end
  L12_17(L13_18, L14_19, L15_20)
  L12_17(L13_18)
  repeat
    L12_17()
  until L12_17
  L12_17()
  L12_17(L13_18, L14_19, L15_20)
  L12_17(L13_18)
  L12_17(L13_18, L14_19, L15_20)
  L12_17(L13_18)
  L12_17(L13_18)
  while true do
    L12_17()
    _jupiter_out = false
    L12_17(L13_18, L14_19, L15_20)
    L12_17(L13_18, L14_19, L15_20)
    if L4_9 > 0 then
      L12_17(L13_18)
      L12_17(L13_18, L14_19)
      L12_17(L13_18, L14_19)
      L12_17(L13_18, L14_19)
      _counter_view = true
    else
      L12_17(L13_18)
    end
    L12_17(L13_18)
    L12_17(L13_18)
    while true do
      if L12_17 == false then
        L12_17()
      end
    end
    if L12_17 < 100 then
      L12_17(L13_18, L14_19)
      L12_17(L13_18, L14_19)
      L12_17()
      L12_17()
      L12_17()
      L12_17(L13_18, L14_19)
      L12_17(L13_18, L14_19)
      L12_17(L13_18)
      L12_17()
      L12_17(L13_18, L14_19, L15_20)
      L12_17(L13_18)
    else
      break
    end
  end
  L12_17(L13_18)
  L12_17()
  L12_17(L13_18, L14_19, L15_20)
  L12_17(L13_18)
  L12_17()
  while L4_9 > 5 do
    L12_17()
  end
  while L4_9 > 0 do
    for L17_22, L18_23 in L14_19(L15_20) do
      if L18_23:isBroken() == false then
        if L12_17 == false then
          if HUD:mnaviFind("mnavi_" .. L2_7 .. "_" .. string.format("%02d", L17_22)) ~= nil then
            if 5 < Fn_get_distance(L18_23:getWorldPos(), Fn_getPlayerWorldPos()) or Fn_isInSightTarget(L18_23, 1) == false then
              HUD:mnaviFind("mnavi_" .. L2_7 .. "_" .. string.format("%02d", L17_22)):setActive(true)
            else
              HUD:mnaviFind("mnavi_" .. L2_7 .. "_" .. string.format("%02d", L17_22)):setActive(false)
            end
          end
        else
          HUD:mnaviFind("mnavi_" .. L2_7 .. "_" .. string.format("%02d", L17_22)):setActive(true)
        end
      end
    end
    L14_19()
  end
  L14_19(L15_20, L16_21)
  L14_19(L15_20, L16_21)
  if L6_11 ~= nil then
    if L14_19 == true then
      L14_19(L15_20)
    end
  end
  L14_19(L15_20)
  for L18_23, _FORV_19_ in L15_20(L16_21) do
  end
  if L14_19 > 0 then
    L15_20(L16_21)
    for L18_23, _FORV_19_ in L15_20(L16_21) do
      if findGameObject2("Puppet", _FORV_19_.name) ~= nil then
        findGameObject2("Puppet", _FORV_19_.name):getBrain():setEnableHomingTarget(true)
      end
    end
    while true do
      if L15_20 > 0 then
        L15_20()
      end
    end
  end
  L15_20(L16_21)
  L15_20(L16_21)
  L15_20(L16_21)
  L15_20(L16_21)
  L15_20(L16_21)
  if L15_20 == false then
    L15_20(L16_21)
    L18_23 = Player
    L18_23 = L18_23.kAbility_AttrTuneSwitch
    L18_23 = true
    L15_20(L16_21, L17_22, L18_23)
    L18_23 = Player
    L18_23 = L18_23.kAbility_SwitchToMars
    L18_23 = false
    L15_20(L16_21, L17_22, L18_23)
    L15_20(L16_21)
    L15_20(L16_21)
    repeat
      L15_20()
    until L15_20
    L15_20()
  end
  L18_23 = false
  L15_20(L16_21, L17_22, L18_23, 3)
  L15_20()
  L15_20(L16_21)
  L15_20(L16_21)
  L15_20()
  L15_20()
  L15_20()
  L15_20()
end
function Finalize()
  Player:setAttrTune(Player.kAttrTune_Normal, true)
end
function pccubesensor2_near_OnEnter(A0_24)
  A0_24:setActive(false)
  _enemy_near = true
end
function pccubesensor2_jupiter_OnLeave(A0_25)
  local L1_26
  _jupiter_out = true
end
function pccubesensor2_battle_navi_OnEnter(A0_27)
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_27:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_28)
  Fn_captionView("ep80_00114")
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_28:setActive(false)
end
