dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm20_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_puppet_tbl = {}
_disk_final_place = 0
MARKER_NUM = 6
_throw_target = 0
POINT_TABLE = {
  10,
  30,
  20,
  30,
  10,
  40
}
POINT_MAX = 100
POINT_PENALTY = 5
GRAB_THROW_VELOCITY = 12
GRAVITY_RELEASEPOINT = 5
GRAVITY_POWER = 30
DOG_FORCE_MOVE_TIME = 15
THROW_FRAME_COUNT = 10
_in_throw_area = true
_in_warn_area = false
_free_move = false
THROW_CAMERA_TIME = 3
_stay_task = nil
_is_stay = false
_prev_pos = Vector(0, 0, 0)
_girl_inform_task = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = loadFileAsset
  L1_1 = "nvm"
  L0_0 = L0_0(L1_1, "up_a_00_custom01")
  if L0_0 ~= nil then
    L1_1 = print
    L1_1("\227\131\138\227\131\147\227\131\161\227\131\131\227\130\183\227\131\165\227\129\130\227\130\138")
    L1_1 = L0_0.wait
    L1_1(L0_0)
    L1_1 = Fn_findAreaHandle
    L1_1 = L1_1("up_a_00")
    if L1_1 ~= nil then
      print("nil\227\129\167\227\129\170\227\129\132")
      L1_1:addNaviMeshAsset(L0_0)
    end
  else
    L1_1 = print
    L1_1("\227\131\138\227\131\147\227\131\161\227\131\131\227\130\183\227\131\165\227\129\170\227\129\151")
  end
  L1_1 = Fn_sensorOff
  L1_1("cubesensor2_throw_area")
  L1_1 = {
    {
      name = "girl01",
      type = "chi16",
      node = "locator2_girl_pos_01c",
      color_variation = 1,
      not_mob = true
    }
  }
  Fn_setupNpc(L1_1)
  for _FORV_5_, _FORV_6_ in pairs(L1_1) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  _dog_puppet = Fn_findNpcPuppet("sm20_dog_01")
  _sdemo_cut01 = SDemo.create("sm20_c_cut01")
  _sdemo_cut02 = SDemo.create("sm20_c_cut02")
  Player:dropGrabObject()
  Player:setGrabThrowVelocityLimit(GRAB_THROW_VELOCITY)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45
  L0_2 = {}
  L0_2.glad = "glad_00"
  L0_2.sad = "sad_00"
  L1_3 = Fn_loadNpcEventMotion
  L2_4 = "sm20_dog_01"
  L3_5 = L0_2
  L1_3(L2_4, L3_5)
  L1_3 = {}
  L1_3.sit_out = "chi01_sit_floor_out_00"
  L2_4 = Fn_loadNpcEventMotion
  L3_5 = "girl01"
  L4_6 = L1_3
  L2_4(L3_5, L4_6)
  L2_4 = Fn_resetPcPos
  L3_5 = "locator2_pc_start_pos"
  L2_4(L3_5)
  L2_4 = Fn_warpNpc
  L3_5 = "sm20_dog_01"
  L4_6 = "locator2_dog_01c"
  L2_4(L3_5, L4_6)
  L2_4 = createGameObject2
  L3_5 = "Node"
  L2_4 = L2_4(L3_5)
  L4_6 = L2_4
  L3_5 = L2_4.setName
  L5_7 = "diskRestoreNode"
  L3_5(L4_6, L5_7)
  L3_5 = Fn_appendToPlayer
  L4_6 = L2_4
  L3_5(L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.setPos
  L5_7 = Vector
  L43_45 = L5_7(L6_8, L7_9, L8_10)
  L3_5(L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L5_7(L6_8, L7_9, L8_10))
  L4_6 = L2_4
  L3_5 = L2_4.setForceMove
  L3_5(L4_6)
  L3_5 = createGameObject2
  L4_6 = "Node"
  L3_5 = L3_5(L4_6)
  L5_7 = L3_5
  L4_6 = L3_5.setName
  L4_6(L5_7, L6_8)
  L4_6 = _dog_puppet
  L5_7 = L4_6
  L4_6 = L4_6.appendChild
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.setPos
  L9_11 = 0
  L43_45 = L6_8(L7_9, L8_10, L9_11)
  L4_6(L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L6_8(L7_9, L8_10, L9_11))
  L5_7 = L3_5
  L4_6 = L3_5.setForceMove
  L4_6(L5_7)
  L4_6 = Fn_missionStart
  L4_6()
  L4_6 = Fn_userCtrlOff
  L4_6()
  L4_6 = Player
  L5_7 = L4_6
  L4_6 = L4_6.setAttrTune
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = Fn_kaiwaDemoView
  L5_7 = "sm20_00650k"
  L4_6(L5_7)
  L4_6 = HUD
  L5_7 = L4_6
  L4_6 = L4_6.info
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = {L5_7, L6_8}
  L5_7 = Player
  L5_7 = L5_7.kAbility_Grab
  L5_7 = Fn_lockPlayerAbility
  L5_7(L6_8)
  L5_7 = Fn_missionView
  L5_7(L6_8)
  L5_7 = waitSeconds
  L5_7(L6_8)
  L5_7 = Player
  L5_7 = L5_7.setGrabThrowFreeFall
  L5_7(L6_8, L7_9, L8_10)
  L5_7 = createGameObject2
  L5_7 = L5_7(L6_8)
  catch_node_hdl = L5_7
  L5_7 = catch_node_hdl
  L5_7 = L5_7.setName
  L5_7(L6_8, L7_9)
  L5_7 = {}
  near_sensor_hdl = L6_8
  L9_11 = 100000
  L10_12 = 100000
  L43_45 = L8_10(L9_11, L10_12, L11_13)
  L6_8(L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L8_10(L9_11, L10_12, L11_13))
  for L9_11 = 1, MARKER_NUM do
    L10_12 = Fn_sensorOff
    L14_16 = L9_11
    L10_12(L11_13)
  end
  for L9_11 = 1, 5 do
    L10_12 = findGameObject2
    L14_16 = "%02d"
    L15_17 = L9_11
    L10_12 = L10_12(L11_13, L12_14)
    L5_7[L9_11] = L10_12
    L10_12 = L5_7[L9_11]
    L10_12 = L10_12.setBBoxOffset
    L14_16 = 100000
    L15_17 = 100000
    L43_45 = L12_14(L13_15, L14_16, L15_17)
    L10_12(L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L12_14(L13_15, L14_16, L15_17))
  end
  L9_11 = "dnode"
  L7_9(L8_10, L9_11)
  L9_11 = Vector
  L10_12 = 0.5
  L43_45 = L9_11(L10_12, L11_13, L12_14)
  L7_9(L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L9_11(L10_12, L11_13, L12_14))
  L7_9(L8_10)
  L7_9(L8_10)
  L7_9(L8_10)
  L7_9()
  L9_11 = _puppet_tbl
  L9_11 = L9_11.girl01
  L10_12 = 2.8
  for L14_16 = 1, 8 do
    L15_17 = createGameObject2
    L16_18 = "Node"
    L15_17 = L15_17(L16_18)
    L8_10[L14_16] = L15_17
    L15_17 = L8_10[L14_16]
    L16_18 = L15_17
    L15_17 = L15_17.setName
    L17_19 = "pcNode"
    L18_20 = L14_16
    L17_19 = L17_19 .. L18_20
    L15_17(L16_18, L17_19)
    L16_18 = L9_11
    L15_17 = L9_11.appendChild
    L17_19 = L8_10[L14_16]
    L15_17(L16_18, L17_19)
    L15_17 = math
    L15_17 = L15_17.pi
    L15_17 = L15_17 * 45
    L16_18 = L14_16 - 1
    L15_17 = L15_17 * L16_18
    L15_17 = L15_17 / 180
    L16_18 = L8_10[L14_16]
    L17_19 = L16_18
    L16_18 = L16_18.setPos
    L18_20 = Vector
    L19_21 = math
    L19_21 = L19_21.cos
    L20_22 = L15_17
    L19_21 = L19_21(L20_22)
    L19_21 = L10_12 * L19_21
    L20_22 = 0
    L21_23 = math
    L21_23 = L21_23.sin
    L22_24 = L15_17
    L21_23 = L21_23(L22_24)
    L21_23 = L10_12 * L21_23
    L43_45 = L18_20(L19_21, L20_22, L21_23)
    L16_18(L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L18_20(L19_21, L20_22, L21_23))
    L16_18 = L8_10[L14_16]
    L17_19 = L16_18
    L16_18 = L16_18.setRot
    L18_20 = Vector
    L19_21 = 0
    L20_22 = L14_16 - 1
    L20_22 = 45 * L20_22
    L20_22 = L20_22 + 180
    L21_23 = 0
    L43_45 = L18_20(L19_21, L20_22, L21_23)
    L16_18(L17_19, L18_20, L19_21, L20_22, L21_23, L22_24, L23_25, L24_26, L25_27, L26_28, L27_29, L28_30, L29_31, L30_32, L31_33, L32_34, L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L18_20(L19_21, L20_22, L21_23))
    L16_18 = L8_10[L14_16]
    L17_19 = L16_18
    L16_18 = L16_18.setForceMove
    L16_18(L17_19)
  end
  L11_13()
  L14_16 = false
  L15_17 = false
  L16_18 = false
  L17_19 = 0
  L18_20 = 0
  L19_21, L20_22 = nil, nil
  L21_23 = HUD
  L22_24 = L21_23
  L21_23 = L21_23.miniGaugeSetVisible
  L23_25 = true
  L21_23(L22_24, L23_25)
  L21_23 = HUD
  L22_24 = L21_23
  L21_23 = L21_23.miniGaugeSetNum
  L23_25 = L17_19 / 100
  L21_23(L22_24, L23_25)
  L21_23 = HUD
  L22_24 = L21_23
  L21_23 = L21_23.miniGaugeSetTextID
  L23_25 = "sm20_02010"
  L21_23(L22_24, L23_25)
  L21_23 = HUD
  L22_24 = L21_23
  L21_23 = L21_23.miniGaugeSetType
  L23_25 = kCountType_Up
  L24_26 = 1
  L21_23(L22_24, L23_25, L24_26)
  L21_23 = invokeTask
  function L22_24()
    while true do
      HUD:miniGaugeSetNum(L17_19 / 100)
      wait()
    end
  end
  L21_23 = L21_23(L22_24)
  L22_24 = throwStartCall
  L23_25 = true
  L22_24(L23_25)
  L22_24 = Fn_userCtrlOn
  L22_24()
  L22_24 = Fn_getPlayerWorldPos
  L22_24 = L22_24()
  L23_25 = Fn_sensorOn
  L24_26 = "cubesensor2_throw_area"
  L23_25(L24_26)
  L23_25 = createGameObject2
  L24_26 = "Node"
  L23_25 = L23_25(L24_26)
  L25_27 = L23_25
  L24_26 = L23_25.setName
  L26_28 = "camnode"
  L24_26(L25_27, L26_28)
  L25_27 = L6_8
  L24_26 = L6_8.try_init
  L24_26(L25_27)
  L25_27 = L6_8
  L24_26 = L6_8.waitForReady
  L24_26(L25_27)
  L25_27 = L6_8
  L24_26 = L6_8.try_start
  L24_26(L25_27)
  L24_26 = start_game_obj
  L24_26()
  L24_26 = nil
  L25_27 = false
  L26_28 = 0
  while true do
    while true do
      while true do
        if not L27_29 then
          L27_29(L28_30)
          L30_32 = "cifrisbee01_base"
          L31_33 = true
          disk_hdl = L27_29
          L27_29(L28_30, L29_31)
          L30_32 = Vector
          L31_33 = 0
          L32_34 = 3
          L33_35 = 0
          L30_32 = L30_32(L31_33, L32_34, L33_35)
          L27_29(L28_30, L29_31)
          L27_29(L28_30)
          _disk_final_place = 0
          L27_29()
        end
      end
      L27_29(L28_30)
      L30_32 = Fn_getPlayerWorldPos
      L30_32 = L30_32()
      L22_24 = L30_32
      L30_32 = 0
      L31_33 = invokeTask
      function L32_34()
        while not isDiskStay() and disk_hdl:isBroken() == false do
          waitSeconds(1)
          L30_32 = L30_32 + 1
          if L30_32 % 5 == 0 then
            print(L30_32 .. "\231\167\146")
          end
          if L30_32 % 10 == 0 then
            Fn_tutorialCaptionKill()
            wait()
            Fn_captionViewWait("sm20_02022")
            Fn_captionViewEnd()
            Fn_tutorialCaption("throw")
          end
        end
      end
      L31_33 = L31_33(L32_34)
      while true do
        L32_34 = isDiskStay
        L32_34 = L32_34()
        if not L32_34 then
          L32_34 = disk_hdl
          L33_35 = L32_34
          L32_34 = L32_34.isBroken
          L32_34 = L32_34(L33_35)
          if L32_34 == false then
            L32_34 = Player
            L33_35 = L32_34
            L32_34 = L32_34.setGrabObject
            L34_36 = disk_hdl
            L32_34(L33_35, L34_36)
            L32_34 = Player
            L33_35 = L32_34
            L32_34 = L32_34.getGrabObjectCount
            L32_34 = L32_34(L33_35)
            if L32_34 > 0 then
              L32_34 = _in_throw_area
              if not L32_34 then
                L32_34 = print
                L33_35 = "\227\130\168\227\131\170\227\130\162\229\164\150\227\129\171\229\135\186\227\129\159"
                L32_34(L33_35)
                L32_34 = Fn_userCtrlOff
                L32_34()
                break
              else
                L32_34 = _in_warn_area
                if L32_34 then
                  if not L28_30 then
                    L32_34 = print
                    L33_35 = "\228\184\184\227\129\139\227\130\137\229\135\186\227\129\166\227\129\175\227\129\132\227\129\145\227\129\170\227\129\132"
                    L32_34(L33_35)
                    L32_34 = Fn_captionView
                    L33_35 = "sm20_02011"
                    L34_36 = 0
                    L32_34(L33_35, L34_36)
                    L32_34 = disk_hdl
                    L33_35 = L32_34
                    L32_34 = L32_34.setWorldPos
                    L34_36 = Vector
                    L35_37 = 0
                    L36_38 = 0
                    L37_39 = 0
                    L43_45 = L34_36(L35_37, L36_38, L37_39)
                    L32_34(L33_35, L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L34_36(L35_37, L36_38, L37_39))
                  end
                elseif L28_30 then
                  L32_34 = Fn_captionViewEnd
                  L32_34()
                end
              end
            end
          end
        end
        L32_34 = Player
        L33_35 = L32_34
        L32_34 = L32_34.getGrabObjectCount
        L32_34 = L32_34(L33_35)
        if L32_34 > 0 and not L27_29 then
          L32_34 = _in_throw_area
          if L32_34 then
            L32_34 = _in_warn_area
            if not L32_34 then
              L32_34 = Fn_tutorialCaption
              L33_35 = "throw"
              L32_34(L33_35)
            end
          end
        else
          L32_34 = Player
          L33_35 = L32_34
          L32_34 = L32_34.getGrabObjectCount
          L32_34 = L32_34(L33_35)
          if L32_34 == 0 and L27_29 then
            L32_34 = print
            L33_35 = "\227\129\170\227\129\146\227\129\190\227\129\151\227\129\159"
            L32_34(L33_35)
            L32_34 = Mv_safeTaskAbort
            L33_35 = L31_33
            L32_34 = L32_34(L33_35)
            L31_33 = L32_34
            L32_34 = Fn_tutorialCaptionKill
            L32_34()
            L32_34 = waitSeconds
            L33_35 = 0.53
            L32_34(L33_35)
            L32_34 = dym_obj
            L33_35 = L32_34
            L32_34 = L32_34.getWorldPos
            L32_34 = L32_34(L33_35)
            L33_35 = wait
            L34_36 = THROW_FRAME_COUNT
            L33_35(L34_36)
            L33_35 = dym_obj
            L34_36 = L33_35
            L33_35 = L33_35.getWorldPos
            L33_35 = L33_35(L34_36)
            L34_36 = L33_35 - L32_34
            L35_37 = stayObserverStart
            L36_38 = disk_hdl
            L35_37(L36_38)
            L35_37 = Fn_getDistanceToPlayer
            L36_38 = "range_marker_"
            L37_39 = _throw_target
            L36_38 = L36_38 .. L37_39
            L35_37 = L35_37(L36_38)
            L36_38 = isInAngle
            L37_39 = "locator2_good_cam_target_0"
            L38_40 = _throw_target
            L37_39 = L37_39 .. L38_40
            L38_40 = 10 / L35_37
            L36_38 = L36_38(L37_39, L38_40)
            if L36_38 then
              L36_38 = invokeTask
              function L37_39()
                local L0_46
                while true do
                  L0_46 = dym_obj
                  L0_46 = L0_46.getWorldPos
                  L0_46 = L0_46(L0_46)
                  L22_24 = L0_46
                  L0_46 = L22_24
                  L0_46 = L0_46 - L34_36
                  L0_46 = L0_46 + Vector(0, 3.8, 0)
                  L23_25:setWorldPos(L0_46)
                  L23_25:setForceMove()
                  if L22_24.y < 495 then
                    if _disk_final_place == 2 then
                      _disk_final_place = 0
                    end
                    waitSeconds(1)
                    _stay_task = Mv_safeTaskAbort(_stay_task)
                    _is_stay = true
                    break
                  end
                  wait()
                end
              end
              L36_38 = L36_38(L37_39)
              L24_26 = L36_38
              L36_38 = _sdemo_cut01
              L37_39 = L36_38
              L36_38 = L36_38.set
              L38_40 = L23_25
              L39_41 = L6_8
              L36_38(L37_39, L38_40, L39_41, L40_42)
              L36_38 = _sdemo_cut01
              L37_39 = L36_38
              L36_38 = L36_38.setCameraParam
              L38_40 = nil
              L39_41 = 0.1
              L36_38(L37_39, L38_40, L39_41, L40_42)
              L36_38 = _sdemo_cut01
              L37_39 = L36_38
              L36_38 = L36_38.switchCamera
              L38_40 = true
              L39_41 = 0.5
              L36_38(L37_39, L38_40, L39_41)
              L36_38 = _sdemo_cut01
              L37_39 = L36_38
              L36_38 = L36_38.play
              L36_38(L37_39)
              L25_27 = true
              L36_38 = Fn_userCtrlOff
              L36_38()
            end
          else
          end
        end
        if L24_26 == nil then
          L32_34 = dym_obj
          if L32_34 ~= nil then
            L32_34 = dym_obj
            L33_35 = L32_34
            L32_34 = L32_34.getWorldPos
            L32_34 = L32_34(L33_35)
            L32_34 = L32_34.y
            if L32_34 < 495 then
              L32_34 = print
              L33_35 = "\230\157\161\228\187\182\229\133\165\227\130\138"
              L32_34(L33_35)
              L32_34 = Mv_safeTaskAbort
              L33_35 = _stay_task
              L32_34 = L32_34(L33_35)
              _stay_task = L32_34
              _is_stay = true
            end
          end
        end
        L32_34 = wait
        L32_34()
      end
      L32_34 = findGameObject2
      L33_35 = "Node"
      L34_36 = "locator2_good_target"
      L35_37 = _throw_target
      L34_36 = L34_36 .. L35_37
      L32_34 = L32_34(L33_35, L34_36)
      if L32_34 ~= nil then
        L33_35 = dym_obj
        if L33_35 ~= nil then
          L33_35 = Fn_get_distance
          L35_37 = L32_34
          L34_36 = L32_34.getWorldPos
          L34_36 = L34_36(L35_37)
          L35_37 = dym_obj
          L36_38 = L35_37
          L35_37 = L35_37.getWorldPos
          L43_45 = L35_37(L36_38)
          L33_35 = L33_35(L34_36, L35_37, L36_38, L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L35_37(L36_38))
          if L33_35 <= 3.2 then
            _disk_final_place = 2
          else
            _disk_final_place = 0
          end
        end
      end
      L33_35 = print
      L34_36 = "\227\131\135\227\130\163\227\130\185\227\130\175\227\129\174\231\160\180\229\163\138\229\190\133\227\129\161\231\181\130\227\130\143\227\130\138"
      L35_37 = _disk_final_place
      L36_38 = _throw_target
      L34_36 = L34_36 .. L35_37 .. L36_38
      L33_35(L34_36)
      L33_35 = Mv_safeTaskAbort
      L34_36 = L31_33
      L33_35 = L33_35(L34_36)
      L31_33 = L33_35
      L33_35 = Mv_safeTaskAbort
      L34_36 = L24_26
      L33_35 = L33_35(L34_36)
      L24_26 = L33_35
      L33_35 = stayObserverEnd
      L33_35()
      L33_35 = waitSeconds
      L34_36 = 0.25
      L33_35(L34_36)
      L33_35 = Fn_captionViewEnd
      L33_35()
      L33_35 = print
      L34_36 = "throwend"
      L33_35(L34_36)
      _free_move = true
      if L11_13 then
      else
        L33_35 = _disk_final_place
        if L33_35 == 0 then
        else
          L33_35 = _disk_final_place
          if L33_35 == 2 then
            L14_16 = true
          end
        end
      end
      L33_35 = print
      L34_36 = "disk_final"
      L35_37 = _disk_final_place
      L34_36 = L34_36 .. L35_37
      L33_35(L34_36)
      L33_35 = "no text"
      if L12_14 or L13_15 then
        L34_36 = waitSeconds
        L35_37 = 1
        L34_36(L35_37)
        L34_36 = _sdemo_cut01
        L35_37 = L34_36
        L34_36 = L34_36.stop
        L36_38 = 1
        L34_36(L35_37, L36_38)
        L25_27 = false
        L34_36 = Fn_userCtrlOn
        L34_36()
        L34_36 = print
        L35_37 = "miss"
        L34_36(L35_37)
        L33_35 = "sm20_02012"
        L34_36 = Sound
        L35_37 = L34_36
        L34_36 = L34_36.pulse
        L36_38 = "dog_sad"
        L34_36(L35_37, L36_38)
        L34_36 = Sound
        L35_37 = L34_36
        L34_36 = L34_36.pulse
        L36_38 = "w10_921a"
        L34_36(L35_37, L36_38)
        L34_36 = Mv_safeTaskAbort
        L35_37 = _girl_inform_task
        L34_36 = L34_36(L35_37)
        _girl_inform_task = L34_36
        L34_36 = Fn_playMotionNpc
        L35_37 = "girl01"
        L36_38 = "sad"
        L37_39 = false
        L34_36(L35_37, L36_38, L37_39)
        L34_36 = invokeTask
        function L35_37()
          Fn_playMotionNpc("sm20_dog_01", "sad_00", true)
          Fn_playMotionNpc("sm20_dog_01", "stay", false)
        end
        L34_36(L35_37)
        L34_36 = POINT_PENALTY
        L17_19 = L17_19 - L34_36
        if L17_19 < 0 then
          L17_19 = 0
        end
        L34_36 = playOutAreaMarker
        L35_37 = _throw_target
        L34_36(L35_37)
        L34_36 = Fn_captionViewWait
        L35_37 = L33_35
        L34_36(L35_37)
        L34_36 = dropedDiskErace
        L35_37 = disk_hdl
        L34_36(L35_37)
      elseif L14_16 then
        L34_36 = waitSeconds
        L35_37 = 1
        L34_36(L35_37)
        L34_36 = _sdemo_cut01
        L35_37 = L34_36
        L34_36 = L34_36.stop
        L36_38 = 1
        L34_36(L35_37, L36_38)
        L25_27 = false
        L34_36 = Fn_userCtrlOn
        L34_36()
        L34_36 = RandI
        L35_37 = 1
        L36_38 = 3
        L34_36 = L34_36(L35_37, L36_38)
        L35_37 = Sound
        L36_38 = L35_37
        L35_37 = L35_37.pulse
        L37_39 = "success"
        L35_37(L36_38, L37_39)
        if L34_36 == 1 then
          L33_35 = "sm20_02013"
        elseif L34_36 == 2 then
          L33_35 = "sm20_02014"
        elseif L34_36 == 3 then
          L33_35 = "sm20_02015"
        end
        L35_37 = invokeTask
        function L36_38()
          _girl_inform_task = Mv_safeTaskAbort(_girl_inform_task)
          Fn_turnNpc("girl01", L6_8:getWorldPos())
          Fn_playMotionNpc("girl01", "handclap", false)
        end
        L35_37(L36_38)
        L35_37 = playOutAreaMarker
        L36_38 = _throw_target
        L35_37(L36_38)
        L35_37 = Sound
        L36_38 = L35_37
        L35_37 = L35_37.pulse
        L37_39 = "w10_920b"
        L35_37(L36_38, L37_39)
        L35_37 = Fn_captionView
        L36_38 = L33_35
        L35_37(L36_38)
      end
      L34_36 = invokeTask
      function L35_37()
        while true do
          if not _in_throw_area then
            print("\227\130\168\227\131\170\227\130\162\229\164\150\227\129\171\229\135\186\227\129\159")
            L28_30 = false
            Fn_blackout()
            Fn_resetPcPos("locator2_pc_start_pos")
            wait()
            Fn_userCtrlOff()
            _girl_inform_task = Mv_safeTaskAbort(_girl_inform_task)
            Fn_playMotionNpc("girl01", "stay", false)
            Fn_tutorialCaptionKill()
            Fn_fadein()
            if L14_16 then
              Fn_captionViewWait("sm20_02016")
            else
              Fn_captionViewWait("sm20_02017")
            end
            Fn_userCtrlOn()
            wait()
          elseif _in_warn_area then
            if not L28_30 then
              print("\228\184\184\227\129\139\227\130\137\229\135\186\227\129\166\227\130\139\227\130\136")
              Fn_captionView("sm20_02011", 0)
            end
            L28_30 = true
            wait()
          else
            if L28_30 then
              Fn_captionViewEnd()
            end
            L28_30 = false
            wait()
          end
        end
      end
      L34_36 = L34_36(L35_37)
      if L14_16 then
        L36_38 = L6_8
        L35_37 = L6_8.getWorldPos
        L35_37 = L35_37(L36_38)
        L36_38 = print
        L37_39 = L35_37
        L36_38(L37_39)
        L36_38 = catch_node_hdl
        L37_39 = L36_38
        L36_38 = L36_38.setWorldPos
        L38_40 = L35_37
        L36_38(L37_39, L38_40)
        L36_38 = print
        L37_39 = catch_node_hdl
        L38_40 = L37_39
        L37_39 = L37_39.getWorldPos
        L43_45 = L37_39(L38_40)
        L36_38(L37_39, L38_40, L39_41, L40_42, L41_43, L42_44, L43_45, L37_39(L38_40))
        L36_38 = {L37_39}
        L37_39 = "catchNode"
        L19_21 = L36_38
        L36_38 = {}
        L36_38.runLength = -1
        L36_38.arrivedLength = 1
        L36_38.navimesh = "up_a_00_custom01"
        L36_38.recast = false
        L37_39 = Fn_moveNpc
        L38_40 = "sm20_dog_01"
        L39_41 = L19_21
        L37_39 = L37_39(L38_40, L39_41, L40_42)
        L20_22 = L37_39
        L37_39 = invokeTask
        function L38_40()
          while true do
            waitSeconds(1)
            L18_20 = L18_20 + 1
            print("wait_time = " .. L18_20)
          end
        end
        L37_39 = L37_39(L38_40)
        while true do
          L39_41 = L20_22
          L38_40 = L20_22.isRunning
          L38_40 = L38_40(L39_41)
          if L38_40 then
            L38_40 = DOG_FORCE_MOVE_TIME
            if L18_20 >= L38_40 then
              L39_41 = L20_22
              L38_40 = L20_22.abort
              L38_40(L39_41)
              L38_40 = Fn_playMotionNpc
              L39_41 = "sm20_dog_01"
              L38_40(L39_41, L40_42, L41_43)
              L38_40 = Fn_warpNpc
              L39_41 = "sm20_dog_01"
              L38_40(L39_41, L40_42)
              L38_40 = print
              L39_41 = "\231\138\172\227\131\175\227\131\188\227\131\151"
              L38_40(L39_41)
              break
            end
          end
          L38_40 = wait
          L38_40()
        end
        L39_41 = L20_22
        L38_40 = L20_22.isRunning
        L38_40 = L38_40(L39_41)
        if L38_40 then
          L39_41 = L20_22
          L38_40 = L20_22.abort
          L38_40(L39_41)
          L38_40 = Fn_playMotionNpc
          L39_41 = "sm20_dog_01"
          L38_40(L39_41, L40_42, L41_43)
        end
        L38_40 = Mv_safeTaskAbort
        L39_41 = L37_39
        L38_40 = L38_40(L39_41)
        L37_39 = L38_40
        L18_20 = 0
        if L14_16 then
          L15_17 = true
        end
        if L15_17 then
          L38_40 = dropedDiskErace
          L39_41 = disk_hdl
          L38_40(L39_41)
          L38_40 = Fn_createGimmickBg
          L39_41 = "loc_ci00"
          L38_40 = L38_40(L39_41, L40_42, L41_43)
          bring_hdl = L38_40
          L38_40 = Fn_attachJoint
          L39_41 = bring_hdl
          L38_40(L39_41, L40_42, L41_43)
        end
        L38_40 = waitSeconds
        L39_41 = 1.2
        L38_40(L39_41)
        L38_40 = 0
        L39_41 = -1
        for L43_45 = 1, 8 do
          if L39_41 < 0 or L39_41 > L8_10[L43_45]:getWorldPos():DistanceTo(L6_8:getWorldPos()) then
            L39_41 = L8_10[L43_45]:getWorldPos():DistanceTo(L6_8:getWorldPos())
            L38_40 = L43_45
          end
        end
        L40_42.runLength = 2
        L40_42.arrivedLength = 2
        L40_42.navimesh = "up_a_00_custom01"
        L40_42.recast = false
        L36_38 = L40_42
        L43_45 = _puppet_tbl
        L43_45 = L43_45.girl01
        L43_45 = L36_38
        L20_22 = L40_42
        L43_45 = "sm20_02032"
        L43_45 = 6
        if L41_43 <= 3 then
          L43_45 = L42_44
          L42_44(L43_45, "kit045b")
        else
          L43_45 = L42_44
          L42_44(L43_45, "w10_920c")
        end
        L43_45 = L40_42[L41_43]
        L42_44(L43_45)
        function L43_45()
          while true do
            waitSeconds(1)
            L18_20 = L18_20 + 1
            print("wait_time = " .. L18_20)
          end
        end
        L43_45 = invokeTask
        L43_45 = L43_45(function()
          while true do
            if Fn_get_distance(_puppet_tbl.girl01:getWorldPos(), _dog_puppet:getWorldPos()) < 10 then
              Fn_turnNpc("girl01", _dog_puppet)
              print("\229\176\145\229\165\179\230\140\175\227\130\138\229\144\145\227\129\141")
              break
            end
            wait()
          end
        end)
        while L20_22:isRunning() do
          if L18_20 >= DOG_FORCE_MOVE_TIME then
            L20_22:abort()
            Fn_playMotionNpc("sm20_dog_01", "stay", false)
            Fn_warpNpc("sm20_dog_01", "pcNode" .. L38_40)
            print("\230\149\145\230\184\136\230\142\170\231\189\174\239\188\154\231\138\172\227\131\175\227\131\188\227\131\151")
            break
          end
          wait()
        end
        if L20_22:isRunning() then
          L20_22:abort()
          Fn_playMotionNpc("sm20_dog_01", "stay", false)
        end
        L43_45 = Mv_safeTaskAbort(L43_45)
        wait()
        if L18_20 >= DOG_FORCE_MOVE_TIME then
          Fn_turnNpc("sm20_dog_01", "locator2_girl_pos_01c")
        end
        L18_20 = 0
        if L15_17 then
          bring_hdl:kill()
          bring_hdl = nil
        end
        invokeTask(function()
          Sound:pulse("dog_bark")
          Fn_playMotionNpc("sm20_dog_01", "glad_00", true)
          Fn_playMotionNpc("sm20_dog_01", "stay", false)
        end)
        Sound:pulse("w10_920a")
        Fn_playMotionNpc("girl01", "handclap", false)
        L17_19 = L17_19 + POINT_TABLE[_throw_target]
        if POINT_TABLE[_throw_target] < 20 then
          Fn_captionViewWait("sm20_02018")
        elseif POINT_TABLE[_throw_target] == 20 then
          Fn_captionViewWait("sm20_02019")
        elseif POINT_TABLE[_throw_target] > 20 then
          Fn_captionViewWait("sm20_02020")
        end
        L34_36 = Mv_safeTaskAbort(L34_36)
        if L15_17 and L17_19 >= POINT_MAX then
          L17_19 = POINT_MAX
          L16_18 = true
        end
      end
      _free_move = false
      if L16_18 then
        L35_37 = print
        L36_38 = "\227\130\175\227\131\170\227\130\162"
        L35_37(L36_38)
        break
      end
      L35_37 = print
      L36_38 = "happy_point = "
      L37_39 = L17_19
      L36_38 = L36_38 .. L37_39
      L35_37(L36_38)
      if L11_13 then
        L35_37 = Fn_blackout
        L35_37()
        L35_37 = Fn_resetPcPos
        L36_38 = "locator2_pc_start_pos"
        L35_37(L36_38)
        L35_37 = dropedDiskErace
        L36_38 = disk_hdl
        L35_37(L36_38)
        L35_37 = wait
        L35_37()
        L35_37 = Fn_userCtrlOff
        L35_37()
        L35_37 = playOutAreaMarker
        L35_37()
        L35_37 = Fn_fadein
        L35_37()
        L35_37 = Fn_captionViewWait
        L36_38 = "sm20_02017"
        L35_37(L36_38)
      end
      dym_obj = nil
      disk_hdl = nil
      L35_37 = true
      if L11_13 then
        L35_37 = false
      elseif not L14_16 then
        L26_28 = L26_28 + 1
        if L26_28 < 3 then
          L35_37 = false
        else
          L36_38 = Fn_captionViewWait
          L37_39 = "sm20_02023"
          L36_38(L37_39)
          L35_37 = true
          L26_28 = 0
        end
      else
        L26_28 = 0
      end
      L36_38 = throwStartCall
      L37_39 = L35_37
      L36_38(L37_39)
      _disk_final_place = 0
      L14_16 = false
      L15_17 = false
      L36_38 = Mv_safeTaskAbort
      L37_39 = L34_36
      L36_38 = L36_38(L37_39)
      L34_36 = L36_38
      L36_38 = Mv_safeTaskAbort
      L37_39 = L29_31
      L36_38 = L36_38(L37_39)
      L36_38 = Fn_userCtrlOn
      L36_38()
    end
  end
  L27_29(L28_30)
  near_sensor_hdl = nil
  for L30_32 = 1, 5 do
    L31_33 = L5_7[L30_32]
    L32_34 = L31_33
    L31_33 = L31_33.kill
    L31_33(L32_34)
    L5_7[L30_32] = nil
  end
  L21_23 = L27_29
  L27_29(L28_30, L29_31)
  L27_29()
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29()
  L27_29(L28_30)
  L27_29()
  L27_29()
  L27_29()
  L27_29(L28_30, L29_31)
  L27_29(L28_30, L29_31)
  L30_32 = "locator2_demo_happy_aim_01"
  L31_33 = false
  L27_29(L28_30, L29_31, L30_32, L31_33)
  L27_29(L28_30)
  L27_29(L28_30)
  L30_32 = false
  L27_29(L28_30, L29_31, L30_32)
  L27_29(L28_30)
  L27_29()
  L30_32 = false
  L27_29(L28_30, L29_31, L30_32)
  L30_32 = false
  L27_29(L28_30, L29_31, L30_32)
  L27_29(L28_30)
  L27_29(L28_30)
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29(L28_30)
  L27_29()
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29(L28_30, L29_31)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29()
  L27_29(L28_30)
  L30_32 = false
  L27_29(L28_30, L29_31, L30_32)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29(L28_30)
  L30_32 = false
  L27_29(L28_30, L29_31, L30_32)
  L27_29(L28_30)
  L30_32 = "locator2_client_final_move"
  L30_32 = {}
  L30_32.runLength = -1
  L30_32.arrivedLength = 0
  L30_32.recast = true
  L30_32.anim_run_speed = 0.4
  L30_32.anim_speed_over = true
  move_task1 = L27_29
  L30_32 = "locator2_dog_final_move"
  L30_32 = {}
  L30_32.runLength = -1
  L30_32.arrivedLength = 0
  L30_32.recast = true
  L30_32.anim_run_speed = 0.8
  L30_32.anim_speed_over = true
  move_task2 = L27_29
  L30_32 = "locator2_girl_final_move"
  L30_32 = {}
  L30_32.runLength = -1
  L30_32.arrivedLength = 0
  L30_32.recast = true
  L30_32.anim_run_speed = 0.8
  L30_32.anim_speed_over = true
  move_task3 = L27_29
  while true do
    if L27_29 ~= true then
      if L27_29 ~= true then
      end
    end
    if L27_29 == true then
      L27_29()
    end
  end
  L27_29(L28_30)
  L27_29(L28_30, L29_31)
  L27_29()
  L27_29()
  L27_29()
  L27_29()
  L27_29()
end
function Finalize()
  Player:setGrabThrowVelocityLimit()
  Player:setGrabThrowFreeFall()
  Player:setForcedNormalGrab(false)
end
function cubesensor2_too_near_area_01_OnEnter(A0_47)
  _disk_final_place = 1
  print("\232\191\145\227\129\153\227\129\142")
end
function cubesensor2_too_near_area_01_OnLeave(A0_48)
  if _disk_final_place == 1 then
    _disk_final_place = 0
  end
  print("\232\191\145\227\129\153\227\129\142\232\167\163\233\153\164")
end
function cubesensor2_good_area_01_OnEnter(A0_49)
  if _throw_target == 1 then
    _disk_final_place = 2
    print("\227\130\176\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_02_OnEnter(A0_50)
  if _throw_target == 2 then
    _disk_final_place = 2
    print("\227\130\176\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_03_OnEnter(A0_51)
  if _throw_target == 3 then
    _disk_final_place = 2
    print("\227\130\176\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_04_OnEnter(A0_52)
  if _throw_target == 4 then
    _disk_final_place = 2
    print("\227\130\176\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_05_OnEnter(A0_53)
  if _throw_target == 5 then
    _disk_final_place = 2
    print("\227\130\176\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_06_OnEnter(A0_54)
  if _throw_target == 6 then
    _disk_final_place = 2
    print("\227\130\176\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_01_OnLeave(A0_55)
  if _throw_target == 1 and _disk_final_place == 2 then
    _disk_final_place = 0
    print("\227\131\144\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_02_OnLeave(A0_56)
  if _throw_target == 2 and _disk_final_place == 2 then
    _disk_final_place = 0
    print("\227\131\144\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_03_OnLeave(A0_57)
  if _throw_target == 3 and _disk_final_place == 2 then
    _disk_final_place = 0
    print("\227\131\144\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_04_OnLeave(A0_58)
  if _throw_target == 4 and _disk_final_place == 2 then
    _disk_final_place = 0
    print("\227\131\144\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_05_OnLeave(A0_59)
  if _throw_target == 5 and _disk_final_place == 2 then
    _disk_final_place = 0
    print("\227\131\144\227\131\131\227\131\137")
  end
end
function cubesensor2_good_area_06_OnLeave(A0_60)
  if _throw_target == 6 and _disk_final_place == 2 then
    _disk_final_place = 0
    print("\227\131\144\227\131\131\227\131\137")
  end
end
function cubesensor2_too_far_area_OnEnter(A0_61)
  _disk_final_place = 4
  print("\233\129\160\227\129\153\227\129\142")
end
function cubesensor2_too_far_area_OnLeave(A0_62)
  if _disk_final_place == 4 then
    _disk_final_place = 0
  end
end
function cubesensor2_throw_area_OnEnter(A0_63)
  _in_warn_area = false
  print("\227\130\185\227\131\173\227\131\188\232\168\177\229\143\175")
  Fn_unLockPlayerAbility(Player.kAbility_Throw)
  Fn_tutorialCaption("throw")
  print("\229\133\165\227\129\163\227\129\159")
end
function cubesensor2_throw_area_OnLeave(A0_64)
  _in_warn_area = true
  print("\227\130\185\227\131\173\227\131\188\231\166\129\230\173\162")
  Fn_lockPlayerAbility(Player.kAbility_Throw)
  Fn_tutorialCaptionKill()
  print("\229\135\186\227\129\159")
end
function cubesensor2_throw_area2_OnEnter(A0_65)
  local L1_66
  _in_throw_area = true
end
function cubesensor2_throw_area2_OnLeave(A0_67)
  local L1_68
  _in_throw_area = false
end
function setAreaMarker(A0_69, A1_70)
  local L2_71, L3_72, L4_73
  L2_71 = print
  L3_72 = "\227\130\168\227\131\170\227\130\162\227\131\158\227\131\188\227\130\171\227\131\188\227\129\174\231\148\159\230\136\144"
  L2_71(L3_72)
  L2_71 = findGameObject2
  L3_72 = "Node"
  L4_73 = A1_70
  L2_71 = L2_71(L3_72, L4_73)
  L4_73 = L2_71
  L3_72 = L2_71.getWorldTransform
  L4_73 = L3_72(L4_73)
  _marker_hdl = createGameObject2("MapMarker")
  _marker_hdl:setAssetName("gui_marker_30")
  _marker_hdl:setName("range_marker_" .. A0_69)
  _marker_hdl:setWorldTransform(L3_72, L4_73)
  _marker_hdl:setupPattern("C", Vector(6, 1.5, 6))
  _marker_hdl:setActive(true)
  _marker_hdl:setForceMove()
  start_game_obj()
end
function switchAreaMarker(A0_74)
  setAreaMarker(A0_74, "locator2_good_target" .. A0_74)
  Fn_naviSet(findGameObject2("Node", "locator2_good_target" .. A0_74))
end
function playOutAreaMarker()
  if _marker_hdl ~= nil then
    _marker_hdl:playOut()
    print("\227\131\158\227\131\188\227\130\171\230\182\136\227\129\151\227\129\190\227\129\153")
    invokeTask(function()
      while not _marker_hdl:isOutEnd() do
        wait()
      end
      _marker_hdl:try_term()
    end)
  end
  Fn_naviKill()
end
function throwStartCall(A0_75)
  local L1_76
  L1_76 = 1
  if _throw_target == 0 then
    _throw_target = RandI(1, MARKER_NUM)
  elseif A0_75 then
    _throw_target = _throw_target + RandI(1, MARKER_NUM - 1)
    if _throw_target > MARKER_NUM then
      _throw_target = _throw_target - MARKER_NUM
    end
  end
  switchAreaMarker(_throw_target)
  Fn_sensorOn(_marker_hdl)
  invokeTask(function()
    Fn_turnNpc("girl01", "locator2_good_target" .. _throw_target)
    Fn_playMotionNpc("girl01", "inform_in", true)
    _girl_inform_task = Fn_repeatPlayMotion("girl01", "inform_lp", {"inform_lp"})
    Sound:pulse("w10_901a")
    Fn_turnNpc("sm20_dog_01", "locator2_good_target" .. _throw_target)
  end)
  Fn_captionViewWait("sm20_02021")
  Fn_playMotionNpc("girl01", "inform_ed", false)
  _girl_inform_task = Mv_safeTaskAbort(_girl_inform_task)
end
function isInAngle(A0_77, A1_78)
  local L2_79, L3_80
  L2_79 = _findObjectHandle
  L3_80 = A0_77
  L2_79 = L2_79(L3_80)
  L3_80 = {}
  L3_80.left = -0.5
  L3_80.top = -0.5
  L3_80.right = 0.5
  L3_80.bottom = 1
  if A1_78 ~= nil then
    if A1_78 > 1 then
      A1_78 = 1
    end
    print("\227\131\172\227\130\183\227\130\170" .. A1_78)
    L3_80.left = -1 * A1_78
    L3_80.right = A1_78
  end
  if Query:calcInSightRatioGameObject(L2_79) == nil then
    return false
  end
  Query:debugDrawInSightRatio(L3_80)
  print("\227\131\134\227\131\188\227\131\150\227\131\171\232\191\148\227\129\153")
  print(Query:debugDrawInSightRatio(L3_80))
  if Query:calcInSightRatioGameObject(L2_79).left > L3_80.left and Query:calcInSightRatioGameObject(L2_79).right < L3_80.right then
    return true
  end
  return false
end
function isDiskStay(A0_81)
  local L1_82
  L1_82 = _is_stay
  return L1_82
end
function stayObserverStart(A0_83)
  _stay_task = invokeTask(function()
    local L0_84
    while true do
      L0_84 = disk_hdl
      L0_84 = L0_84.getDynamicObject
      L0_84 = L0_84(L0_84)
      if L0_84 then
        L0_84 = A0_83
        L0_84 = L0_84.getDynamicObject
        L0_84 = L0_84(L0_84)
        L0_84 = L0_84.getWorldPos
        L0_84 = L0_84(L0_84)
        _is_stay = L0_84:DistanceTo(_prev_pos) < 0.01
        print(L0_84, _prev_pos)
        if _is_stay then
          print("stay")
        end
        _prev_pos = L0_84
      end
      L0_84 = wait
      L0_84()
    end
  end)
end
function stayObserverEnd()
  _stay_task = Mv_safeTaskAbort(_stay_task)
  _is_stay = false
end
function dropedDiskErace(A0_85)
  if A0_85:getDynamicObject() then
    A0_85:getDynamicObject():setActive(false)
    A0_85:getDynamicObject():setVisible(false)
    A0_85:getDynamicObject():kill()
  end
end
