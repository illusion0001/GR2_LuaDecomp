dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
dofile("/Game/Misc/sdemo.lua")
_global = {}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_low_02")
end
function Ingame()
  local L0_0, L1_1
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestSpawnEnemy"
  L0_0(L1_1, "enmgen2_02")
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestEnemyMarkerOn"
  L0_0(L1_1, "enmgen2_02", false)
  L0_0 = wait
  L0_0()
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_start_pos"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "setupFireEffect"
  L0_0(L1_1)
  L0_0 = Fn_setCatWarp
  L1_1 = false
  L0_0(L1_1)
  L0_0 = anoterCatWarp
  L0_0()
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_missionView
  L1_1 = "ep06_03000"
  L0_0(L1_1)
  L0_0 = waitSeconds
  L1_1 = NAVI_WAIT
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestSpawnEnemy"
  L0_0(L1_1, "enmgen2_06")
  L0_0 = Fn_naviSet
  L1_1 = findGameObject2
  L1_1 = L1_1("Node", "locator2_navi_04")
  L0_0(L1_1, L1_1("Node", "locator2_navi_04"))
  L0_0 = waitSeconds
  L1_1 = CAP_WAIT
  L0_0(L1_1)
  L0_0 = Fn_captionView
  L1_1 = "ep06_03001"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_low_02"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "requestEnemyHandle"
  L0_0 = L0_0(L1_1, "ep06_com_landingship01")
  L1_1 = invokeTask
  L1_1 = L1_1(function()
    while true do
      if Fn_isInSightTarget(L0_0, 1) and Fn_getDistanceToPlayer(L0_0:getWorldPos()) <= 100 then
        Fn_captionView("ep06_03002")
        Fn_sendEventComSb("setLandingShipMove")
        break
      end
      wait()
    end
  end)
  start_game_obj()
  Mv_waitPhase()
  Fn_naviKill()
  Fn_resetCoercionPose()
  Player:setStay(true)
  Player:setEnergyInfinite(Player.kEnergy_Life, true)
  Fn_sendEventComSb("requestIdleEnemy", "enmgen2_02", true)
  Fn_sendEventComSb("setLandingShipMove")
  Fn_captionViewWait("ep06_03003")
  Fn_kaiwaDemoView("ep06_00190k")
  Fn_sendEventComSb("set06dFlag", true)
  Player:setEnergyInfinite(Player.kEnergy_Life, false)
  L1_1 = Mv_safeTaskAbort(L1_1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
function isInEyeSight(A0_4, A1_5)
  local L2_6, L3_7, L4_8
  L2_6 = Fn_isInSightTarget
  L3_7 = A0_4
  L4_8 = 1
  L2_6 = L2_6(L3_7, L4_8)
  if L2_6 == true then
    L2_6 = Fn_getPlayerWorldTransform
    L3_7 = L2_6()
    L4_8 = L2_6.y
    L4_8 = L4_8 + 1.5
    L2_6.y = L4_8
    L4_8 = Query
    L4_8 = L4_8.setEyeSightTransform
    L4_8(L4_8, L2_6, L3_7)
    L4_8 = Query
    L4_8 = L4_8.setEyeSightAngle
    L4_8(L4_8, Deg2Rad(35))
    L4_8 = Query
    L4_8 = L4_8.setEyeSightRange
    L4_8(L4_8, A1_5)
    L4_8 = A0_4.getWorldPos
    L4_8 = L4_8(A0_4)
    return Query:raycastEyeSight(L4_8) == nil
  end
  L2_6 = false
  return L2_6
end
function pccubesensor2_low_02_OnEnter()
  Fn_pcSensorOff("pccubesensor2_low_02")
  Mv_gotoNextPhase()
end
function pccubesensor2_warp_warning_08_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep06_03005", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_08_OnLeave()
  runCatWarp()
end
