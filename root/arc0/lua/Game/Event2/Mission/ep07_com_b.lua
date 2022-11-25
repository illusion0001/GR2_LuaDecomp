dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
PHASE_WAIT = 0
PHASE_BATTLE_INIT = 1
PHASE_BATTLE_INIT_END = 2
PHASE_BATTLE_IDLE = 3
PHASE_BATTLE_READY = 4
PHASE_BATTLE = 5
PHASE_BATTLE_END = 6
_phase = PHASE_WAIT
_start_mission_part = nil
_pup_crow = nil
_load_crow_task = nil
_crow_is_loaded = false
_battle_range_enable = true
enmgen2_i_01_01 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_i_01_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_i_01_01_01_01",
      target_vehicle = "landingship_i_01_01",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_i_01_01_01_02",
      target_vehicle = "landingship_i_01_01",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "pilot_i_01_01_01",
      target_vehicle = "mech_i_01_01_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "pilot_i_01_01_02",
      target_vehicle = "mech_i_01_01_01_02"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    enmgenOnObjectAsh(A0_0, A1_1)
  end,
  onObjectDead = function(A0_2, A1_3)
    enmgenOnObjectDead(A0_2, A1_3)
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {
      A0_4:getSpecTable().spawnSet[2].name,
      A0_4:getSpecTable().spawnSet[3].name
    }, 2, GEM_SPECIAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_i_01_02 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_i_01_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_01_01",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_01_02",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_01_03",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_01_04",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_01_05",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_i_01_02_02_01",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_02_02",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_02_03",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_02_04",
      target_vehicle = "landingship_i_01_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_01_02_02_05",
      target_vehicle = "landingship_i_01_02"
    }
  },
  onObjectAsh = function(A0_8, A1_9)
    enmgenOnObjectAsh(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
    enmgenOnObjectDead(A0_10, A1_11)
  end
}
enmgen2_i_02_01 = {
  spawnOnStart = false,
  spawn_count = 0,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_01",
      name = "weak_i_02_01_01_01"
    }
  },
  onSpawn = function(A0_12, A1_13)
    A0_12:getSpecTable().spawn_count = A0_12:getSpecTable().spawn_count + 1
  end,
  onObjectAsh = function(A0_14, A1_15)
    enmgenOnObjectAsh(A0_14, A1_15)
  end,
  onObjectDead = function(A0_16, A1_17)
    enmgenOnObjectDead(A0_16, A1_17)
  end
}
enmgen2_i_02_02 = {
  spawnOnStart = false,
  spawn_count = 0,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "weak_i_02_02_01_01"
    }
  },
  onSpawn = function(A0_18, A1_19)
    A0_18:getSpecTable().spawn_count = A0_18:getSpecTable().spawn_count + 1
  end,
  onObjectAsh = function(A0_20, A1_21)
    enmgenOnObjectAsh(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
    enmgenOnObjectDead(A0_22, A1_23)
  end
}
enmgen2_i_02_03 = {
  spawnOnStart = false,
  spawn_count = 0,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "weak_i_02_03_01_01"
    }
  },
  onSpawn = function(A0_24, A1_25)
    A0_24:getSpecTable().spawn_count = A0_24:getSpecTable().spawn_count + 1
  end,
  onObjectAsh = function(A0_26, A1_27)
    enmgenOnObjectAsh(A0_26, A1_27)
  end,
  onObjectDead = function(A0_28, A1_29)
    enmgenOnObjectDead(A0_28, A1_29)
  end
}
enmgen2_i_03_01 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_i_03_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_01_01",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_01_02",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_01_03",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_01_04",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_01_05",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_i_03_01_02_01",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_02_02",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_02_03",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_02_04",
      target_vehicle = "landingship_i_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_03_01_02_05",
      target_vehicle = "landingship_i_03_01"
    }
  },
  onObjectAsh = function(A0_30, A1_31)
    enmgenOnObjectAsh(A0_30, A1_31)
  end,
  onObjectDead = function(A0_32, A1_33)
    enmgenOnObjectDead(A0_32, A1_33)
  end
}
enmgen2_i_04_01 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_i_04_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_i_04_01_01_01",
      target_vehicle = "landingship_i_04_01",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "pilot_i_04_01_01",
      target_vehicle = "mech_i_04_01_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_01_01_01",
      target_vehicle = "landingship_i_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_01_01_02",
      target_vehicle = "landingship_i_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_01_01_03",
      target_vehicle = "landingship_i_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_01_01_04",
      target_vehicle = "landingship_i_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_01_01_05",
      target_vehicle = "landingship_i_04_01"
    }
  },
  onObjectAsh = function(A0_34, A1_35)
    enmgenOnObjectAsh(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
    enmgenOnObjectDead(A0_36, A1_37)
  end,
  onSetupGem = function(A0_38, A1_39)
    Fn_enemyPopGemSetup(A0_38, {
      A0_38:getSpecTable().spawnSet[2].name
    }, 1, GEM_SPECIAL)
  end,
  onPopGem = function(A0_40, A1_41)
    Fn_enemyAshPopGem(A0_40, A1_41)
  end
}
enmgen2_i_04_02 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_i_04_02"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_i_04_02_01_01",
      target_vehicle = "landingship_i_04_02",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "pilot_i_04_02_01",
      target_vehicle = "mech_i_04_02_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_02_01_01",
      target_vehicle = "landingship_i_04_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_02_01_02",
      target_vehicle = "landingship_i_04_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_02_01_03",
      target_vehicle = "landingship_i_04_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_02_01_04",
      target_vehicle = "landingship_i_04_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_04_02_01_05",
      target_vehicle = "landingship_i_04_02"
    }
  },
  onObjectAsh = function(A0_42, A1_43)
    enmgenOnObjectAsh(A0_42, A1_43)
  end,
  onObjectDead = function(A0_44, A1_45)
    enmgenOnObjectDead(A0_44, A1_45)
  end,
  onSetupGem = function(A0_46, A1_47)
    Fn_enemyPopGemSetup(A0_46, {
      A0_46:getSpecTable().spawnSet[2].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_48, A1_49)
    Fn_enemyAshPopGem(A0_48, A1_49)
  end
}
enmgen2_i_05_01 = {
  spawnOnStart = false,
  ash_count = 0,
  dead_count = 0,
  mechsmall_dead_count = 0,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_i_05_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_i_05_01_01_01",
      target_vehicle = "landingship_i_05_01",
      navi_mesh_name = "po_a_01_custom01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "pilot_i_05_01_01",
      target_vehicle = "mech_i_05_01_01_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "weak_i_05_01_01_01",
      target_vehicle = "landingship_i_05_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator_crew_01",
      name = "weak_i_05_01_01_02",
      target_vehicle = "landingship_i_05_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_05_01_01_03",
      target_vehicle = "landingship_i_05_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_05_01_01_04",
      target_vehicle = "landingship_i_05_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_i_05_01_01_05",
      target_vehicle = "landingship_i_05_01"
    }
  },
  onObjectAsh = function(A0_50, A1_51)
    enmgenOnObjectAsh(A0_50, A1_51)
  end,
  onObjectDead = function(A0_52, A1_53)
    enmgenOnObjectDead(A0_52, A1_53)
  end,
  onSetupGem = function(A0_54, A1_55)
    Fn_enemyPopGemSetup(A0_54, {
      A0_54:getSpecTable().spawnSet[2].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57)
  end
}
function Initialize()
  local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63
  L0_58 = Fn_getMissionPart
  L0_58 = L0_58()
  _start_mission_part = L0_58
  L0_58 = Fn_pcSensorOn
  L0_58(L1_59)
  L0_58 = Fn_pcSensorOn
  L0_58(L1_59)
  L0_58 = {
    L1_59,
    L2_60,
    L3_61,
    L4_62,
    L5_63,
    "bu_a_14_01",
    "bu_a_14_02",
    "ve_crane_root"
  }
  L4_62 = "bu_a_09"
  L5_63 = "bu_a_12_01"
  for L4_62, L5_63 in L1_59(L2_60) do
    Fn_findAreaHandle(L5_63):setExpandedAabb(true)
  end
  L0_58 = loadFileAsset
  L0_58 = L0_58(L1_59, L2_60)
  if L0_58 ~= nil then
    L1_59(L2_60)
    if L1_59 ~= nil then
      L4_62 = L0_58
      L2_60(L3_61, L4_62)
    end
  end
end
function Ingame()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72, L9_73
  while true do
    L0_64 = _phase
    L1_65 = PHASE_WAIT
    if L0_64 == L1_65 then
    else
      L0_64 = _phase
      L1_65 = PHASE_BATTLE_INIT
      if L0_64 == L1_65 then
        L0_64 = {
          L1_65,
          L2_66,
          L3_67,
          L4_68,
          L5_69,
          L6_70
        }
        L1_65 = "enmgen2_i_01_01"
        L2_66 = "enmgen2_i_01_02"
        L3_67 = "enmgen2_i_03_01"
        L1_65 = loadLandingshipEnemy
        L2_66 = L0_64
        L1_65(L2_66)
        L1_65 = {
          L2_66,
          L3_67,
          L4_68
        }
        L2_66 = "enmgen2_i_02_01"
        L3_67 = "enmgen2_i_02_02"
        L2_66 = loadGroundEnemy
        L3_67 = L1_65
        L2_66(L3_67)
        L2_66 = PHASE_BATTLE_INIT_END
        _phase = L2_66
      else
        L0_64 = _phase
        L1_65 = PHASE_BATTLE_INIT_END
        if L0_64 == L1_65 then
        else
          L0_64 = _phase
          L1_65 = PHASE_BATTLE_IDLE
          if L0_64 == L1_65 then
            L0_64 = spawnLandingshipEnemyIdle
            L0_64()
            L0_64 = PHASE_BATTLE_READY
            _phase = L0_64
          else
            L0_64 = _phase
            L1_65 = PHASE_BATTLE_READY
            if L0_64 == L1_65 then
            else
              L0_64 = _phase
              L1_65 = PHASE_BATTLE
              if L0_64 == L1_65 then
                L0_64 = invokeEnemyManageTask
                L0_64 = L0_64()
                L1_65 = invokeEnemyMarkerTask
                L1_65 = L1_65()
                L2_66 = 0
                L3_67 = 0
                for L7_71, L8_72 in L4_68(L5_69) do
                  L2_66 = L2_66 + #L9_73 - 1
                  for _FORV_13_, _FORV_14_ in ipairs(L9_73) do
                    if _FORV_14_.type == "mechsmall" then
                      L3_67 = L3_67 + 1
                    end
                  end
                end
                for L7_71, L8_72 in L4_68(L5_69) do
                  L2_66 = L2_66 + #L9_73
                  for _FORV_13_, _FORV_14_ in ipairs(L9_73) do
                    if _FORV_14_.type == "mechsmall" then
                      L3_67 = L3_67 + 1
                    end
                  end
                end
                L2_66 = L4_68
                while true do
                  L4_68()
                  for _FORV_10_, _FORV_11_ in L7_71(L8_72) do
                  end
                  for _FORV_10_, _FORV_11_ in L7_71(L8_72) do
                  end
                  if not (L2_66 <= L7_71) or not (L3_67 <= L6_70) then
                  end
                end
                L4_68(L5_69)
                L0_64 = nil
                L4_68(L5_69)
                L1_65 = nil
                _phase = L4_68
              else
                L0_64 = _phase
                L1_65 = PHASE_BATTLE_END
                if L0_64 == L1_65 then
                end
              end
            end
          end
        end
      end
    end
    L0_64 = wait
    L0_64()
  end
end
function Finalize()
  local L0_74, L1_75, L2_76, L3_77, L4_78, L5_79
  L0_74 = Fn_pcSensorOff
  L0_74(L1_75)
  L0_74 = Fn_pcSensorOff
  L0_74(L1_75)
  L0_74 = {
    L1_75,
    L2_76,
    L3_77,
    L4_78,
    L5_79,
    "bu_a_14_01",
    "bu_a_14_02",
    "ve_crane_root"
  }
  L4_78 = "bu_a_09"
  L5_79 = "bu_a_12_01"
  for L4_78, L5_79 in L1_75(L2_76) do
    Fn_findAreaHandle(L5_79):setExpandedAabb(false)
  end
end
function invokeEnemyManageTask()
  return invokeTask(function()
    local L0_80, L1_81, L2_82, L3_83, L4_84, L5_85, L6_86
    L0_80 = {L1_81}
    L3_83(L4_84, L5_85, L6_86, nil, nil, nil, nil, L2_82)
    L0_80 = {
      L1_81,
      L2_82,
      L3_83
    }
    L5_85(L6_86, nil, nil, L0_80, L1_81, L2_82, L3_83, L4_84)
    while true do
      L0_80 = _enm_landingship_work
      L0_80 = L0_80.enmgen2_i_01_02
      L0_80 = L0_80.is_opened1
      if L0_80 ~= true then
        L0_80 = wait
        L0_80()
      end
    end
    L0_80 = {}
    for L4_84 = 1, 3 do
      invokeTask(function()
        while Fn_isInSightTarget(L6_86, 1) == true and RAC_RaycastEyeSight(L6_86, Fn_get_distance_angle(Fn_getPlayerWorldPos(), L6_86:getWorldPos()) + 1, 60, 1, 0, 1) == true do
          wait()
        end
        spawnGroundEnemyIdle(L5_85)
        _ground_enm_work[L5_85].enmgen:requestIdlingEnemy(false)
        L0_80[L5_85] = true
      end)
      break
    end
    while true do
      while true do
        if L1_81 ~= true then
          L1_81()
        end
      end
    end
    while true do
      if L1_81 == false then
        L1_81()
      end
    end
    L6_86("enmgen2_i_03_01", nil, nil, L1_81, L2_82, L3_83, L4_84, L5_85)
    L1_81(L2_82)
    while true do
      if L1_81 ~= true then
        L1_81()
      end
    end
    for _FORV_7_, _FORV_8_ in L4_84(L5_85) do
    end
    for _FORV_7_, _FORV_8_ in L4_84(L5_85) do
    end
    repeat
      L6_86()
      for _FORV_9_, _FORV_10_ in L6_86(L1_81) do
      end
      for _FORV_9_, _FORV_10_ in L6_86(L2_82) do
      end
    until L4_84 <= L5_85
    L6_86("enmgen2_i_04_01", L1_81, L2_82, L3_83, L4_84, nil, nil, L5_85)
    L6_86("enmgen2_i_04_02", L1_81, L2_82, L3_83, L4_84, nil, nil, L5_85)
    while true do
      if L1_81 ~= true then
        L1_81()
      end
    end
    L6_86("enmgen2_i_05_01", L1_81, L2_82, L3_83, L4_84, nil, nil, L5_85)
  end)
end
function enmgenOnObjectAsh(A0_87, A1_88)
  A0_87:getSpecTable().ash_count = A0_87:getSpecTable().ash_count + 1
end
function enmgenOnObjectDead(A0_89, A1_90)
  A0_89:getSpecTable().dead_count = A0_89:getSpecTable().dead_count + 1
  for _FORV_6_, _FORV_7_ in ipairs(A0_89:getSpecTable().spawnSet) do
    if A1_90:getName() == _FORV_7_.name and _FORV_7_.type == "mechsmall" then
      A0_89:getSpecTable().mechsmall_dead_count = A0_89:getSpecTable().mechsmall_dead_count + 1
    end
  end
end
function pccubesensor2_battle_range_01_OnEnter()
  local L0_91, L1_92
end
function pccubesensor2_battle_range_01_OnLeave()
  if _battle_range_enable == true then
    if Fn_getMissionPart() == "ep07_h" then
      Fn_captionView("ep07_09023")
    elseif Fn_getMissionPart() == "ep07_i" then
      Fn_captionView("ep07_09023")
    elseif Fn_getMissionPart() == "ep07_j" then
      Fn_captionView("ep07_09025")
    end
  end
end
function pccubesensor2_battle_range_02_OnEnter()
  local L0_93, L1_94
end
function pccubesensor2_battle_range_02_OnLeave()
  if _battle_range_enable == true then
    invokeTask(function()
      Player:setStay(true)
      Fn_userCtrlOff()
      Player:setNoDamageMode(Player.kNoDamage_All, true)
      Fn_catWarp()
      Player:setNoDamageMode(Player.kNoDamage_All, false)
      Fn_userCtrlOn()
      Player:setStay(false)
    end)
  end
end
function isThisStartMissionPart()
  if _start_mission_part == Fn_getMissionPart() then
    return true
  end
  return false
end
function requestSpawnSupportCrow(A0_95, A1_96)
  if _load_crow_task == nil and _crow_is_loaded == false then
    print("request crow spawn")
    _load_crow_task = invokeTask(function()
      _pup_crow = Fn_spawnSuppotCrow(false, A0_95, A1_96)
      _pup_crow:getBrain():setIdling(true)
      _pup_crow:getBrain():clearSpAction()
      _pup_crow:getBrain():clearThreatObject()
      Fn_loadSupporterEventMotion(_pup_crow, {
        "cro01_ep07_groggy_00",
        "kit01_down_b_00",
        "kit01_stay_heat_00"
      })
      print("crow load completed.")
      _crow_is_loaded = true
      _load_crow_task = nil
    end)
  end
end
function getCrowPuppetHundle()
  local L1_97
  L1_97 = _crow_is_loaded
  if L1_97 == true then
    L1_97 = _pup_crow
    return L1_97
  end
  L1_97 = nil
  return L1_97
end
function requestButtleInit()
  if _phase ~= PHASE_WAIT then
    return
  end
  _phase = PHASE_BATTLE_INIT
end
function isButtleInitEnd()
  return _phase == PHASE_BATTLE_INIT_END
end
function requestSpawnBattleEnemyIdle()
  if _phase ~= PHASE_BATTLE_INIT_END then
    return
  end
  _phase = PHASE_BATTLE_IDLE
end
function isBattleReady()
  return _phase == PHASE_BATTLE_READY
end
function requestBattleStart()
  if _phase ~= PHASE_BATTLE_READY then
    return
  end
  _phase = PHASE_BATTLE
end
function isButtleEnd()
  return _phase == PHASE_BATTLE_END
end
function requestAllEnemyKill()
  for _FORV_3_, _FORV_4_ in pairs(_enm_landingship_work) do
    _enm_landingship_work[_FORV_3_].enmgen:requestAllEnemyKill()
  end
  _enm_landingship_work = {}
  for _FORV_3_, _FORV_4_ in pairs(_ground_enm_work) do
    _ground_enm_work[_FORV_3_].enmgen:requestAllEnemyKill()
  end
  _ground_enm_work = {}
end
function setBattleRabgeEnable(A0_98)
  local L1_99
  _battle_range_enable = A0_98
end
function ep07_findGameObject2(A0_100, A1_101)
  return findGameObject2(A0_100, A1_101)
end
