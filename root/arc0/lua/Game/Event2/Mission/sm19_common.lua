local L1_1
RICH_MAN_ID = "sm19_rich_man"
BROTHER_ID = "sm19_brother_01"
SISTER_ID = "sm19_sister_01"
_view_task = nil
_goal_navi_locator = nil
L0_0 = {}
_created_gem_tbl = L0_0
_create_gem_task = nil
function L0_0(A0_2)
  if A0_2 == true then
    Fn_userCtrlOn()
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    Player:setStay(false)
  else
    Fn_userCtrlAllOff()
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Player:setStay(true)
  end
end
setUserCtrlOn = L0_0
function L0_0(A0_3, A1_4, A2_5, A3_6)
  local L4_7
  A3_6 = A3_6 or false
  L4_7 = Mv_invokeMissionViewNaviCaption
  L4_7 = L4_7(A0_3, A1_4, A2_5)
  while true do
    if Mv_isSafeTaskRunning(L4_7) == false then
      L4_7 = Mv_safeTaskAbort(L4_7)
      break
    end
    wait()
  end
  if A3_6 == true then
    viewTarget(A1_4, 0.5)
  end
end
showMissionStart = L0_0
function L0_0(A0_8, A1_9, A2_10)
  A2_10 = A2_10 or false
  if A0_8 ~= nil then
    while not (A1_9 >= Fn_getDistanceToPlayer(A0_8)) or A2_10 and Player:getAction() ~= Player.kAction_Idle do
      wait()
    end
  end
end
playerNearWait = L0_0
function L0_0(A0_11, A1_12, A2_13)
  _view_task = Mv_safeTaskAbort(_view_task)
  if A0_11 ~= nil and is_camera_input() == false then
    A2_13 = A2_13 or false
    if A2_13 == true then
      Mv_safeTaskAbort(Mv_viewObjWait(A0_11, A1_12))
    else
      _view_task = Fn_lookAtObject(A0_11)
      invokeTask(function()
        local L0_14
        L0_14 = 30
        while true do
          L0_14 = L0_14 - 1
          if Fn_isInSightTarget(A0_11, A1_12) or L0_14 <= 0 or is_camera_input() == true then
            _view_task = Mv_safeTaskAbort(_view_task)
            break
          end
          wait()
        end
      end)
    end
  end
end
viewTarget = L0_0
function L0_0(A0_15, A1_16, A2_17)
  A2_17 = A2_17 or false
  if A0_15 ~= nil then
    Fn_naviSet(A0_15)
    viewTarget(A0_15, A1_16, A2_17)
  end
end
setNaviAndView = L0_0
function L0_0(A0_18)
  local L1_19
  _goal_navi_locator = A0_18
  _is_create_task_permit = true
end
init_create_enemy_gem = L0_0
function L0_0()
  _is_create_task_permit = false
  _create_gem_task = Mv_safeTaskAbort(_create_gem_task)
end
stop_create_enemy_gem = L0_0
function L0_0(A0_20)
  local L1_21
  L1_21 = findGameObject2
  L1_21 = L1_21("Node", _goal_navi_locator)
  node_hdl = L1_21
  L1_21 = nil
  if _is_create_task_permit then
    L1_21 = invokeTask(function()
      local L0_22, L1_23, L2_24, L3_25, L4_26
      while true do
        L0_22 = node_hdl
        L1_23 = L0_22
        L0_22 = L0_22.getWorldPos
        L0_22 = L0_22(L1_23)
        L1_23 = Fn_getPcPosRot
        L2_24 = L1_23()
        L3_25 = L1_23.y
        L3_25 = L3_25 + 1.5
        L1_23.y = L3_25
        L3_25 = Query
        L4_26 = L3_25
        L3_25 = L3_25.setEyeSightTransform
        L3_25(L4_26, L1_23, L2_24)
        L3_25 = Query
        L4_26 = L3_25
        L3_25 = L3_25.setEyeSightAngle
        L3_25(L4_26, Deg2Rad(360))
        L3_25 = Query
        L4_26 = L3_25
        L3_25 = L3_25.setEyeSightRange
        L3_25(L4_26, A0_20)
        L3_25 = Query
        L4_26 = L3_25
        L3_25 = L3_25.raycastEyeSight
        L3_25 = L3_25(L4_26, L0_22)
        if L3_25 == nil then
          L3_25 = createGameObject2
          L4_26 = "Gem"
          L3_25 = L3_25(L4_26)
          L4_26 = L3_25.setGemModelNo
          L4_26(L3_25, 4)
          L4_26 = NormalizeVector
          L4_26 = L4_26(L0_22 - L1_23)
          L4_26 = L4_26 * A0_20
          L4_26 = L1_23 + L4_26
          L3_25:setWorldPos(L4_26)
          L3_25:try_init()
          L3_25:waitForReady()
          L3_25:try_start()
          table.insert(_created_gem_tbl, L3_25)
          print("\n\227\130\184\227\130\167\227\131\160\227\129\174\231\148\159\230\136\144")
        end
        L3_25 = waitSeconds
        L4_26 = 5
        L3_25(L4_26)
        L3_25 = wait
        L3_25()
      end
    end)
  end
  return L1_21
end
create_energy_gem = L0_0
