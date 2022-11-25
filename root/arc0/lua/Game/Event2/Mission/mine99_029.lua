dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_029"
_floor_num = 29
_boss_battle_floor = true
_demo01_cut01 = nil
enmgen2_boss_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "kali_mine_01",
      locator = "locator2_cowg_pos",
      name = "kali01",
      ai_spawn_option = "Kali/kali_mine_01"
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
function InitializeBody()
  _demo01_cut01 = SDemo.create("Mine99_029_Demo01")
  Fn_userCtrlAllOff()
end
function IngameBody()
  local L0_12, L1_13, L2_14, L3_15, L4_16
  L0_12 = Fn_getMine99FloorClear
  L0_12 = L0_12()
  if L0_12 then
    L0_12 = Fn_setBgmPoint
    L1_13 = "event"
    L2_14 = "non_boss"
    L0_12(L1_13, L2_14)
    L0_12 = Fn_missionStart
    L0_12()
    L0_12 = Fn_userCtrlOn
    L0_12()
    L0_12 = print
    L1_13 = "\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153"
    L0_12(L1_13)
  else
    L0_12 = findGameObject2
    L1_13 = "EnemyGenerator"
    L2_14 = "enmgen2_boss_01"
    L0_12 = L0_12(L1_13, L2_14)
    L2_14 = L0_12
    L1_13 = L0_12.requestSpawn
    L1_13(L2_14)
    repeat
      L1_13 = wait
      L1_13()
      L2_14 = L0_12
      L1_13 = L0_12.isPrepared
      L1_13 = L1_13(L2_14)
    until L1_13
    L1_13 = findGameObject2
    L2_14 = "Puppet"
    L3_15 = "kali01"
    L1_13 = L1_13(L2_14, L3_15)
    L3_15 = L1_13
    L2_14 = L1_13.getBrain
    L2_14 = L2_14(L3_15)
    L3_15 = HUD
    L4_16 = L3_15
    L3_15 = L3_15.createBossHpGauge
    L3_15 = L3_15(L4_16, {obj = L1_13, hp = 1})
    L4_16 = L3_15.setActive
    L4_16(L3_15, false)
    L4_16 = L2_14.setEnableTarget
    L4_16(L2_14, false)
    L4_16 = L2_14.setVisibleEnemyMarker
    L4_16(L2_14, false)
    L4_16 = L2_14.setVisibleBossMarker
    L4_16(L2_14, false)
    L4_16 = L0_12.requestIdlingEnemy
    L4_16(L0_12, true)
    repeat
      L4_16 = wait
      L4_16()
      L4_16 = L2_14.isReadyEnemy
      L4_16 = L4_16(L2_14)
    until L4_16
    L4_16 = Fn_setBgmPoint
    L4_16("event", "boss_battle")
    function L4_16()
      _demo01_cut01:set("locator2_cam_eye_01_05", "locator2_cam_at_01_05", true)
      _demo01_cut01:play({
        {
          pos = "locator2_cam_eye_01_04",
          time = 4
        }
      }, {
        {
          pos = "locator2_cam_at_01_04",
          time = 4
        }
      })
    end
    Fn_missionStart(L4_16)
    invokeTask(function()
      Fn_showMineName()
      waitSeconds(3.5)
      Fn_captionViewWait("ic_pi_mine99_29_001")
      waitSeconds(1)
      Fn_captionView("ic_pi_mine99_29_002")
      waitSeconds(3.5)
      Fn_captionView("ic_pi_monument_00290", 4)
      Fn_missionView("ic_pi_monument_obj_00290", 0, nil, true)
      Sound:playSE("skb_003", 1)
    end)
    while _demo01_cut01:isPlay() do
      wait()
    end
    _demo01_cut01:stop(4.5)
    waitSeconds(4.83)
    while _demo01_cut01:isPlay() do
      wait()
    end
    _demo01_cut01:stop()
    L3_15:setActive(true)
    L2_14:setEnableTarget(true)
    L2_14:setVisibleEnemyMarker(true)
    L2_14:setVisibleBossMarker(true)
    L0_12:requestIdlingEnemy(false)
    Fn_userCtrlOn()
    repeat
      L3_15:setHp(L2_14:getHealth() / L2_14:getMaxHealth())
      wait()
    until L2_14:isFatalAction()
    if invokeTask(function()
      repeat
        if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true and findGameObject2("Node", "locator2_cowg_pos") and findGameObject2("Node", "locator2_cowg_pos"):isRunning() and L1_13 and L1_13:isRunning() then
          print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\184\173\239\188\129\239\188\129")
          L0_12:requestIdlingEnemy(true)
          L1_13:setWorldTransform(findGameObject2("Node", "locator2_cowg_pos"):getWorldTransform())
          L1_13:setForceMove()
          print("\227\130\171\227\131\188\227\131\170\227\130\163\227\131\175\227\131\188\227\131\151\239\188\129\239\188\129\239\188\129")
          while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
            wait()
          end
          if L0_12 then
            L0_12:requestIdlingEnemy(false)
          end
        end
        wait()
      until _retry_mine99_entity
    end) then
      invokeTask(function()
        repeat
          if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true and findGameObject2("Node", "locator2_cowg_pos") and findGameObject2("Node", "locator2_cowg_pos"):isRunning() and L1_13 and L1_13:isRunning() then
            print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\184\173\239\188\129\239\188\129")
            L0_12:requestIdlingEnemy(true)
            L1_13:setWorldTransform(findGameObject2("Node", "locator2_cowg_pos"):getWorldTransform())
            L1_13:setForceMove()
            print("\227\130\171\227\131\188\227\131\170\227\130\163\227\131\175\227\131\188\227\131\151\239\188\129\239\188\129\239\188\129")
            while GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) == true do
              wait()
            end
            if L0_12 then
              L0_12:requestIdlingEnemy(false)
            end
          end
          wait()
        until _retry_mine99_entity
      end):abort()
    end
    Fn_userCtrlOff()
    Fn_setBgmPoint("event", "boss_battle_end")
    waitSeconds(1)
    Sound:playSE("ene_boss_finish", 1)
    Fn_whiteout()
    Fn_naviKill()
    L0_12:requestAllEnemyKill()
    HUD:deleteBossHpGauge()
    Fn_userCtrlAllOff()
    Fn_resetPcPos("locator2_pc_start_pos")
    Fn_missionInfoEnd()
    Fn_captionViewEnd()
    Fn_fadein()
    wait(10)
    Fn_setMine99FloorClear()
    Sound:playSE("skb_004", 1)
    Fn_captionViewWait("ic_litho_00100", 3, 4.5)
    waitSeconds(1)
    if Fn_rewardMineBoss("boss14") then
      print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
    else
      Fn_dropGraviryOre("locator2_reward_pos_01")
    end
    Fn_userCtrlOn()
    break
  end
  L0_12 = Fn_setGravityGateActive
  L1_13 = true
  L0_12(L1_13)
  L0_12 = Fn_cageMove
  L0_12()
end
function FinalizeBody()
  local L0_17, L1_18
end
