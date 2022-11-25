dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_isDead = false
_attackerType = nil
_sisDefeatType = nil
_crow_brain = nil
_kali_durga = nil
_unica_permet = nil
_durga_brain = nil
_sdemo = nil
_isInSensor = false
_warp_caption_flag = false
enmgen2_kali_durga = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "kali_ep20",
      locator = "locator_kali",
      name = "kali",
      ai_spawn_option = "Kali/kali_boss_ep20b"
    },
    {
      type = "durga",
      locator = "locator_durga",
      name = "durga",
      ai_spawn_option = "Durga/durga_boss_ep20b"
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
enmgen2_unica_permet = {
  puppetsList = {},
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "unica_ep20",
      locator = "locator_unica",
      name = "unica",
      ai_spawn_option = "Unica/unica_ep20_b"
    },
    {
      type = "permet_ep20",
      locator = "locator_permet",
      name = "permet",
      ai_spawn_option = "Permet/permet_ep20_b"
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
  onSpawn = function(A0_22, A1_23)
    table.insert(A0_22:getSpecTable().puppetsList, A1_23:getGizmo())
  end,
  onObjectDead = function(A0_24, A1_25)
  end,
  onObjectAsh = function(A0_26, A1_27)
    A0_26:getSpecTable().enemyDeadNum = A0_26:getSpecTable().enemyDeadNum + 1
    is_dead = true
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_28)
    return #A0_28.spawnSet
  end,
  getEnemyDeadNum = function(A0_29)
    local L1_30
    L1_30 = A0_29.enemyDeadNum
    return L1_30
  end,
  getEnemyName = function(A0_31, A1_32)
    local L2_33
    L2_33 = A0_31.spawnSet
    L2_33 = L2_33[A1_32]
    L2_33 = L2_33.name
    return L2_33
  end
}
function Initialize()
  local L0_34
  L0_34 = Fn_userCtrlAllOff
  L0_34()
  L0_34 = SDemo
  L0_34 = L0_34.create
  L0_34 = L0_34("ep20_b")
  _sdemo = L0_34
  L0_34 = {}
  L0_34.tx = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1.5,
    min_a = 0.2,
    max_t = 10,
    min_t = 5
  }
  L0_34.ty = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1.2,
    min_a = 0,
    max_t = 10,
    min_t = 5
  }
  L0_34.tz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 2.5,
    min_a = 0.5,
    max_t = 20,
    min_t = 10
  }
  findGameObject2("GimmickBg", "bg2_g1_car_pd_03"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_g1_car_pd_03"):setFloaterParams(L0_34)
end
function Ingame()
  local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41
  L0_35 = Fn_getPlayer
  L0_35 = L0_35()
  _player_pup = L0_35
  L0_35 = Fn_findAreaHandle
  L1_36 = "dt_a_root"
  L0_35 = L0_35(L1_36)
  if L0_35 then
    L1_36 = L0_35.setSceneParameters
    L1_36(L2_37, L3_38)
    L1_36 = print
    L1_36(L2_37)
  end
  L1_36 = {}
  L1_36 = L2_37
  for L5_40, L6_41 in L2_37(L3_38) do
    L1_36[L5_40]:setVisiblePermission(false)
    L1_36[L5_40]:setCollidablePermission(false)
  end
  L5_40 = false
  L3_38(L4_39, L5_40)
  L5_40 = false
  L3_38(L4_39, L5_40)
  L5_40 = L3_38
  L6_41 = false
  L4_39(L5_40, L6_41)
  L5_40 = L3_38
  L6_41 = false
  L4_39(L5_40, L6_41)
  L5_40 = L4_39
  L6_41 = Player
  L6_41 = L6_41.kAction_Float
  L4_39(L5_40, L6_41)
  L5_40 = L4_39
  L6_41 = false
  L4_39(L5_40, L6_41)
  L6_41 = L4_39
  L5_40 = L4_39.getBrain
  L5_40 = L5_40(L6_41)
  _crow_brain = L5_40
  L5_40 = findGameObject2
  L6_41 = "EnemyGenerator"
  L5_40 = L5_40(L6_41, "enmgen2_kali_durga")
  _kali_durga = L5_40
  L5_40 = findGameObject2
  L6_41 = "EnemyGenerator"
  L5_40 = L5_40(L6_41, "enmgen2_unica_permet")
  _unica_permet = L5_40
  L5_40 = Fn_setBgmPoint
  L6_41 = "battle"
  L5_40(L6_41, "bgmPoint2")
  L5_40 = _crow_brain
  L6_41 = L5_40
  L5_40 = L5_40.setThreatObjects
  L5_40(L6_41, enmgen2_unica_permet.puppetsList)
  L5_40 = findGameObject2
  L6_41 = "EnemyBrain"
  L5_40 = L5_40(L6_41, "durga")
  _durga_brain = L5_40
  L5_40 = _durga_brain
  L6_41 = L5_40
  L5_40 = L5_40.setEnableHomingTarget
  L5_40(L6_41, false)
  L5_40 = _kali_durga
  L6_41 = L5_40
  L5_40 = L5_40.setEnemyMarker
  L5_40(L6_41, false)
  while true do
    L5_40 = Area
    L6_41 = L5_40
    L5_40 = L5_40.isSkyStable
    L5_40 = L5_40(L6_41)
    if not L5_40 then
      L5_40 = wait
      L5_40()
    end
  end
  L5_40 = Camera
  L6_41 = L5_40
  L5_40 = L5_40.lookTo
  L5_40(L6_41, findGameObject2("Puppet", "unica"):getWorldPos(), 0, 0)
  L5_40 = Fn_missionStart
  L5_40()
  L5_40 = Fn_kaiwaDemoView
  L6_41 = "ep20_00210k"
  L5_40(L6_41)
  L5_40 = Fn_userCtrlOn
  L5_40()
  L5_40 = gravityGemCreate
  L5_40()
  L5_40 = Fn_missionView
  L6_41 = "ep20_01000"
  L5_40(L6_41)
  L5_40 = HUD
  L6_41 = L5_40
  L5_40 = L5_40.sightMarkerSetDisable
  L5_40(L6_41, false)
  L5_40 = HUD
  L6_41 = L5_40
  L5_40 = L5_40.navisSetMaskFromDemo
  L5_40(L6_41, false)
  L5_40 = HPgauge
  L6_41 = "permet"
  L5_40(L6_41)
  L5_40 = HPgauge
  L6_41 = "unica"
  L5_40(L6_41)
  L5_40 = durgaHpCheck
  L5_40()
  L5_40 = Fn_captionView
  L6_41 = "ep20_01001"
  L5_40(L6_41)
  function L5_40(A0_42)
    local L1_43, L2_44
    L1_43 = A0_42.name
    L2_44 = A0_42.attacker
    _attackerType = L2_44
    L2_44 = A0_42.damageHp
    print("enemy name " .. L1_43)
    print("attacker type " .. _attackerType)
    A0_42.ret = true
    return A0_42
  end
  L6_41 = _unica_permet
  L6_41 = L6_41.setEventListener
  L6_41(L6_41, "DamageEnemyReport", L5_40)
  function L6_41(A0_45)
    local L1_46, L2_47
    L1_46 = A0_45.name
    L2_47 = A0_45.attacker
    _sisDefeatType = L2_47
    L2_47 = A0_45.damageHp
    print("enemy name " .. L1_46)
    print("attacker type " .. _sisDefeatType)
    A0_45.ret = true
    return A0_45
  end
  _kali_durga:setEventListener("DamageEnemyReport", L6_41)
  while _isDead == false do
    wait()
  end
  Fn_captionViewEnd()
  Fn_blackout()
  HUD:miniGaugeSetVisible(false)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function HPgauge(A0_48)
  invokeTask(function()
    local L0_49, L1_50, L2_51
    L0_49 = findGameObject2
    L1_50 = "Puppet"
    L2_51 = A0_48
    L0_49 = L0_49(L1_50, L2_51)
    L1_50 = findGameObject2
    L2_51 = "EnemyBrain"
    L1_50 = L1_50(L2_51, A0_48)
    L2_51 = nil
    L1_50:setVisibleBossMarker(true)
    if A0_48 == "unica" then
      L2_51 = HUD:createBossHpGauge({
        obj = L0_49,
        text = "ui_boss_hp_03"
      })
    else
      L2_51 = HUD:createBossHpGauge({
        obj = L0_49,
        text = "ui_boss_hp_04"
      })
    end
    L2_51:setActive(true)
    print("boss_gauge:setActive(true)")
    print("Health Is", L1_50:getHealth())
    while true do
      if L1_50:isRunning() then
        L2_51:setHp((L1_50:getHealth() + 100) / (L1_50:getMaxHealth() + 100))
      end
      if not (L1_50:getHealth() / L1_50:getMaxHealth() <= 0.01) or _attackerType ~= "player" then
        wait()
      end
    end
    L2_51:setActive(false)
    print("boss_gauge:setActive(false)")
    _isDead = true
  end)
end
function durgaHpCheck()
  invokeTask(function()
    local L0_52, L1_53, L2_54, L3_55
    L0_52 = findGameObject2
    L1_53 = "Puppet"
    L2_54 = "durga"
    L0_52 = L0_52(L1_53, L2_54)
    L1_53 = HUD
    L2_54 = L1_53
    L1_53 = L1_53.miniGaugeSetVisible
    L3_55 = true
    L1_53(L2_54, L3_55)
    L1_53 = HUD
    L2_54 = L1_53
    L1_53 = L1_53.miniGaugeSetTextID
    L3_55 = "ep20_01004"
    L1_53(L2_54, L3_55)
    while true do
      L1_53 = HUD
      L2_54 = L1_53
      L1_53 = L1_53.miniGaugeSetNum
      L3_55 = _durga_brain
      L3_55 = L3_55.getHealth
      L3_55 = L3_55(L3_55)
      L3_55 = L3_55 / _durga_brain:getMaxHealth()
      L1_53(L2_54, L3_55)
      L1_53 = _durga_brain
      L2_54 = L1_53
      L1_53 = L1_53.getHealth
      L1_53 = L1_53(L2_54)
      if L1_53 <= 0.011 then
        L1_53 = Fn_lookAtObject
        L2_54 = L0_52
        L3_55 = nil
        L1_53 = L1_53(L2_54, L3_55)
        L2_54 = print
        L3_55 = "check"
        L2_54(L3_55, _sisDefeatType)
        L2_54 = findGameObject2
        L3_55 = "Node"
        L2_54 = L2_54(L3_55, "locator2_crow_start_pos")
        if L2_54 then
          L3_55 = _crow_brain
          L3_55 = L3_55.warpToNode
          L3_55(L3_55, L2_54, Supporter.FirstAction.Ground)
        end
        L3_55 = _crow_brain
        L3_55 = L3_55.setIdling
        L3_55(L3_55, true)
        L3_55 = _unica_permet
        L3_55 = L3_55.requestAllEnemyKill
        L3_55(L3_55)
        L3_55 = _kali_durga
        L3_55 = L3_55.setEnemyMarker
        L3_55(L3_55, false)
        L3_55 = findGameObject2
        L3_55 = L3_55("Node", "locator2_cam_01")
        _sdemo:set(L3_55, {target = L0_52, joint = "bn_head"}, true)
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
        HUD:miniGaugeSetVisible(false)
        _sdemo:play(cam, aim)
        Player:muteVoice(Player.kVoiceMuteLv_All)
        invokeTask(function()
          _durga_brain:playMotion("ang01_damege_fly_f_ep20_00")
          Sound:playSE("ene_durga_vo_die", 1, "", L0_52)
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
            Fn_captionView("ep20_01002")
          elseif _durga_brain:getHealth() <= 0.011 then
            Sound:playSE("kit_565", 1)
            Fn_captionView("ep20_01003")
          end
        end)
        waitSeconds(1.3)
        HUD:blackout(0.8)
        L1_53:abort()
        waitSeconds(1.5)
        Player:muteVoice(Player.kVoiceMuteLv_NoMute)
        Player:setStay(false)
        Fn_scriptGameOver(true)
        break
      end
      L1_53 = wait
      L1_53()
    end
  end)
end
function gravityGemCreate()
  invokeTask(function()
    local L0_56, L1_57, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63, L8_64, L9_65, L10_66, L11_67, L12_68, L13_69
    L0_56 = 0
    L1_57 = math
    L1_57 = L1_57.random
    L2_58 = 1
    L3_59 = 16
    L1_57 = L1_57(L2_58, L3_59)
    L2_58 = nil
    L3_59 = {}
    while L0_56 <= 40 do
      L4_60 = _isInSensor
      if L4_60 then
        L4_60 = createGameObject2
        L5_61 = "Gem"
        L4_60 = L4_60(L5_61)
        L6_62 = L4_60
        L5_61 = L4_60.setGemModelNo
        L7_63 = 4
        L5_61(L6_62, L7_63)
        L5_61 = Fn_getPcPosRot
        L6_62 = L5_61()
        L7_63 = math
        L7_63 = L7_63.random
        L8_64 = -5
        L9_65 = 5
        L7_63 = L7_63(L8_64, L9_65)
        L8_64 = math
        L8_64 = L8_64.random
        L9_65 = -25
        L10_66 = 25
        L8_64 = L8_64(L9_65, L10_66)
        L9_65 = math
        L9_65 = L9_65.random
        L10_66 = -5
        L11_67 = 5
        L9_65 = L9_65(L10_66, L11_67)
        if L1_57 == 1 then
          L10_66 = Vector
          L11_67 = 18 + L7_63
          L12_68 = 3 + L8_64
          L13_69 = 0 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 2 then
          L10_66 = Vector
          L11_67 = -18 + L7_63
          L12_68 = 4 + L8_64
          L13_69 = 0 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 3 then
          L10_66 = Vector
          L11_67 = 0 + L7_63
          L12_68 = -3 + L8_64
          L13_69 = 18 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 4 then
          L10_66 = Vector
          L11_67 = 0 + L7_63
          L12_68 = -4 + L8_64
          L13_69 = -18 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 5 then
          L10_66 = Vector
          L11_67 = 15 + L7_63
          L12_68 = 1 + L8_64
          L13_69 = 15 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 6 then
          L10_66 = Vector
          L11_67 = -15 + L7_63
          L12_68 = -1 + L8_64
          L13_69 = -15 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 7 then
          L10_66 = Vector
          L11_67 = -15 + L7_63
          L12_68 = 2 + L8_64
          L13_69 = 15 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 8 then
          L10_66 = Vector
          L11_67 = 15 + L7_63
          L12_68 = -2 + L8_64
          L13_69 = -15 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 9 then
          L10_66 = Vector
          L11_67 = 17 + L7_63
          L12_68 = 3 + L8_64
          L13_69 = 5 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 10 then
          L10_66 = Vector
          L11_67 = -17 + L7_63
          L12_68 = 4 + L8_64
          L13_69 = -5 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 11 then
          L10_66 = Vector
          L11_67 = 5 + L7_63
          L12_68 = -3 + L8_64
          L13_69 = 17 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 12 then
          L10_66 = Vector
          L11_67 = -5 + L7_63
          L12_68 = -4 + L8_64
          L13_69 = -17 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 13 then
          L10_66 = Vector
          L11_67 = 17 + L7_63
          L12_68 = 3 + L8_64
          L13_69 = -5 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 14 then
          L10_66 = Vector
          L11_67 = -17 + L7_63
          L12_68 = 4 + L8_64
          L13_69 = 5 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 15 then
          L10_66 = Vector
          L11_67 = -5 + L7_63
          L12_68 = -3 + L8_64
          L13_69 = 17 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        elseif L1_57 == 16 then
          L10_66 = Vector
          L11_67 = 5 + L7_63
          L12_68 = -4 + L8_64
          L13_69 = -17 + L9_65
          L10_66 = L10_66(L11_67, L12_68, L13_69)
          L2_58 = L5_61 + L10_66
        end
        L10_66 = Fn_getPcPosRot
        L11_67 = L10_66()
        L12_68 = Query
        L13_69 = L12_68
        L12_68 = L12_68.setEyeSightTransform
        L12_68(L13_69, L10_66, L11_67)
        L12_68 = Query
        L13_69 = L12_68
        L12_68 = L12_68.setEyeSightAngle
        L12_68(L13_69, Deg2Rad(45))
        L12_68 = Query
        L13_69 = L12_68
        L12_68 = L12_68.setEyeSightRange
        L12_68(L13_69, range)
        L12_68 = Query
        L13_69 = L12_68
        L12_68 = L12_68.raycastEyeSight
        L12_68 = L12_68(L13_69, L2_58)
        if not L12_68 then
          L13_69 = L4_60.setWorldPos
          L13_69(L4_60, L2_58)
          L13_69 = L4_60.setForceMove
          L13_69(L4_60)
          L13_69 = L4_60.setVisible
          L13_69(L4_60, true)
          L13_69 = L4_60.try_init
          L13_69(L4_60)
          L13_69 = L4_60.setVisibleBlockHalfSize
          L13_69(L4_60, 150)
          L13_69 = L4_60.waitForReadyAsync
          L13_69(L4_60, function()
            L4_60:try_start()
          end)
          L13_69 = print
          L13_69("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_57)
          L0_56 = L0_56 + 1
          if L0_56 >= 4 then
            L13_69 = waitSeconds
            L13_69(20)
          end
          L13_69 = table
          L13_69 = L13_69.insert
          L13_69(L3_59, L4_60)
          while true do
            L13_69 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_59) do
              if L3_59[_FORV_17_]:isRunning() then
                L13_69 = L13_69 + 1
              end
            end
            if L13_69 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_69)
              break
            end
            wait(15)
          end
          L1_57 = L1_57 + 1
          if L1_57 >= 17 then
            L1_57 = 1
          end
        end
      else
      end
      L4_60 = wait
      L4_60()
    end
  end)
end
function pccubesensor2_01_OnEnter()
  local L0_70, L1_71
  _isInSensor = true
end
function pccubesensor2_01_OnLeave()
  local L0_72, L1_73
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_74
  L1_74 = _warp_caption_flag
  if L1_74 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep20_01005")
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
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
    _player_pup:setVisible(true)
  end
  Player:setStay(false)
end
