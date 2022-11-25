dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_GAMEOVER_NEAR_GRIGO_CNT = 4
ENEMY_NEAR_JUDGE_DIST = 5
_puppet_tbl = {}
_sdemo1 = nil
_sdemo2 = nil
_GRIGO_ORUDO_MAX_CNT = 20
_POLICE_ORUDO_MAX_CNT = 20
_PEOPLE_ORUDO_MAX_CNT = 5
_GRIGO_MAX_CNT = 20
_POLICE_MAX_CNT = 20
_PEOPLE_MAX_CNT = 5
_GRIGO_ORUDO_NAME = "grigo_orudo_"
_POLICE_ORUDO_NAME = "police_orudo_"
_PEOPLE_ORUDO_NAME = "people_orudo_"
_GRIGO_NAME = "grigo_"
_POLICE_NAME = "police_"
_PEOPLE_NAME = "people_"
_infinity_task = {}
_gameover = false
_check_gameover_task = nil
_isPanic = false
_enm_ash = false
_in_orudo = true
_in_yumemi = false
enmgen2_mob_to_enemy_ordo_02 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_01",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_02",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_03",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_04",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_05",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_06",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_07",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_08",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_09",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_10",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_11",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_12",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_13",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_14",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_15",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_16",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_17",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_18",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_19",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_20",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_01",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_02",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_03",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_04",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_05",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_06",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_07",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_08",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_09",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_10",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_11",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_12",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_13",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_14",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_15",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_16",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_17",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_18",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_19",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_20",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_orudo_01",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_orudo_02",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_orudo_03",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_orudo_04",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_orudo_05",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    print("*************\231\181\130\227\130\143\227\129\163\227\129\159")
  end,
  onSpawn = function(A0_5, A1_6)
  end,
  onObjectAsh = function(A0_7, A1_8)
    _enm_ash = true
  end,
  onObjectDead = function(A0_9, A1_10)
    print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140onObjectDead\227\129\160\227\130\136\239\188\129\239\188\129\239\188\129\239\188\129")
  end
}
enmgen2_mob_to_enemy_02 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_01",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_02",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_03",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_04",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_05",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_06",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_07",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_08",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_09",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_10",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_11",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_12",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_13",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_14",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_15",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_16",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_17",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_18",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_19",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_20",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_01",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_02",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_03",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_04",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_05",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_06",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_07",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_08",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_09",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_10",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_11",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_12",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_13",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_14",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_15",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_16",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_17",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_18",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_19",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_20",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_01",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_02",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_03",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_04",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_05",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
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
  onSpawn = function(A0_17, A1_18)
  end,
  onObjectAsh = function(A0_19, A1_20)
    _enm_ash = true
  end,
  onObjectDead = function(A0_21, A1_22)
  end
}
function Initialize()
  local L0_23
  L0_23 = {
    {
      name = "npcgen2_bit_01",
      type = "bit02",
      node = "locator2_bit_b_01",
      reset = false
    }
  }
  npc = Fn_findNpc("couple01")
  Fn_setupNpc(L0_23)
  for _FORV_4_, _FORV_5_ in pairs(L0_23) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Mob:restrict_ep17_00(true)
  _sdemo1 = SDemo.create("ep17_b_1")
  _sdemo2 = SDemo.create("ep17_b_2")
end
function Ingame()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30
  L0_24 = Mob
  L1_25 = L0_24
  L0_24 = L0_24.makeSituationPanic
  L2_26 = false
  L0_24(L1_25, L2_26)
  _isPanic = false
  L0_24 = Mob
  L1_25 = L0_24
  L0_24 = L0_24.topUpHatchery
  L0_24(L1_25)
  L0_24 = Fn_setCatWarpCheckPoint
  L1_25 = "locator2_pc_start_pos"
  L0_24(L1_25)
  L0_24 = anoterCatWarp
  L0_24()
  function L0_24(A0_31)
    local L1_32, L2_33
    L1_32 = A0_31.name
    L2_33 = A0_31.attacker
    print(L1_32 .. "\227\129\140" .. L2_33 .. "\227\129\171\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159 getHealth\239\188\154", findGameObject2("EnemyBrain", L1_32):getHealth())
    if findGameObject2("EnemyBrain", L1_32):getHealth() <= 0 and L2_33 == "player" and (string.find(L1_32, "police") ~= nil or string.find(L1_32, "people") ~= nil or string.find(L1_32, "grigo") ~= nil) and not isGameOver() then
      invokeTask(function()
        setGameOver(true)
        Fn_captionViewWait("ep17_00107")
        Fn_scriptGameOver(true)
        print("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\229\135\166\231\144\134\239\188\154_gameover = ", _gameover)
        Mob:makeSituationPanic(false)
        _isPanic = false
        Mob:topUpHatchery()
        print("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\231\155\180\229\190\140\239\188\154\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164\239\188\134\227\131\162\227\131\150\229\190\169\230\180\187")
      end)
    end
    return A0_31
  end
  L1_25 = findGameObject2
  L2_26 = "EnemyGenerator"
  L3_27 = "enmgen2_mob_to_enemy_ordo_02"
  L1_25 = L1_25(L2_26, L3_27)
  L2_26 = findGameObject2
  L3_27 = "EnemyGenerator"
  L4_28 = "enmgen2_mob_to_enemy_02"
  L2_26 = L2_26(L3_27, L4_28)
  L4_28 = L1_25
  L3_27 = L1_25.setEventListener
  L5_29 = "DamageEnemyReport"
  L6_30 = L0_24
  L3_27(L4_28, L5_29, L6_30)
  L4_28 = L2_26
  L3_27 = L2_26.setEventListener
  L5_29 = "DamageEnemyReport"
  L6_30 = L0_24
  L3_27(L4_28, L5_29, L6_30)
  L3_27 = start_game_obj
  L3_27()
  L3_27 = Fn_missionStart
  L3_27()
  L3_27 = checkGameOverGrigo
  L3_27()
  L3_27 = removeFarEnemy
  L4_28 = 50
  L3_27(L4_28)
  L3_27 = checkMobPanic
  L4_28 = 5
  L5_29 = 29
  L3_27(L4_28, L5_29)
  L3_27 = checkEnemyMarker
  L3_27()
  L3_27 = Player
  L4_28 = L3_27
  L3_27 = L3_27.setStay
  L5_29 = false
  L3_27(L4_28, L5_29)
  L3_27 = Fn_userCtrlOn
  L3_27()
  L3_27 = invokeTask
  function L4_28()
    while not Fn_sendEventComSb("checkMissionRetry") do
      wait()
    end
    Fn_sendEventComSb("resetMissionRetry")
    mission_retry()
  end
  L3_27(L4_28)
  L3_27 = Fn_sendEventComSb
  L4_28 = "requestSection"
  L5_29 = "b1"
  L3_27(L4_28, L5_29)
  L3_27 = waitComNextPhase
  L3_27()
  L3_27 = false
  L4_28 = invokeTask
  function L5_29()
    while true do
      if Fn_isInSightTarget(_puppet_tbl.npcgen2_bit_01, 1.4) == false then
        Fn_setNpcActive("npcgen2_bit_01", false)
        L3_27 = true
        print("\226\152\133bit_off =", L3_27)
        break
      end
      wait()
    end
  end
  L4_28 = L4_28(L5_29)
  L5_29 = Fn_missionView
  L6_30 = "ep17_01000"
  L5_29(L6_30)
  L5_29 = waitSeconds
  L6_30 = 1.3
  L5_29(L6_30)
  L5_29 = Fn_naviSet
  L6_30 = findGameObject2
  L6_30 = L6_30("Node", "locator2_navi_yumemi_01")
  L5_29(L6_30, L6_30("Node", "locator2_navi_yumemi_01"))
  while L3_27 == false do
    L5_29 = wait
    L5_29()
  end
  L5_29 = invokeTask
  function L6_30()
    local L0_34, L1_35, L2_36
    while true do
      L0_34 = Fn_getDistanceToPlayer
      L1_35 = _puppet_tbl
      L1_35 = L1_35.npcgen2_bit_01
      L0_34 = L0_34(L1_35)
      L1_35 = Mv_raycastCameraSight
      L2_36 = _puppet_tbl
      L2_36 = L2_36.npcgen2_bit_01
      L1_35 = L1_35(L2_36, 50, nil, Vector(0, 0.8, 0), 1.2)
      if L1_35 then
        L2_36 = Mv_viewObj
        L2_36 = L2_36(_puppet_tbl.npcgen2_bit_01, 0.3, 1.5)
        Fn_captionViewWait("ep17_01001")
        L2_36 = Mv_safeTaskAbort(L2_36)
        break
      end
      L2_36 = wait
      L2_36()
    end
  end
  L5_29 = L5_29(L6_30)
  L6_30 = Mv_waitPhase
  L6_30()
  L6_30 = Mv_safeTaskAbort
  L6_30 = L6_30(L5_29)
  L5_29 = L6_30
  L6_30 = Fn_disappearNpc
  L6_30("npcgen2_bit_01")
  L6_30 = Mob
  L6_30 = L6_30.makeSituationPanic
  L6_30(L6_30, true)
  L6_30 = Fn_killChangeMob
  L6_30()
  L6_30 = Mv_safeTaskAbort
  L6_30 = L6_30(_check_gameover_task)
  _check_gameover_task = L6_30
  L6_30 = Fn_setCatWarpCheckPoint
  L6_30("locator2_navi_yumemi_01")
  L6_30 = Fn_userCtrlOff
  L6_30()
  L6_30 = Fn_coercionGravityRevert
  L6_30()
  L6_30 = HUD
  L6_30 = L6_30.blackout
  L6_30(L6_30, 2)
  L6_30 = waitSeconds
  L6_30(2)
  function L6_30()
    HUD:fadein(2)
    Fn_resetPcPos("locator2_sdemo2_pc")
    L2_26:requestAllEnemyKill()
    Fn_sendEventComSb("requestSection", "b2")
  end
  Fn_kaiwaDemoView2("ep17_00230k", L6_30)
  waitSeconds(1)
  _sdemo2:set("locator2_sdemo2_camera", "locator2_sdemo2_target", false)
  _sdemo2:play()
  waitSeconds(2)
  Fn_kaiwaDemoView("ep17_00240k")
  _sdemo2:stop()
  Fn_userCtrlOn()
  Mv_gotoNextPhase()
  Mv_waitPhase()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:restrict_ep17_00(false)
end
function pccubesensor2_orudo_area_01_OnEnter()
  _in_orudo = true
  Fn_killChangeMob()
  Fn_createChangeMobToEnemy("enmgen2_mob_to_enemy_ordo_02", {
    grigo = true,
    range = 30,
    time = 0.5,
    degree = 90
  })
  print("\227\131\151\227\131\172\227\130\184\227\131\165\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\231\160\180\230\163\132\239\188\134\227\130\170\227\131\171\227\131\137\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\233\150\139\229\167\139")
end
function pccubesensor2_orudo_area_01_OnLeave()
  _in_orudo = false
  Fn_killChangeMob()
  Fn_createChangeMobToEnemy("enmgen2_mob_to_enemy_02", {
    grigo = true,
    range = 30,
    time = 0.5,
    degree = 90
  })
  print("\227\130\170\227\131\171\227\131\137\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\231\160\180\230\163\132\239\188\134\227\131\151\227\131\172\227\130\184\227\131\165\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\233\150\139\229\167\139")
end
function pccubesensor2_yumemi_area_01_OnEnter()
  _in_yumemi = true
  Fn_killChangeMob()
  print("\226\151\134\229\174\137\229\133\168\229\156\143\239\188\154\227\131\151\227\131\172\227\130\184\227\131\165\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\231\160\180\230\163\132\239\188\129\239\188\129\239\188\129")
end
function pccubesensor2_yumemi_area_01_OnLeave()
  _in_yumemi = false
  Fn_createChangeMobToEnemy("enmgen2_mob_to_enemy_02", {
    grigo = true,
    range = 30,
    time = 0.5,
    degree = 90
  })
  print("\226\151\134\227\131\151\227\131\172\227\130\184\227\131\165\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\233\150\139\229\167\139\239\188\129\239\188\129")
end
function pccubesensor2_yumemi_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_yumemi_01")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_ed_root_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_ed_root_01")
end
function pccubesensor2_warp_warning_02_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep17_09040", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_02_OnLeave()
  runCatWarp()
end
function getEnemyDistance(A0_37)
  local L1_38, L2_39
  L1_38 = findGameObject2
  L2_39 = "Puppet"
  L1_38 = L1_38(L2_39, A0_37)
  L2_39 = 99999
  if L1_38 ~= nil then
    L2_39 = Fn_getDistanceToPlayer(L1_38)
  end
  return L2_39
end
function removeFarAndNotInSight(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46
  L2_42 = findGameObject2
  L3_43 = "Puppet"
  L4_44 = A0_40
  L2_42 = L2_42(L3_43, L4_44)
  L3_43 = -1
  if L2_42 ~= nil then
    L4_44 = Mv_raycastCameraSight
    L5_45 = L2_42
    L4_44 = L4_44(L5_45)
    L5_45 = Fn_getDistanceToPlayer
    L6_46 = L2_42
    L5_45 = L5_45(L6_46)
    L3_43 = L5_45
    if A1_41 <= L3_43 and L4_44 == false then
      L6_46 = L2_42
      L5_45 = L2_42.getBrain
      L5_45 = L5_45(L6_46)
      L6_46 = L5_45.isReadyEnemy
      L6_46 = L6_46(L5_45)
      if L6_46 then
        L6_46 = nil
        if string.find(A0_40, "orudo") == nil then
          L6_46 = "enmgen2_mob_to_enemy_02"
        elseif string.find(A0_40, "orudo") ~= nil then
          L6_46 = "enmgen2_mob_to_enemy_ordo_02"
          print("\227\130\170\227\131\171\227\131\137\227\131\142\227\131\175")
        end
        findGameObject2("EnemyGenerator", L6_46):requestEnemyKill(L5_45)
        print("\227\130\168\227\131\141\227\131\159\227\131\188\233\129\160\227\129\132\227\129\139\227\129\164\227\130\171\227\131\161\227\131\169\229\164\150\227\129\170\227\129\174\227\129\167\227\130\173\227\131\171\239\188\154", A0_40)
      end
    end
  end
end
function checkGameOverGrigo()
  if _check_gameover_task ~= nil then
    return
  end
  _check_gameover_task = invokeTask(function()
    local L0_47, L1_48, L2_49, L3_50, L4_51
    L0_47 = 0
    while true do
      if L1_48 == false then
        for L4_51 = 1, _GRIGO_MAX_CNT do
          if getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L4_51)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L4_51)) ~= -1 then
            L0_47 = L0_47 + 1
          end
          wait()
        end
        for L4_51 = 1, _POLICE_MAX_CNT do
          if getEnemyDistance(_POLICE_NAME .. string.format("%02d", L4_51)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance(_POLICE_NAME .. string.format("%02d", L4_51)) ~= -1 then
            L0_47 = L0_47 + 1
          end
          wait()
        end
      elseif L1_48 then
        for L4_51 = 1, _GRIGO_ORUDO_MAX_CNT do
          if getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L4_51)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L4_51)) ~= -1 then
            L0_47 = L0_47 + 1
          end
          wait()
        end
        for L4_51 = 1, _POLICE_ORUDO_MAX_CNT do
          if getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L4_51)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L4_51)) ~= -1 then
            L0_47 = L0_47 + 1
          end
          wait()
        end
      end
      if L0_47 >= L1_48 then
        L1_48()
        break
      end
      L0_47 = 0
      L1_48()
    end
  end)
end
function removeFarEnemy(A0_52)
  invokeTask(function()
    local L0_53, L1_54, L2_55, L3_56, L4_57
    while true do
      for L3_56 = 1, _GRIGO_MAX_CNT do
        L4_57 = _GRIGO_NAME
        L4_57 = L4_57 .. string.format("%02d", L3_56)
        removeFarAndNotInSight(L4_57, A0_52)
        wait()
      end
      for L3_56 = 1, _POLICE_MAX_CNT do
        L4_57 = _POLICE_NAME
        L4_57 = L4_57 .. string.format("%02d", L3_56)
        removeFarAndNotInSight(L4_57, A0_52)
        wait()
      end
      for L3_56 = 1, _PEOPLE_MAX_CNT do
        L4_57 = _PEOPLE_NAME
        L4_57 = L4_57 .. string.format("%02d", L3_56)
        removeFarAndNotInSight(L4_57, A0_52)
        wait()
      end
      for L3_56 = 1, _GRIGO_ORUDO_MAX_CNT do
        L4_57 = _GRIGO_ORUDO_NAME
        L4_57 = L4_57 .. string.format("%02d", L3_56)
        removeFarAndNotInSight(L4_57, A0_52)
        wait()
      end
      for L3_56 = 1, _POLICE_ORUDO_MAX_CNT do
        L4_57 = _POLICE_ORUDO_NAME
        L4_57 = L4_57 .. string.format("%02d", L3_56)
        removeFarAndNotInSight(L4_57, A0_52)
        wait()
      end
      for L3_56 = 1, _PEOPLE_ORUDO_MAX_CNT do
        L4_57 = _PEOPLE_ORUDO_NAME
        L4_57 = L4_57 .. string.format("%02d", L3_56)
        removeFarAndNotInSight(L4_57, A0_52)
        wait()
      end
      L0_53()
    end
  end)
end
function checkMobPanic(A0_58, A1_59)
  invokeTask(function()
    local L0_60, L1_61, L2_62, L3_63, L4_64
    while true do
      L0_60 = 9999
      if L1_61 == false then
        for L4_64 = 1, _GRIGO_MAX_CNT do
          if getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L4_64)) ~= -1 and L0_60 > getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L4_64)) then
            L0_60 = getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L4_64))
          end
          wait()
        end
        for L4_64 = 1, _POLICE_MAX_CNT do
          if getEnemyDistance(_POLICE_NAME .. string.format("%02d", L4_64)) ~= -1 and L0_60 > getEnemyDistance(_POLICE_NAME .. string.format("%02d", L4_64)) then
            L0_60 = getEnemyDistance(_POLICE_NAME .. string.format("%02d", L4_64))
          end
          wait()
        end
        for L4_64 = 1, _PEOPLE_MAX_CNT do
          if getEnemyDistance(_PEOPLE_NAME .. string.format("%02d", L4_64)) ~= -1 and L0_60 > getEnemyDistance(_PEOPLE_NAME .. string.format("%02d", L4_64)) then
            L0_60 = getEnemyDistance(_PEOPLE_NAME .. string.format("%02d", L4_64))
          end
          wait()
        end
      elseif L1_61 then
        for L4_64 = 1, _GRIGO_ORUDO_MAX_CNT do
          if getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L4_64)) ~= -1 and L0_60 > getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L4_64)) then
            L0_60 = getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L4_64))
          end
          wait()
        end
        for L4_64 = 1, _POLICE_ORUDO_MAX_CNT do
          if getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L4_64)) ~= -1 and L0_60 > getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L4_64)) then
            L0_60 = getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L4_64))
          end
          wait()
        end
        for L4_64 = 1, _PEOPLE_ORUDO_MAX_CNT do
          if getEnemyDistance(_PEOPLE_ORUDO_NAME .. string.format("%02d", L4_64)) ~= -1 and L0_60 > getEnemyDistance(_PEOPLE_ORUDO_NAME .. string.format("%02d", L4_64)) then
            L0_60 = getEnemyDistance(_PEOPLE_ORUDO_NAME .. string.format("%02d", L4_64))
          end
          wait()
        end
      end
      if L0_60 < L1_61 then
        if not L1_61 then
          L1_61(L2_62, L3_63)
          L1_61(L2_62, L3_63)
          L1_61(L2_62)
          _isPanic = true
        end
      elseif L0_60 > L1_61 then
        if L1_61 then
          L1_61(L2_62, L3_63)
          L1_61(L2_62, L3_63)
          _isPanic = false
          L1_61(L2_62)
          L1_61(L2_62)
          L1_61(L2_62)
        end
      end
      L1_61()
    end
  end)
end
function setEnemyMarker(A0_65, A1_66)
  if findGameObject2("Puppet", A0_65) ~= nil and findGameObject2("Puppet", A0_65):getBrain() ~= nil then
    findGameObject2("Puppet", A0_65):getBrain():setVisibleEnemyMarker(A1_66)
  end
end
function checkEnemyMarker()
  invokeTask(function()
    while true do
      if _in_orudo == false then
        invokeTask(function()
          local L0_67, L1_68, L2_69, L3_70
          for L3_70 = 1, _GRIGO_MAX_CNT do
            setEnemyMarker(_GRIGO_NAME .. string.format("%02d", L3_70), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_71, L1_72, L2_73, L3_74
          for L3_74 = 1, _POLICE_MAX_CNT do
            setEnemyMarker(_POLICE_NAME .. string.format("%02d", L3_74), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_75, L1_76, L2_77, L3_78
          for L3_78 = 1, _PEOPLE_MAX_CNT do
            setEnemyMarker(_PEOPLE_NAME .. string.format("%02d", L3_78), false)
            wait()
          end
        end)
      elseif _in_orudo then
        invokeTask(function()
          local L0_79, L1_80, L2_81, L3_82
          for L3_82 = 1, _GRIGO_ORUDO_MAX_CNT do
            setEnemyMarker(_GRIGO_ORUDO_NAME .. string.format("%02d", L3_82), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_83, L1_84, L2_85, L3_86
          for L3_86 = 1, _POLICE_ORUDO_MAX_CNT do
            setEnemyMarker(_POLICE_ORUDO_NAME .. string.format("%02d", L3_86), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_87, L1_88, L2_89, L3_90
          for L3_90 = 1, _PEOPLE_ORUDO_MAX_CNT do
            setEnemyMarker(_PEOPLE_ORUDO_NAME .. string.format("%02d", L3_90), false)
            wait()
          end
        end)
      end
      wait()
    end
  end)
end
function GrigoGameOver()
  invokeTask(function()
    local L0_91, L1_92, L2_93, L3_94, L4_95, L5_96, L6_97, L7_98
    L0_91 = isGameOver
    L0_91 = L0_91()
    if L0_91 then
      return
    end
    L0_91 = setGameOver
    L1_92 = true
    L0_91(L1_92)
    L0_91 = Fn_coercionGravityRevert
    L0_91()
    L0_91 = Fn_userCtrlAllOff
    L0_91()
    L0_91 = Fn_coercionPoseNomal
    L0_91()
    L0_91 = Mob
    L1_92 = L0_91
    L0_91 = L0_91.makeSituationPanic
    L2_93 = false
    L0_91(L1_92, L2_93)
    _isPanic = false
    L0_91 = 1
    L1_92 = 0
    L2_93 = nil
    L3_94 = _in_orudo
    if L3_94 then
      L3_94 = getEnemyDistance
      L7_98 = 1
      L3_94 = L3_94(L4_95)
      for L7_98 = 2, _GRIGO_ORUDO_MAX_CNT do
        if L3_94 > getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L7_98)) then
          L3_94 = getEnemyDistance(_GRIGO_ORUDO_NAME .. string.format("%02d", L7_98))
          L0_91 = L7_98
        end
      end
      for L7_98 = 1, _POLICE_ORUDO_MAX_CNT do
        if L3_94 > getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L7_98)) then
          L3_94 = getEnemyDistance(_POLICE_ORUDO_NAME .. string.format("%02d", L7_98))
          L1_92 = L7_98
        end
      end
      if L1_92 <= 0 then
        L7_98 = L0_91
        L2_93 = L4_95 .. L5_96
      else
        L7_98 = L1_92
        L2_93 = L4_95 .. L5_96
      end
    else
      L3_94 = _in_orudo
      if L3_94 then
        L3_94 = getEnemyDistance
        L7_98 = 1
        L3_94 = L3_94(L4_95)
        for L7_98 = 2, _GRIGO_MAX_CNT do
          if L3_94 > getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L7_98)) then
            L3_94 = getEnemyDistance(_GRIGO_NAME .. string.format("%02d", L7_98))
            L0_91 = L7_98
          end
        end
        for L7_98 = 1, _POLICE_MAX_CNT do
          if L3_94 > getEnemyDistance(_POLICE_NAME .. string.format("%02d", L7_98)) then
            L3_94 = getEnemyDistance(_POLICE_NAME .. string.format("%02d", L7_98))
            L1_92 = L7_98
          end
        end
        if L1_92 <= 0 then
          L7_98 = L0_91
          L2_93 = L4_95 .. L5_96
        else
          L7_98 = L1_92
          L2_93 = L4_95 .. L5_96
        end
      end
    end
    if L2_93 ~= nil then
      L3_94 = findGameObject2
      L3_94 = L3_94(L4_95, L5_96)
      if L3_94 ~= nil then
        L7_98 = 1.5
        L4_95(L5_96, L6_97, L7_98)
      end
    end
    L3_94 = Fn_captionViewWait
    L3_94(L4_95)
    L3_94 = Fn_scriptGameOver
    L3_94(L4_95)
    L3_94 = Mob
    L3_94 = L3_94.topUpHatchery
    L3_94(L4_95)
    L3_94 = print
    L3_94(L4_95)
  end)
end
function isGameOver()
  local L0_99, L1_100
  L0_99 = _gameover
  return L0_99
end
function setGameOver(A0_101)
  local L1_102
  _gameover = A0_101
end
