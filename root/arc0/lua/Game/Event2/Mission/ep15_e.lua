dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/pdemo.lua")
CRUSH_EF_MAX = 32
KALI_TALK_INTERVAL = 15
KALI_CAP_DAMAGE01 = 0.6
KALI_CAP_DAMAGE02 = 0.3
_puppet_tbl = {}
_kali_cap_flag = false
_kali_enmgen = nil
_wave01_navi = false
_wave01_stin01 = nil
_wave02_stingray = {}
_wave02_terrorist01 = {}
_wave02_terrorist02 = {}
_wave02_phase = 0
_wave02_sting_sensor = nil
_polydemo = nil
_sdemo_1st = nil
_sdemo = nil
enmgen2_battle01_stingray01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "stingrayG1_01",
      type = "stingray",
      locator = "locator2_1st_sting_01"
    },
    {
      name = "stingrayG1_02",
      type = "stingray",
      locator = "locator2_1st_sting_02"
    },
    {
      name = "stingrayG1_03",
      type = "stingray",
      locator = "locator2_1st_sting_03"
    },
    {
      name = "stingrayG1_04",
      type = "stingray",
      locator = "locator2_1st_sting_04"
    },
    {
      name = "stingrayG1_05",
      type = "stingray",
      locator = "locator2_1st_sting_05"
    },
    {
      name = "pilotG1_01",
      type = "terrorist_rifle",
      locator = "locator2_1st_pilot_01",
      target_vehicle = "stingrayG1_01"
    },
    {
      name = "pilotG1_02",
      type = "terrorist_rifle",
      locator = "locator2_1st_pilot_02",
      target_vehicle = "stingrayG1_02"
    },
    {
      name = "pilotG1_03",
      type = "terrorist_rifle",
      locator = "locator2_1st_pilot_03",
      target_vehicle = "stingrayG1_03"
    },
    {
      name = "pilotG1_04",
      type = "terrorist_rifle",
      locator = "locator2_1st_pilot_04",
      target_vehicle = "stingrayG1_04"
    },
    {
      name = "pilotG1_05",
      type = "terrorist_rifle",
      locator = "locator2_1st_pilot_05",
      target_vehicle = "stingrayG1_05"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyNum = A0_0:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_2, A1_3)
    A0_2:getSpecTable().enemyNum = A0_2:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_4)
    if A0_4.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_terrorist0101 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "terrorist0101_01",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0101_01",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    },
    {
      name = "terrorist0101_02",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0101_02",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_5, A1_6)
    A0_5:getSpecTable().enemyNum = A0_5:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_7, A1_8)
    A0_7:getSpecTable().enemyNum = A0_7:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_9)
    if A0_9.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_terrorist0102 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "terrorist0102_01",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0102_01",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    },
    {
      name = "terrorist0102_02",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0102_02",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyNum = A0_10:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_12, A1_13)
    A0_12:getSpecTable().enemyNum = A0_12:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_14)
    if A0_14.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_terrorist0103 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "terrorist0103_01",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0103_01",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    },
    {
      name = "terrorist0103_02",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0103_02",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_15, A1_16)
    A0_15:getSpecTable().enemyNum = A0_15:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyNum = A0_17:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_19)
    if A0_19.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_terrorist0201 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "terrorist0201_01",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0201_01",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    },
    {
      name = "terrorist0201_02",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0201_02",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_20, A1_21)
    A0_20:getSpecTable().enemyNum = A0_20:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_22, A1_23)
    A0_22:getSpecTable().enemyNum = A0_22:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_24)
    if A0_24.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_terrorist0202 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "terrorist0202_01",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0202_01",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    },
    {
      name = "terrorist0202_02",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0202_02",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_25, A1_26)
    A0_25:getSpecTable().enemyNum = A0_25:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyNum = A0_27:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_29)
    if A0_29.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_terrorist0203 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "terrorist0203_01",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0203_01",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    },
    {
      name = "terrorist0203_02",
      type = "terrorist_rifle",
      locator = "locator2_terrorist0203_02",
      ai_spawn_option = "Terrorist/terrorist_ep15_e"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_30, A1_31)
    A0_30:getSpecTable().enemyNum = A0_30:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_32, A1_33)
    A0_32:getSpecTable().enemyNum = A0_32:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_34)
    if A0_34.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_stingray01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "wave02_stingray01",
      type = "stingray",
      locator = "locator2_stingray_01",
      ai_spawn_option = "Stingray/stingray_ep15_e"
    },
    {
      name = "stin_pilot01",
      type = "terrorist_rifle",
      locator = "locator2_pilot_01",
      target_vehicle = "wave02_stingray01"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_35, A1_36)
    A0_35:getSpecTable().enemyNum = A0_35:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_37, A1_38)
    A0_37:getSpecTable().enemyNum = A0_37:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_39)
    if A0_39.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_stingray02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "wave02_stingray02",
      type = "stingray",
      locator = "locator2_stingray_02",
      ai_spawn_option = "Stingray/stingray_ep15_e"
    },
    {
      name = "stin_pilot02",
      type = "terrorist_rifle",
      locator = "locator2_pilot_02",
      target_vehicle = "wave02_stingray02"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyNum = A0_40:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_42, A1_43)
    A0_42:getSpecTable().enemyNum = A0_42:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_44)
    if A0_44.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_stingray03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "wave02_stingray03",
      type = "stingray",
      locator = "locator2_stingray_03",
      ai_spawn_option = "Stingray/stingray_ep15_e"
    },
    {
      name = "stin_pilot03",
      type = "terrorist_rifle",
      locator = "locator2_pilot_03",
      target_vehicle = "wave02_stingray03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_45, A1_46)
    A0_45:getSpecTable().enemyNum = A0_45:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_47, A1_48)
    A0_47:getSpecTable().enemyNum = A0_47:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_49)
    if A0_49.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_battle02_stingray04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "wave02_stingray04",
      type = "stingray",
      locator = "locator2_stingray_04",
      ai_spawn_option = "Stingray/stingray_ep15_e"
    },
    {
      name = "stin_pilot04",
      type = "terrorist_rifle",
      locator = "locator2_pilot_04",
      target_vehicle = "wave02_stingray04"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_50, A1_51)
    A0_50:getSpecTable().enemyNum = A0_50:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyNum = A0_52:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_54)
    if A0_54.enemyNum == 0 then
      return true
    end
    return false
  end
}
enmgen2_kali_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_kali_bt_01",
      name = "kali_01",
      ai_spawn_option = "Kali/kali_ep15_e"
    }
  }
}
function Initialize()
  local L0_55, L1_56, L2_57, L3_58, L4_59
  L0_55 = 1
  while true do
    L1_56 = "vgem_e_"
    L2_57 = string
    L2_57 = L2_57.format
    L3_58 = "%02d"
    L4_59 = L0_55
    L2_57 = L2_57(L3_58, L4_59)
    L1_56 = L1_56 .. L2_57
    L2_57 = RAC_createGemAsync
    L3_58 = L1_56
    L4_59 = GEM_VITAL
    L2_57 = L2_57(L3_58, L4_59, "locator2_" .. L1_56)
    if L2_57 ~= nil then
      L0_55 = L0_55 + 1
    end
  end
  L1_56 = findGameObject2
  L2_57 = "EnemyGenerator"
  L3_58 = "enmgen2_kali_01"
  L1_56 = L1_56(L2_57, L3_58)
  _kali_enmgen = L1_56
  L1_56 = _kali_enmgen
  L2_57 = L1_56
  L1_56 = L1_56.setEnemyMarker
  L3_58 = false
  L1_56(L2_57, L3_58)
  L1_56 = findGameObject2
  L2_57 = "EnemyGenerator"
  L3_58 = "enmgen2_battle01_stingray01"
  L1_56 = L1_56(L2_57, L3_58)
  _wave01_stin01 = L1_56
  L1_56 = _wave01_stin01
  L2_57 = L1_56
  L1_56 = L1_56.setEnemyMarker
  L3_58 = false
  L1_56(L2_57, L3_58)
  L1_56 = 1
  while true do
    L2_57 = findGameObject2
    L3_58 = "EnemyGenerator"
    L4_59 = "enmgen2_battle02_stingray"
    L4_59 = L4_59 .. string.format("%02d", L1_56)
    L2_57 = L2_57(L3_58, L4_59)
    if L2_57 ~= nil then
      L4_59 = L2_57
      L3_58 = L2_57.setEnemyMarker
      L3_58(L4_59, false)
      L3_58 = table
      L3_58 = L3_58.insert
      L4_59 = _wave02_stingray
      L3_58(L4_59, L2_57)
      L1_56 = L1_56 + 1
    end
  end
  L2_57 = 1
  while true do
    L3_58 = findGameObject2
    L4_59 = "EnemyGenerator"
    L3_58 = L3_58(L4_59, "enmgen2_battle02_terrorist01" .. string.format("%02d", L2_57))
    if L3_58 ~= nil then
      L4_59 = L3_58.setEnemyMarker
      L4_59(L3_58, false)
      L4_59 = table
      L4_59 = L4_59.insert
      L4_59(_wave02_terrorist01, L3_58)
      L2_57 = L2_57 + 1
    end
  end
  L3_58 = 1
  while true do
    L4_59 = findGameObject2
    L4_59 = L4_59("EnemyGenerator", "enmgen2_battle02_terrorist02" .. string.format("%02d", L3_58))
    if L4_59 ~= nil then
      L4_59:setEnemyMarker(false)
      table.insert(_wave02_terrorist02, L4_59)
      L3_58 = L3_58 + 1
    end
  end
  L4_59 = PDemo
  L4_59 = L4_59.create
  L4_59 = L4_59("ep15_b_c01", Fn_findAreaHandle("dt_a_root"), {camera = true, scene_param = false})
  _polydemo = L4_59
  L4_59 = SDemo
  L4_59 = L4_59.create
  L4_59 = L4_59("ep15_e_sdemo_1st")
  _sdemo_1st = L4_59
  L4_59 = SDemo
  L4_59 = L4_59.create
  L4_59 = L4_59("ep15_e_sdemo")
  _sdemo = L4_59
end
function Ingame()
  local L0_60, L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71, L12_72, L13_73, L14_74, L15_75, L16_76, L17_77, L18_78, L19_79, L20_80, L21_81
  L0_60 = _wave01_stin01
  L1_61 = L0_60
  L0_60 = L0_60.requestIdlingEnemy
  L0_60(L1_61, L2_62)
  L0_60 = Fn_disappearNpc
  L1_61 = "ep15_pol_01"
  L0_60(L1_61, L2_62)
  L0_60 = Fn_setBgmPoint
  L1_61 = "battle"
  L0_60(L1_61)
  L0_60 = Fn_missionStart
  L0_60()
  L0_60 = playerCoerctionStop
  L1_61 = true
  L0_60(L1_61)
  L0_60 = Sound
  L1_61 = L0_60
  L0_60 = L0_60.pulse
  L0_60(L1_61, L2_62)
  L0_60 = waitSeconds
  L1_61 = 1
  L0_60(L1_61)
  L0_60 = Fn_kaiwaDemoView2
  L1_61 = "ep15_00220k"
  L0_60(L1_61, L2_62, L3_63)
  L0_60 = RAC_startCatWarpControl
  L1_61 = "ep15_area_out"
  L6_66 = "locator2_battle_area_pos"
  L0_60(L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68)
  L0_60 = Player
  L1_61 = L0_60
  L0_60 = L0_60.setStay
  L0_60(L1_61, L2_62)
  L0_60 = Fn_userCtrlOn
  L0_60()
  _wave01_navi = true
  L0_60 = RAC_missionNaviCaption
  L1_61 = "ep15_04000"
  L0_60(L1_61, L2_62)
  L0_60 = waitSeconds
  L1_61 = RAC_NAVI_DELAY_DEFAULT
  L0_60(L1_61)
  L0_60 = invokeBilEffect
  L0_60 = L0_60()
  L1_61 = invokeTask
  L1_61 = L1_61(L2_62)
  L2_62(L3_63, L4_64, L5_65)
  L2_62(L3_63, L4_64)
  L2_62()
  L2_62()
  if L1_61 ~= nil then
    L2_62(L3_63)
    L1_61 = nil
  end
  if L0_60 ~= nil then
    L2_62(L3_63)
    L0_60 = nil
  end
  L2_62(L3_63, L4_64)
  L2_62()
  L2_62()
  for L5_65, L6_66 in L2_62(L3_63) do
    L7_67(L8_68)
    L7_67(L8_68, L9_69)
  end
  while true do
    for L6_66, L7_67 in L3_63(L4_64) do
      if L8_68 == false then
        break
      end
    end
    if not L2_62 then
      L3_63()
    end
  end
  L6_66 = 53.938423
  L6_66 = L2_62
  L4_64(L5_65, L6_66, L7_67)
  L6_66 = nil
  L8_68.deg = 12
  L4_64(L5_65, L6_66, L7_67, L8_68)
  L4_64(L5_65)
  L6_66 = L3_63
  L4_64(L5_65, L6_66, L7_67)
  L6_66 = 181.693863
  L6_66 = -428.252899
  L6_66 = _sdemo
  L6_66 = L6_66.set
  L6_66(L7_67, L8_68, L9_69)
  L6_66 = _sdemo
  L6_66 = L6_66.setCameraParam
  L10_70.deg = 38.8
  L6_66(L7_67, L8_68, L9_69, L10_70)
  L6_66 = findGameObject2
  L6_66 = L6_66(L7_67, L8_68)
  L7_67(L8_68, L9_69)
  L7_67(L8_68, L9_69)
  L7_67(L8_68)
  L7_67(L8_68, L9_69)
  L7_67(L8_68)
  L7_67()
  L7_67(L8_68, L9_69, L10_70)
  L7_67(L8_68)
  for L10_70, L11_71 in L7_67(L8_68) do
    for L15_75, L16_76 in L12_72(L13_73) do
      L17_77 = findGameObject2
      L18_78 = "Puppet"
      L19_79 = L16_76.name
      L17_77 = L17_77(L18_78, L19_79)
      L19_79 = L17_77
      L18_78 = L17_77.getBrain
      L18_78 = L18_78(L19_79)
      L19_79 = 1
      L20_80 = {}
      while true do
        L21_81 = string
        L21_81 = L21_81.format
        L21_81 = L21_81("locator2_terrorist01%02d_%02d_move_%02d", L10_70, L15_75, L19_79)
        if findGameObject2("Node", L21_81) ~= nil then
          table.insert(L20_80, L21_81)
          L19_79 = L19_79 + 1
        end
      end
      L21_81 = L18_78.move
      L21_81(L18_78, L20_80, {loop = false, move_mode = "run"})
    end
  end
  L7_67()
  L7_67(L8_68)
  L7_67(L8_68)
  while true do
    for L11_71, L12_72 in L8_68(L9_69) do
      for L16_76, L17_77 in L13_73(L14_74) do
        L18_78 = findGameObject2
        L19_79 = "Puppet"
        L20_80 = L17_77.name
        L18_78 = L18_78(L19_79, L20_80)
        L20_80 = L18_78
        L19_79 = L18_78.getBrain
        L19_79 = L19_79(L20_80)
        L20_80 = L19_79
        L19_79 = L19_79.isMoveEnd
        L19_79 = L19_79(L20_80)
        if not L19_79 then
          break
        end
      end
      if L7_67 then
      end
    end
    if not L7_67 then
      L8_68()
    end
  end
  L7_67(L8_68)
  while true do
    if L7_67 == false then
      L7_67()
    end
  end
  L7_67(L8_68, L9_69)
  L7_67(L8_68)
  L7_67(L8_68, L9_69)
  L7_67(L8_68)
  while true do
    if L7_67 == false then
      L7_67()
    end
  end
  L7_67(L8_68, L9_69)
  L7_67(L8_68, L9_69)
  L7_67(L8_68, L9_69)
  L7_67(L8_68)
  L7_67(L8_68, L9_69)
  while true do
    if L7_67 == false then
      L7_67()
    end
  end
  L7_67(L8_68)
  for L10_70, L11_71 in L7_67(L8_68) do
    L12_72(L13_73)
    L12_72(L13_73, L14_74)
  end
  while true do
    for L11_71, L12_72 in L8_68(L9_69) do
      if L13_73 == false then
        break
      end
    end
    if not L7_67 then
      L8_68()
    end
  end
  for L10_70, L11_71 in L7_67(L8_68) do
    L16_76 = L10_70
    L21_81 = L14_74(L15_75, L16_76)
    L16_76 = "wave02_stingray"
    L17_77 = string
    L17_77 = L17_77.format
    L18_78 = "%02d"
    L19_79 = L10_70
    L17_77 = L17_77(L18_78, L19_79)
    L16_76 = L16_76 .. L17_77
    L16_76 = L14_74
    L17_77 = L15_75
    L16_76 = L15_75.reset
    L18_78 = L12_72
    L19_79 = L13_73
    L16_76(L17_77, L18_78, L19_79)
    L16_76 = 1
    L17_77 = {}
    while true do
      L18_78 = string
      L18_78 = L18_78.format
      L19_79 = "locator2_stingray_%02d_move%02d"
      L20_80 = L10_70
      L21_81 = L16_76
      L18_78 = L18_78(L19_79, L20_80, L21_81)
      L19_79 = findGameObject2
      L20_80 = "Node"
      L21_81 = L18_78
      L19_79 = L19_79(L20_80, L21_81)
      if L19_79 ~= nil then
        L20_80 = table
        L20_80 = L20_80.insert
        L21_81 = L17_77
        L20_80(L21_81, L18_78)
        L16_76 = L16_76 + 1
      end
    end
    L19_79 = L15_75
    L18_78 = L15_75.move
    L20_80 = L17_77
    L21_81 = {}
    L21_81.speed = 10
    L21_81.loop = false
    L21_81.curve = true
    L18_78(L19_79, L20_80, L21_81)
  end
  L7_67(L8_68)
  L7_67()
  L7_67(L8_68)
  L7_67(L8_68, L9_69)
  for L10_70, L11_71 in L7_67(L8_68) do
    for L15_75, L16_76 in L12_72(L13_73) do
      L17_77 = findGameObject2
      L18_78 = "Puppet"
      L19_79 = L16_76.name
      L17_77 = L17_77(L18_78, L19_79)
      L18_78 = L17_77
      L17_77 = L17_77.getBrain
      L17_77 = L17_77(L18_78)
      L18_78 = L17_77
      L17_77 = L17_77.endScriptAction
      L17_77(L18_78)
    end
    L12_72(L13_73, L14_74)
    L12_72(L13_73, L14_74)
  end
  L7_67(L8_68, L9_69)
  L7_67()
  _kali_cap_flag = true
  L7_67(L8_68)
  _kali_cap_flag = false
  _wave02_phase = 0
  damage_callback = L11_71
  for L14_74, L15_75 in L11_71(L12_72) do
    L17_77 = L15_75
    L16_76 = L15_75.setEventListener
    L18_78 = "DamageEnemyReport"
    L19_79 = damage_callback
    L16_76(L17_77, L18_78, L19_79)
  end
  for L14_74, L15_75 in L11_71(L12_72) do
    L17_77 = L15_75
    L16_76 = L15_75.setEventListener
    L18_78 = "DamageEnemyReport"
    L19_79 = damage_callback
    L16_76(L17_77, L18_78, L19_79)
  end
  L11_71()
  if L9_69 ~= nil then
    L11_71(L12_72)
  end
  if L7_67 ~= nil then
    L11_71(L12_72)
  end
  if L8_68 ~= nil then
    L11_71(L12_72)
  end
  if L10_70 ~= nil then
    L11_71(L12_72)
  end
  L11_71(L12_72)
  L11_71(L12_72)
  L11_71(L12_72)
  L11_71()
  L11_71()
  L11_71()
  L11_71()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSituation(Player.kSituation_Normal, true, 0, true, false)
  end
end
function pccubesensor2_battle_area_OnEnter()
  Fn_pcSensorOff("pccubesensor2_battle_area")
  if _wave01_navi then
    Fn_captionView("ep15_04100")
    Fn_naviKill()
    _wave01_navi = false
  end
end
function cubesensor2_battle02_stingray01_OnEnter(A0_82, A1_83)
  if string.match(A1_83:getName(), "wave02_stingray") ~= nil then
    print("cubesensor2_battle02_stingray01_OnEnter.." .. A1_83:getName())
    _wave02_sting_sensor = A1_83:getName()
    for _FORV_6_, _FORV_7_ in ipairs(_wave02_stingray[RAC_getTailNumber(_wave02_sting_sensor, 2)]:getSpecTable().spawnSet) do
      findGameObject2("Puppet", _FORV_7_.name):getBrain():endScriptAction()
    end
    _wave02_stingray[RAC_getTailNumber(_wave02_sting_sensor, 2)]:requestIdlingEnemy(false)
  end
end
function invokeKaliSerif()
  return invokeTask(function()
    local L0_84, L1_85, L2_86, L3_87, L4_88, L5_89
    L0_84 = 0
    L1_85 = Player
    L2_86 = L1_85
    L1_85 = L1_85.getEnergyMax
    L3_87 = Player
    L3_87 = L3_87.kEnergy_Life
    L1_85 = L1_85(L2_86, L3_87)
    L2_86 = L1_85
    L3_87 = {L4_88, L5_89}
    L4_88 = false
    L5_89 = false
    L4_88 = 1
    L5_89 = false
    while true do
      L2_86 = Player:getEnergy(Player.kEnergy_Life)
      L0_84 = Fn_get_distance(findGameObject2("Puppet", "kali_01"):getWorldPos(), Fn_getPlayer():getWorldPos())
      if L0_84 < 30 and _kali_cap_flag == false and L5_89 == false then
        if L4_88 < 4 then
          Sound:playSE(({
            "ene_kali_vo_banter_1",
            "ene_kali_vo_banter_2",
            "ene_kali_vo_banter_3"
          })[L4_88])
          L5_89 = true
          Fn_captionViewWait(({
            "ep15_04005",
            "ep15_04006",
            "ep15_04007"
          })[L4_88])
          invokeTask(function()
            waitSeconds(KALI_TALK_INTERVAL)
            L5_89 = false
          end)
          L4_88 = L4_88 + 1
        elseif L3_87[1] == false and L2_86 / L1_85 <= KALI_CAP_DAMAGE01 then
          Sound:playSE("ene_kali_vo_laugh")
          L3_87[1] = true
          L5_89 = true
          Fn_captionViewWait("ep15_04003")
          invokeTask(function()
            waitSeconds(KALI_TALK_INTERVAL)
            L5_89 = false
          end)
        elseif L3_87[2] == false and L2_86 / L1_85 <= KALI_CAP_DAMAGE02 then
          Sound:playSE("ene_kali_vo_laugh")
          L3_87[2] = true
          L5_89 = true
          Fn_captionViewWait("ep15_04004")
          invokeTask(function()
            waitSeconds(KALI_TALK_INTERVAL)
            L5_89 = false
          end)
        end
      end
      wait()
    end
  end)
end
function invokeBilEffect()
  return invokeTask(function()
    local L0_90, L1_91, L2_92, L3_93, L4_94, L5_95
    L0_90 = {}
    for L4_94 = 1, CRUSH_EF_MAX do
      L5_95 = findGameObject2
      L5_95 = L5_95("Node", "locator2_ter_ef_" .. string.format("%02d", L4_94))
      L0_90[L4_94] = L5_95
    end
    while true do
      L4_94 = 5
      for L4_94 = 1, L2_92(L3_93, L4_94) do
        L5_95 = waitSeconds
        L5_95(0.8)
        L5_95 = RandI
        L5_95 = L5_95(1, #L0_90)
        L5_95 = L0_90[L5_95]
        RAC_createEffect({
          eff_name = "ef_com_exp_01",
          pos_node = L5_95,
          loop = false,
          time = 10
        })
        Sound:playSEHandle("ep15_missile_exp", 1, nil, L5_95)
      end
      L4_94 = 3
      L5_95 = L2_92(L3_93, L4_94)
      L1_91(L2_92, L3_93, L4_94, L5_95, L2_92(L3_93, L4_94))
      L1_91()
    end
  end)
end
function invokeRespawn()
  local L0_96
  L0_96 = {}
  L0_96.enemy_data = {}
  table.insert(L0_96.enemy_data, {task = nil})
  table.insert(L0_96.enemy_data, {task = nil})
  table.insert(L0_96.enemy_data, {task = nil})
  function L0_96.update(A0_97)
    local L1_98, L2_99, L3_100, L4_101, L5_102, L6_103, L7_104
    while true do
      for L4_101, L5_102 in L1_98(L2_99) do
        L6_103 = findGameObject2
        L7_104 = "EnemyGenerator"
        L6_103 = L6_103(L7_104, "enmgen2_battle02_terrorist01" .. string.format("%02d", L4_101))
        L7_104 = findGameObject2
        L7_104 = L7_104("EnemyGenerator", "enmgen2_battle02_terrorist02" .. string.format("%02d", L4_101))
        if L5_102.task ~= nil and not L5_102.task:isRunning() then
          L5_102.task:abort()
          L5_102.task = nil
        end
        if L5_102.task == nil and L6_103:getSpecTable():isAllDead() == true and L7_104:getSpecTable():isAllDead() == true then
          L5_102.task = invokeTask(function()
            waitSeconds(2)
            L7_104:requestSpawn()
            L7_104:requestIdlingEnemy(false)
            while L7_104:getSpecTable():isAllDead() == true do
              wait()
            end
          end)
        else
        end
      end
      L1_98()
    end
  end
  function L0_96.destractor(A0_105)
    for _FORV_4_, _FORV_5_ in ipairs(A0_105.enemy_data) do
      if _FORV_5_.task ~= nil then
        _FORV_5_.task:abort()
        _FORV_5_.task = nil
      end
    end
  end
  return RAC_InvokeTaskWithDestractor(L0_96.update, L0_96.destractor, L0_96)
end
function invokePhase()
  return invokeTask(function()
    while true do
      if _wave02_phase == 0 and _wave02_sting_sensor ~= nil then
        _kali_cap_flag = true
        Fn_captionViewEnd()
        Fn_captionViewWait("ep15_04010")
        waitSeconds(0.5)
        waitSeconds(RAC_NAVI_DELAY_DEFAULT)
        for _FORV_4_, _FORV_5_ in ipairs(_wave02_terrorist01) do
          _FORV_5_:setEnemyMarker(false)
        end
        for _FORV_4_, _FORV_5_ in ipairs(_wave02_terrorist02) do
          _FORV_5_:setEnemyMarker(false)
        end
        for _FORV_4_, _FORV_5_ in ipairs(_wave02_stingray) do
          _FORV_5_:setEnemyMarker(true)
        end
        if 0 < Fn_missionView("ep15_04011") - RAC_NAVI_DELAY_DEFAULT then
          waitSeconds(Fn_missionView("ep15_04011") - RAC_NAVI_DELAY_DEFAULT)
        end
        _kali_cap_flag = false
        _wave02_phase = 1
      elseif (_wave02_phase == 0 or _wave02_phase == 1) and isStingrayAllDead() then
        _kali_cap_flag = true
        Fn_captionViewEnd()
        Fn_captionViewWait("ep15_04012")
        waitSeconds(0.5)
        waitSeconds(RAC_NAVI_DELAY_DEFAULT)
        for _FORV_4_, _FORV_5_ in ipairs(_wave02_terrorist01) do
          _FORV_5_:setEnemyMarker(true)
        end
        for _FORV_4_, _FORV_5_ in ipairs(_wave02_terrorist02) do
          _FORV_5_:setEnemyMarker(true)
        end
        if 0 < Fn_missionView("ep15_04013") - RAC_NAVI_DELAY_DEFAULT then
          waitSeconds(Fn_missionView("ep15_04013") - RAC_NAVI_DELAY_DEFAULT)
        end
        _kali_cap_flag = false
        _wave02_phase = 2
      elseif _wave02_phase == 2 then
      elseif _wave02_phase == 3 and isEnemyAllDead() then
        _wave02_phase = 4
        _gotoNextPhase()
        break
      end
      wait()
    end
  end)
end
function isStingrayAllDead()
  for _FORV_3_, _FORV_4_ in ipairs(_wave02_stingray) do
    if _FORV_4_:getSpecTable():isAllDead() == false then
      return false
    end
  end
  return true
end
function isEnemyAllDead()
  for _FORV_3_, _FORV_4_ in ipairs(_wave02_terrorist01) do
    if _FORV_4_:getSpecTable():isAllDead() == false then
      return false
    end
  end
  for _FORV_3_, _FORV_4_ in ipairs(_wave02_terrorist02) do
    if _FORV_4_:getSpecTable():isAllDead() == false then
      return false
    end
  end
  return true
end
