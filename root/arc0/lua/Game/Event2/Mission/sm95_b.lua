import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_crate_cap_wait = 30
enmgen2_b01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_b1_01",
      name = "enemy_b1_01"
    },
    {
      type = "stalker",
      locator = "locator_b1_02",
      name = "enemy_b1_02"
    },
    {
      type = "gellyfish",
      locator = "locator_b1_03",
      name = "enemy_b1_03"
    },
    {
      type = "gellyfish",
      locator = "locator_b1_04",
      name = "enemy_b1_04"
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
  onObjectDead = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
enmgen2_b02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_b2_01",
      name = "enemy_b2_01"
    },
    {
      type = "imp",
      locator = "locator_b2_02",
      name = "enemy_b2_02"
    },
    {
      type = "imp",
      locator = "locator_b2_03",
      name = "enemy_b2_03"
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onObjectDead = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyDeadNum = A0_17:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_19)
    return #A0_19.spawnSet
  end,
  getEnemyRest = function(A0_20)
    local L1_21
    L1_21 = A0_20.spawnSet
    L1_21 = #L1_21
    L1_21 = L1_21 - A0_20.enemyDeadNum
    return L1_21
  end
}
enmgen2_b03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_b3_01",
      name = "enemy_b3_01"
    },
    {
      type = "stalker",
      locator = "locator_b3_02",
      name = "enemy_b3_02"
    },
    {
      type = "gellyfish",
      locator = "locator_b3_03",
      name = "enemy_b3_03"
    },
    {
      type = "lasercannon",
      locator = "locator_b3_04",
      name = "enemy_b3_04"
    },
    {
      type = "lasercannon",
      locator = "locator_b3_05",
      name = "enemy_b3_05"
    }
  },
  onUpdate = function(A0_22)
    local L1_23
  end,
  onEnter = function(A0_24)
    local L1_25
  end,
  onLeave = function(A0_26)
    local L1_27
  end,
  onObjectDead = function(A0_28, A1_29)
    A0_28:getSpecTable().enemyDeadNum = A0_28:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_30)
    return #A0_30.spawnSet
  end,
  getEnemyRest = function(A0_31)
    local L1_32
    L1_32 = A0_31.spawnSet
    L1_32 = #L1_32
    L1_32 = L1_32 - A0_31.enemyDeadNum
    return L1_32
  end
}
enmgen2_b04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_b4_01",
      name = "enemy_b4_01"
    },
    {
      type = "gellyfish",
      locator = "locator_b4_02",
      name = "enemy_b4_02"
    },
    {
      type = "imp",
      locator = "locator_b4_05",
      name = "enemy_b4_05"
    },
    {
      type = "imp",
      locator = "locator_b4_06",
      name = "enemy_b4_06"
    },
    {
      type = "imp",
      locator = "locator_b4_07",
      name = "enemy_b4_07"
    },
    {
      type = "stalker",
      locator = "locator_b4_09",
      name = "enemy_b4_09"
    },
    {
      type = "stalker",
      locator = "locator_b4_10",
      name = "enemy_b4_10"
    }
  },
  onUpdate = function(A0_33)
    local L1_34
  end,
  onEnter = function(A0_35)
    local L1_36
  end,
  onLeave = function(A0_37)
    local L1_38
  end,
  onObjectDead = function(A0_39, A1_40)
    A0_39:getSpecTable().enemyDeadNum = A0_39:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_41)
    return #A0_41.spawnSet
  end,
  getEnemyRest = function(A0_42)
    local L1_43
    L1_43 = A0_42.spawnSet
    L1_43 = #L1_43
    L1_43 = L1_43 - A0_42.enemyDeadNum
    return L1_43
  end
}
function Initialize()
  local L0_44
  L0_44 = Fn_pcSensorOff
  L0_44("pccubesensor2_b_02")
  L0_44 = {
    "evarea2_po_a_root"
  }
  Fn_loadEventData("evx/sm95_common", L0_44, true)
end
function Ingame()
  local L0_45, L1_46, L2_47, L3_48, L4_49
  L0_45 = Fn_sendEventComSb
  L0_45(L1_46)
  repeat
    L0_45 = wait
    L0_45()
    L0_45 = Fn_sendEventComSb
    L0_45 = L0_45(L1_46)
  until L0_45
  L0_45 = Fn_sendEventComSb
  L0_45(L1_46)
  L0_45 = Fn_setCatWarpCheckPoint
  L0_45(L1_46)
  L0_45 = {}
  for L4_49 = 1, 2 do
    L0_45[L4_49] = findGameObject2("Node", "pccubesensor2_b_" .. string.format("%02d", L4_49))
  end
  L1_46()
  L4_49 = 10
  L1_46(L2_47, L3_48, L4_49)
  L1_46(L2_47)
  L1_46(L2_47)
  L1_46()
  if L1_46 ~= nil then
    L2_47(L3_48)
  end
  L4_49 = true
  L2_47(L3_48, L4_49)
  L2_47()
  L2_47(L3_48)
  L2_47(L3_48)
  L4_49 = "enmgen2_b_02"
  if L2_47 ~= nil then
    L4_49 = L2_47
    L3_48(L4_49)
  end
  L3_48()
  L4_49 = "marsgrav_kick"
  L3_48(L4_49)
  L4_49 = enmgen2_b02
  L3_48(L4_49)
  L3_48()
  L4_49 = "EnemyGenerator"
  if L3_48 ~= nil then
    L4_49 = L3_48.requestSpawn
    L4_49(L3_48)
  end
  L4_49 = auto_caption
  L4_49(0, 30)
  L4_49 = enemy_set
  L4_49(enmgen2_b03)
  L4_49 = auto_cap
  L4_49 = L4_49.abort
  L4_49(L4_49)
  L4_49 = Fn_tutorialCaptionKill
  L4_49()
  L4_49 = Fn_setKeepPlayerPos
  L4_49()
  L4_49 = Fn_setNextMissionFlag
  L4_49()
  L4_49 = Fn_nextMission
  L4_49()
  L4_49 = Fn_exitSandbox
  L4_49()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_b_01_OnEnter(A0_50)
  _next_phase = true
  Fn_naviKill()
  A0_50:setActive(false)
end
function pccubesensor2_b_02_OnEnter(A0_51)
  _next_phase = true
  Fn_naviKill()
  A0_51:setActive(false)
end
function navi_on()
  local L0_52, L1_53
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_54, A1_55, A2_56)
  Fn_naviSet(A0_54)
  if A1_55 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_55)
    HUD:naviSetPochiDistanceDensity0(A2_56)
  end
  Sound:pulse("navi_set")
end
function enemy_set(A0_57)
  enemy_count = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. A0_57:getEnemyRest() .. "/" .. A0_57:getEnemyMax())
      wait()
    end
  end)
  while A0_57:getEnemyRest() > 0 do
    wait()
  end
  enemy_count:abort()
end
function move_area_po_a_15_2()
  Fn_getPlayer():setCollidable(false)
  Time:setInGameDeltaSec(0)
  wait()
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15"):setWorldTransform(findGameObject2("Node", "locator2_po_a_15_02"):getWorldTransform())
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15"):setForceMove()
  wait()
  Time:resetInGameDeltaSec()
  wait()
  Fn_getPlayer():setCollidable(true)
end
function auto_caption(A0_58, A1_59)
  local L2_60, L3_61
  L2_60 = false
  L3_61 = {}
  if A0_58 == nil then
    A0_58 = 0
  end
  auto_cap = invokeTask(function()
    repeat
      waitSeconds(1)
      A1_59 = A1_59 + 1
      if A1_59 > 20 then
        L3_61[0] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("mars_grab")
          end
        end
        L3_61[1] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("mars_kick")
          end
        end
        L3_61[2] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("marsgrav_kick")
          end
          A0_58 = A0_58 - 3
        end
        L3_61[A0_58]()
        A0_58 = A0_58 + 1
        A1_59 = 0
      end
      wait()
    until L2_60 == true
  end)
end
