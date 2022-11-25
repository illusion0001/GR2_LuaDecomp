dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_032"
_floor_num = 32
_retry = false
_litho_success = nil
_litho_judgement_task = nil
_litho_time = 50
_litho_timer_task = nil
glass = {}
glass_max = 361
glass_break_time = 0.35
enmgen = {}
enmgen_max = 3
jammer_task = {}
jammer_attack = {}
jammer_max = 2
jammer_break_glass_01 = {
  136,
  143,
  152,
  153,
  154,
  157
}
jammer_break_glass_02 = {
  170,
  172,
  173,
  174,
  175,
  177
}
laser_task = {}
laser_attack = {}
laser_max = 7
laser_break_glass_01 = {
  263,
  266,
  267
}
laser_break_glass_02 = {
  339,
  340,
  341,
  342,
  343,
  344
}
_poison_in = false
_se_poison = nil
excludedActions = {}
lockOption = {}
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_01",
      name = "nevi_01_01"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_02",
      name = "nevi_01_02"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_03",
      name = "nevi_01_03"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_04",
      name = "nevi_01_04"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_05",
      name = "nevi_01_05"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_06",
      name = "nevi_01_06"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_07",
      name = "nevi_01_07"
    },
    {
      type = "stalker_mine_12",
      locator = "locator2_nevi_01_08",
      name = "nevi_01_08"
    },
    {
      type = "runner_mine_12",
      locator = "locator2_nevi_01_09",
      name = "nevi_01_09"
    },
    {
      type = "runner_mine_12",
      locator = "locator2_nevi_01_10",
      name = "nevi_01_10"
    }
  }
}
enmgen2_nevi_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "jammer_mine_02",
      locator = "locator2_nevi_02_01",
      name = "jammer_01"
    },
    {
      type = "jammer_mine_02",
      locator = "locator2_nevi_02_02",
      name = "jammer_02"
    }
  }
}
enmgen2_nevi_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_01",
      name = "lasercannon_01"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_02",
      name = "lasercannon_02"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_03",
      name = "lasercannon_03"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_04",
      name = "lasercannon_04"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_05",
      name = "lasercannon_05"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_06",
      name = "lasercannon_06"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_03_07",
      name = "lasercannon_07"
    }
  }
}
function InitializeBody()
  local L0_0, L1_1, L2_2, L3_3
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  for L3_3 = 1, glass_max do
    glass[L3_3] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_glass_%02d", L3_3))
    if glass[L3_3] ~= nil then
      if L3_3 < 4 then
        glass[L3_3]:pushJob("NJ", "S", 3, "B")
        glass[L3_3]:setEventListener("restore", restoreGlassCallbackSpecial)
      else
        glass[L3_3]:pushJob("NJ", "S", glass_break_time, "B")
        glass[L3_3]:setEventListener("restore", restoreGlassCallback)
      end
      glass[L3_3]:setAutoRestore(5)
      glass[L3_3]:setActive(false)
    end
  end
  L3_3 = Player
  L3_3 = L3_3.kAbility_Hang
  excludedActions = L0_0
  L0_0.rocket_jump_interlock = false
  lockOption = L0_0
end
function IngameBody()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12
  if L0_4 then
    L0_4()
    L0_4()
    L0_4()
    L0_4(L1_5)
    L0_4(L1_5)
  else
    for L3_7 = 1, enmgen_max do
      L4_8 = enmgen
      L5_9 = findGameObject2
      L6_10 = "EnemyGenerator"
      L7_11 = "enmgen2_nevi_0"
      L8_12 = L3_7
      L7_11 = L7_11 .. L8_12
      L5_9 = L5_9(L6_10, L7_11)
      L4_8[L3_7] = L5_9
      L4_8 = enmgen
      L4_8 = L4_8[L3_7]
      if L4_8 ~= nil then
        L4_8 = enmgen
        L4_8 = L4_8[L3_7]
        L5_9 = L4_8
        L4_8 = L4_8.setEnemyMarker
        L6_10 = false
        L4_8(L5_9, L6_10)
      end
    end
    if L0_4 then
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5)
      L0_4(L1_5, L2_6)
      L3_7 = true
      L0_4(L1_5, L2_6, L3_7)
      L0_4(L1_5, L2_6)
      for L3_7 = 1, glass_max do
        L4_8 = glass
        L5_9 = findGameObject2
        L6_10 = "GimmickBg"
        L7_11 = string
        L7_11 = L7_11.format
        L8_12 = "bg2_az3_himmeli_glass_%02d"
        L8_12 = L7_11(L8_12, L3_7)
        L5_9 = L5_9(L6_10, L7_11, L8_12, L7_11(L8_12, L3_7))
        L4_8[L3_7] = L5_9
        L4_8 = glass
        L4_8 = L4_8[L3_7]
        if L4_8 ~= nil then
          if L3_7 < 4 then
            L4_8 = glass
            L4_8 = L4_8[L3_7]
            L5_9 = L4_8
            L4_8 = L4_8.pushJob
            L6_10 = "NJ"
            L7_11 = "S"
            L8_12 = 3
            L4_8(L5_9, L6_10, L7_11, L8_12, "B")
            L4_8 = glass
            L4_8 = L4_8[L3_7]
            L5_9 = L4_8
            L4_8 = L4_8.setEventListener
            L6_10 = "restore"
            L7_11 = restoreGlassCallbackSpecial
            L4_8(L5_9, L6_10, L7_11)
          else
            L4_8 = glass
            L4_8 = L4_8[L3_7]
            L5_9 = L4_8
            L4_8 = L4_8.pushJob
            L6_10 = "NJ"
            L7_11 = "S"
            L8_12 = glass_break_time
            L4_8(L5_9, L6_10, L7_11, L8_12, "B")
            L4_8 = glass
            L4_8 = L4_8[L3_7]
            L5_9 = L4_8
            L4_8 = L4_8.setEventListener
            L6_10 = "restore"
            L7_11 = restoreGlassCallback
            L4_8(L5_9, L6_10, L7_11)
          end
          L4_8 = glass
          L4_8 = L4_8[L3_7]
          L5_9 = L4_8
          L4_8 = L4_8.setAutoRestore
          L6_10 = 5
          L4_8(L5_9, L6_10)
          L4_8 = glass
          L4_8 = L4_8[L3_7]
          L5_9 = L4_8
          L4_8 = L4_8.setActive
          L6_10 = false
          L4_8(L5_9, L6_10)
        end
      end
      _litho_success = nil
      if L0_4 ~= nil then
        L0_4(L1_5)
        _litho_timer_task = nil
      end
      if L0_4 ~= nil then
        L0_4(L1_5)
        _litho_judgement_task = nil
      end
      L0_4(L1_5)
    end
    L0_4()
    L0_4()
    L0_4()
    L0_4(L1_5)
    repeat
      L0_4()
    until L0_4
    for L3_7 = 1, glass_max do
      L4_8 = glass
      L4_8 = L4_8[L3_7]
      if L4_8 ~= nil then
        L4_8 = glass
        L4_8 = L4_8[L3_7]
        L5_9 = L4_8
        L4_8 = L4_8.setActive
        L6_10 = true
        L4_8(L5_9, L6_10)
      end
    end
    for L3_7 = 1, enmgen_max do
      L4_8 = enmgen
      L5_9 = findGameObject2
      L6_10 = "EnemyGenerator"
      L7_11 = "enmgen2_nevi_0"
      L8_12 = L3_7
      L7_11 = L7_11 .. L8_12
      L5_9 = L5_9(L6_10, L7_11)
      L4_8[L3_7] = L5_9
      L4_8 = enmgen
      L4_8 = L4_8[L3_7]
      if L4_8 ~= nil then
        L4_8 = enmgen
        L4_8 = L4_8[L3_7]
        L5_9 = L4_8
        L4_8 = L4_8.requestSpawn
        L4_8(L5_9)
      end
    end
    L0_4(L1_5, L2_6)
    L0_4(L1_5)
    L0_4()
    L0_4(L1_5, L2_6)
    L3_7 = nil
    L4_8 = true
    L0_4(L1_5, L2_6, L3_7, L4_8)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L0_4(L1_5)
    L3_7 = "pccubesensor2_goal_01"
    L8_12 = L1_5(L2_6, L3_7)
    L0_4(L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L1_5(L2_6, L3_7))
    L3_7 = 0
    L4_8 = 0
    L5_9 = _litho_time
    L6_10 = 0
    L0_4(L1_5, L2_6)
    L0_4(L1_5, L2_6)
    L0_4(L1_5)
    L0_4(L1_5)
    function L3_7()
      repeat
        L0_4 = findGameObject2("EnemyBrain", "jammer_01")
        wait()
      until L0_4 ~= nil
      L0_4:setEnableTarget(false)
      repeat
        wait()
      until jammer_attack[1]
      repeat
        if L0_4 ~= nil then
          L0_4:eventMessage("Attack")
        end
        waitSeconds(0.5)
        for _FORV_3_ = 1, table.maxn(jammer_break_glass_01) do
          requestGlassBreak(jammer_break_glass_01[_FORV_3_])
        end
        waitSeconds(5)
      until _litho_success ~= nil
    end
    L1_5[1] = L2_6
    L3_7 = invokeTask
    function L4_8()
      repeat
        L1_5 = findGameObject2("EnemyBrain", "jammer_02")
        wait()
      until L1_5 ~= nil
      L1_5:setEnableTarget(false)
      repeat
        wait()
      until jammer_attack[2]
      repeat
        if L1_5 ~= nil then
          L1_5:eventMessage("Attack")
        end
        waitSeconds(0.5)
        for _FORV_3_ = 1, table.maxn(jammer_break_glass_02) do
          requestGlassBreak(jammer_break_glass_02[_FORV_3_])
        end
        waitSeconds(5)
      until _litho_success ~= nil
    end
    L3_7 = L3_7(L4_8)
    L2_6[2] = L3_7
    L3_7 = laser_task
    L4_8 = invokeTask
    function L5_9()
      repeat
        L2_6 = findGameObject2("EnemyBrain", "lasercannon_01")
        wait()
      until L2_6 ~= nil
      L2_6:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[1]
      repeat
        if L2_6 ~= nil then
          L2_6:eventMessage("Laser")
        end
        waitSeconds(2)
        for _FORV_3_ = 1, table.maxn(laser_break_glass_01) do
          requestGlassBreak(laser_break_glass_01[_FORV_3_])
        end
        waitSeconds(7.25)
      until _litho_success ~= nil
    end
    L4_8 = L4_8(L5_9)
    L3_7[1] = L4_8
    L3_7 = nil
    L4_8 = laser_task
    L5_9 = invokeTask
    function L6_10()
      repeat
        L3_7 = findGameObject2("EnemyBrain", "lasercannon_02")
        wait()
      until L3_7 ~= nil
      L3_7:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[2]
      repeat
        if L3_7 ~= nil then
          L3_7:eventMessage("Laser")
        end
        waitSeconds(2)
        waitSeconds(7.25)
      until _litho_success ~= nil
    end
    L5_9 = L5_9(L6_10)
    L4_8[2] = L5_9
    L4_8 = nil
    L5_9 = laser_task
    L6_10 = invokeTask
    function L7_11()
      repeat
        L4_8 = findGameObject2("EnemyBrain", "lasercannon_03")
        wait()
      until L4_8 ~= nil
      L4_8:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[3]
      repeat
        if L4_8 ~= nil then
          L4_8:eventMessage("Laser")
        end
        waitSeconds(2)
        waitSeconds(7.25)
      until _litho_success ~= nil
    end
    L6_10 = L6_10(L7_11)
    L5_9[3] = L6_10
    L5_9 = nil
    L6_10 = laser_task
    L7_11 = invokeTask
    function L8_12()
      repeat
        L5_9 = findGameObject2("EnemyBrain", "lasercannon_04")
        wait()
      until L5_9 ~= nil
      L5_9:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[4]
      repeat
        if L5_9 ~= nil then
          L5_9:eventMessage("Laser")
        end
        waitSeconds(2)
        for _FORV_3_ = 1, table.maxn(laser_break_glass_02) do
          requestGlassBreak(laser_break_glass_02[_FORV_3_])
        end
        waitSeconds(7.25)
      until _litho_success ~= nil
    end
    L7_11 = L7_11(L8_12)
    L6_10[4] = L7_11
    L6_10 = nil
    L7_11 = laser_task
    L8_12 = invokeTask
    L8_12 = L8_12(function()
      repeat
        L6_10 = findGameObject2("EnemyBrain", "lasercannon_05")
        wait()
      until L6_10 ~= nil
      L6_10:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[5]
      repeat
        if L6_10 ~= nil then
          L6_10:eventMessage("Laser")
        end
        waitSeconds(2)
        waitSeconds(7.25)
      until _litho_success ~= nil
    end)
    L7_11[5] = L8_12
    L7_11 = nil
    L8_12 = laser_task
    L8_12[6] = invokeTask(function()
      repeat
        L7_11 = findGameObject2("EnemyBrain", "lasercannon_06")
        wait()
      until L7_11 ~= nil
      L7_11:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[6]
      repeat
        if L7_11 ~= nil then
          L7_11:eventMessage("Laser")
        end
        waitSeconds(2)
        waitSeconds(7.25)
      until _litho_success ~= nil
    end)
    L8_12 = nil
    laser_task[7] = invokeTask(function()
      repeat
        L8_12 = findGameObject2("EnemyBrain", "lasercannon_07")
        wait()
      until L8_12 ~= nil
      L8_12:setEnableTarget(false)
      repeat
        wait()
      until laser_attack[7]
      repeat
        if L8_12 ~= nil then
          L8_12:eventMessage("Laser")
        end
        waitSeconds(2)
        waitSeconds(7.25)
      until _litho_success ~= nil
    end)
    _litho_timer_task = invokeTask(function()
      repeat
        repeat
          wait()
        until HUD:timerGetSecond() <= 0
        if _litho_success == nil then
          _litho_success = false
        end
        wait()
      until _litho_success ~= nil
    end)
    _litho_judgement_task = invokeTask(function()
      while _litho_success == nil do
        wait()
      end
      for _FORV_3_ = 1, jammer_max do
        jammer_attack[_FORV_3_] = nil
        if jammer_task[_FORV_3_] ~= nil then
          jammer_task[_FORV_3_]:abort()
          jammer_task[_FORV_3_] = nil
        end
      end
      for _FORV_3_ = 1, laser_max do
        laser_attack[_FORV_3_] = nil
        if laser_task[_FORV_3_] ~= nil then
          laser_task[_FORV_3_]:abort()
          laser_task[_FORV_3_] = nil
        end
      end
      for _FORV_3_ = 1, enmgen_max do
        if enmgen[_FORV_3_] ~= nil then
          enmgen[_FORV_3_]:requestAllEnemyKill()
        end
      end
      if _FOR_:timerIsVisible() then
        HUD:timerStop()
        HUD:timerSetVisible(false)
      end
      Fn_naviKill()
      Fn_missionInfoEnd()
      if _litho_success then
        missionComplete()
        repeat
          wait()
        until isSecondHalfProcessWait()
        setSecondHalfProcessEnd()
        Fn_unLockPlayerAbility(excludedActions, lockOption)
        for _FORV_3_ = 1, glass_max do
          if glass[_FORV_3_] ~= nil then
            glass[_FORV_3_]:setActive(false)
          end
        end
        _FOR_()
        _litho_success = nil
        if _litho_timer_task ~= nil then
          _litho_timer_task:abort()
          _litho_timer_task = nil
        end
        if _litho_judgement_task ~= nil then
          _litho_judgement_task:abort()
          _litho_judgement_task = nil
        end
        Fn_setNoDamageMode(Player.kNoDamage_FromCrash, false)
        Fn_pcSensorOff("pccubesensor2_goal_01")
        Fn_pcSensorOff("pccubesensor2_litho")
        Fn_pcSensorOff("pccubesensor2_jammer_01")
        Fn_pcSensorOff("pccubesensor2_jammer_02")
        Fn_pcSensorOff("pccubesensor2_laser_01")
        Fn_pcSensorOff("pccubesensor2_laser_02")
        Fn_pcSensorOff("pccubesensor2_laser_03")
        Fn_pcSensorOn("pccubesensor2_az3_b_root_outrange")
        Fn_setGravityGateActive(true)
      elseif _litho_success == false then
        _retry = true
        missionFailure()
        repeat
          wait()
        until isFailureProcessEnd()
        Fn_blackout()
        Fn_retryMine99()
      else
        print("\230\136\144\229\144\166\229\136\164\229\174\154\227\129\140\228\184\141\230\173\163")
      end
    end)
    break
  end
end
function FinalizeBody()
  if HUD:timerIsVisible() then
    HUD:timerStop()
    HUD:timerSetVisible(false)
  end
  _poison_in = false
  if Fn_getPlayer() then
    Player:applyPoisonDamage(0, 0.1)
  end
  if _se_poison ~= nil then
    Sound:stopSEHandle(_se_poison)
  end
  if Fn_getPlayer() then
    Fn_setNoDamageMode(Player.kNoDamage_FromCrash, false)
  end
end
function nextPhase()
  local L1_13
  L1_13 = _litho_success
  if L1_13 == nil then
    _litho_success = true
  end
end
function restoreGlassCallbackSpecial(A0_14)
  A0_14:pushJob("NJ", "S", 3, "B")
end
function restoreGlassCallback(A0_15)
  A0_15:pushJob("NJ", "S", glass_break_time, "B")
end
function requestGlassBreak(A0_16)
  glass[tonumber(A0_16)]:requestBreak(Vector(10, 1, 0), 1)
end
function pccubesensor2_jammer_01_OnEnter()
  print("pccubesensor2_jammer_01_OnEnter")
  if jammer_attack[1] == nil then
    jammer_attack[1] = true
  end
end
function pccubesensor2_jammer_02_OnEnter()
  print("pccubesensor2_jammer_02_OnEnter")
  if jammer_attack[2] == nil then
    jammer_attack[2] = true
  end
end
function pccubesensor2_laser_01_OnEnter()
  print("pccubesensor2_laser_01_OnEnter")
  if laser_attack[1] == nil then
    laser_attack[1] = true
  end
end
function pccubesensor2_laser_02_OnEnter()
  print("pccubesensor2_laser_02_OnEnter")
  for _FORV_3_ = 1, 2 do
    if laser_attack[_FORV_3_ + 1] == nil then
      laser_attack[_FORV_3_ + 1] = true
    end
  end
end
function pccubesensor2_laser_03_OnEnter()
  print("pccubesensor2_laser_03_OnEnter")
  for _FORV_3_ = 1, 4 do
    if laser_attack[_FORV_3_ + 3] == nil then
      laser_attack[_FORV_3_ + 3] = true
    end
  end
end
function pccubesensor2_catwarp_OnLeave()
  print("pccubesensor2_catwarp_OnLeave")
  invokeTask(function()
    if Player:getEnergy(Player.kEnergy_Life) > 0 then
      if HUD:timerIsVisible() then
        HUD:timerStop()
      end
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      _poison_in = false
      if Fn_getPlayer() then
        Player:applyPoisonDamage(0, 0.1)
      end
      if _se_poison ~= nil then
        Sound:stopSEHandle(_se_poison)
      end
      Fn_catWarpOut()
      if _litho_judgement_task ~= nil then
        if _litho_success == nil then
          _litho_success = false
        end
      else
        Fn_userCtrlOn()
      end
    else
      print(" << mine99_032 >> \227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\232\144\189\228\184\139\229\136\164\229\174\154\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  end)
end
function pccubesensor2_poison_OnEnter()
  print("pccubesensor2_poison_OnEnter")
  if _poison_in == false then
    _poison_in = true
    Player:applyPoisonDamage(10, 999)
    _se_poison = Sound:playSEHandle("pc1_poisoned", 1, "", Fn_getPlayer())
  end
end
function pccubesensor2_poison_OnLeave()
  print("pccubesensor2_poison_OnLeave")
  _poison_in = false
  Player:applyPoisonDamage(0, 0.1)
  if _se_poison ~= nil then
    Sound:stopSEHandle(_se_poison)
  end
end
