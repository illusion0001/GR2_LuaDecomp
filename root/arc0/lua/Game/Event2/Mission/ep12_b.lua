dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_puppet_crow = nil
_brain_crow = nil
_kit_end = false
_crow_end = false
_searching = false
_debug_flag = false
function Initialize()
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  HUD:inGamePreviewCreate("k_photo_neuhiraleon_02")
  while HUD:inGamePreviewIsLoading() do
    wait()
  end
  Fn_findAreaHandle("up_a_04_01"):setExpandedAabb(true)
end
function Ingame()
  Fn_setCatWarp(false)
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  if GameDatabase:get(ggd.EventFlags__ep12__flag01) == 0 then
    Player:setAction(Player.kAction_Float)
  else
    GameDatabase:set(ggd.EventFlags__ep12__flag01, 0)
  end
  Fn_missionStart()
  Fn_userCtrlOn()
  if _debug_flag then
    invokeTask(function()
      local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
      repeat
        L0_0 = Fn_sendEventComSb
        L1_1 = "requestRooftop"
        L1_1 = L0_0(L1_1)
        L2_2(L3_3)
        for L5_5 = 1, L1_1 do
          debugDispPrint(L5_5 .. " " .. tostring(L0_0[L5_5]))
        end
        L5_5 = 400
        L2_2(L3_3, L4_4, L5_5, "moveRequest : " .. tostring(Fn_sendEventComSb("moveRequest")))
        L2_2()
      until L2_2
    end)
  end
  invokeTask(function()
    Fn_missionView("ep12_01001")
    waitSeconds(1.3)
    Fn_naviSet(Fn_sendEventComSb("requestHandle", "Node", "pcspheresensor2_central_tower"))
    waitSeconds(2.5)
    Fn_captionView("ep12_01000")
  end)
  Fn_sendEventComSb("requestCentralTower", "START")
  repeat
    wait()
  until Fn_sendEventComSb("isCentralTowerSensor")
  Fn_naviKill()
  Fn_vctrlOn(Fn_sendEventComSb("requestHandle", "ViewControl", "vctrl2_central_tower"))
  Fn_kaiwaDemoView("ep12_00110k")
  Fn_vctrlOff(Fn_sendEventComSb("requestHandle", "ViewControl", "vctrl2_central_tower"))
  Fn_sendEventComSb("requestCentralTower", "END")
  _search_task = invokeTask(find_location)
  Fn_sendEventComSb("requestEntrance", "START")
  repeat
    wait()
  until Fn_sendEventComSb("isEntrance") == "END"
  Fn_naviKill()
  if _guide_timer_task ~= nil then
    _guide_timer_task:abort()
  end
  Fn_userCtrlAllOff()
  Player:setStay(true)
  Fn_vctrlOn(Fn_sendEventComSb("requestHandle", "ViewControl", "vctrl2_entrance"))
  waitSeconds(3)
  Fn_vctrlOff(Fn_sendEventComSb("requestHandle", "ViewControl", "vctrl2_entrance"))
  Fn_kaiwaDemoView("ep12_00120k")
  print("***** Entrance discovery *****")
  Fn_sendEventComSb("requestEntrance", "END")
  _search_task:abort()
  HUD:inGamePreviewExit()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function find_location()
  print("***** Find a location : SearchingTop START *****")
  Fn_sendEventComSb("crowIdling", true)
  HUD:inGamePreviewFadeIn()
  while not HUD:inGamePreviewIsIdle() do
    wait()
  end
  if not HUD:inGamePreviewIsLarge() then
    HUD:inGamePreviewChange()
  end
  while not HUD:inGamePreviewIsLarge() do
    wait()
  end
  waitSeconds(1.5)
  if HUD:inGamePreviewIsLarge() then
    HUD:inGamePreviewChange()
  end
  HUD:inGamePreviewSetInputVisible(true)
  Fn_captionViewWait("ep12_01002")
  Fn_captionViewWait("ep12_01003")
  Fn_captionViewWait("ep12_01004")
  Fn_sendEventComSb("requestCrowSafetyWarp")
  repeat
    wait()
  until Fn_sendEventComSb("isCrowMoveEnd")
  Fn_sendEventComSb("crowIdling", false)
  Fn_sendEventComSb("requestSearchingTop", "START")
  _rooftop_task = invokeTask(find_rooftop)
  repeat
    wait()
  until rooftop_check()
  print("***** Find a location : SearchingTop END *****")
  Fn_sendEventComSb("requestSearchingTop", "END")
  Fn_sendEventComSb("crowMoveclear")
  Fn_sendEventComSb("crowIdling", true)
  waitSeconds(3)
  Fn_captionView("ep12_01005")
  find_location_bottom()
end
function find_location_bottom()
  print("***** Find a location _bottom : SearchingBottom START *****")
  Fn_sendEventComSb("crowMoveVelocity", 1.3, 0.1)
  Fn_sendEventComSb("crowIdling", false)
  repeat
    wait()
  until Fn_getDistanceToPlayer(_puppet_crow) < 20
  Fn_sendEventComSb("crowMoveVelocity", 1, 0.1)
  Fn_captionViewWait("ep12_01052")
  Fn_captionViewWait("ep12_01006")
  Fn_captionViewWait("ep12_01007")
  repeat
    wait()
  until Fn_sendEventComSb("requestBottomStart")
  Fn_captionViewWait("ep12_01053")
  Fn_captionViewWait("ep12_01008")
  Fn_captionView("ep12_01009")
  Fn_sendEventComSb("requestSearchingBottom", "START")
  Fn_sendEventComSb("crowAttack", true)
  _bottom_task = invokeTask(find_bottom)
  _entrance_guide_task = invokeTask(guide_entrance)
  repeat
    wait()
  until bottom_check()
  print("***** Find a location _bottom : SearchingBottom END *****")
  Fn_sendEventComSb("requestSearchingBottom", "END")
  kit_end = true
end
_kit_cap_tbl = {
  "ep12_01010",
  "ep12_01011",
  "ep12_01012",
  "ep12_01013",
  "ep12_01014",
  "ep12_01015"
}
_kit_cap_end_tbl = {
  "ep12_01054",
  "ep12_01055",
  "ep12_01056"
}
_kit_Soliloquy_tbl = {
  "ep12_01057",
  "ep12_01058",
  "ep12_01059"
}
_corw_cap_tbl = {
  "ep12_01016",
  "ep12_01017",
  "ep12_01018",
  "ep12_01019",
  "ep12_01020",
  "ep12_01021"
}
_kit_cap_mistake_tbl = {
  "ep12_01022",
  "ep12_01023",
  "ep12_01024",
  "ep12_01025",
  "ep12_01026"
}
_check_rooftop = {}
_rooftop_end = nil
_rooftop_cap = false
function find_rooftop()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L0_6 = Fn_sendEventComSb
  L1_7 = "requestRooftop"
  L1_7 = L0_6(L1_7)
  for L5_11 = 1, L1_7 do
    L6_12 = _check_rooftop
    L6_12[L5_11] = false
  end
  L2_8(L3_9)
  L2_8(L3_9)
  L2_8(L3_9)
  L6_12 = false
  repeat
    L0_6 = L3_9
    for L6_12, _FORV_7_ in L3_9(L4_10) do
      if _check_rooftop[L6_12] == false then
        if _FORV_7_ == "player" and Fn_sendEventComSb("rooftopSensorIN", L6_12) then
          _check_rooftop[L6_12] = true
          repeat
            wait()
          until _rooftop_cap == false
          _rooftop_cap = true
          Fn_captionViewWait(_kit_cap_tbl[L6_12])
          _rooftop_cap = false
          invokeTask(function()
            L2_8[L6_12] = true
            waitSeconds(30)
            L2_8[L6_12] = false
          end)
        elseif _FORV_7_ == "_puppet_supporter_crow" then
          _check_rooftop[L6_12] = true
          if Fn_getDistanceToPlayer(_puppet_crow) < 100 then
            repeat
              wait()
            until _rooftop_cap == false
            _rooftop_cap = true
            Fn_captionViewWait(_corw_cap_tbl[L6_12])
            _rooftop_cap = false
          end
        end
      else
        if Fn_sendEventComSb("rooftopSensorIN", L6_12) and not _rooftop_cap and not L2_8[L6_12] then
          Fn_captionView(_kit_cap_end_tbl[RandI(3)])
          invokeTask(function()
            L2_8[L6_12] = true
            waitSeconds(30)
            L2_8[L6_12] = false
          end)
        else
        end
      end
    end
    L3_9()
  until L3_9 == "END"
end
function rooftop_check()
  for _FORV_3_, _FORV_4_ in pairs(_check_rooftop) do
    if not _FORV_4_ then
      return false
    end
  end
  return true
end
function mistake_check()
  local L0_13, L1_14
  L0_13 = {}
  _check_mistake = L0_13
  L0_13 = Fn_sendEventComSb
  L1_14 = "requestMistake"
  L1_14 = L0_13(L1_14)
  for _FORV_5_ = 1, L1_14 do
    _check_mistake[_FORV_5_] = false
  end
  repeat
    for _FORV_5_, _FORV_6_ in pairs(L0_13) do
      if _FORV_6_ and _check_mistake[_FORV_5_] == false then
        _check_mistake[_FORV_5_] = true
        Fn_captionViewWait(_kit_cap_mistake_tbl[_FORV_5_])
      end
    end
    wait()
  until Fn_sendEventComSb("isSearchingTop") == "END"
end
function kit_Soliloquy()
  local L0_15
  L0_15 = nil
  waitSeconds(20)
  repeat
    repeat
      L0_15 = RandI(3)
      wait()
    until L0_15 ~= 0
    if not _rooftop_cap then
      Fn_captionView(_kit_Soliloquy_tbl[L0_15])
    end
    waitSeconds(20)
  until Fn_sendEventComSb("isSearchingTop") == "END"
end
function crow_rooftop_move()
  print("***** crow_rooftop_move *****")
  Fn_sendEventComSb("requestCrowRooftopMove")
end
_bottom_cap_tbl = {
  {
    "ep12_01027",
    "ep12_01028",
    "ep12_01029"
  },
  {
    "ep12_01030",
    "ep12_01031",
    "ep12_01032"
  },
  {
    "ep12_01033",
    "ep12_01034",
    "ep12_01035"
  },
  {
    "ep12_01036",
    "ep12_01037",
    "ep12_01038"
  },
  {
    "ep12_01039",
    "ep12_01040",
    "ep12_01041"
  },
  {
    "ep12_01042",
    "ep12_01043",
    "ep12_01044"
  },
  {
    "ep12_01045",
    "ep12_01046",
    "ep12_01047"
  }
}
_hints_cap_tbl = {
  "ep12_01060",
  "ep12_01061",
  "ep12_01062",
  "ep12_01063",
  "ep12_01064"
}
_check_bottom = {}
_bottom_end = nil
_bottom_cap_lock = false
function find_bottom()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22
  L0_16 = print
  L1_17 = "***** find_bottom *****"
  L0_16(L1_17)
  L0_16 = invokeTask
  function L1_17()
    local L0_23
    L0_23 = 0
    _bottom_cap_lock = true
    Fn_captionViewWait(_hints_cap_tbl[1])
    _bottom_cap_lock = false
    repeat
      repeat
        L0_23 = RandI(5)
        wait()
      until L0_23 ~= 1
      waitSeconds(20)
      if _bottom_cap_lock == false then
        _bottom_cap_lock = true
        Fn_captionViewWait(_hints_cap_tbl[L0_23])
        _bottom_cap_lock = false
      else
        waitSeconds(10)
        if _bottom_cap_lock == false then
          _bottom_cap_lock = true
          Fn_captionViewWait(_hints_cap_tbl[L0_23])
          _bottom_cap_lock = false
        end
      end
      wait()
    until Fn_sendEventComSb("isSearchingBottom") == "END"
  end
  L0_16 = L0_16(L1_17)
  _hints_cap_task = L0_16
  L0_16 = invokeTask
  function L1_17()
    repeat
      if Fn_sendEventComSb("requestBottomAll") and false == false then
        repeat
          wait()
        until _bottom_cap_lock == false
        _bottom_cap_lock = true
        Fn_captionViewWait("ep12_01048")
        _bottom_cap_lock = false
      else
      end
      wait()
    until Fn_sendEventComSb("isSearchingBottom") == "END"
  end
  L0_16 = L0_16(L1_17)
  _outside_task = L0_16
  L0_16 = invokeTask
  function L1_17()
    repeat
      if Fn_sendEventComSb("requestBottomEnd") and false == false then
        repeat
          wait()
        until _bottom_cap_lock == false
        _bottom_cap_lock = true
        Fn_captionViewWait("ep12_01049")
        _bottom_cap_lock = false
      else
      end
      wait()
    until Fn_sendEventComSb("isSearchingBottom") == "END"
  end
  L0_16 = L0_16(L1_17)
  _outside_end_task = L0_16
  L0_16 = Fn_sendEventComSb
  L1_17 = "requestBottom"
  L1_17 = L0_16(L1_17)
  for L5_21 = 1, L1_17 do
    L6_22 = _check_bottom
    L6_22[L5_21] = false
  end
  L6_22 = false
  repeat
    L0_16 = L3_19
    for L6_22, _FORV_7_ in L3_19(L4_20) do
      if _FORV_7_ then
        if _check_bottom[L6_22] == false then
          _searching = true
          repeat
            wait()
          until _bottom_cap_lock == false
          _bottom_cap_lock = true
          Fn_captionView(_bottom_cap_tbl[L6_22][1])
          Fn_naviSet(Fn_sendEventComSb("requestHandle", "Node", string.format("pccubesensor2_bottom_%02d", L6_22)))
          waitSeconds(3)
          Fn_naviKill()
          _check_bottom[L6_22] = true
          Fn_captionViewWait(_bottom_cap_tbl[L6_22][2])
          _searching = false
          L2_18[L6_22] = true
          _caption_timer = EventHelper:timerCallback("bottom cap lock", 30, function()
            local L0_24, L1_25
            L0_24 = L6_22
            L2_18[L0_24] = false
          end)
          _bottom_cap_lock = false
        elseif not L2_18[L6_22] then
          repeat
            wait()
          until _bottom_cap_lock == false
          _bottom_cap_lock = true
          Fn_naviSet(Fn_sendEventComSb("requestHandle", "Node", string.format("pccubesensor2_bottom_%02d", L6_22)))
          Fn_captionViewWait(_bottom_cap_tbl[L6_22][3])
          Fn_naviKill()
          L2_18[L6_22] = true
          _caption_timer = EventHelper:timerCallback("bottom cap lock", 30, function()
            local L0_26, L1_27
            L0_26 = L6_22
            L2_18[L0_26] = false
          end)
          _bottom_cap_lock = false
        end
      else
        if L2_18[L6_22] then
          if _caption_timer ~= nil then
            _caption_timer:abort()
          end
          waitSeconds(10)
          L2_18[L6_22] = false
        else
        end
      end
    end
    L3_19()
  until L3_19 == "END"
end
function bottom_check()
  for _FORV_3_, _FORV_4_ in pairs(_check_bottom) do
    if not _FORV_4_ then
      return false
    end
  end
  return true
end
function guide_entrance()
  _guide_timer_task = EventHelper:timerCallback("crow_guide", 120, function()
    local L0_28, L1_29
    _crow_end = true
  end)
  repeat
    if _kit_end then
      repeat
        wait()
      until _searching == false
      _search_task:abort()
      _rooftop_task:abort()
      _bottom_task:abort()
      repeat
        wait()
      until _bottom_cap_lock == false
      _bottom_cap_lock = true
      Fn_naviKill()
      wait()
      Fn_naviSet(Fn_sendEventComSb("requestHandle", "Node", "locator2_entrance"))
      waitSeconds(2)
      Fn_captionViewWait("ep12_01050", 5)
      break
    elseif _crow_end then
      repeat
        wait()
      until _searching == false
      print("\230\142\162\231\180\162\227\129\140\231\181\130\227\130\143\227\129\163\227\129\159\227\129\139\227\130\137\227\128\129\230\156\128\231\181\130\227\130\172\227\130\164\227\131\137\232\161\168\231\164\186")
      _search_task:abort()
      _rooftop_task:abort()
      _bottom_task:abort()
      repeat
        wait()
      until _bottom_cap_lock == false
      _bottom_cap_lock = true
      Fn_naviKill()
      wait()
      Fn_sendEventComSb("crowIdling", true)
      Fn_sendEventComSb("requestCrowFollowPC", false, 5)
      repeat
        wait()
      until Fn_sendEventComSb("isCrowMoveEnd")
      Fn_sendEventComSb("requestCrowWarp", "locator2_entrance", true)
      repeat
        wait()
      until Fn_sendEventComSb("isCrowMoveEnd")
      Fn_naviSet(Fn_sendEventComSb("requestHandle", "Node", "locator2_entrance"))
      waitSeconds(2)
      Fn_captionViewWait("ep12_01051")
      break
    end
    wait()
  until false
end
function Finalize()
  if Fn_findAreaHandle("up_a_04_01") ~= nil then
    Fn_findAreaHandle("up_a_04_01"):setExpandedAabb(false)
  end
end
