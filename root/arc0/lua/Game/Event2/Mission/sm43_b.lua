dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppets = {}
enemy_gen = {}
sdemo = nil
pond_height_node = nil
SM43_SDEMO_EPILOGUE_MAN52_MOTION = {
  sm43_sdemo_02 = "man52_fee_00"
}
enmgen2_fi_battle_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator2_fi_battle_01",
      name = "fi_01",
      ai_spawn_option = "Fi/fi_sm43_b"
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
    local L3_10
    L3_10 = enmgen2_fi_battle_01
    L3_10.enemyDeadNum = enmgen2_fi_battle_01.enemyDeadNum + 1
    phase_end = true
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_11, L1_12
    L0_11 = enmgen2_fi_battle_01
    L0_11 = L0_11.spawnSet
    L0_11 = #L0_11
    return L0_11
  end,
  getEnemyDeadNum = function()
    local L1_13
    L1_13 = enmgen2_fi_battle_01
    L1_13 = L1_13.enemyDeadNum
    return L1_13
  end,
  getEnemyName = function(A0_14)
    local L1_15
    L1_15 = enmgen2_fi_battle_01
    L1_15 = L1_15.spawnSet
    L1_15 = L1_15[A0_14]
    L1_15 = L1_15.name
    return L1_15
  end
}
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
_sm31_flag_info_saw = false
_test_flg_col_on = false
_ui_visible_task = nil
_boarack_reset_request = false
_scoreUI = {}
_ScoreUI_Class = {}
function _ScoreUI_Class.new()
  local L0_16, L1_17
  L0_16 = {}
  L0_16.reset_score = false
  L1_17 = {
    1000,
    1000,
    1000
  }
  L0_16.max = L1_17
  L1_17 = L0_16.max
  L1_17 = L1_17[1]
  L1_17 = L1_17 / 2
  L0_16.pc = L1_17
  L1_17 = L0_16.max
  L1_17 = L1_17[1]
  L1_17 = L1_17 / 2
  L0_16.npc = L1_17
  L0_16.visible = true
  L0_16.ex = 1
  L1_17 = _scoreUI
  L1_17.pc_bell_anime_on = false
  L1_17 = _scoreUI
  L1_17.npc_bell_anime_on = false
  L0_16.old_gage_val = 0
  L0_16.old_bel_pc_num = -1
  L0_16.old_bel_npc_num = -1
  function L1_17()
    HUD:captureFlagOpen()
    HUD:captureFlagInitGauge(500, 250)
    if L0_16.visible == false then
      HUD:captureFlagClose(false)
    end
  end
  L0_16.initUi = L1_17
  function L1_17(A0_18)
    local L1_19, L2_20, L4_21, L5_22, L6_23
    L1_19 = L0_16.max
    for L6_23 = 1, #L4_21 do
      L0_16.max[L6_23] = A0_18
      L0_16.pc = L0_16.max[L6_23] / 2
      L0_16.npc = L0_16.max[L6_23] / 2
    end
  end
  L0_16.init = L1_17
  function L1_17(A0_24)
    local L1_25
    L1_25 = L0_16.max
    L1_25 = L1_25[A0_24]
    L1_25 = L1_25 / 2
    L0_16.pc = L1_25
    L1_25 = L0_16.max
    L1_25 = L1_25[A0_24]
    L1_25 = L1_25 / 2
    L0_16.npc = L1_25
    L0_16.reset_score = true
  end
  L0_16.reset = L1_17
  function L1_17()
    local L0_26
    L0_26 = L0_16.visible
    if L0_26 == true then
      L0_26 = _phase_end
      if L0_26 == false then
        L0_26 = L0_16.old_gage_val
        if L0_26 ~= L0_16.pc then
          L0_26 = L0_16.pc
          if L0_16.reset_score == false then
            HUD:captureFlagChangeGauge(L0_26, 0.16)
          else
            HUD:captureFlagChangeGauge(L0_26, 0)
          end
          L0_16.old_gage_val = L0_26
        end
        L0_26 = L0_16.old_bel_pc_num
        if L0_26 ~= _pc_bell_cnt then
          L0_26 = _pc_bell_cnt
          L0_26 = L0_26 - L0_16.old_bel_pc_num
          if L0_26 ~= 0 then
            if L0_26 > 0 then
              HUD:captureFlagAddBell(HUD.kBell_Left)
              L0_16.old_bel_pc_num = L0_16.old_bel_pc_num + 1
            else
              HUD:captureFlagRemoveBell(HUD.kBell_Left)
              L0_16.old_bel_pc_num = L0_16.old_bel_pc_num - 1
            end
          end
        end
        L0_26 = L0_16.reset_score
        if L0_26 == false then
          L0_26 = _scoreUI
          L0_26 = L0_26.pc_bell_anime_on
          if L0_26 == true then
            L0_26 = _scoreUI
            L0_26.pc_bell_anime_on = false
            L0_26 = HUD
            L0_26 = L0_26.captureFlagStopBlink
            L0_26(L0_26, HUD.kBell_Left)
          end
        else
          L0_26 = _scoreUI
          L0_26 = L0_26.pc_bell_anime_on
          if L0_26 == true then
            L0_26 = _pc_state
            if L0_26 ~= "equip" then
              L0_26 = _pc_state
              if L0_26 ~= "steal" then
                L0_26 = _pc_state
              end
            elseif L0_26 == "non" then
              L0_26 = _scoreUI
              L0_26.pc_bell_anime_on = false
              L0_26 = HUD
              L0_26 = L0_26.captureFlagStopBlink
              L0_26(L0_26, HUD.kBell_Left)
            end
          else
            L0_26 = _pc_state
            if L0_26 == "drop" then
              L0_26 = _scoreUI
              L0_26.pc_bell_anime_on = true
              L0_26 = HUD
              L0_26 = L0_26.captureFlagPlayBlink
              L0_26(L0_26, HUD.kBell_Left)
            end
          end
        end
        L0_26 = L0_16.old_bel_npc_num
        if L0_26 ~= _fi_bell_cnt then
          L0_26 = _fi_bell_cnt
          L0_26 = L0_26 - L0_16.old_bel_npc_num
          if L0_26 ~= 0 then
            if L0_26 > 0 then
              HUD:captureFlagAddBell(HUD.kBell_Right)
              L0_16.old_bel_npc_num = L0_16.old_bel_npc_num + 1
            else
              HUD:captureFlagRemoveBell(HUD.kBell_Right)
              L0_16.old_bel_npc_num = L0_16.old_bel_npc_num - 1
            end
          end
        end
        L0_26 = L0_16.reset_score
        if L0_26 == false then
          L0_26 = _scoreUI
          L0_26 = L0_26.npc_bell_anime_on
          if L0_26 == true then
            L0_26 = HUD
            L0_26 = L0_26.captureFlagStopBlink
            L0_26(L0_26, HUD.kBell_Right)
            L0_26 = _scoreUI
            L0_26.npc_bell_anime_on = false
          end
        else
          L0_26 = _scoreUI
          L0_26 = L0_26.npc_bell_anime_on
          if L0_26 then
            L0_26 = _npc_state
            if L0_26 ~= "equip" then
              L0_26 = _npc_state
              if L0_26 ~= "steal" then
                L0_26 = _npc_state
              end
            elseif L0_26 == "non" then
              L0_26 = _scoreUI
              L0_26.npc_bell_anime_on = false
              L0_26 = HUD
              L0_26 = L0_26.captureFlagStopBlink
              L0_26(L0_26, HUD.kBell_Right)
            end
          else
            L0_26 = _npc_state
            if L0_26 == "drop" then
              L0_26 = _scoreUI
              L0_26.npc_bell_anime_on = true
              L0_26 = HUD
              L0_26 = L0_26.captureFlagPlayBlink
              L0_26(L0_26, HUD.kBell_Right)
            end
          end
        end
        L0_26 = setDebugDispMissionText
        L0_26("kitten\239\188\154" .. string.format("%02d", L0_16.pc) .. " / " .. string.format("%02d", L0_16.npc) .. "\239\188\154phi")
        L0_16.reset_score = false
      end
    end
  end
  L0_16.view = L1_17
  function L1_17()
    L0_16.visible = false
    HUD:captureFlagClose(false)
  end
  L0_16.off = L1_17
  function L1_17()
    L0_16.visible = true
    HUD:captureFlagOpen()
  end
  L0_16.on = L1_17
  function L1_17(A0_27, A1_28)
    local L2_29, L3_30
    L2_29 = L0_16.pc
    L3_30 = L0_16.ex
    L3_30 = A0_27 * L3_30
    L2_29 = L2_29 + L3_30
    L0_16.pc = L2_29
    L2_29 = L0_16.pc
    L3_30 = L0_16.max
    L3_30 = L3_30[A1_28]
    if L2_29 > L3_30 then
      L2_29 = L0_16.max
      L2_29 = L2_29[A1_28]
      L0_16.pc = L2_29
    end
    L2_29 = L0_16.pc
    if L2_29 < 0 then
      L0_16.pc = 0
    end
  end
  L0_16.updatepc = L1_17
  function L1_17(A0_31, A1_32)
    local L2_33, L3_34
    L2_33 = L0_16.npc
    L3_34 = L0_16.ex
    L3_34 = A0_31 * L3_34
    L2_33 = L2_33 + L3_34
    L0_16.npc = L2_33
    L2_33 = L0_16.npc
    L3_34 = L0_16.max
    L3_34 = L3_34[A1_32]
    if L2_33 > L3_34 then
      L2_33 = L0_16.max
      L2_33 = L2_33[A1_32]
      L0_16.npc = L2_33
    end
    L2_33 = L0_16.npc
    if L2_33 < 0 then
      L0_16.npc = 0
    end
  end
  L0_16.updatenpc = L1_17
  function L1_17(A0_35)
    local L1_36, L2_37
    L1_36 = L0_16.max
    L1_36 = L1_36[A0_35]
    L2_37 = L0_16.pc
    if not (L1_36 <= L2_37) then
      L1_36 = L0_16.max
      L1_36 = L1_36[A0_35]
      L2_37 = L0_16.npc
    else
      if L1_36 <= L2_37 then
        L1_36 = false
        return L1_36
    end
    else
      L1_36 = true
      return L1_36
    end
  end
  L0_16.check = L1_17
  function L1_17()
    HUD:captureFlagClose(true)
  end
  L0_16.Delete = L1_17
  return L0_16
end
function Initialize()
  local L0_38
  L0_38 = {
    {
      name = "npc_dus_01",
      type = "dus01",
      node = "locator2_dus_01"
    }
  }
  Fn_setupNpc(L0_38)
  for _FORV_4_, _FORV_5_ in pairs(L0_38) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _scoreUI = _ScoreUI_Class.new()
  _scoreUI.init(END_SCORE)
  Fn_userCtrlAllOff()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint(nil)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Fn_setCatActive(false)
  _demo01_cut01 = SDemo.create("demo01_cut01")
  _demo01_cut02 = SDemo.create("demo01_cut02")
  _demo01_cut03 = SDemo.create("demo01_cut03")
  _savedata_vars = GameDatabase:get({
    ggd.GlobalSystemFlags__GameRetry,
    ggd.EventFlags__sm43__flag04
  })
  SetActiveClientStudent(false)
  Fn_pcSensorOff("pccubesensormulti2_outside_01")
  Fn_userCtrlAllOff()
  pond_height_node = findGameObject2("Node", "locator2_pond_height")
  Player:setNoDeathMode(true)
end
function Ingame()
  local L0_39, L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50
  L0_39 = nil
  L1_40 = findGameObject2
  L2_41 = "EnemyBrain"
  L3_42 = "fi_01"
  L1_40 = L1_40(L2_41, L3_42)
  L0_39 = L1_40
  L1_40 = findGameObject2
  L2_41 = "EnemyGenerator"
  L3_42 = "enmgen2_fi_battle_01"
  L1_40 = L1_40(L2_41, L3_42)
  L2_41 = Player
  L3_42 = L2_41
  L2_41 = L2_41.setAttrTune
  L4_43 = Player
  L4_43 = L4_43.kAttrTune_Normal
  L2_41(L3_42, L4_43)
  L2_41 = Fn_setCatActive
  L3_42 = false
  L2_41(L3_42)
  L2_41 = GameDatabase
  L3_42 = L2_41
  L2_41 = L2_41.set
  L4_43 = ggd
  L4_43 = L4_43.GlobalSystemFlags__Gauge
  L5_44 = false
  L2_41(L3_42, L4_43, L5_44)
  L3_42 = L1_40
  L2_41 = L1_40.setEnemyMarker
  L4_43 = false
  L2_41(L3_42, L4_43)
  L2_41 = Fn_userCtrlAllOff
  L2_41()
  L2_41 = Fn_coercionPoseBattle
  L2_41()
  L2_41 = Fn_missionStart
  L2_41()
  L2_41 = Fn_missionView
  L3_42 = "sm43_01000"
  L2_41(L3_42)
  L3_42 = L0_39
  L2_41 = L0_39.playMotion
  L4_43 = "phi01_fee_00"
  L2_41(L3_42, L4_43)
  L2_41 = wait
  L3_42 = 40
  L2_41(L3_42)
  while true do
    L3_42 = L0_39
    L2_41 = L0_39.isMotionEnd
    L2_41 = L2_41(L3_42)
    if L2_41 == false then
      L2_41 = wait
      L2_41()
    end
  end
  L3_42 = L0_39
  L2_41 = L0_39.endScriptAction
  L2_41(L3_42)
  L2_41 = Fn_captionView
  L3_42 = "sm43_01001"
  L2_41(L3_42)
  L2_41 = Sound
  L3_42 = L2_41
  L2_41 = L2_41.pulse
  L4_43 = "m13_003"
  L2_41(L3_42, L4_43)
  L2_41 = waitSeconds
  L3_42 = 0.5
  L2_41(L3_42)
  L2_41 = Sound
  L3_42 = L2_41
  L2_41 = L2_41.playSE
  L4_43 = "ep04_flag_battle_start"
  L5_44 = 1
  L2_41(L3_42, L4_43, L5_44)
  L2_41 = waitSeconds
  L3_42 = 0.5
  L2_41(L3_42)
  pause_flag = false
  L2_41 = invokeTask
  function L3_42()
    waitSeconds(2)
    _scoreUI.initUi()
    while _scoreUI and _phase_end == false do
      _scoreUI.view()
      wait()
    end
    _scoreUI.Delete()
  end
  L2_41 = L2_41(L3_42)
  _ui_visible_task = L2_41
  L2_41 = Fn_pcSensorOn
  L3_42 = "pccubesensormulti2_outside_01"
  L2_41(L3_42)
  L2_41 = Fn_userCtrlOn
  L2_41()
  L2_41 = fn_boarackJudgeReport
  L2_41()
  L3_42 = L1_40
  L2_41 = L1_40.setEnemyMarker
  L4_43 = true
  L2_41(L3_42, L4_43)
  L2_41 = Fn_userCtrlOn
  L2_41()
  L2_41 = Fn_sensorOn
  L3_42 = "cubesensor2_pond"
  L2_41(L3_42)
  while true do
    L2_41 = _phase_end
    if L2_41 == false then
      L2_41 = wait
      L2_41()
    end
  end
  L2_41 = Fn_userCtrlAllOff
  L2_41()
  L2_41 = Fn_coercionPoseNomal
  L2_41()
  L2_41 = Sound
  L3_42 = L2_41
  L2_41 = L2_41.pulse
  L4_43 = "m13_004"
  L2_41(L3_42, L4_43)
  L2_41 = Fn_captionViewWait
  L3_42 = "sm43_01002"
  L2_41(L3_42)
  L2_41 = Sound
  L3_42 = L2_41
  L2_41 = L2_41.playSE
  L4_43 = "ep04_flag_battle_start"
  L5_44 = 1
  L2_41(L3_42, L4_43, L5_44)
  L2_41 = _pc_bell_cnt
  L3_42 = _fi_bell_cnt
  if L2_41 >= L3_42 then
    L2_41 = Fn_blackout
    L2_41()
    L2_41 = Fn_resetPcPos
    L3_42 = "locator2_pc_ep_pos"
    L2_41(L3_42)
    L2_41 = Fn_setCatActive
    L3_42 = true
    L2_41(L3_42)
    L2_41 = Fn_setNpcActive
    L3_42 = "npc_dus_01"
    L4_43 = false
    L2_41(L3_42, L4_43)
    L2_41 = Fn_disappearNpc
    L3_42 = "npc_dus_01"
    L2_41(L3_42)
    L2_41 = findGameObject2
    L3_42 = "Puppet"
    L4_43 = "fi_01"
    L2_41 = L2_41(L3_42, L4_43)
    L4_43 = L2_41
    L3_42 = L2_41.try_term
    L3_42(L4_43)
    L2_41 = nil
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_client"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_02"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_03"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_04"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_05"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_06"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_07"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = Fn_setNpcActive
    L4_43 = "sm43_student_08"
    L5_44 = true
    L3_42(L4_43, L5_44)
    L3_42 = "sm43_client"
    L4_43 = Fn_findNpcPuppet
    L5_44 = L3_42
    L4_43 = L4_43(L5_44)
    L5_44 = Fn_warpNpc
    L5_44(L6_45, L7_46)
    L5_44 = nil
    for L9_48 = 1, 8 do
      L10_49 = string
      L10_49 = L10_49.format
      L11_50 = "sm43_student_%02d"
      L10_49 = L10_49(L11_50, L9_48)
      L3_42 = L10_49
      L10_49 = Fn_setNpcActive
      L11_50 = L3_42
      L10_49(L11_50, true)
      L10_49 = Fn_warpNpc
      L11_50 = L3_42
      L10_49(L11_50, string.format("locator2_ep_student_%02d", L9_48))
      L10_49 = Fn_findNpcPuppet
      L11_50 = L3_42
      L10_49 = L10_49(L11_50)
      L4_43 = L10_49
      L10_49 = Fn_loadNpcEventMotion
      L11_50 = L3_42
      L10_49(L11_50, SM43_SDEMO_EPILOGUE_MAN52_MOTION)
    end
    L6_45()
    L6_45(L7_46)
    L6_45(L7_46)
    L6_45(L7_46)
    L10_49 = 4
    L11_50 = 5
    for L10_49 = 1, #L6_45 do
      L11_50 = RandI
      L11_50 = L11_50(1, #L6_45)
      L11_50 = L11_50 % (#L6_45 + 1)
      L6_45[L11_50], L6_45[L10_49] = L6_45[L10_49], L6_45[L11_50]
    end
    for L10_49, L11_50 in L7_46(L8_47) do
      L3_42 = string.format("sm43_student_%02d", L11_50)
      print(L3_42)
      invokeTask(function()
        Fn_playMotionNpc(L3_42, SM43_SDEMO_EPILOGUE_MAN52_MOTION.sm43_sdemo_02, true, {animBlendDuration = 0.5, isStop = true})
        Fn_playMotionNpc(L3_42, "stay", false, {animBlendDuration = 0.5})
      end)
      waitSeconds(0.1)
    end
    L10_49 = true
    L11_50 = {}
    L11_50.animBlendDuration = 0.5
    L11_50.isStop = true
    L7_46(L8_47, L9_48, L10_49, L11_50)
    L10_49 = false
    L11_50 = {}
    L11_50.animBlendDuration = 0.5
    L7_46(L8_47, L9_48, L10_49, L11_50)
    L7_46(L8_47)
    L7_46()
    L7_46(L8_47)
    L7_46()
    L7_46()
    L7_46()
    L7_46()
    L7_46()
    break
  else
    L2_41 = mission_retry
    L2_41()
  end
end
function Finalize()
  Player:setNoDeathMode(false)
  if _scoreUI ~= nil then
    _scoreUI.Delete()
  end
  if _ui_visible_task ~= nil then
    _ui_visible_task:abort()
    _ui_visible_task = nil
  end
  GameDatabase:set(ggd.GlobalSystemFlags__Gauge, true)
  _scoreUI = nil
  Fn_setCatActive(true)
  Fn_userCtrlOn()
end
function pccubesensormulti2_outside_01_OnEnter()
  local L0_51, L1_52
  vol_stage_outside = false
end
function pccubesensormulti2_outside_01_OnLeave(A0_53, A1_54)
  print("spher_sensor_out")
  if _ringout_flag == false then
    fn_lingout(A0_53, A1_54:getName())
  end
end
function pccubesensor2_pond_OnEnter(A0_55, A1_56)
  local L3_57
  L3_57 = _ringout_flag
  if L3_57 == false then
    L3_57 = fn_lingout
    L3_57(A0_55, A1_56:getName())
  end
end
function cubesensor2_pond_OnEnter(A0_58, A1_59)
  local L2_60
  L2_60 = print
  L2_60("sensor_in")
  L2_60 = A1_59.getWorldPos
  L2_60 = L2_60(A1_59)
  invokeTask(function()
    if _ringout_flag == false then
      L2_60.y = pond_height_node:getWorldPos().y
      Sound:playSE("ene_human_fall_water", 1, "", RAC_createEffectReadyWait({
        eff_name = "ef_com_wtr_07",
        world_pos = L2_60
      }):getPosNode())
      fn_lingout(A0_58, A1_59:getName())
    end
  end)
end
function cubesensor2_pond_OnLeave()
  print("sensor_out")
end
function create_collision(A0_61, A1_62)
  local L2_63
  L2_63 = createGameObject2
  L2_63 = L2_63("GimmickBg")
  A1_62:appendChild(L2_63)
  L2_63:setName(A0_61)
  L2_63:setCollisionName("sm43_col")
  L2_63:setAttributeName("invisible_col")
  L2_63:try_init()
  L2_63:waitForReady()
  L2_63:try_start()
end
function fn_lingout(A0_64, A1_65)
  local L2_66
  if A1_65 == "player" or A1_65 == "fi_01" then
    L2_66 = _ringout_flag
    if L2_66 == false then
      L2_66 = _harf_time_flag
      if L2_66 == false then
        _ringout_flag = true
        _ringout_object = A1_65
      end
    end
  end
end
function fn_halfTime()
  if _harf_time_flag == false then
    _harf_time_flag = true
    Fn_userCtrlAllOff()
    invokeTask(function()
      local L0_67
      L0_67 = Fn_sensorOff
      L0_67("cubesensor2_pond")
      L0_67 = _pc_bell_cnt
      if not (L0_67 <= 0) then
        L0_67 = _fi_bell_cnt
        if not (L0_67 <= 0) then
          L0_67 = waitSeconds
          L0_67(4)
          L0_67 = Fn_blackout
          L0_67()
          L0_67 = _scoreUI
          L0_67 = L0_67.reset
          L0_67(1)
          L0_67 = Fn_resetPcPos
          L0_67("locator2_pc_start_pos")
          L0_67 = findGameObject2
          L0_67 = L0_67("EnemyBrain", "fi_01")
          L0_67:reset(get_gameobj_node_world_pos_rot("locator2_fi_battle_01"))
          _boarack_reset_request = true
          wait(10)
          Fn_fadein()
          invokeTask(function()
            L0_67 = findGameObject2("EnemyBrain", "fi_01")
            if L0_67 ~= nil then
              L0_67:playMotion("phi01_fee_00")
              while L0_67:isMotionEnd() == false do
                wait()
              end
              L0_67:endScriptAction()
            end
          end)
          wait(70)
          Fn_sensorOn("cubesensor2_pond")
          Fn_captionViewEnd()
          Fn_captionView("sm43_01003")
          Sound:pulse("m13_003")
          waitSeconds(0.5)
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
  local L0_68
  L0_68 = Player
  L0_68 = L0_68.getEnergyMax
  L0_68 = L0_68(L0_68, Player.kEnergy_Life)
  _pc_hp = L0_68
  L0_68 = _pc_hp
  _pc_hp_old = L0_68
  function L0_68(A0_69)
    local L1_70
    L1_70 = _phase_end
    if L1_70 == false then
      L1_70 = _harf_time_flag
      if L1_70 == false then
        L1_70 = _pc_hp
        _pc_hp_old = L1_70
        L1_70 = _pc_hp
        L1_70 = L1_70 - Player:getLastFrameDamagePoint()
        _pc_hp = L1_70
        L1_70 = _npc_hp
        _npc_hp_old = L1_70
        L1_70 = A0_69.fi_hp
        _npc_hp = L1_70
        L1_70 = _pc_state
        _pc_state_old = L1_70
        L1_70 = A0_69.player_bell_state
        _pc_state = L1_70
        L1_70 = _npc_state
        _npc_state_old = L1_70
        L1_70 = A0_69.fi_bell_state
        _npc_state = L1_70
        L1_70 = A0_69.player_bell_state_trigger
        _pc_state_trigger = L1_70
        L1_70 = A0_69.fi_bell_state_trigger
        _npc_state_trigger = L1_70
        A0_69.fi_ai_pause_flag = false
        L1_70 = _ringout_flag
        if L1_70 == true then
          L1_70 = Sound
          L1_70 = L1_70.playSE
          L1_70(L1_70, "ep04_bell_fall", 1)
          L1_70 = print
          L1_70("gameobj name " .. _ringout_object)
          L1_70 = _ringout_object
          if L1_70 == "player" then
            L1_70 = _pc_bell_cnt
            L1_70 = L1_70 - 1
            _pc_bell_cnt = L1_70
          else
            L1_70 = _fi_bell_cnt
            L1_70 = L1_70 - 1
            _fi_bell_cnt = L1_70
          end
          A0_69.fi_ai_pause_flag = true
          L1_70 = _fi_bell_cnt
          if not (L1_70 <= 0) then
            L1_70 = _pc_bell_cnt
          elseif L1_70 <= 0 then
            _phase_end = true
          end
          L1_70 = fn_halfTime
          L1_70()
        else
          L1_70 = _pc_hp_old
          if L1_70 > _pc_hp then
            L1_70 = _pc_state
            if L1_70 == "equip" then
              L1_70 = _npc_state
              if L1_70 == "equip" then
                L1_70 = _scoreUI
                L1_70 = L1_70.updatepc
                L1_70(-1 * (_pc_hp_old - _pc_hp), 1)
                L1_70 = _scoreUI
                L1_70 = L1_70.updatenpc
                L1_70(_pc_hp_old - _pc_hp, 1)
                L1_70 = _scoreUI
                L1_70 = L1_70.npc
                L1_70 = L1_70 - _scoreUI.pc
                L1_70 = L1_70 * 2
                L1_70 = L1_70 * 0.001
                A0_69.boarack_point = L1_70
              end
            end
            L1_70 = Player
            L1_70 = L1_70.getEnergyMax
            L1_70 = L1_70(L1_70, Player.kEnergy_Life)
            Player:setEnergy(Player.kEnergy_Life, L1_70)
          end
          L1_70 = A0_69.player_bell_state_trigger
          if L1_70 == "drop" then
            L1_70 = Sound
            L1_70 = L1_70.playSE
            L1_70(L1_70, "ep04_bell_fall", 1)
          end
          L1_70 = A0_69.player_bell_state_trigger
          if L1_70 == "equip" then
            L1_70 = _scoreUI
            L1_70 = L1_70.updatepc
            L1_70(_scoreUI.max[1] * 0.1, 1)
            L1_70 = _scoreUI
            L1_70 = L1_70.updatenpc
            L1_70(_scoreUI.max[1] * -0.1, 1)
            L1_70 = _scoreUI
            L1_70 = L1_70.npc
            L1_70 = L1_70 - _scoreUI.pc
            L1_70 = L1_70 * 2
            L1_70 = L1_70 * 0.001
            A0_69.boarack_point = L1_70
            L1_70 = Sound
            L1_70 = L1_70.playSE
            L1_70(L1_70, "ep04_bell_fall", 1)
          end
          L1_70 = A0_69.player_bell_state_trigger
          if L1_70 == "steal" then
            L1_70 = _pc_bell_cnt
            L1_70 = L1_70 - 1
            _pc_bell_cnt = L1_70
            L1_70 = Sound
            L1_70 = L1_70.playSE
            L1_70(L1_70, "ep04_bell_fall", 1)
            L1_70 = Fn_userCtrlAllOff
            L1_70()
            L1_70 = fn_halfTime
            L1_70()
          end
          L1_70 = _pc_bell_cnt
          A0_69.bellcount_player = L1_70
          L1_70 = _npc_hp_old
          if L1_70 > _npc_hp then
            L1_70 = _pc_state
            if L1_70 == "equip" then
              L1_70 = _npc_state
              if L1_70 == "equip" then
                L1_70 = _scoreUI
                L1_70 = L1_70.updatepc
                L1_70(_npc_hp_old - _npc_hp, 1)
                L1_70 = _scoreUI
                L1_70 = L1_70.updatenpc
                L1_70(-1 * (_npc_hp_old - _npc_hp), 1)
                L1_70 = _scoreUI
                L1_70 = L1_70.npc
                L1_70 = L1_70 - _scoreUI.pc
                L1_70 = L1_70 * 2
                L1_70 = L1_70 * 0.001
                A0_69.boarack_point = L1_70
              end
            end
          end
          L1_70 = A0_69.fi_bell_state_trigger
          if L1_70 == "drop" then
            L1_70 = Sound
            L1_70 = L1_70.playSE
            L1_70(L1_70, "ep04_bell_fall", 1)
          end
          L1_70 = A0_69.fi_bell_state_trigger
          if L1_70 == "equip" then
            L1_70 = _scoreUI
            L1_70 = L1_70.updatepc
            L1_70(_scoreUI.max[1] * -0.1, 1)
            L1_70 = _scoreUI
            L1_70 = L1_70.updatenpc
            L1_70(_scoreUI.max[1] * 0.1, 1)
            L1_70 = _scoreUI
            L1_70 = L1_70.npc
            L1_70 = L1_70 - _scoreUI.pc
            L1_70 = L1_70 * 2
            L1_70 = L1_70 * 0.001
            A0_69.boarack_point = L1_70
            L1_70 = Sound
            L1_70 = L1_70.playSE
            L1_70(L1_70, "ep04_bell_fall", 1)
          end
          L1_70 = A0_69.fi_bell_state_trigger
          if L1_70 == "steal" then
            L1_70 = _fi_bell_cnt
            L1_70 = L1_70 - 1
            _fi_bell_cnt = L1_70
            L1_70 = Sound
            L1_70 = L1_70.playSE
            L1_70(L1_70, "ep04_bell_fall", 1)
            L1_70 = invokeTask
            L1_70(function()
              waitSeconds(1.16)
              Sound:playSE("ene_fi_vo_die", 1, nil, findGameObject2("Puppet", "fi_01"))
            end)
            L1_70 = Fn_userCtrlAllOff
            L1_70()
            L1_70 = fn_halfTime
            L1_70()
          end
          L1_70 = _fi_bell_cnt
          A0_69.bellcount_fi = L1_70
          L1_70 = _fi_bell_cnt
          if not (L1_70 <= 0) then
            L1_70 = _pc_bell_cnt
          elseif L1_70 <= 0 then
            _phase_end = true
          end
          L1_70 = _phase_end
          if L1_70 ~= true then
            L1_70 = _harf_time_flag
          elseif L1_70 == true then
            A0_69.fi_ai_pause_flag = true
          end
        end
      end
    else
      A0_69.fi_ai_pause_flag = true
    end
    L1_70 = _boarack_reset_request
    if true == L1_70 then
      A0_69.boarack_reset_flag = true
      _boarack_reset_request = false
    end
    return A0_69
  end
  findGameObject2("EnemyBrain", "fi_01"):setEventListener("boss_fi_BoarackJudgeReport", L0_68)
end
function SetActiveClientStudent(A0_71)
  Fn_setNpcActive("sm43_client", A0_71)
  Fn_setNpcActive("sm43_student_01", A0_71)
  Fn_setNpcActive("sm43_student_02", A0_71)
  Fn_setNpcActive("sm43_student_03", A0_71)
  Fn_setNpcActive("sm43_student_04", A0_71)
  Fn_setNpcActive("sm43_student_05", A0_71)
  Fn_setNpcActive("sm43_student_06", A0_71)
  Fn_setNpcActive("sm43_student_07", A0_71)
  Fn_setNpcActive("sm43_student_08", A0_71)
end
