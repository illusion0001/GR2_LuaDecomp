import("Debug")
import("math")
import("common")
import("Player")
_DebugBg = {}
function _DebugBg.Create(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = print
  L2_2 = "GimmickBg. Try Create."
  L1_1(L2_2)
  L1_1 = A0_0.name
  L2_2 = createGameObject2
  L3_3 = "GimmickBg"
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2.setDrawModelName
  L3_3(L2_2, L1_1)
  L3_3 = L2_2.setCollisionName
  L3_3(L2_2, L1_1)
  L3_3 = L2_2.setAttributeName
  L3_3(L2_2, L1_1)
  L3_3 = L2_2.setVisibleBlockEnable
  L3_3(L2_2, false)
  L3_3 = A0_0.pos
  L2_2:setPos(L3_3)
  if A0_0.rot ~= nil then
    L2_2:setRot(A0_0.rot)
  end
  if A0_0.scale ~= nil then
    L2_2:setScale(A0_0.scale)
  end
  L2_2:try_init()
  while not L2_2:isReady() do
    wait()
  end
  L2_2:try_start()
  print("GimmickBg. Created.")
end
function _DebugBg.CreateSimple(A0_4)
  local L1_5
  L1_5 = {}
  L1_5.name = A0_4
  L1_5.pos = Vector(-17.9, 1, 7)
  _DebugBg.Create(L1_5)
end
function _DebugBg.CreateSimpleAtPlayerFront(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  L1_7 = Player
  L2_8 = L1_7
  L1_7 = L1_7.getPuppet
  L1_7 = L1_7(L2_8)
  L2_8 = Debug
  L3_9 = L2_8
  L2_8 = L2_8.getMainViewFront
  L2_8 = L2_8(L3_9)
  L3_9 = print
  L4_10 = L2_8
  L3_9(L4_10)
  L3_9 = Vector
  L4_10 = 0
  L3_9 = L3_9(L4_10, 0, 0)
  if L1_7 ~= nil then
    L4_10 = L1_7.getWorldPos
    L4_10 = L4_10(L1_7)
    L3_9 = L4_10 + L2_8 * A0_6.dist
  end
  L4_10 = {}
  L4_10.name = A0_6.name
  L4_10.pos = L3_9
  print(L3_9)
  _DebugBg.Create(L4_10)
end
function _DebugBg.CreateSimpleAt(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12, L2_13, L3_14 = nil, nil, nil
  L4_15 = A0_11.pos
  if L4_15 ~= nil then
    L4_15 = Vector
    L4_15 = L4_15(A0_11.pos.x, A0_11.pos.y, A0_11.pos.z)
    L1_12 = L4_15
  else
    L4_15 = Player
    L4_15 = L4_15.getPuppet
    L4_15 = L4_15(L4_15)
    L1_12 = L4_15:getWorldPos() + Debug:getMainViewFront() * 4
  end
  L4_15 = A0_11.rote
  if L4_15 ~= nil then
    L4_15 = A0_11.rote
    L4_15 = L4_15.x
    if L4_15 ~= nil then
      L4_15 = A0_11.rote
      L4_15 = L4_15.y
      if L4_15 ~= nil then
        L4_15 = A0_11.rote
        L4_15 = L4_15.z
        if L4_15 ~= nil then
          L4_15 = XYZRotQuaternionEular
          L4_15 = L4_15(A0_11.rote.x, A0_11.rote.y, A0_11.rote.z)
          L2_13 = L4_15
        end
      end
    end
  end
  L4_15 = A0_11.scale
  if L4_15 ~= nil then
    L4_15 = A0_11.scale
    L4_15 = L4_15.x
    if L4_15 ~= nil then
      L4_15 = A0_11.scale
      L3_14 = L4_15.x
    end
  end
  L4_15 = {}
  L4_15.name = A0_11.name
  L4_15.pos = L1_12
  L4_15.rot = L2_13
  L4_15.scale = L3_14
  print(L1_12)
  _DebugBg.Create(L4_15)
end
function _DebugBg.CreateSimpleAtPlayerLocal(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23
  L1_17 = Player
  L2_18 = L1_17
  L1_17 = L1_17.getPuppet
  L1_17 = L1_17(L2_18)
  if L1_17 == nil then
    return
  end
  L3_19 = L1_17
  L2_18 = L1_17.getWorldRot
  L2_18 = L2_18(L3_19)
  L4_20 = L1_17
  L3_19 = L1_17.getWorldPos
  L3_19 = L3_19(L4_20)
  L4_20 = A0_16.player_local
  L5_21 = print
  L6_22 = L4_20
  L5_21(L6_22)
  L6_22 = L2_18
  L5_21 = L2_18.Apply
  L7_23 = L4_20
  L5_21 = L5_21(L6_22, L7_23)
  L6_22 = L3_19 + L5_21
  L7_23 = {}
  L7_23.name = A0_16.name
  L7_23.pos = L6_22
  print(L6_22)
  _DebugBg.Create(L7_23)
end
function _DebugBg.BreakObjectsAt(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = A0_24.range
  L2_26 = A0_24.count
  L3_27 = Vector
  L4_28 = A0_24.pos
  L4_28 = L4_28.x
  L3_27 = L3_27(L4_28, A0_24.pos.y, A0_24.pos.z)
  L4_28 = {}
  L4_28.range = L1_25
  L4_28.name = L2_26
  L4_28.pos = L3_27
  print(L3_27)
  _DebugBg.Create(L4_28)
end
