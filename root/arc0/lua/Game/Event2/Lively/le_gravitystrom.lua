import("EventHelper")
import("Mob")
import("Vehicle")
import("Vision")
LeGravityStrom = {}
dofile("/Game/Event2/Table/LivelyBattleTable.lua")
dofile("/Game/Event2/Table/LivelySurpriseTable.lua")
LIVELY_NAME = 1
LIVELY_STAY_TIME_SET = 2
LIVELY_RATIO = 3
LIVELY_STAY_TIME = 60
LIVELY_STAY_TIME_AFTER = 180
LIVELY_BATTLE_STAY = 1200
LIVELY_BATTLE_STAY_AFTER = 1200
LIVELY_RATIO_TIME = 30
LIVELY_LOST_TIME_BEFORE = 1800
LIVELY_LOST_TIME_AFTER = 1800
LIVELY_LOST_TIME_ESCAPE = 300
LIVELY_JI_TIME_MAG = 1
LIVELY_LEAVE_TIME = 450
MARKER_ON_DIST = 70
MARKER_OFF_DIST = 30
__requestSE = false
__playerLocation = nil
__catwarp = false
__gravitystrom_event = false
invokeTask(function()
  local L0_0
  L0_0 = 0
  while true do
    wait()
    if GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      while GameDatabase:get(ggd.GlobalSystemFlags__GameOver) do
        wait()
      end
      __gravitystrom_event = false
      __requestNotice = true
      __pcOutRange = false
    end
  end
end)
function LeGravityStrom.create()
  local L0_1
  L0_1 = {}
  L0_1.name = "gravitystrom"
  L0_1.evb = {
    le10po_aEvd = nil,
    le12po_aEvd = nil,
    le09ed_aEvd = nil,
    le09id_aEvd = nil,
    le09dt_aEvd = nil,
    le09cc_aEvd = nil,
    le10po_aEvd = nil,
    le10mi_aEvd = nil,
    le10lo_aEvd = nil,
    le10up_aEvd = nil,
    le11ed_aEvd = nil,
    le11id_aEvd = nil,
    le11dt_aEvd = nil,
    le11cc_aEvd = nil,
    le12po_aEvd = nil,
    le12mi_aEvd = nil,
    le12lo_aEvd = nil,
    le12up_aEvd = nil
  }
  L0_1.task = nil
  L0_1.timeTask = nil
  L0_1.leaveGameTask = nil
  L0_1.effectEyeTask = nil
  L0_1.activeType = {
    name = nil,
    timer = nil,
    task = nil
  }
  L0_1.sleepType = {
    name = nil,
    timer = nil,
    task = nil
  }
  L0_1.leTable = {}
  L0_1.leBattleTable = {}
  L0_1.findeLocation = {
    Location01 = nil,
    Location02 = nil,
    Location03 = nil,
    Location04 = nil,
    Location05 = nil,
    Location06 = nil
  }
  L0_1.setEffect = {
    effect_storm = nil,
    effect_eye = nil,
    spn = "",
    area = nil,
    stormSE = nil
  }
  L0_1.eventRateio = 0
  L0_1.eventTime = 0
  L0_1.deflectTime = 0
  L0_1.disappearTime = 0
  L0_1.oldPoint = nil
  L0_1.leaveEnd = false
  L0_1.leaveMode = false
  L0_1.setEnemy = nil
  L0_1.hideEnemy = nil
  LeGravityStrom._installMethods(L0_1)
  return L0_1
end
function LeGravityStrom.init(A0_2)
  A0_2:_setLivelyEventData()
  A0_2:_loadEvbToAreaTable()
  A0_2:_leaveGame()
end
function LeGravityStrom.run(A0_3)
  if A0_3.leBattleTable == nil then
    print("\227\131\144\227\131\136\227\131\171\227\129\174\228\189\141\231\189\174\227\131\135\227\131\188\227\130\191\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\159\227\130\129\227\128\129\228\187\138\229\155\158\227\129\175\231\153\186\231\148\159\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  if __ftNum >= 10 and __ftNum <= 11 then
    A0_3:_eventTownBattle()
  end
end
function LeGravityStrom.kill(A0_4)
  A0_4:rerease()
  if A0_4.leaveGameTask ~= nil and leaveGameTask:isRunning() then
    A0_4.leaveGameTask:abort()
    A0_4.leaveGameTask = nil
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_4.evb) do
    if _FORV_5_ ~= nil then
      _FORV_5_:kill()
      _FORV_5_ = nil
    end
  end
  Mob:makeSituationPanic(false)
end
function LeGravityStrom.rerease(A0_5)
  if A0_5.setEnemy ~= nil then
    A0_5.setEnemy:requestAllEnemyKill()
    A0_5.setEnemy = nil
  end
  if A0_5.hideEnemy ~= nil then
    A0_5.hideEnemy:requestAllEnemyKill()
    A0_5.hideEnemy = nil
  end
  if A0_5.task ~= nil and A0_5.task:isRunning() then
    A0_5.task:abort()
    A0_5.task = nil
  end
  if A0_5.timeTask ~= nil and A0_5.timeTask:isRunning() then
    A0_5.timeTask:abort()
    A0_5.timeTask = nil
  end
  if A0_5.leaveGameTask ~= nil and leaveGameTask:isRunning() then
    A0_5.leaveGameTask:abort()
    A0_5.leaveGameTask = nil
  end
  if __requestPanic == false then
    Mob:makeSituationPanic(false)
    Vehicle:SetPanic(false)
    __requestPanic = false
  end
  A0_5:_killBattleEffect()
end
function LeGravityStrom._setLivelyEventData(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  L1_7 = 0
  L2_8 = 0
  for _FORV_6_ = 1, #L4_10 do
    if setLivelyBattle[_FORV_6_][LIVELY_BATTLE_FT_ON][LIBELY_RATIO_FT] == __freeTime then
      A0_6.eventRateio = setLivelyBattle[_FORV_6_][LIVELY_BATTLE_FT_ON][LIBELY_RATIO_EVE]
      L2_8 = setLivelyBattle[_FORV_6_][LIVELY_BATTLE_FT_ON][LIBELY_RATIO_HEX]
      L1_7 = setLivelyBattle[_FORV_6_][LIVELY_BATTLE_FT_ON][LIBELY_RATIO_JIL]
      for _FORV_10_ = 2, #setLivelyBattle[_FORV_6_] do
        A0_6.leBattleTable[_FORV_10_ - 1] = setLivelyBattle[_FORV_6_][_FORV_10_]
      end
      break
    end
  end
  if L3_9 <= 21 then
    A0_6.eventTime = L3_9
    A0_6.deflectTime = L3_9
  else
    A0_6.eventTime = L3_9
    A0_6.deflectTime = L3_9
  end
  if L3_9 <= 20 then
    A0_6.disappearTime = L3_9
  else
    A0_6.disappearTime = L3_9
  end
  if __ftNum >= 10 and __ftNum <= 11 then
  else
  end
  for _FORV_9_ = 1, 2 do
    if ({L4_10, L3_9})[_FORV_9_] ~= nil then
      A0_6.leTable[({L4_10, L3_9})[_FORV_9_][LIVELY_NAME]] = A0_6:_replaceLivelyTable(({L4_10, L3_9})[_FORV_9_])
    end
  end
  for _FORV_10_ = 1, #A0_6.leBattleTable do
    for _FORV_14_ = 1, #A0_6.leBattleTable[_FORV_10_] do
      g_debug_le_list[1] = A0_6.leBattleTable[_FORV_10_][_FORV_14_]
    end
  end
end
function LeGravityStrom._replaceLivelyTable(A0_11, A1_12, A2_13)
  local L3_14, L4_15
  L3_14 = {}
  L4_15 = LIVELY_NAME
  L4_15 = A1_12[L4_15]
  L3_14.name = L4_15
  L4_15 = LIVELY_STAY_TIME_SET
  L4_15 = A1_12[L4_15]
  L3_14.stay_time = L4_15
  L4_15 = LIVELY_RATIO
  L4_15 = A1_12[L4_15]
  L3_14.raitio = L4_15
  L3_14.battle_table = nil
  return L3_14
end
function LeGravityStrom._loadEvbToAreaTable(A0_16)
  for _FORV_4_, _FORV_5_ in pairs(A0_16.leTable) do
    if _FORV_5_.name == "le10" then
      A0_16:_loadGStormEvb("le10_po_a", "le10po_aEvd")
      A0_16:_loadGStormEvb("le10_mi_a", "le10mi_aEvd")
      A0_16:_loadGStormEvb("le10_lo_a", "le10lo_aEvd")
      A0_16:_loadGStormEvb("le10_up_a", "le10up_aEvd")
      A0_16:_loadGStormEvb("le12_po_a", "le12po_aEvd")
      A0_16:_loadGStormEvb("le12_mi_a", "le12mi_aEvd")
      A0_16:_loadGStormEvb("le12_lo_a", "le12lo_aEvd")
      A0_16:_loadGStormEvb("le12_up_a", "le12up_aEvd")
    end
  end
end
function LeGravityStrom._loadGStormEvb(A0_17, A1_18, A2_19)
  invokeSystemTask(function()
    local L0_20, L1_21, L2_22
    L0_20 = "evx/"
    L1_21 = A1_18
    L0_20 = L0_20 .. L1_21
    L1_21 = debugPrint
    L2_22 = "load evb "
    L2_22 = L2_22 .. L0_20 .. " start ..."
    L1_21(L2_22)
    L1_21 = loadFileAsset
    L2_22 = "evb"
    L1_21 = L1_21(L2_22, L0_20)
    if L1_21 ~= nil then
      L2_22 = L1_21.wait
      L2_22(L1_21)
      L2_22 = L1_21.getRoot
      L2_22 = L2_22(L1_21)
      A0_17.evb[A2_19] = EventData:create(A1_18, handle, L2_22)
      A0_17.evb[A2_19]:try_init()
      A0_17.evb[A2_19]:waitForReady()
      if A0_17.evb[A2_19] == nil then
        debugPrint("load evb " .. L0_20 .. " Error")
        return
      end
      A0_17.evb[A2_19]:try_start()
      debugPrint("load evb " .. L0_20 .. " finish!!")
    else
      L2_22 = debugPrint
      L2_22("load evb " .. L0_20 .. " nil")
    end
  end)
end
function LeGravityStrom._sleepTask(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = A0_23.task
  if L2_25 ~= nil then
    L2_25 = A0_23.task
    L3_26 = L2_25
    L2_25 = L2_25.isRunning
    L2_25 = L2_25(L3_26)
    if L2_25 then
      L2_25 = A0_23.task
      L3_26 = L2_25
      L2_25 = L2_25.abort
      L2_25(L3_26)
      A0_23.task = nil
    end
  end
  L2_25 = debugPrint
  L3_26 = "\228\188\145\231\156\160\230\153\130\233\150\147\227\129\174\227\130\191\227\130\164\227\131\158\227\131\188\227\130\179\227\131\188\227\131\171\227\131\144\227\131\131\227\130\175\227\130\146\227\130\187\227\131\131\227\131\136"
  L2_25(L3_26)
  L3_26 = A0_23
  L2_25 = A0_23._setMagnification
  L2_25 = L2_25(L3_26)
  L2_25 = A1_24 * L2_25
  L3_26 = debugPrint
  L3_26(L2_25 .. " \231\167\146\229\190\140\227\129\171\228\188\145\231\156\160\230\153\130\233\150\147\227\129\140\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
  function L3_26()
    debugPrint("\227\128\140setActiveTypeTimer\227\128\141\227\130\146\231\153\186\229\139\149\227\129\151\227\129\190\227\129\153")
    A0_23:rerease()
    A0_23:_setActiveTypeTimer(0)
    A0_23.sleepType.timer = nil
  end
  A0_23.sleepType.timer = EventHelper:timerCallback("\233\135\141\229\138\155\229\181\144\228\188\145\231\156\160\230\153\130\233\150\147", L2_25, L3_26)
end
function LeGravityStrom._setActiveTypeTimer(A0_27, A1_28)
  local L2_29, L3_30
  L2_29 = RandI
  L3_30 = 1
  L2_29 = L2_29(L3_30, A0_27.deflectTime)
  L2_29 = A1_28 + L2_29
  L3_30 = A0_27._setMagnification
  L3_30 = L3_30(A0_27)
  L2_29 = L2_29 * L3_30
  L3_30 = debugPrint
  L3_30(L2_29 .. " \231\167\146\229\190\140\227\129\171\231\153\186\229\139\149\227\129\151\227\129\190\227\129\153")
  function L3_30()
    A0_27.timeTask = nil
    A0_27:run()
    A0_27.activeType.timer = nil
  end
  A0_27.activeType.timer = EventHelper:timerCallback("activeTask\231\153\186\229\139\149", L2_29, L3_30)
end
function LeGravityStrom._killActiveTypeTimer(A0_31)
  if A0_31.activeType.timer ~= nil then
    if A0_31.activeType.timer:isRunning() then
      A0_31.activeType.timer:abort()
      debugPrint("activeType\227\129\174\232\181\183\229\139\149\227\130\191\227\130\164\227\131\158\227\131\188\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
    end
    A0_31.activeType.timer = nil
  end
end
function LeGravityStrom._killSleepTypeTimer(A0_32)
  if A0_32.sleepType.timer ~= nil then
    if A0_32.sleepType.timer:isRunning() then
      A0_32.sleepType.timer:abort()
      debugPrint("sleepType\227\129\174\232\181\183\229\139\149\227\130\191\227\130\164\227\131\158\227\131\188\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
    end
    A0_32.sleepType.timer = nil
  end
end
function LeGravityStrom._killBattleEffect(A0_33)
  if A0_33.effectEyeTask ~= nil and A0_33.effectEyeTask:isRunning() then
    A0_33.effectEyeTask:abort()
    A0_33.effectEyeTask = nil
  end
  if A0_33.setEffect.effect_eye ~= nil and A0_33.setEffect.effect_eye:isRunning() then
    A0_33.setEffect.effect_eye:try_term()
    A0_33.setEffect.effect_eye = nil
  end
  if A0_33.setEffect.effect_storm ~= nil and A0_33.setEffect.effect_storm:isRunning() then
    A0_33.setEffect.effect_storm:try_term()
    A0_33.setEffect.effect_storm = nil
  end
  if A0_33.setEffect.stormSE ~= nil then
    Sound:stopSEHandle(A0_33.setEffect.stormSE)
    A0_33.setEffect.stormSE = nil
  end
  if A0_33.setEffect.area ~= nil and A0_33.setEffect.spn ~= nil then
    A0_33.setEffect.area:setSceneParameters(A0_33.setEffect.spn)
  end
end
function LeGravityStrom._eventTownBattle(A0_34)
  wait()
  A0_34.task = invokeTask(function()
    local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50, L16_51
    while true do
      L0_35 = __debug_Active
      if L0_35 ~= true then
        L0_35 = RandI
        L1_36 = 1
        L2_37 = 100
        L0_35 = L0_35(L1_36, L2_37)
        L1_36 = A0_34.eventRateio
      end
      if not (L0_35 <= L1_36) then
        L0_35 = waitSeconds
        L1_36 = LIVELY_RATIO_TIME
        L0_35(L1_36)
        L0_35 = debugPrint
        L1_36 = "Re-lottery"
        L0_35(L1_36)
      end
    end
    L0_35 = 0
    L1_36 = 0
    L2_37 = 0
    L3_38 = 0
    L4_39 = 100
    L5_40 = 1
    L6_41 = nil
    L7_42 = {}
    L8_43 = ""
    L9_44 = __debug_Active
    if L9_44 == true then
      L9_44 = __debug_setPoint
      L1_36 = L9_44[1]
      L9_44 = __debug_setPoint
      L2_37 = L9_44[2]
      __debug_Active = false
      L9_44 = A0_34.leBattleTable
      L9_44 = L9_44[L1_36]
      L8_43 = L9_44[L2_37]
      L9_44 = string
      L9_44 = L9_44.sub
      L10_45 = L8_43
      L9_44 = L9_44(L10_45, L11_46, L12_47)
      __playerLocation = L9_44
    else
      L9_44 = A0_34.leBattleTable
      L9_44 = #L9_44
      if L9_44 >= 2 then
        L9_44 = RandI
        L10_45 = 1
        L9_44 = L9_44(L10_45, L11_46)
        L0_35 = L9_44
        L9_44 = A0_34.leTable
        L9_44 = L9_44.le09
        L9_44 = L9_44.raitio
        if L0_35 < L9_44 then
          L1_36 = 1
        else
          L9_44 = A0_34.leTable
          L9_44 = L9_44.le10
          L9_44 = L9_44.raitio
          if L0_35 >= L9_44 then
            L1_36 = 2
          else
            L1_36 = 1
          end
        end
      else
        L1_36 = 1
      end
      L9_44 = false
      repeat
        L10_45 = Player
        L10_45 = L10_45.getRecentAreaName
        L10_45 = L10_45(L11_46)
        if L10_45 ~= nil then
          L14_49 = 2
          __playerLocation = L11_46
          for L14_49 = 1, #L12_47 do
            L15_50 = string
            L15_50 = L15_50.sub
            L15_50 = L15_50(L16_51, 14, 13 + string.len(L10_45))
            L6_41 = L15_50
            if L6_41 == L10_45 then
              L15_50 = A0_34.leBattleTable
              L15_50 = L15_50[L1_36]
              L15_50 = L15_50[L14_49]
              L7_42[L5_40] = L15_50
              L5_40 = L5_40 + 1
            end
          end
          if L11_46 > 0 then
            for L14_49 = 1, #L7_42 do
              L15_50 = Fn_getDistanceToPlayer
              L15_50 = L15_50(L16_51)
              L3_38 = L15_50
              if L4_39 > L3_38 then
                L2_37 = L14_49
                L4_39 = L3_38
              end
            end
            if L2_37 > 0 and L4_39 < 100 then
              L8_43 = L7_42[L2_37]
              L9_44 = true
            end
          else
            L11_46(L12_47)
            if L11_46 == 1 then
              L14_49 = A0_34.leTable
              L14_49 = L14_49.le10
              L14_49 = L14_49.stay_time
              L12_47(L13_48, L14_49)
            else
              L14_49 = LIVELY_STAY_TIME
              L12_47(L13_48, L14_49)
            end
            return
          end
          L7_42 = L11_46
          L5_40 = 0
        end
        L11_46()
      until L9_44
      L10_45 = __playerLocation
      if L10_45 == nil then
        L10_45 = string
        L10_45 = L10_45.sub
        L10_45 = L10_45(L11_46, L12_47, L13_48)
        __playerLocation = L10_45
      end
    end
    L9_44 = A0_34.setEnemy
    if L9_44 ~= nil then
      L9_44 = A0_34.setEnemy
      L10_45 = L9_44
      L9_44 = L9_44.requestAllEnemyKill
      L9_44(L10_45)
    end
    L9_44 = findGameObject2
    L10_45 = "EnemyGenerator"
    L9_44 = L9_44(L10_45, L11_46)
    A0_34.setEnemy = L9_44
    L9_44 = string
    L9_44 = L9_44.sub
    L10_45 = L8_43
    L9_44 = L9_44(L10_45, L11_46, L12_47)
    L10_45 = A0_34.setEnemy
    if L10_45 ~= nil then
      L10_45 = A0_34.leaveMode
    elseif L10_45 == true then
      L10_45 = debugPrint
      L10_45(L11_46)
      L10_45 = GameDatabase
      L10_45 = L10_45.get
      L10_45 = L10_45(L11_46, L12_47)
      if L10_45 == 1 then
        L11_46(L12_47, L13_48)
      else
        L11_46(L12_47, L13_48)
      end
      return
    end
    L10_45 = A0_34.setEnemy
    L10_45 = L10_45.getActive
    L10_45 = L10_45(L11_46)
    if L10_45 == false then
      L10_45 = A0_34.setEnemy
      L10_45 = L10_45.setActive
      L10_45(L11_46, L12_47)
    end
    L10_45 = A0_34.hideEnemy
    if L10_45 ~= nil then
      L10_45 = A0_34.hideEnemy
      L10_45 = L10_45.getActive
      L10_45 = L10_45(L11_46)
      if L10_45 == false then
        L10_45 = A0_34.hideEnemy
        L10_45 = L10_45.setActive
        L10_45(L11_46, L12_47)
      end
    end
    L10_45 = string
    L10_45 = L10_45.sub
    L10_45 = L10_45(L11_46, L12_47)
    if L9_44 == "le09" then
    else
    end
    L14_49 = "_hide"
    L15_50 = L10_45
    L14_49 = L11_46
    L15_50 = "_hide"
    L14_49 = findGameObject2
    L15_50 = "EnemyGenerator"
    L14_49 = L14_49(L15_50, L16_51)
    A0_34.hideEnemy = L14_49
    __hideEnemyMove = 0
    __hideEnemySpawn = false
    L14_49 = A0_34
    L15_50 = L14_49
    L14_49 = L14_49._setEnemyLocator
    L14_49(L15_50)
    L14_49 = A0_34
    L15_50 = L14_49
    L14_49 = L14_49._setHideLocator
    L14_49(L15_50)
    L14_49 = A0_34
    L15_50 = L14_49
    L14_49 = L14_49._setMonitorPoint
    L14_49(L15_50, L16_51)
    L14_49 = A0_34.setEnemy
    L15_50 = L14_49
    L14_49 = L14_49.requestSpawn
    L14_49(L15_50)
    L14_49 = debugPrint
    L15_50 = L8_43
    L15_50 = L15_50 .. L16_51
    L14_49(L15_50)
    L14_49 = A0_34.setEnemy
    L15_50 = L14_49
    L14_49 = L14_49.getUid
    L14_49 = L14_49(L15_50)
    __nowBattlePlace = L14_49
    L14_49 = debugPrint
    L15_50 = __nowBattlePlace
    L15_50 = L15_50 .. L16_51
    L14_49(L15_50)
    __requestPanic = false
    __battle_end = false
    L14_49 = false
    L15_50 = false
    A0_34.leaveEnd = false
    L16_51(L16_51)
    repeat
      if not L16_51 then
        if L16_51 ~= nil then
          if not L16_51 then
            L16_51(L16_51)
            __hideEnemySpawn = true
          end
        end
      else
        L16_51(L16_51)
      end
      if L16_51 == false then
      else
      end
      if L15_50 == true then
        if L16_51 <= MARKER_OFF_DIST then
          L16_51()
          L15_50 = false
        end
      elseif L16_51 >= MARKER_ON_DIST then
        L16_51(A0_34.setEnemy)
        L16_51("ic_warning_00110")
        L15_50 = true
      end
      if L16_51 then
        L16_51(L16_51, ggd.Savedata__EventFlags__other__flag01, 1)
        __gravitystrom_event = true
        L16_51(function()
          Fn_setFreeTimeAllNpcActive(false)
          Fn_setFreeTimeAllMarkerActive(false)
          Fn_setFreeTimeAllGhosActive(false)
          waitSeconds(2)
          Mob:makeSituationPanic(true)
          if A0_34.setEnemy ~= nil then
            Vehicle:SetPanic(true, A0_34.setEnemy:getWorldPos())
          end
          waitSeconds(1)
          if RandI(0, 10) > 5 then
            Fn_captionView("ic_lively_00110")
          else
            Fn_captionView("ic_lively_00111")
          end
          Fn_setBgmPoint("event", "le_battle_start")
        end)
        __requestNotice = false
      end
      if L16_51 == false then
        L14_49 = L16_51 and L16_51 <= 0
      else
        L14_49 = A0_34.leaveEnd
      end
      L16_51()
    until L14_49
    L16_51(L16_51)
    if L16_51 ~= nil then
      if L16_51 then
        L16_51(L16_51)
      end
    end
    for _FORV_19_, _FORV_20_ in L16_51(A0_34.findeLocation) do
      if _FORV_20_ ~= nil then
        _FORV_20_ = nil
      end
    end
    if L16_51 ~= nil then
      L16_51(L16_51)
      L16_51.brainEne_01 = nil
    end
    if L16_51 ~= nil then
      L16_51(L16_51)
      L16_51.brainEne_02 = nil
    end
    if L16_51 ~= nil then
      L16_51(L16_51)
      L16_51.brainEne_03 = nil
    end
    if L16_51 == false then
      L16_51("event", "le_battle_end")
      L16_51()
      if L16_51 > 5 then
        L16_51("ic_lively_00112")
      else
        L16_51("ic_lively_00113")
      end
      __requestNotice = true
      L16_51(L16_51, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    else
      L16_51(L16_51, false)
      if L16_51 ~= nil then
        L16_51(L16_51, false)
      end
    end
    if L15_50 == true then
      L16_51()
      L15_50 = false
    end
    L16_51(L16_51, false)
    L16_51(L16_51, false)
    L16_51(true)
    L16_51(true)
    L16_51(true)
    L16_51("\227\131\144\227\131\136\227\131\171\227\129\140\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
    L16_51(5)
    if L16_51 ~= nil then
      __playerLocation = string.sub(L16_51, 1, 2)
      if __playerLocation then
        print("\229\133\131\227\129\174\230\155\178\227\129\171\230\136\187\227\129\151\227\129\190\227\129\153", __playerLocation)
        if __playerLocation == "po" or __playerLocation == "mi" then
          Fn_setBgmPoint("event", "po_replace_bgm")
        elseif __playerLocation == "up" then
          Fn_setBgmPoint("event", "up_replace_bgm")
        elseif __playerLocation == "lo" then
          Fn_setBgmPoint("event", "lo_replace_bgm")
        end
        __playerLocation = nil
      end
    else
      print("\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\140\227\129\169\227\129\147\227\129\171\227\129\132\227\130\139\227\129\174\227\129\139\227\130\143\227\129\139\227\130\137\227\129\170\227\129\132\227\129\174\227\129\167\230\155\178\227\130\146\230\136\187\227\129\155\227\129\190\227\129\155\227\130\147\239\188\129", L16_51)
    end
    __nowBattlePlace = 0
    A0_34:_sleepTask(A0_34.leTable[L9_44].stay_time)
  end)
end
function LeGravityStrom._countDisappearTime(A0_52)
  A0_52.timeTask = invokeTask(function()
    debugPrint("\227\128\140\233\135\141\229\138\155\229\181\144\227\128\141\230\182\136\230\187\133\227\130\171\227\130\166\227\131\179\227\131\136\227\130\146\233\150\139\229\167\139\227\129\151\227\129\190\227\129\153")
    if A0_52.disappearTime == 0 or A0_52.disappearTime == nil then
      A0_52.disappearTime = LIVELY_LOST_TIME_BEFORE
    end
    repeat
      if __pcOutRange == true and __gravitystrom_event then
        A0_52.disappearTime = LIVELY_LOST_TIME_ESCAPE
        if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == false and __catwarp == false then
          __catwarp = true
          invokeTask(function()
            local L0_53, L1_54
            L0_53 = GameDatabase
            L1_54 = L0_53
            L0_53 = L0_53.get
            L0_53 = L0_53(L1_54, ggd.Savedata__EventManageFlags__EventCheckPoint)
            L1_54 = "locator2"
            L1_54 = L1_54 .. string.sub(A0_52.setEnemy:getName(), 8)
            GameDatabase:set(ggd.Savedata__EventManageFlags__EventCheckPoint, L1_54)
            Fn_catWarp()
            waitSeconds(2)
            Fn_userCtrlOn()
            wait(5)
            GameDatabase:set(ggd.Savedata__EventManageFlags__EventCheckPoint, L0_53)
            __catwarp = false
          end)
        end
      elseif __requestPanic == true then
        __requestPanic = false
      end
      wait()
    until __battle_end and 0 >= __hideEnemyMove
    if __ftNum <= 20 then
      A0_52.disappearTime = LIVELY_LOST_TIME_BEFORE
    else
      A0_52.disappearTime = LIVELY_LOST_TIME_AFTER
    end
    __gravitystrom_event = false
  end)
end
function LeGravityStrom._setEnemyLocator(A0_55)
  local L1_56
  L1_56 = 1
  if __ftNum >= 10 and __ftNum <= 11 then
    if A0_55:_isSkyLocation(A0_55.setEnemy:getName()) then
      L1_56 = 5
    else
      L1_56 = RandI(1, 5)
    end
    A0_55.setEnemy:getSpecTable().spawnSet = le10battleTable[L1_56]
  else
    return
  end
  A0_55:_setLocationEnemy()
end
function LeGravityStrom._setLocationEnemy(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68
  L1_58 = {}
  L2_59 = ""
  L3_60, L4_61 = nil, nil
  L5_62 = true
  L6_63 = false
  L7_64 = 1
  if L8_65 >= 5 then
    if L8_65 <= 11 then
      if L8_65 ~= nil then
        for L11_68 = 1, #L9_66 do
          L6_63 = false
          repeat
            L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSet[L11_68].type)
            L5_62 = true
            for _FORV_15_ = 1, #L1_58 do
              if L2_59 == L1_58[_FORV_15_] then
                L5_62 = false
              end
            end
            if L5_62 == true then
              L6_63 = true
            else
              L6_63 = false
            end
          until L6_63
          A0_57.setEnemy:getSpecTable().spawnSet[L11_68].locator = L2_59
          debugPrint("Enemy" .. L11_68 .. " : Set Location was " .. L2_59)
          L1_58[L7_64] = L2_59
          L7_64 = L7_64 + 1
        end
      end
    end
  else
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand0[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand0[L11_68].locator = L2_59
        debugPrint("Enemy1-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand1[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand1[L11_68].locator = L2_59
        debugPrint("Enemy2-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand2[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand2[L11_68].locator = L2_59
        debugPrint("Enemy3-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand3[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand3[L11_68].locator = L2_59
        debugPrint("Enemy4-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand4[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand4[L11_68].locator = L2_59
        debugPrint("Enemy5-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand5[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand5[L11_68].locator = L2_59
        debugPrint("Enemy6-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
    if L8_65 ~= nil then
      for L11_68 = 1, #L9_66 do
        L6_63 = false
        repeat
          L2_59 = A0_57:_setLocationDivide(A0_57.setEnemy:getSpecTable().spawnSethand6[L11_68].type)
          L5_62 = true
          for _FORV_15_ = 1, #L1_58 do
            if L2_59 == L1_58[_FORV_15_] then
              L5_62 = false
            end
          end
          if L5_62 == true then
            L6_63 = true
          else
            L6_63 = false
          end
        until L6_63
        A0_57.setEnemy:getSpecTable().spawnSethand6[L11_68].locator = L2_59
        debugPrint("Enemy7-" .. L11_68 .. " : Set Location was " .. L2_59)
        L1_58[L7_64] = L2_59
        L7_64 = L7_64 + 1
      end
    end
  end
end
function LeGravityStrom._isSkyLocation(A0_69, A1_70)
  local L2_71
  if A1_70 == "enmgen2_le10_mi_a_05_01" then
    L2_71 = true
    return L2_71
  elseif A1_70 == "enmgen2_le10_mi_a_21_05_01" then
    L2_71 = true
    return L2_71
  elseif A1_70 == "enmgen2_le10_mi_a_21_02_01" then
    L2_71 = true
    return L2_71
  end
  L2_71 = false
  return L2_71
end
function LeGravityStrom._setLocationDivide(A0_72, A1_73)
  local L2_74, L3_75, L4_76, L5_77
  L2_74 = ""
  L3_75 = 0
  L4_76 = 0
  L5_77 = ""
  if A1_73 == "stalker" then
    L2_74 = "locator_ground_"
    L4_76 = 6
  elseif A1_73 == "gellyfish" then
    L2_74 = "locator_sky_"
    L4_76 = 15
  elseif A1_73 == "imp" then
    L2_74 = "locator_sky_"
    L4_76 = 15
  elseif A1_73 == "runner" then
    L2_74 = "locator_ground_"
    L4_76 = 6
  else
    L2_74 = "locator_ground_"
    L4_76 = 6
  end
  L3_75 = RandI(1, L4_76)
  if L3_75 < 10 then
    L5_77 = L2_74 .. "0" .. L3_75
  else
    L5_77 = L2_74 .. L3_75
  end
  return L5_77
end
function LeGravityStrom._setHideLocator(A0_78)
  local L1_79, L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88, L11_89
  L1_79 = 0
  L2_80 = A0_78.hideEnemy
  if L2_80 == nil then
    return
  else
    L2_80 = A0_78.hideEnemy
    L3_81 = L2_80
    L2_80 = L2_80.isRunning
    L2_80 = L2_80(L3_81)
    if L2_80 == false then
      return
    end
  end
  L2_80 = __ftNum
  if L2_80 >= 10 then
    L2_80 = __ftNum
    if L2_80 <= 11 then
      L2_80 = RandI
      L3_81 = 1
      L4_82 = 3
      L2_80 = L2_80(L3_81, L4_82)
      L1_79 = L2_80
      L2_80 = A0_78.hideEnemy
      L3_81 = L2_80
      L2_80 = L2_80.getSpecTable
      L2_80 = L2_80(L3_81)
      L3_81 = le12battleTable
      L3_81 = L3_81[L1_79]
      L2_80.spawnSet = L3_81
    end
  else
    return
  end
  L2_80 = {}
  L3_81 = ""
  L4_82, L5_83 = nil, nil
  L6_84 = true
  L7_85 = false
  if L8_86 ~= nil then
    for L11_89 = 1, #L9_87 do
      L7_85 = false
      repeat
        L3_81 = A0_78:_setHideLocation()
        L6_84 = true
        for _FORV_15_ = 1, #L2_80 do
          if L3_81 == L2_80[_FORV_15_] then
            L6_84 = false
          end
        end
        if L6_84 == true then
          L7_85 = true
        else
          L7_85 = false
        end
      until L7_85
      A0_78.hideEnemy:getSpecTable().spawnSet[L11_89].locator = L3_81
      debugPrint("HideEnemy1-" .. L11_89 .. " : Set Location was " .. L3_81)
      L2_80[L11_89] = L3_81
    end
  end
end
function LeGravityStrom._setHideLocation(A0_90)
  local L1_91, L2_92, L3_93
  L1_91 = "locator_"
  L2_92 = 0
  L3_93 = ""
  L2_92 = RandI(1, 6)
  if L2_92 < 10 then
    L3_93 = L1_91 .. "0" .. L2_92
  else
    L3_93 = L1_91 .. L2_92
  end
  return L3_93
end
function LeGravityStrom._setMonitorPoint(A0_94, A1_95)
  local L2_96
  L2_96 = nil
  if A0_94.hideEnemy ~= nil and A0_94.hideEnemy:getSpecTable().spawnSet ~= nil then
    for _FORV_6_ = 1, #A0_94.hideEnemy:getSpecTable().spawnSet do
      if A0_94.hideEnemy:getSpecTable().spawnSet[_FORV_6_].locator == "locator_01" then
        A0_94.findeLocation.Location01 = findGameObject2("Node", A1_95 .. "_01")
      elseif A0_94.hideEnemy:getSpecTable().spawnSet[_FORV_6_].locator == "locator_02" then
        A0_94.findeLocation.Location02 = findGameObject2("Node", A1_95 .. "_02")
      elseif A0_94.hideEnemy:getSpecTable().spawnSet[_FORV_6_].locator == "locator_03" then
        A0_94.findeLocation.Location03 = findGameObject2("Node", A1_95 .. "_03")
      elseif A0_94.hideEnemy:getSpecTable().spawnSet[_FORV_6_].locator == "locator_04" then
        A0_94.findeLocation.Location04 = findGameObject2("Node", A1_95 .. "_04")
      elseif A0_94.hideEnemy:getSpecTable().spawnSet[_FORV_6_].locator == "locator_05" then
        A0_94.findeLocation.Location05 = findGameObject2("Node", A1_95 .. "_05")
      elseif A0_94.hideEnemy:getSpecTable().spawnSet[_FORV_6_].locator == "locator_06" then
        A0_94.findeLocation.Location06 = findGameObject2("Node", A1_95 .. "_05")
      end
    end
  end
end
function LeGravityStrom._viewHideEnemyLocation(A0_97)
  local L1_98, L2_99, L3_100, L4_101, L5_102
  for L4_101, L5_102 in L1_98(L2_99) do
    if L5_102 ~= nil and Fn_isInSightTarget(L5_102) then
      return true
    end
  end
  return L1_98
end
function LeGravityStrom._hideEnemyMoveCount(A0_103)
  if __hideEnemyBrain.brainEne_01 ~= nil and __hideEnemyBrain.countEne_01 == false and __hideEnemyBrain.brainEne_01:isReadyEnemy() then
    __hideEnemyMove = __hideEnemyMove + 1
    __hideEnemyBrain.countEne_01 = true
  end
  if __hideEnemyBrain.brainEne_02 ~= nil and __hideEnemyBrain.countEne_02 == false and __hideEnemyBrain.brainEne_02:isReadyEnemy() then
    __hideEnemyMove = __hideEnemyMove + 1
    __hideEnemyBrain.countEne_02 = true
  end
  if __hideEnemyBrain.brainEne_03 ~= nil and __hideEnemyBrain.countEne_03 == false and __hideEnemyBrain.brainEne_03:isReadyEnemy() then
    __hideEnemyMove = __hideEnemyMove + 1
    __hideEnemyBrain.countEne_03 = true
  end
end
function LeGravityStrom._leaveGame(A0_104)
  if leaveGameTask ~= nil and leaveGameTask:isRunning() then
    leaveGameTask:abort()
    leaveGameTask = nil
  end
  leaveGameTask = invokeTask(function()
    local L0_105, L3_106
    L0_105 = 0
    L3_106 = false
    while true do
      if Player:getAction() ~= Player.kAction_Idle then
        A0_104.leaveMode = false
        L0_105 = 0
        L3_106 = false
        if false == false then
          debugPrint("\230\147\141\228\189\156\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\227\128\129\230\148\190\231\189\174\231\138\182\230\133\139\227\130\146\232\167\163\233\153\164\227\129\151\227\129\190\227\129\153")
        end
      elseif L0_105 >= LIVELY_LEAVE_TIME then
        A0_104.leaveMode = true
        if L3_106 == false then
          debugPrint("\230\147\141\228\189\156\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129\230\148\190\231\189\174\231\138\182\230\133\139\227\129\171\227\129\170\227\130\138\227\129\190\227\129\151\227\129\159")
          L3_106 = true
        end
      else
        L0_105 = L0_105 + 1
      end
      if 0 < HUD:faderAlpha() then
        if false == false then
          A0_104.leaveMode = true
          debugPrint("\227\131\149\227\130\167\227\131\188\227\131\137\228\184\173\227\129\170\227\129\174\227\129\167\227\131\141\227\131\180\227\130\163\229\135\186\231\143\190\227\130\164\227\131\153\227\131\179\227\131\136\227\130\146\228\184\128\230\153\130\229\129\156\230\173\162\227\129\151\227\129\190\227\129\153\227\128\130")
        end
      elseif true == true then
        A0_104.leaveMode = false
        debugPrint("\227\131\149\227\130\167\227\131\188\227\131\137\230\152\142\227\129\145\227\129\159\227\129\174\227\129\167\227\131\141\227\131\180\227\130\163\229\135\186\231\143\190\227\130\164\227\131\153\227\131\179\227\131\136\227\130\146\229\190\169\229\184\176\227\129\151\227\129\190\227\129\153\227\128\130")
      end
      wait()
    end
  end)
end
function LeGravityStrom._setMagnification(A0_107)
  local L1_108, L2_109
  L1_108 = 1
  L2_109 = __ftNum
  if L2_109 >= 10 then
    L2_109 = __ftNum
    if L2_109 <= 11 then
      L1_108 = LIVELY_JI_TIME_MAG
    end
  end
  return L1_108
end
function LeGravityStrom._isValid(A0_110)
  local L1_111
  if A0_110 == nil then
    L1_111 = false
    return L1_111
  end
  L1_111 = true
  return L1_111
end
function LeGravityStrom._installMethods(A0_112)
  local L1_113, L2_114, L3_115, L4_116, L5_117
  for L4_116, L5_117 in L1_113(L2_114) do
    if type(L5_117) == "function" then
      A0_112[L4_116] = L5_117
    end
  end
end
function LeGravityStrom._termGameObj(A0_118, A1_119)
  if A1_119 then
    A0_118:debugPrint(A1_119:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_119:isRunning() then
      A1_119:try_term()
    else
      A1_119:kill()
    end
  end
  return nil
end
function LeGravityStrom._abortTask(A0_120, A1_121)
  if A1_121 and A1_121:isRunning() then
    A1_121:abort()
  end
  return nil
end
function LeGravityStrom.debugPrint(A0_122, A1_123)
  print(" - le Battle - " .. A1_123)
end
function LeGravityStrom.debugDisp(A0_124, A1_125, A2_126)
  local L3_127, L4_128
  L3_127 = 0 + A2_126
  function L4_128(A0_129)
    local L1_130
    L1_130 = A1_125
    L1_130 = L1_130 + 10
    if Debug:isDebugMenuOpen() then
      L1_130 = L1_130 + 200
    end
    Font:debugPrint(L1_130, 20 + 18 * L3_127, A0_129)
    L3_127 = L3_127 + 1
  end
  L4_128("- Battle -")
  return L3_127 - A2_126
end
