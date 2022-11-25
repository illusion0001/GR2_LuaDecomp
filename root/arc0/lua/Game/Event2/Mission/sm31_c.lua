dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm31_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
CUSTOMER_STAGE = 3
queue_max = 33
spectators_max = 20
gorotsuki_battle_num_max = 6
gorotsuki_battle_num = 0
check_point_ojin = false
check_point_gorotsuki = false
battle_gorotsuki = false
trouble_area_outrange = false
battle_gorotsuki_area_out = false
SM31C_MOTION_LIST = {
  sdemo04_situp01 = "man01_sit_floor_out_01",
  sdemo04_situp02 = "man01_sit_floor_out_00"
}
ojin_caption = {
  "sm31_02000",
  "sm31_02001",
  "sm31_02002"
}
gorotsuki_caption = {
  "sm31_02003",
  "sm31_02004",
  "sm31_02005"
}
spectators_motion_man = {
  {
    "man01_lookaround_01",
    "man01_talk_angry_01",
    "man01_talk_angry_02"
  },
  {
    "man01_talk_angry_00",
    "man01_talk_angry_01",
    "man01_talk_angry_02"
  }
}
spectators_motion_chi = {
  {
    "chi01_direction_00",
    "chi01_merry_01",
    "chi01_reply_no_00"
  },
  {
    "chi01_direction_00",
    "chi01_merry_01",
    "chi01_reply_no_00"
  }
}
spectators_motion_wom = {
  {
    "wom01_talk_angry_01",
    "wom01_talk_cid_01",
    "wom01_talk_sad_02"
  },
  {
    "wom01_talk_angry_00",
    "wom01_talk_angry_01",
    "wom01_talk_angry_02"
  }
}
_bt_gen = {}
_bt_mot = {}
_bt_quarrel_flag_1 = false
_bt_quarrel_flag_2 = false
_guest__lineup_node = {}
puppets = {}
sdemo = nil
count_task = nil
caption_task = {}
courseout_task = nil
gataway_move_task = {}
gateway_move_flag = {}
is_in_sensor = false
sm31c_sdemoskip = false
float_used = false
spectators_type = {}
spectators_motion = {}
enmgen2_Quarrel_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    gorotsuki_battle_num = gorotsuki_battle_num + 1
  end
}
function Initialize()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L0_12 = Fn_userCtrlAllOff
  L0_12()
  L0_12 = {L1_13, L2_14}
  L1_13 = {}
  L1_13.name = "sdemo04_gorotuki_01"
  L1_13.type = "man79"
  L1_13.node = "locator2_sdemo04_gorotuki_down_01"
  L1_13.active = false
  L2_14 = {}
  L2_14.name = "sdemo04_gorotuki_02"
  L2_14.type = "man80"
  L2_14.node = "locator2_sdemo04_gorotuki_down_02"
  L2_14.active = false
  L1_13 = {
    L2_14,
    L3_15,
    L4_16,
    L5_17,
    L6_18,
    {
      name = "bt_mob6",
      type = "thug05",
      node = "locator2_gorotsuki_06",
      color_variation = 2,
      hair_variation = 0
    }
  }
  L2_14 = {}
  L2_14.name = "bt_mob1"
  L2_14.type = "thug04"
  L2_14.node = "locator2_gorotsuki_01"
  L2_14.color_variation = 0
  L2_14.hair_variation = 0
  L3_15.name = "bt_mob2"
  L3_15.type = "thug05"
  L3_15.node = "locator2_gorotsuki_02"
  L3_15.color_variation = 0
  L3_15.hair_variation = 0
  L4_16.name = "bt_mob3"
  L4_16.type = "thug04"
  L4_16.node = "locator2_gorotsuki_03"
  L4_16.color_variation = 1
  L4_16.hair_variation = 0
  L5_17.name = "bt_mob4"
  L5_17.type = "thug05"
  L5_17.node = "locator2_gorotsuki_04"
  L5_17.color_variation = 1
  L5_17.hair_variation = 1
  L6_18 = {}
  L6_18.name = "bt_mob5"
  L6_18.type = "thug04"
  L6_18.node = "locator2_gorotsuki_05"
  L6_18.color_variation = 2
  L6_18.hair_variation = 1
  L2_14 = Fn_setupNpc
  L2_14 = L2_14(L3_15)
  _bt_gen = L2_14
  L2_14 = {}
  L2_14.attack_00 = "man27_attack_00"
  L2_14.attack_01 = "man27_attack_01"
  L2_14.damage_small = "man27_damage_small_f_00"
  L2_14.damage_middle = "man27_damage_middle_f_00"
  L2_14.walk_r = "man27_walk_r_fighting_loop_00"
  L2_14.walk_l = "man27_walk_l_fighting_loop_00"
  L2_14.walk_f = "man27_walk_fighting_loop_00"
  L2_14.walk_b = "man27_walk_b_fighting_loop_00"
  L2_14.breath = "man27_breath_00"
  L2_14.stay = "man27_stay_fighting_00"
  _bt_mot = L2_14
  L2_14 = Fn_loadNpcEventMotion
  L2_14(L3_15, L4_16)
  L2_14 = Fn_loadNpcEventMotion
  L2_14(L3_15, L4_16)
  L2_14 = {L3_15, L4_16}
  for L6_18 = 1, spectators_max do
    table.insert(L0_12, {
      name = "spectators_" .. string.format("%02d", L6_18),
      node = "locator2_spectators_" .. string.format("%02d", L6_18),
      type = L2_14[math.random(1, #L2_14)],
      color_variation = RandI(0, 3),
      hair_variation = RandI(0, 1),
      active = false
    })
    spectators_type[L6_18] = L2_14[math.random(1, #L2_14)]
  end
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15(L4_16)
  L3_15(L4_16)
  L6_18 = true
  L3_15(L4_16, L5_17, L6_18)
  for L6_18, _FORV_7_ in L3_15(L4_16) do
    puppets[_FORV_7_.name] = Fn_findNpcPuppet(_FORV_7_.name)
  end
  for L6_18, _FORV_7_ in L3_15(L4_16) do
    puppets[_FORV_7_.name] = Fn_findNpcPuppet(_FORV_7_.name)
  end
  sdemo = L3_15
  L3_15()
  L3_15()
  L6_18 = "dt_a_root"
  L6_18 = {}
  L6_18.camera = true
  L6_18.scene_param = false
  sm31_publicity_pdemo = L3_15
  L3_15(L4_16, L5_17)
  L3_15()
  _foodcart_hdl = L3_15
  L3_15(L4_16, L5_17)
  L3_15(L4_16, L5_17)
  L6_18 = 1.25
  _guest__lineup_node = L3_15
end
function Ingame()
  local L0_19, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36
  while true do
    L0_19 = sm31_publicity_pdemo
    L1_20 = L0_19
    L0_19 = L0_19.isLoading
    L0_19 = L0_19(L1_20)
    if L0_19 == false then
      L0_19 = wait
      L0_19()
    end
  end
  L0_19 = sm31_WarpNpcToLine
  L1_20 = _guest__lineup_node
  L0_19(L1_20)
  L0_19 = RAC_setCostumeWait
  L1_20 = "kit08"
  L0_19(L1_20, L2_21)
  L0_19 = Fn_disableCostumeChange
  L1_20 = true
  L0_19(L1_20)
  L0_19 = Fn_loadPlayerMotion
  L1_20 = _event_pc_motion_table
  L0_19(L1_20)
  L0_19, L1_20 = nil, nil
  for L5_24 = 1, 20 do
    L12_31 = spectators_type
    L12_31 = L12_31[L5_24]
    L13_32 = "man"
    if L11_30 ~= nil then
    end
    L12_31 = spectators_type
    L12_31 = L12_31[L5_24]
    L13_32 = "wom"
    if L11_30 ~= nil then
    end
    L12_31 = spectators_type
    L12_31 = L12_31[L5_24]
    L13_32 = "chi"
    if L11_30 ~= nil then
    end
    L11_30.sm31sdemo_motion_02 = L10_29
    L12_31 = spectators_motion
    L12_31[L5_24] = L10_29
    L12_31 = Fn_loadNpcEventMotion
    L13_32 = L6_25
    L12_31(L13_32, L14_33)
  end
  L2_21(L3_22, L4_23)
  L2_21(L3_22, L4_23)
  L2_21(L3_22)
  for L6_25 = 1, #L4_23 do
    if L7_26 == 0 then
      L12_31 = "man"
      L12_31 = "wom"
      L12_31 = "chi"
      L12_31 = "kid"
      L12_31 = RAC_GetTableLength
      L13_32 = _line_up_motion
      L13_32 = L13_32[L9_28]
      L17_36 = L12_31(L13_32)
      L12_31 = string
      L12_31 = L12_31.format
      L13_32 = "%02d"
      L12_31 = L12_31(L13_32, L14_33)
      L12_31 = Fn_playMotionNpc
      L13_32 = customers_setting_table
      L13_32 = L13_32[L14_33]
      L13_32 = L13_32[L7_26]
      L13_32 = L13_32.name
      L12_31(L13_32, L14_33, L15_34)
    end
  end
  L3_22()
  if L4_23 == false then
    L4_23()
  end
  for L9_28, L10_29 in L6_25(L7_26) do
    L12_31 = L10_29
    L13_32 = false
    L11_30(L12_31, L13_32)
    L12_31 = L10_29
    L13_32 = true
    L11_30(L12_31, L13_32)
    L12_31 = L10_29
    L13_32 = 1
    L11_30(L12_31, L13_32)
    L12_31 = L10_29
    L13_32 = L5_24
    L11_30(L12_31, L13_32)
  end
  L6_25(L7_26, L8_27)
  L6_25(L7_26, L8_27)
  L6_25()
  L7_26(L8_27)
  L7_26(L8_27, L9_28, L10_29)
  customers_task = L7_26
  come_out_interval_task = L7_26
  count_task = L7_26
  courseout_task = L7_26
  L7_26(L8_27)
  L17_36 = L8_27(L9_28, L10_29)
  L7_26(L8_27, L9_28, L10_29, L11_30, L12_31, L13_32, L14_33, L15_34, L16_35, L17_36, L8_27(L9_28, L10_29))
  while true do
    if not L7_26 then
      if L7_26 == false then
        if L7_26 == true then
          if L7_26 == nil then
            L7_26[1] = L8_27
          end
        end
        if L7_26 == true then
          if L7_26 ~= nil then
            L7_26(L8_27)
            L7_26[1] = nil
          end
          if L7_26 == nil then
            L7_26[2] = L8_27
          end
        end
      end
      L7_26()
    end
  end
  L7_26(L8_27)
  for L10_29 = 1, #L8_27 do
    if L11_30 ~= nil then
      L12_31 = L11_30
      L11_30(L12_31)
      L11_30[L10_29] = nil
    end
  end
  L7_26()
  L7_26(L8_27, L9_28)
  L7_26(L8_27)
  L7_26()
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  battle_gorotsuki = true
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27)
  for L10_29 = 1, queue_max do
    L12_31 = invokeTask
    function L13_32()
      local L0_37, L1_38
      L0_37 = Fn_findNpcPuppet
      L1_38 = "customers_queue_"
      L1_38 = L1_38 .. string.format("%02d", L10_29)
      L0_37 = L0_37(L1_38)
      L1_38 = math
      L1_38 = L1_38.random
      L1_38 = L1_38(1, 3)
      gateway_move_flag[L10_29] = false
      while true do
        if Fn_getDistanceToPlayer(L0_37) < 4 then
          gateway_move_flag[L10_29] = true
          break
        end
        if gateway_move_flag[L10_29 - 1] == true then
          gateway_move_flag[L10_29] = true
          break
        end
        wait()
      end
      Fn_moveNpc("customers_queue_" .. string.format("%02d", L10_29), {
        "locator2_Getaway_" .. string.format("%02d", L1_38)
      })
    end
    L12_31 = L12_31(L13_32)
    L11_30[L10_29] = L12_31
    break
  end
  L7_26(L8_27)
  while true do
    if L7_26 <= L8_27 then
      L7_26()
    end
  end
  L7_26(L8_27)
  courseout_task = nil
  L7_26()
  L7_26()
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  for L10_29 = 1, queue_max do
    L12_31 = L11_30
    L11_30(L12_31)
    L11_30[L10_29] = nil
    L12_31 = "customers_queue_"
    L13_32 = string
    L13_32 = L13_32.format
    L13_32 = L13_32(L14_33, L15_34)
    L12_31 = L12_31 .. L13_32
    L13_32 = false
    L11_30(L12_31, L13_32)
  end
  L7_26(L8_27)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28)
  L7_26(L8_27, L9_28, L10_29)
  L7_26(L8_27, L9_28, L10_29)
  for L10_29 = 1, spectators_max do
    L12_31 = "spectators_"
    L13_32 = string
    L13_32 = L13_32.format
    L13_32 = L13_32(L14_33, L15_34)
    L12_31 = L12_31 .. L13_32
    L13_32 = true
    L11_30(L12_31, L13_32)
  end
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26(L8_27, L9_28)
  L7_26(L8_27)
  L7_26(L8_27)
  L7_26()
  L7_26()
  L7_26()
  L9_28(L10_29, L11_30)
  L9_28(L10_29)
  for L12_31 = 1, spectators_max do
    L13_32 = "spectators_"
    L13_32 = L13_32 .. L14_33
    L14_33.watchTarget = true
    L17_36 = "locator2_TV"
    L15_34(L16_35, L17_36, L14_33)
  end
  L9_28(L10_29)
  for L12_31 = 1, spectators_max do
    L13_32 = "spectators_"
    L13_32 = L13_32 .. L14_33
    L14_33(L15_34)
  end
  while true do
    if L9_28 == false then
      L9_28()
    end
  end
  L9_28(L10_29)
  L12_31 = {}
  L13_32 = 0.1
  L14_33(L15_34)
  L14_33()
  L14_33(L15_34)
  L14_33(L15_34, L16_35)
  L14_33(L15_34, L16_35)
  L14_33()
  L14_33(L15_34)
  for L17_36 = 1, spectators_max do
    Fn_setNpcActive("spectators_" .. string.format("%02d", L17_36), false)
  end
  L14_33(L15_34, L16_35)
  L14_33(L15_34, L16_35)
  L14_33(L15_34)
  L14_33(L15_34, L16_35)
  L14_33(L15_34, L16_35)
  L14_33(L15_34, L16_35)
  L14_33(L15_34)
  L17_36 = "locator2_sdemo04_aim_03"
  L14_33(L15_34, L16_35, L17_36, false, Vector(0, 1.5, 0))
  L14_33(L15_34)
  L14_33(L15_34, L16_35)
  L14_33()
  L14_33(L15_34)
  L14_33(L15_34, L16_35)
  L14_33()
  L14_33()
  L14_33()
  L14_33()
  L14_33()
end
function Finalize()
  local L0_39, L1_40, L2_41, L3_42, L4_43
  for L3_42, L4_43 in L0_39(L1_40) do
    Fn_disappearNpc(L4_43)
  end
  L0_39(L1_40, L2_41)
  L0_39()
  L0_39(L1_40)
  L3_42 = false
  L0_39(L1_40, L2_41, L3_42)
  L0_39()
  L0_39()
  L0_39()
  L0_39(L1_40)
end
function sm31_Trouble_Area_Check()
  return invokeTask(function()
    local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50
    while true do
      L0_44 = trouble_area_outrange
      if L0_44 == true then
        L0_44 = Fn_userCtrlOff
        L0_44()
        L0_44 = Fn_captionViewWait
        L0_44(L1_45)
        L0_44 = Fn_blackout
        L0_44()
        L0_44 = battle_gorotsuki
        if L0_44 == true then
          L0_44 = findGameObject2
          L0_44 = L0_44(L1_45, L2_46)
          for L4_48, L5_49 in L1_45(L2_46) do
            L6_50 = Fn_disappearNpc
            L6_50(L5_49)
          end
          gorotsuki_battle_num = 0
          L2_46.name = "bt_mob1"
          L2_46.type = "thug04"
          L2_46.node = "locator2_gorotsuki_01"
          L2_46.color_variation = 0
          L2_46.hair_variation = 0
          L2_46.start = true
          L3_47.name = "bt_mob2"
          L3_47.type = "thug05"
          L3_47.node = "locator2_gorotsuki_02"
          L3_47.color_variation = 0
          L3_47.hair_variation = 0
          L3_47.start = true
          L4_48.name = "bt_mob3"
          L4_48.type = "thug04"
          L4_48.node = "locator2_gorotsuki_03"
          L4_48.color_variation = 1
          L4_48.hair_variation = 0
          L4_48.start = true
          L5_49 = {}
          L5_49.name = "bt_mob4"
          L5_49.type = "thug05"
          L5_49.node = "locator2_gorotsuki_04"
          L5_49.color_variation = 1
          L5_49.hair_variation = 1
          L5_49.start = true
          L6_50 = {}
          L6_50.name = "bt_mob5"
          L6_50.type = "thug04"
          L6_50.node = "locator2_gorotsuki_05"
          L6_50.color_variation = 2
          L6_50.hair_variation = 1
          L6_50.start = true
          _bt_gen = L2_46
          for L5_49, L6_50 in L2_46(L3_47) do
            while not Fn_findNpc(L6_50):isStarted() do
              wait()
            end
            L6_50:setDamage(true)
            L6_50:changeDamageType(1)
            L6_50:setEnemyGenerator(L0_44)
            L6_50:changeEnemy()
          end
          L2_46(L3_47)
        else
          L0_44 = Fn_resetPcPos
          L0_44(L1_45)
        end
        trouble_area_outrange = false
        L0_44 = Fn_userCtrlOn
        L0_44()
        L0_44 = Fn_fadein
        L0_44()
      end
      L0_44 = wait
      L0_44()
    end
  end)
end
function trouble_attack(A0_51, A1_52, A2_53)
  local L3_54, L4_55, L5_56, L6_57
  if A2_53 == nil then
    A2_53 = false
  end
  L3_54 = Fn_findNpc
  L4_55 = A0_51.name
  L3_54 = L3_54(L4_55)
  L4_55 = Fn_findNpc
  L5_56 = A1_52.name
  L4_55 = L4_55(L5_56)
  L6_57 = L3_54
  L5_56 = L3_54.turn
  L5_56(L6_57, Fn_findNpcPuppet(A1_52.name):getWorldPos())
  L6_57 = L4_55
  L5_56 = L4_55.turn
  L5_56(L6_57, Fn_findNpcPuppet(A0_51.name):getWorldPos())
  repeat
    L5_56 = wait
    L5_56()
    L6_57 = L3_54
    L5_56 = L3_54.isTurnEnd
    L5_56 = L5_56(L6_57)
  until L5_56
  repeat
    L5_56 = wait
    L5_56()
    L6_57 = L4_55
    L5_56 = L4_55.isTurnEnd
    L5_56 = L5_56(L6_57)
  until L5_56
  L5_56, L6_57 = nil, nil
  if A2_53 == false then
    L5_56 = _bt_mot.attack_00
    L6_57 = _bt_mot.damage_small
  else
    L5_56 = _bt_mot.attack_01
    L6_57 = _bt_mot.damage_middle
  end
  Sound:playSE(A0_51.atk_se, 1, "", Fn_findNpcPuppet(A0_51.name))
  Fn_playMotionNpc(A0_51.name, L5_56, false, {animBlendDuration = 0.2, isStop = true})
  wait(16)
  Sound:playSE(A1_52.dmg_se, 1, "", Fn_findNpcPuppet(A1_52.name))
  Fn_playMotionNpc(A1_52.name, L6_57, true, {animBlendDuration = 0.2, isStop = true})
  Fn_playMotionNpc(A1_52.name, _bt_mot.stay, false, {animBlendDuration = 0.2})
end
function trouble_scene_random(A0_58, A1_59, A2_60)
  if A2_60 == nil then
    A2_60 = 0
  end
  if RandI(100) <= 50 + A2_60 then
  else
  end
  return A1_59
end
function repos(A0_61, A1_62, A2_63)
  if A2_63 == nil then
    A2_63 = 1.3
  end
  if Fn_moveNpc(A0_61, {A1_62}, {
    anim_walk = _bt_mot.walk_f,
    arrivedLength = A2_63
  }) ~= nil then
    while Fn_moveNpc(A0_61, {A1_62}, {
      anim_walk = _bt_mot.walk_f,
      arrivedLength = A2_63
    }):isRunning() do
      wait()
    end
    Fn_moveNpc(A0_61, {A1_62}, {
      anim_walk = _bt_mot.walk_f,
      arrivedLength = A2_63
    }):abort()
  end
end
function sm31_Trouble_fight_scene()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69
  L0_64 = nil
  L1_65 = "wait"
  L2_66 = 0
  L3_67 = findGameObject2
  L4_68 = "Node"
  L5_69 = "pccubesensor2_Quarrel_Goal"
  L3_67 = L3_67(L4_68, L5_69)
  L4_68 = L3_67
  L3_67 = L3_67.getWorldPos
  L3_67 = L3_67(L4_68)
  L4_68 = {}
  L4_68.name = "bt_mob1"
  L4_68.atk_se = "m34_923"
  L4_68.dmg_se = "m34_505a"
  L5_69 = {}
  L5_69.name = "bt_mob2"
  L5_69.atk_se = "m35_923"
  L5_69.dmg_se = "m35_505a"
  return invokeTask(function()
    local L0_70, L1_71, L2_72, L3_73
    while true do
      L0_70 = Fn_findNpcPuppet
      L1_71 = L4_68.name
      L0_70 = L0_70(L1_71)
      L1_71 = Fn_findNpcPuppet
      L2_72 = L5_69.name
      L1_71 = L1_71(L2_72)
      L2_72 = L1_65
      if L2_72 == "wait" then
        L2_72 = Fn_playMotionNpc
        L3_73 = L4_68.name
        L2_72(L3_73, _bt_mot.stay, false, {animBlendDuration = 0.3})
        L2_72 = Fn_playMotionNpc
        L3_73 = L5_69.name
        L2_72(L3_73, _bt_mot.stay, false, {animBlendDuration = 0.3})
        L2_72 = waitSeconds
        L3_73 = 3
        L2_72(L3_73)
        L2_72 = "wait"
        L0_64 = L2_72
        L2_72 = trouble_scene_random
        L3_73 = "A_attack"
        L2_72 = L2_72(L3_73, "B_attack")
        L1_65 = L2_72
      else
        L2_72 = L1_65
        if L2_72 == "A_attack" then
          L2_72 = trouble_attack
          L3_73 = L4_68
          L2_72(L3_73, L5_69)
          L2_72 = L1_65
          L0_64 = L2_72
          L2_72 = trouble_scene_random
          L3_73 = "A_attack"
          L2_72 = L2_72(L3_73, "B_attack", L2_66)
          L1_65 = L2_72
          L2_72 = L1_65
          L3_73 = L0_64
          if L2_72 == L3_73 then
            L2_72 = "A_combo"
            L1_65 = L2_72
          end
        else
          L2_72 = L1_65
          if L2_72 == "B_attack" then
            L2_72 = trouble_attack
            L3_73 = L5_69
            L2_72(L3_73, L4_68)
            L2_72 = L1_65
            L0_64 = L2_72
            L2_72 = trouble_scene_random
            L3_73 = "A_attack"
            L2_72 = L2_72(L3_73, "B_attack", L2_66)
            L1_65 = L2_72
            L2_72 = L1_65
            L3_73 = L0_64
            if L2_72 == L3_73 then
              L2_72 = "B_combo"
              L1_65 = L2_72
            end
          else
            L2_72 = L1_65
            if L2_72 == "A_combo" then
              L2_72 = trouble_attack
              L3_73 = L4_68
              L2_72(L3_73, L5_69, true)
              L2_72 = Fn_playMotionNpc
              L3_73 = L4_68.name
              L2_72(L3_73, _bt_mot.stay, false, {animBlendDuration = 0.3})
              L2_72 = repos
              L3_73 = L5_69.name
              L2_72(L3_73, L0_70:getWorldPos())
              L2_72 = Fn_findNpc
              L3_73 = L4_68.name
              L2_72 = L2_72(L3_73)
              L3_73 = Fn_findNpc
              L3_73 = L3_73(L5_69.name)
              L2_72:turn(Fn_findNpcPuppet(L5_69.name):getWorldPos())
              L3_73:turn(Fn_findNpcPuppet(L4_68.name):getWorldPos())
              Fn_playMotionNpc(L4_68.name, _bt_mot.stay, false, {animBlendDuration = 0.3})
              Fn_playMotionNpc(L5_69.name, _bt_mot.stay, false, {animBlendDuration = 0.3})
              L0_64 = L1_65
              L1_65 = "B_walk_f"
              L2_66 = 0
            else
              L2_72 = L1_65
              if L2_72 == "B_combo" then
                L2_72 = trouble_attack
                L3_73 = L5_69
                L2_72(L3_73, L4_68, true)
                L2_72 = Fn_playMotionNpc
                L3_73 = L4_68.name
                L2_72(L3_73, _bt_mot.stay, false, {animBlendDuration = 0.3})
                L2_72 = repos
                L3_73 = L4_68.name
                L2_72(L3_73, L1_71:getWorldPos())
                L2_72 = Fn_findNpc
                L3_73 = L4_68.name
                L2_72 = L2_72(L3_73)
                L3_73 = Fn_findNpc
                L3_73 = L3_73(L5_69.name)
                Fn_playMotionNpc(L4_68.name, _bt_mot.stay, false, {animBlendDuration = 0.3})
                Fn_playMotionNpc(L5_69.name, _bt_mot.stay, false, {animBlendDuration = 0.3})
                L0_64 = L1_65
                L1_65 = "A_walk_f"
                L2_66 = 0
              else
                L2_72 = L1_65
                if L2_72 == "A_walk_f" then
                  L2_72 = Fn_get_distance
                  L3_73 = L0_70.getWorldPos
                  L3_73 = L3_73(L0_70)
                  L2_72 = L2_72(L3_73, L3_67)
                  L3_73 = print
                  L3_73("\230\149\145\230\184\136A..........." .. L2_72)
                  L3_73 = L2_72 - 1
                  print("\230\149\145\230\184\136A.....atk_cnt....." .. L3_73)
                  while L3_73 > 0 do
                    wait()
                    L3_73 = L3_73 - 1
                    trouble_attack(L4_68, L5_69)
                  end
                  trouble_attack(L4_68, L5_69, true)
                  repos(L5_69.name, L0_70:getWorldPos())
                  L0_64 = L1_65
                  L2_72 = Fn_get_distance(L1_71:getWorldPos(), L3_67)
                  print("\227\129\169\227\129\163\227\129\161\232\161\140\227\129\143..........." .. L2_72)
                  if L2_72 > 2.5 then
                    L1_65 = "B_walk_f"
                  else
                    L1_65 = "B_attack"
                  end
                else
                  L2_72 = L1_65
                  if L2_72 == "B_walk_f" then
                    L2_72 = Fn_get_distance
                    L3_73 = L1_71.getWorldPos
                    L3_73 = L3_73(L1_71)
                    L2_72 = L2_72(L3_73, L3_67)
                    L3_73 = print
                    L3_73("\230\149\145\230\184\136B..........." .. L2_72)
                    L3_73 = L2_72 - 1
                    print("\230\149\145\230\184\136B.....atk_cnt....." .. L3_73)
                    while L3_73 > 0 do
                      wait()
                      L3_73 = L3_73 - 1
                      trouble_attack(L5_69, L4_68)
                    end
                    trouble_attack(L5_69, L4_68, true)
                    repos(L4_68.name, L1_71:getWorldPos())
                    L0_64 = L1_65
                    L2_72 = Fn_get_distance(L0_70:getWorldPos(), L3_67)
                    print("\227\129\169\227\129\163\227\129\161\232\161\140\227\129\143..........." .. L2_72)
                    if L2_72 > 2.5 then
                      L1_65 = "A_walk_f"
                    else
                      L1_65 = "A_attack"
                    end
                  else
                    L2_72 = L1_65
                    if L2_72 == "retrun" then
                      L2_72 = repos
                      L3_73 = L4_68.name
                      L2_72(L3_73, "locator2_gorotsuki_01", 0.1)
                      L2_72 = repos
                      L3_73 = L5_69.name
                      L2_72(L3_73, "locator2_gorotsuki_02", 0.1)
                      L2_72 = 0
                      L2_66 = L2_72
                      L2_72 = L1_65
                      L0_64 = L2_72
                      L2_72 = trouble_scene_random
                      L3_73 = "A_attack"
                      L2_72 = L2_72(L3_73, "B_attack")
                      L1_65 = L2_72
                      battle_gorotsuki_area_out = false
                    end
                  end
                end
              end
            end
          end
        end
      end
      L2_72 = battle_gorotsuki_area_out
      if L2_72 then
        L2_72 = "retrun"
        L1_65 = L2_72
      end
      L2_72 = print
      L3_73 = "\230\172\161\227\129\174\227\131\149\227\130\167\227\131\188\227\130\186............."
      L3_73 = L3_73 .. L1_65
      L2_72(L3_73)
      L2_72 = wait
      L2_72()
    end
  end)
end
function sm31_captiontask(A0_74)
  local L1_75
  L1_75 = nil
  return invokeTask(function()
    local L0_76, L2_77, L3_78
    for _FORV_3_ = 1, #L2_77 do
      Fn_captionViewWait(A0_74[_FORV_3_])
    end
  end)
end
function pccubesensor2_Quarrel_Start_OnLeave()
  local L0_79, L1_80
  check_point_ojin = true
end
function pccubesensor2_Quarrel_CheckPoint_OnEnter()
  local L0_81, L1_82
  check_point_gorotsuki = true
end
function pccubesensor2_Quarrel_CheckPoint_OnLeave()
  local L0_83, L1_84
end
function pccubesensor2_Quarrel_Goal_OnEnter()
  local L0_85, L1_86
  is_in_sensor = true
end
function pccubesensor2_Quarrel_Goal_OnLeave()
  local L0_87, L1_88
  is_in_sensor = false
end
function pccubesensor2_Trouble_Area_01_OnEnter()
  local L0_89, L1_90
  trouble_area_outrange = false
end
function pccubesensor2_Trouble_Area_01_OnLeave()
  local L0_91, L1_92
  trouble_area_outrange = true
end
function pccubesensor2_Trouble_Area_02_OnEnter()
  local L0_93, L1_94
  trouble_area_outrange = false
end
function pccubesensor2_Trouble_Area_02_OnLeave()
  local L0_95, L1_96
  trouble_area_outrange = true
end
function cubesensor2_bt_area_out_OnLeave(A0_97, A1_98)
  battle_gorotsuki_area_out = true
  print("......" .. A1_98:getName())
end
