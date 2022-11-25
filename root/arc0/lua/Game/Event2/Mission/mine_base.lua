dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Event2/Table/RewardTable.lua")
_gravityOre = nil
_addGravityOre = nil
_onBreak_callFuncName = nil
_boss_on = false
_boss_navi_on = false
_boss_navi_task = nil
_boss_defeated = false
_is_playing_boss_bgm = false
function uniqueInitFunc()
  local L0_0, L1_1
end
function uniqueIngameFunc()
  local L0_2, L1_3
end
function Initialize()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L0_4 = Ugc
  L1_5 = L0_4
  L0_4 = L0_4.disableFriendDGUpdate
  L2_6 = true
  L0_4(L1_5, L2_6)
  L0_4 = GameDatabase
  L1_5 = L0_4
  L0_4 = L0_4.get
  L2_6 = ggd
  L2_6 = L2_6.GlobalSystemFlags__GameRetry
  L0_4 = L0_4(L1_5, L2_6)
  if L0_4 then
    L0_4 = bgManager
    L1_5 = L0_4
    L0_4 = L0_4.sendEvent
    L2_6 = "requestCraneShip"
    L3_7 = {}
    L4_8 = {}
    L4_8.reset = true
    L4_8.standby = true
    L3_7.ship = L4_8
    L0_4(L1_5, L2_6, L3_7)
  end
  L0_4 = bgManager
  L1_5 = L0_4
  L0_4 = L0_4.sendEvent
  L2_6 = "requestCraneShip"
  L3_7 = {}
  L4_8 = {}
  L4_8.set_cage_out_sensor = true
  L4_8.ship_func = true
  L4_8.move_skip = true
  L3_7.cage = L4_8
  L0_4(L1_5, L2_6, L3_7)
  L0_4 = HUD
  L1_5 = L0_4
  L0_4 = L0_4.enemymarkerSetRange
  L2_6 = _ENEMYMARKER_RANGE
  L0_4(L1_5, L2_6)
  L0_4 = _loadEnemyData
  L1_5 = mine_name
  L2_6 = "_enmgen"
  L1_5 = L1_5 .. L2_6
  L0_4(L1_5)
  L0_4 = _isMineBoss
  L1_5 = mine_name
  L0_4 = L0_4(L1_5)
  _boss_on = L0_4
  L0_4 = _boss_on
  if L0_4 then
    L0_4 = Fn_sendBulkMineSetupRun
    L1_5 = mine_name
    L0_4(L1_5)
    L0_4 = print
    L1_5 = "\227\131\156\227\130\185\227\129\140\229\135\186\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\233\137\177\231\137\169\227\129\175\231\148\159\230\136\144\227\129\151\227\129\190\227\129\155\227\130\147"
    L0_4(L1_5)
  else
    L0_4 = Fn_sendBulkMineSetupRun
    L1_5 = mine_name
    L2_6 = _gravityOre
    L3_7 = _addGravityOre
    L0_4(L1_5, L2_6, L3_7)
    L0_4 = print
    L1_5 = "\227\131\156\227\130\185\227\129\175\229\135\186\231\143\190\227\129\151\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\233\137\177\231\137\169\227\130\146\231\148\159\230\136\144\227\130\146\228\190\157\233\160\188\227\129\151\227\129\190\227\129\153"
    L0_4(L1_5)
  end
  L0_4 = Fn_sendMineSetupCallBrokenGravityOre
  L1_5 = _onBreak_callFuncName
  L0_4(L1_5)
  L0_4 = setRetryMission
  L0_4()
  L0_4 = _isMine99Open
  L0_4 = L0_4()
  L1_5 = _getNextMission
  L2_6 = L1_5()
  L3_7 = Fn_setupGravityGate
  L4_8 = L1_5
  L3_7(L4_8, L2_6, "locator2_im_entrance_01", L0_4)
  L3_7 = uniqueInitFunc
  L3_7()
end
function Ingame()
  local L0_9, L1_10
  L0_9 = nil
  L1_10 = Fn_setCrewActive
  L1_10(false)
  L1_10 = Fn_noticeEnterMine
  L1_10(_mine_id)
  L1_10 = Fn_noticeEnterMineAnalytics
  L1_10(mine_name)
  repeat
    L1_10 = wait
    L1_10()
    L1_10 = Fn_sendIsWaitPreparationMineManager
    L1_10 = L1_10()
  until L1_10
  L1_10 = Fn_warpCageMineArea
  L1_10()
  L1_10 = Fn_setCageMarker
  L1_10(true)
  L1_10 = _boss_on
  if L1_10 then
    L1_10 = findGameObject2
    L1_10 = L1_10("EnemyGenerator", _enmgen_boss)
    L0_9 = L1_10
    if L0_9 ~= nil then
      L1_10 = L0_9.requestSpawn
      L1_10(L0_9)
    end
  else
    L1_10 = _setEnemySpawnSet
    L1_10(_enmgen_list)
  end
  repeat
    L1_10 = wait
    L1_10()
    L1_10 = Fn_sendIsRunMine
    L1_10 = L1_10()
  until L1_10
  L1_10 = Fn_waitGravityStormOutAndCageSkip
  L1_10()
  L1_10 = _boss_on
  if L1_10 then
    L1_10 = invokeTask
    L1_10 = L1_10(function()
      repeat
        if Fn_getDistanceToPlayer(L0_9) < _boss_navi_range then
          if not _is_playing_boss_bgm then
            Fn_setBgmPoint("event", "mine_boss", "mine_common")
            _is_playing_boss_bgm = true
          end
          Fn_naviKill()
          _boss_navi_on = false
        elseif not _boss_navi_on then
          Fn_naviSet(L0_9)
          _boss_navi_on = true
        end
        wait()
      until _boss_defeated
      Fn_setBgmPoint("event", "mine_boss_finish", "mine_common")
      Fn_naviKill()
      setBossComeOut(mine_name)
    end)
    _boss_navi_task = L1_10
    L1_10 = Fn_setBgmPoint
    L1_10("event", "mine_boss_before", "mine_common")
  else
    L1_10 = Fn_setBgmPoint
    L1_10("event", "mine_start")
  end
  L1_10 = Fn_missionStart
  L1_10()
  L1_10 = Fn_waitCageMoveEnd
  L1_10()
  L1_10 = Fn_userCtrlOn
  L1_10()
  L1_10 = Fn_setCatWarp
  L1_10(true)
  L1_10 = uniqueIngameFunc
  L1_10()
  L1_10 = Fn_setMineGravityStorm
  L1_10()
  function L1_10()
    if _boss_navi_task then
      _boss_navi_task:abort()
      Fn_naviKill()
    end
  end
  Ugc:removeInstantDeathGhost()
  Fn_noticeExitMine(_mine_id)
  Fn_noticeExitMineAnalytics(mine_name)
  Fn_setEffectivenessMineArea(false)
  if Fn_waitGravityStormInOrCageMoveSkip(L1_10) == 1 then
    Fn_setKeepPlayerPos()
  end
  Fn_setNextMissionFlag(event_name .. "_header")
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _boss_navi_task then
    _boss_navi_task:abort()
    Fn_naviKill()
  end
end
function _getNextMission(A0_11)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("getNextMission")
  end
end
function setRetryMission(A0_12)
  local L1_13
end
function _loadEnemyData(A0_14)
  if loadFileAsset("evb", "evx/" .. A0_14) then
    loadFileAsset("evb", "evx/" .. A0_14):wait()
    return (EventData:create(A0_14, nil, loadFileAsset("evb", "evx/" .. A0_14):getRoot()))
  end
  return nil
end
function _setEnemySpawnSet(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26
  L1_16 = MineManager
  if L1_16 then
    L1_16 = MineManager
    L2_17 = L1_16
    L1_16 = L1_16.isRunning
    L1_16 = L1_16(L2_17)
    if L1_16 then
      L1_16 = {}
      L2_17 = type
      L3_18 = A0_15
      L2_17 = L2_17(L3_18)
      if "string" == L2_17 then
        L3_18 = table
        L3_18 = L3_18.insert
        L3_18(L4_19, L5_20)
      elseif "table" == L2_17 then
        L1_16 = A0_15
      end
      L3_18 = MineManager
      L3_18 = L3_18.sendEvent
      L3_18 = L3_18(L4_19, L5_20, L6_21)
      for L7_22, L8_23 in L4_19(L5_20) do
        L9_24 = findGameObject2
        L10_25 = "EnemyGenerator"
        L11_26 = L8_23
        L9_24 = L9_24(L10_25, L11_26)
        if L9_24 then
          L11_26 = L9_24
          L10_25 = L9_24.getSpecTable
          L10_25 = L10_25(L11_26)
          if L10_25 then
            L11_26 = L10_25.setData
            if L11_26 then
              L11_26 = table
              L11_26 = L11_26.maxn
              L11_26 = L11_26(L10_25.setData)
              if L10_25.setData[_getSpawnSetNumber(L3_18, L11_26)] ~= nil then
                L10_25.spawnSet = L10_25.setData[_getSpawnSetNumber(L3_18, L11_26)]
                L9_24:requestSpawn()
              end
            end
          else
            L11_26 = print
            L11_26(string.format("%s\227\129\171\230\149\181\233\133\141\231\189\174\227\131\134\227\131\188\227\131\150\227\131\171\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\227\129\156\239\188\159", L8_23))
          end
        end
      end
    end
  end
end
function _getSpawnSetNumber(A0_27, A1_28)
  local L2_29
  L2_29 = 1
  L2_29 = math.floor(A1_28 * A0_27 / 100) + 1
  if A1_28 < L2_29 then
    L2_29 = A1_28
  end
  return L2_29
end
function _isMine99Open()
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("sendIsMine99Open")
  end
  return false
end
function _isMineBoss(A0_30)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("IsBossComeIn", A0_30)
  end
  return false
end
function setBossComeOut(A0_31)
  if MineManager and MineManager:isRunning() then
    return MineManager:sendEvent("setBossComeOut", A0_31)
  end
end
function Fn_bossDefeated()
  local L0_32, L1_33
  L0_32 = {
    L1_33,
    GameDatabase:get(ggd.Savedata__RewardFlags__mine__boss02),
    GameDatabase:get(ggd.Savedata__RewardFlags__mine__boss03),
    GameDatabase:get(ggd.Savedata__RewardFlags__mine__boss04),
    GameDatabase:get(ggd.Savedata__RewardFlags__mine__boss05)
  }
  L1_33 = GameDatabase
  L1_33 = L1_33.get
  L1_33 = L1_33(L1_33, ggd.Savedata__RewardFlags__mine__boss01)
  L1_33 = true
  for _FORV_5_, _FORV_6_ in ipairs(L0_32) do
    if not _FORV_6_ then
      L1_33 = _FORV_6_
      break
    end
  end
  if L1_33 then
    Net:trophyUnlock(35)
  end
end
debugGateOn = {
  name = "MineGateOn",
  callback = function()
    if findGameObject2("PlayerSensor", "gate_node_sensor") and findGameObject2("MapMarker", "gate_node_marker") then
      findGameObject2("PlayerSensor", "gate_node_sensor"):setActive(true)
      findGameObject2("MapMarker", "gate_node_marker"):setActive(true)
      findGameObject2("MapMarker", "gate_node_marker"):playIn()
    end
  end
}
table.insert(g_customDebugMenu, debugGateOn)
