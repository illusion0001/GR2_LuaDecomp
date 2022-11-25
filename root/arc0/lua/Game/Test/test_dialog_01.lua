import("EventData")
dofile("/Game/Event2/Common/HUDCommon.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = print
  L1_1 = "test_dialog_01"
  L0_0(L1_1)
  L0_0 = _loadEventData
  L1_1 = "test_dialog"
  L0_0(L1_1)
  L0_0 = {}
  L0_0.key_guide = "ui_keyguide_ac_01"
  L0_0.ad_main = "ui_acdialog_main_sm91"
  L0_0.ad_sub = "ui_acdialog_sub_04"
  L0_0.map_main = "ui_map_msinfo_main_sm91"
  L0_0.map_sub = "ui_map_msinfo_header_04"
  L1_1 = {}
  L1_1.key_guide = "ui_keyguide_ac_01"
  L1_1.ad_main = "ui_acdialog_main_ep90"
  L1_1.ad_sub = "ui_acdialog_sub_01"
  L1_1.map_main = "ui_map_msinfo_main_ep90"
  L1_1.map_sub = "ui_map_msinfo_header_01"
  L2_2 = findGameObject2
  L3_3 = "Node"
  L4_4 = "locator2_02"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = create_puppet
  L4_4 = "man01"
  L4_4 = L3_3(L4_4, L2_2:getWorldTransform())
  L2_2 = findGameObject2("Node", "locator2_03")
  L3_3, L4_4 = create_puppet("chi01", L2_2:getWorldTransform())
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function create_puppet(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10
  L3_8 = createGameObject2
  L4_9 = "Puppet"
  L3_8 = L3_8(L4_9)
  L5_10 = L3_8
  L4_9 = L3_8.setEnableDebugDraw
  L4_9(L5_10, true)
  L5_10 = L3_8
  L4_9 = L3_8.setName
  L4_9(L5_10, A0_5)
  L4_9 = loadFileAsset
  L5_10 = "evd"
  L4_9 = L4_9(L5_10, "CharDefs/npc/" .. A0_5)
  L5_10 = L4_9.wait
  L5_10(L4_9)
  L5_10 = L3_8.setDescription
  L5_10(L3_8, L4_9:getRoot())
  L5_10 = createGameObject2
  L5_10 = L5_10("ActorBrain")
  L5_10:setName(A0_5 .. "_brain")
  L5_10:try_init()
  L3_8:try_init()
  L5_10:waitForReady()
  L3_8:waitForReady()
  L3_8:setBrain(L5_10)
  L3_8:setWorldTransform(A1_6, A2_7)
  L3_8:setForceMove()
  L3_8:setVisible(true)
  return L3_8, L5_10
end
function _loadEventData(A0_11)
  local L1_12, L2_13, L3_14
  L1_12 = loadFileAsset
  L2_13 = "evb"
  L3_14 = "evx/"
  L3_14 = L3_14 .. A0_11
  L1_12 = L1_12(L2_13, L3_14)
  L2_13, L3_14 = nil, nil
  if L1_12 ~= nil then
    L1_12:wait()
    L2_13 = L1_12:getRoot()
    L3_14 = EventData:create(A0_11, nil, L2_13)
    L3_14:try_init()
    L3_14:waitForReady()
    L3_14:try_start()
  end
end
