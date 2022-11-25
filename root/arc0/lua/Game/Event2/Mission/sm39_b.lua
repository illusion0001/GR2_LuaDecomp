dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Mission/sm39_common.lua")
import("Vehicle")
ENMGEN_NAME_FORMAT = "enmgen2_scene1_%02d"
ENEMY_NPC_NAME_FORMAT = "sm39_scene1_enemy_%02d_%02d"
ENEMY_MOVE_PREFIX_FORMAT = "locator2_scene1_enemy_%02d_%02d_move_"
BATTLE_OUT_SENSOR_NAME_FORMAT = "pccubesensor2_scene1_battle_out_%02d"
BATTLE_ENM_OUT_SENSOR_NAME_FORMAT = "cubesensor2_scene1_battle_enm_out_%02d"
_player_motion_table = {
  glad_in_01 = "kit01_glad_in_01",
  glad_01 = "kit01_glad_01"
}
_extra_woman_motion_table = {
  scared_nevy_00 = "wom01_scared_nevy_00",
  groggy_01 = "wom01_groggy_01"
}
_extra_man_motion_table = {
  scared_00 = "man01_scared_00"
}
_staff_bg_tbl = {}
_enemy_puppet_tbl = {}
_staff_box_tbl = {}
_extra_escape_task = {}
_is_in_sensor = false
_is_out_of_range = false
_is_out_of_range2 = false
_sdemo = nil
enmgen2_scene1_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  dead_count = 0,
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectAsh = function(A0_6, A1_7)
    A0_6:getSpecTable().dead_count = A0_6:getSpecTable().dead_count + 1
  end,
  onObjectDead = function(A0_8, A1_9)
  end
}
enmgen2_scene1_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  dead_count = 0,
  onUpdate = function(A0_10)
    local L1_11
  end,
  onEnter = function(A0_12)
    local L1_13
  end,
  onLeave = function(A0_14)
    local L1_15
  end,
  onObjectAsh = function(A0_16, A1_17)
    A0_16:getSpecTable().dead_count = A0_16:getSpecTable().dead_count + 1
  end,
  onObjectDead = function(A0_18, A1_19)
  end
}
function Initialize()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26
  L0_20 = {
    L1_21,
    L2_22,
    L3_23,
    L4_24,
    L5_25,
    L6_26,
    {
      name = "sm39_extra_escape_01",
      type = "man07",
      node = "locator2_extra_escape_01",
      active = false
    },
    {
      name = "sm39_extra_escape_02",
      type = "man02",
      node = "locator2_extra_escape_02",
      active = false
    },
    {
      name = "sm39_extra_escape_03",
      type = "man05",
      node = "locator2_extra_escape_03",
      active = false
    }
  }
  L1_21.name = "sm39_director_01"
  L1_21.type = "man18"
  L1_21.node = "locator2_director_01"
  L1_21.active = false
  L2_22.name = "sm39_assistant_01"
  L2_22.type = "man17"
  L2_22.node = "locator2_assistant_01"
  L2_22.active = false
  L3_23.name = "sm39_assi_wom_01"
  L3_23.type = "wom01"
  L3_23.node = "locator2_assi_wom_01"
  L3_23.active = false
  L4_24.name = "sm39_extra_01"
  L4_24.type = "man10"
  L4_24.node = "locator2_extra_01"
  L4_24.active = true
  L5_25 = {}
  L5_25.name = "sm39_extra_02"
  L5_25.type = "wom03"
  L5_25.node = "locator2_extra_02"
  L5_25.active = true
  L6_26 = {}
  L6_26.name = "sm39_extra_03"
  L6_26.type = "wom04"
  L6_26.node = "locator2_extra_03"
  L6_26.active = true
  L1_21(L2_22)
  L1_21(L2_22, L3_23)
  L1_21(L2_22, L3_23)
  L1_21(L2_22, L3_23)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  for L4_24 = 30, 41 do
    L5_25 = Fn_pcSensorOff
    L6_26 = "pcspheresensor2_scene1_bombing_"
    L6_26 = L6_26 .. string.format("%2d", L4_24)
    L5_25(L6_26)
  end
  for L4_24 = 60, 80 do
    L5_25 = Fn_pcSensorOff
    L6_26 = "pcspheresensor2_scene1_bombing_"
    L6_26 = L6_26 .. string.format("%2d", L4_24)
    L5_25(L6_26)
  end
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  L1_21(L2_22)
  for L5_25, L6_26 in L2_22(L3_23) do
    if findGameObject2("GimmickBg", L6_26) ~= nil then
      findGameObject2("GimmickBg", L6_26):setVisiblePermission(false)
      _staff_bg_tbl[L6_26] = findGameObject2("GimmickBg", L6_26)
    end
  end
  _sdemo = L2_22
  L2_22(L3_23)
  L2_22(L3_23)
  L2_22(L3_23, L4_24)
end
function Ingame()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34
  L0_27 = Fn_userCtrlOff
  L0_27()
  L0_27 = Fn_disableCostumeChange
  L1_28 = true
  L0_27(L1_28)
  L0_27 = Player
  L1_28 = L0_27
  L0_27 = L0_27.getPuppet
  L0_27 = L0_27(L1_28)
  while true do
    L2_29 = L0_27
    L1_28 = L0_27.isLoading
    L1_28 = L1_28(L2_29)
    if L1_28 then
      L1_28 = wait
      L1_28()
    end
  end
  L1_28 = Fn_loadPlayerMotion
  L2_29 = _player_motion_table
  L1_28(L2_29)
  while true do
    L2_29 = L0_27
    L1_28 = L0_27.isLoading
    L1_28 = L1_28(L2_29)
    if L1_28 then
      L1_28 = wait
      L1_28()
    end
  end
  L1_28 = Fn_playMotionNpc
  L2_29 = "sm39_extra_01"
  L3_30 = _extra_man_motion_table
  L3_30 = L3_30.scared_00
  L4_31 = false
  L5_32 = {}
  L5_32.isRepeat = true
  L1_28(L2_29, L3_30, L4_31, L5_32)
  L1_28 = Fn_playMotionNpc
  L2_29 = "sm39_extra_02"
  L3_30 = _extra_woman_motion_table
  L3_30 = L3_30.scared_nevy_00
  L4_31 = false
  L5_32 = {}
  L5_32.isRepeat = true
  L1_28(L2_29, L3_30, L4_31, L5_32)
  L1_28 = Fn_playMotionNpc
  L2_29 = "sm39_extra_03"
  L3_30 = _extra_woman_motion_table
  L3_30 = L3_30.groggy_01
  L4_31 = false
  L5_32 = {}
  L5_32.isRepeat = true
  L1_28(L2_29, L3_30, L4_31, L5_32)
  L1_28 = Fn_setNpcActive
  L2_29 = "sm39_director_01"
  L3_30 = true
  L1_28(L2_29, L3_30)
  L1_28 = Fn_setNpcActive
  L2_29 = "sm39_assistant_01"
  L3_30 = true
  L1_28(L2_29, L3_30)
  L1_28 = Fn_setNpcActive
  L2_29 = "sm39_assi_wom_01"
  L3_30 = true
  L1_28(L2_29, L3_30)
  L1_28 = _staff_bg_tbl
  L1_28 = L1_28.bg2_scene1_parasol_01
  L2_29 = L1_28
  L1_28 = L1_28.setVisiblePermission
  L3_30 = true
  L1_28(L2_29, L3_30)
  L1_28 = _staff_bg_tbl
  L1_28 = L1_28.bg2_scene1_chair_01
  L2_29 = L1_28
  L1_28 = L1_28.setVisiblePermission
  L3_30 = true
  L1_28(L2_29, L3_30)
  L1_28 = Fn_playMotionNpc
  L2_29 = "sm39_director_01"
  L3_30 = "sit_00"
  L4_31 = false
  L1_28(L2_29, L3_30, L4_31)
  L1_28 = Fn_playMotionNpc
  L2_29 = "sm39_assistant_01"
  L3_30 = "talk_03"
  L4_31 = false
  L1_28(L2_29, L3_30, L4_31)
  L1_28 = Fn_playMotionNpc
  L2_29 = "sm39_assi_wom_01"
  L3_30 = "photo_03"
  L4_31 = false
  L1_28(L2_29, L3_30, L4_31)
  L1_28 = 1
  while true do
    L2_29 = findGameObject2
    L3_30 = "GimmickBg"
    L4_31 = "bg2_scene1_staff_box_"
    L5_32 = string
    L5_32 = L5_32.format
    L6_33 = "%02d"
    L7_34 = L1_28
    L5_32 = L5_32(L6_33, L7_34)
    L4_31 = L4_31 .. L5_32
    L2_29 = L2_29(L3_30, L4_31)
    if L2_29 ~= nil then
      L3_30 = table
      L3_30 = L3_30.insert
      L4_31 = _staff_box_tbl
      L5_32 = L2_29
      L3_30(L4_31, L5_32)
    else
      break
    end
    L1_28 = L1_28 + 1
  end
  L2_29 = Player
  L3_30 = L2_29
  L2_29 = L2_29.setEnergy
  L4_31 = Player
  L4_31 = L4_31.kEnergy_Life
  L5_32 = Player
  L6_33 = L5_32
  L5_32 = L5_32.getEnergyMax
  L7_34 = Player
  L7_34 = L7_34.kEnergy_Life
  L7_34 = L5_32(L6_33, L7_34)
  L2_29(L3_30, L4_31, L5_32, L6_33, L7_34, L5_32(L6_33, L7_34))
  L2_29 = {
    L3_30,
    L4_31,
    L5_32,
    L6_33
  }
  L3_30 = {}
  L4_31 = {
    L5_32,
    L6_33,
    L7_34
  }
  L5_32 = "pccubesensor2_scene1_fire_01"
  L6_33 = "pccubesensor2_scene1_fire_02"
  L7_34 = "pccubesensor2_scene1_fire_03"
  L3_30.fire_sensor_tbl = L4_31
  L3_30.navi_name = "locator2_navi_scene1_01"
  L3_30.sensor_name = "pccubesensor2_scene1_01"
  L3_30.battle_idx = nil
  L3_30.battle_caption = nil
  L3_30.sdemo_fnc = nil
  L3_30.rand_range = nil
  L4_31 = {}
  L5_32 = {L6_33, L7_34}
  L6_33 = "pccubesensor2_scene1_fire_04"
  L7_34 = "pccubesensor2_scene1_fire_05"
  L4_31.fire_sensor_tbl = L5_32
  L4_31.navi_name = "locator2_navi_scene1_02"
  L4_31.sensor_name = "pccubesensor2_scene1_02"
  L4_31.battle_idx = 1
  L4_31.battle_caption = "sm39_01002"
  L5_32 = playScene1Sdemo01
  L4_31.sdemo_fnc = L5_32
  L5_32 = {}
  L5_32.min = 30
  L5_32.max = 41
  L4_31.rand_range = L5_32
  L5_32 = {}
  L6_33 = {L7_34}
  L7_34 = "pccubesensor2_scene1_fire_06"
  L5_32.fire_sensor_tbl = L6_33
  L5_32.navi_name = "locator2_navi_scene1_03"
  L5_32.sensor_name = "pccubesensor2_scene1_03"
  L5_32.battle_idx = nil
  L5_32.battle_caption = nil
  L5_32.sdemo_fnc = nil
  L5_32.rand_range = nil
  L6_33 = {}
  L7_34 = {
    "pccubesensor2_scene1_fire_07",
    "pccubesensor2_scene1_fire_08",
    "pccubesensor2_scene1_fire_09",
    "pccubesensor2_scene1_fire_10",
    "pccubesensor2_scene1_fire_11"
  }
  L6_33.fire_sensor_tbl = L7_34
  L6_33.navi_name = "locator2_navi_scene1_04"
  L6_33.sensor_name = "pccubesensor2_scene1_04"
  L6_33.battle_idx = 2
  L6_33.battle_caption = "sm39_01003"
  L7_34 = playScene1Sdemo02
  L6_33.sdemo_fnc = L7_34
  L7_34 = {}
  L7_34.min = 60
  L7_34.max = 80
  L6_33.rand_range = L7_34
  L3_30 = sm39_DecorationBombardmentManager
  L3_30 = L3_30.Create
  L3_30 = L3_30()
  L5_32 = L3_30
  L4_31 = L3_30.Initialize
  L4_31(L5_32)
  L5_32 = L3_30
  L4_31 = L3_30.Run
  L4_31(L5_32)
  L4_31 = InitializeShipWork
  L5_32 = "ForSm32_39Ship"
  L6_33 = "staffShip"
  L7_34 = "locator2_staff_car_01"
  L4_31 = L4_31(L5_32, L6_33, L7_34)
  L5_32 = true
  function L6_33()
    Player:setStay(true)
    L3_30:Stop()
    Fn_pcSensorOff("pccubesensor2_extra_escape_start_01")
    PlaySeFailure()
    Fn_setBgmPoint("event", "battle_end")
    Fn_kaiwaDemoView("sm39_00500k")
    Fn_blackout()
    setupScene1Enemy(true)
    for _FORV_3_, _FORV_4_ in ipairs(_staff_box_tbl) do
      _staff_box_tbl[_FORV_3_]:requestRestoreForce()
    end
    Fn_resetPcPos("locator2_pc_start_pos")
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Fn_setNpcActive("sm39_extra_escape_01", false)
    Fn_setNpcActive("sm39_extra_escape_02", false)
    Fn_setNpcActive("sm39_extra_escape_03", false)
    Fn_warpNpc("sm39_extra_escape_01", "locator2_extra_escape_01")
    Fn_warpNpc("sm39_extra_escape_02", "locator2_extra_escape_02")
    Fn_warpNpc("sm39_extra_escape_03", "locator2_extra_escape_03")
    AbortEscapeTask()
    L5_32 = false
  end
  function L7_34()
    local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46
    if L0_35 == true then
      L0_35()
      L0_35(L1_36)
    else
      L0_35()
    end
    L0_35(L1_36)
    L0_35(L1_36)
    L0_35(L1_36)
    L0_35(L1_36)
    L0_35(L1_36, L2_37)
    L0_35()
    L0_35(L1_36)
    L0_35(L1_36)
    L0_35(L1_36, L2_37)
    L0_35(L1_36, L2_37)
    L0_35()
    _is_out_of_range = false
    L0_35(L1_36)
    for L3_38, L4_39 in L0_35(L1_36) do
      if L3_38 >= 2 then
        if L5_40 ~= nil then
          L5_40(L6_41)
        end
      end
      if L5_40 ~= nil then
        for L8_43, L9_44 in L5_40(L6_41) do
          L10_45 = Fn_pcSensorOn
          L11_46 = L9_44
          L10_45(L11_46)
        end
      end
      L8_43 = L4_39.navi_name
      L11_46 = L6_41(L7_42, L8_43)
      L5_40(L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L6_41(L7_42, L8_43))
      _is_in_sensor = false
      L5_40(L6_41)
      while true do
        if L5_40 == false then
          L5_40()
        end
      end
      L5_40(L6_41)
      _is_in_sensor = false
      L5_40()
      if L5_40 == true then
        if L5_40 ~= nil then
          for L8_43, L9_44 in L5_40(L6_41) do
            L10_45 = Fn_pcSensorOff
            L11_46 = L9_44
            L10_45(L11_46)
          end
        end
        break
      end
      _is_out_of_range2 = false
      if L5_40 ~= nil then
        L6_41(L7_42)
        while true do
          L8_43 = string
          L8_43 = L8_43.format
          L9_44 = ENEMY_NPC_NAME_FORMAT
          L10_45 = L4_39.battle_idx
          L11_46 = L7_42
          L8_43 = L8_43(L9_44, L10_45, L11_46)
          L9_44 = _enemy_puppet_tbl
          L9_44 = L9_44[L8_43]
          if L9_44 ~= nil then
            L9_44 = table
            L9_44 = L9_44.insert
            L10_45 = L6_41
            L11_46 = {}
            L11_46.npc_name = L8_43
            L11_46.move_prefix = string.format(ENEMY_MOVE_PREFIX_FORMAT, L4_39.battle_idx, L7_42)
            L9_44(L10_45, L11_46)
          else
            break
          end
        end
        L8_43 = findGameObject2
        L9_44 = "EnemyGenerator"
        L10_45 = string
        L10_45 = L10_45.format
        L11_46 = ENMGEN_NAME_FORMAT
        L11_46 = L10_45(L11_46, L4_39.battle_idx)
        L8_43 = L8_43(L9_44, L10_45, L11_46, L10_45(L11_46, L4_39.battle_idx))
        L9_44 = L4_39.sdemo_fnc
        if L9_44 ~= nil then
          L9_44 = Fn_userCtrlOff
          L9_44()
          L9_44 = L4_39.sdemo_fnc
          L10_45 = L6_41
          L11_46 = L8_43
          L9_44(L10_45, L11_46)
          L9_44 = Fn_userCtrlOn
          L9_44()
        end
        L10_45 = L8_43
        L9_44 = L8_43.getSpecTable
        L9_44 = L9_44(L10_45)
        L9_44.dead_count = 0
        L10_45 = string
        L10_45 = L10_45.format
        L11_46 = BATTLE_ENM_OUT_SENSOR_NAME_FORMAT
        L10_45 = L10_45(L11_46, L4_39.battle_idx)
        L11_46 = Fn_sensorOn
        L11_46(L10_45)
        L11_46 = Fn_missionView
        L11_46("sm39_01001")
        L11_46 = L4_39.battle_caption
        if L11_46 then
          L11_46 = Fn_captionView
          L11_46(L4_39.battle_caption)
        end
        L11_46 = nil
        if L4_39.rand_range ~= nil then
          L11_46 = invokeRandomBombPointTask(L4_39.rand_range, L6_41)
        end
        while #L6_41 > L9_44.dead_count and _is_out_of_range == false and _is_out_of_range2 == false do
          wait()
        end
        if L11_46 ~= nil then
          L11_46:abort()
          L11_46 = nil
        end
        Fn_sensorOff(L10_45)
        Fn_pcSensorOff(L5_40)
      end
      if L5_40 ~= nil then
        for L8_43, L9_44 in L5_40(L6_41) do
          L10_45 = Fn_pcSensorOff
          L11_46 = L9_44
          L10_45(L11_46)
        end
      end
      if L5_40 ~= true then
      end
    end
    L0_35(L1_36)
    if L0_35 ~= true then
    elseif L0_35 == true then
      L0_35()
      return L0_35
    end
    _is_out_of_range = false
    return L0_35
  end
  while true do
    if L7_34() == false then
    end
  end
  Fn_setBgmPoint("event", "battle_end")
  L3_30:Terminate()
  Fn_userCtrlOff()
  waitSeconds(1)
  PcAppeal(_player_motion_table.glad_in_01, _player_motion_table.glad_01)
  Fn_kaiwaDemoView("sm39_00400k")
  Fn_blackout()
  Fn_setNpcActive("sm39_director_01", false)
  Fn_setNpcActive("sm39_assistant_01", false)
  Fn_setNpcActive("sm39_assi_wom_01", false)
  _staff_bg_tbl.bg2_scene1_parasol_01:setVisiblePermission(false)
  _staff_bg_tbl.bg2_scene1_chair_01:setVisiblePermission(false)
  ReleaseShipWork(L4_31)
  deleteScene1Enemy()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  deleteScene1Enemy()
  Fn_disableCostumeChange(false)
  AbortEscapeTask()
end
function deleteScene1Enemy()
  local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52
  L0_47 = {}
  for L4_51, L5_52 in L1_48(L2_49) do
    table.insert(L0_47, L4_51)
  end
  _enemy_puppet_tbl = L1_48
  if L1_48 > 0 then
    for L4_51, L5_52 in L1_48(L2_49) do
      Fn_setGrabReleaseNpc(L5_52)
      Fn_disappearNpc(L5_52)
    end
    L1_48()
  end
end
function setupScene1Enemy(A0_53)
  local L1_54
  L1_54 = deleteScene1Enemy
  L1_54()
  L1_54 = {
    {
      name = "sm39_scene1_enemy_01_01",
      type = "thug04",
      node = "locator2_scene1_enemy_01_01",
      active = false,
      start = A0_53,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "sm39_scene1_enemy_01_02",
      type = "thug04",
      node = "locator2_scene1_enemy_01_02",
      active = false,
      start = A0_53,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "sm39_scene1_enemy_01_03",
      type = "thug05",
      node = "locator2_scene1_enemy_01_03",
      active = false,
      start = A0_53,
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "sm39_scene1_enemy_02_01",
      type = "thug04",
      node = "locator2_scene1_enemy_02_01",
      active = false,
      start = A0_53,
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "sm39_scene1_enemy_02_02",
      type = "thug05",
      node = "locator2_scene1_enemy_02_02",
      active = false,
      start = A0_53,
      color_variation = 1,
      hair_variation = 0
    },
    {
      name = "sm39_scene1_enemy_02_03",
      type = "thug05",
      node = "locator2_scene1_enemy_02_03",
      active = false,
      start = A0_53,
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "sm39_scene1_enemy_02_04",
      type = "thug04",
      node = "locator2_scene1_enemy_02_04",
      active = false,
      start = A0_53,
      color_variation = 3,
      hair_variation = 0
    },
    {
      name = "sm39_scene1_enemy_02_05",
      type = "thug05",
      node = "locator2_scene1_enemy_02_05",
      active = false,
      start = A0_53,
      color_variation = 3,
      hair_variation = 1
    },
    {
      name = "sm39_scene1_enemy_02_06",
      type = "thug04",
      node = "locator2_scene1_enemy_02_06",
      active = false,
      start = A0_53,
      color_variation = 0,
      hair_variation = 1
    }
  }
  Fn_setupNpc(L1_54)
  for _FORV_5_, _FORV_6_ in ipairs(L1_54) do
    _enemy_puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
end
function playScene1Sdemo01(A0_55, A1_56)
  local L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L9_64
  L3_58 = A1_56
  L2_57 = A1_56.requestIdlingEnemy
  L2_57(L3_58, L4_59)
  L2_57 = {}
  L3_58 = {}
  for L7_62, L8_63 in L4_59(L5_60) do
    L9_64 = print
    L9_64(L8_63.npc_name)
    L9_64 = Fn_setNpcActive
    L9_64(L8_63.npc_name, true)
    L9_64 = RAC_invokeMoveCharaTask
    L9_64 = L9_64(L8_63.npc_name, L8_63.move_prefix, {runLength = -1, arrivedLength = 1})
    table.insert(L3_58, L9_64)
    ChangeEnemyInvokeTask(L8_63.npc_name, L9_64, A1_56)
  end
  L4_59(L5_60)
  L4_59(L5_60, L6_61, L7_62)
  L4_59(L5_60)
  L4_59(L5_60)
  L7_62.pos = "locator2_scene1_sdemo_01_cam_02"
  L7_62.time = 2
  L7_62.hashfunc = "EaseInOut"
  L4_59(L5_60, L6_61, L7_62)
  while true do
    if L4_59 then
      L4_59()
    end
  end
  repeat
    L5_60()
    for L8_63, L9_64 in L5_60(L6_61) do
      if L9_64:isRunning() then
        break
      end
    end
  until L4_59 == true
  L3_58 = L5_60
  L5_60(L6_61, L7_62)
end
function playScene1Sdemo02(A0_65, A1_66)
  local L2_67, L3_68, L4_69
  L2_67 = waitSeconds
  L3_68 = 0.5
  L2_67(L3_68)
  L2_67 = {}
  L3_68 = A0_65[1]
  L4_69(L3_68.npc_name, true)
  table.insert(L2_67, L4_69)
  ChangeEnemyInvokeTask(L3_68.npc_name, L4_69, A1_66)
  L3_68 = _sdemo
  L3_68 = L3_68.reset
  L3_68(L4_69)
  L3_68 = _sdemo
  L3_68 = L3_68.set
  L3_68(L4_69, "locator2_scene1_sdemo_02_cam_01", "locator2_scene1_sdemo_02_aim_01")
  L3_68 = _sdemo
  L3_68 = L3_68.play
  L3_68(L4_69)
  L3_68 = A0_65[2]
  L4_69(L3_68.npc_name, true)
  table.insert(L2_67, L4_69)
  ChangeEnemyInvokeTask(L3_68.npc_name, L4_69, A1_66)
  L3_68 = waitSeconds
  L3_68(L4_69)
  L3_68 = _sdemo
  L3_68 = L3_68.play
  L3_68(L4_69, nil, {
    {
      pos = "locator2_scene1_sdemo_02_aim_02",
      time = 0.5,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L3_68 = _sdemo
    L3_68 = L3_68.isPlay
    L3_68 = L3_68(L4_69)
    if L3_68 then
      L3_68 = wait
      L3_68()
    end
  end
  L3_68 = A0_65[3]
  L4_69(L3_68.npc_name, true)
  table.insert(L2_67, L4_69)
  ChangeEnemyInvokeTask(L3_68.npc_name, L4_69, A1_66)
  L3_68 = waitSeconds
  L3_68(L4_69)
  L3_68 = _sdemo
  L3_68 = L3_68.play
  L3_68(L4_69, nil, {
    {
      pos = "locator2_scene1_sdemo_02_aim_03",
      time = 0.5,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L3_68 = _sdemo
    L3_68 = L3_68.isPlay
    L3_68 = L3_68(L4_69)
    if L3_68 then
      L3_68 = wait
      L3_68()
    end
  end
  L3_68 = A0_65[4]
  L4_69(L3_68.npc_name, true)
  table.insert(L2_67, L4_69)
  ChangeEnemyInvokeTask(L3_68.npc_name, L4_69, A1_66)
  L3_68 = A0_65[5]
  L4_69(L3_68.npc_name, true)
  table.insert(L2_67, L4_69)
  ChangeEnemyInvokeTask(L3_68.npc_name, L4_69, A1_66)
  L3_68 = A0_65[6]
  L4_69(L3_68.npc_name, true)
  table.insert(L2_67, L4_69)
  ChangeEnemyInvokeTask(L3_68.npc_name, L4_69, A1_66)
  L3_68 = waitSeconds
  L3_68(L4_69)
  L3_68 = _sdemo
  L3_68 = L3_68.play
  L3_68(L4_69, {
    {
      pos = "locator2_scene1_sdemo_02_cam_04",
      time = 0.5,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_scene1_sdemo_02_aim_04",
      time = 0.5,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L3_68 = _sdemo
    L3_68 = L3_68.isPlay
    L3_68 = L3_68(L4_69)
    if L3_68 then
      L3_68 = wait
      L3_68()
    end
  end
  L3_68 = waitSeconds
  L3_68(L4_69)
  L3_68 = false
  repeat
    L4_69()
    L3_68 = true
    for _FORV_7_, _FORV_8_ in L4_69(L2_67) do
      if _FORV_8_:isRunning() then
        L3_68 = false
        break
      end
    end
  until L3_68 == true
  L2_67 = L4_69
  L4_69(0.1)
  L4_69(L4_69, 1.5)
end
function ChangeEnemyInvokeTask(A0_70, A1_71, A2_72)
  invokeTask(function()
    print(A0_70 .. "\227\129\174moveTask\231\181\130\228\186\134\227\130\146\229\190\133\227\129\161")
    repeat
      wait()
    until not A1_71:isRunning()
    Fn_playMotionNpc(A0_70, "fighting", true)
    Fn_findNpc(A0_70):changeEnemy()
    Fn_findNpc(A0_70):setEnemyGenerator(A2_72)
    print(A0_70 .. "\227\130\146\227\130\168\227\131\141\227\131\159\227\131\188\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end)
end
function invokeRandomBombPointTask(A0_73, A1_74)
  local L2_75
  L2_75 = #A1_74
  return invokeTask(function()
    local L0_76, L1_77
    while true do
      L0_76 = wait
      L0_76()
      L0_76 = RandI
      L1_77 = A0_73.min
      L0_76 = L0_76(L1_77, A0_73.max)
      L1_77 = findGameObject2
      L1_77 = L1_77("Node", "locator2_scene1_bombing_marker_" .. string.format("%02d", L0_76))
      if L1_77 ~= nil then
        for _FORV_7_, _FORV_8_ in pairs(A1_74) do
          if Fn_findNpc(_FORV_8_.npc_name) ~= nil and Fn_findNpc(_FORV_8_.npc_name):getBrain() ~= nil then
            if 0 < Fn_findNpc(_FORV_8_.npc_name):getBrain():getHealth() then
            else
              L2_75 = L2_75 - 1
            end
          end
        end
        if Fn_getDistanceToPlayer(L1_77) > 5 and 0 + 1 >= L2_75 then
          invokeBombingTask(L0_76, false)
          waitSeconds(RandI(5, 10))
        end
      end
    end
  end)
end
function invokeBombingTask(A0_78, A1_79)
  local L2_80
  if A1_79 == nil then
    A1_79 = true
  end
  L2_80 = {}
  L2_80.bomb_eff = nil
  L2_80.timer_task = nil
  L2_80.sensor_name = nil
  L2_80.marker_eff_task = nil
  function L2_80.update(A0_81)
    local L1_82, L2_83
    L1_82 = findGameObject2
    L2_83 = "Node"
    L1_82 = L1_82(L2_83, "locator2_scene1_bombing_marker_" .. string.format("%02d", A0_78))
    L2_83 = 1
    if A1_79 == true then
      L1_82:getWorldPos().y = L1_82:getWorldPos().y + 0.2
      A0_81.marker_eff_task = RAC_createEffect({
        eff_name = "ef_ev_lgt_01m",
        world_pos = L1_82:getWorldPos(),
        time = L2_83
      })
      waitSeconds(L2_83)
    end
    A0_81.bomb_eff = createEffect("bomb_eff_" .. string.format("%02d", A0_78), "ef_com_exp_01", L1_82)
    Sound:playSE("ef_ev_exp_01", 1, "", A0_81.bomb_eff)
    A0_81.sensor_name = "pcspheresensor2_scene1_bombing_" .. string.format("%02d", A0_78)
    Fn_pcSensorOn(A0_81.sensor_name)
    waitSeconds(1)
    Fn_pcSensorOff(A0_81.sensor_name)
    A0_81.sensor_name = nil
    A0_81.timer_task = invokeTask(function()
      waitSeconds(10)
    end)
    while A0_81.bomb_eff:isPlaying() and A0_81.timer_task:isRunning() do
      wait()
    end
  end
  function L2_80.destractor(A0_84)
    if A0_84.marker_eff_task ~= nil then
      A0_84.marker_eff_task:abort()
      A0_84.marker_eff_task = nil
    end
    if A0_84.bomb_eff ~= nil then
      A0_84.bomb_eff:try_term()
      A0_84.bomb_eff = nil
    end
    if A0_84.timer_task ~= nil then
      A0_84.timer_task:abort()
      A0_84.timer_task = nil
    end
    if A0_84.sensor_name ~= nil then
      Fn_pcSensorOff(A0_84.sensor_name)
      A0_84.sensor_name = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L2_80.update, L2_80.destractor, L2_80)
end
function createEffect(A0_85, A1_86, A2_87)
  local L3_88
  L3_88 = A2_87.getWorldPos
  L3_88 = L3_88(A2_87)
  createGameObject2("Effect"):setName(A0_85)
  createGameObject2("Effect"):setModelName(A1_86)
  createGameObject2("Effect"):setPos(L3_88)
  createGameObject2("Effect"):play()
  start_game_obj()
  return (createGameObject2("Effect"))
end
function playerRequestDamage()
  local L0_89
  L0_89 = Player
  L0_89 = L0_89.getEnergyMax
  L0_89 = L0_89(L0_89, Player.kEnergy_Life)
  L0_89 = L0_89 * 0.3
  Player:applyImpactDamage(Fn_getPlayerWorldPos(), Vector(0, 1, 0), L0_89, true)
end
function enemyOut(A0_90, A1_91)
  local L2_92, L3_93, L4_94, L5_95
  for L5_95, _FORV_6_ in L2_92(L3_93) do
    if _FORV_6_ == A0_90 then
      if 0 < _FORV_6_:getBrain():getHealth() then
        Fn_findNpc(L5_95):changeNpc()
        Fn_setNpcActive(L5_95, false)
        findGameObject2("EnemyGenerator", string.format(ENMGEN_NAME_FORMAT, A1_91)):getSpecTable().dead_count = findGameObject2("EnemyGenerator", string.format(ENMGEN_NAME_FORMAT, A1_91)):getSpecTable().dead_count + 1
      end
      break
    end
  end
end
function pccubesensor2_scene1_01_OnEnter()
  local L0_96, L1_97
  _is_in_sensor = true
end
function pccubesensor2_scene1_01_OnLeave()
  local L0_98, L1_99
  _is_in_sensor = false
end
function pccubesensor2_scene1_02_OnEnter()
  local L0_100, L1_101
  _is_in_sensor = true
end
function pccubesensor2_scene1_02_OnLeave()
  local L0_102, L1_103
  _is_in_sensor = false
end
function pccubesensor2_scene1_03_OnEnter()
  local L0_104, L1_105
  _is_in_sensor = true
end
function pccubesensor2_scene1_03_OnLeave()
  local L0_106, L1_107
  _is_in_sensor = false
end
function pccubesensor2_scene1_04_OnEnter()
  local L0_108, L1_109
  _is_in_sensor = true
end
function pccubesensor2_scene1_04_OnLeave()
  local L0_110, L1_111
  _is_in_sensor = false
end
function pccubesensor2_scene1_fire_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_01")
  invokeBombingTask(1)
end
function pccubesensor2_scene1_fire_01_OnLeave()
  local L0_112, L1_113
end
function pccubesensor2_scene1_fire_02_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_02")
  invokeBombingTask(2)
end
function pccubesensor2_scene1_fire_02_OnLeave()
  local L0_114, L1_115
end
function pccubesensor2_scene1_fire_03_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_03")
  invokeBombingTask(3)
end
function pccubesensor2_scene1_fire_03_OnLeave()
  local L0_116, L1_117
end
function pccubesensor2_scene1_fire_04_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_04")
  invokeBombingTask(4)
end
function pccubesensor2_scene1_fire_04_OnLeave()
  local L0_118, L1_119
end
function pccubesensor2_scene1_fire_05_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_05")
  invokeBombingTask(5)
end
function pccubesensor2_scene1_fire_05_OnLeave()
  local L0_120, L1_121
end
function pccubesensor2_scene1_fire_06_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_06")
  invokeBombingTask(6)
end
function pccubesensor2_scene1_fire_06_OnLeave()
  local L0_122, L1_123
end
function pccubesensor2_scene1_fire_07_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_07")
  invokeBombingTask(7)
end
function pccubesensor2_scene1_fire_07_OnLeave()
  local L0_124, L1_125
end
function pccubesensor2_scene1_fire_08_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_08")
  invokeBombingTask(8)
end
function pccubesensor2_scene1_fire_08_OnLeave()
  local L0_126, L1_127
end
function pccubesensor2_scene1_fire_09_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_09")
  invokeBombingTask(9)
end
function pccubesensor2_scene1_fire_09_OnLeave()
  local L0_128, L1_129
end
function pccubesensor2_scene1_fire_10_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_10")
  invokeBombingTask(10)
end
function pccubesensor2_scene1_fire_10_OnLeave()
  local L0_130, L1_131
end
function pccubesensor2_scene1_fire_11_OnEnter()
  Fn_pcSensorOff("pccubesensor2_scene1_fire_11")
  invokeBombingTask(11)
end
function pccubesensor2_scene1_fire_11_OnLeave()
  local L0_132, L1_133
end
function pcspheresensor2_scene1_bombing_01_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_01_OnLeave()
  local L0_134, L1_135
end
function pcspheresensor2_scene1_bombing_02_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_02_OnLeave()
  local L0_136, L1_137
end
function pcspheresensor2_scene1_bombing_03_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_03_OnLeave()
  local L0_138, L1_139
end
function pcspheresensor2_scene1_bombing_04_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_04_OnLeave()
  local L0_140, L1_141
end
function pcspheresensor2_scene1_bombing_05_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_05_OnLeave()
  local L0_142, L1_143
end
function pcspheresensor2_scene1_bombing_06_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_06_OnLeave()
  local L0_144, L1_145
end
function pcspheresensor2_scene1_bombing_07_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_07_OnLeave()
  local L0_146, L1_147
end
function pcspheresensor2_scene1_bombing_08_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_08_OnLeave()
  local L0_148, L1_149
end
function pcspheresensor2_scene1_bombing_09_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_09_OnLeave()
  local L0_150, L1_151
end
function pcspheresensor2_scene1_bombing_10_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_10_OnLeave()
  local L0_152, L1_153
end
function pcspheresensor2_scene1_bombing_11_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_11_OnLeave()
  local L0_154, L1_155
end
function pcspheresensor2_scene1_bombing_30_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_31_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_32_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_33_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_34_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_35_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_36_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_37_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_38_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_39_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_40_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_41_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_60_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_61_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_62_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_63_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_64_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_65_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_66_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_67_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_68_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_69_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_70_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_71_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_72_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_73_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_74_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_75_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_76_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_77_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_78_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_79_OnEnter()
  playerRequestDamage()
end
function pcspheresensor2_scene1_bombing_80_OnEnter()
  playerRequestDamage()
end
function pccubesensor2_scene1_battle_out_01_OnEnter()
  local L0_156, L1_157
  _is_out_of_range2 = false
end
function pccubesensor2_scene1_battle_out_01_OnLeave()
  local L0_158, L1_159
  _is_out_of_range2 = true
end
function pccubesensor2_scene1_battle_out_02_OnEnter()
  local L0_160, L1_161
  _is_out_of_range2 = false
end
function pccubesensor2_scene1_battle_out_02_OnLeave()
  local L0_162, L1_163
  _is_out_of_range2 = true
end
function cubesensor2_scene1_battle_enm_out_01_OnEnter(A0_164, A1_165)
end
function cubesensor2_scene1_battle_enm_out_01_OnLeave(A0_166, A1_167)
  enemyOut(A1_167, 1)
end
function cubesensor2_scene1_battle_enm_out_02_OnEnter(A0_168, A1_169)
end
function cubesensor2_scene1_battle_enm_out_02_OnLeave(A0_170, A1_171)
  enemyOut(A1_171, 2)
end
function pccubesensormulti2_scene1_out_01_OnEnter()
  local L0_172, L1_173
  _is_out_of_range = false
end
function pccubesensormulti2_scene1_out_01_OnLeave()
  local L0_174, L1_175
  _is_out_of_range = true
end
function pccubesensor2_extra_escape_start_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_extra_escape_start_01")
  table.insert(_extra_escape_task, invokeEscapeExtraTask("sm39_extra_escape_01", "m29_936", "sm39_01005"))
  table.insert(_extra_escape_task, invokeEscapeExtraTask("sm39_extra_escape_02", "m31_936", nil))
  table.insert(_extra_escape_task, invokeEscapeExtraTask("sm39_extra_escape_03", "m29_936", nil))
end
function AbortEscapeTask()
  for _FORV_3_, _FORV_4_ in ipairs(_extra_escape_task) do
    _extra_escape_task[_FORV_3_]:abort()
  end
  _extra_escape_task = {}
end
function invokeEscapeExtraTask(A0_176, A1_177, A2_178)
  local L3_179, L4_180
  L3_179 = 0.4
  L4_180 = {}
  L4_180.move_task = nil
  L4_180.se_node = nil
  L4_180.main_task = invokeTask(function()
    local L0_181, L1_182, L2_183, L3_184, L4_185, L5_186, L6_187, L7_188, L8_189
    L0_181 = L4_180
    L1_182 = false
    L2_183 = Fn_findNpc
    L3_184 = A0_176
    L2_183 = L2_183(L3_184)
    L3_184 = Fn_findNpcPuppet
    L4_185 = A0_176
    L3_184 = L3_184(L4_185)
    L4_185 = 0
    L5_186 = false
    L6_187 = 0
    L7_188 = Fn_setNpcActive
    L8_189 = A0_176
    L7_188(L8_189, true)
    L7_188 = RAC_invokeMoveCharaTask
    L8_189 = A0_176
    L7_188 = L7_188(L8_189, "locator2_extra_escape_move_", {runLength = -1})
    L0_181.move_task = L7_188
    L7_188 = createGameObject2
    L8_189 = "Node"
    L7_188 = L7_188(L8_189)
    L0_181.se_node = L7_188
    L7_188 = L0_181.se_node
    L8_189 = L7_188
    L7_188 = L7_188.setName
    L7_188(L8_189, string.format("locator2_%s_se_pos", A0_176))
    repeat
      if not L1_182 then
        L7_188 = Fn_getDistanceToPlayer
        L8_189 = L3_184
        L7_188 = L7_188(L8_189)
        if L7_188 <= 5 then
          L7_188 = Camera
          L8_189 = L7_188
          L7_188 = L7_188.getEyePos
          L7_188 = L7_188(L8_189)
          L8_189 = L3_184.getWorldPos
          L8_189 = L8_189(L3_184)
          L8_189 = L8_189 - L7_188
          L8_189 = L8_189 * L3_179
          L8_189 = L8_189 + L7_188
          L0_181.se_node:setWorldPos(L8_189)
          L4_185 = 0
          Sound:playSE(A1_177, 1, "", L0_181.se_node)
          L1_182 = true
          if A2_178 ~= nil then
            Fn_captionView(A2_178)
          end
        end
      elseif L4_185 < 90 then
        L7_188 = Camera
        L8_189 = L7_188
        L7_188 = L7_188.getEyePos
        L7_188 = L7_188(L8_189)
        L8_189 = L3_184.getWorldPos
        L8_189 = L8_189(L3_184)
        L8_189 = L8_189 - L7_188
        L8_189 = L8_189 * L3_179
        L8_189 = L8_189 + L7_188
        L0_181.se_node:setWorldPos(L8_189)
        L4_185 = L4_185 + 1
      end
      if L5_186 then
        L7_188 = Camera
        L8_189 = L7_188
        L7_188 = L7_188.getEyePos
        L7_188 = L7_188(L8_189)
        L8_189 = L3_184.getWorldPos
        L8_189 = L8_189(L3_184)
        L8_189.y = L8_189.y + 2
        Query:setEyeSightTransform(L7_188, IdentQuat())
        Query:setEyeSightAngle(Deg2Rad(360))
        Query:setEyeSightRange(Fn_get_distance(L7_188, L8_189) + 1)
        if Fn_isInSightTarget(L3_184, 1) and Query:raycastEyeSight(L8_189) == nil then
          L6_187 = 0
        else
          L6_187 = L6_187 + 1
        end
        if not (L6_187 > 60) then
          else
            L8_189 = L2_183
            L7_188 = L2_183.getMoveCurrentIndex
            L7_188 = L7_188(L8_189)
            if L7_188 >= 7 then
              L5_186 = true
            end
          end
          L7_188 = wait
          L7_188()
          L7_188 = L0_181.move_task
          L8_189 = L7_188
          L7_188 = L7_188.isRunning
          L7_188 = L7_188(L8_189)
        end
    until not L7_188
    L7_188 = Fn_setNpcActive
    L8_189 = A0_176
    L7_188(L8_189, false)
  end)
  function L4_180.abort(A0_190)
    if A0_190.move_task ~= nil then
      A0_190.move_task:abort()
      A0_190.move_task = nil
    end
    if A0_190.se_node ~= nil then
      A0_190.se_node:try_term()
      A0_190.se_node = nil
    end
    if A0_190.main_task ~= nil then
      A0_190.main_task:abort()
      A0_190.main_task = nil
    end
  end
  return L4_180
end
sm39_DecorationBombardmentManager = {}
sm39_DecorationBombardmentManager.SHOT_WAIT_MIN = 1
sm39_DecorationBombardmentManager.SHOT_WAIT_MAX = 2
function sm39_DecorationBombardmentManager.Create(A0_191)
  local L1_192, L2_193, L3_194, L4_195, L5_196, L6_197
  L1_192 = {}
  L1_192.main_task = nil
  L1_192.shotWait = L2_193
  L1_192.targetName = L2_193
  L1_192.targetMax = 0
  L1_192.targetIndex = 1
  L1_192.isStop = true
  for L5_196, L6_197 in L2_193(L3_194) do
    if type(L6_197) == "function" then
      L1_192[L5_196] = L6_197
    end
  end
  return L1_192
end
function sm39_DecorationBombardmentManager.Initialize(A0_198)
  local L1_199, L2_200
  L1_199 = 1
  while true do
    L2_200 = "pcspheresensor2_scene1_decoration_bombing_"
    L2_200 = L2_200 .. string.format("%02d", L1_199)
    if findGameObject2("Node", L2_200) ~= nil then
      A0_198.targetName[L1_199] = L2_200
      L1_199 = L1_199 + 1
    end
  end
  L2_200 = L1_199 - 1
  A0_198.targetMax = L2_200
end
function sm39_DecorationBombardmentManager.Terminate(A0_201)
  if A0_201 == nil then
    return
  end
  A0_201.main_task:abort()
  A0_201.main_task = nil
end
function sm39_DecorationBombardmentManager.Stop(A0_202)
  local L1_203
  if A0_202 == nil then
    return
  end
  A0_202.isStop = true
end
function sm39_DecorationBombardmentManager.Start(A0_204)
  local L1_205
  if A0_204 == nil then
    return
  end
  A0_204.isStop = false
end
function sm39_DecorationBombardmentManager.Run(A0_206)
  if A0_206 == nil then
    return
  end
  if A0_206.main_task == nil then
    A0_206.main_task = invokeTask(function()
      while true do
        if A0_206.isStop then
          wait()
        else
          waitSeconds(A0_206.shotWait)
          A0_206:Bombing(A0_206.targetName[RandI(1, A0_206.targetMax)])
          A0_206.shotWait = RandF(sm39_DecorationBombardmentManager.SHOT_WAIT_MIN, sm39_DecorationBombardmentManager.SHOT_WAIT_MAX)
        end
      end
    end)
  end
end
function sm39_DecorationBombardmentManager.Bombing(A0_207, A1_208)
  local L2_209
  if A0_207 == nil then
    return
  end
  L2_209 = {}
  L2_209.bomb_eff = nil
  L2_209.timer_task = nil
  L2_209.collisionHandle = nil
  function L2_209.update(A0_210)
    A0_210.bomb_eff = createEffect("bomb_eff_" .. A1_208, "ef_com_exp_01", findGameObject2("PlayerSensor", A1_208))
    Sound:playSE("ef_ev_exp_01", 1, "", A0_210.bomb_eff)
    A0_210.timer_task = invokeTask(function()
      waitSeconds(10)
    end)
    A0_210.collisionHandle = createGameObject2("PlayerSensor")
    A0_210.collisionHandle:setName("collision_" .. A1_208)
    A0_210.collisionHandle:setDetectBehavior(1)
    A0_210.collisionHandle:setBBoxOffset(Vector(100000, 100000, 100000))
    A0_210.collisionHandle:addSphere(1.8)
    A0_210.collisionHandle:setPos(Vector(0, 1, 0))
    A0_210.collisionHandle:setOnEnter("playerRequestDamage")
    A0_210.bomb_eff:appendChild(A0_210.collisionHandle)
    invokeTask(function()
      waitSeconds(2)
      A0_210.collisionHandle:setActive(false)
    end)
    while A0_210.bomb_eff:isPlaying() and A0_210.timer_task:isRunning() do
      wait()
    end
  end
  function L2_209.destractor(A0_211)
    if A0_211.bomb_eff then
      A0_211.bomb_eff:try_term()
      A0_211.bomb_eff = nil
    end
    if A0_211.timer_task then
      A0_211.timer_task:abort()
      A0_211.timer_task = nil
    end
    if A0_211.collisionHandle then
      A0_211.collisionHandle:try_term()
      A0_211.collisionHandle = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L2_209.update, L2_209.destractor, L2_209)
end
