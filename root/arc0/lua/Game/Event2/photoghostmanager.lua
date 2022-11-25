import("GameDatabase")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/NetworkCommon.lua")
dofile("/Game/Event2/Common/SystemScriptCommon.lua")
_exit_sandbox = false
_pg_active = false
_pg_update = false
_pg_create = false
_event_data = {}
_pg_data = {
  auto = {
    ghost = nil,
    node = nil,
    sensor = nil,
    marker = nil
  },
  manual = {
    ghost = nil,
    node = nil,
    sensor = nil,
    marker = nil
  }
}
_pg_info = {
  {auto = nil, manual = nil},
  {auto = nil, manual = nil},
  {auto = nil, manual = nil},
  {auto = nil, manual = nil},
  {auto = nil, manual = nil},
  {auto = nil, manual = nil},
  {auto = nil, manual = nil},
  {auto = nil, manual = nil}
}
function main()
  debugDisp()
  invokeSystemTask(photoghostManagement)
  wait()
end
function photoghostManagement()
  local L0_0, L1_1, L2_2, L3_3
  L0_0, L1_1 = nil, nil
  function L2_2(A0_4)
    local L1_5, L2_6
    L1_5 = _pg_info
    L2_6 = L0_0
    L1_5 = L1_5[L2_6]
    L1_5 = L1_5[A0_4]
    if L1_5 ~= nil then
      L1_5 = _pg_info
      L2_6 = L0_0
      L1_5 = L1_5[L2_6]
      L1_5 = L1_5[A0_4]
      L1_5 = L1_5.area
      if L1_5 == "locator2_photoghost" then
        L1_5 = "cc_a_root"
      end
      L2_6 = Fn_findAreaHandle
      L2_6 = L2_6(L1_5)
      if L2_6 ~= nil and _pg_info[L0_0][A0_4] ~= nil then
        setPhotoGhost(A0_4, L0_0, L2_6)
        HUD:menuSetCallback(HUD.kCallback_DeletePhotoGhost, timeUpPhotoGhost)
      end
    end
  end
  createPhotoGhost = L2_2
  L2_2 = invokeTask
  function L3_3()
    while _exit_sandbox == false do
      if _pg_active == true and _pg_update == true and L0_0 ~= nil then
        if _pg_info[L0_0].auto == nil then
          _pg_info[L0_0].auto = HUD:getPhotoGhostInfo(L0_0, HUD.kPhotoReviewSlot_Auto)
          createPhotoGhost("auto")
        end
        if _pg_info[L0_0].manual == nil then
          _pg_info[L0_0].manual = HUD:getPhotoGhostInfo(L0_0, HUD.kPhotoReviewSlot_Manual)
          createPhotoGhost("manual")
        end
        if _pg_info[L0_0].auto ~= nil and _pg_info[L0_0].manual ~= nil then
          _pg_update = false
        end
      end
      wait()
    end
  end
  L2_2 = L2_2(L3_3)
  while true do
    L3_3 = _exit_sandbox
    if L3_3 == false then
      L3_3 = setPGActive
      L3_3()
      L3_3 = _pg_active
      if L3_3 == true then
        L3_3 = Player
        L3_3 = L3_3.getRecentAreaName
        L3_3 = L3_3(L3_3)
        if L3_3 ~= nil then
          L0_0 = getAreaNameToId(L3_3)
          if L0_0 ~= nil and L1_1 ~= L0_0 then
            _pg_update = false
            wait()
            HUD:uploadPhotoGhost()
            killPhotoGhost("auto")
            killPhotoGhost("manual")
            if L1_1 ~= nil then
              _pg_info[L1_1].auto = nil
              _pg_info[L1_1].manual = nil
            end
            _pg_update = true
            L1_1 = L0_0
          end
        end
      end
      L3_3 = waitSecondsActive
      L3_3(1)
    end
  end
  if L2_2 ~= nil then
    L3_3 = L2_2.isRunning
    L3_3 = L3_3(L2_2)
    if L3_3 == true then
      L3_3 = L2_2.abort
      L3_3(L2_2)
    end
  end
  L2_2 = nil
end
function waitSecondsActive(A0_7)
  local L1_8
  L1_8 = 0
  while _exit_sandbox == false do
    L1_8 = L1_8 + 0.1
    waitSeconds(0.1)
    if not (A0_7 <= L1_8) then
    end
  end
end
function killPhotoGhost(A0_9, A1_10)
  while _pg_create == true and _exit_sandbox ~= true do
    wait()
  end
  print(A0_9 .. " Killed")
  if _pg_data[A0_9].sensor ~= nil then
    Fn_actionDialogCancel(_pg_data[A0_9].sensor)
    _pg_data[A0_9].sensor:setActive(false)
    _pg_data[A0_9].sensor:kill()
    _pg_data[A0_9].sensor = nil
  end
  if _pg_data[A0_9].marker ~= nil then
    _pg_data[A0_9].marker:setActive(false)
    _pg_data[A0_9].marker:del()
    _pg_data[A0_9].marker = nil
  end
  if _pg_data[A0_9].ghost ~= nil then
    if A1_10 ~= false then
      _pg_data[A0_9].ghost:setFade(1, 0, 1)
      for _FORV_5_ = 0, 30 do
        if _pg_data[A0_9].ghost ~= nil and _pg_data[A0_9].ghost:isFadeEnd() ~= true then
          wait()
        end
      end
    end
    if _FOR_[A0_9].ghost ~= nil then
      _pg_data[A0_9].ghost:kill()
      _pg_data[A0_9].ghost = nil
    end
  end
  if _pg_data[A0_9].node ~= nil then
    _pg_data[A0_9].node:kill()
    _pg_data[A0_9].node = nil
  end
  _pg_data[A0_9] = {}
end
function setPGActive()
  if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionType) == "free" and GameDatabase:get(ggd.Savedata__EventManageFlags__PhotoGhost) == true and GameDatabase:get(ggd.CreneShipFlags__MiningInFlags) == false then
    if _pg_active == false then
      while not __exitsandbox do
        if GameDatabase:get(ggd.GlobalSystemFlags__AreaStart) == true then
          _event_data = Fn_loadEventData("evx/cc_a_root_photoghost", nil, true)
          break
        end
        wait()
      end
    end
    _pg_active = true
  else
    if _pg_active == true then
      if _event_data ~= nil and #_event_data > 0 then
        for _FORV_3_, _FORV_4_ in pairs(_event_data) do
          _FORV_4_:try_term()
        end
      end
      _event_data = {}
      killPhotoGhost("auto", false)
      killPhotoGhost("manual", false)
    end
    _pg_active = false
  end
end
function setPhotoGhost(A0_11, A1_12, A2_13)
  local L3_14, L4_15, L5_16, L6_17, L7_18, L8_19
  _pg_create = true
  L3_14 = _pg_info
  L3_14 = L3_14[A1_12]
  L3_14 = L3_14[A0_11]
  L4_15 = nil
  if A0_11 == "manual" then
    L5_16 = HUD
    L4_15 = L5_16.kPhotoReviewSlot_Manual
  else
    L5_16 = HUD
    L4_15 = L5_16.kPhotoReviewSlot_Auto
  end
  L5_16 = L3_14.area
  if L5_16 == "locator2_photoghost" then
    L5_16 = nil
    if A0_11 == "manual" then
      L6_17 = findGameObject2
      L7_18 = "Node"
      L8_19 = "locator2_photoghost"
      L6_17 = L6_17(L7_18, L8_19)
      L5_16 = L6_17
    else
      L6_17 = findGameObject2
      L7_18 = "Node"
      L8_19 = "locator2_photoghost2"
      L6_17 = L6_17(L7_18, L8_19)
      L5_16 = L6_17
    end
    L7_18 = L5_16
    L6_17 = L5_16.getTransform
    L7_18 = L6_17(L7_18)
    L3_14.rot = L7_18
    L3_14.pos = L6_17
  end
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L6_17 = createGameObject2
  L7_18 = "GhostPuppet"
  L6_17 = L6_17(L7_18)
  L5_16.ghost = L6_17
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.ghost
  L6_17 = L5_16
  L5_16 = L5_16.setName
  L7_18 = A0_11
  L8_19 = "_"
  L7_18 = L7_18 .. L8_19 .. L3_14.onlineId
  L5_16(L6_17, L7_18)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.ghost
  L6_17 = L5_16
  L5_16 = L5_16.setAssetName
  L7_18 = "ghost01"
  L5_16(L6_17, L7_18)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.ghost
  L6_17 = L5_16
  L5_16 = L5_16.setGhostType
  L7_18 = GhostPuppet
  L7_18 = L7_18.kGhostType_RandomAnim
  L5_16(L6_17, L7_18)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.ghost
  L6_17 = L5_16
  L5_16 = L5_16.try_init
  L5_16(L6_17)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.ghost
  L6_17 = L5_16
  L5_16 = L5_16.waitForReady
  L5_16(L6_17)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.ghost
  L6_17 = L5_16
  L5_16 = L5_16.try_start
  L5_16(L6_17)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L6_17 = HUD
  L7_18 = L6_17
  L6_17 = L6_17.createGhostMarker
  L8_19 = {}
  L8_19.id = L3_14.onlineId
  L8_19.obj = _pg_data[A0_11].ghost
  L8_19.joint = "bn_root"
  L8_19.color = HUD.kGhostColor_Blue
  L6_17 = L6_17(L7_18, L8_19)
  L5_16.marker = L6_17
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.marker
  L6_17 = L5_16
  L5_16 = L5_16.setActive
  L7_18 = true
  L5_16(L6_17, L7_18)
  L6_17 = A2_13
  L5_16 = A2_13.appendChild
  L7_18 = _pg_data
  L7_18 = L7_18[A0_11]
  L7_18 = L7_18.ghost
  L5_16(L6_17, L7_18)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L6_17 = createGameObject2
  L7_18 = "Node"
  L6_17 = L6_17(L7_18)
  L5_16.node = L6_17
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.node
  L6_17 = L5_16
  L5_16 = L5_16.setName
  L7_18 = "pg_node_"
  L8_19 = L3_14.onlineId
  L7_18 = L7_18 .. L8_19
  L5_16(L6_17, L7_18)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.node
  L6_17 = L5_16
  L5_16 = L5_16.setTransform
  L7_18 = L3_14.pos
  L8_19 = L3_14.rot
  L5_16(L6_17, L7_18, L8_19)
  L6_17 = A2_13
  L5_16 = A2_13.appendChild
  L7_18 = _pg_data
  L7_18 = L7_18[A0_11]
  L7_18 = L7_18.node
  L5_16(L6_17, L7_18)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.node
  L6_17 = L5_16
  L5_16 = L5_16.try_init
  L5_16(L6_17)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.node
  L6_17 = L5_16
  L5_16 = L5_16.waitForReady
  L5_16(L6_17)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.node
  L6_17 = L5_16
  L5_16 = L5_16.try_start
  L5_16(L6_17)
  L5_16 = _pg_data
  L5_16 = L5_16[A0_11]
  L5_16 = L5_16.node
  L6_17 = L5_16
  L5_16 = L5_16.appendChild
  L7_18 = _pg_data
  L7_18 = L7_18[A0_11]
  L7_18 = L7_18.ghost
  L5_16(L6_17, L7_18)
  L5_16 = {L6_17}
  L6_17 = {}
  L6_17.anim_name = "stay"
  L6_17 = L3_14.pose
  L7_18 = HUD
  L7_18 = L7_18.kPhotoPose_Float
  if L6_17 == L7_18 then
    L6_17 = {L7_18}
    L7_18 = {}
    L7_18.anim_name = "float_fighting_ghost"
    L5_16 = L6_17
  end
  L6_17 = _pg_data
  L6_17 = L6_17[A0_11]
  L6_17 = L6_17.ghost
  L7_18 = L6_17
  L6_17 = L6_17.addRandomAnimNameTbl
  L8_19 = L5_16
  L6_17(L7_18, L8_19)
  L6_17 = _pg_data
  L6_17 = L6_17[A0_11]
  L6_17 = L6_17.ghost
  L7_18 = L6_17
  L6_17 = L6_17.setFade
  L8_19 = 0
  L6_17(L7_18, L8_19, 1, 1)
  L6_17 = _pg_data
  L6_17 = L6_17[A0_11]
  L6_17 = L6_17.ghost
  L7_18 = L6_17
  L6_17 = L6_17.play
  L6_17(L7_18)
  L6_17 = _pg_data
  L6_17 = L6_17[A0_11]
  L7_18 = createGameObject2
  L8_19 = "PlayerSensor"
  L7_18 = L7_18(L8_19)
  L6_17.sensor = L7_18
  L6_17 = A0_11
  L7_18 = "_pg_sensor"
  L6_17 = L6_17 .. L7_18
  L7_18 = L6_17
  L8_19 = "_OnEnter"
  L7_18 = L7_18 .. L8_19
  L8_19 = L6_17
  L8_19 = L8_19 .. "_OnLeave"
  _pg_data[A0_11].sensor:setName(L6_17)
  _pg_data[A0_11].sensor:setDetectBehavior(1)
  _pg_data[A0_11].sensor:addBox(Vector(1.5, 1.5, 1.5))
  _pg_data[A0_11].sensor:setPos(Vector(0, 1.5, 0))
  _pg_data[A0_11].sensor:setOnEnter(L7_18)
  _pg_data[A0_11].sensor:setOnLeave(L8_19)
  _pg_data[A0_11].node:appendChild(_pg_data[A0_11].sensor)
  _pg_data[A0_11].sensor:try_init()
  _pg_data[A0_11].sensor:waitForReady()
  _pg_data[A0_11].sensor:try_start()
  _G[L7_18] = function(A0_20)
    function yes_func()
      local L0_21
      L0_21 = Player
      L0_21 = L0_21.getRecentAreaName
      L0_21 = L0_21(L0_21)
      if L0_21 ~= nil then
        HUD:photoReviewOpen(getAreaNameToId(L0_21), L4_15)
      end
      wait()
      if HUD:photoReviewSelected() == HUD.kPhotoReview_Back then
      elseif HUD:photoReviewSelected() == HUD.kPhotoReviewButton_Good or HUD:photoReviewSelected() == HUD.kPhotoReviewButton_Bad then
        _autoSaveReq()
        killPhotoGhost(A0_11)
      end
    end
    Fn_actionDialog(A0_20, "ui_acdialog_main_pghost", "ui_acdialog_sub_06", "ui_keyguide_ac_01", nil, yes_func)
  end
  _G[L8_19] = function(A0_22)
    Fn_actionDialogCancel(A0_22)
  end
  _pg_create = false
end
function getAreaNameToId(A0_23)
  local L1_24, L2_25
  L1_24 = _getAreaNameToId
  L2_25 = A0_23
  L1_24 = L1_24(L2_25)
  if L1_24 == nil then
    L2_25 = Fn_findAreaHandle
    L2_25 = L2_25(A0_23)
    if L2_25 ~= nil and Fn_getParentArea(L2_25) ~= nil then
      L1_24 = _getAreaNameToId(Fn_getParentArea(L2_25):getName())
    end
  end
  return L1_24
end
function timeUpPhotoGhost(A0_26, A1_27)
  invokeTask(function()
    if A0_26 == true then
      _pg_info[A1_27].auto = nil
      killPhotoGhost("auto")
    else
      killPhotoGhost("manual")
      _pg_info[A1_27].manual = nil
    end
    _pg_update = true
  end)
end
function setPhotoGhostActive(A0_28)
  local L1_29, L2_30, L3_31, L4_32
  L4_32 = A0_28
  L1_29(L2_30)
  for L4_32, _FORV_5_ in L1_29(L2_30) do
    print(" < pg mng > " .. L4_32)
    if _FORV_5_.ghost and not _FORV_5_.ghost:isStopped() then
      print(" < pg mng > " .. _FORV_5_.ghost:getName())
      _FORV_5_.ghost:setActive(A0_28)
    end
    if _FORV_5_.sensor and not _FORV_5_.sensor:isStopped() then
      if A0_28 == false then
        Fn_actionDialogCancel(_FORV_5_.sensor)
      end
      _FORV_5_.sensor:setActive(A0_28)
    end
    if _FORV_5_.marker then
      _FORV_5_.marker:setActive(A0_28)
    end
  end
  L1_29(L2_30)
end
function exitsandbox()
  _exit_sandbox = true
  killPhotoGhost("auto", false)
  killPhotoGhost("manual", false)
  if _event_data ~= nil and #_event_data > 0 then
    for _FORV_3_, _FORV_4_ in pairs(_event_data) do
      _FORV_4_:try_term()
    end
  end
  _event_data = {}
  __debugSystemTask = false
end
setExitCallback(exitsandbox)
import("Font")
import("Debug")
__debugLine = 0
__debugDisp = false
__debugSystemTask = true
function debugDispPrint(A0_33)
  local L1_34
  L1_34 = 50
  if Debug:isDebugMenuOpen() then
    L1_34 = 250
  end
  Font:debugPrint(L1_34, 70 + 20 * __debugLine, A0_33)
  __debugLine = __debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    while __debugSystemTask do
      if GameDatabase:get(ggd.Debug__DispBg) or __debugDisp then
        __debugLine = 0
        if _pg_active == true then
          debugDispPrint("_pg_active  : true")
        else
          debugDispPrint("_pg_active  : false")
        end
      end
      wait()
    end
  end)
end
g_customDebugMenu = {
  {
    name = "DebugDisp",
    callback = function()
      local L1_35
      L1_35 = __debugDisp
      L1_35 = not L1_35
      __debugDisp = L1_35
    end
  }
}
