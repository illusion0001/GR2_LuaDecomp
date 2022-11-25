dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_isdead = false
_half = false
_secondHalf = false
_is_kalidead = false
_is_durgadead = false
_is_fatalend = false
_is_damagedkali = false
_begin_fatal = false
_warp_caption_flag = false
function Initialize()
  local L0_0, L1_1
end
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
      ai_spawn_option = "Kali/kali_boss_ep18f"
    }
  },
  onUpdate = function(A0_2)
    local L1_3
  end,
  onEnter = function(A0_4)
    local L1_5
  end,
  onLeave = function(A0_6)
    local L1_7
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    _is_kalidead = true
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
  getEnemyName = function(A0_15, A1_16)
    local L2_17
    L2_17 = A0_15.spawnSet
    L2_17 = L2_17[A1_16]
    L2_17 = L2_17.name
    return L2_17
  end
}
enmgen2_durga_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "durga",
      locator = "locator_01",
      name = "durga",
      ai_spawn_option = "Durga/durga_boss_ep18f"
    }
  },
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
    A0_26:getSpecTable().enemyDeadNum = A0_26:getSpecTable().enemyDeadNum + 1
    _is_durgadead = true
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
function Ingame()
  local L0_34, L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42, L9_43, L10_44, L11_45
  L0_34 = findGameObject2
  L1_35 = "EnemyBrain"
  L2_36 = "kali"
  L0_34 = L0_34(L1_35, L2_36)
  L1_35 = findGameObject2
  L2_36 = "EnemyBrain"
  L3_37 = "durga"
  L1_35 = L1_35(L2_36, L3_37)
  L3_37 = L0_34
  L2_36 = L0_34.setVisibleBossMarker
  L4_38 = true
  L2_36(L3_37, L4_38)
  L3_37 = L1_35
  L2_36 = L1_35.setVisibleBossMarker
  L4_38 = true
  L2_36(L3_37, L4_38)
  L2_36 = findGameObject2
  L3_37 = "EnemyGenerator"
  L4_38 = "enmgen2_kali_01"
  L2_36 = L2_36(L3_37, L4_38)
  L3_37 = findGameObject2
  L4_38 = "EnemyGenerator"
  L5_39 = "enmgen2_durga_01"
  L3_37 = L3_37(L4_38, L5_39)
  L5_39 = L2_36
  L4_38 = L2_36.requestIdlingEnemy
  L6_40 = true
  L4_38(L5_39, L6_40)
  L5_39 = L3_37
  L4_38 = L3_37.requestIdlingEnemy
  L6_40 = true
  L4_38(L5_39, L6_40)
  L4_38 = Fn_lookAtObject
  L5_39 = "locator2_look_01"
  L4_38 = L4_38(L5_39)
  L5_39 = Fn_disappearNpc
  L6_40 = "ep18_kaji"
  L7_41 = 0
  L5_39(L6_40, L7_41)
  L5_39 = Fn_spawnSuppotCrow
  L6_40 = false
  L7_41 = Supporter
  L7_41 = L7_41.FirstAction
  L7_41 = L7_41.Ground
  L5_39 = L5_39(L6_40, L7_41, L8_42, L9_43)
  L7_41 = L5_39
  L6_40 = L5_39.getBrain
  L6_40 = L6_40(L7_41)
  L7_41 = L6_40.setIdling
  L7_41(L8_42, L9_43)
  L7_41 = HPgauge
  L7_41(L8_42)
  L7_41 = HPgauge
  L7_41(L8_42)
  L7_41 = {}
  L7_41 = L8_42
  for L11_45, _FORV_12_ in L8_42(L9_43) do
    L7_41[L11_45]:setVisiblePermission(false)
    L7_41[L11_45]:setCollidablePermission(false)
  end
  L11_45 = false
  L9_43(L10_44, L11_45)
  L11_45 = false
  L9_43(L10_44, L11_45)
  L11_45 = L9_43
  L10_44(L11_45, false)
  L11_45 = L9_43
  L10_44(L11_45, false)
  L11_45 = L4_38
  L10_44(L11_45)
  L10_44()
  L11_45 = "ep18_05000"
  L10_44(L11_45)
  L11_45 = L2_36
  L10_44(L11_45, false)
  L11_45 = L3_37
  L10_44(L11_45, false)
  L11_45 = L6_40
  L10_44(L11_45, false)
  L10_44()
  L10_44()
  while true do
    if not L10_44 then
      L10_44()
    end
  end
  _secondHalf = true
  L11_45 = "ep18_00420k"
  L10_44(L11_45)
  L11_45 = "ep18_05008"
  L10_44(L11_45)
  L11_45 = L0_34
  L10_44(L11_45, false)
  while true do
    if not L10_44 then
      L10_44()
    end
  end
  L11_45 = L0_34
  L10_44(L11_45, true)
  L11_45 = L1_35
  L10_44(L11_45, true)
  L11_45 = L10_44
  L10_44(L11_45, "pc1_073_always")
  L11_45 = "ep18_05009"
  L10_44(L11_45)
  L11_45 = L10_44
  L10_44(L11_45, "cro_233")
  L11_45 = "ep18_05010"
  L10_44(L11_45)
  _begin_fatal = true
  L10_44()
  L11_45 = kFATAL_TYPE_EMP
  L11_45 = findGameObject2
  L11_45 = L11_45("Puppet", "durga")
  L10_44:set(L11_45, "bn_root", true, 30)
  L10_44:run()
  HUD:enemymarkerSetRangeMin(30)
  repeat
    wait()
  until L10_44:isFatalFinish()
  L10_44:kill()
  _is_fatalend = true
  Player:setNoDamageMode(Player.kNoDamage_All, true)
  Player:setControl(Player.kControl_All, false)
  Fn_whiteout(0.3)
  HUD:enemymarkerSetRangeMin()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function HPgauge(A0_46)
  invokeTask(function()
    local L0_47, L1_48, L2_49
    L0_47 = findGameObject2
    L1_48 = "Puppet"
    L2_49 = A0_46
    L0_47 = L0_47(L1_48, L2_49)
    L1_48 = findGameObject2
    L2_49 = "EnemyBrain"
    L1_48 = L1_48(L2_49, A0_46)
    L2_49 = nil
    if A0_46 == "kali" then
      L2_49 = HUD:createBossHpGauge({
        obj = L0_47,
        text = "ui_boss_hp_05"
      })
    else
      L2_49 = HUD:createBossHpGauge({
        obj = L0_47,
        text = "ui_boss_hp_06"
      })
    end
    L2_49:setActive(true)
    print("boss_gauge:setActive(true)")
    print(A0_46 .. " Health Is", L1_48:getHealth())
    while _is_fatalend == false and not _isdead and (_secondHalf ~= true or A0_46 ~= "kali") do
      if L1_48:getHealth() / L1_48:getMaxHealth() <= 0.5 and _half == false then
        _half = true
      elseif not (L1_48:getHealth() / L1_48:getMaxHealth() <= 0.1) then
        L2_49:setHp((L1_48:getHealth() + L1_48:getMaxHealth() * 4) / (L1_48:getMaxHealth() * 5))
        if A0_46 == "kali" and L1_48:getHealth() < L1_48:getMaxHealth() and _is_damagedkali == false then
          _is_damagedkali = true
        end
        wait()
      end
    end
    if A0_46 == "kali" then
      L2_49:setActive(false)
    elseif A0_46 == "durga" then
      _isdead = true
      repeat
        wait()
      until _begin_fatal == true
      L2_49:setActive(false)
    end
    findGameObject2("EnemyBrain", A0_46):setInvincibility(true)
    print("boss_gauge:setActive(false)")
  end)
end
function DamageType(A0_50, A1_51)
  local L2_52
  L2_52 = Fn_findNpc
  L2_52 = L2_52(A0_50)
  print(L2_52)
  L2_52:getBrain():npcChangeCreateParam(0, A1_51)
end
function caption()
  invokeTask(function()
    local L0_53, L1_54, L2_55
    L0_53 = 0
    L1_54 = 0
    L2_55 = 0
    while _half == false do
      if L1_54 >= 5 and L0_53 == 0 then
        Sound:playSE("pc1_529", 1)
        Fn_captionViewWait("ep18_05001", 4)
        L0_53 = 1
      elseif L1_54 >= 10 and L0_53 == 1 then
        Sound:playSE("pc1_531", 1)
        Fn_captionViewWait("ep18_05002", 4)
        L0_53 = 2
      elseif L1_54 >= 10 and L0_53 == 2 then
        Fn_captionViewWait("ep18_05003")
        L0_53 = 3
      elseif L1_54 >= 20 and L0_53 == 3 and L2_55 >= 5 then
        Sound:playSE("cro_263", 1)
        Fn_captionViewWait("ep18_05004")
        L0_53 = 4
      elseif L1_54 >= 10 and L0_53 == 4 then
        Sound:playSE("kal_040", 1)
        Fn_captionViewWait("ep18_05005")
        L0_53 = 5
      end
      waitSeconds(1)
      L1_54 = L1_54 + 1
      if _is_damagedkali == true then
        L2_55 = L2_55 + 1
      end
    end
    Fn_captionViewEnd()
  end)
end
function caption2()
  invokeTask(function()
    local L0_56, L1_57
    L0_56 = 0
    L1_57 = 0
    while true do
      if L1_57 == 15 and L0_56 == 0 then
        Fn_captionViewWait("ep18_05006", 5)
        L0_56 = 1
      elseif L1_57 == 30 and L0_56 == 1 then
        Fn_captionViewWait("ep18_05007", 5)
        L0_56 = 2
      end
      waitSeconds(1)
      L1_57 = L1_57 + 1
    end
  end)
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_58
  L1_58 = _warp_caption_flag
  if L1_58 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep18_05011")
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
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Player:setControl(Player.kControl_All, true)
  end
end
