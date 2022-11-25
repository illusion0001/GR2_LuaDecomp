dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
VGEM_MAX = 3
_puppet_tbl = {}
_dead_count = 0
_view_pos = nil
_se_hdl = nil
_alive_secondrush_cnt = 3
_thirdrush_start = false
function Initialize()
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_g_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_g_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_navi_kill_g_01")
  _sdemo_cut01 = SDemo.create("cut01")
  _sdemo_cut01:set(findGameObject2("Node", "locator2_cam_01"), findGameObject2("Node", "locator2_aim_01"))
  _sdemo_cut01:setCameraParam(nil, 0.1, {deg = 29.4})
  _sdemo_cut02 = SDemo.create("cut02")
  _sdemo_cut02:set(findGameObject2("Node", "locator2_cam_02"), findGameObject2("Node", "locator2_aim_02"))
  _sdemo_cut02:setCameraParam(nil, 0.1, {deg = 24.5})
  _sdemo_cut04 = SDemo.create("cut04")
  _sdemo_cut04:set(findGameObject2("Node", "locator2_cam_04"), findGameObject2("Node", "locator2_aim_04"))
  _sdemo_cut04:setCameraParam(nil, 0.1, {deg = 32.1})
  _npc_soldier_01 = "npcgen2_man57_01"
  _npc_soldier_02 = "npcgen2_man57_02"
  _npc_soldier_03 = "npcgen2_man57_03"
  Fn_setNpcActive(_npc_soldier_01, false)
  Fn_setNpcActive(_npc_soldier_02, false)
  Fn_setNpcActive(_npc_soldier_03, false)
  Fn_setNpcActive("npcgen2_man32_11", false)
  Fn_setNpcActive("npcgen2_man33_11", false)
  Fn_setNpcActive("npcgen2_man44_11", false)
  Fn_setNpcActive("npcgen2_chi12_11", false)
  Fn_setNpcActive("npcgen2_wom20_11", false)
  Fn_setNpcActive("npcgen2_wom17_11", false)
end
enmgen2_soldier_e_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_01_01",
      name = "soldier_e_01_01",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_01_02",
      name = "soldier_e_01_02",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_01_03",
      name = "soldier_e_01_03",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_01_04",
      name = "soldier_e_01_04",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_01_05",
      name = "soldier_e_01_05",
      ai_spawn_option = "Soldier/ep05_soldier"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    _dead_count = _dead_count + 1
    print("_dead_count = " .. _dead_count)
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "soldier_e_01_01",
      "soldier_e_01_02",
      "soldier_e_01_03",
      "soldier_e_01_04",
      "soldier_e_01_05"
    }, 3, 5)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
enmgen2_soldier_e_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_02_01",
      name = "soldier_e_02_01",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_02_02",
      name = "soldier_e_02_02",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_02_03",
      name = "soldier_e_02_03",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_02_04",
      name = "soldier_e_02_04",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_02_05",
      name = "soldier_e_02_05",
      ai_spawn_option = "Soldier/ep05_soldier"
    }
  },
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onSpawn = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum - 1
    if A0_27:getSpecTable().enemyDeadNum < 0 then
      A0_27:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_29, A1_30)
  end,
  onObjectAsh = function(A0_31, A1_32)
    A0_31:getSpecTable().enemyDeadNum = A0_31:getSpecTable().enemyDeadNum + 1
    _dead_count = _dead_count + 1
    print("_dead_count = " .. _dead_count)
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "soldier_e_02_01",
      "soldier_e_02_02",
      "soldier_e_02_03",
      "soldier_e_02_04",
      "soldier_e_02_05"
    }, 3, 5)
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end,
  isEnemyAllDead = function(A0_40)
    local L2_41
    L2_41 = A0_40.enemyDeadNum
    L2_41 = L2_41 >= #A0_40.spawnSet
    return L2_41
  end
}
enmgen2_mechsmall_e_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_mechsmall_e_01_01",
      name = "mechsmall_e_01_01",
      ai_spawn_option = "MechSmall/ep05_mechsmall"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mechsmall_e_01_01",
      name = "mechsmall_e_01_02",
      target_vehicle = "mechsmall_e_01_01",
      ai_spawn_option = "Soldier/ep05_soldier"
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
  onSpawn = function(A0_48, A1_49)
    A0_48:getSpecTable().enemyDeadNum = A0_48:getSpecTable().enemyDeadNum - 1
    if A0_48:getSpecTable().enemyDeadNum < 0 then
      A0_48:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onObjectAsh = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyDeadNum = A0_52:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_54)
    return #A0_54.spawnSet
  end,
  getEnemyDeadNum = function(A0_55)
    local L1_56
    L1_56 = A0_55.enemyDeadNum
    return L1_56
  end,
  isEnemyAllDead = function(A0_57)
    local L2_58
    L2_58 = A0_57.enemyDeadNum
    L2_58 = L2_58 >= #A0_57.spawnSet
    return L2_58
  end
}
enmgen2_soldier_e_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_03_01",
      name = "soldier_e_03_01",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_03_02",
      name = "soldier_e_03_02",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_e_03_03",
      name = "soldier_e_03_03",
      ai_spawn_option = "Soldier/ep05_soldier"
    }
  },
  onUpdate = function(A0_59)
    local L1_60
  end,
  onEnter = function(A0_61)
    local L1_62
  end,
  onLeave = function(A0_63)
    local L1_64
  end,
  onSpawn = function(A0_65, A1_66)
  end,
  onObjectDead = function(A0_67, A1_68)
  end,
  onObjectAsh = function(A0_69, A1_70)
    _alive_secondrush_cnt = _alive_secondrush_cnt - 1
    print("_alive_secondrush_cnt = " .. _alive_secondrush_cnt)
    if _alive_secondrush_cnt == 0 then
      _thirdrush_start = true
      print("\231\172\172\228\186\140\229\162\151\230\143\180\229\133\181\229\163\171\229\133\168\230\187\133\227\129\167_thirdrush_start = true!!!!!")
    end
  end
}
enmgen2_soldier_thirdrush = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_soldier_thirdrush_01",
      name = "soldier_thirdrush_01",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_thirdrush_02",
      name = "soldier_thirdrush_02",
      ai_spawn_option = "Soldier/ep05_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_soldier_thirdrush_03",
      name = "soldier_thirdrush_03",
      ai_spawn_option = "Soldier/ep05_soldier"
    }
  },
  onUpdate = function(A0_71)
    local L1_72
  end,
  onEnter = function(A0_73)
    local L1_74
  end,
  onLeave = function(A0_75)
    local L1_76
  end,
  onSpawn = function(A0_77, A1_78)
  end,
  onObjectDead = function(A0_79, A1_80)
  end,
  onObjectAsh = function(A0_81, A1_82)
  end
}
enmgen2_people_a_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "people01",
      locator = "locator_people_a_01",
      name = "people_a_01",
      ai_spawn_option = "People/ep05_people"
    },
    {
      type = "people02",
      locator = "locator_people_a_02",
      name = "people_a_02",
      ai_spawn_option = "People/ep05_people"
    },
    {
      type = "people03",
      locator = "locator_people_a_03",
      name = "people_a_03",
      ai_spawn_option = "People/ep05_people"
    },
    {
      type = "people01",
      locator = "locator_people_a_04",
      name = "people_a_04",
      ai_spawn_option = "People/ep05_people"
    },
    {
      type = "people02",
      locator = "locator_people_a_05",
      name = "people_a_05",
      ai_spawn_option = "People/ep05_people"
    }
  },
  onUpdate = function(A0_83)
    local L1_84
  end,
  onEnter = function(A0_85)
    local L1_86
  end,
  onLeave = function(A0_87)
    local L1_88
  end,
  onSpawn = function(A0_89, A1_90)
  end,
  onObjectDead = function(A0_91, A1_92)
  end,
  onObjectAsh = function(A0_93, A1_94)
    A0_93:getSpecTable().enemyDeadNum = A0_93:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_95)
    return #A0_95.spawnSet
  end,
  getEnemyDeadNum = function(A0_96)
    local L1_97
    L1_97 = A0_96.enemyDeadNum
    return L1_97
  end,
  isEnemyAllDead = function(A0_98)
    local L2_99
    L2_99 = A0_98.enemyDeadNum
    L2_99 = L2_99 >= #A0_98.spawnSet
    return L2_99
  end
}
function Ingame()
  local L0_100, L1_101, L2_102, L3_103, L4_104, L5_105, L6_106, L7_107, L8_108, L9_109, L10_110, L11_111, L12_112, L13_113, L14_114, L15_115, L16_116, L17_117, L18_118
  L0_100 = Fn_setCatWarp
  L0_100(L1_101)
  L0_100 = Fn_pcSensorOn
  L0_100(L1_101)
  L0_100 = Fn_pcSensorOn
  L0_100(L1_101)
  L0_100 = Fn_pcSensorOn
  L0_100(L1_101)
  L0_100 = Fn_setCatWarpCheckPoint
  L0_100(L1_101)
  L0_100 = Fn_setBgmPoint
  L0_100(L1_101)
  L0_100 = nil
  for L4_104 = 1, #L2_102 do
    L8_108 = string
    L8_108 = L8_108.format
    L9_109 = "%02d"
    L10_110 = L4_104
    L8_108 = L8_108(L9_109, L10_110)
    L0_100 = L5_105
    L5_105(L6_106, L7_107)
  end
  L1_101(L2_102)
  people_a_01_gen = L1_101
  L1_101(L2_102, L3_103)
  for L5_105 = 1, VGEM_MAX do
    L8_108 = "gem2_vital_g_"
    L9_109 = string
    L9_109 = L9_109.format
    L10_110 = "%02d"
    L11_111 = L5_105
    L9_109 = L9_109(L10_110, L11_111)
    L8_108 = L8_108 .. L9_109
    L1_101[L5_105] = L6_106
    L8_108 = false
    L6_106(L7_107, L8_108)
  end
  L2_102(L3_103, L4_104)
  L2_102()
  L2_102()
  L2_102(L3_103)
  L3_103(L4_104)
  repeat
    L3_103()
  until L3_103 >= 3
  L4_104(L5_105, L6_106)
  L4_104(L5_105, L6_106)
  L4_104(L5_105)
  L4_104(L5_105)
  L4_104(L5_105)
  for L8_108 = 1, #L6_106 do
    L9_109 = invokeTask
    function L10_110()
      L4_104[L8_108] = findGameObject2("EnemyBrain", "soldier_e_02_" .. string.format("%02d", L8_108))
      while L4_104[L8_108]:isReadyEnemy() == false do
        wait()
      end
      L4_104[L8_108]:setEnableHomingTarget(false)
      L4_104[L8_108]:move({
        "locator2_rush_common_move_01",
        "locator2_rush_common_move_02",
        "locator2_rush" .. string.format("%02d", L8_108) .. "_move_01"
      }, {move_mode = "run", arrivedLength = 0})
      repeat
        wait()
      until L4_104[L8_108]:isMoveEnd()
      L4_104[L8_108]:endScriptAction()
      L4_104[L8_108]:setEnableHomingTarget(true)
      if L8_108 == #enmgen2_soldier_e_02.spawnSet then
        L3_103:setEnemyMarker(true)
        L3_103:requestIdlingEnemy(false)
        print("\231\172\172\228\184\128\229\162\151\230\143\180\239\188\154\227\130\162\227\130\164\227\131\137\227\131\171\232\167\163\233\153\164")
      end
    end
    L9_109(L10_110)
    break
  end
  L5_105(L6_106)
  L6_106(L7_107)
  repeat
    L6_106()
    L8_108 = enmgen2_soldier_e_02
    L8_108 = L8_108.spawnSet
    L8_108 = #L8_108
  until L6_106 >= L7_107
  _attacker = nil
  L8_108 = findGameObject2
  L9_109 = "EnemyGenerator"
  L10_110 = "enmgen2_mechsmall_e_01"
  L8_108 = L8_108(L9_109, L10_110)
  if L8_108 ~= nil then
    L10_110 = L8_108
    L9_109 = L8_108.setEventListener
    L11_111 = "DamageEnemyReport"
    L12_112 = L7_107
    L9_109(L10_110, L11_111, L12_112)
    L10_110 = L8_108
    L9_109 = L8_108.setEnemyMarker
    L11_111 = false
    L9_109(L10_110, L11_111)
    L10_110 = L8_108
    L9_109 = L8_108.requestIdlingEnemy
    L11_111 = true
    L9_109(L10_110, L11_111)
    L10_110 = L8_108
    L9_109 = L8_108.requestSpawn
    L9_109(L10_110)
  end
  while true do
    L10_110 = L8_108
    L9_109 = L8_108.isPrepared
    L9_109 = L9_109(L10_110)
    if not L9_109 then
      L9_109 = wait
      L9_109()
    end
  end
  L9_109 = findGameObject2
  L10_110 = "EnemyBrain"
  L11_111 = "mechsmall_e_01_01"
  L9_109 = L9_109(L10_110, L11_111)
  repeat
    L10_110 = wait
    L10_110()
    L11_111 = L9_109
    L10_110 = L9_109.isReadyEnemy
    L10_110 = L10_110(L11_111)
  until L10_110
  L10_110 = print
  L11_111 = "\230\186\150\229\130\153\229\174\140\228\186\134"
  L10_110(L11_111)
  L10_110 = Sound
  L11_111 = L10_110
  L10_110 = L10_110.playSEHandle
  L12_112 = "ene_robot_thruster"
  L13_113 = 1
  L14_114 = ""
  L10_110 = L10_110(L11_111, L12_112, L13_113, L14_114, L15_115, L16_116, L17_117, L18_118, L15_115(L16_116, L17_117))
  _se_hdl = L10_110
  L10_110 = Sound
  L11_111 = L10_110
  L10_110 = L10_110.playSE
  L12_112 = "ene_robot_hatch_s"
  L13_113 = 1
  L14_114 = ""
  L10_110(L11_111, L12_112, L13_113, L14_114, L15_115)
  L10_110 = Sound
  L11_111 = L10_110
  L10_110 = L10_110.playSE
  L12_112 = "ene_robot_move_s"
  L13_113 = 1
  L14_114 = ""
  L10_110(L11_111, L12_112, L13_113, L14_114, L15_115)
  L10_110 = invokeTask
  function L11_111()
    waitSeconds(1)
    Sound:playSE("ene_robot_move_s", 1, "", findGameObject2("Node", "locator2_mech_sound_01"))
    waitSeconds(0.7)
    Sound:playSE("ene_robot_gatling_pre", 1, "", findGameObject2("Node", "locator2_mech_sound_01"))
    Sound:stopSEHandle(_se_hdl)
  end
  L10_110(L11_111)
  L10_110 = Fn_captionView
  L11_111 = "ep05_10010"
  L10_110(L11_111)
  L10_110 = Mv_viewObjWait
  L11_111 = "locator2_view_pos_01"
  L10_110 = L10_110(L11_111)
  L11_111 = waitSeconds
  L12_112 = 1
  L11_111(L12_112)
  L11_111 = Fn_createEffect
  L12_112 = "exp"
  L13_113 = "ef_com_exp_07"
  L14_114 = "locator2_mech_sound_01"
  L11_111 = L11_111(L12_112, L13_113, L14_114, L15_115)
  L12_112 = Sound
  L13_113 = L12_112
  L12_112 = L12_112.playSE
  L14_114 = "ene_robot_missile_hit"
  L12_112(L13_113, L14_114, L15_115, L16_116, L17_117, L18_118, L17_117(L18_118, "locator2_view_pos_01"))
  L12_112 = invokeTask
  function L13_113()
    waitSeconds(1.5)
    Fn_finishedTremEffect(L11_111, 0)
  end
  L12_112(L13_113)
  L12_112 = Mv_safeTaskAbort
  L13_113 = L10_110
  L12_112 = L12_112(L13_113)
  L10_110 = L12_112
  L12_112 = Fn_findGimmickBgInBgset
  L13_113 = "building_fl_09_01"
  L12_112 = L12_112(L13_113)
  L14_114 = L12_112
  L13_113 = L12_112.requestBreak
  L13_113(L14_114, L15_115, L16_116)
  L13_113 = findGameObject2
  L14_114 = "EnemyGenerator"
  L13_113 = L13_113(L14_114, L15_115)
  L14_114 = L13_113.setEnemyMarker
  L14_114(L15_115, L16_116)
  L14_114 = L13_113.requestIdlingEnemy
  L14_114(L15_115, L16_116)
  L14_114 = L13_113.requestSpawn
  L14_114(L15_115)
  L14_114 = print
  L14_114(L15_115)
  L14_114 = {}
  for L18_118 = 1, #L16_116 do
    invokeTask(function()
      L14_114[L18_118] = findGameObject2("EnemyBrain", "soldier_e_03_" .. string.format("%02d", L18_118))
      while L14_114[L18_118]:isReadyEnemy() == false do
        wait()
      end
      L14_114[L18_118]:setEnableHomingTarget(false)
      L14_114[L18_118]:move({
        "locator2_secondrush" .. string.format("%02d", L18_118) .. "_move_01"
      }, {move_mode = "run", arrivedLength = 0})
      repeat
        wait()
      until L14_114[L18_118]:isMoveEnd()
      L14_114[L18_118]:endScriptAction()
      L14_114[L18_118]:setEnableHomingTarget(true)
      if L18_118 == #enmgen2_soldier_e_03.spawnSet then
        L13_113:setEnemyMarker(true)
        L13_113:requestIdlingEnemy(false)
        print("\231\172\172\239\188\146\229\162\151\230\143\180\239\188\154\227\130\162\227\130\164\227\131\137\227\131\171\232\167\163\233\153\164")
      end
    end)
    break
  end
  L15_115.invincible = false
  L16_116(L17_117)
  L16_116(L17_117)
  for _FORV_19_ = 1, VGEM_MAX do
    L1_101[_FORV_19_]:setActive(true)
  end
  repeat
    L18_118()
  until L18_118
  L18_118("!!!!!!!!\230\169\159\230\162\176\229\133\181\239\188\134\229\163\171\229\174\152\230\173\187\228\186\161\227\129\167\227\131\144\227\131\136\227\131\171\231\181\130\228\186\134\239\188\129\239\188\129")
  L18_118()
  L18_118()
  L18_118(0.1)
  L18_118(L18_118)
  L18_118(L18_118, false)
  L18_118(L2_102, false)
  L18_118(L2_102, false)
  L18_118(L8_108)
  L18_118(L8_108, false)
  L18_118(L8_108, false)
  L18_118(L13_113)
  L18_118(L13_113, false)
  L18_118(L13_113, false)
  L18_118(L16_116)
  L18_118(L16_116, false)
  L18_118(L16_116, false)
  L18_118("event")
  L18_118()
  L18_118()
  L18_118(L18_118, false)
  L18_118()
  L18_118()
  L18_118()
end
function Finalize()
  Sound:stopSEHandle(_se_hdl)
  _se_hdl = nil
  Mob:makeSituationPanic(false)
  Area:setForceSceneParams()
end
function playSdemo()
  local L0_119, L1_120, L2_121, L3_122, L4_123, L5_124, L6_125
  L0_119 = Fn_userCtrlOff
  L0_119()
  L0_119 = Player
  L1_120 = L0_119
  L0_119 = L0_119.setStay
  L2_121 = true
  L0_119(L1_120, L2_121)
  L0_119 = _sdemo_cut01
  L1_120 = L0_119
  L0_119 = L0_119.play
  L0_119(L1_120)
  L0_119 = Fn_setNpcActive
  L1_120 = _npc_soldier_01
  L2_121 = true
  L0_119(L1_120, L2_121)
  L0_119 = Fn_setNpcActive
  L1_120 = _npc_soldier_02
  L2_121 = true
  L0_119(L1_120, L2_121)
  L0_119 = Fn_setNpcActive
  L1_120 = _npc_soldier_03
  L2_121 = true
  L0_119(L1_120, L2_121)
  L0_119 = Fn_resetPcPos
  L1_120 = "locator2_pc_sdemo_pos"
  L0_119(L1_120)
  L0_119 = Fn_fadein
  L1_120 = 0.5
  L2_121 = false
  L0_119(L1_120, L2_121)
  L0_119 = waitSeconds
  L1_120 = 0.1
  L0_119(L1_120)
  L0_119 = Fn_playMotionNpc
  L1_120 = _npc_soldier_02
  L2_121 = "surprise"
  L3_122 = false
  L0_119(L1_120, L2_121, L3_122)
  L0_119 = invokeTask
  function L1_120()
    wait(7)
    Fn_playMotionNpc(_npc_soldier_01, "surprise", false)
  end
  L0_119(L1_120)
  L0_119 = invokeTask
  function L1_120()
    waitSeconds(0.7)
    Fn_playMotionNpc(_npc_soldier_03, "surprise", false)
  end
  L0_119(L1_120)
  L0_119 = 1
  L1_120 = invokeTask
  function L2_121()
    waitSeconds(2.4)
    _sdemo_cut01:stop(0)
    _sdemo_cut02:play()
    L0_119 = 2
    invokeTask(function()
      wait()
      Fn_setNpcActive("npcgen2_man32_11", true)
      Fn_setNpcActive("npcgen2_man33_11", true)
      Fn_setNpcActive("npcgen2_man44_11", true)
      Fn_setNpcActive("npcgen2_chi12_11", true)
      Fn_setNpcActive("npcgen2_wom20_11", true)
      Fn_setNpcActive("npcgen2_wom17_11", true)
    end)
    invokeTask(function()
      waitSeconds(4.1)
      Fn_moveNpc("npcgen2_man33_11", {
        "locator2_movepos_man33_01"
      }, {runLength = 9999})
      Fn_moveNpc("npcgen2_man32_11", {
        "locator2_movepos_man32_01"
      }, {runLength = 9999})
    end)
    _sdemo_cut02:zoomOut(4.2, {deg = 31}, "Linear")
    _sdemo_cut02:stop(0)
    _sdemo_cut04:play()
    L0_119 = 4
    Player:setLookAtIk(true, 1, findGameObject2("Node", "npcgen2_man44_11"):getWorldPos())
  end
  L1_120(L2_121)
  L1_120 = {}
  L1_120.turn_l = "man01_turn_l_00"
  L1_120.turn_r = "man01_turn_r_00"
  L2_121 = Fn_loadNpcEventMotion
  L3_122 = _npc_soldier_01
  L4_123 = L1_120
  L2_121(L3_122, L4_123)
  L2_121 = Fn_loadNpcEventMotion
  L3_122 = _npc_soldier_02
  L4_123 = L1_120
  L2_121(L3_122, L4_123)
  L2_121 = Fn_loadNpcEventMotion
  L3_122 = _npc_soldier_03
  L4_123 = L1_120
  L2_121(L3_122, L4_123)
  L2_121 = Fn_captionViewWait
  L3_122 = "ep05_04001"
  L4_123 = 2.22
  L2_121(L3_122, L4_123)
  L2_121 = {
    L3_122,
    L4_123,
    L5_124
  }
  L3_122 = "locator2_move_pos_01"
  L4_123 = "locator2_move_pos_02"
  L5_124 = "locator2_move_pos_03"
  L3_122 = {L4_123, L5_124}
  L4_123 = "locator2_move_pos_02"
  L5_124 = "locator2_move_pos_03"
  L4_123 = {
    L5_124,
    L6_125,
    "locator2_move_pos_03"
  }
  L5_124 = "locator2_move_pos_01"
  L6_125 = "locator2_move_pos_02"
  L5_124 = {}
  L5_124.runLength = -1
  L6_125 = {}
  L6_125.anim_turn_l = "man01_turn_l_00"
  L6_125.anim_turn_r = "man01_turn_r_00"
  invokeTask(function()
    Fn_findNpc(_npc_soldier_02):turn(180, L6_125)
    repeat
      wait()
    until Fn_findNpc(_npc_soldier_02):isTurnEnd()
  end)
  invokeTask(function()
    wait(7)
    Fn_findNpc(_npc_soldier_01):turn(180, L6_125)
    repeat
      wait()
    until Fn_findNpc(_npc_soldier_01):isTurnEnd()
  end)
  invokeTask(function()
    Fn_findNpc(_npc_soldier_03):turn(180, L6_125)
    repeat
      wait()
    until Fn_findNpc(_npc_soldier_03):isTurnEnd()
  end)
  Sound:playSE("m23_015", 1)
  print("\227\131\156\227\130\164\227\130\185m23_015\239\188\129\239\188\129\239\188\129\239\188\129")
  Fn_captionViewWait("ep05_04002")
  invokeTask(function()
    waitSeconds(1)
    Player:setSituation(Player.kSituation_Normal, true, 8.5, true, false)
  end)
  waitSeconds(3)
  move_task_01 = nil
  move_task_02 = nil
  move_task_03 = nil
  Fn_setNpcActive(_npc_soldier_01, false)
  Fn_setNpcActive(_npc_soldier_02, false)
  Fn_setNpcActive(_npc_soldier_03, false)
  Fn_kaiwaDemoView("ep05_00310k")
  Fn_blackout()
  _sdemo_cut04:stop(0)
  Player:setLookAtIk(false, 1, findGameObject2("Node", "npcgen2_man44_11"):getWorldPos())
end
function look_at_target_input(A0_126, A1_127)
  while true do
    if Fn_isInSightTarget(A0_126, 0.2) == true then
      break
    end
    if is_camera_input() == true then
      if not (0 + 1 > 10) then
        else
        end
        wait()
      end
  end
  if Fn_lookAtObject(A0_126, A1_127) ~= nil and Fn_lookAtObject(A0_126, A1_127):isRunning() == true then
    Fn_lookAtObject(A0_126, A1_127):abort()
  end
  return true
end
function is_camera_input(A0_128, A1_129)
  local L2_130
  L2_130 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_130 = true
  end
  return L2_130
end
function pccubesensor2_catwarp_warning_g_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
    Fn_captionViewWait("ep05_09001")
  end)
end
function pccubesensor2_catwarp_area_g_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_navi_kill_g_01_OnEnter()
  Fn_naviKill()
end
