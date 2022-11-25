import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
EP04_DEBUG_FLAG = false
END_SCORE = 500
MAX_PHASE = 3
_harf_time_flag = false
_ringout_flag = false
_ringout_object = nil
_phase_end = false
_pc_hp = 0
_pc_hp_old = 0
_npc_hp = 0
_npc_hp_old = 0
_pc_state = 0
_npc_state = 0
_pc_state_old = 0
_npc_state_old = 0
_pc_state_trigger = 0
_npc_state_trigger = 0
_pc_bell_cnt = 3
_fi_bell_cnt = 3
_savedata_vars = {}
_ep04_flag_info_saw = false
_test_flg_col_on = false
_boarack_reset_request = false
_enable_scoreUI = false
_scoreUI = {}
_ScoreUI_Class = {}
function _ScoreUI_Class.new()
  local L0_0, L1_1
  L0_0 = {}
  L0_0.reset_score = false
  L1_1 = {
    1000,
    1000,
    1000
  }
  L0_0.max = L1_1
  L1_1 = L0_0.max
  L1_1 = L1_1[1]
  L1_1 = L1_1 / 2
  L0_0.pc = L1_1
  L1_1 = L0_0.max
  L1_1 = L1_1[1]
  L1_1 = L1_1 / 2
  L0_0.npc = L1_1
  L0_0.visible = true
  L0_0.ex = 1
  L1_1 = _scoreUI
  L1_1.pc_bell_anime_on = false
  L1_1 = _scoreUI
  L1_1.npc_bell_anime_on = false
  L0_0.old_gage_val = 0
  L0_0.old_bel_pc_num = -1
  L0_0.old_bel_npc_num = -1
  function L1_1()
    HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Bar)
    HUD:captureFlagInitGauge(500, 250)
    if L0_0.visible == false then
      HUD:captureFlagClose(false)
    end
  end
  L0_0.initUi = L1_1
  function L1_1(A0_2)
    local L1_3, L2_4, L4_5, L5_6, L6_7
    L1_3 = L0_0.max
    for L6_7 = 1, #L4_5 do
      L0_0.max[L6_7] = A0_2
      L0_0.pc = L0_0.max[L6_7] / 2
      L0_0.npc = L0_0.max[L6_7] / 2
    end
  end
  L0_0.init = L1_1
  function L1_1(A0_8)
    local L1_9
    L1_9 = L0_0.max
    L1_9 = L1_9[A0_8]
    L1_9 = L1_9 / 2
    L0_0.pc = L1_9
    L1_9 = L0_0.max
    L1_9 = L1_9[A0_8]
    L1_9 = L1_9 / 2
    L0_0.npc = L1_9
    L0_0.reset_score = true
  end
  L0_0.reset = L1_1
  function L1_1()
    local L0_10
    L0_10 = L0_0.visible
    if L0_10 == true then
      L0_10 = _phase_end
      if L0_10 == false then
        L0_10 = L0_0.old_gage_val
        if L0_10 ~= L0_0.pc then
          L0_10 = L0_0.pc
          if L0_0.reset_score == false then
            HUD:captureFlagChangeGauge(L0_10, 0.16)
          else
            HUD:captureFlagChangeGauge(L0_10, 0)
          end
          L0_0.old_gage_val = L0_10
        end
        L0_10 = L0_0.old_bel_pc_num
        if L0_10 ~= _pc_bell_cnt then
          L0_10 = _pc_bell_cnt
          L0_10 = L0_10 - L0_0.old_bel_pc_num
          if L0_10 ~= 0 then
            if L0_10 > 0 then
              HUD:captureFlagAddBell(HUD.kBell_Left)
              L0_0.old_bel_pc_num = L0_0.old_bel_pc_num + 1
            else
              HUD:captureFlagRemoveBell(HUD.kBell_Left)
              L0_0.old_bel_pc_num = L0_0.old_bel_pc_num - 1
            end
          end
        end
        L0_10 = L0_0.reset_score
        if L0_10 == false then
          L0_10 = _scoreUI
          L0_10 = L0_10.pc_bell_anime_on
          if L0_10 == true then
            L0_10 = _scoreUI
            L0_10.pc_bell_anime_on = false
            L0_10 = HUD
            L0_10 = L0_10.captureFlagStopBlink
            L0_10(L0_10, HUD.kBell_Left)
          end
        else
          L0_10 = _scoreUI
          L0_10 = L0_10.pc_bell_anime_on
          if L0_10 == true then
            L0_10 = _pc_state
            if L0_10 ~= "equip" then
              L0_10 = _pc_state
              if L0_10 ~= "steal" then
                L0_10 = _pc_state
              end
            elseif L0_10 == "non" then
              L0_10 = _scoreUI
              L0_10.pc_bell_anime_on = false
              L0_10 = HUD
              L0_10 = L0_10.captureFlagStopBlink
              L0_10(L0_10, HUD.kBell_Left)
            end
          else
            L0_10 = _pc_state
            if L0_10 == "drop" then
              L0_10 = _scoreUI
              L0_10.pc_bell_anime_on = true
              L0_10 = HUD
              L0_10 = L0_10.captureFlagPlayBlink
              L0_10(L0_10, HUD.kBell_Left)
            end
          end
        end
        L0_10 = L0_0.old_bel_npc_num
        if L0_10 ~= _fi_bell_cnt then
          L0_10 = _fi_bell_cnt
          L0_10 = L0_10 - L0_0.old_bel_npc_num
          if L0_10 ~= 0 then
            if L0_10 > 0 then
              HUD:captureFlagAddBell(HUD.kBell_Right)
              L0_0.old_bel_npc_num = L0_0.old_bel_npc_num + 1
            else
              HUD:captureFlagRemoveBell(HUD.kBell_Right)
              L0_0.old_bel_npc_num = L0_0.old_bel_npc_num - 1
            end
          end
        end
        L0_10 = L0_0.reset_score
        if L0_10 == false then
          L0_10 = _scoreUI
          L0_10 = L0_10.npc_bell_anime_on
          if L0_10 == true then
            L0_10 = HUD
            L0_10 = L0_10.captureFlagStopBlink
            L0_10(L0_10, HUD.kBell_Right)
            L0_10 = _scoreUI
            L0_10.npc_bell_anime_on = false
          end
        else
          L0_10 = _scoreUI
          L0_10 = L0_10.npc_bell_anime_on
          if L0_10 then
            L0_10 = _npc_state
            if L0_10 ~= "equip" then
              L0_10 = _npc_state
              if L0_10 ~= "steal" then
                L0_10 = _npc_state
              end
            elseif L0_10 == "non" then
              L0_10 = _scoreUI
              L0_10.npc_bell_anime_on = false
              L0_10 = HUD
              L0_10 = L0_10.captureFlagStopBlink
              L0_10(L0_10, HUD.kBell_Right)
            end
          else
            L0_10 = _npc_state
            if L0_10 == "drop" then
              L0_10 = _scoreUI
              L0_10.npc_bell_anime_on = true
              L0_10 = HUD
              L0_10 = L0_10.captureFlagPlayBlink
              L0_10(L0_10, HUD.kBell_Right)
            end
          end
        end
        L0_10 = setDebugDispMissionText
        L0_10("kitten\239\188\154" .. string.format("%02d", L0_0.pc) .. " / " .. string.format("%02d", L0_0.npc) .. "\239\188\154phi")
        L0_0.reset_score = false
      end
    end
  end
  L0_0.view = L1_1
  function L1_1()
    L0_0.visible = false
    HUD:captureFlagClose(false)
    _enable_scoreUI = false
  end
  L0_0.off = L1_1
  function L1_1()
    L0_0.visible = true
    HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Bar)
    _enable_scoreUI = true
  end
  L0_0.on = L1_1
  function L1_1(A0_11, A1_12)
    local L2_13, L3_14
    L2_13 = L0_0.pc
    L3_14 = L0_0.ex
    L3_14 = A0_11 * L3_14
    L2_13 = L2_13 + L3_14
    L0_0.pc = L2_13
    L2_13 = L0_0.pc
    L3_14 = L0_0.max
    L3_14 = L3_14[A1_12]
    if L2_13 > L3_14 then
      L2_13 = L0_0.max
      L2_13 = L2_13[A1_12]
      L0_0.pc = L2_13
    end
    L2_13 = L0_0.pc
    if L2_13 < 0 then
      L0_0.pc = 0
    end
  end
  L0_0.updatepc = L1_1
  function L1_1(A0_15, A1_16)
    local L2_17, L3_18
    L2_17 = L0_0.npc
    L3_18 = L0_0.ex
    L3_18 = A0_15 * L3_18
    L2_17 = L2_17 + L3_18
    L0_0.npc = L2_17
    L2_17 = L0_0.npc
    L3_18 = L0_0.max
    L3_18 = L3_18[A1_16]
    if L2_17 > L3_18 then
      L2_17 = L0_0.max
      L2_17 = L2_17[A1_16]
      L0_0.npc = L2_17
    end
    L2_17 = L0_0.npc
    if L2_17 < 0 then
      L0_0.npc = 0
    end
  end
  L0_0.updatenpc = L1_1
  function L1_1(A0_19, A1_20)
    local L2_21, L3_22
    L2_21 = _scoreUI
    L2_21 = L2_21.npc
    L3_22 = _scoreUI
    L3_22 = L3_22.pc
    L2_21 = L2_21 - L3_22
    L2_21 = L2_21 * 2
    L2_21 = L2_21 * 0.001
    return L2_21
  end
  L0_0.getBoarackPoint = L1_1
  function L1_1(A0_23)
    local L1_24, L2_25
    L1_24 = L0_0.max
    L1_24 = L1_24[A0_23]
    L2_25 = L0_0.pc
    if not (L1_24 <= L2_25) then
      L1_24 = L0_0.max
      L1_24 = L1_24[A0_23]
      L2_25 = L0_0.npc
    else
      if L1_24 <= L2_25 then
        L1_24 = false
        return L1_24
    end
    else
      L1_24 = true
      return L1_24
    end
  end
  L0_0.check = L1_1
  function L1_1()
    HUD:captureFlagClose(true)
  end
  L0_0.Delete = L1_1
  return L0_0
end
enmgen2_area_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator_01_01",
      name = "fi_01",
      ai_spawn_option = "Fi/fi_ep04_c"
    }
  },
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
    local L3_36
    L3_36 = enmgen2_area_01
    L3_36.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_37, L1_38
    L0_37 = enmgen2_area_01
    L0_37 = L0_37.spawnSet
    L0_37 = #L0_37
    return L0_37
  end,
  getEnemyDeadNum = function()
    local L1_39
    L1_39 = enmgen2_area_01
    L1_39 = L1_39.enemyDeadNum
    return L1_39
  end,
  getEnemyName = function(A0_40)
    local L1_41
    L1_41 = enmgen2_area_01
    L1_41 = L1_41.spawnSet
    L1_41 = L1_41[A0_40]
    L1_41 = L1_41.name
    return L1_41
  end
}
_OUTFILEDNPCS = {
  npc_drama_dat = {
    npc_tbl = nil,
    npc_mot_hdl_tbl = {},
    chara_name_tbl = {
      "ryz01",
      "miz01",
      "cid01",
      "sis01",
      "man34",
      "vog01",
      "man50",
      "man51",
      "man52",
      "dus01"
    },
    demo_pos_node_tbl = {
      ryz01 = "locator2_ryz01_demo_02",
      miz01 = "locator2_miz01_game_02",
      cid01 = "locator2_cid01_game_02",
      sis01 = "locator2_sis01_demo_02",
      man34 = "locator2_man34_game_02",
      vog01 = "locator2_vog01_game_02",
      man50 = "locator2_man50_game_02",
      man51 = "locator2_man51_game_02",
      man52 = "locator2_man52_game_02"
    },
    sumou_pos_node_tbl = {
      ryz01 = "locator2_ryz01_game_02",
      miz01 = "locator2_miz01_game_02",
      cid01 = "locator2_cid01_game_02",
      sis01 = "locator2_sis01_game_02",
      man34 = "locator2_man34_game_02",
      vog01 = "locator2_vog01_game_02",
      man50 = "locator2_man50_game_02",
      man51 = "locator2_man51_game_02",
      man52 = "locator2_man52_game_02"
    },
    audience = {
      man32 = {
        "locator2_game_02_man32_01",
        "locator2_game_02_man32_02",
        "locator2_game_02_man32_03",
        "locator2_game_02_man32_04",
        "locator2_game_02_man32_05",
        "locator2_game_02_man32_06"
      },
      man33 = {
        "locator2_game_02_man33_01",
        "locator2_game_02_man33_02",
        "locator2_game_02_man33_03",
        "locator2_game_02_man33_04",
        "locator2_game_02_man33_05",
        "locator2_game_02_man33_06"
      },
      man35 = {
        "locator2_game_02_man35_01",
        "locator2_game_02_man35_02",
        "locator2_game_02_man35_03",
        "locator2_game_02_man35_04",
        "locator2_game_02_man35_05",
        "locator2_game_02_man35_06"
      },
      man36 = {
        "locator2_game_02_man36_01",
        "locator2_game_02_man36_02",
        "locator2_game_02_man36_03",
        "locator2_game_02_man36_04",
        "locator2_game_02_man36_05",
        "locator2_game_02_man36_06"
      },
      wom17 = {
        "locator2_game_02_wom17_01",
        "locator2_game_02_wom17_02",
        "locator2_game_02_wom17_03",
        "locator2_game_02_wom17_04",
        "locator2_game_02_wom17_05",
        "locator2_game_02_wom17_06"
      },
      wom18 = {
        "locator2_game_02_wom18_01",
        "locator2_game_02_wom18_02",
        "locator2_game_02_wom18_03",
        "locator2_game_02_wom18_04",
        "locator2_game_02_wom18_05",
        "locator2_game_02_wom18_06"
      },
      wom20 = {
        "locator2_game_02_wom20_01",
        "locator2_game_02_wom20_02",
        "locator2_game_02_wom20_03",
        "locator2_game_02_wom20_04",
        "locator2_game_02_wom20_05",
        "locator2_game_02_wom20_06"
      },
      chi11 = {
        "locator2_game_02_chi11_01",
        "locator2_game_02_chi11_02",
        "locator2_game_02_chi11_03",
        "locator2_game_02_chi11_04"
      },
      chi12 = {
        "locator2_game_02_chi12_01",
        "locator2_game_02_chi12_02",
        "locator2_game_02_chi12_03"
      }
    },
    motion_normal = {
      man34 = {
        "man01_watching_soft_00"
      },
      man32 = {
        "man01_cheer_00",
        "man01_watching_00",
        "man01_cheer_soft_00",
        "man01_watching_soft_00"
      },
      man33 = {
        "man01_cheer_00",
        "man01_watching_00",
        "man01_cheer_soft_00",
        "man01_watching_soft_00"
      },
      man35 = {
        "man01_cheer_00",
        "man01_watching_00",
        "man01_cheer_soft_00",
        "man01_watching_soft_00"
      },
      man36 = {
        "man01_cheer_00",
        "man01_watching_00",
        "man01_cheer_soft_00",
        "man01_watching_soft_00"
      },
      wom17 = {
        "wom01_cheer_00",
        "wom01_cheer_01",
        "wom01_cheer_soft_00",
        "wom01_cheer_soft_01",
        "wom01_watching_00",
        "wom01_watching_00",
        "wom01_watching_soft_00",
        "wom01_watching_soft_01"
      },
      wom18 = {
        "wom01_cheer_00",
        "wom01_cheer_01",
        "wom01_cheer_soft_00",
        "wom01_cheer_soft_01",
        "wom01_watching_00",
        "wom01_watching_00",
        "wom01_watching_soft_00",
        "wom01_watching_soft_01"
      },
      wom20 = {
        "wom01_cheer_00",
        "wom01_cheer_01",
        "wom01_cheer_soft_00",
        "wom01_cheer_soft_01",
        "wom01_watching_00",
        "wom01_watching_00",
        "wom01_watching_soft_00",
        "wom01_watching_soft_01"
      },
      chi11 = {
        "chi01_cheer_00",
        "chi01_watching_00"
      },
      chi12 = {
        "chi01_cheer_00",
        "chi01_watching_00"
      }
    }
  },
  new = function()
    local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49
    L0_42 = _OUTFILEDNPCS
    L0_42 = L0_42.npc_drama_dat
    L1_43 = {}
    for L5_47, L6_48 in L2_44(L3_45) do
      L7_49 = {}
      L7_49.name = L6_48
      L7_49.type = L6_48
      L7_49.node = L0_42.demo_pos_node_tbl[L6_48]
      L7_49.active = true
      L7_49.attach = true
      L7_49.color_variation = 0
      L1_43[L6_48] = L7_49
    end
    for L5_47, L6_48 in L2_44(L3_45) do
      L7_49 = 1
      for _FORV_11_, _FORV_12_ in pairs(L6_48) do
        L1_43[L5_47 .. "_" .. string.format("%02d", L7_49)] = {
          name = L5_47 .. "_" .. string.format("%02d", L7_49),
          type = L5_47,
          node = _FORV_12_,
          active = true,
          attach = true,
          color_variation = math.abs((L7_49 - 1) % 4),
          hair_variation = math.abs((L7_49 - 1) % 2)
        }
        L7_49 = L7_49 + 1
      end
    end
    L2_44(L3_45, L4_46)
  end,
  isNewEnd = function()
    if "table" == type(_OUTFILEDNPCS.npc_drama_dat.npc_tbl) then
      return true
    else
      return false
    end
  end,
  SetDemoPos = function()
    local L0_50, L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60
    L0_50 = _OUTFILEDNPCS
    L0_50 = L0_50.npc_drama_dat
    for L4_54, L5_55 in L1_51(L2_52) do
      L6_56 = _OUTFILEDNPCS
      L6_56 = L6_56.npc_drama_dat
      L6_56 = L6_56.demo_pos_node_tbl
      L6_56 = L6_56[L5_55]
      if L6_56 ~= nil then
        L7_57(L8_58, L9_59)
      end
    end
    for L4_54, L5_55 in L1_51(L2_52) do
      L6_56 = L4_54
      if nil ~= L7_57 then
        if nil ~= L7_57 then
          L7_57(L8_58)
          L7_57[L6_56] = nil
        end
        L10_60 = L6_56
        L7_57[L6_56] = L8_58
      end
      for L10_60 = 1, 100 do
        L6_56 = L4_54 .. "_" .. string.format("%02d", L10_60)
        if nil ~= Fn_findNpc(L6_56) then
          if nil ~= L0_50.npc_mot_hdl_tbl[L6_56] then
            L0_50.npc_mot_hdl_tbl[L6_56]:abort()
            L0_50.npc_mot_hdl_tbl[L6_56] = nil
          end
          L0_50.npc_mot_hdl_tbl[L6_56] = invokeTask(function(A0_61, A1_62)
            wait(RandI(1, 60))
            Fn_playLoopMotionRand(A0_61, A1_62, 10, 30)
          end, L6_56, L5_55)
        else
          break
        end
      end
    end
    L1_51(L2_52, L3_53)
    L4_54 = false
    L1_51(L2_52, L3_53, L4_54)
    L4_54 = L1_51
    L5_55 = L2_52
    L6_56 = "loc_r_hand"
    L3_53(L4_54, L5_55, L6_56, L7_57)
    L4_54 = "sis01"
    L5_55 = "hold"
    L3_53(L4_54, L5_55)
    L4_54 = "sis01"
    L5_55 = false
    L3_53(L4_54, L5_55)
    L4_54 = "miz01"
    L5_55 = "stay"
    L6_56 = false
    L3_53(L4_54, L5_55, L6_56)
    L4_54 = "GimmickBg"
    L5_55 = "miz_mic"
    if L3_53 ~= nil then
      L5_55 = L3_53
      L4_54 = L3_53.leaveFromParent
      L4_54(L5_55)
      L5_55 = L3_53
      L4_54 = L3_53.try_term
      L4_54(L5_55)
    end
  end,
  SetSumouPos = function()
    local L0_63, L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73
    L0_63 = _OUTFILEDNPCS
    L0_63 = L0_63.npc_drama_dat
    for L4_67, L5_68 in L1_64(L2_65) do
      L6_69 = _OUTFILEDNPCS
      L6_69 = L6_69.npc_drama_dat
      L6_69 = L6_69.sumou_pos_node_tbl
      L6_69 = L6_69[L5_68]
      if L6_69 ~= nil then
        L7_70(L8_71, L9_72)
      end
      L7_70(L8_71, L9_72)
    end
    for L4_67, L5_68 in L1_64(L2_65) do
      L6_69 = L4_67
      if nil ~= L7_70 then
        if nil ~= L7_70 then
          L7_70(L8_71)
          L7_70[L6_69] = nil
        end
        L10_73 = L6_69
        L7_70[L6_69] = L8_71
      end
      for L10_73 = 1, 100 do
        L6_69 = L4_67 .. "_" .. string.format("%02d", L10_73)
        if nil ~= Fn_findNpc(L6_69) then
          if nil ~= L0_63.npc_mot_hdl_tbl[L6_69] then
            L0_63.npc_mot_hdl_tbl[L6_69]:abort()
            L0_63.npc_mot_hdl_tbl[L6_69] = nil
          end
          L0_63.npc_mot_hdl_tbl[L6_69] = invokeTask(function(A0_74, A1_75)
            wait(RandI(1, 60))
            Fn_playLoopMotionRand(A0_74, A1_75, 10, 30)
          end, L6_69, L5_68)
        else
          break
        end
      end
    end
    L1_64(L2_65, L3_66)
    L4_67 = false
    L1_64(L2_65, L3_66, L4_67)
    L1_64(L2_65, L3_66)
    L1_64(L2_65, L3_66)
    L1_64(L2_65)
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
    now_serif_task_priority = 100,
    order = nil,
    req_kit_Whiff_Soliloquy = false,
    req_alert = false,
    sound_hdl = nil,
    hitn_count_time = {}
  },
  new = function()
    local L0_76, L1_77
    L0_76 = _COMMENT_UI
    L0_76 = L0_76.comment_ui_dat
    L1_77 = {
      450,
      900,
      1350
    }
    L0_76.hitn_count_time = L1_77
    L1_77 = {}
    L1_77.start_comment = {
      first = {text = "ep04_02000", sound = "mis_116"},
      dominance = {text = "ep04_02001", sound = "mis_120"},
      recessive = {text = "ep04_02002", sound = "mis_123"},
      draw = {text = "ep04_02003", sound = "mis_128"},
      last_1_kit = {text = "ep04_02004", sound = "mis_122"},
      last_1_fi = {text = "ep04_02005", sound = "mis_118"},
      last_1_draw = {text = "ep04_02006", sound = "mis_129"}
    }
    L1_77.end_comment = {
      win = {text = "ep04_02007", sound = "mis_124"},
      lose = {text = "ep04_02008", sound = "mis_130"}
    }
    L1_77.drop_comment = {
      drop_kit = {text = "ep04_02009", sound = "mis_120"},
      drop_fi = {text = "ep04_02010", sound = "mis_123"}
    }
    L1_77.steal_comment = {
      steal_kit = {text = "ep04_02016", sound = "ryz_091"},
      steal_fi = {text = "ep04_02018", sound = "ryz_089"},
      game_set = {text = "ep04_02019", sound = "ryz_092"}
    }
    L1_77.lingout_comment = {
      fall_kit = {text = "ep04_02012", sound = "ryz_086"},
      fall_fi = {text = "ep04_02013", sound = "ryz_088"}
    }
    L0_76.text = L1_77
  end,
  CommentStart = function()
    local L0_78
    L0_78 = _COMMENT_UI
    L0_78 = L0_78.comment_ui_dat
    if L0_78.main_task_hdl == nil or L0_78.main_task_hdl:isRunning() == false then
      L0_78.main_task_hdl = invokeTask(_COMMENT_UI.TaskComment)
    end
  end,
  CommentEnd = function()
    local L0_79, L1_80, L2_81
    L0_79 = _COMMENT_UI
    L0_79 = L0_79.comment_ui_dat
    L1_80 = _COMMENT_UI
    L1_80 = L1_80.comment_ui_main_task_dat
    L2_81 = L0_79.main_task_hdl
    if L2_81 ~= nil then
      L2_81:abort()
      L0_79.main_task_hdl = nil
    end
    if L1_80.serif_task_hdl ~= nil then
      _COMMENT_UI.StopSerifTask()
      L1_80.serif_task_hdl = nil
    end
  end,
  CommentIsPlay = function()
    local L0_82, L1_83, L2_84, L3_85
    L0_82 = _COMMENT_UI
    L0_82 = L0_82.comment_ui_dat
    L1_83 = _COMMENT_UI
    L1_83 = L1_83.comment_ui_main_task_dat
    L2_84 = false
    L3_85 = L0_82.main_task_hdl
    if L3_85 ~= nil and not L2_84 then
      L2_84 = L3_85:isRunning()
    end
    if L1_83.serif_task_hdl ~= nil and not L2_84 then
      L2_84 = L1_83.serif_task_hdl:isRunning()
    end
    return L2_84
  end,
  TaskComment = function()
    local L0_86, L1_87
    L0_86 = _COMMENT_UI
    L0_86 = L0_86.comment_ui_dat
    L1_87 = _COMMENT_UI
    L1_87 = L1_87.comment_ui_main_task_dat
    _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.first, 2, 2)
    while _phase_end == false do
      if L1_87.pause_flg == false then
        if _pc_state_trigger == "steal" then
          if 0 < _pc_bell_cnt then
            _COMMENT_UI.ViewSerifTask(L0_86.text.steal_comment.steal_kit, 3, 1)
            invokeTask(function()
              waitSeconds(1)
              KitLoseSe()
            end)
          end
        elseif _npc_state_trigger == "steal" and 0 < _fi_bell_cnt then
          _COMMENT_UI.ViewSerifTask(L0_86.text.steal_comment.steal_fi, 3, 1)
          invokeTask(function()
            waitSeconds(1)
            KitWinSe()
          end)
        end
        if _harf_time_flag == true then
          if 0 < _pc_bell_cnt and 0 < _fi_bell_cnt and _ringout_flag == true then
            if _ringout_object:getName() == "player" then
              Sound:playSE("ene_human_fall_water", 1, "", Fn_getPlayer())
              invokeTask(function()
                waitSeconds(1)
                KitLoseSe()
              end)
              if _COMMENT_UI.ViewSerifTask(L0_86.text.lingout_comment.fall_kit, 3, 1) == true then
                while L1_87.serif_task_hdl ~= nil do
                  wait()
                end
              end
            else
              Sound:playSE("ene_human_fall_water", 1, "", findGameObject2("Puppet", "fi_01"))
              invokeTask(function()
                waitSeconds(1)
                KitWinSe()
              end)
              if _COMMENT_UI.ViewSerifTask(L0_86.text.lingout_comment.fall_fi, 3, 1) == true then
                while L1_87.serif_task_hdl ~= nil do
                  wait()
                end
              end
            end
          end
          while _harf_time_flag == true do
            wait()
          end
          waitSeconds(0.5)
          if _phase_end == false then
            if _pc_bell_cnt == 3 and _fi_bell_cnt == 3 then
              waitSeconds(1.5)
              _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.first, 3, 2)
            elseif _pc_bell_cnt == 1 and _fi_bell_cnt == 1 then
              waitSeconds(1.5)
              _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.last_1_draw, 3, 2)
            elseif _pc_bell_cnt == 1 or _fi_bell_cnt == 1 then
              if _pc_bell_cnt == 1 then
                waitSeconds(1.5)
                _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.last_1_kit, 3, 2)
              elseif _fi_bell_cnt == 1 then
                waitSeconds(1.5)
                _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.last_1_fi, 3, 2)
              end
            elseif _pc_bell_cnt == _fi_bell_cnt then
              waitSeconds(1.5)
              _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.draw, 3, 2)
            elseif _pc_bell_cnt > _fi_bell_cnt then
              waitSeconds(1.5)
              _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.dominance, 3, 2)
            elseif _pc_bell_cnt <= _fi_bell_cnt then
              waitSeconds(1.5)
              _COMMENT_UI.ViewSerifTask(L0_86.text.start_comment.recessive, 3, 2)
            else
              print("WARNING : _COMMENT_UI.TaskComment unknow game situation")
            end
            run_ringout_comment = false
          end
        end
        if _pc_state_trigger == "drop" then
          _COMMENT_UI.ViewSerifTask(L0_86.text.drop_comment.drop_kit, 3, 3)
        elseif _npc_state_trigger == "drop" then
          _COMMENT_UI.ViewSerifTask(L0_86.text.drop_comment.drop_fi, 3, 3)
        end
        if 0 < 3 then
          if 0 < L0_86.hitn_count_time[0 + 1] then
            if Player:getAction() == Player.kAction_Dodge then
            else
            end
          elseif _scoreUI.pc <= _scoreUI.max[1] * 0.75 and _COMMENT_UI.ViewHintTask("escape", 3, 100) then
          end
        end
      end
      wait()
    end
    _COMMENT_UI.StopSerifTask()
    _COMMENT_UI.ViewSerifTask(L0_86.text.steal_comment.game_set, 3, 2)
    while _harf_time_flag == true do
      wait()
    end
    waitSeconds(1.5)
    if _pc_bell_cnt >= _fi_bell_cnt then
      _COMMENT_UI.ViewSerifTask(L0_86.text.end_comment.win, 3, 1)
      KitWinSe()
    else
      _COMMENT_UI.ViewSerifTask(L0_86.text.end_comment.lose, 3, 1)
      KitLoseSe()
    end
    if L1_87.serif_task_hdl ~= nil then
      while L1_87.serif_task_hdl:isRunning() do
        wait()
      end
    end
    _COMMENT_UI.main_task_hdl = nil
  end,
  ViewSerifTask = function(A0_88, A1_89, A2_90)
    print("_COMMENT_UI.ViewSerifTask start")
    if _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl ~= nil then
      if A2_90 ~= nil then
        if A2_90 >= _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority then
          return false
        else
          _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = A2_90
        end
      else
        _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 0
      end
    end
    _COMMENT_UI.StopSerifTask()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = invokeTask(_COMMENT_UI.TaskViewSerifTask, A0_88, A1_89)
    print("_COMMENT_UI.ViewSerifTask end")
    return true
  end,
  ViewHintTask = function(A0_91, A1_92, A2_93)
    print("_COMMENT_UI.ViewHintTask start")
    if _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl ~= nil then
      if A2_93 ~= nil then
        if A2_93 >= _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority then
          return false
        else
          _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = A2_93
        end
      else
        _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 0
      end
    end
    _COMMENT_UI.StopSerifTask()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = invokeTask(_COMMENT_UI.TaskViewHintTask, A0_91, A1_92)
    print("_COMMENT_UI.ViewHintTask end")
    return true
  end,
  TaskViewHintTask = function(A0_94, A1_95)
    local L3_96
    L3_96 = _COMMENT_UI
    L3_96 = L3_96.comment_ui_dat
    Fn_captionViewEnd()
    Fn_tutorialCaption(A0_94)
    waitSeconds(A1_95)
    Fn_tutorialCaptionKill()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = nil
    _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 100
  end,
  TaskViewSerifTask = function(A0_97, A1_98)
    local L3_99
    L3_99 = _COMMENT_UI
    L3_99 = L3_99.comment_ui_dat
    if nil ~= A0_97.text and "string" == type(A0_97.text) then
      Fn_captionViewEnd()
      Fn_captionView(A0_97.text, A1_98, true, Font.kLayerFront)
    end
    _COMMENT_UI.SoundStop()
    if nil ~= A0_97.sound then
      _COMMENT_UI.comment_ui_main_task_dat.sound_hdl = Sound:playSEHandle(A0_97.sound, 1, nil, nil)
    end
    waitSeconds(A1_98)
    Fn_captionViewEnd()
    wait(10)
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = nil
    _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 100
  end,
  StopSerifTask = function()
    local L1_100, L2_101
    L1_100 = _COMMENT_UI
    L1_100 = L1_100.comment_ui_dat
    L2_101 = _COMMENT_UI
    L2_101 = L2_101.comment_ui_main_task_dat
    if L2_101.serif_task_hdl ~= nil then
      L2_101.serif_task_hdl:abort()
      L2_101.serif_task_hdl = nil
    end
    Fn_captionViewEnd()
    Fn_tutorialCaptionKill()
    _COMMENT_UI.SoundStop()
  end,
  Pase = function(A0_102)
    local L1_103
    L1_103 = _COMMENT_UI
    L1_103 = L1_103.comment_ui_main_task_dat
    if L1_103 == nil then
      print("_COMMENT_UI : _COMMENT_UI.Pase _COMMENT_UI.comment_ui_main_task_dat=nil")
      return
    end
    if A0_102 == true then
      _COMMENT_UI.comment_ui_main_task_dat.pause_flg = true
    else
      _COMMENT_UI.comment_ui_main_task_dat.pause_flg = false
    end
  end,
  RequestAlertComeback = function()
    local L0_104
    L0_104 = _COMMENT_UI
    L0_104 = L0_104.comment_ui_main_task_dat
    if L0_104 == nil then
      print("_COMMENT_UI : _COMMENT_UI.RequestAlertComeback _COMMENT_UI.comment_ui_main_task_dat=nil")
      return
    end
    L0_104.req_alert = true
  end,
  SoundStop = function()
    if nil ~= _COMMENT_UI.comment_ui_main_task_dat.sound_hdl then
      Sound:stopSEHandle(_COMMENT_UI.comment_ui_main_task_dat.sound_hdl)
      _COMMENT_UI.comment_ui_main_task_dat.sound_hdl = nil
    end
  end
}
function Initialize()
  Fn_setAreaWarp("ve_vogo_root", "locator2_vogo_ship_point_01")
  Fn_sensorOff("spheresensor2_01")
  Fn_sensorOff("cubesensor2_01")
  _scoreUI = _ScoreUI_Class.new()
  _scoreUI.init(END_SCORE)
  Fn_userCtrlAllOff()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint(nil)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  Fn_setCatActive(false)
  _OUTFILEDNPCS.new()
  repeat
    wait()
  until _OUTFILEDNPCS.isNewEnd()
  _demo01_cut01 = SDemo.create("demo01_cut01")
  _demo01_cut02 = SDemo.create("demo01_cut02")
  _demo01_cut03 = SDemo.create("demo01_cut03")
  _demo01_cut04 = SDemo.create("demo01_cut04")
  _savedata_vars = GameDatabase:get({
    ggd.GlobalSystemFlags__GameRetry,
    ggd.EventFlags__ep04__flag04
  })
  if _savedata_vars[ggd.GlobalSystemFlags__GameRetry] and _savedata_vars[ggd.EventFlags__ep04__flag04] <= 1 then
    _savedata_vars[ggd.EventFlags__ep04__flag04] = _savedata_vars[ggd.EventFlags__ep04__flag04] + 1
    GameDatabase:set(ggd.EventFlags__ep04__flag04, _savedata_vars[ggd.EventFlags__ep04__flag04])
  end
  _COMMENT_UI.new()
  debugTextUnder()
end
function Ingame()
  local L0_105
  L0_105 = Player
  L0_105 = L0_105.setNoDeathMode
  L0_105(L0_105, true)
  L0_105 = nil
  L0_105 = findGameObject2("EnemyBrain", "fi_01")
  L0_105:setVisibleBossMarker(true)
  findGameObject2("EnemyGenerator", "enmgen2_01"):setEnemyMarker(false)
  _OUTFILEDNPCS.SetDemoPos()
  if _savedata_vars[ggd.GlobalSystemFlags__GameRetry] == false then
    Fn_resetPcPos("locator2_kit01_demo_02")
    Fn_coercionPoseNomal()
    L0_105:reset(get_gameobj_node_world_pos_rot("locator2_phi01_02"))
    _demo01_cut01:load("start_cam_02", Fn_findAreaHandle("wa_a_01"))
    _demo01_cut01:play()
    Fn_missionStart()
    while _demo01_cut01:isPlay() do
      wait()
    end
    waitSeconds(0.75)
    Fn_kaiwaDemoView("ep04_00320k")
    wait(10)
    Fn_blackout()
    _demo01_cut01:stop()
  end
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_coercionPoseBattle()
  L0_105:reset(get_gameobj_node_world_pos_rot("locator2_fi_pos"))
  _OUTFILEDNPCS.SetSumouPos()
  _demo01_cut02:load("boarack_start_cam_03", Fn_findAreaHandle("wa_a_01"))
  _demo01_cut03:load("boarack_start_cam_02", Fn_findAreaHandle("wa_a_01"))
  _demo01_cut04:load("boarack_start_cam", Fn_findAreaHandle("wa_a_01"))
  _demo01_cut02:play()
  Sound:playSEHandle("ep04_cheer_loop", 1, "", Fn_findNpcPuppet("cid01"))
  if _savedata_vars[ggd.GlobalSystemFlags__GameRetry] == false then
    Fn_fadein()
  else
    Fn_missionStart()
  end
  while _demo01_cut02:isPlay() do
    wait()
  end
  wait(10)
  _demo01_cut02:stop()
  _demo01_cut03:play()
  while _demo01_cut03:isPlay() do
    wait()
  end
  wait(30)
  _demo01_cut03:stop()
  _demo01_cut04:play()
  wait(57)
  if _savedata_vars[ggd.GlobalSystemFlags__GameRetry] then
    HUD:info("ep04_info_02", false, -1)
    wait(10)
  end
  wait(10)
  L0_105:playMotion("phi01_fee_00")
  wait()
  while L0_105:isMotionEnd() == false do
    wait()
  end
  L0_105:endScriptAction()
  while _demo01_cut04:isPlay() do
    wait()
  end
  wait(10)
  _demo01_cut04:stop(2)
  waitSeconds(2)
  invokeTask(function()
    waitSeconds(2)
    _scoreUI.initUi()
    while _scoreUI and _phase_end == false do
      _scoreUI.view()
      wait()
    end
    if _scoreUI ~= nil then
      _scoreUI.Delete()
      _enable_scoreUI = true
    end
  end)
  Fn_captionViewEnd()
  _COMMENT_UI.SoundStop()
  waitSeconds(1)
  Fn_captionView("ep04_02011", 1, true, Font.kLayerFront)
  Sound:playSE("ryz_085", 1)
  waitSeconds(0.5)
  Sound:playSE("ep04_flag_battle_start", 1)
  waitSeconds(0.5)
  _COMMENT_UI.CommentStart()
  fn_boarackJudgeReport()
  findGameObject2("EnemyGenerator", "enmgen2_01"):setEnemyMarker(true)
  Fn_missionViewEnd()
  Fn_missionView("ep04_02020")
  Fn_sensorOn("spheresensor2_01")
  Fn_sensorOn("cubesensor2_01")
  Fn_userCtrlOn()
  while _phase_end == false do
    wait()
  end
  _enable_scoreUI = false
  Fn_userCtrlAllOff()
  Sound:playSE("ep04_flag_battle_start", 1)
  waitSeconds(2.5)
  while _COMMENT_UI.CommentIsPlay() == true do
    wait()
  end
  _COMMENT_UI.CommentEnd()
  if _pc_bell_cnt >= _fi_bell_cnt then
    Fn_resetCoercionPose()
    Fn_setNextMissionFlag()
    Fn_nextMission()
    Fn_exitSandbox()
  else
    Fn_missionRetry()
  end
end
function Finalize()
  Player:setNoDeathMode(false)
  if _scoreUI ~= nil then
    _scoreUI.Delete()
  end
  debugTextUnder(false)
  if Fn_getPlayer() then
    Fn_setCatActive(true)
    Fn_userCtrlOn()
  end
end
function cubesensor2_01_OnEnter(A0_106, A1_107)
  print("sensor_in")
  fn_lingout(A0_106, A1_107)
end
function cubesensor2_01_OnLeave(A0_108, A1_109)
  print("sensor_out")
end
function spheresensor2_01_OnEnter(A0_110, A1_111)
  print("spher_sensor_in")
end
function spheresensor2_01_OnLeave(A0_112, A1_113)
  print("spher_sensor_out")
  fn_lingout(A0_112, A1_113)
end
function fn_lingout(A0_114, A1_115)
  if (A1_115:getName() == "player" or A1_115:getName() == "fi_01") and _ringout_flag == false and _harf_time_flag == false then
    _ringout_flag = true
    _ringout_object = A1_115
  end
end
function fn_halfTime()
  if _harf_time_flag == false then
    _harf_time_flag = true
    Fn_userCtrlAllOff()
    invokeTask(function()
      local L0_116
      L0_116 = Fn_sensorOff
      L0_116("spheresensor2_01")
      L0_116 = Fn_sensorOff
      L0_116("cubesensor2_01")
      L0_116 = _pc_bell_cnt
      if not (L0_116 <= 0) then
        L0_116 = _fi_bell_cnt
        if not (L0_116 <= 0) then
          L0_116 = waitSeconds
          L0_116(4)
          L0_116 = Fn_blackout
          L0_116()
          L0_116 = _scoreUI
          L0_116 = L0_116.reset
          L0_116(1)
          L0_116 = Fn_resetPcPos
          L0_116("locator2_pc_start_pos")
          L0_116 = findGameObject2
          L0_116 = L0_116("EnemyBrain", "fi_01")
          L0_116:reset(get_gameobj_node_world_pos_rot("locator2_fi_pos"))
          _boarack_reset_request = true
          wait(10)
          Fn_fadein()
          invokeTask(function()
            L0_116 = findGameObject2("EnemyBrain", "fi_01")
            if L0_116 ~= nil then
              L0_116:playMotion("phi01_fee_00")
              while L0_116:isMotionEnd() == false do
                wait()
              end
              L0_116:endScriptAction()
            end
          end)
          wait(70)
          Fn_captionViewEnd()
          _COMMENT_UI.SoundStop()
          Fn_sensorOn("spheresensor2_01")
          Fn_sensorOn("cubesensor2_01")
          if _pc_bell_cnt == 2 and _fi_bell_cnt == 3 then
            HUD:info("ep04_info_02", false, -1)
            wait(10)
          end
          waitSeconds(1)
          Fn_captionView("ep04_02015", 1, true, Font.kLayerFront)
          Sound:playSE("ryz_085", 1)
          waitSeconds(0.5)
          Sound:playSE("ep04_flag_battle_start", 1)
          waitSeconds(0.5)
          Fn_missionViewEnd()
          Fn_missionView("ep04_02020")
          Fn_userCtrlOn()
        end
      else
      end
      _harf_time_flag = false
      _ringout_flag = false
      _ringout_object = nil
    end)
  end
end
function fn_boarackJudgeReport()
  local L0_117
  L0_117 = Player
  L0_117 = L0_117.getEnergyMax
  L0_117 = L0_117(L0_117, Player.kEnergy_Life)
  _pc_hp = L0_117
  L0_117 = _pc_hp
  _pc_hp_old = L0_117
  function L0_117(A0_118)
    local L1_119
    L1_119 = _phase_end
    if L1_119 == false then
      L1_119 = _harf_time_flag
      if L1_119 == false then
        L1_119 = _pc_hp
        _pc_hp_old = L1_119
        L1_119 = _pc_hp
        L1_119 = L1_119 - Player:getLastFrameDamagePoint()
        _pc_hp = L1_119
        L1_119 = _npc_hp
        _npc_hp_old = L1_119
        L1_119 = A0_118.fi_hp
        _npc_hp = L1_119
        L1_119 = _pc_state
        _pc_state_old = L1_119
        L1_119 = A0_118.player_bell_state
        _pc_state = L1_119
        L1_119 = _npc_state
        _npc_state_old = L1_119
        L1_119 = A0_118.fi_bell_state
        _npc_state = L1_119
        L1_119 = A0_118.player_bell_state_trigger
        _pc_state_trigger = L1_119
        L1_119 = A0_118.fi_bell_state_trigger
        _npc_state_trigger = L1_119
        A0_118.fi_ai_pause_flag = false
        L1_119 = _ringout_flag
        if L1_119 == true then
          L1_119 = Sound
          L1_119 = L1_119.playSE
          L1_119(L1_119, "ep04_bell_fall", 1)
          L1_119 = _ringout_object
          L1_119 = L1_119.getName
          L1_119 = L1_119(L1_119)
          if L1_119 == "player" then
            _pc_bell_cnt = _pc_bell_cnt - 1
          else
            _fi_bell_cnt = _fi_bell_cnt - 1
          end
          A0_118.fi_ai_pause_flag = true
          if _fi_bell_cnt <= 0 or _pc_bell_cnt <= 0 then
            _phase_end = true
          end
          fn_halfTime()
        else
          L1_119 = _pc_hp_old
          if L1_119 > _pc_hp then
            L1_119 = _pc_state
            if L1_119 == "equip" then
              L1_119 = _npc_state
              if L1_119 == "equip" then
                L1_119 = _scoreUI
                L1_119 = L1_119.updatepc
                L1_119(-1 * (_pc_hp_old - _pc_hp), 1)
                L1_119 = _scoreUI
                L1_119 = L1_119.updatenpc
                L1_119(_pc_hp_old - _pc_hp, 1)
                L1_119 = _scoreUI
                L1_119 = L1_119.getBoarackPoint
                L1_119 = L1_119()
                A0_118.boarack_point = L1_119
              end
            end
            L1_119 = Player
            L1_119 = L1_119.getEnergyMax
            L1_119 = L1_119(L1_119, Player.kEnergy_Life)
            Player:setEnergy(Player.kEnergy_Life, L1_119)
          end
          L1_119 = A0_118.player_bell_state_trigger
          if L1_119 == "drop" then
            L1_119 = Sound
            L1_119 = L1_119.playSE
            L1_119(L1_119, "ep04_bell_fall", 1)
            L1_119 = Fn_missionView
            L1_119("ep04_02021")
          end
          L1_119 = A0_118.player_bell_state_trigger
          if L1_119 == "equip" then
            L1_119 = _scoreUI
            L1_119 = L1_119.updatepc
            L1_119(_scoreUI.max[1] * 0.1, 1)
            L1_119 = _scoreUI
            L1_119 = L1_119.updatenpc
            L1_119(_scoreUI.max[1] * -0.1, 1)
            L1_119 = _scoreUI
            L1_119 = L1_119.getBoarackPoint
            L1_119 = L1_119()
            A0_118.boarack_point = L1_119
            L1_119 = Sound
            L1_119 = L1_119.playSE
            L1_119(L1_119, "ep04_bell_fall", 1)
            L1_119 = Fn_missionViewEnd
            L1_119()
          end
          L1_119 = A0_118.player_bell_state_trigger
          if L1_119 == "steal" then
            L1_119 = _pc_bell_cnt
            L1_119 = L1_119 - 1
            _pc_bell_cnt = L1_119
            L1_119 = Sound
            L1_119 = L1_119.playSE
            L1_119(L1_119, "ep04_bell_fall", 1)
            L1_119 = Fn_userCtrlAllOff
            L1_119()
            L1_119 = Fn_missionViewEnd
            L1_119()
            L1_119 = fn_halfTime
            L1_119()
          end
          L1_119 = _pc_bell_cnt
          A0_118.bellcount_player = L1_119
          L1_119 = _npc_hp_old
          if L1_119 > _npc_hp then
            L1_119 = _pc_state
            if L1_119 == "equip" then
              L1_119 = _npc_state
              if L1_119 == "equip" then
                L1_119 = _scoreUI
                L1_119 = L1_119.updatepc
                L1_119(_npc_hp_old - _npc_hp, 1)
                L1_119 = _scoreUI
                L1_119 = L1_119.updatenpc
                L1_119(-1 * (_npc_hp_old - _npc_hp), 1)
                L1_119 = _scoreUI
                L1_119 = L1_119.getBoarackPoint
                L1_119 = L1_119()
                A0_118.boarack_point = L1_119
              end
            end
          end
          L1_119 = A0_118.fi_bell_state_trigger
          if L1_119 == "drop" then
            L1_119 = Sound
            L1_119 = L1_119.playSE
            L1_119(L1_119, "ep04_bell_fall", 1)
            L1_119 = Fn_missionView
            L1_119("ep04_02021")
          end
          L1_119 = A0_118.fi_bell_state_trigger
          if L1_119 == "equip" then
            L1_119 = _scoreUI
            L1_119 = L1_119.updatepc
            L1_119(_scoreUI.max[1] * -0.1, 1)
            L1_119 = _scoreUI
            L1_119 = L1_119.updatenpc
            L1_119(_scoreUI.max[1] * 0.1, 1)
            L1_119 = _scoreUI
            L1_119 = L1_119.getBoarackPoint
            L1_119 = L1_119()
            A0_118.boarack_point = L1_119
            L1_119 = Sound
            L1_119 = L1_119.playSE
            L1_119(L1_119, "ep04_bell_fall", 1)
            L1_119 = Fn_missionViewEnd
            L1_119()
          end
          L1_119 = A0_118.fi_bell_state_trigger
          if L1_119 == "steal" then
            L1_119 = _fi_bell_cnt
            L1_119 = L1_119 - 1
            _fi_bell_cnt = L1_119
            L1_119 = Sound
            L1_119 = L1_119.playSE
            L1_119(L1_119, "ep04_bell_fall", 1)
            L1_119 = invokeTask
            L1_119(function()
              waitSeconds(1.16)
              Sound:playSE("ene_fi_vo_die", 1, nil, findGameObject2("Puppet", "fi_01"))
            end)
            L1_119 = Fn_userCtrlAllOff
            L1_119()
            L1_119 = Fn_missionViewEnd
            L1_119()
            L1_119 = fn_halfTime
            L1_119()
          end
          L1_119 = _fi_bell_cnt
          A0_118.bellcount_fi = L1_119
          L1_119 = _fi_bell_cnt
          if not (L1_119 <= 0) then
            L1_119 = _pc_bell_cnt
          elseif L1_119 <= 0 then
            _phase_end = true
          end
          L1_119 = _phase_end
          if L1_119 ~= true then
            L1_119 = _harf_time_flag
          elseif L1_119 == true then
            A0_118.fi_ai_pause_flag = true
          end
        end
      end
    else
      A0_118.fi_ai_pause_flag = true
    end
    L1_119 = _boarack_reset_request
    if true == L1_119 then
      A0_118.boarack_reset_flag = true
      _boarack_reset_request = false
    end
    return A0_118
  end
  findGameObject2("EnemyBrain", "fi_01"):setEventListener("boss_fi_BoarackJudgeReport", L0_117)
end
function KitWinSe()
  Sound:playSE("ep04_cheer_win", 1)
end
function KitLoseSe()
  Sound:playSE("ep04_cheer_lose", 1)
end
