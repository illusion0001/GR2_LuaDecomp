dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm15_common.lua")
_puppet_tbl = {}
_is_area_distant = false
_cat_warp_warning = false
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_npc_miss_count = 0
_writers_tbl = {
  {
    name = "sm15_writer_disguise",
    motion = "lookaround",
    direction = nil
  },
  {
    name = "sm15_fake_01",
    motion = "lookaround_03",
    direction = "locator2_direction_01"
  },
  {
    name = "sm15_fake_02",
    motion = "stay_02",
    direction = "locator2_direction_02"
  },
  {
    name = "sm15_fake_03",
    motion = "sit_floor_01",
    direction = nil
  },
  {
    name = "sm15_fake_04",
    motion = "stay_01",
    direction = "locator2_direction_04"
  }
}
_writers_motion_task_tbl = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm15_writer_disguise",
      type = "man76",
      node = "locator2_writer_disguise_a",
      reset = false,
      active = false
    },
    {
      name = "sm15_fake_01",
      type = "man76",
      node = "locator2_fake_01",
      attach = false,
      color_variation = 1
    },
    {
      name = "sm15_fake_02",
      type = "man76",
      node = "locator2_fake_02",
      attach = false,
      color_variation = 2
    },
    {
      name = "sm15_fake_03",
      type = "man76",
      node = "locator2_fake_03",
      attach = false,
      color_variation = 3
    },
    {
      name = "sm15_fake_04",
      type = "man76",
      node = "locator2_fake_04",
      attach = false,
      color_variation = 3
    },
    {
      name = "sm15_talk_01",
      type = "man41",
      node = "locator2_talk_npc_01",
      attach = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_writer_search")
  Fn_pcSensorOff("pccubesensor2_area_distant_a_01")
  Fn_pcSensorOff("pccubesensor2_area_distant_a_02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1()
  for L3_4, L4_5 in L0_1(L1_2) do
    if L3_4 == 2 then
      L5_6 = _writers_motion_task_tbl
      L6_7 = Fn_repeatPlayMotion
      L7_8 = L4_5.name
      L8_9 = "stay"
      L9_10 = {L10_11}
      L10_11 = L4_5.motion
      L10_11 = 3
      L11_12 = 5
      L6_7 = L6_7(L7_8, L8_9, L9_10, L10_11, L11_12)
      L5_6[L3_4] = L6_7
    else
      L5_6 = _writers_motion_task_tbl
      L6_7 = Fn_repeatPlayMotion
      L7_8 = L4_5.name
      L8_9 = L4_5.motion
      L9_10 = {L10_11}
      L10_11 = L4_5.motion
      L10_11 = 3
      L11_12 = 5
      L6_7 = L6_7(L7_8, L8_9, L9_10, L10_11, L11_12)
      L5_6[L3_4] = L6_7
    end
  end
  L0_1()
  L0_1(L1_2)
  L3_4 = "locator2_client_move_03"
  L4_5 = "locator2_client_move_04"
  L5_6 = "locator2_client_move_05"
  L3_4 = L0_1
  L4_5 = {}
  L4_5.anim_speed_over = true
  L4_5.runLength = -1
  L4_5.recast = true
  L3_4 = nil
  L4_5 = invokeTask
  function L5_6()
    while L1_2:isRunning() do
      wait()
    end
    L2_3 = Fn_repeatPlayMotion("sm15_client", "talk_00", {"talk_00"})
    L3_4 = Fn_repeatPlayMotion("sm15_talk_01", "talk_00", {"talk_03"})
  end
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 3
  L4_5(L5_6)
  L4_5 = Fn_kaiwaDemoView
  L5_6 = "sm15_00150k"
  L4_5(L5_6)
  L4_5 = Fn_userCtrlOn
  L4_5()
  L4_5 = true
  L5_6 = Fn_missionView
  L6_7 = "sm15_00101"
  L5_6(L6_7)
  L5_6 = waitSeconds
  L6_7 = 1.3
  L5_6(L6_7)
  L5_6 = findGameObject2
  L6_7 = "Node"
  L7_8 = "locator2_pc_view_stairs"
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = Mv_viewObj
  L7_8 = L5_6
  L8_9 = 0.5
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = Fn_naviSet
  L8_9 = findGameObject2
  L9_10 = "Node"
  L10_11 = "locator2_navi_writer_search"
  L14_15 = L8_9(L9_10, L10_11)
  L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L8_9(L9_10, L10_11))
  L7_8 = Fn_pcSensorOn
  L8_9 = "pccubesensor2_writer_search"
  L7_8(L8_9)
  L7_8 = Fn_setCatWarpCheckPoint
  L8_9 = "locator2_pc_start_pos"
  L7_8(L8_9)
  L7_8 = invokeTask
  function L8_9()
    repeat
      if _cat_warp_warning then
        Player:setStay(true, false)
        if L4_5 then
          Fn_captionView("sm15_00100")
        else
          Fn_captionView("sm15_09000")
        end
        Player:setStay(false, false)
        _cat_warp_warning = false
      end
      wait()
    until false
  end
  L7_8 = L7_8(L8_9)
  L8_9 = Fn_pcSensorOn
  L9_10 = "pccubesensor2_area_distant_a_01"
  L8_9(L9_10)
  L8_9 = "sm15_00120"
  L9_10 = warningAreaDistant
  L10_11 = L8_9
  L9_10 = L9_10(L10_11)
  L10_11 = Mv_waitPhase
  L10_11()
  L10_11 = waitSeconds
  L11_12 = 2
  L10_11(L11_12)
  L10_11 = Mv_safeTaskAbort
  L11_12 = L9_10
  L10_11 = L10_11(L11_12)
  L9_10 = L10_11
  L4_5 = false
  L10_11 = Fn_pcSensorOff
  L11_12 = "pccubesensor2_area_distant_a_01"
  L10_11(L11_12)
  L10_11 = Fn_setNpcActive
  L11_12 = "sm15_writer_disguise"
  L12_13 = true
  L10_11(L11_12, L12_13)
  L10_11 = Mv_safeTaskAbort
  L11_12 = L6_7
  L10_11 = L10_11(L11_12)
  L6_7 = L10_11
  L10_11 = Fn_kaiwaDemoView
  L11_12 = "sm15_00200k"
  L10_11(L11_12)
  L10_11 = {}
  L11_12 = {}
  L11_12.in_game_preview = "k_photo_sm1501"
  L10_11.view = L11_12
  L11_12 = Fn_gamePreviewView
  L12_13 = L10_11
  L11_12(L12_13)
  L11_12 = Fn_missionView
  L12_13 = "sm15_00102"
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOn
  L12_13 = "pccubesensor2_area_distant_a_02"
  L11_12(L12_13)
  L11_12 = "sm15_00103"
  L12_13 = warningAreaDistant
  L13_14 = L11_12
  L14_15 = "locator2_navi_search_area"
  L12_13 = L12_13(L13_14, L14_15)
  L9_10 = L12_13
  L12_13 = {L13_14, L14_15}
  L13_14 = "sm15_00114"
  L14_15 = "sm15_00115"
  L13_14 = {}
  L14_15 = {}
  L14_15.reply_yes = {
    text = L12_13[1],
    time = 2
  }
  L14_15.reply_no = {
    text = L12_13[1],
    time = 2
  }
  L13_14.man76 = L14_15
  L14_15 = {
    {
      reply_yes = {
        text = L12_13[2],
        time = 2
      },
      reply_no = {
        text = L12_13[2],
        time = 2
      }
    }
  }
  L13_14.other = L14_15
  L14_15 = GestureEvent
  L14_15 = L14_15.create
  L14_15 = L14_15("ui_event_guide_02", nil, nil, gestureNpcActionCallback)
  _gesture = L14_15
  L14_15 = _gesture
  L14_15 = L14_15.setNaviTarget
  L14_15(L14_15, nil, nil, {pointing = false, positiveRate = 0})
  L14_15 = _gesture
  L14_15 = L14_15.setNpc
  L14_15(L14_15, {
    _puppet_tbl.sm15_writer_disguise,
    _puppet_tbl.sm15_fake_01,
    _puppet_tbl.sm15_fake_02,
    _puppet_tbl.sm15_fake_03,
    _puppet_tbl.sm15_fake_04
  })
  L14_15 = _gesture
  L14_15 = L14_15.setMobText
  L14_15(L14_15, L13_14)
  L14_15 = _gesture
  L14_15 = L14_15.setAsking
  L14_15(L14_15, false)
  L14_15 = _gesture
  L14_15 = L14_15.run
  L14_15(L14_15)
  L14_15 = invokeTask
  L14_15 = L14_15(function()
    local L0_16
    L0_16 = _gesture
    L0_16 = L0_16.getKnownCount
    L0_16 = L0_16(L0_16)
    L0_16 = L0_16 + _gesture:getUnknownCount()
    L0_16 = L0_16 + _npc_miss_count
    L0_16 = L0_16 % 3
    while true do
      if (_gesture:getKnownCount() + _gesture:getUnknownCount() + _npc_miss_count) % 3 ~= L0_16 then
        if (_gesture:getKnownCount() + _gesture:getUnknownCount() + _npc_miss_count) % 3 == 0 then
          _gesture:stop()
          waitSeconds(2.5)
          while Fn_isCaptionView() == true do
            wait()
          end
          Fn_captionViewWait("sm15_00116")
          Fn_captionViewWait("sm15_00117")
          Fn_captionViewWait("sm15_00118")
          _gesture:run()
        end
        L0_16 = (_gesture:getKnownCount() + _gesture:getUnknownCount() + _npc_miss_count) % 3
      end
      wait()
    end
  end)
  Mv_waitPhase()
  L9_10 = Mv_safeTaskAbort(L9_10)
  L7_8 = Mv_safeTaskAbort(L7_8)
  L14_15 = Mv_safeTaskAbort(L14_15)
  Fn_pcSensorOff("pccubesensor2_area_distant_a_02")
  for _FORV_18_, _FORV_19_ in pairs(_writers_tbl) do
    _writers_motion_task_tbl[_FORV_18_] = Mv_safeTaskAbort(_writers_motion_task_tbl[_FORV_18_])
  end
  _gesture:stop()
  Fn_kaiwaDemoView("sm15_00300k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_17, L1_18
end
function pccubesensor2_writer_search_OnEnter()
  Fn_pcSensorOff("pccubesensor2_writer_search")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_area_distant_01_OnEnter()
  local L0_19, L1_20
  _is_area_distant = false
end
function pccubesensor2_area_distant_01_OnLeave()
  local L0_21, L1_22
  _is_area_distant = true
end
function pccubesensor2_area_distant_02_OnEnter()
  _gesture:run()
  _is_area_distant = false
end
function pccubesensor2_area_distant_02_OnLeave()
  _gesture:stop()
  _is_area_distant = true
end
function pccubesensor2_warning_a_OnLeave()
  local L0_23, L1_24
  _cat_warp_warning = true
end
function pccubesensor2_warp_a_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function gestureNpcActionCallback(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35
  L1_26 = {}
  L2_27 = {}
  L2_27.cnt = 0
  L2_27.kaiwa = ""
  L2_27.answer = true
  L1_26.sm15_writer_disguise = L2_27
  L2_27 = {}
  L2_27.cnt = 0
  L2_27.kaiwa = ""
  L1_26.sm15_fake_01 = L2_27
  L2_27 = {}
  L2_27.cnt = 0
  L2_27.kaiwa = ""
  L1_26.sm15_fake_02 = L2_27
  L2_27 = {}
  L2_27.cnt = 0
  L2_27.kaiwa = ""
  L1_26.sm15_fake_03 = L2_27
  L2_27 = {}
  L2_27.cnt = 0
  L2_27.kaiwa = ""
  L1_26.sm15_fake_04 = L2_27
  L2_27 = {
    L3_28,
    L4_29,
    L5_30,
    L6_31
  }
  L3_28 = "sm15_00106"
  L4_29 = "sm15_00107"
  L5_30 = "sm15_00108"
  L3_28 = {
    L4_29,
    L5_30,
    L6_31,
    L7_32
  }
  L4_29 = "sm15_00110"
  L5_30 = "sm15_00111"
  if A0_25 then
    L5_30 = A0_25
    L4_29 = A0_25.getName
    L4_29 = L4_29(L5_30)
    L5_30 = Fn_userCtrlOff
    L5_30()
    L5_30 = A0_25.getWorldPos
    L5_30 = L5_30(L6_31)
    L9_34 = 0
    L5_30 = L5_30 + L6_31
    L9_34 = 1
    L10_35 = L5_30
    L6_31(L7_32, L8_33, L9_34, L10_35)
    for L9_34, L10_35 in L6_31(L7_32) do
      if L4_29 == L10_35.name then
        invokeTask(function()
          if L4_29 ~= "sm15_fake_03" then
            _writers_motion_task_tbl[L9_34] = Mv_safeTaskAbort(_writers_motion_task_tbl[L9_34])
            Fn_turnNpc(L4_29)
          end
          if L4_29 ~= "sm15_writer_disguise" then
            if L4_29 ~= "sm15_fake_03" then
              Fn_playMotionNpc(L4_29, "reply_no", false)
            end
            Fn_captionViewWait(L2_27[RandI(1, #L2_27)])
            waitSeconds(2)
            if L10_35.direction ~= nil then
              Fn_turnNpc(L10_35.name, L10_35.direction)
            end
            if L9_34 == 2 then
              _writers_motion_task_tbl[L9_34] = Fn_repeatPlayMotion(L10_35.name, "stay", {
                L10_35.motion
              }, 3, 5)
            else
              _writers_motion_task_tbl[L9_34] = Fn_repeatPlayMotion(L10_35.name, L10_35.motion, {
                L10_35.motion
              }, 3, 5)
            end
            L1_26[L4_29].cnt = 1
            if Fn_isCaptionView() == false then
              Fn_captionView(L3_28[RandI(1, #L3_28)])
            end
          end
        end)
        break
      else
      end
    end
    L6_31(L7_32)
    L9_34 = 1
    L10_35 = L5_30
    L6_31(L7_32, L8_33, L9_34, L10_35)
    L6_31()
    if L6_31 then
      L6_31(L7_32)
      L6_31()
    end
  else
  end
end
