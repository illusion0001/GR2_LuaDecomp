dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
_global = {
  puppet_tbl = {},
  energy_box = nil,
  box_poor = false,
  box_end = false,
  target_malti_navi = {},
  save_target_navi = {},
  box_steal_flag = false,
  box_break = false,
  mnavi_hdl = {},
  broken_box_check_task = nil,
  check_grab_box_task = nil,
  box_deli_start = false,
  box_sensor = nil,
  up_navi = false,
  madam_retry = false,
  retry_flag = false,
  retry_catwarp = false,
  retry_select = false
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shop_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_up_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_navi_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_navi_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_low_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_theif_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_warning_06")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_area_06")
  L0_0 = {
    {
      name = "shop_01",
      type = "man39",
      node = "locator2_man02_01"
    },
    {
      name = "ep06_poor_01",
      type = "man33",
      node = "locator2_poor_01",
      active = false
    },
    {
      name = "ep06_poor_02",
      type = "wom17",
      node = "locator2_poor_02",
      active = false
    },
    {
      name = "ep06_poor_03",
      type = "chi12",
      node = "locator2_poor_03",
      active = false
    },
    {
      name = "ep06_poor_04",
      type = "man44",
      node = "locator2_poor_04",
      active = false
    },
    {
      name = "ep06_poor_05",
      type = "man43",
      node = "locator2_poor_05",
      active = false
    },
    {
      name = "ep06_poor_06",
      type = "chi11",
      node = "locator2_poor_06",
      active = false
    },
    {
      name = "ep06_thief_01",
      type = "man42",
      node = "locator2_thief_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _global.puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _global.puppet_tbl.ep06_madam_01 = Fn_findNpcPuppet("ep06_madam_01")
  _global.energy_box = Fn_createGimmickBg("locator2_energy_box_init_pos_01", "energy_box", "box_ms_02", true, "box_ms_02_event_02")
  _global.energy_box:switchGravityGrabAsWeapon(false)
  _global.energy_box:setEventListener("dynamic", function(A0_1)
    A0_1:getDynamicObject():setName("dynamic_obj")
  end)
  _global.energy_box:setIgnoreGrab(true)
  Fn_userCtrlOff()
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14
  L0_2 = {L1_3}
  L1_3 = Player
  L1_3 = L1_3.kAbility_Grab
  L1_3 = Fn_lockPlayerAbility
  L2_4 = L0_2
  L3_5 = nil
  L1_3(L2_4, L3_5)
  L1_3 = Fn_sendEventComSb
  L2_4 = "requestObjActive"
  L3_5 = "bg2_ship_02"
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = nil
  L2_4 = Fn_disappearNpc
  L3_5 = "ep06_cid_01"
  L2_4(L3_5)
  L2_4 = Fn_disappearNpc
  L3_5 = "ep06_ve_02"
  L2_4(L3_5)
  L2_4 = anoterCatWarp
  function L3_5()
    if _global.broken_box_check_task ~= nil then
      _global.energy_box = Fn_createGimmickBg("locator2_energy_box_init_pos_01", "energy_box", "box_ms_02", true, "box_ms_02_event_02")
      _global.energy_box:switchGravityGrabAsWeapon(false)
      _global.energy_box:setEventListener("dynamic", function(A0_15)
        A0_15:getDynamicObject():setName("dynamic_obj")
      end)
      deleteNavi(false)
      _global.save_target_navi = _global.target_malti_navi
      _global.target_malti_navi = {
        getEnergyBoxHdl()
      }
      resetNavi()
      _global.target_malti_navi = _global.save_target_navi
    end
  end
  function L4_6()
    local L0_16, L1_17
  end
  function L5_7()
    if _global.broken_box_check_task ~= nil and getEnergyBoxHdl() ~= nil then
      getEnergyBoxHdl():setGrabReleaseForce(true)
      while getEnergyBoxHdl() ~= nil and getEnergyBoxHdl():isGrabbed() ~= false do
        do break end
        do break end
        wait()
      end
      _global.energy_box:setActive(false)
      _global.energy_box:setVisible(false)
      _global.energy_box:kill()
      _global.energy_box = nil
    end
  end
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = Fn_setCatWarpCheckPoint
  L3_5 = "locator2_pc_start_pos"
  L2_4(L3_5)
  L2_4 = Fn_warpNpc
  L3_5 = "ep06_madam_01"
  L4_6 = "locator2_madam_reset_02"
  L2_4(L3_5, L4_6)
  L2_4 = findGameObject2
  L3_5 = "Node"
  L4_6 = "bg2_box_leave"
  L2_4 = L2_4(L3_5, L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.setActive
  L5_7 = false
  L3_5(L4_6, L5_7)
  L3_5 = Fn_setCatWarp
  L4_6 = true
  L3_5(L4_6)
  L3_5 = Fn_missionStart
  L3_5()
  L3_5 = Fn_userCtrlAllOff
  L3_5()
  L3_5 = waitSeconds
  L4_6 = 1
  L3_5(L4_6)
  L3_5 = Fn_kaiwaDemoView
  L4_6 = "ep06_00155k"
  L3_5(L4_6)
  L3_5 = {
    L4_6,
    L5_7,
    L6_8,
    L7_9,
    L8_10,
    L9_11,
    L10_12,
    L11_13,
    L12_14,
    findGameObject2("Node", "bg2_box_10")
  }
  L4_6 = findGameObject2
  L5_7 = "Node"
  L6_8 = "bg2_box_01"
  L4_6 = L4_6(L5_7, L6_8)
  L5_7 = findGameObject2
  L6_8 = "Node"
  L7_9 = "bg2_box_02"
  L5_7 = L5_7(L6_8, L7_9)
  L6_8 = findGameObject2
  L7_9 = "Node"
  L8_10 = "bg2_box_03"
  L6_8 = L6_8(L7_9, L8_10)
  L7_9 = findGameObject2
  L8_10 = "Node"
  L7_9 = L7_9(L8_10, L9_11)
  L8_10 = findGameObject2
  L8_10 = L8_10(L9_11, L10_12)
  L12_14 = "bg2_box_07"
  L12_14 = "Node"
  L12_14 = findGameObject2
  L12_14 = L12_14("Node", "bg2_box_09")
  L4_6 = invokeTask
  function L5_7()
    while true do
      for _FORV_3_, _FORV_4_ in ipairs(L3_5) do
        if _FORV_4_:isBroken() then
          _global.box_break = true
          break
        end
      end
      if _global.box_break or _global.box_steal_flag then
        L1_3 = Mv_safeTaskAbort(L1_3)
        Fn_turnNpc("ep06_madam_01")
        Fn_playMotionNpc("ep06_madam_01", "talk_angry_01", false)
        if _global.box_break then
          Sound:playSE("w04_913b", 1, "", _global.puppet_tbl.ep06_madam_01)
          Fn_captionViewWait("ep06_01013")
        elseif _global.box_steal_flag then
          Sound:playSE("w04_914a", 1, "", nil)
          Fn_captionViewWait("ep06_01014")
        end
        Fn_blackout()
        Fn_resetPcPos("locator2_pc_reset_pos_01")
        Fn_warpNpc("ep06_madam_01", "locator2_madam_reset_02")
        for _FORV_3_, _FORV_4_ in ipairs(L3_5) do
          _FORV_4_:requestRestoreForce()
        end
        L1_3 = Fn_repeatPlayMotion("ep06_madam_01", "stay", {"stay_03"}, 3, 6)
        Fn_fadein()
        _global.box_break = false
        _global.box_steal_flag = false
      end
      wait()
    end
  end
  L4_6 = L4_6(L5_7)
  L5_7 = Mv_viewObj
  L6_8 = "bg2_box_01"
  L7_9 = 0.1
  L5_7 = L5_7(L6_8, L7_9)
  L6_8 = Fn_playMotionNpc
  L7_9 = "ep06_madam_01"
  L8_10 = "talk_02"
  L6_8(L7_9, L8_10, L9_11)
  L6_8 = Fn_captionView
  L7_9 = "ep06_01000"
  L6_8(L7_9)
  L6_8 = waitSeconds
  L7_9 = 1.5
  L6_8(L7_9)
  L6_8 = Fn_userCtrlOn
  L6_8()
  L6_8 = Mv_safeTaskAbort
  L7_9 = L5_7
  L6_8 = L6_8(L7_9)
  L5_7 = L6_8
  L6_8 = waitSeconds
  L7_9 = 1.5
  L6_8(L7_9)
  L6_8 = Fn_repeatPlayMotion
  L7_9 = "ep06_madam_01"
  L8_10 = "stay"
  L6_8 = L6_8(L7_9, L8_10, L9_11, L10_12, L11_13)
  L1_3 = L6_8
  L6_8 = waitSeconds
  L7_9 = 0.3
  L6_8(L7_9)
  L6_8 = {L7_9}
  L7_9 = Player
  L7_9 = L7_9.kAbility_Grab
  L7_9 = Fn_unLockPlayerAbility
  L8_10 = L6_8
  L7_9(L8_10, L9_11)
  L7_9 = Fn_missionView
  L8_10 = "ep06_01001"
  L7_9(L8_10)
  L7_9 = waitSeconds
  L8_10 = NAVI_WAIT
  L7_9(L8_10)
  L7_9 = deleteNavi
  L8_10 = true
  L7_9(L8_10)
  L7_9 = addNavi
  L8_10 = findGameObject2
  L12_14 = L8_10(L9_11, L10_12)
  L7_9(L8_10, L9_11, L10_12, L11_13, L12_14, L8_10(L9_11, L10_12))
  L7_9 = waitSeconds
  L8_10 = 2.5
  L7_9(L8_10)
  L7_9 = Fn_captionView
  L8_10 = "ep06_01002"
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = createBoxSensor
  L7_9()
  L7_9 = Fn_pcSensorOff
  L8_10 = "pcsensor_box"
  L7_9(L8_10)
  L7_9 = Fn_pcSensorOn
  L8_10 = "pccubesensor2_shop_01"
  L7_9(L8_10)
  L7_9 = start_game_obj
  L7_9()
  while true do
    L7_9 = Player
    L8_10 = L7_9
    L7_9 = L7_9.getAction
    L7_9 = L7_9(L8_10)
    L8_10 = Player
    L8_10 = L8_10.kAction_Idle
    if L7_9 ~= L8_10 then
      L8_10 = wait
      L8_10()
    end
  end
  L7_9 = Mv_waitPhase
  L7_9()
  L7_9 = Fn_naviKill
  L7_9()
  L7_9 = Fn_turnNpc
  L8_10 = "shop_01"
  L7_9(L8_10)
  L7_9 = wait
  L7_9()
  function L7_9()
    Player:setGrabExceptionalObject({
      "energy_box",
      "dynamic_obj"
    })
    getEnergyBoxHdl():setIgnoreGrab(false)
    Player:setGrabObject(getEnergyBoxHdl())
    waitSeconds(0.1)
    getEnergyBoxHdl():setGrabReleaseForce(true)
  end
  L8_10 = Fn_kaiwaDemoView2
  L8_10(L9_11, L10_12, L11_13)
  L8_10 = Fn_findNpc
  L8_10 = L8_10(L9_11)
  L8_10 = L8_10.resetDirection
  L8_10(L9_11)
  L8_10 = Fn_setCatWarpCheckPoint
  L8_10(L9_11)
  L8_10 = Fn_missionView
  L8_10(L9_11)
  L8_10 = _global
  L8_10.broken_box_check_task = L9_11
  L8_10 = waitSeconds
  L8_10(L9_11)
  L8_10 = getEnergyBoxHdl
  L8_10 = L8_10()
  if L8_10 ~= nil then
    L8_10 = getEnergyBoxHdl
    L8_10 = L8_10()
    L8_10 = L8_10.isGrabbed
    L8_10 = L8_10(L9_11)
    if L8_10 == false then
      L8_10 = Mv_viewObj
      L12_14 = L9_11()
      L8_10 = L8_10(L9_11, L10_12, L11_13, L12_14, L9_11())
      L9_11(L10_12)
      L8_10 = L9_11
    end
  end
  L8_10 = retryCheckWait
  L8_10()
  L8_10 = deleteNavi
  L8_10(L9_11)
  L8_10 = addNavi
  L12_14 = L9_11()
  L8_10(L9_11, L10_12, L11_13, L12_14, L9_11())
  L8_10 = Fn_captionView
  L8_10(L9_11)
  L8_10 = Fn_pcSensorOn
  L8_10(L9_11)
  L8_10 = Fn_setNpcActive
  L8_10(L9_11, L10_12)
  L8_10 = getEnergyBoxHdl
  L8_10 = L8_10()
  L8_10 = L8_10.setIgnoreGrab
  L8_10(L9_11, L10_12)
  while true do
    L8_10 = getEnergyBoxHdl
    L8_10 = L8_10()
    L8_10 = L8_10.isGrabbed
    L8_10 = L8_10(L9_11)
    if L8_10 == false then
      while true do
        L8_10 = _global
        L8_10 = L8_10.retry_flag
        if L8_10 == true then
          L8_10 = wait
          L8_10()
        end
      end
      L8_10 = wait
      L8_10()
    end
  end
  L8_10 = subNavi
  L8_10(L9_11)
  L8_10 = subNavi
  L12_14 = L9_11(L10_12)
  L8_10(L9_11, L10_12, L11_13, L12_14, L9_11(L10_12))
  L8_10 = removeBoxSenser
  L8_10()
  L8_10 = _global
  L8_10.box_deli_start = true
  L8_10 = _global
  L8_10.check_grab_box_task = L9_11
  L8_10 = subNavi
  L12_14 = L9_11()
  L8_10(L9_11, L10_12, L11_13, L12_14, L9_11())
  L8_10 = Fn_tutorialCaptionKill
  L8_10()
  while true do
    L8_10 = Fn_isCaptionView
    L8_10 = L8_10(L9_11)
    if L8_10 == true then
      L8_10 = wait
      L8_10()
    end
  end
  L8_10 = waitSeconds
  L8_10(L9_11)
  L8_10 = Fn_kaiwaDemoView
  L8_10(L9_11)
  L8_10 = Fn_missionView
  L8_10(L9_11)
  L8_10 = waitSeconds
  L8_10(L9_11)
  L8_10 = {}
  for L12_14 = 1, 10 do
    L8_10[L12_14] = findGameObject2("Node", "bg2_box_" .. string.format("%02d", L12_14))
    L8_10[L12_14]:requestRestore()
  end
  for L12_14 = 1, 6 do
    Fn_setNpcActive("ep06_poor_0" .. L12_14, true)
  end
  L9_11(L10_12, L11_13)
  L12_14 = nil
  L9_11(L10_12, L11_13, L12_14, true)
  L12_14 = nil
  L9_11(L10_12, L11_13, L12_14, true)
  L9_11(L10_12)
  L9_11(L10_12)
  L9_11()
  L9_11(L10_12)
  L9_11(L10_12)
  L9_11(L10_12)
  L9_11(L10_12)
  if L9_11 ~= true then
    L12_14 = true
    L9_11(L10_12, L11_13, L12_14)
  end
  while true do
    if L10_12 then
      if L10_12 then
        L10_12()
        L10_12(L11_13)
        L10_12()
        if L10_12 ~= nil then
          L12_14 = true
          L10_12(L11_13, L12_14)
          while true do
            if L10_12 ~= false then
              L10_12()
            end
          end
          L12_14 = false
          L10_12(L11_13, L12_14)
          L12_14 = false
          L10_12(L11_13, L12_14)
          L10_12(L11_13)
          L10_12.energy_box = nil
          L12_14 = "bg2_box_leave"
          L12_14 = L10_12
          L11_13(L12_14, true)
        end
        L10_12()
        L10_12(L11_13)
        L10_12(L11_13)
        L10_12()
        L10_12(L11_13)
        L10_12()
        L12_14 = 1
        L10_12(L11_13, L12_14)
        break
      elseif L10_12 then
        L10_12(L11_13)
        L10_12()
        L10_12(L11_13)
        L12_14 = 0
        L10_12(L11_13, L12_14)
        L12_14 = true
        L10_12(L11_13, L12_14)
        break
      end
    end
    L10_12()
  end
  L4_6 = L10_12
  L12_14 = _global
  L12_14 = L12_14.broken_box_check_task
  L10_12.broken_box_check_task = L11_13
  L12_14 = _global
  L12_14 = L12_14.check_grab_box_task
  L10_12.check_grab_box_task = L11_13
  if L10_12 ~= nil then
    L12_14 = false
    L10_12(L11_13, L12_14)
    L12_14 = false
    L10_12(L11_13, L12_14)
    L10_12(L11_13)
    L10_12.energy_box = nil
  end
  L12_14 = _global
  L12_14 = L12_14.broken_box_check_task
  L10_12.broken_box_check_task = L11_13
  L12_14 = _global
  L12_14 = L12_14.check_grab_box_task
  L10_12.check_grab_box_task = L11_13
  L10_12()
  L10_12()
  L10_12()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_shop_01_OnEnter()
  Mv_gotoNextPhase()
  subNavi(getEnergyBoxHdl())
  Fn_pcSensorOff("pccubesensor2_shop_01")
end
function box_sensorOnLeave()
  invokeTask(function()
    Fn_tutorialCaptionKill()
    wait()
    Fn_captionView("ep06_01008")
  end)
end
function box_sensorOnEnter()
  invokeTask(function()
    if not getEnergyBoxHdl():isGrabbed() then
      while Fn_isCaptionView() == true do
        wait()
      end
      Fn_tutorialCaption("grab")
    end
    Fn_captionViewEnd()
  end)
end
function pccubesensor2_up_area_01_OnEnter()
  _global.retry_select = true
  if _global.energy_box ~= nil and _global.energy_box:isGrabbed() == false then
    return false
  end
  deleteNavi(true)
  _global.up_navi = true
  addNavi(findGameObject2("Node", "locator2_navi_02"))
  invokeTask(function()
    Fn_captionView("ep06_01009")
  end)
  Fn_pcSensorOn("pccubesensor2_navi_02")
end
function pccubesensor2_low_01_OnEnter()
  _global.retry_select = true
  if _global.energy_box ~= nil and _global.energy_box:isGrabbed() == false then
    return false
  end
  deleteNavi(true)
  addNavi(findGameObject2("Node", "locator2_navi_03"))
  invokeTask(function()
    if _global.up_navi then
      Fn_captionView("ep06_01010")
    end
  end)
  Fn_pcSensorOn("pccubesensor2_navi_03")
end
function pccubesensor2_navi_03_OnEnter()
  if _global.energy_box ~= nil and _global.energy_box:isGrabbed() == false then
    return false
  end
  deleteNavi(true)
  addNavi(findGameObject2("Node", "locator2_thief_01"))
  Fn_pcSensorOff("pccubesensor2_navi_03")
  Fn_pcSensorOn("pccubesensor2_theif_01")
  invokeTask(function()
    Fn_captionView("ep06_01011")
  end)
end
function pccubesensor2_theif_01_OnEnter()
  if _global.energy_box ~= nil and _global.energy_box:isGrabbed() == false then
    return false
  end
  Fn_pcSensorOff("pccubesensor2_theif_01")
  deleteNavi(true)
  _global.box_poor = true
  _global.broken_box_check_task = Mv_safeTaskAbort(_global.broken_box_check_task)
  _global.check_grab_box_task = Mv_safeTaskAbort(_global.check_grab_box_task)
end
function pccubesensor2_navi_02_OnEnter()
  if _global.energy_box ~= nil and _global.energy_box:isGrabbed() == false then
    return false
  end
  Fn_coercionGravityRevert()
  Player:setStay(true)
  if getEnergyBoxHdl() ~= nil then
    getEnergyBoxHdl():setGrabReleasePermission(false)
  end
  deleteNavi(true)
  _global.box_end = true
  _global.broken_box_check_task = Mv_safeTaskAbort(_global.broken_box_check_task)
  _global.check_grab_box_task = Mv_safeTaskAbort(_global.check_grab_box_task)
  Player:setStay(false)
end
function pccubesensor2_box_steal_01_OnLeave()
  local L0_18
  L0_18 = {
    findGameObject2("Node", "bg2_box_01"),
    findGameObject2("Node", "bg2_box_02"),
    findGameObject2("Node", "bg2_box_03"),
    findGameObject2("Node", "bg2_box_04"),
    findGameObject2("Node", "bg2_box_05"),
    findGameObject2("Node", "bg2_box_06"),
    findGameObject2("Node", "bg2_box_07"),
    findGameObject2("Node", "bg2_box_08"),
    findGameObject2("Node", "bg2_box_09"),
    findGameObject2("Node", "bg2_box_10")
  }
  for _FORV_4_, _FORV_5_ in ipairs(L0_18) do
    if _FORV_5_:isGrabbed() then
      _global.box_steal_flag = true
      break
    end
  end
end
function pccubesensor2_warp_warning_06_OnLeave()
  local L0_19, L1_20
end
function pccubesensor2_warp_area_06_OnLeave()
  local L0_21, L1_22
end
function boxRestore()
  print("boxRestore()")
  if getEnergyBoxHdl() ~= nil then
    while getEnergyBoxHdl():isBroken() do
      getEnergyBoxHdl():requestRestoreForce()
      wait()
    end
  end
  createBoxSensor()
  start_game_obj()
  deleteNavi(false)
  _global.save_target_navi = _global.target_malti_navi
  _global.target_malti_navi = {
    getEnergyBoxHdl()
  }
  resetNavi()
  _global.target_malti_navi = _global.save_target_navi
  _global.box_sensor:setActive(true)
  Player:setGrabExceptionalObject({
    "energy_box",
    "dynamic_obj"
  })
  getEnergyBoxHdl():setIgnoreGrab(false)
  Player:setGrabObject(getEnergyBoxHdl())
  waitSeconds(0.1)
  getEnergyBoxHdl():setGrabReleaseForce(true)
  Fn_fadein()
  Fn_userCtrlOn()
end
function maltiNaviAllDelete()
  for _FORV_3_, _FORV_4_ in pairs(_global.mnavi_hdl) do
    _global.mnavi_hdl[_FORV_3_]:setActive(false)
    _global.mnavi_hdl[_FORV_3_]:del()
    _global.mnavi_hdl[_FORV_3_] = nil
  end
end
function maltiNaviCreate(A0_23)
  local L1_24
  L1_24 = A0_23.getName
  L1_24 = L1_24(A0_23)
  _global.mnavi_hdl[L1_24] = HUD:mnaviNew({
    name = "mnavi_" .. L1_24,
    PochFadeLen0 = 5,
    PochFadeLen100 = 20
  })
  _global.mnavi_hdl[L1_24]:setTarget(findGameObject2("Node", L1_24))
  _global.mnavi_hdl[L1_24]:setActive(true)
end
function addNavi(A0_25)
  for _FORV_4_, _FORV_5_ in pairs(_global.target_malti_navi) do
    if _FORV_5_ == A0_25 then
      return
    end
  end
  table.insert(_global.target_malti_navi, A0_25)
  setNavi()
end
function subNavi(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31
  L1_27 = table
  L1_27 = L1_27.maxn
  L1_27 = L1_27(L2_28)
  if L1_27 <= 0 then
    return
  end
  for L5_31, _FORV_6_ in L2_28(L3_29) do
    if _FORV_6_ == A0_26 then
      table.remove(_global.target_malti_navi, L5_31)
    end
  end
  if L1_27 == 1 then
    L2_28()
  else
    L2_28()
  end
  L2_28()
end
function deleteNavi(A0_32)
  if A0_32 then
    _global.target_malti_navi = {}
  end
  maltiNaviAllDelete()
  Fn_naviKill()
end
function resetNavi()
  if table.maxn(_global.target_malti_navi) <= 0 then
    return
  end
  maltiNaviAllDelete()
  setNavi()
end
function setNavi()
  local L0_33, L1_34, L2_35, L3_36, L4_37, L5_38
  L0_33 = table
  L0_33 = L0_33.maxn
  L0_33 = L0_33(L1_34)
  if L0_33 == 1 then
    L1_34()
    L1_34(L2_35)
  elseif L0_33 > 1 then
    L1_34()
    for L4_37, L5_38 in L1_34(L2_35) do
      maltiNaviCreate(L5_38)
    end
  end
end
function getEnergyBoxHdl()
  if _global.energy_box == nil then
    return nil
  end
  if _global.energy_box:getDynamicObject() ~= nil then
    return (_global.energy_box:getDynamicObject())
  else
    return _global.energy_box
  end
end
function createBoxSensor()
  if findGameObject2("PlayerSensor", "pcsensor_box") == nil then
    _global.box_sensor = createGameObject2("PlayerSensor")
    _global.box_sensor:setName("pcsensor_box")
    _global.box_sensor:setDetectBehavior(1)
    _global.box_sensor:addBox(Vector(5, 5, 5))
    _global.box_sensor:setPos(Vector(0, 0, 0))
    _global.box_sensor:setOnEnter("box_sensorOnEnter")
    _global.box_sensor:setOnLeave("box_sensorOnLeave")
    start_game_obj()
  else
    _global.box_sensor = findGameObject2("PlayerSensor", "pcsensor_box")
  end
  if getEnergyBoxHdl() ~= nil then
    getEnergyBoxHdl():appendChild(_global.box_sensor)
  end
  _global.box_sensor:setActive(true)
end
function removeBoxSenser()
  if findGameObject2("PlayerSensor", "pcsensor_box") ~= nil then
    _global.box_sensor:kill()
  end
end
function retryCheckWait()
  while _global.retry_flag == true do
    wait()
  end
end
