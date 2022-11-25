dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
duck_01_move_speed = 3
duck_01capture_time = 22
puppet_tbl = {}
sdemo = nil
captured_flag = false
function Initialize()
  sdemo = SDemo.create("sm02_sdemo")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = RAC_naviPochiNoneStart
  L0_0()
  L0_0 = Fn_createGimmickBg
  L1_1 = "locator2_angel_ground"
  L2_2 = "bg2_doll_ground"
  L3_3 = "cisisdoll01_base"
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setIgnoreGrab
  L3_3 = false
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setActive
  L3_3 = false
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setRot
  L3_3 = XYZRotQuaternionEular
  L4_4 = 285
  L5_5 = 0
  L6_6 = 0
  L9_9 = L3_3(L4_4, L5_5, L6_6)
  L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L3_3(L4_4, L5_5, L6_6))
  L2_2 = L0_0
  L1_1 = L0_0.getPos
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1.y
  L2_2 = L2_2 - 0.13
  L1_1.y = L2_2
  L3_3 = L0_0
  L2_2 = L0_0.setPos
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L2_2 = puppet_tbl
  L3_3 = Fn_findNpcPuppet
  L4_4 = "sm02_duck_01"
  L3_3 = L3_3(L4_4)
  L2_2.sm02_duck_01 = L3_3
  L2_2 = puppet_tbl
  L3_3 = Fn_findNpcPuppet
  L4_4 = "sm02_client"
  L3_3 = L3_3(L4_4)
  L2_2.sm02_client = L3_3
  L2_2 = mother2
  L3_3 = L2_2
  L2_2 = L2_2.sendEvent
  L4_4 = "getBackgroundElement2Handle"
  L5_5 = "pen_door_l"
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  L3_3 = mother2
  L4_4 = L3_3
  L3_3 = L3_3.sendEvent
  L5_5 = "getBackgroundElement2Handle"
  L6_6 = "pen_door_r"
  L3_3 = L3_3(L4_4, L5_5, L6_6)
  L5_5 = L2_2
  L4_4 = L2_2.setRot
  L6_6 = XYZRotQuaternionEular
  L7_7 = 0
  L8_8 = 30
  L9_9 = 0
  L9_9 = L6_6(L7_7, L8_8, L9_9)
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L6_6(L7_7, L8_8, L9_9))
  L5_5 = L3_3
  L4_4 = L3_3.setRot
  L6_6 = XYZRotQuaternionEular
  L7_7 = 0
  L8_8 = -60
  L9_9 = 0
  L9_9 = L6_6(L7_7, L8_8, L9_9)
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L6_6(L7_7, L8_8, L9_9))
  L4_4 = Fn_userCtrlOff
  L4_4()
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.reset
  L4_4(L5_5)
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.set
  L6_6 = "locator2_sdemo_01_cam_01"
  L7_7 = "locator2_sdemo_01_aim_01"
  L8_8 = false
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.play
  L4_4(L5_5)
  while true do
    L4_4 = Fn_sendEventComSb
    L5_5 = "missionPartInitIsEnd"
    L4_4 = L4_4(L5_5)
    if L4_4 == false then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = Fn_missionStart
  L4_4()
  L4_4 = Fn_sendEventComSb
  L5_5 = "missionPartMainStart"
  L4_4(L5_5)
  L4_4 = Fn_kaiwaDemoView
  L5_5 = "sm02_00100k"
  L4_4(L5_5)
  L4_4 = Fn_sendEventComSb
  L5_5 = "setNpcActive"
  L6_6 = "sm02_duck_01"
  L7_7 = true
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = Fn_sendEventComSb
  L5_5 = "moveDuckA"
  L6_6 = "warppoint2_duck_01_"
  L4_4(L5_5, L6_6)
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.play
  L6_6 = nil
  L7_7 = {L8_8}
  L8_8 = {}
  L8_8.pos = "locator2_sdemo_01_aim_02"
  L8_8.time = 2
  L8_8.hashfunc = "EaseIn"
  L4_4(L5_5, L6_6, L7_7)
  while true do
    L4_4 = sdemo
    L5_5 = L4_4
    L4_4 = L4_4.isPlay
    L4_4 = L4_4(L5_5)
    if L4_4 then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.play
  L6_6 = {L7_7}
  L7_7 = {}
  L7_7.pos = "locator2_sdemo_01_cam_04"
  L7_7.time = 1
  L7_7.hashfunc = "EaseInOut"
  L7_7 = {L8_8}
  L8_8 = {}
  L8_8.pos = "locator2_sdemo_01_aim_03"
  L8_8.time = 3
  L8_8.hashfunc = "EaseOut"
  L4_4(L5_5, L6_6, L7_7)
  while true do
    L4_4 = sdemo
    L5_5 = L4_4
    L4_4 = L4_4.isPlay
    L4_4 = L4_4(L5_5)
    if L4_4 then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = Fn_findNpcPuppet
  L5_5 = "sm02_duck_01"
  L4_4 = L4_4(L5_5)
  L5_5 = findGameObject2
  L6_6 = "Node"
  L7_7 = "locator2_pc_start_pos"
  L5_5 = L5_5(L6_6, L7_7)
  L6_6 = L5_5
  L5_5 = L5_5.getWorldPos
  L5_5 = L5_5(L6_6)
  L6_6 = Fn_get_distance_angle
  L7_7 = L5_5
  L9_9 = L4_4
  L8_8 = L4_4.getWorldPos
  L9_9 = L8_8(L9_9)
  L6_6 = L6_6(L7_7, L8_8, L9_9, L8_8(L9_9))
  L7_7 = Fn_setPcPosRot
  L8_8 = L5_5
  L9_9 = XYZRotQuatD
  L9_9 = L9_9(0, L6_6, 0)
  L7_7(L8_8, L9_9, L9_9(0, L6_6, 0))
  L4_4 = Fn_findNpc
  L5_5 = "sm02_client"
  L4_4 = L4_4(L5_5)
  L5_5 = Fn_warpNpc
  L6_6 = L4_4
  L7_7 = "warppoint2_client_01"
  L5_5(L6_6, L7_7)
  L5_5 = Fn_setSisDollActive
  L6_6 = L4_4
  L7_7 = false
  L5_5(L6_6, L7_7)
  L6_6 = L0_0
  L5_5 = L0_0.setActive
  L7_7 = true
  L5_5(L6_6, L7_7)
  L5_5 = Fn_playMotionNpc
  L6_6 = L4_4
  L7_7 = "stay_02"
  L8_8 = false
  L5_5(L6_6, L7_7, L8_8)
  L5_5 = waitSeconds
  L6_6 = 0.5
  L5_5(L6_6)
  L5_5 = sdemo
  L6_6 = L5_5
  L5_5 = L5_5.reset
  L5_5(L6_6)
  L5_5 = sdemo
  L6_6 = L5_5
  L5_5 = L5_5.set
  L7_7 = "locator2_sdemo_01_cam_05"
  L8_8 = Fn_findNpcPuppet
  L9_9 = "sm02_duck_01"
  L8_8 = L8_8(L9_9)
  L9_9 = true
  L5_5(L6_6, L7_7, L8_8, L9_9, Vector(0, 0.3, 0))
  L5_5 = Sound
  L6_6 = L5_5
  L5_5 = L5_5.playSE
  L7_7 = "sis016c"
  L5_5(L6_6, L7_7)
  L5_5 = Fn_captionView
  L6_6 = "sm02_00100"
  L5_5(L6_6)
  L5_5 = waitSeconds
  L6_6 = 0.5
  L5_5(L6_6)
  L5_5 = RAC_invokeMoveCharaTask
  L6_6 = "sm02_client"
  L7_7 = "locator2_client_move_"
  L8_8 = {}
  L8_8.runLength = -1
  L5_5 = L5_5(L6_6, L7_7, L8_8)
  L6_6 = waitSeconds
  L7_7 = 1.75
  L6_6(L7_7)
  L6_6 = Fn_sendEventComSb
  L7_7 = "playMotionRun01DuckA"
  L6_6(L7_7)
  L6_6 = waitSeconds
  L7_7 = 0.75
  L6_6(L7_7)
  L7_7 = L5_5
  L6_6 = L5_5.abort
  L6_6(L7_7)
  L5_5 = nil
  L6_6 = RAC_stopNpcMoveTask
  L7_7 = "sm02_client"
  L6_6(L7_7)
  L6_6 = Fn_warpNpc
  L7_7 = L4_4
  L8_8 = "warppoint2_client_02"
  L6_6(L7_7, L8_8)
  L6_6 = sdemo
  L7_7 = L6_6
  L6_6 = L6_6.reset
  L6_6(L7_7)
  L6_6 = sdemo
  L7_7 = L6_6
  L6_6 = L6_6.set
  L8_8 = "locator2_sdemo_01_cam_06"
  L9_9 = "locator2_sdemo_01_aim_04"
  L6_6(L7_7, L8_8, L9_9)
  L6_6 = Fn_sendEventComSb
  L7_7 = "warpDuckA"
  L8_8 = "warppoint2_duck_01_01"
  L6_6(L7_7, L8_8)
  L6_6 = Fn_findNpc
  L7_7 = "sm02_duck_01"
  L6_6 = L6_6(L7_7)
  L7_7 = Fn_sendEventComSb
  L8_8 = "playMotionJumpDuckA"
  L9_9 = duck_01_move_speed
  L7_7(L8_8, L9_9)
  L7_7 = Sound
  L8_8 = L7_7
  L7_7 = L7_7.playSE
  L9_9 = "duck_scream"
  L7_7(L8_8, L9_9, 1, "", puppet_tbl.sm02_duck_01)
  L7_7 = invokeTask
  function L8_8()
    local L0_10, L1_11, L2_12, L3_13
    for L3_13 = 1, 5 do
      Sound:playSE("duck_flap", 1, "", puppet_tbl.sm02_duck_01)
      waitSeconds(0.7)
    end
  end
  L7_7(L8_8)
  L7_7 = waitSeconds
  L8_8 = 1
  L7_7(L8_8)
  L7_7 = sdemo
  L8_8 = L7_7
  L7_7 = L7_7.play
  L9_9 = {
    {
      pos = "locator2_sdemo_01_cam_07",
      time = 3,
      hashfunc = "EaseInOut"
    }
  }
  L7_7(L8_8, L9_9, {
    {
      pos = "locator2_sdemo_01_aim_05",
      time = 3,
      hashfunc = "EaseInOut"
    }
  })
  while true do
    L7_7 = sdemo
    L8_8 = L7_7
    L7_7 = L7_7.isPlay
    L7_7 = L7_7(L8_8)
    if L7_7 then
      L7_7 = wait
      L7_7()
    end
  end
  L8_8 = L4_4
  L7_7 = L4_4.playMotion
  L9_9 = "confuse_01"
  L7_7(L8_8, L9_9, {isRepeat = true})
  L7_7 = ResetPlayerPos
  L7_7()
  L7_7 = sdemo
  L8_8 = L7_7
  L7_7 = L7_7.stop
  L9_9 = 1
  L7_7(L8_8, L9_9)
  L7_7 = Fn_userCtrlOn
  L7_7()
  function L7_7()
    Player:setStay(true)
    Sound:playSE("kit053b_1")
    Fn_captionViewWait("sm02_00102")
    Fn_blackout()
    Fn_sendEventComSb("flyAbortDuckA")
    Fn_sendEventComSb("warpDuckA", "warppoint2_duck_01_capture_restart_01")
    ResetPlayerPos()
    Fn_sendEventComSb("flyDuckA", "locator2_duck_move_b_", duck_01_move_speed, 2)
    Fn_sendEventComSb("playMotionFallingDuckA")
    Fn_fadein()
    Player:setStay(false)
  end
  L8_8 = false
  function L9_9()
    local L0_14, L1_15, L2_16
    L0_14 = capture_duck_check_task
    L0_14 = L0_14()
    L1_15 = invokeTask
    function L2_16()
      waitSeconds(duck_01capture_time)
    end
    L1_15 = L1_15(L2_16)
    L2_16 = Fn_findNpcPuppet
    L2_16 = L2_16("sm02_duck_01")
    Fn_missionView("sm02_00103")
    Fn_naviSet(L2_16)
    if not L8_8 then
      invokeTask(function()
        waitSeconds(RAC_OPERATION_TUTORIAL_DELAY_DEFAULT)
        Sound:playSE("kit051b_1")
        Fn_captionView("sm02_00101")
      end)
    end
    waitSeconds(3)
    while captured_flag == false and L1_15:isRunning() do
      wait()
    end
    Fn_captionViewEnd()
    Fn_naviKill()
    L1_15:abort()
    L1_15 = nil
    L0_14:abort()
    L0_14 = nil
    if L1_15:isRunning() == false == true then
      L7_7()
      L8_8 = true
      return false
    end
    Fn_sendEventComSb("flyAbortDuckA")
    Fn_setNpcActive("sm02_duck_01", false)
    Player:setStay(true)
    Sound:playSE("kit052a_1")
    Fn_captionViewWait("sm02_00104")
    return true
  end
  while true do
    if L9_9() == false then
    end
  end
  Fn_blackout()
  L2_2:setRot(XYZRotQuaternionEular(0, 0, 0))
  L3_3:setRot(XYZRotQuaternionEular(0, 0, 0))
  Fn_userCtrlOff()
  Player:setStay(false)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function ResetPlayerPos()
  local L0_17, L1_18
  L0_17 = Fn_resetPcPos
  L1_18 = "locator2_pc_start_pos"
  L0_17(L1_18)
  L0_17 = Fn_getPlayerWorldPos
  L0_17 = L0_17()
  L1_18 = Fn_get_distance_angle
  L1_18 = L1_18(L0_17, Fn_findNpcPuppet("sm02_duck_01"):getWorldPos())
  Fn_setPcPosRot(L0_17, XYZRotQuatD(0, L1_18, 0))
end
function Finalize()
  RAC_naviPochiNoneEnd()
end
function capture_duck_check_task()
  return invokeTask(function()
    while true do
      if Fn_getDistanceToPlayerXZ(puppet_tbl.sm02_duck_01) <= 1.5 and (puppet_tbl.sm02_duck_01:getWorldPos().y - Fn_getPlayerWorldPos().y <= 2.5 and puppet_tbl.sm02_duck_01:getWorldPos().y - Fn_getPlayerWorldPos().y >= 0 or puppet_tbl.sm02_duck_01:getWorldPos().y - Fn_getPlayerWorldPos().y >= -1 and puppet_tbl.sm02_duck_01:getWorldPos().y - Fn_getPlayerWorldPos().y < 0) then
        captured_flag = true
        Sound:playSE("duck_scream", 1, "", puppet_tbl.sm02_duck_01)
        Sound:playSE("duck_flap", 1, "", puppet_tbl.sm02_duck_01)
        Sound:playSE("success")
        break
      end
      wait()
    end
  end)
end
