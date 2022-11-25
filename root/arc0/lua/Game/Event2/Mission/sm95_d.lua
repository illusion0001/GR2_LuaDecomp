import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_crate_cap_wait = 30
enmgen2_d01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_d1_01",
      name = "enemy_d1_01"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_02",
      name = "enemy_d1_02"
    },
    {
      type = "gellyfish",
      locator = "locator_d1_03",
      name = "enemy_d1_03"
    },
    {
      type = "imp",
      locator = "locator_d1_04",
      name = "enemy_d1_04"
    },
    {
      type = "imp",
      locator = "locator_d1_05",
      name = "enemy_d1_05"
    },
    {
      type = "lasercannon",
      locator = "locator_d1_07",
      name = "enemy_d1_07"
    },
    {
      type = "lasercannon",
      locator = "locator_d1_08",
      name = "enemy_d1_08"
    },
    {
      type = "stalker",
      locator = "locator_d1_09",
      name = "enemy_d1_09"
    },
    {
      type = "stalker",
      locator = "locator_d1_10",
      name = "enemy_d1_10"
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
enmgen2_d02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_d2_01",
      name = "enemy_d2_01"
    },
    {
      type = "runner",
      locator = "locator_d2_02",
      name = "enemy_d2_02"
    },
    {
      type = "stalker",
      locator = "locator_d2_03",
      name = "enemy_d2_03"
    },
    {
      type = "stalker",
      locator = "locator_d2_04",
      name = "enemy_d2_04"
    },
    {
      type = "stalker",
      locator = "locator_d2_05",
      name = "enemy_d2_05"
    },
    {
      type = "gellyfish",
      locator = "locator_d2_06",
      name = "enemy_d2_06"
    },
    {
      type = "gellyfish",
      locator = "locator_d2_07",
      name = "enemy_d2_07"
    },
    {
      type = "lasercannon",
      locator = "locator_d2_08",
      name = "enemy_d2_08"
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
  onObjectAsh = function(A0_17, A1_18)
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
enmgen2_d03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_d3_01",
      name = "enemy_d3_01"
    },
    {
      type = "mechsmall",
      locator = "locator_d3_02",
      name = "enemy_d3_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_03",
      name = "enemy_d3_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_04",
      name = "enemy_d3_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_05",
      name = "enemy_d3_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_06",
      name = "enemy_d3_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_07",
      name = "enemy_d3_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_08",
      name = "enemy_d3_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_09",
      name = "enemy_d3_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_10",
      name = "enemy_d3_10"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_11",
      name = "enemy_d3_11"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d3_12",
      name = "enemy_d3_12"
    },
    {
      type = "officer_launcher",
      locator = "locator_d3_01",
      name = "enemy_d3_21",
      target_vehicle = "enemy_d3_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_d3_02",
      name = "enemy_d3_22",
      target_vehicle = "enemy_d3_02"
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
  onObjectAsh = function(A0_28, A1_29)
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
enmgen2_d04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_d4_01",
      name = "enemy_d4_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d4_02",
      name = "enemy_d4_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d4_03",
      name = "enemy_d4_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d4_04",
      name = "enemy_d4_04"
    },
    {
      type = "officer_launcher",
      locator = "locator_d4_05",
      name = "enemy_d4_05"
    },
    {
      type = "soldier_launcher",
      locator = "locator_d4_06",
      name = "enemy_d4_06"
    },
    {
      type = "soldier_launcher",
      locator = "locator_d4_07",
      name = "enemy_d4_07"
    },
    {
      type = "soldier_launcher",
      locator = "locator_d4_08",
      name = "enemy_d4_08"
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
  onObjectAsh = function(A0_39, A1_40)
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
  L0_44 = {
    "evarea2_po_a_root"
  }
  Fn_loadEventData("evx/sm95_common", L0_44, true)
end
function Ingame()
  Fn_sendEventComSb("move_area_po_a_15_2")
  repeat
    wait()
  until Fn_sendEventComSb("warp_po_a_15")
  Fn_sendEventComSb("levelset")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  ;({})[1] = findGameObject2("Node", "pccubesensor2_d_" .. string.format("%02d", 1))
  if findGameObject2("EnemyGenerator", "enmgen2_d_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_d_01"):requestSpawn()
  end
  Fn_missionStart()
  NaviSet_Auto(({})[1], 30, 10)
  Fn_captionView("sm95_00400", 0)
  waitPhace()
  Mob:makeSituationPanic(true)
  enemy_set(enmgen2_d01)
  Fn_captionViewEnd()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_d_01_OnEnter(A0_45)
  _next_phase = true
  Fn_naviKill()
  A0_45:setActive(false)
end
function navi_on()
  local L0_46, L1_47
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_48, A1_49, A2_50)
  Fn_naviSet(A0_48)
  if A1_49 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_49)
    HUD:naviSetPochiDistanceDensity0(A2_50)
  end
  Sound:pulse("navi_set")
end
function enemy_set(A0_51)
  enemy_count = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. A0_51:getEnemyRest() .. "/" .. A0_51:getEnemyMax())
      wait()
    end
  end)
  while A0_51:getEnemyRest() > 0 do
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
function auto_caption(A0_52, A1_53)
  local L2_54, L3_55
  L2_54 = false
  L3_55 = {}
  if A0_52 == nil then
    A0_52 = 0
  end
  auto_cap = invokeTask(function()
    repeat
      waitSeconds(1)
      A1_53 = A1_53 + 1
      if A1_53 > 30 then
        L3_55[0] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("sp_attack")
          end
        end
        L3_55[1] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_captionView("sm95_00420", 0)
            A0_52 = A0_52 - 2
          end
        end
        L3_55[A0_52]()
        A0_52 = A0_52 + 1
        A1_53 = 0
      end
      wait()
    until L2_54 == true
  end)
end
