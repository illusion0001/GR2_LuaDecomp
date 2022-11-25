dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm32_common.lua")
puppets = {}
name_tbl = {}
_objs = {}
_test_out = false
_battle_out = false
_battle_out_task = nil
_task = nil
_effect = {}
__enemy_cnt = 0
box_explain_damage = 0
_BOX_BREAK = 3
_PLAYER_MOTION = {
  hail = "kit01_hail_00"
}
_NPC_MOTION = {
  stay_01 = "man01_lookaround_02",
  stay_02 = "man01_lookaround_00",
  stay_03 = "man01_stay_02",
  stay_04 = "man01_photo_00",
  stay_05 = "man01_stay_01",
  stay_06 = "man01_stay_00",
  man_handclap = "man01_handclap_00",
  wom_handclap = "wom01_handclap_00",
  kaj_stay_00 = "kaj01_stay_00",
  kaj_stay_01 = "kaj01_stay_01"
}
enmgen2__01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki04",
      locator = "locator__01_01",
      name = "_01_01",
      variation = "man79_aa",
      hair = true
    },
    {
      type = "gorotuki04",
      locator = "locator__01_02",
      name = "_01_02",
      variation = "man79_bb"
    },
    {
      type = "gorotuki04",
      locator = "locator__01_03",
      name = "_01_03",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man79_cc"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2__02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator__02_01",
      name = "_02_01",
      variation = "man80_aa",
      hair = true
    }
  },
  onUpdate = function(A0_10)
    local L1_11
  end,
  onEnter = function(A0_12)
    local L1_13
  end,
  onLeave = function(A0_14)
    local L1_15
  end,
  onObjectDead = function(A0_16, A1_17)
  end,
  onObjectAsh = function(A0_18, A1_19)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2__03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator__03_01",
      name = "_03_01",
      variation = "man80_bb"
    }
  },
  onUpdate = function(A0_20)
    local L1_21
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onLeave = function(A0_24)
    local L1_25
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onObjectAsh = function(A0_28, A1_29)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2__04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator__04_01",
      name = "_04_01",
      variation = "man80_cc",
      hair = true
    }
  },
  onUpdate = function(A0_30)
    local L1_31
  end,
  onEnter = function(A0_32)
    local L1_33
  end,
  onLeave = function(A0_34)
    local L1_35
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onObjectAsh = function(A0_38, A1_39)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2__05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator__05_01",
      name = "_05_01",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man80_dd"
    }
  },
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onObjectDead = function(A0_46, A1_47)
  end,
  onObjectAsh = function(A0_48, A1_49)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2__06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator__06_01",
      name = "_06_01",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man80_aa"
    }
  },
  onUpdate = function(A0_50)
    local L1_51
  end,
  onEnter = function(A0_52)
    local L1_53
  end,
  onLeave = function(A0_54)
    local L1_55
  end,
  onObjectDead = function(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2__07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki04",
      locator = "locator__07_01",
      name = "_07_01",
      variation = "man79_aa"
    },
    {
      type = "gorotuki04",
      locator = "locator__07_02",
      name = "_07_02",
      variation = "man79_bb",
      hair = true
    },
    {
      type = "gorotuki04",
      locator = "locator__07_03",
      name = "_07_03",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man79_cc"
    },
    {
      type = "gorotuki04",
      locator = "locator__07_04",
      name = "_07_04",
      ai_spawn_option = "Gorotuki/pipe",
      variation = "man79_dd",
      hair = true
    }
  },
  onUpdate = function(A0_60)
    local L1_61
  end,
  onEnter = function(A0_62)
    local L1_63
  end,
  onLeave = function(A0_64)
    local L1_65
  end,
  onObjectDead = function(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
function Initialize()
  local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75
  L0_70 = Fn_userCtrlAllOff
  L0_70()
  L0_70 = Fn_loadPlayerMotion
  L0_70(L1_71)
  L0_70 = puppets
  L0_70.sm32_client = L1_71
  L0_70 = {
    L1_71,
    L2_72,
    L3_73,
    L4_74,
    L5_75,
    {
      name = "_police_05",
      type = "man31",
      node = "locator2_police_05",
      attach = false,
      active = false
    },
    {
      name = "_police_06",
      type = "man31",
      node = "locator2_police_06",
      attach = false,
      active = false
    },
    {
      name = "_police_07",
      type = "man31",
      node = "locator2_police_07",
      attach = false,
      active = false
    },
    {
      name = "_police_08",
      type = "man31",
      node = "locator2_police_08",
      attach = false,
      active = false
    },
    {
      name = "_police_09",
      type = "man31",
      node = "locator2_police_09",
      attach = false,
      active = false
    },
    {
      name = "_police_10",
      type = "man31",
      node = "locator2_police_start_01",
      attach = false,
      active = false
    },
    {
      name = "_police_11",
      type = "man31",
      node = "locator2_police_start_02",
      attach = false,
      active = false
    },
    {
      name = "_police_12",
      type = "man31",
      node = "locator2_police_12",
      attach = false,
      active = false
    },
    {
      name = "_police_13",
      type = "man31",
      node = "locator2_police_13",
      attach = false,
      active = false
    },
    {
      name = "_police_14",
      type = "man31",
      node = "locator2_police_14",
      attach = false,
      active = false
    },
    {
      name = "_police_15",
      type = "man31",
      node = "locator2_police_15",
      attach = false,
      active = false
    },
    {
      name = "_police_16",
      type = "man31",
      node = "locator2_police_16",
      attach = false,
      active = false
    }
  }
  L1_71.name = "_man_01"
  L1_71.type = "kaj01"
  L1_71.node = "locator2__man_01"
  L1_71.attach = false
  L1_71.active = false
  L2_72.name = "_police_01"
  L2_72.type = "man31"
  L2_72.node = "locator2_police_01"
  L2_72.attach = false
  L2_72.active = false
  L3_73.name = "_police_02"
  L3_73.type = "man31"
  L3_73.node = "locator2_police_02"
  L3_73.attach = false
  L3_73.active = false
  L4_74 = {}
  L4_74.name = "_police_03"
  L4_74.type = "man31"
  L4_74.node = "locator2_police_03"
  L4_74.attach = false
  L4_74.active = false
  L5_75 = {}
  L5_75.name = "_police_04"
  L5_75.type = "man31"
  L5_75.node = "locator2_police_04"
  L5_75.attach = false
  L5_75.active = false
  L1_71(L2_72)
  for L4_74, L5_75 in L1_71(L2_72) do
    puppets[L5_75.name] = Fn_findNpcPuppet(L5_75.name)
    Fn_loadNpcEventMotion(L5_75.name, _NPC_MOTION)
    if L5_75.name ~= "_man_01" then
      table.insert(name_tbl, L5_75.name)
    end
  end
  for L4_74, L5_75 in L1_71(L2_72) do
    Fn_disableKaiwaDemo(L5_75)
  end
end
function Ingame()
  local L0_76, L1_77, L2_78, L3_79, L4_80, L5_81, L6_82
  L0_76 = Fn_userCtrlAllOff
  L0_76()
  L0_76 = Fn_setNpcActive
  L1_77 = "_man_01"
  L2_78 = true
  L0_76(L1_77, L2_78)
  L0_76 = _police_animation
  L0_76()
  L0_76 = turnKajTask
  L1_77 = "_man_01"
  L0_76 = L0_76(L1_77)
  L1_77 = table
  L1_77 = L1_77.insert
  L2_78 = _objs
  L3_79 = CreateWoodbox
  L4_80 = "locator2__test_01"
  L6_82 = L3_79(L4_80)
  L1_77(L2_78, L3_79, L4_80, L5_81, L6_82, L3_79(L4_80))
  L1_77 = Fn_missionStart
  L1_77()
  L1_77 = Fn_kaiwaDemoView
  L2_78 = "sm32_00201k"
  L1_77(L2_78)
  L1_77 = Fn_userCtrlOn
  L1_77()
  L1_77 = Fn_userCtrlGravityOff
  L1_77()
  L1_77 = _explain_loop
  L1_77 = L1_77()
  _task = L1_77
  L1_77 = Fn_missionView
  L2_78 = "sm32_00100"
  L1_77(L2_78)
  while true do
    L1_77 = _task
    if L1_77 ~= nil then
      L1_77 = _task
      L2_78 = L1_77
      L1_77 = L1_77.isRunning
      L1_77 = L1_77(L2_78)
    end
    if L1_77 then
      L1_77 = wait
      L1_77()
    end
  end
  L1_77 = _task
  L2_78 = L1_77
  L1_77 = L1_77.abort
  L1_77(L2_78)
  _task = nil
  L1_77 = Fn_missionViewEnd
  L1_77()
  L1_77 = Fn_kaiwaDemoView
  L2_78 = "sm32_00202k"
  L1_77(L2_78)
  L1_77 = Fn_blackout
  L1_77()
  L1_77 = effect_term
  L1_77()
  L1_77 = ObjectRelease
  L1_77()
  L1_77 = RespawnConesAndBarricade
  L1_77()
  L1_77 = Fn_warpNpc
  L2_78 = "_man_01"
  L3_79 = "locator2__man_02"
  L1_77(L2_78, L3_79)
  L1_77 = Fn_warpNpc
  L2_78 = "_police_10"
  L3_79 = "locator2_police_10"
  L1_77(L2_78, L3_79)
  L1_77 = Fn_warpNpc
  L2_78 = "_police_11"
  L3_79 = "locator2_police_11"
  L1_77(L2_78, L3_79)
  L1_77 = HUD
  L2_78 = L1_77
  L1_77 = L1_77.counter99_99SetTextID
  L3_79 = "sm32_01001"
  L1_77(L2_78, L3_79)
  L1_77 = HUD
  L2_78 = L1_77
  L1_77 = L1_77.counter99_99SetMax
  L3_79 = _BOX_BREAK
  L1_77(L2_78, L3_79)
  L1_77 = HUD
  L2_78 = L1_77
  L1_77 = L1_77.counter99_99SetNum
  L3_79 = 0
  L1_77(L2_78, L3_79)
  L1_77 = HUD
  L2_78 = L1_77
  L1_77 = L1_77.counter99_99SetVisible
  L3_79 = true
  L1_77(L2_78, L3_79)
  L1_77 = {
    L2_78,
    L3_79,
    L4_80,
    L5_81
  }
  L2_78 = "_dummy_01"
  L3_79 = "_dummy_02"
  L4_80 = "_dummy_03"
  L5_81 = "_dummy_04"
  L2_78 = {L3_79}
  L3_79 = "enmgen2__01"
  L3_79 = _restart
  L4_80 = "locator2_pc_start_pos"
  L5_81 = L2_78
  L6_82 = L1_77
  L3_79(L4_80, L5_81, L6_82)
  L3_79 = _loop
  L4_80 = "locator2_pc_start_pos"
  L5_81 = L2_78
  L6_82 = L1_77
  L3_79(L4_80, L5_81, L6_82, "sm32_00210k", "sm32_00211k", "sm32_00212k", "sm32_00220k")
  L3_79 = {
    L4_80,
    L5_81,
    L6_82,
    "_dummy_06",
    "_dummy_07",
    "_dummy_11",
    "_dummy_12",
    "_dummy_13"
  }
  L4_80 = "_dummy_01"
  L5_81 = "_dummy_03"
  L6_82 = "_dummy_04"
  L4_80 = {
    L5_81,
    L6_82,
    "enmgen2__04",
    "enmgen2__05",
    "enmgen2__06"
  }
  L5_81 = "enmgen2__02"
  L6_82 = "enmgen2__03"
  L5_81 = _restart
  L6_82 = "locator2_pc_start_pos"
  L5_81(L6_82, L4_80, L3_79)
  L5_81 = _loop
  L6_82 = "locator2_pc_start_pos"
  L5_81(L6_82, L4_80, L3_79, nil, "sm32_00221k", "sm32_00222k", "sm32_00230k")
  L5_81 = {
    L6_82,
    "_dummy_04",
    "_dummy_06",
    "_dummy_07",
    "_dummy_05",
    "_dummy_08",
    "_dummy_09",
    "_dummy_10",
    "_dummy_14",
    "_dummy_15",
    "_dummy_16",
    "_dummy_17",
    "_dummy_12",
    "_dummy_18",
    "_dummy_19"
  }
  L6_82 = "_dummy_03"
  L6_82 = {
    "enmgen2__02",
    "enmgen2__03",
    "enmgen2__04",
    "enmgen2__05",
    "enmgen2__07"
  }
  _restart("locator2_pc_start_pos", L6_82, L5_81)
  _loop("locator2_pc_start_pos", L6_82, L5_81, nil, "sm32_00231k", "sm32_00232k", "sm32_00300k")
  HUD:counter99_99SetVisible(false)
  L0_76:abort()
  L0_76 = nil
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_83, L1_84
end
function _police_animation()
  local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90, L6_91
  L0_85 = {
    L1_86,
    L2_87,
    L3_88,
    L4_89,
    L5_90,
    L6_91
  }
  L1_86 = {}
  L1_86.name = L2_87
  L2_87.name = L3_88
  L3_88.name = L4_89
  L5_90 = _NPC_MOTION
  L5_90 = L5_90.stay_04
  L4_89.name = L5_90
  L5_90 = {}
  L6_91 = _NPC_MOTION
  L6_91 = L6_91.stay_05
  L5_90.name = L6_91
  L6_91 = {}
  L6_91.name = _NPC_MOTION.stay_06
  L1_86 = {
    L2_87,
    L3_88,
    L4_89,
    L5_90,
    L6_91,
    {name = "_police_06"},
    {name = "_police_07"},
    {name = "_police_08"},
    {name = "_police_09"},
    {name = "_police_10"},
    {name = "_police_11"},
    {name = "_police_12"},
    {name = "_police_13"},
    {name = "_police_14"},
    {name = "_police_15"},
    {name = "_police_16"}
  }
  L2_87.name = "_police_01"
  L3_88.name = "_police_02"
  L4_89.name = "_police_03"
  L5_90 = {}
  L5_90.name = "_police_04"
  L6_91 = {}
  L6_91.name = "_police_05"
  for L5_90 = 1, #L1_86 do
    L6_91 = math
    L6_91 = L6_91.random
    L6_91 = L6_91(#L0_85)
    Fn_setNpcActive(L1_86[L5_90].name, true)
    invokeTask(function()
      local L0_92
      L0_92 = math
      L0_92 = L0_92.random
      L0_92 = L0_92(0, 0.5)
      waitSeconds(L0_92)
      Fn_playMotionNpc(L1_86[L5_90].name, L0_85[L6_91].name, false)
    end)
    do break end
    break
  end
end
function ObjectRelease()
  Area:requestBreak(findGameObject2("Node", "locator2_pc_start_pos"), 50)
  for _FORV_3_, _FORV_4_ in ipairs(_objs) do
    if _FORV_4_:getDynamicObject() then
      _FORV_4_:getDynamicObject():try_term()
    end
    _FORV_4_:try_term()
    _objs[_FORV_3_] = nil
  end
  _objs = {}
end
function pccubesensor2__test_OnEnter()
  local L0_93, L1_94
  _test_out = false
end
function pccubesensor2__test_OnLeave()
  local L0_95, L1_96
  _test_out = true
end
function pccubesensor2__battle_01_OnEnter()
  local L0_97, L1_98
  _battle_out = false
end
function pccubesensor2__battle_01_OnLeave()
  local L0_99, L1_100
  _battle_out = true
end
function _explain_loop()
  return (invokeTask(function()
    local L0_101
    L0_101 = 0
    while L0_101 == 0 do
      if _test_out then
        Player:setStay(true)
        Fn_userCtrlAllOff()
        Fn_captionViewWait("sm32_00104")
        Fn_blackout()
        Fn_resetPcPos("locator2_pc_start_pos")
        Player:setStay(false)
        Fn_fadein()
        Fn_userCtrlOn()
        Fn_userCtrlGravityOff()
        _test_out = false
      end
      for _FORV_4_ = 1, #_objs do
        if _objs[_FORV_4_]:isBroken() then
          L0_101 = _FORV_4_
          effect_create(L0_101, _objs[L0_101])
        end
      end
      _FOR_()
    end
    Fn_userCtrlAllOff()
    while is_effect_playing() do
      wait()
    end
  end))
end
function _restart(A0_102, A1_103, A2_104)
  Fn_resetPcPos(A0_102)
  RespawnConesAndBarricade()
  HUD:counter99_99SetNum(0)
  HUD:counter99_99SetVisible(true)
  __enemy_cnt = 0
  for _FORV_6_ = 1, #A1_103 do
    if findGameObject2("EnemyGenerator", A1_103[_FORV_6_]) ~= nil then
      __enemy_cnt = __enemy_cnt + #findGameObject2("EnemyGenerator", A1_103[_FORV_6_]):getSpecTable().spawnSet
      findGameObject2("EnemyGenerator", A1_103[_FORV_6_]):requestSpawn()
      findGameObject2("EnemyGenerator", A1_103[_FORV_6_]):requestIdlingEnemy(true)
    end
  end
  print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  for _FORV_6_ = 1, #A2_104 do
    table.insert(_objs, CreateWoodbox("locator2_" .. A2_104[_FORV_6_]))
  end
end
function _loop(A0_105, A1_106, A2_107, A3_108, A4_109, A5_110, A6_111)
  local L7_112, L8_113, L9_114, L10_115, L11_116, L12_117, L13_118, L14_119, L15_120, L16_121, L17_122
  L7_112 = print
  L7_112(L8_113)
  L7_112 = true
  while true do
    L12_117 = L11_116
    L17_122 = L11_116(L12_117, L13_118)
    L8_113(L9_114, L10_115, L11_116, L12_117, L13_118, L14_119, L15_120, L16_121, L17_122, L11_116(L12_117, L13_118))
    L8_113(L9_114)
    L8_113()
    if L7_112 == true then
      if A3_108 then
        L8_113(L9_114)
      end
      L7_112 = false
    end
    L8_113(L9_114)
    L8_113()
    for L11_116 = 1, #A1_106 do
      L12_117 = findGameObject2
      L12_117 = L12_117(L13_118, L14_119)
      if L12_117 ~= nil then
        L13_118(L14_119, L15_120)
      end
    end
    L8_113()
    L8_113()
    _battle_out = false
    for L12_117 = 1, #L10_115 do
      L8_113[L12_117] = false
    end
    L12_117 = false
    while true do
      while true do
        if L13_118 > 0 then
          box_explain_damage = 40
          for L17_122 = 1, #L15_120 do
            if _objs[L17_122]:isBroken() then
              if not L8_113[L17_122] then
                effect_create(L17_122, _objs[L17_122])
                L8_113[L17_122] = true
              end
              HUD:counter99_99SetNum(L13_118)
            end
            if L11_116 > 0 and not L12_117 then
              if L13_118 == 1 then
                Fn_captionView("sm32_01003")
              elseif L13_118 == 2 then
                Fn_captionView("sm32_01004")
                L12_117 = true
              end
            end
          end
          if L13_118 >= L14_119 then
            break
          end
          if L14_119 then
            if L14_119 == nil then
              _battle_out_task = L14_119
            elseif not L14_119 then
              break
            end
        end
        elseif L14_119 ~= nil then
          if not L14_119 then
            L14_119(L15_120)
            _battle_out_task = nil
          end
        end
        L14_119()
      end
    end
    while true do
      if L13_118 then
        L13_118()
      end
    end
    L13_118()
    if L10_115 then
      L13_118(L14_119)
    elseif L9_114 then
      L13_118(L14_119)
    else
      L13_118(L14_119, L15_120)
      L14_119()
      if A6_111 ~= nil then
        L14_119(L15_120)
      end
      L14_119()
      L14_119(L15_120)
      L14_119()
      for L17_122 = 1, #A1_106 do
        if findGameObject2("EnemyGenerator", A1_106[L17_122]) ~= nil then
          findGameObject2("EnemyGenerator", A1_106[L17_122]):requestAllEnemyKill()
        end
      end
      L14_119()
      L14_119()
      break
    end
    L13_118()
    for L16_121 = 1, #A1_106 do
      L17_122 = findGameObject2
      L17_122 = L17_122("EnemyGenerator", A1_106[L16_121])
      if L17_122 ~= nil then
        L17_122:requestAllEnemyKill()
      end
    end
    L13_118()
    L13_118()
    L13_118(L14_119, L15_120, L16_121)
  end
end
function effect_create(A0_123, A1_124)
  if not A1_124:isBroken() then
    A1_124:requestBreak(A1_124:getWorldPos(), 0, 2.7)
  end
  _effect[A0_123] = RAC_createEffect({
    eff_name = "ef_com_exp_02",
    pos_node = A1_124,
    time = 2.7
  })
  Sound:playSE("ef_ev_exp_01", 1, "", _effect[A0_123])
  box_explain(A1_124:getWorldPos())
end
function effect_term()
  for _FORV_3_, _FORV_4_ in pairs(_effect) do
    if _effect[_FORV_3_] ~= nil then
      _effect[_FORV_3_]:abort()
      _effect[_FORV_3_] = nil
    end
  end
  _effect = {}
end
function is_effect_playing()
  for _FORV_3_, _FORV_4_ in pairs(_effect) do
    if _effect[_FORV_3_] ~= nil and _effect[_FORV_3_]:isRunning() then
      return true
    end
  end
  return false
end
function player_good_action()
  Player:setSituation(Player.kSituation_Normal, true, 2, true, false)
  waitSeconds(2)
  while Player:getAction() ~= Player.kAction_Idle do
    wait()
  end
  Player:setStay(true)
  Sound:playSE("clear_jingle")
  Fn_playPlayerMotionWait(_PLAYER_MOTION.hail, 0, 0.2, true)
  Player:setStay(false)
end
