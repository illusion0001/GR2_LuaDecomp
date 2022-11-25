L0_0 = {}
_missile_tbl = L0_0
L0_0 = {}
_missile_bsw_tbl = L0_0
L0_0 = {"dummy"}
_lightning_count_tbl = L0_0
L0_0 = {}
_lightning_time_tbl = L0_0
L0_0 = {}
_elek_puppet_tbl = L0_0
L0_0 = {}
_elek_brain_tbl = L0_0
_request_chargeattack = false
_cancel_charge = false
_break_missile = false
_is_charge_attack = nil
L0_0 = {}
_charge_attack_pos = L0_0
_number_of_missile = 28
function L0_0()
  local L0_1, L1_2, L2_3, L3_4
  for L3_4 = 1, _number_of_missile do
    _missile_tbl[L3_4] = Fn_createGimmickBg("locator2_Missile_" .. string.format("%02d", L3_4), "bg2_MiniMissile_" .. string.format("%02d", L3_4), "mclrg01_missile", false, "mclrg01_missile_elek", "mclrg01_missile")
    print("Missile_hdl", _missile_tbl[L3_4])
    _missile_tbl[L3_4]:setScale(1.5)
    print(_missile_tbl[L3_4]:getScale())
    _missile_tbl[L3_4]:try_init()
    _missile_tbl[L3_4]:waitForReady()
    _missile_tbl[L3_4]:try_start()
    _missile_tbl[L3_4]:setGrabPickupPriorityHigh()
    if L3_4 % 5 == 0 then
      wait()
    end
  end
  L0_1()
end
setMissile = L0_0
function L0_0(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11
  L2_7 = print
  L2_7(L3_8, L4_9)
  L2_7 = print
  L2_7(L3_8, L4_9)
  L2_7 = false
  if L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
  elseif L3_8 == 1 then
    for L6_11, _FORV_7_ in L3_8(L4_9) do
      if _FORV_7_ == A1_6 then
        L2_7 = true
      end
    end
    if L2_7 == true then
      if L3_8 >= 40 then
        for L6_11, _FORV_7_ in L3_8(L4_9) do
          if _lightning_count_tbl[L6_11] == A1_6 then
            table.remove(_lightning_count_tbl, L6_11)
          end
        end
        L6_11 = A1_6
        L6_11 = 1
        L3_8(L4_9, L5_10, L6_11)
        L6_11 = A1_6
        L3_8(L4_9, L5_10, L6_11)
      end
    else
      L3_8(L4_9, L5_10)
      L3_8[A1_6] = L4_9
      L6_11 = A1_6
      L3_8(L4_9, L5_10, L6_11)
    end
  elseif L3_8 == 1 then
    L6_11 = A1_6
    L6_11 = 1
    L3_8(L4_9, L5_10, L6_11)
  else
    L6_11 = A1_6
    L6_11 = 1
    L3_8(L4_9, L5_10, L6_11)
  end
end
breakLightningRod_com = L0_0
function L0_0()
  invokeTask(function()
    local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
    L0_12 = {}
    L1_13 = {}
    while true do
      for L5_17 = 1, _number_of_missile do
        L6_18 = _missile_tbl
        L6_18 = L6_18[L5_17]
        L6_18 = L6_18.isBroken
        L6_18 = L6_18(L6_18)
        if L6_18 then
          L6_18 = L0_12[L5_17]
          if L6_18 ~= true then
            L6_18 = _missile_tbl
            L6_18 = L6_18[L5_17]
            L6_18 = L6_18.getDynamicObject
            L6_18 = L6_18(L6_18)
            _missile_bsw_tbl[L5_17] = createGameObject2("BulletShockwave")
            if L6_18 == nil then
            else
            end
            _missile_bsw_tbl[L5_17]:setParam({
              type = "blow",
              damage = 70,
              force = 5,
              time = 0.1,
              interval = -1,
              pos = L6_18:getWorldPos(),
              radius = 4
            })
            for _FORV_11_, _FORV_12_ in pairs(_elek_puppet_tbl) do
              if 5 >= Fn_get_distance(L6_18:getWorldPos(), _elek_puppet_tbl[_FORV_11_]:getWorldPos()) then
                _elek_brain_tbl[_FORV_11_]:eventMessage("CancelTheCharge")
                _request_chargeattack = true
                _cancel_charge = true
              end
            end
            _missile_bsw_tbl[L5_17]:try_init()
            _missile_bsw_tbl[L5_17]:attack()
            L0_12[L5_17] = true
            L1_13[L5_17] = 0
            print("\227\131\159\227\130\181\227\130\164\227\131\171\229\163\138\227\130\140\227\129\159", _missile_tbl[L5_17])
            _break_missile = true
          end
        end
        L6_18 = L0_12[L5_17]
        if L6_18 then
          L6_18 = L1_13[L5_17]
          L6_18 = L6_18 + 1
          L1_13[L5_17] = L6_18
          L6_18 = L1_13[L5_17]
          if L6_18 >= 300 then
            L6_18 = Fn_isInSightTarget
            L6_18 = L6_18("locator2_Missile_" .. string.format("%02d", L5_17), 1)
            if L6_18 == false then
              L6_18 = Fn_getDistanceToPlayer
              L6_18 = L6_18("locator2_Missile_" .. string.format("%02d", L5_17))
              if L6_18 >= 200 then
                L6_18 = _missile_tbl
                L6_18[L5_17] = Fn_createGimmickBg("locator2_Missile_" .. string.format("%02d", L5_17), "bg2_MiniMissile_" .. string.format("%02d", L5_17), "mclrg01_missile", false, "mclrg01_missile_elek", "mclrg01_missile")
                L6_18 = print
                L6_18("Missile_hdl", _missile_tbl[L5_17])
                L6_18 = _missile_tbl
                L6_18 = L6_18[L5_17]
                L6_18 = L6_18.setScale
                L6_18(L6_18, 1.5)
                L6_18 = print
                L6_18(_missile_tbl[L5_17]:getScale())
                L6_18 = _missile_tbl
                L6_18 = L6_18[L5_17]
                L6_18 = L6_18.try_init
                L6_18(L6_18)
                L6_18 = _missile_tbl
                L6_18 = L6_18[L5_17]
                L6_18 = L6_18.waitForReady
                L6_18(L6_18)
                L6_18 = _missile_tbl
                L6_18 = L6_18[L5_17]
                L6_18 = L6_18.try_start
                L6_18(L6_18)
                L6_18 = _missile_tbl
                L6_18 = L6_18[L5_17]
                L6_18 = L6_18.setGrabPickupPriorityHigh
                L6_18(L6_18)
                L0_12[L5_17] = false
                L1_13[L5_17] = false
              end
            end
          end
        end
      end
      L2_14()
    end
  end)
end
respawnMissile = L0_0
function L0_0(A0_19)
  return (findGameObject2("GimmickBg", A0_19))
end
getGimmickBgHandle = L0_0
function L0_0(A0_20, A1_21)
  _elek_puppet_tbl = A0_20
  _elek_brain_tbl = A1_21
end
setElekPupTbl = L0_0
function L0_0()
  local L0_22, L1_23
  L0_22 = _request_chargeattack
  return L0_22
end
getChargeAttack = L0_0
function L0_0()
  local L0_24, L1_25
  _request_chargeattack = false
end
initChargeAttack = L0_0
function L0_0()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33
  L0_26 = {}
  L0_26.flag = false
  L4_30 = L3_29
  L7_33 = L3_29(L4_30)
  L1_27(L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L3_29(L4_30))
  L4_30 = 50
  L7_33 = L3_29(L4_30)
  L1_27(L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L3_29(L4_30))
  L1_27(L2_28, L3_29)
  for L4_30 = 1, _number_of_missile do
    L5_31 = _missile_tbl
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.getDynamicObject
    L5_31 = L5_31(L6_32)
    L6_32 = nil
    if L5_31 == nil then
      L7_33 = _missile_tbl
      L6_32 = L7_33[L4_30]
    else
      L6_32 = L5_31
    end
    L7_33 = Fn_getDistanceToPlayer
    L7_33 = L7_33(L6_32)
    if L7_33 <= 30 then
      L7_33 = L6_32.isBroken
      L7_33 = L7_33(L6_32)
      if L7_33 == false then
        L7_33 = nil
        L7_33 = L6_32:getWorldPos()
        if Query:calcInSightRatioSphere(L7_33, 0.3) then
          L7_33.y = L7_33.y + 1
          if Query:raycastEyeSight(L7_33) == nil then
            L0_26.flag = true
            table.insert(L0_26, L6_32)
          end
        end
      end
    end
  end
  return L0_26
end
isInSightMissile = L0_0
function L0_0()
  local L0_34, L1_35, L2_36, L3_37, L4_38
  L0_34 = false
  for L4_38 = 1, _number_of_missile do
    if _missile_tbl[L4_38]:isGrabbed() and _missile_tbl[L4_38]:isBroken() == false then
      L0_34 = true
      break
    end
  end
  return L0_34
end
isGrabMissile = L0_0
function L0_0(A0_39)
  invokeTask(function()
    local L0_40, L1_41, L2_42, L3_43
    L0_40 = nil
    while true do
      L1_41 = A0_39
      if not L1_41 then
        L1_41 = Fn_getMissionPart
        L1_41 = L1_41()
      elseif L1_41 ~= "ep25_a" then
        L1_41, L2_42 = nil, nil
        L3_43 = isInSightMissile
        L3_43 = L3_43()
        if L3_43.flag and isGrabMissile() == false then
          for _FORV_7_, _FORV_8_ in pairs(L3_43) do
            if type(L3_43[_FORV_7_]) ~= "boolean" then
              if L1_41 == nil then
                L1_41 = Fn_getDistanceToPlayer(L3_43[_FORV_7_])
                L2_42 = L3_43[_FORV_7_]
              elseif L1_41 > Fn_getDistanceToPlayer(L3_43[_FORV_7_]) then
                L1_41 = Fn_getDistanceToPlayer(L3_43[_FORV_7_])
                L2_42 = L3_43[_FORV_7_]
              end
            end
          end
          if L0_40 ~= L2_42 then
            Fn_naviSet(L2_42)
            L0_40 = L2_42
          end
        elseif L3_43.flag == false then
          Fn_naviKill()
          L0_40 = nil
        end
      end
      L1_41 = wait
      L1_41()
    end
  end)
end
missileNaviSet = L0_0
function L0_0()
  local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52
  L0_44 = {}
  for L4_48 = 1, _number_of_missile do
    L6_50 = "GimmickBg"
    L7_51 = "bg2_MiniMissile_"
    L8_52 = string
    L8_52 = L8_52.format
    L8_52 = L8_52("%02d", L4_48)
    L7_51 = L7_51 .. L8_52
    if L5_49 ~= nil then
      L6_50 = table
      L6_50 = L6_50.insert
      L7_51 = L0_44
      L8_52 = L5_49
      L6_50(L7_51, L8_52)
    end
  end
  for L6_50, L7_51 in L3_47(L4_48) do
    L8_52 = nil
    if L0_44[L6_50]:getDynamicObject() == nil then
      L8_52 = L0_44[L6_50]
    else
      L8_52 = L0_44[L6_50]:getDynamicObject()
    end
    if L1_45 == nil then
    elseif L1_45 > Fn_getDistanceToPlayer(L8_52) then
    end
  end
  L3_47(L4_48)
end
missileNaviSetLongDistance = L0_0
function L0_0()
  invokeTask(function()
    local L0_53, L1_54, L2_55
    L0_53 = 0
    L1_54 = 0
    L2_55 = true
    while true do
      L0_53 = Player:getGrabObjectCount()
      L1_54 = 0
      for _FORV_6_ = 1, _number_of_missile do
        if _missile_tbl[_FORV_6_]:isGrabbed() and _missile_tbl[_FORV_6_]:isBroken() == false then
          L1_54 = L1_54 + 1
        end
      end
      if (L0_53 > 0 and L0_53 == L1_54 or L1_54 == 0) and L2_55 == false then
        for _FORV_6_ = 1, _number_of_missile do
          if _missile_tbl[_FORV_6_]:isGrabbed() then
            _missile_tbl[_FORV_6_]:getDynamicObject():setLightningRodFlag(true)
          end
        end
        print("\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\227\131\159\227\130\181\227\130\164\227\131\171\227\129\174\233\129\191\233\155\183\233\135\157\227\131\149\227\131\169\227\130\176\227\130\146\227\130\170\227\131\179")
        L2_55 = true
      elseif L0_53 > L1_54 and L1_54 > 0 and L2_55 == true then
        for _FORV_6_ = 1, _number_of_missile do
          if _missile_tbl[_FORV_6_]:getDynamicObject() ~= nil then
            _missile_tbl[_FORV_6_]:getDynamicObject():setLightningRodFlag(false)
          end
        end
        print("\227\131\159\227\130\181\227\130\164\227\131\171\227\129\174\233\129\191\233\155\183\233\135\157\227\131\149\227\131\169\227\130\176\227\130\146\227\130\170\227\131\149")
        L2_55 = false
      end
      wait()
    end
  end)
end
changeMissileLightningFlag = L0_0
function L0_0()
  local L0_56, L1_57
  L0_56 = _break_missile
  return L0_56
end
isBrokenMissile = L0_0
function L0_0()
  local L0_58, L1_59
  _break_missile = false
end
resetBrokenMissileFlag = L0_0
function L0_0()
  local L0_60, L1_61
  L0_60 = _cancel_charge
  return L0_60
end
getCancelChargeForLargeMissile = L0_0
function L0_0()
  local L0_62, L1_63
  _cancel_charge = false
end
resetCancelChargeForLargeMissile = L0_0
function L0_0()
  local L0_64, L1_65
  L0_64 = _is_charge_attack
  return L0_64
end
isInArea = L0_0
function L0_0()
  return (copyTable(_charge_attack_pos))
end
movePoint = L0_0
function L0_0(A0_66)
  local L1_67, L2_68, L3_69, L4_70, L5_71, L6_72
  L1_67 = {}
  for L5_71, L6_72 in L2_68(L3_69) do
    if type(L6_72) == "table" then
      L1_67[L5_71] = copyTable(L6_72)
    else
      L1_67[L5_71] = L6_72
    end
  end
  return L1_67
end
copyTable = L0_0
function L0_0()
  _charge_attack_pos = Fn_getPlayerWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_noloca_OnEnter = L0_0
function L0_0()
  local L0_73, L1_74
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_noloca_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_01"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_01_OnEnter = L0_0
function L0_0()
  local L0_75, L1_76
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_01_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_02"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_02_OnEnter = L0_0
function L0_0()
  local L0_77, L1_78
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_02_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_03"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_03_OnEnter = L0_0
function L0_0()
  local L0_79, L1_80
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_03_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_04"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_04_OnEnter = L0_0
function L0_0()
  local L0_81, L1_82
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_04_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_05"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_05_OnEnter = L0_0
function L0_0()
  local L0_83, L1_84
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_05_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_06"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_06_OnEnter = L0_0
function L0_0()
  local L0_85, L1_86
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_06_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_07"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_07_OnEnter = L0_0
function L0_0()
  local L0_87, L1_88
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_07_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_08"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_08_OnEnter = L0_0
function L0_0()
  local L0_89, L1_90
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_08_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_09"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_09_OnEnter = L0_0
function L0_0()
  local L0_91, L1_92
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_09_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_10"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_10_OnEnter = L0_0
function L0_0()
  local L0_93, L1_94
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_10_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_11"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_11_OnEnter = L0_0
function L0_0()
  local L0_95, L1_96
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_11_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_12"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_12_OnEnter = L0_0
function L0_0()
  local L0_97, L1_98
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_12_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_13"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_13_OnEnter = L0_0
function L0_0()
  local L0_99, L1_100
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_13_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_14"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_14_OnEnter = L0_0
function L0_0()
  local L0_101, L1_102
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_14_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_15"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_15_OnEnter = L0_0
function L0_0()
  local L0_103, L1_104
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_15_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_16"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_16_OnEnter = L0_0
function L0_0()
  local L0_105, L1_106
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_16_OnLeave = L0_0
function L0_0()
  _charge_attack_pos = findGameObject2("Node", "locator2_ChargeAttack_17"):getWorldPos()
  _is_charge_attack = true
end
pccubesensor2_ChargeAttack_17_OnEnter = L0_0
function L0_0()
  local L0_107, L1_108
  _is_charge_attack = false
end
pccubesensor2_ChargeAttack_17_OnLeave = L0_0
