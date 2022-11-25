dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep26_common.lua")
dofile("/Game/Misc/pdemo.lua")
sdemo = nil
change_D = false
suck_flg = false
_dus_event_mot_list = {
  sleep = "dus01_sleep_in_00"
}
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01",
      ai_spawn_option = "Demon/demon_boss"
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
    _enemy_cnt = _enemy_cnt - 1
  end
}
enmgen2_battle_boss_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon_freeze",
      locator = "locator_boss_01",
      name = "demon02",
      ai_spawn_option = "Demon/demon_boss"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
    _enemy_cnt = _enemy_cnt - 1
  end
}
enmgen2_durga_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "durga",
      locator = "locator_durga_01",
      name = "durga01"
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
  end
}
function Initialize()
  local L0_24
  L0_24 = Fn_loadEventData
  L0_24("evx/ep26_boss", "evarea2_dt_c_root", true)
  L0_24 = {
    {
      name = "dog_01",
      type = "dog01",
      node = "locator2_dorga_01",
      active = true
    },
    {
      name = "dus_01",
      type = "dus01",
      node = "locator2_dusty_01",
      active = false
    }
  }
  Fn_setupNpc(L0_24)
  sdemo_chara = Player:getPuppet()
  sdemo_node = findGameObject2("Node", "locator2_cam_02")
  sdemo = SDemo.create("ep26_e")
  sdemo2 = SDemo.create("ep26_e2")
  _pdemo = PDemo.create("ep26_a_c01", Fn_findAreaHandle("dt_c_root"), {camera = true, scene_param = true})
  while _pdemo:isLoading() do
    wait()
  end
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
  Fn_loadNpcEventMotion("dus_01", _dus_event_mot_list)
end
function Ingame()
  local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37, L13_38, L14_39, L15_40, L16_41, L17_42, L18_43, L19_44
  L0_25 = Player
  L1_26 = L0_25
  L0_25 = L0_25.setEnergyFakeLimit
  L2_27 = Player
  L2_27 = L2_27.kEnergy_Life
  L3_28 = 100
  L0_25(L1_26, L2_27, L3_28)
  L0_25 = Player
  L1_26 = L0_25
  L0_25 = L0_25.setAbility
  L2_27 = Player
  L2_27 = L2_27.kAbility_TalismanEffect
  L3_28 = false
  L0_25(L1_26, L2_27, L3_28)
  L0_25 = GameDatabase
  L1_26 = L0_25
  L0_25 = L0_25.set
  L2_27 = ggd
  L2_27 = L2_27.Savedata__Menu__MenuUnlock__TopMenuTalisman
  L3_28 = false
  L0_25(L1_26, L2_27, L3_28)
  L0_25 = Debug
  L1_26 = L0_25
  L0_25 = L0_25.setSwitch
  L2_27 = {
    L3_28,
    L4_29,
    L5_30
  }
  L3_28 = "Performance"
  L4_29 = "Physics Debugger np"
  L5_30 = "Visual Debugger np"
  L3_28 = true
  L0_25(L1_26, L2_27, L3_28)
  L0_25 = findGameObject2
  L1_26 = "Node"
  L2_27 = "locator2_col_01"
  L0_25 = L0_25(L1_26, L2_27)
  loc_hdl = L0_25
  L0_25 = createGameObject2
  L1_26 = "TerrainBg"
  L0_25 = L0_25(L1_26)
  ship_col = L0_25
  L0_25 = loc_hdl
  L1_26 = L0_25
  L0_25 = L0_25.appendChild
  L2_27 = ship_col
  L0_25(L1_26, L2_27)
  L0_25 = ship_col
  L1_26 = L0_25
  L0_25 = L0_25.setName
  L2_27 = "ep26_col"
  L0_25(L1_26, L2_27)
  L0_25 = ship_col
  L1_26 = L0_25
  L0_25 = L0_25.setCollisionName
  L2_27 = "ep26_col"
  L0_25(L1_26, L2_27)
  L0_25 = ship_col
  L1_26 = L0_25
  L0_25 = L0_25.try_init
  L0_25(L1_26)
  L0_25 = ship_col
  L1_26 = L0_25
  L0_25 = L0_25.waitForReady
  L0_25(L1_26)
  L0_25 = ship_col
  L1_26 = L0_25
  L0_25 = L0_25.try_start
  L0_25(L1_26)
  L0_25 = findGameObject2
  L1_26 = "EnemyGenerator"
  L2_27 = "enmgen2_a_boss2"
  L0_25 = L0_25(L1_26, L2_27)
  if L0_25 ~= nil then
    L2_27 = L0_25
    L1_26 = L0_25.requestSpawn
    L1_26(L2_27)
  end
  L2_27 = L0_25
  L1_26 = L0_25.setEnemyMarker
  L3_28 = false
  L1_26(L2_27, L3_28)
  while true do
    while true do
      L1_26 = _demon_puppet
      if L1_26 == nil then
        L1_26 = Fn_sendEventComSb
        L2_27 = "boss_name"
        L1_26 = L1_26(L2_27)
        _demon_puppet = L1_26
        L1_26 = wait
        L1_26()
      end
    end
  end
  while true do
    L1_26 = _demon_brain
    if L1_26 == nil then
      L1_26 = _demon_puppet
      L2_27 = L1_26
      L1_26 = L1_26.getBrain
      L1_26 = L1_26(L2_27)
      _demon_brain = L1_26
      L1_26 = wait
      L1_26()
    end
  end
  L1_26 = Fn_sendEventComSb
  L2_27 = "requestIdling"
  L1_26(L2_27)
  L1_26 = findGameObject2
  L2_27 = "Puppet"
  L3_28 = "demon02"
  L1_26 = L1_26(L2_27, L3_28)
  while true do
    L3_28 = L1_26
    L2_27 = L1_26.getBrain
    L2_27 = L2_27(L3_28)
    if L2_27 == nil then
      L2_27 = wait
      L2_27()
    end
  end
  L3_28 = L1_26
  L2_27 = L1_26.getBrain
  L2_27 = L2_27(L3_28)
  L3_28 = Fn_createGimmickBg
  L4_29 = "locator2_daemon_01"
  L5_30 = "crystal"
  L6_31 = "nvwol02crystal"
  L7_32 = true
  L3_28 = L3_28(L4_29, L5_30, L6_31, L7_32)
  crystal = L3_28
  L3_28 = Fn_getPlayer
  L3_28 = L3_28()
  L4_29 = findGameObject2
  L5_30 = "Node"
  L6_31 = "locator2_spattack_05"
  L4_29 = L4_29(L5_30, L6_31)
  L5_30 = L4_29
  L4_29 = L4_29.getWorldTransform
  L5_30 = L4_29(L5_30)
  L6_31 = Fn_createEffect
  L7_32 = "ef_bos_vd_sph_02"
  L8_33 = "ef_bos_vd_sph_02"
  L9_34 = {}
  L9_34.obj = L3_28
  L9_34.joint = "bn_pelvis"
  L10_35, L11_36 = nil, nil
  L12_37 = "initonly"
  L6_31 = L6_31(L7_32, L8_33, L9_34, L10_35, L11_36, L12_37)
  L7_32 = invokeTask
  function L8_33()
    local L0_45, L1_46, L2_47, L3_48, L4_49, L5_50, L6_51
    L0_45 = 0
    L1_46 = false
    L2_47 = false
    repeat
      repeat
        L3_48 = wait
        L3_48()
        L3_48 = Fn_sendEventComSb
        L4_49 = "spwarp"
        L3_48 = L3_48(L4_49)
      until L3_48 == true
      L3_48 = Fn_sendEventComSb
      L4_49 = "outrangeOff"
      L3_48(L4_49)
      while L0_45 < 10 do
        if L0_45 > 6 and L1_46 == false then
          L3_48 = Fn_startEffect
          L4_49 = L6_31
          L3_48(L4_49)
          L3_48 = Sound
          L4_49 = L3_48
          L3_48 = L3_48.playSEHandle
          L5_50 = "ene_demon_restrict"
          L6_51 = 1
          L3_48 = L3_48(L4_49, L5_50, L6_51, "", L3_28)
          suck_se = L3_48
          L1_46 = true
        end
        L3_48 = Fn_sendEventComSb
        L4_49 = "farChack"
        L3_48 = L3_48(L4_49)
        if L3_48 == true and L2_47 == false then
          L3_48 = Fn_userCtrlOff
          L3_48()
          L3_48 = Player
          L4_49 = L3_48
          L3_48 = L3_48.setAction
          L5_50 = Player
          L5_50 = L5_50.kAction_Float
          L3_48(L4_49, L5_50)
          L2_47 = true
        end
        L3_48 = waitSeconds
        L4_49 = 0.5
        L3_48(L4_49)
        L0_45 = L0_45 + 0.5
      end
      L3_48 = Fn_whiteout
      L4_49 = 0.5
      L3_48(L4_49)
      L3_48 = Fn_userCtrlAllOff
      L4_49 = true
      L3_48(L4_49)
      L3_48 = Player
      L4_49 = L3_48
      L3_48 = L3_48.setEnergy
      L5_50 = Player
      L5_50 = L5_50.kEnergy_Gravity
      L6_51 = Player
      L6_51 = L6_51.getEnergyMax
      L6_51 = L6_51(L6_51, Player.kEnergy_Gravity)
      L3_48(L4_49, L5_50, L6_51, L6_51(L6_51, Player.kEnergy_Gravity))
      L3_48 = findGameObject2
      L4_49 = "Node"
      L5_50 = "locator2_spattack_04"
      L3_48 = L3_48(L4_49, L5_50)
      L4_49 = L3_48
      L3_48 = L3_48.getWorldTransform
      L4_49 = L3_48(L4_49)
      L5_50 = Fn_setPcPosRot
      L6_51 = L3_48
      L5_50(L6_51, L4_49, Player.kReset_Floating)
      L5_50 = Camera
      L6_51 = L5_50
      L5_50 = L5_50.lookTo
      L5_50(L6_51, findGameObject2("Node", "locator2_spattack_05"):getWorldPos(), 0, 0)
      L5_50 = Fn_lookAtObject
      L6_51 = "locator2_spattack_05"
      L5_50 = L5_50(L6_51)
      view_task = L5_50
      L5_50 = Player
      L6_51 = L5_50
      L5_50 = L5_50.setGravityControlMode
      L5_50(L6_51, true)
      L5_50 = invokeTask
      function L6_51()
        if Player:getAttrTune() == Player.kAttrTune_Mars then
          suck_power = -2
          suck_late = 1.2
        elseif Player:getAttrTune() == Player.kAttrTune_Jupiter then
          suck_power = -100000000
          suck_late = 1
        else
          suck_power = -6
          suck_late = 2.5
        end
        while Fn_getDistanceToPlayer("locator2_spattack_05") > 4 do
          print("\232\183\157\233\155\162", Fn_getDistanceToPlayer("locator2_spattack_05"))
          wind = createGameObject2("BulletShockwave")
          wind:setParam({
            type = "windfield",
            force = suck_power,
            time = 0.03,
            interval = 0,
            pos = L4_29,
            rot = Vector(0, 0, 0),
            radius = 1000
          })
          wind:attack()
          print("\229\144\184\227\129\132\232\190\188\227\129\191\228\184\173\227\131\187\229\188\183" .. suck_power)
          suck_power = suck_power * suck_late
          wait()
        end
        if Player:getAttrTune() == Player.kAttrTune_Mars then
          suck_late = 0.06
          suck_time = 20
        elseif Player:getAttrTune() == Player.kAttrTune_Jupiter then
          suck_late = 0.95
          suck_time = 20
        else
          suck_late = 0.05
          suck_time = 20
        end
        while 0 < suck_time and 1 < Fn_getDistanceToPlayer("locator2_spattack_05") do
          print("\232\183\157\233\155\162", Fn_getDistanceToPlayer("locator2_spattack_05"))
          wind = createGameObject2("BulletShockwave")
          wind:setParam({
            type = "windfield",
            force = suck_power,
            time = 0.03,
            interval = 0,
            pos = L4_29,
            rot = Vector(0, 0, 0),
            radius = 1000
          })
          wind:attack()
          print("\229\144\184\227\129\132\232\190\188\227\129\191\228\184\173\227\131\187\229\188\177" .. suck_power)
          suck_power = suck_power * suck_late
          suck_time = suck_time - 1
          print("\229\144\184\227\129\132\232\190\188\227\129\191\230\153\130\233\150\147", suck_time)
          wait()
        end
        print("\229\144\184\227\129\132\232\190\188\227\129\191\227\130\185\227\131\136\227\131\131\227\131\151")
        suck_flg = true
        if L6_31 ~= nil then
          L6_31:stop()
          L6_31 = nil
          L6_31 = Fn_createEffect("ef_bos_vd_sph_02", "ef_bos_vd_sph_02", {obj = L3_28, joint = "bn_pelvis"}, nil, nil, "initonly")
        end
        Sound:stopSEHandle(suck_se)
        if view_task ~= nil then
          view_task:abort()
          view_task = nil
        end
      end
      L5_50(L6_51)
      L5_50 = Fn_fadein
      L6_51 = 0.3
      L5_50(L6_51)
      L0_45 = 0
      L1_46 = false
      L2_47 = false
      repeat
        L5_50 = wait
        L5_50()
        L5_50 = Fn_sendEventComSb
        L6_51 = "spwarp"
        L5_50 = L5_50(L6_51)
      until L5_50 == false
      L5_50 = Fn_sendEventComSb
      L6_51 = "outrangeOn"
      L5_50(L6_51)
      L5_50 = wait
      L5_50()
      L5_50 = false
    until L5_50
  end
  L7_32(L8_33)
  L7_32 = Fn_sendEventComSb
  L8_33 = "partchange"
  L7_32(L8_33)
  L7_32 = findGameObject2
  L8_33 = "Node"
  L9_34 = "locator2_daemon_01"
  L7_32 = L7_32(L8_33, L9_34)
  L8_33 = L7_32
  L7_32 = L7_32.getWorldPos
  L7_32 = L7_32(L8_33)
  L8_33 = Fn_findGimmickBgInBgset
  L9_34 = "g1_building_pd_77b_01"
  L8_33 = L8_33(L9_34)
  L10_35 = L8_33
  L9_34 = L8_33.requestBreak
  L11_36 = L7_32
  L12_37 = 5
  L13_38 = 0.1
  L9_34(L10_35, L11_36, L12_37, L13_38)
  L9_34 = HUD
  L10_35 = L9_34
  L9_34 = L9_34.hpgDispReq_FadeOut
  L9_34(L10_35)
  L9_34 = HUD
  L10_35 = L9_34
  L9_34 = L9_34.grgDispReq_FadeOut
  L9_34(L10_35)
  L9_34 = HUD
  L10_35 = L9_34
  L9_34 = L9_34.spgDispReq_FadeOut
  L9_34(L10_35)
  repeat
    L9_34 = wait
    L9_34()
    L9_34 = _demon_brain
    L10_35 = L9_34
    L9_34 = L9_34.isReadyEnemy
    L9_34 = L9_34(L10_35)
  until L9_34
  L9_34 = _demon_brain
  L10_35 = L9_34
  L9_34 = L9_34.cmd
  L11_36 = "setVisible"
  L12_37 = false
  L9_34(L10_35, L11_36, L12_37)
  L9_34 = Fn_lookAtObject
  L10_35 = "locator2_camera_01"
  L11_36 = 0
  L9_34 = L9_34(L10_35, L11_36)
  view_task = L9_34
  L9_34 = findGameObject2
  L10_35 = "Puppet"
  L11_36 = "durga01"
  L9_34 = L9_34(L10_35, L11_36)
  dur_pup = L9_34
  L9_34 = dur_pup
  L10_35 = L9_34
  L9_34 = L9_34.loadPoseAnimation
  L11_36 = "imprison"
  L12_37 = "ang01_ep26_imprison_00"
  L9_34(L10_35, L11_36, L12_37)
  while true do
    L9_34 = dur_pup
    L10_35 = L9_34
    L9_34 = L9_34.isLoading
    L9_34 = L9_34(L10_35)
    if L9_34 then
      L9_34 = wait
      L9_34()
    end
  end
  L9_34 = dur_pup
  L10_35 = L9_34
  L9_34 = L9_34.getBrain
  L9_34 = L9_34(L10_35)
  dur_brain = L9_34
  L9_34 = dur_brain
  L10_35 = L9_34
  L9_34 = L9_34.setEnableHomingTarget
  L11_36 = false
  L9_34(L10_35, L11_36)
  L9_34 = waitSeconds
  L10_35 = 1.5
  L9_34(L10_35)
  L9_34 = camera_seal
  L9_34()
  L9_34 = Fn_missionStart
  L9_34()
  L9_34 = waitSeconds
  L10_35 = 3
  L9_34(L10_35)
  L9_34 = Fn_sendEventComSb
  L10_35 = "ChangeD"
  L9_34(L10_35)
  L9_34 = Fn_sendEventComSb
  L10_35 = "requestunIdling"
  L9_34(L10_35)
  L9_34 = findGameObject2
  L10_35 = "Node"
  L11_36 = "locator2_daemon_01"
  L9_34 = L9_34(L10_35, L11_36)
  L10_35 = Fn_createEffect
  L11_36 = "ef_ks_par_01"
  L12_37 = "ef_ks_par_02"
  L14_39 = L9_34
  L13_38 = L9_34.getWorldPos
  L13_38 = L13_38(L14_39)
  L14_39 = false
  L10_35 = L10_35(L11_36, L12_37, L13_38, L14_39)
  freeze_break1 = L10_35
  L10_35 = freeze_break1
  L11_36 = L10_35
  L10_35 = L10_35.setRot
  L13_38 = L9_34
  L12_37 = L9_34.getWorldRot
  L19_44 = L12_37(L13_38)
  L10_35(L11_36, L12_37, L13_38, L14_39, L15_40, L16_41, L17_42, L18_43, L19_44, L12_37(L13_38))
  L11_36 = L2_27
  L10_35 = L2_27.cmd
  L12_37 = "setVisible"
  L13_38 = false
  L10_35(L11_36, L12_37, L13_38)
  L10_35 = findGameObject2
  L11_36 = "Node"
  L12_37 = "locator2_break_02"
  L10_35 = L10_35(L11_36, L12_37)
  L11_36 = L10_35
  L10_35 = L10_35.getWorldPos
  L10_35 = L10_35(L11_36)
  L11_36 = crystal
  L12_37 = L11_36
  L11_36 = L11_36.requestBreak
  L13_38 = L10_35
  L14_39 = 0.01
  L15_40 = 7
  L11_36(L12_37, L13_38, L14_39, L15_40)
  L11_36 = _demon_brain
  L12_37 = L11_36
  L11_36 = L11_36.cmd
  L13_38 = "GetDebris"
  L14_39 = crystal
  L11_36 = L11_36(L12_37, L13_38, L14_39)
  L13_38 = L11_36
  L12_37 = L11_36.setGravityFactorRatio
  L14_39 = 0.3
  L12_37(L13_38, L14_39)
  L12_37 = _demon_brain
  L13_38 = L12_37
  L12_37 = L12_37.cmd
  L14_39 = "setVisible"
  L15_40 = true
  L12_37(L13_38, L14_39, L15_40)
  L12_37 = findGameObject2
  L13_38 = "Node"
  L14_39 = "locator2_crystal_01"
  L12_37 = L12_37(L13_38, L14_39)
  cry_se_hdl = L12_37
  L12_37 = Sound
  L13_38 = L12_37
  L12_37 = L12_37.playSEHandle
  L14_39 = "ene_demon_ice_drop_amb"
  L15_40 = 1
  L12_37 = L12_37(L13_38, L14_39, L15_40, L16_41, L17_42)
  L13_38 = waitSeconds
  L14_39 = 1.5
  L13_38(L14_39)
  L13_38 = camera_unseal
  L13_38()
  L13_38 = view_task
  if L13_38 ~= nil then
    L13_38 = view_task
    L14_39 = L13_38
    L13_38 = L13_38.abort
    L13_38(L14_39)
    view_task = nil
  end
  L13_38 = Sound
  L14_39 = L13_38
  L13_38 = L13_38.stopSEHandle
  L15_40 = L12_37
  L13_38(L14_39, L15_40)
  L13_38 = Fn_captionViewWait
  L14_39 = "ep26_04000"
  L13_38(L14_39)
  L13_38 = ship_col
  L14_39 = L13_38
  L13_38 = L13_38.setActive
  L15_40 = false
  L13_38(L14_39, L15_40)
  L13_38 = Fn_sendEventComSb
  L14_39 = "spattack"
  L13_38(L14_39)
  L13_38 = waitSeconds
  L14_39 = 2.7
  L13_38(L14_39)
  L13_38 = findGameObject2
  L14_39 = "Node"
  L15_40 = "locator2_breakeff_01"
  L13_38 = L13_38(L14_39, L15_40)
  L14_39 = Fn_createEffect
  L15_40 = "ef_bos_ks_end_01"
  L14_39 = L14_39(L15_40, L16_41, L17_42, L18_43)
  freeze_del = L14_39
  L14_39 = freeze_del
  L15_40 = L14_39
  L14_39 = L14_39.setRot
  L19_44 = L16_41(L17_42)
  L14_39(L15_40, L16_41, L17_42, L18_43, L19_44, L16_41(L17_42))
  L14_39 = findGameObject2
  L15_40 = "Node"
  L14_39 = L14_39(L15_40, L16_41)
  evap_hdl_01 = L14_39
  L14_39 = Sound
  L15_40 = L14_39
  L14_39 = L14_39.playSEBox
  L19_44 = evap_hdl_01
  L14_39(L15_40, L16_41, L17_42, L18_43, L19_44)
  L14_39 = waitSeconds
  L15_40 = 7.8
  L14_39(L15_40)
  L14_39 = Sound
  L15_40 = L14_39
  L14_39 = L14_39.playSE
  L14_39(L15_40, L16_41)
  repeat
    L14_39 = wait
    L14_39()
    L14_39 = suck_flg
  until L14_39 == true
  suck_flg = false
  L14_39 = sdemo
  L15_40 = L14_39
  L14_39 = L14_39.set
  L14_39(L15_40, L16_41, L17_42, L18_43)
  L14_39 = sdemo
  L15_40 = L14_39
  L14_39 = L14_39.play
  L14_39(L15_40)
  L14_39 = Vector
  L15_40 = 0
  L14_39 = L14_39(L15_40, L16_41, L17_42)
  pc_pos = L14_39
  L14_39 = pc_pos
  L15_40 = pc_pos
  L19_44 = L17_42(L18_43)
  L16_41.z = L19_44
  L15_40.y = L18_43
  L14_39.x = L17_42
  L14_39 = pc_pos
  L15_40 = pc_pos
  L15_40 = L15_40.y
  L15_40 = L15_40 - 1
  L14_39.y = L15_40
  L14_39 = Fn_setPcPosRot
  L15_40 = pc_pos
  L14_39(L15_40, L16_41, L17_42)
  repeat
    L14_39 = wait
    L14_39()
    L14_39 = Fn_sendEventComSb
    L15_40 = "sprelease"
    L14_39 = L14_39(L15_40)
  until L14_39 == true
  L14_39 = {L15_40}
  L15_40 = {}
  L15_40.pos = "locator2_cam_03"
  L15_40.time = 3
  L15_40.hashfunc = "Linear"
  L15_40 = {L16_41}
  L16_41.pos = "locator2_aim_01"
  L16_41.time = 3
  L16_41.hashfunc = "easeOut"
  L19_44 = "locator2_spattack_05"
  L16_41(L17_42, L18_43, L19_44, true)
  L19_44 = L15_40
  L16_41(L17_42, L18_43, L19_44)
  L16_41(L17_42, L18_43)
  for L19_44 = 1, 30 do
    Player:moveToLandingPoint(findGameObject2("Node", "locator2_dusty_02"):getWorldPos(), 1, 0)
    wait()
  end
  L16_41(L17_42)
  L16_41(L17_42, L18_43)
  L16_41(L17_42)
  sdemo_chara = L16_41
  sdemo_node = L16_41
  L19_44 = sdemo_chara
  L16_41(L17_42, L18_43, L19_44, kSDEMO_APPEND_AIM)
  L16_41(L17_42)
  L16_41(L17_42, L18_43)
  L16_41()
  L16_41(L17_42)
  L19_44 = -1
  L16_41(L17_42, L18_43, L19_44, 0, false)
  L16_41(L17_42)
  L19_44 = {}
  L19_44.deg = 15
  L16_41(L17_42, L18_43, L19_44, "easeOut")
  L16_41(L17_42)
  L16_41(L17_42)
  L19_44 = "locator2_dusty_01"
  L17_42(L18_43)
  L19_44 = "at_bress1"
  L17_42(L18_43, L19_44)
  L19_44 = false
  L17_42(L18_43, L19_44)
  L17_42(L18_43)
  L17_42()
  L17_42.r_stick = false
  L17_42.l_stick = false
  L19_44 = Player
  L19_44 = L19_44.kAbility_Grab
  L19_44 = Fn_lockPlayerAbility
  L19_44(L18_43, L17_42)
  L19_44 = HUD
  L19_44 = L19_44.hpgDispReq_FadeOut
  L19_44(L19_44)
  L19_44 = HUD
  L19_44 = L19_44.grgDispReq_FadeOut
  L19_44(L19_44)
  L19_44 = HUD
  L19_44 = L19_44.spgDispReq_FadeOut
  L19_44(L19_44)
  L19_44 = sdemo
  L19_44 = L19_44.stop
  L19_44(L19_44, 2)
  L19_44 = Fn_setNpcActive
  L19_44("dus_01", false)
  L19_44 = Fn_captionView
  L19_44("ep26_04002")
  L19_44 = waitSeconds
  L19_44(3.5)
  L19_44 = Fn_captionView
  L19_44("ep26_04007")
  L19_44 = waitSeconds
  L19_44(3)
  L19_44 = sdemo
  L19_44 = L19_44.reset
  L19_44(L19_44)
  L19_44 = sdemo2
  L19_44 = L19_44.reset
  L19_44(L19_44)
  repeat
    L19_44 = wait
    L19_44()
    L19_44 = Fn_sendEventComSb
    L19_44 = L19_44("warpNow")
  until L19_44 == false
  L19_44 = Fn_sendEventComSb
  L19_44("requestIdling")
  L19_44 = Fn_captionView
  L19_44("ep26_04004")
  L19_44 = _demon_puppet
  L19_44 = L19_44.setVisible
  L19_44(L19_44, false)
  L19_44 = _pdemo
  L19_44 = L19_44.play
  L19_44(L19_44)
  L19_44 = Fn_userCtrlAllOff
  L19_44()
  L19_44 = Fn_resetPcPos
  L19_44("locator2_pc_start_pos", Player.kReset_Standing)
  while true do
    L19_44 = _pdemo
    L19_44 = L19_44.isEnd
    L19_44 = L19_44(L19_44)
    if not L19_44 then
      L19_44 = wait
      L19_44()
    end
  end
  L19_44 = Fn_userCtrlOn
  L19_44()
  L19_44 = _pdemo
  L19_44 = L19_44.stop
  L19_44(L19_44)
  L19_44 = wait
  L19_44(3)
  L19_44 = _pdemo
  L19_44 = L19_44.try_term
  L19_44(L19_44)
  _pdemo = nil
  L19_44 = _demon_puppet
  L19_44 = L19_44.setVisible
  L19_44(L19_44, true)
  L19_44 = Fn_sendEventComSb
  L19_44("requestunIdling")
  L19_44 = Fn_sendEventComSb
  L19_44("spattack")
  L19_44 = Player
  L19_44 = L19_44.setNoDamageMode
  L19_44(L19_44, Player.kNoDamage_All, true)
  L19_44 = Player
  L19_44 = L19_44.getPuppet
  L19_44 = L19_44(L19_44)
  sdemo_chara = L19_44
  L19_44 = findGameObject2
  L19_44 = L19_44("Node", "locator2_cam_02")
  sdemo_node = L19_44
  L19_44 = waitSeconds
  L19_44(2.5)
  L19_44 = waitSeconds
  L19_44(8)
  L19_44 = Sound
  L19_44 = L19_44.playSE
  L19_44(L19_44, "ene_demon_whiteout_in")
  repeat
    L19_44 = wait
    L19_44()
    L19_44 = suck_flg
  until L19_44 == true
  suck_flg = false
  L19_44 = findGameObject2
  L19_44 = L19_44("Node", "locator2_cam_05")
  sdemo_node = L19_44
  L19_44 = sdemo
  L19_44 = L19_44.set
  L19_44(L19_44, sdemo_node, sdemo_chara, kSDEMO_APPEND_AIM)
  L19_44 = sdemo
  L19_44 = L19_44.play
  L19_44(L19_44)
  L19_44 = Fn_setPcPosRot
  L19_44(pc_pos, L5_30, Player.kReset_Floating)
  repeat
    L19_44 = wait
    L19_44()
    L19_44 = Fn_sendEventComSb
    L19_44 = L19_44("sprelease")
  until L19_44 == true
  L19_44 = {
    {
      pos = "locator2_cam_07",
      time = 2.5,
      hashfunc = "EaseInOut"
    }
  }
  sdemo2:set("locator2_cam_05", sdemo_chara, true)
  sdemo2:play(L19_44)
  sdemo:stop(0)
  sdemo2:stop(1.7)
  waitSeconds(0.5)
  Fn_blackout(1)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Player:setAbility(Player.kAbility_TalismanEffect, true)
    Player:setEnergyFakeLimit(Player.kEnergy_Life)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
  Player:setNoDamageMode(Player.kNoDamage_All, false)
end
function navi_on()
  local L0_52, L1_53
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function ep11GetLocatorPosRot(A0_54)
  local L1_55, L2_56, L3_57
  L1_55 = findGameObject2
  L2_56 = "Node"
  L3_57 = A0_54
  L1_55 = L1_55(L2_56, L3_57)
  L3_57 = L1_55
  L2_56 = L1_55.getWorldTransform
  L3_57 = L2_56(L3_57)
  return L2_56, L3_57
end
function ep11GetLocatorPos(A0_58)
  return findGameObject2("Node", A0_58):getWorldTransform()
end
function camera_seal()
  local L0_59, L1_60
  L0_59 = {}
  L0_59.r_stick = true
  L0_59.l_stick = false
  L1_60 = {}
  Fn_lockPlayerAbility(L1_60, L0_59)
  print("\227\130\171\227\131\161\227\131\169\230\147\141\228\189\156\229\176\129\229\141\176")
end
function camera_unseal()
  local L0_61, L1_62
  L0_61 = {}
  L0_61.r_stick = true
  L0_61.l_stick = false
  L1_62 = {}
  Fn_unLockPlayerAbility(L1_62, L0_61)
  print("\227\130\171\227\131\161\227\131\169\230\147\141\228\189\156\229\176\129\229\141\176")
end
function pccubesensor2_col_01_OnEnter(A0_63)
  A0_63:setActive(false)
  ship_col:setActive(false)
end
