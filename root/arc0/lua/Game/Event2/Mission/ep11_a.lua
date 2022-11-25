dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep11_common.lua")
_crow = {}
_kit_arrived = false
_currentMissionText = ""
function Initialize()
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_sendEventComSb
  L1_1 = "setPcSensor"
  L2_2 = "pccubesensor2_safty_area"
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.makeSituationPanic
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = emergency_catwarp_start
  L0_0 = L0_0()
  L1_1 = Fn_setCatWarp
  L2_2 = false
  L1_1(L2_2)
  L1_1 = Fn_setCatWarpCheckPoint
  L2_2 = "locator2_pc_start_pos"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_warning_01"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_outrange_01"
  L1_1(L2_2)
  L1_1 = Fn_sendEventComSb
  L2_2 = "getCrowHandle"
  L1_1 = L1_1(L2_2)
  L2_2 = typedef_CrowClass
  L2_2 = L2_2.new
  L3_3 = L1_1
  L2_2 = L2_2(L3_3)
  _crow = L2_2
  L2_2 = waitSkyStable
  L2_2()
  L2_2 = Fn_sendEventComSb
  L3_3 = "setGemActive"
  L4_4 = true
  L5_5 = "energy_a"
  L2_2(L3_3, L4_4, L5_5, 1, 2)
  L2_2 = findGameObject2
  L3_3 = "Node"
  L4_4 = "locator2_go_a_root"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = Fn_createEffect
  L4_4 = "ef_ev_blddwn_01"
  L5_5 = "ef_ev_blddwn_01"
  L3_3 = L3_3(L4_4, L5_5, L2_2:getWorldPos(), false)
  L4_4 = Sound
  L5_5 = L4_4
  L4_4 = L4_4.playSE
  L4_4(L5_5, "ep11_rubble_fall", 1, "", L2_2)
  L4_4 = Fn_findAreaHandle
  L5_5 = "up_a_02_01"
  L4_4 = L4_4(L5_5)
  L5_5 = L4_4
  L4_4 = L4_4.setExpandedAabb
  L4_4(L5_5, true)
  L4_4 = Fn_missionStart
  L4_4()
  L4_4 = findGameObject2
  L5_5 = "Node"
  L4_4 = L4_4(L5_5, "locator2_navi_01")
  L5_5 = lookAtObject
  L5_5(L4_4, _LOOKTO_RESET_DURATION, _LOOKTO_DISABLESTICK_DURATION)
  L5_5 = Fn_kaiwaDemoView
  L5_5("ep11_00210k")
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = invokeTask
  L5_5(crowMove)
  L5_5 = Fn_sendEventComSb
  L5_5("startGmScream")
  L5_5 = Fn_missionView
  L5_5("ep11_09001")
  _currentMissionText = "ep11_09001"
  L5_5 = waitSeconds
  L5_5(_MARKER_WAIT_AFTER_MISSION_VIEW)
  L5_5 = Fn_naviSet
  L5_5(L4_4)
  L5_5 = Fn_sendEventComSb
  L5_5("requestGmAction", "move", "locator2_boss_path_a2_01")
  repeat
    L5_5 = wait
    L5_5()
    L5_5 = Fn_getDistanceToPlayer
    L5_5 = L5_5(L4_4)
  until L5_5 < 600
  L5_5 = Fn_captionView
  L5_5("ep11_09026")
  L5_5 = 50
  createGem(getNearPos(L4_4, L5_5), _GEM.ENERGY)
  repeat
    wait()
  until Fn_getDistanceToPlayer(L4_4) < 400
  Fn_captionView("ep11_09002")
  Fn_sendEventComSb("requestGmAction", "move", "locator2_boss_path_a2_02")
  createGem(getNearPos(L4_4, L5_5), _GEM.ENERGY)
  repeat
    wait()
  until Fn_getDistanceToPlayer(L4_4) < 300
  Fn_captionView("ep11_09003")
  Fn_setCatWarpCheckPoint("locator2_ep11_a_cp_01")
  createGem(getNearPos(L4_4, L5_5), _GEM.ENERGY)
  repeat
    wait()
  until Fn_getDistanceToPlayer(L4_4) < 200
  Fn_captionView("ep11_09004")
  createGem(getNearPos(L4_4, L5_5), _GEM.ENERGY)
  repeat
    wait()
  until 2 > Fn_getDistanceToPlayer(L4_4)
  Fn_sendEventComSb("requestGmAction", "move", "locator2_boss_start_ep11_a2")
  Fn_naviKill()
  Player:setStay(true)
  Fn_userCtrlOff()
  Fn_coercionGravityRevert()
  Player:muteVoice(Player.kVoiceMuteLv_All)
  invokeTask(function()
    local L0_6
    L0_6 = playerTurn
    L0_6(findGameObject2("Node", "locator2_crow_path_10"))
  end)
  lookAtObject(findGameObject2("Node", "locator2_look_at_house_01"), 3, 3)
  Fn_kaiwaDemoView("ep11_00220k")
  Player:setStay(false)
  Fn_userCtrlOn()
  if L0_0 then
    L0_0:abort()
  end
  Fn_sendEventComSb("stopGmScream")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_crow_01_OnEnter(A0_7)
  Fn_pcSensorOff(A0_7)
  _kit_arrived = true
end
function crowMove()
  local L0_8, L1_9, L2_10, L3_11
  L0_8 = _crow
  L0_8 = L0_8.setIdling
  L1_9 = false
  L0_8(L1_9)
  L0_8 = _crow
  L0_8 = L0_8.clearMovePoint
  L0_8()
  L0_8 = {
    L1_9,
    L2_10,
    L3_11,
    {
      node_pos = findGameObject2("Node", "locator2_crow_path_02"),
      action = Supporter.MovePoint.Air,
      vel = 25
    },
    {
      node_pos = findGameObject2("Node", "locator2_crow_path_02"),
      action = Supporter.MovePoint.Idle,
      vel = 0
    }
  }
  L1_9 = {}
  L2_10 = findGameObject2
  L3_11 = "Node"
  L2_10 = L2_10(L3_11, "locator2_crow_path_00")
  L1_9.node_pos = L2_10
  L2_10 = Supporter
  L2_10 = L2_10.MovePoint
  L2_10 = L2_10.Takeoff
  L1_9.action = L2_10
  L1_9.vel = 10
  L2_10 = {}
  L3_11 = findGameObject2
  L3_11 = L3_11("Node", "locator2_crow_path_00")
  L2_10.node_pos = L3_11
  L3_11 = Supporter
  L3_11 = L3_11.MovePoint
  L3_11 = L3_11.Air
  L2_10.action = L3_11
  L2_10.vel = 10
  L3_11 = {}
  L3_11.node_pos = findGameObject2("Node", "locator2_crow_path_01")
  L3_11.action = Supporter.MovePoint.Air
  L3_11.vel = 25
  L1_9 = _crow
  L1_9 = L1_9.setMovePoints
  L2_10 = L0_8
  L1_9(L2_10)
  L1_9 = _crow
  L1_9 = L1_9.startMove
  L1_9()
  L1_9 = print
  L2_10 = "CROW\231\167\187\229\139\149\233\150\139\229\167\1391"
  L1_9(L2_10)
  repeat
    L1_9 = wait
    L1_9()
    L1_9 = _crow
    L1_9 = L1_9.isMoveEnd
    L1_9 = L1_9()
  until L1_9
  L1_9 = {}
  L2_10 = findGameObject2
  L3_11 = "Node"
  L2_10 = L2_10(L3_11, "locator2_crow_path_07")
  L1_9.node_posrot = L2_10
  L1_9.forced = true
  L1_9.end_idling = false
  L2_10 = _crow
  L2_10 = L2_10.startWarpAction
  L3_11 = L1_9
  L2_10 = L2_10(L3_11)
  L3_11 = _crow
  L3_11 = L3_11.setIdling
  L3_11(true)
  repeat
    L3_11 = wait
    L3_11()
    L3_11 = _kit_arrived
  until L3_11
  L3_11 = _crow
  L3_11 = L3_11.warpToNode
  L3_11("locator2_crow_path_07", Supporter.FirstAction.Ground)
  L3_11 = _crow
  L3_11 = L3_11.setIdling
  L3_11(false)
  L3_11 = _crow
  L3_11 = L3_11.clearMovePoint
  L3_11()
  L3_11 = {
    {
      node_pos = findGameObject2("Node", "locator2_crow_path_08"),
      action = Supporter.MovePoint.Ground,
      vel = 1
    },
    {
      node_pos = findGameObject2("Node", "locator2_crow_path_09"),
      action = Supporter.MovePoint.Ground,
      vel = 1
    },
    {
      node_pos = findGameObject2("Node", "locator2_crow_path_10"),
      action = Supporter.MovePoint.Ground,
      vel = 1
    },
    {
      node_pos = findGameObject2("Node", "locator2_crow_path_10"),
      action = Supporter.MovePoint.Idle,
      vel = 0
    }
  }
  _crow.setMovePoints(L3_11)
  _crow.startMove()
  print("CROW\231\167\187\229\139\149\233\150\139\229\167\1392")
  repeat
    wait()
  until _crow.isMoveEnd()
  print("CROW\231\167\187\229\139\149\229\174\140\228\186\134")
end
function pccubesensor2_warning_OnEnter(A0_12)
  local L1_13
end
function pccubesensor2_warning_OnLeave(A0_14)
  invokeTask(function()
    Fn_captionViewWait("ep11_09027")
  end)
end
function pccubesensor2_outrange_OnEnter(A0_15)
  local L1_16
end
function pccubesensor2_outrange_OnLeave(A0_17)
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep11_09027")
    Fn_missionView(_currentMissionText)
  end)
end
