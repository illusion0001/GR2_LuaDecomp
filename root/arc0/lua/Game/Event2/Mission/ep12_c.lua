dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_change_part = false
_puppet_crow = nil
_brain_crow = nil
function Initialize()
  Fn_sendEventComSb("statusChengeEp12", "demo")
  Fn_vctrlOff("vctrl2_entrance")
  Fn_vctrlOff("vctrl2_front")
end
function Ingame()
  local L0_0
  L0_0 = Fn_setCatWarp
  L0_0(false)
  L0_0 = Fn_setCatWarpCheckPoint
  L0_0("locator2_pc_start_pos")
  repeat
    L0_0 = wait
    L0_0()
    L0_0 = Fn_sendEventComSb
    L0_0 = L0_0("requestCrowSet")
  until L0_0
  L0_0 = Fn_sendEventComSb
  L0_0 = L0_0("requestCrowPuppet")
  _puppet_crow = L0_0
  L0_0 = Fn_sendEventComSb
  L0_0 = L0_0("requestCrowBrain")
  _brain_crow = L0_0
  L0_0 = _brain_crow
  L0_0 = L0_0.setIdling
  L0_0(L0_0, true)
  L0_0 = Fn_coercionPoseNomal
  L0_0()
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Sound
  L0_0 = L0_0.playSEHandle
  L0_0 = L0_0(L0_0, "ep12_road_open", 1, "", rubble_hdl)
  waitSeconds(1.5)
  Sound:stopSEHandle(L0_0)
  Fn_vctrlOn("vctrl2_entrance")
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_entrance"):getWorldPos())
  waitSeconds(1)
  Player:setLookAtIk(false, 0, Vector(0, 0, 0))
  Fn_captionViewWait("ep12_02001")
  Fn_vctrlOff("vctrl2_entrance")
  Camera:resetViewControl()
  waitSeconds(1)
  Fn_captionViewWait("ep12_02002")
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_front"):getWorldPos())
  Camera:lookTo(findGameObject2("Node", "locator2_front"):getWorldPos(), 2, 2)
  waitSeconds(1)
  Fn_resetCoercionPose()
  Fn_userCtrlOn()
  Player:setStay(false)
  _brain_crow:setIdling(false)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  Fn_sendEventComSb("aisleMissionView")
  repeat
    wait()
  until _change_part
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_change_part_OnEnter(A0_1, A1_2)
  Fn_pcSensorOff(A0_1)
  _change_part = true
end
function Finalize()
  local L0_3, L1_4
end
