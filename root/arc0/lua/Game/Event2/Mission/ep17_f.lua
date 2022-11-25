dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
EP17F_VOICE_NUM = 3
KALI_VOICE_TIME = 30
_caption_queue = nil
_KALI_HEALTH_NEXT_HEALTH = 70
_GRIGO_RESPAWN_TIME = 10
_grigo_cnt = 0
enmgen2_ep17_f_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_ene_f_01",
      name = "kali01",
      ai_spawn_option = "Kali/kali_ep17_f"
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
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_ep17_f_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  grigoCameraOutsideSpawnMode = false,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_ene_f_101",
      name = "bot101",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    },
    {
      type = "grigo",
      locator = "locator_ene_f_102",
      name = "bot102",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    },
    {
      type = "grigo",
      locator = "locator_ene_f_103",
      name = "bot103",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
    _grigo_cnt = _grigo_cnt + 1
    print("\227\130\171\227\131\188\227\131\170\227\130\163\229\155\178\227\129\191\227\130\176\227\131\170\227\130\180\227\130\185\227\131\157\227\131\188\227\131\179\239\188\129\239\188\129\239\188\129")
    if findGameObject2("EnemyBrain", A1_19:getName()) ~= nil then
      findGameObject2("EnemyBrain", A1_19:getName()):setEnableHomingTarget(false)
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\239\188\154", findGameObject2("EnemyBrain", A1_19:getName()):getName())
    else
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\229\164\177\230\149\151\239\188\154", findGameObject2("EnemyBrain", A1_19:getName()):getName())
    end
  end,
  onObjectAsh = function(A0_20, A1_21)
    _grigo_cnt = _grigo_cnt - 1
  end,
  onObjectDead = function(A0_22, A1_23)
  end
}
enmgen2_ep17_f_grigo_autorebirth_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 10,
  grigoCameraOutsideSpawnMode = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_autorebirth_01",
      name = "autorebirth_bot01",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    },
    {
      type = "grigo",
      locator = "locator_autorebirth_02",
      name = "autorebirth_bot02",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    },
    {
      type = "grigo",
      locator = "locator_autorebirth_03",
      name = "autorebirth_bot03",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    },
    {
      type = "grigo",
      locator = "locator_autorebirth_04",
      name = "autorebirth_bot04",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onSpawn = function(A0_30, A1_31)
    local L2_32
    L2_32 = print
    L2_32("\227\130\176\227\131\170\227\130\180\227\130\185\227\131\157\227\131\188\227\131\179\239\188\129\239\188\154", A1_31:getName())
    L2_32 = findGameObject2
    L2_32 = L2_32("EnemyBrain", A1_31:getName())
    if L2_32 ~= nil then
      L2_32:setEnableHomingTarget(false)
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\239\188\154", L2_32:getName())
    else
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\229\164\177\230\149\151\239\188\154", L2_32:getName())
    end
  end,
  onObjectAsh = function(A0_33, A1_34)
  end,
  onObjectDead = function(A0_35, A1_36)
  end
}
function Initialize()
  local L0_37, L1_38
end
function Ingame()
  local L0_39, L1_40, L2_41, L3_42, L4_43, L5_44, L6_45, L7_46
  L0_39 = Fn_setCatWarpCheckPoint
  L1_40 = "locator2_pc_start_pos"
  L0_39(L1_40)
  L0_39 = anoterCatWarp
  L0_39()
  L0_39 = Queue
  L0_39 = L0_39.new
  L0_39 = L0_39()
  _caption_queue = L0_39
  L0_39 = invokeTask
  function L1_40()
    local L0_47
    while true do
      L0_47 = _caption_queue
      L0_47 = L0_47.isEmpty
      L0_47 = L0_47(L0_47)
      if not L0_47 then
        L0_47 = _caption_queue
        L0_47 = L0_47.dequeue
        L0_47 = L0_47(L0_47)
        if L0_47 ~= nil then
          L0_47()
        end
      end
      L0_47 = wait
      L0_47()
    end
  end
  L0_39 = L0_39(L1_40)
  L1_40 = findGameObject2
  L2_41 = "EnemyGenerator"
  L3_42 = "enmgen2_ep17_f_02"
  L1_40 = L1_40(L2_41, L3_42)
  L2_41 = findGameObject2
  L3_42 = "EnemyGenerator"
  L4_43 = "enmgen2_ep17_f_grigo_autorebirth_01"
  L2_41 = L2_41(L3_42, L4_43)
  L4_43 = L1_40
  L3_42 = L1_40.setEnemyMarker
  L5_44 = false
  L3_42(L4_43, L5_44)
  L4_43 = L2_41
  L3_42 = L2_41.setEnemyMarker
  L5_44 = false
  L3_42(L4_43, L5_44)
  L3_42 = findGameObject2
  L4_43 = "EnemyGenerator"
  L5_44 = "enmgen2_ep17_f_01"
  L3_42 = L3_42(L4_43, L5_44)
  while true do
    L5_44 = L3_42
    L4_43 = L3_42.isSpawnOnStartFinished
    L4_43 = L4_43(L5_44)
    if L4_43 == false then
      L4_43 = wait
      L4_43()
    end
  end
  L4_43 = findGameObject2
  L5_44 = "EnemyBrain"
  L6_45 = "kali01"
  L4_43 = L4_43(L5_44, L6_45)
  L6_45 = L4_43
  L5_44 = L4_43.setVisibleBossMarker
  L7_46 = true
  L5_44(L6_45, L7_46)
  while true do
    L6_45 = L1_40
    L5_44 = L1_40.isSpawnOnStartFinished
    L5_44 = L5_44(L6_45)
    if L5_44 == false then
      L5_44 = wait
      L5_44()
    end
  end
  L5_44 = Fn_missionStart
  L5_44()
  L5_44 = Fn_missionView
  L6_45 = "ep17_05000"
  L5_44(L6_45)
  L5_44 = Fn_userCtrlOn
  L5_44()
  L5_44 = invokeTask
  function L6_45()
    local L0_48, L1_49, L2_50
    L0_48 = 1
    while true do
      if L0_48 == 0 then
        L1_49 = math
        L1_49 = L1_49.random
        L2_50 = EP17F_VOICE_NUM
        L1_49 = L1_49(L2_50)
        L2_50 = findGameObject2
        L2_50 = L2_50("Puppet", "kali01")
        Sound:playSE("ene_kali_vo_anger_" .. L1_49, 1, L2_50)
      end
      L1_49 = waitSeconds
      L2_50 = 1
      L1_49(L2_50)
      L0_48 = L0_48 + 1
      L1_49 = KALI_VOICE_TIME
      L0_48 = L0_48 % L1_49
    end
  end
  L5_44 = L5_44(L6_45)
  L6_45 = Mob
  L7_46 = L6_45
  L6_45 = L6_45.makeSituationPanic
  L6_45(L7_46, true)
  L6_45 = Area
  L7_46 = L6_45
  L6_45 = L6_45.gravityStorm
  L6_45(L7_46, Vector(256, 108, -25), 200)
  L6_45 = Fn_setBgmPoint
  L7_46 = "event"
  L6_45(L7_46, "boss")
  L6_45 = false
  L7_46 = invokeTask
  L7_46 = L7_46(function()
    local L0_51, L1_52, L2_53
    L0_51 = findGameObject2
    L1_52 = "Puppet"
    L2_53 = "kali01"
    L0_51 = L0_51(L1_52, L2_53)
    L1_52 = findGameObject2
    L2_53 = "Node"
    L1_52 = L1_52(L2_53, "locator2_kali_warp_pos")
    L2_53 = L1_52.getPos
    L2_53 = L2_53(L1_52)
    while true do
      if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
        print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\184\173\239\188\129\239\188\129")
        waitSeconds(3)
        L3_42:requestIdlingEnemy(true)
        L0_51:setPos(L2_53)
        L0_51:setForceMove()
        print("\227\130\171\227\131\188\227\131\170\227\130\163\227\131\175\227\131\188\227\131\151\239\188\129\239\188\129\239\188\129")
        while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
          wait()
        end
        waitSeconds(1.5)
        L3_42:requestIdlingEnemy(false)
      end
      wait()
    end
  end)
  checkKaliHealth(_KALI_HEALTH_NEXT_HEALTH)
  L5_44 = Mv_safeTaskAbort(L5_44)
  L0_39 = Mv_safeTaskAbort(L0_39)
  L7_46 = Mv_safeTaskAbort(L7_46)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
  Area:gravityStorm()
end
function checkKaliHealth(A0_54)
  local L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64
  L1_55 = findGameObject2
  L2_56 = "Puppet"
  L3_57 = "kali01"
  L1_55 = L1_55(L2_56, L3_57)
  L2_56 = findGameObject2
  L3_57 = "EnemyBrain"
  L4_58 = "kali01"
  L2_56 = L2_56(L3_57, L4_58)
  L4_58 = L2_56
  L3_57 = L2_56.getMaxHealth
  L3_57 = L3_57(L4_58)
  L4_58 = L3_57
  L5_59 = 0
  L6_60 = Player
  L7_61 = L6_60
  L6_60 = L6_60.getEnergyMax
  L8_62 = Player
  L8_62 = L8_62.kEnergy_Life
  L6_60 = L6_60(L7_61, L8_62)
  L7_61 = Player
  L8_62 = L7_61
  L7_61 = L7_61.getEnergy
  L9_63 = Player
  L9_63 = L9_63.kEnergy_Life
  L7_61 = L7_61(L8_62, L9_63)
  L8_62 = L7_61
  L9_63 = HUD
  L10_64 = L9_63
  L9_63 = L9_63.createBossHpGauge
  L9_63 = L9_63(L10_64, {obj = L1_55})
  L10_64 = L9_63.setActive
  L10_64(L9_63, true)
  L10_64 = 100
  while L1_55:isRunning() do
    if A0_54 > L2_56:getHealth() / L3_57 * 100 then
      HUD:blackout(0)
      break
    end
    L7_61 = Player:getEnergy(Player.kEnergy_Life)
    if L8_62 > L7_61 then
      if 0 <= 0 then
        if L2_56:getHealth() / L3_57 * 100 < 30 and not ({
          false,
          false,
          false
        })[1] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_05009"))
          ;({
            false,
            false,
            false
          })[1] = true
        elseif L2_56:getHealth() / L3_57 * 100 < 50 and not ({
          false,
          false,
          false
        })[2] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_05001"))
          ;({
            false,
            false,
            false
          })[2] = true
        elseif L2_56:getHealth() / L3_57 * 100 < 90 and not ({
          false,
          false,
          false
        })[3] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_05002"))
          ;({
            false,
            false,
            false
          })[3] = true
        end
      end
    else
      if L8_62 < L7_61 then
        _caption_queue:enqueue(Fn_captionViewWait("ep17_05008"))
      else
      end
    end
    L8_62 = L7_61
    if L4_58 > L2_56:getHealth() then
      L5_59 = L5_59 + (L4_58 - L2_56:getHealth())
      if L10_64 <= 0 then
        if L2_56:getHealth() / L3_57 * 100 < 30 and not ({
          false,
          false,
          false
        })[1] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_05003"))
          ;({
            false,
            false,
            false
          })[1] = true
        elseif L2_56:getHealth() / L3_57 * 100 < 50 and not ({
          false,
          false,
          false
        })[2] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_05004"))
          ;({
            false,
            false,
            false
          })[2] = true
        elseif L2_56:getHealth() / L3_57 * 100 < 90 and not ({
          false,
          false,
          false
        })[3] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_05005"))
          ;({
            false,
            false,
            false
          })[3] = true
        end
      end
    else
      if L4_58 < L2_56:getHealth() then
        _caption_queue:enqueue(Fn_captionViewWait("ep17_05006"))
      else
      end
    end
    L4_58 = L2_56:getHealth()
    if not isWithinRange(L1_55:getWorldPos(), 20) and L10_64 <= 0 then
      _caption_queue:enqueue(Fn_captionViewWait("ep17_05007"))
    end
    L9_63:setHp(L2_56:getHealth() / L3_57)
    wait()
  end
end
function pccubesensor2_warp_warning_03_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    _caption_queue:enqueue(Fn_captionViewWait("ep17_09040"))
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_03_OnLeave()
  runCatWarp()
end
