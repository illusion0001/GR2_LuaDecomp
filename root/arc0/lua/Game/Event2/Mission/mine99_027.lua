dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_027"
_floor_num = 27
_boss_battle_floor = true
END_SCORE = 500
MAX_PHASE = 3
_fi_bgm_set01 = false
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
_boarack_stanby_flg = false
_look_at_handle = nil
_demo01_cut01 = nil
_lock_ability_list = {
  Player.kAbility_AttrTuneSwitch,
  Player.kAbility_RocketJump,
  Player.kAbility_GravityShift,
  Player.kAbility_GravityRevert,
  Player.kAbility_GravityBoost,
  Player.kAbility_GravityKick,
  Player.kAbility_Slider,
  Player.kAbility_SliderKick,
  Player.kAbility_Grab,
  Player.kAbility_ExGrab,
  Player.kAbility_Throw,
  Player.kAbility_SpAttack,
  Player.kAbility_SpTornado,
  Player.kAbility_SpTyphoon,
  Player.kAbility_SpBlackHole,
  Player.kAbility_SpCrowDestroyer,
  Player.kAbility_FelineStart,
  Player.kAbility_FelineEnd
}
_lock_ability_opt_list = {v_infinite = true, g_infinite = true}
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
  end
  L0_0.off = L1_1
  function L1_1()
    L0_0.visible = true
    HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Bar)
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
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi_mine_01",
      locator = "locator2_fi_pos",
      name = "fi_01",
      ai_spawn_option = "Fi/fi_mine99_027"
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
    local L0_42, L1_43
    L0_42 = _COMMENT_UI
    L0_42 = L0_42.comment_ui_dat
    L1_43 = {
      450,
      900,
      1350
    }
    L0_42.hitn_count_time = L1_43
    L1_43 = {}
    L1_43.start_comment = {
      first = {text = "ep04_02000", sound = "mis_116"},
      dominance = {text = "ep04_02001", sound = "mis_120"},
      recessive = {text = "ep04_02002", sound = "mis_123"},
      draw = {text = "ep04_02003", sound = "mis_128"},
      last_1_kit = {text = "ep04_02004", sound = "mis_122"},
      last_1_fi = {text = "ep04_02005", sound = "mis_118"},
      last_1_draw = {text = "ep04_02006", sound = "mis_129"}
    }
    L1_43.end_comment = {
      win = {text = "ep04_02007", sound = "mis_124"},
      lose = {text = "ep04_02008", sound = "mis_130"}
    }
    L1_43.drop_comment = {
      drop_kit = {text = "ep04_02009", sound = "mis_120"},
      drop_fi = {text = "ep04_02010", sound = "mis_123"}
    }
    L1_43.steal_comment = {
      steal_kit = {text = "ep04_02016", sound = "ryz_091"},
      steal_fi = {text = "ep04_02018", sound = "ryz_089"},
      game_set = {text = "ep04_02019", sound = "ryz_092"}
    }
    L1_43.lingout_comment = {
      fall_kit = {text = "ep04_02012", sound = "ryz_086"},
      fall_fi = {text = "ep04_02013", sound = "ryz_088"}
    }
    L0_42.text = L1_43
  end,
  CommentStart = function()
    local L0_44
    L0_44 = _COMMENT_UI
    L0_44 = L0_44.comment_ui_dat
    if L0_44.main_task_hdl == nil or L0_44.main_task_hdl:isRunning() == false then
      L0_44.main_task_hdl = invokeTask(_COMMENT_UI.TaskComment)
    end
  end,
  CommentEnd = function()
    local L0_45, L1_46, L2_47
    L0_45 = _COMMENT_UI
    L0_45 = L0_45.comment_ui_dat
    L1_46 = _COMMENT_UI
    L1_46 = L1_46.comment_ui_main_task_dat
    L2_47 = L0_45.main_task_hdl
    if L2_47 ~= nil then
      L2_47:abort()
      L0_45.main_task_hdl = nil
    end
    if L1_46.serif_task_hdl ~= nil then
      _COMMENT_UI.StopSerifTask()
      L1_46.serif_task_hdl = nil
    end
  end,
  CommentIsPlay = function()
    local L0_48, L1_49, L2_50, L3_51
    L0_48 = _COMMENT_UI
    L0_48 = L0_48.comment_ui_dat
    L1_49 = _COMMENT_UI
    L1_49 = L1_49.comment_ui_main_task_dat
    L2_50 = false
    L3_51 = L0_48.main_task_hdl
    if L3_51 ~= nil and not L2_50 then
      L2_50 = L3_51:isRunning()
    end
    if L1_49.serif_task_hdl ~= nil and not L2_50 then
      L2_50 = L1_49.serif_task_hdl:isRunning()
    end
    return L2_50
  end,
  TaskComment = function()
    local L1_52, L2_53, L3_54
    L1_52 = _COMMENT_UI
    L1_52 = L1_52.comment_ui_dat
    L2_53 = _COMMENT_UI
    L2_53 = L2_53.comment_ui_main_task_dat
    L3_54 = 0
    while _phase_end == false do
      if L2_53.pause_flg == false then
        if _pc_state_trigger == "steal" then
          if 0 < _pc_bell_cnt then
          end
        elseif _npc_state_trigger ~= "steal" or 0 < _fi_bell_cnt then
        end
        if _harf_time_flag == true then
          L3_54 = 0
          if not (0 < _pc_bell_cnt) or not (0 < _fi_bell_cnt) or _ringout_flag ~= true or _ringout_object:getName() == "player" then
          else
          end
          while _harf_time_flag == true do
            wait()
          end
          waitSeconds(0.5)
          if _phase_end == false then
            if _pc_bell_cnt == 3 and _fi_bell_cnt == 3 then
              waitSeconds(1.5)
            elseif _pc_bell_cnt == 1 and _fi_bell_cnt == 1 then
              waitSeconds(1.5)
            elseif _pc_bell_cnt == 1 or _fi_bell_cnt == 1 then
              if _pc_bell_cnt == 1 then
                waitSeconds(1.5)
              elseif _fi_bell_cnt == 1 then
                waitSeconds(1.5)
              end
            elseif _pc_bell_cnt == _fi_bell_cnt then
              waitSeconds(1.5)
            elseif _pc_bell_cnt > _fi_bell_cnt then
              waitSeconds(1.5)
            elseif _pc_bell_cnt <= _fi_bell_cnt then
              waitSeconds(1.5)
            else
              print("WARNING : _COMMENT_UI.TaskComment unknow game situation")
            end
            run_ringout_comment = false
          end
        end
        if _pc_state_trigger == "drop" then
        elseif _npc_state_trigger == "drop" then
        end
      end
      wait()
    end
    waitSeconds(1.5)
    if L2_53.serif_task_hdl ~= nil then
      while L2_53.serif_task_hdl:isRunning() do
        wait()
      end
    end
    _COMMENT_UI.main_task_hdl = nil
  end,
  ViewSerifTask = function(A0_55, A1_56, A2_57)
    print("_COMMENT_UI.ViewSerifTask start")
    if _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl ~= nil then
      if A2_57 ~= nil then
        if A2_57 >= _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority then
          return false
        else
          _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = A2_57
        end
      else
        _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 0
      end
    end
    _COMMENT_UI.StopSerifTask()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = invokeTask(_COMMENT_UI.TaskViewSerifTask, A0_55, A1_56)
    print("_COMMENT_UI.ViewSerifTask end")
    return true
  end,
  ViewHintTask = function(A0_58, A1_59, A2_60)
    print("_COMMENT_UI.ViewHintTask start")
    if _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl ~= nil then
      if A2_60 ~= nil then
        if A2_60 >= _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority then
          return false
        else
          _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = A2_60
        end
      else
        _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 0
      end
    end
    _COMMENT_UI.StopSerifTask()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = invokeTask(_COMMENT_UI.TaskViewHintTask, A0_58, A1_59)
    print("_COMMENT_UI.ViewHintTask end")
    return true
  end,
  TaskViewHintTask = function(A0_61, A1_62)
    local L3_63
    L3_63 = _COMMENT_UI
    L3_63 = L3_63.comment_ui_dat
    Fn_captionViewEnd()
    Fn_tutorialCaption(A0_61)
    waitSeconds(A1_62)
    Fn_tutorialCaptionKill()
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = nil
    _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 100
  end,
  TaskViewSerifTask = function(A0_64, A1_65)
    local L3_66
    L3_66 = _COMMENT_UI
    L3_66 = L3_66.comment_ui_dat
    if nil ~= A0_64.text and "string" == type(A0_64.text) then
      Fn_captionViewEnd()
      Fn_captionView(A0_64.text, A1_65, true, Font.kLayerFront)
    end
    _COMMENT_UI.SoundStop()
    if nil ~= A0_64.sound then
      _COMMENT_UI.comment_ui_main_task_dat.sound_hdl = Sound:playSEHandle(A0_64.sound, 1, nil, nil)
    end
    waitSeconds(A1_65)
    Fn_captionViewEnd()
    wait(10)
    _COMMENT_UI.comment_ui_main_task_dat.serif_task_hdl = nil
    _COMMENT_UI.comment_ui_main_task_dat.now_serif_task_priority = 100
  end,
  StopSerifTask = function()
    local L1_67, L2_68
    L1_67 = _COMMENT_UI
    L1_67 = L1_67.comment_ui_dat
    L2_68 = _COMMENT_UI
    L2_68 = L2_68.comment_ui_main_task_dat
    if L2_68.serif_task_hdl ~= nil then
      L2_68.serif_task_hdl:abort()
      L2_68.serif_task_hdl = nil
    end
    Fn_captionViewEnd()
    Fn_tutorialCaptionKill()
    _COMMENT_UI.SoundStop()
  end,
  Pase = function(A0_69)
    local L1_70
    L1_70 = _COMMENT_UI
    L1_70 = L1_70.comment_ui_main_task_dat
    if L1_70 == nil then
      print("_COMMENT_UI : _COMMENT_UI.Pase _COMMENT_UI.comment_ui_main_task_dat=nil")
      return
    end
    if A0_69 == true then
      _COMMENT_UI.comment_ui_main_task_dat.pause_flg = true
    else
      _COMMENT_UI.comment_ui_main_task_dat.pause_flg = false
    end
  end,
  RequestAlertComeback = function()
    local L0_71
    L0_71 = _COMMENT_UI
    L0_71 = L0_71.comment_ui_main_task_dat
    if L0_71 == nil then
      print("_COMMENT_UI : _COMMENT_UI.RequestAlertComeback _COMMENT_UI.comment_ui_main_task_dat=nil")
      return
    end
    L0_71.req_alert = true
  end,
  SoundStop = function()
    if nil ~= _COMMENT_UI.comment_ui_main_task_dat.sound_hdl then
      Sound:stopSEHandle(_COMMENT_UI.comment_ui_main_task_dat.sound_hdl)
      _COMMENT_UI.comment_ui_main_task_dat.sound_hdl = nil
    end
  end
}
function InitializeBody()
  Fn_sensorOff("spheresensor2_01")
  Fn_sensorOff("cubesensor2_01")
  _scoreUI = _ScoreUI_Class.new()
  _scoreUI.init(END_SCORE)
  _demo01_cut01 = SDemo.create("Mine99Demo01_Cut01")
  Fn_userCtrlAllOff()
end
function IngameBody()
  local L0_72, L1_73, L2_74
  L0_72 = Fn_getMine99FloorClear
  L0_72 = L0_72()
  if L0_72 then
    L0_72 = Fn_setBgmPoint
    L1_73 = "event"
    L2_74 = "non_boss"
    L0_72(L1_73, L2_74)
    L0_72 = Fn_missionStart
    L0_72()
    L0_72 = Fn_userCtrlOn
    L0_72()
    L0_72 = print
    L1_73 = "\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153"
    L0_72(L1_73)
  else
    L0_72 = Fn_userCtrlAllOff
    L0_72()
    L0_72 = Fn_setCatActive
    L1_73 = false
    L0_72(L1_73)
    L0_72 = Fn_lockPlayerAbility
    L1_73 = _lock_ability_list
    L2_74 = _lock_ability_opt_list
    L0_72(L1_73, L2_74)
    L0_72 = Player
    L1_73 = L0_72
    L0_72 = L0_72.setAttrTune
    L2_74 = Player
    L2_74 = L2_74.kAttrTune_Normal
    L0_72(L1_73, L2_74, true)
    L0_72 = Player
    L1_73 = L0_72
    L0_72 = L0_72.setNoDeathMode
    L2_74 = true
    L0_72(L1_73, L2_74)
    L0_72 = findGameObject2
    L1_73 = "EnemyGenerator"
    L2_74 = "enmgen2_01"
    L0_72 = L0_72(L1_73, L2_74)
    L2_74 = L0_72
    L1_73 = L0_72.requestSpawn
    L1_73(L2_74)
    repeat
      L1_73 = wait
      L1_73()
      L2_74 = L0_72
      L1_73 = L0_72.isPrepared
      L1_73 = L1_73(L2_74)
    until L1_73
    L1_73 = findGameObject2
    L2_74 = "EnemyBrain"
    L1_73 = L1_73(L2_74, "fi_01")
    function L2_74()
      Fn_userCtrlAllOff()
      _demo01_cut01:reset()
      _demo01_cut01:set("locator2_cam_eye_02", "locator2_cam_at_02", true)
      _demo01_cut01:play({
        {
          pos = "locator2_cam_eye_01",
          time = 4
        }
      }, {
        {
          pos = "locator2_cam_at_01",
          time = 4
        }
      })
    end
    Fn_missionStart(L2_74)
    invokeTask(function()
      Fn_showMineName()
      waitSeconds(3)
      Fn_captionViewWait("ic_pi_mine99_27_002")
      waitSeconds(1)
      Fn_captionView("ic_pi_mine99_27_001")
      waitSeconds(3.5)
      Fn_captionView("ic_pi_monument_00270", 4)
      Fn_missionView("ic_pi_monument_obj_00270", 0, nil, true)
      Sound:playSE("skb_003", 1)
    end)
    Fn_setBgmPoint("event", "boss_battle")
    L1_73:playMotion("phi01_fee_00")
    while _demo01_cut01:isPlay() do
      wait()
    end
    _demo01_cut01:stop(4.5)
    waitSeconds(4.83)
    while L1_73:isMotionEnd() == false do
      wait()
    end
    L1_73:endScriptAction()
    waitSeconds(1)
    L0_72:setEnemyMarker(true)
    invokeTask(function()
      _scoreUI.initUi()
      while _scoreUI and _phase_end == false do
        _scoreUI.view()
        wait()
      end
      if _scoreUI then
        _scoreUI.Delete()
      end
    end)
    waitSeconds(1.5)
    Sound:playSE("ep04_flag_battle_start", 1)
    wait(10)
    Fn_sensorOn("spheresensor2_01")
    Fn_sensorOn("cubesensor2_01")
    fn_boarackJudgeReport()
    Fn_userCtrlOn()
    while _phase_end == false do
      wait()
    end
    if _pc_bell_cnt < _fi_bell_cnt then
      Fn_userCtrlAllOff()
      waitSeconds(0.5)
      MineManager:sendEvent("_requestUploadDeathGhostPlayer")
      waitSeconds(4.5)
      Fn_captionViewEnd()
      Sound:playSE("skb_005", 1)
      Fn_captionViewWait("ic_litho_00110", 3, 2.5)
      _forcing_gameover = true
      repeat
        wait()
      until false
    end
    Fn_userCtrlOff()
    Fn_setBgmPoint("event", "boss_battle_end")
    waitSeconds(1)
    Sound:playSE("ene_boss_finish", 1)
    Fn_whiteout()
    Fn_setCatActive(true)
    L0_72:requestAllEnemyKill()
    Fn_unLockPlayerAbility(_lock_ability_list, _lock_ability_opt_list)
    Fn_userCtrlAllOff()
    Fn_resetPcPos("locator2_pc_start_pos")
    Fn_missionInfoEnd()
    Fn_captionViewEnd()
    Fn_fadein()
    wait(10)
    Sound:playSE("ep04_flag_battle_start", 1)
    waitSeconds(2.5)
    Fn_setMine99FloorClear()
    Sound:playSE("skb_004", 1)
    Fn_captionViewWait("ic_litho_00100", 3, 4.5)
    waitSeconds(1)
    if Fn_rewardMineBoss("boss12") then
      print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
    else
      Fn_dropGraviryOre("locator2_reward_pos_01")
    end
    Fn_userCtrlOn()
  end
  L0_72 = Fn_setGravityGateActive
  L1_73 = true
  L0_72(L1_73)
  L0_72 = Fn_cageMove
  L0_72()
end
function FinalizeBody()
  Player:setNoDeathMode(false)
  Fn_setCatActive(true)
  Fn_unLockPlayerAbility(_lock_ability_list, _lock_ability_opt_list)
end
function cubesensor2_01_OnEnter(A0_75, A1_76)
  print("sensor_in")
  fn_lingout(A0_75, A1_76)
end
function cubesensor2_01_OnLeave(A0_77, A1_78)
  print("sensor_out")
end
function spheresensor2_01_OnEnter(A0_79, A1_80)
  print("spher_sensor_in")
end
function spheresensor2_01_OnLeave(A0_81, A1_82)
  print("spher_sensor_out")
  fn_lingout(A0_81, A1_82)
end
function fn_lingout(A0_83, A1_84)
  if (A1_84:getName() == "player" or A1_84:getName() == "fi_01") and _ringout_flag == false and _harf_time_flag == false then
    _ringout_flag = true
    _ringout_object = A1_84
  end
end
function fn_halfTime()
  if _harf_time_flag == false then
    _harf_time_flag = true
    Fn_userCtrlAllOff()
    invokeTask(function()
      local L0_85
      L0_85 = Fn_sensorOff
      L0_85("spheresensor2_01")
      L0_85 = Fn_sensorOff
      L0_85("cubesensor2_01")
      L0_85 = _pc_bell_cnt
      if not (L0_85 <= 0) then
        L0_85 = _fi_bell_cnt
        if not (L0_85 <= 0) then
          L0_85 = _fi_bgm_set01
          if L0_85 == false then
            L0_85 = _fi_bell_cnt
            if L0_85 <= 1 then
              L0_85 = Fn_setBgmPoint
              L0_85("event", "boss_battle2")
              _fi_bgm_set01 = true
            end
          end
          L0_85 = waitSeconds
          L0_85(1.5)
          L0_85 = Fn_blackout
          L0_85()
          L0_85 = Fn_missionViewEnd
          L0_85()
          L0_85 = _scoreUI
          L0_85 = L0_85.reset
          L0_85(1)
          L0_85 = Fn_resetPcPos
          L0_85("locator2_pc_start_pos")
          L0_85 = findGameObject2
          L0_85 = L0_85("EnemyBrain", "fi_01")
          L0_85:reset(get_gameobj_node_world_pos_rot("locator2_fi_pos"))
          _boarack_reset_request = true
          wait(10)
          Fn_fadein()
          invokeTask(function()
            L0_85 = findGameObject2("EnemyBrain", "fi_01")
            if L0_85 ~= nil then
              L0_85:playMotion("phi01_fee_00")
              while L0_85:isMotionEnd() == false do
                wait()
              end
              L0_85:endScriptAction()
            end
          end)
          wait(70)
          Fn_captionViewEnd()
          Fn_sensorOn("spheresensor2_01")
          Fn_sensorOn("cubesensor2_01")
          waitSeconds(1)
          Sound:playSE("ep04_flag_battle_start", 1)
          waitSeconds(0.5)
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
  local L0_86
  L0_86 = Player
  L0_86 = L0_86.getEnergyMax
  L0_86 = L0_86(L0_86, Player.kEnergy_Life)
  _pc_hp = L0_86
  L0_86 = _pc_hp
  _pc_hp_old = L0_86
  function L0_86(A0_87)
    local L1_88
    L1_88 = _phase_end
    if L1_88 == false then
      L1_88 = _harf_time_flag
      if L1_88 == false then
        L1_88 = _pc_hp
        _pc_hp_old = L1_88
        L1_88 = _pc_hp
        L1_88 = L1_88 - Player:getLastFrameDamagePoint()
        _pc_hp = L1_88
        L1_88 = _npc_hp
        _npc_hp_old = L1_88
        L1_88 = A0_87.fi_hp
        _npc_hp = L1_88
        L1_88 = _pc_state
        _pc_state_old = L1_88
        L1_88 = A0_87.player_bell_state
        _pc_state = L1_88
        L1_88 = _npc_state
        _npc_state_old = L1_88
        L1_88 = A0_87.fi_bell_state
        _npc_state = L1_88
        L1_88 = A0_87.player_bell_state_trigger
        _pc_state_trigger = L1_88
        L1_88 = A0_87.fi_bell_state_trigger
        _npc_state_trigger = L1_88
        A0_87.fi_ai_pause_flag = false
        L1_88 = _ringout_flag
        if L1_88 == true then
          L1_88 = Sound
          L1_88 = L1_88.playSE
          L1_88(L1_88, "ep04_bell_fall", 1)
          L1_88 = _ringout_object
          L1_88 = L1_88.getName
          L1_88 = L1_88(L1_88)
          if L1_88 == "player" then
            _pc_bell_cnt = _pc_bell_cnt - 1
          else
            _fi_bell_cnt = _fi_bell_cnt - 1
          end
          A0_87.fi_ai_pause_flag = true
          if _fi_bell_cnt <= 0 or _pc_bell_cnt <= 0 then
            _phase_end = true
          end
          fn_halfTime()
        else
          L1_88 = _pc_hp_old
          if L1_88 > _pc_hp then
            L1_88 = _pc_state
            if L1_88 == "equip" then
              L1_88 = _npc_state
              if L1_88 == "equip" then
                L1_88 = _scoreUI
                L1_88 = L1_88.updatepc
                L1_88(-1 * (_pc_hp_old - _pc_hp), 1)
                L1_88 = _scoreUI
                L1_88 = L1_88.updatenpc
                L1_88(_pc_hp_old - _pc_hp, 1)
                L1_88 = _scoreUI
                L1_88 = L1_88.getBoarackPoint
                L1_88 = L1_88()
                A0_87.boarack_point = L1_88
              end
            end
            L1_88 = Player
            L1_88 = L1_88.getEnergyMax
            L1_88 = L1_88(L1_88, Player.kEnergy_Life)
            Player:setEnergy(Player.kEnergy_Life, L1_88)
          end
          L1_88 = A0_87.player_bell_state_trigger
          if L1_88 == "drop" then
            L1_88 = Sound
            L1_88 = L1_88.playSE
            L1_88(L1_88, "ep04_bell_fall", 1)
            L1_88 = Fn_missionView
            L1_88("ep04_01000")
          end
          L1_88 = A0_87.player_bell_state_trigger
          if L1_88 == "equip" then
            L1_88 = _scoreUI
            L1_88 = L1_88.updatepc
            L1_88(_scoreUI.max[1] * 0.1, 1)
            L1_88 = _scoreUI
            L1_88 = L1_88.updatenpc
            L1_88(_scoreUI.max[1] * -0.1, 1)
            L1_88 = _scoreUI
            L1_88 = L1_88.getBoarackPoint
            L1_88 = L1_88()
            A0_87.boarack_point = L1_88
            L1_88 = Sound
            L1_88 = L1_88.playSE
            L1_88(L1_88, "ep04_bell_fall", 1)
            L1_88 = Fn_missionViewEnd
            L1_88()
          end
          L1_88 = A0_87.player_bell_state_trigger
          if L1_88 == "steal" then
            L1_88 = _pc_bell_cnt
            L1_88 = L1_88 - 1
            _pc_bell_cnt = L1_88
            L1_88 = Sound
            L1_88 = L1_88.playSE
            L1_88(L1_88, "ep04_bell_fall", 1)
            L1_88 = Fn_userCtrlAllOff
            L1_88()
            L1_88 = Fn_missionViewEnd
            L1_88()
            L1_88 = fn_halfTime
            L1_88()
          end
          L1_88 = _pc_bell_cnt
          A0_87.bellcount_player = L1_88
          L1_88 = _npc_hp_old
          if L1_88 > _npc_hp then
            L1_88 = _pc_state
            if L1_88 == "equip" then
              L1_88 = _npc_state
              if L1_88 == "equip" then
                L1_88 = _scoreUI
                L1_88 = L1_88.updatepc
                L1_88(_npc_hp_old - _npc_hp, 1)
                L1_88 = _scoreUI
                L1_88 = L1_88.updatenpc
                L1_88(-1 * (_npc_hp_old - _npc_hp), 1)
                L1_88 = _scoreUI
                L1_88 = L1_88.getBoarackPoint
                L1_88 = L1_88()
                A0_87.boarack_point = L1_88
              end
            end
          end
          L1_88 = A0_87.fi_bell_state_trigger
          if L1_88 == "drop" then
            L1_88 = Sound
            L1_88 = L1_88.playSE
            L1_88(L1_88, "ep04_bell_fall", 1)
            L1_88 = Fn_missionView
            L1_88("ep04_01000")
          end
          L1_88 = A0_87.fi_bell_state_trigger
          if L1_88 == "equip" then
            L1_88 = _scoreUI
            L1_88 = L1_88.updatepc
            L1_88(_scoreUI.max[1] * -0.1, 1)
            L1_88 = _scoreUI
            L1_88 = L1_88.updatenpc
            L1_88(_scoreUI.max[1] * 0.1, 1)
            L1_88 = _scoreUI
            L1_88 = L1_88.getBoarackPoint
            L1_88 = L1_88()
            A0_87.boarack_point = L1_88
            L1_88 = Sound
            L1_88 = L1_88.playSE
            L1_88(L1_88, "ep04_bell_fall", 1)
            L1_88 = Fn_missionViewEnd
            L1_88()
          end
          L1_88 = A0_87.fi_bell_state_trigger
          if L1_88 == "steal" then
            L1_88 = _fi_bell_cnt
            L1_88 = L1_88 - 1
            _fi_bell_cnt = L1_88
            L1_88 = Sound
            L1_88 = L1_88.playSE
            L1_88(L1_88, "ep04_bell_fall", 1)
            L1_88 = invokeTask
            L1_88(function()
              waitSeconds(1.16)
              Sound:playSE("ene_fi_vo_die", 1, nil, findGameObject2("Puppet", "fi_01"))
            end)
            L1_88 = Fn_userCtrlAllOff
            L1_88()
            L1_88 = Fn_missionViewEnd
            L1_88()
            L1_88 = fn_halfTime
            L1_88()
          end
          L1_88 = _fi_bell_cnt
          A0_87.bellcount_fi = L1_88
          L1_88 = _fi_bell_cnt
          if not (L1_88 <= 0) then
            L1_88 = _pc_bell_cnt
          elseif L1_88 <= 0 then
            _phase_end = true
          end
          L1_88 = _phase_end
          if L1_88 ~= true then
            L1_88 = _harf_time_flag
          elseif L1_88 == true then
            A0_87.fi_ai_pause_flag = true
          end
        end
      end
    else
      A0_87.fi_ai_pause_flag = true
    end
    L1_88 = _boarack_reset_request
    if true == L1_88 then
      A0_87.boarack_reset_flag = true
      _boarack_reset_request = false
    end
    return A0_87
  end
  findGameObject2("EnemyBrain", "fi_01"):setEventListener("boss_fi_BoarackJudgeReport", L0_86)
end
function KitWinSe()
  local L0_89, L1_90
end
function KitLoseSe()
  local L0_91, L1_92
end
