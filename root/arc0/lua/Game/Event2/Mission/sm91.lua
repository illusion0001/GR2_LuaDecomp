dofile("/Game/Event2/Common/EventCommon.lua")
_point_reached = false
_mission_complete = false
_out_range_caption_task = nil
_out_range_caption = false
_client_name = "sm91_client"
_client_pup = nil
_area_navi = nil
_hint_caption = true
_client_kaiwa_end = false
_client_kaiwa_on = false
_navi = {target = nil, dist = 0}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_findNpcPuppet
  L1_1 = _client_name
  L0_0 = L0_0(L1_1)
  _client_pup = L0_0
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "locator2_photo_01")
  _photo_node = L0_0
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "locator2_area_navi_01")
  _area_navi = L0_0
  L0_0 = Fn_setKaiwaDemo
  L1_1 = _client_pup
  L0_0(L1_1, "sm91_00200k", nil, true)
  L0_0 = Fn_disableKaiwaDemo
  L1_1 = _client_pup
  L0_0(L1_1)
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "locator2_sagashi_a_01")
  L1_1 = createGameObject2
  L1_1 = L1_1("TerrainBg")
  L1_1:setModelName("sagashi_a_01")
  L0_0:appendChild(L1_1)
end
function Ingame()
  local L0_2, L1_3, L2_4
  L0_2 = findGameObject2
  L1_3 = "Node"
  L2_4 = "locator2_area_01"
  L0_2 = L0_2(L1_3, L2_4)
  function L1_3()
    local L0_5, L1_6
    _mission_complete = true
    _client_kaiwa_end = true
    _client_kaiwa_on = false
  end
  function L2_4()
    local L0_7, L1_8
    _client_kaiwa_end = true
    _client_kaiwa_on = false
  end
  _photo = Photo.create(kPHOTO_CAPTION_ON, kPHOTO_TYPE_ONCE, true, {near = 3.8, far = 18}, nil, "sm91_user_photo")
  _photo:set(_photo_node)
  Fn_missionStart()
  Fn_turnNpc(_client_name)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm91_00100k")
  if not Fn_isInSightTarget(L0_2, 0.3) then
    invokeTask(function()
      local L0_9
      L0_9 = L0_2
      L0_9 = L0_9.getWorldPos
      L0_9 = L0_9(L0_9)
      L0_9.y = L0_9.y - 2
      for _FORV_4_ = 1, 60 do
        Camera:setViewControlTarget(L0_9)
        wait()
      end
    end)
    Fn_captionViewWait("sm91_00200")
  end
  Fn_sideMissionStartView({
    view = {mission_target = "sm91_00100"}
  })
  invokeTask(function()
    repeat
      if _navi.target then
        if distanceBetweenPlayer(_navi.target) < _navi.dist then
          _navi.target = nil
        else
          Fn_naviSet(_navi.target)
        end
      else
        Fn_naviKill()
      end
      wait(10)
    until _mission_complete
    Fn_naviKill()
  end)
  photoReachedWait()
  invokeTask(function()
    local L0_10, L1_11, L2_12, L3_13
    for L3_13 = 1, 60 do
      Camera:setViewControlTarget(_photo_node:getWorldPos())
      wait()
    end
  end)
  Fn_captionViewWait("sm91_00210")
  repeat
    wait()
  until not HUD:captionGetTextId()
  _hint_caption = false
  HUD:info("sm91_info_01", true, 15)
  wait(3)
  invokeTask(function()
    repeat
      _photo:run()
      repeat
        wait()
      until not _photo:isRunning()
      _client_kaiwa_end = false
      if _photo:getPhotoState() == kPHOTO_OK then
        Fn_changeKaiwaDemo(_client_pup, "sm91_00200k", L1_3, true)
        Fn_enableKaiwaDemo(_client_pup)
        Sound:pulse("success")
        waitSeconds(0.5)
        Fn_captionViewWait("sm91_00260")
        HUD:setPhotoMode(false)
      elseif _photo:getPhotoState() == kPHOTO_NEAR then
        Fn_captionViewWait("sm91_00220")
        Fn_changeKaiwaDemo(_client_pup, "sm91_00300k", L2_4, true)
        Fn_enableKaiwaDemo(_client_pup)
      elseif _photo:getPhotoState() == kPHOTO_FAR then
        Fn_captionViewWait("sm91_00230")
        Fn_changeKaiwaDemo(_client_pup, "sm91_00400k", L2_4, true)
        Fn_enableKaiwaDemo(_client_pup)
      elseif _photo:getPhotoState() == kPHOTO_ANGLE then
        Fn_captionViewWait("sm91_00240")
        Fn_changeKaiwaDemo(_client_pup, "sm91_00500k", L2_4, true)
        Fn_enableKaiwaDemo(_client_pup)
      else
        Fn_captionViewWait("sm91_00250")
        Fn_changeKaiwaDemo(_client_pup, "sm91_00600k", L2_4, true)
        Fn_enableKaiwaDemo(_client_pup)
      end
      _client_kaiwa_on = true
      _photo:param(nil, nil, false)
    until _photo:getPhotoState() == kPHOTO_OK
  end)
  repeat
    repeat
      wait()
    until _client_kaiwa_on
    _navi.target = _client_pup
    _navi.dist = 10
    repeat
      wait()
    until _client_kaiwa_end
    if not _mission_complete then
      _navi.target = _photo_node
      _navi.dist = 30
    end
  until _mission_complete
  clientAction():abort()
  waitSeconds(0.5)
  postProcessing()
  Sound:pulse("mission_clear")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_14, L1_15
end
function photoReachedWait()
  local L1_16
  L1_16 = false
  while not L1_16 do
    if _point_reached then
      if not (0 > 30) then
        if Fn_isInSightTarget(_photo_node, 0.7) then
        else
        end
        wait()
      end
    end
  end
end
function pccubesensor2_island_caption_OnEnter(A0_17)
  A0_17:setActive(false)
  Fn_pcSensorOn("pccubesensor2_island_in")
  Fn_pcSensorOn("pccubesensor2_island_out")
  Fn_captionView("sm91_00205")
end
function pccubesensor2_island_in_OnEnter()
  if _navi.target == _area_navi then
    _navi.target = nil
    if _hint_caption then
      Fn_captionView("sm91_00207")
    end
  end
end
function pccubesensor2_island_out_OnLeave()
  if _navi.target ~= _client_pup then
    _navi.target = _area_navi
    _navi.dist = 0
    if _hint_caption then
      Fn_captionView("sm91_00206")
    end
  end
end
function pccubesensor2_reached_OnEnter()
  local L0_18, L1_19
  _point_reached = true
end
function pccubesensor2_reached_OnLeave()
  local L0_20, L1_21
  _point_reached = false
end
function pccubesensor2_outrange_OnEnter()
  if not _out_range_caption_task then
    _out_range_caption_task = invokeTask(function()
      waitSeconds(10)
      _out_range_caption = true
      _out_range_caption_task = nil
    end)
  end
end
function pccubesensor2_outrange_OnLeave()
  if _navi.target ~= _client_pup then
    _navi.target = _area_navi
    _navi.dist = 100
    if _out_range_caption then
      _out_range_caption = false
      if RandI(1, 2) == 1 then
        Fn_captionView("sm91_00500")
      else
        Fn_captionView("sm91_00510")
      end
    end
  end
end
function clientAction()
  return invokeTask(function()
    local L0_22, L1_23, L2_24
    L0_22 = Fn_findNpc
    L1_23 = _client_name
    L0_22 = L0_22(L1_23)
    L1_23 = nil
    L2_24 = false
    while true do
      if distanceBetweenPlayer(_client_pup) < 4 then
        if not L0_22:isInSight() and not L1_23 and not L2_24 then
          L1_23 = invokeTask(function()
            waitSeconds(1.5)
            L2_24 = true
            L1_23 = nil
          end)
        end
        if L2_24 then
          L0_22:setTurnParam(80)
          L0_22:setSightParam({degree_h = 110})
          Fn_turnNpc(_client_name)
        end
      elseif Fn_getDistanceToPlayer(_client_pup) > 6 then
        L2_24 = false
        if L1_23 ~= nil and L1_23:isRunning() then
          L1_23:abort()
          L1_23 = nil
        end
        L0_22:resetDirection()
        L0_22:resetSightParam()
        L0_22:resetTurnParam()
        Fn_playMotionNpc(_client_name, "stay")
      end
      wait(5)
    end
  end)
end
function postProcessing()
  local L0_25, L1_26
  L0_25 = Fn_getGameObject
  L1_26 = "mother2"
  L0_25 = L0_25(L1_26)
  L1_26 = "sm91_b"
  L0_25:createSandbox2(L1_26):setString("g_filename", "/Game/Event2/Mission/" .. L1_26 .. ".lua")
  L0_25:createSandbox2(L1_26):try_init()
  L0_25:createSandbox2(L1_26):waitForReady()
  L0_25:createSandbox2(L1_26):setGameObject("mother2", L0_25)
  L0_25:createSandbox2(L1_26):setGameObject("eventManager", Fn_getGameObject("eventManager"))
  L0_25:createSandbox2(L1_26):setGameObject("bgManager", Fn_getGameObject("bgManager"))
  L0_25:createSandbox2(L1_26):setGameObject("npcManager", Fn_getGameObject("npcManager"))
  L0_25:createSandbox2(L1_26):try_start()
  while not L0_25:createSandbox2(L1_26):sendEvent("isInitialized") do
    wait()
  end
  L0_25:createSandbox2(L1_26):sendEvent("startGameObjects")
  L0_25:createSandbox2(L1_26):sendEvent("sbRun")
end
