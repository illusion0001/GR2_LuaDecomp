dofile("/Game/Event2/Common/GgdCommon.lua")
kEV_MNG_PHASE_ACCEPT = 0
kEV_MNG_PHASE_AREA_START = 1
kEV_MNG_PHASE_EVENT_INIT = 2
kEV_MNG_PHASE_AREA_WARP = 3
kEV_MNG_PHASE_EVENT_READY = 4
kEV_MNG_PHASE_EVENT_START = 5
kEV_MNG_PHASE_EVENT_RUN = 6
_phase = kEV_MNG_PHASE_ACCEPT
kEV_MNG_ACCEPT_EMPTY = 0
kEV_MNG_ACCEPT_NEXT = 1
kEV_MNG_ACCEPT_ROLLBACK = 2
kEV_MNG_ACCEPT_RETRY = 3
kEV_MNG_ACCEPT_EXCEPTION = 4
kEV_MNG_ACCEPT_CREATE = 5
kEV_MNG_ACCEPT_TERM = 6
_accept = kEV_MNG_ACCEPT_CREATE
_next_flag = false
_next_mission = nil
_next_bg_set = nil
_reserve_Term_npc = true
_all_kill_npc = false
_excption_run_wait = false
_sb_demoManager = nil
_sb_bgManager = nil
_sb_mission = nil
_sb_mission_old = nil
_sb_common = nil
_sb_common_old = nil
_sb_common_kill = false
_sb_ready_free = nil
_preceding_sb_term = false
_gameover_enable = true
function main()
  debugDisp()
  invokeSystemTask(eventManagement)
  wait()
end
function eventManagement()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = debugPrint
  L1_1 = "main task run!!"
  L0_0(L1_1)
  L0_0 = g_own
  L1_1 = L0_0
  L0_0 = L0_0.getGameObject
  L2_2 = "demoManager"
  L0_0 = L0_0(L1_1, L2_2)
  _sb_demoManager = L0_0
  L0_0 = g_own
  L1_1 = L0_0
  L0_0 = L0_0.getGameObject
  L2_2 = "bgManager"
  L0_0 = L0_0(L1_1, L2_2)
  _sb_bgManager = L0_0
  while true do
    L0_0 = _exitsandbox
    if not L0_0 then
      L0_0 = _accept
      L1_1 = kEV_MNG_ACCEPT_EMPTY
      if L0_0 ~= L1_1 then
        L0_0 = GameDatabase
        L1_1 = L0_0
        L0_0 = L0_0.set
        L2_2 = ggd
        L2_2 = L2_2.InfoActorFlags__Running
        L0_0(L1_1, L2_2, L3_3)
        L0_0 = _accept
        L1_1 = kEV_MNG_ACCEPT_NEXT
        if L0_0 == L1_1 then
          L0_0 = setNextMission
          L1_1 = _next_mission
          L2_2 = L0_0(L1_1)
          if L0_0 then
            if L3_3 > 0 then
              L3_3(L3_3, ggd.GlobalSystemFlags__GameOverEnable, false)
              _gameover_enable = false
              if L3_3 == "monologue" then
                _all_kill_npc = true
              end
              for _FORV_6_, _FORV_7_ in L3_3(L0_0) do
                if _FORV_7_.name == "ep27_00400s" then
                  debugPrint("\227\130\168\227\131\179\227\131\135\227\130\163\227\131\179\227\130\176\227\129\140\230\181\129\227\130\140\227\129\159\227\129\174\227\129\167NPC\227\129\175\227\129\153\227\129\185\227\129\166\231\160\180\230\163\132\227\129\151\227\129\190\227\129\153")
                  _all_kill_npc = true
                  break
                end
              end
              if L3_3 == "eventheader" or string.find(L3_3, "eps") ~= nil then
                debugPrint("\232\163\143\227\129\167\230\186\150\229\130\153\227\129\153\227\130\139\227\129\174\227\129\140\227\131\149\227\131\170\227\131\188\227\130\191\227\130\164\227\131\160\227\129\190\227\129\159\227\129\175eps\227\129\170\227\129\174\227\129\167NPC\227\130\146\227\129\153\227\129\185\227\129\166\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130")
                _all_kill_npc = true
              end
              _sb_demoManager:sendEvent("setDemoList", L0_0, L1_1)
              while not _exitsandbox and not GameDatabase:get(ggd.GlobalSystemFlags__Demo) do
                wait()
              end
              _preceding_sb_term = true
            end
          end
          if L2_2 then
            if L3_3 > 0 then
              L3_3(L3_3, "setPrepareList", L2_2)
            end
          end
          if L1_1 then
            _accept = L3_3
          else
            _accept = L3_3
          end
          _next_mission = nil
        else
          L0_0 = _accept
          L1_1 = kEV_MNG_ACCEPT_ROLLBACK
          if L0_0 == L1_1 then
            L0_0 = setRollbackMission
            L0_0 = L0_0()
            if L0_0 then
              L1_1 = #L0_0
              if L1_1 > 0 then
                L1_1 = _sb_demoManager
                L2_2 = L1_1
                L1_1 = L1_1.sendEvent
                L1_1(L2_2, L3_3, L0_0)
              end
            end
            _all_kill_npc = true
            L1_1 = kEV_MNG_ACCEPT_CREATE
            _accept = L1_1
          else
            L0_0 = _accept
            L1_1 = kEV_MNG_ACCEPT_EXCEPTION
            if L0_0 == L1_1 then
              L0_0 = setExceptionMission
              L1_1 = _next_mission
              L2_2 = _next_bg_set
              L0_0(L1_1, L2_2)
              _next_bg_set = nil
              _next_mission = nil
              L0_0 = kEV_MNG_ACCEPT_CREATE
              _accept = L0_0
            else
              L0_0 = _accept
              L1_1 = kEV_MNG_ACCEPT_RETRY
              if L0_0 == L1_1 then
                L0_0 = kEV_MNG_ACCEPT_CREATE
                _accept = L0_0
                _all_kill_npc = true
                _sb_common_kill = true
                L0_0 = GameDatabase
                L1_1 = L0_0
                L0_0 = L0_0.restore
                L2_2 = ggd
                L2_2 = L2_2.Savedata
                L0_0(L1_1, L2_2)
              else
                L0_0 = _accept
                L1_1 = kEV_MNG_ACCEPT_CREATE
                if L0_0 == L1_1 then
                  L0_0 = _createMission
                  L0_0()
                else
                  L0_0 = _accept
                  L1_1 = kEV_MNG_ACCEPT_TERM
                  if L0_0 == L1_1 then
                    L0_0 = _sb_mission
                    if L0_0 then
                      L0_0 = _sb_mission
                      L1_1 = L0_0
                      L0_0 = L0_0.isRunning
                      L0_0 = L0_0(L1_1)
                      if L0_0 then
                        L0_0 = _sb_mission
                        L1_1 = L0_0
                        L0_0 = L0_0.sendEvent
                        L2_2 = "sbKill"
                        L0_0(L1_1, L2_2)
                      end
                      _sb_mission = nil
                    end
                    L0_0 = _sb_common
                    if L0_0 then
                      L0_0 = _sb_common
                      L1_1 = L0_0
                      L0_0 = L0_0.isRunning
                      L0_0 = L0_0(L1_1)
                      if L0_0 then
                        L0_0 = _sb_common
                        L1_1 = L0_0
                        L0_0 = L0_0.sendEvent
                        L2_2 = "kill"
                        L0_0(L1_1, L2_2)
                        L0_0 = _sb_common
                        L1_1 = L0_0
                        L0_0 = L0_0.sendEvent
                        L2_2 = "sbKill"
                        L0_0(L1_1, L2_2)
                      end
                      _sb_common = nil
                    end
                    L0_0 = kEV_MNG_ACCEPT_EMPTY
                    _accept = L0_0
                  else
                    L0_0 = debugPrint
                    L1_1 = "\228\184\141\229\174\154\227\129\170accept\227\129\167\227\129\153"
                    L0_0(L1_1)
                  end
                end
              end
            end
          end
        end
      end
      L0_0 = wait
      L0_0()
    end
  end
end
function exitsandbox()
  _exitsandbox = true
  print("exit event manager")
end
setExitCallback(exitsandbox)
function _createMission()
  local L0_4, L1_5, L2_6
  L0_4 = getCreateSandboxParam
  L2_6 = L0_4()
  if L1_5 == "free" then
    GameDatabase:set(ggd.GlobalSystemFlags__HatcheryName, GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentFreeMode))
  else
    GameDatabase:set(ggd.GlobalSystemFlags__HatcheryName, L0_4)
  end
  while not _exitsandbox do
    if _phase == kEV_MNG_PHASE_ACCEPT then
      if _sb_bgManager:sendEvent("isAccept") then
        _sb_bgManager:sendEvent("updateBgEvent", "SET_BG")
        _phase = kEV_MNG_PHASE_AREA_START
      end
    elseif _phase == kEV_MNG_PHASE_AREA_START then
      if _sb_bgManager:sendEvent("isAreaStarted") then
        if _sb_mission then
          _sb_mission_old = _sb_mission
          _sb_mission = nil
        end
        if _sb_common and (_sb_common:getName() ~= L2_6 or _sb_common_kill or L1_5 == "free") then
          _sb_common_old = _sb_common
          _sb_common = nil
        end
        _sb_common_kill = false
        if _reserve_Term_npc then
          g_own:getGameObject("npcManager"):sendEvent("requestTerm", 2)
          _reserve_Term_npc = false
        end
        if _all_kill_npc then
          g_own:getGameObject("npcManager"):sendEvent("requestTerm", 0)
          if _sb_bgManager:sendEvent("getCraneShipManagerHandle") and _sb_bgManager:sendEvent("getCraneShipManagerHandle"):isRunning() then
            _sb_bgManager:sendEvent("getCraneShipManagerHandle"):sendEvent("resetNpcTable")
          end
          _all_kill_npc = false
        else
          if getMissionInfo(L0_4) == "cm" then
            g_own:getGameObject("npcManager"):sendEvent("requestTerm", 0)
            if _sb_bgManager:sendEvent("getCraneShipManagerHandle") and _sb_bgManager:sendEvent("getCraneShipManagerHandle"):isRunning() then
              _sb_bgManager:sendEvent("getCraneShipManagerHandle"):sendEvent("resetNpcTable")
            end
          end
          if _sb_mission_old and string.match(_sb_mission_old:getName(), "%l+") == "cm" then
            g_own:getGameObject("npcManager"):sendEvent("requestTerm", 0)
            if _sb_bgManager:sendEvent("getCraneShipManagerHandle") and _sb_bgManager:sendEvent("getCraneShipManagerHandle"):isRunning() then
              _sb_bgManager:sendEvent("getCraneShipManagerHandle"):sendEvent("resetNpcTable")
            end
          end
          if getMissionInfo(L0_4) == "ep" or getMissionInfo(L0_4) == "sm" then
            if getMissionInfo(L0_4) == "ep" and getMissionInfo(L0_4) ~= 4 or getMissionInfo(L0_4) == "sm" and getMissionInfo(L0_4) ~= 1 and getMissionInfo(L0_4) ~= 14 then
              g_own:getGameObject("npcManager"):sendEvent("requestTermNpc", "miz01")
              g_own:getGameObject("npcManager"):sendEvent("requestTermNpc", "driver")
              g_own:getGameObject("npcManager"):sendEvent("requestTermNpc", "worker")
              if _sb_bgManager:sendEvent("getCraneShipManagerHandle") and _sb_bgManager:sendEvent("getCraneShipManagerHandle"):isRunning() then
                _sb_bgManager:sendEvent("getCraneShipManagerHandle"):sendEvent("resetNpcTable")
              end
            end
            if getMissionInfo(L0_4) == "sm" and getMissionInfo(L0_4) ~= 28 and getMissionInfo(L0_4) ~= 48 then
              g_own:getGameObject("npcManager"):sendEvent("requestTermNpc", "man73")
              if _sb_bgManager:sendEvent("getCraneShipManagerHandle") and _sb_bgManager:sendEvent("getCraneShipManagerHandle"):isRunning() then
                _sb_bgManager:sendEvent("getCraneShipManagerHandle"):sendEvent("resetNpcTable")
              end
            end
            if true == true then
              g_own:getGameObject("npcManager"):sendEvent("requestTerm", 1)
            end
          end
        end
        if GameDatabase:get(ggd.GlobalSystemFlags__GameRetire) or _preceding_sb_term then
          if _sb_mission_old then
            debugPrint("old mission sandbox free preceding")
            if _sb_mission_old:isRunning() then
              _sb_mission_old:sendEvent("sbKill")
            end
            _sb_mission_old = nil
          end
          if _sb_common_old then
            debugPrint("old mission common sandbox free preceding")
            if _sb_common_old:isRunning() then
              _sb_common_old:sendEvent("kill")
              _sb_common_old:sendEvent("sbKill")
            end
            _sb_common_old = nil
          end
        end
        _preceding_sb_term = false
        if L0_4 ~= "free" then
          if L0_4 == "eventheader" and _sb_ready_free then
            _sb_mission = _sb_ready_free
            _sb_ready_free = nil
            GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionName, "None")
            GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionType, "None")
            GameDatabase:set(ggd.GlobalSystemFlags__ReadyFree, false)
          else
            _sb_mission = _createSandBox(L1_5, L0_4, false)
          end
        end
        if L2_6 ~= nil and L2_6 ~= "None" and (not _sb_common or _sb_common:isStopped()) then
          _sb_common = _createSandBox(L1_5, L2_6, true)
        end
        if false and not _sb_ready_free then
          _sb_ready_free = _createSandBox("free", "eventheader", false)
          GameDatabase:set(ggd.GlobalSystemFlags__ReadyFree, false)
          _sb_ready_free:try_start()
        end
        if _sb_mission then
          _sb_mission:try_start()
        end
        if _sb_common then
          _sb_mission:setGameObject("com_sb", _sb_common)
          _sb_common:setString("mission_part", L0_4)
          _sb_common:try_start()
          _sb_common:sendEvent("setComSandoxFlag")
        end
        _phase = kEV_MNG_PHASE_EVENT_INIT
      end
    elseif _phase == kEV_MNG_PHASE_EVENT_INIT then
      if _sb_mission then
        if _sb_mission:sendEvent("isInitialized") then
          if _sb_common then
            if _sb_common:sendEvent("isInitialized") then
              _sb_bgManager:sendEvent("initializedMission")
              if _sb_mission:getName() == "eventheader" then
                _sb_mission:sendEvent("initializeHeaderNpc")
              end
              _phase = kEV_MNG_PHASE_AREA_WARP
            end
          else
            _sb_bgManager:sendEvent("initializedMission")
            if _sb_mission:getName() == "eventheader" then
              _sb_mission:sendEvent("initializeHeaderNpc")
            end
            _phase = kEV_MNG_PHASE_AREA_WARP
          end
        end
      else
        _sb_bgManager:sendEvent("initializedMission")
        _phase = kEV_MNG_PHASE_AREA_WARP
      end
    elseif _phase == kEV_MNG_PHASE_AREA_WARP then
      if _sb_bgManager:sendEvent("isAreaInitialized") then
        if _sb_mission then
          _sb_mission:sendEvent("areaWarpFinish")
        end
        if _sb_common then
          _sb_common:sendEvent("areaWarpFinish")
        end
        _phase = kEV_MNG_PHASE_EVENT_READY
      end
    elseif _phase == kEV_MNG_PHASE_EVENT_READY then
      if _sb_mission then
        if _sb_mission:sendEvent("isReadyGameObject") then
          if _sb_common then
            if _sb_common:sendEvent("isReadyGameObject") then
              _sb_bgManager:sendEvent("requestAreaLoading")
              _phase = kEV_MNG_PHASE_EVENT_START
            end
          else
            _sb_bgManager:sendEvent("requestAreaLoading")
            _phase = kEV_MNG_PHASE_EVENT_START
          end
        end
      else
        _sb_bgManager:sendEvent("requestAreaLoading")
        _phase = kEV_MNG_PHASE_EVENT_START
      end
    elseif _phase == kEV_MNG_PHASE_EVENT_START then
      if _sb_bgManager:sendEvent("isAreaLoaded") and _excption_run_wait == false then
        if _sb_mission_old then
          debugPrint("old mission sandbox free")
          if _sb_mission_old:isRunning() then
            _sb_mission_old:sendEvent("sbKill")
          end
          _sb_mission_old = nil
        end
        if _sb_common_old then
          debugPrint("old mission common sandbox free")
          if _sb_common_old:isRunning() then
            _sb_common_old:sendEvent("kill")
            _sb_common_old:sendEvent("sbKill")
          end
          _sb_common_old = nil
        end
        if _sb_mission then
          _sb_mission:sendEvent("startGameObjects")
        end
        if _sb_common then
          _sb_common:sendEvent("startGameObjects")
        end
        _phase = kEV_MNG_PHASE_EVENT_RUN
      end
    elseif _phase == kEV_MNG_PHASE_EVENT_RUN then
      if _sb_mission then
        _sb_mission:sendEvent("sbRun")
      end
      if _sb_common then
        _sb_common:sendEvent("sbRun")
      end
      _sb_bgManager:sendEvent("sbRun")
      if mineManager and mineManager:isRunning() then
        mineManager:sendEvent("reqSaveMineInfo")
      end
      if _sb_mission then
        repeat
          wait()
          if _exitsandbox then
            return
          end
          if _sb_mission:isRunning() then
            if _sb_ready_free and _sb_mission:sendEvent("isStartGameObject") then
              _sb_ready_free:sendEvent("initializeHeaderNpc")
            end
          end
        until _sb_mission:sendEvent("isMissionStart")
        _sb_demoManager:sendEvent("setCapturePermit")
        while GameDatabase:get(ggd.GlobalSystemFlags__Demo) do
          if _exitsandbox then
            return
          end
          wait()
        end
        GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionName, "None")
        GameDatabase:set(ggd.Savedata__EventManageFlags__ReadyMissionType, "None")
        GameDatabase:set(ggd.GlobalSystemFlags__ReadyFree, false)
        _sb_mission:sendEvent("inGameRun")
      end
      if _gameover_enable == false then
        GameDatabase:set(ggd.GlobalSystemFlags__GameOverEnable, true)
      end
      _gameover_enable = true
      if _sb_mission and not _exitsandbox then
        if _sb_mission:getName() == "eventheader" then
          debugPrint("\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\167\230\146\174\229\189\177\227\129\151\227\129\159\229\134\153\231\156\159\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
          HUD:deleteMissionPhoto()
        end
        if string.match(L0_4, "%l+") == "cm" or L0_4 == "ep26_h" then
          _autoSaveSkip()
        end
        while mineManager and mineManager:isRunning() and mineManager:sendEvent("isSaveMineInfo") do
          wait()
        end
        _autoSaveReq()
      end
      _phase = kEV_MNG_PHASE_ACCEPT
      _accept = kEV_MNG_ACCEPT_EMPTY
      _next_flag = false
      GameDatabase:set(ggd.InfoActorFlags__Running, true)
      break
    end
    wait()
  end
end
function _createSandBox(A0_7, A1_8, A2_9)
  local L3_10, L4_11
  if A1_8 == "None" then
    L3_10 = nil
    return L3_10
  end
  if A0_7 == "test" then
    L3_10 = "/Game/TestScript/"
    L4_11 = A1_8
    L3_10 = L3_10 .. L4_11 .. ".lua"
  elseif not L3_10 then
    L3_10 = "/Game/Event2/Mission/"
    L4_11 = A1_8
    L3_10 = L3_10 .. L4_11 .. ".lua"
  end
  L4_11 = g_own
  L4_11 = L4_11.getGameObject
  L4_11 = L4_11(L4_11, "mother2")
  L4_11:createSandbox2(A1_8):setString("g_filename", L3_10)
  L4_11:createSandbox2(A1_8):try_init()
  L4_11:createSandbox2(A1_8):waitForReady()
  L4_11:createSandbox2(A1_8):setGameObject("mother2", L4_11)
  L4_11:createSandbox2(A1_8):setGameObject("father2", g_own:getGameObject("father2"))
  L4_11:createSandbox2(A1_8):setGameObject("eventManager", g_own)
  L4_11:createSandbox2(A1_8):setGameObject("bgManager", g_own:getGameObject("bgManager"))
  L4_11:createSandbox2(A1_8):setGameObject("soundManager", g_own:getGameObject("soundManager"))
  L4_11:createSandbox2(A1_8):setGameObject("npcManager", g_own:getGameObject("npcManager"))
  L4_11:createSandbox2(A1_8):setGameObject("MineManager", g_own:getGameObject("mineManager"))
  L4_11:createSandbox2(A1_8):setGameObject("enemyManager", g_own:getGameObject("enemyManager"))
  L4_11 = nil
  return (L4_11:createSandbox2(A1_8))
end
function getMissionInfo(A0_12)
  local L1_13, L2_14
  L1_13 = string
  L1_13 = L1_13.sub
  L2_14 = A0_12
  L1_13 = L1_13(L2_14, 1, 2)
  L2_14 = tonumber
  L2_14 = L2_14(string.match(A0_12, "%d+"))
  if L2_14 ~= nil then
    debugPrint("input > " .. A0_12 .. "   output >" .. L1_13 .. "," .. L2_14)
  end
  return L1_13, L2_14
end
function isAccept()
  local L0_15, L1_16
  L0_15 = _accept
  return L0_15
end
function requestNextMission()
  local L0_17
  L0_17 = _accept
  if L0_17 == kEV_MNG_ACCEPT_EMPTY then
    L0_17 = _next_flag
    if L0_17 then
      L0_17 = kEV_MNG_ACCEPT_NEXT
      _accept = L0_17
    else
      L0_17 = kEV_MNG_ACCEPT_CREATE
      _accept = L0_17
    end
    L0_17 = true
    return L0_17
  end
  L0_17 = false
  return L0_17
end
function requestSetNextMissionName(A0_18)
  local L1_19
  L1_19 = _next_flag
  if not L1_19 then
    _next_mission = A0_18
    _next_flag = true
    L1_19 = _accept
    if L1_19 == kEV_MNG_ACCEPT_CREATE then
      L1_19 = kEV_MNG_ACCEPT_NEXT
      _accept = L1_19
    end
    L1_19 = true
    return L1_19
  end
  L1_19 = false
  return L1_19
end
function requestRetryMission()
  if _accept == kEV_MNG_ACCEPT_EMPTY then
    _accept = kEV_MNG_ACCEPT_RETRY
  end
end
function requestRetireMission()
  if _accept == kEV_MNG_ACCEPT_EMPTY then
    _accept = kEV_MNG_ACCEPT_ROLLBACK
    return true
  end
  return false
end
function requestExceptionMission(A0_20, A1_21, A2_22)
  if _accept == kEV_MNG_ACCEPT_EMPTY then
    _accept = kEV_MNG_ACCEPT_EXCEPTION
    _next_mission = A0_20
    _next_bg_set = A1_21
    if A2_22 then
      _excption_run_wait = A2_22
    end
    return true
  end
  return false
end
function isExceptionMissionComplite()
  if _accept == kEV_MNG_ACCEPT_EMPTY then
    return true
  end
  return false
end
function isExceptionMissionReady()
  if _phase == kEV_MNG_PHASE_EVENT_START then
    return true
  end
  return false
end
function runExceptionMission()
  local L0_23, L1_24
  _excption_run_wait = false
end
function reserveTermNpc()
  local L0_25, L1_26
  _reserve_Term_npc = true
end
function requestTermCommonSandbox()
  if _phase == kEV_MNG_PHASE_ACCEPT then
    if _sb_common and _sb_common:isRunning() then
      _sb_common:sendEvent("kill")
      _sb_common:sendEvent("sbKill")
      _sb_common = nil
      debugPrint("requestTermCommonSandbox\227\129\167\229\133\177\233\128\154\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\151\227\129\159")
    end
  else
    debugPrint("\227\129\153\227\129\167\227\129\171\229\135\166\231\144\134\228\184\173\227\129\170\227\129\174\227\129\167\229\133\177\233\128\154\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\129\174\229\137\138\233\153\164\228\190\157\233\160\188\227\129\175\229\143\151\227\129\145\228\187\152\227\129\145\227\129\190\227\129\155\227\130\147")
  end
end
import("Font")
import("Debug")
import("DeltaTimer")
_debugLine = 0
_debugDisp = false
_debugDispX = 0
_debugDispTime = false
_debugCreateTime = {
  {name = "none", time = 0},
  {name = "none", time = 0},
  {name = "none", time = 0},
  {name = "none", time = 0},
  {name = "none", time = 0},
  {name = "none", time = 0},
  {name = "none", time = 0}
}
function debugPrint(A0_27)
  print(" <  ev mng > " .. A0_27)
end
function debugDispPrint(A0_28)
  local L1_29
  L1_29 = _debugDispX
  L1_29 = L1_29 + (Debug:isDebugMenuOpen() and 230 or 30)
  Font:debugPrint(L1_29, 50 + 20 * _debugLine, A0_28)
  _debugLine = _debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    local L0_30, L1_31, L2_32, L3_33, L4_34
    L0_30 = _phase
    L1_31 = nil
    L2_32 = false
    while true do
      if not L3_33 then
        if L3_33 == L4_34 then
          if L2_32 then
            L3_33(L4_34)
            L3_33[L4_34] = {
              name = debugPhase(L0_30),
              time = L1_31:getSecond()
            }
            L1_31 = nil
            L2_32 = false
          end
        elseif not L2_32 then
          L1_31 = L3_33
          L3_33(L4_34)
          L2_32 = true
        end
        if L0_30 ~= L3_33 then
          if L1_31 then
            L3_33(L4_34)
            L3_33[L4_34] = {
              name = debugPhase(L0_30),
              time = L1_31:getSecond()
            }
            L1_31 = L3_33
            L3_33(L4_34)
          end
          L3_33(L4_34)
          L0_30 = _phase
        end
        if L3_33 == true then
          _debugLine = 0
          debugDispPrint("- eventManager state -")
          debugDispPrint("phase          = [ " .. L3_33 .. " ]")
          debugDispPrint("accept         = [ " .. L4_34 .. " ]")
          debugDispPrint("sb_mission     = [ " .. (_sb_mission and _sb_mission:getName() or "nil") .. " ]")
          debugDispPrint("sb_common      = [ " .. (_sb_common and _sb_common:getName() or "nil") .. " ]")
          debugDispPrint("sb_ready_free  = [ " .. (_sb_ready_free and _sb_ready_free:getName() or "nil") .. " ]")
          debugDispPrint("sb_mission_old = [ " .. (_sb_mission_old and _sb_mission_old:getName() or "nil") .. " ]")
          debugDispPrint("sb_common_old  = [ " .. (_sb_common_old and _sb_common_old:getName() or "nil") .. " ]")
          debugDispPrint("sb_common_kill = [ " .. tostring(_sb_common_kill) .. " ]")
          debugDispPrint("next           = [ " .. tostring(_next_flag) .. " ]")
          debugDispPrint("next_mission   = [ " .. (_next_mission and _next_mission or "nil") .. " ]")
          debugDispPrint("next_bgset     = [ " .. (_next_bg_set and _next_bg_set or "nil") .. " ]")
          debugDispPrint("excption       = [ " .. tostring(_excption_run_wait) .. " ]")
        end
        if L3_33 == true then
          if L3_33 == false then
            _debugLine = 0
          end
          L3_33(L4_34)
          for _FORV_6_, _FORV_7_ in L3_33(L4_34) do
            debugDispPrint(string.format("%-16s", _FORV_7_.name) .. " < " .. _FORV_7_.time)
          end
        end
        L3_33()
      end
    end
  end)
end
function debugPhase(A0_35)
  local L1_36
  L1_36 = kEV_MNG_PHASE_ACCEPT
  if A0_35 == L1_36 then
    L1_36 = "accept"
    return L1_36
  else
    L1_36 = kEV_MNG_PHASE_AREA_START
    if A0_35 == L1_36 then
      L1_36 = "area start"
      return L1_36
    else
      L1_36 = kEV_MNG_PHASE_EVENT_INIT
      if A0_35 == L1_36 then
        L1_36 = "event initialze"
        return L1_36
      else
        L1_36 = kEV_MNG_PHASE_AREA_WARP
        if A0_35 == L1_36 then
          L1_36 = "area warp"
          return L1_36
        else
          L1_36 = kEV_MNG_PHASE_EVENT_READY
          if A0_35 == L1_36 then
            L1_36 = "event ready"
            return L1_36
          else
            L1_36 = kEV_MNG_PHASE_EVENT_START
            if A0_35 == L1_36 then
              L1_36 = "event start"
              return L1_36
            else
              L1_36 = kEV_MNG_PHASE_EVENT_RUN
              if A0_35 == L1_36 then
                L1_36 = "event run"
                return L1_36
              end
            end
          end
        end
      end
    end
  end
  L1_36 = "err"
  return L1_36
end
function debugAccept()
  local L0_37, L1_38
  L0_37 = _accept
  L1_38 = kEV_MNG_ACCEPT_CREATE
  if L0_37 == L1_38 then
    L0_37 = "create"
    return L0_37
  else
    L0_37 = _accept
    L1_38 = kEV_MNG_ACCEPT_EMPTY
    if L0_37 == L1_38 then
      L0_37 = "empty"
      return L0_37
    else
      L0_37 = _accept
      L1_38 = kEV_MNG_ACCEPT_NEXT
      if L0_37 == L1_38 then
        L0_37 = "next"
        return L0_37
      else
        L0_37 = _accept
        L1_38 = kEV_MNG_ACCEPT_ROLLBACK
        if L0_37 == L1_38 then
          L0_37 = "rollback"
          return L0_37
        else
          L0_37 = _accept
          L1_38 = kEV_MNG_ACCEPT_RETRY
          if L0_37 == L1_38 then
            L0_37 = "retry"
            return L0_37
          else
            L0_37 = _accept
            L1_38 = kEV_MNG_ACCEPT_EXCEPTION
            if L0_37 == L1_38 then
              L0_37 = "exception"
              return L0_37
            end
          end
        end
      end
    end
  end
  L0_37 = "err"
  return L0_37
end
g_customDebugMenu = {
  {
    name = "DebugDisp",
    callback = function()
      local L1_39
      L1_39 = _debugDisp
      L1_39 = not L1_39
      _debugDisp = L1_39
    end
  },
  {
    name = "DebugDispTime",
    callback = function()
      local L1_40
      L1_40 = _debugDispTime
      L1_40 = not L1_40
      _debugDispTime = L1_40
    end
  }
}
