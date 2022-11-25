dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/rac_perceivableNpc.lua")
_enemy_pup_tbl = {}
_car_hdl = nil
_is_in_sensor = false
_is_out_of_range = false
_is_bomb = false
_start_pos_idx = nil
_hundred_legs_box_tbl = {}
_alarm_se_handle = nil
_sdemo = nil
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mach_01_01_01",
      target_vehicle = "landingship_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "mech_pilot_01_01_01",
      target_vehicle = "mach_01_01_01"
    }
  },
  onSpawn = function(A0_0, A1_1)
  end,
  onUpdate = function(A0_2)
    local L1_3
  end,
  onEnter = function(A0_4)
    local L1_5
  end,
  onLeave = function(A0_6)
    local L1_7
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_02"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mach_02_01_01",
      target_vehicle = "landingship_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "mech_pilot_02_01_01",
      target_vehicle = "mach_02_01_01"
    }
  },
  onSpawn = function(A0_12, A1_13)
  end,
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onObjectAsh = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end
}
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "officer_launcher",
      locator = "locator_weak_01",
      name = "weak_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_02",
      name = "weak_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_03",
      name = "weak_03_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_04",
      name = "weak_03_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_05",
      name = "weak_03_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_06",
      name = "weak_03_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_07",
      name = "weak_03_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_08",
      name = "weak_03_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_09",
      name = "weak_03_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_10",
      name = "weak_03_10"
    }
  },
  onSpawn = function(A0_24, A1_25)
  end,
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onObjectAsh = function(A0_32, A1_33)
  end,
  onObjectDead = function(A0_34, A1_35)
  end
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_mech_01",
      name = "mach_04_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_mech_01",
      name = "mech_pilot_04_01",
      target_vehicle = "mach_04_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_weak_01",
      name = "weak_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_02",
      name = "weak_04_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_03",
      name = "weak_04_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_04",
      name = "weak_04_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_05",
      name = "weak_04_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_06",
      name = "weak_04_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_07",
      name = "weak_04_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_08",
      name = "weak_04_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_09",
      name = "weak_04_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_10",
      name = "weak_04_10"
    }
  },
  onSpawn = function(A0_36, A1_37)
  end,
  onUpdate = function(A0_38)
    local L1_39
  end,
  onEnter = function(A0_40)
    local L1_41
  end,
  onLeave = function(A0_42)
    local L1_43
  end,
  onObjectAsh = function(A0_44, A1_45)
  end,
  onObjectDead = function(A0_46, A1_47)
  end
}
enmgen2_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "officer_launcher",
      locator = "locator_weak_01",
      name = "weak_05_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_02",
      name = "weak_05_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_03",
      name = "weak_05_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_04",
      name = "weak_05_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_05",
      name = "weak_05_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_06",
      name = "weak_05_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_07",
      name = "weak_05_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_08",
      name = "weak_05_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_09",
      name = "weak_05_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator_weak_10",
      name = "weak_05_10"
    }
  },
  onSpawn = function(A0_48, A1_49)
  end,
  onUpdate = function(A0_50)
    local L1_51
  end,
  onEnter = function(A0_52)
    local L1_53
  end,
  onLeave = function(A0_54)
    local L1_55
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onObjectDead = function(A0_58, A1_59)
  end
}
function Initialize()
  local L0_60
  L0_60 = Fn_sendEventComSb
  L0_60 = L0_60("getEscapeStartIdx")
  _start_pos_idx = L0_60
  L0_60 = _start_pos_idx
  if L0_60 == nil then
    _start_pos_idx = 1
  end
  L0_60 = {
    {
      name = "sm07_soldier_02_01",
      type = "soldier",
      node = "locator2_enemy_soldier_01",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_02",
      type = "soldier",
      node = "locator2_enemy_soldier_02",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_03",
      type = "soldier",
      node = "locator2_enemy_soldier_03",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_04",
      type = "soldier",
      node = "locator2_enemy_soldier_04",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_05",
      type = "soldier",
      node = "locator2_enemy_soldier_05",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_06",
      type = "soldier",
      node = "locator2_enemy_soldier_06",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_07",
      type = "soldier",
      node = "locator2_enemy_soldier_07",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_08",
      type = "soldier",
      node = "locator2_enemy_soldier_08",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_09",
      type = "soldier",
      node = "locator2_enemy_soldier_09",
      attach = false,
      active = false
    },
    {
      name = "sm07_soldier_02_10",
      type = "soldier",
      node = "locator2_enemy_soldier_10",
      attach = false,
      active = false
    }
  }
  Fn_setupNpc(L0_60)
  for _FORV_4_, _FORV_5_ in ipairs(L0_60) do
    _enemy_pup_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L0_60 = Fn_pcSensorOff
  L0_60("pccubesensor2_escape_01")
  L0_60 = Fn_pcSensorOff
  L0_60("pccubesensor2_escape_02")
  L0_60 = Fn_pcSensorOff
  L0_60("pccubesensor2_escape_03")
  L0_60 = Fn_pcSensorOff
  L0_60("pccubesensor2_escape_04")
  L0_60 = Fn_pcSensorOff
  L0_60("pccubesensor2_bomb_01")
  L0_60 = Fn_pcSensorOff
  L0_60("pccubesensor2_out_01")
  L0_60 = Fn_createGimmickBg
  L0_60 = L0_60(string.format("locator2_car_%02d", _start_pos_idx), "car_03", "ve_lo_a", false)
  _car_hdl = L0_60
  L0_60 = _car_hdl
  L0_60 = L0_60.setCollidableBlockEnable
  L0_60(L0_60, false)
  L0_60 = _car_hdl
  L0_60 = L0_60.setVisibleBlockEnable
  L0_60(L0_60, false)
  L0_60 = SDemo
  L0_60 = L0_60.create
  L0_60 = L0_60("sm07_sdemo")
  _sdemo = L0_60
end
function Ingame()
  local L0_61, L1_62, L2_63, L3_64, L4_65
  L0_61 = Fn_warshipShellingOff
  L0_61()
  L0_61 = Fn_userCtrlOff
  L0_61()
  L0_61 = Fn_setNpcActive
  L1_62 = "sm07_client"
  L2_63 = true
  L0_61(L1_62, L2_63)
  L0_61 = Fn_warpNpc
  L1_62 = "sm07_client"
  L2_63 = string
  L2_63 = L2_63.format
  L3_64 = "warppoint2_client_01_%02d"
  L4_65 = _start_pos_idx
  L4_65 = L2_63(L3_64, L4_65)
  L0_61(L1_62, L2_63, L3_64, L4_65, L2_63(L3_64, L4_65))
  L0_61 = 1
  while true do
    L1_62 = findGameObject2
    L2_63 = "Node"
    L3_64 = string
    L3_64 = L3_64.format
    L4_65 = "locator2_hundred_legs_box_%02d_%02d"
    L4_65 = L3_64(L4_65, _start_pos_idx, L0_61)
    L1_62 = L1_62(L2_63, L3_64, L4_65, L3_64(L4_65, _start_pos_idx, L0_61))
    if L1_62 ~= nil then
      L2_63 = Fn_createGimmickBg
      L3_64 = L1_62
      L4_65 = string
      L4_65 = L4_65.format
      L4_65 = L4_65("hundred_legs_box_%02d", L0_61)
      L2_63 = L2_63(L3_64, L4_65, "woodbox_kk_02")
      L4_65 = L2_63
      L3_64 = L2_63.setVisibleBlockEnable
      L3_64(L4_65, false)
      L3_64 = table
      L3_64 = L3_64.insert
      L4_65 = _hundred_legs_box_tbl
      L3_64(L4_65, L2_63)
    else
      break
    end
    L0_61 = L0_61 + 1
  end
  L0_61 = {
    L1_62,
    L2_63,
    L3_64,
    L4_65,
    {
      npc_name = "sm07_soldier_02_05",
      move_prefix = "locator2_enemy_soldier_05_move_"
    },
    {
      npc_name = "sm07_soldier_02_06",
      move_prefix = "locator2_enemy_soldier_06_move_"
    },
    {
      npc_name = "sm07_soldier_02_07",
      move_prefix = "locator2_enemy_soldier_07_move_"
    },
    {
      npc_name = "sm07_soldier_02_08",
      move_prefix = "locator2_enemy_soldier_08_move_"
    },
    {
      npc_name = "sm07_soldier_02_09",
      move_prefix = "locator2_enemy_soldier_09_move_"
    },
    {
      npc_name = "sm07_soldier_02_10",
      move_prefix = "locator2_enemy_soldier_10_move_"
    }
  }
  L1_62 = {}
  L1_62.npc_name = "sm07_soldier_02_01"
  L1_62.move_prefix = "locator2_enemy_soldier_01_move_"
  L2_63 = {}
  L2_63.npc_name = "sm07_soldier_02_02"
  L2_63.move_prefix = "locator2_enemy_soldier_02_move_"
  L3_64 = {}
  L3_64.npc_name = "sm07_soldier_02_03"
  L3_64.move_prefix = "locator2_enemy_soldier_03_move_"
  L4_65 = {}
  L4_65.npc_name = "sm07_soldier_02_04"
  L4_65.move_prefix = "locator2_enemy_soldier_04_move_"
  L1_62 = {}
  L2_63 = 1
  while true do
    L3_64 = string
    L3_64 = L3_64.format
    L4_65 = "enmgen2_%02d"
    L3_64 = L3_64(L4_65, L2_63)
    L4_65 = findGameObject2
    L4_65 = L4_65("EnemyGenerator", L3_64)
    if L4_65 ~= nil then
      L1_62[L3_64] = L4_65
    else
      break
    end
    L2_63 = L2_63 + 1
  end
  L2_63 = Sound
  L3_64 = L2_63
  L2_63 = L2_63.playSEHandle
  L4_65 = "ep10_siren"
  L2_63 = L2_63(L3_64, L4_65, 1, "", Fn_findAreaHandle("ar_a_root"))
  _alarm_se_handle = L2_63
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.reset
  L2_63()
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.setLabel
  L3_64 = "sm07_09053"
  L2_63(L3_64)
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.setValueLimitRange
  L3_64 = RAC_CautionLevel
  L3_64 = L3_64.MAX_LEVEL
  L2_63(L3_64)
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.setVisible
  L3_64 = true
  L2_63(L3_64)
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.drawTask
  L2_63()
  L2_63 = playSdemo03
  L3_64 = L0_61
  L4_65 = L1_62
  L2_63(L3_64, L4_65)
  L2_63 = Fn_userCtrlOn
  L2_63()
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.setVisible
  L3_64 = false
  L2_63(L3_64)
  L2_63 = Fn_kaiwaDemoView
  L3_64 = "sm07_00300k"
  L2_63(L3_64)
  L2_63 = RAC_CautionLevel
  L2_63 = L2_63.setVisible
  L3_64 = true
  L2_63(L3_64)
  L2_63 = invokeTask
  function L3_64()
    while true do
      Fn_turnNpc("sm07_client")
      Sound:playSE("m10_901b", 1, "", Fn_findNpcPuppet("sm07_client"))
      Fn_playMotionNpc("sm07_client", "wavehand_far_00", true)
      waitSeconds(RandF(1, 2.5))
    end
  end
  L2_63 = L2_63(L3_64)
  L3_64 = Fn_pcSensorOn
  L4_65 = "pccubesensor2_out_01"
  L3_64(L4_65)
  _is_bomb = false
  L3_64 = Fn_pcSensorOn
  L4_65 = "pccubesensor2_bomb_01"
  L3_64(L4_65)
  L3_64 = Fn_missionView
  L4_65 = "sm07_03000"
  L3_64(L4_65)
  L3_64 = waitSeconds
  L4_65 = 1.3
  L3_64(L4_65)
  L3_64 = Fn_naviSet
  L4_65 = findGameObject2
  L4_65 = L4_65("Node", string.format("locator2_navi_escape_%02d", _start_pos_idx))
  L3_64(L4_65, L4_65("Node", string.format("locator2_navi_escape_%02d", _start_pos_idx)))
  L3_64 = false
  L4_65 = nil
  _is_in_sensor = false
  Fn_pcSensorOn(string.format("pccubesensor2_escape_%02d", _start_pos_idx))
  while _is_in_sensor == false do
    if _is_bomb == true then
      if L3_64 == false then
        print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\191\142\230\146\131\233\150\139\229\167\139")
        Fn_IdlingMechCannon(false)
        Fn_MechCannonStartBlankMode()
        L4_65 = invokeTask(function()
          local L0_66, L1_67, L2_68
          while true do
            L0_66 = Fn_WaitMechCannonShot
            L0_66 = L0_66()
            if L0_66 == false then
              L0_66 = wait
              L0_66()
            else
              L0_66 = Fn_getPlayerWorldPos
              L0_66 = L0_66()
              L1_67 = Vector
              L2_68 = RandF
              L2_68 = L2_68(-2, 2)
              L1_67 = L1_67(L2_68, RandF(-2, 2), RandF(-2, 2))
              L1_67 = L0_66 + L1_67
              L2_68 = RAC_createEffect
              L2_68({
                eff_name = "ef_ev_exp_01",
                world_pos = L1_67,
                time = 4
              })
              L2_68 = Player
              L2_68 = L2_68.getEnergyMax
              L2_68 = L2_68(L2_68, Player.kEnergy_Life)
              L2_68 = L2_68 * 0.5
              Player:applyImpactDamage(L1_67, NormalizeVector(L0_66 - L1_67) * 2, L2_68, true)
              Fn_MechCannonShotClear()
            end
          end
        end)
        L3_64 = true
      end
    elseif L3_64 == true then
      print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\191\142\230\146\131\231\181\130\228\186\134")
      if L4_65 ~= nil then
        L4_65:abort()
        L4_65 = nil
      end
      Fn_IdlingMechCannon(true)
      Fn_MechCannonShotClear()
      L3_64 = false
    end
    wait()
  end
  Fn_sendEventComSb("sm07_catwarp_permission", false)
  Fn_setCatWarp(false)
  Fn_pcSensorOff(string.format("pccubesensor2_escape_%02d", _start_pos_idx))
  _is_in_sensor = false
  Fn_naviKill()
  if L4_65 ~= nil then
    L4_65:abort()
    L4_65 = nil
  end
  Fn_pcSensorOff("pccubesensor2_bomb_01")
  _is_bomb = false
  Fn_pcSensorOff("pccubesensor2_out_01")
  Fn_userCtrlOff()
  Fn_blackout()
  for _FORV_8_, _FORV_9_ in ipairs(L1_62) do
    L1_62[_FORV_8_]:requestAllEnemyKill()
  end
  L1_62 = {}
  for _FORV_8_, _FORV_9_ in ipairs(L0_61) do
    if Fn_findNpc(_FORV_9_.npc_name) then
      Fn_findNpc(_FORV_9_.npc_name):changeNpc()
    end
    if _FORV_9_ then
      Fn_setNpcActive(_FORV_9_.npc_name, false)
    end
  end
  L2_63:abort()
  L2_63 = nil
  if _alarm_se_handle then
    Sound:stopSEHandle(_alarm_se_handle)
    _alarm_se_handle = nil
  end
  RAC_CautionLevel.setVisible(false)
  RAC_CautionLevel.drawTaskAbort()
  RAC_CautionLevel.reset()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _alarm_se_handle ~= nil then
    Sound:stopSEHandle(_alarm_se_handle)
    _alarm_se_handle = nil
  end
  Fn_IdlingMechCannon(true)
  Fn_MechCannonShotClear()
  Fn_warshipShellingOn()
end
function createEffect(A0_69, A1_70, A2_71)
  createGameObject2("Effect"):setName(A0_69)
  createGameObject2("Effect"):setModelName(A1_70)
  createGameObject2("Effect"):setPos(A2_71)
  createGameObject2("Effect"):play()
  start_game_obj()
  return (createGameObject2("Effect"))
end
function setLandingshipEventListener(A0_72, A1_73, A2_74)
  local L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87, L16_88, L17_89, L18_90, L19_91
  L4_76 = A0_72
  L3_75 = A0_72.getSpecTable
  L3_75 = L3_75(L4_76)
  L4_76 = ""
  for L8_80, L9_81 in L5_77(L6_78) do
    L10_82 = L9_81.type
    if L10_82 == "landingship" then
      L4_76 = L9_81.name
      break
    end
  end
  if L4_76 == "" then
    return L5_77
  end
  for L10_82, L11_83 in L7_79(L8_80) do
    L12_84 = L11_83.type
    if L12_84 ~= "landingship" then
      L12_84 = L11_83.target_vehicle
      if L12_84 ~= L4_76 then
      else
        L12_84 = L11_83.type
        if L12_84 == "mechsmall" then
          if L6_78 == "" then
            L12_84 = string
            L12_84 = L12_84.sub
            L13_85 = L11_83.name
            L14_86 = 1
            L15_87 = -9
            L12_84 = L12_84(L13_85, L14_86, L15_87)
          end
        elseif L5_77 == "" then
          L12_84 = string
          L12_84 = L12_84.sub
          L13_85 = L11_83.name
          L14_86 = 1
          L15_87 = -9
          L12_84 = L12_84(L13_85, L14_86, L15_87)
        end
      end
    end
    if L5_77 == "" or L6_78 == "" then
    end
  end
  L10_82 = L4_76
  L8_80(L9_81)
  L10_82 = L4_76
  L10_82 = L8_80
  L10_82 = 0
  L11_83 = 1
  L12_84 = 2
  L13_85 = 3
  L14_86 = 4
  L15_87 = 5
  L16_88 = L10_82
  L17_89 = 1
  L18_90 = 1
  function L19_91(A0_92)
    local L1_93, L2_94
    L1_93 = A0_92.state
    if L1_93 == "wait" then
      L1_93 = L16_88
      L2_94 = L10_82
      if L1_93 ~= L2_94 then
        L1_93 = L16_88
        L2_94 = L12_84
        if L1_93 ~= L2_94 then
          L1_93 = L16_88
          L2_94 = L14_86
        end
      else
        if L1_93 == L2_94 then
          L1_93 = {}
          A0_92.movePoint = L1_93
          L1_93 = 1
          while true do
            L2_94 = nil
            if L16_88 == L10_82 then
              L2_94 = findGameObject2("Node", "locator2_" .. string.format("%s_move_a_%02d_%02d", L4_76, L17_89, L1_93))
              if L1_93 == 1 and L2_94 == nil then
                L16_88 = L12_84
                L18_90 = 1
              end
            end
            if L16_88 == L12_84 then
              L2_94 = findGameObject2("Node", "locator2_" .. string.format("%s_move_b_%02d_%02d", L4_76, L18_90, L1_93))
              if L1_93 == 1 and L2_94 == nil then
                L16_88 = L14_86
              end
            end
            if L16_88 == L14_86 then
              L2_94 = findGameObject2("Node", "locator2_" .. string.format("%s_move_c_%02d", L4_76, L1_93))
            end
            if L2_94 ~= nil then
              print(L2_94:getName())
              table.insert(A0_92.movePoint, L2_94:getName())
            else
              break
            end
            L1_93 = L1_93 + 1
          end
          L2_94 = A0_92.movePoint
          L2_94 = #L2_94
          if L2_94 > 0 then
            A0_92.changeState = "move"
          else
            L2_94 = print
            L2_94(L4_76 .. " landingship move error")
          end
      end
      else
        L1_93 = L16_88
        L2_94 = L11_83
        if L1_93 == L2_94 then
          L1_93 = A1_73
          if L1_93 ~= nil then
            L1_93 = A1_73
            L2_94 = L17_89
            L1_93 = L1_93(L2_94)
          elseif L1_93 == true then
            L1_93 = A0_72
            L2_94 = L1_93
            L1_93 = L1_93.getSpecTable
            L1_93 = L1_93(L2_94)
            L2_94 = L6_78
            L2_94 = L2_94 .. string.format("%s_%02d_", L7_79, L17_89)
            A0_92.dropEnemy = {}
            for _FORV_6_, _FORV_7_ in ipairs(L1_93.spawnSet) do
              if _FORV_7_.type == "mechsmall" and string.sub(_FORV_7_.name, 1, -3) == L2_94 then
                table.insert(A0_92.dropEnemy, _FORV_7_.name)
              end
            end
            if 0 < #A0_92.dropEnemy then
              A0_92.changeState = "drop"
              L17_89 = L17_89 + 1
              print(L4_76 .. " drop")
            else
              print(L4_76 .. " landingship drop error. name:" .. L2_94 .. "**")
            end
          end
        else
          L1_93 = L16_88
          L2_94 = L13_85
          if L1_93 == L2_94 then
            L1_93 = A2_74
            if L1_93 ~= nil then
              L1_93 = A2_74
              L2_94 = L18_90
              L1_93 = L1_93(L2_94)
            elseif L1_93 == true then
              L1_93 = {}
              A0_92.dropEnemy = L1_93
              L1_93 = A0_72
              L2_94 = L1_93
              L1_93 = L1_93.getSpecTable
              L1_93 = L1_93(L2_94)
              L2_94 = L5_77
              L2_94 = L2_94 .. string.format("%s_%02d_", L7_79, L18_90)
              for _FORV_6_, _FORV_7_ in ipairs(L1_93.spawnSet) do
                if _FORV_7_.type == "landingship" or _FORV_7_.type == "mechsmall" or _FORV_7_.target_vehicle ~= L4_76 then
                elseif string.sub(_FORV_7_.name, 1, -3) == L2_94 then
                  table.insert(A0_92.dropEnemy, _FORV_7_.name)
                end
              end
              if 0 < #A0_92.dropEnemy then
                A0_92.changeState = "open"
                L18_90 = L18_90 + 1
                print(L4_76 .. " open")
              else
                print(L4_76 .. " landingship open error. name:" .. L2_94 .. "**")
              end
            end
          end
        end
      end
    else
      L1_93 = A0_92.state
      if L1_93 == "moveEnd" then
        L1_93 = L16_88
        L2_94 = L10_82
        if L1_93 == L2_94 then
          L1_93 = L11_83
          L16_88 = L1_93
        else
          L1_93 = L16_88
          L2_94 = L12_84
          if L1_93 == L2_94 then
            L1_93 = L13_85
            L16_88 = L1_93
          else
            L1_93 = L16_88
            L2_94 = L14_86
            if L1_93 == L2_94 then
              L1_93 = L15_87
              L16_88 = L1_93
              L1_93 = L9_81
              L2_94 = L1_93
              L1_93 = L1_93.setEventListener
              L1_93(L2_94, "enemy_landingship_event", nil)
            end
          end
        end
      else
        L1_93 = A0_92.state
        if L1_93 == "dropEnd" then
          L1_93 = L10_82
          L16_88 = L1_93
        else
          L1_93 = A0_92.state
          if L1_93 == "openEnd" then
            L1_93 = L12_84
            L16_88 = L1_93
          end
        end
      end
    end
    return A0_92
  end
  L9_81:setEventListener("enemy_landingship_event", L19_91)
  print("\229\188\183\232\165\178\230\143\154\233\153\184\232\137\166\227\130\179\227\131\188\227\131\171\227\131\144\227\131\131\227\130\175\232\168\173\229\174\154\239\188\154" .. L4_76)
  return true
end
function playSdemo03(A0_95, A1_96)
  local L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103
  L2_97 = {
    L3_98,
    L4_99,
    L5_100,
    L6_101,
    L7_102,
    L8_103,
    {group = 15, idx = 13},
    {group = 15, idx = 14}
  }
  L3_98.group = 15
  L3_98.idx = 4
  L4_99.group = 15
  L4_99.idx = 5
  L5_100.group = 15
  L5_100.idx = 6
  L6_101.group = 15
  L6_101.idx = 7
  L7_102.group = 15
  L7_102.idx = 11
  L8_103.group = 15
  L8_103.idx = 12
  for L6_101, L7_102 in L3_98(L4_99) do
    L8_103("containerSetActive", L7_102.group, L7_102.idx, false)
  end
  L4_99.group = 28
  L4_99.idx = 1
  L5_100.group = 28
  L5_100.idx = 2
  L6_101.group = 28
  L6_101.idx = 3
  L7_102.group = 29
  L7_102.idx = 1
  L8_103.group = 29
  L8_103.idx = 2
  for L7_102, L8_103 in L4_99(L5_100) do
    Fn_sendEventComSb("resBoxSetActive", L8_103.group, L8_103.idx, false)
  end
  L4_99(L5_100, L6_101, L7_102, L8_103, L5_100(L6_101, L7_102, L8_103))
  for L7_102, L8_103 in L4_99(L5_100) do
    A1_96[L7_102]:requestPrepare()
  end
  repeat
    L5_100()
    for L8_103, _FORV_9_ in L5_100(L6_101) do
      if _FORV_9_:isPrepared() == false then
        print(L8_103 .. " loading...")
        break
      end
    end
  until L4_99 == true
  for L7_102, L8_103 in L4_99(L5_100) do
    A1_96[L7_102]:requestSpawn()
    A1_96[L7_102]:requestIdlingEnemy(true)
    A1_96[L7_102]:setEnemyMarker(false)
  end
  for L8_103, _FORV_9_ in L5_100(L6_101) do
    Fn_setNpcActive(_FORV_9_.npc_name, true)
    table.insert(L4_99, RAC_invokeMoveCharaTask(_FORV_9_.npc_name, _FORV_9_.move_prefix, {runLength = 1}))
  end
  L8_103(A1_96.enmgen2_01, L7_102)
  L8_103(L8_103)
  L8_103(L8_103, "locator2_sdemo_03_cam_01", "locator2_sdemo_03_aim_01")
  L8_103(L8_103)
  L8_103()
  L8_103(function()
    local L0_104
    L0_104 = waitSeconds
    L0_104(0.2)
    L0_104 = Sound
    L0_104 = L0_104.playSE
    L0_104(L0_104, "ene_officer_call_m23")
    L0_104 = print
    L0_104("[ene_officer_call_m23]\227\130\146\229\134\141\231\148\159\227\129\151\227\129\190\227\129\151\227\129\159")
    L0_104 = waitSeconds
    L0_104(0.5)
    L0_104 = {
      "ene_human_call_m25",
      "ene_human_call_m26",
      "ene_human_call_m27",
      "ene_human_call_m28"
    }
    for _FORV_4_, _FORV_5_ in ipairs(L0_104) do
      Sound:playSE(L0_104[_FORV_4_])
      print("[" .. L0_104[_FORV_4_] .. "]\227\130\146\229\134\141\231\148\159\227\129\151\227\129\190\227\129\151\227\129\159")
      waitSeconds(RandF(0.1, 0.2))
    end
    waitSeconds(1.1)
    Sound:playSE("ene_officer_command_m23")
    print("[ene_officer_command_m23]\227\130\146\229\134\141\231\148\159\227\129\151\227\129\190\227\129\151\227\129\159")
  end)
  L8_103(2)
  L8_103(L8_103, nil, {
    {
      pos = "locator2_sdemo_03_aim_02",
      time = 1,
      hashfunc = "EaseOut"
    }
  })
  while true do
    while true do
      if L8_103 then
        L8_103()
      end
    end
  end
  while L5_100 == false do
    L8_103()
  end
  L8_103(0.8)
  L8_103(L8_103, nil, {
    {
      pos = "locator2_sdemo_03_aim_03",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    if L8_103 then
      L8_103()
    end
  end
  L8_103(1)
  L8_103(0.5)
  for _FORV_11_, _FORV_12_ in L8_103(A1_96) do
    if _FORV_11_ ~= "enmgen2_01" then
      A1_96[_FORV_11_]:requestIdlingEnemy(false)
      if setLandingshipEventListener(A1_96[_FORV_11_]) == false then
        A1_96[_FORV_11_]:requestIdlingEnemy(true)
      end
    end
  end
  L8_103(L8_103)
  L8_103(L8_103, string.format("locator2_sdemo_03_cam_02_%02d", _start_pos_idx), string.format("locator2_sdemo_03_aim_04_%02d", _start_pos_idx))
  L8_103(0.5)
  while true do
    L8_103()
    for _FORV_12_, _FORV_13_ in ipairs(L4_99) do
      if _FORV_13_:isRunning() then
        break
      end
    end
    if L8_103 ~= true then
    end
  end
  for _FORV_11_, _FORV_12_ in L8_103(L4_99) do
    L4_99[_FORV_11_]:abort()
  end
  for _FORV_11_, _FORV_12_ in L8_103(A1_96) do
    A1_96[_FORV_11_]:setEnemyMarker(true)
    A1_96[_FORV_11_]:requestIdlingEnemy(false)
  end
  for _FORV_11_, _FORV_12_ in L8_103(A0_95) do
    Fn_findNpc(_FORV_12_.npc_name):changeEnemy()
    Fn_setGrabNpc(_FORV_12_.npc_name, false, true)
    Fn_findNpc(_FORV_12_.npc_name):setIgnoreGrabThrow(false)
  end
  L8_103(L8_103, 1)
end
function pccubesensor2_escape_01_OnEnter()
  local L0_105, L1_106
  _is_in_sensor = true
end
function pccubesensor2_escape_01_OnLeave()
  local L0_107, L1_108
  _is_in_sensor = false
end
function pccubesensor2_escape_02_OnEnter()
  local L0_109, L1_110
  _is_in_sensor = true
end
function pccubesensor2_escape_02_OnLeave()
  local L0_111, L1_112
  _is_in_sensor = false
end
function pccubesensor2_escape_03_OnEnter()
  local L0_113, L1_114
  _is_in_sensor = true
end
function pccubesensor2_escape_03_OnLeave()
  local L0_115, L1_116
  _is_in_sensor = false
end
function pccubesensor2_escape_04_OnEnter()
  local L0_117, L1_118
  _is_in_sensor = true
end
function pccubesensor2_escape_04_OnLeave()
  local L0_119, L1_120
  _is_in_sensor = false
end
function pccubesensor2_escape_out_01_OnEnter()
  local L0_121, L1_122
  _is_out_of_range = false
end
function pccubesensor2_escape_out_01_OnLeave()
  local L0_123, L1_124
  _is_out_of_range = true
end
function pccubesensor2_bomb_01_OnEnter()
  local L0_125, L1_126
  _is_bomb = true
end
function pccubesensor2_bomb_01_OnLeave()
  local L0_127, L1_128
  _is_bomb = false
end
function pccubesensor2_out_01_OnEnter()
  local L0_129, L1_130
end
function pccubesensor2_out_01_OnLeave()
  Fn_pcSensorOff("pccubesensor2_out_01")
  invokeTask(function()
    local L0_131, L1_132, L2_133, L3_134, L4_135, L5_136
    L0_131 = Sound
    L0_131 = L0_131.pulse
    L0_131(L1_132, L2_133)
    while true do
      L0_131 = {
        L1_132,
        L2_133,
        L3_134,
        L4_135,
        L5_136,
        {
          offset = Vector(3, 2, -3),
          delay_sec = 0.8
        },
        {
          offset = Vector(3, 0, -9),
          delay_sec = 0.6
        },
        {
          offset = Vector(-3, 0, 9),
          delay_sec = 0.4
        },
        {
          offset = Vector(-6, -1, 3),
          delay_sec = 0.2
        },
        {
          offset = Vector(6, 1, -3),
          delay_sec = 0
        }
      }
      L4_135 = 1
      L5_136 = 3
      L1_132.offset = L2_133
      L1_132.delay_sec = 0
      L4_135 = 0
      L5_136 = -1
      L2_133.offset = L3_134
      L2_133.delay_sec = 0.2
      L4_135 = Vector
      L5_136 = 3
      L4_135 = L4_135(L5_136, 0, 6)
      L3_134.offset = L4_135
      L3_134.delay_sec = 0.4
      L4_135 = {}
      L5_136 = Vector
      L5_136 = L5_136(-3, 0, -6)
      L4_135.offset = L5_136
      L4_135.delay_sec = 0.6
      L5_136 = {}
      L5_136.offset = Vector(0, -2, 3)
      L5_136.delay_sec = 0.8
      for L4_135, L5_136 in L1_132(L2_133) do
        invokeTask(function()
          local L0_137, L1_138, L2_139
          L0_137 = L5_136.delay_sec
          if L0_137 > 0 then
            L0_137 = waitSeconds
            L1_138 = L5_136.delay_sec
            L0_137(L1_138)
          end
          L0_137 = Fn_getPlayerWorldPos
          L0_137 = L0_137()
          L1_138 = L5_136.offset
          L1_138 = L0_137 + L1_138
          L2_139 = RAC_createEffect
          L2_139({
            eff_name = "ef_ev_exp_01",
            world_pos = L1_138,
            time = 4
          })
          L2_139 = Player
          L2_139 = L2_139.getEnergyMax
          L2_139 = L2_139(L2_139, Player.kEnergy_Life)
          L2_139 = L2_139 * 0.5
          Player:applyImpactDamage(L1_138, NormalizeVector(L0_137 - L1_138) * 2, L2_139, true)
        end)
        break
      end
      L1_132(L2_133)
    end
  end)
end
