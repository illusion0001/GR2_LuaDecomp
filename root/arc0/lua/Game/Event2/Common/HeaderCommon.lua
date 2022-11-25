import("EventData")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/SystemScriptCommon.lua")
event_name = nil
__initialized = false
__ready_object = false
__area = false
__runflag = false
__start = false
__ingame_task = nil
__is_finalize = false
__com_sandbox = false
__mine99_body_sandbox = false
__killing = false
__evbAsset = nil
__evbRoot = nil
__evbData = nil
function main()
  debugDisp()
  debugDispMission()
  event_name = g_own:getName()
  setAttachSandbox("npcManager")
  debugPrintHd(event_name .. ".evb loading ...")
  __evbAsset = loadFileAsset("evb", "evx/" .. event_name)
  if __evbAsset ~= nil then
    __evbAsset:wait()
    __evbRoot = __evbAsset:getRoot()
    __evbData = EventData:create(event_name, nil, _evbRoot)
    __evbData:try_init()
    __evbData:waitForReady()
    __evbData:try_start()
    debugPrintHd(event_name .. ".evb finish!!")
  else
    debugPrintHd(event_name .. ".evb nil")
  end
  __debugPhase = "Initializing"
  debugPrintHd(event_name .. " Initializing ...")
  Initialize()
  __initialized = true
  __debugPhase = "Initialized"
  debugPrintHd(event_name .. " Initialized!!")
  repeat
    wait()
  until __area
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  __ready_object = true
  __debugPhase = "wait object start"
  debugPrintHd(event_name .. " wait object start")
  repeat
    wait()
  until __start
  startAllGameObjects()
  __debugPhase = "object start"
  debugPrintHd(event_name .. " object start")
  repeat
    wait()
  until __runflag
  __ingame_task = invokeTask(Ingame)
  __debugPhase = "run"
  debugPrintHd(event_name .. " run!!")
  if __com_sandbox or __mine99_body_sandbox then
    repeat
      wait()
    until not __ingame_task
    Finalize()
    __is_finalize = true
    repeat
      wait()
    until __killing
    if data then
      data:try_term()
    end
    data = nil
    exitSandbox()
  else
    __ingame_task = nil
  end
end
function exitsandbox()
  __debugSystemTask = false
  if __is_finalize == false then
    Finalize()
  end
end
setExitCallback(exitsandbox)
function isInitialized()
  local L0_0, L1_1
  L0_0 = __initialized
  return L0_0
end
function isReadyGameObject()
  local L0_2, L1_3
  L0_2 = __ready_object
  return L0_2
end
function sbRun()
  local L0_4, L1_5
  __runflag = true
end
function sbKill()
  local L0_6, L1_7
  __killing = true
end
function sbAllAboutTask()
  abortAllGameTasks()
end
function areaWarpFinish()
  local L0_8, L1_9
  __area = true
end
function startGameObjects()
  local L0_10, L1_11
  __start = true
end
function setComSandoxFlag()
  local L0_12, L1_13
  __com_sandbox = true
end
function setMine99BodySandoxFlag()
  local L0_14, L1_15
  __mine99_body_sandbox = true
end
function kill()
  if __com_sandbox or __mine99_body_sandbox then
    if __ingame_task and __ingame_task:isRunning() then
      __ingame_task:abort()
    end
    __ingame_task = nil
  else
    debugPrintHd(tostring(g_own:getName()) .. " finalizing...")
    Finalize()
    __is_finalize = true
    if __evbData ~= nil then
      __evbData:kill()
    end
    __evbAsset = nil
    __evbRoot = nil
    __evbData = nil
    debugPrintHd(tostring(g_own:getName()) .. " kill!!")
    exitSandbox()
  end
end
function Fn_getMissionPart()
  return g_own:getString("mission_part")
end
function Fn_setAreaWarp(A0_16, A1_17)
  local L2_18
  __area = false
  L2_18 = A1_17
  if type(L2_18) == "string" then
    L2_18 = findGameObject2("Node", A1_17)
  end
  Fn_getGameObject("bgManager"):sendEvent("setWarpArea", A0_16, L2_18)
end
function Fn_reserveNpcAllKill(A0_19)
  if Fn_getGameObject("eventManager") and Fn_getGameObject("npcManager") then
    Fn_getGameObject("eventManager"):sendEvent("reserveTermNpc")
    Fn_getGameObject("npcManager"):sendEvent("reserveTermNpc", A0_19)
  end
end
function Fn_waitStartedNpc(A0_20)
  while Fn_findNpc(A0_20) == nil or not Fn_findNpc(A0_20):isStarted() or not Fn_findNpc(A0_20):isReadyNpc() do
    wait()
  end
end
function Fn_finalizeNpcKill(A0_21, A1_22)
  if A0_21 and A1_22 then
    invokeSystemTask(function()
      local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29
      L0_23 = nil
      L1_24 = 0
      repeat
        L2_25()
        if not (L1_24 > 60) then
          L1_24 = L1_24 + 1
          if not L2_25 then
            L0_23 = L2_25
          end
        end
      until L0_23 == "eventheader"
      if L0_23 ~= nil then
        if not L2_25 then
          for L5_28, L6_29 in L2_25(L3_26) do
            Fn_disappearNpc(L6_29)
          end
        end
      end
    end)
  end
end
import("Font")
import("Debug")
__debugTxt = "\227\131\128\227\131\159\227\131\188"
__debugLine = 0
__debugDisp = false
__debugUnder = false
__debugDemo = false
__debugPhase = ""
__debugSystemTask = true
__debugTxtArray = {}
function debugPrintHd(A0_30)
  print(" [ hdr com ] " .. A0_30)
end
function debugTextUnder(A0_31)
  local L1_32
  __debugUnder = false
  if A0_31 ~= false then
    __debugUnder = true
  end
end
function debugTextDemo(A0_33)
  local L1_34
  __debugDemo = false
  if A0_33 ~= false then
    __debugDemo = true
  end
end
function debugTextAdd(A0_35)
  table.insert(__debugTxtArray, A0_35)
end
function debugTextClear()
  local L0_36, L1_37
  L0_36 = {}
  __debugTxtArray = L0_36
end
function debugTextOneLine(A0_38, A1_39)
  debugTextClear()
  debugTextAdd(A0_38)
  waitSeconds(A1_39)
  debugTextClear()
end
function debugDispPrint(A0_40, A1_41)
  local L2_42
  L2_42 = 50
  if Debug:isDebugMenuOpen() then
    L2_42 = 250
  end
  if string.len(A0_40) > 0 then
    if A1_41 ~= nil then
      if __debugDemo == false then
        if __debugUnder == true then
          Font:testPrint(L2_42 + 240, 920 - 40 * #__debugTxtArray + 40 * __debugLine, A0_40, Font.kLayerFront)
        else
          Font:testPrint(L2_42 + 240, 120 + 40 * __debugLine, A0_40, Font.kLayerFront)
        end
      else
        Font:testPrint(L2_42 + 240, 320 + 40 * __debugLine, A0_40, Font.kLayerFront)
      end
    else
      Font:debugPrint(L2_42, 50 + 20 * __debugLine, A0_40)
    end
  end
  __debugLine = __debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    local L0_43, L1_44, L2_45, L3_46, L4_47
    while true do
      if L0_43 then
        if L0_43 == true then
          __debugLine = 0
          L3_46 = " ]"
          L0_43(L1_44)
        elseif L0_43 then
          __debugLine = 0
          for L3_46, L4_47 in L0_43(L1_44) do
            debugDispPrint(L4_47, true)
          end
        end
        L0_43()
      end
    end
  end)
end
__debugDispMission = false
__debugDispMissionLine = 0
__debugDispMissionArray = {}
function setDebugDispMission()
  local L1_48
  L1_48 = __debugDispMission
  L1_48 = not L1_48
  __debugDispMission = L1_48
end
function setDebugDispMissionText(A0_49)
  table.insert(__debugDispMissionArray, A0_49)
end
function debugDispMissionPrint(A0_50)
  local L1_51
  L1_51 = Debug
  L1_51 = L1_51.isDebugMenuOpen
  L1_51 = L1_51(L1_51)
  if L1_51 then
    L1_51 = 700
  else
    L1_51 = L1_51 or 500
  end
  if string.len(A0_50) > 0 then
    Font:debugPrint(L1_51, 50 + 20 * __debugDispMissionLine, A0_50)
  end
  __debugDispMissionLine = __debugDispMissionLine + 1
end
function debugDispMission()
  invokeSystemTask(function()
    local L0_52, L1_53, L2_54, L3_55, L4_56
    while true do
      if L0_52 then
        if L0_52 then
          __debugDispMissionLine = 0
          L3_55 = " ==="
          L0_52(L1_53)
          for L3_55, L4_56 in L0_52(L1_53) do
            debugDispMissionPrint(L4_56)
          end
        end
        __debugDispMissionArray = L0_52
        L0_52()
      end
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
