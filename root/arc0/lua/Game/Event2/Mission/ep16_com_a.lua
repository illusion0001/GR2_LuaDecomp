dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Misc/fatal_marker.lua")
EP16_SHIP_VELOCITY_CTR_DIST = 20
_requestTask = {}
_requestResult = {}
_ship_area = nil
_startMissionPart = ""
_enemyGen = nil
_unicaPuppet = nil
_unicaBrain = nil
_permetPuppet = nil
_permetBrain = nil
_route_enemy_task = {}
_fatalMarker = FatalMarker.create(kFATAL_TYPE_ACT)
ep16_sdemo = nil
ep16_ship_task = nil
ep16_lockon_task = nil
ep16_a_c01_pdemo = nil
ep16_b_c01_pdemo = nil
ep16_c_c01_pdemo = nil
EP16_PLAYER_MOTION = {
  greeting = "kit01_greeting_00",
  lookaround_00 = "kit01_ep16_lookaround_00",
  fighting_00 = "kit01_stay_fighting_00"
}
enmgen2_escape_stingray = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "escape_stingray",
      locator = "locator2_escape_stingray",
      type = "stingray",
      ai_spawn_option = "Stingray/stingray_ep16_b"
    },
    {
      name = "escape_terrorist",
      locator = "locator2_escape_terrorist",
      type = "terrorist",
      target_vehicle = "escape_stingray",
      ai_spawn_option = "Terrorist/terrorist_ep16_b"
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
  onSpawn = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end
}
enmgen2_decoy01_stingray = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "decoy01_stingray",
      locator = "locator2_decoy01_stingray",
      type = "stingray",
      ai_spawn_option = "Stingray/stingray_ep16_b"
    },
    {
      name = "decoy01_terrorist",
      locator = "locator2_decoy01_terrorist",
      type = "terrorist_rifle",
      target_vehicle = "decoy01_stingray"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onObjectDead = function(A0_18, A1_19)
  end,
  onSpawn = function(A0_20, A1_21)
  end,
  onObjectAsh = function(A0_22, A1_23)
  end
}
enmgen2_decoy02_stingray = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "decoy02_stingray",
      locator = "locator2_decoy02_stingray",
      type = "stingray",
      ai_spawn_option = "Stingray/stingray_ep16_b"
    },
    {
      name = "decoy02_terrorist",
      locator = "locator2_decoy02_terrorist",
      type = "terrorist_rifle",
      target_vehicle = "decoy02_stingray"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onSpawn = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end
}
enmgen2_decoy03_stingray = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "decoy03_stingray",
      locator = "locator2_decoy03_stingray",
      type = "stingray",
      ai_spawn_option = "Stingray/stingray_ep16_b"
    },
    {
      name = "decoy03_terrorist",
      locator = "locator2_decoy03_terrorist",
      type = "terrorist_rifle",
      target_vehicle = "decoy03_stingray"
    }
  },
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onSpawn = function(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
  end
}
enmgen2_decoy04_stingray = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "decoy04_stingray",
      locator = "locator2_decoy04_stingray",
      type = "stingray",
      ai_spawn_option = "Stingray/stingray_ep16_b"
    },
    {
      name = "decoy04_terrorist",
      locator = "locator2_decoy04_terrorist",
      type = "terrorist_rifle",
      target_vehicle = "decoy04_stingray"
    }
  },
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onObjectDead = function(A0_54, A1_55)
  end,
  onSpawn = function(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
  end
}
enmgen2_route02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_01_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_01_02",
      locator = "locator_02",
      type = "terrorist_rifle"
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
  onSpawn = function(A0_68, A1_69)
  end,
  onObjectAsh = function(A0_70, A1_71)
  end
}
enmgen2_route02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_02_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_02_02",
      locator = "locator_02",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_72)
    local L1_73
  end,
  onEnter = function(A0_74)
    local L1_75
  end,
  onLeave = function(A0_76)
    local L1_77
  end,
  onObjectDead = function(A0_78, A1_79)
  end,
  onSpawn = function(A0_80, A1_81)
  end,
  onObjectAsh = function(A0_82, A1_83)
  end
}
enmgen2_route02_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_03_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_03_02",
      locator = "locator_02",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_84)
    local L1_85
  end,
  onEnter = function(A0_86)
    local L1_87
  end,
  onLeave = function(A0_88)
    local L1_89
  end,
  onObjectDead = function(A0_90, A1_91)
  end,
  onSpawn = function(A0_92, A1_93)
  end,
  onObjectAsh = function(A0_94, A1_95)
  end
}
enmgen2_route02_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_04_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_04_02",
      locator = "locator_02",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_96)
    local L1_97
  end,
  onEnter = function(A0_98)
    local L1_99
  end,
  onLeave = function(A0_100)
    local L1_101
  end,
  onObjectDead = function(A0_102, A1_103)
  end,
  onSpawn = function(A0_104, A1_105)
  end,
  onObjectAsh = function(A0_106, A1_107)
  end
}
enmgen2_route02_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_05_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_05_02",
      locator = "locator_02",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_108)
    local L1_109
  end,
  onEnter = function(A0_110)
    local L1_111
  end,
  onLeave = function(A0_112)
    local L1_113
  end,
  onObjectDead = function(A0_114, A1_115)
  end,
  onSpawn = function(A0_116, A1_117)
  end,
  onObjectAsh = function(A0_118, A1_119)
  end
}
enmgen2_route02_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_06_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_06_02",
      locator = "locator_02",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_120)
    local L1_121
  end,
  onEnter = function(A0_122)
    local L1_123
  end,
  onLeave = function(A0_124)
    local L1_125
  end,
  onObjectDead = function(A0_126, A1_127)
  end,
  onSpawn = function(A0_128, A1_129)
  end,
  onObjectAsh = function(A0_130, A1_131)
  end
}
enmgen2_route02_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "route02_07_01",
      locator = "locator_01",
      type = "terrorist_rifle"
    },
    {
      name = "route02_07_02",
      locator = "locator_02",
      type = "terrorist_rifle"
    }
  },
  onUpdate = function(A0_132)
    local L1_133
  end,
  onEnter = function(A0_134)
    local L1_135
  end,
  onLeave = function(A0_136)
    local L1_137
  end,
  onObjectDead = function(A0_138, A1_139)
  end,
  onSpawn = function(A0_140, A1_141)
  end,
  onObjectAsh = function(A0_142, A1_143)
  end
}
enmgen2_enemy_stingray = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "enemy01",
      locator = "locator2_enemy_stg_01",
      type = "stingray"
    },
    {
      name = "enemy02",
      locator = "locator2_enemy_stg_02",
      type = "stingray"
    },
    {
      name = "enemy03",
      locator = "locator2_enemy_stg_03",
      type = "stingray"
    },
    {
      name = "enemy01_pilot",
      locator = "locator2_enemy_stg_01",
      type = "terrorist_rifle",
      target_vehicle = "enemy01"
    },
    {
      name = "enemy02_pilot",
      locator = "locator2_enemy_stg_02",
      type = "terrorist_rifle",
      target_vehicle = "enemy02"
    },
    {
      name = "enemy03_pilot",
      locator = "locator2_enemy_stg_03",
      type = "terrorist_rifle",
      target_vehicle = "enemy03"
    }
  },
  onUpdate = function(A0_144)
    local L1_145
  end,
  onEnter = function(A0_146)
    local L1_147
  end,
  onLeave = function(A0_148)
    local L1_149
  end,
  onObjectDead = function(A0_150, A1_151)
  end,
  onSpawn = function(A0_152, A1_153)
  end,
  onObjectAsh = function(A0_154, A1_155)
  end
}
enmgen2_ep16d_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "uni01",
      locator = "locator2_unica_01",
      type = "unica",
      ai_spawn_option = "Unica/unica_ep16_d"
    },
    {
      name = "per01",
      locator = "locator2_permet_01",
      type = "permet",
      ai_spawn_option = "Permet/permet_ep16_d"
    }
  },
  onUpdate = function(A0_156)
    local L1_157
  end,
  onEnter = function(A0_158)
    local L1_159
  end,
  onLeave = function(A0_160)
    local L1_161
  end,
  onObjectDead = function(A0_162, A1_163)
  end,
  onSpawn = function(A0_164, A1_165)
  end,
  onObjectAsh = function(A0_166, A1_167)
  end
}
function Initialize()
  _startMissionPart = Fn_getMissionPart()
  Fn_loadPlayerMotion(EP16_PLAYER_MOTION)
  if _startMissionPart == "ep16_2a" then
    _ship_area = RAC_spawnVehicle("ep16_ship", "BusHexL02", "locator2_sdemo1_govship_start", 0)
  end
  ep16_sdemo = SDemo.create("ep16_sdemo")
  ep16_a_c01_pdemo = PDemo.create("ep16_a_c01", Fn_findAreaHandle("id_a_root"), {camera = true, scene_param = false})
  ep16_b_c01_pdemo = PDemo.create("ep16_b_c01", Fn_findAreaHandle("id_a_root"), {camera = true, scene_param = false})
  ep16_c_c01_pdemo = PDemo.create("ep16_c_c01", Fn_findAreaHandle("id_a_root"), {camera = true, scene_param = false})
  findGameObject2("GimmickBg", "bg2_capsule_01"):setActive(false)
end
function Ingame()
  while true do
    dispatchRequestTask()
    wait()
  end
end
function Finalize()
  local L0_168, L1_169
end
function ingameSection(A0_170)
  local L1_171
  L1_171 = {}
  L1_171.a1 = part_a1
  L1_171.a2 = part_a2
  L1_171.a2_2 = part_a2_2
  L1_171.a3 = part_a3
  L1_171.a4 = part_a4
  L1_171.a5 = part_a5
  L1_171.b1 = part_b1
  L1_171.b2 = part_b2
  L1_171.b4 = part_b4
  L1_171.b5 = part_b5
  L1_171.c1 = part_c1
  L1_171.d1 = part_d1
  return L1_171[A0_170]()
end
function part_a1()
  ep16_sdemo:reset()
  ep16_sdemo:set("locator2_sdemo1_cam_01", "locator2_sdemo1_aim_01")
  ep16_sdemo:play()
end
function part_a2()
  local L0_172, L1_173
  L0_172 = {
    L1_173,
    "locator2_sdemo1_govship_02",
    "locator2_sdemo1_govship_03",
    "locator2_sdemo1_govship_04"
  }
  L1_173 = "locator2_sdemo1_govship_01"
  L1_173 = 17
  ep16_ship_task = invokeAreaMoveTask(L0_172, L1_173, L1_173)
  ep16_sdemo:play({
    {
      pos = "locator2_sdemo1_cam_02",
      time = 7,
      hashfunc = "EaseOut"
    }
  })
  waitSeconds(9)
  if ep16_ship_task then
    _ship_area:setBaseSpeed(0)
    _ship_area:setCurrSpeed(0)
    ep16_ship_task:abort()
    ep16_ship_task = nil
  end
  if invokeVeloctiyControlTask(L1_173) then
    invokeVeloctiyControlTask(L1_173):abort()
  end
  waitSeconds(0.5)
end
function part_a2_2()
  while ep16_ship_task ~= nil and ep16_ship_task:isRunning() do
    wait()
  end
end
function part_a3()
  local L0_174, L1_175, L2_176, L3_177, L4_178, L5_179, L6_180
  L0_174 = {L1_175, L2_176}
  L1_175 = "locator2_sdemo1_govship_11"
  L2_176 = "locator2_sdemo1_govship_12"
  L1_175 = 15
  L2_176 = invokeAreaMoveTask
  L3_177 = L0_174
  L4_178 = L1_175
  L5_179 = 0
  L2_176 = L2_176(L3_177, L4_178, L5_179)
  L3_177 = Vector
  L4_178 = 84.519455
  L5_179 = 84.500565
  L6_180 = -249.057388
  L3_177 = L3_177(L4_178, L5_179, L6_180)
  L4_178 = Vector
  L5_179 = 86.47525
  L6_180 = 84.698883
  L4_178 = L4_178(L5_179, L6_180, -252.191956)
  L5_179 = {L6_180}
  L6_180 = {}
  L6_180.pos = L3_177
  L6_180.time = 8
  L6_180 = {
    {pos = L4_178, time = 8}
  }
  ep16_sdemo:play(L5_179, L6_180)
  waitSeconds(3.5)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_pc_start_dir"):getWorldPos())
  waitSeconds(1.5)
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  if L2_176 ~= nil then
    L2_176:abort()
    L2_176 = nil
  end
  if _ship_area ~= nil then
    RAC_deleteVehicle(_ship_area)
    _ship_area = nil
  end
  if velocity_task then
    velocity_task:abort()
    velocity_task = nil
  end
  waitSeconds(3)
  RAC_infoView("ep16_info_01")
  Camera:lookTo(findGameObject2("Node", "locator2_pc_start_dir"):getWorldPos(), 0, 0)
  ep16_sdemo:stop()
end
function part_a4()
  ep16_sdemo:reset()
  ep16_sdemo:set("locator2_sdemo2_camera_01", "locator2_sdemo2_target_01", false)
  ep16_sdemo:play()
end
function part_a5()
  ep16_sdemo:stop()
  ep16_a_c01_pdemo:play()
  invokeTask(function()
    Fn_playPlayerMotionWait(EP16_PLAYER_MOTION.lookaround_00)
    Fn_playPlayerMotion(EP16_PLAYER_MOTION.fighting_00, -1, 0.5)
  end)
  while not ep16_a_c01_pdemo:isEnd() do
    wait()
  end
end
function invokeVeloctiyControlTask(A0_181)
  return invokeTask(function()
    local L0_182, L1_183
    while true do
      L0_182 = _ship_area
      L1_183 = L0_182
      L0_182 = L0_182.getRemainingDist
      L0_182 = L0_182(L1_183)
      L1_183 = A0_181
      if L0_182 > 0 then
        if L0_182 < EP16_SHIP_VELOCITY_CTR_DIST then
          L1_183 = A0_181 * (L0_182 / EP16_SHIP_VELOCITY_CTR_DIST)
        end
      else
        L1_183 = 0
      end
      _ship_area:setBaseSpeed(L1_183)
      _ship_area:setCurrSpeed(L1_183)
      wait()
    end
  end)
end
function part_b1()
  if _startMissionPart == "ep16_b" then
  else
    ep16_a_c01_pdemo:stop()
    ep16_a_c01_pdemo:try_term()
    ep16_a_c01_pdemo = nil
  end
  init_skyChase(1)
end
function part_b2()
  skyChase()
  finalize_skyChase()
end
function part_b4()
  if ep16_lockon_task ~= nil then
    ep16_lockon_task:abort()
    ep16_lockon_task = nil
  end
  Player:setStay(true)
  Fn_userCtrlAllOff()
  Fn_resetPcPos("locator2_pdemo_kali_pc_01")
  ep16_b_c01_pdemo:play()
  Fn_fadein(0.5)
  while not ep16_b_c01_pdemo:isEnd() do
    wait()
  end
end
function part_b5()
  ep16_b_c01_pdemo:stop()
  ep16_b_c01_pdemo:try_term()
  ep16_b_c01_pdemo = nil
end
function part_c1()
  local L0_184, L1_185
  L0_184 = findGameObject2
  L1_185 = "EnemyGenerator"
  L0_184 = L0_184(L1_185, "enmgen2_ep16d_01")
  _enemyGen = L0_184
  L0_184 = _enemyGen
  if L0_184 ~= nil then
    L0_184 = _enemyGen
    L1_185 = L0_184
    L0_184 = L0_184.requestSpawn
    L0_184(L1_185)
    L0_184 = _enemyGen
    L1_185 = L0_184
    L0_184 = L0_184.requestIdlingEnemy
    L0_184(L1_185, true)
    L0_184 = _enemyGen
    L1_185 = L0_184
    L0_184 = L0_184.setVisible
    L0_184(L1_185, false)
    L0_184 = _enemyGen
    L1_185 = L0_184
    L0_184 = L0_184.setEnemyMarker
    L0_184(L1_185, false)
  end
  L0_184 = nil
  L1_185 = findGameObjects
  L1_185 = L1_185("GimmickBg", "cipergun01_base")
  for _FORV_5_, _FORV_6_ in pairs(L1_185) do
    if _FORV_6_:getParent() ~= nil and _FORV_6_:getParent():getTypeName() == "Puppet" and _FORV_6_:getParent():getName() == "per01" then
      L0_184 = _FORV_6_
      L0_184:setVisible(false)
      break
    end
  end
  ep16_c_c01_pdemo:play()
  while not ep16_c_c01_pdemo:isEnd() do
    wait()
  end
  ep16_c_c01_pdemo:stop(0)
  ep16_c_c01_pdemo:try_term()
  ep16_c_c01_pdemo = nil
  if _enemyGen ~= nil then
    _enemyGen:setVisible(true)
    _enemyGen:requestIdlingEnemy(true)
  end
  if L0_184 ~= nil then
    L0_184:setVisible(true)
  end
end
function part_d1()
  if _startMissionPart == "ep16_d" then
    _enemyGen = findGameObject2("EnemyGenerator", "enmgen2_ep16d_01")
    if _enemyGen ~= nil then
      print("requestSpawn.." .. _enemyGen:getName())
      _enemyGen:requestSpawn()
      _enemyGen:requestIdlingEnemy(true)
      _enemyGen:setEnemyMarker(false)
    end
  end
  _unicaPuppet = findGameObject2("Puppet", "uni01")
  _permetPuppet = findGameObject2("Puppet", "per01")
  _unicaBrain = findGameObject2("EnemyBrain", "uni01")
  _permetBrain = findGameObject2("EnemyBrain", "per01")
  _unicaBrain:setVisibleBossMarker(true)
  _permetBrain:setVisibleBossMarker(true)
  if _fatalMarker ~= nil then
    _fatalMarker:set(_permetPuppet, "bn_root", true, nil, nil, "ui_boss_hp_02")
    _fatalMarker:set(_unicaPuppet, "bn_root", true, nil, nil, "ui_boss_hp_01")
    _fatalMarker:run()
  end
end
function dispatchRequestTask()
  local L0_186, L1_187, L2_188, L3_189, L4_190
  L0_186 = {}
  for L4_190, _FORV_5_ in L1_187(L2_188) do
    if _FORV_5_ ~= nil and not _FORV_5_:isRunning() then
      table.insert(L0_186, L4_190)
    end
  end
  for L4_190, _FORV_5_ in L1_187(L2_188) do
    _requestTask[_FORV_5_]:abort()
    _requestTask[_FORV_5_] = nil
  end
end
function requestSection(A0_191)
  local L1_192
  L1_192 = _requestResult
  L1_192[A0_191] = nil
  L1_192 = _requestTask
  L1_192[A0_191] = invokeTask(function()
    _requestResult[A0_191] = ingameSection(A0_191)
  end)
end
function isPhaseEnd(A0_193)
  if _requestTask[A0_193] == nil or not _requestTask[A0_193]:isRunning() then
    return true
  end
  return false
end
function isReadyUnicaPermet()
  local L0_194
  L0_194 = false
  if _unicaBrain ~= nil and _permetBrain ~= nil and _unicaBrain:eventMessage("IsReady") and _permetBrain:eventMessage("IsReady") then
    L0_194 = true
  end
  return L0_194
end
function getEnemyIsPrepared(A0_195)
  return findGameObject2("EnemyGenerator", A0_195):isPrepared()
end
function requestIdlingEnemy(A0_196)
  if not _enemyGen then
    _enemyGen = findGameObject2("EnemyGenerator", "enmgen2_ep16d_01")
  end
  _enemyGen:requestIdlingEnemy(A0_196)
  _enemyGen:setEnemyMarker(true)
  if A0_196 == false then
    _fatalMarker:_gauge(true)
  end
end
function getMaxHealth(A0_197)
  if A0_197 == "unica" and _unicaBrain ~= nil then
    return _unicaBrain:getMaxHealth()
  elseif A0_197 == "permet" and _permetBrain ~= nil then
    return _permetBrain:getMaxHealth()
  else
    return -1
  end
end
function getHealth(A0_198)
  if A0_198 == "unica" and _unicaBrain ~= nil then
    return _unicaBrain:getHealth()
  elseif A0_198 == "permet" and _permetBrain ~= nil then
    return _permetBrain:getHealth()
  else
    return -1
  end
end
function isFatalFinish()
  return _fatalMarker:isFatalFinish()
end
function killFatalMarker()
  _fatalMarker:kill()
  _fatalMarker = nil
end
function setNpcVisible(A0_199, A1_200)
  Fn_setNpcVisible(A0_199, A1_200)
end
function lookAtNodeWait(A0_201, A1_202, A2_203)
  invokeTask(function()
    Fn_lookAtObjectWait(A0_201, A1_202, A2_203)
  end)
end
function invokeAreaMoveTask(A0_204, A1_205, A2_206)
  return invokeTask(function()
    RAC_moveVehicleWait(_ship_area, A0_204, A1_205, A2_206)
  end)
end
_chase_end = false
_chase_route = 0
STINGRAY_SPEED_DEFAULT = {
  10,
  10,
  7
}
STINGRAY_SPEED_MAX = 15
STINGRAY_ACCELE_RANGE_MAX = 40
STINGRAY_ACCELE_RANGE_MIN = 20
STINGLAY_VORTEX_SHIELD = 45
_stingray_name = "escape_stingray"
_stingray_damaged = 0
_stingray_shield = STINGLAY_VORTEX_SHIELD
_stingray_first_dmg = false
_stingrayImmortal = false
_stingrayRoute = {}
_smokeWork = {}
DECOY_LIFE = 2
DECOY_SPEED_DEFAULT = 14
DECOY_CAPTION_WAIT = 90
_decoy_destoroy = 0
_decoy_name = {}
_decoy_damaged = {}
_decoy_shield = {}
_decoy_caption_wait = 0
_terroristCaptionStop = false
_terroristCaptionTask = nil
_terroristCaptionPrio = 0
_terroristCaptionTimer = 0
_terroristCaptionIndex = 0
_TERRORIST_CAPTION_TIMER_INIT = {
  300,
  300,
  300
}
_TERRORIST_CAPTION = {
  {
    {caption = "ep16_09001", voice = "m39_004"},
    {caption = "ep16_09002", voice = "m39_005"},
    {caption = "ep16_09003", voice = "m39_006"},
    {caption = "ep16_09004", voice = "m39_007"}
  },
  {
    {caption = "ep16_09005", voice = "m39_003"},
    {caption = "ep16_09006", voice = "m39_009"}
  },
  {
    {caption = "ep16_09007", voice = "m39_006"},
    {caption = "ep16_09008", voice = "m39_007"},
    {caption = "ep16_09009", voice = "m39_008"}
  }
}
_routeEnemyMarker = {}
function init_skyChase(A0_207)
  local L1_208, L2_209
  _chase_route = A0_207
  _stingray_damaged = 0
  L1_208 = STINGLAY_VORTEX_SHIELD
  _stingray_shield = L1_208
  _stingray_first_dmg = false
  L1_208 = findGameObject2
  L2_209 = "EnemyGenerator"
  L1_208 = L1_208(L2_209, "enmgen2_escape_stingray")
  L2_209 = L1_208.requestSpawn
  L2_209(L1_208)
  L2_209 = L1_208.requestIdlingEnemy
  L2_209(L1_208, true)
  L2_209 = L1_208.setEnemyMarker
  L2_209(L1_208, false)
  while true do
    L2_209 = RAC_isReadyEnemy
    L2_209 = L2_209(L1_208)
    if L2_209 == false then
      L2_209 = wait
      L2_209()
    end
  end
  L2_209 = findGameObject2
  L2_209 = L2_209("Puppet", _stingray_name)
  L1_208:setEventListener("DamageEnemyReport", function(A0_210)
    local L1_211, L2_212, L3_213, L4_214, L5_215
    for L4_214, L5_215 in L1_211(L2_212) do
      print(L4_214, L5_215)
    end
    if L1_211 == L2_212 then
      if not L1_211 then
        L4_214 = A0_210.name
        L5_215 = findGameObject2
        L5_215 = L5_215("Puppet", L4_214)
        if L1_211 == "player" and (L2_212 == "GravityKick" or L2_212 == "GravityThrow" or L2_212 == "Penetrate" or L2_212 == "Vortex") and L4_214 == "escape_stingray" then
          invokeTask(function()
            if _chase_route == 1 then
            elseif _chase_route == 2 then
              if _stingray_first_dmg == false then
                terroristInterruptCaption({
                  {caption = "ep16_09010", voice = nil},
                  {caption = "ep16_09011", voice = nil},
                  {caption = "ep16_09012", voice = "m39_005"}
                }, 80)
                _stingray_first_dmg = true
              end
              if L2_212 == "Vortex" then
                _stingray_shield = math.max(_stingray_shield - 1, 0)
              end
              if false == true then
                _stingray_shield = STINGLAY_VORTEX_SHIELD
                _stingray_damaged = _stingray_damaged + 1
                if _stingray_damaged == 1 then
                  addSmokeEffect(L5_215, _stingray_damaged)
                  findGameObject2("Puppet", L4_214):getBrain():cmd("ChangeMoveSpeed", STINGRAY_SPEED_DEFAULT[_chase_route] - 1)
                elseif _stingray_damaged == 2 then
                  terroristInterruptCaption({
                    {caption = "ep16_09013", voice = nil},
                    {caption = "ep16_09014", voice = nil},
                    {caption = "ep16_09015", voice = "m39_008"}
                  }, 90)
                  addSmokeEffect(L5_215, _stingray_damaged)
                  findGameObject2("Puppet", L4_214):getBrain():cmd("ChangeMoveSpeed", STINGRAY_SPEED_DEFAULT[_chase_route] - 2)
                else
                  terroristInterruptCaption({
                    {caption = "ep16_09016", voice = "m39_005"}
                  }, 70)
                end
              end
            else
              if L2_212 == "Vortex" then
                _stingray_shield = math.max(_stingray_shield - 1, 0)
              end
              if false == true then
                _chase_end = true
              end
            end
          end)
        end
      end
    else
    end
  end)
  L1_208 = invokeTask
  function L2_209()
    local L0_216, L1_217
    L0_216 = findGameObject2
    L1_217 = "Puppet"
    L0_216 = L0_216(L1_217, "escape_terrorist")
    L1_217 = findGameObject2
    L1_217 = L1_217("GimmickBg", "bg2_capsule_01")
    L1_217:setActive(true)
    L1_217:setCollidablePermission(false)
    Fn_attachJoint(L1_217, L0_216, "loc_r_hand")
  end
  L1_208(L2_209)
  _decoy_destoroy = 0
  L1_208 = {}
  _decoy_name = L1_208
  L1_208 = {}
  _decoy_damaged = L1_208
  L1_208 = {}
  _decoy_shield = L1_208
  _decoy_caption_wait = 0
  L1_208 = 1
  while true do
    while true do
      L2_209 = findGameObject2
      L2_209 = L2_209("EnemyGenerator", string.format("enmgen2_decoy%02d_stingray", L1_208))
      if L2_209 ~= nil then
        L2_209:requestSpawn()
        L2_209:requestIdlingEnemy(true)
        L2_209:setEnemyMarker(false)
        while RAC_isReadyEnemy(L2_209) == false do
          wait()
        end
        findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):setActive(false)
        findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):getBrain():setActive(false)
        findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):getBrain():setEnableHomingTarget(false)
        findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):getBrain():setEnableTarget(false)
        _decoy_damaged[findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):getName()] = 0
        _decoy_shield[findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):getName()] = STINGLAY_VORTEX_SHIELD
        _decoy_name[L1_208] = findGameObject2("Puppet", string.format("decoy%02d_stingray", L1_208)):getName()
        L2_209:setEventListener("DamageEnemyReport", function(A0_218)
          local L1_219, L2_220, L3_221, L4_222, L5_223
          L1_219 = A0_218.name
          L2_220 = _decoy_name
          L3_221 = L1_208
          L2_220 = L2_220[L3_221]
          if L1_219 == L2_220 then
            L1_219 = _stingrayImmortal
            if not L1_219 then
              L1_219 = A0_218.attacker
              L2_220 = A0_218.damageType
              L3_221 = A0_218.damageHp
              L4_222 = A0_218.name
              L5_223 = findGameObject2
              L5_223 = L5_223("Puppet", L4_222)
              if L1_219 == "player" and (L2_220 == "GravityKick" or L2_220 == "GravityThrow" or L2_220 == "Penetrate" or L2_220 == "Vortex") and (L4_222 == "decoy01_stingray" or L4_222 == "decoy02_stingray" or L4_222 == "decoy03_stingray" or L4_222 == "decoy04_stingray") then
                invokeTask(function()
                  local L0_224
                  L0_224 = _decoy_caption_wait
                  if L0_224 == 0 then
                    L0_224 = {
                      {caption = "ep16_09017", voice = nil},
                      {caption = "ep16_09018", voice = nil},
                      {caption = "ep16_09019", voice = nil}
                    }
                    terroristInterruptCaption({
                      L0_224[math.random(#L0_224)]
                    }, 50)
                    _decoy_caption_wait = DECOY_CAPTION_WAIT
                  end
                  L0_224 = true
                  if L2_220 == "Vortex" then
                    _decoy_shield[L4_222] = math.max(_decoy_shield[L4_222] - 1, 0)
                    if 0 < _decoy_shield[L4_222] then
                      L0_224 = false
                    end
                  end
                  if L0_224 == true then
                    _decoy_shield[L4_222] = STINGLAY_VORTEX_SHIELD
                    _decoy_damaged[L4_222] = _decoy_damaged[L4_222] + 1
                    if _decoy_damaged[L4_222] < DECOY_LIFE then
                      addSmokeEffect(L5_223, _decoy_damaged[L4_222])
                    else
                      _decoy_destoroy = math.min(_decoy_destoroy + 1, #{
                        {caption = "ep16_09020", voice = "m39_007"},
                        {caption = "ep16_09021", voice = "m39_009"}
                      })
                      setExplodeEffect(L5_223)
                      terroristInterruptCaption({
                        ({
                          {caption = "ep16_09020", voice = "m39_007"},
                          {caption = "ep16_09021", voice = "m39_009"}
                        })[_decoy_destoroy]
                      }, 60)
                      L2_209:requestAllEnemyKill()
                    end
                  end
                end)
              end
            end
          else
          end
        end)
        L1_208 = L1_208 + 1
      end
    end
  end
end
function start_skyChase()
  setRouteStringray(_chase_route, false)
  createGem()
  RAC_naviPochiNoneStart()
end
function skyChase()
  local L0_225, L1_226
  _chase_end = false
  _terroristCaptionStop = false
  L0_225 = _TERRORIST_CAPTION_TIMER_INIT
  L0_225 = L0_225[1]
  _terroristCaptionTimer = L0_225
  _stingrayImmortal = false
  L0_225 = RAC_missionNaviCaption
  L1_226 = "ep16_09022"
  L0_225(L1_226, findGameObject2("Puppet", _stingray_name), "ep16_09023")
  while true do
    L0_225 = _chase_end
    if not L0_225 then
      L0_225 = Fn_getDistanceToPlayer
      L1_226 = findGameObject2
      L1_226 = L1_226("Puppet", _stingray_name)
      L0_225 = L0_225(L1_226, L1_226("Puppet", _stingray_name))
      if L0_225 > 100 then
        L1_226 = failedChase
        L1_226(_chase_route, "ep16_09024")
      else
        L1_226 = findGameObject2
        L1_226 = L1_226("Puppet", _stingray_name)
        if L1_226:getBrain():cmd("GetMoveCurrentIndex") >= #_stingrayRoute or L1_226:getBrain():cmd("GetMoveCurrentIndex") == -1 then
          if _chase_route == 1 then
            if L0_225 > 50 then
              failedChase(_chase_route, "ep16_09025")
            else
              Fn_kaiwaDemoView("ep16_00130k")
              Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), false)
              _chase_route = _chase_route + 1
              setRouteStringray(_chase_route, false)
              setRouteEnemySpawn(_chase_route)
              Fn_missionView("ep16_09026")
              waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
              terroristInterruptCaption({
                {caption = "ep16_09027", voice = nil}
              }, 40)
            end
          elseif _chase_route == 2 then
            if 2 > _stingray_damaged then
              failedChase(_chase_route, "ep16_09028")
            else
              _stingray_shield = STINGLAY_VORTEX_SHIELD
              _stingrayImmortal = true
              _chase_route = _chase_route + 1
              Fn_kaiwaDemoView("ep16_00140k")
              Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), false)
              Player:setStay(true)
              Fn_userCtrlAllOff()
              setRouteEnemyMarker(_chase_route, false)
              setRouteEnemytIdling(_chase_route, true)
              decoySdemo()
              setRouteStringray(_chase_route, false)
              setRouteDecoy(1, _chase_route, false)
              setRouteDecoy(2, _chase_route, false)
              setRouteDecoy(3, _chase_route, false)
              setRouteDecoy(4, _chase_route, false)
              setRouteEnemyMarker(_chase_route, true)
              setRouteEnemytIdling(_chase_route, false)
              Player:setStay(false)
              Fn_userCtrlOn()
              _stingrayImmortal = false
              Fn_missionView("ep16_09029")
              waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
              terroristInterruptCaption({
                {caption = "ep16_09030", voice = nil}
              }, 40)
            end
          else
            failedChase(_chase_route, "ep16_09031")
          end
        end
      end
      L1_226 = _chase_route
      if L1_226 == 1 then
        L1_226 = findGameObject2
        L1_226 = L1_226("Puppet", _stingray_name)
        if Fn_getDistanceToPlayer(L1_226) > STINGRAY_ACCELE_RANGE_MAX then
        elseif Fn_getDistanceToPlayer(L1_226) < STINGRAY_ACCELE_RANGE_MIN then
        else
        end
        L1_226:getBrain():cmd("ChangeMoveSpeed", STINGRAY_SPEED_DEFAULT[_chase_route] + (STINGRAY_SPEED_MAX - STINGRAY_SPEED_DEFAULT[_chase_route]) * (1 - (Fn_getDistanceToPlayer(L1_226) - STINGRAY_ACCELE_RANGE_MIN) / (STINGRAY_ACCELE_RANGE_MAX - STINGRAY_ACCELE_RANGE_MIN)))
      end
      L1_226 = terroristCaption
      L1_226(_chase_route)
      L1_226 = math
      L1_226 = L1_226.max
      L1_226 = L1_226(_decoy_caption_wait - 1, 0)
      _decoy_caption_wait = L1_226
      L1_226 = wait
      L1_226()
    end
  end
  _terroristCaptionStop = true
  L0_225 = Fn_captionViewEnd
  L0_225()
  L0_225 = Fn_naviKill
  L0_225()
  L0_225 = Player
  L1_226 = L0_225
  L0_225 = L0_225.setStay
  L0_225(L1_226, true)
  L0_225 = Fn_userCtrlAllOff
  L0_225()
  L0_225 = findGameObject2
  L1_226 = "Puppet"
  L0_225 = L0_225(L1_226, _stingray_name)
  L1_226 = RAC_LockOnObject
  L1_226 = L1_226(L0_225, 0)
  ep16_lockon_task = L1_226
  L1_226 = Sound
  L1_226 = L1_226.playSE
  L1_226(L1_226, "m39_010", 1, "")
  L1_226 = Fn_captionViewWait
  L1_226("ep16_09000")
  L1_226 = setExplodeEffect
  L1_226(L0_225)
  L1_226 = findGameObject2
  L1_226 = L1_226("EnemyGenerator", "enmgen2_escape_stingray")
  L1_226 = L1_226.requestAllEnemyKill
  L1_226(L1_226)
  L1_226 = capsule
  if L1_226 ~= nil then
    L1_226 = capsule
    L1_226 = L1_226.leaveFromParent
    L1_226(L1_226, true)
    L1_226 = capsule
    L1_226 = L1_226.setActive
    L1_226(L1_226, false)
  end
  L1_226 = waitSeconds
  L1_226(1)
  L1_226 = Fn_blackout
  L1_226(0.5)
end
function finalize_skyChase()
  local L0_227
  L0_227 = findGameObject2
  L0_227 = L0_227("EnemyGenerator", "enmgen2_escape_stingray")
  clearSmokeEffect(_stingray_name)
  L0_227:requestAllEnemyKill()
  L0_227 = 1
  while findGameObject2("EnemyGenerator", string.format("enmgen2_decoy%02d_stingray", L0_227)) ~= nil do
    clearSmokeEffect(string.format("decoy%02d_stingray", L0_227))
    findGameObject2("EnemyGenerator", string.format("enmgen2_decoy%02d_stingray", L0_227)):requestAllEnemyKill()
    L0_227 = L0_227 + 1
  end
  L0_227 = findGameObject2
  L0_227 = L0_227("EnemyGenerator", "enmgen2_enemy_stingray")
  L0_227:requestAllEnemyKill()
  L0_227 = setRouteEnemyClear
  L0_227()
  L0_227 = RAC_naviPochiNoneEnd
  L0_227()
end
function failedChase(A0_228, A1_229)
  _terroristCaptionStop = true
  _stingrayImmortal = true
  Player:setStay(true)
  Fn_userCtrlAllOff()
  Fn_captionViewWait(A1_229)
  Fn_blackout()
  Fn_naviKill()
  releaseGem()
  findGameObject2("EnemyGenerator", "enmgen2_enemy_stingray"):requestAllEnemyKill()
  Player:setStay(false)
  Fn_resetPcPos(string.format("locator2_pc_route%02d_start", A0_228))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), false)
  setRouteStringray(A0_228, true)
  setRouteEnemySpawn(A0_228)
  if A0_228 == 3 then
    findGameObject2("EnemyGenerator", "enmgen2_enemy_stingray"):requestSpawn()
    setRouteDecoy(1, A0_228, true)
    setRouteDecoy(2, A0_228, true)
    setRouteDecoy(3, A0_228, true)
    setRouteDecoy(4, A0_228, true)
    _decoy_destoroy = 0
    _decoy_caption_wait = 0
  end
  _stingray_damaged = 0
  _stingray_shield = STINGLAY_VORTEX_SHIELD
  _stingray_first_dmg = false
  createGem()
  RAC_naviPochiNoneStart()
  Fn_fadein()
  Fn_userCtrlOn()
  _stingrayImmortal = false
  _terroristCaptionStop = false
  _terroristCaptionTimer = _TERRORIST_CAPTION_TIMER_INIT[A0_228]
  if A0_228 == 1 then
    RAC_missionNaviCaption("ep16_09022", nil, "ep16_09023")
  elseif A0_228 == 2 then
    Fn_missionView("ep16_09034")
  elseif A0_228 == 3 then
    Fn_missionView("ep16_09035")
  end
end
function addSmokeEffect(A0_230, A1_231)
  local L2_232
  if A1_231 == 1 or A1_231 == 2 then
    L2_232 = A0_230.getName
    L2_232 = L2_232(A0_230)
    if _smokeWork[L2_232] == nil then
      _smokeWork[L2_232] = {}
    end
    if _smokeWork[L2_232][A1_231] == nil then
      _smokeWork[L2_232][A1_231] = {}
    end
    _smokeWork[L2_232][A1_231].task_hdl = invokeTask(function()
      _smokeWork[L2_232][A1_231].node_hdl = createGameObject2("Node")
      _smokeWork[L2_232][A1_231].node_hdl:setName("stingray_smoke_node")
      _smokeWork[L2_232][A1_231].node_hdl:try_init()
      _smokeWork[L2_232][A1_231].node_hdl:waitForReady()
      _smokeWork[L2_232][A1_231].node_hdl:try_start()
      _smokeWork[L2_232][A1_231].node_hdl:setPos(({
        Vector(1, 0, 0),
        Vector(-1, 0, 0)
      })[A1_231])
      _smokeWork[L2_232][A1_231].node_hdl:setForceMove()
      A0_230:appendChild(_smokeWork[L2_232][A1_231].node_hdl)
      _smokeWork[L2_232][A1_231].eff_hdl = RAC_createEffect({
        eff_name = "ef_bg_ent_00a",
        parent_hdl = _smokeWork[L2_232][A1_231].node_hdl,
        loop = true
      })
      _smokeWork[L2_232][A1_231].se_hdl = Sound:playSEHandle("ene_stingray_burn", 1, "", _smokeWork[L2_232][A1_231].node_hdl)
    end)
  else
  end
end
function clearSmokeEffect(A0_233)
  if _smokeWork[A0_233] ~= nil then
    for _FORV_4_, _FORV_5_ in ipairs(_smokeWork[A0_233]) do
      if _FORV_5_.task_hdl ~= nil then
        _FORV_5_.task_hdl:abort()
        _FORV_5_.task_hdl = nil
      end
      if _FORV_5_.eff_hdl ~= nil then
        _FORV_5_.eff_hdl:abort()
        _FORV_5_.eff_hdl = nil
      end
      if _FORV_5_.se_hdl ~= nil then
        Sound:stopSEHandle(_FORV_5_.se_hdl)
        _FORV_5_.se_hdl = nil
      end
      if _FORV_5_.node_hdl ~= nil then
        _FORV_5_.node_hdl:try_term()
        _FORV_5_.node_hdl = nil
      end
    end
  end
end
function setExplodeEffect(A0_234)
  clearSmokeEffect(A0_234:getName())
  Sound:playSE("ene_stingray_ep16_exp", 1, "", RAC_createEffectReadyWait({
    eff_name = "ef_com_exp_01",
    world_pos = A0_234:getWorldPos()
  }):getPosNode())
end
function setRouteStringray(A0_235, A1_236)
  local L2_237, L3_238, L4_239, L5_240, L6_241, L7_242, L8_243, L9_244, L10_245, L11_246, L12_247
  L2_237 = findGameObject2
  L3_238 = "EnemyGenerator"
  L4_239 = "enmgen2_escape_stingray"
  L2_237 = L2_237(L3_238, L4_239)
  L3_238 = findGameObject2
  L4_239 = "Puppet"
  L5_240 = _stingray_name
  L3_238 = L3_238(L4_239, L5_240)
  L5_240 = L3_238
  L4_239 = L3_238.getBrain
  L4_239 = L4_239(L5_240)
  L5_240 = 1
  L6_241 = {}
  _stingrayRoute = L6_241
  while true do
    L6_241 = string
    L6_241 = L6_241.format
    L7_242 = "locator2_stg01_route%02d_%02d"
    L8_243 = A0_235
    L9_244 = L5_240
    L6_241 = L6_241(L7_242, L8_243, L9_244)
    L7_242 = findGameObject2
    L8_243 = "Node"
    L9_244 = L6_241
    L7_242 = L7_242(L8_243, L9_244)
    if L7_242 ~= nil then
      L8_243 = table
      L8_243 = L8_243.insert
      L9_244 = _stingrayRoute
      L10_245 = L6_241
      L8_243(L9_244, L10_245)
      L5_240 = L5_240 + 1
    end
  end
  L6_241 = table
  L6_241 = L6_241.insert
  L7_242 = _stingrayRoute
  L8_243 = string
  L8_243 = L8_243.format
  L9_244 = "locator2_stg01_route%02d_end"
  L10_245 = A0_235
  L12_247 = L8_243(L9_244, L10_245)
  L6_241(L7_242, L8_243, L9_244, L10_245, L11_246, L12_247, L8_243(L9_244, L10_245))
  if A1_236 then
    L6_241 = findGameObject2
    L7_242 = "GimmickBg"
    L8_243 = "bg2_capsule_01"
    L6_241 = L6_241(L7_242, L8_243)
    L8_243 = L6_241
    L7_242 = L6_241.leaveFromParent
    L7_242(L8_243)
    L7_242 = clearSmokeEffect
    L9_244 = L3_238
    L8_243 = L3_238.getName
    L12_247 = L8_243(L9_244)
    L7_242(L8_243, L9_244, L10_245, L11_246, L12_247, L8_243(L9_244))
    L8_243 = L2_237
    L7_242 = L2_237.requestAllEnemyKill
    L7_242(L8_243)
    L7_242 = wait
    L7_242()
    L8_243 = L2_237
    L7_242 = L2_237.requestSpawn
    L7_242(L8_243)
    while true do
      L7_242 = RAC_isReadyEnemy
      L8_243 = L2_237
      L7_242 = L7_242(L8_243)
      if L7_242 == false then
        L7_242 = wait
        L7_242()
      end
    end
    L7_242 = findGameObject2
    L8_243 = "Puppet"
    L9_244 = _stingray_name
    L7_242 = L7_242(L8_243, L9_244)
    L3_238 = L7_242
    L8_243 = L3_238
    L7_242 = L3_238.getBrain
    L7_242 = L7_242(L8_243)
    L4_239 = L7_242
    L7_242 = findGameObject2
    L8_243 = "Puppet"
    L9_244 = "escape_terrorist"
    L7_242 = L7_242(L8_243, L9_244)
    L8_243 = Fn_attachJoint
    L9_244 = L6_241
    L10_245 = L7_242
    L11_246 = "loc_r_hand"
    L8_243(L9_244, L10_245, L11_246)
    L8_243 = findGameObject2
    L9_244 = "Node"
    L10_245 = string
    L10_245 = L10_245.format
    L11_246 = "locator2_stg01_route%02d_start"
    L12_247 = A0_235
    L12_247 = L10_245(L11_246, L12_247)
    L8_243 = L8_243(L9_244, L10_245, L11_246, L12_247, L10_245(L11_246, L12_247))
    L9_244 = L8_243
    L8_243 = L8_243.getWorldTransform
    L9_244 = L8_243(L9_244)
    L11_246 = L4_239
    L10_245 = L4_239.reset
    L12_247 = L8_243
    L10_245(L11_246, L12_247, L9_244)
    L11_246 = L4_239
    L10_245 = L4_239.setSpawnTransform
    L12_247 = L8_243
    L10_245(L11_246, L12_247, L9_244)
    if A0_235 == 3 then
      L10_245 = addSmokeEffect
      L11_246 = L3_238
      L12_247 = 1
      L10_245(L11_246, L12_247)
      L10_245 = addSmokeEffect
      L11_246 = L3_238
      L12_247 = 2
      L10_245(L11_246, L12_247)
    end
    L10_245 = Fn_naviSet
    L11_246 = findGameObject2
    L12_247 = "Puppet"
    L12_247 = L11_246(L12_247, _stingray_name)
    L10_245(L11_246, L12_247, L11_246(L12_247, _stingray_name))
  end
  L7_242 = L2_237
  L6_241 = L2_237.requestIdlingEnemy
  L8_243 = false
  L6_241(L7_242, L8_243)
  L7_242 = L4_239
  L6_241 = L4_239.move
  L8_243 = _stingrayRoute
  L9_244 = {}
  L10_245 = STINGRAY_SPEED_DEFAULT
  L10_245 = L10_245[A0_235]
  L9_244.speed = L10_245
  L9_244.loop = false
  L9_244.curve = true
  L6_241(L7_242, L8_243, L9_244)
  if A0_235 == 1 then
    L7_242 = L4_239
    L6_241 = L4_239.setEnableHomingTarget
    L8_243 = false
    L6_241(L7_242, L8_243)
  else
    L7_242 = L4_239
    L6_241 = L4_239.setEnableHomingTarget
    L8_243 = true
    L6_241(L7_242, L8_243)
  end
  _terroristCaptionIndex = 0
end
function setRouteDecoy(A0_248, A1_249, A2_250)
  local L3_251, L4_252, L5_253, L6_254, L7_255, L8_256, L9_257, L10_258, L11_259, L12_260, L13_261
  L3_251 = findGameObject2
  L4_252 = "EnemyGenerator"
  L5_253 = string
  L5_253 = L5_253.format
  L6_254 = "enmgen2_decoy%02d_stingray"
  L7_255 = A0_248
  L13_261 = L5_253(L6_254, L7_255)
  L3_251 = L3_251(L4_252, L5_253, L6_254, L7_255, L8_256, L9_257, L10_258, L11_259, L12_260, L13_261, L5_253(L6_254, L7_255))
  L4_252 = string
  L4_252 = L4_252.format
  L5_253 = "decoy%02d_stingray"
  L6_254 = A0_248
  L4_252 = L4_252(L5_253, L6_254)
  L5_253 = findGameObject2
  L6_254 = "Puppet"
  L7_255 = L4_252
  L5_253 = L5_253(L6_254, L7_255)
  L6_254 = nil
  if L5_253 ~= nil then
    L8_256 = L5_253
    L7_255 = L5_253.getBrain
    L7_255 = L7_255(L8_256)
    L6_254 = L7_255
  end
  L7_255 = 1
  L8_256 = {}
  while true do
    L9_257 = string
    L9_257 = L9_257.format
    L10_258 = "locator2_decoy%02d_route%02d_%02d"
    L11_259 = A0_248
    L12_260 = A1_249
    L13_261 = L7_255
    L9_257 = L9_257(L10_258, L11_259, L12_260, L13_261)
    L10_258 = findGameObject2
    L11_259 = "Node"
    L12_260 = L9_257
    L10_258 = L10_258(L11_259, L12_260)
    if L10_258 ~= nil then
      L11_259 = table
      L11_259 = L11_259.insert
      L12_260 = L8_256
      L13_261 = L9_257
      L11_259(L12_260, L13_261)
      L7_255 = L7_255 + 1
    end
  end
  L9_257 = table
  L9_257 = L9_257.insert
  L10_258 = L8_256
  L11_259 = string
  L11_259 = L11_259.format
  L12_260 = "locator2_decoy%02d_route%02d_end"
  L13_261 = A0_248
  L13_261 = L11_259(L12_260, L13_261, A1_249)
  L9_257(L10_258, L11_259, L12_260, L13_261, L11_259(L12_260, L13_261, A1_249))
  if A2_250 then
    if L5_253 ~= nil then
      L9_257 = clearSmokeEffect
      L11_259 = L5_253
      L10_258 = L5_253.getName
      L13_261 = L10_258(L11_259)
      L9_257(L10_258, L11_259, L12_260, L13_261, L10_258(L11_259))
    end
    L10_258 = L3_251
    L9_257 = L3_251.requestAllEnemyKill
    L9_257(L10_258)
    L9_257 = wait
    L9_257()
    L10_258 = L3_251
    L9_257 = L3_251.requestSpawn
    L9_257(L10_258)
    while true do
      L9_257 = RAC_isReadyEnemy
      L10_258 = L3_251
      L9_257 = L9_257(L10_258)
      if L9_257 == false then
        L9_257 = wait
        L9_257()
      end
    end
    L9_257 = findGameObject2
    L10_258 = "Puppet"
    L11_259 = L4_252
    L9_257 = L9_257(L10_258, L11_259)
    L5_253 = L9_257
    L10_258 = L5_253
    L9_257 = L5_253.getBrain
    L9_257 = L9_257(L10_258)
    L6_254 = L9_257
    L9_257 = findGameObject2
    L10_258 = "Node"
    L11_259 = string
    L11_259 = L11_259.format
    L12_260 = "locator2_decoy%02d_route%02d_start"
    L13_261 = A0_248
    L13_261 = L11_259(L12_260, L13_261, A1_249)
    L9_257 = L9_257(L10_258, L11_259, L12_260, L13_261, L11_259(L12_260, L13_261, A1_249))
    L10_258 = L9_257
    L9_257 = L9_257.getWorldTransform
    L10_258 = L9_257(L10_258)
    L12_260 = L6_254
    L11_259 = L6_254.reset
    L13_261 = L9_257
    L11_259(L12_260, L13_261, L10_258)
    L12_260 = L6_254
    L11_259 = L6_254.setSpawnTransform
    L13_261 = L9_257
    L11_259(L12_260, L13_261, L10_258)
  end
  L10_258 = L6_254
  L9_257 = L6_254.move
  L11_259 = L8_256
  L12_260 = {}
  L13_261 = DECOY_SPEED_DEFAULT
  L12_260.speed = L13_261
  L12_260.loop = false
  L12_260.curve = true
  L9_257(L10_258, L11_259, L12_260)
  L9_257 = _decoy_damaged
  L9_257[L4_252] = 0
  L9_257 = _decoy_shield
  L10_258 = STINGLAY_VORTEX_SHIELD
  L9_257[L4_252] = L10_258
end
function terroristInterruptCaptionStop()
  if _terroristCaptionTask ~= nil then
    _terroristCaptionTask:abort()
    _terroristCaptionTask = nil
  end
end
function terroristInterruptCaption(A0_262, A1_263)
  if A1_263 > _terroristCaptionPrio then
    terroristInterruptCaptionStop()
  elseif _terroristCaptionTask ~= nil then
    return
  end
  _terroristCaptionPrio = A1_263
  _terroristCaptionTask = invokeTask(function()
    local L0_264, L2_265, L3_266
    _terroristCaptionStop = true
    for _FORV_3_ = 1, #L2_265 do
      if A0_262[_FORV_3_].voice ~= nil then
        Sound:playSE(A0_262[_FORV_3_].voice, 1, "")
      end
      Fn_captionViewWait(A0_262[_FORV_3_].caption)
    end
    _terroristCaptionPrio = 0
    _terroristCaptionStop = false
  end)
end
function terroristCaption(A0_267)
  if _terroristCaptionStop == false then
    _terroristCaptionTimer = math.max(_terroristCaptionTimer - 1, 0)
    if _terroristCaptionTimer == 0 then
      _terroristCaptionIndex = _terroristCaptionIndex + 1
      if _terroristCaptionIndex < #_TERRORIST_CAPTION[A0_267] then
        _terroristCaptionTask = invokeTask(function()
          local L0_268
          L0_268 = _TERRORIST_CAPTION
          L0_268 = L0_268[A0_267]
          L0_268 = L0_268[_terroristCaptionIndex]
          if L0_268.voice ~= nil then
            Sound:playSE(L0_268.voice, 1, "")
          end
          Fn_captionViewWait(L0_268.caption)
        end)
      end
      _terroristCaptionTimer = _TERRORIST_CAPTION_TIMER_INIT[A0_267]
    end
  end
end
function decoySdemo()
  local L0_269, L1_270, L2_271, L3_272, L4_273, L5_274, L6_275, L7_276, L8_277, L9_278
  L0_269 = findGameObject2
  L0_269 = L0_269(L1_270, L2_271)
  L4_273 = {}
  _stingrayRoute = L4_273
  while true do
    L4_273 = string
    L4_273 = L4_273.format
    L5_274 = "locator2_stg01_sdemo_%02d"
    L6_275 = L3_272
    L4_273 = L4_273(L5_274, L6_275)
    L5_274 = findGameObject2
    L6_275 = "Node"
    L7_276 = L4_273
    L5_274 = L5_274(L6_275, L7_276)
    if L5_274 ~= nil then
      L6_275 = table
      L6_275 = L6_275.insert
      L7_276 = _stingrayRoute
      L8_277 = L4_273
      L6_275(L7_276, L8_277)
    end
  end
  L5_274 = L2_271
  L4_273 = L2_271.move
  L6_275 = _stingrayRoute
  L7_276 = {}
  L7_276.speed = 10
  L7_276.loop = false
  L7_276.curve = true
  L4_273(L5_274, L6_275, L7_276)
  L0_269 = {}
  for L4_273 = 1, 4 do
    L5_274 = findGameObject2
    L6_275 = "EnemyGenerator"
    L7_276 = string
    L7_276 = L7_276.format
    L8_277 = "enmgen2_decoy%02d_stingray"
    L9_278 = L4_273
    L9_278 = L7_276(L8_277, L9_278)
    L5_274 = L5_274(L6_275, L7_276, L8_277, L9_278, L7_276(L8_277, L9_278))
    L6_275 = findGameObject2
    L7_276 = "Puppet"
    L8_277 = string
    L8_277 = L8_277.format
    L9_278 = "decoy%02d_stingray"
    L9_278 = L8_277(L9_278, L4_273)
    L6_275 = L6_275(L7_276, L8_277, L9_278, L8_277(L9_278, L4_273))
    L0_269[L4_273] = L6_275
    L6_275 = L0_269[L4_273]
    L7_276 = L6_275
    L6_275 = L6_275.getBrain
    L6_275 = L6_275(L7_276)
    L7_276 = 1
    L8_277 = {}
    while true do
      L9_278 = string
      L9_278 = L9_278.format
      L9_278 = L9_278("locator2_decoy%02d_sdemo_%02d", L4_273, L7_276)
      if findGameObject2("Node", L9_278) ~= nil then
        table.insert(L8_277, L9_278)
        L7_276 = L7_276 + 1
      end
    end
    L9_278 = L0_269[L4_273]
    L9_278 = L9_278.setActive
    L9_278(L9_278, true)
    L9_278 = L6_275.setActive
    L9_278(L6_275, true)
    L9_278 = L6_275.setEnableHomingTarget
    L9_278(L6_275, true)
    L9_278 = L6_275.setEnableTarget
    L9_278(L6_275, true)
    L9_278 = L6_275.move
    L9_278(L6_275, L8_277, {
      speed = 24,
      loop = false,
      curve = true
    })
    L9_278 = L5_274.requestIdlingEnemy
    L9_278(L5_274, true)
  end
  L1_270(L2_271)
  L4_273 = L0_269[2]
  L5_274 = true
  L1_270(L2_271, L3_272, L4_273, L5_274)
  L4_273 = {}
  L4_273.pos = "locator2_sdemo_cam_02"
  L4_273.time = 4
  L4_273.hashfunc = "Linear"
  L5_274 = {}
  L5_274.pos = "locator2_sdemo_cam_03"
  L5_274.time = 1.5
  L5_274.hashfunc = "EaseIn"
  L1_270(L2_271, L3_272)
  L1_270(L2_271)
  L2_271(L3_272)
  L4_273 = true
  L2_271(L3_272, L4_273)
  L4_273 = false
  L2_271(L3_272, L4_273)
  L2_271(L3_272)
  L4_273 = _stingray_name
  L4_273 = L2_271
  while true do
    while true do
      L5_274 = L3_272
      L4_273 = L3_272.cmd
      L6_275 = "GetMoveCurrentIndex"
      L4_273 = L4_273(L5_274, L6_275)
      L5_274 = _stingrayRoute
      L5_274 = #L5_274
      if not (L4_273 >= L5_274) and L4_273 ~= -1 then
        L5_274 = wait
        L5_274()
      end
    end
  end
  repeat
    L2_271()
  until not L2_271
  L4_273 = false
  L2_271(L3_272, L4_273)
  L4_273 = true
  L2_271(L3_272, L4_273)
  L2_271(L3_272)
end
function setRouteEnemySpawn(A0_279)
  local L1_280, L2_281, L3_282, L4_283, L5_284, L6_285
  L1_280()
  for L4_283 = 1, A0_279 do
    L5_284 = _route_enemy_task
    L5_284 = L5_284[L4_283]
    if L5_284 == nil then
      L5_284 = _route_enemy_task
      L6_285 = {}
      L5_284[L4_283] = L6_285
    end
    L5_284 = 1
    while true do
      while true do
        L6_285 = findGameObject2
        L6_285 = L6_285("EnemyGenerator", string.format("enmgen2_route%02d_%02d", L4_283, L5_284))
        if L6_285 ~= nil then
          L6_285:requestSpawn()
          L6_285:requestIdlingEnemy(false)
          L6_285:setEnemyMarker(false)
          _route_enemy_task[L4_283][L5_284] = invokeTask(function()
            while RAC_isReadyEnemy(L6_285) == false do
              wait()
            end
            for _FORV_4_, _FORV_5_ in ipairs(L6_285:getSpecTable().spawnSet) do
              findGameObject2("Puppet", _FORV_5_.name):getBrain():setEnableHomingTarget(false)
            end
          end)
          L5_284 = L5_284 + 1
        end
      end
    end
  end
end
function setRouteEnemytIdling(A0_286, A1_287)
  local L2_288, L3_289, L4_290, L5_291, L6_292, L7_293
  for L5_291 = 1, A0_286 do
    L6_292 = 1
    while true do
      L7_293 = findGameObject2
      L7_293 = L7_293("EnemyGenerator", string.format("enmgen2_route%02d_%02d", L5_291, L6_292))
      if L7_293 ~= nil then
        L7_293:requestIdlingEnemy(A1_287)
        L6_292 = L6_292 + 1
      end
    end
  end
end
function setRouteEnemyClear()
  local L0_294, L1_295, L2_296, L3_297, L4_298, L5_299
  for L3_297 = 1, #L1_295 do
    L4_298 = _route_enemy_task
    L4_298 = L4_298[L3_297]
    if L4_298 == nil then
      L4_298 = _route_enemy_task
      L5_299 = {}
      L4_298[L3_297] = L5_299
    end
    L4_298 = 1
    while true do
      L5_299 = findGameObject2
      L5_299 = L5_299("EnemyGenerator", string.format("enmgen2_route%02d_%02d", L3_297, L4_298))
      if L5_299 ~= nil then
        if _route_enemy_task[L3_297][L4_298] ~= nil then
          _route_enemy_task[L3_297][L4_298]:abort()
          _route_enemy_task[L3_297][L4_298] = nil
        end
        L5_299:requestAllEnemyKill()
        L4_298 = L4_298 + 1
      end
    end
  end
end
function setRouteEnemyMarker(A0_300, A1_301)
  local L2_302, L3_303
  L2_302 = 1
  while true do
    L3_303 = findGameObject2
    L3_303 = L3_303("EnemyGenerator", string.format("enmgen2_route%02d_%02d", A0_300, L2_302))
    if L3_303 ~= nil then
      if A1_301 and _routeEnemyMarker[L2_302] then
        L3_303:setEnemyMarker(true)
      else
        L3_303:setEnemyMarker(false)
      end
      L2_302 = L2_302 + 1
    end
  end
end
function createGem()
  local L0_304, L1_305
  L0_304 = 1
  while true do
    L1_305 = "gravity_gem_"
    L1_305 = L1_305 .. string.format("%02d", L0_304)
    if RAC_createGemAsync(L1_305, GEM_ENERGY, "locator2_" .. L1_305) ~= nil then
      L0_304 = L0_304 + 1
    end
  end
end
function releaseGem()
  local L0_306
  L0_306 = 1
  while findGameObject2("Node", "locator2_gravity_gem_" .. string.format("%02d", L0_306)) ~= nil do
    if findGameObject2("Gem", "gravity_gem_" .. string.format("%02d", L0_306)) ~= nil then
      findGameObject2("Gem", "gravity_gem_" .. string.format("%02d", L0_306)):setVisible(false)
      findGameObject2("Gem", "gravity_gem_" .. string.format("%02d", L0_306)):try_term()
    end
    L0_306 = L0_306 + 1
  end
end
function pccubesensor2_route02_enmgen_OnEnter(A0_307)
  local L1_308
  L1_308 = RAC_getTailNumber
  L1_308 = L1_308(A0_307:getName(), 2)
  if findGameObject2("EnemyGenerator", string.format("enmgen2_route02_%02d", L1_308)) ~= nil then
    _routeEnemyMarker[L1_308] = true
    findGameObject2("EnemyGenerator", string.format("enmgen2_route02_%02d", L1_308)):setEnemyMarker(true)
  end
end
function pccubesensor2_route02_enmgen_OnLeave(A0_309)
  local L1_310
  L1_310 = RAC_getTailNumber
  L1_310 = L1_310(A0_309:getName(), 2)
  if findGameObject2("EnemyGenerator", string.format("enmgen2_route02_%02d", L1_310)) ~= nil then
    _routeEnemyMarker[L1_310] = false
    findGameObject2("EnemyGenerator", string.format("enmgen2_route02_%02d", L1_310)):setEnemyMarker(false)
  end
end
