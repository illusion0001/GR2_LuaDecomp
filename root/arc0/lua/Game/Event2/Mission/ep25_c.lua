dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_elektricity_gen = nil
_elektricity_true_gen = nil
_isInSensor = false
_first_ele_dead_flag = false
_warp_caption_flag = false
_request_respawn = false
_request_respawn_nohit = false
enmgen2_elektricity = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
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
  end,
  onObjectDead = function(A0_9, A1_10)
  end,
  onObjectAsh = function(A0_11, A1_12)
    local L3_13
    L3_13 = enmgen2_elektricity
    L3_13.enemyDeadNum = enmgen2_elektricity.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_14, L1_15
    L0_14 = enmgen2_elektricity
    L0_14 = L0_14.spawnSet
    L0_14 = #L0_14
    return L0_14
  end,
  getEnemyDeadNum = function()
    local L1_16
    L1_16 = enmgen2_elektricity
    L1_16 = L1_16.enemyDeadNum
    return L1_16
  end,
  getEnemyName = function(A0_17)
    local L1_18
    L1_18 = enmgen2_elektricity
    L1_18 = L1_18.spawnSet
    L1_18 = L1_18[A0_17]
    L1_18 = L1_18.name
    return L1_18
  end
}
enmgen2_elektricity_true = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "elektricity_real",
      locator = "locator_01_01",
      name = "elektricity_true",
      ai_spawn_option = "Elektricity/elektricity_true"
    }
  },
  onUpdate = function(A0_19)
    local L1_20
  end,
  onEnter = function(A0_21)
    local L1_22
  end,
  onLeave = function(A0_23)
    local L1_24
  end,
  onSpawn = function(A0_25, A1_26)
    local L2_27
    L2_27 = breakLightningRod
    L2_27(A1_26:getName())
    L2_27 = print
    L2_27("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140", A1_26:getName())
  end,
  onObjectDead = function(A0_28, A1_29)
  end,
  onObjectAsh = function(A0_30, A1_31)
    enmgen2_elektricity_true.enemyDeadNum = enmgen2_elektricity_true.enemyDeadNum + 1
    if enmgen2_elektricity_true.getEnemyDeadNum() == enmgen2_elektricity_true.getEnemyMax() then
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_32, L1_33
    L0_32 = enmgen2_elektricity_true
    L0_32 = L0_32.spawnSet
    L0_32 = #L0_32
    return L0_32
  end,
  getEnemyDeadNum = function()
    local L1_34
    L1_34 = enmgen2_elektricity_true
    L1_34 = L1_34.enemyDeadNum
    return L1_34
  end,
  getEnemyName = function(A0_35)
    local L1_36
    L1_36 = enmgen2_elektricity_true
    L1_36 = L1_36.spawnSet
    L1_36 = L1_36[A0_35]
    L1_36 = L1_36.name
    return L1_36
  end
}
function Initialize()
  Fn_cityPlaceName(false)
  Fn_naviKill()
end
function Ingame()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47
  L0_37 = {}
  L0_37 = L1_38
  for L4_41, L5_42 in L1_38(L2_39) do
    L6_43(L7_44, L8_45)
    L6_43(L7_44, L8_45)
  end
  L2_39(L3_40, L4_41)
  L2_39(L3_40, L4_41)
  L3_40(L4_41, L5_42)
  L3_40(L4_41, L5_42)
  _elektricity_gen = L3_40
  _elektricity_true_gen = L3_40
  L3_40(L4_41, L5_42)
  L3_40(L4_41, L5_42)
  L4_41(L5_42, L6_43)
  L4_41(L5_42, L6_43)
  for L7_44 = 1, 15 do
    L10_47 = "elektricity_"
    L10_47 = L10_47 .. string.format("%02d", L7_44)
    L10_47 = L8_45
    L9_46(L10_47, true)
  end
  L4_41(L5_42)
  L4_41(L5_42)
  L4_41()
  L4_41(L5_42, L6_43)
  L4_41(L5_42, L6_43)
  L4_41(L5_42, L6_43, L7_44, L8_45)
  L10_47 = L5_42(L6_43, L7_44)
  L5_42(L6_43, L7_44, L8_45, L9_46)
  L5_42()
  L5_42()
  L5_42()
  L5_42()
  L5_42(L6_43, L7_44, L8_45, L9_46)
  L5_42(L6_43)
  L5_42()
  L10_47 = "bn_root"
  L7_44(L8_45, L9_46, L10_47, true)
  L7_44(L8_45)
  L7_44(L8_45, L9_46)
  L7_44(L8_45)
  L7_44()
  L7_44(L8_45)
  L7_44()
  L7_44(L8_45)
  L7_44(L8_45, L9_46)
  for L10_47 = 1, 15 do
    findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L10_47)):skipSpawnMotion(false)
  end
  repeat
    L7_44()
  until L7_44
  L7_44(L8_45)
  L7_44()
  if not L7_44 then
    L10_47 = false
    L7_44(L8_45, L9_46, L10_47, false)
    L7_44(L8_45)
  end
  L10_47 = true
  L7_44(L8_45, L9_46, L10_47)
  L10_47 = false
  L7_44(L8_45, L9_46, L10_47)
  L7_44(L8_45)
  L7_44(L8_45)
  if L7_44 ~= L8_45 then
  elseif L7_44 == L8_45 then
    L10_47 = false
    L7_44(L8_45, L9_46, L10_47, false)
    L10_47 = true
    L7_44(L8_45, L9_46, L10_47)
  end
  L7_44()
  L7_44()
  L7_44()
end
function is_camera_input(A0_48, A1_49)
  local L2_50
  L2_50 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_50 = true
  end
  return L2_50
end
function gravityGemCreate()
  invokeTask(function()
    local L0_51, L1_52, L2_53, L3_54, L4_55, L5_56, L6_57, L7_58, L8_59, L9_60, L10_61, L11_62, L12_63, L13_64
    L0_51 = 0
    L1_52 = math
    L1_52 = L1_52.random
    L2_53 = 1
    L3_54 = 16
    L1_52 = L1_52(L2_53, L3_54)
    L2_53 = nil
    L3_54 = {}
    while L0_51 <= 30 do
      L4_55 = _isInSensor
      if L4_55 then
        L4_55 = createGameObject2
        L5_56 = "Gem"
        L4_55 = L4_55(L5_56)
        L6_57 = L4_55
        L5_56 = L4_55.setGemModelNo
        L7_58 = 4
        L5_56(L6_57, L7_58)
        L5_56 = Fn_getPcPosRot
        L6_57 = L5_56()
        L7_58 = math
        L7_58 = L7_58.random
        L8_59 = -5
        L9_60 = 5
        L7_58 = L7_58(L8_59, L9_60)
        L8_59 = math
        L8_59 = L8_59.random
        L9_60 = -25
        L10_61 = 25
        L8_59 = L8_59(L9_60, L10_61)
        L9_60 = math
        L9_60 = L9_60.random
        L10_61 = -5
        L11_62 = 5
        L9_60 = L9_60(L10_61, L11_62)
        if L1_52 == 1 then
          L10_61 = Vector
          L11_62 = 18 + L7_58
          L12_63 = 3 + L8_59
          L13_64 = 0 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 2 then
          L10_61 = Vector
          L11_62 = -18 + L7_58
          L12_63 = 4 + L8_59
          L13_64 = 0 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 3 then
          L10_61 = Vector
          L11_62 = 0 + L7_58
          L12_63 = -3 + L8_59
          L13_64 = 18 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 4 then
          L10_61 = Vector
          L11_62 = 0 + L7_58
          L12_63 = -4 + L8_59
          L13_64 = -18 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 5 then
          L10_61 = Vector
          L11_62 = 15 + L7_58
          L12_63 = 1 + L8_59
          L13_64 = 15 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 6 then
          L10_61 = Vector
          L11_62 = -15 + L7_58
          L12_63 = -1 + L8_59
          L13_64 = -15 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 7 then
          L10_61 = Vector
          L11_62 = -15 + L7_58
          L12_63 = 2 + L8_59
          L13_64 = 15 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 8 then
          L10_61 = Vector
          L11_62 = 15 + L7_58
          L12_63 = -2 + L8_59
          L13_64 = -15 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 9 then
          L10_61 = Vector
          L11_62 = 17 + L7_58
          L12_63 = 3 + L8_59
          L13_64 = 5 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 10 then
          L10_61 = Vector
          L11_62 = -17 + L7_58
          L12_63 = 4 + L8_59
          L13_64 = -5 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 11 then
          L10_61 = Vector
          L11_62 = 5 + L7_58
          L12_63 = -3 + L8_59
          L13_64 = 17 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 12 then
          L10_61 = Vector
          L11_62 = -5 + L7_58
          L12_63 = -4 + L8_59
          L13_64 = -17 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 13 then
          L10_61 = Vector
          L11_62 = 17 + L7_58
          L12_63 = 3 + L8_59
          L13_64 = -5 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 14 then
          L10_61 = Vector
          L11_62 = -17 + L7_58
          L12_63 = 4 + L8_59
          L13_64 = 5 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 15 then
          L10_61 = Vector
          L11_62 = -5 + L7_58
          L12_63 = -3 + L8_59
          L13_64 = 17 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        elseif L1_52 == 16 then
          L10_61 = Vector
          L11_62 = 5 + L7_58
          L12_63 = -4 + L8_59
          L13_64 = -17 + L9_60
          L10_61 = L10_61(L11_62, L12_63, L13_64)
          L2_53 = L5_56 + L10_61
        end
        L10_61 = Fn_getPcPosRot
        L11_62 = L10_61()
        L12_63 = Query
        L13_64 = L12_63
        L12_63 = L12_63.setEyeSightTransform
        L12_63(L13_64, L10_61, L11_62)
        L12_63 = Query
        L13_64 = L12_63
        L12_63 = L12_63.setEyeSightAngle
        L12_63(L13_64, Deg2Rad(45))
        L12_63 = Query
        L13_64 = L12_63
        L12_63 = L12_63.setEyeSightRange
        L12_63(L13_64, range)
        L12_63 = Query
        L13_64 = L12_63
        L12_63 = L12_63.raycastEyeSight
        L12_63 = L12_63(L13_64, L2_53)
        if not L12_63 then
          L13_64 = L4_55.setWorldPos
          L13_64(L4_55, L2_53)
          L13_64 = L4_55.setForceMove
          L13_64(L4_55)
          L13_64 = L4_55.setVisible
          L13_64(L4_55, true)
          L13_64 = L4_55.try_init
          L13_64(L4_55)
          L13_64 = L4_55.setVisibleBlockHalfSize
          L13_64(L4_55, 150)
          L13_64 = L4_55.waitForReadyAsync
          L13_64(L4_55, function()
            L4_55:try_start()
          end)
          L0_51 = L0_51 + 1
          L13_64 = print
          L13_64("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_52)
          L0_51 = L0_51 + 1
          if L0_51 > 4 then
            L13_64 = waitSeconds
            L13_64(20)
          end
          L13_64 = table
          L13_64 = L13_64.insert
          L13_64(L3_54, L4_55)
          while true do
            L13_64 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_54) do
              if L3_54[_FORV_17_]:isRunning() then
                L13_64 = L13_64 + 1
              end
            end
            if L13_64 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_64)
              break
            end
            wait(15)
          end
          L1_52 = L1_52 + 1
          if L1_52 >= 17 then
            L1_52 = 1
          end
        end
      else
      end
      L4_55 = wait
      L4_55()
    end
  end)
end
function breakLightningRod(A0_65)
  local L1_66
  function L1_66(A0_67)
    local L1_68, L2_69
    L1_68 = A0_67.lightningRodName
    L2_69 = A0_67.gameObject
    Fn_sendEventComSb("breakLightningRod_com", L1_68, L2_69)
  end
  findGameObject2("EnemyBrain", A0_65):setEventListener("boss_eleReport", L1_66)
end
function sendSetElekPupTbl()
  local L0_70, L1_71
  L0_70 = {}
  L1_71 = {}
  invokeTask(function()
    local L0_72, L1_73, L2_74, L3_75
    while true do
      for L3_75 = 1, 15 do
        L0_70[L3_75] = findGameObject2("Puppet", "elektricity_" .. string.format("%02d", L3_75))
        L1_71[L3_75] = findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L3_75))
      end
      L0_70[16] = L0_72
      L1_71[16] = L0_72
      L3_75 = L1_71
      L0_72(L1_73, L2_74, L3_75)
      L0_72()
    end
  end)
end
function checkChainBlitz()
  invokeTask(function()
    local L0_76, L1_77, L2_78, L3_79, L4_80, L5_81, L6_82, L7_83, L8_84
    L0_76 = 0
    L1_77 = 0
    L2_78 = {}
    L3_79 = false
    L4_80 = false
    while true do
      L0_76 = 0
      L1_77 = 0
      for L8_84 = 1, 15 do
        L2_78[L8_84] = findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L8_84))
      end
      L2_78[16] = L5_81
      for L8_84 = 1, 16 do
        if L2_78[L8_84] ~= nil and L2_78[L8_84]:eventMessage("IsAttackingChainBlitz") then
          L0_76 = L0_76 + 1
          L3_79 = true
        end
      end
      if L3_79 then
        for L8_84 = 1, 16 do
          if L2_78[L8_84] ~= nil then
            if L2_78[L8_84]:eventMessage("IsChainBlitzHit") and L4_80 == false then
              print("\233\128\163\233\155\187\230\146\131HIT")
              L4_80 = true
            end
            if L0_76 == 0 then
              if L1_77 < 2 then
                L1_77 = L1_77 + 1
              elseif L8_84 ~= 16 then
                print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\230\173\187\228\186\161", L2_78[L8_84]:getName())
                L2_78[L8_84]:eventMessage("ForceDead")
                _first_ele_dead_flag = true
              end
              L3_79 = false
              end_action = true
            end
          end
        end
      end
      if L4_80 and L3_79 == false then
        L5_81(L6_82)
        _request_respawn = true
        L4_80 = false
        end_action = false
        L5_81(L6_82)
        _request_respawn_nohit = true
        L4_80 = false
        end_action = false
      end
      L5_81()
    end
  end)
end
function respawnElektricityManager()
  invokeTask(function()
    local L1_85, L3_86
    L1_85 = false
    L3_86 = 0
    while true do
      if false and L3_86 >= 210 then
        L1_85 = true
      elseif _request_respawn then
        _request_respawn = false
        L3_86 = 0
      elseif _request_respawn_nohit then
        _request_respawn_nohit = false
        L3_86 = 0
      elseif L3_86 >= 900 then
        L1_85 = true
      end
      if L1_85 then
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\229\190\169\230\180\187")
        _elektricity_gen:setAutoRevirthSwitch(true)
        wait(10)
        _elektricity_gen:setAutoRevirthSwitch(false)
        L1_85 = false
        L3_86 = 0
      end
      L3_86 = L3_86 + 1
      wait()
    end
  end)
end
function firstEleDeadCaption()
  invokeTask(function()
    repeat
      wait()
    until _first_ele_dead_flag
    Fn_captionViewWait("ep25_02002")
  end)
end
function chargeAttack()
  invokeTask(function()
    local L0_87, L1_88, L2_89, L3_90, L4_91, L5_92, L6_93, L7_94, L8_95
    L0_87 = 0
    L1_88 = {}
    L2_89 = true
    while true do
      if L3_90 then
        if L0_87 >= 600 and L2_89 or L0_87 >= 350 and L2_89 == false then
          for L6_93 = 1, 15 do
            L7_94 = findGameObject2
            L8_95 = "EnemyBrain"
            L7_94 = L7_94(L8_95, "elektricity_" .. string.format("%02d", L6_93))
            L1_88[L6_93] = L7_94
            L7_94 = L1_88[L6_93]
            if L7_94 ~= nil then
              L7_94 = nil
              if L2_89 then
                L8_95 = Fn_sendEventComSb
                L8_95 = L8_95("movePoint")
                L7_94 = L8_95
              else
                L8_95 = Fn_getPlayerWorldPos
                L8_95 = L8_95()
                L7_94 = L8_95
              end
              L8_95 = L1_88[L6_93]
              L8_95 = L8_95.eventMessage
              L8_95 = L8_95(L8_95, "SetReservationsActionMoveAndAttack", L7_94)
              L0_87 = 0
              print("\227\129\130\227\129\182\227\130\138\227\129\160\227\129\151\229\174\159\232\161\140", L8_95, L6_93)
              L2_89 = false
              break
            end
          end
        end
      else
        L0_87 = 0
        L2_89 = false
      end
      L0_87 = L0_87 + 1
      L3_90()
    end
  end)
end
function pccubesensor2_elec_battle_03_OnEnter()
  local L0_96, L1_97
  _isInSensor = true
end
function pccubesensor2_elec_battle_03_OnLeave()
  local L0_98, L1_99
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_100
  L1_100 = _warp_caption_flag
  if L1_100 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep25_02003")
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
    Fn_setFeline(false, false, false, true)
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Player:setControl(Player.kControl_All, true)
  end
  Fn_naviKill()
end
