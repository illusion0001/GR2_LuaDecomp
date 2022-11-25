dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
_crow_puppet = nil
_next_crow = nil
_distance = 0
function Initialize()
  sdemo = SDemo.create("ep21_d")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_getPlayer
  L0_0 = L0_0()
  L1_1 = Fn_sendEventComSb
  L2_2 = "stop_stormse_01"
  L1_1(L2_2)
  L1_1 = Fn_loadEventData
  L2_2 = "evx/ep21_beans"
  L3_3 = "evarea2_co_a_01"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = move_area_beans
  L1_1()
  L1_1 = GravPowConsumDown
  L1_1()
  L1_1 = Fn_setCatWarpCheckPoint
  L2_2 = "locator2_reset_02"
  L1_1(L2_2)
  while true do
    while true do
      L1_1 = _crow_puppet
      if L1_1 == nil then
        L1_1 = Fn_sendEventComSb
        L2_2 = "crow_name"
        L1_1 = L1_1(L2_2)
        _crow_puppet = L1_1
        L1_1 = wait
        L1_1()
      end
    end
  end
  while true do
    while true do
      L1_1 = _brain_crow
      if L1_1 == nil then
        L1_1 = _crow_puppet
        L2_2 = L1_1
        L1_1 = L1_1.getBrain
        L1_1 = L1_1(L2_2)
        _brain_crow = L1_1
        L1_1 = wait
        L1_1()
      end
    end
  end
  while true do
    L1_1 = _brain_crow
    L2_2 = L1_1
    L1_1 = L1_1.isRunning
    L1_1 = L1_1(L2_2)
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = _brain_crow
  L2_2 = L1_1
  L1_1 = L1_1.setIdling
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = Fn_missionView
  L2_2 = "ep21_03000"
  L3_3 = 5
  L1_1(L2_2, L3_3)
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_navi_01"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = Fn_naviSet
  L3_3 = L1_1
  L2_2(L3_3)
  repeat
    L2_2 = wait
    L2_2()
    L2_2 = Fn_getDistanceToPlayer
    L3_3 = L1_1
    L2_2 = L2_2(L3_3)
  until L2_2 < 10
  L2_2 = Fn_naviKill
  L2_2()
  L2_2 = waitSeconds
  L3_3 = 1
  L2_2(L3_3)
  L2_2 = HUD
  L3_3 = L2_2
  L2_2 = L2_2.sightMarkerSetDisable
  L4_4 = true
  L2_2(L3_3, L4_4)
  L2_2 = Player
  L3_3 = L2_2
  L2_2 = L2_2.setStay
  L4_4 = true
  L2_2(L3_3, L4_4)
  L2_2 = Fn_userCtrlOff
  L2_2()
  L2_2 = {L3_3}
  L3_3 = {}
  L3_3.pos = "locator2_reset_01"
  L3_3.time = 5
  L3_3 = {L4_4}
  L4_4 = {}
  L4_4.pos = "locator2_aim_01"
  L4_4.time = 0
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.set
  L4_4(L5_5, "locator2_cam_01", "locator2_aim_01", false)
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.play
  L4_4(L5_5, L2_2, L3_3)
  L4_4 = waitSeconds
  L5_5 = 1
  L4_4(L5_5)
  L4_4 = Fn_captionViewWait
  L5_5 = "ep21_03001"
  L4_4(L5_5)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.sightMarkerSetDisable
  L4_4(L5_5, false)
  L4_4 = Player
  L5_5 = L4_4
  L4_4 = L4_4.setStay
  L4_4(L5_5, false)
  L4_4 = Fn_userCtrlOn
  L4_4()
  L4_4 = sdemo
  L5_5 = L4_4
  L4_4 = L4_4.stop
  L4_4(L5_5, 2)
  L4_4 = findGameObject2
  L5_5 = "Node"
  L4_4 = L4_4(L5_5, "pccubesensor2_nekostorm_02")
  L5_5 = Fn_naviSet
  L5_5(L4_4)
  L5_5 = waitPhace
  L5_5()
  L5_5 = crow_serif
  if L5_5 ~= nil then
    L5_5 = crow_serif
    L5_5 = L5_5.abort
    L5_5(L5_5)
    crow_serif = nil
  end
  L5_5 = Fn_createEffect
  L5_5 = L5_5("gravity", "ef_ev_dscbk_01", "pccubesensor2_nekostorm_02", true)
  L5_5:setAlpha(0)
  invokeTask(function()
    local L0_6, L1_7, L2_8
    for _FORV_3_ = 0, 600 do
      L5_5:setAlpha(_FORV_3_ / 600)
      print("\227\129\136\227\129\181\227\129\135\227\129\143\227\129\168\227\129\160\227\129\151")
      wait()
    end
  end)
  Fn_sendEventComSb("start_storm_02")
  Fn_naviKill()
  Fn_captionViewWait("ep21_03002")
  Fn_lookAtObject("locator2_cam_03"):abort()
  if Fn_get_distance(findGameObject2("Node", "locator2_navi_03"):getWorldPos(), L0_0:getWorldPos()) >= 120 then
    Fn_captionViewWait("ep21_03003")
  end
  repeat
    wait()
  until Fn_get_distance(findGameObject2("Node", "locator2_navi_03"):getWorldPos(), L0_0:getWorldPos()) < 120
  Fn_captionViewWait("ep21_03004")
  Fn_lookAtObject("locator2_navi_03"):abort()
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_navi_05"))
  waitPhace()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10
end
function pccubesensor2_storm_02_OnEnter(A0_11)
  A0_11:setActive(false)
  _next_phase = true
end
function pccubesensor2_dtoe_01_OnEnter(A0_12)
  A0_12:setActive(false)
  _next_phase = true
end
function pccubesensor2_nekostorm_02_OnEnter(A0_13)
  invokeTask(function()
    Fn_catWarp()
    Player:setGravityControlMode(true)
  end)
end
function pccubesensor2_navi_05_OnEnter(A0_14)
  A0_14:setActive(false)
  Fn_naviKill()
end
function navi_on()
  local L0_15, L1_16
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function cubesensor2_05_OnEnter(A0_17)
  A0_17:setActive(false)
  crow_advance = invokeTask(function()
    crow_speed_adjust()
    crow_fastmove("locator2_crowmove_05")
    print("\227\130\175\227\131\173\227\130\166\239\188\145\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_05_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\146\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_06")
    print("\227\130\175\227\131\173\227\130\166\239\188\147\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_07")
    print("\227\130\175\227\131\173\227\130\166\239\188\148\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_07_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\149\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_08")
    print("\227\130\175\227\131\173\227\130\166\239\188\150\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_09")
    print("\227\130\175\227\131\173\227\130\166\239\188\151\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_09_2")
    print("\227\130\175\227\131\173\227\130\166\239\188\152\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_10")
    print("\227\130\175\227\131\173\227\130\166\239\188\153\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_10_2")
    print("\227\130\175\227\131\173\227\130\16610\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    crow_fastmove("locator2_crowmove_11")
    print("\227\130\175\227\131\173\227\130\16611\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
    _brain_crow:setFollowPoint(false, nil, 0)
    crow_speed_adjust_off()
  end)
  invokeTask(function()
    repeat
      print(_distance)
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
  end)
end
