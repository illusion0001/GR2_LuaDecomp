dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
_crow_puppet = nil
_next_crow = nil
_crow_advance = nil
_distance = 0
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_sendEventComSb
  L1_1 = "stop_stormse_01"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "stop_stormse_02"
  L0_0(L1_1)
  L0_0 = Fn_createEffect
  L1_1 = "gravity"
  L2_2 = "ef_ev_dscbk_01"
  L0_0 = L0_0(L1_1, L2_2, "pccubesensor2_nekostorm_03", true)
  L2_2 = L0_0
  L1_1 = L0_0.getLocalAabb
  L1_1 = L1_1(L2_2)
  L2_2 = print
  L2_2("\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136AABB", L1_1)
  L2_2 = L0_0.setLocalAabb
  L2_2(L0_0, Aabb(Vector(0, -1000, -100), Vector(0, 1000, 0)))
  L2_2 = L0_0.getLocalAabb
  L2_2 = L2_2(L0_0)
  print("\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136AABB", L2_2)
end
function Ingame()
  local L0_3, L1_4
  L0_3 = Fn_loadEventData
  L1_4 = "evx/ep21_beans"
  L0_3(L1_4, "evarea2_co_a_01", true)
  L0_3 = move_area_beans
  L0_3()
  while true do
    while true do
      L0_3 = _crow_puppet
      if L0_3 == nil then
        L0_3 = Fn_sendEventComSb
        L1_4 = "crow_name"
        L0_3 = L0_3(L1_4)
        _crow_puppet = L0_3
        L0_3 = wait
        L0_3()
      end
    end
  end
  while true do
    while true do
      L0_3 = _brain_crow
      if L0_3 == nil then
        L0_3 = _crow_puppet
        L1_4 = L0_3
        L0_3 = L0_3.getBrain
        L0_3 = L0_3(L1_4)
        _brain_crow = L0_3
        L0_3 = wait
        L0_3()
      end
    end
  end
  while true do
    L0_3 = _brain_crow
    L1_4 = L0_3
    L0_3 = L0_3.isRunning
    L0_3 = L0_3(L1_4)
    if not L0_3 then
      L0_3 = wait
      L0_3()
    end
  end
  L0_3 = _brain_crow
  L1_4 = L0_3
  L0_3 = L0_3.setIdling
  L0_3(L1_4, false)
  L0_3 = GravPowConsumDown
  L0_3()
  L0_3 = Fn_setCatWarpCheckPoint
  L1_4 = "locator2_reset_03"
  L0_3(L1_4)
  L0_3 = Fn_userCtrlOn
  L0_3()
  L0_3 = Fn_missionStart
  L0_3()
  L0_3 = Fn_missionView
  L1_4 = "ep21_05000"
  L0_3(L1_4, 5)
  L0_3 = waitSeconds
  L1_4 = 2.6
  L0_3(L1_4)
  L0_3 = findGameObject2
  L1_4 = "Node"
  L0_3 = L0_3(L1_4, "pccubesensor2_06")
  L1_4 = Fn_naviSet
  L1_4(L0_3)
  L1_4 = waitPhace
  L1_4()
  L1_4 = Fn_naviKill
  L1_4()
  L1_4 = Fn_captionViewWait
  L1_4("ep21_05001")
  L1_4 = findGameObject2
  L1_4 = L1_4("Node", "locator2_navi_04")
  repeat
    wait()
  until Fn_getDistanceToPlayer(L1_4) < 120
  Fn_captionViewWait("ep21_05002")
  Fn_lookAtObject("locator2_navi_04"):abort()
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_navi_06"))
  waitPhace()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_5, L1_6
end
function pccubesensor2_06_OnEnter(A0_7)
  local L1_8
  L1_8 = A0_7.setActive
  L1_8(A0_7, false)
  L1_8 = Fn_naviKill
  L1_8()
  L1_8 = findGameObject2
  L1_8 = L1_8("Node", "pccubesensor2_nekostorm_03")
  Fn_naviSet(L1_8)
end
function pccubesensor2_storm_03_OnEnter(A0_9)
  A0_9:setActive(false)
  _next_phase = true
end
function pccubesensor2_02_OnEnter(A0_10)
  A0_10:setActive(false)
  _next_phase = true
end
function pccubesensor2_navi_06_OnEnter(A0_11)
  A0_11:setActive(false)
  Fn_naviKill()
end
function navi_on()
  local L0_12, L1_13
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pccubesensor2_nekostorm_03_OnEnter(A0_14)
  invokeTask(function()
    Fn_catWarp()
    Player:setGravityControlMode(true)
  end)
end
function cubesensor2_06_OnEnter(A0_15)
  A0_15:setActive(false)
  if _crow_advance == nil then
    _crow_advance = invokeTask(function()
      crow_speed_adjust()
      crow_fastmove("locator2_crowmove_13")
      print("\227\130\175\227\131\173\227\130\166\239\188\145\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
      crow_fastmove("locator2_crowmove_14")
      print("\227\130\175\227\131\173\227\130\166\239\188\146\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
      crow_fastmove("locator2_crowmove_17")
      print("\227\130\175\227\131\173\227\130\166\239\188\147\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
      crow_fastmove("locator2_crowmove_18")
      print("\227\130\175\227\131\173\227\130\166\239\188\148\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
      crow_fastmove("locator2_crowmove_19")
      print("\227\130\175\227\131\173\227\130\166\239\188\149\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
      crow_fastmove("locator2_crowmove_20")
      print("\227\130\175\227\131\173\227\130\166\239\188\150\227\129\164\231\155\174\227\130\146\231\155\174\230\140\135\227\129\153")
      _brain_crow:setFollowPoint(false, nil, 0)
      crow_speed_adjust_off()
      print("\227\130\175\227\131\173\227\130\166\229\133\136\232\161\140\231\181\130\228\186\134")
    end)
  end
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
