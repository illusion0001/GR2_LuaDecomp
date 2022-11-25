import("Mob")
import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
dofile("/Game/Misc/fatal_marker.lua")
_sdemo = nil
_ash_cnt = 0
_boss_move = false
_boss_callback = false
enmgen2_boss = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_boss",
      name = "boss_ship"
    },
    {
      type = "mechbig_eee",
      locator = "locator_boss",
      name = "boss",
      target_vehicle = "boss_ship",
      ai_spawn_option = "MechBig/mechbig_boss"
    }
  }
}
function Initialize()
  Fn_userCtrlOff()
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  _sdemo = SDemo.create("ep80_g")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_start_pos"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestKillCrateEvent"
  L0_0(L1_1)
  L0_0 = Vehicle
  L1_1 = L0_0
  L0_0 = L0_0.SetPanic
  L2_2 = true
  L3_3 = findGameObject2
  L4_4 = "Node"
  L5_5 = "locator2_vehicle_panic"
  L3_3 = L3_3(L4_4, L5_5)
  L4_4 = L3_3
  L3_3 = L3_3.getWorldPos
  L7_7 = L3_3(L4_4)
  L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L3_3(L4_4))
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestCreateGem"
  L0_0(L1_1)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6 = nil, nil, nil, nil, nil, nil, nil
  function L7_7()
    local L0_8, L1_9
    L0_8 = Area
    L1_9 = L0_8
    L0_8 = L0_8.requestRestore
    L0_8(L1_9)
    L0_8 = wait
    L0_8()
    L0_8 = Mob
    L1_9 = L0_8
    L0_8 = L0_8.makeSituationPanic
    L0_8(L1_9, false)
    L0_8 = Mob
    L1_9 = L0_8
    L0_8 = L0_8.topUpHatchery
    L0_8(L1_9)
    L0_8 = waitSeconds
    L1_9 = 2
    L0_8(L1_9)
    L0_8 = Fn_spawnSuppotCrow
    L1_9 = nil
    L0_8 = L0_8(L1_9, Supporter.FirstAction.Ground, "locator2_crow01_01")
    L5_5 = L0_8
    L0_8 = L5_5
    L1_9 = L0_8
    L0_8 = L0_8.getBrain
    L0_8 = L0_8(L1_9)
    L6_6 = L0_8
    L0_8 = L6_6
    L1_9 = L0_8
    L0_8 = L0_8.setIdling
    L0_8(L1_9, true)
    L0_8 = findGameObject2
    L1_9 = "EnemyGenerator"
    L0_8 = L0_8(L1_9, "enmgen2_boss")
    L0_0 = L0_8
    L0_8 = L0_0
    L1_9 = L0_8
    L0_8 = L0_8.requestSpawn
    L0_8(L1_9)
    while true do
      L0_8 = L0_0
      L1_9 = L0_8
      L0_8 = L0_8.isSpawnOnStartFinished
      L0_8 = L0_8(L1_9)
      if L0_8 == false then
        L0_8 = wait
        L0_8()
      end
    end
    L0_8 = L0_0
    L1_9 = L0_8
    L0_8 = L0_8.setEnemyMarker
    L0_8(L1_9, false)
    L0_8 = Fn_setKittenAndCatActive
    L1_9 = false
    L0_8(L1_9)
    L0_8 = Fn_resetPcPos
    L1_9 = "warppoint2_01"
    L0_8(L1_9)
    L0_8 = findGameObject2
    L1_9 = "Puppet"
    L0_8 = L0_8(L1_9, "boss")
    L1_1 = L0_8
    L0_8 = L1_1
    L1_9 = L0_8
    L0_8 = L0_8.getBrain
    L0_8 = L0_8(L1_9)
    L2_2 = L0_8
    L0_8 = L2_2
    L1_9 = L0_8
    L0_8 = L0_8.setVisibleBossMarker
    L0_8(L1_9, true)
    L0_8 = L2_2
    L1_9 = L0_8
    L0_8 = L0_8.setEnableTarget
    L0_8(L1_9, false)
    L0_8 = findGameObject2
    L1_9 = "Puppet"
    L0_8 = L0_8(L1_9, "boss_ship")
    L3_3 = L0_8
    L0_8 = L3_3
    L1_9 = L0_8
    L0_8 = L0_8.getBrain
    L0_8 = L0_8(L1_9)
    L4_4 = L0_8
    L0_8 = {L1_9}
    L1_9 = "locator2_drop_01"
    L1_9 = {
      "locator2_back_01",
      "locator2_back_02",
      "locator2_back_03"
    }
    L4_4:setEventListener("enemy_landingship_event", get_ship_func("drop", L0_8, L1_9, L3_3))
    while not _boss_callback do
      wait()
    end
    _sdemo:set("locator2_cut01_cam01", L1_1, kSDEMO_APPEND_AIM)
    _sdemo:offset(nil, Vector(0, 3, 0))
    _sdemo.camera:switchCamera(true, 0.01)
    wait(5)
  end
  Fn_kaiwaDemoView2("ep80_00180k", L7_7, true)
  wait(2)
  _boss_move = true
  _sdemo:play({
    {
      time = 3,
      pos = "locator2_cut01_cam02"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  _sdemo:set("locator2_cut02_cam01", L1_1, kSDEMO_APPEND_AIM)
  _sdemo:offset(nil, Vector(0, 3, 0))
  _sdemo:switchCamera(true, 0)
  Mob:makeSituationPanic(true)
  waitSeconds(2)
  _sdemo:play({
    {
      time = 5,
      pos = "locator2_cut02_cam02"
    }
  })
  repeat
    wait()
  until L2_2:isReadyEnemy()
  repeat
    wait()
  until L2_2:cmd("isLandEnd")
  Fn_resetPcPos("locator2_pc_start_pos")
  Fn_setKittenAndCatActive(true)
  Camera:lookTo(findGameObject2("Node", "locator2_cut02_cam02"):getWorldPos(), 0, 0)
  invokeTask(function()
    L2_2:cmd("laser", {
      target = "locator2_boss_laser",
      isSwing = true,
      time = 2
    })
    repeat
      wait()
    until L2_2:cmd("isLaserEnd")
    L2_2:setEnableTarget(true)
    L0_0:setEnemyMarker(true)
    L4_4:setVisibleEnemyMarker(false)
  end)
  while _sdemo:isPlay() do
    wait()
  end
  _sdemo:stop(1)
  FatalMarker.create(kFATAL_TYPE_ACT, L5_5, true):set(L1_1, "bn_c03_neck", true)
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  Fn_pcSensorOn("pccubesensor2_battle_outrange")
  Fn_userCtrlOn()
  L6_6:setIdling(false)
  Fn_missionView("ep80_00043")
  crow_hint(L2_2)
  FatalMarker.create(kFATAL_TYPE_ACT, L5_5, true):run()
  repeat
    wait()
  until FatalMarker.create(kFATAL_TYPE_ACT, L5_5, true):isFatalFinish()
  FatalMarker.create(kFATAL_TYPE_ACT, L5_5, true):kill()
  Fn_pcSensorOff("pccubesensor2_battle_navi_in")
  Fn_pcSensorOff("pccubesensor2_battle_navi_out")
  Fn_pcSensorOff("pccubesensor2_battle_outrange")
  HUD:whiteout(1)
  waitSeconds(1.5)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function get_ship_func(A0_10, A1_11, A2_12, A3_13)
  local L4_14
  function L4_14(A0_15)
    _boss_callback = true
    A0_15.dropEnemy = {"boss"}
    if A0_15.state == "wait" and _boss_move then
      if A0_10 == "drop" then
        A0_15.changeState = "move"
        A0_15.movePoint = A1_11
      elseif A0_10 == "land_back" then
        A0_15.changeState = "move"
        A0_15.movePoint = A2_12
        A0_10 = "empty"
      end
    end
    if A0_15.state == "moveEnd" then
      if A0_10 == "drop" then
        A0_15.changeState = "drop"
      elseif A0_10 == "empty" then
        Fn_setAlpha(A3_13, false)
      end
    end
    if A0_15.state == "dropEnd" then
      A0_10 = "land_back"
    end
    return A0_15
  end
  return L4_14
end
function crow_hint(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L1_17 = false
  L2_18 = -1
  L4_20 = A0_16
  L3_19 = A0_16.getHealth
  L3_19 = L3_19(L4_20)
  function L4_20(A0_21)
    local L1_22
    L1_22 = A0_21.isOpen
    if L1_22 == true then
      L1_22 = true
      L1_17 = L1_22
    else
      L1_22 = false
      L1_17 = L1_22
    end
    L1_22 = A0_21.rest
    L2_18 = L1_22
    return A0_21
  end
  A0_16:setEventListener("enemy_mechbig_event", L4_20)
  invokeTask(function()
    while L2_18 == -1 do
      wait()
    end
    while L1_17 == false do
      if 120 <= 0 then
        if false == false then
          Fn_captionViewWait("ep80_01020")
        elseif RandI(1, 3) == 1 then
          Fn_captionViewWait("ep80_01021")
        elseif RandI(1, 3) == 2 then
          Fn_captionViewWait("ep80_01022")
        else
          Fn_captionViewWait("ep80_01023")
        end
      end
      waitSeconds(0.1)
    end
    while L1_17 == true do
      if false == false then
        Fn_captionViewWait("ep80_01024")
      end
      if false == false and A0_16:getHealth() < L3_19 then
        waitSeconds(0.5)
        Fn_captionViewWait("ep80_01025")
      end
      wait()
    end
    if L1_17 == false then
      waitSeconds(0.5)
      Fn_captionViewWait("ep80_01026")
    end
  end)
end
function Finalize()
  Fn_sendEventComSb("requestAreaStop")
  Mob:makeSituationPanic(false)
  Vehicle:SetPanic(false)
  _resetHUD()
end
function pccubesensor2_battle_navi_OnEnter(A0_23)
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_23:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_24)
  invokeTask(function()
    Fn_captionView("ep80_00118")
    waitSeconds(2)
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_24:setActive(false)
end
