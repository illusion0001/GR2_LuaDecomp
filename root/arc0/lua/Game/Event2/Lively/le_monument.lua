local L1_1
L0_0 = {}
LeMonument = L0_0
L0_0 = LeMonument
function L1_1()
  local L0_2
  L0_2 = {}
  L0_2.name = "Monument"
  L0_2.task_run = nil
  L0_2.flower = nil
  L0_2.create_area = false
  L0_2.create_time = false
  LeMonument._installMethods(L0_2)
  return L0_2
end
L0_0.create = L1_1
L0_0 = LeMonument
function L1_1(A0_3, A1_4)
  A0_3.create_area = A1_4
end
L0_0.setArea = L1_1
L0_0 = LeMonument
function L1_1(A0_5, A1_6)
  A0_5.create_time = A1_6
end
L0_0.setTime = L1_1
L0_0 = LeMonument
function L1_1(A0_7)
  local L1_8
  L1_8 = A0_7.create_time
  return L1_8
end
L0_0.getTime = L1_1
L0_0 = LeMonument
function L1_1(A0_9)
  if A0_9.task_run then
    A0_9:debugPrint("\227\129\153\227\129\167\227\129\171\231\140\174\232\138\177\227\129\174\227\130\191\227\130\185\227\130\175\227\129\175\229\174\159\232\161\140\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153")
    return
  end
  A0_9.task_run = invokeTask(function()
    while true do
      if A0_9.create_area and A0_9.create_time then
        if A0_9.flower == nil then
          A0_9.flower = A0_9:_createFlower()
          A0_9:debugPrint("\231\140\174\232\138\177\227\130\146\228\189\156\230\136\144\227\129\151\227\129\190\227\129\151\227\129\159")
        end
      else
        A0_9.flower = A0_9:_termGameObj(A0_9.flower)
      end
      wait()
    end
  end)
end
L0_0.run = L1_1
L0_0 = LeMonument
function L1_1(A0_10)
  A0_10.task_run = A0_10:_abortTask(A0_10.task_run)
  A0_10.flower = A0_10:_termGameObj(A0_10.flower)
end
L0_0.kill = L1_1
L0_0 = LeMonument
function L1_1(A0_11)
  local L1_12
  if A0_11 == nil then
    L1_12 = false
    return L1_12
  end
  L1_12 = true
  return L1_12
end
L0_0._isValid = L1_1
L0_0 = LeMonument
function L1_1(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18
  for L4_17, L5_18 in L1_14(L2_15) do
    if type(L5_18) == "function" then
      A0_13[L4_17] = L5_18
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = LeMonument
function L1_1(A0_19, A1_20)
  if A1_20 then
    A0_19:debugPrint(A1_20:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_20:isRunning() then
      A1_20:try_term()
    else
      A1_20:kill()
    end
  end
  return nil
end
L0_0._termGameObj = L1_1
L0_0 = LeMonument
function L1_1(A0_21, A1_22)
  if A1_22 and A1_22:isRunning() then
    A1_22:abort()
  end
  return nil
end
L0_0._abortTask = L1_1
L0_0 = LeMonument
function L1_1(A0_23)
  local L1_24
  L1_24 = nil
  if Fn_findAreaHandle("po_a_03") and Fn_findAreaHandle("po_a_03"):findSubArea("po_a_03a") then
    L1_24 = createGameObject2("GimmickBg")
    L1_24:setName("takamiflower")
    L1_24:setDrawModelName("takamiflower_md_01")
    L1_24:setAttributeName("takamiflower_md_01")
    L1_24:setCollisionName("takamiflower_md_01")
    Fn_findAreaHandle("po_a_03"):findSubArea("po_a_03a"):appendChild(L1_24)
    L1_24:setTransform(Fn_findAreaHandle("po_a_03"):findSubArea("po_a_03a"):getNodeLocalPosRot("takamiflower_md_01_01"))
    L1_24:try_init()
    L1_24:waitForReady()
    L1_24:try_start()
  end
  return L1_24
end
L0_0._createFlower = L1_1
L0_0 = LeMonument
function L1_1(A0_25, A1_26)
  print(" - le monument - " .. A1_26)
end
L0_0.debugPrint = L1_1
L0_0 = LeMonument
function L1_1(A0_27, A1_28, A2_29)
  local L3_30, L4_31
  L3_30 = A2_29
  function L4_31(A0_32)
    local L1_33
    L1_33 = A1_28
    L1_33 = L1_33 + 10
    if Debug:isDebugMenuOpen() then
      L1_33 = L1_33 + 200
    end
    Font:debugPrint(L1_33, 20 + 18 * L3_30, A0_32)
    L3_30 = L3_30 + 1
  end
  L4_31("- monument -")
  L4_31("run task : " .. (A0_27.task_run ~= nil and "run" or "nil"))
  L4_31("flower   : " .. (A0_27.flower ~= nil and "run" or "nil"))
  L4_31("area     : " .. tostring(A0_27.create_area))
  L4_31("time     : " .. tostring(A0_27.create_time))
  return L3_30 - A2_29
end
L0_0.debugDisp = L1_1
