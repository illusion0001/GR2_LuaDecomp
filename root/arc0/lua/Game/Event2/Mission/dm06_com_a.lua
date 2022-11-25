dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/fatal_marker.lua")
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "cat_01",
      type = "dus01",
      node = "locator2_dusty",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
end
function Ingame()
  Fn_sensorOff("spheresensor2_boss_goal")
  while true do
    wait()
  end
end
function Finalize()
  local L0_1, L1_2
end
function setDustyActive()
  Fn_setNpcActive("cat_01", true)
end
dm06_ark = nil
dm06_ark_addon = nil
dm06_ark_active = 0
dm06_ark_hp_max = 500
dm06_ark_hp = dm06_ark_hp_max
dm06_ark_effect = nil
dm06_ark_effect_play = nil
dm06_addon_table = {
  {
    mdl_name = "g1_ark_pd_01_head",
    append_name = "move_head"
  },
  {
    mdl_name = "g1_ark_pd_01_wing",
    append_name = "move_wing_01"
  },
  {
    mdl_name = "g1_ark_pd_01_wing",
    append_name = "move_wing_02"
  },
  {
    mdl_name = "g1_ark_pd_01_wing",
    append_name = "move_wing_03"
  },
  {
    mdl_name = "g1_ark_pd_01_wing",
    append_name = "move_wing_04"
  },
  {
    mdl_name = "gravcollector_md_02",
    append_name = nil
  }
}
dm06_ark_task = nil
function initArk()
  if dm06_ark == nil then
    dm06_ark_task = invokeTask(function()
      local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8
      L0_3 = {
        L1_4,
        L2_5,
        L3_6,
        L4_7
      }
      L4_7 = "g1_ark_pd_01_c"
      dm06_ark = L1_4
      for L4_7, L5_8 in L1_4(L2_5) do
        dm06_ark[L4_7] = RAC_createGimmickBg("dm06_ark_" .. string.format("%02d", L4_7), L5_8, "locator2_ark_pos", true, false, false, false)
      end
      dm06_ark_addon = L1_4
      for L4_7, L5_8 in L1_4(L2_5) do
        dm06_ark_addon[L4_7] = RAC_createGimmickBg("dm06_ark_addon_" .. string.format("%02d", L4_7), L5_8.mdl_name, "locator2_ark_pos", true, false, false, false)
        dm06_ark_addon[L4_7]:setVisibleBlockEnable(false)
      end
      judge_callback = L1_4
      for L4_7, L5_8 in L1_4(L2_5) do
        L5_8:setEventListener("judge", judge_callback)
        L5_8:setEventListener("dynamic", function(A0_9)
          A0_9:getDynamicObject():setName(A0_9:getName())
          A0_9:getDynamicObject():setEventListener("judge", judge_callback)
        end)
      end
      L1_4()
      L1_4(L2_5)
      dm06_ark_effect = L1_4
      L3_6.eff_name = "ef_ev_hkb_lgt_01"
      L4_7 = dm06_ark
      L4_7 = L4_7[1]
      L3_6.parent_hdl = L4_7
      L3_6.loop = true
      L3_6.stop = true
      L1_4.eff01 = L2_5
      L3_6.eff_name = "ef_ev_hkb_lgt_02"
      L4_7 = dm06_ark
      L4_7 = L4_7[1]
      L3_6.parent_hdl = L4_7
      L3_6.loop = true
      L3_6.stop = true
      L1_4.eff02 = L2_5
      L3_6.eff_name = "ef_ev_hkb_lgt_03"
      L4_7 = dm06_ark
      L4_7 = L4_7[1]
      L3_6.parent_hdl = L4_7
      L3_6.loop = true
      L3_6.stop = true
      L1_4.eff03 = L2_5
    end)
  end
end
function changeArk(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22
  L4_14 = " > "
  L5_15 = A0_10
  L1_11(L2_12)
  dm06_ark_active = A0_10
  for L4_14, L5_15 in L1_11(L2_12) do
    if L4_14 == L6_16 then
      L6_16(L7_17, L8_18)
      if L6_16 ~= nil then
        for L9_19, L10_20 in L6_16(L7_17) do
          L11_21 = dm06_ark_effect
          L11_21 = L11_21[L9_19]
          if L11_21 ~= nil then
            L12_22 = L5_15
            L11_21 = L5_15.appendChild
            L11_21(L12_22, L10_20:getPosNode(), true)
          end
        end
      end
      if L4_14 == 1 then
        for L9_19, L10_20 in L6_16(L7_17) do
          L12_22 = L5_15
          L11_21 = L5_15.appendChild
          L11_21(L12_22, dm06_ark_addon[L9_19], true)
          L11_21 = L10_20.append_name
          if L11_21 ~= nil then
            L12_22 = L5_15
            L11_21 = L5_15.getNodePosRot
            L12_22 = L11_21(L12_22, L10_20.append_name, true)
            dm06_ark_addon[L9_19]:setTransform(L11_21, L12_22)
            print(dm06_ark_addon[L9_19]:getName() .. ":append " .. L5_15:getName() .. "(" .. L10_20.append_name .. ")")
          else
            L11_21 = print
            L12_22 = dm06_ark_addon
            L12_22 = L12_22[L9_19]
            L12_22 = L12_22.getName
            L12_22 = L12_22(L12_22)
            L12_22 = L12_22 .. ":append " .. L5_15:getName()
            L11_21(L12_22)
          end
          L11_21 = dm06_ark_addon
          L11_21 = L11_21[L9_19]
          L12_22 = L11_21
          L11_21 = L11_21.setActive
          L11_21(L12_22, true)
        end
      else
        for L9_19, L10_20 in L6_16(L7_17) do
          L12_22 = L10_20
          L11_21 = L10_20.setActive
          L11_21(L12_22, false)
        end
      end
    else
      L6_16(L7_17, L8_18)
    end
  end
end
function isArkReady()
  if dm06_ark_task ~= nil and dm06_ark_task:isRunning() then
    return false
  end
  if dm06_ark_task ~= nil then
    dm06_ark_task:abort()
    dm06_ark_task = nil
  end
  return true
end
function getActiveArkNo()
  local L0_23, L1_24
  L0_23 = dm06_ark_active
  return L0_23
end
function getActiveArk()
  return dm06_ark[dm06_ark_active]
end
function getArkHpRate()
  return dm06_ark_hp / dm06_ark_hp_max
end
function playArkEffect(A0_25)
  if dm06_ark_effect_play ~= A0_25 and dm06_ark_effect_play ~= nil then
    dm06_ark_effect[dm06_ark_effect_play]:stopEffect()
  end
  dm06_ark_effect[A0_25]:playEffect()
  dm06_ark_effect_play = A0_25
end
dm06_enmgen_name = nil
dm06_boss_name = nil
dm06_boss_damage = 0
dm06_boss_spawn = nil
dm06_boss_brain = nil
dm06_boss_goal = false
dm06_boss_dead = false
dm06_boss_gauge_task = nil
dm06_boss_fatal_task = nil
dm06_boss_fatal_marker = nil
dm06_boss_effect = nil
dm06_boss_target = nil
dm06_boss_target_flag = false
_trophyUnlock = true
enmgen2_boss_b = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collectorbig",
      locator = "locator_boss_b",
      name = "kyodai_collector_b",
      ai_spawn_option = "Collectorbig/dm06_b"
    }
  },
  addSpawnSetName = "spawnSetCollector",
  spawnSetCollector = {
    {
      type = "collector01",
      locator = Vector(0, 0, 0),
      name = "call_collector01",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = Vector(5, 0, 0),
      name = "call_collector02",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = Vector(-5, 0, 0),
      name = "call_collector03",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = Vector(0, 5, 0),
      name = "call_collector04",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = Vector(0, -5, 0),
      name = "call_collector05",
      ai_spawn_option = "Collector/dm06_a"
    }
  }
}
enmgen2_boss_c = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "collectorbig",
      locator = "locator_boss_c",
      name = "kyodai_collector_c",
      ai_spawn_option = "Collectorbig/dm06_c"
    }
  },
  addSpawnSetName = "spawnSetCollector",
  spawnSetCollector = {
    {
      type = "collector01",
      locator = Vector(0, 0, 0),
      name = "call_collector01",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = Vector(5, 0, 0),
      name = "call_collector02",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector03",
      locator = Vector(-5, 0, 0),
      name = "call_collector03",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector01",
      locator = Vector(0, 5, 0),
      name = "call_collector04",
      ai_spawn_option = "Collector/dm06_a"
    },
    {
      type = "collector02",
      locator = Vector(0, -5, 0),
      name = "call_collector05",
      ai_spawn_option = "Collector/dm06_a"
    }
  }
}
function isBossSpawned()
  if dm06_boss_spawn ~= nil and dm06_boss_spawn:isRunning() then
    return false
  end
  if dm06_boss_spawn ~= nil then
    dm06_boss_spawn:abort()
    dm06_boss_spawn = nil
  end
  return true
end
function requestBossSpawn(A0_26, A1_27)
  requestBossKill()
  if dm06_boss_brain == nil then
    print("requestBossSpawn.." .. A0_26 .. "(" .. A1_27 .. ")")
    dm06_enmgen_name = A0_26
    dm06_boss_name = A1_27
    dm06_boss_spawn = invokeTask(function()
      local L0_28
      L0_28 = findGameObject2
      L0_28 = L0_28("EnemyGenerator", dm06_enmgen_name)
      L0_28:requestIdlingEnemy(true)
      L0_28:requestSpawn()
      while true do
        if RAC_isReadyEnemy(L0_28) then
          dm06_boss_brain = findGameObject2("EnemyBrain", dm06_boss_name)
          break
        end
        wait()
      end
    end)
  end
end
function requestBossKill()
  if dm06_boss_brain ~= nil then
    findGameObject2("EnemyGenerator", dm06_enmgen_name):requestEnemyKill(dm06_boss_brain)
    dm06_boss_brain = nil
  end
end
function startBoss_B()
  dm06_boss_brain:setVisibleBossMarker(true)
  dm06_boss_brain:cmd("setArkInfo", {
    parts = {
      dm06_ark[1],
      dm06_ark[2],
      dm06_ark[3],
      dm06_ark[4]
    }
  })
  dm06_boss_damage = 0
  findGameObject2("EnemyGenerator", dm06_enmgen_name):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", dm06_enmgen_name):setEventListener("DamageEnemyReport", function(A0_29)
    print("DamageReportB:" .. A0_29.name .. "\tattacker:" .. A0_29.attacker .. "\tdamage:" .. A0_29.damageHp)
    if A0_29.name == dm06_boss_name and A0_29.attacker == "player" then
      dm06_boss_damage = dm06_boss_damage + A0_29.damageHp
      print("Helth: " .. math.max(dm06_boss_brain:getMaxHealth() - dm06_boss_damage, 0) .. "/" .. dm06_boss_brain:getMaxHealth())
    end
    return A0_29
  end)
  findGameObject2("EnemyGenerator", dm06_enmgen_name):setEventListener("enemy_collectorbig_event", function(A0_30)
    local L1_31, L2_32, L3_33, L4_34, L5_35
    L1_31(L2_32)
    for L4_34, L5_35 in L1_31(L2_32) do
      print(L4_34, L5_35)
    end
    if L1_31 then
      L1_31(L2_32)
    end
    if L1_31 then
      L1_31(L2_32)
      dm06_boss_target = L1_31
    end
    if L1_31 then
      L1_31(L2_32)
    end
    return A0_30
  end)
end
function startBoss_C1()
  dm06_boss_brain:setVisibleBossMarker(false)
  dm06_boss_brain:cmd("setArkInfo", {
    parts = {
      dm06_ark[1],
      dm06_ark[2],
      dm06_ark[3],
      dm06_ark[4]
    }
  })
  dm06_boss_damage = 0
  findGameObject2("EnemyGenerator", dm06_enmgen_name):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", dm06_enmgen_name):setEventListener("DamageEnemyReport", function(A0_36)
    print("DamageReportC1:" .. A0_36.name .. "\tattacker:" .. A0_36.attacker .. "\tdamage:" .. A0_36.damageHp)
    if A0_36.name == dm06_boss_name and A0_36.attacker == "player" then
      dm06_boss_damage = dm06_boss_damage + A0_36.damageHp
      print("Helth: " .. math.max(dm06_boss_brain:getMaxHealth() - dm06_boss_damage, 0) .. "/" .. dm06_boss_brain:getMaxHealth())
    end
    return A0_36
  end)
  findGameObject2("EnemyGenerator", dm06_enmgen_name):setEventListener("enemy_collectorbig_event", function(A0_37)
    local L1_38, L2_39, L3_40, L4_41, L5_42
    L1_38(L2_39)
    for L4_41, L5_42 in L1_38(L2_39) do
      print(L4_41, L5_42)
    end
    if L1_38 then
      L1_38(L2_39)
    end
    if L1_38 then
      L1_38(L2_39)
      dm06_boss_target = L1_38
    end
    if L1_38 then
      L1_38(L2_39)
    end
    return A0_37
  end)
  invokeTask(boss_target_task)
  Fn_sensorOn("spheresensor2_boss_goal")
end
function startBoss_C2()
  local L0_43
  L0_43 = findGameObject2
  L0_43 = L0_43("Puppet", dm06_boss_name)
  dm06_boss_brain:setVisibleBossMarker(true)
  dm06_boss_brain:cmd("setArkInfo", {
    parts = {}
  })
  dm06_boss_brain:cmd("changeActionFatal")
  dm06_boss_damage = 0
  findGameObject2("EnemyGenerator", dm06_enmgen_name):requestIdlingEnemy(false)
  findGameObject2("EnemyGenerator", dm06_enmgen_name):setEventListener("DamageEnemyReport", function(A0_44)
    print("DamageReportC2:" .. A0_44.name .. "\tattacker:" .. A0_44.attacker .. "\tdamage:" .. A0_44.damageHp)
    if A0_44.name == dm06_boss_name and A0_44.attacker == "player" then
      dm06_boss_damage = dm06_boss_damage + A0_44.damageHp
      print("Helth: " .. math.max(dm06_boss_brain:getMaxHealth() - dm06_boss_damage, 0) .. "/" .. dm06_boss_brain:getMaxHealth())
    end
    return A0_44
  end)
  findGameObject2("EnemyGenerator", dm06_enmgen_name):setEventListener("enemy_collectorbig_event", function(A0_45)
    local L1_46, L2_47, L3_48, L4_49, L5_50
    L1_46(L2_47)
    for L4_49, L5_50 in L1_46(L2_47) do
      print(L4_49, L5_50)
    end
    if L1_46 then
      L1_46(L2_47)
    end
    if L1_46 then
      L1_46(L2_47)
      dm06_boss_target = L1_46
    end
    if L1_46 then
      L1_46(L2_47)
    end
    return A0_45
  end)
  dm06_boss_gauge_task = invokeTask(function()
    dm06_boss_gauge = HUD:createBossHpGauge({obj = L0_43})
    dm06_boss_gauge:setActive(true)
    while L0_43:isRunning() and not (math.max(dm06_boss_brain:getMaxHealth() - dm06_boss_damage, 0) < 30) do
      dm06_boss_gauge:setHp(math.max(dm06_boss_brain:getMaxHealth() - dm06_boss_damage, 0) / dm06_boss_brain:getMaxHealth())
      wait()
    end
    dm06_boss_fatal = true
    dm06_boss_gauge:setActive(false)
  end)
  dm06_boss_fatal_task = invokeTask(function()
    dm06_boss_effect = RAC_createEffect({
      eff_name = "ef_ev_ds_att",
      parent_hdl = L0_43,
      parent_joint = "bn_root",
      loop = true
    })
    while true do
      if math.max(dm06_boss_brain:getMaxHealth() - dm06_boss_damage, 0) <= 30 then
        if dm06_boss_effect ~= nil then
          dm06_boss_effect:abort()
          dm06_boss_effect = nil
        end
        if Fn_getDistanceToPlayer(L0_43) < 40 then
          if dm06_boss_fatal_marker == nil then
            dm06_boss_fatal_marker = FatalMarker.create(kFATAL_TYPE_EMP, nil, nil, hp_gauge)
            dm06_boss_fatal_marker:set(L0_43, "bn_root", false)
            dm06_boss_fatal_marker:run()
          end
          if dm06_boss_fatal_marker:isFatalFinish() == true then
            dm06_boss_dead = true
            if dm06_boss_fatal_marker ~= nil then
              dm06_boss_fatal_marker:kill()
              dm06_boss_fatal_marker = nil
            end
            Fn_missionViewEnd()
            break
          end
        elseif dm06_boss_fatal_marker ~= nil then
          dm06_boss_fatal_marker:kill()
          dm06_boss_fatal_marker = nil
        end
      end
      wait()
    end
  end)
  Fn_sensorOff("spheresensor2_boss_goal")
end
function getBossDamage()
  local L0_51, L1_52
  L0_51 = dm06_boss_damage
  return L0_51
end
function getBossBrain()
  return findGameObject2("EnemyBrain", dm06_boss_name)
end
function isBossGoal()
  local L0_53, L1_54
  L0_53 = dm06_boss_goal
  return L0_53
end
function isBossDead()
  local L0_55, L1_56
  L0_55 = dm06_boss_dead
  return L0_55
end
function spheresensor2_boss_goal_OnEnter()
  print("spheresensor2_boss_goal_OnEnter()")
  dm06_boss_goal = true
end
function spheresensor2_boss_goal_OnLeave()
  print("spheresensor2_boss_goal_OnLeave()")
  dm06_boss_goal = false
end
function boss_target_task()
  while dm06_boss_goal == false do
    if dm06_boss_target == "player" then
      dm06_boss_target = nil
      invokeTask(function()
        Sound:playSE("cro022b_1", 1, "")
        Fn_captionView("dm06_02012")
        Fn_missionView("dm06_02000")
      end)
    elseif dm06_boss_target == "ark" then
      dm06_boss_target = nil
      invokeTask(function()
        Sound:playSE("pc2_079", 1, "")
        Fn_captionView("dm06_02005")
        Fn_missionView("dm06_02006")
        print("\231\174\177\232\136\159\227\129\171\230\136\187\227\130\138\229\167\139\227\130\129\227\129\159\227\129\174\227\129\167\227\131\136\227\131\173\227\131\149\227\130\163\227\131\188\229\143\150\229\190\151\229\164\177\230\149\151")
        _trophyUnlock = false
      end)
    end
    wait()
  end
end
function isTrophyUnlock()
  local L0_57, L1_58
  L0_57 = _trophyUnlock
  return L0_57
end
