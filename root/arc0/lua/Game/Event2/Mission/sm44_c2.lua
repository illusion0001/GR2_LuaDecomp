dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/pdemo.lua")
_puppets = {}
_father_task = nil
_sdemo = nil
_sm44_a_c01_pdemo = nil
_sm44_b_c01_pdemo = nil
_father_no_turn = false
ESCAPE_SPEED_RATE = 1.1
ESCAPE_POINT_DIS = 1
ESCAPE_TURN_RANGE = 1000
ESCAPE_TURN_ANGLE = 60
CHASE_START_RANGE = 5
CHASE_OUT_RANGE = 20
FOLLOW_OUT_RANGE = 20
FOLLOW_CLEAR_TIME = 1740
FOLLOW_FADE_TIME = 4
FOLLOW_FADE_TIME_PLUS = 1
FOLLOW_CAPTION = {
  "sm44_02005",
  "sm44_02006",
  "sm44_02007",
  "sm44_02008",
  "sm44_02009",
  "sm44_02010",
  "sm44_02011",
  "sm44_02012",
  "sm44_02013",
  "sm44_02014",
  "sm44_02015",
  "sm44_02016",
  "sm44_02017",
  "sm44_02018",
  "sm44_02019",
  "sm44_02020",
  "sm44_02021",
  "sm44_02022",
  "sm44_02023",
  "sm44_02024"
}
FOLLOW_CAPTION_SE_PLAY_INDEX_AUJ_016 = 11
FOLLOW_CAPTION_SE_PLAY_INDEX_AUJ_017 = 18
FOLLOW_ROUTE = {
  "locator2_father_move02_01",
  "locator2_father_move02_02",
  "locator2_father_move02_03",
  "locator2_father_move02_04",
  "locator2_father_move02_05",
  "locator2_father_move02_06",
  "locator2_father_move02_07",
  "locator2_father_move02_08",
  "locator2_father_move02_09",
  "locator2_father_move02_10",
  "locator2_father_move02_11",
  "locator2_father_move02_12",
  "locator2_father_move02_13",
  "locator2_father_move02_14",
  "locator2_father_move02_15",
  "locator2_father_move02_16",
  "locator2_father_move02_17",
  "locator2_father_move02_18",
  "locator2_father_move02_19",
  "locator2_father_move02_20",
  "locator2_father_move02_21",
  "locator2_father_move02_22",
  "locator2_father_move02_23",
  "locator2_father_move02_24",
  "locator2_father_move02_25",
  "locator2_father_move02_26"
}
NPC_MOTION = {
  groggy = "man01_groggy_00"
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = RAC_setCostumeWait
  L0_0("kit03")
  L0_0 = Fn_disableCostumeChange
  L0_0(true)
  L0_0 = _puppets
  L0_0.sm44_client = Fn_findNpcPuppet("sm44_client")
  L0_0 = {
    {
      name = "father_01",
      type = "auj02",
      node = "locator2_father_01",
      attach = false,
      active = false
    },
    {
      name = "child_01",
      type = "eug01",
      node = "locator2_child_pos_04",
      active = false,
      not_mob = true
    },
    {
      name = "father_02",
      type = "auj02",
      node = "locator2_father_01",
      active = false,
      not_mob = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _puppets.father_01:loadPoseAnimation("run", "auj01_drunk_run_00")
  Fn_loadNpcEventMotion("father_01", NPC_MOTION)
  _sdemo = SDemo.create("sm44_sdemo")
  _sm44_a_c01_pdemo = PDemo.create("sm44_a_c01", Fn_findAreaHandle("ed_a_root"), {camera = true, scene_param = false})
  _sm44_b_c01_pdemo = PDemo.create("sm44_b_c01", Fn_findAreaHandle("ed_a_root"), {camera = true, scene_param = false})
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  while true do
    while true do
      L0_1 = _sm44_a_c01_pdemo
      L1_2 = L0_1
      L0_1 = L0_1.isLoading
      L0_1 = L0_1(L1_2)
      if L0_1 == false then
        L0_1 = wait
        L0_1()
      end
    end
  end
  while true do
    L0_1 = _sm44_b_c01_pdemo
    L1_2 = L0_1
    L0_1 = L0_1.isLoading
    L0_1 = L0_1(L1_2)
    if L0_1 == false then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_findNpc
  L1_2 = "father_01"
  L0_1 = L0_1(L1_2)
  L1_2 = L0_1
  L0_1 = L0_1.ignoreStoop
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "sm44_startCatWarp"
  L2_3 = "sm44_c2"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_setNpcActive
  L1_2 = "sm44_client"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setLookAtIk
  L2_3 = false
  L3_4 = 1
  L4_5 = Vector
  L5_6 = 0
  L5_6 = L4_5(L5_6, 0, 0)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L4_5(L5_6, 0, 0))
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setStay
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_warpNpc
  L1_2 = "father_01"
  L2_3 = "locator2_father_pos_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_playMotionNpc
  L1_2 = "father_01"
  L2_3 = NPC_MOTION
  L2_3 = L2_3.groggy
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_setNpcActive
  L1_2 = "father_01"
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.reset
  L0_1(L1_2)
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.set
  L2_3 = "locator2_father_cam_02"
  L3_4 = _puppets
  L3_4 = L3_4.father_01
  L4_5 = kSDEMO_APPEND_AIM
  L5_6 = Vector
  L5_6 = L5_6(0, 1.5, 0)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L5_6(0, 1.5, 0))
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.play
  L0_1(L1_2)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = waitSeconds
  L1_2 = 2
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView2
  L1_2 = "sm44_00400k"
  function L2_3()
    _sdemo:stop(0)
  end
  L3_4 = true
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = _sm44_a_c01_pdemo
  if L0_1 ~= nil then
    L0_1 = _sm44_a_c01_pdemo
    L1_2 = L0_1
    L0_1 = L0_1.play
    L0_1(L1_2)
    L0_1 = Fn_resetPcPos
    L1_2 = "locator2_player_start"
    L0_1(L1_2)
    L0_1 = invokeTask
    function L1_2()
      Fn_playMotionNpc("father_01", "stay")
      Fn_setNpcActive("father_01", false)
      Fn_warpNpc("father_01", "locator2_father_start02")
    end
    L0_1(L1_2)
    L0_1 = waitSeconds
    L1_2 = 0.8
    L0_1(L1_2)
    L0_1 = Sound
    L1_2 = L0_1
    L0_1 = L0_1.playSE
    L2_3 = "auj_015"
    L0_1(L1_2, L2_3)
    L0_1 = Fn_setBgmPoint
    L1_2 = "event"
    L2_3 = "chase_start"
    L0_1(L1_2, L2_3)
    L0_1 = Fn_captionViewWait
    L1_2 = "sm44_02025"
    L2_3 = 2
    L0_1(L1_2, L2_3)
    L0_1 = Fn_captionViewWait
    L1_2 = "sm44_02026"
    L2_3 = 2
    L0_1(L1_2, L2_3)
    while true do
      L0_1 = _sm44_a_c01_pdemo
      L1_2 = L0_1
      L0_1 = L0_1.isEnd
      L0_1 = L0_1(L1_2)
      if not L0_1 then
        L0_1 = wait
        L0_1()
      end
    end
    L0_1 = Fn_kaiwaDemoView2
    L1_2 = "sm44_00500k"
    function L2_3()
      _sm44_a_c01_pdemo:stop()
      _sm44_a_c01_pdemo:try_term()
      _sm44_a_c01_pdemo = nil
      Fn_setNpcActive("father_01", true)
    end
    L3_4 = true
    L0_1(L1_2, L2_3, L3_4)
    L0_1 = RAC_invokeMoveCharaTask2
    L1_2 = "father_01"
    L2_3 = FOLLOW_ROUTE
    L3_4 = {}
    L3_4.arrivedLength = 0.5
    L3_4.runLength = -1
    L4_5 = ESCAPE_SPEED_RATE
    L3_4.anim_run_speed = L4_5
    L3_4.anim_speed_over = true
    L3_4.navimesh = true
    L3_4.loop = true
    L0_1 = L0_1(L1_2, L2_3, L3_4)
    _father_task = L0_1
    L0_1 = Player
    L1_2 = L0_1
    L0_1 = L0_1.setStay
    L2_3 = false
    L0_1(L1_2, L2_3)
    L0_1 = Fn_userCtrlOn
    L0_1()
  end
  while true do
    L0_1 = Player
    L1_2 = L0_1
    L0_1 = L0_1.setStay
    L2_3 = false
    L0_1(L1_2, L2_3)
    L0_1 = Fn_userCtrlOn
    L0_1()
    L0_1 = Fn_setBgmPoint
    L1_2 = "event"
    L2_3 = "chase_start"
    L0_1(L1_2, L2_3)
    L0_1 = Fn_missionView
    L1_2 = "sm44_02027"
    L0_1(L1_2)
    L0_1 = false
    while true do
      L1_2 = Fn_getDistanceToPlayer
      L2_3 = _puppets
      L2_3 = L2_3.father_01
      L1_2 = L1_2(L2_3)
      L2_3 = CHASE_START_RANGE
      if L1_2 < L2_3 then
        L0_1 = true
        break
      else
        L2_3 = _father_no_turn
        if L2_3 == false then
          L2_3 = CHASE_OUT_RANGE
          if L1_2 > L2_3 then
            L0_1 = false
            break
          end
        end
      end
      L2_3 = wait
      L2_3()
    end
    if L0_1 then
      L1_2 = Fn_missionView
      L2_3 = "sm44_02028"
      L1_2(L2_3)
      L1_2 = waitSeconds
      L2_3 = 2
      L1_2(L2_3)
      L1_2 = invokeTask
      function L2_3()
        local L0_7, L2_8, L3_9
        for _FORV_3_ = 1, #L2_8 do
          if _FORV_3_ == FOLLOW_CAPTION_SE_PLAY_INDEX_AUJ_016 then
            Sound:playSE("auj_016")
          elseif _FORV_3_ == FOLLOW_CAPTION_SE_PLAY_INDEX_AUJ_017 then
            Sound:playSE("auj_017")
          end
          Fn_captionViewWait(FOLLOW_CAPTION[_FORV_3_], nil, nil, Font.kLayerFront)
        end
      end
      L1_2 = L1_2(L2_3)
      L2_3 = true
      L3_4 = 0
      while true do
        while true do
          L4_5 = FOLLOW_CLEAR_TIME
          if L3_4 < L4_5 then
            L4_5 = Fn_getDistanceToPlayer
            L5_6 = _puppets
            L5_6 = L5_6.father_01
            L4_5 = L4_5(L5_6)
            L5_6 = FOLLOW_OUT_RANGE
            if L4_5 < L5_6 then
              L5_6 = math
              L5_6 = L5_6.min
              L5_6 = L5_6(L3_4 + 1, FOLLOW_CLEAR_TIME)
              L3_4 = L5_6
              L5_6 = HUD
              L5_6 = L5_6.faderStability
              L5_6 = L5_6(L5_6)
              if L5_6 then
                L5_6 = FOLLOW_CLEAR_TIME
                L5_6 = L5_6 - FOLLOW_FADE_TIME * 30
                if L3_4 >= L5_6 then
                  L5_6 = HUD
                  L5_6 = L5_6.blackout
                  L5_6(L5_6, FOLLOW_FADE_TIME + FOLLOW_FADE_TIME_PLUS)
                end
              end
            else
              L5_6 = _father_no_turn
              if L5_6 == false then
                L5_6 = HUD
                L5_6 = L5_6.fadein
                L5_6(L5_6, 0.5)
                L5_6 = Player
                L5_6 = L5_6.setStay
                L5_6(L5_6, true)
                L5_6 = Fn_userCtrlAllOff
                L5_6()
                L2_3 = false
                break
              end
            end
          end
          L5_6 = wait
          L5_6()
        end
      end
      while true do
        L4_5 = HUD
        L5_6 = L4_5
        L4_5 = L4_5.faderStability
        L4_5 = L4_5(L5_6)
        if not L4_5 then
          L4_5 = wait
          L4_5()
        end
      end
      if L1_2 ~= nil then
        L5_6 = L1_2
        L4_5 = L1_2.abort
        L4_5(L5_6)
        L1_2 = nil
      end
      if L2_3 then
        L4_5 = Fn_blackout
        L4_5()
        L4_5 = waitSeconds
        L5_6 = 1
        L4_5(L5_6)
        L4_5 = Player
        L5_6 = L4_5
        L4_5 = L4_5.setStay
        L4_5(L5_6, true)
        L4_5 = Fn_userCtrlAllOff
        L4_5()
        L4_5 = Fn_captionViewEnd
        L4_5()
        L4_5 = _father_task
        if L4_5 ~= nil then
          L4_5 = _father_task
          L5_6 = L4_5
          L4_5 = L4_5.abort
          L4_5(L5_6)
          _father_task = nil
        end
        L4_5 = RAC_stopNpcMoveTask
        L5_6 = "father_01"
        L4_5(L5_6)
        break
      end
    end
    L1_2 = _father_no_turn
    if L1_2 == false then
      L1_2 = Fn_getPlayerWorldPos
      L1_2 = L1_2()
      L2_3 = _puppets
      L2_3 = L2_3.father_01
      L3_4 = L2_3
      L2_3 = L2_3.getWorldPos
      L2_3 = L2_3(L3_4)
      L1_2 = L1_2 - L2_3
      L2_3 = Vector
      L3_4 = 0
      L4_5 = 0
      L5_6 = 1
      L2_3 = L2_3(L3_4, L4_5, L5_6)
      L3_4 = _puppets
      L3_4 = L3_4.father_01
      L4_5 = L3_4
      L3_4 = L3_4.getWorldRot
      L3_4 = L3_4(L4_5)
      L4_5 = L3_4
      L3_4 = L3_4.Apply
      L5_6 = L2_3
      L3_4 = L3_4(L4_5, L5_6)
      L2_3 = L3_4
      L2_3.y = 0
      L1_2.y = 0
      L3_4 = RAC_getDistanceAngle
      L5_6 = L1_2
      L4_5 = L1_2.Normalize
      L4_5 = L4_5(L5_6)
      L5_6 = L2_3.Normalize
      L5_6 = L5_6(L2_3)
      L3_4 = L3_4(L4_5, L5_6, L5_6(L2_3))
      L4_5 = print
      L5_6 = "Failed..Len="
      L5_6 = L5_6 .. L1_2:Length() .. " angle=" .. L3_4
      L4_5(L5_6)
      L5_6 = L1_2
      L4_5 = L1_2.Length
      L4_5 = L4_5(L5_6)
      L5_6 = ESCAPE_TURN_RANGE
      if L4_5 < L5_6 then
        L4_5 = ESCAPE_TURN_ANGLE
        if L3_4 <= L4_5 then
          L4_5 = print
          L5_6 = "Father Returned!"
          L4_5(L5_6)
          _father_task = nil
          L4_5 = Fn_findNpc
          L5_6 = "father_01"
          L4_5 = L4_5(L5_6)
          L5_6 = L4_5
          L4_5 = L4_5.getMoveCurrentIndex
          L4_5 = L4_5(L5_6)
          L5_6 = {}
          for _FORV_9_, _FORV_10_ in pairs(FOLLOW_ROUTE) do
            if L4_5 - _FORV_9_ < 1 then
            end
            table.insert(L5_6, FOLLOW_ROUTE[L4_5 - _FORV_9_ + #FOLLOW_ROUTE])
          end
          RAC_stopNpcMoveTask("father_01", _father_task)
          _father_task = RAC_invokeMoveCharaTask2("father_01", L5_6, {
            arrivedLength = 0.5,
            runLength = -1,
            anim_run_speed = ESCAPE_SPEED_RATE,
            anim_speed_over = true,
            navimesh = true,
            loop = true
          })
        end
      end
    end
    L1_2 = Fn_captionViewWait
    L2_3 = "sm44_02029"
    L1_2(L2_3)
    L1_2 = Fn_setBgmPoint
    L2_3 = "event"
    L3_4 = "chase_reset"
    L1_2(L2_3, L3_4)
    L1_2 = Fn_blackout
    L1_2()
    L1_2 = RAC_stopNpcMoveTask
    L2_3 = "father_01"
    L3_4 = _father_task
    L1_2(L2_3, L3_4)
    _father_task = nil
    L1_2 = Fn_resetPcPos
    L2_3 = "locator2_player_restart"
    L1_2(L2_3)
    L1_2 = Fn_warpNpc
    L2_3 = "father_01"
    L3_4 = "locator2_father_start02"
    L1_2(L2_3, L3_4)
    L1_2 = Fn_fadein
    L1_2()
    L1_2 = RAC_invokeMoveCharaTask2
    L2_3 = "father_01"
    L3_4 = FOLLOW_ROUTE
    L4_5 = {}
    L4_5.arrivedLength = 0.5
    L4_5.runLength = -1
    L5_6 = ESCAPE_SPEED_RATE
    L4_5.anim_run_speed = L5_6
    L4_5.anim_speed_over = true
    L4_5.navimesh = true
    L4_5.loop = true
    L1_2 = L1_2(L2_3, L3_4, L4_5)
    _father_task = L1_2
  end
  L0_1 = Fn_setKittenAndCatActive
  L1_2 = false
  L0_1(L1_2)
  L0_1 = _sm44_b_c01_pdemo
  L1_2 = L0_1
  L0_1 = L0_1.play
  L0_1(L1_2)
  L0_1 = Fn_fadein
  L0_1()
  while true do
    L0_1 = _sm44_b_c01_pdemo
    L1_2 = L0_1
    L0_1 = L0_1.isEnd
    L0_1 = L0_1(L1_2)
    if not L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  function L0_1()
    _sm44_b_c01_pdemo:stop()
    _sm44_b_c01_pdemo:try_term()
    _sm44_b_c01_pdemo = nil
    Fn_setNpcActive("father_01", false)
    Fn_setKittenAndCatActive(true)
    Fn_resetPcPos("locator2_player_pos_04")
    Fn_setNpcActive("father_02", true)
    Fn_warpNpc("father_02", "locator2_father_pos_04")
    Fn_setNpcActive("child_01", true)
    Fn_warpNpc("child_01", "locator2_child_pos_04")
    _sdemo:reset()
    _sdemo:set("locator2_player_cam_03", Player:getPuppet(), kSDEMO_APPEND_AIM, Vector(0, 2, 0))
    _sdemo:play()
  end
  L1_2 = Fn_kaiwaDemoView2
  L2_3 = "sm44_00600k"
  L3_4 = L0_1
  L1_2(L2_3, L3_4)
  L1_2 = Fn_fadein
  L1_2()
  L1_2 = waitSeconds
  L2_3 = 1
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm44_00700k"
  L1_2(L2_3)
  L1_2 = Fn_setBgmPoint
  L2_3 = "event"
  L3_4 = "mission_end"
  L1_2(L2_3, L3_4)
  L1_2 = _sdemo
  L2_3 = L1_2
  L1_2 = L1_2.stop
  L3_4 = 1
  L1_2(L2_3, L3_4)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setStay
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_setKeepPlayerPos
  L1_2()
  L1_2 = Fn_setNextMissionFlag
  L1_2()
  L1_2 = Fn_nextMission
  L1_2()
  L1_2 = Fn_exitSandbox
  L1_2()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function cubesensor2_father_noturn_OnEnter(A0_10, A1_11)
  if string.match(A1_11:getName(), "father_01") ~= nil then
    print("cubesensor2_father_noturn_OnEnter.." .. A1_11:getName())
    _father_no_turn = true
  end
end
function cubesensor2_father_noturn_OnLeave(A0_12, A1_13)
  if string.match(A1_13:getName(), "father_01") ~= nil then
    print("cubesensor2_father_noturn_OnLeave.." .. A1_13:getName())
    _father_no_turn = false
  end
end
