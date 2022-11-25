import("math")
import("DebugDraw")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep08_common.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Misc/pdemo.lua")
_pdemo = nil
_mechskytask = nil
_mnavi = {}
_soldierName = {}
_guardName = {}
_bandmanName = {}
_gem = {}
_restore_gem = {}
_energy_gem_tbl = {
  "gem2_energy_01",
  "gem2_energy_02",
  "gem2_energy_03",
  "gem2_energy_04",
  "gem2_energy_05",
  "gem2_energy_06",
  "gem2_energy_07",
  "gem2_energy_08",
  "gem2_energy_09",
  "gem2_energy_10",
  "gem2_energy_11",
  "gem2_energy_12",
  "gem2_energy_13",
  "gem2_energy_14"
}
_bandman_max = 4
_soldier_max = 22
_guard_max = 33
_caution_soldier_max = 5
_all_soldier = _soldier_max + _guard_max
_soldierInstance = {}
_guardInstance = {}
_bandmanInstance = {}
_npcTable = {}
_soldierTable = {}
_plaza_move_flg = false
_near_ship = false
_se_handle = nil
_cam_target_task_hdl = nil
_open_door_flag = false
_band_man_until_talk = 10
_band_man_wait_flag = false
_bandman_talk_cnt = 0
_talk_range = false
_band_talk_start_flg = false
_photo = {}
_result = {}
_photo_tbl = {}
_processingPcReset = false
_begin_combat = false
_detect_bandman = nil
_detected_bandman_flag = false
_detected_bandmanager_flag = false
_force_info_flag = false
_sol_motion_list = {
  talk_00 = "man57_talk_00",
  talk_01 = "man57_talk_01",
  lookaround = "man57_lookaround_00"
}
_mission_phase = "start"
enmgen2_mechsky = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_01",
      name = "mechsky_01"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_02",
      name = "mechsky_02"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_03",
      name = "mechsky_03"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_04",
      name = "mechsky_04"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_05",
      name = "mechsky_05"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_06",
      name = "mechsky_06"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_07",
      name = "mechsky_07"
    },
    {
      type = "mechsky",
      locator = "locator2_enemy_mechsky_08",
      name = "mechsky_08"
    },
    {
      type = "officer_rifle",
      locator = "locator2_01",
      name = "officer_rifle_01",
      target_vehicle = "mechsky_01"
    },
    {
      type = "officer_rifle",
      locator = "locator2_02",
      name = "officer_rifle_02",
      target_vehicle = "mechsky_02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_03",
      name = "officer_rifle_03",
      target_vehicle = "mechsky_03"
    },
    {
      type = "officer_rifle",
      locator = "locator2_04",
      name = "officer_rifle_04",
      target_vehicle = "mechsky_04"
    },
    {
      type = "officer_rifle",
      locator = "locator2_05",
      name = "officer_rifle_05",
      target_vehicle = "mechsky_05"
    },
    {
      type = "officer_rifle",
      locator = "locator2_06",
      name = "officer_rifle_06",
      target_vehicle = "mechsky_06"
    },
    {
      type = "officer_rifle",
      locator = "locator2_07",
      name = "officer_rifle_07",
      target_vehicle = "mechsky_07"
    },
    {
      type = "officer_rifle",
      locator = "locator2_08",
      name = "officer_rifle_08",
      target_vehicle = "mechsky_08"
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
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end
}
function Initialize()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25
  L0_16()
  L0_16()
  L0_16()
  L3_19.camera = true
  L3_19.scene_param = false
  _pdemo = L0_16
  while true do
    if L0_16 == true then
      L0_16()
    end
  end
  for L3_19 = 1, _soldier_max do
    L5_21(L6_22, L7_23)
    L5_21(L6_22, L7_23)
  end
  for L3_19 = 1, _guard_max do
    L5_21(L6_22, L7_23)
    L5_21(L6_22, L7_23)
  end
  for L5_21 = 1, 2 do
    L8_24 = "navi"
    L9_25 = L5_21
    L8_24 = L8_24 .. L9_25
    L6_22[L5_21] = L7_23
    L8_24 = L5_21
    L6_22(L7_23)
  end
  L2_18(L3_19)
  L2_18(L3_19)
  L2_18(L3_19)
  L2_18(L3_19)
  L2_18(L3_19)
  for L8_24 = 1, 22 do
    L9_25 = findGameObject2
    L9_25 = L9_25("GimmickBg", string.format("bg2_container_kk_04_%02d", L8_24))
    L2_18[L8_24] = L9_25
    L9_25 = L2_18[L8_24]
    L9_25 = L9_25.setVisibleBlockEnable
    L9_25(L9_25, false)
  end
  for L8_24 = 1, 4 do
    L9_25 = findGameObject2
    L9_25 = L9_25("GimmickBg", string.format("bg2_container_kk_05_%02d", L8_24))
    L3_19[L8_24] = L9_25
    L9_25 = L3_19[L8_24]
    L9_25 = L9_25.setVisibleBlockEnable
    L9_25(L9_25, false)
  end
  for L8_24 = 1, 6 do
    L9_25 = findGameObject2
    L9_25 = L9_25("GimmickBg", string.format("bg2_box_kk_01_%02d", L8_24))
    L4_20[L8_24] = L9_25
    L9_25 = L4_20[L8_24]
    L9_25 = L9_25.setVisibleBlockEnable
    L9_25(L9_25, false)
  end
  for L8_24, L9_25 in L5_21(L6_22) do
    _gem[L8_24] = findGameObject2("Gem", L9_25)
    _restore_gem[L8_24] = findGameObject2("Gem", L9_25)
  end
  L5_21(L6_22)
end
function Ingame()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41
  L0_26 = setArStage
  L0_26()
  L0_26 = setupMechSkyTask
  L0_26()
  L0_26 = nil
  L1_27 = Fn_createGimmickBg
  L2_28 = "locator2_ve_go_a_01"
  L3_29 = "ship"
  L4_30 = "ve_go_a"
  L1_27 = L1_27(L2_28, L3_29, L4_30)
  L0_26 = L1_27
  L2_28 = L0_26
  L1_27 = L0_26.setVisibleBlockEnable
  L3_29 = false
  L1_27(L2_28, L3_29)
  L1_27, L2_28, L3_29 = nil, nil, nil
  L4_30 = findGameObject2
  L5_31 = "Node"
  L6_32 = "locator2_navi_04"
  L4_30 = L4_30(L5_31, L6_32)
  L5_31 = {}
  L6_32 = findGameObject2
  L6_32 = L6_32(L7_33, L8_34)
  if L6_32 ~= nil then
    L7_33(L8_34, L9_35)
  end
  L7_33(L8_34, L9_35)
  L7_33()
  L7_33()
  L7_33(L8_34)
  L7_33()
  L7_33(L8_34)
  L7_33(L8_34)
  L10_36 = true
  L11_37 = 5
  L7_33(L8_34, L9_35, L10_36, L11_37)
  for L10_36 = 1, #L8_34 do
    L11_37 = _mnavi
    L11_37 = L11_37[L10_36]
    L11_37 = L11_37.setActive
    L11_37(L12_38)
    L11_37 = findGameObject2
    L15_41 = L10_36
    L15_41 = L13_39(L14_40, L15_41)
    L11_37 = L11_37(L12_38, L13_39, L14_40, L15_41, L13_39(L14_40, L15_41))
    L5_31[L10_36] = L11_37
  end
  L7_33(L8_34)
  L10_36 = kPHOTO_TYPE_ONCE
  L11_37 = false
  L12_38.near = 10
  L12_38.far = 300
  L13_39.left = -0.05
  L13_39.right = 0.05
  L13_39.top = -2
  L13_39.bottom = -0.5
  L7_33[1] = L8_34
  L10_36 = kPHOTO_TYPE_ONCE
  L11_37 = false
  L12_38.near = 3.5
  L12_38.far = 25
  L13_39.left = -0.5
  L13_39.right = 0.5
  L13_39.top = -0.5
  L13_39.bottom = 0.5
  L7_33[2] = L8_34
  L7_33(L8_34, L9_35)
  L7_33(L8_34, L9_35)
  L8_34.shoot = false
  L8_34.enter = false
  L8_34.navi = L9_35
  L8_34.photo = L9_35
  L8_34.result = L9_35
  L7_33.plaza = L8_34
  L8_34.shoot = false
  L8_34.enter = false
  L8_34.navi = L9_35
  L8_34.photo = L9_35
  L8_34.result = L9_35
  L7_33.ship = L8_34
  _photo_tbl = L7_33
  while true do
    for L10_36, L11_37 in L7_33(L8_34) do
      if L12_38 == false then
        if L12_38 then
          if L10_36 == "plaza" then
            L12_38(L13_39)
            L12_38()
            L12_38(L13_39)
            if L12_38 == false then
              L12_38(L13_39)
            end
            L12_38(L13_39)
            if L12_38 == false then
              L11_37.enter = true
              L12_38(L13_39)
              L13_39()
              L13_39(L14_40)
              L13_39(L14_40)
            end
          elseif L10_36 == "ship" then
            L12_38(L13_39)
            L12_38(L13_39)
          end
          L12_38(L13_39)
          repeat
            L12_38()
            if L12_38 == false then
              L12_38(L13_39)
              L12_38(L13_39)
              break
            end
          until not L12_38
          L11_37.result = L12_38
          L12_38(L13_39)
          if L10_36 == "plaza" then
            if L12_38 == nil then
            elseif L12_38 == L13_39 then
              L12_38(L13_39)
            elseif L12_38 == L13_39 then
              L12_38(L13_39)
            elseif L12_38 == L13_39 then
              L12_38(L13_39)
              L11_37.shoot = true
              L11_37.result = nil
              L11_37.photo = nil
              L12_38()
              if L12_38 == false then
                L12_38(L13_39)
                L12_38(L13_39)
              else
                L12_38(L13_39)
              end
            else
              L12_38(L13_39)
            end
          elseif L10_36 == "ship" then
            if L12_38 == nil then
            else
              if L12_38 ~= L13_39 then
              else
                if L12_38 == L13_39 then
                  L12_38(L13_39)
                  L12_38(L13_39)
                  L12_38(L13_39)
                  L11_37.shoot = true
                  L11_37.result = nil
                  L11_37.photo = nil
                  L12_38(L13_39)
                  if L12_38 == false then
                    L12_38(L13_39)
                    L12_38(L13_39)
                  end
              end
              elseif L12_38 == L13_39 then
                L12_38(L13_39)
              elseif L12_38 == L13_39 then
                L12_38(L13_39)
              elseif L12_38 == L13_39 then
                L12_38(L13_39)
              else
                L12_38(L13_39)
              end
            end
          end
        end
      else
      end
    end
    if L7_33 then
      if L7_33 == false then
        if not L7_33 then
          _plaza_move_flg = true
          L7_33()
        end
      end
    end
    if L7_33 then
      if L7_33 == false then
        if L7_33 == false then
          L7_33(L8_34)
          L7_33(L8_34)
          L7_33()
        end
        if L7_33 == false then
          if L7_33 == false then
            L7_33(L8_34)
          end
        end
      end
    end
    if L7_33 then
      if L7_33 then
        L7_33(L8_34)
        break
      end
    end
    L7_33()
  end
  L7_33(L8_34)
  L7_33(L8_34)
  L7_33(L8_34)
  L7_33(L8_34)
  L7_33(L8_34)
  for L10_36 = 1, _bandman_max do
    L11_37 = string
    L11_37 = L11_37.format
    L11_37 = L11_37(L12_38, L13_39)
    L12_38(L13_39, L14_40)
  end
  L8_34.name = "npcgen2_band_01"
  L8_34.type = "man65"
  L8_34.color_variation = 0
  L8_34.hair_variation = 0
  L8_34.node = "locator2_band_01_path_01"
  L8_34.start = true
  L9_35.name = "npcgen2_band_02"
  L9_35.type = "man65"
  L9_35.color_variation = 0
  L9_35.hair_variation = 1
  L9_35.face_tex_name = "man65_face_d"
  L9_35.node = "locator2_band_02_path_01"
  L9_35.start = true
  L10_36 = {}
  L10_36.name = "npcgen2_band_03"
  L10_36.type = "man65"
  L10_36.color_variation = 3
  L10_36.hair_variation = 1
  L10_36.face_tex_name = "man65_face_b"
  L10_36.node = "locator2_band_03_path_01"
  L10_36.start = true
  L11_37 = {}
  L11_37.name = "npcgen2_band_04"
  L11_37.type = "man63"
  L11_37.node = "locator2_band_04_path_00"
  L11_37.start = true
  L8_34(L9_35)
  L8_34()
  while true do
    if L8_34 then
      L8_34(L9_35)
      L8_34()
      break
    end
    if L8_34 == "band_move" then
      L8_34(L9_35)
      break
    end
    if L8_34 then
      L8_34(L9_35)
      if not L8_34 then
        if L8_34 ~= "band_talk" then
          L10_36 = "m16_001"
          L11_37 = 1
          L8_34(L9_35, L10_36, L11_37)
          L8_34(L9_35)
          L8_34(L9_35)
          L8_34(L9_35)
        end
        if L8_34 then
          if L8_34 ~= 0 then
            L8_34()
            L8_34()
            _band_man_until_talk = 0
            if L8_34 == false then
              L2_28 = L9_35
              L1_27 = L8_34
              L10_36 = "locator2_cam_target_03"
              L3_29 = L8_34
              L10_36 = 2
              L9_35(L10_36)
              L10_36 = "ep08_00230k"
              L9_35(L10_36)
              L10_36 = L8_34
              L9_35(L10_36)
            end
            L8_34()
            L10_36 = false
            L8_34(L9_35, L10_36)
          end
        else
          L8_34(L9_35)
          L8_34(L9_35)
          if L8_34 > 0 then
            _band_man_until_talk = L8_34
          end
        end
        while true do
          if L8_34 then
            _bandman_talk_cnt = L8_34
            if L8_34 == 1 then
              if L8_34 == false then
                L8_34(L9_35)
                L10_36 = "m17_004"
                L11_37 = 1
                L8_34(L9_35, L10_36, L11_37)
              end
            elseif L8_34 == 2 then
              if L8_34 == false then
                L8_34(L9_35)
                L10_36 = "m18_001"
                L11_37 = 1
                L8_34(L9_35, L10_36, L11_37)
              end
            elseif L8_34 == 3 then
              if L8_34 == false then
                L8_34(L9_35)
                L10_36 = "m30_007"
                L11_37 = 1
                L8_34(L9_35, L10_36, L11_37)
                L8_34(L9_35)
                _talk_range = false
                if L8_34 == false then
                  L8_34(L9_35)
                end
              end
            end
            L8_34(L9_35)
            L8_34()
            elseif L8_34 == "band_talk" then
              if L8_34 ~= 0 then
                _band_man_until_talk = 10
              end
            end
          end
        end
        L8_34()
      end
  end
  if L8_34 == false then
    L8_34()
    L8_34(L9_35)
  end
  L10_36 = "locator2_manager_move_pos_01"
  L11_37 = "locator2_manager_move_pos_02"
  L10_36 = {L11_37}
  L11_37 = "locator2_manager_move_pos_03"
  L10_36 = {}
  L10_36.anim_run = "run"
  L10_36.anim_run_speed = 1
  L10_36.runLength = -1
  L10_36.navimesh = false
  L11_37 = {}
  L11_37.anim_run = "find_ep07_00"
  L11_37.anim_run_speed = 1
  L11_37.runLength = 5
  L11_37.navimesh = false
  L10_36 = Fn_findNpc
  L11_37 = "npcgen2_band_04"
  L10_36 = L10_36(L11_37)
  L11_37 = Fn_findNpcPuppet
  L11_37 = L11_37(L12_38)
  while true do
    if not L12_38 then
      L12_38()
    end
  end
  L12_38(L13_39)
  if L12_38 then
    if L12_38 ~= nil then
      L12_38(L13_39)
      _cam_target_task_hdl = nil
    end
    L12_38(L13_39)
    L12_38(L13_39)
  else
    L12_38()
    for L15_41 = 1, 4 do
      Fn_turnNpc(_bandmanInstance[L15_41].npcName)
    end
    if L13_39 then
      L13_39(L14_40)
    end
    L13_39(L14_40)
    L13_39()
    L13_39(L14_40)
    L13_39(L14_40)
    break
  end
  L12_38(L13_39)
  for L15_41 = 1, #L13_39 do
    _soldierTable[L15_41].status = NPC_STATUS.TERMINATE
    Fn_setNpcVisible(_soldierTable[L15_41].npcName, false)
    Fn_disappearNpc(_soldierTable[L15_41].npcName, nil)
    _soldierTable[L15_41].task:abort()
    _soldierTable[L15_41].task = nil
    if _open_door_flag then
      for _FORV_19_ = 1, 3 do
        Fn_setNpcVisible(_bandmanInstance[_FORV_19_].npcName, false)
        Fn_disappearNpc(_bandmanInstance[_FORV_19_].npcName, nil)
        if _bandmanInstance[_FORV_19_] ~= nil and _bandmanInstance[_FORV_19_].task ~= nil then
          _bandmanInstance[_FORV_19_].task:abort()
          _bandmanInstance[_FORV_19_].task = nil
        end
      end
    end
  end
  if L12_38 ~= nil then
    L12_38(L13_39)
    _cam_target_task_hdl = nil
  end
  L12_38()
  L12_38(L13_39)
  L12_38(L13_39, L14_40)
  if L12_38 == false then
    for L15_41 = 1, 3 do
      Fn_warpNpc(_bandmanInstance[L15_41].npcName, string.format("locator2_warp_bandman_pos_%02d", L15_41))
    end
  end
  L12_38()
  L12_38(L13_39)
  _pdemo = nil
  L12_38(L13_39)
  L12_38(L13_39)
  L12_38(L13_39)
  if L12_38 then
    if L12_38 == false then
      L12_38(L13_39)
    end
  else
    L12_38(L13_39)
    L12_38(L13_39)
  end
  L12_38(L13_39, L14_40)
  L12_38()
  L12_38(L13_39)
  L12_38()
  L12_38()
  L12_38()
  L12_38()
end
function Finalize()
  CautionLevel.setKeepVisible(false)
  for _FORV_3_ = 1, 2 do
    if _mnavi[_FORV_3_].getActive() then
      _mnavi[_FORV_3_].setActive(false)
      _mnavi[_FORV_3_].kill()
    end
  end
  Fn_IdlingMechCannon(true)
  Fn_MechCannonShotClear()
  Fn_warshipShellingOn()
  if _se_handle then
    Sound:stopSEHandle(_se_handle)
    _se_handle = nil
  end
end
function pccubesensor2_cam_target_01_OnEnter(A0_42)
  local L1_43, L2_44
  L1_43 = Fn_naviKill
  L1_43()
  L1_43 = findGameObject2
  L2_44 = "Node"
  L1_43 = L1_43(L2_44, "locator2_cam_target_01")
  L2_44 = {}
  L2_44.RL = {
    id = "ui_event_guide_04",
    func = yes_func
  }
  Fn_gestureAction(L2_44)
end
function yes_func()
  Fn_userCtrlAllOff()
  Fn_gestureActionCancel()
  _detect_bandman = Fn_findNpcPuppet("npcgen2_band_04")
  Fn_pcSensorOff("pccubesensor2_cam_target_01")
  CautionLevel.allTerminate()
  waitSeconds(0.8)
  Fn_setKittenActive(false)
  Fn_setCatActive(false)
  _pdemo:play()
  waitSeconds(0.5)
  Fn_captionView("ep08_01025")
  Sound:playSE("m30_008", 0.5)
  while not _pdemo:isEnd() do
    wait()
  end
  waitSeconds(0.3)
  _open_door_flag = true
end
function pccubesensor2_cam_target_01_OnLeave(A0_45)
  Fn_gestureActionCancel()
  Fn_naviSet(findGameObject2("Node", "locator2_navi_04"))
end
function pccubesensor2_vertical_wall_01_OnEnter(A0_46)
  invokeTask(function()
    Fn_captionViewWait("ep08_01026")
    wait()
    Fn_lookAtObject(_npc_guard_10):abort()
  end)
  setMissionPhase("vertical_wall")
  Fn_pcSensorOff(A0_46)
end
function pccubesensor2_west_01_OnEnter(A0_47)
  setMissionPhase("west")
  Fn_pcSensorOff(A0_47)
end
function pccubesensor2_east_01_OnEnter(A0_48)
  setMissionPhase("east")
  Fn_pcSensorOff(A0_48)
end
function pccubesensor2_soldier_talk_01_OnEnter(A0_49)
  invokeTask(function()
    if _guardInstance[4].status == NPC_STATUS.NORMAL and _guardInstance[16].status == NPC_STATUS.NORMAL then
      Fn_captionViewWait("ep08_01032")
      wait()
      Fn_lookAtObject("locator2_viewpoint_06"):abort()
      Fn_captionViewWait("ep08_01033")
      setMissionPhase("talk")
      Fn_pcSensorOff(A0_49)
      if _plaza_move_flg == false then
        _plaza_move_flg = true
        npcInit_soldier()
      end
    end
  end)
end
function pccubesensor2_hint_01_OnEnter(A0_50)
  invokeTask(function()
    Fn_coercionGravityRevert()
    waitSeconds(1)
    Fn_userCtrlOff()
    Fn_captionView("ep08_01031")
    Fn_userCtrlOn()
    wait()
  end)
  Fn_pcSensorOff(A0_50)
end
function pccubesensor2_hint_02_OnEnter(A0_51)
  invokeTask(function()
    Fn_captionViewWait("ep08_01037")
    Fn_lookAtObject("locator2_viewpoint_01"):abort()
  end)
  Fn_pcSensorOff(A0_51)
end
function pccubesensor2_near_ship_01_OnEnter(A0_52)
  if _near_ship == false then
    _near_ship = true
  end
  invokeTask(function()
    Fn_captionView("ep08_01038")
  end)
  Fn_pcSensorOff(A0_52)
  Fn_pcSensorOff("pccubesensor2_soldier_talk_01")
  Fn_pcSensorOff("pccubesensor2_vertical_wall_01")
  Fn_pcSensorOff("pccubesensor2_west_01")
  Fn_pcSensorOff("pccubesensor2_east_01")
  Fn_pcSensorOff("pccubesensor2_hint_01")
end
function pccubesensormulti2_ar_safearea_01_OnLeave()
  if _processingPcReset then
    return
  end
  print("\231\160\178\230\146\131\227\130\168\227\131\170\227\130\162\227\129\171\229\133\165\227\129\163\227\129\159")
  _warcannon_safe_area = false
  Fn_warshipShellingOnAutoAlert()
  Fn_MechCannonStartBlankMode()
end
function pccubesensormulti2_ar_safearea_01_OnEnter()
  print("\229\174\137\229\133\168\227\130\168\227\131\170\227\130\162\227\129\171\229\133\165\227\129\163\227\129\159")
  _warcannon_safe_area = true
  Fn_warshipShellingOff()
end
function pccubesensor2_ar_dangerarea_01_OnEnter()
  _danger_area = true
  print("pccubesensor2_ar_dangerarea_01\227\129\171\229\133\165\227\129\163\227\129\159")
  if _guardInstance[30].status ~= NPC_STATUS.DEAD then
    _guardInstance[30]:setSightParam2(180, 180, 500)
    _guardInstance[30]:setAlertRange(500)
  end
end
function pccubesensor2_ar_dangerarea_01_OnLeave()
  _danger_area = false
  print("pccubesensor2_ar_dangerarea_01\227\130\146\229\135\186\227\129\159")
  if _guardInstance[30].status ~= NPC_STATUS.DEAD then
    _guardInstance[30]:setSightParam2(20, 20, 100)
    _guardInstance[30]:setAlertRange(3)
  end
end
function pccubesensor2_photospot_02_OnEnter()
  invokeTask(function()
    _photo_tbl.ship.photo:coercionCaption(true)
    if _photo_tbl.plaza.shoot == false then
      _photo_tbl.plaza.navi.setActive(false)
    end
  end)
end
function pccubesensor2_photospot_02_OnLeave()
  invokeTask(function()
    _photo_tbl.ship.photo:coercionCaption(false)
    if _photo_tbl.plaza.shoot == false then
      _photo_tbl.plaza.navi.setActive(true)
    end
  end)
end
function pccubesensor2_talk_range_01_OnEnter()
  local L0_53, L1_54
  _talk_range = true
end
function pccubesensor2_talk_range_01_OnLeave()
  local L0_55, L1_56
  _talk_range = false
end
function pccubesensor2_talk_range_02_OnEnter(A0_57)
  _band_talk_start_flg = true
  Fn_pcSensorOff(A0_57)
end
function pccubesensor2_indication_01_OnEnter()
  if _guardInstance[13].status ~= NPC_STATUS.DEAD then
    _guardInstance[13]:setIndicationEnable(false)
  end
  if _guardInstance[14].status ~= NPC_STATUS.DEAD then
    _guardInstance[14]:setIndicationEnable(false)
  end
  if _guardInstance[21].status ~= NPC_STATUS.DEAD then
    _guardInstance[21]:setIndicationEnable(false)
  end
  if _soldierInstance[19].status ~= NPC_STATUS.DEAD then
    _soldierInstance[19]:setIndicationEnable(false)
  end
end
function pccubesensor2_indication_01_OnLeave()
  if _guardInstance[13].status ~= NPC_STATUS.DEAD then
    _guardInstance[13]:setIndicationEnable(true)
  end
  if _guardInstance[14].status ~= NPC_STATUS.DEAD then
    _guardInstance[14]:setIndicationEnable(true)
  end
  if _guardInstance[21].status ~= NPC_STATUS.DEAD then
    _guardInstance[21]:setIndicationEnable(true)
  end
  if _soldierInstance[19].status ~= NPC_STATUS.DEAD then
    _soldierInstance[19]:setIndicationEnable(true)
  end
end
function npcInit_soldier()
  local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66
  L0_58 = {
    L1_59,
    L2_60,
    L3_61,
    L4_62,
    L5_63,
    L6_64,
    L7_65,
    L8_66,
    {
      {
        pos = "locator2_soldier_09_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_10_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_11_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_12_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_13_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_14_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_14_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_14_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_15_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_15_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_15_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_16_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_16_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_16_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_17_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_17_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_17_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_18_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_19_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_19_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_19_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_20_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_20_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_20_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_21_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_21_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_21_03",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_soldier_22_01",
        opt = nil
      },
      {
        pos = "locator2_soldier_22_02",
        opt = nil
      },
      {
        pos = "locator2_soldier_22_03",
        opt = nil
      }
    }
  }
  L1_59 = {L2_60}
  L2_60 = {}
  L2_60.pos = "locator2_soldier_01_01"
  L2_60.opt = nil
  L2_60 = {L3_61, L4_62}
  L3_61 = {}
  L3_61.pos = "locator2_soldier_02_01"
  L3_61.opt = nil
  L4_62.pos = "locator2_soldier_02_02"
  L4_62.opt = nil
  L3_61 = {L4_62}
  L4_62.pos = "locator2_soldier_03_01"
  L4_62.opt = nil
  L5_63.pos = "locator2_soldier_04_01"
  L5_63.opt = nil
  L6_64.pos = "locator2_soldier_04_02"
  L6_64.opt = nil
  L7_65 = {}
  L7_65.pos = "locator2_soldier_04_03"
  L7_65.opt = nil
  L8_66 = {}
  L8_66.pos = "locator2_soldier_04_04"
  L8_66.opt = nil
  L6_64.pos = "locator2_soldier_05_01"
  L6_64.opt = nil
  L7_65 = {}
  L7_65.pos = "locator2_soldier_05_02"
  L7_65.opt = nil
  L8_66 = {}
  L8_66.pos = "locator2_soldier_05_03"
  L8_66.opt = nil
  L7_65 = {}
  L7_65.pos = "locator2_soldier_06_01"
  L7_65.opt = nil
  L8_66 = {}
  L8_66.pos = "locator2_soldier_06_02"
  L8_66.opt = nil
  L7_65 = {L8_66}
  L8_66 = {}
  L8_66.pos = "locator2_soldier_07_01"
  L8_66.opt = nil
  L8_66 = {
    {
      pos = "locator2_soldier_08_01",
      opt = nil
    }
  }
  L1_59 = {
    L2_60,
    L3_61,
    L4_62,
    L5_63,
    L6_64,
    L7_65,
    L8_66,
    {
      {
        pos = "locator2_guard_08_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_09_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_10_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_11_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_12_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_13_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_14_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_15_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_16_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_17_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_18_01",
        opt = nil
      },
      {
        pos = "locator2_guard_18_02",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_19_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_20_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_21_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_22_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_23_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_24_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_25_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_26_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_27_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_28_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_29_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_30_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_31_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_32_01",
        opt = nil
      }
    },
    {
      {
        pos = "locator2_guard_33_01",
        opt = nil
      }
    }
  }
  L2_60 = {L3_61}
  L3_61 = {}
  L3_61.pos = "locator2_guard_01_01"
  L3_61.opt = nil
  L3_61 = {L4_62}
  L4_62.pos = "locator2_guard_02_01"
  L4_62.opt = nil
  L5_63.pos = "locator2_guard_03_01"
  L5_63.opt = nil
  L6_64.pos = "locator2_guard_04_01"
  L6_64.opt = nil
  L7_65 = {}
  L7_65.pos = "locator2_guard_05_01"
  L7_65.opt = nil
  L7_65 = {L8_66}
  L8_66 = {}
  L8_66.pos = "locator2_guard_06_01"
  L8_66.opt = nil
  L8_66 = {
    {
      pos = "locator2_guard_07_01",
      opt = nil
    }
  }
  L2_60 = {}
  L2_60.isRepeat = true
  L2_60.isRandom = true
  L3_61 = {
    L4_62,
    L5_63,
    L6_64
  }
  for L7_65 = 1, _soldier_max do
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    if L8_66 ~= nil then
      L8_66 = _soldierInstance
      L8_66 = L8_66[L7_65]
      L8_66 = L8_66.task
      if L8_66 ~= nil then
        L8_66 = _soldierInstance
        L8_66 = L8_66[L7_65]
        L8_66 = L8_66.taskAbort
        L8_66(L8_66)
      end
    end
    L8_66 = _soldierInstance
    L8_66[L7_65] = PerceivableNpc.new(_soldierName[L7_65])
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66.name = _soldierName[L7_65]
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setLoop
    L8_66(L8_66, true)
    L8_66 = _plaza_move_flg
    if L8_66 == false then
      L8_66 = _soldierInstance
      L8_66 = L8_66[L7_65]
      L8_66 = L8_66.setPosList
      L8_66(L8_66, L0_58[L7_65])
    else
      L8_66 = string
      L8_66 = L8_66.format
      L8_66 = L8_66("locator2_plaza_%02d", L7_65)
      ;({})[L7_65] = {pos = L8_66, opt = nil}
      _soldierInstance[L7_65]:terminate()
      Fn_warpNpc(_soldierInstance[L7_65].npcName, L8_66)
      _soldierInstance[L7_65]:setChangeRouteImmediately(true)
      _soldierInstance[L7_65]:setPosList(({})[L7_65])
      _soldierInstance[L7_65]:restart()
      Fn_playMotionNpc(_soldierInstance[L7_65].npcName, L3_61, false, L2_60)
    end
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setMoveOption
    L8_66(L8_66, _move_option_soldier_normal)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setChaseMoveOption
    L8_66(L8_66, _move_option_soldier_alert)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setSightParam2
    L8_66(L8_66, _NPC_SIGHT_H_DEG, _NPC_SIGHT_V_DEG, _NPC_SIGHT_LEN)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setAlertRange
    L8_66(L8_66, 3)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCautionCoefficient
    L8_66(L8_66, _NPC_CAUTION_INC, _NPC_CAUTION_DEC)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setOnChangeState
    L8_66(L8_66, soldierAction)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCombatReady
    L8_66(L8_66, true)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCombatTimeEnable
    L8_66(L8_66, true)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCombatTime
    L8_66(L8_66, 5)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setIndicationEnable
    L8_66(L8_66, true)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setIndicationRange
    L8_66(L8_66, 10)
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setIndicationCoefficient
    L8_66(L8_66, 5, 3)
    L8_66 = table
    L8_66 = L8_66.insert
    L8_66(_soldier_voice_type, {
      name = _soldierName[L7_65],
      voice_type = RandI(1, _VOICE_TYPE_MAX)
    })
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setDismissMotion
    L8_66(L8_66, "stay")
    L8_66 = _soldierInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.action
    L8_66(L8_66)
    L8_66 = Fn_findNpc
    L8_66 = L8_66(_soldierName[L7_65])
    L8_66:enableHomingTarget(true)
    L8_66:setDamage(true)
    L8_66:setKnockbackAshFlag()
    _npcTable[L7_65] = _soldierInstance[L7_65]
    _soldierTable[L7_65] = _soldierInstance[L7_65]
  end
  for L7_65 = 1, _guard_max do
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    if L8_66 ~= nil then
      L8_66 = _guardInstance
      L8_66 = L8_66[L7_65]
      L8_66 = L8_66.task
      if L8_66 ~= nil then
        L8_66 = _guardInstance
        L8_66 = L8_66[L7_65]
        L8_66 = L8_66.taskAbort
        L8_66(L8_66)
      end
    end
    L8_66 = _guardInstance
    L8_66[L7_65] = PerceivableNpc.new(_guardName[L7_65])
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66.name = _guardName[L7_65]
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setPosList
    L8_66(L8_66, L1_59[L7_65])
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setMoveOption
    L8_66(L8_66, _move_option_soldier_normal)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setLoop
    L8_66(L8_66, false)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setChaseMoveOption
    L8_66(L8_66, _move_option_soldier_alert)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setSightParam2
    L8_66(L8_66, _NPC_GUARD_SIGHT_H_DEG, _NPC_GUARD_SIGHT_V_DEG, _NPC_GUARD_SIGHT_LEN)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setAlertRange
    L8_66(L8_66, 3)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCautionCoefficient
    L8_66(L8_66, _NPC_GUARD_CAUTION_INC, _NPC_CAUTION_DEC)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setOnChangeState
    L8_66(L8_66, soldierAction)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCombatReady
    L8_66(L8_66, true)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCombatTimeEnable
    L8_66(L8_66, true)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setCombatTime
    L8_66(L8_66, 5)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setIndicationEnable
    L8_66(L8_66, true)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setIndicationRange
    L8_66(L8_66, 10)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setIndicationCoefficient
    L8_66(L8_66, 15, 3)
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.setDismissMotion
    L8_66(L8_66, "stay")
    L8_66 = _guardInstance
    L8_66 = L8_66[L7_65]
    L8_66 = L8_66.action
    L8_66(L8_66)
    L8_66 = Fn_findNpc
    L8_66 = L8_66(_guardName[L7_65])
    L8_66:enableHomingTarget(true)
    L8_66:setDamage(true)
    L8_66:setKnockbackAshFlag()
    table.insert(_soldier_voice_type, {
      name = _guardName[L7_65],
      voice_type = RandI(1, _VOICE_TYPE_MAX)
    })
    _soldierTable[L7_65 + _soldier_max] = _guardInstance[L7_65]
    _npcTable[L7_65 + _soldier_max] = _guardInstance[L7_65]
  end
  L7_65 = _soldierInstance
  L7_65 = L7_65[1]
  L8_66 = _soldierInstance
  L8_66 = L8_66[3]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _soldierInstance
  L7_65 = L7_65[7]
  L8_66 = _soldierInstance
  L8_66 = L8_66[18]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _soldierInstance
  L7_65 = L7_65[8]
  L8_66 = _soldierInstance
  L8_66 = L8_66[9]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _soldierInstance
  L7_65 = L7_65[10]
  L8_66 = _soldierInstance
  L8_66 = L8_66[13]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _soldierInstance
  L7_65 = L7_65[11]
  L8_66 = _soldierInstance
  L8_66 = L8_66[12]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[1]
  L8_66 = _guardInstance
  L8_66 = L8_66[2]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[4]
  L8_66 = _guardInstance
  L8_66 = L8_66[16]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[5]
  L8_66 = _guardInstance
  L8_66 = L8_66[23]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[7]
  L8_66 = _guardInstance
  L8_66 = L8_66[8]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[9]
  L8_66 = _guardInstance
  L8_66 = L8_66[11]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[15]
  L8_66 = _guardInstance
  L8_66 = L8_66[24]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = _guardInstance
  L7_65 = L7_65[19]
  L8_66 = _guardInstance
  L8_66 = L8_66[28]
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  if L4_62 == false then
    L4_62(L5_63, L6_64)
    L4_62(L5_63, L6_64)
    L4_62(L5_63, L6_64)
    L4_62(L5_63, L6_64)
  end
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L4_62(L5_63, L6_64)
  L7_65 = 30
  L8_66 = 60
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = 10
  L8_66 = _NPC_GUARD_SIGHT_LEN
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = 15
  L8_66 = 100
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = 30
  L8_66 = 30
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L4_62(L5_63, L6_64)
  L7_65 = 15
  L8_66 = 20
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = 20
  L8_66 = 100
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L7_65 = 25
  L8_66 = 30
  L4_62(L5_63, L6_64, L7_65, L8_66)
  L4_62(L5_63)
  L4_62(L5_63)
  L4_62()
  L4_62(L5_63)
end
function setNpcDamagedTask(A0_67, A1_68, A2_69, A3_70)
  Fn_findNpc(A0_67):setEventListener("npcDamaged", function(A0_71)
    if A3_70.status ~= NPC_STATUS.DEAD then
      print(A0_67 .. "\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\227\129\159\227\130\129" .. A1_68 .. "\227\129\174\232\173\166\230\136\146\229\186\166\227\130\146Max\227\129\171\227\129\153\227\130\139")
      soldierAction(A1_68, CALLBACK_REASON.IS_INSIGHT, true)
      A3_70:setCautionLevel(100)
      A3_70.status = NPC_STATUS.CAUTION
      turnNpc(A1_68, GetPlayer():getPos(), nil)
    end
  end)
  Fn_findNpc(A1_68):setEventListener("npcDamaged", function(A0_72)
    if A2_69.status ~= NPC_STATUS.DEAD then
      print(A1_68 .. "\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\227\129\159\227\130\129" .. A0_67 .. "\227\129\174\232\173\166\230\136\146\229\186\166\227\130\146Max\227\129\171\227\129\153\227\130\139")
      soldierAction(A0_67, CALLBACK_REASON.IS_INSIGHT, true)
      A2_69:setCautionLevel(100)
      A2_69.status = NPC_STATUS.CAUTION
      turnNpc(A0_67, GetPlayer():getPos(), nil)
    end
  end)
end
function detectedBySoldier(A0_73, A1_74)
  if _processingPcReset then
    return
  end
  _processingPcReset = true
  Fn_pcSensorOff("pccubesensor2_talk_range_01")
  _talk_range = false
  _band_talk_start_flg = false
  Fn_pcSensorOff("pccubesensor2_talk_range_02")
  print("detectedBy:" .. A0_73)
  invokeTask(function()
    local L0_75, L1_76, L2_77, L3_78, L4_79, L5_80, L6_81
    L0_75 = CautionLevel
    L0_75 = L0_75.setKeepVisible
    L1_76 = false
    L0_75(L1_76)
    L0_75 = _mechskytask
    L1_76 = L0_75
    L0_75 = L0_75.abort
    L0_75(L1_76)
    L0_75 = _se_handle
    if L0_75 then
      L0_75 = Sound
      L1_76 = L0_75
      L0_75 = L0_75.stopSEHandle
      L2_77 = _se_handle
      L0_75(L1_76, L2_77)
      _se_handle = nil
    end
    L0_75 = Fn_findAreaHandle
    L1_76 = "ar_a_root"
    L0_75 = L0_75(L1_76)
    L1_76 = Sound
    L2_77 = L1_76
    L1_76 = L1_76.playSEHandle
    L6_81 = L0_75
    L1_76 = L1_76(L2_77, L3_78, L4_79, L5_80, L6_81)
    _se_handle = L1_76
    L1_76 = findGameObject2
    L2_77 = "Puppet"
    L1_76 = L1_76(L2_77, L3_78)
    L2_77 = setPlayerIdle
    L2_77()
    L2_77 = Fn_userCtrlAllOff
    L2_77()
    L2_77 = A1_74
    if L2_77 ~= nil then
      L2_77 = A1_74
    elseif L2_77 == false then
      L2_77 = Fn_turnNpc
      L2_77(L3_78)
    end
    L2_77 = Fn_lookAtObject
    L2_77 = L2_77(L3_78)
    L3_78(L4_79)
    if L3_78 == "band_talk" then
      _band_man_until_talk = 10
      _bandman_talk_cnt = 0
    end
    L3_78(L4_79)
    L3_78(L4_79)
    L3_78(L4_79)
    L3_78(L4_79)
    L3_78(L4_79)
    L3_78(L4_79)
    L3_78(L4_79)
    L6_81 = "\227\129\139\227\130\137\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136"
    L3_78(L4_79)
    L3_78(L4_79)
    for L6_81 = 1, #L4_79 do
      if _npcTable[L6_81].npc:isEnemy() then
        _npcTable[L6_81].npc:changeNpc()
      end
      if _npcTable[L6_81].status == NPC_STATUS.DEAD then
        Fn_disappearNpc(_npcTable[L6_81].npcName)
        Fn_setupNpc({
          {
            name = _npcTable[L6_81].npcName,
            type = "soldier",
            start = true
          }
        })
        Fn_loadNpcEventMotion(_npcTable[L6_81].npcName, _sol_motion_list)
      end
      _npcTable[L6_81].npc:reset()
    end
    if L3_78 then
      if L3_78 == false then
        if L3_78 == false then
          if L3_78 ~= "plaza" then
            if L3_78 == "ship" then
            else
              L3_78(L4_79)
              _plaza_move_flg = false
              _near_ship = false
            end
          end
        end
      end
    end
    for L6_81 = 1, _soldier_max do
      if _plaza_move_flg == false then
        Fn_warpNpc(_soldierInstance[L6_81].npcName, string.format("locator2_soldier_%02d_01", L6_81))
      else
        Fn_warpNpc(_soldierInstance[L6_81].npcName, string.format("locator2_plaza_%02d", L6_81))
      end
    end
    for L6_81 = 1, _guard_max do
      Fn_warpNpc(_guardInstance[L6_81].npcName, string.format("locator2_guard_%02d_01", L6_81))
    end
    L3_78()
    if L3_78 == "band_move" then
      L4_79()
    elseif L3_78 == "band_talk" then
      L4_79()
    end
    if L4_79 then
      L6_81 = _se_handle
      L4_79(L5_80, L6_81)
      _se_handle = nil
    end
    L4_79()
    L4_79()
    L4_79()
    L4_79()
    L6_81 = false
    L4_79(L5_80, L6_81)
    L4_79(L5_80)
    L4_79(L5_80)
    if L4_79 ~= nil then
      L4_79(L5_80)
      L4_79(L5_80)
    end
    L4_79()
    L4_79(L5_80)
    L4_79(L5_80)
    L4_79()
    L4_79(L5_80)
    _processingPcReset = false
    _detected_sensor = false
    L4_79(L5_80)
    if L4_79 == false then
      L6_81 = "ep08_info_01"
      L4_79(L5_80, L6_81, false)
      _force_info_flag = true
    else
      L6_81 = "ep08_info_01"
      L4_79(L5_80, L6_81, true, 5)
    end
  end)
end
function npcInit_bandman()
  local L0_82
  L0_82 = {}
  L0_82.anim_run_speed = 0.7
  L0_82.runLength = -1
  L0_82.navimesh = false
  for _FORV_5_ = 1, _bandman_max do
    if _bandmanInstance[_FORV_5_] ~= nil and _bandmanInstance[_FORV_5_].task ~= nil then
      _bandmanInstance[_FORV_5_]:taskAbort()
    end
    _bandmanInstance[_FORV_5_] = PerceivableNpc.new(_bandmanName[_FORV_5_])
    if getMissionPhase() == "band_move" then
      _bandmanInstance[_FORV_5_]:setPosList(({
        {
          {
            pos = "locator2_band_01_path_01",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_02",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_03",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_04",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_05",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_06",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_07",
            opt = nil
          },
          {
            pos = "locator2_band_01_path_08",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_band_02_path_01",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_07",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_02",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_03",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_04",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_05",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_06",
            opt = nil
          },
          {
            pos = "locator2_band_02_path_07",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_band_03_path_01",
            opt = nil
          },
          {
            pos = "locator2_band_03_path_02",
            opt = nil
          },
          {
            pos = "locator2_band_03_path_03",
            opt = nil
          },
          {
            pos = "locator2_band_03_path_04",
            opt = nil
          },
          {
            pos = "locator2_band_03_path_05",
            opt = nil
          },
          {
            pos = "locator2_band_03_path_06",
            opt = nil
          }
        },
        {
          {
            pos = "locator2_band_04_path_01",
            opt = nil
          },
          {
            pos = "locator2_band_04_path_02",
            opt = nil
          },
          {
            pos = "locator2_band_04_path_03",
            opt = nil
          },
          {
            pos = "locator2_band_04_path_04",
            opt = nil
          },
          {
            pos = "locator2_band_04_path_05",
            opt = nil
          },
          {
            pos = "locator2_band_04_path_06",
            opt = nil
          },
          {
            pos = "locator2_band_04_path_07",
            opt = nil
          }
        }
      })[_FORV_5_])
    end
    if getMissionPhase() ~= "band_move" then
    end
    _bandmanInstance[_FORV_5_]:setCautionCoefficient(_BAND_CAUTION_INC, _BAND_CAUTION_DEC)
    _bandmanInstance[_FORV_5_]:setSightParam2(_BAND_SIGHT_H_DEG, _BAND_SIGHT_V_DEG, _BAND_SIGHT_LEN)
    _bandmanInstance[_FORV_5_]:setOnChangeState(bandmanAction)
    _bandmanInstance[_FORV_5_]:setAlertRange(7)
    _bandmanInstance[_FORV_5_]:setLoop(true)
    _bandmanInstance[_FORV_5_]:setCombatReady(false)
    _bandmanInstance[_FORV_5_]:action()
    _npcTable[_FORV_5_ + _all_soldier] = _bandmanInstance[_FORV_5_]
  end
  _FOR_[1]:setMoveOption(L0_82)
  _bandmanInstance[2]:setMoveOption(L0_82)
  _bandmanInstance[3]:setMoveOption(L0_82)
  _bandmanInstance[4]:setMoveOption(L0_82)
  if getMissionPhase() == "band_move" then
    _bandmanInstance[1]:setStayMotion("lookaround")
    _bandmanInstance[2]:setStayMotion("lookaround")
    _bandmanInstance[3]:setStayMotion("lookaround")
    _bandmanInstance[4]:setStayMotion("talk_sad_02")
  else
    _bandmanInstance[1]:setStayMotion("talk_01")
    _bandmanInstance[2]:setStayMotion("talk_02")
    _bandmanInstance[3]:setStayMotion("talk_03")
    _bandmanInstance[4]:setStayMotion("talk_sad_02")
  end
end
function detectedByBandman(A0_83)
  if _processingPcReset then
    return
  end
  _processingPcReset = true
  print("detectedBy:" .. A0_83)
  _detected_bandman_flag = true
  Fn_captionView("ep08_01036")
  _detect_bandman = Fn_findNpcPuppet(A0_83)
  if A0_83 == "npcgen2_band_01" then
    Sound:playSE("m16_002", 1, "", _detect_bandman)
  elseif A0_83 == "npcgen2_band_02" then
    Sound:playSE("m17_005", 1, "", _detect_bandman)
  elseif A0_83 == "npcgen2_band_03" then
    Sound:playSE("m18_002", 1, "", _detect_bandman)
  else
    Sound:playSE("m30_008", 1, "", _detect_bandman)
  end
  if A0_83 == "npcgen2_band_04" then
    _detected_bandmanager_flag = true
  end
end
function setMissionPhase(A0_84)
  _mission_phase = A0_84
  Fn_setCatWarpCheckPoint("locator2_restart_pos_" .. _mission_phase)
  print("\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\131\149\227\130\167\227\130\164\227\130\186\227\129\140" .. _mission_phase .. "\227\129\171\233\128\178\232\161\140")
end
function getMissionPhase()
  local L0_85, L1_86
  L0_85 = _mission_phase
  return L0_85
end
function setupMechSkyTask()
  _mechskytask = invokeTask(function()
    local L0_87, L1_88, L2_89, L3_90, L4_91, L5_92
    L0_87 = {}
    L1_88 = findGameObject2
    L1_88 = L1_88(L2_89, L3_90)
    for L5_92 = 1, 8 do
      L0_87[L5_92] = findGameObject2("EnemyBrain", string.format("mechsky_%02d", L5_92))
      repeat
        wait()
      until L0_87[L5_92]:isReadyEnemy()
    end
    L3_90(L4_91, L5_92, L2_89)
    L3_90.invincible = false
    L3_90.loop = true
    L3_90.search = true
    for _FORV_8_ = 1, 8 do
      L0_87[_FORV_8_]:move(L4_91[_FORV_8_], L3_90)
    end
  end)
end
function boxGemRestore()
  local L0_93, L1_94, L2_95, L3_96, L4_97
  L0_93 = {}
  for L4_97 = 1, _wdbx_max do
    L0_93[L4_97] = findGameObject2("GimmickBg", string.format("bg2_woodbox_%02d", L4_97))
    if L0_93[L4_97]:isBroken() then
      L0_93[L4_97]:requestRestoreForce()
      print("\230\156\168\231\174\177\229\134\141\231\148\159\228\184\173")
    end
  end
  for L4_97, _FORV_5_ in L1_94(L2_95) do
    if _gem[L4_97] ~= nil then
      _gem[L4_97]:kill()
      _gem[L4_97] = nil
      _gem[L4_97] = createGem(_restore_gem[L4_97], 4)
    end
  end
end
function eyeoff()
  local L0_98, L2_99
  for _FORV_3_ = 1, #L2_99 do
    _soldierTable[_FORV_3_]:setSightParam(0, 0)
  end
end
