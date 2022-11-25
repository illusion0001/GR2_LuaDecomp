dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_033"
_floor_num = 33
_retry = false
_litho_success = nil
_litho_success_task = nil
glass = {}
glass_max = 36
enmgen = nil
_poison_in = false
_se_poison = nil
enmgen2_nevi_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker",
      locator = "locator2_nevi_01_01",
      name = "nevi_01_01",
      ai_spawn_option = "Faker/faker",
      navi_mesh_name = "az3_a_03_custom01"
    }
  },
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyDeadNum = A0_0:getSpecTable().enemyDeadNum + 1
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
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6 = loadFileAsset
  L0_6 = L0_6(L1_7, L2_8)
  if L0_6 ~= nil then
    L1_7(L2_8)
    L1_7(L2_8)
    if L1_7 ~= nil then
      L4_10 = L0_6
      L2_8(L3_9, L4_10)
    end
  end
  for L4_10 = 1, glass_max do
    glass[L4_10] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_glass_%02d", L4_10))
    if glass[L4_10] ~= nil then
      glass[L4_10]:pushJob("NJ", "N", 0, "B")
      glass[L4_10]:setEventListener("judge", judgeGlassCallback)
      glass[L4_10]:setActive(false)
    end
  end
end
function IngameBody()
  local L0_11, L1_12, L2_13, L3_14
  if L0_11 then
    L0_11()
    L0_11()
    L0_11()
    L0_11(L1_12)
    L0_11(L1_12)
  else
    if L0_11 then
      for L3_14 = 1, glass_max do
        glass[L3_14] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_glass_%02d", L3_14))
        if glass[L3_14] ~= nil then
          glass[L3_14]:requestRestoreForce()
          glass[L3_14]:pushJob("NJ", "N", 0, "B")
          glass[L3_14]:setEventListener("judge", judgeGlassCallback)
          glass[L3_14]:setActive(false)
        end
      end
      _litho_success = nil
      if L0_11 ~= nil then
        L0_11(L1_12)
        _litho_success_task = nil
      end
    end
    L0_11()
    L0_11()
    L0_11()
    L0_11(L1_12)
    repeat
      L0_11()
    until L0_11
    for L3_14 = 1, glass_max do
      if glass[L3_14] ~= nil then
        glass[L3_14]:setActive(true)
      end
    end
    L0_11()
    L0_11(L1_12, L2_13, L3_14, true)
    L0_11(L1_12, L2_13)
    enmgen = L0_11
    if L0_11 ~= nil then
      L0_11(L1_12)
      L0_11.enemyDeadNum = 0
    end
    L2_13(L3_14, true)
    _litho_success_task = L2_13
    while true do
      if L2_13 == nil then
        L2_13()
      end
    end
    L2_13(L3_14, "boss_battle_end")
    L2_13()
    if L2_13 then
      L2_13()
      repeat
        L2_13()
      until L2_13
      L2_13()
      for _FORV_5_ = 1, glass_max do
        if glass[_FORV_5_] ~= nil then
          glass[_FORV_5_]:setActive(false)
        end
      end
      L2_13()
      _litho_success = nil
      if L2_13 ~= nil then
        L2_13(L3_14)
        _litho_success_task = nil
      end
      L2_13(L3_14)
    elseif L2_13 == false then
      _retry = true
      L2_13()
      repeat
        L2_13()
      until L2_13
      L2_13()
      L2_13()
    else
      L2_13(L3_14)
    end
  end
end
function FinalizeBody()
  _poison_in = false
  if Fn_getPlayer() then
    Player:applyPoisonDamage(0, 0.1)
  end
  if _se_poison ~= nil then
    Sound:stopSEHandle(_se_poison)
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
      print(" << mine99_033 >> \227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\232\144\189\228\184\139\229\136\164\229\174\154\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
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
