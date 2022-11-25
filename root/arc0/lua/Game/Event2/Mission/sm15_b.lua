dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm15_common.lua")
_next_phase = false
_is_in_air = false
_puppet_tbl = {}
_npc_hdl_tbl = {}
_is_area_distant = false
_is_writer_caption = false
_is_black_human_sensor_enter = false
enmgen2_sdemo_b = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm15_enemy_01",
      type = "stalker",
      locator = "locator_enemy_sdemo_b"
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
  end
}
function Initialize()
  local L0_10
  L0_10 = {
    {
      name = "sm15_writer_disguise",
      type = "man76",
      node = "locator2_writer_disguise_b",
      reset = false
    },
    {
      name = "sm15_black_human_01",
      type = "man38",
      node = "locator2_black_human_b_01",
      attach = false
    },
    {
      name = "sm15_black_human_02",
      type = "man32",
      node = "locator2_black_human_b_02",
      attach = false
    }
  }
  Fn_setupNpc(L0_10)
  for _FORV_4_, _FORV_5_ in pairs(L0_10) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_hdl_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_photo_point_01")
  Fn_pcSensorOff("pccubesensor2_photo_point_02")
  Fn_pcSensorOff("pccubesensor2_writer")
  Fn_pcSensorOff("pccubesensor2_area_distant_b")
  Fn_pcSensorOff("pccubesensor2_photo_area_distant_b")
  Fn_pcSensorOff("pccubesensor2_writer_caption_b")
  Fn_pcSensorOff("pccubesensor2_black_human_retry_b")
  _sdemo_cut01 = SDemo.create("sm15_b_cut01")
  _sdemo_cut02 = SDemo.create("sm15_b_cut02")
  _next_phase = false
  Fn_userCtrlOn()
end
function Ingame()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25
  L0_11 = Fn_coercionPoseNomal
  L0_11()
  L0_11 = {L1_12, L2_13}
  L1_12 = "sm15_black_human_01"
  L1_12 = {}
  for L5_16, L6_17 in L2_13(L3_14) do
    L7_18 = createGameObject2
    L8_19 = "Node"
    L7_18 = L7_18(L8_19)
    L1_12[L5_16] = L7_18
    L7_18 = L1_12[L5_16]
    L8_19 = L7_18
    L7_18 = L7_18.setName
    L9_20 = "locator2_point_"
    L10_21 = string
    L10_21 = L10_21.format
    L11_22 = "%02d"
    L12_23 = L5_16
    L10_21 = L10_21(L11_22, L12_23)
    L9_20 = L9_20 .. L10_21
    L7_18(L8_19, L9_20)
    L7_18 = L1_12[L5_16]
    L8_19 = L7_18
    L7_18 = L7_18.try_init
    L7_18(L8_19)
    L7_18 = L1_12[L5_16]
    L8_19 = L7_18
    L7_18 = L7_18.waitForReady
    L7_18(L8_19)
    L7_18 = L1_12[L5_16]
    L8_19 = L7_18
    L7_18 = L7_18.try_start
    L7_18(L8_19)
    L7_18 = _npc_hdl_tbl
    L7_18 = L7_18[L6_17]
    L8_19 = L7_18
    L7_18 = L7_18.appendChild
    L9_20 = L1_12[L5_16]
    L7_18(L8_19, L9_20)
    L7_18 = L1_12[L5_16]
    L8_19 = L7_18
    L7_18 = L7_18.setPos
    L9_20 = Vector
    L10_21 = 0
    L11_22 = 1.5
    L12_23 = 1
    L14_25 = L9_20(L10_21, L11_22, L12_23)
    L7_18(L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L9_20(L10_21, L11_22, L12_23))
    L7_18 = L1_12[L5_16]
    L8_19 = L7_18
    L7_18 = L7_18.setForceMove
    L7_18(L8_19)
  end
  L2_13(L3_14, L4_15)
  L2_13(L3_14, L4_15)
  L2_13(L3_14, L4_15)
  L2_13()
  L5_16 = false
  L3_14(L4_15, L5_16)
  L5_16 = true
  L3_14(L4_15, L5_16)
  L5_16 = "sm15_enemy_01"
  L5_16 = L3_14
  L6_17 = true
  L4_15(L5_16, L6_17)
  L5_16 = L3_14
  L5_16 = L4_15
  L6_17 = false
  L4_15(L5_16, L6_17)
  L5_16 = L3_14
  L6_17 = false
  L4_15(L5_16, L6_17)
  L5_16 = L3_14
  L6_17 = false
  L4_15(L5_16, L6_17)
  L5_16 = "pccubesensor2_photo_point_01"
  L4_15(L5_16)
  L5_16 = "pccubesensor2_photo_point_02"
  L4_15(L5_16)
  L5_16 = "locator2_pc_start_pos"
  L4_15(L5_16)
  L5_16 = "sm15_01002"
  L6_17 = "locator2_navi_photo_point"
  L7_18 = "sm15_01001"
  L5_16 = invokeTask
  function L6_17()
    repeat
      waitSeconds(1.5)
      while _is_writer_caption do
        wait()
      end
      Fn_turnNpc("sm15_writer_disguise", "locator2_navi_photo_point")
      Fn_playMotionNpc("sm15_writer_disguise", "lookaround", true)
    until Fn_isCaptionView("sm15_01012")
  end
  L5_16(L6_17)
  L5_16 = Fn_pcSensorOn
  L6_17 = "pccubesensor2_area_distant_b"
  L5_16(L6_17)
  L5_16 = warningAreaDistant
  L6_17 = "sm15_01000"
  L5_16 = L5_16(L6_17)
  L6_17 = Fn_pcSensorOn
  L7_18 = "pccubesensor2_writer_caption_b"
  L6_17(L7_18)
  L6_17 = writerCaption
  L7_18 = "sm15_01003"
  L6_17(L7_18)
  L6_17 = Mv_waitPhase
  L6_17()
  L6_17 = Mv_safeTaskAbort
  L7_18 = L5_16
  L6_17 = L6_17(L7_18)
  L5_16 = L6_17
  L6_17 = Fn_pcSensorOff
  L7_18 = "pccubesensor2_area_distant_b"
  L6_17(L7_18)
  L6_17 = {L7_18}
  L7_18 = {}
  L7_18.pos = "locator2_aim_b_01_03"
  L7_18.time = 5
  L7_18.hashfunc = "Linear"
  L7_18 = _sdemo_cut01
  L8_19 = L7_18
  L7_18 = L7_18.set
  L9_20 = "locator2_cam_b_01_01"
  L10_21 = "locator2_aim_b_01_sub"
  L11_22 = false
  L7_18(L8_19, L9_20, L10_21, L11_22)
  L7_18 = _sdemo_cut01
  L8_19 = L7_18
  L7_18 = L7_18.play
  L9_20 = nil
  L10_21 = L6_17
  L7_18(L8_19, L9_20, L10_21)
  L7_18 = waitSeconds
  L8_19 = 2.6
  L7_18(L8_19)
  L7_18 = {L8_19}
  L8_19 = {}
  L8_19.pos = "locator2_aim_b_01_04"
  L8_19.time = 0.5
  L6_17 = L7_18
  L7_18 = _sdemo_cut01
  L8_19 = L7_18
  L7_18 = L7_18.play
  L9_20 = nil
  L10_21 = L6_17
  L7_18(L8_19, L9_20, L10_21)
  L7_18 = Sound
  L8_19 = L7_18
  L7_18 = L7_18.playSE
  L9_20 = "sm15_horror"
  L10_21 = 1
  L7_18(L8_19, L9_20, L10_21)
  L7_18 = Fn_resetPcPos
  L8_19 = "locator2_navi_photo_point"
  L7_18(L8_19)
  L7_18 = waitSeconds
  L8_19 = 2
  L7_18(L8_19)
  L7_18 = Fn_kaiwaDemoView
  L8_19 = "sm15_00400k"
  L7_18(L8_19)
  L7_18 = _sdemo_cut01
  L8_19 = L7_18
  L7_18 = L7_18.stop
  L9_20 = 1
  L7_18(L8_19, L9_20)
  L7_18 = Fn_pcSensorOn
  L8_19 = "pccubesensor2_black_human_retry_b"
  L7_18(L8_19)
  L7_18 = Player
  L8_19 = L7_18
  L7_18 = L7_18.setStay
  L9_20 = false
  L10_21 = false
  L7_18(L8_19, L9_20, L10_21)
  L7_18 = Fn_setKittenActive
  L8_19 = true
  L7_18(L8_19)
  L7_18 = Mob
  L8_19 = L7_18
  L7_18 = L7_18.setStateValue
  L9_20 = Mob
  L9_20 = L9_20.StateValue
  L9_20 = L9_20.kPlayerGravityCoeff
  L10_21 = 1
  L7_18(L8_19, L9_20, L10_21)
  L7_18 = Fn_pcSensorOn
  L8_19 = "pccubesensor2_photo_area_distant_b"
  L7_18(L8_19)
  L7_18 = warningAreaDistant
  L8_19 = "sm15_01005"
  L9_20 = "locator2_navi_photo_point"
  L7_18 = L7_18(L8_19, L9_20)
  L8_19 = Fn_missionView
  L9_20 = "sm15_01004"
  L8_19(L9_20)
  L8_19 = writerCaption
  L9_20 = "sm15_01006"
  L8_19(L9_20)
  L8_19 = nil
  L9_20 = false
  L10_21 = Photo
  L10_21 = L10_21.create
  L11_22 = kPHOTO_CAPTION_ON
  L12_23 = kPHOTO_TYPE_ALL
  L13_24 = true
  L14_25 = {}
  L14_25.near = 2
  L14_25.far = 8
  L10_21 = L10_21(L11_22, L12_23, L13_24, L14_25, nil, "sm15_user_photo")
  L12_23 = L10_21
  L11_22 = L10_21.set
  L13_24 = _puppet_tbl
  L13_24 = L13_24.sm15_black_human_01
  L11_22(L12_23, L13_24)
  L12_23 = L10_21
  L11_22 = L10_21.set
  L13_24 = _puppet_tbl
  L13_24 = L13_24.sm15_black_human_02
  L11_22(L12_23, L13_24)
  L12_23 = L10_21
  L11_22 = L10_21.set
  L13_24 = "locator2_black_human_b_inform_01"
  L11_22(L12_23, L13_24)
  L12_23 = L10_21
  L11_22 = L10_21.set
  L13_24 = "locator2_photo_point_sub_01"
  L11_22(L12_23, L13_24)
  L12_23 = L10_21
  L11_22 = L10_21.set
  L13_24 = "locator2_photo_point_sub_02"
  L11_22(L12_23, L13_24)
  while true do
    L11_22 = _next_phase
    if not L11_22 then
      if L8_19 == nil then
        L11_22 = invokeTask
        function L12_23()
          local L0_26
          L0_26 = L10_21
          L0_26 = L0_26.run
          L0_26(L0_26)
          repeat
            L0_26 = wait
            L0_26()
            L0_26 = L10_21
            L0_26 = L0_26.isRunning
            L0_26 = L0_26(L0_26)
          until not L0_26
          L0_26 = L10_21
          L0_26 = L0_26.getPhotoState
          L0_26 = L0_26(L0_26)
          if L0_26 ~= nil then
            if type(L0_26) ~= "table" then
              L0_26 = {
                {state = L0_26}
              }
            end
            for _FORV_5_, _FORV_6_ in ipairs(L0_26) do
              if _FORV_6_.state == kPHOTO_OK or _FORV_6_.state == kPHOTO_ANGLE or _FORV_6_.state == kPHOTO_BACK or _FORV_6_.state == kPHOTO_NEAR then
              elseif _FORV_6_.state == kPHOTO_FAR then
                break
              elseif _FORV_6_.state == kPHOTO_OUT then
                break
              end
            end
          end
          if 2 == 0 then
            Sound:pulse("success")
            Fn_userCtrlAllOff()
            Fn_captionViewWait("sm15_01007")
            _next_phase = true
          elseif 2 == 1 then
            Fn_captionView("sm15_01008")
            L9_20 = true
          elseif 2 == 2 then
            Fn_captionView("sm15_01009")
            L9_20 = true
          end
          HUD:missionEnd()
        end
        L11_22 = L11_22(L12_23)
        L8_19 = L11_22
      end
      L11_22 = _is_black_human_sensor_enter
      if L11_22 then
        L11_22 = Fn_userCtrlAllOff
        L11_22()
        L12_23 = L10_21
        L11_22 = L10_21.kill
        L11_22(L12_23)
        L11_22 = Mv_viewObj
        L12_23 = "locator2_black_human_b_between_01"
        L13_24 = 0.2
        L11_22 = L11_22(L12_23, L13_24)
        L12_23 = Fn_playMotionNpc
        L13_24 = "sm15_black_human_01"
        L14_25 = "inform_ed"
        L12_23(L13_24, L14_25, false)
        L12_23 = Fn_playMotionNpc
        L13_24 = "sm15_black_human_02"
        L14_25 = "inform_ed"
        L12_23(L13_24, L14_25, true)
        L12_23 = invokeTask
        function L13_24()
          Fn_turnNpc("sm15_black_human_01")
        end
        L12_23(L13_24)
        L12_23 = Fn_turnNpc
        L13_24 = "sm15_black_human_02"
        L12_23(L13_24)
        L12_23 = Sound
        L13_24 = L12_23
        L12_23 = L12_23.playSE
        L14_25 = "m03_009"
        L12_23(L13_24, L14_25, 1)
        L12_23 = Fn_captionViewWait
        L13_24 = "sm15_01010"
        L12_23(L13_24)
        L13_24 = L11_22
        L12_23 = L11_22.abort
        L12_23(L13_24)
        function L12_23()
          Sound:playSE("pc1_012", 1)
          Fn_captionViewWait("sm15_01014", 3, 3, Font.kLayerFront)
          Fn_turnNpc("sm15_black_human_01", _puppet_tbl.sm15_black_human_02)
          Fn_turnNpc("sm15_black_human_02", _puppet_tbl.sm15_black_human_01)
          Mv_informNpc("sm15_black_human_01", L1_12[1])
          Mv_informNpc("sm15_black_human_02", L1_12[2])
          if HUD:isPhotoMode() then
            HUD:setPhotoMode(false)
          end
          if L8_19 ~= nil then
            L8_19:abort()
          end
          L8_19 = nil
        end
        L13_24 = Fn_sceneConversion
        L14_25 = "locator2_pc_reset_pos_b"
        L13_24(L14_25, L12_23)
      end
      if L9_20 then
        if L8_19 ~= nil then
          L12_23 = L8_19
          L11_22 = L8_19.abort
          L11_22(L12_23)
        end
        L8_19 = nil
        L9_20 = false
      end
      L11_22 = wait
      L11_22()
    end
  end
  L11_22 = print
  L12_23 = "\230\146\174\229\189\177\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\231\181\130\228\186\134"
  L11_22(L12_23)
  if L8_19 ~= nil then
    L12_23 = L8_19
    L11_22 = L8_19.abort
    L11_22(L12_23)
  end
  L8_19 = nil
  L12_23 = L10_21
  L11_22 = L10_21.kill
  L11_22(L12_23)
  L10_21 = nil
  _next_phase = false
  L12_23 = L7_18
  L11_22 = L7_18.abort
  L11_22(L12_23)
  L7_18 = nil
  L11_22 = waitSeconds
  L12_23 = 1
  L11_22(L12_23)
  L11_22 = Fn_pcSensorOff
  L12_23 = "pccubesensor2_photo_area_distant_b"
  L11_22(L12_23)
  L11_22 = Fn_pcSensorOff
  L12_23 = "pccubesensor2_writer_caption_b"
  L11_22(L12_23)
  L11_22 = Fn_kaiwaDemoView
  L12_23 = "sm15_00500k"
  L11_22(L12_23)
  L11_22 = _sdemo_cut02
  L12_23 = L11_22
  L11_22 = L11_22.set
  L13_24 = "locator2_cam_b_02_01"
  L14_25 = "locator2_aim_b_02_01"
  L11_22(L12_23, L13_24, L14_25, false)
  L11_22 = _sdemo_cut02
  L12_23 = L11_22
  L11_22 = L11_22.setCameraParam
  L13_24 = nil
  L14_25 = 0.1
  L11_22(L12_23, L13_24, L14_25, nil)
  L11_22 = _sdemo_cut02
  L12_23 = L11_22
  L11_22 = L11_22.play
  L11_22(L12_23)
  L12_23 = L2_13
  L11_22 = L2_13.requestSpawn
  L11_22(L12_23)
  repeat
    L11_22 = wait
    L11_22()
    L12_23 = L3_14
    L11_22 = L3_14.isReadyEnemy
    L11_22 = L11_22(L12_23)
  until L11_22
  L12_23 = L3_14
  L11_22 = L3_14.getGizmo
  L11_22 = L11_22(L12_23)
  L12_23 = L11_22
  L11_22 = L11_22.setVisible
  L13_24 = true
  L11_22(L12_23, L13_24)
  L11_22 = waitSeconds
  L12_23 = 0.3
  L11_22(L12_23)
  L12_23 = L3_14
  L11_22 = L3_14.move
  L13_24 = {L14_25}
  L14_25 = "locator2_enemy_terminate_pos_01"
  L11_22(L12_23, L13_24)
  L11_22 = invokeTask
  function L12_23()
    waitSeconds(1.3)
    L3_14:getGizmo():setVisible(false)
    L2_13:requestAllEnemyKill()
  end
  L11_22(L12_23)
  L11_22 = waitSeconds
  L12_23 = 0.4
  L11_22(L12_23)
  L11_22 = {L12_23, L13_24}
  L12_23 = {}
  L12_23.pos = "locator2_aim_b_02_02"
  L12_23.time = 1.2
  L12_23.hashfunc = "Linear"
  L13_24 = {}
  L13_24.pos = "locator2_aim_b_02_03"
  L13_24.time = 0.4
  L13_24.hashfunc = "EaseOut"
  L6_17 = L11_22
  L11_22 = _sdemo_cut02
  L12_23 = L11_22
  L11_22 = L11_22.play
  L13_24 = nil
  L14_25 = L6_17
  L11_22(L12_23, L13_24, L14_25)
  L11_22 = waitSeconds
  L12_23 = 3
  L11_22(L12_23)
  L11_22 = Fn_kaiwaDemoView
  L12_23 = "sm15_00600k"
  L11_22(L12_23)
  L11_22 = _sdemo_cut02
  L12_23 = L11_22
  L11_22 = L11_22.stop
  L13_24 = 0
  L11_22(L12_23, L13_24)
  L11_22 = Fn_resetCoercionPose
  L11_22()
  L11_22 = Fn_userCtrlOn
  L11_22()
  L11_22 = Fn_pcSensorOn
  L12_23 = "pccubesensor2_writer"
  L11_22(L12_23)
  L11_22 = Fn_setCatWarpCheckPoint
  L12_23 = "locator2_navi_photo_point"
  L11_22(L12_23)
  L11_22 = Mv_invokeMissionViewNaviCaption
  L12_23 = "sm15_01011"
  L13_24 = _puppet_tbl
  L13_24 = L13_24.sm15_writer_disguise
  L11_22 = L11_22(L12_23, L13_24)
  L12_23 = Fn_pcSensorOn
  L13_24 = "pccubesensor2_area_distant_b"
  L12_23(L13_24)
  L12_23 = warningAreaDistant
  L13_24 = "sm15_01012"
  L12_23 = L12_23(L13_24)
  while true do
    L13_24 = _next_phase
    if L13_24 then
      L13_24 = Player
      L14_25 = L13_24
      L13_24 = L13_24.getAction
      L13_24 = L13_24(L14_25)
      L14_25 = Player
      L14_25 = L14_25.kAction_Idle
      if L13_24 == L14_25 then
        L13_24 = _is_black_human_sensor_enter
      end
    end
    if L13_24 then
      L13_24 = _is_black_human_sensor_enter
      if L13_24 then
        L13_24 = Fn_userCtrlAllOff
        L13_24()
        L13_24 = Mv_viewObj
        L14_25 = "locator2_black_human_b_between_01"
        L13_24 = L13_24(L14_25, 0.2)
        L14_25 = Fn_playMotionNpc
        L14_25("sm15_black_human_01", "inform_ed", false)
        L14_25 = Fn_playMotionNpc
        L14_25("sm15_black_human_02", "inform_ed", true)
        L14_25 = invokeTask
        L14_25(function()
          Fn_turnNpc("sm15_black_human_01")
        end)
        L14_25 = Fn_turnNpc
        L14_25("sm15_black_human_02")
        L14_25 = Sound
        L14_25 = L14_25.playSE
        L14_25(L14_25, "m03_009", 1)
        L14_25 = Fn_captionViewWait
        L14_25("sm15_01013")
        L14_25 = L13_24.abort
        L14_25(L13_24)
        function L14_25()
          Sound:playSE("pc1_012", 1)
          Fn_captionViewWait("sm15_01014", 3, 3, Font.kLayerFront)
          Fn_turnNpc("sm15_black_human_01", _puppet_tbl.sm15_black_human_02)
          Fn_turnNpc("sm15_black_human_02", _puppet_tbl.sm15_black_human_01)
          Mv_informNpc("sm15_black_human_01", L1_12[1])
          Mv_informNpc("sm15_black_human_02", L1_12[2])
        end
        Fn_sceneConversion("locator2_pc_reset_pos_b", L14_25)
      end
      L13_24 = wait
      L13_24()
    end
  end
  L13_24 = print
  L14_25 = "\229\136\176\231\157\128"
  L13_24(L14_25)
  _next_phase = false
  L14_25 = L12_23
  L13_24 = L12_23.abort
  L13_24(L14_25)
  L12_23 = nil
  L13_24 = Fn_naviKill
  L13_24()
  L13_24 = Fn_pcSensorOff
  L14_25 = "pccubesensor2_writer"
  L13_24(L14_25)
  L13_24 = Fn_pcSensorOff
  L14_25 = "pccubesensor2_black_human_retry_b"
  L13_24(L14_25)
  L13_24 = Fn_turnNpc
  L14_25 = "sm15_writer_disguise"
  L13_24(L14_25)
  L13_24 = waitSeconds
  L14_25 = 0.5
  L13_24(L14_25)
  L13_24 = Fn_kaiwaDemoView
  L14_25 = "sm15_00700k"
  L13_24(L14_25)
  L13_24 = Player
  L14_25 = L13_24
  L13_24 = L13_24.dropGrabObject
  L13_24(L14_25)
  L13_24 = Fn_setNpcActive
  L14_25 = "sm15_client"
  L13_24(L14_25, true)
  L13_24 = Fn_setKeepPlayerPos
  L13_24()
  L13_24 = Fn_setNextMissionFlag
  L13_24()
  L13_24 = Fn_nextMission
  L13_24()
  L13_24 = Fn_exitSandbox
  L13_24()
end
function Finalize()
  local L0_27, L1_28
end
function writerCaption(A0_29)
  local L1_30
  L1_30 = 0
  invokeTask(function()
    while not _next_phase do
      if _is_writer_caption then
        L1_30 = L1_30 + 1
        if L1_30 == 120 then
          Fn_turnNpc("sm15_writer_disguise")
          Fn_captionView(A0_29)
        end
      else
        L1_30 = 0
      end
      wait()
    end
  end)
end
function pccubesensor2_photo_point_OnEnter()
  Player:setStay(true, false)
  Fn_setKittenActive(false)
  if Player:getAction() == Player.kAction_Float or Player:getAction() == Player.kAction_AnyGravKick then
    _is_in_air = true
    Mob:setStateValue(Mob.StateValue.kPlayerGravityCoeff, 0)
  end
  Mv_gotoNextPhase()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_photo_point_01")
  Fn_pcSensorOff("pccubesensor2_photo_point_02")
end
function pccubesensor2_writer_OnEnter()
  local L0_31, L1_32
  _next_phase = true
end
function pccubesensor2_writer_caption_OnEnter()
  local L0_33, L1_34
  _is_writer_caption = true
end
function pccubesensor2_writer_caption_OnLeave()
  local L0_35, L1_36
  _is_writer_caption = false
end
function pccubesensor2_black_human_retry_OnEnter()
  local L0_37, L1_38
  _is_black_human_sensor_enter = true
end
function pccubesensor2_black_human_retry_OnLeave()
  local L0_39, L1_40
  _is_black_human_sensor_enter = false
end
function pccubesensor2_area_distant_OnEnter()
  local L0_41, L1_42
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_43, L1_44
  _is_area_distant = true
end
function pccubesensor2_warning_b_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm15_09000")
  Player:setStay(false, false)
end
function pccubesensor2_warp_b_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
