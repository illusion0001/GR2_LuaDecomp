import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/ep80_common.lua")
_next_phase = false
_navi_street = false
_ash_cnt = 0
_guide_task = {}
_move_task = {}
_barker_task = nil
_look_task = nil
_barker_once = {}
_vendors_tbl = {
  "vendors_sk_08_01_event",
  "vendors_sk_07_01_event",
  "vendors_kw_02_01_event",
  "vendors_sk_09_01_event",
  "vendors_sk_10_01_event",
  "vendors_kw_01_01_event",
  "vendors_kw_02_02_event",
  "vendors_sk_08_03_event",
  "vendors_sk_09_02_event"
}
enmgen2_market_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a_01",
      name = "enm_a_01"
    },
    {
      type = "stalker",
      locator = "locator_a_02",
      name = "enm_a_02",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    _ash_cnt = _ash_cnt + 1
  end
}
enmgen2_market_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_a_03",
      name = "enm_a_03"
    }
  },
  onObjectAsh = function(A0_2, A1_3)
    _ash_cnt = _ash_cnt + 1
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"enm_a_03"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_market_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_b_01",
      name = "ene_b_01"
    },
    {
      type = "gellyfish",
      locator = "locator_b_02",
      name = "ene_b_02"
    }
  },
  onObjectAsh = function(A0_8, A1_9)
    _ash_cnt = _ash_cnt + 1
  end
}
enmgen2_market_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_b_03",
      name = "ene_b_03"
    }
  },
  onObjectAsh = function(A0_10, A1_11)
    _ash_cnt = _ash_cnt + 1
  end
}
function Initialize()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L0_12 = {L1_13, L2_14}
  L1_13 = "evarea2_po_a_01_chi"
  L1_13 = Fn_loadEventData
  L1_13(L2_14, L3_15, L4_16)
  L1_13 = {
    L2_14,
    L3_15,
    L4_16,
    L5_17,
    L6_18,
    {
      name = "wom20",
      type = "wom20",
      node = "locator2_wom20_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "man39",
      type = "man39",
      node = "locator2_man39_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "man62",
      type = "man62",
      node = "locator2_man62_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "wom24",
      type = "wom24",
      node = "locator2_wom24_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "wom21",
      type = "wom21",
      node = "locator2_wom21_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "man37",
      type = "man37",
      node = "locator2_man37_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "man36",
      type = "man36",
      node = "locator2_man36_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "man38",
      type = "man38",
      node = "locator2_man38_01",
      attach = false,
      use_gravity = false,
      anim_name = "vendor_attract_00"
    },
    {
      name = "vendor",
      type = "man40",
      node = "locator2_man40_01",
      attach = false,
      use_gravity = false,
      anim_name = "cook_yakitori_00",
      active = false
    }
  }
  L2_14.name = "cid01"
  L2_14.type = "cid01"
  L2_14.node = "locator2_cid01_01"
  L2_14.attach = false
  L3_15.name = "chi11"
  L3_15.type = "chi11"
  L3_15.node = "locator2_chi11_01"
  L3_15.attach = false
  L4_16.name = "chi12"
  L4_16.type = "chi12"
  L4_16.node = "locator2_chi12_01"
  L4_16.attach = false
  L5_17 = {}
  L5_17.name = "duck01"
  L5_17.type = "duck01"
  L5_17.node = "locator2_duck01_01"
  L5_17.attach = false
  L6_18 = {}
  L6_18.name = "wom26"
  L6_18.type = "wom26"
  L6_18.node = "locator2_wom26_01"
  L6_18.attach = false
  L6_18.use_gravity = false
  L6_18.anim_name = "vendor_attract_00"
  L2_14(L3_15)
  L2_14(L3_15)
  L2_14(L3_15)
  L2_14(L3_15)
  L2_14(L3_15)
  L2_14(L3_15)
  L2_14(L3_15)
  for L5_17, L6_18 in L2_14(L3_15) do
    mob_placement_enabled("po_a_01", L6_18, false)
  end
end
function Ingame()
  local L0_19, L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27
  L0_19 = GameDatabase
  L1_20 = L0_19
  L0_19 = L0_19.get
  L2_21 = ggd
  L2_21 = L2_21.EventFlags__ep80__BeginnerMode
  L0_19 = L0_19(L1_20, L2_21)
  if L0_19 == true then
    L0_19 = Fn_lockPlayerAbility
    L1_20 = Player
    L1_20 = L1_20.kAbility_Slider
    L0_19(L1_20)
  end
  L0_19 = Fn_setCatWarpCheckPoint
  L1_20 = "locator2_pc_start_pos"
  L0_19(L1_20)
  L0_19 = Fn_sendEventComSb
  L1_20 = "requestCrateSetActive"
  L2_21 = "bg2_crate_a"
  L3_22 = false
  L0_19(L1_20, L2_21, L3_22)
  L0_19 = Fn_sendEventComSb
  L1_20 = "requestCrateSetActive"
  L2_21 = "bg2_crate_b"
  L3_22 = false
  L0_19(L1_20, L2_21, L3_22)
  L0_19 = Fn_sendEventComSb
  L1_20 = "requestVogoShipSetVisible"
  L2_21 = false
  L0_19(L1_20, L2_21)
  L0_19 = Fn_findNpc
  L1_20 = "cid01"
  L0_19 = L0_19(L1_20)
  L1_20 = Fn_findNpcPuppet
  L2_21 = L0_19
  L1_20 = L1_20(L2_21)
  L2_21 = Fn_findNpc
  L3_22 = "vendor"
  L2_21 = L2_21(L3_22)
  L3_22 = Fn_findNpcPuppet
  L4_23 = L2_21
  L3_22 = L3_22(L4_23)
  L4_23 = GameDatabase
  L5_24 = L4_23
  L4_23 = L4_23.get
  L6_25 = ggd
  L6_25 = L6_25.EventFlags__sm93__TutorialFlags
  L4_23 = L4_23(L5_24, L6_25)
  if L4_23 == true then
    L5_24 = L0_19
    L4_23 = L0_19.setSightParam
    L6_25 = {}
    L6_25.valid = false
    L4_23(L5_24, L6_25)
    L4_23 = Fn_warpNpc
    L5_24 = L0_19
    L6_25 = "locator2_cid01_02"
    L4_23(L5_24, L6_25)
    L4_23 = Fn_playMotionNpc
    L5_24 = L0_19
    L6_25 = "sit_00"
    L4_23(L5_24, L6_25)
    L4_23 = Fn_resetPcPos
    L5_24 = "warppoint2_cid"
    L4_23(L5_24)
    L4_23 = Fn_setCatWarpCheckPoint
    L5_24 = "warppoint2_cid"
    L4_23(L5_24)
  else
    L4_23 = Fn_disappearNpc
    L5_24 = L0_19
    L4_23(L5_24)
  end
  L4_23 = Fn_repeatPlayMotion
  L5_24 = "chi11"
  L6_25 = "talk_00"
  L7_26 = {L8_27}
  L8_27 = "talk_01"
  L8_27 = 5
  L4_23 = L4_23(L5_24, L6_25, L7_26, L8_27, 10)
  L5_24 = Fn_repeatPlayMotion
  L6_25 = "chi12"
  L7_26 = "talk_laugh_00"
  L8_27 = {"talk_00", "talk_01"}
  L5_24 = L5_24(L6_25, L7_26, L8_27)
  L6_25 = Fn_missionStart
  L6_25()
  L6_25 = Fn_userCtrlOn
  L6_25()
  L6_25 = invokeTask
  function L7_26()
    waitSeconds(2)
    if L4_23 ~= nil and L4_23:isRunning() == true then
      L4_23:abort()
    end
    L4_23 = nil
    if L5_24 ~= nil and L5_24:isRunning() == true then
      L5_24:abort()
    end
    L5_24 = nil
    opening_child_guide()
  end
  L6_25(L7_26)
  L6_25 = GameDatabase
  L7_26 = L6_25
  L6_25 = L6_25.get
  L8_27 = ggd
  L8_27 = L8_27.EventFlags__sm93__TutorialFlags
  L6_25 = L6_25(L7_26, L8_27)
  if L6_25 == false then
    L6_25 = Fn_captionViewWait
    L7_26 = "ep80_00057"
    L8_27 = 4
    L6_25(L7_26, L8_27, 3)
  else
    L6_25 = Fn_kaiwaDemoView
    L7_26 = "ep80_00025k"
    L6_25(L7_26)
  end
  L6_25 = Fn_pcSensorOn
  L7_26 = "pccubesensor2_street"
  L6_25(L7_26)
  L6_25 = Fn_pcSensorOn
  L7_26 = "pccubesensor2_market"
  L6_25(L7_26)
  L6_25 = Fn_pcSensorOn
  L7_26 = "pccubesensor2_bridge"
  L6_25(L7_26)
  L6_25 = Fn_userCtrlOn
  L6_25()
  L6_25 = Fn_naviSet
  L7_26 = findGameObject2
  L8_27 = "Node"
  L8_27 = L7_26(L8_27, "locator2_street")
  L6_25(L7_26, L8_27, L7_26(L8_27, "locator2_street"))
  while true do
    L6_25 = _next_phase
    if L6_25 == false then
      L6_25 = _navi_street
      if L6_25 == true then
        L6_25 = Fn_naviSet
        L7_26 = findGameObject2
        L8_27 = "Node"
        L8_27 = L7_26(L8_27, "locator2_market")
        L6_25(L7_26, L8_27, L7_26(L8_27, "locator2_market"))
        L6_25 = Fn_pcSensorOff
        L7_26 = "pccubesensor2_street"
        L6_25(L7_26)
        _navi_street = false
      end
      L6_25 = wait
      L6_25()
    end
  end
  L6_25 = Fn_naviKill
  L6_25()
  L6_25 = Fn_captionViewEnd
  L6_25()
  L6_25 = GameDatabase
  L7_26 = L6_25
  L6_25 = L6_25.get
  L8_27 = ggd
  L8_27 = L8_27.EventFlags__ep80__BeginnerMode
  L6_25 = L6_25(L7_26, L8_27)
  if L6_25 == true then
    L6_25 = Fn_setNpcActive
    L7_26 = L2_21
    L8_27 = true
    L6_25(L7_26, L8_27)
    L6_25 = mob_placement_enabled
    L7_26 = "po_a_01"
    L8_27 = "vendors_sk_09_03_event"
    L6_25(L7_26, L8_27, false)
    L6_25 = invokeTask
    function L7_26()
      Fn_playMotionNpc(L2_21, "scared_in_00", true)
      Fn_playMotionNpc(L2_21, "scared_00", false)
    end
    L6_25(L7_26)
  end
  L6_25 = Fn_setBgmPoint
  L7_26 = "event"
  L8_27 = "ep80_b_battle_start"
  L6_25(L7_26, L8_27)
  L6_25 = Fn_setCatWarpCheckPoint
  L7_26 = "locator2_battle_navi"
  L6_25(L7_26)
  L6_25 = Fn_pcSensorOn
  L7_26 = "pccubesensor2_battle_navi_out"
  L6_25(L7_26)
  L6_25 = Fn_pcSensorOn
  L7_26 = "pccubesensor2_battle_outrange"
  L6_25(L7_26)
  L6_25 = Fn_setCatWarpCheckPoint
  L7_26 = "locator2_market"
  L6_25(L7_26)
  L6_25 = Mob
  L7_26 = L6_25
  L6_25 = L6_25.makeSituationPanic
  L8_27 = true
  L6_25(L7_26, L8_27)
  L6_25 = invokeTask
  function L7_26()
    local L0_28, L1_29
    L0_28 = {
      L1_29,
      {
        "m02_936",
        "m03_936",
        "m04_936"
      },
      {
        "m05_936",
        "m06_936",
        "m07_936"
      },
      {"w01_936"},
      {
        "w02_936",
        "w03_936",
        "w04_936"
      },
      {
        "w05_936",
        "w06_936",
        "w07_936",
        "w08_936"
      }
    }
    L1_29 = {"m01_936"}
    L1_29 = RandI
    L1_29 = L1_29(2, 4)
    for _FORV_5_ = 1, L1_29 do
      Sound:playSE(L0_28[RandI(1, #L0_28)][RandI(1, #L0_28[RandI(1, #L0_28)])], RandF(0.3, 0.8), "", nil)
      waitSeconds(RandF(0.5, 1.5))
    end
  end
  L6_25(L7_26)
  L6_25 = findGameObject2
  L7_26 = "EnemyGenerator"
  L8_27 = "enmgen2_market_a_01"
  L6_25 = L6_25(L7_26, L8_27)
  L8_27 = L6_25
  L7_26 = L6_25.requestSpawn
  L7_26(L8_27)
  while true do
    L8_27 = L6_25
    L7_26 = L6_25.isSpawnOnStartFinished
    L7_26 = L7_26(L8_27)
    if L7_26 == false then
      L7_26 = wait
      L7_26()
    end
  end
  L8_27 = L6_25
  L7_26 = L6_25.getEnemyCount
  L7_26 = L7_26(L8_27)
  L8_27 = {}
  for _FORV_12_, _FORV_13_ in pairs(enmgen2_market_a_01.spawnSet) do
    L8_27[_FORV_12_] = findGameObject2("Puppet", _FORV_13_.name)
  end
  choice_look_idx(L8_27, 8)
  invokeTask(function()
    waitSeconds(1)
    Fn_captionView("ep80_00044")
    waitSeconds(1.3)
    Fn_missionView("ep80_00024")
    waitSeconds(2.5)
    Fn_tutorialCaption("kick")
  end)
  while _ash_cnt == 0 do
    wait()
  end
  findGameObject2("EnemyGenerator", "enmgen2_market_a_02"):requestSpawn()
  while findGameObject2("EnemyGenerator", "enmgen2_market_a_02"):isSpawnOnStartFinished() == false do
    wait()
  end
  L7_26 = L7_26 + findGameObject2("EnemyGenerator", "enmgen2_market_a_02"):getEnemyCount()
  while L7_26 > _ash_cnt and (not (L6_25:getEnemyCount() <= 0) or not (0 >= findGameObject2("EnemyGenerator", "enmgen2_market_a_02"):getEnemyCount())) do
    wait()
  end
  _ash_cnt = 0
  Fn_tutorialCaptionKill()
  L6_25 = Fn_setCatWarpCheckPoint
  L7_26 = "locator2_battle_navi"
  L6_25(L7_26)
  L6_25 = findGameObject2
  L7_26 = "EnemyGenerator"
  L8_27 = "enmgen2_market_b_01"
  L6_25 = L6_25(L7_26, L8_27)
  L8_27 = L6_25
  L7_26 = L6_25.requestSpawn
  L7_26(L8_27)
  while true do
    L8_27 = L6_25
    L7_26 = L6_25.isSpawnOnStartFinished
    L7_26 = L7_26(L8_27)
    if L7_26 == false then
      L7_26 = wait
      L7_26()
    end
  end
  L8_27 = L6_25
  L7_26 = L6_25.getEnemyCount
  L7_26 = L7_26(L8_27)
  L8_27 = {}
  for _FORV_12_, _FORV_13_ in pairs(enmgen2_market_b_01.spawnSet) do
    L8_27[_FORV_12_] = findGameObject2("Puppet", _FORV_13_.name)
  end
  invokeTask(function()
    choice_look_idx(L8_27, 8)
  end)
  waitSeconds(2)
  Fn_captionViewWait("ep80_00045", 2)
  waitSeconds(0.5)
  HUD:info("ep80_info_01", false)
  Fn_unLockPlayerAbility({
    Player.kAbility_Grab,
    Player.kAbility_Throw
  })
  waitSeconds(1)
  Fn_tutorialCaption("throw")
  while _ash_cnt == 0 do
    wait()
  end
  findGameObject2("EnemyGenerator", "enmgen2_market_b_02"):requestSpawn()
  while findGameObject2("EnemyGenerator", "enmgen2_market_b_02"):isSpawnOnStartFinished() == false do
    wait()
  end
  L7_26 = L7_26 + findGameObject2("EnemyGenerator", "enmgen2_market_b_02"):getEnemyCount()
  while L7_26 > _ash_cnt and (not (L6_25:getEnemyCount() <= 0) or not (0 >= findGameObject2("EnemyGenerator", "enmgen2_market_b_02"):getEnemyCount())) do
    wait()
  end
  Fn_tutorialCaptionKill()
  do break end
  L6_25 = Fn_pcSensorOff
  L7_26 = "pccubesensor2_battle_navi_in"
  L6_25(L7_26)
  L6_25 = Fn_pcSensorOff
  L7_26 = "pccubesensor2_battle_navi_out"
  L6_25(L7_26)
  L6_25 = Fn_pcSensorOff
  L7_26 = "pccubesensor2_battle_outrange"
  L6_25(L7_26)
  L6_25 = Fn_setBgmPoint
  L7_26 = "event"
  L8_27 = "1stbattle_end"
  L6_25(L7_26, L8_27)
  L6_25 = GameDatabase
  L7_26 = L6_25
  L6_25 = L6_25.get
  L8_27 = ggd
  L8_27 = L8_27.EventFlags__ep80__BeginnerMode
  L6_25 = L6_25(L7_26, L8_27)
  if L6_25 == true then
    L6_25 = Fn_playMotionNpc
    L7_26 = L2_21
    L8_27 = "scared_out_00"
    L6_25(L7_26, L8_27, false)
    L6_25 = waitSeconds
    L7_26 = 3
    L6_25(L7_26)
    L6_25 = Fn_blackout
    L7_26 = 1
    L6_25(L7_26)
  else
    L6_25 = Fn_setKeepPlayerPos
    L6_25()
  end
  L6_25 = Fn_setNextMissionFlag
  L6_25()
  L6_25 = Fn_nextMission
  L6_25()
  L6_25 = Fn_exitSandbox
  L6_25()
end
function Finalize()
  local L0_30, L1_31, L2_32, L3_33, L4_34
  L0_30()
  for L3_33, L4_34 in L0_30(L1_31) do
    if L4_34 ~= nil and L4_34:isRunning() == true then
      L4_34:abort()
    end
  end
  _move_task = L0_30
  for L3_33, L4_34 in L0_30(L1_31) do
    if L4_34 ~= nil and L4_34:isRunning() == true then
      L4_34:abort()
    end
  end
  _guide_task = L0_30
  for L3_33, L4_34 in L0_30(L1_31) do
    mob_placement_enabled("po_a_01", L4_34, true)
  end
  L0_30(L1_31, L2_32)
end
function pccubesensor2_street_OnEnter(A0_35)
  _navi_street = true
  A0_35:setActive(false)
end
function pccubesensor2_battle_navi_OnEnter(A0_36)
  Fn_naviKill()
  A0_36:setActive(false)
end
function pccubesensor2_battle_navi_OnEnter(A0_37)
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_battle_navi_out")
  A0_37:setActive(false)
end
function pccubesensor2_battle_navi_OnLeave(A0_38)
  invokeTask(function()
    Fn_captionView("ep80_00105")
    waitSeconds(2)
    Fn_naviSet(findGameObject2("Node", "locator2_battle_navi"))
  end)
  Fn_pcSensorOn("pccubesensor2_battle_navi_in")
  A0_38:setActive(false)
end
function pccubesensor2_bridge_OnEnter(A0_39)
  Fn_setBgmPoint("event", "ep80_b_bgm_off")
  A0_39:setActive(false)
end
function pccubesensor2_barker_wom26_OnEnter(A0_40)
  shop_barker(A0_40, "wom26", "ep80_01001", "ep80_01010", "w01_902", "kit022b")
end
function pccubesensor2_barker_wom20_OnEnter(A0_41)
  shop_barker(A0_41, "wom20", "ep80_01002", "ep80_01011", "w03_902", "kit040a")
end
function pccubesensor2_barker_man39_OnEnter(A0_42)
  shop_barker(A0_42, "man39", "ep80_01003", "ep80_01012", "m02_902", "kit020b")
end
function pccubesensor2_barker_man62_OnEnter(A0_43)
  shop_barker(A0_43, "man62", "ep80_01004", "ep80_01013", "m03_902", "kit032b")
end
function pccubesensor2_barker_wom24_OnEnter(A0_44)
  shop_barker(A0_44, "wom24", "ep80_01005", "ep80_01014", "w05_902", "kit022c")
end
function pccubesensor2_barker_wom21_OnEnter(A0_45)
  shop_barker(A0_45, "wom21", "ep80_01006", "ep80_01015", "w02_902", "kit042a")
end
function pccubesensor2_barker_man37_OnEnter(A0_46)
  shop_barker(A0_46, "man37", "ep80_01007", "ep80_01016", "m01_902", "kit033c")
end
function pccubesensor2_barker_man36_OnEnter(A0_47)
  shop_barker(A0_47, "man36", "ep80_01008", "ep80_01017", "m05_902", "kit033a")
end
function pccubesensor2_barker_man38_OnEnter(A0_48)
  shop_barker(A0_48, "man38", "ep80_01009", "ep80_01018", "m06_902", "kit038b")
end
function pccubesensor2_barker_OnLeave(A0_49)
  if _barker_task ~= nil and _barker_task:isRunning() == true then
    _barker_task:abort()
  end
  _barker_task = nil
  if _look_task ~= nil and _look_task:isRunning() == true then
    _look_task:abort()
  end
  _look_task = nil
  Fn_playerTurnEnd()
  if _barker_once[A0_49:getName()] == true then
    A0_49:setActive(false)
  end
end
function shop_barker(A0_50, A1_51, A2_52, A3_53, A4_54, A5_55)
  if _barker_task == nil then
    _barker_task = invokeTask(function()
      local L0_56, L1_57
      L0_56 = findGameObject2
      L1_57 = "Node"
      L0_56 = L0_56(L1_57, "locator2_barker_" .. A1_51)
      L1_57 = Fn_findNpcPuppet
      L1_57 = L1_57(A1_51)
      while Fn_isInSightTarget(L0_56, 0.7) == false do
        wait()
      end
      Sound:playSE(A4_54, 0.5, "", L1_57)
      Fn_captionView(A2_52)
      if Player:getAction() == Player.kAction_Idle then
      else
      end
      while not (0 > 30) do
        wait()
      end
      _look_task = Fn_lookAtObject(L0_56)
      Fn_playerTurn(L1_57)
      while true do
        if Fn_isInSightTarget(L0_56, 0.3) == true and Fn_isCaptionView() == false then
          Sound:playSE(A5_55, 0.8, "", Fn_getPlayer())
          Fn_captionView(A3_53)
          _barker_once[A0_50:getName()] = true
          break
        end
        if 0 < Pad:getStick(Pad.kStick_Camera) or 0 < Pad:getStick(Pad.kStick_Camera) then
          if not (0 + 1 > 10) then
            else
            end
            wait()
          end
      end
      if _look_task ~= nil and _look_task:isRunning() == true then
        _look_task:abort()
      end
      _look_task = nil
      Fn_playerTurnEnd()
    end)
  end
end
function opening_child_guide()
  local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63, L6_64, L7_65, L8_66
  L0_58 = Fn_findNpc
  L1_59 = "chi11"
  L0_58 = L0_58(L1_59)
  L1_59 = Fn_findNpcPuppet
  L2_60 = L0_58
  L1_59 = L1_59(L2_60)
  L2_60 = Fn_findNpc
  L3_61 = "chi12"
  L2_60 = L2_60(L3_61)
  L3_61 = Fn_findNpcPuppet
  L4_62 = L2_60
  L3_61 = L3_61(L4_62)
  L4_62 = Fn_findNpc
  L5_63 = "duck01"
  L4_62 = L4_62(L5_63)
  L5_63 = Fn_findNpcPuppet
  L6_64 = L4_62
  L5_63 = L5_63(L6_64)
  L6_64 = createGameObject2
  L7_65 = "Node"
  L6_64 = L6_64(L7_65)
  L7_65 = Fn_findAreaHandle
  L8_66 = "po_a_01"
  L7_65 = L7_65(L8_66)
  L8_66 = L7_65
  L7_65 = L7_65.appendChild
  L7_65(L8_66, L6_64)
  L8_66 = L6_64
  L7_65 = L6_64.try_init
  L7_65(L8_66)
  L8_66 = L6_64
  L7_65 = L6_64.waitForReady
  L7_65(L8_66)
  L8_66 = L6_64
  L7_65 = L6_64.try_start
  L7_65(L8_66)
  L7_65 = findGameObject2
  L8_66 = "Node"
  L7_65 = L7_65(L8_66, "locator2_turn_target")
  L8_66 = false
  _guide_task.chi11_move = invokeTask(function()
    local L0_67, L1_68, L2_69, L3_70, L4_71
    L0_67 = Fn_playMotionNpc
    L1_68 = L0_58
    L2_69 = "reply_yes"
    L3_70 = true
    L0_67(L1_68, L2_69, L3_70)
    L0_67 = {}
    L0_67.arrivedLength = 0
    L0_67.runLength = 3
    L0_67.anim_walk = "walk1"
    L0_67.anim_walk_b = "anim_walk_b1"
    L0_67.anim_run = "run1"
    L1_68 = _move_task
    L2_69 = Fn_moveNpc
    L3_70 = "chi11"
    L4_71 = {
      "locator2_chi11_move_01",
      "locator2_chi11_move_02",
      "locator2_chi11_move_03"
    }
    L2_69 = L2_69(L3_70, L4_71, L0_67)
    L1_68.chi11 = L2_69
    L1_68 = waitSeconds
    L2_69 = 1
    L1_68(L2_69)
    L1_68 = L0_58
    L2_69 = L1_68
    L1_68 = L1_68.pauseMove
    L3_70 = true
    L1_68(L2_69, L3_70)
    L1_68 = Sound
    L2_69 = L1_68
    L1_68 = L1_68.playSE
    L3_70 = "mmd002b"
    L4_71 = 0.7
    L1_68(L2_69, L3_70, L4_71, "", L1_59)
    L1_68 = true
    L8_66 = L1_68
    L1_68 = Fn_playMotionNpc
    L2_69 = L0_58
    L3_70 = "beckon"
    L4_71 = true
    L1_68(L2_69, L3_70, L4_71)
    L1_68 = L0_58
    L2_69 = L1_68
    L1_68 = L1_68.pauseMove
    L3_70 = false
    L1_68(L2_69, L3_70)
    L1_68 = L0_58
    L2_69 = L1_68
    L1_68 = L1_68.setStagger
    L3_70 = true
    L1_68(L2_69, L3_70)
    L1_68 = RandI
    L2_69 = 2
    L3_70 = 4
    L1_68 = L1_68(L2_69, L3_70)
    while true do
      L2_69 = _move_task
      L2_69 = L2_69.chi11
      L3_70 = L2_69
      L2_69 = L2_69.isRunning
      L2_69 = L2_69(L3_70)
      if L2_69 then
        if L1_68 <= 0 then
          L2_69 = L1_59
          L3_70 = L2_69
          L2_69 = L2_69.getWorldPos
          L2_69 = L2_69(L3_70)
          L3_70 = Fn_get_distance
          L4_71 = L7_65
          L4_71 = L4_71.getWorldPos
          L4_71 = L4_71(L4_71)
          L3_70 = L3_70(L4_71, L2_69)
          L4_71 = L3_61
          L4_71 = L4_71.getWorldPos
          L4_71 = L4_71(L4_71)
          if L3_70 < Fn_get_distance(L7_65:getWorldPos(), L4_71) and Fn_get_distance(L2_69, L4_71) > 5 and 5 < Fn_get_distance(findGameObject2("Node", "locator2_chi11_move_01"):getWorldPos(), L2_69) and L3_70 > 10 then
            L0_58:setStagger(false)
            L0_58:pauseMove(true)
            Sound:playSE("m08_910", 0.7, "", L1_59)
            Fn_playMotionNpc(L0_58, "beckon", true)
            L0_58:pauseMove(false)
            L0_58:setStagger(true)
            L1_68 = RandI(2, 4)
          end
        end
        L1_68 = L1_68 - 0.1
        L2_69 = waitSeconds
        L3_70 = 0.1
        L2_69(L3_70)
      end
    end
    L2_69 = L0_58
    L3_70 = L2_69
    L2_69 = L2_69.setStagger
    L4_71 = false
    L2_69(L3_70, L4_71)
    L2_69 = Fn_turnNpc
    L3_70 = L0_58
    L4_71 = L7_65
    L2_69(L3_70, L4_71)
    L2_69 = Fn_playMotionNpc
    L3_70 = L0_58
    L4_71 = "stay"
    L2_69(L3_70, L4_71, false)
  end)
  _guide_task.chi12_move = invokeTask(function()
    local L0_72, L1_73
    while true do
      L0_72 = L8_66
      if L0_72 == false then
        L0_72 = wait
        L0_72()
      end
    end
    L0_72 = Fn_turnNpc
    L1_73 = L2_60
    L0_72(L1_73, L1_59)
    L0_72 = Fn_playMotionNpc
    L1_73 = L2_60
    L0_72(L1_73, "reply_yes", true)
    L0_72 = {}
    L0_72.arrivedLength = 0
    L0_72.runLength = 5
    L0_72.anim_walk = "walk1"
    L0_72.anim_walk_b = "anim_walk_b1"
    L0_72.anim_run = "run"
    L1_73 = _move_task
    L1_73.chi12 = Fn_moveNpc("chi12", {
      "locator2_chi12_move_01",
      "locator2_chi12_move_02",
      "locator2_chi12_move_03",
      "locator2_chi12_move_04"
    }, L0_72)
    L1_73 = L0_58
    L1_73 = L1_73.setStagger
    L1_73(L1_73, true)
    L1_73 = RandF
    L1_73 = L1_73(1.5, 3)
    while _move_task.chi12:isRunning() do
      if L1_73 <= 0 then
        Sound:playSE("w09_910", 0.7, "", L3_61)
        L1_73 = RandF(1.5, 3)
      end
      L1_73 = L1_73 - 0.1
      waitSeconds(0.1)
    end
    L0_58:setStagger(false)
    Fn_turnNpc(L2_60, L7_65)
    Fn_playMotionNpc(L2_60, "stay", false)
  end)
  _guide_task.duck01_move = invokeTask(function()
    local L0_74
    L0_74 = waitSeconds
    L0_74(2)
    L0_74 = {}
    L0_74.arrivedLength = 0.2
    L0_74.runLength = -1
    while _guide_task.chi11_move:isRunning() do
      L6_64:setWorldPos(L1_59:getWorldPos())
      _move_task.duck01 = Fn_moveNpc("duck01", {L6_64}, L0_74)
      while _move_task.duck01:isRunning() do
        wait()
      end
      wait()
    end
    _move_task.duck01 = Fn_moveNpc("duck01", {
      "locator2_duck01_move_01",
      "locator2_duck01_move_02"
    }, L0_74)
    while _move_task.duck01:isRunning() do
      wait()
    end
  end)
  wait()
  _guide_task.duck01_voice = invokeTask(function()
    local L0_75
    L0_75 = RandF
    L0_75 = L0_75(2, 4)
    while _guide_task.duck01_move:isRunning() do
      if L0_75 <= 0 then
        Sound:playSE("duck_quack", 0.5, "", L5_63)
        L0_75 = RandF(2, 4)
      end
      L0_75 = L0_75 - 0.1
      waitSeconds(0.1)
    end
  end)
  _guide_task.chi11_motion = Fn_playLoopMotionInsert("chi11", "stay", {"stay_02"}, 5, 10)
  _guide_task.chi12_motion = Fn_playLoopMotionInsert("chi12", "stay", {"stay_02"}, 5, 10)
  _guide_task.duck01_motion = Fn_playLoopMotionInsert("duck01", "stay", {"stay_01", "quack_00"}, 5, 10)
end
