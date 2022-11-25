dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep26_common.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
_wind_cap = 0
suck_time = 0
suck_flg = false
boss_release = false
attack_name = ""
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01"
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
function Initialize()
  sdemo_chara = Player:getPuppet()
  sdemo_node = findGameObject2("Node", "locator2_cam_02")
  sdemo = SDemo.create("ep26_c")
  sdemo2 = SDemo.create("ep26_c2")
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
  Fn_sendEventComSb("partchange")
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19
  L0_8 = Fn_dtDemoObjectActive
  L1_9 = true
  L0_8(L1_9)
  L0_8 = Fn_WarshipInvisible
  L0_8()
  while true do
    L0_8 = _demon_puppet
    if L0_8 == nil then
      L0_8 = Fn_sendEventComSb
      L1_9 = "boss_name"
      L0_8 = L0_8(L1_9)
      _demon_puppet = L0_8
      L0_8 = wait
      L0_8()
    end
  end
  L0_8 = _demon_puppet
  L1_9 = L0_8
  L0_8 = L0_8.getBrain
  L0_8 = L0_8(L1_9)
  L1_9 = Fn_sendEventComSb
  L2_10 = "requestIdling"
  L1_9(L2_10)
  L1_9 = invokeTask
  function L2_10()
    boss_gauge = HUD:createBossHpGauge({
      obj = _demon_puppet
    })
    boss_gauge:setActive(true)
    while _demon_puppet:isRunning() do
      demon_health = L0_8:getHealth()
      if demon_health < 2065 then
        demon_health = 2015
      end
      boss_gauge:setHp((demon_health - L0_8:getMaxHealth() * 0.7147) / (L0_8:getMaxHealth() - L0_8:getMaxHealth() * 0.7147))
      wait()
    end
  end
  L1_9 = L1_9(L2_10)
  gauge_task = L1_9
  L1_9 = invokeTask
  function L2_10()
    repeat
      if Player:getLastFrameVelocityLength() > 50 and Player:getAction() ~= Player.kAction_AnyGravKick and Player:getAttrTune() ~= "Player.kAttrTune_Jupiter" and Player:isFeline() == false and _wind_cap_non == false then
        if _wind_cap >= 100 and _wind_cap < 200 then
          Fn_captionViewWait("ep26_00100")
          _wind_cap = 200
        elseif _wind_cap >= 300 then
          Fn_captionViewWait("ep26_00101")
          _wind_cap = 0
        end
        _wind_cap = _wind_cap + RandI(10, 40)
      end
      _wind_cap_non = false
      if Player:getAction() == Player.kAction_AnyGravKick then
        _wind_cap_non = true
      end
      wait()
    until false
  end
  L1_9 = L1_9(L2_10)
  _pc_dmg = L1_9
  L1_9 = Fn_getPlayer
  L1_9 = L1_9()
  L2_10 = findGameObject2
  L3_11 = "Node"
  L4_12 = "locator2_spattack_05"
  L2_10 = L2_10(L3_11, L4_12)
  L3_11 = L2_10
  L2_10 = L2_10.getWorldTransform
  L3_11 = L2_10(L3_11)
  L4_12 = invokeTask
  function L5_13()
    local L0_20, L1_21, L2_22, L3_23
    repeat
      repeat
        L0_20 = wait
        L0_20()
        L0_20 = Fn_sendEventComSb
        L1_21 = "spwarp"
        L0_20 = L0_20(L1_21)
      until L0_20 == true
      L0_20 = Fn_sendEventComSb
      L1_21 = "outrangeOff"
      L0_20(L1_21)
      L0_20 = waitSeconds
      L1_21 = 4
      L0_20(L1_21)
      L0_20 = Player
      L1_21 = L0_20
      L0_20 = L0_20.setFeline
      L2_22 = false
      L3_23 = true
      L0_20(L1_21, L2_22, L3_23)
      L0_20 = waitSeconds
      L1_21 = 3
      L0_20(L1_21)
      L0_20 = Fn_createEffect
      L1_21 = "ef_bos_vd_sph_02"
      L2_22 = "ef_bos_vd_sph_02"
      L3_23 = {}
      L3_23.obj = L1_9
      L3_23.joint = "bn_spine2"
      L0_20 = L0_20(L1_21, L2_22, L3_23, false)
      suck_eff = L0_20
      L0_20 = Sound
      L1_21 = L0_20
      L0_20 = L0_20.playSEHandle
      L2_22 = "ene_demon_restrict"
      L3_23 = 1
      L0_20 = L0_20(L1_21, L2_22, L3_23, "", L1_9)
      suck_se = L0_20
      L0_20 = Fn_sendEventComSb
      L1_21 = "farChack"
      L0_20 = L0_20(L1_21)
      if L0_20 == true then
        L0_20 = Fn_userCtrlOff
        L0_20()
        L0_20 = Player
        L1_21 = L0_20
        L0_20 = L0_20.setAction
        L2_22 = Player
        L2_22 = L2_22.kAction_Float
        L0_20(L1_21, L2_22)
      end
      L0_20 = waitSeconds
      L1_21 = 3
      L0_20(L1_21)
      L0_20 = Fn_whiteout
      L1_21 = 0.5
      L0_20(L1_21)
      L0_20 = Fn_userCtrlAllOff
      L1_21 = true
      L0_20(L1_21)
      L0_20 = Player
      L1_21 = L0_20
      L0_20 = L0_20.setEnergy
      L2_22 = Player
      L2_22 = L2_22.kEnergy_Gravity
      L3_23 = Player
      L3_23 = L3_23.getEnergyMax
      L3_23 = L3_23(L3_23, Player.kEnergy_Gravity)
      L0_20(L1_21, L2_22, L3_23, L3_23(L3_23, Player.kEnergy_Gravity))
      L0_20 = findGameObject2
      L1_21 = "Node"
      L2_22 = "locator2_spattack_04"
      L0_20 = L0_20(L1_21, L2_22)
      L1_21 = L0_20
      L0_20 = L0_20.getWorldTransform
      L1_21 = L0_20(L1_21)
      L2_22 = Fn_setPcPosRot
      L3_23 = L0_20
      L2_22(L3_23, L1_21, Player.kReset_Floating)
      L2_22 = Camera
      L3_23 = L2_22
      L2_22 = L2_22.lookTo
      L2_22(L3_23, findGameObject2("Node", "locator2_spattack_05"):getWorldPos(), 0, 0)
      L2_22 = Fn_lookAtObject
      L3_23 = "locator2_spattack_05"
      L2_22 = L2_22(L3_23)
      view_task = L2_22
      L2_22 = Player
      L3_23 = L2_22
      L2_22 = L2_22.setGravityControlMode
      L2_22(L3_23, true)
      L2_22 = invokeTask
      function L3_23()
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
            pos = L2_10,
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
            pos = L2_10,
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
        suck_eff:setVisible(false)
        if suck_eff ~= nil then
          suck_eff = nil
        end
        Sound:stopSEHandle(suck_se)
        if view_task ~= nil then
          view_task:abort()
          view_task = nil
        end
      end
      L2_22(L3_23)
      L2_22 = Fn_fadein
      L3_23 = 0.3
      L2_22(L3_23)
      repeat
        L2_22 = wait
        L2_22()
        L2_22 = Fn_sendEventComSb
        L3_23 = "spwarp"
        L2_22 = L2_22(L3_23)
      until L2_22 == false
      L2_22 = Fn_sendEventComSb
      L3_23 = "outrangeOn"
      L2_22(L3_23)
      L2_22 = wait
      L2_22()
      L2_22 = false
    until L2_22
  end
  L4_12(L5_13)
  repeat
    L4_12 = print
    L5_13 = "\227\131\135\227\131\188\227\131\162\227\131\179\229\164\137\229\140\150\229\190\133\230\169\159\228\184\173"
    L4_12(L5_13)
    L4_12 = wait
    L4_12()
    L4_12 = Fn_sendEventComSb
    L5_13 = "ChangeBret"
    L4_12 = L4_12(L5_13)
  until L4_12 == true
  L4_12 = Fn_missionStart
  L4_12()
  L4_12 = Fn_userCtrlOn
  L4_12()
  L4_12 = Fn_captionViewWait
  L5_13 = "ep26_02000"
  L4_12(L5_13)
  L4_12 = Fn_captionViewWait
  L5_13 = "ep26_02001"
  L4_12(L5_13)
  L4_12 = invokeTask
  function L5_13()
    repeat
      if Fn_getDistanceToPlayer("locator2_windpos_01") < 40 then
        Fn_sendEventComSb("attackname", "at_shoth")
        print("\232\191\145\230\142\165\233\135\141\229\138\155\229\188\190")
        demonAttackWait()
      else
        Fn_sendEventComSb("attackname", "at_shot")
        print("\233\135\141\229\138\155\229\188\190")
        demonAttackWait()
      end
      wait()
    until false
  end
  L4_12 = L4_12(L5_13)
  L5_13 = Fn_sendEventComSb
  L6_14 = "requestunIdling"
  L5_13(L6_14)
  while true do
    while true do
      L6_14 = L0_8
      L5_13 = L0_8.getHealth
      L5_13 = L5_13(L6_14)
      L7_15 = L0_8
      L6_14 = L0_8.getMaxHealth
      L6_14 = L6_14(L7_15)
      L6_14 = L6_14 * 0.7846
      if L5_13 > L6_14 then
        L5_13 = wait
        L5_13()
      end
    end
  end
  repeat
    L5_13 = print
    L6_14 = "\230\148\187\230\146\131\231\181\130\227\130\143\227\130\138\229\190\133\227\129\161"
    L5_13(L6_14)
    L5_13 = wait
    L5_13()
    L5_13 = Fn_sendEventComSb
    L6_14 = "attackwait"
    L5_13 = L5_13(L6_14)
  until L5_13 == false
  if L4_12 ~= nil then
    L6_14 = L4_12
    L5_13 = L4_12.abort
    L5_13(L6_14)
    L4_12 = nil
  end
  at_shot = false
  L5_13 = Fn_sendEventComSb
  L6_14 = "spattack"
  L5_13(L6_14)
  _wind_cap = -10000
  L5_13 = waitSeconds
  L6_14 = 2.5
  L5_13(L6_14)
  L5_13 = waitSeconds
  L6_14 = 5
  L5_13(L6_14)
  L5_13 = Fn_captionView
  L6_14 = "ep26_02002"
  L5_13(L6_14)
  L5_13 = waitSeconds
  L6_14 = 3
  L5_13(L6_14)
  L5_13 = Sound
  L6_14 = L5_13
  L5_13 = L5_13.playSE
  L7_15 = "ene_demon_whiteout_in"
  L5_13(L6_14, L7_15)
  repeat
    L5_13 = wait
    L5_13()
    L5_13 = suck_flg
  until L5_13 == true
  suck_flg = false
  L5_13 = sdemo
  L6_14 = L5_13
  L5_13 = L5_13.set
  L7_15 = sdemo_node
  L8_16 = sdemo_chara
  L9_17 = kSDEMO_APPEND_AIM
  L5_13(L6_14, L7_15, L8_16, L9_17)
  L5_13 = sdemo
  L6_14 = L5_13
  L5_13 = L5_13.play
  L5_13(L6_14)
  L5_13 = Vector
  L6_14 = 0
  L7_15 = 0
  L8_16 = 0
  L5_13 = L5_13(L6_14, L7_15, L8_16)
  pc_pos = L5_13
  L5_13 = pc_pos
  L6_14 = pc_pos
  L7_15 = pc_pos
  L8_16 = Fn_sendEventComSb
  L9_17 = "pcpos"
  L10_18 = L8_16(L9_17)
  L7_15.z = L10_18
  L6_14.y = L9_17
  L5_13.x = L8_16
  L5_13 = pc_pos
  L6_14 = pc_pos
  L6_14 = L6_14.y
  L6_14 = L6_14 - 1
  L5_13.y = L6_14
  L5_13 = Fn_setPcPosRot
  L6_14 = pc_pos
  L7_15 = L3_11
  L8_16 = Player
  L8_16 = L8_16.kReset_Floating
  L5_13(L6_14, L7_15, L8_16)
  repeat
    L5_13 = wait
    L5_13()
    L5_13 = Fn_sendEventComSb
    L6_14 = "sprelease"
    L5_13 = L5_13(L6_14)
  until L5_13 == true
  L5_13 = {L6_14}
  L6_14 = {}
  L6_14.pos = "locator2_cam_03"
  L6_14.time = 2
  L6_14.hashfunc = "EaseInOut"
  L6_14 = sdemo2
  L7_15 = L6_14
  L6_14 = L6_14.set
  L8_16 = "locator2_cam_02"
  L9_17 = sdemo_chara
  L10_18 = true
  L6_14(L7_15, L8_16, L9_17, L10_18)
  L6_14 = sdemo2
  L7_15 = L6_14
  L6_14 = L6_14.play
  L8_16 = L5_13
  L6_14(L7_15, L8_16)
  L6_14 = sdemo
  L7_15 = L6_14
  L6_14 = L6_14.stop
  L8_16 = 0
  L6_14(L7_15, L8_16)
  repeat
    L6_14 = wait
    L6_14()
    L6_14 = Fn_sendEventComSb
    L7_15 = "spwarp"
    L6_14 = L6_14(L7_15)
  until L6_14 == false
  L6_14 = sdemo2
  L7_15 = L6_14
  L6_14 = L6_14.stop
  L8_16 = 1
  L6_14(L7_15, L8_16)
  L6_14 = {}
  L6_14.r_stick = false
  L6_14.l_stick = false
  L7_15 = {
    L8_16,
    L9_17,
    L10_18,
    L11_19,
    Player.kAbility_Grab,
    Player.kAbility_FelineStart,
    Player.kAbility_FelineEnd
  }
  L8_16 = Player
  L8_16 = L8_16.kAbility_SpAttack
  L9_17 = Player
  L9_17 = L9_17.kAbility_SpTornado
  L10_18 = Player
  L10_18 = L10_18.kAbility_SpTyphoon
  L11_19 = Player
  L11_19 = L11_19.kAbility_SpBlackHole
  L8_16 = Fn_lockPlayerAbility
  L9_17 = L7_15
  L10_18 = L6_14
  L8_16(L9_17, L10_18)
  L8_16 = print
  L9_17 = "\230\147\141\228\189\156\232\167\163\230\148\190"
  L8_16(L9_17)
  L8_16 = Camera
  L9_17 = L8_16
  L8_16 = L8_16.lookTo
  L10_18 = findGameObject2
  L11_19 = "Node"
  L10_18 = L10_18(L11_19, "locator2_spattack_05")
  L11_19 = L10_18
  L10_18 = L10_18.getWorldPos
  L10_18 = L10_18(L11_19)
  L11_19 = 1
  L8_16(L9_17, L10_18, L11_19, 0)
  L8_16 = Fn_userCtrlOn
  L8_16()
  L8_16 = HUD
  L9_17 = L8_16
  L8_16 = L8_16.spgDispReq_FadeOut
  L8_16(L9_17)
  L8_16 = Fn_sendEventComSb
  L9_17 = "attackname"
  L10_18 = "at_bress1"
  L8_16(L9_17, L10_18)
  _wind_cap = 0
  L8_16 = Fn_sendEventComSb
  L9_17 = "requestIdling"
  L8_16(L9_17)
  L8_16 = Fn_captionViewWait
  L9_17 = "ep26_04010"
  L8_16(L9_17)
  L8_16 = Fn_captionView
  L9_17 = "ep26_02003"
  L8_16(L9_17)
  repeat
    L8_16 = wait
    L8_16()
    L8_16 = Fn_sendEventComSb
    L9_17 = "attackwait"
    L8_16 = L8_16(L9_17)
  until L8_16 == false
  L8_16 = Fn_sendEventComSb
  L9_17 = "requestIdling"
  L8_16(L9_17)
  L8_16 = invokeTask
  function L9_17()
    repeat
      if Fn_getDistanceToPlayer("locator2_windpos_01") < 39 then
        Fn_sendEventComSb("attackname", "at_wing")
        print("\231\190\189\230\148\187\230\146\131" .. Fn_getDistanceToPlayer("locator2_windpos_01"))
        demonAttackWait()
      elseif RandI(1, 2) == 1 then
        Fn_sendEventComSb("attackname", "at_bress2")
        print("\227\131\150\227\131\172\227\130\185" .. Fn_getDistanceToPlayer("locator2_windpos_01"))
        demonAttackWait()
      else
        Fn_sendEventComSb("attackname", "at_bress3")
        print("\232\150\153\227\129\142\230\137\149\227\129\132\227\131\150\227\131\172\227\130\185" .. Fn_getDistanceToPlayer("locator2_windpos_01"))
        demonAttackWait()
      end
      print(Fn_getDistanceToPlayer("locator2_windpos_01"))
      wait()
    until false
  end
  L8_16 = L8_16(L9_17)
  L9_17 = Fn_sendEventComSb
  L10_18 = "requestunIdling"
  L9_17(L10_18)
  while true do
    while true do
      L10_18 = L0_8
      L9_17 = L0_8.getHealth
      L9_17 = L9_17(L10_18)
      L11_19 = L0_8
      L10_18 = L0_8.getMaxHealth
      L10_18 = L10_18(L11_19)
      L10_18 = L10_18 * 0.8203
      if L9_17 > L10_18 then
        L9_17 = wait
        L9_17()
      end
    end
  end
  repeat
    L9_17 = wait
    L9_17()
    L9_17 = Fn_sendEventComSb
    L10_18 = "attackwait"
    L9_17 = L9_17(L10_18)
  until L9_17 == false
  if L8_16 ~= nil then
    L10_18 = L8_16
    L9_17 = L8_16.abort
    L9_17(L10_18)
    L8_16 = nil
  end
  L9_17 = Fn_sendEventComSb
  L10_18 = "spattack"
  L9_17(L10_18)
  _wind_cap = -1000
  L9_17 = waitSeconds
  L10_18 = 2.5
  L9_17(L10_18)
  L9_17 = waitSeconds
  L10_18 = 8
  L9_17(L10_18)
  L9_17 = Sound
  L10_18 = L9_17
  L9_17 = L9_17.playSE
  L11_19 = "ene_demon_whiteout_in"
  L9_17(L10_18, L11_19)
  repeat
    L9_17 = wait
    L9_17()
    L9_17 = suck_flg
  until L9_17 == true
  suck_flg = false
  L9_17 = findGameObject2
  L10_18 = "Node"
  L11_19 = "locator2_cam_04"
  L9_17 = L9_17(L10_18, L11_19)
  sdemo_node = L9_17
  L9_17 = sdemo
  L10_18 = L9_17
  L9_17 = L9_17.set
  L11_19 = sdemo_node
  L9_17(L10_18, L11_19, sdemo_chara, kSDEMO_APPEND_AIM)
  L9_17 = sdemo
  L10_18 = L9_17
  L9_17 = L9_17.play
  L9_17(L10_18)
  L9_17 = Fn_setPcPosRot
  L10_18 = pc_pos
  L11_19 = L3_11
  L9_17(L10_18, L11_19, Player.kReset_Floating)
  repeat
    L9_17 = wait
    L9_17()
    L9_17 = Fn_sendEventComSb
    L10_18 = "sprelease"
    L9_17 = L9_17(L10_18)
  until L9_17 == true
  L9_17 = {L10_18}
  L10_18 = {}
  L10_18.pos = "locator2_cam_06"
  L10_18.time = 3
  L10_18.hashfunc = "EaseInOut"
  L10_18 = sdemo2
  L11_19 = L10_18
  L10_18 = L10_18.set
  L10_18(L11_19, "locator2_cam_04", sdemo_chara, true)
  L10_18 = sdemo2
  L11_19 = L10_18
  L10_18 = L10_18.play
  L10_18(L11_19, L9_17)
  L10_18 = sdemo
  L11_19 = L10_18
  L10_18 = L10_18.stop
  L10_18(L11_19, 0)
  repeat
    L10_18 = wait
    L10_18()
    L10_18 = Fn_sendEventComSb
    L11_19 = "spwarp"
    L10_18 = L10_18(L11_19)
  until L10_18 == false
  L10_18 = sdemo2
  L11_19 = L10_18
  L10_18 = L10_18.stop
  L10_18(L11_19, 1)
  L10_18 = Player
  L11_19 = L10_18
  L10_18 = L10_18.setEnergyFakeLimit
  L10_18(L11_19, Player.kEnergy_Life, 100)
  L10_18 = {}
  L10_18.r_stick = false
  L10_18.l_stick = false
  L11_19 = {
    Player.kAbility_TalismanEffect,
    Player.kAbility_AttrTuneSwitch
  }
  Fn_lockPlayerAbility(L11_19, L10_18)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, false)
  if Player:getAttrTune() == Player.kAttrTune_Mars or Player:getAttrTune() == Player.kAttrTune_Jupiter then
    Player:setAttrTune(Player.kAttrTune_Normal, true)
  end
  print("\230\147\141\228\189\156\232\167\163\230\148\190")
  Camera:lookTo(findGameObject2("Node", "locator2_spattack_05"):getWorldPos(), 1, 0)
  Fn_userCtrlOn()
  HUD:spgDispReq_FadeOut()
  _wind_cap = 0
  Fn_captionView("ep26_04012")
  while L0_8:getHealth() > L0_8:getMaxHealth() * 0.8856 do
    wait()
  end
  repeat
    wait()
  until Fn_sendEventComSb("attackwait") == false
  Fn_sendEventComSb("spattack")
  _wind_cap = -10000
  waitSeconds(2.5)
  Fn_captionView("ep26_02005")
  waitSeconds(8)
  Sound:playSE("ene_demon_whiteout_in")
  repeat
    wait()
  until suck_flg == true
  Player:setAbility({
    Player.kAbility_Grab,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_GravityShift
  }, false)
  sdemo_node = findGameObject2("Node", "locator2_cam_05")
  sdemo:set(sdemo_node, sdemo_chara, kSDEMO_APPEND_AIM)
  Fn_setDelaySDemoStop(sdemo)
  sdemo:play()
  Fn_setPcPosRot(pc_pos, L3_11, Player.kReset_Floating)
  waitSeconds(0.3)
  Fn_kaiwaDemoView("ep26_00410k")
  waitSeconds(0.3)
  Fn_userCtrlOn()
  if view_hdl ~= nil then
    view_hdl:abort()
    view_hdl = nil
  end
  _sp_attack = false
  boss_gauge:setActive(false)
  if gauge_task ~= nil then
    gauge_task:abort()
    gauge_task = nil
  end
  Fn_setKeepPlayerPos()
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
end
function navi_on()
  local L0_24, L1_25
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function demonAttackWait()
  repeat
    wait()
  until Fn_sendEventComSb("attackwait") == true
  repeat
    wait()
  until Fn_sendEventComSb("attackwait") == false
end
