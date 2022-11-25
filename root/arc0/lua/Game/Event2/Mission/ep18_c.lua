dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/sdemo.lua")
_is_kalidead = false
_sdemo = nil
_sdemo2 = nil
_attackerType = nil
_kali_01_gen = nil
_kali_brain = nil
_kali_pup = nil
_warp_caption_flag = false
_col = nil
enmgen2_kali_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_01",
      name = "kali",
      ai_spawn_option = "Kali/kali_boss_ep18c"
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
function Initialize()
  _sdemo = SDemo.create("ep18_c1")
  _sdemo2 = SDemo.create("ep18_c2")
  _kali_01_gen = findGameObject2("EnemyGenerator", "enmgen2_kali_01")
end
function Ingame()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29
  L0_16 = Fn_disappearNpc
  L1_17 = "ep18_kaji"
  L2_18 = 0
  L0_16(L1_17, L2_18)
  L0_16 = Fn_setBgmPoint
  L1_17 = "battle"
  L2_18 = "bgmPoint1"
  L0_16(L1_17, L2_18)
  L0_16 = _kali_01_gen
  L1_17 = L0_16
  L0_16 = L0_16.requestIdlingEnemy
  L2_18 = true
  L0_16(L1_17, L2_18)
  L0_16 = _kali_01_gen
  L1_17 = L0_16
  L0_16 = L0_16.setEnemyMarker
  L2_18 = false
  L0_16(L1_17, L2_18)
  L0_16 = findGameObject2
  L1_17 = "EnemyBrain"
  L2_18 = "kali"
  L0_16 = L0_16(L1_17, L2_18)
  _kali_brain = L0_16
  L0_16 = _kali_brain
  L1_17 = L0_16
  L0_16 = L0_16.setVisibleBossMarker
  L2_18 = true
  L0_16(L1_17, L2_18)
  L0_16 = findGameObject2
  L1_17 = "Puppet"
  L2_18 = "kali"
  L0_16 = L0_16(L1_17, L2_18)
  _kali_pup = L0_16
  L0_16, L1_17 = nil, nil
  function L2_18()
    local L0_30, L1_31, L2_32, L3_33
    L0_30 = GameDatabase
    L1_31 = L0_30
    L0_30 = L0_30.get
    L2_32 = ggd
    L2_32 = L2_32.GlobalSystemFlags__GameRetry
    L0_30 = L0_30(L1_31, L2_32)
    if L0_30 == false then
      L0_30 = Player
      L1_31 = L0_30
      L0_30 = L0_30.muteVoice
      L2_32 = Player
      L2_32 = L2_32.kVoiceMuteLv_All
      L0_30(L1_31, L2_32)
      repeat
        L0_30 = wait
        L0_30()
        L0_30 = _kali_brain
        L1_31 = L0_30
        L0_30 = L0_30.isReadyEnemy
        L0_30 = L0_30(L1_31)
      until L0_30
      L0_30 = _kali_brain
      L1_31 = L0_30
      L0_30 = L0_30.playMotion
      L2_32 = "stay"
      L0_30(L1_31, L2_32)
      L0_30 = findGameObject2
      L1_31 = "Node"
      L2_32 = "locator2_cam_00"
      L0_30 = L0_30(L1_31, L2_32)
      L1_31 = findGameObject2
      L2_32 = "Node"
      L3_33 = "locator2_cam_01"
      L1_31 = L1_31(L2_32, L3_33)
      L2_32 = _sdemo
      L3_33 = L2_32
      L2_32 = L2_32.set
      L2_32(L3_33, L0_30, {
        target = _kali_pup,
        joint = "bn_head"
      }, true)
      L2_32 = _sdemo
      L3_33 = L2_32
      L2_32 = L2_32.setCameraParam
      L2_32(L3_33, nil, 0.1, {deg = 70})
      L2_32 = {L3_33}
      L3_33 = {}
      L3_33.pos = "locator2_cam_01"
      L3_33.time = 11
      L3_33.hashfunc = "Linear"
      L3_33 = nil
      _sdemo:play(L2_32, L3_33)
      Fn_userCtrlOff()
    else
      L0_30 = Fn_setBgmPoint
      L1_31 = "event"
      L2_32 = "retry"
      L0_30(L1_31, L2_32)
      L0_30 = Fn_spawnSuppotCrow
      L1_31 = false
      L2_32 = Supporter
      L2_32 = L2_32.FirstAction
      L2_32 = L2_32.Ground
      L3_33 = nil
      L0_30 = L0_30(L1_31, L2_32, L3_33, with_ange)
      L0_16 = L0_30
      L0_30 = L0_16
      L1_31 = L0_30
      L0_30 = L0_30.getBrain
      L0_30 = L0_30(L1_31)
      L1_17 = L0_30
      L0_30 = L1_17
      L1_31 = L0_30
      L0_30 = L0_30.setIdling
      L2_32 = true
      L0_30(L1_31, L2_32)
      L0_30 = _kali_brain
      L1_31 = L0_30
      L0_30 = L0_30.reset
      L2_32 = get_gameobj_node_world_pos_rot
      L3_33 = "locator2_kali_waypoint_01"
      L3_33 = L2_32(L3_33)
      L0_30(L1_31, L2_32, L3_33, L2_32(L3_33))
    end
    L0_30 = Fn_resetPcPos
    L1_31 = "locator2_pc_start_pos"
    L0_30(L1_31)
    L0_30 = Fn_sendEventComSb
    L1_31 = "begin_c_sdemo_01"
    L0_30(L1_31)
  end
  L3_19 = invokeTask
  function L4_20()
    _col = createGameObject2("GimmickBg")
    findGameObject2("Node", "locator2_col_01"):appendChild(_col)
    _col:setName("ep18_c_col_grigobase")
    _col:setCollisionName("ep18_c_col")
    _col:overrideCollisionFilterLayer("Boundary")
    _col:try_init()
    _col:waitForReady()
    _col:try_start()
    _col:setCollidablePermission(true)
  end
  L3_19(L4_20)
  L3_19 = Fn_findGimmickBgInBgset
  L4_20 = "grigobase_01_03"
  L3_19 = L3_19(L4_20)
  if L3_19 then
    L5_21 = L3_19
    L4_20 = L3_19.setCollidableBlockEnable
    L6_22 = false
    L4_20(L5_21, L6_22)
  end
  L4_20 = Fn_missionStart
  L5_21 = L2_18
  L4_20(L5_21)
  L4_20 = Area
  L5_21 = L4_20
  L4_20 = L4_20.gravityStorm
  L6_22 = Vector
  L7_23 = -410
  L8_24 = 219
  L9_25 = 40
  L6_22 = L6_22(L7_23, L8_24, L9_25)
  L7_23 = 100
  L4_20(L5_21, L6_22, L7_23)
  L4_20 = GameDatabase
  L5_21 = L4_20
  L4_20 = L4_20.get
  L6_22 = ggd
  L6_22 = L6_22.GlobalSystemFlags__GameRetry
  L4_20 = L4_20(L5_21, L6_22)
  if L4_20 == false then
    L4_20 = invokeTask
    function L5_21()
      _sdemo:zoomIn(3.5, {deg = 69}, "Linear")
    end
    L4_20(L5_21)
    L4_20 = invokeTask
    function L5_21()
      L0_16 = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground, nil, with_ange)
      L1_17 = L0_16:getBrain()
      L1_17:setIdling(true)
    end
    L4_20(L5_21)
    L4_20 = waitSeconds
    L5_21 = 3.5
    L4_20(L5_21)
    L4_20 = {L5_21}
    L5_21 = "locator2_kali_waypoint_00"
    L5_21 = {}
    L5_21.kali_move_mode = "walk"
    L6_22 = _kali_brain
    L7_23 = L6_22
    L6_22 = L6_22.move
    L8_24 = L4_20
    L9_25 = L5_21
    L6_22(L7_23, L8_24, L9_25)
    L6_22 = invokeTask
    function L7_23()
      _sdemo:zoomIn(0.3, {deg = 7}, "easeOut")
    end
    L6_22(L7_23)
    repeat
      L6_22 = wait
      L6_22()
      L6_22 = _kali_brain
      L7_23 = L6_22
      L6_22 = L6_22.isMoveEnd
      L6_22 = L6_22(L7_23)
    until L6_22
    L6_22 = _kali_brain
    L7_23 = L6_22
    L6_22 = L6_22.turn
    L8_24 = findGameObject2
    L9_25 = "Node"
    L10_26 = "locator2_kali_waypoint_01"
    L8_24 = L8_24(L9_25, L10_26)
    L9_25 = L8_24
    L8_24 = L8_24.getWorldPos
    L13_29 = L8_24(L9_25)
    L6_22(L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L8_24(L9_25))
    L6_22 = waitSeconds
    L7_23 = 1.5
    L6_22(L7_23)
    L6_22 = {}
    L6_22.height = 8
    L7_23 = _kali_brain
    L8_24 = L7_23
    L7_23 = L7_23.jump
    L9_25 = "locator2_kali_waypoint_01"
    L10_26 = L6_22
    L7_23(L8_24, L9_25, L10_26)
    L7_23 = invokeTask
    function L8_24()
      waitSeconds(0.5)
      _sdemo:zoomOut(2.5, {deg = 35}, "easeInOut")
    end
    L7_23(L8_24)
    L7_23 = createGameObject2
    L8_24 = "Effect"
    L7_23 = L7_23(L8_24)
    eff_hdl = L7_23
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.setModelName
    L9_25 = "ef_com_grnpar_02"
    L7_23(L8_24, L9_25)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.setName
    L9_25 = "ef_com_grnpar_02"
    L7_23(L8_24, L9_25)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.setLoop
    L9_25 = false
    L7_23(L8_24, L9_25)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.setPos
    L9_25 = Vector
    L10_26 = 0
    L11_27 = 0
    L12_28 = 1
    L13_29 = L9_25(L10_26, L11_27, L12_28)
    L7_23(L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L9_25(L10_26, L11_27, L12_28))
    L7_23 = _kali_pup
    L8_24 = L7_23
    L7_23 = L7_23.appendChild
    L9_25 = eff_hdl
    L7_23(L8_24, L9_25)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.setActive
    L9_25 = false
    L7_23(L8_24, L9_25)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.try_init
    L7_23(L8_24)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.waitForReady
    L7_23(L8_24)
    L7_23 = eff_hdl
    L8_24 = L7_23
    L7_23 = L7_23.try_start
    L7_23(L8_24)
    L7_23 = invokeTask
    function L8_24()
      wait(126)
      Camera:shake2D(0.5, 1.5, 1.5, 1000)
      eff_hdl:play()
      eff_hdl:setActive(true)
      Sound:playSE("pc_land_hard", 1, "", findGameObject2("Node", "locator2_kali_waypoint_01"))
    end
    L7_23(L8_24)
    repeat
      L7_23 = wait
      L7_23()
      L7_23 = _kali_brain
      L8_24 = L7_23
      L7_23 = L7_23.isJumpEnd
      L7_23 = L7_23(L8_24)
    until L7_23
    L7_23 = invokeTask
    function L8_24()
      _sdemo:zoomIn(0.5, {deg = 34}, "Linear")
      _sdemo:zoomIn(0.2, {deg = 12.5}, "easeOut")
    end
    L7_23(L8_24)
    L7_23 = waitSeconds
    L8_24 = 2
    L7_23(L8_24)
    L7_23 = Fn_kaiwaDemoView
    L8_24 = "ep18_00230k"
    L7_23(L8_24)
    L7_23 = _sdemo
    L8_24 = L7_23
    L7_23 = L7_23.stop
    L7_23(L8_24)
  end
  L4_20 = Player
  L5_21 = L4_20
  L4_20 = L4_20.muteVoice
  L6_22 = Player
  L6_22 = L6_22.kVoiceMuteLv_NoMute
  L4_20(L5_21, L6_22)
  L4_20 = Fn_userCtrlOn
  L4_20()
  L4_20 = findGameObject2
  L5_21 = "Node"
  L6_22 = "locator2_kali_waypoint_01"
  L4_20 = L4_20(L5_21, L6_22)
  L5_21 = L4_20
  L4_20 = L4_20.getWorldPos
  L4_20 = L4_20(L5_21)
  L5_21 = findGameObject2
  L6_22 = "Node"
  L7_23 = "locator2_kali_waypoint_01"
  L5_21 = L5_21(L6_22, L7_23)
  L6_22 = L5_21
  L5_21 = L5_21.getWorldRot
  L5_21 = L5_21(L6_22)
  L6_22 = _kali_brain
  L7_23 = L6_22
  L6_22 = L6_22.setSpawnTransform
  L8_24 = L4_20
  L9_25 = L5_21
  L6_22(L7_23, L8_24, L9_25)
  L6_22 = _kali_01_gen
  L7_23 = L6_22
  L6_22 = L6_22.requestIdlingEnemy
  L8_24 = false
  L6_22(L7_23, L8_24)
  L6_22 = _kali_brain
  L7_23 = L6_22
  L6_22 = L6_22.endScriptAction
  L6_22(L7_23)
  L6_22 = _kali_01_gen
  L7_23 = L6_22
  L6_22 = L6_22.setEnemyMarker
  L8_24 = true
  L6_22(L7_23, L8_24)
  L7_23 = L1_17
  L6_22 = L1_17.setThreatObject
  L8_24 = findGameObject2
  L9_25 = "Puppet"
  L10_26 = "kali"
  L13_29 = L8_24(L9_25, L10_26)
  L6_22(L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L8_24(L9_25, L10_26))
  L6_22 = caption
  L6_22()
  L6_22 = Fn_missionView
  L7_23 = "ep18_02000"
  L6_22(L7_23)
  L6_22 = Fn_sendEventComSb
  L7_23 = "finish_c_sdemo_01"
  L6_22(L7_23)
  L6_22 = kali_HPgauge
  L6_22()
  L6_22 = waitSeconds
  L7_23 = 1
  L6_22(L7_23)
  L7_23 = L1_17
  L6_22 = L1_17.setIdling
  L8_24 = false
  L6_22(L7_23, L8_24)
  function L6_22(A0_34)
    local L1_35, L2_36
    L1_35 = A0_34.name
    L2_36 = A0_34.attacker
    _attackerType = L2_36
    L2_36 = A0_34.damageHp
    print("enemy name " .. L1_35)
    print("attacker type " .. _attackerType)
    A0_34.ret = true
    return A0_34
  end
  L7_23 = _kali_01_gen
  L8_24 = L7_23
  L7_23 = L7_23.setEventListener
  L9_25 = "DamageEnemyReport"
  L10_26 = L6_22
  L7_23(L8_24, L9_25, L10_26)
  L7_23 = wait
  L8_24 = 90
  L7_23(L8_24)
  L7_23 = _col
  L8_24 = L7_23
  L7_23 = L7_23.setCollidablePermission
  L9_25 = false
  L7_23(L8_24, L9_25)
  repeat
    L7_23 = wait
    L7_23()
    L7_23 = _is_kalidead
  until L7_23
  L7_23 = Fn_captionViewEnd
  L7_23()
  L7_23 = findGameObject2
  L8_24 = "Node"
  L9_25 = "locator2_crow_start_pos"
  L7_23 = L7_23(L8_24, L9_25)
  L9_25 = L1_17
  L8_24 = L1_17.warpToNode
  L10_26 = L7_23
  L11_27 = Supporter
  L11_27 = L11_27.FirstAction
  L11_27 = L11_27.Ground
  L8_24(L9_25, L10_26, L11_27)
  L9_25 = L1_17
  L8_24 = L1_17.setIdling
  L10_26 = true
  L8_24(L9_25, L10_26)
  L8_24 = Fn_sendEventComSb
  L9_25 = "begin_c_sdemo_02"
  L8_24(L9_25)
  L8_24 = _kali_01_gen
  L9_25 = L8_24
  L8_24 = L8_24.setEnemyMarker
  L10_26 = false
  L8_24(L9_25, L10_26)
  L8_24 = findGameObject2
  L9_25 = "Node"
  L10_26 = "locator2_cam_22"
  L8_24 = L8_24(L9_25, L10_26)
  L9_25 = _sdemo2
  L10_26 = L9_25
  L9_25 = L9_25.set
  L11_27 = L8_24
  L12_28 = {}
  L13_29 = _kali_pup
  L12_28.target = L13_29
  L12_28.joint = "bn_head"
  L13_29 = true
  L9_25(L10_26, L11_27, L12_28, L13_29)
  L9_25 = _sdemo2
  L10_26 = L9_25
  L9_25 = L9_25.setCameraParam
  L11_27 = nil
  L12_28 = 0.1
  L13_29 = {}
  L13_29.deg = 44
  L9_25(L10_26, L11_27, L12_28, L13_29)
  L9_25 = _kali_brain
  L10_26 = L9_25
  L9_25 = L9_25.reset
  L11_27 = get_gameobj_node_world_pos_rot
  L12_28 = "locator2_kali_downpoint_01"
  L13_29 = L11_27(L12_28)
  L9_25(L10_26, L11_27, L12_28, L13_29, L11_27(L12_28))
  L9_25 = _kali_brain
  L10_26 = L9_25
  L9_25 = L9_25.playMotion
  L11_27 = "stay"
  L9_25(L10_26, L11_27)
  L9_25 = _kali_brain
  L10_26 = L9_25
  L9_25 = L9_25.setEnableTarget
  L11_27 = false
  L9_25(L10_26, L11_27)
  while true do
    L9_25 = _kali_brain
    L10_26 = L9_25
    L9_25 = L9_25.isReadyEnemy
    L9_25 = L9_25(L10_26)
    if L9_25 == false then
      L9_25 = wait
      L9_25()
    end
  end
  L9_25 = {L10_26, L11_27}
  L10_26 = {}
  L10_26.pos = "locator2_cam_22"
  L10_26.time = 0
  L10_26.hashfunc = "EaseInOut"
  L11_27 = {}
  L11_27.pos = "locator2_cam_23"
  L11_27.time = 5
  L11_27.hashfunc = "EaseInOut"
  L10_26 = nil
  L11_27 = Player
  L12_28 = L11_27
  L11_27 = L11_27.muteVoice
  L13_29 = Player
  L13_29 = L13_29.kVoiceMuteLv_All
  L11_27(L12_28, L13_29)
  L11_27 = _sdemo2
  L12_28 = L11_27
  L11_27 = L11_27.play
  L13_29 = L9_25
  L11_27(L12_28, L13_29, L10_26)
  L11_27 = invokeTask
  function L12_28()
    local L0_37, L1_38
    L0_37 = waitSeconds
    L1_38 = 3.5
    L0_37(L1_38)
    L0_37 = nil
    L1_38 = {
      {
        pos = Vector(-432.9, 182, 65.9),
        time = 3.5,
        hashfunc = "EaseInOut"
      }
    }
    _sdemo2:play(L0_37, L1_38)
  end
  L11_27(L12_28)
  L11_27 = Sound
  L12_28 = L11_27
  L11_27 = L11_27.playSE
  L13_29 = "ene_kali_vo_damage_l"
  L11_27(L12_28, L13_29)
  L11_27 = _kali_brain
  L12_28 = L11_27
  L11_27 = L11_27.playMotion
  L13_29 = "ev_dmg_large_front_start"
  L11_27(L12_28, L13_29)
  L11_27 = Fn_getPlayer
  L11_27 = L11_27()
  player_pup = L11_27
  L11_27 = player_pup
  L12_28 = L11_27
  L11_27 = L11_27.setVisible
  L13_29 = false
  L11_27(L12_28, L13_29)
  L11_27 = Player
  L12_28 = L11_27
  L11_27 = L11_27.setStay
  L13_29 = true
  L11_27(L12_28, L13_29, true)
  L11_27 = Fn_userCtrlOff
  L11_27()
  L11_27 = Fn_setCatActive
  L12_28 = false
  L13_29 = Vector
  L13_29 = L13_29(0, 0, 0)
  L11_27(L12_28, L13_29, L13_29(0, 0, 0))
  repeat
    L11_27 = wait
    L11_27()
    L11_27 = _kali_brain
    L12_28 = L11_27
    L11_27 = L11_27.isMotionEnd
    L11_27 = L11_27(L12_28)
  until L11_27
  L11_27 = _kali_brain
  L12_28 = L11_27
  L11_27 = L11_27.playMotion
  L13_29 = "ev_dmg_large_front_end"
  L11_27(L12_28, L13_29)
  L11_27 = invokeTask
  function L12_28()
    repeat
      wait()
    until _kali_brain:isMotionEnd()
    _kali_brain:playMotion("ev_dmg_down_back")
    repeat
      wait()
    until _kali_brain:isMotionEnd()
    _kali_brain:playMotion("ev_dmg_down_back")
    repeat
      wait()
    until _kali_brain:isMotionEnd()
    Sound:playSE("ene_kali_vo_damage_s")
    _kali_brain:playMotion("ev_dmg_large_front_standup")
    repeat
      wait()
    until _kali_brain:isMotionEnd()
    _kali_brain:playMotion("stay")
  end
  L11_27(L12_28)
  L11_27 = Player
  L12_28 = L11_27
  L11_27 = L11_27.setAttrTune
  L13_29 = Player
  L13_29 = L13_29.kAttrTune_Normal
  L11_27(L12_28, L13_29, true)
  L11_27 = Fn_coercionPoseNomal
  L11_27()
  L11_27 = findGameObject2
  L12_28 = "Node"
  L13_29 = "locator2_pc_fall_pos"
  L11_27 = L11_27(L12_28, L13_29)
  L12_28 = L11_27
  L11_27 = L11_27.getWorldPos
  L11_27 = L11_27(L12_28)
  L12_28 = findGameObject2
  L13_29 = "Node"
  L12_28 = L12_28(L13_29, "locator2_pc_fall_pos")
  L13_29 = L12_28
  L12_28 = L12_28.getWorldRot
  L12_28 = L12_28(L13_29)
  L13_29 = L11_27.y
  L13_29 = L13_29 - 0.2
  L11_27.y = L13_29
  L13_29 = Fn_setPcPosRot
  L13_29(L11_27, L12_28, Player.kReset_Falling)
  L13_29 = player_pup
  L13_29 = L13_29.setVisible
  L13_29(L13_29, true)
  L13_29 = nil
  repeat
    wait()
    L13_29 = Player:getAction()
  until L13_29 == Player.kAction_Idle
  waitSeconds(4)
  Fn_setCatActive(true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function kali_HPgauge()
  invokeTask(function()
    HUD:createBossHpGauge({
      obj = _kali_pup
    }):setActive(true)
    print("boss_gauge:setActive(true)")
    print("Kali Health Is", _kali_brain:getHealth())
    while not (_kali_brain:getHealth() < 0.5 * _kali_brain:getMaxHealth()) or _attackerType ~= "player" do
      HUD:createBossHpGauge({
        obj = _kali_pup
      }):setHp((_kali_brain:getHealth() + _kali_brain:getMaxHealth() * 2 / 10) / (_kali_brain:getMaxHealth() + _kali_brain:getMaxHealth() * 2 / 10))
      wait()
    end
    HUD:createBossHpGauge({
      obj = _kali_pup
    }):setActive(false)
    print("boss_gauge:setActive(false)")
    _is_kalidead = true
  end)
end
function caption()
  invokeTask(function()
    local L0_39, L1_40
    L0_39 = 0
    L1_40 = 0
    while not _is_kalidead do
      if L1_40 == 5 and L0_39 == 0 then
        Fn_captionViewWait("ep18_02001", 5)
        if not _is_kalidead then
          Sound:playSE("ene_kali_vo_anger_1")
          Fn_captionViewWait("ep18_02002", 5)
          L0_39 = 1
          elseif L1_40 == 10 and L0_39 == 1 then
            Fn_captionViewWait("ep18_02003", 5)
            if not _is_kalidead then
              Fn_captionViewWait("ep18_02004", 5)
              L0_39 = 2
              waitSeconds(1)
              L1_40 = L1_40 + 1
            end
          end
        end
    end
  end)
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_41
  L1_41 = _warp_caption_flag
  if L1_41 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep18_02005")
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
  Area:gravityStorm()
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
    Player:setStay(false)
  end
  if Fn_findGimmickBgInBgset("grigobase_01_03") then
    Fn_findGimmickBgInBgset("grigobase_01_03"):setCollidableBlockEnable(true)
  end
end
