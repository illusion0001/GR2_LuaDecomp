import("GameDatabase")
import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm42_common.lua")
SDEMO = {
  MOVE_SEC01 = 2,
  MOVE_SEC02 = 3,
  MOVE_SEC03 = 1.5,
  CLIENT_DIST = 2,
  ARMY_DIST = 3
}
PHOTO_MOTION_MIN_SEC = 10
PHOTO_MOTION_MAX_SEC = 20
CAP_TIME01 = 0
VIEW_DELETE = 3
CAP_TIME02 = 8
EXCAP_TIME01 = 14
EXCAP_TIME02 = 18
EXCAP_TIME03 = 22
EX_EVENT_TIME01 = EXCAP_TIME03 + 4
ADVICE_TIME01 = 30
ADVICE_TIME02 = 60
ADVICE_TIME03 = 300
PHOTO_BIS_FLAG = 5
EGEM_MAX = 32
_puppet_tbl = {}
_photo_area = false
_once_leave_sensor = false
_guide_navi = false
_first_grab_navi = false
_create_gem_task = nil
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lower_area_photo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_lower_bis_area_view_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_bil_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_high_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_bisma_near_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_bisma_area_event_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_bisma_area_photo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_bisma_photo_guide_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_flag_event_start_area_b2_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_flag_event_start_area_b2_02")
  L0_0 = {
    {
      name = "poor_center",
      type = "man42",
      node = "locator2_poor_01",
      active = true,
      anim = "stay"
    },
    {
      name = "poor_left",
      type = "man43",
      node = "locator2_poor_02",
      active = true,
      anim = "stay"
    },
    {
      name = "poor_right",
      type = "man44",
      node = "locator2_poor_03",
      active = true,
      anim = "stay_02"
    },
    {
      name = "girl01",
      type = "chi14",
      node = "locator2_girl_01",
      active = true
    },
    {
      name = "boy01",
      type = "chi13",
      node = "locator2_boy_01",
      active = true
    },
    {
      name = "army01",
      type = "man57",
      node = "locator2_army_01",
      active = true,
      color_variation = 1
    },
    {
      name = "flag_man63",
      type = "man63",
      node = "locator2_flag_pilot_b2_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _client_puppet = Fn_findNpcPuppet("sm42_client")
  client_npc = Fn_findNpc("sm42_client")
  _sdemo_cut01 = SDemo.create("sm42_a_cut01")
  market_flag = false
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm47) == 1 then
    comSetClearEventFlag(true)
    print("sm47\227\130\175\227\131\170\227\130\162\230\184\136\227\129\191")
  else
    print("sm47\227\130\175\227\131\170\227\130\162\227\131\149\227\131\169\227\130\176\227\129\140\231\171\139\227\129\163\227\129\166\227\129\132\227\129\170\227\129\132")
    comSetClearEventFlag(false)
  end
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26
  L0_1 = Fn_warpNpc
  L1_2 = "sm42_client"
  L2_3 = "locator2_client_b2_start_pos_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = _sdemo_cut01
  L1_2 = L0_1
  L0_1 = L0_1.set
  L2_3 = "locator2_sdemo_start_cam_01"
  L3_4 = "locator2_sdemo_start_aim_01"
  L4_5 = false
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L0_1 = _sdemo_cut01
  L1_2 = L0_1
  L0_1 = L0_1.play
  L0_1(L1_2)
  L0_1 = waitSeconds
  L1_2 = 2
  L0_1(L1_2)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "sm42_00400k"
  L0_1(L1_2)
  L0_1 = {}
  L1_2 = Fn_findNpc
  L2_3 = "poor_center"
  L1_2 = L1_2(L2_3)
  L0_1.center = L1_2
  L1_2 = Fn_findNpc
  L2_3 = "poor_left"
  L1_2 = L1_2(L2_3)
  L0_1.left = L1_2
  L1_2 = Fn_findNpc
  L2_3 = "poor_right"
  L1_2 = L1_2(L2_3)
  L0_1.right = L1_2
  L1_2 = Fn_findNpc
  L2_3 = "army01"
  L1_2 = L1_2(L2_3)
  L0_1.army = L1_2
  L1_2 = Fn_findNpc
  L2_3 = "girl01"
  L1_2 = L1_2(L2_3)
  L0_1.girl = L1_2
  L1_2 = Fn_findNpc
  L2_3 = "boy01"
  L1_2 = L1_2(L2_3)
  L0_1.boy = L1_2
  L1_2 = {}
  L2_3 = {L3_4, L4_5}
  L3_4 = "locator2_sdemo_army_movepos_01"
  L4_5 = "locator2_sdemo_army_movepos_02"
  L1_2.army = L2_3
  L2_3 = {L3_4, L4_5}
  L3_4 = "locator2_sdemo_girl_movepos_01"
  L4_5 = "locator2_sdemo_girl_movepos_02"
  L1_2.girl = L2_3
  L2_3 = {L3_4, L4_5}
  L3_4 = "locator2_sdemo_boy_movepos_01"
  L4_5 = "locator2_sdemo_boy_movepos_02"
  L1_2.boy = L2_3
  L2_3 = {}
  L2_3.stay = "man01_stay_01"
  L2_3.talk = "man01_talk_02"
  L2_3.walk = "man01_walk_00"
  L2_3.turn_l = "man01_turn_l_00"
  L2_3.turn_r = "man01_turn_r_00"
  L3_4 = Fn_loadNpcEventMotion
  L4_5 = "army01"
  L5_6 = L2_3
  L3_4(L4_5, L5_6)
  while true do
    L3_4 = _puppet_tbl
    L3_4 = L3_4.army01
    L4_5 = L3_4
    L3_4 = L3_4.isLoading
    L3_4 = L3_4(L4_5)
    if L3_4 then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = {L4_5}
  L4_5 = {}
  L4_5.pos = "locator2_sdemo_cam_01"
  L5_6 = SDEMO
  L5_6 = L5_6.MOVE_SEC01
  L5_6 = L5_6 - 0.2
  L4_5.time = L5_6
  L4_5.hashfunc = "Cosine"
  L4_5 = {L5_6}
  L5_6 = {}
  L5_6.pos = "locator2_sdemo_aim_01"
  L6_7 = SDEMO
  L6_7 = L6_7.MOVE_SEC01
  L5_6.time = L6_7
  L5_6.hashfunc = "Cosine"
  L5_6 = _sdemo_cut01
  L6_7 = L5_6
  L5_6 = L5_6.play
  L7_8 = L3_4
  L8_9 = L4_5
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_findNpc
  L6_7 = "sm42_client"
  L5_6 = L5_6(L6_7)
  L6_7 = L5_6
  L5_6 = L5_6.turn
  L7_8 = "locator2_girl_01"
  L5_6(L6_7, L7_8)
  L5_6 = waitSeconds
  L6_7 = 0.3
  L5_6(L6_7)
  L5_6 = Fn_moveNpc
  L6_7 = "sm42_client"
  L7_8 = {L8_9}
  L8_9 = "locator2_sdemo_client_movepos_01"
  L8_9 = {}
  L8_9.runLength = 10
  L5_6 = L5_6(L6_7, L7_8, L8_9)
  L6_7 = invokeTask
  function L7_8()
    Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_sdemo_client_movepos_01"):getWorldPos())
    waitSeconds(1.5)
    Player:setLookAtIk(false, 1, findGameObject2("Node", "locator2_sdemo_client_movepos_01"):getWorldPos())
  end
  L6_7(L7_8)
  L6_7 = invokeTask
  function L7_8()
    local L0_27, L1_28
    L0_27 = Fn_moveNpc
    L1_28 = "girl01"
    L0_27 = L0_27(L1_28, L1_2.girl, {runLength = -1})
    L1_28 = Fn_moveNpc
    L1_28 = L1_28("boy01", L1_2.boy, {runLength = -1})
    Sound:playSE("w09_917c", 1, "", _puppet_tbl.girl01)
    while L0_27:isRunning() do
      wait()
    end
    L0_1.girl:turn(_puppet_tbl.poor_right)
    L0_27 = Mv_safeTaskAbort(L0_27)
    while L1_28:isRunning() do
      wait()
    end
    L1_28 = Mv_safeTaskAbort(L1_28)
    Fn_turnNpc("boy01", _puppet_tbl.poor_right)
  end
  L6_7 = L6_7(L7_8)
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo_cam_03"
  L9_10 = SDEMO
  L9_10 = L9_10.MOVE_SEC02
  L8_9.time = L9_10
  L8_9.hashfunc = "Cosine"
  L3_4 = L7_8
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo_aim_03"
  L9_10 = SDEMO
  L9_10 = L9_10.MOVE_SEC02
  L8_9.time = L9_10
  L8_9.hashfunc = "Cosine"
  L4_5 = L7_8
  L7_8 = Fn_turnNpc
  L8_9 = "poor_right"
  L9_10 = "locator2_sdemo_poor03_kidturn_01"
  L7_8(L8_9, L9_10)
  L7_8 = Sound
  L8_9 = L7_8
  L7_8 = L7_8.playSE
  L9_10 = "m12_908b"
  L10_11 = 1
  L11_12 = ""
  L12_13 = _puppet_tbl
  L12_13 = L12_13.poor_right
  L7_8(L8_9, L9_10, L10_11, L11_12, L12_13)
  L7_8 = Fn_repeatPlayMotion
  L8_9 = "poor_right"
  L9_10 = "talk_03"
  L10_11 = {L11_12}
  L11_12 = "talk_03"
  L7_8(L8_9, L9_10, L10_11)
  while true do
    L7_8 = Fn_get_distance
    L8_9 = _client_puppet
    L9_10 = L8_9
    L8_9 = L8_9.getWorldPos
    L8_9 = L8_9(L9_10)
    L9_10 = _puppet_tbl
    L9_10 = L9_10.girl01
    L10_11 = L9_10
    L9_10 = L9_10.getWorldPos
    L25_26 = L9_10(L10_11)
    L7_8 = L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L9_10(L10_11))
    L8_9 = SDEMO
    L8_9 = L8_9.CLIENT_DIST
    if L7_8 >= L8_9 then
      L7_8 = wait
      L7_8()
    end
  end
  L7_8 = Mv_safeTaskAbort
  L8_9 = L5_6
  L7_8 = L7_8(L8_9)
  L5_6 = L7_8
  L7_8 = waitSeconds
  L8_9 = 0.3
  L7_8(L8_9)
  L7_8 = _sdemo_cut01
  L8_9 = L7_8
  L7_8 = L7_8.play
  L9_10 = L3_4
  L10_11 = L4_5
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = Fn_turnNpc
  L8_9 = "sm42_client"
  L9_10 = "locator2_sdemo_girl_movepos_02"
  L7_8(L8_9, L9_10)
  L7_8 = invokeTask
  function L8_9()
    local L0_29
    L0_29 = Fn_moveNpc
    L0_29 = L0_29("army01", L1_2.army, {
      "runLength = 10",
      anim_walk = L2_3.walk
    })
    while L0_29:isRunning() do
      wait()
    end
    Sound:playSE("m25_901c", 1, "", _puppet_tbl.army01)
    L0_29 = Mv_safeTaskAbort(L0_29)
    Fn_playNpcEventMotion("army01", L2_3.talk, -1, 0.5, 0)
  end
  L7_8 = L7_8(L8_9)
  L8_9 = {L9_10}
  L9_10 = {}
  L9_10.pos = "locator2_sdemo_cam_04"
  L10_11 = SDEMO
  L10_11 = L10_11.MOVE_SEC03
  L9_10.time = L10_11
  L3_4 = L8_9
  L8_9 = {L9_10}
  L9_10 = {}
  L9_10.pos = "locator2_sdemo_aim_04"
  L10_11 = SDEMO
  L10_11 = L10_11.MOVE_SEC03
  L9_10.time = L10_11
  L4_5 = L8_9
  while true do
    L8_9 = Fn_get_distance
    L9_10 = _puppet_tbl
    L9_10 = L9_10.army01
    L10_11 = L9_10
    L9_10 = L9_10.getWorldPos
    L9_10 = L9_10(L10_11)
    L10_11 = _puppet_tbl
    L10_11 = L10_11.poor_left
    L11_12 = L10_11
    L10_11 = L10_11.getWorldPos
    L25_26 = L10_11(L11_12)
    L8_9 = L8_9(L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L10_11(L11_12))
    L9_10 = SDEMO
    L9_10 = L9_10.ARMY_DIST
    if L8_9 >= L9_10 then
      L8_9 = wait
      L8_9()
    end
  end
  L8_9 = _sdemo_cut01
  L9_10 = L8_9
  L8_9 = L8_9.play
  L10_11 = L3_4
  L11_12 = L4_5
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = invokeTask
  function L9_10()
    local L0_30
    L0_30 = Fn_turnNpc
    L0_30("poor_left", _puppet_tbl.army01)
    L0_30 = Sound
    L0_30 = L0_30.playSE
    L0_30(L0_30, "m11_907b", 1, "", _puppet_tbl.poor_left)
    L0_30 = Fn_moveNpc
    L0_30 = L0_30("poor_center", {
      "locator2_sdemo_poor01_move_01"
    }, {
      "runLength = 10"
    })
    Fn_findNpc("sm42_client"):turn(_puppet_tbl.army01)
    while L0_30:isRunning() do
      wait()
    end
    L0_30 = Mv_safeTaskAbort(L0_30)
    Fn_playMotionNpc("poor_center", "talk_03", false)
  end
  L8_9 = L8_9(L9_10)
  L9_10 = waitSeconds
  L10_11 = SDEMO
  L10_11 = L10_11.MOVE_SEC03
  L10_11 = L10_11 + 1
  L9_10(L10_11)
  L9_10 = Mv_safeTaskAbort
  L10_11 = L6_7
  L9_10 = L9_10(L10_11)
  L6_7 = L9_10
  L9_10 = Mv_safeTaskAbort
  L10_11 = L7_8
  L9_10 = L9_10(L10_11)
  L7_8 = L9_10
  L9_10 = Mv_safeTaskAbort
  L10_11 = L8_9
  L9_10 = L9_10(L10_11)
  L8_9 = L9_10
  L9_10 = Fn_kaiwaDemoView
  L10_11 = "sm42_00410k"
  L9_10(L10_11)
  L9_10 = Mv_safeTaskAbort
  L10_11 = girl_motion_task
  L9_10 = L9_10(L10_11)
  girl_motion_task = L9_10
  L9_10 = Mv_safeTaskAbort
  L10_11 = boy_motion_task
  L9_10 = L9_10(L10_11)
  boy_motion_task = L9_10
  L9_10 = _sdemo_cut01
  L10_11 = L9_10
  L9_10 = L9_10.stop
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_lower_area_photo_01"
  L9_10(L10_11)
  L9_10 = Fn_userCtrlOn
  L9_10()
  L9_10 = invokeTask
  function L10_11()
    L0_1.girl:turn(_puppet_tbl.boy01)
    Fn_turnNpc("boy01", _puppet_tbl.girl01)
    Fn_repeatPlayMotion("boy01", "talk_01", {"talk_00"})
    Fn_repeatPlayMotion("girl01", "talk_00", {"talk_01"})
    Fn_playNpcEventMotion("army01", L2_3.stay, -1, 0.5, 0)
  end
  L9_10 = L9_10(L10_11)
  L10_11 = invokeTask
  function L11_12()
    L0_1.center:turn("locator2_sdemo_poor01_turn_01")
    L0_1.left:turn("locator2_sdemo_poor02_turn_01")
    while Fn_moveNpc("poor_right", {
      "locator2_sdemo_poor03_move_01"
    }, {recast = true}):isRunning() do
      wait()
    end
    L0_1.right:turn("locator2_sdemo_poor03_turn_01")
    waitSeconds(0.5)
    motion_task_right = Fn_playLoopMotionInsert("poor_right", "stay_02", {"photo_03"}, PHOTO_MOTION_MIN_SEC + 4, PHOTO_MOTION_MAX_SEC + 4)
  end
  L10_11 = L10_11(L11_12)
  L11_12 = Fn_missionView
  L12_13 = "sm42_01035"
  L11_12(L12_13)
  photo_success = false
  L11_12 = Photo
  L11_12 = L11_12.create
  L12_13 = kPHOTO_CAPTION_ON
  L13_14 = kPHOTO_TYPE_ANY
  L14_15 = true
  L15_16 = {}
  L15_16.near = 3.5
  L15_16.far = 7
  L16_17 = {}
  L16_17.left = -0.5
  L16_17.right = 0.5
  L16_17.top = -0.5
  L16_17.bottom = 0.5
  L11_12 = L11_12(L12_13, L13_14, L14_15, L15_16, L16_17, L17_18)
  _photo = L11_12
  L11_12 = _photo
  L12_13 = L11_12
  L11_12 = L11_12.set
  L13_14 = _puppet_tbl
  L13_14 = L13_14.poor_center
  L14_15 = bn_l_eye
  L11_12(L12_13, L13_14, L14_15)
  L11_12 = _photo
  L12_13 = L11_12
  L11_12 = L11_12.set
  L13_14 = _puppet_tbl
  L13_14 = L13_14.poor_left
  L14_15 = bn_l_eye
  L11_12(L12_13, L13_14, L14_15)
  L11_12 = _photo
  L12_13 = L11_12
  L11_12 = L11_12.set
  L13_14 = _puppet_tbl
  L13_14 = L13_14.poor_right
  L14_15 = bn_l_eye
  L11_12(L12_13, L13_14, L14_15)
  while true do
    L11_12 = photo_success
    if L11_12 == false then
      L11_12 = _photo_area
      if L11_12 == true then
        L11_12 = print
        L12_13 = "\230\146\174\229\189\177\227\130\168\227\131\170\227\130\162\231\175\132\229\155\178\229\134\133"
        L11_12(L12_13)
        L11_12 = _photo
        L12_13 = L11_12
        L11_12 = L11_12.run
        L11_12(L12_13)
        repeat
          L11_12 = wait
          L11_12()
          L11_12 = _photo_area
          if L11_12 ~= false then
            L11_12 = _photo
            L12_13 = L11_12
            L11_12 = L11_12.isRunning
            L11_12 = L11_12(L12_13)
          end
        until not L11_12
        L11_12 = _photo_area
        if L11_12 == true then
          L11_12 = _photo
          L12_13 = L11_12
          L11_12 = L11_12.getPhotoState
          L11_12 = L11_12(L12_13)
          L12_13 = 0
          L13_14 = 0
          L14_15 = 0
          L15_16 = 0
          L16_17 = nil
          L17_18(L18_19)
          if L17_18 ~= "table" then
            L17_18(L18_19)
            L17_18(L18_19)
          elseif L17_18 == "table" then
            L17_18(L18_19)
            if L17_18 < 3 then
              L17_18(L18_19)
              L17_18(L18_19)
            elseif L17_18 == 3 then
              L17_18(L18_19)
              for L20_21 = 1, #L11_12 do
                if L21_22 ~= L22_23 then
                else
                  if L21_22 == L22_23 then
                    L12_13 = L12_13 + 1
                end
                elseif L21_22 == L22_23 then
                  L13_14 = L13_14 + 1
                  L16_17 = "sm42_01037"
                elseif L21_22 == L22_23 then
                  L14_15 = L13_14 + 1
                  L16_17 = "sm42_01038"
                else
                  L15_16 = L15_16 + 1
                end
              end
              L17_18(L18_19)
              L17_18(L18_19)
              L17_18(L18_19)
              L17_18(L18_19)
              if L15_16 == 3 then
                L17_18(L18_19, L19_20)
                L17_18()
                L17_18()
                L17_18(L18_19)
                photo_success = true
                break
              elseif L12_13 >= 1 then
                L16_17 = "sm42_01040"
              elseif L13_14 > L14_15 then
                L16_17 = "sm42_01037"
              elseif L13_14 < L14_15 then
                L16_17 = "sm42_01038"
              end
              L17_18(L18_19)
            end
          end
        end
      end
    end
    L11_12 = wait
    L11_12()
  end
  L11_12 = HUD
  L12_13 = L11_12
  L11_12 = L11_12.setPhotoMode
  L13_14 = false
  L11_12(L12_13, L13_14)
  _photo = nil
  _photo_area = false
  _once_leave_sensor = false
  L11_12 = Fn_pcSensorOff
  L12_13 = "pccubesensor2_lower_area_photo_01"
  L11_12(L12_13)
  L11_12 = Mv_safeTaskAbort
  L12_13 = photo_event_task
  L11_12 = L11_12(L12_13)
  photo_event_task = L11_12
  L11_12 = Mv_safeTaskAbort
  L12_13 = L9_10
  L11_12 = L11_12(L12_13)
  L9_10 = L11_12
  L11_12 = Mv_safeTaskAbort
  L12_13 = L10_11
  L11_12 = L11_12(L12_13)
  L10_11 = L11_12
  L11_12 = Mv_safeTaskAbort
  L12_13 = center_motion_task
  L11_12 = L11_12(L12_13)
  center_motion_task = L11_12
  L11_12 = Mv_safeTaskAbort
  L12_13 = left_motion_task
  L11_12 = L11_12(L12_13)
  left_motion_task = L11_12
  L11_12 = Fn_kaiwaDemoView
  L12_13 = "sm42_00420k"
  L11_12(L12_13)
  L11_12 = invokeTask
  function L12_13()
    L0_1.girl:turn(Fn_getPlayer())
    L0_1.center:turn(Fn_getPlayer())
    Fn_turnNpc("girl01")
    Sound:playSE("m10_915b", 1, "", _puppet_tbl.poor_center)
    Fn_playMotionNpc("poor_center", "greeting", false)
    waitSeconds(0.5)
    Sound:playSE("w09_915b", 1, "", _puppet_tbl.girl01)
    girl_motion_task = Fn_repeatPlayMotion("girl01", "greeting", {"greeting"})
    waitSeconds(0.5)
    boy_motion_task = Fn_repeatPlayMotion("boy01", "greeting", {"greeting"})
    Sound:playSE("m08_915b", 1, "", _puppet_tbl.boy01)
    waitSeconds(6)
    Fn_playNpcEventMotion("army01", L2_3.talk, -1, 0.5, 0)
    girl_motion_task = Mv_safeTaskAbort(girl_motion_task)
    boy_motion_task = Mv_safeTaskAbort(boy_motion_task)
    Fn_turnNpc("girl01", _puppet_tbl.boy01)
    Fn_turnNpc("boy01", _puppet_tbl.girl01)
    Fn_repeatPlayMotion("boy01", "talk_01", {"talk_01"})
    Fn_repeatPlayMotion("girl01", "talk_00", {"talk_00"})
    L0_1.left:turn(_puppet_tbl.army01)
    Fn_turnNpc("poor_right", _puppet_tbl.poor_center)
    Fn_turnNpc("poor_center", _puppet_tbl.poor_right)
    Fn_repeatPlayMotion("poor_left", "talk_01", {"talk_01"})
    Fn_repeatPlayMotion("poor_center", "talk_03", {"stay_02"})
    Fn_repeatPlayMotion("poor_right", "talk_02", {"talk_02"})
  end
  L11_12 = L11_12(L12_13)
  L12_13 = Fn_userCtrlOn
  L12_13()
  L12_13 = Fn_setGrabNpc
  L13_14 = "sm42_client"
  L14_15 = false
  L15_16 = false
  L12_13(L13_14, L14_15, L15_16)
  L12_13 = Mv_createNpcGrabSensor
  L13_14 = "sm42_client"
  L12_13 = L12_13(L13_14)
  L14_15 = L12_13
  L13_14 = L12_13.setActive
  L15_16 = true
  L13_14(L14_15, L15_16)
  L13_14 = Fn_missionView
  L14_15 = "sm42_01041"
  L13_14(L14_15)
  L13_14 = clientGrabWait
  L14_15 = Fn_findNpcPuppet
  L15_16 = "sm42_client"
  L25_26 = L14_15(L15_16)
  L13_14(L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L14_15(L15_16))
  L13_14 = Fn_setCatWarpCheckPoint
  L14_15 = "locator2_pc_start_pos"
  L13_14(L14_15)
  L13_14 = setCatWarpClientPos
  L14_15 = "locator2_client_b2_start_pos_01"
  L13_14(L14_15)
  L13_14 = invokeClientCatwarpCheck
  L14_15 = "sm42_client"
  L13_14 = L13_14(L14_15)
  L14_15 = Fn_tutorialCaptionKill
  L14_15()
  L15_16 = L12_13
  L14_15 = L12_13.setActive
  L16_17 = false
  L14_15(L15_16, L16_17)
  L14_15 = Fn_pcSensorOn
  L15_16 = "pccubesensor2_lower_bis_area_view_01"
  L14_15(L15_16)
  L14_15 = Fn_pcSensorOn
  L15_16 = "pccubesensor2_high_area_01"
  L14_15(L15_16)
  L14_15 = Fn_playMotionNpc
  L15_16 = "poor_left"
  L16_17 = "stay_02"
  L14_15(L15_16, L16_17, L17_18)
  L14_15 = Fn_playMotionNpc
  L15_16 = "poor_right"
  L16_17 = "stay_01"
  L14_15(L15_16, L16_17, L17_18)
  L14_15 = Mv_waitPhase
  L14_15()
  L14_15 = Mv_safeTaskAbort
  L15_16 = L11_12
  L14_15 = L14_15(L15_16)
  L11_12 = L14_15
  L14_15 = Fn_pcSensorOn
  L15_16 = "pccubesensor2_bil_area_01"
  L14_15(L15_16)
  L14_15 = invokeTask
  function L15_16()
    local L0_31, L1_32
    L0_31 = 0
    L1_32 = comGetClearEventFlag
    L1_32 = L1_32()
    if L1_32 == true then
      L1_32 = clearEventFunc
      L1_32()
    end
    while true do
      L1_32 = CAP_TIME01
      if L0_31 == L1_32 then
        L1_32 = Mv_viewObj
        L1_32 = L1_32("locator2_bisma_navi_01", 0.5)
        Fn_captionView("sm42_01042")
      else
        L1_32 = VIEW_DELETE
        if L0_31 == L1_32 then
          L1_32 = Mv_safeTaskAbort
          L1_32 = L1_32(view_task)
          view_task = L1_32
        else
          L1_32 = CAP_TIME02
          if L0_31 == L1_32 then
            L1_32 = Fn_captionView
            L1_32("sm42_01043")
          else
            L1_32 = comGetClearEventFlag
            L1_32 = L1_32()
            if L1_32 == true then
              L1_32 = EXCAP_TIME01
              if L0_31 == L1_32 then
                L1_32 = Fn_captionView
                L1_32("sm42_01044")
              else
                L1_32 = EXCAP_TIME02
                if L0_31 == L1_32 then
                  L1_32 = Fn_captionView
                  L1_32("sm42_01045")
                else
                  L1_32 = EXCAP_TIME03
                  if L0_31 == L1_32 then
                    L1_32 = Fn_captionView
                    L1_32("sm42_01046")
                  else
                    L1_32 = EX_EVENT_TIME01
                    if L0_31 == L1_32 then
                      L1_32 = Fn_pcSensorOn
                      L1_32("pccubesensormulti2_flag_event_start_area_b2_01")
                      L1_32 = Fn_pcSensorOn
                      L1_32("pccubesensormulti2_flag_event_start_area_b2_02")
                      L1_32 = print
                      L1_32("\227\130\175\227\131\170\227\130\162\227\131\149\227\131\169\227\130\176\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139")
                      L1_32 = {"sm42_01065", "sm42_01066"}
                      event_task = comInvokeFlagEventGemWait("locator2_flag_gem_b2_01", L1_32, "b2")
                    end
                  end
                end
              end
            end
          end
        end
      end
      L1_32 = waitSeconds
      L1_32(1)
      L1_32 = EX_EVENT_TIME01
      L1_32 = L1_32 + 5
      if L0_31 <= L1_32 then
        L0_31 = L0_31 + 1
      end
    end
  end
  L14_15 = L14_15(L15_16)
  L15_16 = Mv_waitPhase
  L15_16()
  L15_16 = Fn_pcSensorOff
  L16_17 = "pccubesensor2_high_area_01"
  L15_16(L16_17)
  L15_16 = Fn_naviKill
  L15_16()
  L15_16 = Mv_safeTaskAbort
  L16_17 = event_task
  L15_16 = L15_16(L16_17)
  event_task = L15_16
  L15_16 = Mv_safeTaskAbort
  L16_17 = L14_15
  L15_16 = L15_16(L16_17)
  L14_15 = L15_16
  L15_16 = Fn_disappearNpc
  L16_17 = "poor_center"
  L15_16(L16_17)
  L15_16 = Fn_disappearNpc
  L16_17 = "poor_left"
  L15_16(L16_17)
  L15_16 = Fn_disappearNpc
  L16_17 = "poor_right"
  L15_16(L16_17)
  L15_16 = Fn_disappearNpc
  L16_17 = "boy01"
  L15_16(L16_17)
  L15_16 = Fn_setNpcActive
  L16_17 = "girl01"
  L15_16(L16_17, L17_18)
  L15_16 = Fn_disappearNpc
  L16_17 = "army01"
  L15_16(L16_17)
  L15_16 = Fn_pcSensorOn
  L16_17 = "pccubesensor2_bisma_near_area_01"
  L15_16(L16_17)
  L15_16 = invokeTask
  function L16_17()
    local L0_33
    L0_33 = Mv_viewObj
    L0_33 = L0_33("locator2_bisma_navi_01", 0.5)
    Fn_setCatWarpCheckPoint("locator2_near_catwarp_pc_01")
    setCatWarpClientPos("locator2_near_catwarp_client_01")
    Fn_captionViewWait("sm42_01047", 3, 5)
    L0_33 = Mv_safeTaskAbort(L0_33)
    Fn_captionView("sm42_01048")
  end
  L15_16 = L15_16(L16_17)
  L16_17 = invokeTask
  L16_17 = L16_17(L17_18)
  L17_18()
  _create_gem_task = L17_18
  L15_16 = L17_18
  L16_17 = L17_18
  L17_18(L18_19)
  L17_18(L18_19)
  L19_20(L20_21)
  L19_20()
  L13_14 = L19_20
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20()
  L19_20(L20_21)
  L19_20(L20_21, L21_22)
  L19_20(L20_21, L21_22)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21, L21_22)
  L19_20(L20_21)
  L19_20()
  L19_20(L20_21)
  L20_21(L21_22)
  L20_21(L21_22)
  L20_21(L21_22)
  L20_21(L21_22)
  L20_21(L21_22)
  photo_success = false
  L23_24 = true
  L24_25 = {}
  L24_25.near = 3
  L24_25.far = 50
  L25_26 = {}
  L25_26.left = -0.5
  L25_26.right = 0.5
  L25_26.top = -0.5
  L25_26.bottom = 0.5
  _photo = L20_21
  for L23_24 = 1, PHOTO_BIS_FLAG do
    L24_25 = _photo
    L25_26 = L24_25
    L24_25 = L24_25.set
    L24_25(L25_26, "locator2_shipflag_photo_" .. string.format("%02d", L23_24))
  end
  while true do
    if L20_21 == false then
      if L20_21 == true then
        L20_21(L21_22)
        L20_21(L21_22)
        repeat
          L20_21()
          if L20_21 ~= false then
          end
        until not L20_21
        if L20_21 == true then
          L23_24 = 0
          L24_25 = 0
          L25_26 = nil
          print("\230\146\174\229\189\177\231\181\144\230\158\156\227\129\174\229\158\139 \226\134\146 " .. type(L20_21))
          if type(L20_21) ~= "table" then
            print("\227\131\142\227\131\188\227\131\137\227\129\140\227\129\159\227\130\138\227\129\170\227\129\132")
          elseif type(L20_21) == "table" then
            print("\227\131\149\227\131\172\227\131\188\227\131\160\229\134\133\227\129\174\227\131\142\227\131\188\227\131\137\230\149\176 = " .. #L20_21)
            if #L20_21 == 0 then
              Fn_captionView("sm42_01057")
            else
              for _FORV_30_ = 1, #L20_21 do
                if L20_21[_FORV_30_].state == kPHOTO_ANGLE or L20_21[_FORV_30_].state == kPHOTO_BACK then
                elseif L20_21[_FORV_30_].state == kPHOTO_FAR then
                  L25_26 = "sm42_01037"
                elseif L20_21[_FORV_30_].state == kPHOTO_NEAR then
                  L23_24 = L22_23 + 1
                  L25_26 = "sm42_01038"
                else
                  L24_25 = L24_25 + 1
                end
              end
              print("angle_ng_cnt = " .. L21_22)
              print("far_ng_cnt = " .. L22_23)
              print("near_ng_cnt = " .. L23_24)
              print("good_cnt = " .. L24_25)
              if L24_25 > 0 then
                Sound:pulse("success")
                Fn_missionViewEnd()
                Fn_missionInfoEnd()
                Fn_captionViewWait("sm42_01039")
                photo_success = true
                break
              elseif L21_22 >= 1 then
                L25_26 = "sm42_01058"
              elseif L22_23 > L23_24 then
                L25_26 = "sm42_01037"
              elseif L22_23 < L23_24 then
                L25_26 = "sm42_01038"
              end
              Fn_captionView(L25_26)
            end
          end
        end
      end
    end
    L20_21()
  end
  L20_21(L21_22, L22_23)
  _photo = nil
  _photo_area = false
  L5_6 = L20_21
  L20_21(L21_22)
  L20_21(L21_22)
  L20_21()
  L20_21()
  L20_21(L21_22)
  L20_21(L21_22, L22_23)
  L20_21(L21_22)
  L20_21(L21_22)
  L23_24 = "locator2_sdemo_bisma_client_02"
  L24_25 = "locator2_sdemo_bisma_client_03"
  L23_24 = {}
  L23_24.runLength = -1
  L23_24.arrivedLength = 2
  L23_24.recast = true
  L23_24 = 3
  L24_25 = 4
  L21_22(L22_23, L23_24, L24_25)
  L21_22(L22_23)
  function L23_24()
    Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_sdemo_bisma_client_02"):getWorldPos())
    waitSeconds(1.2)
    Player:setLookAtIk(false, 1, findGameObject2("Node", "locator2_sdemo_bisma_client_02"):getWorldPos())
  end
  L22_23(L23_24)
  while true do
    L23_24 = L20_21
    if L22_23 then
      L22_23()
    end
  end
  L23_24 = L20_21
  L23_24 = "sm42_client"
  L22_23(L23_24)
  L23_24 = L21_22
  L23_24 = "sm42_00510k"
  L22_23(L23_24)
  L23_24 = L22_23
  L24_25 = Camera
  L24_25 = L24_25.kPlayer
  L25_26 = Camera
  L25_26 = L25_26.kControl_All
  L22_23(L23_24, L24_25, L25_26, true)
  L22_23()
  L22_23()
  L22_23()
  L22_23()
  L22_23()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  if Fn_findNpc("flag_man63") ~= nil then
    Fn_disappearNpc("flag_man63")
  end
  if _event_bike.ship ~= nil then
    _event_bike.ship:setVisible(false)
  end
end
function pccubesensor2_client_grab_sensorOnEnter(A0_34)
  invokeTask(function()
    if _first_grab_navi == false then
      waitSeconds(1)
    end
    if _client_puppet:isGrabbed() == false then
      Fn_tutorialCaption("grab")
    end
  end)
end
function pccubesensor2_client_grab_sensorOnLeave(A0_35)
  Fn_tutorialCaptionKill()
  _first_grab_navi = false
  Fn_captionView("sm42_01059")
end
function pccubesensor2_lower_area_photo_01_OnEnter()
  _photo_area = true
  if _once_leave_sensor then
    Fn_naviKill()
    invokeTask(function()
      Fn_captionViewWait("sm42_01060")
      if _photo_area and _photo ~= nil then
        _photo:resetCaption()
      end
    end)
  end
end
function pccubesensor2_lower_area_photo_01_OnLeave()
  _photo_area = false
  Fn_naviSet(_client_puppet)
  invokeTask(function()
    Fn_turnNpc("sm42_client")
    Fn_playMotionNpc("sm42_client", "talk_01", false)
    Fn_captionView("sm42_01061")
    Fn_playMotionNpc("sm42_client", "stay_01", false)
  end)
  _once_leave_sensor = true
end
function pccubesensor2_lower_bis_area_view_01_OnLeave()
  Fn_pcSensorOff("pccubesensor2_lower_bis_area_view_01")
  _create_gem_task = create_energy_gem("locator2_bisma_navi_01", 40)
  Mv_gotoNextPhase()
end
function pccubesensor2_bil_area_01_OnEnter()
  Fn_captionView("sm42_01062")
  Fn_pcSensorOff("pccubesensor2_bil_area_01")
end
function pccubesensor2_high_area_01_OnEnter()
  Mv_gotoNextPhase()
  print("\232\163\149\231\166\143\229\177\164\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\231\170\129\229\133\165\227\129\151\227\129\190\227\129\151\227\129\159")
end
function pccubesensor2_bisma_near_area_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_bisma_area_event_01_OnEnter()
  Mv_gotoNextPhase()
  print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\229\136\176\231\157\128\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\231\170\129\229\133\165")
end
function pccubesensor2_bisma_area_photo_01_OnEnter()
  _photo_area = true
  if _guide_navi == true then
    Fn_naviKill()
    _guide_navi = false
  end
  if _once_leave_sensor then
    _photo_area = true
    Fn_naviKill()
    invokeTask(function()
      Fn_captionView("sm42_01063", 3, true)
      if _photo_area and _photo ~= nil then
        _photo:resetCaption()
      end
    end)
  end
end
function pccubesensor2_bisma_area_photo_01_OnLeave()
  local L0_36, L1_37
  _photo_area = false
  _once_leave_sensor = true
end
function clearEventFunc()
  comInitFlagEventArray("b2")
  Mv_createGem(findGameObject2("Node", "locator2_flag_gem_b2_01"), TYPE_EGEM)
  comInvokeFlagEventInit("ForSm21Ship01", "sm47_bike", "locator2_flag_ship_b2_01", "flag_man63", nil)
end
function pccubesensor2_flag_event_kaiwa_sensorOnEnter()
  print("\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159")
  invokeTask(function()
    Fn_pcSensorOff("pccubesensormulti2_flag_event_start_area_b2_01")
    Fn_pcSensorOff("pccubesensormulti2_flag_event_start_area_b2_02")
    _event_bike.kaiwa_flag = true
    _event_bike.sensor:setActive(false)
    Fn_kaiwaDemoView("sm42_00430k")
    _event_bike.pos_route_tbl = _comBike[comGetCreateDirection()][BIKE_ESCAPE]
    comFlagEventReRoute()
  end)
end
function pccubesensormulti2_flag_event_start_area_b2_01_OnEnter()
  comOnEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_b2_01_OnLeave()
  comOffEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_b2_02_OnEnter()
  comOnEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_b2_02_OnLeave()
  comOffEventAreaFlag()
end
function pccubesensor2_bisma_photo_guide_01_OnEnter()
  local L0_38, L1_39
end
function pccubesensor2_bisma_photo_guide_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_shipflag_photo_05"))
  Fn_captionView("sm42_01064")
  _guide_navi = true
end
