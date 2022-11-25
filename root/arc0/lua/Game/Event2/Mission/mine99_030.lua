dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Table/RewardTable.lua")
_event_file_name = "floor_030"
_floor_num = 30
_boss_battle_floor = true
enmgen_boss = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "ghostcity_eng_mine_01",
      locator = "locator_boss",
      name = "enm_boss",
      ai_spawn_option = "GhostcityEng/ghostcityeng_boss"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
function InitializeBody()
  local L0_17, L1_18, L2_19
  L0_17 = loadFileAsset
  L1_18 = "evb"
  L2_19 = "evx/ep12_w"
  L0_17 = L0_17(L1_18, L2_19)
  L1_18 = "evarea2_az4_a_10"
  if L0_17 then
    L2_19 = L0_17.wait
    L2_19(L0_17)
    L2_19 = L0_17.findBundle
    L2_19 = L2_19(L0_17, L1_18)
    hdl = EventData:create(L1_18, nil, L2_19)
    hdl:try_init()
    hdl:waitForReady()
    hdl:try_start()
  end
  L2_19 = findGameObject2
  L2_19 = L2_19("GimmickBg", "bg2_rubbles_boss_02")
  L2_19 = L2_19.setVisibleBlockEnable
  L2_19(L2_19, false)
  L2_19 = Fn_userCtrlAllOff
  L2_19()
  L2_19 = findGameObject2
  L2_19 = L2_19("EnemyGenerator", "enmgen2_boss")
  if L2_19 then
    L2_19:requestPrepare()
  end
end
function IngameBody()
  if Fn_getMine99FloorClear() then
    Fn_setBgmPoint("event", "non_boss")
    Fn_setGravityStormIndoorCatWarpOn()
    Fn_waitGravityStormIndoorCatWarp()
    Fn_setCatWarpCheckPoint("locator2_clear_pos_01")
    Fn_resetPcPos("locator2_clear_pos_01")
    Fn_missionStart()
    Fn_userCtrlOn()
    print("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    while false == findGameObject2("EnemyGenerator", "enmgen2_boss"):isPrepared() do
      wait()
    end
    findGameObject2("EnemyGenerator", "enmgen2_boss"):requestSpawn()
    repeat
      wait()
    until findGameObject2("EnemyGenerator", "enmgen2_boss"):isSpawnOnStartFinished()
    findGameObject2("EnemyGenerator", "enmgen2_boss"):requestIdlingEnemy(true)
    findGameObject2("Puppet", "enm_boss"):getBrain():setEventListener("enemy_ghostcityeng_event", fn_ghostcityeng_coreopen)
    fairy_init()
    invokeTask(fairy_move)
    vitalGemrReset(30)
    Fn_missionStart()
    invokeTask(function()
      Fn_vctrlOn("vctrl2_boss")
      Fn_showMineName()
      waitSeconds(3)
      Fn_captionView("ic_pi_monument_00300", 4)
      Fn_missionView("ic_pi_monument_obj_00300", nil, nil, true)
      Sound:playSE("skb_003", 1)
      Fn_vctrlOff("vctrl2_boss")
    end)
    Fn_setBgmPoint("event", "boss_battle")
    Fn_userCtrlOn()
    HUD:createBossHpGauge({
      obj = findGameObject2("Puppet", "enm_boss"),
      hp = 1
    }):setActive(true)
    waitSeconds(2)
    findGameObject2("EnemyGenerator", "enmgen2_boss"):requestIdlingEnemy(false)
    repeat
      HUD:createBossHpGauge({
        obj = findGameObject2("Puppet", "enm_boss"),
        hp = 1
      }):setHp(findGameObject2("Puppet", "enm_boss"):getBrain():getHealth() / findGameObject2("Puppet", "enm_boss"):getBrain():getMaxHealth())
      wait()
    until enmgen_boss:isEnemyAllDead()
    Fn_userCtrlOff()
    Fn_setBgmPoint("event", "boss_battle_end")
    waitSeconds(1)
    Sound:playSE("ene_boss_finish", 1)
    Fn_whiteout()
    if Fn_findAreaHandle("az4_a_root") then
      Fn_findAreaHandle("az4_a_root"):setSceneParameters("az4_a_root")
    end
    Fn_naviKill()
    findGameObject2("EnemyGenerator", "enmgen2_boss"):requestAllEnemyKill()
    HUD:deleteBossHpGauge()
    Fn_userCtrlAllOff()
    Fn_setGravityStormIndoorCatWarpOn()
    Fn_waitGravityStormIndoorCatWarp()
    Fn_setCatWarpCheckPoint("locator2_clear_pos_01")
    Fn_resetPcPos("locator2_clear_pos_01")
    Fn_missionInfoEnd()
    Fn_captionViewEnd()
    Fn_fadein()
    waitSeconds(1.3)
    HUD:info("pi_halfClear_03", false)
    wait(10)
    if Fn_rewardMineBoss("boss15") then
    else
      Fn_dropGraviryOre("locator2_Remuneration")
    end
    Fn_userCtrlOn()
  end
  Fn_unlockMine99Boss(_floor_num)
  Fn_setGravityGateActive(true)
  Fn_setCageMoveParam({
    speed = 20,
    accel = 0,
    decel = 5
  })
  Fn_cageMove()
end
function FinalizeBody()
  local L0_20, L1_21
end
_coreopen = false
_open_pipecore = 0
function fn_ghostcityeng_coreopen(A0_22)
  print("coreopen name: " .. string.format("%s", A0_22.name))
  if A0_22.eventType == "brow_core" then
    if A0_22.isOpen == true then
      print("***** browcore open *****")
      _coreopen = true
      if _core_open_first == false then
        A0_22.changeState = "stop"
      end
    else
      print("***** browcore close *****")
      _coreopen = false
    end
    print("coreopen number: " .. string.format("%d", A0_22.pipeCore))
    _open_pipecore = A0_22.pipeCore
  elseif A0_22.eventType == "fairy" then
    if A0_22.fairyAlert == true then
      print("***** FAIRY ACTIVE *****")
      _fairy_Active = true
    else
      print("***** FAIRY NORMAL *****")
      _fairy_Active = false
    end
  end
  return A0_22
end
_FAIRY_NUM = 15
_fairy_Active = false
_FAIRY_SPPED_NORMAL = 10
_FAIRY_SPPED_ACTIVE = 50
_fly_normal_opt = {
  anim_lp = "fly",
  moveSpeed = _FAIRY_SPPED_NORMAL
}
_fly_active_opt = {
  anim_lp = "fly",
  moveSpeed = _FAIRY_SPPED_ACTIVE
}
_FAIRY_MOVE_NUM = 3
_FAIRY_ACT_MOVE_NUM = 8
_FAIRY_LOC_GRP = 8
_FAIRY_LOC_POS = 2
_FAIRY_LOC_PIT = 5
_fairy_table = {}
_fairy_init_end = false
_fairy_active_table = {
  {
    group = 1,
    postion = "01_01",
    reverse = false
  },
  {
    group = 3,
    postion = "01_02",
    reverse = true
  },
  {
    group = 5,
    postion = "01_03",
    reverse = false
  },
  {
    group = 7,
    postion = "01_04",
    reverse = true
  },
  {
    group = 2,
    postion = "01_05",
    reverse = false
  },
  {
    group = 4,
    postion = "02_01",
    reverse = true
  },
  {
    group = 6,
    postion = "02_02",
    reverse = false
  },
  {
    group = 8,
    postion = "02_03",
    reverse = true
  },
  {
    group = 1,
    postion = "02_04",
    reverse = false
  },
  {
    group = 2,
    postion = "02_05",
    reverse = true
  },
  {
    group = 9,
    postion = "01_01",
    reverse = false
  },
  {
    group = 10,
    postion = "01_02",
    reverse = true
  },
  {
    group = 11,
    postion = "01_03",
    reverse = false
  },
  {
    group = 12,
    postion = "01_04",
    reverse = true
  },
  {
    group = 13,
    postion = "01_05",
    reverse = false
  }
}
function fairy_init()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35
  for L3_26 = 1, _FAIRY_NUM do
    L4_27 = {}
    L5_28 = string
    L5_28 = L5_28.format
    L6_29 = "npcgen2_fai01_%02d"
    L7_30 = L3_26
    L5_28 = L5_28(L6_29, L7_30)
    L4_27.name = L5_28
    L5_28 = Fn_findNpc
    L6_29 = string
    L6_29 = L6_29.format
    L7_30 = "npcgen2_fai01_%02d"
    L12_35 = L6_29(L7_30, L8_31)
    L5_28 = L5_28(L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L6_29(L7_30, L8_31))
    L4_27.hdl = L5_28
    L4_27.eff_nor_hdl = nil
    L4_27.eff_act_hdl = nil
    L5_28 = {}
    L6_29 = RandI
    L7_30 = _FAIRY_LOC_GRP
    L6_29 = L6_29(L7_30)
    L5_28.group = L6_29
    L6_29 = RandI
    L7_30 = _FAIRY_LOC_POS
    L6_29 = L6_29(L7_30)
    L5_28.postion = L6_29
    L6_29 = RandI
    L7_30 = _FAIRY_LOC_PIT
    L6_29 = L6_29(L7_30)
    L5_28.point = L6_29
    L4_27.loc = L5_28
    L4_27.move_end = true
    L5_28 = {}
    L4_27.poslist = L5_28
    L5_28 = Fn_setNpcActive
    L6_29 = L4_27.name
    L7_30 = false
    L5_28(L6_29, L7_30)
    L5_28 = Fn_createEffect
    L6_29 = string
    L6_29 = L6_29.format
    L7_30 = "fairy_eff_%02d"
    L6_29 = L6_29(L7_30, L8_31)
    L7_30 = "ef_bos_fairy"
    L5_28 = L5_28(L6_29, L7_30, L8_31, L9_32)
    L4_27.eff_nor_hdl = L5_28
    L5_28 = L4_27.eff_nor_hdl
    L6_29 = L5_28
    L5_28 = L5_28.stop
    L5_28(L6_29)
    L5_28 = Fn_createEffect
    L6_29 = string
    L6_29 = L6_29.format
    L7_30 = "fairy_eff_%02d_lgt"
    L6_29 = L6_29(L7_30, L8_31)
    L7_30 = "ef_bos_fairy_lgt"
    L5_28 = L5_28(L6_29, L7_30, L8_31, L9_32)
    L4_27.eff_act_hdl = L5_28
    L5_28 = L4_27.eff_act_hdl
    L6_29 = L5_28
    L5_28 = L5_28.stop
    L5_28(L6_29)
    L5_28 = Fn_warpNpc
    L6_29 = L4_27.name
    L7_30 = string
    L7_30 = L7_30.format
    L11_34 = L4_27.loc
    L11_34 = L11_34.point
    L12_35 = L7_30(L8_31, L9_32, L10_33, L11_34)
    L5_28(L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L7_30(L8_31, L9_32, L10_33, L11_34))
    L5_28 = L3_26
    L6_29 = 0
    L7_30 = 0
    if L8_31 then
      L6_29 = L8_31 + 1
      L7_30 = -1
    else
      L6_29 = L8_31 - 1
      L7_30 = 1
    end
    for L11_34 = L5_28, L6_29, L7_30 do
      if L3_26 < 11 then
        if L11_34 < 1 then
          L12_35 = _FAIRY_ACT_MOVE_NUM
          L11_34 = L11_34 + L12_35
        elseif L11_34 > 8 then
          L12_35 = _FAIRY_ACT_MOVE_NUM
          L11_34 = L11_34 - L12_35
        end
      elseif L11_34 < 9 then
        L12_35 = _FAIRY_ACT_MOVE_NUM
        L11_34 = L11_34 + L12_35
      elseif L11_34 > 16 then
        L12_35 = _FAIRY_ACT_MOVE_NUM
        L11_34 = L11_34 - L12_35
      end
      L12_35 = {}
      L12_35.pos = string.format("locator2_fairy_%02d_%s", L11_34, _fairy_active_table[L3_26].postion)
      L12_35.attr = "fly"
      table.insert(L4_27.poslist, L12_35)
    end
    L8_31(L9_32, L10_33)
  end
  _fairy_init_end = true
end
function fairy_next(A0_36)
  if RandI(10) < 9 then
    A0_36.group = A0_36.group + 1
    if A0_36.group == 9 then
      A0_36.group = 1
    end
  else
    A0_36.group = A0_36.group - 1
    if A0_36.group == 0 then
      A0_36.group = 8
    end
  end
  A0_36.postion = RandI(2)
  A0_36.point = RandI(5)
  return A0_36
end
function fairy_move()
  local L0_37, L1_38, L2_39, L3_40, L4_41
  repeat
    L0_37()
  until L0_37
  for L3_40, L4_41 in L0_37(L1_38) do
    invokeTask(function()
      local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47
      L0_42 = Fn_setNpcActive
      L0_42(L1_43, L2_44)
      L0_42 = L4_41.eff_nor_hdl
      L0_42 = L0_42.play
      L0_42(L1_43)
      repeat
        L0_42 = L4_41.move_end
        if L0_42 then
          L0_42 = _fairy_Active
          if not L0_42 then
            L0_42 = print
            L0_42(L1_43)
            L0_42 = {}
            for L4_46 = 1, _FAIRY_MOVE_NUM do
              L5_47 = {}
              L5_47.pos = string.format("locator2_fairy_%02d_%02d_%02d", L4_41.loc.group, L4_41.loc.postion, L4_41.loc.point)
              L5_47.attr = "fly"
              table.insert(L0_42, L5_47)
              L4_41.loc = fairy_next(L4_41.loc)
            end
            repeat
              L4_46 = _fly_normal_opt
              L1_43(L2_44, L3_45, L4_46)
              repeat
                L1_43()
              until L1_43
              L1_43()
            until L1_43
          else
            L0_42 = print
            L0_42(L1_43)
            L0_42 = Fn_warpNpc
            L0_42(L1_43, L2_44)
            L0_42 = L4_41.eff_act_hdl
            L0_42 = L0_42.play
            L0_42(L1_43)
            repeat
              L0_42 = L4_41.hdl
              L0_42 = L0_42.fly
              L0_42(L1_43, L2_44, L3_45)
              repeat
                L0_42 = wait
                L0_42()
                L0_42 = L4_41.hdl
                L0_42 = L0_42.isFlyEnd
                L0_42 = L0_42(L1_43)
                L0_42 = L0_42 or _fairy_Active
              until not L0_42
              L0_42 = wait
              L0_42()
              L0_42 = _fairy_Active
            until not L0_42
            L0_42 = L4_41.eff_act_hdl
            L0_42 = L0_42.stop
            L0_42(L1_43)
          end
        end
        L0_42 = wait
        L0_42()
        L0_42 = false
      until L0_42
    end)
    break
  end
end
function createGem(A0_48, A1_49)
  local L2_50, L3_51, L4_52
  L3_51 = A0_48
  L2_50 = A0_48.getName
  L2_50 = L2_50(L3_51)
  if L2_50 ~= nil then
    L3_51 = print
    L4_52 = "***** Gam create : "
    L4_52 = L4_52 .. L2_50 .. " *****"
    L3_51(L4_52)
    L3_51 = createGameObject2
    L4_52 = "Gem"
    L3_51 = L3_51(L4_52)
    L4_52 = L3_51.setName
    L4_52(L3_51, L2_50)
    L4_52 = L3_51.setGemModelNo
    L4_52(L3_51, A1_49)
    L4_52 = A0_48.getWorldPos
    L4_52 = L4_52(A0_48)
    L4_52 = L4_52 + Vector(0, 0, 0)
    L3_51:setWorldPos(L4_52)
    L3_51:setForceMove()
    L3_51:setVisible(true)
    L3_51:setVisibleBlockHalfSize(150)
    L3_51:try_init()
    L3_51:waitForReadyAsync(function()
      L3_51:try_start()
    end)
    return L3_51
  else
  end
  L3_51 = nil
  return L3_51
end
_vitalGem_time = 30
function vitalGemrReset(A0_53)
  if A0_53 ~= nil then
    _vitalGem_time = A0_53
  end
  GlobalGem:SetVitalGemGetCallback("vitalGemReCreate")
end
function vitalGemReCreate(A0_54)
  invokeTask(function()
    if A0_54:getName() ~= nil then
      waitSeconds(_vitalGem_time)
      createGem(A0_54, 5)
    end
  end)
end
