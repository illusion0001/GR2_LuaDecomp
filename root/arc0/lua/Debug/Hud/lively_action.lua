import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
function test_lively_action()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "Debug Draw"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Display"
  L4_4 = "DebugDrawGroup"
  L5_5 = "Default"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "File Asset Status"
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4
  }
  L1_1 = {}
  L2_2 = Pad
  L2_2 = L2_2.kButton_RL
  L1_1.btn = L2_2
  L1_1.text = "ui_event_guide_01"
  L2_2 = {}
  L3_3 = Pad
  L3_3 = L3_3.kButton_RD
  L2_2.btn = L3_3
  L2_2.text = "ui_event_guide_01"
  L3_3 = {}
  L4_4 = Pad
  L4_4 = L4_4.kButton_RU
  L3_3.btn = L4_4
  L3_3.text = "ui_event_guide_01"
  L4_4 = {}
  L5_5 = Pad
  L5_5 = L5_5.kButton_RR
  L4_4.btn = L5_5
  L4_4.text = "ui_event_guide_01"
  L1_1 = {
    L2_2,
    L3_3,
    L4_4
  }
  L2_2 = {}
  L3_3 = Pad
  L3_3 = L3_3.kButton_RL
  L2_2.btn = L3_3
  L2_2.text = "ui_event_guide_01"
  L3_3 = {}
  L4_4 = Pad
  L4_4 = L4_4.kButton_RD
  L3_3.btn = L4_4
  L3_3.text = "ui_event_guide_01"
  L4_4 = {}
  L5_5 = Pad
  L5_5 = L5_5.kButton_RR
  L4_4.btn = L5_5
  L4_4.text = "ui_event_guide_01"
  L2_2 = {L3_3, L4_4}
  L3_3 = {}
  L4_4 = Pad
  L4_4 = L4_4.kButton_RL
  L3_3.btn = L4_4
  L3_3.text = "ui_event_guide_01"
  L4_4 = {}
  L5_5 = Pad
  L5_5 = L5_5.kButton_RD
  L4_4.btn = L5_5
  L4_4.text = "ui_event_guide_01"
  L3_3 = {L4_4}
  L4_4 = {}
  L5_5 = Pad
  L5_5 = L5_5.kButton_RL
  L4_4.btn = L5_5
  L4_4.text = "ui_event_guide_01"
  L4_4 = {
    L5_5,
    L6_6,
    L7_7,
    L3_3
  }
  L5_5 = L0_0
  L6_6 = L1_1
  L7_7 = L2_2
  L5_5 = 1
  while true do
    L6_6 = HUD
    L7_7 = L6_6
    L6_6 = L6_6.openLivelyAction
    L6_6(L7_7, L4_4[L5_5])
    L5_5 = L5_5 + 1
    L6_6 = #L4_4
    if L5_5 > L6_6 then
      L5_5 = 1
    end
    L6_6 = nil
    L7_7 = false
    while true do
      L6_6 = HUD:updateLivelyAction(L7_7)
      if L6_6 == HUD.kLivelyActionDecide then
        btn = HUD:getResultLivelyAction()
        if btn == Pad.kButton_RR then
          break
        end
        if btn == Pad.kButton_RL then
          break
        end
        if btn == Pad.kButton_RU then
          break
        end
        if btn == Pad.kButton_RD then
        end
        break
      else
      end
      if L6_6 ~= HUD.kLivelyActionOut then
        wait()
      end
    end
    wait(30)
  end
end
