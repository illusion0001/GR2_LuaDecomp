dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_crow_brain = nil
_durga_brain = nil
_kali_gen = nil
_durga_gen = nil
_kali_pup = nil
_durga_pup = nil
_sisDefeatType = nil
_sdemo = nil
_isDurgaDead = false
_isInSensor = false
_warp_caption_flag = false
enmgen2_kali = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "kali_ep20",
      locator = "locator_kali",
      name = "kali",
      ai_spawn_option = "Kali/kali_boss_ep20c"
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
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
    is_kalidead = true
  end,
  enemyDeadNum = 0,
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
  end
}
enmgen2_durga = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "durga",
      locator = "locator_durga",
      name = "durga",
      ai_spawn_option = "Durga/durga_boss_ep20c"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
    A0_24:getSpecTable().enemyDeadNum = A0_24:getSpecTable().enemyDeadNum + 1
    is_kalidead = true
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_26)
    return #A0_26.spawnSet
  end,
  getEnemyDeadNum = function(A0_27)
    local L1_28
    L1_28 = A0_27.enemyDeadNum
    return L1_28
  end,
  getEnemyName = function(A0_29, A1_30)
    local L2_31
    L2_31 = A0_29.spawnSet
    L2_31 = L2_31[A1_30]
    L2_31 = L2_31.name
    return L2_31
  end
}
function Initialize()
  local L0_32
  L0_32 = Fn_userCtrlAllOff
  L0_32()
  L0_32 = SDemo
  L0_32 = L0_32.create
  L0_32 = L0_32("ep20_c")
  _sdemo = L0_32
  L0_32 = {}
  L0_32.tx = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1.5,
    min_a = 0.2,
    max_t = 10,
    min_t = 5
  }
  L0_32.ty = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1.2,
    min_a = 0,
    max_t = 10,
    min_t = 5
  }
  L0_32.tz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 2.5,
    min_a = 0.5,
    max_t = 20,
    min_t = 10
  }
  findGameObject2("GimmickBg", "bg2_bu_a_02"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_02"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_03"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_03"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_08"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_08"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_09"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_09"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_10"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_10"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_12"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_12"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_13"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_13"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_14"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_14"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_15"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_15"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_17"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_17"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_bu_a_19"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_bu_a_19"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_ve_crane_root"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_ve_crane_root"):setFloaterParams(L0_32)
  findGameObject2("GimmickBg", "bg2_g1_car_pd_03"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_g1_car_pd_03"):setFloaterParams(L0_32)
end
function Ingame()
  local L0_33, L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41
  L0_33 = Fn_getPlayer
  L0_33 = L0_33()
  _player_pup = L0_33
  L0_33 = Fn_findAreaHandle
  L1_34 = "dt_a_root"
  L0_33 = L0_33(L1_34)
  if L0_33 then
    L1_34 = L0_33.setSceneParameters
    L1_34(L2_35, L3_36)
    L1_34 = print
    L1_34(L2_35)
  end
  L1_34 = {}
  L1_34 = L2_35
  for L5_38, L6_39 in L2_35(L3_36) do
    L7_40 = L1_34[L5_38]
    L8_41 = L7_40
    L7_40 = L7_40.setVisiblePermission
    L7_40(L8_41, false)
    L7_40 = L1_34[L5_38]
    L8_41 = L7_40
    L7_40 = L7_40.setCollidablePermission
    L7_40(L8_41, false)
  end
  L5_38 = false
  L3_36(L4_37, L5_38)
  L5_38 = false
  L3_36(L4_37, L5_38)
  L5_38 = L3_36
  L6_39 = false
  L4_37(L5_38, L6_39)
  L5_38 = L3_36
  L6_39 = false
  L4_37(L5_38, L6_39)
  L5_38 = L4_37
  L6_39 = Player
  L6_39 = L6_39.kAction_Float
  L4_37(L5_38, L6_39)
  L5_38 = Fn_spawnSuppotCrowForGaruda
  L6_39 = false
  L7_40 = Supporter
  L7_40 = L7_40.FirstAction
  L7_40 = L7_40.Ground
  L8_41 = nil
  L5_38 = L5_38(L6_39, L7_40, L8_41, L4_37)
  L7_40 = L5_38
  L6_39 = L5_38.getBrain
  L6_39 = L6_39(L7_40)
  _crow_brain = L6_39
  L6_39 = _crow_brain
  L7_40 = L6_39
  L6_39 = L6_39.setIdling
  L8_41 = true
  L6_39(L7_40, L8_41)
  L6_39 = findGameObject2
  L7_40 = "EnemyGenerator"
  L8_41 = "enmgen2_kali"
  L6_39 = L6_39(L7_40, L8_41)
  _kali_gen = L6_39
  L6_39 = findGameObject2
  L7_40 = "EnemyGenerator"
  L8_41 = "enmgen2_durga"
  L6_39 = L6_39(L7_40, L8_41)
  _durga_gen = L6_39
  L6_39 = _kali_gen
  L7_40 = L6_39
  L6_39 = L6_39.requestIdlingEnemy
  L8_41 = true
  L6_39(L7_40, L8_41)
  L6_39 = _durga_gen
  L7_40 = L6_39
  L6_39 = L6_39.requestIdlingEnemy
  L8_41 = true
  L6_39(L7_40, L8_41)
  L6_39 = findGameObject2
  L7_40 = "EnemyBrain"
  L8_41 = "kali"
  L6_39 = L6_39(L7_40, L8_41)
  L8_41 = L6_39
  L7_40 = L6_39.setVisibleBossMarker
  L7_40(L8_41, true)
  L7_40 = findGameObject2
  L8_41 = "EnemyBrain"
  L7_40 = L7_40(L8_41, "durga")
  _durga_brain = L7_40
  L7_40 = _durga_brain
  L8_41 = L7_40
  L7_40 = L7_40.setEnableHomingTarget
  L7_40(L8_41, false)
  L7_40 = _durga_gen
  L8_41 = L7_40
  L7_40 = L7_40.setEnemyMarker
  L7_40(L8_41, false)
  L7_40 = findGameObject2
  L8_41 = "Puppet"
  L7_40 = L7_40(L8_41, "kali")
  _kali_pup = L7_40
  L7_40 = _crow_brain
  L8_41 = L7_40
  L7_40 = L7_40.setThreatObjects
  L7_40(L8_41, _kali_pup)
  L7_40 = Fn_setBgmPoint
  L8_41 = "battle"
  L7_40(L8_41, "bgmPoint3")
  while true do
    L7_40 = Area
    L8_41 = L7_40
    L7_40 = L7_40.isSkyStable
    L7_40 = L7_40(L8_41)
    if not L7_40 then
      L7_40 = wait
      L7_40()
    end
  end
  L7_40 = Camera
  L8_41 = L7_40
  L7_40 = L7_40.lookTo
  L7_40(L8_41, _kali_pup:getWorldPos(), 0, 0)
  L7_40 = Fn_missionStart
  L7_40()
  L7_40 = FatalMarker
  L7_40 = L7_40.create
  L8_41 = kFATAL_TYPE_ACT
  L7_40 = L7_40(L8_41, L5_38, true)
  L8_41 = L7_40.set
  L8_41(L7_40, _kali_pup, "bn_root", true, nil, nil, "ui_boss_hp_05")
  L8_41 = gravityGemCreate
  L8_41()
  L8_41 = L7_40.run
  L8_41(L7_40)
  L8_41 = HUD
  L8_41 = L8_41.enemymarkerSetRangeMin
  L8_41(L8_41, 30)
  L8_41 = Fn_userCtrlOn
  L8_41()
  L8_41 = _crow_brain
  L8_41 = L8_41.setIdling
  L8_41(L8_41, false)
  L8_41 = _kali_gen
  L8_41 = L8_41.requestIdlingEnemy
  L8_41(L8_41, false)
  L8_41 = _durga_gen
  L8_41 = L8_41.requestIdlingEnemy
  L8_41(L8_41, false)
  L8_41 = Fn_missionView
  L8_41("ep20_02000")
  L8_41 = HUD
  L8_41 = L8_41.sightMarkerSetDisable
  L8_41(L8_41, false)
  L8_41 = HUD
  L8_41 = L8_41.navisSetMaskFromDemo
  L8_41(L8_41, false)
  L8_41 = durgaHpCheck
  L8_41()
  function L8_41(A0_42)
    local L1_43, L2_44
    L1_43 = A0_42.name
    L2_44 = A0_42.attacker
    _sisDefeatType = L2_44
    L2_44 = A0_42.damageHp
    print("enemy name " .. L1_43)
    print("attacker type " .. _sisDefeatType)
    A0_42.ret = true
    return A0_42
  end
  _durga_gen:setEventListener("DamageEnemyReport", L8_41)
  Fn_captionViewWait("ep20_02100")
  Fn_captionViewWait("ep20_02101")
  captionPlay()
  repeat
    wait()
  until L7_40:isFatalFinish()
  L7_40:kill()
  L7_40 = nil
  if not Player:isFeline() then
    Fn_setFeline(true, true, false, false)
    _crow_brain:requestTransform(true)
    wait(40)
  end
  Player:setNoDamageMode(Player.kNoDamage_All, true)
  Player:setControl(Player.kControl_All, false)
  Fn_whiteout(0.3)
  HUD:enemymarkerSetRangeMin()
  Fn_captionViewEnd()
  Camera:removeScreenEffect(0)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function durgaHpCheck()
  invokeTask(function()
    local L0_45, L1_46, L2_47
    L0_45 = findGameObject2
    L1_46 = "Puppet"
    L2_47 = "durga"
    L0_45 = L0_45(L1_46, L2_47)
    _durga_pup = L0_45
    while true do
      L0_45 = _durga_brain
      L1_46 = L0_45
      L0_45 = L0_45.getHealth
      L0_45 = L0_45(L1_46)
      if L0_45 <= 0.011 then
        _isDurgaDead = true
        L0_45 = Fn_lookAtObject
        L1_46 = _durga_pup
        L2_47 = nil
        L0_45 = L0_45(L1_46, L2_47)
        L1_46 = print
        L2_47 = "check"
        L1_46(L2_47, _sisDefeatType)
        L1_46 = findGameObject2
        L2_47 = "Node"
        L1_46 = L1_46(L2_47, "locator2_crow_start_pos")
        if L1_46 then
          L2_47 = _crow_brain
          L2_47 = L2_47.warpToNode
          L2_47(L2_47, L1_46, Supporter.FirstAction.Ground)
        end
        L2_47 = _crow_brain
        L2_47 = L2_47.setIdling
        L2_47(L2_47, true)
        L2_47 = _kali_gen
        L2_47 = L2_47.setEnemyMarker
        L2_47(L2_47, false)
        L2_47 = findGameObject2
        L2_47 = L2_47("Node", "locator2_cam_01")
        _sdemo:set(L2_47, {
          target = _durga_pup,
          joint = "bn_head"
        }, true)
        _sdemo:setCameraParam(nil, 0.1, {deg = 44})
        _durga_brain:reset(get_gameobj_node_world_pos_rot("locator2_durga_downpoint_01"))
        findGameObject2("EnemyBrain", "kali"):reset(get_gameobj_node_world_pos_rot("locator2_kali_resetpoint_01"))
        while _durga_brain:isReadyEnemy() == false do
          wait()
        end
        cam = {
          {
            pos = "locator2_cam_02",
            time = 4,
            hashfunc = "EaseInOut"
          }
        }
        aim = nil
        _sdemo:play(cam, aim)
        Player:muteVoice(Player.kVoiceMuteLv_All)
        invokeTask(function()
          _durga_brain:playMotion("ang01_damege_fly_f_ep20_00")
          Sound:playSE("ene_durga_vo_die", 1, "", durga_pup)
          while true do
            if _durga_brain:isMotionEnd() then
              _durga_brain:playMotion("ang01_damege_fall_f_00")
            end
            wait()
          end
        end)
        invokeTask(function()
          _player_pup:setVisible(false)
          Fn_userCtrlOff()
          Player:setStay(true, true)
        end)
        invokeTask(function()
          if _sisDefeatType == "player" and _durga_brain:getHealth() <= 0.011 then
            Fn_captionView("ep20_02002")
          elseif _durga_brain:getHealth() <= 0.011 then
            Sound:playSE("kit_565", 1)
            Fn_captionView("ep20_02003")
          end
        end)
        waitSeconds(1.3)
        HUD:blackout(0.8)
        L0_45:abort()
        waitSeconds(1.5)
        Player:muteVoice(Player.kVoiceMuteLv_NoMute)
        Player:setStay(false)
        Fn_scriptGameOver(true)
        break
      end
      L0_45 = wait
      L0_45()
    end
  end)
end
function gravityGemCreate()
  invokeTask(function()
    local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53, L6_54, L7_55, L8_56, L9_57, L10_58, L11_59, L12_60, L13_61
    L0_48 = 0
    L1_49 = math
    L1_49 = L1_49.random
    L2_50 = 1
    L3_51 = 16
    L1_49 = L1_49(L2_50, L3_51)
    L2_50 = nil
    L3_51 = {}
    while L0_48 <= 40 do
      L4_52 = _isInSensor
      if L4_52 then
        L4_52 = createGameObject2
        L5_53 = "Gem"
        L4_52 = L4_52(L5_53)
        L6_54 = L4_52
        L5_53 = L4_52.setGemModelNo
        L7_55 = 4
        L5_53(L6_54, L7_55)
        L5_53 = Fn_getPcPosRot
        L6_54 = L5_53()
        L7_55 = math
        L7_55 = L7_55.random
        L8_56 = -5
        L9_57 = 5
        L7_55 = L7_55(L8_56, L9_57)
        L8_56 = math
        L8_56 = L8_56.random
        L9_57 = -25
        L10_58 = 25
        L8_56 = L8_56(L9_57, L10_58)
        L9_57 = math
        L9_57 = L9_57.random
        L10_58 = -5
        L11_59 = 5
        L9_57 = L9_57(L10_58, L11_59)
        if L1_49 == 1 then
          L10_58 = Vector
          L11_59 = 18 + L7_55
          L12_60 = 3 + L8_56
          L13_61 = 0 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 2 then
          L10_58 = Vector
          L11_59 = -18 + L7_55
          L12_60 = 4 + L8_56
          L13_61 = 0 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 3 then
          L10_58 = Vector
          L11_59 = 0 + L7_55
          L12_60 = -3 + L8_56
          L13_61 = 18 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 4 then
          L10_58 = Vector
          L11_59 = 0 + L7_55
          L12_60 = -4 + L8_56
          L13_61 = -18 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 5 then
          L10_58 = Vector
          L11_59 = 15 + L7_55
          L12_60 = 1 + L8_56
          L13_61 = 15 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 6 then
          L10_58 = Vector
          L11_59 = -15 + L7_55
          L12_60 = -1 + L8_56
          L13_61 = -15 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 7 then
          L10_58 = Vector
          L11_59 = -15 + L7_55
          L12_60 = 2 + L8_56
          L13_61 = 15 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 8 then
          L10_58 = Vector
          L11_59 = 15 + L7_55
          L12_60 = -2 + L8_56
          L13_61 = -15 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 9 then
          L10_58 = Vector
          L11_59 = 17 + L7_55
          L12_60 = 3 + L8_56
          L13_61 = 5 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 10 then
          L10_58 = Vector
          L11_59 = -17 + L7_55
          L12_60 = 4 + L8_56
          L13_61 = -5 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 11 then
          L10_58 = Vector
          L11_59 = 5 + L7_55
          L12_60 = -3 + L8_56
          L13_61 = 17 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 12 then
          L10_58 = Vector
          L11_59 = -5 + L7_55
          L12_60 = -4 + L8_56
          L13_61 = -17 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 13 then
          L10_58 = Vector
          L11_59 = 17 + L7_55
          L12_60 = 3 + L8_56
          L13_61 = -5 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 14 then
          L10_58 = Vector
          L11_59 = -17 + L7_55
          L12_60 = 4 + L8_56
          L13_61 = 5 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 15 then
          L10_58 = Vector
          L11_59 = -5 + L7_55
          L12_60 = -3 + L8_56
          L13_61 = 17 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        elseif L1_49 == 16 then
          L10_58 = Vector
          L11_59 = 5 + L7_55
          L12_60 = -4 + L8_56
          L13_61 = -17 + L9_57
          L10_58 = L10_58(L11_59, L12_60, L13_61)
          L2_50 = L5_53 + L10_58
        end
        L10_58 = Fn_getPcPosRot
        L11_59 = L10_58()
        L12_60 = Query
        L13_61 = L12_60
        L12_60 = L12_60.setEyeSightTransform
        L12_60(L13_61, L10_58, L11_59)
        L12_60 = Query
        L13_61 = L12_60
        L12_60 = L12_60.setEyeSightAngle
        L12_60(L13_61, Deg2Rad(45))
        L12_60 = Query
        L13_61 = L12_60
        L12_60 = L12_60.setEyeSightRange
        L12_60(L13_61, range)
        L12_60 = Query
        L13_61 = L12_60
        L12_60 = L12_60.raycastEyeSight
        L12_60 = L12_60(L13_61, L2_50)
        if not L12_60 then
          L13_61 = L4_52.setWorldPos
          L13_61(L4_52, L2_50)
          L13_61 = L4_52.setForceMove
          L13_61(L4_52)
          L13_61 = L4_52.setVisible
          L13_61(L4_52, true)
          L13_61 = L4_52.try_init
          L13_61(L4_52)
          L13_61 = L4_52.setVisibleBlockHalfSize
          L13_61(L4_52, 150)
          L13_61 = L4_52.waitForReadyAsync
          L13_61(L4_52, function()
            L4_52:try_start()
          end)
          L13_61 = print
          L13_61("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_49)
          L0_48 = L0_48 + 1
          if L0_48 >= 4 then
            L13_61 = waitSeconds
            L13_61(20)
          end
          L13_61 = table
          L13_61 = L13_61.insert
          L13_61(L3_51, L4_52)
          while true do
            L13_61 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_51) do
              if L3_51[_FORV_17_]:isRunning() then
                L13_61 = L13_61 + 1
              end
            end
            if L13_61 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_61)
              break
            end
            wait(15)
          end
          L1_49 = L1_49 + 1
          if L1_49 >= 17 then
            L1_49 = 1
          end
        end
      else
      end
      L4_52 = wait
      L4_52()
    end
  end)
end
function captionPlay()
  invokeTask(function()
    local L4_62
    L4_62 = false
    while _isDurgaDead == false do
      if 0 >= 600 then
        if L4_62 == false then
          Fn_captionViewWait("ep20_02001")
          L4_62 = true
        elseif false == false then
          Sound:playSE("pc1_531", 1)
          Fn_captionViewWait("ep20_02004", 6)
          Sound:playSE("ene_durga_vo_talk_4", 1)
          Fn_captionViewWait("ep20_02005", 6)
        elseif false == false then
          Sound:playSE("ene_durga_vo_talk_5", 1)
          Fn_captionViewWait("ep20_02006")
          Sound:playSE("ene_kali_vo_call", 1)
          Fn_captionViewWait("ep20_02007", 6)
        elseif false == false then
          Sound:playSE("ene_durga_vo_talk_5", 1)
          Fn_captionViewWait("ep20_02008", 6)
          Fn_captionViewWait("ep20_02009")
          Sound:playSE("pc1_529", 1)
          Fn_captionViewWait("ep20_02010", 6)
          invokeTask(function()
            Sound:playSE("kal_042", 1)
            wait(90)
            Sound:playSE("ene_kali_vo_call", 1)
          end)
          Fn_captionViewWait("ep20_02011", 7)
        end
      end
      wait()
    end
  end)
end
function pccubesensor2_01_OnEnter()
  local L0_63, L1_64
  _isInSensor = true
end
function pccubesensor2_01_OnLeave()
  local L0_65, L1_66
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_67
  L1_67 = _warp_caption_flag
  if L1_67 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep20_02012")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function Finalize()
  if Fn_getPlayer() then
    Fn_setFeline(false, false, false, true)
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Player:setControl(Player.kControl_All, true)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
    _player_pup:setVisible(true)
  end
  Player:setStay(false)
end
