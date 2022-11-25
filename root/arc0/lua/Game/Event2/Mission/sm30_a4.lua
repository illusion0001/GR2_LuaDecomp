dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm30_common.lua")
_puppet_tbl = {}
_staff_bg_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_staff_car_move_task = nil
_car_move_task = nil
_car_data_tbl = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {
    L1_1,
    L2_2,
    L3_3
  }
  L1_1.name = "sm30_director_01"
  L1_1.type = "man18"
  L1_1.node = "locator2_director_01"
  L1_1.active = false
  L2_2.name = "sm30_assistant_01"
  L2_2.type = "man17"
  L2_2.node = "locator2_assistant_01"
  L2_2.active = false
  L3_3.name = "sm30_assi_wom_01"
  L3_3.type = "wom01"
  L3_3.node = "locator2_assi_wom_01"
  L3_3.active = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L6_6[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
  end
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L5_5 = "bg2_scene4_parasol_01"
  L6_6 = "bg2_scene1_chair_01"
  for L5_5, L6_6 in L2_2(L3_3) do
    if findGameObject2("GimmickBg", L6_6) ~= nil then
      findGameObject2("GimmickBg", L6_6):setVisiblePermission(false)
      _staff_bg_tbl[L6_6] = findGameObject2("GimmickBg", L6_6)
    end
  end
  L2_2(L3_3)
  L2_2(L3_3)
end
function Ingame()
  Fn_disableCostumeChange(true)
  Fn_userCtrlOff()
  LoadPlayerCommonMotionTable()
  scene3Main()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  carMoveAbort()
  for _FORV_3_, _FORV_4_ in ipairs(_car_data_tbl) do
    ReleaseShipWork(_FORV_4_.shipWork)
  end
  Fn_disableCostumeChange(false)
end
function scene3Main()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13
  L0_7 = {
    L1_8,
    L2_9,
    L3_10,
    L4_11
  }
  L1_8 = {}
  L1_8.sensor_name = "pccubesensor2_scene3_car_01"
  L1_8.navi_name = "locator2_navi_scene3_car_01"
  L2_9 = InitializeShipWork
  L6_13 = {
    findGameObject2("Node", "locator2_scene3_car_01"):getWorldPos(),
    findGameObject2("Node", "locator2_scene3_car_01_move_01"):getWorldPos(),
    findGameObject2("Node", "locator2_scene3_car_01_move_02"):getWorldPos(),
    findGameObject2("Node", "locator2_scene3_car_01_move_03"):getWorldPos(),
    findGameObject2("Node", "locator2_scene3_car_01_move_04"):getWorldPos()
  }
  L2_9 = L2_9(L3_10, L4_11, L5_12, L6_13, 2.78)
  L1_8.shipWork = L2_9
  L2_9 = {}
  L2_9.sensor_name = "pccubesensor2_scene3_car_02"
  L2_9.navi_name = "locator2_navi_scene3_car_02"
  L6_13 = "locator2_scene3_car_02"
  L2_9.shipWork = L3_10
  L3_10.sensor_name = "pccubesensor2_scene3_car_03"
  L3_10.navi_name = "locator2_navi_scene3_car_03"
  L6_13 = "sm30_car_03"
  L3_10.shipWork = L4_11
  L4_11.sensor_name = "pccubesensor2_scene3_car_04"
  L4_11.navi_name = "locator2_navi_scene3_car_04"
  L6_13 = "BusHexL04"
  L4_11.shipWork = L5_12
  _car_data_tbl = L0_7
  L0_7 = {L1_8, L2_9}
  L1_8 = {}
  L1_8.phase = 1
  L2_9 = {}
  L2_9.phase = 3
  L1_8 = InitializeShipWork
  L2_9 = "ForSm32_39Ship"
  L6_13 = findGameObject2
  L6_13 = L6_13("Node", "warppoint2_scene3_staff_car_01")
  L6_13 = L6_13.getWorldPos
  L6_13 = L6_13(L6_13)
  L6_13 = 4.17
  L1_8 = L1_8(L2_9, L3_10, L4_11, L5_12, L6_13)
  function L2_9()
    if _car_move_task == nil then
      _car_move_task = {}
    end
    for _FORV_3_, _FORV_4_ in ipairs(_car_data_tbl) do
      _car_move_task[_FORV_3_] = invokePursueFlyTask(_FORV_4_.shipWork)
    end
  end
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L3_10(L4_11, L5_12)
  L6_13 = false
  L3_10(L4_11, L5_12, L6_13)
  L6_13 = false
  L3_10(L4_11, L5_12, L6_13)
  L6_13 = false
  L3_10(L4_11, L5_12, L6_13)
  L3_10()
  L3_10(L4_11, L5_12)
  for L6_13, _FORV_7_ in L3_10(L4_11) do
    _FORV_7_.shipWork.ship:appendChild(findGameObject2("PlayerSensor", _FORV_7_.sensor_name), true)
    _FORV_7_.shipWork.ship:appendChild(findGameObject2("Node", _FORV_7_.navi_name), true)
  end
  L6_13 = Player
  L6_13 = L6_13.getEnergyMax
  L6_13 = L6_13(L6_13, Player.kEnergy_Life)
  L3_10(L4_11, L5_12, L6_13, L6_13(L6_13, Player.kEnergy_Life))
  L3_10(L4_11, L5_12)
  L3_10()
  L3_10(L4_11)
  L3_10()
  function L6_13()
    local L0_14
    L0_14("sm30_info_03")
    L0_14("sm30_00102")
    _is_out_of_range = false
    L0_14("pccubesensor2_scene3_out_01")
    L0_14()
    L0_14("event", "cut3_start")
    L0_14("sm30_00115")
    L0_14(L0_14, false)
    L0_14()
    L0_14()
    while true do
      if L0_14 == false then
        L3_10 = L0_14
        for _FORV_3_ = 1, #L0_7 do
          if L3_10 == L0_7[_FORV_3_].phase then
            if _FORV_3_ == 2 then
              _staff_car_move_task = invokeTask(function()
                L1_8 = ChangeRoute(L1_8, {
                  findGameObject2("Node", "locator2_scene3_staff_car_movepoint_01"):getWorldPos(),
                  findGameObject2("Node", "locator2_scene3_staff_car_movepoint_02"):getWorldPos()
                })
                MoveShipWork(L1_8)
              end)
            else
              _staff_car_move_task = StartShipWorkInvokeTask(L1_8)
            end
          end
        end
        if L3_10 < L4_11 then
          Fn_naviSet(findGameObject2("Node", _car_data_tbl[L3_10].navi_name))
        else
          Fn_naviSet(findGameObject2("Node", "locator2_navi_scene3_goal_01"))
        end
        _is_in_sensor = false
        Fn_pcSensorOn(L0_14)
        while true do
          if 0 < 3 and _is_out_of_range == false then
            wait()
          end
        end
        Fn_pcSensorOff(L0_14)
        _is_in_sensor = false
        Fn_naviKill()
      end
    end
    L0_14("pccubesensor2_scene3_out_01")
    _is_in_sensor = false
    if L0_14 == true then
      L0_14()
      return L0_14
    end
    _is_out_of_range = false
    return L0_14
  end
  while true do
    if L6_13() == false then
    end
  end
  Fn_setBgmPoint("event", "cut3_end")
  Fn_userCtrlOff()
  PcAppeal()
  Fn_kaiwaDemoView("sm30_01000k")
  Fn_blackout()
  _staff_bg_tbl.bg2_scene3_parasol_01:setVisiblePermission(false)
  _staff_bg_tbl.bg2_scene3_chair_01:setVisiblePermission(false)
end
function invokePursueFlyTask(A0_15)
  local L1_16
  L1_16 = {}
  L1_16.move_task = StartShipWorkInvokeTask(A0_15)
  function L1_16.update(A0_17)
    while A0_17.move_task:isRunning() do
      wait()
    end
  end
  function L1_16.destractor(A0_18)
    A0_18.move_task:abort()
    A0_18.move_task = nil
  end
  return RAC_InvokeTaskWithDestractor(L1_16.update, L1_16.destractor, L1_16)
end
function pccubesensor2_scene3_car_01_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00116")
end
function pccubesensor2_scene3_car_01_OnLeave()
  local L0_19, L1_20
  _is_in_sensor = false
end
function pccubesensor2_scene3_car_02_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00117")
end
function pccubesensor2_scene3_car_02_OnLeave()
  local L0_21, L1_22
  _is_in_sensor = false
end
function pccubesensor2_scene3_car_03_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00118")
end
function pccubesensor2_scene3_car_03_OnLeave()
  local L0_23, L1_24
  _is_in_sensor = false
end
function pccubesensor2_scene3_car_04_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00119")
end
function pccubesensor2_scene3_car_04_OnLeave()
  local L0_25, L1_26
  _is_in_sensor = false
end
function pccubesensor2_scene3_goal_01_OnEnter()
  local L0_27, L1_28
  _is_in_sensor = true
end
function pccubesensor2_scene3_goal_01_OnLeave()
  local L0_29, L1_30
  _is_in_sensor = false
end
function pccubesensor2_scene3_out_01_OnEnter()
  local L0_31, L1_32
  _is_out_of_range = false
end
function pccubesensor2_scene3_out_01_OnLeave()
  local L0_33, L1_34
  _is_out_of_range = true
end
function carMoveAbort()
  if _car_move_task then
    for _FORV_3_, _FORV_4_ in ipairs(_car_move_task) do
      _car_move_task[_FORV_3_]:abort()
      _car_move_task[_FORV_3_] = nil
    end
    _car_move_task = nil
  end
  if _staff_car_move_task then
    _staff_car_move_task:abort()
    _staff_car_move_task = nil
  end
end
