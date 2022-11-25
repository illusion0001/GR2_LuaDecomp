dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
puppet_crow = nil
brain_crow = nil
function Initialize()
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_pcSensorOff("pccubesensor2_02")
  _sdemo_cut01 = SDemo.create("cut01")
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_restart_pos_ep09_r"
  L0_0(L1_1)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_missionView
  L1_1 = "ep09_18002"
  L0_0(L1_1)
  L0_0 = waitSeconds
  L1_1 = 1.3
  L0_0(L1_1)
  L0_0 = Fn_naviSet
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_ghost_city_01"
  L7_7 = L1_1(L2_2, L3_3)
  L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L1_1(L2_2, L3_3))
  L0_0 = waitPhase
  L0_0()
  L0_0 = Fn_pcSensorOff
  L1_1 = "pcspheresensor2_01"
  L0_0(L1_1)
  L0_0 = Fn_naviKill
  L0_0()
  L0_0 = Fn_captionView
  L1_1 = "ep09_18008"
  L0_0(L1_1)
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_restart_pos_ep09_r_02"
  L0_0(L1_1)
  L0_0 = false
  L1_1 = false
  L2_2 = 0
  L3_3 = nil
  L4_4 = invokeTask
  function L5_5()
    repeat
      Fn_missionView("ep09_18002")
      waitSeconds(90)
    until L1_1
  end
  L4_4 = L4_4(L5_5)
  L5_5 = invokeTask
  function L6_6()
    local L0_8, L1_9, L2_10, L3_11
    repeat
      for L3_11 = 1, 11 do
        L3_3 = findGameObject2("Node", string.format("locator2_ve_ar_b_%02d", L3_11))
        if is_check_eye_node(L3_3, 200, 10) then
          if L0_0 == false then
            L0_0 = true
          end
          if L1_1 == false then
            L1_1 = true
          end
          Fn_captionView("ep09_18003")
          Fn_naviSet(findGameObject2("Node", "locator2_ve_ar_b_01"))
          Fn_pcSensorOn("pccubesensor2_01")
          if L2_2 == 0 then
            L2_2 = 1
          end
        end
      end
      L0_8()
    until L0_8
  end
  L5_5 = L5_5(L6_6)
  L6_6 = invokeTask
  function L7_7()
    waitSeconds(180)
    if L0_0 == false then
      if L1_1 == false then
        L1_1 = true
      end
      if L0_0 == false then
        L0_0 = true
      end
      Fn_sendEventComSb("requestSupportCrowSpawn", "locator2_crow_start_pos_ep09_r_02", Supporter.FirstAction.Air, true)
      repeat
        wait()
      until Fn_sendEventComSb("requestCrowSpawn")
      Fn_sendEventComSb("requestsupportCrowMove", "locator2_crow_move_pos_ep09_r_02", "locator2_crow_move_pos_ep09_r_01", "20.0")
      puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
      brain_crow = Fn_sendEventComSb("requestCrowBrain")
      repeat
        wait()
      until brain_crow:isMovePointEnd()
      Fn_captionView("ep09_18009")
      Fn_naviSet(puppet_crow)
      Fn_pcSensorOn("pccubesensor2_02")
      if L2_2 == 0 then
        L2_2 = 2
      end
    end
  end
  L6_6 = L6_6(L7_7)
  repeat
    L7_7 = wait
    L7_7()
  until L2_2 > 0
  L7_7 = L4_4.isRunning
  L7_7 = L7_7(L4_4)
  if L7_7 then
    L7_7 = L4_4.abort
    L7_7(L4_4)
    L4_4 = nil
  end
  L7_7 = L5_5.isRunning
  L7_7 = L7_7(L5_5)
  if L7_7 then
    L7_7 = L5_5.abort
    L7_7(L5_5)
    L5_5 = nil
  end
  L7_7 = L6_6.isRunning
  L7_7 = L7_7(L6_6)
  if L7_7 then
    L7_7 = L6_6.abort
    L7_7(L6_6)
    L6_6 = nil
  end
  L7_7 = waitPhase
  L7_7()
  L7_7 = Fn_pcSensorOff
  L7_7("pccubesensor2_01")
  L7_7 = Fn_pcSensorOff
  L7_7("pccubesensor2_02")
  L7_7 = Fn_naviKill
  L7_7()
  L7_7 = Fn_userCtrlAllOff
  L7_7()
  L7_7 = Fn_blackout
  L7_7(0.5)
  L7_7 = Fn_captionViewEnd
  L7_7()
  L7_7 = Fn_resetPcPos
  L7_7("locator2_pc_sdemo_pos_01")
  if L2_2 == 1 then
    L7_7 = Fn_sendEventComSb
    L7_7("requestSupportCrowSpawn", "locator2_crow_start_pos_ep09_r", Supporter.FirstAction.Ground, true)
    repeat
      L7_7 = wait
      L7_7()
      L7_7 = Fn_sendEventComSb
      L7_7 = L7_7("requestCrowSpawn")
    until L7_7
    L7_7 = Fn_sendEventComSb
    L7_7 = L7_7("requestCrowPuppet")
    puppet_crow = L7_7
    L7_7 = Fn_sendEventComSb
    L7_7 = L7_7("requestCrowBrain")
    brain_crow = L7_7
    L7_7 = _sdemo_cut01
    L7_7 = L7_7.set
    L7_7(L7_7, "locator2_cam_01", "locator2_aim_01")
    L7_7 = _sdemo_cut01
    L7_7 = L7_7.play
    L7_7(L7_7)
    L7_7 = Fn_fadein
    L7_7(0.5)
    L7_7 = Fn_sendEventComSb
    L7_7("requestsupportCrowMove", "locator2_crow_move_pos_ep09_r_02", "locator2_crow_move_pos_ep09_r_01", "20.0")
    L7_7 = Fn_captionViewWait
    L7_7("ep09_18004")
    L7_7 = Fn_captionViewWait
    L7_7("ep09_18005")
    L7_7 = _sdemo_cut01
    L7_7 = L7_7.set
    L7_7(L7_7, "locator2_cam_02", puppet_crow, true, Vector(0, 0, 0))
    L7_7 = _sdemo_cut01
    L7_7 = L7_7.play
    L7_7(L7_7)
    L7_7 = Sound
    L7_7 = L7_7.playSE
    L7_7(L7_7, "cro_222", 1, "", puppet_crow:getWorldPos())
    L7_7 = Fn_captionView
    L7_7("ep09_18006", 2)
    L7_7 = waitSeconds
    L7_7(1.5)
    L7_7 = puppet_crow
    L7_7 = L7_7.getWorldPos
    L7_7 = L7_7(L7_7)
    L7_7 = L7_7 + Vector(0, 1, 0)
    Player:setLookAtIk(true, 1, L7_7)
    waitSeconds(0.5)
    Fn_captionViewWait("ep09_18007", 2)
    Player:setLookAtIk(false, 1, L7_7)
  elseif L2_2 == 2 then
    L7_7 = Fn_sendEventComSb
    L7_7("requestSupportCrowLockToWarp", "locator2_crow_move_pos_ep09_r_03")
    L7_7 = _sdemo_cut01
    L7_7 = L7_7.set
    L7_7(L7_7, "locator2_cam_04", "locator2_aim_01")
    L7_7 = _sdemo_cut01
    L7_7 = L7_7.play
    L7_7(L7_7)
    L7_7 = Fn_fadein
    L7_7(0.5)
    L7_7 = Fn_captionViewWait
    L7_7("ep09_18004")
    L7_7 = Fn_captionViewWait
    L7_7("ep09_18005")
  end
  L7_7 = Fn_kaiwaDemoView
  L7_7("ep09_00160k")
  L7_7 = Fn_blackout
  L7_7(0.5)
  L7_7 = _sdemo_cut01
  L7_7 = L7_7.set
  L7_7(L7_7, "locator2_cam_03", "locator2_aim_03")
  L7_7 = _sdemo_cut01
  L7_7 = L7_7.setCameraParam
  L7_7(L7_7, nil, 0.1)
  L7_7 = _sdemo_cut01
  L7_7 = L7_7.play
  L7_7(L7_7)
  L7_7 = Fn_resetPcPos
  L7_7("locator2_pc_sdemo_pos_02")
  L7_7 = Fn_sendEventComSb
  L7_7("requestSupportCrowLockToWarp", "locator2_crow_move_pos_ep09_r_04")
  L7_7 = Fn_fadein
  L7_7(1)
  L7_7 = waitSeconds
  L7_7(0.5)
  L7_7 = Fn_kaiwaDemoView
  L7_7("ep09_00170k")
  L7_7 = Fn_blackout
  L7_7(0.5)
  L7_7 = Fn_sendEventComSb
  L7_7("requestsupportCrowReset")
  L7_7 = _sdemo_cut01
  L7_7 = L7_7.stop
  L7_7(L7_7, 0)
  L7_7 = Fn_setNextMissionFlag
  L7_7()
  L7_7 = Fn_nextMission
  L7_7()
  L7_7 = Fn_exitSandbox
  L7_7()
end
function Finalize()
  local L0_12, L1_13
end
