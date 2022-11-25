import("GameDatabase")
import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm42_common.lua")
EVENT_TIME_PLUS = 45
ADVICE = {
  TIME00 = 30,
  TIME01 = 60,
  TIME02 = 90,
  TIME03 = 120,
  EVENT_TIME01 = 125,
  TIME_END = 550,
  DIST = 1000,
  DIST00 = 950,
  DIST01 = 850,
  DIST02 = 750,
  DIST03 = 650
}
BANGA_RYZ_DIST = 40
BANGA_CLIENT_DIST = 3
BIRD_CHILD_MAX = 5
BIRD_MAX = BIRD_CHILD_MAX + 1
BIRD_SPEED_MIN = 1
BIRD_SPEED_LOW = 2
BIRD_SPEED_MID = 4
BIRD_SPEED_HIGH = 16
BIRD_SPEED_MAX = 24
CRY_DIST = 100
BIRD_INTERVAL_DIST01 = 2.5
BIRD_INTERVAL_DIST02 = 4.2
BIRD_LEAVE_DIST = 80
BIRD_1ST = 0
BIRD_ROUTE01 = 1
BIRD_ROUTE02 = 1
MOVE_CIRCLE = 1
MOVE_LINE = 2
MOVE_MOON = 3
EVENT_GEM = 6
CIRCLE_LOCATOR_MAX = 12
CIRCLE_POINT_DIST = 1.5
BIRD_KAIWA_SENSOR_VECT = Vector(4, 4, 4)
EVENT_START_NODE_VECT01 = Vector(1, 1, 0)
_puppet_tbl = {}
_npc_tbl = {}
_advice_kaiwa_sw = 0
_photo_area = false
_once_leave_sensor = false
_banga_sensor = false
_se_hdl = {}
_bird_speed = BIRD_SPEED_MID
_bird_gp_tbl = {
  {
    name = "gull_gp01",
    follow_node = "locator2_flag_po01_bird_group_01",
    dist_partner = "gull_1st"
  },
  {
    name = "gull_gp02",
    follow_node = "locator2_flag_po01_bird_group_02",
    dist_partner = "gull_1st"
  },
  {
    name = "gull_gp03",
    follow_node = "locator2_flag_po01_bird_group_03",
    dist_partner = "gull_gp01"
  },
  {
    name = "gull_gp04",
    follow_node = "locator2_flag_po01_bird_group_04",
    dist_partner = "gull_gp02"
  },
  {
    name = "gull_gp05",
    follow_node = "locator2_flag_po01_bird_group_05",
    dist_partner = "gull_1st"
  }
}
_bird_circle_loop = {
  [1] = {},
  [2] = {},
  [3] = {},
  [4] = {},
  [5] = {},
  [6] = {}
}
_ryz_pose = {
  ryz_stay00 = "ryz01_stay_00",
  ryz_stay01 = "ryz01_stay_01"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7
  }
  L1_1.name = "ryz01"
  L1_1.type = "ryz02"
  L1_1.node = "locator2_ryz_01"
  L2_2.name = "gull_1st"
  L2_2.type = "gull01"
  L2_2.node = "locator2_flag_po01_bird_01"
  L2_2.active = false
  L2_2.anim = "fly"
  L3_3.name = "gull_gp01"
  L3_3.type = "gull01"
  L3_3.node = "locator2_flag_po01_bird_group_01"
  L3_3.active = false
  L3_3.anim = "fly"
  L4_4.name = "gull_gp02"
  L4_4.type = "gull01"
  L4_4.node = "locator2_flag_po01_bird_group_02"
  L4_4.active = false
  L4_4.anim = "fly"
  L5_5 = {}
  L5_5.name = "gull_gp03"
  L5_5.type = "gull01"
  L5_5.node = "locator2_flag_po01_bird_group_03"
  L5_5.active = false
  L5_5.anim = "fly"
  L6_6 = {}
  L6_6.name = "gull_gp04"
  L6_6.type = "gull01"
  L6_6.node = "locator2_flag_po01_bird_group_04"
  L6_6.active = false
  L6_6.anim = "fly"
  L7_7.name = "gull_gp05"
  L7_7.type = "gull01"
  L7_7.node = "locator2_flag_po01_bird_group_05"
  L7_7.active = false
  L7_7.anim = "fly"
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L6_6[L7_7] = L8_8
    L6_6 = _npc_tbl
    L6_6[L7_7] = L8_8
  end
  client_puppet = L1_1
  if L1_1 == 1 then
    L1_1(L2_2)
    L1_1(L2_2)
    L1_1.pilot01 = L2_2
    L1_1.ship = L2_2
  else
    L1_1(L2_2)
    L1_1(L2_2)
  end
  L5_5 = "locator2_flag_po01_bird_group_02"
  L5_5 = {L6_6}
  L6_6 = "locator2_flag_po01_bird_group_03"
  L6_6 = {L7_7}
  L1_1.formation_v = L2_2
  for L5_5, L6_6 in L2_2(L3_3) do
    for L10_10, L11_11 in L7_7(L8_8) do
      for L15_15, L16_16 in L12_12(L13_13) do
        L17_17 = findGameObject2
        L17_17 = L17_17("Node", L16_16)
        _puppet_tbl.gull_1st:appendChild(L17_17, true)
      end
    end
  end
end
function Ingame()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28
  L0_18 = Fn_findNpc
  L1_19 = "girl01"
  L0_18 = L0_18(L1_19)
  if L0_18 == nil then
    L0_18 = Fn_warpNpc
    L1_19 = "sm42_client"
    L2_20 = "locator2_client_c_start_pos_01"
    L0_18(L1_19, L2_20)
  else
    L0_18 = Fn_disappearNpc
    L1_19 = "girl01"
    L0_18(L1_19)
  end
  L0_18 = Fn_missionStart
  L0_18()
  L0_18 = Fn_userCtrlOn
  L0_18()
  L0_18 = Fn_setGrabNpc
  L1_19 = "sm42_client"
  L2_20 = false
  L3_21 = false
  L0_18(L1_19, L2_20, L3_21)
  L0_18 = Mv_createNpcGrabSensor
  L1_19 = "sm42_client"
  L0_18 = L0_18(L1_19)
  L2_20 = L0_18
  L1_19 = L0_18.setActive
  L3_21 = true
  L1_19(L2_20, L3_21)
  L1_19 = clientGrabWait
  L2_20 = Fn_findNpcPuppet
  L3_21 = "sm42_client"
  L10_28 = L2_20(L3_21)
  L1_19(L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L2_20(L3_21))
  L1_19 = Fn_setCatWarpCheckPoint
  L2_20 = "locator2_pc_start_pos"
  L1_19(L2_20)
  L1_19 = setCatWarpClientPos
  L2_20 = "locator2_client_c_start_pos_01"
  L1_19(L2_20)
  L1_19 = invokeClientCatwarpCheck
  L2_20 = "sm42_client"
  L1_19 = L1_19(L2_20)
  L2_20 = Fn_tutorialCaptionKill
  L2_20()
  L2_20 = Fn_missionView
  L3_21 = "sm42_02002"
  L4_22 = 6
  L5_23 = 0.5
  L2_20(L3_21, L4_22, L5_23)
  L2_20 = create_energy_gem
  L3_21 = "locator2_banga_navi_01"
  L4_22 = 40
  L2_20 = L2_20(L3_21, L4_22)
  _create_gem_task = L2_20
  L3_21 = L0_18
  L2_20 = L0_18.setActive
  L4_22 = false
  L2_20(L3_21, L4_22)
  L2_20 = Fn_pcSensorOn
  L3_21 = "pccubesensor2_banga_area_event_01"
  L2_20(L3_21)
  L2_20 = invokeTask
  function L3_21()
    local L0_29, L1_30, L2_31
    L0_29 = 0
    L1_30 = nil
    L2_31 = 0
    while true do
      if L0_29 == ADVICE.TIME00 then
        Fn_captionView("sm42_02004")
      elseif L0_29 == ADVICE.TIME01 then
        Fn_captionView("sm42_02005")
      elseif L0_29 == ADVICE.TIME02 then
        Fn_captionView("sm42_02006")
      elseif L0_29 == ADVICE.TIME03 then
        Fn_captionView("sm42_02007")
      elseif L0_29 == ADVICE.EVENT_TIME01 then
        if comGetClearEventFlag() == true then
          print("\n\227\130\175\227\131\170\227\130\162\227\130\164\227\131\153\227\131\179\227\131\136\227\131\149\227\131\169\227\130\176\233\150\139\229\167\139\n")
          L1_30 = invokeClearEventFunc()
        end
      elseif L0_29 == ADVICE.TIME_END then
        comViewNaviCap("locator2_banga_navi_01", "locator2_banga_navi_01", "sm42_02008")
      elseif L0_29 == ADVICE.TIME_END * 2 then
        comViewNaviCap("locator2_banga_navi_01", "locator2_banga_navi_01", "sm42_02008")
        L0_29 = ADVICE.TIME_END
      end
      L2_31 = Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_banga_navi_01"):getWorldPos())
      if L0_29 < ADVICE.TIME00 and L2_31 < ADVICE.DIST00 then
        L0_29 = ADVICE.TIME00
      elseif L0_29 < ADVICE.TIME01 and L2_31 < ADVICE.DIST01 then
        L0_29 = ADVICE.TIME01
      elseif L0_29 < ADVICE.TIME02 and L2_31 < ADVICE.DIST02 then
        L0_29 = ADVICE.TIME02
      elseif L0_29 < ADVICE.TIME03 and L2_31 < ADVICE.DIST03 then
        L0_29 = ADVICE.TIME03
      else
        waitSeconds(1)
        L0_29 = L0_29 + 1
      end
      wait()
    end
  end
  L2_20 = L2_20(L3_21)
  L3_21 = Mv_waitPhase
  L3_21()
  L3_21 = Mv_safeTaskAbort
  L4_22 = event_task
  L3_21 = L3_21(L4_22)
  event_task = L3_21
  L3_21 = Mv_safeTaskAbort
  L4_22 = L2_20
  L3_21 = L3_21(L4_22)
  L2_20 = L3_21
  L3_21 = Mv_safeTaskAbort
  L4_22 = L1_19
  L3_21 = L3_21(L4_22)
  L1_19 = L3_21
  L3_21 = Mv_safeTaskAbort
  L4_22 = _create_gem_task
  L3_21 = L3_21(L4_22)
  _create_gem_task = L3_21
  L3_21 = Fn_captionViewWait
  L4_22 = "sm42_02009"
  L3_21(L4_22)
  L3_21 = Fn_blackout
  L3_21()
  L3_21 = Fn_userCtrlOff
  L3_21()
  L3_21 = birdDeleteFunc
  L3_21()
  L3_21 = Fn_setGrabReleaseNpc
  L4_22 = "sm42_client"
  L3_21(L4_22)
  L3_21 = Player
  L4_22 = L3_21
  L3_21 = L3_21.setGrabExceptionalObject
  L5_23 = {}
  L3_21(L4_22, L5_23)
  L3_21 = Fn_warpNpc
  L4_22 = "sm42_client"
  L5_23 = "locator2_banga_client_01"
  L3_21(L4_22, L5_23)
  L3_21 = Fn_resetPcPos
  L4_22 = "locator2_banga_resetpos_01"
  L3_21(L4_22)
  L3_21 = Fn_setCatWarpCheckPoint
  L4_22 = "locator2_banga_resetpos_01"
  L3_21(L4_22)
  L3_21 = Fn_loadNpcEventMotion
  L4_22 = "ryz01"
  L5_23 = _ryz_pose
  L3_21(L4_22, L5_23)
  L3_21 = Fn_fadein
  L3_21()
  L3_21 = Fn_kaiwaDemoView
  L4_22 = "sm42_00600k"
  L3_21(L4_22)
  L3_21 = Fn_pcSensorOn
  L4_22 = "pccubesensor2_banga_area_away_01"
  L3_21(L4_22)
  L3_21 = Fn_findNpc
  L4_22 = "ryz01"
  L3_21 = L3_21(L4_22)
  L4_22 = Fn_playMotionNpc
  L5_23 = L3_21
  L6_24 = "ryz01_stay_01"
  L7_25 = false
  L4_22(L5_23, L6_24, L7_25)
  L4_22 = findGameObject2
  L5_23 = "Node"
  L6_24 = "locator2_ryz_photo_01"
  L4_22 = L4_22(L5_23, L6_24)
  L5_23 = _puppet_tbl
  L5_23 = L5_23.ryz01
  L6_24 = L5_23
  L5_23 = L5_23.appendChild
  L7_25 = L4_22
  L5_23(L6_24, L7_25)
  L5_23 = _puppet_tbl
  L5_23 = L5_23.ryz01
  L6_24 = L5_23
  L5_23 = L5_23.appendChild
  L7_25 = findGameObject2
  L8_26 = "Node"
  L9_27 = "locator2_ryz_photo_02"
  L10_28 = L7_25(L8_26, L9_27)
  L5_23(L6_24, L7_25, L8_26, L9_27, L10_28, L7_25(L8_26, L9_27))
  L5_23 = Fn_userCtrlOn
  L5_23()
  L5_23 = invokeTask
  function L6_24()
    Fn_turnNpc("sm42_client", "locator2_banga_client_turn_01")
    Fn_playMotionNpc("sm42_client", "stay_01", false)
  end
  L5_23(L6_24)
  L5_23 = Fn_missionView
  L6_24 = "sm42_02010"
  L5_23(L6_24)
  while true do
    L5_23 = Mv_raycastCameraSight
    L6_24 = L4_22
    L7_25 = BANGA_RYZ_DIST
    L8_26 = Vector
    L9_27 = 0
    L10_28 = 1.5
    L10_28 = L8_26(L9_27, L10_28, 0)
    L5_23 = L5_23(L6_24, L7_25, L8_26, L9_27, L10_28, L8_26(L9_27, L10_28, 0))
    if L5_23 == false then
      L5_23 = wait
      L6_24 = 10
      L5_23(L6_24)
    end
  end
  L5_23 = Player
  L6_24 = L5_23
  L5_23 = L5_23.setStay
  L7_25 = true
  L5_23(L6_24, L7_25)
  L5_23 = Camera
  L6_24 = L5_23
  L5_23 = L5_23.lookTo
  L7_25 = findGameObject2
  L8_26 = "Node"
  L9_27 = "locator2_ryz_01"
  L7_25 = L7_25(L8_26, L9_27)
  L8_26 = L7_25
  L7_25 = L7_25.getWorldPos
  L7_25 = L7_25(L8_26)
  L8_26 = 2
  L9_27 = 2
  L5_23(L6_24, L7_25, L8_26, L9_27)
  L5_23 = Fn_captionViewWait
  L6_24 = "sm42_02011"
  L7_25 = 3
  L8_26 = 1
  L5_23(L6_24, L7_25, L8_26)
  L5_23 = Fn_setLivelyIcon
  L6_24 = _puppet_tbl
  L6_24 = L6_24.ryz01
  L7_25 = true
  L5_23(L6_24, L7_25)
  L5_23 = Player
  L6_24 = L5_23
  L5_23 = L5_23.setStay
  L7_25 = false
  L5_23(L6_24, L7_25)
  while true do
    L5_23 = Fn_getDistanceToPlayer
    L6_24 = _puppet_tbl
    L6_24 = L6_24.ryz01
    L5_23 = L5_23(L6_24)
    if L5_23 > 5 then
      L5_23 = wait
      L5_23()
    end
  end
  L5_23 = Fn_setLivelyIcon
  L6_24 = _puppet_tbl
  L6_24 = L6_24.ryz01
  L7_25 = false
  L5_23(L6_24, L7_25)
  L5_23 = Fn_turnNpc
  L6_24 = "ryz01"
  L5_23(L6_24)
  L5_23 = Fn_playMotionNpc
  L6_24 = "ryz01"
  L7_25 = "ryz01_stay_01"
  L8_26 = false
  L5_23(L6_24, L7_25, L8_26)
  L5_23 = Fn_pcSensorOff
  L6_24 = "pccubesensor2_banga_area_away_01"
  L5_23(L6_24)
  L5_23 = Fn_kaiwaDemoView
  L6_24 = "sm42_00610k"
  L5_23(L6_24)
  L5_23 = Fn_pcSensorOn
  L6_24 = "pccubesensor2_banga_ryz_area_photo_01"
  L5_23(L6_24)
  L5_23 = Fn_playMotionNpc
  L6_24 = "ryz01"
  L7_25 = "ryz01_stay_01"
  L8_26 = false
  L5_23(L6_24, L7_25, L8_26)
  photo_success = false
  L5_23 = Photo
  L5_23 = L5_23.create
  L6_24 = kPHOTO_CAPTION_ON
  L7_25 = kPHOTO_TYPE_ANY
  L8_26 = true
  L9_27 = {}
  L9_27.near = 2.7
  L9_27.far = 6
  L10_28 = {}
  L10_28.left = -0.3
  L10_28.right = 0.3
  L10_28.top = -0.3
  L10_28.bottom = 0.3
  L5_23 = L5_23(L6_24, L7_25, L8_26, L9_27, L10_28, "sm42_user_photo05")
  _photo = L5_23
  L5_23 = _photo
  L6_24 = L5_23
  L5_23 = L5_23.set
  L7_25 = _puppet_tbl
  L7_25 = L7_25.ryz01
  L8_26 = bn_l_eye
  L5_23(L6_24, L7_25, L8_26)
  L5_23 = _photo
  L6_24 = L5_23
  L5_23 = L5_23.set
  L7_25 = "locator2_ryz_photo_01"
  L5_23(L6_24, L7_25)
  L5_23 = _photo
  L6_24 = L5_23
  L5_23 = L5_23.set
  L7_25 = "locator2_ryz_photo_02"
  L5_23(L6_24, L7_25)
  while true do
    L5_23 = photo_success
    if L5_23 == false then
      L5_23 = _photo_area
      if L5_23 == true then
        L5_23 = _photo
        L6_24 = L5_23
        L5_23 = L5_23.run
        L5_23(L6_24)
        repeat
          L5_23 = wait
          L5_23()
          L5_23 = _photo_area
          if L5_23 ~= false then
            L5_23 = _photo
            L6_24 = L5_23
            L5_23 = L5_23.isRunning
            L5_23 = L5_23(L6_24)
          end
        until not L5_23
        L5_23 = _photo_area
        if L5_23 == true then
          L5_23 = _photo
          L6_24 = L5_23
          L5_23 = L5_23.getPhotoState
          L5_23 = L5_23(L6_24)
          L6_24 = 0
          L7_25 = 0
          L8_26 = 0
          L9_27 = 0
          L10_28 = nil
          print("\230\146\174\229\189\177\231\181\144\230\158\156\227\129\174\229\158\139 \226\134\146 " .. type(L5_23))
          if type(L5_23) ~= "table" then
            Fn_captionView("sm42_02012")
          elseif type(L5_23) == "table" then
            print("\227\131\149\227\131\172\227\131\188\227\131\160\229\134\133\227\129\174\227\131\142\227\131\188\227\131\137\230\149\176 = " .. #L5_23)
            if #L5_23 == 0 then
              Fn_captionView("sm42_02012")
            elseif #L5_23 < 3 then
              Fn_captionView("sm42_02013")
            elseif #L5_23 == 3 then
              for _FORV_14_ = 1, #L5_23 do
                if L5_23[_FORV_14_].state == kPHOTO_ANGLE or L5_23[_FORV_14_].state == kPHOTO_BACK then
                  L6_24 = L6_24 + 1
                  L10_28 = "sm42_02013"
                elseif L5_23[_FORV_14_].state == kPHOTO_FAR then
                  L7_25 = L7_25 + 1
                  L10_28 = "sm42_02015"
                elseif L5_23[_FORV_14_].state == kPHOTO_NEAR then
                  L8_26 = L7_25 + 1
                  L10_28 = "sm42_02014"
                else
                  L9_27 = L9_27 + 1
                end
              end
              print("angle_ng_cnt = " .. L6_24)
              print("far_ng_cnt = " .. L7_25)
              print("near_ng_cnt = " .. L8_26)
              print("good_cnt = " .. L9_27)
              if L9_27 == 3 then
                Sound:pulse("success")
                Fn_missionViewEnd()
                Fn_missionInfoEnd()
                photo_success = true
                break
              elseif L6_24 >= 1 then
                Fn_captionView("sm42_02013")
              elseif L7_25 > L8_26 then
                L10_28 = "sm42_02014"
              elseif L7_25 < L8_26 then
                L10_28 = "sm42_02015"
              end
              Fn_captionViewWait(L10_28)
            end
          end
        end
      end
    end
    L5_23 = wait
    L5_23()
  end
  L5_23 = HUD
  L6_24 = L5_23
  L5_23 = L5_23.setPhotoMode
  L7_25 = false
  L5_23(L6_24, L7_25)
  _photo = nil
  _photo_area = false
  L5_23 = Fn_setCatWarpCheckPoint
  L6_24 = "locator2_banga_warp_pc_01"
  L5_23(L6_24)
  L5_23 = Fn_pcSensorOff
  L6_24 = "pccubesensor2_banga_ryz_area_photo_01"
  L5_23(L6_24)
  L5_23 = invokeTask
  function L6_24()
    waitSeconds(1)
    Fn_turnNpc("ryz01")
    Fn_playMotionNpc("ryz01", "greeting", true)
    Fn_turnNpc("ryz01", "locator2_ryz_turn_01")
    Fn_playMotionNpc("ryz01", "ryz01_stay_01", false)
  end
  L5_23 = L5_23(L6_24)
  L6_24 = Fn_captionViewWait
  L7_25 = "sm42_02016"
  L8_26 = 3
  L9_27 = 3
  L6_24(L7_25, L8_26, L9_27)
  L6_24 = comViewNaviCap
  L7_25 = "locator2_banga_client_01"
  L8_26 = "locator2_banga_client_01"
  L9_27 = "sm42_02017"
  L10_28 = 3
  L6_24(L7_25, L8_26, L9_27, L10_28)
  L6_24 = invokeTask
  function L7_25()
    while true do
      if Fn_getDistanceToPlayer(client_puppet) <= BANGA_CLIENT_DIST then
        Mv_gotoNextPhase()
        break
      end
      wait()
    end
  end
  L6_24 = L6_24(L7_25)
  L2_20 = L6_24
  L6_24 = Mv_waitPhase
  L6_24()
  L6_24 = Mv_safeTaskAbort
  L7_25 = L2_20
  L6_24 = L6_24(L7_25)
  L2_20 = L6_24
  L6_24 = Fn_naviKill
  L6_24()
  L6_24 = Fn_turnNpc
  L7_25 = "sm42_client"
  L6_24(L7_25)
  L6_24 = Fn_kaiwaDemoView
  L7_25 = "sm42_00620k"
  L6_24(L7_25)
  L6_24 = Fn_blackout
  L6_24()
  L6_24 = Fn_userCtrlOff
  L6_24()
  L6_24 = Fn_resetPcPos
  L7_25 = "locator2_dt_resetpos_01"
  L6_24(L7_25)
  L6_24 = Fn_warpNpc
  L7_25 = "sm42_client"
  L8_26 = "locator2_dt_client_01"
  L6_24(L7_25, L8_26)
  L6_24 = Fn_fadein
  L7_25 = 4
  L6_24(L7_25)
  L6_24 = Fn_kaiwaDemoView
  L7_25 = "sm42_00630k"
  L6_24(L7_25)
  L6_24 = Fn_setKeepPlayerPos
  L6_24()
  L6_24 = Fn_setNextMissionFlag
  L6_24()
  L6_24 = Fn_nextMission
  L6_24()
  L6_24 = Fn_exitSandbox
  L6_24()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Fn_userCtrlOn()
end
function pccubesensor2_client_grab_sensorOnEnter(A0_32)
  Fn_tutorialCaption("grab")
end
function pccubesensor2_client_grab_sensorOnLeave(A0_33)
  Fn_tutorialCaptionKill()
  Fn_captionView("sm24_02018")
end
function pccubesensor2_banga_area_navi_01_OnEnter(A0_34)
  Fn_pcSensorOff(A0_34)
  Mv_gotoNextPhase()
end
function pccubesensor2_banga_area_event_01_OnEnter(A0_35)
  _banga_sensor = true
  Fn_pcSensorOff("pccubesensormulti2_flag_event_start_area_c_03")
  Fn_pcSensorOff(A0_35)
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_banga_area_away_01_OnLeave()
  invokeTask(function()
    Fn_naviSet(findGameObject2("Node", "locator2_ryz_01"))
    Fn_captionViewWait("sm42_02019")
  end)
end
function pccubesensor2_banga_area_away_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_banga_ryz_area_photo_01_OnEnter()
  _photo_area = true
  if _once_leave_sensor then
    Fn_naviKill()
    invokeTask(function()
      Fn_captionViewWait("sm42_02020")
      if _photo_area and _photo ~= nil then
        _photo:resetCaption()
      end
    end)
  end
end
function pccubesensor2_banga_ryz_area_photo_01_OnLeave()
  _photo_area = false
  invokeTask(function()
    Fn_naviSet(findGameObject2("Node", "locator2_ryz_01"))
    Fn_captionViewWait("sm42_02021")
  end)
  _once_leave_sensor = true
end
function invokeBirdSEPlay()
  return invokeTask(function()
    local L0_36
    L0_36 = {
      0.2,
      0.4,
      0.6,
      0.8,
      1
    }
    while Fn_findNpc("gull_1st") ~= nil do
      for _FORV_6_ = 1, BIRD_CHILD_MAX + 1 do
        ;({})[_FORV_6_] = Sound:playSEHandle("gull_cry", 1, "", _event_bike.ship)
        Sound:setAudibleRange(({})[_FORV_6_], CRY_DIST)
        waitSeconds(L0_36[RandI(1, 5)])
        ;({})[_FORV_6_] = Sound:playSEHandle("bird_flying_l", 1, "", _event_bike.ship)
        Sound:setAudibleRange(({})[_FORV_6_], CRY_DIST)
        waitSeconds(L0_36[RandI(1, 5)])
      end
    end
    for _FORV_6_ = 1, BIRD_CHILD_MAX + 1 do
      Sound:stopSEHandle(({})[_FORV_6_])
      ;({})[_FORV_6_] = nil
      Sound:stopSEHandle(({})[_FORV_6_])
      ;({})[_FORV_6_] = nil
    end
  end)
end
function invokeClearEventFunc()
  _pgem = {
    "locator2_flag_pgem_01",
    "locator2_flag_pgem_02",
    "locator2_flag_pgem_03",
    "locator2_flag_pgem_04",
    "locator2_flag_pgem_05",
    "locator2_flag_pgem_06"
  }
  _flag_warp = {
    "locator2_flag_po01_route01_warp_c_01",
    "locator2_flag_po01_route02_warp_c_01"
  }
  _flag_ray = {
    "locator2_flag_po01_ray_c_01",
    "locator2_flag_po01_ray_c_02",
    "locator2_flag_po01_ray_c_03",
    "locator2_flag_po01_ray_c_04"
  }
  Fn_pcSensorOn("pccubesensormulti2_flag_event_start_area_c_03")
  return invokeTask(function()
    local L0_37, L1_38, L2_39, L3_40
    while true do
      if L0_37 ~= true then
        L0_37()
      end
    end
    L0_37(L1_38, L2_39)
    L0_37(L1_38, L2_39)
    L0_37(L1_38)
    for L3_40 = 1, BIRD_CHILD_MAX do
      Fn_setNpcActive("gull_gp0" .. L3_40, true)
      Fn_setNpcVisible("gull_gp0" .. L3_40, true)
    end
    for L3_40, _FORV_4_ in L0_37(L1_38) do
      _player_crossing:appendChild(findGameObject2("Node", _flag_ray[L3_40]))
    end
    L0_37()
    L0_37(L1_38, L2_39)
    L0_37()
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37()
    L0_37(L1_38, L2_39)
    L3_40 = BIRD_1ST
    L3_40 = {}
    L3_40.moveSpeed = getBirdSpeed()
    L0_37(L1_38, L2_39, L3_40)
    L0_37(L1_38)
    L0_37(L1_38)
    mv_view_task = L0_37
    L0_37(L1_38, L2_39)
    L0_37()
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38)
    L3_40 = {}
    L3_40.pos = escapeDistCheck()
    L3_40.attr = "fly"
    L3_40 = {}
    L3_40.moveSpeed = getBirdSpeed()
    L0_37(L1_38, L2_39, L3_40)
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37.sensor = nil
    L0_37.sensor = L1_38
    L0_37(L1_38, L2_39)
    L0_37(L1_38, L2_39)
    L3_40 = 0
    L3_40 = L2_39(L3_40, 0, 0)
    L0_37(L1_38, L2_39, L3_40, L2_39(L3_40, 0, 0))
    L0_37(L1_38, L2_39)
    L0_37(L1_38, L2_39)
    L0_37(L1_38, L2_39)
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38)
    L0_37(L1_38, L2_39)
    L0_37(L1_38, L2_39)
    L0_37()
    mv_view_task = L0_37
    L0_37(L1_38)
    while true do
      if L0_37 > L1_38 then
        L0_37()
        break
      elseif L0_37 == true then
        L3_40 = TYPE_FLY
        L3_40 = L0_37
        L1_38(L2_39, L3_40, {
          moveSpeed = getBirdSpeed()
        })
      end
      L0_37()
    end
  end)
end
function pccubesensor2_flag_event_kaiwa_sensorOnEnter()
  invokeTask(function()
    _event_bike.sensor:setActive(false)
    setBirdSpeed(BIRD_SPEED_MIN)
    Fn_naviKill()
    Player:setStay(true)
    Fn_userCtrlAllOff()
    Fn_captionView("sm42_02023", 3, 1)
    setBirdSpeed(BIRD_SPEED_MAX)
    waitSeconds(2.5)
    Player:setStay(false)
    Fn_userCtrlOn()
    Fn_kaiwaDemoView("sm42_00520k")
    _event_bike.kaiwa_flag = true
  end)
end
function setBirdSpeed(A0_41)
  if A0_41 == nil then
    A0_41 = BIRD_SPEED_MID
  end
  _bird_speed = A0_41
  _event_bike.pilot01:setFlyMoveSpeed(_bird_speed)
  for _FORV_4_, _FORV_5_ in pairs(_bird_gp_tbl) do
    _npc_tbl[_FORV_5_.name]:setFlyMoveSpeed(_bird_speed)
  end
end
function getBirdSpeed()
  local L0_42, L1_43
  L0_42 = _bird_speed
  return L0_42
end
function birdWarpMove()
  local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49
  L0_44 = comGetCreateDirection
  L0_44 = L0_44()
  L1_45 = "locator2_flag_po01_route0"
  L1_45 = L1_45 .. L2_46 .. L3_47
  L5_49 = "Node"
  L5_49 = L4_48(L5_49, L1_45)
  L2_46(L3_47, L4_48, L5_49, L4_48(L5_49, L1_45))
  L2_46(L3_47)
  L2_46(L3_47, L4_48)
  L5_49 = {}
  L5_49.pos = L1_45
  L5_49.attr = "fly"
  L5_49 = {}
  L5_49.moveSpeed = 1
  L2_46(L3_47, L4_48, L5_49)
  for L5_49 = 1, BIRD_CHILD_MAX do
    L1_45 = "locator2_flag_po01_route0" .. L0_44 .. "_warp_c_gp_" .. string.format("%02d", L5_49)
    print(tostring(L1_45))
    _player_crossing:appendChild(findGameObject2("Node", L1_45))
    Fn_warpNpc("gull_gp" .. string.format("%02d", L5_49), L1_45)
    _npc_tbl["gull_gp" .. string.format("%02d", L5_49)]:fly({
      {pos = L1_45, attr = "fly"}
    }, {
      moveSpeed = getBirdSpeed()
    })
  end
  L2_46(L3_47)
  L2_46(L3_47)
end
function birdStartMove(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58
  L2_52 = comGetCreateDirection
  L2_52 = L2_52()
  L3_53 = 0
  L4_54, L5_55 = nil, nil
  L6_56 = {}
  L7_57 = 1
  if A1_51 == nil then
    A1_51 = MOVE_CIRCLE
  end
  L4_54 = "locator2_flag_move_01"
  L8_58 = MOVE_CIRCLE
  if A1_51 == L8_58 then
    L8_58 = BIRD_1ST
    if A0_50 == L8_58 then
      L8_58 = "locator2_flag_po01_route"
      L4_54 = L8_58 .. string.format("%02d", L2_52) .. "_move_c_01"
      L8_58 = {}
      L8_58.pos = L4_54
      L8_58.attr = "takeoff"
      L6_56[L7_57] = L8_58
      L7_57 = L7_57 + 1
      L8_58 = "locator2_flag_po01_route"
      L4_54 = L8_58 .. string.format("%02d", L2_52) .. "_move_c_02"
      L8_58 = {}
      L8_58.pos = L4_54
      L8_58.attr = "fly"
      L6_56[L7_57] = L8_58
      L7_57 = L7_57 + 1
      L8_58 = BIRD_ROUTE01
      if L2_52 == L8_58 then
        L3_53 = 7
      else
        L3_53 = 1
      end
      while true do
        L8_58 = "locator2_flag_move_circle_"
        L4_54 = L8_58 .. string.format("%02d", L3_53)
        L8_58 = findGameObject2
        L8_58 = L8_58("Node", L4_54)
        L5_55 = L8_58
        if L5_55 ~= nil then
          L8_58 = print
          L8_58(tostring(L4_54))
          L8_58 = {}
          L8_58.pos = L4_54
          L8_58.attr = "fly"
          L6_56[L7_57] = L8_58
        else
          break
        end
        L7_57 = L7_57 + 1
        L3_53 = L3_53 + 1
        L8_58 = wait
        L8_58()
        L8_58 = print
        L8_58("\229\133\136\233\160\173\227\129\174\231\167\187\229\139\149\233\133\141\229\136\151\228\189\156\230\136\144\228\184\173")
      end
    end
  else
    L8_58 = MOVE_LINE
    if A1_51 == L8_58 then
      L8_58 = 1
      L4_54 = "locator2_flag_po01_route" .. string.format("%02d", L2_52) .. "_move_c_01"
      L6_56[L7_57] = {pos = L4_54, attr = "takeoff"}
      _player_crossing:appendChild(findGameObject2("Node", L4_54))
      L7_57 = L7_57 + 1
      L4_54 = "locator2_flag_po01_route" .. string.format("%02d", L2_52) .. "_move_c_02"
      L6_56[L7_57] = {pos = L4_54, attr = "fly"}
      _player_crossing:appendChild(findGameObject2("Node", L4_54))
      L7_57 = L7_57 + 1
      while true do
        L4_54 = "locator2_flag_po01_route" .. string.format("%02d", L2_52) .. "_move_line_c_" .. string.format("%02d", L8_58)
        L5_55 = findGameObject2("Node", L4_54)
        if L5_55 ~= nil then
          _player_crossing:appendChild(L5_55)
          print(tostring(L4_54))
          L6_56[L7_57] = {pos = L4_54, attr = "fly"}
        else
          break
        end
        L7_57 = L7_57 + 1
        L8_58 = L8_58 + 1
        wait()
        print("\229\133\136\233\160\173\227\129\174\231\167\187\229\139\149\233\133\141\229\136\151\228\189\156\230\136\144\228\184\173")
      end
    else
      L8_58 = MOVE_MOON
      if A1_51 == L8_58 then
      end
    end
  end
  return L6_56
end
function birdCircleLoop()
  local L0_59, L1_60, L2_61, L3_62, L4_63, L5_64
  L0_59 = 1
  L1_60 = ""
  for L5_64 = 1, CIRCLE_LOCATOR_MAX do
    L1_60 = "locator2_flag_move_circle_" .. string.format("%02d", L5_64)
    _bird_circle_loop[1][L5_64] = {pos = L1_60, attr = "fly"}
  end
end
function birdDeleteFunc()
  if comGetClearEventFlag() == true then
    if _event_bike.sensor == nil then
      return false
    end
    _event_bike.sensor:setActive(false)
    _event_bike.kaiwa_flag = true
    if Fn_findNpc("gull_1st") ~= nil then
      Fn_disappearNpc("gull_1st")
      Fn_naviKill()
    end
    if Fn_findNpc("gull_1st") ~= nil then
      Fn_disappearNpc("gull_1st")
    end
    for _FORV_3_, _FORV_4_ in pairs(_bird_gp_tbl) do
      if Fn_findNpc(_FORV_4_.name) ~= nil then
        Fn_disappearNpc(_FORV_4_.name)
      end
    end
  end
end
WARP_NODE_VECT01 = Vector(40.1, 0, 0)
WARP_NODE_VECT02 = Vector(-40.1, 0, 0)
ROUTE01_01 = Vector(-20.2, 0, 0)
ROUTE01_02 = Vector(-30.1, 0, 0)
ROUTE01_03 = Vector(-40, 0, 0)
ROUTE01_04 = Vector(-50, 0, 0)
ROUTE01_05 = Vector(-60, 0, 0)
ROUTE01_06 = Vector(-70, 0, 0)
ROUTE01_07 = Vector(-90, 0, 0)
ROUTE01_08 = Vector(-120, 0, 0)
ROUTE02_01 = Vector(20.2, 0, 0)
ROUTE02_02 = Vector(30.1, 0, 0)
ROUTE02_03 = Vector(40, 0, 0)
ROUTE02_04 = Vector(50, 0, 0)
ROUTE02_05 = Vector(60, 0, 0)
ROUTE02_06 = Vector(70, 0, 0)
ROUTE02_07 = Vector(90, 0, 0)
ROUTE02_08 = Vector(120, 0, 0)
function reloadNode()
  local L0_65, L1_66, L2_67, L3_68, L4_69
  L0_65 = 1
  L1_66 = 1
  L2_67, L3_68 = nil, nil
  L4_69 = {}
  comCreatePTNodeVerB("PlayerStand")
  comCreatePTNodeVerC("PlayerNode_Ray_01", EVENT_RAY_NODE_VECT01)
  comCreatePTNodeVerC("PlayerNode_Ray_02", EVENT_RAY_NODE_VECT02)
  comCreatePTNodeVerC("PlayerNode_Ray_03", EVENT_RAY_NODE_VECT03)
  comCreatePTNodeVerC("PlayerNode_Ray_04", EVENT_RAY_NODE_VECT04)
  L2_67 = "PlayerNode_Ray_"
  _comBikeShare[BIKE_RAY] = createNodeArray(L2_67, TYPE_NODE)
  comCreatePTNodeVerB("PlayerNode_Route01_Warp_01", WARP_NODE_VECT01)
  L2_67 = "PlayerNode_Route01_Warp_"
  _comBike[BIKE_PART01][BIKE_WARP] = createNodeArray(L2_67, TYPE_NODE)
  comCreatePTNodeVerB("PlayerNode_Route02_Warp_01", WARP_NODE_VECT02)
  L2_67 = "PlayerNode_Route02_Warp_"
  _comBike[BIKE_PART02][BIKE_WARP] = createNodeArray(L2_67, TYPE_NODE)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_01", ROUTE01_01)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_02", ROUTE01_02)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_03", ROUTE01_03)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_04", ROUTE01_04)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_05", ROUTE01_05)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_06", ROUTE01_06)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_07", ROUTE01_07)
  comCreatePTNodeVerC("PlayerCrossingNode_route01_08", ROUTE01_08)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_01", ROUTE02_01)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_02", ROUTE02_02)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_03", ROUTE02_03)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_04", ROUTE02_04)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_05", ROUTE02_05)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_06", ROUTE02_06)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_07", ROUTE02_07)
  comCreatePTNodeVerC("PlayerCrossingNode_route02_08", ROUTE02_08)
  L2_67 = "PlayerCrossingNode_route01_"
  _comBike[BIKE_PART01][BIKE_MOVE] = createNodeArray(L2_67, TYPE_FLY)
  L2_67 = "PlayerCrossingNode_route02_"
  _comBike[BIKE_PART02][BIKE_MOVE] = createNodeArray(L2_67, TYPE_FLY)
  comCreatePTNodeVerC("PlayerEscapeRoute01_a_01", EVENT_WARP_NODE_VECT02)
  comCreatePTNodeVerC("PlayerEscapeRoute01_a_02", EVENT_WARP_NODE_VECT02)
  comCreatePTNodeVerC("PlayerEscapeRoute02_a_01", EVENT_WARP_NODE_VECT01)
  comCreatePTNodeVerC("PlayerEscapeRoute02_a_02", EVENT_WARP_NODE_VECT01)
  L2_67 = "PlayerEscapeRoute01_a_"
  _comBike[BIKE_PART01][BIKE_ESCAPE] = createNodeArray(L2_67, TYPE_WORLDPOS)
  L2_67 = "PlayerEscapeRoute02_a_"
  _comBike[BIKE_PART02][BIKE_ESCAPE] = createNodeArray(L2_67, TYPE_WORLDPOS)
end
function escapeDistCheck()
  local L0_70, L1_71, L2_72, L3_73, L4_74
  L0_70 = {
    L1_71,
    L2_72,
    L3_73,
    L4_74,
    "locator2_flag_po01_escape_point_05",
    "locator2_flag_po01_escape_point_06",
    "locator2_flag_po01_escape_point_07",
    "locator2_flag_po01_escape_point_08"
  }
  L1_71 = "locator2_flag_po01_escape_point_01"
  L2_72 = "locator2_flag_po01_escape_point_02"
  L3_73 = "locator2_flag_po01_escape_point_03"
  L4_74 = "locator2_flag_po01_escape_point_04"
  L1_71 = 0
  L2_72 = 0
  L3_73 = 20
  L4_74 = 0
  for _FORV_8_, _FORV_9_ in pairs(L0_70) do
    L1_71 = findGameObject2("Node", L0_70[_FORV_8_])
    if L3_73 > Fn_getDistanceToPlayer(L1_71) then
      L4_74 = _FORV_8_
      L3_73 = Fn_getDistanceToPlayer(L1_71)
    end
  end
  return L0_70[L4_74]
end
function pccubesensormulti2_flag_event_start_area_c_03_OnEnter()
  if _banga_sensor == false then
    comOnEventAreaFlag()
  end
end
function pccubesensormulti2_flag_event_start_area_c_03_OnLeave()
  comOffEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_c_01_OnEnter()
  comOnEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_c_01_OnLeave()
  comOffEventAreaFlag()
end
function comCreatePTNodeVerC(A0_75, A1_76)
  _player_crossing = createGameObject2("Node")
  _player_crossing:setName(A0_75)
  _player_crossing:setForceMove()
  _player_crossing:setRot(Fn_getPlayer():getWorldRot())
  _player_crossing:setPos(A1_76)
  _player_crossing:try_init()
  _player_crossing:waitForReady()
  _player_crossing:try_start()
end
