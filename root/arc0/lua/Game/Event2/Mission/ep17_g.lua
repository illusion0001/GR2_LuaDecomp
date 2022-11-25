dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
EP17G_VOICE_NUM = 3
KALI_VOICE_TIME = 30
_GRIGO_RESPAWN_TIME = 10
_caption_queue = nil
_crow_puppet = nil
_grigo_cnt = 0
enmgen2_ep17_g_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_ene_g_01",
      name = "kali01",
      ai_spawn_option = "Kali/kali_ep17_g"
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
enmgen2_ep17_g_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_ene_g_101",
      name = "bot101",
      ai_spawn_option = "Grigo/ep17_fg_grigo"
    },
    {
      type = "grigo",
      locator = "locator_ene_g_102",
      name = "bot102",
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
    local L2_20
    L2_20 = _grigo_cnt
    L2_20 = L2_20 + 1
    _grigo_cnt = L2_20
    L2_20 = findGameObject2
    L2_20 = L2_20("EnemyBrain", A1_19:getName())
    if L2_20 ~= nil then
      L2_20:setEnableHomingTarget(false)
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\239\188\154", L2_20:getName())
    else
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\229\164\177\230\149\151\239\188\154", L2_20:getName())
    end
  end,
  onObjectAsh = function(A0_21, A1_22)
    _grigo_cnt = _grigo_cnt - 1
  end,
  onObjectDead = function(A0_23, A1_24)
  end
}
enmgen2_ep17_g_grigo_autorebirth_01 = {
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
  onUpdate = function(A0_25)
    local L1_26
  end,
  onEnter = function(A0_27)
    local L1_28
  end,
  onLeave = function(A0_29)
    local L1_30
  end,
  onSpawn = function(A0_31, A1_32)
    local L2_33
    L2_33 = print
    L2_33("\227\130\176\227\131\170\227\130\180\227\130\185\227\131\157\227\131\188\227\131\179\239\188\129\239\188\154", A1_32:getName())
    L2_33 = findGameObject2
    L2_33 = L2_33("EnemyBrain", A1_32:getName())
    if L2_33 ~= nil then
      L2_33:setEnableHomingTarget(false)
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\239\188\154", L2_33:getName())
    else
      print("\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136OFF\229\164\177\230\149\151\239\188\154", L2_33:getName())
    end
  end,
  onObjectAsh = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
  end
}
function Initialize()
  local L0_38, L1_39
end
function Ingame()
  local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48
  L0_40 = Queue
  L0_40 = L0_40.new
  L0_40 = L0_40()
  _caption_queue = L0_40
  L0_40 = invokeTask
  function L1_41()
    local L0_49
    while true do
      L0_49 = _caption_queue
      L0_49 = L0_49.isEmpty
      L0_49 = L0_49(L0_49)
      if not L0_49 then
        L0_49 = _caption_queue
        L0_49 = L0_49.dequeue
        L0_49 = L0_49(L0_49)
        if L0_49 ~= nil then
          L0_49()
        end
      end
      L0_49 = wait
      L0_49()
    end
  end
  L0_40 = L0_40(L1_41)
  L1_41 = Fn_setCatWarpCheckPoint
  L2_42 = "locator2_pc_start_pos"
  L1_41(L2_42)
  L1_41 = anoterCatWarp
  L1_41()
  L1_41 = findGameObject2
  L2_42 = "EnemyGenerator"
  L3_43 = "enmgen2_ep17_g_02"
  L1_41 = L1_41(L2_42, L3_43)
  L2_42 = findGameObject2
  L3_43 = "EnemyGenerator"
  L4_44 = "enmgen2_ep17_g_grigo_autorebirth_01"
  L2_42 = L2_42(L3_43, L4_44)
  L4_44 = L1_41
  L3_43 = L1_41.requestIdlingEnemy
  L5_45 = true
  L3_43(L4_44, L5_45)
  L4_44 = L2_42
  L3_43 = L2_42.requestIdlingEnemy
  L5_45 = true
  L3_43(L4_44, L5_45)
  L4_44 = L1_41
  L3_43 = L1_41.setEnemyMarker
  L5_45 = false
  L3_43(L4_44, L5_45)
  L4_44 = L2_42
  L3_43 = L2_42.setEnemyMarker
  L5_45 = false
  L3_43(L4_44, L5_45)
  L3_43 = findGameObject2
  L4_44 = "EnemyGenerator"
  L5_45 = "enmgen2_ep17_g_01"
  L3_43 = L3_43(L4_44, L5_45)
  L5_45 = L3_43
  L4_44 = L3_43.requestIdlingEnemy
  L6_46 = true
  L4_44(L5_45, L6_46)
  L4_44 = Fn_spawnSuppotCrow
  L5_45 = false
  L6_46 = Supporter
  L6_46 = L6_46.FirstAction
  L6_46 = L6_46.Ground
  L4_44 = L4_44(L5_45, L6_46)
  _crow_puppet = L4_44
  L4_44 = _crow_puppet
  L5_45 = L4_44
  L4_44 = L4_44.setWorldTransform
  L6_46 = findGameObject2
  L7_47 = "Node"
  L8_48 = "locator2_crow_start_pos"
  L6_46 = L6_46(L7_47, L8_48)
  L7_47 = L6_46
  L6_46 = L6_46.getWorldTransform
  L8_48 = L6_46(L7_47)
  L4_44(L5_45, L6_46, L7_47, L8_48, L6_46(L7_47))
  L4_44 = _crow_puppet
  L5_45 = L4_44
  L4_44 = L4_44.setForceMove
  L4_44(L5_45)
  L4_44 = _crow_puppet
  L5_45 = L4_44
  L4_44 = L4_44.getBrain
  L4_44 = L4_44(L5_45)
  L6_46 = L4_44
  L5_45 = L4_44.setIdling
  L7_47 = true
  L5_45(L6_46, L7_47)
  while true do
    L6_46 = L3_43
    L5_45 = L3_43.isSpawnOnStartFinished
    L5_45 = L5_45(L6_46)
    if L5_45 == false then
      L5_45 = wait
      L5_45()
    end
  end
  L5_45 = findGameObject2
  L6_46 = "EnemyBrain"
  L7_47 = "kali01"
  L5_45 = L5_45(L6_46, L7_47)
  L7_47 = L5_45
  L6_46 = L5_45.setVisibleBossMarker
  L8_48 = true
  L6_46(L7_47, L8_48)
  L6_46 = Fn_missionStart
  L6_46()
  L6_46 = Area
  L7_47 = L6_46
  L6_46 = L6_46.gravityStorm
  L8_48 = Vector
  L8_48 = L8_48(256, 108, -25)
  L6_46(L7_47, L8_48, 200)
  L6_46 = Fn_kaiwaDemoView
  L7_47 = "ep17_00410k"
  L6_46(L7_47)
  L6_46 = Fn_userCtrlOn
  L6_46()
  L7_47 = L1_41
  L6_46 = L1_41.requestIdlingEnemy
  L8_48 = false
  L6_46(L7_47, L8_48)
  L7_47 = L2_42
  L6_46 = L2_42.requestIdlingEnemy
  L8_48 = false
  L6_46(L7_47, L8_48)
  L6_46 = Fn_missionView
  L7_47 = "ep17_06000"
  L6_46(L7_47)
  L6_46 = invokeTask
  function L7_47()
    local L0_50, L1_51, L2_52, L3_53
    L0_50 = 1
    L1_51 = 1
    while true do
      if L0_50 == 0 then
        L2_52 = math
        L2_52 = L2_52.random
        L3_53 = EP17G_VOICE_NUM
        L2_52 = L2_52(L3_53)
        L3_53 = findGameObject2
        L3_53 = L3_53("Puppet", "kali01")
        Sound:playSE("ene_kali_vo_anger_" .. L2_52, 1, L3_53)
      end
      L2_52 = waitSeconds
      L3_53 = 1
      L2_52(L3_53)
      L0_50 = L0_50 + 1
      L2_52 = KALI_VOICE_TIME
      L0_50 = L0_50 % L2_52
    end
  end
  L6_46 = L6_46(L7_47)
  L8_48 = L4_44
  L7_47 = L4_44.setIdling
  L7_47(L8_48, false)
  L8_48 = L3_43
  L7_47 = L3_43.requestIdlingEnemy
  L7_47(L8_48, false)
  L7_47 = Mob
  L8_48 = L7_47
  L7_47 = L7_47.makeSituationPanic
  L7_47(L8_48, true)
  L7_47 = Fn_setBgmPoint
  L8_48 = "event"
  L7_47(L8_48, "boss")
  L7_47 = false
  L8_48 = invokeTask
  L8_48 = L8_48(function()
    local L0_54, L1_55, L2_56
    L0_54 = findGameObject2
    L1_55 = "Puppet"
    L2_56 = "kali01"
    L0_54 = L0_54(L1_55, L2_56)
    L1_55 = findGameObject2
    L2_56 = "Node"
    L1_55 = L1_55(L2_56, "locator2_kali_warp_pos")
    L2_56 = L1_55.getPos
    L2_56 = L2_56(L1_55)
    while true do
      if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true then
        print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\184\173\239\188\129\239\188\129")
        waitSeconds(3)
        L3_43:requestIdlingEnemy(true)
        L0_54:setPos(L2_56)
        L0_54:setForceMove()
        print("\227\130\171\227\131\188\227\131\170\227\130\163\227\131\175\227\131\188\227\131\151\239\188\129\239\188\129\239\188\129")
        while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
          wait()
        end
        waitSeconds(1.5)
        L3_43:requestIdlingEnemy(false)
      end
      wait()
    end
  end)
  checkKaliHealth()
  Fn_whiteout(0.3)
  L6_46 = Mv_safeTaskAbort(L6_46)
  L0_40 = Mv_safeTaskAbort(L0_40)
  L8_48 = Mv_safeTaskAbort(L8_48)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
  Area:gravityStorm()
end
function checkKaliHealth()
  local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67
  L0_57 = 100
  L1_58 = 0
  L2_59 = {
    L3_60,
    L4_61,
    L5_62,
    L6_63
  }
  L3_60 = false
  L4_61 = false
  L5_62 = false
  L6_63 = false
  L3_60 = {
    L4_61,
    L5_62,
    L6_63,
    L7_64
  }
  L4_61 = false
  L5_62 = false
  L6_63 = false
  L7_64 = false
  L4_61 = findGameObject2
  L5_62 = "Puppet"
  L6_63 = "kali01"
  L4_61 = L4_61(L5_62, L6_63)
  L5_62 = findGameObject2
  L6_63 = "EnemyBrain"
  L7_64 = "kali01"
  L5_62 = L5_62(L6_63, L7_64)
  L6_63 = 1
  if L5_62 ~= nil then
    L8_65 = L5_62
    L7_64 = L5_62.getMaxHealth
    L7_64 = L7_64(L8_65)
    L6_63 = L7_64
  end
  L7_64 = L6_63
  L8_65 = Player
  L9_66 = L8_65
  L8_65 = L8_65.getEnergyMax
  L10_67 = Player
  L10_67 = L10_67.kEnergy_Life
  L8_65 = L8_65(L9_66, L10_67)
  L9_66 = Player
  L10_67 = L9_66
  L9_66 = L9_66.getEnergy
  L9_66 = L9_66(L10_67, Player.kEnergy_Life)
  L10_67 = L9_66
  FatalMarker.create(kFATAL_TYPE_ACT, _crow_puppet, true, nil):set(L4_61, "bn_root", true)
  FatalMarker.create(kFATAL_TYPE_ACT, _crow_puppet, true, nil):run()
  while not FatalMarker.create(kFATAL_TYPE_ACT, _crow_puppet, true, nil):isFatalFinish() do
    L9_66 = Player:getEnergy(Player.kEnergy_Life)
    if L10_67 > L9_66 then
      if L1_58 <= 0 then
        if L9_66 * 100 / L8_65 == 0 and not L2_59[1] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06001"))
          L2_59[1] = true
        elseif L9_66 * 100 / L8_65 < 30 and not L2_59[2] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06002"))
          L2_59[2] = true
        elseif L9_66 * 100 / L8_65 < 50 and not L2_59[3] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06003"))
          L2_59[3] = true
        elseif L9_66 * 100 / L8_65 < 90 and not L2_59[4] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06004"))
          L2_59[4] = true
        end
        L1_58 = L0_57
      end
    else
      if L10_67 < L9_66 then
        _caption_queue:enqueue(Fn_captionViewWait("ep17_06005"))
      else
      end
    end
    L10_67 = L9_66
    if L7_64 > L5_62:getHealth() then
      if L1_58 <= 0 then
        if 30 > L5_62:getHealth() * 100 / L6_63 and not L3_60[1] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06006"))
          L3_60[1] = true
        elseif 50 > L5_62:getHealth() * 100 / L6_63 and not L3_60[2] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06007"))
          L3_60[2] = true
        elseif 90 > L5_62:getHealth() * 100 / L6_63 and not L3_60[3] then
          _caption_queue:enqueue(Fn_captionViewWait("ep17_06008"))
          L3_60[3] = true
        end
        L1_58 = L0_57
      end
    else
      if L7_64 < L5_62:getHealth() then
        _caption_queue:enqueue(Fn_captionViewWait("ep17_06009"))
      else
      end
    end
    L7_64 = L5_62:getHealth()
    if not isWithinRange(L4_61:getWorldPos(), 20) then
      if L1_58 <= 0 then
        _caption_queue:enqueue(Fn_captionViewWait("ep17_06010"))
      end
      L1_58 = L0_57 * 3
    end
    L1_58 = L1_58 - 1
    if L1_58 < 0 then
      L1_58 = 0
    end
    wait()
  end
  FatalMarker.create(kFATAL_TYPE_ACT, _crow_puppet, true, nil):kill()
end
function pccubesensor2_warp_warning_04_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    _caption_queue:enqueue(Fn_captionViewWait("ep17_09040"))
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_04_OnLeave()
  runCatWarp()
end
