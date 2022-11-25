dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_031"
_floor_num = 31
_retry = false
_litho_success = nil
_litho_success_task = nil
_litho_failure_task = nil
glass = {}
glass_max = 42
glass_broken_num = 0
enmgen = nil
enemy_count = 0
_poison_in = false
_se_poison = nil
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_12",
      locator = "locator2_nevi_01_01",
      name = "nevi_01_01"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_01_02",
      name = "nevi_01_02"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_01_03",
      name = "nevi_01_03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator2_nevi_01_04",
      name = "nevi_01_04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator2_nevi_01_05",
      name = "nevi_01_05"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator2_nevi_01_06",
      name = "nevi_01_06"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator2_nevi_01_07",
      name = "nevi_01_07"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator2_nevi_01_08",
      name = "nevi_01_08"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
    if HUD:counter999IsVisible() then
      HUD:counter999SubNum()
    end
    print("enemyDeadNum : " .. A0_0:getSpecTable().enemyDeadNum)
  end,
  enemyDeadNum = 0,
  getEnemyDeadNum = function(A0_2)
    local L1_3
    L1_3 = A0_2.enemyDeadNum
    return L1_3
  end,
  isEnemyAllDead = function(A0_4)
    local L2_5
    L2_5 = A0_4.enemyDeadNum
    L2_5 = L2_5 >= #A0_4.spawnSet
    return L2_5
  end
}
function InitializeBody()
  local L0_6, L1_7, L2_8, L3_9
  for L3_9 = 1, glass_max do
    glass[L3_9] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_glass_%02d", L3_9))
    if glass[L3_9] ~= nil then
      glass[L3_9]:setEventListener("broken", brokenGlassCallback)
      glass[L3_9]:setEventListener("judge", judgeGlassCallback)
      glass[L3_9]:setActive(false)
    end
  end
end
function IngameBody()
  local L0_10, L1_11, L2_12, L3_13
  if L0_10 then
    L0_10()
    L0_10()
    L0_10()
    L0_10(L1_11)
    L0_10(L1_11)
  else
    if L0_10 then
      for L3_13 = 1, glass_max do
        glass[L3_13] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_glass_%02d", L3_13))
        if glass[L3_13] ~= nil then
          glass[L3_13]:requestRestoreForce()
          glass[L3_13]:setEventListener("broken", brokenGlassCallback)
          glass[L3_13]:setEventListener("judge", judgeGlassCallback)
          glass[L3_13]:setActive(false)
        end
      end
      _litho_success = nil
      glass_broken_num = 0
      if L0_10 ~= nil then
        L0_10(L1_11)
        _litho_success_task = nil
      end
      if L0_10 ~= nil then
        L0_10(L1_11)
        _litho_failure_task = nil
      end
    end
    L0_10()
    L0_10()
    L0_10()
    L0_10(L1_11)
    repeat
      L0_10()
    until L0_10
    for L3_13 = 1, glass_max do
      if glass[L3_13] ~= nil then
        glass[L3_13]:setActive(true)
      end
    end
    L0_10()
    L3_13 = nil
    L0_10(L1_11, L2_12, L3_13, true)
    L0_10(L1_11)
    enmgen = L0_10
    if L0_10 ~= nil then
      L0_10(L1_11)
      L0_10.enemyDeadNum = 0
      enemy_count = L0_10
    end
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L3_13 = glass_broken_num
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    _litho_success_task = L0_10
    _litho_failure_task = L0_10
    while true do
      if L0_10 == nil then
        L0_10()
      end
    end
    L0_10(L1_11, L2_12)
    L0_10(L1_11, L2_12)
    L0_10()
    if L0_10 then
      L0_10()
      repeat
        L0_10()
      until L0_10
      L0_10()
      for L3_13 = 1, glass_max do
        if glass[L3_13] ~= nil then
          glass[L3_13]:setActive(false)
        end
      end
      L0_10()
      _litho_success = nil
      glass_broken_num = 0
      if L0_10 ~= nil then
        L0_10(L1_11)
        _litho_success_task = nil
      end
      if L0_10 ~= nil then
        L0_10(L1_11)
        _litho_failure_task = nil
      end
      L0_10(L1_11)
    elseif L0_10 == false then
      _retry = true
      L0_10()
      repeat
        L0_10()
      until L0_10
      L0_10()
      L0_10()
    else
      L0_10(L1_11)
    end
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
  HUD:counter99_99SetVisible(false)
  _poison_in = false
  if Fn_getPlayer() then
    Player:applyPoisonDamage(0, 0.1)
  end
  if _se_poison ~= nil then
    Sound:stopSEHandle(_se_poison)
  end
end
function brokenGlassCallback(A0_14)
  glass_broken_num = glass_broken_num + 1
  if HUD:counter99_99IsVisible() then
    HUD:counter99_99SubNum()
  end
end
function judgeGlassCallback(A0_15, A1_16, A2_17, A3_18)
  if A0_15:getName() ~= nil then
    print("self : " .. A0_15:getName())
  end
  print("judge : " .. A1_16)
  print("damage : " .. A2_17)
  if A3_18:getName() ~= nil then
    print("sender : " .. A3_18:getName())
  end
  if A1_16 ~= "secondary_damage" and A3_18:getName() ~= nil then
    return 2
  else
    return 0
  end
end
function pccubesensor2_catwarp_OnLeave()
  print("pccubesensor2_catwarp_OnLeave")
  invokeTask(function()
    if Player:getEnergy(Player.kEnergy_Life) > 0 then
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
      Fn_userCtrlOn()
    else
      print(" << mine99_031 >> \227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\232\144\189\228\184\139\229\136\164\229\174\154\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
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
