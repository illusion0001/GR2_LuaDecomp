import("EventData")
import("GameDatabase")
import("EventHelper")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
__event_name = nil
__initialized = false
__request_ingame = false
__updateTarget = {}
__evb = {
  header = {},
  body = {}
}
__sensor_handle = {
  run = nil,
  out = nil,
  finish = nil,
  ex_run = nil
}
__livelyManager = nil
__sendState = {
  area = nil,
  evarea = nil,
  activetype = false,
  update = false
}
__now_time = {
  month = 0,
  day = 0,
  hour = 0,
  minute = 0,
  second = 0
}
__to_fade = false
function main()
  debugDisp()
  __livelyManager = Fn_getGameObject("livelyManager")
  __event_name = g_own:getName()
  setAttachSandbox("npcManager")
  __debugPhase = "loading evb"
  __evb.header = loadLivelyEvb(__event_name .. "_header")
  debugPrint(__event_name .. "   Initializing...")
  __debugPhase = "initialize"
  Initialize()
  while __sendState.area == nil do
    wait()
  end
  __initialized = true
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  Fn_getGameObject("npcManager"):sendEvent("requestStart")
  startAllGameObjects()
  invokeTask(function()
    while true do
      __debugPhase = "wait ingamae"
      if __sendState.update == true then
        __debugPhase = "update position"
        if __sendState.activetype ~= true then
          __sendState.evarea = __evb.header.area[__sendState.area][RandI(1, #__evb.header.area[__sendState.area])]
        end
        updatePostition(__sendState.evarea)
        __sendState.update = false
      end
      if __request_ingame then
        __debugPhase = "wait exclusion"
        if GameDatabase:get(ggd__GlobalSystemFlags__ExclusionFlag) ~= true then
          GameDatabase:set(ggd__GlobalSystemFlags__ExclusionFlag, true)
          if __sensor_handle.run ~= nil then
            __sensor_handle.run:setActive(false)
          end
          if __sensor_handle.ex_run ~= nil then
            __sensor_handle.ex_run:setActive(false)
          end
          if __sensor_handle.out ~= nil then
            __sensor_handle.out:setActive(true)
          end
          if __sensor_handle.finish ~= nil then
            __sensor_handle.finish:setActive(true)
          end
          break
        end
      end
      wait()
    end
    __debugPhase = "load ingame evb"
    if __evb.header.data ~= nil then
      __evb.header.data:kill()
    end
    __evb.body = loadLivelyEvb(__event_name, __sendState.evarea)
    __evb.header = {}
    __debugPhase = "ingamae"
    __livelyManager:sendEvent("ingameStart", __event_name)
    Ingame()
  end)
end
function exitsandbox()
  local L0_0, L1_1
  __debugSystemTask = false
end
setExitCallback(exitsandbox)
function loadLivelyEvb(A0_2, A1_3)
  debugPrint(A0_2 .. " evb loading ...")
  ;({
    asset = nil,
    root = nil,
    data = nil,
    area = {}
  }).asset = loadFileAsset("evb", "evx/" .. A0_2)
  if ({
    asset = nil,
    root = nil,
    data = nil,
    area = {}
  }).asset ~= nil then
    ;({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).asset:wait()
    ;({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).area = EventHelper:convertLivelyEventAreaTable(({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).asset:getRoot())
    if A1_3 ~= nil then
      ;({
        asset = nil,
        root = nil,
        data = nil,
        area = {}
      }).root = ({
        asset = nil,
        root = nil,
        data = nil,
        area = {}
      }).asset:findBundle(A1_3)
    end
    if ({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).root == nil then
      ;({
        asset = nil,
        root = nil,
        data = nil,
        area = {}
      }).root = ({
        asset = nil,
        root = nil,
        data = nil,
        area = {}
      }).asset:getRoot()
    end
    ;({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).data = EventData:create(A0_2, nil, ({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).root)
    ;({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).data:try_init()
    ;({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).data:waitForReady()
    ;({
      asset = nil,
      root = nil,
      data = nil,
      area = {}
    }).data:try_start()
    debugPrint(A0_2 .. " evb load complete !!")
  else
    debugPrint(A0_2 .. " evb nil")
  end
  return {
    asset = nil,
    root = nil,
    data = nil,
    area = {}
  }
end
function updatePostition(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13
  for L4_8, L5_9 in L1_5(L2_6) do
    L6_10 = findNodeHandleAndParentHandle
    L7_11 = L5_9.node
    L8_12 = A0_4
    L7_11 = L6_10(L7_11, L8_12)
    if L6_10 ~= nil then
      L9_13 = L6_10
      L8_12 = L6_10.getWorldTransform
      L9_13 = L8_12(L9_13)
      L7_11:getParent():setDriftEnable(false)
      L7_11:getParent():appendChild(L5_9.chara)
      L5_9.chara:setWorldTransform(L8_12, L9_13)
      L5_9.chara:setForceMove()
      L7_11:getParent():setDriftEnable(true)
    end
  end
end
function findNodeHandleAndParentHandle(A0_14, A1_15)
  local L2_16, L3_17, L4_18
  L2_16 = findGameObjects
  L3_17 = "Node"
  L4_18 = A0_14
  L2_16 = L2_16(L3_17, L4_18)
  L3_17, L4_18 = nil, nil
  for _FORV_8_, _FORV_9_ in pairs(L2_16) do
    L4_18 = _FORV_9_:getParent()
    if L4_18:getName() == A1_15 then
      L3_17 = _FORV_9_
      break
    end
  end
  return L3_17, L4_18
end
function Fn_setFindTargeted(A0_19)
  __livelyManager:sendEvent("setFindTargeted", __event_name, A0_19)
end
function Fn_setUpdataPosition(A0_20, A1_21)
  local L2_22
  L2_22 = {}
  if Fn_findNpcPuppet(A0_20) ~= nil then
    L2_22.chara = Fn_findNpcPuppet(A0_20)
  else
    L2_22.chara = findGameObject2("Node", A0_20)
  end
  L2_22.node = A1_21
  __updateTarget[A0_20] = L2_22
end
function Fn_nextMainBody(A0_23)
  local L1_24
  __request_ingame = true
end
function Fn_cancelMainBody(A0_25)
  local L1_26
  __request_ingame = false
end
function Fn_setRunSenser(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32
  L2_29 = Vector
  L3_30 = 3
  L4_31 = 3
  L5_32 = 3
  L2_29 = L2_29(L3_30, L4_31, L5_32)
  L3_30 = nil
  if A0_27 ~= nil then
    if A1_28 ~= nil then
      L2_29 = A1_28
    end
    L4_31 = "pccubesensor2_le_run_OnEnter"
    L5_32 = "pccubesensor2_le_run_OnLeave"
    _G[L4_31] = function()
      Fn_nextMainBody(L3_30)
    end
    _G[L5_32] = function()
      Fn_cancelMainBody(L3_30)
    end
    L3_30 = createGameObject2("PlayerSensor")
    L3_30:setName("pccubesensor2_le_run")
    L3_30:setDetectBehavior(1)
    L3_30:addBox(L2_29)
    L3_30:setPos(Vector(0, L2_29.y / 2, 0))
    L3_30:setOnEnter(L4_31)
    L3_30:setOnLeave(L5_32)
    __sensor_handle.run = L3_30
    A0_27:appendChild(L3_30)
  end
  return L3_30
end
function Fn_setExtraRunSenser(A0_33, A1_34)
  local L2_35, L3_36, L4_37, L5_38
  L2_35 = Vector
  L3_36 = 3
  L4_37 = 3
  L5_38 = 3
  L2_35 = L2_35(L3_36, L4_37, L5_38)
  L3_36 = nil
  if A0_33 ~= nil then
    if A1_34 ~= nil then
      L2_35 = A1_34
    end
    L4_37 = "pccubesensor2_le_run_OnEnter"
    L5_38 = "pccubesensor2_le_run_OnLeave"
    _G[L4_37] = function()
      Fn_nextMainBody(L3_36)
    end
    _G[L5_38] = function()
      Fn_cancelMainBody(L3_36)
    end
    L3_36 = createGameObject2("PlayerSensor")
    L3_36:setName("pccubesensor2_le_extra_run")
    L3_36:setDetectBehavior(1)
    L3_36:addBox(L2_35)
    L3_36:setPos(Vector(0, L2_35.y / 2, 0))
    L3_36:setOnEnter(L4_37)
    L3_36:setOnLeave(L5_38)
    __sensor_handle.ex_run = L3_36
    A0_33:appendChild(L3_36)
  end
  return L3_36
end
function Fn_setFinishSenser(A0_39, A1_40)
  local L2_41, L3_42, L4_43
  L2_41 = Vector
  L3_42 = 3
  L4_43 = 3
  L2_41 = L2_41(L3_42, L4_43, 3)
  L3_42 = nil
  if A0_39 ~= nil then
    if A1_40 ~= nil then
      L2_41 = A1_40
    end
    L4_43 = "pccubesensor2_le_finish_OnEnter"
    _G[L4_43] = function()
      Finishgame(L3_42)
    end
    L3_42 = createGameObject2("PlayerSensor")
    L3_42:setName("pccubesensor2_le_finish")
    L3_42:setDetectBehavior(1)
    L3_42:addBox(L2_41)
    L3_42:setPos(Vector(0, L2_41.y / 2, 0))
    L3_42:setOnEnter(L4_43)
    L3_42:setActive(false)
    __sensor_handle.finish = L3_42
    A0_39:appendChild(L3_42)
  end
  return L3_42
end
function Fn_setOutSenser(A0_44, A1_45)
  local L2_46, L3_47, L4_48
  L2_46 = Vector
  L3_47 = 50
  L4_48 = 50
  L2_46 = L2_46(L3_47, L4_48, 50)
  L3_47 = nil
  if A0_44 ~= nil then
    if A1_45 ~= nil then
      L2_46 = A1_45
    end
    L4_48 = "pccubesensor2_le_out_OnLeave"
    _G[L4_48] = function()
      Outgame()
      L3_47:setActive(false)
    end
    L3_47 = createGameObject2("PlayerSensor")
    L3_47:setName("pccubesensor2_le_out")
    L3_47:setDetectBehavior(1)
    L3_47:addBox(L2_46)
    L3_47:setOnLeave(L4_48)
    L3_47:setActive(false)
    __sensor_handle.out = L3_47
    A0_44:appendChild(L3_47)
  end
  return L3_47
end
function Fn_copyLocater(A0_49)
  local L1_50
  L1_50 = {}
  L1_50.handle = nil
  L1_50.name = "copy_" .. A0_49
  if findGameObject2("Node", A0_49) ~= nil then
    L1_50.handle = createGameObject2("Node")
    L1_50.handle:setName(L1_50.name)
    L1_50.handle:try_init()
    L1_50.handle:waitForReady()
    L1_50.handle:setWorldTransform(findGameObject2("Node", A0_49):getWorldTransform())
    findGameObject2("Node", A0_49):getParent():appendChild(L1_50.handle)
  end
  return L1_50.name, L1_50.handle
end
function Fn_exitSandbox()
  __debugPhase = "finalize"
  __livelyManager:sendEvent("ingameEnd", __event_name)
  kill()
end
function Fn_duringFade()
  if HUD:faderAlpha() > 0.1 then
    __to_fade = true
  else
    __to_fade = false
  end
end
function requestUpdatePosition(A0_51, A1_52, A2_53)
  local L3_54
  L3_54 = __sendState
  L3_54.area = A0_51
  L3_54 = __sendState
  L3_54.evarea = A1_52
  L3_54 = __sendState
  L3_54.activetype = A2_53
  L3_54 = __sendState
  L3_54.update = true
end
function kill()
  debugPrint(__event_name .. " finalizing...")
  Finalize()
  debugPrint(__event_name .. " kill !!")
  exitSandbox()
end
import("Font")
import("Debug")
__debugTxt = "\227\131\128\227\131\159\227\131\188"
__debugLine = 0
__debugDisp = false
__debugPhase = ""
__debugSystemTask = true
function debugPrint(A0_55)
  print(" <<< lively common >>> " .. A0_55)
  __debugTxt = A0_55
end
function debugDispPrint(A0_56)
  if Debug:isDebugMenuOpen() == true then
    Font:debugPrint(250, 50 + 20 * __debugLine, A0_56)
  else
    Font:debugPrint(50, 50 + 20 * __debugLine, A0_56)
  end
  __debugLine = __debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    while __debugSystemTask do
      if __debugDisp == true then
        __debugLine = 0
        Font:testPrint(200, 15, __debugTxt)
        debugDispPrint("phase           = [ " .. __debugPhase .. " ]")
        debugDispPrint("sensor_run      = [ " .. (__sensor_handle.run and "use" or "not use") .. " ]")
        debugDispPrint("sensor_out      = [ " .. (__sensor_handle.out and "use" or "not use") .. " ]")
        debugDispPrint("sensor_finish   = [ " .. (__sensor_handle.finish and "use" or "not use") .. " ]")
        debugDispPrint("sensor_ex_run   = [ " .. (__sensor_handle.ex_run and "use" or "not use") .. " ]")
        debugDispPrint("area            = [ " .. __sendState.area .. " ]")
        debugDispPrint("evarea          = [ " .. (__sendState.evarea and __sendState.evarea or "nil") .. " ]")
        debugDispPrint("active_type     = [ " .. tostring(__sendState.activetype) .. " ]")
        debugDispPrint("update_position = [ " .. tostring(__sendState.update) .. " ]")
      end
      wait()
    end
  end)
end
g_customDebugMenu = {
  {
    name = "DebugDisp",
    callback = function()
      local L1_57
      L1_57 = __debugDisp
      L1_57 = not L1_57
      __debugDisp = L1_57
    end
  }
}
