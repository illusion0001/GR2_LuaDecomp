import("EventData")
dofile("/Game/Event2/Common/HUDCommon.lua")
function main()
  print("test_dialog_02")
  _loadEventData("test_dialog")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function create_puppet(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5
  L3_3 = createGameObject2
  L4_4 = "Puppet"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setEnableDebugDraw
  L4_4(L5_5, true)
  L5_5 = L3_3
  L4_4 = L3_3.setName
  L4_4(L5_5, A0_0)
  L4_4 = loadFileAsset
  L5_5 = "evd"
  L4_4 = L4_4(L5_5, "CharDefs/npc/" .. A0_0)
  L5_5 = L4_4.wait
  L5_5(L4_4)
  L5_5 = L3_3.setDescription
  L5_5(L3_3, L4_4:getRoot())
  L5_5 = createGameObject2
  L5_5 = L5_5("ActorBrain")
  L5_5:setName(A0_0 .. "_brain")
  L5_5:try_init()
  L3_3:try_init()
  L5_5:waitForReady()
  L3_3:waitForReady()
  L3_3:setBrain(L5_5)
  L3_3:setWorldTransform(A1_1, A2_2)
  L3_3:setForceMove()
  L3_3:setVisible(true)
  return L3_3, L5_5
end
function _loadEventData(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = loadFileAsset
  L2_8 = "evb"
  L3_9 = "evx/"
  L3_9 = L3_9 .. A0_6
  L1_7 = L1_7(L2_8, L3_9)
  L2_8, L3_9 = nil, nil
  if L1_7 ~= nil then
    L1_7:wait()
    L2_8 = L1_7:getRoot()
    L3_9 = EventData:create(A0_6, nil, L2_8)
    L3_9:try_init()
    L3_9:waitForReady()
    L3_9:try_start()
  end
end
