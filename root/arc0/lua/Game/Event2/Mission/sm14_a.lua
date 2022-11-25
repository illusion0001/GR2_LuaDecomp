dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_puppet_crow = nil
_brain_crow = nil
function Initialize()
  Player:setStay(true, true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = waitSeconds
  L1_1 = 1
  L0_0(L1_1)
  L0_0 = ""
  L1_1 = {}
  L2_2 = 1
  while true do
    L6_6 = string
    L6_6 = L6_6.format
    L7_7 = "%02d"
    L6_6 = L6_6(L7_7, L2_2)
    if L3_3 ~= nil then
      L6_6 = 2
      if L4_4 == false then
        L6_6 = L3_3
        L1_1[L4_4] = L5_5
      end
    else
      break
    end
    L2_2 = L2_2 + 1
  end
  if L1_1 ~= nil then
    L3_3(L4_4)
    for L6_6, L7_7 in L3_3(L4_4) do
      L0_0 = L6_6
      break
    end
  end
  L6_6 = L3_3
  L7_7 = true
  L4_4(L5_5, L6_6, L7_7)
  L6_6 = "locator2_relay_01"
  L6_6 = "Node"
  L7_7 = "locator2_relay_02"
  L6_6 = L5_5
  L6_6 = findGameObject2
  L7_7 = "Node"
  L6_6 = L6_6(L7_7, "locator2_landing_01")
  L7_7 = L6_6
  L6_6 = L6_6.getWorldPos
  L6_6 = L6_6(L7_7)
  L7_7 = {
    {
      pos = L4_4,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L5_5,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L6_6,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L6_6,
      action = Supporter.MovePoint.Alight,
      vel = 10
    }
  }
  _brain_crow:setMovePoints(L7_7)
  _brain_crow:startMovePoint()
  while _brain_crow:isMovePointEnd() == false do
    wait()
  end
  Fn_userCtrlOn()
  Player:setStay(false)
  Fn_departure(event_name, "mine_po")
  Fn_exitSandbox()
end
function Finalize()
  local L0_8, L1_9
end
