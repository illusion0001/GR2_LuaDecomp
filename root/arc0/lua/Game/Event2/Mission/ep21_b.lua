dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
_crow_puppet = nil
_next_crow = nil
hole_hdl = {}
_crow_change = false
crow_vel = 10
_distance = 0
function Initialize()
  local L0_0, L1_1
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "ep21_b"
  L0_0 = L0_0(L1_1)
  sdemo = L0_0
  L0_0 = Fn_createEffect
  L1_1 = "gravity"
  L0_0 = L0_0(L1_1, "ef_ev_dscbk_01", "pccubesensor2_nekostorm_01", true)
  gravityeff_hdl_1 = L0_0
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "pccubesensor2_nekostorm_01")
  storm_hdl_01 = L0_0
  L0_0 = Sound
  L1_1 = L0_0
  L0_0 = L0_0.playSEHandleBox
  L0_0 = L0_0(L1_1, "ep21_storm", 1, "", storm_hdl_01)
  storm_01 = L0_0
  L0_0 = Fn_loadEventData
  L1_1 = "evx/ep21_beans"
  L0_0(L1_1, "evarea2_co_a_01", true)
  L0_0 = move_area_beans
  L0_0()
  L0_0 = gravityeff_hdl_1
  L1_1 = L0_0
  L0_0 = L0_0.getLocalAabb
  L0_0 = L0_0(L1_1)
  L1_1 = print
  L1_1("\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136AABB", L0_0)
  L1_1 = gravityeff_hdl_1
  L1_1 = L1_1.setLocalAabb
  L1_1(L1_1, Aabb(Vector(0, -1000, -100), Vector(0, 1000, 0)))
  L1_1 = gravityeff_hdl_1
  L1_1 = L1_1.getLocalAabb
  L1_1 = L1_1(L1_1)
  print("\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136AABB", L1_1)
  Fn_pcSensorOff("pccubesensor2_in_01")
  Fn_pcSensorOff("pccubesensor2_out_01")
  Fn_setCatWarpCheckPoint("locator2_reset_00")
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9
  while true do
    while true do
      L0_2 = _crow_puppet
      if L0_2 == nil then
        L0_2 = Fn_sendEventComSb
        L1_3 = "crow_name"
        L0_2 = L0_2(L1_3)
        _crow_puppet = L0_2
        L0_2 = wait
        L0_2()
      end
    end
  end
  while true do
    while true do
      L0_2 = _brain_crow
      if L0_2 == nil then
        L0_2 = _crow_puppet
        L1_3 = L0_2
        L0_2 = L0_2.getBrain
        L0_2 = L0_2(L1_3)
        _brain_crow = L0_2
        L0_2 = wait
        L0_2()
      end
    end
  end
  while true do
    L0_2 = _brain_crow
    L1_3 = L0_2
    L0_2 = L0_2.isRunning
    L0_2 = L0_2(L1_3)
    if not L0_2 then
      L0_2 = wait
      L0_2()
    end
  end
  L0_2 = Fn_sendEventComSb
  L1_3 = "start_storm_00"
  L0_2(L1_3)
  L0_2 = Fn_userCtrlOn
  L0_2()
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_captionViewWait
  L1_3 = "ep21_01000"
  L0_2(L1_3)
  L0_2 = Fn_missionView
  L1_3 = "ep21_01001"
  L2_4 = 5
  L0_2(L1_3, L2_4)
  L0_2 = gravityeff_hdl_1
  L1_3 = L0_2
  L0_2 = L0_2.setLocalAabb
  L2_4 = Aabb
  L3_5 = Vector
  L4_6 = 0
  L5_7 = 0
  L6_8 = 0
  L3_5 = L3_5(L4_6, L5_7, L6_8)
  L4_6 = Vector
  L5_7 = 0
  L6_8 = 0
  L7_9 = 0
  L7_9 = L4_6(L5_7, L6_8, L7_9)
  L7_9 = L2_4(L3_5, L4_6, L5_7, L6_8, L7_9, L4_6(L5_7, L6_8, L7_9))
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L2_4(L3_5, L4_6, L5_7, L6_8, L7_9, L4_6(L5_7, L6_8, L7_9)))
  L0_2 = waitSeconds
  L1_3 = 1.3
  L0_2(L1_3)
  L0_2 = findGameObject2
  L1_3 = "Node"
  L2_4 = "pccubesensor2_navi_01"
  L0_2 = L0_2(L1_3, L2_4)
  L1_3 = Fn_naviSet
  L2_4 = L0_2
  L1_3(L2_4)
  L1_3 = gravityeff_hdl_1
  L2_4 = L1_3
  L1_3 = L1_3.try_init
  L1_3(L2_4)
  L1_3 = gravityeff_hdl_1
  L2_4 = L1_3
  L1_3 = L1_3.waitForReady
  L1_3(L2_4)
  L1_3 = gravityeff_hdl_1
  L2_4 = L1_3
  L1_3 = L1_3.try_start
  L1_3(L2_4)
  L1_3 = gravityeff_hdl_1
  L2_4 = L1_3
  L1_3 = L1_3.play
  L1_3(L2_4)
  L1_3 = gravityeff_hdl_1
  L2_4 = L1_3
  L1_3 = L1_3.setLoop
  L3_5 = true
  L1_3(L2_4, L3_5)
  L1_3 = invokeTask
  function L2_4()
    local L0_10, L1_11, L2_12, L3_13
    L0_10 = _brain_crow
    L1_11 = L0_10
    L0_10 = L0_10.isAir
    L0_10 = L0_10(L1_11)
    if L0_10 == false then
      L1_11 = _crow_puppet
      L2_12 = L1_11
      L1_11 = L1_11.getWorldPos
      L1_11 = L1_11(L2_12)
      L2_12 = Vector
      L3_13 = 0
      L2_12 = L2_12(L3_13, -5, 0)
      L2_12 = L1_11 - L2_12
      L3_13 = {
        {
          pos = L1_11,
          action = Supporter.MovePoint.Takeoff,
          vel = crow_vel
        },
        {
          pos = L1_11,
          action = Supporter.MovePoint.Air,
          vel = crow_vel
        },
        {
          pos = L2_12,
          action = Supporter.MovePoint.Air,
          vel = crow_vel
        }
      }
      _brain_crow:setMovePoints(L3_13)
      _brain_crow:startMovePoint()
    end
    repeat
      L1_11 = print
      L2_12 = Fn_get_distance
      L3_13 = _crow_puppet
      L3_13 = L3_13.getWorldPos
      L3_13 = L3_13(L3_13)
      L3_13 = L2_12(L3_13, GetPlayer():getPos())
      L1_11(L2_12, L3_13, L2_12(L3_13, GetPlayer():getPos()))
      L1_11 = wait
      L1_11()
      L1_11 = _brain_crow
      L2_12 = L1_11
      L1_11 = L1_11.isMovePointEnd
      L1_11 = L1_11(L2_12)
    until L1_11
    L1_11 = _brain_crow
    L2_12 = L1_11
    L1_11 = L1_11.clearMovePoint
    L1_11(L2_12)
    L1_11 = print
    L2_12 = "setup_end"
    L1_11(L2_12)
    L1_11 = _crow_puppet
    L2_12 = L1_11
    L1_11 = L1_11.getWorldPos
    L1_11 = L1_11(L2_12)
    L2_12 = {
      L3_13,
      {
        node = findGameObject2("Node", "locator2_crowmove_00"),
        action = Supporter.MovePoint.Air,
        vel = crow_vel
      }
    }
    L3_13 = {}
    L3_13.pos = L1_11
    L3_13.action = Supporter.MovePoint.Air
    L3_13.vel = crow_vel
    L3_13 = _crow_puppet
    L3_13 = L3_13.getWorldPos
    L3_13 = L3_13(L3_13)
    repeat
      wait()
    until _brain_crow:isMovePointEnd()
    _brain_crow:setMovePoints(L2_12)
    _brain_crow:startMovePoint()
    repeat
      wait()
    until _brain_crow:isMovePointEnd()
    _brain_crow:clearMovePoint()
    crow_speed_adjust()
    crow_fastmove("locator2_crowmove_00_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\144\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_00_3")
    print("\227\130\175\227\131\173\227\130\166\239\188\145\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_00_4")
    print("\227\130\175\227\131\173\227\130\166\239\188\146\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_01")
    print("\227\130\175\227\131\173\227\130\166\239\188\147\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_01_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\148\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_02")
    print("\227\130\175\227\131\173\227\130\166\239\188\149\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_02_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\150\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_03")
    print("\227\130\175\227\131\173\227\130\166\239\188\151\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_03_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\152\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_04")
    print("\227\130\175\227\131\173\227\130\166\239\188\153\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_04_2")
    print("\227\130\175\227\131\173\227\130\16610\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    _brain_crow:setFollowPoint(false, nil, 0)
    crow_speed_adjust_off()
  end
  L1_3 = L1_3(L2_4)
  crow_advance = L1_3
  L1_3 = invokeTask
  function L2_4()
    repeat
      wait()
    until _distance > 110
    if crow_advance ~= nil then
      crow_advance:abort()
      crow_advance = nil
    end
    _brain_crow:setFollowPoint(false, nil, 0)
    _brain_crow:clearMovePoint()
    crow_speed_adjust_off()
    print("\227\130\175\227\131\173\227\130\166\229\133\136\232\161\140\227\130\173\227\131\163\227\131\179\227\130\187\227\131\171")
  end
  L1_3(L2_4)
  L1_3 = waitPhace
  L1_3()
  L1_3 = Fn_kaiwaDemoView
  L2_4 = "ep21_00320k"
  L1_3(L2_4)
  L1_3 = waitPhace
  L1_3()
  L1_3 = Fn_setCatWarpCheckPoint
  L2_4 = "locator2_reset_01"
  L1_3(L2_4)
  L1_3 = HUD
  L2_4 = L1_3
  L1_3 = L1_3.sightMarkerSetDisable
  L3_5 = true
  L1_3(L2_4, L3_5)
  L1_3 = Fn_userCtrlOff
  L1_3()
  L1_3 = {L2_4}
  L2_4 = {}
  L2_4.pos = "locator2_reset_01"
  L2_4.time = 5
  L2_4 = {L3_5}
  L3_5 = {}
  L3_5.pos = "locator2_aim_01"
  L3_5.time = 0
  L3_5 = sdemo
  L4_6 = L3_5
  L3_5 = L3_5.set
  L5_7 = "locator2_cam_01"
  L6_8 = "locator2_aim_01"
  L7_9 = false
  L3_5(L4_6, L5_7, L6_8, L7_9)
  L3_5 = sdemo
  L4_6 = L3_5
  L3_5 = L3_5.play
  L5_7 = L1_3
  L6_8 = L2_4
  L3_5(L4_6, L5_7, L6_8)
  L3_5 = findGameObject2
  L4_6 = "Node"
  L5_7 = "locator2_reset_02"
  L3_5 = L3_5(L4_6, L5_7)
  L4_6 = L3_5
  L3_5 = L3_5.getWorldTransform
  L4_6 = L3_5(L4_6)
  L5_7 = Fn_setPcPosRot
  L6_8 = L3_5
  L7_9 = L4_6
  L5_7(L6_8, L7_9, Player.kReset_Floating)
  L5_7 = waitSeconds
  L6_8 = 1.5
  L5_7(L6_8)
  L5_7 = Fn_captionViewWait
  L6_8 = "ep21_01003"
  L5_7(L6_8)
  L5_7 = {L6_8}
  L6_8 = {}
  L6_8.pos = "locator2_reset_01"
  L6_8.time = 0
  L6_8 = {L7_9}
  L7_9 = {}
  L7_9.pos = "locator2_navi_01"
  L7_9.time = 1
  L7_9 = sdemo
  L7_9 = L7_9.set
  L7_9(L7_9, "locator2_reset_01", "locator2_aim_01", false)
  L7_9 = sdemo
  L7_9 = L7_9.play
  L7_9(L7_9, L5_7, L6_8)
  L7_9 = waitSeconds
  L7_9(1)
  L7_9 = Fn_captionViewWait
  L7_9("ep21_01002")
  L7_9 = findGameObject2
  L7_9 = L7_9("Node", "locator2_navi_01")
  Fn_naviSet(L7_9)
  HUD:sightMarkerSetDisable(false)
  Fn_userCtrlOn()
  sdemo:stop(2)
  repeat
    wait()
  until Fn_getDistanceToPlayer(L7_9) < 10
  Fn_naviKill()
  waitPhace()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_14, L1_15
end
function pccubesensor2_navi_01_OnEnter(A0_16)
  local L1_17
  L1_17 = A0_16.setActive
  L1_17(A0_16, false)
  L1_17 = Fn_naviKill
  L1_17()
  L1_17 = findGameObject2
  L1_17 = L1_17("Node", "pccubesensor2_nekostorm_01")
  Fn_naviSet(L1_17)
end
function pccubesensor2_demo_01_OnEnter(A0_18)
  A0_18:setActive(false)
  _next_phase = true
end
function pccubesensor2_storm_01_OnEnter(A0_19)
  A0_19:setActive(false)
  _next_phase = true
  Fn_naviKill()
end
function pccubesensor2_btoc_01_OnEnter(A0_20)
  A0_20:setActive(false)
  _next_phase = true
end
function pccubesensor2_nekostorm_01_OnEnter(A0_21)
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_reset_01")
    Fn_catWarp()
    Player:setGravityControlMode(true)
  end)
end
function pccubesensor2_in_01_OnEnter(A0_22)
  print("\227\131\170\227\130\187\227\131\131\227\131\136\228\189\141\231\189\174\229\164\137\230\155\180\227\129\170\227\129\151")
  if gravityeff_hdl_0 ~= nil then
    gravityeff_hdl_0:setVisible(false)
  end
  print("\230\159\177\227\129\171\229\133\165\227\129\163\227\129\159\227\129\147\227\129\168\227\129\171\227\129\170\227\129\163\227\129\166\227\129\132\227\129\190\227\129\153")
end
function pccubesensor2_out_01_OnEnter(A0_23)
  Fn_setCatWarpCheckPoint("locator2_reset_00")
  print("\230\159\177\227\129\139\227\130\137\229\135\186\227\129\159\227\129\147\227\129\168\227\129\171\227\129\170\227\129\163\227\129\166\227\129\132\227\129\190\227\129\153")
end
function pccubesensor2_reset_02_OnEnter()
  invokeTask(function()
    Fn_catWarpIn()
    Fn_resetPcPos("locator2_pc_start_pos")
    Fn_catWarpOut()
  end)
end
function navi_on()
  local L0_24, L1_25
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
