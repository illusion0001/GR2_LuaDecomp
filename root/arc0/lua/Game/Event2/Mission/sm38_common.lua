_is_caption_now = false
L0_0 = {
  {
    model = {
      "man05",
      "man07",
      "man73"
    },
    voice = "m29_935"
  },
  {
    model = {
      "man08",
      "man64",
      "man01"
    },
    voice = "m30_935"
  },
  {
    model = {
      "man02",
      "man09",
      "man25",
      "man26",
      "man83"
    },
    voice = "m31_935"
  },
  {
    model = {
      "man77",
      "man82",
      "man17",
      "man31"
    },
    voice = "m32_935"
  },
  {
    model = {
      "man10",
      "man74",
      "man81",
      "man18",
      "man30"
    },
    voice = "m33_935"
  },
  {
    model = {"man79"},
    voice = "m34_935"
  },
  {
    model = {"man80"},
    voice = "m35_935"
  },
  {
    model = {"man70", "man71"},
    voice = "m36_935"
  },
  {
    model = {"chi19"},
    voice = "m37_935"
  },
  {
    model = {
      "kid01",
      "kid02",
      "kid03"
    },
    voice = "m38_935"
  },
  {
    model = {"wom43"},
    voice = "w13_935"
  },
  {
    model = {"wom45"},
    voice = "w14_935"
  },
  {
    model = {"wom15"},
    voice = "w15_935"
  },
  {
    model = {
      "wom01",
      "wom05",
      "wom31",
      "wom41"
    },
    voice = "w16_935"
  },
  {
    model = {
      "wom03",
      "wom04",
      "wom44",
      "wom46"
    },
    voice = "w17_935"
  },
  {
    model = {"wom47"},
    voice = "w18_935"
  },
  {
    model = {"wom38"},
    voice = "w19_935"
  },
  {
    model = {"wom39"},
    voice = "w20_935"
  },
  {
    model = {"wom40"},
    voice = "w21_935"
  },
  {
    model = {"chi20"},
    voice = "w22_935"
  }
}
lively_voice_group = L0_0
_frame_count = 0
L0_0 = {}
_interval_max = L0_0
_auto_move_index = 1
function L0_0(A0_1)
  local L1_2
  if A0_1 == nil then
    L1_2 = {400}
    A0_1 = L1_2
  end
  _interval_max = A0_1
  _auto_move_index = 1
  L1_2 = _interval_max
  L1_2 = L1_2[_auto_move_index]
  _frame_count = L1_2
end
SM38_initDogAutoFrame = L0_0
_dog_move_index = 1
_dog_move_task = nil
_prev_grab_count = 0
_cap_idx = 1
_catch_flg = false
_fail_cnt = 0
_dog_wait_step = 1
L0_0 = {
  3,
  6,
  9,
  12,
  15
}
_dog_wait_time = L0_0
_dog_esc_dist_step = 1
L0_0 = {
  {
    cnt = 20,
    dist = 3,
    time = 1200
  }
}
_dog_esc_dist = L0_0
_dog_esc_time = 0
_cant_grab_wait_task = nil
CANT_GRAB_TIME = 2
L0_0 = {}
L0_0.B = false
L0_0.C = false
L0_0.D = true
_grab_wait_tbl = L0_0
_a_part_cnt = 0
FAIL_MAX = 3
NAVI_DIST = 10
L0_0 = {
  {
    "sm38_00105",
    "sm38_00106",
    "sm38_00107"
  },
  {
    "sm38_00115",
    "sm38_00116",
    "sm38_00117"
  },
  {
    "sm38_00118",
    "sm38_00119",
    "sm38_00120"
  },
  {"sm38_00121"},
  {
    "sm38_00122",
    "sm38_00123",
    "sm38_00124"
  }
}
_kit_cap_tbl = L0_0
function L0_0(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10)
  local L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18
  L8_11 = _dog_esc_time
  L8_11 = L8_11 + 1
  _dog_esc_time = L8_11
  if A6_9 == nil then
    A6_9 = 5.2
  end
  if A7_10 == nil then
    A7_10 = 3.8
  end
  if A0_3 == nil then
    A0_3 = _kit_cap_tbl
  end
  L8_11 = {}
  if A3_6 then
    L9_12 = A3_6.anim_speed_over
  else
    L9_12 = L9_12 or false
  end
  L8_11.anim_speed_over = L9_12
  if A3_6 then
    L9_12 = A3_6.anim_run_speed
  else
    L9_12 = L9_12 or 1
  end
  L8_11.anim_run_speed = L9_12
  if A3_6 then
    L9_12 = A3_6.arrivedLength
  else
    L9_12 = L9_12 or 0.5
  end
  L8_11.arrivedLength = L9_12
  if A3_6 then
    L9_12 = A3_6.runLength
  else
    L9_12 = L9_12 or -1
  end
  L8_11.runLength = L9_12
  if A3_6 then
    L9_12 = A3_6.noTurn
  else
    L9_12 = L9_12 or true
  end
  L8_11.noTurn = L9_12
  if A3_6 then
    L9_12 = A3_6.avoidance
  else
    L9_12 = L9_12 or true
  end
  L8_11.avoidance = L9_12
  L9_12 = {}
  if A5_8 then
    L10_13 = A5_8.dist
  else
    L10_13 = L10_13 or 10
  end
  L9_12.dist = L10_13
  if A5_8 then
    L10_13 = A5_8.angle
  else
    L10_13 = L10_13 or 45
  end
  L9_12.angle = L10_13
  if A5_8 then
    L10_13 = A5_8.eye_offset_y
  else
    L10_13 = L10_13 or 0.1
  end
  L9_12.eye_offset_y = L10_13
  if A5_8 then
    L10_13 = A5_8.target_offset_y
  else
    L10_13 = L10_13 or 0
  end
  L9_12.target_offset_y = L10_13
  L10_13 = Fn_findNpc
  L11_14 = "escape_dog_01"
  L10_13 = L10_13(L11_14)
  L11_14 = _fail_cnt
  L12_15 = _dog_esc_dist
  L13_16 = _dog_esc_dist_step
  L12_15 = L12_15[L13_16]
  L12_15 = L12_15.cnt
  if not (L11_14 >= L12_15) then
    L11_14 = _dog_esc_time
    L12_15 = _dog_esc_dist
    L13_16 = _dog_esc_dist_step
    L12_15 = L12_15[L13_16]
    L12_15 = L12_15.time
  elseif L11_14 >= L12_15 then
    L11_14 = _dog_esc_dist
    L12_15 = _dog_esc_dist_step
    L11_14 = L11_14[L12_15]
    A7_10 = L11_14.dist
    L11_14 = _dog_esc_dist_step
    L11_14 = L11_14 + 1
    _dog_esc_dist_step = L11_14
    L11_14 = _dog_esc_dist_step
    L12_15 = _dog_esc_dist
    L12_15 = #L12_15
    if L11_14 >= L12_15 then
      L11_14 = _dog_esc_dist
      L11_14 = #L11_14
      _dog_esc_dist_step = L11_14
    end
  end
  L11_14 = _a_part_cnt
  L12_15 = FAIL_MAX
  if L11_14 >= L12_15 and A4_7 == "A" then
    L11_14 = true
    return L11_14
  end
  L11_14 = Fn_getDistanceToPlayer
  L12_15 = A1_4.puppet
  L11_14 = L11_14(L12_15)
  L12_15 = RAC_RaycastEyeSightBase
  L13_16 = A1_4.puppet
  L14_17 = Fn_getPlayer
  L14_17 = L14_17()
  L15_18 = L9_12.dist
  L12_15 = L12_15(L13_16, L14_17, L15_18, L9_12.angle, L9_12.eye_offset_y, L9_12.target_offset_y)
  L13_16 = NAVI_DIST
  if L11_14 <= L13_16 then
    L13_16 = RAC_NaviKill
    L14_17 = false
    L13_16(L14_17)
  end
  L13_16 = NAVI_DIST
  if L11_14 > L13_16 then
    L13_16 = HUD
    L14_17 = L13_16
    L13_16 = L13_16.naviSetActivate
    L15_18 = true
    L13_16(L14_17, L15_18, false)
    L13_16 = HUD
    L14_17 = L13_16
    L13_16 = L13_16.naviSetTarget
    L15_18 = A1_4.puppet
    L13_16(L14_17, L15_18)
  end
  L13_16 = _dog_move_task
  if L13_16 ~= nil then
    L13_16 = _dog_move_task
    L14_17 = L13_16
    L13_16 = L13_16.isRunning
    L13_16 = L13_16(L14_17)
  else
    if L13_16 == false then
      L13_16 = _cant_grab_wait_task
      if L13_16 ~= nil then
        L13_16 = _cant_grab_wait_task
        L14_17 = L13_16
        L13_16 = L13_16.isRunning
        L13_16 = L13_16(L14_17)
      elseif L13_16 == false then
        L13_16 = Fn_setGrabNpc
        L14_17 = L10_13
        L15_18 = false
        L13_16(L14_17, L15_18, false)
      end
  end
  elseif A4_7 ~= "A" then
    L13_16 = Fn_setGrabNpc
    L14_17 = L10_13
    L15_18 = true
    L13_16(L14_17, L15_18, true)
  end
  L13_16 = _grab_wait_tbl
  L13_16 = L13_16[A4_7]
  if L13_16 == true then
    L13_16 = _cant_grab_wait_task
    if L13_16 == nil then
      L13_16 = invokeTask
      function L14_17()
        Fn_setGrabNpc(L10_13, true, true)
        waitSeconds(CANT_GRAB_TIME)
        Fn_setGrabNpc(L10_13, false, false)
      end
      L13_16 = L13_16(L14_17)
      _cant_grab_wait_task = L13_16
    end
  end
  L13_16 = Player
  L14_17 = L13_16
  L13_16 = L13_16.getGrabObjectCount
  L13_16 = L13_16(L14_17)
  L15_18 = L10_13
  L14_17 = L10_13.isGrabbed
  L14_17 = L14_17(L15_18)
  if not L14_17 then
    L14_17 = _prev_grab_count
  else
    if L13_16 > L14_17 then
      L15_18 = L10_13
      L14_17 = L10_13.isMoveEnd
      L14_17 = L14_17(L15_18)
      if L14_17 == false then
        L15_18 = L10_13
        L14_17 = L10_13.setGrabReleaseForce
        L14_17(L15_18, true)
        L14_17 = _dog_per_pos
        if L14_17 ~= nil then
          L14_17 = Fn_get_distance
          L15_18 = A1_4.puppet
          L15_18 = L15_18.getWorldPos
          L15_18 = L15_18(L15_18)
          L14_17 = L14_17(L15_18, findGameObject2("Node", _dog_per_pos):getWorldPos())
          L15_18 = print
          L15_18("\231\167\187\229\139\149\229\133\136\227\129\190\227\129\167\227\129\130\227\129\168\239\188\154\227\128\142" .. L14_17 .. "\227\128\143\239\189\153")
          if L14_17 <= 2 then
            L15_18 = print
            L15_18("\227\130\176\227\131\169\227\131\150+\231\138\172\227\129\140\231\167\187\229\139\149\229\133\136\227\129\139\227\130\137\232\191\145\227\129\132\227\129\171\227\130\136\227\130\139\231\167\187\229\139\149")
            L15_18 = getDogMovePos
            L15_18 = L15_18(A1_4.per_pos, A2_5)
            Sound:playSE("dog_bark", 1, "", A1_4.puppet)
            _dog_move_task = Fn_moveNpc("escape_dog_01", L15_18, L8_11)
          end
        end
        if L11_14 <= 20 then
          L15_18 = L10_13
          L14_17 = L10_13.setGrabReleaseForce
          L14_17(L15_18, true)
          if A6_9 > L11_14 then
            if A4_7 == "A" then
              L14_17 = kit_fail_caption
              L15_18 = A4_7
              L14_17(L15_18, A0_3[2], true, false)
            else
              L14_17 = kit_fail_caption
              L15_18 = A4_7
              L14_17(L15_18, A0_3[2], true)
              L14_17 = _fail_cnt
              L14_17 = L14_17 + 1
              _fail_cnt = L14_17
            end
          elseif A4_7 == "A" then
            L14_17 = kit_fail_caption
            L15_18 = A4_7
            L14_17(L15_18, A0_3[1], true)
          else
            L14_17 = kit_fail_caption
            L15_18 = A4_7
            L14_17(L15_18, A0_3[2], true)
            L14_17 = _fail_cnt
            L14_17 = L14_17 + 1
            _fail_cnt = L14_17
          end
        end
      elseif A6_9 > L11_14 then
        L15_18 = L10_13
        L14_17 = L10_13.isGrabbed
        L14_17 = L14_17(L15_18)
        if L14_17 and A4_7 ~= "A" then
          L14_17 = Fn_userCtrlOff
          L14_17()
          L14_17 = print
          L15_18 = "\230\136\144\229\138\159\239\188\129"
          L14_17(L15_18)
          _catch_flg = true
          L14_17 = Fn_naviKill
          L14_17()
          L14_17 = true
          return L14_17
        else
          L15_18 = L10_13
          L14_17 = L10_13.setGrabReleaseForce
          L14_17(L15_18, true)
          if A4_7 == "A" then
            L14_17 = kit_fail_caption
            L15_18 = A4_7
            L14_17(L15_18, A0_3[2], true, false)
          else
            L14_17 = kit_fail_caption
            L15_18 = A4_7
            L14_17(L15_18, A0_3[5], true)
          end
          L14_17 = print
          L15_18 = "\229\136\165\231\137\169\227\130\146\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\227\129\171\227\130\136\227\130\139\231\167\187\229\139\149"
          L14_17(L15_18)
          L14_17 = _interval_max
          L15_18 = _auto_move_index
          L14_17 = L14_17[L15_18]
          _frame_count = L14_17
          L14_17 = getDogMovePos
          L15_18 = A1_4.per_pos
          L14_17 = L14_17(L15_18, A2_5)
          L15_18 = Sound
          L15_18 = L15_18.playSE
          L15_18(L15_18, "dog_bark", 1, "", A1_4.puppet)
          L15_18 = Fn_moveNpc
          L15_18 = L15_18("escape_dog_01", L14_17, L8_11)
          _dog_move_task = L15_18
          L15_18 = _fail_cnt
          L15_18 = L15_18 + 1
          _fail_cnt = L15_18
        end
      elseif A6_9 <= L11_14 and L11_14 <= 20 then
        L15_18 = L10_13
        L14_17 = L10_13.setGrabReleaseForce
        L14_17(L15_18, true)
        L14_17 = kit_fail_caption
        L15_18 = A4_7
        L14_17(L15_18, A0_3[1], true)
        L14_17 = _interval_max
        L15_18 = _auto_move_index
        L14_17 = L14_17[L15_18]
        _frame_count = L14_17
        L14_17 = print
        L15_18 = "\233\129\160\227\129\132\227\129\168\227\129\147\227\130\141\227\129\139\227\130\137\227\129\174\227\130\176\227\131\169\227\131\150\227\129\171\227\130\136\227\130\139\231\167\187\229\139\149"
        L14_17(L15_18)
        L14_17 = getDogMovePos
        L15_18 = A1_4.per_pos
        L14_17 = L14_17(L15_18, A2_5)
        L15_18 = Sound
        L15_18 = L15_18.playSE
        L15_18(L15_18, "dog_bark", 1, "", A1_4.puppet)
        L15_18 = Fn_moveNpc
        L15_18 = L15_18("escape_dog_01", L14_17, L8_11)
        _dog_move_task = L15_18
        L15_18 = _fail_cnt
        L15_18 = L15_18 + 1
        _fail_cnt = L15_18
      end
  end
  else
    L14_17 = Fn_findNpc
    L15_18 = "escape_dog_01"
    L14_17 = L14_17(L15_18)
    L15_18 = L14_17
    L14_17 = L14_17.isMoveEnd
    L14_17 = L14_17(L15_18)
    if L14_17 then
      L14_17 = _frame_count
      L14_17 = L14_17 - 1
      _frame_count = L14_17
      if L12_15 == true or A7_10 > L11_14 then
        L15_18 = L10_13
        L14_17 = L10_13.setGrabReleaseForce
        L14_17(L15_18, true)
        if A4_7 ~= "A" then
          if L12_15 then
            L14_17 = kit_fail_caption
            L15_18 = A4_7
            L14_17(L15_18, A0_3[3])
            L14_17 = print
            L15_18 = "\231\138\172\227\129\171\232\166\139\227\130\137\227\130\140\227\129\159\227\129\171\227\130\136\227\130\139\231\167\187\229\139\149"
            L14_17(L15_18)
          else
            L14_17 = kit_fail_caption
            L15_18 = A4_7
            L14_17(L15_18, A0_3[4])
            L14_17 = print
            L15_18 = "\231\138\172\227\129\171\232\191\145\227\129\153\227\129\142\227\129\171\227\130\136\227\130\139\231\167\187\229\139\149"
            L14_17(L15_18)
          end
        end
        L14_17 = getDogMovePos
        L15_18 = A1_4.per_pos
        L14_17 = L14_17(L15_18, A2_5)
        L15_18 = Sound
        L15_18 = L15_18.playSE
        L15_18(L15_18, "dog_bark", 1, "", A1_4.puppet)
        L15_18 = Fn_moveNpc
        L15_18 = L15_18("escape_dog_01", L14_17, L8_11)
        _dog_move_task = L15_18
        L15_18 = _fail_cnt
        L15_18 = L15_18 + 1
        _fail_cnt = L15_18
        L15_18 = _interval_max
        L15_18 = L15_18[_auto_move_index]
        _frame_count = L15_18
      else
        L14_17 = _frame_count
        if L14_17 <= 0 then
          L14_17 = print
          L15_18 = "\232\135\170\229\139\149\231\167\187\229\139\149"
          L14_17(L15_18)
          L15_18 = L10_13
          L14_17 = L10_13.setGrabReleaseForce
          L14_17(L15_18, true)
          L14_17 = getDogMovePos
          L15_18 = A1_4.per_pos
          L14_17 = L14_17(L15_18, A2_5)
          L15_18 = Sound
          L15_18 = L15_18.playSE
          L15_18(L15_18, "dog_bark", 1, "", A1_4.puppet)
          L15_18 = Fn_moveNpc
          L15_18 = L15_18("escape_dog_01", L14_17, L8_11)
          _dog_move_task = L15_18
          L15_18 = _auto_move_index
          L15_18 = L15_18 + 1
          _auto_move_index = L15_18
          L15_18 = _auto_move_index
          if L15_18 > #_interval_max then
            L15_18 = _interval_max
            L15_18 = #L15_18
            _auto_move_index = L15_18
          end
          if A4_7 == "D" then
            L15_18 = RandI
            L15_18 = L15_18(#_interval_max)
            _auto_move_index = L15_18
          end
          L15_18 = _interval_max
          L15_18 = L15_18[_auto_move_index]
          _frame_count = L15_18
        end
      end
    end
  end
  L14_17 = _dog_wait_step
  L15_18 = _dog_wait_time
  L15_18 = #L15_18
  if L14_17 <= L15_18 and A4_7 == "D" then
    L14_17 = _fail_cnt
    L15_18 = _dog_wait_time
    L15_18 = L15_18[_dog_wait_step]
    if L14_17 >= L15_18 then
      L14_17 = table
      L14_17 = L14_17.insert
      L15_18 = _interval_max
      L14_17(L15_18, _dog_wait_step * 12)
      L14_17 = print
      L15_18 = "\231\138\172\227\129\174\229\190\133\230\169\159\230\153\130\233\150\147\232\191\189\229\138\160"
      L14_17(L15_18)
      L14_17 = _dog_wait_step
      L14_17 = L14_17 + 1
      _dog_wait_step = L14_17
    end
  end
  _prev_grab_count = L13_16
  L14_17 = wait
  L14_17()
  L14_17 = false
  return L14_17
end
SM38_catchDogLoop = L0_0
_save_dog_timer = 0
function L0_0(A0_19, A1_20, A2_21)
  return invokeTask(function()
    local L0_22
    while true do
      L0_22 = _save_dog_timer
      L0_22 = L0_22 + 1
      _save_dog_timer = L0_22
      L0_22 = Fn_findNpc
      L0_22 = L0_22("escape_dog_01")
      L0_22 = L0_22.isMoveEnd
      L0_22 = L0_22(L0_22)
      if L0_22 then
        _save_dog_timer = 0
      end
      L0_22 = _save_dog_timer
      if L0_22 > 210 then
        L0_22 = print
        L0_22("\230\150\185\229\144\145\229\164\137\230\155\180")
        L0_22 = getDogMovePos
        L0_22 = L0_22(A0_19, A1_20)
        _dog_move_task = Fn_moveNpc("escape_dog_01", L0_22, A2_21)
      end
      L0_22 = wait
      L0_22()
    end
  end)
end
SM38_saveDog = L0_0
function L0_0(A0_23, A1_24)
  return invokeTask(function()
    local L0_25, L1_26, L2_27, L3_28
    L0_25, L1_26, L2_27 = nil, nil, nil
    L3_28 = Fn_findNpcPuppet
    L3_28 = L3_28(A1_24)
    for _FORV_7_ = 1, #lively_voice_group do
      for _FORV_11_ in pairs(lively_voice_group[_FORV_7_].model) do
        if string.find(A0_23, lively_voice_group[_FORV_7_].model[_FORV_11_]) then
          L0_25 = _FORV_7_
        end
      end
    end
    if L0_25 == nil then
      L0_25 = 1
    end
    print("PLAY VOICE FILE : " .. lively_voice_group[L0_25].voice)
    Sound:playSE(lively_voice_group[L0_25].voice, 1, "", L3_28)
    print("PLAY VOICE END : " .. lively_voice_group[L0_25].voice)
  end)
end
_LivelyVoice_Access_Distance = L0_0
function L0_0(A0_29, A1_30, A2_31, A3_32)
  if A2_31 == nil then
    A2_31 = false
  end
  if A3_32 == nil then
    A3_32 = true
  end
  if A1_30 == nil then
    return
  end
  if A0_29 == "A" and A2_31 == false then
    return
  end
  if _is_caption_now then
    return
  end
  invokeTask(function()
    _is_caption_now = true
    if A3_32 then
      Fn_captionViewWait(A1_30[RandI(#A1_30)], 3, 2)
    else
      _a_part_cnt = _a_part_cnt + 1
      if _a_part_cnt > #A1_30 then
        _a_part_cnt = #A1_30
      end
      print("............." .. _a_part_cnt)
      while Fn_captionViewLock(A1_30[_a_part_cnt]) == false do
        wait()
      end
      waitSeconds(2)
    end
    if A0_29 == "A" then
      Fn_sendEventComSb("killTutorialCaption")
    end
    _is_caption_now = false
  end)
end
kit_fail_caption = L0_0
function L0_0(A0_33, A1_34)
  local L2_35
  A0_33.y = 0
  A1_34.y = 0
  L2_35 = NormalizeVector
  L2_35 = L2_35(A0_33)
  A0_33 = L2_35
  L2_35 = NormalizeVector
  L2_35 = L2_35(A1_34)
  A1_34 = L2_35
  L2_35 = A0_33.Dot
  L2_35 = L2_35(A0_33, A1_34)
  return (Rad2Deg(ArcCos(L2_35)))
end
getDog_player_MovetoAngle = L0_0
_dog_per_pos = nil
function L0_0(A0_36, A1_37)
  local L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48
  _save_dog_timer = 0
  L2_38 = 1
  L3_39 = _dog_per_pos
  if L3_39 == nil then
    _dog_per_pos = A0_36
  end
  L3_39 = 1
  while true do
    L4_40 = _dog_per_pos
    L5_41 = A1_37.prefix
    L6_42 = string
    L6_42 = L6_42.format
    L6_42 = L6_42(L7_43, L8_44)
    L5_41 = L5_41 .. L6_42
    if L4_40 == L5_41 then
      L2_38 = L3_39
      break
    end
    L3_39 = L3_39 + 1
    L4_40 = wait
    L4_40()
  end
  _dog_move_index = L2_38
  L4_40 = A1_37.index_tbl
  L4_40 = L4_40[L2_38]
  if L4_40 == nil then
    L4_40 = nil
    return L4_40
  end
  L4_40 = 1
  L5_41 = A1_37.prefix
  L6_42 = A1_37.index_tbl
  L6_42 = L6_42[L2_38]
  L6_42 = L6_42[L4_40]
  L5_41 = L5_41 .. L6_42
  L6_42 = {}
  for L10_46 = 1, #L8_44 do
    L11_47 = A1_37.prefix
    L12_48 = A1_37.index_tbl
    L12_48 = L12_48[L2_38]
    L12_48 = L12_48[L10_46]
    L5_41 = L11_47 .. L12_48
    L11_47 = findGameObject2
    L12_48 = "Node"
    L11_47 = L11_47(L12_48, L5_41)
    L12_48 = L11_47
    L11_47 = L11_47.getWorldPos
    L11_47 = L11_47(L12_48)
    L12_48 = findGameObject2
    L12_48 = L12_48("Node", _dog_per_pos)
    L12_48 = L12_48.getWorldPos
    L12_48 = L12_48(L12_48)
    L11_47 = L11_47 - L12_48
    L12_48 = Fn_getPlayer
    L12_48 = L12_48()
    L12_48 = L12_48.getWorldPos
    L12_48 = L12_48(L12_48)
    L12_48 = L12_48 - findGameObject2("Node", _dog_per_pos):getWorldPos()
    L6_42[L10_46] = getDog_player_MovetoAngle(L11_47, L12_48)
  end
  for L11_47 = 1, #L6_42 do
    L12_48 = L6_42[L11_47]
    if L7_43 < L12_48 then
      L4_40 = L11_47
    end
  end
  L5_41 = L8_44 .. L9_45
  _dog_per_pos = L5_41
  return L5_41
end
getDogMovePos = L0_0
