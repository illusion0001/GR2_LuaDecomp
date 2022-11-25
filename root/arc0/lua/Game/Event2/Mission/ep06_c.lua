dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
import("Vehicle")
_global = {
  puppet_tbl = {},
  enemy_cnt = 4,
  monologue = false,
  energy_box = nil
}
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_01_01",
      name = "enemy01",
      ai_spawn_option = "Soldier/ep06_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_02",
      name = "enemy02",
      ai_spawn_option = "Soldier/ep06_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_03",
      name = "enemy03",
      ai_spawn_option = "Soldier/ep06_soldier"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_04",
      name = "enemy04",
      ai_spawn_option = "Soldier/ep06_soldier"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectAsh = function(A0_6, A1_7)
    local L3_8
    L3_8 = _global
    L3_8.enemy_cnt = _global.enemy_cnt - 1
  end,
  onObjectDead = function(A0_9, A1_10)
  end
}
function Initialize()
  local L0_11
  L0_11 = Fn_userCtrlOff
  L0_11()
  L0_11 = {
    {
      name = "ep06_officer_01",
      type = "officer",
      node = "locator2_officer_01",
      reset = false
    },
    {
      name = "ep06_sol_01",
      type = "soldier",
      node = "locator2_sol_01",
      reset = false
    },
    {
      name = "ep06_sol_02",
      type = "soldier",
      node = "locator2_sol_02",
      reset = false
    },
    {
      name = "ep06_sol_03",
      type = "soldier",
      node = "locator2_sol_03",
      reset = false
    }
  }
  Fn_setupNpc(L0_11)
  for _FORV_4_, _FORV_5_ in pairs(L0_11) do
    _global.puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _global.puppet_tbl.ep06_madam_01 = Fn_findNpcPuppet("ep06_madam_01")
  _sdemo_cut01 = SDemo.create("ep06_c_cut01")
  if Fn_sendEventComSb("get06bFlag") == 0 then
    _global.energy_box = Fn_createGimmickBg("locator2_carry_box_pos_01", "energy_box", "box_ms_02", false)
  end
  Fn_naviKill()
end
function Ingame()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25
  L0_12 = Fn_warpNpc
  L1_13 = "ep06_madam_01"
  L2_14 = "locator2_madam_02"
  L0_12(L1_13, L2_14)
  L0_12 = Fn_sendEventComSb
  L1_13 = "requestObjActive"
  L2_14 = "bg2_ship_02"
  L3_15 = true
  L0_12(L1_13, L2_14, L3_15)
  L0_12 = Fn_loadPlayerMotion
  L1_13 = {L2_14}
  L2_14 = "kit01_lookaround_00"
  L0_12(L1_13)
  L0_12 = Fn_setNpcActive
  L1_13 = "ep06_madam_01"
  L2_14 = true
  L0_12(L1_13, L2_14)
  L0_12 = Fn_setCatWarpCheckPoint
  L1_13 = "locator2_pc_catwarp_point_01"
  L0_12(L1_13)
  L0_12 = Fn_disappearNpc
  L1_13 = "ep06_cid_01"
  L0_12(L1_13)
  L0_12 = Fn_disappearNpc
  L1_13 = "ep06_ve_02"
  L0_12(L1_13)
  L0_12 = Fn_userCtrlOff
  L0_12()
  L0_12 = Fn_setCatWarp
  L1_13 = false
  L0_12(L1_13)
  L0_12 = anoterCatWarp
  L0_12()
  L0_12 = {}
  L1_13 = start_game_obj
  L1_13()
  L1_13 = {}
  L2_14 = Fn_repeatPlayMotion
  L3_15 = "ep06_madam_01"
  L4_16 = "talk_01"
  L5_17 = {L6_18}
  L6_18 = "talk_01"
  L2_14 = L2_14(L3_15, L4_16, L5_17)
  L1_13[1] = L2_14
  L2_14 = Fn_repeatPlayMotion
  L3_15 = "ep06_officer_01"
  L4_16 = "stay"
  L5_17 = {L6_18}
  L6_18 = "stay"
  L2_14 = L2_14(L3_15, L4_16, L5_17)
  L1_13[2] = L2_14
  L2_14 = Fn_playMotionNpc
  L3_15 = "ep06_sol_01"
  L4_16 = "stay"
  L5_17 = false
  L2_14(L3_15, L4_16, L5_17)
  L2_14 = Fn_repeatPlayMotion
  L3_15 = "ep06_sol_02"
  L4_16 = "stay"
  L5_17 = {L6_18}
  L6_18 = "stay"
  L2_14 = L2_14(L3_15, L4_16, L5_17)
  L1_13[3] = L2_14
  L2_14 = Fn_repeatPlayMotion
  L3_15 = "ep06_sol_03"
  L4_16 = "stay"
  L5_17 = {L6_18}
  L6_18 = "stay"
  L2_14 = L2_14(L3_15, L4_16, L5_17)
  L1_13[4] = L2_14
  L2_14 = 4
  L3_15 = Fn_userCtrlOff
  L3_15()
  L3_15 = Camera
  L4_16 = L3_15
  L3_15 = L3_15.setControl
  L5_17 = Camera
  L5_17 = L5_17.kPlayer
  L6_18 = Camera
  L6_18 = L6_18.kControl_All
  L3_15(L4_16, L5_17, L6_18, L7_19)
  L3_15 = Fn_loadNpcEventMotion
  L4_16 = "ep06_madam_01"
  L5_17 = {}
  L5_17.run_af = "wom01_run_afraid_00"
  L3_15(L4_16, L5_17)
  L3_15 = Fn_playPlayerMotion
  L4_16 = "kit01_lookaround_00"
  L3_15(L4_16)
  L3_15 = Fn_missionStart
  L3_15()
  L3_15 = waitSeconds
  L4_16 = 0.5
  L3_15(L4_16)
  L3_15 = Fn_captionViewWait
  L4_16 = "ep06_01006"
  L3_15(L4_16)
  L3_15 = Sound
  L4_16 = L3_15
  L3_15 = L3_15.playSEHandle
  L5_17 = "w04_916b"
  L6_18 = 1
  L3_15 = L3_15(L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L8_20(L9_21))
  L4_16 = Sound
  L5_17 = L4_16
  L4_16 = L4_16.setAudibleRange
  L6_18 = L3_15
  L4_16(L5_17, L6_18, L7_19)
  L4_16 = Fn_playPlayerMotion
  L5_17 = "stay"
  L4_16(L5_17)
  L4_16 = waitSeconds
  L5_17 = 0.3
  L4_16(L5_17)
  L4_16 = Fn_captionView
  L5_17 = "ep06_01007"
  L4_16(L5_17)
  L4_16 = waitSeconds
  L5_17 = 0.6
  L4_16(L5_17)
  L4_16 = Player
  L5_17 = L4_16
  L4_16 = L4_16.setLookAtIk
  L6_18 = true
  L4_16(L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L8_20(L9_21))
  L4_16 = waitSeconds
  L5_17 = 1
  L4_16(L5_17)
  L4_16 = Sound
  L5_17 = L4_16
  L4_16 = L4_16.stopSEHandle
  L6_18 = L3_15
  L4_16(L5_17, L6_18)
  L4_16 = _sdemo_cut01
  L5_17 = L4_16
  L4_16 = L4_16.set
  L6_18 = "locator2_camera_01"
  L4_16(L5_17, L6_18, L7_19, L8_20)
  L4_16 = _sdemo_cut01
  L5_17 = L4_16
  L4_16 = L4_16.play
  L4_16(L5_17)
  L4_16 = Fn_getPlayer
  L4_16 = L4_16()
  L6_18 = L4_16
  L5_17 = L4_16.setCollidable
  L5_17(L6_18, L7_19)
  L6_18 = L4_16
  L5_17 = L4_16.setVisible
  L5_17(L6_18, L7_19)
  L5_17 = Fn_setCatActive
  L6_18 = false
  L5_17(L6_18)
  L5_17 = waitSeconds
  L6_18 = 1.2
  L5_17(L6_18)
  L5_17 = Fn_resetPcPos
  L6_18 = "locator2_resetpos_01"
  L5_17(L6_18)
  L5_17 = Player
  L6_18 = L5_17
  L5_17 = L5_17.setLookAtIk
  L5_17(L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L9_21(L10_22))
  while true do
    L5_17 = _sdemo_cut01
    L6_18 = L5_17
    L5_17 = L5_17.isPlay
    L5_17 = L5_17(L6_18)
    if L5_17 then
      L5_17 = wait
      L5_17()
    end
  end
  L5_17 = {L6_18}
  L6_18 = {}
  L6_18.pos = "locator2_camera_01"
  L6_18.time = L2_14
  L6_18 = {L7_19}
  L7_19.pos = "locator2_aim_02"
  L7_19.time = L2_14
  L7_19(L8_20, L9_21, L10_22)
  while true do
    if L7_19 then
      L7_19()
    end
  end
  if L7_19 == true then
    L7_19(L8_20)
  else
    L7_19(L8_20)
  end
  L7_19(L8_20)
  L7_19(L8_20, L9_21, L10_22, L11_23)
  L7_19(L8_20, L9_21)
  for L10_22 = 1, 4 do
    L1_13[L10_22] = L11_23
  end
  L7_19()
  L7_19(L8_20, L9_21)
  L7_19(L8_20, L9_21)
  L4_16 = nil
  L7_19(L8_20)
  ;({
    L8_20,
    L9_21,
    L10_22,
    [7] = L11_23(L12_24)
  })[4] = L11_23
  ;({
    L8_20,
    L9_21,
    L10_22,
    [7] = L11_23(L12_24)
  })[5] = L12_24
  ;({
    L8_20,
    L9_21,
    L10_22,
    [7] = L11_23(L12_24)
  })[6] = L13_25
  for L12_24, L13_25 in L9_21(L10_22) do
    L13_25:setEventListener("npcDamaged", nil)
    L13_25:setIgnoreGrab(false)
    L13_25:setIgnoreGrabThrow(false)
    L13_25:setEnemyGenerator(L8_20)
    L13_25:changeEnemy()
  end
  L9_21(L10_22, L11_23)
  L9_21(L10_22, L11_23)
  L9_21()
  L9_21(L10_22, L11_23)
  L9_21(L10_22, L11_23)
  L9_21(L10_22)
  L9_21()
  L9_21()
  L9_21(L10_22, L11_23, L12_24)
  L9_21(L10_22)
  L9_21(L10_22)
  L9_21(L10_22, L11_23, L12_24, L13_25, L10_22(L11_23, L12_24))
  L9_21()
  while true do
    if L10_22 == false then
      L10_22()
    end
  end
  for _FORV_14_, _FORV_15_ in L11_23(L12_24) do
    if _FORV_15_ then
      _FORV_15_:kill()
    end
  end
  L13_25()
  Fn_kaiwaDemoView2("ep06_00180k", L13_25)
  Fn_setNpcActive("ep06_madam_01", true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_26, L1_27
end
function pccubesensor2_up_01_OnEnter()
  if _global.monologue then
    setEnemyMarker(true)
  end
end
function pccubesensor2_up_01_OnLeave()
  _global.monologue = true
  setEnemyMarker(false)
end
function pccubesensor2_ryz_01_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_ryz_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_warp_warning_07_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep06_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_07_OnLeave()
  runCatWarp()
end
function setEnemyMarker(A0_28)
  local L1_29
  L1_29 = {
    Fn_findNpc("ep06_sol_01"),
    Fn_findNpc("ep06_sol_02"),
    Fn_findNpc("ep06_sol_03"),
    Fn_findNpc("ep06_officer_01")
  }
  for _FORV_5_, _FORV_6_ in ipairs(L1_29) do
    if _FORV_6_ ~= nil and _FORV_6_:getPuppet() ~= nil and _FORV_6_:getPuppet():getBrain() ~= nil then
      _FORV_6_:getPuppet():getBrain():setVisibleEnemyMarker(A0_28)
    end
  end
end
