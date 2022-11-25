local L1_1
L0_0 = {}
_memory_debris_tbl = L0_0
_memory_debris_get_callback = nil
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11
  for L5_7, L6_8 in L2_4(L3_5) do
    L7_9 = findGameObject2
    L8_10 = "Node"
    L9_11 = L6_8.locator_name
    L7_9 = L7_9(L8_10, L9_11)
    L8_10 = {}
    L9_11 = createGameObject2
    L9_11 = L9_11("Effect")
    L8_10[1] = L9_11
    L9_11 = L8_10[1]
    L9_11 = L9_11.setModelName
    L9_11(L9_11, "ef_ev_kkr_01")
    L9_11 = L8_10[1]
    L9_11 = L9_11.loadModel
    L9_11(L9_11, "ef_ev_kkr_01")
    L9_11 = L8_10[1]
    L9_11 = L9_11.setName
    L9_11(L9_11, L6_8.memory_name .. "_01")
    L9_11 = L8_10[1]
    L9_11 = L9_11.setLoop
    L9_11(L9_11, true)
    L9_11 = L8_10[1]
    L9_11 = L9_11.setPos
    L9_11(L9_11, Vector(0, 0, 0))
    L9_11 = L8_10[1]
    L9_11 = L9_11.stop
    L9_11(L9_11)
    L9_11 = L7_9.appendChild
    L9_11(L7_9, L8_10[1])
    L9_11 = createGameObject2
    L9_11 = L9_11("Effect")
    L8_10[2] = L9_11
    L9_11 = L8_10[2]
    L9_11 = L9_11.setModelName
    L9_11(L9_11, "ef_ev_kkr_02")
    L9_11 = L8_10[2]
    L9_11 = L9_11.loadModel
    L9_11(L9_11, "ef_ev_kkr_02")
    L9_11 = L8_10[2]
    L9_11 = L9_11.setName
    L9_11(L9_11, L6_8.memory_name .. "_03")
    L9_11 = L8_10[2]
    L9_11 = L9_11.setLoop
    L9_11(L9_11, true)
    L9_11 = L8_10[2]
    L9_11 = L9_11.setPos
    L9_11(L9_11, Vector(0, 0, 0))
    L9_11 = L8_10[2]
    L9_11 = L9_11.stop
    L9_11(L9_11)
    L9_11 = L7_9.appendChild
    L9_11(L7_9, L8_10[2])
    L9_11 = nil
    if L6_8.attach_sensor == nil or L6_8.attach_sensor == true then
      L9_11 = createGameObject2("PlayerSensor")
      L9_11:setName("pccubesensor2_" .. L6_8.memory_name)
      L9_11:setDetectBehavior(1)
      L9_11:addBox(Vector(0.5, 1, 0.5))
      L9_11:setPos(Vector(0, 0, 0))
      L9_11:setOnEnter("pccubesensor2_memory_debris_OnEnter")
      L9_11:setActive(false)
      L7_9:appendChild(L9_11)
    end
    _memory_debris_tbl[L6_8.memory_name] = {
      effect = L8_10,
      sensor = L9_11,
      is_acquired = false
    }
  end
  _memory_debris_get_callback = A1_3
end
createMemoryDebris = L0_0
function L0_0(A0_12)
  if _memory_debris_tbl[A0_12] ~= nil then
    _memory_debris_tbl[A0_12].effect[1]:play()
    if _memory_debris_tbl[A0_12].sensor ~= nil then
      _memory_debris_tbl[A0_12].sensor:setActive(true)
    end
  end
end
setActiveMemoryDebris = L0_0
function L0_0(A0_13)
  if _memory_debris_tbl[A0_13] ~= nil and _memory_debris_tbl[A0_13].is_acquired == false then
    if _memory_debris_tbl[A0_13].sensor ~= nil then
      _memory_debris_tbl[A0_13].sensor:setActive(false)
    end
    Sound:playSE("dm02_memory_get", 1)
    _memory_debris_tbl[A0_13].effect[1]:setEmitStop(true)
    _memory_debris_tbl[A0_13].effect[2]:play()
    _memory_debris_tbl[A0_13].effect[2]:setLoop(false)
    _memory_debris_tbl[A0_13].is_acquired = true
    if _memory_debris_get_callback ~= nil then
      _memory_debris_get_callback(A0_13)
    end
  end
end
setGettingMemoryDebris = L0_0
function L0_0(A0_14)
  local L1_15
  L1_15 = _memory_debris_tbl
  L1_15 = L1_15[A0_14]
  if L1_15 ~= nil then
    L1_15 = _memory_debris_tbl
    L1_15 = L1_15[A0_14]
    L1_15 = L1_15.is_acquired
    return L1_15
  end
  L1_15 = false
  return L1_15
end
isMemoryDebrisAcquired = L0_0
function L0_0()
  for _FORV_4_, _FORV_5_ in pairs(_memory_debris_tbl) do
  end
  return 0 + 1
end
getAcquiredMemoryDebrisCount = L0_0
function L0_0()
  for _FORV_3_, _FORV_4_ in pairs(_memory_debris_tbl) do
    _memory_debris_tbl[_FORV_3_].effect[1]:try_term()
    _memory_debris_tbl[_FORV_3_].effect[2]:try_term()
    if _memory_debris_tbl[_FORV_3_].sensor ~= nil then
      _memory_debris_tbl[_FORV_3_].sensor:try_term()
    end
  end
  _memory_debris_tbl = {}
end
deleteMemoryDebris = L0_0
function L0_0(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22
  L2_18 = A0_16.getName
  L2_18 = L2_18(L3_19)
  for L6_22, _FORV_7_ in L3_19(L4_20) do
    if _FORV_7_.sensor ~= nil and L2_18 == _FORV_7_.sensor:getName() then
      setGettingMemoryDebris(L6_22)
      break
    end
  end
end
pccubesensor2_memory_debris_OnEnter = L0_0
