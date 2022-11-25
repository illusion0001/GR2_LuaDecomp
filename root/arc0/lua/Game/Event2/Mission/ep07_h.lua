dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
_puppet_tbl = {}
_sdemo = nil
_pdemo_01 = nil
enmgen2_01_enemychange_01 = {
  spawnOnStart = false,
  spawn_count = 0,
  ash_count = 0,
  dead_count = 0,
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().ash_count = A0_0:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_2, A1_3)
    A0_2:getSpecTable().dead_count = A0_2:getSpecTable().dead_count + 1
  end
}
enmgen2_02_enemychange_01 = {
  spawnOnStart = false,
  spawn_count = 0,
  ash_count = 0,
  dead_count = 0,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "weak_02_01_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_02",
      name = "weak_02_01_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_03",
      name = "weak_02_01_01_03"
    }
  },
  onObjectAsh = function(A0_4, A1_5)
    A0_4:getSpecTable().ash_count = A0_4:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_6, A1_7)
    A0_6:getSpecTable().dead_count = A0_6:getSpecTable().dead_count + 1
  end
}
enmgen2_03_01 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_01_01_01",
      target_vehicle = "landingship_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_01_01_02",
      target_vehicle = "landingship_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_01_01_03",
      target_vehicle = "landingship_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_01_01_04",
      target_vehicle = "landingship_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_01_01_05",
      target_vehicle = "landingship_03_01"
    }
  },
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().ash_count = A0_8:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_10, A1_11)
    A0_10:getSpecTable().dead_count = A0_10:getSpecTable().dead_count + 1
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      A0_12:getSpecTable().spawnSet[2].name,
      A0_12:getSpecTable().spawnSet[3].name,
      A0_12:getSpecTable().spawnSet[4].name,
      A0_12:getSpecTable().spawnSet[5].name,
      A0_12:getSpecTable().spawnSet[6].name
    }, 5, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_03_02 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_03_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_01_01",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_01_02",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_01_03",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_01_04",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_01_05",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_03_02_02_01",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_02_02",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_02_03",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_02_04",
      target_vehicle = "landingship_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_03_02_02_05",
      target_vehicle = "landingship_03_02"
    }
  },
  onObjectAsh = function(A0_16, A1_17)
    A0_16:getSpecTable().ash_count = A0_16:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_18, A1_19)
    A0_18:getSpecTable().dead_count = A0_18:getSpecTable().dead_count + 1
  end,
  onSetupGem = function(A0_20, A1_21)
    Fn_enemyPopGemSetup(A0_20, {
      A0_20:getSpecTable().spawnSet[7].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_22, A1_23)
    Fn_enemyAshPopGem(A0_22, A1_23)
  end
}
enmgen2_04_01 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_04_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_04_01_01_01",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_01_02",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_01_03",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_01_04",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_01_05",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_01",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_02",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_03",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_04",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_05",
      target_vehicle = "landingship_04_01"
    }
  },
  onObjectAsh = function(A0_24, A1_25)
    A0_24:getSpecTable().ash_count = A0_24:getSpecTable().ash_count + 1
  end,
  onObjectDead = function(A0_26, A1_27)
    A0_26:getSpecTable().dead_count = A0_26:getSpecTable().dead_count + 1
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {
      A0_28:getSpecTable().spawnSet[2].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
function Initialize()
  local L0_32
  L0_32 = Fn_setNpcActive
  L0_32("ep07_sis_01", false)
  L0_32 = Fn_setNpcActive
  L0_32("ep07_gawa_01", false)
  L0_32 = Fn_windmillBroken
  L0_32()
  L0_32 = {
    {
      name = "ep07_npc_soldier_01_01_01",
      type = "soldier",
      node = "locator2_soldier_01_01_01",
      active = false
    },
    {
      name = "ep07_npc_soldier_01_01_02",
      type = "soldier",
      node = "locator2_soldier_01_01_02",
      active = false
    },
    {
      name = "ep07_npc_soldier_01_01_03",
      type = "soldier",
      node = "locator2_soldier_01_01_03",
      active = false
    },
    {
      name = "ep07_npc_soldier_01_01_04",
      type = "soldier",
      node = "locator2_soldier_01_01_04",
      active = false
    },
    {
      name = "ep07_npc_soldier_01_01_05",
      type = "soldier",
      node = "locator2_soldier_01_01_05",
      active = false
    },
    {
      name = "ep07_npc_soldier_02_01_01",
      type = "soldier",
      node = "locator2_soldier_02_01_01",
      active = false
    },
    {
      name = "ep07_npc_soldier_02_01_02",
      type = "soldier",
      node = "locator2_soldier_02_01_02",
      active = false
    },
    {
      name = "ep07_npc_soldier_02_01_03",
      type = "soldier",
      node = "locator2_soldier_02_01_03",
      active = false
    }
  }
  Fn_setupNpc(L0_32)
  for _FORV_4_, _FORV_5_ in pairs(L0_32) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo = SDemo.create("ep07_sdemo")
  _pdemo_01 = PDemo.create("ep07_b_c01", Fn_findAreaHandle("po_a_01"), {camera = true, scene_param = false})
end
function Ingame()
  local L0_33, L1_34, L2_35, L3_36, L4_37, L5_38, L6_39
  L0_33 = Fn_userCtrlAllOff
  L0_33()
  L0_33 = Fn_resetPcPos
  L0_33(L1_34, L2_35)
  L0_33 = Fn_setCatWarpCheckPoint
  L0_33(L1_34)
  L0_33 = Fn_sendEventComSb
  L0_33(L1_34, L2_35, L3_36)
  repeat
    L0_33 = wait
    L0_33()
    L0_33 = _puppet_tbl
    L0_33.pup_crow = L1_34
    L0_33 = _puppet_tbl
    L0_33 = L0_33.pup_crow
  until L0_33 ~= nil
  L0_33 = _puppet_tbl
  L0_33 = L0_33.pup_crow
  L0_33 = L0_33.getBrain
  L0_33 = L0_33(L1_34)
  L2_35(L3_36, L4_37, L5_38)
  L0_33 = crowSetIdle
  L0_33(L1_34, L2_35)
  L0_33 = Fn_playSupporterEventMotion
  L0_33(L1_34, L2_35, L3_36, L4_37)
  L0_33 = {L1_34, L2_35}
  L1_34.ash_enmgen_name = "enmgen2_01_enemychange_01"
  L3_36.npc_name = "ep07_npc_soldier_01_01_01"
  L3_36.move_prefix = "locator2_soldier_01_01_01_move_"
  L4_37.npc_name = "ep07_npc_soldier_01_01_02"
  L4_37.move_prefix = "locator2_soldier_01_01_02_move_"
  L5_38.npc_name = "ep07_npc_soldier_01_01_03"
  L5_38.move_prefix = "locator2_soldier_01_01_03_move_"
  L6_39.npc_name = "ep07_npc_soldier_01_01_04"
  L6_39.move_prefix = "locator2_soldier_01_01_04_move_"
  L1_34.npc_data = L2_35
  L2_35.ash_enmgen_name = "enmgen2_02_enemychange_01"
  L4_37.npc_name = "ep07_npc_soldier_02_01_01"
  L4_37.move_prefix = "locator2_soldier_02_01_01_move_"
  L5_38.npc_name = "ep07_npc_soldier_02_01_02"
  L5_38.move_prefix = "locator2_soldier_02_01_02_move_"
  L6_39.npc_name = "ep07_npc_soldier_02_01_03"
  L6_39.move_prefix = "locator2_soldier_02_01_03_move_"
  L2_35.npc_data = L3_36
  L2_35(L3_36)
  L2_35()
  L1_34(L2_35)
  for L4_37, L5_38 in L1_34(L2_35) do
    for _FORV_9_, _FORV_10_ in L6_39(L5_38.npc_data) do
      Fn_setGrabNpc(_FORV_10_.npc_name, false, true)
      Fn_findNpc(_FORV_10_.npc_name):setIgnoreGrabThrow(false)
    end
  end
  for L4_37, L5_38 in L1_34(L2_35) do
    for _FORV_10_, _FORV_11_ in ipairs(L5_38.npc_data) do
      Fn_findNpc(_FORV_11_.npc_name):changeEnemy()
      Fn_findNpc(_FORV_11_.npc_name):setEnemyGenerator(L6_39)
    end
    L6_39:getSpecTable().spawn_count = #L5_38.npc_data
  end
  L3_36(L4_37)
  L3_36()
  while true do
    L4_37()
    if L4_37 ~= nil then
    end
    if not (L5_38 <= L6_39) then
    end
  end
  L4_37(L5_38)
  L4_37(L5_38)
  L4_37(L5_38)
  L4_37(L5_38)
  for _FORV_7_, _FORV_8_ in L4_37(L5_38) do
    _enm_landingship_work[_FORV_7_].enmgen:requestAllEnemyKill()
  end
  for _FORV_7_, _FORV_8_ in L4_37(L5_38) do
    for _FORV_12_, _FORV_13_ in ipairs(_FORV_8_.npc_data) do
      if Fn_findNpcPuppet(_FORV_13_.npc_name) ~= nil then
        Fn_findNpc(_FORV_13_.npc_name):changeNpc()
        Fn_setNpcActive(_FORV_13_.npc_name, false)
      end
    end
  end
  L4_37(L5_38)
  L4_37(L5_38)
  L4_37(L5_38, L6_39)
  L4_37()
  L4_37.pup_crow = nil
  L4_37()
  L4_37()
  L4_37()
  L4_37()
end
function Finalize()
  local L0_40, L1_41
end
function invokeEnemyManageTask()
  return invokeTask(function()
    local L0_42, L1_43, L2_44, L3_45, L4_46
    L0_42 = setupNpcToEnmEnemyGenerator
    L4_46 = L1_43(L2_44, L3_45)
    L0_42(L1_43, L2_44, L3_45, L4_46, L1_43(L2_44, L3_45))
    L0_42 = setupNpcToEnmEnemyGenerator
    L4_46 = L1_43(L2_44, L3_45)
    L0_42(L1_43, L2_44, L3_45, L4_46, L1_43(L2_44, L3_45))
    L0_42 = {L1_43}
    L4_46 = "weak_03_01_01_03"
    L4_46 = "locator2_landingship_03_01_move_c_02"
    L4_46 = "enmgen2_03_01"
    L3_45(L4_46, nil, nil, L0_42, L1_43, nil, nil, L2_44)
    L0_42 = {
      L1_43,
      L2_44,
      L3_45
    }
    L4_46 = "weak_03_02_01_03"
    L4_46 = "locator2_landingship_03_02_move_b_02_02"
    L4_46 = "weak_03_02_02_01"
    L4_46 = {
      "locator2_landingship_03_02_move_c_01",
      "locator2_landingship_03_02_move_c_02"
    }
    startLandingshipMove("enmgen2_03_02", nil, nil, L0_42, L1_43, L2_44, L3_45, L4_46)
    while true do
      L0_42 = _enm_landingship_work
      L0_42 = L0_42.enmgen2_03_02
      L0_42 = L0_42.is_opened1
      if L0_42 ~= true then
        L0_42 = wait
        L0_42()
      end
    end
    L0_42 = 0
    repeat
      L1_43()
      L0_42 = 0
      for L4_46, _FORV_5_ in L1_43(L2_44) do
        L0_42 = L0_42 + _FORV_5_.enmgen:getSpecTable().ash_count
      end
      for L4_46, _FORV_5_ in L1_43(L2_44) do
        L0_42 = L0_42 + _FORV_5_.enmgen:getSpecTable().ash_count
      end
    until L0_42 >= 10
    L0_42 = {L1_43, L2_44}
    L4_46 = "weak_04_01_01_03"
    L4_46 = "weak_04_01_02_01"
    L4_46 = {
      "locator2_landingship_04_01_move_c_01",
      "locator2_landingship_04_01_move_c_02",
      "locator2_landingship_04_01_move_c_02"
    }
    startLandingshipMove("enmgen2_04_01", nil, nil, L0_42, L1_43, L2_44, L3_45, L4_46)
  end)
end
function playSdemo06(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58
  L1_48 = mother2
  L2_49 = L1_48
  L1_48 = L1_48.sendEvent
  L3_50 = "getBackgroundElement2Handle"
  L4_51 = "port"
  L1_48 = L1_48(L2_49, L3_50, L4_51)
  L3_50 = L1_48
  L2_49 = L1_48.findSubArea
  L4_51 = "po_a_01"
  L2_49 = L2_49(L3_50, L4_51)
  L3_50 = mother2
  L4_51 = L3_50
  L3_50 = L3_50.sendEvent
  L5_52 = "getBackgroundElement2Handle"
  L3_50 = L3_50(L4_51, L5_52, L6_53)
  L5_52 = L3_50
  L4_51 = L3_50.findSubArea
  L4_51 = L4_51(L5_52, L6_53)
  L5_52 = L2_49.setDriftEnable
  L5_52(L6_53, L7_54)
  L5_52 = L4_51.setDriftEnable
  L5_52(L6_53, L7_54)
  L5_52 = _sdemo
  L5_52 = L5_52.reset
  L5_52(L6_53)
  L5_52 = _sdemo
  L5_52 = L5_52.set
  L10_57 = Vector
  L11_58 = 0
  L11_58 = L10_57(L11_58, 1, 0)
  L5_52(L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L10_57(L11_58, 1, 0))
  L5_52 = _sdemo
  L5_52 = L5_52.play
  L5_52(L6_53)
  L5_52 = Fn_missionStart
  L5_52()
  L5_52 = waitSeconds
  L5_52(L6_53)
  L5_52 = Fn_kaiwaDemoView
  L5_52(L6_53)
  L5_52 = {}
  for L9_56, L10_57 in L6_53(L7_54) do
    L11_58 = Fn_setNpcActive
    L11_58(L10_57.npc_name, true)
    L11_58 = table
    L11_58 = L11_58.insert
    L11_58(L5_52, RAC_invokeMoveCharaTask(L10_57.npc_name, L10_57.move_prefix, {runLength = -1}))
  end
  L9_56.pos = "locator2_sdemo_06_cam_02"
  L9_56.time = 1
  L9_56.hashfunc = "EaseOut"
  L10_57 = {}
  L10_57.pos = "locator2_sdemo_06_aim_01"
  L10_57.time = 1
  L10_57.hashfunc = "EaseOut"
  L6_53(L7_54, L8_55, L9_56)
  while true do
    if L6_53 then
      L6_53()
    end
  end
  L6_53(L7_54)
  L9_56.pos = "locator2_sdemo_06_cam_03"
  L9_56.time = 1
  L9_56.hashfunc = "EaseOut"
  L10_57 = {}
  L10_57.pos = "locator2_sdemo_06_aim_02"
  L10_57.time = 1
  L10_57.hashfunc = "EaseOut"
  L6_53(L7_54, L8_55, L9_56)
  while true do
    if L6_53 then
      L6_53()
    end
  end
  L6_53(L7_54)
  for L9_56, L10_57 in L6_53(L7_54) do
    L11_58 = Fn_setNpcActive
    L11_58(L10_57.npc_name, true)
    L11_58 = invokeTask
    L11_58 = L11_58(function()
      local L0_59, L1_60
      L0_59 = {}
      L1_60 = 1
      while findGameObject2("Node", L10_57.move_prefix .. string.format("%02d", L1_60)) ~= nil do
        L0_59[L1_60] = {
          pos = findGameObject2("Node", L10_57.move_prefix .. string.format("%02d", L1_60)):getName()
        }
        do break end
        do break end
        L1_60 = L1_60 + 1
      end
      Fn_findNpc(L10_57.npc_name):setMoveOption({runLength = -1})
      Fn_findNpc(L10_57.npc_name):move(L0_59, {goalDirection = true})
      repeat
        wait()
      until Fn_findNpc(L10_57.npc_name):isMoveEnd()
    end)
    table.insert(L5_52, L11_58)
    break
  end
  L10_57 = {}
  L10_57.pos = "locator2_sdemo_06_aim_03"
  L10_57.time = 1
  L10_57.hashfunc = "EaseOut"
  L6_53(L7_54, L8_55, L9_56)
  while true do
    while true do
      if L6_53 then
        L6_53()
      end
    end
  end
  while true do
    for L10_57, L11_58 in L7_54(L8_55) do
      if L11_58:isRunning() then
        break
      end
    end
    if L6_53 ~= true then
      L7_54()
    end
  end
  for L9_56, L10_57 in L6_53(L7_54) do
    L11_58 = L5_52[L9_56]
    L11_58 = L11_58.abort
    L11_58(L11_58)
  end
  L5_52 = L6_53
  L6_53(L7_54, L8_55)
  L6_53(L7_54)
  L9_56.pos = "locator2_sdemo_06_cam_04"
  L9_56.time = 1
  L9_56.hashfunc = "EaseOut"
  L10_57 = {}
  L11_58 = Fn_getPlayer
  L11_58 = L11_58()
  L10_57.pos = L11_58
  L10_57.time = 1
  L10_57.hashfunc = "EaseOut"
  L6_53(L7_54, L8_55, L9_56)
  while true do
    if L6_53 then
      L6_53()
    end
  end
  L10_57 = "locator2_sdemo_06_aim_03"
  L10_57 = 0.5
  L6_53(L7_54, L8_55, L9_56, L10_57)
  L6_53(L7_54, L8_55)
  L6_53(L7_54, L8_55)
  L6_53(L7_54, L8_55)
end
function playSdemo07()
  Fn_userCtrlOff()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
  Fn_coercionPoseNomal()
  Fn_sendEventComSb("setBattleRabgeEnable", false)
  Area:setEnableLoading(false)
  Fn_getPlayer():setCollidable(false)
  Area:setAreaFree()
  Time:setInGameDeltaSec(0)
  wait()
  Fn_resetArea()
  Fn_findAreaHandle("po_a_01"):setDriftEnable(false)
  Fn_findAreaHandle("bu_a_09"):setDriftEnable(false)
  Fn_getPlayer():setVisible(false)
  Fn_setCatActive(false)
  Fn_resetPcPos("warppoint2_pc_03")
  Area:setEnableLoading(true)
  _pdemo_01:play()
  Fn_fadein(0.5)
  _puppet_tbl.pup_crow:setActive(false)
  _puppet_tbl.pup_crow:getBrain():warpToNode(findGameObject2("Node", "warppoint2_crow_sdemo_07_01"), Supporter.FirstAction.Ground)
  while not _pdemo_01:isEnd() do
    wait()
  end
  Fn_kaiwaDemoView("ep07_00350k")
  _pdemo_01:stop(0)
  _pdemo_01:try_term()
  _pdemo_01 = nil
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_07_cam_01", "locator2_sdemo_07_aim_01")
  _sdemo:play()
  Fn_getPlayer():setVisible(true)
  Fn_setCatActive(true)
  _puppet_tbl.pup_crow:setActive(true)
  Fn_resetCoercionPose()
  waitSeconds(0.5)
  while Fn_sendEventComSb("isButtleInitEnd") == false do
    wait()
  end
  Fn_sendEventComSb("requestSpawnBattleEnemyIdle")
  Fn_findAreaHandle("po_a_01"):setDriftEnable(true)
  Fn_findAreaHandle("bu_a_09"):setDriftEnable(true)
  _sdemo:stop(1)
  waitSeconds(1)
  Fn_sendEventComSb("setBattleRabgeEnable", true)
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  Fn_userCtrlOn()
end
