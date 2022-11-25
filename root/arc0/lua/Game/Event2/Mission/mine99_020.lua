dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_020"
_floor_num = 20
_boss_battle_floor = true
_stage_clear_flg = false
_enemy_count = 0
enmgen_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mothership_mine_12",
      locator = "locator_boss_01",
      name = "mothership01",
      ai_spawn_option = "MotherShip/MotherShip_Test"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_boss_01",
      name = "childship01"
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
    _enemy_count = _enemy_count + 1
    print("mothership_spown:enemy_count=" .. _enemy_count)
  end,
  onObjectDead = function(A0_8, A1_9)
    _enemy_count = _enemy_count - 1
    print("mothership_dead:enemy_count=" .. _enemy_count)
  end,
  onSetupGem = function(A0_10, A1_11)
  end,
  onPopGem = function(A0_12, A1_13)
  end
}
enmgen2_a_06_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lasercannon_mine_11",
      locator = "locator_a_06_01",
      name = "lasercannon"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_06_02",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_a_06_03",
      name = "gellyfish02"
    },
    {
      type = "imp_mine_11",
      locator = "locator_a_06_04",
      name = "imp01"
    }
  },
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onSpawn = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
  end,
  onPopGem = function(A0_26, A1_27)
    EnemeyDropGem(A0_26, A1_27)
  end
}
enmgen2_a_07_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_mine_11",
      locator = "locator_a_07_01",
      name = "treecannon01"
    },
    {
      type = "treecannon_mine_11",
      locator = "locator_a_07_02",
      name = "treecannon02"
    },
    {
      type = "imp_mine_11",
      locator = "locator_a_07_03",
      name = "imp01"
    },
    {
      type = "lasercannon_mine_11",
      locator = "locator_a_07_04",
      name = "lasercannon01"
    }
  },
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onSpawn = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onObjectAsh = function(A0_38, A1_39)
  end,
  onPopGem = function(A0_40, A1_41)
    EnemeyDropGem(A0_40, A1_41)
  end
}
function InitializeBody()
  local L0_42
  L0_42 = print
  L0_42(string.format("mine99_%03d InitializeBody", _floor_num))
end
function IngameBody()
  local L0_43, L1_44, L2_45
  L0_43 = print
  L1_44 = string
  L1_44 = L1_44.format
  L1_44 = L1_44(L2_45, _floor_num)
  L0_43(L1_44, L2_45, L1_44(L2_45, _floor_num))
  L0_43 = {}
  L1_44 = Fn_getMine99FloorClear
  L1_44 = L1_44()
  if not L1_44 then
    L1_44 = findGameObject2
    L1_44 = L1_44(L2_45, "enmgen2_boss_01")
    if L1_44 then
      L2_45(L1_44)
      L2_45(L0_43, L1_44)
    end
    L1_44 = L2_45
    if L1_44 then
      L2_45(L1_44)
      L2_45(L0_43, L1_44)
    end
    L1_44 = L2_45
    if L1_44 then
      L2_45(L1_44)
      L2_45(L0_43, L1_44)
    end
    for _FORV_5_, _FORV_6_ in L2_45(L0_43) do
      while false == _FORV_6_:isSpawnOnStartFinished() do
        wait()
      end
      _FORV_6_:requestIdlingEnemy(true)
    end
    while not L2_45 do
      wait()
    end
    L2_45:getBrain():setVisibleEnemyMarker(false)
    L2_45:getBrain():setVisibleBossMarker(true)
  end
  function L1_44()
    if not Fn_getMine99FloorClear() then
      for _FORV_3_, _FORV_4_ in pairs(L0_43) do
        _FORV_4_:requestIdlingEnemy(false)
      end
    end
  end
  L2_45(L1_44)
  L2_45()
  L2_45()
  if not L2_45 then
    L2_45("ic_pi_monument_00100", 3)
    L2_45(L2_45, "skb_003", 1)
    L2_45("ic_pi_monument_obj_00100", 0, nil, true)
    L2_45("event", "boss_battle")
    repeat
      if L2_45 == 0 then
        _stage_clear_flg = true
      end
      L2_45()
    until L2_45
    L2_45:requestAllEnemyKill()
    L2_45:requestAllEnemyKill()
    Fn_setBgmPoint("event", "boss_battle_end")
    Sound:playSE("ene_boss_finish", 1)
    Fn_userCtrlAllOff()
    Fn_whiteout()
    Fn_resetPcPos("locator2_litho_pc_pos_01_pi2_b_06")
    Fn_setCatWarpCheckPoint("locator2_litho_pc_pos_01_pi2_b_06")
    waitSeconds(2)
    Fn_fadein()
    Fn_userCtrlOn()
    Fn_missionInfoEnd()
    Fn_captionViewEnd()
    Sound:playSE("skb_004", 1)
    Fn_captionViewWait("ic_litho_00100", 3, 4.5)
    if Fn_rewardMineBoss("boss09") then
    else
      Fn_dropGraviryOre("locator2_reward_appearance_pos_pi2_b_06")
    end
    Fn_setMine99FloorClear()
  else
    L2_45("\227\129\147\227\129\174\233\154\142\229\177\164\227\129\174\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136")
    L2_45("event", "non_boss")
  end
  L2_45(true)
  L2_45()
end
function FinalizeBody()
  local L0_46
  L0_46 = print
  L0_46(string.format("mine99_%03d FinalizeBody", _floor_num))
end
