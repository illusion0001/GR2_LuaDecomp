local L1_1
DOG_WAIT_TIME_MAX_TRUE = 30
DOG_WAIT_TIME_MAX_FALSE = 30
function L0_0()
  _bark_task = invokeTask(function()
    while true do
      Fn_playMotionNpc("sm20_dog_01", "bark", false)
      Sound:pulse("dog_bark")
      waitSeconds(1)
      Sound:pulse("dog_bark")
      waitSeconds(0.9)
      Sound:pulse("dog_bark")
      waitSeconds(3.5)
    end
  end)
end
barkStart = L0_0
function L0_0()
  if _bark_task then
    _bark_task:abort()
    _bark_task = nil
  end
end
barkEnd = L0_0
function L0_0(A0_2, A1_3)
  local L2_4, L3_5
  L2_4 = createGameObject2
  L3_5 = "PlayerSensor"
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4.setName
  L3_5(L2_4, A0_2)
  L3_5 = L2_4.setDetectBehavior
  L3_5(L2_4, 1)
  L3_5 = L2_4.addSphere
  L3_5(L2_4, 2.3)
  L3_5 = L2_4.setPos
  L3_5(L2_4, Vector(0, 0, 0))
  L3_5 = L2_4.setOnEnter
  L3_5(L2_4, A0_2 .. "_OnEnter")
  L3_5 = L2_4.setOnLeave
  L3_5(L2_4, A0_2 .. "_OnLeave")
  L3_5 = L2_4.setActive
  L3_5(L2_4, false)
  L3_5 = findGameObject2
  L3_5 = L3_5("Node", A1_3)
  L3_5:appendChild(L2_4)
  return L2_4, L3_5
end
createDummySensor = L0_0
function L0_0(A0_6, A1_7)
  local L2_8, L3_9
  L2_8 = {}
  L3_9 = 1
  for _FORV_7_, _FORV_8_ in pairs(A0_6) do
    if not _FORV_8_.happen then
      L2_8[L3_9] = {}
      L2_8[L3_9].node = _FORV_8_.node
      L2_8[L3_9].gimmick = _FORV_8_.gimmick
      L2_8[L3_9].dist = Fn_get_distance(A1_7:getWorldPos(), findGameObject2("Node", _FORV_8_.node):getWorldPos())
      L3_9 = L3_9 + 1
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L2_8) do
    print(_FORV_8_.node .. ":   " .. _FORV_8_.dist)
  end
  table.sort(L2_8, function(A0_10, A1_11)
    return A0_10.dist < A1_11.dist
  end)
  print("\228\184\128\231\149\170\232\191\145\227\129\132\227\131\142\227\131\188\227\131\137\227\129\175" .. L2_8[1].node)
  return L2_8[1].node, L2_8[1].gimmick
end
findNearEventNode = L0_0
function L0_0(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23
  L1_13 = {}
  for L5_17, L6_18 in L2_14(L3_15) do
    L7_19 = Fn_setNpcActive
    L7_19(L8_20, L9_21)
    L7_19 = L6_18.name
    L1_13[L7_19] = L8_20
    L7_19 = {}
    for L11_23 = 1, #L9_21 do
      table.insert(L7_19, L11_23, {
        pos = L6_18.locator[L11_23],
        attr = "fly"
      })
      print(L7_19[L11_23].pos)
    end
    L8_20(L9_21)
    do break end
    break
  end
  L3_15(L4_16)
  for L6_18, L7_19 in L3_15(L4_16) do
    L8_20(L9_21)
    break
  end
end
eventBird = L0_0
