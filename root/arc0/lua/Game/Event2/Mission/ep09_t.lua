dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Misc/fatal_marker.lua")
enmgen_01 = nil
enmgen_02 = nil
enmgen_03 = nil
_puppet_crow = nil
_brain_crow = nil
gem_vital = {}
gem_energy = {}
ammonite = {}
ammonite_num = 0
enmgen2_nevi_01 = {
  spawnOnStart = true,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator2_nevi_01_01",
      name = "enemy_01"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_02",
      name = "enemy_02"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_03",
      name = "enemy_03"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_04",
      name = "enemy_04"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_05",
      name = "enemy_05"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_01_06",
      name = "enemy_06"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {
      "enemy_01",
      "enemy_02",
      "enemy_03",
      "enemy_04",
      "enemy_05",
      "enemy_06"
    }, 2, 5)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
enmgen2_nevi_02 = {
  spawnOnStart = true,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_02_01",
      name = "enemy_07"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_02",
      name = "enemy_08"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_02_03",
      name = "enemy_09"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_02_04",
      name = "enemy_10"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_05",
      name = "enemy_11"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_06",
      name = "enemy_12"
    }
  },
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {
      "enemy_07",
      "enemy_08",
      "enemy_09",
      "enemy_10",
      "enemy_11",
      "enemy_12"
    }, 2, 5)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_nevi_03 = {
  spawnOnStart = true,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator2_nevi_03_01",
      name = "enemy_13"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_03_02",
      name = "enemy_14"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_03_03",
      name = "enemy_15"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_03_04",
      name = "enemy_16"
    }
  },
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "enemy_13",
      "enemy_14",
      "enemy_15",
      "enemy_16"
    }, 2, 5)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
function Initialize()
  local L0_12, L1_13, L2_14, L3_15
  L0_12()
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L0_12(L1_13)
  L3_15 = true
  L0_12(L1_13, L2_14, L3_15)
  _sdemo_cut01 = L0_12
  enmgen_01 = L0_12
  enmgen_02 = L0_12
  enmgen_03 = L0_12
  for L3_15 = 1, 3 do
    gem_vital[L3_15] = findGameObject2("Gem", string.format("gem2_vital_ep09_t_%02d", L3_15))
    gem_energy[L3_15] = findGameObject2("Gem", string.format("gem2_energy_ep09_t_%02d", L3_15))
  end
end
function Ingame()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27
  function L0_16()
    print("ep09_t : \227\131\170\227\131\136\227\131\169\227\130\164\230\153\130\227\129\171\229\176\130\231\148\168\227\129\167\229\174\159\232\161\140\227\129\151\227\129\159\227\129\132\229\135\166\231\144\134")
    Fn_sendEventComSb("visibleBg")
  end
  L1_17 = Fn_setMissionRetryFunc
  L2_18 = L0_16
  L1_17(L2_18)
  L1_17 = Fn_sendEventComSb
  L2_18 = "requestSupportCrowSpawn"
  L3_19 = "locator2_crow_start_pos_ep09_t"
  L4_20 = Supporter
  L4_20 = L4_20.FirstAction
  L4_20 = L4_20.Ground
  L5_21 = true
  L1_17(L2_18, L3_19, L4_20, L5_21)
  repeat
    L1_17 = wait
    L1_17()
    L1_17 = Fn_sendEventComSb
    L2_18 = "requestCrowSpawn"
    L1_17 = L1_17(L2_18)
  until L1_17
  L1_17 = Fn_sendEventComSb
  L2_18 = "requestSupportCrowLockToWarp"
  L3_19 = "locator2_crow_move_pos_ep09_t"
  L1_17(L2_18, L3_19)
  L1_17 = Fn_sendEventComSb
  L2_18 = "requestsupportCrowReset"
  L1_17(L2_18)
  L1_17 = nil
  L2_18 = Fn_createEffect
  L3_19 = "ef_ev_jigen_01"
  L4_20 = "ef_ev_jigen_01"
  L5_21 = findGameObject2
  L6_22 = "Node"
  L7_23 = "locator2_gate_01"
  L5_21 = L5_21(L6_22, L7_23)
  L6_22 = true
  L2_18 = L2_18(L3_19, L4_20, L5_21, L6_22)
  L1_17 = L2_18
  L2_18 = Fn_sendEventComSb
  L3_19 = "requestInvisibleBg"
  L4_20 = "1"
  L2_18(L3_19, L4_20)
  L2_18 = Fn_setCatWarpCheckPoint
  L3_19 = "locator2_restart_pos_ep09_t"
  L2_18(L3_19)
  L2_18 = Fn_setBgmPoint
  L3_19 = "event"
  L4_20 = "bgmPoint1"
  L2_18(L3_19, L4_20)
  L2_18 = findGameObject2
  L3_19 = "Node"
  L4_20 = "locator2_cam_gate_01"
  L2_18 = L2_18(L3_19, L4_20)
  L3_19 = findGameObject2
  L4_20 = "Node"
  L5_21 = "locator2_gate_01"
  L3_19 = L3_19(L4_20, L5_21)
  L4_20 = _sdemo_cut01
  L5_21 = L4_20
  L4_20 = L4_20.set
  L6_22 = L2_18
  L7_23 = L3_19
  L4_20(L5_21, L6_22, L7_23)
  L4_20 = _sdemo_cut01
  L5_21 = L4_20
  L4_20 = L4_20.play
  L4_20(L5_21)
  L4_20 = wait
  L4_20()
  L4_20 = enmgen_01
  L5_21 = L4_20
  L4_20 = L4_20.setEnemyMarker
  L6_22 = false
  L4_20(L5_21, L6_22)
  L4_20 = enmgen_02
  L5_21 = L4_20
  L4_20 = L4_20.setEnemyMarker
  L6_22 = false
  L4_20(L5_21, L6_22)
  L4_20 = enmgen_03
  L5_21 = L4_20
  L4_20 = L4_20.setEnemyMarker
  L6_22 = false
  L4_20(L5_21, L6_22)
  L4_20 = Fn_missionStart
  L4_20()
  L4_20 = Fn_captionViewWait
  L5_21 = "ep09_20005"
  L4_20(L5_21)
  L4_20 = _sdemo_cut01
  L5_21 = L4_20
  L4_20 = L4_20.stop
  L6_22 = 3
  L4_20(L5_21, L6_22)
  L4_20 = waitSeconds
  L5_21 = 4
  L4_20(L5_21)
  L4_20 = Fn_kaiwaDemoView
  L5_21 = "ep09_00310k"
  L4_20(L5_21)
  L4_20 = 0
  L5_21 = 0
  L6_22 = invokeTask
  function L7_23()
    while true do
      L4_20 = RandI(2)
      createGrabObjectAroundPc(L4_20)
      L5_21 = RandF(3, 6)
      waitSeconds(L5_21)
    end
  end
  L6_22 = L6_22(L7_23)
  ammo_task = L6_22
  L6_22 = nil
  L7_23 = 0
  L8_24 = invokeTask
  function L9_25()
    while true do
      Camera:shake2D(3, 0.05, 3, 0.1, Camera.kShakeSlot_Fixed1)
      L6_22 = Sound:playSEHandle("ep09_earthquake")
      waitSeconds(3)
      Sound:stopSEHandle(L6_22)
      L7_23 = RandF(3, 6)
      waitSeconds(L7_23)
    end
  end
  L8_24 = L8_24(L9_25)
  shake_task = L8_24
  L8_24 = invokeTask
  function L9_25()
    Fn_sendEventComSb("activeAreaIngame", 1)
  end
  L8_24(L9_25)
  L8_24 = Fn_lookAtObject
  L9_25 = "locator2_aim_01"
  L8_24 = L8_24(L9_25)
  L9_25 = waitSeconds
  L10_26 = 1
  L9_25(L10_26)
  L9_25 = Fn_captionViewWait
  L10_26 = "ep09_20001"
  L11_27 = nil
  L9_25(L10_26, L11_27, 2)
  L9_25 = Fn_captionView
  L10_26 = "ep09_20002"
  L9_25(L10_26)
  L10_26 = L8_24
  L9_25 = L8_24.abort
  L9_25(L10_26)
  L9_25 = Fn_userCtrlOn
  L9_25()
  L9_25 = Fn_sendEventComSb
  L10_26 = "requestsupportCrowReleaseIdling"
  L9_25(L10_26)
  L9_25 = Fn_missionView
  L10_26 = "ep09_20000"
  L9_25(L10_26)
  L9_25 = findGameObject2
  L10_26 = "Node"
  L11_27 = "locator2_island_01"
  L9_25 = L9_25(L10_26, L11_27)
  L10_26 = Fn_naviSet
  L11_27 = L9_25
  L10_26(L11_27)
  L10_26 = waitPhase
  L10_26()
  L10_26 = Fn_setCatWarpCheckPoint
  L11_27 = "locator2_pc_restart_pos_ep09_t_02"
  L10_26(L11_27)
  L10_26 = Fn_pcSensorOff
  L11_27 = "pccubesensor2_t_01"
  L10_26(L11_27)
  L10_26 = Fn_pcSensorOn
  L11_27 = "pccubesensor2_t_02"
  L10_26(L11_27)
  L10_26 = Fn_pcSensorOff
  L11_27 = "pccubesensormulti2_catwarp_ep09_t_01"
  L10_26(L11_27)
  L10_26 = Fn_pcSensorOff
  L11_27 = "pccubesensormulti2_caution_ep09_t_01"
  L10_26(L11_27)
  L10_26 = Fn_pcSensorOn
  L11_27 = "pccubesensormulti2_catwarp_ep09_t_02"
  L10_26(L11_27)
  L10_26 = Fn_pcSensorOn
  L11_27 = "pccubesensormulti2_caution_ep09_t_02"
  L10_26(L11_27)
  L10_26 = Fn_sendEventComSb
  L11_27 = "requestInvisibleBg"
  L10_26(L11_27, "2")
  L10_26 = invokeTask
  function L11_27()
    Fn_sendEventComSb("activeAreaIngame", 2)
  end
  L10_26(L11_27)
  L10_26 = findGameObject2
  L11_27 = "Node"
  L10_26 = L10_26(L11_27, "locator2_island_02")
  L11_27 = Fn_naviSet
  L11_27(L10_26)
  L11_27 = waitPhase
  L11_27()
  L11_27 = enmgen_01
  L11_27 = L11_27.requestAllEnemyKill
  L11_27(L11_27)
  L11_27 = Fn_setCatWarpCheckPoint
  L11_27("locator2_pc_restart_pos_ep09_t_03")
  L11_27 = Fn_pcSensorOff
  L11_27("pccubesensor2_t_02")
  L11_27 = Fn_pcSensorOn
  L11_27("pccubesensor2_t_03")
  L11_27 = Fn_pcSensorOff
  L11_27("pccubesensormulti2_catwarp_ep09_t_02")
  L11_27 = Fn_pcSensorOff
  L11_27("pccubesensormulti2_caution_ep09_t_02")
  L11_27 = Fn_pcSensorOn
  L11_27("pccubesensormulti2_catwarp_ep09_t_03")
  L11_27 = Fn_pcSensorOn
  L11_27("pccubesensormulti2_caution_ep09_t_03")
  L11_27 = Fn_sendEventComSb
  L11_27("requestInvisibleBg", "3")
  L11_27 = invokeTask
  L11_27(function()
    Fn_sendEventComSb("activeAreaIngame", 3)
  end)
  L11_27 = gem_vital
  L11_27 = L11_27[1]
  L11_27 = L11_27.setActive
  L11_27(L11_27, false)
  L11_27 = gem_energy
  L11_27 = L11_27[1]
  L11_27 = L11_27.setActive
  L11_27(L11_27, false)
  L11_27 = findGameObject2
  L11_27 = L11_27("Node", "locator2_island_03")
  Fn_naviSet(L11_27)
  waitPhase()
  enmgen_02:requestAllEnemyKill()
  Fn_setCatWarpCheckPoint("locator2_pc_restart_pos_ep09_t_04")
  Fn_pcSensorOff("pccubesensor2_t_03")
  Fn_pcSensorOn("pccubesensor2_t_04")
  Fn_pcSensorOff("pccubesensormulti2_catwarp_ep09_t_03")
  Fn_pcSensorOff("pccubesensormulti2_caution_ep09_t_03")
  Fn_pcSensorOn("pccubesensormulti2_catwarp_ep09_t_04")
  Fn_pcSensorOn("pccubesensormulti2_caution_ep09_t_04")
  Fn_sendEventComSb("requestInvisibleBg", "4")
  invokeTask(function()
    Fn_sendEventComSb("activeAreaIngame", 4)
  end)
  gem_vital[2]:setActive(false)
  gem_energy[2]:setActive(false)
  Fn_naviSet(findGameObject2("Node", "locator2_gate_01"))
  invokeTask(function()
    _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
    Sound:playSE("cro_226", 1, "", _puppet_crow:getWorldPos())
    Fn_captionViewWait("ep09_20003")
    Sound:playSE("kit_487")
    Fn_captionView("ep09_20004")
  end)
  waitPhase()
  Fn_naviKill()
  ammo_task:abort()
  shake_task:abort()
  Fn_sendEventComSb("requestsupportCrowReset")
  Player:setAttrTune(Player.kAttrTune_Normal, true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if se_earthquake_hdl ~= nil then
    Sound:stopSEHandle(se_earthquake_hdl)
  end
end
function pccubesensormulti2_caution_ep09_t_OnLeave()
  print("pccubesensormulti2_caution_ep09_t_OnLeave")
  invokeTask(function()
    if Player:getAbility(Player.kAbility_GravityShift) then
      Fn_coercionGravityShift()
    end
    if not Fn_isCaptionView("ep09_00101") then
      Fn_captionViewLock("ep09_00101")
    end
  end)
end
function putGrabObject(A0_28)
  local L1_29
  L1_29 = createGameObject2
  L1_29 = L1_29("GimmickBg")
  L1_29:setDrawModelName("az2_anmo_01")
  L1_29:setCollisionName("az2_anmo_01")
  L1_29:setAttributeName("az2_anmo_01")
  L1_29:setPos(A0_28)
  L1_29:setForceMove()
  L1_29:setName("az2_anmo_01")
  L1_29:setVisible(true)
  L1_29:try_init()
  L1_29:waitForReadyAsync(function()
    L1_29:try_start()
  end)
  return L1_29
end
function createGrabObjectAroundPc(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37
  for L4_34 = 1, A0_30 do
    L5_35 = RandF
    L6_36 = -10
    L7_37 = 10
    L5_35 = L5_35(L6_36, L7_37)
    L6_36 = RandF
    L7_37 = -10
    L6_36 = L6_36(L7_37, 10)
    L7_37 = Fn_getPlayerWorldPos
    L7_37 = L7_37()
    L7_37 = L7_37 + Vector(L5_35, 20, L6_36)
    ammonite_num = ammonite_num + 1
    if ammonite_num > 50 then
      if ammonite[1]:getDynamicObject() ~= nil and ammonite[1]:getDynamicObject():isGrabbed() == false then
        ammonite[1]:getDynamicObject():try_term()
      end
      ammonite[1]:try_term()
      ammonite[1] = nil
      table.remove(ammonite, 1)
      ammonite_num = 50
    end
    ammonite[ammonite_num] = putGrabObject(L7_37)
    ammonite[ammonite_num]:pushJob("", "N", 0, "D")
    ammonite[ammonite_num]:setMoveThreshold(1)
  end
end
