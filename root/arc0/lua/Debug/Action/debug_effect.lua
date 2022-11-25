import("Debug")
import("math")
import("common")
import("Player")
_DebugEffect = {}
function _DebugEffect.Create(A0_0)
  print("Effect. Try Create.")
  createGameObject2("Effect"):setModelName(A0_0.name)
  createGameObject2("Effect"):loadModel(A0_0.name)
  createGameObject2("Effect"):setPos(A0_0.pos)
  if A0_0.rot ~= nil then
    createGameObject2("Effect"):setRot(A0_0.rot)
  end
  if A0_0.scale ~= nil then
    createGameObject2("Effect"):setScale(A0_0.scale)
  end
  createGameObject2("Effect"):play()
  createGameObject2("Effect"):setLoop(false)
  createGameObject2("Effect"):try_init()
  while not createGameObject2("Effect"):isReady() do
    wait()
  end
  createGameObject2("Effect"):try_start()
  print("Effect. Created.")
end
function _DebugEffect.CreateSimple(A0_1)
  local L1_2
  L1_2 = {}
  L1_2.name = A0_1
  L1_2.pos = Vector(-17.9, 1, 7)
  _DebugEffect.Create(L1_2)
end
function _DebugEffect.CreateSimpleAtPlayerFront(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4 = Player
  L2_5 = L1_4
  L1_4 = L1_4.getPuppet
  L1_4 = L1_4(L2_5)
  L2_5 = Debug
  L3_6 = L2_5
  L2_5 = L2_5.getMainViewFront
  L2_5 = L2_5(L3_6)
  L3_6 = print
  L4_7 = L2_5
  L3_6(L4_7)
  L3_6 = Vector
  L4_7 = 0
  L3_6 = L3_6(L4_7, 0, 0)
  if L1_4 ~= nil then
    L4_7 = L1_4.getWorldPos
    L4_7 = L4_7(L1_4)
    L3_6 = L4_7 + L2_5 * A0_3.dist
  end
  L4_7 = {}
  L4_7.name = A0_3.name
  L4_7.pos = L3_6
  print(L3_6)
  _DebugEffect.Create(L4_7)
end
function _DebugEffect.CreateSimpleAt(A0_8)
  local L1_9, L2_10, L3_11, L4_12
  L1_9, L2_10, L3_11 = nil, nil, nil
  L4_12 = A0_8.pos
  if L4_12 ~= nil then
    L4_12 = Vector
    L4_12 = L4_12(A0_8.pos.x, A0_8.pos.y, A0_8.pos.z)
    L1_9 = L4_12
  else
    L4_12 = Player
    L4_12 = L4_12.getPuppet
    L4_12 = L4_12(L4_12)
    L1_9 = L4_12:getWorldPos() + Debug:getMainViewFront() * 4
  end
  L4_12 = A0_8.rote
  if L4_12 ~= nil then
    L4_12 = A0_8.rote
    L4_12 = L4_12.x
    if L4_12 ~= nil then
      L4_12 = A0_8.rote
      L4_12 = L4_12.x
      if L4_12 ~= nil then
        L4_12 = A0_8.rote
        L4_12 = L4_12.x
        if L4_12 ~= nil then
          L4_12 = XYZRotQuaternionEular
          L4_12 = L4_12(A0_8.rote.x, A0_8.rote.y, A0_8.rote.z)
          L2_10 = L4_12
        end
      end
    end
  end
  L4_12 = A0_8.scale
  if L4_12 ~= nil then
    L4_12 = A0_8.scale
    L4_12 = L4_12.x
    if L4_12 ~= nil then
      L4_12 = A0_8.scale
      L4_12 = L4_12.y
      if L4_12 ~= nil then
        L4_12 = A0_8.scale
        L4_12 = L4_12.z
        if L4_12 ~= nil then
          L4_12 = Vector
          L4_12 = L4_12(A0_8.scale.x, A0_8.scale.y, A0_8.scale.z)
          L3_11 = L4_12
        end
      end
    end
  end
  L4_12 = {}
  L4_12.name = A0_8.name
  L4_12.pos = L1_9
  L4_12.rot = L2_10
  L4_12.scale = L3_11
  print(L1_9)
  _DebugEffect.Create(L4_12)
end
