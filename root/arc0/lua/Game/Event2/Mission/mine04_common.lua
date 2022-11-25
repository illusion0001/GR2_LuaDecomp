local L1_1
_candle_fire = false
_candle_fire_se = nil
_create_fire_effect = false
_candle_fire_max_az2_a_01 = 5
_candle_fire_max_az2_a_02 = 5
_candle_fire_max_az2_a_03 = 3
_candle_fire_max_az2_a_04 = 4
_candle_fire_max_az2_a_05 = 1
_candle_fire_max_az2_a_06 = 1
_candle_fire_max_az2_a_07 = 1
_candle_fire_max_az2_a_16 = 9
_candle_fire_max_az2_a_17 = 11
_candle_fire_max_az2_a_18 = 10
_candle_fire_max_az2_a_19 = 10
_candle_fire_max_az2_a_20 = 15
_candle_fire_max_az2_a_21 = 2
_candle_fire_max_az2_a_22 = 7
_candle_fire_max_az2_a_23 = 12
_candle_fire_max_az2_a_24 = 13
_candle_fire_max_az2_a_25 = 8
_candle_fire_max_az2_a_26 = 6
_candle_fire_max_az2_a_27 = 6
function L0_0(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L3_5 = Fn_findAreaHandle
  L3_5 = L3_5(L4_6)
  if L3_5 ~= nil then
    if L4_6 == false then
      return L4_6
    end
    for L7_9 = 1, A1_3 do
      L9_11 = L3_5
      L8_10 = L3_5.getNodePosRot
      L10_12 = string
      L10_12 = L10_12.format
      L11_13 = "candle_fire_%s_%02d"
      L11_13 = L10_12(L11_13, string.sub(A0_2, 1, 8), L7_9)
      L9_11 = L8_10(L9_11, L10_12, L11_13, L10_12(L11_13, string.sub(A0_2, 1, 8), L7_9))
      if L8_10 ~= nil and L9_11 ~= nil then
        L10_12 = Fn_createEffect
        L11_13 = string
        L11_13 = L11_13.format
        L11_13 = L11_13("ef_CandleFire_%s_%02d", A0_2, L7_9)
        L10_12 = L10_12(L11_13, "ef_ev_fir_02", L8_10, true)
        L11_13 = L3_5.appendChild
        L11_13(L3_5, L10_12)
        L11_13 = L10_12.setWorldTransform
        L11_13(L10_12, L8_10, L9_11)
        if A2_4 == nil then
          L11_13 = Sound
          L11_13 = L11_13.playSE
          L11_13(L11_13, "ep09_candle_ignition")
        end
        L11_13 = createGameObject2
        L11_13 = L11_13("PlayerSensor")
        L11_13:setName(string.format("pcspheresensor2_CandleFire_%s_%02d", A0_2, L7_9))
        L11_13:setFilterType("Player")
        L11_13:setDetectBehavior(1)
        L11_13:addBox(Vector(1, 2, 1), Vector(0, 2, 0))
        L11_13:setOnEnter("pcspheresensor2_CandleFire_OnEnter")
        L11_13:setOnLeave("pcspheresensor2_CandleFire_OnLeave")
        L3_5:appendChild(L11_13)
        L11_13:setWorldTransform(L8_10, L9_11)
        L11_13:setForceMove()
        L11_13:try_init()
        L11_13:waitForReady()
        L11_13:try_start()
      end
    end
    return L4_6
  end
  return L4_6
end
putCandleFireEffect = L0_0
function L0_0()
  print("pcspheresensor2_CandleFire_OnEnter")
  if _candle_fire == false then
    _candle_fire = true
    _candle_fire_se = Sound:playSEHandle("ep09_candle_fire")
    Player:applyPoisonDamage(5, 999)
    Fn_captionView("ep09_09015")
  end
end
pcspheresensor2_CandleFire_OnEnter = L0_0
function L0_0()
  print("pcspheresensor2_CandleFire_OnLeave")
  _candle_fire = false
  if _candle_fire_se ~= nil then
    Sound:stopSEHandle(_candle_fire_se)
  end
  Player:applyPoisonDamage(0, 0.1)
end
pcspheresensor2_CandleFire_OnLeave = L0_0
