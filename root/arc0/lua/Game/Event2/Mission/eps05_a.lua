import("Area")
import("Vehicle")
import("Wind")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/area_controller.lua")
_area_tbl = {}
_small_tbl = {}
_bu_small = {
  "bu_a_01",
  "bu_a_04",
  "bu_a_05",
  "bu_a_07",
  "bu_a_08",
  "bu_a_11",
  "bu_a_18"
}
_area_ctrls = {}
_gull_task = {}
_gull_follow_end = false
_man32_action_start = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_missionViewEnd
  L0_0()
  L0_0 = Fn_missionInfoEnd
  L0_0()
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_loadEventData
  L1_1 = "evx/bu_d_goto_po_setup"
  L2_2 = nil
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_findAreaHandle
  L1_1 = "bu_d_root"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.getDescendant
  L1_1 = L1_1(L2_2)
  L2_2 = Fn_findAreaHandle
  L2_2 = L2_2(L3_3)
  is_bu_small = L3_3
  for L6_6, L7_7 in L3_3(L4_4) do
    L9_9 = L7_7
    L8_8 = L7_7.getName
    L8_8 = L8_8(L9_9)
    L9_9 = is_bu_small
    L9_9 = L9_9(L8_8)
    if L9_9 == false then
      L9_9 = _area_tbl
      L9_9[L8_8] = L7_7
    else
      L9_9 = _small_tbl
      L9_9[L8_8] = L7_7
    end
  end
  L4_4[L3_3] = L2_2
  for L7_7, L8_8 in L4_4(L5_5) do
    L9_9 = L8_8.getName
    L9_9 = L9_9(L8_8)
    _area_ctrls[L9_9] = AreaController.create(L9_9)
    _area_ctrls[L9_9]:load(L9_9 .. "_goto_po")
    _area_ctrls[L9_9]:warp("locator2_" .. L9_9 .. "_start")
    L8_8:setExpandedAabb(true)
  end
  L4_4(L5_5, L6_6, L7_7)
  L5_5.name = "driver"
  L5_5.type = "man34"
  L5_5.node = "locator2_man34_01"
  L5_5.attach = false
  L5_5.disable_collision = true
  L6_6.name = "worker"
  L6_6.type = "man36"
  L6_6.node = "locator2_man36_01"
  L6_6.attach = false
  L6_6.disable_collision = true
  L7_7.name = "man_bu_01"
  L7_7.type = "man_bu"
  L7_7.node = "locator2_man_bu_01"
  L7_7.attach = false
  L8_8 = {}
  L8_8.name = "man_bu_02"
  L8_8.type = "man_bu"
  L8_8.node = "locator2_man_bu_02"
  L8_8.attach = false
  L8_8.anim_name = "check_00"
  L9_9 = {}
  L9_9.name = "man_bu_03"
  L9_9.type = "man_bu"
  L9_9.node = "locator2_man_bu_03"
  L9_9.attach = false
  L9_9.anim_name = "lookaround_01"
  L5_5(L6_6)
  L5_5(L6_6, L7_7)
  for L8_8, L9_9 in L5_5(L6_6) do
    L9_9:setEffectiveness(false, true)
  end
  L5_5(L6_6, L7_7)
  L5_5(L6_6)
  L8_8 = true
  L6_6(L7_7, L8_8)
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = Fn_loadNpcEventMotion
  L0_10(L1_11, L2_12)
  L0_10 = {}
  L1_11(L2_12)
  for L4_14, L5_15 in L1_11(L2_12) do
    L6_16 = _area_ctrls
    L6_16 = L6_16[L4_14]
    L7_17 = L6_16
    L6_16 = L6_16.setPlayParam
    L8_18 = {}
    L8_18.ratio = 0.5
    L6_16(L7_17, L8_18)
    L6_16 = _area_ctrls
    L6_16 = L6_16[L4_14]
    L7_17 = L6_16
    L6_16 = L6_16.cue
    L6_16(L7_17)
  end
  L1_11(L2_12, L3_13)
  L3_13(L4_14)
  for L6_16, L7_17 in L3_13(L4_14) do
    L8_18 = _gull_task
    L8_18[L6_16] = L9_19
  end
  L6_16 = 0
  L7_17 = 0
  L8_18 = 0
  L3_13(L4_14, L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = false
  L3_13(L4_14, L5_15, L6_16)
  L6_16 = "rudder"
  L6_16 = "rudder"
  L4_14(L5_15, L6_16)
  L6_16 = "rudder"
  L7_17 = false
  L4_14(L5_15, L6_16, L7_17)
  L6_16 = "talk_00"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_01"
  L8_18 = 10
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = "talk_01"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_00"
  L8_18 = 10
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = "man01_repair_00"
  L7_17 = false
  L8_18 = {}
  L8_18.isRepeat = true
  L4_14(L5_15, L6_16, L7_17, L8_18)
  L6_16 = "talk_00"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_01"
  L8_18 = 10
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = "talk_00"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_01"
  L8_18 = 10
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = "wom01_talk_cid_00"
  L7_17 = false
  L8_18 = {}
  L8_18.isRepeat = true
  L4_14(L5_15, L6_16, L7_17, L8_18)
  L6_16 = "wom01_talk_cid_02"
  L7_17 = false
  L8_18 = {}
  L8_18.isRepeat = true
  L4_14(L5_15, L6_16, L7_17, L8_18)
  L6_16 = "man01_shipland_00"
  L7_17 = false
  L8_18 = {}
  L8_18.isRepeat = true
  L4_14(L5_15, L6_16, L7_17, L8_18)
  L6_16 = "wavehand_far_00"
  L7_17 = false
  L8_18 = {}
  L8_18.isRepeat = true
  L4_14(L5_15, L6_16, L7_17, L8_18)
  L6_16 = "man01_shipland_00"
  L7_17 = false
  L8_18 = {}
  L8_18.isRepeat = true
  L4_14(L5_15, L6_16, L7_17, L8_18)
  L6_16 = "talk_00"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_01"
  L8_18 = 10
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = "talk_01"
  L7_17 = {L8_18, L9_19}
  L8_18 = "talk_00"
  L8_18 = 10
  L4_14(L5_15, L6_16, L7_17, L8_18, L9_19)
  L6_16 = "npcgen2_man35_01"
  L7_17 = "talk_00"
  L8_18 = {L9_19, L10_20}
  L5_15(L6_16, L7_17, L8_18, L9_19, L10_20)
  L6_16 = "npcgen2_man33_01"
  L7_17 = "talk_01"
  L8_18 = {L9_19, L10_20}
  L5_15(L6_16, L7_17, L8_18, L9_19, L10_20)
  L6_16 = Fn_missionStart
  L6_16()
  function L6_16()
    Fn_findAreaHandle("ve_crane_root"):setSceneParameters("po_a_root")
    for _FORV_4_, _FORV_5_ in pairs(_area_ctrls) do
      _area_ctrls[_FORV_4_]:play()
    end
    ji_set_visible(true)
    Vehicle:setVisible(true)
    Wind:setWind()
  end
  ji_visible = L6_16
  L6_16 = waitSeconds
  L7_17 = 2.5
  L6_16(L7_17)
  L6_16 = Fn_kaiwaDemoView2
  L7_17 = "eps05_00010k"
  L8_18 = ji_visible
  L6_16(L7_17, L8_18, L9_19)
  L6_16 = Fn_findNpc
  L7_17 = "npcgen2_cid01_01"
  L6_16 = L6_16(L7_17)
  L7_17 = findGameObject2
  L8_18 = "Node"
  L7_17 = L7_17(L8_18, L9_19)
  L8_18 = Camera
  L8_18 = L8_18.lookTo
  L12_22 = 2
  L8_18(L9_19, L10_20, L11_21, L12_22)
  L8_18 = Fn_turnNpc
  L8_18(L9_19, L10_20)
  L8_18 = Fn_playerTurn
  L8_18(L9_19)
  L8_18 = waitSeconds
  L8_18(L9_19)
  L8_18 = Fn_playerTurnEnd
  L8_18()
  L8_18 = invokeTask
  L8_18 = L8_18(L9_19)
  L9_19()
  L9_19(L10_20)
  if L9_19 ~= nil then
    if L9_19 == true then
      L9_19(L10_20)
    end
  end
  L4_14[3] = nil
  _man32_action_start = true
  L9_19(L10_20)
  _gull_follow_end = true
  L9_19(L10_20)
  for L12_22, L13_23 in L9_19(L10_20) do
    if L13_23 ~= nil and L13_23:isRunning() == true then
      L13_23:abort()
    end
  end
  for L12_22, L13_23 in L9_19(L10_20) do
    L13_23:try_term()
  end
  L0_10 = L9_19
  if L5_15 ~= nil then
    if L9_19 == true then
      L9_19(L10_20)
    end
  end
  for L12_22, L13_23 in L9_19(L10_20) do
    if L13_23 ~= nil and L13_23:isRunning() == true then
      L13_23:abort()
    end
    Fn_disappearNpc("gull_" .. L12_22)
  end
  _gull_task = L9_19
  for L12_22, L13_23 in L9_19(L10_20) do
    if L13_23:isPlayEnd() == false then
      L13_23:stop()
    end
  end
  L9_19()
  for L12_22, L13_23 in L9_19(L10_20) do
    L13_23:setEffectiveness(true, true)
  end
  L9_19()
  for L12_22, L13_23 in L9_19(L10_20) do
    Sound:stopSEHandle(L13_23)
  end
  L9_19()
  L9_19()
  L9_19()
end
function Finalize()
  local L0_24, L1_25, L2_26, L3_27, L4_28
  _area_ctrls = L0_24
  _area_tbl = L0_24
  for L3_27, L4_28 in L0_24(L1_25) do
    if L4_28 ~= nil and L4_28:isRunning() == true then
      L4_28:abort()
    end
  end
  _gull_task = L0_24
  if L0_24 ~= nil then
    for L3_27, L4_28 in L0_24(L1_25) do
      Sound:stopSEHandle(L4_28)
    end
    se_tbl = L0_24
  end
  L3_27 = true
  L0_24(L1_25, L2_26, L3_27)
  L0_24(L1_25, L2_26)
  for L3_27, L4_28 in L0_24(L1_25) do
    L4_28:setExpandedAabb(false)
  end
  L0_24(L1_25, L2_26)
  L0_24(L1_25, L2_26)
end
function get_se_tbl()
  local L0_29, L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36
  L0_29 = {
    L1_30,
    L2_31,
    L3_32,
    L4_33,
    L5_34,
    L6_35,
    L7_36,
    {
      name = "bu_a_14_02",
      aa_x = -3,
      aa_y = -5,
      aa_z = -7.1,
      bb_x = 5,
      bb_y = -1,
      bb_z = 2.9
    },
    {
      name = "bu_a_15",
      aa_x = -6,
      aa_y = -3,
      aa_z = -8,
      bb_x = 6,
      bb_y = 3,
      bb_z = 8
    },
    {
      name = "ve_crane_root",
      aa_x = -9,
      aa_y = -4,
      aa_z = -10.5,
      bb_x = 4,
      bb_y = 9,
      bb_z = 10.5
    }
  }
  L1_30 = {L2_31}
  L1_30.name = "bu_a_02"
  L1_30.aa_x = -4.5
  L1_30.aa_y = -4
  L1_30.aa_z = -6
  L1_30.bb_x = 4.5
  L1_30.bb_y = -0.3
  L1_30.bb_z = 6
  L2_31.name = "bu_a_03_01"
  L2_31.aa_x = -6
  L2_31.aa_y = -5.3
  L2_31.aa_z = -5
  L2_31.bb_x = 6
  L2_31.bb_y = -0.3
  L2_31.bb_z = 5
  L3_32.name = "bu_a_03_02"
  L3_32.aa_x = -6
  L3_32.aa_y = -5.3
  L3_32.aa_z = -5
  L3_32.bb_x = 6
  L3_32.bb_y = -0.3
  L3_32.bb_z = 5
  L4_33.name = "bu_a_09"
  L4_33.aa_x = -5.67
  L4_33.aa_y = -5.8
  L4_33.aa_z = -11
  L4_33.bb_x = 5.33
  L4_33.bb_y = 3.2
  L4_33.bb_z = 0
  L5_34 = {}
  L5_34.name = "bu_a_12_01"
  L5_34.aa_x = -7
  L5_34.aa_y = -1.75
  L5_34.aa_z = -6
  L5_34.bb_x = 3
  L5_34.bb_y = 1.75
  L5_34.bb_z = 6
  L6_35 = {}
  L6_35.name = "bu_a_12_02"
  L6_35.aa_x = -7
  L6_35.aa_y = -1.75
  L6_35.aa_z = -6
  L6_35.bb_x = 3
  L6_35.bb_y = 1.75
  L6_35.bb_z = 6
  L7_36 = {}
  L7_36.name = "bu_a_14_01"
  L7_36.aa_x = -3
  L7_36.aa_y = -5
  L7_36.aa_z = -7.1
  L7_36.bb_x = 5
  L7_36.bb_y = -1
  L7_36.bb_z = 2.9
  L1_30 = {}
  for L5_34, L6_35 in L2_31(L3_32) do
    L7_36 = createGameObject2
    L7_36 = L7_36("GimmickBg")
    L7_36:try_init()
    L7_36:waitForReady()
    L7_36:try_start()
    L7_36:setLocalAabb(Aabb(Vector(L6_35.aa_x, L6_35.aa_y, L6_35.aa_z), Vector(L6_35.bb_x, L6_35.bb_y, L6_35.bb_z)))
    _area_tbl[L6_35.name]:appendChild(L7_36)
    L1_30[L6_35.name] = Sound:playSEHandleBox("ships_move", 1, "", L7_36)
  end
  L3_32(L4_33)
  L3_32(L4_33)
  L3_32(L4_33)
  L5_34 = Aabb
  L6_35 = Vector
  L7_36 = 2.1
  L6_35 = L6_35(L7_36, 13.5, 2.5)
  L7_36 = Vector
  L7_36 = L7_36(3.1, 14.5, -2.5)
  L7_36 = L5_34(L6_35, L7_36, L7_36(3.1, 14.5, -2.5))
  L3_32(L4_33, L5_34, L6_35, L7_36, L5_34(L6_35, L7_36, L7_36(3.1, 14.5, -2.5)))
  L5_34 = L2_31
  L3_32(L4_33, L5_34)
  L5_34 = "ships_windmill"
  L6_35 = 1
  L7_36 = ""
  L1_30.bu_a_15_2 = L3_32
  return L1_30
end
function get_gull_tbl()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
  L0_37 = {}
  L1_38 = 1
  for L5_42, L6_43 in L2_39(L3_40) do
    L7_44 = 1
    while true do
      if findGameObject2("Node", "locator2_gull_" .. L5_42 .. "_" .. string.format("%02d", L7_44)) ~= nil then
        L0_37[L1_38] = {
          name = "gull_" .. L1_38,
          type = "gull02",
          node = findGameObject2("Node", "locator2_gull_" .. L5_42 .. "_" .. string.format("%02d", L7_44)):getName(),
          use_gravity = false,
          attach = true,
          start = true,
          area_name = L5_42
        }
        L7_44 = L7_44 + 1
        L1_38 = L1_38 + 1
        break
      end
    end
  end
  return L0_37
end
function gull_follow(A0_45, A1_46)
  return invokeTask(function()
    local L0_47, L1_48
    L0_47 = Fn_findNpc
    L1_48 = A0_45
    L0_47 = L0_47(L1_48)
    L1_48 = L0_47.wanderFly
    L1_48(L0_47, 3, 1, 5)
    while true do
      L1_48 = _gull_follow_end
      if L1_48 == false then
        L1_48 = wait
        L1_48()
      end
    end
    L1_48 = RandI
    L1_48 = L1_48(5, 30)
    for _FORV_5_ = 1, L1_48 do
      waitSeconds(0.1)
    end
    L0_47:fly({
      {
        pos = "locator2_gull_" .. A1_46 .. "_goal",
        attr = "fly"
      }
    }, {
      moveSpeed = RandI(2, 3)
    })
  end)
end
function man32_action_task()
  return invokeTask(function()
    local L0_49, L1_50, L2_51
    L0_49 = Fn_findNpc
    L1_50 = "npcgen2_man32_01"
    L0_49 = L0_49(L1_50)
    L1_50 = Fn_playMotionNpc
    L2_51 = L0_49
    L1_50(L2_51, "sit_floor_02")
    while true do
      L1_50 = _man32_action_start
      if L1_50 == false then
        L1_50 = wait
        L1_50()
      end
    end
    L1_50 = waitSeconds
    L2_51 = 2
    L1_50(L2_51)
    L1_50 = Fn_playMotionNpc
    L2_51 = L0_49
    L1_50(L2_51, "sit_floor_out_02", true)
    L1_50 = Fn_playMotionNpc
    L2_51 = L0_49
    L1_50(L2_51, "sit_floor_out_00", true)
    L2_51 = L0_49
    L1_50 = L0_49.setStagger
    L1_50(L2_51, true)
    L1_50 = Fn_moveNpc
    L2_51 = L0_49
    L1_50 = L1_50(L2_51, {
      "locator2_man32_move"
    }, {
      arrivedLength = 0,
      runLength = 30,
      navimesh = true,
      recast = false
    })
    while true do
      L2_51 = L1_50.isRunning
      L2_51 = L2_51(L1_50)
      if L2_51 then
        L2_51 = wait
        L2_51()
      end
    end
    L2_51 = L0_49.setStagger
    L2_51(L0_49, false)
    L2_51 = findGameObject2
    L2_51 = L2_51("Node", "locator2_man32_move")
    while Fn_isInSightTarget(L2_51, 1) == false do
      wait()
    end
    waitSeconds(0.5)
    Fn_playMotionNpc(L0_49, "man01_idle_bu_00", true, {isRepeat = false, isStop = true})
    waitSeconds(RandF(2, 4))
    while Fn_isInSightTarget(L2_51, 1) == false do
      wait()
    end
    Fn_playMotionNpc(L0_49, "sit_floor_in_00", true)
    Fn_playMotionNpc(L0_49, "sit_floor_in_02", true)
    Fn_playMotionNpc(L0_49, "sit_floor_02")
  end)
end
function create_wind_effect()
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64, L13_65, L14_66, L15_67, L16_68
  L0_52 = {}
  L0_52.s_l = "ef_bg_smk_03"
  L0_52.s_r = "ef_bg_smk_04"
  L0_52.s_c = "ef_bg_smk_05"
  L0_52.l_l = "ef_bg_smk_06"
  L0_52.l_r = "ef_bg_smk_07"
  L0_52.l_c = "ef_bg_smk_08"
  L0_52.c_c = "ef_bg_smk_09"
  L1_53 = {}
  L1_53.bu_a_02 = 0.7
  L1_53.bu_a_03_01 = 0.6
  L1_53.bu_a_03_02 = 0.6
  L1_53.bu_a_08 = 0.5
  L1_53.bu_a_09 = 1
  L1_53.bu_a_12_01 = 0.7
  L1_53.bu_a_12_02 = 0.7
  L1_53.bu_a_14_01 = 0.5
  L1_53.bu_a_14_01 = 0.5
  L1_53.bu_a_15 = 1
  L2_54 = 1
  L3_55 = {}
  for L7_59, L8_60 in L4_56(L5_57) do
    for L12_64, L13_65 in L9_61(L10_62) do
      L14_66 = 1
      while true do
        L15_67 = "ef_"
        L16_68 = L12_64
        L15_67 = L15_67 .. L16_68 .. "_" .. L7_59 .. "_" .. string.format("%02d", L14_66)
        L16_68 = findGameObject2
        L16_68 = L16_68("Node", "locator2_" .. L15_67)
        if L16_68 ~= nil then
          if RandI(1, 10) <= 3 then
            Fn_createEffect(L15_67, L13_65, L16_68, true):setAlpha(0.7)
          elseif RandI(1, 10) <= 6 then
            Fn_createEffect(L15_67, L13_65, L16_68, true):setAlpha(0.5)
          else
            Fn_createEffect(L15_67, L13_65, L16_68, true):setAlpha(0.1)
          end
          if L12_64 == "c_c" and L1_53[L7_59] ~= nil then
            Fn_createEffect(L15_67, L13_65, L16_68, true):setScale(Vector(L1_53[L7_59], L1_53[L7_59], L1_53[L7_59]))
          end
          L3_55[L2_54] = Fn_createEffect(L15_67, L13_65, L16_68, true)
          L2_54 = L2_54 + 1
        else
          break
        end
        L14_66 = L14_66 + 1
      end
    end
  end
  return L3_55
end
function ji_set_visible(A0_69)
  local L1_70, L2_71
  L1_70 = Fn_findAreaHandle
  L2_71 = "ji_a_root"
  L1_70 = L1_70(L2_71)
  L2_71 = L1_70.getDescendant
  L2_71 = L2_71(L1_70)
  for _FORV_6_, _FORV_7_ in pairs(L2_71) do
    _FORV_7_:setEffectiveness(A0_69, true)
  end
end
function camera_shake_task()
  local L0_72
  L0_72 = {}
  L0_72[1] = invokeTask(function()
    while true do
      hz = RandF(0.05, 0.3)
      Camera:shake3D(2 / hz, RandF(0.09, 0.2), hz, _area_tbl.ve_crane_root:getWorldPos(), 0)
      waitSeconds(RandF(3, 5))
    end
  end)
  L0_72[2] = invokeTask(function()
    while true do
      waitSeconds(RandF(1, 3.5))
      Camera:shake3D(RandF(3, 7), RandF(0.001, 0.004), RandF(8, 12), _area_tbl.ve_crane_root:getWorldPos(), 0)
    end
  end)
  L0_72[3] = invokeTask(function()
    while true do
      waitSeconds(RandF(0.7, 6))
      Camera:shake3D(RandF(0.5, 2), RandF(0.003, 0.01), RandF(1, 12), _area_tbl.ve_crane_root:getWorldPos(), 0)
    end
  end)
  return L0_72
end
