local L1_1
function L0_0(A0_2, A1_3)
  if A1_3 == nil then
    A1_3 = false
  end
  Fn_createGimmickBg(A0_2, string.sub(A0_2, string.len("locator2_") + 1, #A0_2), "woodbox_kk_02"):setIgnoreGrab(true)
  Fn_createGimmickBg(A0_2, string.sub(A0_2, string.len("locator2_") + 1, #A0_2), "woodbox_kk_02"):setActive(true)
  Fn_createGimmickBg(A0_2, string.sub(A0_2, string.len("locator2_") + 1, #A0_2), "woodbox_kk_02"):setMoveThreshold(0)
  return (Fn_createGimmickBg(A0_2, string.sub(A0_2, string.len("locator2_") + 1, #A0_2), "woodbox_kk_02"))
end
CreateWoodbox = L0_0
function L0_0()
  local L0_4, L1_5
  L0_4 = 1
  while true do
    L1_5 = findGameObject2
    L1_5 = L1_5("GimmickBg", "bg2__battle_" .. string.format("%02d", L0_4))
    if L1_5 ~= nil then
      L1_5:requestRestoreForce()
      L0_4 = L0_4 + 1
    end
  end
  L1_5 = 1
  while findGameObject2("GimmickBg", "bg2_barricade_" .. string.format("%02d", L1_5)) ~= nil do
    findGameObject2("GimmickBg", "bg2_barricade_" .. string.format("%02d", L1_5)):requestRestoreForce()
    L1_5 = L1_5 + 1
  end
end
RespawnConesAndBarricade = L0_0
function L0_0(A0_6, A1_7, A2_8)
  local L3_9
  L3_9 = {}
  L3_9.npc_task = {}
  function L3_9.update(A0_10)
    local L1_11, L2_12, L3_13, L4_14, L5_15
    for L4_14, L5_15 in L1_11(L2_12) do
      A0_10.npc_task[L5_15] = invokeTask(function()
        local L0_16
        L0_16 = Fn_getRandamNpcType
        L0_16 = L0_16(L5_15)
        waitSeconds(RandF(0, 1))
        Fn_turnNpc(L5_15, nil, nil, true)
        while true do
          if string.match(L0_16, "wom") ~= nil then
            Fn_playMotionNpc(L5_15, A2_8, true, {animBlendDuration = 0.5})
          else
            Fn_playMotionNpc(L5_15, A1_7, true, {animBlendDuration = 0.5})
          end
          Fn_playMotionNpc(L5_15, "stay", false, {animBlendDuration = 0})
          waitSeconds(RandF(0.5, 2))
        end
      end)
      break
    end
    while true do
      L1_11()
    end
  end
  function L3_9.destractor(A0_17)
    local L1_18, L2_19, L3_20, L4_21
    for L4_21, _FORV_5_ in L1_18(L2_19) do
      if A0_17.npc_task[L4_21] ~= nil then
        A0_17.npc_task[L4_21]:abort()
        A0_17.npc_task[L4_21] = nil
      end
      Fn_playMotionNpc(L4_21, "stay", false)
    end
  end
  return RAC_InvokeTaskWithDestractor(L3_9.update, L3_9.destractor, L3_9)
end
HandClapInvokeTask = L0_0
function L0_0(A0_22)
  local L1_23, L2_24
  L1_23 = createGameObject2
  L2_24 = "BulletShockwave"
  L1_23 = L1_23(L2_24)
  L2_24 = {}
  L2_24.type = "comboknockback"
  L2_24.damage = 0
  L2_24.force = 1
  L2_24.time = 1
  L2_24.interval = -1
  L2_24.pos = A0_22
  L2_24.rot = Vector(0, 0, 0)
  L2_24.radius = 2
  L1_23:attack(L2_24)
  Sound:pulse("kit064c")
end
box_explain = L0_0
function L0_0(A0_25)
  return invokeTask(function()
    while true do
      Fn_turnNpc(A0_25)
      Fn_playMotionNpc(A0_25, "kaj01_stay_01", true, {animBlendDuration = 0.5, isStop = true})
      Fn_playMotionNpc(A0_25, "kaj01_stay_00", false, {animBlendDuration = 0.5})
    end
  end)
end
turnKajTask = L0_0
function L0_0(A0_26, A1_27, A2_28, A3_29)
  print("judge:" .. A1_27 .. "=" .. A2_28)
  if A3_29:getName() ~= nil then
    print("  sender:" .. A3_29:getName())
  else
    print("  sender: not named")
  end
  return 0
end
judge_callback = L0_0
function L0_0(A0_30, A1_31)
  print("judge:" .. A1_31)
end
damage_callback = L0_0
