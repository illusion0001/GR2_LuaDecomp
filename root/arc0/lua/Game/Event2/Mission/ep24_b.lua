dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_isDead = false
_isEndTutorial = false
_boss_gauge = nil
_elektricity_gen = nil
_elektricity_brain = nil
_isInSensor = false
_unica_brain = nil
_warp_caption_flag = false
enmgen2_unica = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "unica_ep24",
      locator = "locator_01",
      name = "unica",
      ai_spawn_option = "Unica/unica_ep24"
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
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end
}
enmgen2_elektricity = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity",
      locator = "locator_01",
      name = "elektricity",
      ai_spawn_option = "Elektricity/elektricity_ep24_a"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
    A0_24:getSpecTable().enemyDeadNum = A0_24:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_26)
    return #A0_26.spawnSet
  end,
  getEnemyDeadNum = function(A0_27)
    local L1_28
    L1_28 = A0_27.enemyDeadNum
    return L1_28
  end,
  getEnemyName = function(A0_29, A1_30)
    local L2_31
    L2_31 = A0_29.spawnSet
    L2_31 = L2_31[A1_30]
    L2_31 = L2_31.name
    return L2_31
  end
}
function Initialize()
  local L0_32, L1_33, L2_34, L3_35
  L0_32 = Fn_cityPlaceName
  L1_33 = false
  L0_32(L1_33)
  L0_32 = findGameObject2
  L1_33 = "Node"
  L2_34 = "locator2_xii_start_pos"
  L0_32 = L0_32(L1_33, L2_34)
  L1_33 = L0_32
  L0_32 = L0_32.getWorldTransform
  L1_33 = L0_32(L1_33)
  L2_34 = Fn_warpXii
  L3_35 = L0_32
  L2_34(L3_35, L1_33)
end
function Ingame()
  local L0_36, L1_37, L2_38, L3_39, L4_40
  L0_36 = {}
  L0_36 = L1_37
  for L4_40, _FORV_5_ in L1_37(L2_38) do
    L0_36[L4_40]:setVisiblePermission(false)
    L0_36[L4_40]:setCollidablePermission(false)
  end
  L4_40 = false
  L2_38(L3_39, L4_40)
  L4_40 = false
  L2_38(L3_39, L4_40)
  L4_40 = L2_38
  L3_39(L4_40, false)
  L4_40 = L2_38
  L3_39(L4_40, false)
  L4_40 = "EnemyBrain"
  _elektricity_brain = L3_39
  L4_40 = L3_39
  L3_39(L4_40, true)
  L4_40 = L3_39
  L3_39(L4_40, "SetEnableCharge", false)
  L4_40 = L3_39
  L3_39(L4_40, true)
  L4_40 = "EnemyGenerator"
  _elektricity_gen = L3_39
  L4_40 = L3_39
  L3_39(L4_40)
  L4_40 = L3_39
  L3_39(L4_40, Player.kAction_Float)
  L4_40 = "battle"
  L3_39(L4_40, "bgmPoint3")
  L4_40 = "EnemyGenerator"
  L4_40 = L3_39.setEnemyMarker
  L4_40(L3_39, false)
  L4_40 = L3_39.requestIdlingEnemy
  L4_40(L3_39, true)
  L4_40 = findGameObject2
  L4_40 = L4_40("EnemyBrain", "unica")
  _unica_brain = L4_40
  L4_40 = _unica_brain
  L4_40 = L4_40.setEnableHomingTarget
  L4_40(L4_40, false)
  L4_40 = sendSetElekPupTbl
  L4_40()
  L4_40 = Fn_disableCostumeChange
  L4_40(true)
  L4_40 = Camera
  L4_40 = L4_40.lookTo
  L4_40(L4_40, findGameObject2("Puppet", "elektricity"):getWorldPos(), 0, 0.7)
  L4_40 = Fn_missionStart
  L4_40()
  L4_40 = gravityGemCreate
  L4_40()
  L4_40 = Fn_missionView
  L4_40("ep24_01000")
  L4_40 = Fn_userCtrlOn
  L4_40()
  function L4_40(A0_41)
    local L1_42, L2_43
    L1_42 = A0_41.name
    L2_43 = A0_41.attacker
    _attackerType = L2_43
    L2_43 = A0_41.damageHp
    print("enemy name " .. L1_42)
    print("attacker type " .. _attackerType)
    A0_41.ret = true
    return A0_41
  end
  _elektricity_gen:setEventListener("DamageEnemyReport", L4_40)
  breakLightningRod()
  HPgauge("elektricity")
  Fn_captionViewWait("ep24_01001")
  Fn_captionViewWait("ep24_01002")
  L3_39:requestIdlingEnemy(false)
  _unica_brain:eventMessage("SetReservationActionChargeAttack")
  Fn_captionViewWait("ep24_01003")
  _elektricity_brain:eventMessage("SetEnableCharge", true)
  missileTutorial()
  requestChargeAttack()
  repeat
    wait()
  until _isDead and _isEndTutorial
  _boss_gauge:setActive(false)
  Fn_whiteout(0.3)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function HPgauge(A0_44)
  invokeTask(function()
    local L0_45
    L0_45 = false
    _boss_gauge = HUD:createBossHpGauge({
      obj = findGameObject2("Puppet", A0_44)
    })
    _boss_gauge:setActive(true)
    while true do
      if findGameObject2("EnemyBrain", A0_44):getHealth() < findGameObject2("EnemyBrain", A0_44):getMaxHealth() / 2 and _attackerType == "player" and _isDead == false then
        _isDead = true
      end
      if findGameObject2("EnemyBrain", A0_44):getHealth() <= findGameObject2("EnemyBrain", A0_44):getMaxHealth() / 20 and L0_45 == false and _isEndTutorial == false then
        findGameObject2("EnemyBrain", A0_44):setInvincibility(true)
        L0_45 = true
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\132\161\230\149\181")
      end
      if L0_45 and _isEndTutorial then
        findGameObject2("EnemyBrain", A0_44):setInvincibility(false)
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\132\161\230\149\181\232\167\163\233\153\164")
      end
      _boss_gauge:setHp((findGameObject2("EnemyBrain", A0_44):getHealth() + findGameObject2("EnemyBrain", A0_44):getMaxHealth() / 2) / (findGameObject2("EnemyBrain", A0_44):getMaxHealth() + findGameObject2("EnemyBrain", A0_44):getMaxHealth()))
      wait()
    end
  end)
end
function gravityGemCreate()
  invokeTask(function()
    local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L10_56, L11_57, L12_58, L13_59
    L0_46 = 0
    L1_47 = math
    L1_47 = L1_47.random
    L2_48 = 1
    L3_49 = 16
    L1_47 = L1_47(L2_48, L3_49)
    L2_48 = nil
    L3_49 = {}
    while L0_46 <= 30 do
      L4_50 = _isInSensor
      if L4_50 then
        L4_50 = createGameObject2
        L5_51 = "Gem"
        L4_50 = L4_50(L5_51)
        L6_52 = L4_50
        L5_51 = L4_50.setGemModelNo
        L7_53 = 4
        L5_51(L6_52, L7_53)
        L5_51 = Fn_getPcPosRot
        L6_52 = L5_51()
        L7_53 = math
        L7_53 = L7_53.random
        L8_54 = -5
        L9_55 = 5
        L7_53 = L7_53(L8_54, L9_55)
        L8_54 = math
        L8_54 = L8_54.random
        L9_55 = -25
        L10_56 = 25
        L8_54 = L8_54(L9_55, L10_56)
        L9_55 = math
        L9_55 = L9_55.random
        L10_56 = -5
        L11_57 = 5
        L9_55 = L9_55(L10_56, L11_57)
        if L1_47 == 1 then
          L10_56 = Vector
          L11_57 = 18 + L7_53
          L12_58 = 3 + L8_54
          L13_59 = 0 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 2 then
          L10_56 = Vector
          L11_57 = -18 + L7_53
          L12_58 = 4 + L8_54
          L13_59 = 0 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 3 then
          L10_56 = Vector
          L11_57 = 0 + L7_53
          L12_58 = -3 + L8_54
          L13_59 = 18 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 4 then
          L10_56 = Vector
          L11_57 = 0 + L7_53
          L12_58 = -4 + L8_54
          L13_59 = -18 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 5 then
          L10_56 = Vector
          L11_57 = 15 + L7_53
          L12_58 = 1 + L8_54
          L13_59 = 15 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 6 then
          L10_56 = Vector
          L11_57 = -15 + L7_53
          L12_58 = -1 + L8_54
          L13_59 = -15 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 7 then
          L10_56 = Vector
          L11_57 = -15 + L7_53
          L12_58 = 2 + L8_54
          L13_59 = 15 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 8 then
          L10_56 = Vector
          L11_57 = 15 + L7_53
          L12_58 = -2 + L8_54
          L13_59 = -15 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 9 then
          L10_56 = Vector
          L11_57 = 17 + L7_53
          L12_58 = 3 + L8_54
          L13_59 = 5 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 10 then
          L10_56 = Vector
          L11_57 = -17 + L7_53
          L12_58 = 4 + L8_54
          L13_59 = -5 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 11 then
          L10_56 = Vector
          L11_57 = 5 + L7_53
          L12_58 = -3 + L8_54
          L13_59 = 17 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 12 then
          L10_56 = Vector
          L11_57 = -5 + L7_53
          L12_58 = -4 + L8_54
          L13_59 = -17 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 13 then
          L10_56 = Vector
          L11_57 = 17 + L7_53
          L12_58 = 3 + L8_54
          L13_59 = -5 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 14 then
          L10_56 = Vector
          L11_57 = -17 + L7_53
          L12_58 = 4 + L8_54
          L13_59 = 5 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 15 then
          L10_56 = Vector
          L11_57 = -5 + L7_53
          L12_58 = -3 + L8_54
          L13_59 = 17 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        elseif L1_47 == 16 then
          L10_56 = Vector
          L11_57 = 5 + L7_53
          L12_58 = -4 + L8_54
          L13_59 = -17 + L9_55
          L10_56 = L10_56(L11_57, L12_58, L13_59)
          L2_48 = L5_51 + L10_56
        end
        L10_56 = Fn_getPcPosRot
        L11_57 = L10_56()
        L12_58 = Query
        L13_59 = L12_58
        L12_58 = L12_58.setEyeSightTransform
        L12_58(L13_59, L10_56, L11_57)
        L12_58 = Query
        L13_59 = L12_58
        L12_58 = L12_58.setEyeSightAngle
        L12_58(L13_59, Deg2Rad(45))
        L12_58 = Query
        L13_59 = L12_58
        L12_58 = L12_58.setEyeSightRange
        L12_58(L13_59, range)
        L12_58 = Query
        L13_59 = L12_58
        L12_58 = L12_58.raycastEyeSight
        L12_58 = L12_58(L13_59, L2_48)
        if not L12_58 then
          L13_59 = L4_50.setWorldPos
          L13_59(L4_50, L2_48)
          L13_59 = L4_50.setForceMove
          L13_59(L4_50)
          L13_59 = L4_50.setVisible
          L13_59(L4_50, true)
          L13_59 = L4_50.try_init
          L13_59(L4_50)
          L13_59 = L4_50.setVisibleBlockHalfSize
          L13_59(L4_50, 150)
          L13_59 = L4_50.waitForReadyAsync
          L13_59(L4_50, function()
            L4_50:try_start()
          end)
          L0_46 = L0_46 + 1
          L13_59 = print
          L13_59("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_47)
          L0_46 = L0_46 + 1
          if L0_46 > 4 then
            L13_59 = waitSeconds
            L13_59(20)
          end
          L13_59 = table
          L13_59 = L13_59.insert
          L13_59(L3_49, L4_50)
          while true do
            L13_59 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_49) do
              if L3_49[_FORV_17_]:isRunning() then
                L13_59 = L13_59 + 1
              end
            end
            if L13_59 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_59)
              break
            end
            wait(15)
          end
          L1_47 = L1_47 + 1
          if L1_47 >= 17 then
            L1_47 = 1
          end
        end
      else
      end
      L4_50 = wait
      L4_50()
    end
  end)
end
function breakLightningRod()
  local L0_60
  function L0_60(A0_61)
    local L1_62, L2_63
    L1_62 = A0_61.lightningRodName
    L2_63 = A0_61.gameObject
    Fn_sendEventComSb("breakLightningRod_com", L1_62, L2_63)
  end
  findGameObject2("EnemyBrain", "elektricity"):setEventListener("boss_eleReport", L0_60)
end
function sendSetElekPupTbl()
  local L0_64, L1_65
  L0_64 = {}
  L1_65 = {}
  L0_64[1] = findGameObject2("Puppet", "elektricity")
  L1_65[1] = findGameObject2("EnemyBrain", "elektricity")
  Fn_sendEventComSb("setElekPupTbl", L0_64, L1_65)
end
function requestChargeAttack()
  invokeTask(function()
    while true do
      if Fn_sendEventComSb("getChargeAttack") then
        _unica_brain:eventMessage("SetReservationActionChargeAttack")
        print("\227\131\166\227\131\139\227\130\171\231\170\129\233\128\178")
        Fn_sendEventComSb("initChargeAttack")
      end
      wait()
    end
  end)
end
function missileTutorial()
  invokeTask(function()
    local L0_66, L1_67, L2_68, L4_69
    L0_66 = 0
    L1_67 = 0
    L2_68 = false
    L4_69 = false
    while true do
      if L0_66 == 0 and _elektricity_brain:eventMessage("IsChargingBlitz") then
        _elektricity_brain:eventMessage("SetEnableBeatBlitz", false)
        Fn_captionViewWait("ep24_01004")
        Fn_captionViewWait("ep24_01015")
        Fn_lookAtObject("elektricity", 0, 0.5):abort()
        if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
          Fn_captionViewWait("ep24_01005")
          L0_66 = 4
        elseif Fn_sendEventComSb("isGrabMissile") then
          Fn_sendEventComSb("resetBrokenMissileFlag")
          Fn_captionViewWait("ep24_01006")
          if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
            Fn_captionViewWait("ep24_01007")
            L0_66 = 4
          elseif Fn_sendEventComSb("isBrokenMissile") and Fn_sendEventComSb("isGrabMissile") == false then
            Fn_captionViewWait("ep24_01025")
            Fn_missionView("ep24_01018")
            Fn_sendEventComSb("resetBrokenMissileFlag")
            L0_66 = 1
          else
            Fn_captionViewWait("ep24_01008")
            L0_66 = 3
          end
        else
          Fn_captionViewWait("ep24_01009")
          if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
            Fn_captionViewWait("ep24_01010")
            L0_66 = 4
          elseif Fn_sendEventComSb("isGrabMissile") then
            Fn_sendEventComSb("resetBrokenMissileFlag")
            Fn_captionViewWait("ep24_01011")
            if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
              Fn_captionViewWait("ep24_01012")
              L0_66 = 4
            elseif Fn_sendEventComSb("isBrokenMissile") and Fn_sendEventComSb("isGrabMissile") == false then
              Fn_captionViewWait("ep24_01025")
              Fn_missionView("ep24_01018")
              Fn_sendEventComSb("resetBrokenMissileFlag")
              L0_66 = 1
            else
              Fn_captionViewWait("ep24_01013")
              L0_66 = 3
            end
          else
            Fn_captionViewWait("ep24_01014")
            if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
              Fn_captionViewWait("ep24_01010")
              L0_66 = 4
            elseif Fn_sendEventComSb("isGrabMissile") then
              Fn_captionViewWait("ep24_01011")
              L0_66 = 3
              if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
                Fn_captionViewWait("ep24_01012")
                L0_66 = 4
              elseif Fn_sendEventComSb("isBrokenMissile") and Fn_sendEventComSb("isGrabMissile") == false then
                Fn_captionViewWait("ep24_01025")
                Fn_missionView("ep24_01018")
                Fn_sendEventComSb("resetBrokenMissileFlag")
                L0_66 = 1
              else
                Fn_captionViewWait("ep24_01013")
                L0_66 = 3
              end
            else
              Fn_captionViewWait("ep24_01017")
              if _elektricity_brain:eventMessage("IsChargingBlitz") == false then
                L0_66 = 4
              elseif Fn_sendEventComSb("isGrabMissile") then
                L0_66 = 3
              else
                Fn_missionView("ep24_01018")
                L0_66 = 1
              end
            end
          end
        end
        L1_67 = 0
        Fn_sendEventComSb("resetBrokenMissileFlag")
      elseif (L0_66 == 1 or L0_66 == 2) and Fn_sendEventComSb("isGrabMissile") then
        Fn_captionViewWait("ep24_01023")
        Fn_missionView("ep24_01000")
        L0_66 = 3
        L1_67 = 0
        Fn_sendEventComSb("resetBrokenMissileFlag")
      elseif L0_66 == 3 and _elektricity_brain:eventMessage("IsChargingBlitz") == false then
        Fn_captionViewWait("ep24_01024")
        L0_66 = 4
        L1_67 = 0
      elseif (L0_66 == 2 or L0_66 == 3) and Fn_sendEventComSb("isBrokenMissile") and Fn_sendEventComSb("isGrabMissile") == false then
        Fn_captionViewWait("ep24_01025")
        if L0_66 == 3 then
          Fn_missionView("ep24_01018")
        end
        Fn_sendEventComSb("resetBrokenMissileFlag")
        L0_66 = 1
        L1_67 = 0
      elseif L0_66 == 4 then
        _elektricity_brain:eventMessage("SetEnableBeatBlitz", true)
        _isEndTutorial = true
        L0_66 = 5
        L1_67 = 0
      elseif L2_68 == true and Player:isFeline() == false then
        L2_68 = false
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 0 and L2_68 == false and Player:isFeline() then
        Fn_captionViewWait("ep24_02002")
        L2_68 = true
        L1_67 = 0
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 1)
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 1 and L2_68 == false and Player:isFeline() then
        Fn_captionViewWait("ep24_02001")
        L2_68 = true
        L1_67 = 0
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 2)
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 2 and L2_68 == false and Player:isFeline() then
        Fn_captionViewWait("ep24_01026")
        L2_68 = true
        L1_67 = 0
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 3)
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 3 and L2_68 == false and Player:isFeline() then
        Fn_captionViewWait("ep24_00136")
        L2_68 = true
        L1_67 = 0
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 4)
      elseif L0_66 == 1 and Fn_sendEventComSb("isInSightMissile").flag then
        if L4_69 == false then
          missileNaviSet()
          L4_69 = true
        end
        Fn_captionViewWait("ep24_01019")
        Fn_lookAtObject(Fn_sendEventComSb("isInSightMissile")[1], 0, 0.5):abort()
        L0_66 = 2
        L1_67 = 0
        Fn_sendEventComSb("resetBrokenMissileFlag")
      elseif L0_66 == 1 and _elektricity_brain:eventMessage("IsChargingBlitz") and L1_67 == 650 then
        if 0 + 1 == 1 then
          Fn_captionViewWait("ep24_01020")
        elseif 0 + 1 == 2 then
          Fn_captionViewWait("ep24_01021")
        elseif 0 + 1 == 3 then
          Fn_captionViewWait("ep24_01022")
          Fn_sendEventComSb("missileNaviSetLongDistance")
        elseif math.random(1.4) == 1 then
          Fn_captionViewWait("ep24_01020")
        elseif math.random(1.4) == 2 then
          Fn_captionViewWait("ep24_01021")
        elseif math.random(1.4) == 3 then
          Fn_captionViewWait("ep24_01022")
        end
        L1_67 = 0
      end
      L1_67 = L1_67 + 1
      wait()
    end
  end)
end
function missileNaviSet()
  invokeTask(function()
    local L0_70
    L0_70 = false
    while true do
      if Fn_sendEventComSb("isInSightMissile").flag and L0_70 == false and Fn_sendEventComSb("isGrabMissile") == false then
        Fn_naviSet(Fn_sendEventComSb("isInSightMissile")[1])
        L0_70 = true
      elseif Fn_sendEventComSb("isInSightMissile").flag == false and L0_70 == true then
        Fn_naviKill()
        L0_70 = false
      end
      wait()
    end
  end)
end
function pccubesensor2_elec_battle_03_OnEnter()
  local L0_71, L1_72
  _isInSensor = true
end
function pccubesensor2_elec_battle_03_OnLeave()
  local L0_73, L1_74
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_75
  L1_75 = _warp_caption_flag
  if L1_75 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep24_00138")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function Finalize()
  Fn_disableCostumeChange(false)
end
