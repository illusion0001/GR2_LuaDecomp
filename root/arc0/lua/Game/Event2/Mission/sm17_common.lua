BAG_NEAR_DISTANT = 3
BAG_FAR_DISTANT = 9
MOB_PANIC_TIME = 10
GUIDE_CAPTION_INTERVAL = 30
L0_0 = {}
L0_0.MIDDLE = 0
L0_0.NEAR = 1
L0_0.FAR = 2
BAG_DISTANT = L0_0
L0_0 = {
  "bag_01",
  "bag_01_dynamic"
}
GRAB_PERMIT_NAME = L0_0
L0_0 = {}
L0_0.bag_hdl = nil
L0_0.bag_caption_sensor = nil
L0_0.nasty_effect_hdl = nil
L0_0.bag_distant_state = BAG_DISTANT.MIDDLE
L0_0.patience_point = 0
L0_0.is_box_navi_setted = false
L0_0.is_release_caption = false
L0_0.now_retry = false
L0_0.prev_is_grabbed = false
L0_0.is_display_carry_guide = false
L0_0.remain_mob_panic_disable = 0
_mission_data = L0_0
_now_patience_param = nil
_rest_caption_task = nil
_guide_caption_task = nil
L0_0 = GUIDE_CAPTION_INTERVAL
_guide_caption_timer = L0_0
_goal_navi_locator = nil
_create_gem_task = nil
L0_0 = {}
_created_gem_tbl = L0_0
_is_create_task_permit = false
_catwarp_sensor_01 = nil
_catwarp_sensor_02 = nil
_catwarp_sensor_03 = nil
_is_area_distant = false
_is_goal_distant = false
_is_catwarp = false
_is_panic = false
function L0_0(A0_1, A1_2)
  deleteBox()
  createBox(A0_1)
  createBoxSensor()
  if A1_2 then
    Fn_naviSet(_mission_data.bag_hdl)
    _mission_data.is_box_navi_setted = true
  end
end
createBoxSensorNavi = L0_0
function L0_0()
  local L0_3
  L0_3 = _mission_data
  L0_3 = L0_3.bag_hdl
  if L0_3 ~= nil then
    L0_3 = _mission_data
    L0_3 = L0_3.bag_hdl
    L0_3 = L0_3.getDynamicObject
    L0_3 = L0_3(L0_3)
    L0_3 = Mv_safeObjectKill(L0_3)
    _mission_data.bag_hdl = Mv_safeObjectKill(_mission_data.bag_hdl)
    _mission_data.nasty_effect_hdl = Mv_safeObjectKill(_mission_data.nasty_effect_hdl)
  end
end
deleteBox = L0_0
function L0_0(A0_4)
  _mission_data.bag_hdl = Fn_createGimmickBg(A0_4, "bag_01", "box_ms_02", true, "box_ms_02_event_03")
  _mission_data.bag_hdl:switchGravityGrabAsWeapon(false)
  _mission_data.nasty_effect_hdl = Fn_createEffect("nasty_effect", "ef_ev_smk_05", _mission_data.bag_hdl, true)
  _mission_data.bag_hdl:setEventListener("judge", judgeCallback)
  _mission_data.bag_hdl:setEventListener("dynamic", function(A0_5)
    local L1_6, L2_7
    L2_7 = A0_5
    L1_6 = A0_5.getDynamicObject
    L1_6 = L1_6(L2_7)
    L2_7 = L1_6
    L1_6 = L1_6.appendChild
    L1_6(L2_7, _mission_data.nasty_effect_hdl)
    L2_7 = A0_5
    L1_6 = A0_5.getDynamicObject
    L1_6 = L1_6(L2_7)
    L2_7 = L1_6
    L1_6 = L1_6.setName
    L1_6(L2_7, "bag_01_dynamic")
    L2_7 = A0_5
    L1_6 = A0_5.setEventListener
    L1_6(L2_7, "judge", nil)
    L2_7 = A0_5
    L1_6 = A0_5.getDynamicObject
    L1_6 = L1_6(L2_7)
    function L2_7(A0_8, A1_9, A2_10, A3_11)
      return judgeCallback(A0_8, A1_9, A2_10, A3_11)
    end
    L1_6:setEventListener("judge", L2_7)
    if _mission_data.is_box_navi_setted and A0_5:isGrabbed() == false then
      Fn_naviSet(A0_5:getDynamicObject())
    end
    _mission_data.is_box_navi_setted = false
  end)
end
createBox = L0_0
function L0_0(A0_12, A1_13, A2_14, A3_15)
  if A3_15:getName() ~= nil then
    print("\230\148\187\230\146\131\227\129\151\227\129\159\227\130\132\227\129\164", A3_15:getName())
    if A3_15:getName() == "player" then
      print("\231\174\177\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\154\233\128\154\229\184\184\229\135\166\231\144\134 sender:" .. A3_15:getName())
      return 3
    else
      print("\231\174\177\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\154\227\130\164\227\131\153\227\131\179\227\131\136\231\132\161\232\166\150 sender:" .. A3_15:getName())
      return 0
    end
  else
    print("\231\174\177\227\129\140\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\154sender:getName\227\129\140nil")
    return 3
  end
end
judgeCallback = L0_0
function L0_0(A0_16, A1_17, A2_18)
  _catwarp_sensor_01 = A0_16
  _catwarp_sensor_02 = A1_17
  _catwarp_sensor_03 = A2_18
end
appendCatsensor = L0_0
function L0_0()
  Fn_pcSensorOff(_catwarp_sensor_01)
  Fn_pcSensorOff(_catwarp_sensor_02)
  Fn_pcSensorOff(_catwarp_sensor_03)
end
appendedSensorOff = L0_0
function L0_0()
  Fn_pcSensorOn(_catwarp_sensor_01)
  Fn_pcSensorOn(_catwarp_sensor_02)
  Fn_pcSensorOn(_catwarp_sensor_03)
end
appendedSensorOn = L0_0
function L0_0(A0_19, A1_20)
  invokeTask(function()
    print("================\232\173\166\229\145\138\227\130\168\227\131\170\227\130\162\231\170\129\231\160\180================")
    Player:setStay(true)
    if A0_19 ~= nil then
      Fn_naviSet(findGameObject2("Node", A0_19))
    end
    if A1_20 ~= nil then
      Fn_captionViewLock(A1_20)
    else
      Fn_captionViewLock("sm17_09000")
    end
    Player:setStay(false)
  end)
end
warningCatWarp = L0_0
function L0_0(A0_21, A1_22)
  invokeTask(function()
    print("================\232\173\166\229\145\138\227\130\168\227\131\170\227\130\162\231\170\129\231\160\180================")
    Player:setStay(true)
    if A0_21 ~= nil then
      Fn_naviSet(findGameObject2("Node", A0_21))
    end
    if A1_22 ~= nil then
      Fn_captionViewLock(A1_22)
    else
      Fn_captionViewLock("sm17_09001")
    end
    Player:setStay(false)
  end)
end
warningInductionCatWarp = L0_0
function L0_0(A0_23)
  task = invokeTask(function()
    while true do
      if _is_area_distant then
        _guide_caption_timer = GUIDE_CAPTION_INTERVAL
        if getBaggageHandle() ~= nil then
          if type(getBaggageHandle()) == "string" then
            Fn_naviSet(findGameObject2("Node", getBaggageHandle()))
          else
            Fn_naviSet(getBaggageHandle())
          end
        end
        Fn_captionViewWait(A0_23)
        while _is_area_distant do
          wait()
        end
      end
      wait()
    end
  end)
  return task
end
warningAreaDistant = L0_0
function L0_0(A0_24)
  task = invokeTask(function()
    while true do
      if _is_goal_distant then
        _guide_caption_timer = GUIDE_CAPTION_INTERVAL
        Fn_captionViewWait(A0_24)
        while _is_goal_distant do
          wait()
        end
      end
      wait()
    end
  end)
  return task
end
warningGoalDistant = L0_0
function L0_0(A0_25)
  local L1_26
  _is_goal_distant = A0_25
end
goalDistanceSet = L0_0
function L0_0()
  warningInductionCatWarp(_mission_data.bag_hdl)
end
pccubesensor2_area_distant_OnLeave = L0_0
function L0_0()
  local L0_27, L1_28
end
pccubesensor2_area_distant_OnEnter = L0_0
function L0_0()
  local L0_29, L1_30
end
pccubesensor2_catwarp_a_01_OnLeave = L0_0
function L0_0()
  local L0_31, L1_32
end
pccubesensor2_catwarp_a_02_OnLeave = L0_0
function L0_0()
  local L0_33, L1_34
  _is_area_distant = true
end
pccubesensor2_area_c_distant_OnLeave = L0_0
function L0_0()
  local L0_35, L1_36
  _is_area_distant = false
end
pccubesensor2_area_c_distant_OnEnter = L0_0
function L0_0()
  warningCatWarp(_mission_data.bag_hdl)
end
pccubesensor2_catwarp_c_01_OnLeave = L0_0
function L0_0()
  invokeTask(function()
    Fn_catWarp()
  end)
end
pccubesensor2_catwarp_c_02_OnLeave = L0_0
function L0_0()
  if findGameObject2("PlayerSensor", "bag_caption_sensor") == nil then
    _mission_data.bag_caption_sensor = createGameObject2("PlayerSensor")
    _mission_data.bag_caption_sensor:setName("bag_caption_sensor")
    _mission_data.bag_caption_sensor:setDetectBehavior(1)
    _mission_data.bag_caption_sensor:setFilterType("Player")
    _mission_data.bag_caption_sensor:addBox(Vector(3, 3, 3))
    _mission_data.bag_caption_sensor:setOnEnter("bag_caption_sensor_OnEnter")
    _mission_data.bag_caption_sensor:setOnLeave("bag_caption_sensor_OnLeave")
    start_game_obj()
  else
    _mission_data.bag_caption_sensor = findGameObject2("PlayerSensor", "bag_caption_sensor")
  end
  getBaggageHandle():appendChild(_mission_data.bag_caption_sensor)
  _mission_data.bag_caption_sensor:setActive(true)
end
createBoxSensor = L0_0
function L0_0()
  if not _mission_data.now_retry and not _mission_data.is_release_caption and _mission_data.is_display_carry_guide then
    Fn_tutorialCaption("grab")
  end
end
bag_caption_sensor_OnEnter = L0_0
function L0_0()
  if not _mission_data.is_release_caption then
    Fn_tutorialCaptionKill()
  end
end
bag_caption_sensor_OnLeave = L0_0
function L0_0(A0_37)
  repeat
    A0_37()
    repeat
      if _mission_data.bag_hdl:isBroken() == true then
        _mission_data.now_retry = true
        print("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\232\141\183\231\137\169\227\129\140\229\163\138\227\130\140\227\129\159")
        Fn_naviKill()
        Fn_captionViewWait("sm17_00104")
        retry()
        repeat
          wait()
        until not _mission_data.now_retry
        break
      end
      wait()
    until _mission_data.bag_hdl:isGrabbed()
  until _mission_data.bag_hdl:isGrabbed()
  Fn_naviKill()
  _mission_data.is_box_navi_setted = false
  boxGrab(false)
end
waitBagGrab = L0_0
function L0_0(A0_38)
  HUD:miniGaugeSetVisible(true)
  HUD:miniGaugeSetNum(_mission_data.patience_point / A0_38.MAX)
  HUD:miniGaugeSetTextID("sm17_00001")
end
patienceGaugeOn = L0_0
function L0_0()
  local L0_39, L1_40
  L0_39 = _now_patience_param
  return L0_39
end
getNowPatienceParam = L0_0
function L0_0(A0_41)
  local L1_42
  L1_42 = print
  L1_42("\230\136\145\230\133\162\229\186\166\230\147\141\228\189\156\227\129\168\227\131\170\227\131\136\227\131\169\227\130\164\229\136\164\229\174\154\227\130\191\227\130\185\227\130\175\228\189\156\230\136\144 \230\136\145\230\133\162\229\186\166\229\162\151\229\138\160\229\128\164:", A0_41.UP)
  _now_patience_param = A0_41
  L1_42 = true
  return invokeTask(function()
    repeat
      HUD:miniGaugeSetNum(_mission_data.patience_point / A0_41.MAX)
      _mission_data.bag_distant_state = getBagDistantState()
      if _mission_data.bag_hdl:isGrabbed() == true then
        if L1_42 then
          appendedSensorOff()
          L1_42 = false
        end
        if _create_gem_task == nil then
          _create_gem_task = create_energy_gem(40)
        end
      else
        L1_42 = true
      end
      if _mission_data.bag_distant_state == BAG_DISTANT.NEAR or _mission_data.bag_hdl:isGrabbed() == true then
        _mission_data.patience_point = _mission_data.patience_point + A0_41.UP
        if _mission_data.patience_point > A0_41.MAX then
          _mission_data.patience_point = A0_41.MAX
        end
      end
      if _mission_data.remain_mob_panic_disable > 0 then
        _mission_data.remain_mob_panic_disable = _mission_data.remain_mob_panic_disable - gameTickToSecond(1)
        if _mission_data.remain_mob_panic_disable <= 0 then
          print("\227\131\162\227\131\150\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164")
          Mob:makeSituationPanic(false)
          _is_panic = false
        end
      end
      if _mission_data.patience_point >= A0_41.MAX then
        _mission_data.now_retry = true
        print("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\230\136\145\230\133\162\229\186\166MAX")
        Fn_captionViewWait("sm17_00105")
        retry()
      elseif _mission_data.bag_hdl ~= nil and _mission_data.bag_hdl:isGrabbed() == true then
        if _mission_data.prev_is_grabbed == false then
          boxGrab(true)
        end
        abortNotGrabCaptionTask()
      else
        if _mission_data.bag_hdl == nil then
          print("\232\141\183\231\137\169\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\140nil\227\129\171\227\129\170\227\129\163\227\129\159\239\188\136\232\191\145\227\129\143\227\129\167\233\135\141\229\138\155\231\138\182\230\133\139\227\129\171\227\129\170\227\129\163\227\129\159\227\129\130\227\129\168\232\141\183\231\137\169\227\129\140\232\144\189\228\184\139\227\129\151\227\129\159\227\129\170\227\129\169\239\188\137")
        elseif _mission_data.bag_hdl:isBroken() == true then
          print("\232\141\183\231\137\169\227\129\140\229\163\138\227\130\140\227\129\159")
        end
        if true then
          _mission_data.now_retry = true
          print("\227\131\170\227\131\136\227\131\169\227\130\164\239\188\154\232\141\183\231\137\169\227\129\140\229\163\138\227\130\140\227\129\159")
          if _is_catwarp then
            catwarpRetry()
          else
            Fn_naviKill()
            Fn_captionViewWait("sm17_00104")
            retry()
          end
        else
          if _mission_data.bag_distant_state ~= BAG_DISTANT.NEAR then
            _mission_data.patience_point = _mission_data.patience_point - A0_41.DOWN
            if _mission_data.patience_point < 0 then
              _mission_data.patience_point = 0
            end
          end
          if _mission_data.prev_is_grabbed == true then
            boxRelease()
            if _mission_data.is_display_carry_guide then
              createNotGrabCaptionTask()
            end
          end
        end
      end
      if _mission_data.bag_hdl == nil then
        _mission_data.prev_is_grabbed = false
      else
        _mission_data.prev_is_grabbed = _mission_data.bag_hdl:isGrabbed()
      end
      wait()
    until false
  end)
end
createCarryTask = L0_0
function L0_0()
  if not _mission_data.is_box_navi_setted then
    Fn_naviSet(getBaggageHandle())
    _mission_data.is_box_navi_setted = true
  end
  createBoxSensor()
  print("panic\232\168\173\229\174\154")
  Mob:makeSituationPanic(true)
  _mission_data.remain_mob_panic_disable = MOB_PANIC_TIME
  _is_panic = true
end
boxRelease = L0_0
function L0_0(A0_43)
  if A0_43 then
    Mob:makeSituationPanic(true)
    _mission_data.remain_mob_panic_disable = MOB_PANIC_TIME
    _is_panic = true
    print("panic\239\188\129")
  else
    Mob:makeSituationPanic(false)
    _is_panic = false
    print("\233\157\158panic")
  end
end
mobToPanic = L0_0
function L0_0()
  local L0_44, L1_45
  L0_44 = _is_panic
  return L0_44
end
isMobPanic = L0_0
function L0_0()
  if _mission_data.bag_hdl == nil then
    return nil
  end
  if _mission_data.bag_hdl:getDynamicObject() ~= nil then
    return (_mission_data.bag_hdl:getDynamicObject())
  else
    return _mission_data.bag_hdl
  end
end
getBaggageHandle = L0_0
function L0_0()
  local L0_46
  L0_46 = Fn_getDistanceToPlayer
  L0_46 = L0_46(getBaggageHandle())
  if L0_46 <= BAG_NEAR_DISTANT then
    return BAG_DISTANT.NEAR
  elseif L0_46 >= BAG_FAR_DISTANT then
    return BAG_DISTANT.FAR
  else
    return BAG_DISTANT.MIDDLE
  end
end
getBagDistantState = L0_0
function L0_0()
  if _rest_caption_task ~= nil then
    abortNotGrabCaptionTask()
  end
  _rest_caption_task = invokeTask(function()
    while _mission_data.bag_distant_state == BAG_DISTANT.NEAR do
      wait()
    end
    if not _mission_data.is_display_carry_guide then
      return
    end
    if _mission_data.now_retry == false and _mission_data.bag_hdl:isGrabbed() == false then
      Fn_tutorialCaptionKill()
      _create_gem_task = Mv_safeTaskAbort(_create_gem_task)
      _mission_data.is_release_caption = true
      Sound:playSE("kit_588", 1, "")
      Fn_captionViewWait("sm17_00102")
      _mission_data.is_release_caption = false
      while _mission_data.patience_point > 0 do
        wait()
      end
      if _mission_data.now_retry == false and _mission_data.bag_hdl:isGrabbed() == false then
        _mission_data.is_release_caption = true
        Fn_captionViewWait("sm17_00103")
      end
      _mission_data.is_release_caption = false
      if 1 <= findGameObject2("PlayerSensor", "bag_caption_sensor"):getCount() then
        Fn_tutorialCaption("grab")
      end
      createGuideCaptionTask()
    end
  end)
end
createNotGrabCaptionTask = L0_0
function L0_0()
  _guide_caption_task = Mv_safeTaskAbort(_guide_caption_task)
  _guide_caption_task = invokeTask(function()
    _guide_caption_timer = GUIDE_CAPTION_INTERVAL
    repeat
      if _mission_data.now_retry == false and _mission_data.bag_hdl ~= nil and _mission_data.bag_hdl:isGrabbed() == false then
        if _guide_caption_timer > 0 then
          _guide_caption_timer = _guide_caption_timer - gameTickToSecond(1)
        end
        if _guide_caption_timer <= 0 then
          Fn_captionViewWait("sm17_00107")
          Fn_naviSet(getBaggageHandle())
          _guide_caption_timer = GUIDE_CAPTION_INTERVAL
        end
      end
      wait()
    until false
  end)
end
createGuideCaptionTask = L0_0
function L0_0()
  if _rest_caption_task ~= nil then
    _rest_caption_task = Mv_safeTaskAbort(_rest_caption_task)
  end
  if _guide_caption_task ~= nil then
    _guide_caption_task = Mv_safeTaskAbort(_guide_caption_task)
  end
end
abortNotGrabCaptionTask = L0_0
function L0_0()
  _create_gem_task = Mv_safeTaskAbort(_create_gem_task)
  for _FORV_3_, _FORV_4_ in pairs(_created_gem_tbl) do
    _FORV_4_:try_term()
  end
  Fn_userCtrlOff()
  abortNotGrabCaptionTask()
  Fn_naviKill()
  if _mission_data.bag_hdl ~= nil then
    _mission_data.bag_hdl:setGrabReleaseForce(true)
  end
  _mission_data.patience_point = 0
  HUD:miniGaugeSetNum(_mission_data.patience_point)
  print("panic\232\168\173\229\174\154")
  Mob:makeSituationPanic(true)
  _mission_data.remain_mob_panic_disable = MOB_PANIC_TIME
  _is_panic = true
end
retryCommon = L0_0
function L0_0(A0_47, A1_48)
  _mission_data.is_display_carry_guide = false
  invokeTask(function()
    repeat
      wait()
    until not Mv_isSafeTaskRunning(A0_47)
    _mission_data.is_display_carry_guide = true
    if A1_48 ~= false then
      createGuideCaptionTask()
    end
  end)
end
createStopGuideCaptionTask = L0_0
function L0_0(A0_49)
  local L1_50
  _goal_navi_locator = A0_49
  _is_create_task_permit = true
end
init_create_enemy_gem = L0_0
function L0_0()
  _is_create_task_permit = false
  _create_gem_task = Mv_safeTaskAbort(_create_gem_task)
end
stop_create_enemy_gem = L0_0
function L0_0(A0_51)
  local L1_52
  L1_52 = findGameObject2
  L1_52 = L1_52("Node", _goal_navi_locator)
  node_hdl = L1_52
  L1_52 = nil
  if _is_create_task_permit then
    L1_52 = invokeTask(function()
      local L0_53, L1_54, L2_55, L3_56, L4_57
      while true do
        L0_53 = waitSeconds
        L1_54 = 15
        L0_53(L1_54)
        L0_53 = node_hdl
        L1_54 = L0_53
        L0_53 = L0_53.getWorldPos
        L0_53 = L0_53(L1_54)
        L1_54 = Fn_getPcPosRot
        L2_55 = L1_54()
        L3_56 = L1_54.y
        L3_56 = L3_56 + 1.5
        L1_54.y = L3_56
        L3_56 = Query
        L4_57 = L3_56
        L3_56 = L3_56.setEyeSightTransform
        L3_56(L4_57, L1_54, L2_55)
        L3_56 = Query
        L4_57 = L3_56
        L3_56 = L3_56.setEyeSightAngle
        L3_56(L4_57, Deg2Rad(360))
        L3_56 = Query
        L4_57 = L3_56
        L3_56 = L3_56.setEyeSightRange
        L3_56(L4_57, A0_51)
        L3_56 = Query
        L4_57 = L3_56
        L3_56 = L3_56.raycastEyeSight
        L3_56 = L3_56(L4_57, L0_53)
        if L3_56 == nil then
          L3_56 = createGameObject2
          L4_57 = "Gem"
          L3_56 = L3_56(L4_57)
          L4_57 = L3_56.setGemModelNo
          L4_57(L3_56, 4)
          L4_57 = NormalizeVector
          L4_57 = L4_57(L0_53 - L1_54)
          L4_57 = L4_57 * A0_51
          L4_57 = L1_54 + L4_57
          L3_56:setWorldPos(L4_57)
          L3_56:try_init()
          L3_56:waitForReady()
          L3_56:try_start()
          table.insert(_created_gem_tbl, L3_56)
        end
        L3_56 = wait
        L3_56()
      end
    end)
  end
  return L1_52
end
create_energy_gem = L0_0
function L0_0(A0_58)
  local L1_59
  _is_catwarp = A0_58
end
setIsCatwarp = L0_0
