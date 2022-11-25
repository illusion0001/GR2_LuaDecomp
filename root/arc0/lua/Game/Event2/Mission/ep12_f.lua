dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
_sdemo_end = false
_item_hdl = nil
_ltem_light_hdl = nil
_puppet_crow = nil
_brain_crow = nil
_polydemo = nil
function Initialize()
  Fn_sendEventComSb("statusChengeEp12", "demo")
  _item_hdl = Fn_sendEventComSb("requestHandle", "Node", "bg2_item_a")
  _pdemo = PDemo.create("ep12_a_c01", Fn_findAreaHandle("az4_a_02"), {camera = true, scene_param = false})
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint("locator2_Jupp_pc_pos")
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  Fn_sendRequestResetGachaTable()
  Fn_sendEventComSb("ciheavyarmorOff")
  invokeTask(function()
    local L0_0, L1_1
    L0_0 = _brain_crow
    L1_1 = L0_0
    L0_0 = L0_0.setIdling
    L0_0(L1_1, true)
    L0_0 = findGameObject2
    L1_1 = "Node"
    L0_0 = L0_0(L1_1, "locator2_Jupp_crow_pos")
    L1_1 = L0_0
    L0_0 = L0_0.getWorldTransform
    L1_1 = L0_0(L1_1)
    _brain_crow:warp(L0_0, L1_1, Ground)
  end)
  Fn_userCtrlAllOff()
  Player:setStay(true)
  Fn_blackout(0)
  Fn_coercionPoseNomal()
  Fn_getPlayer():setCollidable(false)
  Player:getPuppet():setVisible(false)
  Fn_setCatActive(false)
  _pdemo:play("blackout")
  Fn_missionStart()
  repeat
    wait()
  until _pdemo:isEnd()
  _pdemo:stop()
  wait(3)
  _pdemo:try_term()
  _pdemo = nil
  Fn_getPlayer():setCollidable(true)
  Player:getPuppet():setVisible(true)
  Fn_setCatActive(true)
  Fn_resetCoercionPose()
  GameDatabase:set(ggd.Savedata__PlayerAbility__Style__Jupiter, true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
