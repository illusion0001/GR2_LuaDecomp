import("Vehicle")
_player_common_motion_table = {
  glad_in_01 = "kit01_glad_in_01",
  glad_01 = "kit01_glad_01"
}
function InitializeShipWork(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6
  while true do
    L5_5 = Vehicle
    L6_6 = L5_5
    L5_5 = L5_5.isReady
    L5_5 = L5_5(L6_6)
    if not L5_5 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = findGameObject2
  L6_6 = "Node"
  L5_5 = L5_5(L6_6, A2_2)
  if L5_5 == nil then
    L6_6 = nil
    return L6_6
  end
  L6_6 = {}
  L6_6.ship = nil
  L6_6.route_object = nil
  L6_6.speed = A4_4
  L6_6.startPosNode = L5_5
  L6_6.pos_route_tbl = A3_3
  if A3_3 == nil then
    L6_6.pos_route_tbl = {
      L5_5:getWorldPos(),
      Vector(0, 0, 0)
    }
  end
  L6_6.ship, L6_6.route_object = CreateScriptVehicle(L6_6.pos_route_tbl, A0_0, A1_1)
  ResetPosShipWork(L6_6)
  return L6_6
end
function CreateScriptVehicle(A0_7, A1_8, A2_9)
  local L3_10, L4_11
  L3_10 = Vehicle
  L4_11 = L3_10
  L3_10 = L3_10.spawnRoute
  L3_10 = L3_10(L4_11, A0_7, g_own)
  L4_11 = Vehicle
  L4_11 = L4_11.spawnVehicle
  L4_11 = L4_11(L4_11, A1_8, g_own)
  L4_11:setName(A2_9)
  Vehicle:attach(L3_10, L4_11)
  return L4_11, L3_10
end
function ReleaseShipWork(A0_12)
  if A0_12 then
    if A0_12.ship then
      A0_12.ship:try_term()
      A0_12.ship = nil
    end
    if A0_12.route_object then
      A0_12.route_object:try_term()
      A0_12.route_object = nil
    end
    A0_12 = nil
    print("shipWork\227\130\146try_term()\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function ResetPosShipWork(A0_13)
  A0_13.ship:setBaseSpeed(0)
  A0_13.ship:setCurrSpeed(0)
  A0_13.ship:setWorldTransform(A0_13.startPosNode:getWorldPos(), A0_13.startPosNode:getWorldRot())
end
function ResetRouteShipWork(A0_14)
  ChangeRoute(A0_14, A0_14.pos_route_tbl, A0_14.speed)
end
function ChangeRoute(A0_15, A1_16, A2_17)
  A0_15.route_object:try_term()
  A0_15.route_object = nil
  wait()
  A0_15.pos_route_tbl = A1_16
  A0_15.route_object = Vehicle:spawnRoute(A0_15.pos_route_tbl, g_own)
  A0_15.ship:attach(A0_15.route_object)
  if A2_17 ~= nil then
    A0_15.speed = A2_17
  end
  return A0_15
end
function MoveShipWork(A0_18)
  print("\227\130\185\227\131\148\227\131\188\227\131\137\239\188\154" .. string.format("%3.1f", A0_18.speed))
  A0_18.ship:setBaseSpeed(A0_18.speed)
  A0_18.ship:setCurrSpeed(0)
end
function StopEndPointShipWork(A0_19)
  while true do
    if A0_19 == nil then
      return
    end
    if A0_19.ship == nil then
      return
    end
    if not (A0_19.ship:getRemainingDist() <= 0) then
      wait()
    end
  end
  A0_19.ship:setBaseSpeed(0)
  A0_19.ship:setCurrSpeed(0)
  print(A0_19.ship:getName() .. "\227\129\140\231\181\130\231\130\185\227\129\171\229\136\176\231\157\128\227\129\151\227\129\190\227\129\151\227\129\159")
end
function StartShipWorkInvokeTask(A0_20)
  print(A0_20.ship:getName() .. "\227\129\140\231\167\187\229\139\149\227\130\146\233\150\139\229\167\139\227\129\151\227\129\190\227\129\151\227\129\159")
  return invokeTask(function()
    MoveShipWork(A0_20)
    StopEndPointShipWork(A0_20)
  end)
end
function LoadPlayerCommonMotionTable()
  while Player:getPuppet():isLoading() do
    wait()
  end
  Fn_loadPlayerMotion(_player_common_motion_table)
  while Player:getPuppet():isLoading() do
    wait()
  end
end
function PcAppeal(A0_21, A1_22)
  Fn_coercionPoseNomal()
  waitSeconds(1)
  if A0_21 == nil or not A0_21 then
    A0_21 = _player_common_motion_table.glad_in_01
  end
  if A1_22 == nil or not A1_22 then
    A1_22 = _player_common_motion_table.glad_01
  end
  while invokeTask(function()
    waitSeconds(2)
  end):isRunning() do
    if Player:getAction() == Player.kAction_Idle then
      Sound:playSE("clear_jingle")
      Sound:playSE("m32_016")
      Fn_playMotionNpc("sm30_assistant_01", "handclap", false, {animBlendDuration = 0.5})
      Fn_playPlayerMotionWait(A0_21, 0, 0.5)
      Fn_playPlayerMotion(A1_22, -1)
      break
    end
    wait()
  end
  invokeTask(function()
    waitSeconds(2)
  end):abort()
  Fn_resetCoercionPose()
end
function PlaySeFailure()
  Sound:playSE(({"m32_015", "m32_017"})[RandI(1, 2)])
end
