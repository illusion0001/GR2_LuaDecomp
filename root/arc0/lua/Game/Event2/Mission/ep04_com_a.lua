dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep04_common.lua")
dofile("/Game/Event2/Common/GemCommon.lua")
EP04_DEBUG_FLAG = false
MAX_FLAG = 10
RESET_FLAG_MIN = 3
END_SCORE = 10
PHASE_2_ZURU_ACTIVE_SCORE = END_SCORE - 1
PHASE_3_ZURU_ACTIVE_SCORE = END_SCORE - 2
MAX_PHASE = 3
FLAG_BASIC_POINT = 1
FLAG_TO_PC_DIS = 10
FLAG_TO_GRAB_DIS = 20
ENERGY_GEM_REPOP_TIME_MAX = 30
ENERGY_GEM_REPOP_CANCEL_RANGE = 30
EXCLUSION_LOTTERY_AREA_PC = 20
EXCLUSION_LOTTERY_AREA_FI = 20
EXCLUSION_LOTTERY_LIMIT_AREA_FI = 30
PC_PRIORITY_TARGET_MAX = 3
PC_FAVOR_TARGET_MAX = 7
PHASE_1_MAX_REBOOT_WAIT_TIME = 2.1
PHASE_1_MIN_REBOOT_WAIT_TIME = 1.4
PHASE_2_MAX_REBOOT_WAIT_TIME = 1.4
PHASE_2_MIN_REBOOT_WAIT_TIME = 0.7
PHASE_2_FI_WIN_MAX_REBOOT_WAIT_TIME = 3.32
PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME = 2.1
PHASE_3_MAX_REBOOT_WAIT_TIME = 0.16
PHASE_3_MIN_REBOOT_WAIT_TIME = 0.16
ZURU_MAX_REBOOT_WAIT_TIME = 0
ZURU_MIN_REBOOT_WAIT_TIME = 0
RETRY_WEAKENING_FI_STOP_TIME = 1.5
RETRY_WEAKENING_FI_STOP_MAX_TIME = 5
LOCKON_DUMMY_EXTENSION_NAME = "_lockon_dummy"
_savedata_vars = {}
_ep04_flag_info_saw = false
enmgen2_area_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator_01_01",
      name = "fi_00",
      ai_spawn_option = "Fi/fi_ep04_a"
    }
  },
  waitTime = 0,
  target_attack_trigger = false,
  reboot_wait_task = nil,
  reboot_trigger = false,
  transfer_flag_tbl = {},
  update_flag = {},
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
    local L3_10
    L3_10 = enmgen2_area_01
    L3_10.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
  end,
  route_link_state_table = {
    {name = "a1", state = true},
    {name = "a2", state = true},
    {name = "a3", state = false}
  },
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_11, L1_12
    L0_11 = enmgen2_area_01
    L0_11 = L0_11.spawnSet
    L0_11 = #L0_11
    return L0_11
  end,
  getEnemyDeadNum = function()
    local L1_13
    L1_13 = enmgen2_area_01
    L1_13 = L1_13.enemyDeadNum
    return L1_13
  end,
  getEnemyName = function(A0_14)
    local L1_15
    L1_15 = enmgen2_area_01
    L1_15 = L1_15.spawnSet
    L1_15 = L1_15[A0_14]
    L1_15 = L1_15.name
    return L1_15
  end,
  transferFlag = function()
    local L0_16
    L0_16 = enmgen2_area_01
    L0_16.update_flag = true
    L0_16 = _FLAGS_MANAGER
    L0_16 = L0_16.GetFlagTable
    L0_16 = L0_16()
    if not L0_16 then
      print("ERROR : enmgen2_area_01 flag_tbl=nil")
      return
    end
    enmgen2_area_01.transfer_flag_tbl = {}
    for _FORV_4_, _FORV_5_ in pairs(L0_16) do
      enmgen2_area_01.transfer_flag_tbl[_FORV_4_] = {
        flag_state = _FORV_5_.flag_state,
        target = _FORV_5_.target,
        hdl = _FORV_5_.hdl[1]
      }
    end
  end,
  getTransferFlag = function()
    local L1_17
    L1_17 = enmgen2_area_01
    L1_17 = L1_17.transfer_flag_tbl
    return L1_17
  end,
  callFlagFightReport = function(A0_18)
    local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37
    L1_19 = _EP04_FLAG_GAME_MANAGER
    L1_19 = L1_19.GetPhase
    L1_19 = L1_19()
    L2_20 = _EP04_FLAG_GAME_MANAGER
    L2_20 = L2_20.GetJamingFlg
    L2_20 = L2_20()
    if true == L2_20 then
      L3_21 = enmgen2_area_01
      L3_21 = L3_21.transferFlag
      L3_21()
      L3_21 = false
      L4_22 = {}
      L5_23 = Fn_getPlayerWorldPos
      L5_23 = L5_23()
      L6_24 = _FLAGS_MANAGER
      L6_24 = L6_24.GetFlagTable
      L6_24 = L6_24()
      for L10_28, L11_29 in L7_25(L8_26) do
        L12_30 = L11_29.flag_state
        if 1 == L12_30 then
          L12_30 = false
          L13_31 = L11_29.hdl
          L13_31 = L13_31[1]
          L14_32 = L13_31.getWorldPos
          L14_32 = L14_32(L15_33)
          if L15_33 <= L16_34 then
            L12_30 = true
          else
            for L18_36, L19_37 in L15_33(L16_34) do
              if Fn_get_distance(L19_37, L14_32) <= FLAG_TO_GRAB_DIS then
                L12_30 = true
                break
              end
            end
          end
          if true == L12_30 then
            if false == L15_33 then
              L15_33(L16_34)
              L15_33(L16_34)
              L3_21 = true
              L15_33(L16_34, L17_35)
            end
          end
        end
      end
      if L3_21 then
        L7_25(L8_26)
        if L7_25 <= L8_26 then
          L19_37 = L9_27()
          L7_25(L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37, L9_27())
          L7_25(L8_26, L9_27)
          L7_25(L8_26)
        end
        L7_25(L8_26)
        L7_25(L8_26)
      end
    end
    L3_21 = _RESET_TIMER_DAT
    L3_21 = L3_21.Check
    L3_21 = L3_21()
    if not L3_21 then
      L3_21 = enmgen2_area_01
      L3_21 = L3_21.update_flag
    elseif L3_21 then
      A0_18.is_flag_Relocation = true
      L3_21 = enmgen2_area_01
      L3_21.update_flag = false
    end
    L3_21 = enmgen2_area_01
    L3_21 = L3_21.getTransferFlag
    L3_21 = L3_21()
    if 1 == L1_19 then
      L4_22 = _EP04_FLAG_GAME_MANAGER
      L4_22 = L4_22.GetRequestCatWarp
      L4_22 = L4_22()
      if true == L4_22 then
        A0_18.is_flag_Relocation = true
        L4_22 = {}
        L3_21 = L4_22
      end
    elseif (2 == L1_19 or 3 == L1_19) and false == L2_20 then
      L4_22 = _EP04_FLAG_GAME_MANAGER
      L4_22 = L4_22.GetRequestCatWarp
      L4_22 = L4_22()
      if true == L4_22 then
        A0_18.is_flag_Relocation = true
        L4_22 = {}
        L3_21 = L4_22
      else
        L4_22 = _savedata_vars
        L5_23 = ggd
        L5_23 = L5_23.Savedata__EventFlags__ep04__flag01
        L4_22 = L4_22[L5_23]
        if 0 == L4_22 then
          L4_22 = _EP04_FLAG_GAME_MANAGER
          L4_22 = L4_22.GetEnterAlertArea
          L4_22 = L4_22()
          if true == L4_22 then
            A0_18.is_flag_Relocation = true
            L4_22 = {}
            L3_21 = L4_22
          end
        end
      end
    end
    L4_22 = enmgen2_area_01
    L4_22 = L4_22.route_link_state_table
    A0_18.route_link_state_tbl = L4_22
    L4_22 = _RESET_TIMER_DAT
    L4_22 = L4_22.isActive
    L4_22 = L4_22()
    if L4_22 then
      A0_18.fi_ai_pause_flag = false
    else
      A0_18.fi_ai_pause_flag = true
    end
    if false == L2_20 then
      L4_22 = enmgen2_area_01
      L4_22 = L4_22.reboot_trigger
      if true == L4_22 then
        A0_18.attack_after_wait_time = 0
        L4_22 = enmgen2_area_01
        L4_22.reboot_trigger = false
      end
    elseif true == L2_20 then
      A0_18.attack_after_wait_time = 0
      L4_22 = enmgen2_area_01
      L4_22.reboot_trigger = false
    else
      L4_22 = 0
      if L1_19 >= 2 then
        L5_23 = _savedata_vars
        L6_24 = ggd
        L6_24 = L6_24.Savedata__EventFlags__ep04__flag01
        L5_23 = L5_23[L6_24]
        if 0 == L5_23 then
          L4_22 = RETRY_WEAKENING_FI_STOP_MAX_TIME
        end
      end
      L5_23 = enmgen2_area_01
      L5_23 = L5_23.waitTime
      L5_23 = L5_23 + L4_22
      A0_18.attack_after_wait_time = L5_23
    end
    if false == L2_20 then
      L4_22 = enmgen2_area_01
      L4_22 = L4_22.reboot_watch_task
      if nil == L4_22 then
        L4_22 = enmgen2_area_01
        L4_22 = L4_22.target_attack_trigger
        if true == L4_22 then
          L4_22 = enmgen2_area_01
          L5_23 = invokeTask
          function L6_24(A0_38)
            local L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47, L10_48
            L1_39 = _EP04_FLAG_GAME_MANAGER
            L1_39 = L1_39.GetPhase
            L1_39 = L1_39()
            L2_40 = secondToGameTick
            L3_41 = A0_38
            L2_40 = L2_40(L3_41)
            L3_41 = findGameObject2
            L4_42 = "Puppet"
            L5_43 = "fi_00"
            L3_41 = L3_41(L4_42, L5_43)
            L4_42 = Fn_getPlayer
            L4_42 = L4_42()
            L5_43 = L4_42.getWorldPos
            L5_43 = L5_43(L6_44)
            for L9_47 = 1, L2_40 do
              L10_48 = _EP04_FLAG_GAME_MANAGER
              L10_48 = L10_48.GetPhase
              L10_48 = L10_48()
              if L1_39 == L10_48 then
                L10_48 = Fn_get_distance
                L10_48 = L10_48(L3_41:getWorldPos(), L5_43)
                if L10_48 <= 80 then
                  L10_48 = Fn_isInSightTarget
                  L10_48 = L10_48(L3_41, 0.8)
                  if true == L10_48 then
                    L10_48 = 1
                    if L1_39 >= 2 and 0 == _savedata_vars[ggd.Savedata__EventFlags__ep04__flag01] then
                      L10_48 = 2
                    end
                    waitSeconds(L10_48)
                    if 0 < L2_40 - L9_47 - L10_48 * 30 and true == L3_41:isRunning() then
                      enmgen2_area_01.reboot_trigger = true
                    end
                    break
                  end
                end
              end
              L10_48 = wait
              L10_48()
            end
            L6_44.reboot_watch_task = nil
          end
          L5_23 = L5_23(L6_24, L7_25)
          L4_22.reboot_watch_task = L5_23
        end
      end
    end
    A0_18.flag_state_tbl = L3_21
    L4_22 = enmgen2_area_01
    L4_22 = L4_22.offAttackTrigger
    L4_22()
    return A0_18
  end,
  CalculationWaitTime = function()
    local L0_49, L1_50, L2_51, L3_52, L4_53, L5_54, L6_55, L7_56
    L0_49 = 0
    L1_50 = _EP04_FLAG_GAME_MANAGER
    L1_50 = L1_50.GetPhase
    L1_50 = L1_50()
    L2_51 = _SCORE_MANAGER
    L2_51 = L2_51.GetPcScore
    L2_51 = L2_51()
    L3_52 = _SCORE_MANAGER
    L3_52 = L3_52.GetNpcScore
    L3_52 = L3_52()
    L4_53 = L3_52 - L2_51
    L5_54 = _EP04_FLAG_GAME_MANAGER
    L5_54 = L5_54.GetJamingFlg
    L5_54 = L5_54()
    L6_55 = _SCORE_MANAGER
    L6_55 = L6_55.GetNpcWinNum
    L6_55 = L6_55()
    if true == L5_54 then
      L0_49 = ZURU_MAX_REBOOT_WAIT_TIME
    elseif 1 == L1_50 then
      if L4_53 < -1 then
        L0_49 = PHASE_1_MIN_REBOOT_WAIT_TIME
      elseif L4_53 > 2 then
        L0_49 = PHASE_1_MAX_REBOOT_WAIT_TIME
      else
        L7_56 = L4_53 / 3
        L7_56 = math.max(L7_56, L7_56 * -1)
        L0_49 = PHASE_1_MIN_REBOOT_WAIT_TIME + (PHASE_1_MAX_REBOOT_WAIT_TIME - PHASE_1_MIN_REBOOT_WAIT_TIME) * L7_56
      end
    elseif 2 == L1_50 then
      if L6_55 > 0 then
        if L4_53 < -1 then
          L0_49 = PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME
        elseif L4_53 > 2 then
          L0_49 = PHASE_2_FI_WIN_MAX_REBOOT_WAIT_TIME
        else
          L7_56 = L4_53 / 3
          L7_56 = math.max(L7_56, L7_56 * -1)
          L0_49 = PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME + (PHASE_2_FI_WIN_MAX_REBOOT_WAIT_TIME - PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME) * L7_56
        end
      elseif L4_53 < -1 then
        L0_49 = PHASE_2_MIN_REBOOT_WAIT_TIME
      elseif L4_53 > 2 then
        L0_49 = PHASE_2_MAX_REBOOT_WAIT_TIME
      else
        L7_56 = L4_53 / 3
        L7_56 = math.max(L7_56, L7_56 * -1)
        L0_49 = PHASE_2_MIN_REBOOT_WAIT_TIME + (PHASE_2_MAX_REBOOT_WAIT_TIME - PHASE_2_MIN_REBOOT_WAIT_TIME) * L7_56
      end
    elseif 3 == L1_50 then
      L7_56 = _savedata_vars
      L7_56 = L7_56[ggd.EventFlags__ep04__flag01]
      if 0 == L7_56 then
        if L6_55 > 0 then
          if L4_53 < -1 then
            L0_49 = PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME
          elseif L4_53 > 2 then
            L0_49 = PHASE_2_FI_WIN_MAX_REBOOT_WAIT_TIME
          else
            L7_56 = L4_53 / 3
            L7_56 = math.max(L7_56, L7_56 * -1)
            L0_49 = PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME + (PHASE_2_FI_WIN_MAX_REBOOT_WAIT_TIME - PHASE_2_FI_WIN_MIN_REBOOT_WAIT_TIME) * L7_56
          end
        end
      elseif L4_53 < -1 then
        L0_49 = PHASE_1_MIN_REBOOT_WAIT_TIME
      elseif L4_53 > 2 then
        L0_49 = PHASE_1_MAX_REBOOT_WAIT_TIME
      else
        L7_56 = L4_53 / 3
        L7_56 = math.max(L7_56, L7_56 * -1)
        L0_49 = PHASE_1_MIN_REBOOT_WAIT_TIME + (PHASE_1_MAX_REBOOT_WAIT_TIME - PHASE_1_MIN_REBOOT_WAIT_TIME) * L7_56
      end
    end
    L7_56 = enmgen2_area_01
    L7_56.waitTime = L0_49
  end,
  new = function()
    local L0_57, L1_58
    L0_57 = findGameObject2
    L1_58 = "EnemyGenerator"
    L0_57 = L0_57(L1_58, "enmgen2_01")
    L1_58 = L0_57.requestSpawn
    L1_58(L0_57)
    L1_58 = nil
    repeat
      L1_58 = findGameObject2("EnemyBrain", "fi_00")
      wait()
    until L1_58
    L1_58:setEventListener("boss_fi_FlagFightJudgeReport", enmgen2_area_01.callFlagFightReport)
    L1_58:setVisibleBossMarker(true)
  end,
  ResetPos = function()
    local L0_59, L1_60
    L0_59 = findGameObject2
    L1_60 = "EnemyBrain"
    L0_59 = L0_59(L1_60, "fi_00")
    L1_60 = findGameObject2
    L1_60 = L1_60("Puppet", "fi_00")
    L1_60:leaveFromParent()
    findGameObject2("EnemyGenerator", "enmgen2_01"):appendChild(L1_60)
    L0_59:reset(get_gameobj_node_world_pos_rot("locator2_npc_start_pos"))
  end,
  ResetDemo01Pos = function()
    findGameObject2("EnemyBrain", "fi_00"):reset(get_gameobj_node_world_pos_rot("locator2_phi01_demo_01"))
  end,
  Delete = function()
    local L0_61, L1_62
  end,
  SetEnemyMarkerVisible = function(A0_63)
    if findGameObject2("EnemyGenerator", "enmgen2_01") == nil then
      print("ERROR : enmgen2_area_01.SetEnemyMarkerVisible ene=nil")
      return
    end
    if A0_63 then
      findGameObject2("EnemyGenerator", "enmgen2_01"):setEnemyMarker(true)
    else
      findGameObject2("EnemyGenerator", "enmgen2_01"):setEnemyMarker(false)
    end
  end,
  isReadyEnemy = function()
    if findGameObject2("EnemyBrain", "fi_00") == nil then
      print("ERROR : enmgen2_area_01.isReadyEnemy fi_hdl=nil")
      return
    end
    return findGameObject2("EnemyBrain", "fi_00"):isReadyEnemy()
  end,
  playMotionStartToEnd = function(A0_64)
    if findGameObject2("EnemyBrain", "fi_00") == nil then
      print("ERROR : enmgen2_area_01.playMotionStartToEnd fi_hdl=nil")
      return
    end
    findGameObject2("EnemyBrain", "fi_00"):playMotion(A0_64)
    while findGameObject2("EnemyBrain", "fi_00"):isMotionEnd() == false do
      wait()
    end
    findGameObject2("EnemyBrain", "fi_00"):endScriptAction()
  end,
  onAttackTrigger = function()
    local L1_65
    L1_65 = enmgen2_area_01
    L1_65.target_attack_trigger = true
  end,
  offAttackTrigger = function()
    local L1_66
    L1_66 = enmgen2_area_01
    L1_66.target_attack_trigger = false
  end
}
_ENERGY_GEM_MANAGER = {
  energy_gem_dat = {
    all_active_flg = true,
    area_gem_dat = {}
  },
  new = function()
    local L0_67, L1_68
    L0_67 = _ENERGY_GEM_MANAGER
    L0_67 = L0_67.energy_gem_dat
    L1_68 = {
      {
        trriger_flag = {
          "locator2_Flag_1_06"
        },
        gem = {
          locator2_gem_pos_02 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_2_06"
        },
        gem = {
          locator2_gem_pos_05 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_1_09"
        },
        gem = {
          locator2_gem_pos_04 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_1_05"
        },
        gem = {
          locator2_gem_pos_07 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_1_03"
        },
        gem = {
          locator2_gem_pos_09 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_2_01",
          "locator2_Flag_2_02",
          "locator2_Flag_2_03",
          "locator2_Flag_4_15"
        },
        gem = {
          locator2_gem_pos_06 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_1_04"
        },
        gem = {
          locator2_gem_pos_08 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_2_05",
          "locator2_Flag_1_08",
          "locator2_Flag_4_03",
          "locator2_Flag_4_12"
        },
        gem = {
          locator2_gem_pos_03 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_1_16",
          "locator2_Flag_4_05"
        },
        gem = {
          locator2_gem_pos_01 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_3_01",
          "locator2_Flag_3_02",
          "locator2_Flag_3_03",
          "locator2_Flag_3_04",
          "locator2_Flag_3_05",
          "locator2_Flag_3_06"
        },
        gem = {
          locator2_gem_pos_10 = {active = true, hdl = nil},
          locator2_gem_pos_11 = {active = true, hdl = nil}
        }
      },
      {
        trriger_flag = {
          "locator2_Flag_1_02",
          "locator2_Flag_4_02",
          "locator2_Flag_4_10",
          "locator2_Flag_4_11"
        },
        gem = {
          locator2_gem_pos_12 = {active = true, hdl = nil}
        }
      }
    }
    L0_67.area_gem_dat = L1_68
    L1_68 = "MissionEp04CallbackEnargyGemGet"
    _G[L1_68] = _ENERGY_GEM_MANAGER.CallBackEnergyGemGet
    GlobalGem:SetEnargyGemGetCallback(L1_68)
    L0_67.all_active_flg = true
  end,
  GemAllCreat = function()
    local L0_69, L1_70, L2_71, L3_72, L4_73
    L0_69 = _ENERGY_GEM_MANAGER
    L0_69 = L0_69.energy_gem_dat
    if nil == L0_69 then
      L1_70 = false
      return L1_70
    end
    L1_70 = L0_69.area_gem_dat
    L1_70 = #L1_70
    for _FORV_5_ = 1, L1_70 do
      invokeTask(function(A0_74)
        local L1_75, L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82
        for L4_78, L5_79 in L1_75(L2_76) do
          L6_80 = L5_79.hdl
          if nil == L6_80 then
            L6_80 = L5_79.hdl
            if nil ~= L6_80 then
              L6_80 = L5_79.hdl
              L7_81 = L6_80
              L6_80 = L6_80.isRunning
              L6_80 = L6_80(L7_81)
              if true == L6_80 then
                L6_80 = L5_79.hdl
                L7_81 = L6_80
                L6_80 = L6_80.try_term
                L6_80(L7_81)
              end
            end
            L6_80 = findGameObject2
            L7_81 = "Node"
            L8_82 = L4_78
            L6_80 = L6_80(L7_81, L8_82)
            L8_82 = L6_80
            L7_81 = L6_80.getName
            L7_81 = L7_81(L8_82)
            L8_82 = "_EnergyGem"
            L7_81 = L7_81 .. L8_82
            L8_82 = createGameObject2
            L8_82 = L8_82("Gem")
            L8_82:setName(L7_81)
            L8_82:setGemModelNo(4)
            L8_82:setForceMove()
            L8_82:setVisibleBlockHalfSize(150)
            L6_80:appendChild(L8_82)
            L5_79.hdl = L8_82
            L5_79.active = _ENERGY_GEM_MANAGER.energy_gem_dat.all_active_flg
            L8_82:setActive(L5_79.active)
            L8_82:setVisible(L5_79.active)
            L8_82:try_init()
            L8_82:waitForReadyAsync(function()
              L8_82:try_start()
            end)
          else
          end
        end
      end, L0_69.area_gem_dat[_FORV_5_])
    end
  end,
  GemCreatFlagRef = function()
    local L0_83, L1_84, L2_85
    L0_83 = _FLAGS_MANAGER
    L0_83 = L0_83.GetFlagTable
    L0_83 = L0_83()
    if nil == L0_83 then
      L1_84 = false
      return L1_84
    end
    L1_84 = _ENERGY_GEM_MANAGER
    L1_84 = L1_84.energy_gem_dat
    if nil == L1_84 then
      L2_85 = false
      return L2_85
    end
    L2_85 = _EP04_FLAG_GAME_MANAGER
    L2_85 = L2_85.GetJamingFlg
    L2_85 = L2_85()
    if false ~= L2_85 then
      L2_85 = false
      return L2_85
    end
    L2_85 = L1_84.area_gem_dat
    L2_85 = #L2_85
    for _FORV_6_ = 1, L2_85 do
      invokeTask(function(A0_86)
        local L1_87, L2_88, L3_89, L4_90, L5_91, L6_92, L7_93, L8_94, L9_95
        L1_87 = false
        for L5_91, L6_92 in L2_88(L3_89) do
          L7_93 = L0_83[L6_92]
          L7_93 = L7_93.flag_state
          if 1 == L7_93 then
            L1_87 = true
            break
          end
        end
        if true == L1_87 then
          for L5_91, L6_92 in L2_88(L3_89) do
            L7_93 = L6_92.hdl
            if nil == L7_93 then
              L7_93 = L6_92.hdl
              if nil ~= L7_93 then
                L7_93 = L6_92.hdl
                L8_94 = L7_93
                L7_93 = L7_93.isRunning
                L7_93 = L7_93(L8_94)
                if true == L7_93 then
                  L7_93 = L6_92.hdl
                  L8_94 = L7_93
                  L7_93 = L7_93.try_term
                  L7_93(L8_94)
                end
              end
              L7_93 = findGameObject2
              L8_94 = "Node"
              L9_95 = L5_91
              L7_93 = L7_93(L8_94, L9_95)
              L9_95 = L7_93
              L8_94 = L7_93.getName
              L8_94 = L8_94(L9_95)
              L9_95 = "_EnergyGem"
              L8_94 = L8_94 .. L9_95
              L9_95 = createGameObject2
              L9_95 = L9_95("Gem")
              L9_95:setName(L8_94)
              L9_95:setGemModelNo(4)
              L9_95:setForceMove()
              L9_95:setVisibleBlockHalfSize(150)
              L7_93:appendChild(L9_95)
              L6_92.hdl = L9_95
              L6_92.active = _ENERGY_GEM_MANAGER.energy_gem_dat.all_active_flg
              L9_95:setActive(L6_92.active)
              L9_95:setVisible(L6_92.active)
              L9_95:try_init()
              L9_95:waitForReadyAsync(function()
                L9_95:try_start()
              end)
            else
            end
          end
        end
      end, L1_84.area_gem_dat[_FORV_6_])
    end
  end,
  CallBackEnergyGemGet = function(A0_96)
    local L1_97, L2_98
    L1_97 = invokeTask
    function L2_98(A0_99)
      local L1_100, L2_101, L3_102, L4_103, L5_104, L6_105, L7_106, L8_107, L9_108
      for L4_103, L5_104 in L1_100(L2_101) do
        for L9_108, _FORV_10_ in L6_105(L7_106) do
          if A0_99 == L9_108 .. "_EnergyGem" then
            waitSeconds(2)
            _FORV_10_.hdl = nil
            _FORV_10_.active = false
          end
        end
      end
    end
    L1_97(L2_98, A0_96:getName())
  end,
  SetAllActive = function(A0_109)
    _ENERGY_GEM_MANAGER.energy_gem_dat.all_active_flg = A0_109
    for _FORV_4_, _FORV_5_ in pairs(_ENERGY_GEM_MANAGER.energy_gem_dat.area_gem_dat) do
      for _FORV_9_, _FORV_10_ in pairs(_FORV_5_.gem) do
        if _FORV_10_.hdl ~= nil then
          _FORV_10_.hdl:setActive(A0_109)
          _FORV_10_.hdl:setVisible(A0_109)
          _FORV_10_.active = A0_109
        end
      end
    end
  end
}
_RESET_TIMER_DAT = {
  reset_timer_dat = {
    counter = false,
    cnt = 0,
    jaming_on = false,
    max = {},
    jaming_max = {}
  },
  new = function()
    local L0_110, L1_111
    L0_110 = _RESET_TIMER_DAT
    L0_110 = L0_110.reset_timer_dat
    L0_110.counter = false
    L0_110 = _RESET_TIMER_DAT
    L0_110 = L0_110.reset_timer_dat
    L0_110.cnt = 0
    L0_110 = _RESET_TIMER_DAT
    L0_110 = L0_110.reset_timer_dat
    L0_110.jaming_on = false
    L0_110 = _RESET_TIMER_DAT
    L0_110 = L0_110.reset_timer_dat
    L1_111 = {
      1200,
      1200,
      1200,
      1200
    }
    L0_110.max = L1_111
    L0_110 = _RESET_TIMER_DAT
    L0_110 = L0_110.reset_timer_dat
    L1_111 = {
      1200,
      1200,
      1200,
      1200
    }
    L0_110.jaming_max = L1_111
  end,
  Reset = function(A0_112, A1_113)
    local L2_114, L3_115
    L2_114 = _RESET_TIMER_DAT
    L2_114 = L2_114.reset_timer_dat
    if A1_113 then
      L2_114.jaming_on = true
    else
      L2_114.jaming_on = false
    end
    L3_115 = L2_114.jaming_on
    if L3_115 then
      L3_115 = L2_114.jaming_max
      L3_115 = L3_115[A0_112]
      L2_114.cnt = L3_115
    else
      L3_115 = L2_114.max
      L3_115 = L3_115[A0_112]
      L2_114.cnt = L3_115
    end
  end,
  Start = function()
    local L0_116, L1_117
    L0_116 = _RESET_TIMER_DAT
    L0_116 = L0_116.reset_timer_dat
    L0_116.counter = true
  end,
  Stop = function()
    local L0_118, L1_119
    L0_118 = _RESET_TIMER_DAT
    L0_118 = L0_118.reset_timer_dat
    L0_118.counter = false
  end,
  Update = function(A0_120)
    local L1_121, L2_122
    L1_121 = _RESET_TIMER_DAT
    L1_121 = L1_121.reset_timer_dat
    L2_122 = L1_121.cnt
    L2_122 = L2_122 + A0_120
    L1_121.cnt = L2_122
  end,
  Check = function()
    local L0_123
    L0_123 = _RESET_TIMER_DAT
    L0_123 = L0_123.reset_timer_dat
    if L0_123.counter == true then
      if L0_123.cnt > 0 then
        _RESET_TIMER_DAT.Update(-1)
        return false
      else
        return true
      end
    end
    return false
  end,
  isActive = function()
    local L0_124, L1_125
    L0_124 = _RESET_TIMER_DAT
    L0_124 = L0_124.reset_timer_dat
    L0_124 = L0_124.counter
    return L0_124
  end,
  IsConter = function()
    local L0_126, L1_127
    L0_126 = _RESET_TIMER_DAT
    L0_126 = L0_126.reset_timer_dat
    L0_126 = L0_126.counter
    return L0_126
  end,
  GetCnt = function()
    local L0_128, L1_129
    L0_128 = _RESET_TIMER_DAT
    L0_128 = L0_128.reset_timer_dat
    L0_128 = L0_128.cnt
    return L0_128
  end,
  GetMax = function(A0_130)
    local L1_131, L2_132
    L1_131 = _RESET_TIMER_DAT
    L1_131 = L1_131.reset_timer_dat
    L2_132 = L1_131.jaming_on
    if L2_132 then
      L2_132 = _RESET_TIMER_DAT
      L2_132 = L2_132.reset_timer_dat
      L2_132 = L2_132.jaming_max
      L2_132 = L2_132[A0_130]
      return L2_132
    end
    L2_132 = _RESET_TIMER_DAT
    L2_132 = L2_132.reset_timer_dat
    L2_132 = L2_132.max
    L2_132 = L2_132[A0_130]
    return L2_132
  end
}
_RESET_TIMER_UI_MANAGER = {
  timer_ui_dat = {visible = false},
  new = function()
    local L0_133, L1_134
    L0_133 = _RESET_TIMER_UI_MANAGER
    L0_133 = L0_133.timer_ui_dat
    L0_133.visible = false
  end,
  View = function(A0_135)
    if _RESET_TIMER_UI_MANAGER.IsActive() then
      setDebugDispMissionText("[Reset Time] " .. string.format("%02d", _RESET_TIMER_DAT.GetCnt() / 30) .. " / " .. _RESET_TIMER_DAT.GetMax(A0_135) / 30 .. "s")
    end
  end,
  SetVisible = function(A0_136)
    local L1_137
    L1_137 = _RESET_TIMER_UI_MANAGER
    L1_137 = L1_137.timer_ui_dat
    if A0_136 then
      L1_137.visible = true
    else
      L1_137.visible = false
    end
  end,
  IsActive = function()
    local L0_138, L1_139
    L0_138 = _RESET_TIMER_UI_MANAGER
    L0_138 = L0_138.timer_ui_dat
    L0_138 = L0_138.visible
    return L0_138
  end
}
_FLAG_DAT = {
  new = function(A0_140, A1_141)
    local L2_142, L3_143, L4_144
    L2_142 = {}
    L2_142 = nil
    L4_144 = A0_140
    L3_143 = A0_140.getName
    L3_143 = L3_143(L4_144)
    L4_144 = "_flag"
    L3_143 = L3_143 .. L4_144
    L4_144 = createGameObject2
    L4_144 = L4_144("CaptureFlag")
    L2_142 = L4_144
    L4_144 = L2_142.setName
    L4_144(L2_142, L3_143)
    L4_144 = print
    L4_144("_flag create : " .. L3_143)
    L4_144 = L2_142.setDrawModelName
    L4_144(L2_142, "target_md_01")
    L4_144 = L2_142.setCollisionName
    L4_144(L2_142, "target_md_01")
    L4_144 = L2_142.setAttributeName
    L4_144(L2_142, "target_md_01")
    L4_144 = L2_142.setFloaterParams
    L4_144(L2_142)
    L4_144 = L2_142.setIgnoreGrab
    L4_144(L2_142, true)
    L4_144 = L2_142.setPos
    L4_144(L2_142, Vector(0, 0, 0))
    L4_144 = L2_142.setEventListener
    L4_144(L2_142, "captureflag_falldown", A1_141)
    L4_144 = L2_142.setVisibleBlockEnable
    L4_144(L2_142, false)
    L4_144 = L2_142.setCollidableBlockEnable
    L4_144(L2_142, false)
    L4_144 = L2_142.setLockonPermission
    L4_144(L2_142, false)
    L4_144 = L2_142.falldown
    L4_144(L2_142, Flag.kFalldown_Right, 90)
    L4_144 = A0_140.appendChild
    L4_144(A0_140, L2_142)
    L4_144 = Fn_createGimmickBg
    L4_144 = L4_144(nil, L3_143 .. LOCKON_DUMMY_EXTENSION_NAME, nil, true)
    L4_144:setPos(Vector(0, 1.4, 0))
    L2_142:appendChild(L4_144)
    L4_144:setLockonPermission(false)
    return L2_142
  end,
  FlagFallDown = function(A0_145)
    if A0_145 == nil then
      return false
    end
    findGameObject2("GimmickBg", A0_145:getName() .. LOCKON_DUMMY_EXTENSION_NAME):setLockonPermission(false)
    if A0_145:isFelldown() == false then
      A0_145:falldown(Flag.kFalldown_Right, 250)
      return true
    end
    return false
  end,
  FlagGetUp = function(A0_146)
    local L1_147
    if A0_146 == nil then
      L1_147 = print
      L1_147("ERROR : _FLAG_DAT.FlagGetUp self=nil")
      L1_147 = false
      return L1_147
    end
    L1_147 = findGameObject2
    L1_147 = L1_147("GimmickBg", A0_146:getName() .. LOCKON_DUMMY_EXTENSION_NAME)
    L1_147 = L1_147.setLockonPermission
    L1_147(L1_147, true)
    L1_147 = A0_146.getName
    L1_147 = L1_147(A0_146)
    if L1_147 == nil then
      L1_147 = "no_name"
    end
    if A0_146:isFelldown() == true then
      A0_146:getup(90)
      print("_FLAG_DAT.FlagGetUp flag up succses : " .. L1_147)
      return true
    end
    print("_FLAG_DAT.FlagGetUp flag up failed : " .. L1_147)
    return false
  end,
  FlagDamage = function(A0_148)
    local L1_149
  end
}
_FLAGS_MANAGER = {
  flags_dat = {
    flag_tbl = {},
    FlagFallDownNum = 0,
    FlagGetUpNum = 0,
    AllMNaviVisible = false,
    change_flag = false,
    flag_rand_list = {}
  },
  new = function(A0_150, A1_151, A2_152)
    local L3_153, L4_154, L5_155, L6_156, L7_157, L8_158, L9_159, L10_160
    L3_153 = _FLAGS_MANAGER
    L3_153 = L3_153.flags_dat
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_01 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_02 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_03 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_04 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_05 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_06 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_07 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_08 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_09 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_10 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_11 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_12 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_13 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_14 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_15 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_1_16 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_01 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_02 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_03 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_04 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_05 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_06 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_07 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_2_08 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_3_01 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_3_02 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_3_03 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_3_04 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_3_05 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_3_06 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_01 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_02 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_03 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_04 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_05 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_06 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_07 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_08 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_09 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = true
    L9_159 = true
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_10 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_11 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_12 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_13 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_14 = L5_155
    L5_155.flag_state = 0
    L5_155.flag_old_state = 0
    L5_155.target = 0
    L5_155.owner = 0
    L5_155.mnavi = nil
    L5_155.score = L6_156
    L5_155.hdl = L6_156
    L8_158 = false
    L9_159 = false
    L5_155.phase = L6_156
    L5_155.mmarker = nil
    L4_154.locator2_Flag_4_15 = L5_155
    L3_153.flag_tbl = L4_154
    L3_153 = _FLAGS_MANAGER
    L3_153 = L3_153.flags_dat
    L3_153.FlagFallDownNum = 0
    L3_153 = _FLAGS_MANAGER
    L3_153 = L3_153.flags_dat
    L3_153.FlagGetUpNum = 0
    L3_153 = _FLAGS_MANAGER
    L3_153 = L3_153.flags_dat
    L3_153.AllMNaviVisible = false
    L3_153 = 1
    for L7_157, L8_158 in L4_154(L5_155) do
      L9_159 = _FLAGS_MANAGER
      L9_159 = L9_159.flags_dat
      L9_159 = L9_159.flag_rand_list
      L9_159[L3_153] = L7_157
      L3_153 = L3_153 + 1
    end
    for L8_158, L9_159 in L5_155(L6_156) do
      L10_160 = findGameObject2
      L10_160 = L10_160("Node", L8_158)
      if L4_154 ~= nil then
        L10_160 = L9_159.hdl
        L10_160[1] = _FLAG_DAT.new(L4_154, A0_150)
        L10_160 = L8_158
        L10_160 = L10_160 .. "_Marker"
        L9_159.mmarker = createGameObject2("MapMarker")
        L9_159.mmarker:setName(L10_160)
        L9_159.mmarker:setAssetName("gui_marker_20")
        L9_159.mmarker:setupPattern("A")
        L9_159.hdl[1]:appendChild(L9_159.mmarker)
        L9_159.mmarker:setActive(false)
      end
      L10_160 = _FLAGS_MANAGER
      L10_160 = L10_160.flags_dat
      L10_160.FlagGetUpNum = _FLAGS_MANAGER.flags_dat.FlagGetUpNum + 1
    end
  end,
  GetFlagTable = function()
    local L0_161, L1_162
    L0_161 = _FLAGS_MANAGER
    L0_161 = L0_161.flags_dat
    if nil == L0_161 then
      L0_161 = nil
      return L0_161
    end
    L0_161 = _FLAGS_MANAGER
    L0_161 = L0_161.flags_dat
    L0_161 = L0_161.flag_tbl
    return L0_161
  end,
  GetFlagTableRecord = function(A0_163)
    local L1_164
    L1_164 = _FLAGS_MANAGER
    L1_164 = L1_164.flags_dat
    L1_164 = L1_164.flag_tbl
    L1_164 = L1_164[A0_163]
    return L1_164
  end,
  GetFlagHandle = function(A0_165)
    local L1_166
    L1_166 = _FLAGS_MANAGER
    L1_166 = L1_166.flags_dat
    L1_166 = L1_166.flag_tbl
    L1_166 = L1_166[A0_165]
    L1_166 = L1_166.hdl
    L1_166 = L1_166[1]
    return L1_166
  end,
  AllReset = function()
    local L0_167, L1_168, L2_169, L3_170, L4_171
    L0_167 = _FLAGS_MANAGER
    L0_167 = L0_167.flags_dat
    for L4_171, _FORV_5_ in L1_168(L2_169) do
      _FLAGS_MANAGER.SelectFlagFallDown(L4_171)
      _FORV_5_.flag_state = 0
      _FORV_5_.flag_old_state = 0
      _FORV_5_.target = 0
      _FORV_5_.owner = 0
      _FLAGS_MANAGER.SetMapMarkerVisible(L4_171, false)
      _FORV_5_.flag_state = 0
      _FORV_5_.score = FLAG_BASIC_POINT
    end
    L1_168.flag_exclusion_list = L2_169
    for _FORV_5_, _FORV_6_ in L2_169(L3_170) do
      _FLAGS_MANAGER.flags_dat.flag_rand_list[L1_168] = _FORV_5_
    end
    L2_169()
    L2_169(L3_170)
  end,
  GetFlagFallDownNum = function()
    local L0_172, L1_173
    L0_172 = _FLAGS_MANAGER
    L0_172 = L0_172.flags_dat
    L0_172 = L0_172.FlagFallDownNum
    return L0_172
  end,
  GetFlagGetUpNum = function()
    local L0_174, L1_175
    L0_174 = _FLAGS_MANAGER
    L0_174 = L0_174.flags_dat
    L0_174 = L0_174.FlagGetUpNum
    return L0_174
  end,
  UpdateFlagStateNum = function()
    local L0_176
    L0_176 = _FLAGS_MANAGER
    L0_176 = L0_176.flags_dat
    L0_176.FlagFallDownNum = 0
    L0_176.FlagGetUpNum = 0
    for _FORV_4_, _FORV_5_ in pairs(L0_176.flag_tbl) do
      if _FORV_5_.flag_state == 0 then
        L0_176.FlagFallDownNum = L0_176.FlagFallDownNum + 1
      else
        L0_176.FlagGetUpNum = L0_176.FlagGetUpNum + 1
      end
    end
  end,
  SelectFlagFallDown = function(A0_177)
    local L1_178
    L1_178 = _FLAGS_MANAGER
    L1_178 = L1_178.GetFlagHandle
    L1_178 = L1_178(A0_177)
    if L1_178 == nil then
      print("ERROR : _FLAGS_MANAGER.SelectFlagFallDown hdl=nil")
      return
    end
    _FLAG_DAT.FlagFallDown(L1_178)
    _FLAGS_MANAGER.flags_dat.flag_tbl[A0_177].flag_old_state = _FLAGS_MANAGER.flags_dat.flag_tbl[A0_177].flag_state
    _FLAGS_MANAGER.flags_dat.flag_tbl[A0_177].flag_state = 0
    _FLAGS_MANAGER.SetMapMarkerVisible(A0_177, false)
    _FLAGS_MANAGER.UpdateFlagStateNum()
    _FLAGS_MANAGER.flags_dat.flag_tbl[A0_177].owner = 0
    return true
  end,
  AllFlagFallDown = function()
    local L0_179, L1_180, L2_181, L3_182
    for L3_182, _FORV_4_ in L0_179(L1_180) do
      _FLAGS_MANAGER.SelectFlagFallDown(L3_182)
    end
    L0_179()
  end,
  SelectFlagGetUp = function(A0_183)
    hdl = _FLAGS_MANAGER.GetFlagHandle(A0_183)
    if hdl == nil then
      return
    end
    if _FLAGS_MANAGER.flags_dat.flag_tbl[A0_183] == nil then
      print("ERROR : _FLAGS_MANAGER.SelectFlagGetUp flag_obj=nil")
      return
    end
    if _FLAG_DAT.FlagGetUp(hdl) then
      _FLAGS_MANAGER.UpdateFlagStateNum()
      _FLAGS_MANAGER.flags_dat.flag_tbl[A0_183].flag_old_state = _FLAGS_MANAGER.flags_dat.flag_tbl[A0_183].flag_state
      _FLAGS_MANAGER.flags_dat.flag_tbl[A0_183].flag_state = 1
      _FLAGS_MANAGER.flags_dat.flag_tbl[A0_183].target = 0
      _FLAGS_MANAGER.flags_dat.flag_tbl[A0_183].owner = 0
      _FLAGS_MANAGER.SetMapMarkerVisible(A0_183, true)
      return true
    end
    return false
  end,
  AllFlagGetUp = function(A0_184, A1_185)
    local L2_186, L3_187, L4_188, L5_189
    if A1_185 == nil then
      A1_185 = false
    end
    for L5_189, _FORV_6_ in L2_186(L3_187) do
      if _FORV_6_.phase[A0_184] == true and A1_185 == false then
        _FLAGS_MANAGER.SelectFlagGetUp(L5_189)
      else
        _FLAGS_MANAGER.SelectFlagGetUp(L5_189)
      end
    end
  end,
  FeePriorityCheck = function(A0_190, A1_191)
    local L2_192, L3_193, L4_194, L5_195, L6_196, L7_197, L8_198
    L2_192 = Fn_getPlayer
    L2_192 = L2_192()
    L3_193 = findGameObject2
    L4_194 = "Puppet"
    L5_195 = "fi_00"
    L3_193 = L3_193(L4_194, L5_195)
    L4_194 = Fn_get_distance
    L6_196 = A1_191
    L5_195 = A1_191.getWorldPos
    L5_195 = L5_195(L6_196)
    L7_197 = L3_193
    L6_196 = L3_193.getWorldPos
    L8_198 = L6_196(L7_197)
    L4_194 = L4_194(L5_195, L6_196, L7_197, L8_198, L6_196(L7_197))
    L5_195 = Fn_get_distance
    L7_197 = A1_191
    L6_196 = A1_191.getWorldPos
    L6_196 = L6_196(L7_197)
    L8_198 = L2_192
    L7_197 = L2_192.getWorldPos
    L8_198 = L7_197(L8_198)
    L5_195 = L5_195(L6_196, L7_197, L8_198, L7_197(L8_198))
    L6_196 = Fn_get_distance
    L8_198 = L3_193
    L7_197 = L3_193.getWorldPos
    L7_197 = L7_197(L8_198)
    L8_198 = L2_192.getWorldPos
    L8_198 = L8_198(L2_192)
    L6_196 = L6_196(L7_197, L8_198, L8_198(L2_192))
    L7_197 = _EP04_FLAG_GAME_MANAGER
    L7_197 = L7_197.GetPhase
    L7_197 = L7_197()
    L8_198 = false
    if L7_197 == 1 then
      if L6_196 > 15 and L4_194 > L5_195 and L5_195 > 10 then
        L8_198 = true
      end
    elseif L7_197 == 2 then
      if _SCORE_MANAGER.GetPcWinNum() > 0 then
        if L6_196 > 100 and L4_194 < L5_195 then
          L8_198 = true
        end
      elseif L4_194 > L5_195 and L5_195 < 80 then
        L8_198 = true
      end
    elseif L7_197 == 3 and L6_196 > 100 and L4_194 < L5_195 then
      L8_198 = true
    end
    return L8_198, L4_194, L5_195
  end,
  SelectFlagDamage = function(A0_199)
    local L1_200
    L1_200 = _FLAGS_MANAGER
    L1_200 = L1_200.GetFlagHandle
    L1_200 = L1_200(A0_199)
    if L1_200 == nil then
      print("ERROR : _FLAGS_MANAGER.SelectFlagDamage hdl=nil")
      return
    end
    _FLAG_DAT.FlagDamage(L1_200)
    _FLAGS_MANAGER.SelectFlagFallDown(A0_199)
    _FLAGS_MANAGER.SetMapMarkerVisible(A0_199, false)
    _FLAGS_MANAGER.UpdateFlagStateNum()
  end,
  IsFallDown = function(A0_201)
    local L1_202
    L1_202 = _FLAGS_MANAGER
    L1_202 = L1_202.flags_dat
    L1_202 = L1_202.flag_tbl
    L1_202 = L1_202[A0_201]
    if L1_202 == nil then
      print("ERROR : _FLAGS_MANAGER.IsFallDown flag_record=nil")
      return true
    end
    if L1_202.flag_state == 0 then
      return true
    end
    return false
  end,
  SetAllMapMarkerVisible = function(A0_203)
    local L1_204, L2_205, L3_206, L4_207, L5_208
    L1_204 = _FLAGS_MANAGER
    L1_204 = L1_204.flags_dat
    if A0_203 then
      L1_204.AllMNaviVisible = true
    else
      L1_204.AllMNaviVisible = false
    end
    if L2_205 == true then
      for L5_208, _FORV_6_ in L2_205(L3_206) do
        if _FLAGS_MANAGER.IsFallDown(L5_208) == false then
          _FLAGS_MANAGER.SetMapMarkerVisible(L5_208, true)
        end
      end
    else
      for L5_208, _FORV_6_ in L2_205(L3_206) do
        _FLAGS_MANAGER.SetMapMarkerVisible(L5_208, false)
      end
    end
  end,
  SetAllMNaviVisible = function(A0_209)
    local L1_210
    L1_210 = _FLAGS_MANAGER
    L1_210 = L1_210.flags_dat
    if A0_209 then
      L1_210.AllMNaviVisible = true
    else
      L1_210.AllMNaviVisible = false
    end
    for _FORV_5_, _FORV_6_ in pairs(L1_210.flag_tbl) do
      if _FORV_6_.mnavi then
        _FORV_6_.mnavi:setActive(L1_210.AllMNaviVisible)
      end
    end
  end,
  GetAllMNaviVisibleFlag = function()
    local L0_211, L1_212
    L0_211 = _FLAGS_MANAGER
    L0_211 = L0_211.flags_dat
    L0_211 = L0_211.AllMNaviVisible
    return L0_211
  end,
  SetMapMarkerVisible = function(A0_213, A1_214)
    local L2_215, L3_216
    L2_215 = _FLAGS_MANAGER
    L2_215 = L2_215.flags_dat
    L2_215 = L2_215.flag_tbl
    L2_215 = L2_215[A0_213]
    L2_215 = L2_215.mmarker
    if A1_214 then
      L3_216 = L2_215.setActive
      L3_216(L2_215, true)
      L3_216 = L2_215.playIn
      L3_216(L2_215)
    else
      function L3_216(A0_217)
        A0_217:playOut()
        while A0_217:isOutEnd() do
          wait()
        end
        A0_217:setActive(false)
      end
      invokeTask(L3_216, L2_215)
    end
  end,
  CreateMNavi = function(A0_218)
    if _FLAGS_MANAGER.GetFlagHandle(A0_218) == nil then
      print("ERROR : _FLAGS_MANAGER.CreateMNavi unknow name")
      return
    end
  end,
  DeleteMNavi = function(A0_219)
    if _FLAGS_MANAGER.GetFlagHandle(A0_219) == nil then
      print("ERROR : _FLAGS_MANAGER.DeleteMNavi unknow name")
      return
    end
    if _FLAGS_MANAGER.flags_dat.flag_tbl[A0_219] == nil then
      print("ERROR : _FLAGS_MANAGER.SelectFlagFallDown flag_obj=nil")
      return
    end
  end,
  ActivationEachPhase = function(A0_220)
    local L1_221
    L1_221 = _FLAGS_MANAGER
    L1_221 = L1_221.flags_dat
    for _FORV_5_, _FORV_6_ in pairs(L1_221.flag_tbl) do
      _FORV_6_.phase[A0_220] = true
    end
  end
}
_SCORE_MANAGER = {
  score_dat = {
    max = {},
    pc = 0,
    npc = 0,
    ex = 0,
    pc_win = 0,
    fi_win = 0
  },
  new = function()
    local L0_222
    L0_222 = _SCORE_MANAGER
    L0_222 = L0_222.score_dat
    L0_222.max = {
      END_SCORE,
      END_SCORE,
      END_SCORE,
      END_SCORE
    }
    L0_222.pc = 0
    L0_222.npc = 0
    L0_222.ex = 1
    L0_222.pc_win = 0
    L0_222.fi_win = 0
  end,
  GetPcScore = function()
    local L0_223, L1_224
    L0_223 = _SCORE_MANAGER
    L0_223 = L0_223.score_dat
    L0_223 = L0_223.pc
    return L0_223
  end,
  GetNpcScore = function()
    local L0_225, L1_226
    L0_225 = _SCORE_MANAGER
    L0_225 = L0_225.score_dat
    L0_225 = L0_225.npc
    return L0_225
  end,
  GetMaxScore = function(A0_227)
    local L1_228
    if A0_227 == 2 then
      L1_228 = PHASE_2_ZURU_ACTIVE_SCORE
      return L1_228
    elseif A0_227 == 3 then
      L1_228 = PHASE_3_ZURU_ACTIVE_SCORE
      return L1_228
    end
    L1_228 = _SCORE_MANAGER
    L1_228 = L1_228.score_dat
    L1_228 = L1_228.max
    L1_228 = L1_228[A0_227]
    return L1_228
  end,
  JudgePcScore = function()
    local L0_229
    L0_229 = _SCORE_MANAGER
    L0_229 = L0_229.score_dat
    if L0_229.pc > L0_229.npc then
      return true
    end
    return false
  end,
  GetPcWinNum = function()
    local L0_230, L1_231
    L0_230 = _SCORE_MANAGER
    L0_230 = L0_230.score_dat
    L0_230 = L0_230.pc_win
    return L0_230
  end,
  AddPcWinNum = function(A0_232)
    local L1_233, L2_234
    L1_233 = _SCORE_MANAGER
    L1_233 = L1_233.score_dat
    if A0_232 == nil then
      A0_232 = 1
    end
    L2_234 = L1_233.pc_win
    L2_234 = L2_234 + A0_232
    L1_233.pc_win = L2_234
  end,
  GetNpcWinNum = function()
    local L0_235, L1_236
    L0_235 = _SCORE_MANAGER
    L0_235 = L0_235.score_dat
    L0_235 = L0_235.fi_win
    return L0_235
  end,
  AddNpcWinNum = function(A0_237)
    local L1_238, L2_239
    L1_238 = _SCORE_MANAGER
    L1_238 = L1_238.score_dat
    if A0_237 == nil then
      A0_237 = 1
    end
    L2_239 = L1_238.fi_win
    L2_239 = L2_239 + A0_237
    L1_238.fi_win = L2_239
  end,
  Reset = function(A0_240)
    local L1_241
    L1_241 = _SCORE_MANAGER
    L1_241 = L1_241.score_dat
    L1_241.pc = 0
    L1_241.npc = 0
  end,
  UpdatePc = function(A0_242, A1_243)
    local L2_244
    L2_244 = _SCORE_MANAGER
    L2_244 = L2_244.score_dat
    if L2_244 == nil then
      print("ERROR : _SCORE_MANAGER.UpdatePc score_dat=nil")
      return
    end
    L2_244.pc = L2_244.pc + A0_242
    if L2_244.pc > L2_244.max[A1_243] then
      L2_244.pc = L2_244.max[A1_243]
    end
    if L2_244.pc < 0 then
      L2_244.pc = 0
    end
  end,
  UpdateNpc = function(A0_245, A1_246)
    local L2_247
    L2_247 = _SCORE_MANAGER
    L2_247 = L2_247.score_dat
    if L2_247 == nil then
      print("ERROR : _SCORE_MANAGER.UpdateNpc score_dat=nil")
      return
    end
    L2_247.npc = L2_247.npc + A0_245
    if L2_247.npc > L2_247.max[A1_246] then
      L2_247.npc = L2_247.max[A1_246]
    end
    if L2_247.npc < 0 then
      L2_247.npc = 0
    end
  end,
  SetPcScore = function(A0_248, A1_249)
    local L2_250
    L2_250 = _SCORE_MANAGER
    L2_250 = L2_250.score_dat
    if L2_250 == nil then
      print("ERROR : _SCORE_MANAGER.SetPcScore score_dat=nil")
      return
    end
    L2_250.pc = A0_248
    if L2_250.pc > L2_250.max[A1_249] then
      L2_250.pc = L2_250.max[A1_249]
    end
    if L2_250.pc < 0 then
      L2_250.pc = 0
    end
  end,
  SetNpcScore = function(A0_251, A1_252)
    local L2_253
    L2_253 = _SCORE_MANAGER
    L2_253 = L2_253.score_dat
    if L2_253 == nil then
      print("ERROR : _SCORE_MANAGER.SetNpcScore score_dat=nil")
      return
    end
    L2_253.npc = A0_251
    if L2_253.npc > L2_253.max[A1_252] then
      L2_253.npc = L2_253.max[A1_252]
    end
    if L2_253.npc < 0 then
      L2_253.npc = 0
    end
  end,
  Check = function()
    local L0_254
    L0_254 = _SCORE_MANAGER
    L0_254 = L0_254.score_dat
    if L0_254 == nil then
      print("ERROR : _SCORE_MANAGER.Check score_dat=nil")
      return
    end
    if L0_254.max[_EP04_FLAG_GAME_MANAGER.GetPhase()] <= L0_254.pc or L0_254.max[_EP04_FLAG_GAME_MANAGER.GetPhase()] <= L0_254.npc then
      return true
    else
      return false
    end
  end
}
_SCORE_UI_MANAGER = {
  score_ui_dat = {visible = false},
  new = function()
    local L0_255
    L0_255 = _SCORE_UI_MANAGER
    L0_255 = L0_255.score_ui_dat
    L0_255.visible = false
    L0_255.old_gage_val = 500
    HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Count)
    HUD:captureFlagClose(false)
    HUD:captureFlagSetNum(HUD.kBell_Left, 0)
    HUD:captureFlagSetNum(HUD.kBell_Right, 0)
  end,
  SetVisible = function(A0_256)
    local L1_257
    L1_257 = _SCORE_UI_MANAGER
    L1_257 = L1_257.score_ui_dat
    if A0_256 then
      L1_257.visible = true
    else
      L1_257.visible = false
    end
    if L1_257.visible then
      HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Count)
    else
      HUD:captureFlagClose(false)
    end
  end,
  View = function(A0_258)
    local L1_259, L2_260, L3_261
    L1_259 = _SCORE_UI_MANAGER
    L1_259 = L1_259.score_ui_dat
    L2_260 = L1_259.visible
    if L2_260 then
      L2_260 = _SCORE_MANAGER
      L2_260 = L2_260.GetPcScore
      L2_260 = L2_260()
      L3_261 = _SCORE_MANAGER
      L3_261 = L3_261.GetNpcScore
      L3_261 = L3_261()
      HUD:captureFlagSetNum(HUD.kBell_Left, L2_260)
      HUD:captureFlagSetNum(HUD.kBell_Right, L3_261)
    end
  end,
  Reset = function()
    HUD:captureFlagSetNum(HUD.kBell_Left, 0)
    HUD:captureFlagSetNum(HUD.kBell_Right, 0)
  end,
  IsUiAnime = function()
    if _SCORE_UI_MANAGER.score_ui_dat.visible then
      return HUD:captureFlagIsGaugeChanging()
    end
    return false
  end,
  Delete = function()
    HUD:captureFlagClose(true)
  end
}
_OUTFILEDNPCS = {
  npc_drama_dat = {
    puppet_tbl = {},
    chara_name_tbl = {
      "phi01",
      "ryz01",
      "miz01",
      "cid01",
      "sis01",
      "man34",
      "vog01",
      "man50",
      "man51",
      "man52"
    },
    demo_pos_node_tbl = {
      phi01 = "locator2_phi01_demo_01",
      ryz01 = "locator2_ryz01_demo_01",
      miz01 = "locator2_miz01_demo_01",
      cid01 = "locator2_cid01_demo_01",
      sis01 = "locator2_sis01_demo_01",
      man34 = "locator2_man34_demo_01",
      vog01 = "locator2_vog01_demo_01",
      man50 = "locator2_man50_demo_01",
      man51 = "locator2_man51_demo_01",
      man52 = "locator2_man52_demo_01"
    },
    flag_fight_pos_node_tbl = {
      phi01 = nil,
      ryz01 = "locator2_ryz01_game_01",
      miz01 = "locator2_miz01_game_01",
      cid01 = "locator2_cid01_game_01",
      sis01 = "locator2_sis01_game_01",
      man34 = "locator2_man34_game_01",
      vog01 = "locator2_vog01_game_01",
      man50 = "locator2_man50_game_01",
      man51 = "locator2_man51_game_01",
      man52 = "locator2_man52_game_01"
    }
  },
  new = function()
    local L0_262, L1_263, L2_264
    L0_262 = _OUTFILEDNPCS
    L0_262 = L0_262.npc_drama_dat
    L1_263 = {}
    L2_264 = 0
    for _FORV_6_, _FORV_7_ in pairs(L0_262.chara_name_tbl) do
      L1_263[L2_264] = {
        name = _FORV_7_,
        type = _FORV_7_,
        node = L0_262.demo_pos_node_tbl[_FORV_7_],
        active = true,
        attach = true,
        color_variation = 0,
        start = true
      }
      L2_264 = L2_264 + 1
    end
    Fn_loadNpcEventMotion("vog01", {
      sit_vog = "vog01_sit_watching_00"
    })
    Fn_watchNpc("phi01", false)
    for _FORV_7_, _FORV_8_ in pairs(L1_263) do
      L0_262.puppet_tbl[_FORV_8_.name] = Fn_findNpcPuppet(_FORV_8_.name)
    end
  end,
  isAllReady = function()
    local L0_265, L1_266, L2_267, L3_268, L4_269, L5_270
    L0_265 = _OUTFILEDNPCS
    L0_265 = L0_265.npc_drama_dat
    if nil == L0_265 then
      L1_266 = nil
      return L1_266
    end
    L1_266 = true
    for L5_270, _FORV_6_ in L2_267(L3_268) do
      if L0_265.flag_fight_pos_node_tbl[L5_270] ~= nil and nil ~= Fn_findNpc(L5_270) and L1_266 then
        L1_266 = Fn_findNpc(L5_270):isReadyNpc()
      end
    end
    return L1_266
  end,
  SetDemoPos = function()
    local L0_271, L1_272, L2_273, L3_274, L4_275
    L0_271 = _OUTFILEDNPCS
    L0_271 = L0_271.npc_drama_dat
    if nil == L0_271 then
      return L1_272
    end
    for L4_275, _FORV_5_ in L1_272(L2_273) do
      if _OUTFILEDNPCS.npc_drama_dat.demo_pos_node_tbl[L4_275] ~= nil then
        Fn_warpNpc(L4_275, _OUTFILEDNPCS.npc_drama_dat.demo_pos_node_tbl[L4_275])
        Fn_watchNpc(L4_275, false)
        Fn_setNpcVisible(L4_275, true)
      else
        Fn_setNpcVisible(L4_275, false)
      end
    end
    L4_275 = "vog01_sit_watching_00"
    L1_272(L2_273, L3_274, L4_275)
    L4_275 = false
    L1_272(L2_273, L3_274, L4_275)
    if L1_272 ~= nil then
      L2_273(L3_274)
      L2_273(L3_274)
    end
    return L2_273
  end,
  SetFlagFightPos = function()
    local L0_276, L1_277, L2_278, L3_279, L4_280
    L0_276 = _OUTFILEDNPCS
    L0_276 = L0_276.npc_drama_dat
    if nil == L0_276 then
      return L1_277
    end
    for L4_280, _FORV_5_ in L1_277(L2_278) do
      if _OUTFILEDNPCS.npc_drama_dat.flag_fight_pos_node_tbl[L4_280] ~= nil then
        Fn_warpNpc(L4_280, _OUTFILEDNPCS.npc_drama_dat.flag_fight_pos_node_tbl[L4_280])
        Fn_watchNpc(L4_280, true)
        Fn_setNpcVisible(L4_280, true)
      else
        Fn_setNpcVisible(L4_280, false)
      end
    end
    L4_280 = "vog01_sit_watching_00"
    L1_277(L2_278, L3_279, L4_280)
    L1_277(L2_278)
    return L1_277
  end
}
_COMMENT_UI = {
  comment_ui_dat = {
    text = {},
    main_task_hdl = nil
  },
  comment_ui_main_task_dat = {
    pause_flg = false,
    interruption_flg = false,
    serif_task_hdl = nil,
    now_serif_task_priority = 0,
    order = nil,
    req_kit_Whiff_Soliloquy = false,
    req_alert = false,
    req_phase_by_soliloquy = false,
    sound_hdl = nil,
    sound_interval_hdl = nil,
    live_coverage_count_task = false,
    request_live_coverage = false
  },
  new = function()
    local L0_281, L1_282, L2_283
    L0_281 = _COMMENT_UI
    L0_281 = L0_281.comment_ui_dat
    L1_282 = {}
    L2_283 = {
      {
        draw = {text = "ep04_09000", sound = "mis_116"}
      },
      {
        dominance = {text = "ep04_09001", sound = "mis_120"},
        recessive = {text = "ep04_09002", sound = "mis_123"},
        draw = {text = "", sound = ""}
      },
      {
        dominance = {text = "ep04_09003", sound = "mis_129"},
        recessive = {text = "", sound = ""},
        draw = {text = "ep04_09004", sound = "mis_129"}
      }
    }
    L1_282.start_comment = L2_283
    L2_283 = {
      {
        win = {text = "ep04_09005", sound = "mis_118"},
        lose = {text = "ep04_09006", sound = "mis_122"},
        game_end = {text = "ep04_09007", sound = "mis_130"}
      },
      {
        win = {text = "ep04_09008", sound = "mis_124"},
        lose = {text = "ep04_09009", sound = "mis_126"},
        game_end = {text = "ep04_09010", sound = "mis_130"}
      },
      {
        win = {text = "ep04_09011", sound = "mis_130"},
        lose = {text = "ep04_09011", sound = "mis_130"},
        game_end = {text = "ep04_09011", sound = "mis_130"}
      }
    }
    L1_282.end_comment = L2_283
    L2_283 = {}
    L2_283.reset_flag = {text = "ep04_09012", sound = "mis_127"}
    L1_282.announce_flag = L2_283
    L2_283 = {}
    L2_283.dominance_kit = {text = "ep04_09013", sound = "mis_120"}
    L2_283.dominance_fi = {text = "ep04_09014", sound = "mis_123"}
    L2_283.draw = {text = "ep04_09015", sound = "mis_128"}
    L1_282.announce_score = L2_283
    L2_283 = {}
    L2_283[1] = {
      {}
    }
    L2_283[2] = {
      [1] = {text = "ep04_09025", sound = nil},
      [2] = {text = "ep04_09019", sound = nil},
      [3] = {text = "ep04_09020", sound = nil},
      [4] = {text = "ep04_09018", sound = nil}
    }
    L2_283[3] = {
      [1] = {text = "ep04_09031", sound = nil},
      [2] = {text = "ep04_09021", sound = nil},
      [3] = {text = "ep04_09016", sound = nil},
      [4] = {text = "ep04_09017", sound = nil}
    }
    L1_282.phase_by_soliloquy = L2_283
    L2_283 = {}
    L2_283[1] = {text = "ep04_09024", sound = "pc1_028"}
    L1_282.alert = L2_283
    L2_283 = {
      {
        draw = {
          text = "ep04_09026",
          sound = {"vog_904a", "vog_915b"},
          sound_interval = {0.8},
          text_interval = 3
        }
      },
      {
        dominance = {
          text = "ep04_09027",
          sound = {"vog011a", "vog013c"},
          sound_interval = {0.8},
          text_interval = 4
        },
        recessive = {
          text = "ep04_09028",
          sound = {
            "vog014a",
            "vog014c",
            "vog013c"
          },
          sound_interval = {0.6, 2.5},
          text_interval = 4.5
        },
        draw = {
          text = "ep04_09027",
          sound = {"vog011a", "vog013c"},
          sound_interval = {0.8},
          text_interval = 4
        }
      },
      {
        draw = {
          text = "ep04_09029",
          sound = {"vog005b", "vog012b"},
          sound_interval = {0.8},
          text_interval = 4
        }
      }
    }
    L1_282.pre_start_vogo_comment = L2_283
    L0_281.text = L1_282
  end,
  CommentStart = function()
    local L0_284
    L0_284 = _COMMENT_UI
    L0_284 = L0_284.comment_ui_dat
    if L0_284.main_task_hdl == nil or L0_284.main_task_hdl:isRunning() == false then
      L0_284.main_task_hdl = invokeTask(_COMMENT_UI.TaskComment)
    end
  end,
  CommentStart2 = function()
    invokeTask(function()
      local L0_285
      L0_285 = _COMMENT_UI
      L0_285 = L0_285.comment_ui_dat
      if _SCORE_MANAGER.GetPcWinNum() - _SCORE_MANAGER.GetNpcWinNum() > 0 then
      else
      end
      _COMMENT_UI.ViewSerifTask(L0_285.text.pre_start_vogo_comment[_EP04_FLAG_GAME_MANAGER.GetPhase()].recessive, L0_285.text.pre_start_vogo_comment[_EP04_FLAG_GAME_MANAGER.GetPhase()].recessive.text_interval, nil)
      if nil ~= _COMMENT_UI.comment_ui_main_task_dat then
        while nil ~= _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl do
          else
            return
          end
          wait()
        end
      waitSeconds(0.5)
      if nil == _COMMENT_UI.comment_ui_dat then
        return
      end
      Fn_captionView("ep04_09022", 3, true, Font.kLayerFront)
      Sound:pulse("vog_155")
      waitSeconds(4)
      if nil == _COMMENT_UI.comment_ui_dat then
        return
      end
      Fn_captionView("ep04_09023", 3, true, Font.kLayerFront)
      Sound:pulse("vog_156")
      if nil == _COMMENT_UI.comment_ui_dat then
        return
      end
      if L0_285.main_task_hdl == nil or L0_285.main_task_hdl:isRunning() == false then
        L0_285.main_task_hdl = invokeTask(_COMMENT_UI.TaskComment)
      end
    end)
  end,
  CommentEnd = function()
    local L0_286, L1_287, L2_288
    L0_286 = _COMMENT_UI
    L0_286 = L0_286.comment_ui_dat
    L1_287 = _COMMENT_UI
    L1_287 = L1_287.comment_ui_main_task_dat
    L2_288 = L0_286.main_task_hdl
    if L2_288 ~= nil then
      L2_288:abort()
      L0_286.main_task_hdl = nil
    end
    if L1_287.serif_task_hdl ~= nil then
      _COMMENT_UI.StopSerifTask()
      L1_287.serif_task_hdl = nil
    end
  end,
  IsCommentStart = function()
    local L0_289, L1_290, L2_291, L3_292
    L0_289 = _COMMENT_UI
    L0_289 = L0_289.comment_ui_dat
    L1_290 = _COMMENT_UI
    L1_290 = L1_290.comment_ui_main_task_dat
    L2_291 = false
    L3_292 = L0_289.main_task_hdl
    if L3_292 ~= nil and not L2_291 then
      L2_291 = L3_292:isRunning()
    end
    return L2_291
  end,
  CommentIsPlay = function()
    local L0_293, L1_294, L2_295, L3_296
    L0_293 = _COMMENT_UI
    L0_293 = L0_293.comment_ui_dat
    L1_294 = _COMMENT_UI
    L1_294 = L1_294.comment_ui_main_task_dat
    L2_295 = false
    L3_296 = L0_293.main_task_hdl
    if L3_296 ~= nil and not L2_295 then
      L2_295 = L3_296:isRunning()
    end
    if L1_294.serif_task_hdl ~= nil and not L2_295 then
      L2_295 = L1_294.serif_task_hdl:isRunning()
    end
    return L2_295
  end,
  TaskComment = function()
    local L0_297, L1_298, L2_299, L3_300, L4_301, L5_302, L6_303, L7_304, L8_305, L9_306, L10_307, L11_308, L12_309
    L0_297 = _COMMENT_UI
    L0_297 = L0_297.comment_ui_dat
    L1_298 = _COMMENT_UI
    L1_298 = L1_298.comment_ui_main_task_dat
    L1_298.pause_flg = false
    L1_298.interruption_flg = false
    L1_298.now_serif_task_priority = 0
    L1_298.order = nil
    L1_298.req_kit_Whiff_Soliloquy = false
    L1_298.req_alert = false
    L1_298.req_phase_by_soliloquy = false
    L1_298.live_coverage_count_task = false
    L1_298.request_live_coverage = false
    L2_299 = _EP04_FLAG_GAME_MANAGER
    L2_299 = L2_299.GetPhase
    L2_299 = L2_299()
    L3_300 = L2_299
    L4_301 = _EP04_FLAG_GAME_MANAGER
    L4_301 = L4_301.GetFlagResetNum
    L4_301 = L4_301()
    L5_302 = L4_301
    L6_303 = waitSeconds
    L7_304 = 2.5
    L6_303(L7_304)
    L6_303 = _SCORE_MANAGER
    L6_303 = L6_303.GetPcWinNum
    L6_303 = L6_303()
    L7_304 = _SCORE_MANAGER
    L7_304 = L7_304.GetNpcWinNum
    L7_304 = L7_304()
    if L6_303 == L7_304 then
      L8_305 = _COMMENT_UI
      L8_305 = L8_305.ViewSerifTask
      L9_306 = L0_297.text
      L9_306 = L9_306.start_comment
      L9_306 = L9_306[L2_299]
      L9_306 = L9_306.draw
      L10_307 = 4
      L11_308 = 1
      L8_305(L9_306, L10_307, L11_308)
    elseif L6_303 > L7_304 then
      L8_305 = _COMMENT_UI
      L8_305 = L8_305.ViewSerifTask
      L9_306 = L0_297.text
      L9_306 = L9_306.start_comment
      L9_306 = L9_306[L2_299]
      L9_306 = L9_306.dominance
      L10_307 = 4
      L11_308 = 1
      L8_305(L9_306, L10_307, L11_308)
    else
      L8_305 = _COMMENT_UI
      L8_305 = L8_305.ViewSerifTask
      L9_306 = L0_297.text
      L9_306 = L9_306.start_comment
      L9_306 = L9_306[L2_299]
      L9_306 = L9_306.recessive
      L10_307 = 4
      L11_308 = 1
      L8_305(L9_306, L10_307, L11_308)
    end
    L8_305 = 0
    L9_306 = ""
    L10_307 = END_SCORE
    L10_307 = L10_307 + 1
    L11_308 = invokeTask
    function L12_309()
      while nil ~= _COMMENT_UI.comment_ui_main_task_dat do
        waitSeconds(30)
        _COMMENT_UI.comment_ui_main_task_dat.request_live_coverage = true
        while nil ~= _COMMENT_UI.comment_ui_main_task_dat and true == _COMMENT_UI.comment_ui_main_task_dat.request_live_coverage do
          wait()
        end
      end
    end
    L11_308 = L11_308(L12_309)
    L1_298.live_coverage_count_task = L11_308
    L11_308 = false
    L12_309 = nil
    while L2_299 >= L3_300 do
      L5_302 = L4_301
      L4_301 = _EP04_FLAG_GAME_MANAGER.GetFlagResetNum()
      L3_300 = _EP04_FLAG_GAME_MANAGER.GetPhase()
      if L1_298.pause_flg == false then
        if _COMMENT_UI.comment_ui_main_task_dat.req_alert == true then
          if false == _COMMENT_UI.ViewSerifTask(L0_297.text.alert[1], 3, 4) then
            _COMMENT_UI.comment_ui_main_task_dat.req_alert = false
          end
        elseif false == L11_308 and _COMMENT_UI.comment_ui_main_task_dat.req_phase_by_soliloquy == true then
          L11_308 = true
          L12_309 = invokeTask(function(A0_310)
            local L2_311
            L2_311 = #A0_310
            while _COMMENT_UI.comment_ui_main_task_dat and not (L2_311 <= 0) do
              while _COMMENT_UI.comment_ui_main_task_dat do
                if true == _COMMENT_UI.comment_ui_main_task_dat.req_phase_by_soliloquy then
                  _COMMENT_UI.comment_ui_main_task_dat.req_phase_by_soliloquy = false
                end
                if true ~= _COMMENT_UI.ViewSerifTask(A0_310[0 + 1], 3, 5) then
                  wait()
                end
              end
              waitSeconds(10)
            end
          end, L0_297.text.phase_by_soliloquy[L2_299])
        end
        if false == _EP04_FLAG_GAME_MANAGER.GetJamingFlg() and _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl == nil and true == L1_298.request_live_coverage and L10_307 ~= _SCORE_MANAGER.GetPcScore() - _SCORE_MANAGER.GetNpcScore() then
          L10_307 = _SCORE_MANAGER.GetPcScore() - _SCORE_MANAGER.GetNpcScore()
          if 0 < _SCORE_MANAGER.GetPcScore() - _SCORE_MANAGER.GetNpcScore() then
          else
          end
          if L9_306 ~= "dominance_fi" and true == _COMMENT_UI.ViewSerifTask(L0_297.text.announce_score.dominance_fi, 3, 6) then
            L9_306 = "dominance_fi"
            L1_298.request_live_coverage = false
          end
        end
      end
      wait()
    end
    if nil ~= L12_309 then
      L12_309:abort()
      L12_309 = nil
    end
    L6_303 = _SCORE_MANAGER.GetPcWinNum()
    L7_304 = _SCORE_MANAGER.GetNpcWinNum()
    if L2_299 >= MAX_PHASE then
      if _SCORE_MANAGER.GetPcScore() >= _SCORE_MANAGER.GetMaxScore(L2_299) then
        order_comment_text = L0_297.text.end_comment[L2_299].lose
      else
        order_comment_text = L0_297.text.end_comment[L2_299].game_end
      end
    elseif L7_304 >= 2 then
      order_comment_text = L0_297.text.end_comment[L2_299].game_end
    elseif _savedata_vars[ggd["Savedata__EventFlags__ep04__flag" .. string.format("%02d", L2_299)]] == 1 then
      order_comment_text = L0_297.text.end_comment[L2_299].win
    else
      order_comment_text = L0_297.text.end_comment[L2_299].lose
    end
    _COMMENT_UI.ViewSerifTask(order_comment_text, 3, nil)
    if L1_298.serif_task_hdl ~= nil then
      while L1_298.serif_task_hdl:isRunning() do
        wait()
      end
    end
    _COMMENT_UI.main_task_hdl = nil
  end,
  ViewSerifTask = function(A0_312, A1_313, A2_314)
    print("_COMMENT_UI.ViewSerifTask start")
    if _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl ~= nil then
      if A2_314 ~= nil then
        if A2_314 >= _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority then
          return false
        else
          _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = A2_314
        end
      else
        _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 0
      end
    end
    _COMMENT_UI.StopSerifTask()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = invokeTask(_COMMENT_UI.TaskViewSerifTask, A0_312, A1_313)
    print("_COMMENT_UI.ViewSerifTask end")
    return true
  end,
  TaskViewSerifTask = function(A0_315, A1_316)
    local L2_317, L3_318, L4_319
    L2_317 = _COMMENT_UI
    L2_317 = L2_317.comment_ui_dat
    L3_318 = _COMMENT_UI
    L3_318 = L3_318.comment_ui_main_task_dat
    L4_319 = A0_315.text
    if nil ~= L4_319 then
      L4_319 = type
      L4_319 = L4_319(A0_315.text)
      if "string" == L4_319 then
        L4_319 = Fn_captionViewEnd
        L4_319()
        L4_319 = Fn_captionView
        L4_319(A0_315.text, A1_316, true, Font.kLayerFront)
      end
    end
    L4_319 = _COMMENT_UI
    L4_319 = L4_319.SoundStop
    L4_319()
    L4_319 = A0_315.sound
    if nil ~= L4_319 then
      L4_319 = type
      L4_319 = L4_319(A0_315.sound)
      if "table" == L4_319 then
        L4_319 = {}
        if nil ~= A0_315.sound_interval then
          for _FORV_8_ = 1, #A0_315.sound_interval do
            L4_319[_FORV_8_] = A0_315.sound_interval[_FORV_8_]
          end
        else
          for _FORV_8_ = 1, #A0_315.sound - 1 do
            L4_319[_FORV_8_] = A1_316 / #A0_315.sound
          end
        end
        L3_318.sound_hdl = _FOR_:playSEHandle(A0_315.sound[1], 1, nil, nil)
        L3_318.sound_interval_hdl = invokeTask(function()
          local L0_320, L1_321, L2_322, L3_323, L4_324
          for L3_323 = 2, #L1_321 do
            L4_324 = L3_323 - 1
            L4_324 = L4_319[L4_324]
            waitSeconds(L4_324)
            if nil == _COMMENT_UI.comment_ui_main_task_dat then
              return
            end
            L3_318.sound_hdl = Sound:playSEHandle(A0_315.sound[L3_323], 1, nil, nil)
          end
        end)
        break
      else
        L4_319 = Sound
        L4_319 = L4_319.playSEHandle
        L4_319 = L4_319(L4_319, A0_315.sound, 1, nil, nil)
        L3_318.sound_hdl = L4_319
      end
    end
    L4_319 = waitSeconds
    L4_319(A1_316)
    L4_319 = Fn_captionViewEnd
    L4_319()
    L4_319 = wait
    L4_319(10)
    L3_318.serif_task_hdl = nil
    L3_318.now_serif_task_priority = 100
  end,
  StopSerifTask = function()
    local L1_325, L2_326
    L1_325 = _COMMENT_UI
    L1_325 = L1_325.comment_ui_dat
    L2_326 = _COMMENT_UI
    L2_326 = L2_326.comment_ui_main_task_dat
    if L2_326.serif_task_hdl ~= nil then
      L2_326.serif_task_hdl:abort()
      L2_326.serif_task_hdl = nil
    end
    Fn_captionViewEnd()
    _COMMENT_UI.SoundStop()
  end,
  RequestPhaseBySoliloquy = function()
    local L0_327
    L0_327 = _COMMENT_UI
    L0_327 = L0_327.comment_ui_main_task_dat
    if L0_327 == nil then
      print("_COMMENT_UI : _COMMENT_UI.RequestPhaseBySoliloquy comment_ui_main_task_dat=nil")
      return
    end
    _COMMENT_UI.comment_ui_main_task_dat.req_phase_by_soliloquy = true
  end,
  Pase = function(A0_328)
    local L1_329
    L1_329 = _COMMENT_UI
    L1_329 = L1_329.comment_ui_main_task_dat
    if L1_329 == nil then
      print("_COMMENT_UI : _COMMENT_UI.Pase _COMMENT_UI.comment_ui_main_task_dat=nil")
      return
    end
    if A0_328 == true then
      _COMMENT_UI.comment_ui_main_task_dat.pause_flg = true
    else
      _COMMENT_UI.comment_ui_main_task_dat.pause_flg = false
    end
  end,
  RequestAlertComeback = function()
    local L0_330
    L0_330 = _COMMENT_UI
    L0_330 = L0_330.comment_ui_main_task_dat
    if L0_330 == nil then
      print("_COMMENT_UI : _COMMENT_UI.RequestAlertComeback _COMMENT_UI.comment_ui_main_task_dat=nil")
      return
    end
    L0_330.req_alert = true
  end,
  SoundStop = function()
    if nil ~= _COMMENT_UI.comment_ui_main_task_dat.sound_interval_hdl then
      _COMMENT_UI.comment_ui_main_task_dat.sound_interval_hdl:abort()
      _COMMENT_UI.comment_ui_main_task_dat.sound_interval_hdl = nil
    end
    if nil ~= _COMMENT_UI.comment_ui_main_task_dat.sound_hdl then
      Sound:stopSEHandle(_COMMENT_UI.comment_ui_main_task_dat.sound_hdl)
      _COMMENT_UI.comment_ui_main_task_dat.sound_hdl = nil
    end
  end
}
_EP04_FLAG_GAME_MANAGER = {
  gamse_dat = {
    phase = 1,
    flag_reset_num = 0,
    jaming_flg = false,
    state = EP04_FLAG_FIGHT_STATE.UNKNOW,
    zuru_flag_name = nil,
    flag_reset_now_flg = false,
    cat_warp_req = false,
    alert_in_area = false,
    forcing_gaze_cam_task = nil,
    forcing_gaze_cam_cancel_order = false
  },
  new = function()
    local L0_331
    L0_331 = _EP04_FLAG_GAME_MANAGER
    L0_331 = L0_331.gamse_dat
    _FLAGS_MANAGER.new(callFlagDamage, _EP04_FLAG_GAME_MANAGER.CallFlagSensorOnEnter, nil)
    _RESET_TIMER_DAT.new()
    _RESET_TIMER_UI_MANAGER.new()
    _SCORE_MANAGER.new()
    _SCORE_UI_MANAGER.new()
    enmgen2_area_01.new()
    _COMMENT_UI.new()
    _ENERGY_GEM_MANAGER.new()
    L0_331.phase = 1
    L0_331.flag_reset_num = 0
    L0_331.jaming_flg = false
    L0_331.state = EP04_FLAG_FIGHT_STATE.INIT_NOW
    L0_331.zuru_flag_name = nil
    L0_331.flag_reset_now_flg = false
  end,
  RequestForcingGazeCam = function()
    if _EP04_FLAG_GAME_MANAGER.gamse_dat == nil then
      print("ERROR : _EP04_FLAG_GAME_MANAGER.RequestForcingGazeCam _EP04_FLAG_GAME_MANAGER.gamse_dat = nil")
      return
    end
    if _EP04_FLAG_GAME_MANAGER.gamse_dat.forcing_gaze_cam_task == nil then
      _EP04_FLAG_GAME_MANAGER.gamse_dat.forcing_gaze_cam_task = invokeTask(function()
        waitSeconds(1)
        Fn_lookAtObject("locator2_forcing_look_point"):abort()
        Fn_naviSet(findGameObject2("Node", "locator2_forcing_look_point"))
        waitSeconds(5)
        Fn_naviKill()
        _EP04_FLAG_GAME_MANAGER.gamse_dat.forcing_gaze_cam_cancel_order = false
        _EP04_FLAG_GAME_MANAGER.gamse_dat.forcing_gaze_cam_task = nil
      end)
    end
  end,
  RequestCatWarp = function()
    local L0_332, L1_333
    L0_332 = _EP04_FLAG_GAME_MANAGER
    L0_332 = L0_332.gamse_dat
    L0_332.cat_warp_req = true
  end,
  GetRequestCatWarp = function()
    local L0_334, L1_335
    L0_334 = _EP04_FLAG_GAME_MANAGER
    L0_334 = L0_334.gamse_dat
    L0_334 = L0_334.cat_warp_req
    return L0_334
  end,
  GetEnterAlertArea = function()
    if nil == _EP04_FLAG_GAME_MANAGER.gamse_dat then
      print("ERROR : _EP04_FLAG_GAME_MANAGER.gamse_dat none")
      return nil
    end
    return _EP04_FLAG_GAME_MANAGER.gamse_dat.alert_in_area
  end,
  SetEnterAlertArea = function(A0_336)
    if nil == _EP04_FLAG_GAME_MANAGER.gamse_dat then
      print("ERROR : _EP04_FLAG_GAME_MANAGER.gamse_dat none")
      return nil
    end
    if A0_336 then
      _EP04_FLAG_GAME_MANAGER.gamse_dat.alert_in_area = true
    else
      _EP04_FLAG_GAME_MANAGER.gamse_dat.alert_in_area = false
    end
  end,
  SetJamingFlg = function(A0_337)
    local L1_338
    L1_338 = _EP04_FLAG_GAME_MANAGER
    L1_338 = L1_338.gamse_dat
    if A0_337 then
      L1_338.jaming_flg = true
    else
      L1_338.jaming_flg = false
    end
  end,
  GetJamingFlg = function()
    local L0_339, L1_340
    L0_339 = _EP04_FLAG_GAME_MANAGER
    L0_339 = L0_339.gamse_dat
    L0_339 = L0_339.jaming_flg
    return L0_339
  end,
  FlagFightRun = function()
    local L0_341
    L0_341 = _EP04_FLAG_GAME_MANAGER
    L0_341 = L0_341.gamse_dat
    _EP04_FLAG_GAME_MANAGER.SetJamingFlg(false)
    _EP04_FLAG_GAME_MANAGER.ClearZuruFlagName()
    Sound:playSE("ep04_flag_battle_start", 1)
    _EP04_FLAG_GAME_MANAGER.gamse_dat.cat_warp_req = false
    wait()
    while true do
      if _EP04_FLAG_GAME_MANAGER.GetPhase() < _EP04_FLAG_GAME_MANAGER.GetPhase() then
        invokeTask(function()
          while true do
            adjustFiTargetFlag()
            waitSeconds(10)
          end
        end):abort()
        waitSeconds(0.5)
        while _SCORE_UI_MANAGER.IsUiAnime() do
          wait()
        end
        L0_341.flag_reset_num = L0_341.flag_reset_num / 2
        break
      elseif _EP04_FLAG_GAME_MANAGER.gamse_dat.cat_warp_req == true then
        Fn_catWarpIn()
        Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
        Fn_catWarpCheckPoint()
        Fn_catWarpOut()
        while not HUD:faderStability() do
          wait()
        end
        waitSeconds(1.14)
        _EP04_FLAG_GAME_MANAGER.gamse_dat.cat_warp_req = false
      end
      wait()
    end
    invokeTask(_EP04_FLAG_GAME_MANAGER.TaskResetFlagFunc):abort()
    invokeTask(TaskFlagFightUiUpdate):abort()
    Sound:playSE("ep04_flag_battle_start", 1)
    waitSeconds(2)
    while _COMMENT_UI.CommentIsPlay() == true do
      wait()
    end
    _COMMENT_UI.CommentEnd()
    return error_check
  end,
  HalfTime = function()
    local L0_342
    L0_342 = Fn_blackout
    L0_342()
    L0_342 = Fn_userCtrlAllOff
    L0_342()
    L0_342 = Area
    L0_342 = L0_342.requestRestore
    L0_342(L0_342)
    L0_342 = Fn_resetPcPos
    L0_342("locator2_pc_start_pos")
    L0_342 = get_gameobj_node_world_pos_rot
    L0_342 = L0_342("locator2_view_pos_01")
    Camera:lookTo(L0_342, 0, 0)
    enmgen2_area_01.ResetPos()
    ResetScore()
    _EP04_FLAG_GAME_MANAGER.gamse_dat.cat_warp_req = false
  end,
  Finalize = function()
    _SCORE_UI_MANAGER.Delete()
  end,
  GetPhase = function()
    local L0_343, L1_344
    L0_343 = _EP04_FLAG_GAME_MANAGER
    L0_343 = L0_343.gamse_dat
    L0_343 = L0_343.phase
    return L0_343
  end,
  NextPhase = function()
    local L0_345, L1_346, L2_347
    L0_345 = _EP04_FLAG_GAME_MANAGER
    L0_345 = L0_345.gamse_dat
    L1_346 = L0_345.phase
    L1_346 = L1_346 + 1
    L0_345.phase = L1_346
    L1_346 = L0_345.phase
    L2_347 = MAX_PHASE
    L2_347 = L2_347 + 1
    if L1_346 > L2_347 then
      L1_346 = MAX_PHASE
      L1_346 = L1_346 + 1
      L0_345.phase = L1_346
    end
  end,
  AddFlagResetNum = function(A0_348)
    local L1_349, L2_350
    L1_349 = _EP04_FLAG_GAME_MANAGER
    L1_349 = L1_349.gamse_dat
    L2_350 = L1_349.flag_reset_num
    L2_350 = L2_350 + A0_348
    L1_349.flag_reset_num = L2_350
  end,
  GetFlagResetNum = function()
    local L0_351, L1_352
    L0_351 = _EP04_FLAG_GAME_MANAGER
    L0_351 = L0_351.gamse_dat
    L0_351 = L0_351.flag_reset_num
    return L0_351
  end,
  GetState = function()
    local L0_353, L1_354
    L0_353 = _EP04_FLAG_GAME_MANAGER
    L0_353 = L0_353.gamse_dat
    L0_353 = L0_353.state
    return L0_353
  end,
  SetState = function(A0_355)
    print("state change pre=" .. _EP04_FLAG_GAME_MANAGER.gamse_dat.state .. " now=" .. A0_355)
    _EP04_FLAG_GAME_MANAGER.gamse_dat.state = A0_355
  end,
  SetFlagResetNowFlg = function(A0_356)
    local L1_357
    if A0_356 then
      L1_357 = _EP04_FLAG_GAME_MANAGER
      L1_357 = L1_357.gamse_dat
      L1_357.flag_reset_now_flg = true
    else
      L1_357 = _EP04_FLAG_GAME_MANAGER
      L1_357 = L1_357.gamse_dat
      L1_357.flag_reset_now_flg = false
    end
  end,
  GetFlagResetNowFlg = function()
    local L0_358, L1_359
    L0_358 = _EP04_FLAG_GAME_MANAGER
    L0_358 = L0_358.gamse_dat
    L0_358 = L0_358.flag_reset_now_flg
    return L0_358
  end,
  CallFlagSensorOnEnter = function(A0_360, A1_361)
    if _EP04_FLAG_GAME_MANAGER.GetJamingFlg() == true then
      if _FLAGS_MANAGER.flags_dat.flag_tbl[A0_360] == nil then
        print("ERROR : _FLAGS_MANAGER.new OnLeave flag_dat=nil")
        return
      end
      if _FLAGS_MANAGER.IsFallDown(A0_360) then
        return
      end
      if A0_360 == _EP04_FLAG_GAME_MANAGER.GetZuruFlagName() then
        _EP04_FLAG_GAME_MANAGER.ClearZuruFlagName()
      end
      _EP04_FLAG_GAME_MANAGER.gamse_dat.zuru_flag_name = A0_360
      _EP04_FLAG_GAME_MANAGER.SetFlagResetNowFlg(true)
      _FLAGS_MANAGER.SelectFlagFallDown(A0_360)
      _EP04_FLAG_GAME_MANAGER.AddFlagResetNum(1)
      if _FLAGS_MANAGER.GetFlagGetUpNum() <= RESET_FLAG_MIN then
        _RESET_TIMER_DAT.Reset(_EP04_FLAG_GAME_MANAGER.GetPhase(), _EP04_FLAG_GAME_MANAGER.GetJamingFlg())
        RandamFlagGetUp(MAX_FLAG, {A0_360})
        print("rand order! (Zuru) : ")
      end
      _EP04_FLAG_GAME_MANAGER.SetFlagResetNowFlg(false)
      print("reset! (Zuru) : " .. A0_360)
      invokeTask(function()
        waitSeconds(2)
        _COMMENT_UI.RequestPhaseBySoliloquy()
      end)
    end
  end,
  GetZuruFlagName = function()
    local L0_362, L1_363
    L0_362 = _EP04_FLAG_GAME_MANAGER
    L0_362 = L0_362.gamse_dat
    L0_362 = L0_362.zuru_flag_name
    return L0_362
  end,
  ClearZuruFlagName = function()
    local L0_364, L1_365
    L0_364 = _EP04_FLAG_GAME_MANAGER
    L0_364 = L0_364.gamse_dat
    L0_364.zuru_flag_name = nil
  end,
  TaskResetFlagFunc = function()
    _SCORE_MANAGER.Reset(_EP04_FLAG_GAME_MANAGER.GetPhase())
    _RESET_TIMER_DAT.Reset(_EP04_FLAG_GAME_MANAGER.GetPhase(), _EP04_FLAG_GAME_MANAGER.GetJamingFlg())
    _RESET_TIMER_DAT.Start()
    while true do
      if _RESET_TIMER_DAT.isActive() and _RESET_TIMER_DAT.Check() then
        _EP04_FLAG_GAME_MANAGER.SetFlagResetNowFlg(true)
        _EP04_FLAG_GAME_MANAGER.AddFlagResetNum(1)
        RandamFlagGetUp(MAX_FLAG)
        _RESET_TIMER_DAT.Reset(_EP04_FLAG_GAME_MANAGER.GetPhase(), _EP04_FLAG_GAME_MANAGER.GetJamingFlg())
        if false == _EP04_FLAG_GAME_MANAGER.GetJamingFlg() then
          _ENERGY_GEM_MANAGER.GemCreatFlagRef()
        end
        print("reset!")
        _EP04_FLAG_GAME_MANAGER.SetFlagResetNowFlg(false)
      end
      wait()
    end
  end
}
function pccubesensor2_02_OnLeave(A0_366, A1_367)
  if _EP04_FLAG_GAME_MANAGER.gamse_dat == nil then
    return
  end
  if _EP04_FLAG_GAME_MANAGER.GetState() ~= EP04_FLAG_FIGHT_STATE.PLAY then
    return
  end
  if _EP04_FLAG_GAME_MANAGER.GetState() ~= EP04_FLAG_FIGHT_STATE.PLAY then
    return
  end
  _EP04_FLAG_GAME_MANAGER.RequestCatWarp()
end
function pccubesensor2_03_OnLeave(A0_368, A1_369)
  if _EP04_FLAG_GAME_MANAGER.gamse_dat == nil then
    return
  end
  if _EP04_FLAG_GAME_MANAGER.GetState() ~= EP04_FLAG_FIGHT_STATE.PLAY then
    return
  end
  if _EP04_FLAG_GAME_MANAGER.GetState() ~= EP04_FLAG_FIGHT_STATE.PLAY then
    return
  end
  _in_gamefiled_flg = false
  _COMMENT_UI.RequestAlertComeback()
  _EP04_FLAG_GAME_MANAGER.SetEnterAlertArea(true)
  _EP04_FLAG_GAME_MANAGER.RequestForcingGazeCam()
end
function pccubesensor2_03_OnEnter(A0_370, A1_371)
  _EP04_FLAG_GAME_MANAGER.SetEnterAlertArea(false)
end
function TaskFlagFightUiUpdate()
  local L0_372
  L0_372 = _RESET_TIMER_UI_MANAGER
  L0_372 = L0_372.SetVisible
  L0_372(true)
  L0_372 = _SCORE_UI_MANAGER
  L0_372 = L0_372.SetVisible
  L0_372(true)
  L0_372 = _EP04_FLAG_GAME_MANAGER
  L0_372 = L0_372.GetPhase
  L0_372 = L0_372()
  while true do
    _FLAGS_MANAGER.UpdateFlagStateNum()
    _SCORE_UI_MANAGER.View()
    setDebugDispMissionText("[GameWorldTimeStamp]" .. Time:getGameWorldTimeStamp())
    setDebugDispMissionText("[Outcome] kitten : " .. _SCORE_MANAGER.GetPcWinNum() .. " / " .. _SCORE_MANAGER.GetNpcWinNum() .. " fi")
    _RESET_TIMER_UI_MANAGER.View(GetPhase())
    setDebugDispMissionText("[Flag] " .. _FLAGS_MANAGER.GetFlagGetUpNum() .. " / " .. MAX_FLAG)
    setDebugDispMissionText("[Phase] " .. L0_372)
    if _EP04_FLAG_GAME_MANAGER.GetJamingFlg() then
      setDebugDispMissionText("[Vogo Jaming] Active")
    end
    if L0_372 == 1 then
    elseif L0_372 == 2 then
      setDebugDispMissionText("[Handicap] The loser becomes easy wins")
    elseif L0_372 == 3 then
    end
    wait()
  end
end
function RandamFlagGetUp(A0_373, A1_374)
  local L2_375, L3_376, L4_377, L5_378, L6_379, L7_380, L8_381, L9_382, L10_383, L11_384, L12_385, L13_386, L14_387, L15_388, L16_389, L17_390, L18_391, L19_392, L20_393, L21_394, L22_395, L23_396, L24_397, L25_398
  L2_375 = _FLAGS_MANAGER
  L2_375 = L2_375.flags_dat
  if L2_375 == nil then
    L3_376 = print
    L4_377 = "_FLAGS_MANAGER.RandamFlagGetUp flags_dat=nil"
    L3_376(L4_377)
    L3_376 = 0
    return L3_376
  end
  L3_376 = L2_375.flag_tbl
  if A0_373 == nil or A0_373 < 1 then
    L4_377 = print
    L5_378 = "_FLAGS_MANAGER.RandamFlagGetUp max_num=nil"
    L4_377(L5_378)
    L4_377 = 0
    return L4_377
  end
  L4_377 = {}
  L5_378 = type
  L6_379 = A1_374
  L5_378 = L5_378(L6_379)
  if "table" == L5_378 then
    L4_377 = A1_374
  end
  L5_378 = _FLAGS_MANAGER
  L5_378 = L5_378.UpdateFlagStateNum
  L5_378()
  L5_378 = Fn_getPlayer
  L5_378 = L5_378()
  L6_379 = findGameObject2
  L7_380 = "Puppet"
  L8_381 = "fi_00"
  L6_379 = L6_379(L7_380, L8_381)
  L7_380 = Fn_get_distance
  L9_382 = L6_379
  L8_381 = L6_379.getWorldPos
  L8_381 = L8_381(L9_382)
  L10_383 = L5_378
  L9_382 = L5_378.getWorldPos
  L21_394 = L9_382(L10_383)
  L7_380 = L7_380(L8_381, L9_382, L10_383, L11_384, L12_385, L13_386, L14_387, L15_388, L16_389, L17_390, L18_391, L19_392, L20_393, L21_394, L22_395, L23_396, L24_397, L25_398, L9_382(L10_383))
  L8_381 = _EP04_FLAG_GAME_MANAGER
  L8_381 = L8_381.GetPhase
  L8_381 = L8_381()
  L9_382 = _SCORE_MANAGER
  L9_382 = L9_382.GetPcScore
  L9_382 = L9_382()
  L10_383 = _SCORE_MANAGER
  L10_383 = L10_383.GetNpcScore
  L10_383 = L10_383()
  L11_384 = L10_383 - L9_382
  L12_385 = _SCORE_MANAGER
  L12_385 = L12_385.GetPcWinNum
  L12_385 = L12_385()
  L13_386 = _SCORE_MANAGER
  L13_386 = L13_386.GetNpcWinNum
  L13_386 = L13_386()
  L14_387 = 0
  L15_388 = true
  L16_389 = true
  L17_390 = _EP04_FLAG_GAME_MANAGER
  L17_390 = L17_390.GetJamingFlg
  L17_390 = L17_390()
  L18_391 = {}
  L19_392 = {}
  L20_393 = {}
  L21_394 = {}
  L2_375.flag_rand_list = L22_395
  for L25_398, _FORV_26_ in L22_395(L23_396) do
    L18_391[L25_398] = 0
    table.insert(L19_392, {
      name = L25_398,
      dis = Fn_get_distance(_FORV_26_.hdl[1]:getWorldPos(), L5_378:getWorldPos())
    })
    table.insert(L20_393, {
      name = L25_398,
      dis = Fn_get_distance(_FORV_26_.hdl[1]:getWorldPos(), L6_379:getWorldPos())
    })
  end
  L22_395(L23_396, L24_397)
  L22_395(L23_396, L24_397)
  if false == L17_390 then
    for L25_398, _FORV_26_ in L22_395(L23_396) do
      if 1 == _FORV_26_.flag_state then
        L18_391[L25_398] = 1
        L14_387 = L14_387 + 1
      end
    end
  end
  if A0_373 > L14_387 then
    if L8_381 == 1 then
      if L11_384 >= -1 then
      else
      end
    elseif L8_381 == 2 then
      if true == L17_390 then
      elseif L23_396 == 0 then
      elseif L11_384 >= -1 then
      else
      end
    elseif L8_381 == 3 then
      if true == L17_390 then
      elseif L23_396 == 0 then
      elseif L11_384 >= -1 then
      else
      end
    end
    if 1 == L22_395 then
      for _FORV_27_, _FORV_28_ in L24_397(L25_398) do
        if nil == L4_377[_FORV_28_.name] then
          if A0_373 <= L14_387 or L14_387 >= L23_396 then
            break
          end
          if L18_391[_FORV_28_.name] == 0 and L3_376[_FORV_28_.name].phase[L8_381] == true and EXCLUSION_LOTTERY_AREA_PC < _FORV_28_.dis then
            excluded_flg, opponent_dis = CheckExcludedTarget(_FORV_28_.name, EXCLUSION_LOTTERY_AREA_FI, L20_393)
            if excluded_flg == false and opponent_dis > _FORV_28_.dis then
              L18_391[_FORV_28_.name] = 1
              L14_387 = L14_387 + 1
            end
          end
        end
      end
    elseif 2 == L22_395 then
      for _FORV_27_, _FORV_28_ in L24_397(L25_398) do
        if nil == L4_377[_FORV_28_.name] then
          if A0_373 <= L14_387 or L14_387 >= L23_396 then
            break
          end
          if L18_391[_FORV_28_.name] == 0 and L3_376[_FORV_28_.name].phase[L8_381] == true and EXCLUSION_LOTTERY_AREA_FI < _FORV_28_.dis then
            excluded_flg, opponent_dis = CheckExcludedTarget(_FORV_28_.name, EXCLUSION_LOTTERY_AREA_PC, L19_392)
            if excluded_flg == false and opponent_dis > _FORV_28_.dis then
              L18_391[_FORV_28_.name] = 1
              L14_387 = L14_387 + 1
              table.insert(L21_394, _FORV_28_.name)
            end
          end
        end
      end
    elseif 3 == L22_395 then
      for _FORV_27_, _FORV_28_ in L24_397(L25_398) do
        if nil == L4_377[_FORV_28_.name] then
          if A0_373 <= L14_387 or L14_387 >= L23_396 then
            break
          end
          if L18_391[_FORV_28_.name] == 0 and L3_376[_FORV_28_.name].phase[L8_381] == true and EXCLUSION_LOTTERY_AREA_PC < _FORV_28_.dis then
            excluded_flg, opponent_dis = CheckExcludedTarget(_FORV_28_.name, EXCLUSION_LOTTERY_AREA_FI, L20_393)
            if excluded_flg == false and opponent_dis > _FORV_28_.dis then
              L18_391[_FORV_28_.name] = 1
              L14_387 = L14_387 + 1
            end
          end
        end
      end
    elseif 4 == L22_395 then
      for _FORV_27_, _FORV_28_ in L24_397(L25_398) do
        if nil == L4_377[_FORV_28_.name] then
          if A0_373 <= L14_387 or L14_387 >= L23_396 then
            break
          end
          if L18_391[_FORV_28_.name] == 0 and L3_376[_FORV_28_.name].phase[L8_381] == true and EXCLUSION_LOTTERY_AREA_FI < _FORV_28_.dis then
            excluded_flg, opponent_dis = CheckExcludedTarget(_FORV_28_.name, EXCLUSION_LOTTERY_AREA_PC, L19_392)
            if excluded_flg == false and opponent_dis > _FORV_28_.dis then
              L18_391[_FORV_28_.name] = 1
              L14_387 = L14_387 + 1
              table.insert(L21_394, _FORV_28_.name)
            end
          end
        end
      end
    end
  else
  end
  if A0_373 > L14_387 then
    for L25_398, _FORV_26_ in L22_395(L23_396) do
      if nil == L4_377[_FORV_26_] then
        if A0_373 <= L14_387 then
          break
        end
        _FORV_26_ = L3_376[_FORV_26_]
        if L18_391[L25_398] == 0 and L3_376[L25_398].phase[L8_381] == true then
          excluded_flg = CheckExcludedTarget(L25_398, EXCLUSION_LOTTERY_AREA_PC, L19_392)
          if excluded_flg == false then
            excluded_flg = CheckExcludedTarget(L25_398, EXCLUSION_LOTTERY_AREA_FI, L20_393)
            if excluded_flg == false then
              L18_391[L25_398] = 1
              L14_387 = L14_387 + 1
            end
          end
        end
      end
    end
  end
  for L25_398, _FORV_26_ in L22_395(L23_396) do
    if _FORV_26_ == 1 and L3_376[L25_398].flag_state ~= 1 then
      _FLAGS_MANAGER.SelectFlagGetUp(L25_398)
    elseif _FORV_26_ == 0 and L3_376[L25_398].flag_state ~= 0 then
      _FLAGS_MANAGER.SelectFlagFallDown(L25_398)
    end
  end
  for L25_398, _FORV_26_ in L22_395(L23_396) do
    if true == CheckExcludedTarget(_FORV_26_.name, 20, L20_393) then
      L3_376[_FORV_26_.name].target = 1
    end
  end
  return L14_387
end
function CheckExcludedTarget(A0_399, A1_400, A2_401)
  for _FORV_6_, _FORV_7_ in pairs(A2_401) do
    if _FORV_7_.name == A0_399 then
      if A1_400 > _FORV_7_.dis then
        return true, _FORV_7_.dis
      else
        return false, _FORV_7_.dis
      end
    end
  end
  return nil, 0
end
function callFlagDamage(A0_402, A1_403)
  local L2_404, L3_405, L4_406, L5_407, L6_408, L7_409, L8_410, L9_411, L10_412, L11_413
  L2_404 = _RESET_TIMER_DAT
  L2_404 = L2_404.isActive
  L2_404 = L2_404()
  if false ~= L2_404 then
    L2_404 = _EP04_FLAG_GAME_MANAGER
    L2_404 = L2_404.GetFlagResetNowFlg
    L2_404 = L2_404()
  elseif L2_404 then
    L2_404 = print
    L3_405 = "TaskFlagDamageScore Flag Get Point Skip"
    L2_404(L3_405)
    return
  end
  L3_405 = A0_402
  L2_404 = A0_402.getParent
  L2_404 = L2_404(L3_405)
  if L2_404 == nil then
    L3_405 = print
    L4_406 = "ERROR : callFlagDamage node_hdl=nil"
    L3_405(L4_406)
    return
  end
  L4_406 = L2_404
  L3_405 = L2_404.getName
  L3_405 = L3_405(L4_406)
  if L3_405 == nil then
    L4_406 = print
    L5_407 = "ERROR : callFlagDamage node_name=nil"
    L4_406(L5_407)
    return
  end
  L4_406 = _FLAGS_MANAGER
  L4_406 = L4_406.GetFlagTableRecord
  L5_407 = L3_405
  L4_406 = L4_406(L5_407)
  L5_407 = _FLAGS_MANAGER
  L5_407 = L5_407.GetFlagHandle
  L6_408 = L3_405
  L5_407 = L5_407(L6_408)
  L6_408 = _EP04_FLAG_GAME_MANAGER
  L6_408 = L6_408.GetJamingFlg
  L6_408 = L6_408()
  if L5_407 == nil then
    return
  end
  L7_409 = ""
  L8_410 = Flag
  L8_410 = L8_410.kSenderType_Player
  if A1_403 == L8_410 then
    L7_409 = "kitten"
  else
    L8_410 = Flag
    L8_410 = L8_410.kSenderType_Enemy
    if A1_403 == L8_410 then
      L7_409 = "fi"
    else
      L8_410 = _FLAGS_MANAGER
      L8_410 = L8_410.SelectFlagDamage
      L9_411 = L3_405
      L8_410(L9_411)
      return
    end
  end
  L8_410 = _FLAGS_MANAGER
  L8_410 = L8_410.IsFallDown
  L9_411 = L3_405
  L8_410 = L8_410(L9_411)
  if L8_410 then
    return
  end
  L8_410 = _EP04_FLAG_GAME_MANAGER
  L8_410 = L8_410.GetPhase
  L8_410 = L8_410()
  L9_411 = false
  if L7_409 == "kitten" then
    if L6_408 then
      L9_411 = false
    else
      L10_412 = _SCORE_MANAGER
      L10_412 = L10_412.UpdatePc
      L11_413 = L4_406.score
      L10_412(L11_413, L8_410)
      L9_411 = true
    end
    if false == L6_408 then
      L10_412 = Fn_getMissionPart
      L10_412 = L10_412()
      if L10_412 == "ep04_b" then
        L10_412 = _SCORE_MANAGER
        L10_412 = L10_412.GetPcScore
        L10_412 = L10_412()
        L11_413 = _SCORE_MANAGER
        L11_413 = L11_413.GetPcWinNum
        L11_413 = L11_413()
        if L8_410 == 2 and L11_413 > _SCORE_MANAGER.GetNpcWinNum() and L10_412 >= _SCORE_MANAGER.GetMaxScore(L8_410) then
          _EP04_FLAG_GAME_MANAGER.SetJamingFlg(true)
          invokeTask(function()
            waitSeconds(1.5)
            Fn_captionViewEnd()
            _COMMENT_UI.RequestPhaseBySoliloquy()
          end)
        elseif L8_410 == 3 and L10_412 >= _SCORE_MANAGER.GetMaxScore(L8_410) then
          _EP04_FLAG_GAME_MANAGER.SetJamingFlg(true)
          invokeTask(function()
            waitSeconds(1.5)
            Fn_captionViewEnd()
            _COMMENT_UI.RequestPhaseBySoliloquy()
          end)
        end
      end
    end
  elseif L7_409 == "fi" then
    L10_412 = _SCORE_MANAGER
    L10_412 = L10_412.UpdateNpc
    L11_413 = L4_406.score
    L10_412(L11_413, L8_410)
    L10_412 = enmgen2_area_01
    L10_412 = L10_412.onAttackTrigger
    L10_412()
  end
  L10_412 = print
  L11_413 = "Flag "
  L11_413 = L11_413 .. L3_405 .. " Get :" .. L4_406.owner .. " " .. string.format(Time:getGameWorldTimeStamp())
  L10_412(L11_413)
  if L9_411 == true then
    L10_412 = Sound
    L11_413 = L10_412
    L10_412 = L10_412.pulse
    L10_412(L11_413, "success")
  end
  L10_412 = _FLAGS_MANAGER
  L10_412 = L10_412.SelectFlagDamage
  L11_413 = L3_405
  L10_412(L11_413)
  L10_412 = enmgen2_area_01
  L10_412 = L10_412.CalculationWaitTime
  L10_412()
  L10_412 = enmgen2_area_01
  L10_412.update_flag = true
  L10_412 = enmgen2_area_01
  L10_412 = L10_412.getTransferFlag
  L10_412 = L10_412()
  L11_413 = L10_412[L3_405]
  L11_413.target = 0
  L11_413 = L10_412[L3_405]
  L11_413.flag_state = 0
  L11_413 = _SCORE_MANAGER
  L11_413 = L11_413.Check
  L11_413 = L11_413()
  if L11_413 then
    L11_413 = print
    L11_413("score reset!")
    L11_413 = _RESET_TIMER_DAT
    L11_413 = L11_413.Stop
    L11_413()
    L11_413 = _FLAGS_MANAGER
    L11_413 = L11_413.AllReset
    L11_413()
    L11_413 = _SCORE_UI_MANAGER
    L11_413 = L11_413.View
    L11_413()
    L11_413 = ggd
    L11_413 = L11_413["Savedata__EventFlags__ep04__flag" .. string.format("%02d", L8_410)]
    if _SCORE_MANAGER.GetPcScore() > _SCORE_MANAGER.GetNpcScore() then
      _savedata_vars[L11_413] = 1
    else
      _savedata_vars[L11_413] = 0
    end
    GameDatabase:set(L11_413, _savedata_vars[L11_413])
    if _SCORE_MANAGER.JudgePcScore() then
      _SCORE_MANAGER.AddPcWinNum(1)
    else
      _SCORE_MANAGER.AddNpcWinNum(1)
    end
    _EP04_FLAG_GAME_MANAGER.NextPhase()
  else
    L11_413 = _FLAGS_MANAGER
    L11_413 = L11_413.GetFlagGetUpNum
    L11_413 = L11_413()
    if L11_413 <= RESET_FLAG_MIN then
      L11_413 = _EP04_FLAG_GAME_MANAGER
      L11_413 = L11_413.AddFlagResetNum
      L11_413(1)
      L11_413 = RandamFlagGetUp
      L11_413(MAX_FLAG)
      L11_413 = adjustFiTargetFlag
      L11_413()
      L11_413 = _RESET_TIMER_DAT
      L11_413 = L11_413.Reset
      L11_413(L8_410, _EP04_FLAG_GAME_MANAGER.GetJamingFlg())
      L11_413 = _EP04_FLAG_GAME_MANAGER
      L11_413 = L11_413.GetJamingFlg
      L11_413 = L11_413()
      if false == L11_413 then
        L11_413 = _ENERGY_GEM_MANAGER
        L11_413 = L11_413.GemCreatFlagRef
        L11_413()
      end
    elseif false == L6_408 then
      L11_413 = false
      for _FORV_15_, _FORV_16_ in pairs(L10_412) do
        if 1 == _FORV_16_.flag_state then
          L11_413 = true
          break
        end
      end
      if false == L11_413 then
        adjustFiTargetFlag()
      end
    end
  end
end
function adjustFiTargetFlag(A0_414)
  local L1_415, L2_416, L3_417, L4_418, L5_419, L6_420, L7_421, L8_422
  L1_415 = enmgen2_area_01
  L1_415 = L1_415.transferFlag
  L1_415()
  L1_415 = enmgen2_area_01
  L1_415 = L1_415.getTransferFlag
  L1_415 = L1_415()
  if L1_415 == nil then
    L2_416 = print
    L3_417 = "_FLAGS_MANAGER.RandamFlagGetUp flag_tbl=nil"
    L2_416(L3_417)
    L2_416 = nil
    return L2_416
  end
  L2_416 = _EP04_FLAG_GAME_MANAGER
  L2_416 = L2_416.GetJamingFlg
  L2_416 = L2_416()
  if true == L2_416 then
    return
  end
  L2_416 = _EP04_FLAG_GAME_MANAGER
  L2_416 = L2_416.GetPhase
  L2_416 = L2_416()
  L3_417 = Fn_getPlayer
  L3_417 = L3_417()
  L4_418 = A0_414
  if not A0_414 then
    if 1 == L2_416 then
      L4_418 = 2
    elseif 2 == L2_416 then
      L5_419 = _savedata_vars
      L6_420 = ggd
      L6_420 = L6_420.Savedata__EventFlags__ep04__flag01
      L5_419 = L5_419[L6_420]
      if L5_419 == 0 then
        L4_418 = 1
      else
        L4_418 = 2
      end
    elseif 3 == L2_416 then
      L5_419 = _savedata_vars
      L6_420 = ggd
      L6_420 = L6_420.Savedata__EventFlags__ep04__flag01
      L5_419 = L5_419[L6_420]
      if L5_419 == 0 then
        L4_418 = 1
      else
        L4_418 = 2
      end
    end
  end
  L5_419 = findGameObject2
  L6_420 = "Puppet"
  L7_421 = "fi_00"
  L5_419 = L5_419(L6_420, L7_421)
  if not L5_419 then
    L6_420 = print
    L7_421 = "ERROR : adjustFiTargetFlag not fi"
    L6_420(L7_421)
    return
  end
  L7_421 = L5_419
  L6_420 = L5_419.getWorldPos
  L6_420 = L6_420(L7_421)
  L7_421 = {}
  for _FORV_11_, _FORV_12_ in L8_422(L1_415) do
    table.insert(L7_421, {
      hdl = _FORV_12_.hdl,
      name = _FORV_11_,
      dis = Fn_get_distance(_FORV_12_.hdl:getWorldPos(), L3_417:getWorldPos())
    })
  end
  L8_422(L7_421, function(A0_423, A1_424)
    return A0_423.dis > A1_424.dis
  end)
  for _FORV_14_ = 1, L8_422 do
    if L4_418 > 0 then
      if 1 == L1_415[L7_421[_FORV_14_].name].flag_state then
        if L7_421[_FORV_14_].dis > Fn_get_distance(L7_421[_FORV_14_].hdl:getWorldPos(), L6_420) then
          if true == _FlagDenseJudgment(L7_421[_FORV_14_].name, L1_415) then
            L1_415[L7_421[_FORV_14_].name].flag_state = 1
            L1_415[L7_421[_FORV_14_].name].target = 1
          end
        else
          L1_415[L7_421[_FORV_14_].name].target = 0
          L1_415[L7_421[_FORV_14_].name].flag_state = 0
        end
      end
    elseif 1 == _savedata_vars[ggd.Savedata__EventFlags__ep04__flag01] or Fn_get_distance(L7_421[_FORV_14_].hdl:getWorldPos(), L6_420) >= 20 then
      L1_415[L7_421[_FORV_14_].name].target = 0
      L1_415[L7_421[_FORV_14_].name].flag_state = 0
    end
  end
  if 0 + 1 <= 0 then
    enmgen2_area_01.transferFlag()
  end
end
function _FlagDenseJudgment(A0_425, A1_426)
  local L2_427, L3_428, L4_429, L5_430, L6_431
  for L5_430, L6_431 in L2_427(L3_428) do
    for _FORV_12_, _FORV_13_ in pairs(L6_431) do
    end
    if true then
      if 0 + 1 > 2 then
        return false
      end
      return true
    end
  end
  return L2_427
end
function Initialize()
  local L0_432, L1_433, L2_434, L3_435, L4_436, L5_437, L6_438, L7_439
  L0_432 = print
  L1_433 = "ep04_com_a Initialize start"
  L0_432(L1_433)
  L0_432 = Fn_getMissionPart
  L0_432 = L0_432()
  L1_433 = Fn_setAreaWarp
  L1_433(L2_434, L3_435)
  L1_433 = {
    L2_434,
    L3_435,
    L4_436,
    L5_437
  }
  L5_437 = "ve_crane_root"
  if L2_434 > 0 then
    for L5_437, L6_438 in L2_434(L3_435) do
      L7_439 = loadFileAsset
      L7_439 = L7_439("nvm", L6_438 .. "_custom01")
      if nil ~= L7_439 then
        L7_439:wait()
        if Fn_findAreaHandle(L6_438) ~= nil then
          Fn_findAreaHandle(L6_438):setNaviMeshAsset(L7_439)
        end
      end
    end
  end
  L2_434()
  L2_434()
  L2_434(L3_435)
  L5_437 = ggd
  L5_437 = L5_437.GlobalSystemFlags__GameRetry
  L6_438 = ggd
  L6_438 = L6_438.Savedata__EventClearFlags__ep04__ep04_a
  L7_439 = ggd
  L7_439 = L7_439.Savedata__EventFlags__ep04__flag01
  _savedata_vars = L2_434
  if L0_432 == "ep04_b" then
    if L2_434 == 0 then
      L2_434()
      L2_434()
      L2_434(L3_435)
      L2_434(L3_435)
    end
  elseif L0_432 == "ep04_b" then
    if L2_434 ~= 0 then
    elseif L2_434 == true then
      if L2_434 ~= 0 then
        L2_434()
        L2_434(L3_435)
      elseif L2_434 ~= 0 then
        L2_434()
        L2_434()
        L2_434(L3_435)
        L2_434(L3_435)
      else
        L2_434()
        L2_434()
        L2_434(L3_435)
        L2_434(L3_435)
      end
    end
  end
  if L2_434 == 1 then
    _demo01_cut06 = L3_435
    _demo01_cut08 = L3_435
    _demo01_cut09 = L3_435
  end
  if L3_435 then
    if L3_435 <= 1 then
      L5_437 = _savedata_vars
      L6_438 = ggd
      L6_438 = L6_438.EventFlags__ep04__flag04
      L5_437 = L5_437[L6_438]
      L5_437 = L5_437 + 1
      L3_435[L4_436] = L5_437
      L5_437 = ggd
      L5_437 = L5_437.EventFlags__ep04__flag04
      L6_438 = _savedata_vars
      L7_439 = ggd
      L7_439 = L7_439.EventFlags__ep04__flag04
      L6_438 = L6_438[L7_439]
      L3_435(L4_436, L5_437, L6_438)
    end
  end
  L3_435(L4_436)
  L3_435(L4_436)
  L3_435(L4_436)
end
function Ingame()
HEY HEY HEY
  local L0_440, L1_441, L2_442, L3_443, L4_444, L5_445, L6_446
  L0_440 = print
  L1_441 = "ep04_com_a Ingame start"
  L0_440(L1_441)
  L0_440 = Fn_findAreaHandle
  L1_441 = "wa_a_root"
  L0_440 = L0_440(L1_441)
  L1_441 = Fn_findAreaHandle
  L2_442 = "bu_f_root"
  L1_441 = L1_441(L2_442)
  L2_442 = Fn_findAreaHandle
  L3_443 = "ve_crane_root"
  L2_442 = L2_442(L3_443)
  L4_444 = L0_440
  L3_443 = L0_440.setExpandedAabb
  L3_443(L4_444, L5_445)
  L4_444 = L1_441
  L3_443 = L1_441.setExpandedAabb
  L3_443(L4_444, L5_445)
  L4_444 = L2_442
  L3_443 = L2_442.setExpandedAabb
  L3_443(L4_444, L5_445)
  L3_443 = _EP04_FLAG_GAME_MANAGER
  L3_443 = L3_443.GetPhase
  L3_443 = L3_443()
  while true do
    L4_444 = _EP04_FLAG_GAME_MANAGER
    L4_444 = L4_444.GetState
    L4_444 = L4_444()
    if L4_444 ~= L5_445 then
      L4_444 = wait
      L4_444()
    else
      L4_444 = Fn_getMissionPart
      L4_444 = L4_444()
      while true do
        if L5_445 == false then
          L5_445()
        end
      end
      L5_445()
      L3_443 = L5_445
      if L3_443 == 1 then
        if L4_444 ~= "ep04_b" then
          if L5_445 == false then
            L5_445(L6_446, "ep04_flag_fight_demo02_01", Fn_findAreaHandle("bu_a_09"))
            L5_445(L6_446, "ep04_flag_fight_demo", Fn_findAreaHandle("bu_a_09"))
            _demo01_cut09:set(L5_445, L6_446)
            _demo01_cut06:play()
          end
        end
      elseif L3_443 == 2 then
      elseif L3_443 == 3 then
        for _FORV_8_, _FORV_9_ in L5_445(L6_446) do
          if _FORV_9_.name == "a3" then
            _FORV_9_.state = true
          end
        end
      end
      L5_445(L6_446, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
      L5_445()
      if L3_443 == 1 then
        if L4_444 ~= "ep04_b" then
          if L5_445 == false then
            while true do
              if L5_445 then
                L5_445()
              end
            end
            L5_445(L6_446)
            L5_445(L6_446)
            while true do
              if L5_445 then
                L5_445()
              end
            end
            L5_445(L6_446)
            L5_445(L6_446)
            L5_445(L6_446)
            L5_445(L6_446, 2)
            L5_445(L6_446)
            L5_445(L6_446)
            L5_445(L6_446)
        else
          elseif L5_445 >= 1 then
            L5_445(L6_446)
            L5_445(L6_446, "ep04_info_01", false, -1)
            L5_445(L6_446)
            L5_445(L6_446)
            L5_445(L6_446)
          else
            L5_445(L6_446)
          end
        end
        L5_445(L6_446)
      elseif L3_443 == 2 then
        if 0 == L5_445 then
          if false == L5_445 then
            L5_445(L6_446, "ep04_info_01", false, -1)
            L5_445(L6_446)
            L5_445(L6_446)
          end
        end
        L5_445(L6_446)
      elseif L3_443 == 3 then
        L5_445(L6_446)
        L5_445(L6_446)
      end
      L5_445()
      L5_445(L6_446)
      L5_445(L6_446, L6_446())
      L5_445()
      L5_445(L6_446)
      L5_445(L6_446)
      L5_445()
      L5_445()
      L5_445(L6_446)
      L5_445()
      repeat
        L5_445()
      until L5_445
      L5_445(L6_446)
      L5_445()
      if L3_443 == 1 then
        if L5_445 == false then
          L5_445(L6_446, "ep04_info_01", true, 10)
        end
      elseif L3_443 == 2 then
      elseif L3_443 == 3 then
      end
      L5_445(L6_446)
      L5_445()
      L5_445(L6_446)
      L5_445(L6_446)
      L5_445()
      if L3_443 == 1 then
        L5_445(L6_446)
        L5_445()
        L5_445(L6_446)
      elseif L3_443 == 2 then
        L5_445(L6_446)
        L5_445()
        L5_445(L6_446)
      elseif L3_443 == 3 then
        L5_445(L6_446)
        break
      end
      L5_445(L6_446)
      L5_445()
    end
  end
  L4_444 = Fn_pcSensorOn
  L4_444(L5_445)
  L4_444 = Fn_pcSensorOn
  L4_444(L5_445)
  while true do
    L4_444 = _EP04_FLAG_GAME_MANAGER
    L4_444 = L4_444.GetState
    L4_444 = L4_444()
    if L4_444 == L5_445 then
      L4_444 = wait
      L4_444()
    end
  end
  L4_444 = _EP04_FLAG_GAME_MANAGER
  L4_444 = L4_444.Finalize
  L4_444()
  L4_444 = print
  L4_444(L5_445)
end
function Finalize()
  if Fn_findAreaHandle("wa_a_root") then
    Fn_findAreaHandle("wa_a_root"):setExpandedAabb(false)
  end
  if Fn_findAreaHandle("bu_f_root") then
    Fn_findAreaHandle("bu_f_root"):setExpandedAabb(false)
  end
  if Fn_findAreaHandle("ve_crane_root") then
    Fn_findAreaHandle("ve_crane_root"):setExpandedAabb(false)
  end
end
function SetEp04FlagFightState(A0_447)
  _EP04_FLAG_GAME_MANAGER.SetState(A0_447)
end
function GetEp04FlagFightState()
  return _EP04_FLAG_GAME_MANAGER.GetState()
end
function GetPhase()
  return _EP04_FLAG_GAME_MANAGER.GetPhase()
end
function GetPcWinNum()
  return _SCORE_MANAGER.GetPcWinNum()
end
function GetNpcWinNum()
  return _SCORE_MANAGER.GetNpcWinNum()
end
function IsJaming()
  return _EP04_FLAG_GAME_MANAGER.GetJamingFlg()
end
function NpcResetPos()
  enmgen2_area_01.ResetPos()
end
function NpcResetDemo01Pos()
  enmgen2_area_01.ResetDemo01Pos()
end
function SetGageUiVisible(A0_448)
  if A0_448 then
    _SCORE_UI_MANAGER.SetVisible(true)
  else
    _SCORE_UI_MANAGER.SetVisible(false)
  end
end
function SetNpcEnemyMarkerVisible(A0_449)
  enmgen2_area_01.SetEnemyMarkerVisible(A0_449)
end
function SetOutFiledNpcsDemPos()
  _OUTFILEDNPCS.SetDemoPos()
end
function SetOutFiledNpcsGamePos()
  _OUTFILEDNPCS.SetFlagFightPos()
end
function SetDemoFlagGetUp(A0_450)
  if A0_450 then
    _FLAGS_MANAGER.AllFlagGetUp(1, true)
    _FLAGS_MANAGER.SetAllMapMarkerVisible(false)
  else
    _FLAGS_MANAGER.AllReset()
    _FLAGS_MANAGER.SetAllMapMarkerVisible(true)
  end
end
function GetLoadedEp04SaveData(A0_451)
  return _savedata_vars[A0_451]
end
function ResetScore()
  _SCORE_MANAGER.Reset(_EP04_FLAG_GAME_MANAGER.GetPhase())
  _SCORE_UI_MANAGER.Reset()
end
function CheckHiddenVictoryConditions(A0_452)
  local L1_453
  L1_453 = false
  if _EP04_FLAG_GAME_MANAGER.GetJamingFlg() and _SCORE_MANAGER.GetPcScore() >= _SCORE_MANAGER.GetMaxScore(A0_452) then
    L1_453 = true
  end
  return L1_453
end
function isAllReadyNpc()
  return _OUTFILEDNPCS.isAllReady()
end
