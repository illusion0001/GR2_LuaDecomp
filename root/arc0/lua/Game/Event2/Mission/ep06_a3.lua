dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
_global = {
  puppet_tbl = {},
  rich_car = nil,
  catwarp_navi = false
}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    L1_1,
    {
      name = "rich_btl",
      type = "man49",
      node = "locator2_rich_btl_01",
      active = false
    }
  }
  L1_1.name = "rich_03_mst"
  L1_1.type = "man45"
  L1_1.node = "locator2_rich_03_mst"
  L1_1.active = false
  L1_1.use_gravity = false
  L1_1(L0_0)
  for _FORV_4_, _FORV_5_ in L1_1(L0_0) do
    _global.puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1.ep06_madam_01 = Fn_findNpcPuppet("ep06_madam_01")
  L1_1.lie = "man01_idle_up_00"
  Fn_loadNpcEventMotion("rich_03_mst", L1_1)
  _global.rich_car = Fn_createGimmickBg("locator2_rich_03_ve02", "rich_bike", "ve_up_a", false)
  _global.rich_car:setVisibleBlockEnable(false)
  _global.rich_car:setVisible(true)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7
  L0_2 = Fn_setCatWarp
  L1_3 = false
  L0_2(L1_3)
  L0_2 = anoterCatWarp
  L0_2()
  L0_2 = Fn_setCatWarpCheckPoint
  L1_3 = "locator2_pc_start_pos"
  L0_2(L1_3)
  L0_2 = Fn_sendEventComSb
  L1_3 = "getPrevPhaseContinue"
  L0_2 = L0_2(L1_3)
  if L0_2 == false then
    L0_2 = Fn_setNpcActive
    L1_3 = "rich_btl"
    L2_4 = true
    L0_2(L1_3, L2_4)
  end
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_userCtrlOn
  L0_2()
  L0_2 = Fn_sendEventComSb
  L1_3 = "getPrevPhaseContinue"
  L0_2 = L0_2(L1_3)
  if L0_2 == false then
    function L0_2()
      Fn_setNpcActive("rich_btl", false)
      Fn_disappearNpc("rich_btl")
      wait()
      Fn_sendEventComSb("setFoundButler")
      Fn_sendEventComSb("setActiveButler", true)
    end
    L1_3 = Fn_kaiwaDemoView2
    L2_4 = "ep06_00140k"
    L3_5 = L0_2
    L4_6 = true
    L1_3(L2_4, L3_5, L4_6)
  end
  L0_2 = Fn_sendEventComSb
  L1_3 = "restartMove"
  L0_2(L1_3)
  L0_2 = Fn_sendEventComSb
  L1_3 = "setPrevPhaseContinue"
  L2_4 = false
  L0_2(L1_3, L2_4)
  L0_2 = findGameObject2
  L1_3 = "GimmickBg"
  L2_4 = "bg2_beachchair_md_01_01"
  L0_2 = L0_2(L1_3, L2_4)
  L1_3 = Fn_setNpcActive
  L2_4 = "rich_03_mst"
  L3_5 = true
  L1_3(L2_4, L3_5)
  L1_3 = Fn_playNpcEventMotion
  L2_4 = "rich_03_mst"
  L3_5 = "man01_idle_up_00"
  L4_6 = true
  L5_7 = 0
  L1_3(L2_4, L3_5, L4_6, L5_7, false)
  L1_3 = Fn_missionView
  L2_4 = "ep06_00138"
  L1_3(L2_4)
  L1_3 = waitSeconds
  L2_4 = 5.5
  L1_3(L2_4)
  L1_3 = Fn_captionView
  L2_4 = "ep06_00139"
  L1_3(L2_4)
  L1_3 = false
  L2_4 = 0
  L3_5 = 1
  L4_6 = invokeTask
  function L5_7()
    while not L1_3 do
      if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_rich_03_ve02"):getWorldPos()) > 30 then
        if L3_5 % 30 == 0 then
          if L2_4 == 0 then
            Fn_captionView("ep06_00140")
          elseif L2_4 == 1 then
            Fn_captionView("ep06_00141")
          elseif L2_4 == 2 then
            Fn_captionViewWait("ep06_00142")
          elseif L2_4 == 3 then
            Fn_captionViewWait("ep06_00154")
          end
          L2_4 = L2_4 + 1
          L2_4 = L2_4 % 4
        end
        waitSeconds(1)
        L3_5 = L3_5 + 1
        L3_5 = L3_5 % 30
      end
      wait()
    end
  end
  L4_6 = L4_6(L5_7)
  L5_7 = invokeTask
  L5_7 = L5_7(function()
    while not Fn_isInSightTarget(_global.rich_car, 0.8) or not (Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_rich_03_ve02"):getWorldPos()) <= 30) do
      wait()
    end
    Fn_captionViewWait("ep06_00143")
  end)
  while true do
    if not RayCheckObj(_global.puppet_tbl.rich_03_mst, 1) and Fn_isInSightTarget(_global.puppet_tbl.rich_03_mst, 0.8) and Fn_getDistanceToPlayer(_global.puppet_tbl.rich_03_mst) <= 15 then
      L1_3 = true
      L4_6 = Mv_safeTaskAbort(L4_6)
      L5_7 = Mv_safeTaskAbort(L5_7)
      break
    end
    wait()
  end
  btl_task = Mv_safeTaskAbort(btl_task)
  waitSeconds(1)
  Fn_captionView("ep06_00144")
  Fn_naviSet(_global.puppet_tbl.rich_03_mst)
  Fn_pcSensorOn("pccubesensor2_mst")
  Mv_waitPhase()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_mst")
  Fn_kaiwaDemoView("ep06_00150k")
  Fn_setNpcActive("ep06_madam_01", true)
  Fn_playMotionNpc("ep06_madam_01", "stay", false)
  Fn_warpNpc("ep06_madam_01", "locator2_madam_reset_01")
  Fn_userCtrlOn()
  Fn_captionViewWait("ep06_00127")
  Fn_blackout()
  Fn_disappearNpc("rich_03_mst")
  Fn_disappearNpc("ep06_cid_01")
  Fn_disappearNpc("ep06_ve_02")
  L4_6 = Mv_safeTaskAbort(L4_6)
  L5_7 = Mv_safeTaskAbort(L5_7)
  Fn_sendEventComSb("endComTask")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_8, L1_9
end
function pccubesensor2_mst_search_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_mst_search_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_mst_search"))
    Fn_captionViewWait("ep06_00145")
    Player:setStay(false)
  end)
end
function pccubesensor2_mst_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_rich_03_home_01_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_rich_03_home_01")
  notFoundMsg()
end
function pccubesensor2_warp_area_05_OnLeave()
  runCatWarp()
end
function notFoundMsg()
  invokeTask(function()
    Fn_captionViewWait("ep06_00150")
    Fn_captionViewWait("ep06_00151")
  end)
end
function isInEyeSight(A0_10, A1_11)
  local L2_12, L3_13, L4_14
  L2_12 = Fn_isInSightTarget
  L3_13 = A0_10
  L4_14 = 1
  L2_12 = L2_12(L3_13, L4_14)
  if L2_12 == true then
    L2_12 = Fn_getPlayerWorldTransform
    L3_13 = L2_12()
    L4_14 = L2_12.y
    L4_14 = L4_14 + 1.5
    L2_12.y = L4_14
    L4_14 = Query
    L4_14 = L4_14.setEyeSightTransform
    L4_14(L4_14, L2_12, L3_13)
    L4_14 = Query
    L4_14 = L4_14.setEyeSightAngle
    L4_14(L4_14, Deg2Rad(35))
    L4_14 = Query
    L4_14 = L4_14.setEyeSightRange
    L4_14(L4_14, A1_11)
    L4_14 = A0_10.getWorldPos
    L4_14 = L4_14(A0_10)
    return Query:raycastEyeSight(L4_14) == nil
  end
  L2_12 = false
  return L2_12
end
