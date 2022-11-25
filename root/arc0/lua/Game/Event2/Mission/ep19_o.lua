dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
gem = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  _sdemo_cut01 = L0_0
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  for L3_3 = 1, 6 do
    gem[L3_3] = findGameObject2("Gem", string.format("gem2_vital_ep23_o_%02d", L3_3))
    gem[L3_3]:setActive(false)
  end
  L0_0(L1_1)
  L0_0(L1_1)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21
  L0_4 = Fn_setCatWarpCheckPoint
  L1_5 = "locator2_restart_pos_ep19_o"
  L0_4(L1_5)
  L0_4 = findGameObject2
  L1_5 = "Node"
  L2_6 = "locator2_litho_01"
  L0_4 = L0_4(L1_5, L2_6)
  L1_5 = invokeTask
  function L2_6()
    local L0_22
    L0_22 = false
    while true do
      if L0_22 == false and Fn_getDistanceToPlayer(L0_4) > 30 then
        L0_22 = true
        Fn_naviSet(L0_4)
      elseif L0_22 == true and Fn_getDistanceToPlayer(L0_4) <= 10 then
        L0_22 = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L1_5 = L1_5(L2_6)
  litho_task = L1_5
  L1_5 = Fn_missionStart
  L1_5()
  L1_5 = Fn_userCtrlOn
  L1_5()
  repeat
    L1_5 = wait
    L1_5()
    L1_5 = Fn_sendEventComSb
    L2_6 = "isLithographStart"
    L1_5 = L1_5(L2_6)
  until L1_5
  L1_5 = Fn_coercionPoseNomal
  L1_5()
  L1_5 = litho_task
  L2_6 = L1_5
  L1_5 = L1_5.abort
  L1_5(L2_6)
  litho_task = nil
  L1_5 = Fn_captionView
  L2_6 = "ep19_16002"
  L3_7 = 2
  L1_5(L2_6, L3_7)
  L1_5 = Fn_sendEventComSb
  L2_6 = "requestAnotherKittenSpawn"
  L3_7 = "locator2_a_kitten_start_pos_ep19_o"
  L4_8 = Supporter
  L4_8 = L4_8.FirstAction
  L4_8 = L4_8.Air
  L5_9 = true
  L9_13 = true
  L1_5(L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13)
  repeat
    L1_5 = wait
    L1_5()
    L1_5 = Fn_sendEventComSb
    L2_6 = "requestAnotherKittenSpawnEnd"
    L1_5 = L1_5(L2_6)
  until L1_5
  L1_5 = Fn_sendEventComSb
  L2_6 = "requestAnotherKittenPuppet"
  L1_5 = L1_5(L2_6)
  L2_6 = Fn_sendEventComSb
  L3_7 = "requestAnotherKittenBrain"
  L2_6 = L2_6(L3_7)
  L3_7 = Fn_sendEventComSb
  L4_8 = "requestAnotherKittenReleaseIdle"
  L3_7(L4_8)
  L3_7 = Fn_sendEventComSb
  L4_8 = "requestAnotherKittenMove"
  L5_9 = "locator2_a_kitten_move_pos_ep19_o_end"
  L3_7(L4_8, L5_9, L6_10)
  L3_7 = Fn_sendEventComSb
  L4_8 = "requestComSensorOff"
  L5_9 = "pccubesensor2_catwarp"
  L3_7(L4_8, L5_9)
  L3_7 = Fn_pcSensorOn
  L4_8 = "pccubesensor2_caution_ak_02"
  L3_7(L4_8)
  L3_7 = Fn_pcSensorOn
  L4_8 = "pccubesensor2_catwarp_ak_02"
  L3_7(L4_8)
  L3_7 = waitSeconds
  L4_8 = 1
  L3_7(L4_8)
  L3_7 = Fn_sendEventComSb
  L4_8 = "setFirstHalfProcessEnd"
  L3_7(L4_8)
  repeat
    L3_7 = wait
    L3_7()
    L3_7 = Fn_sendEventComSb
    L4_8 = "isFirstHalfProcessEnd"
    L3_7 = L3_7(L4_8)
  until L3_7
  L3_7 = _sdemo_cut01
  L4_8 = L3_7
  L3_7 = L3_7.set
  L5_9 = "locator2_cam_01"
  L3_7(L4_8, L5_9, L6_10)
  L3_7 = {L4_8}
  L4_8 = {}
  L4_8.pos = "locator2_cam_01"
  L4_8.time = 0
  L4_8.hashfunc = "EaseInOut"
  L4_8 = {L5_9}
  L5_9 = {}
  L5_9.pos = "locator2_aim_02"
  L5_9.time = 1.5
  L5_9.hashfunc = "EaseInOut"
  L5_9 = _sdemo_cut01
  L5_9 = L5_9.play
  L5_9(L6_10, L7_11, L8_12)
  L5_9 = Fn_userCtrlOff
  L5_9()
  L5_9 = Fn_resetPcPos
  L5_9(L6_10)
  L5_9 = findGameObject2
  L5_9 = L5_9(L6_10, L7_11)
  L5_9 = L5_9.getWorldPos
  L5_9 = L5_9(L6_10)
  L9_13 = 1
  L10_14 = L5_9
  L6_10(L7_11, L8_12, L9_13, L10_14)
  repeat
    L6_10()
  until L6_10 == false
  L6_10(L7_11)
  L9_13 = {}
  L9_13.deg = 7.5
  L10_14 = "easeInOut"
  L6_10(L7_11, L8_12, L9_13, L10_14)
  L9_13 = 0.05
  L10_14 = 3
  L11_15 = 0
  L12_16 = Camera
  L12_16 = L12_16.kShakeSlot_Fixed1
  L6_10(L7_11, L8_12, L9_13, L10_14, L11_15, L12_16)
  L6_10(L7_11, L8_12)
  L6_10(L7_11)
  for L9_13 = 1, 6 do
    L10_14 = gem
    L10_14 = L10_14[L9_13]
    if L10_14 ~= nil then
      L10_14 = gem
      L10_14 = L10_14[L9_13]
      L11_15 = L10_14
      L10_14 = L10_14.setActive
      L12_16 = true
      L10_14(L11_15, L12_16)
    end
  end
  L6_10()
  L9_13 = 1
  L10_14 = L5_9
  L6_10(L7_11, L8_12, L9_13, L10_14)
  L6_10(L7_11, L8_12)
  L6_10(L7_11)
  L6_10()
  L6_10(L7_11)
  L6_10(L7_11)
  L9_13 = 1
  L6_10(L7_11, L8_12, L9_13)
  L7_11(L8_12)
  L9_13 = L2_6
  L10_14 = L7_11
  L8_12(L9_13, L10_14)
  L9_13 = L2_6
  L10_14 = true
  L8_12(L9_13, L10_14)
  L9_13 = L2_6
  L10_14 = true
  L8_12(L9_13, L10_14)
  L9_13 = HUD
  L10_14 = L9_13
  L9_13 = L9_13.createBossHpGauge
  L11_15 = {}
  L11_15.obj = L1_5
  L9_13 = L9_13(L10_14, L11_15)
  L10_14 = 0
  L11_15 = false
  L12_16 = invokeTask
  function L13_17()
    L9_13:setActive(true)
    repeat
      L10_14 = L2_6:getHealth()
      if L10_14 <= 0 then
        if L8_12 == nil then
          L8_12 = true
          do break end
          elseif L10_14 <= L7_11 / 10 * 2.5 then
            if L8_12 == nil then
              L8_12 = true
              do break end
              L9_13:setHp(L10_14 / L7_11)
              wait()
            end
          end
        end
    until L8_12
    print("ep19_o : \227\130\162\227\131\138\227\130\182\227\131\188\227\130\173\227\131\136\227\130\165\227\131\179\228\189\147\229\138\155\231\155\163\232\166\150\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134")
  end
  L12_16 = L12_16(L13_17)
  repeat
    L13_17 = wait
    L13_17()
  until L8_12
  L14_18 = L12_16
  L13_17 = L12_16.abort
  L13_17(L14_18)
  L12_16, L13_17 = nil, nil
  L14_18 = 900
  L15_19 = invokeTask
  function L16_20()
    repeat
      repeat
        L14_18 = L14_18 - 1
        wait()
      until L14_18 <= 0
      if L13_17 == nil then
        L13_17 = true
      end
      wait()
    until L13_17
    print("ep19_o : \227\130\171\227\130\166\227\131\179\227\131\136\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134")
  end
  L15_19 = L15_19(L16_20)
  L16_20 = 0
  L17_21 = 0
  repeat
    wait()
  until L13_17
  Fn_blackout()
  L9_13:setActive(false)
  L2_6:setEnemyBossNavi(false)
  L2_6:setLockonNavi(false)
  print("ep19_o : \227\131\144\227\131\136\227\131\171\231\181\130\228\186\134")
  L15_19:abort()
  L15_19 = nil
  invokeTask(function()
    repeat
      repeat
        L16_20 = Player:getEnergyMax(Player.kEnergy_Life)
        L17_21 = Player:getEnergy(Player.kEnergy_Life)
        wait()
      until L17_21 <= L16_20 / 10 * 2.5
      if L13_17 == nil then
        L13_17 = true
      end
      wait()
    until L13_17
    print("ep19_o : \227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\228\189\147\229\138\155\231\155\163\232\166\150\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134")
  end):abort()
  L6_10:abort()
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_catwarp")
  Fn_pcSensorOff("pccubesensor2_caution_ak_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_ak_02")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_23, L1_24
end
function pccubesensor2_caution_ak_02_OnLeave()
  print("pccubesensor2_caution_ak_02_OnLeave")
end
function pccubesensor2_catwarp_ak_02_OnLeave()
  print("pccubesensor2_catwarp_ak_02_OnLeave")
  invokeTask(function()
    if not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      Player:applyPoisonDamage(0, 0.1)
      Fn_sendEventComSb("requestStopPoisonSE")
      Fn_sendEventComSb("requestAnotherKittenWarp", "locator2_a_kitten_restart_pos_ep19_o")
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
      Fn_sendEventComSb("requestAnotherKittenReleaseIdle")
    else
      print(" << ep19_o >> game over \227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  end)
end
