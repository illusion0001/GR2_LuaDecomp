dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_crow_puppet = nil
_litho_theme = nil
_enemy_cnt = 0
_parasite_on = false
_sdemo1 = nil
_sdemo2 = nil
_sdemo3 = nil
enmgen2_battle_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "parasite_nest",
      locator = "locator2_b2_01",
      name = "specialb21"
    },
    {
      type = "stalker_strong",
      locator = "locator2_b2_02",
      name = "specialb22"
    },
    {
      type = "guardcore_strong",
      locator = "locator2_b2_03",
      name = "specialb23"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_b2_04",
      name = "specialb24"
    },
    {
      type = "stalker_strong",
      locator = "locator2_b2_05",
      name = "specialb25"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_b2_06",
      name = "specialb26"
    },
    {
      type = "stalker_strong",
      locator = "locator2_b2_07",
      name = "specialb27"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_b2_08",
      name = "specialb28"
    },
    {
      type = "gellyfish_strong",
      locator = "locator2_b2_09",
      name = "specialb29"
    }
  },
  addParasiteSpawnSetName0 = "spawnSetParasite0",
  spawnSetParasite0 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite0_01"
    }
  },
  addParasiteSpawnSetName1 = "spawnSetParasite1",
  spawnSetParasite1 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite1_01"
    }
  },
  addParasiteSpawnSetName2 = "spawnSetParasite2",
  spawnSetParasite2 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite2_01"
    }
  },
  addParasiteSpawnSetName3 = "spawnSetParasite3",
  spawnSetParasite3 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite3_01"
    }
  },
  addParasiteSpawnSetName4 = "spawnSetParasite4",
  spawnSetParasite4 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite4_01"
    }
  },
  addParasiteSpawnSetName5 = "spawnSetParasite5",
  spawnSetParasite5 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite5_01"
    }
  },
  addParasiteSpawnSetName6 = "spawnSetParasite6",
  spawnSetParasite6 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite6_01"
    }
  },
  addParasiteSpawnSetName7 = "spawnSetParasite7",
  spawnSetParasite7 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite7_01"
    }
  },
  addParasiteSpawnSetName8 = "spawnSetParasite8",
  spawnSetParasite8 = {
    {
      type = "parasite",
      locator = "locator2_b2_01",
      name = "call_parasite8_01"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {"specialb21"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end,
  onUpdate = function(A0_4)
    local L1_5
  end,
  onEnter = function(A0_6)
    local L1_7
  end,
  onLeave = function(A0_8)
    local L1_9
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum - 1
    if A0_10:getSpecTable().enemyDeadNum < 0 then
      A0_10:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
function Initialize()
  _sdemo1 = SDemo.create("ep21_c_1")
  _sdemo2 = SDemo.create("ep21_c_2")
  _sdemo3 = SDemo.create("ep21_c_3")
  Fn_pcSensorOff("pccubesensor2_demo_02")
end
function Ingame()
  local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28
  L0_21 = Fn_createEffect
  L1_22 = "gravity"
  L2_23 = "ef_ev_dscbk_01"
  L3_24 = "pccubesensor2_nekostorm_01"
  L4_25 = true
  L0_21 = L0_21(L1_22, L2_23, L3_24, L4_25)
  L1_22 = findGameObject2
  L2_23 = "Node"
  L3_24 = "pccubesensor2_nekostorm_01"
  L1_22 = L1_22(L2_23, L3_24)
  storm_hdl_01 = L1_22
  L1_22 = Sound
  L2_23 = L1_22
  L1_22 = L1_22.playSEHandleBox
  L3_24 = "ep21_storm"
  L4_25 = 1
  L5_26 = ""
  L6_27 = storm_hdl_01
  L1_22 = L1_22(L2_23, L3_24, L4_25, L5_26, L6_27)
  storm_01 = L1_22
  L1_22 = findGameObject2
  L2_23 = "Node"
  L3_24 = "locator2_se_01"
  L1_22 = L1_22(L2_23, L3_24)
  storm_se_in = L1_22
  L1_22 = Sound
  L2_23 = L1_22
  L1_22 = L1_22.playSEHandle
  L3_24 = "ep21_storm"
  L4_25 = 0.9
  L5_26 = ""
  L6_27 = storm_se_in
  L1_22 = L1_22(L2_23, L3_24, L4_25, L5_26, L6_27)
  storm_se = L1_22
  L1_22 = Fn_loadEventData
  L2_23 = "evx/ep21_beans"
  L3_24 = "evarea2_co_a_01"
  L4_25 = true
  L1_22(L2_23, L3_24, L4_25)
  L1_22 = move_area_beans
  L1_22()
  L1_22 = Player
  L2_23 = L1_22
  L1_22 = L1_22.setParameter
  L3_24 = Player
  L3_24 = L3_24.kParam_GravPowConsumFactor
  L4_25 = 0.05
  L5_26 = 1
  L6_27 = 0
  L1_22(L2_23, L3_24, L4_25, L5_26, L6_27)
  L1_22 = Fn_setCatWarpCheckPoint
  L2_23 = "locator2_reset_01"
  L1_22(L2_23)
  while true do
    while true do
      L1_22 = _crow_puppet
      if L1_22 == nil then
        L1_22 = Fn_sendEventComSb
        L2_23 = "crow_name"
        L1_22 = L1_22(L2_23)
        _crow_puppet = L1_22
        L1_22 = wait
        L1_22()
      end
    end
  end
  while true do
    while true do
      L1_22 = _brain_crow
      if L1_22 == nil then
        L1_22 = _crow_puppet
        L2_23 = L1_22
        L1_22 = L1_22.getBrain
        L1_22 = L1_22(L2_23)
        _brain_crow = L1_22
        L1_22 = wait
        L1_22()
      end
    end
  end
  while true do
    L1_22 = _brain_crow
    L2_23 = L1_22
    L1_22 = L1_22.isRunning
    L1_22 = L1_22(L2_23)
    if not L1_22 then
      L1_22 = wait
      L1_22()
    end
  end
  function L1_22(A0_29)
    if A0_29.eventType == "start" then
      _parasite_on = true
      print("parasite start\n")
    elseif A0_29.eventType == "implant" then
      print("parasite implant\n")
    elseif A0_29.eventType == "complete" then
      print("parasite complete\n")
    end
    return A0_29
  end
  fn_parasite_event = L1_22
  L1_22 = Fn_userCtrlOn
  L1_22()
  L1_22 = Fn_missionStart
  L1_22()
  repeat
    L1_22 = Fn_sendEventComSb
    L2_23 = "lithoStart"
    L1_22 = L1_22(L2_23)
    litho_start = L1_22
    L1_22 = wait
    L1_22()
    L1_22 = litho_start
  until L1_22 == true
  L1_22 = findGameObject2
  L2_23 = "EnemyGenerator"
  L3_24 = "enmgen2_b_02"
  L1_22 = L1_22(L2_23, L3_24)
  if L1_22 ~= nil then
    L3_24 = L1_22
    L2_23 = L1_22.requestSpawn
    L2_23(L3_24)
  end
  L3_24 = L1_22
  L2_23 = L1_22.setEnemyMarker
  L4_25 = false
  L2_23(L3_24, L4_25)
  L3_24 = L1_22
  L2_23 = L1_22.requestIdlingEnemy
  L4_25 = true
  L2_23(L3_24, L4_25)
  repeat
    L2_23 = wait
    L2_23()
    L2_23 = Fn_sendEventComSb
    L3_24 = "isLithographStart"
    L2_23 = L2_23(L3_24)
  until L2_23
  while true do
    L2_23 = findGameObject2
    L3_24 = "Puppet"
    L4_25 = "specialb21"
    L2_23 = L2_23(L3_24, L4_25)
    if L2_23 == nil then
      L2_23 = print
      L3_24 = "\229\183\163\227\129\174\227\131\145\227\131\154\227\131\131\227\131\136\229\190\133\227\129\161\228\184\173"
      L2_23(L3_24)
      L2_23 = wait
      L2_23()
    end
  end
  L2_23 = findGameObject2
  L3_24 = "Puppet"
  L4_25 = "specialb21"
  L2_23 = L2_23(L3_24, L4_25)
  while true do
    L4_25 = L2_23
    L3_24 = L2_23.getBrain
    L3_24 = L3_24(L4_25)
    if L3_24 == nil then
      L3_24 = print
      L4_25 = "\227\131\150\227\131\172\227\130\164\227\131\179\229\190\133\227\129\161\228\184\173"
      L3_24(L4_25)
      L3_24 = wait
      L3_24()
    end
  end
  L4_25 = L2_23
  L3_24 = L2_23.getBrain
  L3_24 = L3_24(L4_25)
  L4_25 = Fn_sendEventComSb
  L5_26 = "setFirstHalfProcessEnd"
  L4_25(L5_26)
  repeat
    L4_25 = wait
    L4_25()
    L4_25 = Fn_sendEventComSb
    L5_26 = "isFirstHalfProcessEnd"
    L4_25 = L4_25(L5_26)
  until L4_25
  L4_25 = _brain_crow
  L5_26 = L4_25
  L4_25 = L4_25.setIdling
  L6_27 = false
  L4_25(L5_26, L6_27)
  L4_25 = Fn_missionView
  L5_26 = "ep21_09000"
  L6_27, L7_28 = nil, nil
  L4_25(L5_26, L6_27, L7_28, true)
  L4_25 = Fn_sendEventComSb
  L5_26 = "crowVisible"
  L4_25(L5_26)
  L4_25 = Fn_pcSensorOn
  L5_26 = "pccubesensor2_demo_02"
  L4_25(L5_26)
  L4_25 = _brain_crow
  L5_26 = L4_25
  L4_25 = L4_25.setIdling
  L6_27 = true
  L4_25(L5_26, L6_27)
  L4_25 = Fn_userCtrlOff
  L4_25()
  L4_25 = Player
  L5_26 = L4_25
  L4_25 = L4_25.setStay
  L6_27 = true
  L4_25(L5_26, L6_27)
  L4_25 = _sdemo1
  L5_26 = L4_25
  L4_25 = L4_25.set
  L6_27 = "locator2_cam_01"
  L7_28 = "locator2_b2_01"
  L4_25(L5_26, L6_27, L7_28, false)
  L4_25 = _sdemo1
  L5_26 = L4_25
  L4_25 = L4_25.play
  L4_25(L5_26)
  L4_25 = _sdemo1
  L5_26 = L4_25
  L4_25 = L4_25.setCameraParam
  L6_27 = nil
  L7_28 = 0.1
  L4_25(L5_26, L6_27, L7_28, {deg = 50})
  L4_25 = invokeTask
  function L5_26()
    _sdemo1:zoomIn(5, {deg = 47}, "Linear")
  end
  L4_25(L5_26)
  L4_25 = findGameObject2
  L5_26 = "Node"
  L6_27 = "locator2_reset_c_02"
  L4_25 = L4_25(L5_26, L6_27)
  L5_26 = L4_25
  L4_25 = L4_25.getWorldTransform
  L5_26 = L4_25(L5_26)
  L6_27 = Fn_setPcPosRot
  L7_28 = L4_25
  L6_27(L7_28, L5_26)
  L6_27 = Fn_captionViewWait
  L7_28 = "ep21_02000"
  L6_27(L7_28)
  L7_28 = L3_24
  L6_27 = L3_24.eventMessage
  L6_27(L7_28, "reqAppear", "spawnSetParasite0")
  L7_28 = L3_24
  L6_27 = L3_24.eventMessage
  L6_27(L7_28, "genStop", true)
  L6_27 = print
  L7_28 = "\229\175\132\231\148\159\227\131\141\227\131\180\227\130\163\229\135\186\227\129\151\227\129\159\227\129\164\227\130\130\227\130\138"
  L6_27(L7_28)
  L7_28 = L1_22
  L6_27 = L1_22.requestIdlingEnemy
  L6_27(L7_28, false)
  while true do
    L6_27 = findGameObject2
    L7_28 = "Puppet"
    L6_27 = L6_27(L7_28, "call_parasite0_01")
    if L6_27 == nil then
      L6_27 = print
      L7_28 = "\227\131\145\227\131\154\227\131\131\227\131\136\229\190\133\227\129\161\228\184\173"
      L6_27(L7_28)
      L6_27 = wait
      L6_27()
    end
  end
  L6_27 = findGameObject2
  L7_28 = "Puppet"
  L6_27 = L6_27(L7_28, "call_parasite0_01")
  while true do
    L7_28 = L6_27.getBrain
    L7_28 = L7_28(L6_27)
    if L7_28 == nil then
      L7_28 = print
      L7_28("\227\131\150\227\131\172\227\130\164\227\131\179\229\190\133\227\129\161\228\184\173")
      L7_28 = wait
      L7_28()
    end
  end
  L7_28 = L6_27.getBrain
  L7_28 = L7_28(L6_27)
  L7_28:setEventListener("enemy_parasite_event", fn_parasite_event)
  L7_28:eventMessage("setParasiteTarget", "specialb26")
  wait(25)
  Fn_captionView("ep21_02003")
  _sdemo2:set("locator2_cam_01", L6_27, true)
  _sdemo2:play()
  _sdemo2:setCameraParam(nil, 0.1, {deg = 30})
  repeat
    print("\230\134\145\228\190\157\229\190\133\227\129\161")
    wait()
  until _parasite_on == true
  _sdemo2:zoomIn(0.5, {deg = 18}, "easeOut")
  Fn_captionViewWait("ep21_02004")
  Fn_captionViewWait("ep21_02005")
  _sdemo3:set("locator2_cam_01", "locator2_b2_01", false)
  _sdemo3:setCameraParam(nil, 0.1, {deg = 45})
  _sdemo3:play()
  invokeTask(function()
    _sdemo3:zoomOut(4, {deg = 50}, "Linear")
  end)
  Fn_captionView("ep21_02006")
  L3_24:eventMessage("reqAppear", "spawnSetParasite1")
  waitSeconds(0.5)
  L3_24:eventMessage("reqAppear", "spawnSetParasite0")
  waitSeconds(0.5)
  L3_24:eventMessage("reqAppear", "spawnSetParasite0")
  L3_24:eventMessage("genStop", false)
  print("\229\175\132\231\148\159\227\131\141\227\131\180\227\130\163\229\135\186\227\129\151\227\129\159\227\129\164\227\130\130\227\130\138")
  waitSeconds(2)
  L1_22:setEnemyMarker(true)
  Player:setStay(false)
  Fn_userCtrlOn()
  _brain_crow:setIdling(false)
  _sdemo3:stop(2)
  invokeTask(function()
    repeat
      repeat
        print(L1_22:getEnemyCount())
        wait()
      until L1_22:getEnemyCount() <= 0
      if _litho_theme == nil then
        _litho_theme = true
      end
    until _litho_theme
  end)
  repeat
    if _litho_theme == false then
    end
    wait()
  until _litho_theme
  _brain_crow:setIdling(true)
  Fn_sendEventComSb("crowVisible")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  _brain_crow:setIdling(false)
  Fn_sendEventComSb("crowVisible")
  Sound:stopSEHandle(storm_01)
  Sound:stopSEHandle(storm_se)
  Fn_sendEventComSb("stop_stormse_01")
  L0_21:setVisible(false)
  Fn_captionViewWait("ep21_02001")
  Fn_captionViewWait("ep21_02002")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_30, L1_31
end
function navi_on()
  local L0_32, L1_33
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pccubesensor2_nekostorm_01_OnEnter(A0_34)
  invokeTask(function()
    Fn_catWarp()
    Player:setGravityControlMode(true)
  end)
end
function pccubesensor2_demo_02_OnEnter(A0_35)
  A0_35:setActive(false)
  _next_phase = true
end
