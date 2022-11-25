dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_isSuccess = nil
_wave1_1_clear = nil
enmgen_01 = nil
enmgen_02 = nil
enmgen_03 = nil
enmgen_04 = nil
enmbra_01 = nil
enmbra_02 = {}
enmbra_03 = {}
enmbra_04 = nil
enmgen2_nevi_01 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator2_nevi_01_01",
      name = "imp_01"
    }
  },
  onSpawn = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum - 1
    if A0_0:getSpecTable().enemyDeadNum < 0 then
      A0_0:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectAsh = function(A0_2, A1_3)
    A0_2:getSpecTable().enemyDeadNum = A0_2:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"imp_01"}, 1, 4)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_8)
    local L1_9
    L1_9 = A0_8.enemyDeadNum
    return L1_9
  end,
  isEnemyAllDead = function(A0_10)
    local L2_11
    L2_11 = A0_10.enemyDeadNum
    L2_11 = L2_11 >= #A0_10.spawnSet
    return L2_11
  end
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "imp",
      locator = "locator2_nevi_02_01",
      name = "imp_02"
    },
    {
      type = "imp",
      locator = "locator2_nevi_02_02",
      name = "imp_03"
    }
  },
  onSpawn = function(A0_12, A1_13)
    A0_12:getSpecTable().enemyDeadNum = A0_12:getSpecTable().enemyDeadNum - 1
    if A0_12:getSpecTable().enemyDeadNum < 0 then
      A0_12:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_16, A1_17)
    Fn_enemyPopGemSetup(A0_16, {"imp_02", "imp_03"}, 1, 4)
  end,
  onPopGem = function(A0_18, A1_19)
    Fn_enemyAshPopGem(A0_18, A1_19)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_20)
    local L1_21
    L1_21 = A0_20.enemyDeadNum
    return L1_21
  end,
  isEnemyAllDead = function(A0_22)
    local L2_23
    L2_23 = A0_22.enemyDeadNum
    L2_23 = L2_23 >= #A0_22.spawnSet
    return L2_23
  end
}
enmgen2_nevi_03 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator2_nevi_03_01",
      name = "stalker_01"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_03_02",
      name = "stalker_02"
    },
    {
      type = "stalker",
      locator = "locator2_nevi_03_03",
      name = "stalker_03"
    }
  },
  onSpawn = function(A0_24, A1_25)
    A0_24:getSpecTable().enemyDeadNum = A0_24:getSpecTable().enemyDeadNum - 1
    if A0_24:getSpecTable().enemyDeadNum < 0 then
      A0_24:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectAsh = function(A0_26, A1_27)
    A0_26:getSpecTable().enemyDeadNum = A0_26:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_28)
    local L1_29
    L1_29 = A0_28.enemyDeadNum
    return L1_29
  end,
  isEnemyAllDead = function(A0_30)
    local L2_31
    L2_31 = A0_30.enemyDeadNum
    L2_31 = L2_31 >= #A0_30.spawnSet
    return L2_31
  end
}
enmgen2_nevi_04 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator2_nevi_04_01",
      name = "guardcore_01"
    }
  },
  onSpawn = function(A0_32, A1_33)
    A0_32:getSpecTable().enemyDeadNum = A0_32:getSpecTable().enemyDeadNum - 1
    if A0_32:getSpecTable().enemyDeadNum < 0 then
      A0_32:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectAsh = function(A0_34, A1_35)
    A0_34:getSpecTable().enemyDeadNum = A0_34:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_36)
    local L1_37
    L1_37 = A0_36.enemyDeadNum
    return L1_37
  end,
  isEnemyAllDead = function(A0_38)
    local L2_39
    L2_39 = A0_38.enemyDeadNum
    L2_39 = L2_39 >= #A0_38.spawnSet
    return L2_39
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Mars, true)
  enmgen_01 = findGameObject2("EnemyGenerator", "enmgen2_nevi_01")
  enmgen_02 = findGameObject2("EnemyGenerator", "enmgen2_nevi_02")
  enmgen_03 = findGameObject2("EnemyGenerator", "enmgen2_nevi_03")
  enmgen_04 = findGameObject2("EnemyGenerator", "enmgen2_nevi_04")
  Fn_pcSensorOff("pccubesensor2_caution_litho_07")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_07")
end
function Ingame()
  local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52, L13_53, L14_54, L15_55, L16_56, L17_57, L18_58, L19_59, L20_60, L21_61, L22_62, L23_63, L24_64, L25_65, L26_66, L27_67, L28_68, L29_69, L30_70, L31_71, L32_72, L33_73, L34_74
  L0_40 = Fn_setCatWarpCheckPoint
  L1_41 = "locator2_restart_pos_ep09_o"
  L0_40(L1_41)
  L0_40 = findGameObject2
  L1_41 = "Node"
  L2_42 = "locator2_litho_01"
  L0_40 = L0_40(L1_41, L2_42)
  L1_41 = invokeTask
  function L2_42()
    local L0_75
    L0_75 = false
    while true do
      if L0_75 == false and Fn_getDistanceToPlayer(L0_40) > 30 then
        L0_75 = true
        Fn_naviSet(L0_40)
      elseif L0_75 == true and Fn_getDistanceToPlayer(L0_40) <= 10 then
        L0_75 = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L1_41 = L1_41(L2_42)
  litho_task = L1_41
  L1_41 = Fn_missionStart
  L1_41()
  L1_41 = Fn_userCtrlOn
  L1_41()
  L1_41 = GameDatabase
  L2_42 = L1_41
  L1_41 = L1_41.get
  L3_43 = ggd
  L3_43 = L3_43.EventFlags__ep09__flag01
  L1_41 = L1_41(L2_42, L3_43)
  if L1_41 == 1 then
    L1_41 = Fn_captionView
    L2_42 = "ep09_15002"
    L1_41(L2_42)
  else
  end
  repeat
    L1_41 = wait
    L1_41()
    L1_41 = Fn_sendEventComSb
    L2_42 = "isLithographStart"
    L1_41 = L1_41(L2_42)
  until L1_41
  L1_41 = litho_task
  L2_42 = L1_41
  L1_41 = L1_41.abort
  L1_41(L2_42)
  litho_task = nil
  L1_41 = Fn_setCatWarpCheckPoint
  L2_42 = "locator2_restart_pos_ep09_o_02"
  L1_41(L2_42)
  L1_41 = Fn_sendEventComSb
  L2_42 = "requestComSensorOff"
  L3_43 = "pccubesensormulti2_caution_07"
  L1_41(L2_42, L3_43)
  L1_41 = Fn_sendEventComSb
  L2_42 = "requestComSensorOff"
  L3_43 = "pccubesensormulti2_catwarp_07"
  L1_41(L2_42, L3_43)
  L1_41 = Fn_pcSensorOn
  L2_42 = "pccubesensor2_caution_litho_07"
  L1_41(L2_42)
  L1_41 = Fn_pcSensorOn
  L2_42 = "pccubesensor2_catwarp_litho_07"
  L1_41(L2_42)
  L1_41 = enmgen_01
  if L1_41 ~= nil then
    L1_41 = enmgen_01
    L2_42 = L1_41
    L1_41 = L1_41.requestSpawn
    L1_41(L2_42)
  end
  repeat
    L1_41 = wait
    L1_41()
    L1_41 = enmgen_01
    L2_42 = L1_41
    L1_41 = L1_41.isPrepared
    L1_41 = L1_41(L2_42)
  until L1_41
  L1_41 = enmgen_01
  L2_42 = L1_41
  L1_41 = L1_41.requestIdlingEnemy
  L3_43 = true
  L1_41(L2_42, L3_43)
  L1_41 = enmgen_01
  L2_42 = L1_41
  L1_41 = L1_41.setEnemyMarker
  L3_43 = false
  L1_41(L2_42, L3_43)
  L1_41 = Fn_setBgmPoint
  L2_42 = "battle"
  L1_41(L2_42)
  L1_41 = Fn_sendEventComSb
  L2_42 = "setFirstHalfProcessEnd"
  L1_41(L2_42)
  repeat
    L1_41 = wait
    L1_41()
    L1_41 = Fn_sendEventComSb
    L2_42 = "isFirstHalfProcessEnd"
    L1_41 = L1_41(L2_42)
  until L1_41
  L1_41 = findGameObject2
  L2_42 = "Node"
  L3_43 = "locator2_range_marker_01"
  L1_41 = L1_41(L2_42, L3_43)
  L3_43 = L1_41
  L2_42 = L1_41.getWorldTransform
  L3_43 = L2_42(L3_43)
  L4_44 = createGameObject2
  L5_45 = "MapMarker"
  L4_44 = L4_44(L5_45)
  L6_46 = L4_44
  L5_45 = L4_44.setName
  L7_47 = "range_marker_01"
  L5_45(L6_46, L7_47)
  L6_46 = L1_41
  L5_45 = L1_41.appendChild
  L7_47 = L4_44
  L5_45(L6_46, L7_47)
  L6_46 = L4_44
  L5_45 = L4_44.setWorldTransform
  L7_47 = L2_42
  L8_48 = L3_43
  L5_45(L6_46, L7_47, L8_48)
  L6_46 = L4_44
  L5_45 = L4_44.setForceMove
  L5_45(L6_46)
  L6_46 = L4_44
  L5_45 = L4_44.setAssetName
  L7_47 = "gui_marker_30"
  L5_45(L6_46, L7_47)
  L6_46 = L4_44
  L5_45 = L4_44.setupPattern
  L7_47 = "C"
  L8_48 = Vector
  L9_49 = 3.5
  L10_50 = 3.5
  L11_51 = 3.5
  L34_74 = L8_48(L9_49, L10_50, L11_51)
  L5_45(L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52, L13_53, L14_54, L15_55, L16_56, L17_57, L18_58, L19_59, L20_60, L21_61, L22_62, L23_63, L24_64, L25_65, L26_66, L27_67, L28_68, L29_69, L30_70, L31_71, L32_72, L33_73, L34_74, L8_48(L9_49, L10_50, L11_51))
  L6_46 = L4_44
  L5_45 = L4_44.setActive
  L7_47 = true
  L5_45(L6_46, L7_47)
  L6_46 = L4_44
  L5_45 = L4_44.playIn
  L5_45(L6_46)
  L5_45 = start_game_obj
  L5_45()
  L5_45 = Fn_lookAtObject
  L6_46 = "locator2_nevi_01_01"
  L5_45 = L5_45(L6_46)
  L6_46 = waitSeconds
  L7_47 = 1
  L6_46(L7_47)
  L6_46 = Fn_captionViewWait
  L7_47 = "ep09_15001"
  L6_46(L7_47)
  L7_47 = L5_45
  L6_46 = L5_45.abort
  L6_46(L7_47)
  L6_46 = waitSeconds
  L7_47 = 0.3
  L6_46(L7_47)
  L6_46 = GameDatabase
  L7_47 = L6_46
  L6_46 = L6_46.get
  L8_48 = ggd
  L8_48 = L8_48.Savedata__Info__ep09__ep09_info_06
  L6_46 = L6_46(L7_47, L8_48)
  if L6_46 ~= 2 then
    L6_46 = HUD
    L7_47 = L6_46
    L6_46 = L6_46.info
    L8_48 = "ep09_info_06"
    L9_49 = false
    L6_46(L7_47, L8_48, L9_49)
  else
    L6_46 = GameDatabase
    L7_47 = L6_46
    L6_46 = L6_46.get
    L8_48 = ggd
    L8_48 = L8_48.Savedata__Info__ep09__ep09_info_06
    L6_46 = L6_46(L7_47, L8_48)
    if L6_46 == 2 then
      L6_46 = HUD
      L7_47 = L6_46
      L6_46 = L6_46.info
      L8_48 = "ep09_info_06"
      L9_49 = true
      L6_46(L7_47, L8_48, L9_49)
    end
  end
  L6_46 = wait
  L6_46()
  L6_46 = {L7_47}
  L7_47 = Player
  L7_47 = L7_47.kAbility_ExGrab
  L7_47 = {}
  L8_48 = Fn_unLockPlayerAbility
  L9_49 = L6_46
  L10_50 = L7_47
  L8_48(L9_49, L10_50)
  L8_48 = GameDatabase
  L9_49 = L8_48
  L8_48 = L8_48.set
  L10_50 = ggd
  L10_50 = L10_50.GlobalSystemFlags__GaugeCoercion
  L11_51 = true
  L8_48(L9_49, L10_50, L11_51)
  L8_48 = Player
  L9_49 = L8_48
  L8_48 = L8_48.setEnergy
  L10_50 = Player
  L10_50 = L10_50.kEnergy_SpAttack
  L11_51 = Player
  L12_52 = L11_51
  L11_51 = L11_51.getEnergyMax
  L13_53 = Player
  L13_53 = L13_53.kEnergy_SpAttack
  L11_51 = L11_51(L12_52, L13_53)
  L12_52 = false
  L8_48(L9_49, L10_50, L11_51, L12_52)
  L8_48 = Fn_missionView
  L9_49 = "ep09_09160"
  L10_50, L11_51 = nil, nil
  L12_52 = true
  L8_48(L9_49, L10_50, L11_51, L12_52)
  L8_48 = Fn_userCtrlOn
  L8_48()
  L8_48 = Fn_tutorialCaption
  L9_49 = "mars_grab"
  L8_48(L9_49)
  L8_48 = {}
  L8_48.invincible = false
  L8_48.speed = 1
  L9_49 = enmgen_01
  L10_50 = L9_49
  L9_49 = L9_49.requestIdlingEnemy
  L11_51 = false
  L9_49(L10_50, L11_51)
  L9_49 = enmgen_01
  L10_50 = L9_49
  L9_49 = L9_49.setEnemyMarker
  L11_51 = true
  L9_49(L10_50, L11_51)
  L9_49 = findGameObject2
  L10_50 = "EnemyBrain"
  L11_51 = "imp_01"
  L9_49 = L9_49(L10_50, L11_51)
  enmbra_01 = L9_49
  L9_49 = invokeTask
  function L10_50()
    repeat
      wait()
    until enmbra_01:isReadyEnemy()
    enmbra_01:move({
      "locator2_nevi_01_01_move_pos_01"
    }, L8_48)
    repeat
      wait()
    until enmbra_01:isMoveEnd()
    enmbra_01:endScriptAction()
  end
  L9_49 = L9_49(L10_50)
  L10_50 = HUD
  L11_51 = L10_50
  L10_50 = L10_50.counter999SetIcon
  L12_52 = HUD
  L12_52 = L12_52.kCount99_99IconType_Question
  L10_50(L11_51, L12_52)
  L10_50 = HUD
  L11_51 = L10_50
  L10_50 = L10_50.counter999SetTextID
  L12_52 = "ep09_09016"
  L10_50(L11_51, L12_52)
  L10_50 = HUD
  L11_51 = L10_50
  L10_50 = L10_50.counter999SetNum
  L12_52 = 0
  L10_50(L11_51, L12_52)
  L10_50 = HUD
  L11_51 = L10_50
  L10_50 = L10_50.counter999SetVisible
  L12_52 = true
  L10_50(L11_51, L12_52)
  L10_50 = invokeTask
  function L11_51()
    while true do
      if return_flag and Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_01")) <= 30 then
        return_flag = false
        Fn_naviKill()
      end
      wait()
    end
  end
  L10_50 = L10_50(L11_51)
  return_task = L10_50
  L10_50 = findGameObject2
  L11_51 = "Sensor"
  L12_52 = "cubesensor2_01"
  L10_50 = L10_50(L11_51, L12_52)
  L12_52 = L10_50
  L11_51 = L10_50.getWorldPos
  L11_51 = L11_51(L12_52)
  L12_52 = {}
  L13_53 = nil
  L14_54 = invokeTask
  function L15_55()
    local L0_76, L1_77, L2_78, L3_79
    repeat
      L0_76()
      for L3_79 = 1, 3 do
        L13_53 = findGameObject2("Puppet", "imp_" .. string.format("%02d", L3_79))
        if L13_53 ~= nil then
          L12_52[L3_79] = L11_51:DistanceTo(L13_53:getWorldPos())
        end
      end
      if L0_76 ~= nil then
        L0_76(L1_77)
      end
      if L0_76 ~= nil then
        L0_76(L1_77, L2_78)
      end
    until L0_76
  end
  L14_54 = L14_54(L15_55)
  L15_55 = invokeTask
  function L16_56()
    repeat
      wait()
    until enmgen2_nevi_01:isEnemyAllDead()
    Fn_tutorialCaptionKill()
  end
  L15_55 = L15_55(L16_56)
  L16_56 = 0
  L17_57 = invokeTask
  function L18_58()
    repeat
      repeat
        L16_56 = L16_56 + 1
        wait()
      until enmgen2_nevi_01:isEnemyAllDead() or L16_56 > 600
      if enmgen_02 ~= nil then
        enmgen_02:requestSpawn()
      end
      repeat
        wait()
      until enmgen_02:isPrepared()
      if _wave1_1_clear == nil then
        _wave1_1_clear = true
      end
      wait()
    until _wave1_1_clear
    Fn_captionView("ep09_15009")
    for _FORV_3_ = 1, 2 do
      enmbra_02[_FORV_3_] = findGameObject2("EnemyBrain", string.format("imp_%02d", _FORV_3_ + 1))
    end
  end
  L17_57(L18_58)
  L17_57 = invokeTask
  function L18_58()
    repeat
      repeat
        wait()
      until enmgen2_nevi_02:isEnemyAllDead()
      if _isSuccess == nil then
        _isSuccess = true
      end
      wait()
    until _isSuccess
  end
  L17_57(L18_58)
  repeat
    L17_57 = _isSuccess
    if L17_57 == false then
      L18_58 = L14_54
      L17_57 = L14_54.isRunning
      L17_57 = L17_57(L18_58)
      if L17_57 then
        L18_58 = L14_54
        L17_57 = L14_54.abort
        L17_57(L18_58)
      end
      if L9_49 ~= nil then
        L18_58 = L9_49
        L17_57 = L9_49.isRunning
        L17_57 = L17_57(L18_58)
        if L17_57 then
          L18_58 = L9_49
          L17_57 = L9_49.abort
          L17_57(L18_58)
        end
      end
      L17_57 = imp_move_task_02
      if L17_57 ~= nil then
        L17_57 = imp_move_task_02
        L18_58 = L17_57
        L17_57 = L17_57.isRunning
        L17_57 = L17_57(L18_58)
        if L17_57 then
          L17_57 = imp_move_task_02
          L18_58 = L17_57
          L17_57 = L17_57.abort
          L17_57(L18_58)
        end
      end
      L17_57 = imp_move_task_03
      if L17_57 ~= nil then
        L17_57 = imp_move_task_03
        L18_58 = L17_57
        L17_57 = L17_57.isRunning
        L17_57 = L17_57(L18_58)
        if L17_57 then
          L17_57 = imp_move_task_03
          L18_58 = L17_57
          L17_57 = L17_57.abort
          L17_57(L18_58)
        end
      end
      L17_57 = restartLithographTheme
      L17_57()
    end
    L17_57 = wait
    L17_57()
    L17_57 = _isSuccess
  until L17_57
  L17_57 = Fn_captionView
  L18_58 = "ep09_15003"
  L17_57(L18_58)
  L18_58 = L15_55
  L17_57 = L15_55.abort
  L17_57(L18_58)
  L15_55 = nil
  L18_58 = L14_54
  L17_57 = L14_54.isRunning
  L17_57 = L17_57(L18_58)
  if L17_57 then
    L18_58 = L14_54
    L17_57 = L14_54.abort
    L17_57(L18_58)
  end
  L17_57 = HUD
  L18_58 = L17_57
  L17_57 = L17_57.counter999IsVisible
  L17_57 = L17_57(L18_58)
  if L17_57 then
    L17_57 = HUD
    L18_58 = L17_57
    L17_57 = L17_57.counter999SetVisible
    L17_57(L18_58, L19_59)
  end
  L17_57 = Fn_tutorialCaptionKill
  L17_57()
  L17_57 = waitSeconds
  L18_58 = 3
  L17_57(L18_58)
  _isSuccess = nil
  L17_57 = enmgen_03
  if L17_57 ~= nil then
    L17_57 = enmgen_03
    L18_58 = L17_57
    L17_57 = L17_57.requestSpawn
    L17_57(L18_58)
  end
  repeat
    L17_57 = wait
    L17_57()
    L17_57 = enmgen_03
    L18_58 = L17_57
    L17_57 = L17_57.isPrepared
    L17_57 = L17_57(L18_58)
  until L17_57
  L17_57 = enmgen_03
  L18_58 = L17_57
  L17_57 = L17_57.requestIdlingEnemy
  L17_57(L18_58, L19_59)
  L17_57 = enmgen_03
  L18_58 = L17_57
  L17_57 = L17_57.setEnemyMarker
  L17_57(L18_58, L19_59)
  L17_57 = Player
  L18_58 = L17_57
  L17_57 = L17_57.setStay
  L17_57(L18_58, L19_59)
  L17_57 = Fn_lookAtObject
  L18_58 = "locator2_nevi_03_01"
  L17_57 = L17_57(L18_58)
  L18_58 = waitSeconds
  L18_58(L19_59)
  L18_58 = Fn_captionViewWait
  L18_58(L19_59)
  L18_58 = L17_57.abort
  L18_58(L19_59)
  L18_58 = waitSeconds
  L18_58(L19_59)
  L18_58 = Player
  L18_58 = L18_58.setStay
  L18_58(L19_59, L20_60)
  L18_58 = spGemCreate
  L18_58()
  L18_58 = enmgen_03
  L18_58 = L18_58.requestIdlingEnemy
  L18_58(L19_59, L20_60)
  L18_58 = enmgen_03
  L18_58 = L18_58.setEnemyMarker
  L18_58(L19_59, L20_60)
  L18_58 = Fn_tutorialCaption
  L18_58(L19_59)
  L18_58 = {}
  L18_58.invincible = false
  for L22_62 = 1, 3 do
    L23_63 = enmbra_03
    L24_64 = findGameObject2
    L25_65 = "EnemyBrain"
    L26_66 = string
    L26_66 = L26_66.format
    L27_67 = "stalker_%02d"
    L28_68 = L22_62
    L34_74 = L26_66(L27_67, L28_68)
    L24_64 = L24_64(L25_65, L26_66, L27_67, L28_68, L29_69, L30_70, L31_71, L32_72, L33_73, L34_74, L26_66(L27_67, L28_68))
    L23_63[L22_62] = L24_64
  end
  function L22_62()
    local L0_80, L1_81, L2_82, L3_83
    repeat
      L0_80()
    until L0_80
    for L3_83 = 1, 6 do
      enmbra_03[3]:move({
        string.format("locator2_nevi_03_03_move_pos_%02d", L3_83)
      }, L18_58)
      repeat
        wait()
      until enmbra_03[3]:isMoveEnd()
      waitSeconds(6)
    end
    L0_80(L1_81)
  end
  L22_62 = HUD
  L23_63 = L22_62
  L22_62 = L22_62.counter999SetIcon
  L24_64 = HUD
  L24_64 = L24_64.kCount99_99IconType_Question
  L22_62(L23_63, L24_64)
  L22_62 = HUD
  L23_63 = L22_62
  L22_62 = L22_62.counter999SetTextID
  L24_64 = "ep09_09016"
  L22_62(L23_63, L24_64)
  L22_62 = HUD
  L23_63 = L22_62
  L22_62 = L22_62.counter999SetNum
  L24_64 = 0
  L22_62(L23_63, L24_64)
  L22_62 = HUD
  L23_63 = L22_62
  L22_62 = L22_62.counter999SetVisible
  L24_64 = true
  L22_62(L23_63, L24_64)
  L22_62 = findGameObject2
  L23_63 = "Sensor"
  L24_64 = "cubesensor2_01"
  L22_62 = L22_62(L23_63, L24_64)
  L24_64 = L22_62
  L23_63 = L22_62.getWorldPos
  L23_63 = L23_63(L24_64)
  L24_64 = {}
  L25_65 = nil
  L26_66 = invokeTask
  function L27_67()
    local L0_84, L1_85, L2_86, L3_87
    repeat
      L0_84()
      for L3_87 = 1, 3 do
        L25_65 = findGameObject2("Puppet", string.format("stalker_%02d", L3_87))
        if L25_65 ~= nil then
          L24_64[L3_87] = L23_63:DistanceTo(L25_65:getWorldPos())
        end
      end
      if L0_84 ~= nil then
        L0_84(L1_85)
      end
      if L0_84 ~= nil then
        L0_84(L1_85, L2_86)
      end
    until L0_84
  end
  L26_66 = L26_66(L27_67)
  L27_67 = invokeTask
  function L28_68()
    repeat
      wait()
    until enmgen2_nevi_03:getEnemyDeadNum() >= 1
    Fn_tutorialCaptionKill()
  end
  L27_67 = L27_67(L28_68)
  L28_68 = invokeTask
  function L29_69()
    repeat
      repeat
        wait()
      until enmgen2_nevi_03:isEnemyAllDead()
      if _isSuccess == nil then
        _isSuccess = true
      end
      wait()
    until _isSuccess
  end
  L28_68(L29_69)
  repeat
    L28_68 = _isSuccess
    if L28_68 == false then
      L29_69 = L26_66
      L28_68 = L26_66.isRunning
      L28_68 = L28_68(L29_69)
      if L28_68 then
        L29_69 = L26_66
        L28_68 = L26_66.abort
        L28_68(L29_69)
      end
      if L19_59 ~= nil then
        L29_69 = L19_59
        L28_68 = L19_59.isRunning
        L28_68 = L28_68(L29_69)
        if L28_68 then
          L29_69 = L19_59
          L28_68 = L19_59.abort
          L28_68(L29_69)
        end
      end
      if L20_60 ~= nil then
        L29_69 = L20_60
        L28_68 = L20_60.isRunning
        L28_68 = L28_68(L29_69)
        if L28_68 then
          L29_69 = L20_60
          L28_68 = L20_60.abort
          L28_68(L29_69)
        end
      end
      if L21_61 ~= nil then
        L29_69 = L21_61
        L28_68 = L21_61.isRunning
        L28_68 = L28_68(L29_69)
        if L28_68 then
          L29_69 = L21_61
          L28_68 = L21_61.abort
          L28_68(L29_69)
        end
      end
      L28_68 = restartLithographTheme
      L28_68()
    end
    L28_68 = wait
    L28_68()
    L28_68 = _isSuccess
  until L28_68
  L28_68 = Fn_captionView
  L29_69 = "ep09_15005"
  L28_68(L29_69)
  L29_69 = L27_67
  L28_68 = L27_67.abort
  L28_68(L29_69)
  L27_67 = nil
  L29_69 = L26_66
  L28_68 = L26_66.isRunning
  L28_68 = L28_68(L29_69)
  if L28_68 then
    L29_69 = L26_66
    L28_68 = L26_66.abort
    L28_68(L29_69)
  end
  L28_68 = HUD
  L29_69 = L28_68
  L28_68 = L28_68.counter999IsVisible
  L28_68 = L28_68(L29_69)
  if L28_68 then
    L28_68 = HUD
    L29_69 = L28_68
    L28_68 = L28_68.counter999SetVisible
    L30_70 = false
    L28_68(L29_69, L30_70)
  end
  L28_68 = Fn_tutorialCaptionKill
  L28_68()
  L28_68 = waitSeconds
  L29_69 = 3
  L28_68(L29_69)
  _isSuccess = nil
  L28_68 = enmgen_04
  if L28_68 ~= nil then
    L28_68 = enmgen_04
    L29_69 = L28_68
    L28_68 = L28_68.requestSpawn
    L28_68(L29_69)
  end
  repeat
    L28_68 = wait
    L28_68()
    L28_68 = enmgen_04
    L29_69 = L28_68
    L28_68 = L28_68.isPrepared
    L28_68 = L28_68(L29_69)
  until L28_68
  L28_68 = enmgen_04
  L29_69 = L28_68
  L28_68 = L28_68.requestIdlingEnemy
  L30_70 = true
  L28_68(L29_69, L30_70)
  L28_68 = enmgen_04
  L29_69 = L28_68
  L28_68 = L28_68.setEnemyMarker
  L30_70 = false
  L28_68(L29_69, L30_70)
  L28_68 = Player
  L29_69 = L28_68
  L28_68 = L28_68.setStay
  L30_70 = true
  L28_68(L29_69, L30_70)
  L28_68 = Fn_lookAtObject
  L29_69 = "locator2_nevi_04_01"
  L28_68 = L28_68(L29_69)
  L29_69 = waitSeconds
  L30_70 = 1
  L29_69(L30_70)
  L29_69 = Fn_captionViewWait
  L30_70 = "ep09_15006"
  L29_69(L30_70)
  L30_70 = L28_68
  L29_69 = L28_68.abort
  L29_69(L30_70)
  L29_69 = waitSeconds
  L30_70 = 0.3
  L29_69(L30_70)
  L29_69 = Player
  L30_70 = L29_69
  L29_69 = L29_69.setStay
  L31_71 = false
  L29_69(L30_70, L31_71)
  L29_69 = spGemCreate
  L29_69()
  L29_69 = enmgen_04
  L30_70 = L29_69
  L29_69 = L29_69.requestIdlingEnemy
  L31_71 = false
  L29_69(L30_70, L31_71)
  L29_69 = enmgen_04
  L30_70 = L29_69
  L29_69 = L29_69.setEnemyMarker
  L31_71 = true
  L29_69(L30_70, L31_71)
  L29_69 = Fn_tutorialCaption
  L30_70 = "mars_grab"
  L29_69(L30_70)
  L29_69 = findGameObject2
  L30_70 = "EnemyBrain"
  L31_71 = "guardcore_01"
  L29_69 = L29_69(L30_70, L31_71)
  enmbra_04 = L29_69
  L29_69 = {}
  L29_69.invincible = false
  L30_70 = invokeTask
  function L31_71()
    repeat
      wait()
    until enmbra_04:isReadyEnemy()
    enmbra_04:move({
      "locator2_nevi_04_01_move_pos"
    }, L29_69)
    repeat
      wait()
    until enmbra_04:isMoveEnd()
    enmbra_04:endScriptAction()
  end
  L30_70 = L30_70(L31_71)
  L31_71 = HUD
  L32_72 = L31_71
  L31_71 = L31_71.counter999SetIcon
  L33_73 = HUD
  L33_73 = L33_73.kCount99_99IconType_Question
  L31_71(L32_72, L33_73)
  L31_71 = HUD
  L32_72 = L31_71
  L31_71 = L31_71.counter999SetTextID
  L33_73 = "ep09_09016"
  L31_71(L32_72, L33_73)
  L31_71 = HUD
  L32_72 = L31_71
  L31_71 = L31_71.counter999SetNum
  L33_73 = 0
  L31_71(L32_72, L33_73)
  L31_71 = HUD
  L32_72 = L31_71
  L31_71 = L31_71.counter999SetVisible
  L33_73 = true
  L31_71(L32_72, L33_73)
  L31_71 = findGameObject2
  L32_72 = "Sensor"
  L33_73 = "cubesensor2_01"
  L31_71 = L31_71(L32_72, L33_73)
  L33_73 = L31_71
  L32_72 = L31_71.getWorldPos
  L32_72 = L32_72(L33_73)
  L33_73 = {}
  L34_74 = nil
  invokeTask(function()
    repeat
      repeat
        wait()
      until enmgen2_nevi_04:isEnemyAllDead()
      if _isSuccess == nil then
        _isSuccess = true
      end
      wait()
    until _isSuccess
  end)
  repeat
    if _isSuccess == false then
      if invokeTask(function()
        local L0_88, L1_89, L2_90, L3_91
        repeat
          L0_88()
          for L3_91 = 1, 2 do
            L34_74 = findGameObject2("Puppet", "guardcore_" .. string.format("%02d", L3_91))
            if L34_74 ~= nil then
              L33_73[L3_91] = L32_72:DistanceTo(L34_74:getWorldPos())
            end
          end
          if L0_88 ~= nil then
            L0_88(L1_89)
          end
          if L0_88 ~= nil then
            L0_88(L1_89, L2_90)
          end
        until L0_88
      end):isRunning() then
        invokeTask(function()
          local L0_92, L1_93, L2_94, L3_95
          repeat
            L0_92()
            for L3_95 = 1, 2 do
              L34_74 = findGameObject2("Puppet", "guardcore_" .. string.format("%02d", L3_95))
              if L34_74 ~= nil then
                L33_73[L3_95] = L32_72:DistanceTo(L34_74:getWorldPos())
              end
            end
            if L0_92 ~= nil then
              L0_92(L1_93)
            end
            if L0_92 ~= nil then
              L0_92(L1_93, L2_94)
            end
          until L0_92
        end):abort()
      end
      if L30_70 ~= nil and L30_70:isRunning() then
        L30_70:abort()
      end
      if guardcore_move_task_02 ~= nil and guardcore_move_task_02:isRunning() then
        guardcore_move_task_02:abort()
      end
      restartLithographTheme()
    end
    wait()
  until _isSuccess
  Fn_captionView("ep09_15007")
  Fn_pcSensorOff("pccubesensor2_caution_litho_07")
  Fn_pcSensorOff("pccubesensor2_catwarp_litho_07")
  return_task:abort()
  return_task = nil
  invokeTask(function()
    waitSeconds(10)
    Fn_tutorialCaptionKill()
  end):abort()
  if invokeTask(function()
    local L0_96, L1_97, L2_98, L3_99
    repeat
      L0_96()
      for L3_99 = 1, 2 do
        L34_74 = findGameObject2("Puppet", "guardcore_" .. string.format("%02d", L3_99))
        if L34_74 ~= nil then
          L33_73[L3_99] = L32_72:DistanceTo(L34_74:getWorldPos())
        end
      end
      if L0_96 ~= nil then
        L0_96(L1_97)
      end
      if L0_96 ~= nil then
        L0_96(L1_97, L2_98)
      end
    until L0_96
  end):isRunning() then
    invokeTask(function()
      local L0_100, L1_101, L2_102, L3_103
      repeat
        L0_100()
        for L3_103 = 1, 2 do
          L34_74 = findGameObject2("Puppet", "guardcore_" .. string.format("%02d", L3_103))
          if L34_74 ~= nil then
            L33_73[L3_103] = L32_72:DistanceTo(L34_74:getWorldPos())
          end
        end
        if L0_100 ~= nil then
          L0_100(L1_101)
        end
        if L0_100 ~= nil then
          L0_100(L1_101, L2_102)
        end
      until L0_100
    end):abort()
  end
  if HUD:counter999IsVisible() then
    HUD:counter999SetVisible(false)
  end
  Fn_tutorialCaptionKill()
  waitSeconds(3)
  if L4_44 ~= nil then
    L4_44:playOut()
    repeat
      wait()
    until L4_44:isOutEnd()
    L4_44:try_term()
  end
  _isSuccess = nil
  Fn_setBgmPoint("event", "battle_end")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_sendEventComSb("synchroArea")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_104, L1_105
end
function restartLithographTheme()
  if HUD:counter999IsVisible() then
    HUD:counter999SetVisible(false)
  end
  GameDatabase:set(ggd.EventFlags__ep09__flag01, 1)
  Fn_captionViewEnd()
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function cubesensor2_01_OnEnter(A0_106, A1_107)
  print("sensor_in")
  invokeTask(function()
    print("gameobj name " .. A1_107:getName())
    if A1_107:getName() ~= "player" then
      _isSuccess = false
    end
  end)
end
function cubesensor2_01_OnLeave(A0_108, A1_109)
end
