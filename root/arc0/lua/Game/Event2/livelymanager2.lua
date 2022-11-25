import("GameDatabase")
import("EventData")
import("math")
import("Player")
import("Rtc")
import("Ugc")
import("Yaml")
import("Sound")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Table/LivelyEventTable2.lua")
dofile("/Game/Event2/Lively/le_bell.lua")
dofile("/Game/Event2/Lively/le_bunger.lua")
dofile("/Game/Event2/Lively/le_clock.lua")
dofile("/Game/Event2/Lively/le_gravitystrom.lua")
dofile("/Game/Event2/Lively/le_rainbow.lua")
dofile("/Game/Event2/Lively/le_rat.lua")
dofile("/Game/Event2/Lively/le_monument.lua")
LIVELY_TIME_HEADER = 1
LIVELY_TIME_FREE_MODE = 1
LIVELY_TIME_NAME = 1
LIVELY_TIME_MONTH = 2
LIVELY_TIME_DAY = 3
LIVELY_TIME_HOUR = 4
LIVELY_TIME_MINUTE = 5
LIVELY_TIME_SECOND = 6
__freeTime = nil
__ftNum = 0
function __livelyMainFunc()
  local L0_0, L1_1
end
__rtcSetTime = {
  month = 0,
  day = 0,
  hour = 0,
  minute = 0
}
function main()
  debugDisp()
  debugPrint("Initializend!!")
  _le_bell = LeBell.create()
  _le_bunger = LeBunger.create()
  _le_clock = LeClock.create()
  _le_gravity = LeGravityStrom.create()
  _le_rainbow = LeRainbow.create()
  _le_rat = LeRat.create()
  _le_monument = LeMonument.create()
  _le_monument:run()
  _le_rat:updateEvb()
  invokeSystemTask(function()
    local L0_2
    L0_2 = debugPrint
    L0_2("main task run!!")
    L0_2 = false
    while not __exitsandbox do
      if GameDatabase:get(ggd.GlobalSystemFlags__Lively) ~= L0_2 then
        L0_2 = GameDatabase:get(ggd.GlobalSystemFlags__Lively)
        if GameDatabase:get(ggd.GlobalSystemFlags__Lively) then
          run()
        else
          stop()
        end
      end
      if GameDatabase:get(ggd.GlobalSystemFlags__AreaStart) then
        if makeClockTiming() then
          _le_monument:setArea(true)
          if false == false then
            _le_clock:init()
          end
        else
          _le_monument:setArea(false)
          if true == true then
            _le_clock:kill()
          end
        end
        if makeBellTiming() then
          if false == false then
            _le_bell:init()
          end
        elseif true == true then
          _le_bell:kill()
        end
        _le_rat:setUpdateEvb(true)
      else
        if false then
          _le_clock:kill()
        end
        if false then
          _le_bell:kill()
        end
        _le_monument:setArea(false)
        _le_rat:setUpdateEvb(false)
      end
      __livelyMainFunc()
      wait()
    end
  end)
  wait()
end
function exitsandbox()
  print("exit lively manager2")
  __exitsandbox = true
  Rtc:clear()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_rainbow:kill()
  _le_bunger:kill()
  _le_rat:kill()
  _le_monument:kill()
  _le_bell:kill()
  _le_clock:kill()
  _le_gravity:kill()
  debugPrint("All killed LivelyEvent!")
end
setExitCallback(exitsandbox)
function runLivelyEvent()
  local L0_3
  L0_3 = GameDatabase
  L0_3 = L0_3.get
  L0_3 = L0_3(L0_3, ggd.Savedata__EventManageFlags__CurrentFreeMode)
  __freeTime = L0_3
  L0_3 = tonumber
  L0_3 = L0_3(string.match(__freeTime, "%d+"))
  __ftNum = L0_3
  L0_3 = __ftNum
  if L0_3 >= 10 then
    L0_3 = __ftNum
    if L0_3 <= 11 then
      L0_3 = _le_gravity
      L0_3 = L0_3.init
      L0_3(L0_3)
      L0_3 = 0
      if 0 >= GameDatabase:get(ggd.Savedata__EventFlags__other__flag01) then
        L0_3 = LIVELY_STAY_TIME
      else
        L0_3 = LIVELY_BATTLE_STAY
      end
      _le_gravity:_setActiveTypeTimer(L0_3)
    end
  end
  L0_3 = setTimeTable
  L0_3()
  L0_3 = Rtc
  L0_3 = L0_3.clear
  L0_3(L0_3)
  L0_3 = Rtc
  L0_3 = L0_3.setDailyCallback
  L0_3(L0_3, setDaily)
  function L0_3()
    local L0_4, L1_5
  end
  __livelyMainFunc = L0_3
end
function stopLivelyEvent()
  __freeTime = nil
  __ftNum = 0
  Rtc:clear()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_rainbow:kill()
  _le_bunger:kill()
  _le_rat:kill()
  _le_gravity:kill()
  __livelytimetable = {}
  function __livelyMainFunc()
    local L0_6, L1_7
  end
end
function setTimeTable()
  for _FORV_3_ = 1, #lively_time_table do
    if lively_time_table[_FORV_3_][LIVELY_TIME_HEADER][LIVELY_TIME_FREE_MODE] == __freeTime then
      for _FORV_8_ = 2, #lively_time_table[_FORV_3_] do
        ;({})[_FORV_8_ - 1] = replaceTimeTable(lively_time_table[_FORV_3_][_FORV_8_])
      end
      __livelytimetable = {}
      break
    end
  end
  if _FOR_ >= 14 and __ftNum <= 18 then
    _le_bunger:init()
  elseif __ftNum >= 21 and __ftNum <= 28 then
    _le_bunger:init()
  end
end
function replaceTimeTable(A0_8)
  local L1_9, L2_10
  L1_9 = {}
  L2_10 = LIVELY_TIME_NAME
  L2_10 = A0_8[L2_10]
  L1_9.name = L2_10
  L2_10 = LIVELY_TIME_MONTH
  L2_10 = A0_8[L2_10]
  L1_9.month = L2_10
  L2_10 = LIVELY_TIME_DAY
  L2_10 = A0_8[L2_10]
  L1_9.day = L2_10
  L2_10 = LIVELY_TIME_HOUR
  L2_10 = A0_8[L2_10]
  L1_9.hour = L2_10
  L2_10 = LIVELY_TIME_MINUTE
  L2_10 = A0_8[L2_10]
  L1_9.minute = L2_10
  L2_10 = LIVELY_TIME_SECOND
  L2_10 = A0_8[L2_10]
  L1_9.second = L2_10
  return L1_9
end
function duringFade()
  if HUD:faderAlpha() > 0.1 then
  else
  end
  return false
end
function setDaily(A0_11, A1_12, A2_13, A3_14, A4_15)
  local L5_16, L6_17, L7_18, L8_19, L9_20, L10_21
  L5_16 = {}
  L6_17(L7_18)
  L6_17(L7_18, L8_19, L9_20, L10_21, L7_18(L8_19, L9_20, L10_21, A2_13, A3_14))
  L6_17(L7_18)
  L6_17.month = A0_11
  L6_17.day = A1_12
  L6_17.hour = A2_13
  L6_17.minute = A3_14
  for L9_20 = 1, #L7_18 do
    L10_21("Sarch : " .. __livelytimetable[L9_20].name)
    if L10_21 == A0_11 then
    else
      if L10_21 ~= A1_12 then
    end
    elseif L10_21 == 0 then
      L5_16.name = L10_21
      L5_16.hour = L10_21
      L5_16.minute = L10_21
      L5_16.second = L10_21
      L10_21(L5_16)
      L10_21("local event was set : " .. L5_16.name .. " > " .. tostring(L5_16.hour) .. ":" .. tostring(L5_16.minute) .. ":" .. tostring(L5_16.second))
    end
  end
  for L9_20 = 0, 24 do
    debugPrint("local set rainbow : " .. L9_20 .. ":" .. L10_21 .. ":00")
    Rtc:pushCallback(L9_20, L10_21, 0, rainbowSet)
  end
  if L6_17 == L7_18 then
    if L6_17 == L7_18 then
      L6_17(L7_18, L8_19)
      L6_17(L7_18)
    end
  else
    L6_17(L7_18, L8_19)
    L6_17(L7_18)
  end
  L6_17(L7_18)
  if L6_17 ~= nil then
    if L7_18 then
      if L8_19 then
        for _FORV_11_, _FORV_12_ in L8_19(L9_20) do
          if _FORV_12_.month == A0_11 and _FORV_12_.day == A1_12 or _FORV_12_.month == 0 and _FORV_12_.day == 0 then
            L5_16.name = _FORV_12_.type
            L5_16.hour = _FORV_12_.hour
            L5_16.minute = _FORV_12_.minute
            L5_16.second = _FORV_12_.second
            setTimeevent(L5_16)
            debugPrint("network event was set : " .. _FORV_12_.type .. " > " .. tostring(L5_16.hour) .. ":" .. tostring(L5_16.minute) .. ":" .. tostring(L5_16.second))
          end
        end
      end
    else
      L8_19(L9_20)
    end
  end
  L7_18(L8_19)
end
function setTimeevent(A0_22)
  if A0_22.name == "le17" then
    Rtc:pushCallback(A0_22.hour, A0_22.minute, A0_22.second, le17Set)
  elseif A0_22.name == "tsCl" then
    Rtc:pushCallback(A0_22.hour, A0_22.minute, A0_22.second, tsle16Set)
  elseif A0_22.name == "tsBl" then
    Rtc:pushCallback(A0_22.hour, A0_22.minute, A0_22.second, tsle07Set)
  elseif A0_22.name == "ts" then
    Rtc:pushCallback(A0_22.hour, A0_22.minute, A0_22.second, tsSet)
  elseif A0_22.name == "le13" then
    Rtc:pushCallback(A0_22.hour, A0_22.minute, A0_22.second, rainbowSet)
  end
end
function tsle07Set(A0_23, A1_24, A2_25, A3_26, A4_27)
  debugPrint(string.format("le bell run = %02d/%02d %02d:%02d", A0_23, A1_24, A2_25, A3_26))
  _le_bell:run()
end
function le17Set(A0_28, A1_29, A2_30, A3_31, A4_32)
  _le_bunger:run(A0_28, A1_29, A2_30, A3_31, A4_32)
  tsle07Set(A0_28, A1_29, A2_30, A3_31, A4_32)
  if __ftNum >= 21 and __ftNum <= 28 then
    tsle16Set(A0_28, A1_29, A2_30, A3_31, A4_32)
  end
end
function tsle16Set(A0_33, A1_34, A2_35, A3_36, A4_37)
  _le_clock:run(A0_33, A1_34, A2_35, A3_36, A4_37)
end
function tsSet(A0_38, A1_39, A2_40, A3_41, A4_42)
  tsle07Set(A0_38, A1_39, A2_40, A3_41, A4_42)
  tsle16Set(A0_38, A1_39, A2_40, A3_41, A4_42)
end
function rainbowSet(A0_43, A1_44, A2_45, A3_46, A4_47)
  debugPrint(string.format("le rainbow run = %02d/%02d %02d:%02d", A0_43, A1_44, A2_45, A3_46))
  _le_rainbow:run(A0_43, A1_44, A2_45, A3_46, A4_47)
end
function makeClockTiming()
  if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_jilga_01" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_jilga_02" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_jilga_03" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_jilga_04" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_world_01" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_world_02" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_world_03" then
    return true
  end
  return false
end
function makeBellTiming()
  local L0_48
  L0_48 = GameDatabase
  L0_48 = L0_48.get
  L0_48 = L0_48(L0_48, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if L0_48 == "ep24_c" or string.match(L0_48, "(.-)_()") == "ep25" or string.match(L0_48, "(.-)_()") == "ep26" then
    return false
  end
  if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_hex_01" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_hex_02" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_world_01" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_world_02" then
    return true
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentBgSet) == "bg_world_03" then
    return true
  end
  return false
end
function run()
  local L0_49, L1_50
  L0_49 = runLivelyEvent
  __livelyMainFunc = L0_49
end
function stop()
  local L0_51, L1_52
  L0_51 = stopLivelyEvent
  __livelyMainFunc = L0_51
end
import("Font")
import("Debug")
__debugline = 0
__debugDisp = false
__debug_Active = false
__debug_setPoint = nil
function debugPrint(A0_53)
  print(" < lvy mng > " .. A0_53)
end
function debugConversionEnemyPonint()
  local L0_54, L1_55, L2_56
  L0_54 = 0
  L1_55 = 0
  L2_56 = {}
  if #_le_gravity.leBattleTable >= 2 then
    if string.sub(g_debug_le_list[g_debug_counter], 9, 12) == "le10" then
      L1_55 = 1
    elseif string.sub(g_debug_le_list[g_debug_counter], 9, 12) == "le09" then
      L1_55 = 2
    else
      L1_55 = 1
    end
  else
    L1_55 = 1
  end
  for _FORV_6_ = 1, #_le_gravity.leBattleTable[L1_55] do
    if g_debug_le_list[g_debug_counter] == _le_gravity.leBattleTable[L1_55][_FORV_6_] then
      L0_54 = _FORV_6_
      break
    end
  end
  L2_56 = {L1_55, L0_54}
  return L2_56
end
function debugDisp()
  invokeTask(function()
    while true do
      if __debugDisp == true then
        __debugLine = 0
        __debugLine = __debugLine + _le_rainbow:debugDisp(0, __debugLine)
        __debugLine = __debugLine + _le_bell:debugDisp(0, __debugLine)
        __debugLine = __debugLine + _le_clock:debugDisp(0, __debugLine)
        __debugLine = __debugLine + _le_monument:debugDisp(0, __debugLine)
        __debugLine = 0
        __debugLine = __debugLine + _le_rat:debugDisp(230, __debugLine)
        __debugLine = __debugLine + _le_bunger:debugDisp(230, __debugLine)
      end
      wait()
    end
  end)
end
function debugDispPirint(A0_57)
  if Debug:isDebugMenuOpen() == true then
    Font:debugPrint(250, 50 + 20 * __debugLine, A0_57)
  else
    Font:debugPrint(50, 50 + 20 * __debugLine, A0_57)
  end
  __debugLine = __debugLine + 1
end
function debugLivelyEvent()
  if g_debug_le_list[g_debug_counter] == nil then
    debugPrint("\227\131\170\227\130\185\227\131\136\227\129\175\231\169\186\227\129\167\227\129\153")
    return
  end
  _le_gravity:rerease()
  __debug_Active = true
  __debug_setPoint = debugConversionEnemyPonint()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_gravity:run()
end
function debugLivelyRainbowEvent()
  if g_debug_le13_list[g_debug_counter2] == nil then
    debugPrint("\227\131\170\227\130\185\227\131\136\227\129\175\231\169\186\227\129\167\227\129\153")
    return
  end
  Rtc:clear()
  _le_rainbow:kill()
  if g_debug_le13_list[g_debug_counter2] == "4 O'clock" then
    _le_rainbow.run(_le_rainbow, 0, 0, 4, 0, 0)
  elseif g_debug_le13_list[g_debug_counter2] == "12 O'clock" then
    _le_rainbow.run(_le_rainbow, 0, 0, 12, 0, 0)
  elseif g_debug_le13_list[g_debug_counter2] == "20 O'clock" then
    _le_rainbow.run(_le_rainbow, 0, 0, 20, 0, 0)
  end
end
function debugLivelyBellsEvent()
  if __ftNum >= 2 and __ftNum <= 4 then
  else
  end
  if not false then
    debugPrint("\227\129\147\227\129\174\227\131\158\227\131\131\227\131\151\227\129\167\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  Rtc:clear()
  __debug_Active = true
  _le_gravity:rerease()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_bell:run()
end
function debugLivelyFireworksEvent()
  if __ftNum >= 2 and __ftNum <= 4 then
  else
  end
  if not false then
    debugPrint("\227\129\147\227\129\174\227\131\158\227\131\131\227\131\151\227\129\167\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  Rtc:clear()
  _le_bunger:terminate()
  _le_gravity:rerease()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_bunger:run(0, 0, 4, 0, 0)
end
function debugLivelyNewYearFireworksEvent()
  if __ftNum >= 2 and __ftNum <= 4 then
  else
  end
  if not false then
    debugPrint("\227\129\147\227\129\174\227\131\158\227\131\131\227\131\151\227\129\167\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  Rtc:clear()
  _le_bunger:terminate()
  _le_gravity:rerease()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_bunger:run(1, 1, 21, 0, 0)
end
function debugClockSpSignalEvent()
  if __ftNum >= 2 and __ftNum <= 4 then
  else
  end
  if not false then
    debugPrint("\227\129\147\227\129\174\227\131\158\227\131\131\227\131\151\227\129\167\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  Rtc:clear()
  __debug_Active = true
  _le_gravity:rerease()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_clock:stop()
  _le_clock:run(0, 0, 0, 0, 0)
end
function debugClockSignalEvent()
  if __ftNum >= 2 and __ftNum <= 4 then
  else
  end
  if not false then
    debugPrint("\227\129\147\227\129\174\227\131\158\227\131\131\227\131\151\227\129\167\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  Rtc:clear()
  __debug_Active = true
  _le_gravity:rerease()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_clock:stop()
  _le_clock:run(0, 0, 1, 0, 0)
end
function debugMonumentEvent()
  if __ftNum >= 2 and __ftNum <= 4 then
  else
  end
  if not false then
    debugPrint("\227\129\147\227\129\174\227\131\158\227\131\131\227\131\151\227\129\167\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  Rtc:clear()
  __debug_Active = true
  _le_gravity:rerease()
  _le_gravity:_killActiveTypeTimer()
  _le_gravity:_killSleepTypeTimer()
  _le_monument:setTime(not _le_monument:getTime())
end
g_debug_le_list = {}
g_debug_counter = 1
g_debug_le13_list = {
  "4 O'clock",
  "12 O'clock",
  "20 O'clock"
}
g_debug_counter2 = 1
g_customDebugMenu = {
  {
    name = "SelectBattlePoint",
    get = function()
      return g_debug_le_list[g_debug_counter]
    end,
    up = function()
      local L0_58, L1_59
      L0_58 = g_debug_counter
      L0_58 = L0_58 - 1
      g_debug_counter = L0_58
      L0_58 = g_debug_counter
      if L0_58 <= 0 then
        L0_58 = g_debug_le_list
        L0_58 = #L0_58
        g_debug_counter = L0_58
      end
    end,
    down = function()
      local L0_60, L1_61
      L0_60 = g_debug_counter
      L0_60 = L0_60 + 1
      g_debug_counter = L0_60
      L0_60 = g_debug_counter
      L1_61 = g_debug_le_list
      L1_61 = #L1_61
      if L0_60 > L1_61 then
        g_debug_counter = 1
      end
    end
  },
  {
    name = "SpawnLivelyEnemy",
    callback = function()
      invokeTask(debugLivelyEvent)
    end
  },
  {
    name = "SelectRanibowTime",
    get = function()
      return g_debug_le13_list[g_debug_counter2]
    end,
    up = function()
      local L0_62, L1_63
      L0_62 = g_debug_counter2
      L0_62 = L0_62 - 1
      g_debug_counter2 = L0_62
      L0_62 = g_debug_counter2
      if L0_62 <= 0 then
        L0_62 = g_debug_le13_list
        L0_62 = #L0_62
        g_debug_counter2 = L0_62
      end
    end,
    down = function()
      local L0_64, L1_65
      L0_64 = g_debug_counter2
      L0_64 = L0_64 + 1
      g_debug_counter2 = L0_64
      L0_64 = g_debug_counter2
      L1_65 = g_debug_le13_list
      L1_65 = #L1_65
      if L0_64 > L1_65 then
        g_debug_counter2 = 1
      end
    end
  },
  {
    name = "StartRainbowTime",
    callback = function()
      debugLivelyRainbowEvent()
    end
  },
  {
    name = "StartRingingBells",
    callback = function()
      debugLivelyBellsEvent()
    end
  },
  {
    name = "StartFireworks",
    callback = function()
      debugLivelyFireworksEvent()
    end
  },
  {
    name = "StartNewYearFireworks",
    callback = function()
      debugLivelyNewYearFireworksEvent()
    end
  },
  {
    name = "StartTimeSignal",
    callback = function()
      debugClockSignalEvent()
    end
  },
  {
    name = "StartSpecialTimeSignal",
    callback = function()
      debugClockSpSignalEvent()
    end
  },
  {
    name = "StartMonument",
    callback = function()
      debugMonumentEvent()
    end
  },
  {
    name = "DebugDisp",
    callback = function()
      local L1_66
      L1_66 = __debugDisp
      L1_66 = not L1_66
      __debugDisp = L1_66
    end
  }
}
