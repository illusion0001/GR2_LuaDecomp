dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Common/ElektricityCommon.lua")
_boss_gauge = nil
_ele_pup = nil
_sdemo = nil
_isInSensor = false
_warp_caption_flag = false
enmgen2_elektricity = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity",
      locator = "locator_01",
      name = "elektricity",
      ai_spawn_option = "Elektricity/elektricity_ep24_c"
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
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21
  L0_16 = clockTowerBreak
  L0_16()
  L0_16 = Fn_loadEventData
  L1_17 = "evx/dt_brk_eff_ep25"
  L2_18 = "evarea2_dt_a_root"
  L3_19 = true
  L0_16(L1_17, L2_18, L3_19)
  L0_16 = SDemo
  L0_16 = L0_16.create
  L1_17 = "ep24_c_01"
  L0_16 = L0_16(L1_17)
  _sdemo = L0_16
  L0_16 = Vector
  L1_17 = 4.438375
  L2_18 = 217.963837
  L3_19 = 472.207642
  L0_16 = L0_16(L1_17, L2_18, L3_19)
  L1_17 = Vector
  L2_18 = 7.50666
  L3_19 = 219.847748
  L4_20 = 465.06369
  L1_17 = L1_17(L2_18, L3_19, L4_20)
  L2_18 = _sdemo
  L3_19 = L2_18
  L2_18 = L2_18.set
  L4_20 = L0_16
  L5_21 = L1_17
  L2_18(L3_19, L4_20, L5_21)
  L2_18 = _sdemo
  L3_19 = L2_18
  L2_18 = L2_18.setCameraParam
  L4_20 = nil
  L5_21 = 0.1
  L2_18(L3_19, L4_20, L5_21, {deg = 51})
  L2_18 = Fn_cityPlaceName
  L3_19 = false
  L2_18(L3_19)
  L2_18 = findGameObject2
  L3_19 = "Node"
  L4_20 = "locator2_xii_start_pos"
  L2_18 = L2_18(L3_19, L4_20)
  L3_19 = L2_18
  L2_18 = L2_18.getWorldTransform
  L3_19 = L2_18(L3_19)
  L4_20 = Fn_warpXii
  L5_21 = L2_18
  L4_20(L5_21, L3_19)
  L4_20 = Fn_naviKill
  L4_20()
end
function Ingame()
  local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27
  L0_22 = {}
  L0_22 = L1_23
  for L4_26, L5_27 in L1_23(L2_24) do
    L0_22[L4_26]:setVisiblePermission(false)
    L0_22[L4_26]:setCollidablePermission(false)
  end
  L4_26 = false
  L2_24(L3_25, L4_26)
  L4_26 = false
  L2_24(L3_25, L4_26)
  L4_26 = L2_24
  L5_27 = false
  L3_25(L4_26, L5_27)
  L4_26 = L2_24
  L5_27 = false
  L3_25(L4_26, L5_27)
  function L4_26()
    local L0_28, L1_29, L2_30, L3_31
    for L3_31 = 1, 24 do
      Fn_createEffect("exp", "ef_ev_smk_04", findGameObject2("Node", "locator2_smk_" .. string.format("%02d", L3_31)):getWorldPos(), false)
      if L3_31 % 5 == 0 then
        wait()
      end
    end
    for L3_31 = 1, 20 do
      Fn_createEffect("exp", "ef_ev_fir_04", findGameObject2("Node", "locator2_fir_" .. string.format("%02d", L3_31)):getWorldPos(), false)
      if L3_31 % 6 == 0 then
        wait()
      end
    end
  end
  L3_25(L4_26)
  function L4_26()
    setMissile()
    respawnMissile()
    missileNaviSet(true)
  end
  L3_25(L4_26)
  L4_26 = "EnemyBrain"
  L5_27 = "elektricity"
  L5_27 = L3_25
  L4_26 = L3_25.skipSpawnMotion
  L4_26(L5_27, true)
  L5_27 = L3_25
  L4_26 = L3_25.setVisibleBossMarker
  L4_26(L5_27, true)
  L4_26 = findGameObject2
  L5_27 = "EnemyGenerator"
  L4_26 = L4_26(L5_27, "enmgen2_elektricity")
  L5_27 = L4_26.requestSpawn
  L5_27(L4_26)
  L5_27 = Player
  L5_27 = L5_27.setAction
  L5_27(L5_27, Player.kAction_Float)
  L5_27 = findGameObject2
  L5_27 = L5_27("Puppet", "elektricity")
  _ele_pup = L5_27
  L5_27 = Fn_setFeline
  L5_27(true, false, false, true)
  L5_27 = Fn_userCtrlOff
  L5_27()
  L5_27 = Player
  L5_27 = L5_27.setFelineMPConsumingRate
  L5_27(L5_27, Player.kFelMPConsCat_atkShikaku, 2)
  L5_27 = Player
  L5_27 = L5_27.setFelineMPConsumingRate
  L5_27(L5_27, Player.kFelMPConsCat_atkSankaku, 2)
  L5_27 = Fn_setBgmPoint
  L5_27("battle", "bgmPoint4")
  L5_27 = sendSetElekPupTbl
  L5_27()
  L5_27 = _sdemo
  L5_27 = L5_27.play
  L5_27(L5_27)
  L5_27 = Fn_disableCostumeChange
  L5_27(true)
  L5_27 = Fn_missionStart
  L5_27()
  L5_27 = Fn_missionView
  L5_27("ep24_02000")
  L5_27 = FatalMarker
  L5_27 = L5_27.create
  L5_27 = L5_27(kFATAL_TYPE_ACT, false, false, _boss_gauge)
  invokeTask(function()
    repeat
      wait()
    until Player:isFeline() == false
    Player:setFelineMPConsumingRate(Player.kFelMPConsCat_atkShikaku, 1)
    Player:setFelineMPConsumingRate(Player.kFelMPConsCat_atkSankaku, 1)
  end)
  invokeTask(function()
    garuda_flag = false
    while L5_27:isFatalFinish() == false do
      if garuda_flag == true and Player:isFeline() == false then
        garuda_flag = false
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 0 and garuda_flag == false and Player:isFeline() then
        print("\227\130\187\227\131\188\227\131\150\227\131\135\227\131\188\227\130\191", GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01))
        Fn_captionView("ep24_02002")
        garuda_flag = true
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 1)
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 1 and garuda_flag == false and Player:isFeline() then
        print("\227\130\187\227\131\188\227\131\150\227\131\135\227\131\188\227\130\191", GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01))
        Fn_captionView("ep24_02001")
        garuda_flag = true
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 2)
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 2 and garuda_flag == false and Player:isFeline() then
        print("\227\130\187\227\131\188\227\131\150\227\131\135\227\131\188\227\130\191", GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01))
        Fn_captionView("ep24_01026")
        garuda_flag = true
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 3)
      elseif GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01) == 3 and garuda_flag == false and Player:isFeline() then
        print("\227\130\187\227\131\188\227\131\150\227\131\135\227\131\188\227\130\191", GameDatabase:get(ggd.Savedata__EventFlags__ep24__flag01))
        Fn_captionView("ep24_00136")
        garuda_flag = true
        GameDatabase:set(ggd.Savedata__EventFlags__ep24__flag01, 4)
        break
      end
      wait()
    end
  end)
  Fn_userCtrlOn()
  gravityGemCreate()
  breakLightningRod()
  HPgauge("elektricity")
  _sdemo:stop()
  L5_27:set(_ele_pup, "bn_root", false)
  L5_27:run()
  HUD:enemymarkerSetRangeMin(30)
  repeat
    wait()
  until L5_27:isFatalFinish()
  L5_27:kill()
  L5_27 = nil
  if not Player:isFeline() then
    Fn_setFeline(true, true, false, false)
    wait(40)
  end
  Player:setNoDamageMode(Player.kNoDamage_All, true)
  Player:setControl(Player.kControl_All, false)
  Fn_whiteout(0.3)
  HUD:enemymarkerSetRangeMin()
  _boss_gauge:setActive(false)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function gravityGemCreate()
  invokeTask(function()
    local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45
    L0_32 = 0
    L1_33 = math
    L1_33 = L1_33.random
    L2_34 = 1
    L3_35 = 16
    L1_33 = L1_33(L2_34, L3_35)
    L2_34 = nil
    L3_35 = {}
    while L0_32 <= 30 do
      L4_36 = _isInSensor
      if L4_36 then
        L4_36 = createGameObject2
        L5_37 = "Gem"
        L4_36 = L4_36(L5_37)
        L6_38 = L4_36
        L5_37 = L4_36.setGemModelNo
        L7_39 = 4
        L5_37(L6_38, L7_39)
        L5_37 = Fn_getPcPosRot
        L6_38 = L5_37()
        L7_39 = math
        L7_39 = L7_39.random
        L8_40 = -5
        L9_41 = 5
        L7_39 = L7_39(L8_40, L9_41)
        L8_40 = math
        L8_40 = L8_40.random
        L9_41 = -25
        L10_42 = 25
        L8_40 = L8_40(L9_41, L10_42)
        L9_41 = math
        L9_41 = L9_41.random
        L10_42 = -5
        L11_43 = 5
        L9_41 = L9_41(L10_42, L11_43)
        if L1_33 == 1 then
          L10_42 = Vector
          L11_43 = 18 + L7_39
          L12_44 = 3 + L8_40
          L13_45 = 0 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 2 then
          L10_42 = Vector
          L11_43 = -18 + L7_39
          L12_44 = 4 + L8_40
          L13_45 = 0 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 3 then
          L10_42 = Vector
          L11_43 = 0 + L7_39
          L12_44 = -3 + L8_40
          L13_45 = 18 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 4 then
          L10_42 = Vector
          L11_43 = 0 + L7_39
          L12_44 = -4 + L8_40
          L13_45 = -18 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 5 then
          L10_42 = Vector
          L11_43 = 15 + L7_39
          L12_44 = 1 + L8_40
          L13_45 = 15 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 6 then
          L10_42 = Vector
          L11_43 = -15 + L7_39
          L12_44 = -1 + L8_40
          L13_45 = -15 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 7 then
          L10_42 = Vector
          L11_43 = -15 + L7_39
          L12_44 = 2 + L8_40
          L13_45 = 15 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 8 then
          L10_42 = Vector
          L11_43 = 15 + L7_39
          L12_44 = -2 + L8_40
          L13_45 = -15 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 9 then
          L10_42 = Vector
          L11_43 = 17 + L7_39
          L12_44 = 3 + L8_40
          L13_45 = 5 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 10 then
          L10_42 = Vector
          L11_43 = -17 + L7_39
          L12_44 = 4 + L8_40
          L13_45 = -5 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 11 then
          L10_42 = Vector
          L11_43 = 5 + L7_39
          L12_44 = -3 + L8_40
          L13_45 = 17 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 12 then
          L10_42 = Vector
          L11_43 = -5 + L7_39
          L12_44 = -4 + L8_40
          L13_45 = -17 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 13 then
          L10_42 = Vector
          L11_43 = 17 + L7_39
          L12_44 = 3 + L8_40
          L13_45 = -5 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 14 then
          L10_42 = Vector
          L11_43 = -17 + L7_39
          L12_44 = 4 + L8_40
          L13_45 = 5 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 15 then
          L10_42 = Vector
          L11_43 = -5 + L7_39
          L12_44 = -3 + L8_40
          L13_45 = 17 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        elseif L1_33 == 16 then
          L10_42 = Vector
          L11_43 = 5 + L7_39
          L12_44 = -4 + L8_40
          L13_45 = -17 + L9_41
          L10_42 = L10_42(L11_43, L12_44, L13_45)
          L2_34 = L5_37 + L10_42
        end
        L10_42 = Fn_getPcPosRot
        L11_43 = L10_42()
        L12_44 = Query
        L13_45 = L12_44
        L12_44 = L12_44.setEyeSightTransform
        L12_44(L13_45, L10_42, L11_43)
        L12_44 = Query
        L13_45 = L12_44
        L12_44 = L12_44.setEyeSightAngle
        L12_44(L13_45, Deg2Rad(45))
        L12_44 = Query
        L13_45 = L12_44
        L12_44 = L12_44.setEyeSightRange
        L12_44(L13_45, range)
        L12_44 = Query
        L13_45 = L12_44
        L12_44 = L12_44.raycastEyeSight
        L12_44 = L12_44(L13_45, L2_34)
        if not L12_44 then
          L13_45 = L4_36.setWorldPos
          L13_45(L4_36, L2_34)
          L13_45 = L4_36.setForceMove
          L13_45(L4_36)
          L13_45 = L4_36.setVisible
          L13_45(L4_36, true)
          L13_45 = L4_36.try_init
          L13_45(L4_36)
          L13_45 = L4_36.setVisibleBlockHalfSize
          L13_45(L4_36, 150)
          L13_45 = L4_36.waitForReadyAsync
          L13_45(L4_36, function()
            L4_36:try_start()
          end)
          L0_32 = L0_32 + 1
          L13_45 = print
          L13_45("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_33)
          L0_32 = L0_32 + 1
          if L0_32 > 4 then
            L13_45 = waitSeconds
            L13_45(20)
          end
          L13_45 = table
          L13_45 = L13_45.insert
          L13_45(L3_35, L4_36)
          while true do
            L13_45 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_35) do
              if L3_35[_FORV_17_]:isRunning() then
                L13_45 = L13_45 + 1
              end
            end
            if L13_45 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_45)
              break
            end
            wait(15)
          end
          L1_33 = L1_33 + 1
          if L1_33 >= 17 then
            L1_33 = 1
          end
        end
      else
      end
      L4_36 = wait
      L4_36()
    end
  end)
end
function HPgauge(A0_46)
  local L1_47, L2_48
  L1_47 = findGameObject2
  L2_48 = "Puppet"
  L1_47 = L1_47(L2_48, A0_46)
  L2_48 = findGameObject2
  L2_48 = L2_48("EnemyBrain", A0_46)
  _boss_gauge = HUD:createBossHpGauge({obj = L1_47})
  _boss_gauge:setActive(true)
  invokeTask(function()
    print("Health Is", L2_48:getHealth())
    while true do
      _boss_gauge:setHp(L2_48:getHealth() / (L2_48:getMaxHealth() + L2_48:getMaxHealth()))
      wait()
    end
  end)
end
function breakLightningRod()
  local L0_49
  function L0_49(A0_50)
    local L1_51, L2_52
    L1_51 = A0_50.lightningRodName
    L2_52 = A0_50.gameObject
    breakLightningRod_com(L1_51, L2_52)
  end
  findGameObject2("EnemyBrain", "elektricity"):setEventListener("boss_eleReport", L0_49)
end
function sendSetElekPupTbl()
  local L0_53, L1_54
  L0_53 = {}
  L1_54 = {}
  L0_53[1] = findGameObject2("Puppet", "elektricity")
  L1_54[1] = findGameObject2("EnemyBrain", "elektricity")
  setElekPupTbl(L0_53, L1_54)
end
function pccubesensor2_elec_battle_03_OnEnter()
  local L0_55, L1_56
  _isInSensor = true
end
function pccubesensor2_elec_battle_03_OnLeave()
  local L0_57, L1_58
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_59
  L1_59 = _warp_caption_flag
  if L1_59 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep24_00138")
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
function clockTowerBreak()
  if not Fn_getBgsetHandle() then
    return nil
  end
  Fn_getBgsetHandle():sendEvent("clockTowerBraek")
end
function Finalize()
  if Fn_getPlayer() then
    Fn_setFeline(false, false, false, true)
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Player:setControl(Player.kControl_All, true)
    Player:setFelineMPConsumingRate(Player.kFelMPConsCat_atkShikaku, 1)
    Player:setFelineMPConsumingRate(Player.kFelMPConsCat_atkSankaku, 1)
  end
  Fn_disableCostumeChange(false)
end
