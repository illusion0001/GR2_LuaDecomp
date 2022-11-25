dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
_enmgen2_name = nil
_enmgen2_maker_name = nil
_spawn_request = false
_marker_request = false
_enemy_marker_flag = false
_enemy_cnt = 0
_enm_num_request = false
_battle_end_request = false
_battle_end = false
_landingship_move = false
_active_request = false
_active_flag = false
_flag_06d = false
_request_idle_enemy = false
_idle_enemy_flag = false
_enemy_death_check = nil
_ep06_b_flag = 0
_prev_phase_continue = false
_landingship_phase = "drop_mech"
_landingship_phase2 = "drop_mech"
_enemu_max = 0
_lookatTask = nil
_fire_hdl = {}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_ms_02",
      name = "ep06_enemy02"
    },
    {
      type = "officer_rifle",
      locator = "locator_sol_01",
      name = "ep06_enemy04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_sol_04",
      name = "ep06_enemy07",
      target_vehicle = "ep06_enemy02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_sol_05",
      name = "ep06_enemy08"
    },
    {
      type = "soldier_rifle",
      locator = "locator_sol_06",
      name = "ep06_enemy09"
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
  enemyDeadNum = 0,
  onSpawn = function(A0_6, A1_7)
    _enemy_cnt = _enemy_cnt + 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    _enemy_cnt = _enemy_cnt - 1
  end,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_mm_01",
      name = "ep06_f_landingship01"
    },
    {
      type = "mechsmall",
      locator = "locator_mm_01",
      name = "enemy04",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "enemy05",
      target_vehicle = "enemy04"
    },
    {
      type = "mechsmall",
      locator = "locator_mm_01",
      name = "enemy04_02",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "enemy05_02",
      target_vehicle = "enemy04_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_mm_01",
      name = "sol_rif_01",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "sol_rif_02",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "sol_rif_03",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "sol_rif_04",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "sol_rif_05",
      target_vehicle = "ep06_f_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_mm_01",
      name = "sol_rif_06",
      target_vehicle = "ep06_f_landingship01"
    }
  },
  onUpdate = function(A0_17)
    local L1_18
  end,
  onEnter = function(A0_19)
    local L1_20
  end,
  onLeave = function(A0_21)
    local L1_22
  end,
  onSpawn = function(A0_23, A1_24)
    if A1_24:getName() ~= "ep06_f_landingship01" then
      _enemy_cnt = _enemy_cnt + 1
      _enemu_max = _enemu_max + 1
    end
  end,
  onObjectAsh = function(A0_25, A1_26)
    _enemy_cnt = _enemy_cnt - 1
  end,
  onObjectDead = function(A0_27, A1_28)
  end
}
enmgen2_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_01",
      name = "ep06_f_landingship02"
    },
    {
      type = "mechsmall",
      locator = "locator_01",
      name = "enemy06",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "enemy07",
      target_vehicle = "enemy06"
    },
    {
      type = "mechsmall",
      locator = "locator_01",
      name = "enemy06_02",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "enemy07_02",
      target_vehicle = "enemy06_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_01",
      name = "sol_rif_01",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_02",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_03",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_04",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_05",
      target_vehicle = "ep06_f_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "sol_rif_06",
      target_vehicle = "ep06_f_landingship02"
    }
  },
  onUpdate = function(A0_29)
    local L1_30
  end,
  onEnter = function(A0_31)
    local L1_32
  end,
  onLeave = function(A0_33)
    local L1_34
  end,
  onSpawn = function(A0_35, A1_36)
    if A1_36:getName() ~= "ep06_f_landingship02" then
      _enemy_cnt = _enemy_cnt + 1
      _enemu_max = _enemu_max + 1
    end
  end,
  onObjectAsh = function(A0_37, A1_38)
    _enemy_cnt = _enemy_cnt - 1
  end,
  onObjectDead = function(A0_39, A1_40)
  end
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki06",
      locator = "locator2_people_btl_01",
      name = "ppl_battle_01",
      ai_spawn_option = "Gorotuki/ep06_gorotuki"
    },
    {
      type = "gorotuki06",
      locator = "locator2_people_btl_02",
      name = "ppl_battle_02",
      ai_spawn_option = "Gorotuki/ep06_gorotuki"
    },
    {
      type = "gorotuki06",
      locator = "locator2_people_btl_03",
      name = "ppl_battle_03",
      ai_spawn_option = "Gorotuki/ep06_gorotuki"
    },
    {
      type = "gorotuki07",
      locator = "locator2_people_btl_04",
      name = "ppl_battle_04",
      ai_spawn_option = "Gorotuki/ep06_gorotuki"
    },
    {
      type = "gorotuki07",
      locator = "locator2_people_btl_05",
      name = "ppl_battle_05",
      ai_spawn_option = "Gorotuki/ep06_gorotuki"
    },
    {
      type = "gorotuki07",
      locator = "locator2_people_btl_06",
      name = "ppl_battle_06",
      ai_spawn_option = "Gorotuki/ep06_gorotuki"
    },
    {
      type = "gorotuki08",
      locator = "locator2_people_btl_07",
      name = "ppl_battle_07",
      ai_spawn_option = "Gorotuki/ep06_gorotuki_pipe"
    },
    {
      type = "gorotuki08",
      locator = "locator2_people_btl_08",
      name = "ppl_battle_08",
      ai_spawn_option = "Gorotuki/ep06_gorotuki_pipe"
    },
    {
      type = "gorotuki08",
      locator = "locator2_people_btl_09",
      name = "ppl_battle_09",
      ai_spawn_option = "Gorotuki/ep06_gorotuki_pipe"
    }
  },
  onUpdate = function(A0_41)
    local L1_42
  end,
  onEnter = function(A0_43)
    local L1_44
  end,
  onLeave = function(A0_45)
    local L1_46
  end,
  onSpawn = function(A0_47, A1_48)
  end,
  onObjectDead = function(A0_49, A1_50)
  end,
  onObjectAsh = function(A0_51, A1_52)
  end
}
enmgen2_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_01",
      name = "ep06_com_landingship01"
    },
    {
      type = "officer_rifle",
      locator = "locator_01",
      name = "ep06_com_sol_rif_01",
      target_vehicle = "ep06_com_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "ep06_com_sol_rif_02",
      target_vehicle = "ep06_com_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "ep06_com_sol_rif_03",
      target_vehicle = "ep06_com_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "ep06_com_sol_rif_04",
      target_vehicle = "ep06_com_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "ep06_com_sol_rif_05",
      target_vehicle = "ep06_com_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01",
      name = "ep06_com_sol_rif_06",
      target_vehicle = "ep06_com_landingship01"
    }
  },
  onUpdate = function(A0_53)
    local L1_54
  end,
  onEnter = function(A0_55)
    local L1_56
  end,
  onLeave = function(A0_57)
    local L1_58
  end,
  onSpawn = function(A0_59, A1_60)
    if A1_60:getName() ~= "ep06_com_landingship01" then
      _enemy_cnt = _enemy_cnt + 1
    end
  end,
  onObjectAsh = function(A0_61, A1_62)
    _enemy_cnt = _enemy_cnt - 1
  end,
  onObjectDead = function(A0_63, A1_64)
  end
}
function Initialize()
  if Fn_getMissionPart() == "ep06_b" then
    findGameObject2("Node", "bg2_ship_02"):setVisibleBlockEnable(false)
    findGameObject2("Node", "bg2_ship_02"):setActive(false)
  elseif Fn_getMissionPart() == "ep06_c" then
    findGameObject2("Node", "bg2_ship_02"):setVisibleBlockEnable(false)
  end
end
function Ingame()
  local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74, L10_75, L11_76, L12_77, L13_78, L14_79, L15_80, L16_81, L17_82
  L0_65 = findGameObject2
  L1_66 = "EnemyGenerator"
  L2_67 = "enmgen2_06"
  L0_65 = L0_65(L1_66, L2_67)
  if L0_65 ~= nil then
    L2_67 = L0_65
    L1_66 = L0_65.requestPrepare
    L1_66(L2_67)
  end
  function L1_66(A0_83)
    if _landingship_move == false then
      return A0_83
    end
    if A0_83.state == "wait" then
      if _landingship_phase == "drop_mech" then
        A0_83.changeState = "move"
        A0_83.movePoint = {
          "locator2_ship_move_pos_02"
        }
      elseif _landingship_phase == "land_back" then
        A0_83.changeState = "move"
        A0_83.movePoint = {
          "locator2_ship_move_pos_01"
        }
        _landingship_phase = "empty"
      end
    end
    if A0_83.state == "moveEnd" then
      if _landingship_phase == "drop_mech" then
        A0_83.changeState = "open"
        A0_83.dropCount = 6
      elseif _landingship_phase == "empty" and findGameObject2("Puppet", "ep06_com_landingship01") ~= nil then
        findGameObject2("Puppet", "ep06_com_landingship01"):setVisible(false)
      end
    end
    if A0_83.state == "openEnd" then
      _landingship_phase = "land_back"
    end
    return A0_83
  end
  L2_67 = findGameObject2
  L3_68 = "Puppet"
  L4_69 = "ep06_com_landingship01"
  L2_67 = L2_67(L3_68, L4_69)
  L4_69 = L2_67
  L3_68 = L2_67.getBrain
  L3_68 = L3_68(L4_69)
  L5_70 = L3_68
  L4_69 = L3_68.setEventListener
  L6_71 = "enemy_landingship_event"
  L7_72 = L1_66
  L4_69(L5_70, L6_71, L7_72)
  L4_69 = findGameObject2
  L5_70 = "EnemyGenerator"
  L6_71 = "enmgen2_03"
  L4_69 = L4_69(L5_70, L6_71)
  if L4_69 ~= nil then
    L6_71 = L4_69
    L5_70 = L4_69.requestPrepare
    L5_70(L6_71)
  end
  function L5_70(A0_84)
    if A0_84.state == "wait" then
      if _landingship_phase2 == "drop_mech" then
        A0_84.changeState = "move"
        A0_84.movePoint = {
          "locator2_drop_point_01"
        }
      elseif _landingship_phase2 == "land_back" then
        A0_84.changeState = "move"
        A0_84.movePoint = {
          "locator2_exit_point_01"
        }
        _landingship_phase2 = "empty"
      end
    end
    if A0_84.state == "moveEnd" then
      if _landingship_phase2 == "drop_mech" then
        A0_84.changeState = "drop"
        A0_84.dropEnemy = {"enemy04", "enemy04_02"}
      elseif _landingship_phase2 == "drop_human" then
        A0_84.changeState = "open"
        A0_84.dropCount = 3
      elseif _landingship_phase == "land_back" and findGameObject2("Puppet", "ep06_f_landingship01") ~= nil then
        findGameObject2("Puppet", "ep06_f_landingship01"):setVisible(false)
      end
    end
    if A0_84.state == "dropEnd" then
      A0_84.changeState = "open"
      A0_84.dropCount = 6
    end
    if A0_84.state == "openEnd" then
      _landingship_phase2 = "land_back"
    end
    return A0_84
  end
  L6_71 = findGameObject2
  L7_72 = "Puppet"
  L8_73 = "ep06_f_landingship01"
  L6_71 = L6_71(L7_72, L8_73)
  L8_73 = L6_71
  L7_72 = L6_71.getBrain
  L7_72 = L7_72(L8_73)
  L9_74 = L7_72
  L8_73 = L7_72.setEventListener
  L10_75 = "enemy_landingship_event"
  L11_76 = L5_70
  L8_73(L9_74, L10_75, L11_76)
  L8_73 = findGameObject2
  L9_74 = "EnemyGenerator"
  L10_75 = "enmgen2_08"
  L8_73 = L8_73(L9_74, L10_75)
  if L8_73 ~= nil then
    L10_75 = L8_73
    L9_74 = L8_73.requestPrepare
    L9_74(L10_75)
  end
  function L9_74(A0_85)
    if A0_85.state == "wait" then
      if _landingship_phase2 == "drop_mech" then
        A0_85.changeState = "move"
        A0_85.movePoint = {
          "locator2_drop_point_04"
        }
      elseif _landingship_phase2 == "land_back" then
        A0_85.changeState = "move"
        A0_85.movePoint = {
          "locator2_exit_point_04"
        }
        _landingship_phase2 = "empty"
      end
    end
    if A0_85.state == "moveEnd" then
      if _landingship_phase2 == "drop_mech" then
        A0_85.changeState = "drop"
        A0_85.dropEnemy = {"enemy06", "enemy06_02"}
      elseif _landingship_phase2 == "drop_human" then
        A0_85.changeState = "open"
        A0_85.dropCount = 3
      elseif _landingship_phase == "land_back" and findGameObject2("Puppet", "ep06_f_landingship02") ~= nil then
        findGameObject2("Puppet", "ep06_f_landingship02"):setVisible(false)
      end
    end
    if A0_85.state == "dropEnd" then
      A0_85.changeState = "open"
      A0_85.dropCount = 6
    end
    if A0_85.state == "openEnd" then
      _landingship_phase2 = "land_back"
    end
    return A0_85
  end
  L10_75 = findGameObject2
  L11_76 = "Puppet"
  L12_77 = "ep06_f_landingship02"
  L10_75 = L10_75(L11_76, L12_77)
  L12_77 = L10_75
  L11_76 = L10_75.getBrain
  L11_76 = L11_76(L12_77)
  L13_78 = L11_76
  L12_77 = L11_76.setEventListener
  L12_77(L13_78, L14_79, L15_80)
  while true do
    L12_77 = Fn_getMissionPart
    L12_77 = L12_77()
    L13_78 = _spawn_people
    if L13_78 then
      L13_78 = findGameObject2
      L13_78 = L13_78(L14_79, L15_80)
      if L13_78 ~= nil then
        L14_79(L15_80, L16_81)
        L14_79(L15_80, L16_81)
        L14_79(L15_80)
        while true do
          if not L14_79 then
            L14_79()
          end
        end
        for L17_82 = 1, 9 do
          if findGameObject2("EnemyBrain", "ppl_battle_" .. string.format("%02d", L17_82)) ~= nil then
            findGameObject2("EnemyBrain", "ppl_battle_" .. string.format("%02d", L17_82)):setEnableHomingTarget(false)
            findGameObject2("EnemyBrain", "ppl_battle_" .. string.format("%02d", L17_82)):getGizmo():setIgnoreGrab(true)
          end
        end
      end
      _spawn_people = false
    end
    L13_78 = _active_request
    if L13_78 then
      L13_78 = findGameObject2
      L13_78 = L13_78(L14_79, L15_80)
      L14_79(L15_80, L16_81)
      L14_79(L15_80, L16_81)
      _active_request = false
    else
      L13_78 = _spawn_request
      if L13_78 then
        L13_78 = spawnEnemy
        L13_78(L14_79)
        _spawn_request = false
      else
        L13_78 = _marker_request
        if L13_78 then
          L13_78 = enemyMarker
          L13_78(L14_79, L15_80)
          _marker_request = false
        end
      end
    end
    L13_78 = _enemy_death_check
    if L13_78 == nil then
      L13_78 = invokeTask
      L13_78 = L13_78(L14_79)
      _enemy_death_check = L13_78
    end
    L13_78 = _request_idle_enemy
    if L13_78 then
      L13_78 = findGameObject2
      L13_78 = L13_78(L14_79, L15_80)
      L14_79(L15_80, L16_81)
      _request_idle_enemy = false
    end
    if L12_77 == "ep06_e" then
    end
    L13_78 = wait
    L13_78()
  end
end
function Finalize()
  local L0_86, L1_87
end
function spawnEnemy(A0_88)
  if findGameObject2("EnemyGenerator", A0_88) ~= nil then
    _battle_end = false
    findGameObject2("EnemyGenerator", A0_88):requestSpawn()
  end
  while not findGameObject2("EnemyGenerator", A0_88):isPrepared() do
    wait()
  end
  findGameObject2("EnemyGenerator", A0_88):setEnemyMarker(true)
  if A0_88 == "enmgen2_03" or A0_88 == "enmgen2_08" then
    invokeTask(function()
      Fn_captionView("ep06_05000")
      com_lookAtTaskAbort()
      HUD:counter99_99SetTextID("ep06_04010")
      HUD:counter99_99SetVisible(true)
      HUD:counter99_99SetIcon(HUD.kCount99_99IconType_Stone)
    end)
  end
end
function resetBattleEndFlag()
  local L0_89, L1_90
  _battle_end = false
end
function isFoundEnemy()
  local L0_91
  L0_91 = false
  if not Fn_isInSightTarget(findGameObject2("Node", "locator2_found_ship_04"), 1) and Fn_isInSightTarget(findGameObject2("Node", "locator2_found_ship_03"), 1) then
    L0_91 = true
  end
  return L0_91
end
function requestEnemyHandle(A0_92)
  return findGameObject2("Puppet", A0_92)
end
function enemyMarker(A0_93, A1_94)
  if findGameObject2("EnemyGenerator", A0_93) ~= nil then
    findGameObject2("EnemyGenerator", A0_93):setEnemyMarker(A1_94)
  end
end
function spawnPeople()
  local L0_95, L1_96
  _spawn_people = true
end
function requestObjActive(A0_97, A1_98)
  if not _active_request then
    _active_request = true
    _active_flag = A1_98
    return true
  end
  return false
end
function requestSpawnEnemy(A0_99)
  if _spawn_request == false then
    _spawn_request = true
    _spawn_end = false
    _enmgen2_name = A0_99
    return true
  end
  return false
end
function isBattleEnd()
  local L0_100, L1_101
  L0_100 = _battle_end
  return L0_100
end
function requestCheckEnemyNum()
  local L0_102, L1_103
  L0_102 = _enemy_cnt
  return L0_102
end
function requestGetEnemyMax()
  local L0_104, L1_105
  L0_104 = _enemu_max
  return L0_104
end
function com_lookAtObject(A0_106)
  local L1_107
  L1_107 = findGameObject2
  L1_107 = L1_107("Puppet", A0_106)
  _lookatTask = Fn_lookAtObject(L1_107)
end
function com_lookAtTaskAbort()
  _lookatTask = Mv_safeTaskAbort(_lookatTask)
end
function requestEnemyMarkerOn(A0_108, A1_109)
  if _marker_request == false then
    _marker_request = true
    _enemy_marker_flag = A1_109
    _enmgen2_maker_name = A0_108
    return true
  end
  return false
end
function requestDestroyEnemy(A0_110)
  if findGameObject2("EnemyGenerator", A0_110) ~= nil then
    findGameObject2("EnemyGenerator", A0_110):requestAllEnemyKill()
  end
end
function set06dFlag(A0_111)
  local L1_112
  _flag_06d = A0_111
end
function get06dFlag()
  local L0_113, L1_114
  L0_113 = _flag_06d
  return L0_113
end
function set06bFlag(A0_115)
  local L1_116
  _ep06_b_flag = A0_115
end
function get06bFlag()
  local L0_117, L1_118
  L0_117 = _ep06_b_flag
  return L0_117
end
function setPrevPhaseContinue(A0_119)
  local L1_120
  _prev_phase_continue = A0_119
end
function getPrevPhaseContinue()
  local L0_121, L1_122
  L0_121 = _prev_phase_continue
  return L0_121
end
function requestIdleEnemy(A0_123, A1_124)
  _request_idle_enemy = true
  _idle_enemy_flag = A1_124
  _enmgen2_name = A0_123
end
function endTask()
  _enemy_death_check = Mv_safeTaskAbort(_enemy_death_check)
end
function setupFireEffect()
  invokeTask(function()
    local L0_125, L1_126, L2_127, L3_128
    for L3_128 = 1, 6 do
      _fire_hdl[L3_128] = Fn_createEffect("ef_ev_fire_" .. string.format("%02d", L3_128), "ef_ev_fir_01", findGameObject2("Node", "locator2_fire_pos_" .. string.format("%02d", L3_128)):getWorldPos(), true)
    end
  end)
end
function deleteFireEffect()
  if _fire_hdl == nil then
    return false
  end
  invokeTask(function()
    local L0_129, L1_130, L2_131, L3_132
    for L3_132 = 1, 6 do
      invokeTask(function()
        if _fire_hdl[L3_132] ~= nil then
          Fn_setAlpha(_fire_hdl[L3_132], false, 1.5, 10)
          waitSeconds(5)
          _fire_hdl[L3_132]:stop()
        end
      end)
      break
    end
  end)
end
function createGem(A0_133)
  local L1_134, L2_135
  L1_134 = "locator2_fire_gem_"
  L2_135 = string
  L2_135 = L2_135.format
  L2_135 = L2_135("%02d", A0_133)
  L1_134 = L1_134 .. L2_135
  L2_135 = findGameObject2
  L2_135 = L2_135("Node", L1_134)
  if L2_135 ~= nil then
    invokeTask(function()
      createGameObject2("Gem"):setGemModelNo(5)
      createGameObject2("Gem"):setWorldTransform(L2_135:getWorldTransform() + Vector(0, 2, 0))
      createGameObject2("Gem"):setDynamic(true)
      createGameObject2("Gem"):try_init()
      createGameObject2("Gem"):setVisibleBlockHalfSize(150)
      createGameObject2("Gem"):waitForReady()
      createGameObject2("Gem"):try_start()
      createGameObject2("Gem"):setImpulse(Vector(RandF(-0.5, 0.5), RandF(4, 5), RandF(-0.5, 0.5)))
    end)
  end
end
function setLandingShipMove()
  local L0_136, L1_137
  _landingship_move = true
end
