import("GameDatabase")
import("math")
import("Area")
import("HUD")
import("Sound")
import("Time")
import("common")
import("Player")
import("Vision")
import("Vehicle")
import("GameFlow")
dofile("/Game/Event2/Common/SystemScriptCommon2.lua")
dofile("/Game/Event2/Common/BulletCommon.lua")
_mob_sandbox = nil
_craneShipManager = nil
_warShipManager = nil
kBG_MNG_PHASE_ACCEPT = 0
kBG_MNG_PHASE_AREA_START = 1
kBG_MNG_PHASE_AREA_WARP = 2
kBG_MNG_PHASE_AREA_INIT = 3
kBG_MNG_PHASE_AREA_LOAD = 4
kBG_MNG_PHASE_AREA_MOVE = 5
_phase = kBG_MNG_PHASE_ACCEPT
kBG_MNG_ACCEPT_EMPTY = 0
kBG_MNG_ACCEPT_CREATE = 1
_accept = kBG_MNG_ACCEPT_EMPTY
_area_started = false
_area_initialized = false
_area_loaded = false
_req_area_load = false
_req_run = false
_initalized_mission = false
_warp_area_list = {}
_area_list = {}
_object_list = {}
_bg_handle = nil
function main()
  debugPrint("Initializing...")
  debugDisp()
  _mob_sandbox = mother2:findGameObject2("Sandbox2", "mob_sandbox")
  _craneShipManager = createSandbox2("craneShipManager")
  _craneShipManager:setString("g_filename", "/Game/Event2/craneshipmanager2.lua")
  _craneShipManager:try_init()
  _craneShipManager:waitForReady()
  _craneShipManager:setGameObject("mother2", g_own:getGameObject("mother2"))
  _craneShipManager:setGameObject("father2", g_own:getGameObject("father2"))
  _craneShipManager:setGameObject("bgManager", g_own)
  _craneShipManager:setGameObject("npcManager", g_own:getGameObject("npcManager"))
  _craneShipManager:setGameObject("mineManager", g_own:getGameObject("mineManager"))
  _craneShipManager:try_start()
  debugPrint("created craneShipManager")
  _warShipManager = mother2:createSandbox2("warshipManager")
  _warShipManager:setString("g_filename", "/Game/Event2/warshipmanager.lua")
  _warShipManager:try_init()
  _warShipManager:waitForReady()
  _warShipManager:setGameObject("mother2", g_own:getGameObject("mother2"))
  _warShipManager:setGameObject("bgManager", g_own)
  _warShipManager:try_start()
  debugPrint("created warShipManager")
  debugPrint("Initializend!!")
  invokeSystemTask(bgmanagement)
  wait()
end
function bgmanagement()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L0_0 = debugPrint
  L1_1 = "main task run!!"
  L0_0(L1_1)
  L0_0 = g_own
  L1_1 = L0_0
  L0_0 = L0_0.getGameObject
  L2_2 = "mother2"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = g_own
  L2_2 = L1_1
  L1_1 = L1_1.getGameObject
  L3_3 = "father2"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = false
  while true do
    L3_3 = _exitsandbox
    if not L3_3 then
      L3_3 = _accept
      L4_4 = kBG_MNG_ACCEPT_EMPTY
      if L3_3 ~= L4_4 then
        L3_3 = _phase
        L4_4 = kBG_MNG_PHASE_ACCEPT
        if L3_3 == L4_4 then
          while true do
            while true do
              L3_3 = GameDatabase
              L4_4 = L3_3
              L3_3 = L3_3.get
              L5_5 = ggd
              L5_5 = L5_5.GlobalSystemFlags__AutoSave
              L3_3 = L3_3(L4_4, L5_5)
              if L3_3 > 0 then
                L3_3 = wait
                L3_3()
              end
            end
          end
          while true do
            L3_3 = GameDatabase
            L4_4 = L3_3
            L3_3 = L3_3.get
            L5_5 = ggd
            L5_5 = L5_5.GlobalSystemFlags__GameOverFlow
            L3_3 = L3_3(L4_4, L5_5)
            if L3_3 then
              L3_3 = debugPrint
              L4_4 = "\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\231\181\130\228\186\134\229\135\166\231\144\134\229\190\133\227\129\161"
              L3_3(L4_4)
              L3_3 = wait
              L3_3()
            end
          end
          L3_3 = GameDatabase
          L4_4 = L3_3
          L3_3 = L3_3.get
          L5_5 = ggd
          L5_5 = L5_5.GlobalSystemFlags__SkipPlayerStartPos
          L3_3 = L3_3(L4_4, L5_5)
          if L3_3 then
            L3_3 = debugPrint
            L4_4 = "skip area load disable"
            L3_3(L4_4)
          else
            L3_3 = Area
            L4_4 = L3_3
            L3_3 = L3_3.setEnableLoading
            L5_5 = false
            L3_3(L4_4, L5_5)
            L3_3 = debugPrint
            L4_4 = "area load disable"
            L3_3(L4_4)
          end
          L3_3 = GameDatabase
          L4_4 = L3_3
          L3_3 = L3_3.get
          L5_5 = ggd
          L5_5 = L5_5.Savedata__EventManageFlags__CurrentBgSet
          L3_3 = L3_3(L4_4, L5_5)
          L4_4 = GameDatabase
          L5_5 = L4_4
          L4_4 = L4_4.get
          L6_6 = ggd
          L6_6 = L6_6.Savedata__EventManageFlags__LateBgSet
          L4_4 = L4_4(L5_5, L6_6)
          L5_5 = _accessIndicatorBegin
          L5_5()
          if L3_3 == L4_4 then
            L5_5 = _bg_handle
            if L5_5 ~= nil then
              L5_5 = debugPrint
              L6_6 = "bgset accord ... > "
              L7_7 = L3_3
              L6_6 = L6_6 .. L7_7 .. L8_8 .. L4_4
              L5_5(L6_6)
              L5_5 = GameDatabase
              L6_6 = L5_5
              L5_5 = L5_5.set
              L7_7 = ggd
              L7_7 = L7_7.CreneShipFlags__BgSetChanged
              L5_5(L6_6, L7_7, L8_8)
              L5_5 = GameDatabase
              L6_6 = L5_5
              L5_5 = L5_5.get
              L7_7 = ggd
              L7_7 = L7_7.GlobalSystemFlags__ObjectRestore
              L5_5 = L5_5(L6_6, L7_7)
              if L5_5 then
                L5_5 = Area
                L6_6 = L5_5
                L5_5 = L5_5.requestRestore
                L5_5(L6_6)
                L5_5 = wait
                L6_6 = 2
                L5_5(L6_6)
                L5_5 = _bg_handle
                L6_6 = L5_5
                L5_5 = L5_5.sendEvent
                L7_7 = "requestBgSet"
                L8_8.object_remake = true
                L5_5(L6_6, L7_7, L8_8)
                repeat
                  L5_5 = _exitsandbox
                  if L5_5 then
                    L5_5 = debugPrint
                    L6_6 = "requestBgSet\229\190\133\230\169\159\228\184\173\227\129\171exitSandbox\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159"
                    L5_5(L6_6)
                    return
                  end
                  L5_5 = wait
                  L5_5()
                  L5_5 = _bg_handle
                  L6_6 = L5_5
                  L5_5 = L5_5.sendEvent
                  L7_7 = "getRequestState"
                  L8_8.is_remake_finish = true
                  L5_5 = L5_5(L6_6, L7_7, L8_8)
                until L5_5
              end
              L5_5 = false
              L6_6 = GameDatabase
              L7_7 = L6_6
              L6_6 = L6_6.get
              L6_6 = L6_6(L7_7, L8_8)
              if L6_6 then
                L5_5 = true
              else
                L6_6 = GameDatabase
                L7_7 = L6_6
                L6_6 = L6_6.get
                L6_6 = L6_6(L7_7, L8_8)
                if L6_6 then
                  L6_6 = HUD
                  L7_7 = L6_6
                  L6_6 = L6_6.faderAlpha
                  L6_6 = L6_6(L7_7)
                  if L6_6 >= 1 then
                    L5_5 = true
                  end
                end
              end
              if L5_5 then
                L6_6 = Player
                L7_7 = L6_6
                L6_6 = L6_6.getPuppet
                L6_6 = L6_6(L7_7)
                L7_7 = nil
                if L8_8 then
                  debugPrint("recentArea : " .. tostring(L8_8))
                  if L8_8 and _findAreaHandle(L8_8) then
                    L7_7 = createGameObject2("Node")
                    L7_7:setName("tmp_warp_node")
                    L7_7:try_init()
                    L7_7:waitForReady()
                    _findAreaHandle(L8_8):appendChild(L7_7)
                    L7_7:try_start()
                    L7_7:setWorldTransform(L6_6:getWorldTransform())
                    L7_7:setForceMove()
                    wait()
                  end
                end
                if L8_8 then
                  L8_8("\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\227\129\167\229\186\131\227\129\146\227\130\137\227\130\140\227\129\159AABB\227\130\146\229\133\131\227\129\171\229\188\183\229\136\182\231\154\132\227\129\171\230\136\187\227\129\151\227\129\190\227\129\153")
                  for _FORV_11_, _FORV_12_ in L8_8(_area_list) do
                    _FORV_12_:setExpandedAabb(false)
                  end
                end
                L8_8("GameDeltaSec Off")
                L8_8(L8_8, 0)
                L8_8()
                L8_8(L6_6, false)
                L8_8(L8_8)
                L8_8(L8_8, false, false, false)
                L8_8(L8_8, ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, false)
                L8_8()
                for _FORV_12_, _FORV_13_ in pairs(L8_8) do
                  _FORV_13_:setSceneParameters(_FORV_13_:getName())
                end
                debugPrint("area reset")
                _bg_handle:sendEvent("areaResetAndReConnct", true)
                wait()
                repeat
                  if _exitsandbox then
                    debugPrint("areaResetAndReConnct\229\190\133\230\169\159\228\184\173\227\129\171exitSandbox\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159")
                    return
                  end
                  wait()
                until _bg_handle:sendEvent("isConnectingFinish")
                if L7_7 then
                  L7_7:setForceMove()
                  wait()
                  print(tostring(L7_7:getWorldPos()))
                  Player:reset(Player.kReset_Standing, L7_7:getWorldTransform())
                  Bullet:reset(Bullet.ID.Shockwave, Bullet.Owner.All)
                  wait()
                  print(tostring(L6_6:getWorldPos()))
                  Time:resetInGameDeltaSec()
                  wait()
                  Time:setInGameDeltaSec(0)
                  wait()
                  L7_7:try_term()
                  L7_7 = nil
                end
                L6_6 = nil
                GameDatabase:set(ggd.GlobalSystemFlags__Idling, true)
                L2_2 = true
              end
            end
          else
            L5_5 = debugPrint
            L6_6 = "bgset create  ... > "
            L7_7 = L3_3
            L6_6 = L6_6 .. L7_7 .. L8_8 .. L4_4
            L5_5(L6_6)
            L5_5 = GameDatabase
            L6_6 = L5_5
            L5_5 = L5_5.set
            L7_7 = ggd
            L7_7 = L7_7.CreneShipFlags__BgSetChanged
            L5_5(L6_6, L7_7, L8_8)
            L5_5 = GameDatabase
            L6_6 = L5_5
            L5_5 = L5_5.set
            L7_7 = ggd
            L7_7 = L7_7.GlobalSystemFlags__AreaStart
            L5_5(L6_6, L7_7, L8_8)
            L5_5 = Area
            L6_6 = L5_5
            L5_5 = L5_5.setForceSceneParams
            L5_5(L6_6)
            L5_5 = Area
            L6_6 = L5_5
            L5_5 = L5_5.setSceneParametersInterpolateTime
            L5_5(L6_6)
            L5_5 = HUD
            L6_6 = L5_5
            L5_5 = L5_5.setInvisibleMapAreaAllClear
            L5_5(L6_6)
            while true do
              L5_5 = GameDatabase
              L6_6 = L5_5
              L5_5 = L5_5.get
              L7_7 = ggd
              L7_7 = L7_7.GlobalSystemFlags__PlayerSpawned
              L5_5 = L5_5(L6_6, L7_7)
              if not L5_5 then
                L5_5 = _exitsandbox
                if L5_5 then
                  L5_5 = debugPrint
                  L6_6 = "\227\131\151\227\131\172\227\130\164\227\131\164\231\148\159\230\136\144\229\190\133\230\169\159\228\184\173\227\129\171exitSandbox\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159"
                  L5_5(L6_6)
                  return
                end
                L5_5 = wait
                L5_5()
              end
            end
            L5_5 = debugPrint
            L6_6 = "GameDeltaSec Off"
            L5_5(L6_6)
            L5_5 = Time
            L6_6 = L5_5
            L5_5 = L5_5.setInGameDeltaSec
            L7_7 = 0
            L5_5(L6_6, L7_7)
            L5_5 = wait
            L5_5()
            L5_5 = Player
            L6_6 = L5_5
            L5_5 = L5_5.getPuppet
            L5_5 = L5_5(L6_6)
            L7_7 = L5_5
            L6_6 = L5_5.setCollidable
            L6_6(L7_7, L8_8)
            L6_6 = Player
            L7_7 = L6_6
            L6_6 = L6_6.reset
            L6_6(L7_7, L8_8, Vector(0, 0, 0), Quaternion(0, 0, 0, 1))
            L5_5 = nil
            L6_6 = Area
            L7_7 = L6_6
            L6_6 = L6_6.setAnimMoveDriftEnable
            L6_6(L7_7, L8_8, false, false)
            L6_6 = GameDatabase
            L7_7 = L6_6
            L6_6 = L6_6.set
            L6_6(L7_7, L8_8, false)
            L6_6 = Area
            L7_7 = L6_6
            L6_6 = L6_6.setDriftRatioTrans
            L6_6(L7_7, L8_8)
            L6_6 = Area
            L7_7 = L6_6
            L6_6 = L6_6.setDriftRatioRot
            L6_6(L7_7, L8_8)
            L6_6 = GameDatabase
            L7_7 = L6_6
            L6_6 = L6_6.set
            L6_6(L7_7, L8_8, true)
            L6_6 = _craneShipManager
            if L6_6 then
              L6_6 = _craneShipManager
              L7_7 = L6_6
              L6_6 = L6_6.isRunning
              L6_6 = L6_6(L7_7)
              if L6_6 then
                L6_6 = _craneShipManager
                L7_7 = L6_6
                L6_6 = L6_6.sendEvent
                L6_6(L7_7, L8_8)
              end
            end
            L6_6 = _warShipManager
            L7_7 = L6_6
            L6_6 = L6_6.sendEvent
            L6_6(L7_7, L8_8, nil)
            L6_6 = wait
            L6_6()
            L6_6 = _bg_handle
            if L6_6 then
              L6_6 = _bg_handle
              L7_7 = L6_6
              L6_6 = L6_6.sendEvent
              L6_6(L7_7, L8_8)
              _bg_handle = nil
            end
            L6_6 = {}
            _area_list = L6_6
            L6_6 = {}
            _object_list = L6_6
            L7_7 = L0_0
            L6_6 = L0_0.createSandbox2
            L6_6 = L6_6(L7_7, L8_8)
            _bg_handle = L6_6
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setString
            L6_6(L7_7, L8_8, "/Game/Event2/bgset/" .. L3_3 .. ".lua")
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.try_init
            L6_6(L7_7)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.waitForReady
            L6_6(L7_7)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, L0_0)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, g_own:getGameObject("father2"))
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, g_own)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, _mob_sandbox)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, _craneShipManager)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, _warShipManager)
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.setGameObject
            L6_6(L7_7, L8_8, g_own:getGameObject("soundManager"))
            L6_6 = _bg_handle
            L7_7 = L6_6
            L6_6 = L6_6.try_start
            L6_6(L7_7)
            L6_6 = g_own
            L7_7 = L6_6
            L6_6 = L6_6.getGameObject
            L6_6 = L6_6(L7_7, L8_8)
            L7_7 = L6_6.sendEvent
            L7_7(L8_8, "requestTerm", 0)
            L6_6 = nil
            L2_2 = true
            L7_7 = GameDatabase
            L7_7 = L7_7.set
            L7_7(L8_8, ggd.Savedata__EventManageFlags__LateBgSet, L3_3)
            L7_7 = GameDatabase
            L7_7 = L7_7.set
            L7_7(L8_8, ggd.GlobalSystemFlags__Idling, true)
            L7_7 = debugPrint
            L7_7(L8_8)
          end
          L5_5 = GameDatabase
          L6_6 = L5_5
          L5_5 = L5_5.set
          L7_7 = ggd
          L7_7 = L7_7.GlobalSystemFlags__AreaReset
          L5_5(L6_6, L7_7, L8_8)
          L5_5 = GameDatabase
          L6_6 = L5_5
          L5_5 = L5_5.set
          L7_7 = ggd
          L7_7 = L7_7.GlobalSystemFlags__AreaChange
          L5_5(L6_6, L7_7, L8_8)
          L5_5 = GameDatabase
          L6_6 = L5_5
          L5_5 = L5_5.set
          L7_7 = ggd
          L7_7 = L7_7.GlobalSystemFlags__AreaResetAABB
          L5_5(L6_6, L7_7, L8_8)
          L5_5 = GameDatabase
          L6_6 = L5_5
          L5_5 = L5_5.set
          L7_7 = ggd
          L7_7 = L7_7.GlobalSystemFlags__AreaResetCoercion
          L5_5(L6_6, L7_7, L8_8)
          L5_5 = GameDatabase
          L6_6 = L5_5
          L5_5 = L5_5.set
          L7_7 = ggd
          L7_7 = L7_7.GlobalSystemFlags__ObjectRestore
          L5_5(L6_6, L7_7, L8_8)
          L5_5 = kBG_MNG_PHASE_AREA_START
          _phase = L5_5
        else
          L3_3 = _phase
          L4_4 = kBG_MNG_PHASE_AREA_START
          if L3_3 == L4_4 then
            L3_3 = _bg_handle
            L4_4 = L3_3
            L3_3 = L3_3.sendEvent
            L5_5 = "isAreaStart"
            L3_3 = L3_3(L4_4, L5_5)
            if L3_3 then
              L3_3 = requestVisionBg
              L3_3()
              L3_3 = _bg_handle
              L4_4 = L3_3
              L3_3 = L3_3.sendEvent
              L5_5 = "getAreaRootHandleList"
              L3_3 = L3_3(L4_4, L5_5)
              _area_list = L3_3
              L3_3 = _bg_handle
              L4_4 = L3_3
              L3_3 = L3_3.sendEvent
              L5_5 = "setObjectHandleList"
              L3_3 = L3_3(L4_4, L5_5)
              _object_list = L3_3
              _area_started = true
              L3_3 = kBG_MNG_PHASE_AREA_WARP
              _phase = L3_3
            end
          else
            L3_3 = _phase
            L4_4 = kBG_MNG_PHASE_AREA_WARP
            if L3_3 == L4_4 then
              L3_3 = _initalized_mission
              if L3_3 then
                L3_3 = _bg_handle
                L4_4 = L3_3
                L3_3 = L3_3.sendEvent
                L5_5 = "setWarpArea"
                L6_6 = _warp_area_list
                L3_3(L4_4, L5_5, L6_6)
                L3_3 = kBG_MNG_PHASE_AREA_INIT
                _phase = L3_3
              end
            else
              L3_3 = _phase
              L4_4 = kBG_MNG_PHASE_AREA_INIT
              if L3_3 == L4_4 then
                L3_3 = _bg_handle
                L4_4 = L3_3
                L3_3 = L3_3.sendEvent
                L5_5 = "isInitialized"
                L3_3 = L3_3(L4_4, L5_5)
                if L3_3 then
                  L3_3 = _bg_handle
                  L4_4 = L3_3
                  L3_3 = L3_3.sendEvent
                  L5_5 = "setUpdateCityGem"
                  L6_6 = GameDatabase
                  L7_7 = L6_6
                  L6_6 = L6_6.get
                  L7_7 = L6_6(L7_7, L8_8)
                  L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L6_6(L7_7, L8_8))
                  L3_3 = GameDatabase
                  L4_4 = L3_3
                  L3_3 = L3_3.set
                  L5_5 = ggd
                  L5_5 = L5_5.GlobalSystemFlags__AreaStart
                  L6_6 = true
                  L3_3(L4_4, L5_5, L6_6)
                  _area_initialized = true
                  L3_3 = kBG_MNG_PHASE_AREA_LOAD
                  _phase = L3_3
                end
              else
                L3_3 = _phase
                L4_4 = kBG_MNG_PHASE_AREA_LOAD
                if L3_3 == L4_4 then
                  L3_3 = _req_area_load
                  if L3_3 then
                    L3_3 = _bg_handle
                    L4_4 = L3_3
                    L3_3 = L3_3.sendEvent
                    L5_5 = "setUpdatePlacementCtrl"
                    L3_3(L4_4, L5_5)
                    L3_3 = Area
                    L4_4 = L3_3
                    L3_3 = L3_3.setEnableLoading
                    L5_5 = true
                    L3_3(L4_4, L5_5)
                    L3_3 = debugPrint
                    L4_4 = "area load enable"
                    L3_3(L4_4)
                    while true do
                      L3_3 = HUD
                      L4_4 = L3_3
                      L3_3 = L3_3.menuStatus
                      L5_5 = "Main"
                      L3_3 = L3_3(L4_4, L5_5)
                      L3_3 = L3_3.state
                      if L3_3 == "running" then
                        L3_3 = wait
                        L3_3()
                      end
                    end
                    L3_3 = Player
                    L4_4 = L3_3
                    L3_3 = L3_3.getPuppet
                    L3_3 = L3_3(L4_4)
                    L5_5 = L3_3
                    L4_4 = L3_3.setCollidable
                    L6_6 = true
                    L4_4(L5_5, L6_6)
                    L3_3 = nil
                    L4_4 = wait
                    L4_4()
                    L4_4 = debugPrint
                    L5_5 = "area loading..."
                    L4_4(L5_5)
                    while true do
                      L4_4 = Area
                      L5_5 = L4_4
                      L4_4 = L4_4.isStartedOverall
                      L4_4 = L4_4(L5_5)
                      if not L4_4 then
                        L4_4 = _exitsandbox
                        if L4_4 then
                          L4_4 = debugPrint
                          L5_5 = "area load\228\184\173\227\129\171exitSandbox\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159"
                          L4_4(L5_5)
                          return
                        end
                        L4_4 = wait
                        L4_4()
                      end
                    end
                    L4_4 = wait
                    L4_4()
                    L4_4 = wait
                    L4_4()
                    L4_4 = wait
                    L4_4()
                    L4_4 = debugPrint
                    L5_5 = "area load finish"
                    L4_4(L5_5)
                    L4_4 = _accessIndicatorEnd
                    L4_4()
                    _area_loaded = true
                    L4_4 = kBG_MNG_PHASE_AREA_MOVE
                    _phase = L4_4
                  end
                else
                  L3_3 = _phase
                  L4_4 = kBG_MNG_PHASE_AREA_MOVE
                  if L3_3 == L4_4 then
                    L3_3 = _req_run
                    if L3_3 then
                      L3_3 = Vehicle
                      L4_4 = L3_3
                      L3_3 = L3_3.setVisible
                      L5_5 = GameDatabase
                      L6_6 = L5_5
                      L5_5 = L5_5.get
                      L7_7 = ggd
                      L7_7 = L7_7.Savedata__EventManageFlags__Vehicle
                      L7_7 = L5_5(L6_6, L7_7)
                      L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L5_5(L6_6, L7_7))
                      L3_3 = _bg_handle
                      L4_4 = L3_3
                      L3_3 = L3_3.sendEvent
                      L5_5 = "setStationActive"
                      L6_6 = GameDatabase
                      L7_7 = L6_6
                      L6_6 = L6_6.get
                      L7_7 = L6_6(L7_7, L8_8)
                      L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L6_6(L7_7, L8_8))
                      if L2_2 then
                        L3_3 = GameDatabase
                        L4_4 = L3_3
                        L3_3 = L3_3.get
                        L5_5 = ggd
                        L5_5 = L5_5.Debug__AreaDrift
                        L3_3 = L3_3(L4_4, L5_5)
                        if L3_3 then
                          L3_3 = GameDatabase
                          L4_4 = L3_3
                          L3_3 = L3_3.get
                          L5_5 = ggd
                          L5_5 = L5_5.GlobalSystemFlags__AreaDrift
                          L3_3 = L3_3(L4_4, L5_5)
                          if L3_3 then
                            L3_3 = Area
                            L4_4 = L3_3
                            L3_3 = L3_3.setAnimMoveDriftEnable
                            L5_5 = true
                            L6_6 = true
                            L7_7 = true
                            L3_3(L4_4, L5_5, L6_6, L7_7)
                            L3_3 = GameDatabase
                            L4_4 = L3_3
                            L3_3 = L3_3.set
                            L5_5 = ggd
                            L5_5 = L5_5.GlobalSystemFlags__areaAnimMoveDriftEnable
                            L6_6 = true
                            L3_3(L4_4, L5_5, L6_6)
                          end
                        end
                      end
                      L3_3 = kBG_MNG_PHASE_ACCEPT
                      _phase = L3_3
                      L3_3 = kBG_MNG_ACCEPT_EMPTY
                      _accept = L3_3
                      _area_started = false
                      _area_initialized = false
                      _area_loaded = false
                      _req_area_load = false
                      _req_run = false
                      _initalized_mission = false
                      L3_3 = {}
                      _warp_area_list = L3_3
                      L2_2 = false
                    end
                  end
                end
              end
            end
          end
        end
      end
      L3_3 = wait
      L3_3()
    end
  end
  L0_0 = nil
  _object_list = nil
  _area_list = nil
  _warShipManager = nil
  _craneShipManager = nil
  _mob_sandbox = nil
end
function exitsandbox()
  _exitsandbox = true
  print("exit bg manager")
end
setExitCallback(exitsandbox)
function isAccept()
  return _phase == kBG_MNG_PHASE_ACCEPT
end
function isAreaStarted()
  local L0_9, L1_10
  L0_9 = _area_started
  return L0_9
end
function isAreaInitialized()
  local L0_11, L1_12
  L0_11 = _area_initialized
  return L0_11
end
function isAreaLoaded()
  local L0_13, L1_14
  L0_13 = _area_loaded
  return L0_13
end
function requestAreaLoading()
  local L0_15, L1_16
  _req_area_load = true
end
function setWarpArea(A0_17, A1_18)
  local L2_19
  L2_19 = {}
  L2_19.area = A0_17
  L2_19.node = A1_18
  table.insert(_warp_area_list, L2_19)
end
function initializedMission()
  local L0_20, L1_21
  _initalized_mission = true
end
function sbRun()
  local L0_22, L1_23
  _req_run = true
end
function updateBgEvent(A0_24)
  if _phase == kBG_MNG_PHASE_ACCEPT then
    _accept = kBG_MNG_ACCEPT_CREATE
    return true
  end
  return false
end
function getObjectHandle(A0_25)
  return _object_list[A0_25]
end
function getObjectHandleTable()
  local L0_26, L1_27
  L0_26 = _object_list
  return L0_26
end
function getAreaRootHandleTable()
  local L0_28, L1_29
  L0_28 = _area_list
  return L0_28
end
function getAreaRootHandle(A0_30)
  return _area_list[A0_30]
end
function _findAreaHandle(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36, L6_37
  for L4_35, L5_36 in L1_32(L2_33) do
    L6_37 = L5_36.getName
    L6_37 = L6_37(L5_36)
    if A0_31 == L6_37 then
      return L5_36
    end
    L6_37 = L5_36.getChildren
    L6_37 = L6_37(L5_36)
    for _FORV_10_, _FORV_11_ in pairs(L6_37) do
      if A0_31 == _FORV_11_:getName() then
        return _FORV_11_
      end
    end
  end
  return L1_32
end
function getBgsetHandle()
  local L0_38, L1_39
  L0_38 = _bg_handle
  return L0_38
end
function requestVisionBg()
  local L0_40, L1_41, L2_42, L3_43, L4_44
  L0_40 = GameDatabase
  L1_41 = L0_40
  L0_40 = L0_40.get
  L2_42 = ggd
  L2_42 = L2_42.Savedata__EventManageFlags__CurrentMissionName
  L0_40 = L0_40(L1_41, L2_42)
  L1_41 = GameDatabase
  L2_42 = L1_41
  L1_41 = L1_41.get
  L3_43 = ggd
  L3_43 = L3_43.GlobalSystemFlags__Demo
  L1_41 = L1_41(L2_42, L3_43)
  if L1_41 then
    L1_41 = GameDatabase
    L2_42 = L1_41
    L1_41 = L1_41.get
    L3_43 = ggd
    L3_43 = L3_43.Savedata__EventManageFlags__ReadyMissionName
    L1_41 = L1_41(L2_42, L3_43)
    if L1_41 ~= "None" then
      L0_40 = L1_41
    end
  end
  L1_41 = string
  L1_41 = L1_41.sub
  L2_42 = L0_40
  L3_43 = 1
  L4_44 = 2
  L1_41 = L1_41(L2_42, L3_43, L4_44)
  L2_42 = string
  L2_42 = L2_42.match
  L3_43 = L0_40
  L4_44 = "(.-)_()"
  L2_42 = L2_42(L3_43, L4_44)
  if L2_42 == "ep15" then
    if L0_40 == "ep15_d" or L0_40 == "ep15_e" or L0_40 == "ep15_00200m" then
      L3_43 = VisionBg
      L4_44 = L3_43
      L3_43 = L3_43.globalTvScheduleName
      L3_43(L4_44, "hx_common", "hx_common_nois")
    else
      L3_43 = VisionBg
      L4_44 = L3_43
      L3_43 = L3_43.globalTvScheduleName
      L3_43(L4_44, "hx_common", "hx_ep15")
    end
  elseif L2_42 == "ep17" then
    L3_43 = VisionBg
    L4_44 = L3_43
    L3_43 = L3_43.globalTvScheduleName
    L3_43(L4_44, "hx_common", "hx_ep17")
  elseif L2_42 == "ep26" then
    L3_43 = VisionBg
    L4_44 = L3_43
    L3_43 = L3_43.globalTvScheduleName
    L3_43(L4_44, "hx_common", "hx_common_nois")
  elseif L0_40 == "mine99_029" then
    L3_43 = VisionBg
    L4_44 = L3_43
    L3_43 = L3_43.globalTvScheduleName
    L3_43(L4_44, "hx_pleajeune", "hx_pleajeune_mine99_029")
  elseif L2_42 == "ep80" or L2_42 == "sm93" then
    L3_43 = tonumber
    L4_44 = string
    L4_44 = L4_44.match
    L4_44 = L4_44(L2_42, "%d+")
    L3_43 = L3_43(L4_44, L4_44(L2_42, "%d+"))
    L4_44 = _visionSchedule
    L4_44(L3_43)
  elseif L2_42 == "dm01" then
    L3_43 = VisionBg
    L4_44 = L3_43
    L3_43 = L3_43.globalTvScheduleName
    L3_43(L4_44, "hx_dlc_01")
  elseif L2_42 == "dm03" or L2_42 == "dm05" or L2_42 == "dm06" then
    L3_43 = VisionBg
    L4_44 = L3_43
    L3_43 = L3_43.globalTvScheduleName
    L3_43(L4_44, "hx_dlc_02")
  elseif L0_40 == "eventheader" or L1_41 ~= "sm" or L1_41 ~= "cm" then
    L3_43 = GameDatabase
    L4_44 = L3_43
    L3_43 = L3_43.get
    L3_43 = L3_43(L4_44, ggd.Savedata__EventManageFlags__CurrentFreeMode)
    L4_44 = tonumber
    L4_44 = L4_44(string.match(L3_43, "%d+"))
    _visionSchedule(L4_44)
  elseif L2_42 then
    L3_43 = tonumber
    L4_44 = string
    L4_44 = L4_44.match
    L4_44 = L4_44(L2_42, "%d+")
    L3_43 = L3_43(L4_44, L4_44(L2_42, "%d+"))
    L4_44 = _visionSchedule
    L4_44(L3_43)
  end
end
function _visionSchedule(A0_45)
  if A0_45 == nil then
    return
  end
  if A0_45 >= 7 and A0_45 < 9 then
    VisionBg:globalTvScheduleName("gp_common", "gp_common_02")
    GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleJir, "gp_common_02")
  elseif A0_45 >= 9 and A0_45 < 10 then
    VisionBg:globalTvScheduleName("gp_common", "gp_common_03")
    GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleJir, "gp_common_03")
  elseif A0_45 == 10 then
    VisionBg:globalTvScheduleName("gp_common", "gp_common_04")
    GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleJir, "gp_common_04")
  elseif A0_45 >= 11 and A0_45 < 28 then
    VisionBg:globalTvScheduleName("gp_common", "gp_common_05")
    GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleJir, "gp_common_05")
  end
  if A0_45 >= 13 and A0_45 < 16 then
    if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm30) then
      VisionBg:globalTvScheduleName("hx_common", "hx_common_01_02")
      GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleHex, "hx_common_01_02")
    else
      VisionBg:globalTvScheduleName("hx_common", nil)
      GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleHex, "hx_common")
    end
  elseif A0_45 >= 18 and A0_45 < 20 then
    if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm30) then
      VisionBg:globalTvScheduleName("hx_common", "hx_common_02_02")
      GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleHex, "hx_common_02_02")
    else
      VisionBg:globalTvScheduleName("hx_common", "hx_common_02_01")
      GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleHex, "hx_common_02_01")
    end
  elseif A0_45 >= 21 and A0_45 < 29 then
    if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm30) then
      VisionBg:globalTvScheduleName("hx_common", "hx_common_03_02")
      GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleHex, "hx_common_03_02")
    else
      VisionBg:globalTvScheduleName("hx_common", "hx_common_03_01")
      GameDatabase:set(ggd.GlobalSystemFlags__TvScheduleHex, "hx_common_03_01")
    end
  end
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm30) then
    VisionBg:globalTvScheduleName("hx_common_10_01", "hx_common_10_02")
  end
end
function requestBgSetCom(A0_46)
  if _bg_handle then
    _bg_handle:sendEvent("requestBgSetCom", A0_46)
  end
end
function requestBgSet(A0_47)
  if _bg_handle then
    _bg_handle:sendEvent("requestBgSet", A0_47)
  end
end
function getBgSetInfomation(A0_48)
  if _bg_handle then
    return _bg_handle:sendEvent("getBgSetInfomation", A0_48)
  end
  return false
end
function setCraneShipInformation(A0_49)
  if _bg_handle then
    _bg_handle:sendEvent("setCraneShipInformation", A0_49)
  end
end
function requestCraneShip(A0_50)
  _craneShipManager:sendEvent("request", A0_50)
end
function getStateCraneShip(A0_51)
  return _craneShipManager:sendEvent("getState", A0_51)
end
function getCraneShipManagerHandle()
  local L0_52, L1_53
  L0_52 = _craneShipManager
  return L0_52
end
function requestWarshipShellingOn()
  _warShipManager:sendEvent("requestWarshipShellingOn")
end
function requestWarshipShellingOnAutoAlert()
  _warShipManager:sendEvent("requestWarshipShellingOnAutoAlert")
end
function requestWarshipShellingOff()
  _warShipManager:sendEvent("requestWarshipShellingOff")
end
function requestMechCannonStartBlankMode(A0_54, A1_55)
  _warShipManager:sendEvent("requestMechCannonStartBlankMode", A0_54, A1_55)
end
function requestMechCannonEndBlankMode()
  _warShipManager:sendEvent("requestMechCannonEndBlankMode")
end
function requestMechCannonStartControlMode()
  _warShipManager:sendEvent("requestMechCannonStartControlMode")
end
function requestMechCannonBlankShot()
  _warShipManager:sendEvent("requestMechCannonBlankShot")
end
function requestWarshipInvisible()
  _warShipManager:sendEvent("requestWarshipInvisible")
end
function requestIdlingMechCannon(A0_56)
  _warShipManager:sendEvent("requestIdlingMechCannon", A0_56)
end
function isMechCannonShot()
  return _warShipManager:sendEvent("isMechCannonShot")
end
function requestMechCannonShotClear()
  _warShipManager:sendEvent("clearMechCannonShot")
end
function requestWarshipBroken(A0_57)
  _warShipManager:sendEvent("requestWarshipBroken", A0_57)
end
function requestMechCannonStartPerformanceMode()
  _warShipManager:sendEvent("requestMechCannonStartPerformanceMode")
end
function requestMechCannonEndPerformanceMode()
  _warShipManager:sendEvent("requestMechCannonEndPerformanceMode")
end
function requestWarshipWarp(A0_58)
  _warShipManager:sendEvent("requestWarshipWarp", A0_58)
end
function requestGetMechCannonMax()
  return _warShipManager:sendEvent("requestGetMechCannonMax")
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
  {name = "none", time = 0}
}
function debugPrint(A0_59)
  print(" <  bg mng > " .. A0_59)
end
function debugDispPrint(A0_60)
  local L1_61
  L1_61 = _debugDispX
  L1_61 = L1_61 + (Debug:isDebugMenuOpen() and 550 or 350)
  Font:debugPrint(L1_61, 50 + 20 * _debugLine, A0_60)
  _debugLine = _debugLine + 1
end
function debugDisp()
  invokeSystemTask(function()
    local L0_62, L1_63, L2_64, L3_65, L4_66
    L0_62 = _phase
    L1_63 = nil
    L2_64 = false
    while true do
      if not L3_65 then
        if L3_65 == L4_66 then
          if L2_64 then
            L3_65(L4_66)
            L3_65[L4_66] = {
              name = debugPhase(L0_62),
              time = L1_63:getSecond()
            }
            L1_63 = nil
            L2_64 = false
          end
        elseif not L2_64 then
          L1_63 = L3_65
          L3_65(L4_66)
          L2_64 = true
        end
        if L0_62 ~= L3_65 then
          if L1_63 then
            L3_65(L4_66)
            L3_65[L4_66] = {
              name = debugPhase(L0_62),
              time = L1_63:getSecond()
            }
            L1_63 = L3_65
            L3_65(L4_66)
          end
          L0_62 = _phase
          L3_65(L4_66)
        end
        _debugDispX = 0
        _debugLine = 0
        if L3_65 == true then
          debugDispPrint("- bgManager  state-")
          debugDispPrint("phase        = [ " .. L3_65 .. " ]")
          debugDispPrint("accept       = [ " .. L4_66 .. " ]")
          debugDispPrint("area start   = [ " .. tostring(_area_started) .. " ]")
          debugDispPrint("area init    = [ " .. tostring(_area_initialized) .. " ]")
          debugDispPrint("area load    = [ " .. tostring(_area_loaded) .. " ]")
        end
        if L3_65 == true then
          L3_65(L4_66)
          for _FORV_6_, _FORV_7_ in L3_65(L4_66) do
            debugDispPrint(string.format("%-10s", _FORV_7_.name) .. " < " .. _FORV_7_.time)
          end
        end
        L3_65()
      end
    end
  end)
end
function debugPhase(A0_67)
  local L1_68
  L1_68 = kBG_MNG_PHASE_ACCEPT
  if A0_67 == L1_68 then
    L1_68 = "accept"
    return L1_68
  else
    L1_68 = kBG_MNG_PHASE_AREA_START
    if A0_67 == L1_68 then
      L1_68 = "area start"
      return L1_68
    else
      L1_68 = kBG_MNG_PHASE_AREA_WARP
      if A0_67 == L1_68 then
        L1_68 = "area_warp"
        return L1_68
      else
        L1_68 = kBG_MNG_PHASE_AREA_INIT
        if A0_67 == L1_68 then
          L1_68 = "area init"
          return L1_68
        else
          L1_68 = kBG_MNG_PHASE_AREA_LOAD
          if A0_67 == L1_68 then
            L1_68 = "area load"
            return L1_68
          else
            L1_68 = kBG_MNG_PHASE_AREA_MOVE
            if A0_67 == L1_68 then
              L1_68 = "area move"
              return L1_68
            end
          end
        end
      end
    end
  end
  L1_68 = "err"
  return L1_68
end
function debugAccept()
  local L0_69, L1_70
  L0_69 = _accept
  L1_70 = kBG_MNG_ACCEPT_EMPTY
  if L0_69 == L1_70 then
    L0_69 = "empty"
    return L0_69
  else
    L0_69 = _accept
    L1_70 = kBG_MNG_ACCEPT_CREATE
    if L0_69 == L1_70 then
      L0_69 = "create"
      return L0_69
    end
  end
  L0_69 = "err"
  return L0_69
end
g_customDebugMenu = {
  {
    name = "DebugDisp",
    callback = function()
      local L1_71
      L1_71 = _debugDisp
      L1_71 = not L1_71
      _debugDisp = L1_71
    end
  },
  {
    name = "DebugDispTime",
    callback = function()
      local L1_72
      L1_72 = _debugDispTime
      L1_72 = not L1_72
      _debugDispTime = L1_72
    end
  }
}
