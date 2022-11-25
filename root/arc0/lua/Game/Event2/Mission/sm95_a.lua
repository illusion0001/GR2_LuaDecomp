import("Mob")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_enemy_max = 0
_enemy_cnt = 0
_crate_cap_wait = 30
enmgen2_a01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_a1_01",
      name = "enemy_a1_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a1_02",
      name = "enemy_a1_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a1_03",
      name = "enemy_a1_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a1_04",
      name = "enemy_a1_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a1_06",
      name = "enemy_a1_06"
    },
    {
      type = "officer_rifle",
      locator = "locator_a1_07",
      name = "enemy_a1_07"
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
    _enemy_cnt = _enemy_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax1 = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest1 = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
enmgen2_a02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_a2_01",
      name = "enemy_a2_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a2_02",
      name = "enemy_a2_02"
    },
    {
      type = "soldier_launcher",
      locator = "locator_a2_03",
      name = "enemy_a2_03"
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
    _enemy_cnt = _enemy_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax2 = function(A0_19)
    return #A0_19.spawnSet
  end,
  getEnemyRest2 = function(A0_20)
    local L1_21
    L1_21 = A0_20.spawnSet
    L1_21 = #L1_21
    L1_21 = L1_21 - A0_20.enemyDeadNum
    return L1_21
  end
}
enmgen2_a03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_launcher",
      locator = "locator_a3_01",
      name = "enemy_a3_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator_a3_02",
      name = "enemy_a3_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a3_03",
      name = "enemy_a3_03"
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
    _enemy_cnt = _enemy_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax3 = function(A0_30)
    return #A0_30.spawnSet
  end,
  getEnemyRest3 = function(A0_31)
    local L1_32
    L1_32 = A0_31.spawnSet
    L1_32 = #L1_32
    L1_32 = L1_32 - A0_31.enemyDeadNum
    return L1_32
  end
}
enmgen2_a04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_a4_01",
      name = "enemy_a4_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a4_02",
      name = "enemy_a4_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a4_03",
      name = "enemy_a4_03"
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
    _enemy_cnt = _enemy_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax4 = function(A0_41)
    return #A0_41.spawnSet
  end,
  getEnemyRest4 = function(A0_42)
    local L1_43
    L1_43 = A0_42.spawnSet
    L1_43 = #L1_43
    L1_43 = L1_43 - A0_42.enemyDeadNum
    return L1_43
  end
}
enmgen2_a05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_a5_01",
      name = "enemy_a5_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a5_02",
      name = "enemy_a5_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a5_03",
      name = "enemy_a5_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a5_04",
      name = "enemy_a5_04"
    },
    {
      type = "officer_rifle",
      locator = "locator_a5_01",
      name = "enemy_a5_21",
      target_vehicle = "enemy_a5_01"
    }
  },
  onUpdate = function(A0_44)
    local L1_45
  end,
  onEnter = function(A0_46)
    local L1_47
  end,
  onLeave = function(A0_48)
    local L1_49
  end,
  onObjectAsh = function(A0_50, A1_51)
    A0_50:getSpecTable().enemyDeadNum = A0_50:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_52)
    return #A0_52.spawnSet
  end,
  getEnemyRest = function(A0_53)
    local L1_54
    L1_54 = A0_53.spawnSet
    L1_54 = #L1_54
    L1_54 = L1_54 - A0_53.enemyDeadNum
    return L1_54
  end
}
enmgen2_a06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_a6_01",
      name = "enemy_a6_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a6_02",
      name = "enemy_a6_02"
    },
    {
      type = "soldier_launcher",
      locator = "locator_a6_04",
      name = "enemy_a6_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a6_05",
      name = "enemy_a6_05"
    },
    {
      type = "soldier_launcher",
      locator = "locator_a6_07",
      name = "enemy_a6_07"
    },
    {
      type = "mechsmall",
      locator = "locator_a6_08",
      name = "enemy_a6_08"
    },
    {
      type = "mechsmall",
      locator = "locator_a6_09",
      name = "enemy_a6_09"
    },
    {
      type = "officer_launcher",
      locator = "locator_a6_08",
      name = "enemy_a6_28",
      target_vehicle = "enemy_a6_08"
    },
    {
      type = "officer_rifle",
      locator = "locator_a6_09",
      name = "enemy_a6_29",
      target_vehicle = "enemy_a6_09"
    }
  },
  onUpdate = function(A0_55)
    local L1_56
  end,
  onEnter = function(A0_57)
    local L1_58
  end,
  onLeave = function(A0_59)
    local L1_60
  end,
  onObjectAsh = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_63)
    return #A0_63.spawnSet
  end,
  getEnemyRest = function(A0_64)
    local L1_65
    L1_65 = A0_64.spawnSet
    L1_65 = #L1_65
    L1_65 = L1_65 - A0_64.enemyDeadNum
    return L1_65
  end
}
enmgen2_a07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_a7_01",
      name = "enemy_a7_01"
    },
    {
      type = "mechsmall",
      locator = "locator_a7_02",
      name = "enemy_a7_02"
    },
    {
      type = "officer_launcher",
      locator = "locator_a7_01",
      name = "enemy_a7_21",
      target_vehicle = "enemy_a7_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_a7_02",
      name = "enemy_a7_22",
      target_vehicle = "enemy_a7_02"
    }
  },
  onUpdate = function(A0_66)
    local L1_67
  end,
  onEnter = function(A0_68)
    local L1_69
  end,
  onLeave = function(A0_70)
    local L1_71
  end,
  onObjectAsh = function(A0_72, A1_73)
    A0_72:getSpecTable().enemyDeadNum = A0_72:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_74)
    return #A0_74.spawnSet
  end,
  getEnemyRest = function(A0_75)
    local L1_76
    L1_76 = A0_75.spawnSet
    L1_76 = #L1_76
    L1_76 = L1_76 - A0_75.enemyDeadNum
    return L1_76
  end
}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_a_02")
  shiphandle = mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15")
  shiphandle:setDriftEnable(false)
  shiphandle:loadMotionFileAsset("po_a_15_loc_top_02")
  print("aa")
end
function Ingame()
  local L0_77, L1_78, L2_79, L3_80, L4_81, L5_82
  L0_77 = Fn_sendEventComSb
  L1_78 = "move_area_po_a_15"
  L0_77(L1_78)
  L0_77 = Fn_sendEventComSb
  L1_78 = "levelset"
  L0_77(L1_78)
  repeat
    L0_77 = wait
    L0_77()
    L0_77 = Fn_sendEventComSb
    L1_78 = "warp_po_a_15"
    L0_77 = L0_77(L1_78)
  until L0_77
  L0_77 = findGameObject2
  L1_78 = "EnemyGenerator"
  L0_77 = L0_77(L1_78, L2_79)
  if L0_77 ~= nil then
    L1_78 = L0_77.requestSpawn
    L1_78(L2_79)
  end
  L1_78 = _enemy_max
  L1_78 = L1_78 + L2_79
  _enemy_max = L1_78
  L1_78 = _enemy_cnt
  L1_78 = L1_78 + L2_79
  _enemy_cnt = L1_78
  L1_78 = L0_77.requestIdlingEnemy
  L1_78(L2_79, L3_80)
  L1_78 = {}
  for L5_82 = 1, 4 do
    L1_78[L5_82] = findGameObject2("Node", "pccubesensor2_a_" .. string.format("%02d", L5_82))
  end
  L2_79(L3_80, L4_81)
  L2_79(L3_80, L4_81)
  L2_79(L3_80)
  L2_79(L3_80)
  L2_79()
  L2_79(L3_80, L4_81)
  L2_79(L3_80)
  L2_79(L3_80)
  L2_79(L3_80, L4_81)
  enemy_count = L2_79
  while true do
    if L2_79 > 0 then
      if L2_79 < 3 then
        if not L2_79 then
          if L2_79 < 15 then
            if L2_79 ~= nil then
              L3_80(L4_81)
              L5_82 = L4_81
              _enemy_max = L3_80
              L5_82 = L4_81
              _enemy_cnt = L3_80
            end
            L3_80(L4_81)
            enemy_count = L3_80
          end
        elseif not L2_79 then
          if L2_79 < 12 then
            if L2_79 ~= nil then
              L3_80(L4_81)
              L5_82 = L4_81
              _enemy_max = L3_80
              L5_82 = L4_81
              _enemy_cnt = L3_80
            end
            L3_80(L4_81)
            enemy_count = L3_80
          end
        elseif not L2_79 then
          if L2_79 < 15 then
            if L2_79 ~= nil then
              L3_80(L4_81)
              L5_82 = L4_81
              _enemy_max = L3_80
              L5_82 = L4_81
              _enemy_cnt = L3_80
            end
            L3_80(L4_81)
            enemy_count = L3_80
          end
        end
      end
      L2_79()
    end
  end
  L2_79(L3_80)
  L2_79(L3_80, L4_81)
  L2_79()
  L2_79(L3_80)
  if L2_79 ~= nil then
    L3_80(L4_81)
  end
  L3_80(L4_81)
  L5_82 = 30
  L3_80(L4_81, L5_82, 15)
  L3_80(L4_81)
  L3_80(L4_81)
  L3_80()
  L5_82 = 0
  L3_80(L4_81, L5_82)
  L3_80()
  L3_80()
  L5_82 = true
  L3_80(L4_81, L5_82)
  L3_80(L4_81)
  L5_82 = "sm95_info_01"
  L3_80(L4_81, L5_82, true, 15)
  L5_82 = "sm95_point02"
  L3_80(L4_81, L5_82)
  L3_80(L4_81)
  L3_80()
  L5_82 = "enmgen2_a_06"
  if L3_80 ~= nil then
    L5_82 = L3_80
    L4_81(L5_82)
  end
  L5_82 = enmgen2_a06
  L4_81(L5_82)
  L5_82 = L4_81
  L4_81(L5_82)
  L4_81()
  L4_81()
  L4_81()
  L4_81()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_a_01_OnEnter(A0_83)
  _next_phase = true
  Fn_naviKill()
  A0_83:setActive(false)
end
function pccubesensor2_a_02_OnEnter(A0_84)
  _next_phase = true
  Fn_naviKill()
  A0_84:setActive(false)
end
function pccubesensor2_a_03_OnEnter(A0_85)
  _next_phase = true
  Fn_naviKill()
  A0_85:setActive(false)
end
function pccubesensor2_a_04_OnEnter(A0_86)
  _next_phase = true
  Fn_naviKill()
  A0_86:setActive(false)
end
function pccubesensor2_a_05_OnEnter(A0_87)
  _next_phase = true
  Fn_naviKill()
  A0_87:setActive(false)
end
function pccubesensor2_a_06_OnEnter(A0_88)
  _next_phase = true
  Fn_naviKill()
  A0_88:setActive(false)
end
function pccubesensor2_a_07_OnEnter(A0_89)
  _next_phase = true
  Fn_naviKill()
  A0_89:setActive(false)
end
function navi_on()
  local L0_90, L1_91
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function NaviSet_Auto(A0_92, A1_93, A2_94)
  Fn_naviSet(A0_92)
  if A1_93 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_93)
    HUD:naviSetPochiDistanceDensity0(A2_94)
  end
  Sound:pulse("navi_set")
end
function enemy_set(A0_95)
  enemy_count = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. A0_95:getEnemyRest() .. "/" .. A0_95:getEnemyMax())
      wait()
    end
  end)
  while A0_95:getEnemyRest() > 0 do
    wait()
  end
  enemy_count:abort()
end
function move_area_po_a_15()
  Fn_getPlayer():setCollidable(false)
  Time:setInGameDeltaSec(0)
  wait()
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15"):setWorldTransform(findGameObject2("Node", "locator2_po_a_15"):getWorldTransform())
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_15"):setForceMove()
  wait()
  Time:resetInGameDeltaSec()
  wait()
  Fn_getPlayer():setCollidable(true)
end
function auto_caption(A0_96, A1_97)
  local L2_98, L3_99
  L2_98 = false
  L3_99 = {}
  if A0_96 == nil then
    A0_96 = 0
  end
  auto_cap = invokeTask(function()
    repeat
      waitSeconds(1)
      A1_97 = A1_97 + 1
      if A1_97 > 20 then
        L3_99[0] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("attack")
          end
        end
        L3_99[1] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("gravitykick")
          end
        end
        L3_99[2] = function()
          Fn_tutorialCaptionKill()
          if not Fn_isCaptionView() then
            Fn_tutorialCaption("grab")
          end
          A0_96 = A0_96 - 3
        end
        L3_99[A0_96]()
        A0_96 = A0_96 + 1
        A1_97 = 0
      end
      wait()
    until L2_98 == true
  end)
end
