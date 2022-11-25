dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep10_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
_breakdown_effect_warship = {}
_breakdown_warship_fire_sound = {}
_breakdown_warship_break_sound = {}
_warship_breakSE_task = nil
_breakdown_effect_warship_smk = {}
_breakdown_warship_smoke_sound = {}
_hp_gem_max = 8
_fatal_marker = nil
_mech_boss_defeatflag = false
CONTINUE_TO_GAZE_FLAME = 9.6
_sdemo_tbl = {}
_puppet_crow = nil
_brain_crow = nil
_cat_warp_now = false
_target_map_enter_flag = false
enmgen2_ep_f_battleship_enemies = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_battleship_01",
      name = "enemy01"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_01",
      name = "enemy51",
      target_vehicle = "enemy01"
    },
    {
      type = "mechsky",
      locator = "locator2_battleship_02",
      name = "enemy02"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_02",
      name = "enemy52",
      target_vehicle = "enemy02"
    },
    {
      type = "mechsmall",
      locator = "locator2_battleship_03",
      name = "enemy03"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_03",
      name = "enemy53",
      target_vehicle = "enemy03"
    },
    {
      type = "mechsmall",
      locator = "locator2_battleship_04",
      name = "enemy04"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_04",
      name = "enemy54",
      target_vehicle = "enemy04"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_05",
      name = "enemy05"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_06",
      name = "enemy06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_07",
      name = "enemy07"
    },
    {
      type = "officer_launcher",
      locator = "locator2_battleship_08",
      name = "enemy08"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_09",
      name = "enemy09"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_10",
      name = "enemy10"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_11",
      name = "enemy11"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_12",
      name = "enemy12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_13",
      name = "enemy13"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_14",
      name = "enemy14"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_15",
      name = "enemy15"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_16",
      name = "enemy16"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_17",
      name = "enemy17"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_18",
      name = "enemy18"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_19",
      name = "enemy19"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_20",
      name = "enemy20"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_21",
      name = "enemy21"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_22",
      name = "enemy22"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_23",
      name = "enemy23"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_24",
      name = "enemy24"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_25",
      name = "enemy25"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_26",
      name = "enemy26"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_27",
      name = "enemy27"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_28",
      name = "enemy28"
    },
    {
      type = "officer_rifle",
      locator = "locator2_battleship_29",
      name = "enemy29"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_30",
      name = "enemy30"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_31",
      name = "enemy31"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_battleship_32",
      name = "enemy32"
    },
    {
      type = "officer_launcher",
      locator = "locator2_battleship_33",
      name = "enemy33"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_34",
      name = "enemy34"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_35",
      name = "enemy35"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_36",
      name = "enemy36"
    },
    {
      type = "officer_launcher",
      locator = "locator2_battleship_37",
      name = "enemy37"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_38",
      name = "enemy38"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_39",
      name = "enemy39"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_battleship_40",
      name = "enemy40"
    }
  },
  enemyDeadNum = 0,
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
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end,
  resetPosRound02 = function()
    local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28
    L0_16 = findGameObject2
    L1_17 = "EnemyGenerator"
    L0_16 = L0_16(L1_17, L2_18)
    L1_17 = L0_16.getSpecTable
    L1_17 = L1_17(L2_18)
    L1_17 = L1_17.spawnSet
    for L5_21, L6_22 in L2_18(L3_19) do
      L7_23 = findGameObject2
      L8_24 = "EnemyBrain"
      L9_25 = L6_22.name
      L7_23 = L7_23(L8_24, L9_25)
      if L7_23 ~= nil then
        L9_25 = L7_23
        L8_24 = L7_23.isReadyEnemy
        L8_24 = L8_24(L9_25)
        if true == L8_24 then
          L8_24 = L6_22.target_vehicle
          if L8_24 == nil then
            L8_24 = findGameObject2
            L9_25 = "Node"
            L10_26 = L6_22.locator
            L11_27 = "_02"
            L10_26 = L10_26 .. L11_27
            L8_24 = L8_24(L9_25, L10_26)
            L9_25 = L8_24
            L8_24 = L8_24.getWorldTransform
            L9_25 = L8_24(L9_25)
            L11_27 = L7_23
            L10_26 = L7_23.reset
            L12_28 = L8_24
            L10_26(L11_27, L12_28, L9_25)
          end
        end
      end
    end
  end
}
enmgen2_mech_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator2_landingship_01",
      name = "landingship_01"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_02",
      name = "landingship_02"
    },
    {
      type = "mechbig_boss",
      locator = "locator2_landingship_01",
      name = "mech_boss_01",
      ai_spawn_option = "MechBig/mechbig_ep10",
      target_vehicle = "landingship_01"
    },
    {
      type = "mechbig_boss",
      locator = "locator2_landingship_02",
      name = "mech_boss_02",
      ai_spawn_option = "MechBig/mechbig_ep10",
      target_vehicle = "landingship_02"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_29)
    local L1_30
  end,
  onEnter = function(A0_31)
    findGameObject2("EnemyBrain", "mech_boss_01"):setInvincibility(true)
    findGameObject2("EnemyBrain", "mech_boss_01"):setEnableTarget(true)
    findGameObject2("EnemyBrain", "mech_boss_01"):setVisibleEnemyMarker(false)
    findGameObject2("EnemyBrain", "mech_boss_02"):setInvincibility(true)
    findGameObject2("EnemyBrain", "mech_boss_02"):setEnableTarget(true)
    findGameObject2("EnemyBrain", "mech_boss_02"):setVisibleEnemyMarker(false)
    findGameObject2("EnemyBrain", "landingship_01"):setEnableTarget(false)
    findGameObject2("EnemyBrain", "landingship_02"):setEnableTarget(false)
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectDead = function(A0_34, A1_35)
  end,
  onObjectAsh = function(A0_36, A1_37)
    A0_36:getSpecTable().enemyDeadNum = A0_36:getSpecTable().enemyDeadNum + 1
    if _mech_boss_defeatflag == false and (A1_37:getName() == "mech_boss_01" or A1_37:getName() == "mech_boss_02") then
      print("\232\181\183\229\139\149\229\133\181\229\153\168\227\131\156\227\130\185\227\129\174\227\129\169\227\129\161\227\130\137\227\129\139\227\129\140\229\128\146\227\129\149\227\130\140\227\129\159")
      _mech_boss_defeatflag = true
      _fatal_marker:del(A1_37)
    end
  end,
  getEnemyMax = function(A0_38)
    return #A0_38.spawnSet
  end,
  getEnemyDeadNum = function(A0_39)
    local L1_40
    L1_40 = A0_39.enemyDeadNum
    return L1_40
  end,
  getEnemyName = function(A0_41, A1_42)
    local L2_43
    L2_43 = A0_41.spawnSet
    L2_43 = L2_43[A1_42]
    L2_43 = L2_43.name
    return L2_43
  end,
  sendTransportSpawn = function()
    local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52
    L0_44 = findGameObject2
    L1_45 = "EnemyBrain"
    L2_46 = "landingship_01"
    L0_44 = L0_44(L1_45, L2_46)
    L1_45 = findGameObject2
    L2_46 = "EnemyBrain"
    L3_47 = "landingship_02"
    L1_45 = L1_45(L2_46, L3_47)
    L2_46 = findGameObject2
    L3_47 = "EnemyBrain"
    L4_48 = "mech_boss_01"
    L2_46 = L2_46(L3_47, L4_48)
    L3_47 = findGameObject2
    L4_48 = "EnemyBrain"
    L5_49 = "mech_boss_02"
    L3_47 = L3_47(L4_48, L5_49)
    L4_48 = findGameObject2
    L5_49 = "Puppet"
    L6_50 = "mech_boss_02"
    L4_48 = L4_48(L5_49, L6_50)
    L5_49 = "move_droppoint"
    L6_50 = "move_droppoint"
    function L7_51(A0_53)
      local L1_54, L2_55, L3_56, L4_57, L5_58
      L1_54 = A0_53.state
      if L1_54 == "wait" then
        L1_54 = L5_49
        if L1_54 == "move_droppoint" then
          A0_53.changeState = "move"
          L1_54 = {}
          A0_53.movePoint = L1_54
          L1_54 = "locator2_landingship_pos_01_%02d"
          for L5_58 = 1, 2 do
            table.insert(A0_53.movePoint, string.format(L1_54, L5_58))
          end
          L5_49 = L2_55
        else
          L1_54 = L5_49
          if L1_54 == "land_back" then
            A0_53.changeState = "move"
            L1_54 = {}
            A0_53.movePoint = L1_54
            L1_54 = "locator2_landingship_pos_01_%02d"
            for L5_58 = 3, 8 do
              table.insert(A0_53.movePoint, string.format(L1_54, L5_58))
            end
          end
        end
      end
      L1_54 = A0_53.state
      if L1_54 == "moveEnd" then
        L1_54 = L5_49
        if L1_54 == "drop_mech" then
          A0_53.changeState = "drop"
          L1_54 = {L2_55}
          A0_53.dropEnemy = L1_54
          L1_54 = L2_46
          L1_54 = L1_54.setInvincibility
          L1_54(L2_55, L3_56)
        else
          L1_54 = L5_49
          if L1_54 == "land_back" then
            A0_53.changeState = "kill"
            L1_54 = "empty"
            L5_49 = L1_54
          end
        end
      end
      L1_54 = A0_53.state
      if L1_54 == "dropEnd" then
        L1_54 = "land_back"
        L5_49 = L1_54
      end
      return A0_53
    end
    function L8_52(A0_59)
      local L1_60, L2_61, L3_62, L4_63, L5_64
      L1_60 = A0_59.state
      if L1_60 == "wait" then
        L1_60 = L6_50
        if L1_60 == "move_droppoint" then
          A0_59.changeState = "move"
          L1_60 = {}
          A0_59.movePoint = L1_60
          L1_60 = "locator2_landingship_pos_02_%02d"
          for L5_64 = 1, 4 do
            table.insert(A0_59.movePoint, string.format(L1_60, L5_64))
          end
        else
          L1_60 = L6_50
          if L1_60 == "land_back" then
            A0_59.changeState = "move"
            L1_60 = {}
            A0_59.movePoint = L1_60
            L1_60 = "locator2_landingship_pos_01_%02d"
            for L5_64 = 3, 8 do
              table.insert(A0_59.movePoint, string.format(L1_60, L5_64))
            end
          end
        end
      end
      L1_60 = A0_59.state
      if L1_60 == "moveEnd" then
        L1_60 = L6_50
        if L1_60 == "move_droppoint" then
          A0_59.changeState = "move"
          L1_60 = {}
          A0_59.movePoint = L1_60
          L1_60 = "locator2_landingship_pos_02_%02d"
          for L5_64 = 5, 7 do
            table.insert(A0_59.movePoint, string.format(L1_60, L5_64))
          end
          L6_50 = L2_61
          L2_61(L3_62, L4_63)
        else
          L1_60 = L6_50
          if L1_60 == "drop_mech" then
            A0_59.changeState = "drop"
            L1_60 = {L2_61}
            A0_59.dropEnemy = L1_60
            L1_60 = L3_47
            L1_60 = L1_60.setInvincibility
            L1_60(L2_61, L3_62)
            L1_60 = _fatal_marker
            L1_60 = L1_60.set
            L5_64 = true
            L1_60(L2_61, L3_62, L4_63, L5_64, nil, 3, "ui_boss_hp_08")
          else
            L1_60 = L6_50
            if L1_60 == "land_back" then
              A0_59.changeState = "kill"
              L1_60 = "empty"
              L6_50 = L1_60
            end
          end
        end
      end
      L1_60 = A0_59.state
      if L1_60 == "dropEnd" then
        L1_60 = "land_back"
        L6_50 = L1_60
      end
      return A0_59
    end
    L0_44:setEventListener("enemy_landingship_event", L7_51)
    L1_45:setEventListener("enemy_landingship_event", L8_52)
  end
}
function AnnounceMechBig(A0_65, A1_66)
  return invokeTask(function()
    waitSeconds(1.5)
    Fn_captionViewWait("ep10_03002")
    A0_65:setVisibleBossMarker(true)
    while true do
      if Fn_isInSightTarget(A1_66, 0.95) == true then
        while Fn_isInSightTarget(A1_66, 1) == true do
          if 0 >= CONTINUE_TO_GAZE_FLAME then
            break
          end
          wait()
        end
        if true ~= true then
          wait()
        end
      end
    end
    Fn_captionViewWait("ep10_03003")
  end)
end
function Initialize()
  local L0_67, L1_68, L2_69, L3_70
  L0_67()
  L3_70 = -348.432068
  L3_70 = 0
  L0_67(L1_68, L2_69, L3_70, 0)
  L0_67(L1_68, L2_69)
  L3_70 = "locator2_ar_ship_pos"
  L3_70 = L1_68(L2_69, L3_70)
  L0_67(L1_68, L2_69, L3_70, L1_68(L2_69, L3_70))
  for L3_70 = 1, _hp_gem_max do
    invokeSystemTask(function()
      local L0_71, L1_72
      L0_71 = findGameObject2
      L1_72 = "Node"
      L0_71 = L0_71(L1_72, "locator2_life_gem_" .. string.format("%02d", L3_70))
      L1_72 = createGameObject2
      L1_72 = L1_72("Gem")
      L1_72:setGemModelNo(5)
      L1_72:setActive(true)
      L1_72:setVisible(true)
      L1_72:try_init()
      L1_72:setVisibleBlockHalfSize(150)
      L1_72:waitForReadyAsync(function()
        L1_72:try_start()
      end)
      L0_71:appendChild(L1_72)
    end)
    break
  end
  L3_70 = "ep10_f_02"
  L3_70 = L2_69(L3_70)
  ;({
    L1_68,
    [4] = L2_69(L3_70)
  })[2] = L2_69
  ;({
    L1_68,
    [4] = L2_69(L3_70)
  })[3] = L3_70
  _sdemo_tbl = L0_67
  L3_70 = false
  L0_67(L1_68, L2_69, L3_70)
  L0_67(L1_68)
  L3_70 = "building_kk_50"
  L3_70 = "getBackgroundElement2Handle"
  L3_70 = L0_67
  L2_69(L3_70, false)
  L3_70 = L1_68
  L2_69(L3_70, true)
end
function Ingame()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78
  L0_73(L1_74, L2_75)
  L0_73(L1_74, L2_75)
  for L3_76 = 1, 16 do
    L4_77 = _breakdown_effect_warship
    L5_78 = Fn_createEffect
    L5_78 = L5_78("warship_fir_effect_" .. string.format("%02d", L3_76), "ef_ev_fir_03", "locator2_breakdown_effect_warship_" .. string.format("%02d", L3_76), true)
    L4_77[L3_76] = L5_78
  end
  for L3_76 = 1, 9 do
    L4_77 = _breakdown_effect_warship_smk
    L5_78 = Fn_createEffect
    L5_78 = L5_78("warship_smk_effect_" .. string.format("%02d", L3_76), "ef_ev_smk_07", "locator2_breakdown_effect_warship_smk_" .. string.format("%02d", L3_76), true)
    L4_77[L3_76] = L5_78
  end
  for L3_76 = 1, 10 do
    L4_77 = _breakdown_effect
    L5_78 = Fn_createEffect
    L5_78 = L5_78("smk_effect_" .. string.format("%02d", L3_76), "ef_ev_smk_01", "locator2_breakdown_effect_" .. string.format("%02d", L3_76), true)
    L4_77[L3_76] = L5_78
  end
  L0_73(L1_74, L2_75)
  L3_76 = false
  L0_73(L1_74, L2_75, L3_76)
  L0_73()
  L1_74(L2_75)
  L3_76 = "mech_boss_01"
  L3_76 = "EnemyBrain"
  L4_77 = "mech_boss_02"
  L3_76 = Fn_findAreaHandle
  L4_77 = "ar_b_root"
  L3_76 = L3_76(L4_77)
  function L4_77()
    _se_handle = Sound:playSEHandle("ep10_siren", 1, "", L3_76)
  end
  L5_78 = Fn_skipMissionRetryAtProcessing
  L5_78(L4_77)
  L5_78 = Fn_missionStart
  L5_78()
  function L5_78()
    Fn_kaiwaDemoView("ep10_00320k")
  end
  Fn_skipMissionRetryAtProcessing(L5_78)
  warship_breakSE_start()
  Fn_pcSensorOn("pccubesensor2_battle_area")
  Fn_naviSet(findGameObject2("Node", "locator2_battle_area_pos"))
  Fn_userCtrlOn()
  Player:setStay(false)
  _brain_crow:setIdling(false)
  Fn_missionViewWait("ep10_03000")
  while true do
    if enmgen2_ep_f_battleship_enemies:getEnemyMax() / 2 <= enmgen2_ep_f_battleship_enemies:getEnemyDeadNum() then
      print("\230\149\181\227\130\1466\229\137\178\231\168\139\229\128\146\227\129\151\227\129\159\227\129\174\227\129\167\232\181\183\229\139\149\229\133\181\229\153\168\227\131\156\227\130\1851\227\130\146\229\135\186\231\143\190")
      break
    elseif 3600 == 0 then
      print("\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139\227\129\139\227\130\137120\231\167\146\227\129\140\231\181\140\233\129\142\227\129\151\227\129\159\227\129\174\227\129\167\232\181\183\229\139\149\229\133\181\229\153\168\227\131\156\227\130\1851\227\130\146\229\135\186\231\143\190")
      break
    end
    wait()
  end
  boss_appearance_production(L0_73)
  while true do
    if _fatal_marker:isFatalFinish() then
      print("\232\181\183\229\139\149\229\133\181\229\153\168\227\131\156\227\130\1852\228\189\147\227\129\140\229\128\146\227\129\149\227\130\140\227\129\159")
      Fn_whiteout(0.3)
      _fatal_marker:kill()
      _fatal_marker = nil
      break
    end
    wait()
  end
  if _se_handle then
    Sound:stopSEHandle(_se_handle)
    _se_handle = nil
  end
  warship_breakSE_end()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _se_handle then
    Sound:stopSEHandle(_se_handle)
    _se_handle = nil
  end
end
function warship_breakdownSE(A0_79, A1_80)
  if A0_79 == "play" then
    if _breakdown_warship_fire_sound[A1_80] == nil then
      print("\231\160\180\230\144\141\231\174\135\230\137\128\227\129\139\227\130\137\232\129\158\227\129\147\227\129\136\227\130\139SE\227\129\174\229\134\141\231\148\159\233\150\139\229\167\139 breakdownNumber\239\188\154" .. A1_80)
      _breakdown_warship_fire_sound[A1_80] = Sound:playSEHandle("ep10_bridge_fire", 1, findGameObject2("Node", "locator2_breakdown_effect_warship_fire_sound_" .. string.format("%02d", A1_80)))
      _breakdown_warship_break_sound[A1_80] = true
    end
  elseif A0_79 == "stop" and _breakdown_warship_fire_sound[A1_80] ~= nil then
    print("\231\160\180\230\144\141\231\174\135\230\137\128\227\129\139\227\130\137\232\129\158\227\129\147\227\129\136\227\130\139SE\227\129\174\229\134\141\231\148\159\231\181\130\228\186\134 breakdownNumber\239\188\154" .. A1_80)
    Sound:stopSEHandle(_breakdown_warship_fire_sound[A1_80])
    _breakdown_warship_fire_sound[A1_80] = nil
    _breakdown_warship_break_sound[A1_80] = false
  end
end
function pcspheresensor2_breakdown_effect_warship_01_OnEnter()
  warship_breakdownSE("play", 1)
end
function pcspheresensor2_breakdown_effect_warship_01_OnLeave()
  warship_breakdownSE("stop", 1)
end
function pcspheresensor2_breakdown_effect_warship_02_OnEnter()
  warship_breakdownSE("play", 2)
end
function pcspheresensor2_breakdown_effect_warship_02_OnLeave()
  warship_breakdownSE("stop", 2)
end
function pcspheresensor2_breakdown_effect_warship_03_OnEnter()
  warship_breakdownSE("play", 3)
end
function pcspheresensor2_breakdown_effect_warship_03_OnLeave()
  warship_breakdownSE("stop", 3)
end
function pcspheresensor2_breakdown_effect_warship_04_OnEnter()
  warship_breakdownSE("play", 4)
end
function pcspheresensor2_breakdown_effect_warship_04_OnLeave()
  warship_breakdownSE("stop", 4)
end
function pcspheresensor2_breakdown_effect_warship_05_OnEnter()
  warship_breakdownSE("play", 5)
end
function pcspheresensor2_breakdown_effect_warship_05_OnLeave()
  warship_breakdownSE("stop", 5)
end
function pcspheresensor2_breakdown_effect_warship_06_OnEnter()
  warship_breakdownSE("play", 6)
end
function pcspheresensor2_breakdown_effect_warship_06_OnLeave()
  warship_breakdownSE("stop", 6)
end
function pcspheresensor2_breakdown_effect_warship_07_OnEnter()
  warship_breakdownSE("play", 7)
end
function pcspheresensor2_breakdown_effect_warship_07_OnLeave()
  warship_breakdownSE("stop", 7)
end
function pcspheresensor2_breakdown_effect_warship_08_OnEnter()
  warship_breakdownSE("play", 8)
end
function pcspheresensor2_breakdown_effect_warship_08_OnLeave()
  warship_breakdownSE("stop", 8)
end
function warship_breakSE_start()
  local L0_81
  L0_81 = print
  L0_81("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\231\160\180\230\144\141\231\174\135\230\137\128\227\129\167\227\129\174\231\136\134\231\153\186SE\227\129\174\229\134\141\231\148\159\229\135\166\231\144\134\227\130\146\233\150\139\229\167\139")
  L0_81 = RandI
  L0_81 = L0_81(150, 300)
  _warship_breakSE_task = invokeTask(function()
    local L0_82
    while true do
      L0_82 = L0_81
      if L0_82 == 0 then
        L0_82 = RandI
        L0_82 = L0_82(150, 300)
        L0_81 = L0_82
        L0_82 = RandI
        L0_82 = L0_82(1, 8)
        if _breakdown_warship_break_sound[L0_82] == true then
          print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\231\130\142\228\184\138\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\227\129\174\233\159\179\230\186\144" .. L0_82 .. "\232\191\145\232\190\186\227\129\171\227\129\132\227\130\139\227\129\139\227\130\137\231\136\134\231\153\186\233\159\179\227\130\146\229\134\141\231\148\159\227\129\153\227\130\139")
          Sound:playSE("ep10_bridge_break", 1, findGameObject2("Node", "locator2_breakdown_effect_warship_fire_sound_" .. string.format("%02d", L0_82)))
        end
      end
      L0_82 = wait
      L0_82()
      L0_82 = L0_81
      L0_82 = L0_82 - 1
      L0_81 = L0_82
    end
  end)
end
function warship_breakSE_end()
  print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\231\160\180\230\144\141\231\174\135\230\137\128\227\129\167\227\129\174\231\136\134\231\153\186SE\227\129\174\229\134\141\231\148\159\229\135\166\231\144\134\227\130\146\231\181\130\228\186\134")
  _warship_breakSE_task:abort()
  _warship_breakSE_task = nil
end
function warship_breakdown_smkSE(A0_83, A1_84)
  if A0_83 == "play" then
    if _breakdown_warship_smoke_sound[A1_84] == nil then
      print("\230\149\133\233\154\156\231\174\135\230\137\128\227\129\139\227\130\137\232\129\158\227\129\147\227\129\136\227\130\139SE\227\129\174\229\134\141\231\148\159\233\150\139\229\167\139 breakdownNumber\239\188\154" .. A1_84)
      _breakdown_warship_smoke_sound[A1_84] = Sound:playSEHandle("ep10_battleship_smoke", 1, "", _breakdown_effect_warship_smk[A1_84])
    end
  elseif A0_83 == "stop" and _breakdown_warship_smoke_sound[A1_84] ~= nil then
    print("\230\149\133\233\154\156\231\174\135\230\137\128\227\129\139\227\130\137\232\129\158\227\129\147\227\129\136\227\130\139SE\227\129\174\229\134\141\231\148\159\231\181\130\228\186\134 breakdownNumber\239\188\154" .. A1_84)
    Sound:stopSEHandle(_breakdown_warship_smoke_sound[A1_84])
    _breakdown_warship_smoke_sound[A1_84] = nil
  end
end
function pcspheresensor2_breakdown_effect_warship_smk_01_OnEnter()
  warship_breakdown_smkSE("play", 1)
end
function pcspheresensor2_breakdown_effect_warship_smk_01_OnLeave()
  warship_breakdown_smkSE("stop", 1)
end
function pcspheresensor2_breakdown_effect_warship_smk_02_OnEnter()
  warship_breakdown_smkSE("play", 2)
end
function pcspheresensor2_breakdown_effect_warship_smk_02_OnLeave()
  warship_breakdown_smkSE("stop", 2)
end
function pcspheresensor2_breakdown_effect_warship_smk_03_OnEnter()
  warship_breakdown_smkSE("play", 3)
end
function pcspheresensor2_breakdown_effect_warship_smk_03_OnLeave()
  warship_breakdown_smkSE("stop", 3)
end
function pcspheresensor2_breakdown_effect_warship_smk_04_OnEnter()
  warship_breakdown_smkSE("play", 4)
end
function pcspheresensor2_breakdown_effect_warship_smk_04_OnLeave()
  warship_breakdown_smkSE("stop", 4)
end
function pcspheresensor2_breakdown_effect_warship_smk_05_OnEnter()
  warship_breakdown_smkSE("play", 5)
end
function pcspheresensor2_breakdown_effect_warship_smk_05_OnLeave()
  warship_breakdown_smkSE("stop", 5)
end
function pcspheresensor2_breakdown_effect_warship_smk_06_OnEnter()
  warship_breakdown_smkSE("play", 6)
end
function pcspheresensor2_breakdown_effect_warship_smk_06_OnLeave()
  warship_breakdown_smkSE("stop", 6)
end
function pcspheresensor2_breakdown_effect_warship_smk_07_OnEnter()
  warship_breakdown_smkSE("play", 7)
end
function pcspheresensor2_breakdown_effect_warship_smk_07_OnLeave()
  warship_breakdown_smkSE("stop", 7)
end
function pcspheresensor2_breakdown_effect_warship_smk_08_OnEnter()
  warship_breakdown_smkSE("play", 8)
end
function pcspheresensor2_breakdown_effect_warship_smk_08_OnLeave()
  warship_breakdown_smkSE("stop", 8)
end
function pcspheresensor2_breakdown_effect_warship_smk_09_OnEnter()
  warship_breakdown_smkSE("play", 9)
end
function pcspheresensor2_breakdown_effect_warship_smk_09_OnLeave()
  warship_breakdown_smkSE("stop", 9)
end
function supporterNpc_crow_setup()
  _puppet_crow = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Air)
  _brain_crow = _puppet_crow:getBrain()
  _brain_crow:setIdling(true)
  wait()
end
function pccubesensor2_battle_area_OnEnter()
  print("\228\184\187\230\136\166\229\160\180\227\129\171\231\157\128\227\129\132\227\129\159")
  _target_map_enter_flag = true
  Fn_pcSensorOff("pccubesensor2_battle_area")
  Fn_naviKill()
end
function pccubesensor2_alert_OnLeave()
  local L0_85
  L0_85 = print
  L0_85("\230\136\166\233\151\152\227\130\168\227\131\170\227\130\162\227\129\139\227\130\137\233\155\162\227\130\140\227\130\136\227\129\134\227\129\168\227\129\151\227\129\166\227\129\132\227\130\139")
  L0_85 = nil
  L0_85 = invokeTask(function()
    Fn_captionView("ep10_03001")
    if _target_map_enter_flag == true then
      _target_map_enter_flag = false
      Fn_pcSensorOn("pccubesensor2_battle_area")
      Fn_naviSet(findGameObject2("Node", "locator2_battle_area_pos"))
    end
    waitSeconds(3)
    Fn_lookAtObject("locator2_battle_area_pos"):abort()
    L0_85:abort()
  end)
end
function pccubesensor2_cat_warp_OnLeave()
  print("\230\136\166\233\151\152\227\130\168\227\131\170\227\130\162\227\129\139\227\130\137\233\155\162\227\130\140\227\129\159\227\129\174\227\129\167\227\128\129\229\188\183\229\136\182\231\154\132\227\129\171\233\150\139\229\167\139\229\156\176\231\130\185\227\129\184")
  if _cat_warp_now ~= true then
    _cat_warp_now = true
    invokeTask(function()
      Fn_catWarp(0.5, true)
      Fn_missionViewWait("ep10_03000")
      _cat_warp_now = false
    end)
  end
end
function boss_appearance_production(A0_86)
  local L1_87, L2_88, L3_89, L4_90, L5_91
  L1_87 = findGameObject2
  L2_88 = "EnemyGenerator"
  L3_89 = "enmgen2_ep_f_battleship_enemies"
  L1_87 = L1_87(L2_88, L3_89)
  L2_88 = findGameObject2
  L3_89 = "Puppet"
  L4_90 = "mech_boss_01"
  L2_88 = L2_88(L3_89, L4_90)
  L3_89 = findGameObject2
  L4_90 = "EnemyBrain"
  L5_91 = "mech_boss_01"
  L3_89 = L3_89(L4_90, L5_91)
  L4_90 = Fn_userCtrlAllOff
  L4_90()
  L4_90 = Fn_blackout
  L4_90()
  L5_91 = A0_86
  L4_90 = A0_86.requestSpawn
  L4_90(L5_91)
  L4_90 = Fn_setBgmPoint
  L5_91 = "event"
  L4_90(L5_91, "boss")
  L5_91 = L1_87
  L4_90 = L1_87.requestIdlingEnemy
  L4_90(L5_91, true)
  L5_91 = L1_87
  L4_90 = L1_87.setEnemyMarker
  L4_90(L5_91, false)
  L4_90 = enmgen2_ep_f_battleship_enemies
  L4_90 = L4_90.resetPosRound02
  L4_90()
  L4_90 = Fn_resetPcPos
  L5_91 = "locator2_pc_start_pos_02"
  L4_90(L5_91)
  L4_90 = Fn_setCatWarpCheckPoint
  L5_91 = "locator2_pc_start_pos_02"
  L4_90(L5_91)
  L4_90 = findGameObject2
  L5_91 = "Node"
  L4_90 = L4_90(L5_91, "locator2_crow_start_pos_02")
  L5_91 = L4_90
  L4_90 = L4_90.getWorldTransform
  L5_91 = L4_90(L5_91)
  _brain_crow:warp(L4_90, L5_91, Supporter.FirstAction.Ground)
  _brain_crow:setIdling(true)
  ep10f_sdemo()
  Fn_userCtrlOn()
  L1_87:requestIdlingEnemy(false)
  L1_87:setEnemyMarker(true)
  _brain_crow:setIdling(false)
  L3_89:setVisibleBossMarker(true)
  _fatal_marker = FatalMarker.create(kFATAL_TYPE_ACT, _puppet_crow, true)
  _fatal_marker:set(L2_88, "bn_c03_neck", true, nil, 3, "ui_boss_hp_07")
  _fatal_marker:run()
end
function ep10f_sdemo()
  local L0_92
  L0_92 = {
    findGameObject2("Node", "locator2_cam_aim_01"),
    findGameObject2("Node", "locator2_cam_aim_02")
  }
  _sdemo_tbl[1]:set(({
    findGameObject2("Node", "locator2_cam_pos_01"),
    findGameObject2("Node", "locator2_cam_pos_02")
  })[1], L0_92[1])
  _sdemo_tbl[1]:play()
  enmgen2_mech_boss.sendTransportSpawn()
  Fn_fadein()
  waitSeconds(4.5)
  _sdemo_tbl[2]:set(({
    findGameObject2("Node", "locator2_cam_pos_01"),
    findGameObject2("Node", "locator2_cam_pos_02")
  })[2], L0_92[2])
  _sdemo_tbl[2]:play()
  _sdemo_tbl[1]:stop()
  waitSeconds(2.5)
  _sdemo_tbl[2]:stop(2)
  _sdemo_tbl[1] = nil
  _sdemo_tbl[2] = nil
  waitSeconds(2)
end
