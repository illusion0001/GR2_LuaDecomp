dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
import("GlobalGem")
_puppet_crow = nil
_brain_crow = nil
_boss_brain = nil
_core_open_first = false
_core_navi = false
_debug_flag = false
enmgen_boss = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_eng",
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
function Initialize()
  if Fn_findAreaHandle("az4_a_root") then
    Fn_findAreaHandle("az4_a_root"):setSceneParameters("az4_a_boss_root")
  end
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  _enm_boss_h = findGameObject2("EnemyGenerator", "enmgen2_boss")
  _enm_fall_01_h = findGameObject2("EnemyGenerator", "enmgen2_fall_01")
  _enm_fall_02_h = findGameObject2("EnemyGenerator", "enmgen2_fall_02")
  _enm_fall_03_h = findGameObject2("EnemyGenerator", "enmgen2_fall_03")
  _enm_fall_04_h = findGameObject2("EnemyGenerator", "enmgen2_fall_04")
  _enm_zako_01_h = findGameObject2("EnemyGenerator", "enmgen2_zako_01")
  _enm_zako_02_h = findGameObject2("EnemyGenerator", "enmgen2_zako_02")
  _enm_zako_03_h = findGameObject2("EnemyGenerator", "enmgen2_zako_03")
  _enm_zako_04_h = findGameObject2("EnemyGenerator", "enmgen2_zako_04")
  _enm_zako_05_h = findGameObject2("EnemyGenerator", "enmgen2_zako_05")
  findGameObject2("GimmickBg", "bg2_rubbles_boss_02"):setVisibleBlockEnable(false)
  _boss_brain = findGameObject2("EnemyBrain", "enm_boss")
  _core_sdemo = SDemo.create("core_open")
  _core_sdemo:set("locator2_core_cam", "locator2_core", true)
  _boss_brain:setVisibleEnemyMarker(false)
end
function Ingame()
  local L0_17
  L0_17 = Fn_setCatWarp
  L0_17(false)
  L0_17 = Fn_setCatWarpCheckPoint
  L0_17("locator2_pc_start_pos")
  L0_17 = _enm_boss_h
  L0_17 = L0_17.requestIdlingEnemy
  L0_17(L0_17, true)
  L0_17 = _boss_brain
  L0_17 = L0_17.setVisibleBossMarker
  L0_17(L0_17, false)
  L0_17 = Fn_userCtrlAllOff
  L0_17()
  L0_17 = Fn_spawnSuppotCrow
  L0_17 = L0_17(false, Supporter.FirstAction.Ground, "locator2_crow_start_ep12_w")
  _puppet_crow = L0_17
  L0_17 = _puppet_crow
  L0_17 = L0_17.getBrain
  L0_17 = L0_17(L0_17)
  _brain_crow = L0_17
  L0_17 = _brain_crow
  L0_17 = L0_17.setIdling
  L0_17(L0_17, true)
  L0_17 = _brain_crow
  L0_17 = L0_17.resetFollowPoint
  L0_17(L0_17)
  L0_17 = fairy_init
  L0_17()
  L0_17 = invokeTask
  L0_17(fairy_move)
  L0_17 = Fn_missionStart
  L0_17()
  L0_17 = Fn_vctrlOn
  L0_17("vctrl2_boss")
  L0_17 = waitSeconds
  L0_17(1.5)
  L0_17 = Fn_kaiwaDemoView
  L0_17("ep12_00410k")
  L0_17 = Fn_vctrlOff
  L0_17("vctrl2_boss")
  L0_17 = _brain_crow
  L0_17 = L0_17.setIdling
  L0_17(L0_17, false)
  L0_17 = Fn_userCtrlOn
  L0_17()
  L0_17 = _enm_boss_h
  L0_17 = L0_17.requestIdlingEnemy
  L0_17(L0_17, false)
  L0_17 = Fn_missionView
  L0_17("ep12_11000")
  L0_17 = Fn_setBgmPoint
  L0_17("battle")
  L0_17 = zako_spawn
  L0_17()
  L0_17 = vitalGemrReset
  L0_17(30)
  L0_17 = FatalMarker
  L0_17 = L0_17.create
  L0_17 = L0_17(kFATAL_TYPE_ACT, _puppet_crow, true)
  _boss_puppet = findGameObject2("Puppet", "enm_boss")
  L0_17:set(_boss_puppet, "loc_setCore03", true)
  L0_17:run()
  _boss_brain = findGameObject2("EnemyBrain", "enm_boss")
  _boss_brain:setEventListener("enemy_ghostcityeng_event", fn_ghostcityeng_coreopen)
  if _debug_flag == true then
    invokeTask(function()
      repeat
        debugDispPrint("coreopen : " .. tostring(_coreopen))
        debugDispPrint("open_pipecore : " .. _open_pipecore)
        wait()
      until false
    end)
  end
  invokeTask(function()
    repeat
      if _coreopen and _core_navi == false then
        if _core_open_first == false then
          core_open_first()
        else
          print("***** core navi set *****")
          _core_navi = true
          _boss_brain:setVisibleBossMarker(true)
          repeat
            wait()
          until _coreopen == false
          _boss_brain:setVisibleBossMarker(false)
          _core_navi = false
        end
      end
      wait()
    until L0_17:isFatalFinish()
  end)
  repeat
    wait()
  until L0_17:isFatalFinish()
  Fn_whiteout(0.3)
  L0_17:kill()
  L0_17 = nil
  Fn_setBgmPoint("event", "battle_end")
  Player:setAttrTune(Player.kAttrTune_Normal, true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function core_open_first()
  print("***** core open first *****")
  _core_open_first = true
  _core_navi = true
  _brain_crow:setIdling(true)
  Fn_userCtrlAllOff()
  Player:setStay(true)
  if _enm_fall_01_h ~= nil then
    _enm_fall_01_h:requestIdlingEnemy(true)
  end
  if _enm_fall_02_h ~= nil then
    _enm_fall_02_h:requestIdlingEnemy(true)
  end
  if _enm_fall_03_h ~= nil then
    _enm_fall_03_h:requestIdlingEnemy(true)
  end
  if _enm_fall_04_h ~= nil then
    _enm_fall_04_h:requestIdlingEnemy(true)
  end
  _core_sdemo:play()
  Sound:playSE("ene_gceng_sdemo", 1)
  waitSeconds(1)
  Fn_captionView("ep12_11001")
  _core_sdemo:zoomIn(3, {deg = 25}, "easeOut")
  Fn_captionViewWait("ep12_11002")
  _core_sdemo:stop(0)
  _brain_crow:setIdling(false)
  Fn_userCtrlOn()
  Player:setStay(false)
  print("***** endScriptDamaged *****")
  _boss_brain:eventMessage("endScriptDamaged")
  _core_navi = true
  _boss_brain:setVisibleBossMarker(true)
  if _enm_fall_01_h ~= nil then
    _enm_fall_01_h:requestIdlingEnemy(false)
  end
  if _enm_fall_02_h ~= nil then
    _enm_fall_02_h:requestIdlingEnemy(false)
  end
  if _enm_fall_03_h ~= nil then
    _enm_fall_03_h:requestIdlingEnemy(false)
  end
  if _enm_fall_04_h ~= nil then
    _enm_fall_04_h:requestIdlingEnemy(false)
  end
  repeat
    wait()
  until _coreopen == false
  _boss_brain:setVisibleBossMarker(false)
  _core_navi = false
  Fn_captionViewWait("ep12_11003")
  Fn_captionViewWait("ep12_11004")
  Fn_captionView("ep12_11005")
end
_coreopen = false
_open_pipecore = 0
function fn_ghostcityeng_coreopen(A0_18)
  print("coreopen name: " .. string.format("%s", A0_18.name))
  if A0_18.eventType == "brow_core" then
    if A0_18.isOpen == true then
      print("***** browcore open *****")
      _coreopen = true
      if _core_open_first == false then
        A0_18.changeState = "stop"
      end
    else
      print("***** browcore close *****")
      _coreopen = false
    end
    print("coreopen number: " .. string.format("%d", A0_18.pipeCore))
    _open_pipecore = A0_18.pipeCore
  elseif A0_18.eventType == "fairy" then
    if A0_18.fairyAlert == true then
      print("***** FAIRY ACTIVE *****")
      _fairy_Active = true
    else
      print("***** FAIRY NORMAL *****")
      _fairy_Active = false
    end
  end
  return A0_18
end
function Finalize()
  local L0_19, L1_20
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
  local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33
  for L3_24 = 1, _FAIRY_NUM do
    L4_25 = {}
    L5_26 = string
    L5_26 = L5_26.format
    L6_27 = "npcgen2_fai01_%02d"
    L7_28 = L3_24
    L5_26 = L5_26(L6_27, L7_28)
    L4_25.name = L5_26
    L5_26 = Fn_findNpc
    L6_27 = string
    L6_27 = L6_27.format
    L7_28 = "npcgen2_fai01_%02d"
    L12_33 = L6_27(L7_28, L8_29)
    L5_26 = L5_26(L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L6_27(L7_28, L8_29))
    L4_25.hdl = L5_26
    L4_25.eff_nor_hdl = nil
    L4_25.eff_act_hdl = nil
    L5_26 = {}
    L6_27 = RandI
    L7_28 = _FAIRY_LOC_GRP
    L6_27 = L6_27(L7_28)
    L5_26.group = L6_27
    L6_27 = RandI
    L7_28 = _FAIRY_LOC_POS
    L6_27 = L6_27(L7_28)
    L5_26.postion = L6_27
    L6_27 = RandI
    L7_28 = _FAIRY_LOC_PIT
    L6_27 = L6_27(L7_28)
    L5_26.point = L6_27
    L4_25.loc = L5_26
    L4_25.move_end = true
    L5_26 = {}
    L4_25.poslist = L5_26
    L5_26 = Fn_setNpcActive
    L6_27 = L4_25.name
    L7_28 = false
    L5_26(L6_27, L7_28)
    L5_26 = Fn_createEffect
    L6_27 = string
    L6_27 = L6_27.format
    L7_28 = "fairy_eff_%02d"
    L6_27 = L6_27(L7_28, L8_29)
    L7_28 = "ef_bos_fairy"
    L5_26 = L5_26(L6_27, L7_28, L8_29, L9_30)
    L4_25.eff_nor_hdl = L5_26
    L5_26 = L4_25.eff_nor_hdl
    L6_27 = L5_26
    L5_26 = L5_26.stop
    L5_26(L6_27)
    L5_26 = Fn_createEffect
    L6_27 = string
    L6_27 = L6_27.format
    L7_28 = "fairy_eff_%02d_lgt"
    L6_27 = L6_27(L7_28, L8_29)
    L7_28 = "ef_bos_fairy_lgt"
    L5_26 = L5_26(L6_27, L7_28, L8_29, L9_30)
    L4_25.eff_act_hdl = L5_26
    L5_26 = L4_25.eff_act_hdl
    L6_27 = L5_26
    L5_26 = L5_26.stop
    L5_26(L6_27)
    L5_26 = Fn_warpNpc
    L6_27 = L4_25.name
    L7_28 = string
    L7_28 = L7_28.format
    L11_32 = L4_25.loc
    L11_32 = L11_32.point
    L12_33 = L7_28(L8_29, L9_30, L10_31, L11_32)
    L5_26(L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L7_28(L8_29, L9_30, L10_31, L11_32))
    L5_26 = L3_24
    L6_27 = 0
    L7_28 = 0
    if L8_29 then
      L6_27 = L8_29 + 1
      L7_28 = -1
    else
      L6_27 = L8_29 - 1
      L7_28 = 1
    end
    for L11_32 = L5_26, L6_27, L7_28 do
      if L3_24 < 11 then
        if L11_32 < 1 then
          L12_33 = _FAIRY_ACT_MOVE_NUM
          L11_32 = L11_32 + L12_33
        elseif L11_32 > 8 then
          L12_33 = _FAIRY_ACT_MOVE_NUM
          L11_32 = L11_32 - L12_33
        end
      elseif L11_32 < 9 then
        L12_33 = _FAIRY_ACT_MOVE_NUM
        L11_32 = L11_32 + L12_33
      elseif L11_32 > 16 then
        L12_33 = _FAIRY_ACT_MOVE_NUM
        L11_32 = L11_32 - L12_33
      end
      L12_33 = {}
      L12_33.pos = string.format("locator2_fairy_%02d_%s", L11_32, _fairy_active_table[L3_24].postion)
      L12_33.attr = "fly"
      table.insert(L4_25.poslist, L12_33)
    end
    L8_29(L9_30, L10_31)
  end
  _fairy_init_end = true
end
function fairy_next(A0_34)
  if RandI(10) < 9 then
    A0_34.group = A0_34.group + 1
    if A0_34.group == 9 then
      A0_34.group = 1
    end
  else
    A0_34.group = A0_34.group - 1
    if A0_34.group == 0 then
      A0_34.group = 8
    end
  end
  A0_34.postion = RandI(2)
  A0_34.point = RandI(5)
  return A0_34
end
function fairy_move()
  local L0_35, L1_36, L2_37, L3_38, L4_39
  repeat
    L0_35()
  until L0_35
  for L3_38, L4_39 in L0_35(L1_36) do
    invokeTask(function()
      local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45
      L0_40 = Fn_setNpcActive
      L0_40(L1_41, L2_42)
      L0_40 = L4_39.eff_nor_hdl
      L0_40 = L0_40.play
      L0_40(L1_41)
      repeat
        L0_40 = L4_39.move_end
        if L0_40 then
          L0_40 = _fairy_Active
          if not L0_40 then
            L0_40 = {}
            for L4_44 = 1, _FAIRY_MOVE_NUM do
              L5_45 = {}
              L5_45.pos = string.format("locator2_fairy_%02d_%02d_%02d", L4_39.loc.group, L4_39.loc.postion, L4_39.loc.point)
              L5_45.attr = "fly"
              table.insert(L0_40, L5_45)
              L4_39.loc = fairy_next(L4_39.loc)
            end
            repeat
              L4_44 = _fly_normal_opt
              L1_41(L2_42, L3_43, L4_44)
              repeat
                L1_41()
              until L1_41
              L1_41()
            until L1_41
          else
            L0_40 = Fn_warpNpc
            L0_40(L1_41, L2_42)
            L0_40 = L4_39.eff_act_hdl
            L0_40 = L0_40.play
            L0_40(L1_41)
            repeat
              L0_40 = L4_39.hdl
              L0_40 = L0_40.fly
              L0_40(L1_41, L2_42, L3_43)
              repeat
                L0_40 = wait
                L0_40()
                L0_40 = L4_39.hdl
                L0_40 = L0_40.isFlyEnd
                L0_40 = L0_40(L1_41)
                L0_40 = L0_40 or _fairy_Active
              until not L0_40
              L0_40 = wait
              L0_40()
              L0_40 = _fairy_Active
            until not L0_40
            L0_40 = L4_39.eff_act_hdl
            L0_40 = L0_40.stop
            L0_40(L1_41)
          end
        end
        L0_40 = wait
        L0_40()
        L0_40 = false
      until L0_40
    end)
    break
  end
end
_obj_count = 0
_obj_max = 25
_obj_table = {}
_enemy_count = 0
_enemy_max = 0
_enemy_teble = {}
_enemy_max_01 = 0
_enemy_max_02 = 5
_enemy_max_03 = 8
_enemy_max_04 = 10
_enemy_max_05 = 12
_fall_01_tbl_max = 5
_fall_02_tbl_max = 5
_fall_03_tbl_max = 5
_fall_04_tbl_max = 5
_fall_01_wait = 10
_fall_02_wait = 11
_fall_03_wait = 10
_fall_04_wait = 11
_obj_tbl_access = true
_enm_tbl_access = true
function zako_spawn()
  invokeTask(function()
    _boss_brain = _boss_puppet:getBrain()
    _boss_maxhp = _boss_brain:getMaxHealth()
    _enemy_max = _enemy_max_01
    repeat
      wait()
    until _boss_brain:getHealth() / _boss_maxhp < 0.88
    if _enm_zako_04_h ~= nil then
      _enm_zako_04_h:requestSpawn()
    end
    if _enm_zako_03_h ~= nil then
      _enm_zako_03_h:requestSpawn()
    end
    repeat
      wait()
    until _boss_brain:getHealth() / _boss_maxhp < 0.7
    if _enm_zako_02_h ~= nil then
      _enm_zako_02_h:requestSpawn()
    end
    repeat
      wait()
    until _boss_brain:getHealth() / _boss_maxhp < 0.5
    if _enm_zako_01_h ~= nil then
      _enm_zako_01_h:requestSpawn()
    end
    repeat
      wait()
    until _boss_brain:getHealth() / _boss_maxhp < 0.25
    if _enm_zako_05_h ~= nil then
      _enm_zako_05_h:requestSpawn()
    end
  end)
end
enm_zako_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_zako_01_01",
      name = "zako_01_01"
    },
    {
      type = "stalker",
      locator = "locator_zako_01_02",
      name = "zako_01_02"
    },
    {
      type = "guardcore",
      locator = "locator_zako_01_03",
      name = "zako_01_03"
    }
  },
  onSetupGem = function(A0_46, A1_47)
    Fn_enemyPopGemSetup(A0_46, {
      "locator_zako_01_01"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_46, {
      "locator_zako_01_02"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_46, {
      "locator_zako_01_03"
    }, 1, 5)
  end,
  onPopGem = function(A0_48, A1_49)
    Fn_enemyAshPopGem(A0_48, A1_49)
  end,
  onSpawn = function(A0_50, A1_51)
    _enemy_count = _enemy_count + 1
    A0_50:setEnemyMarker(false)
  end,
  onObjectAsh = function(A0_52, A1_53)
    _enemy_count = _enemy_count - 1
  end
}
enm_zako_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_zako_02_01",
      name = "zako_02_01"
    },
    {
      type = "stalker",
      locator = "locator_zako_02_02",
      name = "zako_02_02"
    },
    {
      type = "stalker",
      locator = "locator_zako_02_03",
      name = "zako_02_03"
    },
    {
      type = "runner",
      locator = "locator_zako_02_04",
      name = "zako_02_04"
    },
    {
      type = "runner",
      locator = "locator_zako_02_05",
      name = "zako_02_05"
    }
  },
  onSetupGem = function(A0_54, A1_55)
    Fn_enemyPopGemSetup(A0_54, {
      "locator_zako_02_01"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_54, {
      "locator_zako_02_02"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_54, {
      "locator_zako_02_03"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_54, {
      "locator_zako_02_04"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_54, {
      "locator_zako_02_05"
    }, 1, 5)
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57)
  end,
  onSpawn = function(A0_58, A1_59)
    _enemy_count = _enemy_count + 1
    A0_58:setEnemyMarker(false)
  end,
  onObjectAsh = function(A0_60, A1_61)
    _enemy_count = _enemy_count - 1
  end
}
enm_zako_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_zako_03_01",
      name = "zako_03_01"
    },
    {
      type = "guardcore",
      locator = "locator_zako_03_02",
      name = "zako_03_02"
    },
    {
      type = "treecannon",
      locator = "locator_zako_03_03",
      name = "zako_03_03"
    }
  },
  onSetupGem = function(A0_62, A1_63)
    Fn_enemyPopGemSetup(A0_62, {
      "locator_zako_03_01"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_62, {
      "locator_zako_03_02"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_62, {
      "locator_zako_03_03"
    }, 1, 5)
  end,
  onPopGem = function(A0_64, A1_65)
    Fn_enemyAshPopGem(A0_64, A1_65)
  end,
  onSpawn = function(A0_66, A1_67)
    _enemy_count = _enemy_count + 1
    A0_66:setEnemyMarker(false)
  end,
  onObjectAsh = function(A0_68, A1_69)
    _enemy_count = _enemy_count - 1
  end
}
enm_zako_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_zako_04_01",
      name = "zako_04_01"
    },
    {
      type = "stalker",
      locator = "locator_zako_04_02",
      name = "zako_04_02"
    },
    {
      type = "guardcore",
      locator = "locator_zako_04_03",
      name = "zako_04_03"
    }
  },
  onSetupGem = function(A0_70, A1_71)
    Fn_enemyPopGemSetup(A0_70, {
      "locator_zako_04_01"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_70, {
      "locator_zako_04_01"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_70, {
      "locator_zako_04_01"
    }, 1, 5)
  end,
  onPopGem = function(A0_72, A1_73)
    Fn_enemyAshPopGem(A0_72, A1_73)
  end,
  onSpawn = function(A0_74, A1_75)
    _enemy_count = _enemy_count + 1
    A0_74:setEnemyMarker(false)
  end,
  onObjectAsh = function(A0_76, A1_77)
    _enemy_count = _enemy_count - 1
  end
}
enm_zako_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_zako_05_01",
      name = "zako_05_01"
    },
    {
      type = "runner",
      locator = "locator_zako_05_02",
      name = "zako_05_02"
    },
    {
      type = "runner",
      locator = "locator_zako_05_03",
      name = "zako_05_03"
    },
    {
      type = "runner",
      locator = "locator_zako_05_04",
      name = "zako_05_04"
    },
    {
      type = "defender",
      locator = "locator_zako_05_05",
      name = "zako_05_05"
    },
    {
      type = "defender",
      locator = "locator_zako_05_06",
      name = "zako_05_06"
    }
  },
  onSetupGem = function(A0_78, A1_79)
    Fn_enemyPopGemSetup(A0_78, {
      "locator_zako_06_01"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_78, {
      "locator_zako_06_02"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_78, {
      "locator_zako_06_03"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_78, {
      "locator_zako_06_04"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_78, {
      "locator_zako_06_05"
    }, 1, 5)
    Fn_enemyPopGemSetup(A0_78, {
      "locator_zako_06_06"
    }, 1, 5)
  end,
  onPopGem = function(A0_80, A1_81)
    Fn_enemyAshPopGem(A0_80, A1_81)
  end,
  onSpawn = function(A0_82, A1_83)
    _enemy_count = _enemy_count + 1
    A0_82:setEnemyMarker(false)
  end,
  onObjectAsh = function(A0_84, A1_85)
    _enemy_count = _enemy_count - 1
  end
}
function zako_enemy_spawn(A0_86, A1_87, A2_88)
  local L3_89, L4_90
  L3_89 = RandI
  L4_90 = A2_88
  L3_89 = L3_89(L4_90)
  L4_90 = string
  L4_90 = L4_90.format
  L4_90 = L4_90("enmgen_fall_%02d_%02d", A1_87, L3_89)
  print("tbl_name : " .. L4_90)
  if A0_86 == nil then
    print("enm_hdl : nil")
  end
  A0_86:setSpecTableName(L4_90)
  print(A0_86:isPrepared())
  A0_86:requestSpawn()
end
function createGem(A0_91, A1_92)
  local L2_93, L3_94, L4_95
  L3_94 = A0_91
  L2_93 = A0_91.getName
  L2_93 = L2_93(L3_94)
  if L2_93 ~= nil then
    L3_94 = print
    L4_95 = "***** Gam create : "
    L4_95 = L4_95 .. L2_93 .. " *****"
    L3_94(L4_95)
    L3_94 = createGameObject2
    L4_95 = "Gem"
    L3_94 = L3_94(L4_95)
    L4_95 = L3_94.setName
    L4_95(L3_94, L2_93)
    L4_95 = L3_94.setGemModelNo
    L4_95(L3_94, A1_92)
    L4_95 = A0_91.getWorldPos
    L4_95 = L4_95(A0_91)
    L4_95 = L4_95 + Vector(0, 0, 0)
    L3_94:setWorldPos(L4_95)
    L3_94:setForceMove()
    L3_94:setVisible(true)
    L3_94:try_init()
    L3_94:setVisibleBlockHalfSize(150)
    L3_94:waitForReadyAsync(function()
      L3_94:try_start()
    end)
    return L3_94
  else
  end
  L3_94 = nil
  return L3_94
end
_vitalGem_time = 30
function vitalGemrReset(A0_96)
  if A0_96 ~= nil then
    _vitalGem_time = A0_96
  end
  GlobalGem:SetVitalGemGetCallback("vitalGemReCreate")
end
function vitalGemReCreate(A0_97)
  invokeTask(function()
    if A0_97:getName() ~= nil then
      waitSeconds(_vitalGem_time)
      createGem(A0_97, 5)
    end
  end)
end
