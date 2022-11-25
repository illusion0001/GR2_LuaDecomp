dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Event2/Mission/ep11_common.lua")
_areMoveTask = nil
_crow = {}
_bunga_island = {
  "bu_a_02",
  "bu_a_07",
  "bu_a_09",
  "bu_a_12_01",
  "bu_a_12_02",
  "bu_a_14_01",
  "bu_a_14_02",
  "bu_a_18",
  "ve_lo_a"
}
_bunga_island_nomove = {
  "bu_a_01",
  "bu_a_03_01",
  "bu_a_03_02",
  "bu_a_04",
  "bu_a_05",
  "bu_a_08",
  "bu_a_11",
  "bu_a_15"
}
_enmgenList = {
  "enmgen2_gm_bodyarea_01",
  "enmgen2_gm_f_01",
  "enmgen2_gm_r_01",
  "enmgen2_gm_l_01"
}
_isAbsorptionReady = false
_ABSORPTION_COUNT_INIT = 1500
_absorptionCount = _ABSORPTION_COUNT_INIT
_battleCaptionEnable = true
_islandTask = {}
_crowTask = nil
_CROW_WARP_INTERVAL = 1800
_pre_area_groups = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  for L3_3, L4_4 in L0_0(L1_1) do
    Fn_setAreaWarp(L4_4, string.format("locator2_%s_08", L4_4))
  end
  for L3_3, L4_4 in L0_0(L1_1) do
    Fn_setAreaWarp(L4_4, string.format("locator2_%s_01", L4_4))
  end
  L3_3 = "locator2_ve_lo_a_01"
  L4_4 = "ve_lo_a"
  L4_4 = L2_2(L3_3, L4_4)
  L0_0(L1_1, L2_2, L3_3, L4_4, L2_2(L3_3, L4_4))
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8
  L0_5 = emergency_catwarp_start
  L0_5 = L0_5()
  L1_6 = Fn_findAreaHandle
  L2_7 = "bu_d_root"
  L1_6 = L1_6(L2_7)
  if L1_6 then
    L2_7 = _pre_area_groups
    L3_8 = L1_6.getName
    L3_8 = L3_8(L1_6)
    L2_7[L3_8] = L1_6:getAreaGroup()
    L3_8 = L1_6
    L2_7 = L1_6.setAreaGroup
    L2_7(L3_8, "up", true)
  end
  L2_7 = Fn_findAreaHandle
  L3_8 = "ve_crane_root"
  L2_7 = L2_7(L3_8)
  if L2_7 then
    L3_8 = _pre_area_groups
    L3_8[L2_7:getName()] = L2_7:getAreaGroup()
    L3_8 = L2_7.setAreaGroup
    L3_8(L2_7, "up", true)
  end
  L1_6 = Fn_sendEventComSb
  L2_7 = "setPcSensor"
  L3_8 = "pccubesensor2_safty_area"
  L1_6(L2_7, L3_8, false)
  L1_6 = Fn_sendEventComSb
  L2_7 = "setGemActive"
  L3_8 = true
  L1_6(L2_7, L3_8, "vital", 6, 10)
  L1_6 = Player
  L2_7 = L1_6
  L1_6 = L1_6.setEnergy
  L3_8 = Player
  L3_8 = L3_8.kEnergy_Life
  L1_6(L2_7, L3_8, Player:getEnergyMax(Player.kEnergy_Life))
  L1_6 = Player
  L2_7 = L1_6
  L1_6 = L1_6.muteVoice
  L3_8 = Player
  L3_8 = L3_8.kVoiceMuteLv_NoMute
  L1_6(L2_7, L3_8)
  L1_6 = Player
  L2_7 = L1_6
  L1_6 = L1_6.setSupporterCallLevel
  L3_8 = Player
  L3_8 = L3_8.kSupporterCallLv_MuteAll
  L1_6(L2_7, L3_8)
  L1_6 = Fn_setCatWarp
  L2_7 = false
  L1_6(L2_7)
  L1_6 = Fn_setCatWarpCheckPoint
  L2_7 = "locator2_pc_start_pos"
  L1_6(L2_7)
  L1_6 = Fn_findAreaHandle
  L2_7 = "ve_lo_a"
  L1_6 = L1_6(L2_7)
  L3_8 = L1_6
  L2_7 = L1_6.setEffectiveness
  L2_7(L3_8, true)
  L3_8 = L1_6
  L2_7 = L1_6.setAreaGroup
  L2_7(L3_8, "ji_c_root")
  L2_7 = Fn_sendEventComSb
  L3_8 = "setNpcActive"
  L2_7(L3_8, {"cid01"}, true)
  L2_7 = Fn_sendEventComSb
  L3_8 = "setNpcActive"
  L2_7(L3_8, {"sis01"}, false)
  L2_7 = Fn_sendEventComSb
  L3_8 = "setNpcMotion"
  L2_7(L3_8)
  L2_7 = Fn_sendEventComSb
  L3_8 = "setBridgeBaseActive"
  L2_7(L3_8, false)
  repeat
    L2_7 = wait
    L2_7()
    L2_7 = Fn_sendEventComSb
    L3_8 = "isGmReady"
    L2_7 = L2_7(L3_8)
  until L2_7
  L2_7 = Fn_sendEventComSb
  L3_8 = "getCrowHandle"
  L2_7 = L2_7(L3_8)
  L3_8 = typedef_CrowClass
  L3_8 = L3_8.new
  L3_8 = L3_8(L2_7)
  _crow = L3_8
  L3_8 = _crow
  L3_8 = L3_8.setIdling
  L3_8(true)
  L3_8 = Fn_sendEventComSb
  L3_8 = L3_8("getNodeHandle", "locator2_crow_start_ep11_d")
  _crow.warpToNode(L3_8, Supporter.FirstAction.Ground)
  Fn_sendEventComSb("setEnableHomingTargetGmEnemy", true)
  Area:setBridgeEnable(false)
  bungaAction()
  Fn_sendEventComSb("requestSpawn", {
    "enmgen2_gm_bodyarea_01",
    "enmgen2_gm_f_01",
    "enmgen2_gm_r_01",
    "enmgen2_gm_l_01"
  })
  waitSkyStable()
  Fn_sendEventComSb("startGmScream")
  armStatus = Fn_sendEventComSb("getArmState")
  if (armStatus.f and 1 or 0) * 4 + (armStatus.r and 1 or 0) * 2 + (armStatus.l and 1 or 0) == 0 then
    Fn_sendEventComSb("setVisibleCoreMarker", "f", false)
    Fn_sendEventComSb("setVisibleCoreMarker", "r", true)
    Fn_sendEventComSb("setVisibleCoreMarker", "l", false)
  else
    Fn_sendEventComSb("setVisibleCoreMarker", "f", true)
    Fn_sendEventComSb("setVisibleCoreMarker", "r", true)
    Fn_sendEventComSb("setVisibleCoreMarker", "l", true)
  end
  HUD:enemymarkerSetRange(500)
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_captionView("ep11_03015")
  waitSeconds(2)
  Fn_missionView("ep11_03000")
  _currentMissionText = "ep11_03000"
  Fn_sendEventComSb("requestIdling", "enmgen2_gm_bodyarea_01", false)
  Fn_sendEventComSb("requestIdlingGmEnemy", false)
  _crowTask = invokeTask(battleTask)
  Fn_sendEventComSb("stopGmScream")
  repeat
    wait()
  until Fn_sendEventComSb("isArmBrokenAll") and not Fn_sendEventComSb("isGameOver")
  _crowTask:abort()
  _crowTask = nil
  Fn_sendEventComSb("stopRumbleSE")
  Fn_sendEventComSb("requestAllEnemyKill", _enmgenList)
  waitSeconds(10)
  Fn_kaiwaDemoView("ep11_00320k")
  if L0_5 then
    L0_5:abort()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _crowTask ~= nil then
    _crowTask:abort()
    _crowTask = nil
  end
  for _FORV_3_ = 1, #_islandTask do
    _islandTask[_FORV_3_]:abort()
    _islandTask[_FORV_3_] = nil
  end
  for _FORV_3_, _FORV_4_ in pairs(areaControllers) do
    _FORV_4_:stop()
  end
  areaControllers = nil
  if Fn_getPlayer() then
    Camera:stopShake(0.5)
    Player:setSupporterCallLevel(Player.kSupporterCallLv_Normal)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  Mob:makeSituationPanic(false)
  if Fn_findAreaHandle("bu_d_root") then
    Fn_findAreaHandle("bu_d_root"):setAreaGroup(_pre_area_groups[Fn_findAreaHandle("bu_d_root"):getName()], true)
  end
  if Fn_findAreaHandle("ve_crane_root") then
    Fn_findAreaHandle("ve_crane_root"):setAreaGroup(_pre_area_groups[Fn_findAreaHandle("ve_crane_root"):getName()], true)
  end
end
function crowArmSelect()
  Fn_sendEventComSb("setAttackParams")
  if not Fn_sendEventComSb("getArmState").f then
    Fn_sendEventComSb("setTargetEnemies", "f")
  elseif not Fn_sendEventComSb("getArmState").r then
    Fn_sendEventComSb("setTargetEnemies", "r")
  elseif not Fn_sendEventComSb("getArmState").l then
    Fn_sendEventComSb("setTargetEnemies", "l")
  end
end
function battleTask()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23, L15_24
  L0_9 = {}
  L1_10 = {}
  L2_11 = Player
  L3_12 = L2_11
  L2_11 = L2_11.getEnergy
  L4_13 = Player
  L4_13 = L4_13.kEnergy_Life
  L2_11 = L2_11(L3_12, L4_13)
  L3_12 = L2_11
  L4_13 = 0
  L0_9.ep11_03001 = false
  L0_9.ep11_03015 = false
  L0_9.ep11_03016 = false
  L0_9.ep11_03017 = false
  L0_9.begin = true
  _battleCaptionEnable = false
  L5_14 = Fn_sendEventComSb
  L6_15 = "getArmState"
  L5_14 = L5_14(L6_15)
  L1_10 = L5_14
  L5_14 = L1_10.f
  if L5_14 then
    L5_14 = 1
  else
    L5_14 = L5_14 or 0
  end
  L5_14 = L5_14 * 4
  L6_15 = L1_10.r
  if L6_15 then
    L6_15 = 1
  else
    L6_15 = L6_15 or 0
  end
  L6_15 = L6_15 * 2
  L5_14 = L5_14 + L6_15
  L6_15 = L1_10.l
  if L6_15 then
    L6_15 = 1
  else
    L6_15 = L6_15 or 0
  end
  L5_14 = L5_14 + L6_15
  if L5_14 == 0 then
    L6_15 = crowCaption
    L7_16 = L5_14
    L6_15(L7_16)
  end
  L6_15 = _crow
  L6_15 = L6_15.setIdling
  L7_16 = false
  L6_15(L7_16)
  L6_15 = {
    L7_16,
    L8_17,
    L9_18,
    L10_19,
    L11_20
  }
  L7_16 = {}
  L8_17 = findGameObject2
  L9_18 = "Node"
  L10_19 = "locator2_crow_path_d_01"
  L8_17 = L8_17(L9_18, L10_19)
  L7_16.node_pos = L8_17
  L8_17 = Supporter
  L8_17 = L8_17.MovePoint
  L8_17 = L8_17.Ground
  L7_16.action = L8_17
  L7_16.vel = 1
  L8_17 = {}
  L9_18 = findGameObject2
  L10_19 = "Node"
  L11_20 = "locator2_crow_path_d_02"
  L9_18 = L9_18(L10_19, L11_20)
  L8_17.node_pos = L9_18
  L9_18 = Supporter
  L9_18 = L9_18.MovePoint
  L9_18 = L9_18.Ground
  L8_17.action = L9_18
  L8_17.vel = 1
  L9_18 = {}
  L10_19 = findGameObject2
  L11_20 = "Node"
  L12_21 = "locator2_crow_path_d_02"
  L10_19 = L10_19(L11_20, L12_21)
  L9_18.node_pos = L10_19
  L10_19 = Supporter
  L10_19 = L10_19.MovePoint
  L10_19 = L10_19.Takeoff
  L9_18.action = L10_19
  L9_18.vel = 1
  L10_19 = {}
  L11_20 = findGameObject2
  L12_21 = "Node"
  L13_22 = "locator2_crow_path_d_03"
  L11_20 = L11_20(L12_21, L13_22)
  L10_19.node_pos = L11_20
  L11_20 = Supporter
  L11_20 = L11_20.MovePoint
  L11_20 = L11_20.Air
  L10_19.action = L11_20
  L10_19.vel = 1
  L11_20 = {}
  L12_21 = findGameObject2
  L13_22 = "Node"
  L14_23 = "locator2_crow_path_d_04"
  L12_21 = L12_21(L13_22, L14_23)
  L11_20.node_pos = L12_21
  L12_21 = Supporter
  L12_21 = L12_21.MovePoint
  L12_21 = L12_21.Air
  L11_20.action = L12_21
  L11_20.vel = 1
  L7_16 = _crow
  L7_16 = L7_16.clearMovePoint
  L7_16()
  L7_16 = _crow
  L7_16 = L7_16.setMovePoints
  L8_17 = L6_15
  L7_16(L8_17)
  L7_16 = _crow
  L7_16 = L7_16.startMove
  L7_16()
  repeat
    L7_16 = wait
    L7_16()
    L7_16 = _crow
    L7_16 = L7_16.isMoveEnd
    L7_16 = L7_16()
  until L7_16
  L7_16 = waitSeconds
  L8_17 = 4
  L7_16(L8_17)
  L7_16 = _crow
  L7_16 = L7_16.clearMovePoint
  L7_16()
  L7_16 = crowArmSelect
  L7_16()
  L7_16 = Player
  L8_17 = L7_16
  L7_16 = L7_16.getEnergy
  L9_18 = Player
  L9_18 = L9_18.kEnergy_Life
  L7_16 = L7_16(L8_17, L9_18)
  L8_17 = L7_16
  L9_18 = L8_17
  L10_19 = 0
  _battleCaptionEnable = true
  _isAbsorptionReady = false
  L11_20 = _ABSORPTION_COUNT_INIT
  _absorptionCount = L11_20
  while true do
    L11_20 = Fn_sendEventComSb
    L12_21 = "getArmState"
    L11_20 = L11_20(L12_21)
    L1_10 = L11_20
    L11_20 = L1_10.f
    if L11_20 then
      L11_20 = 1
    else
      L11_20 = L11_20 or 0
    end
    L11_20 = L11_20 * 4
    L12_21 = L1_10.r
    if L12_21 then
      L12_21 = 1
    else
      L12_21 = L12_21 or 0
    end
    L12_21 = L12_21 * 2
    L11_20 = L11_20 + L12_21
    L12_21 = L1_10.l
    if L12_21 then
      L12_21 = 1
    else
      L12_21 = L12_21 or 0
    end
    L11_20 = L11_20 + L12_21
    L12_21 = L1_10.f
    if L12_21 then
      L12_21 = L1_10.r
      if L12_21 then
        L12_21 = L1_10.l
        if L12_21 then
          L12_21 = L0_9.all
          if not L12_21 then
            _battleCaptionEnable = false
            L12_21 = Fn_captionView
            L13_22 = "ep11_03007"
            L12_21(L13_22)
            L0_9.all = true
            L12_21 = crowCaption
            L13_22 = L11_20
            L12_21(L13_22)
          end
        end
      end
    else
      L12_21 = L1_10.r
      if L12_21 then
        L12_21 = L0_9.r
        if not L12_21 then
          _battleCaptionEnable = false
          L12_21 = Fn_captionView
          L13_22 = "ep11_03004"
          L12_21(L13_22)
          L12_21 = crowArmSelect
          L12_21()
          L0_9.r = true
          L12_21 = GameDatabase
          L13_22 = L12_21
          L12_21 = L12_21.set
          L14_23 = ggd
          L14_23 = L14_23.EventFlags__ep11__flag02
          L15_24 = 1
          L12_21(L13_22, L14_23, L15_24)
          _isAbsorptionReady = true
          L12_21 = crowCaption
          L13_22 = L11_20
          L12_21(L13_22)
          L12_21 = Fn_sendEventComSb
          L13_22 = "setVisibleCoreMarker"
          L14_23 = "f"
          L15_24 = true
          L12_21(L13_22, L14_23, L15_24)
          L12_21 = Fn_sendEventComSb
          L13_22 = "setVisibleCoreMarker"
          L14_23 = "l"
          L15_24 = true
          L12_21(L13_22, L14_23, L15_24)
        end
      else
        L12_21 = L1_10.l
        if L12_21 then
          L12_21 = L0_9.l
          if not L12_21 then
            _battleCaptionEnable = false
            L12_21 = Fn_captionView
            L13_22 = "ep11_03005"
            L12_21(L13_22)
            L12_21 = crowArmSelect
            L12_21()
            L0_9.l = true
            L12_21 = GameDatabase
            L13_22 = L12_21
            L12_21 = L12_21.set
            L14_23 = ggd
            L14_23 = L14_23.EventFlags__ep11__flag03
            L15_24 = 1
            L12_21(L13_22, L14_23, L15_24)
            _isAbsorptionReady = true
            L12_21 = crowCaption
            L13_22 = L11_20
            L12_21(L13_22)
            L12_21 = Fn_sendEventComSb
            L13_22 = "setVisibleCoreMarker"
            L14_23 = "f"
            L15_24 = true
            L12_21(L13_22, L14_23, L15_24)
            L12_21 = Fn_sendEventComSb
            L13_22 = "setVisibleCoreMarker"
            L14_23 = "r"
            L15_24 = true
            L12_21(L13_22, L14_23, L15_24)
          end
        else
          L12_21 = L1_10.f
          if L12_21 then
            L12_21 = L0_9.f
            if not L12_21 then
              _battleCaptionEnable = false
              L12_21 = Fn_captionView
              L13_22 = "ep11_03006"
              L12_21(L13_22)
              L12_21 = crowArmSelect
              L12_21()
              L0_9.f = true
              L12_21 = GameDatabase
              L13_22 = L12_21
              L12_21 = L12_21.set
              L14_23 = ggd
              L14_23 = L14_23.EventFlags__ep11__flag01
              L15_24 = 1
              L12_21(L13_22, L14_23, L15_24)
              _isAbsorptionReady = true
              L12_21 = crowCaption
              L13_22 = L11_20
              L12_21(L13_22)
              L12_21 = Fn_sendEventComSb
              L13_22 = "setVisibleCoreMarker"
              L14_23 = "r"
              L15_24 = true
              L12_21(L13_22, L14_23, L15_24)
              L12_21 = Fn_sendEventComSb
              L13_22 = "setVisibleCoreMarker"
              L14_23 = "l"
              L15_24 = true
              L12_21(L13_22, L14_23, L15_24)
            end
          else
            L12_21 = L0_9.begin
            if not L12_21 then
              L0_9.begin = true
              _battleCaptionEnable = false
              L12_21 = crowCaption
              L13_22 = L11_20
              L12_21(L13_22)
            end
          end
        end
      end
    end
    L4_13 = L4_13 + 1
    if L4_13 > 3500 then
      L12_21 = isCoreInSight
      L12_21 = L12_21()
      if L12_21 then
        L12_21 = L0_9.ep11_03017
        if not L12_21 then
          L12_21 = _battleCaptionEnable
          if L12_21 then
            L12_21 = Fn_captionView
            L13_22 = "ep11_03017"
            L12_21(L13_22)
            L0_9.ep11_03017 = true
          end
        end
      end
    end
    if L4_13 > 3000 then
      L12_21 = isCoreInSight
      L12_21 = L12_21()
      if L12_21 then
        L12_21 = L0_9.ep11_03016
        if not L12_21 then
          L12_21 = _battleCaptionEnable
          if L12_21 then
            L12_21 = Fn_captionView
            L13_22 = "ep11_03016"
            L12_21(L13_22)
            L0_9.ep11_03016 = true
          end
        end
      end
    end
    if L4_13 > 500 then
      L12_21 = isCoreInSight
      L12_21 = L12_21()
      if L12_21 then
        L12_21 = L0_9.ep11_03001
        if not L12_21 then
          L12_21 = _battleCaptionEnable
          if L12_21 then
            L12_21 = Fn_captionView
            L13_22 = "ep11_03001"
            L12_21(L13_22)
            L0_9.ep11_03001 = true
          end
        end
      end
    end
    L12_21 = Player
    L13_22 = L12_21
    L12_21 = L12_21.getEnergy
    L14_23 = Player
    L14_23 = L14_23.kEnergy_Life
    L12_21 = L12_21(L13_22, L14_23)
    L8_17 = L12_21
    if L9_18 > L8_17 then
      L12_21 = Fn_isCaptionView
      L12_21 = L12_21()
      if not L12_21 then
        L12_21 = RandI
        L13_22 = 1
        L14_23 = 5
        L12_21 = L12_21(L13_22, L14_23)
        if L12_21 == 1 then
          L13_22 = Fn_captionView
          L14_23 = "ep11_01017"
          L13_22(L14_23)
        else
          if L12_21 == 2 then
            L13_22 = Fn_captionView
            L14_23 = "ep11_01018"
            L13_22(L14_23)
          else
          end
        end
        L9_18 = L8_17
      end
    end
    L10_19 = L10_19 + 1
    L12_21 = _CROW_WARP_INTERVAL
    if L10_19 > L12_21 then
      L12_21 = _crow
      L12_21 = L12_21.getCurrentThreatObject
      L12_21 = L12_21()
      if L12_21 ~= nil then
        L14_23 = L12_21
        L13_22 = L12_21.getWorldTransform
        L14_23 = L13_22(L14_23)
        L15_24 = {}
        L15_24.pos = L13_22 + L14_23:Apply(Vector(0, 50, 0))
        L15_24.rot = Vector(0, 0, 0)
        L15_24.forced = true
        L15_24.end_idling = false
        print(string.format("\227\130\175\227\131\173\227\130\166\227\130\146 %s \227\129\174\228\184\138\231\169\186\227\129\184\227\131\175\227\131\188\227\131\151", L12_21:getName()))
        L10_19 = 0
      end
    end
    L12_21 = gmAction
    L12_21()
    L12_21 = wait
    L12_21()
  end
end
function crowCaption(A0_25)
  local L1_26
  L1_26 = {
    "ep11_03002",
    "ep11_03012",
    "ep11_03013",
    "ep11_03011",
    "ep11_03010",
    "ep11_03009",
    "ep11_03008",
    "ep11_03003"
  }
  invokeTask(function()
    waitSeconds(4)
    Fn_captionView(L1_26[A0_25 + 1])
    waitSeconds(4)
    _battleCaptionEnable = true
  end)
end
function isCoreInSight()
  return Fn_sendEventComSb("isCoreInSight")
end
function gmAction()
  if not _isAbsorptionReady then
    return
  end
  _absorptionCount = _absorptionCount - 1
  if _absorptionCount < 10 or _absorptionCount % 100 == 0 then
    print(string.format("\233\135\141\229\138\155\230\148\187\230\146\131\227\129\190\227\129\167 \227\129\130\227\129\168 %d", _absorptionCount))
  end
  if _absorptionCount > 0 then
    return
  end
  _absorptionCount = 0
  invokeTask(function()
    _isAbsorptionReady = false
    repeat
      wait()
    until Fn_sendEventComSb("requestGmAction", "absorptionStandby")
    print("\229\144\184\227\129\132\232\190\188\227\129\191\230\186\150\229\130\153\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136")
    Fn_sendEventComSb("requestAllEnemyKill", _enmgenList)
    Fn_naviSet(findGameObject2("Node", "locator2_pc_start_pos"))
    repeat
      wait()
    until Fn_sendEventComSb("requestGmAction", "absorption3")
    print("\229\144\184\227\129\132\232\190\188\227\129\191\229\135\166\231\144\134\233\150\139\229\167\139\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136")
    repeat
      wait()
    until Fn_sendEventComSb("isAbsorptionEnd")
    Fn_naviKill()
    repeat
      wait()
    until Fn_sendEventComSb("isAbsorptionEnd")
    Fn_sendEventComSb("requestAllEnemySpawn", _enmgenList)
    waitSeconds(1)
    _absorptionCount = _ABSORPTION_COUNT_INIT
    _isAbsorptionReady = true
  end)
end
function bungaAction()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38
  L0_27(L1_28, L2_29)
  areaControllers = L0_27
  L0_27(L1_28, L2_29)
  for L3_30, L4_31 in L0_27(L1_28) do
    L6_33 = AreaController
    L6_33 = L6_33.create
    L7_34 = L4_31
    L6_33 = L6_33(L7_34)
    L5_32[L4_31] = L6_33
  end
  L0_27.velocity = 10
  L0_27.angle = 30
  L0_27.loop = false
  L0_27.move_wait = true
  for L6_33, L7_34 in L3_30(L4_31) do
    L1_28[L7_34] = L8_35
    L2_29[L7_34] = L8_35
    if L7_34 == "ve_lo_a" then
      for L11_38 = 1, 10 do
        L1_28.ve_lo_a[L11_38] = string.format("locator2_ve_lo_a_%02d", L11_38)
      end
    else
      for L11_38 = 1, 4 do
        L1_28[L7_34][L11_38] = string.format("locator2_%s_%02d", L7_34, L11_38)
      end
      for L11_38 = 1, 4 do
        L2_29[L7_34][L11_38] = string.format("locator2_%s_%02d", L7_34, L11_38 + 4)
      end
    end
  end
  for L6_33, L7_34 in L3_30(L4_31) do
    if L7_34 == "ve_lo_a" then
      L8_35[L6_33] = L9_36
    else
      L8_35[L6_33] = L9_36
      break
    end
  end
end
function pccubesensor2_warning_OnEnter(A0_39)
  local L1_40
end
function pccubesensor2_warning_OnLeave(A0_41)
  invokeTask(function()
    Fn_captionViewWait("ep11_03014")
  end)
end
function pccubesensor2_outrange_OnEnter(A0_42)
  local L1_43
end
function pccubesensor2_outrange_OnLeave(A0_44)
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep11_03014")
    Fn_missionView(_currentMissionText)
  end)
end
