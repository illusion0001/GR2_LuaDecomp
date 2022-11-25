dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_change_part = false
_puppet_crow = nil
_brain_crow = nil
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  Fn_vctrlOff("vctrl2_close_back")
  Fn_vctrlOff("vctrl2_open_next")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0(L1_1)
  L0_0(L1_1)
  if L0_0 == true then
    L3_3 = "ground"
    L0_0(L1_1, L2_2, L3_3)
  end
  repeat
    L0_0()
  until L0_0
  _puppet_crow = L0_0
  _brain_crow = L0_0
  L0_0(L1_1, L2_2)
  L0_0()
  for L3_3 = 1, 4 do
    Fn_sendEventComSb("requestWarpRubble", string.format("shutter_stopobj_%02d", L3_3), true)
    repeat
      wait()
    until Fn_sendEventComSb("isRubbleWarpEnd")
  end
  L0_0()
  L0_0()
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L3_3 = 1
  L0_0(L1_1, L2_2, L3_3, findGameObject2("Node", "locator2_back"):getWorldPos())
  L0_0(L1_1)
  L3_3 = 0
  L0_0(L1_1, L2_2, L3_3, Vector(0, 0, 0))
  L3_3 = "aisle_07_02"
  L0_0(L1_1, L2_2, L3_3, 2)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L3_3 = 1
  L0_0(L1_1, L2_2, L3_3, findGameObject2("Node", "locator2_open"):getWorldPos())
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0()
  L0_0()
  L0_0(L1_1)
  _navi_task = L0_0
  repeat
    L0_0()
  until L0_0
  L0_0()
  L0_0()
  L0_0()
  L0_0()
end
function pccubesensor2_change_part_OnEnter(A0_4, A1_5)
  Fn_pcSensorOff(A0_4)
  _change_part = true
end
function Finalize()
  if _navi_task ~= nil then
    _navi_task:abort()
  end
end
