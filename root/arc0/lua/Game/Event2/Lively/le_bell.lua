local L1_1
L0_0 = {}
LeBell = L0_0
L0_0 = LeBell
function L1_1()
  local L0_2
  L0_2 = {}
  L0_2.name = "bell"
  L0_2.start = false
  L0_2.evb = nil
  L0_2.task_init = nil
  L0_2.task_run = nil
  L0_2.bell_tower = nil
  L0_2.bell_church = nil
  LeBell._installMethods(L0_2)
  return L0_2
end
L0_0.create = L1_1
L0_0 = LeBell
function L1_1(A0_3)
  if not LeBell._isValid(A0_3) then
    return false
  end
  if A0_3.start then
    A0_3:debugPrint("\227\129\153\227\129\167\227\129\171\229\136\157\230\156\159\229\140\150\230\184\136\227\129\191\227\129\167\227\129\153")
    return
  end
  if A0_3.init_task then
    A0_3:debugPrint("\229\136\157\230\156\159\229\140\150\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_3.task_init = invokeTask(function()
    local L0_4, L1_5
    L0_4 = A0_3
    L1_5 = L0_4
    L0_4 = L0_4.debugPrint
    L0_4(L1_5, "initialize start")
    L0_4 = loadFileAsset
    L1_5 = "evb"
    L0_4 = L0_4(L1_5, "evx/soundrange_hex")
    if L0_4 then
      L1_5 = L0_4.wait
      L1_5(L0_4)
      L1_5 = L0_4.getRoot
      L1_5 = L1_5(L0_4)
      A0_3.evb = EventData:create("LeBell", nil, L1_5)
      A0_3.evb:try_init()
      A0_3.evb:waitForReady()
      A0_3.evb:try_start()
      wait()
      if findGameObject2("Node", "locator2_sound_start_point_01") then
        A0_3.bell_tower = createGameObject2("GimmickBg")
        A0_3.bell_tower:setName("leBellClockTower")
        A0_3.bell_tower:setDrawModelName("g1_building_kw_01r_bell")
        A0_3.bell_tower:setCollisionName("g1_building_kw_01r_bell")
        A0_3.bell_tower:setAttributeName("g1_building_kw_01r_bell")
        findGameObject2("Node", "locator2_sound_start_point_01"):appendChild(A0_3.bell_tower)
        A0_3.bell_tower:setAutoRestore(10)
      end
      if findGameObject2("Node", "locator2_sound_start_point_02") then
        A0_3.bell_church = createGameObject2("GimmickBg")
        A0_3.bell_church:setName("leBellChurch")
        A0_3.bell_church:setDrawModelName("g1_bell_kk_01")
        A0_3.bell_church:setCollisionName("g1_bell_kk_01")
        A0_3.bell_church:setAttributeName("g1_bell_kk_01")
        findGameObject2("Node", "locator2_sound_start_point_02"):appendChild(A0_3.bell_church)
        A0_3.bell_church:setAutoRestore(10)
      end
      if A0_3.bell_tower and A0_3.bell_church then
        A0_3.bell_tower:try_init()
        A0_3.bell_church:try_init()
        A0_3.bell_tower:waitForReady()
        A0_3.bell_church:waitForReady()
        A0_3.bell_tower:try_start()
        A0_3.bell_church:try_start()
        A0_3.start = true
        A0_3:debugPrint("initialize finish")
      else
        A0_3:debugPrint("initialize failure")
      end
    else
      L1_5 = A0_3
      L1_5 = L1_5.debugPrint
      L1_5(L1_5, "initialize failure")
    end
    A0_3.task_init = nil
  end)
end
L0_0.init = L1_1
L0_0 = LeBell
function L1_1(A0_6)
  if not LeBell._isValid(A0_6) then
    return false
  end
  if not A0_6.start then
    A0_6:debugPrint("\229\136\157\230\156\159\229\140\150\227\129\149\227\130\140\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\233\179\180\227\130\137\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  if A0_6.task_run then
    A0_6:debugPrint("\227\129\153\227\129\167\227\129\171\233\144\152\227\129\175\233\179\180\227\130\137\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153")
    return
  end
  A0_6.task_run = invokeTask(function()
    A0_6:debugPrint("\227\131\128\227\130\166\227\131\179\227\130\191\227\130\166\227\131\179\227\129\174\230\153\130\232\168\136\229\161\148\227\129\174\233\144\152\227\129\168\227\128\129\227\130\170\227\131\171\227\131\137\227\131\142\227\131\175\227\129\174\230\149\153\228\188\154\227\129\174\233\144\152\227\130\146\233\179\180\227\130\137\227\129\151\227\129\190\227\129\153")
    A0_6.bell_tower:setReactionaryParam("play", 0.4)
    A0_6.bell_church:setReactionaryParam("play", 0.1)
    waitSeconds(30)
    A0_6.bell_tower:setReactionaryParam("stop", 0)
    A0_6.bell_church:setReactionaryParam("stop", 0)
    A0_6:debugPrint("\233\144\152\227\130\146\230\173\162\227\130\129\227\129\190\227\129\151\227\129\159")
    A0_6.task_run = nil
  end)
end
L0_0.run = L1_1
L0_0 = LeBell
function L1_1(A0_7)
  if not LeBell._isValid(A0_7) then
    return false
  end
  A0_7.task_init = A0_7:_abortTask(A0_7.task_init)
  A0_7.task_run = A0_7:_abortTask(A0_7.task_run)
  A0_7.bell_tower = A0_7:_termGameObj(A0_7.bell_tower)
  A0_7.bell_church = A0_7:_termGameObj(A0_7.bell_church)
  A0_7.evb = A0_7:_termGameObj(A0_7.evb)
  A0_7.start = false
  A0_7:debugPrint("kill finish")
end
L0_0.kill = L1_1
L0_0 = LeBell
function L1_1(A0_8)
  local L1_9
  if A0_8 == nil then
    L1_9 = false
    return L1_9
  end
  L1_9 = true
  return L1_9
end
L0_0._isValid = L1_1
L0_0 = LeBell
function L1_1(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  for L4_14, L5_15 in L1_11(L2_12) do
    if type(L5_15) == "function" then
      A0_10[L4_14] = L5_15
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = LeBell
function L1_1(A0_16, A1_17)
  if A1_17 then
    A0_16:debugPrint(A1_17:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_17:isRunning() then
      A1_17:try_term()
    else
      A1_17:kill()
    end
  end
  return nil
end
L0_0._termGameObj = L1_1
L0_0 = LeBell
function L1_1(A0_18, A1_19)
  if A1_19 and A1_19:isRunning() then
    A1_19:abort()
  end
  return nil
end
L0_0._abortTask = L1_1
L0_0 = LeBell
function L1_1(A0_20, A1_21)
  print(" - le bell - " .. A1_21)
end
L0_0.debugPrint = L1_1
L0_0 = LeBell
function L1_1(A0_22, A1_23, A2_24)
  local L3_25, L4_26
  L3_25 = 0 + A2_24
  function L4_26(A0_27)
    local L1_28
    L1_28 = A1_23
    L1_28 = L1_28 + 10
    if Debug:isDebugMenuOpen() then
      L1_28 = L1_28 + 200
    end
    Font:debugPrint(L1_28, 20 + 18 * L3_25, A0_27)
    L3_25 = L3_25 + 1
  end
  L4_26("- Bell -")
  L4_26("init task : " .. (A0_22.task_init ~= nil and "run" or "nil"))
  L4_26("run  task : " .. (A0_22.task_run ~= nil and "run" or "nil"))
  L4_26("tower     : " .. (A0_22.bell_tower ~= nil and A0_22.bell_tower:getPhase() or "nil"))
  L4_26("church    : " .. (A0_22.bell_church ~= nil and A0_22.bell_church:getPhase() or "nil"))
  L4_26("start     : " .. tostring(A0_22.start))
  return L3_25 - A2_24
end
L0_0.debugDisp = L1_1
