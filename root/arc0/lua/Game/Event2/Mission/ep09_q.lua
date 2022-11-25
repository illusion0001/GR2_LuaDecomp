dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
enmgen_01 = nil
enmgen_02 = nil
enmgen_03 = nil
timer_wave1 = 30
timer_wave2 = 45
timer_wave3 = 60
_battle_clearDeadNum_wave = 11
gem = {}
vital_gem_num = 2
special_gem_num = 4
enmgen2_nevi_01 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "jammer",
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
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_2, A1_3)
    Fn_enemyPopGemSetup(A0_2, {
      "enemy_01",
      "enemy_02",
      "enemy_03"
    }, 1, 6)
  end,
  onPopGem = function(A0_4, A1_5)
    Fn_enemyAshPopGem(A0_4, A1_5)
  end,
  enemyDeadNum = 0,
  isEnemyAllDead = function(A0_6)
    local L2_7
    L2_7 = A0_6.enemyDeadNum
    L2_7 = L2_7 >= #A0_6.spawnSet
    return L2_7
  end
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_02_01",
      name = "enemy_04"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_02",
      name = "enemy_05"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_03",
      name = "enemy_06"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_02_04",
      name = "enemy_07"
    }
  },
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_10, A1_11)
    Fn_enemyPopGemSetup(A0_10, {
      "enemy_04",
      "enemy_05",
      "enemy_06",
      "enemy_07"
    }, 1, 6)
  end,
  onPopGem = function(A0_12, A1_13)
    Fn_enemyAshPopGem(A0_12, A1_13)
  end,
  enemyDeadNum = 0,
  isEnemyAllDead = function(A0_14)
    local L2_15
    L2_15 = A0_14.enemyDeadNum
    L2_15 = L2_15 >= #A0_14.spawnSet
    return L2_15
  end
}
enmgen2_nevi_03 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_nevi_03_01",
      name = "enemy_08"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_02",
      name = "enemy_09"
    },
    {
      type = "lasercannon",
      locator = "locator2_nevi_03_03",
      name = "enemy_10"
    },
    {
      type = "jammer",
      locator = "locator2_nevi_03_04",
      name = "enemy_11"
    }
  },
  onObjectAsh = function(A0_16, A1_17)
    A0_16:getSpecTable().enemyDeadNum = A0_16:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
  end,
  onSetupGem = function(A0_18, A1_19)
    Fn_enemyPopGemSetup(A0_18, {
      "enemy_08",
      "enemy_09",
      "enemy_10",
      "enemy_11"
    }, 1, 6)
  end,
  onPopGem = function(A0_20, A1_21)
    Fn_enemyAshPopGem(A0_20, A1_21)
  end,
  enemyDeadNum = 0,
  isEnemyAllDead = function(A0_22)
    local L2_23
    L2_23 = A0_22.enemyDeadNum
    L2_23 = L2_23 >= #A0_22.spawnSet
    return L2_23
  end
}
function Initialize()
  local L0_24, L1_25, L2_26, L3_27
  L3_27 = true
  L0_24(L1_25, L2_26, L3_27)
  L3_27 = true
  L0_24(L1_25, L2_26, L3_27)
  _sdemo_cut01 = L0_24
  enmgen_01 = L0_24
  enmgen_02 = L0_24
  enmgen_03 = L0_24
  for L3_27 = 1, vital_gem_num do
    gem[L3_27] = findGameObject2("Gem", string.format("gem2_vital_ep09_q_%02d", L3_27))
    gem[L3_27]:setActive(false)
  end
  for L3_27 = 1, special_gem_num do
    gem[L3_27 + vital_gem_num] = findGameObject2("Gem", string.format("gem2_special_ep09_q_%02d", L3_27))
    gem[L3_27 + vital_gem_num]:setActive(false)
  end
  L0_24(L1_25)
  L0_24(L1_25)
end
function Ingame()
  local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35
  L0_28 = Fn_setCatWarpCheckPoint
  L1_29 = "locator2_restart_pos_ep09_q"
  L0_28(L1_29)
  L0_28 = findGameObject2
  L1_29 = "Node"
  L2_30 = "locator2_litho_01"
  L0_28 = L0_28(L1_29, L2_30)
  L1_29 = invokeTask
  function L2_30()
    local L0_36
    L0_36 = false
    while true do
      if L0_36 == false and Fn_getDistanceToPlayer(L0_28) > 30 then
        L0_36 = true
        Fn_naviSet(L0_28)
      elseif L0_36 == true and Fn_getDistanceToPlayer(L0_28) <= 10 then
        L0_36 = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L1_29 = L1_29(L2_30)
  litho_task = L1_29
  L1_29 = Fn_missionStart
  L1_29()
  L1_29 = Fn_userCtrlOn
  L1_29()
  L1_29 = GameDatabase
  L2_30 = L1_29
  L1_29 = L1_29.get
  L3_31 = ggd
  L3_31 = L3_31.EventFlags__ep09__flag02
  L1_29 = L1_29(L2_30, L3_31)
  if L1_29 == 1 then
    L1_29 = Fn_captionView
    L2_30 = "ep09_17001"
    L1_29(L2_30)
  else
  end
  repeat
    L1_29 = wait
    L1_29()
    L1_29 = Fn_sendEventComSb
    L2_30 = "isLithographStart"
    L1_29 = L1_29(L2_30)
  until L1_29
  L1_29 = Fn_coercionPoseNomal
  L1_29()
  L1_29 = litho_task
  L2_30 = L1_29
  L1_29 = L1_29.abort
  L1_29(L2_30)
  litho_task = nil
  L1_29 = Fn_setCatWarpCheckPoint
  L2_30 = "locator2_restart_pos_ep09_q_02"
  L1_29(L2_30)
  L1_29 = Fn_sendEventComSb
  L2_30 = "requestComSensorOff"
  L3_31 = "pccubesensormulti2_caution_08"
  L1_29(L2_30, L3_31)
  L1_29 = Fn_sendEventComSb
  L2_30 = "requestComSensorOff"
  L3_31 = "pccubesensormulti2_catwarp_08"
  L1_29(L2_30, L3_31)
  L1_29 = Fn_pcSensorOn
  L2_30 = "pccubesensor2_caution_litho_08"
  L1_29(L2_30)
  L1_29 = Fn_pcSensorOn
  L2_30 = "pccubesensor2_catwarp_litho_08"
  L1_29(L2_30)
  L1_29 = enmgen_01
  if L1_29 ~= nil then
    L1_29 = enmgen_01
    L2_30 = L1_29
    L1_29 = L1_29.requestSpawn
    L1_29(L2_30)
  end
  L1_29 = enmgen_01
  L2_30 = L1_29
  L1_29 = L1_29.requestIdlingEnemy
  L3_31 = true
  L1_29(L2_30, L3_31)
  L1_29 = enmgen_01
  L2_30 = L1_29
  L1_29 = L1_29.setEnemyMarker
  L3_31 = false
  L1_29(L2_30, L3_31)
  L1_29 = Fn_setBgmPoint
  L2_30 = "battle"
  L1_29(L2_30)
  L1_29 = Fn_sendEventComSb
  L2_30 = "setFirstHalfProcessEnd"
  L1_29(L2_30)
  repeat
    L1_29 = wait
    L1_29()
    L1_29 = Fn_sendEventComSb
    L2_30 = "isFirstHalfProcessEnd"
    L1_29 = L1_29(L2_30)
  until L1_29
  L1_29 = Fn_lookAtObject
  L2_30 = "locator2_nevi_01_03"
  L1_29 = L1_29(L2_30)
  L2_30 = waitSeconds
  L3_31 = 1
  L2_30(L3_31)
  L2_30 = Fn_captionViewWait
  L3_31 = "ep09_17003"
  L2_30(L3_31)
  L3_31 = L1_29
  L2_30 = L1_29.abort
  L2_30(L3_31)
  L2_30 = waitSeconds
  L3_31 = 0.3
  L2_30(L3_31)
  L2_30 = GameDatabase
  L3_31 = L2_30
  L2_30 = L2_30.get
  L2_30 = L2_30(L3_31, L4_32)
  if L2_30 ~= 2 then
    L2_30 = HUD
    L3_31 = L2_30
    L2_30 = L2_30.info
    L2_30(L3_31, L4_32, L5_33)
  else
    L2_30 = GameDatabase
    L3_31 = L2_30
    L2_30 = L2_30.get
    L2_30 = L2_30(L3_31, L4_32)
    if L2_30 == 2 then
      L2_30 = HUD
      L3_31 = L2_30
      L2_30 = L2_30.info
      L2_30(L3_31, L4_32, L5_33)
    end
  end
  L2_30 = wait
  L2_30()
  L2_30 = {L3_31}
  L3_31 = Player
  L3_31 = L3_31.kAbility_SpAttack
  L3_31 = {}
  L4_32(L5_33, L6_34)
  L7_35 = Player
  L7_35 = L7_35.getEnergyMax
  L7_35 = L7_35(L7_35, Player.kEnergy_SpAttack)
  L4_32(L5_33, L6_34, L7_35, false)
  for L7_35 = 1, L5_33 + L6_34 do
    if gem[L7_35] ~= nil then
      gem[L7_35]:setActive(true)
    end
  end
  L7_35 = nil
  L4_32(L5_33, L6_34, L7_35, true)
  L4_32()
  L4_32()
  L4_32(L5_33)
  L7_35 = 0
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  L4_32(L5_33)
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  return_task = L4_32
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  L4_32(L5_33)
  repeat
    if L4_32 == false then
      L4_32()
    end
    L4_32()
  until L4_32
  L4_32(L5_33)
  L4_32(L5_33)
  L4_32(L5_33, L6_34)
  L4_32(L5_33)
  L4_32()
  L4_32(L5_33)
  _isSuccess = nil
  if L4_32 ~= nil then
    L4_32(L5_33)
  end
  repeat
    L4_32()
  until L4_32
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  L4_32(L5_33, L6_34)
  L5_33(L6_34)
  L5_33(L6_34)
  L5_33(L6_34)
  L5_33(L6_34)
  L7_35 = false
  L5_33(L6_34, L7_35)
  L5_33()
  L7_35 = false
  L5_33(L6_34, L7_35)
  L7_35 = true
  L5_33(L6_34, L7_35)
  L7_35 = {
    0,
    0,
    timer_wave2,
    0
  }
  L5_33(L6_34, L7_35)
  L7_35 = true
  L5_33(L6_34, L7_35)
  L5_33(L6_34)
  L5_33(L6_34)
  repeat
    if L5_33 == false then
      L5_33()
    end
    L5_33()
  until L5_33
  L5_33(L6_34)
  L5_33(L6_34)
  L7_35 = false
  L5_33(L6_34, L7_35)
  L5_33(L6_34)
  L5_33()
  L5_33(L6_34)
  _isSuccess = nil
  if L5_33 ~= nil then
    L5_33(L6_34)
  end
  repeat
    L5_33()
  until L5_33
  L7_35 = true
  L5_33(L6_34, L7_35)
  L7_35 = false
  L5_33(L6_34, L7_35)
  L7_35 = true
  L5_33(L6_34, L7_35)
  L7_35 = 1
  L6_34(L7_35)
  L7_35 = "ep09_17007"
  L6_34(L7_35)
  L7_35 = L5_33
  L6_34(L7_35)
  L7_35 = 0.3
  L6_34(L7_35)
  L7_35 = L6_34
  L6_34(L7_35, false)
  L6_34()
  L7_35 = L6_34
  L6_34(L7_35, false)
  L7_35 = L6_34
  L6_34(L7_35, true)
  L7_35 = L6_34
  L6_34(L7_35, {
    0,
    0,
    timer_wave3,
    0
  })
  L7_35 = L6_34
  L6_34(L7_35, true)
  L7_35 = L6_34
  L6_34(L7_35)
  function L7_35()
    repeat
      repeat
        wait()
      until HUD:timerGetSecond() <= 0
      if _isSuccess == nil then
        _isSuccess = false
      end
      wait()
    until _isSuccess
  end
  L6_34(L7_35)
  repeat
    if L6_34 == false then
      L6_34()
    end
    L6_34()
    L7_35 = L6_34
  until L6_34
  L7_35 = "ep09_17008"
  L6_34(L7_35)
  L6_34()
  L7_35 = L6_34
  L6_34(L7_35)
  L7_35 = L6_34
  L6_34(L7_35, false)
  L7_35 = L6_34
  L6_34(L7_35, false)
  L7_35 = L6_34
  L6_34(L7_35)
  L6_34()
  L7_35 = "pccubesensor2_caution_litho_08"
  L6_34(L7_35)
  L7_35 = "pccubesensor2_catwarp_litho_08"
  L6_34(L7_35)
  L7_35 = L6_34
  L6_34(L7_35)
  return_task = nil
  L7_35 = 3
  L6_34(L7_35)
  _isSuccess = nil
  L7_35 = "event"
  L6_34(L7_35, "battle_end")
  L7_35 = "missionComplete"
  L6_34(L7_35)
  repeat
    L6_34()
    L7_35 = "isSecondHalfProcessEnd"
  until L6_34
  L7_35 = "synchroArea"
  L6_34(L7_35)
  L6_34()
  L7_35 = L6_34
  L6_34(L7_35, "locator2_cam_02", "locator2_aim_02")
  L7_35 = {}
  L7_35.pos = "locator2_cam_03"
  L7_35.time = 2
  L7_35 = {
    {
      pos = "locator2_aim_03",
      time = 2
    }
  }
  _sdemo_cut01:play(L6_34, L7_35)
  waitSeconds(2)
  Sound:playSE("kit_486")
  Fn_captionViewWait("ep09_18001")
  Fn_kaiwaDemoView("ep09_00150k")
  Fn_blackout()
  _sdemo_cut01:stop(0)
  waitSeconds(2)
  Fn_fadein()
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_37, L1_38
end
function restartLithographTheme()
  HUD:timerStop()
  HUD:timerSetVisible(false)
  HUD:counter999SetVisible(false)
  GameDatabase:set(ggd.EventFlags__ep09__flag02, 1)
  Fn_captionViewEnd()
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
