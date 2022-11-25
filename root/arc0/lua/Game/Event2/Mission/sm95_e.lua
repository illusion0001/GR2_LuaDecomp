import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_crate_cap_wait = 30
enmgen2_e01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_e1_01",
      name = "enemy_e1_01"
    },
    {
      type = "stalker",
      locator = "locator_e1_02",
      name = "enemy_e1_02"
    },
    {
      type = "stalker",
      locator = "locator_e1_03",
      name = "enemy_e1_03"
    },
    {
      type = "stalker",
      locator = "locator_e1_04",
      name = "enemy_e1_04"
    },
    {
      type = "gellyfish",
      locator = "locator_e1_05",
      name = "enemy_e1_05"
    },
    {
      type = "gellyfish",
      locator = "locator_e1_06",
      name = "enemy_e1_06"
    },
    {
      type = "gellyfish",
      locator = "locator_e1_07",
      name = "enemy_e1_07"
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
enmgen2_e02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_e2_01",
      name = "enemy_e2_01"
    },
    {
      type = "gellyfish",
      locator = "locator_e2_02",
      name = "enemy_e2_02"
    },
    {
      type = "imp",
      locator = "locator_e2_03",
      name = "enemy_e2_03"
    },
    {
      type = "imp",
      locator = "locator_e2_04",
      name = "enemy_e2_04"
    },
    {
      type = "imp",
      locator = "locator_e2_05",
      name = "enemy_e2_05"
    },
    {
      type = "treecannon",
      locator = "locator_e2_06",
      name = "enemy_e2_06"
    },
    {
      type = "treecannon",
      locator = "locator_e2_07",
      name = "enemy_e2_07"
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
enmgen2_e03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_e3_01",
      name = "enemy_e3_01"
    },
    {
      type = "runner",
      locator = "locator_e3_02",
      name = "enemy_e3_02"
    },
    {
      type = "guardcore",
      locator = "locator_e3_03",
      name = "enemy_e3_03"
    },
    {
      type = "guardcore",
      locator = "locator_e3_04",
      name = "enemy_e3_04"
    },
    {
      type = "treecannon",
      locator = "locator_e3_05",
      name = "enemy_e3_05"
    },
    {
      type = "lasercannon",
      locator = "locator_e3_06",
      name = "enemy_e3_06"
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
function Initialize()
  local L0_33
  L0_33 = {
    "evarea2_po_a_root"
  }
  Fn_loadEventData("evx/sm95_common", L0_33, true)
end
function Ingame()
  Fn_sendEventComSb("move_area_po_a_15_2")
  repeat
    wait()
  until Fn_sendEventComSb("warp_po_a_15")
  Fn_sendEventComSb("levelset")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  ;({})[1] = findGameObject2("Node", "pccubesensor2_e_" .. string.format("%02d", 1))
  Fn_missionStart()
  NaviSet_Auto(({})[1], 30, 10)
  waitPhace()
  Mob:makeSituationPanic(true)
  if findGameObject2("EnemyGenerator", "enmgen2_e_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_e_01"):requestSpawn()
  end
  Fn_setBgmPoint("event", "boss")
  enemy_set(enmgen2_e01)
  Fn_setBgmPoint("event", "mission_end")
  waitSeconds(3)
  wait()
  Fn_captionViewWait("sm95_00500")
  waitSeconds(2)
  Sound:pulse("mission_clear")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_e_01_OnEnter(A0_34)
  _next_phase = true
  Fn_naviKill()
  A0_34:setActive(false)
end
function navi_on()
  local L0_35, L1_36
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_37, A1_38, A2_39)
  Fn_naviSet(A0_37)
  if A1_38 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_38)
    HUD:naviSetPochiDistanceDensity0(A2_39)
  end
  Sound:pulse("navi_set")
end
function enemy_set(A0_40)
  enemy_eount = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. A0_40:getEnemyRest() .. "/" .. A0_40:getEnemyMax())
      wait()
    end
  end)
  while A0_40:getEnemyRest() > 0 do
    wait()
  end
  enemy_eount:abort()
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
function move_area_po_a_15_3()
  Fn_getPlayer():setCollidable(false)
  Time:setInGameDeltaSec(0)
  wait()
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15"):setWorldTransform(findGameObject2("Node", "locator2_po_a_15_03"):getWorldTransform())
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15"):setForceMove()
  wait()
  Time:resetInGameDeltaSec()
  wait()
  Fn_getPlayer():setCollidable(true)
end
function auto_caption(A0_41, A1_42)
  local L2_43, L3_44
  L2_43 = false
  L3_44 = {}
  if A0_41 == nil then
    A0_41 = 0
  end
  auto_cap = invokeTask(function()
    repeat
      waitSeconds(1)
      A1_42 = A1_42 + 1
      if A1_42 > 20 then
        L3_44[0] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("attack")
          end
        end
        L3_44[1] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("gravitykick")
          end
        end
        L3_44[2] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("grab")
          end
          A0_41 = A0_41 - 3
        end
        L3_44[A0_41]()
        A0_41 = A0_41 + 1
        A1_42 = 0
      end
      wait()
    until L2_43 == true
  end)
end
