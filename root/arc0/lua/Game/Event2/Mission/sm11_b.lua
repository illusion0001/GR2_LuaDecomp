dofile("/Game/Event2/Common/EventCommon.lua")
_cliant_name = "sm11_client"
_son_name = "sm11_son"
_photo = nil
_cap_task = nil
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    {
      name = _son_name,
      type = "man39",
      node = "locator2_man39_01",
      not_mob = true
    }
  }
  Fn_setupNpc(L0_0)
  Fn_pcSensorOff("pccubesensor2_outrange_02")
  Fn_pcSensorOff("pccubesensor2_outrange_03")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_findNpc
  L1_2 = _cliant_name
  L0_1 = L0_1(L1_2)
  L1_2 = Fn_warpNpc
  L2_3 = L0_1
  L3_4 = "locator2_client_start"
  L1_2(L2_3, L3_4)
  L1_2 = Fn_findNpc
  L2_3 = _son_name
  L1_2 = L1_2(L2_3)
  L2_3 = wait
  L2_3()
  L2_3 = Fn_moveNpc
  L3_4 = L0_1
  L4_5 = {L5_6}
  L5_6.runLength = -1
  L5_6.arrivedLength = 0
  L2_3 = L2_3(L3_4, L4_5, L5_6)
  L3_4 = Fn_missionStart
  L3_4()
  L3_4 = Fn_turnNpc
  L4_5 = L1_2
  L3_4(L4_5, L5_6)
  L3_4 = Fn_playMotionNpc
  L4_5 = L1_2
  L3_4(L4_5, L5_6, false)
  repeat
    L3_4 = wait
    L3_4()
    L4_5 = L2_3
    L3_4 = L2_3.isRunning
    L3_4 = L3_4(L4_5)
  until not L3_4
  L3_4 = waitSeconds
  L4_5 = 1
  L3_4(L4_5)
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm11_00500k"
  L3_4(L4_5)
  L3_4 = waitSeconds
  L4_5 = 0.5
  L3_4(L4_5)
  L3_4 = Fn_moveNpc
  L4_5 = L0_1
  L3_4 = L3_4(L4_5, L5_6, {
    runLength = 10,
    anim_walk = "walk2",
    arrivedLength = 0
  })
  L2_3 = L3_4
  repeat
    L3_4 = wait
    L3_4()
    L4_5 = L2_3
    L3_4 = L2_3.isRunning
    L3_4 = L3_4(L4_5)
  until not L3_4
  L3_4 = invokeTask
  function L4_5()
    Fn_turnNpc(L1_2, nil, {force = true})
  end
  L3_4(L4_5)
  L3_4 = Fn_turnNpc
  L4_5 = L0_1
  L3_4(L4_5, L5_6, {force = true})
  L3_4 = Fn_userCtrlOn
  L3_4()
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_outrange_02"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_outrange_03"
  L3_4(L4_5)
  L3_4 = Fn_missionView
  L4_5 = "sm11_00103"
  L3_4(L4_5)
  L3_4 = false
  L4_5 = Photo
  L4_5 = L4_5.create
  L4_5 = L4_5(L5_6, kPHOTO_TYPE_ANY, true, {near = 1, far = 30}, {
    left = -1,
    right = 1,
    top = -1,
    bottom = 1
  }, "sm11_user_photo01")
  _photo = L4_5
  L4_5 = _photo
  L4_5 = L4_5.set
  L4_5(L5_6, "locator2_photo_point_01")
  L4_5 = _photo
  L4_5 = L4_5.set
  L4_5(L5_6, "locator2_photo_point_02")
  repeat
    L4_5 = _photo
    L4_5 = L4_5.run
    L4_5(L5_6)
    repeat
      L4_5 = wait
      L4_5()
      L4_5 = _photo
      L4_5 = L4_5.isRunning
      L4_5 = L4_5(L5_6)
    until not L4_5
    L4_5 = _photo
    L4_5 = L4_5.getPhotoState
    L4_5 = L4_5(L5_6)
    if L5_6 == "table" then
      if L5_6 >= 0 then
        for _FORV_8_, _FORV_9_ in L5_6(L4_5) do
          if _FORV_9_.state == kPHOTO_OK and (_FORV_9_.target:getName() == "locator2_photo_point_01" or _FORV_9_.target:getName() == "locator2_photo_point_02") then
            L3_4 = true
            Sound:pulse("success")
            Fn_captionViewWait("sm11_00121")
            HUD:setPhotoMode(false)
            HUD:info_reset()
            break
          end
        end
      end
    end
    if not L3_4 then
      L5_6("sm11_00122")
    end
    L5_6()
  until L3_4
  L4_5 = _photo
  L4_5 = L4_5.kill
  L4_5(L5_6)
  _photo = nil
  L4_5 = Fn_missionViewEnd
  L4_5()
  L4_5 = waitSeconds
  L4_5(L5_6)
  L4_5 = Fn_kaiwaDemoView
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L4_5(L5_6)
  L4_5 = false
  L5_6(function()
    waitSeconds(0.5)
    Fn_turnNpc(L0_1, "locator2_man39_01", {force = true})
    L4_5 = true
  end)
  invokeTask(function()
    Fn_turnNpc(L1_2, "locator2_client_setpoint", {force = true})
    L5_6 = true
  end)
  while L4_5 == false and L5_6 == false do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_7, L1_8
end
function pccubesensor2_outrange_02_OnEnter(A0_9)
  if _cap_task ~= nil and _cap_task:isRunning() then
    _cap_task:abort()
  end
  _cap_task = nil
end
function pccubesensor2_outrange_02_OnLeave(A0_10)
  _cap_task = invokeTask(function()
    repeat
      if RandI(1, 10) < 5 then
        Fn_captionViewWait("sm11_00134")
      else
        Fn_captionViewWait("sm11_00135")
      end
      _photo:resetCaption()
      _photo:coercionCaption(true)
      waitSeconds(RandF(10, 20))
    until false
  end)
end
function pccubesensor2_outrange_03_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
