dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
import("Area")
BOX_MAX = 12
DEMO_MAX = 5
_puppet_tbl = {}
_ship_se = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "bird_01",
      type = "gull01",
      node = "locator2_bird_01",
      use_gravity = false
    },
    {
      name = "chi_01",
      type = "chi13",
      node = "locator2_chi_01"
    },
    {
      name = "chi_02",
      type = "chi14",
      node = "locator2_chi_02"
    },
    {
      name = "man_01",
      type = "man38",
      node = "locator2_man_01"
    },
    {
      name = "man_02",
      type = "man41",
      node = "locator2_man_02"
    },
    {
      name = "wom_01",
      type = "wom23",
      node = "locator2_wom_01"
    },
    {
      name = "wom_02",
      type = "wom21",
      node = "locator2_wom_02"
    },
    {
      name = "walk",
      type = "man_jil",
      node = "locator2_npc_walk"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_01 = SDemo.create("sm47_c_01")
  _sdemo_02 = SDemo.create("sm47_c_02")
  _sdemo_03 = SDemo.create("sm47_c_03")
  _sdemo_04 = SDemo.create("sm47_c_04")
  _sdemo_05 = SDemo.create("sm47_c_05")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = {}
  L1_2 = {}
  L2_3 = {}
  L3_4 = {}
  L4_5 = false
  L5_6 = Fn_sendEventComSb
  L6_7 = "getVeHdl"
  L5_6 = L5_6(L6_7)
  if L5_6 == nil then
    L4_5 = true
    L5_6 = print
    L6_7 = "\232\136\185\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\231\148\159\230\136\144"
    L5_6(L6_7)
    L5_6 = Fn_sendEventComSb
    L6_7 = "requestShipCreate"
    L5_6(L6_7)
    L5_6 = wait
    L5_6()
  else
    L5_6 = Fn_sendEventComSb
    L6_7 = "resetShipPosition"
    L5_6(L6_7)
  end
  L5_6 = Fn_sendEventComSb
  L6_7 = "getVeHdl"
  L5_6 = L5_6(L6_7)
  L6_7 = {}
  L7_8 = {}
  L7_8.max_a = 0
  L7_8.min_a = 0
  L6_7.xz = L7_8
  L7_8 = {}
  L7_8.rand = 0.5
  L7_8.sign = 1
  L7_8.max_a = 0.2
  L7_8.min_a = 0.1
  L7_8.max_t = 5
  L7_8.min_t = 3
  L6_7.y = L7_8
  L7_8 = {}
  L7_8.max_a = 0
  L7_8.min_a = 0
  L6_7.angle = L7_8
  L7_8 = wait
  L7_8()
  L8_9 = L5_6
  L7_8 = L5_6.setDriftParams
  L7_8(L8_9, L9_10)
  L7_8 = createGameObject2
  L8_9 = "Node"
  L7_8 = L7_8(L8_9)
  L8_9 = L7_8.setTransform
  L21_22 = L10_11(L11_12, L12_13)
  L8_9(L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L10_11(L11_12, L12_13))
  L8_9 = L5_6.appendChild
  L8_9(L9_10, L10_11)
  L8_9 = L7_8.try_init
  L8_9(L9_10)
  L8_9 = L7_8.waitForReady
  L8_9(L9_10)
  L8_9 = L7_8.try_start
  L8_9(L9_10)
  L8_9 = Fn_findNpc
  L8_9 = L8_9(L9_10)
  L9_10(L10_11, L11_12, L12_13)
  for L12_13 = 1, BOX_MAX do
    L13_14 = findGameObject2
    L14_15 = "Node"
    L15_16 = "locator2_box_"
    L16_17 = string
    L16_17 = L16_17.format
    L16_17 = L16_17(L17_18, L18_19)
    L15_16 = L15_16 .. L16_17
    L13_14 = L13_14(L14_15, L15_16)
    L2_3[L12_13] = L13_14
  end
  if L4_5 then
    L13_14 = "chair_yj_01_brk_dy"
    L13_14 = "bag_02"
    L14_15 = "chair_yj_04_brk_dy"
    L13_14 = L2_3[3]
    L14_15 = "bag_03"
    L15_16 = "woodbox_sk_01"
    L13_14 = Fn_createGimmickBg
    L14_15 = L2_3[4]
    L15_16 = "bag_04"
    L16_17 = "table_sk_02"
    L13_14 = L13_14(L14_15, L15_16, L16_17)
    L14_15 = Fn_createGimmickBg
    L15_16 = L2_3[5]
    L16_17 = "bag_05"
    L14_15 = L14_15(L15_16, L16_17, L17_18)
    L15_16 = Fn_createGimmickBg
    L16_17 = L2_3[6]
    L15_16 = L15_16(L16_17, L17_18, L18_19)
    L16_17 = Fn_createGimmickBg
    L16_17 = L16_17(L17_18, L18_19, L19_20)
    L20_21 = "woodbox_kk_02"
    L20_21 = "bag_09"
    L21_22 = "woodbox_kk_05"
    L20_21 = L2_3[10]
    L21_22 = "bag_10"
    L21_22 = L19_20(L20_21, L21_22, "woodbox_kk_05")
    ;({
      L10_11,
      L11_12,
      L12_13,
      L13_14,
      L14_15,
      L15_16,
      L16_17,
      L17_18,
      L18_19,
      [13] = L19_20(L20_21, L21_22, "woodbox_kk_05")
    })[10] = L19_20
    ;({
      L10_11,
      L11_12,
      L12_13,
      L13_14,
      L14_15,
      L15_16,
      L16_17,
      L17_18,
      L18_19,
      [13] = L19_20(L20_21, L21_22, "woodbox_kk_05")
    })[11] = L20_21
    ;({
      L10_11,
      L11_12,
      L12_13,
      L13_14,
      L14_15,
      L15_16,
      L16_17,
      L17_18,
      L18_19,
      [13] = L19_20(L20_21, L21_22, "woodbox_kk_05")
    })[12] = L21_22
    L3_4 = L9_10
    for L12_13, L13_14 in L9_10(L10_11) do
      L15_16 = L13_14
      L14_15 = L13_14.getWorldPos
      L14_15 = L14_15(L15_16)
      L0_1[L12_13] = L14_15
      L15_16 = L13_14
      L14_15 = L13_14.getWorldRot
      L14_15 = L14_15(L15_16)
      L1_2[L12_13] = L14_15
      L15_16 = L13_14
      L14_15 = L13_14.setWorldPos
      L16_17 = L0_1[L12_13]
      L14_15(L15_16, L16_17)
      L15_16 = L13_14
      L14_15 = L13_14.setWorldRot
      L16_17 = L1_2[L12_13]
      L14_15(L15_16, L16_17)
      L15_16 = L5_6
      L14_15 = L5_6.appendChild
      L16_17 = L3_4[L12_13]
      L14_15(L15_16, L16_17)
      L14_15 = L3_4[L12_13]
      L15_16 = L14_15
      L14_15 = L14_15.setWorldPos
      L16_17 = L0_1[L12_13]
      L14_15(L15_16, L16_17)
      L14_15 = L3_4[L12_13]
      L15_16 = L14_15
      L14_15 = L14_15.setWorldRot
      L16_17 = L1_2[L12_13]
      L14_15(L15_16, L16_17)
    end
  else
    L10_11(L11_12)
    for L13_14, L14_15 in L10_11(L11_12) do
      L15_16 = L9_10[L13_14]
      L16_17 = L15_16
      L15_16 = L15_16.getWorldPos
      L15_16 = L15_16(L16_17)
      L16_17 = L5_6.appendChild
      L16_17 = L16_17(L17_18, L18_19)
      L17_18(L18_19, L19_20)
    end
  end
  L9_10(L10_11, L11_12)
  L9_10(L10_11)
  L9_10(L10_11, L11_12, L12_13)
  L13_14 = true
  L9_10(L10_11, L11_12, L12_13, L13_14)
  L9_10(L10_11, L11_12, L12_13)
  L9_10()
  L10_11.pos = "locator2_sdemo_cam_b_08"
  L10_11.time = 3.5
  L10_11.hashfunc = "EaseIn"
  L11_12.pos = "locator2_sdemo_cam_b_09"
  L11_12.time = 3.5
  L11_12.hashfunc = "EaseOut"
  L11_12.pos = "locator2_sdemo_aim_b_09"
  L11_12.time = 3.5
  L11_12.hashfunc = "EaseIn"
  L12_13.pos = "locator2_sdemo_aim_b_09"
  L12_13.time = 3.5
  L12_13.hashfunc = "EaseOut"
  L13_14 = L9_10
  L14_15 = L10_11
  L11_12(L12_13, L13_14, L14_15)
  while true do
    if L11_12 then
      L11_12()
    end
  end
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12()
  L13_14 = "vcar01_stay_00"
  L14_15 = false
  L15_16 = {}
  L15_16.animBlendDuration = 0.6
  L11_12(L12_13, L13_14, L14_15, L15_16)
  L13_14 = 1
  L11_12(L12_13, L13_14)
  L13_14 = L11_12
  L12_13(L13_14)
  L13_14 = L11_12
  L12_13(L13_14)
  L13_14 = L11_12
  L12_13(L13_14)
  L13_14 = L5_6
  L14_15 = L11_12
  L12_13(L13_14, L14_15)
  L13_14 = L11_12
  L14_15 = Vector
  L15_16 = 0
  L16_17 = 7
  L21_22 = L14_15(L15_16, L16_17, L17_18)
  L12_13(L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L14_15(L15_16, L16_17, L17_18))
  L13_14 = L11_12
  L14_15 = true
  L12_13(L13_14, L14_15)
  L13_14 = L12_13
  L14_15 = "ship_fly"
  L15_16 = 1
  L16_17 = ""
  _ship_se = L12_13
  L13_14 = L5_6
  L14_15 = L11_12
  L12_13(L13_14, L14_15)
  L13_14 = 3.5
  L12_13(L13_14)
  L13_14 = L12_13
  L14_15 = L5_6
  L15_16 = _puppet_tbl
  L15_16 = L15_16.bird_01
  L16_17 = true
  L12_13(L13_14, L14_15, L15_16, L16_17)
  L13_14 = L12_13
  L14_15 = Vector
  L15_16 = 10
  L16_17 = 7
  L14_15 = L14_15(L15_16, L16_17, L17_18)
  L15_16 = Vector
  L16_17 = 0
  L21_22 = L15_16(L16_17, L17_18, L18_19)
  L12_13(L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L15_16(L16_17, L17_18, L18_19))
  L13_14 = L12_13
  L14_15, L15_16 = nil, nil
  L16_17 = {}
  L16_17.deg = 10
  L12_13(L13_14, L14_15, L15_16, L16_17)
  L13_14 = L12_13
  L14_15 = true
  L15_16 = 0
  L12_13(L13_14, L14_15, L15_16)
  function L13_14()
    _sdemo_02:zoomOut(7, {deg = 60}, "easeInOut")
  end
  L12_13(L13_14)
  L13_14 = 0.5
  L12_13(L13_14)
  L13_14 = {}
  L13_14.pos = "locator2_bird_move_01"
  L13_14.attr = "takeoff"
  L14_15 = {}
  L14_15.pos = "locator2_bird_move_02"
  L14_15.attr = "fly"
  L15_16 = {}
  L15_16.pos = "locator2_bird_move_03"
  L15_16.attr = "fly"
  L16_17 = {}
  L16_17.pos = "locator2_bird_move_04"
  L16_17.attr = "fly"
  L17_18.pos = "locator2_bird_move_05"
  L17_18.attr = "fly"
  L18_19.pos = "locator2_bird_move_06"
  L18_19.attr = "fly"
  L19_20.pos = "locator2_bird_move_07"
  L19_20.attr = "fly"
  L20_21 = {}
  L20_21.pos = "locator2_bird_move_08"
  L20_21.attr = "fly"
  L21_22 = {}
  L21_22.pos = "locator2_bird_move_09"
  L21_22.attr = "fly"
  L13_14 = {}
  L13_14.anim_in = "takeoff"
  L14_15 = {L15_16}
  L15_16 = "fly"
  L13_14.anim_lp = L14_15
  L13_14.moveSpeed = 5
  L14_15 = Fn_findNpc
  L15_16 = "bird_01"
  L14_15 = L14_15(L15_16)
  L15_16 = L14_15
  L14_15 = L14_15.fly
  L16_17 = L12_13
  L14_15(L15_16, L16_17, L17_18)
  L14_15 = waitSeconds
  L15_16 = 8.5
  L14_15(L15_16)
  L14_15 = _sdemo_03
  L15_16 = L14_15
  L14_15 = L14_15.set
  L16_17 = "locator2_sdemo_cam_b_03"
  L14_15(L15_16, L16_17, L17_18)
  L14_15 = _sdemo_03
  L15_16 = L14_15
  L14_15 = L14_15.switchCamera
  L16_17 = true
  L14_15(L15_16, L16_17, L17_18)
  L15_16 = L5_6
  L14_15 = L5_6.setMoveVelocity
  L16_17 = 2.6
  L14_15(L15_16, L16_17)
  L14_15 = {}
  L14_15.label01 = "kit01_hail_00"
  L15_16 = Fn_loadPlayerMotion
  L16_17 = L14_15
  L15_16(L16_17)
  L15_16 = Fn_playPlayerMotion
  L16_17 = L14_15.label01
  L15_16(L16_17, L17_18, L18_19, L19_20)
  L15_16 = waitSeconds
  L16_17 = 3
  L15_16(L16_17)
  L15_16 = Fn_blackout
  L15_16()
  L16_17 = L5_6
  L15_16 = L5_6.setWorldTransform
  L21_22 = L17_18(L18_19)
  L15_16(L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L17_18(L18_19))
  L16_17 = L5_6
  L15_16 = L5_6.setForceMove
  L15_16(L16_17)
  L16_17 = L5_6
  L15_16 = L5_6.setMoveVelocity
  L15_16(L16_17, L17_18)
  L15_16 = Fn_setKittenAndCatActive
  L16_17 = false
  L15_16(L16_17)
  L15_16 = Fn_resetPcPos
  L16_17 = "locator2_pc_sub_pos_01"
  L15_16(L16_17)
  L15_16 = waitSeconds
  L16_17 = 3
  L15_16(L16_17)
  L16_17 = L5_6
  L15_16 = L5_6.setMoveTarget
  L21_22 = L17_18(L18_19, L19_20)
  L15_16(L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L17_18(L18_19, L19_20))
  L15_16 = _sdemo_04
  L16_17 = L15_16
  L15_16 = L15_16.set
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = _sdemo_04
  L16_17 = L15_16
  L15_16 = L15_16.switchCamera
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_fadein
  L15_16()
  L15_16 = _sdemo_04
  L16_17 = L15_16
  L15_16 = L15_16.play
  L19_20.pos = "locator2_sdemo_aim_b_05"
  L19_20.time = 15
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_playMotionNpc
  L16_17 = "chi_01"
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_playMotionNpc
  L16_17 = "chi_02"
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = {}
  L16_17 = {}
  L20_21 = "locator2_man_01_move"
  L20_21 = {}
  L20_21.runLength = 2
  L15_16[1] = L17_18
  L17_18(L18_19)
  L20_21 = "locator2_chi_01_move"
  L20_21 = {}
  L20_21.runLength = 2
  L15_16[2] = L17_18
  L20_21 = "locator2_chi_02_move"
  L20_21 = {}
  L20_21.runLength = 2
  L15_16[3] = L17_18
  for L20_21, L21_22 in L17_18(L18_19) do
    invokeTask(function()
      while Mv_isSafeTaskRunning(L21_22) do
        wait()
      end
      if L20_21 == 1 then
        Fn_playMotionNpc("man_01", "wavehand_far_00", true)
        Fn_playMotionNpc("man_01", "walk_l", true)
        Fn_playMotionNpc("man_01", "call_00", false)
      elseif L20_21 == 2 then
        L16_17[L20_21] = Fn_repeatPlayMotion("chi_01", "talk_laugh_00", {
          "talk_laugh_00"
        }, 5, 10)
      else
        L16_17[L20_21] = Fn_repeatPlayMotion("chi_02", "greeting", {"greeting"}, 5, 10)
      end
      L21_22 = Mv_safeTaskAbort(L21_22)
    end)
    break
  end
  L17_18(L18_19)
  L17_18()
  L20_21 = "Node"
  L21_22 = "locator2_ship_move_po_03"
  L20_21 = L19_20
  L21_22 = L19_20(L20_21)
  L17_18(L18_19, L19_20, L20_21, L21_22, L19_20(L20_21))
  L17_18(L18_19)
  L17_18(L18_19)
  for L20_21, L21_22 in L17_18(L18_19) do
    L21_22 = Mv_safeTaskAbort(L21_22)
  end
  L20_21 = "Node"
  L21_22 = "locator2_ship_move_po_04"
  L21_22 = L19_20(L20_21, L21_22)
  L17_18(L18_19, L19_20, L20_21, L21_22, L19_20(L20_21, L21_22))
  L17_18(L18_19, L19_20)
  L20_21 = false
  L17_18(L18_19, L19_20, L20_21)
  L20_21 = false
  L17_18(L18_19, L19_20, L20_21)
  L20_21 = false
  L17_18(L18_19, L19_20, L20_21)
  L20_21 = "locator2_npc_walk_node_01"
  L21_22 = "locator2_npc_walk_node_02"
  L15_16[4] = L17_18
  L20_21 = 0.1
  L21_22 = nil
  L17_18(L18_19, L19_20, L20_21, L21_22)
  L20_21 = "locator2_sdemo_aim_b_06"
  L21_22 = true
  L17_18(L18_19, L19_20, L20_21, L21_22)
  L17_18()
  L20_21 = {}
  L20_21.pos = "locator2_sdemo_cam_b_10"
  L20_21.time = 26
  L20_21 = {L21_22}
  L21_22 = {}
  L21_22.pos = "locator2_sdemo_aim_b_08"
  L21_22.time = 26
  L17_18(L18_19, L19_20, L20_21)
  L17_18(L18_19)
  while true do
    if not L18_19 then
      L18_19()
    end
  end
  L20_21 = findGameObject2
  L21_22 = "Node"
  L21_22 = L20_21(L21_22, "locator2_ship_reset_02")
  L18_19(L19_20, L20_21, L21_22, L20_21(L21_22, "locator2_ship_reset_02"))
  while true do
    if not L18_19 then
      L18_19()
    end
  end
  L20_21 = L5_6
  L18_19(L19_20, L20_21)
  L20_21 = 1.3
  L18_19(L19_20, L20_21)
  L20_21 = findGameObject2
  L21_22 = "Node"
  L21_22 = L20_21(L21_22, "locator2_ship_move_po_02")
  L18_19(L19_20, L20_21, L21_22, L20_21(L21_22, "locator2_ship_move_po_02"))
  if L18_19 ~= nil then
    L20_21 = _freighter_se
    L18_19(L19_20, L20_21)
  end
  _ship_se = nil
  L18_19(L19_20)
  L20_21 = L5_6
  L18_19(L19_20, L20_21)
  L18_19(L19_20)
  L20_21 = 0.7
  L18_19(L19_20, L20_21)
  L20_21 = L5_6
  L18_19(L19_20, L20_21)
  L18_19(L19_20)
  L20_21 = 0.4
  L18_19(L19_20, L20_21)
  L18_19(L19_20)
  L20_21 = 0.2
  L18_19(L19_20, L20_21)
  L20_21 = L5_6
  L18_19(L19_20, L20_21)
  L18_19(L19_20)
  L18_19(L19_20)
  L18_19()
  L18_19()
  L18_19(L19_20)
  L20_21 = 0
  L18_19(L19_20, L20_21)
  L20_21 = 0
  L18_19(L19_20, L20_21)
  L20_21 = 0
  L18_19(L19_20, L20_21)
  L20_21 = 0
  L18_19(L19_20, L20_21)
  L20_21 = 0
  L18_19(L19_20, L20_21)
  L15_16[4] = L18_19
  L20_21 = "locator2_client_po_01"
  L18_19(L19_20, L20_21)
  L20_21 = "locator2_mad_po_01"
  L18_19(L19_20, L20_21)
  L18_19(L19_20)
  L18_19()
  L18_19(L19_20)
  L18_19()
  L18_19()
  L18_19()
  L18_19()
  L18_19()
end
function Finalize()
  if _ship_se ~= nil then
    Sound:stopSEHandle(_freighter_se)
  end
  _ship_se = nil
end
