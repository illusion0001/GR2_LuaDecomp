dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Misc/sdemo.lua")
_lastkali_brain = nil
_is_fatalend = false
_boss_gauge = nil
_crow_pup = nil
_crow_brain = nil
_unica_brain = nil
_permet_brain = nil
_coreHP1 = 100
_coreHP2 = 500
_isBeginShoutMode = false
_isShouting = false
_isDead_lastkali = false
_isDead_addFace = false
_isFindHeart = false
_isReadyFatal = false
_caption_end_090 = false
_addFace = false
_warp_caption_flag = false
_sdemo = nil
_sdemo_r = nil
_sdemo_l = nil
_isStartDecoy = false
_isFinalMode = false
_is_grab_start_r = false
_is_grab_success_r = false
_is_grab_failed_r = false
_is_throw_start_r = false
_is_throw_release_r = false
_is_damage_release_r = false
_is_destroy_r = false
_is_cutoff_r = false
_grab_pos_r = nil
_grabed_name_r = nil
_hand_target_object_r = nil
_hand_target_name_r = nil
_hand_attacker_r = nil
_grabed_sdemo_r = nil
_is_grab_start_l = false
_is_grab_success_l = false
_is_grab_failed_l = false
_is_throw_start_l = false
_is_throw_release_l = false
_is_damage_release_l = false
_is_destroy_l = false
_is_cutoff_l = false
_grab_pos_l = nil
_grabed_name_l = nil
_hand_target_object_l = nil
_hand_target_name_l = nil
_hand_attacker_l = nil
_grabed_sdemo_l = nil
enmgen2_unica_permet = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "unica_ep20",
      locator = "locator_unica",
      name = "unica",
      ai_spawn_option = "Unica/unica_ep20_d"
    },
    {
      type = "permet_ep20",
      locator = "locator_permet",
      name = "permet",
      ai_spawn_option = "Permet/permet_ep20_d"
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
enmgen2_ep20_d_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lastkali",
      locator = "locator_01_01",
      name = "lastkali",
      ai_spawn_option = "LastKali/lastkali_boss"
    },
    {
      type = "lastkaliarm_l_a",
      locator = "locator_01_01",
      name = "lastkaliarm_01"
    },
    {
      type = "lastkaliarm_l_b",
      locator = "locator_01_01",
      name = "lastkaliarm_02"
    },
    {
      type = "lastkaliarm_l_c",
      locator = "locator_01_01",
      name = "lastkaliarm_03"
    },
    {
      type = "lastkaliarm_l_d",
      locator = "locator_01_01",
      name = "lastkaliarm_04"
    },
    {
      type = "lastkaliarm_l_e",
      locator = "locator_01_01",
      name = "lastkaliarm_05"
    },
    {
      type = "lastkaliarm_l_f",
      locator = "locator_01_01",
      name = "lastkaliarm_06"
    },
    {
      type = "lastkaliarm_r_a",
      locator = "locator_01_01",
      name = "lastkaliarm_07"
    },
    {
      type = "lastkaliarm_r_b",
      locator = "locator_01_01",
      name = "lastkaliarm_08"
    },
    {
      type = "lastkaliarm_f_l_a",
      locator = "locator_01_01",
      name = "lastkaliarm_11"
    },
    {
      type = "lastkaliarm_f_r_a",
      locator = "locator_01_01",
      name = "lastkaliarm_12"
    },
    {
      type = "lastkaliarm_f_r_b",
      locator = "locator_01_01",
      name = "lastkaliarm_13"
    },
    {
      type = "lastkalihead_b",
      locator = "locator_01_01",
      name = "lastkalihead_01"
    },
    {
      type = "lastkalihead_c",
      locator = "locator_01_01",
      name = "lastkalihead_02"
    },
    {
      type = "lastkalihead_g",
      locator = "locator_01_01",
      name = "lastkalihead_03"
    },
    {
      type = "lastkalihead_h",
      locator = "locator_01_01",
      name = "lastkalihead_04"
    },
    {
      type = "lastkalihead_j",
      locator = "locator_01_01",
      name = "lastkalihead_05"
    }
  },
  onSpawn = function(A0_16, A1_17)
  end,
  onUpdate = function(A0_18)
    local L1_19
  end,
  onEnter = function(A0_20)
    local L1_21
  end,
  onLeave = function(A0_22)
    local L1_23
  end,
  onObjectDead = function(A0_24, A1_25)
  end,
  onObjectAsh = function(A0_26, A1_27)
    local L3_28
    L3_28 = enmgen2_ep20_d_01
    L3_28.enemyDeadNum = enmgen2_ep20_d_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_29, L1_30
    L0_29 = enmgen2_ep20_d_01
    L0_29 = L0_29.spawnSet
    L0_29 = #L0_29
    return L0_29
  end,
  getEnemyDeadNum = function()
    local L1_31
    L1_31 = enmgen2_ep20_d_01
    L1_31 = L1_31.enemyDeadNum
    return L1_31
  end,
  getEnemyName = function(A0_32)
    local L1_33
    L1_33 = enmgen2_ep20_d_01
    L1_33 = L1_33.spawnSet
    L1_33 = L1_33[A0_32]
    L1_33 = L1_33.name
    return L1_33
  end
}
function Initialize()
  local L0_34, L1_35
  L0_34 = Fn_userCtrlAllOff
  L0_34()
  L0_34 = SDemo
  L0_34 = L0_34.create
  L1_35 = "ep20_d_01"
  L0_34 = L0_34(L1_35)
  _sdemo = L0_34
  L0_34 = SDemo
  L0_34 = L0_34.create
  L1_35 = "ep20_d_r"
  L0_34 = L0_34(L1_35)
  _sdemo_r = L0_34
  L0_34 = SDemo
  L0_34 = L0_34.create
  L1_35 = "ep20_d_l"
  L0_34 = L0_34(L1_35)
  _sdemo_l = L0_34
  L0_34 = Vector
  L1_35 = 62.6
  L0_34 = L0_34(L1_35, 331.9, 449.3)
  L1_35 = Vector
  L1_35 = L1_35(64.4, 331.6, 447.4)
  _sdemo:set(L0_34, L1_35)
  _sdemo:setCameraParam(nil, 0.1, {deg = 42})
end
function Ingame()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46
  L0_36 = Fn_findAreaHandle
  L1_37 = "dt_a_root"
  L0_36 = L0_36(L1_37)
  if L0_36 then
    L1_37 = L0_36.setSceneParameters
    L1_37(L2_38, L3_39)
    L1_37 = print
    L1_37(L2_38)
  end
  L1_37 = {}
  L1_37 = L2_38
  for L5_41, L6_42 in L2_38(L3_39) do
    L7_43 = L1_37[L5_41]
    L8_44 = L7_43
    L7_43 = L7_43.setVisiblePermission
    L9_45 = false
    L7_43(L8_44, L9_45)
    L7_43 = L1_37[L5_41]
    L8_44 = L7_43
    L7_43 = L7_43.setCollidablePermission
    L9_45 = false
    L7_43(L8_44, L9_45)
  end
  L5_41 = false
  L3_39(L4_40, L5_41)
  L5_41 = false
  L3_39(L4_40, L5_41)
  L5_41 = L3_39
  L6_42 = false
  L4_40(L5_41, L6_42)
  L5_41 = L3_39
  L6_42 = false
  L4_40(L5_41, L6_42)
  _crow_pup = L4_40
  L5_41 = L4_40
  _crow_brain = L4_40
  L5_41 = L4_40
  L6_42 = true
  L4_40(L5_41, L6_42)
  L5_41 = L4_40
  L6_42 = true
  L7_43 = findGameObject2
  L8_44 = "Node"
  L9_45 = "locator2_EnergyGemRoot"
  L7_43 = L7_43(L8_44, L9_45)
  L8_44 = 10
  L4_40(L5_41, L6_42, L7_43, L8_44)
  L5_41 = "battle"
  L6_42 = "bgmPoint4"
  L4_40(L5_41, L6_42)
  L5_41 = "EnemyGenerator"
  L6_42 = "enmgen2_unica_permet"
  L6_42 = L4_40
  L5_41 = L4_40.setEnemyMarker
  L7_43 = false
  L5_41(L6_42, L7_43)
  L5_41 = findGameObject2
  L6_42 = "EnemyBrain"
  L7_43 = "unica"
  L5_41 = L5_41(L6_42, L7_43)
  _unica_brain = L5_41
  L5_41 = _unica_brain
  L6_42 = L5_41
  L5_41 = L5_41.setEnableHomingTarget
  L7_43 = false
  L5_41(L6_42, L7_43)
  L5_41 = findGameObject2
  L6_42 = "EnemyBrain"
  L7_43 = "permet"
  L5_41 = L5_41(L6_42, L7_43)
  _permet_brain = L5_41
  L5_41 = _permet_brain
  L6_42 = L5_41
  L5_41 = L5_41.setEnableHomingTarget
  L7_43 = false
  L5_41(L6_42, L7_43)
  L5_41 = findGameObject2
  L6_42 = "EnemyBrain"
  L7_43 = "lastkali"
  L5_41 = L5_41(L6_42, L7_43)
  _lastkali_brain = L5_41
  L5_41 = _lastkali_brain
  L6_42 = L5_41
  L5_41 = L5_41.setVisibleEnemyMarker
  L7_43 = false
  L5_41(L6_42, L7_43)
  L5_41 = wait
  L5_41()
  L5_41 = Player
  L6_42 = L5_41
  L5_41 = L5_41.setAction
  L7_43 = Player
  L7_43 = L7_43.kAction_Float
  L5_41(L6_42, L7_43)
  while true do
    L5_41 = Area
    L6_42 = L5_41
    L5_41 = L5_41.isSkyStable
    L5_41 = L5_41(L6_42)
    if not L5_41 then
      L5_41 = wait
      L5_41()
    end
  end
  L5_41 = Camera
  L6_42 = L5_41
  L5_41 = L5_41.lookTo
  L7_43 = findGameObject2
  L8_44 = "Puppet"
  L9_45 = "lastkali"
  L7_43 = L7_43(L8_44, L9_45)
  L8_44 = L7_43
  L7_43 = L7_43.getWorldPos
  L7_43 = L7_43(L8_44)
  L8_44 = 0
  L9_45 = 0.7
  L5_41(L6_42, L7_43, L8_44, L9_45)
  L5_41 = Fn_missionStart
  L5_41()
  L5_41 = gravityGemCreate
  L5_41()
  L5_41 = Fn_kaiwaDemoView
  L6_42 = "ep20_00410k"
  L5_41(L6_42)
  L5_41 = Fn_userCtrlOn
  L5_41()
  L5_41 = _crow_brain
  L6_42 = L5_41
  L5_41 = L5_41.setIdling
  L7_43 = false
  L5_41(L6_42, L7_43)
  L5_41 = HPgauge
  L5_41()
  L5_41 = Fn_missionViewWait
  L6_42 = "ep20_03000"
  L5_41(L6_42)
  L5_41 = captionMaster
  L5_41()
  repeat
    L5_41 = wait
    L5_41()
    L5_41 = _isDead_addFace
  until L5_41
  repeat
    L5_41 = wait
    L5_41()
    L5_41 = _caption_end_090
  until L5_41
  L5_41 = Player
  L6_42 = L5_41
  L5_41 = L5_41.muteVoice
  L7_43 = Player
  L7_43 = L7_43.kVoiceMuteLv_All
  L5_41(L6_42, L7_43)
  L5_41 = Player
  L6_42 = L5_41
  L5_41 = L5_41.setNoDamageMode
  L7_43 = Player
  L7_43 = L7_43.kNoDamage_All
  L8_44 = true
  L5_41(L6_42, L7_43, L8_44)
  L5_41 = _lastkali_brain
  L6_42 = L5_41
  L5_41 = L5_41.eventMessage
  L7_43 = "requestHeartAppear"
  L5_41 = L5_41(L6_42, L7_43)
  L6_42 = print
  L7_43 = _lastkali_brain
  L6_42(L7_43)
  L6_42 = print
  L7_43 = "requestHeartAppear"
  L8_44 = L5_41
  L6_42(L7_43, L8_44)
  L6_42 = findGameObject2
  L7_43 = "EnemyGenerator"
  L8_44 = "enmgen2_ep20_d_01"
  L6_42 = L6_42(L7_43, L8_44)
  L8_44 = L6_42
  L7_43 = L6_42.setEnemyMarker
  L9_45 = false
  L7_43(L8_44, L9_45)
  L7_43 = invokeTask
  function L8_44()
    _sdemo:zoomIn(4, {deg = 38}, "Linear")
  end
  L7_43(L8_44)
  L7_43 = Vector
  L8_44 = 99.2
  L9_45 = 321.8
  L10_46 = 408.5
  L7_43 = L7_43(L8_44, L9_45, L10_46)
  L8_44 = {L9_45}
  L9_45 = {}
  L9_45.pos = L7_43
  L9_45.time = 20
  L9_45.hashfunc = "Linear"
  L9_45 = _sdemo
  L10_46 = L9_45
  L9_45 = L9_45.play
  L9_45(L10_46, nil, L8_44)
  L9_45 = Fn_resetPcPos
  L10_46 = "locator2_pc_start_pos"
  L9_45(L10_46, Player.kReset_Floating)
  L9_45 = Fn_setCatActive
  L10_46 = false
  L9_45(L10_46, Vector(0, 0, 0))
  L9_45 = Fn_userCtrlAllOff
  L9_45()
  L9_45 = wait
  L10_46 = 60
  L9_45(L10_46)
  _isFindHeart = true
  L9_45 = wait
  L10_46 = 60
  L9_45(L10_46)
  L9_45 = Camera
  L10_46 = L9_45
  L9_45 = L9_45.lookTo
  L9_45(L10_46, findGameObject2("Puppet", "lastkali"):getWorldPos(), 1, 1)
  L9_45 = _sdemo
  L10_46 = L9_45
  L9_45 = L9_45.stop
  L9_45(L10_46)
  L9_45 = Fn_userCtrlOn
  L9_45()
  L10_46 = L6_42
  L9_45 = L6_42.setEnemyMarker
  L9_45(L10_46, true)
  L9_45 = Player
  L10_46 = L9_45
  L9_45 = L9_45.setNoDamageMode
  L9_45(L10_46, Player.kNoDamage_All, false)
  L9_45 = Fn_setCatActive
  L10_46 = true
  L9_45(L10_46)
  L9_45 = Player
  L10_46 = L9_45
  L9_45 = L9_45.muteVoice
  L9_45(L10_46, Player.kVoiceMuteLv_NoMute)
  repeat
    L9_45 = wait
    L9_45()
    L9_45 = _isReadyFatal
  until L9_45
  L9_45 = _crow_brain
  L10_46 = L9_45
  L9_45 = L9_45.setAbility
  L9_45(L10_46, Supporter.Ability.Warp, false)
  L9_45 = FatalMarker
  L9_45 = L9_45.create
  L10_46 = kFATAL_TYPE_EMP
  L9_45 = L9_45(L10_46, _crow_pup, true)
  L10_46 = findGameObject2
  L10_46 = L10_46("Puppet", "lastkali")
  L9_45:set(L10_46, "bn_crystal_core2", nil, 30)
  L9_45:run()
  HUD:enemymarkerSetRangeMin(30)
  print("\227\130\175\227\131\173\227\130\166\227\131\175\227\131\188\227\131\151\228\189\191\231\148\168\232\168\173\229\174\154", _crow_brain:getAbility(Supporter.Ability.Warp))
  repeat
    wait()
  until L9_45:isFatalFinish()
  L9_45:kill()
  L9_45 = nil
  _is_fatalend = true
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
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function gravityGemCreate()
  invokeTask(function()
    local L0_47, L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59
    L0_47 = 0
    L1_48 = math
    L1_48 = L1_48.random
    L2_49 = 1
    L3_50 = 16
    L1_48 = L1_48(L2_49, L3_50)
    L2_49 = nil
    L3_50 = {}
    while L0_47 <= 45 do
      L4_51 = Player
      L5_52 = L4_51
      L4_51 = L4_51.getEnergy
      L6_53 = Player
      L6_53 = L6_53.kEnergy_Gravity
      L4_51 = L4_51(L5_52, L6_53)
      L5_52 = Player
      L6_53 = L5_52
      L5_52 = L5_52.getEnergyMax
      L7_54 = Player
      L7_54 = L7_54.kEnergy_Gravity
      L5_52 = L5_52(L6_53, L7_54)
      L5_52 = L5_52 * 1
      if L4_51 <= L5_52 then
        L4_51 = createGameObject2
        L5_52 = "Gem"
        L4_51 = L4_51(L5_52)
        L6_53 = L4_51
        L5_52 = L4_51.setGemModelNo
        L7_54 = 4
        L5_52(L6_53, L7_54)
        L5_52 = findGameObject2
        L6_53 = "Node"
        L7_54 = "locator2_EnergyGemRoot"
        L5_52 = L5_52(L6_53, L7_54)
        L6_53 = L5_52
        L5_52 = L5_52.getWorldPos
        L5_52 = L5_52(L6_53)
        L6_53 = math
        L6_53 = L6_53.random
        L7_54 = -5
        L8_55 = 5
        L6_53 = L6_53(L7_54, L8_55)
        L7_54 = math
        L7_54 = L7_54.random
        L8_55 = -50
        L9_56 = 25
        L7_54 = L7_54(L8_55, L9_56)
        L8_55 = math
        L8_55 = L8_55.random
        L9_56 = -5
        L10_57 = 5
        L8_55 = L8_55(L9_56, L10_57)
        if L1_48 == 1 then
          L9_56 = Vector
          L10_57 = 18 + L6_53
          L11_58 = 3 + L7_54
          L12_59 = 0 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 2 then
          L9_56 = Vector
          L10_57 = -18 + L6_53
          L11_58 = 4 + L7_54
          L12_59 = 0 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 3 then
          L9_56 = Vector
          L10_57 = 0 + L6_53
          L11_58 = -3 + L7_54
          L12_59 = 18 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 4 then
          L9_56 = Vector
          L10_57 = 0 + L6_53
          L11_58 = -4 + L7_54
          L12_59 = -18 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 5 then
          L9_56 = Vector
          L10_57 = 15 + L6_53
          L11_58 = 1 + L7_54
          L12_59 = 15 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 6 then
          L9_56 = Vector
          L10_57 = -15 + L6_53
          L11_58 = -1 + L7_54
          L12_59 = -15 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 7 then
          L9_56 = Vector
          L10_57 = -15 + L6_53
          L11_58 = 2 + L7_54
          L12_59 = 15 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 8 then
          L9_56 = Vector
          L10_57 = 15 + L6_53
          L11_58 = -2 + L7_54
          L12_59 = -15 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 9 then
          L9_56 = Vector
          L10_57 = 17 + L6_53
          L11_58 = 3 + L7_54
          L12_59 = 5 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 10 then
          L9_56 = Vector
          L10_57 = -17 + L6_53
          L11_58 = 4 + L7_54
          L12_59 = -5 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 11 then
          L9_56 = Vector
          L10_57 = 5 + L6_53
          L11_58 = -3 + L7_54
          L12_59 = 17 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 12 then
          L9_56 = Vector
          L10_57 = -5 + L6_53
          L11_58 = -4 + L7_54
          L12_59 = -17 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 13 then
          L9_56 = Vector
          L10_57 = 17 + L6_53
          L11_58 = 3 + L7_54
          L12_59 = -5 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 14 then
          L9_56 = Vector
          L10_57 = -17 + L6_53
          L11_58 = 4 + L7_54
          L12_59 = 5 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 15 then
          L9_56 = Vector
          L10_57 = -5 + L6_53
          L11_58 = -3 + L7_54
          L12_59 = 17 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        elseif L1_48 == 16 then
          L9_56 = Vector
          L10_57 = 5 + L6_53
          L11_58 = -4 + L7_54
          L12_59 = -17 + L8_55
          L9_56 = L9_56(L10_57, L11_58, L12_59)
          L2_49 = L5_52 + L9_56
        end
        L9_56 = Fn_getPcPosRot
        L10_57 = L9_56()
        L11_58 = Query
        L12_59 = L11_58
        L11_58 = L11_58.setEyeSightTransform
        L11_58(L12_59, L9_56, L10_57)
        L11_58 = Query
        L12_59 = L11_58
        L11_58 = L11_58.setEyeSightAngle
        L11_58(L12_59, Deg2Rad(45))
        L11_58 = Query
        L12_59 = L11_58
        L11_58 = L11_58.setEyeSightRange
        L11_58(L12_59, range)
        L11_58 = Query
        L12_59 = L11_58
        L11_58 = L11_58.raycastEyeSight
        L11_58 = L11_58(L12_59, L2_49)
        if not L11_58 then
          L12_59 = L4_51.setWorldPos
          L12_59(L4_51, L2_49)
          L12_59 = L4_51.setForceMove
          L12_59(L4_51)
          L12_59 = L4_51.setVisible
          L12_59(L4_51, true)
          L12_59 = L4_51.try_init
          L12_59(L4_51)
          L12_59 = L4_51.setVisibleBlockHalfSize
          L12_59(L4_51, 150)
          L12_59 = L4_51.waitForReadyAsync
          L12_59(L4_51, function()
            L4_51:try_start()
          end)
          L12_59 = print
          L12_59("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_48)
          L0_47 = L0_47 + 1
          if L0_47 > 8 then
            L12_59 = waitSeconds
            L12_59(15)
          end
          L12_59 = table
          L12_59 = L12_59.insert
          L12_59(L3_50, L4_51)
          while true do
            L12_59 = 0
            for _FORV_16_, _FORV_17_ in pairs(L3_50) do
              if L3_50[_FORV_16_]:isRunning() then
                L12_59 = L12_59 + 1
              end
            end
            if L12_59 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L12_59)
              break
            end
            wait(15)
          end
          L1_48 = L1_48 + 1
          if L1_48 >= 17 then
            L1_48 = 1
          end
        end
      else
      end
      L4_51 = wait
      L4_51()
    end
  end)
end
function captionMaster()
  invokeTask(function()
    local L0_60, L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L11_71, L12_72, L13_73, L14_74, L15_75, L16_76, L17_77, L18_78
    L0_60 = false
    L1_61 = false
    L2_62 = false
    L3_63 = false
    L4_64 = false
    L5_65 = false
    L6_66 = false
    L7_67 = false
    L8_68 = false
    L9_69 = false
    L10_70 = 0
    L11_71 = 0
    L12_72 = nil
    function L13_73(A0_79)
      if A0_79.name == "lastkaliarm_01" then
        print("left arm")
        if A0_79.armEvent == "grab_start" then
          print("grab start " .. string.format("x: %f, y: %f, z: %f", A0_79.grabPosition.x, A0_79.grabPosition.y, A0_79.grabPosition.z))
          _is_grab_start_l = true
          _grab_pos_l = Vector(A0_79.grabPosition.x, A0_79.grabPosition.y, A0_79.grabPosition.z)
        elseif A0_79.armEvent == "grab_success" then
          print("grab success")
          _is_grab_success_l = true
          if A0_79.grabBrain ~= nil then
            print("grabBrain: " .. string.format("%s", A0_79.grabBrain:getTypeName()))
            _grabed_name_l = A0_79.grabBrain:getTypeName()
            _grabed_sdemo_l = A0_79.grabBrain:getTypeName()
          end
          if A0_79.grabHandGizmo ~= nil then
            print("grabHandGizmo", A0_79.grabHandGizmo)
            _hand_target_object_l = A0_79.grabHandGizmo
          end
          if A0_79.grabHandName ~= nil then
            print("grabHandName", A0_79.grabHandName)
          end
          _hand_target_name_l = A0_79.grabHandName
        elseif A0_79.armEvent == "grab_failed" then
          print("grab failed")
          _is_grab_failed_l = true
        elseif A0_79.armEvent == "throw_start" then
          print("throw start")
          _is_throw_start_l = true
        elseif A0_79.armEvent == "throw_release" then
          print("throw release")
          _is_throw_release_l = true
          if _grabed_sdemo_l == "PlayerBrain" then
            _grabed_sdemo_l = nil
          end
        elseif A0_79.armEvent == "damage_release" then
          print("damage release")
          _is_damage_release_l = true
          if A0_79.attacker ~= nil then
            if A0_79.attacker:getName() ~= nil then
              print("attacker: " .. string.format("%s", A0_79.attacker:getName()))
              _hand_attacker_l = A0_79.attacker:getName()
            else
              print("attacker: " .. string.format("%s", A0_79.attacker:getTypeName()))
              _hand_attacker_l = A0_79.attacker:getTypeName()
            end
          end
          if _grabed_sdemo_l == "PlayerBrain" then
            _grabed_sdemo_l = nil
          end
        elseif A0_79.armEvent == "arm_destroy" then
          print("arm destroy")
          _is_destroy_l = true
          if A0_79.attacker ~= nil then
            if A0_79.attacker:getName() ~= nil then
              print("attacker: " .. string.format("%s", A0_79.attacker:getName()))
              _hand_attacker_l = A0_79.attacker:getName()
            else
              print("attacker: " .. string.format("%s", A0_79.attacker:getTypeName()))
              _hand_attacker_l = A0_79.attacker:getTypeName()
            end
          end
          if _grabed_sdemo_l == "PlayerBrain" then
            _grabed_sdemo_l = nil
          end
        elseif A0_79.armEvent == "arm_cutoff" then
          print("arm cutoff")
          _is_cutoff_l = true
        end
      elseif A0_79.name == "lastkaliarm_07" then
        print("right arm")
        if A0_79.armEvent == "grab_start" then
          print("grab start " .. string.format("x: %f, y: %f, z: %f", A0_79.grabPosition.x, A0_79.grabPosition.y, A0_79.grabPosition.z))
          _is_grab_start_r = true
          _grab_pos_r = Vector(A0_79.grabPosition.x, A0_79.grabPosition.y, A0_79.grabPosition.z)
        elseif A0_79.armEvent == "grab_success" then
          print("grab success")
          _is_grab_success_r = true
          if A0_79.grabBrain ~= nil then
            print("grabBrain: " .. string.format("%s", A0_79.grabBrain:getTypeName()))
            _grabed_name_r = A0_79.grabBrain:getTypeName()
            _grabed_sdemo_r = A0_79.grabBrain:getTypeName()
          end
          if A0_79.grabHandGizmo ~= nil then
            print("grabHandGizmo", A0_79.grabHandGizmo)
            _hand_target_object_r = A0_79.grabHandGizmo
          end
          if A0_79.grabHandName ~= nil then
            print("grabHandName", A0_79.grabHandName)
          end
          _hand_target_name_r = A0_79.grabHandName
        elseif A0_79.armEvent == "grab_failed" then
          print("grab failed")
          _is_grab_failed_r = true
        elseif A0_79.armEvent == "throw_start" then
          print("throw start")
          _is_throw_start_r = true
        elseif A0_79.armEvent == "throw_release" then
          print("throw release")
          _is_throw_release_r = true
          if _grabed_sdemo_r == "PlayerBrain" then
            _grabed_sdemo_r = nil
          end
        elseif A0_79.armEvent == "damage_release" then
          print("damage release")
          _is_damage_release_r = true
          if A0_79.attacker ~= nil then
            if A0_79.attacker:getName() ~= nil then
              print("attacker: " .. string.format("%s", A0_79.attacker:getName()))
              _hand_attacker_r = A0_79.attacker:getName()
            else
              print("attacker: " .. string.format("%s", A0_79.attacker:getTypeName()))
              _hand_attacker_r = A0_79.attacker:getTypeName()
            end
          end
          if _grabed_sdemo_r == "PlayerBrain" then
            _grabed_sdemo_r = nil
          end
        elseif A0_79.armEvent == "arm_destroy" then
          print("arm destroy")
          _is_destroy_r = true
          if A0_79.attacker ~= nil then
            if A0_79.attacker:getName() ~= nil then
              print("attacker: " .. string.format("%s", A0_79.attacker:getName()))
              _hand_attacker_r = A0_79.attacker:getName()
            else
              print("attacker: " .. string.format("%s", A0_79.attacker:getTypeName()))
              _hand_attacker_r = A0_79.attacker:getTypeName()
            end
          end
          if _grabed_sdemo_r == "PlayerBrain" then
            _grabed_sdemo_r = nil
          end
        elseif A0_79.armEvent == "arm_cutoff" then
          print("arm cutoff")
          _is_cutoff_r = true
        end
      end
    end
    L14_74 = findGameObject2
    L15_75 = "EnemyBrain"
    L16_76 = "lastkaliarm_01"
    L14_74 = L14_74(L15_75, L16_76)
    repeat
      L15_75 = wait
      L15_75()
      L16_76 = L14_74
      L15_75 = L14_74.isReadyEnemy
      L15_75 = L15_75(L16_76)
    until L15_75
    L16_76 = L14_74
    L15_75 = L14_74.setEventListener
    L17_77 = "enemy_lastkaliarm_event"
    L18_78 = L13_73
    L15_75(L16_76, L17_77, L18_78)
    L15_75 = findGameObject2
    L16_76 = "EnemyBrain"
    L17_77 = "lastkaliarm_07"
    L15_75 = L15_75(L16_76, L17_77)
    repeat
      L16_76 = wait
      L16_76()
      L17_77 = L15_75
      L16_76 = L15_75.isReadyEnemy
      L16_76 = L16_76(L17_77)
    until L16_76
    L17_77 = L15_75
    L16_76 = L15_75.setEventListener
    L18_78 = "enemy_lastkaliarm_event"
    L16_76(L17_77, L18_78, L13_73)
    function L16_76(A0_80)
      local L1_81
      L1_81 = A0_80.name
      L12_72 = A0_80.attacker
      A0_80.ret = true
      return A0_80
    end
    L17_77 = findGameObject2
    L18_78 = "EnemyGenerator"
    L17_77 = L17_77(L18_78, "enmgen2_ep20_d_01")
    L18_78 = L17_77.setEventListener
    L18_78(L17_77, "DamageEnemyReport", L16_76)
    L18_78 = invokeTask
    L18_78(function()
      local L0_82
      L0_82 = false
      while true do
        if _grabed_sdemo_r == "PlayerBrain" and L0_82 == false then
          print("\230\142\180\227\129\190\227\130\140\227\130\171\227\131\161\227\131\169\233\150\139\229\167\139\239\188\154\229\143\179")
          _sdemo_r:set({
            target = findGameObject2("Puppet", "lastkaliarm_07"),
            joint = "loc_cam_grasp"
          }, {
            target = findGameObject2("Puppet", "lastkaliarm_07"),
            joint = "loc_cam_aimpoint"
          }, true)
          _sdemo_r:setCameraParam(nil, 0.1, {deg = 40})
          invokeTask(function()
            _sdemo_r:zoomIn(3.5, {deg = 22})
          end)
          _sdemo_r:play()
          L0_82 = true
        elseif _grabed_sdemo_l == "PlayerBrain" and L0_82 == false then
          print("\230\142\180\227\129\190\227\130\140\227\130\171\227\131\161\227\131\169\233\150\139\229\167\139\239\188\154\229\183\166")
          _sdemo_l:set({
            target = findGameObject2("Puppet", "lastkaliarm_01"),
            joint = "loc_cam_grasp"
          }, {
            target = findGameObject2("Puppet", "lastkaliarm_01"),
            joint = "loc_cam_aimpoint"
          }, true)
          _sdemo_l:setCameraParam(nil, 0.1, {deg = 40})
          _sdemo_l:play()
          L0_82 = true
        elseif _grabed_sdemo_r ~= "PlayerBrain" and _grabed_sdemo_l ~= "PlayerBrain" and L0_82 == true then
          print("\230\142\180\227\129\190\227\130\140\227\130\171\227\131\161\227\131\169\231\181\130\228\186\134")
          _sdemo_r:stop()
          _sdemo_l:stop()
          L0_82 = false
          Player:setGravityControlMode(true)
        end
        wait()
      end
    end)
    while true do
      if L0_60 == false then
        L18_78 = _lastkali_brain
        L18_78 = L18_78.getHealth
        L18_78 = L18_78(L18_78)
        if L10_70 > L18_78 and L12_72 == "player" then
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03001")
          L18_78 = math
          L18_78 = L18_78.random
          L18_78 = L18_78(1, 2)
          if captionSkipFunc() then
            if L18_78 == 1 then
              Sound:playSE("cro013a")
              Fn_captionViewWait("ep20_03002")
            else
              Fn_captionViewWait("ep20_03003")
            end
          end
          L0_60 = true
        end
      elseif L9_69 == false then
        L18_78 = _isBeginShoutMode
        if L18_78 then
          L18_78 = print
          L18_78("\228\184\128\230\150\137\229\143\171\227\129\179\233\128\163\231\153\186\227\131\162\227\131\188\227\131\137\233\150\139\229\167\139")
          L18_78 = _lastkali_brain
          L18_78 = L18_78.eventMessage
          L18_78(L18_78, "setKeepAllShoutMode", true)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_02015")
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "per_011")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_02016")
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "ene_yunica_vo_call_bit")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_02017")
          L9_69 = true
          L18_78 = grabCaptionFlagSet
          L18_78()
          L18_78 = noGrabCaptionFlagSet
          L18_78()
        end
      elseif L3_63 == false then
        L18_78 = _isDead_lastkali
        if L18_78 then
          L18_78 = print
          L18_78("\228\184\128\230\150\137\229\143\171\227\129\179\233\128\163\231\153\186\227\131\162\227\131\188\227\131\137\231\181\130\228\186\134")
          L18_78 = _lastkali_brain
          L18_78 = L18_78.eventMessage
          L18_78(L18_78, "setKeepAllShoutMode", false)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03004")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03005")
          _addFace = true
          L18_78 = checkView
          L18_78(nil, true)
          L18_78 = wait
          L18_78(30)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03006")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03007")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03008")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03009")
          L3_63 = true
          L18_78 = grabCaptionFlagSet
          L18_78()
          L18_78 = noGrabCaptionFlagSet
          L18_78()
        end
      elseif L7_67 == false then
        L18_78 = _isStartDecoy
        if L18_78 then
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "pc1_073_always", 1)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03049")
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "pc2_095", 1)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03050")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03051")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03052")
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03053")
          L18_78 = crowDecoyManager
          L18_78()
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03054")
          L7_67 = true
          L18_78 = grabCaptionFlagSet
          L18_78()
          L18_78 = noGrabCaptionFlagSet
          L18_78()
          L18_78 = _grab_pos_r
          if L18_78 ~= nil then
            L18_78 = _crow_brain
            L18_78 = L18_78.setFollowPoint
            L18_78(L18_78, true, _grab_pos_r, 10)
          else
            L18_78 = _grab_pos_l
            if L18_78 ~= nil then
              L18_78 = _crow_brain
              L18_78 = L18_78.setFollowPoint
              L18_78(L18_78, true, _grab_pos_l, 10)
            end
          end
          L11_71 = 0
        end
      elseif L5_65 == false then
        L18_78 = _isDead_addFace
        if L18_78 then
          L18_78 = _isFindHeart
          if L18_78 == false then
            L5_65 = true
            L18_78 = Fn_captionViewWait
            L18_78("ep20_03045")
            L18_78 = Fn_captionViewWait
            L18_78("ep20_03046")
            _caption_end_090 = true
            L18_78 = grabCaptionFlagSet
            L18_78()
            L18_78 = noGrabCaptionFlagSet
            L18_78()
          end
        end
      elseif L6_66 == false then
        L18_78 = _isFindHeart
        if L18_78 then
          L6_66 = true
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "pc2_068", 1)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03047")
          L18_78 = Sound
          L18_78 = L18_78.setGlobalVariable
          L18_78(L18_78, "voice_type", "radio")
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "per_007", 0.7)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03048")
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "uni_015", 0.7)
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03014")
          L18_78 = Sound
          L18_78 = L18_78.setGlobalVariable
          L18_78(L18_78, "voice_type", "normal")
          L18_78 = Sound
          L18_78 = L18_78.playSE
          L18_78(L18_78, "pc1_507b", 1)
          _isReadyFatal = true
          L18_78 = Fn_captionViewWait
          L18_78("ep20_03015")
          L18_78 = grabCaptionFlagSet
          L18_78()
          L18_78 = noGrabCaptionFlagSet
          L18_78()
          L18_78 = print
          L18_78("\227\130\175\227\131\173\227\130\166 clearMovePoint")
          L18_78 = _crow_brain
          L18_78 = L18_78.clearMovePoint
          L18_78(L18_78)
        end
      else
        L18_78 = _is_grab_failed_r
        if not L18_78 then
          L18_78 = _is_grab_failed_l
        else
          if L18_78 then
            L18_78 = print
            L18_78("\227\130\175\227\131\173\227\130\166 clearMovePoint")
            L18_78 = _crow_brain
            L18_78 = L18_78.clearMovePoint
            L18_78(L18_78)
            _is_grab_failed_r = false
            _is_grab_failed_l = false
        end
        elseif L1_61 == false then
          L18_78 = _grabed_name_r
          if L18_78 ~= "CrowBrain" then
            L18_78 = _grabed_name_l
          elseif L18_78 == "CrowBrain" then
            L18_78 = print
            L18_78("\227\130\175\227\131\173\227\130\166 clearMovePoint")
            L18_78 = _crow_brain
            L18_78 = L18_78.clearMovePoint
            L18_78(L18_78)
            L18_78 = captionSkipFunc
            L18_78 = L18_78("Crow")
            if L18_78 then
              L18_78 = Sound
              L18_78 = L18_78.playSE
              L18_78(L18_78, "pc2_078", 1)
              L18_78 = Fn_captionViewWait
              L18_78("ep20_03016")
            end
            L18_78 = captionSkipFunc
            L18_78 = L18_78("Crow")
            if L18_78 then
              L18_78 = Fn_captionViewWait
              L18_78("ep20_03019")
            end
            if L7_67 then
              L18_78 = Fn_captionViewWait
              L18_78("ep20_03037")
            end
            L18_78 = _grabed_name_r
            if L18_78 == "CrowBrain" then
              L18_78 = setAttackToHand
              L18_78(_hand_target_object_r, findGameObject2("Puppet", "lastkaliarm_07"), _hand_target_name_r)
            else
              L18_78 = setAttackToHand
              L18_78(_hand_target_object_l, findGameObject2("Puppet", "lastkaliarm_01"), _hand_target_name_l)
            end
            L1_61 = true
            L18_78 = noGrabCaptionFlagSet
            L18_78()
            L11_71 = 0
          end
        elseif L1_61 == true then
          L18_78 = _is_damage_release_r
          if not L18_78 then
            L18_78 = _is_damage_release_l
            if not L18_78 then
              L18_78 = _is_destroy_r
              L18_78 = L18_78 or _is_destroy_l
            end
          elseif L18_78 then
            L1_61 = false
            L18_78 = noGrabCaptionFlagSet
            L18_78()
            L18_78 = _grabed_name_r
            if L18_78 == "CrowBrain" then
              _grabed_name_r = nil
              L18_78 = _is_damage_release_r
              if L18_78 then
                _is_damage_release_r = false
              else
                L18_78 = _is_destroy_r
                if L18_78 then
                  _is_destroy_r = false
                end
              end
            else
              L18_78 = _grabed_name_l
              if L18_78 == "CrowBrain" then
                _grabed_name_l = nil
                L18_78 = _is_damage_release_l
                if L18_78 then
                  _is_damage_release_l = false
                else
                  L18_78 = _is_destroy_l
                  if L18_78 then
                    _is_destroy_l = false
                  end
                end
              end
            end
            L18_78 = _hand_attacker_r
            if L18_78 ~= "PlayerBrain" then
              L18_78 = _hand_attacker_l
            else
              if L18_78 == "PlayerBrain" then
                L18_78 = Fn_captionViewWait
                L18_78("ep20_03020")
                L18_78 = captionSkipFunc
                L18_78 = L18_78("Crow")
                if L18_78 then
                  L18_78 = Fn_captionViewWait
                  L18_78("ep20_03021")
                end
            end
            else
              L18_78 = _hand_attacker_r
              if L18_78 ~= "unica" then
                L18_78 = _hand_attacker_l
              else
                if L18_78 == "unica" then
                  L18_78 = Fn_captionViewWait
                  L18_78("ep20_03038")
                  L18_78 = captionSkipFunc
                  L18_78 = L18_78("Crow")
                  if L18_78 then
                    if L7_67 == false then
                      L18_78 = Fn_captionViewWait
                      L18_78("ep20_03039")
                    else
                      L18_78 = Fn_captionViewWait
                      L18_78("ep20_03040")
                    end
                  end
              end
              else
                L18_78 = _hand_attacker_r
                if L18_78 ~= "permet" then
                  L18_78 = _hand_attacker_l
                elseif L18_78 == "permet" then
                  L18_78 = Fn_captionViewWait
                  L18_78("ep20_03041")
                  L18_78 = captionSkipFunc
                  L18_78 = L18_78("Crow")
                  if L18_78 then
                    L18_78 = Fn_captionViewWait
                    L18_78("ep20_03042")
                  end
                end
              end
            end
            L18_78 = captionSkipFunc
            L18_78 = L18_78()
            if L18_78 and L7_67 then
              L18_78 = _isReadyFatal
              if L18_78 == false then
                L18_78 = wait
                L18_78(30)
                L18_78 = captionSkipFunc
                L18_78 = L18_78("Crow")
                if L18_78 then
                  L18_78 = Sound
                  L18_78 = L18_78.playSE
                  L18_78(L18_78, "pc2_082", 1)
                  L18_78 = Fn_captionViewWait
                  L18_78("ep20_03043")
                end
                L18_78 = captionSkipFunc
                L18_78 = L18_78("Crow")
                if L18_78 then
                  L18_78 = Fn_captionViewWait
                  L18_78("ep20_03044")
                end
              end
            end
            L11_71 = 0
          end
        elseif L1_61 == true then
          L18_78 = _is_throw_start_r
          if not L18_78 then
            L18_78 = _is_throw_start_l
          elseif L18_78 then
            L18_78 = _grabed_name_r
            if L18_78 == "CrowBrain" then
              _grabed_name_r = nil
              _is_throw_start_r = false
            else
              L18_78 = _grabed_name_l
              if L18_78 == "CrowBrain" then
                _grabed_name_l = nil
                _is_throw_start_l = false
              end
            end
            L1_61 = false
          end
        elseif L2_62 == false then
          L18_78 = _grabed_name_r
          if L18_78 ~= "PlayerBrain" then
            L18_78 = _grabed_name_l
          elseif L18_78 == "PlayerBrain" then
            L18_78 = print
            L18_78("\227\130\175\227\131\173\227\130\166 clearMovePoint")
            L18_78 = _crow_brain
            L18_78 = L18_78.clearMovePoint
            L18_78(L18_78)
            L18_78 = Fn_captionViewWait
            L18_78("ep20_03024")
            L18_78 = _grabed_name_r
            if L18_78 == "PlayerBrain" then
              L18_78 = setAttackToHand
              L18_78(_hand_target_object_r, findGameObject2("Puppet", "lastkaliarm_07"), _hand_target_name_r)
            else
              L18_78 = setAttackToHand
              L18_78(_hand_target_object_l, findGameObject2("Puppet", "lastkaliarm_01"), _hand_target_name_l)
            end
            L18_78 = math
            L18_78 = L18_78.random
            L18_78 = L18_78(1, 3)
            if captionSkipFunc("Player") then
              if L18_78 == 1 and (_grabed_name_r == "CrowBrain" or _grabed_name_l == "CrowBrain") then
                Sound:playSE("pc2_515", 1)
                Fn_captionViewWait("ep20_03025")
              elseif L18_78 == 2 or L18_78 == 1 and (_grabed_name_r == "CrowBrain" or _grabed_name_l == "CrowBrain") then
                Fn_captionViewWait("ep20_03026")
              else
                Sound:playSE("ene_permet_vo_talk_3", 1)
                Fn_captionViewWait("ep20_03027")
              end
            end
            L2_62 = true
            noGrabCaptionFlagSet()
            L11_71 = 0
          end
        elseif L2_62 == true then
          L18_78 = _is_damage_release_r
          if not L18_78 then
            L18_78 = _is_damage_release_l
            if not L18_78 then
              L18_78 = _is_destroy_r
              L18_78 = L18_78 or _is_destroy_l
            end
          elseif L18_78 then
            L2_62 = false
            L18_78 = noGrabCaptionFlagSet
            L18_78()
            L18_78 = _grabed_name_r
            if L18_78 == "PlayerBrain" then
              _grabed_name_r = nil
              L18_78 = _is_damage_release_r
              if L18_78 then
                _is_damage_release_r = false
              else
                L18_78 = _is_destroy_r
                if L18_78 then
                  _is_destroy_r = false
                end
              end
            else
              L18_78 = _grabed_name_l
              if L18_78 == "PlayerBrain" then
                _grabed_name_l = nil
                L18_78 = _is_damage_release_l
                if L18_78 then
                  _is_damage_release_l = false
                else
                  L18_78 = _is_destroy_l
                  if L18_78 then
                    _is_destroy_l = false
                  end
                end
              end
            end
            L18_78 = math
            L18_78 = L18_78.random
            L18_78 = L18_78(1, 3)
            if L18_78 == 1 then
              Sound:playSE("pc1_048", 1)
            elseif L18_78 == 2 then
              Sound:playSE("pc1_049", 1)
            else
              Sound:playSE("pc1_050", 1)
            end
            Fn_captionViewWait("ep20_03028")
            if captionSkipFunc("Player") then
              if _hand_attacker_r == "supporter_crow" or _hand_attacker_l == "supporter_crow" then
                Sound:playSE("pc2_517", 1)
                Fn_captionViewWait("ep20_03029")
                if captionSkipFunc("Player") then
                  Fn_captionViewWait("ep20_03030")
                end
              elseif _hand_attacker_r == "unica" or _hand_attacker_l == "unica" then
                Fn_captionViewWait("ep20_03031")
                if captionSkipFunc("Player") then
                  Fn_captionViewWait("ep20_03032")
                end
              elseif _hand_attacker_r == "permet" or _hand_attacker_l == "permet" then
                Fn_captionViewWait("ep20_03033")
                if captionSkipFunc("Player") then
                  Fn_captionViewWait("ep20_03034")
                end
              end
            end
          end
        elseif L2_62 == true then
          L18_78 = _is_throw_start_r
          if not L18_78 then
            L18_78 = _is_throw_start_l
          elseif L18_78 then
            L18_78 = _grabed_name_r
            if L18_78 == "PlayerBrain" then
              _grabed_name_r = nil
              _is_throw_start_r = false
            else
              L18_78 = _grabed_name_l
              if L18_78 == "PlayerBrain" then
                _grabed_name_l = nil
                _is_throw_start_l = false
              end
            end
            L2_62 = false
          end
        else
          L18_78 = _is_destroy_r
          if not L18_78 then
            L18_78 = _is_destroy_l
          else
            if L18_78 and L1_61 == false and L2_62 == false then
              L18_78 = _isDead_addFace
              if L18_78 == false then
                L18_78 = nil
                if _is_destroy_r then
                  L18_78 = findGameObject2("Puppet", "lastkaliarm_07")
                elseif _is_destroy_l then
                  L18_78 = findGameObject2("Puppet", "lastkaliarm_01")
                end
                if checkView(L18_78) then
                  Fn_captionViewWait("ep20_03035")
                end
                _is_destroy_r = false
                _is_destroy_l = false
              end
          end
          elseif L4_64 == false then
            L18_78 = _is_cutoff_r
            if not L18_78 then
              L18_78 = _is_cutoff_l
            elseif L18_78 then
              L18_78 = _isDead_addFace
              if L18_78 == false then
                L18_78 = nil
                if _is_cutoff_r then
                  L18_78 = findGameObject2("Puppet", "lastkaliarm_07")
                elseif _is_cutoff_l then
                  L18_78 = findGameObject2("Puppet", "lastkaliarm_01")
                end
                if checkView(L18_78) then
                  Sound:playSE("pc2_071", 1)
                  Fn_captionViewWait("ep20_03010")
                  if captionSkipFunc() then
                    Sound:setGlobalVariable("voice_type", "radio")
                    Sound:playSE("uni_018", 1)
                    Fn_captionViewWait("ep20_03011")
                    Sound:setGlobalVariable("voice_type", "normal")
                  end
                  if captionSkipFunc() then
                    Sound:playSE("kit_546", 1)
                    Fn_captionViewWait("ep20_03012")
                  end
                  L4_64 = true
                end
                _is_cutoff_r = false
                _is_cutoff_l = false
              end
            end
          elseif L8_68 == false and L7_67 then
            L18_78 = _grabed_name_r
            if L18_78 ~= "CrowBrain" then
              L18_78 = _grabed_name_l
              if L18_78 ~= "CrowBrain" then
                L18_78 = _isDead_addFace
                if L18_78 == false and L11_71 > 600 then
                  L18_78 = Fn_captionViewWait
                  L18_78("ep20_03055")
                  L18_78 = captionSkipFunc
                  L18_78 = L18_78()
                  if L18_78 then
                    L18_78 = Fn_captionViewWait
                    L18_78("ep20_03056")
                  end
                  L8_68 = true
                end
              end
            end
          elseif L7_67 and L1_61 == false and L2_62 == false then
            L18_78 = _is_grab_start_r
            if not L18_78 then
              L18_78 = _is_grab_start_l
            elseif L18_78 then
              L18_78 = _isReadyFatal
              if L18_78 == false then
                L18_78 = nil
                if _is_grab_start_r then
                  L18_78 = {
                    {
                      pos = _crow_pup,
                      action = Supporter.MovePoint.Takeoff,
                      vel = 10
                    },
                    {
                      pos = _crow_pup,
                      action = Supporter.MovePoint.Air,
                      vel = 10
                    },
                    {
                      pos = _grab_pos_r,
                      action = Supporter.MovePoint.Air,
                      vel = 10
                    }
                  }
                  _crow_brain:setFollowPoint(true, _grab_pos_r, 10)
                else
                  L18_78 = {
                    {
                      pos = _crow_pup,
                      action = Supporter.MovePoint.Takeoff,
                      vel = 10
                    },
                    {
                      pos = _crow_pup,
                      action = Supporter.MovePoint.Air,
                      vel = 10
                    },
                    {
                      pos = _grab_pos_l,
                      action = Supporter.MovePoint.Air,
                      vel = 10
                    }
                  }
                  _crow_brain:setFollowPoint(true, _grab_pos_l, 10)
                end
                print("\227\130\175\227\131\173\227\130\166 SetMovePoints")
                _crow_brain:clearMovePoint()
                _crow_brain:setMovePoints(L18_78)
                _crow_brain:startMovePoint()
                _is_grab_start_r = false
                _is_grab_start_l = false
              end
            end
          end
        end
      end
      L18_78 = _lastkali_brain
      L18_78 = L18_78.getHealth
      L18_78 = L18_78(L18_78)
      L10_70 = L18_78
      L12_72 = nil
      L11_71 = L11_71 + 1
      L18_78 = wait
      L18_78()
    end
  end)
end
function captionSkipFunc(A0_83)
  local L1_84, L2_85
  L1_84 = nil
  if A0_83 == nil then
    L2_85 = is_EndCap_020
    if not L2_85 then
      L2_85 = is_EndCap_040
    else
      if L2_85 then
        L2_85 = _grabed_name_r
        if L2_85 == nil then
          L2_85 = _grabed_name_l
        elseif L2_85 ~= nil then
          L1_84 = false
        end
    end
    else
      L1_84 = true
    end
  elseif A0_83 == "Crow" then
    L2_85 = is_EndCap_040
    if L2_85 then
      L2_85 = _grabed_name_r
      if L2_85 == nil then
        L2_85 = _grabed_name_l
      elseif L2_85 ~= nil then
        L1_84 = false
      end
    else
      L1_84 = true
    end
  elseif A0_83 == "Player" then
    L2_85 = is_EndCap_020
    if L2_85 then
      L2_85 = _grabed_name_r
      if L2_85 == nil then
        L2_85 = _grabed_name_l
      elseif L2_85 ~= nil then
        L1_84 = false
      end
    else
      L1_84 = true
    end
  end
  L2_85 = _isBeginShoutMode
  if L2_85 then
    L2_85 = _isDead_lastkali
    if L2_85 then
      L2_85 = _isStartDecoy
      if L2_85 then
        L2_85 = _isDead_addFace
        if L2_85 then
          L2_85 = _isFindHeart
          if L2_85 then
            L1_84 = true
          end
        end
      end
    end
  end
  return L1_84
end
function grabCaptionFlagSet()
  local L0_86, L1_87
  L0_86 = is_EndCap_020
  if L0_86 == false then
    L0_86 = _grabed_name_r
    if L0_86 ~= "CrowBrain" then
      L0_86 = _grabed_name_l
    elseif L0_86 == "CrowBrain" then
      is_EndCap_020 = true
    end
  end
  L0_86 = is_EndCap_040
  if L0_86 == false then
    L0_86 = _grabed_name_r
    if L0_86 ~= "PlayerBrain" then
      L0_86 = _grabed_name_l
    elseif L0_86 == "PlayerBrain" then
      is_EndCap_040 = true
    end
  end
  L0_86 = is_EndCap_020
  if L0_86 == true then
    L0_86 = _is_damage_release_r
    if not L0_86 then
      L0_86 = _is_damage_release_l
      if not L0_86 then
        L0_86 = _is_destroy_r
        L0_86 = L0_86 or _is_destroy_l
      end
    elseif L0_86 then
      L0_86 = _grabed_name_r
      if L0_86 == "CrowBrain" then
        _grabed_name_r = nil
        L0_86 = _is_damage_release_r
        if L0_86 then
          _is_damage_release_r = false
        else
          L0_86 = _is_destroy_r
          if L0_86 then
            _is_destroy_r = false
          end
        end
      else
        L0_86 = _grabed_name_l
        if L0_86 == "CrowBrain" then
          _grabed_name_l = nil
          L0_86 = _is_damage_release_l
          if L0_86 then
            _is_damage_release_l = false
          else
            L0_86 = _is_destroy_l
            if L0_86 then
              _is_destroy_l = false
            end
          end
        end
      end
      is_EndCap_020 = false
    end
  end
  L0_86 = is_EndCap_040
  if L0_86 == true then
    L0_86 = _is_damage_release_r
    if not L0_86 then
      L0_86 = _is_damage_release_l
      if not L0_86 then
        L0_86 = _is_destroy_r
        L0_86 = L0_86 or _is_destroy_l
      end
    elseif L0_86 then
      L0_86 = _grabed_name_r
      if L0_86 == "PlayerBrain" then
        _grabed_name_r = nil
        L0_86 = _is_damage_release_r
        if L0_86 then
          _is_damage_release_r = false
        else
          L0_86 = _is_destroy_r
          if L0_86 then
            _is_destroy_r = false
          end
        end
      else
        L0_86 = _grabed_name_l
        if L0_86 == "PlayerBrain" then
          _grabed_name_l = nil
          L0_86 = _is_damage_release_l
          if L0_86 then
            _is_damage_release_l = false
          else
            L0_86 = _is_destroy_l
            if L0_86 then
              _is_destroy_l = false
            end
          end
        end
      end
      is_EndCap_040 = false
    end
  end
end
function checkView(A0_88, A1_89)
  local L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97
  L2_90 = false
  if A1_89 == false then
    L3_91 = Query
    L4_92 = L3_91
    L3_91 = L3_91.setEyeSightTransform
    L5_93 = Camera
    L5_93 = L5_93.getEyePos
    L9_97 = L5_93(L6_94)
    L3_91(L4_92, L5_93, L6_94, L7_95, L8_96, L9_97, L5_93(L6_94))
    L3_91 = Query
    L4_92 = L3_91
    L3_91 = L3_91.setEyeSightAngle
    L5_93 = Deg2Rad
    L9_97 = L5_93(L6_94)
    L3_91(L4_92, L5_93, L6_94, L7_95, L8_96, L9_97, L5_93(L6_94))
    L3_91 = Query
    L4_92 = L3_91
    L3_91 = L3_91.setEyeSightRange
    L5_93 = 10
    L3_91(L4_92, L5_93)
    L4_92 = A0_88
    L3_91 = A0_88.getWorldPos
    L3_91 = L3_91(L4_92)
    L4_92 = Query
    L5_93 = L4_92
    L4_92 = L4_92.checkEyeSightSphere
    L4_92 = L4_92(L5_93, L6_94, L7_95)
    if not L4_92 then
      L4_92 = Query
      L5_93 = L4_92
      L4_92 = L4_92.calcInSightRatioSphere
      L4_92 = L4_92(L5_93, L6_94, L7_95)
    else
      if L4_92 then
        L2_90 = true
        L4_92 = Fn_lookAtObject
        L5_93 = A0_88
        L4_92 = L4_92(L5_93, L6_94, L7_95)
        L5_93 = invokeTask
        L5_93(L6_94)
      else
      end
    end
  else
    if A1_89 == true then
      L3_91, L4_92, L5_93 = nil, nil, nil
      for L9_97 = 1, 5 do
        L4_92 = Fn_getDistanceToPlayer(findGameObject2("Puppet", "lastkalihead_" .. string.format("%02d", L9_97)))
        if L3_91 == nil or L3_91 > L4_92 then
          L3_91 = L4_92
          L5_93 = findGameObject2("Puppet", "lastkalihead_" .. string.format("%02d", L9_97))
        end
      end
      L9_97 = 0.2
      L7_95(L8_96)
    else
    end
  end
  return L2_90
end
function noGrabCaptionFlagSet()
  local L0_98, L1_99
  L0_98 = _is_destroy_r
  if not L0_98 then
    L0_98 = _is_destroy_l
  elseif L0_98 then
    L0_98 = is_EndCap_020
    if L0_98 == false then
      L0_98 = is_EndCap_040
      if L0_98 == false then
        L0_98 = _is_destroy_r
        if L0_98 then
          _is_destroy_r = false
        end
        L0_98 = _is_destroy_l
        if L0_98 then
          _is_destroy_l = false
        end
      end
    end
  end
  L0_98 = is_EndCap_080
  if L0_98 == false then
    L0_98 = _is_cutoff_r
    if not L0_98 then
      L0_98 = _is_cutoff_l
    elseif L0_98 then
      _is_cutoff_r = false
      _is_cutoff_l = false
    end
  end
end
function setAttackToHand(A0_100, A1_101, A2_102)
  local L3_103, L4_104, L5_105, L6_106, L7_107
  L3_103 = print
  L4_104 = "gizmo"
  L5_105 = A0_100
  L3_103(L4_104, L5_105)
  L3_103 = print
  L4_104 = "puppet"
  L5_105 = A1_101
  L3_103(L4_104, L5_105)
  L3_103 = print
  L4_104 = "name"
  L5_105 = A2_102
  L3_103(L4_104, L5_105)
  L4_104 = A0_100
  L3_103 = A0_100.getWorldPos
  L3_103 = L3_103(L4_104)
  L4_104 = L3_103.x
  L4_104 = L4_104 + 3
  L3_103.x = L4_104
  L4_104 = L3_103.y
  L4_104 = L4_104 + 5
  L3_103.y = L4_104
  L4_104 = L3_103.z
  L4_104 = L4_104 + 4
  L3_103.z = L4_104
  L5_105 = A0_100
  L4_104 = A0_100.getWorldPos
  L4_104 = L4_104(L5_105)
  L5_105 = L4_104.x
  L5_105 = L5_105 + -1
  L4_104.x = L5_105
  L5_105 = L4_104.y
  L5_105 = L5_105 + 2
  L4_104.y = L5_105
  L6_106 = A0_100
  L5_105 = A0_100.getWorldPos
  L5_105 = L5_105(L6_106)
  L6_106 = L4_104.y
  L6_106 = L6_106 + 7
  L5_105.y = L6_106
  L6_106 = L5_105.z
  L6_106 = L6_106 + 4
  L5_105.z = L6_106
  L6_106 = _grabed_name_r
  L6_106 = L6_106 == "CrowBrain" or L6_106 == "CrowBrain"
  if L6_106 == false then
    L6_106 = _isReadyFatal
    if L6_106 == false then
      L6_106 = invokeTask
      function L7_107()
        local L0_108
        L0_108 = A0_100
        if L0_108 ~= nil then
          L0_108 = _crow_brain
          L0_108 = L0_108.setThreatObject
          L0_108 = L0_108(L0_108, A0_100)
          print("crow attack to hand", L0_108)
          tbl = {
            {
              pos = _crow_pup:getWorldPos(),
              action = Supporter.MovePoint.FallKick,
              target = A0_100,
              vel = 15
            }
          }
          print("\227\130\175\227\131\173\227\130\166 SetMovePoints")
          _crow_brain:clearMovePoint()
          _crow_brain:setMovePoints(tbl)
          _crow_brain:startMovePoint()
          repeat
            wait()
          until _crow_brain:isMovePointEnd() or _grabed_name_r ~= "PlayerBrain" and _grabed_name_l ~= "PlayerBrain"
          print("\227\130\175\227\131\173\227\130\166 clearMovePoint")
          _crow_brain:clearMovePoint()
        else
          L0_108 = print
          L0_108("gizmo\227\129\140nil\227\129\170\227\129\174\227\129\167\227\130\175\227\131\173\227\130\166\227\129\175\230\148\187\230\146\131\227\129\171\232\161\140\227\129\139\227\129\170\227\129\132")
        end
      end
      L6_106(L7_107)
    end
  end
  L6_106 = _unica_brain
  L7_107 = L6_106
  L6_106 = L6_106.eventMessage
  L6_106 = L6_106(L7_107, "SetReservationActionMoveAndAttack", A1_101, A2_102, L4_104)
  L7_107 = print
  L7_107("unica attack to hand", L6_106)
  L7_107 = _permet_brain
  L7_107 = L7_107.eventMessage
  L7_107 = L7_107(L7_107, "SetReservationActionMoveAndAttack", A1_101, A2_102, L5_105)
  print("permet attack to hand", L7_107)
end
function HPgauge()
  invokeTask(function()
    _boss_gauge = HUD:createBossHpGauge({
      obj = findGameObject2("Puppet", "lastkali")
    })
    _boss_gauge:setActive(true)
    while _is_fatalend == false do
      _boss_gauge:setHp((findGameObject2("EnemyBrain", "lastkali"):getHealth() - _coreHP1) / (findGameObject2("EnemyBrain", "lastkali"):getMaxHealth() - _coreHP1))
      if findGameObject2("EnemyBrain", "lastkali"):getHealth() ~= _coreHP1 then
        if findGameObject2("EnemyBrain", "lastkali"):getHealth() <= findGameObject2("EnemyBrain", "lastkali"):getMaxHealth() / 2 and _isBeginShoutMode == false then
          _isBeginShoutMode = true
        end
        wait()
      end
    end
    _isDead_lastkali = true
    repeat
      wait()
    until _addFace
    findGameObject2("EnemyBrain", "lastkali"):eventMessage("requestHeadAppear")
    while _is_fatalend == false do
      _boss_gauge:setHp((findGameObject2("EnemyBrain", "lastkalihead_01"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getHealth() - _coreHP2) / (findGameObject2("EnemyBrain", "lastkalihead_01"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getMaxHealth() - _coreHP2))
      if findGameObject2("EnemyBrain", "lastkalihead_01"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getHealth() - _coreHP2 ~= 0 then
        if findGameObject2("EnemyBrain", "lastkalihead_01"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getHealth() - _coreHP2 <= (findGameObject2("EnemyBrain", "lastkalihead_01"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getMaxHealth() - _coreHP2) / 2 and _isStartDecoy == false then
          _isStartDecoy = true
          print("_isStartDecoy\227\130\146true")
        elseif findGameObject2("EnemyBrain", "lastkalihead_01"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getHealth() - _coreHP2 <= (findGameObject2("EnemyBrain", "lastkalihead_01"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_02"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_03"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_04"):getMaxHealth() + findGameObject2("EnemyBrain", "lastkalihead_05"):getMaxHealth() - _coreHP2) * 60 / 100 and _isFinalMode == false then
          _lastkali_brain:eventMessage("startFinalPhase")
          _isFinalMode = true
          print("_isFinalMode\227\130\146true")
        end
        wait()
      end
    end
    _boss_gauge:setActive(false)
    _isDead_addFace = true
  end)
end
function crowDecoyManager()
  invokeTask(function()
    local L0_109, L1_110
    L0_109 = false
    L1_110 = {}
    L1_110[1] = findGameObject2("EnemyBrain", "lastkali")
    L1_110[2] = findGameObject2("EnemyBrain", "lastkaliarm_01")
    L1_110[3] = findGameObject2("EnemyBrain", "lastkaliarm_07")
    L1_110[4] = findGameObject2("EnemyBrain", "lastkalihead_01")
    L1_110[5] = findGameObject2("EnemyBrain", "lastkalihead_02")
    L1_110[6] = findGameObject2("EnemyBrain", "lastkalihead_03")
    L1_110[7] = findGameObject2("EnemyBrain", "lastkalihead_04")
    L1_110[8] = findGameObject2("EnemyBrain", "lastkalihead_05")
    while _isReadyFatal == false do
      if _isStartDecoy then
        if _grabed_name_r ~= "CrowBrain" and _grabed_name_l ~= "CrowBrain" and L0_109 == false then
          print("\227\130\175\227\131\173\227\130\166\227\129\138\227\129\168\227\130\138\227\131\162\227\131\188\227\131\137")
          for _FORV_5_ = 1, 8 do
            L1_110[_FORV_5_]:setScriptAttackTarget(_crow_pup)
            L0_109 = true
          end
          _FOR_:setAbility(Supporter.Ability.Parallel.Normal, false)
          _crow_brain:setAbility(Supporter.Ability.Parallel.Mars, false)
          _crow_brain:setAbility(Supporter.Ability.Parallel.Jupiter, false)
          _crow_brain:setAbility(Supporter.Ability.Parallel.NormalSp, false)
          _crow_brain:setAbility(Supporter.Ability.Parallel.MarsSp, false)
          _crow_brain:setAbility(Supporter.Ability.Parallel.JupiterSp, false)
        elseif (_grabed_name_r == "CrowBrain" or _grabed_name_l == "CrowBrain") and L0_109 == true then
          print("\227\130\175\227\131\173\227\130\166\227\129\138\227\129\168\227\130\138\227\131\162\227\131\188\227\131\137\232\167\163\233\153\164")
          for _FORV_5_ = 1, 8 do
            L1_110[_FORV_5_]:setScriptAttackTarget()
            L0_109 = false
          end
          _FOR_:setAbility(Supporter.Ability.Parallel.Normal, true)
          _crow_brain:setAbility(Supporter.Ability.Parallel.Mars, true)
          _crow_brain:setAbility(Supporter.Ability.Parallel.Jupiter, true)
          _crow_brain:setAbility(Supporter.Ability.Parallel.NormalSp, true)
          _crow_brain:setAbility(Supporter.Ability.Parallel.MarsSp, true)
          _crow_brain:setAbility(Supporter.Ability.Parallel.JupiterSp, true)
        end
      end
      wait()
    end
    print("\227\131\149\227\130\167\227\130\164\227\130\191\227\131\171\229\190\133\227\129\161\227\128\130\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\229\132\170\229\133\136\227\131\162\227\131\188\227\131\137")
    for _FORV_5_ = 1, 8 do
      L1_110[_FORV_5_]:setScriptAttackTarget(Fn_getPlayer())
      L0_109 = false
    end
    _FOR_:resetFollowPoint()
    _crow_brain:setAbility(Supporter.Ability.Parallel.Normal, true)
    _crow_brain:setAbility(Supporter.Ability.Parallel.Mars, true)
    _crow_brain:setAbility(Supporter.Ability.Parallel.Jupiter, true)
    _crow_brain:setAbility(Supporter.Ability.Parallel.NormalSp, true)
    _crow_brain:setAbility(Supporter.Ability.Parallel.MarsSp, true)
    _crow_brain:setAbility(Supporter.Ability.Parallel.JupiterSp, true)
  end)
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_111
  L1_111 = _warp_caption_flag
  if L1_111 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep20_03036")
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
  end
  Sound:setGlobalVariable("voice_type", "normal")
  if Fn_findAreaHandle("dt_a_root") then
    Fn_findAreaHandle("dt_a_root"):setSceneParameters("dt_a_root")
    print("\229\164\169\231\144\131\229\164\137\230\155\180")
  end
end
