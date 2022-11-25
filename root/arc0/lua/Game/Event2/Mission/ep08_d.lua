import("math")
import("DebugDraw")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep08_common.lua")
dofile("/Game/Misc/pdemo.lua")
_pdemo = nil
_enmgen_a = nil
_enmgen_b = nil
_enmgen2 = nil
_enmgen3 = nil
_enmgen4 = nil
_crow_pup = nil
_brain_crow = nil
_brain_hander01 = nil
_brain_hander02 = nil
enmgen2_01_a = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier_rifle_01",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_02",
      name = "soldier_rifle_02",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_03",
      name = "soldier_rifle_03",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_04",
      name = "soldier_rifle_04",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_05",
      name = "soldier_rifle_05",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_06",
      name = "soldier_rifle_06",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_07",
      name = "soldier_rifle_07",
      ai_spawn_option = "Soldier/ep08_d_soldier"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyDeadNum = function(A0_9)
    local L1_10
    L1_10 = A0_9.enemyDeadNum
    return L1_10
  end,
  getEnemyName = function(A0_11, A1_12)
    local L2_13
    L2_13 = A0_11.spawnSet
    L2_13 = L2_13[A1_12]
    L2_13 = L2_13.name
    return L2_13
  end
}
enmgen2_01_b = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_stage_01",
      name = "soldier_rifle_08",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_stage_02",
      name = "soldier_rifle_09",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_stage_03",
      name = "soldier_rifle_10",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_stage_04",
      name = "soldier_rifle_11",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_stage_05",
      name = "soldier_rifle_12",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_stage_06",
      name = "soldier_rifle_13",
      ai_spawn_option = "Soldier/ep08_d_soldier"
    }
  },
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onObjectDead = function(A0_20, A1_21)
    A0_20:getSpecTable().enemyDeadNum = A0_20:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_22)
    return #A0_22.spawnSet
  end,
  getEnemyDeadNum = function(A0_23)
    local L1_24
    L1_24 = A0_23.enemyDeadNum
    return L1_24
  end,
  getEnemyName = function(A0_25, A1_26)
    local L2_27
    L2_27 = A0_25.spawnSet
    L2_27 = L2_27[A1_26]
    L2_27 = L2_27.name
    return L2_27
  end
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_01_landingship",
      name = "landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_01_01",
      name = "area_01_hander01",
      target_vehicle = "landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_01_02",
      name = "area_01_hander02",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_017",
      name = "officer_rifle_017",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_018",
      name = "officer_rifle_018",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_019",
      name = "officer_rifle_019",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_020",
      name = "officer_rifle_020",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_021",
      name = "officer_rifle_021",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_022",
      name = "soldier_rifle_022",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_023",
      name = "soldier_rifle_023",
      target_vehicle = "landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_024",
      name = "soldier_rifle_024",
      target_vehicle = "landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_025",
      name = "soldier_rifle_025",
      target_vehicle = "area_01_hander01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_026",
      name = "soldier_rifle_026",
      target_vehicle = "area_01_hander02"
    }
  },
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectDead = function(A0_34, A1_35)
    A0_34:getSpecTable().enemyDeadNum = A0_34:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_36)
    return #A0_36.spawnSet
  end,
  getEnemyDeadNum = function(A0_37)
    local L1_38
    L1_38 = A0_37.enemyDeadNum
    return L1_38
  end,
  getEnemyName = function(A0_39, A1_40)
    local L2_41
    L2_41 = A0_39.spawnSet
    L2_41 = L2_41[A1_40]
    L2_41 = L2_41.name
    return L2_41
  end
}
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_01_landingship2",
      name = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_01",
      name = "soldier_reinforce_01",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_02",
      name = "soldier_reinforce_02",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_03",
      name = "soldier_reinforce_03",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_04",
      name = "soldier_reinforce_04",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_05",
      name = "soldier_reinforce_05",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_06",
      name = "soldier_reinforce_06",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_07",
      name = "soldier_reinforce_07",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_08",
      name = "soldier_reinforce_08",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_09",
      name = "soldier_reinforce_09",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_10",
      name = "soldier_reinforce_10",
      target_vehicle = "landingship02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_11",
      name = "soldier_reinforce_11",
      target_vehicle = "landingship02"
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onObjectDead = function(A0_48, A1_49)
    A0_48:getSpecTable().enemyDeadNum = A0_48:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_50)
    return #A0_50.spawnSet
  end,
  getEnemyDeadNum = function(A0_51)
    local L1_52
    L1_52 = A0_51.enemyDeadNum
    return L1_52
  end,
  getEnemyName = function(A0_53, A1_54)
    local L2_55
    L2_55 = A0_53.spawnSet
    L2_55 = L2_55[A1_54]
    L2_55 = L2_55.name
    return L2_55
  end
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_12",
      name = "soldier_reinforce_12",
      target_vehicle = "mechsky01"
    },
    {
      type = "officer_rifle",
      locator = "locator2_reinforce_13",
      name = "soldier_reinforce_13",
      target_vehicle = "mechsky02"
    },
    {
      type = "mechsky",
      locator = "locator2_reinforce_14",
      name = "mechsky01"
    },
    {
      type = "mechsky",
      locator = "locator2_reinforce_15",
      name = "mechsky02"
    }
  },
  onUpdate = function(A0_56)
    local L1_57
  end,
  onEnter = function(A0_58)
    local L1_59
  end,
  onLeave = function(A0_60)
    local L1_61
  end,
  onObjectDead = function(A0_62, A1_63)
    A0_62:getSpecTable().enemyDeadNum = A0_62:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_64)
    return #A0_64.spawnSet
  end,
  getEnemyDeadNum = function(A0_65)
    local L1_66
    L1_66 = A0_65.enemyDeadNum
    return L1_66
  end,
  getEnemyName = function(A0_67, A1_68)
    local L2_69
    L2_69 = A0_67.spawnSet
    L2_69 = L2_69[A1_68]
    L2_69 = L2_69.name
    return L2_69
  end
}
function Initialize()
  local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75, L6_76
  L0_70()
  L0_70()
  L3_73.camera = true
  L3_73.scene_param = false
  _pdemo = L0_70
  while true do
    if L0_70 then
      L0_70()
    end
  end
  L0_70(L1_71, L2_72, L3_73)
  for L3_73 = 1, 8 do
    L6_76 = "locator2_energy_gem_"
    L6_76 = L6_76 .. string.format("%02d", L3_73)
    pos = L4_74
    L6_76 = 5
    L4_74(L5_75, L6_76)
  end
  for L6_76 = 1, _wdbx_max do
    L0_70[L6_76] = findGameObject2("GimmickBg", "bg2_woodbox_" .. string.format("%02d", L6_76))
    L0_70[L6_76]:setVisibleBlockEnable(false)
  end
  for L6_76 = 1, 2 do
    L1_71[L6_76] = findGameObject2("GimmickBg", "bg2_steeldrum_kk_01_" .. string.format("%02d", L6_76))
    L1_71[L6_76]:setVisibleBlockEnable(false)
    L2_72[L6_76] = findGameObject2("GimmickBg", "bg2_pallet_oc_01_" .. string.format("%02d", L6_76))
    L2_72[L6_76]:setVisibleBlockEnable(false)
  end
  L3_73(L4_74)
end
function Ingame()
  local L0_77, L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86
  L0_77 = setArStage
  L0_77()
  L0_77 = Fn_setBgmPoint
  L1_78 = "battle"
  L0_77(L1_78)
  L0_77 = Sound
  L1_78 = L0_77
  L0_77 = L0_77.playSEHandle
  L2_79 = "ep08_siren"
  L3_80 = 1
  L0_77 = L0_77(L1_78, L2_79, L3_80)
  handle = L0_77
  L0_77 = findGameObject2
  L1_78 = "EnemyGenerator"
  L2_79 = "enmgen2_01_a"
  L0_77 = L0_77(L1_78, L2_79)
  _enmgen_a = L0_77
  L0_77 = findGameObject2
  L1_78 = "EnemyGenerator"
  L2_79 = "enmgen2_01_b"
  L0_77 = L0_77(L1_78, L2_79)
  _enmgen_b = L0_77
  L0_77 = findGameObject2
  L1_78 = "EnemyGenerator"
  L2_79 = "enmgen2_02"
  L0_77 = L0_77(L1_78, L2_79)
  _enmgen2 = L0_77
  L0_77 = findGameObject2
  L1_78 = "EnemyGenerator"
  L2_79 = "enmgen2_03"
  L0_77 = L0_77(L1_78, L2_79)
  _enmgen3 = L0_77
  L0_77 = findGameObject2
  L1_78 = "EnemyGenerator"
  L2_79 = "enmgen2_04"
  L0_77 = L0_77(L1_78, L2_79)
  _enmgen4 = L0_77
  L0_77 = false
  L1_78 = false
  L2_79 = false
  L3_80 = findGameObject2
  L4_81 = "Node"
  L5_82 = "locator2_enemy_viewpoint_01"
  L3_80 = L3_80(L4_81, L5_82)
  L4_81 = _enmgen2
  L5_82 = L4_81
  L4_81 = L4_81.requestPrepare
  L4_81(L5_82)
  L4_81 = _enmgen3
  L5_82 = L4_81
  L4_81 = L4_81.requestPrepare
  L4_81(L5_82)
  L4_81 = Player
  L5_82 = L4_81
  L4_81 = L4_81.setEnergyInfinite
  L6_83 = Player
  L6_83 = L6_83.kEnergy_Life
  L7_84 = true
  L4_81(L5_82, L6_83, L7_84)
  L4_81 = setIdlingEnemy
  L5_82 = true
  L4_81(L5_82)
  L4_81 = waitSeconds
  L5_82 = 3
  L4_81(L5_82)
  L4_81 = _enmgen_b
  L5_82 = L4_81
  L4_81 = L4_81.requestSpawn
  L4_81(L5_82)
  L4_81 = Fn_resetPcPos
  L5_82 = "locator2_pc_start_pos2"
  L4_81(L5_82)
  L4_81 = Fn_missionStart
  L4_81()
  L4_81 = Fn_missionView
  L5_82 = "ep08_03000"
  L4_81(L5_82)
  L4_81 = waitSeconds
  L5_82 = 1.3
  L4_81(L5_82)
  L4_81 = Fn_userCtrlOn
  L4_81()
  L4_81 = setIdlingEnemy
  L5_82 = false
  L4_81(L5_82)
  L4_81 = waitSeconds
  L5_82 = 2.5
  L4_81(L5_82)
  L4_81 = Fn_captionView
  L5_82 = "ep08_03001"
  L4_81(L5_82)
  L4_81 = Player
  L5_82 = L4_81
  L4_81 = L4_81.setEnergyInfinite
  L6_83 = Player
  L6_83 = L6_83.kEnergy_Life
  L7_84 = false
  L4_81(L5_82, L6_83, L7_84)
  L4_81 = _enmgen2
  L5_82 = L4_81
  L4_81 = L4_81.requestSpawn
  L4_81(L5_82)
  L0_77 = true
  L4_81 = false
  L5_82 = setupLandingShip
  L6_83 = "landingship01"
  L7_84 = true
  L5_82(L6_83, L7_84)
  L5_82 = enmgen2_01_a
  L6_83 = L5_82
  L5_82 = L5_82.getEnemyMax
  L5_82 = L5_82(L6_83)
  L6_83 = enmgen2_01_b
  L7_84 = L6_83
  L6_83 = L6_83.getEnemyMax
  L6_83 = L6_83(L7_84)
  L5_82 = L5_82 + L6_83
  L6_83 = enmgen2_02
  L7_84 = L6_83
  L6_83 = L6_83.getEnemyMax
  L6_83 = L6_83(L7_84)
  L5_82 = L5_82 + L6_83
  L6_83 = enmgen2_03
  L7_84 = L6_83
  L6_83 = L6_83.getEnemyMax
  L6_83 = L6_83(L7_84)
  L5_82 = L5_82 + L6_83
  L5_82 = L5_82 - 1
  L6_83 = 0
  while true do
    L7_84 = waitSeconds
    L8_85 = 1
    L7_84(L8_85)
    L6_83 = L6_83 + 1
    L7_84 = _enmgen_a
    L8_85 = L7_84
    L7_84 = L7_84.getSpecTable
    L7_84 = L7_84(L8_85)
    L7_84 = L7_84.enemyDeadNum
    L8_85 = _enmgen_b
    L9_86 = L8_85
    L8_85 = L8_85.getSpecTable
    L8_85 = L8_85(L9_86)
    L8_85 = L8_85.enemyDeadNum
    L7_84 = L7_84 + L8_85
    L8_85 = _enmgen2
    L9_86 = L8_85
    L8_85 = L8_85.getSpecTable
    L8_85 = L8_85(L9_86)
    L8_85 = L8_85.enemyDeadNum
    L7_84 = L7_84 + L8_85
    L8_85 = _enmgen3
    L9_86 = L8_85
    L8_85 = L8_85.getSpecTable
    L8_85 = L8_85(L9_86)
    L8_85 = L8_85.enemyDeadNum
    L7_84 = L7_84 + L8_85
    if L6_83 == 5 then
      L8_85 = Fn_captionView
      L9_86 = "ep08_03006"
      L8_85(L9_86)
    end
    if L6_83 == 10 then
      L8_85 = Fn_captionView
      L9_86 = "ep08_03007"
      L8_85(L9_86)
    end
    if L6_83 == 15 then
      L8_85 = Fn_captionView
      L9_86 = "ep08_03008"
      L8_85(L9_86)
    end
    if L6_83 == 38 then
      L8_85 = Fn_captionView
      L9_86 = "ep08_03002"
      L8_85(L9_86)
    end
    if L6_83 > 140 or L5_82 <= L7_84 then
      L8_85 = print
      L9_86 = "\231\181\140\233\129\142\230\153\130\233\150\147:"
      L9_86 = L9_86 .. L6_83 .. "\231\167\146"
      L8_85(L9_86)
      L8_85 = print
      L9_86 = "\231\153\186\231\148\159\227\129\151\227\129\159\230\149\181\227\129\174\230\149\176:"
      L9_86 = L9_86 .. L5_82
      L8_85(L9_86)
      L8_85 = print
      L9_86 = "\229\128\146\227\129\151\227\129\159\230\149\181\227\129\174\230\149\176:"
      L9_86 = L9_86 .. L7_84
      L8_85(L9_86)
      L8_85 = print
      L9_86 = "140\231\167\146\231\181\140\233\129\142\227\129\151\227\129\159\227\129\139\227\128\129\230\149\181\227\130\146\229\133\168\227\129\166\229\128\146\227\129\151\227\129\159\227\129\159\227\130\129\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\231\181\130\228\186\134"
      L8_85(L9_86)
      break
    elseif L1_78 == false and L6_83 > 40 then
      L8_85 = _enmgen3
      L9_86 = L8_85
      L8_85 = L8_85.requestSpawn
      L8_85(L9_86)
      L1_78 = true
      L8_85 = setupLandingShip
      L9_86 = "landingship02"
      L8_85(L9_86)
    elseif L2_79 == false and L6_83 > 55 then
      L8_85 = {
        L9_86,
        {
          "locator2_mechsky02_move_pos_01",
          "locator2_mechsky02_move_pos_02",
          "locator2_mechsky02_move_pos_03",
          "locator2_mechsky02_move_pos_04",
          "locator2_mechsky02_move_pos_05"
        }
      }
      L9_86 = {
        "locator2_mechsky01_move_pos_01",
        "locator2_mechsky01_move_pos_02",
        "locator2_mechsky01_move_pos_03",
        "locator2_mechsky01_move_pos_04",
        "locator2_mechsky01_move_pos_05"
      }
      L9_86 = {}
      L9_86.invincible = false
      _enmgen4:requestSpawn()
      L2_79 = true
      mechMoveScript("mechsky01", L8_85[1], L9_86)
      mechMoveScript("mechsky02", L8_85[2], L9_86)
    end
    if L6_83 > 45 and L4_81 == false then
      L8_85 = Player
      L9_86 = L8_85
      L8_85 = L8_85.setEnergyInfinite
      L8_85(L9_86, Player.kEnergy_Life, true)
      L8_85 = Fn_userCtrlAllOff
      L8_85()
      L8_85 = setIdlingEnemy
      L9_86 = true
      L8_85(L9_86)
      L4_81 = true
      L8_85 = pdemo_ep08_a_c01
      L8_85()
      L8_85 = Fn_userCtrlOn
      L8_85()
      L8_85 = setIdlingEnemy
      L9_86 = false
      L8_85(L9_86)
      L8_85 = Fn_fadein
      L9_86 = 2
      L8_85(L9_86)
      L8_85 = waitSeconds
      L9_86 = 3
      L8_85(L9_86)
      L8_85 = Player
      L9_86 = L8_85
      L8_85 = L8_85.setEnergyInfinite
      L8_85(L9_86, Player.kEnergy_Life, false)
    end
    L8_85 = wait
    L8_85()
  end
  L7_84 = Fn_captionView
  L8_85 = "ep08_03003"
  L7_84(L8_85)
  L7_84 = waitSeconds
  L8_85 = 1.7
  L7_84(L8_85)
  L7_84 = Player
  L8_85 = L7_84
  L7_84 = L7_84.setEnergyInfinite
  L9_86 = Player
  L9_86 = L9_86.kEnergy_Life
  L7_84(L8_85, L9_86, true)
  L7_84 = Fn_coercionGravityRevert
  L7_84()
  L7_84 = Fn_userCtrlAllOff
  L7_84()
  L7_84 = Fn_coercionPoseNomal
  L7_84()
  L7_84 = setIdlingEnemy
  L8_85 = true
  L7_84(L8_85)
  L7_84 = _brain_crow
  L8_85 = L7_84
  L7_84 = L7_84.setIdling
  L9_86 = true
  L7_84(L8_85, L9_86)
  L7_84 = Sound
  L8_85 = L7_84
  L7_84 = L7_84.playSE
  L9_86 = "m23_015"
  L7_84(L8_85, L9_86, 1)
  L7_84 = Player
  L8_85 = L7_84
  L7_84 = L7_84.setEnergyInfinite
  L9_86 = Player
  L9_86 = L9_86.kEnergy_Life
  L7_84(L8_85, L9_86, false)
  while true do
    L7_84 = Player
    L8_85 = L7_84
    L7_84 = L7_84.isGravityControlMode
    L7_84 = L7_84(L8_85)
    if not L7_84 then
      L7_84 = Player
      L8_85 = L7_84
      L7_84 = L7_84.getAction
      L7_84 = L7_84(L8_85)
      L8_85 = Player
      L8_85 = L8_85.kAction_Idle
    end
    if L7_84 ~= L8_85 then
      L7_84 = wait
      L7_84()
    end
  end
  L7_84 = waitSeconds
  L8_85 = 1.5
  L7_84(L8_85)
  L7_84 = Fn_setKeepPlayerPos
  L7_84()
  L7_84 = GameDatabase
  L8_85 = L7_84
  L7_84 = L7_84.set
  L9_86 = ggd
  L9_86 = L9_86.Savedata__Player__Costume
  L7_84(L8_85, L9_86, "kit01")
  L7_84 = GameDatabase
  L8_85 = L7_84
  L7_84 = L7_84.backup
  L9_86 = ggd
  L9_86 = L9_86.Savedata__Player__Costume
  L7_84(L8_85, L9_86)
  L7_84 = GameDatabase
  L8_85 = L7_84
  L7_84 = L7_84.set
  L9_86 = ggd
  L9_86 = L9_86.Savedata__FreeTimeFlags__Costume
  L7_84(L8_85, L9_86, "kit01")
  L7_84 = GameDatabase
  L8_85 = L7_84
  L7_84 = L7_84.backup
  L9_86 = ggd
  L9_86 = L9_86.Savedata__FreeTimeFlags__Costume
  L7_84(L8_85, L9_86)
  L7_84 = Fn_setNextMissionFlag
  L7_84()
  L7_84 = Fn_nextMission
  L7_84()
  L7_84 = Fn_exitSandbox
  L7_84()
end
function Finalize()
  if handle then
    Sound:stopSEHandle(handle)
    handle = nil
  end
  Fn_disableCostumeChange(false)
end
function pccubesensormulti2_ar_safearea_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionView("ep08_03005")
  end)
end
function pdemo_ep08_a_c01()
  local L0_87, L1_88
  L0_87 = _enmgen_a
  L1_88 = L0_87
  L0_87 = L0_87.setEnemyMarker
  L0_87(L1_88, false)
  L0_87 = _enmgen_b
  L1_88 = L0_87
  L0_87 = L0_87.setEnemyMarker
  L0_87(L1_88, false)
  L0_87 = _enmgen2
  L1_88 = L0_87
  L0_87 = L0_87.setEnemyMarker
  L0_87(L1_88, false)
  L0_87 = _enmgen3
  L1_88 = L0_87
  L0_87 = L0_87.setEnemyMarker
  L0_87(L1_88, false)
  L0_87 = _pdemo
  L1_88 = L0_87
  L0_87 = L0_87.play
  L0_87(L1_88)
  L0_87 = setEnemyVisible
  L1_88 = false
  L0_87(L1_88)
  L0_87 = Fn_setKittenAndCatActive
  L1_88 = false
  L0_87(L1_88)
  L0_87 = findGameObject2
  L1_88 = "Node"
  L0_87 = L0_87(L1_88, "locator2_crow_start_pos")
  L1_88 = Fn_getDistanceToPlayer
  L1_88 = L1_88(L0_87)
  if L1_88 < 5 then
    L1_88 = Fn_resetPcPos
    L1_88("locator2_pc_warp_pos")
    L1_88 = print
    L1_88("===== \227\130\175\227\131\173\227\130\166\227\129\174\231\157\128\229\156\176\231\130\185\232\191\145\227\129\143\227\129\171\231\171\139\227\129\163\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\231\167\187\229\139\149 =====")
  end
  L1_88 = findGameObject2
  L1_88 = L1_88("Node", "locator2_sdemo_near_pos")
  if Fn_getDistanceToPlayer(L1_88) < 6 then
    Fn_resetPcPos("locator2_pc_warp_pos_02")
    print("===== \227\131\135\227\131\162\227\129\171\230\152\160\227\130\138\232\190\188\227\130\128\228\189\141\231\189\174\227\129\171\231\171\139\227\129\163\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\231\167\187\229\139\149 =====")
  end
  _crow_pup = Fn_spawnSuppotCrow()
  _crow_pup:setVisible(false)
  _brain_crow = _crow_pup:getBrain()
  _brain_crow:setIdling(true)
  while not _pdemo:isEnd() do
    wait()
  end
  _pdemo:stop(0.01)
  Fn_captionView("ep08_03004", 4)
  Fn_setKittenAndCatActive(true)
  _enmgen_a:setEnemyMarker(true)
  _enmgen_b:setEnemyMarker(true)
  _enmgen2:setEnemyMarker(true)
  _enmgen3:setEnemyMarker(true)
  setEnemyVisible(true)
  _crow_pup:setVisible(true)
  _brain_crow:setIdling(false)
  _pdemo:try_term()
  _pdemo = nil
end
function setEnemyVisible(A0_89)
  local L1_90, L2_91, L3_92, L4_93, L5_94
  L1_90, L2_91 = nil, nil
  L3_92 = {
    L4_93,
    L5_94,
    _enmgen2,
    _enmgen3
  }
  for _FORV_7_ = 1, #L3_92 do
    L2_91 = L3_92[_FORV_7_]:getSpecTable()
    for _FORV_11_, _FORV_12_ in ipairs(L2_91.spawnSet) do
      L1_90 = findGameObject2("Puppet", _FORV_12_.name)
      if L1_90 ~= nil then
        L1_90:setVisible(A0_89)
      end
    end
  end
  for _FORV_9_, _FORV_10_ in pairs(L5_94) do
    if _FORV_10_:getParent() ~= nil and _FORV_10_:getParent():getTypeName() == "Puppet" then
      L4_93:setVisible(A0_89)
    end
  end
end
function setupLandingShip(A0_95, A1_96)
  local L2_97, L3_98, L4_99, L5_100
  L2_97 = "drop_prepare"
  L3_98 = findGameObject2
  L4_99 = "Puppet"
  L5_100 = A0_95
  L3_98 = L3_98(L4_99, L5_100)
  L5_100 = L3_98
  L4_99 = L3_98.getBrain
  L4_99 = L4_99(L5_100)
  function L5_100(A0_101)
    local L1_102, L2_103, L3_104, L4_105, L5_106
    L1_102 = A0_101.state
    if L1_102 == "wait" then
      L1_102 = L2_97
      if L1_102 == "drop_prepare" then
        A0_101.changeState = "move"
        L1_102 = {}
        A0_101.movePoint = L1_102
        L1_102 = "locator2_"
        L1_102 = L1_102 .. L2_103 .. L3_104
        for L5_106 = 1, 5 do
          table.insert(A0_101.movePoint, string.format(L1_102, L5_106))
        end
      else
        L1_102 = L2_97
        if L1_102 == "drop_human" then
          A0_101.changeState = "move"
          L1_102 = {}
          A0_101.movePoint = L1_102
          L1_102 = "locator2_"
          L1_102 = L1_102 .. L2_103 .. L3_104
          for L5_106 = 6, 7 do
            table.insert(A0_101.movePoint, string.format(L1_102, L5_106))
          end
        else
          L1_102 = L2_97
          if L1_102 == "land_back" then
            A0_101.changeState = "move"
            L1_102 = {}
            A0_101.movePoint = L1_102
            L1_102 = "locator2_"
            L1_102 = L1_102 .. L2_103 .. L3_104
            for L5_106 = 8, 14 do
              table.insert(A0_101.movePoint, string.format(L1_102, L5_106))
            end
          end
        end
      end
    end
    L1_102 = A0_101.state
    if L1_102 == "moveEnd" then
      L1_102 = L2_97
      if L1_102 == "drop_prepare" then
        L1_102 = A1_96
        if L1_102 ~= nil then
          A0_101.changeState = "drop"
          L1_102 = {}
          A0_101.dropEnemy = L1_102
          L1_102 = "area_01_hander%02d"
          for L5_106 = 1, 2 do
            table.insert(A0_101.dropEnemy, string.format(L1_102, L5_106))
          end
        else
          L1_102 = "drop_human"
          L2_97 = L1_102
        end
      else
        L1_102 = L2_97
        if L1_102 == "drop_human" then
          A0_101.changeState = "open"
        else
          L1_102 = L2_97
          if L1_102 == "land_back" then
            L1_102 = print
            L1_102(L2_103)
            A0_101.changeState = "kill"
            L1_102 = "kill"
            L2_97 = L1_102
          end
        end
      end
    end
    L1_102 = A0_101.state
    if L1_102 == "dropEnd" then
      L1_102 = "drop_human"
      L2_97 = L1_102
      L1_102 = A1_96
      if L1_102 ~= nil then
        L1_102 = "area_01_hander%02d"
        L5_106 = "locator2_area_01_hander01_move_pos_02"
        L5_106 = "locator2_area_01_hander02_move_pos_01"
        L3_104.invincible = false
        L5_106 = "area_01_hander01"
        L4_105(L5_106, L2_103[1], L3_104)
        L5_106 = "area_01_hander02"
        L4_105(L5_106, L2_103[2], L3_104)
      end
    end
    L1_102 = A0_101.state
    if L1_102 == "openEnd" then
      L1_102 = "land_back"
      L2_97 = L1_102
    end
    return A0_101
  end
  L4_99:setEventListener("enemy_landingship_event", L5_100)
end
function mechMoveScript(A0_107, A1_108, A2_109)
  invokeTask(function()
    print(A0_107 .. "\227\129\174\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\231\167\187\229\139\149\231\153\186\232\161\140")
    repeat
      wait()
    until findGameObject2("EnemyBrain", A0_107):isReadyEnemy()
    print(A0_107 .. "\227\129\140\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\231\167\187\229\139\149\228\184\173")
    findGameObject2("EnemyBrain", A0_107):move(A1_108, A2_109)
    _enmgen2:setEventListener("DamageEnemyReport", Fn_damageEnemyReport)
    if A0_107 == "area_01_hander01" then
      _brain_hander01 = findGameObject2("EnemyBrain", A0_107)
    elseif A0_107 == "area_01_hander02" then
      _brain_hander02 = findGameObject2("EnemyBrain", A0_107)
    end
    while not findGameObject2("EnemyBrain", A0_107):isMoveEnd() do
      wait()
    end
    print(A0_107 .. "\227\129\174\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\232\161\140\229\139\149\231\181\130\228\186\134")
    findGameObject2("EnemyBrain", A0_107):endScriptAction()
  end)
end
function Fn_damageEnemyReport(A0_110)
  local L1_111
  L1_111 = A0_110.name
  if L1_111 == "area_01_hander01" and _brain_hander01:isMoveEnd() == false then
    _brain_hander01:endScriptAction()
  end
  if L1_111 == "area_01_hander02" and _brain_hander02:isMoveEnd() == false then
    _brain_hander02:endScriptAction()
  end
end
function setIdlingEnemy(A0_112)
  _enmgen_a:requestIdlingEnemy(A0_112)
  _enmgen_b:requestIdlingEnemy(A0_112)
  _enmgen2:requestIdlingEnemy(A0_112)
  _enmgen3:requestIdlingEnemy(A0_112)
  _enmgen4:requestIdlingEnemy(A0_112)
end
