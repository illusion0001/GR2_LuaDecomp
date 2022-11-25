import("Pad")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_navi_bridge = false
_barker_task = nil
_barker_once = {}
function Initialize()
  Fn_pcSensorOff("pccubesensor2_bridge")
end
function Ingame()
  Fn_missionStart()
  while true do
    if 0 == 0 then
      Fn_pcSensorOn("pccubesensor2_bridge")
      repeat
        wait()
      until Pad:getButton(Pad.kButton_LL)
      Fn_resetPcPos("warppoint2_a_01")
    else
    end
    if 1 ~= 1 or _navi_bridge ~= true then
      wait()
    end
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _barker_task ~= nil and _barker_task:isRunning() == true then
    _barker_task:abort()
  end
  _barker_task = nil
end
function pccubesensor2_bridge_OnEnter(A0_0)
  _navi_bridge = true
  A0_0:setActive(false)
end
function pccubesensor2_barker_01_OnEnter(A0_1)
  shop_barker(A0_1, findGameObject2("Node", "locator2_barker_01"), "ep90_00520", "ep90_00525", "mmc002a", "kit022b")
end
function pccubesensor2_barker_02_OnEnter(A0_2)
  shop_barker(A0_2, findGameObject2("Node", "locator2_barker_02"), "ep90_00530", "ep90_00535", "mmb002c", "kit040a")
end
function pccubesensor2_barker_03_OnEnter(A0_3)
  shop_barker(A0_3, findGameObject2("Node", "locator2_barker_03"), "ep90_00540", "ep90_00545", "mma002b", "kit020b")
end
function pccubesensor2_barker_04_OnEnter(A0_4)
  shop_barker(A0_4, findGameObject2("Node", "locator2_barker_04"), "ep90_00550", "ep90_00555", "mma002c", "kit032b")
end
function pccubesensor2_barker_05_OnEnter(A0_5)
  shop_barker(A0_5, findGameObject2("Node", "locator2_barker_05"), "ep90_00560", "ep90_00565", "mmb002b", "kit022c")
end
function pccubesensor2_barker_06_OnEnter(A0_6)
  shop_barker(A0_6, findGameObject2("Node", "locator2_barker_06"), "ep90_00561", "ep90_00566", "mmb002a", "kit042a")
end
function pccubesensor2_barker_07_OnEnter(A0_7)
  shop_barker(A0_7, findGameObject2("Node", "locator2_barker_07"), "ep90_00562", "ep90_00567", "mma002c", "kit033c")
end
function pccubesensor2_barker_08_OnEnter(A0_8)
  shop_barker(A0_8, findGameObject2("Node", "locator2_barker_08"), "ep90_00563", "ep90_00568", "mmc002b", "kit033a")
end
function pccubesensor2_barker_09_OnEnter(A0_9)
  shop_barker(A0_9, findGameObject2("Node", "locator2_barker_09"), "ep90_00564", "ep90_00569", "mmc002c", "kit038b")
end
function pccubesensor2_barker_OnLeave(A0_10)
  if _barker_task ~= nil and _barker_task:isRunning() == true then
    _barker_task:abort()
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end
  _barker_task = nil
  if _barker_once[A0_10:getName()] == true then
    A0_10:setActive(false)
  end
end
function shop_barker(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16)
  _barker_task = invokeTask(function()
    local L0_17
    while true do
      L0_17 = Fn_isInSightTarget
      L0_17 = L0_17(A1_12, 0.7)
      if L0_17 ~= true then
        L0_17 = wait
        L0_17()
      end
    end
    L0_17 = Sound
    L0_17 = L0_17.playSE
    L0_17(L0_17, A4_15, 0.5, "", A1_12)
    L0_17 = Fn_captionView
    L0_17(A2_13)
    L0_17 = waitSeconds
    L0_17(1)
    L0_17 = A1_12
    L0_17 = L0_17.getWorldPos
    L0_17 = L0_17(L0_17)
    while true do
      if false == false then
        if Player:getAction() == Player.kAction_Idle then
        end
      else
        if true == true then
          Camera:setViewControlTarget(L0_17)
          Player:setLookAtIk(true, 1, L0_17)
          if (0 < Pad:getStick(Pad.kStick_Camera) or 0 < Pad:getStick(Pad.kStick_Camera)) and 0 + 1 > 10 then
            Player:setLookAtIk(false, 1, Vector(0, 0, 0))
          end
        end
        if Fn_isInSightTarget(A1_12, 0.3) == true and Fn_isCaptionView() == false then
          Sound:playSE(A5_16, 0.8, "", Player.getPuppet())
          Fn_captionView(A3_14)
          _barker_once[A0_11:getName()] = true
          break
        end
      end
      wait()
    end
    waitSeconds(1)
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end)
end
