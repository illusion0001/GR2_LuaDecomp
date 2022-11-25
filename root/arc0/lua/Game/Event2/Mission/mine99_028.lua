dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
_event_file_name = "floor_028"
_floor_num = 28
_boss_battle_floor = true
_cat_warp_now = false
_battle_end_flg = false
_drop_wait = true
_boss_battle = nil
_boss_hp_tbl = {1, 1}
_boss_hp_total = 1
_se_area_siren = nil
_se_hdl_siren = nil
_play_sien_cnt = 0
_play_sien_cnt_max = 2
function InitializeBody()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = print
  L1_1 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\227\131\135\227\131\188\227\130\191\227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\227\129\190\227\129\153"
  L0_0(L1_1)
  L0_0 = Fn_findAreaHandle
  L1_1 = "ar_a_root"
  L0_0 = L0_0(L1_1)
  if not L0_0 then
    L0_0 = Fn_findAreaHandle
    L1_1 = "ar_b_root"
    L0_0 = L0_0(L1_1)
  end
  L2_2 = L0_0
  L1_1 = L0_0.getName
  L1_1 = L1_1(L2_2)
  if L1_1 == "ar_a_root" then
    L1_1 = "evx/ar_object"
  else
    L1_1 = L1_1 or "evx/ar_object_b"
  end
  L2_2 = loadFileAsset
  L3_3 = "evb"
  L4_4 = L1_1
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = nil
  if L2_2 ~= nil then
    L5_5 = L2_2
    L4_4 = L2_2.wait
    L4_4(L5_5)
    L5_5 = L2_2
    L4_4 = L2_2.getRoot
    L4_4 = L4_4(L5_5)
    L5_5 = EventData
    L5_5 = L5_5.create
    L9_9 = L4_4
    L5_5 = L5_5(L6_6, L7_7, L8_8, L9_9)
    L3_3 = L5_5
    L5_5 = L3_3.try_init
    L5_5(L6_6)
    L5_5 = L3_3.waitForReady
    L5_5(L6_6)
    L5_5 = L3_3.try_start
    L5_5(L6_6)
    L2_2 = nil
  end
  L4_4 = print
  L5_5 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\227\131\135\227\131\188\227\130\191\227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\231\181\130\228\186\134"
  L4_4(L5_5)
  L4_4 = print
  L5_5 = "\227\130\174\227\131\159\227\131\131\227\130\175BG\231\160\178\229\143\176\227\130\146\233\133\141\231\189\174\227\129\151\227\129\190\227\129\153\227\128\130"
  L4_4(L5_5)
  L4_4 = Fn_GetMechCannonMax
  L4_4 = L4_4()
  if L4_4 > 0 then
    function L5_5(A0_10)
      local L1_11, L2_12, L3_13
      L1_11 = L0_0
      if L1_11 then
        L1_11 = createGameObject2
        L2_12 = "GimmickBg"
        L1_11 = L1_11(L2_12)
        L2_12 = findGameObject2
        L3_13 = "Node"
        L2_12 = L2_12(L3_13, A0_10)
        L3_13 = L2_12
        L2_12 = L2_12.getWorldTransform
        L3_13 = L2_12(L3_13)
        L1_11:setDrawModelName("gun_kk_01")
        L1_11:setCollisionName("gun_kk_01")
        L1_11:setAttributeName("gun_kk_01")
        L1_11:setName(string.format("gun_kk_01_%s", string.sub(A0_10, 10)))
        L0_0:appendChild(L1_11)
        L1_11:setWorldTransform(L2_12, L3_13)
        L1_11:setForceMove()
        L1_11:setCollidableBlockEnable(false)
        L1_11:setVisibleBlockEnable(false)
        L1_11:setVisible(true)
        L1_11:try_init()
        L1_11:waitForReadyAsync(function()
          L1_11:try_start()
        end)
        return L1_11
      else
      end
      L1_11 = nil
      return L1_11
    end
    for L9_9 = 1, L4_4 do
      L5_5(string.format("locator2_mechcannon_%02d", L9_9))
    end
  else
  end
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "Mine99_029_Demo01"
  L0_0 = L0_0(L1_1)
  _demo01_cut01 = L0_0
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_01"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "spheresensor2_02"
  L0_0(L1_1)
end
function IngameBody()
  local L0_14, L1_15
  L0_14 = Fn_getMine99FloorClear
  L0_14 = L0_14()
  if L0_14 then
    L0_14 = Fn_setCatWarpCheckPoint
    L1_15 = "locator2_clear_pos_01"
    L0_14(L1_15)
    L0_14 = Fn_setBgmPoint
    L1_15 = "event"
    L0_14(L1_15, "non_boss")
    L0_14 = Fn_missionStart
    L0_14()
    L0_14 = Fn_userCtrlOn
    L0_14()
    L0_14 = print
    L1_15 = "\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153"
    L0_14(L1_15)
  else
    L0_14 = Fn_setCatWarpCheckPoint
    L1_15 = _param_mine99_base
    L1_15 = L1_15.litho_pc_pos_01
    L0_14(L1_15)
    L0_14 = Query
    L1_15 = L0_14
    L0_14 = L0_14.setEyeSightAngle
    L0_14(L1_15, Deg2Rad(80))
    L0_14 = Query
    L1_15 = L0_14
    L0_14 = L0_14.setEyeSightRange
    L0_14(L1_15, 90000)
    L0_14 = Fn_setBgmPoint
    L1_15 = "event"
    L0_14(L1_15, "boss_battle")
    L0_14 = BossBatlle
    L0_14 = L0_14.crate
    L0_14 = L0_14()
    _boss_battle = L0_14
    L0_14 = _boss_battle
    L1_15 = L0_14
    L0_14 = L0_14.init
    L0_14(L1_15)
    L0_14 = 0
    L1_15 = invokeTask
    L1_15(function()
      while not BossBatlle.createEnemyGenerator(_boss_battle, true, nil, 5, nil) do
        wait()
      end
      _boss_battle:requestIdlingEnemy(false)
      while not BossBatlle.createEnemyGenerator(_boss_battle, true, nil, nil, nil) do
        wait()
      end
      _boss_battle:requestIdlingEnemy(false)
      while not BossBatlle.createEnemyGenerator(_boss_battle, false, 3, 2, RandI(1, 3)) do
        wait()
      end
      _boss_battle:requestIdlingEnemy(false)
      while not BossBatlle.createEnemyGenerator(_boss_battle, false, 1, 3, RandI(4, 6)) do
        wait()
      end
      _boss_battle:requestIdlingEnemy(false)
      L0_14 = L0_14 + 1
    end)
    L1_15 = ReinforceMechSkyInit
    L1_15()
    _drop_wait = false
    L1_15 = Fn_sensorOn
    L1_15("cubesensor2_01")
    L1_15 = Fn_sensorOn
    L1_15("spheresensor2_02")
    function L1_15()
      invokeTask(function()
        Fn_showMineName()
        waitSeconds(3)
        Fn_captionView("ic_pi_monument_00280", 4)
        Fn_missionView("ic_pi_monument_obj_00280", 0, nil, true)
        Sound:playSE("skb_003", 1)
      end)
    end
    repeat
      wait()
    until L0_14 >= 1
    _boss_battle:requestIdlingEnemy(false)
    Fn_missionStart(L1_15)
    Fn_userCtrlOn()
    _boss_battle:requestIdlingEnemy(false)
    ReinforceMechSkyRequestIdlingEnemy(false)
    invokeTask(function()
      repeat
        _boss_battle:updateFlame()
        waitSeconds(1)
      until _battle_end_flg
    end)
    invokeTask(function()
      local L0_16, L1_17
      L0_16 = 0
      L1_17 = 0
      repeat
        if L0_16 > 0 then
          L0_16 = L0_16 - 1
        elseif _boss_hp_total > 0.6 then
          if L1_17 < 5 then
            if true == BossBatlle.createEnemyGenerator(_boss_battle, false, nil, nil, nil) then
              L1_17 = L1_17 + 1
              L0_16 = secondToGameTick(20)
            else
              L0_16 = secondToGameTick(1)
            end
          else
            L0_16 = secondToGameTick(1)
          end
        else
          BossBatlle.createEnemyGenerator(_boss_battle, false, nil, nil, nil)
          L0_16 = secondToGameTick(3)
        end
        wait()
      until _battle_end_flg
      print("\229\188\183\232\165\178\230\143\154\233\153\184\232\137\135 : \229\162\151\230\143\180\232\166\129\232\171\139\230\136\144\229\138\159\229\155\158\230\149\176\227\129\140\230\151\162\229\174\154\227\129\174\228\184\138\233\153\144\227\129\171\233\129\148\227\129\151\227\129\159\227\129\174\227\129\167\231\185\176\227\130\138\232\191\148\227\129\151\229\162\151\230\143\180\232\166\129\232\171\139\227\130\146\229\129\156\230\173\162\227\129\151\227\129\190\227\129\153")
    end)
    ReinforceMechSkyTaskStart()
    repeat
      wait()
      if _boss_battle.broken_boss_cnt >= 2 then
        _battle_end_flg = true
      end
    until _battle_end_flg
    Fn_setBgmPoint("event", "boss_battle_end")
    waitSeconds(8)
    Sound:playSE("ene_boss_finish", 1)
    Fn_whiteout()
    Fn_userCtrlOff()
    Fn_sensorOff("cubesensor2_01")
    Fn_sensorOff("spheresensor2_02")
    _boss_battle:finalize()
    _boss_battle = nil
    ReinforceMechSkyFinalize()
    stopSiren()
    Fn_userCtrlAllOff()
    Fn_resetPcPos("locator2_clear_pos_01")
    Fn_setCatWarpCheckPoint("locator2_clear_pos_01")
    Fn_missionInfoEnd()
    Fn_captionViewEnd()
    Fn_fadein()
    wait(10)
    Fn_setMine99FloorClear()
    Sound:playSE("skb_004", 1)
    Fn_captionViewWait("ic_litho_00100", 3, 4.5)
    waitSeconds(1)
    if Fn_rewardMineBoss("boss13") then
      print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
    else
      Fn_dropGraviryOre("locator2_reward_pos_01")
    end
    Fn_userCtrlOn()
    break
  end
  L0_14 = Fn_setGravityGateActive
  L1_15 = true
  L0_14(L1_15)
  L0_14 = Fn_cageMove
  L0_14()
end
function FinalizeBody()
  local L0_18, L1_19
end
function playSiren()
  stopSiren()
  _se_area_siren = Fn_findAreaHandle("ar_a_root")
  _se_hdl_siren = Sound:playSEHandle("ep10_siren", 1, "", _se_area_siren)
end
function stopSiren()
  _se_area_siren = nil
  if _se_hdl_siren then
    Sound:stopSEHandle(_se_hdl_siren)
    _se_hdl_siren = nil
  end
end
template_engen = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {},
  enemyDeadNum = 0,
  enemyAshNum = 0,
  onUpdate = function(A0_20)
    local L1_21
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onSpawn = function(A0_24, A1_25)
    print(A1_25:getName())
    A1_25:setInvincibility(true)
    A1_25:setEnableHomingTarget(false)
    A1_25:setVisibleEnemyMarker(false)
    A1_25:setVisibleBossMarker(false)
  end,
  onLeave = function(A0_26)
    local L1_27
  end,
  onObjectDead = function(A0_28, A1_29)
    local L2_30
    L2_30 = A1_29.getName
    L2_30 = L2_30(A1_29)
    print(string.format("%s\227\130\146\229\128\146\227\129\151\227\129\159", L2_30))
    A0_28:getSpecTable().enemyDeadNum = A0_28:getSpecTable().enemyDeadNum + 1
    if #A0_28:getSpecTable().spawnSet <= A0_28:getSpecTable().enemyDeadNum then
      A0_28:getSpecTable().kill_flg = true
    end
  end,
  kill_flg = false,
  name = nil,
  gen = nil,
  event_type = "move_droppoint",
  ref_ship_roat_idx = 0,
  ref_boss_flg = false,
  induction_move = false,
  placement_offset_in_idx = 0,
  placement_offset_out_idx = 9999
}
template_zako_engen_spawnSets = {
  {
    {
      type = "mechsmall",
      locator = nil,
      name = "mechsmall_01",
      target_vehicle = "landingship"
    },
    {
      type = "mechsmall",
      locator = nil,
      name = "mechsmall_02",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "soldier_01",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "soldier_02",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_05",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_06",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "mechsmall_pilot_01",
      target_vehicle = "mechsmall_01"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "mechsmall_pilot_02",
      target_vehicle = "mechsmall_02"
    }
  },
  {
    {
      type = "mechsmall",
      locator = nil,
      name = "mechsmall_01",
      target_vehicle = "landingship"
    },
    {
      type = "mechsmall",
      locator = nil,
      name = "mechsmall_02",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "soldier_01",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "soldier_02",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_05",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_06",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "mechsmall_pilot_01",
      target_vehicle = "mechsmall_01"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "mechsmall_pilot_02",
      target_vehicle = "mechsmall_02"
    }
  },
  {
    {
      type = "mechsmall",
      locator = nil,
      name = "mechsmall_01",
      target_vehicle = "landingship"
    },
    {
      type = "mechsmall",
      locator = nil,
      name = "mechsmall_02",
      target_vehicle = "landingship"
    },
    {
      type = "officer_launcher",
      locator = nil,
      name = "soldier_01",
      target_vehicle = "landingship"
    },
    {
      type = "officer_launcher",
      locator = nil,
      name = "soldier_02",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_05",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_06",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "mechsmall_pilot_01",
      target_vehicle = "mechsmall_01"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "mechsmall_pilot_02",
      target_vehicle = "mechsmall_02"
    }
  },
  {
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_01",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_02",
      target_vehicle = "landingship"
    },
    {
      type = "officer_launcher",
      locator = nil,
      name = "soldier_05",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_06",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_09",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_10",
      target_vehicle = "landingship"
    }
  },
  {
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_01",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_02",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "soldier_05",
      target_vehicle = "landingship"
    },
    {
      type = "officer_rifle",
      locator = nil,
      name = "soldier_06",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_09",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_rifle",
      locator = nil,
      name = "soldier_10",
      target_vehicle = "landingship"
    }
  },
  {
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_01",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_02",
      target_vehicle = "landingship"
    },
    {
      type = "officer_launcher",
      locator = nil,
      name = "soldier_05",
      target_vehicle = "landingship"
    },
    {
      type = "officer_launcher",
      locator = nil,
      name = "soldier_06",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_09",
      target_vehicle = "landingship"
    },
    {
      type = "soldier_launcher",
      locator = nil,
      name = "soldier_10",
      target_vehicle = "landingship"
    }
  }
}
template_boss_engen_spawnSets = {
  {
    {
      type = "mechbig_mine_01",
      locator = nil,
      name = "mechbig_01",
      ai_spawn_option = "MechBig/mechbig_mine_01",
      target_vehicle = "landingship"
    }
  },
  {
    {
      type = "mechbig_mine_01",
      locator = nil,
      name = "mechbig_02",
      ai_spawn_option = "MechBig/mechbig_mine_01",
      target_vehicle = "landingship"
    }
  }
}
template_landingship_roats = {
  [1] = {
    solder_range = Vector(42654.645, 32710.697, 84765.626) * 0.005,
    solder_range_node = "locator2_solder_range_01",
    in_roat = {
      "locator2_road_01_in_01",
      "locator2_road_01_in_02",
      "locator2_road_01_in_03",
      "locator2_road_01_in_04",
      "locator2_road_01_in_05",
      "locator2_road_01_in_06",
      "locator2_road_01_in_07",
      "locator2_road_01_in_08",
      "locator2_road_01_in_09",
      "locator2_road_01_in_10"
    },
    out_roat = {
      "locator2_road_01_out_01",
      "locator2_road_01_out_02",
      "locator2_road_01_out_03",
      "locator2_road_01_out_04",
      "locator2_road_01_out_05",
      "locator2_road_01_out_06",
      "locator2_road_01_out_07",
      "locator2_road_01_out_08",
      "locator2_road_01_out_09",
      "locator2_road_01_out_10"
    }
  },
  [2] = {
    rand_skip = true,
    solder_range = Vector(42654.645, 32710.697, 84765.626) * 0.005,
    solder_range_node = "locator2_solder_range_01",
    in_roat = {
      "locator2_road_02_in_01",
      "locator2_road_02_in_02",
      "locator2_road_02_in_03",
      "locator2_road_02_in_04",
      "locator2_road_02_in_05",
      "locator2_road_02_in_06",
      "locator2_road_02_in_07",
      "locator2_road_02_in_08",
      "locator2_road_02_in_09",
      "locator2_road_02_in_10"
    },
    out_roat = {
      "locator2_road_02_out_01",
      "locator2_road_02_out_02",
      "locator2_road_02_out_03",
      "locator2_road_02_out_04",
      "locator2_road_02_out_05",
      "locator2_road_02_out_06",
      "locator2_road_02_out_07",
      "locator2_road_02_out_08",
      "locator2_road_02_out_09",
      "locator2_road_02_out_10"
    }
  },
  [3] = {
    solder_range = Vector(42654.645, 32710.697, 84765.626) * 0.005,
    solder_range_node = "locator2_solder_range_01",
    in_roat = {
      "locator2_road_03_in_01",
      "locator2_road_03_in_02",
      "locator2_road_03_in_03",
      "locator2_road_03_in_04",
      "locator2_road_03_in_05",
      "locator2_road_03_in_06",
      "locator2_road_03_in_07",
      "locator2_road_03_in_08",
      "locator2_road_03_in_09",
      "locator2_road_03_in_10"
    },
    out_roat = {
      "locator2_road_03_out_01",
      "locator2_road_03_out_02",
      "locator2_road_03_out_03",
      "locator2_road_03_out_04",
      "locator2_road_03_out_05",
      "locator2_road_03_out_06",
      "locator2_road_03_out_07",
      "locator2_road_03_out_08",
      "locator2_road_03_out_09",
      "locator2_road_03_out_10"
    }
  },
  [4] = {
    solder_range = Vector(42654.645, 32710.697, 84765.626) * 0.005,
    solder_range_node = "locator2_solder_range_02",
    in_roat = {
      "locator2_road_04_in_01",
      "locator2_road_04_in_02",
      "locator2_road_04_in_03",
      "locator2_road_04_in_04",
      "locator2_road_04_in_05",
      "locator2_road_04_in_06",
      "locator2_road_04_in_07",
      "locator2_road_04_in_08",
      "locator2_road_04_in_09",
      "locator2_road_04_in_10"
    },
    out_roat = {
      "locator2_road_04_out_01",
      "locator2_road_04_out_02",
      "locator2_road_04_out_03",
      "locator2_road_04_out_04",
      "locator2_road_04_out_05",
      "locator2_road_04_out_06",
      "locator2_road_04_out_07",
      "locator2_road_04_out_08",
      "locator2_road_04_out_09",
      "locator2_road_04_out_10"
    }
  },
  [5] = {
    rand_skip = true,
    solder_range = Vector(42654.645, 32710.697, 84765.626) * 0.005,
    solder_range_node = "locator2_solder_range_02",
    in_roat = {
      "locator2_road_05_in_01",
      "locator2_road_05_in_02",
      "locator2_road_05_in_03",
      "locator2_road_05_in_04",
      "locator2_road_05_in_05",
      "locator2_road_05_in_06",
      "locator2_road_05_in_07",
      "locator2_road_05_in_08",
      "locator2_road_05_in_09",
      "locator2_road_05_in_10"
    },
    out_roat = {
      "locator2_road_05_out_01",
      "locator2_road_05_out_02",
      "locator2_road_05_out_03",
      "locator2_road_05_out_04",
      "locator2_road_05_out_05",
      "locator2_road_05_out_06",
      "locator2_road_05_out_07",
      "locator2_road_05_out_08",
      "locator2_road_05_out_09",
      "locator2_road_05_out_10"
    }
  },
  [6] = {
    solder_range = Vector(42654.645, 32710.697, 84765.626) * 0.005,
    solder_range_node = "locator2_solder_range_02",
    in_roat = {
      "locator2_road_06_in_01",
      "locator2_road_06_in_02",
      "locator2_road_06_in_03",
      "locator2_road_06_in_04",
      "locator2_road_06_in_05",
      "locator2_road_06_in_06",
      "locator2_road_06_in_07",
      "locator2_road_06_in_08",
      "locator2_road_06_in_09",
      "locator2_road_06_in_10"
    },
    out_roat = {
      "locator2_road_06_out_01",
      "locator2_road_06_out_02",
      "locator2_road_06_out_03",
      "locator2_road_06_out_04",
      "locator2_road_06_out_05",
      "locator2_road_06_out_06",
      "locator2_road_06_out_07",
      "locator2_road_06_out_08",
      "locator2_road_06_out_09",
      "locator2_road_06_out_10"
    }
  }
}
BossBatlle = {}
function BossBatlle.crate()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36
  L0_31 = {}
  L1_32(L2_33)
  L0_31.en_gen_max = 20
  L0_31.en_gen_create = 0
  L0_31.remaining_boss = 2
  L0_31.boss_hp_gage = L1_32
  L0_31.broken_boss_cnt = 0
  L0_31.reinforce_max = 5
  L0_31.reinforce = 0
  L0_31.run_enemy_num = 0
  L0_31.ship_status = L1_32
  L1_32.app_time_limit = 30
  L1_32.roat_status = L2_33
  for L4_35 = 1, #L2_33 do
    L5_36 = {}
    L5_36.boss_only_roat = template_landingship_roats[L4_35].rand_skip or false
    L5_36.ref_cnt = 0
    L5_36.count_down_time = 0
    table.insert(L0_31.ship_status.roat_status, L5_36)
  end
  L3_34.main = 5
  L4_35 = {}
  L4_35.main = 2
  L1_32.boss_roats = L2_33
  L1_32.human = 0
  L1_32.mechsmall = 0
  L0_31.type_advent_num = L1_32
  L1_32.human = 20
  L1_32.mechsmall = 4
  L0_31.type_advent_max = L1_32
  return L0_31
end
function BossBatlle._installMethods(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42
  for L4_41, L5_42 in L1_38(L2_39) do
    if type(L5_42) == "function" then
      A0_37[L4_41] = L5_42
    end
  end
end
function BossBatlle._isValid(A0_43)
  if A0_43 == nil then
    print("BossBatlle._isValid")
    return false
  end
  return true
end
function BossBatlle.createEnemyGenerator(A0_44, A1_45, A2_46, A3_47, A4_48)
  local L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65
  L5_49 = BossBatlle
  L5_49 = L5_49._isValid
  L5_49 = L5_49(L6_50)
  if not L5_49 then
    L5_49 = false
    return L5_49
  end
  L5_49 = A0_44.en_gen_max
  if L5_49 <= L6_50 then
    L5_49 = print
    L5_49(L6_50)
    L5_49 = false
    return L5_49
  end
  L5_49 = nil
  for L9_53 = 1, A0_44.en_gen_max do
    L10_54 = string
    L10_54 = L10_54.format
    L11_55 = "enmgen2_boss_battle_%03d"
    L10_54 = L10_54(L11_55, L12_56)
    L11_55 = _G
    L11_55 = L11_55[L10_54]
    if L11_55 then
      L11_55 = _G
      L11_55 = L11_55[L10_54]
      L11_55 = L11_55.name
      if not L11_55 then
        L5_49 = L10_54
        break
      end
    end
  end
  if L5_49 then
    L9_53 = false
    if A1_45 then
      L10_54 = A0_44.remaining_boss
      if L10_54 > 0 then
        L9_53 = true
        L6_50 = A4_48 or A0_44.remaining_boss
        L10_54 = A0_44.ship_status
        L10_54 = L10_54.boss_roats
        L10_54 = L10_54[L6_50]
        if false == L7_51 then
          L10_54 = false
          return L10_54
        else
          L10_54 = A0_44.ship_status
          L10_54 = L10_54.boss_roats
          L10_54 = L10_54[L6_50]
          L10_54 = L10_54.main
        end
        L10_54 = A0_44.remaining_boss
        L10_54 = L10_54 - 1
        A0_44.remaining_boss = L10_54
      else
        L10_54 = print
        L11_55 = "Failed : Boss Max (BossBatlle:createEnemyGenerator)"
        L10_54(L11_55)
        L10_54 = false
        return L10_54
      end
    else
      L10_54 = A2_46 or L10_54(L11_55)
    end
    if false == L7_51 then
      L10_54 = false
      return L10_54
    end
    L10_54 = {}
    L11_55 = {}
    if true == L9_53 then
      L11_55 = L12_56[L6_50]
    elseif A4_48 then
      L11_55 = L12_56[A4_48]
      for L15_59, L16_60 in L12_56(L13_57) do
        if L17_61 then
          L17_61.mechsmall = L18_62
        elseif L17_61 then
          if nil == L17_61 then
            L17_61.human = L18_62
          end
        end
      end
    else
      if L13_57 < L14_58 then
        L15_59 = L14_58 - L13_57
        L15_59 = L15_59 % 2
        if L15_59 == 0 then
          L15_59 = math
          L15_59 = L15_59.min
          L15_59 = L15_59(L16_60, L17_61)
          for L20_64 = 1, L15_59 do
            L21_65 = L13_57 + L20_64
            table.insert(L11_55, {
              name = string.format("soldier_%02d", L21_65),
              type = L16_60[RandI(1, #L16_60)],
              locator = nil,
              target_vehicle = "landingship"
            })
          end
          L17_61.human = L18_62
        end
      end
      if L13_57 < L14_58 then
        L15_59 = math
        L15_59 = L15_59.min
        L15_59 = L15_59(L16_60, L17_61)
        for L19_63 = 1, L15_59 do
          L20_64 = L13_57 + L19_63
          L21_65 = string
          L21_65 = L21_65.format
          L21_65 = L21_65("mechsmall_%02d", L20_64)
          table.insert(L11_55, {
            name = L21_65,
            type = "mechsmall",
            locator = nil,
            target_vehicle = "landingship"
          })
          table.insert(L11_55, {
            name = string.format("mechsmall_pilot_%02d", L20_64),
            type = "officer_rifle",
            locator = nil,
            target_vehicle = L21_65
          })
        end
        L16_60.mechsmall = L17_61
      end
      if L12_56 <= 0 then
        return L13_57
      end
    end
    for L15_59, L16_60 in L12_56(L13_57) do
      L17_61.type = L18_62
      L20_64 = L16_60.name
      L17_61.name = L18_62
      L20_64 = L16_60.target_vehicle
      L17_61.target_vehicle = L18_62
      L20_64 = 0
      L21_65 = 0
      L17_61.locator = L18_62
      L20_64 = L17_61
      L18_62(L19_63, L20_64)
    end
    L11_55 = L5_49
    L11_55 = L11_55 .. L12_56
    L12_56.type = "landingship"
    L12_56.name = L11_55
    L15_59 = 0
    L12_56.locator = L13_57
    L15_59 = L12_56
    L13_57(L14_58, L15_59)
    L15_59 = L5_49
    L13_57(L14_58, L15_59)
    L15_59 = L5_49
    L13_57(L14_58, L15_59)
    L13_57.spawnSet = L10_54
    L13_57.gen = L12_56
    L13_57.kill_flg = false
    L13_57.name = L5_49
    L13_57.spawnOnStart = false
    L13_57.autoPrepare = false
    L13_57.enemyDeadNum = 0
    L13_57.enemyAshNum = 0
    L13_57.event_type = "move_droppoint"
    L13_57.ref_boss_flg = L9_53
    L13_57.induction_move = L8_52
    L13_57.ref_ship_roat_idx = L7_51
    L14_58 = A3_47 or 0
    L13_57.placement_offset_in_idx = L14_58
    L13_57.placement_offset_out_idx = 9999
    L15_59 = L13_57.placement_offset_in_idx
    L15_59 = 1 + L15_59
    L15_59 = findGameObject2
    L15_59 = L15_59(L16_60, L17_61)
    L16_60(L17_61, L18_62)
    if L16_60 then
      L21_65 = L16_60
      L20_64 = L16_60.getWorldTransform
      L21_65 = L20_64(L21_65)
      L21_65 = L12_56
      L20_64 = L12_56.addActionArea
      L20_64(L21_65, L17_61, L18_62, L19_63)
      L21_65 = L12_56
      L20_64 = L12_56.addRespawnArea
      L20_64(L21_65, L17_61 + Vector(10, 10, 10), L18_62, L19_63)
      L21_65 = L12_56
      L20_64 = L12_56.addActiveArea
      L20_64(L21_65, L17_61 + Vector(20, 20, 20), L18_62, L19_63)
    else
      L20_64 = 999999
      L21_65 = 999999
      L20_64 = Vector
      L21_65 = 0
      L20_64 = L20_64(L21_65, 0, 0)
      L21_65 = Quat
      L21_65 = L21_65(0, 0, 0, 1)
      L17_61(L18_62, L19_63, L20_64, L21_65, L21_65(0, 0, 0, 1))
      L20_64 = 999999
      L21_65 = 999999
      L20_64 = Vector
      L21_65 = 0
      L20_64 = L20_64(L21_65, 0, 0)
      L21_65 = Quat
      L21_65 = L21_65(0, 0, 0, 1)
      L17_61(L18_62, L19_63, L20_64, L21_65, L21_65(0, 0, 0, 1))
      L20_64 = 999999
      L21_65 = 999999
      L20_64 = Vector
      L21_65 = 0
      L20_64 = L20_64(L21_65, 0, 0)
      L21_65 = Quat
      L21_65 = L21_65(0, 0, 0, 1)
      L17_61(L18_62, L19_63, L20_64, L21_65, L21_65(0, 0, 0, 1))
    end
    L17_61(L18_62)
    L17_61(L18_62)
    L17_61(L18_62)
    L17_61(L18_62)
    repeat
      L17_61()
    until L17_61
    L20_64 = L12_56
    L19_63(L20_64)
    L20_64 = L17_61
    L21_65 = "enemy_landingship_event"
    L19_63(L20_64, L21_65, L18_62)
    A0_44.en_gen_create = L19_63
    repeat
      L19_63()
      L20_64 = L12_56
    until L19_63
    return L19_63
  else
  end
  return L6_50
end
function BossBatlle._randamuOrderZakoSpawnSetId(A0_66)
  return (RandI(1, #template_zako_engen_spawnSets))
end
function BossBatlle._OrderLandingShipId(A0_67, A1_68)
  local L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76
  L2_69 = 0
  L3_70, L4_71 = nil, nil
  L5_72 = Query
  L5_72 = L5_72.setEyeSightTransform
  L9_76 = L7_74(L8_75)
  L5_72(L6_73, L7_74, L8_75, L9_76, L7_74(L8_75))
  L5_72 = {}
  for L9_76, _FORV_10_ in L6_73(L7_74) do
    if false == _FORV_10_.boss_only_roat and 0 >= _FORV_10_.count_down_time then
      L3_70 = findGameObject2("Node", string.format("locator2_road_%02d_in_01", L9_76))
      if L3_70 and (false == Fn_isInSightTarget(L3_70, 1) or nil == Query:calcInSightRatioSphere(L3_70:getWorldPos(), 1)) then
        table.insert(L5_72, L9_76)
      end
    end
  end
  if L6_73 <= 0 then
    return L6_73
  end
  L2_69 = L5_72[L6_73]
  L6_73.ref_cnt = L7_74
  L6_73.count_down_time = L7_74
  return L2_69
end
function BossBatlle.init(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L10_87, L11_88
  if not L1_78 then
    return L1_78
  end
  if L1_78 then
    if "number" == L1_78 then
      if L1_78 > 0 then
        for L4_81 = 1, A0_77.en_gen_max do
          L5_82 = string
          L5_82 = L5_82.format
          L6_83 = "enmgen2_boss_battle_%03d"
          L5_82 = L5_82(L6_83, L7_84)
          L6_83 = _G
          L6_83[L5_82] = L7_84
          L6_83 = _G
          L6_83 = L6_83[L5_82]
          for L10_87, L11_88 in L7_84(L8_85) do
            if "table" == type(L11_88) then
              L6_83[L10_87] = {}
            else
              L6_83[L10_87] = L11_88
            end
          end
          L6_83.onObjectAsh = L7_84
        end
      end
    end
  end
end
function BossBatlle.requestIdlingEnemy(A0_89, A1_90)
  local L2_91, L3_92, L4_93, L5_94, L6_95
  if not L2_91 then
    return L2_91
  end
  if L2_91 then
    if "number" == L2_91 then
      if L2_91 > 0 then
        for L5_94 = 1, A0_89.en_gen_max do
          L6_95 = string
          L6_95 = L6_95.format
          L6_95 = L6_95("enmgen2_boss_battle_%03d", L5_94)
          if findGameObject2("EnemyGenerator", L6_95) then
            findGameObject2("EnemyGenerator", L6_95):requestIdlingEnemy(A1_90)
          end
        end
      end
    end
  end
end
function BossBatlle.finalize(A0_96)
  local L1_97, L2_98, L3_99, L4_100, L5_101
  if not L1_97 then
    return L1_97
  end
  if L1_97 then
    if "number" == L1_97 then
      if L1_97 > 0 then
        for L4_100 = 1, A0_96.en_gen_max do
          L5_101 = string
          L5_101 = L5_101.format
          L5_101 = L5_101("enmgen2_boss_battle_%03d", L4_100)
          if findGameObject2("EnemyGenerator", L5_101) then
            findGameObject2("EnemyGenerator", L5_101):try_term()
          end
        end
      end
    end
  end
  L1_97(L2_98)
  A0_96.boss_hp_gage = L1_97
end
function BossBatlle.updateFlame(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107, L6_108
  if not L1_103 then
    return L1_103
  end
  for L4_106, L5_107 in L1_103(L2_104) do
    L6_108 = L5_107.count_down_time
    if L6_108 > 0 then
      L6_108 = L5_107.count_down_time
      L6_108 = L6_108 - 1
      L5_107.count_down_time = L6_108
    end
  end
  if L1_103 > 0 then
    A0_102.reinforce = L1_103
  else
    A0_102.reinforce = L1_103
  end
  for L6_108 = 1, A0_102.en_gen_max do
    if _G[string.format("enmgen2_boss_battle_%03d", L6_108)].gen then
      if true == _G[string.format("enmgen2_boss_battle_%03d", L6_108)].kill_flg then
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].gen:try_term()
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].gen = nil
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].name = nil
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].spawnSet = {}
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].enemyDeadNum = 0
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].enemyAshNum = 0
      elseif _G[string.format("enmgen2_boss_battle_%03d", L6_108)].gen:isRunning() then
      else
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].gen:try_term()
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].gen = nil
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].name = nil
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].spawnSet = {}
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].enemyDeadNum = 0
        _G[string.format("enmgen2_boss_battle_%03d", L6_108)].enemyAshNum = 0
      end
    end
  end
  A0_102.en_gen_create = L1_103
  A0_102.run_enemy_num = L2_104
end
function BossBatlle.landingshipEvent(A0_109, A1_110, A2_111, A3_112)
  local L4_113, L5_114, L6_115, L7_116, L8_117, L9_118, L10_119, L11_120, L12_121
  L4_113 = BossBatlle
  L4_113 = L4_113._isValid
  L4_113 = L4_113(L5_114)
  if not L4_113 then
    L4_113 = false
    return L4_113
  end
  L4_113 = _G
  L4_113 = L4_113[A2_111]
  if L5_114 == "kill" then
    A1_110.changeState = "kill"
  else
    if L5_114 == "wait" then
      if L5_114 then
        A1_110.changeState = "wait"
      elseif L5_114 == "drop_human" then
        A1_110.changeState = "open"
      elseif L5_114 == "drop_mech" then
        A1_110.changeState = "drop"
        for L9_118, L10_119 in L6_115(L7_116) do
          L11_120 = _checkTypeMech
          L12_121 = L10_119.type
          L11_120 = L11_120(L12_121)
          if L11_120 then
            L11_120 = table
            L11_120 = L11_120.insert
            L12_121 = L5_114
            L11_120(L12_121, L10_119.name)
          end
        end
        A1_110.dropEnemy = L5_114
      elseif L5_114 == "move_droppoint" then
        A1_110.changeState = "move"
        A1_110.movePoint = L5_114
        for L8_117, L9_118 in L5_114(L6_115) do
          L10_119 = L4_113.placement_offset_in_idx
          if L8_117 > L10_119 then
            L10_119 = table
            L10_119 = L10_119.insert
            L11_120 = A1_110.movePoint
            L12_121 = L9_118
            L10_119(L11_120, L12_121)
          end
        end
      elseif L5_114 == "land_back" then
        A1_110.changeState = "move"
        A1_110.movePoint = L5_114
        for L9_118, L10_119 in L6_115(L7_116) do
          L11_120 = L4_113.placement_offset_out_idx
          if L9_118 <= L11_120 then
            L11_120 = table
            L11_120 = L11_120.insert
            L12_121 = A1_110.movePoint
            L11_120(L12_121, L10_119)
          end
        end
      end
    end
    if L5_114 == "moveEnd" then
      if not L5_114 then
        if not L5_114 then
          if L5_114 == "move_droppoint" then
            for L10_119, L11_120 in L7_116(L8_117) do
              L12_121 = _checkTypeMech
              L12_121 = L12_121(L11_120.type)
              if L12_121 then
              else
                L12_121 = _checkTypeStationedSoldiers
                L12_121 = L12_121(L11_120.type)
                if L12_121 then
                end
              end
            end
            if L5_114 then
              L4_113.event_type = "drop_mech"
            elseif L6_115 then
              L4_113.event_type = "drop_human"
            end
          elseif L5_114 == "land_back" then
            A1_110.changeState = "kill"
            L4_113.event_type = "empty"
            L6_115.ref_cnt = L7_116
          end
        end
      end
    end
    if L5_114 == "openEnd" then
      if L5_114 == "drop_human" then
        for L8_117, L9_118 in L5_114(L6_115) do
          L10_119 = _checkTypeStationedSoldiers
          L11_120 = L9_118.type
          L10_119 = L10_119(L11_120)
          if L10_119 then
            L10_119 = findGameObject2
            L11_120 = "EnemyBrain"
            L12_121 = L9_118.name
            L10_119 = L10_119(L11_120, L12_121)
            if L10_119 then
              L12_121 = L10_119
              L11_120 = L10_119.setInvincibility
              L11_120(L12_121, false)
              L12_121 = L10_119
              L11_120 = L10_119.setVisibleEnemyMarker
              L11_120(L12_121, true)
              L12_121 = L10_119
              L11_120 = L10_119.setEnableHomingTarget
              L11_120(L12_121, true)
            end
          end
        end
      end
      L4_113.event_type = "land_back"
    end
    if L5_114 == "dropEnd" then
      if L5_114 == "drop_mech" then
        for L10_119, L11_120 in L7_116(L8_117) do
          L12_121 = _checkTypeMech
          L12_121 = L12_121(L11_120.type)
          if L12_121 then
            L12_121 = findGameObject2
            L12_121 = L12_121("EnemyBrain", L11_120.name)
            if L12_121 then
              if "mechsmall" == L11_120.type then
                invokeTask(function(A0_122, A1_123)
                  repeat
                    wait()
                  until L12_121:isReadyEnemy()
                  L12_121:move({
                    string.format("locator2_mech_%02d_%02d", A0_122, A1_123)
                  }, {move_mode = "run"})
                  repeat
                    wait()
                  until L12_121:isMoveEnd()
                  L12_121:setInvincibility(false)
                  L12_121:setVisibleEnemyMarker(true)
                  L12_121:setEnableHomingTarget(true)
                  L12_121:endScriptAction()
                end, A3_112, L5_114)
              else
                L12_121:setInvincibility(false)
                L12_121:setVisibleEnemyMarker(true)
                L12_121:setEnableHomingTarget(true)
                if "mechbig_mine_01" == L11_120.type then
                  stopSiren()
                  A0_109:addBossHpGage(L12_121, findGameObject2("Puppet", L12_121:getName()))
                  L12_121:setVisibleBossMarker(true)
                  if _play_sien_cnt_max <= _play_sien_cnt then
                    Fn_sensorOff("spheresensor2_02")
                    else
                      L12_121 = _checkTypeStationedSoldiers
                      L12_121 = L12_121(L11_120.type)
                      if L12_121 then
                      end
                    end
                  end
                end
              end
            else
            end
        end
        if L6_115 then
          L4_113.event_type = "drop_human"
        else
          L4_113.event_type = "land_back"
        end
      else
        L4_113.event_type = "land_back"
      end
    end
  end
  return A1_110
end
function BossBatlle.getRunEnemyNum(A0_124)
  if not BossBatlle._isValid(A0_124) then
    return false
  end
  return A0_124.run_enemy_num
end
function BossBatlle.addBossHpGage(A0_125, A1_126, A2_127)
  local L3_128
  L3_128 = BossBatlle
  L3_128 = L3_128._isValid
  L3_128 = L3_128(A0_125)
  if not L3_128 then
    L3_128 = false
    return L3_128
  end
  if not A2_127 or not A1_126 then
    L3_128 = false
    return L3_128
  end
  L3_128 = A0_125.boss_hp_gage
  L3_128 = #L3_128
  L3_128 = L3_128 + 1
  A0_125.boss_hp_gage[L3_128] = HUD:createBossHpGauge({
    obj = A2_127,
    hp = 1,
    text = string.format("ui_boss_hp_%02d", 7 + L3_128 - 1)
  })
  invokeTask(function()
    _boss_hp_tbl[L3_128] = 1
    A0_125.boss_hp_gage[L3_128]:setActive(true)
    while A0_125.boss_hp_gage[L3_128] and A2_127 and A2_127:isRunning() and A2_127:getParent():getSpecTable().enemyAshNum <= 0 do
      _boss_hp_tbl[L3_128] = A1_126:getHealth() / A1_126:getMaxHealth()
      A0_125.boss_hp_gage[L3_128]:setHp(_boss_hp_tbl[L3_128])
      _boss_hp_total = (_boss_hp_tbl[1] + _boss_hp_tbl[2]) / 2
      wait()
    end
    _boss_hp_tbl[L3_128] = 0
    A0_125.boss_hp_gage[L3_128]:setActive(false)
    A0_125.broken_boss_cnt = A0_125.broken_boss_cnt + 1
  end)
  if L3_128 <= 1 then
    Fn_setBgmPoint("event", "boss_battle2")
  end
end
function _checkTypeMech(A0_129)
  local L1_130
  if "mechbig_mine_01" == A0_129 or A0_129 == "mechsmall" then
    L1_130 = true
    return L1_130
  end
  L1_130 = false
  return L1_130
end
function _checkTypeStationedSoldiers(A0_131)
  if string.find(A0_131, "officer_") or string.find(A0_131, "soldier_") then
    return true
  end
  return false
end
function _checkNameMechPilot(A0_132)
  if string.find(A0_132, "pilot") then
    return true
  end
  return false
end
function cubesensor2_01_OnLeave(A0_133, A1_134)
  local L2_135, L3_136, L4_137, L5_138
  L3_136 = A1_134
  L2_135 = A1_134.getName
  L2_135 = L2_135(L3_136)
  L3_136 = print
  L4_137 = "callback cubesensor2_01 OnLeave :"
  L5_138 = L2_135
  L4_137 = L4_137 .. L5_138
  L3_136(L4_137)
  L3_136 = string
  L3_136 = L3_136.find
  L4_137 = L2_135
  L5_138 = "_landingship"
  L3_136 = L3_136(L4_137, L5_138)
  if L3_136 ~= nil then
    L4_137 = A1_134
    L3_136 = A1_134.getBrain
    L3_136 = L3_136(L4_137)
    L5_138 = A1_134
    L4_137 = A1_134.getParent
    L4_137 = L4_137(L5_138)
    if L4_137 then
      L5_138 = print
      L5_138(L4_137:getName())
      L5_138 = L4_137.getSpecTable
      L5_138 = L5_138(L4_137)
      if "land_back" == L5_138.event_type then
        invokeTask(function()
          while A1_134 and A1_134:isRunning() and not _battle_end_flg do
            Query:setEyeSightTransform(Camera:getEyePos())
            if false ~= Fn_isInSightTarget(A1_134, 1) and nil ~= Query:calcInSightRatioSphere(A1_134:getWorldPos(), 1) then
              waitSeconds(1)
            end
          end
          if "table" == type(L5_138) then
            L5_138.event_type = "kill"
          end
        end)
      end
    end
  else
  end
end
function spheresensor2_02_OnEnter(A0_139, A1_140)
  local L2_141
  L2_141 = _play_sien_cnt
  if L2_141 < _play_sien_cnt_max then
    L2_141 = A1_140.getName
    L2_141 = L2_141(A1_140)
    print("callback spheresensor2_02 OnEneter :" .. L2_141)
    if string.find(L2_141, "mechbig_") ~= nil then
      playSiren()
      _play_sien_cnt = _play_sien_cnt + 1
    end
  end
end
function ReinforceMechSkyInit()
  enmgen2_reinforce_mechsky_03.init()
  enmgen2_reinforce_mechsky_04.init()
  enmgen2_reinforce_mechsky_03.gen:requestSpawn()
  enmgen2_reinforce_mechsky_04.gen:requestSpawn()
  repeat
    wait()
  until enmgen2_reinforce_mechsky_03.gen:isSpawnOnStartFinished()
  repeat
    wait()
  until enmgen2_reinforce_mechsky_04.gen:isSpawnOnStartFinished()
  ReinforceMechSkyRequestIdlingEnemy(true)
end
function ReinforceMechSkyInit2()
  enmgen2_reinforce_mechsky_03.init()
  enmgen2_reinforce_mechsky_04.init()
end
function ReinforceMechSkyTaskStart()
  invokeTask(function()
    local L0_142
    L0_142 = 0
    repeat
      while L0_142 < 6 do
        if enmgen2_reinforce_mechsky_03.checkAddvent() then
          if enmgen2_reinforce_mechsky_03.gen:requestSpawn() then
            L0_142 = L0_142 + 1
          end
        elseif enmgen2_reinforce_mechsky_04.checkAddvent() and enmgen2_reinforce_mechsky_04.gen:requestSpawn() then
          L0_142 = L0_142 + 1
        end
        waitSeconds(30)
        do break end
        break
      end
    until _battle_end_flg
    print("\230\169\159\230\162\176\229\133\181\239\188\136\231\169\186\228\184\173\239\188\137 : \229\162\151\230\143\180\232\166\129\232\171\139\230\136\144\229\138\159\229\155\158\230\149\176\227\129\140\230\151\162\229\174\154\227\129\174\228\184\138\233\153\144\227\129\171\233\129\148\227\129\151\227\129\159\227\129\174\227\129\167\231\185\176\227\130\138\232\191\148\227\129\151\229\162\151\230\143\180\232\166\129\232\171\139\227\130\146\229\129\156\230\173\162\227\129\151\227\129\190\227\129\153")
  end)
end
function ReinforceMechSkyRequestIdlingEnemy(A0_143)
  enmgen2_reinforce_mechsky_03.requestIdlingEnemy(A0_143)
  enmgen2_reinforce_mechsky_04.requestIdlingEnemy(A0_143)
end
function ReinforceMechSkyFinalize()
  enmgen2_reinforce_mechsky_03.finalize()
  enmgen2_reinforce_mechsky_04.finalize()
end
enmgen2_reinforce_mechsky_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {},
  enemyDeadNum = 0,
  gen = nil,
  advent_node = "enmgen2_reinforce_mechsky_01_01",
  advent_node_hdl = nil,
  spawnSet = {},
  onUpdate = function(A0_144)
    local L1_145
  end,
  onEnter = function(A0_146)
    local L1_147
  end,
  onSpawn = function(A0_148, A1_149)
  end,
  onLeave = function(A0_150)
    local L1_151
  end,
  onObjectDead = function(A0_152, A1_153)
    local L3_154
    L3_154 = enmgen2_reinforce_mechsky_01
    L3_154.enemyDeadNum = enmgen2_reinforce_mechsky_01.enemyDeadNum + 1
  end,
  onObjectAsh = function(A0_155, A1_156)
  end,
  init = function()
    local L0_157
    L0_157 = enmgen2_reinforce_mechsky_01
    L0_157.spawnSet = {
      {
        type = "mechsky",
        locator = enmgen2_reinforce_mechsky_01.advent_node,
        name = "enmgen2_reinforce_mechsky_01_mechsmall_01"
      },
      {
        type = "soldier_rifle",
        locator = enmgen2_reinforce_mechsky_01.advent_node,
        name = "enmgen2_reinforce_mechsky_01_mechsky_pilot_01",
        target_vehicle = "enmgen2_reinforce_mechsky_01_mechsmall_01"
      }
    }
    L0_157 = enmgen2_reinforce_mechsky_01
    L0_157.gen = findGameObject2("EnemyGenerator", "enmgen2_reinforce_mechsky_01")
    L0_157 = enmgen2_reinforce_mechsky_01
    L0_157.advent_node_hdl = findGameObject2("EnemyGenerator", enmgen2_reinforce_mechsky_01.advent_node)
    L0_157 = enmgen2_reinforce_mechsky_01
    L0_157.enemyDeadNum = 0
  end,
  addvent = function()
    if enmgen2_reinforce_mechsky_01.advent_node_hdl and enmgen2_reinforce_mechsky_01.gen and 0 >= enmgen2_reinforce_mechsky_01.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_01.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_01.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_01.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      enmgen2_reinforce_mechsky_01.enemyAliveNum = 0
      enmgen2_reinforce_mechsky_01.enemyDeadNum = 0
      enmgen2_reinforce_mechsky_01.gen:requestSpawn()
      repeat
        wait()
      until enmgen2_reinforce_mechsky_01.gen:requestPrepare()
    end
  end,
  checkAddvent = function()
    if enmgen2_reinforce_mechsky_01.advent_node_hdl and enmgen2_reinforce_mechsky_01.gen and 0 >= enmgen2_reinforce_mechsky_01.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_01.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_01.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_01.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      return true
    end
    return false
  end,
  requestIdlingEnemy = function(A0_158)
    if enmgen2_reinforce_mechsky_01.gen then
      enmgen2_reinforce_mechsky_01.gen:requestIdlingEnemy(A0_158)
    end
  end,
  finalize = function()
    if enmgen2_reinforce_mechsky_01.gen then
      enmgen2_reinforce_mechsky_01.gen:try_term()
      enmgen2_reinforce_mechsky_01.gen = nil
      enmgen2_reinforce_mechsky_01.advent_node_hdl = nil
      enmgen2_reinforce_mechsky_01.enemyDeadNum = 0
    end
  end
}
enmgen2_reinforce_mechsky_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {},
  enemyDeadNum = 0,
  gen = nil,
  advent_node = "enmgen2_reinforce_mechsky_02_01",
  advent_node_hdl = nil,
  spawnSet = {},
  onUpdate = function(A0_159)
    local L1_160
  end,
  onEnter = function(A0_161)
    local L1_162
  end,
  onSpawn = function(A0_163, A1_164)
  end,
  onLeave = function(A0_165)
    local L1_166
  end,
  onObjectDead = function(A0_167, A1_168)
    local L3_169
    L3_169 = enmgen2_reinforce_mechsky_02
    L3_169.enemyDeadNum = enmgen2_reinforce_mechsky_02.enemyDeadNum + 1
  end,
  onObjectAsh = function(A0_170, A1_171)
  end,
  init = function()
    local L0_172
    L0_172 = enmgen2_reinforce_mechsky_02
    L0_172.spawnSet = {
      {
        type = "mechsky",
        locator = enmgen2_reinforce_mechsky_02.advent_node,
        name = "enmgen2_reinforce_mechsky_02_mechsmall_01"
      },
      {
        type = "soldier_rifle",
        locator = enmgen2_reinforce_mechsky_02.advent_node,
        name = "enmgen2_reinforce_mechsky_02_mechsky_pilot_01",
        target_vehicle = "enmgen2_reinforce_mechsky_02_mechsmall_01"
      }
    }
    L0_172 = enmgen2_reinforce_mechsky_02
    L0_172.gen = findGameObject2("EnemyGenerator", "enmgen2_reinforce_mechsky_02")
    L0_172 = enmgen2_reinforce_mechsky_02
    L0_172.advent_node_hdl = findGameObject2("EnemyGenerator", enmgen2_reinforce_mechsky_02.advent_node)
    L0_172 = enmgen2_reinforce_mechsky_02
    L0_172.enemyDeadNum = 0
  end,
  addvent = function()
    if enmgen2_reinforce_mechsky_02.advent_node_hdl and enmgen2_reinforce_mechsky_02.gen and 0 >= enmgen2_reinforce_mechsky_02.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_02.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_02.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_02.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      enmgen2_reinforce_mechsky_02.enemyAliveNum = 0
      enmgen2_reinforce_mechsky_02.enemyDeadNum = 0
      enmgen2_reinforce_mechsky_02.gen:requestSpawn()
      repeat
        wait()
      until enmgen2_reinforce_mechsky_02.gen:requestPrepare()
    end
  end,
  checkAddvent = function()
    if enmgen2_reinforce_mechsky_02.advent_node_hdl and enmgen2_reinforce_mechsky_02.gen and 0 >= enmgen2_reinforce_mechsky_02.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_02.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_02.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_02.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      return true
    end
    return false
  end,
  requestIdlingEnemy = function(A0_173)
    if enmgen2_reinforce_mechsky_02.gen then
      enmgen2_reinforce_mechsky_02.gen:requestIdlingEnemy(A0_173)
    end
  end,
  finalize = function()
    if enmgen2_reinforce_mechsky_02.gen then
      enmgen2_reinforce_mechsky_02.gen:try_term()
      enmgen2_reinforce_mechsky_02.gen = nil
      enmgen2_reinforce_mechsky_02.advent_node_hdl = nil
      enmgen2_reinforce_mechsky_02.enemyDeadNum = 0
    end
  end
}
enmgen2_reinforce_mechsky_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {},
  enemyDeadNum = 0,
  gen = nil,
  advent_node = "enmgen2_reinforce_mechsky_03_01",
  advent_node_hdl = nil,
  spawnSet = {},
  onUpdate = function(A0_174)
    local L1_175
  end,
  onEnter = function(A0_176)
    local L1_177
  end,
  onSpawn = function(A0_178, A1_179)
  end,
  onLeave = function(A0_180)
    local L1_181
  end,
  onObjectDead = function(A0_182, A1_183)
    local L3_184
    L3_184 = enmgen2_reinforce_mechsky_03
    L3_184.enemyDeadNum = enmgen2_reinforce_mechsky_03.enemyDeadNum + 1
  end,
  onObjectAsh = function(A0_185, A1_186)
  end,
  init = function()
    local L0_187
    L0_187 = enmgen2_reinforce_mechsky_03
    L0_187.spawnSet = {
      {
        type = "mechsky",
        locator = enmgen2_reinforce_mechsky_03.advent_node,
        name = "enmgen2_reinforce_mechsky_03_mechsmall_01"
      },
      {
        type = "soldier_rifle",
        locator = enmgen2_reinforce_mechsky_03.advent_node,
        name = "enmgen2_reinforce_mechsky_03_mechsky_pilot_01",
        target_vehicle = "enmgen2_reinforce_mechsky_03_mechsmall_01"
      }
    }
    L0_187 = enmgen2_reinforce_mechsky_03
    L0_187.gen = findGameObject2("EnemyGenerator", "enmgen2_reinforce_mechsky_03")
    L0_187 = enmgen2_reinforce_mechsky_03
    L0_187.advent_node_hdl = findGameObject2("EnemyGenerator", enmgen2_reinforce_mechsky_03.advent_node)
    L0_187 = enmgen2_reinforce_mechsky_03
    L0_187.enemyDeadNum = 0
  end,
  addvent = function()
    if enmgen2_reinforce_mechsky_03.advent_node_hdl and enmgen2_reinforce_mechsky_03.gen and 0 >= enmgen2_reinforce_mechsky_03.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_03.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_03.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_03.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      enmgen2_reinforce_mechsky_03.enemyAliveNum = 0
      enmgen2_reinforce_mechsky_03.enemyDeadNum = 0
      enmgen2_reinforce_mechsky_03.gen:requestSpawn()
      repeat
        wait()
      until enmgen2_reinforce_mechsky_03.gen:requestPrepare()
    end
  end,
  checkAddvent = function()
    if enmgen2_reinforce_mechsky_03.advent_node_hdl and enmgen2_reinforce_mechsky_03.gen and 0 >= enmgen2_reinforce_mechsky_03.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_03.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_03.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_03.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      return true
    end
    return false
  end,
  requestIdlingEnemy = function(A0_188)
    if enmgen2_reinforce_mechsky_03.gen then
      enmgen2_reinforce_mechsky_03.gen:requestIdlingEnemy(A0_188)
    end
  end,
  finalize = function()
    if enmgen2_reinforce_mechsky_03.gen then
      enmgen2_reinforce_mechsky_03.gen:try_term()
      enmgen2_reinforce_mechsky_03.gen = nil
      enmgen2_reinforce_mechsky_03.advent_node_hdl = nil
      enmgen2_reinforce_mechsky_03.enemyDeadNum = 0
    end
  end
}
enmgen2_reinforce_mechsky_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {},
  enemyDeadNum = 0,
  gen = nil,
  advent_node = "enmgen2_reinforce_mechsky_04_01",
  advent_node_hdl = nil,
  spawnSet = {},
  onUpdate = function(A0_189)
    local L1_190
  end,
  onEnter = function(A0_191)
    local L1_192
  end,
  onSpawn = function(A0_193, A1_194)
  end,
  onLeave = function(A0_195)
    local L1_196
  end,
  onObjectDead = function(A0_197, A1_198)
    local L3_199
    L3_199 = enmgen2_reinforce_mechsky_04
    L3_199.enemyDeadNum = enmgen2_reinforce_mechsky_04.enemyDeadNum + 1
  end,
  onObjectAsh = function(A0_200, A1_201)
  end,
  init = function()
    local L0_202
    L0_202 = enmgen2_reinforce_mechsky_04
    L0_202.spawnSet = {
      {
        type = "mechsky",
        locator = enmgen2_reinforce_mechsky_04.advent_node,
        name = "enmgen2_reinforce_mechsky_04_mechsmall_01"
      },
      {
        type = "soldier_rifle",
        locator = enmgen2_reinforce_mechsky_04.advent_node,
        name = "enmgen2_reinforce_mechsky_04_mechsky_pilot_01",
        target_vehicle = "enmgen2_reinforce_mechsky_04_mechsmall_01"
      }
    }
    L0_202 = enmgen2_reinforce_mechsky_04
    L0_202.gen = findGameObject2("EnemyGenerator", "enmgen2_reinforce_mechsky_04")
    L0_202 = enmgen2_reinforce_mechsky_04
    L0_202.advent_node_hdl = findGameObject2("EnemyGenerator", enmgen2_reinforce_mechsky_04.advent_node)
    L0_202 = enmgen2_reinforce_mechsky_04
    L0_202.enemyDeadNum = 0
  end,
  addvent = function()
    if enmgen2_reinforce_mechsky_04.advent_node_hdl and enmgen2_reinforce_mechsky_04.gen and 0 >= enmgen2_reinforce_mechsky_04.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_04.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_04.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_04.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      enmgen2_reinforce_mechsky_04.enemyAliveNum = 0
      enmgen2_reinforce_mechsky_04.enemyDeadNum = 0
      enmgen2_reinforce_mechsky_04.gen:requestSpawn()
      repeat
        wait()
      until enmgen2_reinforce_mechsky_04.gen:requestPrepare()
    end
  end,
  checkAddvent = function()
    if enmgen2_reinforce_mechsky_04.advent_node_hdl and enmgen2_reinforce_mechsky_04.gen and 0 >= enmgen2_reinforce_mechsky_04.gen:getEnemyCount() and (false == Fn_isInSightTarget(enmgen2_reinforce_mechsky_04.advent_node_hdl, 1) or nil == Query:calcInSightRatioSphere(enmgen2_reinforce_mechsky_04.advent_node_hdl:getWorldPos(), 1)) and Fn_get_distance(enmgen2_reinforce_mechsky_04.advent_node_hdl:getWorldPos(), Fn_getPlayerWorldPos()) > 20 then
      return true
    end
    return false
  end,
  requestIdlingEnemy = function(A0_203)
    if enmgen2_reinforce_mechsky_04.gen then
      enmgen2_reinforce_mechsky_04.gen:requestIdlingEnemy(A0_203)
    end
  end,
  finalize = function()
    if enmgen2_reinforce_mechsky_04.gen then
      enmgen2_reinforce_mechsky_04.gen:try_term()
      enmgen2_reinforce_mechsky_04.gen = nil
      enmgen2_reinforce_mechsky_04.advent_node_hdl = nil
      enmgen2_reinforce_mechsky_04.enemyDeadNum = 0
    end
  end
}
