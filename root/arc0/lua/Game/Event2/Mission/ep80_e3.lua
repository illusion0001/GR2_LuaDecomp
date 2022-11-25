dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_ash_cnt = 0
_crate_cnt = 0
_counter_view = false
enmgen2_d = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_eee",
      locator = "locator_d_01",
      name = "ene_d_01"
    },
    {
      type = "imp_eee",
      locator = "locator_d_02",
      name = "ene_d_02"
    },
    {
      type = "imp_eee",
      locator = "locator_d_03",
      name = "ene_d_03"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "ene_d_01",
      "ene_d_02",
      "ene_d_03"
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20
  L0_6 = Fn_setCatWarpCheckPoint
  L1_7 = "locator2_pc_start_pos"
  L0_6(L1_7)
  L0_6 = Fn_sendEventComSb
  L1_7 = "requestCreateHaze"
  L2_8 = "haze_b"
  L0_6 = L0_6(L1_7, L2_8)
  L1_7 = Fn_sendEventComSb
  L2_8 = "requestSetHazeAlpha"
  L1_7(L2_8, L3_9, L4_10, L5_11)
  L1_7 = "crate_b"
  L2_8 = Fn_sendEventComSb
  L2_8 = L2_8(L3_9, L4_10)
  _crate_cnt = L3_9
  if L3_9 > 0 then
    for L6_12, L7_13 in L3_9(L4_10) do
      L8_14(L9_15, L10_16, L11_17)
      L13_19 = string
      L13_19 = L13_19.format
      L14_20 = "%02d"
      L13_19 = L13_19(L14_20, L6_12)
      L9_15(L10_16, L11_17)
      L9_15(L10_16, L11_17)
      L13_19 = 0.25
      L14_20 = 0
      L14_20 = L11_17(L12_18, L13_19, L14_20)
      L9_15(L10_16, L11_17, L12_18, L13_19, L14_20, L11_17(L12_18, L13_19, L14_20))
      L9_15(L10_16)
      L9_15(L10_16)
      L9_15(L10_16)
      L13_19 = L1_7
      L14_20 = "_"
      L11_17.name = L12_18
      L10_16(L11_17, L12_18)
      L10_16(L11_17, L12_18)
      L10_16(L11_17, L12_18)
      L10_16(L11_17, L12_18)
      function L13_19(A0_21)
        A0_21:getDynamicObject():appendChild(L8_14)
      end
      L10_16(L11_17, L12_18, L13_19)
      do break end
      break
    end
  end
  L3_9()
  L3_9(L4_10)
  L3_9(L4_10)
  L3_9()
  enmgen_d = L3_9
  L3_9(L4_10)
  while true do
    if L3_9 == false then
      L3_9()
    end
  end
  if L4_10 > 8 then
    L7_13 = L3_9
    L6_12 = L3_9.getWorldPos
    L6_12 = L6_12(L7_13)
    L7_13 = 2
    L4_10(L5_11, L6_12, L7_13, L8_14)
  end
  L4_10(L5_11)
  L4_10(L5_11)
  L4_10(L5_11)
  L4_10(L5_11)
  function L6_12()
    while Player:getAction() ~= Player.kAction_AnyGravKick do
      wait()
    end
    for _FORV_3_ = 1, 100 do
      waitSeconds(0.1)
    end
    L4_10 = _FOR_
  end
  while true do
    L6_12 = _ash_cnt
    if L6_12 == 0 and L4_10 == false then
      L6_12 = wait
      L6_12()
    end
  end
  if L5_11 ~= nil then
    L7_13 = L5_11
    L6_12 = L5_11.isRunning
    L6_12 = L6_12(L7_13)
    if L6_12 == true then
      L7_13 = L5_11
      L6_12 = L5_11.abort
      L6_12(L7_13)
    end
  end
  L6_12 = Fn_tutorialCaptionKill
  L6_12()
  L6_12 = Player
  L7_13 = L6_12
  L6_12 = L6_12.setStay
  L6_12(L7_13, L8_14)
  L6_12 = Player
  L7_13 = L6_12
  L6_12 = L6_12.setStay
  L6_12(L7_13, L8_14)
  L6_12 = Fn_userCtrlOffTuto
  L6_12()
  L6_12 = enmgen_d
  L7_13 = L6_12
  L6_12 = L6_12.requestIdlingEnemy
  L6_12(L7_13, L8_14)
  L6_12 = waitSeconds
  L7_13 = 0.5
  L6_12(L7_13)
  if L4_10 == true then
    L6_12 = Fn_captionViewWait
    L7_13 = "ep80_00028"
    L6_12(L7_13)
  else
    L6_12 = Fn_captionViewWait
    L7_13 = "ep80_00027"
    L6_12(L7_13)
  end
  L6_12 = waitSeconds
  L7_13 = 0.5
  L6_12(L7_13)
  L6_12 = Player
  L7_13 = L6_12
  L6_12 = L6_12.setAbility
  L6_12(L7_13, L8_14, L9_15)
  L6_12 = Fn_tutorialCaption
  L7_13 = "mars_shift"
  L6_12(L7_13)
  repeat
    L6_12 = wait
    L6_12()
    L6_12 = Fn_isLunarStyle
    L6_12 = L6_12()
  until L6_12
  L6_12 = Fn_tutorialCaptionKill
  L6_12()
  L6_12 = Fn_unLockPlayerAbility
  L7_13 = {L8_14, L9_15}
  L6_12(L7_13)
  L6_12 = waitSeconds
  L7_13 = 2
  L6_12(L7_13)
  L6_12 = HUD
  L7_13 = L6_12
  L6_12 = L6_12.info
  L6_12(L7_13, L8_14, L9_15)
  L6_12 = enmgen_d
  L7_13 = L6_12
  L6_12 = L6_12.requestIdlingEnemy
  L6_12(L7_13, L8_14)
  L6_12 = waitSeconds
  L7_13 = 1
  L6_12(L7_13)
  L6_12 = Fn_tutorialCaption
  L7_13 = "marsgrav_kick"
  L6_12(L7_13)
  while true do
    L6_12 = enmgen_d
    L7_13 = L6_12
    L6_12 = L6_12.getEnemyCount
    L6_12 = L6_12(L7_13)
    if L6_12 > 0 then
      L6_12 = wait
      L6_12()
    end
  end
  L6_12 = Fn_tutorialCaptionKill
  L6_12()
  L6_12 = waitSeconds
  L7_13 = 0.5
  L6_12(L7_13)
  L6_12 = Fn_userCtrlOffTuto
  L6_12()
  L6_12 = Fn_captionViewWait
  L7_13 = "ep80_00029"
  L6_12(L7_13)
  L6_12 = waitSeconds
  L7_13 = 0.5
  L6_12(L7_13)
  L6_12 = Player
  L7_13 = L6_12
  L6_12 = L6_12.setAbility
  L6_12(L7_13, L8_14, L9_15)
  L6_12 = Player
  L7_13 = L6_12
  L6_12 = L6_12.setAbility
  L6_12(L7_13, L8_14, L9_15)
  L6_12 = Fn_tutorialCaption
  L7_13 = "normal"
  L6_12(L7_13)
  repeat
    L6_12 = wait
    L6_12()
    L6_12 = Fn_isNormalStyle
    L6_12 = L6_12()
  until L6_12
  L6_12 = Fn_tutorialCaptionKill
  L6_12()
  L6_12 = Fn_userCtrlOn
  L6_12()
  L6_12 = _crate_cnt
  if L6_12 > 0 then
    L6_12 = {}
    L7_13 = 1
    for L11_17, L12_18 in L8_14(L9_15) do
      L14_20 = L12_18
      L13_19 = L12_18.isBroken
      L13_19 = L13_19(L14_20)
      if L13_19 == false then
        L6_12[L7_13] = L12_18
      end
      L7_13 = L7_13 + 1
    end
    L8_14(L9_15, L10_16)
    L8_14(L9_15)
    L8_14(L9_15)
    L8_14(L9_15)
    L8_14(L9_15)
    L8_14(L9_15, L10_16)
    L8_14(L9_15)
    for L11_17, L12_18 in L8_14(L9_15) do
      L14_20 = L12_18
      L13_19 = L12_18.isBroken
      L13_19 = L13_19(L14_20)
      if L13_19 == false then
        L14_20 = L12_18
        L13_19 = L12_18.setLockonPermission
        L13_19(L14_20, true)
      end
    end
    L8_14(L9_15, L10_16)
    L8_14(L9_15, L10_16)
    L8_14(L9_15, L10_16)
    _counter_view = true
    while true do
      if L8_14 > 5 then
        L8_14()
      end
    end
    while true do
      if L10_16 > 0 then
        for L13_19, L14_20 in L10_16(L11_17) do
          if L14_20:isBroken() == false then
            if L8_14 == false then
              if HUD:mnaviFind("mnavi_" .. L1_7 .. "_" .. string.format("%02d", L13_19)) ~= nil then
                if 5 < Fn_get_distance(L14_20:getWorldPos(), Fn_getPlayerWorldPos()) or Fn_isInSightTarget(L14_20, 1) == false then
                  HUD:mnaviFind("mnavi_" .. L1_7 .. "_" .. string.format("%02d", L13_19)):setActive(true)
                else
                  HUD:mnaviFind("mnavi_" .. L1_7 .. "_" .. string.format("%02d", L13_19)):setActive(false)
                end
              end
            else
              HUD:mnaviFind("mnavi_" .. L1_7 .. "_" .. string.format("%02d", L13_19)):setActive(true)
            end
          end
        end
        L10_16()
      end
    end
    L10_16(L11_17, L12_18)
    if L9_15 ~= nil then
      if L10_16 == true then
        L10_16(L11_17)
      end
    end
    L10_16(L11_17)
    L13_19 = "locator2_haze_b_01"
    if L11_17 > 8 then
      L11_17(L12_18)
    end
  else
  end
  L6_12 = Fn_pcSensorOff
  L7_13 = "pccubesensor2_battle_navi_in"
  L6_12(L7_13)
  L6_12 = Fn_pcSensorOff
  L7_13 = "pccubesensor2_battle_navi_out"
  L6_12(L7_13)
  L6_12 = Fn_pcSensorOff
  L7_13 = "pccubesensor2_battle_outrange"
  L6_12(L7_13)
  L6_12 = Fn_sendEventComSb
  L7_13 = "requestSetHazeAlpha"
  L6_12(L7_13, L8_14, L9_15, L10_16)
  L6_12 = waitSeconds
  L7_13 = 2
  L6_12(L7_13)
  L6_12 = Fn_kaiwaDemoView
  L7_13 = "ep80_00140k"
  L6_12(L7_13)
  L6_12 = Fn_setKeepPlayerPos
  L6_12()
  L6_12 = Fn_setNextMissionFlag
  L6_12()
  L6_12 = Fn_nextMission
  L6_12()
  L6_12 = Fn_exitSandbox
  L6_12()
end
function Finalize()
  Player:setAttrTune(Player.kAttrTune_Normal, true)
end
function pccubesensor2_battle_navi_OnEnter(A0_22)
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_22:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_23)
  invokeTask(function()
    Fn_captionView("ep80_00113")
    waitSeconds(2)
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_23:setActive(false)
end
