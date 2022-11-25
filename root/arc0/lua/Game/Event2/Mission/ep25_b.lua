dofile("/Game/Event2/Common/EventCommon.lua")
_defeat_ele = 0
_elektricity_gen = nil
_lightningCount = 0
_isInSensor = false
_isTutorialEnd = false
_isDodge = false
_sdemo = nil
_warp_caption_flag = false
enmgen2_elektricity = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 3,
  spawnSet = {
    {
      type = "elektricity_16",
      locator = "locator_01_01",
      name = "elektricity_01",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_02",
      name = "elektricity_02",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_03",
      name = "elektricity_03",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_04",
      name = "elektricity_04",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_05",
      name = "elektricity_05",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_06",
      name = "elektricity_06",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_07",
      name = "elektricity_07",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_08",
      name = "elektricity_08",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_09",
      name = "elektricity_09",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_10",
      name = "elektricity_10",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_11",
      name = "elektricity_11",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_12",
      name = "elektricity_12",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_13",
      name = "elektricity_13",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_14",
      name = "elektricity_14",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_15",
      name = "elektricity_15",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    },
    {
      type = "elektricity_16",
      locator = "locator_01_16",
      name = "elektricity_16",
      ai_spawn_option = "Elektricity/elektricity_ep25"
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
  onSpawn = function(A0_6, A1_7)
    local L2_8
    L2_8 = breakLightningRod
    L2_8(A1_7:getName())
    L2_8 = print
    L2_8("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140", A1_7:getName())
    L2_8 = findGameObject2
    L2_8 = L2_8("EnemyBrain", A1_7:getName())
    L2_8:eventMessage("SetEnableChainBlitz", false)
    L2_8:setVisibleBossMarker(true)
  end,
  onObjectDead = function(A0_9, A1_10)
  end,
  onObjectAsh = function(A0_11, A1_12)
    local L2_13, L3_14
    L2_13 = enmgen2_elektricity
    L3_14 = enmgen2_elektricity
    L3_14 = L3_14.enemyDeadNum
    L3_14 = L3_14 + 1
    L2_13.enemyDeadNum = L3_14
    L2_13 = _defeat_ele
    L2_13 = L2_13 + 1
    _defeat_ele = L2_13
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_15, L1_16
    L0_15 = enmgen2_elektricity
    L0_15 = L0_15.spawnSet
    L0_15 = #L0_15
    return L0_15
  end,
  getEnemyDeadNum = function()
    local L1_17
    L1_17 = enmgen2_elektricity
    L1_17 = L1_17.enemyDeadNum
    return L1_17
  end,
  getEnemyName = function(A0_18)
    local L1_19
    L1_19 = enmgen2_elektricity
    L1_19 = L1_19.spawnSet
    L1_19 = L1_19[A0_18]
    L1_19 = L1_19.name
    return L1_19
  end
}
function Initialize()
  local L0_20, L1_21, L2_22
  L0_20 = {
    L1_21,
    L2_22,
    "kit01_stay_heat_00"
  }
  L1_21 = "kit01_down_b_00"
  L2_22 = "kit01_surprise_00"
  L1_21 = Fn_loadPlayerMotion
  L2_22 = L0_20
  L1_21(L2_22)
  L1_21 = SDemo
  L1_21 = L1_21.create
  L2_22 = "ep25_b_01"
  L1_21 = L1_21(L2_22)
  _sdemo = L1_21
  L1_21 = Vector
  L2_22 = -22.2
  L1_21 = L1_21(L2_22, 196.3, 429.3)
  L2_22 = Vector
  L2_22 = L2_22(-20.2, 197.5, 431.4)
  _sdemo:set(L1_21, L2_22)
  _sdemo:setCameraParam(nil, 0.1, {deg = 41.3})
  Fn_cityPlaceName(false)
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
  Fn_naviKill()
end
function Ingame()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L13_36, L14_37, L15_38
  L0_23 = Fn_coercionPoseNomal
  L0_23()
  L0_23 = {}
  L0_23 = L1_24
  for L4_27, L5_28 in L1_24(L2_25) do
    L6_29(L7_30, L8_31)
    L6_29(L7_30, L8_31)
  end
  L2_25(L3_26, L4_27)
  L2_25(L3_26, L4_27)
  L3_26(L4_27, L5_28)
  L3_26(L4_27, L5_28)
  _elektricity_gen = L3_26
  L3_26(L4_27, L5_28)
  L3_26(L4_27, L5_28)
  for L6_29 = 1, 16 do
    L9_32 = "elektricity_"
    L9_32 = L9_32 .. L10_33
    L9_32 = L7_30
    L8_31(L9_32, L10_33)
    L9_32 = L7_30
    L8_31(L9_32, L10_33, L11_34)
  end
  L3_26(L4_27)
  if L4_27 then
    L4_27(L5_28)
  end
  L4_27(L5_28, L6_29)
  L4_27()
  L6_29(L7_30)
  L6_29()
  L6_29()
  L6_29(L7_30)
  for L9_32 = 1, 16 do
    L13_36 = string
    L13_36 = L13_36.format
    L14_37 = "%02d"
    L15_38 = L9_32
    L13_36 = L13_36(L14_37, L15_38)
    L13_36 = false
    L11_34(L12_35, L13_36)
  end
  L6_29(L7_30)
  L6_29(L7_30)
  L9_32 = -22.3
  L7_30.pos = L8_31
  L7_30.time = 0.3
  L9_32 = Vector
  L9_32 = L9_32(L10_33, L11_34, L12_35)
  L8_31.pos = L9_32
  L8_31.time = 0.3
  L9_32 = "easeOut"
  L9_32 = L4_27
  L8_31(L9_32)
  function L9_32()
    _sdemo:zoomIn(0.2, {deg = 30}, "easeOut")
  end
  L9_32 = L8_31
  L8_31(L9_32, L10_33, L11_34)
  L9_32 = 9
  L8_31(L9_32)
  L9_32 = L8_31
  L8_31(L9_32, L10_33)
  L9_32 = "EnemyBrain"
  L9_32 = findGameObject2
  L9_32 = L9_32(L10_33, L11_34)
  L10_33(L11_34, L12_35)
  L10_33(L11_34, L12_35)
  L10_33(L11_34)
  L10_33(L11_34)
  L10_33(L11_34)
  L13_36 = -22.3
  L14_37 = 197.8
  L15_38 = 429.2
  L11_34.pos = L12_35
  L11_34.rot_z = -20
  L11_34.time = 0.3
  L13_36 = -21.1
  L14_37 = 197.6
  L15_38 = 431.9
  L11_34.pos = L12_35
  L11_34.time = 0.3
  L13_36 = L7_30
  L10_33(L11_34, L12_35, L13_36)
  L10_33(L11_34)
  L10_33(L11_34)
  L10_33(L11_34)
  L10_33(L11_34)
  L10_33()
  L10_33(L11_34)
  L10_33(L11_34, L12_35)
  L10_33(L11_34, L12_35)
  L10_33()
  repeat
    L10_33()
  until L10_33
  for L13_36 = 1, 16 do
    L14_37 = findGameObject2
    L15_38 = "EnemyBrain"
    L14_37 = L14_37(L15_38, "elektricity_" .. string.format("%02d", L13_36))
    if L14_37 ~= nil then
      L15_38 = L14_37.eventMessage
      L15_38 = L15_38(L14_37, "SetEnableAttack", false)
      print("SetEnableAttack", "elektricity_" .. string.format("%02d", L13_36), L15_38)
    end
  end
  if L10_33 == false then
    L13_36 = 1
    L10_33(L11_34, L12_35, L13_36)
    L10_33(L11_34, L12_35)
  end
  L10_33()
  L10_33(L11_34, L12_35)
  L13_36 = 1
  L10_33(L11_34, L12_35, L13_36)
  L10_33(L11_34)
  L10_33(L11_34)
  L10_33()
  L10_33()
  L10_33()
end
function lightningRodsTutorial()
  invokeTask(function()
    local L0_39, L1_40, L2_41, L3_42, L4_43
    L0_39 = _lightningCount
    L1_40()
    L4_43 = 1
    L1_40(L2_41, L3_42, L4_43)
    L1_40(L2_41)
    L4_43 = 1
    L1_40(L2_41, L3_42, L4_43)
    L1_40(L2_41)
    for L4_43 = 1, 16 do
      if findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L4_43)) ~= nil then
        findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L4_43)):eventMessage("SetEnableAttack", true)
      end
    end
    while true do
      L0_39 = _lightningCount
      if L1_40 < L0_39 then
        L2_41(L3_42)
        break
      end
      L2_41()
    end
    while not (L1_40 >= 1800) do
      L2_41()
    end
    L2_41()
  end)
end
function lightningConnectAttack()
  invokeTask(function()
    local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54
    L0_44 = {}
    L1_45 = {}
    for L5_49 = 1, 16 do
      L9_53 = string
      L9_53 = L9_53.format
      L10_54 = "%02d"
      L9_53 = L9_53(L10_54, L5_49)
      L0_44[L5_49] = L6_50
    end
    for L5_49 = 1, 16 do
      if L6_50 ~= nil then
        L9_53 = L6_50
        L7_51(L8_52, L9_53)
      end
    end
    L5_49 = L4_48
    L10_54 = L4_48(L5_49)
    L2_46(L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L4_48(L5_49))
    L5_49 = 50
    L10_54 = L4_48(L5_49)
    L2_46(L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L4_48(L5_49))
    L2_46(L3_47, L4_48)
    L5_49 = nil
    while L2_46 == false do
      if L6_50 == 0 then
        L6_50(L7_51)
        for L9_53 = 1, 16 do
          L10_54 = findGameObject2
          L10_54 = L10_54("EnemyBrain", "elektricity_" .. string.format("%02d", L9_53))
          L0_44[L9_53] = L10_54
          L10_54 = L0_44[L9_53]
          if L10_54 ~= nil then
            L10_54 = L0_44[L9_53]
            L10_54 = L10_54.eventMessage
            L10_54 = L10_54(L10_54, "SetReservationActionChainBlitz")
            print("\233\128\163\233\142\150\233\155\187\230\146\131\228\186\136\231\180\132", L10_54)
          end
        end
      end
      for L9_53 = 1, 16 do
        L10_54 = findGameObject2
        L10_54 = L10_54("EnemyBrain", "elektricity_" .. string.format("%02d", L9_53))
        L0_44[L9_53] = L10_54
        L10_54 = findGameObject2
        L10_54 = L10_54("Puppet", "elektricity_" .. string.format("%02d", L9_53))
        L1_45[L9_53] = L10_54
      end
      for L9_53 = 1, 16 do
        L10_54 = L0_44[L9_53]
        if L10_54 ~= nil then
          L10_54 = L0_44[L9_53]
          L10_54 = L10_54.eventMessage
          L10_54 = L10_54(L10_54, "IsAttackingChainBlitz")
          if L10_54 then
            if L3_47 == false then
              L10_54 = invokeTask
              L10_54(function()
                local L0_55, L1_56, L2_57, L3_58
                for L3_58 = 1, 16 do
                  if L0_44[L3_58] ~= nil and Query:raycastEyeSight(L1_45[L3_58]:getWorldPos()) then
                    L5_49 = Fn_lookAtObjectWait(L1_45[L3_58], 1, 0.3)
                    break
                  end
                end
              end)
              L10_54 = Sound
              L10_54 = L10_54.playSE
              L10_54(L10_54, "pc1_073_always", 1)
              L10_54 = Fn_captionViewWait
              L10_54("ep25_01009")
              L10_54 = print
              L10_54("lookAtObject", L5_49)
              if L5_49 ~= nil then
                L10_54 = L5_49.abort
                L10_54(L5_49)
              end
            end
          end
        end
      end
      for L9_53 = 1, 16 do
        L10_54 = L0_44[L9_53]
        if L10_54 ~= nil then
          if L3_47 == true then
            L10_54 = L0_44[L9_53]
            L10_54 = L10_54.eventMessage
            L10_54 = L10_54(L10_54, "IsChainBlitzHit")
            if L10_54 then
              L10_54 = wait
              L10_54(90)
              break
            end
          elseif L3_47 == true and L4_48 == 0 then
            L10_54 = Fn_captionViewWait
            L10_54("ep25_01011")
            _isDodge = true
            break
          end
        end
      end
      L6_50()
    end
    _isTutorialEnd = true
  end)
end
function gravityGemCreate()
  invokeTask(function()
    local L0_59, L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68, L10_69, L11_70, L12_71, L13_72
    L0_59 = 0
    L1_60 = math
    L1_60 = L1_60.random
    L2_61 = 1
    L3_62 = 16
    L1_60 = L1_60(L2_61, L3_62)
    L2_61 = nil
    L3_62 = {}
    while L0_59 <= 30 do
      L4_63 = _isInSensor
      if L4_63 then
        L4_63 = createGameObject2
        L5_64 = "Gem"
        L4_63 = L4_63(L5_64)
        L6_65 = L4_63
        L5_64 = L4_63.setGemModelNo
        L7_66 = 4
        L5_64(L6_65, L7_66)
        L5_64 = Fn_getPcPosRot
        L6_65 = L5_64()
        L7_66 = math
        L7_66 = L7_66.random
        L8_67 = -5
        L9_68 = 5
        L7_66 = L7_66(L8_67, L9_68)
        L8_67 = math
        L8_67 = L8_67.random
        L9_68 = -25
        L10_69 = 25
        L8_67 = L8_67(L9_68, L10_69)
        L9_68 = math
        L9_68 = L9_68.random
        L10_69 = -5
        L11_70 = 5
        L9_68 = L9_68(L10_69, L11_70)
        if L1_60 == 1 then
          L10_69 = Vector
          L11_70 = 18 + L7_66
          L12_71 = 3 + L8_67
          L13_72 = 0 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 2 then
          L10_69 = Vector
          L11_70 = -18 + L7_66
          L12_71 = 4 + L8_67
          L13_72 = 0 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 3 then
          L10_69 = Vector
          L11_70 = 0 + L7_66
          L12_71 = -3 + L8_67
          L13_72 = 18 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 4 then
          L10_69 = Vector
          L11_70 = 0 + L7_66
          L12_71 = -4 + L8_67
          L13_72 = -18 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 5 then
          L10_69 = Vector
          L11_70 = 15 + L7_66
          L12_71 = 1 + L8_67
          L13_72 = 15 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 6 then
          L10_69 = Vector
          L11_70 = -15 + L7_66
          L12_71 = -1 + L8_67
          L13_72 = -15 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 7 then
          L10_69 = Vector
          L11_70 = -15 + L7_66
          L12_71 = 2 + L8_67
          L13_72 = 15 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 8 then
          L10_69 = Vector
          L11_70 = 15 + L7_66
          L12_71 = -2 + L8_67
          L13_72 = -15 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 9 then
          L10_69 = Vector
          L11_70 = 17 + L7_66
          L12_71 = 3 + L8_67
          L13_72 = 5 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 10 then
          L10_69 = Vector
          L11_70 = -17 + L7_66
          L12_71 = 4 + L8_67
          L13_72 = -5 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 11 then
          L10_69 = Vector
          L11_70 = 5 + L7_66
          L12_71 = -3 + L8_67
          L13_72 = 17 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 12 then
          L10_69 = Vector
          L11_70 = -5 + L7_66
          L12_71 = -4 + L8_67
          L13_72 = -17 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 13 then
          L10_69 = Vector
          L11_70 = 17 + L7_66
          L12_71 = 3 + L8_67
          L13_72 = -5 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 14 then
          L10_69 = Vector
          L11_70 = -17 + L7_66
          L12_71 = 4 + L8_67
          L13_72 = 5 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 15 then
          L10_69 = Vector
          L11_70 = -5 + L7_66
          L12_71 = -3 + L8_67
          L13_72 = 17 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        elseif L1_60 == 16 then
          L10_69 = Vector
          L11_70 = 5 + L7_66
          L12_71 = -4 + L8_67
          L13_72 = -17 + L9_68
          L10_69 = L10_69(L11_70, L12_71, L13_72)
          L2_61 = L5_64 + L10_69
        end
        L10_69 = Fn_getPcPosRot
        L11_70 = L10_69()
        L12_71 = Query
        L13_72 = L12_71
        L12_71 = L12_71.setEyeSightTransform
        L12_71(L13_72, L10_69, L11_70)
        L12_71 = Query
        L13_72 = L12_71
        L12_71 = L12_71.setEyeSightAngle
        L12_71(L13_72, Deg2Rad(45))
        L12_71 = Query
        L13_72 = L12_71
        L12_71 = L12_71.setEyeSightRange
        L12_71(L13_72, range)
        L12_71 = Query
        L13_72 = L12_71
        L12_71 = L12_71.raycastEyeSight
        L12_71 = L12_71(L13_72, L2_61)
        if not L12_71 then
          L13_72 = L4_63.setWorldPos
          L13_72(L4_63, L2_61)
          L13_72 = L4_63.setForceMove
          L13_72(L4_63)
          L13_72 = L4_63.setVisible
          L13_72(L4_63, true)
          L13_72 = L4_63.try_init
          L13_72(L4_63)
          L13_72 = L4_63.setVisibleBlockHalfSize
          L13_72(L4_63, 150)
          L13_72 = L4_63.waitForReadyAsync
          L13_72(L4_63, function()
            L4_63:try_start()
          end)
          L0_59 = L0_59 + 1
          L13_72 = print
          L13_72("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_60)
          L0_59 = L0_59 + 1
          if L0_59 > 4 then
            L13_72 = waitSeconds
            L13_72(20)
          end
          L13_72 = table
          L13_72 = L13_72.insert
          L13_72(L3_62, L4_63)
          while true do
            L13_72 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_62) do
              if L3_62[_FORV_17_]:isRunning() then
                L13_72 = L13_72 + 1
              end
            end
            if L13_72 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_72)
              break
            end
            wait(15)
          end
          L1_60 = L1_60 + 1
          if L1_60 >= 17 then
            L1_60 = 1
          end
        end
      else
      end
      L4_63 = wait
      L4_63()
    end
  end)
end
function breakLightningRod(A0_73)
  local L1_74
  function L1_74(A0_75)
    local L1_76, L2_77
    L1_76 = A0_75.lightningRodName
    L2_77 = A0_75.gameObject
    Fn_sendEventComSb("breakLightningRod_com", L1_76, L2_77)
    _lightningCount = _lightningCount + 1
  end
  findGameObject2("EnemyBrain", A0_73):setEventListener("boss_eleReport", L1_74)
end
function sendSetElekPupTbl()
  local L0_78, L1_79
  L0_78 = {}
  L1_79 = {}
  invokeTask(function()
    local L0_80, L1_81, L2_82, L3_83
    while true do
      for L3_83 = 1, 16 do
        L0_78[L3_83] = findGameObject2("Puppet", "elektricity_" .. string.format("%02d", L3_83))
        L1_79[L3_83] = findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L3_83))
      end
      L3_83 = L1_79
      L0_80(L1_81, L2_82, L3_83)
      L0_80()
    end
  end)
end
function chargeAttack()
  invokeTask(function()
    local L0_84, L1_85, L2_86, L3_87, L4_88, L5_89, L6_90, L7_91, L8_92
    L0_84 = 0
    L1_85 = {}
    L2_86 = true
    while true do
      if L3_87 then
        if L0_84 >= 600 and L2_86 or L0_84 >= 350 and L2_86 == false then
          for L6_90 = 1, 16 do
            L7_91 = findGameObject2
            L8_92 = "EnemyBrain"
            L7_91 = L7_91(L8_92, "elektricity_" .. string.format("%02d", L6_90))
            L1_85[L6_90] = L7_91
            L7_91 = L1_85[L6_90]
            if L7_91 ~= nil then
              L7_91 = nil
              if L2_86 then
                L8_92 = Fn_sendEventComSb
                L8_92 = L8_92("movePoint")
                L7_91 = L8_92
              else
                L8_92 = Fn_getPlayerWorldPos
                L8_92 = L8_92()
                L7_91 = L8_92
              end
              L8_92 = L1_85[L6_90]
              L8_92 = L8_92.eventMessage
              L8_92 = L8_92(L8_92, "SetReservationsActionMoveAndAttack", L7_91)
              L0_84 = 0
              print("\227\129\130\227\129\182\227\130\138\227\129\160\227\129\151\229\174\159\232\161\140", L8_92, L6_90)
              L2_86 = false
              break
            end
          end
        end
      else
        L0_84 = 0
        L2_86 = false
      end
      L0_84 = L0_84 + 1
      L3_87()
    end
  end)
end
function pccubesensor2_elec_battle_03_OnEnter()
  local L0_93, L1_94
  _isInSensor = true
end
function pccubesensor2_elec_battle_03_OnLeave()
  local L0_95, L1_96
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_97
  L1_97 = _warp_caption_flag
  if L1_97 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep25_01012")
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
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
end
